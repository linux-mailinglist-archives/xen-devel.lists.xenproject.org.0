Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6998E452
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 22:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809015.1221129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6Au-0003ec-8S; Wed, 02 Oct 2024 20:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809015.1221129; Wed, 02 Oct 2024 20:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6Au-0003cJ-5F; Wed, 02 Oct 2024 20:42:20 +0000
Received: by outflank-mailman (input) for mailman id 809015;
 Wed, 02 Oct 2024 20:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw6As-0003cD-5V
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 20:42:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf30a3c8-80fe-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 22:42:16 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b4e0so182981a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 13:42:15 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88694e9f9sm6836931a12.16.2024.10.02.13.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:42:14 -0700 (PDT)
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
X-Inumbo-ID: cf30a3c8-80fe-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727901735; x=1728506535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w0XKkhuv2WRNftd4ru60jUn4l6VxTheDHRufkV2dNHQ=;
        b=dLrdWVsfTauE/pQElH/iN+X9mG5HffCl3FDNUoFKsDmFBFnDhkX4EYE5il+1xs1tra
         lll1CFQ198vVF+1kU2HnWCZqFXXKNAT5jbjuY2xd1pz6UafctiYKERVGlYr5jn9fQLL6
         xNlKoM3NwI6++emdSFoKd597oj8WoDbU2Pwtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727901735; x=1728506535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0XKkhuv2WRNftd4ru60jUn4l6VxTheDHRufkV2dNHQ=;
        b=DTOePNnO6AqYgTVOYa5CQJruDlm/c5vakN8zmVZPRf0/M9oXv/s1+Zgka0BHHGlNBY
         Pax+mRVTkk6i1w0MIjr2qJeKvnhUAzck7OQ6fCqbXA79lY/KdqB1RQROhIFaGaLOqYZv
         9o8bLdF/S/XaZCtDj8hfNL4vKm2/2sjYTLXRvo6zqtvQDWfuUXwyZqS11Lg2ZgAMSV0C
         TBogqWVL+bANnjxBqM/OCPF8eCl9fOqVZKO2j4KUMdjz0IGRjI7gqFmnLh2t2bDYVL3j
         l86gzWmuNqpdJ+agewPOdOP9M1bZdY5Wld0NNq6lr92BDBH4C6Y8Cs60xeszKOwGJyOX
         WFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr2d9GbqRgMSjSI+hSoi/i0ItzItQTVt4dbdHMU8ijAui51lF0FLL1hiE/CRT8UTb9SX8z3eeg8TQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjZ4GPymzx/OG3D7M+UVoBUEgc5GeA0r/4RkzVYuQp5uRc/w9+
	L5EofaQpuV9wjM9WaSmuKbPjq7/9bZ0c8lELqb5xavPBDk6HC48pgkdox8Qp6YQ=
X-Google-Smtp-Source: AGHT+IGf3KLvkONw4X+fBPxxEx3q15M+/eCjlvXGE1Ewp/8LjqJTKRbtzNUBN34g1wBPQMgREvoWSA==
X-Received: by 2002:a05:6402:43ce:b0:5c0:ac1d:b970 with SMTP id 4fb4d7f45d1cf-5c8b1b8255fmr3686131a12.32.1727901735319;
        Wed, 02 Oct 2024 13:42:15 -0700 (PDT)
Message-ID: <3ca5faa7-2276-4c85-a4ee-cc6ad5af3238@citrix.com>
Date: Wed, 2 Oct 2024 21:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] automation: preserve built xen.efi
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2024 1:42 pm, Marek Marczykowski-Górecki wrote:
> It will be useful for further tests.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/scripts/build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b3c71fb6fb60..4cd41cb2c471 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -47,6 +47,7 @@ if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>  
>      # Preserve artefacts
>      cp xen/xen binaries/xen
> +    if [[ -f xen/xen.efi ]]; then cp xen/xen.efi binaries/xen.efi; fi

Wouldn't

    # Preserve xen and optionally xen.efi
    cp -f xen/xen xen/xen.efi binaries/

do this in a more concise way?

Alternatively, what about this:

diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb60..14815ea7ad9c 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -41,6 +41,15 @@ cp xen/.config xen-config
 # Directory for the artefacts to be dumped into
 mkdir -p binaries
 
+collect_xen_artefacts ()
+{
+    for A in xen/xen xen/xen.efi; do
+        if [[ -f $A ]]; then
+            cp $A binaries/
+        fi
+    done
+}
+
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Cppcheck analysis invokes Xen-only build
     xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra --
-j$(nproc)
@@ -53,7 +62,7 @@ elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     make -j$(nproc) xen
 
     # Preserve artefacts
-    cp xen/xen binaries/xen
+    collect_xen_artefacts
 else
     # Full build.  Figure out our ./configure options
     cfgargs=()

so we don't triplicate the handling?

~Andrew

