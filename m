Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F2AE7FEF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024686.1400521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNdU-0001bA-53; Wed, 25 Jun 2025 10:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024686.1400521; Wed, 25 Jun 2025 10:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNdU-0001Yz-2R; Wed, 25 Jun 2025 10:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1024686;
 Wed, 25 Jun 2025 10:45:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUNdT-0001Yo-8z
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:45:47 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a9c5cd3-51b1-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:45:42 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c8cso9874014a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:45:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f482e8csm2347719a12.59.2025.06.25.03.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 03:45:41 -0700 (PDT)
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
X-Inumbo-ID: 8a9c5cd3-51b1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750848342; x=1751453142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dVKTI8M5rR8w941Jup6TIzyhKTqn/6q8Xgpx4N6o1QA=;
        b=pTn2O6t3QQRi016wG/DSEzk6kQlbGwQOBRfm3TrSOHcvtl9AQmwna33PYF4hhXj3wv
         n4N4paxMaTNeuD9WoaAX+rbVFOwd5TRc8ixaQnHyfOzXTJqlTLc+u1r/F4aZdEMdiRTb
         suYRrZgmQsZuHnADNvtKnhGT1xsz7blO+ZIAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848342; x=1751453142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVKTI8M5rR8w941Jup6TIzyhKTqn/6q8Xgpx4N6o1QA=;
        b=J3D0V8k8XddcYBPSyg93ZGa3RvEqOF1PS/YMo/b2z59/JMOQ4b0ERIrV7d4ka19qyA
         NvCaJkbTLvkpyKTv5TaAxGNyG/0amlIoxtfz0eBu3S7xAVNjXBNvxCc2b+eWCegbFljy
         ZUqox6p+rCpbzmmd3wnTgPrywkUK8K7e9Yr/M9mrlhPmxLFPM6wSS2uiTjzZzcYuWw1r
         /YqwWzLOACob5ytFlB2V2oC2qPR7GDrv2yMNtQVh1uajFx5coUgybF+i4u/NdN8dsDSB
         npkrLovaqPmV99n8TI3lbfyr7cSXmnZ+d1xSmlkcQ7cXpKsKV79+YehPdUEs4atBSZQp
         5Jbg==
X-Forwarded-Encrypted: i=1; AJvYcCXY+/OF/1GfbL6tofHKl1RegAhBZmxP3YJ6pVMCJ3Mpj/woAokC2Ndb9u41FnU8KK77VlOSw5ehLZU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRxika2EQCJGxu260UZkfmWmE1O12VkLdhZDP8p+y2pEZHPfjO
	LWb1uz8KFtqUFh101Fk/MZYkBjuoCVNuAazmA02SNI3TOBzPUn4j3NYg2AjzsSFfC1E=
X-Gm-Gg: ASbGncujxYZIa9F+gebq10Qs4lXgF3+qrCislZcj6bf6VEihWVdsRFiF7XF4im2EuVq
	SoLE5W9VhBhHMDvzHyPKi+r0NhPDln7ro3jrvsZSdGXAMBQuYw0bAFq24+xpgHOoUFFAXEkc+lI
	NDolFYZGJ1didtudrrUwuyVqOZUWt5SbejI9A4GDvnqRdJIyk6K207uwWHF1fV4qdCLBD3YB0aR
	sPasoPtNKwqiEeVPXe5iFoBuyRBFut0vVhJ2+rT0L/Uzhyg8dvL2Hl5YS/2qp3/VDqYGWDYMPJX
	St+7YBb+fNeHxnsf2u5yzugUhPHOeIoKSHcJioh5FTMcax17BxIAnrZX2Wo7XUNfZsPMLOzBQAf
	3n6Ywp91dXd12E9SO25urtQHWP3c=
X-Google-Smtp-Source: AGHT+IE0hwLOiyQ2WiF3q2CFdxOTFGfZuxpfOZu+PrUcMrwByabyvMTX9jmx9zcoQRCC5YDTJbKQdg==
X-Received: by 2002:a05:6402:2745:b0:608:523c:1365 with SMTP id 4fb4d7f45d1cf-60c4de011d8mr1382759a12.29.1750848342016;
        Wed, 25 Jun 2025 03:45:42 -0700 (PDT)
Message-ID: <23269cf9-778e-4478-bb74-458bf84a9f62@citrix.com>
Date: Wed, 25 Jun 2025 11:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxenguest: fix build in stubdom environment
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250625103306.4599-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250625103306.4599-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 11:33 am, Juergen Gross wrote:
> With introduction of the new byteswap infrastructure the build of
> libxenguest for stubdoms was broken. Fix that again.
>
> Fixes: 60dcff871e34 ("xen/decompressors: Remove use of *_to_cpup() helpers")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Sorry for breaking this.  The decompressors are an intractable mess.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


