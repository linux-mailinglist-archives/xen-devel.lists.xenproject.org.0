Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF593B282
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 16:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764266.1174631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWcl6-0003fE-Ti; Wed, 24 Jul 2024 14:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764266.1174631; Wed, 24 Jul 2024 14:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWcl6-0003ch-Qj; Wed, 24 Jul 2024 14:14:24 +0000
Received: by outflank-mailman (input) for mailman id 764266;
 Wed, 24 Jul 2024 14:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqIO=OY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sWcl5-0003cb-Ed
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 14:14:23 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05acfe27-49c7-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 16:14:21 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efbc57456so2996392e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 07:14:21 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7ab5528925sm56495966b.108.2024.07.24.07.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 07:14:20 -0700 (PDT)
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
X-Inumbo-ID: 05acfe27-49c7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721830461; x=1722435261; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIvp6zr2ZGQb6lFBNEM4WASwLJXa0rBzd1Y5LOnZC4s=;
        b=Xkm+MiOqrZ3n0exsedEqcvkJIE1+2N1aUxsKmStmt8+6V7HoTbjGQP2yg/EBNOB7kl
         5tq1jZo+PbvN8BoYmCIZwMhSM3CBt6MRRevRL3HYbzVszVfa5OGcIQ16YPwU/u8s9V5n
         X2xCer1paj4UzOCAEl7If2tPcUAJZUk55TRI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721830461; x=1722435261;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uIvp6zr2ZGQb6lFBNEM4WASwLJXa0rBzd1Y5LOnZC4s=;
        b=ZplAPLowu51Yrxt/goWGxJVkGOa7f0eJfjXYTPptUDa/pvI8KJoJal3i3JHTggRKKa
         UE+qAAmbUx0TCLWoVm4swYKp7fmNHZtw3ratcik+W4TFgjYph5/TO+6KMxUS4/DJ414E
         /6pDVDNNxZkb0hxJrywdTYHhpryZly4VK3vq2Jh3hKXGSbWiDHREELVkskydmDlta/45
         0Bwen9a6tW684z+edmZjR1/LWmhspqCnG4YPxTlmVJomEhasidLAr74lbU3FP+799ymY
         wlzzfEz7cJ4uKcuKaqJvb0YuI1GmHT+Wi3D1WWs1Q15vZtAx4SrbxyFIlTGSQeXuEg9w
         fXuw==
X-Gm-Message-State: AOJu0Yz2odtVmmnT9ImRaMnGWoSPO31BCn4KXPBg1aWLCluFKNgtinRi
	l43XVlwdD7KeJmveeMC76eYWGwc2Ll31FJ4giNuGdQQXWmb+xcxZnyCQ5Z0R3KE=
X-Google-Smtp-Source: AGHT+IHDFUoShWZ/6sCyyxAKvuMwvEt8B16AMCDCEjTTbUfg6P3arkHbiVWR5wQwqcVPcIyPcqCEnw==
X-Received: by 2002:a05:6512:3191:b0:52c:e07d:229c with SMTP id 2adb3069b0e04-52fcf009671mr1639479e87.22.1721830460782;
        Wed, 24 Jul 2024 07:14:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jul 2024 15:14:18 +0100
Message-Id: <D2XTYGTZNLGG.30IMOEEFPZB0W@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [RFC XEN PATCH v2] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Matthew Barnes"
 <matthew.barnes@cloud.com>
X-Mailer: aerc 0.17.0
References: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com> <12e2c7b2-6d0b-4427-ac30-257bfea2aeab@suse.com> <669fa8ad.170a0220.843bc.3a17@mx.google.com> <a08d0d27-1d7b-4453-807c-3670cb4f05aa@suse.com> <66a0f8c9.050a0220.879ba.9673@mx.google.com> <a67ef182-b62b-4d0b-9532-a2356f145af5@suse.com>
In-Reply-To: <a67ef182-b62b-4d0b-9532-a2356f145af5@suse.com>

On Wed Jul 24, 2024 at 2:01 PM BST, Jan Beulich wrote:
> On 24.07.2024 14:51, Matthew Barnes wrote:
> > On Wed, Jul 24, 2024 at 07:42:19AM +0200, Jan Beulich wrote:
> >> (re-adding xen-devel@)
> >>
> >> On 23.07.2024 14:57, Matthew Barnes wrote:
> >>> On Mon, Jul 22, 2024 at 01:37:11PM +0200, Jan Beulich wrote:
> >>>> On 19.07.2024 16:21, Matthew Barnes wrote:
> >>>>> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
> >>>>> startup.
> >>>>>
> >>>>> There are efforts to support a maximum of 128 vCPUs, which would in=
volve
> >>>>> bumping the OVMF constant from 64 to 128.
> >>>>>
> >>>>> However, it would be more future-proof for OVMF to access the maxim=
um
> >>>>> number of vCPUs for a domain and set itself up appropriately at
> >>>>> run-time.
> >>>>>
> >>>>> GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191
> >>>>>
> >>>>> For OVMF to access the maximum vCPU count, this patch has Xen expos=
e
> >>>>> the maximum vCPU ID via cpuid on the HVM hypervisor leaf in edx.
> >>>>>
> >>>>> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Tweak value from "maximum vcpu count" to "maximum vcpu id"
> >>>>> - Reword commit message to avoid "have to" wording
> >>>>> - Fix vpcus -> vcpus typo
> >>>>> ---
> >>>>
> >>>> Yet still HVM-only?
> >>>
> >>> This field is only used when the guest is HVM, so I decided it should
> >>> only be present to HVM guests.
> >>>
> >>> If not, where else would you suggest to put this field?
> >>
> >> In a presently unused leaf? Or one of the unused registers of leaf x01
> >> (with the gating flag in leaf x02 ECX)?
> >=20
> > I could establish leaf x06 as a 'domain info' leaf for both HVM and PV,
> > have EAX as a features bitmap, and EBX as the max_vcpu_id field.
> >=20
> > Is this satisfactory?
>
> Hmm. Personally I think that all new leaves would better permit for multi=
ple
> sub-leaves. Hence EAX is already unavailable. Additionally I'm told that
> there are internal discussions (supposed to be) going on at your end, whi=
ch
> makes me wonder whether the above is the outcome of those discussions (in
> particular having at least tentative buy-off by Andrew).
>
> For the particular data to expose here, I would prefer the indicated re-u=
se
> of an existing leaf. I haven't seen counter-arguments to that so far.
>
> Jan

I recommended Matt originally to expose it on the HVM leaf for semantic
cohesion with the other domain-related data and because it's strictly just
needed for HVM, at least for the time being.

It is true though that it's not HVM-specific and could go elsewhere. There'=
s a
fiction of choice, but not so much in practice, I think. Re-using leaf 1 wo=
uld
overload it semantically, as it's already used for version reporting (just =
like
other architectural CPUID groups). Leaf 2 could be an option, but it's some=
what
annoying because it leaves (pun intended) no room for expansion. A potentia=
l
new leaf 6 would indeed need to ensure only subleaf0 is implemented (as do
leaves 4 and 5), but otherwise should be pretty harmless.

Andrew might very well have wildly different views.

Cheers,
Alejandro

