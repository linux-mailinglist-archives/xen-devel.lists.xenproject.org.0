Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18FA2A906
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 14:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882840.1292932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg1ZY-0001Lm-Lh; Thu, 06 Feb 2025 13:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882840.1292932; Thu, 06 Feb 2025 13:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg1ZY-0001JT-I8; Thu, 06 Feb 2025 13:05:36 +0000
Received: by outflank-mailman (input) for mailman id 882840;
 Thu, 06 Feb 2025 13:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czS3=U5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tg1ZX-0001JN-EX
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 13:05:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c9434fc-e48b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 14:05:33 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5dcf0de81ebso1349890a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 05:05:33 -0800 (PST)
Received: from [192.168.201.60] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7733374a8sm96386566b.138.2025.02.06.05.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 05:05:32 -0800 (PST)
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
X-Inumbo-ID: 0c9434fc-e48b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738847133; x=1739451933; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knnidq31usveyTLXg8KTwl4Klwq7LjeLU6W9eVPr8Zw=;
        b=Jk7LALhe9xYyS1tzmDS0aOP6f6qangg5MbS/hGciUV1SyAtj7qpCDVAJRXSGvfJX9K
         /scIZCYqtKQWi0PFnUjEkFpNMcwih+9O139twHhThuGXgGwfRzezDwbAiDRKdKLvD5n9
         N+G4d2TSztAL6dEKz92fMsyCdLi/egAVABlcR3Lqi9vSbQYr8pYuBDxB2U99IzeGgciV
         YeFygQJceoGxVscaooN3zyc3g3JaHmtJsFJSwDk5FsUkUTHSwvQ59Z79Yge2APY8wn8k
         oOFrz1M663X4m96pR5uStuFxeR0imG/s6ad+O/bGNLUnTYDz4SJszV6fKZSsid6Pq0Wc
         8jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847133; x=1739451933;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knnidq31usveyTLXg8KTwl4Klwq7LjeLU6W9eVPr8Zw=;
        b=H3WESIb5wLlpSGTau5UqbVbwfx/cdjD5d34oRZAD2AMuhaC2h1DQo66bK3t6rkJ1gJ
         rjWUBeqB+eVcCmMNmKdxfq+bD7xRsoQvQkQnI/FJG9PNZZ7J3p08oCrDgKkzlyARLUXg
         HmWNNwhcZU/h9WxRBJGDTfs9OCLo/AW2ix8UdvZL4Zp73b+ejHvIb0CvNOaHdOIzJOdQ
         YqE3Qtjkv6oH8rEt/S2wF3OwrGZr8Qs2oCXXRTKAWw9D4XuBnV1cK0IeJXugGKew5Gqt
         vVASK68L19SrcGxBKia++3/DIvHI40FRn/wxrgPLaQca3ZgcEM3jodFPtgw3G+YEkXds
         afKQ==
X-Gm-Message-State: AOJu0YwIUamkxSbFnjBCvA+v0WBbv0/2f+4/D+mB4aL/TLYahsVH0Y3a
	ALVjvCZ1yrx/RSChRKPO6Bwnfzos2fQu9rOQe46fcx0HHY64kx2y
X-Gm-Gg: ASbGnctQ8es2KPtKS5Zw3HJ8xFJUstE8U+8qByMrdg1CI3nC3DyeEws41l+KP5dIy0x
	VIGtXmRTiICNtjeuHhxugZcKVFRcy+OLdLkwbtdqRp1aLRk6p3d3PJqGs0R1KkeDsHAss5Zqosi
	KFXb2Xbwj5NmFLCXPhxom1l1CSrHOw7HbL5CUzH6Y/XV2p3e1L+Knl/ka50413RadM1hA4PrryN
	lsa/Okfl7sEjrtEtbbYxXYPRlN3hbP6Qy6nnqVUvNkIffLdVazo2tbJS6kMJGQxuZr89NM/C4Nh
	UnhP17DyX1dSqFHFoVnTPHK3ydQ=
