Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD4FB5FE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 18:10:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUw73-0007ZO-Q6; Wed, 13 Nov 2019 17:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7aE=ZF=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iUw71-0007YO-NK
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 17:07:23 +0000
X-Inumbo-ID: 0ec99572-0638-11ea-984a-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ec99572-0638-11ea-984a-bc764e2007e4;
 Wed, 13 Nov 2019 17:07:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 139so3441343ljf.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H2y8anv00oVyLfjJbDTbkhYTzmJhb4P58lIOBn7LRwk=;
 b=VxVDfBM8pvS2Np9cXOtMVq1jSnHfvjmXUX5jJHOKyVJxlQz9k118UTm5q3L/TqVxeH
 Sv1dT8ld6gYS2wN8khvXeeVfL9nYfYNyb8iGDlCbYGMlTn03HIzlQI+LdVBTjc8uydDH
 Tzg2hQ2CQjpsdP2km0UPtLudd4ENHPrtZqbI1bd1H8/WMh2dKhMsyQ//Kqe19uC/x7Td
 BSQuKRzWjWn0ygnbLCU/sP/t1tgM+Qu3C9i9S1F5zcpFPqOCjkrUlpyts/7fk4bbvrOA
 hT98a+hOi11lTVV9IDszO2Zp2/3RC41wTZMPD9bM+pYt28sDn1X2ev8ISM7cTdwAWYlJ
 gCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H2y8anv00oVyLfjJbDTbkhYTzmJhb4P58lIOBn7LRwk=;
 b=NDNjLqyBcsBo6Es1IeqJON/bNrevkwDZiMVdY+l+F77Ohv1bLH+6L1QxPMLLlUlucy
 /IxWGT/wcZC+UwAjHG+yWxBKEdLTAB9DZC01FILmBQLZ8FMzfW7Vhs+4Xutq1av5pEpd
 ypSHhXrW4wQcl+NfLDhW6atAkYG03QNXD5eF6AwTK95+MulWYBYzOe9P+gVyKyO731Cr
 ONBQY8F+sNPlUrDPq2dqi7EJvWlaKMHxZhtrhgWHzW0DhQ/CfSCg1z3GoGCRcYDEtm46
 xVDBk/gcLn+j5TQ9K8gSXM40Pgg/DFNIYAsyvGBxQGWkTi1+oQO+RbheI9jn3/wdZKMe
 YZLQ==
X-Gm-Message-State: APjAAAULi6fFIOMjc1Q/VaVDAeyHCrzVrcoeDFyPm0tagFI9NWnbnO0w
 4M3d2qos696/kfUyz7l33wk=
X-Google-Smtp-Source: APXvYqwrIuThWN1i2063x/bFvBJBd+k1Zig8gnMIal+bnD8sdUhDVTUv8DQZQK2lZUxEiKlle1UC/A==
X-Received: by 2002:a05:651c:209:: with SMTP id
 y9mr3237993ljn.65.1573664841869; 
 Wed, 13 Nov 2019 09:07:21 -0800 (PST)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 a18sm1141851ljp.33.2019.11.13.09.07.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Nov 2019 09:07:21 -0800 (PST)
To: Julien Grall <julien.grall.oss@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
 <CAJ=z9a2BvEbDRevvZHMjP31XqDOMd7MOSYjgVu8wEP369XnrUQ@mail.gmail.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f1a99e97-0259-81ae-8f6f-b947e71475ea@gmail.com>
Date: Wed, 13 Nov 2019 19:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2BvEbDRevvZHMjP31XqDOMd7MOSYjgVu8wEP369XnrUQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBKdWxpZW4sCgpPbiAxMy4xMS4xOSAwNzo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdh
cyB0aGlzIHJlcG9ydGVkIHRvIEFybT8gCkFsbCBtZW50aW9uZWQgQVJNIENvbXBpbGVyIGlzc3Vl
cyB3ZXJlIHJlcG9ydGVkIHRvIEFSTS4gVW5mb3J0dW5hdGVseSwgQVJNIGhlc2l0YXRlZCB0byBk
aXNjdXMgdGhlbSBpbiBjb21tdW5pdHksIHlldCBhc2tlZCB0byBvcGVuIHN1cHBvcnQgY2FzZXMs
IGUuZy4gWzFdLgpBbGwgaXNzdWVzIGFuZCB0aGVpciBXQSdzIHdlcmUgYWNrbm93bGVkZ2VkIGJ5
IEFSTSBpbiBjb3JyZXNwb25kZW50IHN1cHBvcnQgY2FzZXMuIEV4Y2VwdCBDLXN0eWxlIHNoaWZ0
cyBpc3N1ZSB3aGF0IGlzIG5vdCBhIGJ1ZyBidXQgdGhlIGRvY3VtZW50ZWQgZmVhdHVyZSBbMl0s
IGFuZCBBUk0ncyBhbnN3ZXIgYWJvdXQgaXQgd2FzIHJlYWxseSB1bmNlcnRhaW4uCk9ubHkgYWZ0
ZXIgZ2V0dGluZyBhbnN3ZXIgZm9yIGFsbCBjYXNlcyBJIGZpbmFsaXplZCB0aGUgcGF0Y2hlcy4K
Cgo+IElmIHNvLCB3aGF0IHdhcyB0aGVyZSBhbnN3ZXI/CgpJIGFscmVhZHkgY2l0ZWQgdGhlIGFu
c3dlciBmb3IgdGhpcyBwYXJ0aWN1bGFyIGlzc3VlIHdoaWxlIGFuc3dlcmluZyBTdGVmYW5vLgoK
WzFdIGh0dHBzOi8vY29tbXVuaXR5LmFybS5jb20vZGV2ZWxvcGVyL3Rvb2xzLXNvZnR3YXJlL3Rv
b2xzL2YvYXJtLWNvbXBpbGVycy1mb3J1bS80NDI4Ny9hcm0tY29tcGlsZXItNi1jb21waWxlcy1k
YXRhLW9ubHktYy1maWxlLXdpdGgtc29mdHZmcC1hdHRyaWJ1dGUKWzJdIGh0dHBzOi8vZGV2ZWxv
cGVyLmFybS5jb20vZG9jcy8xMDAwNzAvMDYxMi9zY2F0dGVyLWZpbGUtc3ludGF4L2V4cHJlc3Np
b24tZXZhbHVhdGlvbi1pbi1zY2F0dGVyLWZpbGVzL2V4cHJlc3Npb24tcnVsZXMtaW4tc2NhdHRl
ci1maWxlcwoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
