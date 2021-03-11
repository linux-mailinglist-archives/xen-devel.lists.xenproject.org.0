Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E564A336FA4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96433.182423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIJO-00026P-CP; Thu, 11 Mar 2021 10:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96433.182423; Thu, 11 Mar 2021 10:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIJO-000263-9L; Thu, 11 Mar 2021 10:12:58 +0000
Received: by outflank-mailman (input) for mailman id 96433;
 Thu, 11 Mar 2021 10:12:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lKIJM-00025y-BL
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 10:12:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKIJL-0002Xd-R3; Thu, 11 Mar 2021 10:12:55 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKIJL-00018C-Fu; Thu, 11 Mar 2021 10:12:55 +0000
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
	bh=eEyMBKpoNP9ql0m/rd4jgmK2wYuRIpoCHFEgsknSATI=; b=Cyz2rTG05EfrR7pY9fG5gqoRCM
	iFVAFggQOt7No6wJ+quCddloAosPuPbhXvGsAFsqIcCo+RhGNtkiqNnOJxq+avBZzCH3uI6hrtl/9
	FK8Kviedzjkjua0wa3YCOMKfMvzSMSRql+LWhL080L9lYqGbiNJGwBqjUVQGV3l3Ttc0=;
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
 <5bb482ff-a689-67e3-1bc7-30b9bf24034e@suse.com>
 <70193A3D-F169-41C3-96AF-D2C35ADAF1C9@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6aa28aef-1d0e-393e-a9b8-c6b24cd19eb8@xen.org>
Date: Thu, 11 Mar 2021 10:12:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <70193A3D-F169-41C3-96AF-D2C35ADAF1C9@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 09/03/2021 14:41, Bertrand Marquis wrote:
>> On 9 Mar 2021, at 12:04, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.03.2021 20:48, Julien Grall wrote:
>>> On 08/03/2021 17:18, Bertrand Marquis wrote:
>>>> --- a/xen/arch/arm/smpboot.c
>>>> +++ b/xen/arch/arm/smpboot.c
>>>> @@ -321,7 +321,8 @@ void start_secondary(void)
>>>>       if ( !opt_hmp_unsafe &&
>>>>            current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
>>>>       {
>>>> -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU MIDR (0x%x),\n"
>>>> +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not match boot "
>>>> +               "CPU MIDR (0x%"PRIregister"),\n"
>>>
>>> For printk messages, we don't tend to split it like that (even for more
>>> than 80 characters one). Instead, the preferred approach is:
>>>
>>> printk(XENLOG_ERR
>>>         "line 1\n"
>>>         "line 2\n")
>>
>> Except of course you want to repeat XENLOG_ERR for the 2nd line.

Interesting, I always thought a single XENLOG_* was enough for 
multi-line in the same printk.

> 
> Very right.
> 
> @Julien: feel free to tell me if you want a v2.

I would prefer if you resend a v2.

Cheers,

-- 
Julien Grall

