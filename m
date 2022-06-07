Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD9E541050
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 21:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343491.568831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyemw-00020k-2U; Tue, 07 Jun 2022 19:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343491.568831; Tue, 07 Jun 2022 19:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyemv-0001yZ-W4; Tue, 07 Jun 2022 19:22:49 +0000
Received: by outflank-mailman (input) for mailman id 343491;
 Tue, 07 Jun 2022 19:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+ro=WO=proton.me=alex.nlnnfn@srs-se1.protection.inumbo.net>)
 id 1nyemt-0001yP-0m
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 19:22:48 +0000
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3557de3f-e697-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 21:22:45 +0200 (CEST)
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
X-Inumbo-ID: 3557de3f-e697-11ec-b605-df0040e90b76
Date: Tue, 07 Jun 2022 19:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail3; t=1654629764; x=1654888964;
	bh=n/ltimDOnvv4ixV3kd3ax/zvXL0LLP0GtcLhtcAZT20=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=a2u2qlNHmVoRS1Ja0eTffzMU8Pb5cBIddPheZoRNgxR9qh/VB3y6iTrZom5g1J9Wp
	 JmTTngqK7jz9cc0g4axZY9Jtsf4I3JYfi+wahdam6fvK6u0SBfcmzovUhl8a6lVD07
	 mxYpslGy2j1rqgwJqjQ1x1Px1jJw82h5mwfLKXnk5CgUrbotq+qSTTg3Gfrob4yUN6
	 9AVbXl0e1r/px0mg2T+6QXd9ZJB0aw6FSo+u2aslHucKV16KVQRAAb/oxXaar3JJGB
	 ll6x151LxABxHHVaMmf8EpHWmAwOz1rsZvuJ2aeiEqraby4tGZQiF6jIvvsCaNkfCF
	 XBWX6YCqqUh1A==
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
From: Alex Nln <alex.nlnnfn@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Alex Nln <alex.nlnnfn@proton.me>
Subject: Re: memory overcomittment with sr-iov device assighment
Message-ID: <RLsJJNdXwhH2qzKW2TCaLRSv8JcF5heYpDGfzMxwwrkzQvi0cOZ2YyiwcI0K_UkgiH7fFFCNsFScpqH-oFA00BnyRIcdWKKbuCsal_9aFhE=@proton.me>
In-Reply-To: <eb7a2869-d9f8-7a9f-3884-60d1a61e36f4@citrix.com>
References: <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me> <eb7a2869-d9f8-7a9f-3884-60d1a61e36f4@citrix.com>
Feedback-ID: 49537399:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


------- Original Message -------
On Tuesday, June 7th, 2022 at 3:04 AM, Andrew Cooper <Andrew.Cooper3@citrix=
.com> wrote:
> But IOMMU violations are not restartable. We can't just take an IOMMU
> fault, and shuffle the guests memory, because the PCIe protocol has
> timeouts. These aren't generally long enough to even send an interrupt
> to request software help, let alone page one part out and another part in=
.
>
> For an IOMMU mapping to exists, it must point at real RAM, because any
> DMA targetting it cannot be paused and delayed for later.
>

Thanks for the information!

Speaking about IOMMU. Can Xen emulate virtual IOMMU? Just thinking out loud=
.
If Xen exposes a virtual IOMMU to a guest VM, wouldn't it be possible
for the hypervisor to pin VM's pages that are mapped (dynamically)
by the guest virtual IOMMU? But I guess it will eliminate the performance
benefits of direct device assignment.


