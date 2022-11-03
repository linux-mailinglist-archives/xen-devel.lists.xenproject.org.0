Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E3B617A07
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 10:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436179.690281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqWbz-0005Z3-BJ; Thu, 03 Nov 2022 09:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436179.690281; Thu, 03 Nov 2022 09:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqWbz-0005X0-89; Thu, 03 Nov 2022 09:34:11 +0000
Received: by outflank-mailman (input) for mailman id 436179;
 Thu, 03 Nov 2022 09:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQyE=3D=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1oqWby-0005Wn-By
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 09:34:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a982880a-5b5a-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 10:34:08 +0100 (CET)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-l1Cdt_c6ONK92lEfuwtj4A-1; Thu, 03 Nov 2022 05:34:05 -0400
Received: by mail-qt1-f200.google.com with SMTP id
 y8-20020ac87088000000b003a528a5b844so1441590qto.18
 for <xen-devel@lists.xenproject.org>; Thu, 03 Nov 2022 02:34:05 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 m4-20020ac866c4000000b0039cc7ebf46bsm181307qtp.93.2022.11.03.02.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 02:34:04 -0700 (PDT)
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
X-Inumbo-ID: a982880a-5b5a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667468046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZR2OFVocz6kJ+L6ckJorPi7uGwBY94ZglCfP5VOmhw=;
	b=hPrxQVEjQcFcsNEBFwrthu/x9kISKIfUa9RLNFMU7m923mjvEE7nf/g76IgOP4RCRDSxdn
	FCsthxIld0cXg8Vxnp8XaFH6XHC3diyKc/QNncrYZEp+xPJn2t9Mmf7WPInsef/mg9WQbf
	2VTVOD1sWYhz/yJJyDrai+Z60kH32W4=
X-MC-Unique: l1Cdt_c6ONK92lEfuwtj4A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZR2OFVocz6kJ+L6ckJorPi7uGwBY94ZglCfP5VOmhw=;
        b=bt0UlYjJ+p6Go9PwzRPXVnM7UTP3inEaMuUImunmeu9cfOL6p7m2NABwp11Ksu5xxv
         d31TwPIH8TxpEw+vbLmFCnYeIR1nq6j3u1u9Oj8moAiMGjkAN+UU54FBgxlwQ0K0RgM/
         ua98eGJzs4BZzuwwsCnQSFjAHup8cj8D0Iw9XhRMHREhDW/nsCoCMs5SU59QAn+PCKSW
         eu3rwjKtmzk9OIKAzFvRny/0buPM4NcREpbYr34WrKzvrOLrcKcOB3zHAiIhJJTtfVdo
         sykNjPB6M1uu1K8DsYsitc3pbLBl3MpulDmSOL3h/gbC+9m3HQAmTYevpWwRQM8TZJk1
         v/uQ==
X-Gm-Message-State: ACrzQf1sVO+laFuwQGBV2aPmeC7NxULgH2IQnbNvxFg2Cru0phex577o
	LzvshjuIkTvMEHyBHsMd3zMvDwijphA9SLuWsex52e+5Z7zdc7W9HarUmqLWWxJE7eZ/UepjMHt
	bTKR8FAYmrbCxzltZm50fpqmUCbk=
X-Received: by 2002:a05:620a:1476:b0:6fa:4c67:83ec with SMTP id j22-20020a05620a147600b006fa4c6783ecmr9443015qkl.23.1667468044922;
        Thu, 03 Nov 2022 02:34:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61B3CKx0tKxBrzDYllgkLf+57PFgkDaree4gsL0Eyl4wlfGwGUj1xL01wTG6Emx1VJNx7whQ==
X-Received: by 2002:a05:620a:1476:b0:6fa:4c67:83ec with SMTP id j22-20020a05620a147600b006fa4c6783ecmr9443002qkl.23.1667468044643;
        Thu, 03 Nov 2022 02:34:04 -0700 (PDT)
Message-ID: <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
Date: Thu, 3 Nov 2022 10:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
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
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/22 07:04, Jason Wang wrote:
> 
> 在 2022/10/21 17:09, Laurent Vivier 写道:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
> 
> 
> I got this:
> 
> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed 
> (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
> index=0,type=stream,tcp:::1:40389\r\n") ERROR
> 63/63 qemu:qtest+qtest-x86_64 / qtest-x86_64/netdev-socket                  ERROR 5.29s   
> killed by signal 6 SIGABRT
>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=96 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> **
> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed (resp == 
> expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
> index=0,type=stream,tcp:::1:40389\r\n")
> 
> (test program exited with status code -6)

I'm not able to reproduce the problem.

Is this 100% reproducible?
Is IPv6 enabled on your test machine?

Thanks,
Laurent


