Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLPRAHuFjGmfqAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:34:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D2124CE5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227642.1534071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAMY-0000kt-U6; Wed, 11 Feb 2026 13:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227642.1534071; Wed, 11 Feb 2026 13:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAMY-0000ir-QC; Wed, 11 Feb 2026 13:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1227642;
 Wed, 11 Feb 2026 13:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqAMX-0000iM-Dv
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 13:34:37 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ab86c9-074e-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 14:34:28 +0100 (CET)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-40438a46d7cso3736076fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 05:34:27 -0800 (PST)
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
X-Inumbo-ID: 62ab86c9-074e-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770816866; cv=none;
        d=google.com; s=arc-20240605;
        b=Yighlu7npQni3HJx2ETBbsHQ+S2S/tUDLtKWutXvwcvRIDrUCaFvGDkHjwEhk5uY9g
         UGMPVMeT7rr4koFQ+YJR/NkTgrIIjDCczhBTH7/YX5bRTxL07WG/5I065rDYARLSvU/T
         RqPD2oqptFaWPsJMfixY+IzpM8MgGCMYcj4UI74wCUE9yaTNOuKY5Mg4wEY+IeUtIKTp
         KMddQYh0b12m1pzorzXqDkCrvYuqZiTjJRXYJbmV0Avw5+ACBaEl+8PGzfG5d8SQVp8f
         lQqTC9pUI53GOmERzZSQpXDUmiJZuA2Jw4eSsan0qZjZdKqJtB6kQawxCyEYXWTErEYu
         yKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hgfd289/zgx6Zl5oglKYDFkbsqT/nQ39bBDEtorQe1s=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=hUv0OqVLuKeum+Y9rCojBA8StnXHhMt1r9drv9m3VYLnTzfFh2QLBx/E5I5Rxn14ZV
         6QtwD24ZX/hGu3tmo/SPS58USMkGl98S3ShnYbwEcBy7jR0TXibu72CmQ89qmAVJdFJp
         a1gmUEja08wydcnHwJHbGvfzobJViAVmElmMN20dBBKqVXbGQOwH/EIf1SrSuWof9w2I
         mawaHPNg0LaR1xi6VZ4fO6UKMgH85QxxkxD8A1y/s044Z5inRHo5i9tJT/ZKDhpx6pVJ
         Or49TfunPg8aj3WPXoQRGZ81UDBWWMKQG4f401wHEx/TT12rfDWUf4L3YX4QcmovR1Qj
         QbZA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770816866; x=1771421666; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgfd289/zgx6Zl5oglKYDFkbsqT/nQ39bBDEtorQe1s=;
        b=dnqSSkMWndIXZ2XdQHeaCwpAwDMOrvr019W0ea5/E8+4sgVOE7zC32eEdBdKrhTNP1
         ix1ayNDfhsHMHDSxkZFaOKYWrIVlk8Uxefamqhf2qomiXn93Z7NVKqlF2uUDSFwpnPOm
         7tWYBPGgWZKAf0qOky0EAYWkDO9PAxrKCKKPQSuaRB7kGLQReAwR8Sq1Jmlh9eBJl9YL
         jsIbozEjyvjBB0Qbie9y0eswizYHXka8YaxfwIusfMAX4nABaR2/+HXSEYV9jZ6TI7+n
         LbycJ5LkddtalLvDY5EsmbtnB4r3pZ/3Ec4VRrGCQKdcFHPWYdKDSCJh8QsmHHfBFbFn
         /56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770816866; x=1771421666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hgfd289/zgx6Zl5oglKYDFkbsqT/nQ39bBDEtorQe1s=;
        b=OeKCG7UlwKTFckyHwJ9Ni6hV7Ry3lfq3Xtn3ap87wUsjgYfFQtI1QegGSkc0e7/tLK
         EGZlUiLDFU4h617GOtkkfFjBVEk3ggNXRXnsfGGFjxRJqNK6P6igBYbg70sWdqN5nYOs
         HtszedNhxQlUndRLZXTZyo+3ZBsZm+dAh9RCeogda3A84zjdh+YX20XjjGoXSmfm2Rpy
         LusIppDzhu84/BQ0XhsBXotpUimXoKn5T+UgFltXJtwk11qeCvhWHT5H1/HnTUjdevFi
         lv2GWo6LDarmSGxjs87neXVbFPjQn4BprEkc53eMR/Bp5J6jtr8tKbND4y63m23FHMEg
         9ZQQ==
