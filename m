Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECA9EB4A7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852734.1266451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL23f-00028k-Sl; Tue, 10 Dec 2024 15:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852734.1266451; Tue, 10 Dec 2024 15:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL23f-00027G-Pe; Tue, 10 Dec 2024 15:21:55 +0000
Received: by outflank-mailman (input) for mailman id 852734;
 Tue, 10 Dec 2024 15:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tL23e-00027A-AM
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:21:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c312303-b70a-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 16:21:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-435004228c0so16856515e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:21:53 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68c894472sm299651766b.87.2024.12.10.07.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:21:52 -0800 (PST)
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
X-Inumbo-ID: 7c312303-b70a-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844113; x=1734448913; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09jUxtKKNci42VhtTFd6c+JmlQ8B/KYHoGduA44v89c=;
        b=jk3hNEGEvU3qbfrbJ122y7zxXswvJPgFx3KILUOMeSGk1oOxCTTxciZCMR+yPfFJv0
         fy+c/Mn4bERySeLRmZowL6Us9UKzrxtkLu0yYTiEb7uhhWYst1xNR0j7VUz8nDagYk95
         xhuN+u4VG8WwanY8kO6AxU9eR7mx1CIhD6543UYcAuLYYdJUnbwgccq68UAVLBtTHG8T
         f9Rb52kFP+kz4O98EsAuwTaj3cO/EMoZRhquhm+iLBYYZbvYLWzU0K7LABUN+ubTopKG
         vZcXlQAnhDhEHPg4HvpxhuL7sHRJb4CFEpgsXmrNKnd3Hdk8JAdCHA1fk8MiwdhIWCvB
         c6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844113; x=1734448913;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=09jUxtKKNci42VhtTFd6c+JmlQ8B/KYHoGduA44v89c=;
        b=dmo+XvHlV6/ieMb5gwGxk2cvHYh2tfPqNSsG3SZaj1Bwswgjf5rB7WWK9xYU6bjscR
         JNyfPQudYcynyoddeJaIAUhYWr90Q588sNtfXF4HIztDPrBUWkT/5vtcu6T5CaCGIw6+
         RCzMbLXJdbuIXZkU6Asz9abIIYCJAPA3sHkkNsDcIxNB0JyoR31xuNcNCbDhnzM+5q4N
         hEOnCkiFIhC/ws8q+z/w8nMbUydMZeabDx5KuS6ywqSPkMaWAOL+mCycUiqhGcTRuerv
         q0jZ4BwOqklIu3WYqbGm9I9dLWAq/aTqO6NdD9HBlahLu8hF312RzWHq3iFnlNzBGswj
         lhpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWpaC4X4zPboO5Ny4OCIU+KyErlySrSojtvkS8fJH1U8vnJyKyyQRCRSt/8y2AW0ETA7MxqU9XdcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLU9ljadlOUvWpQe/vjyDOa3Yd0RpQuloCUn6/eMfEYpkclI9f
	CVRxu177+5kimjBHphdDe+5yV1Ws7lK4eI4OiBevlsZM2EzS3GIN
X-Gm-Gg: ASbGncsbIQeac0ySNsUNIStJC+p0UcAYUlqA3EaFjj5Pt/WBEWfUYslYk5X2/364J+M
	7VQikEwSWbjDVa9gKyUsJJv1qs8XBIN79FYcb6/4mihERKv/SfO5/kO79dvLmINa2LjUFAMNCGC
	FHoWCej3AcmXW87379u9pviBBT2i2TLutOwrD6il6Lo0zegsLl9k8aViHlWNSgXVasFyyuSF57Q
	BmfyWMbjkgBwrszZjcWaz9LyUYl5LuPQKioaFH7ONTHIlhyDW4Kr0xrPB1ohLxXDJI=
