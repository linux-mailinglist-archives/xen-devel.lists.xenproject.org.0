Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807AAE4E08
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022695.1398517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTncK-0007IJ-Vv; Mon, 23 Jun 2025 20:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022695.1398517; Mon, 23 Jun 2025 20:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTncK-0007Ff-T2; Mon, 23 Jun 2025 20:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1022695;
 Mon, 23 Jun 2025 20:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KmUX=ZG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uTncJ-0007FZ-95
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:18:11 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b625aac-506f-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 22:18:04 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so4402833e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 13:18:04 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41446e2sm1539738e87.32.2025.06.23.13.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 13:18:03 -0700 (PDT)
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
X-Inumbo-ID: 2b625aac-506f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750709884; x=1751314684; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Epfw7tQNZp8pq/U1v10JyXOvAvYpQMAD1f8ZMHoTIy4=;
        b=FkVQgZGbBvWrorRCfyEXiLDxhJYt0L2jlHskGd50SNqN9s62wWSSrwqVuMW0RJNlS4
         ve6QAzuPYnE8mtcBlgQcbRSrFgvM0pTv+q4oJ5NVgNRh0UxRs6aeuJdJUtNjzwCMrZP9
         AzKtMDejpitHQTeWgFQKnse+NwVp0+i+Gtwhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750709884; x=1751314684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epfw7tQNZp8pq/U1v10JyXOvAvYpQMAD1f8ZMHoTIy4=;
        b=oHqG1N/tsJZxRPvtYrEnPnZPn4TClhpXZpAFeCvuXhIeu82m5iwRcSiUuO49Xx0orm
         PiYbYfoY4XqW7FO0SWuUXek3p4DC6HFfOHEPYC+ihe3ZWxUr3uzqyfw7eBcQ19QB2QVg
         ZJSBGJlwsFvWTL/+A1jmbJI39cTPeLQVMLbhORiwF8Pu0zmAp/8ESzOMzMLqv/OcUHs2
         m1nbouHSWeQGySZ0H6/MnusxEIc2R1oJrBclFcgvNoL9Ks05uITlzO2DFH1bxqodAmzO
         7N9aHpwxKfF0Mmdm4nqD1Kchxy54x8RByn4AnHo/ELoX7Y/PvvOcHLfk0TPNwy4S3ZWL
         ueIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX51+56EM6jyKb1eluLWpgQT8J4zqjfqpW8/l2PnnNaXi+jcKvSKnAc22QRK6Obo4TKTX58RChpOVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrGVZJw+X4Jdh53EvGwejJUA0kztICsCPO7Vb8VoiN1uXgSBBL
	yVsvHLdvxVD9zU6GcdjLigaqXoGb0PtqHkLv0hgkgR6A9rkPuEyNsI3mwOtm9TJi3H4=
X-Gm-Gg: ASbGncu3MU9Lq9RoanTqoXYPyuQ/XsMnC5GU4THOqlLwB+m0fYgQKr1uAnVXAkMVyMe
	GDiis4BUorcnSovuEZ53eXOJfWPlh4klNFI4z6bEgNl41+dugvP6mybkzcJxBLoVRZNKdq7IhsK
	2CF7mEmJ6PMBBkkaX9xNybBVyio/jk+7PvQjvHt1nR5rl9g7yN8HTjOSaOZsGekBcGmemzYHh//
	38Gf4vwNXKEOn35nHvvykI9TmGtE8e68oPEeERQFBxg/RKh0j4MqVnJBX3GyeQSkYaMZMuzDPaS
	dBSzvTKdyc+szv4RlwkD2difiJspLuAhS8Z4rH18ODS1lFVD7v+zQmDK6oNTv433JM8ZxQh5WqB
	WhBj+wLvLzQ/utUH8MtIp7Ty3LCk=
X-Google-Smtp-Source: AGHT+IF10pPXK2pZ2V5G9shULD7WrROLmjPEHd6V0buVzUM/vaIaPWqBDmHR0GOvxJEs47ozbhtZiQ==
X-Received: by 2002:a05:6512:2313:b0:553:d910:933d with SMTP id 2adb3069b0e04-553e3d10f94mr3842779e87.48.1750709884178;
        Mon, 23 Jun 2025 13:18:04 -0700 (PDT)
Message-ID: <6690e6cc-60e8-4258-af80-1c8a56e76cb1@citrix.com>
Date: Mon, 23 Jun 2025 21:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
 <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
 <3f9c5a18-2ea1-4e2d-80a0-773abc3598ae@citrix.com>
 <ab3ad5c1-fd4c-4fa4-abfd-89641173a862@suse.com>
 <f2092e8a-2f13-40c5-b961-8a15d8298387@citrix.com>
 <134c69c8-ccff-475c-8bf7-241ec4805754@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <134c69c8-ccff-475c-8bf7-241ec4805754@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/06/2025 7:27 am, Jan Beulich wrote:
> To expand on my earlier suggestion (ab)using the "efi" global: With
> the linker script having this
>
> #ifdef EFI
>   .reloc ALIGN(4) : {
>     __base_relocs_start = .;
>     *(.reloc)
>     __base_relocs_end = .;
>   }
> #elif defined(XEN_BUILD_EFI)
>   /*
>    * Due to the way EFI support is currently implemented, these two symbols
>    * need to be defined.  Their precise values shouldn't matter (the consuming
>    * function doesn't get called), but to be on the safe side both values would
>    * better match.  Of course the need to be reachable by the relocations
>    * referencing them.
>    */
>   PROVIDE(__base_relocs_start = .);
>   PROVIDE(__base_relocs_end = .);
> #else
>   efi = .;
> #endif
>
> where only the #if applies to xen.efi, can't we (ab)use the combination of the
> other two symbols here to decide between xen.efi vs xen.gz?
> __base_relocs_{start,efi} won't possibly be equal for xen.efi, except in an
> extremely theoretical situation (and we could cover for that case by an ASSERT
> in the linker script). Pseudo code:
>
> #ifdef XEN_BUILD_EFI
>     if ( __base_relocs_start != __base_relocs_end )
>     {
>         ...
>     }
> #endif
>
> IOW that #if could simply replace the CONFIG_X86 one that's there right now.

That's horrifying.  Also you can't include efi-boot.h to get the
declarations.

But given that you are adamant that the (...) in there containing a
CodeView check is unacceptable to have, why does wrapping it in yet
another conditional make it ok?

~Andrew

