Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E048440F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 16:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253300.434393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4lJX-0002ly-88; Tue, 04 Jan 2022 15:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253300.434393; Tue, 04 Jan 2022 15:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4lJX-0002iy-52; Tue, 04 Jan 2022 15:01:27 +0000
Received: by outflank-mailman (input) for mailman id 253300;
 Tue, 04 Jan 2022 15:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9eR=RU=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n4lJV-0002is-CO
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 15:01:25 +0000
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com
 [198.54.122.111]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e31a5be-6d6f-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 16:01:24 +0100 (CET)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id D2A3518000A3
 for <xen-devel@lists.xenproject.org>; Tue,  4 Jan 2022 10:01:21 -0500 (EST)
Received: from mail-yb1-f172.google.com (unknown [10.20.151.144])
 by mta-15.privateemail.com (Postfix) with ESMTPA id AC88218000A0
 for <xen-devel@lists.xenproject.org>; Tue,  4 Jan 2022 10:01:21 -0500 (EST)
Received: by mail-yb1-f172.google.com with SMTP id e202so66112380ybf.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jan 2022 07:01:21 -0800 (PST)
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
X-Inumbo-ID: 2e31a5be-6d6f-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641308481;
	bh=oc+dNegjHOzXNIBBitdBFqVjgB2jDBF5K8yh7SppOkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UH/BAoEKKN1Kd18etBpw5mSUyIkzpSLuJAOaQPNLfIiTwcz6OrR404QNi4M2XQBu+
	 4rONHU3RHjQIyBlkrsPwkj5kO4uA67IrXMz+Xd51ChgJg2CRsqcKQVRAJCRQ1wRcRP
	 ub7vWbPjpW+24LqIJ7KERgjFaXB0iE1R2MiFvToMBQn6Mh92RcDxWiUvxR0R2MgRiQ
	 zDPHdzyKdi6hHm/4UEwmDNbsZMT5PeWp9W6tL2kzo145iUaQM1LyFW1rSNeXQayHqf
	 uJplPeAYevWoVYP6+DLLnIUANr+2a76rCX21pCYB+CeC5PrSq+avcmR3i9t+vWtSHY
	 XBmKwotJ+/RvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641308481;
	bh=oc+dNegjHOzXNIBBitdBFqVjgB2jDBF5K8yh7SppOkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UH/BAoEKKN1Kd18etBpw5mSUyIkzpSLuJAOaQPNLfIiTwcz6OrR404QNi4M2XQBu+
	 4rONHU3RHjQIyBlkrsPwkj5kO4uA67IrXMz+Xd51ChgJg2CRsqcKQVRAJCRQ1wRcRP
	 ub7vWbPjpW+24LqIJ7KERgjFaXB0iE1R2MiFvToMBQn6Mh92RcDxWiUvxR0R2MgRiQ
	 zDPHdzyKdi6hHm/4UEwmDNbsZMT5PeWp9W6tL2kzo145iUaQM1LyFW1rSNeXQayHqf
	 uJplPeAYevWoVYP6+DLLnIUANr+2a76rCX21pCYB+CeC5PrSq+avcmR3i9t+vWtSHY
	 XBmKwotJ+/RvQ==
X-Gm-Message-State: AOAM53314eEnbMMlywCmwrBUEtrzQdCeBUJuJrus4xXhYQEWXkY/yoqF
	YtHBNnVmsnr40hiWfbYvmzcJCMBkhOP12hS+zp0=
X-Google-Smtp-Source: ABdhPJxMIIP0Z9asmOBjjNcH0pKc2fzcPfVFuru8RojlN5sYmtNNsBa6v9chkcd0zvi3VkwEW4GeY3qG8uz/7/KqdoI=
X-Received: by 2002:a05:6902:1003:: with SMTP id w3mr40004894ybt.441.1641308480926;
 Tue, 04 Jan 2022 07:01:20 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com> <2e5c460b-9123-bfc3-d5c8-0922f7b2e667@suse.com>
In-Reply-To: <2e5c460b-9123-bfc3-d5c8-0922f7b2e667@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 4 Jan 2022 10:00:45 -0500
X-Gmail-Original-Message-ID: <CABfawhmo8Rrhu985cr2z2hEXrikD6c1CQSNvv+PbmFy+mUS_XQ@mail.gmail.com>
Message-ID: <CABfawhmo8Rrhu985cr2z2hEXrikD6c1CQSNvv+PbmFy+mUS_XQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] x86/altp2m: p2m_altp2m_get_or_propagate() should
 honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jan 4, 2022 at 4:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Prior to XSA-304 the only caller merely happened to not use any further
> the order value that it passes into the function. Already then this was
> a latent issue: The function really should, in the "get" case, hand back
> the order the underlying mapping actually uses (or actually the smaller
> of the two), such that (going forward) there wouldn't be any action on
> unrelated mappings (in particular ones which did already diverge from
> the host P2M).
>
> Similarly in the "propagate" case only the smaller of the two orders
> should actually get used for creating the new entry, again to avoid
> altering mappings which did already diverge from the host P2M.

I don't really understand the reason why you want to return the
page_order from the altp2m here. The only check that uses the
page_order following is the super-page shattering check for XSA-304
but that's done on the hostp2m. So you would want to know what the
page_order is on the hosp2m, not the altp2m, no?

In either case, in all the setups we use altp2m we never use any
superpages, the recommendation is to boot with hap_1gb=0 hap_2mb=0. I
never trusted the complexity of superpage shattering and its
implementation in Xen as it is very hard to follow.

Tamas

