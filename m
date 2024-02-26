Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB4867961
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 16:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685602.1066581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recWD-0004N7-Uv; Mon, 26 Feb 2024 15:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685602.1066581; Mon, 26 Feb 2024 15:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recWD-0004Kz-S8; Mon, 26 Feb 2024 15:03:49 +0000
Received: by outflank-mailman (input) for mailman id 685602;
 Mon, 26 Feb 2024 15:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1recWC-0004Kt-Tm
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 15:03:48 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d85154d-d4b8-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 16:03:46 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so3980258e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 07:03:46 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 on33-20020a05621444a100b0068fcd643b9dsm2994029qvb.22.2024.02.26.07.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:03:45 -0800 (PST)
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
X-Inumbo-ID: 3d85154d-d4b8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708959826; x=1709564626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr6N2E4s3ZIVhqfK7Ixg4PBr82pi6VcdNcQD+020dwc=;
        b=pzMFHpzOwBaIY0g2SvEJA//FI6kHyX4r33L+gqeJiuQYvwcTF6UbYBSjrDYXkFQRVN
         YNf9/mIZE4KT+oqWqeXLDs01+mfh+S/05rXX44hz6OckmFnlGRirgL7gZTCmc1LUvHRJ
         c3h04y7ISuCbUImaQtETGFy078974h6nF801c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959826; x=1709564626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rr6N2E4s3ZIVhqfK7Ixg4PBr82pi6VcdNcQD+020dwc=;
        b=YTqrZugViGjeVNbEVdyDhQh7by3/A8ozWjqwtLWRUs3fhdkPtp59axl68ETvzNIbPC
         XJ0YiJW8rlXCt732LNm4m2bq4q64nIBTymU/141xMBRITZ0dm+Ubu06JpX6gQJgDN0Bl
         Xy+7qGsm+1SP1978k+oAtkB2RsZSRciE59G3ICc8pnNYmECcGCxgWW/EbK3x0UjaYmQh
         CTI6qJLtvvLCnlqmiqgC3CRoR8xQkhYYetVPaREGHbO7Ib3cTiFvBZoUg5/mw9H80Lzp
         UBGrLbYFuC2ZyCvMH8KVx+DbFbthcFNJnyrMfIzJwd+Tydxs28v1FBb6WsrLy+V8FwsE
         aMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzQQRFFt9mv4CN0Gva1UgWacdtP9Kb53K1euUxZq1XCNNmEoG2qcGC7+SbzNtiplPv1Ry4Kd/01mq5N6x1HDlQr8oxld4jZYIVent9j/M=
X-Gm-Message-State: AOJu0YyHtLFgD2BRDsZHiFzoEa1lCwSFReg0luxeKscrRgAlUweXI8a5
	+j73YcWZXRpNHwIaGxW5J26e9tWUHZXU42IsB2lTc9ym03xhXsfp+WRYNTQ1Qzc=
X-Google-Smtp-Source: AGHT+IHwkr0QNg4jlzXKXVUfUBASM6OMQOqvDwoDG0womIbrldHOThD8JHiGEYhgR1re4xV3o4e9lA==
X-Received: by 2002:a19:2d1d:0:b0:512:f73e:403b with SMTP id k29-20020a192d1d000000b00512f73e403bmr3000931lfj.19.1708959826323;
        Mon, 26 Feb 2024 07:03:46 -0800 (PST)
Message-ID: <e34cd78c-ce80-4a61-a1b9-8e3c9479df0f@citrix.com>
Date: Mon, 26 Feb 2024 15:03:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xentop: Add VBD3 support to xentop
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Fouad Hilly <fouad.hilly@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226141211.1416866-1-fouad.hilly@cloud.com>
 <9468ccd8-44c3-4b50-b200-5a4ae1cca8ff@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9468ccd8-44c3-4b50-b200-5a4ae1cca8ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2024 2:22 pm, Jan Beulich wrote:
> On 26.02.2024 15:12, Fouad Hilly wrote:
>> From: Pritha Srivastava <pritha.srivastava@citrix.com>
>>
>> xl now knows how to drive tapdisk, so modified libxenstat to
>> understand vbd3 statistics.
>>
>> Signed-off-by: Jorge Martin <jorge.martin@citrix.com>
>> Signed-off-by: Pritha Srivastava <pritha.srivastava@citrix.com>
> Just a formal question (I'm not really qualified to review this change):
> With the above two S-o-b and the earlier From: - who is the original
> author of this patch? The general expectation is for the 1st S-o-b to
> be the author's.

This patch has been sat in the XenServer patchqueue for a decade. 
Neither Pritha nor Jorge are with us any more.

Sadly the review system we used back then is also no longer with us. 
From ticketing, I think it was co-developed at the same time.

This is the form the patch has existed in the patchqueue for that time,
so I'm tempted to say we reorder the SoB chain to make it match.  That's
the best I can figure out.

~Andrew

