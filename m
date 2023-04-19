Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB46E795D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523396.813407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6bU-0003tK-Rr; Wed, 19 Apr 2023 12:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523396.813407; Wed, 19 Apr 2023 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6bU-0003qp-O5; Wed, 19 Apr 2023 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 523396;
 Wed, 19 Apr 2023 12:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YXz3=AK=linutronix.de=alex@srs-se1.protection.inumbo.net>)
 id 1pp6bT-0003mD-Cw
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:08:03 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d532f2a6-deaa-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 14:08:02 +0200 (CEST)
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
X-Inumbo-ID: d532f2a6-deaa-11ed-b21f-6b7b168915f2
Message-ID: <97678ded-9ddf-3b5c-d39d-570614094c35@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681906082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmRIyeoPLiG7jYj40cDzoIoUUKUYA8sqqivPiq0rFvE=;
	b=WoUZGdDHccQ45v1fuReuq0PljU9xscLWXwehJWRYSzaKowDb4m8/LpfkYEYU/6vMtkv4qZ
	GA4dcofUk/TD3KdrCLTu85nG+QVKFMOSCTk04m0pbAFE3PJaFLMkqEnCeYCGNHhBijQ0Pc
	7oBZNBRVL+YTuYfdgPSUVXWWfGw3G8jaiYeLuAEvzR8zGyAuceTimarFxeTAdcq/ghOq3L
	XjbBLl5ralJl3EvrnLa4WW3YDuRC2Vcd/bZEHq6fdyrzfXhQX3d6uubuMEvF6ZGP9pJNB+
	GlzQ8Z3BG+qKmOfqYYULLupcEwvnWMi/1Sq3E5FEgqX72/6l/fGZglC/sPVSZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681906082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmRIyeoPLiG7jYj40cDzoIoUUKUYA8sqqivPiq0rFvE=;
	b=ih/FJzYQ4Beod+3ysVKTE46fl6NY48E93HhJ/s2AIxdICSbSWQIZk5t/M+IimzF85Xx85s
	QSZ5h5pTF7EWTFDA==
Date: Wed, 19 Apr 2023 14:08:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] tools/xenstore/xenstored_control.c: correctly print
 time_t
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230412090104.3794213-1-alex@linutronix.de>
 <fda641f1-e87e-3dc0-85a5-acf91d6f39ff@suse.com>
From: Alexander Kanavin <alex@linutronix.de>
In-Reply-To: <fda641f1-e87e-3dc0-85a5-acf91d6f39ff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/23 08:35, Juergen Gross wrote:
>
> I'd rather have something like:
>
> diff --git a/tools/xenstore/xenstored_control.c 
> b/tools/xenstore/xenstored_control.c
> index cbd62556c3..f9452d63b4 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -666,12 +666,12 @@ static const char *lu_reject_reason(const void 
> *ctx)
>         time_t now = time(NULL);
>
>         list_for_each_entry(conn, &connections, list) {
> -               if (conn->ta_start_time &&
> -                   (now - conn->ta_start_time >= lu_status->timeout)) {
> +               unsigned long tdiff = now - conn->ta_start_time;
> +
> +               if (conn->ta_start_time && tdiff >= lu_status->timeout) {
>                         ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld 
> s",
>                                               ret ? : "Domains with 
> long running transactions:",
> -                                             conn->id,
> -                                             now - conn->ta_start_time);
> +                                             conn->id, tdiff);
>                 }
>         }


Thanks, I just sent a v2 that does this.


-- 
Alexander Kanavin
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 39; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen |
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700
806 | Geschäftsführer (Managing Directors): Heinz Egger, Thomas Gleixner,
Sharon Heck, Yulia Beck, Tiffany Silva


