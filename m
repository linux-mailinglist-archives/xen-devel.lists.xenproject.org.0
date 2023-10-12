Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE357C6C2C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 13:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615766.957179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqtm9-0004SX-28; Thu, 12 Oct 2023 11:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615766.957179; Thu, 12 Oct 2023 11:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqtm8-0004Qk-Vs; Thu, 12 Oct 2023 11:22:44 +0000
Received: by outflank-mailman (input) for mailman id 615766;
 Thu, 12 Oct 2023 11:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AQY=F2=bounce.vates.tech=bounce-md_30504962.6527d700.v1-a3ec0086e1894dbd854b4fb55797cba4@srs-se1.protection.inumbo.net>)
 id 1qqtm7-0004Qe-Rd
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 11:22:43 +0000
Received: from mail177-2.suw61.mandrillapp.com
 (mail177-2.suw61.mandrillapp.com [198.2.177.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7f0485c-68f1-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 13:22:41 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-2.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4S5nL82hvqzS62KcF
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 11:22:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a3ec0086e1894dbd854b4fb55797cba4; Thu, 12 Oct 2023 11:22:40 +0000
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
X-Inumbo-ID: a7f0485c-68f1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1697109760; x=1697370260; i=yann.dirson@vates.fr;
	bh=LDsl5IRKLm1e1gRX2ek5+bGwRs6jKWWm8waJS7mahQ0=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=dug7DYzsBThINaGNDJ/aUc3RJSJ5EsVr2KHNUwsF8fMQG+sKB0gxRqSJBsKSgJUL8
	 BcY/zNOIclq+cW08GVgMtppScaiZ1vkoi1NRmHD7GA5GQCZdI8TUdlFQC14X4iTQ5q
	 UTGchtNFNVbDxmemH6Q9i7BcvL7jRqjtAxXEF8fk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1697109760; h=from :
 subject : message-id : to : date : mime-version : content-type :
 content-transfer-encoding : from : x-mandrill-user : list-unsubscribe;
 bh=LDsl5IRKLm1e1gRX2ek5+bGwRs6jKWWm8waJS7mahQ0=;
 b=o9ej47QP1Ax2fw0Nh/lFfRdKYSFj6YiMaavcg2rgaRlMU46l8s7YTFI7Pd0BZd5c0BfUa
 EGtIo5CtTea69bVl+JpnRa63K+XFNEMxifx1+wPvt8tzwdV+D62iYrtKRCvXFrSe5cqO6YX
 +jXUPZopaDzbRUE4/hepxn9BmnGG2ng=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Rust=20Xen=20Guest=20Agent?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 3c3d82e7-ce49-4348-9fa1-d1b52dc338c1
X-Bm-Transport-Timestamp: 1697109759551
Message-Id: <a4ec7881-3c14-4f4e-ac29-d625a452b034@vates.fr>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a3ec0086e1894dbd854b4fb55797cba4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20231012:md
Date: Thu, 12 Oct 2023 11:22:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

A new pre-release of our guest agent prototype written in Rust is 
available, numbered 0.2.0 [1].  Identified issues and work to be done 
are tracked in Gitlab issue tracker [3].

More details can be found in this blog post [2].

As always, feedback will be greatly appreciated!


[1] https://gitlab.com/xen-project/xen-guest-agent/-/releases/0.2.0
[2] https://xcp-ng.org/blog/2023/10/12/updates-on-the-rust-guest-tools/
[3] https://gitlab.com/xen-project/xen-guest-agent/-/issues


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
web: https://vates.tech

