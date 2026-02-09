Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HC3M56kiWlU/wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:10:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431C10D619
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225016.1531461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNI1-0000Wj-Sr; Mon, 09 Feb 2026 09:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225016.1531461; Mon, 09 Feb 2026 09:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNI1-0000V1-Oy; Mon, 09 Feb 2026 09:10:41 +0000
Received: by outflank-mailman (input) for mailman id 1225016;
 Mon, 09 Feb 2026 09:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/H=AN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpNI0-0000Uf-2h
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:10:40 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30a5de59-0597-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 10:10:34 +0100 (CET)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-66e35b48d11so840265eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:10:34 -0800 (PST)
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
X-Inumbo-ID: 30a5de59-0597-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770628233; cv=none;
        d=google.com; s=arc-20240605;
        b=XvbTQe8xte4t9n5cgVH/kjq5aojoL4TlAwj39EDZXBQCyaS3ceOhutM6tTzJE5OeUs
         yXBPvOP/K+uv2+8L2NF9J4X79bkEhzvwp9nf7mXC+OR7P4N2VXKpSxhWGSg7cmygnOVd
         8+aggDVEYSCsHq0pLEqNt5IEY34cCZII5lVDQVFXTacKmFm4+Th9PT8Se5VUVA8CVMHU
         J+CGSsviEvivJwCOk1TnX1CRLu+nJfMkytMYO+XdxNsx2RYPfLxUWS4zvmP+DYF1tEAL
         aKyES8ZwogXWuTZwl7hEisxbH3evi2++VLxNGuSjgc55N3R9VkWKLAkypErvDdbdxVHV
         N/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/WgflB2kW5OpebDqrVi1GbSDPN8vcPQ8RjJSmZ7qYTI=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=cLNByov8ie2NkgE1qW+o6YZqI3FaGlO6Z2hzseFIfhQTmqxMip4QgiQCdq9qNsn7S5
         C/IjOXUkkPEZFryeW2rfD/amTUveJhNbmFcf5emKNvGe0TxrvXFV87mSPKgCQdQLLTTV
         AC77a33xQAGtjxUFDwVMs7E6YR9b6S/LHUpyGhhtqru3yzSYApdWv0uTchuEAjUO8PkY
         I6C/SmFgk5mwaqfcbZRyZGv+EYiYC6M7/jeMj3fq6yiiT3H7RPuffFNIYSgYgi3NNb/U
         x7YVdVXNB9xqFZe2WIIAZEE/Ey4I1S3kY4U4bDM+o9o0epJePugyvGQruUi0AZHPV3uh
         qgEQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770628233; x=1771233033; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WgflB2kW5OpebDqrVi1GbSDPN8vcPQ8RjJSmZ7qYTI=;
        b=Z40F6PbFsL90mFUPVP1y8sG89DVVvOJVSA6KxV+wzAhfHttQy4prcFBAdLL85vIyAc
         U1d+b2K035wvSWomN2oORCudzvebPY1QVD9HHEdu3fp1ivKLR+IeXXhHc8druclRZA98
         216fIObHP3gmGRAsuVz9/p2+olLztXmiCGIlh+hkln0CeO25Rm93NS2UJq3Pf1jP8uUm
         yYQ/bnv2VOkYraJ/yz2oV0X7pw9OuBWNV8hh+xkHb8VNRYEj2cpFS76BgxUYQBWWc962
         HHcUgSsWJx8mGu5pWskpjvJ1EgETtl4VxpdL4l1BDsCONGDozzIPl3afoQIxQFAdYaWL
         BNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770628233; x=1771233033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/WgflB2kW5OpebDqrVi1GbSDPN8vcPQ8RjJSmZ7qYTI=;
        b=F9qdM+LJuN/uVf7lAF9irO3gP6OtJZPCi6NNFbdSIXBUjfPUfTvSzPwQ/oD9Q3WOlV
         MoAN64mUcX3CWex0iPveyjkbyFKT4j78TgLOEHHAvudm5DU73cnSqejlGEBqvMuXHCjI
         R7T375etuz63nWnN7Ta+NM1pZ7LTW696fv/PnWCc+IrOwPvRGfV+fZ/vT/Awuhkz0yB9
         cDw22Dl+/6B3lqxvfjZ1ztyZpXC2C9/K1fTzgDX6r58ed2MfRyOY9bVmbAMwgbbyf4a8
         9ATaI3GfaCeoUEasW+o8dwNPLblwWSOA8NqKP7brBA8y38ku5jkFJPEbqgjjxaiaoxjL
         1+xQ==
X-Gm-Message-State: AOJu0YwMhxY48iLkc8Ko4mT95pcXonNTg1yZv23n7z47PKm/qCBuTdfw
	N8pFFr0tfF0qsa/gYXXnnI0G8BgCCoH2QkzIPMZ5vHfMh/ux2MVEBziQ5/AoNE5gVaXkniWcs6h
	npxT4wS9M9n5kKJ5WOqNuaEOglp5AJMfGHcn6AWMptg==
