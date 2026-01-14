Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F894D1C9F8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 07:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202455.1518010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vftwO-0000uC-ED; Wed, 14 Jan 2026 06:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202455.1518010; Wed, 14 Jan 2026 06:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vftwO-0000q9-AA; Wed, 14 Jan 2026 06:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1202455;
 Wed, 14 Jan 2026 06:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bd0b=7T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vftwN-0000pt-GG
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 06:01:11 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf2d570-f10e-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 07:01:09 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-382f4aa8dd1so65564061fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 22:01:09 -0800 (PST)
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
X-Inumbo-ID: 6bf2d570-f10e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768370469; x=1768975269; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCN+j6pdToO7nMul7/ADuNhkHe61P/LGas+RLxrhGzY=;
        b=JCney5fLnIYbqjPQLJ5bHihEpK+OpHDwof5LOQlkzHoYgwV4LCCQPzfOVLpyrdvcRG
         MUjSDcbeMcQqjdwF931ZPu/MovABiLtmmzevXnUSv/8uF8ekfGKUcYNmfEfUmpO9nsT9
         optQTAiWFy1/MYAIx1wZDh29/rd1aKzZMLYrS6Ehzv7VKJe/gzeHW+6ebOCqTifDO+Uk
         8GqzovOPzLeo9kGIz0Nyg2w4827GbdZPC2WNQj5ifHCir3sQZVslvbcc4vmSgjAtVyLc
         gwym1hCEoxxyQA4OZTz1O5uZLeCpr0pWzDwGG7x5SmByFy51P89swd08yaPLzDUxbZ5G
         bEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768370469; x=1768975269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCN+j6pdToO7nMul7/ADuNhkHe61P/LGas+RLxrhGzY=;
        b=C8m1mcd4NSz+s5mkTVQiQon/AEstR+dEPJhIJPUNYU9w93cR3koCGpAs9FLAwsNtUZ
         DVnPEEYdaeoywfjC7sNiQW2kDqooON6Ao3vpCIs0St2dG2k6Q0ChtZcOJDYqA5QPz9Bk
         CKiwAvPE2XmaTXZvTqxtzkMIELwAf0bm7jKVLiXBeAEBK8q5DVH1F3kusGxlfHhY3U28
         IHRXP7zvx2ocSBLPjaFGNJYroztNV3v4QJnIDNzoo5xuml/8UohPDa3SL7d2TwGXr69B
         DMbJIZ2M1+mkgT6pBOBUM+ZV8g59nXPwYrolXvrpzQVYoNReuSiGdHf3mm2ahRmIgYFU
         1Vpw==
X-Gm-Message-State: AOJu0Yz5JPc4qe0BSLfv6mhHACEibWrZWlzDiL+oocOMI4M5BcTEy/NO
	ZthLh4/ndfHpPXTlNagiB9iBtCxTF2hdj3/MwUNLPUL6rAVWcKP33oQdDLKpzBedIFRYIaLkdCm
	cEZ9ng8JeDv1qvt7ryjIuXwFz9tAPsX4OUp5/
X-Gm-Gg: AY/fxX4YKReGMgteyCpTN1Ay6UjegnLC5tk73UTKBGZ/BalFr4nkA0xU73o/W6GKf9B
	NLLXCExcfnXF6BDk4f7fohSVfNEPB0eKVWi6IayBK7QtCzs8qNbj9Kf6RpajGDWpZNS+1iLV1rq
	T7SvV+1x/OLm7D+EeD7Hh/z3O/036J5DMfPCnqQP29UzZaSkuY7GH6vVMYmUNBub77t2icggHXH
	wLiTTdU04c0svhGjiYArraPM709Ac1Eu1R9NfX2cgmALRSIsvAvHxQ837OaMqA+Ql7jGQ==
X-Received: by 2002:a2e:9b82:0:b0:382:56ff:5207 with SMTP id
 38308e7fff4ca-38360844aefmr3119301fa.36.1768370468523; Tue, 13 Jan 2026
 22:01:08 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com> <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com> <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com> <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com> <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com> <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
In-Reply-To: <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 14 Jan 2026 08:00:00 +0200
X-Gm-Features: AZwV_QhZCemHOV_JLr5xl1H5SbaODGdbkZwpZ5NEJRZUpgEp0-rza_Xm8VQgGx4
Message-ID: <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Apologies for the delay in responding.

On Mon, Dec 15, 2025 at 1:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.12.2025 12:00, Mykola Kvach wrote:
> > On Thu, Dec 11, 2025 at 6:40=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 11.12.2025 17:30, Mykola Kvach wrote:
> >>> I have now attached the corresponding build log.
> >>
> >> Okay, so indeed not a table size change issue here. Then I fear some i=
nstrumenting
> >> will be needed to at least know what exactly is going wrong. Alternati=
vely you could
> >> arrange for the intermediate binaries to not be deleted, and make them=
 available
> >> somehow / somewhere for me to see whether by inspection I can gain som=
e clue.
> >
> > I prepared a small patch to keep the intermediate artifacts instead of
> > deleting them.
> >
> > It removes two cleanup commands:
> >     xen/arch/arm/Makefile: drops rm -f $(@D)/.$(@F).[0-9]* (keeps
> > .xen-syms.* intermediates)
>
> This alone should be sufficient.

Understood. I have rerun the build with the cleanup line removed
so the intermediate .xen-syms.* files are kept.

The build artifacts are available here:
https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12707528457/a=
rtifacts/browse/xen/

Best regards,
Mykola


>
> >     xen/scripts/Kbuild.include: drops rm -f $(@D)/.cst.$$$$ (keeps
> > .cst.<pid> used by compare-symbol-tables)
>
> These can be easily re-created from the ones retained above. (They might =
be
> of immediate interest - and hence worth keeping - if the comparisons fail=
ed,
> but you said the build works fine for you even with these comparisons add=
ed.)
>
> Jan
>
> > Should I gather any other files/logs that would be useful?
> >
> >
> >
> > Mykola
> >
> >>
> >> Jan
>

