Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261D40067B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178388.324349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFgl-0000QY-NR; Fri, 03 Sep 2021 20:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178388.324349; Fri, 03 Sep 2021 20:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFgl-0000Oe-KR; Fri, 03 Sep 2021 20:21:27 +0000
Received: by outflank-mailman (input) for mailman id 178388;
 Fri, 03 Sep 2021 20:21:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFgj-0000OJ-Ff
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:21:25 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbb01131-55d6-40e8-aad9-439950fc1951;
 Fri, 03 Sep 2021 20:21:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t15so322008wrg.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:21:24 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s15sm232969wrb.22.2021.09.03.13.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:21:23 -0700 (PDT)
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
X-Inumbo-ID: cbb01131-55d6-40e8-aad9-439950fc1951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q+SSfq4073OmWN5SjfGpr2ImvdVTltAm2Ap93b1Y88E=;
        b=PZ2KiViiXR0yMgtsi9ubJd49eXX8m7kgtJ7JWAf0xocPcQ4Oxw4avSPsHVo9QZcW0N
         BByueunHxBruDfx2gZo+Ix58peWhu5wGIHIMCSjfvS8XdfqDnHodPv7hZLnIQBhld9/a
         y0lWLp8aIQKnuXGpPmhHwQpf/DGQHqb2SPZDygfQELNsjREPaTcvh71MJU4d2M9P2WuC
         AZHX/t3lV1bfa8h49PxfG8kq4e5hCt+9BPtVsMQjLzebnh3VaBZTuTGJBK+rNkK7BCfW
         EvnOQKajlmpMw2NfupoVnEo8oI6UDgZtiqq4mNRFKiSDClkKz+9ZYBjtDFyqInTaIFO/
         szhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q+SSfq4073OmWN5SjfGpr2ImvdVTltAm2Ap93b1Y88E=;
        b=nMikvhKWxS2K7zDj/loG+pNS1Px6FswKXZQf2k5wujLZwXJp8H4etffh4dhaDKjvMz
         kHGVfG2okp+j3nboJFp5JTVq+i5mkYINgwSklOOjf+4T572IeJa42E17km1arizjajtZ
         EvZB9E51EWm+e+Se2wB+Yy6yHYXMGgeNEtwIqZD+4jwyG3iWXgq/lMxmW+m4yR33re3h
         PXihYd4RYlwMAeXqLZ/GXQ1wejTWJVr4TjypUbEzpfS+6JRTHVDaWMMbYfjjT27r9pEu
         PACEj2xW7lqsDCZyah4SRdaQ6mg+xEuGk7Dr6Z7ECZe9JUINcxa0YQM4gpK4jz7yh6C0
         Lb+w==
X-Gm-Message-State: AOAM531UdRIJjPYOd/FZnqD3/tusaBiy6m+sbIhhAmtF9JMc4jz0LsKt
	BDkNjnYRlNX03vqPeo8mIimRsw==
X-Google-Smtp-Source: ABdhPJyd1De7PuFzuLP4i8MhbWXrBu0OhprhhfEXRkHThwdYNyCL8/AmxbAlET5sIL14xwjI9QRBeg==
X-Received: by 2002:adf:c149:: with SMTP id w9mr804955wre.127.1630700483905;
        Fri, 03 Sep 2021 13:21:23 -0700 (PDT)
Subject: Re: [PATCH v3 11/30] target/cris: Restrict has_work() handler to
 sysemu and TCG
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
 <20210902161543.417092-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51e42a3f-6064-be49-26b2-20eafd1106a2@linaro.org>
Date: Fri, 3 Sep 2021 22:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool cris_cpu_has_work(CPUState *cs)

No CONFIG_TCG for cris.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

