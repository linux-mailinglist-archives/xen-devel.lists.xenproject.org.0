Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172706AB9AB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 10:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506826.780017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ74G-00013P-Gq; Mon, 06 Mar 2023 09:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506826.780017; Mon, 06 Mar 2023 09:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ74G-00011A-EE; Mon, 06 Mar 2023 09:23:40 +0000
Received: by outflank-mailman (input) for mailman id 506826;
 Mon, 06 Mar 2023 09:23:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XRxq=66=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pZ74F-000111-1a
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 09:23:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93d0e589-bc00-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 10:23:38 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id k37so5206606wms.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 01:23:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003eb596cbc54sm9757477wmb.0.2023.03.06.01.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:23:37 -0800 (PST)
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
X-Inumbo-ID: 93d0e589-bc00-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
        b=ZxBUzWA1U7RyUWDqxC8pGR7cVnnCrSZXVCvfwxorachb08lbZyZrYAjYalqafHALrT
         B3eNncZcnTZMDiL9RjkbXDMZOhxLRLuVt7x4iiw4UZ85K4wYAtion+vHicS1CdEu+Yag
         MYJtH98F6kQEsgRu8DtzdPCd6twm4WdaUsXoFw+2EOOt6lmj+2qvRYC6XjpBIDKwlK59
         lSnRayLtoFSZZHIHKQ2Vs0u8a06YQ1YFp+LDxIrjWDdkCZEf4jbvfePO4KKAMuuLaLs5
         a0X7dDGDc99KcilueL9vQmMnOEnUNI+HsybZrZQY4m/f0KcKhNiaDMbWeiJXutOEDU8S
         9hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
        b=z2IWBzZuU3FH+se+Y3ns6D2oe0lsYTjROk8VmjlsY5JsnRo3cnViLCKP2/+2uNxLgY
         KqwP4Rsg7WVxTCVDlIQqp00m/fwrs7XsFefZNbYMFe4PwfETWI+ohTB+LE9sjPu7J7Vi
         C5ZrzOhTmzzZFjRF5qteV7TvXxokyl8vRUmVWM732ym4BMTtDSXB6mONL2KRu3+KsTBN
         cvYapW3cry1/g4ELhT7RifN+aAqI1UmUAsuNqPLz/AtIF7G/sWENcp4v9PfcXkS8Ps0H
         uCvZcYN022tx9LUhlG6Ou+HS/jzQxdNSnvK0A7bIEU6P0uiLM9Xk0gg7fN7sZss/OUrW
         1+6Q==
X-Gm-Message-State: AO0yUKVzVis++WcgxeV7lZPBcU2uFKvncNOPiUnArq2BXB5gQaMgjb89
	7N3wjC/4VgLFqwqT7lCO/oHUUQ==
X-Google-Smtp-Source: AK7set/YyrDokolJUA9eTExju2L4Xl1IwIifBnQdVPnxauD6XSY0IMli53ULjRHCUm4ngW3ahZKDIQ==
X-Received: by 2002:a05:600c:3c85:b0:3ea:f05b:50cc with SMTP id bg5-20020a05600c3c8500b003eaf05b50ccmr9296892wmb.8.1678094617810;
        Mon, 06 Mar 2023 01:23:37 -0800 (PST)
Message-ID: <bd6266de-59c0-65c0-6e4a-04312f590dd1@linaro.org>
Date: Mon, 6 Mar 2023 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306084658.29709-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/23 09:46, Thomas Huth wrote:
> For running QEMU in system emulation mode, the user needs a rather
> strong host system, i.e. not only an embedded low-frequency controller.
> All recent beefy arm host machines should support 64-bit now, it's
> unlikely that anybody is still seriously using QEMU on a 32-bit arm
> CPU, so we deprecate the 32-bit arm hosts here to finally save use
> some time and precious CI minutes.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


