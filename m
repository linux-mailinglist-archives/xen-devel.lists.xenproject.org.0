Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A06A3C235
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893042.1301975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkl8v-0003e0-Rh; Wed, 19 Feb 2025 14:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893042.1301975; Wed, 19 Feb 2025 14:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkl8v-0003b7-P2; Wed, 19 Feb 2025 14:33:41 +0000
Received: by outflank-mailman (input) for mailman id 893042;
 Wed, 19 Feb 2025 14:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkl8u-0003b1-Pv
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:33:40 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82b9912b-eece-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 15:33:39 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54524740032so5996729e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 06:33:39 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452d9cd8a2sm1738025e87.76.2025.02.19.06.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 06:33:38 -0800 (PST)
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
X-Inumbo-ID: 82b9912b-eece-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739975619; x=1740580419; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djw16h++tioF4+ERRAhJ8rRPM+INlvR1+36Ihf30IvM=;
        b=KE3tYIhggH+ecmZFNWNDcrbJEutzJ0JSScQmP8jAssgSYf5CM1i1Y62Cwu1MY3D1iG
         34KAzGCspniuMktx9FnLpgDah4QDRDGFjNXoSUFXOR94t2X3RJsUf7OCh0D5CCm8HcqU
         KCZAYaBe5/hqKxsQtMy/ZYmCPrGxdLoVe2j4jsYSAOsj1qkt5hdQY6zLgZWaa5qHyG4A
         63YQxxtDJwxxqWKA+ft8suQYmn3pOO8ow1CapXK5zz4R3xVz+h8CXZNjw/JjH9MjfkxU
         PyNEx1zaon26ejOH7R/p0umMjn4cFaBaVQDWl5xbpFxDaFShW4dSbhpNo+8Br0oU4WVA
         FuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975619; x=1740580419;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djw16h++tioF4+ERRAhJ8rRPM+INlvR1+36Ihf30IvM=;
        b=Q7aUgmc5VRN7LBnptL1e4X3Ft7EriunPyO9IQvnwdIsvqSSnw9slfWLrAs6KkOR+PG
         0cmTCXWmGuu+Lulrw5tTqH3bwzTwZT13ALSr/N5TK0n+FfFh6A1A9zAXUeJGzH667ShF
         kCOwhUri4dto4fQ217OxswGTOpBrtugHBf7JNcvAtW+CsfFD9xld4UkXVtaUPk3cBIXe
         lfbusI3SjcBG9nwFlMHptHD1i46aSj02K9wg1EsiC+s7ZofJBJdxNaB0ps0WXy9tLNKC
         apDMmkSCxFWsOrWwTwTg2nQngxMvF0aiv3FEBmzzdN573AwgqykT4ShCZviLArYHVFB4
         cZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVa1/z6Nw2S89y0HVfA8lIkMRMGd9vTCCXFoU3CwJbHsMyB8VSFXhyewhaFdyo5VjE2xOmBUlHbAbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVtR8lq/flTim7uaMc588p4QTrarkVtuxIs1vGpsFLm29d/pmh
	J2RVE/wb6xvZCrpCE1rXYlw941RhjBN6OXpBcwh8cNhyVpIXRr+4
X-Gm-Gg: ASbGnct6gefa+vLnXdhDB8vC3SrkMn8/urL3Z+hPOiiY+SA+qY7oVb8zFVhWrHN55CP
	1xp+ufbT6HN9/8AAf4CNI+BHEZY4zhnfjE1g2vjCVmWUdKpFcthFNbF9UPYK8WD2D45ST+ia2pw
	ElEXpM3G63+f/gNoLqQZfRs/rTxUX0ZuGwHlkAHPF7kMLAbKQuqYaNHBeGAXbHsGAD4eFdgTOl0
	c22/Rq8z6PqmhA6PUAzEizeBWG64kAP/TBI/Z+Qq35uz0O4ctxPIx6lxxru0k/HiFKgQYBLI0Q1
	66/7djKFTQhlRsD0Qmt3U1sO
