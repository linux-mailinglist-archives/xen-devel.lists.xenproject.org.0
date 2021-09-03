Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D75400676
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178376.324328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFen-0006eA-4A; Fri, 03 Sep 2021 20:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178376.324328; Fri, 03 Sep 2021 20:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFen-0006b8-0j; Fri, 03 Sep 2021 20:19:25 +0000
Received: by outflank-mailman (input) for mailman id 178376;
 Fri, 03 Sep 2021 20:19:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFel-0006ah-4m
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:19:23 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6511396-d53c-4344-92d3-8d3fd82629ab;
 Fri, 03 Sep 2021 20:19:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t15so316203wrg.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:19:22 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id i4sm360865wmd.5.2021.09.03.13.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:19:21 -0700 (PDT)
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
X-Inumbo-ID: a6511396-d53c-4344-92d3-8d3fd82629ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hrfT6D6r8NgV0kbWbMFB7eJ0H5Q19iawpNSQkwrO3Zw=;
        b=UP4L3x90K9R0Xv9kUPD2k1ldA8cppgKzxB41aZwVXYD7x/qndJVah80MG87/CBUxKF
         TQsp6BHab8hbEiq0EVctWDjgUQRASZHj3+eAB2JftZU4rDgjFNuJfnOUODTXjmvHq+Wb
         CO5SRo4MZKWNpVLFkz1S9LBbag1wL73cRaGdVxll7VdzLyexwvlp0cZN9dy4/9ct+32O
         xuGIsIHPC9o6Pv+TjnwbzRCalBEKUw0bgwH95SVmBcNFszNxj5KOrbihoohVlg16IcU/
         cuE0LBDTSZg+bzpqf7VDLPEdO9axqPBJ8doVS6whQR+pz75s6Bv4Yx4dkv7Omkpgzy1I
         2uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hrfT6D6r8NgV0kbWbMFB7eJ0H5Q19iawpNSQkwrO3Zw=;
        b=TD+tcvo9inebleM+w/QhYd0j/Qx73orif6Y00HgD+awkan/RNyI5c7a9yNqCMZUT9w
         Y1sp4eQuCP6F7nmZo5VXLZccFRUgudITWdEW8XF07gvHbJ1uDCVs9Dt84s5bFgg6FA6c
         YVSzoEgbuureyy3qarRu6w1DxanNir2aJ+OtbRw6LQL8sO0Io06W9HGwx7S+7Dpl6KbT
         heMTfBOuV1fEcyPILM3n2M8z9NJ3v723c4D02OhEFyq2AFU1hreRy2xh/eVvdF+8EPMG
         arfGIzPFj1oOmdh8TPj6k8s+/59AmVv85LilfOoIUMDea9UAeImRk6b411To9z11COHC
         6UMA==
X-Gm-Message-State: AOAM531lIpJFfgQA3p4nfXE0p9TEUXB9Kx2Q2gGWPl2tAurvxmeUG71d
	5H5mAZD1unlcOT0FZkES5d0p0A==
X-Google-Smtp-Source: ABdhPJxOkyr3cz4gxEh2Ke6ki62uWZywliZS86PJZb/UyH5xriM04K4qsIBYKGhxLIpR8DxkeTkVHg==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr826597wrc.190.1630700361562;
        Fri, 03 Sep 2021 13:19:21 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] target/arm: Restrict has_work() handler to
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
 <20210902161543.417092-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <318478f2-6cea-e9ee-dc9d-442589aa8f56@linaro.org>
Date: Fri, 3 Sep 2021 22:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

