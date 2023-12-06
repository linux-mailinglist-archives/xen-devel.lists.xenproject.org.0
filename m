Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746B806566
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648792.1012766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiDz-0001YW-CG; Wed, 06 Dec 2023 03:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648792.1012766; Wed, 06 Dec 2023 03:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiDz-0001Ve-93; Wed, 06 Dec 2023 03:05:23 +0000
Received: by outflank-mailman (input) for mailman id 648792;
 Wed, 06 Dec 2023 03:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FImm=HR=g.ecc.u-tokyo.ac.jp=ishiir@srs-se1.protection.inumbo.net>)
 id 1rAiDw-0001VY-MT
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:05:21 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 486d996b-93e4-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 04:05:17 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1caddd6d28so44233166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 19:05:17 -0800 (PST)
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
X-Inumbo-ID: 486d996b-93e4-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g.ecc.u-tokyo.ac.jp; s=google; t=1701831917; x=1702436717; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X07fOaWKw3xAxq1f99neEt6IChxoiyAQmT/9p12Js0Y=;
        b=T8CPxSDfSUQZ/oDl5RdZHfw/mBqcA5CTB9ZCxMNLbosPtbSCGg0nf48Q5m4v6ZcWzq
         oQAWc237ixTvERjH0ltEK7PYb0DYWGNTFTcPyYbGo9/UvtukVyFNdX8KyS4SF8lzgjsV
         TbH/PADQoDWVNAC/JwfeSK+PwvGJBabNNMuhgvFvds1wyyeL8IlNdspzvgojQAy4yYE8
         1jRHPBxI9JANvq1GIWadsL47q90cO5x7csLk1ONJXsnTtFP5OGc1dCPe4CWucagAKkMB
         MimSaSlVlCKZleCfHaZBbkRAPTqkYCM4Cyx+8KAB/ZWB8wBnhrceE4Hn0Cl3U7JSrmBW
         hXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701831917; x=1702436717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X07fOaWKw3xAxq1f99neEt6IChxoiyAQmT/9p12Js0Y=;
        b=iVKy7E9//kzccpB9NGJQ4ME478TFFk+yFGmAxQ/ZCkNp51j1Ig+K874P012A6cUBr3
         8R50sjaYadoL+KZ2fS4tbCaChp+3HVPb5XBcEHGDf5GLMeUYl1ck+tF7po09k+uqohaP
         RIwsOyzIg7Gep10PMogNzqPYy1PSDY1otsGftlXGCsGg1W7j735CAHBukoTzT5fKtxFu
         OZpKwrpOq7R3MFCULRNFQtYqIUADWtJEW9c6jPq1ST0xPYkyOLhmSW1JHe/IWEXYNJ9E
         WoMo0X7f74wqaBOly70Z+tzPLtTro71akcAyc7SqySMuXIYizFBDCYlhtTDm/sXFweko
         m7HQ==
X-Gm-Message-State: AOJu0YwKkppMkOrhjAifmcUX1Xt/IrSPpJhVIk0y/bkZmBYH0HTuqhex
	dOLnDMoiCJfnaJQoKdabsSt9/6efvLqXVsQzSOhyrg==
X-Google-Smtp-Source: AGHT+IFkkidHsNxrwE1JT03Lyu536DQ3ysnaHUkiumcaIB+fbiXIHOagNAJDYCShGU+eeSq7BP1CJaPFbKB0lCj29aY=
X-Received: by 2002:a17:906:338c:b0:a1c:7a18:b506 with SMTP id
 v12-20020a170906338c00b00a1c7a18b506mr91585eja.121.1701831916818; Tue, 05 Dec
 2023 19:05:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com>
 <1415ddc9-81f3-4d50-b735-7e44a7f656d5@citrix.com>
In-Reply-To: <1415ddc9-81f3-4d50-b735-7e44a7f656d5@citrix.com>
From: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Date: Wed, 6 Dec 2023 12:05:05 +0900
Message-ID: <CA+aCS-H2wkiVOMvCS7cCPojduXdStMYzHn7SxintNyg0vS_Bhg@mail.gmail.com>
Subject: Re: [BUG] Nested Virtualization Bug on x86-64 AMD CPU
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your prompt response.

On Tue, Dec 5, 2023 at 11:43=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
> Who is still in 64-bit mode ?
>
> It is legal for a 64-bit L1 to VMRUN into a 32-bit L2 with PG=3D0.
>
> But I'm guessing that you mean L2 is also 64-bit, and we're clearing PG,
> thus creating an illegal state (LMA=3D1 && PG=3D0) in VMCB12.
>
> And yes, in that case (virtual) VMRUN at L1 ought to fail with
> VMEXIT_INVALID.

Yes, you are correct in your understanding. This issue is triggered by
VMRUN execution to 64-bit L2 guests, when CR0.PG is cleared in VMCB12.
Contrary to the expected behavior where a VMRUN at L1 should fail with
VMEXIT_INVALID, the VMRUN does not fail but instead, the system
encounters a BUG().

> As an incidental observation, that function is particularly absurd and
> the two switches should be merged.
>
> VMExit reason 0x402 is AVIC_NOACCEL and Xen has no support for AVIC in
> the slightest right now.  i.e. Xen shouldn't have AVIC active in the
> VMCB, and should never any AVIC related VMExits.
>
> It is possible that we've got memory corruption, and have accidentally
> activated AVIC in the VMCB.

The idea of potential memory corruption activating AVIC in the VMCB is
certainly an interesting perspective. While I'm not sure how exactly
such memory corruption could occur, the suggestion does provide a
compelling explanation for the VMExit reason 0x402 (AVIC_NOACCEL),
particularly considering Xen's current lack of AVIC support.

> But, is this by any chance all running nested under KVM in your fuzzer?

No, KVM was not used. The issue was observed on a Xen hypervisor's
domU HVM running directly on the hardware. Within the guest HVM, a
simple custom hypervisor was utilized.

--=20
Graduate School of Information Science and Technology, The University of To=
kyo
Reima Ishii
ishiir@g.ecc.u-tokyo.ac.jp

