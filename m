Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C537C1A6
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 17:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126283.237729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqMz-00065B-LO; Wed, 12 May 2021 15:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126283.237729; Wed, 12 May 2021 15:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqMz-00063G-HQ; Wed, 12 May 2021 15:01:53 +0000
Received: by outflank-mailman (input) for mailman id 126283;
 Wed, 12 May 2021 15:01:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+k7y=KH=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lgqMy-000638-Qe
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 15:01:52 +0000
Received: from mail-oo1-xc2d.google.com (unknown [2607:f8b0:4864:20::c2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c53055f-25e7-47e2-99be-8a84119394f6;
 Wed, 12 May 2021 15:01:52 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 e7-20020a4ad2470000b02902088d0512ceso2175781oos.8
 for <xen-devel@lists.xenproject.org>; Wed, 12 May 2021 08:01:52 -0700 (PDT)
Received: from ceres ([2603:300b:7b5:c800:1cf6:4c9f:4e7:d116])
 by smtp.gmail.com with ESMTPSA id h184sm34435oia.1.2021.05.12.08.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:01:51 -0700 (PDT)
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
X-Inumbo-ID: 8c53055f-25e7-47e2-99be-8a84119394f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UDD7PJOLLYReV+ki1w4vWVhaqVdnK70fMH/aRuBsi+U=;
        b=j3EdvE/qBJ2JgHC4pSAw8ptUM/hHYSlfqrJ2bFDGn2AgF1DuvwJnsQErvNFeapmoOd
         WjwGhq3dj825FTLXsKh1Y9BvNJuxB88Y9b89ERwOhntkFG2VFxwix0XuqvpuMkAUFqt4
         ZeskQ1YsAtuToGOXwdrcTTAJe1mpr9sVsXp+emzb8tXoNI2EDxzP9yTiqce+6RneGFO0
         VNRovDzDjhR4MOq45H8TRVrwsITF4/08VWL3lnmNzeXHLCoB6GGezkgw52AAnEi7iMYU
         OVhqRAqlOA2T2q78oVkxMizPE6DhFLwRDwU8C3pgADouxAKG/fP07vGY3pmNGJBNJEM+
         cDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UDD7PJOLLYReV+ki1w4vWVhaqVdnK70fMH/aRuBsi+U=;
        b=kvsqIbQJ9GlJL9bZZ9st8nWczskjXvUQGNFlYpFYRBkHcmYlMyuQrZa8Igy1fmDvpT
         h+Y46LWl/O+8bqop0uH5ezZYvAV1KkdbOYvC9y84Q4eG1wSGq0NfkdsiAQm0+CR/KNx1
         0n5+20jjA2hbQ6DEdVfaVPndcTbfkZXKyv9Qse9IxeugSCpiQPrw4eLVlkFZMM0QWzVj
         y4DK5wFuf9YcU8H/t1dYbZwkPgCba5XmmozVblRCy5uODM2/w8I7uHkJL3y0fmyPzsb6
         k4h/DGAkz3CIf5b3ilALm9FYJpOFcgdCvYgYDmRoBs1QBugLRGDGRgvXn48Qr3dQ8UMk
         IZkQ==
X-Gm-Message-State: AOAM532UQBxodRYBkiX7r+Ydo+JzicDJZVn+W2RWsMfH9JNEnAyQtcif
	brf/1EXVbOIPFWcHTEqVkak=
X-Google-Smtp-Source: ABdhPJwIUfudclyVSUS4OIM+Wq5qc8wnqq6eG4UzeB9J9g6dbK3zWJSX32nnnjigVzYpJ7b4h3l69A==
X-Received: by 2002:a4a:98a4:: with SMTP id a33mr28096899ooj.21.1620831711875;
        Wed, 12 May 2021 08:01:51 -0700 (PDT)
Date: Wed, 12 May 2021 09:01:49 -0600
From: Connor Davis <connojdavis@gmail.com>
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] xen: Export dbgp functions when CONFIG_XEN_DOM0 is
 enabled
Message-ID: <20210512150149.nfzsgh3hnx7o7caf@ceres>
References: <cover.1620776161.git.connojdavis@gmail.com>
 <291659390aff63df7c071367ad4932bf41e11aef.1620776161.git.connojdavis@gmail.com>
 <0ef85b32-4069-4e94-0a2f-2325cd21510f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef85b32-4069-4e94-0a2f-2325cd21510f@suse.com>

On May 12, 21, Juergen Gross wrote:
> On 12.05.21 02:18, Connor Davis wrote:
> > Export xen_dbgp_reset_prep and xen_dbgp_external_startup
> > when CONFIG_XEN_DOM0 is defined. This allows use of these symbols
> > even if CONFIG_EARLY_PRINK_DBGP is defined.
> >
> > Signed-off-by: Connor Davis <connojdavis@gmail.com>
>
> Acked-by: Juergen Gross <jgross@suse.com>

Thank you.

- Connor


