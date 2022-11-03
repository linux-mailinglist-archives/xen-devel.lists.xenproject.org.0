Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E572617B59
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436336.690370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqY48-0006R5-IF; Thu, 03 Nov 2022 11:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436336.690370; Thu, 03 Nov 2022 11:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqY48-0006Oi-FK; Thu, 03 Nov 2022 11:07:20 +0000
Received: by outflank-mailman (input) for mailman id 436336;
 Thu, 03 Nov 2022 11:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8vYi=3D=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1oqY46-0006OJ-Nu
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:07:18 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8b7d40-5b67-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:07:17 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id z14so2206443wrn.7
 for <xen-devel@lists.xenproject.org>; Thu, 03 Nov 2022 04:07:17 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 l16-20020adfa390000000b002362f6fcaf5sm619394wrb.48.2022.11.03.04.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:07:15 -0700 (PDT)
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
X-Inumbo-ID: ad8b7d40-5b67-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioAj/03PTFf/uaiN9wTTpWC9jrZkUh7XgFAdXmVFeT0=;
        b=j0V8X8STX7IWgaMvz/VBrVye0Zw1tiw9dS0tetGfb65dn/24Em4poHnWrjFjPRu1rW
         QPF06iaqBLCbRK6LCjsRkgQmrsZbVF0k2ri6CHtKeYb+paUGktf4erRVPj4BQT3qQQjB
         29a584Pa2jOV2tTR2UAMow5MJ2eJ++FQDxg65xYCJeW+ps2Osv1OeKUFXUoLCgAr2g79
         oQP9zTPuBFnyFufkdvLPz0fQB1DlD33oHRBxenaInenjUnLdj2riIZTh3djfxjPzPvYs
         zsGgVwuuhjJkz5YO6NIgE1ymjoIaajiow9YxleDaIhXGJK/WusZHNC78e14PJ0+zE/XV
         zd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ioAj/03PTFf/uaiN9wTTpWC9jrZkUh7XgFAdXmVFeT0=;
        b=2LwxZDECvuAwqmqkpCfv9/5V/O23NjFqvhgfEa2BlRy0p3tjysITe7fb6CwYZL1OPD
         qfDcwkjf+vMUdsRWODAcaEt5MI2BgLYqMTrl22EecVmQobhLrLzqjaLC6KmS+9m+X9Hn
         dn0D8Uv56cuM6zgAEfxnctfxTVW9lzNpCgIATurHbPW7/h71BtLChYkZrz84LEg2eN/9
         EMwTvOPrHAkFC8sLBaBAXwJYYkv7lew28RpQ0IcYp4wRhYNHnKfaLt8t/IyeVqoP7QY2
         aKkng+lzf4mwK84hVTkiRyh7a7mdmsxFFPtKnyU+ou3n4m67tcrjqGZ95aRJHA4mk9IR
         bUnA==
X-Gm-Message-State: ACrzQf2WCO45x2sPygWNXuxrAj9dBpLJMA6mnoXIuSERsHnM7DEZoOWQ
	I3c3udF5/ImxaPL6kZsWtiCI5g==
X-Google-Smtp-Source: AMsMyM7NGSI02kuYWsWBe/V7h4jAfDD1+ML65sT6lw5hyMNAqTtrwDeLdnnqMIolLSgYthT6UlPUSg==
X-Received: by 2002:a5d:50ca:0:b0:236:776c:3075 with SMTP id f10-20020a5d50ca000000b00236776c3075mr18645206wrt.656.1667473636709;
        Thu, 03 Nov 2022 04:07:16 -0700 (PDT)
Message-ID: <e6aa73fb-f5e3-b24c-b963-b66849c9925f@linaro.org>
Date: Thu, 3 Nov 2022 12:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-17-lvivier@redhat.com>
 <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
 <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/11/22 10:33, Laurent Vivier wrote:
> On 10/28/22 07:04, Jason Wang wrote:
>>
>> 在 2022/10/21 17:09, Laurent Vivier 写道:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>
>>
>> I got this:
>>
>> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
>> assertion failed (resp == expect): ("st0: 
>> index=0,type=stream,connection error\r\n" == "st0: 
>> index=0,type=stream,tcp:::1:40389\r\n") ERROR
>> 63/63 qemu:qtest+qtest-x86_64 / 
>> qtest-x86_64/netdev-socket                  ERROR 5.29s killed by 
>> signal 6 SIGABRT
>>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
>> MALLOC_PERTURB_=96 
>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
>> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>> stderr:
>> **
>> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
>> assertion failed (resp == expect): ("st0: 
>> index=0,type=stream,connection error\r\n" == "st0: 
>> index=0,type=stream,tcp:::1:40389\r\n")
>>
>> (test program exited with status code -6)
> 
> I'm not able to reproduce the problem.
> 
> Is this 100% reproducible?
> Is IPv6 enabled on your test machine?

If IPv6 is not available, this test should be skipped, not failing.