X-Google-Smtp-Source: AGHT+IGWO7aR/Hq6UvwOo6HBFOwxazVsb/p32AdlmoWiqahFkVav3Cv9FeL2uCvqWzNYt9Db4ef63g==
X-Received: by 2002:a17:907:6d1e:b0:ab2:f8e9:723c with SMTP id a640c23a62f3a-ab75e210266mr728187466b.5.1738847132634;
        Thu, 06 Feb 2025 05:05:32 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------xndRTWnJQTkzpmzgawRjBRUW"
Message-ID: <585eff97-af33-4bfd-be10-fdacbb9b9069@gmail.com>
Date: Thu, 6 Feb 2025 14:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: identify specific ISA supported by cpu
To: Conor Dooley <conor@kernel.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
 <20250205-chariot-blandness-7e9a791f7f34@spud>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250205-chariot-blandness-7e9a791f7f34@spud>

This is a multi-part message in MIME format.
--------------xndRTWnJQTkzpmzgawRjBRUW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 8:07 PM, Conor Dooley wrote:
> Yo,
>
> On Thu, Jan 23, 2025 at 03:46:36PM +0100, Oleksii Kurochko wrote:
>> Supported ISA extensions are specified in the device tree within the CPU
>> node, using two properties: `riscv,isa-extensions` and `riscv,isa`.
>>
>> Currently, Xen does not support the `riscv,isa-extensions` property, as
>> all available device tree source (DTS) files in the Linux kernel (v6.12-rc3)
>> and DTBs generated by QEMU use only the `riscv,isa` property.
> That's not true? The riscv,isa-extensions property went into linux in
> late 2023 (6.7 or so) and QEMU in v9.0.0 about a year ago, so all source
> files in linux and blobs generated by QEMU should have both. OpenSBI &
> U-Boot support both also. Might not affect your decision about what to
> support here - but the rationale provided for implementing the deprecated
> (per the binding at least) property isn't accurate.

I confused something with Linux kernel sources. Double-check and riscv,isa-extensions
is really supported.

Regarding QEMU, at the momemnt, Xen uses Debian bookworm and the following version
is used:
   QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)

I will update the commit message.

Do you ( Conor and Jan ) think that it makes sense to support deprecated property?
Or it would be better start to use QEMU v9.0.0 and just drop support for deprecated property?

>
>> Therefore, only `riscv,isa` parsing is implemented.
>>
>> The `riscv,isa` property is parsed for each CPU, and the common extensions
>> are stored in the `host_riscv_isa` bitmap.
>> This bitmap is then used by `riscv_isa_extension_available()` to check
>> if a specific extension is supported.
>>
>> The current implementation is based on Linux kernel v6.12-rc3
>> implementation with the following changes:
>>   - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
>>     RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
>>     are now part of the riscv,isa string.
> Hmm, not sure I follow your logic here. Linux unconditionally sets these
> extensions because the binding was written when these these were part of
> the base instruction set*. That they can be put into the "riscv,isa"
> string is actually the reason that the code setting them unconditionally
> in linux exists! Linux cannot tell the difference between an "old" dtb
> containing "rv64ima" meaning that Zicsr is present & a "new" one containing
> "rv64ima" meaning that it is not! For backwards compatibility reasons,
> linux is then forced to set its internal flags for Zicsr et al when it sees
> "i" in riscv,isa. If you were to use the "new" definition of "i", and use
> that to construct a dtb to pass to a linux guest, things would blow up.

My fault was that I didn't consider that someone will use "old" dtb and it was the reason
why "the binding was written when these these were part of the base instruction set*" was
interpreted as it isn't so any more and the mentioned extension should be explicitly
mentioned in riscv,isa.

>
> This is the whole reason that riscv,isa is marked deprecated in the binding
> and replaced by riscv,isa-extensions - there are no concrete definitions
> for what extensions mean using "riscv,isa".
>
> I suppose you're free to decide to interpret the property in Xen
> differently to linux - particularly because the hypervisor extension
> requirement means that you're only going to run on hardware produced after
> the aforementioned extensions were split out of "i" - but if you are
> doing that, the rationale for a differing interpretation should be correct
> IMO.