X-Gm-Gg: AZuq6aKjO6nMfGtfLfGiAP+NTutZN+ZPK31p302c3QP3edqfbTBmeJXWE1oVxaZl43f
	U/Ns6/ViDOjjooCfVaFysGp1g0DxRN151ufMjuVc3K1VkHwxXf3qzQc8g6ijJIaePNE1V1ORRwU
	J3SdfUYjyTuqiwHvqV60o721XV/AYfwTaT56A/+jD+to7SR5rUHxJlIvxTl4ZoPcUK6J28H/OfW
	sQ5wfsOjK5XKN8eF3+uDFDadrYR3ikBmyCoObTAXQXG6SOlVCWhKY/s8+Gkj+k/PNGBlqV3cX7J
	uraPtylHl8XISIOurNte37Fw/g==
X-Received: by 2002:a4a:c90a:0:b0:66e:d9c5:ad47 with SMTP id
 006d021491bc7-66ed9c5b0d0mr2307035eaf.55.1770628233302; Mon, 09 Feb 2026
 01:10:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <9886df295f4c4365668576cc956299ee36f36c8b.1770115301.git.bertrand.marquis@arm.com>
 <CAHUa44G9sGWp18EX=Zb-C-jDJn_V6BmEVvnza7t6gcx3rjsRww@mail.gmail.com> <24BD5FEB-06D2-40C0-A928-376A104B9E55@arm.com>
In-Reply-To: <24BD5FEB-06D2-40C0-A928-376A104B9E55@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Feb 2026 10:10:21 +0100
X-Gm-Features: AZwV_QjTAhuTcnRM2PUZAl1grLFxtY5I1I4fFXNDa5F0J_pp5X_NMDZi6zzHWNM
Message-ID: <CAHUa44Fr5KVNdmah-_DPyv-0dq3Lc+wcHo72zjMH72sPjJHD1w@mail.gmail.com>
Subject: Re: [PATCH 02/12] xen/arm: ffa: Fix MEM_SHARE NS attribute handling
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4431C10D619
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 5:18=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 6 Feb 2026, at 10:28, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> The FF-A memory attribute encoding is currently a literal value (0x2f)=
,
> >> which makes reviews and validation harder. In addition, MEM_SHARE
> >> accepts the NS (non-secure) attribute bit even though the normal world
> >> must not set it according to FF-A specification.
> >>
> >> Introduce named attribute bit masks and express FFA_NORMAL_MEM_REG_ATT=
R
> >> in terms of them for clarity.
> >>
> >> Reject MEM_SHARE descriptors with the NS bit set, returning
> >> INVALID_PARAMETERS to match FF-A v1.1 rules that prohibit normal world
> >> from setting this bit.
> >>
> >> Functional impact: MEM_SHARE now rejects descriptors with NS bit set,
> >> which were previously accepted but violate FF-A specification.
> >
> > To be fair, it was also rejected earlier, but with a different error co=
de.
>
> True, will adapt the impact comment to say:
>
> Functional impact: MEM_SHARE now rejects descriptors with NS bit set
> with the right error code, INVALID_PARAMETER.
>
> Tell me if that would be ok for you and if it could be fixed on commit wi=
th
> your R-b if it is the case.

Sounds good. With that, please add:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> >
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa_private.h | 17 ++++++++++++++++-
> >> xen/arch/arm/tee/ffa_shm.c     |  6 ++++++
> >> 2 files changed, 22 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index cd7ecabc7eff..b625f1c72914 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -129,11 +129,26 @@
> >> #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> >> #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> >>
> >> +/* NS attribute was introduced in v1.1 */
> >> +#define FFA_MEM_ATTR_NS                 BIT(6, U)
> >> +
> >> +#define FFA_MEM_ATTR_TYPE_DEV           (1U << 3)
> >> +#define FFA_MEM_ATTR_TYPE_MEM           (2U << 4)
> >> +
> >> +#define FFA_MEM_ATTR_NC                 (1U << 2)
> >> +#define FFA_MEM_ATTR_WB                 (3U << 2)
> >> +
> >> +#define FFA_MEM_ATTR_NON_SHARE          (0U)
> >> +#define FFA_MEM_ATTR_OUT_SHARE          (2U)
> >> +#define FFA_MEM_ATTR_INN_SHARE          (3U)
> >> +
> >> /*
> >>  * Memory attributes: Normal memory, Write-Back cacheable, Inner share=
able
> >>  * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> >>  */
> >> -#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> >> +#define FFA_NORMAL_MEM_REG_ATTR         (FFA_MEM_ATTR_TYPE_MEM | \
> >> +                                         FFA_MEM_ATTR_WB | \
> >> +                                         FFA_MEM_ATTR_INN_SHARE)
> >> /*
> >>  * Memory access permissions: Read-write
> >>  * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> >> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> >> index 8282bacf85d3..90800e44a86a 100644
> >> --- a/xen/arch/arm/tee/ffa_shm.c
> >> +++ b/xen/arch/arm/tee/ffa_shm.c
> >> @@ -512,6 +512,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *r=
egs)
> >>     if ( ret )
> >>         goto out_unlock;
> >>
> >> +    if ( trans.mem_reg_attr & FFA_MEM_ATTR_NS )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out_unlock;
> >> +    }
> >> +
> >>     if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> --
> >> 2.50.1 (Apple Git-155)
> >>
> >
> > Looks good, but I think the commit message needs a small update or
> > clarification.
>
> Thanks.
>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
>
>

