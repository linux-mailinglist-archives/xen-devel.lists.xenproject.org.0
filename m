Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78E96C47B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790621.1200465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sltHE-0008FT-4E; Wed, 04 Sep 2024 16:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790621.1200465; Wed, 04 Sep 2024 16:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sltHE-0008DR-1f; Wed, 04 Sep 2024 16:54:40 +0000
Received: by outflank-mailman (input) for mailman id 790621;
 Wed, 04 Sep 2024 16:54:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sltHC-0008DL-6m
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:54:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc0e388-6ade-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 18:54:36 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a869f6ce2b9so745526466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:54:36 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d26esm13867966b.140.2024.09.04.09.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 09:54:33 -0700 (PDT)
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
X-Inumbo-ID: 5dc0e388-6ade-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725468875; x=1726073675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qyd7w+L/xrw+NC5fGqs/6jsapBhr3Ds73qSX/+2joyw=;
        b=ifDC7O6CUBX9tzXcr0xeYnJ9TaTEEv3SywW7vw3fI3PTPdhlwixppGEuyjBuk8o7t2
         6I+M8IXL3rxFfHaRaOr2Y6CYSrzsAo/eHKaTlvTzD4dcPCe2b2gMp130CrUIt1Ol3s3O
         AFg0PetuaO9cvy1q3ds7C2Wk2RL2cJkFEPKXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725468875; x=1726073675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qyd7w+L/xrw+NC5fGqs/6jsapBhr3Ds73qSX/+2joyw=;
        b=iXOWF2OTKsQaLu2zHFCX9x46UsBZKgpVtZGLJpWXf2Wunl0QMvGYgQAaU+2cniawfR
         MxDuASl0DztkzsNpHRWjXOkljdbD8HLm0LzvVHOLDZPZDCD1xKfdV80Z31io28NhAkdz
         J9C/0GyJ+zOKvFu6ri946lkU7T8+FxPLKyYlxpgRSvRY9pT1wutPLbzj6b8gU+677fBG
         7k99AAbHr76t0gd/LVZB2UYZEJ4QvDn4MS3akHMdfsmITJ8/UI+nEAXBF8PzoTRILd1G
         Sl9DbPD6iXV/v4IgXm+sCgCg1IDNonpJdcilEUl1iUuljp+kxoMrsO6a4yeTTxwcxHhR
         UBZw==
X-Forwarded-Encrypted: i=1; AJvYcCW1mnNtGsGBsm4sXfmxBmltWZeUBpREGg2o6OZtZxwMHEr0iEqOOTgKsySd8Vheicer/UK2txoKP+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSy3gZ5cgfvxRF9wLXQGEUwXaxoSv0vzNpCodmMUpx4qoEZqT6
	gjcB6fuUAI6XU+UYD7BI7GyREcoskbh4lMnK3erp/0fjj8CpX4ugfVscx54KneI=
X-Google-Smtp-Source: AGHT+IGe89jylxx92teOrgVagqr9N42z5k6+clxmPzmjPlK+T0pDiINA5KDGHAjwyH3J1zLWiZWrEA==
X-Received: by 2002:a17:907:3e20:b0:a7a:aa35:409e with SMTP id a640c23a62f3a-a8a32e744ebmr438118466b.25.1725468874917;
        Wed, 04 Sep 2024 09:54:34 -0700 (PDT)
Message-ID: <ccbdf270-6208-456c-8bf7-6205f5ac921c@citrix.com>
Date: Wed, 4 Sep 2024 17:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] x86: introduce x86_seg_sys
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
 <2848ec72-6e26-4331-a218-0e3e8f16572f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2848ec72-6e26-4331-a218-0e3e8f16572f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 1:29 pm, Jan Beulich wrote:
> To represent the USER-MSR bitmap access, a new segment type needs
> introducing, behaving like x86_seg_none in terms of address treatment,
> but behaving like a system segment for page walk purposes (implicit
> supervisor-mode access).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This feels a little fragile: Of course I did look through uses of the
> enumerators, and I didn't find further places which would need
> adjustment, but I'm not really sure I didn't miss any place.

It does feel a bit fragile, but it may help to consider the other
related cases.

Here, we need a linear access with implicit-supervisor paging
properties.  From what I can tell, it needs to be exactly like other
implicit supervisor accesses.

For CET, we get two new cases.

The legacy bitmap has a pointer out of MSR_[U,S]_CET, but otherwise
obeys CPL rules, so wants to be x86_seg_none.

However, WRUSS is both a CPL0 instruction, and generates implicit-user
accesses.  It's the first instruction of it's like, that I'm aware of. 
If we're going down this x86_seg_sys route, we'd need x86_seg_user too.


Really, this is a consequence of the memory APIs we've got.  It's the
intermediate layers which generate PFEC_* for the pagewalk, and we're
(ab)using segment at the top level to encode "skip segmentation but I
still want certain properties".

But, there's actually a 3rd case we get from CET, and it breaks everything.

Shstk accesses are a new type, architecturally expressed as a new input
(and output) to the pagewalk, but are also regular user-segment relative.

We either do the same trick of expressing fetch() in terms of
read(PFEC_insn) and implement new shstk_{read,write}() accessors which
wrap {read,write}(PFEC_shstk), or we need to plumb the PFEC parameters
higher in the call tree.

It's worth noting that alignment restrictions make things even more
complicated.  Generally, shstk accesses should be 8 or 4 byte aligned
(based on osize), and the pseudocode for WR{U}SS calls this out; after
all they're converting from arbitrary memory operands.

However, there's a fun corner case where a 64bit code segment can use
INCSSPD to misalign SSP, then CALL to generate a misaligned store.  This
combines with an erratum in Zen3 and possibly Zen4 where there's a
missing #GP check on LRET and you can forge a return address formed of
two misaligned addresses.

So misaligned stores are definitely possible (I checked this on both
vendors at the time), so it wouldn't be appropriate to have in a general
shstk_*() helper.  In turn, this means that the implementation of
WR{U}SS would need a way to linearise it's operand manually to insert
the additional check before then making a regular memory access.

And I can't see a way of doing this without exposing PFEC inputs at the
top level.

Thoughts?

~Andrew

