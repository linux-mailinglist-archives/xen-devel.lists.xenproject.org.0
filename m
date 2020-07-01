Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3E21103B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 18:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqfFz-0000e1-Gl; Wed, 01 Jul 2020 16:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe6U=AM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqfFx-0000dw-Sy
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 16:06:41 +0000
X-Inumbo-ID: d869d8f6-bbb4-11ea-8733-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d869d8f6-bbb4-11ea-8733-12813bfff9fa;
 Wed, 01 Jul 2020 16:06:39 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XYdSQsJ1TLytDbKUdkoLb8wITnvE7AAdptQsFMitKD4MMAIQJw/X2Aul1vubGwu6HqLpCFZU1e
 bY57isVcdQLvQBgQ/YTmnsB4xT4vlj3ITCdXaVI+ZY95CAAmoEEJfIm7yEXZzPmU0jClzM/FZX
 pUrvRtmG8cpVo+0OcWdAtYaZSMXXZfIEiGk3bR3eeZrKajrNz6Uhu+f4rO4Crzrusa3m25DPTY
 P21cHQcrZppGJBlL6OR38Sv3xahODqLdKng5yEe9+FNVmEGpCi9lN9ZNAiSoIciEdtvJ5Vz8iQ
 xsw=
X-SBRS: 2.7
X-MesageID: 21724774
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,300,1589256000"; d="scan'208";a="21724774"
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <85416128-a334-4640-7504-0865f715b3a2@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
Date: Wed, 1 Jul 2020 17:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <85416128-a334-4640-7504-0865f715b3a2@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/07/2020 16:12, Julien Grall wrote:
> On 30/06/2020 13:33, Michał Leszczyński wrote:
>> @@ -305,7 +311,6 @@ static int vmx_init_vmcs_config(void)
>>                  SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
>>                  SECONDARY_EXEC_XSAVES |
>>                  SECONDARY_EXEC_TSC_SCALING);
>> -        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>           if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
>>               opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
>>           if ( opt_vpid_enabled )
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 7cc9526139..0a33e0dfd6 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>>     vcpu_info_t dummy_vcpu_info;
>>   +bool_t vmtrace_supported;
>
> All the code looks x86 specific. So may I ask why this was implemented
> in common code?

There were some questions directed specifically at the ARM maintainers
about CoreSight, which have gone unanswered.

~Andrew

