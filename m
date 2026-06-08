Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VCScMTM5J2oOtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 23:50:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329E65AC10
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 23:50:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=haEGDpza;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332096.1594742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWhrH-0004fi-WF; Mon, 08 Jun 2026 21:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332096.1594742; Mon, 08 Jun 2026 21:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWhrH-0004da-TJ; Mon, 08 Jun 2026 21:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1332096;
 Mon, 08 Jun 2026 21:50:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <christopher.w.clark@gmail.com>) id 1wWhrF-0004dE-R5
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 21:50:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWhrE-00BCOO-30
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 23:50:08 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <christopher.w.clark@gmail.com>)
 id 6a27390f-bab6-0a2a0a5309dd-0a2a450688ee-2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 23:50:07 +0200
Received: from [209.85.208.173] (helo=mail-lj1-f173.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <christopher.w.clark@gmail.com>)
 id 6a27390f-7371-0a2a45060019-d155d0adc9cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 23:50:07 +0200
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-39657d28132so35733031fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 14:50:07 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780955407; cv=none;
        d=google.com; s=arc-20240605;
        b=V6ArYF4OxUll/1flyCzsMUFlWTYR/qXTVfBCa4oVQ4fwHiuLls1IZuEcE1KOddMw78
         +DRQP66IwzzBQ+XFtuWfF3Afrc6WzgdRRW3R9mUxAQNtmCcDKMp3PhXPI2k5s+JTq3ej
         gT/4k2j5tQGA1XlgdmbEbUHBH4UbwAqrKfCq9pCmKtYL6CYSZDqJq6iGQqZJq0GJ0Bhl
         WmCvMBpEOWy0Ij0YLkhBh2Gf89JZ/FCH5xv/j8OhQozO6kRh7SNHYOnHEo3hcQGNk3c2
         0M7XZyW+W/5HAPNSPEpk3Za0YtroAJvzyvBoMT3EDQtDFGHzPIWUGExmKfTnQWEocEFj
         nI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRLqoe3PRwiBX+LZoF2hWq/GWXsduoGHC3UALByTuxs=;
        fh=dRSkxqPvTetkPp3v17QXS+rXFtq5bHj5r4fmpM1UWX0=;
        b=A7Hjl3cy3HCCjdKtuCTGwHuB0SqZrUIFFlXszB3A9HXJQ0clYiPoXq9d3RDNlVkAt6
         ZsLfQqjLzAAy6+Yaayxm8vYy3OUFGdUEPnNjEnlFaQzBYhVYh7UOeieks1nsktfNN1Jp
         Vq9n7rjOIqGvLpAcGAxBpAqsvI1OLUqzQPkALoMY04WnUXZYoCZLv2Z9Fx2kbOuN8jHD
         Fx/gJGmT/0W+lLDg2z6cDqva6MrNlZXbb3rNMAueFWBABlt6GyHZjTIscyw5aWaY13k1
         z4NBusX05mBA5avDqUfegbYbBDpJCFr1f+ES1KgGDj59VHtnTn8XviQ9lwSTRdpjO143
         Tfkw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780955407; x=1781560207; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRLqoe3PRwiBX+LZoF2hWq/GWXsduoGHC3UALByTuxs=;
        b=haEGDpzar50WfV/wcd60XAITm2+z2IlbaPBXHCycnfVhuC7EFHo7uJiX8UVwQMUjOu
         N0g2/M2fRfoTvBKswMmBI2HsDri3BgU+tVCXUuLTIS6T79N+A1dRvvkYPz6+hny5SEKl
         THOQ75YIxP7tOnKL2TJfmrl19Z/Qfa3EwGWDrYd6zJPsu0PpF9jTu4GB1OHRFQvuAblm
         cAsBdtLJPrW4DAXkQs5tTuN6220FInNtx0O8l1Y9uxx9XI9PqEbnymJXLvx1rEbjtn/5
         ubGwJtqZitKbu8KJmYrbDcQ3KGkhZ841dqAEcLD5GVJrWWS+Q4+HOsd38aueofGx1jt+
         PoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955407; x=1781560207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRLqoe3PRwiBX+LZoF2hWq/GWXsduoGHC3UALByTuxs=;
        b=Z1wYEIihEb2LvCM0gerzjmikV18U7RjxmrMpdfqeyOIpagxsgTAIqS6dd4RWqqeZnQ
         P5S+pQBr/tOpfrNlNvgcM2a0/FlPvo7Ywe8ooXL0E4JitRJgztabe/aGlb8rNYVWz9mi
         TEmvJuLKgRIlIDkeH69P1yBwqlVfXP10FYuPGKfG83mdcMbaQEyNSLaK+x0qYlATr7Fs
         TmSqO5sK6lAGXVUFV1Q+jxUcNUjMDTTZwOl67dIh88zHO2KtgcyJUUCllMPJdAnKX8DS
         jCP3I2FYPh7Jp48bY7VZ+gBUoQWmLhDTHNKbd0SBkq3XYsPyPxKF25N34QpLyr03xJIK
         WFDw==
