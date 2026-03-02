Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D7XNuNjpWn0/QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 11:18:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F21D6499
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 11:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244088.1543553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx0LU-0002yY-Gu; Mon, 02 Mar 2026 10:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244088.1543553; Mon, 02 Mar 2026 10:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx0LU-0002wl-EH; Mon, 02 Mar 2026 10:17:48 +0000
Received: by outflank-mailman (input) for mailman id 1244088;
 Mon, 02 Mar 2026 10:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkMV=BC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vx0LS-0002wd-B2
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 10:17:46 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d9397df-1621-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 11:17:45 +0100 (CET)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7d4cb7e10efso5239468a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 02:17:45 -0800 (PST)
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
X-Inumbo-ID: 0d9397df-1621-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772446663; cv=none;
        d=google.com; s=arc-20240605;
        b=W8lZJoN7fumb+K6RhBFj3W1fsrAHBwAJYzbFj/SHjPfn9BOE7Jo3wY+wpd/Hv6G6iS
         gzKbvMqKT7PxEPQWFP08FbejfWJFUL7czHBjTyGBfbrybE6xZOus/irFTcFC7tGxnwHI
         GykVDQ7Xmnv+YN5YX6ju+SEeI9WTXIs72IAhjt7QrMULMOgP7pEy5aDZkeR+XfNqCLhg
         WJblEazbG3RVk2oAkzbcb3zWdCUN/6Cc9V3Kes51yRZSvbUXAdiUqX6Q+9dRtYKV2TyM
         GMl7wshLUn62bjEk84VoxYdyy/FN/uKvEHGu+AwdH6SF5pD+dZ8aAHmjilHCvcFk+Uqm
         poBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3ZO1uASJ+Co5Rgal8hutKQ00YGgsluww0BnDoaGtWs=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=CL6/LXg0QBeM4zrz9hYsJ6BZlJhQOpC5PWDceVfATUAZ6G6BAhXd/rTha1fcdzMyJT
         1OcuCiIOOPgCyXpJBFYCdcAttiJQuIKUJeBO1knJTpTfjf7/kM3Pb5wI17QJn10k8LOq
         x48JBHcDvP9fLOm8z4/81rEc4Oo+aR90jFefYEjmxhQUIQbmdy+SjTLiAGKX3XPf7W/H
         IdrufOGs+dZ1ucSFMHGiFmN0rtKkgHt24O4K4Bk3dWSzP4FBaNSXVJIQCTpivBXpvnJT
         aT6F4V4iBuuf6I4wHWsTIjxJ/eP/2DEmglBWGtXHlk5rFlS7ShQqxyeu0bBh1EXRpaK8
         Va6Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772446663; x=1773051463; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3ZO1uASJ+Co5Rgal8hutKQ00YGgsluww0BnDoaGtWs=;
        b=SYhaTRd5yYfJ5Ffgh8aUxolekQMRwizWk9Q2ig/GkCEer46yxt4cVRHnJWFAIV8XiY
         3+nz6/QBbL5ceAFzakfaJ7PoYB9skMHWrzJZhmXCTjuLW2JJg8I0ApZ6Y+fFKsPDj8U7
         Ln1ZJM1GFruW5gNp2dksoVael+2LcSmSwrhsh2u2i9FqjP4Hvi/ghK+VC+kysguFfJ/S
         V+toeFxGnNoxBozAX2qUYXY51a9ww9CPWmDzptA2nL7rF+sTtRSq6d+ePIyvYdCB3eF6
         4Fzhq+87eZbcT+p675O+uRbq6DlygjEDvo6surCN+/JD90UJChs+VvoiEmSEcd3btBqo
         uJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446663; x=1773051463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3ZO1uASJ+Co5Rgal8hutKQ00YGgsluww0BnDoaGtWs=;
        b=rXH/qo7gtgoqR7YXqU/qTS2dqKlErgK7scrmBovA6dVl8IA7PHMfu9QZYt/PEaqpC7
         Ua+2xRdcfxXyxYHNjMrqPPH/xyjNLy8KkHKfTf+ZM2usCXlORjUrmLEHwuvT4ae0DKeN
         LVY38AcFvq083L4MxO26ojVtAqTma9PTy43tLrz4vCNCPUC7Kks/Qw2Ob25J9iIHEKna
         yoTnvdZ2prwfqQfLxhwFP/gwegw9DvNM0aK/PrMO7zOny2mKJ++Ut3EwSRKxanj3uPkS
         9kRoFCDCuN4SoME7Sen6joW5YpL+a6LU046njlg9L5i13JXoj2//GIrAa3DtDZPx6ZKA
         ipTQ==
X-Gm-Message-State: AOJu0YzTEVE+ywDbTBMI1SrQzOgAmCkdLAIchFjgTiqFChLfai4sZjB/
	M6rd9hC1m+zDzu0lVwHLyjofnWlY0wwG1jMgW1Vepbuwy86HOpglQBYT12WXpUh+saVxFrMtBCI
	6jcgBPfKbNdiiFdUjPhupmAWc8+7NeZRzufVZVmfeGg==
X-Gm-Gg: ATEYQzxs+G/Iph/smhv96b6jzQM85FnXnLbgRkAN0tzFPJlDA7MjoY8S2uZZuHdDqZi
	OczxMDjxGhloHF734uOOkVDdOaQkiN6as1oDMnoZQcbRdOtXTsEjBjQhKVYChKCwfUdH1Mr35C+
	uCgwXvGr7xyh4ajKfq/PHVraMR202jvhUTdimVicrXyuPNunhTCU5eY4AH86DLI8aQs3LQsJHUo
	cjy564yv32nNF3vk4zQXVdnoAyeqA6ETlTPwlt34Ebu4RGGyd4tIGY56/qw070yMSjrnD27KBWz
	Vsf/1m6lE4WuijIB0xNGeRW/FwYzT5A50HIrpA==
