Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF63AB6E4E
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984397.1370541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDMu-0006AG-AC; Wed, 14 May 2025 14:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984397.1370541; Wed, 14 May 2025 14:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDMu-00068r-7f; Wed, 14 May 2025 14:46:00 +0000
Received: by outflank-mailman (input) for mailman id 984397;
 Wed, 14 May 2025 14:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFDMt-00068j-4t
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:45:59 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22ca80ba-30d2-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 16:45:54 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-74248a3359fso4842428b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:45:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742522ce81asm7083365b3a.46.2025.05.14.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 07:45:48 -0700 (PDT)
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
X-Inumbo-ID: 22ca80ba-30d2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747233953; x=1747838753; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66svDGfT8F6rDYcFQhRugCuC20JT6oBv1oEMQtpL+k4=;
        b=V4jl6NPOw+ii4HqH2cfURVCn1OkrIHdXc+jCogrU48bMOuIeZ+i0diPX9ON6GQn96c
         1V6lG8Wlfu8Pv+JzWxo0ByceSpJxk1D9ArQKvzMXZBY3fTDKS5cKNbTDDZTZYK71HJlR
         AJsB7uXnqyALSk4mk0ySgYb8Jqpn+t5mOeTFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233953; x=1747838753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66svDGfT8F6rDYcFQhRugCuC20JT6oBv1oEMQtpL+k4=;
        b=LL7KIXHoCIEXEKdagZDM1/kfHQFFLX1RpmpqKbY7EAg4SE/NFHZs7V9zjcWhjFFRbR
         EgqBqGoDsUxM4jiUSEg6ZXVS/Lgx7sZaxLlRgsMg4D6v5BCSsgEHh0KFhjIOoFacFpyn
         FeQ2j8dklh2mK1ejcQnzgoJpVQLFpBDkKGt+jBokkBm32BJQ6YN7uZ81GefNNjMAqKAL
         Ft97zvn5CQOBvbsmk9AfgR8Y2/LKxTxO/FsNufJ3kS436gVHyLfIUUcF+nIBV6Y+AYQW
         PpYJUreTbVb1AzkH9mGPUsY1uJ9YxzCO81W+O/zimTf+taHwAMh5dy6urdTjUL+mSRcL
         kLVQ==
X-Gm-Message-State: AOJu0Yy5lNC1F6+gmn6T0OiprKvL4PEcaG0VwLAnLSHxEYET8EzZVeBh
	abej3LUYwCNjbbhnNQnTf/BxW06oqehc87zRkE1BwflBjGUjdMLjp2DvWWFWbVg=
X-Gm-Gg: ASbGncsNXvI3GSUeQ3kEnhDxYp8St1rWLBdZZbwh3Ccguu9HVEB0Jxm+QCMm/yVlny2
	j+qCDrsHrz5WdnurSlTY/+WiMB22WQPkauMk1dDfTxhyhU94dAgnCdpjkuDFJvTnFJhTj7y/V11
	Cks3wJpXbfCGOzkuN/h/IlLaHE3Ty1ji5GRizj8bvu9Fj661y/4HMXiTCyCBUyfXb7s1RhoOwVO
	ctYia7kMHK1YpelkN20ztw9kwkZ551TgeTHFFlXzzgRceEP/z4mcUuos0zEwx5OcfT3dUtDz2bz
	jtQzE0yUzVNr9JttDNvTa+QftRUpJlwSN+TcweFsKwTx/V8deIWtBQp/N1i2aA==
X-Google-Smtp-Source: AGHT+IGqrXbls0SknW+UxVWAXGnCQKqwE7hV9HWwb0lOsNB7NlPVn1jESZRTomQM3lechPQ8Aes7xQ==
X-Received: by 2002:a05:6a00:3d16:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-74289348adcmr4594246b3a.17.1747233949183;
        Wed, 14 May 2025 07:45:49 -0700 (PDT)
Date: Wed, 14 May 2025 16:45:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/6] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
Message-ID: <aCSsmEa3_XszwJZL@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <ca63920c-b349-bcd3-8c1d-c869d8de4d99@suse.com>
 <aCSCNUGdbuwrJLd6@macbook.lan>
 <5aeca684-4ff1-4299-ab07-95d02be12f46@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aeca684-4ff1-4299-ab07-95d02be12f46@suse.com>

On Wed, May 14, 2025 at 02:52:39PM +0200, Jan Beulich wrote:
> On 14.05.2025 13:44, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 11:46:41AM +0200, Jan Beulich wrote:
> >> This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.
> >>
> >> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > This is however missing the previous calls from SVM/VMX that at this
> > point in the series have already been switched to write-back instead
> > of evict.
> 
> Hence why it's this late in the series, i.e. ...
> 
> >  Maybe this patch should be the 1st of 2nd, so that changes
> > from evict to write-back are done afterwards?
> 
> ... I wanted to avoid touching those places twice. (IOW re-ordering would
> be possible, with the extra changes you mention, but I'd prefer not to.)

Given the concerns with patch 2 I think some re-ordering will be
needed?

Thanks, Roger.

