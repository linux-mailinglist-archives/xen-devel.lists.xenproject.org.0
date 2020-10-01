Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110B27FE02
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 13:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1206.4057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwMJ-0002Lt-Ru; Thu, 01 Oct 2020 11:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206.4057; Thu, 01 Oct 2020 11:02:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwMJ-0002LU-O9; Thu, 01 Oct 2020 11:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1206;
 Thu, 01 Oct 2020 11:02:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNwMH-0002LP-Mg
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:02:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 288b56f7-752b-4029-a158-64a97d0ea117;
 Thu, 01 Oct 2020 11:02:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNwMH-0002LP-Mg
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:02:45 +0000
X-Inumbo-ID: 288b56f7-752b-4029-a158-64a97d0ea117
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 288b56f7-752b-4029-a158-64a97d0ea117;
	Thu, 01 Oct 2020 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601550164;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XmSD0smz/pk8Ati3b8Dzz9Mct/ibGnDTXyZisU7AXgQ=;
  b=IeuA8tmchugigdcFZSGLHNSjmPKbYJYHtFS6PjcEwBBy7OhehVQ8+kP5
   rBUB3JrFljr59n7Tm4Bbjq7e+LiS0KSucna5htLYvHi+wkYa/DZ20JdlT
   uoq1mX20kfKLxdzi/13Z5VBkiKBw0f8FkR6FfYoENMdJoHTXPuUVPm5oz
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cro7dUeUxmZSoDaz9kczXxIT6905YTfydMRownwBVdbW+To5OxBBS+IyZ2cSRSxN0WemvhJd6d
 04GETImC/F1H4gH3JtHAlKeZ6v//6mqQ0bLL/NVNLbxFfHdxQnOSo2i/4lm6O78jiWGhDOuqDE
 9yMJW8lIE8qpQDcCaWHTm27PiDYoCkMzRs4gAl1uCfsuUePvwmfmxqM+mwk1GXhUeN7zYSk+eq
 Pi906Adolxm40XMNA3fv1twxTUzRn6F3p/WbxWRuPq99GLILyYliO4pQ7tdjfzTtXvrUQkvWpP
 YUI=
X-SBRS: None
X-MesageID: 28147959
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28147959"
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-4-andrew.cooper3@citrix.com>
 <32a955ad-9995-6df2-3d7b-6b3eb7b1d656@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8e25a67b-21f1-5203-6531-4ed378a74bfb@citrix.com>
Date: Thu, 1 Oct 2020 12:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <32a955ad-9995-6df2-3d7b-6b3eb7b1d656@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 01/10/2020 11:23, Jan Beulich wrote:
> On 30.09.2020 15:42, Andrew Cooper wrote:
>> @@ -667,6 +668,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>           */
>>          config->flags |= XEN_DOMCTL_CDF_oos_off;
>>  
>> +    if ( nested_virt && !hap )
>> +    {
>> +        dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n");
>> +        return -EINVAL;
>> +    }
> Initially I was merely puzzled by this not being accompanied by
> any removal of code elsewhere. But when I started looking I couldn't
> find any such enforcement, but e.g. did find nsvm_vcpu_hostrestore()
> covering the shadow mode case. For this to be "No functional change
> yet" as the description claims, could you point me at where this
> restriction is currently enforced?

Currently enforced in the HVM_PARAM_NESTEDHVM write side effect, which
is deleted in patch 5.

~Andrew

