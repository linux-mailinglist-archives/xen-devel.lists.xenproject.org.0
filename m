Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9B76A4C28
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 21:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502903.774935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjzx-0004FW-EZ; Mon, 27 Feb 2023 20:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502903.774935; Mon, 27 Feb 2023 20:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjzx-0004D1-B2; Mon, 27 Feb 2023 20:21:25 +0000
Received: by outflank-mailman (input) for mailman id 502903;
 Mon, 27 Feb 2023 20:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5XK=6X=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pWjzw-0004Cv-6n
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 20:21:24 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d1f84fe-b6dc-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 21:21:23 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id h8so4756526plf.10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 12:21:22 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ik14-20020a170902ab0e00b0019ab3308554sm5011860plb.85.2023.02.27.12.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 12:21:20 -0800 (PST)
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
X-Inumbo-ID: 4d1f84fe-b6dc-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
        b=eq570Uk7nUf0H+E1ibMnyXd+duQPVSIXFSVpO8tz2fL005OZ44CTxh56oXPJ6AbnWr
         tcx8DpYLJ3za6vqFmAvo+mTVedTOqzojcNep+S6SRdN7XHn/ZTqV4dYVdMxuk3af/zCB
         ZzdM1h2KCMoR7P5PwOLwnxWpCCaFOPFUoJHKbbHSCRrMTH2XRDow4S8ousW6L3VujFm/
         zTSoaAKkyRJC7Qe3cqgdcgfwJ7+R6tE6DXk/+St4jhIDHext8GlpJTMXfh+8H792pEBs
         3eK7uwdqAlvh4GlFPSKnuuv0zO3PJHbVMbJnznxqcg9LPjgjdY0QlMG9NzMIK5a43Fq3
         imLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
        b=tZ6uCYpsanmhD1ozXjPxTVkFhEtbIHlJNMBvcXVYrRkWI8uY0WBLP7vRdabwV7VvzS
         +GHtvV93r5R3RuJXWDy0jsFHI4bWOTRX6rqGH87sDW9cvpBDup7WHPYDLxLvJ7AIu+pf
         40Xt+Lhu010hcrX5p5Ph3VKIr+Ti3oEnjVC6vfwmZfkVRjM4QJoOoXSjB876VTbtfWuB
         5q0TG8uwNJ2d+reDVT7yOaqOaeS0D66iwGqBZBh0XPZ6r3vdK/hmcoYbXpnrhiLBldHd
         /CmJf4g0RCAl0IC+5vce9JG/gxWLUZQHKbKVyBXqe4tp14zZ1+garxKC7KGx7yT+YqLr
         jztg==
X-Gm-Message-State: AO0yUKV0ttzi6FtjJI9h3RJyhHxg2YPcEDyjcDfL2afzls47QxP29oOx
	jdR1z8TyrUI5Zk3tD6Hy0I/u1w==
X-Google-Smtp-Source: AK7set8ikfBIt7vwSk8VIe8f/SB+uBUUEM7nzc8hrLDES0Uq//JkcsqoknN07S6lfqP3UuhLjdVoFQ==
X-Received: by 2002:a17:902:c401:b0:19d:297:f30b with SMTP id k1-20020a170902c40100b0019d0297f30bmr245159plk.19.1677529281526;
        Mon, 27 Feb 2023 12:21:21 -0800 (PST)
Message-ID: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
Date: Mon, 27 Feb 2023 10:21:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/27/23 10:12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.
> 
> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.

It's not that small.  It only works for single-threaded system mode.  It silently does not 
honor atomicity for user-only mode, which is perhaps worse not working at all.


r~

