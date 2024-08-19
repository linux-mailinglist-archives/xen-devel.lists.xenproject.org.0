Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7A95676E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779510.1189223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyyn-0003Dl-D1; Mon, 19 Aug 2024 09:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779510.1189223; Mon, 19 Aug 2024 09:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyyn-0003C4-A7; Mon, 19 Aug 2024 09:47:13 +0000
Received: by outflank-mailman (input) for mailman id 779510;
 Mon, 19 Aug 2024 09:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcB8=PS=bounce.vates.tech=bounce-md_30504962.66c3149e.v1-5ea8539928d14061b3928421b7c9ed03@srs-se1.protection.inumbo.net>)
 id 1sfyyl-0002K1-Vk
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:47:11 +0000
Received: from mail137-17.atl71.mandrillapp.com
 (mail137-17.atl71.mandrillapp.com [198.2.137.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014e6a7b-5e10-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 11:47:11 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-17.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4WnSRy259hzPm0QVV
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 09:47:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5ea8539928d14061b3928421b7c9ed03; Mon, 19 Aug 2024 09:47:10 +0000
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
X-Inumbo-ID: 014e6a7b-5e10-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724060830; x=1724321330;
	bh=Hmn02V8tNlrg0T2y7P7nCWJdcFfG/gpDuDkmJVyvpFk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oU8T/qynZ04gOre2RiYfb1HVDEHAysipS1GMhSKGK3NAimCoF5n5LhRIFGKGtozHv
	 52KcvbpM6eNBW+1b98auFKbqv7UGy5kLhIaUae2pAeVnxWAVR78usRxi725zGT/Rx2
	 LQEIXqMSNmrI48Rj1qNvcO7G1wN7Ri3TKtbZUsjabbjMG4AxEUfStwjJiTyxxi6/dJ
	 S3L3KI8NeylMhLLx2CNAeO2Cv6IH7Wi075CuSzNQVEVIlhQn9gx85z/RsNUcbEiQql
	 dXmudviyVHuhonratio1INp/0l73Pob9IKbPIDSCHYwncr5naQmlTvQchfgtaY0KqN
	 vdNIqaAnxTBEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724060830; x=1724321330; i=anthony.perard@vates.tech;
	bh=Hmn02V8tNlrg0T2y7P7nCWJdcFfG/gpDuDkmJVyvpFk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g+bcpbv22NbVzTImoWDoBt7Ei5w0gir3q+g2rX3H8VtViw3SGk5ovyzgqL5QrGVjF
	 l+X6szVftoXZVd9pReVOcnAePzXvhSkldUNzMNvSxU4BFRzjmPUcHElkdZcrdpxep3
	 l2Ed4IagSeAKk1LYgnzbMxPWknDy3mgEEbkkvlozYQ9MuA1j+uncfEOJpTmfyGqDef
	 pI5nSn6hxphPbt+kJmpPkKujw3JUqn0n2hcHKHhYzWh9pVGLdy23z+VySYa4HcUK5C
	 QNUy6PW+ALpCi2bjgajGcDuToX9w53cMTceV3yuHklRPc8E3ef1gNa5ExFOsnQJyIk
	 +TFwUbWgIO5eA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6=203/4]=20x86/ucode:=20Introduce=20--force=20option=20to=20xen-ucode?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724060829325
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-Id: <ZsMUnNrxg728eE1J@l14>
References: <20240725082725.2685481-1-fouad.hilly@cloud.com> <20240725082725.2685481-4-fouad.hilly@cloud.com> <d26bc29f-3ceb-4fe4-af58-c188f9bbf097@suse.com> <CAJKAvHbM=Dhi=VRuaKKGMgoyOP9PHyF=Q50wfezpxs=mkRTZug@mail.gmail.com>
In-Reply-To: <CAJKAvHbM=Dhi=VRuaKKGMgoyOP9PHyF=Q50wfezpxs=mkRTZug@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5ea8539928d14061b3928421b7c9ed03?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240819:md
Date: Mon, 19 Aug 2024 09:47:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 09:56:57AM +0100, Fouad Hilly wrote:
> On Thu, Jul 25, 2024 at 9:44=E2=80=AFAM Jan Beulich <jbeulich@suse.com> w=
rote:
> 
> > On 25.07.2024 10:27, Fouad Hilly wrote:
> > > @@ -79,7 +81,9 @@ static void usage(FILE *stream, const char *name)
> > >              "options:\n"
> > >              "  -h, --help            display this help\n"
> > >              "  -s, --show-cpu-info   show CPU information\n"
> > > -            "Usage: %s [microcode file | options]\n", name, name);
> > > +            "  -f, --force           skip certain checks; do not use=
 unless\n"
> > > +            "you know exactly what you are doing\n"
> >
> > Did you look at the produced output? Imo you want to have
> >
> >             "  -f, --force           skip certain checks; do not use un=
less\n"
> >             "                        you know exactly what you are doin=
g\n"
> >
> > > +            "Usage: %s [microcode file [-f,--force] | options]\n", n=
ame, name);
> >
> > At least
> >
> >             "Usage: %s [microcode file [-f|--force] | options]\n", name=
, name);
> >
> > But: "options" now includes -f / --force, yet that on its own makes no =
sense.
> > I think this needs further textual clarification to properly indicate w=
hat is
> > valid to use and what is not.
> >
> 
> Will be fixed in v7:
> static void usage(FILE *stream, const char *name)
> {
>     fprintf(stream,
>             "%s: Xen microcode updating tool\n"
>             "Usage: %s [options | microcode-file]\n"
>             "options:\n"
>             "  -h, --help                       display this help\n"
>             "  -s, --show-cpu-info              show CPU information\n"
>             "  -f, --force <microcode-file>     skip certain checks; do n=
ot
> \n"

If I recall correctly, "--force" doesn't take any argument, so this
usage is misleading. One could be tempted to execute `./xen-ucode
-fmicrocode` or event `./xen-ucode --force -microcode` and expect it to
work with files "microcode" or "-microcode" but instead I think getopt()
is just going to return an error.

Instead of writing "--force <microcode-file>", could you change the help
text, with something like "skip certain checks when applying microcode"?

>             "                                   use unless you know exact=
ly
> \n"
>             "                                   what you are doing\n",
>             name, name);
>     show_curr_cpu(stream);

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


