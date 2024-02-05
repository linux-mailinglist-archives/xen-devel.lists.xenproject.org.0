Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B102384A0A9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 18:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676453.1052581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2kc-0002ry-Db; Mon, 05 Feb 2024 17:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676453.1052581; Mon, 05 Feb 2024 17:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2kc-0002q3-Ah; Mon, 05 Feb 2024 17:27:22 +0000
Received: by outflank-mailman (input) for mailman id 676453;
 Mon, 05 Feb 2024 17:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Hmw=JO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rX2kb-0002px-L4
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 17:27:21 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d030ca10-c44b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 18:27:19 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a358ec50b7cso602417866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 09:27:19 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ti12-20020a170907c20c00b00a36fa497a65sm50901ejc.110.2024.02.05.09.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:27:18 -0800 (PST)
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
X-Inumbo-ID: d030ca10-c44b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707154038; x=1707758838; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awdyICZKqpWCHNwcWSP6CybyXKbC+Vyt3NLnV4CSWMQ=;
        b=lZ4Omjd/la8O5RByLi/XyKnlhN+51GFdW7YsRXJb9xGyxBu/qI34wLHn6rhdn8zhyV
         te3riLasY2hIQ2Qpv9hWc3KwqFv7+8irzFaPVRHUWiVxK+J405JxZk5VXo9DtUdzfx06
         0Ws3We3uBzvLmSOgiV+tsRVs808TuFBNSo4F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707154038; x=1707758838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awdyICZKqpWCHNwcWSP6CybyXKbC+Vyt3NLnV4CSWMQ=;
        b=KI63/yOLgQSv9PDprpfygL8UsPJP9l3sU6fzp8AcbYZt5t66QT8Fte5KXeAHUmjXqI
         FqhAJU85/7e/ksk+EdpgXOgzC62iLnofI7Fd7wX3JwsYH3J1CLmJTUwi6aExE4eaxyfQ
         oIJ6F4xtArTeb7c49dG0vzaGV09/x+Y2K9boqx/zfw0sR/aRoNvALRI8XWaUyD9xQPyq
         zfkx4MJh4eB13/EXf9scK80//X2bUnbSKILXxRoPH1Zg4IlGf97oHengtxiOvpoIRXb9
         KfG2h3qja6eUM1aRAoBKDfllV2CrUVO00Bq2tMHfnYVTK66uLkt/Bs8VtK1BAnfTnb/E
         7Jww==
X-Gm-Message-State: AOJu0YwjTZmx6qszfcUtPcZUVpayarX/I6pe12nn0H4aaQKvZtT0A0KU
	txQHemhWJTWRjL1wMTMHlGM16O7uhEYwg7FTEMSNHZmDnI5s+b/qbwABBr1+n+8Kjci00QlI+D4
	P
X-Google-Smtp-Source: AGHT+IGmRA8eleUDlMIOzy/6BiQJrCEg5AazEKptofHP2EWYZYzrkni/pfSf4js5hALIFOGkwNwEww==
X-Received: by 2002:a17:907:1708:b0:a37:8424:3d0 with SMTP id le8-20020a170907170800b00a37842403d0mr343465ejc.9.1707154038624;
        Mon, 05 Feb 2024 09:27:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXF8xgmBSCcl2NU/7Xjg6Qw3pzBW81agg6w77+Qzj8VdOdAhst5UAxXUMo9iVqe9+HSn5I8TWk+5LaQ
Date: Mon, 5 Feb 2024 17:27:17 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Cyril =?iso-8859-1?Q?R=E9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xentop: add option to display dom0 first
Message-ID: <a8194dec-70f0-4f90-898d-f15152a5018b@perard>
References: <87846acd5b31991e38561c9765eb97730c79d0f3.1706723494.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87846acd5b31991e38561c9765eb97730c79d0f3.1706723494.git.slack@rabbit.lu>

On Wed, Jan 31, 2024 at 06:51:34PM +0100, Cyril Rébert wrote:
> Add a command line option to xentop to be able to display dom0 first, on top of the list.
> This is unconditional, so sorting domains with the S option will also ignore dom0.
> 
> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>

Hi Cyril,

Your patch looks like a good idea, but xentop segv without '-z' now, when
there are guest running.

Revelant part of a backtrace:
#0  xenstat_domain_name (domain=0x121) at xenstat.c:344
344		return domain->name;
#6  0x00006344dd283651 in top () at xentop.c:1209
        i = 2
        num_domains = 2
        sort_start = 1
        sort_count = <optimized out>
        dom0_index = <optimized out>
1209		qsort((domains+sort_start), (num_domains-sort_count), sizeof(xenstat_domain *),
1210		      (int(*)(const void *, const void *))compare_domains);


Also, could you update the man page? Here "docs/man/xentop.1.pod""

Thanks,

-- 
Anthony PERARD

