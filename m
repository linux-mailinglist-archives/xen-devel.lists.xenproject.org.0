Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF9EAA0C03
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972491.1360844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kNo-0008T6-8U; Tue, 29 Apr 2025 12:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972491.1360844; Tue, 29 Apr 2025 12:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kNo-0008Rd-53; Tue, 29 Apr 2025 12:48:20 +0000
Received: by outflank-mailman (input) for mailman id 972491;
 Tue, 29 Apr 2025 12:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9kNm-0008RX-8z
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:48:18 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3840605d-24f8-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:48:17 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-736dd9c4b40so6094936b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:48:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b15fa80f2dasm8862671a12.59.2025.04.29.05.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:48:15 -0700 (PDT)
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
X-Inumbo-ID: 3840605d-24f8-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745930895; x=1746535695; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64JWQR85rVF2sFxlW6E6lX1F3hvV8gab+VHsV8820Zg=;
        b=QWu/i8q7F4iSjSw+R3Uk7g3bUb6C7a7QPuJzehXHs6hG7DmdiWyQHAGA12/fCvTGap
         n12cOxsWtbKlVdAvrs22v9Fo4QEPQIJExCFXbdJ6o0jbP8i1SjWo/UPJM6dYx+kmSuTr
         Lc4lkQv6cEJR5jFMjXXZxE+CsYUJduNbjzzKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745930895; x=1746535695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64JWQR85rVF2sFxlW6E6lX1F3hvV8gab+VHsV8820Zg=;
        b=t0id2Iuv+dm4eE/oDN9Mku1SBtgNIXuFoVur1DWz0qNc+WumKIkflsgS6h62ADc1rG
         1cstxRVEMTPA5tBP4B9y3ix2OyDlfxGS9YuLuZ38ypzF++z8wFa67VJAs94v9LCjLEJm
         MCJk3NMwDf12mlimFvFggW+pNEPDYO+/HYZuLm3JMk5yl5yBRHPEKXfQlWKPgsva/LS9
         u9jGjw5pQWe42ZyqTo3kUtXHB5dSIEq9ho3RYoLGgIMQRDVJK7sE/+RPCuDKn644um1z
         z31MImN7xrrSiav1LkhBiM6BmJYZ0gJay0VyJrucTlDR/dBdWaKBmUaDaez81lmFyi61
         UGgQ==
X-Gm-Message-State: AOJu0YwZaE0Zk2VdtPSkQ9ZnXEom6ez5xX4QhDDhseV7FShFPjI+RGu5
	mnQzRrK6aojJOKof2GtdVhN24lrhPNscy+A8FP0K3F2xSZV1mzTKB6K5Zwp7e5Vf2OZ+X1GL2mc
	S
X-Gm-Gg: ASbGncsIJRyWeFdSw5hEUhRFsDdtwrGBRo30c9Mg1B+LJpHpwdsvVPlOZ5Cs/482AHn
	rvSj957FucJ4f/XihS+Too4jIUbUjTfzR1tUnbvpZtbbHnO1oBo0VFhdTeZ5tbyjTnxbk3KBurU
	NtFHebeJqFqDWjssv6knnOujxon2I/z2Qmjns1A2tRAyqp9gEZtI3gGcDApNvLJirFPzT4NI02n
	kqNqzVfoQ69EYAgw1ilLNHpPaXnRXLYt65JYvHaVj90U8jXhXshtscdgiNMJ1o5z+4nnkKK0kHh
	kykXNNBFbnyt/qG073//ote2RItocp0ltfVm9xFcSMIhjA==
X-Google-Smtp-Source: AGHT+IFlS3ff0wBePdANwC+1H8guEfvq1DcOykobk0/WxSVJjACNKorMFaQWDh2Hj+B4th/msnTCTg==
X-Received: by 2002:a05:6a21:1583:b0:1ee:450a:8259 with SMTP id adf61e73a8af0-20951d4ee08mr4317019637.18.1745930895615;
        Tue, 29 Apr 2025 05:48:15 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:48:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH TEST-ARTEFACTS] (Re)add libgcc to alpine rootfs
Message-ID: <aBDKijzZMEUopmSk@macbook.lan>
References: <20250429123643.230423-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429123643.230423-1-andrew.cooper3@citrix.com>

On Tue, Apr 29, 2025 at 01:36:43PM +0100, Andrew Cooper wrote:
> It turns out that QEMU built in staging-4.19 (only) depends on it.
> 
> But, GCC can emit libgcc calls for arbitrary reasons, so include it
> unconditionally.

Is there a fixes tag for this, or it has always been this way?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

