Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48F88B68CB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 05:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714475.1115725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1eDg-0004aw-Ku; Tue, 30 Apr 2024 03:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714475.1115725; Tue, 30 Apr 2024 03:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1eDg-0004Yr-Gc; Tue, 30 Apr 2024 03:31:52 +0000
Received: by outflank-mailman (input) for mailman id 714475;
 Tue, 30 Apr 2024 03:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOZU=MD=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1s1eDe-0004Yl-NO
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 03:31:50 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb1219d-06a2-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 05:31:48 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6eced6fd98aso4672716b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 20:31:48 -0700 (PDT)
Received: from localhost ([122.172.87.52]) by smtp.gmail.com with ESMTPSA id
 fj40-20020a056a003a2800b006f3021367desm13396211pfb.197.2024.04.29.20.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 20:31:45 -0700 (PDT)
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
X-Inumbo-ID: 2cb1219d-06a2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714447907; x=1715052707; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DctXP/XyyqQld/Ca/nMKTxAKdgnxxebvNJbPi5up/RE=;
        b=aLQKVlGaboyhwUVmaC7E/38sWKyPtZq4ZXR86jE8SPcs7T95hRGukj3Pc6xbU4iIUy
         +l16nfy7efWdIiO9HpGA+uY4+Ms7c5sap+kTNHNpZTL79HA4PpLJkbU+LGzJ1YJUWDkK
         LjqnapdFrVVXYFJnrTHU43MAQMqHt8J3fm37ZqLeQGgi3TPzbbyF2gU+TG8pCpHxCeXK
         YDnaZkU/TqodbNo3jXEQJNXNQgw5vhkJQS5NNp8M9VLklFAoT8AofYDkp+gXZ8hUFFXR
         yhASDgCZ05NxQooeHQPBQON67J+xy1pc542HuRR8khCEVmkm2zJMTj4l/DDegtXH3oh9
         PpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447907; x=1715052707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DctXP/XyyqQld/Ca/nMKTxAKdgnxxebvNJbPi5up/RE=;
        b=bo65tZfnFJ7MWGx9LxtnMFq+cfwmKwRg9MGJEi8nhQOHUx76rvzLLeXLPW3L2iwD+R
         7nvtDhFkHlrPrcdIaL3o5pS89M3yPCrzwG1P4CXwfOOWR6FN7UTsdoi9Mm0mEaP+dHgL
         Nni+JMvvvrp+EO/EgCU82BaSKT81HG7Q+RKD9KcDHCQ4dg+UqOJPA5OBQaQt7pThf5Hv
         6K+2wxP2WBDo1ScB6pyrzI6VT9mc1Jo9guenWb3QuakvAmJUNq7jMWIQznrE576RVrtp
         BrTFPqCwQ7SsEvoiQnepPDGbeLAMMHf88ZPrePVE10AgLaYqmMyWL9ZoiR8HTzqJ0dWk
         SbtA==
X-Forwarded-Encrypted: i=1; AJvYcCXFX30tpptrq5lzTA1v0mfNUhnM/2BjOCnT0tzi3Uu3mGCbTEg2Wg/taBAgkH96DLsXEYKmURa/Prt+avdPelv+p0c3ia8g1JTCwrg+Zac=
X-Gm-Message-State: AOJu0YxnIJWIllZciWOpaiZmpsLkkC1Y2uFII7XF/IHdHIljV7GajyTl
	wmiAPRILgYIcZSCAGJiknVphO9oe8xs98FQQr5EbEAoTdLzUWu7LaW2Ujo3QLP8=
X-Google-Smtp-Source: AGHT+IH6s691kJ8D1SNXDOJLV0swLHmXimVxJkyNiUtylDQmExHr6h9JvGRdXz2G2bcwQ+je4YUh8A==
X-Received: by 2002:a05:6a00:1413:b0:6ec:db05:36d2 with SMTP id l19-20020a056a00141300b006ecdb0536d2mr16789338pfu.4.1714447906591;
        Mon, 29 Apr 2024 20:31:46 -0700 (PDT)
Date: Tue, 30 Apr 2024 09:01:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>,
	Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Bertrand.Marquis@arm.com, michal.orzel@amd.com,
	Artem_Mygaiev@epam.com, Edgar.Iglesias@amd.com
Subject: Re: [VirtIO] Support for various devices in Xen
Message-ID: <20240430033141.h42alodicujup43s@vireshk-i7>
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
 <ZaCOVSuEJtsAj9G5@amd.com>
 <5fb49c84-0f54-49a5-9106-7f207b3eee4c@oss.nxp.com>
 <alpine.DEB.2.22.394.2404111446490.997881@ubuntu-linux-20-04-desktop>
 <CAJy5ezqVL0d_U-QbTw0hdGASCv=OcwZ1QnBAPcGDnXD_ssaQBQ@mail.gmail.com>
 <5bea35a1-8521-4527-844e-ff4c6a57fa41@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bea35a1-8521-4527-844e-ff4c6a57fa41@oss.nxp.com>

On 30-04-24, 03:11, Andrei Cherechesu wrote:
> Are there any other virtio device types you managed to test so far
> besides these ones (over virtio-mmio/virtio-grant)? Has anyone
> tested the rust-vmm vhost-device backends from Viresh with Xen?

I have tested them earlier with Xen emulated with the help of Qemu.
Steps are mentioned here:

https://github.com/vireshk/xen-vhost-frontend

-- 
viresh

