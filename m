Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25D77E51F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 17:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584811.915650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWIRK-0005B2-RV; Wed, 16 Aug 2023 15:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584811.915650; Wed, 16 Aug 2023 15:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWIRK-00059L-Od; Wed, 16 Aug 2023 15:28:06 +0000
Received: by outflank-mailman (input) for mailman id 584811;
 Wed, 16 Aug 2023 15:28:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWIRJ-00059F-JK
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 15:28:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWIRI-00037A-Rg; Wed, 16 Aug 2023 15:28:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.5.61])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWIRI-0004G2-J3; Wed, 16 Aug 2023 15:28:04 +0000
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
	bh=JCUI9GTdwu32oXbCuZ+3Qj8k6VZ1ahZmyXyVCFOdZbo=; b=XYf3bp2kn9VOzo3SlfGjgibIUD
	aSmTH3ZV4scx4LPl08o7IOjuLXCXnBFpEKId0nu16Wd0JDGWxYmusnNzU8eIqgunvF08yoo0qRzYg
	5NVA5OShiXTUoJy3PVIvCz+ReTKh5vcLx20+8fpNAJJ2qDv7IEfoYGpfnyX7KBuULOCg=;
Message-ID: <85fa02a8-7a19-4bca-89d7-6036038def4d@xen.org>
Date: Wed, 16 Aug 2023 16:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Remove unused function 'do_trap_fiq'
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <21c76788cbf4b79d4b77721cbdb956ca@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <21c76788cbf4b79d4b77721cbdb956ca@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/08/2023 16:18, Nicola Vetrini wrote:
> Hi,

Hi,

> the function mentioned in the subject, defined in 'xen/arch/arm/traps.c' 
> seems to have no
> caller (either from C code or from asm code), so I think it can be 
> safely removed, unless
> there's a reason for it to remain in Xen.

This is used by the arm32 code in arm32/head.S:

trap_fiq:
    vector fiq

where the macro vector will call do_trap_fiq.

So we need to keep the function around and a definition. Although we can 
move the function to arm32/traps.c but this is somewhat unrelated.

Cheers,


-- 
Julien Grall

