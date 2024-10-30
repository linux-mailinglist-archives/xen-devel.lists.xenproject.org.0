Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41329B68BC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 17:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828322.1243179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6B6O-0005lI-94; Wed, 30 Oct 2024 15:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828322.1243179; Wed, 30 Oct 2024 15:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6B6O-0005ik-6S; Wed, 30 Oct 2024 15:59:20 +0000
Received: by outflank-mailman (input) for mailman id 828322;
 Wed, 30 Oct 2024 15:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQZl=R2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6B6M-0005ie-Nx
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 15:59:18 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8fe698c-96d7-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 16:59:14 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso1120916466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 08:59:14 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298ef6sm583420766b.136.2024.10.30.08.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 08:59:13 -0700 (PDT)
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
X-Inumbo-ID: e8fe698c-96d7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU4ZmU2OThjLTk2ZDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzAzOTU0LjQ3NTI3Mywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730303954; x=1730908754; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/8Xyni/EJIwcbRg2uVOJbhX3cCzajhjaR6n70X5snw=;
        b=fcZoF6G3oPPmt2J9Yo8knqL+lj0Z5A4dkN0st3CvuZ79o0YyPyoCAAK8vynxT1NA15
         UNd0xOeQ+B24MMkXl2JNCjf1C6TuoMgiCPqQ3shwjVnsfg4LP0xXZjququMN6zcBzR0e
         zyM94Wxp3SvylolskYiZYxTJ+DdQtTxgLtkS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303954; x=1730908754;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/8Xyni/EJIwcbRg2uVOJbhX3cCzajhjaR6n70X5snw=;
        b=HdZBPA4exKJo8FF/g0Fxt2F+6P3dhU+vWezd9JtgSKss1TjdMRKVMdcxSBItwudTWm
         Q1do87GdjQkckuNjIaxFUaKzK1Q1Wj7cdqLajBvpSUmQ9SSpQSJDL/ET7sb6cob/LCuz
         WNG3HvNx/okVy7R9mM/xWdZ8i6OrxuOaYf1+xDMqiVGCdKfd7f5d5sZ2eU7e45EmzzEW
         MTGyeTRWDS2/pOJjQhkFKKqIGo7zacIX1Kx3I87HjcDLrFceq2iY2X6U+9jsUqROu31S
         dAxDC4SslkDOgjwYrWfjZ5PoRywM44hNMmc/2NCinyPLPNsmjnkzejZfMlMdWcLy5DC/
         q7Jg==
X-Gm-Message-State: AOJu0Yz9dmNWtt6WgjeFgmiNAJ3sLjdxbxStZNqL3z2TLLjq/O/W/Zp/
	Xeu2nf6NppyUB3fSVkXg6WECvUvjjY16NjCNDQmEiHkzQhSkt68TCJ7YeDWnKg4=
X-Google-Smtp-Source: AGHT+IGWicuB9hlD1mSo/z6ivhFHs2nJdKmS5vPEr+nPabo+hnMeDDGAu2X/KCZ5fPoOQRPW6yjr2Q==
X-Received: by 2002:a17:907:3e10:b0:a9a:7f84:941d with SMTP id a640c23a62f3a-a9de5d659e3mr1619474966b.6.1730303953751;
        Wed, 30 Oct 2024 08:59:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 15:59:12 +0000
Message-Id: <D599K64G9G59.3CGHQABTLBI4B@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich"
 <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.18.2
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook>
 <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
 <ZyISitvz_K_XtvL5@macbook>
 <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>
 <ZyJM_DLUkqolD7mD@macbook>
In-Reply-To: <ZyJM_DLUkqolD7mD@macbook>

