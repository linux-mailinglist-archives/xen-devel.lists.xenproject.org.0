Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD809773894
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579334.907266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTH7y-0001TI-Fv; Tue, 08 Aug 2023 07:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579334.907266; Tue, 08 Aug 2023 07:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTH7y-0001Rd-D9; Tue, 08 Aug 2023 07:27:38 +0000
Received: by outflank-mailman (input) for mailman id 579334;
 Tue, 08 Aug 2023 07:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTH7w-0001RX-C6
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:27:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aacba6f-35bd-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 09:27:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9199.eurprd04.prod.outlook.com (2603:10a6:150:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 07:27:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 07:27:30 +0000
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
X-Inumbo-ID: 0aacba6f-35bd-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnzI7vYF/6vtpJQ3Gdfdm5SonW9mWy+Bl103XgymBNzrrz/5qdx1azfsvXK5fGusFq+QFJKIYTKRU+iUu1q24+JSgHJ+z6Itckw/KRC8ZECx+lyU9PnDNpEPrTenrDz7trCcn5+ftdiIRtFaBViwEnyNSjuRDZUq91tvV6Emz8OwyZWyQ37zd7bU4SuUnNFkkgmAdviBnMO3vuBUC12aOKZzXb88FFOhrH1sOYLWUxIv6d5uJmuD4uB6XxR9RJGlT1szlXnfgkY6xkIh3KPxbLnn4s5UETphWmDeqKp8WHLrA6KuPi4e+W1VlCupvJwloJgi7wxYOCKFwuHMWAyK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1CR+QH2QRjA3s8fhRSnMYrugfzzVYpsSu4bpcG0fP4=;
 b=buS4HUvG0RtpUSdKKKR7S+2vpPwHAW72Lpjk9AHtS1czhCH5AlDLzuXhq2r0YxX8535tfBzGdncswMigAY4HexVOOmRZvigFHQu5Or1Oz3QbmjptR3h57OciYrKjwDi8BHRBXPW5vmncMKZOb+k/Iy/jwjjo2t71HqDReOTUqpF3J9KdLkqdlGWXIXAMkpHUiNVu5uFEED/BzWepgSl1iCyV3IgQfSvvX25S50E6skw26CyjbBvONDnaC0M//d8wOUebDWQzC/IF2889lGm7yfDhlIHXcnu0iyVJnc0mEMxSJhcSkvVxSfONhTrBqyIHdRp2vW6wHHzc9bzWID+n0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1CR+QH2QRjA3s8fhRSnMYrugfzzVYpsSu4bpcG0fP4=;
 b=axJrtm3+9oAS9F5CkW5hJ7VZPQCg2230TiKS/L9fyhsflgfasSkPaA03m5HzPjm03vSdWZC0mPjdl6GZCIOYHSjDhBvoiJz9kV6eeN/AgFgfHYXy3Hak0D7+3VCjyUOi3YH/pzFzQlmXAoEvNjS/w4AECLmLOhQ3PW/3JbAk0tLuk9D8aQCdxBF8OG0wJ2FuNoa+AWNiH5032NzAptF5F9tMKR8/w2lWTK7Wp6Wd0ygn7/OOIow54Gjc1IIheK9RaJbV60r7lQLIH+8U5kKcxLvv/Rikjb1NcAD3HgEwDAlszMSKEPArLpw/5BXChKFTKFh7FcekmQCurp+selpRhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4722cb01-2e0a-6a12-b398-0ddd024b50bd@suse.com>
Date: Tue, 8 Aug 2023 09:27:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] xen: change parameter name in monitor_domctl()
 declaration
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, federico.serafini@bugseng.com,
 tamas@tklengyel.com
