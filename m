Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686BBA748D1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 11:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930486.1333114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7QY-0003KR-6N; Fri, 28 Mar 2025 10:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930486.1333114; Fri, 28 Mar 2025 10:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7QY-0003IW-3p; Fri, 28 Mar 2025 10:59:06 +0000
Received: by outflank-mailman (input) for mailman id 930486;
 Fri, 28 Mar 2025 10:59:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ty7QX-0003IO-9E
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 10:59:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ty7QV-00DnVL-2y;
 Fri, 28 Mar 2025 10:59:03 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ty7QV-0042nd-2A;
 Fri, 28 Mar 2025 10:59:03 +0000
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
	bh=UDX0LeLOK6AvDUyBMBT+SU/sMmIwV1PizHYVad9RU98=; b=HthiTPu1MsLcAGVw5Gtu77uH+T
	7QvvV7zsuooPmwq5aHB3b7PxaX/e5K0KnAt/ad2dnKTnauPJ4h55wbYQEO9cuCa295mGTDXTo5anx
	UozukrB4Ue81unt08O2nXkxj8XtPPtyK5X9isNMNzTOyh2gvlTSX3BiVbHxzcrGSJUHs=;
Message-ID: <b0ed24c0-b763-4b8a-9ac6-cec235b1933d@xen.org>
Date: Fri, 28 Mar 2025 10:59:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/03/2025 17:33, Oleksii Kurochko wrote:
> BITS_PER_* values can be defined in a common way using compiler-provided macros.
> Thus, these definitions are moved to xen/config.h to reduce duplication across
> architectures.
> 
> Additionally, *_BYTEORDER macros are removed, as BITS_PER_* values now come
> directly from the compiler environment.
> 
> The arch_fls() implementation for Arm and PPC is updated to use BITS_PER_INT
> instead of a hardcoded value of 32.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


