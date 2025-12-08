Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19ECAC8F2
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180211.1503435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSX0r-00040Y-AP; Mon, 08 Dec 2025 08:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180211.1503435; Mon, 08 Dec 2025 08:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSX0r-0003xU-7o; Mon, 08 Dec 2025 08:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1180211;
 Mon, 08 Dec 2025 08:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RGh+=6O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSX0q-0003xO-1P
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:54:32 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8145cd14-d413-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 09:54:28 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so729545266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:54:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f44994basm1053610966b.20.2025.12.08.00.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:54:27 -0800 (PST)
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
X-Inumbo-ID: 8145cd14-d413-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765184068; x=1765788868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NuzSyqNZavSMPV/plSYyaAMOxJ2WfnfhplUWybWvYg=;
        b=ME/dcC3DSK5/THE+Yt/l3JqCBSLtVYkuUV3H968m1caOSJtUA626e4Lp0hJzjGihlA
         oktMrNPK4TxEzcUzuz0OgzqXSygGEJm3i7N/AO8hwgU1ElRYjqaZeLXLDw2REiO4pn3J
         e0a7g45EHATGdctCv7W9fZ0owALTDHyPugbiAuuTZGX9L+FmIUM7GWCDbsp4HsysjuQc
         8ODQcqcyEKOb/zLmlZJsXpcWLZtQpMo0hnssFCCRD0dDvLaEAs7DLGnkbTznurUfHoM8
         5wUf7EDG0AzfV+NFxgGzPSyWdOMc747MryOeDqNCCBbdC1zMBkA01ahzXMwM+Dn0MYug
         OzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765184068; x=1765788868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NuzSyqNZavSMPV/plSYyaAMOxJ2WfnfhplUWybWvYg=;
        b=Tn4hcJhE9SidObxXh+EqqFN8rQSLNjykkTb/3/f7GpPxGZMPVDCNFUPA3s8LEpYJOQ
         G3BTJ2X8uykI8Byk32loGlNxacguecpO9Up0kKtNXQEkCntXnYwZyzEGZ6skjRDkb61L
         Eg64f4KSJr3eqK7GS4Pwbg4ONTRw5PyTtf4IZGTmlDUE37kcd1ey4vDQ0ShBPS3Iy24u
         zOk7ICjvjMHmrvkZSB82L0shVtUQdjrLZxLGCgg82XREiLFM4F0yh43IzriTRm2b6Rao
         kUcTtxtycMJ+CKYf7Uvk2npSFDd0vIfvL2cj6E9REmH6BPCLpCValQUOG1JTMB27oJQM
         /94g==
X-Forwarded-Encrypted: i=1; AJvYcCWuYwQlNNTcsf1bGSYU11Std6eD1Y8ARNC50YwfJR2qB80Gy23JV5LKmedTNvvQGoiksCRNkWRAT2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqFEgDf4VDp82CljDRMIjkDWC9/5IlEXQ7uRSpZkTTf1He4oXg
	D+NtvzyERcn6uom9cZcp0+x45vsi+hHMG0LptE0oeOwd3iKDXaNjwT7m
X-Gm-Gg: ASbGncsAxJSCwod9ZpyEYlnXc8yQ2G0f1reQn5YJ5ij+skYDFau2c5GOloA3vhRCAW2
	H4ZLlSB//SI1DVyQypr1p9OjTd0fDRUq+2EOXvIYxxyX3y9y8qJI+fUTzaWnFSMtytIsHCKELBp
	lwoMjCm9wm5zitnxr3+ZVwj5vSZU2JubNdB/D3UUJvbecQY3OQpEb2MX86EiiQrpF0O1q9hMVQS
	jwihfMetBmk0S/fgbUPU/5CoJBNEOqDL+k6yBmjXnUbC2TCTIlUYfoFLnVY8zlCrob2aSMbNBbx
	4PdifYueJrQ+7RJRG7GhFsBuLLB5ug1ENqf/EHsZYHkidlfzHqjNDCyztM+Ly3VmugVqjeI7Q5d
	cvyii2PCKnZAz8cvp52HDHq6wZAJMgeh/hKhpfCBgLtjmEIxcOvMGe8z2/oKghypfxvxUsNpvQb
	tG9Tt6VY1+PXQ8HDj7v1ouwNuFbj8cm0+94uCE5LCGTKJ8Go8m+xSwWdpm8F/Y7vdUB88H3No=
X-Google-Smtp-Source: AGHT+IGHn8jSUYXPodRv59NfSNHBCK+I6GhxP9aoejhfM9uj4Iddp61hGVA2vum5eYA89fJ3z+pNFw==
X-Received: by 2002:a17:907:7f04:b0:b76:339b:d681 with SMTP id a640c23a62f3a-b7a23ced91bmr720333666b.0.1765184068214;
        Mon, 08 Dec 2025 00:54:28 -0800 (PST)
Message-ID: <c9b49e12-f482-4a93-beb1-8c33fa1f00dc@gmail.com>
Date: Mon, 8 Dec 2025 09:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-3-frediano.ziglio@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251205160942.46694-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/5/25 5:09 PM, Frediano Ziglio wrote:
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 3aaf598623..f26ec5b538 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -38,6 +38,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        BAR for HVM guests, to improve performance of guests using it to map the
>        grant table or foreign memory.
>      - Allow configuring the number of altp2m tables per domain via vm.cfg.
> +   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
> +     xen.efi is always stripped, while the symbols remain available in
> +     xen-syms.efi.

It seems like it should be moved to the 4.22 section. After doing that:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


