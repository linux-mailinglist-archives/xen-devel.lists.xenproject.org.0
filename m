Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3987ECB1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694838.1083987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFI7-0007SY-9J; Mon, 18 Mar 2024 15:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694838.1083987; Mon, 18 Mar 2024 15:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFI7-0007QD-6n; Mon, 18 Mar 2024 15:52:47 +0000
Received: by outflank-mailman (input) for mailman id 694838;
 Mon, 18 Mar 2024 15:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8te1=KY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmFI6-0007Q0-0P
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:52:46 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f8c289a-e53f-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 16:52:45 +0100 (CET)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-690fed6816fso31208676d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:52:45 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 11-20020ad45bab000000b0069046d929a3sm5363281qvq.145.2024.03.18.08.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:52:44 -0700 (PDT)
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
X-Inumbo-ID: 8f8c289a-e53f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710777164; x=1711381964; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g1SXh3TRJWNRoXlu8AMgOkJ0X83NQ6GJjyvwMEEkrD0=;
        b=S7dVcuuF6kU8uAIMapQ6r3lpu9s2oe0+c8/E4uMaEW4UXEYBCjziCAiJeFJ9V+x2Ye
         I6jEMVqAu76VjaxsUCjj2y/TAArJczPJfbBJ/rb+2NmV9eSpFOsixpdE21apydj5vRBh
         111ma/ps40weYTUXJ2gDnKgJIKAw5Kv/L3B18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777164; x=1711381964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1SXh3TRJWNRoXlu8AMgOkJ0X83NQ6GJjyvwMEEkrD0=;
        b=oioasCQrcrj95bEuPUVSVN+zUhNnCqE1xykG5JkumSDtyqxRQrQIx/sGVAigeJic6f
         AwOrKlKSCcwZOc7EcpF/eDDNXVCstaDesR9tNc1rDGO2TFbez/Ob7eNBTs2/9hshwA9w
         STd1cCey+zU8plqDt68gc90NqbMyWgpXcNrizgsZCEk7SuORnJn+eJHnWpVMkqO8R3NN
         KtFokZZgI8BCPCwcUSIyIG3BESa1iEzlDvnCcQyvZpZUDy0RCISlnGaIhAvhtNQhOOa2
         iCbD/o0K14sTLSUdKF7UL/v47ta716WVi8v0DRJcLpQeaXh5AluxjXo7JhcqcAlTQr7u
         yQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+H2QyorSHjBU+wo33LF91/u5pwRGVQxHGouBmZskcFrI5z2umm1/A0BC9Sv3PN8LZbJuwrIJwYoBBgApfZ2Nf0BYzMTQGuxCHmvlgoJY=
X-Gm-Message-State: AOJu0Yx4zTIMQBvjmoUrhfFhlfARk6ZQ8sqRnJIFOJvzqd8ZZySNtzBY
	qaqNyr3Ph8VkRLmORXngvsQmp/LglMSSoX+h75VAkB7EgVNV2bBlBXDev/Dz9+g=
X-Google-Smtp-Source: AGHT+IE7qr1H6LtG96P5eYjKxk7LFvzAzPmHAEhBL2oxWpFILpALXkEOM8Pxk9mAG8kqmhbdnyXQoQ==
X-Received: by 2002:a0c:e3c2:0:b0:691:46ee:6abc with SMTP id e2-20020a0ce3c2000000b0069146ee6abcmr13458520qvl.3.1710777164430;
        Mon, 18 Mar 2024 08:52:44 -0700 (PDT)
Date: Mon, 18 Mar 2024 16:52:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] IOMMU: store name for extra reserved device memory
Message-ID: <ZfhjSgAwZnSuI10N@macbook>
References: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
 <3ab49282-6b67-4ab0-bb65-f04c62bcadcb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ab49282-6b67-4ab0-bb65-f04c62bcadcb@suse.com>

On Mon, Mar 18, 2024 at 02:40:21PM +0100, Jan Beulich wrote:
> On 12.03.2024 17:25, Marek Marczykowski-Górecki wrote:
> > It will be useful for error reporting in a subsequent patch.
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> In principle
> Acked-by: Jan Beulich <jbeulich@suse.com>
> However, ...
> 
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -682,6 +682,7 @@ struct extra_reserved_range {
> >      unsigned long start;
> >      unsigned long nr;
> >      pci_sbdf_t sbdf;
> > +    const char *name;
> >  };
> 
> ... to me "descr" (or the longer "description") would seem more suitable.
> Thoughts?

I'm happy either way, but I don't find 'name' odd.

Thanks, Roger.

