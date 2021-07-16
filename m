Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59283CB345
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157057.289873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IMF-0000oe-55; Fri, 16 Jul 2021 07:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157057.289873; Fri, 16 Jul 2021 07:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IMF-0000mB-2B; Fri, 16 Jul 2021 07:34:03 +0000
Received: by outflank-mailman (input) for mailman id 157057;
 Fri, 16 Jul 2021 07:34:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m4IMD-0000m5-OD
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:34:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m4IM9-0006rO-Pf; Fri, 16 Jul 2021 07:33:57 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m4IM9-0004Ua-Ip; Fri, 16 Jul 2021 07:33:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=5xaAwP3IC9yXeEouZ/YfdS2OMY75k8DVB5cIyF7d08o=; b=N+VkwmeJo+5sB92+jHZTqguTI1
	kr3WNzBjdDpozIe9rAVVgVl5UXOuASgXOxY39cHTQvgEuMbF4e2R1GynLXwNRJYOpoidbEAMifbLg
	WkVeQwtZgAwB1FXg6K1M0OOAKNt6qj1/y9hOYEaVtid+nqdCttYzYBOMQKxcfBkt0ps0=;
Subject: Re: [PATCH v2 2/4] build: use common stubs for debugger_trap_*
 functions if !CONFIG_CRASH_DEBUG
To: Jan Beulich <jbeulich@suse.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
 <d74af998bfd8d00e57ea82ce6731ccf2afc8e95b.1626286772.git.bobby.eshleman@gmail.com>
 <b1dabca1-17ed-1f20-f95c-5113f09ea2bb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aee68d31-3eba-4316-d9c8-1a4d68d2c176@xen.org>
Date: Fri, 16 Jul 2021 08:33:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b1dabca1-17ed-1f20-f95c-5113f09ea2bb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 15/07/2021 16:18, Jan Beulich wrote:
> On 14.07.2021 22:37, Bobby Eshleman wrote:
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -16,6 +16,7 @@
>>    * GNU General Public License for more details.
>>    */
>>   
>> +#include <xen/debugger.h>
> 
> I don't think this is needed here; instead I think ...
> 
>> @@ -41,7 +42,6 @@
>>   #include <asm/acpi.h>
>>   #include <asm/cpuerrata.h>
>>   #include <asm/cpufeature.h>
>> -#include <asm/debugger.h>
> 
> ... this wants to be done in patch 1 already.

+1. I was actually going to ask in patch 1 to drop <asm/debugger.h> as 
there should be no more callers of the debugger helpers.

Cheers,

-- 
Julien Grall

