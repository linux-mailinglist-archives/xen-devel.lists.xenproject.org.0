Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7150EAB8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 22:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313267.530775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj5Tn-0002bK-4A; Mon, 25 Apr 2022 20:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313267.530775; Mon, 25 Apr 2022 20:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj5Tn-0002ZQ-1G; Mon, 25 Apr 2022 20:38:43 +0000
Received: by outflank-mailman (input) for mailman id 313267;
 Mon, 25 Apr 2022 20:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uj5J=VD=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nj5Tl-0002ZK-4Q
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 20:38:41 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0108320-c4d7-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 22:38:39 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id 4so5804208ljw.11
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 13:38:39 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a192d0a000000b0047210d2a984sm151624lfj.194.2022.04.25.13.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:38:38 -0700 (PDT)
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
X-Inumbo-ID: b0108320-c4d7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ILv9teSoP4aYBf6xbxudr1p2VEvSoGOnfNFBeXl3R7I=;
        b=fZeZl2Kwvt4eb47jsj7b9dqLTKA5hsNa/sySJVGqjq6U3w2+LmTwQJExnt/XNPaCZK
         4xysJPg2ngKepEL7PL914QEcvlGSWtShIldwOovqXozQjHzx8fouMu2ylG6ORxnHj9wH
         Pp5U/iHR6OWJpWrZtjkTJ671qf26P4CpLLXOCmzWkfHBLgFlwtahcBV087RzVueuebp/
         XaDp+7AKM37d+QmgErhZ5iqAbuc1mJvGczx8MmTUDGRw3YgmijNmH3nHKzm6X3xKk4Do
         eClxdCIBZCG/CFC4tQdaRY5lY7lsSqNNIYvC3LGUx71pypdfugyTgWOUKqQIh/NxrmYg
         efBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ILv9teSoP4aYBf6xbxudr1p2VEvSoGOnfNFBeXl3R7I=;
        b=Xx6vOHJitCrIiEROkbt/d90UH88+wDHP+twnvnH7kebZrjwv3uypBoR6c+0gkkTjd7
         8XJIFXFT9YnKFFqmi0Fk+EkQaAkRNKbt3Xk/83D9VOLKLsgjiHS4RtvGQ2xOx8qHXDRL
         oW2TSXMf56q0E1iQStK5TGyM6Sp5xl0wKrCNiRuKTAftZAgk4lqx9GMhZ1XS8tfqUX+K
         JL+K+r6821VbEOrF8XWtQFJbzNm0Z0vXHttpInV32aplg1EVrdAE0IETrrxNSIYj2pN1
         nEDhjhT6WJLt+5598oE7QPoNqalQXUakK/APOZCO19TQsQ6DnSAb+i9nj9ywT/lTq55C
         WgpA==
X-Gm-Message-State: AOAM533PLfL01zg5Ut7UzOR3M30u8H6P1wcGSHIpaShTkSXzvyFmkZDD
	PKpDydHWLroC7qRl6W9cyDQ=
X-Google-Smtp-Source: ABdhPJxqOK8Wi+cHV2hwafjT2TF0m9x1sQnllf3glnSRUlek2UP+fsukD/q4rxgK8QtsK9A4ogCzNg==
X-Received: by 2002:a2e:a793:0:b0:24e:e3bd:b3a8 with SMTP id c19-20020a2ea793000000b0024ee3bdb3a8mr12004192ljf.457.1650919118643;
        Mon, 25 Apr 2022 13:38:38 -0700 (PDT)
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
To: Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
 <YmZUpua3hkCPdbfx@infradead.org>
 <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com>
Date: Mon, 25 Apr 2022 23:38:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hello all.


