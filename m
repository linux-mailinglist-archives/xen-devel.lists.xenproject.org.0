Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F48766F18
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 16:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571482.895439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOEd-0003Kw-HY; Fri, 28 Jul 2023 14:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571482.895439; Fri, 28 Jul 2023 14:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOEd-0003Gj-Db; Fri, 28 Jul 2023 14:14:27 +0000
Received: by outflank-mailman (input) for mailman id 571482;
 Fri, 28 Jul 2023 14:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPOEb-0003GK-1O
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 14:14:25 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cc76e23-2d51-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 16:14:22 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31763b2c5a4so2233462f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 07:14:22 -0700 (PDT)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfe884000000b003143cdc5949sm5050822wrm.9.2023.07.28.07.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 07:14:21 -0700 (PDT)
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
X-Inumbo-ID: 0cc76e23-2d51-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690553662; x=1691158462;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zveqsV0CdVNO13A22Mf5DVV3cMqTKJ94j6oYQIug6SE=;
        b=kNUHbzl5HIo0Hbo+QbgMSdzFs/08S+/oSkKm3qZMw9hdCJDNy3wautRzq8OfFzuL7W
         WODa1WHWoCjumZf526EPelQNte92c4gjeI4pe3lehZ67tcuvVCPwpeK47nneP8u18XNn
         T4aiCGgRqC2Q9Kz+lHuqudnk6RgdilWtFskrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690553662; x=1691158462;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zveqsV0CdVNO13A22Mf5DVV3cMqTKJ94j6oYQIug6SE=;
        b=WgAuAplvfklc1G3d4eqhos7Ghe5EIuxmpXeq3x3kY3GTQ7iDBPyB+TGXmjHsfPylF7
         QPjruzKNeOBmPowxmamwjgZ557cqD5Ad1RpmBGcVSIl6Wu2iOluUqKJIzIAeIwkrL5zU
         ldbGIyi8JVMFCoI7pTk2cggkKW62H/2VJESK2IOpsWV8/HFt3sJjdPbFqTTPpXO92e72
         T/0f0ydNABQqXBSXvoB2788NH6fNQSH52m8pln01GggIsn0TRf/UwTvX2yaqJ/UBiokx
         3l8cKBveVva+OBzhYmnN8PYzkayFd9uFFZ7OXlVejlNSzK7UhmBuGi5H7fFUpUwoU18t
         LfSQ==
X-Gm-Message-State: ABy/qLY/Pog8XicrNDEJIDjC2R50DUR7ACqJ/02rOrw/PTAMYebgJr+p
	bMEahAB2zSEOR3AQ/BzOrVbiRg==
X-Google-Smtp-Source: APBJJlHv99EQuoAQc62kTaJlK7rz1OfiyKKZBEn4F6t5ciBnSeAa9uMn9E8j2CmVr4m44ALTR6bctw==
X-Received: by 2002:a05:6000:103:b0:317:60fc:d3c8 with SMTP id o3-20020a056000010300b0031760fcd3c8mr1998905wrx.71.1690553662059;
        Fri, 28 Jul 2023 07:14:22 -0700 (PDT)
Message-ID: <64c3cd3d.df0a0220.af633.8875@mx.google.com>
X-Google-Original-Message-ID: <ZMPNNHsAjJOUE/Ky@EMEAENGAAD19049.>
Date: Fri, 28 Jul 2023 15:14:12 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 0/5] clang-format for Xen
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728081144.4124309-1-luca.fancellu@arm.com>

