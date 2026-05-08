Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB8wJsFO/mllowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:59:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2E4FBB61
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304233.1577310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSII-000883-6I; Fri, 08 May 2026 20:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304233.1577310; Fri, 08 May 2026 20:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSII-00085x-3g; Fri, 08 May 2026 20:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1304233;
 Fri, 08 May 2026 20:59:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLSIG-00085r-56
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:59:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSIF-00GzQJ-IB
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:59:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe4e36-2eae-0a2a0a5409dd-0a2a4509e332-44
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:59:31 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe4eb3-2497-0a2a45090019-d155a731bd12-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:59:31 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5a74ac8b40aso2279052e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:59:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1778273971; cv=none;
        d=google.com; s=arc-20240605;
        b=RAfYPJSDNBimiDZ9GCrStWAU44bb/+P6lxyQZByV64NLdI90pa1BDrJoUp0ON1J+14
         ugsKiwQYNMF2+uCYeIZW4CQPrsIh7XjIiFuMshGaRT7ZHu8uuDeUD4IGWgterIUWX8rg
         Hn1b5eVOojOkNOEkllg4aPfVy3MvNDdRUkqcmaBwtVGcV+ATnyYoZoOAl+ZUqaTFlaUI
         zizHCvbzKEf+Gj9hYnm8l5BAEU7Iq39fd8M1A0OryT+dIQGz28OuTNNzOaFuNyLYgliR
         Dld55XHBrUjidwYuaJ1pj1aODXmtjLgHADiAO4KpIeHZj9XNmTtGH3Dm5oi/DUjnVh45
         9rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAgts6Lk1e6Br8PJPCkg4d5BLgobGJO5+1d6RgjQF0s=;
        fh=HHRjWkdysX2ZkNpVMY4DcdwfNbPq2J2BPJfxbJK3Acs=;
        b=XqgQaHO6pGZd/dtA2Wf5fTKEIudXx9yhj96TGxbRbswGRqweb3oOp3OBgLb/YXFlMx
         r8bWHM+budCRxG788VmGxMIhd/KoB3qPXab7rHyndBzdMUOKmoeK5DQtYs2IpuMyCKY2
         s4M/aC016Fd9/eL8olWVQe6k8MrF18Zq2+0lA2o3D5M+DNMm/bj77pt5ah7bNCy2B9mF
         tgPhG4M58KYAdS9wanb2gsbDhaoHukroBlEtWdwgr3ZAE4enR0ixKytE+AKjWSU4q2Lj
         sOUz4WV1b3aQCvkbeGaAs//Zgn29QEEL1bkcLE91wSgStu/X8NJz/8nfCtupttNmd3yj
         uMrg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778273971; x=1778878771; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAgts6Lk1e6Br8PJPCkg4d5BLgobGJO5+1d6RgjQF0s=;
        b=RPOH7QRkr3ScB0R0xCn2QHz5pKuPtYv0eCKgp5+MT7Zdjs/03tUB/rGp32ZWiMtHJ9
         mhpJQBySjW9pHnDu/R1Yxrkc+AN8xxsUugwmc/Dc9XvUKtSrd9xVa8pTKcl4AsG2LQpL
         9aTZEUqnTCzXin6CWYHAVrDp6ft0K0f25jHyCZBor4v7Tufu3E1uOsKJ84wGmtVkzDHS
         BqrLhl6hbEqMiBOC9gAAWORf3ULzSj9qcNv3lt65lPTH4VmW21hep3GPCRP50GweisUH
         MBaclul4mVD6rlFHAMespF1aTe5co0GxFGU1BRKQvCLhPSnd/weojHR1gvEeZV6tVGxz
         MJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273971; x=1778878771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAgts6Lk1e6Br8PJPCkg4d5BLgobGJO5+1d6RgjQF0s=;
        b=GMFiE3Ef9oziLyqG5WJGa7CrWxON5Duhvtk/Hi7LcRcN1f/YTSFQrqOwpXSAT47C7b
         U2ltMQ8wH0ZHkF9L/e3xZJ4aSzpyvsyXEd4lWgd3KQBREP3ru3kd9dfAtGRNJ6zihaCN
         kfkIuqoV3G7lMNDb7qWPW0JRN6U7ZZjtd731Jqvp0bLM93lw4niXmdcMN9f+rGJqBuJT
         cCZLaUuwQ9tbPPf2KzHiF/Jn43xymbAb0KxoyhGukZuq6crlxIPsqW/4Xzo64c/iEWxU
         pkN23nkSTA3QcMRIEBgzTEBBrVfJuwlkPiIXkINZF8x4sFNFxuo/gBbVI+hQS//7He1M
         omMQ==
