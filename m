Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21404A56FD1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 18:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905266.1313147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqbxv-0004D4-27; Fri, 07 Mar 2025 17:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905266.1313147; Fri, 07 Mar 2025 17:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqbxu-0004B6-Uk; Fri, 07 Mar 2025 17:58:30 +0000
Received: by outflank-mailman (input) for mailman id 905266;
 Fri, 07 Mar 2025 17:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqbxt-0004Ax-K9
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 17:58:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4246b68-fb7d-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 18:58:26 +0100 (CET)
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 17:58:21 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9c) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.11 via Frontend Transport; Fri,
 7 Mar 2025 17:58:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 17:58:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 11:58:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 11:58:18 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 11:58:17 -0600
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
X-Inumbo-ID: c4246b68-fb7d-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuPbhR1KeJ6PaQdTnsoaH1YVJZIKs8NqdX2FJqyUHmHNx67m5hPyv09v93b713JZ04+xHy+tHovvfbrfJ96qwdiUQR0gdlG9VK6Jn4/WcZ75D8//tNw5xzWqvh4IYarttb2jE1o62UB5AbtDAE+IkX5CE992ilX8DgYoKMazc67QLp81+dHQCwQq657WP/tV4sNF6diMOgk66qDvP/vEGVWmBF48miJlUUR4JIqVIs4N6XHAqlTx5JVNymdLprJHTvHqB6cMHEdwIn1PhSKjSPfRt8quZ2YE4XkQC3bQTUX0TqhQ5Dn75OyCZ+NGRsB7Txe3v15TyAvI67HxwVoL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIHNE9Ii/J+FsdfR48xw7xJyclQHvqEJ7v+DfEhtS2M=;
 b=ktMUpmGIdMDuvKCpUuNu+FdyR6T3sDgHYrqddqiUFctvAlWpR5RLycNUAXY3Bh6gJZYn36aVtwjQrjFRHBdAmmiQxEnVHFXxPftkG6kaOl9+jN9qlnME5EmVb2t8cUq6qE5kUJlGTThHYnM/ml0ABY9Q1HWDOOOpIEYwN7abVuiwlf7kXokJo2hxlaEkdGIL+7BkVzshuQSDdKn3f5WoJP4oJTA8nltwpuFZM+tLjcBvekQKnpu+zerFhyijcPX1kPPYs1A6a1borVsQfh5Hh6FfFeBzQnAZKqPFJA3POhctm3mbsSgj0seXJbB3hGYO2CQH/tfzVAlAumyaeAa3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIHNE9Ii/J+FsdfR48xw7xJyclQHvqEJ7v+DfEhtS2M=;
 b=oRFCgBJTtRTp2Qj2nzJgqIvkvvInq/M03/+1XuztFOushBhPF94PFDYb2xN5EARi2Qojj6GtY5vi2KUhpV++jKtu6QfMcDgcKhlvDdK69A/ZS9396aLgHrRNAnOeDtowNhksnS9gmnUyurPNuxL3cF4mOacImaAemJgBRSuYP+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Content-Type: multipart/mixed;
	boundary="------------UjfTwq5u02D0WqrgKI9HLqjz"
