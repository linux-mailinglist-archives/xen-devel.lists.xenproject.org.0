Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B61BBA30
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 11:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTMof-0002bQ-Ur; Tue, 28 Apr 2020 09:46:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0V7=6M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTMof-0002bL-06
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 09:46:13 +0000
X-Inumbo-ID: 17227152-8935-11ea-9846-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17227152-8935-11ea-9846-12813bfff9fa;
 Tue, 28 Apr 2020 09:46:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j2so23862577wrs.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 02:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vNPKI8dZx+Js36heDOFqxHvf7xx5J4kd02lTrLE7UPI=;
 b=b1Cm8uBfTYpROIbhjZGpG2r9opPWoq9HtJ5CqCox2Pe+08sHKX2t2NDKV6hW3FXB0n
 eKrL4sQ6NM/CIg0EDAUQpk1rrZj+yJH7WlSXxj47eY58+B6bnJvF9FvadWH0egbwOOR3
 Lj5PfJXLLqaOgvkL3Ix2UbZ1LpvJxNWl0VozL4mN/kmVOB07ib36emGQ+wE3etqco3Le
 A/0w5fXs11oRWtCWxl+Evgc95+ypOSZ22DE1vWtVDL2NXMgIGok5Dd1mKIFIH9Sf8R9M
 p6LVCrbFbjd38Dc0o7XBZjnXRNRG9/wBJUez7OlTXzK7KObnMu0VP5IJCi0MIQrzKi/Z
 KtqA==
X-Gm-Message-State: AGi0PuYEwzPTFSHBiIFji6JvC+8hYeEJjXpZYULprOnfFhQ4n2op8M8+
 8vLlTc2pWrH9aNW5nE+sFV8=
X-Google-Smtp-Source: APiQypJ8vaa3KS8dzpNzdFkGVM+VsA/aQpoiQf67GCHEgnmp15SwMEn7QVvlAm28il1KSyykw86hOA==
X-Received: by 2002:adf:8543:: with SMTP id 61mr30446313wrh.243.1588067170691; 
 Tue, 28 Apr 2020 02:46:10 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h16sm27739488wrw.36.2020.04.28.02.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 02:46:09 -0700 (PDT)
Date: Tue, 28 Apr 2020 09:46:08 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 01/12] libxc/save: Shrink code volume where possible
Message-ID: <20200428094608.7ynqp2djjmxcshzf@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
 <24093.61657.676890.721999@mariner.uk.xensource.com>
 <a10d1572-d5c5-716a-0651-aee2345348dd@citrix.com>
 <24231.5161.862828.377795@mariner.uk.xensource.com>
 <20200427195542.yiuvw4xgfjfzn6wh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <df22f0c7-0bca-ea42-976b-3de530cc83cf@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df22f0c7-0bca-ea42-976b-3de530cc83cf@citrix.com>
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 09:00:30PM +0100, Andrew Cooper wrote:
> On 27/04/2020 20:55, Wei Liu wrote:
> > On Mon, Apr 27, 2020 at 06:19:37PM +0100, Ian Jackson wrote:
> >> Andrew Cooper writes ("Re: [PATCH 01/12] libxc/save: Shrink code volume where possible"):
> >>> On 14/01/2020 16:48, Ian Jackson wrote:
> >>>> Andrew Cooper writes ("[PATCH 01/12] libxc/save: Shrink code volume where possible"):
> >>>>> A property of how the error handling (0 on success, nonzero otherwise)
> >>>>> allows these calls to be chained together with the ternary operatior.
> >>>> I'm quite surprised to find a suggestion like this coming from you in
> >>>> particular.
> >>> What probably is relevant is that ?: is a common construct in the
> >>> hypervisor, which I suppose does colour my expectation of people knowing
> >>> exactly what it means and how it behaves.
> >> I expect other C programmers to know what ?: does, too.  But I think
> >> using it to implement the error monad is quite unusual.  I asked
> >> around a bit and my feeling is still that this isn't an improvement.
> >>
> >>>> Or just to permit
> >>>>    rc = write_one_vcpu_basic(ctx, i);    if (rc) goto error;
> >>>> (ie on a single line).
> >>> OTOH, it should come as no surprise that I'd rather drop this patch
> >>> entirely than go with these alternatives, both of which detract from
> >>> code clarity. The former for hiding control flow, and the latter for
> >>> being atypical layout which unnecessary cognitive load to follow.
> >> I think, then, that it would be best to drop this patch, unless Wei
> >> (or someone else) disagrees with me.
> > I don't feel strongly either way.
> 
> I'm confused... I dropped this 3 and a half months ago, because it was
> blindingly obvious it was going nowhere.
> 
> This is the v1 series which was totally superseded by the v2 series also
> posted in January.

OK. I saw Ian's reply on 27th and thought it was still in progress.

Wei.

