Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB4A2FABA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 21:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884956.1294709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thaVz-0003bp-CH; Mon, 10 Feb 2025 20:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884956.1294709; Mon, 10 Feb 2025 20:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thaVz-0003Yp-9N; Mon, 10 Feb 2025 20:36:23 +0000
Received: by outflank-mailman (input) for mailman id 884956;
 Mon, 10 Feb 2025 20:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=78sC=VB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1thaVx-0003Yj-NZ
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 20:36:21 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeaf747a-e7ee-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 21:36:19 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38dc1dfd9f2so3138845f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 12:36:19 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcf81f3aesm9417190f8f.51.2025.02.10.12.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 12:36:18 -0800 (PST)
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
X-Inumbo-ID: aeaf747a-e7ee-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739219779; x=1739824579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGChCU3t2Mkh0Jqvlmq9bmLybhyJ/cFPxzjuCEBJ6pQ=;
        b=n1zwg3Z29FPij+wR3uGUDON2TmQCv6nbU+iMNUx0y61iHcXOsEkZDVqxOiZIbexLFO
         1h+jlf68WqgI8uRNe+S1UpUbMdcLyPxX8iYKYjAb+EPP8Gn32rW0b2GN8QlEZDUSU2DP
         XDQW4ZoQq6eOakZFulQM8P0WfP7GoSBJkdOmlPTkpEvcx9kJTEyS40rHl31Y4PMwhbfv
         5Srkpxhuq3md3jTI1WPCDP/iIqyaeN+4b9rIwJax6Z74mIup9t/feMeFaEdSBAYV9R/Y
         LMg1H2YOCpTh/k3j0qpCWXKC6foCfKwPmJzb/eSWZf4ayY1gNf8TeGtiGHsv5ww8TFxI
         WdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219779; x=1739824579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGChCU3t2Mkh0Jqvlmq9bmLybhyJ/cFPxzjuCEBJ6pQ=;
        b=H1h3lZ8IYRjfuqaH+3adwHWmxOJsTgUB6vwPYIhYt75kOrULuHXQ4xLQSFHLisCLLX
         RFhqTTenGBsqHyKaMr/M/ttnmOGwL5Xp8NFsnwxaWrvUHL1OaC+dPJ7TlH6PpeiBQoZE
         bXRYfgO1KSKJnqKgr6/NbBMDJbQyigIGkF8UyK6u+h9pvF7k58psOCAOEzboTJXQ8BIh
         23/IkR06xU7M2vxTpbmloQD0NlfjOyg+kxujd0pBU8CwIAA6tBDouJ0EAl4cnh+7JpJD
         G9e7E48akpphhYe9vc6+yk77hJC4EAGzAfBZtmPYwIXidRj+dDgdnYPipbsDBtDwPMRU
         df+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRmoLze6hQmekuQ20ffEMnwNWpAWCjN4ZPt2indYAXkOiqcNWsjxAwUzyLJhULlwfF66vxY+d1Dug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVrQaNmTaPa+iTREOjalG7CEgnBcLmMKmaTQkoJ2UbzqI7058J
	DMelwyGCgVXpNt4VoTlxfSOD+dOO95SiLjBxJn745ssyB5vdWLx8m3nzmYvELoM=
X-Gm-Gg: ASbGnctVu0xyMwZviZsOfOA0e5dt76xKFKwcsyVxCyOrdN00pVOyVt0cWknCMO2IPId
	Q+RtVrYvuaZDuvu3YGoTAqw7sQVhmK3WQ+PD6vmQ/6tppihHrGscG0mm0L9SG/+Q70n6out4LhD
	/GetG1KELDN1WCymYGK1UCtCui4jyue9jOsrZhq75N2Nip3w0sSUA+48MVkJUDsUOzB0/wITSob
	SC7JaPcjIKi43JrmbpMdoKqdb8OrT7OuX41iKrQXF8FcGUNNfhpGo6q/XwJdhKon+C2EfFIe5vd
	JzG7NLjKSjslwDxkYH7Ysk36GZzb7g26OXjSJ545Mhw3DulQYW1hh1WJ3ro=
X-Google-Smtp-Source: AGHT+IH8Y7/jwTb9oyHjCS6NcjTgnOdfVMqyXGy2F/qEHOBj6nrFDVsufEMDTAXnMFHwuRcC9Kr3Xg==
X-Received: by 2002:a05:6000:1041:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-38dc8dec2f6mr9585731f8f.33.1739219778547;
        Mon, 10 Feb 2025 12:36:18 -0800 (PST)
Message-ID: <029f55b9-9ffc-46a1-bb4f-370119ee980d@linaro.org>
Date: Mon, 10 Feb 2025 21:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] hw/sysbus/platform-bus: Introduce
 TYPE_DYNAMIC_SYS_BUS_DEVICE
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250125181343.59151-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/1/25 19:13, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (9):
>    hw/sysbus: Use sizeof(BusState) in main_system_bus_create()
>    hw/sysbus: Declare QOM types using DEFINE_TYPES() macro
>    hw/sysbus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
>    hw/vfio: Have VFIO_PLATFORM devices inherit from
>      DYNAMIC_SYS_BUS_DEVICE
>    hw/display: Have RAMFB device inherit from DYNAMIC_SYS_BUS_DEVICE
>    hw/i386: Have X86_IOMMU devices inherit from DYNAMIC_SYS_BUS_DEVICE
>    hw/net: Have eTSEC device inherit from DYNAMIC_SYS_BUS_DEVICE
>    hw/tpm: Have TPM TIS sysbus device inherit from DYNAMIC_SYS_BUS_DEVICE
>    hw/xen: Have legacy Xen backend inherit from DYNAMIC_SYS_BUS_DEVICE

Series queued (including Bernhard's patch), thanks.

