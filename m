Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C29A2257
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 14:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820556.1234061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Pk8-0006S0-N6; Thu, 17 Oct 2024 12:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820556.1234061; Thu, 17 Oct 2024 12:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Pk8-0006QI-Jk; Thu, 17 Oct 2024 12:36:40 +0000
Received: by outflank-mailman (input) for mailman id 820556;
 Thu, 17 Oct 2024 12:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxBO=RN=bounce.vates.tech=bounce-md_30504962.671104d4.v1-54daa27fa1074ab9a801456a3f02cf87@srs-se1.protection.inumbo.net>)
 id 1t1Pk7-0006PO-Ht
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 12:36:39 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73431ee7-8c84-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 14:36:37 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4XTnQD2LXWzBsTpfs
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 12:36:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 54daa27fa1074ab9a801456a3f02cf87; Thu, 17 Oct 2024 12:36:36 +0000
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
X-Inumbo-ID: 73431ee7-8c84-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729168596; x=1729429096;
	bh=9D2zvyhviI8/Ohv0KhQUpZSdN4DGpnpSxAWoQ1PCl70=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nsEg272yDSVdz4coW7m2Dynmp1V72AWy3S+7PnlJEZqdlGsMCnTw04qHDehBObxcM
	 kF2pzr6hQszElxbfdVoiXELFkAwTP1qMAJWuPp2stY/lsrcup6qHz5rVYwVZayfQT0
	 sFdCKotdDQZqW59X446/8Zfhu8gTdvLi7p/dUhOXRkq66ePR5gyBDY04oPm4a0yKGm
	 ew7nxXDrt2MqLPuaDnDjll2Aa/sjfFFw9aC/RuG9N8y1iv+b4Rs1NYKC5qmm3l5C3m
	 pT2bYvscxhflM1Y0gVYiFNs/vl5iS3fCd0R2daXyMWyEmvuTC1vw1bEKrWryZ4zbix
	 tXAOYmaGKrO0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729168596; x=1729429096; i=anthony.perard@vates.tech;
	bh=9D2zvyhviI8/Ohv0KhQUpZSdN4DGpnpSxAWoQ1PCl70=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Oc3Bvj62JFEcJt0a5Ig4lF5Giaoi4AAlrj+m7+BeuQ5tckJr9SdxBeR4U8j4XAxMK
	 b0bQ3lhefcwolyI3MPZFZ5ZVX9SsMbVc5nDmbTQzQLujfnQmCzO2geYpAJEGBawAA7
	 KBsPqy2RhKPM3aQ9yvdszKw4mUoNwcgL8oCOGr2pmH2j6wy18q7RHnzMI0IlMqmiUu
	 ShbirFjg5QDB0IOyA64EAQqdXbiv/4toWX955CBrK3bqj14/WAyiX0tY/DkfWp4zUN
	 mTQQX6KI7c3NPqXBplU4zPxSmM8P7ESp4u51eNLIC0mt3+VziVoAO3DUFLHMOXMZvF
	 n/WkpYBJ6HmPQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=202/6]=20x86/boot:=20create=20a=20C=20bundle=20for=2032=20bit=20boot=20code=20and=20use=20it?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729168595040
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <ZxEE0sFMH6dgOa9z@l14>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com> <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14> <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com> <Zw5zSURbpInM5oBY@l14> <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com> <Zw+it8oVVTrS62wx@l14> <CACHz=ZgD-Zf7_R+RWWO1o8qkZbEC0uPjmz2kMJ83qQ8jXmd2JA@mail.gmail.com>
In-Reply-To: <CACHz=ZgD-Zf7_R+RWWO1o8qkZbEC0uPjmz2kMJ83qQ8jXmd2JA@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.54daa27fa1074ab9a801456a3f02cf87?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241017:md
Date: Thu, 17 Oct 2024 12:36:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 04:05:00PM +0100, Frediano Ziglio wrote:
> On Wed, Oct 16, 2024 at 12:25=E2=80=AFPM Anthony PERARD > <anthony.perard=
@vates.tech> wrote:
> > On Wed, Oct 16, 2024 at 09:33:32AM +0100, Frediano Ziglio wrote:
> > > On Tue, Oct 15, 2024 at 2:51=E2=80=AFPM Anthony PERARD <anthony.perar=
d@vates.tech> wrote:
> > > > I can think of one example where $(if_changed,) is going to really =
help,
> > > > by looking at this command line:
> > > >     One does update the .c file to add a function that they like to
> > > >     export, run `make`, realize they forgot to update the makefile =
so
> > > >     update it, run `make`, it's still doesn't work...
> > > >     Maybe run `make clean; make`, or something else...
> > > >
> > > > So, could you use $(if_changed,) ?
> > > > Probably:
> > > > quiet_cmd_combine =3D GEN     $@
> > > > cmd_combine =3D $(PYTHON) ...
> > > > $(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_=
32.final.bin FORCE
> > > >     $(call if_changes,combine)
> > > > targets +=3D built_in_32.S
> > > >
> > > > GEN, for generate, or it could be PY instead, because python script=
 can
> > > > be slow to compile which could explain why the build system output =
is
> > > > making a pause on this target (on slow machines that is). Or it cou=
ld be
> > > > COMBINE, or something else, but it's not really necessary to explai=
n,
> > > > the target name is often enough to figure out what's happening, whe=
n
> > > > needed.
> > > >
> > >
> > > It just looks more complicated to me.
> >
> > I'm sorry if writing makefile is complicated. GNU make doesn't help wit=
h
> > writing build system that work well, especially when doing incremental
> > builds. So we need to use more complicated construction, especially for
> > a complex project like Xen.
> >
> 
> It was more a balance consideration. Considering the cases that seem
> to solve (and your case did not much apply) I don't feel that worth.
> Also, dependency to Makefile would solve without additional macros and
> indirection. Do you mind posting a full working change?

Sure, here it is (I notice I've misspell the macro name in what I've writte=
n
earlier):

quiet_cmd_combine =3D GEN     $@
cmd_combine =3D \
    $(PYTHON) $(srctree)/tools/combine_two_binaries.py \
=09--script $(obj)/build32.final.lds \
=09--bin1 $(obj)/built_in_32.other.bin \
=09--bin2 $(obj)/built_in_32.final.bin \
=09--map $(obj)/built_in_32.final.map \
=09--exports cmdline_parse_early,reloc \
=09--output $@

targets +=3D built_in_32.S

$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final=
.bin \
=09    $(srctree)/tools/combine_two_binaries.py FORCE
=09$(call if_changed,combine)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


