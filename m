Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30E1A1053D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871175.1282222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf0L-0000jh-BH; Tue, 14 Jan 2025 11:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871175.1282222; Tue, 14 Jan 2025 11:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf0L-0000hR-7v; Tue, 14 Jan 2025 11:22:41 +0000
Received: by outflank-mailman (input) for mailman id 871175;
 Tue, 14 Jan 2025 11:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXf0K-0000TB-1c
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:22:40 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc7ac95a-d269-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:22:38 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-540218726d5so5062547e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:22:38 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49964sm1645231e87.38.2025.01.14.03.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:22:37 -0800 (PST)
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
X-Inumbo-ID: dc7ac95a-d269-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736853758; x=1737458558; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE0eR+7uBNj/kmRsNRVFLfxsvTEfL6PGPyd246hdZ1k=;
        b=NnMxwU/G7Ezn1qauaR/NrGRYxYv1eqWJLsCyODXBTrGkxWHkPVm1B3cxRiQdD1Z0ys
         v6nfSPgWcYKtLHBoSn5ksex4M5x/BQLDzeddv8BWg5JfjquifKVM1QKvYK00NLYKUbHD
         otEvhIPBIH5eQ+TxxcDL5MeUVf+1UoXGLZGA3f1DOR6rv3hnegK+Suqfjq1rUEbhQ2k0
         r5GT7F68cabFoFkSvT1RjTTsNEtBHZTwcJmm0+49ir/CqB17mqamA1rvSNuNhJt/J/aG
         rLkU871jl7pOzb21Ds0BRqztlG64TDeX2HgMsPWFZMnRzlJTKg+TKZKmeHMZvkeU6J5W
         fWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853758; x=1737458558;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZE0eR+7uBNj/kmRsNRVFLfxsvTEfL6PGPyd246hdZ1k=;
        b=ZvURYUeYb50b+OZ+BiPxLTLVDD3+TealgxIyQUk7f1NiSkhWUnga7Y9VIJNAQIhoWy
         0E8qSFOdpoNXPXdrR1yZD/oPqAlPZlai1IGIa/f44Aj+MAVtnVuU7Z5dggccO4X7/ZL5
         YiUxWFLPDFvl9Br8dkCTaJemPs77JzOksgUYnX5Wi47UOlqNEFSseyPeNmfFjyBJ5Wws
         dq08ie3yCAtlu16GqLD9zG+Qaz9vzUvwBLSP2G571wqDLo5pGDPJmy7CgXgHzjQ/N33C
         3vvCrUNBhREFv2DCQLZ0sWRK4hECWkzVkOPLv/urnpNKIqyQjUR+Jl/cSgBuuuJBzWAk
         QNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr/XAwEsiFCGhBzPOfr2oI0cQGoa+vVEKlL2S18NbMon3H59KJpYIEMno+V029UO7m9niHCVbKAFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7YBEPHWmEcYLdDs8Q+iZ9s1Vixk9A14IO2k2t9BK1pkK2gmp4
	cAsvneuvPX/0zeMylxdYPfFXkrD+evbWsu6iYHVn/AuN6lLqFy0vgF29ig==
X-Gm-Gg: ASbGncuFGP03alRUyzTE77aQnEIKjxpyS4fsnNErFvd+ZylK0P//pb6Q8N+W8DgVh2g
	klSLYe1lpTk/KF8k0fb9M1FpvvxU14jgXYF0QVAfDvzVuWXVs1ZglbYHMk+DM9MX3FlljZ/RXGp
	NOChvtyZOy5p3hGmScTC9a6J1OomVNvcPmdtjvS7rVM857N6FZlLxGwZvtFx4cLvpecs0Qh5pZe
	ql0lfO7rli1cfSLCKbIXwFNGyDEwBUatN66JcwYSWybKG2m1T2wtIlj1Z1RHYd+5sbG5Q==
X-Google-Smtp-Source: AGHT+IEjQHPA+F1rCR/BY0aszD++P/W6rVYMTu1AFbs/wc71tiodVhsZq+bNfQQN0s+I7RsJVO5k7A==
X-Received: by 2002:a05:6512:3b22:b0:53e:2f9d:6a81 with SMTP id 2adb3069b0e04-54284810c67mr7871096e87.39.1736853757726;
        Tue, 14 Jan 2025 03:22:37 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------EgbGnCA9RLofJckEMMLnNRSi"