X-Gm-Message-State: AOJu0Yy3Za+cAx2xQ9EQk1AZnqWGpznECfIUwJ93ODVgWGEEeAX1iTzw
	+D2svyKYz7Wh9NC4+fgPRs+aUUGHwXxFqM8zEVZBKBoNoNgz+0jvRmBOMZeCxlAKaL1CIiWq5Gh
	WBOBxSYxgrjW84oyxfT6NAFcEuvoI8d8=
X-Gm-Gg: Acq92OGYYzZmJ51YJnt9qekD+SIj5hDf3FD+9uzqST6E9wk5ZfSbzrImlhXhgGDGaNr
	fyt5pq0A/qQniDugrTcpDK76rDpzKoSKJcjBCMxV9Qj6MPmzr0zwtB+lu+MrbNreOBkkKIEXdob
	LEsVDRNwEJtGKe/IfYBoGmmXSA3wdHw0YfzGbCDql1Ghk4OwdvpZ+S9i3n2Kf9Jy+FlXzsQGjy7
	mQxTf6HO7eUjtNKaskAp2RMvbfeMdApcI4IBklpGV2nH/gER3Wcrz1akEPJz9adAXUyMHOIFNtP
	ReMusOBYLS6tfgR9yqfh9RIBLpquL1yLio1SW/snCRcIwiJ5LxfI1O/c15MemiH80HYYo0tvGFH
	daA==
X-Received: by 2002:a05:651c:18c4:b0:38e:e29c:9dc0 with SMTP id
 38308e7fff4ca-396d097ae4cmr49894991fa.20.1780955406966; Mon, 08 Jun 2026
 14:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260604214926.1735194-1-dmukhin@ford.com>
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 8 Jun 2026 22:49:55 +0100
X-Gm-Features: AVVi8Cdb6-6Y2lkt52IFDacclyOQm1Wb0vbMz-PWKMTu_TqzvFyLr0-b7lDBafE
Message-ID: <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] argo: few log fixes
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1780955407-8C47CD75-64F3AE67/0/0
X-purgate-type: clean
X-purgate-size: 476
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:Jason.Andryuk@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ford.com:email];
	FORGED_SENDER(0.00)[christopherwclark@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	FROM_NEQ_ENVFROM(0.00)[christopherwclark@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7329E65AC10

On Thu, Jun 4, 2026 at 10:49=E2=80=AFPM <dmukhin@ford.com> wrote:
>
> This series corrects Argo module tracing.

This series has been committed to staging.

The maintainers were not CC'd on the series, and did not provide an ack.

Patch 1 is rejected as an inappropriate change.

Therefore it needs reverting.

> Patch 1 lowers the verbosity of a spammy log message.

Please see the review comment provided by Daniel on the v3 version.

thanks

Christopher