Message-ID: <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com>
Date: Fri, 7 Mar 2025 12:58:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e558f1-a3a3-474b-590e-08dd5da1a524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUNuai9CUm5YQ3Z6R1JwOXhvWmxkVDdsWkEvSmFxeVZWWXNOWVhkVG1VWkdW?=
 =?utf-8?B?WHZla2owYkhQS0JrcjF0TGNDNWlGR25EZGpCaGdUWjFPZDZ5bUdXYjVpNDY3?=
 =?utf-8?B?NEVsN015VWFVNDBjMzEwa0ZtYndSRFBMbGdQQ2QzMDloWWJNQTVTejhCYTIw?=
 =?utf-8?B?eGZacG1sTzFrVjV2aFdIdkEzcUl6eWdBSFpnK3pEVm9BSDkxOHRPTFZSTkRi?=
 =?utf-8?B?UUc5Mzk2allGeHFrWnhodTNndHpRL3NZcjZQczJMVlBnM3NKbEp5UkhYWEN6?=
 =?utf-8?B?dkxhK1IydDMxM3Z5RTB2RTE4VVM4N2lIT1pIWFZ1OXgvcGVvRFVDYk9kbStx?=
 =?utf-8?B?TmxnTGRCUXJTV3BWR3N4MHoxSTFrdmU5QzZQY2U4UFBpVmNsMXozbkxyR2tZ?=
 =?utf-8?B?N1hXNzJsNTBZa1EvK0JWaXloV3hQUm5pZlMvRWNoWXlzbjlhN0FJL2xvdE05?=
 =?utf-8?B?KzhNajVZYlRUWlF1THgxT1MwVTFNaVpqSlNyZFQyQjRaWnZUNnAzd1I2Rm5x?=
 =?utf-8?B?YWQweW9lVmxac1NyOWpWaGhsMkM5UEp1K3Z0REQ1ekY5UThZNDRIMEhpSk54?=
 =?utf-8?B?Ym5SbnFuSnhGZkxWdkZkcWNrUDNJWjAvcnM3ZVltOGtBYmVGazVyZU5LSkJB?=
 =?utf-8?B?a2VyQkxoWEhlWGRXaTRkaDE0Wnd6RG5BMGppNm1UbnVMdFZVNFBuRWtmYWM0?=
 =?utf-8?B?SDg5elpvRW9jMmNSSWFQR3h1M0VQNVl4UWQ4Yi9idW4vU1JwdEFwMTlzM09D?=
 =?utf-8?B?TXRKdm5TYlRDRnpjRC9nNnBsdFdGQkxtdlFJVWp4andqeCs3UEpSVHY4a251?=
 =?utf-8?B?bVdFMVpTa2Q5NkVaMjNsTThxaEx3SXNqNWFlbGNSNVMzd08wc2R6d295N0FV?=
 =?utf-8?B?UXY5ZWR2cU16M1dMYnNnQlZFeU43Y3FmR203QkZ4NWt3T0lBMjlNYnhpUGFN?=
 =?utf-8?B?WmgvQy9MUERZZVd4ejUxcm9SSnVjd242Sy9zM0NKMFRiTmhVZFU0V1RQamJ6?=
 =?utf-8?B?TFpxN1lDTThLajJuNTFFRHZ1S3hzYzBjSGkwQytBVytCR21ZUE9vdDV3ZnVI?=
 =?utf-8?B?Um11QzdRclVMb0YvT1N0ODhoUEFaTWJaTXhibWVXNUdGQXlidTB4RHJpQTdx?=
 =?utf-8?B?SU5heER0TUwycmc0YXM1dmdTcS9tZEJHb1VJL0JBK204cGZTcUlwN2ZBQ2tS?=
 =?utf-8?B?Ty9UQi9XN01qQUpKYkYreEdZSlJuN2lpTmQwMlJEaEhGZ2xVSGpDRUNOWjVa?=
 =?utf-8?B?OWVHRkJUZVBvWlh4RnRBazVpOEZDV3JVbXlDeDl2T2pzN0lKYWdYODdjZGdZ?=
 =?utf-8?B?K20rdXA1OWRENVNUN3RtVGNkcWh5Yk8zQ2RrZkdUL2NGN3pmdFhpdTFqbExx?=
 =?utf-8?B?ZmQyT2pKV3N6UWU2enErNjZONmwxVWdmcmpETFpvb2wyYWFxWjV2MFV1VzEr?=
 =?utf-8?B?SFFGWTRFbnEzcWRBZnBXRlFyeWtUZmN5bzVkaTdDVmN4MkN4dG1YQzFUNi8v?=
 =?utf-8?B?NnQyd1VybW52T0puaVorYTB1MnMycTVLYW9MRDZMT0pzZ0tDVTdYMnRLSVA1?=
 =?utf-8?B?cVdCOWE2dGMxaUpJSXowWkg2cHZVZDZJWVA2Q1JnenZzcWN1WXg5MG96K2FN?=
 =?utf-8?B?UUlUdWZDZTFZVnVzWWkrYWhLZkhFdWx5QllCcC9Beld4NDVzWERpNkRHVVdu?=
 =?utf-8?B?TUs1TFZ0NDNaeEpCb1RBWHdxQ0l5N0h6WktYTE4wMHNDVDNnV1hvZXUyenpQ?=
 =?utf-8?B?KzJkUytBWEVYaHp0OVRtWkoyVzFuT1BxaHRmRjVYelJnTkZBZ241Z1BvMFNx?=
 =?utf-8?B?NzloQXVuWlpDaWNNdVlwWDYrK1hjSWxVbS9wU2tSUVA5UkVYeW9lbzVHUEl2?=
 =?utf-8?B?eWpldFdmTnhNWkl0WE9MTXcxSFBuVEZiVm1EdHRnVUJhaHJlN2xkYUUrdU15?=
 =?utf-8?B?NHR4ek0zekgzTndRMHFURjZrWVdtNEhsOFhTYlF6ZWszdlk4am53ZzloWHN4?=
 =?utf-8?Q?ujrxERigMX5oomLhvp9qCia/SQ2PcA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(4053099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 17:58:19.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e558f1-a3a3-474b-590e-08dd5da1a524
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453

--------------UjfTwq5u02D0WqrgKI9HLqjz
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-07 04:01, Julien Grall wrote:
> Hi,
> 
> On 06/03/2025 22:03, Jason Andryuk wrote:
>> Add capabilities property to dom0less to allow building a
>> disaggregated system.
>>
>> Introduce bootfdt.h to contain these constants.
>>
>> When using the hardware or xenstore capabilities, adjust the grant and
>> event channel limits similar to dom0.
>  > > Also for the hardware domain, set directmap and iommu.  This brings 
> its
>> configuration in line with a dom0.
> 
> Looking the device tree bindings, a user would be allowed to disable 
> "passthrough" or even "directmap". This means, we would never be able to 
> disable "directmap" for the hardware domain in the future with the 
> existing property (this is to avoid break backwards compatibility).
> 
> Instead, I think we should check what the user provided and confirm this 
> is matching our expectation for an hardware domain.
 >
> That said, I am not entirely sure why we should force directmap for the 
> HW domain. We are starting from a clean slate, so I think it would be 
> better to have by default no directmap and imposing the presence of an 
> IOMMU in the system.

Ok, it seems like directmap is not necessary.  It was helpful early on 
to get things booting, but I think it's no longer necessary after 
factoring out construct_hwdom().

What exactly do you mean by imposing with respect to the iommu?  Require 
one, or mirror the dom0 code and set it for the hwdom?

     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;

> Lastly, can you provide an example of what the hardware domain DT node 
> would looke like?

I've attached a dump of /sys/firmware/fdt from hwdom.  (This is direct 
mapped).

