Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A06779C2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482750.748424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuZI-0005Rq-3u; Mon, 23 Jan 2023 11:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482750.748424; Mon, 23 Jan 2023 11:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuZI-0005P5-13; Mon, 23 Jan 2023 11:00:52 +0000
Received: by outflank-mailman (input) for mailman id 482750;
 Mon, 23 Jan 2023 11:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJuZF-0005Os-Op
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:00:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fdcaf94-9b0d-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 12:00:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8271.eurprd04.prod.outlook.com (2603:10a6:102:1ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 11:00:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:00:43 +0000
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
X-Inumbo-ID: 2fdcaf94-9b0d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ0jl+d5ztb4sjCjGEYxwAZRbYFE3ji9hsLD/JAs7ciNB90Ew38tCjShPy55HI0b0eIvcnvxNG8GaT980ZbqdBH4W/uYsoQzjAbTKg2NHCRDoQ10RfJUAr5b8xm3q2WHL+OrCrxUSg16sbr3P0a23+PMHrP5X21waAG/oieAqUPWcA94JzqFwZTlwBGyZBK2LwVmD4mHwqNFqu1L9socc3QmRjrSDvCurgV9KRtL0QkVfPx/xbJuFgUDtpPV+5UoRz+/14CgIrSLavTkdZW5dx67TUbpVpyjT8OLWw8dUfDxaC67A7SyZYyvlQr3V4li9dK2aycLTvU+iJYKlKQ7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZYWa4RhsCkfQRLtp+DAQup+Zia8TMo5i5Y2bh0Yl3Q=;
 b=Sws9cXrnz6ucmGqSuw/Lq7dB+L4UixjjZw1RxSZXzRXRLrnQEt8z7UBnYwNvdLWowBnT78wSk0+0l7U3VPZg2hohWbbm+tAflq2lDgac3vp2GQrV2XkutvDBwtTLPJUauDrid7n7qLGQElCLfIq+HG7r/8UVA5ERFoOvfNgkpzaDSosGN8MVKrbfB7yACD3+7yMDjyVpfBxJ3yxbvOCPoyZU1QJrTGAgI0XXUOCQvoLB8Nx6iZNAr2Ifg/qCNowBMcgPD2L2pJJljSBcxPL9WQkGtu0pnGlYPkEWHKi0mGWKf2Z6lEzMpJx271q2wVkTDKCi9AbYRpngENKkcShEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZYWa4RhsCkfQRLtp+DAQup+Zia8TMo5i5Y2bh0Yl3Q=;
 b=bmtLG5xQb9K8o1Vr1Q5xyNC4CCG8UWylw3wy3vavMhQw0d0hIPGEYS9YuHvHzt2b2YsqKG43j6mWnOYAbBrXsSEftv/ugx3o4wazq98/t3EtqhsL1vlCq932LARi92VdE/qmsMk2WozplxC70+p9VE6S46EcEELUPUSGwNvFskygf5+X+u72uzzf1hNnQla1zY5ax+gTW4bmu4Drnyc0fjezWbRs/lcKj8YdEO+h1gku9RIwbnind0Tws9TFlUVrWhtRN5ftg81iklIt8wE16vKUH0tzvN2B3zLSQjGYQfbaepgKv07j0omynjPISQTee9IIHEivyGJDLwc6F6iekw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e82c32fa-4318-96e8-4c0a-eee26b1cea74@suse.com>
Date: Mon, 23 Jan 2023 12:00:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
 <610308ac-3440-e84e-02ec-928f0652e9d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <610308ac-3440-e84e-02ec-928f0652e9d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 5793c51d-71af-4bf1-f291-08dafd31127e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z0zM6MqOh7j+Zx4Qu/3xNlTcc3nlk2IculypZbQxICiW/kFs5Xm3GmkpBvwp4IIKnO7+X5H6XeQ6yYivYZNz+FTFA692Q2OzybMqSwtmlKK/6Fm1orMhMhrkopNUl12oX/TstX6aGjDHcVoId4Hc3EAZKVPVi4+utiDgjpA4PbkWhVVBA1DTvbMdPv0Kr1/6VyYKGFKWLAR5hcC/zJg65qo8aXMoXjsvvCSrJBwm88KeX9fcdRuAn3LivLEU1qFWFUobDrmjCmXx22WSLa9ioY1dP8VjAY3jUlARDml92/Z+ImR6a+XM6Un73nt8GVULo4o+tQ6d1fGaMSK3AouVbFLJivVP/pn0I+3Ld5wF5ZFCG6exo6Ds4CWi/6p+lLf5o+CVTr/bw84gfMpQs4yMEnQZ3TObqw+3gUvtgpmDZ4iUJiX/nqjRrDbsbSMg5V99a5pue3II8Vv7ll0senOwRXDRxZuN29D4hZETg3W+DnsHhnw1KassfkZVBCX0g4u257pueoLNCalmeG/6X96yETIGe7OQZEv1QEUVaU0VMy7zJ9C0CYfy788UqXlKuPuufod2BtqG0uiltIVLqbfa9m+bdW3omGMimN1FHMqpMcb8sGY4ImOw5ifU2DHAF7tuaivwiz2wGSsWGTh3hsjupLGQFex010Mp7slpThvrHlSpp8AAi+yUmIjHpNpTdtKpv/zdGmJ6UkAOb5jvEn+POgAFOIM81ArQdqYYLIJVjmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(38100700002)(31696002)(86362001)(41300700001)(2906002)(4744005)(4326008)(5660300002)(8936002)(6916009)(8676002)(26005)(53546011)(6506007)(186003)(6512007)(66476007)(316002)(66946007)(54906003)(2616005)(66556008)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXhJS2luaDRZZktkdGk0TEpkb2JSNlIvaGU5VXF2MStZQkVJZTZEbExEaSs2?=
 =?utf-8?B?bWZLZVhkcE9zYkU2U05YQkdxVGJxSUFSOWgrQWppVzBIaW1naDZETzhHZERi?=
 =?utf-8?B?Nkc2dEQwT1J2dWxOcGU0OE5OUTk5MWR0bklNeSt1eVkrQytnWFlsdmUwWjBV?=
 =?utf-8?B?ckJ0THNvQXFKUmJ5SDF3UEszalBMMTQ2R016blIwNlFMdi9DQUtWRU4yeDR4?=
 =?utf-8?B?bG9vcVJLekc5QUpkdWZpa01la3FhbTNQVE9nMjNpVWEwR1JnS1ovYmdJMXBx?=
 =?utf-8?B?K3IxaTZ2TnpYZ2wrVS9MOEZrcXh4VlhjV25hWUpMUGx2L2tpc2cxMnkvV3V5?=
 =?utf-8?B?ZDZsVHRXOTVPY1VmUzJFYzREVGs0SHRMTnFDNXZGUjFNeXNDeVJCSlVHODJi?=
 =?utf-8?B?c1lVMzAwaFk2Zmdhb0haUU5YT05aampHWXJJK3d5NDc2UE1YQVdWeVVmNEx5?=
 =?utf-8?B?NHBjQnFNcDBEQm5PSlhxc3hEMk5SUmd4UFhxN2l6RWRhK3NiNHVNQ0RUbzFk?=
 =?utf-8?B?bG10S25vaitvOTc2cXNwQkxDZUcwanQ5Mk04ZURiWG56RC8wamNwbUtRUkUv?=
 =?utf-8?B?dnVueExjY3RNQThKay9lQzBBSUk5dnRoK1RNZUwxbkVFaDFhQTNzR0JOdUpH?=
 =?utf-8?B?S1dKdUcwT2t1Nm9sc09VSUI2NlJ6Y29ROXJyelplWUVBUTRoYUwxK0FEVjBF?=
 =?utf-8?B?eTdYRk5OeFFKZ0pvb2dMZFlZeEJMSjc1Q2NBL3NtWC9iTmt6QWNOdTQ4SHVZ?=
 =?utf-8?B?cUZnMGswV0p5eXNEaXgyMUZWYXBEalRjQ2s2QnZnUWVKcm1OMUs4Q1RDOURN?=
 =?utf-8?B?Q1pEQURlQlFqUVNZSVViM1lMb0Irdm5mQXNFeVZ1UTRGM0FrUkxsSjlVRmUy?=
 =?utf-8?B?c0ErRzVNMW5IUEp4amRhbk0xQW93U1JxMWR1UnVQYzJBRG14azllRHhKUkRw?=
 =?utf-8?B?SFBrY2RQaTVNMCtKb3BiNnZUUTZwTzk0TURsQWJueXBDSHBhSzdjQmYyTlla?=
 =?utf-8?B?aCtIS3UxRnFiQzRWTTE1dW5WU0IwbE1IaGtUb0JIUmxCdkR4SU90Y0Exdmp3?=
 =?utf-8?B?QmxIT3BqRGIzMm96Mk4yZ1VaeTZFVVB6WmtmRkR4dkJWUzFwTWp4aE5FOUdl?=
 =?utf-8?B?MW1lRlRDKzcyR1JCTlJpQkE2dktKWTN4ZEV1bGJ2L0dUSzN6RmtlTGhHZkVT?=
 =?utf-8?B?ajNtNnJhdWVzaWFoS0RRWFFFT3Y2RHFUcEo2TkNKM0d4MWdna2RwSWh0REFx?=
 =?utf-8?B?OUtGdnNIcGROM29iclRLNnpVN1JyRk1LUXNreFBaWU9vQnJmaWVWdFZNWVBr?=
 =?utf-8?B?clBZUU9mS1JnajVmbU1tUW9NU1drRGF0U1VlYkpXWEdTbHg4UEcyeW91N1Bu?=
 =?utf-8?B?SHhWK0JsTmx3UEFjakYwTGsxL3U1djVvYW9nZWhBYVJRNnBkRlZWU2txVTg1?=
 =?utf-8?B?a2NGR0NXYkJNdHpmc1RRTXZ5V2xYTEZBT1VULzF0RUJnNVV6MHZPRDZGdlBH?=
 =?utf-8?B?Mjlxc2Y1WitOaGRsNzl5WUtWQjBnSU1xRkpRMHpHc0dXQ1VFU1V3d1ZGUll6?=
 =?utf-8?B?a1hEeDRMemFHWjRNL0svaXgvb1ZsOS95LytuYWQwUG82eHE3SnJSdUlYTXNC?=
 =?utf-8?B?RWZXa3FHY0lLTEhTSllVNFVCa2QwMXlJSitnTmdOZ3B6Mk1zNm5nTUU1bTB1?=
 =?utf-8?B?eEUwaDRBS1g3M0ZhR2RuT0VVL3dzNTlhb2Y4NWo3QjV5ZUpGSldNeENlak9p?=
 =?utf-8?B?WFhBaUJGSlZXNSt1bmN4aDB3LzZETGJzdDVqWWFPK3pLek0xa050cU8zSkdQ?=
 =?utf-8?B?a1hFZ2ZkNjZYbGdPNEJGRmF0dDNYUE1paU5NWEgzaWpsMXBQc0FXK2EyS0gr?=
 =?utf-8?B?UlR2RDV3c1cvM2UrU3Q3d1Q5SU1vNW5xK3ltaWUxRE5mYW5zUE5hT1AwMGYr?=
 =?utf-8?B?Z3ZIdEJMUTJYbVhSd2tzeGhDRGEwV3UvRDg4dkhCN2VrTXd0Qy9vWThVajZS?=
 =?utf-8?B?WU1xR3Q0Q3hmZ3hVUDl6WWV5ams3RnM4UittQkh6U2xIcWlUdlFCN01ZV0E0?=
 =?utf-8?B?eFpSa3ZmL1VuT1NWeXpKLzcxMUt6VG5jSFEzY2pDZ0FkNVdySnhnYUt6ODNi?=
 =?utf-8?Q?EyT/nsUMtsqHFpZZbILsUI9Xj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5793c51d-71af-4bf1-f291-08dafd31127e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 11:00:43.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6gXupZPcDAZ3SgJU3p1sHGORPJRto2rtVSrrRWF9W0rapuSmfECcOKqpN798acWqfAqqxSC6D6jwGRIeaPTcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8271

On 20.01.2023 16:31, Andrew Cooper wrote:
> On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> There's some stuff in here which is not RISCV-specific.  We really want
> to dedup with the other architectures and move into common.

I have to admit that I'm not fully convinced in this case: What an arch
may or may not need in support of its assembly code may heavily vary. It
would need to be very generic thing which could be moved out. Then again
xen/asm.h feels like slightly odd a name with, as kind of already implied
above, assembly code being at times very specific to an architecture
(including e.g. formatting constraints or whether labels are to be
followed by colons).

Jan

