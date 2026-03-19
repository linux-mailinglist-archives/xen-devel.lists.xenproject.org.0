Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Lc9NPAJvGkArgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 15:36:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE802CCF1F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 15:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257277.1551705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3ETL-0007OC-Od; Thu, 19 Mar 2026 14:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257277.1551705; Thu, 19 Mar 2026 14:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3ETL-0007ME-Kn; Thu, 19 Mar 2026 14:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1257277;
 Thu, 19 Mar 2026 14:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1n9k=BT=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w3ETK-0007M8-Ch
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 14:35:38 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e488c8a4-23a0-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 15:35:36 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5a27c021b58so1106362e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 07:35:36 -0700 (PDT)
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
X-Inumbo-ID: e488c8a4-23a0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1773930936; cv=none;
        d=google.com; s=arc-20240605;
        b=Js1cUsakSMaBM3dS/qhDZ3We2wIWsn3J/dNYBffPIOIY/j+HVWFqjrW9qlYG6vVV+9
         xpFenzGZ2w9Far99Ph27Sw+o0vAdbUuwx4ZkTrrtZS41zpno3IWQDP0o7zsTaNGcKh5+
         8fLRNPWAYaTZZBpmnTmttJd/wx9wjqzkLWF84GmB5DVt7LLvo7bWyxI1P0txt7F/GDKs
         npmHxSX2pdyE5HlSCUcT654+akVHCJ877MW49AlIFe2iAlZPcp0GZQLHk2KcpcyXG4ni
         N+zxt8KZblslaiXMfrqEjBa0QYCUrKDyjPnVxGUw7mA7BRDdHqCfc/CDAn19gg8XXKXd
         L2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZISoUCzIjE59H/rnhW5DHgGID5AZAfvPV/PaJgYMi3M=;
        fh=8JQmPggC+L5NdWbfpQ6+1DbzndGImN/O2adNKUkU4d8=;
        b=eg9arQJqLM1Rtc/0g9uHo8HVK7GCXDn6yx/422WY9SELXqau4xXZswG2T/FT9lubm9
         pE0X6X837YQpnuR8xR3aPzhd3OMdCgzGzoyEiyk4QR0pS+wswJsSHDEdE6gLnGEVPAUV
         PyrlJ5Eg9neolGw+TiT8Dx/rv8drwB6PH9A2QRETe8xBrlT2oG6OlB5I+EXYFavtSVj7
         BidEIAo65lIdoWnYRPQQZC+WHsC+Z8Z16xX+JPttCQ9bG8KKdncDl9NHZ1qm/mIohIlm
         VpISDf/i0tXcmz/cKvBdqrMtwvU0Y2bp1L7Zr1q47TaNV5cdkNsp/sPxIK+mNlyM9alc
         CRPA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930936; x=1774535736; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZISoUCzIjE59H/rnhW5DHgGID5AZAfvPV/PaJgYMi3M=;
        b=G7UX7T6wWT0lzBCSKWl/BLqfGuq12ReJTCIPqbc0hRdc+2HgU2W9qD1lieZV9RltKt
         7laTd2n3RoNtJNbu0Mxe1IjqZMMm4Vi7+HU1oH57oreZLFUm63oemR3jiOiU8DFbn/vV
         iKq1MsRbie5PmKS3KIxGuE5Hr9LFQHvbB5eXfTp35ZwbIzB6DLKRpxYG0ShsRPu5hPqq
         5rH3NJnYzcYa5V/dk6ygpCrp3487KUbLOzSaWAesnnkGidj/FWkNsb7Rpnjp3ON/z52D
         0DHSqIn1CEnEKSlY/1w5peinjg/waIp6JBV5pv6B94+fu3nWfg+ZZHjm92V6XcYBqe7X
         /Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930936; x=1774535736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZISoUCzIjE59H/rnhW5DHgGID5AZAfvPV/PaJgYMi3M=;
        b=DK9DpmcFOQtTeTZR2ZIvxxmaHivO6zVXxpXDU9X9YL0ZBPqliTHhTZo/BhyXITPGDr
         9Vs07kAYQ6GMTo7pTsgZ7aGakLvX07+JagKWcSfUVIPhDD8xi1jZ4DqrCZiDgi5WPKh3
         9jta9so774btuCAwYWTJibLSrW0GUc3ekH5r9nupjHq5F49AusLEin/yK4sUtqq8lGSH
         r/KKUyIXW34JKadesIY/YlncyGhu3v9DdNXQ2D9UwiuCgkQ4TKwlH00z2wX2O9LCfS9n
         OgLmKIvrhht1ooPu9PICp5iFQHkuyGQRmcJ835T+ahhdMVawiWB5yl+gYyKujMN9pL56
         EHPg==
