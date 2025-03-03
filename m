Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC0A4C65B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 17:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900497.1308378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp8PC-0005S7-Cq; Mon, 03 Mar 2025 16:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900497.1308378; Mon, 03 Mar 2025 16:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp8PC-0005Pu-9R; Mon, 03 Mar 2025 16:12:34 +0000
Received: by outflank-mailman (input) for mailman id 900497;
 Mon, 03 Mar 2025 16:12:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp8PA-0005Pl-BF
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 16:12:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d3a37a8-f84a-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 17:12:29 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so903545066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 08:12:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1de2e7be2sm119318066b.32.2025.03.03.08.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:12:26 -0800 (PST)
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
X-Inumbo-ID: 4d3a37a8-f84a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741018347; x=1741623147; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cL8SxB2MzLj/C9GQq1BmBvU9bu+fPXPvGSWwcxe3tjo=;
        b=j1SZF3ubZm7qrQgLd5OJa1hM2+lDyxxuf7Mgy+QO2I2eb2Kq7xTonPUtrrZeDeZhhe
         gHyTu0gAea2e4JDHUAJVSkM7ywDZwOoGhwugD1qL1utlUzwXhkuY3yPAIW8AmOzYu+TS
         ep7IpmXNVaAghIuO9fSuLCFm859rxe5wQlahE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018347; x=1741623147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cL8SxB2MzLj/C9GQq1BmBvU9bu+fPXPvGSWwcxe3tjo=;
        b=lgXwIgbr+G5L71I9C8Ir5OTlX2lmxtZ1442xi+sqBNjvBW+Ok/O42cEZ7po/F+BEEm
         Tj7/J5FGrJF/wCWpp+vosMY+RKpmGeuKYr65hHkGEOEOAdg6il4Uez2pyq6I3KI/xJIM
         +z8KdltXEODOLC6eS/sFfW2Sg9guSJsCmZrtC8owjqYoDvQpDR5tHgiZlDjgaRQ2aRoF
         /VCpF5Mjj8U9w6Flqs9T2eMYwcGOsV4jEMT+OX7X12VJVz4mFNe24iDPCPpQP0OQn2z5
         4uybVnJ4DNPpdrFlDFXP6YWQFyKjJ3e5pm+8F8jQeKQp8dHm6jhBmzD7YOsVohZ3yz3k
         XyXA==
X-Gm-Message-State: AOJu0Yz26GrQ5YYOoek2tWis5ADWBlSOWM7z7pwdsBVL5mKW1czWJrC5
	jyMeuNHvCR588UvB6n+dUWWPkXcAZdrkdGgi3sXwPoDKSewlHMI2ToLzfZfiwbo=
X-Gm-Gg: ASbGncu0BPnRRPIMRgFGpCDWv/ALhiM7Ku73KXNK4iUzJz2bpjSkbAJuGIWiOWZCf89
	zNVe068N3vR4ree4fVgvk0U33MDAtEE8noYxnSwa/SH6l5lXAcdU1vDZ5q/67vPMJ6PZxQ0xo6j
	xvXCluDgElq+iETIg/cw0y2Vr0NZguSkfCCy1PaYgDWYLh5ZP3mRxxeN33frSqj3tYo9rB1+t7+
	zECvqiZgX2h6YGTKiEABr3Q5334Oh2vVGaMysV2EvXDO0IsWw3bk7NVxuBZHxpYhzp6HvgGgcY0
	WV/UBv9wgUcihGZB1rVRlwgRBRy4R3oRLRN3Tn0HSKCxrvtLbA==
X-Google-Smtp-Source: AGHT+IFPYk1ClwxCJkXejuLS7yZc5qfmQiXrrqh7GpPh5+G/JQ0mHc3IaBB+6ByPAm/UK69GGYTdiQ==
X-Received: by 2002:a17:907:7ba7:b0:ab7:ca44:feb8 with SMTP id a640c23a62f3a-abf268380b9mr1628327066b.52.1741018347347;
        Mon, 03 Mar 2025 08:12:27 -0800 (PST)
Date: Mon, 3 Mar 2025 17:12:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20 2/2] SUPPORT.md: Define support lifetime
Message-ID: <Z8XU6m1nSIvRKxzJ@macbook.local>
References: <20250303141754.26452-1-andrew.cooper3@citrix.com>
 <20250303141754.26452-3-andrew.cooper3@citrix.com>
 <Z8XHBA7hL4uuU29w@macbook.local>
 <89fc9950-92bd-4226-b96e-f0e091a6071c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89fc9950-92bd-4226-b96e-f0e091a6071c@citrix.com>

On Mon, Mar 03, 2025 at 03:21:35PM +0000, Andrew Cooper wrote:
> On 03/03/2025 3:13 pm, Roger Pau Monné wrote:
> > On Mon, Mar 03, 2025 at 02:17:54PM +0000, Andrew Cooper wrote:
> >> diff --git a/SUPPORT.md b/SUPPORT.md
> >> index 2bc5bd81ee39..a72798aeeae4 100644
> >> --- a/SUPPORT.md
> >> +++ b/SUPPORT.md
> >> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
> >>  
> >>  # Release Support
> >>  
> >> -    Xen-Version: 4.20-rc
> >> -    Initial-Release: n/a
> >> -    Supported-Until: TBD
> >> -    Security-Support-Until: Unreleased - not yet security-supported
> >> +    Xen-Version: 4.20
> >> +    Initial-Release: 2025-03-05
> >> +    Supported-Until: 2028-03-05
> >> +    Security-Support-Until: 2026-09-05
> > I  think there's a typo here, it should be:
> >
> > Initial-Release: 2025-03-05
> > Supported-Until: 2026-09-05
> > Security-Support-Until: 2028-03-05
> >
> > So 1.5 years of support, and 3 years of security support?
> 
> Oh yes, I've got those two the wrong way around.  Fixed locally.

With that:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

For both patches.

Roger.

