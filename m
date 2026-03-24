Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALfkCU10wmmncwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:23:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8263073BC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260359.1553722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zrE-0002au-Rz; Tue, 24 Mar 2026 11:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260359.1553722; Tue, 24 Mar 2026 11:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zrE-0002Yl-N5; Tue, 24 Mar 2026 11:23:36 +0000
Received: by outflank-mailman (input) for mailman id 1260359;
 Tue, 24 Mar 2026 11:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehxs=BY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w4zrC-0002Kh-EY
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:23:34 +0000
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e38a51d3-2773-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 12:23:32 +0100 (CET)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a126c8aab9so4360659e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:23:31 -0700 (PDT)
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
X-Inumbo-ID: e38a51d3-2773-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1774351411; cv=none;
        d=google.com; s=arc-20240605;
        b=bxXIzzioUleulF8lp3oqPqzDjnT/npLPwqeCLLecDkfC6pV0DwetdSrLBur2d8HVGL
         +99ZlCiGjs13UvTrIth/BM/yL46rnc+UFGcykm4MhK1XXNn8NQlpgucjsXaMGdoMGxC1
         eZXTYAXX4oKhWaglQFX3EuJXNigorqJFiY8WXbzPf9N6ZIWk8Iyj3y8THbx2/iR/yVEo
         1eYlt+NCBd3rseJtUhv01pgs593IkcPT7BXKy9kF4BZ6ChqIqIfW0gosJkvmq2sGjBRX
         IZHVTQqhEYXYkj7mZKVLE74rICiuR3qqNwV/PyNfj8NeKyweESAm8x2m/lRnz5SV+JLw
         SLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bI+UoggsSrpR6xztg5THCBHi5ram0r8EIcBtKHoPF/Y=;
        fh=corJSGMtJoh3mabmUPSxtOfDukuOyhLbOeZGbWzD8HI=;
        b=baCzKy3a0pxggg+g9jtnvwc5x4+beYZlccuu7sDl/88KnoMV254I/TGLLVSo5nM3if
         DP1ybBXYuQCgQLh3OTRWjoY8jxZjgO0bilohdZGtO4JcbZapyD+j9b53lFJOSmnW2skm
         +g5PtFaSd8alNuXVvXfnkOC2k1OFgBQ0LbBOVufEj4eHAJP8pQRAz4UM7Hfa1BprSlf8
         T7YV1U7D8HhrR7wG2fmPRrblNA9x3g/91u6L659uvwJVIVLDh+B4vEEAeQvWmFIqplFZ
         d2QuvUPqkZsisloKlJNqYGqWp5WBbaWtbOz4hgkhtDhrYbP1n13x1JpBOvg8Pjb8wgQM
         SXDQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774351411; x=1774956211; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI+UoggsSrpR6xztg5THCBHi5ram0r8EIcBtKHoPF/Y=;
        b=OPkTOdDdJut2tjexDTKxwZK5yRLpCweK9J9knh/FOPSI9GmwF/X2CDxEVpas51ojo9
         BXLEBOBQ7U2E4bLO45jHXbPkLnme6I5xsiCH0tngCHYBMaAVdQFg1A9Z7XyAKKQppmv/
         OeQmIy+T3apdvbcxTPF4jKyZHK351M/GNAbuMHmKNPg4Nfr2E974LppncCk+1ZYVpIRX
         SJwo3NGGv1sCrTVIxHhCpv6G6m/sCUjpR0f0ky+BkRXYB72ZR3vYxnGs+bdDJ9NBYk2r
         +VRgadKaZRp2IiumLWajzpM2w1RvKunP8asVprsRepV2RPUKOYtrJCMIjekEjYmwrU0J
         lQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774351411; x=1774956211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bI+UoggsSrpR6xztg5THCBHi5ram0r8EIcBtKHoPF/Y=;
        b=cDSKRHBx/wYhsMy8KS+OTa8k4FSuUPUSZ8kQDKjrOfT3XGH1k+EsgIXyn5/odYYJ2i
         OAs4Wwnl/xp1sWE7woDsmsjH8YajXCJFjv0UVqFmdOA5vlLgGs8YQ/ZXHz3c0n1b4BE+
         PUG3yD+OHzZVp8mxDRsYdrO5LACn7/IlLmyLnZZhg3X/NFFLybLKm5DcNeP6Dn6FQs5r
         FXtrWorPL2tDJ57BaKCB1476kU90QLoeLWVVd7MkDZUoXYLTRjTbUJUh9aomprIfvDej
         CCVbnqZCaa8aoVO/5u/i+/pa/G2R3As6kArs9K1/Z8PCh09EUHKavGm+3QtA4pbSicu5
         ad+g==
X-Forwarded-Encrypted: i=1; AJvYcCXcb+cp/JK+dVXWf3IFOa1/ODEcAK4omKs7wrKWOeCX7IXCk2LoWY9KnqxQ0nbgrFqu/tanpP5H3pQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzArCk49ycIDK905jPAd3MZX1BHcEuqRi4w3dpKMeyFZ/Yu5fpw
	EoiPCmX0NU+RZp0uhESNJtb8NRqD3XTteh+4a1jc5p64A0JP+8p65nqEQlAQpCBPvfbW6S1pzLi
	53OHI3ForI+x4alWy26AVfQNphjZqML8=
X-Gm-Gg: ATEYQzyZlcpRmCV0RmLvtjv8M8UV+nLPcRXnUPvISYu98m7OxmuZ8r/SD7unfyyUvdm
	4o6wjBPC5ChXLLz3mbyvNyrLnY4moUzEKgG/qNKlj7wlvz5wiRjPL+1HDCWFuKdar0FsaPlV9eE
	BKHPWG3YyZPVMrKQIHMzf8wcApvCbOUWV45q6LKT8TR9wIHYV1UqXINMyXN96v+ApmHpxSaYlOm
	bqRaApvukKrk7kKsmdxF8mxcrJgFRy0lN13yCn8U1yI6lODdkzOFVdPCLDAAOKY5EgjpG0Zn0g7
	Sbsfng==
X-Received: by 2002:a05:6512:1092:b0:5a1:2a64:202a with SMTP id
 2adb3069b0e04-5a285afe555mr5412712e87.18.1774351410762; Tue, 24 Mar 2026
 04:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
 <c37859f7-bac6-4394-ae12-83e054a1743e@suse.com> <CAGeoDV8v3=b46qrmzmBjH8BN7rs3CRcSAkrOCgHGgr=8+PcuEg@mail.gmail.com>
 <07305e5e-0487-45b2-8518-932dbcd92a13@suse.com>
In-Reply-To: <07305e5e-0487-45b2-8518-932dbcd92a13@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Mar 2026 13:23:19 +0200
X-Gm-Features: AaiRm52sdd9qRb_mrhNTukC6J3kwCeE3yNkK8zD-UM3VITAg-B3N8M3Zfv6aFA4
Message-ID: <CAGeoDV-b6Xn3uzSYZMnaH-xrG=sMwen_av05FPCMJp3OWoO4QA@mail.gmail.com>
Subject: Re: [PATCH] xen/domain: make shutdown state explicit
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE8263073BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:10=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 24.03.2026 11:00, Mykola Kvach wrote:
> > If you think naming is part of the confusion, I could switch to
> > something along these lines instead:
> >
> >   - domain_shutting_down()      for the in-progress state
> >   - domain_shutdown_completed() for the finalized state
> >   - domain_in_shutdown_state()  for the union of both
> >
> > Would that look better to you?
>
> Yes, but please give others a chance to voice opinions.

Sure, I'll wait a few days before sending an update.


Best regards,
Mykola

>
> Jan