X-Forwarded-Encrypted: i=1; AJvYcCXWXclD+sFT6JftMBHC3/z+YW4Vnfv9ETuXhaFN6kbC/c1bHDQczWaknI1kfyhYdXoRAo43csJm1ao=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+0s8OnOENH/MihB9DF3g7qLMKy5S+4evu5H4Bx7BSAfkm5CyI
	IxbS5Ab90gAuXm1PKjMjLvIyRCvn98EKf5Fjhor2L7meLqiSIxKiGmDyyAA2ShX1g6TAvgHggCI
	4pr3wZpbkKyXK9RpOp2cGy+RaE1dLvkg=
X-Gm-Gg: ATEYQzw+tbNXI1lDz9X5e9qb0+f4JXVp/feaL9vtwYq3yyKjXeMgErejZBIfbhy7h6Y
	y1cBu/x9oyke4PFZhaJq2EMrpS3XY0I2shNrRhGgaWZkgp6pwJ9ZW+BpbUJznMG1R6FINyybNNZ
	zbvhpY+XdkB5BP0N88ypEDStNIUkLTUN4xeIzEhQnUXbfe2yLCOHH90Wi6HW35NupS1LhJsLJ05
	oel6Zkytqlg407/Et2LmW8iw82Y1W3JxVjY+psuDrxoMs8tI8TmodSlH5ydhpEy1371ObeLPpVz
	jU8W54t/PyosOWw=
X-Received: by 2002:a05:6512:66:b0:5a1:4158:ea9b with SMTP id
 2adb3069b0e04-5a2796a2df8mr2111232e87.22.1773930935342; Thu, 19 Mar 2026
 07:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <95dacecdce8f8417562548e16a4d3e11c41a3f27.1773923242.git.mykola_kvach@epam.com>
 <48841930-bb2f-48e7-963a-e823fec70442@suse.com>
In-Reply-To: <48841930-bb2f-48e7-963a-e823fec70442@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Mar 2026 16:35:22 +0200
X-Gm-Features: AaiRm51plBaIJBF49tZgellhC6tE1MWYp9bgMumD56UfxX3-rR0LLnxtGZ3ZlWA
Message-ID: <CAGeoDV8abhMCR2+Pr_A-ZcKoLr_S=Rp_5a1mODrK9UPRzH+OSA@mail.gmail.com>
Subject: Re: [RFC PATCH] xen: handle domain_shutdown() return values
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,patchew.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CE802CCF1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

Thank you for the review.

On Thu, Mar 19, 2026 at 3:44=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.03.2026 13:42, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Propagate domain_shutdown() return codes through the shutdown paths
> > which can still report errors to their callers, and log explicit
> > failures in fire-and-forget paths instead of silently discarding the
> > result.
> >
> > This makes the shutdown contract explicit for callers which can report
> > errors, while preserving observable diagnostics for the remaining
> > fire-and-forget paths.
> >
> > It also fixes MISRA Dir 4.7 and Rule 17.7 violations by ensuring that
> > the returned status is tested or otherwise used.
> >
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>
> I don't agree with this. For what you want to do (as per the link below)
> this is a prereq, but as an independent change I'm not convinced this is
> needed. Once it is grouped with that other change, it's kind of natural,
> and hence any Suggested-by: would feel odd.

I see your point, but I'd still prefer to keep this as a standalone change.

It is no longer tied to the suspend/resume work, as the changes adding new
error cases there are gone. What remains is making the existing non-void
domain_shutdown() contract explicit at its call sites.

So from my perspective this patch stands on its own for two reasons:
- it fixes MISRA Dir 4.7 and Rule 17.7 issues by ensuring the returned stat=
us
  is tested or propagated;
- it avoids leaving latent bugs behind if domain_shutdown() gains additiona=
l
  failure cases in the future, beyond the currently relevant ones.

>
> I'm further unconvinced logging is the right course of action in all of
> the cases. Some may want to be assertions instead?

That said, I agree the handling likely shouldn't be uniform across all
callers. I can revisit the fire-and-forget paths and use assertions where
a non-zero return should be impossible, instead of logging unconditionally.

If I understand you correctly, then without any additional
suspend-related error case being introduced, you don't see enough
value in this as a standalone patch. Is that the right reading?

Best regards,
Mykola

>
> Jan
>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Link to discussion: https://patchew.org/Xen/cover.1748848482.git.mykola=
._5Fkvach@epam.com/7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.=
mykola._5Fkvach@epam.com/#90048f71-8313-4110-924c-f956a2bec5a0@suse.com

