Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652BC6AB995
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 10:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506816.779997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ70E-0007Z9-OU; Mon, 06 Mar 2023 09:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506816.779997; Mon, 06 Mar 2023 09:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ70E-0007WH-Lk; Mon, 06 Mar 2023 09:19:30 +0000
Received: by outflank-mailman (input) for mailman id 506816;
 Mon, 06 Mar 2023 09:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XRxq=66=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pZ70D-0007WB-Fb
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 09:19:29 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdf9b689-bbff-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 10:19:27 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id h14so8036716wru.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 01:19:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm9449418wrj.115.2023.03.06.01.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:19:25 -0800 (PST)
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
X-Inumbo-ID: fdf9b689-bbff-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
        b=DoGQQJZdoqFHDOtbxQ73NJqmi02v273gLkXN0yjk+YT/7zY8EqBGtqRcik5T9ez3Nc
         nmJtaAIbHFQJTvGfQOvEa4PBZcuRsqvDJEWjmo2Y2XEDY16FoZoRKjBVKMuwsn9W2ywc
         YBsAIbZM+gzVtaF08BtiIgi6Wri99eR0o0L3Gfc80PI6IOY0c0tXBZL4iJnxqqEz+ljs
         fHix0JKHzhM9mKZLmzeQqzCO/ilr8EOL3K0jV27w82Hi5T8ODkqWcls6gAkKAlVW2ZrW
         k9pIh2xOiSlXwjQf6pZkO4zbxCy4efHY34YrfeAPfSnZa1/5gBxIM2LWwk+zlD6lxx1k
         VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58NVK48NfnWrtVLNjDhVbfVDpCm42d+xmhl5m+sFIt4=;
        b=DxWDUW3bdqeKe1Zg5FpFFDWCIIn5T6CCI+cH65c3oOeuurh1SNb9XPWU6460aAP7kK
         FVqcfjYjD4W/kSo8Rjb1x9mzS/3oc4v3VlYBcez0wKcVT9JVIo7P9uz+EaufTvB3EcEV
         WUIseR4rkIlDElp5PiCsxtneWDBBfTdp17e564ZXsANN8ADUvc/KlCDGrsI37xGTd67t
         ODSpnbWifRlTbHeOP/72xXnvE/Zpdrj6gsrSrMsfj/MsThRVgDrRhMl8hebsm3Mpf6JA
         Y1NwPupAmRGXHA/wsBwcUdeYFc96lbIiAxSl1GAhAgRfS35xNpkDE5Jn82fc9LEZrxc8
         s9tA==
X-Gm-Message-State: AO0yUKXjA8joygQKJbKGcXQ2u1W7FHjdmisJUo2LqHLcHp7ZyXv3Cfhh
	DSbH7iLl+kOMOSDBybiK0WWD5Q==
X-Google-Smtp-Source: AK7set+jsAty6DpV+HYFXiTVVgLiQ5rrjzNYIewz64rQR7F0LEGTSV6+QptEOtlt0IcQBtu54VHDqA==
X-Received: by 2002:a5d:664e:0:b0:2cd:defe:cfd3 with SMTP id f14-20020a5d664e000000b002cddefecfd3mr6817401wrw.30.1678094366348;
        Mon, 06 Mar 2023 01:19:26 -0800 (PST)
Message-ID: <e2af415a-79dc-f4ef-6c10-5f6454c11b58@linaro.org>
Date: Mon, 6 Mar 2023 10:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] gitlab-ci.d/crossbuilds: Drop the i386 system
 emulation job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306084658.29709-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/23 09:46, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU with
> full system emulation, so let's stop wasting our scarce CI minutes with
> this job.
> 
> (There are still the 32-bit MinGW and TCI jobs around for having
> some compile test coverage on 32-bit)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