X-Gm-Message-State: AOJu0Yy4Q5wKAFPhJjX+gqOvyUJ/ykxZb3jNPajWH8MC0jwGmLdVtotv
	DCGOg8fGZbd/5bhfr1aZ1oTOHfyUnyd+NiKmgInYXpPO9CqN1fB8AiPj6Kf28OFyoh7Mr5r6Ogn
	lPqCZC0lw4jLCgndkF/8Oq5coNI3XkcgGrCmhTzQbNg==
X-Gm-Gg: AZuq6aLMSIoAasj/oy184uBVfNqBF7/56NLucKUbwXlc2mpDMWII7yVvPOsChLsECu5
	A2Sl+r5ErB/c4FBKrNV/KxiUGkZbygmsSd9h2hxXnEeWMocqrZikyLHpRi6JDJPstcKvtG6OShP
	GWaQI+Op+141LXaugQwFMdu55QpvFleS4ARIVFwLXueN6eiV9yJp/D6g80hJuCUEzP83IUa4gSG
	YuOJqLDe1W++5gWOPJAhAsCVceFe3LUM5PKlkko6z1fmqsYpILTRJgdGWtpOlk20YoitnTNA0b3
	3HPZ3ORfzFyYPs8PD30kknbMNHSF5vI368WyTg==
X-Received: by 2002:a05:6871:1d6:b0:3e8:9747:f8f8 with SMTP id
 586e51a60fabf-40ea96535c0mr1675351fac.51.1770816866237; Wed, 11 Feb 2026
 05:34:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <5331b33343441028d10c290b21b82acce295fff0.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44FWRepyAakwXLjObbA=8O_LMBR5jk0-WEAXZdgsQCsHOw@mail.gmail.com> <26A3747F-0313-437F-B461-F5C70CE1A4F1@arm.com>
