Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E61FBAEC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:15:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEF3-0006P2-3S; Tue, 16 Jun 2020 16:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlEF2-0006Ox-2y
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:15:16 +0000
X-Inumbo-ID: 8f996296-afec-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f996296-afec-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 16:15:14 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BithpZqCZRPYeDFMq8W9xUUBDG4l+01TqkK+wGNFSATYeCOsSHC4m6F7qBmQ+sCPBsXSgqxHu4
 tHcp1EC1yQNxZqb65GZwoRh1s5WFvGldNDrCubxfAHnfjvpSkaGNB0z+Bwz0Px9uExT0gJH0Il
 8Sv6ZzOW+bNMUrNK0du/fsewPvKX2HWRbDCiQQGzhNbALL07lysWwXf0MANAHbgH0ZVoqrNu2I
 nt2QpXBMN9H5etyfxdl/uazsMzHL90X+vUTaz7eQTGQjiyVd9NSgCFRuav5pq1Znjn/tR1+xNb
 97o=
X-SBRS: 2.7
X-MesageID: 20530975
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20530975"
Subject: Re: [PATCH 7/9] x86/hvm: Disable MPX by default
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-8-andrew.cooper3@citrix.com>
 <58d7254d-8953-93c4-9eb2-9be45f39bc4e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ee0819ab-71fe-dcc3-69c0-798ca9a2972c@citrix.com>
Date: Tue, 16 Jun 2020 17:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <58d7254d-8953-93c4-9eb2-9be45f39bc4e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 10:33, Jan Beulich wrote:
> On 15.06.2020 16:15, Andrew Cooper wrote:
>> @@ -479,6 +497,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>          goto out;
>>      }
>>  
>> +    /*
>> +     * Account for feature which have been disabled by default since Xen 4.13,
>> +     * so migrated-in VM's don't risk seeing features disappearing.
>> +     */
>> +    if ( restore )
>> +    {
>> +        if ( di.hvm )
>> +        {
>> +            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
> Why do you derive this from the host featureset instead of the max
> one for the guest type?

Because that is how the logic worked for 4.13.

Also, because we don't have easy access to the actual guest max
featureset at this point.  I could add two new sysctl subops to
get_featureset, but the reason for not doing so before are still
applicable now.

There is a theoretical case where host MPX is visible but guest max is
hidden, and that is down to the vmentry controls.  As this doesn't exist
in real hardware, I'm not terribly concerned about it.

>  Also, while you modify p here, ...
>
>> +        }
>> +    }
>> +
>>      if ( featureset )
>>      {
>>          uint32_t disabled_features[FEATURESET_NR_ENTRIES],
> ... the code in this if()'s body ignores p altogether.

That is correct.

> I realize the
> only caller of the function passes NULL for "featureset", but I'd
> like to understand the rationale here anyway before giving an R-b.

The meaning of 'featureset' is "here are the exact bits I want you to use".

It has existed since my original CPUID work in 4.6/4.7.  Currently, the
only user in XenServer, and its a stopgap on the way to the "proper"
solution which I've been working on for the past several years.

~Andrew

