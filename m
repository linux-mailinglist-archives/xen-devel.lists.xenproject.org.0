Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5498563E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803663.1214363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOCt-0002Eb-Qw; Wed, 25 Sep 2024 09:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803663.1214363; Wed, 25 Sep 2024 09:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOCt-0002BQ-O6; Wed, 25 Sep 2024 09:21:11 +0000
Received: by outflank-mailman (input) for mailman id 803663;
 Wed, 25 Sep 2024 09:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stOCs-0002BK-Ou
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:21:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c9279ba-7b1f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 11:21:03 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so815759266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:21:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5414csm189843566b.68.2024.09.25.02.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 02:21:02 -0700 (PDT)
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
X-Inumbo-ID: 7c9279ba-7b1f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727256063; x=1727860863; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXg/S+lEQTG5a06qTDSkRFJh7ErUeco6pnynsRr8KGs=;
        b=aKGdfx5RO45RjKf/rmLBuiyHnXVDgvOtKwJyinQVXfFyi+Z4ITum2wMMaWmUjWloAS
         bVnzBBNOEGhmZ5jOTE/+364Te+PS0f/s3C5u1DSGfhoS7/Er2nMwc9WErK0dDnWWNrXG
         G+F3XG5XFFaGxChBMGCMfNsvDh4TGw2V6Mi8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727256063; x=1727860863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXg/S+lEQTG5a06qTDSkRFJh7ErUeco6pnynsRr8KGs=;
        b=T0w4W0hRMu92HcSP+r/W35xDjciHPmM+RoQADeML2iNKD46+kFlDzCCCYb8ZSE+gYN
         XAltfEYcIc2ULm5cvi6dquCl+0sCw6Cth4BS2DBjSpt6QGbqp1bsEJjnm3wCDMdhcRAN
         ojlS2WBn7xaylDH/o/Mb7egK12cjj6AUTIQkFycTGrYRHtIY2ngMiXk/nnWcJ+ZrUER8
         pMnuYtRukG5p+A/MDmiw7f8cWOvp6XjWY6WEaNELXPMUM7JOSqEjGHvZc/kIAc0dyIY9
         Ym3kWP5jz/z5nyA2BWl8dFJrEa1Ljb709gpKFo3BBpf5dPuVu964qvp3ccQC+iNrLD6d
         tJGg==
X-Forwarded-Encrypted: i=1; AJvYcCUm48J5qDRkqlX9hF9lxMUrjJtwEHGMtAx1vAZVgbuocU4pTsdURdYmLns/evcVKQ4RdMy3dA0f5IU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBL0AHNZx/Dhdmce/eygF6CPSU/f6o1OW9ddkA9KDZfDf5wcsN
	/RduQRTkn2yfnVnt7qfIoPq1NsV3+4t+UVl91feeyGAIsoWkACVgOoQ4WOolksQ=
X-Google-Smtp-Source: AGHT+IF1LoAQ9UYjoXlHMWaqLTwZgbeNX0CX6Vqq34xUpzc34K/3WBJlHmFu7ekePUqyzU//fK7jAA==
X-Received: by 2002:a17:906:f5a9:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a93a033056dmr192669566b.7.1727256063144;
        Wed, 25 Sep 2024 02:21:03 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:21:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/6] xen/livepatch: remove useless check for
 duplicated sections
Message-ID: <ZvPV_RCrVFGgheu8@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-2-roger.pau@citrix.com>
 <a54b0309-4820-4371-818e-0ef0a0912743@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a54b0309-4820-4371-818e-0ef0a0912743@suse.com>

On Wed, Sep 25, 2024 at 10:52:06AM +0200, Jan Beulich wrote:
> On 25.09.2024 10:42, Roger Pau Monne wrote:
> > The current check for duplicated sections in a payload is not effective.  Such
> > check is done inside a loop that iterates over the sections names, it's
> > logically impossible for the bitmap to be set more than once.
> > 
> > The usage of a bitmap in check_patching_sections() has been replaced with a
> > boolean, since the function just cares that at least one of the special
> > sections is present.
> > 
> > No functional change intended, as the check was useless.
> > 
> > Fixes: 29f4ab0b0a4f ('xsplice: Implement support for applying/reverting/replacing patches.')
> > Fixes: 76b3d4098a92 ('livepatch: Do not enforce ELF_LIVEPATCH_FUNC section presence')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Just to clarify for my eventual picking up for backporting: Despite
> the Fixes: tags there's no actual bug being fixed; it's merely code
> simplification. So no need to backport.

Indeed, no strict bug, just useless code (unless my analysis is wrong).

Thanks, Roger.

