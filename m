Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6C6A544B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503090.775246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvCu-0003Ve-Nn; Tue, 28 Feb 2023 08:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503090.775246; Tue, 28 Feb 2023 08:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvCu-0003TY-Kv; Tue, 28 Feb 2023 08:19:32 +0000
Received: by outflank-mailman (input) for mailman id 503090;
 Tue, 28 Feb 2023 08:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWvCt-0003TS-44
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:19:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eba5be0-b740-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 09:19:30 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-NX_PNXipPje3JThgadRm4g-1; Tue, 28 Feb 2023 03:19:26 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so6563821wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 00:19:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003e20970175dsm15603198wms.32.2023.02.28.00.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:19:24 -0800 (PST)
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
X-Inumbo-ID: 9eba5be0-b740-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677572368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
	b=hwVriYqOXDLEmq9D9ciyHLXTVf3PDLwysYlGbMx5IUuw0DIfCluUvSqUe7EmMEtYk95OA2
	WX8yDbc0r3D6hgW7frVtd3w+9C8eVJRVauj6mOkuMxRsRgJx/cVgCfkRrhPQh4yqX7MPHY
	eQD98/Zj7NAhFbtVgke0uly04sGqWxc=
X-MC-Unique: NX_PNXipPje3JThgadRm4g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hz5AGTBN9eryZg3nZeMjxA9itLfbrKU7K0S/m+pqIE=;
        b=gnqL3QjbDZqMsTDg4oUshwKeXigOtgFwJIGWqHXVYbFOHdRAka8XG8dbumqfOIwvks
         EH+R3YMfY1kz5C9i/ezaeSA3dJexAMKUe2V4B2PLT9X51LBFe4h/rvvNXKHR7ZsmSuNv
         ocHFiHeVRoh3xmbs6aoz/2Hs+bpD8zVSCqcHsXjJuc+u3TJOS3ICZJOfBCAZqYhjmm3+
         io4Hm/F6os1qDAS+2oZiHY8FHLLH/q6LSy+LPaC6fkCOWRnJiQ2y3oymy/EGd1R/RUOc
         eJRrFekTfTEyirBIqcza6jkPuNUvws54Tw9fLlS3cIwC+vHGDZbsQICQZq8+ZKvuA7DX
         CKAA==
X-Gm-Message-State: AO0yUKViU0CzufAqXTf+RElGEaaRlpQNHf66nyQpNma8kGcr5VXA08bh
	jYzvV7ZS7KfW30dyTC71/ZMLxFOhf5y2YPylbwOcXy6MjCjFhGXz+rGq7XguRmXj7/0Pz6Wu8yi
	cUoQzYNlnvfqAWI9+lLlzQPa97GA=
X-Received: by 2002:a05:600c:18a2:b0:3eb:4162:7352 with SMTP id x34-20020a05600c18a200b003eb41627352mr1641543wmp.23.1677572365489;
        Tue, 28 Feb 2023 00:19:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8MhRkZ82bCO1bCO62bz1qOyJGqKvLzP3Zce+ps0g0WYqtWG4J8YWNdNhuZ9T91hDRDN92U1Q==
X-Received: by 2002:a05:600c:18a2:b0:3eb:4162:7352 with SMTP id x34-20020a05600c18a200b003eb41627352mr1641531wmp.23.1677572365194;
        Tue, 28 Feb 2023 00:19:25 -0800 (PST)
Date: Tue, 28 Feb 2023 03:19:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228031026-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
MIME-Version: 1.0
In-Reply-To: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > I feel like we should have separate deprecation entries for the
> > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > although they're related they are independant features with
> > > differing impact. eg removing qemu-system-i386 affects all
> > > host architectures, not merely 32-bit x86 host, so I think we
> > > can explain the impact more clearly if we separate them.
> > 
> > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > a superset.
> > 
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> someone is still using QEMU usermode emulation
> to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!

I don't know - why x86 specifically? One can build a 32 bit binary on any host.
I think 32 bit x86 environments are just more common in the cloud.

> > In fact, keeping this support around forces correct use of
> > posix APIs such as e.g. PRIx64 which makes the code base
> > more future-proof.
> 
> If you're concerned about PRIx64 and friends: We still continue to do
> compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> run in the CI.
> 
>  Thomas

Yes - fundamentally 32 bit does not seem that different from e.g.
windows builds - we presumably support these but AFAIK CI does not
test these.


-- 
MST


