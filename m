Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C772261406
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFg29-0006Ts-RH; Tue, 08 Sep 2020 15:59:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFg29-0006Tm-5R
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:59:49 +0000
X-Inumbo-ID: 77f75b54-39a6-45d3-86aa-ab32b6b79530
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 77f75b54-39a6-45d3-86aa-ab32b6b79530;
 Tue, 08 Sep 2020 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=U2QPNAiuMbC9eGZGReMP0TASpkQKMU8EGoq5WI/NmG8=;
 b=PQ9r3IWzLyV6wMlIaFq/gLm/WzxcQjqQ/VsLohDmh0nUAHrBDCCg6ze3cyBf9O3GBKNj0q
 B0DyLfttguzsTHB5fPkesgRIj1ULWvNCHmrZty3ldqiq22L94qDGyhbIjHVh3NzE9Sc0Zo
 pCXsxoCJgTFF2DNlgtSONTTRkdkHV78=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-eR0h6TE5NKaTJzVF8osRdA-1; Tue, 08 Sep 2020 11:59:45 -0400
X-MC-Unique: eR0h6TE5NKaTJzVF8osRdA-1
Received: by mail-wr1-f71.google.com with SMTP id r15so7100036wrt.8
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=U2QPNAiuMbC9eGZGReMP0TASpkQKMU8EGoq5WI/NmG8=;
 b=H6iwBmrkECNcDXMTuRUqz+sbbd11VlRnsaDp8R/Hc0U7pHHzvC0VwMLk+8lXpe8pEl
 bO/E6OkdQ+sJoV1Hm0HAlgA1GISNasNKMdKWSoUWuH9mBRVcGpifxcoszoc6TXf0lHxu
 ZuTTmVi3qFwRhXk1qAndIosKNIyrkIkHwbLfUzh1w7unm1sMZPC3XtuiVnlUCr4FKMUP
 tsJZu3OLIwuR6dajPgNs//vF6R99diLKsFZEAnPZ2JKPWEkdsTSJhTpjfQfNKEq/FaNE
 bITq9AldE1pyJ6Ztjpn8a7C4ihxfNFj7bx9pRSsLV9W6yer3lJ7f22kUW+D3/tNLAam6
 vwOg==
X-Gm-Message-State: AOAM5330Kx0Q1sd+IoQVkyD3F5YqFWCnZPCvYTVbHF2lA79yCylNHok/
 CAO7OZGAnNnDdxvvdiwjVDuFeA2jGl7XeSxYDG18lvmrCfxg4sFKKFWF7BoAS4LMgW7RcRTSzdb
 1eGC5YGPzHmkbB55asOTXHW3ALcQ=
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr307152wrn.63.1599580784048;
 Tue, 08 Sep 2020 08:59:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdaAO+2tHdDTpKSEbhDMvzTk4TIkO2VYXkU6udMLWtHtDiHbD/WYi71dQN6zj1gFsEyZ6zIw==
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr307142wrn.63.1599580783902;
 Tue, 08 Sep 2020 08:59:43 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t15sm29761961wmj.15.2020.09.08.08.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 08:59:43 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] stubs: Split accelerator / hardware related stubs
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
 <20200908155530.249806-5-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <ef10e7e7-8726-0e66-f3b2-db7c04e6bb7c@redhat.com>
Date: Tue, 8 Sep 2020 17:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908155530.249806-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/8/20 5:55 PM, Philippe Mathieu-Daudé wrote:
> Move hardware stubs unrelated from the accelerator to xen-hw-stub.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
...
>  Guest CPU Cores (HAXM)
>  ---------------------
> diff --git a/stubs/meson.build b/stubs/meson.build
> index e0b322bc282..c3e318a57f3 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -46,4 +46,5 @@ stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
>  if have_system
>    stub_ss.add(files('semihost.c'))
> +  stub_ss.add(when: 'CONFIG_XEN', if_false: files('xen-hw-stub.c'))

Bah wrong place :/ not my day.

>  endif
> 


