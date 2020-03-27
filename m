Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629C195753
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:42:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHoHi-0008RY-69; Fri, 27 Mar 2020 12:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHoHh-0008RT-Bx
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:40:25 +0000
X-Inumbo-ID: 20b60b44-7028-11ea-896b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20b60b44-7028-11ea-896b-12813bfff9fa;
 Fri, 27 Mar 2020 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312825;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ap9l05eIddfaeUbwQRUseDl+grByTGbSBvy7E741Jus=;
 b=GWsNgYaiX0Wu4ZxuqyI9Jzx7hiNEB75j+4ZVfPEU5bo+Rhqu75wDs+jv
 s/Jd2NCtxtNOpYja+Kgvi9HGZpUlMCVBfj2zE1j53X+Bcy2nqGdovZAf5
 l/gXoRodeHXY+2bXJo5xooRDjSSW1XxevrR/kx9PS3RLOKko/JeMAVAgY k=;
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
IronPort-SDR: XzIH1dJEQTARwCZUVJBFsG0MmaGCmpz92qILVR3/JeKLQoaFDdE0X+wr/eDVIPSzLNHvGGrGPQ
 2px5yXDUwjjFvWWcZGAlMsROWmTr/kUGRy9E//c8POfLJuvns+Zhd2xWf9RJ5Eig+jZgVJ4GNF
 YDTWuI2HxT0l9P6iTvabF09Ju49+R9vSL7iPunoTd7XD0mU1UeCbWg927w3SB3jKp510cb+y6t
 4jZaB2qUNIlVmxP6ZX6wLb4Md7dlFKWwKvTBXuhC+Rc8zAnosA2M79QWqEMF6qO81bk1RdvWKo
 uTg=
X-SBRS: 2.7
X-MesageID: 14761826
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14761826"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-8-andrew.cooper3@citrix.com>
 <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
 <3e157f6d-e237-68d2-f628-10f4d42e578b@citrix.com>
 <a7a03cf2-a8ce-3b82-5c0c-22f4bccc0c8e@suse.com>
 <154fef1b-5c73-4716-e649-4ea99cba3c72@citrix.com>
 <5aef05a2-5d37-c9a9-8cc7-157c52524faa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <eacbce35-f4e9-f338-ae61-2579c8d23bda@citrix.com>
Date: Fri, 27 Mar 2020 12:40:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5aef05a2-5d37-c9a9-8cc7-157c52524faa@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/7] x86/ucode/intel: Fold structures
 together
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

On 26/03/2020 15:05, Jan Beulich wrote:
> On 26.03.2020 15:50, Andrew Cooper wrote:
>> On a perhaps tangential note, what (if anything) are you plans regarding
>> backport here?
>>
>> These defines are ok for a transitional period across a series (and
>> probably means I'll need to get the AMD side ready to be committed at
>> the same time), but I don't think we'd want them in the code for the
>> longterm.
>>
>> I personally wasn't overly concerned about backports, but if you are, we
>> should probably take this into consideration for the fixes.
> Till now I didn't see a strong reason why backporting might be
> needed (or even just wanted).

The gratuitous memory allocation fixes would be the most compelling (and
even then, not massively so), but they're sufficiently interlaced with
the rest of the cleanup that I wasn't expecting backports to be a
pleasant idea.

~Andrew

