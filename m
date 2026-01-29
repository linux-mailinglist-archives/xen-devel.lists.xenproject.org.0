Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDPBMK0de2msBQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:43:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F303ADA5D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216174.1526128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNcO-0006Qt-QL; Thu, 29 Jan 2026 08:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216174.1526128; Thu, 29 Jan 2026 08:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNcO-0006Ob-Mx; Thu, 29 Jan 2026 08:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1216174;
 Thu, 29 Jan 2026 08:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y1e4=AC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vlNcN-0006OT-NG
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 08:43:11 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8989087b-fcee-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 09:43:09 +0100 (CET)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-40946982a78so235558fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 00:43:09 -0800 (PST)
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
X-Inumbo-ID: 8989087b-fcee-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769676188; cv=none;
        d=google.com; s=arc-20240605;
        b=cMFWoXrJDS2CNwp5EA5kNkdJNekApYbJTTmoB82t39F9RJizM3s8LHBGOnEgM4NQqD
         7iGf1AucKCwm41UJYwtBJcV6xNxka9pXvywEwROAp5sLvMUjddWvhi9Z0L0zpNaL6hnU
         iYW0zhSUlqOoSMrnBG+pupPsbHDdJWgWXgIKySh+8yuX8fgw3V4fXew+/YZr8Pxc6nmc
         in99g8fVf3B2p8cXFqrNpVti+rajIfv5G0v5u0zaDUEYLEQA7dp0wfHu38lCavyoiT03
         SjrCW9Ss8mz/Rea0W0OCIGFqaTKEl0JavcAgegTnSdSh/M/CX8V7BlAOT1Ip9MIOmEPW
         6EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3uWjpmWviHmnFZdjM+gTchFY+hZt8MHu2e3DILA69I=;
        fh=/PvZ6BBwHiTCZtYFNv4HT6ydfeS0G1NxgPsIWUuewIw=;
        b=XAB/fQzdS0n9CRg42PmtAQpc10KIqscsSez0vw8UYizvg90OW/bJKLI/MwpFsSMIba
         yv3IM1HMbKDbJ0ot+EPFXqL/jgWcgOmHL92x1es/BTVUMco2Mo2/srHSoztm+oHr6vJ7
         tTj4YaQO8UgSSe1dS0GejFkxy50ExG3dPvEBAHQdJrjaoJWslaODZthOgTS/NBirvgIh
         NdLs0dK7MSM2i5DlgSP3uRNqcf0ODn0YBDn/QHhP6W01x4I5GGeEOyoqcqclCfWrFIJ/
         B4MqrMIEBq484HY+WrElETtu/hsHs4QCLcVY9YI0WsIXBqYZ0RPp9aPpjfh1/sQHChwA
         83Wg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769676188; x=1770280988; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3uWjpmWviHmnFZdjM+gTchFY+hZt8MHu2e3DILA69I=;
        b=gR77DwUcPRIR7M6JfBqc1ep8OvqDPXq9qOZmCfLPx5kS6dR2X5G3xlcU88431OnuJL
         r+KOkdWNyBdQ1laBVFshPxdMfwrPWNI5UBPShOsYP86t/x4Ym4Hy/K3PaVoMIMk1yd3b
         6Ptwlm4dZ5y5fIGJAJoHsYOmQ9XgjAicUNtEv3wF2sgujn39at3T/JyJ3bm5F4Yon2Zg
         QTkgJlXApWqS01zU68eTXB4TJt0F7euNKnXLerv3TExkeUVaL0KK9MKu6gFqoZyOgRtv
         fqchD30zA/LOW5WgSmdLajHZSNHBghWxmUxWx7gv1dmDIey6++hsOVjqaDha0FOH+W8c
         sRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676188; x=1770280988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3uWjpmWviHmnFZdjM+gTchFY+hZt8MHu2e3DILA69I=;
        b=EA8lf2Tgci1dS79KgRFJjl7QHW1C/r8CNqMc3tkYyXWcrT/sidPMncFtJuU8Y4nV7a
         PxJ0dypRZFNTR/aK+TAVkvr0FJQ9myf0sXGpjv0/glF7XDP8sPoQLY8sMbBF9HKua5UP
         JgShKngDEig6oBVgSJEs9XP7xBTfHx76bK5jF+IlFIMCkGmEOQJIN9YdRaxBLXSqB3Xg
         DWKioOkMh1zOBZFFsq2vE/L7JBd7ZWUp77BChQgkUCV8N/yVcZJuuOqVpalVI0iZdk0h
         n9YhgNzlZkC7LTROv0x3a6wdxeswv8jYeXxdp5WfqPEwd3/qR3tGiLPhbWmddvH08gZ8
         Hj8w==
