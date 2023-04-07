Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211626DB6F7
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519150.806394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvF3-0004Ku-7u; Fri, 07 Apr 2023 23:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519150.806394; Fri, 07 Apr 2023 23:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvF3-0004Hy-4M; Fri, 07 Apr 2023 23:11:37 +0000
Received: by outflank-mailman (input) for mailman id 519150;
 Fri, 07 Apr 2023 23:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvF1-0003nU-T6
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:11:35 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a40117d-d599-11ed-85db-49a42c6b2330;
 Sat, 08 Apr 2023 01:11:35 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-51396f3e6b0so146058a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:11:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 80-20020a630253000000b005136d5a2b26sm3141345pgc.60.2023.04.07.16.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:11:33 -0700 (PDT)
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
X-Inumbo-ID: 8a40117d-d599-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680909094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cErFy4VVSXH+T35LT4D8bhMQRXEc0jWj0rx0ggjSPk=;
        b=OJFinG4r+Jx35MVNhHZcNTMCoIxRVzugHa8wQb0aF3/WTzIXXBfPwEM81GLW5qzvA3
         5ETEJsnkXy63xKZpvH1BGx4E4mJabdebFUPIucQkQ109TgyzR/OJANaStfogZeUwJSvB
         +n0AkGdqt/wNTf7EIX5oMoy0GvlBdDdwbxgBQ/FNmniodkjKXrGRz7rWA6vw+T9AgziT
         RkNSL9rUUEBJmTGgAlLH2V6qPGr0J/0/wvBQXd6nbZl2I2R617/+2FmNyTRd56JrEd17
         LWo9ZJvzBF+Jg+CjaCPLtDsd5FPc+J0a2N1UTbzoR7A8cxU06vM7OEL1iLwmOTtAizig
         nHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cErFy4VVSXH+T35LT4D8bhMQRXEc0jWj0rx0ggjSPk=;
        b=3pFIiv4VH49Ty4AxFiMV6H1p3/kEbOLEyi4uMyuEaGkoJEdNsDrJUXKGTt7gXMFKvS
         kCEUDOFdiF0sssitNZJUc4FGSv7jwXXfEpOn6kDC6Mr7nDgL81dYCSBWdXHREuAbiwiz
         B/Epsw8DZGP4Ofy23BM7d15sRl5IOwdGVCYEf9dLkZcC0xJNuRKLNDlSH1KY6hhxyA+R
         cY0hAIEzUp9P66rzVaufsH0A8R6wiIgeWI+tTcfE+iENpApkKWD1CoSX36YkPzUZznWY
         hzTagxPIJyfOrbQq1KYTDlOq4hXI0dblsM++sZTyS7io6SPn+pq82NTW+x03KFHvsMpu
         1abw==
X-Gm-Message-State: AAQBX9dPzzt7hIoim3z0/OxRd7UZkRQWPO+an0hfFPcTtHbOwcCvDfoP
	DvrS8b7KXyPLR8C0RlfDxAPCyOFQdhcTVk39VgI=
X-Google-Smtp-Source: AKy350bXu0YXNAHiNTKVWIi38x7qw1rEbHmvanIsHsxL3sMeptcsGTDsDeyKqZftiwBuvO2w43WOyw==
X-Received: by 2002:a62:1850:0:b0:62d:8376:3712 with SMTP id 77-20020a621850000000b0062d83763712mr155681pfy.28.1680909093896;
        Fri, 07 Apr 2023 16:11:33 -0700 (PDT)
Message-ID: <b2778af0-52e1-88fa-f2a8-cc4060835464@linaro.org>
Date: Fri, 7 Apr 2023 16:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/14] accel: Inline NVMM get_qemu_vcpu()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> No need for this helper to access the CPUState::accel field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/nvmm/nvmm-all.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