Message-ID: <50168d73-0fb7-4dbb-b93e-25d8e7e00733@gmail.com>
Date: Tue, 14 Jan 2025 12:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xl: properly dispose of libxl_dominfo struct instances
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <f751c5f0-3895-43bb-874b-3611b7916133@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f751c5f0-3895-43bb-874b-3611b7916133@suse.com>

This is a multi-part message in MIME format.
--------------EgbGnCA9RLofJckEMMLnNRSi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/25 9:12 AM, Jan Beulich wrote:
> The ssid_label field requires separate freeing; make sure to call
> libxl_dominfo_dispose(). And then, for good measure, also
> libxl_dominfo_init().
>
> Coverity-ID: 1638727
> Coverity-ID: 1638728
> Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
> Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> I wasn't quite sure about use of libxl_dominfo_init(): vcpuset(), for
> example, doesn't call it.
>
> --- a/tools/xl/xl_sxp.c
> +++ b/tools/xl/xl_sxp.c
> @@ -45,8 +45,10 @@ void printf_info_sexp(int domid, libxl_d
>       /* retrieve the UUID from dominfo, since it is probably generated
>        * during parsing and thus does not match the real one
>        */
> +    libxl_dominfo_init(&info);
>       if (libxl_domain_info(ctx, &info, domid) == 0) {
>           fprintf(fh, "\t(uuid " LIBXL_UUID_FMT ")\n", LIBXL_UUID_BYTES(info.uuid));
> +        libxl_dominfo_dispose(&info);
>       } else {
>           fprintf(fh, "\t(uuid <unknown>)\n");
>       }
> --- a/tools/xl/xl_vcpu.c
> +++ b/tools/xl/xl_vcpu.c
> @@ -286,6 +286,8 @@ int main_vcpupin(int argc, char **argv)
>       if (!ignore_masks && hard) {
>           libxl_dominfo dominfo;
>   
> +        libxl_dominfo_init(&dominfo);
> +
>           if (libxl_domain_info(ctx, &dominfo, domid)) {
>               fprintf(stderr, "Could not get domain info\n");
>               goto out;
> @@ -293,6 +295,8 @@ int main_vcpupin(int argc, char **argv)
>   
>           /* HVM and PVH domains use the same global affinity mask */
>           apply_global_affinity_masks(dominfo.domain_type, hard, 1);
> +
> +        libxl_dominfo_dispose(&dominfo);
>       }
>   
>       if (force) {
--------------EgbGnCA9RLofJckEMMLnNRSi
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
    <div class="moz-cite-prefix">On 1/14/25 9:12 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f751c5f0-3895-43bb-874b-3611b7916133@suse.com">
      <pre wrap="" class="moz-quote-pre">The ssid_label field requires separate freeing; make sure to call
libxl_dominfo_dispose(). And then, for good measure, also
libxl_dominfo_init().

Coverity-ID: 1638727
Coverity-ID: 1638728
Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:f751c5f0-3895-43bb-874b-3611b7916133@suse.com">
      <pre wrap="" class="moz-quote-pre">
---
I wasn't quite sure about use of libxl_dominfo_init(): vcpuset(), for
example, doesn't call it.

--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -45,8 +45,10 @@ void printf_info_sexp(int domid, libxl_d
     /* retrieve the UUID from dominfo, since it is probably generated
      * during parsing and thus does not match the real one
      */
+    libxl_dominfo_init(&amp;info);
     if (libxl_domain_info(ctx, &amp;info, domid) == 0) {
         fprintf(fh, "\t(uuid " LIBXL_UUID_FMT ")\n", LIBXL_UUID_BYTES(info.uuid));
+        libxl_dominfo_dispose(&amp;info);
     } else {
         fprintf(fh, "\t(uuid &lt;unknown&gt;)\n");
     }
--- a/tools/xl/xl_vcpu.c
+++ b/tools/xl/xl_vcpu.c
@@ -286,6 +286,8 @@ int main_vcpupin(int argc, char **argv)
     if (!ignore_masks &amp;&amp; hard) {
         libxl_dominfo dominfo;
 
+        libxl_dominfo_init(&amp;dominfo);
+
         if (libxl_domain_info(ctx, &amp;dominfo, domid)) {
             fprintf(stderr, "Could not get domain info\n");
             goto out;
@@ -293,6 +295,8 @@ int main_vcpupin(int argc, char **argv)
 
         /* HVM and PVH domains use the same global affinity mask */
         apply_global_affinity_masks(dominfo.domain_type, hard, 1);
+
+        libxl_dominfo_dispose(&amp;dominfo);
     }
 
     if (force) {
</pre>
    </blockquote>
  </body>
</html>

--------------EgbGnCA9RLofJckEMMLnNRSi--

