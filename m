Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09748B1DAB3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 17:24:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073207.1436117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2SV-0000fz-Rm; Thu, 07 Aug 2025 15:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073207.1436117; Thu, 07 Aug 2025 15:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2SV-0000cr-OU; Thu, 07 Aug 2025 15:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1073207;
 Thu, 07 Aug 2025 15:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk2SU-0000cl-Ay
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 15:23:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c9e1369-73a2-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 17:23:09 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-af925cbd73aso219928266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 08:23:09 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af95734a066sm932627166b.44.2025.08.07.08.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 08:23:07 -0700 (PDT)
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
X-Inumbo-ID: 6c9e1369-73a2-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754580189; x=1755184989; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3la9+ubiSZUebmiPQN7HXRwbVxlhTumgnyD5HS5xLw=;
        b=Koln7aU6EM+wJvTUkCZ73DDA9GxUanp34NhHQ9mgHfYokJ6Wrl0GU6vs08Q9hoobYq
         pv7xmAbfn+njxUYQgZeA8tw/uhAZdczQ/oHD7djcHpkCooUhiOsv/7ujcSGBQT7LNgMH
         FWj99S/z7JS+oav7VBUw+GGciFAVQ8KiNwkRjOJLfCMG8vfSWwaryitK2Bs9w5vBHecq
         VGX/Q/Q6QXl6K4WyLN+yG4QQluVSOKsIVh+sb8lQVWhVRIZ9igR8VXPOogZpo1w3MxbR
         DHdSMCZG/+38hCIJkvQc22+/5fHh2LVM+KTWZBOZIz1G80sBScU36h2lpKPhOJ+iU9Uf
         uapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754580189; x=1755184989;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3la9+ubiSZUebmiPQN7HXRwbVxlhTumgnyD5HS5xLw=;
        b=QlS8Ou56ebtfdas4BBfm9B3yx3rrFQFeFs6AhMyVtiD8EGQh/RA4hwgvySn6A11iNb
         PwQjCtcE0mdQSmBjEeAWP7fkLY4T1Hoczz9Q4CZtBniR+7WZuv0RBbBx4klK22Kxw0ND
         6OYHYY7Ni2Fq5un5FQeydRtmWpnYL49lqtv+WL4wocokIT9fsocsLDYzZo12Inx/SNMF
         ln9/ZuezFpjkVqTNtPvODaCDXbR8uevpAjgLQeiGi1gWVD88MLV+2A4MfIfMM0eB1ZOT
         IfH5eA+3RO/SJTicTlIFKQ3mYvkDFcf1gzRGQqqhTG1Xz+jYhEFDsogPLjvhNR/H/Mv9
         z5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4EKwTKGijfMKYlZzBqYe83AfTYFLrPA3p1fF3MwET2vPcBAlFdLUtFbWbdrgTXBOXY4o3mikd0lQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+/8VN/SBxrtXCU/l9zIDPf7F51hfiHuru9mAPjKDu0H9mbjHU
	vffMJo78OySm6n17fEkSgk3naZlXblFciQb+tuwHFu5BxAb3yuQmOYWsjDqy1A==
X-Gm-Gg: ASbGncvIFQo0LePUqeyYyNWU9796bR5dD8XVOMMJOU1sHDEwonsvkE7h3r9PqX4fvrF
	A8HniHzrXFpiOU8GONg3zqVTm9X4j57yHCUTLHLgXKOr8sSeDTxjec+AP4ez7MWfseZfcgmpLST
	3t3HviGhyhr84OR3xZuoUZLp4a6N37X3SVysGGpTNIB1Op/4kPK5PM6aZEaP0T/sHzFLqA+nG7g
	+oKbsGARDxMp+GMlKQNfwJI4IdhNOGXoLISqot5u08TG3BYHxqB44gtlP13PRscvWinj8dVWi8X
	dkwUFeY7I/OgZx5m+e7FB9ClvHZ2aJnqz5HFDIKg/Mb8corMuGXkrXK/dJuv9ifwfESjLRyLFfx
	5nMCdjCy2h7Ws02xbIVlzvEG9vQxtg/Y9B/vv1MXzzNmsE3VY9mQTKbkiZzBE4Yq278d61cI=