X-Received: by 2002:a05:6830:3885:b0:7cf:d0f4:125c with SMTP id
 46e09a7af769-7d591b39d2emr7633324a34.8.1772446663588; Mon, 02 Mar 2026
 02:17:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com>
 <0a5f66eaa16f262d4ffad6a8ec4b1b02461f96c1.1772013062.git.bertrand.marquis@arm.com>
 <CAHUa44FSq6aHTO=HWNOB1Qa5keuEfmhwpSW4hRjVgQdUX0fjmA@mail.gmail.com>
 <9B608F0B-E564-42C6-9F85-E1701F707554@arm.com> <CAHUa44Fv9LuYED_jjW3UeEDZLjL==s0Myw2vD7PSHPUgn-OC3Q@mail.gmail.com>
 <6A629240-E2E4-48E4-A79A-031D7258D676@arm.com>
In-Reply-To: <6A629240-E2E4-48E4-A79A-031D7258D676@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Mar 2026 11:17:31 +0100
X-Gm-Features: AaiRm50zOMA5LIWMWegHhrVX_S7JC_m-Q-BKdfJNBhLq6IREC8sVwrB1NYlxYgw
Message-ID: <CAHUa44GhYCGpWXryo3SEBnB_6iFLAZesbsv8H1xENF3P=+Dn+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: ffa: Cache SP partition info at init
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,linaro.org:email,linaro.org:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 465F21D6499
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, Mar 2, 2026 at 10:58=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 2 Mar 2026, at 10:32, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Mon, Mar 2, 2026 at 9:51=E2=80=AFAM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 27 Feb 2026, at 11:39, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Hi Bertrand,
> >>>
> >>> On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
> >>> <bertrand.marquis@arm.com> wrote:
> >>>>
> >>>> FFA_PARTITION_INFO_GET currently queries the SPMC on each call and w=
alks the
> >>>> RX buffer every time. The SP list is expected to be static, so repea=
ted
> >>>> firmware calls and validation are unnecessary.
> >>>>
> >>>> Cache the SPMC partition-info list at init time, keeping only secure
> >>>> endpoints, and reuse the cached entries for SP count and partition-i=
nfo
> >>>> responses. Initialize the VM create/destroy subscriber lists from th=
e cached
> >>>> list and free the cache on init failure.
> >>>>
> >>>> SP partition info now reflects the init-time snapshot and will not c=
hange.
> >>>>
> >>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> xen/arch/arm/tee/ffa_partinfo.c | 205 +++++++++++++++++++++---------=
--
> >>>> 1 file changed, 138 insertions(+), 67 deletions(-)
> >>>>
[snip]
> >>>> +static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
> >>>> +                                   uint32_t fpi_size)
> >>>> +{
> >>>> +    const uint8_t *src =3D buf;
> >>>> +    uint32_t secure_count =3D 0;
> >>>> +    uint32_t n, idx =3D 0;
> >>>> +    bool warned =3D false;
> >>>> +
> >>>> +    if ( fpi_size < sizeof(struct ffa_partition_info_1_0) ||
> >>>> +         fpi_size >=3D FFA_PAGE_SIZE )
> >>>> +        return false;
> >>>
> >>> Would it make sense to check that fpi_size is well aligned with struc=
t
> >>> ffa_partition_info_1_0? If it's an odd size, we'll make unaligned
> >>> accesses below with memcpy(). But perhaps that's a bit much. The SPMC
> >>> isn't supposed to provide garbage.
> >>
> >> Memcpy should prevent issues even if accesses are not aligned.
> >> If we had this test, we cannot return an error to the SPMC so we would=
 have to
> >> generate one to the caller. It is simpler i think to handle non-aligne=
d as we do not
> >> expect the SPMC to generate such a case.
> >> Tell me if you agree.
> >
> > We dereference fpi below, and depending on compiler flags and pointer
> > types, memcpy() might not be safe with unaligned pointers.
> > From 6.3.2.3 Pointers, paragraph 7, in the C standard:
> > "A pointer to an object type may be converted to a pointer to a
> > different object type. If the
> > resulting pointer is not correctly aligned for the referenced type,
> > the behavior is
> > unde=EF=AC=81ned."
> >
> > I've seen past examples where the compiler optimized memcpy() in a way
> > that breaks with unaligned pointers.
> >
> > We don't expect the test above to fail, but if it does we will not use
> > the secure firmware. I think refusing unexpected sizes is even
> > simpler. It should make finding eventual errors much easier.
>
> In the ffa spec, the size can grow and this is why there is a size field.
> FF-A expect that we either ignore or copy without looking the extra
> content.
> I think we should not be dependent on any alignment so we need to
> make sure we do the copy in a way that is robust to non alignments.
>
> >
> > So my question above is whether it's worth checking that fpi_size is
> > well-aligned, or if it's so unlikely that we don't need to consider
> > it.
>
> I think we need to find a solution where we handle properly things even
> if the size is not aligned.

I agree, that's the most robust.

> I though using memcpy would protect against
> that but maybe we need to use a stronger solution to ensure that works
> even if data is unaligned.

memcpy() can be used, but the pointer values must not pass through a struct
ffa_partition_info_1_0 pointer or such.

Cheers,
Jens