On 25.04.22 12:14, Juergen Gross wrote:
> On 25.04.22 09:58, Christoph Hellwig wrote:
>> On Mon, Apr 25, 2022 at 09:47:49AM +0200, Juergen Gross wrote:
>>>> Would the Xen specific bits fit into Confidential Computing Platform
>>>> checks? I will let Juergen/Boris comment on this.
>>>
>>> I don't think cc_platform_has would be correct here. Xen certainly
>>> provides more isolation between guests and dom0, but "Confidential
>>> Computing" is basically orthogonal to that feature.
>>
>> The point of cc_platform_has is to remove all these open code checks.
>> If a Xen hypervisor / dom0 can't access arbitrary guest memory for
>> virtual I/O and we need special APIs for that it certainly false
>> into the scope of cc_platform_has, even if the confientiality is
>> rather limited.
>
> In case the x86 maintainers are fine with that I won't oppose.
>
>
> Juergen


[I have discussed with Juergen on IRC about it.]


Well, if cc_platform_has() is a way to go (at least on x86), below some 
thoughts about possible integration (if, of course, I got the idea and 
code correctly).

1. We will need to introduce new attribute 
CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED
as we can't reuse CC_ATTR_GUEST_MEM_ENCRYPT (in case of Xen the Guest 
memory is not encrypted). New attribute is automatically set if Guest 
memory encryption is active (CC_ATTR_GUEST_MEM_ENCRYPT is set). Also new 
attribute is set if restricted memory access using Xen grant mappings is 
active. This will allow us to have a single check in
arch_has_restricted_virtio_memory_access() which covers both cases: Xen 
and SEV

int arch_has_restricted_virtio_memory_access(void)
{
     return cc_platform_has(CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED);
}

2. We will need to introduce new vendor CC_VENDOR_XXX for our case (I 
have chosen XEN, although I am not sure it is a good fit) which deals 
with new attribute only.
3. Xen code then will call cc_set_vendor(CC_VENDOR_XEN) for different 
modes (PV, HVM, etc) during initialization if restricted memory access 
using Xen grant mappings is enabled.

Below the diff (not tested and without x86's PVH) how it could look like:


diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index ec5b082..0284aa7 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -409,6 +409,14 @@ int __init arch_xen_unpopulated_init(struct 
resource **res)
  }
  #endif

+#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
+int arch_has_restricted_virtio_memory_access(void)
+{
+       return IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain();
+}
+EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
+#endif
+
  static void __init xen_dt_guest_init(void)
  {
         struct device_node *xen_node;
diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index fc1365d..9020a60 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -44,6 +44,7 @@ static bool amd_cc_platform_has(enum cc_attr attr)
                 return sme_me_mask && !(sev_status & 
MSR_AMD64_SEV_ENABLED);

         case CC_ATTR_GUEST_MEM_ENCRYPT:
+       case CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED:
                 return sev_status & MSR_AMD64_SEV_ENABLED;

         case CC_ATTR_GUEST_STATE_ENCRYPT:
@@ -67,7 +68,19 @@ static bool amd_cc_platform_has(enum cc_attr attr)

  static bool hyperv_cc_platform_has(enum cc_attr attr)
  {
-       return attr == CC_ATTR_GUEST_MEM_ENCRYPT;
+       switch (attr) {
+       case CC_ATTR_GUEST_MEM_ENCRYPT:
+       case CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED:
+               return true;
+
+       default:
+               return false;
+       }
+}
+
+static bool xen_cc_platform_has(enum cc_attr attr)
+{
+       return attr == CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED;
  }

  bool cc_platform_has(enum cc_attr attr)
@@ -79,6 +92,8 @@ bool cc_platform_has(enum cc_attr attr)
                 return intel_cc_platform_has(attr);
         case CC_VENDOR_HYPERV:
                 return hyperv_cc_platform_has(attr);
+       case CC_VENDOR_XEN:
+               return xen_cc_platform_has(attr);
         default:
                 return false;
         }
@@ -115,3 +130,11 @@ __init void cc_set_mask(u64 mask)
  {
         cc_mask = mask;
  }
