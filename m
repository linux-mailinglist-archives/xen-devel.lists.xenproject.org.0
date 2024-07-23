Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913793A37C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 17:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763321.1173593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWH3x-0006sZ-4N; Tue, 23 Jul 2024 15:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763321.1173593; Tue, 23 Jul 2024 15:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWH3x-0006qP-10; Tue, 23 Jul 2024 15:04:25 +0000
Received: by outflank-mailman (input) for mailman id 763321;
 Tue, 23 Jul 2024 15:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oZHU=OX=bounce.vates.tech=bounce-md_30504962.669fc672.v1-0a6f321e1f89430d8af585d8d832d8d4@srs-se1.protection.inumbo.net>)
 id 1sWH3u-0006qJ-G0
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 15:04:22 +0000
Received: from mail135-10.atl141.mandrillapp.com
 (mail135-10.atl141.mandrillapp.com [198.2.135.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d63cbd1e-4904-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 17:04:20 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-10.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WT0mL1znRz5QkLlb
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 15:04:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0a6f321e1f89430d8af585d8d832d8d4; Tue, 23 Jul 2024 15:04:18 +0000
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
X-Inumbo-ID: d63cbd1e-4904-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721747058; x=1722007558;
	bh=G2+62SMsG/3zTgnoIRu/l3PF01RL/kdmkRp0/6a8U4Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WObpStvPtxoZFZzQTWXxuJ2P01UoQNO5EczoOeYaqf8dbBrLWloj4i5nAEKmILguW
	 /owFrKYHLizVHJAg9QvlqHLej2WW7c7zV4a5dexkv2hTcRlMtJc2BNDcDCBPPYZRr1
	 8nSl6yakRTd18aGeXHGpJvqX5nBhuQVYHcfKhgKyOp4J1+B5Ul2MXQn9dE+2aRGbok
	 6A/4lAFZ1Lh4hLyEGb/UCqcHN8hHGxt2LZ3RC9/93T8LlPgTzkOKoNnYgUDfIZT1u9
	 5e4KxWuB139iEEcEwCi3cTEjGltBS29BDVXu+OVtmVkhIpAgw1AHvAhc6McnaBNbCw
	 W8uM/CxAJAVUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721747058; x=1722007558; i=anthony.perard@vates.tech;
	bh=G2+62SMsG/3zTgnoIRu/l3PF01RL/kdmkRp0/6a8U4Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=loNbCSHs8NOJNTnLssSWEidHR2VwD8MDkZCExOcky5U/jGI8iS5HriTWfLqtgJmjE
	 RdSQ9HguKZ5W0mlljf+7bRNiEZezy5YRhuaAieIRj9tlVIxFvduCd8tZAaEnFNp1/F
	 TmWd0E4/7asdL8iNZKj2jWy06f1yGm41yXvNumhJUpENth4q7RTA/xRB4iZ+k4JJK9
	 f/yr3adDa89x07hvo5QJmJry+Kj9Wl+sedwzecm9py7SZhyjd5fjRnQsXRPPq/gzgY
	 NMAMwbSIPGrKDXtJjZfFbxprJpjlXa6PjJSAa79D8d82zBSl0EwyzVfqBLXkxzeg2D
	 pvCVyplWTKT8g==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19]=20hotplug:=20Restore=20block-tap=20phy=20compatibility=20(again)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721747057079
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
Message-Id: <Zp/GcCUVPX/d/7qx@l14>
References: <20240715234631.4468-1-jandryuk@gmail.com>
In-Reply-To: <20240715234631.4468-1-jandryuk@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0a6f321e1f89430d8af585d8d832d8d4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240723:md
Date: Tue, 23 Jul 2024 15:04:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
> "$dev" needs to be set correctly for backendtype=phy as well as
> backendtype=tap.  Move the setting into the conditional, so it can be
> handled properly for each.
> 
> (dev could be captured during tap-ctl allocate for blktap module, but it
> would not be set properly for the find_device case.  The backendtype=tap
> case would need to be handled regardless.)
> 
> Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy compatibility")

Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy compatibility") ?

> Fixes: 76a484193d ("hotplug: Update block-tap")
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

With the fixes tag fix:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

> ---
> Tested with backendtype=tap & tapback and backendtype=phy & blktap
> module.

Thanks for the extra testing.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

