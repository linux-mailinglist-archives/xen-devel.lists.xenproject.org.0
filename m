Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E771C121A
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUfP-0004wC-Tx; Fri, 01 May 2020 12:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUUfO-0004w6-Mm
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:21:18 +0000
X-Inumbo-ID: 41d7efc4-8ba6-11ea-b07b-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41d7efc4-8ba6-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 12:21:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k12so5779492wmj.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 05:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5CHXKIyohMZDKbjmQPTXencN2ra8/x2Ql2B8ZH/3B0o=;
 b=Jdna3m9zpdDKI3EexOZNNnWvLRBwbCMk4u5RjNbC4wvGdZS1tnncDsaT075ydJhyoM
 LIWUqtz4a3V1SyL9Rjanmm1SCiWFLZYl82zRBxB6/31IzAAgWrnjHXCWgmZ5upyH3jQ3
 B7ZWRc/aTmH06CiP8EfAem+CVMfXQ71ElM5Dd/LWuuCoizq6QK+vIRMPwkQKKGXc0tmX
 E+eLPYBCpuQOVXMf5/Jwvt1Y2lfyGtOovH/xQpNN8vlaKjIdzQzqpvzoDfVztJ96h2z9
 o5AsiG4KTt6e46azHDIc/Nqybi8b6iKII3aPvgAgUMQfdboWBovh7FOg1UJZalbdb2H3
 oeqQ==
X-Gm-Message-State: AGi0PuYkTZWLeyvfWa2r52Q7ZwIkECeGZ+7jHaPuwvcjD0nnSxOqwnaB
 +9TiB7TMr7PdpuJFfuGYEpw=
X-Google-Smtp-Source: APiQypIwlu4XHrcJkuUwYdro3qzejLcxA7pxZWuQESFWx7Wi91bz1z137uN+UC0O8lWK1hZUQU1YKQ==
X-Received: by 2002:a7b:cb88:: with SMTP id m8mr3766435wmi.103.1588335676989; 
 Fri, 01 May 2020 05:21:16 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u188sm3783472wmg.37.2020.05.01.05.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 05:21:16 -0700 (PDT)
Date: Fri, 1 May 2020 12:21:15 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HyperV: correct hv_hcall_page for xen.efi build
Message-ID: <20200501122115.dfbcpczxtiragkzo@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <c45d6098-a4e1-b565-4180-cc6da433dc57@suse.com>
 <20200501121746.7t6xtvtu2w5l5oxb@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fb545dac-43a9-cda8-f1a4-1b716308f8d2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb545dac-43a9-cda8-f1a4-1b716308f8d2@citrix.com>
User-Agent: NeoMutt/20180716
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 01, 2020 at 01:19:39PM +0100, Andrew Cooper wrote:
> On 01/05/2020 13:17, Wei Liu wrote:
> > On Thu, Apr 30, 2020 at 12:24:15PM +0200, Jan Beulich wrote:
> >> Along the lines of what the not reverted part of 3c4b2eef4941 ("x86:
> >> refine link time stub area related assertion") did, we need to transform
> >> the absolute HV_HCALL_PAGE into the image base relative hv_hcall_page
> >> (or else there'd be no need for two distinct symbols). Otherwise
> >> mkreloc, as used for generating the base relocations of xen.efi, will
> >> spit out warnings like "Difference at .text:0009b74f is 0xc0000000
> >> (expected 0x40000000)". As long as the offending relocations are PC
> >> relative ones, the generated binary is correct afaict, but if there ever
> >> was the absolute address stored, xen.efi would miss a fixup for it.
> >>
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Acked-by: Wei Liu <wl@xen.org>
> >
> >> ---
> >> Build tested only (and generated binary inspected) - Wei, please check
> >> that this doesn't break things.
> >>
> > I don't have time to verify this in next couple of weeks, but I will
> > surely notice if there is a breakage.
> 
> FWIW, the resulting assembly is identical, so it surely will be as fine
> as it was previously.

Thanks. That should be okay.

Wei.

> 
> ~Andrew