X-Gm-Message-State: AOJu0YxR08oD4L+NwXv8nWlRTK3FHX9AiNJalWiwq+H/TDpGuSqQ3jLS
	3N/A8cUi8aI1wphpwshx5qZ0S1ev6yXZ8+1u4D6VMN1IBCU0zFjXFbZ8lvk0abT6dgU8o8JK9GO
	JoypNxiicWtvvuiTWo55tZk4fKb4RO5E=
X-Gm-Gg: Acq92OGmFnRgi9rlNIIKcwwRRZQdt1Ki/8zkZis4YllDlmNRUVk0++aoYLYtZy+3z8W
	fjl1zGkNkkQZPjO8d3iKrwdjjT9RGQz88oyXpCf//RnXUWHdRT4vFbSJYzpkPqJv8SKomL+DR/1
	8DO7DWfGr/JK8Oo2hmmKMEOTD/E9dHxzlzrN+2X7sopv2sSrrxeuRw+VQ2qaRG+nr9hRTTxRVn/
	wV4eSwZlA8VRG03+4DSY+Gt+92RRv+353phMnrPWGSpWFOJHMS4Ys6SZ+wKklyRbVykxhXawbVd
	vY4JbQ==
X-Received: by 2002:a05:6512:401e:b0:5a4:1096:94e4 with SMTP id
 2adb3069b0e04-5a8b6c9c4f6mr33085e87.2.1778273970416; Fri, 08 May 2026
 13:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
 <873402ub63.fsf@epam.com>
In-Reply-To: <873402ub63.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 8 May 2026 23:59:19 +0300
X-Gm-Features: AVHnY4KwmCRNlh-rjvCBDnZlHGwH0fbsH41MPUKe0T4UvNUHB2xg6MnS1t1Edb0
Message-ID: <CAGeoDV8KppmniGEtRzCeHMLuVdXD-2bRXa_CeOPh8P9xPjiCTg@mail.gmail.com>
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1778273971-43D7FA53-9522E16B/0/0
X-purgate-type: clean
X-purgate-size: 2482
X-Rspamd-Queue-Id: 07C2E4FBB61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,epam.com:email,aggios.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Volodymyr,

Thank you for the feedback.

On Fri, May 8, 2026 at 1:06=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The MMU must be enabled during the resume path before restoring context=
,
> > as virtual addresses are used to access the saved context data.
> >
>
> I agree with Luca, this patch does not makes sense as is. I don't see
> why it should be separated from the rest of the resume path that is
> added in the next patch

Ack. I'll combine this with the next patch in v9.

Best regards,
Mykola

>
> > This patch adds MMU setup during resume by reusing the existing
> > enable_secondary_cpu_mm function, which enables data cache and the MMU.
> > Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
> > to init_ttbr (page tables used at runtime).
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v7:
> > - no functional changes, just moved commit
> > ---
> >  xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 72c7b24498..596e960152 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -561,6 +561,30 @@ END(efi_xen_start)
> >
> >  #endif /* CONFIG_ARM_EFI */
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +FUNC(hyp_resume)
> > +        /* Initialize the UART if earlyprintk has been enabled. */
> > +#ifdef CONFIG_EARLY_PRINTK
> > +        bl    init_uart
> > +#endif
> > +        PRINT_ID("- Xen resuming -\r\n")
> > +
> > +        bl    check_cpu_mode
> > +        bl    cpu_init
> > +
> > +        ldr   x0, =3Dstart
> > +        adr   x20, start             /* x20 :=3D paddr (start) */
> > +        sub   x20, x20, x0           /* x20 :=3D phys-offset */
> > +        ldr   lr, =3Dmmu_resumed
> > +        b     enable_secondary_cpu_mm
> > +
> > +mmu_resumed:
> > +        b .
> > +END(hyp_resume)
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >  /*
> >   * Local variables:
> >   * mode: ASM
>
> --
> WBR, Volodymyr

