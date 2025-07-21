Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7AB0C512
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051513.1419854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqTI-0006sp-It; Mon, 21 Jul 2025 13:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051513.1419854; Mon, 21 Jul 2025 13:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqTI-0006r6-FK; Mon, 21 Jul 2025 13:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1051513;
 Mon, 21 Jul 2025 13:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IohA=2C=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1udqTG-0006qh-Gq
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:22:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baf62f55-6635-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 15:22:20 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2008699f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:22:20 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2bc6fsm10553775f8f.28.2025.07.21.06.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:22:19 -0700 (PDT)
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
X-Inumbo-ID: baf62f55-6635-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753104140; x=1753708940; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0kJbV10b1llb2U+8jNIg+HHYfNJwzOBZ/2PSl5jpdg=;
        b=V77ERokxW8PCbW0FCTqwG4dGuyeSY7g/joAAog7tlvCTtdEdLQ1nNvPLhzpsLv+8ok
         b2Eh/kPAzJ3ln83MKEO9CMVzz+ZyzMyKLt1cGlkOJYvE/NYTCVczbTYRAZig9sNuTSP6
         fQ6+K6Bvd/tudYU6CQ6Vyk7aEhD/gI/JHquU35nk4opEe2vQYIgJD8nbD4NZJkgmioSU
         XBYug3qL6GB3UURGf58zZ140fW6udq+9drYLaxbN7sw8edQ5ZB7/+o+q38I3g9bT3rAg
         I87ZVJdB3i8XPRy/wWlexI0+AYHCLt8CHqNyQ3rzskO1LenEmqM8InBYDNLxm/nd9g2s
         icSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104140; x=1753708940;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0kJbV10b1llb2U+8jNIg+HHYfNJwzOBZ/2PSl5jpdg=;
        b=O+Ro/JpvkozKoBjulv6gfPrQtEnJfie2oR3lR20KGfXFcS2466fJhKKrTA6rTQk7lc
         3P/hJ8x3cJ7CxsqpOVKX0EV/JQa4jd5tjUBs4sUGHVkUK90VKktVCi19m/+bwoYpFcAx
         sMi/HMHPsm4k9OheZaARrKrMdLftFIm1H5TOleJQpVrpI2qqeD3FDPdJZn6EZv3cv0eX
         rLt5ceAXqh9+b57oehF8uXkViLPz/uudFKuQ4AG1+Y0nWhA48F3QaHxsSsck50cW/4Pe
         yXqgi31GfDjiXzSmXZ6ZRNhe8LE5w9vYf9IRdwZb4SQzsZrynJzLeQi/7+PTJorTzIEG
         Ba1g==
X-Gm-Message-State: AOJu0YwSlcXXtrfJEsjySbPs89Gy5Hcx+pHfvMA+N0hKC4w5Iv2Iw4QN
	YvxfE3sGhqw95UH2l/xGdUtTe4fN0TQabSI7Me5KMUfadCRDkMOvTnct
X-Gm-Gg: ASbGncuszGOiJ84TrO/Lw+Mu06XlVt+rqf2nS/SJzJGxcPuWhGtBe8dRM9GsNTI7rNF
	jbA47yVmRqhU501Ud4mK4KcNI/G83Y4i4weF2IQzDK7ftOTOLU8KMW6q1w0s4UOgXODe1FLaGFD
	xzo5MhAngpq7KkJ8JCZ6P1MmJYJYJnzqOJh+ZEwljPJmFodcKt1gSbqyPMGM6S17HCYVAL9Szgd
	gfQPb+sOVgk2GGlv/8MU2f1ovJLWBk/7kHbYfIDvIaYkrip1tpZuGu1mIRpcBVGXyrt/EBiHfbU
	vTZ1pwpImFuioC0NcCJzPu6b0NTRHZaSNA2vP8MN2LTJ7nnLvh8JblRBdRTKhCbyDKkFA2NmHs+
	QlwWNn7LAgcXZXZWd6JP84L1xE/wNE/svlNojRxi9YOLZhqG3JwQHdu9omXrzMMI0VipKEHQEUj
	dY7BLOjutR4aLH
