Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PRGDCc5YMWrAhQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:08:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750456903BE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:08:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g8gRY19n;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339286.1600468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUSK-0003Rj-3G; Tue, 16 Jun 2026 14:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339286.1600468; Tue, 16 Jun 2026 14:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUSK-0003PE-0H; Tue, 16 Jun 2026 14:07:56 +0000
Received: by outflank-mailman (input) for mailman id 1339286;
 Tue, 16 Jun 2026 14:07:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZUSI-0003OM-MG
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:07:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUSG-00BfAA-Q4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:07:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3158a4-2eae-0a2a0a5409dd-0a2a450ce28e-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:07:52 +0200
Received: from [74.125.224.49] (helo=mail-yx1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3158b7-62f1-0a2a450c0019-4a7de031d070-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:07:52 +0200
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6607e80a846so4705777d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 07:07:51 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781618871; cv=none;
        d=google.com; s=arc-20240605;
        b=bUXqN8zz/RJWkLo+vlxeeHbI3V5iIV6fayB2opEYJY4+BnuS33tXmUVDsFq7imk+Ru
         8TSPNR/89icK7B8eoqduXQoa7DK84hsprl5U/au2DN4NkugAQL3kxZmQCuiDswmS+nZD
         W5QpYoELqMQ8qf7yqSlbdOZjknLHgAHSxEpdODqU3PZCHLRdPrxd8A23zC1DUeeDKHvf
         22dNJ0Rf4hpz6TTDt9Ae4vQlHjZp7dceJnzadjGxiHGJRxnIwG467occMygnbef7u/6b
         UfD4ckrXiBDj6W/grw8+WcQryLti+NuEcMCAg5pjNKo7oH+EOI/PrSxc82n92DJipy2P
         aGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t1vsSdVINsFQm2XkyMhJzwl092jIMpFS7jN9l5SKBWI=;
        fh=GUy7W5LKqNoZF9Mn07lkMfe1LzLkCIMaS18unDoG5ao=;
        b=HdlxaMUx8OJqgaguvlATjzi38ogFS3E/LULxcncOKJcvQqU0KvZUoevyTSAdECIxvy
         SOJ1P6Sd6qzC/F+rcu/0ovT8wxXf17LW57Tk3J1VOCjwNcJlG20FmdKc+Oehms8GYMwf
         0XPX0/AM6/7S7AtDym41Tn9ucH+01/o2jm/2uQjbbmrcHC7b/oXZsmWfH6LzS4+YHjQm
         Ll5rlg37h3SbSxklgLB55HWQJlETbqme5SpX9z57vfot3kP60v7K8zTb87U+WzjvyYUB
         eDcxzVkVtAfWlxb6NIG6+AmgmB9Chv340aKMugPPFUTHi5CXsYGs+rhG9vQERLT/A+Z/
         G3uA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781618871; x=1782223671; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t1vsSdVINsFQm2XkyMhJzwl092jIMpFS7jN9l5SKBWI=;
        b=g8gRY19ndvnHanoh13xPqhopd1G9W9Q8JmZ9AEXPOyJl8sn8D/J6KcVzJgo6U/G9v9
         kC8lRoOza26ztQVkYhD/rwt5qVAvHYXpBnNA6FIH+Kb4mw9KVgYZHUU79B7i+iJxwMs2
         HTcrvlaJrm6CVp9l6XfZyjbXp3qzF4W/QMf1XZ/NvzDZQudGNGsRsILDjybHiOcNJPVR
         UJ8+hGxlt4M0Upaw8F6OqDWxVljfPzX0Y/455E5ArXPte3RPQuWLyfyOCdCQpHkLuF83
         +XshQv0HnFHAtd2YvZBGVuiM7I8z9+qtqEiDKr80KOfRHi7HiTKfsIPtLd+xj1igNnnx
         etpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618871; x=1782223671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1vsSdVINsFQm2XkyMhJzwl092jIMpFS7jN9l5SKBWI=;
        b=AjBHlLvSc6mYQAR842mvCCYfbDgo97z3i9ah03OYzgUU6P1Yc3uKKNS5NQHCnPYMwV
         oFJ1EHhrUYWyn+00RAMVvGC64Obx7t2dME5VM+lH2Q4CjuYiCM1UZKxCdhy4sEDIR0c6
         IkvE1LbQgu5Ek90tqo9rLEJkldYwAxn3GM60lk4pUAs6RjeNq8nOR0eS2VuAs+QKfgr/
         IOB1SI45cl96kxqRpD6Fad1rjAGlrDKry6GXNlbdbBKoE6E/RMx/ts2SG8vtrZvifdlY
         maKw+5cKFxTPe6vDaY8yQFcZIArycZatvkKUlJ3y5Hm+zjC4CKpzZBMBMhaKd76y3BZL
         g4Ow==
X-Forwarded-Encrypted: i=1; AFNElJ/TeJ0TCJtAOUe0Xykniwp3Gk8VzPOsAmI5HAdmIMfwRf1zEtsePdnsjHI21aM66ar+XIxsvdpJMUE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuT1ZB/9TaFvYMicBfBPehhysupy1Y5ocIrq+Qagk97BTvmtQW
	htf0ozzz0LQxMjQIkx8B9meSBM4i/Ttmn9MQPXQYIs+rPiGtkjmnVEaWQvHqErFsSyIV8rJ0dI0
	Z7D1gvRKW4ROaZrjEpfqcPikWVEACBvo=
X-Gm-Gg: AfdE7cnPG1bb5qgQkcxeOdvBw93Guh1EH/zznFmz82sx88cxCWxDUWmQAphKh0bknmQ
	VpnI98KqlfSGPkWzzHwUOyWuAQMPfeuV+cCk7moSnxsbhaH6cc5+kYkisMV2IYVbAavWwRWz/5k
	PT4ULI1J9HyqwoDBoXBif4UxGyxUTrACmZD1Ws/hPdhZB5C6hb09cvMMRs/KMns32MB69h62MDJ
	t8Uv/Wzgd4RjGXpGgUyvvW9PxkDBcExav2cVlzzSeTZwhwwTC0RC0/S1K1F4u2nK7B4feN8GXy/
	IwUpd4gXlZ4RW6krRroUUO/yqOkCzT5lHc8dAg==
X-Received: by 2002:a05:690e:c48:b0:662:c136:d24a with SMTP id
 956f58d0204a3-662c136d70emr1500049d50.62.1781618870546; Tue, 16 Jun 2026
 07:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com> <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
In-Reply-To: <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 15:07:38 +0100
X-Gm-Features: AVVi8CeSdlfQ_vjCf-4Oup6Yc7U8Mn83Mz7uq9aTqrJ_6zx-JCyrOVwOYq0Acvg
Message-ID: <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Frediano Ziglio <frediano.ziglio@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1781618872-DA169CF5-5BE4C517/0/0
X-purgate-type: clean
X-purgate-size: 1124
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email];
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
X-Rspamd-Queue-Id: 750456903BE

On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 11.06.2026 16:38, Jan Beulich wrote:
> > On 08.06.2026 19:31, Andrew Cooper wrote:
> >> Some old versions of binutils ld managed to produce efi files which the
> >> matching version of strip couldn't process.  This includes Binutils 2.26
> >> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> >> less broken toolchain.
> >
> > And we're certain newer versions of strip don't do any harm to the binaries?
> > Already towards Frediano's posting I said that having looked at how things
> > work there, I'm far from certain.
>
> I should have added: An option may be to link twice: Once with debug info
> included, and once with it stripped. Personally I trust the linker creating
> the various headers, including the section ones, more than strip's (or
> objcopy's). Yet then I can only repeat my observation that linking PE+ from
> ELF inputs looks to be significantly slower than linking ELF -> ELF.
>
> Jan
>

That was also attempted. See previous versions. And no, it does not work.

Frediano

