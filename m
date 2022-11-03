Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD466617B72
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436342.690384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYIR-0000ng-SS; Thu, 03 Nov 2022 11:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436342.690384; Thu, 03 Nov 2022 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYIR-0000l1-Os; Thu, 03 Nov 2022 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 436342;
 Thu, 03 Nov 2022 11:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQyE=3D=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1oqYIQ-0000kv-9N
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:22:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be1c1b1d-5b69-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 12:22:04 +0100 (CET)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-3CwrbiNXMgWlw8zr6uiTsw-1; Thu, 03 Nov 2022 07:22:00 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 i17-20020a05620a249100b006fa2e10a2ecso1674308qkn.16
 for <xen-devel@lists.xenproject.org>; Thu, 03 Nov 2022 04:22:00 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac85192000000b0035bafecff78sm327917qtn.74.2022.11.03.04.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:21:59 -0700 (PDT)
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
X-Inumbo-ID: be1c1b1d-5b69-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667474523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ux3m9Pk64tq6UdkJ4I6mb58Aa13yWuk+ekJZSNfZ/b4=;
	b=a4pLayP1N/n0epfqPjZA9sxb0ztGBVIRDDNejoLxQzPSCKKxSrgRteUZ5XwQ4uPfh+n5KJ
	tprV7DKpkNHFPNoyAgx0e7E/mSILW4rIYFhlyJWdXLWA8Pmg+pqcYpJDEzRZKGedGXCSSS
	h5eyEm5SZs0TLQgMe+rLH4rw9i/xWNA=
X-MC-Unique: 3CwrbiNXMgWlw8zr6uiTsw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux3m9Pk64tq6UdkJ4I6mb58Aa13yWuk+ekJZSNfZ/b4=;
        b=BxB7ikl6f5GyDWyFJ1eJFhyB77nlozq4B7k9+ks5gcctOhModKkowgMRirRA6fg8WC
         zC/jHDf5McFbdB8EPyapmO/jxoylpQhJPQGoU5EY8Fkf7UUPYrWfypE0WMUeANcSKXhJ
         2tEhFogDygSN3zg8LLZ9H1CbCA25D7Y1rRu1FvPcWFgU6N2RkFaz/NkigwX5GR/qdXxK
         dmHG75pgsOYsVpZOmw0lWAxBlQRWkkAZAPB9jfwtjI8t7pTncJ0xxWF10CFtXndGtlvw
         c4HHVw20WafFvu1Rh6vfRfAX9HCjZAxb49s8Rlm8CW2SoUMJlrp2nNbc0yd7tELl0Var
         lMTg==
X-Gm-Message-State: ACrzQf21ab54SAZBOPSExS+dCma8DCAcEenDNqzTkhhs0ecWxILRbak2
	0EjEAQzK8HP2APy+1ZZL09TA1x+hjjjoRo1WYMZs20uq8KkNIM/qptEdBPTZjQ3FAlLESOudiZw
	WUHMKqaOigsNozQudSxqdaykihIw=
X-Received: by 2002:a05:620a:414d:b0:6ee:e31f:6253 with SMTP id k13-20020a05620a414d00b006eee31f6253mr21624286qko.350.1667474519858;
        Thu, 03 Nov 2022 04:21:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gKGp5Esn4q08oqlevXnjWnv1AM/gAdKIVaBYMoJfq1kW9W2Rn8Rhkj6rgw0J/XOHyiE3bVw==
X-Received: by 2002:a05:620a:414d:b0:6ee:e31f:6253 with SMTP id k13-20020a05620a414d00b006eee31f6253mr21624267qko.350.1667474519626;
        Thu, 03 Nov 2022 04:21:59 -0700 (PDT)
Message-ID: <bdd5dcce-10df-6f08-8ed4-b4e994fdc336@redhat.com>
Date: Thu, 3 Nov 2022 12:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
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
 <e6aa73fb-f5e3-b24c-b963-b66849c9925f@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <e6aa73fb-f5e3-b24c-b963-b66849c9925f@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/22 12:07, Philippe Mathieu-Daudé wrote:
> On 3/11/22 10:33, Laurent Vivier wrote:
>> On 10/28/22 07:04, Jason Wang wrote:
>>>
>>> 在 2022/10/21 17:09, Laurent Vivier 写道:
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>
>>>
>>> I got this:
>>>
>>> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed 
>>> (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
>>> index=0,type=stream,tcp:::1:40389\r\n") ERROR
>>> 63/63 qemu:qtest+qtest-x86_64 / qtest-x86_64/netdev-socket                  ERROR 5.29s 
>>> killed by signal 6 SIGABRT
>>>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
>>> MALLOC_PERTURB_=96 
>>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>>> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
>>> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
>>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
>>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>> stderr:
>>> **
>>> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed (resp 
>>> == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
>>> index=0,type=stream,tcp:::1:40389\r\n")
>>>
>>> (test program exited with status code -6)
>>
>> I'm not able to reproduce the problem.
>>
>> Is this 100% reproducible?
>> Is IPv6 enabled on your test machine?
> 
> If IPv6 is not available, this test should be skipped, not failing.

I agree.
But I'm not sure it's the real cause of the problem (perhaps a firewall problem?).

I think I should update my inet_get_free_port_socket() to get a free port from AF_INET6 
and not only from AF_INET.

Thanks,
Laurent


