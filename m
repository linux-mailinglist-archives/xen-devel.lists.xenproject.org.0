Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A8130933
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:43:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io8y6-0003X8-Aa; Sun, 05 Jan 2020 16:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io8y4-0003X1-0c
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:41:32 +0000
X-Inumbo-ID: 39db45c8-2fda-11ea-aa3b-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39db45c8-2fda-11ea-aa3b-12813bfff9fa;
 Sun, 05 Jan 2020 16:41:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so34473266wru.4
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1B0dK8b04rgfDd6/+5JW02qB24nOs8AjCzR++8oILZI=;
 b=N37yJI19qEyU7J+QRC79EPNF/eRVngqkXH+WwMXvsXva3g7z37O8oD32EBXtIG3ykj
 /QTRXG6ReMYgFBc/iBgfl9x/EASwEjArPNL/hSeTn2kbfvOVz1VV1kacdNIT1IKPo15o
 oqlc9owdxEtMvBN9xlnAG1frv3OrjV2m5azK6Edfqd+Fm9bnXMeBraekaMc/yenvEpxq
 atm9CnkuSV1LVsN1bQJFIwxCVmu96Bk1FoecmVQ24a/VOS/sPxIotSiwG18B4/S2Mz+t
 RYSWKsFlceIc6JeL/AZhZIScmFm8fHHvb9z/bRV59KEg1uqboed+of1MWpQItIoEhXKU
 uJtg==
X-Gm-Message-State: APjAAAX33M0NWo1fH42Xzy39LYhJB4Ef6E/jZ6qkqC8ripQmlxWFSNNv
 dFJHG75SHicFj9nOT8CEZuYPi8bfFB4=
X-Google-Smtp-Source: APXvYqztkZ4BFMOcqpnhddXHp8ZZLPMcCR0NK2zxwhjnwQF79+RSqgB6+vVaau7ze4jEvrDo+d0oDQ==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr92874747wrr.32.1578242489996; 
 Sun, 05 Jan 2020 08:41:29 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id i8sm68776960wro.47.2020.01.05.08.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:41:29 -0800 (PST)
Date: Sun, 5 Jan 2020 16:41:27 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20200105164127.n3ki6pr7veauowjz@debian>
References: <20200103160825.19377-1-liuwe@microsoft.com>
 <20200103160825.19377-9-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200103160825.19377-9-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 8/8] x86/hyperv: setup VP assist page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDQ6MDg6MjVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiAKPiBQcmVlbXB0aXZlbHkgc3BsaXQgb3V0IHNldF92cF9hc3Npc3QgcGFnZSB3aGljaCB3aWxs
IGJlIHVzZWQgaW4gdGhlIHJlc3VtZQo+IHBhdGguCgpBZnRlciBnb2luZyB0aHJvdWdoIFRMRlMn
cyBzZWN0aW9uIG9uIHJlZW5saWdodGVubWVudCwgSSBkb24ndCB0aGluawp0aGlzIGlzIG5lY2Vz
c2FyeS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
