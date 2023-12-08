Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08B809F94
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650493.1016084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXJf-0001vz-NO; Fri, 08 Dec 2023 09:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650493.1016084; Fri, 08 Dec 2023 09:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXJf-0001tT-Ja; Fri, 08 Dec 2023 09:38:39 +0000
Received: by outflank-mailman (input) for mailman id 650493;
 Fri, 08 Dec 2023 09:38:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NxGJ=HT=bounce.vates.tech=bounce-md_30504962.6572e3fd.v1-f04b9bf8881943c8a4a23603259e6460@srs-se1.protection.inumbo.net>)
 id 1rBXJA-0001rD-CN
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:38:08 +0000
Received: from mail187-18.suw11.mandrillapp.com
 (mail187-18.suw11.mandrillapp.com [198.2.187.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d38214b-95ad-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:38:06 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-18.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4SmmK91dMnzCf9KVl
 for <xen-devel@lists.xenproject.org>; Fri,  8 Dec 2023 09:38:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f04b9bf8881943c8a4a23603259e6460; Fri, 08 Dec 2023 09:38:05 +0000
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
X-Inumbo-ID: 7d38214b-95ad-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
	s=mandrill; t=1702028285; x=1702288785; i=yann.dirson@vates.tech;
	bh=nVnZrNSLMyfJmGGahPubRFuseiUrvdIGOKRpgTJzslQ=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=YfkuweZJfyw3r99PGS2kWQi/iArxFC76dtGIxQq967KePME4R0mJ2SKFpq1Ilo2/o
	 eHK5nYpGxmazQd5yzHO+Gol+Ry1NRe1vNWu/Lx7MvztDi18N7L1NhJgPkqdjbEa0q2
	 cTc6FEVKxQ8p+l7AkPz3PqgroB0PITwNa7oc0/iQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1702028285; h=from :
 subject : message-id : to : cc : date : mime-version : content-type :
 content-transfer-encoding : from : x-mandrill-user : list-unsubscribe;
 bh=nVnZrNSLMyfJmGGahPubRFuseiUrvdIGOKRpgTJzslQ=;
 b=QbixvZ2w9ruNdOEGSGbQSC6Ri5LxuVJrLRG+ZrosCnos3qwwXnLad+W68l8w2uvpbAQjw
 Xjm+fMvxEPexRxC/nzUe/6QQGKmMjhY5dYy5RQ/VkqhzsHZWXqUbSXzf9pnVyprE50bKCZo
 H0Un7gC/w9+97HO9B89fw24gCch+lUA=
From: Yann Dirson <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Next=20steps=20for=20Rust=20guest=20agent?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1702028284197
Message-Id: <aea51d2e-5da8-4da8-954f-2ee2a43be73e@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: dpsmith@apertussolutions.com
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f04b9bf8881943c8a4a23603259e6460?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20231208:md
Date: Fri, 08 Dec 2023 09:38:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Current status:
- primary goal: to have one guest agent all downstreams can use, in all 
guests (with Linux and FreeBSD already supported), as efficient as 
possible (with Netlink already supported on Linux)
- developed at https://gitlab.com/xen-project/xen-guest-agent (till now 
using gitlab PRs)
- works fine as a replacement for the Xenserver xe-guest-utilities

Some points raised during the community call:
- we likely want first to agree on a core set of collected information
- could be made more configurable (eg. define a xenstore schema at 
runtime, we don't want specific schemas needs to cause forks)
   -> it could be the agent requesting a specific xenstore schema
- what should be the criteria to advertise it as official Xenproject 
guest agent ?


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

