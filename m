Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121F694A7A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 16:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494702.764864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaUY-0002FR-Sz; Mon, 13 Feb 2023 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494702.764864; Mon, 13 Feb 2023 15:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaUY-0002CW-Q6; Mon, 13 Feb 2023 15:11:42 +0000
Received: by outflank-mailman (input) for mailman id 494702;
 Mon, 13 Feb 2023 15:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRaUX-0002CL-GK
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 15:11:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b793539b-abb0-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 16:11:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7749.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 15:11:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 15:11:35 +0000
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
X-Inumbo-ID: b793539b-abb0-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsPEoj9IVHOqSJq1yZaZ7AmYRs5ncNtipaFzrSJEbv4prcZZyR5PU+/Mj/uWSwqTo9ntJ7s5vsFrmgqlXyN1QPU8MmXQmb0Wt/CWIyvzctHfHvbqqXqHhReVsoyNZMMSA4Puny9/vg3FbHPTxbGZgzZDm3T5wB5rZ78Ugo3k1C0NmHXfCtEXF4DvenjwzGuP1qCxIavKeL/bYQzQSIlxYGA+qi7Oa8ftXUbMSGW+u2QAlc/DYGFv4IG7hVcpuYlnB779umaR9tpv1B0+hdgfXYSjfmy+8RWm2hOVAlC2yraR89ARh88s+kh09SfiEMiq53L4xxmtL1HPhBtU6FjWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pI7eCo0GaXU3EHmrxI+t/264N9K810g4h/vYfA5JWo=;
 b=E8xUqXJOa6v8PrlAxmf8h+EWf7d7S3B5U6n/cUpcEA4br0sEQVK/TWKRYpXxjQckBRgCqFL2MfVemaBbAxQy1dKO9612q4400oYVPymhiXwbKFtzECoDzQT0Y3BWlIPtYoNeJyHZC2BOvsJXV580S78a35E/iCsouuT9L8ly/iGvbn8ePeaFXJEQ9aOoLz0b0VqEKRoFakMGumrwb3XDqDlJ/8u3Dh9O3KBNBQvACSpR/3uPtpz6tSuSu5ZXsYFMq3E5V2VSkJ0eGhBd4nn0JuKmEmL5G59g+HW375PGatUbGKg5D4JmE2jDPHrGq0Lt+YR5uHg/QGRAxncc+5KsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pI7eCo0GaXU3EHmrxI+t/264N9K810g4h/vYfA5JWo=;
 b=limbqXbydMElGcs9IHpMeTw6Gu/XtaqKmOuXrRz2k7Xz0Mf5l14ZJYSQy6NDTCAO57EtvMf6vhBSa0FUaWBOizwJugRXYx8XLmSVD4hea69ZzmtJds82eAlc1Xg4r5PD2UfVUa1ATbiLb5Qk0/Y3Cc5JrGk791QbG+ourQTk24JN2rDyc15qWG1xG2eR5g9NwZJggCjoz/jIUQd7QvGFq+YYB2maMwMFMx8KIvn0DiaeSybWRLnrjhJ1zuaCTCcz8jVWQvhsRze1+30r87HHFEF7TzkD6oujCBCjJeGRkQCdzjNd0JTBGyO0GKsNmiRByztpdzj2lfSZDh2ZEeDj5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
