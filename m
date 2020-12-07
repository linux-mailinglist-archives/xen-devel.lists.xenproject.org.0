Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F12D1926
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 20:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46948.83158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmLwg-0003jA-Fd; Mon, 07 Dec 2020 19:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46948.83158; Mon, 07 Dec 2020 19:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmLwg-0003il-Bg; Mon, 07 Dec 2020 19:13:14 +0000
Received: by outflank-mailman (input) for mailman id 46948;
 Mon, 07 Dec 2020 19:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0y+=FL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kmLwe-0003ig-87
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 19:13:12 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a03cd1b4-4776-483c-b591-2348ce19a3de;
 Mon, 07 Dec 2020 19:13:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i2so13881925wrs.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 11:13:10 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id u10sm195629wmd.43.2020.12.07.11.13.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 11:13:09 -0800 (PST)
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
X-Inumbo-ID: a03cd1b4-4776-483c-b591-2348ce19a3de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=mKImpMHefcGMjwuZymDE86va3HkD31kS1uQWZsITmds=;
        b=rfT/Ep6s4v0B1xbYfnA75do4KB6pJ0V7gW8HHP6HqNT4+mv6BVoIp8qJUmxkMdEpc7
         XqssnJYS2TtqWZJTIHyUHXEyPoZ9cQBrmCUxb4TMkU2JyK5ckegjowPLj6fjxRVvM8IX
         GAj1u7TvJBeXLrHSA355NYJXrAQiilhsfrBkEVyG53NEv6cKtrK0ABE4f6cbMl6B4PiI
         8Apz9wZIB0gAHHbS5VlsLCK0raQEgkEkr+b3JkmYWt7h7uhD4p8hCWsV5l/GAMUG+9Fo
         ghJjtwyFYmpHDJR6g1kn05Qg43sjiiXBmpAKZX7XUkWgYGyG8iZkzVKFS1kE/8Pk9LuX
         YZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=mKImpMHefcGMjwuZymDE86va3HkD31kS1uQWZsITmds=;
        b=nxniQ3knFQK5EWoqGGyR+P6jaMSMK6nSa9Nbw4G78ZQ8ysVxwX02T8uxWpBhrlolf7
         /8Keg3L6SdhkWQPa6NHEgArfctLCjRwoWbH33ePOeTNB9ha9i0SEf1hudTomBJCpL3u6
         uWhNkBnvvPQCst8LffzGaersvRU/7qrc/US5j9xOrbEsNMH/r4kCTqcEhSY7CKQxQeyN
         +59usKBwZWNOxfBiRpFFBVfmrhxTODsZidax5XYYfNMria1IlqN0bEE1ONQ8ZBAGZyK7
         X4K/S1KTJRgYK+XAnAX+DnKv4HepNC+gUvQtyEJX4cYRqWubs4P5FEDPUBRdw+AfL2so
         E4fg==
X-Gm-Message-State: AOAM533Ld5nR0031Oi7MoNUvd1YYPSFE+ffsTS9Mbu6fLZkcGi4FAq4Q
	iGnakDaTgELMYO+hfSZpKUE=
X-Google-Smtp-Source: ABdhPJxUNUMRg4txWxb/8/bsuceumcDwSZaTvlnQGXtEc1QkLnwk35GphjW3ed+ojEDRta9qcPAkjg==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr21526240wrr.122.1607368389799;
        Mon, 07 Dec 2020 11:13:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201203142534.4017-1-paul@xen.org> <20201203142534.4017-19-paul@xen.org> <20201204113413.iebyf2ldzq6rfpsg@liuwe-devbox-debian-v2>
In-Reply-To: <20201204113413.iebyf2ldzq6rfpsg@liuwe-devbox-debian-v2>
Subject: RE: [PATCH v5 18/23] libxlu: introduce xlu_pci_parse_spec_string()
Date: Mon, 7 Dec 2020 19:13:08 -0000
Message-ID: <0d2e01d6cccc$ffe23da0$ffa6b8e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLNnXLs2pPLw4H6lzH6w2mINWFu0wIe2fTUAq/cxhCn1+ivcA==

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 04 December 2020 11:34
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Ian Jackson
> <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: [PATCH v5 18/23] libxlu: introduce xlu_pci_parse_spec_string()
> 
> On Thu, Dec 03, 2020 at 02:25:29PM +0000, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > This patch largely re-writes the code to parse a PCI_SPEC_STRING and enters
> > it via the newly introduced function. The new parser also deals with 'bdf'
> > and 'vslot' as non-positional paramaters, as per the documentation in
> > xl-pci-configuration(5).
> >
> > The existing xlu_pci_parse_bdf() function remains, but now strictly parses
> > BDF values. Some existing callers of xlu_pci_parse_bdf() are
> > modified to call xlu_pci_parse_spec_string() as per the documentation in xl(1).
> >
> > NOTE: Usage text in xl_cmdtable.c and error messages are also modified
> >       appropriately.
> >
> > Fixes: d25cc3ec93eb ("libxl: workaround gcc 10.2 maybe-uninitialized warning")
> 
> I don't think d25cc3ec93eb is buggy, so this tag is not needed.

It is. If you supply the '*' for all funcs then vfunc_mask is set but func is not... so you then hit the assertion at the end of
xlu_pci_parse_bdf().

> 
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> Acked-by: Wei Liu <wl@xen.org>

Thanks,

  Paul


