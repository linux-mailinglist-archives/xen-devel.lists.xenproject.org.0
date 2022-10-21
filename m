Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8260783C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 15:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427683.676971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olrx5-0007HW-Ch; Fri, 21 Oct 2022 13:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427683.676971; Fri, 21 Oct 2022 13:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olrx5-0007EH-9E; Fri, 21 Oct 2022 13:20:43 +0000
Received: by outflank-mailman (input) for mailman id 427683;
 Fri, 21 Oct 2022 13:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RYXF=2W=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olrx3-0007EB-K9
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 13:20:41 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286cc3e2-5143-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 15:20:40 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id a3so4958400wrt.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 06:20:40 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff452000000b0022584c82c80sm18829340wrp.19.2022.10.21.06.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 06:20:39 -0700 (PDT)
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
X-Inumbo-ID: 286cc3e2-5143-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fclBL2DpDYJrYU1BjyQuOIQ/MO5tKMgq37veQJeQ2n4=;
        b=FSBb67Bt1oZuJV6sOvlww0UJMA+bSH0WGVgnpYeTqP6H21Ju+WifYioUQAeL0Nojtk
         Z81sVaaMW50wPC77SAXzQPzQn3MkICX1KWjdWC4rEd6Asr/d9glTKj9ssYm/TY/E+Zje
         eKKrFQb6KQj0l9G+sXGCrAUg/b8jIvpIDDqW2WJQY4B1aZ8lWwCBCBngWofPok/o+8KJ
         f3QpbeawwQAyFFrJfDNL7M94T9UDPv1RTUPouKnpCuH6UJbc5hGzsBsFbDaN0V/8KCR1
         WXhNP+Dx4QWh4L/UlRa2mIpXMIkKjtzp7Gf8SaMwCkoqJNGJGjvZnKjtrcK5ryDzEgEV
         OZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fclBL2DpDYJrYU1BjyQuOIQ/MO5tKMgq37veQJeQ2n4=;
        b=gNG47FDMpLnJnqV0L1EPybkfKry7pBJLLrhzgqhOdyEabVBfMpQgqogoLxLJcPawhx
         br7xXNUHCsV9hmhvT6j1qGk1b+f6XumMl8QmO8okBorjCoIQWrU3ZQze7aH76+i9LufB
         dt+GOatTGBiBnizpBioRAt15GbePyQj1BSqbVVs6Jfd5a4t72uX5sqK8Axs9eOc7Am7p
         De0P2XtuZV7QrMCFksrhFkXzLqi4ecD8AZ+LwqznP/PAG6HMQRwRGavc8jRl8A1CZsPO
         NHOs+NK9bEHRtM6uwO68tei2AREY6NBEpAMZ5YLFzuVqy64R5OBLZ0Cd/YkLlUwWKV2k
         8AzA==
X-Gm-Message-State: ACrzQf2rRciWsLqg3sdJNCaRPKNBRydtS87Myb2GTyWbTmU80u0KC6zp
	a1IOpR7C0MT4arNqgeNtpZ5weA==
X-Google-Smtp-Source: AMsMyM5e+Pbh1hb3QzRiLSLXWqIsw5ixTNWz9T3X6aT1kKxl5LI+D4J2QxglQZ8ZWWf5VOIdNxh+jw==
X-Received: by 2002:a05:6000:18a1:b0:230:f9fb:c83 with SMTP id b1-20020a05600018a100b00230f9fb0c83mr12373772wri.329.1666358439681;
        Fri, 21 Oct 2022 06:20:39 -0700 (PDT)
Message-ID: <34aef1b8-c8bb-995f-c9ee-0c9c982620c5@linaro.org>
Date: Fri, 21 Oct 2022 15:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 xen-devel@lists.xenproject.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-16-lvivier@redhat.com>
 <1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
 <87tu3x1n2m.fsf@pond.sub.org>
 <881f1b6d-ac9f-a144-0e13-622981f02130@redhat.com>
 <871qr11kgt.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qr11kgt.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/10/22 13:31, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 10/21/22 12:35, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> On 21/10/22 11:09, Laurent Vivier wrote:
>>>>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>>>> This allows net/stream to use all the available parameters provided by
>>>>> SocketAddress.
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> ---
>>>>>     net/stream.c    | 492 +++++++++++++++++-------------------------------
>>>>>     qemu-options.hx |   4 +-
>>>>>     2 files changed, 178 insertions(+), 318 deletions(-)

>>>>> +    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
>>>>> +    g_assert(addr != NULL);
>>>>
>>>> Missing propagating Error* (observed in v12).
>>>
>>> *If* this is really a programming error: what about &error_abort?
>>
>> assert() informs the compiler that following code will not use addr with a NULL value, I
>> don't think &error_abort does that. This could avoid an error report in code static analyzer.
> 
> I'd expect Coverity to see right through it.
> 
> Static analyzers with a less global view won't, of course.
> 
> For what it's worth, there are about a thousand uses of &error_abort
> outside tests/.  I'm not aware of them confusing static analyzers we
> care about.
> 
> I like &error_abort, because it makes the program crash when we try to
> put the error into &error_abort, with an informative message.  This is
> often right where things go wrong[*].  I personally don't care much
> about the better message, but others do.  The better stack backtrace has
> been quite useful to me.

I concur:

   qemu-system-x86_64: socket family 0 unsupported

VS:

    ERROR:../../net/stream.c:321:net_stream_client_connected: assertion
failed: (addr != NULL)

https://lore.kernel.org/qemu-devel/6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org/

> 
> Let's use &error_abort, and throw in the assert when a static analyzer
> we care about needs it.
> 
> 
> [*] error_propagate() messes this up.  That's why the comments in
> error.h ask you to do without when practical.
> 
> 


