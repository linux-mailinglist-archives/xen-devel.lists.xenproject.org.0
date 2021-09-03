Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700284006D7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178468.324493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG1w-0002Hm-N7; Fri, 03 Sep 2021 20:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178468.324493; Fri, 03 Sep 2021 20:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG1w-0002Ey-JO; Fri, 03 Sep 2021 20:43:20 +0000
Received: by outflank-mailman (input) for mailman id 178468;
 Fri, 03 Sep 2021 20:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMG1u-0002Eq-CB
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:43:18 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9533dc19-474a-4853-bf2c-4538a46493f5;
 Fri, 03 Sep 2021 20:43:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso338365wmr.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:43:17 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id w9sm294701wrs.7.2021.09.03.13.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:43:16 -0700 (PDT)
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
X-Inumbo-ID: 9533dc19-474a-4853-bf2c-4538a46493f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
        b=sz9KbnkkagCr/GFF3OMVQhtS6VhgzaCiOfnUEvPJVL2O8jwbbscHft/H9IJkpP0NsU
         TGizEk76lcvi8mLRugPLNXDpebTnYO3vqlZQK48MJI9TPSqJFF4fhUuswhN7CqY2Ghwk
         3vqpHJ2pzTxkD4Alw5fP1VVDaMLadtQr5cqiT1MBE/uvf9J116rMMc6TMrhbx3UMJdIj
         /DMhuBGeqgleldVui5C3jsYuqvxxkrLkQtp2u6KAbqe0LNNwZJBYdNlmGqmCrDRJX6/D
         H9oo/QoelvlvKhE6ZH5vxKSx6LJafL8LYNlCMQZjRXX4mct49OSCXeOxBiNBVInXZevi
         wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
        b=IGpODACODIJ3dZm2I+T70rRofLkXDfd2xpYoMVIFs6gbDugYFXzWCJNXmIz3HRqfbG
         QXjMkPP3Ftc0MauyCmX3gpWR0ELoUfseqIR0FN/CdFLIB3HnjxSS4Eh62x8PzCQdgSY5
         g+TmDiltFFtOYQQJuRj+sZ7M5bq3atmKOD5r74Ns1swHO6v9o9x8NQOWv8PKLP5RXDyU
         fqtaY01oJ4QyaWiptVMr+SnTy9E1Sa+NwF3oi+WmgvtJa6HtUTzBN24QtQ1w3K9n+G4i
         boTe96ruzos1hf8ETLkpDAN9xpxe9gVescIyEupNcCQINrbVHUYHJ9IU1jo4bQ/C9ykZ
         zuTg==
X-Gm-Message-State: AOAM532fiBvjkt8ZPHjqNJdwLG9km+wG1O/+kGZSJDeLsN32fTXHLw1f
	C9zVh8HV+umkfe3YwRz+YJVhPA==
X-Google-Smtp-Source: ABdhPJyTwcg40ZXBf0kRQeFkHvEtxWVastgigZVfDdU3EBMLa1vjXC+xX2MEzRyEH8NNNNiGPWLbnA==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr479522wmb.11.1630701796724;
        Fri, 03 Sep 2021 13:43:16 -0700 (PDT)
Subject: Re: [PATCH v3 22/30] target/ppc: Simplify has_work() handlers
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
 <20210902161543.417092-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <007f0874-b82f-5853-0c08-00528fb22bcb@linaro.org>
Date: Fri, 3 Sep 2021 22:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> The common ppc_cpu_has_work() handler already checks for cs->halted,
> so we can simplify all callees.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 294 ++++++++++++++++++++----------------------
>   1 file changed, 138 insertions(+), 156 deletions(-)

Well, I'm not actually a fan of this; I'd rather the outer function merely dispatch here, 
or preferably arrange to arrive here to begin.


r~

