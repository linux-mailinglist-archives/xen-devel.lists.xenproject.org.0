Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C597D7F4E8E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638964.995993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5rDy-00082b-DO; Wed, 22 Nov 2023 17:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638964.995993; Wed, 22 Nov 2023 17:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5rDy-00080q-Al; Wed, 22 Nov 2023 17:41:18 +0000
Received: by outflank-mailman (input) for mailman id 638964;
 Wed, 22 Nov 2023 17:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1AL=HD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r5rDw-0007Vt-JG
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:41:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55767143-895e-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 18:41:15 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-409299277bbso32479615e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:41:15 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c199000b0040a44179a88sm116125wmq.42.2023.11.22.09.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 09:41:13 -0800 (PST)
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
X-Inumbo-ID: 55767143-895e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700674874; x=1701279674; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O4MP/QKQiUr9Us9shiH9LsImv1txtNTDolAbelf0X1M=;
        b=hTBTaDF3pLkGjBm4Lf4HTBvQnVneRjzaliG98iXAAAnyzYqWuUMlDl12o/dadiLx63
         CQD7il1tYwi7ub+SH37yNODpzY43Nny6gzzvSO1vW4+Q2uirqtEtOjKvcgCoYHYRKyBo
         uz6ExQHlLiz4QQZ0qnpfhtxgoIQL5mtbcffBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700674874; x=1701279674;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4MP/QKQiUr9Us9shiH9LsImv1txtNTDolAbelf0X1M=;
        b=TW6M+NIDr6C9hgtvzYwwwwAnOKU7yUFFhn5k9Fa8Q25TtjHKMl+/mpYGoF4MJcrsD0
         ux0NNZpHVolS/YukZ7+Fu78rdowqFW4v46aQF1gk+XCRi8TGfZ741QSPpBHAST3vRfDB
         ug/A9V/7s06bMX21bQfJv66p76FEwtoVbLZ8+pLLPVvhWn6Usb30zJXdjx957fpTySbe
         by2IhVA/iXFfPm1PHTTJWoUyhymd9JUCWxJgYth/aVtmGB/sXsPr9YWTe1XJlXrKPiUw
         yxx5J7QyqF3OsbOAFnek+9uQCbae9oKfeEL8rr4/kyy5fq7Uas68i9XdQs6wSgDtIYC2
         nJxg==
X-Gm-Message-State: AOJu0YwD2qPl99WDYz7p2JpAkiggdI638xoyePcg7EhLgM+7L5szd/Tt
	ibXxI+oSEjlnGz1da2zQcA87Jy2d4/wauB43OW0=
X-Google-Smtp-Source: AGHT+IHGSyqB5/yP2fUUIrRpWuujjLu/yn6cNGVzu4hny178uywvB+EVAErDgyKxmOgdtw49i35wWA==
X-Received: by 2002:a05:600c:3b0c:b0:40a:5806:a617 with SMTP id m12-20020a05600c3b0c00b0040a5806a617mr2166582wms.14.1700674873843;
        Wed, 22 Nov 2023 09:41:13 -0800 (PST)
Message-ID: <655e3d39.050a0220.44374.0cc4@mx.google.com>
X-Google-Original-Message-ID: <ZV49Nz+zYEuARl+5@EMEAENGAAD19049.>
Date: Wed, 22 Nov 2023 17:41:11 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 6/7] tools/xg: Simplify xc_cpuid_xend_policy() and
 xc_msr_policy()
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
 <20231107154921.54979-7-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107154921.54979-7-alejandro.vallejo@cloud.com>

Hi, while rebasing with something else I noticed that...

On Tue, Nov 07, 2023 at 03:49:20PM +0000, Alejandro Vallejo wrote:
> Remove all duplication in CPUID and MSR xend-style overrides. They had an
> incredible amount of overhead for no good reason.
> 
> After this patch, CPU policy application takes a number of hypercalls to
> recover the policy state and then those are passed to the xend-style
> override code so it can avoid them.
> 
> Furthermore, the ultimate reapplication of the policy to the domain in Xen
> is done only once after both CPUID and MSRs have been fixed up.
> 
> BUG!!! apply_policy is sending the policy after deserialise when it poked
> at it in its serialised form.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/libs/guest/xg_cpuid_x86.c | 261 +++++---------------------------
>  1 file changed, 38 insertions(+), 223 deletions(-)


there's a blunder in the commit message. This was a note to myself to fix
something while in mid-dev, and I did, but then didn't remove the paragraph
from the commit message.

Obviously those last 2 lines before the S-by shouldn't be there.

Cheers,
Alejandro

