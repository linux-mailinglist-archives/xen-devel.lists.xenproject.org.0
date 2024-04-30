Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8609A8B7900
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714927.1116311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oLd-0005XX-Ok; Tue, 30 Apr 2024 14:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714927.1116311; Tue, 30 Apr 2024 14:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oLd-0005V2-LV; Tue, 30 Apr 2024 14:20:45 +0000
Received: by outflank-mailman (input) for mailman id 714927;
 Tue, 30 Apr 2024 14:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iw5h=MD=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s1oLb-0005Uw-Mo
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:20:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c1b96e-06fc-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:20:42 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34d99ec52e1so353331f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 07:20:42 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h1-20020a5d5481000000b003437a76565asm32056020wrv.25.2024.04.30.07.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:20:41 -0700 (PDT)
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
X-Inumbo-ID: d3c1b96e-06fc-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714486842; x=1715091642; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff9p7i7ekksVza3WUv0i733kO6a0nTJj5wfu3fPRHrs=;
        b=EwEFcQAXzve34GwBUh2839YAKD/+6wI+DWZxdZqk6Rjo/u++fxAKqqsV4qJC48crV1
         x68LqB41j3WzdVRQxZwkihXfssjuMTVfa//H6TJr8GZG1T2YUQs8JjvYv8GqxXhttdr0
         PjVwXaEolcRWW6BwNQ/hM/43cwb45tND2XSoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486842; x=1715091642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff9p7i7ekksVza3WUv0i733kO6a0nTJj5wfu3fPRHrs=;
        b=lDToYfqyNAXrgMHCohIxI0bVH/Pfg1f8vnEQmew2idG0pLlHTOAjgqCoY62l9J5V2z
         pHWENdigUI20E9yrrC6xKLWu0e/pGD6obCa9i2YF0wx9OnSg4kgL1Q2VPxM/f3Om8ifm
         TfPmZg+Xt/EfvjcuW/yBBHxO6+H9PFQbl219gRAEn3O/xsFeObkDqdf8KxmdPAvwW18q
         Wws+C7Frcnj/Witq9nduy9Y/xNIep0De8K0tjVfgF0MX8yfZpkxchk5TD8Zw84vkVJ7N
         nsRdIHVawMw38teWIJrDDbpKEHXmNzEIhbGge2tuhy5g0sSCPyP9eyxaQ1Hu9fEcdj3D
         Y39Q==
X-Gm-Message-State: AOJu0YyfE2DJA7JXKspbLtrWiDtb0FBDyoKkwGZfGr019LzNVY1WvSnI
	7WkZ2L9pFtIpEi4gL32ysSFW3GgriUvCXY5yY810vcrcaCallUqtElDFO+aoHB8=
X-Google-Smtp-Source: AGHT+IH8QnVAt6qkdwKJg4z9+knWCm1dXAVbZXDkKFOTQ9Ohb89yP4fjw/BFP6nnIPl8aIANVdRghA==
X-Received: by 2002:a5d:56c9:0:b0:34d:2447:9f8f with SMTP id m9-20020a5d56c9000000b0034d24479f8fmr2190548wrw.5.1714486842203;
        Tue, 30 Apr 2024 07:20:42 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:20:41 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] tools/xg: Streamline cpu policy
 serialise/deserialise calls
Message-ID: <b60157b3-2633-46a0-ba7c-a7b589716e41@perard>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
 <20240207173957.19811-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207173957.19811-3-alejandro.vallejo@cloud.com>

On Wed, Feb 07, 2024 at 05:39:56PM +0000, Alejandro Vallejo wrote:
> The idea is to use xc_cpu_policy_t as a single object containing both the
> serialised and deserialised forms of the policy. Note that we need lengths
> for the arrays, as the serialised policies may be shorter than the array
> capacities.
> 
> * Add the serialised lengths to the struct so we can distinguish
>   between length and capacity of the serialisation buffers.
> * Remove explicit buffer+lengths in serialise/deserialise calls
>   and use the internal buffer inside xc_cpu_policy_t instead.
> * Refactor everything to use the new serialisation functions.
> * Remove redundant serialization calls and avoid allocating dynamic
>   memory aside from the policy objects in xen-cpuid. Also minor cleanup
>   in the policy print call sites.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

The patch looks fine beside xen-cpuid.c which might need to tweaked due
to change needed in the first patch.

Thanks,

-- 
Anthony PERARD

