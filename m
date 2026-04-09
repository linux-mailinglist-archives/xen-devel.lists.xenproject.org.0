Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M4uGVjv1mmNJwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 02:14:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05363C4EA5
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 02:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276623.1561987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAd1d-0005oI-3B; Thu, 09 Apr 2026 00:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276623.1561987; Thu, 09 Apr 2026 00:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAd1d-0005m7-0Y; Thu, 09 Apr 2026 00:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1276623;
 Thu, 09 Apr 2026 00:13:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1wAd1b-0005m1-CB
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 00:13:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAd1a-009EU6-G0
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 02:13:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 69d6eeeb-e002-0a2a0a5209dd-0a2a45049702-32
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 02:13:34 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 69d6ef2e-bb33-0a2a45040019-d155dd31e127-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 02:13:34 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43b87970468so192957f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:13:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1775693614; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0/lYVaKlVdBlwOJnNl1FVkd00ZQsQIte56hhogctLplwrjqT+qebBIP18mwVGcXO1
         l7z4DNxVCRWsVs3s9iLk4EIt9WWiJp1sVIlD/G7Ht/f9cETYcJ7RbV/HhdZCSt8Gg8TG
         7keNgRSfpQZlsF1rxBplQAJS+lREj/bVedkNHzCpZMoPLHPlF/d0JlheRw1w11prqJWL
         l5+Z0AB4nrh9bQ6nEkMVv2AvItOiz94gUW44d+azs9UyCiY0bpbFrV22xNuBqVxlow6u
         w+fTYDG4d9eIH+6VIa5y686LMAjtizzIoAXZDMqDi1ilmTfHErbsf3nOr4Ntr9RxVpK8
         83tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YoBKR9yBDlNC21/0O3XNShWG2QOL440fpgoI5foBZeY=;
        fh=3nwizXhm5seTzn3SGLW2vYNrFe138cEImF99vpnv6Gs=;
        b=PHXQr2lDFMEoDxaI7D2NFV9xwKPREBo0qzj4hWpB/+A29xwQrsfKqeSs3I5YwpWKcA
         yxxsecBtPddlnjuaYA/29qNpbKP0lQfpIh4ErBbkFPMxzKAUvseqrn8S0fh0QTe9OUl0
         pnUJm38d/t7i7ILsC0pF7duVKfUS4a9lia3T64PT/WOT/boRpSwTVbthKI9K/ysr8DGo
         UwxTMRkSs05ge6gX4fD8ix6i1PNmi11FeroG5sEJTuFR6R3UDD2gL3LaOeSolQaqRdT9
         7BfTvUS4RLyhv8OaoFKMyEgHvldF1ZSuGKKr/IEDHMSQCSR7OqBF+0i3SevhwBeUgQZ4
         926Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775693614; x=1776298414; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YoBKR9yBDlNC21/0O3XNShWG2QOL440fpgoI5foBZeY=;
        b=romJroC8cUuTW3L0mRsbg/UJUKtL46QQzfhd6T/7cQmlfa6eAaUXHVWENZVq/6keQL
         gZWQECVjli2jGcSteAPL2x7eK1DTpQ1iDOUMSblsyKYhT+BkjAbQ6xD6R8LCNt54R0Jz
         wl3MGMQIK8K+4jGvlPfZchR/BlSvG4vk4A0gQbJKwGfjfN2pPtxvnxL9mK2MeJgsOvs7
         rptGppz/b5GL/AK5v49ouo6gl+FcN+wyYXyRScEvswkM2j/jzmp1LqTafjFDS7NcXxwp
         g9AqjU/HFyx7Wnpo+fpqxxCT4VTEtWjdZANCuhGUN0pmp3h00Oj8n8/hG9ijJze0IY0k
         Qn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775693614; x=1776298414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoBKR9yBDlNC21/0O3XNShWG2QOL440fpgoI5foBZeY=;
        b=n5+yTPv55vwgy7Ba/nKiEUEitvINJnsxWZiNXFHkJ1sjhj/sFUqpIl53Mn9Y4Kighw
         A4FfVS/pv5Qzneu1FOyS06kuNCgud7wZTPDx5ecg3AP1dDhlSASnbQ+KwxznMEbiK7vO
         kQPVp9BVEvruREZncg3oVydQo5Ll/N8zO2yz6doYqqczP+682bOvVbQ2PjltXqlWf2ZH
         hwpcDockkeJQzZWA3XqvLKJdQP0+jOHNnUdB1DVU+3rmjF44qIlFZxNAwHSGIAvZqfQ0
         AlbwT5Pt6S23Q2cbRNbmd4936ukLliqOla/anFkY+HmIbVpH1EvFQpEIHWhat3fbvpUr
         YVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWY/d6Pqo4roOli91J6++oW4GCc8KrpJyIhplz6uwlIPnT3XDUhgbwAy8zoU4hdiYKdSwdQlQAziSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3bUoM/fCxcnu1bFIx4jYO54Gb1ndMhF/pF/luKU5WkHOXS48Z
	Wjpv+oaLI8o1TsXdBDrCezZRDFz5Qx+HpoYDMwiLqNY4/XMJ+mAXk4ai2lIP+BSCCnuhXCz/g4V
	Sxpukc4zXgOMXCQXsZ09E7FoEz2aH5iNFY6TwLJRzSCrppr5mwZkRP+eOehurkuCbiCFSi/I=
X-Gm-Gg: AeBDiet7swDMbWNdwTgxzy8nTid7amc/QjxTLetzZvTeoQptjX4fuVZBgKvZjijkMZs
	Lk+o09G6sYepHBUDuwvIpJfEgtN6CpisqBxata8pgZZpgzZhi8fkQIUONh2NxPfokAQnR8/5WKn
	i0gWDNCl2oDgqHMPX+IJGIomsc2VeUAPPvYJWtkSyzb2qZ3zoIX6288BMAPYdpxWLY+fbbjTCgr
	L4bTDfqL4wsN038NtF4+S2AOkNi55Osv2miPZioGcmx7l2P2kdkxsytRbH2rvx6OdTUv7ks7aOU
	GEyEQpAA
X-Received: by 2002:a05:6000:18a5:b0:439:b858:1d28 with SMTP id
 ffacd0b85a97d-43d292cd1d1mr34630107f8f.26.1775693613753; Wed, 08 Apr 2026
 17:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com> <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
In-Reply-To: <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 9 Apr 2026 09:13:22 +0900
X-Gm-Features: AQROBzB_v07FpIBvBExmtHpqxpPGzn_2e-9xcUzS7-iF0zqngYxJcJsIUpoMjQU
Message-ID: <CAJ=z9a3cOSMyhPNnAzMaqR2kszmUCgJWKz03FOfNBkFxZ6byPQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="00000000000013eb8c064efbe3c9"
X-purgate-ID: tlsNG-ebf023/1775693614-3253B51B-F630AE15/0/0
X-purgate-type: clean
X-purgate-size: 973
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain,text/vnd.google.email-reaction+json];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[juliengralloss@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[juliengralloss@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D05363C4EA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--00000000000013eb8c064efbe3c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=98=8A

Julien Grall reacted via Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

--00000000000013eb8c064efbe3c9
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=98=8A",
  "version": 1
}
--00000000000013eb8c064efbe3c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=98=8A<=
/p><p style=3D"margin-top:10px;margin-bottom:0">Julien Grall reacted via <a=
 href=3D"https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&=
amp;utm_medium=3Det&amp;utm_campaign=3Demojireactionemail#app">Gmail</a></p=
></div>

--00000000000013eb8c064efbe3c9--

