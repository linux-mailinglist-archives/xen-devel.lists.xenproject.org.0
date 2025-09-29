Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D728BA9E91
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 17:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133018.1471208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3GHJ-0002zE-Cs; Mon, 29 Sep 2025 15:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133018.1471208; Mon, 29 Sep 2025 15:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3GHJ-0002w9-9f; Mon, 29 Sep 2025 15:59:05 +0000
Received: by outflank-mailman (input) for mailman id 1133018;
 Mon, 29 Sep 2025 15:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4Dr=4I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3GHI-0002w3-7x
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 15:59:04 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 376904bb-9d4d-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 17:59:01 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so8854860a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 08:59:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3b052d4sm7958120a12.48.2025.09.29.08.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 08:59:00 -0700 (PDT)
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
X-Inumbo-ID: 376904bb-9d4d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759161541; x=1759766341; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcEDUDGUfBQH/elHny1dvp2hEud9tsYPhaJYy9TIOXY=;
        b=WjhZD8QH6tQHWtKwKHjVHGCVI/TwPHvvafNbN8gG6ulTqBXFdv/5x46LKmLdJteN97
         yCy7qnCiEcof6JjVmRI8U0n6DVBIsSACdSGafcMa1WQQZ0m5ryFSXhz/H3x0cB7IgsCA
         XBZi7FoUiBAgATNXT1/UDoTi9hR887VVaGtns07EsDm5CwnrmSRblMM4z/USRuXjQen0
         8ULNBo3xa180NYk0T943fL3vUIPCKBr3tQOigVvfG9n9RfANrsi2LvjHRcl6A+Fgokgi
         vmzNRJe55bsj/sfOERiU5lVL/DCz7BTV96znSFxRv5Vtbog/eD/2n18GKGa/jzchUReR
         nAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161541; x=1759766341;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcEDUDGUfBQH/elHny1dvp2hEud9tsYPhaJYy9TIOXY=;
        b=DvnHx0pcWifM8Osf6eUwHscHbMS9h3gcxRA9xsyRP1QIhNVLB3hVwAUBkQN6edtDA6
         bof06HqTkjdw2h83YqAIcXvqV6CyUDOvCZmW/72IEqR9fcS9JrVwWZP4QusqcH22Ji/j
         vSQBej9mGaGP+mbwjMMU0rCn5Pi7fszfTZaHCIgEtvynn6WecbcrlX93a1jIwLOxtIrz
         OajNLL6WG8PrTysOUbQppII3uSnLDyFVycdLP4dIjhtjn0JJqZmI7WMagf/86Spb3MVV
         MLvVCl1FLwGGPBdRzVw/Uco2iRrwjv0swqFqdUM06MQK6u50yfmoM0BUQTlVVUBZf5Xc
         cW6g==
X-Forwarded-Encrypted: i=1; AJvYcCVAU+OscKohLfpMOS/htESCjqRMxmEW96/EZIRd2yhWnMAcnRGLsFs8+yl6BbQJoYC3PQU8ObEq8sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyClfDjbebWRs70qPSRQrWClUhEBmkcJsbtHnB6EM86dp/IEc49
	+1kVaGNhxnd5KwvuW7nrEf5GHkViWw3YF9qwW9lMcPX80tqpeAvsZYnJ
X-Gm-Gg: ASbGnct9lqIXyxKBFIXSOsbaw4tJyS91B2CleDG6E6CBcjlmXb2O2SVsRhCsFzAdb75
	Kot9BNEgZ5ggIxAmIhpcbDwmThy/kV/rl1NakOnSNMMdulIaudz99DPGu6efqELv0qK7jyd+Xcu
	j06GncPbDoOSBYInEd7R0aAoY5grjyEYIVDzhXb+Gxn3Uka6C3RY2YBbIxA9PZ+gihsjy8zZ7Iz
	YfEWwQbEqj83flbrg3skyuuMeMcFiCOAq/msqFBAAsgdZ6lMf1EghQ2e/TmIh7SS39v6Ur0D+9A
	HN85HqxzLHrxPjXnPLPs6SWyijIyYmuKvfeGuaQ8fh8AUQWKs5Qi/ruPOViK+nmdS6VPmk29c4e
	0rFeXEUWeu6gko01B3Nw/a1BsB8O/KPqFa5qPlbCvMEUIjR36/o+HKn/2KhF913sd7kFN2qGuW9
	nQTK5Vyaw=
