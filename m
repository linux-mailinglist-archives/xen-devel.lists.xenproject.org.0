Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84170AB6E4A
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984388.1370532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDLe-0005gO-2H; Wed, 14 May 2025 14:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984388.1370532; Wed, 14 May 2025 14:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDLd-0005dG-V6; Wed, 14 May 2025 14:44:41 +0000
Received: by outflank-mailman (input) for mailman id 984388;
 Wed, 14 May 2025 14:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFDLc-0005dA-TU
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:44:40 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f66b02f9-30d1-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 16:44:39 +0200 (CEST)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b2093aef78dso6886006a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:44:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74237a3d856sm9824080b3a.144.2025.05.14.07.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 07:44:37 -0700 (PDT)
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
X-Inumbo-ID: f66b02f9-30d1-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747233878; x=1747838678; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=guZ5oDobsJQTu2/Ss2S+FqqntL707+qTlLJKiycuulY=;
        b=Me9kFroXm5v0TnwDqGxpK7T5b4T4sK6ZH8wmylDEFgSu9iQFDmlQsgJvGi1KR7LSxF
         MJO1uYDQtwlqCyVY8gbHL/0enPXSpid+ufOCtb7mZugqUOJAP1k/JDq4khZyugXNyujM
         W7eeUT4nAlfF5z5fKEOHckHuKIIXyJr3FzTC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233878; x=1747838678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guZ5oDobsJQTu2/Ss2S+FqqntL707+qTlLJKiycuulY=;
        b=fZe2z+FxAz/ZVNJ4MUJkuHn0AAQ2ZtthawumI83KFqgGGlKdgTITxRt+sS0mLXeqYP
         t0INgjD4Da7Gh+K8VWAaAtK0PIiITAqLJpJ7kwkDApqw6pHLcwjhXIYtp4jVWszDK+5L
         6UN5eESEwosrt6UE8B9Y6Skq1dFcGUGLQ5bjvZGAsXFqt6CzT6JlKFrv76KpncndHcnc
         32YRQOXiMQJgkqCnx3WajTjmMTX6Z5b7UN84xgjnnzA4i6Qsibu8aPuJUCX1eRDw0xR0
         qH2amKmX/QXcMSVhi4JASD2/8fsx6PKrNF4M8uyMrTpvJ2Oz5fhdBecLdAnhgPVUh7oI
         niGA==
X-Gm-Message-State: AOJu0YwZCZnWy5LzvgXbpjSLOdzQ1rirJyp6wTAL7a/MNIE8kPyRR11X
	kry0jDJQa6Upc1V/Z2w8kGSy+/BLWqPRTsB9svW4kFRtxxCM0O1ZJ9o2GwC7wu8=
X-Gm-Gg: ASbGncvAz64WSMOV+W8BEiwx4BLATo488CYRkD92K7Lh+bCz2pyCHCoxvDG0PWrZfN0
	Wb1EKqxA2d/NXXbFdZvkmbgHlcSbZJ7A7SJkkuilHiwd93b84J9ugkNv+pEjDUaFRrUSNKPPWh+
	otF5WPgwJfypMj73dNxnl/abaEPwlIHTAAtk7AGxaa3nKEckG3hTntB+bBFhkMf1cijaN3hUyhn
	cC63AtQUZak98JkzUr0Fqomc6lN3TXoUEol7N79Oe8H5JJoZfZkBVAdGnRUCbCDyFtFa7minJnS
	d1AKVHvFSb17+weg78SRoPYxXN24laHx46OZgp9tH4NfTYFwzKRUfnd3JqeNRg==
X-Google-Smtp-Source: AGHT+IHImPD9w7qiY7xcBhGbsln/T3FlEAGKomz/gzcQmLvLUWXv7GjurojyZ/LFC3yqE4xNwsTjHQ==
X-Received: by 2002:a05:6a20:d045:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-215ff1b63admr5156371637.38.1747233878227;
        Wed, 14 May 2025 07:44:38 -0700 (PDT)
Date: Wed, 14 May 2025 16:44:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/6] VT-d: restrict iommu_flush_all() to cache
 writeback
Message-ID: <aCSsUKy7xe7uaQHW@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>

On Wed, May 03, 2023 at 11:46:11AM +0200, Jan Beulich wrote:
> We don't need to invalidate caches here; all we're after is that earlier
> writes have made it to main memory (and aiui even that just in case).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wouldn't mind if you gated the flush to iommu_non_coherent, but
that's not very relevant if we plan to remove the call anyway.

Thanks, Roger.

