Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCD7F5A0A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639435.996804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6584-0005kg-Uq; Thu, 23 Nov 2023 08:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639435.996804; Thu, 23 Nov 2023 08:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6584-0005iq-RS; Thu, 23 Nov 2023 08:32:08 +0000
Received: by outflank-mailman (input) for mailman id 639435;
 Thu, 23 Nov 2023 08:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6584-0005ii-1P
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:32:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d764b1-89da-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 09:32:06 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b358f216dso3148425e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 00:32:06 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 v19-20020adfd053000000b0032f79e55eb8sm958468wrh.16.2023.11.23.00.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 00:32:04 -0800 (PST)
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
X-Inumbo-ID: c8d764b1-89da-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700728325; x=1701333125; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gMHYJApn+ul/biwPCW3E63uVREwUCfJPZcr4em5OW5Q=;
        b=SwEshUgWbg/5lVsgoJ1r0hmYtXfVB+/ch1uQw3Nh0hQ3/PVeKaPys7/J6xN9X8XZ9x
         1K8J8kNqOZvDs7dLJA42V3VeXy+CNhL175OHwhDNzsme/U4ZmZii0ZrXKOA9ePPi1GyV
         lbLGj3W/Wt1DOaF1nIakUXQu3E8dqjl0gCqac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700728325; x=1701333125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMHYJApn+ul/biwPCW3E63uVREwUCfJPZcr4em5OW5Q=;
        b=kcJM8WrvrQFvPWqJPOAusWKXGS53SMEjskm12rP9ZZ5waggj03+r+fuKwxa5ITuLcX
         e9ucG6qIf4fy3xVdn2DySd7W/yXronV/q0g8wETi3NjQCopPTNGBDg9fksnmGanQN0Zb
         PQI4JvA/WxRSw34jYYmzLp14PpPlruBtkHfwzr9brSdmknmocsyuN2E9LnleMWvIwFPH
         vEOrfIz3Lf6E2sB6Qeb+gDjEFs1XrBybJCVJPgylM6b+N9WdJ7fxQQ58Kc7XdVXv0tKe
         /m52gveEcUVFWFqhPubmhXMLzI9PVXSnR3MukgHIYG1fRAnJ65V69GLP+rBWhzuaIQWG
         CCAQ==
X-Gm-Message-State: AOJu0YyBLCxf1CXXueKXpnezA1sRPNhJeat60CSNfv8I4XGvB96QzYR8
	CkGbHMdwmXb1bm4nxUfThmk35A==
X-Google-Smtp-Source: AGHT+IFwvn67hH26s8zqdZITzUG8OcNhfmnvB+eJpoKmhyYbZU7NI5yNhpd00szAaYwsP+7JVsqL/Q==
X-Received: by 2002:a05:600c:45d2:b0:40b:273c:8b40 with SMTP id s18-20020a05600c45d200b0040b273c8b40mr4061330wmo.38.1700728325613;
        Thu, 23 Nov 2023 00:32:05 -0800 (PST)
Date: Thu, 23 Nov 2023 09:32:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/ACPI: constify acpi_enter_sleep argument
Message-ID: <ZV8OA8t7EAi-icx2@macbook>
References: <20231122170142.15038-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122170142.15038-1-frediano.ziglio@cloud.com>

On Wed, Nov 22, 2023 at 05:01:42PM +0000, Frediano Ziglio wrote:
> Minor style change, structure is not changed.
> No functional change.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

