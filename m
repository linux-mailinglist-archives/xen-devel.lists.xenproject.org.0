Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F97B26D2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 22:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610036.949258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlxwg-0004Sv-7d; Thu, 28 Sep 2023 20:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610036.949258; Thu, 28 Sep 2023 20:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlxwg-0004Qs-4W; Thu, 28 Sep 2023 20:49:14 +0000
Received: by outflank-mailman (input) for mailman id 610036;
 Thu, 28 Sep 2023 20:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlxwe-0004Qk-Qh
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 20:49:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e12c7e-5e40-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 22:49:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EEEACCE2244;
 Thu, 28 Sep 2023 20:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE258C433C8;
 Thu, 28 Sep 2023 20:49:01 +0000 (UTC)
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
X-Inumbo-ID: 77e12c7e-5e40-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695934143;
	bh=itpYXVAd5BUCJelW8AaQOXk52F0jocdxEiENQvTN0w0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t4Zb4SSMbANVqnhmGcg75fkDicr7w4sPaP8zOmr8Ieruj0hSRUA/jbOrfUPYL0Fr2
	 vnWUjZ4plnr3Q2657HU512l77m0mD/tWaYuBOnR8sWIOpXSgL5/hQH9MAse7S7HHYp
	 k8megfZ6ryMpRFd+86wP4REaVCkfyNxDFsJSUu2S/nXwY+MhpF8/eF5cxKhQHTssO5
	 W7yL8z0b2n9Mpd1e60mP79TnmNikhcRTTSd77EcT062qKVnNz309taRiHPM4bzZcKK
	 V652F+6u5EYQa+ZRRsgDf8xjxo48DTlGPwqsT0mD7srhsk0a0nI9wncMS6leTK+fI3
	 CdmJyxjj0osCA==
Date: Thu, 28 Sep 2023 13:48:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    wl@xen.org, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
In-Reply-To: <ZRVMo6Uf7occc0Zs@MacBookPdeRoger>
Message-ID: <alpine.DEB.2.22.394.2309281346160.1996340@ubuntu-linux-20-04-desktop>
References: <20230927232004.1981595-1-sstabellini@kernel.org> <ZRU6A2wDSVEEHGbK@MacBookPdeRoger> <e1cc81b4-d990-b995-a24a-ba80c1e970ba@suse.com> <ZRVMo6Uf7occc0Zs@MacBookPdeRoger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-34514524-1695934015=:1996340"
Content-ID: <alpine.DEB.2.22.394.2309281347070.1996340@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-34514524-1695934015=:1996340
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309281347071.1996340@ubuntu-linux-20-04-desktop>

On Thu, 28 Sep 2023, Roger Pau Monné wrote:
> On Thu, Sep 28, 2023 at 11:32:22AM +0200, Jan Beulich wrote:
> > On 28.09.2023 10:32, Roger Pau Monné wrote:
> > > On Wed, Sep 27, 2023 at 04:20:04PM -0700, Stefano Stabellini wrote:
> > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > >>
> > >> The feature is not commonly used, and we don't have hardware to test it,
> > >> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> > >> members. We could use QEMU to test it, but even that it is known not to
> > >> work.
> > > 
> > > I think this last sentence is ambiguous.  QEMU ACPI CPU hotplug
> > > implementation does work AFAIK, it's Xen implementation of ACPI
> > > hotplug that explodes (or so I've been told).  I would drop or reword
> > > the "but even that it is known not to work." part of the sentence.
> > 
> > Maybe simply add "... on our end"?
> 
> WFM.

Just to be clear we are going for:

"The feature is not commonly used, and we don't have hardware to test it,
not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
members. We could use QEMU to test it, but even that it is known not to
work on our end."

Can the change be done on commit?
--8323329-34514524-1695934015=:1996340--

