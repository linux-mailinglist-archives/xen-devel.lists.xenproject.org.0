Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA9935076
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760581.1170463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUTlp-0003Fm-0x; Thu, 18 Jul 2024 16:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760581.1170463; Thu, 18 Jul 2024 16:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUTlo-0003DM-U3; Thu, 18 Jul 2024 16:14:16 +0000
Received: by outflank-mailman (input) for mailman id 760581;
 Thu, 18 Jul 2024 16:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9B5K=OS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sUTln-0003DG-5a
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:14:15 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c54ffa79-4520-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 18:14:13 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6b73f7b855bso5875686d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:14:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b79c50d560sm9490496d6.53.2024.07.18.09.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:14:11 -0700 (PDT)
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
X-Inumbo-ID: c54ffa79-4520-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721319252; x=1721924052; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QdPKvdhrBeaCbamle2Vl7Ldt5/QLB7kliCakUV/1Tjw=;
        b=nPnTGT8NibTPtowf24zxIffGbJqKVG/aWFDUr9cPhXgLQ3EP+feaV3JqmqG3tc2sse
         KaWDuZO6esqU7rDDI+K4wuYx44NvOixxIZM/g707fzdHSqeiLDlu/Yz6PrWuyD30qeT/
         +SXDCgXjaxrMjNumVWc70Hr4xzapRnqrjOjWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721319252; x=1721924052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdPKvdhrBeaCbamle2Vl7Ldt5/QLB7kliCakUV/1Tjw=;
        b=Gn/vc37aslqeUPXZiN9FMGtyvIaXCmMB2dh3/vOO7MwQ+rpk8Kpn8P+BLioK9ix95R
         1Qt8tS2/VCb4wK5/p8EOs2ebC/nymhUTGceXG3YsPrl32ypb8nZmAGIA+GDislLXK1Br
         sRZZwyuPD6Z3zPUZjTU2glyjdfFHQlhtMl88ROuMsY3bWPrQ2xHZsW97ZqCo4l4pTjT6
         qWu/0HXxyVP5JvGHGnlcJ8PXYoGP0BiHrCiwirwRSuQBgcu7N1ruOO1FjKHPyEv5reT+
         UK30cNMNK3Y3dhX3oD47lhoiztUgDUSdl/wYIiU2Oqrzg7/alAmMaRevrknaBBUo+bIG
         t+Qg==
X-Gm-Message-State: AOJu0YxFIHb7WVIfz3eYi/LGihcoiW6e6tPQp+1itNi3gbB4bktD+iJC
	3ZS3cpPY6vuNMyLfXwiY3W6InBKGIc+tySt3KDJehsYoRdbzFsUsEyjYfTVBWyM=
X-Google-Smtp-Source: AGHT+IGJKjcXlo3qorvFSVuh5ddFUGMH7rRHKMKFdTbVtwun7BK/BoyOAtTPd9sbNkRRny8p9L421g==
X-Received: by 2002:a05:6214:2a8e:b0:6b7:4298:2c75 with SMTP id 6a1803df08f44-6b78e2bbeeamr61729246d6.55.1721319251740;
        Thu, 18 Jul 2024 09:14:11 -0700 (PDT)
Date: Thu, 18 Jul 2024 18:14:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: get_pat_flags() is needed only by shadow code
Message-ID: <Zpk_Uacbt9iY9dys@macbook>
References: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>

On Thu, Jul 18, 2024 at 12:10:00PM +0200, Jan Beulich wrote:
> Therefore with SHADOW_PAGING=n this is better compiled out, to avoid
> leaving around unreachable/dead code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I was going to suggest moving this to shadow specific code, but I see
it accesses some static variables or macros defined in mtrr.c.

Thanks, Roger.

