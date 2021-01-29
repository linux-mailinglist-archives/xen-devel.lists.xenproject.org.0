Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59B308A1F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78271.142311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WIe-0005RY-NU; Fri, 29 Jan 2021 16:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78271.142311; Fri, 29 Jan 2021 16:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WIe-0005R8-Jn; Fri, 29 Jan 2021 16:07:08 +0000
Received: by outflank-mailman (input) for mailman id 78271;
 Fri, 29 Jan 2021 16:07:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5WId-0005R3-09
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:07:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5WI5-0001H0-Dq; Fri, 29 Jan 2021 16:06:33 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5WI5-0002WD-4R; Fri, 29 Jan 2021 16:06:33 +0000
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
	bh=vBdScwN7nnnjPTqy5a398AjGZ8kp0vKSCmBPql5+fQk=; b=CwbZXpubwm5py2Zn6fkZ0v5aRu
	FdmEc3yUqmtHgq9ymUDk59AcEDY7f3p//uxKsODAQlGQbmtXNlZ55BoI6BkRWBjy5tap3Pec09Ne5
	/SzfYpXaHhgRL+ZIna+i08DVpehmkqb6wx9DAft9E+Mhm9BoZj5YyCDSk5IhtG6LViG4=;
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr <olekstysh@gmail.com>, Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
 <9b21efce-42c9-1bdd-e97b-342dd6130620@suse.com>
 <e096c7ad-f206-2773-c4f4-ed3071251cbc@gmail.com>
 <f2888729-d135-ac10-96e9-02bfd11b104e@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fd7f1289-04a1-0f50-fdaa-841ef1fcbbcf@xen.org>
Date: Fri, 29 Jan 2021 16:06:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f2888729-d135-ac10-96e9-02bfd11b104e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 29/01/2021 11:06, Oleksandr wrote:
> On 29.01.21 12:51, Oleksandr wrote:
>>
>> On 29.01.21 10:49, Jan Beulich wrote:
>>
>> Hi Jan
>>
>>> On 29.01.2021 09:13, Wei Chen wrote:
>>>> I just tested the v6 and the latest backend service with the latest 
>>>> staging branch.
>>>> They work well.
>>>>
>>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>> An faod this was again Arm-only testing?
>> Yes, unfortunately I don't have a possibility to test on x86, if I had 
>> I would definitely perform testing.
>> I performed code analysis (the diff between V5 and V6 is small enough 
>> and these changes unlikely will add regression, so I was thinking that 
>> if basic x86 test passed on V5 (thanks to Julien) than it would likely 
>> pass on V6 as well),
>> but please don't get me wrong, I *completely* agree that even an 
>> obvious single patch must be tested.
>>
>>
> What worries me the most is:
> 
>  >>> Unfortunately, I don't have a Windows VM in hand, so I can't 
> confirm if
>  >>> there is no regression there. Can anyone give a try?
> 
> I am sorry, but would it be possible to make sure that current series 
> doesn't break that use-case? Or this could be tested (and fixed if there 
> is a need) after the feature freeze?
With Ian's help, I used Osstest to run a Windows job with your branch 
(see [1]).

The branch used is rebase version because there was a building issue 
with Mini-OS on your baseline (it is already fixed upstream).

The result are the same as the latest run with staging (see [2]). So 
there is no regression with your series applied!

I will go through the series one last time and then commit it.

Cheers,

[1] http://logs.test-lab.xenproject.org/osstest/logs/158785/
[2] 
http://logs.test-lab.xenproject.org/osstest/logs/158719/test-amd64-amd64-xl-qemuu-win7-amd64/info.html


> 
> 

-- 
Julien Grall

