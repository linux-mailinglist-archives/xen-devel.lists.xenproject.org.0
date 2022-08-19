Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79435994E0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 07:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390017.627174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOv01-0002h6-11; Fri, 19 Aug 2022 05:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390017.627174; Fri, 19 Aug 2022 05:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOv00-0002do-Tu; Fri, 19 Aug 2022 05:56:52 +0000
Received: by outflank-mailman (input) for mailman id 390017;
 Fri, 19 Aug 2022 05:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOuzz-0002di-PR
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 05:56:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7f74365-1f83-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 07:56:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2563.eurprd04.prod.outlook.com (2603:10a6:203:36::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Fri, 19 Aug
 2022 05:56:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 05:56:49 +0000
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
X-Inumbo-ID: b7f74365-1f83-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMNSuggWy6T/UED8gLJur1ZNDB5SlJI3gVUWuFKJKqPp79rHIwkG8kJ3sglZWofG5/7OdbgATNipFZUwhZmfPFsRVXFUDSCPaGebcsA397TRxV9HJ0xBNgNvUax2UAbeB0uaAj5DdDuDlF/WzNNP03PZ98NhEML+XedpwIYSJ3k/X+kIdj670iQTVfKE3/0iZLvRDsUzBKZprss//9nnLndhesfGSbcQGlFc/YMtXZ/VQ2wpvlNyIjI8rUaLY3knuq3vkvBsYlOleF7O8k4J6DdbQyZoLC7rRzxVqx4XgcOX75FE0QgItcNqc6Z+WJL6mYqZrHUWqS6F6pTcP61Fdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGpJy9GxXDGSF/wnBk5fJOCd9C2MkPOsGg+CzPiKBN8=;
 b=ABlawPS00l8E+1dg/KD0EyXtHcMh7vCgzPVAXnfs7fys26ke2eEM6vcgpM7b7RKWsZ0GZbXzvPJo7wMfQN0bd9ZQIvBai+DdZDJemg5ijKMvQ+6VX4fNnao/9y75UuJ5NghUE1U6f0YHQ21EQKN+wrFuXXEYmBC7R+9rpCTqjOuWsWimnvYHqAb24EY9HjYQLv76aRxr4NVRW2EnX5Doqxn9ev03fkX7+6EKZghI6XQ/RMt3SUO69++nZ+6XN3rj6qwnlLS1hqPylXcZHbR+RQF20Hn0VSZ69w/br1gxs9JEDASgOziUgTaV6ixecrBrLn7F+heqwq/44r/wyUzXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGpJy9GxXDGSF/wnBk5fJOCd9C2MkPOsGg+CzPiKBN8=;
 b=S60ngdZuAe97+9w5NvOMzism30dIvUv06PwIkqxXz99nMX7L/4dOqaR/2BJWrI4g0e+oIKKlSk4mU0GskpOZ84DzbLIxKTwk0GK8QtcLltpJa0yebyDMd9EMGHNeQU1R3T3PkxII5xxXuuf2VUQQaI/gHih+sS7jndNHNPPz9rkFuRBYP2VWW1VGwLdF+3knRmxRUq29ZA6y8nG7pi+gs7Pzb5FY28OZ69AL6kQ6DfFT8QuNwoJUjU3mSVx9L3XW1xsaPDZhvdoeHmQIbqhY8rFYR0goXVhxaMqUhYpvr+UKp1xi9gqkMcIMk5pUK7fLvl1SlT6+TD3TF07CPXwPIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f21833c-0cf9-05d5-4567-4b088c579364@suse.com>
Date: Fri, 19 Aug 2022 07:56:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] xenbaked: properly use time_t in dump_stats()
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
 <c87ae25d-5aa8-bb70-7d2b-ea6485a01f59@suse.com>
 <Yv5p/a/hFa+zxXMH@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yv5p/a/hFa+zxXMH@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3834879-ccaf-4cff-9bb3-08da81a79b64
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2563:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1VSceIfw99wJPYlR9uZ8Rqav8HLT2dXK4t8x3KsIGpvtY6QRHsPr0XUnHE8YgjKqihmUk+EG7Tx1f/9VHnN7KkS9qXLk97p16eGT4f1A0IZBkMSaqb+8pNRJ3iXzNh3DsrSsbR2SRb13ciHMpsRvb63EHJ8PxQrkkndX5k8ah200p7v3t6F5ZycLGLNHi6r2fRoLgaid8nVgi+n7mskpsUdYRHcCBkZO341Y6VDFY/7C0AMfm631guXm5ozwLlHB1eVKsl5KD8XyKobXMZw54FzUwFWJEOs8hJauOROS6ZBDTT5djhCgOMF3endxUD2hZ2GLs2BS5ks8p9frXJQT66YAeOD3n9P0m+nQeVudU6o/9f0bW8Sr7Tm4iyeshCaDYcczvNhx8DWkBW7BdRjvXCMrmiQmtVIwqqgbEl6ILyQps8Zc5Fcm+I+vMeXX6lideK/xNeg8MmUQWpBrLIB+dUJYHn+Ngcsg69FyvXS4G0arUZlPEuKAJjleDbIYVJNccuz4WVvx4nlC+wTYosk0rmhZlce/NBXkSpfEA1zgI3Ntb3cTbARNkUtM0ohhgfXJoBmaw4K5pLSpCsaMluumoYj6JAIHqeq+7NAmSHW3PjpIcBpP1IW7H6lUF957KWCi119AmwNZcenZ7WAHVaV4WtMO55bviSVngzXNHfsHRA4PghYKB82TqakhlVWce5segYl1nwylqBzZeLe+LOHRx3NU4HRM2uduqm93HxJgBF+leu2p93hErtkCd/0fr/Y/gWbdbStTr0UcslM4t8pafjOLGtmE2xVxoaG+S/DkXRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(366004)(39860400002)(136003)(5660300002)(478600001)(36756003)(8676002)(316002)(6916009)(66476007)(41300700001)(6486002)(66946007)(2906002)(4326008)(31686004)(54906003)(66556008)(8936002)(4744005)(31696002)(86362001)(6506007)(53546011)(6512007)(186003)(2616005)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bldScllEQnIwakR2KzdGUmRWY1VzT1VwTWV6S0U2cmwyOFNud0VseUd4eDdM?=
 =?utf-8?B?Lzl0VFMwcmpDMFZXNWxDSExUNUFHZENEUlJnRkxPdEZGMEw0ek5kMEdEU2ps?=
 =?utf-8?B?S1NvVWxvR0ZvYWFCb3p4VFdYT3lNTGNHckRFaUM5Sjg0cldLaG1kYjdHTkZX?=
 =?utf-8?B?aVAzMHp6SE5kVWN4Ky9IZGt5cFpDU0E1d3Juc3Y1dlBCVEZwSDBJTTJ3ckxj?=
 =?utf-8?B?aXhuNyt0ZmJBV3RleHpWOC9qenZRekNGWENucUZOYmJIMC94QStiYlZocFMy?=
 =?utf-8?B?WG9kMmphWThwb0tuaDRVU0kzOWZ4eFlxNDUxYXRibnQwdXhGVFZ5bXByVnRC?=
 =?utf-8?B?NnF3a1MwL3Q2ZllFV25kWHErTVRJVUFNbVhSM1cvOXZaUVhSZS9CTXBwWHhV?=
 =?utf-8?B?TUNsNmVNbHJyc1dVQWdmcnRMM3F5SDIrR1g0WFZ1WU1FeURGTnRib0ljWTA4?=
 =?utf-8?B?TysxTE9ROWZHVXhqR1A5YTJPMW56TkpDVWx6bXJZTWN2OU5DUWNjSmhUZW9w?=
 =?utf-8?B?Z2ZWY1NNNm9KZlM5UGxSeTdLdHAvOVhMVWczV1RxNW9hbXBUNjdLVXIraVJj?=
 =?utf-8?B?R1BXV0F6L1h0YlByVnVreUNGblMvQUcwU3pGNjltUmFzTmloTjFxNUJUM1hS?=
 =?utf-8?B?RVhPejJqd2hQalhQaUhKWmFidjVTd0czeVR6MnltVzFhbWxub29zYW91dnMr?=
 =?utf-8?B?MGt6TzJPbmxWQm94MUlqWFpPVXpVNUtBOVF3Y2tPTExvRHBDK2dLM1NEVDlZ?=
 =?utf-8?B?Qk9lWVVRYS9XeHM2RlFHc2VwRVIvK2RQZEE1bktXeWNZdUpRb1cyWk9UdjZC?=
 =?utf-8?B?VTN1TXlJOGhIRWE5L3MwNFlBODFYRnFMbmprd2FyWjN4OWM2KzNpeTY2cldl?=
 =?utf-8?B?WEVCS3ppb1NMdDZrdkVMb2hjSEhEdTR4YThzWWd4Z3hQSysrMDNYRk9uc3Vq?=
 =?utf-8?B?R0tNeURxNlBXRVFDUGM2Y3ExYlk0ZG9TY25KOTdJVVZVM2VESFczYU1tc0JM?=
 =?utf-8?B?SHVuSmRBb0xkSDZ4UWZKaitsQmhOY2xWZ1BSRjB4M05wclNCNnFwSTBrclRz?=
 =?utf-8?B?ZHVGbDJpbHAyRlN2V0VCclV2QS9YM3hpQ3BCVjNNQ1JjRGpndUJNcXRjMnJq?=
 =?utf-8?B?UFpKbnVWVDhHS21DYTFKcmlTbmxTZWhRWHU3Zy9CYjJhemFWN2N6NENqbTdw?=
 =?utf-8?B?SlhDQWxSTDdQemNQdjJmRkxVY3dORCtxaXJuNFJEVTB3NG83U2wyZ21EYnVC?=
 =?utf-8?B?dSsrQ2hJQUxmQmhXMzI0ekNXU0htdkYxOXVqTXkzTkJjdHRFTUpDN1U4YUNZ?=
 =?utf-8?B?enB0Y0pzOGtFbkdHWUtZMUdhSThmcUJuU3ZnYmUvZkdZZTYwTDc3L1pXUW8y?=
 =?utf-8?B?NVhuQmNBRENiSlRDZU1SNkNOaWxXWEdUa0hEbEV3Z1FWeExvRmZRNFF0ZGdH?=
 =?utf-8?B?VEQ3WTdWMWNseFdnWjcwMnRGOEpia29VaFNadm5CajdrY1MvWWJraER2VndF?=
 =?utf-8?B?ZWxhcnpVWjJBNjZ4Wm5NditXTUMyVmdaUkJuVnM5TnhzYXFPcHY5dGNod1gw?=
 =?utf-8?B?Q3J1SWJxRTRYWEJid3JqbVFyeHRrSlI1QWRCMDkySkxRK25YN1BTSUpUS0RL?=
 =?utf-8?B?RTlWTStCT1BPZnh2ejR1V0tOZ1B5MHk2dm1xaWo3RzFjbm5LU2pBOTNRWUxH?=
 =?utf-8?B?SkM5SWhrd2lUSUwrTjB6UWFucGNSNFZhYWJUS1ZLQWtJYXQrS0o4Q24rNVN4?=
 =?utf-8?B?eSszS2FsKy9CRTB0b0hFVWM2V1p3c240WFdtTW9vNWNTTmFZaHBKMUEzZTFV?=
 =?utf-8?B?c2c3RHNnOGMxZS82Z0k2OWFzNTRjZEJMNG9reStLbUtqM2xURkJ2dTN2YUVx?=
 =?utf-8?B?Q0VNU0NrVmdzM0U1Z0o3RTEzdUdyanFrQzAxMGpSYXZGZkNnVlE5RjNRekpI?=
 =?utf-8?B?ZjJqbFNxS1FMYjBueERpeUdtVWRtK2hqUG1YS2FYcjg2ZVc1QlZIZTFCeXhp?=
 =?utf-8?B?bUtBa1VlZXNIQ29kR0ZRaVpyd2Vsd2dXd0VGcHZoeHd6TVN5TncwVGdXZ1k0?=
 =?utf-8?B?SldWcmk1dFlsblo1dm5MMytrWlYybGx1OWhmNG1lMWpsZHczRlMrdTBxRGFo?=
 =?utf-8?Q?zhWW21Uj0ELsqmoA/VdDgIuDe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3834879-ccaf-4cff-9bb3-08da81a79b64
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 05:56:49.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoMlk822siFbsOaBWSRGZibvF452EHnH9UXFkNmWMgS3P6JzHRSmObOmCzVH/Wk0BDQzdssnmAsrrQjGntPrrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2563

On 18.08.2022 18:34, Anthony PERARD wrote:
> On Thu, Aug 18, 2022 at 04:05:37PM +0200, Jan Beulich wrote:
>> @@ -242,13 +238,11 @@ static void dump_stats(void)
>>          smt++;
>>      }
>>  
>> -    printf("processed %d total records in %d seconds (%ld per second)\n",
>> -           rec_count, (int)run_time,
>> -           run_time ? (long)(rec_count/run_time) : 0L);
>> +    printf("processed %d total records in %0f seconds (%0f per second)\n",
> 
> Did you want to write "%.0f" or even "%.f" instead of "%0f"? It seems
> that the '0' here mean '0'-padded, but without field width there would
> be nothing to pad. I'm guessing you would want printf to write something
> like "266 seconds" instead of "266.646168 seconds". Am I missing
> something ?

Indeed, I did miss the . in all cases. How embarrassing ...

Jan

