Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E494CC4B8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 19:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283647.482744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPpuQ-0001zW-9W; Thu, 03 Mar 2022 18:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283647.482744; Thu, 03 Mar 2022 18:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPpuQ-0001xM-5S; Thu, 03 Mar 2022 18:10:38 +0000
Received: by outflank-mailman (input) for mailman id 283647;
 Thu, 03 Mar 2022 18:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm5B=TO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nPpuP-0001x5-2o
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 18:10:37 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3964a05b-9b1d-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 19:10:36 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id j15so9895691lfe.11
 for <xen-devel@lists.xenproject.org>; Thu, 03 Mar 2022 10:10:36 -0800 (PST)
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
X-Inumbo-ID: 3964a05b-9b1d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1CqBs+YUxF44l3nieZcK8Q9lRd9kbywBwBSvMkAlOFo=;
        b=NTzW5I4+W9Il/Avwninx4chD/uORuqrK7rVqtechFDye8t9tbQcdHVTwhjZRDeUuVS
         WfVzCIpgH9XuHVRwwrpISRgjmhIAV8j47brbtj2me38y1vrBsF3EF2uIrmCHXSeVyQqy
         JOFP85DOhiw82s79UxUZqQtgqItVwMxaMS5p+8rMz5fLjWNKJCXWPUBQXLSAa8GUeJd5
         j9r9MQ8URBpk94AcLLWJNbtH/KeMYPKo2exDou2r4EuHr3UqwfGx9twdNt/DaOkvcrx/
         ZZw3/41BDrwQ76SBzTITtJrYXHTnVAnsecVHKfC+/M8xSEPTYC91LAWgfwFKyRb0GN2V
         +M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1CqBs+YUxF44l3nieZcK8Q9lRd9kbywBwBSvMkAlOFo=;
        b=6aAbvlQPBBjRnS0eg1cC/CzIIxGB8pFJ5hUJTtlVVAIySU4dYTMeklQwZP77fbsQBr
         aqmUVGvgI/oQIZo2tXO3tUWGXIF3g/zaISJgDkdFky/w4Pe7ITIeyeCNHthUCVzR9koz
         rELDP91RITo8ITd/T4Jxh/SmW3EyK5wVRz3enk5GIpPS3NGnQc8g9XkNhNa0eRO1wLci
         cIR6b14ts74WYXssbSlfIKuQvkDjAxMWXub5+uuc498QhI0WpzRsD8K7nQwaB/5OesJ6
         QqyU+Z9KxjRru5ZDqaPpBC+EzMRPN9sd5yNsx7ohq9UPikG8/NUrk+3681ugmvhtr5Rx
         mgXw==
X-Gm-Message-State: AOAM533MEmThHQdpPSkbi2pO/H0hIYqJO4FVXEK1w1UXUeyXNyr3C90u
	KcrR1GJNduM4lwsi9kw8q/ipAWAiFjCB2AVrf9MK9oqe
X-Google-Smtp-Source: ABdhPJxh7hQ66xbUam3Bwpl4lZRI47OnC/HlWH4jvAikAas0UOlmRtyLDW0TKUjWPELtlDqEQAl85/uKfLyPUoX3w/o=
X-Received: by 2002:ac2:4855:0:b0:443:888e:5982 with SMTP id
 21-20020ac24855000000b00443888e5982mr21903031lfy.447.1646331035882; Thu, 03
 Mar 2022 10:10:35 -0800 (PST)
MIME-Version: 1.0
References: <osstest-168340-mainreport@xen.org>
In-Reply-To: <osstest-168340-mainreport@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 3 Mar 2022 13:10:24 -0500
Message-ID: <CAKf6xpuq7D8dUZz43CoH1-J_cK8TDyVFrUpM4V_AJycUZXfmkQ@mail.gmail.com>
Subject: Re: [ovmf test] 168340: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 12:57 PM osstest service owner
<osstest-admin@xenproject.org> wrote:
>
> flight 168340 ovmf real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/168340/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 168254
>  build-amd64-xsm               6 xen-build                fail REGR. vs. 168254
>  build-i386                    6 xen-build                fail REGR. vs. 168254
>  build-i386-xsm                6 xen-build                fail REGR. vs. 168254
>

> commit 6a890db161cd6d378bec3499a1e774db3f5a27a7
> Author: Jason <yun.lou@intel.com>
> Date:   Mon Jan 10 22:30:29 2022 +0800
>
>     BaseTools: Upgrade the version of NASM tool
>
>     REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
>
>     Upgrade the version of NASM tool to avoid compilation errors when
>     compiling NASM code change.

...

> commit bbaa00dd01ed0df30e43a5a89fd2b0433d858b73
> Author: Jason <yun.lou@intel.com>
> Date:   Mon Jan 10 22:05:47 2022 +0800
>
>     MdePkg: Remove the macro definitions regarding Opcode.
>
>     REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
>
>     Remove the macro definitions regarding Opcode because new version of
>     NASM tool(e.g. v2.15.05) supports the corresponding instructions.
>     Note: This patch need to be merged after other NASM code change to avoid
>     compilation errors.

Looks like OVMF now expects NASM v2.15.05.

-Jason

