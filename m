Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE98AAAF939
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 13:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979329.1365975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCzqu-0001CF-3X; Thu, 08 May 2025 11:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979329.1365975; Thu, 08 May 2025 11:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCzqu-0001A2-0x; Thu, 08 May 2025 11:55:48 +0000
Received: by outflank-mailman (input) for mailman id 979329;
 Thu, 08 May 2025 11:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5q/z=XY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCzqt-00019w-5z
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 11:55:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd84597-2c03-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 13:55:45 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso9316885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 04:55:45 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd34bc2esm34854895e9.20.2025.05.08.04.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 04:55:44 -0700 (PDT)
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
X-Inumbo-ID: 5fd84597-2c03-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746705345; x=1747310145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zvOGoDTtz8Vw6TGGlISgXM95xWmNwx05kmoiJxwkvkc=;
        b=kFzDxzPitvsFZfttmTTFHAda8i3xd565n7uBdyAfjRnTR5gZa/8kAkl+erjk2lqWoN
         ebHW2OWNsN8wSyFNDgWh3rBJYMv+7mL7CbNkdSTKxnPGAmmjNNPvQ5dSNM/SzwbQeoqv
         RnbphUpMWT5FTgjR0mJW3tBtYOJQDAdU3QXSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705345; x=1747310145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvOGoDTtz8Vw6TGGlISgXM95xWmNwx05kmoiJxwkvkc=;
        b=OaCFBspMLHc7+K1j7vdkW7Swr3RaM6WuVzTN1wO9VDK/rdQvEN4g8I76WWAj+BmFP8
         L9/0lPFo0TPZBdXL0/ZysOM1EVpFca4PsBC0GS0Zm1iCa/mv5O1vvUlHn1G9fiqWiTU7
         qOz1DNSQ0XvjciPItxmpalEgn20x+m5hxtOqfQekDmsvGhpdBiZr7t6TPAVSryxz2q92
         jxZqa0r+g31WCuWfITbiITIBWGHQBhBQuOlP5FNdv+eHUt50oNFojQOO9UnIdv0X35Qj
         ls19DF/uchf/MZUVU8xlTz7SdsAw7/rvIZ5YTfOb1qt5blbdnuW/RE2kd7PBVKHlnLmu
         ztsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB+MVxqjdzmJl4GI8PNRzQiyX8YW44a5OfIjH59fEMp4N7CD0krNedt7cugxfWm7hMdmFDQ82rNRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3eQxSNiSimgbgtdP+ohLtvYWDEknteEZMqrC5aQFTSm7eQogA
	XZ1CKTTCVwj2QAAIHznMN8dCUfUp6clQAWqH89ALl+21OD8vxWkCzCeYMj1FXlQ=
X-Gm-Gg: ASbGncuSyHB7FaHgbbZx5OsXcW1u/yHDGiDkzD5x1+s3579AYOCnkGkDNAUwkmrWa3S
	2sfBm8jfUsuTvEfj3DjNlR5a++AgYennL3/Wv3VIceYexnaI+qJ8qDCeGBZdO072TTNaN3psOSi
	kyMiiVb8uRLs+c+MP/Nz0ST4fzuwdo2kye9BP5iahKPCpo3bd9a6e8A56DsOntIOUwmardo7ZU5
	rE13bYE7MVhmzBsUEh4UcYmGMsJESZ5Jah3Qsx45TqWh1wuCIo5/PNknvRLxVPoXSsO5HmnO3a+
	KMoe9QfYvx+0GVIeXjmhm49Qlo4IcP51yol7CTTNl1o5bYaG3Xo0z6Bbi7vt/7dLbXCECkDtOoa
	ffs/taaXxktJsgoES
X-Google-Smtp-Source: AGHT+IES8YljOE6v2sC3P+OmZhc0Ypbn0NKoc5fUy/GJgycJX5BxuADcQVjMkwjNYmzcAtIXC3Ilpg==
X-Received: by 2002:a05:600c:3ca1:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-441d44c457emr70009825e9.10.1746705344849;
        Thu, 08 May 2025 04:55:44 -0700 (PDT)
Message-ID: <fab47327-e885-4565-817b-16343f41f487@citrix.com>
Date: Thu, 8 May 2025 12:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com,
 Frediano Ziglio <frediano.ziglio@cloud.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
 <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com> <aByIDP2iEHjmo99t@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aByIDP2iEHjmo99t@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2025 11:31 am, Marek Marczykowski-Górecki wrote:
> On Thu, May 08, 2025 at 09:51:59AM +0100, Andrew Cooper wrote:
>> Also,
>>
>>> ld: warning: orphan section `.sbat' from `prelink.o' being placed in section `.sbat'
>> This is because sbat.o is getting linked into the non-EFI build of Xen too.
>>
>> I'm less sure how to go about fixing this.  There's no nice way I can
>> see of of getting sbat.o only in the EFI build.  The other option is to
>> discard it for the ELF build.
> This is kinda related to my question on Matrix - is multiboot2 binary
> also supposed to (eventually) support UEFI SB?

This is mixing two things.

Xen is either an ELF binary (ultimately zipped, so xen.gz) or is an EFI
binary (xen.efi).

Both of these binaries currently have an MB2 header.  This was by
accident, as xen.efi is a strict superset of the ELF build.

AIUI, SBAT only makes sense to exist in the EFI binary.

~Andrew

