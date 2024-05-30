Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399258D4961
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 12:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732625.1138629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcnt-0003JA-V6; Thu, 30 May 2024 10:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732625.1138629; Thu, 30 May 2024 10:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcnt-0003Gc-Rz; Thu, 30 May 2024 10:14:37 +0000
Received: by outflank-mailman (input) for mailman id 732625;
 Thu, 30 May 2024 10:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCcns-0003GW-5F
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 10:14:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69602dd9-1e6d-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 12:14:34 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-35dc04717a1so480982f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 03:14:34 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a0909a7sm16887391f8f.55.2024.05.30.03.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 03:14:33 -0700 (PDT)
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
X-Inumbo-ID: 69602dd9-1e6d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717064073; x=1717668873; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7fFZBq18WqVghcHtWuAgoj32tpEX347GF3vAtMzqrng=;
        b=X98nEzFUl9SePVuvfkRxmdaR8CnHBnaz+EQ+HiqLQ+6wq3+CSziWYWkuEYjZdSOPja
         APwQK4bSQBme0reoQNkfxdg96HcQ5t2vdTAH74UhCqH7wA48Z+CgWWMAe+ZxMUrkg7LL
         BKGXKv6R1pp2/o/3frkz9wuHTW8tjncZOUWJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717064073; x=1717668873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fFZBq18WqVghcHtWuAgoj32tpEX347GF3vAtMzqrng=;
        b=eA10Bh0z3qUPXj2OcgRVEaVfgE5Bw2SeMZ4PakTHEypw5+jVHsGPhQS5m/cd/QkYvq
         F9UbRhPThb/bNAoGC+5SfnHP1+IGWnCJfzTOBZRTRqW+n/2z1yQb+Xnqv70UbGqncivJ
         XHz2Eq14KD2KSWA2ycYv1w9H4r/Lq042bxFnDHtWrinR1XspAGa3TFu0EfYPW7q6geLZ
         NqPygnVoL6S0+gV5Vwh5TnchXApy/TgwJTacwahYJFuSmdPgAua0ZjUrMIyTHOQnvorw
         4xm7IU6HyEwHvGMamAofTlo04JqUJAsq4gFKHnklvHY+Fpn7Y6OurP3+UHFT2Kr7eC4T
         1NQA==
X-Gm-Message-State: AOJu0Yyk00Jz4pk6hqHYHstKTWjqkiPD/J2ebw4CqrKbOK1QorpjKnic
	v9nxeVsFpXE/X02GEVXoo10LyieIlRUpZcpq6EkgaKa1KwVl/wzGqEc9/JKgEYA=
X-Google-Smtp-Source: AGHT+IHDALesgu7Kz/Z9C2Lx+ykM6bC6I76joVU+11Cv1qWrj790FpRKaF4RD/l9GMskEbJ5UfnF8A==
X-Received: by 2002:a5d:4acb:0:b0:354:db90:6df1 with SMTP id ffacd0b85a97d-35dc009cc6emr2187749f8f.38.1717064073549;
        Thu, 30 May 2024 03:14:33 -0700 (PDT)
Date: Thu, 30 May 2024 12:14:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
Message-ID: <ZlhRiEOvIZ9W6RoD@macbook>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>

On Wed, May 29, 2024 at 03:32:31PM +0100, Alejandro Vallejo wrote:
> This allows the initial x2APIC ID to be sent on the migration stream. The
> hardcoded mapping x2apic_id=2*vcpu_id is maintained for the time being.
> Given the vlapic data is zero-extended on restore, fix up migrations from
> hosts without the field by setting it to the old convention if zero.
> 
> x2APIC IDs are calculated from the CPU policy where the guest topology is
> defined. For the time being, the function simply returns the old
> relationship, but will eventually return results consistent with the
> topology.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

