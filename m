Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4577F5B2E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639474.996893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66BU-00083B-KW; Thu, 23 Nov 2023 09:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639474.996893; Thu, 23 Nov 2023 09:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66BU-00081G-Ht; Thu, 23 Nov 2023 09:39:44 +0000
Received: by outflank-mailman (input) for mailman id 639474;
 Thu, 23 Nov 2023 09:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r66BT-000819-2T
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:39:43 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 398dbdf4-89e4-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 10:39:40 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so8612371fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 01:39:40 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h10-20020a9f3f0a000000b007c442a209d0sm174826uaj.35.2023.11.23.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:39:39 -0800 (PST)
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
X-Inumbo-ID: 398dbdf4-89e4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700732380; x=1701337180; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKHBrK7wqpklaj5tlyf32nTbWwPH2Nb+I3aVwJSu/BI=;
        b=rpz4raAntP9cpL+87+WDDkWnbQtB3uy03Qxru6ysX2wVuGzeakZZ4DwLmbqV1WGuYs
         j6AmpNLNHLJhZjmzydgHJOxU5y9KVwMXRuk3KPRNPGdLN6A/WiTziVbDzRs1epEvNDPN
         mWWK4uYEaPS51vTZ+upUJ+DFX962+cOUdjXkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732380; x=1701337180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKHBrK7wqpklaj5tlyf32nTbWwPH2Nb+I3aVwJSu/BI=;
        b=EWx0ettU5zmOihq2QksOsfQOJhNEybNsffKJz/95RwCNxTA8N/lNtbH1AX89myxGtV
         UU/Pmz4x4IT/GFLm/j0h8hGXtc7ErH2St8Ph+/2LM8H2SFNyL5nrH9bDu6gImTbcAZfS
         NQwUp8xXUIlZTPelyKuKKK86Eqa6JeEA6bUKronI35j4lLzji3YbJHYiBJ8JTkIurdZb
         2MTex5TRIO8NvjlB57lgs4+ujROk4KP7M/LCb/SeZg3sY9WHQKrgzYTZCx1eGscWQE/g
         sbJp+txUWxBC1uvI9xkttQ4PirzFloFUZyFhJeh8hPSeZ+7ziaQE/yC8/ZcJxKk77Ggn
         g3OA==
X-Gm-Message-State: AOJu0YyGpXL/MYadzuKlS6awyCozECrawE1yWVRiJBlUMmGBPC1PZZ6l
	BcPgxHez1u5QAnri64MN/jjc7w==
X-Google-Smtp-Source: AGHT+IE2wSb/9qonnoe+/7PXzTLwJqK7k6lXMvAC9hzo8/BOxgHMzkQgBSPLbLWAbYuf2WNci6Xugw==
X-Received: by 2002:a05:651c:1214:b0:2bc:d8cb:59fe with SMTP id i20-20020a05651c121400b002bcd8cb59femr3429956lja.8.1700732380196;
        Thu, 23 Nov 2023 01:39:40 -0800 (PST)
Date: Thu, 23 Nov 2023 10:39:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZV8d2ZiiiBBNySgc@macbook>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com>

On Tue, Nov 21, 2023 at 04:56:47PM -0800, Elliott Mitchell wrote:
> It was insisted that full logs be sent to xen-devel.  Perhaps I am
> paranoid, but I doubt I would have been successful at scrubbing all
> hardware serial numbers.  As such, I was willing to post substantial
> sections, but not everything.

Can you please point out which hardware serial numbers are you
referring to, and where are they printed in Xen dmesg?

Thanks, Roger.