In-Reply-To: <26A3747F-0313-437F-B461-F5C70CE1A4F1@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 14:34:14 +0100
X-Gm-Features: AZwV_Qh6FQSYvVJe-MQ-Zkout2bZDAegCvLXVbX6lQe7lBf9TNxTcIBHsJ7pfv8
Message-ID: <CAHUa44E9OUhmyGw-897RzgJmrxXMtg5RXrWKXHQueqY7zJ-dkA@mail.gmail.com>
Subject: Re: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,linaro.org:email,linaro.org:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 855D2124CE5
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 12:27=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 11 Feb 2026, at 09:17, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> FFA_FEATURES currently accepts non-zero input properties (w2-w7) from
> >> guests and advertises several ABIs unconditionally, even when firmware
> >> support is missing or when the ABI is physical-instance-only. This can
> >> mislead guests about what Xen can actually provide and violates FF-A
> >> calling conventions. Some SPMCs (Hafnium v2.14 or earlier) also fail t=
o
> >> report FFA_RX_ACQUIRE despite supporting it.
> >>
> >> Update FFA_FEATURES validation to match spec and firmware support:
> >> - reject non-zero w2-w7 input properties with INVALID_PARAMETERS
> >> - reject 64-bit calling conventions from 32-bit guests with NOT_SUPPOR=
TED
> >> - return NOT_SUPPORTED for physical-instance-only ABIs
> >> (FFA_NOTIFICATION_BITMAP_{CREATE,DESTROY}, FFA_RX_ACQUIRE)
> >> - advertise FFA_INTERRUPT as supported
> >> - gate message ABIs on firmware support:
> >> - FFA_MSG_SEND_DIRECT_REQ_{32,64}
> >> - FFA_MSG_SEND_DIRECT_REQ2 (also requires FF-A 1.2 negotiation)
> >> - FFA_MSG_SEND2 (or VM-to-VM enabled)
> >> - report MEM_SHARE_{32,64} only when FFA_MEM_SHARE_64 is supported
> >> - stop advertising FFA_MSG_YIELD (not implemented)
> >>
> >> Update firmware probing: drop FFA_MEM_SHARE_32 checks (deprecated) and
> >> add FFA_RX_ACQUIRE to the probed set. If FFA_MSG_SEND2 is reported but
> >> FFA_RX_ACQUIRE is not, assume RX_ACQUIRE support and warn to work
> >> around the Hafnium bug.
> >>
> >> Functional impact: guests now see ABI support that reflects firmware
> >> capabilities and Xen implementation status. When SEND2 is present but
> >> RX_ACQUIRE is not reported, Xen assumes RX_ACQUIRE support.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa.c | 62 +++++++++++++++++++++++++++++++++++++-----
> >> 1 file changed, 55 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 6de2b9f8ac8e..e9e020bb0cb3 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -91,10 +91,10 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[]=
 =3D {
> >>     FW_ABI(FFA_PARTITION_INFO_GET),
> >>     FW_ABI(FFA_NOTIFICATION_INFO_GET_64),
> >>     FW_ABI(FFA_NOTIFICATION_GET),
> >> +    FW_ABI(FFA_RX_ACQUIRE),
> >>     FW_ABI(FFA_RX_RELEASE),
> >>     FW_ABI(FFA_RXTX_MAP_64),
> >>     FW_ABI(FFA_RXTX_UNMAP),
> >> -    FW_ABI(FFA_MEM_SHARE_32),
> >>     FW_ABI(FFA_MEM_SHARE_64),
> >>     FW_ABI(FFA_MEM_RECLAIM),
> >>     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
> >> @@ -240,19 +240,39 @@ static void handle_features(struct cpu_user_regs=
 *regs)
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >>     unsigned int n;
> >>
> >> +    /*
> >> +     * Xen does not accept any non-zero FFA_FEATURES input properties=
 from
> >> +     * VMs. The spec only defines w2 input properties for FFA_MEM_RET=
RIEVE_REQ
> >> +     * (NS-bit negotiation for SP/SPMC) and FFA_RXTX_MAP (buffer size=
 and
> >> +     * alignment), so w2 must be MBZ for our callers.
> >> +     */
> >
> > The spec (version 1.2) lists them as SBZ, except for w2, which is MBZ,
> > for Feature IDs.
>
> Very true, this should only check w2 which is anyway defined as MBZ when
> not used.
> w3-w7 were MBZ in previous versions of FF-A but are in fact SBZ in 1.2 so
> we should ignore them
>
> > However, if we're to return an error, invalid parameters is a better ch=
oice.
>
> In fact the spec is actually saying the following:
> If the FF-A interface or feature that was queried is not implemented or i=
nvalid,
> the callee completes this call with an invocation of the FFA_ERROR interf=
ace
> with the NOT_SUPPORTED error code.
>
> So there is no case for INVALID_PARAMETER.

You're right.

>
> So in fact i should:
> - return NOT_SUPPORTED if w2 is not 0
> - ignore w3-w7
>
> Can you confirm that you have the same reading of the spec than me ?

The 1.2 spec only says this w2 is MBZ for Feature IDs, and that w2 is
SBZ for FFA_RXTX_MAP. The 1.3 spec says the same, except that in Table
13.14: Feature IDs and properties table, it lists w2 as SBZ.

Note that FFA_MEM_RETRIEVE_REQ has bits defined in w2, and the unknown
bits are SBZ.

Based on that, I'm inclined to keep it simple and ignore w2-w7.

Cheers,
Jens

