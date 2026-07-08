Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ksgEI8KlTmqHRQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 21:32:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB4729E06
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 21:32:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=arey8tis;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357313.1611746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whXz7-0005n2-G4; Wed, 08 Jul 2026 19:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357313.1611746; Wed, 08 Jul 2026 19:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whXz7-0005kq-Cs; Wed, 08 Jul 2026 19:31:05 +0000
Received: by outflank-mailman (input) for mailman id 1357313;
 Wed, 08 Jul 2026 19:31:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ludloff@gmail.com>) id 1whXz5-0005kk-Ax
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 19:31:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whXz4-009YK9-JT
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:31:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ludloff@gmail.com>)
 id 6a4ea575-bab6-0a2a0a5309dd-0a2a4506cf44-6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 21:31:02 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ludloff@gmail.com>)
 id 6a4ea576-08de-0a2a45060019-d155d030d4cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 21:31:02 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-698bf7a1a2dso1517612a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:31:02 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783539062; cv=none;
        d=google.com; s=arc-20260327;
        b=gIfMKPC1nd60SRmFqvKU2uGX3TohaPZhUni1W2kgd9kOVgX+v16OHnCmVdIuWd82Y8
         d8c5Ydm0Kx3deRvp6YxAW9qw6nfhebmC79ciceph8b8lg//A86AGYawg10aDtCLu5D6i
         ZI6oc/YKkGpI3+4VRLMcbGn7RPH14BrZYAsh8N2Dw8em29XyK/dT65+myWSWANAcqE14
         6euVlJjoIhmSmF7h+d1+wDT9eXoKx5LO4qmfnsHD3x3jxCxbrBN+TfY3Y0BLcu7VDPBK
         WQ0BmQf/oirHirGvqsl4dm2v09y6tg90BsLtFEbcBbbUu3FQlTGznN5sAfzX59QaRtMo
         dzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=Kymt51/VWhPx4pU2jFeRIFQzCWK76eHbGir2cEh18sw=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=jFOtlo3ApM/bSKZFEzTmNNV6cxa+Jmr142JYgBWbde8jpy4QOxkeOlrdG6UeaM4RRF
         1oDTMV8tDXiktttvUidKomdrk3BX25w9RbLWb4r8ON7UW5V+Pv6Ex3v4vTqZqywp1bv2
         7zuSyEm59OTtl8dbV1LMVgkZ0/0odjX/KMgl+niQjbL+Q9fTspzhAy8z1rnJhOlPUCPH
         jqlhC51T3YVZPbZ6FTwe+4CUyRt0aoRS/3PQ68pNGEat+tnZUtKrIkWGusXP3dJ0UJf1
         7z3uNkV+Rg/EE6STUpUP7Fu5wuN8Sjuzr8BUeKK9mMYlGfc2P1GKP1l8Uql7y/4pleEo
         hpXA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783539062; x=1784143862; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kymt51/VWhPx4pU2jFeRIFQzCWK76eHbGir2cEh18sw=;
        b=arey8tisYoO2oxcl5O9SeebBLpBc456XfP9HESk0KswodIbGJqUovbY2iy3Xp6g77/
         Fdg0pgtYqc+6JJURXpod4sFdyu+SypSFf5xDxuxmFBddZRfDCqZjgfK0vHAdBN3ImP43
         pbzgUimJF/bumZfMgQOcYOfoj6KBqHWmBJf5WUclepuwKeo/2HKsAlI2E652xrMyEWzf
         ou/zzZtJsXl7J8v69s+UJnUjL5YOsZvwcUi8oay4e5eqYpSAWF+7qNJl2SkNdXEZdQn5
         BMKWVjDi63c572FuuJQJOnZb/sWBMqc8MTqHDlpFVGGEDDpdYZnzghMtQR+O9I1LgLoN
         nTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783539062; x=1784143862;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kymt51/VWhPx4pU2jFeRIFQzCWK76eHbGir2cEh18sw=;
        b=lq93vHUx91TymhAzp2S/Z8s3Sy7DnoHXpvVRvz/FGdkF51LfX0dxCo19rnWdkB9Vi1
         Hy2cOkIoOo/2xuX/ZWY8wYUFK/HRkLiwXDSraCXHFbSjWN9uTw0+BasMBKc6yPY0LpO0
         g/rhRInFiGb+ANf6XDcWCwqEEgMNjb52gDkbJhVhW83AxwlEmMHWLtNdQxG6CTeYne1D
         sPElmdIOuaMSvP/D/w/uDysWsMjUKrs0D562HcdSymVU+i54ijFyHD4weA0qHCbmZNLc
         Qaa5+EFpHtHgfuxudgkHlSIubeyjzDNIjN7/70pwfYQ3QpOQzIGZ2Eiq3icZAFMgFuBb
         EZ4Q==
X-Gm-Message-State: AOJu0YzeoM6p2M2XiSXx4ClygEtIbPLZgHIcCvc8TgmauKwBzBoAuHRE
	R+MNLwZyA70wvarep0T6J/aHBJJYiaM2cWbE42gnIR5y27vGL424ykRExznY7Hb8wcx8JNWWBwZ
	JJ4Cf8yVDO8l1okvSrLxkMHNYePiypbGMKXV9n4c=
X-Gm-Gg: AfdE7ckqmBt92I3bn0DoX7i1z2G5350z3hijKn9O4+D65dWwI5l/KCEQn9pCtr8qiiT
	CvrE4nDgNfehbW5HkgCJ+8oE8KZw1Ln6bUY2mDN5rEUwQoHndqu7MPHibHixZf0xBHEULy+lODW
	7j/3r07lOSwGyg3gulQWDQMKuxodtUSEPwUJdkkG5MeKvIQRQSCEN6cx4sVrWOBB5ynUjeWWX3E
	El5TAwXJi4L31OIq0ePqo2I/Co03CqyQk37kw4iyUH+ExUxfsXMg7YOjAKM7UWqDQjPPuC2
X-Received: by 2002:a05:6402:1950:b0:698:428e:9177 with SMTP id
 4fb4d7f45d1cf-69ab4460528mr1633473a12.11.1783539061929; Wed, 08 Jul 2026
 12:31:01 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 8 Jul 2026 21:30:52 +0200
X-Gm-Features: AVVi8CfhsWKsmMDC5S_xcoMAYezotZrFhwZNOtR09DHdoUyjRri2P-CX_J6zT4A
Message-ID: <CAKSQd8X78303g1eJTd_PdaTb-7mL_GxU6cdE98Mza8mZ44UE6A@mail.gmail.com>
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1783539062-C652168D-5A11F4C2/0/0
X-purgate-type: clean
X-purgate-size: 318
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ludloff@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ludloff@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	HAS_REPLYTO(0.00)[ludloff@gmail.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28FB4729E06

Fam Fh Model DDR2 BKDG #32559-3.00 called it LockMovCr0.
Fam 10h BKDG #31116-3.00 (and beyond) called it AltMovCr8.
On sandpile I call it CR8D to reflect its intent: non-PM64 CR8.

Also, you cannot tell a #UD[LOCK CR1-7] from a #UD[CR9-15].
So the question whether a LOCK works for 1-7 = 9-15 is moot.

--
C.

