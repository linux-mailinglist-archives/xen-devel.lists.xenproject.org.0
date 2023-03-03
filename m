Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8336A91C6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 08:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505580.778430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzy0-0006Ze-Gk; Fri, 03 Mar 2023 07:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505580.778430; Fri, 03 Mar 2023 07:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzy0-0006Xl-Cl; Fri, 03 Mar 2023 07:36:36 +0000
Received: by outflank-mailman (input) for mailman id 505580;
 Fri, 03 Mar 2023 07:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M2mb=63=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pXzxy-0006Xf-JK
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 07:36:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6ad1ef-b996-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 08:36:32 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-jdpySTYRMCSgj7QZiCCVTw-1; Fri, 03 Mar 2023 02:36:26 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so598879wms.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 23:36:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm1378189wrx.12.2023.03.02.23.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:36:24 -0800 (PST)
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
X-Inumbo-ID: 1d6ad1ef-b996-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677828990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
	b=Mz5DtgHIOv5fkvLbpWpASosPqxMU2rCztWRkuXRgmUIM2pUua8beGIkEKBztkjIoo9x4Wq
	Pn21opSNlLfcgu4iIK0LZnXWQ37WIOrtolSQus9YVLe2TewtQsvUkC4gVHMcHfBC82saGy
	HhHLgj83iYZAsRiFGevFBHI1RIPl1QQ=
X-MC-Unique: jdpySTYRMCSgj7QZiCCVTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
        b=B8PL3R5U1ArvTDNs0BtxgragD3hSYak02LBce0o3Vv4GZ6ifKZHWUJHJeSkYzXhFC0
         KmqVvZDefKSYBDdxS/8XDiXnOgURt3opOw7MgATMAu2aCc8aEIG9tdfRg6YPMNLq+AZd
         q2714n8o92hlvX2B0qekCXgOOmeUJ7sZDYBFaJ9NjtLrWCSC91ZGnec4dV5sOjG75eCw
         AP5QKagdHJBN5ZXEYRiFrIZlYexU9w1z0zi14WBcct/NSHwGJG/VxzI1FDIxqwAfb9f6
         vDH9qmrUHIsI7C4h5g8p7RVddKGv+3WBD3Mds2U0kkBn/ZkK0EnhmgKaDUCn5XXaRSjY
         vC9A==
X-Gm-Message-State: AO0yUKXlW03kqROekaiYSNydBTq7R3MzviRGAB8tTTj+FKXbeLqEZiVQ
	bxquQXJcc2qExiLo5R2SMDmljmxWsVCLjZ8jAqvETEFKXpCOsrSRa1Vz287gAkvmgOi2mEkgwMH
	YfKK7NZ+jh74KxGJzoOgUpONizrg=
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id g4-20020a5d5544000000b0024218097e17mr786028wrw.6.1677828985659;
        Thu, 02 Mar 2023 23:36:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9cVmsT0uaOjLpyfGRqzmsceoSUEMI//iNaoUptBCRvsgzqA+n1h2dF2/JHs3Sf1sqcgq/pNg==
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id g4-20020a5d5544000000b0024218097e17mr786014wrw.6.1677828985284;
        Thu, 02 Mar 2023 23:36:25 -0800 (PST)
Message-ID: <29a8a698-b056-714a-3a94-c591e5b55c44@redhat.com>
Date: Fri, 3 Mar 2023 08:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/03/2023 23.16, Philippe Mathieu-Daudé wrote:
> On 2/3/23 17:31, Thomas Huth wrote:
>> qemu-system-aarch64 is a proper superset of qemu-system-arm,
>> and the latter was mainly still required for 32-bit KVM support.
>> But this 32-bit KVM arm support has been dropped in the Linux
>> kernel a couple of years ago already, so we don't really need
>> qemu-system-arm anymore, thus deprecated it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index a30aa8dfdf..21ce70b5c9 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, 
>> including KVM support
>>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>>   to use the ``qemu-system-x86_64`` binary instead.
>> +``qemu-system-arm`` binary (since 8.0)
>> +''''''''''''''''''''''''''''''''''''''
>> +
>> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
>> +latter was mainly a requirement for running KVM on 32-bit arm hosts, but
>> +this 32-bit KVM support has been removed some years ago already (see:
> 
> s/some/few/?

I can also use "three years ago" since the patch had been merged in March 2020.

>> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4 
>>
>> +). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
>> +future release. Use ``qemu-system-aarch64`` instead.
> 
> If we unify, wouldn't it be simpler to name the single qemu-system
> binary emulating various ARM architectures as 'qemu-system-arm'?

That would be more intuitive for people who are completely new to QEMU, but 
I guess it will cause a lot of "you broke my script that uses the -aarch64 
binary" troubles again. So I think it's likely better to not go down that road.

  Thomas


