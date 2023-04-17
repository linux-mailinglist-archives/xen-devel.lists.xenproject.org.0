Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB86E47D6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522072.811231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO3D-0006vc-QG; Mon, 17 Apr 2023 12:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522072.811231; Mon, 17 Apr 2023 12:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO3D-0006t6-NZ; Mon, 17 Apr 2023 12:33:43 +0000
Received: by outflank-mailman (input) for mailman id 522072;
 Mon, 17 Apr 2023 12:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=be8F=AI=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1poO3C-0006sw-QU
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:33:42 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 158f9bf8-dd1c-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 14:33:41 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso1643917wmb.5
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 05:33:41 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1c7406000000b003ed2c0a0f37sm11811485wmc.35.2023.04.17.05.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:33:40 -0700 (PDT)
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
X-Inumbo-ID: 158f9bf8-dd1c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681734820; x=1684326820;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwFF4OlAc8WhFMJkqHAMU3vekqaWmw/4QM0BxFjkB48=;
        b=YYiMHYka6VsDJYi2gscWqaahkAinjOFRm6DbLxe3JVigfbf7X8xyh196bUhxXbwGIA
         fbFosGudK5afJc3wrMrjhajrsnrRLbLK2pjN/r3cD0Ij+J8qQsmsVlAkcleKr72sMjGf
         vG/ofoI/fa128DN8xM4UZXfHugGHV3TLODbSj8oO5ArJpWf9mZcmvFc/NPZzxPmklgtr
         MmVsREIV3J4iU1jzKbFE/PjWoiOpE3qfrdcrf/BdwDVsEJ9Blm+iRI9J+jja3VJ6O104
         gMB+5mrzDPo6ZXmKOn+5BKTgDL4/cNnBbYw7xMcL4ZsPdMSknPudzQNuRW+ah/X8n4aa
         AfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734820; x=1684326820;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwFF4OlAc8WhFMJkqHAMU3vekqaWmw/4QM0BxFjkB48=;
        b=Yl0DFaEKS8BL6xkPDf0BQPI62D5Rg11LMH8aS8BKz22J5OFybIolwfcEIhU4dEBWKw
         DtY3UNoigh0e/1Vckzhzn/ZaB797FbYeVzeNjco3lYbvDHfdNzShO7jKg2a75DNXrFQ0
         RQvDqMDZNcAQCQ4KKv+qujHu+lbOEpFkH5sp4nOVzscCSvpAytg9+tn5ALCRTQiFcRXP
         i4S8nzpcQEaP0r0c7l2IQs0LtHTT+7vwwfySmXyxvbPeSNfUqWwVS6di5PI47wG7wRDE
         Z/GzEYDLw03Yi+4gTCrQvWNnvBJfpTnY5/1BZbf3L6yirUBmz57OK0ZpwwFif0nJ6nf5
         BDgA==
X-Gm-Message-State: AAQBX9eFZ7k5qNOrYpf1LAteETyH6j3mjxWylflao6EJTcteeLZq/NFq
	7gl1Ap2tI8x5MGntvKcf8ns=
X-Google-Smtp-Source: AKy350aN1LXr0qrwFoe7EoDFDDVNhV2/qcHWtPrIt1pJ+Qk+uDEMi1hR+uzq10YOMcZsvTQTe0DXYg==
X-Received: by 2002:a05:600c:2051:b0:3f1:6ec5:bc6e with SMTP id p17-20020a05600c205100b003f16ec5bc6emr5634089wmg.3.1681734820491;
        Mon, 17 Apr 2023 05:33:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0b67440a-9c65-6606-5e24-6fb01e8543a3@xen.org>
Date: Mon, 17 Apr 2023 13:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 4/5] hw/xen: Fix double-free in xen_console
 store_con_info()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230412185102.441523-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2023 19:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
> then for some reason immediately call free(path) too.
> 
> We should just use g_autoptr() for it anyway, which simplifies the code
> a bit.
> 
> Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/char/xen_console.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


