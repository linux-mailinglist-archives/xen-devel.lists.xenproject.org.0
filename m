Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D9E19421F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:55:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTtI-0003my-48; Thu, 26 Mar 2020 14:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHTtG-0003mn-Dp
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:53:50 +0000
X-Inumbo-ID: 99d9d6f2-6f71-11ea-a6c1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99d9d6f2-6f71-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585234429;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cWAW/UgsXk8SfQtGRMWHr6uDNvqsnqcnCkJD8WhlTrM=;
 b=YMOVo9L1y/tE+RKC2OtbcAroGSopgVC2MYgN7rGf1221biKf1Pq9yNKP
 3LPrseIGf0jOGflsVViLY1f9c3WJuAMmEx9X12WHxaPR5SQQgPQHhSogI
 sOGRxXb9O5m98xR+YNFUQAzAwkNlPDdTq5B5zbxzwYYqVIOuUNYEtKUs2 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0ZW4qYWfXxys8YqWZIcwrz26MI3If/VdB8wUpH2BHCl+KJ1eNYnjx3JEtirSTgJdTVwquwLMf8
 5oo5zNk8TRJ6VfmUS1v271ge969j7fQ+NNHUljSEnTD96CP9B9X9mH5B5nyAquwUfbVMrb2AxZ
 RM/eKzIsdLlxwfTuemay5r3cF5MGvGuY4H730/Q8inM8fWcg0qaXxX6JX80p1qNtSJi/8n6hz1
 EixhZ/nE1b8FJQDr5VwOTMXhGCgacvaP9aF+gix8x2IhAFPQobfZfkUmWYqFB1aca2UJ43ZPLp
 fdw=
X-SBRS: 2.7
X-MesageID: 15098872
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15098872"
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-5-andrew.cooper3@citrix.com>
 <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <842e22cd-fcde-86bf-d671-c14133488e33@citrix.com>
Date: Thu, 26 Mar 2020 14:53:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Introduce a xmemdup_bytes() helper
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/03/2020 22:19, Julien Grall wrote:
>> diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
>> index f515ceee2a..16979a117c 100644
>> --- a/xen/include/xen/xmalloc.h
>> +++ b/xen/include/xen/xmalloc.h
>> @@ -51,6 +51,17 @@
>>  #define xmalloc_bytes(_bytes) _xmalloc(_bytes, SMP_CACHE_BYTES)
>>  #define xzalloc_bytes(_bytes) _xzalloc(_bytes, SMP_CACHE_BYTES)
>>
>> +/* Allocate untyped storage and copying an existing instance. */
>> +#define xmemdup_bytes(_src, _nr)                \
>> +    ({                                          \
>> +        unsigned long nr_ = (_nr);              \
>> +        void *dst_ = xmalloc_bytes(nr_);        \
> The nr_ vs _nr is really confusing to read. Could you re-implement the
> function as a static inline?

I'd really prefer to, but sadly not.

That requires untangling headers sufficiently so we can include
string.h, to be able to use memcpy.  I don't have time at the moment to
sort that out.

~Andrew

