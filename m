Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD58860FC6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684778.1064895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdT4G-0008IP-JY; Fri, 23 Feb 2024 10:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684778.1064895; Fri, 23 Feb 2024 10:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdT4G-0008Fx-Fx; Fri, 23 Feb 2024 10:46:12 +0000
Received: by outflank-mailman (input) for mailman id 684778;
 Fri, 23 Feb 2024 10:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdT4F-0008Fr-Fj
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:46:11 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0932f3b-d238-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 11:46:08 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512a65cd2c7so1049149e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:46:08 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 mw6-20020a05621433c600b0068fda3873b6sm429509qvb.110.2024.02.23.02.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 02:46:07 -0800 (PST)
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
X-Inumbo-ID: c0932f3b-d238-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708685168; x=1709289968; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43f4rOlcrZts1hyjm0iyNDxb3Fodzfg94cEQ/eHhvSc=;
        b=rmXx+f+nRFKsNKSD6JFOPQKx6N0qgxVcjVVIMt0G6GShVG9JLThndECBK4FL/MPFvP
         cjNmBN55hY4yflYaRl2DwGvuSpMlhgKjWCj2mQJR+znyHi0q2rzf4imOTiabqPSoNkBL
         53lDDSuL3LltwBP5Fb2PHrAYsRm2bTI5eUBpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708685168; x=1709289968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43f4rOlcrZts1hyjm0iyNDxb3Fodzfg94cEQ/eHhvSc=;
        b=TKcSo18xGC/DXSf0qHnzvMLtdWgXXUOrzvoHbsvdYg+6Le/MsClr+6LtBmIJScTgNj
         J8m3S9C82E8knuKzrwl2hu050qNQN88du5/EehzEZTDSdMi8ZJBxkmjlEDG7ZDQPDFVx
         SpQkImgHKgy5dz2OHVChKH4rMTkWw+qvZGU0Wi92toVMNm4PNe4KduTKkpj9Rn0ChDeQ
         g1yVNxXUhjxHxjozswLywCmxlzcT9hbylfFzzeGQfPjkXh3xp6CwjF9ImZLBrp7vMqyg
         0CdMWW92HfgjtCJ7eE3IBIqHvz9FjK22S4tge1rLwTHic0toLu/LERaOB90k0/vVN2sJ
         b2KQ==
X-Gm-Message-State: AOJu0YwhnHfR3VRxshuVmE8geqFFV5eem9kcGXV3mdatNpkO+rKqnDwA
	zdf3SHfrrrK13pIs7uU4zvCd+LS0BIPQaje0ZenRCIOm1bODwXuTjlHAk4h9Fbr3kkw4x5gr7A2
	t
X-Google-Smtp-Source: AGHT+IHiWfMgBNi5VxsY+XJjtihpkobcAUtpnUTpml2CY5MU8SmW/hhEPNqh0zJu7KbzhyH3P3GotA==
X-Received: by 2002:a05:6512:505:b0:512:b0c4:71c8 with SMTP id o5-20020a056512050500b00512b0c471c8mr1200597lfb.29.1708685168237;
        Fri, 23 Feb 2024 02:46:08 -0800 (PST)
Date: Fri, 23 Feb 2024 11:46:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH LIVEPATCH] Fix inclusion of new object files
Message-ID: <Zdh3bfjS1vqbnEdC@macbook>
References: <20240223103550.299992-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240223103550.299992-1-andrew.cooper3@citrix.com>

On Fri, Feb 23, 2024 at 10:35:50AM +0000, Andrew Cooper wrote:
> Right now, there's a mixup over the xen/ part of the path for new files.
> 
>   + NEW_FILES=./arch/x86/lp-hooks.o
>   + for i in '$NEW_FILES'
>   ++ dirname ./arch/x86/lp-hooks.o
>   + mkdir -p output/./arch/x86
>   + cp patched/./arch/x86/lp-hooks.o output/./arch/x86/lp-hooks.o
>   cp: cannot stat 'patched/./arch/x86/lp-hooks.o': No such file or directory
> 
> Alter the `cd` and `find` runes to use paths relative to the root of the
> different source trees.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Hm, this never worked AFAICT.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

