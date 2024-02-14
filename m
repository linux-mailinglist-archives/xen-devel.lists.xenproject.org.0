Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEAB854B0E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680813.1058955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFt3-0006u9-2N; Wed, 14 Feb 2024 14:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680813.1058955; Wed, 14 Feb 2024 14:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFt2-0006rj-Vu; Wed, 14 Feb 2024 14:05:20 +0000
Received: by outflank-mailman (input) for mailman id 680813;
 Wed, 14 Feb 2024 14:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raFt1-0006rZ-NF
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:05:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1511a45a-cb42-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:05:17 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso492935f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:05:17 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 od9-20020a0562142f0900b0068c9d0561d1sm2291587qvb.83.2024.02.14.06.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 06:05:16 -0800 (PST)
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
X-Inumbo-ID: 1511a45a-cb42-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707919517; x=1708524317; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgXaN7odOXC9XR/4OcmjtChcknL7ns+w+h62EojdQ10=;
        b=QMW8tbhRiMYtmo79dFyWWlmFvpsxA7f401p2HEeh5MUdGvNE7T1aucLT5EXTzrYtZg
         C2xVMk0yjiTIh0XVKj4MMETqUFH5oPrcDnf+LCRJgUwMzjO3MYErxSFPYERDcVMf7MtM
         f1kCdacuMPiFB8SFJ7GqsmmSMtllXsJs/dOVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919517; x=1708524317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgXaN7odOXC9XR/4OcmjtChcknL7ns+w+h62EojdQ10=;
        b=srDLQNNKvyw58ELaminWBUdLiXKmP8IWqUKm7o+fYYXzWpudVg0h0D8TErYXejBao5
         6cNPncA+MQd0vYVFaqvME9yjfULDQVTkbnlBbWKqB9r7Sr/Mk6iH23/5g+8to0hlCBJR
         iYV8dzRrHU9kqVSSxf7/JcWv9I+CBap7TdKd05UkXYjWjHLueJ5idv6QCBWyR9RPARuO
         cmr6PEpIwEljP6XYXKcUiGVSn+MkwUx2+73g5JQCNG4o3leOo5MdRDB6JKo+bcavQubJ
         i4Zc35ERGu//x3V9vuzbYc18Jnid/lmxUouDFJPuzzaYqDIU1LE8U3LGihMFmr1ITqv+
         Sp1A==
X-Forwarded-Encrypted: i=1; AJvYcCWBGg2DWW92wm6UIEwgZOBnPG6i8CtPI/Zl7OV23hH3nh8pvv7G6Bk7GGMSRb+7wUsvxJiXVDnlirVYJJwTgOzCQisNAFJZXw9V50L2px0=
X-Gm-Message-State: AOJu0Yznp0pdWXxwHwl4LbsabMh/fKEWNTMnUqKx1q6G93nOqAm3dsLs
	btZoVWGxgAI/lcFzikYGedKZdSknrNT76Y3AzfGIvJl+x77roSdVCeEpiz7s8Gk=
X-Google-Smtp-Source: AGHT+IFfhnBW5Cv3eeME0Tt2w1udCJ0ptH2yzKhV56dZwsR8vCb38gLXD2z+JGwZLYIXAfw/MqvRmg==
X-Received: by 2002:adf:e9c4:0:b0:33c:ddf1:4e70 with SMTP id l4-20020adfe9c4000000b0033cddf14e70mr2269967wrn.32.1707919517233;
        Wed, 14 Feb 2024 06:05:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfWNz7jxTVb6OdCztegW9/VSpPzCjU7AD9ZQCvOTqYejcUTOFTQVy+3oTmyfkajgOS44SbIMIOouqpffVJgUhhCKXvpW2WkkdyOQel9NZK1B65GgK1J41BMF4VCNpevapAnfzo2TmDmQQ=
Date: Wed, 14 Feb 2024 15:05:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] iommu/x86: use full addresses internally for the
 IVMD/RMRR range checks
Message-ID: <ZczIm37J3WBQPYsx@macbook>
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-4-roger.pau@citrix.com>
 <16de2e3e-7807-4754-852b-e486c1fde95c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16de2e3e-7807-4754-852b-e486c1fde95c@suse.com>

On Wed, Feb 14, 2024 at 02:29:35PM +0100, Jan Beulich wrote:
> On 14.02.2024 11:37, Roger Pau Monne wrote:
> > Adjust the code in the checker to use full addresses rather than frame numbers,
> > as it's only page_get_ram_type() that requires an mfn parameter.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In this very shape I'd like to leave this to Paul or Andrew: I'm not outright
> opposed, but I think this either goes too far (most type-safety being lost
> again), or not far enough (both callers convert addresses to MFNs, just for
> them to be converted back here).

I don't have a strong opinion, given this would you like me to adjust
4/5 so it can applied without this patch?

Thanks, Roger.

