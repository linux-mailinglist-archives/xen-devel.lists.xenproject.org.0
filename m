Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBRMAKJw52ke8AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 14:42:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB643AC7D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 14:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288948.1569171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFAQC-0000Yq-T1; Tue, 21 Apr 2026 12:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288948.1569171; Tue, 21 Apr 2026 12:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFAQC-0000Vl-QF; Tue, 21 Apr 2026 12:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1288948;
 Tue, 21 Apr 2026 12:41:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tamas@tklengyel.com>) id 1wFAQB-0000Vf-5c
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFAQA-003noz-HJ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:41:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tamas@tklengyel.com>)
 id 69e7707e-e002-0a2a0a5209dd-0a2a4509c27a-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 14:41:42 +0200
Received: from [136.143.188.12] (helo=sender4-op-o12.zoho.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tamas@tklengyel.com>)
 id 69e77084-2497-0a2a45090019-888fbc0c4353-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 14:41:41 +0200
Received: by mx.zohomail.com with SMTPS id 1776775296437583.6720455353529;
 Tue, 21 Apr 2026 05:41:36 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-415e568a7ecso1732685fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 05:41:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zmail header.d=tklengyel.com header.i="tamas@tklengyel.com" header.h="MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type"
ARC-Seal: i=1; a=rsa-sha256; t=1776775298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dCyPkP/THytrH7lXQA3DSh0pSS3eezlWEivjYAhLcqcRThpG2evEhq5XXU+NZdjIVlODw/mS60WjTWzNdrXOf06DOSfjPrgzwaIQdteSuCu8O6JXnP30Oj6h/UIlw4htCV3r1cht+5fi3EjfHvrQt7cqWbe09MfT97hy5we/KME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776775298; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LlkMuZfQjLigKOcgc4RUDQi/iQqyZKZyTcPalzo85jo=; 
	b=CkQK138KOqwn+0BsJnsSN/zpDkAQZF1iN6ZoihXHhQW7t34+672qpDnCdFVFuGd1NXX01MwRjyB83Viuo2Pbs4MfSsZvW7VQ7dlJ8qkcfYw7bNEpwjo332QEAPcbIrdv0EA3HVWXl6WdBOHlttFegJk6blVp+b7p7GsUby6/U9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776775298;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=LlkMuZfQjLigKOcgc4RUDQi/iQqyZKZyTcPalzo85jo=;
	b=GE0IjCdshD/1hK6pNuDLfWERhwgR566rCDwiqChmcBLMc4y4HfGe9q/PqnKdcGRV
	A7g0OIxaG/v5T632idc1cR7GEuEAA71brWh1aZSne1lWA9cQA6Mu0sYR5AuXkualgej
	+L1Ff6/4mQR774l/tE4vINnuj5d7Zg7zKKq9WYDQ=
X-Gm-Message-State: AOJu0YzFqpZCvU/KlB/SYmpQOqrFkE1A0KGCU1z/boNoUaQNRYjno5yp
	SaM+0RjdCPHGvW2vASy9pE7cZC6fwiOtKzHJsMP88XCYVZ33QAn70PdiLk60dQWH68zlKpBTG6D
	g77Ozflla/pxBBP2NtDVdrrPRWFrQaTA=
X-Received: by 2002:a05:6871:384e:b0:42c:2464:4ec3 with SMTP id
 586e51a60fabf-42c2466f612mr1665283fac.38.1776775295584; Tue, 21 Apr 2026
 05:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com> <20260420213206.208750-9-Rose.Spangler@elektrobit.com>
In-Reply-To: <20260420213206.208750-9-Rose.Spangler@elektrobit.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 21 Apr 2026 08:40:59 -0400
X-Gmail-Original-Message-ID: <CABfawh=trqX6Gx3udVpaYDiLRcG+99SHNmK4s9f5pjmNbCMM1A@mail.gmail.com>
X-Gm-Features: AQROBzDgFampPPP5f09O2e0AsTkKwKS-saSa1R-zl-sMd6o37GUCmh3nTwJbHo8
Message-ID: <CABfawh=trqX6Gx3udVpaYDiLRcG+99SHNmK4s9f5pjmNbCMM1A@mail.gmail.com>
Subject: Re: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and
 move declarations out of p2m.h
To: Rose Spangler <Rose.Spangler@elektrobit.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: multipart/alternative; boundary="00000000000056d194064ff7bc21"
X-purgate-ID: tlsNG-bad1c0/1776775301-484A9A53-23B6948E/0/0
X-purgate-type: clean
X-purgate-size: 1078
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tklengyel.com,reject];
	R_DKIM_ALLOW(-0.20)[tklengyel.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tklengyel.com:dkim];
	FORGED_SENDER(0.00)[tamas@tklengyel.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:Rose.Spangler@elektrobit.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[tklengyel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamas@tklengyel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BEB643AC7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--00000000000056d194064ff7bc21
Content-Type: text/plain; charset="UTF-8"

The following function names could reasonably drop the _altp2m suffix:


> - p2m_get_altp2m -> altp2m_get_altp2m
> - p2m_set_altp2m -> altp2m_set_altp2m
> - p2m_reset_altp2m -> altp2m_reset_altp2m
> - p2m_activate_altp2m -> altp2m_activate_altp2m


Tamas

--00000000000056d194064ff7bc21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div><br>=
</div><div>The following function names could reasonably drop the _altp2m s=
uffix:</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
- p2m_get_altp2m -&gt; altp2m_get_altp2m<br>
- p2m_set_altp2m -&gt; altp2m_set_altp2m<br>
- p2m_reset_altp2m -&gt; altp2m_reset_altp2m<br>
- p2m_activate_altp2m -&gt; altp2m_activate_altp2m</blockquote><div><br></d=
iv><div>Tamas=C2=A0</div></div></div>

--00000000000056d194064ff7bc21--

