Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A026404DA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451781.709550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13RC-0000JN-3H; Fri, 02 Dec 2022 10:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451781.709550; Fri, 02 Dec 2022 10:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13RB-0000HI-VT; Fri, 02 Dec 2022 10:38:33 +0000
Received: by outflank-mailman (input) for mailman id 451781;
 Fri, 02 Dec 2022 10:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6g/C=4A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1p13RA-0000HC-Nf
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:38:33 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 721bff61-722d-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 11:38:23 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id bx10so7229261wrb.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 02:38:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003cfd64b6be1sm16259832wmo.27.2022.12.02.02.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:38:28 -0800 (PST)
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
X-Inumbo-ID: 721bff61-722d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RY4sGq6ms1+IlvCLmkZ3BI4/p6p+Ce/MbN+cfQweZ90=;
        b=pS7z7pezHrvyn5/JviuMr0kL2oOS52dkR+Wrc7O5IcpqzPyPUZ2MyuDNHDkTE1xMyh
         U9rS6SXngowOBNAzwyiOVfb0b0r6ZVAVCv74c4Bq9jH6JUlo2hB0t4FCfWlUZFrrvFZT
         NkEP/anpN433kaXL1xyZFdXDHJkFzjg53GGumb+otB1QDYZyElWDUap0eBzbhlVeIxEq
         1Wj539iyBkBRTaocfqYX9g3UJTbz1eOyco+2/lFxyUPLZzEuLwE0DFbxnaPjiiRNKKZ2
         bU0KG9fbwldlHieMr2TzRqiD1dODRuryW04UoaC56HuGGGkSyyLC8saWcBOjrKsqzMu7
         ddUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RY4sGq6ms1+IlvCLmkZ3BI4/p6p+Ce/MbN+cfQweZ90=;
        b=HzlwP5M9Vd5HI2EakuYLIQ0QVI4mn3vH1y2Vij3iDogZzrlqH+YjwKPK8LeXIkjDTd
         PZlf+xfSYd4i/77Gn6M09IlYiFUqW/26huicYvcebDN3lS55d/1+7h0tsc2ETt51VL2r
         8zYSqvbIb/9js5wcoABx1hIgnYKY8ZUPFUIVp3+q0rn1TnIV2c3Tsr5jJy6U/7Ld+v5i
         Ct21xFVZ7i9Gv1+FTXvqMqR7EPic1SQXFgaSAgqqM3mNFrzsIwbtQ/YA7DJqEdskUf+1
         Y5zaz3I6QkDfZxN1cJpWP94/TfMwD0fcm7+b0pmnnPz2Jbp/wo4TlvsN2P5H4w7mTyix
         MzPg==
X-Gm-Message-State: ANoB5pkQDl6eeVf3z2361YmJWEsw87Hnr4hr/fW/ftRb9a7zNt4GtT7T
	1/5DlQL7OoM6uPLAzvVjljj0ig==
X-Google-Smtp-Source: AA0mqf7eWXPIAFKiqlfqPTpidg+6qjtk2JWxrrXDDZf2ZR7bVc3fGCL1p2h2E5ovVnhsiqZXZ1QPOw==
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id c12-20020adffb4c000000b002365270735emr32213783wrs.659.1669977509372;
        Fri, 02 Dec 2022 02:38:29 -0800 (PST)
Message-ID: <4b143736-d5a4-ac75-3671-9566a00707af@linaro.org>
Date: Fri, 2 Dec 2022 11:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-6-vikram.garhwal@amd.com>
 <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
In-Reply-To: <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/12/22 08:19, Philippe Mathieu-Daudé wrote:
> Hi Stefano and Vikram,
> 
> On 2/12/22 03:59, Vikram Garhwal wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> This is done to prepare for enabling xenpv support for ARM architecture.
>> On ARM it is possible to have a functioning xenpv machine with only the
>> PV backends and no IOREQ server. If the IOREQ server creation fails,
>> continue to the PV backends initialization.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   include/hw/xen/xen_common.h | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
>> index 77ce17d8a4..6510ac15e0 100644
>> --- a/include/hw/xen/xen_common.h
>> +++ b/include/hw/xen/xen_common.h
>> @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
>>   {
>>   }
>> -static inline void xen_create_ioreq_server(domid_t dom,
>> -                                           ioservid_t *ioservid)
> 
> How long are we supposed to maintain this code? Per [*]:
> 
>    In general XenProject.org supports stable branches for 18 months full
>    support plus 18 months security fixes. When a new X.Y.0 release is
>    made there is usually one more release on the to-be-retired stable
>    branch to mop up any loose patches sitting in the repository at which
>    point the branch is retired.
> 
> 4.17 was just released. 4.5 was 7 years ago. IIUC EOL'ed 4 years ago.
> 
> [*] 
> https://wiki.xenproject.org/wiki/Xen_Project_Maintenance_Releases#Stable_Maintenance_Branches

+Paolo for commit 14efd8d3b5 ("meson, configure: move Xen detection to 
meson"):

     xen_libs = {
       '4.11.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 
'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
       '4.10.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 
'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
       '4.9.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 
'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
       '4.8.0': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 
'xengnttab', 'xenevtchn' ],
       '4.7.1': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 
'xengnttab', 'xenevtchn' ],
       '4.6.0': [ 'xenstore', 'xenctrl' ],
       '4.5.0': [ 'xenstore', 'xenctrl' ],
       '4.2.0': [ 'xenstore', 'xenctrl' ],
     }

According to repology for the 'xen' package:

    FreeBSD (ports):    4.16
    Debian 11:          4.14.5
    Fedora 35:          4.16.2
    Ubuntu 20.04:       4.11.3
    OpenSUSE Leap 15.3: 4.14.1
    RHEL 8:             ?


