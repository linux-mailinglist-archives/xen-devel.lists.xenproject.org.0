Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56CACDAFB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 11:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005301.1384794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkPU-00041L-2w; Wed, 04 Jun 2025 09:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005301.1384794; Wed, 04 Jun 2025 09:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkPU-0003yv-0A; Wed, 04 Jun 2025 09:27:48 +0000
Received: by outflank-mailman (input) for mailman id 1005301;
 Wed, 04 Jun 2025 09:27:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMkPS-0003yp-0T
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 09:27:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bdeddce-4126-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 11:27:45 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so5545853f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 02:27:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe6c79dsm20670261f8f.25.2025.06.04.02.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 02:27:44 -0700 (PDT)
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
X-Inumbo-ID: 2bdeddce-4126-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749029264; x=1749634064; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q192x4MOg/z3zZ4sKfz0zZhIzh5Xs90+eUmw0paUWRk=;
        b=KMs42SGsherJSS5klg9V5C47vGCY9lGk5O+sCUpzr4B7o0dA3AzuVCljg6QYveOX0p
         CNNPftpz9WLoB8+vncNHoVSrRwQV/LMOhklaXAPcW4wom8NPZJs2/p9dceKHlVPm6fSn
         1/vZZO/02qbMXU+YmKSFl4QCgiY8ez2NxOS8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029264; x=1749634064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q192x4MOg/z3zZ4sKfz0zZhIzh5Xs90+eUmw0paUWRk=;
        b=CZ3pSUi5VTonjJsFU7BELTpfFyS4GYC7Yd0973BCq6ikBxtjDKBF3goaoijpibzA1E
         4apf0PwhPaEnSKjQJGfgPugnkDQSXzHobU5nafF+NePlyKiV8IJ2RgdlQhIEjRd2kgdJ
         ldsHdlAzusB/Q2Ntxvd033WJ1jubF045nDeUtyKy6225XKsikur/afeLy+Pdy6kw1rY+
         u/Ac3VaVcHNmKnpYbRxOf685Ewv3J61GO1xl0SUdXfY7Iyr5zIOaiTYLRHZa1uUeVibt
         O/ozWaXte6BpwpXtElxR0neR04XBppTM+9C4qgUZQsRUzbLshoOqjEtR0wD2as3szz6N
         CZ/w==
X-Gm-Message-State: AOJu0YwdT1zMwdJE4vaH5x43AsHcoYJsBGkUyyu+1UWl2a6GrfjoG2b3
	gzeDmqVUCWJMYBQf4yd+X5yMkbKEjd6Rh5aDHl4B80gvUjJmwIhJVZwLNT5UCUYIkRJR1pI21y0
	NNuLu
X-Gm-Gg: ASbGncsxj1JgVfvCy/SGehvCYRYxvzcu6LeZGqQPMWKdVC/k5vLC4DUSrvac/yV8z3U
	EYJrymOTj0ovBQrhkeTGbJKgRLSbADP1stUREsn8tL1QJdbHBdbGcYXbOZAXOt6WMGnVkteNEgI
	5gDDS2n16ht7pQzKAIwCtVqo0syTh1luDO3YZu8llVfZ9iu+EDCabL5J0g9wqa5eUy9+mgKeKQy
	I+MF1EoUkngBbJzxJZZapzywFXKCaP4u7fFt64LKyciVwVKjWzo106y3CSAwyEcLKUCIo/WeVPZ
	yrAzkXwfZ0KatLrEeUFyB3ucXkvgavF2sZ3lbon8HAE1HJpTJgI5jnamBOX5IjMWQpJjyl8kTeI
	yTQo4Gfv+UocB9H7iWHU=
X-Google-Smtp-Source: AGHT+IE+9MWe8ld9GybbG4gdAvfjXnv96Pu7aarncQaTas/hyQUYjrcCzrfdfi/1hVZvrLPe2deO5Q==
X-Received: by 2002:a05:6000:25c2:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3a51d9311bfmr1690350f8f.26.1749029264423;
        Wed, 04 Jun 2025 02:27:44 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:27:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: make mmio_ro_emulated_write() static
Message-ID: <aEARj_GYTZrPrXl_@macbook.local>
References: <5dadf381-0f97-4362-93ed-aa5b01d73d88@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dadf381-0f97-4362-93ed-aa5b01d73d88@suse.com>

On Wed, Jun 04, 2025 at 11:22:00AM +0200, Jan Beulich wrote:
> It being non-static and it not having a declaration (anymore) violates
> one or more Misra rules, iirc.
> 
> Fixes: ff3e5dfa7c2d ("x86/mm: move mmio_ro_emulated_write() to PV only file")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

We are not checking for those rules in Eclair I think?  Otherwise this
won't have passed the CI testing.  Or maybe we are just checking
builds with !CONFIG_PV?

Thanks, Roger.

