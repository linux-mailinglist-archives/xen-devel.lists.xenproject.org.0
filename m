Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499081BECA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 20:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659112.1028560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGONZ-0006Ye-D8; Thu, 21 Dec 2023 19:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659112.1028560; Thu, 21 Dec 2023 19:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGONZ-0006Wm-AS; Thu, 21 Dec 2023 19:06:45 +0000
Received: by outflank-mailman (input) for mailman id 659112;
 Thu, 21 Dec 2023 19:06:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rGONX-0006Wb-Fq
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 19:06:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGONV-0007dT-UY; Thu, 21 Dec 2023 19:06:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGONV-0006Me-Nf; Thu, 21 Dec 2023 19:06:41 +0000
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
	bh=9BD5rZQiOQcUUWSBqPEZi/mOni8msE/1VkCn4GBnrOY=; b=2hcHHYVQvubHc8aClqkqlseOpF
	mv/LxZkj76X/N78Wo59Z+G6Uc862Vf7vhMxq9v6nFsr1ty1iXQEw7gRIcUU4QT9WE9LqoGSUrhfE7
	3HGv6ioCb+uMbqmwVoYwFhPurMOoLLlx78IwCm69mYsHsCsvMNiOSn+7JWMnqIPrImY0=;
Message-ID: <47a68787-cf33-4c5e-a644-97404243783d@xen.org>
Date: Thu, 21 Dec 2023 19:06:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] xen/asm-generic: introduce generic div64.h header
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
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <d39a9a56ff37b7e67bcedd163449e0a8f5c5df9a.1703072575.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d39a9a56ff37b7e67bcedd163449e0a8f5c5df9a.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 20/12/2023 14:08, Oleksii Kurochko wrote:
> All archs have the do_div implementation for BITS_PER_LONG == 64
> so do_div64.h is moved to asm-generic.
> 
> x86 and PPC were switched to asm-generic version of div64.h.
> Arm was switched partly because Arm has different implementation
> for 32-bits.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

