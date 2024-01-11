Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02982B071
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666302.1036837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvqj-000838-Mh; Thu, 11 Jan 2024 14:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666302.1036837; Thu, 11 Jan 2024 14:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvqj-0007zt-Jj; Thu, 11 Jan 2024 14:16:01 +0000
Received: by outflank-mailman (input) for mailman id 666302;
 Thu, 11 Jan 2024 14:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNvqi-0007zl-5Y
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:16:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f14bcedb-b08b-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 15:15:59 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e624a8cbbso2607905e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:15:59 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 iv17-20020a05600c549100b0040e5034d8e0sm6003466wmb.43.2024.01.11.06.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 06:15:58 -0800 (PST)
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
X-Inumbo-ID: f14bcedb-b08b-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704982558; x=1705587358; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGR/JQnhf1qU/ywHOv+2ixBYeb5XleYTse6KIYOcI9U=;
        b=F0MwCW1gFGOn1GpPZw+FnFRuVN8rt3G1YU1DDSfn11kwE/Kps2K6acBOaCfhmBRGeZ
         GL2dq1Epb0e1hh66KaFr/mumNVIkhpky6jnWsJmmP4CfK+8hm+K7+a4duXcpv/4xjRzN
         KdwubZeQo3JyBcJSRWbXRGJIaX49HFYuIB9TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704982558; x=1705587358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGR/JQnhf1qU/ywHOv+2ixBYeb5XleYTse6KIYOcI9U=;
        b=oq1O/XrBdofvf+8XiRJv5g07zLX1+9sGZcIqaXv+k6yiTVhnPhvNGzWWgtQ+CVliWg
         Lrv8ZNCq3erUpRSvbJub3hf3ni5r3W7Ii8ilDDM1bdBIlA+4+ovFi8KPUQFFDH/FK3Po
         CiorrLFbgSY3hXEXQuXm8r+6kwgDFKyxroYaxkNjRMddM3B+CQSWlpb5kP9W7jYGisMa
         KV/762wAFhpM/t5HQsnow6ixQuPLKNAQxzWXdncCFEJn6wyeP/9NP0tar4tAgrAm4arQ
         yxqGmGU21P5BMLPjTkDQ5/pgRgZhW+w114sJwzQ7okMgfjGVyns5L5KFsBxxE5+CGqoG
         kUHA==
X-Gm-Message-State: AOJu0Yy/vn8Yv4rlXGBzWo8ETg76KPpH4QvmNidng5OD+y4MWPmbf8hf
	X819IEH2zCHFm9QVuigDsRO+8UaWuo6tdr9ggfV3PeR1lb0=
X-Google-Smtp-Source: AGHT+IGIw6mcGyiFePA8NkUBvE6J0kAC+LykI3Eg1JGOvX1NkVa/jeum5/O67eGDOa8C5aQbMc+0tg==
X-Received: by 2002:a05:600c:5026:b0:40e:6240:3293 with SMTP id n38-20020a05600c502600b0040e62403293mr235387wmr.40.1704982558628;
        Thu, 11 Jan 2024 06:15:58 -0800 (PST)
Date: Thu, 11 Jan 2024 15:15:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Message-ID: <ZZ_4HSvdg0R9Dv1Y@macbook>
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com>
 <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com>
 <ZZ_di8pZB8bWtBuX@macbook>
 <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com>

On Thu, Jan 11, 2024 at 03:01:01PM +0100, Jan Beulich wrote:
> On 11.01.2024 13:22, Roger Pau Monné wrote:
> > Oh, indeed, can adjust on this same patch if that's OK (seeing as the
> > issue was already there previous to my change).
> 
> Well, I'm getting the impression that it was deliberate there, i.e. set
> setting of the feature flag may want to remain thus constrained.

Hm, I find it weird, but the original commit message doesn't help at
all.  Xen itself only uses PMC0, and I don't find any other
justification in the current code to require at least 2 counters in
order to expose arch performance monitoring to be present.

Looking at the SDM vol3, the figures there only contain PMC0 and PMC1,
so someone only reading that manual might assume there must always be
2 global PMCs?

(vol4 clarifies the that the number of global PMCs is variable).

Thanks, Roger.

