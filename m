Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F2992C61
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 14:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811968.1224623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxn9W-0000KO-8t; Mon, 07 Oct 2024 12:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811968.1224623; Mon, 07 Oct 2024 12:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxn9W-0000Gk-6E; Mon, 07 Oct 2024 12:47:54 +0000
Received: by outflank-mailman (input) for mailman id 811968;
 Mon, 07 Oct 2024 12:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6ez=RD=bounce.vates.tech=bounce-md_30504962.6703d874.v1-9f5efe9abb5e4bfe8737a8c13d10aab3@srs-se1.protection.inumbo.net>)
 id 1sxn9T-0000Ge-WB
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 12:47:52 +0000
Received: from mail137-12.atl71.mandrillapp.com
 (mail137-12.atl71.mandrillapp.com [198.2.137.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c1d89c2-84aa-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 14:47:50 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-12.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4XMf7m5Rkfz5QkPWm
 for <xen-devel@lists.xenproject.org>; Mon,  7 Oct 2024 12:47:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9f5efe9abb5e4bfe8737a8c13d10aab3; Mon, 07 Oct 2024 12:47:48 +0000
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
X-Inumbo-ID: 5c1d89c2-84aa-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728305268; x=1728565768;
	bh=QXW5FrsKYwaOPiXwxcQJyb9Hb2CF90cx9YcRtpeM+Ak=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iu7y3Lx2Fp5RaQ67OTdCjkk0IzeC0JiIVBmGQifNHyICD4KaNQviujCnXbVTpJ8ZZ
	 2Be5M+pvJo2kA666BTwfctkp8X4YcDJTxAjNiSzM1kki1nEx+8UlRuxb/qmAQk0pVi
	 gxBdE9Ch3uU2WQ7WW2+A6Nzr/3xtXG5lIgeHxEBTA5B7JFzKEEJRN9yaeiWH8knuXb
	 xKzsliSNnlmbFvWo2FBso9Y2PGSYMJUiovaob+mqRlt5uzPqbUMOHqwEJmjTJXPDol
	 SsLXHa1ja9UVl8PRtTqj2OdIpdzu17vAjpCkygFW6ecN/qErynS+FKB0CX8sKIFVt7
	 7G8Qs2kuuQbOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728305268; x=1728565768; i=anthony.perard@vates.tech;
	bh=QXW5FrsKYwaOPiXwxcQJyb9Hb2CF90cx9YcRtpeM+Ak=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XDo0TIsl1MnRCcEuTQlCa+9AUpE/HsVgVLHsuvrmwKOAUzDcv83B3mDeQ4N3W47ZK
	 O+or7uDs8PkoSbWYPP1VqYwKVSDb66B9iigsBKVATp4vyCj1AAMEjwiDSJun7uwVLs
	 mzqGUxh9RdYSPCX7QKrjg0n0mF+2k6kBC5tHFjXDoGtQQ/KHZD+JJVVcSqGoCuURHO
	 S/5GBnY8Qq9Oa/yR4GURer12F6hs1v0rDsfCerKpnKprZio6us0xupsx6UptCGdnrH
	 3448UwZFIlKZ8TCh7ztjLgYqRa+NVDrpiiC2o5e+qsXqcMvChno00sIfDTG1otibjB
	 AIqSQ8etLMcdg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/4]=20stubdom:=20add=20local=20.gitignore=20file?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728305267516
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-Id: <ZwPYcubFAkIs+pf9@l14>
References: <20241005151548.29184-1-jgross@suse.com> <20241005151548.29184-2-jgross@suse.com>
In-Reply-To: <20241005151548.29184-2-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9f5efe9abb5e4bfe8737a8c13d10aab3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241007:md
Date: Mon, 07 Oct 2024 12:47:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Oct 05, 2024 at 05:15:45PM +0200, Juergen Gross wrote:
> Add a stubdom specfic .gitignore file.

More like "Move stubdom specific ignored file into it." because there's
no changes to the list of ignored paths, and we don't usually need to
repeate the title of the commit in its description in the Xen repo.

> Signed-off-by: Juergen Gross <jgross@suse.com>

In any case all looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

