Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0F87E6FA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 11:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694571.1083410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmA0c-0007TP-Gj; Mon, 18 Mar 2024 10:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694571.1083410; Mon, 18 Mar 2024 10:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmA0c-0007Qw-Cg; Mon, 18 Mar 2024 10:14:22 +0000
Received: by outflank-mailman (input) for mailman id 694571;
 Mon, 18 Mar 2024 10:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8te1=KY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmA0b-0007Qq-Hl
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 10:14:21 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48768d21-e510-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 11:14:19 +0100 (CET)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-69185f093f5so16687976d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 03:14:19 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 h12-20020a0562140dac00b00690ae7bbd05sm5147474qvh.72.2024.03.18.03.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 03:14:18 -0700 (PDT)
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
X-Inumbo-ID: 48768d21-e510-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710756859; x=1711361659; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ChSCFs7gjsrFACr4WWzhqhD9fd6bGDWozfU/Ai940s=;
        b=vUPXttR/FNeM7PvJg6l+0OE06RuCet2k7oEmCEFAXFw0QXhETeT/FdBxLyOpGrmAGA
         CRkgJIEKS+nD1SthKzcfrDzJREu0jJ3DBAIm0JPQIOwURGQe3/wa+y3yFAp7uvW/jGRE
         I2mtiypF/oTlGatHS4XT8WDoG6fA/HfupIm3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710756859; x=1711361659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ChSCFs7gjsrFACr4WWzhqhD9fd6bGDWozfU/Ai940s=;
        b=tob4p0CpJgd6bMna8mquM249E40KWl0aCDH4lMKFq0qfxRhilqn2acF5G+Z+9aCEGk
         HGxEjvtLXc4pElJ5agrC0OqF9X4+WUyGEA+HtY+X2uh2rfncK/zilNNZarzpRQ1/SM07
         KpIHw+ylfHiWwwyqaDNFyyOlbxtM77C8phjL40/dXSCY6S4D73Jzb2PHq8IsjUz4ypNk
         etq2lVwvtQ4oqhxN6qsIUZ0TWNJnxp7vlSYqfn0y3SMmgxIPNjsZ+R0qQfMEhG1doJKo
         6pycfrZLTP51x0jFwJrTZmX/OcR5GXPpJkYaF7v6X5wsLvvFals7vSnYpSGPrEDACFJz
         FVGw==
X-Gm-Message-State: AOJu0YyGNIhT5lsSmAaMtmShEEXGhqQNIryz91V/S4pqpv3SDcYrAQ54
	vtdMygCAB3UhKX0mPgEWhaxAdhDSRq/AOKWrO/VWmp5w7GbhMHg14T69d2QOLaQ=
X-Google-Smtp-Source: AGHT+IFV2DQe+CxyFV8C9VxxV9FGirK3JhMqzu0F0Ul4RPa4cgXDLtr5srjISknRzeAGDXGtRUDN7Q==
X-Received: by 2002:ad4:55e4:0:b0:696:2b3e:769b with SMTP id bu4-20020ad455e4000000b006962b3e769bmr58954qvb.56.1710756858732;
        Mon, 18 Mar 2024 03:14:18 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:14:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/vpci: Improve code generation in mask_write()
Message-ID: <ZfgT-H_MxHed04vb@macbook>
References: <20240315121322.3300387-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315121322.3300387-1-andrew.cooper3@citrix.com>

On Fri, Mar 15, 2024 at 12:13:22PM +0000, Andrew Cooper wrote:
> The use of __clear_bit() forces dmask to be spilled to the stack, and
> interferes with the compiler heuristcs for some upcoming improvements to the
> ffs() code generation.
> 
> First, shrink dmask to just the active vectors by making out the upper bits.
> This replaces the "i < msi->vectors" part of the loop condition.
> 
> Next, use a simple while() loop with "clear bottom bit" expressed in plane C,
> which affords the optimiser a far better understanding of what the loop is
> doing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

