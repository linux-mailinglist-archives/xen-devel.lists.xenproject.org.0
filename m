Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4E2451CD
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 22:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k731m-0004iY-4W; Sat, 15 Aug 2020 20:43:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b+hO=BZ=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k731l-0004iT-6Y
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 20:43:45 +0000
X-Inumbo-ID: ee23706c-fd4f-4c85-bf15-d1b861936436
Received: from mail-qt1-x82a.google.com (unknown [2607:f8b0:4864:20::82a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee23706c-fd4f-4c85-bf15-d1b861936436;
 Sat, 15 Aug 2020 20:43:44 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id x12so9626821qtp.1
 for <xen-devel@lists.xenproject.org>; Sat, 15 Aug 2020 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=S+HJmDAvfo+EAJKHB/wCzpeH++k18mUMK0IKGG3qFV4=;
 b=XirOfkH0oik4MXaQZkwRfMBt2dSLhWz/9naePgvnmGUugRtdJ2Obs/HFkzmbnu06D3
 /grJJwbFs5H4qWoFsYOm4N5tjJwxZWEnT16NCl11HuJN9o8SjGdFYOmm1bTum7s7iDhc
 qf0cAaHixQqZMTmoyVsvymVgr0JWTuTBiwbgzu3HAkpYTZ3ssfhovjlDvROw10QFhyCu
 ACgEuQZZgtmoL8wCs6yfqf+1gQE5YKm5nwKpDFuyIJXgHsj+dFVkC8IeEhq3ZWBbprlt
 JxczSrtxCu5v3kgmVrTNz6nclHmb2m7iZhLWzh3D8ga0NsdcQfYbHHdgK1AmtlJj4E4w
 Ls4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=S+HJmDAvfo+EAJKHB/wCzpeH++k18mUMK0IKGG3qFV4=;
 b=L/xOCDsuMB1yqDOgswcNDlWPxlYfjmJLytMNyUBvpRdI6nJQ36mxA1y78Eozx2h3iK
 i0NTEtI8cMZ3vCT6Eqd+9MkM/E4fzv5MU1ars+Ao3Ledst931bMI6TQlHQXHtrJOkCsi
 HsiuBXCg1n+7r6jBhhAgVWgoThO9WPUYlWbrAjDRkUn6PcuVgw4YmCTIyX4y7lZzKOqN
 r7YfKQh8asTnLPi/UtSRHss6OsQ8+TOwVy03Qo9ng+rXwkKDQmjhzPvyZbbvHJuaAMG3
 3w4JP7MEMTTSQ27O/F0FkFdtXnPkJX04DkfQB+84AaPEP6y5SjreAl19plvE3uu61oNB
 DfJg==
X-Gm-Message-State: AOAM530G00v6zSg9YI6bV/F3u1L5mmvJ9biB/7y3oPv6QXwcmRtbYsY8
 aenF+pB36hbk3FYqFQblcPpgU2nh7zFxZSdUHo4VZ/SZXPjZxg==
X-Google-Smtp-Source: ABdhPJygao+3aI7D0SAhPBajAFOe0N+XjxkQp/0TJstone5djZDSLz5Yep/TBlHtfIWuqDp7kXyMqwwNv6TQ11rDZzA=
X-Received: by 2002:ac8:73c3:: with SMTP id v3mr7748969qtp.266.1597524223398; 
 Sat, 15 Aug 2020 13:43:43 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Sat, 15 Aug 2020 13:43:32 -0700
Message-ID: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
Subject: u-boot vs. uefi as boot loaders on ARM
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: vicooodin@gmail.com, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi!

with the recent excellent work by Anastasiia committed to the u-boot's
main line, we now have two different ways of bringing ARM DomUs.

Is there any chance someone can educate the general public on pros
and cons of both approaches?

In Project EVE we're still using uefi on ARM (to stay closer to the more
"ARM in the cloud" use case) but perhaps the situation now is more
nuanced?

Any and all info on this would be very much appreciated!

Thanks,
Roman.

