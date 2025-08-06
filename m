Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69322B1C10B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 09:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071273.1434770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujYJ0-0006Ek-UF; Wed, 06 Aug 2025 07:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071273.1434770; Wed, 06 Aug 2025 07:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujYJ0-0006CK-RL; Wed, 06 Aug 2025 07:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1071273;
 Wed, 06 Aug 2025 07:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujYIz-0006CE-Pm
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 07:11:21 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d77d6f8-7294-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 09:11:20 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so30184995e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 00:11:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c4a2187sm22731661f8f.70.2025.08.06.00.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 00:11:19 -0700 (PDT)
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
X-Inumbo-ID: 8d77d6f8-7294-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754464280; x=1755069080; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BFLpsSSZOqguyhHuHmKlBEwcIt5R3RjMxXoUX7ZY3ks=;
        b=s0u+Zyf3yF4/wDXF1ffbLcjBDZj8GGsSpHNfgDPqlynRb95Pra+cooorL418epLOYd
         D/5/g3aCm8C6i6k9uivfr4AvYbk2N26DTZep08ssS69r6xmotfvXL0viKrTJfavAseSS
         Ee9dZhLkqdOrltDzDxE7A35xjP6yC+imJOhrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754464280; x=1755069080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFLpsSSZOqguyhHuHmKlBEwcIt5R3RjMxXoUX7ZY3ks=;
        b=J+b8VO/cuiPVHNYsZ43cZEXirH7VEOdwohLcsR2Y1k2kXe6Lv9lV1LxRIo7mRk/Vi5
         /Zk4bQTnasYrAnTZRL5l5Qf7uQgabRDczcCN59EsnCHhHIgtqe2WdwwHZIu2lRiTkO/4
         SnX0XeequqfTNg2TD1qzfRn8V5Jd/SKlQGOtAXG2NHVawXzbyTGBHes3HLb76tNhH6WG
         QYop0ahzEnOTRBs2703H40flvpbTHL1Fj/HCRwCh23NTkCfGqUEqEN7fhWfZ2/2AZkKr
         nHtabBk4T4LPlIwFpWmDUEcQ79UaZ7QIocXwHTYNKTqX3RjmPK+rtXJM+7zBERykVTnv
         PqoA==
X-Forwarded-Encrypted: i=1; AJvYcCX3D4IvObmzPiMHAhQzibmYn6EM35aKAMdmk+ERywSrXJvuf+2RrKWWE6OXOBBjVxcsmMgBMXyo7KU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzsv2dp7kqA9CPMaARb4DW1nc6sjHeXRc7cFjsFu4KvSq6K+AFh
	wrnCby2/ycvnPesozcVBA//s/wGAGvK9aFFZqelrOwAG3l/LoRHf5bsOhmsEP56DIAA=
X-Gm-Gg: ASbGncsBrTYbVNGBE4Jq8/12Ai16GXRDezBs4c0HHteLcu+igb+FlSTKogcFCOqFZBz
	0WMA3v1WwtI8wTw5uGKiwxx3dvntdzEoWP7jkelvS/59kxigPvRiu6FdiFKZSq9p4+po9kJ2D8o
	eG95DOtYEkHFHeBnqQfQFRioMK9Z97d9KRDC8tWBkT8SbiM7Ud8OXrAOScM0yrxq2YSFJMRMaQY
	6yioqPccyYfhLdggtmT62XixJ4aP3e2/NOlevccUk0eRjCCvsSwNMYZGeDswK23pTtse9WTzqd1
	umYg7Cl2ThHE3b+cXDRpgTFxaP2Sl5MDNTFbiklq0F0KyHCH8TvoEfkPZ5dKMksy9BFS17rt2rz
	+Wx1TRI4KOAD12X96766ONL1JVxQEHo+r5hKkkrHKTGSPIJe7HF1pKQrtcV/KUGTZpw==
X-Google-Smtp-Source: AGHT+IHzDXTHvBA8nfCVpsdsCYcz9wbqgIFHT3k4svieWHAITbVtmmQhf+IhGq43wjBV7QAtN/DU0A==
X-Received: by 2002:a05:600c:3556:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-459e70efe7amr13955805e9.19.1754464279796;
        Wed, 06 Aug 2025 00:11:19 -0700 (PDT)
Date: Wed, 6 Aug 2025 09:11:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: polish hvm_asid_init() a little
Message-ID: <aJMAFi6GO7Twh6Sk@macbook.local>
References: <ec351aea-e2a0-4335-b8ee-51c6eface104@suse.com>
 <b98abcdb-38ba-4176-8d6a-d4bc234b37ca@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b98abcdb-38ba-4176-8d6a-d4bc234b37ca@amd.com>

On Tue, Aug 05, 2025 at 11:30:58AM -0400, Jason Andryuk wrote:
> On 2025-08-04 11:41, Jan Beulich wrote:
> > While the logic there covers asymmetric cases, the resulting log
> > messages would likely raise more confusion than clarify anything. Split
> > the BSP action from the AP one, indicating the odd CPU in the AP log
> > message, thus avoiding the impression that global state would have
> > changed.
> > 
> > While there also
> > - move g_disabled into .data.ro_after_init; only the BSP will ever write
> >    to it,
> > - make the function's parameter unsigned; no negative values may be
> >    passed in. Also reflect this in svm_asid_init().
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

