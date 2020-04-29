Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214331BDC5F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 14:35:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTlvT-0002fc-UK; Wed, 29 Apr 2020 12:34:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTlvS-0002fU-Dd
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 12:34:54 +0000
X-Inumbo-ID: cf212721-8a15-11ea-993e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf212721-8a15-11ea-993e-12813bfff9fa;
 Wed, 29 Apr 2020 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588163687;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9k33F4hgR+V4F3y/9N2bCfa6gb428rr3sfTfFTQyvSM=;
 b=ZMTdjQEu6bUmkAYDo/Dw5Q1AID6paoicCLhjzXwhoFMnOjnNRK8n9YYW
 sqPb9nSsJIOqjVKPdwsfbMrRtoEu368+/flOa594MaRAYwNCHPNKeYoF5
 y/xXp87f9yzW3FoO50gHb+pEAGKIoDdJID9tEAwZbjoKzfOAOULOKL4lM s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pZvIiy9Omj3s7gRbP5t5GHyKCL2lkLtdfHUx5DQu2JH6lhg4euykVWArxXFitrZ4e9Nil9B+ie
 4At2nQrn1TOpG2WoGa0p3h+4/idmHFqDZsgdYPil9jL977TS4cW5XOag1iUp7B+VFO/gfGBCrQ
 kbyapf8EmMwvg52GEpqFDSiHtC53ZhvdafP1GostWIMoUZFcTOC6BrJtml0D45knvRhWQR1oVc
 9Pmj3vyUEMYkh4tmUvd/jtEhsbfuq9ZLIL/4HcChyHmeCTmqVc72YeG2KV7iNqqSauF6MRhbDl
 kSo=
X-SBRS: 2.7
X-MesageID: 16421262
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16421262"
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, Wei Liu <wl@xen.org>
References: <3ed7eb87-070c-28ea-4f8a-aa4421cea93a@citrix.com>
 <5ea8173d.1c69fb81.915ba.8400@mx.google.com>
 <c242b963-ae80-1ca0-9b4d-fe2c8f66b6a2@citrix.com>
Message-ID: <34cc563f-9e05-b55c-54f4-55104d2d42b5@citrix.com>
Date: Wed, 29 Apr 2020 13:34:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c242b963-ae80-1ca0-9b4d-fe2c8f66b6a2@citrix.com>
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
Cc: minios-devel@lists.xenproject.org, samuel.thibault@ens-lyon.org,
 JBeulich@suse.com, Stefan Bader <stefan.bader@canonical.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/04/2020 12:55, Andrew Cooper wrote:
>> Below is what I was preparing to submit as a patch.  So, yes it hacks around
>> it, but it isn't messy.
>>
>> ---
>> Disable fcf-protection to build working binaries
>>
>> Ubuntu gcc-9 enables -fcf-protection by default, which conflicts with
>> -mindirect-branch=extern and prevents building the hypervisor with
>> CONFIG_INDIRECT_THUNK:
>> xmalloc.h:81:1: error: ‘-mindirect-branch’ and ‘-fcf-protection’ are not
>> compatible
>>
>> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
>> or else the hypervisor will not boot.
>> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260  Similarly,
>> rombios reboots almost immediately without -fcf-protection=none.  Both
>> of those can be handled by setting it in EMBEDDED_EXTRA_CFLAGS.
>>
>> CC: Stefan Bader <stefan.bader@canonical.com>
>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Sadly, this isn't really appropriate.  We specifically do want to use
> both -fcf-protection and -mindirect-branch=thunk-extern together, when
> GCC isn't broken.
>
> Overriding -fcf-protection is ok but only when we're certain we've got a
> buggy GCC, so that when this bug is fixed, we can return to sensible
> behaviour.

GCC has been adjusted on master
(https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9be3bb2c0a258fd6a7d3d05d232a21930c757d3c)
and the gcc-9 branch
(https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=a03efb266fcbf4a01285fff871a5bfe5caac4944). 
This should be fixed for GCC 10 and 9.4

I checked the resulting hypervisor build with both -fcf-protection and
retpolines, and it works fine.

The question now is what to do all the buggy GCCs out there.  We can
either ignore the problem and it will eventually go away, or spot the
problematic compiler and clobber -fcf-protection.

We also need to see what is wrong with RomBIOS, because that is weird. 
However, we should not be interfering with the HOSTCC settings.

~Andrew

