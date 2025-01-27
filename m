Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CFA1D408
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877555.1287688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLyN-0006WL-S5; Mon, 27 Jan 2025 10:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877555.1287688; Mon, 27 Jan 2025 10:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLyN-0006TG-PN; Mon, 27 Jan 2025 10:04:03 +0000
Received: by outflank-mailman (input) for mailman id 877555;
 Mon, 27 Jan 2025 10:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcLyM-0006T8-Kq
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:04:02 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07a73085-dc96-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:04:01 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so93284765ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:04:01 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac495d5790dsm5995332a12.60.2025.01.27.02.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 02:03:59 -0800 (PST)
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
X-Inumbo-ID: 07a73085-dc96-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737972239; x=1738577039; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RwNshmp+CHvpCBavfOKUzNpKUjOofXHONCaz+lyP0a4=;
        b=iPwd2XbCKLww86PbOVXChd74hQkq/FwV+eFD49ooGaeou4k8v8Kk9+PEhtI88hyJHZ
         8R1JzJWYYFNH8zGpH4cLDPwnvhwcLyvVLKC/ubobtyFp1WgOFpV8uO5aiggfC3gXEOPI
         zA0sqvT3rhfw82/xX+Yb1OzAUxiioTIzd5/78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972239; x=1738577039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwNshmp+CHvpCBavfOKUzNpKUjOofXHONCaz+lyP0a4=;
        b=dCfRgOZFpB543xsxcCgbh/NHUrO4JmPBME7DF2dNlzqFqIdXOmXdTqfeRANJpT672U
         oSiBo4HvfpxsPIDSmgg5iW9qkVcWOciRXCyg/C540a//jnGYkhlYDRGP8uU0+Xe0u4dg
         DR1sDtlWXgfCnkcbVWPjyOax11GarslzoPjo6yuzUjU/pUqdFc0E5Glbq9uJjeuk4II5
         8100bR7DQwKaKeuaBgZglqCw6vCNahgNkB0EsgMM7oVY6gg8m7sUIW2q+RmiJkM79d/j
         CAkdlw5fN72a9YIEOLcntQ8Zvoo9oyG4Sz+jSr5joBylKMQJBCEDQiSZCrn/yPlHNWTI
         hW9A==
X-Forwarded-Encrypted: i=1; AJvYcCXMFfrBmaRcBTU/Yplzx/gil0PUAjHMa2cD68zbucU8yi2kYDUyEzb7wH0s4wYiUqci1kLTEWy4kcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv3c4aPQgAt3U5SQql/05YX9qpN5Y1194pNMmnMkrVnxIRuhBr
	YlTUjpvJokrBv80mVOjvUxZlE1nAhjSfyOTuIzo2KHwQmgRVs23dFgrhgyC2O0o=
X-Gm-Gg: ASbGncstz1LndFBDq2WVAEnzZjeicIWu43PKro8uIPTy2wbpptUjeKjiqYSb+D0J53C
	pBm4djDc6PWgN8WTgvoK2tIU4Xop2ms/RnB/94fZPO12r0Va1LI/ZHAQ3yiD+C2UNxvSVo/cQik
	F+h9MsHPpYYCe6XERQIT4f4GWFyDzJ+9oCRp/6+R3+02qBh3M7ZsWwzWb4+rT59IoAHCCdURg6h
	WtIZOUch3f/52qPZoyaG+yti7oEIqqdYMsR2zPsq3X5xTXwCcujrQhOzeb8BTL9+B+ncnRjBZJE
	1oqycW3s8/nYOwg=
X-Google-Smtp-Source: AGHT+IELQ3FPsKcgrjAUYcZujAx4M8QxjWZzSaer374cC+eJyajOzfemCBPayPDLRw3ihpaAqbt3VA==
X-Received: by 2002:a05:6a21:8ccc:b0:1e3:c763:74d4 with SMTP id adf61e73a8af0-1eb76a38d2cmr19926285637.0.1737972239674;
        Mon, 27 Jan 2025 02:03:59 -0800 (PST)
Date: Mon, 27 Jan 2025 11:03:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/5] x86/iommu: check for CMPXCHG16B when enabling
 IOMMU
Message-ID: <Z5daCYobAizsHyYN@macbook.local>
References: <20250124120112.56678-1-roger.pau@citrix.com>
 <20250124120112.56678-2-roger.pau@citrix.com>
 <ef73e2fd-69ae-4cf0-a8d2-785a2b248d63@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef73e2fd-69ae-4cf0-a8d2-785a2b248d63@suse.com>

On Mon, Jan 27, 2025 at 10:51:29AM +0100, Jan Beulich wrote:
> On 24.01.2025 13:01, Roger Pau Monne wrote:
> > From: Teddy Astie <teddy.astie@vates.tech>
> > 
> > All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
> > initialisation time, and remove the effectively-dead logic for the
> > non-cx16 case.
> 
> Nit: There's nothing being removed here, so I expect the 2nd half of the
> sentence wants dropping.

Yes, that was a copy & paste from the following patch.  Will drop the
last part of the sentence.

Thanks, Roger.

