Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB916A1A472
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 13:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876209.1286580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawZ3-0003jL-1v; Thu, 23 Jan 2025 12:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876209.1286580; Thu, 23 Jan 2025 12:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawZ2-0003hv-VP; Thu, 23 Jan 2025 12:44:04 +0000
Received: by outflank-mailman (input) for mailman id 876209;
 Thu, 23 Jan 2025 12:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tawZ1-0003hp-Kz
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 12:44:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8c72449-d987-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 13:44:01 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so144258266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 04:44:01 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384d2df47sm1049144466b.85.2025.01.23.04.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:43:59 -0800 (PST)
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
X-Inumbo-ID: b8c72449-d987-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737636241; x=1738241041; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jz2VcQWO8EJikEJJUCtGoQ2xN6AMbnTI9F+jtpLAFDk=;
        b=Qxwm1lPLt/yNvDLXwJwY7NWw29eGFPZonLMeVx4BGB6zTbXw7kZUcWtCeOKJBvLhCh
         zl0VtDz8+0b7KMdddKLEgRZZvoBykecO1BHOC4GX62358onfSuh3CYNw8bt637Q2rTCH
         wSYccnFhh8cLhsolpL6BGrq7OLDP81J8gWwXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636241; x=1738241041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jz2VcQWO8EJikEJJUCtGoQ2xN6AMbnTI9F+jtpLAFDk=;
        b=GPYCHtnOR4xC8yRxAsvBlKdNDl7z/OZMpMMrNyvi/TVBK84JoQee5rDXIEm8t+DtlC
         RnGfpPQfQhn0qgyBLVkf2yZLvjY//dWVsRXSAHvKmGUa3GliJRUDO4F+cghT3VeUuaTl
         GsqwK+i8uugKOILrmaIEQsLwyia3rUG8plbrZUnu/lfsNqRC5qWAiNDx3mYaMEu6Uzc3
         1jobYb6EU4BraweRvb9Ev4aHJFRcttESb0QOPb9caupGPf9z5T6yguUul7G/7Lu3JoUo
         X2XdfET6z07Bn1KOA7dn8KAq1We2o3Mu7DJZ9oIOyWkQyGxQuA3u4yLtSz3LJAoYrfOy
         5PEw==
X-Gm-Message-State: AOJu0YxxbqxgjVLBQkXZoa7qaO9kIkt/mR9g+RZzBe6wHplBJ6lRN7MP
	RMeDFQYp6nrdCswInH9RT7saMJnJPkSl2F5rFMoqwNJca0+oLXIhB2B7YPRPmys=
X-Gm-Gg: ASbGncuRsFUvpvBD1MmcmteumJcI0FLT8ZB17nZrsxJ18UhKlkSTOSbSwUDSAwWqUve
	ig/sP+OcnmaupumL70ChTOTeYcti5zA2KhZJw3sgkXlS9Q1a+wWebuaq9byFzzEfZVcsL0qfTM6
	G9nEb6QVF/2yIhmYc6/JM4PWXx5jDwLqB00F/rnOrTMlemEC1rDEKPjoV7M0glhAEgr5EWEphy5
	qcV43Et4tTqSsUUY2CytruclKl8CFfS8zCZVdn73QrhXQNEhDIg5lDpH/Am8VZZyPFTSgMbZKtc
	Xfd7Q68KqTlT5Qc=
X-Google-Smtp-Source: AGHT+IE0yCa5ExwrU3XbJNXsOQLxR9h/rczerUBUHXZnbagyXZJfZAajGiAu3eveZrMI9fFqnwAsSA==
X-Received: by 2002:a17:907:3e1c:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab38b0bb338mr2450295066b.11.1737636241137;
        Thu, 23 Jan 2025 04:44:01 -0800 (PST)
Date: Thu, 23 Jan 2025 13:43:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20 v3 2/4] x86/HVM: correct read/write split at
 page boundaries
Message-ID: <Z5I5jsqp7_MG_6dJ@macbook.local>
References: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
 <5bd5cad3-698e-420b-aa97-e84763df0420@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bd5cad3-698e-420b-aa97-e84763df0420@suse.com>

On Thu, Jan 23, 2025 at 11:31:19AM +0100, Jan Beulich wrote:
> The MMIO cache is intended to have one entry used per independent memory
> access that an insn does. This, in particular, is supposed to be
> ignoring any page boundary crossing. Therefore when looking up a cache
> entry, the access'es starting (linear) address is relevant, not the one
> possibly advanced past a page boundary.
> 
> In order for the same offset-into-buffer variable to be usable in
> hvmemul_phys_mmio_access() for both the caller's buffer and the cache
> entry's it is further necessary to have the un-adjusted caller buffer
> passed into there.
> 
> Fixes: 2d527ba310dc ("x86/hvm: split all linear reads and writes at page boundary")
> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

