Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736A766FA0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 16:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571488.895461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOdU-0007S3-SO; Fri, 28 Jul 2023 14:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571488.895461; Fri, 28 Jul 2023 14:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOdU-0007Pi-P8; Fri, 28 Jul 2023 14:40:08 +0000
Received: by outflank-mailman (input) for mailman id 571488;
 Fri, 28 Jul 2023 14:40:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPOdT-0007Kq-1A
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 14:40:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a38a06db-2d54-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 16:40:04 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe110de3b6so3815465e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 07:40:04 -0700 (PDT)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b0031272fced4dsm4966550wrn.52.2023.07.28.07.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 07:40:03 -0700 (PDT)
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
X-Inumbo-ID: a38a06db-2d54-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690555203; x=1691160003;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WhW4JNpGwKaEVPVIJKMl0AJ7ON5qkgm5mDbRBU1PCKk=;
        b=OmbtEcNE8HWvAkwKVMCCkeXevw7YOY2B7zoIuk9cQjcwnxltHlJ+p1YXTpY9D9Dbdu
         r/CAzbWe23pSGoxoNLtePnVnP2gN82F8QlTlREIKNmJoZv6TiJpGg/onxePN0s+xjAfd
         aHKQGt2mzqwqQ/nUTG+YmZsPEmi2uZGzlp54M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690555203; x=1691160003;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhW4JNpGwKaEVPVIJKMl0AJ7ON5qkgm5mDbRBU1PCKk=;
        b=RWw+bj251cPo9fGH2pO7Vz/bqg+LXlnFqoCplw5zC23Mk1PAY//FwbghXieUeljVLi
         WjMjI1WFTcVpNqjY+RTPYeeLmjztNcpngz/4wOE7ynTuPHGrnMzb5DkNpwTJTgIUnmCo
         5LFThOCuB+6LfthgWboQuzyLtgXbMpsrZLgc9mEEyeKgb2zBJ/QvkR33ZXtfGsO0gC6z
         UVpUea+nMbpgOWLKqES3Ud3z0CjD31dqaSeed1XaszeOk0PeBDgtNtVtLbprrCxDAupz
         /LUSVJRukduzf5yspjB1THKHm2U5RdEh9LE0BfPckIOrisgpO3BCYsJFLCz4T7JpkDxi
         64og==
X-Gm-Message-State: ABy/qLZL8Z7eixZiGcC+cwgKtyqVicDa52XzjAFt2njY+TBcMpm9UgVt
	phuo6OdHZPqFqpam9DR5TJDdYg==
X-Google-Smtp-Source: APBJJlH/6tV2m7BDV8nYdhqp3Dw2w7232nIZ10SGtE6bvDS4U/GwNuJWujQnAcvWoGQB3sbv53TDAg==
X-Received: by 2002:a05:600c:1d09:b0:3fa:7c6b:86e with SMTP id l9-20020a05600c1d0900b003fa7c6b086emr4866647wms.12.1690555203573;
        Fri, 28 Jul 2023 07:40:03 -0700 (PDT)
Message-ID: <64c3d343.df0a0220.7ca91.866e@mx.google.com>
X-Google-Original-Message-ID: <ZMPTOb7o9h0tfkg9@EMEAENGAAD19049.>
Date: Fri, 28 Jul 2023 15:39:53 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 5/5] xen: Add clang-format configuration
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-6-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728081144.4124309-6-luca.fancellu@arm.com>

Hi,

The exclusion of certain files definitely makes it a lot easier to see
what's going on!

I'll start with a couple that I find incompatible

On Fri, Jul 28, 2023 at 09:11:44AM +0100, Luca Fancellu wrote:
> Add a clang format configuration for the Xen Hypervisor.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/.clang-format | 693 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 693 insertions(+)
>  create mode 100644 xen/.clang-format
>
> [snip]

I think this one...
> +# [not specified]
> +# Align consecutive assignments (supported in clang-format 3.8)
> +AlignConsecutiveAssignments:
> +  Enabled: true
> +  AcrossEmptyLines: true
> +  AcrossComments: false
> +

... and this one...
> +# [not specified]
> +# Do not align consecutive bit fields (supported in clang-format 11)
> +AlignConsecutiveBitFields: None
...ought to have the same setting because they both have the same
rationale. Ideally I'd like them both turned off so the context involved in
new patches is kept small, but others' ideas might vary.

Thanks,
Alejandro

