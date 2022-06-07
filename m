Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFF53F52C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 06:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342780.567869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyQyS-0004nS-1v; Tue, 07 Jun 2022 04:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342780.567869; Tue, 07 Jun 2022 04:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyQyR-0004l2-Ul; Tue, 07 Jun 2022 04:37:47 +0000
Received: by outflank-mailman (input) for mailman id 342780;
 Tue, 07 Jun 2022 04:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+ro=WO=proton.me=alex.nlnnfn@srs-se1.protection.inumbo.net>)
 id 1nyQNu-0008C0-Oa
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 04:00:03 +0000
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d221d3f-e616-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 06:00:01 +0200 (CEST)
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
X-Inumbo-ID: 4d221d3f-e616-11ec-bd2c-47488cf2e6aa
Date: Tue, 07 Jun 2022 03:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail3; t=1654574399; x=1654833599;
	bh=jVMnhGK6XgxrgzWoGQWmzfBU3spCn/kuI/yEL6d/JDM=;
	h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
	 Date:Subject:Reply-To:Feedback-ID:Message-ID;
	b=sy3iRNy705BiKoSPh2yewNGZx/C+9O39x6REgazaT924L6iqPFwvFjr/JmMgoyjxs
	 eAcW6CxkcWPrs1mEZ6LuIO7Vs8IK5lm8KEArf7qGFmlwagcGRabQwrmpQ1TmGaHWPG
	 2BmmsCqedN/qUvCZ3wAwpTqeDsS9VNv/XO5mhk0vCS4T6rngkUk03VCZ0FKeyt6ynT
	 XlxE9z+D2oo8sFYbeXSy2roTyboXr00VTZxH2o75Ph+nR5dsKVstzoYD0DfNWYN0Qa
	 K3vCN6nd6GQIwdSNfrFm+podgxeEjCCBmaXGqVvcxX4ZWaOU7r6tK0c7+5nFV0qI+h
	 bOBLxKXdz51EA==
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: alex.nlnnfn@proton.me
Reply-To: alex.nlnnfn@proton.me
Subject: memory overcomittment with sr-iov device assighment
Message-ID: <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me>
Feedback-ID: 49537399:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello list,

I looked into Xen documentation and also Xen wiki and I could't find a defi=
nitive answer if Xen supports memory over-commitment when VMs use SR-IOV de=
vice assignment (passthrough). Memory over-commitment I mean giving VMs mor=
e RAM than is available in the host.

I know that ESX doesn't support it, and also QEMU/KVM pins all RAM when a d=
evice is directly assigned to a VM (VFIO_IOMMU_MAP_DMA ioctl). I have two q=
uestions:

1. Does Xen supports memory over commitment when all VMs are using direct d=
evice assignment e.g., SR-IOV?
2. Would you please point me to the code that does the pinning?

Thanks,
Alex




