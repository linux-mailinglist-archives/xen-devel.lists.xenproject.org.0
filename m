Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983CD19F196
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 10:27:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLN6f-00039A-Ir; Mon, 06 Apr 2020 08:27:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/g5+=5W=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jLN6e-00038v-EC
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 08:27:44 +0000
X-Inumbo-ID: 7bfe6752-77e0-11ea-bfd7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bfe6752-77e0-11ea-bfd7-12813bfff9fa;
 Mon, 06 Apr 2020 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uS79rdr2gTc56AOSoA+CLXOyDTk2U5AqZbWu/xQvh8c=; b=O4CfVD7XRNpMLEozF9my9xjmQB
 VBw8WnWjq2OhNuhqbVShM/2dGmZaLNhjMKCmha/bw2q/OGhkCAXGN+xCjl87ynTQy+ZgaNExT06Nk
 j6TJdJRtnm2TUpGDvY4kE9i6bB6EG3FAJvg4GNBCbWmNo1wZ9NPjl2SOdyL70kGhWjOo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jLN6b-0004TV-S3; Mon, 06 Apr 2020 08:27:41 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jLN6b-0003tR-Ht; Mon, 06 Apr 2020 08:27:41 +0000
Message-ID: <636251f68db5e094f0c4dd5871eb4146dadb1589.camel@xen.org>
Subject: Re: [Xen-devel] [PATCH 0/5] use new API for Xen page tables
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 06 Apr 2020 09:27:39 +0100
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping.

On Mon, 2020-03-23 at 09:41 +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> This small series is basically just rewriting functions using the new
> API to map and unmap PTEs. Each patch is independent.
> 
> Apart from mapping and unmapping page tables, no other functional
> change
> intended.
> 
> Wei Liu (5):
>   x86/shim: map and unmap page tables in replace_va_mapping
>   x86_64/mm: map and unmap page tables in m2p_mapped
>   x86_64/mm: map and unmap page tables in share_hotadd_m2p_table
>   x86_64/mm: map and unmap page tables in destroy_compat_m2p_mapping
>   x86_64/mm: map and unmap page tables in destroy_m2p_mapping
> 
>  xen/arch/x86/pv/shim.c     | 10 ++++---
>  xen/arch/x86/x86_64/mm.c   | 55 +++++++++++++++++++++++++-----------
> --
>  xen/include/asm-x86/page.h | 18 +++++++++++++
>  3 files changed, 62 insertions(+), 21 deletions(-)
> 


