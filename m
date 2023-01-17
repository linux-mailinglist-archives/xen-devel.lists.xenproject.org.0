Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21F66E364
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 17:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479606.743559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoj1-0005h1-Pu; Tue, 17 Jan 2023 16:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479606.743559; Tue, 17 Jan 2023 16:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoj1-0005f3-Mr; Tue, 17 Jan 2023 16:22:15 +0000
Received: by outflank-mailman (input) for mailman id 479606;
 Tue, 17 Jan 2023 16:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wyYX=5O=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pHoj0-0005ex-9V
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 16:22:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18dce8ad-9683-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 17:22:12 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id bk15so19065924ejb.9
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 08:22:12 -0800 (PST)
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
X-Inumbo-ID: 18dce8ad-9683-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xNnk8xtXpsGuhxIpiLYHfCMmNvD0b3qoKe4U8pFLMZQ=;
        b=Hz0dKwa2C7DjWVvGztL30CEVZg1ivWP3Ovy6cTCjZ4XX4Qc1ZE+qC2GPA2cCvJEU6T
         T/kvsdjcSXiese3am/b38YzIvcd4lUP2UXvj99iPuxHdvu9VACeBEbUKmENHal/V4pR4
         xsP84JcZDUn5y2FQWFIE1vlVV8aVQYvK7ltMnDGcY/3HVfypyZrLvmpOqu7P9OOJ8A3W
         BrH9CHLWuVAz7VQd/kdkzgKty6SgKMwLdXfPHbrzFrqaux5j2mHPyl5W4GLxWtBT4PrY
         Oou4Hq4skxGqDE/ytnDCgOKILw1tUQbfjla5TvcUrxsSVmKTSTAh0alFf/bnFEHFS9B0
         sg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNnk8xtXpsGuhxIpiLYHfCMmNvD0b3qoKe4U8pFLMZQ=;
        b=07KZbpIwNVS9wD0vZZvzb640Bk1YSue6Kvr7bpyD0HRuiBP0D0D8LjEMtyDz7JHGCo
         dvlUsOscF50xIGTpA7yK8gZ7aiIi+bF9p/34mwNLGEP6PVFuWADSk0oCY340O9PA5f1R
         WMOOJUZ/wRTpNTPuKs+P46+80VomMxyUFt8CYXjkWzrAcKzSqlXXyMh7oC2dqlf4zSyi
         I6bg4VksExvoUtCTTLmiW12CNnUT0rMMxEOuTccnf8snLzHOZmnjQ4+aLuGWP1jULSws
         vd2VP+k/+5GLLV2I4d7oxOUnIDVpFYkcdSH9Qd8rKoXmh4m6hdUlby+YsjiDUxERcLcQ
         kTmA==
X-Gm-Message-State: AFqh2kpQzrqYCNKJUe4IU7K1I/ppnB5LPOUYAO/y4vaFlICst30OUNA2
	eP9ID/6EaM8aIz4kc/F6LxphLPKMYoJA6ZPCZAE=
X-Google-Smtp-Source: AMrXdXutIkia0sFmsP+r2hJMV2PwNijOQa6hRMQ4AD/xTTAXTTUSmYTsVY1UD1lSzLTDL8knoWR2YAgtHv5cI1vLn3U=
X-Received: by 2002:a17:906:f9c9:b0:84d:45cc:3247 with SMTP id
 lj9-20020a170906f9c900b0084d45cc3247mr288177ejb.481.1673972531760; Tue, 17
 Jan 2023 08:22:11 -0800 (PST)
MIME-Version: 1.0
References: <20230113230835.29356-1-andrew.cooper3@citrix.com> <20230113230835.29356-4-andrew.cooper3@citrix.com>
In-Reply-To: <20230113230835.29356-4-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 17 Jan 2023 11:21:59 -0500
Message-ID: <CAKf6xpstz88SvrQNxmOrk2FL6x2mRegAGfrui7-6_C3Yg7EsjQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_* subops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 13, 2023 at 6:08 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Recently in XenServer, we have encountered problems caused by both
> XENVER_extraversion and XENVER_commandline having fixed bounds.
>
> More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
> array, and using an unqualified 'char' which has implementation-specific
> signed-ness
>
> Provide brand new ops, which are capable of expressing variable length
> strings, and mark the older ops as broken.
>
> This fixes all issues around XENVER_extraversion being longer than 15 chars.
> More work is required to remove other assumptions about XENVER_commandline
> being 1023 chars long.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
>
> v2:
>  * Remove xen_capabilities_info_t from the stack now that arch_get_xen_caps()
>    has gone.
>  * Use an arbitrary limit check much lower than INT_MAX.
>  * Use "buf" rather than "string" terminology.
>  * Expand the API comment.
>
> Tested by forcing XENVER_extraversion to be 20 chars long, and confirming that
> an untruncated version can be obtained.
> ---
>  xen/common/kernel.c          | 62 +++++++++++++++++++++++++++++++++++++++++++
>  xen/include/public/version.h | 63 ++++++++++++++++++++++++++++++++++++++++++--
>  xen/include/xlat.lst         |  1 +
>  xen/xsm/flask/hooks.c        |  4 +++

The Flask change looks good, so that part is:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com> # Flask

Looking at include/xsm/dummy.h, these new subops would fall under the
default case and require XSM_PRIV.  Is that the desired permission,
and guests would just have to handle EPERM?

Regards,
Jason

