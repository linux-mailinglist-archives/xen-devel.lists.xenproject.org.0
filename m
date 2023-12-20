Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60D81A625
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 18:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658212.1027290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG09l-00071R-8D; Wed, 20 Dec 2023 17:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658212.1027290; Wed, 20 Dec 2023 17:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG09l-0006z2-5f; Wed, 20 Dec 2023 17:14:53 +0000
Received: by outflank-mailman (input) for mailman id 658212;
 Wed, 20 Dec 2023 17:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHJo=H7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rG09k-0006yw-IZ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 17:14:52 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49242367-9f5b-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 18:14:51 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3367903b4dcso1139988f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 09:14:51 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c470b00b0040c5cf930e6sm277654wmo.19.2023.12.20.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 09:14:50 -0800 (PST)
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
X-Inumbo-ID: 49242367-9f5b-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703092491; x=1703697291; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHoyBRXbxJl/Fk8Fe3c346+q8RDAepu8NiFo0x6fhJ0=;
        b=NzjabceynYTpScdtdJztAD0D59j5iysW+5AaMWzWuZh6yzWJAyp+rONi7dlIAXPq7h
         GxZ7vRzaxwlUHZtSWnrgQ373V6gApJSjlxP89X1PeOR0vRCmcoBleJszrDm1+gi+O/9y
         rgiABGmyZ57Z7XBOoylsd+2VveP1A3YLzn7AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703092491; x=1703697291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHoyBRXbxJl/Fk8Fe3c346+q8RDAepu8NiFo0x6fhJ0=;
        b=W3uUpJH3FaNLRWXPRZhrGI5kruRy9EIqtDzEg7/TBo9abydWzOuk/ms3HA5ZE4rgTb
         QFv+UfWwX1zfx/HxP3B/d06JFuM0s75mTHRPGNpoN4DYaVfbVJ0ffiQ5AEy3ppX2ficE
         ABWLNNK690pGymnLjXpAmd+lVrIDAKNTm2zNvHrpEkmV9D3vhx3dLO++/PLytUzIBC9j
         CYZm10GCZqWBws1Rx4bPC8Yc1p7R3LlN5FC/0qXp092F74X1aSbcxCGdUORa+j+jwFIx
         AXTfzUPHYA/xbpjGiFp1/KlKf3TbK8qn8jAoO2K/YcVQDoTkbuv27Exe1Q3EYC1d47zG
         20ug==
X-Gm-Message-State: AOJu0Yxf/cGY9kPnRkgPvdiamPU7U4/Qp+ex8SXfYLhPrWSNxVS58fxW
	+cyoCQRhYkqyO0+Nlj1FECXoKmqeREDdosFLTM0=
X-Google-Smtp-Source: AGHT+IGRAMgCdG4L0aP219RsTczPXkgRF+jQWtr4HVkeakP8eTPoYJTansv0A2cLJ4AfITMamFMxwQ==
X-Received: by 2002:a05:600c:1e05:b0:40b:5e59:ccc8 with SMTP id ay5-20020a05600c1e0500b0040b5e59ccc8mr8386wmb.169.1703092490889;
        Wed, 20 Dec 2023 09:14:50 -0800 (PST)
Date: Wed, 20 Dec 2023 17:14:50 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xg: Reserialise CPU policies with the allocated
 number of leaves.
Message-ID: <8dc3efe1-9419-4fc6-8801-e56625cd0693@perard>
References: <20231212105717.6031-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212105717.6031-1-alejandro.vallejo@cloud.com>

On Tue, Dec 12, 2023 at 10:57:17AM +0000, Alejandro Vallejo wrote:
> The procedure used to customize the domain CPU policy is broken when
> toolstack tries to set leaves (with subleaves) that the hypervisor didn't
> need to serialise (i.e: because they where empty subleaves).
> 
> During typical domain creation xg does the following:
> 
>   1. Probe Xen for max #leaves that a policy may have
>   2. Allocate memory for that many leaves
>   3. Tell the hypervisor to dump the policy in the allocated buffer
>   4. Deserialise it
>   5. Modify it
>   6. Reserialise it
>   7. Send it back to Xen
> 
> The problem is that (3) overrides nr_leaves, which then makes (6) fail in
> the case where (5) has added subleaves that Xen understands but didn't need
> to serialize on (3).
> 
> The fix uses an opaque CPU policy object so we can (a) avoid probing Xen
> for sizes, and (b) trivially have knowledge of the actual size of the
> buffer.
> 
> While at it, fix xc_cpu_policy_destroy() to preserve errno accross free()
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

