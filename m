Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3BA6DB6E6
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519141.806374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvD8-0002QU-If; Fri, 07 Apr 2023 23:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519141.806374; Fri, 07 Apr 2023 23:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvD8-0002Om-Fp; Fri, 07 Apr 2023 23:09:38 +0000
Received: by outflank-mailman (input) for mailman id 519141;
 Fri, 07 Apr 2023 23:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvD6-0002Oe-BF
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:09:36 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e029cd-d599-11ed-85db-49a42c6b2330;
 Sat, 08 Apr 2023 01:09:35 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-517c01e6660so18595a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:09:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 f3-20020aa78b03000000b005aa60d8545esm3564626pfd.61.2023.04.07.16.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:09:33 -0700 (PDT)
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
X-Inumbo-ID: 42e029cd-d599-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvSIGGl7kyzrRPKD+1h4YAIP7+IU0OISKySWyKHO+jg=;
        b=iv6gr2hKVqwKYI+iTQN+8od7y6Vm/m73ky9/2diyxBhZPqEorU219WD2XJzyvYDYRT
         EQnhzs/V9uvYpJLy4VBiCLJDPSSyy/mk7kdUnBMVS5pdIZkqIfGf52EThRLsFjAEdEsI
         75R64mVKrvYX9fSs1K2fFq6b2G/rdvEnYm5oV115etWVrXcUd06SIATm2soLvb5zJ2rS
         aLj36ZCRtc9CMFkr4v9c3m54c5MWwJYwceHUVQL+Hc3QAWiaTznLDbwG3uZRQ1o+xHSV
         QewZOhFy9l4j9VEGUvSVoAuQtIMQ9HwTJxUwxMmvV2wdOiXGWIwjq9EvrUIb00tY50Wg
         1WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XvSIGGl7kyzrRPKD+1h4YAIP7+IU0OISKySWyKHO+jg=;
        b=t2GXLzkczR/QAZSWUSfUCNrJslAw5GKzXI0k/tmGeEpqRIJYFtGIXRn0P1cNTzrj6/
         tek5e2pMsneZygp3zp85yTA2jztAQSSze+/aL58mtj3YC9YjAyjqsN5JwqFFXbciRwhW
         3J841P1XfKkwNASXu5r2jNuD/RbRH0UmVufTypPlox9kYAdDTGe6N52yoGRxTpfrzcdn
         F3ovDdI/fza0rdfoqB/QaJCkwnfkfyZpBnX+OCJVtP+cRNtYC/GYrlCSMfMoZZG2I9i+
         +T76fOFDzD0m1tLDVgVclKSeWq8ZSiW9AhTcCR9fqXfvSjdRYXmp5Yl1VDo9HM5Y04Zb
         5LRQ==
X-Gm-Message-State: AAQBX9djz6kNUvIcSkPqTxNZuLCyKJrdHkaxiJNNqH4DCQMXjDMaVJsf
	oY9+mapUoACU7zJxN1RjxKoDxQ==
X-Google-Smtp-Source: AKy350Yqp9FrNOy78lp7BrA74JA2K1IJ9euoV6m53eCZnb3f4VQZGuFjTlRtLSsG6RBgf5M2spk2Qw==
X-Received: by 2002:aa7:8bd1:0:b0:62a:9d6f:98dc with SMTP id s17-20020aa78bd1000000b0062a9d6f98dcmr3877311pfd.11.1680908974132;
        Fri, 07 Apr 2023 16:09:34 -0700 (PDT)
Message-ID: <48b9e338-e20e-95f9-c611-3878b24ccec0@linaro.org>
Date: Fri, 7 Apr 2023 16:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/14] accel: Rename struct hax_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> +struct AccelvCPUState;

Missing typedef?


r~

