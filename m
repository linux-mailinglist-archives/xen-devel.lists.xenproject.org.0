Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D685988F
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 19:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682630.1061710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblvh-0005kR-7g; Sun, 18 Feb 2024 18:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682630.1061710; Sun, 18 Feb 2024 18:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblvh-0005i0-54; Sun, 18 Feb 2024 18:30:21 +0000
Received: by outflank-mailman (input) for mailman id 682630;
 Sun, 18 Feb 2024 18:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rblvf-0005hs-Kj
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 18:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblve-0007lj-RC; Sun, 18 Feb 2024 18:30:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblve-00058D-JD; Sun, 18 Feb 2024 18:30:18 +0000
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
	bh=VIPeXSndfpHhbyM7Ys8RX6Ad5Aos+b5pVNznosgEkSI=; b=6I9LUDzLKFbeCtHfthsQcS59aQ
	+Ru/FgVnTgBHrAUNUlxfIJZXBFPJCGtv4OQrxwYSxvuZK+JZRI4rII9LniBQgrMWfztZh3gbmmHuX
	6H2nA9MCd/ieGJwLEeoKF+EbN3MCJeXy7LcJNo+v4c/c/2eiCQ9QekFPAqK7+BmsoYSY=;
Message-ID: <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
Date: Sun, 18 Feb 2024 18:30:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

Title: Typo s/introdure/introduce/

On 05/02/2024 15:32, Oleksii Kurochko wrote:
> The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
> so it has been moved to asm-generic.

I am not 100% convinced that moving this header to asm-generic is a good 
idea. At least for Arm, those helpers ought to be non-empty, what about 
RISC-V?

If the answer is they should be non-empty. Then I would consider to keep 
the duplication to make clear that each architecture should take their 
own decision in term of security.

The alternative, is to have a generic implementation that is safe by 
default (if that's even possible).

Cheers,

-- 
Julien Grall

