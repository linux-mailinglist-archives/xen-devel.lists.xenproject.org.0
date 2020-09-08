Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B326105E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 12:59:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFbKv-0001Kd-I9; Tue, 08 Sep 2020 10:58:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Jy8=CR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFbKu-0001KY-BA
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 10:58:52 +0000
X-Inumbo-ID: b75bb72f-814d-4506-a8e3-3bbf023c06fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b75bb72f-814d-4506-a8e3-3bbf023c06fa;
 Tue, 08 Sep 2020 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599562731;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sYa1G56st+JukFgACCjIuET9cfgFSqPJrgBlmwEoris=;
 b=cPIiF/PjYCv5Z6kLC5/dA1qLaxWVbexo3DL3xBWUlK43JcbdmzJ4OjAx
 z9sT+9bDHK8Y1CEuTxZyHnLPvZlQso5ivG8ZBCLbJ6Q0PY09Y779NGXLj
 q0uhOTLnG0rx5YVRbfUYeBIqyYLqvb4tQ7c799Er2OOuzuZJAltOTBy8j c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4lbOz95U6Vrquf7pUTJ9pZ1eWsZzs1eHNYjBHuh9GI2nDQaIhE1XJGgg6xV1DAmr40Xnfdlyfr
 5OnDswIQyVljYNr7gKS4SZQQESVhzWvTicVrqVxtI8Gkcg+E2bIi2Quad9nYKMg7rSaKPL5umZ
 KjSOuEikXGT75F4/m8y++DgOb5aeK9LOBl9LSLSOWFRiLNOh3+2ahL2XrlXsBrgtaGRDOI5I7k
 zRgPhrdd6sG1kZ97BlSI60n3ophRxRsZ9lLgwb2EPUua0+8JTI8/YViwY02ievu9BvfdPenepY
 BDA=
X-SBRS: 2.7
X-MesageID: 27140779
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,405,1592884800"; d="scan'208";a="27140779"
Subject: Re: [PATCH] x86/pv: Drop assertions from svm_load_segs()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200908100803.8533-1-andrew.cooper3@citrix.com>
 <0b103b28-537a-1bad-d844-459a36d142d5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9021f8ed-7cdc-31b7-6713-0436220a2ac6@citrix.com>
Date: Tue, 8 Sep 2020 11:58:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b103b28-537a-1bad-d844-459a36d142d5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/09/2020 11:36, Jan Beulich wrote:
> On 08.09.2020 12:08, Andrew Cooper wrote:
>> OSSTest has shown an assertion failure:
>> http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log
>>
>> These assertions were never appropriate, as they rule out legal (and, as it
>> turns out, sensible perf-wise) inputs based on an expectation of how the sole
>> caller would behave.
> I wouldn't put it this way - not coming here was a requirement in
> the old logic, when we expected non-null selectors to remain in
> sync with the GDT/LDT. But yes, they needs to be dropped now.

Urgh.  That is a can of worms, as this path doesn't preserve the GDT
attributes/limits.

>
>> Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")
> With your S-o-b added
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oops.  Thanks, but no - I retract this patch.  Will submit a different
one shortly.

~Andrew

