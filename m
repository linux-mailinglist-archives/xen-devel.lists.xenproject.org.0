Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C58CD69F
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 17:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728637.1133650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9zn-0002Xf-5V; Thu, 23 May 2024 15:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728637.1133650; Thu, 23 May 2024 15:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9zn-0002W7-2d; Thu, 23 May 2024 15:04:43 +0000
Received: by outflank-mailman (input) for mailman id 728637;
 Thu, 23 May 2024 15:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA9zl-0002Vx-KT
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 15:04:41 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6bb7b32-1915-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 17:04:39 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-43de92e228aso38280301cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 08:04:39 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43dfd2dbd68sm174303961cf.12.2024.05.23.08.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 08:04:38 -0700 (PDT)
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
X-Inumbo-ID: c6bb7b32-1915-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716476678; x=1717081478; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4RC/7hDBTJxRMcKjmn3dodba7GsHJMDnhBM2/N+I+0g=;
        b=Dmewu2NtL5hlwT96zhjNNXruAmRjB7ESqxjNiffNyPR/vpJ7oSeH0/AtNSP/nY32oc
         /IQO5uqT+rNbC7LbIXUOMft3Arm51Zqq6MRsOi+k3g5jTkTI5LqEpnq0zaucEYiLUR/t
         26LOPdOO00WkCckWJgbtQ1wAqpsFxFk8arCRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476678; x=1717081478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RC/7hDBTJxRMcKjmn3dodba7GsHJMDnhBM2/N+I+0g=;
        b=LAhCUWDh5XMQAZ24FVwZAOFPGbPCaSVYCIGNOE3C4KfPcFMYQMY1VxoCmi9ePYOG+i
         BdgcWRJydDQBTqaWNtNfT2iONnv5RLtClfOFa5jHhrausgLFg96g4Cz8+hZG2lZiNij+
         S/rEOa0Ga5janlN/wZrc2u3TbGytyZJL1ROf7WgKmtu91P7KpZ+bWaEA13GZkm3K7qMt
         YWD/M8tLLJ81WFwA44auA55+LdvqN42ZK2k0aH1ik5WleVrAg0pIs0KSH27qo22Gk74O
         n2ySLDrTTLjOOn9im2Lx1ITpLKi3p+7KGEV2/B5i1xDXIfCBt77b6tvPDcPiQ8OqAXev
         XD0w==
X-Gm-Message-State: AOJu0YxUogImfG4h6PrWLpX6u8MN7U+f6/Po2cvW9Ybl0/duyhlPXVlk
	5zY0kgaob1VJn0TibVAJuJ/oYAXQyeaHdTtx3SFqaEtZk9Z9jTVAQEgcJwY5yj8=
X-Google-Smtp-Source: AGHT+IGSPFAw39UwAbeQZYJZzHIAevWVDJcWio1ULwXv/mQgrM16tXd3SFQo2Nr+yzNuUbefo79Yhg==
X-Received: by 2002:a05:622a:1114:b0:43d:fa8f:53c1 with SMTP id d75a77b69052e-43f9e194e45mr49003441cf.64.1716476678465;
        Thu, 23 May 2024 08:04:38 -0700 (PDT)
Date: Thu, 23 May 2024 17:04:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH 4.5/8] tools/hvmloader: Further simplify SMP setup
Message-ID: <Zk9bBFmVkkWcLz3E@macbook>
References: <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
 <20240509175057.1921538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509175057.1921538-1-andrew.cooper3@citrix.com>

On Thu, May 09, 2024 at 06:50:57PM +0100, Andrew Cooper wrote:
> Now that we're using hypercalls to start APs, we can replace the 'ap_cpuid'
> global with a regular function parameter.  This requires telling the compiler
> that we'd like the parameter in a register rather than on the stack.
> 
> While adjusting, rename to cpu_setup().  It's always been used on the BSP,
> making the name ap_start() specifically misleading.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

