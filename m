Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF59AB65F3
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 10:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984062.1370224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF7Tb-0001rM-P5; Wed, 14 May 2025 08:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984062.1370224; Wed, 14 May 2025 08:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF7Tb-0001or-Lk; Wed, 14 May 2025 08:28:31 +0000
Received: by outflank-mailman (input) for mailman id 984062;
 Wed, 14 May 2025 08:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uF7TZ-0001oa-UJ
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 08:28:29 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65e9b29f-309d-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 10:28:23 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22e033a3a07so72241045ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 01:28:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc82a4cecsm93382525ad.238.2025.05.14.01.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 01:28:21 -0700 (PDT)
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
X-Inumbo-ID: 65e9b29f-309d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747211302; x=1747816102; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6hXb6nZTewSpDRaehqeYINgtvWu4WtI2dXs2UdVQZo=;
        b=P+ZLpFFvhqgi7+EIUbbYuei6qG+JxL44eaa8L2X+X9PW+j+ZZBC3xxer6pwxQazHaj
         cw6y49uyhyDXAOv2O1aqvACYHDNtgyKISrsUW8/BgoLdkIhNlr6ZO+c5+mS/2beIkrWi
         SCMQHFFrdA36xEIyU/BH8fJ2yiLEuDaZawDPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211302; x=1747816102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6hXb6nZTewSpDRaehqeYINgtvWu4WtI2dXs2UdVQZo=;
        b=NDIOs7psoGpPC8PV9tEeLQKRpFP4iqgCGtgTaXgEX53l+Dleb1f9NZpujHt8m6DuUk
         6Aco6wI27bBErDUXczOn1E5KPWbmBT64hVxC7ADQFuDZyCR17C3e5uVhSL1vjpW1HsHj
         fjliqxexHvhu/oS+SVySpy834vNBs7PS3GB/O/z6KwCNI5LPstONnKF0QkTTSUoE1gp2
         JS2AsH+hH8uVsP5LUzHC+S4Wu6c93L5Xvu3xvGv6fFGHhOQRHvNzKn+ISD5HX4hnafoe
         cXS/Ae2FxD16Vg6gsryKXnYNEsrj49sdCxiE8SuEuEjdD+5co9/3FH/e1wOsZaCq8S6p
         G22g==
X-Gm-Message-State: AOJu0YzxYJxm81obzirb7ZbmCEs2p66CdVOepAVTTpl+nzHwuNpyZq/p
	nVXCSdOR9PvN8xZwqMKglqn0HPjSUIihxAIHn1FoAnFpL8+awctMMTGuXlHCQt0=
X-Gm-Gg: ASbGncu1QSDWPyBVqE1FAwEljrcqyPTWNlQykq9tNGByJZkXNkcfi5UezFyBKg2Lw2+
	2H36sIYT5w6MLliqCSDGEKDObpTUX/6L10riWbRcrnPGr2hSAHp9z6yVhsrl86sS6rPV9WSVlHm
	l0T9Imn6vR63pk/nVXr4t+umYlUTaw+VF1KsVEOCAfKjJqkzKyIhmRFP5rdLSjcu6KMV+PKV9Gy
	7mPEk9DWb22OmaQ/ijGYhiPG5yuRD6BOjle5FtVL/TPFtn8zCsA6wKvQ1aRYqBrRO0UYxlanOHb
	28ebrnU3fhBWVmMU4l6KR/Qa5+dE91HJMBGvkS9Wk2vLRoUFeKca2KK+Uo1IoxQCMFQ=
X-Google-Smtp-Source: AGHT+IHDjvIlmPOt+Z7lHj5X4OY/y+be8tbv6JpXFsfaSKCN2hA4sXUUvbZpgnSwdprAAz2qHkI17A==
X-Received: by 2002:a17:903:166e:b0:22e:566f:bca7 with SMTP id d9443c01a7336-231980e4093mr34543545ad.17.1747211301956;
        Wed, 14 May 2025 01:28:21 -0700 (PDT)
Date: Wed, 14 May 2025 10:28:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/IRQ: constrain creator-domain-ID assertion
Message-ID: <aCRUIMtzC_7FlTDn@macbook.lan>
References: <9fc0b9d1-15e5-47e9-a532-a25e1ac32ba2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fc0b9d1-15e5-47e9-a532-a25e1ac32ba2@suse.com>

On Wed, May 14, 2025 at 09:22:54AM +0200, Jan Beulich wrote:
> If init_one_irq_desc() fails, ->arch.creator_domid won't be set to the
> expected value, and hence the assertion may trigger. Limit it to just
> the success case of that function call.
> 
> Fixes: 92d9101eab ("x86: allow stubdom access to irq created for msi")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Hm, the logic in that function is convoluted to say the least.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

