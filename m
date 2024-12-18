Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349149F63CD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860255.1272302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrdI-0004Q7-So; Wed, 18 Dec 2024 10:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860255.1272302; Wed, 18 Dec 2024 10:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrdI-0004Oo-Q9; Wed, 18 Dec 2024 10:50:24 +0000
Received: by outflank-mailman (input) for mailman id 860255;
 Wed, 18 Dec 2024 10:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIsi=TL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNrdG-0004Oi-I6
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:50:22 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ea8f00-bd2d-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 11:50:21 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3022c61557cso68328231fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 02:50:21 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045318sm15431471fa.30.2024.12.18.02.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 02:50:20 -0800 (PST)
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
X-Inumbo-ID: e0ea8f00-bd2d-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734519021; x=1735123821; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+tlWGjlt39XQldE9UijvlscC2vMAhgHkHiI91WqOOQ=;
        b=fAfsbwQ04iypfILjvxD0JnLwvzIpip1HYmaT2+J264OWTtgdV1gr2KkY3TOhMpm92D
         2UYqGxBcCSQb2KnDRb/8Wzst/rv6epFQ0bXDYOk+JvDb2uTvQTClQa86RDgXuwtDb0Yh
         anKNuaCCsjVk+WQ64Sh1jEX59ip1Onyg3P8kWFhqDq/wIjMP6vaFCojhC0TwS7b0qE7m
         4BFY64A1MpPInBJ/Y+t6m9IjWQakVQrbXbApTj1Ga245PFvTXsrqIeZBUCa99iLE4dCY
         HFxF+Msdwal0v00NodWLZtwQxMJ++RL2WUKNvIe6VSAv9EWpYTZzFFGS5QeHQrm+ZXEB
         /XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734519021; x=1735123821;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+tlWGjlt39XQldE9UijvlscC2vMAhgHkHiI91WqOOQ=;
        b=nHNVRxTyQFS3GPNtU/P+TeBs6wJKt4ytBRY1YB+66E1uL3r3imVtT+Jn2cnYoKyqfM
         sZT3SShkUEZKWEHm/piZx+FEclFhooejuVRiLWmvkrHCvtKxL000HO0/0VglIl0EevXP
         6XcUshU9SxkR4SsjV6x1QZmNFay6E+GBfbmL/6N3RWM6U06DfU+Ta3wDtUtsHGBkYcIN
         WGAOPuMMelXrTyHGssghZYpKYvPxVYOm1LZFOXAjiPZ/8wrvGdRSIXao2VQzBbsXhSAL
         OYx54Yyhmz4wvnsKShFERrsc7/9OdLcLjgLmcOpJ8vB4b2ylYFCf2tXG0o89GgwH+T71
         jMfg==
X-Forwarded-Encrypted: i=1; AJvYcCV199ksuu2zy8OrHBjTwBEydaXZHtENutx0IzcSiU7CX8YM1TtqHGRVuzsH6Co3XNeIeE07FK4lFec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEk5NsqmVCTINUeKdbpZtETRH6G1+E9RHStBtBi6eONSuyfbbD
	j6zBar/ND02SDGNQXOtG24uPv6sqVwfYvn27xXicqhz/AcafXmdh
X-Gm-Gg: ASbGncuGP/PVH6CRwsu/9vrBI8bwsT7dymYvHloz9LypO58ekGinJEPo23j9Z8iGyLq
	9UwIDU2M/L6x6XisrWVXrAuICBA3xjJasPza89ixXsdrffUSiVoJSNqHEhPUL3bFM3phclu5qiS
	eGe40c/zG5WoC/roRMj9DE+7B1MwKm/RMQDd41fuAT5RyfZQTjLBl820nmFh6BKfoc6ibj2n06q
	yXSdLxWrC8amhQmCfnTgrmUwJRtJcqlQMvYBT3qOQd7LTudavLb+AWBjxvAmbJ/REQuyQ==
X-Google-Smtp-Source: AGHT+IHGjCnSRB2+5m76PVm1Dk2W8+RwC175kJFppSOZPtOdS0j1dufV1g7yON/nzx0j5Er6bQiAaA==
X-Received: by 2002:a2e:be9c:0:b0:304:4cac:d8ef with SMTP id 38308e7fff4ca-3044da8680dmr7557871fa.7.1734519020693;
        Wed, 18 Dec 2024 02:50:20 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0q3TURiZYUsZTF1DtabbZLHm"
Message-ID: <941f37dc-2dd5-4a11-acf5-8b4e97f183e6@gmail.com>
Date: Wed, 18 Dec 2024 11:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Unflattening and relocation of host device tree
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
 <abeaddb8-6792-4766-9f29-9b0544c746b7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <abeaddb8-6792-4766-9f29-9b0544c746b7@suse.com>

