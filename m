Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD360638A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 16:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426878.675628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWr8-0002lE-T7; Thu, 20 Oct 2022 14:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426878.675628; Thu, 20 Oct 2022 14:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWr8-0002iM-QL; Thu, 20 Oct 2022 14:49:10 +0000
Received: by outflank-mailman (input) for mailman id 426878;
 Thu, 20 Oct 2022 14:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BcH=2V=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olWr7-0002iG-5J
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 14:49:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589d1603-5086-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 16:49:07 +0200 (CEST)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-AOvrBBh8MEC-FnOImWVHZw-1; Thu, 20 Oct 2022 10:49:04 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 h3-20020a0ceec3000000b004b17a25f8bcso13153606qvs.23
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 07:49:04 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006b640efe6dasm7399796qkp.132.2022.10.20.07.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 07:49:03 -0700 (PDT)
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
X-Inumbo-ID: 589d1603-5086-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666277345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ht4uc+F2VhKi75XpFbjwSsqeX/sAc/dV4pRAF7MDqY=;
	b=SqPvzb4HXYEVLTnDoIkPtQBnVZG7d9DpNMm420xo8vOC7pV0kPs+9hnMgBzZ8LYN4kAjlf
	/w0nylLYopz0ap2kYRMA/yX2ZfeAy4jkSqxsF42N09wEXiq4KAM2uCqiZwKLTbRGfybAHf
	5fvKLZLYueNfc4QapQD24rliTecMC5s=
X-MC-Unique: AOvrBBh8MEC-FnOImWVHZw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ht4uc+F2VhKi75XpFbjwSsqeX/sAc/dV4pRAF7MDqY=;
        b=rHK2dSF5Rk+aju51hr4Umiq5zqzjHVqgOTwPSJK18XhoKsBFeBkCIwYWuiFOfD4olG
         /LgZMp5m3UAaV+C8o9ToRUWgLpxA1J5LpM0csKi6yw/YahuHFaPTrmK1ga969ku44ZZZ
         2WdNs2x8vJrDiwxddMK4HWw2xMRtegDG63dxAUJ4n8W1PilSD05lcW0Z/IHSHY0TGWx6
         xIVbvWouIHPOUQaCg0h55l4JBDOJRI+WOVopDcbK9mflxGypJyXWtL+eQoXE+1TX4HLY
         gbIFrPZRfezOh8huLTIMD6Y/5zeE7q3HZu1O6rmLDHczeiYMNUYb5BLQMDT1qyCFvutE
         dXGw==
X-Gm-Message-State: ACrzQf1d9aJ3f1SEfi2phRw/C5q4ycdPdYCYZz9ndW+80X7xOJNkcVzr
	rGA/f+PhLR19qJLLqc7gN5ZREA90u16Z7h6kFzLWcLUH9/iXSOHC6sMpcUP+WjcKulSb7W9jeR9
	uAHObQqmvkVHs9DgekItWI1WRoLM=
X-Received: by 2002:a05:6214:e6b:b0:4b3:dcaf:c3a7 with SMTP id jz11-20020a0562140e6b00b004b3dcafc3a7mr11516010qvb.34.1666277344055;
        Thu, 20 Oct 2022 07:49:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oWaxjXIjtOg84/mDXFCwbgTI0D8L9sa7jNLjyAhRZGVP7+cxo6c5D4KJthUj3eEDZTCkahg==
X-Received: by 2002:a05:6214:e6b:b0:4b3:dcaf:c3a7 with SMTP id jz11-20020a0562140e6b00b004b3dcafc3a7mr11515993qvb.34.1666277343846;
        Thu, 20 Oct 2022 07:49:03 -0700 (PDT)
Message-ID: <8050912a-58e2-892c-0808-1c4ea6168b68@redhat.com>
Date: Thu, 20 Oct 2022 16:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 16/17] tests/qtest: netdev: test stream and dgram
 backends
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-17-lvivier@redhat.com>
 <0f964c69-e3c7-b40a-be5e-85ae0471916d@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <0f964c69-e3c7-b40a-be5e-85ae0471916d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/22 15:26, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   tests/qtest/meson.build     |   1 +
>>   tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 418 insertions(+)
>>   create mode 100644 tests/qtest/netdev-socket.c
> 
>> +int main(int argc, char **argv)
>> +{
>> +    int ret;
>> +
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
>> +    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
>> +    qtest_add_func("/netdev/stream/unix", test_stream_unix);
>> +    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
>> +    qtest_add_func("/netdev/stream/fd", test_stream_fd);
> 
> The stream tests don't work for me (testing on Darwin).
> 
> ERROR:../../tests/qtest/netdev-socket.c:99:test_stream_inet_ipv4:assertion failed (resp == 
> "st0: index=0,type=stream,\r\n"): ("st0:index=0,type=stream,connection error\r\n" == "st0: 
> index=0,type=stream,\r\n")

My bad: I have changed the default value for "server" but I didn't update the test.

Thanks,
Laurent


