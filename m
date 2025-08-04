Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D5B1A5D1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069530.1433383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uix2p-0002zr-OZ; Mon, 04 Aug 2025 15:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069530.1433383; Mon, 04 Aug 2025 15:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uix2p-0002y7-Ld; Mon, 04 Aug 2025 15:24:11 +0000
Received: by outflank-mailman (input) for mailman id 1069530;
 Mon, 04 Aug 2025 15:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyS6=2Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uix2o-0002y1-Rg
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:24:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a939a0-7147-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 17:24:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so647906466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:24:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0f4sm737650366b.106.2025.08.04.08.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:24:07 -0700 (PDT)
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
X-Inumbo-ID: 10a939a0-7147-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754321048; x=1754925848; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPslYb+1lD22zWCKi4qBzKLdBhSos4c2vDLxYVtWL6k=;
        b=aWiwsmp9wbV65FkXayxP4tl6DoNCWq6JHYkRJhMOx3RFD64KNokFeTJArwMXog3Vm1
         24MKCR+QakGzwhBTPZnjUgNI6DxrwSmSrqARrAar53SD/kThwKEf5oj+rPE4JjoB5oSA
         38FOvW6dICd7XRBkLjfpH36sotPCwH2fJ/M8gmC32qE3V3+32pS0myQzs4sxfMkRlbSc
         EWnQvsgESwTFsHFrQWYlyYM11SP1qPDiyEK7ZAJ9841o5w3cjdJNzoPPw6hX6U5sRUq/
         w19qGFJLtrlLxFv1yIyiT/2zAzbaXhy2AyioVVVb8cftceB8/KLN6WAO0PUsZ82f/ZAZ
         mRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321048; x=1754925848;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPslYb+1lD22zWCKi4qBzKLdBhSos4c2vDLxYVtWL6k=;
        b=KbMvQ8aYtdr5lNkgt6SrtVe9AwDQrN1xPrRoWvw8e74dHR9+3MzZahmmYULmYwWBCA
         +in1V243Qr7/4bkj//4Qbgjv9Y72ZIr+mA5rEnWU+Byuv65VmICUC3p8AYdXO53f2bUT
         J+wxTpqDjjXKsVLu4C6nA+MXlqoOI2uvUm+S2QDtGXzkOIIPGLKX6026Mz37OVXeTX/a
         aDRjnDpcla6iBsInQHMrQvK4QcY5wCqt3/qdhj7L85tEMZbmzw1W/e+xp5Laq8Ol5x8/
         219UzuaHILwo13kAfH3UhKZ2RRxYQU7d2/5RR2bZqsRZm99jjD/FliboGPmV7X8pRZ1f
         Zx1A==
X-Forwarded-Encrypted: i=1; AJvYcCVjH/11aK0Gk0tnvceDI5HBJtFY9EnSe8o1digOR1PPkhtQjeTPuJINztIlN5cCg1DKspo740n7skM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDVjcEupHRRhIrjwKXlkTlgYka9usTtUVDPYNgQ7eW476iHEpR
	0gQJh+jRbTydr23CQZZSnG9uazyMT2mv9ZJh3Ik0cyRTydmOyqGZvhT9
X-Gm-Gg: ASbGncs1689ROQHX4u0cHFGw7ORbPN+aPM2eJAQizV83EWov5PWi+ogig7RsXlSXOtP
	OQtAxXM0Cm7rr0N8aL0P9UC9l6GlKnIRvShSDIKVH8+qnF4GYVV/RYmjTuhohs5HuN+Lq5381xi
	EwsIQg5kgm7kSm+npxXk97og8ASIzgbP059iaS5mmIFe9h0jB5iF9pfvKlh0cPjiWUIQcFfbypz
	DRHLcZZwLlRt1pRJgKaEYeWyd+SWZRyYO8KYxfiRvjWRlD4suDDQjgLAzMpngjXHcD2o80g+NiG
	lpPezqvHSjaYxUasiJAUQ2wDuTRHEUQyDP06CvzpJYqJKaylxVybvJzCQD+lAfXfPD/YTse9gzQ
	nTmVeMdm9EuZktq6xoEtuvWwAainI/gCEdn7UtS7GGLxfx83wrRiC8AkKTJElEz8qYZLht4nIqu
	0e95pF5w==
X-Google-Smtp-Source: AGHT+IFvVPF/BRSCfcZGhAvoI8Ijtji9kGLeAwXoKyehRDzxPAxyYRRaXAbZce4/ph4vSe321XCCFA==
X-Received: by 2002:a17:906:f59f:b0:ae3:6cc8:e426 with SMTP id a640c23a62f3a-af93ffc9053mr853900066b.9.1754321047656;
        Mon, 04 Aug 2025 08:24:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0o3XCAYF34QNn0CFpsFhcHsn"
Message-ID: <4c317d98-a17f-471e-9111-f28bc78924af@gmail.com>
Date: Mon, 4 Aug 2025 17:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/3] xen/riscv: irq: drop unreachable pirq callbacks
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250801100852.1260544-1-grygorii_strashko@epam.com>
 <20250801100852.1260544-4-grygorii_strashko@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250801100852.1260544-4-grygorii_strashko@epam.com>

This is a multi-part message in MIME format.
--------------0o3XCAYF34QNn0CFpsFhcHsn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/1/25 12:08 PM, Grygorii Strashko wrote:
> From: Grygorii Strashko<grygorii_strashko@epam.com>
>
> Hence all common pIRQ code is under CONFIG_HAS_PIRQ idefs corresponding
> RISCV arch pIRQ callbacks become unreachable, so drop them.
>
> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> ---
>   xen/arch/riscv/stubs.c | 20 --------------------
>   1 file changed, 20 deletions(-)
>
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 8918cebf35c6..1a8c86cd8da2 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -82,26 +82,6 @@ void smp_send_call_function_mask(const cpumask_t *mask)
>   
>   /* irq.c */
>   
> -struct pirq *alloc_pirq_struct(struct domain *d)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>   void irq_ack_none(struct irq_desc *desc)
>   {
>       BUG_ON("unimplemented");

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------0o3XCAYF34QNn0CFpsFhcHsn
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
    <div class="moz-cite-prefix">On 8/1/25 12:08 PM, Grygorii Strashko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250801100852.1260544-4-grygorii_strashko@epam.com">
      <pre wrap="" class="moz-quote-pre">From: Grygorii Strashko <a class="moz-txt-link-rfc2396E" href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>

Hence all common pIRQ code is under CONFIG_HAS_PIRQ idefs corresponding
RISCV arch pIRQ callbacks become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <a class="moz-txt-link-rfc2396E" href="mailto:grygorii_strashko@epam.com">&lt;grygorii_strashko@epam.com&gt;</a>
---
 xen/arch/riscv/stubs.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 8918cebf35c6..1a8c86cd8da2 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -82,26 +82,6 @@ void smp_send_call_function_mask(const cpumask_t *mask)
 
 /* irq.c */
 
-struct pirq *alloc_pirq_struct(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
-{
-    BUG_ON("unimplemented");
-}
-
-void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
-{
-    BUG_ON("unimplemented");
-}
-
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
-{
-    BUG_ON("unimplemented");
-}
-
 void irq_ack_none(struct irq_desc *desc)
 {
     BUG_ON("unimplemented");
</pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
  </body>
</html>

--------------0o3XCAYF34QNn0CFpsFhcHsn--