+
+#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
+int arch_has_restricted_virtio_memory_access(void)
+{
+       return cc_platform_has(CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED);
+}
+EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
+#endif
diff --git a/arch/x86/include/asm/coco.h b/arch/x86/include/asm/coco.h
index 3d98c3a..6395ec1 100644
--- a/arch/x86/include/asm/coco.h
+++ b/arch/x86/include/asm/coco.h
@@ -9,6 +9,7 @@ enum cc_vendor {
         CC_VENDOR_AMD,
         CC_VENDOR_HYPERV,
         CC_VENDOR_INTEL,
+       CC_VENDOR_XEN,
  };

  void cc_set_vendor(enum cc_vendor v);
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 50d2099..dda020f 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -77,8 +77,3 @@ void __init mem_encrypt_init(void)
         print_mem_encrypt_feature_info();
  }

-int arch_has_restricted_virtio_memory_access(void)
-{
-       return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
-}
-EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 85246dd..79cb30f 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -8,6 +8,7 @@ config XEN
         depends on PARAVIRT
         select PARAVIRT_CLOCK
         select X86_HV_CALLBACK_VECTOR
+       select ARCH_HAS_CC_PLATFORM
         depends on X86_64 || (X86_32 && X86_PAE)
         depends on X86_LOCAL_APIC && X86_TSC
         help
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 517a9d8..11c3f4e 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -195,6 +195,9 @@ static void __init xen_hvm_guest_init(void)
         if (xen_pv_domain())
                 return;

+       if (IS_ENABLED(CONFIG_XEN_VIRTIO))
+               cc_set_vendor(CC_VENDOR_XEN);
+
         init_hvm_pv_info();

         reserve_shared_info();
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5038edb..2fe5aaa 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -109,6 +109,9 @@ static DEFINE_PER_CPU(struct tls_descs, 
shadow_tls_desc);

  static void __init xen_pv_init_platform(void)
  {
+       if (IS_ENABLED(CONFIG_XEN_VIRTIO))
+               cc_set_vendor(CC_VENDOR_XEN);
+
         populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));

         set_fixmap(FIX_PARAVIRT_BOOTMAP, xen_start_info->shared_info);
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 313a9127..d3179f8 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -339,4 +339,16 @@ config XEN_GRANT_DMA_OPS
         bool
         select DMA_OPS

+config XEN_VIRTIO
+       bool "Xen virtio support"
+       depends on VIRTIO
+       select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
+       select XEN_GRANT_DMA_OPS
+       help
+         Enable virtio support for running as Xen guest. Depending on the
+         guest type this will require special support on the backend side
+         (qemu or kernel, depending on the virtio device types used).
+
+         If in doubt, say n.
+
  endmenu
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index efd8205..d06bc7a 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -72,6 +72,19 @@ enum cc_attr {
          * Examples include TDX guest & SEV.
          */
         CC_ATTR_GUEST_UNROLL_STRING_IO,
+
+       /**
+        * @CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED: Restricted memory access to
+        *                                       Guest memory is active
+        *
+        * The platform/OS is running as a guest/virtual machine and uses
+        * the restricted access to its memory. This attribute is set if 
either
+        * Guest memory encryption or restricted memory access using Xen 
grant
+        * mappings is active.
+        *
+        * Examples include Xen guest and SEV.
+        */
+       CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED,
  };

  #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
(END)


On Arm I left simple variant simply because of no users of cc_platform.

int arch_has_restricted_virtio_memory_access(void)
{
        return IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain();
}

But, we could have something simple here:

bool cc_platform_has(enum cc_attr attr)
{
     switch (attr) {
     case CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED:
         return IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain();

     default:
         return false;
     }
}

int arch_has_restricted_virtio_memory_access(void)
{
     return cc_platform_has(CC_ATTR_GUEST_MEM_ACCESS_RESTRICTED);
}


Any thoughts?

-- 
Regards,

Oleksandr Tyshchenko