X-Google-Smtp-Source: AGHT+IHyxhlzAjhlohvEFWaYE6S88nP+H3FL/qAlcoF2fOCHCCihZI9JyPIsTyOIH23Qq820VzPdTg==
X-Received: by 2002:a05:6402:24c5:b0:634:2538:e563 with SMTP id 4fb4d7f45d1cf-6349f9d1c15mr12923604a12.3.1759161540922;
        Mon, 29 Sep 2025 08:59:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------a4FbLeb3lS4WxuKkSWT7Qm1z"
Message-ID: <dfd39bbb-cefb-4d6a-b4cb-b3a787411fb8@gmail.com>
Date: Mon, 29 Sep 2025 17:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20250929084149.70560-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250929084149.70560-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------a4FbLeb3lS4WxuKkSWT7Qm1z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/29/25 10:41 AM, Roger Pau Monne wrote:
> I've had the luck to come across a PCI card that exposes a MSI-X capability
> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>
> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> still use the address of such empty BAR (0) and attempt to crave a hole in
> the p2m.  This leads to errors like the one below being reported by Xen:
>
> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>
> And the device left unable to enable memory decoding due to the failure
> reported by vpci_make_msix_hole().
>
> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> tables are usable.  This requires checking that the BIR points to a
> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> target BAR.
>
> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> EPYC 9965 processors.  The broken device is:
>
> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>
> There are multiple of those integrated controllers in the system, all
> broken in the same way.
>
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
> Cc: Stewart Hildebrand<stewart.hildebrand@amd.com>
> Cc: Jan Beulich<jbeulich@suse.com>
> Cc: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> While not strictly a bugfix, I consider this a worthy improvement so that
> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> capabilities.

Based on your commit description it looks like a bug as without it, for example,
SATA controller can't be used, right?

>   Hence I think this change should be considered for inclusion
> into 4.21.  There a risk of regressing on hardware that was already working
> with PVH, but given enough testing that should be minimal.

We have some PVH tests in Xen’s GitLab CI, but I assume that isn’t enough?

~ Oleksii

> ---
>   xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 45 insertions(+), 5 deletions(-)
>
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..8458955d5bbb 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>       if ( !msix )
>           return -ENOMEM;
>   
> +    msix->tables[VPCI_MSIX_TABLE] =
> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> +    msix->tables[VPCI_MSIX_PBA] =
> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> +
> +    /* Check that the provided BAR is valid. */
> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> +    {
> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
> +        unsigned int type;
> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
> +        unsigned int size =
> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
> +
> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
> +        {
> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
> +                   &pdev->sbdf, name, bir);
> + invalid:
> +            xfree(msix);
> +            return -ENODEV;
> +
> +        }
> +
> +        type = bars[bir].type;
> +        if ( type != VPCI_BAR_MEM32 && type != VPCI_BAR_MEM64_LO )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n",
> +                   &pdev->sbdf, name, bir, type);
> +            goto invalid;
> +        }
> +
> +        if ( (uint64_t)offset + size > bars[bir].size )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pp: MSI-X %s table offset %#x size %#x outside of BAR%u size %#lx\n",
> +                   &pdev->sbdf, name, offset, size, bir, bars[bir].size);
> +            goto invalid;
> +        }
> +    }
> +
>       rc = vpci_add_register(pdev->vpci, control_read, control_write,
>                              msix_control_reg(msix_offset), 2, msix);
>       if ( rc )
> @@ -686,11 +731,6 @@ static int cf_check init_msix(struct pci_dev *pdev)
>       msix->max_entries = max_entries;
>       msix->pdev = pdev;
>   
> -    msix->tables[VPCI_MSIX_TABLE] =
> -        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> -    msix->tables[VPCI_MSIX_PBA] =
> -        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> -
>       for ( i = 0; i < max_entries; i++)
>       {
>           msix->entries[i].masked = true;
--------------a4FbLeb3lS4WxuKkSWT7Qm1z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/25 10:41 AM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250929084149.70560-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">I've had the luck to come across a PCI card that exposes a MSI-X capability
where the BIR of the vector and PBA tables points at a BAR that has 0 size.

This doesn't play nice with the code in vpci_make_msix_hole(), as it would
still use the address of such empty BAR (0) and attempt to crave a hole in
the p2m.  This leads to errors like the one below being reported by Xen:

d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area

And the device left unable to enable memory decoding due to the failure
reported by vpci_make_msix_hole().

Introduce checking in init_msix() to ensure the BARs containing the MSI-X
tables are usable.  This requires checking that the BIR points to a
non-empty BAR, and the offset and size of the MSI-X tables can fit in the
target BAR.

This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
EPYC 9965 processors.  The broken device is:

22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)

