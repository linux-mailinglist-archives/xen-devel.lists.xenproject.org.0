Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FB1D04DF
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 04:29:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYh7a-0006rw-1M; Wed, 13 May 2020 02:27:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WltO=63=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYh7Y-0006rr-AP
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 02:27:44 +0000
X-Inumbo-ID: 52c1e816-94c1-11ea-9887-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52c1e816-94c1-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 02:27:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a4so12255244lfh.12
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbFr1/1CMDbdIRzckOMwfDFKihc0fhWTkKaWoFSjiV4=;
 b=PedfiEa1+y5MEmJ4mgTmTNy0cneAUsmmn4nAKzyhTNXxfRV/f7r8Mlx7k3IACyOYjr
 HVtjtwOieHlVgaIYZQ5Nnd4DG8JnMdbWv94zhO1SvDysBAv0Fe6/tbHQVKL8enuaLPkN
 vfyQdCAFAE3E5hwi27rqagYhYPkeCdOE3SXkSyXGEHhV+AqPMsEz2Vel4qMwN6GQDKgE
 YTXnFkgVQ27PGdAC6LU7z79UOZlg84N3aYAuSG2ytRFIUYfY3/yAM/9bKPQwxyQ7Nzv4
 XTonFk91qNZ1da2qhl1IWDl9CsMIO2QXH79r3rhdOtENxlzP2+02HLzyS/CvUVim1bHT
 HGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbFr1/1CMDbdIRzckOMwfDFKihc0fhWTkKaWoFSjiV4=;
 b=iljccZmSlvIh/nXzEG2zJevbht50sFw8ZyjwVyZnzv1Z3vodVGkc+3s3n3ZHUY+B4b
 cgkRvphVzPbRq65iJnOaqZWVMwy7rVlKjNtv6pZpzigS0ZXqsR/HhvvMXXVD+SXJkl1H
 5rWyLCCCFmT2KbkpAmRnXTDtSo3VqOra803uvKx9cQvt+cMMadthvQwKZCdFYmjRzmDi
 E1u/xbBaJkFAhcMhYbksuLEN+dc8Mwf0hc65ZPXHcxvK+g0KzI4TZ8J9J+yyh70Y1PFH
 PiqApm0O0rimaM2QNYqtZ318ayjDOlqQFiW38tUTX1M1atDA4fiCCGMAlfPNuDPZ/f9f
 EP4A==
X-Gm-Message-State: AOAM531s2fFqWe9K0u7bZdqv/AIfN/RyX/wNwSIKuIlg+rcy912r2S2/
 6yL2UewzpBKfxXh8dku1DDNe0nqYXqTZ49f+ClM=
X-Google-Smtp-Source: ABdhPJy+lMlAjOrCt3+JbkqTi/DIl2lwNtkJtXvQ0LfhsJwEWn9RfvFqJjLRpXLho2ThXXeERZkQ+PBYVvwFSfPqVa0=
X-Received: by 2002:ac2:4c3b:: with SMTP id u27mr16187841lfq.212.1589336861936; 
 Tue, 12 May 2020 19:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200512191108.6461-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200512191108.6461-1-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 May 2020 22:27:30 -0400
Message-ID: <CAKf6xpt3hOM+y_w1s99phu8exHE+xyAsYM=6qHFqpD9mY_U5AQ@mail.gmail.com>
Subject: Re: [PATCH] x86/build32: Discard all orphaned sections
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
Cc: Stefan Bader <stefan.bader@canonical.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 3:11 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Linkers may put orphaned sections ahead of .text, which breaks the calling
> requirements.  A concrete example is Ubuntu's GCC-9 default of enabling
> -fcf-protection which causes us to try and execute .note.gnu.properties during
> Xen's boot.
>
> Put .got.plt in its own section as it specifically needs preserving from the
> linkers point of view, and discard everything else.  This will hopefully be
> more robust to other unexpected toolchain properties.
>
> Fixes boot from an Ubuntu build of Xen.
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks

