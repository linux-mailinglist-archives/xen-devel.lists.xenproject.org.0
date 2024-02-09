Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EAD84F1F6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678582.1055992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMqc-0006Ys-CY; Fri, 09 Feb 2024 09:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678582.1055992; Fri, 09 Feb 2024 09:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMqc-0006X2-9K; Fri, 09 Feb 2024 09:07:02 +0000
Received: by outflank-mailman (input) for mailman id 678582;
 Fri, 09 Feb 2024 09:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYMqa-0006Ww-VT
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:07:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9456ba79-c72a-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 10:06:58 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so845770a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 01:06:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 i8-20020aa7dd08000000b0056010210438sm586704edv.32.2024.02.09.01.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 01:06:58 -0800 (PST)
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
X-Inumbo-ID: 9456ba79-c72a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707469618; x=1708074418; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GXtB07cRzYTvSKLC1CPOntwIqxXCSCKKbfFCwUjQa5g=;
        b=gPpTmtWIr0/M5fonpP54ceICa1iwzXakF0i/gLC8Bio6t1ct7gwS+dAgZgCXhyP1RJ
         4REU4C3CBdjK4g0PZi8/YvAdQC06Q9ZSmeUGny3z7gJWLuAXUlL9OHeuOqe5i52RIr7C
         pemABQV7Qw9gIpyh1WYwd25Mcezz1omGBedb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469618; x=1708074418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXtB07cRzYTvSKLC1CPOntwIqxXCSCKKbfFCwUjQa5g=;
        b=pSUz8u7OEDMCCupdM4ZipoCAYb8lbI3CfAfMjtFVhRoijU1o1JRH3aPYmfaqDY8NTv
         RXXUVGOQ3nSeui406eYKSYOPgf7BiE1/nQsoOR2YbolZMzrwd9hTBVTovltP+EZ70l2k
         MiZAgGStCKPBzHgiaHheqF8P4e+5gKVh+hq+qtZm9Z0VuzMXFdJdoETSsTY2f6Mk+fC5
         y0XkKyAPA2ppoaZ5H4WjSigVw8jV0P4n0uQEaxv8WokmzEuYM8mv0COjXxiXD/7/Exsz
         3PklzTl+QvD0ODARzOE3xNKJaKXLlKUcn6aA2anAUqRWUc2a9/oqhWnVygOuk0K6bdXx
         RnPQ==
X-Gm-Message-State: AOJu0Yy2aoiLdn7i8CATErvBOkdg2m0Hr2quVvcF7BMvoUW+hxKeC/7M
	fvpqptwWq19cq6/Tl2gQbfOIjX8p87Eb3LtPI9WeteUGL5E/5mSm8BVNkG/bWiU=
X-Google-Smtp-Source: AGHT+IGLYrBI+9ciaUPYERkVVgzTyf7RtlbgoMB0O128Fb6VO9lX8DY3HMzj3u0hKYz2q/GDCjji/w==
X-Received: by 2002:aa7:ccd6:0:b0:561:13eb:4ade with SMTP id y22-20020aa7ccd6000000b0056113eb4ademr837825edt.27.1707469618331;
        Fri, 09 Feb 2024 01:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuQYCpoKkS3NtRCWsfI54g3N/M5WIBgnJ5seTsD6lyniRylK89rgYXxH6skWd9s5C5zzxv0NtmWvmGjbFQXtqU3BWu3ZooTsLO8ae292boqdo78N/v
Date: Fri, 9 Feb 2024 10:06:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZcXrMZ2Nrsna2Kbe@macbook>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>

On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> applies to guests also when run on a 64-bit hypervisor: The "extended
> CR3" format has to be used there as well, to fit the address in the only
> 32-bit wide register there. As a result it was a mistake that the check
> was never enabled for that case, and was then mistakenly deleted in the
> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> CONFIG_PAGING_LEVELS==4"]).
> 
> Similarly during Dom0 construction kernel awareness needs to be taken
> into account, and respective code was again mistakenly never enabled for
> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
> 
> At the same time restrict enabling of the assist for Dom0 to just the
> 32-bit case. Furthermore there's no need for an atomic update there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

