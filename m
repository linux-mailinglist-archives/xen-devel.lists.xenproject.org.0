Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB498014DA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645762.1008079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AYl-0004gD-TA; Fri, 01 Dec 2023 20:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645762.1008079; Fri, 01 Dec 2023 20:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AYl-0004dH-Q3; Fri, 01 Dec 2023 20:56:27 +0000
Received: by outflank-mailman (input) for mailman id 645762;
 Fri, 01 Dec 2023 20:56:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r9AYk-0004dB-UU
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:56:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9AYk-0000L7-6J; Fri, 01 Dec 2023 20:56:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9AYj-0006Qj-W2; Fri, 01 Dec 2023 20:56:26 +0000
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
	bh=NQLaIwUZPorgLBX9VVZGLxq9mqY+hCwMWWoudaGWMYc=; b=m+DAylLBkdiVNBQDd8f0fFZ524
	EOr0dUYLBE1Qd4bia5okL55/D4DwTdxcHqPgFru4Fw8JrDqVNzJvmxTUXhP26BxnFmevvBUZ6v9aj
	aC5Ltu9+ufyIHV/ylNPlXwMVT/ME0SDnjPF2MJAPsFAujv7578aHH/7FKjzjmQJGV8cs=;
Message-ID: <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
Date: Fri, 1 Dec 2023 20:56:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Arm and RISC-V folks)

Hi Shawn,

On 01/12/2023 20:59, Shawn Anastasio wrote:
> Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
> allocator. Routines for parsing arm-specific devicetree nodes (e.g.
> multiboot) were excluded, reducing the overall footprint of code that
> was copied.

I expect RISC-V to want similar code. I am not really thrilled in the 
idea of having 3 similar copy of the parsing. So can we extract the 
common bits (or harmonize it) so it can be shared?

Maybe Oleksii has already a version doing that.

Cheers,

-- 
Julien Grall

