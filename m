Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C9619174
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 07:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437304.691580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqqb1-0002d1-VU; Fri, 04 Nov 2022 06:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437304.691580; Fri, 04 Nov 2022 06:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqqb1-0002aS-SG; Fri, 04 Nov 2022 06:54:31 +0000
Received: by outflank-mailman (input) for mailman id 437304;
 Fri, 04 Nov 2022 06:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ect2=3E=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1oqqb0-0002aM-Ff
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 06:54:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 867b9e33-5c0d-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 07:54:29 +0100 (CET)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-83zJb6djOW-xhVjVFiHnpA-1; Fri, 04 Nov 2022 02:54:24 -0400
Received: by mail-pf1-f197.google.com with SMTP id
 f19-20020a056a001ad300b0056dd07cebfcso1956783pfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Nov 2022 23:54:24 -0700 (PDT)
Received: from [10.72.13.71] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p188-20020a62d0c5000000b005668b26ade0sm1863136pfg.136.2022.11.03.23.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 23:54:22 -0700 (PDT)
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
X-Inumbo-ID: 867b9e33-5c0d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667544867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PLwjNrS10hAl93Noag9w4eSRGv8NX8MdSS5oxSA4BI=;
	b=NWuvKMgQ0QkWOfkeqq/CcGC/Jt0iXqri+o9K6aO3z3WOIgJt2ZNhTl/CgBjXkHMtsC890o
	m07qBdLlUPdrlGWHff/dHxNwcPMy04TTJUOJbuTLu0b7UwuKE1l2OGszhhooksOYIYmluo
	2A41+L4lhUhwNFJfqNBG1WRi/cpIXC4=
X-MC-Unique: 83zJb6djOW-xhVjVFiHnpA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PLwjNrS10hAl93Noag9w4eSRGv8NX8MdSS5oxSA4BI=;
        b=b4AsANUzE+t8UjYQ574Q0IavlXTWX5Qh9fBdFW4RiwfIEfY0zaMqlqTbsmeGXJ7rmj
         U7XvOT8Eg7z7AcuvmwivIq3nrcvQUBEW3GsMeYft4lty7TvSzKwAAZWwuzPflvh+REj8
         quCHrEoAjOAoTB2oIyLPnBusdtPUj1cqTTyX1jDH5BU+qjL3dM1oLNUgf1W6mwBXV9Am
         A6V4w7nJ/lXBT5k/LBCvy7Zi5fUe7PiEZJ/uki6BWJc2CN0fsvjGonmaWurSyMLl1WFM
         PdbQZWEZ5fCe1z7Uwc/JCG+Mqe8eyHaztIVhGqeofygmvAC7RuRuDPlhg+Gj0o7AJKy2
         MHNQ==
X-Gm-Message-State: ACrzQf0Sb0b67+PXvQ2w2zW2VWxJoNe4OtDjy7r7wsIahChzaAy7Qlwt
	gCWlged+i83VUe5hInWIPJ0f/K9EUM3GBuWtPqSkT8/fgdaIqmAJH1Sn9DRHTJ4Bii/cGNV+KNa
	it4XPegNqPp4meV+33ydUuzuYHlk=
X-Received: by 2002:a17:902:eb8a:b0:186:949e:8eb6 with SMTP id q10-20020a170902eb8a00b00186949e8eb6mr34444902plg.63.1667544863243;
        Thu, 03 Nov 2022 23:54:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oynVY5eRCch1+7iu0gHDiqvgDtt/2V13XPjw3vIEzqAfpQKMY9zH+TdeGGfW+fRvotJU5mg==
X-Received: by 2002:a17:902:eb8a:b0:186:949e:8eb6 with SMTP id q10-20020a170902eb8a00b00186949e8eb6mr34444879plg.63.1667544862994;
        Thu, 03 Nov 2022 23:54:22 -0700 (PDT)
Message-ID: <f37dc07b-5855-7823-2028-c50fa4b10eb1@redhat.com>
Date: Fri, 4 Nov 2022 14:54:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/11/3 17:33, Laurent Vivier 写道:
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
>> qtest-x86_64/netdev-socket                  ERROR 5.29s   killed by 
>> signal 6 SIGABRT
>>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
>> MALLOC_PERTURB_=96 
>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
>> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
>> ✀ 
>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
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


Yes.


> Is IPv6 enabled on your test machine?


Yes.

Try to investigate it more, it looks like the reason is hostname. I'm 
testing in ubunut which has the following things in /etc/hosts

127.0.0.1    localhost
127.0.1.1    jason-ThinkPad-X1-Carbon-6th
192.168.100.2   guest

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

So localhost is mapped to ipv4 and there's no ipv6 mappings here. Using 
"::1" for the address seems to fix the issue.

Thanks

>
> Thanks,
> Laurent
>


