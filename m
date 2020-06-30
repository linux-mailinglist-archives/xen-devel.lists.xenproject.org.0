Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800120FAA9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 19:37:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqKC2-00015T-PC; Tue, 30 Jun 2020 17:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AUS=AL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqKC1-00015O-Ed
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 17:37:13 +0000
X-Inumbo-ID: 544516c4-baf8-11ea-8678-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 544516c4-baf8-11ea-8678-12813bfff9fa;
 Tue, 30 Jun 2020 17:37:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +Np/BWtx/I4QIB4sV5N2Yq25bSkFW8TR+l9C7IrlpO9A1kqCJ8vK73ynl0/IQN9QoHpofXj80+
 e7BVcFeZVcfooUrBJS/9ZnIDnYSfKCf3/gvZRoYiUb97YPL8ZG0l7SGUoIQN8nMnx8msLVYQwC
 wX/dI0iqcdbTHpiIQn42pSfQQqbUE6biBGKUW2ZHHha+CuMy5IV+6qLCh7/VIfCdfS105OsL8g
 YMtgPMSq18GHQEKdo6mQBPI61qr2b6ox9edoV+zRRjbl3h4c8g4fZH0slpIBq/9U7g9z3HnHKU
 8qc=
X-SBRS: 2.7
X-MesageID: 21312351
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,298,1589256000"; d="scan'208";a="21312351"
Subject: Re: [PATCH v4 01/10] x86/vmx: add Intel PT MSR definitions
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b1d4177d-8a00-06fb-97fd-bf5f1ba42319@citrix.com>
Date: Tue, 30 Jun 2020 18:37:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: tamas.lengyel@intel.com, luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/06/2020 13:33, Michał Leszczyński wrote:
> diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
> index b328a47ed8..0203029be9 100644
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -69,6 +69,43 @@
>  #define MSR_MCU_OPT_CTRL                    0x00000123
>  #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
>  
> +/* Intel PT MSRs */
> +#define MSR_RTIT_OUTPUT_BASE                0x00000560
> +
> +#define MSR_RTIT_OUTPUT_MASK                0x00000561
> +
> +#define MSR_RTIT_CTL                        0x00000570
> +#define  RTIT_CTL_TRACEEN                    (_AC(1, ULL) <<  0)
> +#define  RTIT_CTL_CYCEN                      (_AC(1, ULL) <<  1)

In addition to what Jan has said, please can we be consistent with an
underscore (or not) before EN.  Preferably with, so these would become
TRACE_EN and CYC_EN.

That said, there are a lot of bit definitions which aren't used at all. 
IMO, it would be better to introduce defines when you use them.

Thanks,

~Andrew