X-Google-Smtp-Source: AGHT+IHVAERvTO++Li5DAwE5O9x0U81ncmzWAkyELfDA36SmqR+5Np8835f4HBhtxZCcq71k8PW1Hw==
X-Received: by 2002:a17:907:98a:b0:af9:5260:9ed3 with SMTP id a640c23a62f3a-af9c1c8b29fmr32171866b.14.1754580188346;
        Thu, 07 Aug 2025 08:23:08 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------q37BbWsG2NRR6rHPIxlNV5xv"
Message-ID: <08aa8ab0-c102-464e-b829-0cf0e09a63e1@gmail.com>
Date: Thu, 7 Aug 2025 17:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] xen/dom0less: abstract Arm-specific p2m type
 name for device MMIO mappings
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <b9f7a13262cb3b482fb3d5cbbee6c72781fbfdc2.1753973161.git.oleksii.kurochko@gmail.com>
 <01442213-1bcb-465c-9e0d-252864ba88c8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <01442213-1bcb-465c-9e0d-252864ba88c8@suse.com>

This is a multi-part message in MIME format.
--------------q37BbWsG2NRR6rHPIxlNV5xv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/4/25 4:11 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Rename `p2m_mmio_direct_dev` to a more architecture-neutral alias
>> `p2m_mmio_direct` to avoid leaking Arm-specific naming into common Xen code,
>> such as dom0less passthrough property handling.
>>
>> This helps reduce platform-specific terminology in shared logic and
>> improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).
>>
>> No functional changes — the definition is preserved via a macro alias
>> for Arm.
>>
>> Suggested-by: Jan Beulich<jbeulich@suse.com>
> I'm sorry, but no, ...
>
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -137,6 +137,8 @@ typedef enum {
>>       p2m_max_real_type,  /* Types after this won't be store in the p2m */
>>   } p2m_type_t;
>>   
>> +#define p2m_mmio_direct p2m_mmio_direct_dev
> ... this isn't what I suggested. When Arm has three p2m_mmio_direct_*,
> randomly aliasing one to p2m_mmio_direct is imo more likely to create
> confusion than to help things. Imo you want to introduce ...

This is not randomly, this what Arm uses for device's node(s), which is going
to be passthroughed...

>
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>                                  gaddr_to_gfn(gstart),
>>                                  PFN_DOWN(size),
>>                                  maddr_to_mfn(mstart),
>> -                               p2m_mmio_direct_dev);
>> +                               p2m_mmio_direct);
> ... a per-arch inline function which returns the type to use here.
> The name of the function would want to properly reflect the purpose;
> my limited DT knowledge may make arch_dt_passthrough_p2m_type() an
> entirely wrong suggestion.

... But make it even more generic by providing an inline function which
just return p2m_type_t would be really better.

~ Oleksii

--------------q37BbWsG2NRR6rHPIxlNV5xv
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
    <div class="moz-cite-prefix">On 8/4/25 4:11 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:01442213-1bcb-465c-9e0d-252864ba88c8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Rename `p2m_mmio_direct_dev` to a more architecture-neutral alias
`p2m_mmio_direct` to avoid leaking Arm-specific naming into common Xen code,
such as dom0less passthrough property handling.

This helps reduce platform-specific terminology in shared logic and
improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).

No functional changes — the definition is preserved via a macro alias
for Arm.

Suggested-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm sorry, but no, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -137,6 +137,8 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+#define p2m_mmio_direct p2m_mmio_direct_dev
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this isn't what I suggested. When Arm has three p2m_mmio_direct_*,
randomly aliasing one to p2m_mmio_direct is imo more likely to create
confusion than to help things. Imo you want to introduce ...</pre>
    </blockquote>
    <pre>This is not randomly, this what Arm uses for device's node(s), which is going
to be passthroughed...</pre>
    <blockquote type="cite"
      cite="mid:01442213-1bcb-465c-9e0d-252864ba88c8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
+                               p2m_mmio_direct);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... a per-arch inline function which returns the type to use here.
The name of the function would want to properly reflect the purpose;
my limited DT knowledge may make arch_dt_passthrough_p2m_type() an
entirely wrong suggestion.</pre>
    </blockquote>
    <pre>... But make it even more generic by providing an inline function which
just return p2m_type_t would be really better.
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------q37BbWsG2NRR6rHPIxlNV5xv--

