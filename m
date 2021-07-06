Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67753BD695
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151225.279496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kK3-0004C0-La; Tue, 06 Jul 2021 12:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151225.279496; Tue, 06 Jul 2021 12:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kK3-00048z-IB; Tue, 06 Jul 2021 12:37:07 +0000
Received: by outflank-mailman (input) for mailman id 151225;
 Tue, 06 Jul 2021 12:37:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6NH=L6=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1m0kK1-00048t-NU
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:37:05 +0000
Received: from MTA-05-4.privateemail.com (unknown [68.65.122.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dddad069-de56-11eb-8494-12813bfff9fa;
 Tue, 06 Jul 2021 12:37:04 +0000 (UTC)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id D8AA660103
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:37:03 -0400 (EDT)
Received: from mail-wm1-f42.google.com (unknown [10.20.151.202])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id 9B0D160097
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:37:03 -0400 (EDT)
Received: by mail-wm1-f42.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso2149398wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 05:37:03 -0700 (PDT)
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
X-Inumbo-ID: dddad069-de56-11eb-8494-12813bfff9fa
X-Gm-Message-State: AOAM531NhlzHS9efv0R2PR/Dlq8j9hT8pxBIIOdQb/SMNNoZfaSoCyXb
	sxP8hBOkMh8Ht/AUt2Affz5Mu5Vo2CWomDwuP9M=
X-Google-Smtp-Source: ABdhPJw3UgtW0PQllgmjCmQVPO7l5A8v/Q/b46IvkQ+6deZkV+ploMA/xjLfLbnYgTVzyQXXPjdFjjIZi6B2LLrDCSw=
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr20063701wmk.77.1625575018325;
 Tue, 06 Jul 2021 05:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com> <932211b2-c3aa-17f6-9fed-ca762e189786@suse.com>
In-Reply-To: <932211b2-c3aa-17f6-9fed-ca762e189786@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 6 Jul 2021 08:36:22 -0400
X-Gmail-Original-Message-ID: <CABfawhk4N-KznkFhmk3Q749tTp3X+j0fCwDXooYZEDdfQ7Fchw@mail.gmail.com>
Message-ID: <CABfawhk4N-KznkFhmk3Q749tTp3X+j0fCwDXooYZEDdfQ7Fchw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/mem-sharing: ensure consistent lock order in get_two_gfns()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jun 29, 2021 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> While the comment validly says "Sort by domain, if same domain by gfn",
> the implementation also included equal domain IDs in the first part of
> the check, thus rending the second part entirely dead and leaving
> deadlock potential when there's only a single domain involved.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

