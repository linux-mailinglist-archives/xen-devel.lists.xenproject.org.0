Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC77248848
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82zJ-00076o-Fh; Tue, 18 Aug 2020 14:53:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k82zI-00076j-MU
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:53:20 +0000
X-Inumbo-ID: 2d1363cd-4452-4593-ad78-407fe64fa620
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d1363cd-4452-4593-ad78-407fe64fa620;
 Tue, 18 Aug 2020 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597762399;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VMNtGKCmpYPA1KUfgd8F2vWiAZaSb6+mA6M1usuJWUY=;
 b=c8vSyh6eN8EGTTBN6IdIm0G7azoV0W7dn9Uu0XpfIP10xry8ntuqFGvO
 252FWTi2/aK15YCFH93ditXObwKebLDxmcYfdAh7yn6pvYQFcPVhat0I4
 K1IM2dHwOiyK9Y7nYoXuQvCM27UUQKfI/Y2GfnHoMlfkWPAZMVFlJ/uBU 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XDTIIoBsFcvPkrxcBVl+PGfnL2jZXQltep7NbcsPA+Rfx0ajBJC2iQdFrPzkekwBTFisxMLzRN
 Y/Niv0IxGA8YXaL+zf3RHy8LJFivIiCxVZJSj2izF88OMCrzxFnkk6P8OcTzq82dip6CbDROHU
 rZjlmEb6hB3NVZCpDarCacKjiYU/IdjPMVr5mt0OMIEUJp1Ya+XjDeCv0eNlWphLhBuq2Urvt5
 0tdQYFx3tRPz8F7DvOwDv2x5YeeKmNN3oMT3UN0eTJl57OvfNOl/VvHtQmZtI14MRM38V/6pUo
 TM4=
X-SBRS: 2.7
X-MesageID: 25092713
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25092713"
Subject: Re: [PATCH 2/8] x86/svm: silently drop writes to SYSCFG and related
 MSRs
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <667ecceb-e111-5da5-74f9-9b1cc8628a6a@citrix.com>
Date: Tue, 18 Aug 2020 15:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-3-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index ca3bbfcbb3..671cdcb724 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1917,6 +1917,13 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>              goto gpf;
>          break;
>  
> +    case MSR_K8_TOP_MEM1:
> +    case MSR_K8_TOP_MEM2:
> +    case MSR_K8_SYSCFG:
> +        /* Return all 0s. */
> +        *msr_content = 0;

On a Rome box, these are the normal values:

0xc0010010 (SYSCFG) 0x740000
0xc001001a (MEM1) 0xb0000000
0xc001001d (MEM2) 0x3c50000000

The SYSCFG bits are MtrrFixDramEn[18], MtrrVarDramEn[20], MtrrTom2En[21]
and Tom2ForceMemTypeWB[22].  In particular, bits 18 and 20 are expected
to be set by the system firmware.

Clearly we shouldn't be leaking TOP_MEM{1,2} into guests, but Xen also
doesn't have enough information to set these correctly yet either.

At a minimum, I think SYSCFG wants to report 0x40000 which means "the
fixed MTRRs behave as expected", and the other bits being clear should
mean that TOP_MEM{1,2} aren't enabled.

~Andrew

