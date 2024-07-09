Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11E92B239
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 10:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755962.1164505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6Kl-00021q-4U; Tue, 09 Jul 2024 08:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755962.1164505; Tue, 09 Jul 2024 08:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6Kl-0001zl-1c; Tue, 09 Jul 2024 08:36:23 +0000
Received: by outflank-mailman (input) for mailman id 755962;
 Tue, 09 Jul 2024 08:36:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exg6=OJ=bounce.vates.tech=bounce-md_30504962.668cf682.v1-efc95fc123c847588675204f52cb1845@srs-se1.protection.inumbo.net>)
 id 1sR6Kj-0001zf-SJ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 08:36:22 +0000
Received: from mail179-23.suw41.mandrillapp.com
 (mail179-23.suw41.mandrillapp.com [198.2.179.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 506da8bb-3dce-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 10:36:20 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-23.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4WJDq646KMz35hTMd
 for <xen-devel@lists.xenproject.org>; Tue,  9 Jul 2024 08:36:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 efc95fc123c847588675204f52cb1845; Tue, 09 Jul 2024 08:36:18 +0000
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
X-Inumbo-ID: 506da8bb-3dce-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720514178; x=1720774678;
	bh=dD2BClKsX2uFbw51F+iByf7OLpZP6JAVTxSzEZM3AvE=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Ybv7Qii+ufql9xXv41h9Dtof6ajIto3izjhsbKGC+V3KahuXUE+OQLultgi/SF0ir
	 zmbu0Cdqtsgt0MRO+/ZFvf4BW/umXIh9J756OJNDCBMzyZZPy9X6WgrXERpeAn4AqA
	 CBgTCg64uu0LnOX30+92+ijfgKRgEoH66I2ZAFGF9HYVsuW3j/aNjBl+EMrTUzdfTM
	 tLw0Mr2jZjUXdQVPSUPoq2LkupBPBC/LtUQWU6sJcFn9OuGCS7KaLfgPw56EniaSks
	 Nmxf9g6X0l8dsBzHNBL67QBu/wLOVetlIKqWqybTpukICS2eXvqAQK+DxquOVYS5v9
	 6OL+yXKH8hM5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720514178; x=1720774678; i=andrei.semenov@vates.tech;
	bh=dD2BClKsX2uFbw51F+iByf7OLpZP6JAVTxSzEZM3AvE=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=imIKrclR5DCRFrosb6dt0jbh2W7d/x5yvrdKJdTUvZ9w2N2DsAqTAT10WezGibyTz
	 5tfH0Le+lIOka+MSYvyxlN9ENw2cUX78ToGw5XIO+8FtxMhSWM400MkcT6svb4FaZn
	 383+FW/r6lU8NPscRaVK6sQxX5PnC6tPQQNtBE9kYGP4uNcevGlsiBUljnRrsaaaUP
	 igAHRUzNSSmhi/gm07MWDQYuc6S/Jwqmpw0Hkw+FnIhEcQWsGjlDw/xOTI3dZOjEqK
	 8aHutT+hHGQkWMac4eYk4e9Km3DbHbLFjk2uE+LfSvpqVyuhU2T2I0kBrtvXechm9g
	 Yn36fPcUqhfEw==
From: Andrei Semenov <andrei.semenov@vates.tech>
Subject: =?utf-8?Q?AMD=20EPYC=20virtual=20network=20performances?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720514177558
Message-Id: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, jgross@suse.com, Andrei Semenov <andrei.semenov@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.efc95fc123c847588675204f52cb1845?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240709:md
Date: Tue, 09 Jul 2024 08:36:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

As been reported by David Morel (mail 4 Jan 2024), our customers 
experience a
very poor virtual network performances in HVM guests on AMD EPYC platforms.

After some investigations we notices a huge performances drop (perfs 
divided by
factor of 5) starting from 5.10.88 Linux kernel version on the AMD EPYC
platforms. The patch introduced in this kernel version that allows to 
pinpoint
the buggy behavior is :

 =C2=A0=E2=80=9Cxen/netfront: harden netfront against event channel storms=
=E2=80=9D
d31b3379179d64724d3bbfa87bd4ada94e3237de

The patch basically binds the network frontend to the `xen_lateeoi_chip`
irq_chip (insead of `xen_dynamic_chip`) which allows to its clients to 
inform
the chip if spurious interrupts are detected and so the delay in interrupt
treatment is introduced by the chip.

We tried to measure how much spurious interrupts (no work to do by the 
driver)
are raised. We used `iperf2` to bench the network bandwidth on the AMD 
EPYC 7262
8-core).

Dom0 > iperf -s

DomU> iperf -c $DOM0_IP_ADDRESS

It appears from our observations that we have approximatively 1 spurious
interrupt for 1 =E2=80=9Cuseful=E2=80=9D interrupt (frontend TX interrupts)=
 for HVM guests.

We run the same bench on the same platform with PV and PVH and the 
interrupts
spurious/useful ratio was quite lower: 1 to 20 (so the network 
performances are
much better).

We also run this bench on the Intel platform (Intel Xeon Bronze 3106 
CPU). The
interrupts spurious/useful ratio was about 1 to 30 for HVM guests.

So this make us think that this buggy behavior is related to abnormal 
amount of
spurious interrupts. This spurious/useful interrupts ratio is particularly
elevated in HVM guests on AMD platforms, so virtual network bandwidth is 
heavily
penalized =E2=80=93 in our particular bench we have 1,5Gbps bandwidth inste=
ad of 
7 Gbps
(when slowdown isn=E2=80=99t introduced by the irq_chip).

Does anybody notice this behavior on his side?=C2=A0 Can we do something 
about it?

Andrei Semenov


