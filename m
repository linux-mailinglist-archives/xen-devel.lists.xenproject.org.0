Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4AAA9174
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 12:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975996.1363263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBtVQ-0003pw-N9; Mon, 05 May 2025 10:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975996.1363263; Mon, 05 May 2025 10:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBtVQ-0003nw-KZ; Mon, 05 May 2025 10:57:04 +0000
Received: by outflank-mailman (input) for mailman id 975996;
 Mon, 05 May 2025 10:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBtVP-0003nn-4u
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 10:57:03 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abff4318-299f-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 12:57:01 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac34257295dso8677266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 03:57:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b9asm5487857a12.25.2025.05.05.03.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:57:00 -0700 (PDT)
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
X-Inumbo-ID: abff4318-299f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746442620; x=1747047420; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44wKNcao3Ypys3ZarhO/S69YBr4OASt4mbEgTrWUUZw=;
        b=jP1kkVtc8t1E69KIfiTH9Qf8xZFv7x1Mkh2Sc3O79REFS2NDD6H6V4wQG/1eV9AZ/u
         WupgAxqu0JXjFTLT2B9H5BkrTfiulybk4dUXnpPxKciUlKXHvEvsmBPasA60ZvaGRfQi
         1O+VZUgb5mW1hNCYcyjtyJBGZL5f0ajyhvRu1FiPDrOuFtq6ZuhMJQ1/T5OTpdTxm75+
         p1emkI4dkIq8EGAXzKNenL3geTDbt8lSCcKmZLGMdmx6MpUKGxCnznWSwEdkOHsJwlT2
         yrH1LWNXlSkx7VIjBApHobduS1CJbBAwQY0KOuueoMS5cessEaO6DGctqYLoP/Q4isRo
         iPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746442620; x=1747047420;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44wKNcao3Ypys3ZarhO/S69YBr4OASt4mbEgTrWUUZw=;
        b=cW2b1xOIL/liENiNiIDHMNeUM91qQf1WFc04YJWDVvF/tj9WFW9ZlLri2hDpB1H9sd
         x5MO+zI0jBSkzZrK4heWqsVFWKXhkAZ9GO+DFNIQUNiv0aN8VesaowFreMk2a1V/Q35R
         QlqKRX5HVLqtSsDNlwbGSsavKTfupl+ZL84zFuY+ZlNRgx6BRhoLSloVDE8CQlpdVy6R
         zjgQ2zGso9sP2/+0uAqg0UqqowPCrEM6O3iwdn9b6PZ1CsM+22nyooG/fjfXKQrvEfOP
         uHG1Sk8mPnI55RrrycJ+sgp7BKbSXyCx7yIDQ3WGrasOT893t/OsCvDvHE6YO691gmKh
         +m9g==
X-Gm-Message-State: AOJu0Yw6X+9meF0nL+LP0GcCQa8XNcHCDcoqOq3hFhcJamDUpiUzxP0G
	uJ6Gu3Lf0IJS7FjFZ1/ayMMAJ4awWw1Tzskfcf5gcOOExrIurr9M
X-Gm-Gg: ASbGncuovDxNuKktJwF0gR6qWNtNCKkw97MttADmB6BYzOBNJk90gnqXUWqXZZRVKLN
	54MKzfxfnkGl2oSSlfQe5Af2ZBmgUDhRQ9a9oKmLTFuKrj2m33rEwyTjBW/KxQ1DBqn0C7OQb6a
	TfM9bqWS67hijJv40GFMPqCTHguvuZOrtKj2pHEWTGqGoBONnjbkz38LEcIMmwy5BHUcCEaNMx5
	kTSRXWTCvK+DKYQC8DOLT1ZlJoHioFJFqWVJPGovkqgTxWSfqNwLu5IZWH38cPVedx76wbuRVe3
	5UfcrKSuRUq6o/Q+0QPtY1kuXdVYpG/DN8X2lApvoGhehmk8r+q1za9nRt9siyzpZryEsLU1nW0
	o8q+Q+z8jFOM8hS2THKu+eiba+2A=
