Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C61B1313
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 19:31:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQaGL-00074V-LD; Mon, 20 Apr 2020 17:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQaGJ-00074Q-Or
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 17:31:15 +0000
X-Inumbo-ID: bb60ae94-832c-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb60ae94-832c-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587403874;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=F05uyVxwp1JoOAOpYLy8FCYYOpsSUjvQDelW8C5ZJV0=;
 b=NDEQiIQmJjIt9W60KZRUgTLwgMu84/n9Ja8sJsKf7x4phHx50HjInwcD
 ULpuaueckblHzXey/E1/XtKn/ymy10VdkQmT1X8PUTLaZtfHc0sAhsV5+
 ahNRLZD+iLfgG+b7YniwHuh8XN90OjfuWAk7+WXIR5uQRPbbWlSgZu8ya 4=;
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
IronPort-SDR: oR7G4JNTMS4paASmxqOKN3Z+jn+ViELXowzJJjdiXAYukZRbjZU0mKlEynaE1eSyo34/alwK4I
 592OgIzUi35Nk8nN+PP4SZM71P9wf3XWlBVUTEe9Gu4kAVDElUiZqttccPRvziv8fxYHATBDY1
 Jn4vXVnPVeu3/m4jTTwqQ/q7TiMZFFO43VhAMqz1LUJCbuITLkpI1qMgqNXd4gHy0PANMoYckE
 BjX9M382mQUNfad33HHZeGwFt2tD5zaaWyaXnL8z0/TxtbqkJRYMQtPP/jFrhP4JMPPC3CbnAs
 dKk=
X-SBRS: 2.7
X-MesageID: 15970648
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="15970648"
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
 <20200420134757.GS28601@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <71867ff0-6b4b-0355-d547-8ba7685a89e2@citrix.com>
Date: Mon, 20 Apr 2020 18:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420134757.GS28601@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 14:47, Roger Pau Monné wrote:
> On Fri, Apr 17, 2020 at 04:50:02PM +0100, Andrew Cooper wrote:
>> This is the start of some performance and security-hardening improvements,
>> based on the fact that 32bit PV guests are few and far between these days.
>>
>> Ring1 is full or architectural corner cases, such as counting as supervisor
>                 ^ of

Already fixed (I spotted it 30s after posting).

>> from a paging point of view.  This accounts for a substantial performance hit
>> on processors from the last 8 years (adjusting SMEP/SMAP on every privilege
>> transition), and the gap is only going to get bigger with new hardware
>> features.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> There is a series I can't quite post yet which wants to conditionally turn
>> opt_pv32 off, which is why I've put it straight in in an int8_t form rather
> s/in in/in/

"in in" is legitimate in some cases, despite it looking awkard.   In
this case, the structure is "straight in", separate from "in an int8_t
form".

If this sentence were for inclusion in the commit message, I'd have
probably spent more effort trying to phrase it differently.

>
>> than a straight boolean form.
>> ---
>>  docs/misc/xen-command-line.pandoc | 12 +++++++++++-
>>  xen/arch/x86/Kconfig              | 16 ++++++++++++++++
>>  xen/arch/x86/pv/domain.c          | 35 +++++++++++++++++++++++++++++++++++
>>  xen/arch/x86/setup.c              |  9 +++++++--
>>  xen/include/asm-x86/pv/domain.h   |  6 ++++++
>>  5 files changed, 75 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index acd0b3d994..ee12b0f53f 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1694,7 +1694,17 @@ The following resources are available:
>>      CDP, one COS will corespond two CBMs other than one with CAT, due to the
>>      sum of CBMs is fixed, that means actual `cos_max` in use will automatically
>>      reduce to half when CDP is enabled.
>> -	
>> +
>> +### pv
>> +    = List of [ 32=<bool> ]
>> +
>> +    Applicability: x86
>> +
>> +Controls for aspects of PV guest support.
>> +
>> +*   The `32` boolean controls whether 32bit PV guests can be created.  It
>> +    defaults to `true`, and is ignored when `CONFIG_PV32` is compiled out.
>> +
>>  ### pv-linear-pt (x86)
>>  > `= <boolean>`
>>  
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 8149362bde..4c52197de3 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -49,6 +49,22 @@ config PV
>>  
>>  	  If unsure, say Y.
>>  
>> +config PV32
>> +	bool "Support for 32bit PV guests"
>> +	depends on PV
>> +	default y
>> +	---help---
>> +	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
>> +	  was deprecated and mostly removed in the AMD64 spec.  As a result,
>> +	  it occasionally conflicts with newer x86 hardware features, causing
>> +	  overheads for Xen to maintain backwards compatibility.
>> +
>> +	  People may wish to disable 32bit PV guests for attack surface
>> +	  reduction, or performance reasons.  Backwards compatibility can be
>> +	  provided via the PV Shim mechanism.
>> +
>> +	  If unsure, say Y.
>> +
>>  config PV_LINEAR_PT
>>         bool "Support for PV linear pagetables"
>>         depends on PV
>> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
>> index 70fae43965..47a0db082f 100644
>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -16,6 +16,39 @@
>>  #include <asm/pv/domain.h>
>>  #include <asm/shadow.h>
>>  
>> +#ifdef CONFIG_PV32
>> +int8_t __read_mostly opt_pv32 = -1;
>> +#endif
>> +
>> +static int parse_pv(const char *s)
> __init
>
> With that:
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,

~Andrew

