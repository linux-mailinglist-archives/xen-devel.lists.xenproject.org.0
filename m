Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2366063D7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 17:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426892.675655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXAD-0005v9-Sr; Thu, 20 Oct 2022 15:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426892.675655; Thu, 20 Oct 2022 15:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olXAD-0005rp-Pm; Thu, 20 Oct 2022 15:08:53 +0000
Received: by outflank-mailman (input) for mailman id 426892;
 Thu, 20 Oct 2022 15:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BcH=2V=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olXAD-0005rh-Bs
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 15:08:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b03c673-5089-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 17:08:52 +0200 (CEST)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-D4QfYWbMN1mdSupDFAUTCg-1; Thu, 20 Oct 2022 11:08:50 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 h3-20020a0ceec3000000b004b17a25f8bcso13202887qvs.23
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 08:08:49 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a05620a2a5c00b006eed14045f4sm7916260qkp.48.2022.10.20.08.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:08:48 -0700 (PDT)
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
X-Inumbo-ID: 1b03c673-5089-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666278531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ3dyElTQZpuiNzY8qlpiaTnLAs808Grj4avBqSktKw=;
	b=TzDAJM7I8a3R1DWXOnFlIuAuKF2T7fuUYHrEsGJlIb8m3BaAxLxk/EE8lgsXatB26EP1tu
	3zjtI5ggWdFbLEDPmrYJ7mRczqBGF3bGh3wBK3+k45404WIFM11aJqhoY39cFudcb5mGA4
	TEcR8FeM/XHeKknC3HIg9wb9FaHNzIY=
X-MC-Unique: D4QfYWbMN1mdSupDFAUTCg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ3dyElTQZpuiNzY8qlpiaTnLAs808Grj4avBqSktKw=;
        b=kiG8HJhq3uTo3OPKb0UPrjLkCsFxoC0GCh0GwLXLKPc3GQpgfmI3ZD2B/YgIbMfPq2
         dx6yz4WhZJrdbNBRPjGWNalXfI3VAjpz3jhwpHulneHqJ4NNa37oe9Lij7FS/vYW3w4A
         EWn815ZxAvoP6Qyz7syKr4J3fQTdk1VOne+xk5rxZbicxrVL5Yb3IPo8+b18d8Nxis1n
         hsog95RMKKqYS6aXqifiE/xfDAUVmRtwq4BQrhivS+B0E3xe468rCLYZICaDaR834hm9
         Cz80e7GNwkCM0n/1ZGlIP9gNw8h/fLa/bvhpat3row8UNgfdutMM3b+xr045pMkyU+K5
         s2+A==
X-Gm-Message-State: ACrzQf3TYVeORaWOYG1TEHvkHeDR1XIPUT0akBy2Yxe5nbmzGMMbwBN8
	VqV1ItM+joSBqSfM/0O1UTwA7WyB2ukkBmppYJwY9cDZZZSbl3u2mn/0w9tmQtTthIOjVEsdsg7
	k9xm7UXKKJfefjODQqyj8VCClqEM=
X-Received: by 2002:a05:620a:4244:b0:6cf:8a7b:3224 with SMTP id w4-20020a05620a424400b006cf8a7b3224mr9668003qko.32.1666278529481;
        Thu, 20 Oct 2022 08:08:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Mk82y1w4IUblOwX4CtN0grxQ3paXzht3z6wWUQ6Z2aEgvGzoxxatl5GNWIuPDLGRd5a9rHQ==
X-Received: by 2002:a05:620a:4244:b0:6cf:8a7b:3224 with SMTP id w4-20020a05620a424400b006cf8a7b3224mr9667958qko.32.1666278529228;
        Thu, 20 Oct 2022 08:08:49 -0700 (PDT)
Message-ID: <71247f91-a74e-e497-8376-488e399c8c43@redhat.com>
Date: Thu, 20 Oct 2022 17:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 10/17] net: dgram: make dgram_dst generic
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
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-11-lvivier@redhat.com>
 <15217f04-d689-7579-1501-320761b2f6e7@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <15217f04-d689-7579-1501-320761b2f6e7@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/22 13:17, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> dgram_dst is a sockaddr_in structure. To be able to use it with
>> unix socket, use a pointer to a generic sockaddr structure.
>>
>> Rename it dest_addr, and store socket length in dest_len.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   net/dgram.c | 82 ++++++++++++++++++++++++++++++++++-------------------
>>   1 file changed, 53 insertions(+), 29 deletions(-)
> 
>>   static NetClientInfo net_dgram_socket_info = {
>> @@ -260,7 +263,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>>                                           SocketAddress *mcast,
>>                                           Error **errp)
>>   {
>> -    struct sockaddr_in saddr;
>> +    struct sockaddr_in *saddr = NULL;
> 
> Preferrably g_autofree.

No, because saddr pointer is copied to s->dest_addr.

...
>> @@ -339,21 +342,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
>>   {
>>       NetDgramState *s;
>>       int fd, ret;
>> -    struct sockaddr_in saddr;
>> +    struct sockaddr_in *saddr;
> 
> Preferrably:
> 
>    g_autofree struct sockaddr_in *saddr = NULL.

The same here.

Thanks,
Laurent


