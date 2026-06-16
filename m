Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oPJuAe1dMWqfiAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:30:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C3690806
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZpMq6WbQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339309.1600495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUmq-0008QD-7r; Tue, 16 Jun 2026 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339309.1600495; Tue, 16 Jun 2026 14:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUmq-0008Nw-4F; Tue, 16 Jun 2026 14:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1339309;
 Tue, 16 Jun 2026 14:29:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZUmo-0008Np-Pg
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:29:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUmm-00FddU-U2
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:29:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a315da3-5cb7-0a2a0a5109dd-0a2a450b9514-44
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:29:04 +0200
Received: from [74.125.224.44] (helo=mail-yx1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a315daf-212f-0a2a450b0019-4a7de02cc46f-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:29:04 +0200
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-66061993121so4712318d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 07:29:04 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781620143; cv=none;
        d=google.com; s=arc-20240605;
        b=GkIfhHT4HMRtNP0G6vQLs+Wo5PVRVDac0DbPeoIHQ84Zc6DTLNnNJo5JkSnVsiXrG8
         nLiFoECw1dckZ27GE2DNuaUNtL9nu3aXq6+JsXcsrWK665vSYLVI6OtWGW6BdQhFgyzf
         bkoLnAt6XuQ/CuF/qjDczB4e1j8lOhj5Zc5L2gKiUwgEAGweXRp4QzUMX/ZJDP87bE8O
         dUc1bOVODt0GohEZkoZB1UUOOemT1ex7SVpkv5XOkFaDZj+T8+cRK/CqzI9c6CL8AIN6
         +2lNRBRjxpB3AvgaeUDNrRWaEw986/HfXLpKTquYNFUaTMP3gZl2mdjRon7tEwitWz78
         YVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Zn9w5al2/YZZ9V57YMa5T4QiMRs1kVYvrWWkCpQORY=;
        fh=xMgxCykwvpWY5mH3OuER2Pjr8NYP4c7sDzDS4rEH5ro=;
        b=Fgf7i72Vwxjs92mqq7yvoKTqxs9rUnw/LwJte2f+zSpaekpPzqP+drcGnJwx4KokeS
         b5DPwEzD26iy4HNZ9Y42JWHlDdgy/g3Xzl9R1NzvrygymjuZ5fcurxrLqOW72eChL3xx
         uxspCSeqQ/irOjDiQ4n+M58NGs3LSCSxQp3dZAmcoFIrIunfouFgrgD02Wm7Ii9BNoRL
         2uwrFux5trewWuqbuhBUFn11mTj/+2iozRXJx3L1Vo7yAIEX4ELlu4Z/uhSEOO2LS/hd
         aNZmGQH8k39iFli5AJTcl342en2O9ziaxRX+E8bdQdQq3EOYNRIpvDRovB9Y9oIqbFNm
         qKoQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620143; x=1782224943; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zn9w5al2/YZZ9V57YMa5T4QiMRs1kVYvrWWkCpQORY=;
        b=ZpMq6WbQ+78hrzvoW25AdgljFXxI4wDUUeqwllk4U45gwhqmqly4bcN4EwP7ASzIho
         Avx/nHpESYmqHSbDMvXWqOyCWcBqYRW49Px0NhT6SOiyU6+zV7nCMe2UiWEVNJIoOgkV
         a0H+oL0vtC3kyj+8UxMjonR9+vOqPSMla7lgu99Bz1v45KlrljC5UwxwlB9ob78/as21
         vkNSADlux573s3T+QoI7onQBtVh2mGB9c9G8wlA9MgCKccoL7KoxQHhKp2KgszyjZum5
         Fo4k/ItW6/cv0jAZ/oS/n+FFuVxOoxF8YNjUg3kX6xLsrRsP+LWA2KcVgArEN71OWGvx
         AjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620143; x=1782224943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zn9w5al2/YZZ9V57YMa5T4QiMRs1kVYvrWWkCpQORY=;
        b=a3xeJmCIylIgWCzWWEesblFlu9D1SwGxVAVOCwF/gxIRvpKHGFK1kL1PbhPKX1MmAL
         /w2ggf4XnoGDPpQnZAOOuB/fthppoUQJJpPQmwb3cD+RtjMpEwKCtuge0j7cLmK7BT7V
         PxFgBT2ijyUJ4NiJ1K0QO6z5RsU+iX/0IcWSJiqRBN7aRt9rh5A910ebDgMvl4wj6x/E
         FrQsS9ILVXGIj4K/ugwDNzpPVhpTyGkv2K/FAEP9fU5RFaushqjFO5cKU/za6Af/dL2y
         sagQltn/qzAHtyTCPgc3+p9bNKYpneYgc7r90cXz8/hcuF54OyEt0GdCktw6qI36Ju1z
         sUqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jXRG0EjQpt2BSWX1/61fsl09f8WdCxQnQKWIFVcRrUcvSXD4Y2J5VAxv7lQ4vNuQg2DwwoxEh0tY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd4U/P5uBNRYpTxgCXwjgTrNA3HNETik6SZqVmzSRviZLb7xKN
	J/Aid+O/ofrUt7yYpEPpeapMJwugo1F2hxve0clPGMD535ABTzes0Panbx8nH0wGtV7W/VWQSiJ
	hBsCiZQ4pH7XbpvNX6X5ou75yTNl24NE=
X-Gm-Gg: Acq92OFGcigaNJ+smUibcLr5bqJrZXiH4PeY3C9XtAQbz8sGzqYJa/SUxWZ7dW6QX9h
	GxWOpjuRGmE9xSGWd++WKqmpCgt19voxMpeJndpFlopDatrN80dIu1HaTvdSJviqM9RgG/7Vawe
	y2QsWEvqAbHbg9i6z3ZyYsV5B7jIil6J7T+qpm5vNkIM1DrS9zhH8sTZYXabE/TSvA4YnHocMHA
	hAbBJE32WY79BpnW8vceXTwQwEvgBz27GOMKl7DSdCiznUEYFSgCiVttZ9p6lFfaaIsV+MQOTsc
	4FMAbWQ+JbGrPCh+agt4hsKWiKBpDKzk4RpZjQ==
X-Received: by 2002:a05:690e:bc5:b0:660:5520:1b9a with SMTP id
 956f58d0204a3-66284e3c4a1mr13389978d50.17.1781620143174; Tue, 16 Jun 2026
 07:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com> <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
 <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com> <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com>
In-Reply-To: <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 15:28:52 +0100
X-Gm-Features: AVVi8CcqAUrOGzIhTfsCCWn5TyNqZr0v4O0ABmKFOuBzWZrFSGVlzDa6hxaUGN0
Message-ID: <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Frediano Ziglio <frediano.ziglio@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1781620144-2007BF3B-4B51C792/0/0
X-purgate-type: clean
X-purgate-size: 1805
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 233C3690806

On Tue, 16 Jun 2026 at 15:15, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.06.2026 16:07, Frediano Ziglio wrote:
> > On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 11.06.2026 16:38, Jan Beulich wrote:
> >>> On 08.06.2026 19:31, Andrew Cooper wrote:
> >>>> Some old versions of binutils ld managed to produce efi files which the
> >>>> matching version of strip couldn't process.  This includes Binutils 2.26
> >>>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> >>>> less broken toolchain.
> >>>
> >>> And we're certain newer versions of strip don't do any harm to the binaries?
> >>> Already towards Frediano's posting I said that having looked at how things
> >>> work there, I'm far from certain.
> >>
> >> I should have added: An option may be to link twice: Once with debug info
> >> included, and once with it stripped. Personally I trust the linker creating
> >> the various headers, including the section ones, more than strip's (or
> >> objcopy's). Yet then I can only repeat my observation that linking PE+ from
> >> ELF inputs looks to be significantly slower than linking ELF -> ELF.
> >
> > That was also attempted. See previous versions. And no, it does not work.
>
> How exactly does it not work? When stripping debug info while linking (as
> we now do for the first two passes), the resulting image should be both
> small enough and correct. What am I missing? The only caveat I'm aware of
> is the Eclair scan, where we should avoid doing any work for the
> "auxiliary" linking step (the one not producing the binary that's actually
> going to be used for running Xen).
>
> Jan

One thing I remember was the build-id was not the same and debugging
tools could not work.

Frediano

