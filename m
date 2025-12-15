Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE1CBD6DE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186776.1508204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6Jc-00008n-GB; Mon, 15 Dec 2025 11:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186776.1508204; Mon, 15 Dec 2025 11:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6Jc-00007A-DF; Mon, 15 Dec 2025 11:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1186776;
 Mon, 15 Dec 2025 11:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m1E3=6V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vV6Ja-000074-Td
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:00:30 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 443d8b06-d9a5-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:00:28 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-37fd6e91990so19076151fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:00:28 -0800 (PST)
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
X-Inumbo-ID: 443d8b06-d9a5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765796428; x=1766401228; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTBLPqPGIRbACnY00LVcERO0/OxxlHHMe3kOX8QKx6Y=;
        b=R24WvzvFURh4MjggnqAg4XFm3DaQQMafHyGVx7wnm6MK4UW1ugk8gyjGL2jtE8x6Tg
         7uBfMzyS3xfgBfPzGUFYgA70TRwQcv6gwIOdYKh6O2Fkg6QNy/kpOhZCKIYNOKa+JUDN
         qd2Mhbn9GlYjBJNWHRcJ6G5XwKeGDPzrFeOSiYwoB7POY8eeggBl4oqvjd6ugs9V2Th5
         Px6hOPtov9vaQOrsotSUMhPVraRKHpxqJUMU65lSGjxs4RUsuw9bx8KTCTrXhn2djMpZ
         W0G2F4ydofv5K1Naeggljyvr5sFe6GSVMYv96PPIGASxtgD8hQ/vgaI8j8bdeg17ehLs
         fCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765796428; x=1766401228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FTBLPqPGIRbACnY00LVcERO0/OxxlHHMe3kOX8QKx6Y=;
        b=TeCD58nDsXn9Wh4GGM7I+VAiYOOECAHyBSbvJ2QrRsEgo9tVg/w1dNOTsgFalrZAfr
         igPKrZ6/nHPS/TB3i0tn68eFZyQFhEgrANild3tpaLKCGFE/XzpPDlLvoGD9xti1zND8
         e7ajriH2yEEhiSC7GvBrPryzBe/COLI39YirsneyEBW8NixbgBtus437UI+75m9PKota
         vyhLx5R11ZKoRixqf2ImXGSauNCOgau8IwJKcCOnIATpVr4INQbFUL7DO7JO+Xcewsm1
         9nP3m5TiHuCTjnYVsqeCSPUx+O+URwRw6Tf6QeMw0BovryBKeTv8lwloMkg3SxUcRuWE
         E1wg==
X-Gm-Message-State: AOJu0YxmJE3vAjgg11Upke9GlcSFIgatepniCMOaVhCO6VTRlO+ZqhTz
	HcLnRnsaQikebFi9caqiKG2a0WSvcC92bU+7k8R3oF9f6/WElDAm9E3d7pC7wrqvI2dyF45C+2b
	rQsTsquYLIsQipX4i5hTDmiMNsb2TsHk=
X-Gm-Gg: AY/fxX7N5ZwdO0deOr5xtdUtwzwfwmblf4cfuLVmvo3QFsKLw/Bsyfkvdd479+05CkC
	13cf2O48jiazTDmU1H9AUXnNj9wPP51ygP1Nt9+z2Avsz5uPIf6SLKMhJVG14oIlT5fSWdemSbF
	3vvMyufD21MSmRWif+HHTu3Ifc7FnLhB+WHiDpLlaxXZ8UoGWYEFWPms9LDXyXT6XUBZoX+6+y9
	Cwlpnijm81x2ULzwQwCTTU107LUyJVDTk31brOJyz5eoj+o15dVeQLSWdpu5uSB4JIr
X-Google-Smtp-Source: AGHT+IFCN37rT0N5fWwrYDPT4prXTH+lsvxB6zobuTj9rCtkYva3S9uoWF83f7ADpIJi0hJkkwmbsR5MBAmmYRTRcic=
X-Received: by 2002:a05:651c:1542:b0:37f:c5ca:a6bd with SMTP id
 38308e7fff4ca-37fd08a6a5cmr33851681fa.29.1765796427793; Mon, 15 Dec 2025
 03:00:27 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com> <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com> <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com> <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com> <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
In-Reply-To: <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 15 Dec 2025 13:00:16 +0200
X-Gm-Features: AQt7F2pEQl0RqqALirVjfzhzolZMNop7ibVcfVghXzlY7STaWF1mR5uqdCabJew
Message-ID: <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 6:40=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 17:30, Mykola Kvach wrote:
> > I have now attached the corresponding build log.
>
> Okay, so indeed not a table size change issue here. Then I fear some inst=
rumenting
> will be needed to at least know what exactly is going wrong. Alternativel=
y you could
> arrange for the intermediate binaries to not be deleted, and make them av=
ailable
> somehow / somewhere for me to see whether by inspection I can gain some c=
lue.

I prepared a small patch to keep the intermediate artifacts instead of
deleting them.

It removes two cleanup commands:
    xen/arch/arm/Makefile: drops rm -f $(@D)/.$(@F).[0-9]* (keeps
.xen-syms.* intermediates)
    xen/scripts/Kbuild.include: drops rm -f $(@D)/.cst.$$$$ (keeps
.cst.<pid> used by compare-symbol-tables)

Should I gather any other files/logs that would be useful?



Mykola

>
> Jan

