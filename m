Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD057B9D41
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 15:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613005.953247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoOCu-0002sa-FS; Thu, 05 Oct 2023 13:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613005.953247; Thu, 05 Oct 2023 13:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoOCu-0002qT-Cs; Thu, 05 Oct 2023 13:16:00 +0000
Received: by outflank-mailman (input) for mailman id 613005;
 Thu, 05 Oct 2023 13:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p51=FT=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qoOCt-0002cO-LH
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 13:15:59 +0000
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 521d6232-6381-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 15:15:58 +0200 (CEST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170]) by mx.zohomail.com
 with SMTPS id 1696511746699396.4257657955326;
 Thu, 5 Oct 2023 06:15:46 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d894b8b9b7cso885052276.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 06:15:46 -0700 (PDT)
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
X-Inumbo-ID: 521d6232-6381-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1696511748; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=An7ttbDzNmkY5y1soA0g8CsYiYjvOq+cFvrFMlsuHXmMl+z0ryKFZWBQcSa6fJEh5QwB59WFuBINyO+Btz2H05y/kBTTDyh0kMXkgbwpcO6bJsl4LfBdvkIyKoxeiflKcHZeOKBitf/Oq/CSlxvRRCjEWd9/CvKZZ7HMSQDN3p8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696511748; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p1clsHo+k2GMkpiZif3stSb3kd9ZvVYXWBel3VMSWWo=; 
	b=GkOxLjrl5npXsWQ7JQxudsHgwOdn88V3s0yRHU52LZiXaywGDyY9rxVD1hWFxdFHmytOeD+DPr+7yVJhXH8tK5IUCeE7kraEw8JBNqSBJWWrRh/r4Hd7S7q/ybaP9pmlEcktaMLzEBXEYkw2tAGuASeV8uJnQ4UUZv9IVSJJpqA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696511748;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=p1clsHo+k2GMkpiZif3stSb3kd9ZvVYXWBel3VMSWWo=;
	b=Bcmu1ysq8HWvioQYoA2h1A4f0fEszPqLUYyoIH0b+s6URvREyXqoKD1hr9BnqsiD
	WatmPyOnxKIBMGJntJMdnfXIJJ6JFf9aHDu7l/EAZXW2ZnvSHJExrYyuljgLvd+imyX
	cuEuu5O2sq8q499w++AYG5mSa4IoYXt3fqfzjTRY=
X-Gm-Message-State: AOJu0YyqODvtvbQ87ogEQx/r6kAGiNqtA0dN7R0aXsKO1D/fzmUNwSbt
	RRVLPEcgeodjPPRKdQg3JHx0rsGMMTgSRJWrm5A=
X-Google-Smtp-Source: AGHT+IF9aZIWfSsM1ECaGkR88iiVc4D96mWmNcvQDhcPki19s2CjVnrjHvH2fgqXpEd/9/5t8l6czkl1RBSA35JoW90=
X-Received: by 2002:a25:ac8e:0:b0:d4a:499d:a881 with SMTP id
 x14-20020a25ac8e000000b00d4a499da881mr807036ybi.9.1696511745797; Thu, 05 Oct
 2023 06:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151127.71020-1-roger.pau@citrix.com> <20231002151127.71020-2-roger.pau@citrix.com>
In-Reply-To: <20231002151127.71020-2-roger.pau@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 5 Oct 2023 09:15:09 -0400
X-Gmail-Original-Message-ID: <CABfawh=rvmm1wpBKU-HWumpjPcndP0ZDztop-ah=50U2Z2Ye_A@mail.gmail.com>
Message-ID: <CABfawh=rvmm1wpBKU-HWumpjPcndP0ZDztop-ah=50U2Z2Ye_A@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate
 vcpu_info page
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2023 at 11:12=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Instead let map_vcpu_info() and it's call to get_page_from_gfn()
> populate the page in the child as needed.  Also remove the bogus
> copy_domain_page(): should be placed before the call to map_vcpu_info(),
> as the later can update the contents of the vcpu_info page.
>
> Note that this eliminates a bug in copy_vcpu_settings(): The function did
> allocate a new page regardless of the GFN already having a mapping, thus =
in
> particular breaking the case of two vCPU-s having their info areas on the=
 same
> page.
>
> Fixes: 41548c5472a3 ('mem_sharing: VM forking')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Re-sending due to mailserver issues:

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

