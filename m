Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E608AACB826
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003616.1383197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7D1-0004fg-1K; Mon, 02 Jun 2025 15:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003616.1383197; Mon, 02 Jun 2025 15:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7D0-0004dC-U5; Mon, 02 Jun 2025 15:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1003616;
 Mon, 02 Jun 2025 15:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM7Cz-0004d6-6Z
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:36:17 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 524226e5-3fc7-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 17:36:16 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so22587545e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:36:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa21e4sm130240605e9.11.2025.06.02.08.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 08:36:15 -0700 (PDT)
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
X-Inumbo-ID: 524226e5-3fc7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748878575; x=1749483375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t15U6LjHDsrC5DALlzvuI3GFzEPy6/MnV+dmHacy8Ww=;
        b=kB29ffzDYEQl7qV7Vc+6kyHovtbxeqxntUHNF97aKi0BzYzQuP3QrWwgizaFLtja0C
         PmkH84qIeuzm1ctkLYPycUehY8SwNSVkiM2bdcD/nbSsTue2xJVBgbHYqk3Tq8V58T5R
         Htr30RPcxpfF2aAjeyXgWpEiHQnwKUYNRukzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878575; x=1749483375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t15U6LjHDsrC5DALlzvuI3GFzEPy6/MnV+dmHacy8Ww=;
        b=hbTqkkkTb5pOzNBHOo+aRvdr93qNspxKIIScBGMDo/lzHss2i7p1w4cODTydFzTw8T
         gdmDIUtbopug/ny3oj01W6HqxW5dp+XGAmPliIAw1/yeErgtntH9lEnYjIm1fEWgYMEp
         n1Pbk/EJ/WwAUlfjp0b52B9VMtr+AqZbvnoF1v81msIMBHMXFoNM2ziTcM4e7e5dex+1
         Xl12gPBjndWH08Yu6kq0UoYdGfx/wDPNNLX5xjRKznaiXIABjcFRbYKkjHwwzJAlaVTb
         WXeeJVOYoVfzyxA1tW7+Rh60sTY8PDeI8HdTDwU0FhhOadcTfViYsKZa02ZxMyDFGw/d
         Cqwg==
X-Forwarded-Encrypted: i=1; AJvYcCWB5l9C/AS0xeBbJAQ5r/NAmMudCWcQv96tWF7gDtxgUVRnGYrMEYfSYocDsQ1du8YYELI6ZRGr7QA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDsp0o+r+9V3CHblyOzfg6p6jT0jSrNxSXFOBTPGXsw2ewg+Ic
	bFUGQFAhmXktAgEOxmA7+PT4zDCsJmkhgX32askBCekBmHy2HUYEB0KN7B04cN91SVY=
X-Gm-Gg: ASbGncs9ksuwEBov0Du3XOImbJIriFMGOEozIeHBXi623L6x+X3HMlTgfuu4LrKEArR
	OjFS8Qq38qJJjJX9GjZ2G+2WUpn3fsLN9MRiwKTHIWGbEU+M7jl4YcoMIqMEfgGMlpHbuFjwNqa
	pj63FRJIKzB2eS5i8PpQT/lyd0O3vUoJbA0X8YYd1EiUJZs3UA2alcBl3IiIdc+tW87ZXPe2Nl8
	fvFFthsyd6uy+TxKYsbTf1N/D81gfetIlJaUwNnP5ijkORK2VWpdeV1WGBUNstMwAra84rfd2P5
	lwOp/PPyBGfUizUPnBw9i1l3TaBHtW/MWc3hHy+LFF4CI0ebmFzRAtkLiY8SkxlsLMCfqGwqYRC
	yj05dquPOHSnkWww9/gB6vkPmSgg=
X-Google-Smtp-Source: AGHT+IExzrvBXDMdr+vNPnjm45bvzoALfRL9vYd6djqClX+bzAnVJc15sQqZHM4DxKDAWhn6i4rCTw==
X-Received: by 2002:a05:600c:34c4:b0:450:d570:e0ee with SMTP id 5b1f17b1804b1-450d880ca1emr142851815e9.10.1748878575488;
        Mon, 02 Jun 2025 08:36:15 -0700 (PDT)
Message-ID: <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
Date: Mon, 2 Jun 2025 16:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250602150929.10679-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250602150929.10679-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 4:09 pm, Michal Orzel wrote:
> These tests are supposed to run on target. HOSTCC can be different than
> CC (when cross-compiling). At the moment, tests installation would put
> a binary of a wrong format in the destdir.
>
> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Oh.  This didn't explode in GitlabCI because there's no ARM version of
*-tools-tests-*.

Can we fix that too please, seeing as there is a real ARM board?

Also, I guess we have to finally sort out the CC vs HOSTCC debate.

~Andrew