>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -12,6 +12,7 @@
>>   #include <xen/sizes.h>
>>   #include <xen/vmap.h>
>> +#include <public/bootfdt.h>
>>   #include <public/io/xs_wire.h>
>>   #include <asm/arm64/sve.h>
>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>               panic("No more domain IDs available\n");
>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>> +        {
>> +            if ( val & ~DOMAIN_CAPS_MASK )
>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>> +
>> +            if ( val & DOMAIN_CAPS_CONTROL )
>> +                flags |= CDF_privileged;
>> +
>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>> +            {
>> +                if ( hardware_domain )
>> +                    panic("Only 1 hardware domain can be specified! 
>> (%pd)\n",
>> +                           hardware_domain);
>> +
>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>> +                d_cfg.max_evtchn_port = -1;
> 
> What about d_cfg.arch.nr_spis? Are we expecting the user to pass "nr_spis"?

Further down, when nr_spis isn't specified in the DT, it defaults to:
     d_cfg.arch.nr_spis = gic_number_lines() - 32;

Dom0 does:
     /*
      * Xen vGIC supports a maximum of 992 interrupt lines.
      * 32 are substracted to cover local IRQs.
      */
     dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) 
- 32;
     if ( gic_number_lines() > 992 )
         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");

So I think it's fine as-is?  I could add the min() and warning if you 
think it's necessary.

Regards,
Jason
--------------UjfTwq5u02D0WqrgKI9HLqjz
Content-Type: text/plain; charset="UTF-8"; name="hwdom-dts"
Content-Disposition: attachment; filename="hwdom-dts"
Content-Transfer-Encoding: base64

L2R0cy12MS87CgovIHsKCWludGVycnVwdC1wYXJlbnQgPSA8MHg4MDA1PjsKCWRtYS1jb2hl
cmVudDsKCW1vZGVsID0gImxpbnV4LGR1bW15LXZpcnQiOwoJI3NpemUtY2VsbHMgPSA8MHgw
Mj47CgkjYWRkcmVzcy1jZWxscyA9IDwweDAyPjsKCWNvbXBhdGlibGUgPSAibGludXgsZHVt
bXktdmlydCI7CgoJcGxhdGZvcm0tYnVzQGMwMDAwMDAgewoJCWludGVycnVwdC1wYXJlbnQg
PSA8MHg4MDA1PjsKCQlyYW5nZXMgPSA8MHgwMCAweDAwIDB4YzAwMDAwMCAweDIwMDAwMDA+
OwoJCSNhZGRyZXNzLWNlbGxzID0gPDB4MDE+OwoJCSNzaXplLWNlbGxzID0gPDB4MDE+OwoJ
CWNvbXBhdGlibGUgPSAicWVtdSxwbGF0Zm9ybSIsICJzaW1wbGUtYnVzIjsKCX07CgoJZnct
Y2ZnQDkwMjAwMDAgewoJCWRtYS1jb2hlcmVudDsKCQlyZWcgPSA8MHgwMCAweDkwMjAwMDAg
MHgwMCAweDE4PjsKCQljb21wYXRpYmxlID0gInFlbXUsZnctY2ZnLW1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAwMDAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MTAgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAwMDAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAwMjAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MTEgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAwMjAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAwNDAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MTIgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAw
NDAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAwNjAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MTMgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAwNjAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAwODAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MTQgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAwODAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAwYTAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MTUgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAw
YTAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAwYzAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MTYgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAwYzAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAwZTAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MTcgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAwZTAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAxMDAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MTggMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAx
MDAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAxMjAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MTkgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAxMjAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAxNDAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MWEgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAxNDAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAxNjAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MWIgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAx
NjAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAxODAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MWMgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAxODAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAxYTAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MWQgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAxYTAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAxYzAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MWUgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAx
YzAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAxZTAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MWYgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAxZTAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAyMDAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjAgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAyMDAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAyMjAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjEgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAy
MjAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAyNDAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MjIgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAyNDAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAyNjAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjMgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAyNjAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAyODAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjQgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAy
ODAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAyYTAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MjUgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAyYTAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAyYzAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjYgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAyYzAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAyZTAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjcgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAy
ZTAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAzMDAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MjggMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAzMDAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAzMjAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MjkgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAzMjAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAzNDAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MmEgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAz
NDAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAzNjAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MmIgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAzNjAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAzODAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MmMgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAzODAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAzYTAwIHsKCQlkbWEtY29oZXJlbnQ7
CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MmQgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAz
YTAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2
aXJ0aW9fbW1pb0BhMDAzYzAwIHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDww
eDAwIDB4MmUgMHgwMT47CgkJcmVnID0gPDB4MDAgMHhhMDAzYzAwIDB4MDAgMHgyMDA+OwoJ
CWNvbXBhdGlibGUgPSAidmlydGlvLG1taW8iOwoJfTsKCgl2aXJ0aW9fbW1pb0BhMDAzZTAw
IHsKCQlkbWEtY29oZXJlbnQ7CgkJaW50ZXJydXB0cyA9IDwweDAwIDB4MmYgMHgwMT47CgkJ
cmVnID0gPDB4MDAgMHhhMDAzZTAwIDB4MDAgMHgyMDA+OwoJCWNvbXBhdGlibGUgPSAidmly
dGlvLG1taW8iOwoJfTsKCglncGlvLWtleXMgewoJCWNvbXBhdGlibGUgPSAiZ3Bpby1rZXlz
IjsKCgkJcG93ZXJvZmYgewoJCQlncGlvcyA9IDwweDgwMDcgMHgwMyAweDAwPjsKCQkJbGlu
dXgsY29kZSA9IDwweDc0PjsKCQkJbGFiZWwgPSAiR1BJTyBLZXkgUG93ZXJvZmYiOwoJCX07
Cgl9OwoKCXBsMDYxQDkwMzAwMDAgewoJCXBoYW5kbGUgPSA8MHg4MDA3PjsKCQljbG9jay1u
YW1lcyA9ICJhcGJfcGNsayI7CgkJY2xvY2tzID0gPDB4ODAwMD47CgkJaW50ZXJydXB0cyA9
IDwweDAwIDB4MDcgMHgwND47CgkJZ3Bpby1jb250cm9sbGVyOwoJCSNncGlvLWNlbGxzID0g
PDB4MDI+OwoJCWNvbXBhdGlibGUgPSAiYXJtLHBsMDYxIiwgImFybSxwcmltZWNlbGwiOwoJ
CXJlZyA9IDwweDAwIDB4OTAzMDAwMCAweDAwIDB4MTAwMD47CgkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKCX07CgoJcGNpZUAxMDAwMDAwMCB7CgkJaW50ZXJydXB0LW1hcC1tYXNrID0gPDB4
MTgwMCAweDAwIDB4MDAgMHgwNz47CgkJaW50ZXJydXB0LW1hcCA9IDwweDAwIDB4MDAgMHgw
MCAweDAxIDB4ODAwNSAweDAwIDB4MDAgMHgwMCAweDAzIDB4MDQgMHgwMCAweDAwIDB4MDAg
MHgwMiAweDgwMDUgMHgwMCAweDAwIDB4MDAgMHgwNCAweDA0IDB4MDAgMHgwMCAweDAwIDB4
MDMgMHg4MDA1IDB4MDAgMHgwMCAweDAwIDB4MDUgMHgwNCAweDAwIDB4MDAgMHgwMCAweDA0
IDB4ODAwNSAweDAwIDB4MDAgMHgwMCAweDA2IDB4MDQgMHg4MDAgMHgwMCAweDAwIDB4MDEg
MHg4MDA1IDB4MDAgMHgwMCAweDAwIDB4MDQgMHgwNCAweDgwMCAweDAwIDB4MDAgMHgwMiAw
eDgwMDUgMHgwMCAweDAwIDB4MDAgMHgwNSAweDA0IDB4ODAwIDB4MDAgMHgwMCAweDAzIDB4
ODAwNSAweDAwIDB4MDAgMHgwMCAweDA2IDB4MDQgMHg4MDAgMHgwMCAweDAwIDB4MDQgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDMgMHgwNCAweDEwMDAgMHgwMCAweDAwIDB4MDEgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDUgMHgwNCAweDEwMDAgMHgwMCAweDAwIDB4MDIgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDYgMHgwNCAweDEwMDAgMHgwMCAweDAwIDB4MDMgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDMgMHgwNCAweDEwMDAgMHgwMCAweDAwIDB4MDQgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDQgMHgwNCAweDE4MDAgMHgwMCAweDAwIDB4MDEgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDYgMHgwNCAweDE4MDAgMHgwMCAweDAwIDB4MDIgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDMgMHgwNCAweDE4MDAgMHgwMCAweDAwIDB4MDMgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDQgMHgwNCAweDE4MDAgMHgwMCAweDAwIDB4MDQgMHg4
MDA1IDB4MDAgMHgwMCAweDAwIDB4MDUgMHgwND47CgkJI2ludGVycnVwdC1jZWxscyA9IDww
eDAxPjsKCQlyYW5nZXMgPSA8MHgxMDAwMDAwIDB4MDAgMHgwMCAweDAwIDB4M2VmZjAwMDAg
MHgwMCAweDEwMDAwIDB4MjAwMDAwMCAweDAwIDB4MTAwMDAwMDAgMHgwMCAweDEwMDAwMDAw
IDB4MDAgMHgyZWZmMDAwMCAweDMwMDAwMDAgMHg4MCAweDAwIDB4ODAgMHgwMCAweDgwIDB4
MDA+OwoJCXJlZyA9IDwweDQwIDB4MTAwMDAwMDAgMHgwMCAweDEwMDAwMDAwPjsKCQltc2kt
bWFwID0gPDB4MDAgMHg4MDA2IDB4MDAgMHgxMDAwMD47CgkJZG1hLWNvaGVyZW50OwoJCWJ1
cy1yYW5nZSA9IDwweDAwIDB4ZmY+OwoJCWxpbnV4LHBjaS1kb21haW4gPSA8MHgwMD47CgkJ
I3NpemUtY2VsbHMgPSA8MHgwMj47CgkJI2FkZHJlc3MtY2VsbHMgPSA8MHgwMz47CgkJZGV2
aWNlX3R5cGUgPSAicGNpIjsKCQljb21wYXRpYmxlID0gInBjaS1ob3N0LWVjYW0tZ2VuZXJp
YyI7Cgl9OwoKCXBsMDMxQDkwMTAwMDAgewoJCWNsb2NrLW5hbWVzID0gImFwYl9wY2xrIjsK
CQljbG9ja3MgPSA8MHg4MDAwPjsKCQlpbnRlcnJ1cHRzID0gPDB4MDAgMHgwMiAweDA0PjsK
CQlyZWcgPSA8MHgwMCAweDkwMTAwMDAgMHgwMCAweDEwMDA+OwoJCWNvbXBhdGlibGUgPSAi
YXJtLHBsMDMxIiwgImFybSxwcmltZWNlbGwiOwoJfTsKCglpbnRjQDgwMDAwMDAgewoJCXBo
YW5kbGUgPSA8MHg4MDA1PjsKCQkjYWRkcmVzcy1jZWxscyA9IDwweDAyPjsKCQkjc2l6ZS1j
ZWxscyA9IDwweDAyPjsKCQkjaW50ZXJydXB0LWNlbGxzID0gPDB4MDM+OwoJCWludGVycnVw
dC1jb250cm9sbGVyOwoJCWNvbXBhdGlibGUgPSAiYXJtLGdpYy12MyI7CgkJI3JlZGlzdHJp
YnV0b3ItcmVnaW9ucyA9IDwweDAxPjsKCQlyZWcgPSA8MHgwMCAweDgwMDAwMDAgMHgwMCAw
eDEwMDAwIDB4MDAgMHg4MGEwMDAwIDB4MDAgMHhmNjAwMDA+OwoJfTsKCglmbGFzaEAwIHsK
CQliYW5rLXdpZHRoID0gPDB4MDQ+OwoJCXJlZyA9IDwweDAwIDB4MDAgMHgwMCAweDQwMDAw
MDAgMHgwMCAweDQwMDAwMDAgMHgwMCAweDQwMDAwMDA+OwoJCWNvbXBhdGlibGUgPSAiY2Zp
LWZsYXNoIjsKCX07CgoJdGltZXIgewoJCWNvbXBhdGlibGUgPSAiYXJtLGFybXY4LXRpbWVy
IjsKCQlpbnRlcnJ1cHRzID0gPDB4MDEgMHgwZCAweGYwOCAweDAxIDB4MGUgMHhmMDggMHgw
MSAweDBiIDB4ZjA4PjsKCQlpbnRlcnJ1cHQtcGFyZW50ID0gPDB4ODAwNT47Cgl9OwoKCWFw
Yi1wY2xrIHsKCQlwaGFuZGxlID0gPDB4ODAwMD47CgkJY2xvY2stb3V0cHV0LW5hbWVzID0g
ImNsazI0bWh6IjsKCQljbG9jay1mcmVxdWVuY3kgPSA8MHgxNmUzNjAwPjsKCQkjY2xvY2st
Y2VsbHMgPSA8MHgwMD47CgkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cgl9OwoKCWFs
aWFzZXMgewoJCXNlcmlhbDAgPSAiL3BsMDExQDkwMDAwMDAiOwoJfTsKCgljaG9zZW4gewoJ
CXUtYm9vdCx2ZXJzaW9uID0gIjIwMjQuMTAiOwoJCSNzaXplLWNlbGxzID0gPDB4MDI+OwoJ
CSNhZGRyZXNzLWNlbGxzID0gPDB4MDI+OwoJCWthc2xyLXNlZWQgPSA8MHhjZmJkNmNmNCAw
eGFmMjMzODcwPjsKCQlib290YXJncyA9ICJjb25zb2xlPWh2YzAgY29uc29sZT10dHlBTUEw
IGVhcmx5Y29uPXhlbiBlYXJseXByaW50az14ZW4gY2xrX2lnbm9yZV91bnVzZWQiOwoJCWxp
bnV4LGluaXRyZC1zdGFydCA9IDwweDAwIDB4YzgyMDAwMDA+OwoJCWxpbnV4LGluaXRyZC1l
bmQgPSA8MHgwMCAweGNiZDJmYWVmPjsKCX07CgoJaHlwZXJ2aXNvciB7CgkJY29tcGF0aWJs
ZSA9ICJ4ZW4seGVuLTQuMjEiLCAieGVuLHhlbiI7CgkJcmVnID0gPDB4MDAgMHg0ZDIwMDAw
MCAweDAwIDB4NDAwMDAgMHgwMCAweDQwMDAwMDAwIDB4MDAgMHhkMDAwMDAwIDB4MDAgMHg0
ZDQwMDAwMCAweDAwIDB4NzJhMDAwMDAgMHgwMCAweGUwMDAwMDAwIDB4MDAgMHhmZTAwMDAw
IDB4MDAgMHhmODAwMDAwMCAweDAwIDB4MzI2MDAwMDAgMHgwMSAweDJmNDAwMDAwIDB4MDAg
MHgxMGEwMDAwMD47CgkJaW50ZXJydXB0cyA9IDwweDAxIDB4MDAgMHhmMDg+OwoJCWludGVy
cnVwdC1wYXJlbnQgPSA8MHg4MDA1PjsKCX07CgoJcHNjaSB7CgkJY29tcGF0aWJsZSA9ICJh
cm0scHNjaS0xLjAiLCAiYXJtLHBzY2ktMC4yIiwgImFybSxwc2NpIjsKCQltZXRob2QgPSAi
aHZjIjsKCQljcHVfb2ZmID0gPDB4MDE+OwoJCWNwdV9vbiA9IDwweDAyPjsKCX07CgoJY3B1
cyB7CgkJI2FkZHJlc3MtY2VsbHMgPSA8MHgwMT47CgkJI3NpemUtY2VsbHMgPSA8MHgwMD47
CgoJCWNwdUAwIHsKCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1NyI7CgkJCWRldmlj
ZV90eXBlID0gImNwdSI7CgkJCXJlZyA9IDwweDAwPjsKCQkJZW5hYmxlLW1ldGhvZCA9ICJw
c2NpIjsKCQl9OwoJfTsKCgltZW1vcnlAYzAwMDAwMDAgewoJCWRldmljZV90eXBlID0gIm1l
bW9yeSI7CgkJcmVnID0gPDB4MDAgMHhjMDAwMDAwMCAweDAwIDB4MjAwMDAwMDAgMHgwMCAw
eGYwMDAwMDAwIDB4MDAgMHg4MDAwMDAwIDB4MDEgMHgyYTgwMDAwMCAweDAwIDB4MzgwMDAw
MCAweDAxIDB4MmYwMDAwMDAgMHgwMCAweDQwMDAwMD47Cgl9Owp9Owo=

--------------UjfTwq5u02D0WqrgKI9HLqjz--

