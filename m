Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384BA105A5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871234.1282272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfGL-0005cN-LQ; Tue, 14 Jan 2025 11:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871234.1282272; Tue, 14 Jan 2025 11:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfGL-0005aw-IM; Tue, 14 Jan 2025 11:39:13 +0000
Received: by outflank-mailman (input) for mailman id 871234;
 Tue, 14 Jan 2025 11:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXfGJ-0005aq-W0
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:39:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba8a9ef-d26c-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:39:10 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fdafso10995227a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:39:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9904a411csm6093109a12.72.2025.01.14.03.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:39:09 -0800 (PST)
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
X-Inumbo-ID: 2ba8a9ef-d26c-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736854750; x=1737459550; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8L9HH4K3xM0f6COjLZ16d2gapCO+SXHjhH+Cg7BPtVI=;
        b=I55Z6V+UwGtzkzmuevQyirUSkSMYHssKHWzXawJCd5nbxj27+AakLFwDaRe23yC/pC
         7wx4PdbDRXEOKbQQx1NlidDAukb7EyO0fZyzWOTkBSltAV50PKsJFkUjV0j6k/R29Q+8
         TWGmgakAZdBavtMOFFLF0O8ZICXcg5J91Fd7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854750; x=1737459550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8L9HH4K3xM0f6COjLZ16d2gapCO+SXHjhH+Cg7BPtVI=;
        b=Ms/3wvkFJbtsjTTFeoQvyDVz7N3cxUNp7qynU21cZRwd7+n5GBIxP/okGZVDsHD4pZ
         ZYdMaxHjM9Pz8w67DHxISpua5B6koU51FQSEEOus/nxP84Bd3vw9VSGn7SR3S++zuv+z
         ziuoaNu1zlPyFvZNLC9MBah5KiLCo49uTKQDkbQlvqfdimTqK9mTqX1N06M4psx75eGw
         XH3SfgymCnveI0+2/8iPjxWdDUkWRPDlDCmNz76zXpFtGCjEHYfOpGQM24kMbAkEdpkY
         FnGcLjX1hPy4eQtrzk2vELlsPNo0aI+0pdk6gStbLIDgC9V1OPhM6T+CDdoGM3Z4qqnZ
         nMsg==
X-Forwarded-Encrypted: i=1; AJvYcCXoN3Ndv4i+I05+T0u4Q0nnzVG2O4LK4Cr1xJKEOMLFC6+bSx87dcxH9pcWiFll+rtEH3K4D58O6xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpROeIuSNckEEmBezavQWTHWDMtB0CRrUwIWRGwNjekABhKJv4
	sZBlA+Uyjtg+NRTGUx9FLgfyWazDiabUl1C0RCLsJFHz+wUgQngn8ARj4EtOUyYWQpOnda5sXSe
	a
X-Gm-Gg: ASbGncsY6HmYIooI2f+qt2jFBXvTMsPcf04hNOnFJknZr6QFfCrTMMtaMTDzS5WtRZq
	QRRMlpbcqu7Wxt87vxQ8b1oXVHFB36rqOeLK2SN47K4/ALe16szELx1PwhXx/4ZT6O0Dqv56vIU
	fPCq2zFBvke4MzxltTY/pA/kvDdzSU3XVyGBCl9ZlaYB4kRcq5y0HXYxxROtRj6iYVW4bTXnkul
	uoQibExHDpbcJvC0+8k8S/xevGIpBU4x8K2/4wjK6Gglg4bViaiOIuFRPUlnqQHwD8=
X-Google-Smtp-Source: AGHT+IGMmTqPfnaQeOydPkuHGM4z2RFHBAvyZ+jn/83ik0QSga4uqVnrxWWkMxvq4ANA1Ju7kFS18g==
X-Received: by 2002:a05:6402:1ec7:b0:5d0:81af:4a43 with SMTP id 4fb4d7f45d1cf-5d972d2063amr24771773a12.0.1736854749858;
        Tue, 14 Jan 2025 03:39:09 -0800 (PST)
Date: Tue, 14 Jan 2025 12:39:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] automation/eclair: make Misra rule 20.7 blocking
 for x86 also
Message-ID: <Z4ZM3Er9dxqiUPNo@macbook.local>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-3-roger.pau@citrix.com>
 <Z4ZI-WfUv73iQLI1@macbook.local>
 <54a6f4337e2f9bfc1f295b3c1e9a0897@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54a6f4337e2f9bfc1f295b3c1e9a0897@bugseng.com>

On Tue, Jan 14, 2025 at 12:24:30PM +0100, Nicola Vetrini wrote:
> On 2025-01-14 12:22, Roger Pau Monné wrote:
> > Hello Oleksii,
> > 
> > This is in principle ready to go in now (I'm currently running a
> > private Eclair scan to ensure the patch is still OK against current
> > staging).  I would like to ask for a release Ack.
> > 
> 
> One nit below, which I overlooked initially
> 
> > Thanks, Roger.
> > 
> > On Tue, Nov 26, 2024 at 10:35:08AM +0100, Roger Pau Monne wrote:
> > > There are no violations left, make the rule globally blocking for
> > > both x86 and
> > > ARM.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > ---
> > >  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > index 755ea3271fc9..cb4e233e838d 100644
> > > --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> > > @@ -80,6 +80,7 @@ MC3R1.R20.2||
> > >  MC3R1.R20.3||
> > >  MC3R1.R20.4||
> > >  MC3R1.R20.6||
> > > +MC3R1.R20.7||
> > >  MC3R1.R20.9||
> > >  MC3R1.R20.11||
> > >  MC3R1.R20.12||
> > > @@ -116,7 +117,7 @@ if(string_equal(target,"x86_64"),
> > >  )
> 
> this hunk will not apply because it uses MC3R1, rather than MC3R2. Should be
> an easy fix.
> 
> > > 
> > >  if(string_equal(target,"arm64"),
> > > -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
> > > +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6"})
> > >  )
> 
> here as well

Yeah indeed, I had to rebase the patch:

https://gitlab.com/xen-project/people/royger/xen/-/commit/538439d59dc338ee3861bf1bc056783671ba1fc2

Let's see if Eclair is happy with it, currently running a pipeline.

Thanks, Roger.

