Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241666A53CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503045.775177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWueZ-00030h-4B; Tue, 28 Feb 2023 07:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503045.775177; Tue, 28 Feb 2023 07:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWueZ-0002xa-0g; Tue, 28 Feb 2023 07:44:03 +0000
Received: by outflank-mailman (input) for mailman id 503045;
 Tue, 28 Feb 2023 07:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWueX-0002xU-1Y
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:44:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e456d4-b73b-11ed-9692-2f268f93b82a;
 Tue, 28 Feb 2023 08:43:59 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-1ajUmizlMvGUUSbEiXjCCA-1; Tue, 28 Feb 2023 02:43:50 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020a056000188700b002c53d342406so1295303wri.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 23:43:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 u17-20020adff891000000b002c553e061fdsm8954445wrp.112.2023.02.27.23.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:43:48 -0800 (PST)
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
X-Inumbo-ID: a8e456d4-b73b-11ed-9692-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677570237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
	b=WWpDVZv7yevNEqNsT0rYeJ97394JgcwpTDLS2fodOXqMetC+8IOHLPoCrZi6qIYw5IYdFF
	Y1pN3eC0FLyqJaIU5/jyaahFybZF8mK8Ej8RvYYObtxb6y8MBsyTaxsP9QcDshR/7P5aCr
	8FZbnlokfyD8fS+pQvEK64MsI9aarUo=
X-MC-Unique: 1ajUmizlMvGUUSbEiXjCCA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
        b=aArVLVlm/I2yDy6qAmCQCGv4NdqKgFJT/SaKzHz+SgwsYmkKhFykk3tyo0s91SdwhL
         AmM4B2YGTZvYXNvOD61A2v0nXQ8P7qRGBgB1h3SoSao0LFw5PRWnaboh2lr7bXQPbNw+
         ey/uZIhUarePpDSlUL2o9Z6k75NYrAw7Lk6Tzx+E0tHkcm1w6Qrbtet8ibX5BlnjSaiB
         MfqoMha/GTQAmu6QQjkvZhCFn+pUe2tPvdXB2V9krkbGY7JuY3wWAL1C/Tn1ZBHCmdQE
         4K+U3ppOV/FQRSKv3T/Ut5MRRKXSPjErWKnsrCQqCQJXmSSkGhrxPJctGOKagi52flFl
         isJw==
X-Gm-Message-State: AO0yUKXpAnhw4ViV0NQUnAUXVu35vzTSa9WESIo95gXYkzdeLP42TZhw
	37BFnmymHBl1mJxuhleaggwfLkQMuuSQhVIxPX9CWB/7CIn6BljBuKusgHxVk+h14ge/24ckk06
	z5NtQ43zPA/LSpWsx+/+N1dshR9M=
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id s10-20020a5d424a000000b002cad5dcbba4mr1466419wrr.59.1677570229808;
        Mon, 27 Feb 2023 23:43:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/+OC6jQRznL8bCi2fp/4ORQCK/tSgqjWzf1oQTF69+WhcSUvxgOLNifCcD01s1iI5r3TuvcQ==
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id s10-20020a5d424a000000b002cad5dcbba4mr1466399wrr.59.1677570229519;
        Mon, 27 Feb 2023 23:43:49 -0800 (PST)
Message-ID: <2979548a-59f9-744f-70a7-d0fd00be0a2a@redhat.com>
Date: Tue, 28 Feb 2023 08:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/02/2023 23.32, Philippe Mathieu-Daudé wrote:
> On 27/2/23 21:12, Michael S. Tsirkin wrote:
>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>> I feel like we should have separate deprecation entries for the
>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>> although they're related they are independant features with
>>> differing impact. eg removing qemu-system-i386 affects all
>>> host architectures, not merely 32-bit x86 host, so I think we
>>> can explain the impact more clearly if we separate them.
>>
>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>> a superset.
> 
> Doesn't qemu-system-i386 start the CPU in a different mode that
> qemu-system-x86_64? Last time we discussed it, we mention adding
> -32 and -64 CLI flags to maintain compat, and IIRC this flag would
> add boot code to switch the CPU in 32-b. But then maybe I misunderstood.
> Thomas said, "CPUs must start in the same mode they start in HW".

No, I think you misunderstood something here. x86 CPUs always start in 
16-bit mode, as far as I know, and the firmware / OS then has to switch to 
32-bit or 64-bit mode as desired.

  Thomas