X-Forwarded-Encrypted: i=1; AJvYcCUSdrSiQBWM9Mm8HqNDqq++HjNRF4ZNLWd0jmdu1mHa5sOa69Zd985oFOpcYdPDKKfxpOyWSFwo3ps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh6eeRDIUJ4svut341DZ1K2vF94IYowdne+3HXYxdZg5BfaLIs
	a5zIEMiV+GhIG9zmAhY1NoXksk8FOtff27E49jDAIAS9DSb/jwFBHMOreSVeQwxdDcp/pyF3xIH
	fViz7ueH2d9A3KTp9dT1GPfNpdWLz9v9AbHTpJRnG6A==
X-Gm-Gg: AZuq6aLF9D4lV0NF9+wck4iv2bx8ZsbST2H6unDQvy9FG0Qoe2u/bRGX/UVN9kwb+Wj
	A5zkuOZGqilhD1FSFJLLdKwoJbIij7eNPMmmmBtGom4HdRW7GIVL38TyDPkNtYa7ZLdz/FG5A/F
	B9LjcbeP60wI1BHdCsyDPqnGP21dMGxsqPltKkNF01zCKylHJmtnRS0n+f8BgUVNBoe3UqXSGcO
	dAtbNEW1ixIsKK8KVzuroxN4dgKN4XAXKgDpXEheR6W8Ep1qPQrUbqE2WTlh1gzIBxWK3s6YIbX
	Twanx0LjZ6b606pCvTBLHKx2eQ==
X-Received: by 2002:a4a:c81a:0:b0:662:f4cb:208f with SMTP id
 006d021491bc7-662f4cb24c0mr3217225eaf.51.1769676188173; Thu, 29 Jan 2026
 00:43:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765807707.git.bertrand.marquis@arm.com>
 <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com> <afac8ebf-71cb-411b-b821-72d82b24ef7f@xen.org>
 <F0754B87-A862-42DD-8115-6D56206F1045@arm.com>
In-Reply-To: <F0754B87-A862-42DD-8115-6D56206F1045@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 29 Jan 2026 09:42:55 +0100
X-Gm-Features: AZwV_QgXaD-KsuWPs2CnkAc9JR6pzp7WDtV8M0FieG2beZ9mwGUx0w937rQVi60
Message-ID: <CAHUa44EEMyai8eoDvLoArOiO3f-xHcFoj2=-pamyHyetge_M_w@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,xen.org:email];
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
X-Rspamd-Queue-Id: 6F303ADA5D
X-Rspamd-Action: no action

Hi all,

On Thu, Jan 29, 2026 at 8:32=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Julien,
>
> > On 28 Jan 2026, at 22:50, Julien Grall <julien@xen.org> wrote:
> >
> > Hi Bertrand,
> >
> > On 08/01/2026 07:59, Bertrand Marquis wrote:
> >> Gentle ping: This serie has been fully reviewed by Jens and would need=
 a maintainer ack or review.
> >
> > As we discussed during the last Arm maintainer call, as you maintain TE=
E with Volodymyr, you technically only need a reviewed-by from someone from=
 the community with suitable stature to review.
> >
> > I think in this case, you meet all the requirements with Jen's acked-by=
. So I will commit the series as-is.
>
> Thanks a lot.
>
> Would it make sense to add Jens as reviewer for tee ?
> He is involved and knowledgeable in both ffa and optee implementation.
>
> @Jens: Would you be ok with that ?

Yes, that's OK.

Cheers,
Jens