References: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 21054775-db59-47ab-1d46-08db97e0ec99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	287e/WZ3Rd4lsywnxGdrrRZRceE1JjEN+wSa70zOhNGFwsTO+pM+3fi9jK5nHiVxmv2yd5HrTVtum2+ilFcwTbWiZlszXHLeJMYVp8xk0AorFguse6eIIZVuS1EPWLwEcKAN2WMzEXpx9nQLfhOuUVfhl0LtH/TPqduDDUUBuMsp7KtnTG2n/1OdRfYU7Sp1a3JzTx6VPTWvGRyDdjasODhNxbcMp/ChJ3XPPtEyxTOgaH1tR7/WTGyPVM8Zuzae5wHAoaq/xsC8WSTmsbyhuawn3MSBdCayjRZE7IjvZTcJdAFz3+O0A6wsZ8L/OUeo4ubJ7CsU2vhniJJjk4EzLPNFsvxpBFiiKPEysXzfKyXbI1K4RJGP9DMgDq0FNzLmWyKNauI8FAQU1Bersb5nqeGWrqgTmeJ1s3hnsjowTxV1bsVnyggKeROc0pN1w4z7OchYKlXLtkyQfgrQHWyyeCw+M/NnvldX/5IFilN0qj5u4ZDIRC0Y1Rv+y5MXaXWOAlAvNNT6SvkyjcydthloLPdQ7a2usaVkZ7OOwtTOjobQVCcTazHxfW7A+dOimShDXB2RCAJTzCMloIKmBpI4quGQnb9NGZM+HR3CDsMRgyAVetJ0iL0bIOUW9lcXqxpUMKe8xUBlhTFCiyyLuooxAp6iJrxyTv+j/Jn59rK4GXzw+ZK+dRpiKNK4bvQre9kxv1h4jf05z0rb+OqHSI6VUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(90021799007)(451199021)(1800799003)(186006)(90011799007)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(31696002)(4326008)(2906002)(6916009)(66476007)(41300700001)(66946007)(66556008)(316002)(8936002)(8676002)(478600001)(2616005)(6486002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3plSnRHTmJuR1pQcmNxNitTT0pnR0xpUE9aSFA3YnB3Z3Ria09NVSsxS1JU?=
 =?utf-8?B?T0hWWEhvakZsUWNrQ3hreFlMeURzMGxRNEZLL1FvbUZRMVBXOG5KVkh6d2J0?=
 =?utf-8?B?ODh3R1J1Y3VKS0VlcjhVWGlRUmFCclJWbCsvQXdxRFpRVXJsZ201NkVObnpy?=
 =?utf-8?B?bjFjalBXSmYxek90ZjkydkJJcVB0bjFSMldKZ2prbFZZcTdCQ2w4VUhBRFVD?=
 =?utf-8?B?SHd4WjZCc2hrV1paU0xsUDBZS3dHWFd5RzRudnZwemlRYzZRaEdKaHVMS1FB?=
 =?utf-8?B?d013cHh5MUplQ1BOamNZNWdoUjhqMmp6OHNmQVcvQVdJSTRkaFBLNmtlMFNa?=
 =?utf-8?B?NnNWeHVLeXhOWHd4M2paRElUR003SFh4alB4Yzdvb29XdHg4ajhraXh6M2Ni?=
 =?utf-8?B?QVRnU2NISXBrMjd0UmlBMXhCYlE0b1RoYjd5Z2I0T2ZLWk90RTZhRXZVMU5E?=
 =?utf-8?B?YTkyNyt5Ris5RkNWTFRsMHUraVhyRSt5eW04dVNMZk1RSTFmVDlqU25GMjds?=
 =?utf-8?B?RFZBL0JOUy83dFkxYWpYQk1SejVaeVU4R1p3ZEdlTnlVQnc1TjBZT2dxUHVQ?=
 =?utf-8?B?bjd5aU04d1lJZ1I1elFYOURVSFc3cU9hZXd3MkdFcWt0WHl6WXJscHRlS1RT?=
 =?utf-8?B?S2ZoeXdqL3VKM0lKRGtacjBZVGVhTTNlcTdieFB5MlBCOVpTSm5nTkdBcGZU?=
 =?utf-8?B?SkduU2w2QW5MMlJnanJnODhxTFpwY3lHRTdacnY5OUtGWVF0TnBsMFRVb2J2?=
 =?utf-8?B?VGVtY05sTHdqYUhYdzNGQ2JQeGoxN2IvSXN6enhSVE9nL1YvZjNRL2dJMjhX?=
 =?utf-8?B?aUZKS3JNaUhYajhveEMwOUdlZmhIczdPbjErVWU0ZWxmclhiN25xNkpIYThP?=
 =?utf-8?B?YXV2YzlJc1FiQ1RXZkFqdktVNDQ5MjZMNGh0YzE2V2dxTFhhbEtwN1gzbUtq?=
 =?utf-8?B?dGFzRlp2eWhrVXl6cVBBYXdpcG1iaUtsYXhpVXdpVjVhMzU2UEU1eGFGQnJT?=
 =?utf-8?B?cWo3VGJWSlRBTmN2RmJLYVVjUEJlK2djZVVnY2Zxdm9ndk1GbCsrSXFTU3Uz?=
 =?utf-8?B?a2dyeThUUVFaTGZhZksvRHp6SVBmdURycXArQmFSR21pUTVib05HN1hSU1hZ?=
 =?utf-8?B?bVVCRFdhc1IxdzV5OEtGdndYME9WZGtGeXNEbUJqV1RHNzZqYTljdzNpbjRk?=
 =?utf-8?B?Z2dUeWIrUEI2TlFjeFBuMFVVRktZVDRuWXBscFZBZXI4Vm8zTFFvUWJoTHNN?=
 =?utf-8?B?YzVIam9CK3FnaTFVZGUxSlR1amIyMGVmZmZJd3hpZzNZdkh0bnpxdFhweXMv?=
 =?utf-8?B?SmZwcm85dmc5YWR1Q2QramFtLzNnd1ZNWVVFUXE5Z0hQWjJwTGljTVBvKytV?=
 =?utf-8?B?SWdIWlcxbTBoeFU3TkQ5dXZCZENhbWdORXVGWTZsRFNtaEUrVEVwTkNjeEsr?=
 =?utf-8?B?ek9JNVQ2T1AzMlhvbU5VU0laYjU4RlNvdnZ0T1VmVnowU1BROWZiYnJycnNV?=
 =?utf-8?B?MHB5aTg2Y1ErMUdIZlVBcUNPSi92MmVxWUR2dEhBdUF6RGppd3V6TjhKK2p5?=
 =?utf-8?B?OWJTdzlPU2ZmY2tJK2ZmSFcrUzM2YWYrTUZjKzhOM2lGMFpHYytLb0Fyd1ZW?=
 =?utf-8?B?S2I2cjVIaHBtbnF3c0RydVcxVlJTVFgwUlQ2TSs3MXRPbXVOenM4NVlJcTFa?=
 =?utf-8?B?SVZTRmtCdG9pZkFvenM1ME9GUHpObzVvT2xqdGVHeWNYY0lrK0NPaVgxZlFt?=
 =?utf-8?B?bGhTR3ZCVTFFazlDRExEMkIvZWZNRkg3bWY5OUZCYUNVT2JkeE1kczR6a0NW?=
 =?utf-8?B?T1U1M296d1Q4dGdQaGFCTHNsdnFEYkhyUXZMdGtabjA3YVB6VS9YeFFEV0xH?=
 =?utf-8?B?ZUJCbERTN2tRSk1rcWc4eTR6WjlGYzRYbzA4Ung0SDFmL0RzR3d4dEFBYXBV?=
 =?utf-8?B?aDRTRS8zbnVNOFJ4UDBTQ3drQTBwa09nbHpZNk5uYkJyaTRQTkE3eWM2RWZr?=
 =?utf-8?B?bGQyQXZJQmZqbTZYaUQ4bGdXRWdkL2NzckNGY3N3NFhKMVcvOVY3NVgwNFJ1?=
 =?utf-8?B?UGF1MXI0Y2xudk85YVp6SkFBcTZEdzc3WHdmNHJ6YWc5RGFTUTNtT2hNc1VP?=
 =?utf-8?Q?4vwI0GiYqUN2BPpVkVGaNTQCH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21054775-db59-47ab-1d46-08db97e0ec99
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:27:30.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmnpoLTs5xJAvWDSywn+6pepvZ/82dBNBalzVrxDV5xIfEqqfUGa2ODGthNX5gqMEAEwFSwngw0FLe20B5OeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9199

On 04.08.2023 23:39, Stefano Stabellini wrote:
> Hi Tamas,
> 
> May I have your ack on this change?

I see you committed this, and there is an ack in the commit, but I can't
see any ack on list (incl when checking mail archives, to exclude an
issue with my mailbox).

Jan

> On Thu, 27 Jul 2023, Federico Serafini wrote:
>> Change parameter name in monitor_domctl() declaration for
>> consistency with the corresponding definition.
>> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
>> of an object or function shall use the same names and type qualifiers".
>>
>> No functional changes.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>>  xen/include/xen/monitor.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
>> index 6b17a93071..713d54f7c1 100644
>> --- a/xen/include/xen/monitor.h
>> +++ b/xen/include/xen/monitor.h
>> @@ -27,7 +27,7 @@
>>  struct domain;
>>  struct xen_domctl_monitor_op;
>>  
>> -int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *op);
>> +int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>>  void monitor_guest_request(void);
>>  
>>  int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
>> -- 
>> 2.34.1
>>
>>
> 


