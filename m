Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEE8B061F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 11:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711295.1111144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZ1A-0003Dx-W3; Wed, 24 Apr 2024 09:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711295.1111144; Wed, 24 Apr 2024 09:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZ1A-0003BR-SM; Wed, 24 Apr 2024 09:34:20 +0000
Received: by outflank-mailman (input) for mailman id 711295;
 Wed, 24 Apr 2024 09:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzZ19-0003BL-LV
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 09:34:19 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d24591bc-021d-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 11:34:18 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-78f0592309aso469613785a.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 02:34:18 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05620a12c800b0078ec0e6188asm5998749qkl.89.2024.04.24.02.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 02:34:16 -0700 (PDT)
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
X-Inumbo-ID: d24591bc-021d-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713951257; x=1714556057; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8exCFmWjKMe7+jw6erqHfflGiRqm/RNFTVp/NwGr1SQ=;
        b=piACKYIoUZRfZN/y2+050LFQ7cJgs2CKpHUy+/YpROXJxdXxuDHgYCXeVyD6e+UE9W
         LQl9qsaYbFGuwnEu83P4Ot8qqRG59ZcU6dzW1tOushre7mm/uQ93y0DaL0kcF3yeLbnA
         vDN2vWfgamYST1kPQybkQg7JjK4ToUqppMZp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713951257; x=1714556057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8exCFmWjKMe7+jw6erqHfflGiRqm/RNFTVp/NwGr1SQ=;
        b=Z+dBPir0nenvXNdMe5LCHhH4SeDmFyaBkCu8uHLOqVrNpO7qk3Jxi8Ke2IMooQmRsQ
         2lDif5Iq7P5QC9EuwZevmJMX0/QQvCJCbJJxTexKd8F7Hp80SivzNaRD17JXSbxT6X7G
         mSKr/sAnL7XnwrNBJ3YQVi23qu7GY5wzOcs2EUW8gE3Me8CDZcANcG7uvkATvPOwD8Op
         u05XqIMcUQeFHGdf4NI0MvLxpuBN9L4JJcBv2C+hmg8WAECTa+to8HihpT0YIZSs9Xfw
         HnadUa/v3RWBy7+itWqXYhDBOpYb+SUVsxmzL27hwVMtAR2iVipzOBp436o2ySe826DC
         l/wA==
X-Gm-Message-State: AOJu0YxLbDf8TfD6jhfNtfe3dV0qfK34/8wy9Og8VXyk9pnYownO7D8q
	SpuDEUG2jlbgFdTuFuv1BYsUn+4ooNiLSyFzbiPedwIzJnLdz7dWp/0hRQyhxqQ=
X-Google-Smtp-Source: AGHT+IGLd9WH7v3priedi0YJ1P3sY9dZUpNp76H5w78pwVAeIAt0A5XZJQ9Z2OF7VqjkSS04AmmEMQ==
X-Received: by 2002:ae9:e403:0:b0:78f:1226:94c7 with SMTP id q3-20020ae9e403000000b0078f122694c7mr1934585qkc.56.1713951257205;
        Wed, 24 Apr 2024 02:34:17 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:34:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/4] x86/paging: vCPU host mode is always set
Message-ID: <ZijSFzOAeo1SfSrb@macbook>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <67805c1f-7187-446c-a5c4-14be8f170f11@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67805c1f-7187-446c-a5c4-14be8f170f11@suse.com>

On Tue, Apr 23, 2024 at 04:32:32PM +0200, Jan Beulich wrote:
> ... thanks to paging_vcpu_init() being part of vCPU creation. Further
> if paging is enabled on a domain, it's also guaranteed to be either HAP
> or shadow. Drop respective unnecessary (parts of) conditionals.

Is there some commit that changed when arch.paging.mode gets set, so
that this is actually safe to do now, but not when the code in
paging_dump_vcpu_info() was introduced?

I get the feeling we want to reference some change here in order to
explain why is now always guaranteed to be set.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

