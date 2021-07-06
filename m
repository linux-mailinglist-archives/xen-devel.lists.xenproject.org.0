Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F753BD6AC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151235.279521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kNT-000669-Es; Tue, 06 Jul 2021 12:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151235.279521; Tue, 06 Jul 2021 12:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kNT-00063Q-Ak; Tue, 06 Jul 2021 12:40:39 +0000
Received: by outflank-mailman (input) for mailman id 151235;
 Tue, 06 Jul 2021 12:40:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6NH=L6=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1m0kNR-00063C-Sw
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:40:37 +0000
Received: from MTA-07-3.privateemail.com (unknown [68.65.122.17])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cecd37e-de57-11eb-8494-12813bfff9fa;
 Tue, 06 Jul 2021 12:40:37 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 5F5D5600A3
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:40:36 -0400 (EDT)
Received: from mail-wr1-f51.google.com (unknown [10.20.151.239])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 2802C6009C
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:40:36 -0400 (EDT)
Received: by mail-wr1-f51.google.com with SMTP id n9so8571269wrs.13
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 05:40:36 -0700 (PDT)
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
X-Inumbo-ID: 5cecd37e-de57-11eb-8494-12813bfff9fa
X-Gm-Message-State: AOAM5333bfBk4jCu64A//q6NhagtKeGIOi2y1L+A7eUYrEwSTyaOTIP/
	0WIP2t8xRtUt34H7bEzLFhw2UyT/nEINhzqRhUY=
X-Google-Smtp-Source: ABdhPJwwR1HY4vEZAMHdBSSZ0zD3Y/rZRF+7k2sqI29y2KgvEtuFrJ2tEJDbm3sl4klQBCluUSPIlypzYzuVVPyAHZ8=
X-Received: by 2002:adf:fb92:: with SMTP id a18mr21044642wrr.182.1625575234821;
 Tue, 06 Jul 2021 05:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com> <6f4c081d-732d-87c0-2ad9-0aafea1ad927@suse.com>
In-Reply-To: <6f4c081d-732d-87c0-2ad9-0aafea1ad927@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 6 Jul 2021 08:39:59 -0400
X-Gmail-Original-Message-ID: <CABfawhmnaN7M_Trj8bofT+Q0hZmZdwv+h5jtfOqq5uDqOcHkjA@mail.gmail.com>
Message-ID: <CABfawhmnaN7M_Trj8bofT+Q0hZmZdwv+h5jtfOqq5uDqOcHkjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/mem-sharing: mov {get,put}_two_gfns()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jun 29, 2021 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> There's no reason for every CU including p2m.h to have these two
> functions compiled, when they're both mem-sharing specific right now and
> for the foreseeable future.
>
> Largely just code movement, with some style tweaks, the inline-s
> dropped, and "put" being made consistent with "get" as to their NULL
> checking of the passed in pointer to struct two_gfns.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

