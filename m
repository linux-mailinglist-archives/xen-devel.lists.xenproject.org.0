Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6807194366
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:41:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUau-0008Cu-0X; Thu, 26 Mar 2020 15:38:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHUar-0008Cp-T9
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:38:53 +0000
X-Inumbo-ID: e50dcf06-6f77-11ea-8813-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e50dcf06-6f77-11ea-8813-12813bfff9fa;
 Thu, 26 Mar 2020 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585237133;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GyGSNVa4VBiWrv00G0trgYXaLyPp1NkmIJydRvNUAec=;
 b=h6qlvfhjnoDzPftpzAZ5JyotdNcXaEElngkezJ7GVW8zakqOrsOiLP4D
 M8pTkZgvtkEGDr1rh6iLpu/zatIn3Msw27QJ/s4oBX4qCMlgloE6i3Uzb
 gorKrL65zohaEt1LuC3KRpR9OhL+ba6hnuLBOYOaaoyuRyusnrPgXjdz0 M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3HnLZ+r5KCJcwp8mafGbdDrjWnnaBQYl+xKWMDuQdfhq1LtTofkuikaddUNHhIXC8AuwvYeQ2x
 ImcOkpPctWAaFHBM4Biw2s7ZdOKA9wBKLDYWL/aHQIN4XHEhfb2OoCgfetPfm4gWpVTrXNvime
 MA342X34hl9OHyOHMmOde1o6PzJ8s6UvDrR70JY67OqqnQXLDJhT8PmrUxpl0T3cq9vZMsqfce
 2Se67O8pQ1v4/ysBAuAkrqts8TqMkj0iR2d7QpTQFob7QTaDH8R+G3+L3l5TPEoEFgkjS8kfbU
 Ses=
X-SBRS: 2.7
X-MesageID: 14703029
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14703029"
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-5-andrew.cooper3@citrix.com>
 <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
 <fcff0161-3e77-c4cd-be58-f522b3269142@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f95b8d56-5f62-b3f2-4ec3-46f1b47ddb48@citrix.com>
Date: Thu, 26 Mar 2020 15:38:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fcff0161-3e77-c4cd-be58-f522b3269142@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/03/2020 08:38, Jan Beulich wrote:
> On 21.03.2020 23:19, Julien Grall wrote:
>> On Fri, 20 Mar 2020 at 21:26, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> --- a/xen/include/xen/xmalloc.h
>>> +++ b/xen/include/xen/xmalloc.h
>>> @@ -51,6 +51,17 @@
>>>  #define xmalloc_bytes(_bytes) _xmalloc(_bytes, SMP_CACHE_BYTES)
>>>  #define xzalloc_bytes(_bytes) _xzalloc(_bytes, SMP_CACHE_BYTES)
>>>
>>> +/* Allocate untyped storage and copying an existing instance. */
>>> +#define xmemdup_bytes(_src, _nr)                \
>>> +    ({                                          \
>>> +        unsigned long nr_ = (_nr);              \
>>> +        void *dst_ = xmalloc_bytes(nr_);        \
>> The nr_ vs _nr is really confusing to read. Could you re-implement the
>> function as a static inline?
> And even if that wouldn't work out - what's the point of having
> macro argument names with leading underscores?

Consistency with all the other code in this file.

>  This isn't any
> better standard-wise (afaict) than other uses of leading
> underscores for identifiers which aren't CU-scope.

It is a parameter describing textural replacement within the body. 
There is 0 interaction with external namespacing standards.

~Andrew

