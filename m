Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F1992CDA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 15:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811982.1224644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxnZf-00068t-IZ; Mon, 07 Oct 2024 13:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811982.1224644; Mon, 07 Oct 2024 13:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxnZf-00067E-FQ; Mon, 07 Oct 2024 13:14:55 +0000
Received: by outflank-mailman (input) for mailman id 811982;
 Mon, 07 Oct 2024 13:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxJ7=RD=bounce.vates.tech=bounce-md_30504962.6703dec9.v1-984043e1a2f64376ad4a9cf35510a7a1@srs-se1.protection.inumbo.net>)
 id 1sxnZd-000678-0e
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 13:14:53 +0000
Received: from mail137-12.atl71.mandrillapp.com
 (mail137-12.atl71.mandrillapp.com [198.2.137.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f93378-84ae-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 15:14:50 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-12.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4XMfkx1z2Cz5QkMBW
 for <xen-devel@lists.xenproject.org>; Mon,  7 Oct 2024 13:14:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 984043e1a2f64376ad4a9cf35510a7a1; Mon, 07 Oct 2024 13:14:49 +0000
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
X-Inumbo-ID: 21f93378-84ae-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728306889; x=1728567389;
	bh=hqiuWdgqsKyqZFC2MM7hiL1EbjI6zoYTHX/g6Epy9L0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ltXHhXpzPZRmwljJxCN+yx9mBZgW34iCJkgft2AgadlBTnO9osvu8KzaASwpvKeCv
	 CJdq4IJm5kxVS0mIyNKCExQg0vfcAAQTU2lm7xOPkkI5kyZQ9BaFwXFMEYr2XE3kU4
	 TxaYvpTANhv2ecUkRbK1d5Pn5bVz5C/4+09qkWqTG7bH98K1P1oHXBUw1eic/J7Mv/
	 /2bR6Wm4sL2D5EIPGczcu8gYqb+gfAH5335BVfpF2gnq1nR45OONrN8DAvO5VlBuPR
	 lLkqkiZDRT3o5IoiOkFMRU2COlYHu4QizjJXUQueIs6eAKwf5J4MH0j8m6q6PW5hZi
	 V3KVF/dh9oX/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728306889; x=1728567389; i=anthony.perard@vates.tech;
	bh=hqiuWdgqsKyqZFC2MM7hiL1EbjI6zoYTHX/g6Epy9L0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K88bGAOse6prWX17yDUnvCMVS74cvFqsNp84eJ8BYu/wXPS04LQyJNAJUG4Yy3kRY
	 l8lGNrhqSLBE7Myuy7WbFrvNm6JlEgTb+gR6HfsJtGwArJUu5vAry1qZ8jrl8fokFo
	 iR/HG9Hb/zZTnHvYedYItU3IFlxivXkVTuqW54692kGQR0xuY1IWnG49XrZKv1j2Zy
	 hAgbg7M//dX6Xfday5SvQF2l0T+nT/nkhZnCYaBvvJxT1svQAb+b6vJ7oQMn3FtqIJ
	 hJ6N+VLtD6/6QvGETnNAkn6xCfI6qzWD795uBB2yE3Cb3ocWKaDsmmyTp6cokhslJv
	 Zr3ghx66ITrAQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/4]=20build:=20move=20xenlibs-dependencies=20make=20definition=20to=20uselibs.mk?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728306888583
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <ZwPeyJy2K+sNFKy9@l14>
References: <20241005151548.29184-1-jgross@suse.com> <20241005151548.29184-4-jgross@suse.com>
In-Reply-To: <20241005151548.29184-4-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.984043e1a2f64376ad4a9cf35510a7a1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241007:md
Date: Mon, 07 Oct 2024 13:14:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Oct 05, 2024 at 05:15:47PM +0200, Juergen Gross wrote:
> In order to be able to use the xenlibs-dependencies macro from stubdom
> build, move it to tools/libs/uselibs.mk, which is included from
> current users and stubdom/Makefile.
> 
> No functional change intended.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

