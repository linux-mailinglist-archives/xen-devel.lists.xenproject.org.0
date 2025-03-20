Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DDAA6A42F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921794.1325538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDXQ-0002no-NN; Thu, 20 Mar 2025 10:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921794.1325538; Thu, 20 Mar 2025 10:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDXQ-0002lZ-K6; Thu, 20 Mar 2025 10:54:12 +0000
Received: by outflank-mailman (input) for mailman id 921794;
 Thu, 20 Mar 2025 10:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvDXP-0002lR-8s
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:54:11 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a68a1b97-0579-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:54:09 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so4005025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:54:09 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeb79sm44871365e9.25.2025.03.20.03.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:54:08 -0700 (PDT)
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
X-Inumbo-ID: a68a1b97-0579-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742468049; x=1743072849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+zFUBr4CbCtQ2nVLVMw60Fkngad+/MA1WN+quCl/ks=;
        b=IEmxpMYcm8qZrt73JSkUf4tSxOhUQ97rNBJPu6GbJkI1nSIe0Dcl8VZqoBPDAvhnzh
         SoZ9wZ1GowNLrXnRk0XtkJTEm45OHFrgu8/0L0Hy/sgiuu/fYTxJtBCLqKEF1wxtqyFE
         fADVt7QlOuPQPe5oSBE6aZ7UnIO7iuU0sHVHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742468049; x=1743072849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+zFUBr4CbCtQ2nVLVMw60Fkngad+/MA1WN+quCl/ks=;
        b=T35MZaXeB579POsP/2xwp5gU8i7pI8v5FoCCLW6NRpZPPfZHaYjkvZNsJtJVeYsSSX
         v6M47/7bYE4oCvikWDs51sq5JqfMklGY9rFDax87BksQhF+uYYWJRpDXacAVl7ZOMfEd
         BydLGn+dqGahuhYauC/prjksQj4Pnx0MFqBRLTPqoU5XWKx3AqUFtSvcVfvckPZdazhU
         kxYh0SpubE7EN0nDrvOiesuv39TKrIwApB8WisiON3sfiYWzFr//eNKLcXCaObLCeWLU
         fBj+n0odDb4hFcAeMxXFIS0tPl+XHtJjg014IxfW/FlBdNH4aHFSfNSM/8ta9toVKJ56
         WS2w==
X-Forwarded-Encrypted: i=1; AJvYcCWugqDuK1xwt77GiyGuodC9t28pyOkWqTqffydhn3c5/g+MgzolI9dkluOFuT6YfL+0YGwcF3vtfCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGoQfBM/bgCOB4A5o8ZQa1FGnGg9n7wmVFitx3wl4GcJkR1KBL
	fkQY35EnUC6SvjU2nfNBDbNh1TKgEU6az5YGs93TprBs3SzFtXbdZcXNiSCfFQQ=
X-Gm-Gg: ASbGncsmFfpoW7vwTH61rZ/A6IjIs4vKmjWeyOof/vfx+Njc2Ipwve02UhIvLLLqpoP
	5LCcI+u+HX3i1EIHWRv76o7rHzWsUo2lw4HYDmkpFFSPVCMZHBJ03S8d/371qOZpf6AjYrXP7qf
	vvhS2iZnPQ2s1EG6VwJHwMkxpF8Dbz4iGplUmBguK+SpbeHQ28ItVjkYc8aVBsuuozroKgyCyGB
	MgyUD4LSsvKczBwZL6sYLrW/mfIf3CJW04g1pMnYWnirt6pGUPC7J/vrMlqnJ6ELF4VZkgjA0mZ
	Jny2gcANBsl+PqsUouRO/8BiNjBrROcOgbFreQrQdxZ/8KuUAD6mwuZy5G9B3kMYKKNBoOsYiBs
	v3pVBNIzpeA==
X-Google-Smtp-Source: AGHT+IG+0KzXiIqLT7USnQOk8wOoufTa9dj0+DHjLHGsak2XrSbQYPUd8XU1svSgXM7vVMqiyoyxoQ==
X-Received: by 2002:a05:600c:5117:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43d495095ebmr26393875e9.3.1742468048699;
        Thu, 20 Mar 2025 03:54:08 -0700 (PDT)
Message-ID: <a12bdfea-f3a7-4e21-9bc5-519a0912c781@citrix.com>
Date: Thu, 20 Mar 2025 10:54:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 4/4] x86:hvm: make nestedhvm support optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
 <e4f77564313d20ad4f3b94bde0672250f7d99bb4.1742465624.git.Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e4f77564313d20ad4f3b94bde0672250f7d99bb4.1742465624.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 10:40 am, Sergiy Kibrik wrote:
> Introduce NESTEDHVM config option that controls nested virtualization in both
> SVM & VMX code. The option is for reduction of dead code on systems that
> aren't intended to run in nested mode.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

I know you're trying to remove unused code, but you're #ifdef-ing out
non-dead code which reachable by guests.

You cannot #ifdef out any of the VMExit or MSR handling.  They still
need handling if the guest does them, and falling to defaults doesn't
work.  e.g. we'll now crash the VM if it executes an STGI instruction,
rather than injecting #UD.

~Andrew

