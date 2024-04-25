Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A164E8B1BFE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 09:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711871.1112165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztdk-000359-MY; Thu, 25 Apr 2024 07:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711871.1112165; Thu, 25 Apr 2024 07:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztdk-00033d-Jq; Thu, 25 Apr 2024 07:35:32 +0000
Received: by outflank-mailman (input) for mailman id 711871;
 Thu, 25 Apr 2024 07:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLQ4=L6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rztdi-00033N-Of
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 07:35:30 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63b9b48b-02d6-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 09:35:29 +0200 (CEST)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-479cbfc62e9so286160137.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 00:35:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 g4-20020ac84dc4000000b00439c093ea95sm3172038qtw.23.2024.04.25.00.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 00:35:28 -0700 (PDT)
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
X-Inumbo-ID: 63b9b48b-02d6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714030528; x=1714635328; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIx2GdiXBMmxj4aTGE6F/DjfQxgS+dTrsY4KjI/BaLQ=;
        b=PNGIH4O6X8fu3zAw1b8K9SKzEVZ/yvnddHlKTheXB/2nD0WAgGn2JymS0RYbvyUL3m
         OniWz71/w9PB+4oWyFW3+Yx7PiM5nfm3vmZwDid9Cb/QcIYDodOXyt3mg6tkx9iQC62d
         hYfynSBygfME2g2f0IZuGjuXqy3vaKaoSqTaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714030528; x=1714635328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIx2GdiXBMmxj4aTGE6F/DjfQxgS+dTrsY4KjI/BaLQ=;
        b=FAFDpoy7xglOheH4KwSvcZcEnyUWgL90JCeA6nmBEcNo+KxUFdtJ2XjormW/TwxwnF
         Ohn+JsIVIVfBCbZqXudSuf59hdxnNScRhOlYwY0ZbVkwl6u+S5sz3xO+Ste0r+KWWQVw
         DvGH3dZhJJqiaTM8X7cpavCQETvkGmqPdSIONJL4gxJowGCQTJC2vsKb/9ndc7y4OrOF
         VAWmP0Cw15zL4I0Zbz8XL5GfIf/3ayPOZCYdt5P40Z0EEuf9J+i6YHmcV+lsVIMup0yB
         SiARoXTm8L8vfjUVy9cvAgDk64IMDTJiRCFG2P2PhgTnFrOugimgOm/2LaXYsbS5MpLE
         Id9g==
X-Forwarded-Encrypted: i=1; AJvYcCVK24acJl7BcH09f8DO8gjcyWKgPPnYfCtW9GL2qOXG8UURjNDGdGfbAnWDYLjPJR1KRPjxkgvz+tIM1WzCRV6V8sBx7MdoE7Rdd9BD6ZA=
X-Gm-Message-State: AOJu0YziFTZwgkQ2FgNc8Et+8MdpzX5dpvgVf+UzgOBA76i57YdpvtYm
	dnvRxC9aWIx9T3YwpaRHfR/qrLarEu1eev+hK1SifJjooxn8CemsxdzHCfC60Ac=
X-Google-Smtp-Source: AGHT+IGa386CgRD8dqp2QhuxGlxt9CtTFHfg4iibSoKypVBJSqoLgC/I0+HqhykbsjWLSAUmJHATrw==
X-Received: by 2002:a67:f884:0:b0:47b:d1c5:789e with SMTP id h4-20020a67f884000000b0047bd1c5789emr5511214vso.20.1714030528578;
        Thu, 25 Apr 2024 00:35:28 -0700 (PDT)
Date: Thu, 25 Apr 2024 09:35:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Message-ID: <ZioHvsX5yAbW452w@macbook>
References: <20240424191826.23656-1-dpsmith@apertussolutions.com>
 <9861a2f8-4a16-40f1-ab10-583101f922f1@suse.com>
 <ZioB5c6fVcateTbj@macbook>
 <adf9c5c2-ef6e-47b6-a29b-8765549d02df@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adf9c5c2-ef6e-47b6-a29b-8765549d02df@suse.com>

On Thu, Apr 25, 2024 at 09:26:59AM +0200, Jan Beulich wrote:
> On 25.04.2024 09:10, Roger Pau Monné wrote:
> > On Thu, Apr 25, 2024 at 08:12:09AM +0200, Jan Beulich wrote:
> >> On 24.04.2024 21:18, Daniel P. Smith wrote:
> >>> @@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >>>      xsdt->header = *table;
> >>>      acpi_os_unmap_memory(table, sizeof(*table));
> >>>  
> >>> +    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
> >>> +    xsdt->header.signature[0] = 'X';
> >>
> >> This is in no way "blindly". The size of the table elements being different
> >> between RSDT and XSDT makes it mandatory to have the correct signature. Else
> >> the consumer of the struct is going to be misled.
> > 
> > The "blindly" IMO refers to the fact that the table might already have
> > the right signature, but this is not checked, IOW we could do:
> > 
> > if ( xsdt->header.signature[0] == 'R' )
> >     xsdt->header.signature[0] = 'X';
> 
> Right, and indeed I was seeing this as a possible further interpretation.
> Yet given multiple ways of reading this, I'm of the opinion that it wants
> adjusting. ", ... unconditionally ensure it has ... " may already do.
> Simply dropping "blindly" would too be okay with me.

FWIW, I'm fine with any of the proposed adjustments.

Thanks, Roger.

