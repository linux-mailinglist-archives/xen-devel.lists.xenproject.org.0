Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D0303E26
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74981.134866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4O5T-00066M-Fp; Tue, 26 Jan 2021 13:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74981.134866; Tue, 26 Jan 2021 13:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4O5T-00065x-CZ; Tue, 26 Jan 2021 13:08:51 +0000
Received: by outflank-mailman (input) for mailman id 74981;
 Tue, 26 Jan 2021 13:08:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4O5S-00065s-FC
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:08:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2de562bc-520d-490b-9e32-464dd985e80f;
 Tue, 26 Jan 2021 13:08:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80E19B7CF;
 Tue, 26 Jan 2021 13:08:47 +0000 (UTC)
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
X-Inumbo-ID: 2de562bc-520d-490b-9e32-464dd985e80f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611666527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XVEIA79zfIPTpgpvnsljOXHm99u4paNujDnPvpaQcQ=;
	b=uZGy8Zoew9n+5FFAm/fBYlMvbGzw3FB3KcbmHQf2WBnyuxQTpb5N8K97wFGCEgVZ7Kv83t
	ld3vh5JgrLSOzHC1kKvxCI/qrbPp+vNzUlwLsd1/H2K799EFgZIpn2F2xvE6wse/SRVd9R
	DGBFvHSIR5BCTTAOIzenOALNLviTQx8=
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "julien@xen.org"
 <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
 <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
 <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
 <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
Date: Tue, 26 Jan 2021 14:08:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 12:17, Bertrand Marquis wrote:
> 
> 
>> On 26 Jan 2021, at 11:11, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.01.2021 12:06, Bertrand Marquis wrote:
>>>> On 26 Jan 2021, at 09:22, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 25.01.2021 22:27, Stefano Stabellini wrote:
>>>>> @@ -77,7 +77,7 @@ config SBSA_VUART_CONSOLE
>>>>> 	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>>>>
>>>>> config ARM_SSBD
>>>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>>>> +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
>>>>> 	depends on HAS_ALTERNATIVE
>>>>> 	default y
>>>>> 	help
>>>>> @@ -87,7 +87,7 @@ config ARM_SSBD
>>>>> 	  If unsure, say Y.
>>>>>
>>>>> config HARDEN_BRANCH_PREDICTOR
>>>>> -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
>>>>> +	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
>>>>> 	default y
>>>>> 	help
>>>>> 	  Speculation attacks against some high-performance processors rely on
>>>>
>>>> Both of these default to y and have their _prompt_
>>>> conditional upon EXPERT. Which means only an expert can turn them
>>>> _off_. Which doesn't make it look like these are unsupported? Or
>>>> if anything, turning them off is unsupported?
>>>
>>> ...You could see that as EXPERT/UNSUPPORTED options can only be
>>> “modified” from their default value if EXPERT/UNSUPPORTED is activated.
>>
>> But this is nothing you can recognize when configuring Xen
>> (i.e. seeing just these prompts).
> 
> Maybe something we could explain more clearly in the UNSUPPORTED/EXPERT
> config parameters instead ?
> We could also make that more clear in the help of such parameters directly.
> 
> I do not see how we could make that more clear directly in the prompt (as
> making it too long is not a good solution).

My main request is that such tags be added only if there's
absolutely no ambiguity. Anything else (requiring longer
explanations in many cases) should be expressed in the help
text of the option, or in yet other ways (a referral to
SUPPORT.md comes to mind).

Jan

