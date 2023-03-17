Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136206BE3F5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510935.789524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5d0-000579-Cy; Fri, 17 Mar 2023 08:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510935.789524; Fri, 17 Mar 2023 08:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5d0-00055S-A4; Fri, 17 Mar 2023 08:39:58 +0000
Received: by outflank-mailman (input) for mailman id 510935;
 Fri, 17 Mar 2023 08:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pd5cy-00055M-UC
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:39:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af40fce-c49f-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 09:39:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:39:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 08:39:54 +0000
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
X-Inumbo-ID: 4af40fce-c49f-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8ZoBKKwXK0PdLmG6pdD287XqbmXixiNWicwbgt6gfUxn7N8vR62vREDwQa8oR8uBxEgequxFhCS36yN0lmtAyeMEhTjpZOLl7M+w8hibzPG211YevsZYZAQA+8US3SA52h9H+EiFy3SKDFdxYQm/Q/7dwyaUh7TqCilMyFp5COXdAdmCk5w6d1nqjST3bbvDc6JrV6E5ZQ01CqWzpA/NkCH/WK+qM5I1OmOLHrF486QoTpPUE1b9uXfAgBXjUqKg/JzTAOEA/qNeqoQTHVnnq/2gG6oCND1shqPcvoiayF10YUahP5aTAXqW4reVbMlI8klLOKirkW+FgnoIOcT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxVLIiDXVG2q0dmqUVtQVnpKip6CkLehP3BAKOJc948=;
 b=G4AG3xmJqQ+SBr4LXZ8WMBbC0gvVhlw5VWE8trNvQ8ynPtfoDn7+k+A+7wjcMexcIWGbv8AtYCm28N/oHGk9wp8Yp8OGgGQAkvwDxOdlarnsNvRxOJ+Atn7spfzFsNY+58pvBMJDLcM6JN8JwOPTKgwBW0XP4IlFs7X3XyWW43D3ydr0FviN88YFPAdGE4mBDsOH8qA8ndmHqGSgCTBX6zKXy6VmleJ5mXcN/IWDq+1su4M5YWdPBS4GhIIEmy/J9tcWj9snMQthGKEScGQ8vkUT8UMo+j7jGLeINJllVkPFm5+/2nMu81FKGe8Y/KbVg39e3HEVltL3I2aeqj2yvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxVLIiDXVG2q0dmqUVtQVnpKip6CkLehP3BAKOJc948=;
 b=iZUlhMV7HG/EBE91Dj8HCGaKZs+xFSAUvEPbw6OXH0tRj0B+v8IhoYd7lFIeyaViJeJ6mpBzrFSsgFTuM2Db2h4reTCZDqZG486UJcgm8SwHj68GYnaBXm9AvC5blJfJE41XpA6EREd43eW9TOz3UWyTka2C82bfeZBtnGRGMg4e/MzvBcLo6z4MkBLxI8miO4hjRW2ErjzZteEg7MgXTl+hJo50vqjU7bhKoSHMHf+GesivAx06Ohs6rrdW9LJrCCJ75HfvI0HIvcJVo/VPcnKkLOdOl3sA5ftu+SKfYTy1cj/Nq4yBAdFo0tHdItKSxMUgNiazhvqkTU07EV9sRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
