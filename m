Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7288C242
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 13:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698069.1089386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp62G-0003x8-6W; Tue, 26 Mar 2024 12:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698069.1089386; Tue, 26 Mar 2024 12:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp62G-0003uY-3K; Tue, 26 Mar 2024 12:36:12 +0000
Received: by outflank-mailman (input) for mailman id 698069;
 Tue, 26 Mar 2024 12:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqC6=LA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rp62E-0003uS-7S
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 12:36:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c011c50-eb6d-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 13:36:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so4016843f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 05:36:09 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h8-20020adffd48000000b0033e9d9f891csm12050734wrs.58.2024.03.26.05.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 05:36:08 -0700 (PDT)
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
X-Inumbo-ID: 6c011c50-eb6d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711456569; x=1712061369; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+hwKwu0ruHBXxrEFzZRjvvf/lXSF9n+LBaptyNnfWM=;
        b=bkYEY7f41qnbcS94V16wCAhzkeoFY/gK4EqiiddmqiZOitJ94L4qlnLNbuW7+imqn5
         iIy+liO5CVZSvqutvTJ/hxQPm05i2LK+9dOala5sv/+ecuTuldJ9wBwgKLQ0euTCDNHM
         dNVizolWakMJW8j22Vl0aPTQgJco4k1Tx2Xig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711456569; x=1712061369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+hwKwu0ruHBXxrEFzZRjvvf/lXSF9n+LBaptyNnfWM=;
        b=fk9crRTFv1HPe+K0kes2m+dDS0XKNRqc53yK/gCxWCA6SVQj9L19q9aezc8P01ydM7
         DljMhYYjW1DjqHbYP4UdD7DKtAzsK0xw871wlvU40YSb7k2bxW4EBSLy5qfMYton3onS
         /u/U/buus8GvAAq4qK2+HdL5VSpxdfFhpIPT7+2u1FBTUT+y2FUYtvSoE6mZTAuTN62C
         dkXtQIviecwG7MQkDftD+haep38OoYo+vbY5nwyXgZo5IMLqvcRiFEQlahUG0aThgQKQ
         VozTKbBujAc5pJqeDNizFm/N+eUuZSVzxzuCTHeF/hluxVosXcb2yqpWU7qyBQXZpJM+
         jTyw==
X-Gm-Message-State: AOJu0YwQxsjXRzRkvqBdYGieLVpxSRmUfmzQvMDug3SDtr/UijLl1Btv
	if2bLwveO1tIVsr7CvOd/E25aYOgWT70Xfa1rKoyBm4UksnG8gWXXKjmjyxvvQM=
X-Google-Smtp-Source: AGHT+IGCvPFlnWFHY9SDZ3aI6Yq1801F2+hIdWw+MiAsvaIxj3eWv7UlWMUbQN3jbQ+/D8huizg1FA==
X-Received: by 2002:adf:fa41:0:b0:33d:82d3:42ff with SMTP id y1-20020adffa41000000b0033d82d342ffmr1086032wrr.21.1711456568706;
        Tue, 26 Mar 2024 05:36:08 -0700 (PDT)
Date: Tue, 26 Mar 2024 12:36:07 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 33/36] make-flight: Keep using buster for L2
 guest in nested tests
Message-ID: <5dc0e5ad-497c-4906-84d4-4f248ab01578@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-34-anthony.perard@citrix.com>
 <ZfsbwjQkSmToBLKW@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZfsbwjQkSmToBLKW@macbook>

On Wed, Mar 20, 2024 at 06:24:18PM +0100, Roger Pau Monné wrote:
> On Mon, Mar 18, 2024 at 04:55:42PM +0000, Anthony PERARD wrote:
> > When starting the installation of the L2 guest, L0 kills L1. Switching
> > the L2 guest back to Debian Buster works fine, so do that to prevent
> > regression in the test.
> > 
> > Part of the logs from the host L0:
> > 
> > > domain_crash called from arch/x86/hvm/vmx/vvmx.c:2770
> > > Domain 3 (vcpu#0) crashed on cpu#4:
> > > d3v0 vmentry failure (reason 0x80000021): Invalid guest state (2)
> 
> Hm, I guess we need this as otherwise the changes themselves won't
> past the self-push gate, but this is just masking a real issue.  I
> would be tempted to (after the switch to bookworm has gone in) revert
> this and force-push it into osstest, so that the failure is visible.

That means that we might have to force-push on every branches. Or fix
Xen.

Thanks,

-- 
Anthony PERARD

