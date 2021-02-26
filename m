Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA832650D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90424.171181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfUJ-00046N-Tw; Fri, 26 Feb 2021 15:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90424.171181; Fri, 26 Feb 2021 15:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfUJ-00045w-QG; Fri, 26 Feb 2021 15:57:07 +0000
Received: by outflank-mailman (input) for mailman id 90424;
 Fri, 26 Feb 2021 15:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ro2M=H4=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lFfUI-00045q-7E
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:57:06 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0e33974-6835-4976-b57b-8aa2607d6a75;
 Fri, 26 Feb 2021 15:57:05 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 201so6529740pfw.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 07:57:05 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id n4sm9674881pgg.68.2021.02.26.07.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:57:04 -0800 (PST)
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
X-Inumbo-ID: f0e33974-6835-4976-b57b-8aa2607d6a75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PhjSFtO93otAqwm0y+OY5w6bOJL8h00QcgJZEv9C3mI=;
        b=tuDL3Ei/NRjcCyJqFu9l3vKl8RYx0jN19SxGPyVEiBBRDU3WXoGKAF4lcyJPysczuo
         APQoBjpI66oVpj+1Y27Xha74+G9ZZ8UpStdzQ9oCsL3fcjJl/4wK/mD/Y4w1R75s3a+E
         nbWKMmigdVp0n7YmldJfB4nosFLhh+TFAsUNASWsU2dDEXo/214IEfjN10P2e0pibrOD
         fMsaRtQlvfXG2zeHXrtmICC0UTn7KBl1OrFijvQQmd3UydGds5o+pDPPKcpuqztWmEKq
         v+JbqloGyhrRyHt3vY8EuCRlqJDLXYC+Zx5uycWJy+mIVQLQT7EtjSZaUKfAz7nj1VVQ
         k6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PhjSFtO93otAqwm0y+OY5w6bOJL8h00QcgJZEv9C3mI=;
        b=HCsynRg53gBIP0Og5m/5/33pwU1FePJSUy0xnbVmzFC9M/gRXIuC/xnBrX824NBYdX
         2L7uGmNGCwpw7SnvhA/23ENGYP2oQxIP8fFSeVNrktM6h3l/czfyPYAHiG0kEGEcRDh0
         3DVD0y6XSldNuGPBmf4BaSx+sTkt3MvWG0gRa8G7HK+txm3vnpjR3g4oqOBECiGqtSyC
         W3I/EuBlSw+0M/l59Re0vBl+Yvv7xqWmLk0tLt6mLcYnGBfrCJTYe8qIjJmm+ZhHeBkv
         PlAWGB5tNhFYtJXYMpSWq1ngD/MgcTidfRihFp5HHrBPX9Hu2fwW7crWTkLigG14NFlZ
         HWTQ==
X-Gm-Message-State: AOAM530v5nZOmkEQezCKKsc6z+MHV0CuRMCwS5MLR+9QX+t9laMx2qAB
	B1Zgzb4NSiN3ZUhWeA87g/I=
X-Google-Smtp-Source: ABdhPJybZgIZnxgsFn7QwLu3UtyS+xGL+BYnRh/Jz8j1wr9M0GcUEGkef7u97dzsZxQ+ACvdqQmMfA==
X-Received: by 2002:a63:504f:: with SMTP id q15mr3534743pgl.290.1614355024713;
        Fri, 26 Feb 2021 07:57:04 -0800 (PST)
Subject: Re: [PATCH for-next 0/6] Minimal build for RISCV
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <ec2f36a3-6fb9-2f8d-098c-66eb15ba91d1@gmail.com>
Date: Fri, 26 Feb 2021 07:54:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/25/21 7:23 AM, Connor Davis wrote:
> Hi all,
> 
> This series introduces a minimal build for RISCV. It is based on Bobby's
> previous work from last year[0]. I have worked to rebase onto current Xen,
> as well as update the various header files borrowed from Linux.
> 
> This series provides the patches necessary to get a minimal build
> working. The build is "minimal" in the sense that 1) it uses a
> minimal config and 2) files, functions, and variables are included if
> and only if they are required for a successful build based on the
> config. It doesn't run at all, as the functions just have stub
> implementations.
> 
> My hope is that this can serve as a useful example for future ports as
> well as inform the community of exactly what is imposed by common code
> onto new architectures.
> 
> The first 4 patches are mods to non-RISCV bits that enable building a
> config with:
> 
>   !CONFIG_HAS_NS16550
>   !CONFIG_HAS_PASSTHROUGH
>   NR_CPUS == 1
>   !CONFIG_GRANT_TABLE
> 
> respectively. The fifth patch adds the RISCV files, and the last patch
> adds a docker container for doing the build. To build from the docker
> container (after creating it locally), you can run the following:
> 
>   $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen 
> 

Thanks for getting this out!  Looking forward to continue working with
you on this.  Great job on fixing these up and fixing the rebase!

For anyone interested in peeking in on how other RISC-V developments
are advancing, the out-of-tree repo is located here:
   https://gitlab.com/xen-on-risc-v/xen

The parallel work has been on getting dom0 up and running.  We're just
beyond making domain_create/construct_dom0 calls work (and getting all of
common and _init calls involved working appropriately), and are currently
on mapping in and launching the dom0 created (this is being done on branch
riscv-create-dom0 and be forewarned, there is still a good amount of churn
there).

I'm not sure on the optimal way to keep the ML informed about how things
are going... as I'm not sure I foresee many intermediate patches between
this initial build and seeing a dom0 console... save for common fixes and
questions.  I think Connor and I are both on the IRC. Any suggestions,
of course, are welcome.

Best,
Bob

