Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E06AD4F0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 03:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507194.780441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZNIx-0001sj-C0; Tue, 07 Mar 2023 02:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507194.780441; Tue, 07 Mar 2023 02:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZNIx-0001r4-7E; Tue, 07 Mar 2023 02:43:55 +0000
Received: by outflank-mailman (input) for mailman id 507194;
 Tue, 07 Mar 2023 02:43:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NRYl=67=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pZNIv-0001qy-Tp
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 02:43:53 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e315cd8f-bc91-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 03:43:50 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so10629225pjz.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 18:43:49 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 li11-20020a170903294b00b0017a032d7ae4sm7360964plb.104.2023.03.06.18.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 18:43:47 -0800 (PST)
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
X-Inumbo-ID: e315cd8f-bc91-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678157028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
        b=GJPBc3z+jhZ0HwjeNXwiWdLykxv/heTtof0JnXRPLTjNLt7XoK4QATdgNl+zC+uYER
         10d0xOLQbQ5tKYoDbIepka+6YTmlOUZmsOSvE70UNfF3w9HogCJB7jX1p7RTdlmoYAfV
         JPY7PUgR2Wlg1G7tB4aycGrixENBPBoSczpL3n5ygJXhOGdt0hO2g+lGwFfljuixSS0L
         MJPHza/Fg/HF+l4hSqLwluZc/FJxCAJaiegNxwZntC0CHWeeXnLOvth8uFAOaT2d8fta
         bCGTwmswBAEx6jDFOnheZ5bo6qC0nc8ABG1jflBxDQb5iGqPx1QACgdrDd/l/2Vtkp5n
         KjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678157028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
        b=37xJ1qOff/rUVDMRHa3OWeB8dkyY+c6rqHEsYyCJdIbe19QT+sRkr7Navm9PJP7hBJ
         92t/By/FAONFkQ/L9b1WmeL3g3hcUnjgxU0Xb4/I8pToZE5QlfQE190FP4LgPy3161fT
         tPfTFsabGTQH7i/Dz6O2q5IvpwfbC2MNpQ0X72EuAY2tjDxcQLX4Mnj1OdfyuUkRK0aV
         /QcxchhqXoQLYzWytZj4QDc7pciq+ceBsnp5WtIio/zXHFO+oCZsSlRJGgtaTgrj0taP
         A/1et1n5EWyOe0kZBfMH7iG9HDl3SALfSzOWVsH7U2OpaC/DZS9WScrphQujHKjB68oo
         NIzg==
X-Gm-Message-State: AO0yUKUgxCyaN02VIkM1If/2a+yh/mEfVGuu8ckSKDW5mYq0HkJk0X3O
	sovkM/m/inwfDINWVtSQ5cVj2w==
X-Google-Smtp-Source: AK7set8T2iiJsAa1B9KEmbNwjnC1t3/UPR2fiiOhp2gcxJV18BX8m8me8ijn0RPS48CAkLqh08YiJw==
X-Received: by 2002:a17:902:d2c9:b0:19a:7d0e:ceea with SMTP id n9-20020a170902d2c900b0019a7d0eceeamr14474139plc.25.1678157027766;
        Mon, 06 Mar 2023 18:43:47 -0800 (PST)
Message-ID: <861d7a45-734e-8115-ec57-7d0629fa36a1@linaro.org>
Date: Mon, 6 Mar 2023 18:43:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-5-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306084658.29709-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/23 00:46, Thomas Huth wrote:
> +continuous to be supported on 32-bit arm hosts, too)

"continues"

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