On Wed Oct 30, 2024 at 3:13 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Wed, Oct 30, 2024 at 02:45:19PM +0000, Andrew Cooper wrote:
> > On 30/10/2024 11:03 am, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
> > >> On 30/10/2024 8:59 am, Roger Pau Monn=C3=A9 wrote:
> > >>> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
> > >>>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> > >>>> index b6d9fad56773..78bc9872b09a 100644
> > >>>> --- a/xen/arch/x86/cpu-policy.c
> > >>>> +++ b/xen/arch/x86/cpu-policy.c
> > >>>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void=
)
> > >>>>      p->platform_info.cpuid_faulting =3D cpu_has_cpuid_faulting;
> > >>>>  }
> > >>>> =20
> > >>>> +/*
> > >>>> + * Guest max policies can have any max leaf/subleaf within bounds=
.
> > >>>> + *
> > >>>> + * - Some incoming VMs have a larger-than-necessary feat max_subl=
eaf.
> > >>>> + * - Some VMs we'd like to synthesise leaves not present on the h=
ost.
> > >>>> + */
> > >>>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> > >>>> +{
> > >>>> +    p->basic.max_leaf       =3D ARRAY_SIZE(p->basic.raw) - 1;
> > >>>> +    p->feat.max_subleaf     =3D ARRAY_SIZE(p->feat.raw) - 1;
> > >>>> +    p->extd.max_leaf        =3D 0x80000000U + ARRAY_SIZE(p->extd.=
raw) - 1;
> > >>>> +}
> > >>>> +
> > >>>> +/* Guest default policies inherit the host max leaf/subleaf setti=
ngs. */
> > >>>> +static void __init guest_common_default_leaves(struct cpu_policy =
*p)
> > >>>> +{
> > >>>> +    p->basic.max_leaf       =3D host_cpu_policy.basic.max_leaf;
> > >>>> +    p->feat.max_subleaf     =3D host_cpu_policy.feat.max_subleaf;
> > >>>> +    p->extd.max_leaf        =3D host_cpu_policy.extd.max_leaf;
> > >>>> +}
> > >>> I think this what I'm going to ask is future work.  After the
> > >>> modifications done to the host policy by max functions
> > >>> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustme=
nts
> > >>> better be done taking into account the contents of the policy, rath=
er
> > >>> than capping to the host values?
> > >>>
> > >>> (note this comment is strictly for guest_common_default_leaves(), t=
he
> > >>> max version is fine using ARRAY_SIZE).
> > >> I'm afraid I don't follow.
> > >>
> > >> calculate_{pv,hvm}_max_policy() don't modify the host policy.
> > > Hm, I don't think I've expressed myself clearly, sorry.  Let me try
> > > again.
> > >
> > > calculate_{hvm,pv}_max_policy() extends the host policy by possibly
> > > setting new features, and such extended policy is then used as the
> > > base for the PV/HVM default policies.
> > >
> > > Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
> > > having bits set past the max {sub,}leaf in the host policy, as it's
> > > based in {hvm,pv}_def_cpu_policy that might have such bits set?
> >=20
> > Oh, right.
> >=20
> > This patch doesn't change anything WRT that.
>
> Indeed, didn't intend my comment to block it, just that I think at
> some point the logic in guest_common_default_leaves() will need to be
> expanded.
>
> > But I think you're right that we do risk getting into that case (in
> > principle at least) because of how guest_common_*_feature_adjustment() =
work.
> >=20
> > Furthermore, the bug will typically get hidden because we serialise
> > based on the max_leaf/subleaf, and will discard feature words outside o=
f
> > the max_leaf/subleaf bounds.
>
> Yes, once we serialize it for toolstack consumption the leafs will be
> implicitly zeroed.
>
> > I suppose we probably want a variation of x86_cpu_featureset_to_policy(=
)
> > which extends the max_leaf/subleaf based on non-zero values in leaves.=
=C2=A0
> > (This already feels like it's going to be an ugly algorithm.)
>
> Hm, I was thinking that we would need to adjust
> guest_common_default_leaves() to properly shrink the max {sub,}leaf
> fields from the max policies.

That would be tricky in case we end up with subleafs that are strictly
populated at runtime. Xen would have no way of knowing whether that's meant=
 to
be implemented or not. It seems safer to raise the max if we find a non-zer=
o
leaves higher than the current max.

The algorithm is probably quite simple for static data, as it's merely
traversing the raw arrays and keeping track of the last non-zero leaf.

>
> Thanks, Roger.

Cheers,
Alejandro

