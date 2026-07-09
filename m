Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SBSGHntsT2r7gQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:40:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE6872F0D1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZnFet37W;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357740.1612087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlEh-0002wJ-AP; Thu, 09 Jul 2026 09:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357740.1612087; Thu, 09 Jul 2026 09:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlEh-0002uz-74; Thu, 09 Jul 2026 09:40:03 +0000
Received: by outflank-mailman (input) for mailman id 1357740;
 Thu, 09 Jul 2026 09:40:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whlEg-0002jZ-Co
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:40:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlEf-00CxpI-Pk
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:40:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f6c6d-2eae-0a2a0a5409dd-0a2a450a94b2-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:40:01 +0200
Received: from [74.125.224.51] (helo=mail-yx1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f6c70-e40e-0a2a450a0019-4a7de033e478-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:40:01 +0200
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-664ce3000e6so1630847d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 02:40:01 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783590000; cv=none;
        d=google.com; s=arc-20260327;
        b=P+PlJE6uQhsAX0z12AuGrZPGxGdKw2DImX9WQGlPPMQ+VVpq4yHB6CLJjQeIfoc0aE
         IwT66SswewhF9zJxvd57ovLaO3XlM9YbyPNnaaXkjPvgWBdRNLgni9T4DdAO5TIR0Qi3
         woR4ggfT/51WHhlPBL07o4NMqxRrhhsFVF8Hwn7fs9rROSSQW764RTPZ1RcXPlji0zIL
         HwpCklrIDOq9ypdnPcg+XoLsI01xJutMsWns6Ez6eS4X3E7SSwSKCqUR/A9sT3E+NFym
         YyvTRStGj3XYFDlwGi2tESlQ/ANA5NPL8pneQbQKMt7RBNOq7ToyzLP2NyXvno50N8Ns
         Yazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dXSTCXF9M505xNK8gWDSnoaUGe+KAoyxX1IiQGnUFTI=;
        fh=aU3/UpxH5Blg8M5NzH55q/XY8irYVWQMVJdPeFRWhhg=;
        b=RW0rC5hmirPKbcmBUEpL1pyShlhbLF1+0rmW1YtntZD12O2X2o9wj7Z+sKobqwxBSM
         I0oPEKTkU0Bxlb4Ufs7QT3K3GnLHy783BgrXQUC5dyK/pCD3QucZ7P2QXyIwJlYYRvw5
         f4uA/6PueaYC64X3hE/3iivKXLIJ+UxqRwYkxsp0rNnfxPIhNAaM8x3bgMX44fRacnTN
         yBgsACrnooHDQR+GWtVxhyF1I5IZyqQBUVfPyQoO/7GtTIk8YTzIaNP7kj2zgrEjGtme
         6fBL5NOrGyuDeBY/CmKbYzTsvJVUUdzqPRRj/mS40hSVAKOsh18jW94UROs/KfFX0tdJ
         7P8w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783590000; x=1784194800; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXSTCXF9M505xNK8gWDSnoaUGe+KAoyxX1IiQGnUFTI=;
        b=ZnFet37WzlsJELzbr7wX2m8z/NFDb3Wc0SeaJ4sZkfgpOZ/8OUff8epOl8CDaj9Out
         LnFQAfT4JIF01JDbIV1HRLBSxTjCyWjAGB6bxgJmIGoGfQUi0986+xO1V8J5bUjRMt1o
         GCFjdjgVPvcYoVV4ZmqbtUK8Z0nvFFavq4RsygdTYLhyqc+KuhgtEcowNvEUnFvMMs42
         oezkjS1nBxHK0e/5zMDKOqnwJoJwZWh/r1HTGGjB4xFZEb297iR0vZegjYv9c9hY5FnL
         Vq1VPZ1QcK4P9Tey1QcICSWzpUx8Wv24EEqiDCiDCFZK8F7n0GV9e47j0/3fuAgBDqXF
         sK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590000; x=1784194800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dXSTCXF9M505xNK8gWDSnoaUGe+KAoyxX1IiQGnUFTI=;
        b=OrUNS0bCmIlXS/UnJXmg2R6bCClYgw0I6iOcEityqtYNJoHLEZbWYFSJNsl+UVIlYV
         50HtZ0iPAg5Yk3xsy96NbRCIWHwDYf4wBzO/fn+y83V99G2BYnv8vdZDkqb5jVkoppHz
         FwXhEJD9Kf3XdvKvzEmYn44T847lWnJCzv/NE4/zr/40XQeXOyBB5UB5uGIOe/++rCOE
         M4W83KLXhcAPY9yh7pngD/ac/5ZTKjWJPvsHgGWUDeew1ZngF4YaDdnzSNMptRYLXXHb
         9dB0Vx8xgZPZaK8W8La2kYB5I8TAwdBmU2nQ07TeR5WakdQuGBZNwSxWV9fcMbeHxWT5
         nEPg==
X-Gm-Message-State: AOJu0Yw5yTdKp+n0In0xpPy086AnS7ELMufG3hMLbPow3zOrvlxRfMq5
	ZItuxcexppseVO+qoQ0H9HXEkRVBpfJ6l/Fl9g18iPs2CY4dVD+bNWTtO1SSTY+qv8gD2YEqEf6
	Z68DEXH+4rEgG9e6FktgYjlpxGGUbUzg=
X-Gm-Gg: AfdE7cnGqVRyjkoV5RToesLj3tFho2GrAAoHhoDu37eXsoNMRz2+Zn25mmrQXs9uG69
	RU/UTCxXIfxGeyeZSu4ekWh1FucDnsuAkZhhqCtaTctw3PM4uojAOPJf+Vb7wY55t70IN53KVjQ
	tXrVxqcHUL98VELIzgG7EQ46Ex2b3k+0s15RsIHKSeuiN1Zls/7WCfRyBHquGIVuqkolWNjyvul
	X/56DhPB2aiV0FHcDIqrZe6lrUe+0XmaKyB62mcM7eJq3uK5CZ1yUsSZhKWIaZqSRlZHMFTG7hf
	zI/mOed5UIThCbkrynaUzE/Fchc=
X-Received: by 2002:a05:690e:144f:b0:667:af05:2e8d with SMTP id
 956f58d0204a3-667af054521mr4180398d50.79.1783590000190; Thu, 09 Jul 2026
 02:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-16-frediano.ziglio@citrix.com> <1783519975.8631fc262581453bbf619ec5b2062170.19f421317ed0002807@vates.tech>
In-Reply-To: <1783519975.8631fc262581453bbf619ec5b2062170.19f421317ed0002807@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 9 Jul 2026 10:39:48 +0100
X-Gm-Features: AVVi8CdBD8yDHAevkJJ1A6RSxEBJwrQb4Pahi5qBXt7phdHQwzHPyYPx5oRoz9M
Message-ID: <CAHt6W4cEG0KyO7W5qfpALZGz9q_foSsGp4aF71VTMC=uBVgAuQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/16] libs/guest: finalize PoC
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1783590001-CF537DDE-3A065F3D/0/0
X-purgate-type: clean
X-purgate-size: 674
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,vates.tech:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FE6872F0D1

On Wed, 8 Jul 2026 at 15:12, Anthony PERARD <anthony.perard@vates.tech> wrote:
>
> A note about the subject: When taken out of the context of this patch
> series (so once commited), we don't know what "PoC" is refering to. In
> "libs/guest: finalize PoC", it looks like "libxenguest" was the PoC, but
> it isn't.

It's referring to the previous "PoC: libs/guest: use foreign copy
during migration" commit.

> It feels like this patch wants to be merged into that other PoC patch,
> and have a patch description completely rewritten to have something that
> doesn't looks like the description of an experiment.
>

Definitively.

> Cheers,
>
>

Frediano

