Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5084C658
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 09:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677286.1053791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXdQg-0006Dt-AP; Wed, 07 Feb 2024 08:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677286.1053791; Wed, 07 Feb 2024 08:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXdQg-0006Bd-7j; Wed, 07 Feb 2024 08:37:14 +0000
Received: by outflank-mailman (input) for mailman id 677286;
 Wed, 07 Feb 2024 08:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXdQf-0006BX-C7
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 08:37:13 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 156900de-c594-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 09:37:10 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so47623266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 00:37:10 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ss28-20020a170907c01c00b00a36c499c935sm499058ejc.43.2024.02.07.00.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 00:37:09 -0800 (PST)
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
X-Inumbo-ID: 156900de-c594-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707295029; x=1707899829; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl/fZj57liKmlI/xyYGVc9W5enFSRet6446WIdVaNQE=;
        b=DXaiLtKjW8AvND75EHh+/8qE9VYmMEWugGwx9VDsj8PvFugkmyY+rZ4FJPRmCK7Y0c
         KwaZ3sTS/f7xhbRv/6kMD97ltZkvMbii//ZhfIkaO7ZKIaAzoHTeKzi7Lrb04pXbBcgR
         RwjkKSTKsRMkHb1QuMNDRMV7I933WgSLNPMlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707295029; x=1707899829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl/fZj57liKmlI/xyYGVc9W5enFSRet6446WIdVaNQE=;
        b=Wf7Yj2PgMjt6Rk0xH1CzFlsMb9S/OBxXgL9TcOu16wvFGxp45zA5+cnJIxx2+nTJxq
         v18g/CAIKuY/sNR5fWXXr3+v4lpkdcxdACd5OkDMhbg9gkgQ6cEm/dj5YfytdjxAiJgu
         DJWIbpPUjX+9X63Li6SPimR4IALWK6xymxq/+6Q+xu2fnYqsdiUV+Wljd3sUdZlMTPkf
         1mkRbdcpYLvi6KMT7dUlEZ4HITpFO3MgpkDOSbuSvAqNxL5IEKIqvffXKjFeFYepRuwh
         mcR3ooUtlkOeZDp//TbWPJ8LKOUHETIu6uzpno6IC+EtcmKSnJ2X1hMOKugnr4yXvbXP
         qdUw==
X-Gm-Message-State: AOJu0Yz46FoOro/VNS6/st5gCTZnL/Dfn5sd8Vg8BS5ul+R1YZ6HCEYP
	pCxVUTO1PRTnqfCldiDKuEutO2ENAVYGgjUChiC4ClsmN7ngy6gKzuuhpdVY3FM=
X-Google-Smtp-Source: AGHT+IGnBhSGpg2iJs2U1tFtwRCYUxp2cBv8mQ+TDnSzhUgbn/mvYMrZ0M9tjMgJOyyUIvLlC4VUJw==
X-Received: by 2002:a17:906:1287:b0:a36:5e63:7b12 with SMTP id k7-20020a170906128700b00a365e637b12mr3696556ejb.37.1707295029646;
        Wed, 07 Feb 2024 00:37:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfX3t49E3mLqiopEcmxNi1PlE4+1vFhHlz5WoWT+XzPAO6JCn6UAuYu+8eP7qZ3jazl92okLLrEj7nA0W8YUUyZOK5Ltlrv3IZ3mBVGAFc8vj0yNJtrsJUfciIpJA8gjfm/Sy77ar/dg==
Date: Wed, 7 Feb 2024 09:37:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] iommu/x86: introduce a generic IVMD/RMRR range
 validity helper
Message-ID: <ZcNBNGO_G2zT-l9o@macbook>
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-3-roger.pau@citrix.com>
 <232baaae-5fe0-4a94-8469-d1dac520c1af@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <232baaae-5fe0-4a94-8469-d1dac520c1af@suse.com>

On Tue, Feb 06, 2024 at 12:17:29PM +0100, Jan Beulich wrote:
> On 01.02.2024 18:01, Roger Pau Monne wrote:
> > IVMD and RMRR ranges are functionally equivalent, and as so could use the same
> > validity checker.
> 
> May I suggest s/equivalent/similar/?

Sure.

> > Move the IVMD to x86 common IOMMU code and adjust the function to take a pair
> > of [start, end) mfn parameters.
> 
> [start,end) ranges generally come with the problem of not allowing to
> represent the full address space. While that isn't specifically a problem
> here, seeing that both VT-d and V-i present inclusive ranges, how about
> making the common function match that?

OK, I can adjust the code that way.  I originally did it using non
inclusive because it looked like the code would be clearer.

Thanks, Roger.

