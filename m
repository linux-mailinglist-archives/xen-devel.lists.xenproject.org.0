Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FBA45BBF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:29:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896299.1304981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEfD-00020P-20; Wed, 26 Feb 2025 10:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896299.1304981; Wed, 26 Feb 2025 10:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEfC-0001yD-VM; Wed, 26 Feb 2025 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 896299;
 Wed, 26 Feb 2025 10:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnEfB-0001y7-Vf
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:29:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853a1a21-f42c-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:29:12 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso43747655e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 02:29:12 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab39b8dccsm29906425e9.1.2025.02.26.02.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 02:29:11 -0800 (PST)
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
X-Inumbo-ID: 853a1a21-f42c-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740565752; x=1741170552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QT/YGRmwCwbMpJ2l+e/5h7gK8s8ml7oe+0/mXwvJKY8=;
        b=YqG+S5khhJ+JMCuSoIS4DbcluZwSqviP9E00JWAPu7bg8EU9514cSSg2xKY1L6dBQe
         xmn+PAuIBraJTNgohn8uB5amUBN35Bh+fTXgjrNE0dK4ENPoKk2AN14nAtjlvgJ8wmMZ
         8Eh6vC7PjBFY5pIRaab5PfzEvyfJRtnfXbt3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565752; x=1741170552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT/YGRmwCwbMpJ2l+e/5h7gK8s8ml7oe+0/mXwvJKY8=;
        b=rIIRTwUGU5Ffwv+LRBYUX2wINUAXQ5nEJ4XZrsdl/dfAVOutL0WaKaL0NMZ3F37gim
         sBgoOc47TPih2BV50gx82jsT9rOZKS5cuMXCOB92FlT/TvPUyvwFK15GxCDq99JC3hGm
         gkUJEzD6Xn3WjGNQ/KuDCOSePCbcMjnaxlDsIg8idrw4ZGd596Mw4mErM2LTcowa+EM8
         c/Bi+plPGAZyb3fl6MFZPrczh1HFyvGYGnogiEbUh2lRrXd98aQya6hOugkHKvHifJsv
         N9rGwGM0ThYpRvQiHOhBrhqpwzvMn4dpbcPsJ4mFJjBZ6ZgiLnA/PWJ2PPcnwJimtz4/
         WYPg==
X-Forwarded-Encrypted: i=1; AJvYcCW5HMvKd+QBRn7TTjV+VF13y/V74wb6KQS0iluvxKFNcqw/sthUEUimwdxhYc9ivmgKBxlgQjoaZMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbhL8GsK9V3j906IPJT+TM+iko7H91+a2lWixhZEeBzcdtQ639
	aHCO4d3xuE7F3Uk+IHfQM1nWpO4JU1y3G27XSXFSby17BEtKhwGABIS6HpGLD+k=
X-Gm-Gg: ASbGncsjxkKGC8i9+PZaq8ffhxhhnuRx9LScoDOGl6ojwOEtse044RduncxTyurfl9x
	wmXnPRO6AdQNwM7+O2alMq/jvsqQ/Rd773MwnwLFu9ljsdXx1Z/BpsK15mbkwdpoLIMyF3y4wXe
	dmQQbu6Bk64C7Xl2Q8uOGgqWh79E4p4na2B7odErSMEkG36ZANFMBn9Tc1bEhS6CKzXUtZ4rJ/u
	3s5Im1Picd0Gmg/L4IK2S5g7Pj4R0dr2nhgi0/yVnUS51A348yepd0xCSOxWAejuGsMZawJ8i0Y
	B92j6EQiGOwjYcUiR9cpnPgUBUOWq2Rmi+QtuvmULd2GkqFtABGl193MCFOD9/aJCw==
X-Google-Smtp-Source: AGHT+IEu9QUijAW7kj2gbuN/FkWaRfJAiXlKTyTZTUlXTN67xarl0F8PpMeDG2gWGWLDW+QJ6g+QJQ==
X-Received: by 2002:a05:600c:3c9d:b0:439:88bb:d026 with SMTP id 5b1f17b1804b1-439aeadf8a3mr182501205e9.5.1740565751883;
        Wed, 26 Feb 2025 02:29:11 -0800 (PST)
Message-ID: <39cb3d4d-29e2-433f-972e-2763ff87e64e@citrix.com>
Date: Wed, 26 Feb 2025 10:29:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bsearch: Split out of lib.h into it's own header
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250225222048.1181435-1-andrew.cooper3@citrix.com>
 <873ab25f-7933-4580-827b-928f73e1bd2d@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <873ab25f-7933-4580-827b-928f73e1bd2d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2025 10:38 pm, Julien Grall wrote:
> Hi Andrew,
>
> On 25/02/2025 22:20, Andrew Cooper wrote:
>> There are currently two users, and lib.h is included everywhere.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

Funnily enough, there's a hunk missing.

diff --git a/xen/lib/bsearch.c b/xen/lib/bsearch.c
index 149f7feafd1f..9973117d1d8e 100644
--- a/xen/lib/bsearch.c
+++ b/xen/lib/bsearch.c
@@ -10,4 +10,4 @@
  */
 
 #define BSEARCH_IMPLEMENTATION
-#include <xen/lib.h>
+#include <xen/bsearch.h>


Nothing anywhere in CI notices, because not even ARM emits a library
call, so the fact that bsearch.o is empty when it's discarded by the
linker for not being used, is incidental.

I cannot think of any good way to fix this pattern.  Not even adding a
self-test, because we intentionally write those in a way so they get
dropped if the library function as a whole isn't referenced.

Given that we've got this pattern exactly twice (this, and SORT), I
think we just need to stay vigilant.

~Andrew

