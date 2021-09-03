Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B637D400693
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178419.324405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFko-0003aw-BA; Fri, 03 Sep 2021 20:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178419.324405; Fri, 03 Sep 2021 20:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFko-0003Z9-8B; Fri, 03 Sep 2021 20:25:38 +0000
Received: by outflank-mailman (input) for mailman id 178419;
 Fri, 03 Sep 2021 20:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFkm-0003Yw-Ua
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:25:36 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c79fb02-b334-4c5b-90db-2703ef3efbad;
 Fri, 03 Sep 2021 20:25:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x6so306880wrv.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:25:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id q13sm324320wmj.46.2021.09.03.13.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:25:35 -0700 (PDT)
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
X-Inumbo-ID: 5c79fb02-b334-4c5b-90db-2703ef3efbad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W7k4RtqOZy7ya1WayabP+HxNcp5Fq3Mk2ZbTc+R+8wk=;
        b=Y7PtSwX3LA3cO29hKgEQ0rkI844j3EG/DnwVbuMutIDQuUE90Uvns4x6mk4yf7B+cm
         Z6Ehutu4130di1yQJkVCvyamcRHY9V7H8+/nW9cFA4cQP7R4+86sspF6SjVkmgr6mnbK
         taRoXaEV9tG9Hfk01UC455nNMEqk+FHQaJULcihgVHUwNroTfGeteSjAaIcGVZ3lfe7k
         vWQNvEvJXomiaKpwJ4tHqL+1JgHxOaDk5BcG2O5Ba51DpymToNVYzbCqx9P90GXzyM8j
         2b3ZUyaRty9XmOwlTzWm7qEP3nm+1Lkh4CwG0qqunwT4jbB+PrEQJvI5TjsNGJMxJsoD
         DntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W7k4RtqOZy7ya1WayabP+HxNcp5Fq3Mk2ZbTc+R+8wk=;
        b=AiP9q96TBkyUl2OWBmPi6OqDblElP0cTyrelP6EEQV4z35oD41XPuIWMxg3tqQO+Fo
         bARSU/8Q4/M/yqHc1psV5XY/u34nxXrXgycZvVhLMiFsmASkLl8RAVsWkPAOoXNjOo4H
         Lmr4kftJ7Q1vZw3H+BsAQsFdOS1CCNTdMHG5kFmRAbY0LJwIZHtykT14aVIOOPb2WGR6
         ysJ0C3FVmM0imHfXhLYnq2Y5o91O0OLCCj15qd5jdodUpTf0vzPNc78O3pswui+Yq8qO
         gAepvqfHcnZweUqndktduy3GiSp5ycJn9f82MP7AGVZeUNVglttjjrwP+OCrelEt7Puq
         Egjw==
X-Gm-Message-State: AOAM532uIie3Vg+pTseiq5mRuPmnyi4G+xRZ2kEtaWrl+Vfr18qXRPBK
	sDkxAl8pmjLDvlbQxnUIMaxz5Q==
X-Google-Smtp-Source: ABdhPJy/o6kXb1fKJrZGJ7NA/+HnxHPvtkph89J5ZY0ajIZpI/IL3HlrDNTpZbKsJbsJhN5+OKI2UQ==
X-Received: by 2002:adf:d239:: with SMTP id k25mr830865wrh.314.1630700735383;
        Fri, 03 Sep 2021 13:25:35 -0700 (PDT)
Subject: Re: [PATCH v3 16/30] target/microblaze: Restrict has_work() handler
 to sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acaab338-bc0c-3c06-37ea-dee2ba753900@linaro.org>
Date: Fri, 3 Sep 2021 22:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/microblaze/cpu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 15db277925f..74fbb5d201a 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -92,12 +92,15 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +
> +#ifdef CONFIG_TCG
>   static bool mb_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

