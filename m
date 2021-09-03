Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1730400686
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178407.324383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFj8-0002N5-Oz; Fri, 03 Sep 2021 20:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178407.324383; Fri, 03 Sep 2021 20:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFj8-0002LD-Lf; Fri, 03 Sep 2021 20:23:54 +0000
Received: by outflank-mailman (input) for mailman id 178407;
 Fri, 03 Sep 2021 20:23:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFj7-0002Kk-BJ
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:23:53 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76ebf9ff-0cf2-492a-891f-020586c0e0e5;
 Fri, 03 Sep 2021 20:23:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b10so387887wru.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:23:52 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id j20sm258635wrb.5.2021.09.03.13.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:23:51 -0700 (PDT)
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
X-Inumbo-ID: 76ebf9ff-0cf2-492a-891f-020586c0e0e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wXBwe+C96NVMAw/WVJPmEePxSXgR8UnAw4mAKidy+Uc=;
        b=QHLQ3rMDWNB/26AcEt/tmQB5kk5HXskxmUCeZxjWkZY+/+gmxKxtLYBbUrbEJ9IIVl
         TXxNm1cMDVlWjjJE1EL8SyZCs1686ubATja87bAh8hUlCMrmrU+p/h2HnsSi4f6M2VVv
         ZijvBz00fTjJ0Pey6nM7GppsZ7HFYqOWG62UIeKnTBmuInsYh9s3ltuexL+iuerhbSSN
         uMg0jOQeNSsrtwUY8ODf5A01NMcBOal5Wp3/QlINZyEPfodQvP1VTMgezqqMzuZLU7iB
         OiJNsnH57C+xyoKu+8wTdisD8sJn3vaHgIGWHGCi7wCCfdTlsvskKx4OEy1NR1/zo36u
         mnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wXBwe+C96NVMAw/WVJPmEePxSXgR8UnAw4mAKidy+Uc=;
        b=jks338WhTHfECjgtr1U4zauTz6hfppYTkFokgmX5iCtZRvDfN4VJkCCOXRRlLILUAp
         YlR8Q6LCm5Kl7FKn+KEGJcVnrmY/6bg7uQNRiBwKrQCA2MoWZVbCmevuEPgN33momOnz
         WVVklKSTZ4K+276yW/Dig0p/uzO5yr620HGz8NoVFEv+uKRawGHjZHWBCo8hh7Ymj+cm
         Jl+NdqAYcx4Vwn1m68jUYqjculxsJTGuSGxqKK4L4DfMjDuKoHmqJe094KGE9xr1pcUD
         3ZqG+XkUf9aPif1go4Mz1YM6g7AG0z5zWFB6hONKaeBUaP89r7YKlN2o2Yp4i2Eusx2a
         IJnA==
X-Gm-Message-State: AOAM530SBEiY0L2QQ8QmU0S3zl/AMtPyKsNnPY6SwyfsMXvTkCM5h07U
	oxnurNZdY7jz952G0t3pii1VEA==
X-Google-Smtp-Source: ABdhPJz826d62i3FadVITpOZWzNuXjQqqxILWUC/72776fLbfHJdkqtyjig/TilRLtZ8efOdunSk1g==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr839408wrc.190.1630700631792;
        Fri, 03 Sep 2021 13:23:51 -0700 (PDT)
Subject: Re: [PATCH v3 14/30] target/i386: Restrict has_work() handler to
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
 <20210902161543.417092-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2796bcf-8358-1faf-cf30-0ad87cd0ac08@linaro.org>
Date: Fri, 3 Sep 2021 22:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.c         | 6 ------
>   target/i386/tcg/tcg-cpu.c | 8 +++++++-
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

