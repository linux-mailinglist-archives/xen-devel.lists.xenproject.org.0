Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6739A6B8F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823560.1237571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2t3G-0000u7-Ss; Mon, 21 Oct 2024 14:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823560.1237571; Mon, 21 Oct 2024 14:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2t3G-0000ry-Pn; Mon, 21 Oct 2024 14:06:30 +0000
Received: by outflank-mailman (input) for mailman id 823560;
 Mon, 21 Oct 2024 14:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2t3F-0000rq-J9
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:06:29 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa9e28b8-8fb5-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 16:06:28 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0f198d38so629167066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:06:28 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571effsm209087766b.146.2024.10.21.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:06:27 -0700 (PDT)
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
X-Inumbo-ID: aa9e28b8-8fb5-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729519588; x=1730124388; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jsZXFlBMqxSTtYGLAh95eBqBynSmQcybucP6zaMjq0=;
        b=SA0N9IG22BQFVmHIn2twV90wkwMzjfkJxg5M1T1ZkN3RvuxIGCNCsASvnc1P2L11ua
         jQ/q6ov5KlvkfgHE2JPqk0cYgRykchaf9eH/BgdY8GsVAYGE+JaMEvqQGQYR0pVbsvbf
         8F69g9LnAAsuu91f93LqkDFddgaSzGAS4snMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519588; x=1730124388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jsZXFlBMqxSTtYGLAh95eBqBynSmQcybucP6zaMjq0=;
        b=Xl06aULQH9v74H6EaqPhMAuf2Nqfv2oDEFYEIiV54HTCBgPgbH1YpvZvkka15nT+AN
         secOTuuiDOumzdqJR728gX4Bx/zhqJVsSTCsw7OJOoBjMBQbpUS0ISkJof0ZqQaGZVmQ
         L3V9welaEswf631R/5iF5gYXN+4OopY0+tsh7/UHxUEJK/ZFHwnK2n2iwuG5NRw/g3x6
         8vARPZDyDHqxl2IbGsIXTYhH5aUjHo68GwN37D8tlllQhOaBZOQ386LQjE9ATQDBStXz
         K7eRSUKkFbbcuP1lNRYZMMKmxhdI+ffAm/qOrQV7RjQzQdHMqvumEGfKwrlctgBEEBHX
         WgZQ==
X-Gm-Message-State: AOJu0YzEm3cGsPweQNOqw7iKHMUxAzzEE7b2xRKzetFrdLsp1R3v0qxD
	s2e7Vfimh7GFPlb0+IWQn9kTXVpPfdbVu3JZDEiKsrWoCkmMVgqE0zzmjrZqRg+YNBcu0xDKfFD
	B
X-Google-Smtp-Source: AGHT+IEG5Ay8edcw37ltFjcEYpuYUMityeyy7sOfVD47MJftVYzHKV+c9dsrxzQzTqBADrwP8+hhYw==
X-Received: by 2002:a17:906:dc94:b0:a88:b90a:ff30 with SMTP id a640c23a62f3a-a9a69c6a786mr1107554466b.50.1729519588157;
        Mon, 21 Oct 2024 07:06:28 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:06:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxZf4nHFhhfyMF12@macbook.local>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <10e0f567ab3be0eae4c6473326da3a6d369ba8ff.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10e0f567ab3be0eae4c6473326da3a6d369ba8ff.camel@infradead.org>

On Mon, Oct 21, 2024 at 12:34:37PM +0100, David Woodhouse wrote:
> On Fri, 2024-10-18 at 10:08 +0200, Roger Pau Monne wrote:
> > When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> > repurposed to contain part of the offset into the remapping table.  Previous to
> > 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> > table would match the vector.  Such logic was mandatory for end of interrupt to
> > work, since the vector field (even when not containing a vector) is used by the
> > IO-APIC to find for which pin the EOI must be performed.
> > 
> > Introduce a table to store the EOI handlers when using interrupt remapping, so
> > that the IO-APIC driver can translate pins into EOI handlers without having to
> > read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> > unconditionally when interrupt remapping is enabled, even if strictly it would
> > only be required for AMD-Vi.
> > 
> > Reported-by: Willi Junga <xenproject@ymy.be>
> > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Hm, couldn't we just have used the pin#?

Yes, but that would require a much bigger change that what's currently
presented here, and for backport purposes I think it's better done
this way for fixing this specific bug.

Changing to use pin# as the IR offset is worthwhile, but IMO needs to
be done separated from the bugfix here.

> The AMD IOMMU has per-device IRTE, so you *know* you can just use IRTE
> indices 0-23 for the I/O APIC pins.

Aren't there IO-APICs with more than 24 pins?

Thanks, Roger.

