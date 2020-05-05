Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C902E1C58F4
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:21:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyRE-0002zh-BD; Tue, 05 May 2020 14:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=56xU=6T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jVyRD-0002zZ-2t
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:20:47 +0000
X-Inumbo-ID: 9c51549e-8edb-11ea-9887-bc764e2007e4
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c51549e-8edb-11ea-9887-bc764e2007e4;
 Tue, 05 May 2020 14:20:46 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r16so1926384edw.5
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=ssmMzSYbkAlQNENJ0+sfsbcrFdtSKUKyOj/WFKOO5TU=;
 b=iY6eg7bgOWB4PUYqdbPEFGOZdZ30mqmktDJR2lX6xz13oFnTBgKzuGqTzfCkTIP7T1
 2NYkeFEq928l9lBdT9Fe9rNQV2djGM2PYjezT8E9/RyRPq5ymXrUHpHEPxSvPzzPq4RC
 LmSfs5KRz7jCgbu913uNiZ7s8oGQW3TVkLbjbMDrwyc5//8mkbwgvvWVHZnbZiD5HyX6
 3997SX8BkGA/upCHO/l9uwFDpxSIlEzDPP7cky4HOwZdkhlVHhLaW2TxM+6/KuPXfyHe
 wfQKVrsHpQOR2FONMw/P/MLQab6EP3jw7PVDu8qoyStjpnIQ59u468NYH9vypOItWGV6
 S70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=ssmMzSYbkAlQNENJ0+sfsbcrFdtSKUKyOj/WFKOO5TU=;
 b=ZdEAjDYsd4PsOdNgI7onfGA1OiR3812SNzXQA0HVx9P6F9Tfq3XlFymXJ/3Z3gRTaV
 6IwONfM+rMN5fPi297uNaghU94gij5C7cIWjt8r0R9tNBmzicjH15q0FPb/nsStN2BKi
 mswxqpHtkEdzhoSVo65qe6udqKzY9CipaQXIBe7pVcXrt/SBPnGFQfwiF+377Y+L4YCn
 cLPx4McBBgrnvBq1Pu3/unzHZveg1jtA0k3RipgzBlCEZDM062aO3eMriSSo/89G7Hp2
 nrY3/7wNyuUKmwbpL/nq025SdjGzqJ+Lici7K/WOhI4Wr/2BHch3mG1JusCOlJoQPlT0
 oBag==
X-Gm-Message-State: AGi0PuZoDB8VQKrcF4TLKO6Yzbyj3HGIeGpKmT4w41+ZP0IiTz5DXgie
 ejhy3C8dOq7EgJKW4xfArTc=
X-Google-Smtp-Source: APiQypLO9+FQU3b6jb1gtgRf+odkGpyNe+f10RvplGzuGo96OzQJLrYCnPnFyZjSvS3jnT0HPW985Q==
X-Received: by 2002:a50:f381:: with SMTP id g1mr2857730edm.219.1588688445712; 
 Tue, 05 May 2020 07:20:45 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id s9sm290038edy.33.2020.05.05.07.20.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 07:20:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <1587789a-b0d6-6d18-99fc-a94bbea52d7b@suse.com>
In-Reply-To: <1587789a-b0d6-6d18-99fc-a94bbea52d7b@suse.com>
Subject: RE: [PATCH v8 06/12] x86/HVM: make hvmemul_blk() capable of handling
 r/o operations
Date: Tue, 5 May 2020 15:20:43 +0100
Message-ID: <004301d622e8$5d81c0f0$188542d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF4q+H3Wm1UTucZ9GNJEhcAR5TDKQK9B+Q6qT6QcoA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 05 May 2020 09:15
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau Monne
> <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH v8 06/12] x86/HVM: make hvmemul_blk() capable of handling r/o operations
> 
> In preparation for handling e.g. FLDENV or {F,FX,X}RSTOR here as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>


