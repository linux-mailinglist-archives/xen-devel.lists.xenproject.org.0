Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A49265DD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 18:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753263.1161520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP2hQ-0008LE-Mm; Wed, 03 Jul 2024 16:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753263.1161520; Wed, 03 Jul 2024 16:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP2hQ-0008Ji-Jx; Wed, 03 Jul 2024 16:19:16 +0000
Received: by outflank-mailman (input) for mailman id 753263;
 Wed, 03 Jul 2024 16:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vcdk=OD=bounce.vates.tech=bounce-md_30504962.668579fc.v1-b826b61cf4fb41abbbb48b7f4c5dd523@srs-se1.protection.inumbo.net>)
 id 1sP2hO-0008Ja-QA
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 16:19:15 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb3d65fc-3957-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 18:19:12 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4WDlMw3vlJz35ksGp
 for <xen-devel@lists.xenproject.org>; Wed,  3 Jul 2024 16:19:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b826b61cf4fb41abbbb48b7f4c5dd523; Wed, 03 Jul 2024 16:19:08 +0000
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
X-Inumbo-ID: fb3d65fc-3957-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720023548; x=1720284048;
	bh=Exz/4ZrpWCeqjSYxt8r/qBZvrM65bapKOn+U6eWIQT0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BBp189MTmUylXhQqXv+QIHhZv6zSksg+9mkteB1eAtzmp2ECx6Cccs3I+RPx+WUma
	 sfXI9FwbFRlqIfOD+X5zDy63TOyKqsR5S+2+sgjvDKa2+C5eFq2frVftKNr0XyyEMY
	 qIfekRF7HNZTamThDG+ughDyCxpQ9qBKn+6l9wGJEYV+GprI1av+WyY1TPfSdh/JKT
	 HAT7pvfPRYZd+oPn2FSVSmIdMm6XJZ/1UFOJ48z8bMIo5S83iZP482R4e/ynotj8sZ
	 7Q4eZx4XNW1XGDUh1+xVUW/Bbe69SMQ1NH3yh2qKUWotZ6JlZKxmd5olmLwmKpQDIE
	 l6aITGvbtKiow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720023548; x=1720284048; i=anthony.perard@vates.tech;
	bh=Exz/4ZrpWCeqjSYxt8r/qBZvrM65bapKOn+U6eWIQT0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qdubq0UHCd0esNUeszxIFyMRjz5YLJH1WIy/7x8J8PeDxYNAJb8+i0tSAGgBFsjGD
	 /KDFhR4eB+KCJtKe3J6y3zJexzhtJSu7EXiXy43A3n79CousFup2o1+P9eMw37Q52s
	 wsLI3KIjHSdD2JPl0/4vJjlGYczrW1mqqPLYGM1cUg9dES39uJVl7WB9/yEUvYWJIL
	 7QFssa9bTv2MygUR1gDPBNgUI3E68GWq5DbgXBEgpmzz2Ij+MQH4ZYYr2MDiE0xa+b
	 qC8dp/FC/5mqePbnjs8A+Arjaqww1ljF/xSTC5Cx6zYJgx/CrMDZ7Lkv9OaZvWhctE
	 vWCqajaTwqrdA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19=203/4]=20CI:=20Drop=20bin86/dev86=20from=20archlinux=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720023546920
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZoV5+RT0JOqFCW7d@l14>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com> <20240703142002.1662874-4-andrew.cooper3@citrix.com> <ZoVjg-HBZdoa-B5A@macbook.local> <6b05b04d-e2a8-42ba-b040-78638fa7b51f@citrix.com>
In-Reply-To: <6b05b04d-e2a8-42ba-b040-78638fa7b51f@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b826b61cf4fb41abbbb48b7f4c5dd523?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240703:md
Date: Wed, 03 Jul 2024 16:19:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 03, 2024 at 03:52:48PM +0100, Andrew Cooper wrote:
> Also, Archlinux is nonblocking because it's a rolling distro and
> periodically breaks older trees because of an updated GCC.

Correction: It should be nonblocking, it's not at the moment ;-).

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