Agree, I will update the commit message with the wording to:
   Drop unconditional setting of {...} because the hypervisor is going to run on
   hardware produced after the aforementioned extensions were split out of "i".

>
> Perhaps the wording of my comment in linux was not "strong" enough, and
> the "can be set" should be changed to "must be set"?

It would be better.

> 		/*
> 		 * These ones were as they were part of the base ISA when the
> 		 * port & dt-bindings were upstreamed, and so can be set
> 		 * unconditionally where `i` is in riscv,isa on DT systems.
> 		 */
> 		if (acpi_disabled) {
> 			set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
> 			set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
> 			set_bit(RISCV_ISA_EXT_ZICNTR, source_isa);
> 			set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
> 		}
>
>
>
> * IIRC only 2 of them were part of i, the other two were assumed to be present
>    by Linux etc and only became independent extensions later on.
>
>>   - Remove saving of the ISA for each CPU, only the common available ISA is
>>     saved.
>>   - Remove ACPI-related code as ACPI is not supported by Xen.
>>   - Drop handling of elf_hwcap, since Xen does not provide hwcap to
>>     userspace.
>>   - Replace of_cpu_device_node_get() API, which is not available in Xen,
>>     with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
>>     and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
>>     riscv_fill_hwcap_from_isa_string().
>>   - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
>>     _id to ext_id for clarity.
>>   - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
>>   - Replace instances of __riscv_isa_extension_available with
>>     riscv_isa_extension_available for consistency. Also, update the type of
>>     `bit` argument of riscv_isa_extension_available().
>>   - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
>>     as other fields are not used in Xen currently.
>>   - Add check of first 4 letters of riscv,isa string to
>>     riscv_isa_parse_string() as Xen doesn't do this check before so it is
>>     necessary to check correctness of riscv,isa string. ( it should start with
>>     rv{32,64} with taking into account upper and lower case of "rv").
>>   - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
>>     as it isn't used, at the moment.
>>   - Update the comment message about QEMU workaround.
> Does Xen (for riscv) even work with QEMU 7.1?

I haven't checked that. As mentioned above Xen's GitLab CI is using 7.2.11.

Thanks.

~ Oleksii

--------------xndRTWnJQTkzpmzgawRjBRUW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/5/25 8:07 PM, Conor Dooley wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250205-chariot-blandness-7e9a791f7f34@spud">
      <pre wrap="" class="moz-quote-pre">Yo,

On Thu, Jan 23, 2025 at 03:46:36PM +0100, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Supported ISA extensions are specified in the device tree within the CPU
node, using two properties: `riscv,isa-extensions` and `riscv,isa`.

Currently, Xen does not support the `riscv,isa-extensions` property, as
all available device tree source (DTS) files in the Linux kernel (v6.12-rc3)
and DTBs generated by QEMU use only the `riscv,isa` property.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's not true? The riscv,isa-extensions property went into linux in
late 2023 (6.7 or so) and QEMU in v9.0.0 about a year ago, so all source
files in linux and blobs generated by QEMU should have both. OpenSBI &amp;
U-Boot support both also. Might not affect your decision about what to
support here - but the rationale provided for implementing the deprecated
(per the binding at least) property isn't accurate.</pre>
    </blockquote>
    <pre>I confused something with Linux kernel sources. Double-check and riscv,isa-extensions
is really supported.

Regarding QEMU, at the momemnt, Xen uses Debian bookworm and the following version
is used:
  QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)

I will update the commit message.

Do you ( Conor and Jan ) think that it makes sense to support deprecated property?
Or it would be better start to use QEMU v9.0.0 and just drop support for deprecated property?

</pre>
    <blockquote type="cite"
      cite="mid:20250205-chariot-blandness-7e9a791f7f34@spud">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Therefore, only `riscv,isa` parsing is implemented.

The `riscv,isa` property is parsed for each CPU, and the common extensions
are stored in the `host_riscv_isa` bitmap.
This bitmap is then used by `riscv_isa_extension_available()` to check
if a specific extension is supported.

The current implementation is based on Linux kernel v6.12-rc3
implementation with the following changes:
 - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
   are now part of the riscv,isa string.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, not sure I follow your logic here. Linux unconditionally sets these
