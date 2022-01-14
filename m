Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8348EBAC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 15:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257647.442859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Na8-0005Np-U5; Fri, 14 Jan 2022 14:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257647.442859; Fri, 14 Jan 2022 14:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Na8-0005Lz-RB; Fri, 14 Jan 2022 14:29:32 +0000
Received: by outflank-mailman (input) for mailman id 257647;
 Fri, 14 Jan 2022 14:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdK=R6=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n8Na6-0005Lr-Rf
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 14:29:30 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60eb2d1c-7546-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 15:29:29 +0100 (CET)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id E940918000AE
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jan 2022 09:29:26 -0500 (EST)
Received: from mail-yb1-f170.google.com (unknown [10.20.151.141])
 by mta-09.privateemail.com (Postfix) with ESMTPA id C406F18000A8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jan 2022 09:29:26 -0500 (EST)
Received: by mail-yb1-f170.google.com with SMTP id n68so24336861ybg.6
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jan 2022 06:29:26 -0800 (PST)
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
X-Inumbo-ID: 60eb2d1c-7546-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1642170567;
	bh=7ihG/QOavqxE5sfwgsZmX0Lipnqkf4W3tRvPVFlx4xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yo3rfEKxSDCiqK5iUyercu6SQ40JCmMCqDhL1g7NSxDy4YcJr11jJEh9OJ2MoDbrg
	 3QzPnyg4fMsqu8X6xXO/YeIPa9cnWF3EVQg1yTnB6ZLI4ah7R34so+pPZy6hye8EuT
	 eq7LlARlp17MAjEJh/Ktmn0GB2foZ7PPoLJImuMHkYzFgb2umLSM95NDC+Ck8rKpaJ
	 vGoM5dIoFiROJWNG0R6NjRETtLgElo7xqOStgbr/pm4l7P/WBCOS8az7tmHWW1zBOw
	 POTIgOk8vfjkeD4JF25S32ImIAEjdzQAnK7o9OiWp/7wsLRY0K2lHg93GtA6UMIZ4l
	 3s173n4hDarQw==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1642170566;
	bh=7ihG/QOavqxE5sfwgsZmX0Lipnqkf4W3tRvPVFlx4xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D4j2bVUqdxwPAYTUZTuCm2fLrlreINCQqN4YVaqiwvT+ibR88tRyK7E17f9hjLRNw
	 vXqqjBdpV/lQ136eSH68tjgoLq/u1jcYIvt3qif5qkACP4bRk1F2YfbCjDCf1zTKN6
	 75QW1fwqpEznZzSLq/H2CS2TJ+Q4OpjC1lDPd9/L4Kitgu1kYLRmtDn/aQ8vSVLG85
	 /VSlkNtimpug0VooVn0JM6c1/z1nLnBDhl1lZsaxh4D9M5DWAac/SzakxVHlciKb8t
	 9Cc1mjrgZ0eSQ1KIg/2QdGRyqnSrh8Yrw+3mC7aE7s87Z3LSRXZDG2+7vNhvK1mlAF
	 z3wLfQ0cVmgYQ==
X-Gm-Message-State: AOAM531MZRNiOAe0+RzsCt3qK88T2STb6AU1I5hg71pw23YQqqAK7KPP
	/5t3Qs9UqUuWzCLGwp3g0mFL1V2C2rj63v7Uvog=
X-Google-Smtp-Source: ABdhPJzfgD5X98Z+4pHRsBiYw1ODepV1Wv5dCXOHsBhvDHZs0zoI020SdFLjZtp9MCImdUJuRt1diZDWnpex2t3Y3xc=
X-Received: by 2002:a05:6902:1003:: with SMTP id w3mr14990015ybt.441.1642170566105;
 Fri, 14 Jan 2022 06:29:26 -0800 (PST)
MIME-Version: 1.0
References: <ed34964c-c612-497f-0350-b9202c0ba057@suse.com>
In-Reply-To: <ed34964c-c612-497f-0350-b9202c0ba057@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 14 Jan 2022 09:28:50 -0500
X-Gmail-Original-Message-ID: <CABfawhk8Qtran35P=K3GSVcwmvkY1xGdXCofCwmtnHhN2Beq=g@mail.gmail.com>
Message-ID: <CABfawhk8Qtran35P=K3GSVcwmvkY1xGdXCofCwmtnHhN2Beq=g@mail.gmail.com>
Subject: Re: [PATCH v2] x86/HVM: convert remaining hvm_funcs hook invocations
 to alt-call
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jan 13, 2022 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> The aim being to have as few indirect calls as possible (see [1]),
> whereas during initial conversion performance was the main aspect and
> hence rarely used hooks didn't get converted. Apparently one use of
> get_interrupt_shadow() was missed at the time.
>
> While doing this, drop NULL checks ahead of CPU management and .nhvm_*()
> calls when the hook is always present. Also convert the
> .nhvm_vcpu_reset() call to alternative_vcall(), as the return value is
> unused and the caller has currently no way of propagating it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

