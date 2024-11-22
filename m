Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E39D5A20
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 08:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841730.1257226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOIP-0003FG-5z; Fri, 22 Nov 2024 07:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841730.1257226; Fri, 22 Nov 2024 07:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOIP-0003CM-2e; Fri, 22 Nov 2024 07:41:41 +0000
Received: by outflank-mailman (input) for mailman id 841730;
 Fri, 22 Nov 2024 07:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CazJ=SR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tEOIN-0003CG-EB
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 07:41:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3342de81-a8a5-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 08:41:35 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so259867766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 23:41:35 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28fe1bsm66384366b.28.2024.11.21.23.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 23:41:34 -0800 (PST)
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
X-Inumbo-ID: 3342de81-a8a5-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMzNDJkZTgxLWE4YTUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjYxMjk1LjY2MTEyOSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732261295; x=1732866095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBHoeELbwDLkucIgeo0FolILCzjYH65AZPyoPhvFLo0=;
        b=XY0L7T/oYPHUO75/OtJiTSRCG4+kX8i1yk6k7+c5sgNoguoMV1BFh6fGQyZbaf8crY
         fmeVUkpMNd6ncSs/qZeyeK7p/uuq0gHKZlIzejX+xILSyandKjwSLBOTxwAsa7fNGSWa
         CPI+r/BILdaKs9fyiaFZppQcu4IizMoI1PYg90WTVgyuz73/Vlwuw7QpVoVYhbDMQwcC
         QNLd4uQIv5PyCXWAj6sRgBfRjKjcUJaBQ4mY4MYdW1xMeVMiqMtgro8j90iSS83cqEZQ
         83x/1pN26tX5bmQmtMfuHYOb11bavARUahUKM6vyWcERiVwDmx7a9CLINKQ+YFgVKTlT
         9ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732261295; x=1732866095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBHoeELbwDLkucIgeo0FolILCzjYH65AZPyoPhvFLo0=;
        b=m7MBR7Hh9TDar/6I5pMXb2ZOnctxD4zXwsqlp+2hBFGZea1/WY+UQmjZMOWwUqQWdj
         +dwZoiAy4DEJjZHDo7n/U7ETyG5McBO8rne/Cx7dTs2QTqzMdk9PfuMezvR2AoTOiq7w
         oAUrqkKnOtta9/E//5xloM85mjgABIg86amhoMCkggoN30KbZO6iYX3nS5QsnfE0edEV
         wfeCgTKCQzv/sf2/pXAf66HkCRKdNTbyoVV8g8VEUuxUMIK6foed8F3HOvJAFExKe7my
         wm9jrheMx053CJrRP/Ops0EnG+T9MX/w9Fu/A8WIAGQThJ4uL9291617AYwjwHiLrTPZ
         PCDw==
X-Forwarded-Encrypted: i=1; AJvYcCUCVZml4NNd1WAR54zdHfSEUjvTbP6WVbWzeXrWxBfTTusaQSnTS79woTKJVFzdmAL68H0NlZgh4aQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyefy5gesREOjFGHqcHoHRh3442bcs08hfiTWxhbqA0wfDcclx9
	z6V4W4EoeS6fWiCnFR92VwAwGuZBkNP4G/izRVbfHFfbi7XLpGrI0ENXdxnNTbw=
X-Gm-Gg: ASbGncs24m902ufdCpBpIliV8/g2vDTvlmOKEb0fX9UpXgrIV8KGYCF6cmoY3KaAydv
	zRiS/i/mqOkhpv/27TcbdTrMRczkk9nEcd9evnHsF2A8FfV7PzSjfIBVyczlFRWgG9M2dIByFx7
	wl4GzWnXmrVrB34TemaiCOY6ih2/jZWmMOqRkcAV4lf94GqpdGvffJt9W5wmXBNgy9+hgQ4m4Po
	iGx3wQG+Yn61zU03GoQ1XCjfOXbKqJBvrouwcwFkngio4bB88Ldp99Q21gEn7IZIYrT04BVm3Jt
	wE8htrR2QHu8VQDraUOnah8Op07SWXWalE2GlNoZszIAOwTNlWHRcPIztjyOLzlI88ufuz3H1Jk
	=
X-Google-Smtp-Source: AGHT+IF52r/fIQbL1oofxnzTPJf9FWebVRq//EG7R9cwJOhSaBapeMtbsLC2alc3Bk+yr83btzoIrg==
X-Received: by 2002:a17:906:9d2:b0:aa4:fc7c:ea78 with SMTP id a640c23a62f3a-aa50997efb1mr140885766b.23.1732261295072;
        Thu, 21 Nov 2024 23:41:35 -0800 (PST)
Message-ID: <f65fe715-2ef7-4171-8bae-b78438656dcf@suse.com>
Date: Fri, 22 Nov 2024 08:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] 9p/xen: fix release of IRQ
To: Alexander Merritt <alexander@edera.dev>, v9fs@lists.linux.dev,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Alex Zenla <alex@edera.dev>,
 Ariadne Conill <ariadne@ariadne.space>
References: <20241121225100.5736-1-alexander@edera.dev>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20241121225100.5736-1-alexander@edera.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.11.24 23:51, Alexander Merritt wrote:
> From: Alex Zenla <alex@edera.dev>
> 
> Kernel logs indicate an IRQ was double-freed.
> 
> Pass correct device ID during IRQ release.
> 
> Fixes: 71ebd71921e45 ("xen/9pfs: connect to the backend")
> Signed-off-by: Alex Zenla <alex@edera.dev>
> Signed-off-by: Alexander Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

