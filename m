Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bMlICJr2IWozRAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 00:05:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F3643BBD
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 00:05:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cHg66BtY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328660.1593050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVGBD-0001Ki-6w; Thu, 04 Jun 2026 22:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328660.1593050; Thu, 04 Jun 2026 22:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVGBD-0001IB-4A; Thu, 04 Jun 2026 22:04:47 +0000
Received: by outflank-mailman (input) for mailman id 1328660;
 Thu, 04 Jun 2026 22:04:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <christopher.w.clark@gmail.com>) id 1wVGBC-0001I5-1T
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 22:04:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVGBB-003JJp-Dh
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 00:04:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <christopher.w.clark@gmail.com>)
 id 6a21f670-e002-0a2a0a5209dd-0a2a450bea08-38
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:04:45 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <christopher.w.clark@gmail.com>)
 id 6a21f67c-212f-0a2a450b0019-d155a732a81d-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:04:45 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aa61503fdaso2161049e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:04:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780610684; cv=none;
        d=google.com; s=arc-20240605;
        b=fg8YVng29D/Tl8bJQxbP1YDjhF2RzZwh9yl+QoMcSGN/FrSy3PrXiuB5voho7KNNgG
         TBp+wabulxXHbI43O6NOGgCMYext7u7f7C4eGdj32Qj/dlmgfYiBxdJGs8xYc/0aLcao
         w0n2UOqOGLQrJPOO1DYX6A3wR0uIvXKU6LJpqXpXpzHroBAOpBPe+HrCB6x7wYE55/7a
         393LdqQ4no0O587YFflwyvclEVZbDKomq7+VJJ/McJnD51iIjeSZJPKVeUoCViZxT+55
         BcOtewG1pmLzpmtezXi8D3JQlE3PvGlf65TZ5hVcANOp+nX9mE+3YC2fazX/Yc8oDM/L
         GZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XBv515/o5XBlXGitxyzSRBG8sCnIDZmroU4UUfJ8o08=;
        fh=tUKWqsqmNtSv8OyLozKgacW1gCbGytWM1DFVOq5CTIY=;
        b=VusqAzJFRlHWY4yOTAHRw6At4+AefulCdzozIMXlXQ0MtdXMnD2UagJc+cT+4dZqA5
         rVhNZz8xU7fCG1O9mX0S9ysO0hG6HU/30y+icm2cEs9feAzPGEvl9G9lHoh4HaScZ4C7
         rf7LdmUresVaXwFO4VX+9ogD0uBgSrtulxloi9FvUvtocdSbEPnodZmMVl2/eAoM60ti
         tTjnoSQSwrdjDf9VEJpYXxgdB+QRPVDF7VYdOld66frO5tKuSrRybYY54yFNzM+WbVI4
         Gbdki1vPSoZpuRCdExAkl1SLrXaEFjAifCwUG956ZnPaXXFL/OCuFNZShZ2zfZ9/M19I
         Zdxw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780610684; x=1781215484; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBv515/o5XBlXGitxyzSRBG8sCnIDZmroU4UUfJ8o08=;
        b=cHg66BtY142E9kyy0oWFBlykfN6SleX2LQCLR5Ekpg9MBeHH/a1B/SpMfzE+R9fnAv
         YpVqH+Z3igYSUQoGd8XqzWX9fJAebiegZBCOetcnn4Ci5H2cJnoWdARtrctHTBux4QQK
         98lZxJ6XeSGRYaK1UKhbmsutEVjvDmamPjRDFqwOfRjcabk9xrToFKnRCjgiFKKBqM05
         tBcROxl0jSkKGt5Txak+f+Lv6O5vxiE19RLg+r02fncvKp6znAENphK+U3Y5kTYz+AWG
         1Nf4XW34XVTFx6Q1xp+QWakNhIw8YDPSh+dq4I4Qc4Hv8YsVR7jLuLzFb4Nq6PYoGr1I
         kmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780610684; x=1781215484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XBv515/o5XBlXGitxyzSRBG8sCnIDZmroU4UUfJ8o08=;
        b=IRmHvsQ616ESCkq7fVIrCiiFjSaBnWvs51+ib8+GibaZDNWWnTzvHe63aB9sMuJY1j
         qY1o1t0XJPOHvRD9jpHZB2TXStwI1xfwBDnhFvLu5MqCzpoYNVFd7P972Hi8Ku4n+x9b
         rdIgePoTGv/ObRjBm8XeDGSmraJPzLVx7qwzFXCqCHRK+AdRV4PnOUcWqABShUbqX4cp
         JMuH5dUMJLnwXU/stYpb6E/xhE6Z5QSmtllFjItbvLoIZP6Rfz2mb1cQO4FAI/UVM09j
         LBXTK97fEDgTDyIz5CycHydmYxcU/J4a3Hx4SyLUFMqCO9MMK1Xyyq/fxZH+iZ9kVkzU
         8VOQ==
