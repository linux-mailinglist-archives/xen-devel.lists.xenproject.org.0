Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF5B96ACF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 17:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128542.1468865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15Mq-0001CM-Td; Tue, 23 Sep 2025 15:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128542.1468865; Tue, 23 Sep 2025 15:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15Mq-00019P-Qv; Tue, 23 Sep 2025 15:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1128542;
 Tue, 23 Sep 2025 15:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v15Mp-00019D-1f
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 15:55:47 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c445ad2d-9895-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 17:55:46 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so2573169f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:55:46 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8a46d5772ebsm567205539f.7.2025.09.23.08.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 08:55:44 -0700 (PDT)
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
X-Inumbo-ID: c445ad2d-9895-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758642945; x=1759247745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Qfm+OzAnchWzhLAzcUVzHke/chdTkt5EecfMWvjA9E=;
        b=PY77ZHEuPrj6Rx23xN2RTpcwyCGqOvvqpklrOyIr/9YJzcjOEzyciuh72dNN5KtpQA
         P73Gd0EkT9ivxf0g24sOtEDqVlQT8GP6eW9VxUjECDzGk13jCTs1QEJqK5cWv5Le9OYs
         kyJUd3V0AxQs4yZQvlWIZdpSf7vp9qN5Dv/B3i0KT1Go7q6ktDz8S5Up7ZcgshWcBIvp
         nbxjsIdUhUZV5oZ+ALR3EAW3rU5ZQ35lwxD8xEQ4El8100WgP5WUup2TN6aeFJ0I5Gq5
         xLIVbU4616XssFFWm+Kbtehqgc6+7GhI3XI1KtwpxeOpX2DnOqS/+Dm0kqx5eS9/7AN2
         jnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642945; x=1759247745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qfm+OzAnchWzhLAzcUVzHke/chdTkt5EecfMWvjA9E=;
        b=Fhrv47AotnU70n8SgULjbhsFLrC3MMcCMdvqBGFGPumthgUUTDHYmciiO8DzKq8dQh
         Al1dtgqlyaRYJjAHITC8cLVQXrVGqbSXJ3YoQJiBDm6jeGCgIRFfGglK4BWLCdXRHudM
         AcNpFDogs6bidtLiIqpuPs8TZnn0TQu2JzlRfL8T5cFW6EC+FWYNtDOnEL3rL/OyFSQB
         W6RtltW8jO8RtKps23oc1/AFgA6THtfiUZTD/TEM7REn2HUq1KopklBe/uwVVufoS2o+
         ntPdO/+n77DsvonsuKgpWNfUwkitXvRMJqZ1A62i6Wpm8oSs2NIhfSK30pqUDd2obHyB
         aVKg==
X-Forwarded-Encrypted: i=1; AJvYcCUuT7BF2ZijiCO0AZgJQwKHuipFsiEI4ofoPY4B7rf0RXVvPI8fcMBNqRVcyYrzBRikhLgM9qKpJsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCKjU2D5LkDjHcIn8he/i3Ua4v328GswK4jMf40eG5kqSYPxze
	Rutd8PoYJcptMNLmCQEQXnJm8FbIRb5qBAqNSE6FCg+x1aIvnSowcS9XdjKui92KKw==
X-Gm-Gg: ASbGncs5H6luQkqOKRqy1bjSL2d0uhL7l/bSEGKT3l5miwbd6CjysT62X0Nc0T+1QNm
	MmJ/MSxhCeTcwq5Msydyrd+/PKf25YTANqHesuA8/UWdFTBToiHKofjPGBtQX2VuMF7+oY/8hY0
	Q4ED7/xhDwmC6lPI976IZlajh6MpmhJJSt1PznCvha7D3pGO0gltVEmmUJzXfKoMmqovlS+8Pfr
	zykwVXzghlWufpAZa1a40yLatIFL7jsC1GiaWHR/lhd6AUT5IqV/Ok3td4GYRZ+LwGwMiiRBWfL
	WNBp2QOSeoonF9vZpAkGSKvOJ0P22HXBB9YiBdWsLeIO1n2RGo3W1sHD80otcB9EJ1SrZI6XsiA
	w77N/dcjTq2cmNrptka03EaGqmx3wLrb/
X-Google-Smtp-Source: AGHT+IF3A6r3XlVwD7NPIrOKt7r9xlsFK+UDbCrWOBDakls4fCsCcPx27AE5F7UNWoddQo1Sxfoh7g==
X-Received: by 2002:a05:6000:186d:b0:3e7:46bf:f8bd with SMTP id ffacd0b85a97d-405c5ccd210mr2388925f8f.23.1758642945377;
        Tue, 23 Sep 2025 08:55:45 -0700 (PDT)
Message-ID: <79be9616-f943-4ec5-ad1e-d1ad29e6d9c6@suse.com>
Date: Tue, 23 Sep 2025 17:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] xen/page_alloc: Add and track
 per_node(avail_pages)
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <b9f618a2209b105a1d55418fa3dfb7c270f97b80.1757261045.git.bernhard.kaindl@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b9f618a2209b105a1d55418fa3dfb7c270f97b80.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -486,6 +486,10 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
>  static unsigned long *avail[MAX_NUMNODES];
>  static long total_avail_pages;
>  
> +/* Per-NUMA-node counts of free pages */
> +DECLARE_PER_NODE(unsigned long, avail_pages);
> +DEFINE_PER_NODE(unsigned long, avail_pages);

Why both a declare and a define, but no static? A declare, if needed, would
need to go into a header, I expect. Whereas if only this CU needs access, no
declare should be needed, but static be added to the define.

> @@ -1074,6 +1078,8 @@ static struct page_info *alloc_heap_pages(
>  
>      ASSERT(avail[node][zone] >= request);
>      avail[node][zone] -= request;
> +    ASSERT(per_node(avail_pages, node) >= request);
> +    per_node(avail_pages, node) -= request;

Seeing the avail[] adjustment in context: What's the difference of that to
per_node(avail_pages)? I don't think the (apparent?) redundancy is properly
explained in the description.

Jan