X-Google-Smtp-Source: AGHT+IFMaWwl3t1KRsSN2WvQhlK7qWjnVwIns+uNkn78gur7+P8lWCJ09yxfRRmZVdvZzXb0y+UiQA==
X-Received: by 2002:a17:907:968e:b0:acb:b9db:aa22 with SMTP id a640c23a62f3a-ad1a45c168emr590909566b.0.1746442620256;
        Mon, 05 May 2025 03:57:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------20PM6hHM9mfnG0yY7fo6thf7"
Message-ID: <1d63c212-e6fb-4907-845d-296fb98fcc08@gmail.com>
Date: Mon, 5 May 2025 12:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/common: dom0less: introduce common
 dom0less-build.c
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <76390ef52f108b580e1c397ed178ceadf1ae53c4.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop>
 <5523bf0d-a94e-444d-a1fa-035ecccb4448@gmail.com>
Content-Language: en-US
In-Reply-To: <5523bf0d-a94e-444d-a1fa-035ecccb4448@gmail.com>

This is a multi-part message in MIME format.
--------------20PM6hHM9mfnG0yY7fo6thf7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/5/25 12:46 PM, Oleksii Kurochko wrote:
>
>
> On 5/2/25 10:53 PM, Stefano Stabellini wrote:
>> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>>> Part of Arm's dom0less-build.c could be common between architectures which are
>>> using device tree files to create guest domains. Thereby move some parts of
>>> Arm's dom0less-build.c to common code with minor changes.
>>>
>>> As a part of theses changes the following changes are introduced:
>>> - Introduce make_arch_nodes() to cover arch-specific nodes. For example, in
>>>    case of Arm, it is PSCI and vpl011 nodes.
>>> - Introduce set_domain_type() to abstract a way how setting of domain type
>>>    happens. For example, RISC-V won't have this member of arch_domain structure
>>>    as vCPUs will always have the same bitness as hypervisor. In case of Arm, it
>>>    is possible that Arm64 could create 32-bit and 64-bit domains.
>>> - Introduce init_vuart() to cover details of virtual uart initialization.
>>> - Introduce init_intc_phandle() to cover some details of interrupt controller
>>>    phandle initialization. As an example, RISC-V could have different name for
>>>    interrupt controller node ( APLIC, PLIC, IMSIC, etc ) but the code in
>>>    domain_handle_dtb_bootmodule() could handle only one interrupt controller
>>>    node name.
>>> - s/make_gic_domU_node/make_intc_domU_node as GIC is Arm specific naming and
>>>    add prototype of make_intc_domU_node() to dom0less-build.h
>>>
>>> The following functions are moved to xen/common/device-tree:
>>> - Functions which are moved as is:
>>>    - domain_p2m_pages().
>>>    - handle_passthrough_prop().
>>>    - handle_prop_pfdt().
>>>    - scan_pfdt_node().
>>>    - check_partial_fdt().
>>> - Functions which are moved with some minor changes:
>>>    - alloc_xenstore_evtchn():
>>>      - ifdef-ing by CONFIG_HVM accesses to hvm.params.
>>>    - prepare_dtb_domU():
>>>      - ifdef-ing access to gnttab_{start,size} by CONFIG_GRANT_TABLE.
>>>      - s/make_gic_domU_node/make_intc_domU_node.
>>>      - Add call of make_arch_nodes().
>>> - domain_handle_dtb_bootmodule():
>>>    - hide details of interrupt controller phandle initialization by calling
>>>      init_intc_phandle().
>>>    - Update the comment above init_intc_phandle(): s/gic/interrupt controller.
>>> - construct_domU():
>>>    - ifdef-ing by CONFIG_HVM accesses to hvm.params.
>>>    - Call init_vuart() to hide Arm's vpl011_init() details there.
>>>    - Add call of set_domain_type() instead of setting kinfo->arch.type explicitly.
>>>
>>> Some parts of dom0less-build.c are wraped by #ifdef CONFIG_STATIC_{SHMEM,MEMORY}
>>> as not all archs support these configs.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> FYI for a possible follow-up patch (doesn't have to be done in this
>> patch), the following functions could now be static:
>>
>> alloc_dom0_vcpu0
>> dom0_max_vcpus
> I will make them static in follow-up patch in the next patch series version.

