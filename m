Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2E6F1869
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527320.819828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNTj-0007Fu-S1; Fri, 28 Apr 2023 12:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527320.819828; Fri, 28 Apr 2023 12:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNTj-0007Co-OX; Fri, 28 Apr 2023 12:45:35 +0000
Received: by outflank-mailman (input) for mailman id 527320;
 Fri, 28 Apr 2023 12:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psNTi-0007Cg-EI
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:45:34 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90af33cd-e5c2-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:45:33 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f625d52275so9469358f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 05:45:33 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b002ff77b033b1sm21021014wrr.33.2023.04.28.05.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 05:45:32 -0700 (PDT)
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
X-Inumbo-ID: 90af33cd-e5c2-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682685933; x=1685277933;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CPPLZGllxogODxD/PVNpAMECSxpd7F8e1+DC4KSwfXU=;
        b=ftc7pjM1VxG3C6fcoI0q0pI7waJGLslNGT9WeiqvT172xDh9kEwFxlLivj+4ekH4zu
         8BpfJNeD0hDu18ZQaob4qRKVTPG3/sD354IxONy1je2haKsH6QI1uAPPHDrNAnQacLtg
         pHY5I5E0dEqKOkyhql1eQO2GK9cXYdfx5UAP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682685933; x=1685277933;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPPLZGllxogODxD/PVNpAMECSxpd7F8e1+DC4KSwfXU=;
        b=IfY2iqrLYgQfByQhiEbd88ki4RaW6KjDcZ8/YcRhwPbjV48vBoQiA3E2sHTjBvBR8Z
         Eo4KRKpHmPHtitxZrVT7eamH9ZRfjJV7DTAhSmsDfqY/EpBVno1H7x1rHMP0p/NvCi4M
         qje4lLdMI8HMjSDeufpfcf1/qH/Hbeg21mgg42AzzCSHuWSRjUIVjwhRUvenaP7PS7ww
         TLbEfeE2l8wAih9cmbNFIvTYhkCKmXbCqrIGqlovSqIOjK20uO6VLhiqJXaRCzUrkEG+
         0M8OrfPyYDRsUMC+RuWrThbx0hj/2CHJbJtm2LBWuotLErXEvZi9P0oDjErEcz+8wPwO
         Cdlg==
X-Gm-Message-State: AC+VfDwc1Kfv/G8bRpHNe4Cfxm39AvKZJBLx+j2vCqQY8oHW/Eig/LFP
	+fJW2J2si8/s3i5x/qPhfgO0oQ==
X-Google-Smtp-Source: ACHHUZ622D/ODo8CwhixTjH626Gk3gSCLFN2Mi4mmjXDtK0cISb1oWJyIqFQ/RXg/i9NoSGO10/Eqg==
X-Received: by 2002:adf:e6d1:0:b0:303:ba27:4366 with SMTP id y17-20020adfe6d1000000b00303ba274366mr3401582wrm.49.1682685932859;
        Fri, 28 Apr 2023 05:45:32 -0700 (PDT)
Message-ID: <644bbfec.5d0a0220.4f622.d428@mx.google.com>
X-Google-Original-Message-ID: <ZEu/6f1YHOTof4UY@EMEAENGAAD19049.>
Date: Fri, 28 Apr 2023 13:45:29 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.org>
Subject: Re: [PATCH v2 4/7] tools: Make init-xenstore-domain use
 xc_domain_getinfolist()
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-5-alejandro.vallejo@cloud.com>
 <8b7b7fe0-f814-ba53-eca9-a9341665cc7f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b7b7fe0-f814-ba53-eca9-a9341665cc7f@citrix.com>

Sounds good to me.

Cheers,
Alejandro

On Fri, Apr 28, 2023 at 01:40:50PM +0100, Andrew Cooper wrote:
> I'm recommend having a comment here, saying something like /* Commonly
> dom0 is the only domain, but buffer a little for efficiency. */
> 
> Because this is also the justification for why we don't need to ask for
> 32k domains at once to find XEN_DOMINF_xs_domain in a race-free way.
> 
> Can be fixed on commit if you're happy with the adjustment.
> 
> ~Andrew

