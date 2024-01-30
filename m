Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B177842613
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 14:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673442.1047800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUo27-0007Fx-A8; Tue, 30 Jan 2024 13:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673442.1047800; Tue, 30 Jan 2024 13:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUo27-0007DB-6A; Tue, 30 Jan 2024 13:20:11 +0000
Received: by outflank-mailman (input) for mailman id 673442;
 Tue, 30 Jan 2024 13:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeE3=JI=bounce.vates.tech=bounce-md_30504962.65b8f786.v1-82d51abd79a849f7b8ca6396fa85c3c3@srs-se1.protection.inumbo.net>)
 id 1rUo24-0006HE-Si
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 13:20:09 +0000
Received: from mail145-21.atl61.mandrillapp.com
 (mail145-21.atl61.mandrillapp.com [198.2.145.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4901d59c-bf72-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 14:20:07 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-21.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4TPQkt0zpPzllq
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 13:20:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 82d51abd79a849f7b8ca6396fa85c3c3; Tue, 30 Jan 2024 13:20:06 +0000
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
X-Inumbo-ID: 4901d59c-bf72-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1706620806; x=1706881306;
	bh=U6pZSDC2gmwr6jxndtp0NHMbgoOtZz7hjE1xewrd0js=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RXyVTcWzVAII3P1hYEmtQ40oLdJ/hx76HvlhCNuX8OaBPqb96l0z9v+FPxrrxoDVS
	 IP86JUkwhZR3VZHNVtehpPm+B93+VnTTV56G0ax2tTylCIGjcgzj1GLdseGw+1yBrC
	 REAIOyvOf5/W4cjveZ5lrhil8KyyCIXd5eY0qlPTHZ63OhLy+dr7VM77J2yr7qdYWQ
	 +wMNdNy4UbH32MZzLTTx2DQMo91c57WqcMtpOJ37BaXNiZzDxW02Yj4L/+7xQjqQRK
	 yv8Zh9givSApE5fVWC8FpegFTrT/6uoOD61BS/bbjFSEtgO75nzAhWMbWxuF7ALQxL
	 F2Y7JAWrFVRng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1706620806; x=1706881306; i=yann.dirson@vates.tech;
	bh=U6pZSDC2gmwr6jxndtp0NHMbgoOtZz7hjE1xewrd0js=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=y+tpDHiMqMQdzX2f6Hst/Id6fIL8DFXZWrI51d8im6UxQ7keOj03iOyTr8boRIEqO
	 gDu5kkX1Z6mzqphHVBmZxM0ENJHj0ROgTapn9LVFy0md1Heysc5saZbwXJt0RZFy2P
	 yqV3qKsoGS/VvhjtXlp/dL8YAFmcnaT3GlIyc9EFJXoBI/lVsYeVMhAOBy2WbW4QIk
	 uzDENmJe11uwPhD89OhumZNI7eDi4sgmFrImSt9CTgpmVNkZFzLQc2mqHWvLs4j3Ta
	 n8fRpOTFd86Fbf+fP/KSR6blf70uLozc3DS9PNkltXtHoEphzIgQk9UYVzAIQmQMZJ
	 BYpvNOopxhGqQ==
From: Yann Dirson <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Rust=20Xen=20Guest=20Agent=200.4.0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1706620805238
Message-Id: <c3083bfc-9777-451f-8527-29fd09beec8d@vates.tech>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.82d51abd79a849f7b8ca6396fa85c3c3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240130:md
Date: Tue, 30 Jan 2024 13:20:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

A new pre-release of our guest agent prototype written in Rust is
available, numbered 0.3.0 [1].  Identified issues and work to be done
are tracked in Gitlab issue tracker [2].

As always, feedback will be greatly appreciated!

Highlights:

### new features

* can be linked statically with libxenstore to distribute a more
   standalone binary (`-F static`).  Used for official Linux binary.
   Notably useful for guests running a RHEL-derived Linux distro.

### bugfixes

* stale network information in xenstore is now removed on startup

### other noteworthy changes

* CI pipelines stopped producing binaries for EOL'd FreeBSD 12.4,
   switched to 13.2
* CI now produces an (unofficial) binary for FreeBSD with Netlink
   support


[1] https://gitlab.com/xen-project/xen-guest-agent/-/releases/0.4.0
[2] https://gitlab.com/xen-project/xen-guest-agent/-/issues


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

