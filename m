Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1772400669
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178344.324270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFbO-0003aK-CQ; Fri, 03 Sep 2021 20:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178344.324270; Fri, 03 Sep 2021 20:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFbO-0003Y7-8r; Fri, 03 Sep 2021 20:15:54 +0000
Received: by outflank-mailman (input) for mailman id 178344;
 Fri, 03 Sep 2021 20:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFbN-0003Xg-2u
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:15:53 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5b75ea2-91a8-40bc-9e12-af0037baca71;
 Fri, 03 Sep 2021 20:15:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so300057wms.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:15:52 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id m4sm353497wml.28.2021.09.03.13.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:15:51 -0700 (PDT)
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
X-Inumbo-ID: d5b75ea2-91a8-40bc-9e12-af0037baca71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
        b=uxvnHzNv132fzgkc218/R0lqQKuK+t8JtxKc9v7MGrkKPRxDYU93G8sAz5OB0Qa73S
         HE9cI2H2Z0CH+z6tU7HILrt73xJLER1ScmOcHWVCSynT7na5DZ8aQUWZ73RzZS1vzDMQ
         vqeZlVUhDraI2JH+QdE7CnrbM86ihr8OahFggiYzaiiPqr9S9Cooveeavxo3806rUBCc
         wAmH4n70qiWJfcK+7NmYB575D8ru3ANLV2HDRDh0a+ujAxTAi2JXNetHl39JI8em8dQt
         /MjpEL+5e1BeWhbg4mKgjTybiTcJ5pJVRqEATLrqAPvRDkDzcFl9morqxai4fdjaAREV
         wsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
        b=lnmxU22xwuqKs2dy4xF4UdH0u0kpnfuFVONRsTIR//o8WO//Ftp6rGZrRFM4sbArrp
         5/I+sdqAFuk+6yLo8tRRozdbOeyz9sekeBeQ8sLnvT127SHfI8ypfugTnNeJENFxTISx
         L17R8/CGylV0SJ383LKfKpVbTNJPpj4BCsyI/7y4VYCKo7HfuLU3BiOhC8gdPGvfZWqz
         U6cw1EmKpxVNzSB3j6P62utk+63cAwaqltEaHn34wA2m5W95WdkfkII6KOCKVsw11I3w
         3CK7rpNGwHJ+b2ZjNwDzOo+sTb/YIfMX92cmFi2RdrvPkMHiZffEvEo8wxZlw3dwRoPA
         Jk0Q==
X-Gm-Message-State: AOAM5337r3g4K1VYUD8/iY8sv2GeayEbTH6Uh2cmHaeYDIhWXek9iQpk
	vAUt1xoeqBalQ8AvPVI+wkqfPQ==
X-Google-Smtp-Source: ABdhPJyMWwBTg93pyBo5sv0A6QW1ur9FJeS4HTsMD79+WiDYC0sQ7drSYJ0pDX3u+yQQ7riYEaCIGg==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr461323wmh.99.1630700151552;
        Fri, 03 Sep 2021 13:15:51 -0700 (PDT)
Subject: Re: [PATCH v3 05/30] accel/kvm: Implement AccelOpsClass::has_work()
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
 <20210902161543.417092-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27a1a7f4-10f3-e089-6f37-4eed9542a6c6@linaro.org>
Date: Fri, 3 Sep 2021 22:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Implement KVM has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/kvm/kvm-accel-ops.c | 6 ++++++
>   softmmu/cpus.c            | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