Date: Fri, 17 Mar 2023 09:39:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Huang Rui <ray.huang@amd.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a64b70e-fa39-4ba5-8206-08db26c32e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	habecpewTNAi5OkC9MA/JO3eboFNvfqDJSlm9G2c09jV191mTGpZXxiuI3mePFoxeXIwBapTS51ywjjf8HIh7NNvg2XCEhFeR4OMayg8ZytBPSbbl1aRoXHolEjD4ftyeaexWJTSq1oMFHOyxbbGJ0o2OI2AS0XJ1xNB0NkmuUc1vr5bUwbCfvkYThvdkorwCyU4OLSAKPL0iFKFdcHTxxyIXwsWVBo2rrY1zSTKimU+tCrHjMSaGhvQwRDil9HNzg10pOlgRyIlQdaDmhs85oC3OFfqM8Xath1HdGCUM2cN5y2iPUTDfJArt6hWn2iQL0DZtSRdG3jBqZZI8FNSbN0kXWCyTmGsVwlx+fJE/GNHr2Xa8ymAGF1pmS9C5Eggvp+OKDpwGQ8YL6Llf4W2WfDCqMd6IG66oH3SpsNA4EfEON1nocu1UJ1rUDhy5jTbWgnkooi9w1LoBfIH+eIAcTtCuIccxbGjajHt3PaOUA7C+Ega52AcFYxrWgu0MGdOvm+8HURB3YNeSFh7uiGzhGirOVEwI9IExq3Yh/SKJtNsFBuuTJmRwX+EFkPqiYxvVqyJwktwaIox0/EhlEMzDughYggWbRSqPKt233b3Wso9fPQu1WDxui7opPCTF0ZFcJ3yDTxC57YLWK+T5FLiMB6pu74wgxNXjKTNW/9AbcEaJqNoiwX42spzDGSi0+xzDpWiaj+FsOR+mS5i1gtbWu4InZ1IzU8e/QGhEeab+qY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(53546011)(31686004)(6486002)(6506007)(26005)(83380400001)(478600001)(6512007)(54906003)(66946007)(316002)(2616005)(186003)(4326008)(66476007)(66556008)(6916009)(8676002)(8936002)(5660300002)(41300700001)(7416002)(38100700002)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dndBZGtTQ3grMkt4emdJWEpFR09zRUlLUDFqZHBGb0Roek93aGU3YXo5cnF6?=
 =?utf-8?B?VzdTMndGa0VwZCtOclZ0eFh3OG9FdTQvQ28wcXZOemY1ZW01MzUvdytNZkk4?=
 =?utf-8?B?RXdrWUlvWEhDS01BS1V5dWFteDgwbzd0dml2dnNPMUtuZDBuM21EYnYyNm1D?=
 =?utf-8?B?RDlUcHlWZE1scVQyRVZ3aGR4VDQ2OEpwV3hSVGI0NHBUVTU4eWU4VUJGM2cv?=
 =?utf-8?B?V0pzWlZKcWtjYWlWSkIwZUpJQXZWWmlERExJOHBLcGk1eUdnS3ZEak4wRGEy?=
 =?utf-8?B?OUFwZng2SFVWYmNrYkVNUmxIdnB6MytjTzA3d1J0S1g3NjIya2FteHcxQVVJ?=
 =?utf-8?B?SFlzRi9aZEx5SE9vOThlL3M0WlBiV0Z4NkxTZUo1dVlQcGczQnM3OUVvc0dN?=
 =?utf-8?B?Zk1uWUIvUVZ5Wkxaa3RmbnpIdldrU2pyajBTUFJLUm9UdmV2V1p6b1Z2TkpP?=
 =?utf-8?B?YmRReFIvZ0cxNHMrdUpaYWdmRVk3aS9qZlBUTVpNbk5zWC9Rdys2K1JTSXB0?=
 =?utf-8?B?T2d6L2lxalBhZXRRNnNMYTNjK2t0WDl6dDdHSHlkdWZPM0paYm9GblRuV2kx?=
 =?utf-8?B?SFlmRU5YUmxORmlLeUFabDFvSVErVEY2VGN3VXJtRW5oay9QK0hIYUh4YnRS?=
 =?utf-8?B?UHF5RFRLckpWREJuK2lwSlFNaHRCUnh2djNLMCtLRC94cXhDTDZYRnVRdlV3?=
 =?utf-8?B?eWVaMWliWUhGYlZLeTkyNVMvVHhFZEpTSFpWakZqWjRjdGd0bFRLUnQ3cmlt?=
 =?utf-8?B?RFBNQ2dZZUZwR2w0SU1LWjhpTlFSQ0t3d3krcmZGM09MczJwaGNQQ1BWaTJw?=
 =?utf-8?B?OXVKTGYrOUJhWmk0NGc2b0lXWUFCQ2RqeERnYnpIZjQvWWRZKzJzVzIzT3hj?=
 =?utf-8?B?QXk3YjlTTmxIckxkQjhHeWt3dGp3ZmJUb3ZKeExtd05KdHMreURCeTlBTVl5?=
 =?utf-8?B?K0ZzZjQwV1R5WG92TUdPbml6dk94MGs2aXcydW1TazJwelkzbUk3bDZzWVZn?=
 =?utf-8?B?NWVzcUJ1YTQvYlYzZmNkVEJzRXZqSWlXRURRNTBXU1VDQXRONXc4Y1h0ZHdG?=
 =?utf-8?B?WVNCMnBrc21EeE5EOVdOMWFvTDZiNmEzKzd3OVBleW1DOTdwYTFTVHlIbC91?=
 =?utf-8?B?OTM1aEpKUnplT0ZnYkRSY2taZFp6QXNaSXZ5OGdSSmlDOXN3UnJVZTY5ODBD?=
 =?utf-8?B?b2lFelJmQW5VV0JiL0FtY01TOEJBbFduVXVmZDg1QkZEb1BnY0V5cUFtb0lz?=
 =?utf-8?B?b2RtNFRwelhSbGhhMXN6U01lWmJiYTdzMnIwakVxbnkxWE9aN0Y3ckJta1M3?=
 =?utf-8?B?UlhtUzFDTmdqVjREa3AvMytmRkRvV1RSNWdQeE1Vb1FUMHJCL1Z3V2RRQWEv?=
 =?utf-8?B?RDA0T0FQUjh1bDBKbDhIZWFxemcwVXdjL0YzaEhYazA1VjM1UzJmZXNMNWJU?=
 =?utf-8?B?N1JISFFSNlExVkxSUDA3dDR1bUo1ekExeXp6VlgxejJIN3ZBUjVtKzNnb1dk?=
 =?utf-8?B?N0NFT0wya0JTY3dmQUhhQVMrZllNbDIxUFdXSW9wbWlsYUs1ZFFueFhhN0Jh?=
 =?utf-8?B?RXp6blJVM0NtV0t6ZWg3YXRHdGJiNFprY1puU3FpRmppU1FTb1YzTHEyamxo?=
 =?utf-8?B?SWhhVHBkU091M1ZPZUpQTmh3TVAydUlUQTNiTStGQXFYZldWRU40S1J2RmZV?=
 =?utf-8?B?eTA0YXZsaXcxSmFGTmIrUndhKzNNQzJPR2dkNktrM0IraFJSL2E3Z3RGNTdM?=
 =?utf-8?B?bmI3NmVaSlZud0FFd3BhbjhuLzZzM2NMdHJmcDhXZEdxeHhpdVFleGN6cG1t?=
 =?utf-8?B?VTBKMmZVdFV1ZDJZTDdoY2xXM3J5dHJLZDR3bWFJVnB1M2JsRFR1MjBrWEpQ?=
 =?utf-8?B?Ky9ESEl0aWFEOStCaDYzUGJ3SUV3MmR2eUlkUkhVRWhqM3l4TC9PUlVwL2NW?=
 =?utf-8?B?YkdFRXd4WlJMSm82aHFqY3hDbGx3K0RyMjNvQU1oRm1JbXlTTVd1SHM1Y0Nz?=
 =?utf-8?B?M1dWbEFnZjZyLzl6R29HN0lpelQzS1U5dnIvZllRWVZBUmJON3FURzlLcFdQ?=
 =?utf-8?B?NkVqajdQaDdJbXFGTmxFR1RqV2hFdVhVK0RxVDB5MU40MTBOOTc1M3NDTll0?=
 =?utf-8?Q?TSevenKYCQA6WlEtY8Bo/LQmq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a64b70e-fa39-4ba5-8206-08db26c32e1c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:39:53.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsupbkxRyy3hu4IKdPoKr9+H6ix3ArV/ekdbtCdmZEYnKd6zIh8N/Wi0HdIlCIk9pjYLPcmzHriKFynH/riqLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605

