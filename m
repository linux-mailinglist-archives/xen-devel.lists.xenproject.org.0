Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF359873E0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 14:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805429.1216516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto0J-0000zk-4N; Thu, 26 Sep 2024 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805429.1216516; Thu, 26 Sep 2024 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto0J-0000wt-03; Thu, 26 Sep 2024 12:53:55 +0000
Received: by outflank-mailman (input) for mailman id 805429;
 Thu, 26 Sep 2024 12:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VznZ=QY=bounce.vates.tech=bounce-md_30504962.66f5595d.v1-ef7a1233fc2346e3851986d74bfdb241@srs-se1.protection.inumbo.net>)
 id 1sto0G-0000wb-QB
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 12:53:53 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60afb654-7c06-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 14:53:51 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4XDtnn61Pgz1XLFWy
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 12:53:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ef7a1233fc2346e3851986d74bfdb241; Thu, 26 Sep 2024 12:53:49 +0000
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
X-Inumbo-ID: 60afb654-7c06-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727355229; x=1727615729;
	bh=D7DLcDL5FSBvbAt0zdMciFux8ivvQkPD07MznEERP2Q=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=dV8mX3U7JlvaxX03T7aI9riYhOvbyflNTTebIGIwyVLrgXzT35dQzPoKcWF14MU8E
	 c2GQQRF3k+z7uSgCNhgCcOiPoIL/i+a8G3uxFQPkeIN9F4kP0hNr00yorHFoGIyP2q
	 53an0BXmSkWekshW3G353rI04MZtMjZdEp0XZIdVBDsT4BTPM0usXAC5rhw20rrK+l
	 QxfGxXSLjaxqJPst4IWh3fwfX+NHmF3z6QI8aNjLDzmxqQxemTHZbrk6o36F94H7BD
	 QYHUYo87HL5xCI3wvEgsmP3rsX8tZLWbuS2xsnichLbMw7ovvLA+taL55os46vB8p0
	 ORnQkBMQFRuFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727355229; x=1727615729; i=anthony.perard@vates.tech;
	bh=D7DLcDL5FSBvbAt0zdMciFux8ivvQkPD07MznEERP2Q=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=FC5jPSlVK7i2MsxuFCFOQR3mTAm90QTUquWtnKE9LmkSA6Larg2gWsmaJuu0NvQE0
	 ec2JaY6x2tAduL6KKDyWU81lLz+coGcS0koXHQ2G36U4v7Muz5KTPxz/5fygcW+84g
	 zC9OYpbXrUUnzXjIrO0NhXSVTzBe9NFYPkMY356id58caKz29r7VjAmsVwoau9AQeM
	 0HnlFM8lBI8LjFJj+Yxh7lV4HHWGJogzCaEeG2BwKHM+DDDkzdZBiU0wck+h04pNmc
	 2UuZbWhass2FjhWLGPncxijdc3npS9w07NLoaFncQeVd9pZMCnkVthpqIn/Hfd7AF1
	 GnSD33l6UNpqg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=200/2]=20blkif:=20Fix=20discard=20req=20align=20requirement=20and=20various=20typos?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727355229035
To: xen-devel@lists.xenproject.org
Cc: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240926125347.23738-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ef7a1233fc2346e3851986d74bfdb241?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 12:53:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.blkif-wording-fix-v1

Cheers,

Anthony PERARD (2):
  blkif: Fix alignment description for discard request
  blkif: Fix a couple of typos

 xen/include/public/io/blkif.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

