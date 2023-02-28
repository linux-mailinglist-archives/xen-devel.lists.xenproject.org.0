Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0296A58FB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 13:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503317.775541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWz46-0001ne-Qr; Tue, 28 Feb 2023 12:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503317.775541; Tue, 28 Feb 2023 12:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWz46-0001lb-NS; Tue, 28 Feb 2023 12:26:42 +0000
Received: by outflank-mailman (input) for mailman id 503317;
 Tue, 28 Feb 2023 12:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H0fj=6Y=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pWz45-0001lV-LX
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 12:26:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 272105e2-b763-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 13:26:40 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id g3so648607wri.6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 04:26:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b002c54c9bd71fsm9920712wro.93.2023.02.28.04.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 04:26:38 -0800 (PST)
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
X-Inumbo-ID: 272105e2-b763-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
        b=K3wluKxcE/rCvWqOkwXeehlmYRMbEq8RyljUSJLktvXWQYzvfV0JVuxh7sEjOItHLy
         zkB0bDfg1w0blyu7O79patbUxjElHTkQWl4dXxYhVt8U8TUSLz+j6ddCyrJhS7m5cNCn
         JLxtUFnp8BSUDvt4S4Tw2zxaHnbV4XxV4VEVqJ/d+Y8YmSoKUc7w/Eb9CcXJEnBvBW/A
         surEgKqpwer9fNgWwtsETr6+JOUrM+n0f+qX5qRY93yOvzTIh3pBSxNrOBcD3EKmU40Z
         QzGrVYDctK5UF7fdvl4Q/aoN9YBMtUH8C7ppyKj5Xnqt7NAR6KHA4YfeOrcVsxTwOU7s
         Czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
        b=s6sZ/YnkEe9gF47KfF8eXndDItZgWe7jTics2NzxZPOxzEgNordHadWPIke+tIXDRM
         MEYy4OUvHL+49aGirZYlA8YWJaINc0p8Jvl1yJWRlHgAhBD4JpFlqYnaxSckhacWgq2r
         UvMZAD+qSI1GoUt8qjiDBbq+eqN3TFMQmltvhrV+VedW+mXCTtEMmcedR9qgGPm9IZ1N
         4VjW65OR8g2CIlkOC9dPEG+bF9XDBWXRhtfQBaCM3Kwoo8N0PZLiMjJf0PpNkxkm+ADk
         bXkBQ4tdJLFBYQXtODIMu27xTPeNwMaQ0zdz4dSHGuK4KLhhvBvTwlE5yEVbzb+prrZU
         Deww==
X-Gm-Message-State: AO0yUKUlqVuT8oqZqVkCnnOcr/sfDdO7rpJw11cPshu5sIG/exHyA6K2
	kPNunTUrI6U3aw1+qAtoYyifvA==
X-Google-Smtp-Source: AK7set/FeEH3SMp+xTRs7KN0rO4ziPX4ZU/IYrCCDHUXsFss9SGulRgXPV/twaTftMt+Opk3ZZcv+w==
X-Received: by 2002:adf:f405:0:b0:2c7:2cf4:baff with SMTP id g5-20020adff405000000b002c72cf4baffmr2283941wro.70.1677587199717;
        Tue, 28 Feb 2023 04:26:39 -0800 (PST)
Message-ID: <084ec45e-944c-32a5-163f-d2fe5666d3c9@linaro.org>
Date: Tue, 28 Feb 2023 13:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
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
 <20230228035917-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228035917-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/2/23 09:59, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
>> On 2/27/23 10:12, Michael S. Tsirkin wrote:
>>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>>> I feel like we should have separate deprecation entries for the
>>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>>> although they're related they are independant features with
>>>> differing impact. eg removing qemu-system-i386 affects all
>>>> host architectures, not merely 32-bit x86 host, so I think we
>>>> can explain the impact more clearly if we separate them.
>>>
>>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>>> a superset.
>>>
>>> Removing support for building on 32 bit systems seems like a pity - it's
>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>> and the maintainance overhead is quite small.
>>
>> It's not that small.  It only works for single-threaded system mode.  It
>> silently does not honor atomicity for user-only mode, which is perhaps worse
>> not working at all.

Will the same occur with 64-bit hosts when we introduce a 128-bit 
target? If so, there is no much code we'll be able to drop,

> We should probably block multi-threading on 32 bit then.

so this sound a user experience fix.


