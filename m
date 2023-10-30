Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D387DBDED
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625301.974482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVBt-0008L4-1B; Mon, 30 Oct 2023 16:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625301.974482; Mon, 30 Oct 2023 16:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVBs-0008J3-UH; Mon, 30 Oct 2023 16:32:36 +0000
Received: by outflank-mailman (input) for mailman id 625301;
 Mon, 30 Oct 2023 16:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxVBr-0007xZ-Jy
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:32:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed9fc389-7741-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:32:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8458.eurprd04.prod.outlook.com (2603:10a6:102:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15; Mon, 30 Oct
 2023 16:32:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:32:30 +0000
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
X-Inumbo-ID: ed9fc389-7741-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkAPsClAeUr9h9H8atMv5DMawEXA6H47L+jy4X7J4J2OpB/G248zzvghYWvcPC7tNsiazkZVfXXawPw6Cv/Pc5z7VecVMBUjtxLRqvheMFdfc88dtBBCVrPivHk9BLwFfdYok0MZNq+FJJVjbqiO1sd1S903Ga+JCOpqRSQJfF5LQyTpcmUbCso1rSTO2i3qnnAhmYke0l0Qa0U92roiyOzM5d+3NtG3vkI8ai4QQra3ElwY4ePrbwY7Om5CiKPEMzo4XEX+0yNgxvgIfAiJwSSGZ5llfO1YvPQLURsMXUDfq5m/WNI/4dnabqH/0oEmilNrJsO7tUnLVCqOnGBZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoRRgVAMe+aAXAGhmW4wc+Zar4xu+5zNZP0iuqZ2Zto=;
 b=GcNBZyNb7jQ/yr8l17bgx31JrIl7EAtlzZeKnqMn0xT3loWjYlTFGjG/z664Gqp0pGwIztYW4UlDGshDV3o+OTpdugYrpZudOugBMOX7ZKJumzGhjxB3fbhhbXgnGyejVgTScdsgnzZNpLhw/DZaK3ThryZyhtZt3vlKMSwH1jWvqw8Q4JwWQDfdtAEwV5Lz0bw+bmsIHyPhV2TRwQkdfHkMhc1foi/o4ZNdE8T20Jc+16/x9F92+iPjnK31vCzZcEGuTAZld+mtxl1c9SHA8Nyh2mECrHhD7AipQ3Z1f5mVk4k9G94TJHUtQ4v1fEbrJi5CIXXFA3ppMyof2d0UFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoRRgVAMe+aAXAGhmW4wc+Zar4xu+5zNZP0iuqZ2Zto=;
 b=jTP/EISLjFsbiiGsuGwwmv3Nj20kzbgzZmuD0eYT12GJltN6sp8TjapB+aqqIN/JzqGiPLqbnP2F2/xhAdjq4PaClU6PhVLvUnZp485dkXbAefJssPEELfBZJoZqdDjoIAt6YGTAjHHa9G95DstGdjFn9g1s1TfNqzbywQiG3CV5JN/YXr5qT+UnP0qAXIcnEuEX07VHUQdLkDvQMi+jdFPTWPLpzPw3dpvEsFQylEq6cY6IG9uvJHwJKDgSEsomamZVZuSgOflhc2Ut1v8WvjsV32uoxuZIQfSyZBRs7NIdvq4gqlpk7Qd/nHZdo+1tJFNquRtBuhov2l6WQmNklQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd1ed5f9-ca42-7870-233d-e2bc42515dcf@suse.com>
Date: Mon, 30 Oct 2023 17:32:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/x2apic: remove usage of ACPI_FADT_APIC_CLUSTER
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231024102630.47691-1-roger.pau@citrix.com>
 <77a0297d-3b47-6679-94a3-1463f642aa72@suse.com> <ZT_XgnKC6ORZcyXX@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZT_XgnKC6ORZcyXX@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0305.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: d82928f8-1b3c-4228-9879-08dbd965cfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	meZu5GIRvNPTZmvIG5fIahERAtU3ptNWaM26X8R99skjFaJHtuPCw8NCdRwg+VADwFr3WH9CvVEyy8qlY7UYBDgY0bryYh/MuBSyMXsz0dC83gTZErQy5fCNzcQwraLUhVJ1MVV+mM2Pd0E+7mkikMdFSTcwpP0ebTDS8AQqUYVBYCfW+RGzCaXAxCFo6xHcHMbepi0gaMfCJmrCYvrXcD4RJFbYbSMdYdVrNNg/ZvCYvNX2IO/8a2DG6zMTYznWOsEkK/20Yg14SHKav7gdsjkxEV9nGxHhSP2G3EZN+xNvZwCqC5fPWcbV9IYJwAyEp8H128TwFPBG9Xo5NWf/OVQABR/EtCrLsvEjSfqF6KTo9IKvYRCdzrGBhud2XAUfB+ib10gHZsdCOhCO2WS9UJ/0Lfm1dk4FLwbO5vRpS9TJnzxRZ3ekc4UQXqEszxm2N1ck49D95BwyO1zWfSni5JBmtXUcfFnuKTzFdLT+vfOKfHAcc7hE5JwpMqsz+py/MJw2hZ+VSyqfq1Bq4hJU2vtuGRcBWqa/0oSf46znIWlYK1YEOY7c3GcaIcAyCVGshhQQrxU5BOs/flWp3vY7ZkkESvl28yyzFB/ppOPtpfaPCh2xfyASmb1EG9ACNCvVxNj7Pg9iBcKU5oqILWqT+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38100700002)(2906002)(66556008)(6916009)(54906003)(66946007)(66476007)(316002)(6506007)(53546011)(26005)(6512007)(6486002)(478600001)(2616005)(41300700001)(5660300002)(8936002)(8676002)(4326008)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm1hcHdsY2htcHFEd1Z4MnZwbVhhTU1lYjIzSVlXMjJDRnNHWkZpaCtOaDVQ?=
 =?utf-8?B?eVlqdlduaDhIeU51SHFxQ0NNc01oWWh5QU1kVUR6Yyt2OHROWEpVZzJEc0Vu?=
 =?utf-8?B?cE9IMFNxZ3djeFpEZ0lycDRKS1dCR0RSZWpvMkdKV0RaUVpZOS9lNzJsVHFj?=
 =?utf-8?B?ZGdUcFlpNldkMENxc3JwdlZrT2ZNOFhENFdGUitzUWxjNGlRUTIzYld0MFRN?=
 =?utf-8?B?T214VUg2TGxacTd3SFdqNHdseGxudXU4Y3pURG9xT3RNbVNacml2U0JLRDR0?=
 =?utf-8?B?S0RqZDNOOE1aMEYweHplL0VHR2lPK3BCYWl0MnFrczdaNTNxL1NqSFluMWha?=
 =?utf-8?B?RGRjSmRVRW80Wmt0SFhhNnUySEZuSUNDZzl2a3pPU1ZvQXlpazRzRk5mc2Qw?=
 =?utf-8?B?aXhIQnFBc1VNNk1QemxaKzRNcFpzd0c0L3I1OVRVK3czeWtlQlh4ZlpUQ1FH?=
 =?utf-8?B?MGRoTDQxU3RIRWlRSWVBU2EwTmpKTUlTZi92U1Vxa3JZN1BNaHRJRmNjRURm?=
 =?utf-8?B?VmhqajJBYTZpaGR6NitDMzVEUDdSME0xQmpmcnBxT0wzaVVqbytJcUFpcDhN?=
 =?utf-8?B?T1lDTlFpaUpycTVEaWNQZmZkOWhyOFpHYXBrN3JtZFpsR1FMYWRadzNoR2M3?=
 =?utf-8?B?UHhBQ2JsWllzMmhTNTI1Ym5qcGs3eVRxMUxycjFDa0dkTUk5d3FrbkFSU2RU?=
 =?utf-8?B?dTVPZFA3N0RNL1JzQWwzSlpubDBCSW54QldkUDdUTHEvTzRjQWd5THk2blhV?=
 =?utf-8?B?K0NhN3dhNEdHSkEwNTR0QXNMQ1Jqc2psUDN1TjY2c3V2dlRkUDFwSS9TWlNF?=
 =?utf-8?B?RnNyeEtOYzFRRTVneFJEZWVKZnUvL0VEczhxMVN1UDEyWVQ3UmNaUXBaV2x2?=
 =?utf-8?B?NDRJaFlnM1BZczI5VGtJeVY0eWZKQi9YTnF5Nzc2MHpNQTVNOU1DczZORnRi?=
 =?utf-8?B?QzR3Sk92dktrZmVyOEhEem5nZklXaU9OTEJxZmNQVDk1ZjR0T0s1M1RKaVJJ?=
 =?utf-8?B?UUczVzBzdDh3bVFxa1p0d01kSmZBVkNqVHA1SmRWMUU0MlRoUkJQMVJFTHNY?=
 =?utf-8?B?aGFhNzE5Z3dVQzVQTG43c1Z0ZmN6UGtyWmxDSnhZWStKa2trV0VZQlJUOHRV?=
 =?utf-8?B?cHM5ZlBSaC9wak9hUVZJTXByZVoyM3E5VVZsS0I2RFVDc0JpOGxldG1jTTVG?=
 =?utf-8?B?UXBrbWd5ZmNRN3ZYa1ZLNUlsWmY2ZlJKUU5IdVhPTjVidFFPeXh5Z0swWGxL?=
 =?utf-8?B?WGNIMk4rb3ZjL245dmFNOGkrK1BWeXZSUEdqQm9qYjg1TzlyTnoxUzZxUWZa?=
 =?utf-8?B?VHQ0Y3MwbGh3TSsvVXFoR2RvcmQ3Tm1maVpKZE1WaUJOSlR3RVNjVThrb3dN?=
 =?utf-8?B?RHlLUXU0SUMzYUlpS0tTNmllTWYwZlJsYVZsVGlvazRsd3BYbDQrWmhBUUdD?=
 =?utf-8?B?RFg2Z1N6R25aektVYXhDUVJObkxsUHZ1UjFGOUlsOE1GSktFS3M0UXJ0ZDN1?=
 =?utf-8?B?aTRYUmZDV2NPK2cvcjN5OXFUeU0rUmZ0L0JJWGVkZVVnTUhCQTBtYklpZ3BM?=
 =?utf-8?B?OWEzQXZXeE1RVmMzaFE1c255RXZHOWRldm9YVXVRMUtkMDRZajVXNEI0cTlu?=
 =?utf-8?B?b1E2MG5QT1BFaUNUeHRSc1AxZC9sZDZJVzRsZlVsYkRmQmdSRk5TL1NsNHRP?=
 =?utf-8?B?ME5NbEx3SkFRTldKT1FkNjhLU3o3YXRmWmU4azhHbDExcXluNFpjMjJ2U24v?=
 =?utf-8?B?b3RHdzdLOEZLQW9ScUZJaUptbHZJRU9odGVsdEZjV1hrSTVoQVZrUXdlUjVj?=
 =?utf-8?B?OERWL3h5RnBWZEd3U3Y4a0F3OC8rZks4SDhvc0p0QnBuM3Fha21UUVFic0VO?=
 =?utf-8?B?ejhRSnFUWUpwUWdTUnlMMEN5TURScFNLZWNVaDg1cVlGeDRjRHRXZGhMdVZl?=
 =?utf-8?B?Q080RlY2SVFET2VjaWpUOFhuYUVFVEZUejNOYmJuZzE2YkF6bTN2SWdtdW9N?=
 =?utf-8?B?dmp1MWpCR3h0eGYzUVBBSWp6ZUJKeUtmb2lQMTdqUnNhS1cwbWs0STRJU1Qv?=
 =?utf-8?B?YnFDMmM3NXh0Mi9YQWYzU0tqS1UyTXRCVER6NEM1aENYZysxWm9kQThJTFA3?=
 =?utf-8?Q?icnoJ5jncjwKyORnHQHTiwlZC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82928f8-1b3c-4228-9879-08dbd965cfd5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:32:30.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KB+Amum7nYVBMtw1zstiRp6f38+d3OFWZitoGlymxlDt6lO3lHg1Hj+dmT+dmpaCzYb6amDjSGtLpXWJvuKRPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8458

On 30.10.2023 17:19, Roger Pau Monné wrote:
> On Mon, Oct 30, 2023 at 03:13:50PM +0100, Jan Beulich wrote:
>> On 24.10.2023 12:26, Roger Pau Monne wrote:
>>> The ACPI FADT APIC_CLUSTER flag mandates that when the interrupt delivery is
>>> Logical mode APIC must be configured for Cluster destination model.  However in
>>> apic_x2apic_probe() such flag is incorrectly used to gate whether Physical mode
>>> can be used.
>>>
>>> Since Xen when in x2APIC mode only uses Logical mode together with Cluster
>>> model completely remove checking for ACPI_FADT_APIC_CLUSTER, as Xen always
>>> fulfills the requirement signaled by the flag.
>>
>> Actually, one remark: The text in the 6.5 spec really only mentions xAPIC
>> mode, so it's not entirely clear whether the two flags actually have any
>> meaning for x2APIC mode.
> 
> Hm, indeed.  That wants to be in a different fix however.

If any at all - it wouldn't be the first time that when adding x2APIC, editing
certain places simply didn't happen. If anything needs changing here, of course
I agree that the further adjustment would want to be a separate change.

Jan

