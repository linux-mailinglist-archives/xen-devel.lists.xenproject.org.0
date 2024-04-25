Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572348B1B8A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 09:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711854.1112145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztFe-0004l3-Ku; Thu, 25 Apr 2024 07:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711854.1112145; Thu, 25 Apr 2024 07:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztFe-0004iR-I2; Thu, 25 Apr 2024 07:10:38 +0000
Received: by outflank-mailman (input) for mailman id 711854;
 Thu, 25 Apr 2024 07:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLQ4=L6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rztFc-0004iL-Rd
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 07:10:36 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e75d6bc5-02d2-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 09:10:32 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-437b3f256easo4200031cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 00:10:32 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 u5-20020ac80505000000b00437a02f67c5sm6586632qtg.49.2024.04.25.00.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 00:10:31 -0700 (PDT)
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
X-Inumbo-ID: e75d6bc5-02d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714029031; x=1714633831; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uhpVsAfIavWt+jrmV1GZoO2Si9nLAfRLaBBBTEWUrKU=;
        b=b2DbjycuUuIjTC3C+mdYECpjpqJIHyiC651FODjF5VTdbXde0TSLYzK+OHeV0t91qr
         J+WmErXaykuVhBtr2R0QoanXFudYw5q+jKVO7xR5qlWskQgNXEPjYY5LoprKAYoY1LOt
         ESN96j4svUQg7bD9fB1xH5xiSX0pNRUF+v818=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714029031; x=1714633831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhpVsAfIavWt+jrmV1GZoO2Si9nLAfRLaBBBTEWUrKU=;
        b=XsdCDx7+jzFgnzh6Tio61e4IncWnSC2WDy/QLZVUDEr7+BKTCIXqGoDFPwyzvYMCHZ
         PeaZu3PJ7HEusjtwkP4lv/WuV88QMLzWSSJXriv8yItYoC/eqiAGq2HNAMtParqgXOiq
         s9cuUb66lskK77gnvncqiTViWM7zHyEzjie2OYzTssgEIlC3DJKz+tjZfRA9B2S1kR8T
         f0iyxdH3pvzRoHW1P+HW7vj6YF2d2ljEwiNdLu6cvzZsykUVFHZzr/BzR00KSAjVOiBs
         8VkljafRSd66bnxhDkQyK/nIzOAZVDTZNlun4mB6OgTlEk8d8v+moVLN59LwtjsSs3rX
         6gXg==
X-Forwarded-Encrypted: i=1; AJvYcCWdj1Cz1QL06p6fpATuohXw7188agb4BCIiDwC0u7D+Kn8zqdLtUnBEfvalxuKA0esikeOrbBgQA3Ob9jl8zSx+t+e+1cyJ90Nexlr8zgQ=
X-Gm-Message-State: AOJu0YyEjsVg/LUWqxCYhIFyrTR1lthrQLUGyc2bz4EMCQCf97zR1nY5
	UxEuaSEaXBgMKnrX/4v20hfgUWUTphuLWyK9Mz9idCVSrIMQv2bDJU1q7AH/nQQ=
X-Google-Smtp-Source: AGHT+IEOytM6LT/zgyl7G2vBMVrADdnT8hwfBBaxlhFhMJgIF9h74+IWFkwxIH5GY60LZ/MYhpIioQ==
X-Received: by 2002:ac8:5f10:0:b0:436:f4a5:d612 with SMTP id x16-20020ac85f10000000b00436f4a5d612mr4645235qta.54.1714029031408;
        Thu, 25 Apr 2024 00:10:31 -0700 (PDT)
Date: Thu, 25 Apr 2024 09:10:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Message-ID: <ZioB5c6fVcateTbj@macbook>
References: <20240424191826.23656-1-dpsmith@apertussolutions.com>
 <9861a2f8-4a16-40f1-ab10-583101f922f1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9861a2f8-4a16-40f1-ab10-583101f922f1@suse.com>

On Thu, Apr 25, 2024 at 08:12:09AM +0200, Jan Beulich wrote:
> On 24.04.2024 21:18, Daniel P. Smith wrote:
> > @@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >      xsdt->header = *table;
> >      acpi_os_unmap_memory(table, sizeof(*table));
> >  
> > +    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
> > +    xsdt->header.signature[0] = 'X';
> 
> This is in no way "blindly". The size of the table elements being different
> between RSDT and XSDT makes it mandatory to have the correct signature. Else
> the consumer of the struct is going to be misled.

The "blindly" IMO refers to the fact that the table might already have
the right signature, but this is not checked, IOW we could do:

if ( xsdt->header.signature[0] == 'R' )
    xsdt->header.signature[0] = 'X';

Regards, Roger.

