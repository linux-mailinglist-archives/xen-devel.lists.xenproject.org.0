Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D984F144
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 09:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678565.1055953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYM2q-0005wP-B8; Fri, 09 Feb 2024 08:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678565.1055953; Fri, 09 Feb 2024 08:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYM2q-0005ub-6Y; Fri, 09 Feb 2024 08:15:36 +0000
Received: by outflank-mailman (input) for mailman id 678565;
 Fri, 09 Feb 2024 08:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYM2o-0005uV-H0
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 08:15:34 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 656a945b-c723-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 09:15:33 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5116063585aso819949e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 00:15:33 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b004101f27737asm1797374wmq.29.2024.02.09.00.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 00:15:33 -0800 (PST)
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
X-Inumbo-ID: 656a945b-c723-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707466533; x=1708071333; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wgU5GZe1ofFBOofLysTtEQRnNdEUJgHJSdhljtKCv8=;
        b=YSQlTbxNp3sektOKgkungTV0L8gxjeqFNO7i4WgKHNHKOlFJT4q26WAKm//Xqc4lAs
         V9rY+PrRS5AFtcaRKfnMP0CKfa+q+LBckEGPZYqL8pPGvrgFRpYlQL4PHnz/0ES+HwX6
         4yvxSPURqCzC2tYlzPkLhKB2HlmEJ2e+80I14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707466533; x=1708071333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wgU5GZe1ofFBOofLysTtEQRnNdEUJgHJSdhljtKCv8=;
        b=olAyB6pG7GGBBlq5d7yC09n2LbbuRNZfSeXhrGlAlSc/FD1etwEAh1zaX4/w0e/3cd
         G+hnPEzFndTlufhpQm4WLZHIfu5K4U1y3EJBrA/GU6Thv/gSn7bC1vPZ4z75bDKIQLQs
         xKU9X9/y7vUx1AZXQSRMz73xJHWgqxmKayvOSe3QUKQeIihyp7MCQeczF8ahNi92+MqI
         D+Crs1v9HuvjAvxvYvi0tJ4ilYqJGwkhqqdhABKH2QvNnlJgt257ih547nMiFHmqAxq1
         MX9uh+UJIHYEfE+huk00/424KJKDtdT6R4lIRoB2ASlpmATB5cMCnh5g8lzJpgBGbVgK
         E29g==
X-Gm-Message-State: AOJu0Yz0fwB4mH0uaY6Dnxmbs5QNlnhaqTxrs1lcO/H8v7eNjz5fHz/b
	jGDh2yw0dZVisPI5MNxxqfvs3jg+960HUBrgCc+4s/bCVOtYKRZCkZBvIKzyKZRjK0hbwOGSBt+
	D
X-Google-Smtp-Source: AGHT+IGguNE3q5/j1aeFVp7fybAnbMOG4N2WKOXVnyeqSOBLe/5aSy8kObXgVGhY/ZJOuz6rDP4o3A==
X-Received: by 2002:ac2:4d06:0:b0:511:61ab:406e with SMTP id r6-20020ac24d06000000b0051161ab406emr450332lfi.28.1707466533278;
        Fri, 09 Feb 2024 00:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdr+/J4ubAHMcX3+oWbVVNYVJceH08wfyzfiBQXFCa7X7Uz030Lor/bIymGJbEkTY+w80Wq2LJ+JUrrzv/PYvstaHymnZEudNR7WZs+FBBjFse
Date: Fri, 9 Feb 2024 09:15:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 5/7] VT-d: move ats_device() to the sole file it's used
 from
Message-ID: <ZcXfJHs6DWNvvTYw@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <c6d803ba-9478-4ab0-9ab6-a9af94808682@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6d803ba-9478-4ab0-9ab6-a9af94808682@suse.com>

On Mon, Feb 05, 2024 at 02:56:55PM +0100, Jan Beulich wrote:
> ..., thus allowing it to become static, and thus reducing scope overlap
> between it and pci_ats_device(). There's nothing x86-specific about this
> function anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné zroger.pau@citrix.com>

FWIW, the function would better return a boolean, as none of the
callers care about the position of the ATS capability, and use it as
an indication that ATS is supported.

Thanks, Roger.

