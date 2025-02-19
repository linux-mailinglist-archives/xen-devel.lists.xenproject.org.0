Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23416A3BC03
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892632.1301598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhci-0000Kk-U3; Wed, 19 Feb 2025 10:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892632.1301598; Wed, 19 Feb 2025 10:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhci-0000HJ-QL; Wed, 19 Feb 2025 10:48:12 +0000
Received: by outflank-mailman (input) for mailman id 892632;
 Wed, 19 Feb 2025 10:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkhch-0000HD-S2
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:48:11 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02dfb1b6-eeaf-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 11:48:10 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43989226283so19386695e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:48:10 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43985c50397sm82351455e9.0.2025.02.19.02.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:48:09 -0800 (PST)
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
X-Inumbo-ID: 02dfb1b6-eeaf-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739962090; x=1740566890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LKywvfpKxZKTVA0ImP2+yx9rmxTOIhiPQY3hLyMHOCs=;
        b=QiCRVnzilOYfvB2Hogjp5/DjBXpSs6cMchVIrEDDr2MKY4tIDj8rlGH96MQktP7LIw
         Y8M59rgrTulsBHKygVNyeiv6ciLSt4dLVlVPhtsJD+OpCBOflVXBOKV2Ee9kEhBNs2Fn
         dGo/cs124UJ/WAS4l1390V11Yp2k4JuRklgRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739962090; x=1740566890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKywvfpKxZKTVA0ImP2+yx9rmxTOIhiPQY3hLyMHOCs=;
        b=nzPCZLCoOuE6HK57eAjKJrcRdgvezOjKTJKCwK8GYbnQFMdDFC8z+FeqAFsZr81d12
         625KEqHd1lCBy5dmK/Vr1zTTQP+dZwawun60lVJ+56p20TRBa6vGMQ0OhO/IML12gbQX
         bH3/BqRU8BQUBqn1PczOO1a0XbWKKLmKMNYGNkSsHV8pOZ/GdD8aJJhZ4MgYwTJLOEe4
         d8HpDhvVgskFlXi72T7QSv0URSYsZv5onrnwMwtGoM9ybCAjv19s99HZVPC//xGaIjmJ
         R2emVNzDpLhAeGdaaAoiEb5Xu8Em63fSnkVIlAE6BcADE3WW6v6CxNLAGKBZOEvcFra9
         LQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW56NMKwN6y+D+1dwFXRsE1piRVX+6ewhlSofw2xij/3hfjEBvm1EAY6DUxv43UJImYqPNSwbigleM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWn6MNEHRHZR0jbuCd9cwK9lmezLM7G1mnEa1dwg5w6PjzhVwI
	mXcRBWWfVsY5/xzbSNcSXyMpqKbU0CKHo73tOSl+Vb53GrN5tS5T4LKO61T0dh8ySp4KAxYb5Rs
	H
X-Gm-Gg: ASbGnctsuoPo9+pECjfFpGFIXw0Q2FPkCf9LwN4hZnsZEhk21cQWZQJjMv2DvvIeXz9
	GyVcckSjF6QhBV5oqcaEGcRN3atIHwSuOn5KJKGIbHCDV45wyWNoSIGNUILyotKeG3i26W7vDt3
	BeqrO3e9FOplcCuZX9TavyILXmpRI0NSK+MgsoHHw5GyPyMsjKzE24BSuBhSYa0xng2maEyi//p
	hH8k931izt/9A1Fiduh3wDGqOwpiUEU24yP+ewHGU/d2AtUvS1bVSzlACSrGBuVUjSjTpAJL7LX
	JSKpDs4M3xE6i9LkOcJGV2CPJ7CbnyaJdjcFghFWthKBJVoat/3V8Tc=
X-Google-Smtp-Source: AGHT+IHuB9xkhcBS7HUID4bDEz2dkc+2Q3ophf0fF1v6B2NhMeEFqQo0cH7AjrIo0MLv4r2HT36OaA==
X-Received: by 2002:adf:f102:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-38f33f4e29fmr13070568f8f.43.1739962090204;
        Wed, 19 Feb 2025 02:48:10 -0800 (PST)
Message-ID: <da9d1efc-eb9d-474c-9ca8-3845b41103a0@citrix.com>
Date: Wed, 19 Feb 2025 10:48:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: don't half-open-code SIF_PM_MASK
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <42688c2b-9f11-4c52-b83a-607374a858fd@suse.com>
 <dc14cb80-29db-47ca-b03c-e8fa370279d3@citrix.com>
 <4e8aa6cc-022d-4924-bb83-a52b2e96ac82@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4e8aa6cc-022d-4924-bb83-a52b2e96ac82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/02/2025 10:34 am, Jan Beulich wrote:
> On 19.02.2025 11:29, Andrew Cooper wrote:
>> On 19/02/2025 10:02 am, Jan Beulich wrote:
>>> Avoid using the same literal number (8) in two distinct places.
>> You say two places but this is only one hunk.  I presume you mean
>> SIF_PM_MASK as the other place.
> Indeed. Somewhere there needs to be a literal number. Just that it should
> be only one place rather than two. Obviously that other place isn't
> touched, and hence isn't visible in the patch itself.
>
>> In which case I'd suggest that this would be clearer if phrased as "Use
>> MASK_INTR() to avoid opencoding the literal 8."
> I've appended this to the sentence there was, i.e "..., using MASK_INTR()
> ...". To be honest, given the simplicity of the code change, I didn't
> think it would be necessary to also say this verbally.

Honestly, you saying "two distinct places" for a while made me think
you'd forgotten a hunk.  It took longer than I care to admin to realise
that the change was in fact correct as-is.

~Andrew

