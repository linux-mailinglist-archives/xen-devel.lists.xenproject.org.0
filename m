Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D1A4892B5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 08:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255205.437306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6pUE-0003sy-Km; Mon, 10 Jan 2022 07:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255205.437306; Mon, 10 Jan 2022 07:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6pUE-0003r7-GP; Mon, 10 Jan 2022 07:53:02 +0000
Received: by outflank-mailman (input) for mailman id 255205;
 Mon, 10 Jan 2022 07:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6pUC-0003r1-LZ
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 07:53:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 536e7b4f-71ea-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 08:52:58 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-xDJSBpFHOte-GK_6evwHXA-1; Mon, 10 Jan 2022 08:52:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 07:52:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 07:52:55 +0000
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
X-Inumbo-ID: 536e7b4f-71ea-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641801177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVxBFdh4/+pAhvi37FyS/Afmf7oZKerIuZhj4V0JYuk=;
	b=X2bILDwpIpbjGFyVgo37ZdG5KejtTbN3oNIbRzRdcIwhGA9F5L4GEhXIXV0X82xRwtnpLG
	rFWjCurgBoV+quVTCwJ2g5hmNSgvJo4EoAOF99OIB5VUwRkHZkO69KJ3ixGq95zkWHokjr
	kYdkplQnSgJ7fNttmDgEHina/VZ+KP4=
X-MC-Unique: xDJSBpFHOte-GK_6evwHXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDkfvWj7tJ0HRjWJjL7uR5YFutQcHqS3Jxp1MR3EoL3y54as3E22tcF6UCc9QJxJDSZf9n6QWkHgxtr9GcFZjdsx6KVL9BdBJr4ITEv7dOzYDJ0JttV6NecmrsKOC9NQnYWCMFDCARTj+9aWurmuEkCbAupzXgYUfr6aRDXGTl0afHBIki+Wo43UsmPEVz8B3Qo+1hq56DrzMnajr1vT2Nt+kZNF/0EYw9d+7HTG5LYADTldW2AfDksR8FdklvKbDEXgQLE4dNweIFzCMoHZQ1sHx3m091N3cImuK+gtiu5V9632qEE9ydRLsonshURTFT3wYZS6gfL3atUsh7yV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVxBFdh4/+pAhvi37FyS/Afmf7oZKerIuZhj4V0JYuk=;
 b=cnXZx5dOXoq2aSCyWKgNdiGa7x2PBUqEYeZY9+YGUG7Of3Au0C/bWYMl4YQa8OsN63bq1wyUXiue5mKd/MPf+DRdDpozeMyZX7GhOykvYrMpOwIQblhHppF2t274bF0+b2oNjHhfA5x6580TKPaimvYRnPlbJuiIp8Pr6nH4ClhhzMG8sMNJGkqnpVk0uAAdwiimot9llbXxJRj6NIZdHuHH4eAIIhvR2+tcprI/D6KMtFL0RvjilrIvJsVmMWuADE52/ySHjEKcQSLoy/EBGDHQfGAQl7pFbk4iPaqCWdaBVwwMKoSrC6yya4dRX+vPiOBvkX5gielT97vldSYDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3b5ada4-a396-719d-79e9-6cae44b949e0@suse.com>
