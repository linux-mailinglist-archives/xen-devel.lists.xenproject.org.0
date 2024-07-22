Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B56938DD8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:04:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761678.1171686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqqH-0003ab-1I; Mon, 22 Jul 2024 11:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761678.1171686; Mon, 22 Jul 2024 11:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqqG-0003XX-TT; Mon, 22 Jul 2024 11:04:32 +0000
Received: by outflank-mailman (input) for mailman id 761678;
 Mon, 22 Jul 2024 11:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVqqF-0003JG-IM
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:04:31 +0000
Received: from sender3-op-o19.zoho.com (sender3-op-o19.zoho.com
 [136.143.184.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a20e666-481a-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 13:04:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721646264130701.9093968688958;
 Mon, 22 Jul 2024 04:04:24 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6518f8bc182so31816037b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:04:23 -0700 (PDT)
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
X-Inumbo-ID: 2a20e666-481a-11ef-bbfe-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721646267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bYfChJIYMFTAL/fd524NZL370JHxElCdwhu0SUHoc7exFNeksZMl8CmRJdlDqje9uWL1rBi+X5ieiPRVsXd/sjfr77GM3CraWcF8806NgeY205gv3rhTUBxBOl7BA1JDIDPVXbtfbAEs/ywlWRtpa1ZGMqs8hNW+PzQmHWKdhho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721646267; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RRFgUGwRElkiYY+SRgPtLE8StffmHQQ4rv+GlixN8tM=; 
	b=bWDycgWj17LvqXPUnuPzObYOFawvN2k/s+97ujkvPDMm4QesaVtfMw63IQkzkHDmQ7vv0L3fh1T80g/S4oxKlbVgbpGsdZG8uSn/e+VaizanKcKtFW3/5AUkimXyJoOO2BlAbgAL5M5vzDvJHh/3WXeFctKYt4+6Vg1Md1YZLD0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721646267;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RRFgUGwRElkiYY+SRgPtLE8StffmHQQ4rv+GlixN8tM=;
	b=NsmqbbJYjkNnPcN+qDApwjJjiqrpCAi0TnkI5/t96rHYexANG4SY9wuqSS/k+fsp
	b4va3RqpQel5dMkmbJet/sDN47IzK993kdmgsAuh1u6x8z5Eq7jh9xIzprZblEy8FW9
	vgp56/aYUI9tADix0zeVAwLHshf0hNLLPlk0kqwc=
X-Forwarded-Encrypted: i=1; AJvYcCWIOg+HxcTFusUZLXbfeuPO9xR6zeKfwBJ27r0HGxFjLHBj9Jn5qMI/L9IH/cD+DTfqwYzn1PD3IYAcw8bNSjgtAGO+DfR91QvpJDr6fI0=
X-Gm-Message-State: AOJu0YzCxOZhVsA5a7u19d6qAwrXMlShjIvB3M9pv0ttnU4NHPvB/MCc
	Rv7n56eAtSPkrnqnyyQznDS6r9o8/Qxtu32NmFQLPtqyS9n8B8dvXRHfRY8cbwsP2IdoCfH84B5
	uoRYQkBOCqYrXFH/oSldmDG6qqsY=
X-Google-Smtp-Source: AGHT+IH5I00q6Mg4pXv+8fiSKqUcfSzzLikIaaeobBMZbbFFz3dmxQfh4NkJ0vhljJ2y7eiSFjTLKlobkx7Tq0SrZ18=
X-Received: by 2002:a05:690c:87:b0:64a:445c:6 with SMTP id 00721157ae682-66a6899d2camr62978477b3.17.1721646263239;
 Mon, 22 Jul 2024 04:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com>
In-Reply-To: <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 22 Jul 2024 07:03:46 -0400
X-Gmail-Original-Message-ID: <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
Message-ID: <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 5:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.06.2024 00:47, Tamas K Lengyel wrote:
> > This target enables integration into oss-fuzz. Changing invalid input r=
eturn
> > to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding =
the
> > missing __wrap_vsnprintf wrapper which is required for successful oss-f=
uzz
> > build.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>
> I've reverted this right away, because of ...
>
> > @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
> >  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpu=
id.o wrappers.o
> >       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=3D,$(=
WRAPPED)) $^ -o $@
> >
> > +libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
> > +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer $(addpr=
efix -Wl$(comma)--wrap=3D,$(WRAPPED)) $^ -o $@
>
> ... this causing
>
> gcc: error: unrecognized argument to '-fsanitize=3D' option: 'fuzzer'
> make[6]: *** [Makefile:62: libfuzzer-harness] Error 1
>
> with apparently a fair set of gcc-s used by distro-s we use for CI.

Well let me see if I can hack the Makefile to only build this with clang..

Tamas

