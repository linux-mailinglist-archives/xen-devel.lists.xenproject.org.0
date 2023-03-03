Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16226A9652
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505906.778904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3dh-0004HQ-M4; Fri, 03 Mar 2023 11:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505906.778904; Fri, 03 Mar 2023 11:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3dh-0004Ea-Id; Fri, 03 Mar 2023 11:31:53 +0000
Received: by outflank-mailman (input) for mailman id 505906;
 Fri, 03 Mar 2023 11:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M2mb=63=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pY3dg-0004EU-MU
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:31:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9f1370-b9b6-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 12:31:50 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-jLUjtX5yPh2MxVXnRW05Yw-1; Fri, 03 Mar 2023 06:31:45 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so2694581wmj.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 03:31:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c71dd1109fsm1926497wrw.47.2023.03.03.03.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:31:43 -0800 (PST)
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
X-Inumbo-ID: fc9f1370-b9b6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677843109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
	b=haedgvwHixgBd4QbiLhf8dlrGqsfyhXYdgC/b4m+G6wuC/o7Bsaz3YjEPRwpp4hf7IcykY
	hnFYtjY63wCsEsUosWP5OsiR1zo3MVvD/hzrPRTuSO0e9Kxe7o9duWh4SIJPYS0tNsUjFD
	SS8SWPpHNJOwv2dkz+YofhO8HuAOG1U=
X-MC-Unique: jLUjtX5yPh2MxVXnRW05Yw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
        b=qLu808s7VatGryId0rDVFuQGARdCGrw1KY6A/58/On54afIH19PBSEoD/2kmg0mMV9
         oGQ/6HwYEjzmvZpMyQ1Z5wYWnUbtSStTDsO9RQ1j8I1IBLeSfllFBH6c4vFOvjHY1PXA
         EUyHXGxwHxEfh0nfLcqVBHKORko7RPVudIa5SKxNoJZEWAdf+upuK1GPqQie5W2oBoU3
         RQUbtOLei/RkZt3D1FtoCqb4yyhk6gtxi5vomAbl3LNpuH7uvGYWds7gYNJArrFOZMXx
         D804c+qjTzliUw58PBN1XuSGQgmNyzVV2FI8bJ/Tio/ahTdlcLyAIg2SqqqHL2Krq3YM
         NbhQ==
X-Gm-Message-State: AO0yUKVjXdU4Cpmjqq2HxxhEOhaEa5YJrsf8bMI/h0u1OW6srGW6tvJt
	E8EYFceAb8rJcK/DtPp3NtbvlcLXJZyIrc8+fDjIcY9pugpZ2ZGXFsNEXUHTG73jDTOXlfdNXDL
	Eggv3Om2NwegnKqw75fhYo46qPv8=
X-Received: by 2002:a05:600c:5251:b0:3da:2ba4:b97 with SMTP id fc17-20020a05600c525100b003da2ba40b97mr964773wmb.19.1677843104689;
        Fri, 03 Mar 2023 03:31:44 -0800 (PST)
X-Google-Smtp-Source: AK7set89jwYKfXX+tidUwcn0W5eTNsi8WSvEa9NJwfkaA5xQlI7lx04yyCW7l1zd4f/2YxKQHT2bhQ==
X-Received: by 2002:a05:600c:5251:b0:3da:2ba4:b97 with SMTP id fc17-20020a05600c525100b003da2ba40b97mr964749wmb.19.1677843104376;
        Fri, 03 Mar 2023 03:31:44 -0800 (PST)
Message-ID: <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
Date: Fri, 3 Mar 2023 12:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2023 12.16, Peter Maydell wrote:
> On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
>>
>> qemu-system-aarch64 is a proper superset of qemu-system-arm,
>> and the latter was mainly still required for 32-bit KVM support.
>> But this 32-bit KVM arm support has been dropped in the Linux
>> kernel a couple of years ago already, so we don't really need
>> qemu-system-arm anymore, thus deprecated it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index a30aa8dfdf..21ce70b5c9 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>>   to use the ``qemu-system-x86_64`` binary instead.
>>
>> +``qemu-system-arm`` binary (since 8.0)
>> +''''''''''''''''''''''''''''''''''''''
>> +
>> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.
> 
> I think this is not quite true -- at the moment if you want
> "every feature we implement, 32-bit" the only way to get
> that is 'qemu-system-arm -cpu max'. The '-cpu max' on
> qemu-system-aarch64 is 64-bit, and we don't implement for TCG
> the "-cpu max,aarch64=off" syntax that we do for KVM that would
> let the user say "no 64-bit support".

Ok ... so what does that mean now? ... can we continue with this patch, e.g. 
after rephrasing the text a little bit, or do we need to implement "-cpu 
max,aarch64=off" for TCG first?

  Thomas