This is a multi-part message in MIME format.
--------------0q3TURiZYUsZTF1DtabbZLHm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/24 5:36 PM, Jan Beulich wrote:
> On 17.12.2024 17:32, Oleksii Kurochko wrote:
>> The current patch series introduces the relocation of the host device tree file
>> to free up low memory and also it is expected that discard_initial_modules()
>> will be called sooner or later, it will discard the FDT boot module,
>> and remove_early_mappings() will destroy the early mappings.
>>
>> In addition to relocation, unflattening is introduced to create the tree of
>> struct device_node for the host device tree.
>>
>> To implement this, several things have been introduced:
>>   - destroy_xen_mappings() function, which removes page mappings from Xen's
>>     page tables. This is necessary for clear_fixmap().
>>   - {set,clear}_fixmap() functions to manage mappings in the fixmap region,
>>     which are expected to be used in copy_from_paddr() to copy the FDT to Xen's
>>     heap.
>>   - Introduce new config CONFIG_QEMU which is going to be used to cover changes
>>     connected to QEMU virtual board. It will be used during introduction of stubs
>>     for clean_and_invalidate_dcache_va_range() and clean_dcache_va_range(),
>>     which are expected to be used in copy_from_paddr() and flush_page_to_ram(),
>>     which in turn are expected to be used during the call to xvmalloc_array() in
>>     relocate_fdt().
>>     In case of QEMU cached related functions are implemented as returning 0 as
>>     QEMU doesn't model cache ( and so CMO extensions ). For others cases, it is
>>     introduced as -ENOSUPP as h/w could support CMO extension ( or hardware
>>     specific insertions ) and it will need to update implementation of the
>>     mentioned functions.
>>   - The introduction of copy_from_paddr() to copy the FDT to an address
>>     allocated in Xen's heap.
>>
>> ---
>> Changes in v3:
>>   - Add some Acks for the patches. All the patches are Acked except:
>>       [PATCH v3 1/7] xen/riscv: update layout table in config.h
>>       [PATCH v3 5/7] xen/riscv: implement data and instruction cache operations
>>   - Other changes please look at the specific patch.
>> ---
>> Changes in v2:
>>   - Update the cover letter.
>>   - Introduce new patch with aligning of upper bounds in the layout table in
>>     config.h with the definitions below which are inclusive.
>>   - Other changes please look at the specific patch.
>> ---
>>
>> Oleksii Kurochko (7):
>>    xen/riscv: update layout table in config.h
>>    xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page
>>      tables
>>    xen/riscv: reorder includes in asm/page.h alphabetically
>>    xen/riscv: add {set,clear}_fixmap() functions for managing fixmap
>>      entries
> Please can you avoid re-posting patches that were already committed (the
> latter three)?

Sure, I confused something when fetch upstream/staging so missed that some patches
were merged.

Sorry for inconvenience.

~ Oleksii

--------------0q3TURiZYUsZTF1DtabbZLHm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/17/24 5:36 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:abeaddb8-6792-4766-9f29-9b0544c746b7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.12.2024 17:32, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The current patch series introduces the relocation of the host device tree file
to free up low memory and also it is expected that discard_initial_modules()
will be called sooner or later, it will discard the FDT boot module,
and remove_early_mappings() will destroy the early mappings.

In addition to relocation, unflattening is introduced to create the tree of
struct device_node for the host device tree.

To implement this, several things have been introduced:
 - destroy_xen_mappings() function, which removes page mappings from Xen's
   page tables. This is necessary for clear_fixmap().
 - {set,clear}_fixmap() functions to manage mappings in the fixmap region,
   which are expected to be used in copy_from_paddr() to copy the FDT to Xen's
   heap.
 - Introduce new config CONFIG_QEMU which is going to be used to cover changes
   connected to QEMU virtual board. It will be used during introduction of stubs
   for clean_and_invalidate_dcache_va_range() and clean_dcache_va_range(),
   which are expected to be used in copy_from_paddr() and flush_page_to_ram(),
   which in turn are expected to be used during the call to xvmalloc_array() in
   relocate_fdt().
   In case of QEMU cached related functions are implemented as returning 0 as
   QEMU doesn't model cache ( and so CMO extensions ). For others cases, it is
   introduced as -ENOSUPP as h/w could support CMO extension ( or hardware
   specific insertions ) and it will need to update implementation of the
   mentioned functions.
 - The introduction of copy_from_paddr() to copy the FDT to an address
   allocated in Xen's heap.

---
Changes in v3:
 - Add some Acks for the patches. All the patches are Acked except:
     [PATCH v3 1/7] xen/riscv: update layout table in config.h
     [PATCH v3 5/7] xen/riscv: implement data and instruction cache operations
 - Other changes please look at the specific patch.
---
Changes in v2:
 - Update the cover letter.
 - Introduce new patch with aligning of upper bounds in the layout table in
   config.h with the definitions below which are inclusive.
 - Other changes please look at the specific patch.
---

Oleksii Kurochko (7):
  xen/riscv: update layout table in config.h
  xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page
    tables
  xen/riscv: reorder includes in asm/page.h alphabetically
  xen/riscv: add {set,clear}_fixmap() functions for managing fixmap
    entries
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please can you avoid re-posting patches that were already committed (the
latter three)?</pre>
    </blockquote>
    <pre>Sure, I confused something when fetch upstream/staging so missed that some patches
were merged.
</pre>
    <pre>Sorry for inconvenience.

~ Oleksii
</pre>
  </body>
</html>

--------------0q3TURiZYUsZTF1DtabbZLHm--

