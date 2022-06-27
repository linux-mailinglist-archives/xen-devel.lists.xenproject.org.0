Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1656455B9E3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356693.585003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5olz-00064n-UA; Mon, 27 Jun 2022 13:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356693.585003; Mon, 27 Jun 2022 13:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5olz-00062H-Qg; Mon, 27 Jun 2022 13:27:27 +0000
Received: by outflank-mailman (input) for mailman id 356693;
 Mon, 27 Jun 2022 13:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5olx-000624-Ef
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:27:25 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20089.outbound.protection.outlook.com [40.107.2.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e17328ff-f61c-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 15:27:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (20.179.234.89) by
 PAXPR04MB8639.eurprd04.prod.outlook.com (10.141.86.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Mon, 27 Jun 2022 13:27:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:27:23 +0000
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
X-Inumbo-ID: e17328ff-f61c-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNzBVYy5tIUElNAWSnlzB54qMzLbLYUATsY+wgiJ9l8YMVwXU6EtCMCPhqPnfGTUBNcstzmEZV42+JzWign3HG1imBLKBt1qdAAb0sj87V91vc+Tv/LjxjcfcJPwJH2F3iOpN59QxPz9rvYn54wHR7IVaJlhoSBCo4quPmN+n3td0edJhYV+PFvTMIUMxU5It6i7yvPZwFfQwrXlk21Qih4VCyeeFZt3yI06Ao9ujqeCf0MZZZc77zLLIWiYQ84K3il2L+zqXIVCqTBxpDTDL4AQEPOcrjj56P4B+pxBtrSiXoTmqZjEf9wtwROD18MIGoRqZsul72CuOMsWhb1+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niUSg1BmDonetG4uHcK7+pUV0glb4m066L0M3TOSIew=;
 b=Fv2j2xKgJV8lLDBoEZGJhydLU/lpnETv68CeYZ5uI1EMHQs8ZeybHnd8evUtPKOQxS5SZjjBAwE9JaGC/lKetQ4w5IgL46g2rfLYlsUQ+g34Q3j0E5xG0/gbOOYbE+WOM6xv2xV9R2anc9ffPtQooM6Sx7rlwx+KfVV70ygigOwOnMvL5uYxRc8Zkbjs0OrcHMNGjot5rIZU8RFEVeafnC58/3DecANuATxF+8BVF5I2Wj91W/Msm8tUh0lo1+Uyg7bw3roTKiZhHc604AOiWd2QI+6r9/l+yArv6bz96ihbqHT7sVZuMXU6lqHEyghScvwfqFSk61uCIyFmHl0stA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niUSg1BmDonetG4uHcK7+pUV0glb4m066L0M3TOSIew=;
 b=o60l6I+b2CzTft22qTEevKT0ojgptZUPnfJKmyEu2ChacgYph++ARAU8Uh4THMsvsekzEB7+qaPq5iNjG6bO7HdYpmpup39YU8249Es9wQPeEuEpoCbGd52Ezucqy9iCB9VSYu3OGLhTfD3DSt4wFUt70r9KTQ8Fm66iW7WhwCJDiSrVhEM5y6/NvtP8vpPBcd84yq+9ipz/D1kh71E0oGp8HOwEhb9DaCkqLg++RP0Pw37/oa859JGoqTyyqZo2yYj3aur7LjgbS1E5x6KmvT9sm3ny/MwHx/ecF/fCP6ljwWroIy+5RwcavRgsdkQhXMbbloxGdiKRPtOA3Efelg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05b5ccb3-c412-96e1-a168-84c108384147@suse.com>
Date: Mon, 27 Jun 2022 15:27:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 7/7] drivers/acpi: Drop the unneeded casts to unsigned
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-8-michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627131543.410971-8-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fc39fa2-9d85-4c96-fb28-08da5840c4e2
X-MS-TrafficTypeDiagnostic: PAXPR04MB8639:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CWERwrot65RleYm0oFfBV2+0gDX58j0jV8crrqQ1T9Q0dNerSVK0z7wIObVURGYkLNlXfi1jq8Vslf2O6d2h4FKpddMBVb+Wu4wRErjcmYnfslwMgMqKM1scq6InlZyLaW57qjib9nttt1qrMWl0QE2ubY+1ZYoFd4MeLISRtxl8lq+7+mr4n3t4e5LyGo54b37iOizL/PyIWVD4riPj+X0jS32sChAqpzVlOjSCp0QBCxVzB+3DUZ+TKIO0UgNWgsClSBHNfKza8HFGTVbg+obtiPPKB93359YUvjfNWvfq0qi6JsbYxKakLpIWvdJKjN9MGN/8NeiXwMpws+0t0RW9yPIjUmw1lKHNbfs/3wBlYiPIxvTWrSsRP8PhUquaLIkkrYlRfvSg9ImF2hK9IVrEu+eH0AHyxtMkLeLssnAbCUI2fMkJ2S7RxbHlP5A07Er6uYkNOFPhehAOOXpmtehjhVrgmFYMQZIZVINUKo9h05wV4DfVXJX1xg9q3W/hZkRTHb4JAvnvvRx8yr5WBh6Jq2M5zUFLQX/C9pCiAxrYpBDE60P7pB7NwjuOjqGugZ/4K+sVDuHH8OouWX3SIUfnMYMbZVlRgtL1Rim0jEJrMbsyKEWg3hWxqORsbo8dmYq54hy2pGwDLJr7GP6AcraVtWCEeQfWs2Krh8NwBv8mHRl5s5eOIH40CyscegoheLcO860QRKujGzHHGoE4hQKFexn4eMAx3cavJJPn1mn//g3t6SRP0ivHGqH0Tz+05cOPyzga1RJAY1B76PNL6iSDjzdW2IrSi1PqvcBet2we6k6smGJfmnIxQ/T4aR7UBhbmQOXjJiT7bTKNdZEjbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(39860400002)(376002)(366004)(86362001)(36756003)(478600001)(6506007)(186003)(41300700001)(26005)(558084003)(6512007)(31696002)(5660300002)(4326008)(8936002)(53546011)(2616005)(316002)(2906002)(6916009)(31686004)(66476007)(38100700002)(66556008)(66946007)(8676002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmdMcUs4L1NLUElaNE9vaWVGMm5TcW9iazJ3RVMvaXRtSlZBb3N1cmFRT0FT?=
 =?utf-8?B?Zkxwa3RWVmFuWWM2L2d2VDhMbC9uWkF6R3A2dm9KTmVDU2ZnTms3L3VIbi9L?=
 =?utf-8?B?Yzc1MFczOWoyNmdNRm0wZ2pwdGNOWlFhUktkck1lYWRrWVpwY3Q3S2J0eXJm?=
 =?utf-8?B?K1JPZE1UbElxWVJUaXhXMWh5STM5MVp5UkQram9Pd0pTSEtaSFdteG0wZjI1?=
 =?utf-8?B?d3BxQWZRUHNRRXZaMXc4ZFRVT3RoZTBGUUN6Y0Q2OVV0MUUzQmRiOVVSTEts?=
 =?utf-8?B?T1lsdHk0aUhlZmxVakc0b0h6M1R0NHExcFRDUmxRekFJdzVWbWFjejh6NXgz?=
 =?utf-8?B?T0hnaVVjYXM2RVpXUHRIM08xOFVRSWlmNVN0Y3hhMm9mSVBORHpweDd5eW5L?=
 =?utf-8?B?dEQwM3FLazhmMVVNekJmbkVIRENUM0pRV3NFZmR4d2YrTFJMdDhuYndJb0p1?=
 =?utf-8?B?Q3pmL2EwQ2FIREMzZWprT0hhMEZaRldLMTlaWGZXcVQvQ3o2QVI0NmhuQ2lj?=
 =?utf-8?B?RGYvSzBOYmY1QTJoby9pemVnQ1laamxjMW9lZVBXcTlzV3ZXUjdZVDdnajhY?=
 =?utf-8?B?dEV5M2VwS1F4YTJhc3psT2FVanhIT0ExZTQ4TEZQL3d4REllL0ZGSWU0U0hs?=
 =?utf-8?B?WTFQZnlxSHFFc1FCV084UnVYbEZTUVBmcnBiV3VFWnBDcTBOSGNxcUdzN0hs?=
 =?utf-8?B?LzdZUFFEZTl1U0V3U24wak4yeFZZN1FqZ2pJUVNWaTgrWDFCNENkc3BqZVJn?=
 =?utf-8?B?Y2tQc1VMRGNIUWJmemZRTCtLZEgzdFZ5TEljR1pJZG0wclZyOVBNaFQvSUFO?=
 =?utf-8?B?ZEtCOUxtL0ZTUlZ6THprNk41cFBIS2J5Y09DalNsampwVUZQRkhGdjliVmtp?=
 =?utf-8?B?a21LdVovaVcvR1h0Tk9rNDZZODdNNHlTbEhpRzRXQWN2NW96VmM3NXdEd1Bt?=
 =?utf-8?B?WVl0SnJSbGRVSFZxQjJmU0JRdGxpRndHOFcwS09wQ2diSzBaZ09XNC9JaGwy?=
 =?utf-8?B?MFdoLzdZVng4aDUxcjBaeVFFSHpncWhXbml5ZHVFVXF3RisvTWhtdGYyNE51?=
 =?utf-8?B?Q0FZa2IrbDRCeHpjdVg2cWg2V0VWWkh5di9UQklDcGhRZnhIeXdXT1pqTUlH?=
 =?utf-8?B?RHRIaitYZ0NhZGNKTkZjanVzeXRibm14bUM3UFBTK1ZReG9MMCs4Q3AvZ2dq?=
 =?utf-8?B?R0Y1U1VmZUNwWER6TytpNnRrME91TnFXdXBLa0I1Q0NnMTY1ZWZvd2F0NlQ1?=
 =?utf-8?B?YTFNZjNwZmdTZExucFBWZzNtakFWbm1SZGJPZERkdFF1K3J5NWM0cDE2ZTRv?=
 =?utf-8?B?WDF5d21jM0cxSnhmSnlDUm1jamc5NDhGSEdTTzkxOVAxVTYrazhPVXg1aFdw?=
 =?utf-8?B?S2lsOXlqekgzVS9rVGN5TDBMYXlVVDlGazhjMld2VGZPcmV4cCtmTENPMmFq?=
 =?utf-8?B?SHYyUWsxMnFLaktFQTBhL1BiOVl1VVBKWTk0bHR6RFhEQzlzNUE1VzA5b1ZG?=
 =?utf-8?B?c2V3MmVRMDZuTDViNWNTMFA3czlTdkJQY2NoNEdPcGFlQkFiTjZZZ3lhV2x3?=
 =?utf-8?B?K3NLN1JTQlduOVJseW5uSEFuSG1MZmYyUERJWXJIU0pZSTNLZWlNeWFoOE85?=
 =?utf-8?B?c2tEWFB2VzJxUDlMK1ZDSms2RW9jVUtkTk9FSC9jK0xQZ1dYYU5oN1JDRllX?=
 =?utf-8?B?RllHR0pZcGRXcjl1SGlSK0syY3d2TFpZQWkySTZoY041OUw0c1FpRDVDQzNU?=
 =?utf-8?B?QmVmM083T0x0SWZvTm5JS2Z1TFF1OWdhS0dxbU1BU1R2anB1YVRzTjloSkFa?=
 =?utf-8?B?cDJocGVtak5JTzQ2VVdHWG9YYytMQ1dHUGxMRGkwYm40TnE3SlRJMlRuVndZ?=
 =?utf-8?B?NDlZOHhqZG5jV1g5TGxRS0pZL3ZZaVNWQ09CYkZNVHBKdjNNZ3NWeEZVOENV?=
 =?utf-8?B?ZzdLOWtaM2FReTNzQjVPeHR4aWh3WTJpZUdEYWQ0cGpxQzM4NVBpZWtIamhx?=
 =?utf-8?B?dDN2cmNzZ2dUOFI5aVM0U1BBWEszUjQzaEhFVnIrbzlkUnJ2Wm5KcWh0Vm9V?=
 =?utf-8?B?Q1llYXpMQUFSbFhkNjM5cExldDZaWXJ6QUNPN08vTkNSNTNRUy9nVGtRMk5S?=
 =?utf-8?Q?PiDV4jY2GZTEtKrzKOCJH56bk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc39fa2-9d85-4c96-fb28-08da5840c4e2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:27:23.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxrmBIKp3UZMeDXBKTdOB5goKSd6mtpm/eFuN5IB+q69No4dJ/rF7S87jb9/p+kdKGUtsku4GqOXWC8UB/AayQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639

On 27.06.2022 15:15, Michal Orzel wrote:
> ... and make use of PRIu format specifiers when applicable.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