On Fri, Jul 28, 2023 at 09:11:39AM +0100, Luca Fancellu wrote:
> ## Introduction ################################################################
> 
> In this serie, I would like to get feedbacks on the output generated by the
> configuration of clang-format, unfortunately we can't use only clang-format, but
> we need to call it using a wrapper, because we need the information of what
> files need to be excluded from the tool.
> 
> Another reason is that clang-format has some limitation when formatting asm()
> instruction and most of the time it format them in a very ugly way or it breaks
> the code for example removing spaces that were there for a reason (I don't think
> it's a tool to format asm), so in the wrapper script we protect all asm()
> invocation or macros where there are asm() invocation with in-code comments that
> stops clang-format to act on that section:
> 
> /* clang-format off */section/* clang-format on */
> 
> I've read the past threads about the brave people who dared to try to introduce
> clang-format for the xen codebase, some of them from 5 years ago, two points
> were clear: 1) goto label needs to be indented and 2) do-while loops have the
> braket in the same line.
> While point 1) was quite a blocker, it seemd to me that point 2) was less
> controversial to be changed in the Xen codestyle, so the current wrapper script
> handles only the point 1 (which is easy), the point 2 can be more tricky to
> handle.
> 
> ## The clang-format configuration ##############################################
> 
> In my clang-format configuration I've taken inspiration from EPAM's work, then
> from the configuration in Linux and finally from the clang-format manual, to try
> to produce a comprehensive configuration.
> 
> Every configuration parameter has on top a comment with the description and
> when it was supported, finally I've added also a [not specified] if that
> behavior is not clearly specified in the Xen coding style, I've done that so
> we could discuss about adding more specification in our CODING_STYLE.
> Every comment can be stripped out in the final release of the file, but I think
> that now they are useful for the discussion.
> 
> The minimum clang-format version for the file is 15, my ubuntu 22.04 comes with
> it, we can reason if it's too high, or if we could also use the latest version
> maybe shipped inside a docker image.
15 sounds ok \methinks. In practice we'll just stick it in GitLab and let
it check commits, so we'll be safe even in the case where every developer
has a slightly different version of the tool. I wouldn't try to make this
(hard) task harder by trying to retrofit it in an older version.

It might be worth stitching a flag in the python script to scream if the
clang-format version doesn't match. Or it may do a mess of the tree.

> 
> For every [not specified] behavior, I've tried to guess it from the codebase,
> I've seen that also in that case it's not easy as there is (sometimes) low
> consistency between modules, so we can discuss on every configurable.
> 
> Worth to mention, the public header are all excluded from the format tool,
> because formatting them breaks the build on X86, because there are scripts for
> auto-generation that don't handle the formatted headers, I didn't investigate
> on it, maybe it can be added as technical debt.
Sounds reasonable to me.

> 
> So I've tried building arm32, arm64 and x86_64 with the formatted output and
> they build, I've used Yocto for that.
> 
> ## How to try it? ##############################################################
> 
> So how to generate everything? Just invoke the codestyle.py script without
> parameter and it will format every .c and .h file in the hypervisor codebase.
> 
> ./xen/scripts/codestyle.py
> 
> Optionally you can also pass one or more relative path from the folder you are
> invoking the script and it will format only them.
Worth mentioning that we need a strategy for checking the consistency as
well. The typical fashion is to invoke clang-format as:

  clang-format -Werrror --dry-run

Seeing that there's an external script we probably want some plan for
checking things in CI as well.

> 
> ## What I expect from this RFC #################################################
> 
> I expect feedback on the output, some agreement on what configuration to use,
> and I expect to find possible blocker before working seriously on this serie,
> because if there are outstanding blockers on the adoption of the tool and we
> can't reach an agreement, I won't spend further time on it.
> 
> I understand that the release is coming soon and some people are on holiday in
> this period, so worst case I will ping again after the release.
> 
> Luca Fancellu (5):
>   [WIP]misra: add entries to the excluded list
>   [WIP]cppcheck: rework exclusion_file_list.py code
>   [WIP]xen/scripts: add codestyle.py script
>   x86/HVM: protect mm_type_tbl format from clang-format
>   xen: Add clang-format configuration
> 
>  docs/misra/exclude-list.json                  |  88 +++
>  xen/.clang-format                             | 693 ++++++++++++++++++
>  xen/arch/x86/hvm/mtrr.c                       |   2 +
>  xen/scripts/codestyle.py                      | 261 +++++++
>  xen/scripts/xen_analysis/cppcheck_analysis.py |   6 +-
>  .../xen_analysis/exclusion_file_list.py       |  31 +-
>  6 files changed, 1063 insertions(+), 18 deletions(-)
>  create mode 100644 xen/.clang-format
>  create mode 100755 xen/scripts/codestyle.py
> 
> -- 
> 2.34.1
> 
> 

