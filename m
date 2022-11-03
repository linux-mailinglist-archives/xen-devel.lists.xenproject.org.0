Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA66179FE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 10:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436173.690270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqWXD-00049U-Q2; Thu, 03 Nov 2022 09:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436173.690270; Thu, 03 Nov 2022 09:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqWXD-000475-Mu; Thu, 03 Nov 2022 09:29:15 +0000
Received: by outflank-mailman (input) for mailman id 436173;
 Thu, 03 Nov 2022 09:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqWXC-00046z-8A
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 09:29:14 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9cdccc8-5b59-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 10:29:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9406.eurprd04.prod.outlook.com (2603:10a6:20b:4da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 09:29:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 09:29:03 +0000
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
X-Inumbo-ID: f9cdccc8-5b59-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+paBPQ/3KIUQ5FUjvcgdV7B4AFOYXstYVL8t42inz+i+Fmlv/ERXEormLnkoVBozPlpj64EBFrdgYVWCk/upVyapebGdGZ7SL3FhN+21M3ioUxO941o078uhp5A6G/CLtAZnTyidOlHfqE2qZEdA3C2Z4k5Q/EoX4bYmUmfzb0q9Yeeo/TTIGO3LiHcrhcSchn+gSU4K8LMm6H4Y00xnF0QGixiglsB/SPDJ0KxVitvGLLzsVXE9pKtWykjEnxNi/NiJPnYOKe969e321G4MxWV8muLLmcM6Nzu1HgNMyK9uo1J2k6dndn1biKdfLb3xP303fYIimvTldcIqpQT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJL0LLTJg4jnPn1uIkjfLhClxTDveBtUwKRhbC5dgLw=;
 b=Odv/QfOlRgPxptOUzwv0Dx8cp5T8a86+HzH01ET9Eie7XA6vwLV0mK0ldWTQbA449nRiCOOl/0uHT5RrCt5pPm7FYpg5arMDQ/BMdl3rJDI38/8v3iPLEex1DrT3JIkfdQyHJuf4q0u5k1Uhn/E7IDMGF0J9ModeUFMcNJSACyEtNlA/sDUALo7fY8Y3p6ocMfPyPUDoOFy8xGDNCm70ScjX8Pi4tobNo1auw0n/22RHNunL/4KmNMwz1ADVChr/q+nenxmSI1bnDIpjfmPWTmgTiYI+luxr7L3iQXevmY7584GmjBDsaNjbyvMZeoSPZ0gaJAJafs/8j9HJkn9XDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJL0LLTJg4jnPn1uIkjfLhClxTDveBtUwKRhbC5dgLw=;
 b=dgf/TV+SzdbxZDz1oCjL3y3hPjRYXRHqiOtARAIKxNnAIjquhagieSZJbL/tshIUImkmHdPpS8/Cvvdldkppp+exm2ypbwoNnjBLQ+Bj4ARbcpmMXY/Iy8kj8k+DC4aug/zrVeLipiZXPbWkebb+7vLfDqz/IaAgkKUGd9KCoPbq/4lkgHobTTIcTUAmGF+ES0JIFr5VbaNo8p+8Rkaqc9TH71uxbu7VvNODmkGMrPIua2paZrcYjrqwP1s+7zYhXZB5WFFcGK1FBcOdBkb/W4mrgbiEiQ1cTt7IKuBBcCQ/g6Q1i1GklEFGVz1JNHkFwCeRcKL000OqHyeyvEnUJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82d4aea8-aa23-fc6a-47ba-deb7d182012d@suse.com>
Date: Thu, 3 Nov 2022 10:29:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Xen vs Trenchboot: TXT AP bringup
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Krystian Hebel <krystian.hebel@3mdeb.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>
References: <6ccbcaf7-29f4-6477-2f1f-0aa4de64e8c3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ccbcaf7-29f4-6477-2f1f-0aa4de64e8c3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 8935f165-a8e8-4202-426e-08dabd7dd913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Ey52WEEYZ++NiihlTK8jA0i+uzWh6tQvbZRG5EZxbYq5q/tmWXpoIwbAlZo1gsyMCIDptRm81f2PuW7/QKRy/SrVir4ErIo1i5xak3mvhL7Q7InfsdZE+qFBMHtT7BDqFEbFCkUl9jYup9C8zsPRRBFbWFa4ny1n/eZZoJpAhsBVFIDE0Yab4Q90NEn2PC1EB0ac19o08xWB88vPefvcgDPw6ya5TfDahRhVqcT1DjAkUpPNSmWO7EkU46kgGxmS6J0O8+InfaEusCiz4aprpw9eKsI6Ii7dqj2zbAWi99ojtNPfZZpNW5yx6IeRhXKJar9QeZ36E7OHsBOPwyIrh+rR8HMCVqpH4kVujMJwbv9XrmzyQn1odlLtr2a2FqJ0GmY5B/pUoBLcbwgDDRzOihCoD3dQzy9jtnWnm7HDi+8zVD0h2XWJmvrQEW2nQyZFwa9GEbGVA9usH7kuZJ7jbQ9kAWtl5OXlX8YD4tXul24rBA93KawppnN/O4XJWyt2AIWD91RhtVUhILAnuRdrf79jbLEFZ+VjIYgWcX8l26YRqEJvFvvTYWILoZdlfBquiFAjh7mpGGx5e1ffmVhNsEoIuN3zQrKZu7YwDODOph9Zo8cMW244VrB0eIor2kYGrj3iw+byw+653b7Dn7nYAmzzoRG2ps0WbWiZDbY2s89Gi4XQ5vCg6WbVJ7YG8eU6FUj2oucyGAxd1d6WJ0cBNImT34kyekwwnsio2wH3yTU087sqEdf3bvLfyj6oth6rfESlOUTJkpCn9imz0S8y2vN8dmI3T8xGsTvMZEx4KY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(83380400001)(4326008)(41300700001)(26005)(66556008)(66476007)(8676002)(6512007)(6506007)(66946007)(316002)(53546011)(6486002)(36756003)(186003)(6916009)(54906003)(2906002)(5660300002)(478600001)(31686004)(2616005)(31696002)(8936002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VNT0s1V1owUjBFVFJUdytIUDdjYUNvV1UzVTEzUGNQeERaSm9JOGVyYUxq?=
 =?utf-8?B?L3NrL2FicTB1VHZIMnloU0VRMnphdDM5TExzVERCU0hRbHFsMDJzcFVWd3Yy?=
 =?utf-8?B?NWdVQ29oZ1FTRllQRjdUSVluVVRmSkZ5SDA5aEdvbmJNM3NPK1R0MWx2TENF?=
 =?utf-8?B?bjZDYm5IQzUrenhidm10ZCtWbGhqVUNrbkIrME9iT3B1eWtzdDJWb0FYREFR?=
 =?utf-8?B?VkVwb0dYSVpmc3FHV2FNcVh0c2RKN2JLbW42aTlsOGJ5U013dHNTS1djZGJM?=
 =?utf-8?B?YVlCaWl3elZuNUpvTVc0SFJlK210ZnhablF6QVF4bkdmQXBHOUNiS0VtaTI4?=
 =?utf-8?B?MDJIcEw0eUtFVS9NUDN0QWZydklVUXRVSDQrdHJlZ005RVRLZjMyNzZrYWsz?=
 =?utf-8?B?eWFCUkRSRmI4TzA3YjZQMTdFcmV6dDZXR2Vxd3NUTzJDbFlBRUNQdHVHYWx5?=
 =?utf-8?B?YTRxQ2NLOVZVRmZoUDVld2hkWmdmM3NhWGYzS2JQNlptaTF0M2V1UWtQZ1BW?=
 =?utf-8?B?cVZ0bE9FK01JRjBLZmZnSWtGRVYyRmpjUXFkQlhYd3pXbDh5UmRWYnhFOTFa?=
 =?utf-8?B?NTRTT1drWnhRTE9tMVgwSE5zc0IweEpnQTMxNXNKT1NzS0pOSkh1V00zaUwx?=
 =?utf-8?B?bUlBSlVHY0IrcXNYU2NKMjhWVGRpTDFJSUprby96UWRISzhGZWNDdkJPVTFG?=
 =?utf-8?B?Rm9ZemsvVlNRRVB6TUJvcWZ4bGIyNWdkYjMxanIyMm45WkpaeVhWZ3NoVjlx?=
 =?utf-8?B?cC92aGFzNElkSlVCNzhoTHk3MHJzYTdvZDE0MG92WVhEMmZySlpRMjhROVVp?=
 =?utf-8?B?aWJnblF0M2dDclJHMFFhN3dveXk0ZGZKVW9IbGtTaEFTNE1kOURTa2pjdDR2?=
 =?utf-8?B?MmY2a0FicnYrZHVFRXhqc3Rnd3o5NnRqajRVVzQyVm9DdDVXWXg5YXRjeGJs?=
 =?utf-8?B?Uk83UnZwSVJIMEl2VVZvR2JRMGcxVHlzSGEwbnV4S0xKOS96WEhldlhYQ1Vl?=
 =?utf-8?B?b2JFMjlXMzZmdXIvSUR0VzJIRi81M0hJWVRNQzNIYXNYT0wvdXJJMG05Znhw?=
 =?utf-8?B?dCtRc2h3VmtJOEZMeVF2NHJzejZRWnI0c2ZlVWhGeVFWcWMvVzlVMjByRjM0?=
 =?utf-8?B?VS9vb3BOTEJrMHErcTlwTjVpcDFwOGk1NWZuQlZqR1FmbSsxUC9Ua01sdGVL?=
 =?utf-8?B?VnN5Zm9TSnkvN0Y3bGpMZFQwUG1iTzdTOGsxdWJwSWF2bDhaTW01SkFlcXcv?=
 =?utf-8?B?TE92R28wNmR6Q2tDcXF0UU5YWnZiZVhmaTFNOFVzVmsyZTRZRm9GRUM2T1c4?=
 =?utf-8?B?Mms3cUFKMWRhT2pyblM5UVdqOTRHa3FNLzB5cDI4UXhKN2VGNmhxRUZFbk8z?=
 =?utf-8?B?SDRQTlRheExrYnRTN21sNHduNXVsNHdJSTFwalRXalJwL3h0bmxveURHb3JO?=
 =?utf-8?B?SjFjcGJMb2Q0UXE3MkNQWmY1b0lIWnR1dHdNc2pJQ2VJcTB2KzNZVDlURThk?=
 =?utf-8?B?dmNvQTRQVERReFVjWDhoR0hGelpZdUlTZU5vYzVIOGxlS1ppRXhJUTlaYmU4?=
 =?utf-8?B?ZWZMZ1RlZTcvUGxrcUZBSW5kVkZvZnJXOFhhWDNmSmhSVGJpbHE5ZElVdGMz?=
 =?utf-8?B?Y0lsQmxsN2hLUk9vNVIwUlBabUlDOUM0ZmFSeEh0RE5tSzdtaTF1aU1kelgx?=
 =?utf-8?B?OGRHb0hIVEcxM3FYazhIelhIak9WWElWaEk4cFN4azBDOGVZYmsrTjkyWlVI?=
 =?utf-8?B?UEl4V1JObGdOTGpqS0d4V254MndTNzBWdzJ5SE1yTDh1SVN3R044TzdWcFBM?=
 =?utf-8?B?TnprK0FSd1NCSlYxdU00d0RCZkJxSU5YWmk0VVllanRLZjM5TEp2b0JHdkVB?=
 =?utf-8?B?ZlA5QzdvSUdvc1FRY2xSeDN3bFB3a3YvbU1aODZlMnJVMUpsNXNWL0h4UTNr?=
 =?utf-8?B?bjRFb2VTVHljMWZXa0lCaFNkdENmNmtpZE1Tck53TXZsT3VmWFJDRjJtL2xp?=
 =?utf-8?B?V0ZQMnBUVlAyVlEwUlJ5czVrbkxROHFLM2RqQkR1QWFXR1JEMG5na1I2aUdJ?=
 =?utf-8?B?U0ZsbXhxNFljaFN0bzBIZkNQSDUwazFxTWxuQXlpNE1NQmpBdFArUjE0K3BY?=
 =?utf-8?Q?Xra41BeJr9F8g2uVLdtlcTVe0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8935f165-a8e8-4202-426e-08dabd7dd913
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:29:03.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaF0o5QDxo58aEp/HFZO2GsAfpobCkAaDu9n6CRfXBve7a0i4fazkyoRb+XdfE2j9C9l5FKExgjlZOilRCg+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9406

On 27.10.2022 21:37, Andrew Cooper wrote:
> However, we're also very close to supporting parallel boot.  The
> serialising point we currently have is __high_start loading %rsp from
> stack_start, because that's a single pointer adjusted by do_boot_cpu(). 
> Everything else, even the processor's idea of Xen's CPU id is derived
> from the stack; specifically in the cpu_info block on the top of the
> stack, which is prepared by the BSP.
> 
> All we need to do full parallel boot is an array mapping APIC_ID -> Xen
> CPU index.  The AP boot path doesn't use the trampoline stack at all. 
> Given some way of transforming APIC_ID into a Xen CPU index, the APs
> could pull their stack pointer straight out of the stack_bases[] array. 
> This would allow us in the general case to boot APs using an
> all-but-self INIT-SIPI-SIPI.  (This is how firmware does AP bringup anyway.)
> 
> 
> Thoughts?  In particular, is there an obvious option I've missed[1]?

Well, I don't see other options, but I'm not sure we're as close as you
describe. I'm pretty sure we have assumptions elsewhere that multiple
CPUs won't be starting in parallel. Those places will need finding and
adjusting. Plus the generic CPU infrastructure also assumes things are
done one by one, with (for example) cpu_up() taking a CPU number, not a
CPU mask.

Jan

