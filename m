Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBF244EA8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 21:08:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6f3J-0008R2-4K; Fri, 14 Aug 2020 19:07:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6f3H-0008Qx-EG
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 19:07:43 +0000
X-Inumbo-ID: be051d3d-d1b5-4fff-92bb-7d2736e08290
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be051d3d-d1b5-4fff-92bb-7d2736e08290;
 Fri, 14 Aug 2020 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=d4coEFbREiLyqLrCPz2GDctveE65hl68XgtykkBAs84=; b=v5KDtrSYVsKESM0YY5MDD+DgUB
 jqIv3vWpBALBLzm36mxX4N770jZMo/POPhOHseCAfNlIbd6+IHXIP5mdaM1opLmeYH74A6myKkf4l
 +7W1B96PFUV2BUo2ucaBLKa/COJldhMeYJLZ3mmlikH9AMChs/u7qkI7ed4KhJQ9L5Qo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6f3A-0004lG-2T; Fri, 14 Aug 2020 19:07:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6f39-0001mE-Ox; Fri, 14 Aug 2020 19:07:35 +0000
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
Date: Fri, 14 Aug 2020 20:07:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 31/07/2020 12:36, Jan Beulich wrote:
> On 30.07.2020 20:18, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Only a few places are actually including asm/guest_access.h. While this
>> is fine today, a follow-up patch will want to move most of the helpers
>> from asm/guest_access.h to xen/guest_access.h.
>>
>> To prepare the move, everyone should include xen/guest_access.h rather
>> than asm/guest_access.h.
>>
>> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
>> inclusion is now removed as no-one but the latter should include the
>> former.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Is there any chance you could take measures to avoid new inclusions
> of asm/guest_access.h to appear?

It should be possible.

How about this:

diff --git a/xen/include/asm-arm/guest_access.h 
b/xen/include/asm-arm/guest_access.h
index b9a89c495527..d8dbc7c973b4 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -1,3 +1,7 @@
+#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
+#error "asm/guest_access.h should not be included directly"
+#endif
+
  #ifndef __ASM_ARM_GUEST_ACCESS_H__
  #define __ASM_ARM_GUEST_ACCESS_H__

diff --git a/xen/include/asm-x86/guest_access.h 
b/xen/include/asm-x86/guest_access.h
index 369676f31ac3..e665ca3a27af 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -4,6 +4,10 @@
   * Copyright (c) 2006, K A Fraser
   */

+#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
+#error "asm/guest_access.h should not be included directly"
+#endif
+
  #ifndef __ASM_X86_GUEST_ACCESS_H__
  #define __ASM_X86_GUEST_ACCESS_H__

diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index 75103d30c8be..814e31329de9 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -7,7 +7,9 @@
  #ifndef __XEN_GUEST_ACCESS_H__
  #define __XEN_GUEST_ACCESS_H__

+#define ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
  #include <asm/guest_access.h>
+#undef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
  #include <xen/types.h>
  #include <public/xen.h>


> 
> Jan
> 

-- 
Julien Grall

