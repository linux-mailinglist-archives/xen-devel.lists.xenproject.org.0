Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4E6A5DD0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503591.775891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3Io-0006yr-7j; Tue, 28 Feb 2023 16:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503591.775891; Tue, 28 Feb 2023 16:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3Io-0006vk-4F; Tue, 28 Feb 2023 16:58:10 +0000
Received: by outflank-mailman (input) for mailman id 503591;
 Tue, 28 Feb 2023 16:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AN3/=6Y=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pX3Il-0006ve-T4
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:58:07 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 101acc27-b789-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 17:58:03 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id n6so9728877plf.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 08:58:03 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v24-20020a1709028d9800b0019a8597788csm6869085plo.0.2023.02.28.08.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 08:58:01 -0800 (PST)
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
X-Inumbo-ID: 101acc27-b789-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
        b=RWN+ArmRSoF3RqaIc/bG5HKYN8GqQFbTlJqpD8J7s/9B6QN61aZgGGWKFMc6a2g79w
         KJqn9iLRtx+zn11WIASPZu5yBM5TdDjbaGjTnL1SFAIEOHskGnjEjZeXpqPpy9V6n5p2
         r7+V8NqjySksekWlWPSSL7e6ScTvYON2coS2z4TIxMT/XzGJFNARBJobI3wyA54tVTJy
         4+NykP3xVNVLQ+bDSVh3IUKsGnLoIgjlbOtIeADpDK6klqd94TPH5PVodAtoJKkYqURo
         xk1ltaWPWxaGr1uf1su5Zt5E/T+lOxcnPBFwf8rxZx0hHx+VXAOHZ8qcAB7CIbnNZX91
         1vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
        b=hC/AqIfp6BgGzD3BPnNdVYUgZjvvbJrWPP+OllkiMpYwN4F+bqQxaKpSPB4I8QcawE
         S3A2q7HQXcPY0qoIr3BnXX+LPSJ/QjBt+xLrPYgZESX/LncOA4+gC1vamMBN7IpIe2mD
         PuWtmgO0dUHwqqawl0lRFZObZMKrWprTjFEoqij+FALjRnnG3lml6SlD8xRYDR2uEpxx
         afeP6zaynWs4LRp/fkYvStqh+pXqy0QPp62EWRn+pNeFUJaru4mD1l4cTxrPTbtd4Z7G
         lzfLYF9WJLvjUod7pJH0/cm6Wdbl9+woaYuENgjS4OyMJ0gN2OtX2GPCnPHTjCOr1nkZ
         4TVA==
X-Gm-Message-State: AO0yUKWfVK3gZAOQFjxzWMcVIdxGH8p2QHB51cbWBCqlWqntaq5TAmRE
	b3f0M35jbUxy6/zE1hoX2HdJfg==
X-Google-Smtp-Source: AK7set90WOEr4dwJPaDBIlNSyAUO8ngoVSxZiL6FRqc82zyAHJhoPcIuRFbTPM4j0T9hhlTBR6YUKg==
X-Received: by 2002:a17:902:b08a:b0:19d:c9f:44f0 with SMTP id p10-20020a170902b08a00b0019d0c9f44f0mr2708127plr.32.1677603482070;
        Tue, 28 Feb 2023 08:58:02 -0800 (PST)
Message-ID: <ca5f7fba-7d48-2a35-2378-188d86ef2002@linaro.org>
Date: Tue, 28 Feb 2023 06:57:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
 <20230228035958-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228035958-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/23 23:00, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
>>> Removing support for building on 32 bit systems seems like a pity - it's
>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>> and the maintainance overhead is quite small.
>>
>> It's not that small.
> 
> Meaning there are lots of ways to run 64 bit binaries on 32 bit systems?

No, meaning the maint overhead is large.


r~


