Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qkb6M59aRmoHRgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 14:33:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BA6F7A88
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 14:33:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EeP1nFBz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351810.1608863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfGbX-0000BG-Jx; Thu, 02 Jul 2026 12:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351810.1608863; Thu, 02 Jul 2026 12:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfGbX-00008K-Gx; Thu, 02 Jul 2026 12:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1351810;
 Thu, 02 Jul 2026 12:33:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wfGbW-000088-OQ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:33:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfGbW-007x4h-5Q
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:33:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a465a7f-bab6-0a2a0a5309dd-0a2a4501a978-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 14:33:17 +0200
Received: from [74.125.224.43] (helo=mail-yx1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a465a8c-400f-0a2a45010019-4a7de02bc8c9-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 14:33:17 +0200
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-666275a685eso834316d50.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 05:33:17 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782995596; cv=none;
        d=google.com; s=arc-20260327;
        b=nETdmxlVuAGR5gNY9uc5DmLWumxU7eXFzm+reV7S8W1mtleevO+E9Pj2lbxbrpDFtY
         E6zx8cjT7p7oqL/DRBWD/WbYM4GiTvXEshNMpkf86k6x0HS8a8MSUbIGGWHoQw8StPJr
         SFNuGrcIIScOM+cvifbR45grlML6jArsQN9gU096sIdyjv0n3Hpmi0ybdlQfy8sPKIPb
         1n50xMmRrAWM1jmfnGk9QrARNPgJOCt0rv24RwXia6eN529Rfjqn7WLioOUmMDebGRo6
         RqwRPFElElgCotyayLvW0RhcIDfIfxhT9MOXNaDbTChRDsoAmT7JDgcQ9HB9RGOwJNTt
         AWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+WSGWfYa7gMrkFqASJhZI8VjZ8XuFjtdt/nRUpEHU4w=;
        fh=pmfIAu1zZ/y4MK+Ok8pH+KJi8l1vy8Cep5fL3L/xSOQ=;
        b=K/Kv4RuZsVKAnEiQmgvB0mgZa0wlsN4PVUNEHyxm7oMg2OSxZdhWtVAGX0eAEjoF5d
         hhSABik1S19GpXCRiuEh6W7Xw8tau4OuHELTxkZiso2gFlPcbcKCHkhisj7D3SRwHSL+
         wcrsCf/930RFlR55X46c8WlYXL8WD7iVA/RD6nU8AFL0mnCS1f9kzTnCrM8YFsUvbcAe
         NhzEc0vai4GHxRCK5Me3WJGa6Yj/mKDO3/Cc2a3ofQ04AKI4OSJIuSiD4rFCPeah9WOf
         ne4xjWIQP1zKpFPENR2fSrYs02B8EfxzQcz95k63Vl07xOUUppxcm9+Hkxt+NOA9lIW8
         9gfw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995596; x=1783600396; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WSGWfYa7gMrkFqASJhZI8VjZ8XuFjtdt/nRUpEHU4w=;
        b=EeP1nFBzAflEdB/TPMaAEUsp7OZU5/nq1qqDyyILV+S6AxuXIYm/6FXlTDL68+gRKs
         YO6GvMgUFlySaCPH3UuDr8/YW2wgIuG+59LgGeRQKyRAXPf/WCMZnvBAGbzAmaWBi+TO
         HqoxTeEEcPeOFa72YN7sm6118ap9O2B7Ypp6mP31lv0LumgwoDU1/fM59pGB5bAkIAfA
         btnMeFynbnjOfqQaFlsleFxd4gxEdMIJQc/4qEoIlB2b5GI4VNV2XhSnrcyvw+eAEFzF
         RCcbGokdv+0GvVGC3L4/l4TCu1u6i3nwRnDGRGqkxVv0ld3yh9c6N9Uev3WLMUhYD8Y6
         MCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995596; x=1783600396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+WSGWfYa7gMrkFqASJhZI8VjZ8XuFjtdt/nRUpEHU4w=;
        b=XfvLS45axmqC6V8ljgtXba5iLyiw0d4N1BPeNONwRNhJeX2ZCsYOR+2SxNufqMJ/I8
         LkZqI//xzsBkIEABIW9VQaEM2b+s8Bps80RQlFBQDxRpRu96FkUVQ13tQDYBfIsQLZMB
         /n+mYxx+IruFANUKXWl25u8bwbNiJi2GtlkVrbp+hwfMFNyJ5LSNL8eq/VQdxLbRicCk
         uwtPV5xqsyaIorCjWVQ2M7JwqOKvXdRiNHNCC6B5yrvXUBXrE9zR83qDVV8vBTE6sjGJ
         lH9sDrHfJn42QEzzrHy7Q0ZRHhu/T5ZIVuLI12rK3dnmwd61g6W3kjAJb2wfDDDXUEeK
         9y6w==
X-Gm-Message-State: AOJu0YyHFJKNF5zV4L7h4JWLwUIVAoDVguyXeyk1GZfHM5EDQI3AZ7g+
	EwFeUDTu0EYyUxA7R3vDm8Z7D2MwYIL5HUHpsn1wh0/+L+W2ziNLYgMtI5yGQNJvwhRCbtfTv2R
	2wTeYtd5GIrdEx8HL/1IbzUaWDQbKEI4=
X-Gm-Gg: AfdE7ckH2ejko7yoTHsD3Jti4YIGcrbhDtDhBgdn4kP9kuL7+en2dmpsZlZsEMGIBSC
	6BbJzWi6AA2w2lab74IQNmith9d5U07oGdg046ci3nO7Yu48rY+5IlLYVkUWgqUTxRkdWJDOj7S
	gsIoT0lTIY8ILVe0uq0zsRwCVcm32zkpzXaIc9vmySY9EbuP4XWmcaYZen9SvVC93m2GQJdESd8
	bmjjo+hlEu9aXyg94ChWny0UPO2kttsXgPLE3vahMZJMqmaA9azTGWuQVU9ErBePu4yUXo3yMVr
	zD5oZW86Zb/GM7O9Jowq5cM=
X-Received: by 2002:a05:690e:c4a:b0:664:ae6b:b49f with SMTP id
 956f58d0204a3-66521df7ecemr5780590d50.84.1782995596295; Thu, 02 Jul 2026
 05:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-4-frediano.ziglio@citrix.com> <73d8b955-8462-47ce-8913-d11303bf63c3@citrix.com>
In-Reply-To: <73d8b955-8462-47ce-8913-d11303bf63c3@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 2 Jul 2026 13:33:05 +0100
X-Gm-Features: AVVi8CfiNk8R3HWPdAWYqLYbbFbfGclL4KGvJwM6ZfR2wmiHZqxS3xp-wW99V30
Message-ID: <CAHt6W4cYmoRxgAs=hX6zcvhPA3j9Jeb+9X+Z+OAayB0owYNvHw@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] libs/guest: Reduce number of I/O vectors in write_batch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1782995597-FECC61E0-9FB1387F/0/0
X-purgate-type: clean
X-purgate-size: 1108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A54BA6F7A88

On Tue, 30 Jun 2026 at 17:47, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>
>
> This has the same exact subject as the prior patch.
>
> Either it wants merging, as they're both in the same function, or the
> subject wants to be different.  Even a "Further ..." prefix would help.
>
> On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> > Each page was sent using a different iovec item. This potentially excee=
d
> > Linux maximum (1024).
>
> Linux cannot have a maximum of 1024 because this has been working fine
> for a decade using 1028 in the common case.
>

But the code does not call writev or similars directly, so there's no
limit besides the sky.
The result with 1028 is simply that you do 2 system calls instead of one.

> > Coalesce adjacent IO vector elements to attempt to reduce the number of
> > overall IO vectors for each operation.
> > Also some implementation (MiniOS) emulate writev with multiple write ca=
lls.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>

Frediano