On 17.03.2023 00:19, Stefano Stabellini wrote:
> On Thu, 16 Mar 2023, Jan Beulich wrote:
>> So yes, it then all boils down to that Linux-
>> internal question.
> 
> Excellent question but we'll have to wait for Ray as he is the one with
> access to the hardware. But I have this data I can share in the
> meantime:
> 
> [    1.260378] IRQ to pin mappings:
> [    1.260387] IRQ1 -> 0:1
> [    1.260395] IRQ2 -> 0:2
> [    1.260403] IRQ3 -> 0:3
> [    1.260410] IRQ4 -> 0:4
> [    1.260418] IRQ5 -> 0:5
> [    1.260425] IRQ6 -> 0:6
> [    1.260432] IRQ7 -> 0:7
> [    1.260440] IRQ8 -> 0:8
> [    1.260447] IRQ9 -> 0:9
> [    1.260455] IRQ10 -> 0:10
> [    1.260462] IRQ11 -> 0:11
> [    1.260470] IRQ12 -> 0:12
> [    1.260478] IRQ13 -> 0:13
> [    1.260485] IRQ14 -> 0:14
> [    1.260493] IRQ15 -> 0:15
> [    1.260505] IRQ106 -> 1:8
> [    1.260513] IRQ112 -> 1:4
> [    1.260521] IRQ116 -> 1:13
> [    1.260529] IRQ117 -> 1:14
> [    1.260537] IRQ118 -> 1:15
> [    1.260544] .................................... done.

And what does Linux think are IRQs 16 ... 105? Have you compared with
Linux running baremetal on the same hardware?

Jan

> And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> 112 (which is the one causing issues):
> 
> __acpi_register_gsi->
>         acpi_register_gsi_ioapic->
>                 mp_map_gsi_to_irq->
>                         mp_map_pin_to_irq->
>                                 __irq_resolve_mapping()
> 
>         if (likely(data)) {
>                 desc = irq_data_to_desc(data);
>                 if (irq)
>                         *irq = data->irq;
>                 /* this IRQ is 112, IO-APIC-34 domain */
>         }


