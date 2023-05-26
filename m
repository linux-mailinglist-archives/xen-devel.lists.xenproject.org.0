Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26F712BA7
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 19:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540182.841763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2b5p-0004oP-1A; Fri, 26 May 2023 17:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540182.841763; Fri, 26 May 2023 17:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2b5o-0004lE-UV; Fri, 26 May 2023 17:19:08 +0000
Received: by outflank-mailman (input) for mailman id 540182;
 Fri, 26 May 2023 17:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EF2/=BP=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q2b5n-0004l8-5O
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 17:19:07 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 688c5b79-fbe9-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 19:19:04 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3093a6311dcso936100f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 10:19:02 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b5-20020a5d45c5000000b002fda1b12a0bsm5714002wrs.2.2023.05.26.10.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 10:19:01 -0700 (PDT)
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
X-Inumbo-ID: 688c5b79-fbe9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685121541; x=1687713541;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eqGxSIBES8XmrEgWWbBvNFGZokW+NPftAYdnxRGzyhg=;
        b=KYfwKhLF9AKtwMXTepu4DRRgVgzLuHYBlGPenk9W+lW0kS/WmrKKCuLwFW2Hmn5YlT
         KfSsWQ++xGRWL544zmAMQHFS5UdV3NgE5amL0yh15LlByHi8wwPlj/ipHFEtpGO0COtu
         TrQvQW5M3PcJqEdfcwhmeIo3Lb0lhy9F0XSeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685121541; x=1687713541;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqGxSIBES8XmrEgWWbBvNFGZokW+NPftAYdnxRGzyhg=;
        b=bU86WfWkEPJW0Tl94LAsch1sQ4wrN08KGhazHg+9TWk2ZZreqIhMZlRFK1c/7DG977
         awf6CxPOCdMBbZnmYq3rmaTNTL1rBui1Teero3ZkJpS28PztMv0E9JfhM8bKr/4Lhuxh
         iiKCbE/h04azYvqRCsvA5FM9KUu22+TJ4yBZwIEfnHkWUcYmjd7AoCCbwF3WrVy+Ao8P
         RgxnShsRZOrNEh6AfKlJd+gmc6qWsu3pW8u7JyT/lmsO0qeFvqoGos6AKRXEEDCtloUO
         0sxEIYTjQlTXUNEpONRe8rVq8pladOJ4/yRYqm1LX93vgjbP6HmbUlQMCQuuGFMljINk
         3K4w==
X-Gm-Message-State: AC+VfDzsjMYAVSQMfiH3dXTZQI9Y1HBsNEHd/UycfGfGUMSWGUnM6voa
	H8Ai8wdifgWjWaBg46R0WXRHPQ==
X-Google-Smtp-Source: ACHHUZ5wNVgMhbx7SwRgiA8GEr4oXwAWEHITbixCDJ0Rk0G4CSDh+vmCfAEvcYqx5ztfJU6ZtVW8Fw==
X-Received: by 2002:a5d:594a:0:b0:309:4d12:64e7 with SMTP id e10-20020a5d594a000000b003094d1264e7mr2059711wri.31.1685121541506;
        Fri, 26 May 2023 10:19:01 -0700 (PDT)
Message-ID: <6470ea05.5d0a0220.39cd9.4208@mx.google.com>
X-Google-Original-Message-ID: <ZHDqA0i3vZYyD9G6@EMEAENGAAD19049.>
Date: Fri, 26 May 2023 18:18:59 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86: Add support for AMD's Automatic IBRS
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-3-alejandro.vallejo@cloud.com>
 <CAKf6xptoZhWyxHUSQ3UiLz_ysRuC7gQ2xSTAXLBp008H5TX40Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xptoZhWyxHUSQ3UiLz_ysRuC7gQ2xSTAXLBp008H5TX40Q@mail.gmail.com>

On Fri, May 26, 2023 at 12:28:39PM -0400, Jason Andryuk wrote:
> >      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
> > +    {
> >          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
> > +        cpuid(0x80000021, &e21a, &tmp, &tmp, &tmp);
> > +    }
> 
> Do you need to check boot_cpu_data.extended_cpuid_level >= 0x80000021?
> 
> Regards,
> Jason

True that, yes. Will do on v2.

Alejandro

