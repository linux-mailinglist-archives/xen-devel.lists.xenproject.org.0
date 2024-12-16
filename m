Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E400C9F2C90
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 10:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857607.1269830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN729-0000P6-WD; Mon, 16 Dec 2024 09:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857607.1269830; Mon, 16 Dec 2024 09:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN729-0000MA-SI; Mon, 16 Dec 2024 09:04:57 +0000
Received: by outflank-mailman (input) for mailman id 857607;
 Mon, 16 Dec 2024 09:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3c03=TJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tN728-0000M4-6G
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 09:04:56 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0838499-bb8c-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 10:04:54 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-382610c7116so1847153f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 01:04:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8015f77sm7491465f8f.26.2024.12.16.01.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:04:53 -0800 (PST)
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
X-Inumbo-ID: d0838499-bb8c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734339893; x=1734944693; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1U0GFgEt/Un031CzGR3NNK8KlCEMGfo2Slq73A6rzmo=;
        b=qhprj//OXAFGphxrbzhEzwyc2o724cO/Y9QnDniYWd5ZcMHAhOdVjyG//+Bms5rLfi
         +U6jjVyMgQk1y96w8XFHdYjnhi1zlv570O5L3azLRHDqIyWckz9uE5RorbsYZNJU/qrD
         3Zpg50ellvZ4EI5sf9IwCYuy4f1Po5tVZ00j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734339893; x=1734944693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U0GFgEt/Un031CzGR3NNK8KlCEMGfo2Slq73A6rzmo=;
        b=i7jrli4wK2/nPdLkEUud1tBRdola78vEsP8Emqhx6sQw+sI192x+OCFEkM+QfwRrNV
         CJDLam7yHi+BONDvOFEFTRKI7Pv3cnBoiL+YfbuvV84VNf3VDNbF5kiv1u4LiroTukAs
         OQG4MyM+z1lE7TZ7TqXLYj+La9U4jBFZxbf49TcHYtsmo6h0NX4l7I2n+XC6xxaj3T3+
         P3r5XQcZa77Uppf1+Artp9EqVINEyMt9ZrLbzTLojoG/cqwbqBVaxC2HmfqCQ7+IjN8o
         eT9KZTF4hek41wovy8WEIDElsVoaVuI9QrSkb6FieAn6mFAAjXHvtWEgojyRinxxYOqZ
         jeGw==
X-Forwarded-Encrypted: i=1; AJvYcCVPl9nI4r4o7NDXE/WN0cOLKxXJLrayUop2jeSCXBM4gfU5w1vSVBQ2P8jBvSJV/KnSKbrq9lA4Bo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtrhIw9911UNP816x70np8PSFacKGs1U+dZa8e1TAutvfuFvjq
	IaLKTxS8Vi9vG1nyYKfA1RHOexVRd4J4+feJHQVSyEYCrODDQYOKZm6o2dle0Qk=
X-Gm-Gg: ASbGncv1PfjQCMz6ku+HsaNqEiATfqns866GNWQf1Xowycj0x/xztUz0U8zMMnFi/ka
	sbM8yMuyvIo5embW+x7nCHEcpS8AVIR/cnSdGbmXNw5cLs1rVtnexwQ9thfpMeggn2zm6P3P1/w
	lgLas6BhdDIM8Eq78F0DTfacFd0iYEwil8zTWEOwqAVv/6JG1QNlz4waL7cUg/mOTAMLrNSpbF5
	ZtisRU+O3VmD15aXgYnp2Da8CAXHI3bso6fO+J87WE0q9ZtGOwH5x1ZmI1zQA==
X-Google-Smtp-Source: AGHT+IG9ekZHp9Ot7ZpiIoFYsY1mxbEc8sCPIk6PIkvMnwcQFjmoEaXT5NwNQmpGkMq0mTT6gYrMoA==
X-Received: by 2002:a5d:6d8f:0:b0:385:e3d3:be1b with SMTP id ffacd0b85a97d-38880ae1392mr10247668f8f.28.1734339893517;
        Mon, 16 Dec 2024 01:04:53 -0800 (PST)
Date: Mon, 16 Dec 2024 10:04:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 00/35] Introduce NS8250 UART emulator
Message-ID: <Z1_tNLSg2vla6kY6@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <Z13I2xEJpkMouslw@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z13I2xEJpkMouslw@mail-itl>

On Sat, Dec 14, 2024 at 07:05:15PM +0100, Marek Marczykowski-Górecki wrote:
> On Thu, Dec 05, 2024 at 08:41:30PM -0800, Denis Mukhin via B4 Relay wrote:
> > The patch series introduces initial in-hypervisor emulator for
> > NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
> > 
> > In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
> > early guest OS bringup debugging, because it eliminates dependency on the
> > external emulator being operational by the time domains are created. Also,
> > there's no early console facility similar to vpl011 to support x86 guest OS
> > bring up.
> > 
> > The NS8250 emulator is disabled by default.
> 
> On a high level, why the mechanism used by earlyprintk=xen (IIUC i/o
> port 0xe9) isn't enough?
> Hyperlaunch can't start full (Xen-unaware) HVM domains anyway, so
> a requirement to use a Xen-specific interface for the console shouldn't be
> an issue, no?

I assume the point is to provide a minimal set of non-Xen specific
interfaces so that a guest *could* work if made to use only those
interfaces.  The 0xE9 hack is quite common for emergency printing, but
it doesn't allow for input, which the ns8250 does.

Thanks, Roger.

