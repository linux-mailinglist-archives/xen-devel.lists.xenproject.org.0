Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34198CD636
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728618.1133617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9oU-00085A-JX; Thu, 23 May 2024 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728618.1133617; Thu, 23 May 2024 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9oU-00082M-GE; Thu, 23 May 2024 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 728618;
 Thu, 23 May 2024 14:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA9oT-00082E-4n
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:53:01 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2571a117-1914-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:52:59 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-69cb4a046dfso26974716d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:52:59 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ab836aa398sm16282746d6.72.2024.05.23.07.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:52:58 -0700 (PDT)
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
X-Inumbo-ID: 2571a117-1914-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716475979; x=1717080779; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/ZWUdIBibQlFSbb0n2SW9+SVP7VDa6YLoknaE59ejo=;
        b=jAHFywa0e1otz0xPkXz8E+xbJzYcZ+ylQIsYalqGVxL9S0SylpkTjyjI0Als6EfVmy
         pTsWf94GA9Vw7oiwSY6Nfdlkr4oQN2LZ4dEommjWpRSISCtsIVz9s5zODPz7vn9ELlpB
         aCQVDiTm4at/bN3ujPg8lb+nMvyyUZZbxMdKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475979; x=1717080779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/ZWUdIBibQlFSbb0n2SW9+SVP7VDa6YLoknaE59ejo=;
        b=XOdIzBU7NktJ1Tvai21iSZLnfjKjybfRvRKhHJ01sOOI/TJ/a0IGRAOsIS0+/G3aaA
         NkWDIVBu9E9f9I9oPo+mpCLrBtpbn6Q/7/YmXapusb3sDzWOXqLs8P1ifdQkSSlfnL3g
         JBrxFByYIkG74XZ+pWlyW4sR7N15XPwnLyRLzMhTYeUzZSAYgtQo3y9yT267OAz3MEFG
         QixOwWRy06JBH33nnNZEbHrpXoexFrlR1Iy86prNSBLw51W6E9QSL3N1Ztp0cA2i/8tQ
         0IQtP5W2s2nKPA7oxBm2N44tdERQylDjyFJanLla37K+Z6KQ6I90fVYLTrJv2bRjz99x
         7tCA==
X-Gm-Message-State: AOJu0YxZl2EW3ClU0wJEBSv+749g/D56QTsXAyJzqYEEzFbGouogAhCZ
	0Ax1HNq6g7yIAnmhir5Y6LW+5FAmE293+TC3LQYo31MNX8LkRKbJsV50LfNUysQ=
X-Google-Smtp-Source: AGHT+IFnGYLkuY50Jpkq1CiDPeTDaFNCSYlZ/BfPkjj7LcxEVt4WjIj4qRoZm9UMhT7HIYsNqAzogQ==
X-Received: by 2002:a05:6214:5890:b0:6ab:7b2c:a7df with SMTP id 6a1803df08f44-6ab7f36d8eemr55687086d6.38.1716475978620;
        Thu, 23 May 2024 07:52:58 -0700 (PDT)
Date: Thu, 23 May 2024 16:52:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH v2 2/8] xen/x86: Simplify header dependencies in x86/hvm
Message-ID: <Zk9YSBEGFTYFc3BC@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9Upg9y03IYZEXd@macbook>
 <8dd92e22-2a7e-414b-98b2-c10ae449f825@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8dd92e22-2a7e-414b-98b2-c10ae449f825@suse.com>

On Thu, May 23, 2024 at 04:40:06PM +0200, Jan Beulich wrote:
> On 23.05.2024 16:37, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 01:39:21PM +0100, Alejandro Vallejo wrote:
> >> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> >> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> >> @@ -798,6 +798,12 @@ static inline void hvm_update_vlapic_mode(struct vcpu *v)
> >>          alternative_vcall(hvm_funcs.update_vlapic_mode, v);
> >>  }
> >>  
> >> +static inline void hvm_vlapic_sync_pir_to_irr(struct vcpu *v)
> >> +{
> >> +    if ( hvm_funcs.sync_pir_to_irr )
> >> +        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
> > 
> > Nit: for consistency the wrappers are usually named hvm_<hook_name>,
> > so in this case it would be hvm_sync_pir_to_irr(), or the hvm_funcs
> > field should be renamed to vlapic_sync_pir_to_irr.
> 
> Funny you should mention that: See my earlier comment as well as what
> was committed.

Oh, sorry, didn't realize you already replied, adjusted and committed.

Thanks, Roger.

