Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C97EB2F3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632717.987109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utq-00012a-2H; Tue, 14 Nov 2023 15:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632717.987109; Tue, 14 Nov 2023 15:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utp-0000zf-VT; Tue, 14 Nov 2023 15:00:21 +0000
Received: by outflank-mailman (input) for mailman id 632717;
 Tue, 14 Nov 2023 15:00:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uto-00075e-7o
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:00:20 +0000
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86866893-82fe-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:00:18 +0100 (CET)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so8782150a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:00:18 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 ay18-20020a170906d29200b009ce03057c48sm5685319ejb.214.2023.11.14.07.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 07:00:12 -0800 (PST)
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
X-Inumbo-ID: 86866893-82fe-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699974013; x=1700578813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvwMnVTQaJD67434mMenkNkErgsf9DqTmkoP4qGMiTA=;
        b=nEhnN3ZBjp7nGWdapH25Z2rVEWwYekwml0Iiecwn0FAriKBsXv3/YVbRQiY/sh4VNa
         l/hH4rLie0CSI6DWls9+XMf5WTKXgxA4rAEfhKML+ElFNZkw3LJg/grw510IH1RweiVP
         wrb2kpH88f1+UhSor46WpSjQnftwafe8RCqezA2W9eCkOwdni8TTS2DEl00nkV990PXk
         Q0eaT1QMWx717VEwo1HJ5Y8FnY07WMQ/+PGnlLnPdZ3zm46AX+UuAG9FflmiCv5YzRbl
         mtzdDTScCphdyG36yWkB35tfoM90vD13qA4HSbYeknjFOSsog7Tvq0Z9NNS6jj+RbCfo
         IVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974013; x=1700578813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvwMnVTQaJD67434mMenkNkErgsf9DqTmkoP4qGMiTA=;
        b=enqmWVHti+6h22QtXywo2w19VPiATUqJjh1EQx8reZsHqpO+IQ+QQ40rfeRZvOl2b/
         wqXbHsnv/0sl3UMqVMFAvlIeUocQ+oJxkWQ3QyBnRlsAnSmsHBZaV/a+W8pqaUPC54Zs
         bEvY8bfagIzO3FEP7QfNHpOcT61NZc2JbdYFzzob73AxAk9xR2I8Mc/Goouj6s5YsDFA
         wbaZ4GdAHMusTvUQ9AuqZCFCHS8n3YLTFOLyTJTnspjN5GqcUqKc0zMQgkDaqLIW0kfY
         HuxKW7XA6tywMVfQL6FoBpfW2FqJr/seZ27eCHelQ9ltAcBCsEBCueK+HfYrVPuNQB7G
         rIVw==
X-Gm-Message-State: AOJu0YwiC60IKdOiLgqeaprToRsTSYy4pL2O2pk/M61NdnqIxaPVydZP
	TNxizg9iybA+sduKwr7KrfMbBw==
X-Google-Smtp-Source: AGHT+IHf7MXlWtvkPtL4rKaxAjHGg7eiFZd1cU9GCPUEE1OMwcKoAJdSYUPudWARuJ4FPvDMOa6uyA==
X-Received: by 2002:a17:906:7e06:b0:9d3:5d4a:8b6a with SMTP id e6-20020a1709067e0600b009d35d4a8b6amr7254726ejr.42.1699974013091;
        Tue, 14 Nov 2023 07:00:13 -0800 (PST)
Message-ID: <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
Date: Tue, 14 Nov 2023 16:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to
 tests running Xen guest
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-2-philmd@linaro.org>
 <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/23 15:50, David Woodhouse wrote:
> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> Add a tag to run all Xen-specific tests using:
>>
>>   $ make check-avocado AVOCADO_TAGS='guest:xen'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> tests/avocado/boot_xen.py      | 3 +++
>> tests/avocado/kvm_xen_guest.py | 1 +
>> 2 files changed, 4 insertions(+)
> 
> Those two are very different. One runs on Xen, the other on KVM. Do we want to use the same tag for both?

My understanding is,
- boot_xen.py runs Xen on TCG
- kvm_xen_guest.py runs Xen on KVM
so both runs Xen guests.

Alex, is that incorrect?

