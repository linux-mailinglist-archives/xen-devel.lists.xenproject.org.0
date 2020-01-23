Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA3146802
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:31:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubcG-0007dN-I7; Thu, 23 Jan 2020 12:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=prnW=3M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iubcF-0007dG-H2
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:29:43 +0000
X-Inumbo-ID: 03468e54-3ddc-11ea-b833-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03468e54-3ddc-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 12:29:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so2905367wrr.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 04:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qclDfgebdvselz+tyVhux2ICh+ihH7jyWGaxcK1yVpI=;
 b=gbjt9XrWZknRWxpU5ezRpEqEUDsaIswsqBs40lQsjvUyl3ddJ2M7+LV+ivv2fRYZ/s
 jLPpyMsJiJSklmc0Cd6UNS5zYw9djmfeZ/szaykxZ6PVxzQjGlLLaZgFsf0XeZ1fu8H+
 Opgd+eM8MmWrDZyHVhchCJSFxpErqaqgczs64/PnoKIh1Unip6RpDolBJiuvSE+UTxRR
 7Pg5ZvWwWGlshPHaa1Jf9Z5qDxEGxKOpaZltRahwbtl0NvLKdQyCwIDjkEtNO4qhP0sd
 UXGQ2DEQy/WeV3HB3Bm6jwM2b4FpjIN+RChWLDxiZoF2GZ67BFqsyAbFA+0z/6Sa9v/W
 K3gA==
X-Gm-Message-State: APjAAAVVFSUf6Be6OMxJ8v49aNnaZtCM54bndJAhewbPdV6uii71KLZ0
 zeoxPPAPU5z2/Ib3yHYp1Wg=
X-Google-Smtp-Source: APXvYqwji+RUbeWwkvFfBahKXm1qpn5GVXbLdC4fKG80gqJWSuSNL9jsNjS0r8lYhGZOfRUojgRQnQ==
X-Received: by 2002:a5d:4f8e:: with SMTP id d14mr17084327wru.112.1579782574243; 
 Thu, 23 Jan 2020 04:29:34 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id i16sm2641380wmb.36.2020.01.23.04.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 04:29:33 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
 <20200121150704.126001-3-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <440110b0-99c9-c2b3-f472-f77234126c46@xen.org>
Date: Thu, 23 Jan 2020 12:29:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121150704.126001-3-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 2/2] xen/arm: Sign extend TimerValue when
 computing the CompareValue
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMS8wMS8yMDIwIDE1OjA3LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IFhlbiB3aWxs
IG9ubHkgc3RvcmUgdGhlIENvbXBhcmVWYWx1ZSBhcyBpdCBjYW4gYmUgZGVyaXZlZCBmcm9tIHRo
ZQo+IFRpbWVyVmFsdWUgKEFSTSBEREkgMDQ4N0UuYSBzZWN0aW9uIEQxMS4yLjQpOgo+IAo+ICAg
IENvbXBhcmVWYWx1ZSA9IChDb3VudGVyWzYzOjBdICsgU2lnbkV4dGVuZChUaW1lclZhbHVlKSlb
NjM6MF0KPiAKPiBXaGlsZSB0aGUgVGltZXJWYWx1ZSBpcyBhIDMyLWJpdCBzaWduZWQgdmFsdWUs
IG91ciBpbXBsZW1lbnRhdGlvbgo+IGFzc3VtZWQgaXQgaXMgYSAzMi1iaXQgdW5zaWduZWQgdmFs
dWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3Ju
ZXJ3b3Jrcy5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
