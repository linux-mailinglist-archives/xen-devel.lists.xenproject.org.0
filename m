Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132593B0BA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 13:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764144.1174478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWaVc-0002yP-Rl; Wed, 24 Jul 2024 11:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764144.1174478; Wed, 24 Jul 2024 11:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWaVc-0002wF-P8; Wed, 24 Jul 2024 11:50:16 +0000
Received: by outflank-mailman (input) for mailman id 764144;
 Wed, 24 Jul 2024 11:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5IH=OY=bounce.vates.tech=bounce-md_30504962.66a0ea73.v1-7527a93884c54397b780ff3730ee1865@srs-se1.protection.inumbo.net>)
 id 1sWaVa-0002w9-QE
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 11:50:14 +0000
Received: from mail135-10.atl141.mandrillapp.com
 (mail135-10.atl141.mandrillapp.com [198.2.135.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e29ea8cb-49b2-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 13:50:13 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-10.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WTXPv6Ghdz5QkT3p
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 11:50:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7527a93884c54397b780ff3730ee1865; Wed, 24 Jul 2024 11:50:11 +0000
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
X-Inumbo-ID: e29ea8cb-49b2-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721821811; x=1722082311;
	bh=MEN9yMgWV6uHJhkrg4XLTkHKLPjMoi2cLUMbAoL3Whg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=klG/nzghwyqxue+axwjD/9MTE2gHrcofu6S6/e1fI8ebhy78c8ffGUOpcatin8uj0
	 FedG6aF+/Ni/gwMolm+uzdAYTLCoOFZD6dAxgFemJM+pvb3gZJwKA98dbtSbuK6j0n
	 zPUtbGlxqB4tqPTzMswa5x5QUCBIXlWNhCkH0gzIvFjh0sxz/WhBH1DOie0Ct+uE2I
	 POrxQKoAkAjPtF9qp5k/dxs61KO19pRb8kz8cktmOafQwzteWrrS/nb75i0fmWwqT7
	 qVe8axa9nz74UxngeyT7aCvZzrG3aoQrkh35RlFCPsVrrBwGl+xPfqnc9Aj0h7cF9T
	 s+FctYEV9a16Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721821811; x=1722082311; i=anthony.perard@vates.tech;
	bh=MEN9yMgWV6uHJhkrg4XLTkHKLPjMoi2cLUMbAoL3Whg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GnovSw2bXhbszm7f0kaL2dL0bOhrpjVznr3QdRa7gsBXBMEho1bS75JulXKLnMRBD
	 pp1X3+xG/05eOZAZSjtyKfIgwtcmOWGfZcpgz3YhJx/GNhIZf/SJRu5f7qFlAbGgnB
	 LaE00le0KqChV1n0v45l6VHciTwXxlyj2Bius6C6wRZI57c0ZedmCMK+r/9wEElMmJ
	 5xEcp6lARwBxsRUYbTytp9qimME95tiA3H8TTmdn3J+tqPCnDUP0NbOCuOY62zRBA5
	 fYAEke1bazOw9dR+kwqC04U/v+TyVMGCY48kcxiJBjKO2/Zn49QlbZgBSEC48gRrak
	 9bdpGC3cXmyig==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19]=20hotplug:=20Restore=20block-tap=20phy=20compatibility=20(again)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721821810735
To: oleksii.kurochko@gmail.com
Cc: Jason Andryuk <jason.andryuk@amd.com>, Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Message-Id: <ZqDqcoY4e0p2UJ3v@l14>
References: <20240715234631.4468-1-jandryuk@gmail.com> <Zp/GcCUVPX/d/7qx@l14> <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com> <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
In-Reply-To: <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7527a93884c54397b780ff3730ee1865?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240724:md
Date: Wed, 24 Jul 2024 11:50:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 07:31:58PM +0200, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-23 at 11:04 -0400, Jason Andryuk wrote:
> > Oleksii, this is a fix (for an incomplete fix) for 4.19.=C2=A0 76a48419=
3d 
> > broke compatibility for block-tap with the blktap2 kernel model (when
> > adding support for tapback).=C2=A0 This finishes restoring blktap2
> > support.
> > 
> > I realize it's late in the release if you don't want to take it.
> It's pretty late but I just wanted to clarify:
> 1. Is so critical that we should have this in 4.19?

I don't think it's critical enough to justify delaying the release.
blktap2 is I think an out-of-tree kernel module so probably not very
used.
We might want to at least put a note in "known issue" about blktap2
support by the "block-tap" script been broken.

> 2. If we won't take it now, then will it be backported anyway?

Yes, we want to backport that as soon as 4.19 tree is open for
backports, to have the fix in 4.19.1.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


