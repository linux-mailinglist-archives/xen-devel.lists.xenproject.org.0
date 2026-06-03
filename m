Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y7LDGB7/H2oVtwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 12:17:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBF6367B3
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 12:17:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Luju+rII;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326050.1591468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiea-00076T-Nx; Wed, 03 Jun 2026 10:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326050.1591468; Wed, 03 Jun 2026 10:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiea-000753-KS; Wed, 03 Jun 2026 10:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1326050;
 Wed, 03 Jun 2026 10:16:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUieZ-00074x-RF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:16:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUieZ-002kAk-4F
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:16:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a1fff0a-2eae-0a2a0a5409dd-0a2a4508b090-38
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 12:16:51 +0200
Received: from [74.125.224.49] (helo=mail-yx1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a1fff12-63b5-0a2a45080019-4a7de031d8e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 12:16:50 +0200
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-66058b880e9so5041771d50.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 03:16:50 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780481809; cv=none;
        d=google.com; s=arc-20240605;
        b=fp68ScXXeJVLHVufjOa5zIJm72nzBXN6j/4lRLq+jBTDKN/fbRqGLucaNOUj8SLnbv
         am3qh1aEWYDUgR2P7rIn+PwQCjaPWFD1gD2PWUS//th7a6sAmZea7Gcqwuw1kIyfcYxx
         XDn7i6HNajuX4UsKmPRllZD7ONy0Kh6IBiLdyt0BI5XMiBzuuMGv+GO+KQ4nbWrZjvma
         +xJiezqeqKNxpVB0FZymccPMV33IewmrK6XbAbrIVpslRsW5cT+Olwm0gtBL6sLQ+LHG
         2hrS3E03mOK+YKPHC49UIRb2mCxT/hjjxUXL6Q8k+dZHd+o5PP+ZKU362wPpVd5piTrO
         JZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qPPsAuWkEsVt8zn//IOlR2zwGNNKDkbBvGgmciDAiiI=;
        fh=pmfIAu1zZ/y4MK+Ok8pH+KJi8l1vy8Cep5fL3L/xSOQ=;
        b=gYy1UaYIFl3mhnk8c35e/Caf/pbEVTYDmOUuuCt0Ho/zVT+O/DDw++eNdQSQDWH3Se
         CxL6p1i4KMubr2Er33jLikWPnt3jH/ZQ36K9sDRV6diVI4Na1RkC0q7epDIYOVg61nwJ
         P8mYFi57kyqDuwHHoZkcGn1FwuPgkIw2bnHr36uWgb02gP6yGErmY9WwCWDYL///0gAr
         rnuj/Ois9LIRu8O2UmZoekJVxQggnIgRO+ccKt7IYISUGuxQsBk1iJCHfIhCeWcmJE/5
         WrZ69cMYtbuCAw/2Km7D5P2Q1pm37unsDNu5drRraFdfPtxgDjpQqsaQ7dXE9UBxmWMY
         v4pg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780481809; x=1781086609; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qPPsAuWkEsVt8zn//IOlR2zwGNNKDkbBvGgmciDAiiI=;
        b=Luju+rIIWgVqqHBL5MT0M3/7FMUFttBP+w9vfCLntW1KvUetUkLBYP2Ehs6oKC2Gl7
         4KrNafLtdtexTF2wTiKxfYg54N2/2xNZHuqXXW3isnRQF3V+CRJGXWwvweq8y2CUQsxQ
         jz/FEQaWBcts/z3Ydyu7R6shxm6JT007sAARu2S1e+yxKbzMtzH4lS/qQQZV/Dw7OJZP
         dVi3wBIAslZ+oAh8hUeW4T3Uggea3rjK0mphU2XJ2F4LBz0CNPpdLLbzvOmnO1O2YGNc
         bdroq2piXZHAZXZaJ7LT0iWDodeBkH3O+kHnwH8wHy2IyjLIpg0Z3YPtbQGHE4+BVpnN
         npQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481809; x=1781086609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPPsAuWkEsVt8zn//IOlR2zwGNNKDkbBvGgmciDAiiI=;
        b=IGp/icCqBPUbtZlzliAzGV2omyuixiGqc1Dps0dnWKj0+LXI/y9iOdh7qr9z9IEM/P
         fol2yZm+z/u9sIpSozlsr6x7WtUl/qt5dlEc1Q1JZMAy4gDlk4A3SOyc/l8Q3VCjEqSF
         JF+/r2Pf2pxZwuctwuAN4WbHxvEbPIGGdLyWT9kUSHq0JaRpu7mAEnI1j6aYzz5MzXaY
         46cxTzS9HHnJuRq7PXbsXW+71ENyJVdNwDaON+8H9Yi5/waD4383/Ycwi7hzEqYKmtMu
         YvpsyFyAbw2ULwx/lBjBmxAHYRi9935eNK00GWeJZaMS+IP4xejp2dY6veeDYICKCApA
         /+tQ==
X-Gm-Message-State: AOJu0Yy06xYX3sNb+EU0PrjyN8DqaI/Q5Pyziby9SPmd+T4jUJpPLUKd
	hboH4kmoWKhNVXB18IoJtLMX2FgDO8HNteUre05i8n5F9TPwlXTqIWOO3vS28VqxM9ADfWpExre
	RKoy2qiWXXCua24UN5sLA6nlJ9L33jFI=
X-Gm-Gg: Acq92OF9sZ+6p1W5a+8HvGAVjwZP+y+q+bAnjZEVpBZ4YSEswJnY03pzoaB37gl88EP
	CN41LN8c/BqGa0EXKZ6DfXRx4GwehDEX9HQcpYOEkdtFHwtcf5lyz5oJtfchyv3oew3ToggjWO+
	hmK5Ta9EQYNjHrNMq/YFSUT0Zha5yKmadshcDe7dSU8ZV77D09/zJM33XruVe05k7bKDyhYURHt
	UxGobQRy7g08Z1sg+RIb++W+rH7zZvRDKM1bwKtGHFpC5M3cSMvyfmpRg1oqgEpQUnNkvn+ofDG
	U6ADiUoiMzNfqqaBIIFTCnuoNfFP6Y/J1JjzG6b0eM6izmtL/LYRn79bPE8=
X-Received: by 2002:a05:690e:c4f:b0:659:3b0d:e280 with SMTP id
 956f58d0204a3-660dbe1f4bcmr2349947d50.8.1780481809540; Wed, 03 Jun 2026
 03:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
 <20260526094324.12286-2-frediano.ziglio@cloud.com> <d8c488a3-c29a-4afd-869e-fff8d1d2d370@citrix.com>
In-Reply-To: <d8c488a3-c29a-4afd-869e-fff8d1d2d370@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 3 Jun 2026 11:16:38 +0100
X-Gm-Features: AVHnY4LyH8UIejyTvyq_XMcFP7YYkv4nwLlygLR2zshwUauBhSP55XWXU6Tq2gU
Message-ID: <CAHt6W4eaFnuySnJzbNbmOgss3jdOevjsEZRKMw9V5fsiqO0CRA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] libs/guest: Reduce number of parts in write_split_record
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1780481811-BCD63DB1-88CEFFE3/0/0
X-purgate-type: clean
X-purgate-size: 1035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: C2EBF6367B3

On Tue, 2 Jun 2026 at 12:50, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 26/05/2026 10:43 am, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@citrix.com>
> >
> > Small optimization.
> > There's no much sense to split the header in 2 pieces, it will
> > just take more time and space to reassemble them in the final
> > buffer.
>
> This part is fine.
>
> > This also avoids truncating combined_length to 32 bit in case of
> > 64 bit machines potentially avoiding following record_length check.
> > The function become more coherent with following read_record
> > function.
>
> This isn't.  The truncation just happens in a different place now, when
> constructing rhdr.  The length is strictly 32 bits.
>

Yes, there's still the truncation but the below check

    if ( record_length > REC_LENGTH_MAX )

is now catching it.

> I'd just drop this paragraph.  The largest record is marginally over 4M,
> and callers won't be passing in anything larger.
>
> ~Andrew

Frediano