X-Gm-Message-State: AOJu0YxDPN55hE++nVeC8mANLAiaDt/iUG1kOv6f4vQD8sS3A3sAhAcQ
	BE6car9eYYFLIeHPRVxV09MrlfTAyF3iZ3ZO9hovDperOHH9Pe9MtjBE65wJfvHSsnkDNoVM531
	d8ThH4Euz2Okh4sZ19F4b6aR8rXsfTNs=
X-Gm-Gg: Acq92OHIEB+Y1NVh2YG1szWtm/Ab4PQ0fdz6+gZtty5dV100N5nImxEAygfQTg6uWIR
	7s6Or2/c2pckBlCtQ+n48YPQWqtvPVoIFJ3PrF9JQGxerAuwqdcz+mTjww6OcMdmYZRbJCv+anW
	E23nsMCPpL9vFnuEfSjh1Bt7NRKNDDxFpQ3yj1tcKMMtlsVfjLJkVzQqoNtScptUrS5PkCD8tAe
	4c7tFsXkmlkNK7nl6v9OxZui5KV3GBp1ZSUDc8P7N2lW6rZwH+AGFcF+VZmvxcO0TahJ5j39W9c
	iJ6jAMxhkuUak14mUXOpkKEpzsoggG7CGmtMuTHbmA2qc5Grlm9UEOqFreletGYy1kMVCfjs+QK
	bGg==
X-Received: by 2002:a05:6512:3090:b0:5aa:65a3:468c with SMTP id
 2adb3069b0e04-5aa87d9519bmr79774e87.7.1780610684136; Thu, 04 Jun 2026
 15:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260604184413.788910-1-jason.andryuk@amd.com> <CACMJ4Gbi315aQZ0qE8+f3JJXyaRvva2vxmiH5-iXtiPKk+039w@mail.gmail.com>
In-Reply-To: <CACMJ4Gbi315aQZ0qE8+f3JJXyaRvva2vxmiH5-iXtiPKk+039w@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 4 Jun 2026 23:04:32 +0100
X-Gm-Features: AVVi8Cf4AGpffPPolLIEb2Chdmx6W64CvVAJxpmJzu0bcx4iz9Mazqr60raR3NM
Message-ID: <CACMJ4GaZ843wx4J+GL8i=p-thg7jGgR57=JUEUHVuZ_N3Q8zMg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as an Argo reviewer
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1780610685-13D7FF3B-079CBC4E/0/0
X-purgate-type: clean
X-purgate-size: 565
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[christopherwclark@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopherwclark@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 720F3643BBD

On Thu, Jun 4, 2026 at 9:27=E2=80=AFPM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Thu, Jun 4, 2026 at 7:44=E2=80=AFPM Jason Andryuk <jason.andryuk@amd.c=
om> wrote:
> >
> > I'd like to help with reviews of Argo.
>
> Thanks, Jason, appreciated.

Sorry to do this - I am grateful for the offer, I just need to consult
before making a change here.

> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I'm asking for my (previous message) R-by tag to be held for just now
- sorry for the earlier rushed reply.

Christopher

