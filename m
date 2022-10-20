Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B42606197
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426790.675483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVYr-00050o-Kr; Thu, 20 Oct 2022 13:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426790.675483; Thu, 20 Oct 2022 13:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVYr-0004wE-GB; Thu, 20 Oct 2022 13:26:13 +0000
Received: by outflank-mailman (input) for mailman id 426790;
 Thu, 20 Oct 2022 13:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olVYp-0004rg-8P
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:26:11 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ad4250-507a-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 15:26:10 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id bp11so34440543wrb.9
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 06:26:10 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b003c21ba7d7d6sm3137473wmq.44.2022.10.20.06.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:26:09 -0700 (PDT)
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
X-Inumbo-ID: c2ad4250-507a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ao80pQoZgJGEAb2bodmw5nlbxR+ZMAoIRtnrKk8Ulvg=;
        b=GG8LBf5MqqJv6YT+kENrU5dCgna6fE5XzYqlSlUpJjCNv3JZ7KVoPU0b7Vu/sKur9B
         ZFC9OdOkxuZxC/VZrWzrYf+0gzjWbvyagtaKYv9TIz64LwEQr8fexboSzjT0ZKGAhxAW
         1cADUL0nguDmWMFRPM1VzovKJSMlnNxc/HCP/69yhNTxb6AS2lzIt3Ntml+rQvwWyQ6X
         WiGiHyikIi52GofnS8eD5b1PIi4DH9KRbbTm6gBJScS36SPBREqKzSH/nwMMXwDJb+CV
         WHfuqdVQ0OdhM+96pbDXiuVjF7Pa2QtbtXkQmZsqe6KavhLhhW04EYltLA9l7Z1mkulf
         iOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao80pQoZgJGEAb2bodmw5nlbxR+ZMAoIRtnrKk8Ulvg=;
        b=UnDk81J5YVDqcTQ1wNZlZxtNgH/q/aUmbR5krMllK74E6pn5DpqtFIUhGrFQyWC1GR
         Yps4mmDQ5vNfTuqboD1cKjdlx1RY4nD/aQI5thMnIu8GGyn6j6W7yabQuhMlg/Z4BQZR
         PDxk69B9J5slVvvwWv1PQ8pc45BOWP0Xeei2H26BX2K9cB7M6Dz5bxCIi4rpbt6Kwn2n
         /8/CkeJ/suBiYQ86tkXEJZXNEU0p1R9aNNaecpwG0F5seucpZ05bVBcV05jGAzHMLOae
         TNbPRzsPdMYCD/yB0UXuuyeoxak7ju21CcPX33YTfJLFNpVVX5llRStXHLlQxE98ZanF
         riCg==
X-Gm-Message-State: ACrzQf1eIcR8ccBIfrQyBCEqmNyOjAUnZtRWFrP21vrt6jEgYX+7MJGC
	LJ3dXKHL0TxbG+V9v/vi979YUA==
X-Google-Smtp-Source: AMsMyM7Om5c8Ma3OvC6cMGxntd1D1a/PZuVouKbHMbYx2ESKorzb5ib/YpCZS+Edolmhg6R8/n71iQ==
X-Received: by 2002:a5d:5b1f:0:b0:22e:51b0:2837 with SMTP id bx31-20020a5d5b1f000000b0022e51b02837mr8764681wrb.132.1666272369772;
        Thu, 20 Oct 2022 06:26:09 -0700 (PDT)
Message-ID: <0f964c69-e3c7-b40a-be5e-85ae0471916d@linaro.org>
Date: Thu, 20 Oct 2022 15:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-17-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/22 11:16, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   tests/qtest/meson.build     |   1 +
>   tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 418 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c

> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
> +    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> +    qtest_add_func("/netdev/stream/unix", test_stream_unix);
> +    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
> +    qtest_add_func("/netdev/stream/fd", test_stream_fd);

The stream tests don't work for me (testing on Darwin).

ERROR:../../tests/qtest/netdev-socket.c:99:test_stream_inet_ipv4:assertion 
failed (resp == "st0: index=0,type=stream,\r\n"): 
("st0:index=0,type=stream,connection error\r\n" == "st0: 
index=0,type=stream,\r\n")

> +    qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
> +    qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +    qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
> +    qtest_add_func("/netdev/dgram/fd", test_dgram_fd);

The dgram ones work.

> +    ret = g_test_run();
> +
> +    return ret;
> +}