X-Google-Smtp-Source: AGHT+IGU/m5P0plEUi2eeWXUWLFWlSAjOGKoLJsP5EKihOtUf/pffINIhcTACWI3kTfNoXgHjIxlQA==
X-Received: by 2002:a05:6000:1ac5:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3b60e523bf5mr17509844f8f.35.1753104139642;
        Mon, 21 Jul 2025 06:22:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------B618KbUOr35EiOxHN00pA3Ur"
Message-ID: <f55f3bee-d0be-4397-bafa-75ff0f3bdf60@gmail.com>
Date: Mon, 21 Jul 2025 14:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain
 pci_sbdf_t
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1752736989.git.andriy.sultanov@vates.tech>
 <94d8b7537021337a6b54d8950294702f5bbd2590.1752736989.git.andriy.sultanov@vates.tech>
 <aHrElE4KN7djeXzn@kraken> <870ebf7f-e953-4c48-b733-a5e7a191cae2@suse.com>
Content-Language: en-US
From: Andriy Sultanov <sultanovandriy@gmail.com>
In-Reply-To: <870ebf7f-e953-4c48-b733-a5e7a191cae2@suse.com>

This is a multi-part message in MIME format.
--------------B618KbUOr35EiOxHN00pA3Ur
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/25 7:25 AM, Jan Beulich wrote:

> On 19.07.2025 00:03,dmkhn@proton.me wrote:
>> On Thu, Jul 17, 2025 at 08:31:27AM +0100, Andrii Sultanov wrote:
>>> @@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
>>>       new_rte.raw = rte;
>>>
>>>       /* get device id of ioapic devices */
>>> -    bdf = ioapic_sbdf[idx].bdf;
>>> -    seg = ioapic_sbdf[idx].seg;
>>> -    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
>>> +    sbdf = ioapic_sbdf[idx].sbdf;
>>> +    iommu = find_iommu_for_device(sbdf);
>>>       if ( !iommu )
>>>       {
>>>           AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
>>                                                                  ^^
>> Use %pp ?
> Here I'm pretty firmly against. We're talking of an IO-APIC here, not really
> a PCI device (and that's irrespective of AMD often(?) representing IO-APICs
> also as PCI devices).
>
> Jan

Please note that this one was just reverted in V5 following some review
comments. From the changelog in the commit message:
 > * Reverted print formatting change in amd_iommu_ioapic_update_ire

--------------B618KbUOr35EiOxHN00pA3Ur
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 7/21/25 7:25 AM, Jan Beulich wrote:</p>
    <blockquote type="cite"
      cite="mid:870ebf7f-e953-4c48-b733-a5e7a191cae2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 19.07.2025 00:03, <a class="moz-txt-link-abbreviated" href="mailto:dmkhn@proton.me">dmkhn@proton.me</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Thu, Jul 17, 2025 at 08:31:27AM +0100, Andrii Sultanov wrote:
</pre>
      </blockquote>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">@@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
     new_rte.raw = rte;

     /* get device id of ioapic devices */
-    bdf = ioapic_sbdf[idx].bdf;
-    seg = ioapic_sbdf[idx].seg;
-    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
+    sbdf = ioapic_sbdf[idx].sbdf;
+    iommu = find_iommu_for_device(sbdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
                                                                ^^
Use %pp ?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Here I'm pretty firmly against. We're talking of an IO-APIC here, not really
a PCI device (and that's irrespective of AMD often(?) representing IO-APICs
also as PCI devices).

Jan
</pre>
    </blockquote>
    <p>Please note that this one was just reverted in V5 following some
      review<br>
      comments. From the changelog in the commit message:<br>
      &gt;  <span style="white-space: pre-wrap">* Reverted print formatting change in amd_iommu_ioapic_update_ire</span></p>
  </body>
</html>

--------------B618KbUOr35EiOxHN00pA3Ur--