Oh, I just noticed that we can't make them static as there is none static declaration in
xen/domain.h

~ Oleksii

--------------20PM6hHM9mfnG0yY7fo6thf7
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
    <div class="moz-cite-prefix">On 5/5/25 12:46 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5523bf0d-a94e-444d-a1fa-035ecccb4448@gmail.com">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 5/2/25 10:53 PM, Stefano
        Stabellini wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
        <pre wrap="" class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Part of Arm's dom0less-build.c could be common between architectures which are
using device tree files to create guest domains. Thereby move some parts of
Arm's dom0less-build.c to common code with minor changes.

As a part of theses changes the following changes are introduced:
- Introduce make_arch_nodes() to cover arch-specific nodes. For example, in
  case of Arm, it is PSCI and vpl011 nodes.
- Introduce set_domain_type() to abstract a way how setting of domain type
  happens. For example, RISC-V won't have this member of arch_domain structure
  as vCPUs will always have the same bitness as hypervisor. In case of Arm, it
  is possible that Arm64 could create 32-bit and 64-bit domains.
- Introduce init_vuart() to cover details of virtual uart initialization.
- Introduce init_intc_phandle() to cover some details of interrupt controller
  phandle initialization. As an example, RISC-V could have different name for
  interrupt controller node ( APLIC, PLIC, IMSIC, etc ) but the code in
  domain_handle_dtb_bootmodule() could handle only one interrupt controller
  node name.
- s/make_gic_domU_node/make_intc_domU_node as GIC is Arm specific naming and
  add prototype of make_intc_domU_node() to dom0less-build.h

The following functions are moved to xen/common/device-tree:
- Functions which are moved as is:
  - domain_p2m_pages().
  - handle_passthrough_prop().
  - handle_prop_pfdt().
  - scan_pfdt_node().
  - check_partial_fdt().
- Functions which are moved with some minor changes:
  - alloc_xenstore_evtchn():
    - ifdef-ing by CONFIG_HVM accesses to hvm.params.
  - prepare_dtb_domU():
    - ifdef-ing access to gnttab_{start,size} by CONFIG_GRANT_TABLE.
    - s/make_gic_domU_node/make_intc_domU_node.
    - Add call of make_arch_nodes().
- domain_handle_dtb_bootmodule():
  - hide details of interrupt controller phandle initialization by calling
    init_intc_phandle().
  - Update the comment above init_intc_phandle(): s/gic/interrupt controller.
- construct_domU():
  - ifdef-ing by CONFIG_HVM accesses to hvm.params.
  - Call init_vuart() to hide Arm's vpl011_init() details there.
  - Add call of set_domain_type() instead of setting kinfo-&gt;arch.type explicitly.

Some parts of dom0less-build.c are wraped by #ifdef CONFIG_STATIC_{SHMEM,MEMORY}
as not all archs support these configs.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
          href="mailto:oleksii.kurochko@gmail.com"
          moz-do-not-send="true">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">FYI for a possible follow-up patch (doesn't have to be done in this
patch), the following functions could now be static:

alloc_dom0_vcpu0
dom0_max_vcpus</pre>
      </blockquote>
      <pre>I will make them static in follow-up patch in the next patch series version.</pre>
    </blockquote>
    <pre>Oh, I just noticed that we can't make them static as there is none static declaration in
xen/domain.h

~ Oleksii
</pre>
  </body>
</html>

--------------20PM6hHM9mfnG0yY7fo6thf7--

