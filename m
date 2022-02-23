Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CC4C1AAB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 19:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277695.474488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMw7O-0003DD-7E; Wed, 23 Feb 2022 18:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277695.474488; Wed, 23 Feb 2022 18:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMw7O-0003Ai-3K; Wed, 23 Feb 2022 18:12:02 +0000
Received: by outflank-mailman (input) for mailman id 277695;
 Wed, 23 Feb 2022 18:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4bB=TG=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nMw7M-0003Ac-Im
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 18:12:00 +0000
Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com
 [198.54.127.107]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167cfa10-94d4-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 19:11:58 +0100 (CET)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id A937D18000AA
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 13:11:56 -0500 (EST)
Received: from mail-yb1-f175.google.com (unknown [10.20.151.184])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 8414318000A6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 13:11:56 -0500 (EST)
Received: by mail-yb1-f175.google.com with SMTP id w63so28447924ybe.10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 10:11:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 167cfa10-94d4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1645639916;
	bh=qwrc5zDHxf+s1Vl0L0xZOhffYHDVP4usVAVJQRXwQhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F5inXcfzTpdLSd26fmpWAL/mdsoHQhMxcOV9O0ExYAIkHRQS6g3quCPzV0QjjI9qw
	 1swXfdLPnbDXkd3nsb8Y3oqL1t4W74uMx1E0l0NnOr9pB22wTDrYVQoLA0MIpA2yhO
	 I/gLwb4XbXljiA6hIjBgnlkk9qsnXfkrtwHinA/ThUdsK4kfYqnkQIB4btPyGAEq0I
	 bqJ2P8cd0oWrOn/4cYiuAD14Sksqqd4ShWR8Eolp6Yh7HFUOmWSk+PQsjOldeWoOaW
	 HU+gCsOkOS3nn8a2kguwEu+zjsKD4XWaBlqpB4RV0dkxrieFCBl08sQfNojsmbnrw/
	 U32stVnl/K8fw==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1645639916;
	bh=qwrc5zDHxf+s1Vl0L0xZOhffYHDVP4usVAVJQRXwQhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F5inXcfzTpdLSd26fmpWAL/mdsoHQhMxcOV9O0ExYAIkHRQS6g3quCPzV0QjjI9qw
	 1swXfdLPnbDXkd3nsb8Y3oqL1t4W74uMx1E0l0NnOr9pB22wTDrYVQoLA0MIpA2yhO
	 I/gLwb4XbXljiA6hIjBgnlkk9qsnXfkrtwHinA/ThUdsK4kfYqnkQIB4btPyGAEq0I
	 bqJ2P8cd0oWrOn/4cYiuAD14Sksqqd4ShWR8Eolp6Yh7HFUOmWSk+PQsjOldeWoOaW
	 HU+gCsOkOS3nn8a2kguwEu+zjsKD4XWaBlqpB4RV0dkxrieFCBl08sQfNojsmbnrw/
	 U32stVnl/K8fw==
X-Gm-Message-State: AOAM531gF1dawS3hVGSmQoaZoxw9yd4PNPUT8m7iOeWDU4yGxXMJTM0a
	/oC98oq3RuWclkKmOk6C1AUbkQM/4nI8XVC4KLQ=
X-Google-Smtp-Source: ABdhPJz0PM95C/6lfPEiHSR+3lrZbyDp6JNQG7+8I3ZlQiT57jGelVC5lAksqC2Cz2ALTp0gZELGObjQU2MzWTY1hng=
X-Received: by 2002:a25:ec01:0:b0:61d:917f:66f0 with SMTP id
 j1-20020a25ec01000000b0061d917f66f0mr893783ybh.22.1645639915740; Wed, 23 Feb
 2022 10:11:55 -0800 (PST)
MIME-Version: 1.0
References: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com> <5a8c1f9e-e91a-a7f5-8c8a-025ab6a39908@suse.com>
In-Reply-To: <5a8c1f9e-e91a-a7f5-8c8a-025ab6a39908@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 23 Feb 2022 13:11:19 -0500
X-Gmail-Original-Message-ID: <CABfawh=Eh==cadaQX+n9BzuK5RE=sud7sjLtbAzpp5ouMYGCdQ@mail.gmail.com>
Message-ID: <CABfawh=Eh==cadaQX+n9BzuK5RE=sud7sjLtbAzpp5ouMYGCdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant
 and shared cases better
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

> @@ -607,6 +607,7 @@ struct page_info *p2m_get_page_from_gfn(
>
>          /* Error path: not a suitable GFN at all */
>          if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
> +             (!p2m_is_shared(*t) || !(q & P2M_UNSHARE)) &&
>               !mem_sharing_is_fork(p2m->domain) )
>              return NULL;
>      }

I don't follow what this is fixing. A shared entry would return true
to p2m_is_ram() - p2m_ram_shared is listed under P2M_RAM_TYPES - so
the rest of the if statement would never be checked. So if we get past
that check we know we definitely don't have a shared entry, ie
p2m_is_shared must be false ie the check for P2M_UNSHARE is dead code.
Am I missing something?

Tamas

Tamas

