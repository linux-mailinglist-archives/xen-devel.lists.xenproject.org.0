Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFCA6148B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 16:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914792.1320441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt6h5-0002Uh-Si; Fri, 14 Mar 2025 15:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914792.1320441; Fri, 14 Mar 2025 15:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt6h5-0002Sb-Pv; Fri, 14 Mar 2025 15:11:27 +0000
Received: by outflank-mailman (input) for mailman id 914792;
 Fri, 14 Mar 2025 15:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt6h3-0002SI-H6
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 15:11:25 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955995fc-00e6-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 16:11:19 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so441932266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 08:11:19 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149cfbb3sm237722966b.101.2025.03.14.08.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 08:11:18 -0700 (PDT)
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
X-Inumbo-ID: 955995fc-00e6-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741965079; x=1742569879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=on3WPjCyyf51Sz+9icxHB4iXOP9KG/1BSzZBFj1esNI=;
        b=XlAKZIhoDGMaDU+CAaCs33APLc/ePDV/ZumMrKNMf8hnSosJBu50WT8qd4XV+eToS0
         rtQwNxt0p9lDzqY2QWpbfx36F2x9vsJMy64OdG+vcUR083PKGbIkC/YuXCJWwapKxZm/
         QukO/VLXGKgHCLAf4zdY8y8lzOFkBsmwZEMHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741965079; x=1742569879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on3WPjCyyf51Sz+9icxHB4iXOP9KG/1BSzZBFj1esNI=;
        b=N5V1lQ17heblOs90uNVScTJMeAe4r+fBPoe1QdcwjeXzJjAMeOpMvRI/5XkIbUhKPR
         X9SHqnE1yU/mu8+5gFsxZmLHj6GVdaTg2hw2nHm04Ii9CMLRhHFqzxElupTgl8lWzc2H
         kUIUCkyebpF1AV03oepd2enzD9Yc05wOFtXKnmPII8SqVITEsrtZ1WfHq9Siv70Fmzhm
         PhF22Z53+wKDZqe8FU+dsMCNTwVQKnjU9cK/Dg3Mu6yzWYEYlN30SQG3KgKfP2yzpo4d
         6gO8hVHutxet4nJlLEpV0F+RMy4reVCoYHKBGBin3g3qw+m8B3iF56jfFY1CsnJxqVuC
         hIzw==
X-Forwarded-Encrypted: i=1; AJvYcCW0iYNhAJZOSkgmvQ6wpHkygocjoPiMnQz80O8UzqR01CEg9bkVmdax7HehGrCPw5+LIopdDzDAYlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDMnBXmTYHqvRZqYNiOpSOcA1xXc/M6kXg3ziHrwMTb8kU/WK5
	j9LVZquVH8cwxxOcizYFGafZ+fYhJk0UQGN3BdVWs1oKCTgdTR2YD3Gwwr2Er8M=
X-Gm-Gg: ASbGncvV8v4OF/+V/2oXVK6SEjR4+R6EiztXkqb+02hxGjSBLrPGOlb5jGVwOUMGHFo
	dJedBcQ3pnfYUtcGPl61s8XNkj+Iec5R/XStLEEve092hRFJkuZ/GwChOOI6B/lRHlN9DFRzmsn
	hpRUzEsq5/9zT/RxEICmmAlQILQ57G+3+3YUZ4Z/ybTuJMn15+mBuj19xNm0KcB14mf7+vO1lJ9
	A8CB49xd3rPCp4xa6pQTVYpNPhWfpWJjq7mwkpOCUTFlX1FUpsgTtsM/ysS7rpvgBJYvwXZgErp
	B9s6YO8xTpJIX7KI8lJHOKrpx2PmMWnormBwl6YZXYFkWDey2bN+FIIdquILL7ZdMjOLBNlfx5u
	1p5k2AAlo
X-Google-Smtp-Source: AGHT+IHg2kRGceL+y4/Byr1zSKRuqZFchRfa8pEXz9IBGhzCkCN5jiKAqIT68qw98b5mkkfB1+CvJw==
X-Received: by 2002:a17:907:9724:b0:ac2:29c7:8622 with SMTP id a640c23a62f3a-ac33046a3femr360903866b.54.1741965078892;
        Fri, 14 Mar 2025 08:11:18 -0700 (PDT)
Message-ID: <39ef524d-6509-41de-9ea4-7696b68ba54a@citrix.com>
Date: Fri, 14 Mar 2025 15:11:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] tools/xenstored: use unique_id to identify new
 domain with same domid
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250314121835.1879-1-jgross@suse.com>
 <20250314121835.1879-3-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250314121835.1879-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2025 12:18 pm, Juergen Gross wrote:
> Use the new unique_id of a domain in order to detect that a domain
> has been replaced with another one reusing the doamin-id of the old

domain.

> domain.
>
> While changing the related code, switch from "dom_invalid" to
> "dom_valid" in order to avoid double negation and use "bool" as type
> for it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

