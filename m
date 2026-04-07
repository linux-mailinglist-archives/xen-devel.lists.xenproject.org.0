Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEHSFj7Z1GlxyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:15:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119D3ACA13
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274819.1560798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3SW-0003dR-4C; Tue, 07 Apr 2026 10:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274819.1560798; Tue, 07 Apr 2026 10:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3SW-0003ai-0j; Tue, 07 Apr 2026 10:15:00 +0000
Received: by outflank-mailman (input) for mailman id 1274819;
 Tue, 07 Apr 2026 10:14:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kroupa.matyas@gmail.com>) id 1wA3SU-0003ab-Er
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 10:14:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3SS-001Yag-4v
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 12:14:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kroupa.matyas@gmail.com>)
 id 69d4d91e-5cb7-0a2a0a5109dd-0a2a45078cee-8
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 12:14:57 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <kroupa.matyas@gmail.com>)
 id 69d4d921-ba2d-0a2a45070019-d155dd2fb508-3
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 12:14:57 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43b8e8e7432so3943839f8f.1
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 03:14:57 -0700 (PDT)
Received: from rivendell.hailstone.cz ([2001:718:801:311:4701:d1d5:7bfd:a254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f5016sm52469198f8f.33.2026.04.07.03.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 03:14:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775556897; x=1776161697; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXh+1wXMj23QBLmG6zr994NdcxcqVcLtfsNMsZQfwHU=;
        b=EFga7zFKIoFnS+IuaCNVlMt48J0lWQspI2df9W3phCo8SwjUhpzOKZsQzDm9fo7e78
         mE/Aj7HFBEGiLcVruiZ+i5VVTIfuPCAAR1Fpta0dbSreBDAWCngq81ohvRETuW+y9Uko
         d6VzvhYxO8QPrwXXwP4p2YwumskufKjIH7chuo1x37bRWEIKRGkLuUwYok71e+rlK2nd
         TPnrDstRij21CY5m0MG8uR2m8L2H82MaaJSeNTE4qyvWJyniQ3+z18IoGFIXTssL6pN9
         F/skE1gGgMyvVq8EOCTqggNRjUY69J69t3XyLMYjDhbA9DOUe62s+tmr+/J6XM9kB3hl
         yJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556897; x=1776161697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TXh+1wXMj23QBLmG6zr994NdcxcqVcLtfsNMsZQfwHU=;
        b=SWLg7KQjAE+Dohc7OVwWLQC4bGPbcWEFJntXSRdCyMvqmyfTkdT9L1qR1YaM728+zL
         eYAXQdIqxq60sP1tMy+j4SX8M0uCjCE9RIgyNQL2yYXMR57yReF4x4tZRl2v47qZSGWa
         cQplNteIxH5Ts3IpxxUFNJXwW+NLMk1qeIp4NZNiC3siy7HioNwD+YqZI3axSv7G2NkI
         OjpA/8DVQ9ngZg8tnNDWekO2Z/T2Nq7OBeR3c9kUpejPMpt2zhYgTX8rFQlaJkPfNxhx
         bLKccTykWW3YMvU77rEH2gxPntPPuxItHzvbRyNBo30mOpA5dCJ0a7wEDYM+Lq+L8aXH
         yr/w==
X-Gm-Message-State: AOJu0YzsrjQpjbrqgOtTGTZJo/RkwlhvmNLgUw2Vh2Exdq4b9bS1FPhU
	0nZZ9YX/COIa7e+Zl080BpRaFbAHpLKdhR81aAoQswfsh1/DkaEDEGi+
X-Gm-Gg: AeBDievTOKK1O7UgzMb+GzYr0hMuARxE+gWm+/kxTfRDYTcKkLtiX7MlmGtlgD9BE6l
	aKkw1cDR+ApU4FsaIDVP1rfJsPsUMktPpIBdew81Byap+O9pPP+8XFDOAJ9FH5UmuHAgXekzfzV
	4EYOv4YHP+t/8qTI0WA5/pVjTU3Jwi9eri8Hqx0Vyzxck00Zj34js1sLxtprn1RZF9m4xXfSRoh
	d0nD84LjtHH3dimiMJL6UviGJ11sm00iKc/I9VVVq9BRZoJzqZgLXj/kF0ZofsrKYHCj/ZOhz4E
	wDCeBSaBsuPFGVWYqFA9nHPxfWOlJyAfecccGHjjqwBhE+ndGY02A6UVc8KbvM549MozfvrTjZu
	nrLZHX09xFutVntNqRs6g69S+R54EVS6rao//nwa4jw52rT3dUEroCKB4CkV9WK//StOtBtdn4D
	NSqPC2NaLNupME1sZi0ksjw36YQtsLl8/7m5DpI7MAhYA=
X-Received: by 2002:a05:6000:184d:b0:439:d755:a895 with SMTP id ffacd0b85a97d-43d292ec87amr24640714f8f.42.1775556896805;
        Tue, 07 Apr 2026 03:14:56 -0700 (PDT)
From: =?UTF-8?B?TWF0ecOhxaE=?= Kroupa <kroupa.matyas@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: Xen on Zen 3
Date: Tue, 07 Apr 2026 12:14:55 +0200
Message-ID: <4454038.v2OnDr8pfo@rivendell.hailstone.cz>
In-Reply-To: <1f1cfdeb-adbd-420d-a187-d0007fcad123@suse.com>
References:
 <5490687.niJfEyVGOH@rivendell.hailstone.cz>
 <1f1cfdeb-adbd-420d-a187-d0007fcad123@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-purgate-ID: tlsNG-ef75cf/1775556897-8A54B41E-4E55C232/0/0
X-purgate-type: clean
X-purgate-size: 1114
X-Spamd-Result: default: False [0.06 / 15.00];
	R_MIXED_CHARSET(1.25)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xen.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[kroupamatyas@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xen.org];
	FROM_NEQ_ENVFROM(0.00)[kroupamatyas@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1119D3ACA13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne =C3=BAter=C3=BD 7. dubna 2026 11:05:40, st=C5=99edoevropsk=C3=BD letn=
=C3=AD =C4=8Das, Jan Beulich=20
napsal(a):
> Not exactly, there is an earlier exit from the function when num_roots is=
 0.
> If that line is the problem one, then presumably num_roots < num_nodes, t=
hus
> yielding roots_per_node as 0. Sadly you didn't enable enough verbosity for
>=20
> 	pr_debug("Found %d AMD root devices\n", num_roots);
>=20
> to actually leave a trace in the log. I'd guess the value to be 1, but th=
ere
> being multiple nodes at the same time. You may want to instrument the
> function a little more to be certain.

I booted it with either loglevel=3D8 or ignore_loglevel, but could not get =
the=20
pr_debug to output anything. It did however print a lot of pci and other de=
bug=20
messages as expected.
=20
> For your immediate purpose you may want to change the "!num_roots" check
> into a "num_roots < num_nodes" one (on the assumption that num_nodes
> can't be 0). Whether that's acceptable upstream I don't know, of course.

I'll try that later

Maty=C3=A1=C5=A1 Kroupa





