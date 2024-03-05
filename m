Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4536872051
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 14:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688799.1073413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhUxH-000838-4b; Tue, 05 Mar 2024 13:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688799.1073413; Tue, 05 Mar 2024 13:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhUxH-00080i-18; Tue, 05 Mar 2024 13:35:39 +0000
Received: by outflank-mailman (input) for mailman id 688799;
 Tue, 05 Mar 2024 13:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhUxF-00080c-Jo
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 13:35:37 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f5884e8-daf5-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 14:35:36 +0100 (CET)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-68facd7ea4aso44532606d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 05:35:36 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 nh7-20020a056214390700b0068f35e9e9a2sm6200220qvb.8.2024.03.05.05.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:35:35 -0800 (PST)
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
X-Inumbo-ID: 3f5884e8-daf5-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709645735; x=1710250535; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=odrCsce/jZR1UXVTEC1I/em2Ife2Dvrd6vDjPBqN+80=;
        b=G7b19aVd2qgj+l3s17Gg/oWQagUboCgnaggY2Pns1w0PLDYGx+q6JyfV2oQLLscL7A
         O7NlwVggqNRrBcAcZA3EaJvRj8573gkNdPm5STr8A8oRkT1lg/dtJpLiIn9Gz8jbztqe
         Gin/MeNctPUUDGCVIL6Pe8HdcB3cOe2MO8HZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709645735; x=1710250535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odrCsce/jZR1UXVTEC1I/em2Ife2Dvrd6vDjPBqN+80=;
        b=ByebGpBWc3RS8w0gj7WqC/VRw+U77Zyle6FirSPE7rV1EFJX9V/iigTA7pFrsU7XxM
         XaeHJnOpWzTisw9Da+qskdAF0EbfBNToFjhpHpStFHOYO4hGR7hlNq2kC4r6+a9wQNTU
         0fwOflCf1d7WbvQobKXAMwnl1YAQt2ReeifeAU1PJ9VUBRhXZ3pbUAYUcg93eGhJhflW
         kAO6nnJvDxYgc3GNi/dSifOTiF/eJ2JNDxWo6bg8PoEEaS7Mgu+r81Mhyyq97DyFrTe3
         MIi4t3BgcpngRM54So5tIYJD6biDOTyW1OHEcTa8+nqps7uXsEjaS2mOJgyro+cajJwA
         rKRw==
X-Gm-Message-State: AOJu0Yydc0mFkOf48uUvZyemO0a6bvVNMfWuDtXLfBoFwP3L6HQVEOQU
	mVWGL6luYVNXHmpTtDcwyymwxi/JbwIwjluINOttX5NAE6Ji4maRAhCX+aY4Xpk=
X-Google-Smtp-Source: AGHT+IEOn3c21xLD0jw++8ODDgvgLt1bqp3f18eUuVccbAD47p/Qe4oagt/ZNrYZKtPH7IOzqPyWrg==
X-Received: by 2002:a05:6214:131:b0:690:79e:6a7e with SMTP id w17-20020a056214013100b00690079e6a7emr3038125qvs.28.1709645735423;
        Tue, 05 Mar 2024 05:35:35 -0800 (PST)
Date: Tue, 5 Mar 2024 14:35:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] xen/virtual-region: Rename start/end fields
Message-ID: <ZecfpfZ2JqA_o_b3@macbook>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305121121.3527944-2-andrew.cooper3@citrix.com>

On Tue, Mar 05, 2024 at 12:11:19PM +0000, Andrew Cooper wrote:
> ... to text_{start,end}.  We're about to introduce another start/end pair.
> 
> As minor cleanup, replace ROUNDUP(x, PAGE_SIZE) with the more consice
> PAGE_ALIGN() ahead of duplicating the example.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

