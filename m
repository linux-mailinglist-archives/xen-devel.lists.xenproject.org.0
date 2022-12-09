Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC11648939
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 20:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458224.716123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3jQb-00075p-8u; Fri, 09 Dec 2022 19:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458224.716123; Fri, 09 Dec 2022 19:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3jQb-00073W-5a; Fri, 09 Dec 2022 19:53:01 +0000
Received: by outflank-mailman (input) for mailman id 458224;
 Fri, 09 Dec 2022 19:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bplO=4H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1p3jQa-00066w-1z
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 19:53:00 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f9fc4e-77fb-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 20:52:59 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so13842823ejb.13
 for <xen-devel@lists.xenproject.org>; Fri, 09 Dec 2022 11:52:59 -0800 (PST)
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
X-Inumbo-ID: 14f9fc4e-77fb-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MCMlJcD6iXKtS3UFwoBKLvLZ9cQSwTFMAWlCnvYBt0I=;
        b=FDT1mpc6gLA14aARf55JQ5YWuUkD4uPDZ78xHrbIhQF0a/Vvt0Qb8xMynFdwOWOGdo
         F43V7TRzFx9fEYYgVLRzkZCuvPz8dD5gVl5M7JOo8ag4yz67mXT6hTgZSy0RFeMaRZez
         QGjEDvliGGQJi1CUsoYnJ2FLqzXDy3EnQuimQ01qJ4AZMaw5fqXGwD0lFYSkAOzTCjdk
         TeCaUoFlu4xA5uxhX2KFSOi+LQIZZT6yi/o3h4Eujg/8xlqDtG+xJoUcAD2fSFgE8D8C
         cd4oaojm+7yXMtyaKjhJuWjnS/1VWiGEFJszOWV4pvDskm9Oi1jhllRfHncauG0x7GSV
         IhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCMlJcD6iXKtS3UFwoBKLvLZ9cQSwTFMAWlCnvYBt0I=;
        b=7yWXx61KEqWwTtAiOZUIGIdZ0CvBIkGHWS6dTokmiQGG8zTUaAuYQQf8LXzGIgS78A
         /f2H99cLlOIcKCNnvDtHNgkOVxR1nbSdnsx+X1trasotwwgRqsrDwogkulclLvMpccCk
         G2tCgHe6UP6ByReyiY82yaxdSEqG67/+e8cfALQAYFT2c1omkgtFXQTcwC6zeBwch7Hx
         N5GFbgJzkDC8BOI2gtrpwQ52NGiBbhRy1YeJTG20jV0q9Ae5zPjTnE7ecpkq/sDLnN1B
         BhpoJcp05NihkJzkc1KIZaP/7E5basruUukLmtYBMFmgrKINpqkDKMvPNdnf7hmSvhDj
         4JIw==
X-Gm-Message-State: ANoB5pnTpZhG2AE5xN5G5azV940fHgH3rsz/+2hXnj8jTqkzqY+y0L6O
	nzdlSY2otgs3MaY91T5j0s6Uhnvo2bI/1xnZc1LpuRRK
X-Google-Smtp-Source: AA0mqf4uVtC15WpBNZ0aaiAA0XLq0Zplm9lO7DFwHLvObY8XPbgK00KHX2lQHia2gS5i3GH2/3A6TjgkbO4coMLyUf4=
X-Received: by 2002:a17:906:cc8f:b0:78b:8ce7:fe3c with SMTP id
 oq15-20020a170906cc8f00b0078b8ce7fe3cmr79785421ejb.557.1670615578912; Fri, 09
 Dec 2022 11:52:58 -0800 (PST)
MIME-Version: 1.0
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com> <028fc34e-8a39-b0b5-34bb-2c96a82fa452@suse.com>
In-Reply-To: <028fc34e-8a39-b0b5-34bb-2c96a82fa452@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 9 Dec 2022 14:52:46 -0500
Message-ID: <CAKf6xpuDhvcPS5H_P+XkmVbUTTGUtsDR4cVwNM8z6g3=MkoBBg@mail.gmail.com>
Subject: Re: [PATCH 5/5] x86/tboot: actually wipe contexts
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 8:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Especially with our use of __builtin_memset() to implement memset() the
> compiler is free to eliminate instances when it can prove that the
> affected object is dead. Introduce a small helper function accompanying
> the memset() with a construct forcing the compiler to retain the
> clearing of (stack) memory.
>
> Fixes: c021c95498d9 ("x86: Replace our own specialised versions of memset and memcpy with")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

