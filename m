Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDC97660D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797189.1207051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogUQ-00085s-Bo; Thu, 12 Sep 2024 09:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797189.1207051; Thu, 12 Sep 2024 09:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogUQ-00084K-9D; Thu, 12 Sep 2024 09:51:50 +0000
Received: by outflank-mailman (input) for mailman id 797189;
 Thu, 12 Sep 2024 09:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sogUP-00084E-77
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:51:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0924678-70ec-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 11:51:48 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso96707266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:51:48 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835ad4sm723427866b.21.2024.09.12.02.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:51:46 -0700 (PDT)
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
X-Inumbo-ID: a0924678-70ec-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726134707; x=1726739507; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ol4uel9M6byyvTlbRf019+Cj6RKcz16YMq3PWivgnQU=;
        b=mpcFhYZTlRtTwSw9rJW+vkOnir44QurFCgjotbwuTxLZYiX6m0LEwfvs2emoYf8RUo
         ihlnp+Xrrx6PA7d68OWLL/JFFQsSANENi79uOeKpLNGCY2u9izkhS7jhwKYXw99hpagO
         LnT0x9uPbnqqQkTbZAmQZ7oZFwvErJUv4AbK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726134707; x=1726739507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol4uel9M6byyvTlbRf019+Cj6RKcz16YMq3PWivgnQU=;
        b=cA62IiI4AZZiKUIuDgOruzP40AJ/1DY5sO738oL5XMDKjsAxWKNkzmNroBbCraqauK
         5X//tvd/hU+s7APne97KysUa9jXxJsrTykYEXKfv6uVKFR4YSwA2SHNgRJ0z/dKLjDXR
         Uzpp+9hMZlQP1rtp5xB644z+5G+3fE0aVmknYoLgkXV1aKH3HpKshjkZbHTu7NY/b5xz
         Tcr6NQGXPyFtIW9mgm8Zyn08NeS02dQKXu+Nickot9f2HyEShdMYpHhsvZkcI24NDt7W
         RsxDrydRaIe9HOrHl3jvGIn178WVjA5TZh1pqweHMN5jBd2Yfbsq7AZnu5wegVyQ9PMF
         ALug==
X-Gm-Message-State: AOJu0YxTnM6TKeSf2zg1xJhLnQ6/HAoXw+WnpXS4hBrpMQnhVtgNWYfs
	kwoM/y2BshbJNLDSEerVpqp6L9pP9kg6+NVGKxlwdeCFEgCtExwRfZY9zmhqsus=
X-Google-Smtp-Source: AGHT+IGGtOduGoTeE2+wOeaMPbS0LDPWnNKP7WYINoB7ZUkncUjTtAxTYjzqxXgPNfjhMSaoOg0fCw==
X-Received: by 2002:a17:907:e29a:b0:a8d:4631:83a9 with SMTP id a640c23a62f3a-a90293dc171mr228801166b.3.1726134706862;
        Thu, 12 Sep 2024 02:51:46 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:51:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 3/5] types: replace remaining uses of s16
Message-ID: <ZuK5sQwwGu3JdFeS@macbook.local>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <a3c8c66a-3b90-49e3-bf49-b73fa05a1f64@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3c8c66a-3b90-49e3-bf49-b73fa05a1f64@suse.com>

On Thu, Aug 29, 2024 at 02:00:20PM +0200, Jan Beulich wrote:
> ... and move the type itself to linux-compat.h.
> 
> While doing so switch an adjacent x86 struct page_info field to bool.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

