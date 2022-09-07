Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DF5B0283
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401265.643082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsvP-0006uM-Un; Wed, 07 Sep 2022 11:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401265.643082; Wed, 07 Sep 2022 11:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsvP-0006sY-S7; Wed, 07 Sep 2022 11:08:55 +0000
Received: by outflank-mailman (input) for mailman id 401265;
 Wed, 07 Sep 2022 11:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVsvO-0006sS-3x
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:08:54 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7459ede2-2e9d-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:08:52 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id fv3so8071209pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 04:08:52 -0700 (PDT)
Received: from leoy-huanghe.lan (45.78.11.189.16clouds.com. [45.78.11.189])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a627bc4000000b0053e5daf1a25sm2086687pfc.45.2022.09.07.04.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 04:08:49 -0700 (PDT)
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
X-Inumbo-ID: 7459ede2-2e9d-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=dMoKtINDOiHP2DbhPagk9i3FrvJ35u3SVzn9sB/eiOI=;
        b=F6kk3IfPjwNcftonfibLkfK3RpKjkoSB+GETUAAGwDVLHvXzR3SpgGsDljqw3+jI9G
         YMAhgB5Pbov9Mw9Al0ZdrIBr7HO4NLVeWPW7jgN9+iJb7Z+7OMsg//haQQB40jIppgKH
         OipbwKADd6swfiAgqYN29uLHLowUCxxqKDB39616JY8js/DXp7iEvOxrOewLpXuSxJll
         sNto+jyyjnjIJFpqoIcWN28ovQSTzqY/hqvGzGF0neZ0epG9lDNfTLU5PX8MrrCPktyf
         zoCFiq+MIyNbB5MLvkRtiCJogm4WU5Ps3ZYOhwC0IyGgFN2CQtQVpNHRn+KutY1B5+WG
         EHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dMoKtINDOiHP2DbhPagk9i3FrvJ35u3SVzn9sB/eiOI=;
        b=Pn01bVX3blR3GhD4ryumGSg9ebfQAoNxqPd7flVzC0uveTd7MSfEikRLfbm5H8gcsI
         w+wXn7vH/5ratZtb/LwYvx+uy6r/x6u+Hdh3jUnRZNuM2vul8bHfMP4tGqC0mbi+7Rh2
         QBdM2VAMPaNdPG5SSSiEc6VUmO5jueW4yJIUo90B+ldoAJhhFiY0VWEJVcbFOTL+WfPJ
         O/wMjKug2ixGRwxvUSon+glMYxHcg48bY5pxWeyLgGuYLmcNoj/yM7YYTYj0LF7TVuGK
         vp4fkGRsa6olcszKxvbxBTm91C5r/NXQWB6xuZtUKMXc43E/SrS/MaXxNW7Wgl+gvtey
         cgVQ==
X-Gm-Message-State: ACgBeo1tIQbfrKTeLF5RMip8V5/qQsE0LD1CHhtxcXdGJvoPP7ZaAWSJ
	d2AgeL72ueEJwxNghpNqVX7gRecGSvmlE70ZKrU=
X-Google-Smtp-Source: AA6agR60FyeN72Xi7gx+NWvk9SS2CLeeCzr1AVVjeUoagMqm1MV3wkApTe5ErtrPf5zPMAn8kEgMCQ==
X-Received: by 2002:a17:903:1c1:b0:175:4cf0:31e4 with SMTP id e1-20020a17090301c100b001754cf031e4mr3390600plh.95.1662548930501;
        Wed, 07 Sep 2022 04:08:50 -0700 (PDT)
Date: Wed, 7 Sep 2022 19:08:39 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Message-ID: <Yxh7tycPrb8YXXXK@leoy-huanghe.lan>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
 <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
 <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
 <5ce7f63c-5ba5-f2cb-8e3e-f6dd2d9d76f7@suse.com>
 <524F3B92-5298-4BE3-864D-A076A8873800@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <524F3B92-5298-4BE3-864D-A076A8873800@arm.com>

On Wed, Sep 07, 2022 at 10:05:54AM +0000, Bertrand Marquis wrote:

[...]

> >>>> I think a define in compile.h using stringify is the easiest solution:
> >>> 
> >>> Ah! I thought you were suggesting to tweak __stringify. This is ...
> >> 
> >> Also possible but a bit more tricky
> >> 
> >>>> #define XEN_STR_VERSION "__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)”

Just remind, We need to define XEN_VERSION_STRING in compile.h.in rather
than in compile.h, something like:

  #define XEN_VERSION_STRING @@version@@.@@subversion@@

> >> Quotes at beginning and end should not be there.
> > 
> > I have to admit that I dislike the STR infix. I'd prefer a suffixed variant
> > (e.g. XEN_VERSION_STRING) or one omitting "string" altogether, e.g.
> > XEN_FULL_VERSION (albeit I see "full" as being potentially ambiguous here,
> > since one might expect that to include XEN_EXTRAVERSION as well then).
> 
> 
> Version is a value so here I though it made sense to distinguish that one as it is a string representation of it.
> 
> XEN_VERSION_STRING is ok I think.
> 
> I generally dislike anything named FULL, EXTRA, BASE or other which are just unclear.

XEN_VERSION_STRING is good for me.

Hi Bertrand, just let me know if you prefer to cook your own patch for
this (essentially this idea is coming from you) or you want me to
follow up for a new patch?  Either way is fine for me.

Thanks,
Leo

