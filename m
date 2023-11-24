Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C7A7F72B9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640569.998995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6UNB-0008OZ-N9; Fri, 24 Nov 2023 11:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640569.998995; Fri, 24 Nov 2023 11:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6UNB-0008MF-KX; Fri, 24 Nov 2023 11:29:25 +0000
Received: by outflank-mailman (input) for mailman id 640569;
 Fri, 24 Nov 2023 11:29:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6UN9-0008Kn-Rz
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:29:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6UN8-0002rP-O2; Fri, 24 Nov 2023 11:29:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6UN8-00005U-Ea; Fri, 24 Nov 2023 11:29:22 +0000
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
	bh=cOrInT3L4665esap2dEtgWs9OF2aS7VYy+75vjwknC4=; b=wnh8lAxWY37h5tEZDia0ymNnRK
	IHiIjgT0MQll0p5OpA8Zwa+gm/2vEibHeFOCVrzyHQoSfrV6dC5ohC1xECkaZ5/FRgRxTPa/uiGed
	2Hx3I/QqvthMAgcx4kH7ziDjLQOKr99qmGixcNcxFAu73j01rbGoP7whogMg1szLiC7w=;
Message-ID: <e36923e2-337d-4801-8184-80867138ded2@xen.org>
Date: Fri, 24 Nov 2023 11:29:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/asm-generic: introduce generic div64.h
 header
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <13bf409f3191d066af9caef417011b6ea039dbd9.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <13bf409f3191d066af9caef417011b6ea039dbd9.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> All archs have the do_div implementation for BITS_PER_LONG == 64
> so do_div64.h is moved to asm-generic.

You are saying "all archs" but ...

> 
> x86 and PPC were switched to asm-generic version of div64.h.

... you only switch x86/PPC to div64.h.

I guess this is because for arm we have a different implementation for 
32-bits. The 64-bits version is the same as x86/PPC.

So I wonder if it is possible to include asm-generic/div64.h from 
arch/arm/include/asm/div64.h?

This will avoid duplicating some code.

Cheers,

-- 
Julien Grall

