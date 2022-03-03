Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D264CBD24
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283230.482189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjz4-0002Pp-SS; Thu, 03 Mar 2022 11:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283230.482189; Thu, 03 Mar 2022 11:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjz4-0002N4-PM; Thu, 03 Mar 2022 11:51:02 +0000
Received: by outflank-mailman (input) for mailman id 283230;
 Thu, 03 Mar 2022 11:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GC2d=TO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nPjz2-0002My-Na
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:51:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ea29967-9ae8-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:50:56 +0100 (CET)
Received: from [10.10.1.173] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1646308246131700.8671073204542;
 Thu, 3 Mar 2022 03:50:46 -0800 (PST)
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
X-Inumbo-ID: 2ea29967-9ae8-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; t=1646308250; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MeeCbcKzjaM0FR3yn8mr4Nut+EeM5sEQeZ7pQdu5HDNltHWWBQ6MduG9VGc/WJL4fopVYnHJd64P7fr39hq23K3/cnVjm6T54LghbVlJgmY2hScNUqZYtqEYlo1OUXad7o/Fd9fDFqU9IE7MW/SkeRa4xzv2XAoCIwhsJtB7uL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646308250; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=u1ipkWFozDh9LOJ4TpEVmQcDvF1/FctYY95E7PwvFY4=; 
	b=ek7FS/yWcs3EnXpr1zCmxp2Q2+9eE4aTS4Tuq65BcyjqbXsvY7t8DMD1oS/7Ydl9pAy6KQzHHBvY5nTkvdjrur1oEPlrZz18oRXdUF0Y7DEUL9lgtveKWi4wQH7QjxlVDNZoEBsF2hTm1H+/9HwAfohKox2A0sTWQsJh0LskCBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646308250;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u1ipkWFozDh9LOJ4TpEVmQcDvF1/FctYY95E7PwvFY4=;
	b=AD9Fu3LYZQgCVmtjQ6B3R8SlCHL2Kr2hKXlliiEVO2vLNjyrDeCzXTmbpaSOWuqI
	T1LvEeGZ2YhAlKSnh6AZinqsWDQ5JsFbA6Mvg7sSjNdYzJHsmpsehqGFKki/S39LdjA
	PtRYxvK0czGXzAXPjfFt1vcC842svXG7uvUi71Bs=
Message-ID: <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
Date: Thu, 3 Mar 2022 06:50:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] x86/tboot: adjust Kconfig default
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>
References: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/3/22 04:49, Jan Beulich wrote:
> We shouldn't include unsupported code by default, with not even a means
> for its building to be disabled. Convert the dependency from merely
> affecting the prompt's visibility to a real one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> We could of course go further and make the default also account for
> DEBUG, as is done elsewhere.

As in you would like to adjust the default based on whether DEBUG is on 
or not? I guess my question is what motivation is there to adjust this 
selection if DEBUG is enabled or disabled?

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -193,14 +193,15 @@ config HVM_FEP
>   	  If unsure, say N.
>   
>   config TBOOT
> -	bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
> -	default y if !PV_SHIM_EXCLUSIVE
> +	bool "Xen tboot support (UNSUPPORTED)"
> +	depends on UNSUPPORTED
> +	default !PV_SHIM_EXCLUSIVE
>   	select CRYPTO
>   	---help---
>   	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
>   	  Technology (TXT)
>   
> -	  If unsure, say Y.
> +	  If unsure, stay with the default.
>   
>   choice
>   	prompt "Alignment of Xen image"
> 

Outside of the debug question, I think the proposed change is good.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>

