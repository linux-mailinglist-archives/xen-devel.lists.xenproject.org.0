Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C391C1200
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:19:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUdu-0004Bp-Ii; Fri, 01 May 2020 12:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUUdt-0004Bj-VD
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:19:46 +0000
X-Inumbo-ID: 0a0567d4-8ba6-11ea-9b02-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a0567d4-8ba6-11ea-9b02-12813bfff9fa;
 Fri, 01 May 2020 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588335584;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aNSPAo7Um/umuy4yrkXHAy9pnWDenhQlwawKBhAiNDY=;
 b=fO4B2qcNcO6GIAcFfgvpgP7kEpOJZrF8JzIOJtt7P0ureMGJFMAUe+il
 jC33ThY0t7PfnXzpbo/HbTow+QqOKCofHUEuocrAg391ExqDLPOLcHYjB
 zWmrqaV/l4g4wHIu4ybvTQcr5sHkK02DJtYitS5+W0SOnPfbvLc5YCQ4X 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /M4eIBAXrW+avN8rV5uKd7HCg6ot95iTo7HewsBIn+bwO0vss/9yGM/JAYMCgn1CEe2soVkNUp
 JVveP3EaKFsNrFPj1Ntz353rflmejgUby3smbHhKicJOOanGSUO+8MuT26u8HhQ5iWWPi/ttz5
 txMfRRB18UIHSWuWR4fBKR+X9pwjXJjwdSZosLcx3sub9Ely/cWzblrd7jdgip9pos6/u+5sWF
 9YnekC17BQG82qGDAd8Jpg6dbtfKJcCFlJn9DrdzZz1DAHw5qSVcbpbZooAm+zekW0jeog+Was
 Uyc=
X-SBRS: 2.7
X-MesageID: 16822838
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,339,1583211600"; d="scan'208";a="16822838"
Subject: Re: [PATCH] x86/HyperV: correct hv_hcall_page for xen.efi build
To: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <c45d6098-a4e1-b565-4180-cc6da433dc57@suse.com>
 <20200501121746.7t6xtvtu2w5l5oxb@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fb545dac-43a9-cda8-f1a4-1b716308f8d2@citrix.com>
Date: Fri, 1 May 2020 13:19:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501121746.7t6xtvtu2w5l5oxb@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/05/2020 13:17, Wei Liu wrote:
> On Thu, Apr 30, 2020 at 12:24:15PM +0200, Jan Beulich wrote:
>> Along the lines of what the not reverted part of 3c4b2eef4941 ("x86:
>> refine link time stub area related assertion") did, we need to transform
>> the absolute HV_HCALL_PAGE into the image base relative hv_hcall_page
>> (or else there'd be no need for two distinct symbols). Otherwise
>> mkreloc, as used for generating the base relocations of xen.efi, will
>> spit out warnings like "Difference at .text:0009b74f is 0xc0000000
>> (expected 0x40000000)". As long as the offending relocations are PC
>> relative ones, the generated binary is correct afaict, but if there ever
>> was the absolute address stored, xen.efi would miss a fixup for it.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Wei Liu <wl@xen.org>
>
>> ---
>> Build tested only (and generated binary inspected) - Wei, please check
>> that this doesn't break things.
>>
> I don't have time to verify this in next couple of weeks, but I will
> surely notice if there is a breakage.

FWIW, the resulting assembly is identical, so it surely will be as fine
as it was previously.

~Andrew