X-Google-Smtp-Source: AGHT+IFs7iIQmreKKmGdZTBsmvII9u88NSMDD37+TggqNMFJ5WlL8bQ8B4cEqJwadt9QNadej/dq5Q==
X-Received: by 2002:a05:6000:4604:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-386453f9740mr4857763f8f.46.1733844112659;
        Tue, 10 Dec 2024 07:21:52 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------mzpJtawHAmPIUL3RdtV0eFmM"
Message-ID: <f0cd6723-d033-4b3d-a713-9adafe6f8a55@gmail.com>
Date: Tue, 10 Dec 2024 16:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: relocating and unflattening host device
 tree
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <f2b1b8b4d80d6b2ccc846ae7171a316a9b46ac56.1732709650.git.oleksii.kurochko@gmail.com>
 <bcc38672-647c-4fd6-9f90-cf26641b83f7@suse.com>
 <34fbc3bf-f740-47bd-90e4-2f8b9ce46cfd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <34fbc3bf-f740-47bd-90e4-2f8b9ce46cfd@suse.com>

This is a multi-part message in MIME format.
--------------mzpJtawHAmPIUL3RdtV0eFmM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/24 4:57 PM, Jan Beulich wrote:
> On 09.12.2024 16:56, Jan Beulich wrote:
>> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>>> Relocate FDT to Xen heap instead of using early mapping as it is
>>> expected that discard_initial_modules() ( is supposed to call in
>>> the future ) discards the FDT boot module and remove_early_mappings()
>>> destroys the early mapping.
>>>
>>> Unflatten a device tree, creating the tree of struct device_node.
>>> It also fills the "name" and "type" pointers of the nodes so the normal
>>> device-tree walking functions can be used.
>>>
>>> Set device_tree_flattened to NULL in the case when acpi_disabled is
>>> equal to false.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
>>
>> Albeit ...
>>
>>> @@ -71,6 +72,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>                                  paddr_t dtb_addr)
>>>   {
>>>       const char *cmdline;
>>> +    size_t fdt_size;
>>>   
>>>       remove_identity_mapping();
>>>   
>>> @@ -95,7 +97,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>                             _end - _start, false) )
>>>           panic("Failed to add BOOTMOD_XEN\n");
>>>   
>>> -    if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
>>> +    if ( !(fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr)) )
>>>           BUG();
>> ... perhaps better
>>
>>      fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
>>      BUG_ON(!fdt_size);
>>
>> ?
> And then I notice that Arm has no such check at all. Better stay in sync?

Agree, it is better to be in sync. I will drop the BUG_ON().

Thanks.

~ Oleksii


--------------mzpJtawHAmPIUL3RdtV0eFmM
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
    <div class="moz-cite-prefix">On 12/9/24 4:57 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:34fbc3bf-f740-47bd-90e4-2f8b9ce46cfd@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.12.2024 16:56, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 27.11.2024 13:50, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Relocate FDT to Xen heap instead of using early mapping as it is
expected that discard_initial_modules() ( is supposed to call in
the future ) discards the FDT boot module and remove_early_mappings()
destroys the early mapping.

Unflatten a device tree, creating the tree of struct device_node.
It also fills the "name" and "type" pointers of the nodes so the normal
device-tree walking functions can be used.

Set device_tree_flattened to NULL in the case when acpi_disabled is
equal to false.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

Albeit ...

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">@@ -71,6 +72,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
     const char *cmdline;
+    size_t fdt_size;
 
     remove_identity_mapping();
 
@@ -95,7 +97,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                           _end - _start, false) )
         panic("Failed to add BOOTMOD_XEN\n");
 
-    if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
+    if ( !(fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr)) )
         BUG();
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
... perhaps better

    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
    BUG_ON(!fdt_size);

?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And then I notice that Arm has no such check at all. Better stay in sync?</pre>
    </blockquote>
    <pre>Agree, it is better to be in sync. I will drop the BUG_ON().

Thanks.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------mzpJtawHAmPIUL3RdtV0eFmM--

