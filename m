Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C26B16EC5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065226.1430624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPjD-00077e-8F; Thu, 31 Jul 2025 09:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065226.1430624; Thu, 31 Jul 2025 09:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPjD-00074y-5B; Thu, 31 Jul 2025 09:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1065226;
 Thu, 31 Jul 2025 09:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPjB-00073o-T6
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:37:33 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e5e48f-6df1-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:37:28 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2cc9045bae9so153842fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:37:29 -0700 (PDT)
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
X-Inumbo-ID: f8e5e48f-6df1-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954647; x=1754559447; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEupqqGQM3LR/msg/AHrwRZOGIZNDBISJ0ZlPcTixgU=;
        b=GFrgpSfAMy4DPmfdAFVSnK/m2LhGQlZ9PI6d5frPJZ+ue89XQRReU7PtL26UFxWSx6
         gRLxWoqStwnUMwYxS0m6TG/ndowyDNF02rQS0qHjf74tfxhZByqKANDbm62PtEcwf15g
         1ow/Bl+dAqoIYyrCDQPtfr7ghrJatxJ4MN1hNh24rijjtMmpMapUOkK+dBWTOhRaLvg6
         OMLFtxaJ3wxC6nd/67XdrOIJAp+OHIMUDOt10sqAsmrixF8wbvUpn1UCL88uDczJqctI
         7/A5bt1zgP6wMKt6F9vCXBTzM/p2XDVhDrYkrHuElqBMrtCoi5NiGFTfJ1H6M4Y+i7sq
         idpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954647; x=1754559447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEupqqGQM3LR/msg/AHrwRZOGIZNDBISJ0ZlPcTixgU=;
        b=QE/8+4R8NYpbDO3zwlBvOAzvqt3qd3J6cXWSEcUZaPEHph/ivNedHUoMew6CxbE/Y9
         82+Rn4RrxBebAftnHwYy8PuSHDZUeM1+sH3hQiaQwFQef306iYQMqCngHV6UfLqrRfPx
         SxgmPrzXFzP+lWiNY94MELzImhgmXiCHME77Z3mSzQsmNTXaqCcDJxPsUViy5Ym7aBB3
         ak1e5suv+Pmm6CcKYmfVM0J6GedZTITdLAVMUI+G4RPl3yYjHWkqkfH9+0udh61Vpd8x
         RR+3bdQwJGCxWhicTED05XyrwIVn4G4UfMaAeHSwVURWoHhhves6VDsfFF8RKa/iLJC1
         f95g==
X-Forwarded-Encrypted: i=1; AJvYcCUo57WbbJh4+wUCBFi8fK4rCorlqLIi6zJB+/5KuLDvjwRdGqm85BzpILETdZefEiOteMthPFrv6WU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygGSZT9CLmFvGIFjE3SUQtOW4lkjukLw1/ZEt+KDR8Yxaw8XxS
	17M0xjUMAgudJvNRo1dUroQ8WHDi348QhSQh1swU3N40Jajcl+emwUmTIx1dDQy/q4+3BlIRrmZ
	TiH8yiHfM35lIX+TlSMteH9aKon87l+o=
X-Gm-Gg: ASbGnct40oC0o5fC1+QDx4FVgoUlLeEjzCwM6EgDDgfm8kBVpdpMAoQZUQwXdT1FapI
	HVvocxwzIpiNM2Zi5+EhL7DGbeb1j/RaYN6SN8dlInTAWZlWT2wbAwPi6bzhuGL7mF1HGz5pT59
	aOjWzLxbi064LA51rLQIKJm0GOiORFsToa55w29syFtNxRn+hULT6Kkx8NuVqQVVKvuY9/VHITn
	ZbTmRblOIeXVDptIPZdbAaPqlc+DEjRLx3peusRwhjJj9tUZS5W
X-Google-Smtp-Source: AGHT+IHcPUQZwpiLov7YcauIlQLz8HLPVlJj4ImjL8mROFb5obB+bEgyGgW2uERks2UDGY3FJsZoTLJ+1jq6gXrcR1o=
X-Received: by 2002:a05:6808:2512:b0:421:4d86:660 with SMTP id
 5614622812f47-4319b821120mr1419925b6e.5.1753954647422; Thu, 31 Jul 2025
 02:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753953832.git.w1benny@gmail.com> <379b70bc-2e1c-44fb-84ec-d7fd42fda147@suse.com>
In-Reply-To: <379b70bc-2e1c-44fb-84ec-d7fd42fda147@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 31 Jul 2025 11:37:17 +0200
X-Gm-Features: Ac12FXz7d5thVdvEBX2Wsa5N8mrzttRpP5fXs_xdPpVBdqRf1nL05Qk_-bnOnYg
Message-ID: <CAKBKdXjWaKzMj1HtTvos8jcW9jPLn7tH61+hgpDgzMScGdmGdA@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] x86: Make MAX_ALTP2M configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross <jgross@suse.com>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 11:31=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> As it is still lacking ack-s, as I think I had indicated.

Sorry if it sounded like complaining - it absolutely wasn't meant that
way. I was merely explaining why I did it, since I wasn't sure what's
the "right protocol" - i.e. whether I should let the commit be
unchanged and let you do it, or - considering I'm resubmitting anyway
- whether I should make the change (despite me agreeing to let you do
it).

P.

