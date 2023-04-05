Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2EE6D7809
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518360.804811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzOD-0001ES-HK; Wed, 05 Apr 2023 09:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518360.804811; Wed, 05 Apr 2023 09:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzOD-0001Cn-DI; Wed, 05 Apr 2023 09:25:13 +0000
Received: by outflank-mailman (input) for mailman id 518360;
 Wed, 05 Apr 2023 09:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=enMU=74=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pjzOB-0001Bs-UJ
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 09:25:11 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2698ef1-d393-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 11:25:10 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id x15so33319475pjk.2
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 02:25:10 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 c16-20020aa78c10000000b005e5b11335b3sm10217060pfd.57.2023.04.05.02.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:25:00 -0700 (PDT)
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
X-Inumbo-ID: c2698ef1-d393-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680686708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsJ1Pr7QDcgnVIhypGgV7+tj/tswyw0N5/Rm+NWo9rw=;
        b=pzmB7sUauULhFlJsutjbD5Pd+oLKsT4Xw/RxGQioknnTrxEKEet7YPNeeXCYoj/zme
         pqze3Hx8gl7n+YUq4EyKvVLtoFjBWsHsUiTy7ZEanhOSqYAk3/2AlNH8kavrYPFGtT4q
         Zurgcbc94KYYFAwVtv4YiUV5dlMEtKrVK2Tx7EUAn65NJVcQH7oikRAT4CA4zp204nJX
         3lEt1kyMTHXyiaCunAMqsWyIjyMKedvtl18qi6y/Ce04nulNI/5ngUn0P5AvLuRfhTBk
         8AhLO3UvrQWwjlbAM+Oe+UgIhr2k61l8XZFuPn2e3xohwbVsXiKG7ijBEb3f5DtFCRTr
         bHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsJ1Pr7QDcgnVIhypGgV7+tj/tswyw0N5/Rm+NWo9rw=;
        b=E+897j5D3nRltUS4Y++PhYrdiXGEfElbj4U/9HqVYghtKQSskbQQsV2DigfZW4syNQ
         LDSrJ3eELlCAdNKBr3XGMDlRLxf1qiyGXpjwaxjuUBjLxuM3SrsD9zxb0kNU2fQwK3wn
         PieGgFUJMdP03Gk1so69DH2dQ5LsWrlFT+5K+cagKSyoTAYkMkBdE24dsg6JRpvJoaXQ
         /C5PeIXGGlNggAJwXxzuZ+xXgzAT3E017g/KatKKKeBRIVjPr15giriZwf11l5G0GVN0
         OLUbJaM5aJ6QEOywkI2g5SxsDasX96cWJsNYLP/F0jdwUpH46CFShWhqbbKrBZwSQpPK
         jBng==
X-Gm-Message-State: AAQBX9chiB3H55lRft0rIaiov4o5pxzwHmJmp0T8KduzKsX2G6LzMFe5
	gcn7nGuDzhlLTCbagJ8XkOXDNA==
X-Google-Smtp-Source: AKy350axzbppMO9pJvbe8uQWRrvT0Q70A5UqfDWeL56uAno2xeYPmJ3cO0Ki+RfnZn5B2CjkZP3wag==
X-Received: by 2002:a05:6a20:b728:b0:d8:bed9:33cf with SMTP id fg40-20020a056a20b72800b000d8bed933cfmr1816252pzb.17.1680686708638;
        Wed, 05 Apr 2023 02:25:08 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:54:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Juergen Gross <jgross@suse.com>, stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xen.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V2 1/2] docs: Allow generic virtio device types to
 contain device-id
Message-ID: <20230405092457.m6bi2yvv7s2nasxv@vireshk-i7>
References: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
 <37fa3d37-5ee7-863c-48cd-1ce313c8e296@gmail.com>
 <20230405085115.dayqa6mrkac372sb@vireshk-i7>
 <b523597b-40b8-7368-4742-9dbce06b4633@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b523597b-40b8-7368-4742-9dbce06b4633@suse.com>

On 05-04-23, 11:15, Jan Beulich wrote:
> On 05.04.2023 10:51, Viresh Kumar wrote:
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1608,8 +1608,10 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is
> > 
> >  L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
> > 
> > -For generic virtio devices, where we don't need to set special or compatible
> > -properties in the Device Tree, the type field must be set to "virtio,device".
> > +For other generic virtio devices, where we don't need to set special or
> > +compatible properties in the Device Tree, the type field must be set to
> > +"virtio,device" or "virtio,device<N>", where "N" is the virtio device id in
> > +hexadecimal format.
> 
> Are "virtio,device0x1a" or "virtio,device1A" valid, too? If so, all is fine,
> but if not, constraints on the hex representation may want mentioning.

From [1], both above are invalid. Updated doc as:

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..24ac92718288 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1608,8 +1608,11 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is

 L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>

-For generic virtio devices, where we don't need to set special or compatible
-properties in the Device Tree, the type field must be set to "virtio,device".
+For other generic virtio devices, where we don't need to set special or
+compatible properties in the Device Tree, the type field must be set to
+"virtio,device" or "virtio,device<N>", where "N" is the virtio device id in
+hexadecimal format, without the "0x" prefix and all in lower case, like
+"virtio,device1a" for the file system device.

-- 
viresh

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/virtio/virtio-device.yaml

