Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70338914403
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746163.1153142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeZC-0003Od-PP; Mon, 24 Jun 2024 07:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746163.1153142; Mon, 24 Jun 2024 07:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeZC-0003Nl-Ly; Mon, 24 Jun 2024 07:56:46 +0000
Received: by outflank-mailman (input) for mailman id 746163;
 Mon, 24 Jun 2024 07:56:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLeZB-0002Wx-DH
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:56:45 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd391de-31ff-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:56:44 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a724b4f1218so112647666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:56:44 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7261aece51sm1433766b.153.2024.06.24.00.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:56:44 -0700 (PDT)
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
X-Inumbo-ID: 4cd391de-31ff-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719215804; x=1719820604; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u07MF4jpyL5jS/EdK3+dxG6HnxSuXokhUkBqoFh81s8=;
        b=jDCZyqZgGviglFshq/jkQW052ePSNIfDDThRipyssj3Eyy2S1EJQ/AKqw7PrukDhk1
         auGtCjQWJFH6XgxCwgTVy9rX592u6WmSMkegdhz+EzW7tbhU/cuze5cR7osCn25KUE0f
         RR+XJ1T/ie3uO0rg96sWkjZKGvS6RHTgjQKvxpU/+egXlw+L6rbvE2qxUDG/vZrtDZ8m
         sujO9GsNL6/PaYaAn8iViPnuCDN67nAyn4Mj5jSvw7lscd741LbAu8ffTjprfFs8h649
         9+1+kbFtJf6yFHNshO2grSKSHAHegDAz9tiqBaUjNKcGRPrNLQN7D4SSmLukjbHBNcyH
         lzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215804; x=1719820604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u07MF4jpyL5jS/EdK3+dxG6HnxSuXokhUkBqoFh81s8=;
        b=RPuhynl+hqdhJrQKXmhNSqoTj19yVDgrraqRUmfa2dyi+zjmCTSgH2X8tNc5wCvtWA
         PLIhm6i5JImFZJJ0EhgfqvWHDA8bEKAYByjdQpedfF4CVPOf5VKmaAXPoyPByiil/2uA
         2eJ3KzdGXymuxLjmA5HCnNUR7m9XaOFbr8Cf+rBzbxcy+686TeApSGUk/hcoAAuBcOiN
         nKsuhgFYFcIkHXCvnuni8ocS8p+P1MrTLI2dgpcZ2TIGYsJEIOKRg41ndwHNKhpZksLh
         b/jW3czCzxGIZFWH89x9r4Ynfg2vF0wqpmaYbO4fZx0zdXjLQuQkurliG02GDAnfbtpI
         EbXA==
X-Forwarded-Encrypted: i=1; AJvYcCVSHTho+RHM011sJleh5y0QVqYG/+aYJg+F2uQroyHEaP4GBztbHUlu8RcGWYfcBT+NKXOTKiuGfg3eLt68M0A6UqynMua2i4g5Rw2M3lQ=
X-Gm-Message-State: AOJu0YyNRa8D4FEzYWMh0Tv2xywQERwgxvm/YtW5vdTCTH2WJPZ9HOKM
	9zd8kems8zAwd9n1U84c44o0vraFV+V7WhywJ8H9iboo3oBj7+Zw
X-Google-Smtp-Source: AGHT+IHbB0HC5/0qWEnG7JiZbdS8ftYQOuf+qd8xJdXkkPud7dmUaaS8B4fEmXq3tBhzNqL8RunBlA==
X-Received: by 2002:a17:906:d108:b0:a71:ddb8:9394 with SMTP id a640c23a62f3a-a7242cb6ff3mr263965166b.40.1719215804195;
        Mon, 24 Jun 2024 00:56:44 -0700 (PDT)
Message-ID: <31527654b914ff1f77fb209024307032f7e7feb2.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/2] Xen: Final MISRA R8.3 fixes
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Date: Mon, 24 Jun 2024 09:56:43 +0200
In-Reply-To: <20240621205800.329230-1-andrew.cooper3@citrix.com>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gRnJpLCAyMDI0LTA2LTIxIGF0IDIxOjU3ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IFRoaXMgZ2V0cyBYZW4gY2xlYW4gdG8gUjguMyBhbmQgbWFya3MgaXQgYXMgYmxvY2tpbmcgaW4g
R2l0bGFiLgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWho
cC94ZW4vLS9waXBlbGluZXMvMTM0Mjc1NTE5OQo+IAo+IEFuZHJldyBDb29wZXIgKDIpOgo+IMKg
IHg4Ni9wYWdld2FsazogQWRkcmVzcyBNSVNSQSBSOC4zIHZpb2xhdGlvbiBpbiBndWVzdF93YWxr
X3RhYmxlcygpCj4gwqAgeGVuL211bHRpY2FsbDogQ2hhbmdlIG5yX2NhbGxzIHRvIHVuaWZvcm1s
eSBiZSB1bnNpZ25lZCBsb25nCj4gCj4gwqBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xB
SVIvdGFnZ2luZy5lY2wgfCAxICsKPiDCoHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9ndWVzdF9w
dC5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCj4gwqB4ZW4vY29tbW9uL211bHRpY2FsbC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQgKystLQo+
IMKgeGVuL2luY2x1ZGUvaHlwZXJjYWxsLWRlZnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA0ICsrLS0KPiDCoHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPiDCoDUgZmlsZXMgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IAo+IGJhc2UtY29tbWl0OiA5
ZTdjMjZhZDg1MzJjM2VmZGExNzRkZWU1YWI4YmRiZWVmMWU0ZjZkCgpSZWxlYXNlLUFja2VkLWJ5
OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KCn4gT2xla3Np
aQoK


