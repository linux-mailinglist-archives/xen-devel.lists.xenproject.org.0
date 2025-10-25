Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99CC09F80
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 22:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1151243.1481919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCkaY-0004cs-LH; Sat, 25 Oct 2025 20:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151243.1481919; Sat, 25 Oct 2025 20:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCkaY-0004aA-Hq; Sat, 25 Oct 2025 20:10:10 +0000
Received: by outflank-mailman (input) for mailman id 1151243;
 Sat, 25 Oct 2025 20:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aHFQ=5C=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vCkaX-000392-GS
 for xen-devel@lists.xenproject.org; Sat, 25 Oct 2025 20:10:09 +0000
Received: from mail-yx1-xb133.google.com (mail-yx1-xb133.google.com
 [2607:f8b0:4864:20::b133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99dab77f-b1de-11f0-980a-7dc792cee155;
 Sat, 25 Oct 2025 22:10:07 +0200 (CEST)
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-63e393c4a8aso3925787d50.2
 for <xen-devel@lists.xenproject.org>; Sat, 25 Oct 2025 13:10:07 -0700 (PDT)
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
X-Inumbo-ID: 99dab77f-b1de-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761423006; x=1762027806; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZHvKenrpBFiKUIp59zxttbgmMI64UBGFdP5y2QzeKQ=;
        b=S+hByAWsvQwMqT+rFMGAsSLjMPceIq7HznJSzhdKHCxwG2LB/CPpcTkpZZOx8gsW5E
         xJkRB8yvGn8O5U6BSFSh4wJzYYV59a6eFqdxaNo1whXN8cHPAljjgHmgqlrYFUghgM6s
         QtVPrSEaHBQkZs4ZQo0GgxZogSmmShpKxgfaVCXqjXffSYEClg3HbDm0TRuPZONMLx7C
         O4ag3Ku5v9U55MeySnAIDO4rV6L4s9xo0qBEJUX7X9ZOL/Vdq1R1vfhWiC4kq/ivBf+B
         00PFk0J0UdfvTaogtAlWpmanDvMkmZDjWl8xxbuFjb7YlvQCiQfR/YW2KvcrmJYch9C2
         4qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761423006; x=1762027806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZHvKenrpBFiKUIp59zxttbgmMI64UBGFdP5y2QzeKQ=;
        b=I/8YQlUKgxtIts+b5Bz7HybsBr3WEPEmQt40B3oxlqWqxE8h28cxlW4UAdLUpSvz8f
         o1PdtWmh4jjutCHgdP77+jPrccyRjerEymbU12if1B2q+Qo/H59ZuQZhYQE+i3M15iwi
         bSxOisWxxCVP3H7BmSrsBCNJgI3Zq92gAuqXldgTQk9XO8AvP3rZ8LPHFKRXhVXmv6ZK
         AkkubTDU8lVqxfQe1a3pKB8wxV55f1o/fA8y0VXtTdRhIyoRwLz8MygkOPvWES0oyhbt
         UzaGdgg9mgvYN3OlK1uEt2LsIWxyRrVdmuWyM4H0Y9HsBOLSvsSAKgikMJ58goCaiw0p
         /sQg==
X-Gm-Message-State: AOJu0YxCDpZCwM+6OlwOKFXbMm5EV6wpxTGewCt4DNCMPG4FFjNJi/lE
	MgGGBHQ8ig+edJj2hWPr/E2/D32g2cN1lStM7vmyMXgh4gXRL1j8AsUvEWBy7t3e2Gc3fx2eQ3t
	BWg5l1yXoeF+yPgu9PKjtnFojHbRUxIcRrA==
X-Gm-Gg: ASbGncuYEGXKSVeeHCONR/9xepfOmUBXsUOfE38dFLy2t0XnHn4E7gKMtgra2czW5a0
	+IaEMEgi6UGv/Z2zj2xT97pO3L3r6MnoFvSctykAFOuzmmU7VBv1Bq0768gRXGpqnf3uKFDldpW
	MSqYREAfY67X7Wi8aiYXgDnvieUl3vJX0ykwp9xj4tAm0QLfeWOofqcPK43wWN3d1wYYsAWWJmQ
	ZVdY8/Imklywjim8KwEKt3y88wrTe3bJM3Pi7T0bOatnUOvbDA4M0Vv3eey
X-Google-Smtp-Source: AGHT+IEwga0Gy48EGTX6J/zYPv3IOrrKdqpKEO1MgqtzAx0IfS28AlLbWfUe2jHUmEThmR4P7BrOBqAr0hO/ak7Nq7Q=
X-Received: by 2002:a05:690e:1483:b0:63e:29ad:ad8 with SMTP id
 956f58d0204a3-63e29ad0e51mr18247718d50.25.1761423006511; Sat, 25 Oct 2025
 13:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHt6W4dnM1pLMnDVyywc_2d-6nry7pFCYomSvRjyuH7sRm0J4Q@mail.gmail.com>
 <72a2f002-23fd-4d06-8c44-3e535533bec2@citrix.com>
In-Reply-To: <72a2f002-23fd-4d06-8c44-3e535533bec2@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 25 Oct 2025 21:09:54 +0100
X-Gm-Features: AS18NWBrAfHa2q4j67EgIj2tXQtQPp61krvPOaAIoeeBoq2I19sOGmwSfLy8G80
Message-ID: <CAHt6W4cumdaGHzwNTMzyYvFVCs8X8FoddT1KaiGrmAVgUYgw+g@mail.gmail.com>
Subject: Re: [PATCH] xen/pci: prevent infinite loop for faulty SR-IOV cards
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Oct 2025 at 16:58, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 24/10/2025 4:13 pm, Frediano Ziglio wrote:
> > If a SR-IOV card presents an I/O space inside a BAR the
> > code will continue to loop on the same card.
> > This is due to the missing increment of the cycle variable.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Yes, that's buggy.  Was this from a real card, or just code inspection?
>

Code inspection.

> ~Andrew

Frediano

