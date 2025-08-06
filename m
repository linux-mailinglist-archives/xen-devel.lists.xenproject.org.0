Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A1B1C188
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 09:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071280.1434780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujYqU-00027p-Ff; Wed, 06 Aug 2025 07:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071280.1434780; Wed, 06 Aug 2025 07:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujYqU-00025x-Cr; Wed, 06 Aug 2025 07:45:58 +0000
Received: by outflank-mailman (input) for mailman id 1071280;
 Wed, 06 Aug 2025 07:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQb=2S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujYqT-00025r-1v
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 07:45:57 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6208248e-7299-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 09:45:55 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso737308766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 00:45:55 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3981sm1046712466b.35.2025.08.06.00.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 00:45:53 -0700 (PDT)
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
X-Inumbo-ID: 6208248e-7299-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754466354; x=1755071154; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkHSSZV53yUU7XV1RCmxtb14r7xNOaRRwrns5+4qxJE=;
        b=bGSSG5orzNPRtyEdw2hso6t+wXcH0tRZS2NS+YO6kJrnA3BQTFej+h+mN6WZ9juEjI
         bsgkLEWTWdkE89W/I0KEpV9cxo6tdFtztZPCY7k7Rw5lQHHzl3Grmsuhg1HrKGSwxoY2
         PiDfEoAOH3l5ZmKfYK0JdlhYwfFIG9iBti8/ZtUx+3KFDeBIlpje/tqFJ6iBu29b9hCC
         qLWFmAtCfoy7vU9k5lv2YdbzdKjvxR06RPOPOtkdQaRoPioSZjpBcJWNg5ncCDtBPg58
         xTei2DHfZ/9bxsj6YoX9uBND8OMqkaOdR9Ql6LsWVvI1ci6r8D83dGfPDd9uNXDMn0H3
         ZQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754466354; x=1755071154;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkHSSZV53yUU7XV1RCmxtb14r7xNOaRRwrns5+4qxJE=;
        b=TEkXTuLoxZxstqh91jagceHjv+CjSmcrrB+81C7KVLv3C2gm14DCK9cHEkBtdvrx4A
         AWe2hKSMdRS2gBSO6vCMAkd1gc5d/13N5+zRO14Sx7t3xoBAJ2ep42lMFLY4E/yP+EM3
         EEytic4Jfi7RejsK0cStoKf7jxNrcAjUPTPkv/YX7SLdFzafsjWhc4hPkY64bNrx7oy2
         LLxu2a/dh1B+6B9/9BRf/PCqMgHfbT9yTd2fPyghsh2eMGfW52r8CsuualAgutA2x6cq
         d+4ng8A6e9sKQ94aYu4I0/itPEu8l6Eo08mq5ZHkpdwWnIEHff9cYaOEVMninDcdiT8d
         9D7g==
X-Forwarded-Encrypted: i=1; AJvYcCUiLnWhW/Z2Ta+fLs7rgeIur/684TToUwlUc49uI8/dBGvyf3nvBm8h90C1hm+jqcUiyQKsLnJ8M84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbCTlBlIBnaVCoQ/SchOtG2H3uhUoM1i3NRQOi38AN3riiuJp9
	5TqDK8xyYAYlul7ce7GNtrJZX8l83OGDJp4jGl5HvHedRkcEKYqU6pcU
X-Gm-Gg: ASbGncslZpYk7wswAr2wlHNd2pF/UYiZq3tnEH/ivyASoIaZNN9cdfjvnRqY7iFcih5
	5q8kWl+9olmx3z6FAg3CpE36B+nPj+Q+FYkBHkBhQyIeIFQ0PW/WC+IfFKaDQShFUT+Hm9GdNBv
	gb7v9yZRer/yXPz3DIrdcuOM3GfVQhOvkGwY4trsqZF8DnshobfpCspPIOGlfbTrGQ4sFy1SVaZ
	XvnMlgogBLqWscGT8yY+OJ5QtCyy+9m5yjJL/XkicrhyXxyI1GvJhtqIzq6+t6RqZ7LB4s6Vnv8
	ScYOeU6rT+az4VJkLMZmSGhCvK/2RWP4YydRPoIkQjw1Rv8hJg96M5U8kXvIqvcSLANFRp3roOQ
	gJAeXjW+mjx1OZRccNx4eXjrMwkeVrni95Q4r78C3WLaSXGkB5Kri+UaJT2NPcZi6ediEf84=
