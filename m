Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FCCAEE261
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029214.1402992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGQK-0002eA-ET; Mon, 30 Jun 2025 15:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029214.1402992; Mon, 30 Jun 2025 15:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGQK-0002be-AE; Mon, 30 Jun 2025 15:28:00 +0000
Received: by outflank-mailman (input) for mailman id 1029214;
 Mon, 30 Jun 2025 15:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irzh=ZN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWGQJ-0002Ce-1a
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:27:59 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb571bd-55c6-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 17:27:57 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8b2so776545466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:27:57 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35363b025sm687751166b.27.2025.06.30.08.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:27:56 -0700 (PDT)
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
X-Inumbo-ID: ccb571bd-55c6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751297277; x=1751902077; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpTggWq72lTg/K9oDiJVOavzt+z0po3flW4vNvE7io8=;
        b=hmCJDYWsdpY/z8Z85pkxA3kYlimUgkCJLh5L9K821ekAbKptNHZz50tu8TBt1DPJOa
         QGkCFQuNdCoVd+cGglf/4Q6XSy9/MHHdw6ACtsn3JOShGUkZnl3Bu9T3ipVDghHZOA5t
         DasePvKiZKFRSPVzopas4yOwfnGfCmWbFolyo3Ge21d1bUXvvVYkiiNiUpR0aziRzvvv
         3ov5DirAzSfpcCDrJEIxnP0s8FJjRumWec8Hnx9w0QWmyPYUc1PfZkyp4fukssSs7Stn
         VFXLiVHECb3Agu0yrUfdjLsvo6xv1/E2PUdIyVZkWR2WwkTYlS2XPQdedL0PL1o3k9zM
         9jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297277; x=1751902077;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mpTggWq72lTg/K9oDiJVOavzt+z0po3flW4vNvE7io8=;
        b=n+PaTscafwFVmUhl6aski2LT3WPILqduz6YnmCXjBhxAPj23nrQ6RkKDhnAdZeW1ui
         rQOZlZsELuuium4UL7cr+QH+YHmtzy//Czi3tv4UxXJ3jopVCuATXSz3KJy9RnKKZLok
         4Mi5W0vXtHh3c2ipxtmEp84C06AWKAMvt4ur82zWuxLFzmhdijfvDRWmsgDt+wBV9o9D
         3bXSPX6L2I/mhc6xBrdYEDUHy5ngV8jmCc2qC04ACpmvabXDjeWumfnbbGTYEBkDR43l
         daL+9CpMP7C/8uGAi+HGGCj3Qvm/R1nwetFjGA/vz34BfNmBhxuOssEABaRIp8VryXJR
         KNIw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWPSkAROaJfF+PfsJit029A0F9OA2VK3T7ulYcvDddDMSgJQZB5zJNMRlhwWVzFld29d/dwyANC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnGsDsRR4JAxgbBwO4It11hMBp6LfeFtu5ui1A4BXa0AsQIonw
	9wtcwKg/tRZtUK4ZvJYwNGq0hBLaXddCVjWQZqZkFIIKgJG6U2JN4+XM
X-Gm-Gg: ASbGncvFGLDogXvKcz5EtqjvdX4L1tmapKJdYma3Dfv+dGjv2EEV529oRoJ9exq/5na
	oXwSBwKhQJAPxbOZgXGQkSKoDEzU9GCL9DBbN6+KUDib8EcvqBdbmW7T49AJAb4GWJKjtAYrSg+
	PeiZkhjD8aFb0slyWoQWxFQAragdij5l9OgM9kb352NWkV0Oif5wP3kEN9yw2O0yp7Hz6vbNjIh
	Cvbj7N7G6g97ygRTwNjJmictY2fnJ3sXSjwStAd4NfP1b87sFA4CXrqtjzm0FNFPxx6T0uzncAJ
	ABxFlQ+o0L79JFQe6y378hkK2MAQF0I+w4PdhlAQPXGV/CwjYG+i9ypTI/v+uFwp1ngyrKrJJSq
	Ig/sRjGUIYjQbXaWZLVQPyL8KBDMoD55AgbA=
X-Google-Smtp-Source: AGHT+IHIKkNB+6yNZ8CuMhzFveSqZctw068YytflysZ0wtsYzQ4XAyTlOF0aP0grlcI+XBq819LxeA==
X-Received: by 2002:a17:907:3c8f:b0:ad5:55db:e413 with SMTP id a640c23a62f3a-ae34fdded62mr1260171166b.26.1751297276554;
        Mon, 30 Jun 2025 08:27:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Yp3guJ52GRuZDVPNSwm5N7pD"
Message-ID: <f5fc8d66-cb90-4064-a215-8a2ea3705272@gmail.com>
Date: Mon, 30 Jun 2025 17:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
 <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
 <6fafc0b4-cfea-4d67-bef6-4e40d1d3e743@gmail.com>
 <f373045d-4479-4c55-b6cd-3c955e456428@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f373045d-4479-4c55-b6cd-3c955e456428@suse.com>

This is a multi-part message in MIME format.
--------------Yp3guJ52GRuZDVPNSwm5N7pD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 4:45 PM, Jan Beulich wrote:
> On 30.06.2025 16:38, Oleksii Kurochko wrote:
>> On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
>>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>>    typedef enum {
>>>>>        p2m_invalid = 0,    /* Nothing mapped here */
>>>>>        p2m_ram_rw,         /* Normal read/write domain RAM */
>>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>>> As indicated before - this type should be added when the special handling that
>>>> it requires is also introduced.
>>> Perhaps, I missed that. I will drop this type for now.
>>>
>>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>>> What's the _dev suffix indicating here?
>>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>>
>>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
>> I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())
> That'll want abstracting out, I think. I don't view it as helpful to clutter
> RISC-V (and later perhaps also PPC) with Arm-specific terminology.

Would it be better then just rename it to p2m_device? Then it won't clear for Arm which type of MMIO p2m's
types is used as Arm has there MMIO types: *_dev, *_nc, *_c.

As an option (which I don't really like) it could be "#define p2m_mmio_direct_dev ARCH_specific_name" in
asm/p2m.h to not touch common code.

~ Oleksii

--------------Yp3guJ52GRuZDVPNSwm5N7pD
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
    <div class="moz-cite-prefix">On 6/30/25 4:45 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f373045d-4479-4c55-b6cd-3c955e456428@suse.com">
      <pre wrap="" class="moz-quote-pre">On 30.06.2025 16:38, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 6/26/25 4:59 PM, Jan Beulich wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -61,8 +61,28 @@ struct p2m_domain {
  typedef enum {
      p2m_invalid = 0,    /* Nothing mapped here */
      p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">As indicated before - this type should be added when the special handling that
it requires is also introduced.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Perhaps, I missed that. I will drop this type for now.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">What's the _dev suffix indicating here?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
|using PTE_PBMT_IO for |p2m_mmio_direct_dev.

Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That'll want abstracting out, I think. I don't view it as helpful to clutter
RISC-V (and later perhaps also PPC) with Arm-specific terminology.</pre>
    </blockquote>
    <pre>Would it be better then just rename it to p2m_device? Then it won't clear for Arm which type of MMIO p2m's
types is used as Arm has there MMIO types: *_dev, *_nc, *_c.

As an option (which I don't really like) it could be "#define p2m_mmio_direct_dev ARCH_specific_name" in
asm/p2m.h to not touch common code.

~ Oleksii
</pre>
  </body>
</html>

--------------Yp3guJ52GRuZDVPNSwm5N7pD--

