Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1073A7B6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553915.864774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOSk-000442-H8; Thu, 22 Jun 2023 17:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553915.864774; Thu, 22 Jun 2023 17:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOSk-000428-Dm; Thu, 22 Jun 2023 17:51:18 +0000
Received: by outflank-mailman (input) for mailman id 553915;
 Thu, 22 Jun 2023 17:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3b9O=CK=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qCOSj-000422-7w
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:51:17 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a28614-1125-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 19:51:16 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f87592ecaeso6680660e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:51:16 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.47])
 by smtp.gmail.com with ESMTPSA id
 i14-20020ac2522e000000b004f24db9248dsm1195907lfl.141.2023.06.22.10.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:51:15 -0700 (PDT)
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
X-Inumbo-ID: 62a28614-1125-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687456276; x=1690048276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RxDEfypLP474dWXJLDSfwdHncLLmi9Gthq1bxnH6Sg=;
        b=RiVWMtP0j99xIRYUNXDURWNefogBeHrukb98HKl2KpQPFeqzG8I5jV1I8RYGUIxgwH
         sBTf6FPI0LAFSEQpvawCbcgioqZrrkhjCenDgar1wInj2SzuwqjwDBLhQxIR2y/WHDOD
         uDQ5+I4pvWVB6lwB5UW3bgC25Cd4/1Dr4pX5ff+Xtzu5kIWnQxozPwnZBupIPOtpEfbi
         AxCY/kmKMitTxzq+qp51TgVcvHwWugs+tFjPpja+shXEeqz4rfRWJr73IzbwST2ryOSo
         yu3gSElU9n8FQ6tnrRY0Gl+RD1sXGK1RjAue2K0BBFP2LCwPwBr1gimeAqkmcjsllPjQ
         725w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456276; x=1690048276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RxDEfypLP474dWXJLDSfwdHncLLmi9Gthq1bxnH6Sg=;
        b=Hg+inBJmv3hnbjv2HuEw589GpowQvTqL+PrdOtCiFxwsKdnxQ5yFXn6aO8D5avpNm9
         fuUbBZpU6THuYbvKyI2VDQfuP/7qTHoffBvf/WmrNDTmqohEkyngXaP44N7kdztbuqJi
         lsrESPAmJ2rq4uL9bEIzGUmda2Th4FjR9eduP4OE1bHoPSaPd2iMmHncH68AXGysRTeU
         vWfzRl93pettI9tIhZE7oFazfrOr4ARktF20281Tv23be8mW4ML/fOqEPPfOxlPvZwVG
         ecKXd3uYUf2Ndbucz1rNYH+VYsV+2s82wtsCidsRAC6z/MGRzhRTavYR9IQie73wgEQ3
         LFlg==
X-Gm-Message-State: AC+VfDxqb7lCMbKbXVMVkkOL8BKs5WBMCthSnzGadiaVPqvlhUfqYYMx
	/WQvkHloHibccWKkT0JbU0Q6iQ==
X-Google-Smtp-Source: ACHHUZ4jTKt0S9wGV9j57uZV2AskBM6ykJg1BX+PUA6Y8ggImBM58aMPiFh3pdEHVJWhW5Jzj4GL0w==
X-Received: by 2002:ac2:5bca:0:b0:4f8:67e7:8a1c with SMTP id u10-20020ac25bca000000b004f867e78a1cmr2333897lfn.45.1687456275753;
        Thu, 22 Jun 2023 10:51:15 -0700 (PDT)
Message-ID: <58c48176-c9b2-0184-a93f-3168f66b7d72@linaro.org>
Date: Thu, 22 Jun 2023 19:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 15/16] accel: Rename 'cpu_state' -> 'cpu'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 xen-devel@lists.xenproject.org, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230622160823.71851-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
> Most of the codebase uses 'CPUState *cpu' or 'CPUState *cs'.
> While 'cpu_state' is kind of explicit, it makes the code
> harder to review. Simply rename as 'cpu' like the rest.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I would have chosen 'cs', since 'cpu' is often used for ArchCPU.  But ok.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

