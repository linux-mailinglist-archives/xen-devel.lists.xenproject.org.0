Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78497A3285A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 15:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886483.1296118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiDhg-0000KA-EZ; Wed, 12 Feb 2025 14:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886483.1296118; Wed, 12 Feb 2025 14:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiDhg-0000Hl-At; Wed, 12 Feb 2025 14:27:04 +0000
Received: by outflank-mailman (input) for mailman id 886483;
 Wed, 12 Feb 2025 14:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jHST=VD=bounce.vates.tech=bounce-md_30504962.67acafb3.v1-e4d7d9ecb4364086a0393f00a7e959fa@srs-se1.protection.inumbo.net>)
 id 1tiDhe-0000Hb-T7
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 14:27:02 +0000
Received: from mail179-38.suw41.mandrillapp.com
 (mail179-38.suw41.mandrillapp.com [198.2.179.38])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6badbe3c-e94d-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 15:27:00 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-38.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4YtLH72zYMz2K1rpv
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 14:26:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e4d7d9ecb4364086a0393f00a7e959fa; Wed, 12 Feb 2025 14:26:59 +0000
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
X-Inumbo-ID: 6badbe3c-e94d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739370419; x=1739640419;
	bh=ZUgC35LG/+TdR+VzZ6JcBzGgEb/skrgS3drUO1eCPyk=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TAtEtWCkuIVzSQiRknWX/ZhG/tGBDiSDoUOykmbowubiRXvrZg5l0FqqrJcJQhOpd
	 +T/84NhqUH4Ku9cJcj3rioOGpCFCPXhMt3djATYTmZze7zwITs5xDhOe4T/d3VY2cs
	 NDK7g93ZjUhbJ1m1Tht95mtQKcr9xJVp7P4f+dWj2Mo6MBPRUtwLYoFXovUs1mn+EA
	 Mw2jMPf78Rkhj5oHHkxCa+YnezOU6KNIMstpZVcaieWOgebEOC2AaVdk5dSCB3SBo1
	 Ds7ITWhywPCh3QHYQXykbQbVukoPgfG03VeKJr0UP56QyQMgy36Wm7PAw00VRbzC0m
	 RH/RfZxqvXgMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739370419; x=1739630919; i=samuel.verschelde@vates.tech;
	bh=ZUgC35LG/+TdR+VzZ6JcBzGgEb/skrgS3drUO1eCPyk=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZmYr7cDbZk76potwfhPC9S7hYFad1EppdLeYZLwtBg9t6WwJMKcQNITmjMMcIhjn1
	 lIM233XC5fYigHi6HFwlJgJkN6sYevMjX1mO1Y9GjQxbY8QwXjkhcjUrIEV7VIWEcE
	 sEDYbAFumm+KxvSeGzt1wLY/GOnjssc3kJMi4YieMGpXEMaAs8PhU9GHw2zZlZFs02
	 87aJccIifhsiEzj4SodqQjAdGrvaa6diJjy97ZOcz0x5owJmWkPvTxnq8O5W/6YG4X
	 AaGoHPKm+E0FjJaIGoGsRaimrmJEm5F+7UCYaIRzYGwvAjuXTvjc/FcCUVMWHC/tca
	 JIo8CBod3sw8w==
From: "Samuel Verschelde" <samuel.verschelde@vates.tech>
Subject: =?utf-8?Q?Recap=20of=20the=20Xen=20Winter=20Meetup=202025,=20by=20Olivier=20(Vates)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739370418750
To: xen-devel@lists.xenproject.org
Message-Id: <5910217e-0207-a161-0d03-22b30dc47b1a@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e4d7d9ecb4364086a0393f00a7e959fa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250212:md
Date: Wed, 12 Feb 2025 14:26:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi everyone,

Olivier Lambert published a detailed recap of the meetup that occurred 
in Grenoble, France, a bit less than two weeks ago.

Those interested can read it at:

https://xcp-ng.org/blog/2025/02/11/xen-winter-meetup-2025-a-recap/

Best regards,


Samuel Verschelde | Vates XCP-ng Lead Maintainer / Release Manager / Technical Product Manager

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

