Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC7211D96
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 09:56:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqu4e-0000C2-UQ; Thu, 02 Jul 2020 07:56:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrbb=AN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqu4d-0000Bx-Sv
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 07:55:59 +0000
X-Inumbo-ID: 7710e6be-bc39-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7710e6be-bc39-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 07:55:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f18so18912155wrs.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2020 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=SsiUrbkHvdCOcSEjELxpX5iwr73P/3ya/uIpJCFbC3I=;
 b=bnMx8r9YJKQmc88fFbS0cZUxUQcemyrtU+7GWKEDxxFJ9IcuN3cEngEFUGk/x0Zo8i
 G3CCJJY1sZFnIytmxHEsa8CNhRKVe+fazKmDlGYZGEWby1qNFPtlIo41exh1vxY89ycD
 5my6HPfIpgF+MYDbIED3giM5dkIxOw7mxlrbmjoxAU/QqXIZXTQo8Of5+RZWQ7K93zJc
 334hwM7jSshVQr0q/jcH767xovSEDpKwhbrQQoWoBdgTsxxoa+gZutzIE+KlndwqYgc4
 2DE0N9IChQSFDuYAppxmEWhT1+UVlmW6o4nUmXaKohgBOROkHY+6Ae03SQ6UINwcHdPb
 85pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=SsiUrbkHvdCOcSEjELxpX5iwr73P/3ya/uIpJCFbC3I=;
 b=kJrnnKM4tzPMGInOKOdkKgd9ikT9pKEy024K0kENa6oV8rxiQpfEj+OpEAX+rWpA62
 MEtr9AjjeZWUYVU5cOEDQvT0HigxcNChUewhGfFt3OCGVG1ahOHZ03lHNIl9vTYiLiDR
 K3ZToI9uMRE2/RokdWHRvj0ADNJVS/1ClM6ThEjiP8mBFYPRsnLBRFQFCQtz+88Kf/N1
 wW4g54L2o6/s0WtYbcvO3H91qmzamVU9nAGPIwF0IW9LbMVTjN9xhnF8GZdHI/9qyqkO
 sVNpTz4BB0CwRdUZ4Qnhukbfm+UuK+ULQT+jJbShOtMj8rZ9F9BDFLIwsegH4uBy2ZVH
 w04Q==
X-Gm-Message-State: AOAM532XXhIXwyOLJvQ7NPSzYACpzty2NNZ1ZQOyG3uA9QtaWK+J8f93
 RDvT8SYu/cSzyvfT50cM4x8=
X-Google-Smtp-Source: ABdhPJzipGUEhIrMnr3TXyx5pQDCx0MQOSLuimItM0TC2LZz1mWOQ+1ce6EfheNsIAc2w5lReEmHGQ==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr29393011wro.126.1593676558100; 
 Thu, 02 Jul 2020 00:55:58 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id j4sm5384723wrp.51.2020.07.02.00.55.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 00:55:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
 <20200629163027.GA2030@perard.uk.xensource.com>
 <50b573f7-a0eb-fda8-d88b-d9786faf541e@suse.com>
In-Reply-To: <50b573f7-a0eb-fda8-d88b-d9786faf541e@suse.com>
Subject: RE: Ping: [PATCH] build: tweak variable exporting for make 3.82
Date: Thu, 2 Jul 2020 08:55:56 +0100
Message-ID: <001e01d65046$384224c0$a8c66e40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIaxjOh7cGNy1dVRAvK3itPt2/NmQIeq8zPAbAfezCoTIkcsA==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 02 July 2020 08:45
> To: Paul Durrant <paul@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>; xen-devel@lists.xenproject.org; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian Jackson
> <ian.jackson@citrix.com>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: Ping: [PATCH] build: tweak variable exporting for make 3.82
> 
> On 29.06.2020 18:30, Anthony PERARD wrote:
> > On Fri, Jun 26, 2020 at 05:02:30PM +0200, Jan Beulich wrote:
> >> While I've been running into an issue here only because of an additional
> >> local change I'm carrying, to be able to override just the compiler in
> >> $(XEN_ROOT)/.config (rather than the whole tool chain), in
> >> config/StdGNU.mk:
> >>
> >> ifeq ($(filter-out default undefined,$(origin CC)),)
> >>
> >> I'd like to propose to nevertheless correct the underlying issue:
> >> Exporting an unset variable changes its origin from "undefined" to
> >> "file". This comes into effect because of our adding of -rR to
> >> MAKEFLAGS, which make 3.82 wrongly applies also upon re-invoking itself
> >> after having updated auto.conf{,.cmd}.
> >>
> >> Move the export statement past $(XEN_ROOT)/config/$(XEN_OS).mk inclusion
> >> such that the variables already have their designated values at that
> >> point, while retaining their initial origin up to the point they get
> >> defined.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/Makefile
> >> +++ b/xen/Makefile
> >> @@ -17,8 +17,6 @@ export XEN_BUILD_HOST	?= $(shell hostnam
> >>  PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
> >>  export PYTHON		?= $(PYTHON_INTERPRETER)
> >>
> >> -export CC CXX LD
> >> -
> >>  export BASEDIR := $(CURDIR)
> >>  export XEN_ROOT := $(BASEDIR)/..
> >>
> >> @@ -42,6 +40,8 @@ export TARGET_ARCH     := $(shell echo $
> >>  # Allow someone to change their config file
> >>  export KCONFIG_CONFIG ?= .config
> >>
> >> +export CC CXX LD
> >> +
> >>  .PHONY: default
> >>  default: build
> >
> > That patch is fine and it is probably better to export a variable that
> > has a value rather than before the variable is set.
> >
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Paul - thoughts either way as to 4.14? If not to go in now, I
> definitely intend to backport it. (And in fact I'm meanwhile
> considering to enter a make bug for the behavior, unless its
> behavior has changed in later versions.)
> 

I agree with Anthony's statement so I'm happy for this to go in 4.14.

Release-acked-by: Paul Durrant <paul@xen.org>