X-Google-Smtp-Source: AGHT+IFjN0KcPER6GyGvZrQNm1VKGcTIzsxy13CjoDwnHuV7oxe8688D130iJzQgsichhaSLBYdfWA==
X-Received: by 2002:a17:907:980f:b0:aec:6600:dbe3 with SMTP id a640c23a62f3a-af992bc3acfmr124190266b.56.1754466353935;
        Wed, 06 Aug 2025 00:45:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kZF3O5gOHXMsO4gSSGZUUrHA"
Message-ID: <03a1d0b8-facd-4c02-97c6-45fa694da0b6@gmail.com>
Date: Wed, 6 Aug 2025 09:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 "Penny Zheng," <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
 <242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com>

This is a multi-part message in MIME format.
--------------kZF3O5gOHXMsO4gSSGZUUrHA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/25 8:05 AM, Jan Beulich wrote:
> On 05.08.2025 20:19, Oleksii Kurochko wrote:
>> * Full list of items : *
>>
>> = Projects =
>>
>> == Hypervisor ==
>>
>> * [4.21] xen/console: cleanup console input switch logic (v5)
>>     - Denis Mukhin
>>     -
>> https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com/
>>
>> * [4.21] xen: introduce CONFIG_SYSCTL (v4 -> v8)
>>     -  Penny Zheng
>>     -
>> https://lore.kernel.org/xen-devel/20250711043158.2566880-1-Penny.Zheng@amd.com/
>>
>> * [4.21] Several CI cleanups and improvements, plus yet another new runner
>>     - Marek Marczykowski-Górecki
>>     -
>> https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
>>     -
>> https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
>>
>> * [4.21] automation: Refresh the remaining Debian containers (v2)
>>     -  Javi Merino
>>     -
>> https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
>>
>> * [4.21] MSI-X support with qemu in stubdomain, and other related
>> changes (v8)
>>     -  Marek Marczykowski-Górecki
>>     -
>> https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/
>>     -  Only automation patch left to be reviewed/merged.
>>
>> * [next-rel(s)] Physical address hypercall ABI ("HVMv2")
>>     - Teddy Astie
>>     -
>> https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/
>>
>> * [next-rel(s)] xen: Untangle mm.h
>>     -  Andrew Cooper
>>     -
>> https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/
>>     -
>> https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.com/
>>
>> * [next-rel(s)] Add support for exact-node memory claims
>>     -  Alejandro Vallejo
>>     -
>> https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallejo@cloud.com/
>>     -
>> https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/
>>
>> * [next-rel(s)] Remove the directmap (v5)
>>     -  Alejandro Vallejo
>>     -
>> https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/
>>     -
>> https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.com/
>>
>> * [next-rel(s)] GRUB: Supporting Secure Boot of xen.gz (v1)
>>     -  Ross Lagerwall
>>     -
>> https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/
>>
>> * [next-rel(s)] Introduce xenbindgen to autogen hypercall structs (v1)
>>     -  Alejandro Vallejo
>>     -
>> https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/
>>
>> * [next-rel(s)] Introduce NS8250 UART emulator (v2)
>>     -  Denis Mukhin
>>     -
>> https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/
>>
>> * [next-rel(s)] xen: framework for UART emulators
>>     - Denis Mukhin
>>     -
>> https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/
>>
>> === x86 ===
>> * [4.21] x86/asm: cleanups after toolchain baseline upgrade (v1 -> v2)
>>     - Denis Mukhin
>>     -
>> https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.com/
>>     -https://patchew.org/Xen/20250403182250.3329498-1-dmukhin@ford.com/
>>
>> * [4.21?] x86/efi: Fix booting when NX is disabled (v1 -> v2)
>>     - Andrew Cooper
>>     -
>> https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/
>>     -
>> https://lore.kernel.org/xen-devel/20240722101838.3946983-1-andrew.cooper3@citrix.com/
>>
>> * [4.21?] Hyperlaunch device tree for dom0 (v6)
>>     - Alejandro Vallejo
>>     -https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/
>>     -
>> https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com/
>>
>> *  [4.21?] Boot modules for Hyperlaunch (v9)
>>     -  Daniel P. Smith
>>     -
>> https://lore.kernel.org/xen-devel/20241115131204.32135-1-dpsmith@apertussolutions.com/
>>     -
>> https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/
>>
>> *  [4.21?] Address Space Isolation FPU preparations (v2->v3)
>>     -  Alejandro Vallejo
>>     -
>> https://patchew.org/Xen/20250110132823.24348-1-alejandro.vallejo@cloud.com/
>>
>> * [next-rel(s)] Hyperlaunch domain builder
>>     - Daniel P. Smith
>>     -
>> https://lore.kernel.org/xen-devel/20250515131744.3843-1-dpsmith@apertussolutions.com/
>>
>> * [next-rel(s)] Confidential computing and AMD SEV support
>>     - Teddy Astie
>>     -https://patchew.org/Xen/cover.1747312394.git.teddy.astie@vates.tech/
>>     -
>> https://lore.kernel.org/xen-devel/cover.1747312394.git.teddy.astie@vates.tech/
>>
>> * [next-rel(s)] amd-cppc CPU Performance Scaling Driver (v5 -> v6)
>>     - Penny Zheng
>>     -
>> https://lore.kernel.org/xen-devel/20250711035106.2540522-1-Penny.Zheng@amd.com/
>>
>> * [next-rel(s)] x86: Trenchboot Secure Launch DRTM (Xen) (v1 -> v3)
>>     - Sergii Dmytruk
>>     -https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.com/
>>     -
>> https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3mdeb.com/
>>
>> * [next-rel(s)] x86/EFI: prevent write-execute sections
>>     - Roger Pau Monne<roger.pau@citrix.com>
>>     -
>> https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/
>>
>> * [next-rel(s)] x86: generate xen.efi image with no write-execute sections
>>     - Roger Pau Monne
>>     -
>> https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix.com/
>>
>> *  [next-rel(s)] Expose consistent topology to guests (v7)
>>     -  Alejandro Vallejo
>>     -
>> https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/
>>
>> *  [next-rel(s)] x86/alternatives: Adjust all insn-relative fields (v2)
>>     -  Andrew Cooper
>>     -
>> https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
>>
>> *  [next-rel(s)] x86emul: misc additions (v7)
>>     -  Jan Beulich
>>     -https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/
>>
>> *  [next-rel(s)] x86: support AVX10 (v3)
>>     -  Jan Beulich
>>     -
>> https://lore.kernel.org/xen-devel/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/
>>     -https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/
> While it is correct that AVX10 is now to go first, AMX was lost as an item, and
> APX (which I see no reason in posting as long as AVX10 doesn't make any progress)
> was agreed to go after AVX10, before AMX. (KeyLocker was also lost, but that
> happens to be correct, as with Intel abandoning the feature we apparently have no
> plans anymore to make an attempt at supporting it.)
>
> FRED (being worked on by Andrew) is also entirely missing.
>
> Overall: There are very many items on this list, and it seems entirely clear to
> me that not all of them will make it. I think it would be quite helpful to strip
> down the set for 4.21 to some realistic subset. Maybe something to discuss on
> the community call later today?

Good point, lets discuss that tomorrow during the community call.

~ Oleksii

--------------kZF3O5gOHXMsO4gSSGZUUrHA
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
    <div class="moz-cite-prefix">On 8/6/25 8:05 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 05.08.2025 20:19, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">* Full list of items : *

= Projects =

== Hypervisor ==

* [4.21] xen/console: cleanup console input switch logic (v5)
   - Denis Mukhin
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com/">https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com/</a>

* [4.21] xen: introduce CONFIG_SYSCTL (v4 -&gt; v8)
   -  Penny Zheng
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250711043158.2566880-1-Penny.Zheng@amd.com/">https://lore.kernel.org/xen-devel/20250711043158.2566880-1-Penny.Zheng@amd.com/</a>

* [4.21] Several CI cleanups and improvements, plus yet another new runner
   - Marek Marczykowski-Górecki
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/">https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/">https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/</a>

* [4.21] automation: Refresh the remaining Debian containers (v2)
   -  Javi Merino
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e">https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e</a>

* [4.21] MSI-X support with qemu in stubdomain, and other related 
changes (v8)
   -  Marek Marczykowski-Górecki
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/">https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/</a>
   -  Only automation patch left to be reviewed/merged.

* [next-rel(s)] Physical address hypercall ABI ("HVMv2")
   - Teddy Astie
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/">https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/</a>

* [next-rel(s)] xen: Untangle mm.h
   -  Andrew Cooper
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.com/">https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.com/</a>

* [next-rel(s)] Add support for exact-node memory claims
   -  Alejandro Vallejo
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallejo@cloud.com/">https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallejo@cloud.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/</a>

* [next-rel(s)] Remove the directmap (v5)
   -  Alejandro Vallejo
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/">https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.com/</a>

* [next-rel(s)] GRUB: Supporting Secure Boot of xen.gz (v1)
   -  Ross Lagerwall
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/">https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/</a>

* [next-rel(s)] Introduce xenbindgen to autogen hypercall structs (v1)
   -  Alejandro Vallejo
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/</a>

* [next-rel(s)] Introduce NS8250 UART emulator (v2)
   -  Denis Mukhin
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/">https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/</a>

* [next-rel(s)] xen: framework for UART emulators
   - Denis Mukhin
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/">https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/</a>

=== x86 ===
* [4.21] x86/asm: cleanups after toolchain baseline upgrade (v1 -&gt; v2)
   - Denis Mukhin
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.com/">https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.com/</a>
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250403182250.3329498-1-dmukhin@ford.com/">https://patchew.org/Xen/20250403182250.3329498-1-dmukhin@ford.com/</a>

* [4.21?] x86/efi: Fix booting when NX is disabled (v1 -&gt; v2)
   - Andrew Cooper
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/">https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240722101838.3946983-1-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20240722101838.3946983-1-andrew.cooper3@citrix.com/</a>

* [4.21?] Hyperlaunch device tree for dom0 (v6)
   - Alejandro Vallejo
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/">https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com/">https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com/</a>

*  [4.21?] Boot modules for Hyperlaunch (v9)
   -  Daniel P. Smith
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241115131204.32135-1-dpsmith@apertussolutions.com/">https://lore.kernel.org/xen-devel/20241115131204.32135-1-dpsmith@apertussolutions.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/">https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/</a>

*  [4.21?] Address Space Isolation FPU preparations (v2-&gt;v3)
   -  Alejandro Vallejo
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20250110132823.24348-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20250110132823.24348-1-alejandro.vallejo@cloud.com/</a>

* [next-rel(s)] Hyperlaunch domain builder
   - Daniel P. Smith
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250515131744.3843-1-dpsmith@apertussolutions.com/">https://lore.kernel.org/xen-devel/20250515131744.3843-1-dpsmith@apertussolutions.com/</a>

* [next-rel(s)] Confidential computing and AMD SEV support
   - Teddy Astie
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.1747312394.git.teddy.astie@vates.tech/">https://patchew.org/Xen/cover.1747312394.git.teddy.astie@vates.tech/</a>
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1747312394.git.teddy.astie@vates.tech/">https://lore.kernel.org/xen-devel/cover.1747312394.git.teddy.astie@vates.tech/</a>

* [next-rel(s)] amd-cppc CPU Performance Scaling Driver (v5 -&gt; v6)
   - Penny Zheng
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250711035106.2540522-1-Penny.Zheng@amd.com/">https://lore.kernel.org/xen-devel/20250711035106.2540522-1-Penny.Zheng@amd.com/</a>

* [next-rel(s)] x86: Trenchboot Secure Launch DRTM (Xen) (v1 -&gt; v3)
   - Sergii Dmytruk
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.com/">https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.com/</a>
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3mdeb.com/">https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3mdeb.com/</a>

* [next-rel(s)] x86/EFI: prevent write-execute sections
   - Roger Pau Monne <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/</a>

* [next-rel(s)] x86: generate xen.efi image with no write-execute sections
   - Roger Pau Monne
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix.com/</a>

*  [next-rel(s)] Expose consistent topology to guests (v7)
   -  Alejandro Vallejo
   - 
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/</a>

*  [next-rel(s)] x86/alternatives: Adjust all insn-relative fields (v2)
   -  Andrew Cooper
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129">https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129</a>

*  [next-rel(s)] x86emul: misc additions (v7)
   -  Jan Beulich
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/">https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/</a>

*  [next-rel(s)] x86: support AVX10 (v3)
   -  Jan Beulich
   - 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/">https://lore.kernel.org/xen-devel/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/</a>
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/">https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While it is correct that AVX10 is now to go first, AMX was lost as an item, and
APX (which I see no reason in posting as long as AVX10 doesn't make any progress)
was agreed to go after AVX10, before AMX. (KeyLocker was also lost, but that
happens to be correct, as with Intel abandoning the feature we apparently have no
plans anymore to make an attempt at supporting it.)

FRED (being worked on by Andrew) is also entirely missing.

Overall: There are very many items on this list, and it seems entirely clear to
me that not all of them will make it. I think it would be quite helpful to strip
down the set for 4.21 to some realistic subset. Maybe something to discuss on
the community call later today?</pre>
    </blockquote>
    <pre>Good point, lets discuss that tomorrow during the community call.

~ Oleksii</pre>
  </body>
</html>

--------------kZF3O5gOHXMsO4gSSGZUUrHA--

