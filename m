Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98882BD1DC8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141783.1475948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DFQ-00041E-0F; Mon, 13 Oct 2025 07:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141783.1475948; Mon, 13 Oct 2025 07:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DFP-0003zW-T6; Mon, 13 Oct 2025 07:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1141783;
 Mon, 13 Oct 2025 07:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmnp=4W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8DFP-0003zQ-Bc
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:45:35 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d63e25-a808-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 09:45:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so705266966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 00:45:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d9a406d9sm871707166b.88.2025.10.13.00.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 00:45:33 -0700 (PDT)
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
X-Inumbo-ID: 99d63e25-a808-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760341534; x=1760946334; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1fKzjKM7WSoNjTjlSRHz8J4uj9fS79cXuGROvb2G34=;
        b=T1E3i8n+dTlgysYki95EdiNBv0JIlhhwCQ3erIg7WW2rpJ3RFcf4xdgGZKwTQujVPj
         NsZbpfU1Y8ozq9farisjzZQm2nkWvLTH4DZyFsO/FMtOcUWPVhHbg4vxU54Ezv9Q1Cj9
         MuezPnEW/McLeCdjtChNxfGlxbB9VRkXB3VNK792N4mXrPxRPjkwhfTixSgLsrVkVrk/
         gu+yQ9u66iCb+K4SY/6AghaVnq/Kp6xZyBRyvupCpRF27/eqYSnGz2BIh8Ycdhr/iCHb
         I1nPrlAsE5ra+BXazFVQ2AuI2slPeMzsI3bZ7dSKjzingGfE2CFmq5FsOONvQxUn7eaP
         ZGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760341534; x=1760946334;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1fKzjKM7WSoNjTjlSRHz8J4uj9fS79cXuGROvb2G34=;
        b=UK/JrPpApOAeuIg6pEf1suxiyh7/c/oHzGXOoWtxwt1BX7sILJNDqG3HDiZqrPZnPs
         ksGWgOW9AxiPzhshpLlR69lKQYG2LAivijmODbB02ANwdBcjODs1MlM+/4vRBZAC3m9S
         nJk1wSPUd3URsDqDrBfGS1dHuchvY9MTNnYW3M5xQLc2fKOxAuJXwwQcN7h+TWLLOmJl
         6OJPVAsMlJgHcK2SGZ/RdRkJaiTLO6tyCSSLmRXVN4JwtlWfCX3quFwyLjaE4K93/PO7
         bF27Sjs077s2dTdk2KdUYVMNVPNpQAIdTiLNWfWE7WSl64Gi1N2vfVG4rFEIfT3Egj5U
         oZrw==
X-Forwarded-Encrypted: i=1; AJvYcCVqDxEFqEpXvthXIDW25n2TkS7dXtgC2j0OHdwkPibgC07KzxpX4kVubbHl70HDYpsZfrB6DuluomQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRejtXuyDMtF0/GCziVM1JPogYxP7vcbObFk++2TMIhF2Yc6D2
	5/8Jae26RsPfJMMlrvwNuA9LLQNMVEsqIcI5FV7RlUoJsgrL9qYdIaYG
X-Gm-Gg: ASbGncsboObaPG2R3Hnbj2vFHBJ8uQt8gM/klNlSOYTXEtEkkzG31uABn7727WKREJ2
	e7TmGhGbwUa/BD5lEHqB8AVfF4Alxd95DiFwNzKHdV/gKt//rnk8d+rNjo7WNOSFAH5m5Bw8ppp
	IPmmDzzaeRaAXBQkSMNvEb+k2fIrLKwnNqZj7pCnjw0dRzgWErJFgNEsEAFUiBbc5ECvvWHr4jT
	qsqJZZBLq6yqAMnKYem0QxcfUBqxeO72ZyHkbnhaSZ39TFiCcfqC1jfmMgfK7xl6XSA3iHFValB
	KOZcmzogxti0QydmW3tyLFC5fl6ILzm6+6cIwUu2XidjXG1qRpLxUYtyfjmCVvx7VGDKG7LM9PD
	SAwjW6lRRUIWvl27UGfRBg4Ih6PA0x6aLC+ZjHJKILKNyaui+PUSdtF9OJH8DITNTivxAxnQzU/
	noAQQDrriH/YwcDkO0NrA08kfNfuO21+7Y
X-Google-Smtp-Source: AGHT+IEa2hiMm8nd58krNQE0n+wAwAFSFwG3oxicaGjJO4rQBmrB7SOX6yKHWuIqc+G8Z0jiUteVsw==
X-Received: by 2002:a17:907:c09:b0:b3e:5f20:88ad with SMTP id a640c23a62f3a-b50ab0898e3mr2095646866b.28.1760341533744;
        Mon, 13 Oct 2025 00:45:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------m2ZTTSc0OJ1SkXZMoHMedkuc"
Message-ID: <eb08dede-481a-4e36-bb8d-2785c91f0b94@gmail.com>
Date: Mon, 13 Oct 2025 09:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HWP: adjust feature_hdc's section annotation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <2622f83a-e67b-479c-8027-5578eb066ff3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2622f83a-e67b-479c-8027-5578eb066ff3@suse.com>

This is a multi-part message in MIME format.
--------------m2ZTTSc0OJ1SkXZMoHMedkuc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/25 10:50 AM, Jan Beulich wrote:
> The variable can be cleared (set to false) by a non-init function's error
> path (hwp_init_msrs()).
>
> Fixes: 99c4570f8209 ("cpufreq: Add Hardware P-State (HWP) driver")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -21,7 +21,7 @@ static bool __ro_after_init hwp_in_use;
>   static bool __ro_after_init feature_hwp_notification;
>   static bool __ro_after_init feature_hwp_activity_window;
>   
> -static bool __ro_after_init feature_hdc;
> +static bool __read_mostly feature_hdc;
>   
>   static bool __ro_after_init opt_cpufreq_hdc = true;
>   
--------------m2ZTTSc0OJ1SkXZMoHMedkuc
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
    <div class="moz-cite-prefix">On 10/9/25 10:50 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2622f83a-e67b-479c-8027-5578eb066ff3@suse.com">
      <pre wrap="" class="moz-quote-pre">The variable can be cleared (set to false) by a non-init function's error
path (hwp_init_msrs()).

Fixes: 99c4570f8209 ("cpufreq: Add Hardware P-State (HWP) driver")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:2622f83a-e67b-479c-8027-5578eb066ff3@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -21,7 +21,7 @@ static bool __ro_after_init hwp_in_use;
 static bool __ro_after_init feature_hwp_notification;
 static bool __ro_after_init feature_hwp_activity_window;
 
-static bool __ro_after_init feature_hdc;
+static bool __read_mostly feature_hdc;
 
 static bool __ro_after_init opt_cpufreq_hdc = true;
 
</pre>
    </blockquote>
  </body>
</html>

--------------m2ZTTSc0OJ1SkXZMoHMedkuc--

