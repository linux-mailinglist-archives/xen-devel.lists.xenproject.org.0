Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FEACF275
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007015.1386285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNC5P-0004mG-Sf; Thu, 05 Jun 2025 15:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007015.1386285; Thu, 05 Jun 2025 15:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNC5P-0004jt-Pp; Thu, 05 Jun 2025 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1007015;
 Thu, 05 Jun 2025 15:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNC5O-0004iI-Ik
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:00:54 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e004e94e-421d-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:00:53 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so9237915e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:00:53 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe5b8besm25068733f8f.16.2025.06.05.08.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:00:51 -0700 (PDT)
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
X-Inumbo-ID: e004e94e-421d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749135652; x=1749740452; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvNIJJcSe7ZYoHm2rfWZcNYQeLM/PrCPi0zA+WJTgBA=;
        b=oOpTPbHRHnmUIs3ht1SuJR1/H7NGshR6f2mnlXRQEK+nec/Emzga+D0rIVy8IBlJZe
         dK9wZM/QYICjH7WypsRXUXX2aJMdAidR6t5co3EwF0cfxMXpdZT8B2zVar+o77mpkc2B
         CSnLLQIWGE4Eb3ZwEaqL3J55TcwFCPLUJgu2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135652; x=1749740452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvNIJJcSe7ZYoHm2rfWZcNYQeLM/PrCPi0zA+WJTgBA=;
        b=T3xDXoi4YG5BF1bFZ7fID8q1Ke5vgqdgIIULbmj5Wgt+TdfO6z/6n77sLJrYbj0hFa
         8QPwg0fdNcql/hYrHJ5pPxvgpwIy/cvselsqE8trCHexXhwoKqRh3LfagoEr/4br348Q
         2U6XUTOpj8j396w42Tz8BKoLyM8mUjzc3O3Bs68oacCI3eL+EL6NYqzqTE7s4i7S8r/w
         H3e2VrWbL/gdsRt1NnZVgaY9yTb0MvUAnitWP4nzOQjxa8HhzV0LF27lidHk6y1ObR0g
         hFz54h7I9Rpf4EKNlZYTP6HUV+ZCdFz2+HTJhgLqGJiTsv4UsrHxHTkEzSfGCCNekYIo
         LeMQ==
X-Gm-Message-State: AOJu0YxBew5jXAuIw5PucKVy/S6PyPSyPi8ErTlDj0hLAOA9CIJIer+p
	Psw1qjFNQJ2F2Jw73b1q/++7JL8ot9AzMPbyHHXXjp5BEj65oF/4QzbEcWfbQ2rheqs=
X-Gm-Gg: ASbGncsSP64R5UXQiy6GNMEajH0x3iuO0yzys0o7CnXoQOOsDOIVdqHS3zl5FYaEqe0
	mOWwCaCY3ekaIyQ3yY3/F4hMaIYbOcBLUegkthPi/Ei85hCmwPD3dIUbw4XnI1eoiRdbNOCKbjQ
	Je8+UGg6OxG04RDhIw6AxD2zBaZOEP/e6fn3QxZoFB6wpDZBHDWtt1y55h42OODdIkrH3P4LL4Q
	Q/GOCrPI3pEFYl6wxgS1s+np2IpVc++c+K0UQvnUY1niE+bEs+J6NZq7NBjp8qbUUfkWsiZxz1M
	czr4dV1cBlyOI9MWye+FXldfA9Dr/FZMErKZSYNK5RygHcr66t/j+ooS4LEFPBejGT/EiXy7wSd
	tpSLlUiy2Tv/1leivf1s=
X-Google-Smtp-Source: AGHT+IG6A9WewjTN0p3wEnbBWSrHzRKowDOgkCfzLW0DgD481xJJYEEVUw/ZRVIA6EbqRuDzFcTs9Q==
X-Received: by 2002:a05:600c:1d98:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-451f0b3988cmr63911675e9.32.1749135652064;
        Thu, 05 Jun 2025 08:00:52 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:00:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v5 07/10] vpci: Refactor vpci_remove_register to remove
 matched registers
Message-ID: <aEGxIjIApdSumCQJ@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-8-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-8-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:56PM +0800, Jiqian Chen wrote:
> vpci_remove_register() only supports removing a register in a time,
> but the follow-on changes need to remove all registers within a range.
> So, refactor it to support removing all matched registers in a calling

"So, refactor it to support removing all registers in a given region."

> time.
> 
> And it is no matter to remove a non exist register, so remove the

s/no matter/no issue/

> __must_check prefix.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