Date: Mon, 13 Feb 2023 16:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0d2608-6bfd-4d9a-196d-08db0dd498f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qp8qrz6FIeu2c12vvp8FYmowuaOVnkpjrV8FzSdXzwRjY5jz2+ZnSVBrQ2uiAalmhrQxZ+o4wXuyV9qaIGSxMocq05D+lZwUGHJLmy6jwbYu/LLmCwq4UVnI4UZZQIr+86NQsZSzAr18FkvmJ/wUNp0f9VcqRQC56kd8He3tN/l8WP2Np1KrtULUeFSl3wjprmSBzLXxtaDFqhz3TT0YnK5NjqJeQDrjnnXKUMPCk7RhY7p/wSAJtVf/zJtvnICdCkc1SpZNbTBw9tuRVHXOq43BBh3wFdax2lGLp3BNe6ceLzA8AtJIwT4WuUef8rfDwLpnfjS2qFjImmgRvY/UwTGRFD+EBu2Dop4v20H0brM3Faxa1CIyYPCcN48JFE8Z+D7TtkLc95eiAAnPHIfd1dc54URMtMHbDhbsTaqfhvVorWmMrVACRSe8cOJakw++fcTMNNgCv5YQY86vYJ724wahrbt73v5WCByDSUZqDny1H1d1SmyFYzDjVsAuVl4hR+oMQDl2I0+Qr9uXPldUMlc0IZPBZQK4XHeq9tTqBWB01YRa4Wos0Uwz4reSZ4Z7EbmbfEvQumUzKHrfVSpXylR/1jxr7r3M9Oba/WKGodXAxGg3qf2ieNU61TN5WtrJX0YI1rllfHcsgOff+ViHnZuhxBhMZg3NRnN9bSJI3hRxKfNhLiQQ4UB7v8tN7xo+JUeumS6XIkJ+3pvAl703T2VWQEVpZkzKBP4fextBxlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(31686004)(2906002)(5660300002)(8936002)(41300700001)(6916009)(4326008)(478600001)(6486002)(36756003)(26005)(6512007)(186003)(66946007)(53546011)(2616005)(6506007)(31696002)(86362001)(66556008)(8676002)(66476007)(54906003)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3NGZVUrSUlKYU9sTUdza1l4Q05PbTFIOUpxc3pZWUY2a3AzckxWbDdiUUph?=
 =?utf-8?B?T1dNWURaQ0tyR2N5bXA0R3VBNzhqZlJtZ211V2xuL0dRZEVDMXhnYnl0bDNR?=
 =?utf-8?B?ejZLN3Bzb3lxdTVFdVRIQXkva05zczRJMkpyWkVGRVBjbnlpdVFPcUtWQ1ZZ?=
 =?utf-8?B?aU5OSXUvVDVac1o1ZCt5ZXhpdUs5NG13SzNFRnVncy9pR3NET3lURElVcitD?=
 =?utf-8?B?T2xUS1I0RlRsbTFKTUdxNEppdXJVMkV5bEt1V3hvbnhJY2dqc283QkhZMEhL?=
 =?utf-8?B?eUlsN2FMNEExZ01lODlZVE50NTJUdDhNQWlWN2tSd3J5a2gzOE9paElFN1hQ?=
 =?utf-8?B?WC9Cazd6QjlpVzl2cFJ6d0pKYlRaZnhhT0xtQjZ2azArTDNvYy9DN2w5RDZs?=
 =?utf-8?B?bkcrSWQyeGtiUk1GN1hraEJHL0pzRllMdWoweDVzR1JveHA3dDdxUlYybzhm?=
 =?utf-8?B?S0xFc05uZ1dxbXN6c1RDRnU0SmlEbTBLSzBqNSsyWk0wMHJDVGVuYnVwL09q?=
 =?utf-8?B?UGc1Szlhb2pOVEJodXBhS0lnNTFYY2lQSGpycmJnRVZhZmczU2pMeVM4STc5?=
 =?utf-8?B?ckhnSDhGRWZuZTgrZ290VkJDYVRRbFJIRGJ3ZENrajMzL3I5elY2NTE3VS9W?=
 =?utf-8?B?R3luc3Jkb3daalRJT1F5UXQ0TzQ4V0xmOU5DK2UxV2ozeG1MR0hNVU1UMVJt?=
 =?utf-8?B?aUZ6QkxYbHY5cXJTZXdiQjNxOFVHZE1YOGpKRDJ5NmRFS081YmpJQm1uTlVl?=
 =?utf-8?B?SzFsUDcwVDdSZUkwWVZDcXNxRzV1SXZRUnM3WkF2alBiQXU4amZMZGZ2K2l0?=
 =?utf-8?B?L253ZFkzWlZLUDVYb1pmZWduN3FyY2lnMEFYZ1hxRmQrOHpNWTNta1VVN1Qz?=
 =?utf-8?B?b1RPNys1M2g1ejBCU3ltK1cwUXpUcElOME5SMThyUVFSK0ZrcUg4U2FqZ3pK?=
 =?utf-8?B?azFwVk54bGRwYzdBNy9VaEcyaUI2dEVueUdmZXRNSUtqOWRtTFRRQ1VTNmNz?=
 =?utf-8?B?Q0M0dCtwUUs4Sjc0RlFEWFJDQ1crOW91SGtCSG52LzU2NjFuaCsyZHVtU0kz?=
 =?utf-8?B?UU9tYkZXUGhtVWdkS3E5MFBaM3IrYm84aTJ6eng0RWtYQTUxL1k3OXZrdnpG?=
 =?utf-8?B?amNxM2ZiYTQ2OEVQZlVMbVo1bHNodUZtUXE4RFE2K0VsdDkyTEZKOUtWZ1Vz?=
 =?utf-8?B?N1hMOFVuQjUreTkrTWFpZXFXVGhUQjhKY0lkZFkvcDVoZjgyWW8zWGg3Vktn?=
 =?utf-8?B?SFdSMnpoSjJhRDlHWlpaVk54QUVFMm5QdjgvTExlbTAzRTJJQUFweUV4ZWRQ?=
 =?utf-8?B?OXFiMW8wNWs1N2UyZFZuNER2c3d4Tzd6WTR5RDZXRUozMUJqV3F4anZSSlpy?=
 =?utf-8?B?SEZvZmthKzhWN2FOVEZTVDdmY2ZIcmQ0V0JpWDIvczhuYzZjWC9JRGllUkxT?=
 =?utf-8?B?ZG1MRHhRRkw0NU8rRHVEc1pRcFNnTXh3cCtMbGlOdWhmZmYyTE9LdE1NRDlN?=
 =?utf-8?B?dXRlOGN6WVliRWVNRExTUDMzaGZ1Mmg3YktNdkhtYjQ5RHlRQVNRMXZGQkZa?=
 =?utf-8?B?S25PWkozeFZpUVNGRHBad2M0dlV2UC8rWUcycmc4T3gyeU1adGowcEVQaTFu?=
 =?utf-8?B?Q0pOaFI3RzdkWjNXT1ZRMEt2VHNSM1Z3bXR0aGdON1BieXVjMEhyRThnQWRY?=
 =?utf-8?B?TGM0eEFBZlVoZXlSTUFzejhlallQNEdJZlYvT0xXSit6bU5oZGNKeHFGYUIy?=
 =?utf-8?B?bGQwMVJobGZaZG9VRC81Q3pNUzVVdWtvamhnUURLdCtHR0RJQ2FubnZMU2lD?=
 =?utf-8?B?STg0MmZ3MFhlUk94THhrZkN0QU5JRm5COWFHNWY3SU1aTDcvMmxmem9zOUli?=
 =?utf-8?B?Ukl0UGdMcnd5aWVTekJoZmdXekRKZmhEUU45Z05sb1k0MlFlaURNZzY5Qi9H?=
 =?utf-8?B?Y3h5Rlhnam5CWlA2Y3BZanN2WWNsNkN2T05jYy8xMjByTkZvWHpiQjBFaFZE?=
 =?utf-8?B?aFhDMUlrU2xCNjZGWmJoNXorRitMaFdESXd2dS93MWMwQXJFSlBlRURlVW0x?=
 =?utf-8?B?OVAxOWRLcnM4K0JYOUhWcHU4QXZuMTZ4eGY4NWVkY3cvUzg0anVhMHR0RWdq?=
 =?utf-8?Q?sYF9HfvnBZFr96aH/26Jkw7Zq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0d2608-6bfd-4d9a-196d-08db0dd498f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 15:11:35.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HrihcYnWVMaeNMZjUkrOARW4sk52rqdRQgBg62rYf+OqFHdfACtOq7H08oLLVzUgwpLQ4GhR2LgVK0uYlgVHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7749

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -117,6 +117,12 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +config AMD_SVM
> +	def_bool y if HVM
> +
> +config INTEL_VMX
> +	def_bool y if HVM

I'm not convinced we want vendor names here - I'd prefer to go with
just SVM and VMX.

> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -10,4 +10,6 @@ obj-y += intel.o
>  obj-y += intel_cacheinfo.o
>  obj-y += mwait-idle.o
>  obj-y += shanghai.o
> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
> +obj-y += vpmu.o
> +obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
> +obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o

This code was moved from hvm/ to cpu/ for the specific reason of also
being used by PV guests. (Sadly the comments at the top weren't
corrected at that time.)

> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -51,7 +51,7 @@ config AMD_IOMMU
>  
>  config INTEL_IOMMU
>  	bool "Intel VT-d" if EXPERT
> -	depends on X86
> +	depends on X86 && INTEL_VMX
>  	default y
>  	help
>  	  Enables I/O virtualization on platforms that implement the

This is odd in three ways: For one PV domains (i.e. incl Dom0) also use
the IOMMU. And then earlier on there was a change of yours specifically
relaxing the connection between I/O and CPU virtualization. Plus
finally you make no similar change for AMD.

Jan

