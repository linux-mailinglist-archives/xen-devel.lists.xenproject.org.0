Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1BAA08D4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971913.1360315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iTg-0004wM-2D; Tue, 29 Apr 2025 10:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971913.1360315; Tue, 29 Apr 2025 10:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iTf-0004tU-VP; Tue, 29 Apr 2025 10:46:15 +0000
Received: by outflank-mailman (input) for mailman id 971913;
 Tue, 29 Apr 2025 10:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9iTd-0004tO-Ru
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:46:13 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2af51409-24e7-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:46:13 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so7325261a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:46:13 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f703545234sm7195662a12.56.2025.04.29.03.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:46:11 -0700 (PDT)
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
X-Inumbo-ID: 2af51409-24e7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745923572; x=1746528372; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rdwaRWqtsUshNHH/xFTuq2hAx+HT+DO/6OQW20JAeEQ=;
        b=Lu8QGPg8NrGTBc0toOq44h4VUIxZjP105hb0MgTmyGNCdPbXQP1CTsoMjmd6jRr9wY
         BTJxlZmmY8GCeKL0aRPJ5P2A/slvbKeKk/0yHWF1d97guzwf9IF1VVVJiAUpruhVtnL3
         sRIKfok65vnBEynDSwE7p1jxMcvGUVoTPZxA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923572; x=1746528372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdwaRWqtsUshNHH/xFTuq2hAx+HT+DO/6OQW20JAeEQ=;
        b=lzCf9JJXbyTZil+qNvm2EGdTYCMdzB4dkHM4/Cv0BPLX2bty+JYAaOmxu3ccCiLUch
         U2OF8WC8m9Oqau5KYWN+k/QFRmJs1QKn2UPybZuJ02hIV6OHejvjjxArwxsWyirZVsmq
         ZlE/r5NgTLun0YYGGqBa/OT9OTx4/KkLdV0qVTz90hnLeSpZvFltnL0O1r+QwXyOZmQ2
         lEMyqvlZ+GkvbjiyMuwALOGMQoXFZaejUmKEzKmrjuJ3vljjmbgoUSEX6qYQcZtSoMpf
         VJUrPUB6cj1U+Gp7mS7Ivk4tdhGMo1yEID9MWBdYuDnJgvcYtNgpDNCy7jL1kYFy5AyI
         f+bg==
X-Forwarded-Encrypted: i=1; AJvYcCVgvrirrUlEu0vRp/jJmgeXFw8IFCTPpBVtpP1JA2JgrurmnhpKoyFzFp0lxnXJ2b6jb1F7lAWmW/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0m7ZuArGUxE6OApmMq71kdr4jFyV8MZYl2gxFDo3nT7bXhX1p
	g50kFn+s3f6bGGt3r2uTUX8XS0ZVo6dZ2raCRxQQMSOz+Lcz17AR5gJhO1S2PqE=
X-Gm-Gg: ASbGncuR0qz7bHRO0xm9CeovDMRPa4RD967Mnn4qILtjtySYGJ5NR5uXk9LSVRbyA7n
	4kpi/wv850ZT+Uay+iSXt+gTwfOPtruk0lDtDZWCMj1mLnmH+QisKd/ufzAzeUs74+5HTWbiCtF
	yAAGt4LXwUOdRdFkqCT4D0hjui0jh1+NR55/KjjqkrDLREu6HrVqQDbCU45s4wD3/gY7lLTEMdM
	fZ9D2eYT4bT3OATlDuRTDisxG661aXiaKKjNWLhEB1IOLs5JAjiYsKOthtsHkNneEqvSFVDdlOH
	mE1v4FclZqvNfVTM3u9hDFeAaaKNAlSDpMK4ELP1HJuZkl68aZmwXJ8i
X-Google-Smtp-Source: AGHT+IFVQb6LRpiA3zAa7O0byxvOIa677tRpq2SJ/FSNj0cMvOi2zlMP62YUsA34R/g6jCvLCFzKkg==
X-Received: by 2002:a05:6402:5245:b0:5f6:c5e3:fab8 with SMTP id 4fb4d7f45d1cf-5f7398341f0mr9393260a12.21.1745923572072;
        Tue, 29 Apr 2025 03:46:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 12:46:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/4] xen/io: provide helpers for multi size MMIO
 accesses
Message-ID: <aBCt8lb-2X75-wqF@macbook.lan>
References: <20250429101252.50071-1-roger.pau@citrix.com>
 <20250429101252.50071-2-roger.pau@citrix.com>
 <08d550d4-2283-4177-b812-fd87c0fa511d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08d550d4-2283-4177-b812-fd87c0fa511d@suse.com>

On Tue, Apr 29, 2025 at 12:23:05PM +0200, Jan Beulich wrote:
> On 29.04.2025 12:12, Roger Pau Monne wrote:
> > Several handlers have the same necessity of reading or writing from or to
> > an MMIO region using 1, 2, 4 or 8 bytes accesses.  So far this has been
> > open-coded in the function itself.  Instead provide a new set of handlers
> > that encapsulate the accesses.
> > 
> > Since the added helpers are not architecture specific, introduce a new
> > generic io.h header.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> preferably with ...
> 
> > @@ -5185,6 +5167,7 @@ int cf_check mmio_ro_emulated_write(
> >      struct x86_emulate_ctxt *ctxt)
> >  {
> >      struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
> > +    unsigned long data = 0;
> 
> 
> ... this moved ...
> 
> > @@ -5195,9 +5178,12 @@ int cf_check mmio_ro_emulated_write(
> >          return X86EMUL_UNHANDLEABLE;
> >      }
> >  
> > -    if ( bytes <= 8 )
> > +    if ( bytes <= sizeof(data) )
> > +    {
> > +        memcpy(&data, p_data, bytes);
> >          subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> > -                                   p_data, bytes);
> > +                                   data, bytes);
> > +    }
> 
> ... into this more narrow scope.

Hm, but if I move it I can no longer use sizeof(data) in the condition
check, that's why data is defined in the outside.

Let me know if you are OK with this.

Thanks, Roger.

