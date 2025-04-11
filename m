Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF183A85C62
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947271.1344936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3D3S-0006pg-12; Fri, 11 Apr 2025 12:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947271.1344936; Fri, 11 Apr 2025 12:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3D3R-0006mp-UR; Fri, 11 Apr 2025 12:00:17 +0000
Received: by outflank-mailman (input) for mailman id 947271;
 Fri, 11 Apr 2025 12:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3D3Q-0006mf-Hb
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:00:16 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86cbe52d-16cc-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 14:00:14 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso1155660f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 05:00:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eadda64ecsm1858308f8f.0.2025.04.11.05.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 05:00:13 -0700 (PDT)
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
X-Inumbo-ID: 86cbe52d-16cc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744372813; x=1744977613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9awOeHDJOgaIAqxhz4Ul2gDNeNptQLmva34anEfcdq8=;
        b=XO5Mtrn21Vmz/B5TPIpWvggLwfqa9EVR1EcW6htrPdFiACB1j6MkxytK2qyy20pifC
         /N+3nyuIkXj+BVqAu7SwgPqQcSPAt0xXIJ9i4E+Nk0h3vTxiA1G/zf0I6nGxWrVrxSJU
         oFucvUsfqF1eVmsC4pZ4fC7dVzwPYDv+FY6B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372813; x=1744977613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9awOeHDJOgaIAqxhz4Ul2gDNeNptQLmva34anEfcdq8=;
        b=piBuf2/mKVhhE1RtMMB1N5OxVJmiMf2sfsTS7cJ8rdrtrw6zFh5SNXChD5odW9xPuZ
         1taGSj3jEonpeDAdzXZe3YB4tP3Y0Vzy5DFMWFpsNvwjPU14tBEWj5yWpnlSn2jeIzM6
         TICZt0y97AmZ3h5gMEl3fEGmAkKOOD0CeHw9ugEjAskuzCh8+J6oJYw6u2ng/XdK1ru+
         3wHiUO0jRPLFnd+xlWW7c85Z5gVW94nRdtERGQaFQHyTLuCsaUM6T2A+i1gwc8aXt62F
         d12y7FNvpG/CRSQWaj/Ek4fCCjsN2fA6Xq46YNyiKlMGAGCZxJtUeCJ48RoVtYmKJ7O9
         2b5w==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9+B76qQtwbC/8aMLpfX+EMXuRVReWQ5yWEHkme/akmfIxOLXqlXgbcvnN1cj97zuEP0mLTaSq18=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8cEvNEo3G+M9OHT445Ryh92iVtw9sA749Gdlil+uj6EU08BGr
	s+Q/8jY33YB6EPF1EqOBFP+alZxAs5BNBuepuFRG58g42akw/h+8yIEgetmaxk0=
X-Gm-Gg: ASbGncsOGBV096HvFxILbSfKTID58b7d6lwwjHg6hHOE3CPUIjRmsXL37PwHuiB4KNy
	Foo3DuUkluSVwhDzbX/LUp+rxFF5arRzcQSfZIK5n8KH8+NtCaZL8Ey2fntj4/yinTAb8iH0op5
	OV1X+IHzC+o4uS1HmQIrSOmStls+Iq3j89lmnx6+jXyo3VPXwj/3/cL62xiS6ytiwpUKdJRY/Pz
	7qcb+coerqRkMCkoJnY5RqMUcFS8eCGR5I0RtNlYo9yo6lLYCb/Hz+6PU2XvSCEWR4Pi3y6ZitN
	q/q8XQTGii5deS+QQ3y5AMf6KJ+a9xbPEF/CVQ/dDVVvTEj/+X6TSY19H2f3BSSHQsjwdtlZKF9
	/iHynOQ==
X-Google-Smtp-Source: AGHT+IEG5ALbMQp5KOpJ+zeuoMOrNKvmdTmYKIHSROJPnXzglIjgx2Rm7Sk0luerudHPGcmdKVQcRQ==
X-Received: by 2002:a5d:64e3:0:b0:39c:1a86:e473 with SMTP id ffacd0b85a97d-39eaaecbde2mr2109364f8f.56.1744372813449;
        Fri, 11 Apr 2025 05:00:13 -0700 (PDT)
Message-ID: <8a921cc0-8ff1-4191-89a1-442c7d303d2e@citrix.com>
Date: Fri, 11 Apr 2025 13:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/mm: account for the offset when performing
 subpage r/o MMIO access
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250411105411.22334-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 11:54 am, Roger Pau Monne wrote:
> The current logic in subpage_mmio_write_emulate() doesn't take into account
> the page offset, and always performs the writes at offset 0 (start of the
> page).
>
> Fix this by accounting for the offset before performing the write.
>
> Fixes: 8847d6e23f97 ('x86/mm: add API for marking only part of a MMIO page read only')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

