Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051328D150F
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 09:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731018.1136328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBr07-0005n6-BO; Tue, 28 May 2024 07:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731018.1136328; Tue, 28 May 2024 07:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBr07-0005jr-6i; Tue, 28 May 2024 07:12:03 +0000
Received: by outflank-mailman (input) for mailman id 731018;
 Tue, 28 May 2024 07:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wewE=M7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBr06-0005jl-9G
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 07:12:02 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93677143-1cc1-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 09:12:00 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-794ab4480beso38246685a.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 00:12:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd0740csm359485785a.81.2024.05.28.00.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 00:11:58 -0700 (PDT)
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
X-Inumbo-ID: 93677143-1cc1-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716880319; x=1717485119; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bx/7DHgYYqjvSrEkle2Btan5DZ6jhOnCHtTbyFruf2Q=;
        b=G2+cu9rnevPFePIRPXXaAPCszfErYehNRi80Y4OkxrlF0nmyBI0hn+1ZBNwx/ee8Ct
         1sAXusIaYzFKuNNmoLfk0LuBQlLBPiD6mLf8Nq8Ow5ZkaSgzRTjemIf/qMEd8U6HaDKF
         LMpV/3YlvnQcwfViJbI9c+Ar8liS6417vXVtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716880319; x=1717485119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx/7DHgYYqjvSrEkle2Btan5DZ6jhOnCHtTbyFruf2Q=;
        b=ANEloFvTto8+FqoQPY0a0e6JxQ2IDRTTa43HlnWwMQvR1ExCAE+5eTh9Y4wQbHXtzR
         4YzS1hYN1xCgZ92tpB6DxdGZtXkNwLEFXjlHdT1Jh8vS7xUMHZZCgjAXjvgdvo44BCq9
         ylGsNYcOuBnpeOhO0Al6D/cx+f3qrNwqltdsCCAYoBNfq4qZnQIeuRQ4oERh6vGcIcSQ
         cDvMWcYd3kG5ZbmCW759HMTlGt0egdLQvbLRA6X3uF7DmQt7ycKzYwyw7msiNd4XrcOs
         6TFbHsKAqC2bOfVD/IhKFE4nG1EQ5zZ527mB3nug2/WaI+WWaV0poLSKxWfcVgHZmb19
         0+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPoi69taJg07FjWyjwiKXKcMVYvRxp9wRpRlssnhMTHJsWSUb17pta+bXoZP2/HemO/oFVkBMf6xN+oIdpo4Q6q+LR8FV/wY6pb9up5wE=
X-Gm-Message-State: AOJu0YxU1RbB0tfZt+/pzWHaTo3LADVXzuzosgWSQgbdUcyCfTIrhGHY
	l3uympcc6nHtxnv8QVNL3SR2LUA0FjNUfMPf8lX7/oY2DdwbRVhElDv2FmnGbgk=
X-Google-Smtp-Source: AGHT+IHhYd/o2Rr1kyCHXRUoTk6NAXl1LIcDDR6rA5A9BPx1JfMcb3KVrMm2oXvck1NL2rPImhC3Ow==
X-Received: by 2002:a05:620a:379b:b0:792:eac7:7bf4 with SMTP id af79cd13be357-794ab07cb70mr1174026285a.26.1716880319222;
        Tue, 28 May 2024 00:11:59 -0700 (PDT)
Date: Tue, 28 May 2024 09:11:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v16 1/5] arm/vpci: honor access size when returning an
 error
Message-ID: <ZlWDvJ9_Om_3gX3b@macbook>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-2-stewart.hildebrand@amd.com>
 <Zk72jPtd9iXhChbc@macbook>
 <3b3fd3a2-6b5c-41a2-a0b3-219a362f645f@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b3fd3a2-6b5c-41a2-a0b3-219a362f645f@xen.org>

On Mon, May 27, 2024 at 10:14:59PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 23/05/2024 08:55, Roger Pau Monné wrote:
> > On Wed, May 22, 2024 at 06:59:20PM -0400, Stewart Hildebrand wrote:
> > > From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > > 
> > > Guest can try to read config space using different access sizes: 8,
> > > 16, 32, 64 bits. We need to take this into account when we are
> > > returning an error back to MMIO handler, otherwise it is possible to
> > > provide more data than requested: i.e. guest issues LDRB instruction
> > > to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
> > > register.
> > 
> > Shouldn't this be taken care of in the trap handler subsystem, rather
> > than forcing each handler to ensure the returned data matches the
> > access size?
> 
> I understand how this can be useful when we return all 1s.
> 
> However, in most of the current cases, we already need to deal with the
> masking because the data is extracted from a wider field (for instance, see
> the vGIC emulation). For those handlers, I would argue it would be
> concerning/ a bug if the handler return bits above the access size.
> Although, this would only impact the guest itself.

Even if there was a bug in the handler, it would be mitigated by the
truncation done in io.c.

> So overall, this seems to be a matter of taste and I don't quite (yet) see
> the benefits to do it in io.c. Regardless that...

It's up to you really, it's all ARM code so I don't really have a
stake.  IMO it makes the handlers more complicated and fragile.

If nothing else I would at least add an ASSERT() in io.c to ensure
that the data returned from the handler matches the size constrains
you expect.

> > 
> > IOW, something like:
> > 
> > diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> > index 96c740d5636c..b7e12df85f87 100644
> > --- a/xen/arch/arm/io.c
> > +++ b/xen/arch/arm/io.c
> > @@ -37,6 +37,7 @@ static enum io_state handle_read(const struct mmio_handler *handler,
> >           return IO_ABORT;
> > 
> >       r = sign_extend(dabt, r);
> > +    r = r & GENMASK_ULL((1U << dabt.size) * 8 - 1, 0);
> 
> ... in some case we need to sign extend up to the width of the register
> (even if the access is 8-byte). So we would need to do the masking *before*
> calling sign_extend().

I would consider doing the truncation in sign_extend() if suitable,
even if that's doing more than what the function name implies.

Thanks, Roger.

