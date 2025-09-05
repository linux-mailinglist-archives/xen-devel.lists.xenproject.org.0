Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05DB454D6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111683.1460297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuToL-00078W-DU; Fri, 05 Sep 2025 10:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111683.1460297; Fri, 05 Sep 2025 10:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuToL-00075g-AH; Fri, 05 Sep 2025 10:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1111683;
 Fri, 05 Sep 2025 10:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfYY=3Q=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uuToJ-0006nu-0S
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:36:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac8c3e0-8a44-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 12:36:49 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3dea538b826so1609855f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 03:36:49 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd2df4c8dsm53969085e9.15.2025.09.05.03.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:36:48 -0700 (PDT)
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
X-Inumbo-ID: 3ac8c3e0-8a44-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757068609; x=1757673409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0b/snmQel6GVfLUUnAfLYoIg8AnHVTJIn6Xol2J2nlM=;
        b=saCuCcvlwo6+1PPmelAAvdXtLbOPSvIIX9c+bEqNTr+rVh6JCGlQ+6yp0lW9/1s8NU
         KPLlCe6HDoYul4wd8MpmtvLUWFeL7BQ9uyq6DdZYd4s5uyKgz8bk3+Gd4m84JWR506Qb
         /WgPvMnxKGYtiKXE5+0GCBM8IVnmci4V08u6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068609; x=1757673409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b/snmQel6GVfLUUnAfLYoIg8AnHVTJIn6Xol2J2nlM=;
        b=deLemWxsw4Jszi6icwKtN2hNG4aEb890XGxahAjhigKUOH+u1ao3X+JRhGjq993usi
         kAmEoJP0PCBK5QLGSsDtBq+k1cfR7L4y+3nESNBM0i7hHo67jlN3ounmJx4q++JVNXuw
         GnxnfH3/hCJwXs55g1XqIPSDCYMrIeM1Xbg6FoNgKcJJsrlQSwuJxQxeT/QU0gNQv1jH
         1Mcd6xjVbISzkU56ZJxitOYc6KBikSwyjHJpK/PxRU/xzvByBjBDmmuY2ECzjd+tIPIt
         q2F7RfLUYumXgasRdm3aNYKft5haMnwHaDyRUShVQDuBZ6q/xLz+hOLxq2Y2qTuF+sYe
         BI2Q==
X-Gm-Message-State: AOJu0YxJTNLostqvR1y0gnTeB08J/MUi0q3XshLFflN0Om6lttQxA1ue
	PyDFMYuRUmKYAG/0TYJlC5TDuzEcE8JW9SZ6BglmXBgrFe2uluYBsiFDsYHBorXfdgDgKBcaO5a
	ghVIF
X-Gm-Gg: ASbGncs5RgEVQO9gApwfzsNoGwnZ7O2VtDRFjv6w5NAEHDEGmQwhbHrqOv1SHLhrklT
	sqHGBP39qaF0RTvK3SpSF5UKHauKbHyMSxRv6fH1rGcZ7AaxI3WSH1OB0J5+ihZ68tz5GFP2jrx
	+IluGaEwkE9cVV9W2C9EyZOoU9zBBCZS4VP6k+YMDRmB94lrquipEsGjf1ADUbuVG8CUdauEjAW
	DOu5l1Hd3rbmYEvlrTwOHScM7+R7Z0WrkBFWlzb9JDfBKgqDZ0rSvKRZHX03F7qefYbMxzI1mB0
	2KdR/KeZEPjMAMRzhPJHZobpF6vUMT2am07EmXWYBjaTdOjSZ/GKeeOSwZuS189gUU1ymlkY5+M
	xZSX6JSq9lF/QNn3KYRAJiaLeiOqDgUqgp+Ule8oUyN2IAJdjvugvX2e2/Es1+CTg7uwJ
X-Google-Smtp-Source: AGHT+IHyU1/v76uEaQ33dRdFEarsypMpUL874bW4ArXsJt36UMJ9N4R4yRH3pyY5PnVKrnhKliTRXw==
X-Received: by 2002:a05:6000:420c:b0:3dc:21a1:8c6a with SMTP id ffacd0b85a97d-3dc21a18ca1mr10187524f8f.11.1757068608735;
        Fri, 05 Sep 2025 03:36:48 -0700 (PDT)
Message-ID: <6940b548-18b8-4507-bb75-617378fe090c@citrix.com>
Date: Fri, 5 Sep 2025 11:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [misra] Re: [PATCH v3 1/2] efi: Add a function to check if Secure
 Boot mode is enabled
To: Xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
 <12c18a6d0c3cbbe17cee19f9fb4501d614c23ec3.1757066332.git.gerald.elder-vass@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <12c18a6d0c3cbbe17cee19f9fb4501d614c23ec3.1757066332.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2025 11:05 am, Gerald Elder-Vass wrote:
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e12fa1a7ec04..e7e3dffa7ddc 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
>                     " last line will be ignored.\r\n");
>  }
>  
> +static void __init init_secure_boot_mode(void)
> +{
> +    static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;
> +    EFI_STATUS status;
> +    uint8_t data = 0;
> +    UINTN size = sizeof(data);
> +    UINT32 attr = 0;
> +
> +    status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, &attr,
> +                                 &size, &data);

This turns out to be a MISRA R7.4 violation, complaining about casing a
string literal to a non-const pointer.

The real problem here is that the EFI spec.  GetVariable() ought to take
a const CHAR16 *, but doesn't.

We could fix this with:

diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
index a616d1238aa4..56775d553109 100644
--- a/xen/include/efi/efiapi.h
+++ b/xen/include/efi/efiapi.h
@@ -224,7 +224,7 @@ VOID
 typedef
 EFI_STATUS
 (EFIAPI *EFI_GET_VARIABLE) (
-    IN CHAR16                       *VariableName,
+    IN const CHAR16                 *VariableName,
     IN EFI_GUID                     *VendorGuid,
     OUT UINT32                      *Attributes OPTIONAL,
     IN OUT UINTN                    *DataSize,

but I fear this might get some objections.

I don't think we want to be deviating every use of GetVariable() for a
problem ultimately outside of our control.

Another option would be to have a wrapper for GetVariable() which does
the cast once, which lets us deviate in one place only.

Thoughts?

~Andrew

