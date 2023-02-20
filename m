Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAFC69CF70
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 15:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498176.769004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU7CG-00061D-Oq; Mon, 20 Feb 2023 14:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498176.769004; Mon, 20 Feb 2023 14:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU7CG-0005yy-M8; Mon, 20 Feb 2023 14:31:16 +0000
Received: by outflank-mailman (input) for mailman id 498176;
 Mon, 20 Feb 2023 14:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mE7+=6Q=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pU7CF-0005ys-Ba
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 14:31:15 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38be83e8-b12b-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 15:31:11 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id p8so1558725wrt.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 06:31:11 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm5769962wrs.49.2023.02.20.06.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:31:10 -0800 (PST)
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
X-Inumbo-ID: 38be83e8-b12b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uapwYjG86j09Ao3mvRI6hLJtSjzf0Mx1ain+YxVd2BI=;
        b=hSQTdGUJEXGKq5Wud5TAYYDkn8KABInLFUYE+YusrDV5Ovf+HsD1rOdu/OnXW7yA9Y
         eLXGYOLqkjZwaniw06Fn35BRstiJPQqPptcg+lPynDycV+nnITZTXrDlzT9zq7VLHQgl
         2NVvHbT+7iwVFKKFHGEk4JpNEEYReR/QAVNqh4USvu9GLyKxDHEYmpd+hQ+qiQvxWkSe
         bKtYvnnPls0hz5vSBMA7BtFrZb/wCyFT7zTjubhQF6XYPx7p/3fwQGq8c/oUna51Q/Oc
         6iSm3PD/6+OHGjU0yeR+6tu1RGdsff/OGIn/FeV/Z/0K4qE1Y3xAWqY90dx31HrYwWSM
         CDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uapwYjG86j09Ao3mvRI6hLJtSjzf0Mx1ain+YxVd2BI=;
        b=XtNUERh//UdItS1tAHcUsiH6FYJqfv6wcsXTXKsILQEdJ7ACrMIHAO9AlS3LeKMeWu
         zbhgB5jzKD3Y4SzWtoZHLenXhDB2CxR7DXY4IwpcBteqjKYe+EiXm5SagiSTD4ssi8c7
         vlpnGugFVq+1pmlELzjLu84hOnVZ0yFM/dkjpciCRRdEq27RROudTFmd6nUAKirJieDf
         27L5D7SdT/CSHZRD81YhRjCtr7hqzKd8rPhzZZHA1lZTE2cHo7oFBOWhzElOmhPcZHWe
         XakBCs1Em/6+9Kw3fYivpiWFsrBcvRAoruJ3Yw6XZa4T5H4ovkf4eWDHCc+ut3HF7j/f
         D9Ig==
X-Gm-Message-State: AO0yUKUn9DP6dF1hIp+AwzSNBG5F8ZfFfxDKdKFNhCkd/t5+oU4de4Rt
	wwN9E19EyVPTjooJndqlb24=
X-Google-Smtp-Source: AK7set/rskOGDs/Z2znmzqCCaAutsqAyx0x+1Ja7sEXGjK57+P5aqoHZuUBPoOyvYEvouv1K55YXtQ==
X-Received: by 2002:a5d:4cc7:0:b0:2c6:5168:7785 with SMTP id c7-20020a5d4cc7000000b002c651687785mr1520329wrt.28.1676903470855;
        Mon, 20 Feb 2023 06:31:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <44b7cee5-5a8a-44fd-7cd9-e50864a6dfa8@xen.org>
Date: Mon, 20 Feb 2023 14:31:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] accel/xen: Remove dead code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20230215153451.30626-1-philmd@linaro.org>
Organization: Xen Project
In-Reply-To: <20230215153451.30626-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/02/2023 15:34, Philippe Mathieu-Daudé wrote:
> Unused since introduction in commit 04b0de0ee8
> ("xen: factor out common functions").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/xen/xen-all.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 

Acked-by: Paul Durrant <paul@xen.org>


