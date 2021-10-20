Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E9435254
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 20:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214057.372479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFxy-0003A9-7W; Wed, 20 Oct 2021 18:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214057.372479; Wed, 20 Oct 2021 18:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFxy-00037E-4b; Wed, 20 Oct 2021 18:05:30 +0000
Received: by outflank-mailman (input) for mailman id 214057;
 Wed, 20 Oct 2021 18:05:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdFxw-000378-Hh
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 18:05:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFxw-0002yo-Cr; Wed, 20 Oct 2021 18:05:28 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFxw-0007yx-5f; Wed, 20 Oct 2021 18:05:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vj2GTLUwQEmvicFc+ddMOBLrRf6V+4nI0eq/YzUztZg=; b=ojh4TtuAbnz0GyYWi/yNDC+/J/
	2WyqEt92Nt/Jz6eN7Z/UgzsglwkudhFNK49j1oSVhOsG2sOQucRLGw/L+Ho507cTRFhNqtpJHqHIa
	Hyr5+kqp4Wg3fEtBVGmQFsIqdMJJFmLQixIrznACiFJA/4t71qH/RLeP/p93WT4QJp+Q=;
Message-ID: <e4661f83-a1ac-3553-b281-c4123be7a04f@xen.org>
Date: Wed, 20 Oct 2021 19:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 03/13] libfdt: import fdt_overlay from Linux
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-4-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-4-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 02/09/2021 07:05, Vikram Garhwal wrote:
> Xen is missing fdt overlay functionalities. FDT overlay is required for changing
> the device tree nodes during run-time.
> 
> fdt_overlay.c file is copied from Linux tree's following patch:
> commit: 6e9c9686d826564f44c93cdd6f111b1c0a9dc224
> scripts/dtc: Update to upstream version v1.6.0-31-gcbca977ea121

This patch and the next one add quite a bit of code in libfdt. The 
directory xen/common/libfdt is pretty much a snapshot of v1.4.0 (we 
tweaked the Makefile and import 2 bug fixes).

So I would prefer if we re-sync our directory with the one in 
https://github.com/dgibson/dtc.git. v1.6.1 seems a good candidate.

Cheers,

-- 
Julien Grall

