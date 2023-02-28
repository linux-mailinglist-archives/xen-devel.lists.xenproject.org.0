Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350F6A614A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 22:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503778.776081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX7am-0002xa-Su; Tue, 28 Feb 2023 21:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503778.776081; Tue, 28 Feb 2023 21:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX7am-0002vc-P3; Tue, 28 Feb 2023 21:33:00 +0000
Received: by outflank-mailman (input) for mailman id 503778;
 Tue, 28 Feb 2023 21:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pX7ak-0002vW-9R
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 21:32:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75291569-b7af-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 22:32:54 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-bV_qQ1ywMRWLi8AcHUkkow-1; Tue, 28 Feb 2023 16:32:50 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso4728984wms.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 13:32:49 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 w15-20020adfee4f000000b002be5bdbe40csm10742578wro.27.2023.02.28.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:32:47 -0800 (PST)
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
X-Inumbo-ID: 75291569-b7af-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677619972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
	b=ZEVBf1UwYtMW9eUpGkDrsmOMrmPUweSfGu0FrlJzw/V9vLtvmfWkpjmIutzVi6LeNhnkjg
	/njyLueejpLTeKJ3IXHIcE6aOBUj0oxIN0/O8zYaVujvZezKShF3dH6wNVr5KvWWYTthEw
	It2ABeWxaTaES+FKYKVEgu+wIjra1uY=
X-MC-Unique: bV_qQ1ywMRWLi8AcHUkkow-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677619968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pc860YSulk9fikEVG+B4aKAm8X5/+wGLcWnCvldhAU=;
        b=GrHroGHYewL//Vh5nDySKa6cM64tyIpX6pIoUj1VucY0JSW3mKb7wNapbI/5Y4xVes
         14bjud2wCNhsqkrPhPVcSimF/aaEoC9S9um0cja0efvRsn3BRY3MVCP8ArYNlbrFZBm2
         KNLCb6UnMRt5Wnljx1WkJvk/l5EBrfm3L4k96FJhO+zjL/LVuQJLaQ2Dza6wspnOmso+
         XFWO9l5Duqt5zXZB27stQkxN7AbpRo5lwekzenmw4sUhhnJp/UREVzqK/F7guQyx6JK7
         iPBODNNAUAC2YufjWGJ76xX7pb+mE0rpCMtfr7erIOkQacu0hEcm2lVy+SJdcAle4cd7
         UCfQ==
X-Gm-Message-State: AO0yUKXcBqpxy0vvnd4Ib792xOKreAjnVK6yrUn+a+ObuP14sH34QFcV
	XhKQI/7WEEELUVGic9a+WwF6zzGbBWy3YKVbFNSfvqZxQjFkPrGlJNoWLn2ZpRVgn6347TTkAz+
	TQwltgzRpnh1RJeqtO3PoWwXo6Ng=
X-Received: by 2002:a5d:67cc:0:b0:2c6:e827:21c1 with SMTP id n12-20020a5d67cc000000b002c6e82721c1mr3043369wrw.50.1677619968656;
        Tue, 28 Feb 2023 13:32:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+qz21qmC81CB8YlJDWkxwTaOAI0Hras+SGhZGbBgfG8gObN7oaGqTNlhYS4sY6pCkJX1a75w==
X-Received: by 2002:a5d:67cc:0:b0:2c6:e827:21c1 with SMTP id n12-20020a5d67cc000000b002c6e82721c1mr3043357wrw.50.1677619968315;
        Tue, 28 Feb 2023 13:32:48 -0800 (PST)
Date: Tue, 28 Feb 2023 16:32:43 -0500
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
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <20230228162938-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
MIME-Version: 1.0
In-Reply-To: <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
> Well, without CI, I assume that the code will bitrot quite fast (considering
> that there are continuous improvements to TCG, for example).

We have lots of hosts which we don't test with CI.  They don't bitrot
because people do testing before release. This is what RCs are for.
We did releases before CI - it is a cost/benefit thing.

-- 
MST


