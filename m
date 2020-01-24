Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9697148C56
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 17:39:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv1vT-0004bs-Lz; Fri, 24 Jan 2020 16:35:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3WdY=3N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iv1vS-0004bn-3m
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 16:35:18 +0000
X-Inumbo-ID: 7be606be-3ec7-11ea-aecd-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7be606be-3ec7-11ea-aecd-bc764e2007e4;
 Fri, 24 Jan 2020 16:35:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m24so72618wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 08:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xeW5YGR4OJp4aPkl1BIyCGWsEcZcrfo0CN/vy05XeZQ=;
 b=szgzL12rMRrW9g7P4qvxqPp+3+n/XC51qG8/KQxTpQktVn4h3kKn2rs1gbLLe9efv/
 Wwz0byKSQDwH2FO8ugjLIpxfDitGXU6H/xjBXxNztxz3TzH5rvyFl2UbGG7lNon8qdnI
 FJ1Su69yH17NI5lnyttl2k7RZq9ruqCFrfhlU8fuQtpWP2/Jsj6lKf/xWCjd6A9lL8at
 2U4YXt3i41mEE8M46P6N/PPFkvWO0NZNKvATDvnF/FE2wpm550niVCdJjBvbnvnBadUU
 JLAg93zzTHVDCXvInBvJwlar0jLRu07w+mn1F5YyCFMp+Zb1M43e0pF2FKRX+bk7b8JG
 TFBg==
X-Gm-Message-State: APjAAAU9iHC9DiNkfPgfqiYedlDzVbd6qQRP3RRlDCpWt+RsM3pHlT17
 g0SHamQT9fSlJgSOgTkF1uI=
X-Google-Smtp-Source: APXvYqymxapNztpEJwB1gY5Ui6UgPj+261tex6D3XWDdW5f4yV7CRwVEKkA8z86AObdbl7E6SZ86Mw==
X-Received: by 2002:a05:600c:2290:: with SMTP id 16mr51462wmf.93.1579883708298; 
 Fri, 24 Jan 2020 08:35:08 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id o16sm8292543wmc.18.2020.01.24.08.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:35:07 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-8-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <61a9fd27-db83-f701-967f-0d5c6e4f3eb2@xen.org>
Date: Fri, 24 Jan 2020 16:35:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124153103.18321-8-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 7/7] mm: remove donate_page()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDI0LzAxLzIwMjAgMTU6MzEsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlz
IGZ1bmN0aW9uIGFwcGVhcnMgdG8gaGF2ZSBubyBjYWxsZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
