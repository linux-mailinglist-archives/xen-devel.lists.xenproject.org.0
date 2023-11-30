Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1087FFA93
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 19:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645112.1006976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8mEa-00042v-M0; Thu, 30 Nov 2023 18:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645112.1006976; Thu, 30 Nov 2023 18:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8mEa-000417-Il; Thu, 30 Nov 2023 18:58:00 +0000
Received: by outflank-mailman (input) for mailman id 645112;
 Thu, 30 Nov 2023 18:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8mEZ-00040z-87
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 18:57:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 606d8301-8fb2-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 19:57:58 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-333229dcebdso730581f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 10:57:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c311200b0040b42df75fcsm2677201wmo.39.2023.11.30.09.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 09:37:36 -0800 (PST)
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
X-Inumbo-ID: 606d8301-8fb2-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701370677; x=1701975477; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lcathtPMd/K6//oFMVQXSzN41+O54GUsjafhp+RF6U4=;
        b=K33ZTseW6aWQ+GUN3GkHperKIKvcOzRthxIFSni3LUwf5goVuK3QStvLZRTV7cokpM
         In38NS6V/A0o53WPVz1zIHEu0SWcWmADo+YXvmDrlb2DmnlV9T1AvRms7S2g2UK3CoT6
         DSP0XljPNzo6WKu2Y9ivCL+FuzDBq+b6HfOak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701370677; x=1701975477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcathtPMd/K6//oFMVQXSzN41+O54GUsjafhp+RF6U4=;
        b=Yxd16QIXSvGxOdFJXyvPP5SmDpv8A4M5cS8t2Zx5/iAWcW+R9xPPeD6QRW6RDi1lUe
         n81SaQvKZJgEASpl4h0qexsQpruIp8U03YemZFK9Rie5Ld6VQ0LS0EzswyEKLJzL8dhW
         5QTI7yJ27WW2LDaW1LAKgKFlrWRiXguztZ99zL0XAA/SHBT85NoNSkw1De9GFGPlUFsX
         j+/sIgCmlHyYB/X1WkoZQV88f2C0E+Yp4psHBbh7aLpea0zhyuXHtFyTa8XwnJUMqlS8
         6/7NiYFpo3E3pBCfl+d5581u3xJSMGMyHVuMfWCjrbFknKn9cjqfD8kM2qvJSUpcoeYE
         a8cQ==
X-Gm-Message-State: AOJu0YwBl6ZiM9SqOmygriTEn+cCPm/zx/CHGHx0Y9OlZQrilTJkJg8d
	V/+4LCtijbdjTbQ4cE2uflBTCLhfpGHEm7gRrs4=
X-Google-Smtp-Source: AGHT+IELsgRR2XV4U7ninKGiFM/shsuXV0t1HIW1G+Wy/nQjkAepd01DVR+4GOfodS4JEoEj5vLn1Q==
X-Received: by 2002:a05:600c:198c:b0:40b:578d:248e with SMTP id t12-20020a05600c198c00b0040b578d248emr2216wmq.27.1701365856857;
        Thu, 30 Nov 2023 09:37:36 -0800 (PST)
Date: Thu, 30 Nov 2023 18:37:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Message-ID: <ZWjIX0Jo5gW5SEDr@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com>

On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
> On 28.11.2023 11:03, Roger Pau Monne wrote:
> > The minimal function size requirements for livepatch are either 5 bytes (for
> > jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
> > that size by requesting the compiled to align the functions to 8 or 16 bytes,
> > depending on whether Xen is build with IBT support.
> 
> How is alignment going to enforce minimum function size? If a function is
> last in a section, there may not be any padding added (ahead of linking at
> least). The trailing padding also isn't part of the function.

If each function lives in it's own section (by using
-ffunction-sections), and each section is aligned, then I think we can
guarantee that there will always be enough padding space?

Even the last function/section on the .text block would still be
aligned, and as long as the function alignment <= SECTION_ALIGN
there will be enough padding left.  I should add some build time
assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.

While the trailing padding is not part of the function itself, I don't
see issues in overwriting it with the replacement function code.

> > Note that it's possible for the compiler to end up using a higher function
> > alignment regardless of the passed value, so this change just make sure that
> > the minimum required for livepatch to work is present.
> > 
> > Since the option (-falign-functions) is supported by both minimal required
> > compiler versions of clang and gcc there's no need to add a test to check for
> > its presence.
> > 
> > The alignment is currently only implemented for livepatch on x86, I'm unsure
> > whether ARM has a mandatory function alignment high enough to cover for the
> > space required by the replacement instruction(s).
> 
> Indeed I was wondering whether this shouldn't be generalized, if indeed
> required.

Well, more than required it's nice to have in order to avoid failures.
The checks in the livepatch code will trigger if there's not enough
space to apply the replacement code.

Thanks, Roger.

