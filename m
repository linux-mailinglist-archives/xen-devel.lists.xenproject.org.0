Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E940066F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178356.324292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFct-0004ns-20; Fri, 03 Sep 2021 20:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178356.324292; Fri, 03 Sep 2021 20:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFcs-0004kq-TK; Fri, 03 Sep 2021 20:17:26 +0000
Received: by outflank-mailman (input) for mailman id 178356;
 Fri, 03 Sep 2021 20:17:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFcr-0004kg-C8
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:17:25 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84ab1444-2426-4487-9fd3-de92cb7480df;
 Fri, 03 Sep 2021 20:17:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u16so318827wrn.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:17:24 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id n4sm212131wri.78.2021.09.03.13.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:17:23 -0700 (PDT)
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
X-Inumbo-ID: 84ab1444-2426-4487-9fd3-de92cb7480df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
        b=dwmv1KqM52aR7rH3nFosWXsm4FD08tdhGNndv5xGMzStvCDMhzyZVE8JBIwPUqwq2F
         bCLRGHMXtpcQxrFHLNsfcJ75PuxEZqI9fgeJ+R64/zxYVNYGjwzAkdzQcnV1G0aiGJeW
         LTJZC1LjtZnsolxgQDMU0UUFNoUHXBPLt2RyL3DgdCqDzCR5fV8RIduiPWvrI4huqI2x
         14xoPIKRj+tYSoQLnz+qpU2iP9/qF7o+j2jiFMjWkvX25zBXsZzxhgUCz6Znrep8fiq8
         IBBZaGnjNh2PebWfRMYGVTv6N4GT+lZ2aNLKT+f0rlGZl04V61ntDZBBZCMp6HS8v9vZ
         WEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
        b=VMtFp0TDoo0ZYWC8LeXgt9poz3w6LEJFVPi5I6UmFJocA7M9TaZkOZe5FFEDBgFVbD
         gemmPe+/R/gcckT9RkYz46kzeNZj2YF2CxCAYNkzRbM/WGMwhlDozTysYxCfrHqrFmcj
         7LtjM5EsFSmR371xuRZUssqCeF9om3Qlr6dajoPU9aTAzenytxtvY8za3RVnkXdElUBh
         pzBYY8OCCoP1/xzAbD33hTE6G8AfXIT95hyfOECVfA182S7skSS0IAGQBqfBMPv+VYz1
         62TEdW+ikFtS39NVg3TMTbRUFcnKvqdX0Wd9BiId9gkxZdViuFjQyQGt7VtBzXIK86yW
         elIw==
X-Gm-Message-State: AOAM530PP01zreNvSRH6jVgJCxPaCh1Nz2gCgJL98/KKWpyx2zJHg1sV
	yScAT/9RJrivx9QPx6aWV9ILTg==
X-Google-Smtp-Source: ABdhPJymtYq5kcbCfG6OUgkQoqRmbaJKl89J4TFcqlkWTH+OL3rMdlakO2CQQpDxn27LYKv0Y23GMQ==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr784175wrw.209.1630700243751;
        Fri, 03 Sep 2021 13:17:23 -0700 (PDT)
Subject: Re: [PATCH v3 07/30] accel/tcg: Implement AccelOpsClass::has_work()
 as stub
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
 <20210902161543.417092-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <618da04b-c9e4-bd22-d527-412c3fd31386@linaro.org>
Date: Fri, 3 Sep 2021 22:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Add TCG target-specific has_work() handler in TCGCPUOps,
> and add tcg_cpu_has_work() as AccelOpsClass has_work()
> implementation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  4 ++++
>   accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

