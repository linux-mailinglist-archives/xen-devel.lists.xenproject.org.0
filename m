Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030694006DB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178472.324505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG2J-0002qX-1p; Fri, 03 Sep 2021 20:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178472.324505; Fri, 03 Sep 2021 20:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG2I-0002nI-TT; Fri, 03 Sep 2021 20:43:42 +0000
Received: by outflank-mailman (input) for mailman id 178472;
 Fri, 03 Sep 2021 20:43:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMG2I-0002kD-8E
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:43:42 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d463abf-0a47-4652-abe6-62e2ce844bab;
 Fri, 03 Sep 2021 20:43:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u9so381612wrg.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:43:37 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d7sm274068wrs.39.2021.09.03.13.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
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
X-Inumbo-ID: 1d463abf-0a47-4652-abe6-62e2ce844bab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
        b=H8ozIcixUveIbw9k7stg4KdS0gx7rTV2e5s41Gx6botMrAh8hYIIWhIu+AvbtT54dW
         Tl8+brbL8I6gSbmldeLB6TkvxB9mAloeVrSwAdDFUCxAz3A9ONWLJnZnRcf7/3YYCKiI
         mKw5CM9pdGmfYUyVULTwZdtG4Zo2cC0TJu5c2IH8dI7SsNAjx2c3JA5uxkgkaF3syZYO
         bS8qs1qwUmnUfdlgL3bsdR1L8kzzDcc0saGHUOJA/DshHL9WLii6vhGNcqmBnmKhwPEJ
         E/skqUuaJ6aFM7UfknaO/MQDQsX7XIC1JB3/bhICCmdu8qPCP1VV/4dZA8n9iYUOsjZI
         4+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
        b=khCrd3B+fHgkXT2gYGCyZ9w9hPNKH7udY4YcW+II0FWD1TvL/RLybLD4wzx+w12gjx
         CHz1Fm8LD5NCfOsUy5PRpUg7OoJEBNasV1XAtm5TO/8Uy66ysTbXdzZsf5ye2AGWn6lM
         g8KZKa6VDrYVrZoxcbkFVu56T77s1CosjOLXDAdqiOmVRdY7Pkf4ybOrJv0xoDfYjTwf
         py+keLyShGyHVBqpinZ6sycMd5obKrc/OylDwyRKRfraRmAEbeOSq86xdAjiXBRbOYUr
         ehXlE3y4YYxkGARVwluyCX9+wCJVQp9dawNBLAYIkZKlV252bPxSAVOzUymu+A2oq7vK
         YCkA==
X-Gm-Message-State: AOAM531Viow/P47ksqMXyaudtnJPTaK9G14E3xs/cwaOJuihD7C/CLJT
	6B2UdmoJw9MbSEnvkxPjuvRvWQ==
X-Google-Smtp-Source: ABdhPJzDzA0nqf/Zf1bg1Haee/zHM2hXytKc0QH8nIr2MjWxDRi+4jQmQKWadcbSkZgCEwSPJcyooA==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr939918wrn.60.1630701816896;
        Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] target/riscv: Restrict has_work() handler to
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
 <20210902161543.417092-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56180d64-090a-1f6f-5c0a-22387c8a2af5@linaro.org>
Date: Fri, 3 Sep 2021 22:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

