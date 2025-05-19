Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB686ABB51A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989517.1373534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGu15-0002GO-St; Mon, 19 May 2025 06:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989517.1373534; Mon, 19 May 2025 06:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGu15-0002Eu-P0; Mon, 19 May 2025 06:30:27 +0000
Received: by outflank-mailman (input) for mailman id 989517;
 Mon, 19 May 2025 06:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGu13-0002Eo-Q8
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:30:25 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bef46651-347a-11f0-9eb8-5ba50f476ded;
 Mon, 19 May 2025 08:30:24 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601d10de7e1so1408938a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 23:30:24 -0700 (PDT)
Received: from [192.168.61.201] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ea8aesm543602866b.179.2025.05.18.23.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 23:30:23 -0700 (PDT)
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
X-Inumbo-ID: bef46651-347a-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747636224; x=1748241024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeQJ6IFBKtNjAc0HEkaLLlZ44u2eux9Uo/jLFOFCqeY=;
        b=CV/K6LrauN9wga2KzJxqvbECX2IudBqQl4Dr3qN0gR3yYYLLTh4dIMkVSDt7DPcAhQ
         n6o1twF2aSgEcoRbd6O/p+nFTtM9BDJbHZVjysSDBMZGfUpMi8LgfVw6GLR0JHwgoiBM
         +SXPWrQCt/HWFAnkyoX1tRAh1lD0RszvcTPEbM8LcZdYmSCVZKDbl++23M1STWFIRoDJ
         EVESPM172cQGqxbdiSVyvYeLaJStCQyu21QcUixS0T6zZlYuSWkqT0NnwZdJnrBzP8Of
         61oUSXD5/MarvZDI6SzD1S3yjjf2al0e6bQvLXS0F8IlW6zjvsubwYnRE3gxCkri+9d7
         5YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747636224; x=1748241024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeQJ6IFBKtNjAc0HEkaLLlZ44u2eux9Uo/jLFOFCqeY=;
        b=eJa8FCyt1Ns+MdFh+WeFL68tu687lrtUhG2l16pSaEhTrHA/CAnJ1oV0aUAWgESW0y
         rrOmD3Q8L0K9lydBChRz6qeWHX0DADMAMw/v2liiq0hdiHKnWTtzaqyXgxrQzUu92vgO
         O1lkVHOFvUx2AfwwBcRm89uTVj6fJqa99Pc+N8onw5ryvarC7R+McXJFfyCEsoKIVlGk
         rexhMgyreoFXFYQdWQv0eH94Bshkzs0JUgfSJGvlj9kxv1aNoNqwY/KuZANnV4TL6R7d
         HitajVwUX2m52RlIvLkg4ACDSKAP0UIJpeeMH0xJPwca4dUw+/TU7XIMwchA727lZkOA
         rbcA==
X-Forwarded-Encrypted: i=1; AJvYcCWKzkX2EfAaLVINbB/XHzWMUTaFoPW+fC7j9QpFjEgxCc1N5OutK6z6kldDvpAWkkepAle6wsZfNFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN1fgp5l1fMj3QicAFNqhma7kbLBn85MKWuVy6mhZxutfC18sF
	lnBIx5VbH77q9MrLfYON2dJ+dML6VHtFSknQOF/egE51xKAGDu08gbT3fa+a759oajjOHilSTnD
	kR3JEqA==
X-Gm-Gg: ASbGncsFfyRnhaTtKyuWYS1zugZsrop5G6xm2gQ0UFw6bHdMXiGinl4XUb1vTNiUT+0
	SlD186OQj/7IlnYP2oo968EbPRreUCqyu7wrv6IUwJG2mJFqYxcPhb2BQOpRbAWFHkWtD3A6bHb
	fB/hXcH/Ym6cB6++jDk3FN8rTKspOzqT/ihoefAjWGwrnFXGvDjoE9Pp2U+0y1XkftlbuAlpsjr
	ne9pzAwUeuaiUAEsOLRETf2HGoFELFphsPO2pG/s1FUJn0Ugi/OE8k0PSbXAQopp0O4xir1Dbhv
	4jWXd0Am3r4SI/v7WUIOa4ywKm/KpQbISd75MzEKdt181wsIWXTfBt1TPzLpHe2A2niyduqC+Pn
	LpWLXyybKKw==
X-Google-Smtp-Source: AGHT+IH1aCS0MUgER9AE6jGST8Lpa+A0pq9OsFfrLHAIQV8PKbxUQeoPXMPW0NKyfMdq0HRtLkOjrg==
X-Received: by 2002:a17:907:3e16:b0:ad4:f512:733 with SMTP id a640c23a62f3a-ad536dce6e4mr1085821366b.45.1747636223742;
        Sun, 18 May 2025 23:30:23 -0700 (PDT)
Message-ID: <7129d506-b03a-4f89-8128-84b8befe8799@suse.com>
Date: Mon, 19 May 2025 08:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] vpci: Refactor vpci_remove_register to remove
 matched registers
To: Jiqian Chen <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-8-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-8-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> vpci_remove_register() only supports removing a register in a time,
> but the follow-on changes need to remove all registers within a range.
> So, refactor it to support removing all matched registers in a calling
> time.

Generally I'm a little wary of changing behavior for existing callers,
but I guess Roger already did signal he's okay taking that route?

Jan