X-Google-Smtp-Source: AGHT+IG8HnDTH/IhBMla/6hFvegTAJ3rcI/0EXXWltlbnhcMfS+Ltt4LOYXNvGys0V363+MkirXbug==
X-Received: by 2002:a05:6512:104e:b0:545:2b24:c714 with SMTP id 2adb3069b0e04-5452fe56d73mr7538795e87.18.1739975618643;
        Wed, 19 Feb 2025 06:33:38 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------XUSiONVSkpK6sxYPfu7e86kw"
Message-ID: <45cc5337-be6b-4bfb-b968-56dc98bad249@gmail.com>
Date: Wed, 19 Feb 2025 15:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 1/3] xen/riscv: implement software page table
 walking
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <9f1fbf84a82fd141f40428993106f0672d6d8c4c.1739363240.git.oleksii.kurochko@gmail.com>
 <5c56ef1f-1a13-4a2e-9317-0cc90e93d479@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5c56ef1f-1a13-4a2e-9317-0cc90e93d479@suse.com>

This is a multi-part message in MIME format.
--------------XUSiONVSkpK6sxYPfu7e86kw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/19/25 12:14 PM, Jan Beulich wrote:
> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/pt.c
>> +++ b/xen/arch/riscv/pt.c
>> @@ -185,6 +185,68 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>>       return XEN_TABLE_NORMAL;
>>   }
>>   
>> +/*
>> + * _pt_walk() performs software page table walking and returns the pte_t of
>> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
>> + * for further analysis.
>> + *
>> + * Additionally, _pt_walk() returns the level of the found pte by using
>> + * `pte_level` argument.
>> + * `pte_level` is optional, set `pte_level`=NULL if a caller doesn't need
>> + * the level of the found pte.
> How about this, reducing redundancy a little?
>
>   * _pt_walk() can optionally return the level of the found pte. Pass NULL
>   * for `pte_level` if this information isn't needed.
>
>> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>> +{
>> +    pte_t *entry = _pt_walk(va, pte_level);
>> +    pte_t pte = *entry;
>> +
>> +    unmap_table(entry);
>> +
>> +    return pte;
>> +}
> "entry" especially in this context is ambiguous. I would expect a variable of
> this name to be of type pte_t, not pte_t *. How about "ptep"?

Agree with both your suggestions, it would be better to use `ptep instead of `entry`
and rephrase the comment.

>
> Preferably with these adjustments, which I'd be fine making while committing,
> Reviewed-by: Jan Beulich<jbeulich@suse.com>
>
> Considering the 4.20? tag you'll need to decide whether you still want this
> in before the release.

Considering that it is still needed a new version for patch3 of this patch series and
that the mentioned issues aren't affected no one, lets consider the full patch series for
4.21.

Thanks.

~ Oleksii

--------------XUSiONVSkpK6sxYPfu7e86kw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/19/25 12:14 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5c56ef1f-1a13-4a2e-9317-0cc90e93d479@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.02.2025 17:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,68 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
     return XEN_TABLE_NORMAL;
 }
 
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ *
+ * Additionally, _pt_walk() returns the level of the found pte by using
+ * `pte_level` argument.
+ * `pte_level` is optional, set `pte_level`=NULL if a caller doesn't need
+ * the level of the found pte.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How about this, reducing redundancy a little?

 * _pt_walk() can optionally return the level of the found pte. Pass NULL
 * for `pte_level` if this information isn't needed.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    pte_t *entry = _pt_walk(va, pte_level);
+    pte_t pte = *entry;
+
+    unmap_table(entry);
+
+    return pte;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"entry" especially in this context is ambiguous. I would expect a variable of
this name to be of type pte_t, not pte_t *. How about "ptep"?</pre>
    </blockquote>
    <pre>Agree with both your suggestions, it would be better to use `ptep instead of `entry`
and rephrase the comment.

</pre>
    <blockquote type="cite"
      cite="mid:5c56ef1f-1a13-4a2e-9317-0cc90e93d479@suse.com">
      <pre wrap="" class="moz-quote-pre">

Preferably with these adjustments, which I'd be fine making while committing,
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

Considering the 4.20? tag you'll need to decide whether you still want this
in before the release.</pre>
    </blockquote>
    <pre>Considering that it is still needed a new version for patch3 of this patch series and
that the mentioned issues aren't affected no one, lets consider the full patch series for
4.21.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------XUSiONVSkpK6sxYPfu7e86kw--

