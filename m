Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A78A145E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703886.1099817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutSz-0004u9-1v; Thu, 11 Apr 2024 12:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703886.1099817; Thu, 11 Apr 2024 12:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutSy-0004ro-VO; Thu, 11 Apr 2024 12:23:44 +0000
Received: by outflank-mailman (input) for mailman id 703886;
 Thu, 11 Apr 2024 12:23:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVMu=LQ=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rutSy-0004ri-87
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:23:44 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554d743a-f7fe-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 14:23:42 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516db2214e6so7081665e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:23:42 -0700 (PDT)
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
X-Inumbo-ID: 554d743a-f7fe-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712838221; x=1713443021; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQODPu6FHcQYR3JyUEnQZ1dUqgFU2GtzUbHXmNRJoww=;
        b=wbnPSqfFw7b6fLGpG81ECAVq1LJjSA4AhiH3Ay8nOu8OEHsLym6GzB28fjB4LUco7t
         UxmrLCI8G+7Mo5iHctmTLzj6yPJXeDKS67QDsd23kQZv7laMU4NLS2NTN88TIgJi3ek/
         MwueIwMIe20DExnegakf2q6Jx9jYceyNBXOXzL4jLTSzO2L0EcEbFFDN4sAsJ+y6n9DW
         Ah/jmFGrm3Gpl4LOR1+V7xeoCrhlpjwkglOUD/HO+0fSAEMRMy24BgqipDvYjvZh0AD9
         P/e5G8lkloC9AcI7cTiL1JZ5eJPlJ2YhK4YHTxycBfYuV2ivXMTJ9uXedEi5MPXgKLAR
         SbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838221; x=1713443021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQODPu6FHcQYR3JyUEnQZ1dUqgFU2GtzUbHXmNRJoww=;
        b=NpyCf8w2L8Fy+O6dpqK7BD578VSIWR2UEhSOplE4w8TY0ik/EZGpSi3wKPrAR4kUWW
         IItGAsM1I7WUscC2Jzkiik+0Qv9g/azqV09hpCPI18ddLhNX45eAGJmRbFJGbldtXvDO
         EPksPwGxPN18Pa4ME36z9qG1ue7Hek+KY0KQhi4OUdYYyoAp59H/3TN6tpso5a3cJBW/
         Ya9JK3BcAofCxLORRC6Xr4DFZibaze41T63kSVWnDAtA+2bf0vQOnmTaMu0sOcLDu/y8
         p6ojscuFvxI8LOEz3WgAg0MJFSRI+yktv375f0H6ekaF7rGBps/J0vF4J53BZLANxRtB
         3LfA==
X-Gm-Message-State: AOJu0Yww7xvQnAC14RJft9Aa+FVqx7PRCKgxt7ia6buxXAOh2uxcng8O
	YrbB4L4gymtnEYwFKOI01Vfqy+XA/cDQDuPOV6goYt+LPYEO/AWsapRLbgO05lOwmK/38VIbwwX
	DaTFNnKGbQIyEAhLiAfoKyxaNsSHrJjsf8Tk0wQ==
X-Google-Smtp-Source: AGHT+IFba9IPlYJm7O8mxw/YQonyyFo4T7SCxsLHzVU+TcLHh0IRGTUClI3/n9h/OK9L/PfsfctJawOfpvTLZ5nIYn4=
X-Received: by 2002:a19:6a04:0:b0:515:bb3a:116a with SMTP id
 u4-20020a196a04000000b00515bb3a116amr3298256lfu.41.1712838221370; Thu, 11 Apr
 2024 05:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
 <c00304a2-f990-4fb3-9276-7f4907b583ea@perard> <CAAjaMXbhjQT-PFJmYBOyXWbOwMKsUEa964+svR8XkJ-tYQ4a+g@mail.gmail.com>
 <e8103b89-c324-46a3-b58a-dc8253acee53@perard>
In-Reply-To: <e8103b89-c324-46a3-b58a-dc8253acee53@perard>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 11 Apr 2024 15:23:25 +0300
Message-ID: <CAAjaMXZshO5-uw=k33LhmOraXR6w9OG3+Kv6KPS0Y4xRaYcKjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] convert LIBXL_DEVICE_MODEL_START_TIMEOUT to
 env var
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 14:24, Anthony PERARD <anthony.perard@cloud.com> wrote:
>
> On Thu, Apr 11, 2024 at 01:23:07PM +0300, Manos Pitsidianakis wrote:
> > Hello Anthony,
> >
> > I do know about that, in fact I used it and it did not output your
> > email. Here's what the `get_maintainer.pl` outputs: (same output for
> > all patches):
> >
> > $ ./scripts/get_maintainer.pl --no-l
> > ../../patches/libxl-dm-timeout-v1/v1-0001-libs-light-add-device-model-start-timeout-env-var.patch
> > Andrew Cooper <andrew.cooper3@citrix.com>
> > George Dunlap <george.dunlap@citrix.com>
> > Jan Beulich <jbeulich@suse.com>
> > Julien Grall <julien@xen.org>
> > Stefano Stabellini <sstabellini@kernel.org>
>
> Oh, sorry, I didn't realise this was "THE REST" that is the list of
> default maintainers.
>
> So for some reason, the script fail to parse the patches to find which
> files are modified. And I think I know why. Usually, `git format-patch`
> output something like:
>     diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
>     index 4369fef161..9ffdd50c69 100644
>     --- a/tools/libs/light/libxl_dm.c
>     +++ b/tools/libs/light/libxl_dm.c
> with all path starting with "a/" or "b/", which get_maintainer then
> strip. (It strip them from the "diff --git" line, but remove the first
> "directory" from the path for line starting with "---" or "+++".)
>
> The patches in this series instead look like this:
>     diff --git tools/libs/light/libxl_dm.c tools/libs/light/libxl_dm.c
>     index 4369fef161..9ffdd50c69 100644
>     --- tools/libs/light/libxl_dm.c
>     +++ tools/libs/light/libxl_dm.c
> with "a/" and "b/" missing, and that confuses get_maintainer.pl. It
> tries to find maintainers for "libs/light/libxl_dm.c" which don't exist.
>
> Did you by any chance used "--no-prefix"? It doesn't seems worse it to
> handle this case as I'm guessing more than on tool rely on those.
>
> Cheers,
>
> --
> Anthony PERARD


Mystery solved: I generated those patches on my arm64 workstation,
which had the debian packaged git version 2.39 which has the old
behavior of git-format-patch being affected by diff.noprefix. I just
re-generated them using 2.44 (which is what my config expected) and
the a/b prefixes are back:

./scripts/get_maintainer.pl
../../patches/libxl-dm-timeout-v2/v2-0002-libs-light-expand-device-model-start-timeout-use.patch
Anthony PERARD <anthony.perard@citrix.com>
Juergen Gross <jgross@suse.com>
xen-devel@lists.xenproject.org

I will send a v2, thanks for letting me know!


-- 
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

