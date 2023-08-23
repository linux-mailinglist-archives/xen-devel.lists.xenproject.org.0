Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC507859AF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589248.921084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoAY-0004if-H2; Wed, 23 Aug 2023 13:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589248.921084; Wed, 23 Aug 2023 13:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoAY-0004gn-Ch; Wed, 23 Aug 2023 13:45:10 +0000
Received: by outflank-mailman (input) for mailman id 589248;
 Wed, 23 Aug 2023 13:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PRN=EI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYoAW-0004ge-NK
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:45:08 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 458a6801-41bb-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 15:45:07 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-319559fd67dso5121270f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 06:45:07 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m14-20020adffe4e000000b00317b0155502sm19537353wrs.8.2023.08.23.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 06:45:06 -0700 (PDT)
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
X-Inumbo-ID: 458a6801-41bb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692798307; x=1693403107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ5GaiT0sZIp6gIQXTOGRDxpxHA+t700hx68Ehib/FM=;
        b=eyEhnZwjhRY3GGR9zHAUSh8FAimxzhZZ0xIBDGW330ZnbI3GQgh7XEC0YWeKqFrqtN
         J0Yd2wGDgh3Efb9uNtJ5qrg7d8RZ3u6OAuGyLcOgPHsbHa5Pk1D0WTgoaF1mplbVW0ii
         iEEFWhKP9Vv4AG2nejz3ghzpT8DmjeSXx7iyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692798307; x=1693403107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ5GaiT0sZIp6gIQXTOGRDxpxHA+t700hx68Ehib/FM=;
        b=cr22UJn2IHUHDnYA8whZ42a8ZUkOh7HXYWlud6ImptM/FUnMx90881hS2Vcnk+qIqG
         OPlyYgI98TDEAxPmVQKpGCgLtHLVq5USKnSU8Idj0ujZnhf8eLNdveKeOX0uMJ27zieK
         Xni8Rw++FRVnPgvtVWQijFdNdzJnEoPJQ9KF3LS52cZwD1y4JAkCml9eCr1Ax0ck30i4
         0f7lEuFymr65niZPEec8frWb3qM/OqI2RhJFmSRsr0fFs88myUPgrdaVHw39Mrcnv2FZ
         JORwPPN+vTyBr4CCwT0GE/R1PQjn7L7fDNNkU6lZBRqOpVbzYymr6+nQK9Ogb3bjLlaO
         bwRw==
X-Gm-Message-State: AOJu0Ywu9LVIV5ZvumBS/V7SHdhHxw5CRp1T9Bf8qruZhxbArI/p86rn
	P/GjdzS0MEM7EKeOlCAP/guSbQ==
X-Google-Smtp-Source: AGHT+IHlDzZY0UEI+cOAySVz9M9j3Ruhqgy5Q3zcqNJDHw5JH8pFHDk8WTco/aHUkWkskzqkNXR01w==
X-Received: by 2002:adf:e6c9:0:b0:31a:e744:1297 with SMTP id y9-20020adfe6c9000000b0031ae7441297mr9031737wrm.50.1692798307200;
        Wed, 23 Aug 2023 06:45:07 -0700 (PDT)
Date: Wed, 23 Aug 2023 14:45:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libxl/CPUID: drop two more feature flag table entries
Message-ID: <0fec10d1-b56f-416e-a417-b887a3219fea@perard>
References: <1517da3b-7d39-47b9-2714-d97dac217678@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517da3b-7d39-47b9-2714-d97dac217678@suse.com>

On Wed, Aug 23, 2023 at 09:21:26AM +0200, Jan Beulich wrote:
> Two entries were left in place by d638fe233cb3 ("libxl: use the cpuid
> feature names from cpufeatureset.h"), despite matching the generated
> names.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

> ---
> Permitting "psn", "ia64, "cntxid", and "perfctr_*" when the hypervisor
> doesn't even know of the bits (perhaps wrongly so) is kind of odd as
> well. Permitting bits like "est", which the hypervisor knows of but
> doesn't expose to guests, is also questionable.

I think those are just aliases, to a specific bit in a bitmap. Even if
we remove those aliases, it is still possible to instruct libxl to do
something with those bits. So there presence isn't permission, I don't
think.

Looks like "est" is just an alias for "eist", so it doesn't seems useful
to remove it either.

Thanks,

-- 
Anthony PERARD

