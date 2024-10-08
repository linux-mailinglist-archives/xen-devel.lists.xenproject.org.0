Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE3D9953FF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813299.1226180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCh4-0007Sf-UP; Tue, 08 Oct 2024 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813299.1226180; Tue, 08 Oct 2024 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCh4-0007PT-RQ; Tue, 08 Oct 2024 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 813299;
 Tue, 08 Oct 2024 16:04:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1syCh3-0007PN-U9
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:04:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syCh3-0005VB-Dd; Tue, 08 Oct 2024 16:04:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syCh3-0003Hk-89; Tue, 08 Oct 2024 16:04:13 +0000
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
	bh=wcF1gjhpLs59mNcfajJ5pB7YlhEWMmrTXkmxK7u8E2Q=; b=lSwWWQCkYuVbJswN9ogvWplv7f
	rEkFEvEFNihg3GKDHYPAzZjsS52IbYXKe0NRGNtS2msjVmkNgZsTEn/RSZVXLPwZ4JTfjzyR0+UlM
	NiWBK9J5hpcHdSTT6gnSnO39SQun3dBeX7Q33rx+Psi4q+EU9YHeHxg6DsZdLxNIjU+A=;
Message-ID: <f50873b5-250e-4a56-8e8b-bfc70ef733b3@xen.org>
Date: Tue, 8 Oct 2024 17:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] types: replace remaining uses of s64
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <cfaf8df7-e78e-46be-b6d4-499dd96e0f66@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cfaf8df7-e78e-46be-b6d4-499dd96e0f66@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/10/2024 15:56, Jan Beulich wrote:
> ... and move the type itself to linux-compat.h. An exception being
> arch/arm/arm64/cpufeature.c and arch/arm/include/asm/arm64/cpufeature.h,
> which are to use linux-compat.h instead (the former by including the
> latter).
> 
> While doing so
> - correct the type of union uu's uq field in lib/divmod.c,
> - switch a few adjacent types as well, for (a little bit of)
>    consistency.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


