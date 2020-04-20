Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72D1B13E9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 20:06:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQanw-0001Yw-AO; Mon, 20 Apr 2020 18:06:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQanu-0001Yr-Fy
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 18:05:58 +0000
X-Inumbo-ID: 9527bc72-8331-11ea-9090-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9527bc72-8331-11ea-9090-12813bfff9fa;
 Mon, 20 Apr 2020 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587405957;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=s/IklyaZa/hQRtFMHdxIo4fYDsXN+b7ayxeBXoKUNw4=;
 b=YMxDhcSZkSNRCCQi1S/3HMlJyINvqMskhaxn+zTaqvIGtbWgcc+Ulu61
 5fgXRTFuIvhW9pRAZGAC/N1F7nJvRu5r0YotP7Qf4OHlq/Mt8Bc0MJA9O
 os4ATivd3AvD4ecABbSdbLTK/I/KqY/vQ8TfRf5jVFhyHRWxkjCEuUOhE 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GhSzeoTZdqh/6giK/iWNmtZqUJVaWMZzWo1G8b89bhCDv0xfzb9TPzcQYN+7aylDly4Wj5q/vP
 TRkyb9XDu52apeira8P7e3Sz+SOwuAVJfEQMOIVtZ+qmxpr1/4N6zpkocWF9dQIQTzr6QsOUF4
 uuWuzmk1gd0tfI+cDVeGmTOSnYExBZGReUo6FuuL6+GCJy9RQL4HkvxkuGY3tmmYOOldFGMR5+
 IoCcpdSuhXLj77chl1GdLCnsqL9k3VtqPa0hNhy1Rcun7AMcvIBEmG0SYTdlMSgWxLLwbaapLP
 oyU=
X-SBRS: 2.7
X-MesageID: 16272721
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="16272721"
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
To: Jan Beulich <jbeulich@suse.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
 <5dc9dbd9-fbeb-46ef-4d4e-7916c3219bb3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4e732f90-1d5f-7ae5-0f02-6b313a381df7@citrix.com>
Date: Mon, 20 Apr 2020 19:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5dc9dbd9-fbeb-46ef-4d4e-7916c3219bb3@suse.com>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 15:05, Jan Beulich wrote:
> On 17.04.2020 17:50, Andrew Cooper wrote:
>> This is the start of some performance and security-hardening improvements,
>> based on the fact that 32bit PV guests are few and far between these days.
>>
>> Ring1 is full or architectural corner cases, such as counting as supervisor
> ... full of ...
>
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
> Rather than ignoring in the way you do, how about ...
>
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
>> +{
>> +    const char *ss;
>> +    int val, rc = 0;
>> +
>> +    do {
>> +        ss = strchr(s, ',');
>> +        if ( !ss )
>> +            ss = strchr(s, '\0');
>> +
>> +        if ( (val = parse_boolean("32", s, ss)) >= 0 )
>> +        {
>> +#ifdef CONFIG_PV32
>> +            opt_pv32 = val;
>> +#else
>> +            printk(XENLOG_INFO
>> +                   "CONFIG_PV32 disabled - ignoring 'pv=32' setting\n");
>> +#endif
>> +        }
> ... moving the #ifdef ahead of the if(), and the #endif here (may
> want converting to "else if" with a placeholder if(0) for this
> purpose), with the separate printk() dropped?

In this specific case, it would be even more awkward as there is no use
of val outside of the ifdef.

> I'm in particular
> concerned that we may gain a large number of such printk()s over
> time, if we added them in such cases.

The printk() was a bit of an afterthought, but deliberately avoiding the
-EINVAL path was specifically not.

In the case that the user tries to use `pv=no-32` without CONFIG_PV32,
they should see something other than

(XEN) parameter "pv=no-32" unknown!

I don't think overloading the return value is a clever move, because
then every parse function has to take care of ensuring that -EOPNOTSUPP
(or ENODEV?) never clobbers -EINVAL.

We could have a generic helper which looks like:

static inline void ignored_param(const char *cfg, const char *name,
const char *s, const char *ss)
{
    printk(XENLOG_INFO "%s disabled - ignoring '%s=%*.s' setting\n",
cfg, name, s, (int)(ss - s));
}

which at least would keep all the users consistent.

> See parse_iommu_param() for
> how I'd prefer things to look like in the long run.

I'm aware of that, just as you are aware of my specific dislike for the
ifndefs, which make the logic opaque and hard to follow.

~Andrew

