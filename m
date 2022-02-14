Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3C4B4C9A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271401.465821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYuG-0001ty-Ui; Mon, 14 Feb 2022 10:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271401.465821; Mon, 14 Feb 2022 10:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYuG-0001rx-QZ; Mon, 14 Feb 2022 10:48:32 +0000
Received: by outflank-mailman (input) for mailman id 271401;
 Mon, 14 Feb 2022 10:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ti2k=S5=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1nJYuF-0001rr-Rl
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:48:31 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a49b01f6-8d83-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 11:48:28 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1nJYuB-0001oD-Sd; Mon, 14 Feb 2022 10:48:27 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 00A382C683F;
 Mon, 14 Feb 2022 10:48:27 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id FDCdNp8S8c1q; Mon, 14 Feb 2022 10:48:26 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id D0EAD2C683C;
 Mon, 14 Feb 2022 10:48:26 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id C89E515E; Mon, 14 Feb 2022 10:48:26 +0000 (GMT)
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
X-Inumbo-ID: a49b01f6-8d83-11ec-8eb8-a37418f5ba1a
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Mon, 14 Feb 2022 10:48:26 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: paul@xen.org
Subject: tools: propogate MTU to vif frontends (backporting)
Message-ID: <20220214104826.GA1607026@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

I've been backporting this series to xen 4.14 and everything relating to the
backend seems to be working well.  For the frontend I can see the mtu value
published to xenstore but it does't appear to be consumed to set the matching
mtu in the guest.

https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00458.html

Is the expected solution a custom script running in the guest to make the
necessary change or have I missed something in how this is supposed to
operate?

Thanks,
James

