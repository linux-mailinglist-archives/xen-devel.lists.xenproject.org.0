Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5D819DC4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657700.1026725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuY7-0006Db-2J; Wed, 20 Dec 2023 11:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657700.1026725; Wed, 20 Dec 2023 11:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuY6-0006AG-VO; Wed, 20 Dec 2023 11:15:38 +0000
Received: by outflank-mailman (input) for mailman id 657700;
 Wed, 20 Dec 2023 11:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFuY5-0006AA-Mv
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:15:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 197f0f5e-9f29-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:15:36 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d38f03712so1570425e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 03:15:36 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 jg7-20020a05600ca00700b0040c46719966sm6876799wmb.25.2023.12.20.03.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 03:15:35 -0800 (PST)
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
X-Inumbo-ID: 197f0f5e-9f29-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703070936; x=1703675736; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TUbHJtaRwhu3uDvDbFmA5A8L9noTZyKrw11OFe6cqlw=;
        b=flUL8UNYi/kId4Tka/6P9AVSiJl3Ux/0M2yKq4IxrvS0FvfvqdWKt8+pRNfhBiIcQM
         mbVmCAXtlaL/Ax6Y7hurA5GUePa7fXA+cdtLtOzCthhn4YhkjRxU3XjFeGC0L9KPLEu5
         v/YO2OZgcq3om8Q1GjwMKKdy4rT4vQH70G6WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070936; x=1703675736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUbHJtaRwhu3uDvDbFmA5A8L9noTZyKrw11OFe6cqlw=;
        b=CxRH01hxhC/RkHFQ2u2KDIIARL+34qCPd6loBTnLpWBwUaziZZPOLGUpDSzk+qrkHW
         JypeBmLXyJkdwmh9PM5Txtr0UGQ+fy9oea9Uavb2GANF3QBPAIU8jVy6Xlc6qoR1Oimi
         p//6q07EoPzQQ+h34P8xkrbz3pDT4SfEdRFDXTlh/rw7mNunogptWXwenCL2zGNibqYi
         esiwFXkMRIFWtniNOCrqHuE9M9iN6LQFpx8mbR8E44nBjHgY0ynKMZeWIumR4RZ1PQmR
         GK3V6GJpqv5U6xxl7vt4pNG2aZjJmAkaXo4Ncaf6r+3hfFVowd0z5BCGwWw07JYskWVq
         RzLg==
X-Gm-Message-State: AOJu0YzD0xsT0dBtNSufyKXVLOB48pNRI8QC49WhxyXFJG5b+/RLP/k4
	y5HuKbinDFziUacukee8PQjeDQ==
X-Google-Smtp-Source: AGHT+IFcooR/43azGnRuGCfYBHPURu1Pmw4IpdfcNyfIlKaiwujVWqyHKe4UyxQQSVHvQ3Ner6atLA==
X-Received: by 2002:a05:600c:84ca:b0:40c:3cc0:8616 with SMTP id er10-20020a05600c84ca00b0040c3cc08616mr9231316wmb.73.1703070935859;
        Wed, 20 Dec 2023 03:15:35 -0800 (PST)
Date: Wed, 20 Dec 2023 12:15:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/platform: tidy do_platform_op() a little
Message-ID: <ZYLM1m_khwPd53Cj@macbook>
References: <bd72ab26-2258-4a11-9b8d-b69c60ee5b8c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd72ab26-2258-4a11-9b8d-b69c60ee5b8c@suse.com>

On Wed, Dec 20, 2023 at 10:35:29AM +0100, Jan Beulich wrote:
> The function has a few stray scopes and inconsistent use (indentation)
> of break statements. Drop the stray braces and bring all the break-s in
> line with one another. This in particular means dropping a redundant
> break from XENPF_cpu_offline handling, pleasing Misra C:2012 rule 2.1.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

