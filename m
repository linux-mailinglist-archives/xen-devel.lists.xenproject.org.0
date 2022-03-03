Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE14CBD7E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283271.482251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkOb-0007cJ-FR; Thu, 03 Mar 2022 12:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283271.482251; Thu, 03 Mar 2022 12:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkOb-0007Zb-Bj; Thu, 03 Mar 2022 12:17:25 +0000
Received: by outflank-mailman (input) for mailman id 283271;
 Thu, 03 Mar 2022 12:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GC2d=TO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nPkOa-0007Yq-3M
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:17:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e01e5c4f-9aeb-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 13:17:22 +0100 (CET)
Received: from [10.10.1.173] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1646309833547340.5078068577825;
 Thu, 3 Mar 2022 04:17:13 -0800 (PST)
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
X-Inumbo-ID: e01e5c4f-9aeb-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; t=1646309837; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nJcynTWmSYZvAsiuxv4Ws2m7NzxTsleHFCtwdsF83dDh9Nfn+yoRH0zEe0L0AKqmu1N7eQ2JtIzTPKTqcK0K+IXWA2m8cOaNVn+iXVpIKkVtShoUtC7GG6eCYKjal0yw3pJtlNqbe5dzdkEfeoTgnBcG/t4bu8I6L7qkjzKq+wI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646309837; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LfVRUPgOzLNuly24GA8zsUgw508K1tcvpB9AUvDWmkU=; 
	b=KDkSrAG5p5mD/JGANnIzE8CsRr6CVGbDoMV9fD0TQ+fcYCqz6WbQEWW0/acC8yAc60MlLVX8MKhH/xQ5AxFYCVen3F1zoEMBG/sGxz8GWaBm0K1Aj6Qh/oTGPCH/2sKtJjTYkMp/po27ESAtcrKAMkxSLL8ct7k2MHekByJPmUg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646309837;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LfVRUPgOzLNuly24GA8zsUgw508K1tcvpB9AUvDWmkU=;
	b=XSvQ2f2a1ExivFZndRLkBqF79iBpufkfP8+5If/J9gGomnAibaq+3PzRc8aN9yzG
	h3mtYH9n2BPJCHEDmgYy/fhscr/cKaWZ8LfWiYTPfBZxxpMNpkjg4W4PFz0T+f6fzXZ
	okFc9yPLYFv/8KzqOLjvjnRnleM8jXhm0HPzR9+s=
Message-ID: <b6a19025-ed0b-1698-b46f-0ff726254e96@apertussolutions.com>
Date: Thu, 3 Mar 2022 07:16:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] x86/tboot: adjust Kconfig default
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>
References: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
 <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
 <9d57dc89-779b-aa91-519d-3e4cfc05ef94@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9d57dc89-779b-aa91-519d-3e4cfc05ef94@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 3/3/22 07:03, Jan Beulich wrote:
> On 03.03.2022 12:50, Daniel P. Smith wrote:
>> On 3/3/22 04:49, Jan Beulich wrote:
>>> We shouldn't include unsupported code by default, with not even a means
>>> for its building to be disabled. Convert the dependency from merely
>>> affecting the prompt's visibility to a real one.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> We could of course go further and make the default also account for
>>> DEBUG, as is done elsewhere.
>>
>> As in you would like to adjust the default based on whether DEBUG is on
>> or not? I guess my question is what motivation is there to adjust this
>> selection if DEBUG is enabled or disabled?
> 
> This is to have functionality enabled unless overridden in debug builds.

Maybe I am misunderstanding you. If I am wanting to debug either TXT or 
a configuration with TXT on and I adjust my config to turn on debug, 
then I would have to go turn TXT back on. Is that correct? If that is 
the correct understanding, honestly that concerns me because if that is 
being done for other config options, it would create the situation where 
turning on debug to track down an issue would result in a different 
configuration than the one I was experiencing the issue.

>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -193,14 +193,15 @@ config HVM_FEP
>>>    	  If unsure, say N.
>>>    
>>>    config TBOOT
>>> -	bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
>>> -	default y if !PV_SHIM_EXCLUSIVE
>>> +	bool "Xen tboot support (UNSUPPORTED)"
>>> +	depends on UNSUPPORTED
>>> +	default !PV_SHIM_EXCLUSIVE
>>>    	select CRYPTO
>>>    	---help---
>>>    	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
>>>    	  Technology (TXT)
>>>    
>>> -	  If unsure, say Y.
>>> +	  If unsure, stay with the default.
>>>    
>>>    choice
>>>    	prompt "Alignment of Xen image"
>>>
>>
>> Outside of the debug question, I think the proposed change is good.
>>
>> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>
> 
> Thanks. I guess there's an 'o' missing though in the email address?
Apologies for that, correct I missed the 'o' as I was typing it out.

v/r,
dps

