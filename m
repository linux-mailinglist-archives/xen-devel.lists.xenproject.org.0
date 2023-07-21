Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB975C298
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 11:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567436.886479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm8z-0003Hj-4s; Fri, 21 Jul 2023 09:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567436.886479; Fri, 21 Jul 2023 09:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm8z-0003G5-1X; Fri, 21 Jul 2023 09:09:49 +0000
Received: by outflank-mailman (input) for mailman id 567436;
 Fri, 21 Jul 2023 09:09:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMm8x-0003Fz-5r
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 09:09:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMm8w-0008In-GL; Fri, 21 Jul 2023 09:09:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMm8w-00053f-B8; Fri, 21 Jul 2023 09:09:46 +0000
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
	bh=9Ol14zLqlx7f7FBIzYEiAmk9nVB+uWh+dsHEbR1RS84=; b=iPex2d5PTb5Vm6PtFxbHf11olO
	LMNYrrufNsl1HSc5lHhS/hLGZRgOAG8igBYRgYrW0GR+OYmuAbKLTNQ10QHU9jTIGVlceqJ9N/cCp
	wq/S9Xlm4OmiUyfElcV3TyPwkvdkoBGD6oLzFAdwBmUpgxyjw5Vko+x01x2OjX3InCpQ=;
Message-ID: <b5dc0491-57b7-6899-28ce-86f932b1fc3a@xen.org>
Date: Fri, 21 Jul 2023 10:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <fa58a361-939c-6114-263f-0640156c235b@xen.org>
 <9E2CA0D9-1D1C-439B-BD81-8F4A80D034BD@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9E2CA0D9-1D1C-439B-BD81-8F4A80D034BD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 21/07/2023 10:07, Bertrand Marquis wrote:
>> On 21 Jul 2023, at 10:52, Julien Grall <julien@xen.org> wrote:
>>> +
>>>   config OPTEE
>>> - bool "Enable OP-TEE mediator"
>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>
>> Given this is under 'TEE mediators', do we still need the 'if UNSUPPORTED'?
> 
> As explained to Jan, i used visible if which does not enforce the dependency, just a hint for the display.
> 
> I thought that it was clearer to keep things like that to make it easier to have one of them supported in the future and i added the visible if just so that there was not an empty menu.

Indeed.

> 
> I could also just use a
> if UNSUPPORTED
>   ...
> 
> endif
> 
> to surround everything if that is clearer.
> Please tell me and i will push a v2.

I am happy with the existing version.

Cheers,

-- 
Julien Grall