Date: Mon, 10 Jan 2022 08:52:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: alexander.rossa@ncr.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
In-Reply-To: <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 927aeac0-5cc3-44f5-9250-08d9d40e35fa
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24454BBDCEE7649B0AA5D253B3509@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	35XNOUilchfGwIMuq+W1UaH/w7JseMbXrKx3WLZw259rv0tE5/+MuV8V09XmaJkDVFyk9p6/MwbztXYE6ywMx7PzoP/X973Uh0UjW6vtePbp8GY30KaU6g53qFq4OSmAORaLZmxpKwJ5Nji18i2l4k2e4XJEYNUi4LTTY3AmPNqFTAWmeGxxJ8L6tG0j3VrHKDzPBnr8ZJRoMEKEsbeoE5j0JD4WKvKd1MuhKY2Ubh++VS9RXUOvH2FKIpY/P8PiI7GWpMSCAQFPPHgAwvRiQQ9MOGkiaAtPHasC00xQXPkUUmeATUMpT9exvP2WW3MKdQGeMOFJHnG5L19vD/VnMUE77mW1INpXayFbLLhNZoJgFBxiKbD3mDiaAyFZjt17TGCtVTKB3jq7ba0m8ElP1PfC8X8FusHhOXCHpkSRk/iB0kzbIYmbDRVy7I2FVzGffuuLrpZUbrH6sdbCb9mIhXazzH721RaFumXOnnpCNC+fEM4hC3yjBbt/x0vp/AFsKX3Eqn3tWOxeOUJ6QJwkXdUVwAqyR/Bqc/gn+jHvVSBaRhjWBePom3MwekhO7RlVBSATc3UiLwFbi96uChqyLW/35jU67FIVd/EJotMkgx2DHrHXSLp8TkZOnATdEkjj08Df2AxMl4yxgmJvddYwhiUO74b3KSp6gEXnWoc8k/ihvrA39Ba5eD3kJAJBlJq81912LHqb4+cBJGKHFCeCw+IXJ0xlV/ttsxp70Hc3Qu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(8936002)(36756003)(6512007)(6506007)(53546011)(2906002)(66556008)(66946007)(66476007)(31686004)(31696002)(4326008)(38100700002)(8676002)(2616005)(508600001)(6916009)(26005)(83380400001)(6486002)(86362001)(54906003)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGcyYXhxL0FjKzVxSTcrVFNLOEE3cmJHeEt2Zk5DSVhGcUlZMHVIR3dLQzN4?=
 =?utf-8?B?VmtIbXg3MDdoTk1aWG03SWRDaURCb3dUY01pMCtDYmx1Q05KOUNZdjNLTGxL?=
 =?utf-8?B?eGRENjlPcDc1UDE2UllJdUs1SUo0VDA0cGdCN3FRb0srcWdUSjBXQm9xVGRT?=
 =?utf-8?B?WHNCa0g0QmpaQkxOdyt6OFRvdG9OdWhJV3V2NjJRb0FiS1QxZzIyb3IrdzdC?=
 =?utf-8?B?QnJibXlJaUZsZWkwNVZKaGJOTlNMOGdvTTdrbXNxOTdHbFh1S1k2SktqTUQr?=
 =?utf-8?B?Ums3Z3A0ZERYRzZDNnE5bStaM2ZhS0dxTFJBcDRadUxUSHpoWHBpYUNBTmw3?=
 =?utf-8?B?QWlKUERXZHVwV3NzN0l0cUR1N09JL0htcm9aekl6alZSalhoeXlxcmNnQTk1?=
 =?utf-8?B?R3hpYytEcFlKMjBvU0RYZFhqNHVtVFdhTDZqVXloTUlQbm5GSk9NZlkxU2ps?=
 =?utf-8?B?c29jSTQyWHZFMkYzejVtbnJQVklKb1JZNlo0MzlZZWpVQll0eWlCN2NHRitU?=
 =?utf-8?B?WEVsOGlZWG9tOTFEVVVmKzk0RXlkamVkZUFHdkRReTFDUXRQSkVRY1k5Wngy?=
 =?utf-8?B?cFZzTVozMGhCTHhsaW9meCthMGlVdnA2UmJxanlNOWNoUXFOS283Q0lBa2dh?=
 =?utf-8?B?dXZyRXY1VzlKOVlCdXRyNG4wTXgzZXBqRkJBY3dYYVc3amx3bTZ2U1RLcjhU?=
 =?utf-8?B?aDRYSHJia2VaUjJmVWpkeXgwTUcveCtReitEdHZtVnozczBHMnBIQnRQdXRn?=
 =?utf-8?B?RXppL05xNmJKOEMzVXgwbzNaQTVEeUx0b3RMMW5hcHFZRmJhN1pQM3l5dGxa?=
 =?utf-8?B?S203cUZwTFExL0tqSHBvTGlhVDc4dW9KODZqb2JKSU9BL0JkT0ZXdjBzaTdi?=
 =?utf-8?B?WktUVnJQRStBajdPQ2dabkhrL2VFYWdBVEdnODRxRGQvTmtTQkdtV1JrQjU5?=
 =?utf-8?B?RVQyUUpwRnZuWS85bXZHc1ZIMytoc2RFWW1JOVcwQ2RXVGZtVFM4UzR1Ui9R?=
 =?utf-8?B?bkpBbGZ3aVBTbjJuUGdBMWpGUWVmUkRNdkJIZXIvb3k2S3BNQzc2VmVodlhI?=
 =?utf-8?B?aWtTWStySlVmeVdQUksvNzNoa3JkemNWbFN2VEFsMEEvemdTMk8rd3plYy9p?=
 =?utf-8?B?d3dyZHlPRytydmJUTmcwUEZya2pVYzZlYmpjNFJSSGVGSDQ1VVVMOFphdHFC?=
 =?utf-8?B?Kzk3U21LVmM5U01NRGNURFNRTTliYm5Dc01rUW1MbW5kakE0VXRvT2VHY0Nu?=
 =?utf-8?B?cThQakh0MWM5dFNkTnp6aW5LU3NRMVpEVUkyNEJwdnY3ZXhGZnhUUzBKRmZk?=
 =?utf-8?B?YjVrQmlvTE1DUUhiSUZ6TitnZmg1WW45N0k3T1N4K3BrQysrOCtxN2pBRzRI?=
 =?utf-8?B?VjQzOWhFVGthNktzVHJUcjl0Ymo4UlBEanIwUWIvdldlQm95SXlZNGRHMFpP?=
 =?utf-8?B?T2xJdGlkWFZjODdqTk1PMHFqWHdCa0RoOXVuVi85bFFxcHJBaHJRaFRYRWZV?=
 =?utf-8?B?WUtlNjFlcndDcmw1VUE5UkI0YnRuRmdzTmxIdHNnTWp1UEFKT3dSMWhqN2VV?=
 =?utf-8?B?QkFlZGdGdHhRNmY0TGFzRkZRYzN6bUQvRFFjb3d1cnU2eEU4OXBrRGw5L2FY?=
 =?utf-8?B?Zm5BRUovWWUvaVJsQWZMcWpUZFpVb2JsUHJlV29jL3lkOENCNmx4bVA5cXN1?=
 =?utf-8?B?ekxKdGxKVXNUamN5VXRiNjdqQ1VPcHhGTzNkLzBYeFBVWWtQc0xldjVLL2x0?=
 =?utf-8?B?ajBEVnFILzF2ZDhLRGhRcjBXNEpYR3F1VUljYXlvT1MzWmhZeWpnZkFCWENL?=
 =?utf-8?B?ZXVCTU9TNlBkN1FWQWIxZUx4d2JnNm8vajdDOXQyMElPMTVpSExsYTI2a2pS?=
 =?utf-8?B?VDJNWnVaTitId21rQm52REowTjROQlBpZEQ2alk1K1ZxSFk1bEcwWXBLTzQz?=
 =?utf-8?B?NWZHbFVlc1NBMGRWSm1KcEtGYTR5cktmNHE4RGRoRFpOM3JNRlFoTHErcmtq?=
 =?utf-8?B?bEQ3VFpJU284aW43bitIUXR0eG5VREV1UGNlcjZmSXgrVmliYkUyZWxlS3VQ?=
 =?utf-8?B?R2ozVXhSSk5tNGNaTG05bEM2eWZ0eW1TS0Z1TE80U3hzRmpaUklaQWJHQlNE?=
 =?utf-8?B?bXl4SnR6cHNLNjA3WUsrSGJrWTMzcEdOUnpGbEFUTENpeHRKa054dWN0VXU0?=
 =?utf-8?Q?Ooui36x/3bmcyDDKAhm2+q4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927aeac0-5cc3-44f5-9250-08d9d40e35fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 07:52:55.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOaMtG4dTOa2ZSCT1p65nqz+T1qzq/kYiRxN79TTGTZwifqeH4vwzEp+60oTsuwgtAO5DbudLpaizNcEWi6DzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 07.01.2022 12:39, Jan Beulich wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
