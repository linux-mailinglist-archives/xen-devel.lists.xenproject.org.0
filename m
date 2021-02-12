Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670431A24B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 17:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84358.158198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaw0-0004hU-JD; Fri, 12 Feb 2021 16:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84358.158198; Fri, 12 Feb 2021 16:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaw0-0004h5-Fm; Fri, 12 Feb 2021 16:04:44 +0000
Received: by outflank-mailman (input) for mailman id 84358;
 Fri, 12 Feb 2021 16:04:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDps=HO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAavz-0004h0-4p
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 16:04:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e3c1277-d2ac-4405-95cc-f2f6a5f1036c;
 Fri, 12 Feb 2021 16:04:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D2A2AD29;
 Fri, 12 Feb 2021 16:04:41 +0000 (UTC)
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
X-Inumbo-ID: 5e3c1277-d2ac-4405-95cc-f2f6a5f1036c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613145881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hw8Go3FxPM3rNPpPAh6+TMrhXG8uCHjrpH86/xDkyKo=;
	b=JV+UoQqKlwJPUV7J1JLrbdXE7epIdvgACTfTToq8IsaGCnNnWTQjsQZGQQuQJj1GiXeUjP
	hmUFjQihqDME5XkpOSjOVeT3//VDt1GCwXdnmfFUrjmSucI2tgRJeqUMF+ZbCneEzaLMIx
	gQ6PIeEF0W0TeCRpJooK8hahO12eENA=
Subject: Re: [PATCH 07/10] tools: Use -Og for debug builds when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04c93a14-ee95-e4a6-33b9-f80fcd03a010@suse.com>
Date: Fri, 12 Feb 2021 17:04:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212153953.4582-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.02.2021 16:39, Andrew Cooper wrote:
> The recommended optimisation level for debugging is -Og, and is what tools
> such as gdb prefer.  In practice, it equates to -01 with a few specific
> optimisations turned off.
> 
> abi-dumper in particular wants the libraries it inspects in this form.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -106,8 +106,9 @@ endif
>  CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
>  
>  ifeq ($(debug),y)
> -# Disable optimizations
> -CFLAGS += -O0 -fno-omit-frame-pointer
> +# Use -Og if available, -O0 otherwise
> +dbg_opt_level := $(call cc-option,$(CC),-Og,-O0)
> +CFLAGS += $(dbg_opt_level) -fno-omit-frame-pointer

I wonder if we shouldn't do something similar for the hypervisor,
where we use -O1 for debug builds right now. At least when
DEBUG_INFO is also enabled, -Og may be better.

Jan

