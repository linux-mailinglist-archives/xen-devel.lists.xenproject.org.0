Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDC35802D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 12:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107130.204772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURV8-0006rZ-U8; Thu, 08 Apr 2021 10:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107130.204772; Thu, 08 Apr 2021 10:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURV8-0006rC-Qv; Thu, 08 Apr 2021 10:03:02 +0000
Received: by outflank-mailman (input) for mailman id 107130;
 Thu, 08 Apr 2021 10:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lURV6-0006r6-Fk
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 10:03:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a64de18-f741-47eb-bbe1-232a54e0f9b9;
 Thu, 08 Apr 2021 10:02:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EFC9AFCC;
 Thu,  8 Apr 2021 10:02:58 +0000 (UTC)
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
X-Inumbo-ID: 4a64de18-f741-47eb-bbe1-232a54e0f9b9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617876178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8ct3Jmpr+aHlOLuCoPj1PRJp6rEB/k9wJ4H+Phr9WU=;
	b=f/H/M5IhxmxupF1kvI4SRwhKaes7yXO28AatMkGKJ5QoRwqDmW6hU7RXO7j0UsFlqquVE7
	gezoW3C1kMaqptEsWs4d9VQ1wthiXKLra8MUpxefXXE8Qve7nc1JyahKO8Lb5LSycAp/zq
	TA03/c5iO/SViUene6kYB6EXSqlX6fg=
Subject: Re: [PATCH v2 3/3] x86: avoid building COMPAT code when !HVM && !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
 <85b6edfc-9756-9dd0-c90f-f46dc120dade@suse.com>
Message-ID: <5acec73c-27c1-80f2-fca8-bba428952016@suse.com>
Date: Thu, 8 Apr 2021 12:02:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <85b6edfc-9756-9dd0-c90f-f46dc120dade@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 16:02, Jan Beulich wrote:
> --- a/xen/include/xen/compat.h
> +++ b/xen/include/xen/compat.h
> @@ -5,10 +5,11 @@
>  #ifndef __XEN_COMPAT_H__
>  #define __XEN_COMPAT_H__
>  
> -#ifdef CONFIG_COMPAT
> -
>  #include <xen/types.h>
>  #include <asm/compat.h>
> +
> +#ifdef CONFIG_COMPAT
> +
>  #include <compat/xlat.h>
>  
>  #define __DEFINE_COMPAT_HANDLE(name, type) \

As I've just noticed this breaks the Arm build, for the lack of
asm/compat.h there. I'll be folding in the hunks below; an alternative
would be to require every arch to have a (perhaps empty) compat.h,
which seems less desirable to me.

Jan

--- unstable.orig/xen/arch/x86/Kconfig
+++ unstable/xen/arch/x86/Kconfig
@@ -9,6 +9,7 @@ config X86
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
+	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_EHCI
 	select HAS_EX_TABLE
--- unstable.orig/xen/common/Kconfig
+++ unstable/xen/common/Kconfig
@@ -25,6 +25,9 @@ config GRANT_TABLE
 config HAS_ALTERNATIVE
 	bool
 
+config HAS_COMPAT
+	bool
+
 config HAS_DEVICE_TREE
 	bool
 
--- unstable.orig/xen/include/xen/compat.h
+++ unstable/xen/include/xen/compat.h
@@ -6,7 +6,9 @@
 #define __XEN_COMPAT_H__
 
 #include <xen/types.h>
+#ifdef CONFIG_HAS_COMPAT
 #include <asm/compat.h>
+#endif
 
 #ifdef CONFIG_COMPAT
 