There are multiple of those integrated controllers in the system, all
broken in the same way.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
Cc: Stewart Hildebrand <a class="moz-txt-link-rfc2396E" href="mailto:stewart.hildebrand@amd.com">&lt;stewart.hildebrand@amd.com&gt;</a>
Cc: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Cc: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

While not strictly a bugfix, I consider this a worthy improvement so that
PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
capabilities. </pre>
    </blockquote>
    <pre>Based on your commit description it looks like a bug as without it, for example,
SATA controller can't be used, right?

</pre>
    <blockquote type="cite"
      cite="mid:20250929084149.70560-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre"> Hence I think this change should be considered for inclusion
into 4.21.  There a risk of regressing on hardware that was already working
with PVH, but given enough testing that should be minimal.</pre>
    </blockquote>
    <pre>We have some PVH tests in Xen’s GitLab CI, but I assume that isn’t enough?

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:20250929084149.70560-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..8458955d5bbb 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
     if ( !msix )
         return -ENOMEM;
 
+    msix-&gt;tables[VPCI_MSIX_TABLE] =
+        pci_conf_read32(pdev-&gt;sbdf, msix_table_offset_reg(msix_offset));
+    msix-&gt;tables[VPCI_MSIX_PBA] =
+        pci_conf_read32(pdev-&gt;sbdf, msix_pba_offset_reg(msix_offset));
+
+    /* Check that the provided BAR is valid. */
+    for ( i = 0; i &lt; ARRAY_SIZE(msix-&gt;tables); i++ )
+    {
+        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
+        const struct vpci_bar *bars = pdev-&gt;vpci-&gt;header.bars;
+        unsigned int bir = msix-&gt;tables[i] &amp; PCI_MSIX_BIRMASK;
+        unsigned int type;
+        unsigned int offset = msix-&gt;tables[i] &amp; ~PCI_MSIX_BIRMASK;
+        unsigned int size =
+            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
+                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
+
+        if ( bir &gt;= ARRAY_SIZE(pdev-&gt;vpci-&gt;header.bars) )
+        {
+            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
+                   &amp;pdev-&gt;sbdf, name, bir);
+ invalid:
+            xfree(msix);
+            return -ENODEV;
+
+        }
+
+        type = bars[bir].type;
+        if ( type != VPCI_BAR_MEM32 &amp;&amp; type != VPCI_BAR_MEM64_LO )
+        {
+            printk(XENLOG_ERR
+                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n",
+                   &amp;pdev-&gt;sbdf, name, bir, type);
+            goto invalid;
+        }
+
+        if ( (uint64_t)offset + size &gt; bars[bir].size )
+        {
+            printk(XENLOG_ERR
+                   "%pp: MSI-X %s table offset %#x size %#x outside of BAR%u size %#lx\n",
+                   &amp;pdev-&gt;sbdf, name, offset, size, bir, bars[bir].size);
+            goto invalid;
+        }
+    }
+
     rc = vpci_add_register(pdev-&gt;vpci, control_read, control_write,
                            msix_control_reg(msix_offset), 2, msix);
     if ( rc )
@@ -686,11 +731,6 @@ static int cf_check init_msix(struct pci_dev *pdev)
     msix-&gt;max_entries = max_entries;
     msix-&gt;pdev = pdev;
 
-    msix-&gt;tables[VPCI_MSIX_TABLE] =
-        pci_conf_read32(pdev-&gt;sbdf, msix_table_offset_reg(msix_offset));
-    msix-&gt;tables[VPCI_MSIX_PBA] =
-        pci_conf_read32(pdev-&gt;sbdf, msix_pba_offset_reg(msix_offset));
-
     for ( i = 0; i &lt; max_entries; i++)
     {
         msix-&gt;entries[i].masked = true;
</pre>
    </blockquote>
  </body>
</html>

--------------a4FbLeb3lS4WxuKkSWT7Qm1z--

