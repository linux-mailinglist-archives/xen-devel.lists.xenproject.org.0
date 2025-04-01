Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B35A77D9E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934469.1336163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcWs-0003K2-5n; Tue, 01 Apr 2025 14:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934469.1336163; Tue, 01 Apr 2025 14:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcWs-0003Gq-2g; Tue, 01 Apr 2025 14:23:50 +0000
Received: by outflank-mailman (input) for mailman id 934469;
 Tue, 01 Apr 2025 14:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzcWp-0002j6-VO
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:23:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebd877f9-0f04-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:23:46 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3173348f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:23:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66d0dbsm14381181f8f.58.2025.04.01.07.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:23:45 -0700 (PDT)
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
X-Inumbo-ID: ebd877f9-0f04-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743517425; x=1744122225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKWMI+/C71+DLxq3vf3Vhph0cXh0zcgSRDqsGySwCBI=;
        b=gMcGh1vu8+flbdJPh8svuuu9wCO4+uhpydLVC1G48dF4qDAv/TYdvUVuK03nGRBwEw
         r36gGwURznOO8j18C1YCGmbPA+egWmP9dIb+m/r0LxonpwbkT7AVMAC3AMcxNt1so5BK
         uShypqphXiChF+KOCKrOgKP6tU2t7Z85Bxtn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517425; x=1744122225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKWMI+/C71+DLxq3vf3Vhph0cXh0zcgSRDqsGySwCBI=;
        b=mCYrnZ2emwpXnbkQntP1gTtgs47VFl1D+c48vRCZQyrDJeZawCELv+k2EvPIN+995W
         x2tLX9QprROCwxxI4la+BoBfD2kBXCuhDNOldyJiGLOE5AOcvxoUzdXdBMHx6VrQB+HH
         M4pouoHAuy6tA/pH3WiLS61r8ZHppGvtwrqhlSHCG66JMKgmTtaenWtXSJ+dyElVYTaf
         P8T11Ybdr6YA6ImRQZnOUGSORBNzXVt7mh2p8tmn4lkmggCLOaHOnIVy9Mxu2nIJQsUK
         n5eRhefPEpN2Bj4pGAHqAnEHro22vFM7RckYIcg8eOMg9kqnWRZf635sc05W5QHrokxt
         Qm1A==
X-Forwarded-Encrypted: i=1; AJvYcCV+ykCC1gMjTkQxORX7+G+wp23HxlMzqLlHM5jeELMvDLMnXOU8YQdRTbOHkA3xQG1xWamwido084Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhjcMoZ8ktPbXF8w0Fm4ZKjtPdLj8siP4SG6DJ8h8M3aeMPl9P
	d4EnttK96MnarOyoZ6bbtfv6KbBorVLVkwSdzZin8d24hXex4vuvwnOu8i6HTkH3bw8FmkHsXH4
	uP8g=
X-Gm-Gg: ASbGnctb1lvSUoznooe3yg3yBKcaPt6aUdRpvHobZnp1U/wYKrQxwLn8wbjJgi6Zz+I
	YjWnVrg4tQxuJNZdnCKPkNWPCVNyo0FNIdPx9TFVNou+TG6A5Va4RyX79q4hxsflDCJzj+OkVHW
	xCn8GFhGz0SoaihOaLhTZVCW972uffsnNTlyYWePHChEBGLtZ7DWJL4Clg21F0iqya+378cVrwb
	PWPZbAZSqOWin8F49c9BSb/ePdwHw4mYgBGYssiP/YgSNOzBJoePTZFy0HVAicBszvl0h7tJ6QD
	Htxqr2iAr/Y5cdGoec9td1begxODlA+lndOlb/IrUdwISE+1FVyYZm5mo/uHh7bP7Fzx250Ri0H
	p03y8A9KipXxU/6pLswcm
X-Google-Smtp-Source: AGHT+IFPZPOHIkKvRm9x8IvUOzOX9bLWm3OlE5+TpJPMmYDzw/UZxrLmKuP4gCNoiNlzWEWMmojytw==
X-Received: by 2002:a5d:47af:0:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-39c120dc8c6mr11373791f8f.16.1743517425438;
        Tue, 01 Apr 2025 07:23:45 -0700 (PDT)
Message-ID: <993b1ca7-6ae7-4e10-974b-4c726306a88a@citrix.com>
Date: Tue, 1 Apr 2025 15:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] automation/x86: add a xen.efi test with a strict
 NX OVMF build
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-12-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401130840.72119-12-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 2:08 pm, Roger Pau Monne wrote:
> Such OVMF build does honor the PE sections attributes, and will not blindly
> create all section mappings with read-write-execute permissions.
>
> Strict NX build is only available in the Fedora edk2-experimental
> package, so add the required dependencies to run a QEMU EFI job on the
> Fedora 41 container and use it for the test.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I guess this always has to go last?

It will need a bit of careful gymnastics to deploy the new container
prior to committing this patch, but it shouldn't be difficult.

Alternatively, you can submit hunk 1 in a separate patch and we can get
the new container deployed independently of the rest of the series.

> diff --git a/automation/build/fedora/41-x86_64.dockerfile b/automation/build/fedora/41-x86_64.dockerfile
> index 8032a2098632..84f366ac0643 100644
> --- a/automation/build/fedora/41-x86_64.dockerfile
> +++ b/automation/build/fedora/41-x86_64.dockerfile
> @@ -65,6 +65,11 @@ RUN <<EOF
>          glib2-devel
>          pixman-devel
>          ninja-build
> +
> +        # EFI Strict NX test
> +        qemu-system-x86
> +        edk2-experimental
> +        expect

Please could this follow the pattern in debian.

# for test phase, qemu-smoke-* jobs
expect
qemu-system-x86

# for *-efi-strictnx
edk2-experimental

> diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/scripts/qemu-smoke-x86-64-efi.sh
> index 7572722be6e5..fbb662f1a756 100755
> --- a/automation/scripts/qemu-smoke-x86-64-efi.sh
> +++ b/automation/scripts/qemu-smoke-x86-64-efi.sh
> @@ -4,6 +4,7 @@ set -ex -o pipefail
>  
>  # variant should be either pv or pvh
>  variant=$1

# mode should be nothing, or strict

Also, I'd suggest using mode=strictnx here as it matches both the test
name and the OVMF file name.

Assuming you're ok with these changes, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com> (however you end up splitting).

