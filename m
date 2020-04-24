Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD721B8112
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 22:47:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS5Dg-0005Ke-Ix; Fri, 24 Apr 2020 20:46:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qNy4=6I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jS5De-0005KZ-J0
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 20:46:42 +0000
X-Inumbo-ID: b3797da8-866c-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3797da8-866c-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 20:46:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id e26so12178384wmk.5
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jN1K5UO6MSKddnMHyc9Lm4KsL9QtSh9bow9HsleKSFU=;
 b=mchb71cmx3StgbmJISbNdoe6FRGQFtbp2sJstSHaR1DeZQzEmKJSujPZkup7OhgWpJ
 J3rWbWNVu/jXsWc2IlKIqHSNluddFCIPYhpxBlgvwKfIX704nV0Yx433dmvGxCzTn0aD
 cvAjisCqK7kvfpLH/5PAUvHTd8hR0YKsmp1E9uvO5dCGzh5pqcGaF38208b/eoD37m+o
 H6y9f6e0rGvkjARpKzazOloJVOnJBk8Q4LqXuC22GbebhDqmnerlpxYSylnixskT1fIO
 jFtOEwqnUU0773x1FEcK7iYrKSmfOxDhZ/ykB2O5eLZi4JH+TkO2uPvtNaN/M6RuK0/S
 VEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jN1K5UO6MSKddnMHyc9Lm4KsL9QtSh9bow9HsleKSFU=;
 b=e0pwqoZ6UAR//sPaTiV/AzVfRIJTWqgEuTbti8mVYdmP4HFKxAL5/ymFACstfj/RhZ
 SUKpRFvueWjIlKYuJdE1uY0PtC+/HywBC09m9o/4vRebnC2V0nNTVmrc2yM8dWNzRrQk
 lXE/xHquV5CkTR0xDGKQBf1iwj+6bSB3MHAdJKwyxF8ww9YWI+8j+7WgZdjSZfLY+tJI
 MzlfjYJr5ZmrntkMgMIIeYwpc5BwG5+o/ifNNv/OEEp9/gCcQrZ6bzbXFZjLbe8i+Akk
 59QI8U9k7nq2IjXUwwjZ3qxbydUHXFSP8s7rMhIXVmmXqd3EQn7uqxBVyJTt2AmUAdw3
 HJOQ==
X-Gm-Message-State: AGi0Puak/KOOfSXeRac2J1mXmkAud8o5nnqfSv+ciMUJX9WeVggUalzH
 LmdLr1v2zn1Mis1IkNCjWcXbCn6LCFTer3A6bNM=
X-Google-Smtp-Source: APiQypIlKeMVKIfYKzwb7bf2D2sTSTn5yYqF3noFYYw/QpMMNVu8jIk+Wad4dEmzIyRlnBDGzgpFqfARnX0EvcOHCMA=
X-Received: by 2002:a05:600c:28e:: with SMTP id
 14mr12803469wmk.79.1587761201071; 
 Fri, 24 Apr 2020 13:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR04MB505620B32C8289C6106D0B2AF9D00@VI1PR04MB5056.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB505620B32C8289C6106D0B2AF9D00@VI1PR04MB5056.eurprd04.prod.outlook.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 24 Apr 2020 21:46:30 +0100
Message-ID: <CAJ=z9a2ZN0ZxzY=kdJfonLCDQXni7yr31yxNp5qwzOvWJxDUqQ@mail.gmail.com>
Subject: Re: arm: DomU Networking enable leads to Dom0 kernel oops
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 24 Apr 2020 at 21:29, Andrei Cherechesu
<andrei.cherechesu@nxp.com> wrote:
>
> Hello,

Hi,

Please don't post using HTML and instead configure your client to use
plain text.

> Do you have any idea why this occurs? Have I misconfigured anything?

OOPS should never occur because something has been misconfigured. The
log suggest the address used is bogus, did you trace where the address
was coming from?

Also, looking at the log you are using 4.19.59-rt24+g9d2b51c. AFAICT,
this is not the latest version of RT for 4.19. Can you please use the
latest version to check if the bug can still be reproduced?

Cheers,

