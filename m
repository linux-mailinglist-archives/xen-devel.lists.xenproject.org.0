Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A91818FC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 14:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC0wg-0000Ph-2N; Wed, 11 Mar 2020 12:58:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zejv=44=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1jC0we-0000Pc-6a
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 12:58:44 +0000
X-Inumbo-ID: 0904a060-6398-11ea-a6c1-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0904a060-6398-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 12:58:42 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id c25so1161731ioi.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2020 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pXMGtTgQX/vG6YdfwMEutnSxHcYYkuMTZjUufEEkwrs=;
 b=0RdqNJ64RPB/YwilvK1FgfDcZgni+Z2YUWUBcLwScASQbGBbB9Dz+LE4Mm35IFt6vr
 4cSxKXzulAxx/FMhBjxo7H6LFUFR8GPqsvxXNjSRUPuzvFkJ4jv1PyVkcJG+rzbCC2Np
 QluikAk9mzDbEMQsnqi+vhGhm69SUbxzK8wbFD8zbHl+VIITIdrwzXk7cwoU57h6DYTK
 xP/B6p8lJjmkYSUT2EEde9KDBifsOxQlJzU6xNbSL1nZM0pl98Obd5V+EG9SnWmey6tz
 SPlj8XfxaXHr4JqefQegQiSZa1hJYMurvTPgBuMJ9xU7xwGx1tFUNwEPiNDvzHAuPBK6
 0h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pXMGtTgQX/vG6YdfwMEutnSxHcYYkuMTZjUufEEkwrs=;
 b=dpoSmlvnjJGFBovpUGJmfTzVmfLVn5aOLU37hutezo9DI4jVhIdiq60VS9CMnSe7tn
 Wez0b4MlTe3yUWDlHOF73MGwzoag+swoLK1Crx5t/R1j6GpKxmUG2UYdA6TfdvEOyvC7
 WO279SLeW4YOWxsP49TKgEE/rG7fnkZJlOKO1B9HjELYwyvXrs9IfuTUpi+DkbCcTmnJ
 5FyuVTOn/lfbF7BYTXX3ShPxL3DWVOs4rmPQfXCZqPTuo7/T25A/ChvlxDEFIUy9cdnM
 PnzxmQhDT6meJMglvgvWheCMNHWiWvO+mcPK/ixd+cfy6uEhAplivs7UTw4NKUIjNiSZ
 5b4w==
X-Gm-Message-State: ANhLgQ3Zcsed5Ja7bLWFk81lL/QewvXuI7G1uks791gB+59tmacYojmp
 Byo7egZnPUeSFRbxO/e57y/vIQ==
X-Google-Smtp-Source: ADFU+vvQvrqamJpOiZ/PrfYXGY85lIbp+WER5L+9cjMJPMlJO1Ap5yHyqeha4+2wZHF6gubxcVHRhQ==
X-Received: by 2002:a02:6658:: with SMTP id l24mr1450719jaf.33.1583931522194; 
 Wed, 11 Mar 2020 05:58:42 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id p79sm17821112ill.66.2020.03.11.05.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 05:58:41 -0700 (PDT)
To: Matteo Croce <mcroce@redhat.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, linux-nfs@vger.kernel.org
References: <20200311002254.121365-1-mcroce@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <7e03d359-f199-29d8-a75f-20c4b7ff3031@kernel.dk>
Date: Wed, 11 Mar 2020 06:58:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311002254.121365-1-mcroce@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] block: refactor duplicated macros
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, Song Liu <song@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy8xMC8yMCA2OjIyIFBNLCBNYXR0ZW8gQ3JvY2Ugd3JvdGU6Cj4gVGhlIG1hY3JvcyBQQUdF
X1NFQ1RPUlMsIFBBR0VfU0VDVE9SU19TSElGVCBhbmQgU0VDVE9SX01BU0sgYXJlIGRlZmluZWQK
PiBzZXZlcmFsIHRpbWVzIGluIGRpZmZlcmVudCBmbGF2b3VycyBhY3Jvc3MgdGhlIHdob2xlIHRy
ZWUuCj4gRGVmaW5lIHRoZW0ganVzdCBvbmNlIGluIGEgY29tbW9uIGhlYWRlci4KPiAKPiBXaGls
ZSBhdCBpdCwgcmVwbGFjZSByZXBsYWNlICJQQUdFX1NISUZUIC0gOSIgd2l0aCAiUEFHRV9TRUNU
T1JTX1NISUZUIiB0b28KPiBhbmQgcmVuYW1lIFNFQ1RPUl9NQVNLIHRvIFBBR0VfU0VDVE9SU19N
QVNLLgoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkplbnMgQXhib2UKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
