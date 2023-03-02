Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA866A8B81
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 23:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505458.778256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXr5m-0003NN-QP; Thu, 02 Mar 2023 22:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505458.778256; Thu, 02 Mar 2023 22:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXr5m-0003LF-N1; Thu, 02 Mar 2023 22:08:02 +0000
Received: by outflank-mailman (input) for mailman id 505458;
 Thu, 02 Mar 2023 22:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pWRm=62=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pXr5l-0003L9-23
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 22:08:01 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b130bdcd-b946-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 23:07:59 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id l25so552355wrb.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 14:07:59 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d66c8000000b002c573a6216fsm448290wrw.37.2023.03.02.14.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:07:57 -0800 (PST)
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
X-Inumbo-ID: b130bdcd-b946-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
        b=U82HnNmnIlR8fsbUOzoyUOrcyk+UF0aCzllzpum/8sOkxYueGYisYF+f0M4+iCitPt
         lA8X8eIusLZIDxCoW2ITywyqVxF102PaWtOcX2ngEQtr3sbtWCAs/RK470AZYh4aObfW
         xTXSkcztl32ehSaQNeKck4QZslyEpWK/jOZXrrrb+S8Xs10olWuagHCYfiescykm5jIO
         /WGN2la8HKlJaJoSDvW+oIU8JDxhFsyJ+csnc2HLPgMUfUqrAqihbd1YnsYSyzLNPQlZ
         BG0M2UJM5hmPHw3pzydrf6s4Yo5XBR9Cq0TJauUFlBH79CJTfmytfyhWZXbHZ0hXHhdh
         gSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
        b=mJ8QXe0M09xUoSF366oa6/ydLhcyB/mHGC6knUe2pDqFMlO53wXlE92KbBpAeXGgva
         YA8ZOi4uNN4SnqYjXhU81HJv5zy7iwawEPvmsuvRlauSsrrABc5hl1jPk4fpVMgDtOmX
         4tSUsyJ9aEt7hjqXgi2EFiA0th3j5RTbXOZ3YphKmomte+yVunQiiCoCsF6T+SqlBdfn
         /DMTVPgJSX/oX7C31bhvB5prB25D/EaQzEsvWRsoIT5ZUOvPBQkUUrN9r5Kk6vRPnUTn
         qlGcN2aVLnAWo0Oyr5JjEzZJUlppTEyhrNKDNEf2dZgjAUQtXEvMKFTCCzPnEp+dv8En
         ycoA==
X-Gm-Message-State: AO0yUKVq54oOtZHiH+bHdk2GVde/HvqtFNVosbhqk0QG5R3BsbV1BQDx
	tm2FAcSXA87LmRSHBuOPSVPBLw==
X-Google-Smtp-Source: AK7set/zRREzUl4g52CStSVhdiUVcMgbt0PP1P8PqAH2s47EeF75hS+bGX8bzaTEyaGL4tkTSSuiOQ==
X-Received: by 2002:a5d:468e:0:b0:2c7:1b42:1cec with SMTP id u14-20020a5d468e000000b002c71b421cecmr8344921wrq.23.1677794878584;
        Thu, 02 Mar 2023 14:07:58 -0800 (PST)
Message-ID: <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
Date: Thu, 2 Mar 2023 23:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>
References: <20230302163106.465559-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/23 17:31, Thomas Huth wrote:
> We're struggling quite badly with our CI minutes on the shared
> gitlab runners, so we urgently need to think of ways to cut down
> our supported build and target environments. qemu-system-i386 and
> qemu-system-arm are not really required anymore, since nobody uses
> KVM on the corresponding systems for production anymore, and the
> -x86_64 and -arch64 variants are a proper superset of those binaries.
> So it's time to deprecate them and the corresponding 32-bit host
> environments now.
> 
> This is a follow-up patch series from the previous discussion here:
> 
>   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> 
> where people still mentioned that there is still interest in certain
> support for 32-bit host hardware. But as far as I could see, there is
> no real need for 32-bit x86 host support and for system emulation on
> 32-bit arm hosts anymore, so it should be fine if we drop these host
> environments soon (these are also the two architectures that contribute
> the most to the long test times in our CI, so we would benefit a lot by
> dropping those).

It is not clear from your cover that the deprecation only concern system
emulation on these hosts, not user emulation.

I wonder about tools. Apparently they depend on sysemu now. I was
building a 'configure --enable-tools --disable-system' but now it
is empty.