extensions because the binding was written when these these were part of
the base instruction set*. That they can be put into the "riscv,isa"
string is actually the reason that the code setting them unconditionally
in linux exists! Linux cannot tell the difference between an "old" dtb
containing "rv64ima" meaning that Zicsr is present &amp; a "new" one containing
"rv64ima" meaning that it is not! For backwards compatibility reasons,
linux is then forced to set its internal flags for Zicsr et al when it sees
"i" in riscv,isa. If you were to use the "new" definition of "i", and use
that to construct a dtb to pass to a linux guest, things would blow up.</pre>
    </blockquote>
    <pre>My fault was that I didn't consider that someone will use "old" dtb and it was the reason
why "the binding was written when these these were part of the base instruction set*" was
interpreted as it isn't so any more and the mentioned extension should be explicitly
mentioned in riscv,isa.
</pre>
    <blockquote type="cite"
      cite="mid:20250205-chariot-blandness-7e9a791f7f34@spud">
      <pre wrap="" class="moz-quote-pre">

This is the whole reason that riscv,isa is marked deprecated in the binding
and replaced by riscv,isa-extensions - there are no concrete definitions
for what extensions mean using "riscv,isa".

I suppose you're free to decide to interpret the property in Xen
differently to linux - particularly because the hypervisor extension
requirement means that you're only going to run on hardware produced after
the aforementioned extensions were split out of "i" - but if you are
doing that, the rationale for a differing interpretation should be correct
IMO.</pre>
    </blockquote>
    <pre>Agree, I will update the commit message with the wording to:
  Drop unconditional setting of {...} because the hypervisor is going to run on
  hardware produced after the aforementioned extensions were split out of "i".

</pre>
    <blockquote type="cite"
      cite="mid:20250205-chariot-blandness-7e9a791f7f34@spud">
      <pre wrap="" class="moz-quote-pre">

Perhaps the wording of my comment in linux was not "strong" enough, and
the "can be set" should be changed to "must be set"?</pre>
    </blockquote>
    <pre>It would be better.

</pre>
    <blockquote type="cite"
      cite="mid:20250205-chariot-blandness-7e9a791f7f34@spud">
      <pre wrap="" class="moz-quote-pre">
		/*
		 * These ones were as they were part of the base ISA when the
		 * port &amp; dt-bindings were upstreamed, and so can be set
		 * unconditionally where `i` is in riscv,isa on DT systems.
		 */
		if (acpi_disabled) {
			set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
			set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
			set_bit(RISCV_ISA_EXT_ZICNTR, source_isa);
			set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
		}



* IIRC only 2 of them were part of i, the other two were assumed to be present
  by Linux etc and only became independent extensions later on.

</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:20250205-chariot-blandness-7e9a791f7f34@spud">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> - Remove saving of the ISA for each CPU, only the common available ISA is
   saved.
 - Remove ACPI-related code as ACPI is not supported by Xen.
 - Drop handling of elf_hwcap, since Xen does not provide hwcap to
   userspace.
 - Replace of_cpu_device_node_get() API, which is not available in Xen,
   with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
   and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
   riscv_fill_hwcap_from_isa_string().
 - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
   _id to ext_id for clarity.
 - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
 - Replace instances of __riscv_isa_extension_available with
   riscv_isa_extension_available for consistency. Also, update the type of
   `bit` argument of riscv_isa_extension_available().
 - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
   as other fields are not used in Xen currently.
 - Add check of first 4 letters of riscv,isa string to
   riscv_isa_parse_string() as Xen doesn't do this check before so it is
   necessary to check correctness of riscv,isa string. ( it should start with
   rv{32,64} with taking into account upper and lower case of "rv").
 - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
   as it isn't used, at the moment.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> - Update the comment message about QEMU workaround.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does Xen (for riscv) even work with QEMU 7.1?</pre>
    </blockquote>
    <pre>I haven't checked that. As mentioned above Xen's GitLab CI is using 7.2.11.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------xndRTWnJQTkzpmzgawRjBRUW--

