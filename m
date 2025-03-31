Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290BA76BE6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 18:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932848.1334912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHwQ-0006Hc-9G; Mon, 31 Mar 2025 16:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932848.1334912; Mon, 31 Mar 2025 16:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHwQ-0006F7-5z; Mon, 31 Mar 2025 16:24:50 +0000
Received: by outflank-mailman (input) for mailman id 932848;
 Mon, 31 Mar 2025 16:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCWu=WS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzHwO-0006F1-NE
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 16:24:48 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a953d8e4-0e4c-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 18:24:47 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso31162755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 09:24:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0dcsm11764414f8f.64.2025.03.31.09.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 09:24:46 -0700 (PDT)
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
X-Inumbo-ID: a953d8e4-0e4c-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743438286; x=1744043086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXI52+uWTuMaUUw3LTSQ7AmoWQitPZmqz6YhSwfolXk=;
        b=kjuDBY73tv2fYTLyibN2tnLqOMuO8uBA7a+RByGyWVPQe3sbYv5mrLM/34j7igHv13
         Dl96FblLrRbOOn0+u4YWUfnb/yfCNUB95pGJf1KC1cy4Sq8mslK0tA+q/dWQLNCoi148
         y7Xr+Mb82SjUw2VkXfTTKF/XAImZod4t9ykng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743438286; x=1744043086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXI52+uWTuMaUUw3LTSQ7AmoWQitPZmqz6YhSwfolXk=;
        b=bAhOV+E9vCo9ywB1rTPPhTOzLwzJFNLXSGpPeqimKDzozk1J05wPe+4tglguDQL0Fy
         xBrm0DfEojkEbtiFgRBQzLBLVSoVDKX7Rw1XtLXwF4ClHOG/5G38KS1iOn7zmXKOTZiu
         q9tr3BaTt9kSBeAlI1LBLsAArryYMv4YcFC1ZkR0I5b6h02PDneCl7nmYEgnSda5JDAm
         zgmB1roykVkHPPhILX0K8hTiQtBaSSFOO0TJdHOAdH4Yx6cgubDBRs7eOAl+cGZ5W4GY
         f2z6u88/npfkropHZcurxpB9DFXA4y5TAdCO+iLbcEBrUgVShMDvR47jrz4awu73rQif
         tWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfgXozB77l8w/2ttYWXKM6wiya51t0VRnHJVEvKddAwJcOOxRBWD1XOnRSIdmtxLSTLRXrHve/3tE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJb7sou/xKDz+pI5DGF1hJ0fE1iDcX+BBG665KngyCy7CeCDlz
	vOzlxGbNhvg6ir27f8aduKyKIqQ0cEvr9ffCknIXw5oIfNmohcXFW2deA6CMwAk=
X-Gm-Gg: ASbGncuF0tIscHbgsmqappUBZ9y7cD8neanVM86+PzyF4ppTH0YKpJSDxIQoCqJaJKX
	Ql0YY+Gp3S1bVTROPGc4+4yiwJ8BYml72GX2Kv3gAbfUy2KA4Ik+O8WW7vgYzfefcZSwbIE5iu+
	n+x06PkBwlnGNm4mEt0+mVItpI6mytGh6STB5yUxjhmm0GxREPQtSsnBxVZdJO4HEb/wz7iGU7d
	twISxd2BzuxEk+xuHcG8sNlZwa03ANG+UORUbe6NzaJqPvqKefn/UjGQVJB3u+Ub2JxDLUr8C5B
	Mt63kyFTi3ehS3frQ3agen7OfZ0ReibYpdeVqpaTMq6MNWl68P1UPmcVEBV+FmP0ZFdKrAGOw8q
	B9/picbNAqE1Q/Zvbhi9G
X-Google-Smtp-Source: AGHT+IEaEh0Vq8VodmxuE7Ns+rg1Ofx+pmEExQHHeEwUqkQLz1Lpe4Cq1H50W30g3qk5iKCrUTbaJw==
X-Received: by 2002:a05:6000:40e1:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39c12119dd8mr7462079f8f.52.1743438286535;
        Mon, 31 Mar 2025 09:24:46 -0700 (PDT)
Message-ID: <004b7ec8-95d4-4f9b-af1e-8011748d5a5a@citrix.com>
Date: Mon, 31 Mar 2025 17:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: make test harness build again as 32-bit binary
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <569f350e-21bc-4fd3-8bba-991d6c34d08a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <569f350e-21bc-4fd3-8bba-991d6c34d08a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 4:55 pm, Jan Beulich wrote:
> Adding Q suffixes to FXSAVE/FXRSTOR did break the 32-bit build. Don't go
> back though, as the hand-coded 0x48 there weren't quite right either for
> the 32-bit case (they might well cause confusion when looking at the
> disassembly). Instead arrange for the compiler to DCE respective asm()-s,
> by short-circuiting REX_* to zero.
>
> Fixes: 5a33ea2800c1 ("x86emul: drop open-coding of REX.W prefixes")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

