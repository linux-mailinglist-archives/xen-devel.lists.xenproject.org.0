Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE536F4283
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528526.821808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pto0y-0005m5-Jw; Tue, 02 May 2023 11:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528526.821808; Tue, 02 May 2023 11:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pto0y-0005k1-Gr; Tue, 02 May 2023 11:17:48 +0000
Received: by outflank-mailman (input) for mailman id 528526;
 Tue, 02 May 2023 11:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87GZ=AX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pto0x-0005jv-1C
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:17:47 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f635e8cc-e8da-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:17:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3062d764455so1422740f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 04:17:45 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i11-20020adfe48b000000b002c3f81c51b6sm30625977wrm.90.2023.05.02.04.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:17:42 -0700 (PDT)
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
X-Inumbo-ID: f635e8cc-e8da-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683026264; x=1685618264;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VomCUlaJl3m0YlBSN4OcT3ZcH66VA7ob9EV/O6KH2dU=;
        b=LzNHvFazYiCArmtJom+ikLLfmpgZUamKXE8Mx3YK6bgWFZYwgkujK4qWP6VCaiA81/
         Y34bqw3bMIbxAgKEl6fiC9jtK5JurIeQiebK/e5MnX6LsFMR2zwJZXFnSfnmjo+NmpJE
         kCZHUfoiCc5baaKYibF+IiK0X6SCu1ovZ9H9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026264; x=1685618264;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VomCUlaJl3m0YlBSN4OcT3ZcH66VA7ob9EV/O6KH2dU=;
        b=lKvP6CLFXrjDhffoONiJCYpwkORLWiC5cGlec5zNjRrrWa3QjucNTZKnLaTwmNdSkV
         oD+UpD1mCGuM4ADstrYx5e0ipP9mtytPfip1YM6RWYaMjMuApsBjiiRSq4jy2FsNap7u
         OT4KUAU3rSKtTc3kEKBGwRCmv46g6S6aXqy2w6A+ur0XnSF0biIRqu6P3KYRKQ2obrAK
         x8istrXbX/bPblewME3p/BxXZlqfYZ+lRV2eu3R6YcuVLShY0ugGnFzYNAw6QHw5iZp5
         NTA43eVn1nTGzn4GbvUs8xADPmESrn46MhKmX/G/kaovnNWJQ7mIDqCD1X3YRWNHXj5w
         0HYQ==
X-Gm-Message-State: AC+VfDxNMhcE7sXbtJGWZQLwxsFt3xYx8yDVp/T9PbEHbrmWDW8AFsz1
	KlYTcFbahsztN4zgpaooKUeeA+SeUKD5KJHTG2o=
X-Google-Smtp-Source: ACHHUZ5vjG7WZuFwcmvJG5zNM7aqMQvYRrPW4JI92sg348uThIygvQVzwJ6k7BuBteoso9YXjaM3VQ==
X-Received: by 2002:a5d:67cf:0:b0:306:2bf4:4fe9 with SMTP id n15-20020a5d67cf000000b003062bf44fe9mr4679463wrw.55.1683026264035;
        Tue, 02 May 2023 04:17:44 -0700 (PDT)
Message-ID: <6450f156.df0a0220.8ce3e.2dc6@mx.google.com>
X-Google-Original-Message-ID: <ZFDxVGKFBJFmqezz@EMEAENGAAD19049.>
Date: Tue, 2 May 2023 12:17:40 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH v3 1/3] tools: Modify single-domid callers of
 xc_domain_getinfolist()
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502111338.16757-2-alejandro.vallejo@cloud.com>

On Tue, May 02, 2023 at 12:13:36PM +0100, Alejandro Vallejo wrote:
> xc_domain_getinfolist() internally relies on a sysctl that performs
> a linear search for the domids. Many callers of xc_domain_getinfolist()
> who require information about a precise domid are much better off calling
> xc_domain_getinfo_single() instead, that will use the getdomaininfo domctl
> instead and ensure the returned domid matches the requested one. The domtctl
> will find the domid faster too, because that uses hashed lists.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Christian Lindig <christian.lindig@citrix.com>
> 
> v3:
>  * Replaced single-domid xc_domain_getinfolist() call in ocaml stub with
>    xc_domain_getinfo_single()

My mistake here. It's supposed to have a "R-by: Andrew Cooper"