>  
>  static int64_t __init init_hpet(struct platform_timesource *pts)
>  {
> -    uint64_t hpet_rate, start;
> +    uint64_t hpet_rate, start, expired;
>      uint32_t count, target;
> +unsigned int i;//temp
>  
>      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
>           cpuidle_using_deep_cstate() )
> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>  
>      pts->frequency = hpet_rate;
>  
> +for(i = 0; i < 16; ++i) {//temp
>      count = hpet_read32(HPET_COUNTER);
>      start = rdtsc_ordered();
>      target = count + CALIBRATE_VALUE(hpet_rate);
>      if ( target < count )
>          while ( hpet_read32(HPET_COUNTER) >= count )
>              continue;
> -    while ( hpet_read32(HPET_COUNTER) < target )
> +    while ( (count = hpet_read32(HPET_COUNTER)) < target )
>          continue;

Unlike I first thought but matching my earlier reply, this only reduces
the likelihood of encountering an issue. In particular, a long-duration
event ahead of the final HPET read above would be covered, but ...

> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
> +    expired = rdtsc_ordered() - start;

... such an event occurring between the final HPET read and the TSC
read would still be an issue. So far I've only been able to think of an
ugly way to further reduce likelihood for this window, but besides that
neither being neat nor excluding the possibility altogether, I have to
point out that we have the same issue in a number of other places:
Back-to-back reads of platform timer and TSC are assumed to happen
close together elsewhere as well.

Cc-ing other x86 maintainers to see whether they have any helpful
thoughts ...

Jan


