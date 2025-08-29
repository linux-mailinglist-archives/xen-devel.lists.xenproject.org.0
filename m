Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C24B3BEF8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 17:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101578.1454586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us0nU-00071d-I8; Fri, 29 Aug 2025 15:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101578.1454586; Fri, 29 Aug 2025 15:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us0nU-0006zr-EK; Fri, 29 Aug 2025 15:13:48 +0000
Received: by outflank-mailman (input) for mailman id 1101578;
 Fri, 29 Aug 2025 15:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1us0nS-0006zl-LJ
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 15:13:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c19475e9-84ea-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 17:13:45 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b82a21e6bso4032855e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 08:13:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf276d204asm3752257f8f.24.2025.08.29.08.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 08:13:44 -0700 (PDT)
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
X-Inumbo-ID: c19475e9-84ea-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756480425; x=1757085225; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NQk2qduKaq9gTkOBDGw4VlGAUkWo/MkqHGXDBwQLNME=;
        b=lbvQr1JRkl4GExeq2m17IFIB2GtHGsont2ZMPwr0aeNahmRvh9b8D6r/Rga0fXwPaC
         nF0Rs3YYQ63aRfFaQCApcEAJqpveoPEdp5ejL3cMCnnqcse71NIButBj4uilRqWwmBvp
         Gnk4fLSyzFqkIih7TYB1YIlPx7ZJ9Oz0eJw/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480425; x=1757085225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQk2qduKaq9gTkOBDGw4VlGAUkWo/MkqHGXDBwQLNME=;
        b=I5MIv6Qir3e5qcb+Pcu6JaNs+2SLmb1wX+q/rKa4MYSl3YKn6s3fM6RHLgipETOUY+
         ZhJPdclI8R/loSMMVi1Wvs84nDVhMbGmB+fa2ZrBRzLxoVADQul44giHzrvIQNglnH6e
         jY8h7TmJXdLSE30aO6bBdFf3XZ444v0CIA3oMmEvMUCOhk2hX0Tj2hgzY7FNks9ZkOF0
         LLFzIYp0MDrkCyAn0O19jtb26kF2lF25VjPZioLxeOF2DytY5OGSDdVP+9K1e8cev04q
         JVbVEo8oizAGAzuNGSUJx2LI6um8EG1c8N1/Q35grq37AZ5d7jic7kRpDo9FjTXBpqmY
         0Raw==
X-Forwarded-Encrypted: i=1; AJvYcCVf6SzQkRfWKlUisINdk/ZcApGpUYIC3zPxSV/lPOOenv29ZJEhx5BN/elhKVD41p8rcHg+oyFsyR0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEgHlDdm4pHij57oHbQZLa9yHPZeuuGsBCr0I+p8LoBVUuUNYQ
	CjRQHtvc8zLSjP5xLLpjLgyOndf9GfNpJgf9xtSqySt0e81x4PWEPtxO7tL0Ye0C8IE=
X-Gm-Gg: ASbGncsKGyZPKkmbZxbHN8W3cKErPUwNF8JWIhBrrOoNpUbjphE1upoF9m4ycwndzXt
	vHizS9/QNaauKi1xa6DBsMga7FzfGy0nJfsFsaguU/2t0N1/8Tr+e6fP1rTA7jP3BopnpOn/oJl
	QeSgPB8RJfZEelc3Ahc4oOA/4nTa3T/QocPyjeBfs28HJhtkQ+1aSNdDydVHqV9qJBjvmSCSq+U
	xBo/L9z3TJQGDgwiSxzI7miU7sDWxPn+ELekR7M1G7GwcZIZHOHwA+dU19nZnmK45M71Qk1D/WH
	FBMWAoprYhGRPkMV+/hfRR8rEuhqwhPgZvRND2OArDsBj4Vrhc0hUumuhUh/KXUIAgJJGb7EK89
	oj/skun7K/pcCfTC5uOlfWh1fuqFTQZsAa0Mc2EKc5GT7tGjwtfbb3KZHYGZ1HCd0OhUMoayufc
	JbRkdXAhG5p1g=
X-Google-Smtp-Source: AGHT+IFhp98FcBxebTq3u1enAA0IvE9CkFDCIgdQs0jDr0CyGvYLU03zsvihD2zqXJw+VB7UU+z7iw==
X-Received: by 2002:a05:600c:4451:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-45b517cfeacmr238089735e9.19.1756480424788;
        Fri, 29 Aug 2025 08:13:44 -0700 (PDT)
Date: Fri, 29 Aug 2025 17:13:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 5/5] symbols: prefer symbols which have a type
Message-ID: <aLHDpyuUipkL2shD@Mac.lan>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <b7261eaf-b3ce-4b71-aba2-3f40adbbe93e@suse.com>
 <8ec4b804-28d0-4f39-8d2e-29d326a6909c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ec4b804-28d0-4f39-8d2e-29d326a6909c@amd.com>

On Wed, Aug 27, 2025 at 09:07:50PM -0400, Jason Andryuk wrote:
> On 2025-04-02 10:00, Jan Beulich wrote:
> > ... and thus typically also a size. Using global vs local is undesirable
> > in certain situations, e.g. when a "real" symbol is local and at the
> > same address as a section start/end one (which are all global).
> > 
> > Note that for xen.efi the checking for "Function" is only forward-
> > looking at this point: The function-ness of symbols (much like their
> > size) is lost when linking PE/COFF binaries from ELF objects with GNU ld
> > up to at least 2.44.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

