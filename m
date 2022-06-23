Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D485579F8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354894.582244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Lay-0001C1-Qs; Thu, 23 Jun 2022 12:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354894.582244; Thu, 23 Jun 2022 12:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Lay-0001A1-Nw; Thu, 23 Jun 2022 12:06:00 +0000
Received: by outflank-mailman (input) for mailman id 354894;
 Thu, 23 Jun 2022 12:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Gci=W6=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o4Law-00019v-V5
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:05:59 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7146953-f2ec-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 14:05:58 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id q15so10908095wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jun 2022 05:05:57 -0700 (PDT)
Received: from [192.168.1.10] (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c421500b003a018e43df2sm2750929wmh.34.2022.06.23.05.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 05:05:56 -0700 (PDT)
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
X-Inumbo-ID: d7146953-f2ec-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9jHRei8fvZH9aQYctgaO8oyO8JOm1ysfYdmqK4TNSsg=;
        b=luJQU+yMu44aK8sxODvURw5h9gpq6XH4A80Js0m5LWMFq1mm6jWiMDZmu1IYOwQRk9
         GDyt5fPjSQjt+sqz3d49yw/aWPUTWIB3enBij0MAEcgFyGXnanM+soc1/Y9mLTLTRi/P
         u0g/YBBagZof5ePJCjN0UsOoFP0ujZ9Zitcj2cGGiejyFOLoevNERMmC6Qu4NeQpoKRZ
         BFmtkaGTDSF65JSq6S2NMPKyL143C2z9A393iHjiRFJm0omdL6+svQ19GYIgJI81v82/
         32lt/r6EyhFpg989gts5AFUiGhuMdC8qCry4yfi347XlK8kaemfpYRgaFbwMvr3oCQxC
         dGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9jHRei8fvZH9aQYctgaO8oyO8JOm1ysfYdmqK4TNSsg=;
        b=7St5nn2gFVbZ+KwA5oFK3Z5apJ8UuZVfk3d5HJrQeZik27NfImIaYAcNVLVQVyiOy8
         1BBtP5NaLthN4QqLxw5E9X/1HD+G39lD73cW4RETGtRPk6R9TilU6MNfhLm8OwYu5ed6
         mzPjkCzF9YAaUc01bRop1oA8FDdb8xUuS8cXwRvHv1BB7rYPU0qmdx/mnECSgELEaxof
         qwCySTCrg8MfxO0MIUkr7N309/kdZA+MSN9qRz7H/BK09IPKYyM+3A50P735RhRdFXqb
         IuaTTx28xrnwSI4bIm3beCsHvpcPjWjbEIvS9fAWkyovuKolWdqlGbHjfttkXERxwibt
         SOiA==
X-Gm-Message-State: AJIora9gtflwd1b3DYHeD7fkdTvDfylGidm0s8vjn2ISzMunbezvO6Hb
	uy2oPxcnXmqRYvM61qnT0kQ=
X-Google-Smtp-Source: AGRyM1sOyQXRSomUIbdzerMi0mofgiS8GpxlbJoS1nWYbVJNmJOfdTO4MnDbIbhbkRjqCQlHkcjESA==
X-Received: by 2002:a7b:c242:0:b0:3a0:1acc:4893 with SMTP id b2-20020a7bc242000000b003a01acc4893mr3975376wmj.66.1655985957242;
        Thu, 23 Jun 2022 05:05:57 -0700 (PDT)
Message-ID: <96c919fe-dba1-d1c4-10e9-b73800f96cea@gmail.com>
Date: Thu, 23 Jun 2022 15:05:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Viryaos-discuss] [ImageBuilder] [PATCH 2/2] uboot-script-gen:
 Enable direct mapping of statically allocated memory
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220619124316.378365-1-burzalodowa@gmail.com>
 <20220619124316.378365-2-burzalodowa@gmail.com>
 <5cd7ee29-d43a-1302-0a0b-6b4c339a96da@amd.com>
 <797bf441-9d7a-7eb8-4e90-787398acf726@amd.com>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <797bf441-9d7a-7eb8-4e90-787398acf726@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan!

On 6/23/22 13:02, Ayan Kumar Halder wrote:
> (Resending mail, as the previous delivery failed)
>
> On 21/06/2022 12:34, Ayan Kumar Halder wrote:
>> Hi,
>>
>> On 19/06/2022 13:43, Xenia Ragiadakou wrote:
>>> Direct mapping for dom0less VMs is disabled by default in XEN and 
>>> can be
>>> enabled through the 'direct-map' property.
>>> Add a new config parameter DOMU_DIRECT_MAP to be able to enable or 
>>> disable
>>> direct mapping, i.e set to 1 for enabling and to 0 for disabling.
>>> This parameter is optional. Direct mapping is enabled by default for 
>>> all
>>> dom0less VMs with static allocation.
>>>
>>> The property 'direct-map' is a boolean property. Boolean properties 
>>> are true
>>> if present and false if missing.
>>> Add a new data_type 'bool' in function dt_set() to setup a boolean 
>>> property.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>>   README.md                |  4 ++++
>>>   scripts/uboot-script-gen | 18 ++++++++++++++++++
>>>   2 files changed, 22 insertions(+)
>>>
>>> diff --git a/README.md b/README.md
>>> index c52e4b9..17ff206 100644
>>> --- a/README.md
>>> +++ b/README.md
>>> @@ -168,6 +168,10 @@ Where:
>>>     if specified, indicates the host physical address regions
>>>     [baseaddr, baseaddr + size) to be reserved to the VM for static 
>>> allocation.
>>>   +- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>>> +  If set to 1, the VM is direct mapped. The default is 1.
>>> +  This is only applicable when DOMU_STATIC_MEM is specified.
>>
>> Can't we just use $DOMU_STATIC_MEM to set "direct-map" in dts ?
>>
>> Is there a valid use-case for static allocation without direct 
>> mapping ? Sorry, it is not very clear to me.
>>
Thank you for taking the time to review the patch!

I agree with you that static allocation without direct mapping is not a 
common configuration, that's why, in the script, direct mapping is 
enabled by default.

My reasoning was that, since direct mapping is not enabled by default in 
XEN for all domUs with static allocation but instead requires the 
'direct-map' property to be present in the domU dt node, then such a 
configuration is still valid.
I thought that with this parameter it is much easier to setup (and test) 
both configurations.


Xenia


