Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB144E58CD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 19:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294049.499816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX6AD-0006iL-Ts; Wed, 23 Mar 2022 18:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294049.499816; Wed, 23 Mar 2022 18:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX6AD-0006gJ-PR; Wed, 23 Mar 2022 18:56:57 +0000
Received: by outflank-mailman (input) for mailman id 294049;
 Wed, 23 Mar 2022 18:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX6AC-0006g7-Kd
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 18:56:56 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f14ea2-aadb-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 19:56:55 +0100 (CET)
Received: by mail-qt1-x82b.google.com with SMTP id c4so2005544qtx.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 11:56:55 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002e1d5505fb6sm693231qtp.63.2022.03.23.11.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:56:53 -0700 (PDT)
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
X-Inumbo-ID: 01f14ea2-aadb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5eVbw0nx8xg2wrymdgy7rIBO9Z2Z1ybMaOCic40tRX8=;
        b=pINxR8DJ/dnErtsZYHLcjm3xLVqJFIx1fMZNHtFehMtqd8aGXnSl54CT4YCi0RLQF1
         H9kc4Fd7rO9qljLBdTA4RxkI2f7FzHEvejLR/IrVv3ShAVJLFaJwsVQfOkLIRbusOioH
         LfbzI6BuvUyV0CU2sjYFvVtrZg9SOin6Ov/isa+XzSYhHwAHIO99eVmW79gYKjwiD5db
         157eGbN9NADA4/5cI5kFhkeT9C0pk178OKQI8l5wT8ovbXUnRHdyBEZAMvCvZ/4Ra2fE
         IJEPWagNz/x8+yoWrbByo2K5dgojkE1HzMlryp40yl7F8BrPdBpzDOhxibrbqDs8AVLS
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5eVbw0nx8xg2wrymdgy7rIBO9Z2Z1ybMaOCic40tRX8=;
        b=09IEsEofZJygHfIEMkE8XjUSY6aAXoHf+pnnaKrUvz9TWDR9sjBGRp+60SFlYYGkEu
         vyhKKlBQFZGvt6mMs4D4XEdgN1cbBI/+qVwKZjfAi1tdayT1/4E6dvOYpYgnYSK9PRNN
         Y83FImgSBlutO6PA60yG4e9V8HSd/E5zW6cJp7knHcignbTFoc5vaeeEuGJxEViCROns
         ynSKoilbnyJso4ezdrfO8JgoiBdj+eL2aXpAzStI/pkYxofYeU+QxXOwl6RBWWBuU09G
         nt1nFKZiAfwnFQ6kQ4mPwxuZs6l+loH3PUvgsSxeF/9XMFFBdPTx6ljh8AZPwrE7VVg5
         ZFcw==
X-Gm-Message-State: AOAM532SByrXaNg+mQ92QG1zkVw+/OdXX3qUMxa/SrsTfUOFLc46hsjN
	fTsUXbnBpBUih3R0F4RFzhM=
X-Google-Smtp-Source: ABdhPJwKXR1brQUncQYlgUOu7VO+BDgmnuJ6K6yvnXsMlACxq1xjWW0DRh2aVZuhQlVnRO+8VmthaA==
X-Received: by 2002:ac8:59c8:0:b0:2e0:6ae2:eb6f with SMTP id f8-20020ac859c8000000b002e06ae2eb6fmr1175396qtf.580.1648061814387;
        Wed, 23 Mar 2022 11:56:54 -0700 (PDT)
Message-ID: <06217ec6-bd2a-6fd1-b2ff-1704b073456f@gmail.com>
Date: Wed, 23 Mar 2022 19:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 01/13] cpu: Free cpu->cpu_ases in
 cpu_address_space_destroy()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>, Laurent Vivier
 <lvivier@redhat.com>, David Hildenbrand <david@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Cameron Esfahani <dirty@apple.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Paul Durrant <paul@xen.org>, Richard Henderson
 <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Reinoud Zandijk
 <reinoud@netbsd.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Colin Xu <colin.xu@intel.com>, Mark Kanda <mark.kanda@oracle.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/3/22 18:17, Philippe Mathieu-Daudé wrote:
> From: Mark Kanda <mark.kanda@oracle.com>
> 
> Create cpu_address_space_destroy() to free a CPU's cpu_ases list.

This seems incorrect...

> vCPU hotunplug related leak reported by Valgrind:
> 
> ==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 8,549
> ==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
> ==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
> ==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
> ==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
> ==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
> ==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
> ==132362==    by 0x93E26F: property_set_bool (object.c:2273)
> ==132362==    by 0x93C23E: object_property_set (object.c:1408)
> ==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
> ==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
> ==132362==    by 0x933C81: qdev_realize (qdev.c:333)
> ==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220321141409.3112932-5-mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   cpu.c                     | 1 +
>   include/exec/cpu-common.h | 7 +++++++
>   softmmu/physmem.c         | 5 +++++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/cpu.c b/cpu.c
> index be1f8b074c..59352a1487 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -174,6 +174,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>           tcg_exec_unrealizefn(cpu);
>       }
>   
> +    cpu_address_space_destroy(cpu);
>       cpu_list_remove(cpu);
>   }
>   
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 50a7d2912e..b17ad61ae4 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -111,6 +111,13 @@ size_t qemu_ram_pagesize_largest(void);
>    */
>   void cpu_address_space_init(CPUState *cpu, int asidx,
>                               const char *prefix, MemoryRegion *mr);

... cpu_address_space_init() creates a single AS, ...

> +/**
> + * cpu_address_space_destroy:
> + * @cpu: CPU for this address space
> + *
> + * Cleanup CPU's cpu_ases list.
> + */
> +void cpu_address_space_destroy(CPUState *cpu);
>   
>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                               hwaddr len, bool is_write);
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 43ae70fbe2..aec61ca07a 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -762,6 +762,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>       }
>   }
>   
> +void cpu_address_space_destroy(CPUState *cpu)
> +{
> +    g_free(cpu->cpu_ases);

... but here you destroy all the ASes.

> +}
> +
>   AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>   {
>       /* Return the AddressSpace corresponding to the specified index */


