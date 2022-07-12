Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B801C571924
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 13:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365627.595896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBESm-0000dN-AE; Tue, 12 Jul 2022 11:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365627.595896; Tue, 12 Jul 2022 11:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBESm-0000bR-5w; Tue, 12 Jul 2022 11:54:00 +0000
Received: by outflank-mailman (input) for mailman id 365627;
 Tue, 12 Jul 2022 11:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBESk-0000bL-KU
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 11:53:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f11b256-01d9-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 13:53:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5499.eurprd04.prod.outlook.com (2603:10a6:10:8b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 11:53:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 11:53:54 +0000
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
X-Inumbo-ID: 4f11b256-01d9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPbfYdhxewTuzkcdm0w6HkfOIS8+QyUMXppQ0w1mviK3M+oGQI5bEasNDtQBTeVEQTsq0rCfiyL8WY000jQVaEOzpsXvNGXT1atGI88IJ6OBGBJ5ugJfTqpV2vwHGc2QRRkYG1CRghKu/6Kb+i0foXWsuA543d8LAIurXKzzJgfqs/WZpaEdrgyXx2QuFAPuocEojEm6DuA2YV2eOgnsNNS6t+Ea/QlNGPvI8kJWhn73pUiwBSC0fyxibAGTYthKm063B4EjsyILiWOJizziVP726Kcp0h1BESOkUhVpE/uAkmykDnriGeJMSbFovA03fQNG0Pg2iFWtME4R8i+zpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ9M9gmzl8bQZRaKWfY14i6pKfIwrPi7ep9GBp2G5d4=;
 b=jXbBQo3Q44r92YX1Zxapie07meZO8/JXZF+x5BB0CWkc+kI2RZggGZsXmqAS0GfY/VZOR6s2pv47J7vVRZkZdiFdhiLc4wJpunU7AhzyOljUtYmrl/ESyePEf6XA4PedKnBTlDi5buRq6/25yNJQzohqFDVAQx9NYSE6URZJuAdry+Ptn7QGA9FcoFVe9KBq0xieJnf3elcsgnbEVwp38dAxjOydorY1AK/mUV6BH1W1dSMPkQ32tXp9dUCiMthkCzDshLAYbDtrZjqc10xJneyO35A4WwQ6fDgFFyi0Rh93jF9JsfGVHR+74BnVbgcXpwer0HJy5OKERia9JXMDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ9M9gmzl8bQZRaKWfY14i6pKfIwrPi7ep9GBp2G5d4=;
 b=VoOygXDENzLUvFY8F8La2GeamyH7ukqDHCBE6vrlnDskmcKjU8h57gJi4dGikf3WUs+o2Js/1NtTtThwoUTE89jTqSsxcMhHiEM4HmsNYvjDtEARQzYvt634dF89QpFjQbAfUAmOHHSMuOupmm32tjizF4M6jMQtR9FAaCmeG/Mp19DlX9UZkKn1WLjPaxrTYAPn1eE9clwwwHHBm0dEhCWN/S8WaK5GkXMo7vz0koWsDzMIE3UpdLdMZjoYWAD2keS09ejN32NPqZ6oFopxYj3EqS9uefaYwP51xPGPFR4Uokwyu6I8ieRqpLwrISZzzqhSujHYxjZ8MsnYG1Dn5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <115e36f9-fb73-9692-a6c6-35ad683805bd@suse.com>
Date: Tue, 12 Jul 2022 13:53:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05de8486-76d3-4c01-e5ee-08da63fd31ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB5499:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zJC3l63rHNRhTRKL4/obSFgQax6QkHQKChQ7hJ4lcVAm/eZHgyWLdj/nNzoVObk/y4qb8dGtrBAfi2hJa8SVhmC2VdQZbexAHUqlcz4b/V4GLdEfnBhaHD2pUNCqt109EPMZ3z/yA4t36iTlQwS/qiIadZ1VjFCJ8V6pFFbrnv3kmFDS+Anr3n24pmfWlxYu0sTrBd8v+IcKelGDsWq00JDvzPLH6KU5gwwrPggNaWZHqkh4YXizfDO+x1A6ApnFD0Ywq5rMYFptsPrvcTxskO1xFA5iEmvGiaylv9aBNuuH4sG0IqMQUS6cGPpYW4IPh099W8JfJeDtexuMzZy+KAZmf05/CzXJqPKTNBdk0/n2/8gEgvmDdRDNklLzUPzRrfrluGZ6JhUeD75kNr3bUemXESEzXzjJ8nAfacy1MMdwcJr++vSq2tJVP77P2o+LERhPxQJ/QmNvV2sPpZiVdVDY6wL8tRXSr4V3PWpBWr4BoFArpV/elD4QarE0k3YtfHBj1NmR4vW4hY7tmXHKGyXrWaZKqrw+b3TkGoqBugs6EWU1/gJnUgnaOQJ4tVvpoSFuzG2b2Ly0eh2bTOW7iptuS4D8tRtjudzh6rEHFCPLbi+ELlJ0bexxJ/XDN5GWa+9m8UcN6aPEP1J3jCmD8+APLa/wu0n/VtJrHVFNzRrhHoqo5GkdebA+zTf0s74yXH59escqPJF6jg3uO+9wmi561Slvmni2iYLFcDZZ5hw4c4l8ojK1KfURBZlQxPMd/08Db2i8q+u7q4fvkUPjmvdA5WDB3FQgnZ/RRIbx+Unz6jK8t+kQG4WaZ/v/s8OL7d01msTMqCQvmlxcPGQnTMfR/nKRJ68Jrra9UmPijyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(396003)(39860400002)(346002)(478600001)(83380400001)(36756003)(31696002)(316002)(86362001)(6486002)(54906003)(2616005)(41300700001)(53546011)(6506007)(66946007)(31686004)(4326008)(6512007)(6916009)(66476007)(15650500001)(66556008)(8936002)(8676002)(2906002)(38100700002)(186003)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFTZ1N5RXRtSWNNdEtob3dFdndEbEE3QysvNWdMZXdZUEpuOUwza0FDZUZr?=
 =?utf-8?B?UEFlYnZNQm1Qdnc2MnBhcmNaWWlYR1MyaWd6OUNYaEhKREZpMmp5ZU1hTGkv?=
 =?utf-8?B?MGlubmZlcHJON1NzeENZaTArdDFFM3FwSDY1QW11cGZVbE5GbUJKb3JyN0VY?=
 =?utf-8?B?bXRwcVBEWmhLTmRZMUFCMHYvNTZCbU9Ra1JSNnZxbjZQOXprTFVmeElOa090?=
 =?utf-8?B?aVVVTE01WURNdjlvdXNRTzNIMlpxUERxL3BDalJEanFISW1GQjYwNXE2RUlj?=
 =?utf-8?B?MFhsT20rTW0vVFMxL2xTZ0ZLN0NlOU9QTDc0K2xsUWlHYS9hVEZaeDhiODdX?=
 =?utf-8?B?YTduVzNsa3o4THVnV3gwcW92MU4zclViV3Y4UUVKRFh6U2NNeVVqelFRMDlR?=
 =?utf-8?B?L0tPRmJaNVBQQkNPUzRkbTA2UHIzUkpZWmZOa3B6RFcrQnJDR0FVU0NUK1Zm?=
 =?utf-8?B?SzRsazcyL3dZYWJ6cjRXNVArUVQrU253STc1SmxwL3czWEJTVWVrTGJWMThO?=
 =?utf-8?B?YTdZTHFqNkxGTlR6Qk1WWU1TNUFIcEpiOWZSeGQwU3dRMldBbWd6UDEzNGZW?=
 =?utf-8?B?TWlranpBUWpscllBb1V0dmZLd1dxbGtFSzZwQjNFQ1kxOTVweC9CbzJpSllq?=
 =?utf-8?B?VTFtS1IrZkRqV1ZxNEJiUHB0TFRiTWlGUTJGd2hiNXZWTSt2WDhweHh4czhh?=
 =?utf-8?B?N2crb0ZhOEcxZVFYRko5QiswUzkxK1hSS3AyZXlPZWFhbWltWDRUWVM1aDQr?=
 =?utf-8?B?anVZRHdodTYyRWdvb1N5NlVDaGozVWRKU3VKRXBBaGRmREl2QWVvMEV2WjFO?=
 =?utf-8?B?SUhGS2xEb1MzQTVXbnV5TWtPVmFLZERMbU8rM3FPbHg5T3hoVjFlcndFZTB5?=
 =?utf-8?B?Sk42K0pRbzhRL05MMmJrQzR3RnB1WjBjRlV6YU00SVF6Wmt1L0QzRHBIYkMx?=
 =?utf-8?B?bkpOQnJYMDJGT3FRRDdTUDVNZmtaQTVzdHdmbEtScDZDMnltTmZNOXY1VFkr?=
 =?utf-8?B?RzZlOVpvcHBxZjN5bmdZbnFZV1VqVmdlQXprc09rK1lVUnZqS1laU3c1WnVV?=
 =?utf-8?B?QXdtd1pEK3RYVzQvbzNtK2NNcEVHOGE0UnYvWWVBcktrcU1OQUZqckZwSVdY?=
 =?utf-8?B?NmVwT0ZxMFVqVStLTVIrWmpDMDMyZHhRcWdaakFidVd6bURsRWFkSktORyt6?=
 =?utf-8?B?dDhrbklzeHZKYklFQnp0VW0wUXluSTZuQnFNS0dKYTMwMWs2dHRQclJORk80?=
 =?utf-8?B?SmVKdzRYa2R4OU9SYXR1SENWamEybm8ySllCcFRVS25nUzQ1VEVLYkovWGR1?=
 =?utf-8?B?Y0pNS3lHc1F3OG5wS3htTFZuWnNVclRvclNEd2ZFeFRpVzJFK3BkT0JyeVBh?=
 =?utf-8?B?RGtRMXJwMDRqbStkeUlKVEVGRytRQ3c3RXpqMUd2UHdqNVBmaHBLY29DUjJ6?=
 =?utf-8?B?Y3NwajV2MzV6MEdiOXRhQUZtTVEzRk50Z05IOS9rVnQvRTNLYXZGMXE3QklW?=
 =?utf-8?B?d3pFSVdxczRjd0hqbW5QSzhwKzVlRDhlTFMwcVZVemZTZ3pDUjgyMWh2Sm1N?=
 =?utf-8?B?SkdJWjRZY1VGV29wZ2lXRFVOUmhEQS9BMUtKeXRzcy9kbERwU3R2bU94MGg1?=
 =?utf-8?B?bk8wTzlOOUd0bERybWpTdTNYT2EwcXNSTXVDcmQxYzloVXRqN0VQUHArOVdB?=
 =?utf-8?B?RExnQXMvVTk2WkFOdTFHZGVOTnU2Z0cwQUhCY0pnTmRPMjd0a09FMzZiQnE1?=
 =?utf-8?B?aFJZVjVrR1BiQ2RXQmpsWGw1eVRVYk4vZDhFMWZKWUx6bm1zOUE0QWd1QVoy?=
 =?utf-8?B?YXZlcWRiNWxiN05IUzMrSGtRRWJqRnpwVm83UStleHVqbWR4Y2tHYnZnVytw?=
 =?utf-8?B?NXB5MUdzaFhCSWM2a2QxeVZESmM0UTJQcHNseFhSa2duZ3RaM21md29lc2E4?=
 =?utf-8?B?K29YQTNrc0hYOWdnVFdMdTJ0K2dYQjh6eWxYYjJNMThBbUdHVis4bmNyZWJO?=
 =?utf-8?B?Zk1OR3J3NU1ETVJqa1Nsa24zRE43bkM1bjZ5OWsydlZwTTVWUkppL29YSFFL?=
 =?utf-8?B?ZXRmd0ZrWE1tZkRDL3hYUnZSUE11ZloxbkNrcGZSdlBWdFhOLzJXWHM4WWox?=
 =?utf-8?Q?aBB7I0X5pJ6aoPJZhHxWn/pk0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05de8486-76d3-4c01-e5ee-08da63fd31ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 11:53:54.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/rrVJKBNw1MnAWASaYSN6F7YPRERCVI/1cmSnzn5EoqYOovQ4Tt1JTi7a5xUH8ES9X+xiW+Hf3OAQ9o9WvorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5499

On 08.07.2022 16:54, Wei Chen wrote:
> x86 provides a mem_hotplug variable to maintain the memory hotplug
> end address. We want to move some codes from x86 to common, so that
> it can be reused by other architectures. But not all architectures
> have supported memory hotplug. So in this patch, we introduce this
> helper to replace mem_hotplug direct access in these codes. This
> will give the ability of stubbing this helper to those architectures
> without memory hotplug support.

What remains unclear to me is why Arm can't simply gain the necessary
variable. Sooner or later you'll want to support hotplug there anyway,
I suppose. Mechanically the change is fine. Albeit maybe "top" instead
of "boundary", and maybe also pass "node" even if x86 doesn't need it?

Jan

> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v1 -> v2:
> 1. Refine the commit message.
> 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
>    in the same patch that this patch will be used first time.
> 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
>    in this case, we can drop mem_hotplug_boundary.
> ---
>  xen/arch/x86/include/asm/mm.h | 6 ++++++
>  xen/arch/x86/srat.c           | 3 +--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 07b59c982b..b3dfbdb52b 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -476,6 +476,12 @@ static inline int get_page_and_type(struct page_info *page,
>  
>  extern paddr_t mem_hotplug;
>  
> +static inline void mem_hotplug_update_boundary(paddr_t end)
> +{
> +    if ( end > mem_hotplug )
> +        mem_hotplug = end;
> +}
> +
>  /******************************************************************************
>   * With shadow pagetables, the different kinds of address start
>   * to get get confusing.
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index b62a152911..f53431f5e8 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -418,8 +418,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  	memblk_nodeid[num_node_memblks] = node;
>  	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
>  		__set_bit(num_node_memblks, memblk_hotplug);
> -		if (end > mem_hotplug)
> -			mem_hotplug = end;
> +		mem_hotplug_update_boundary(end);
>  	}
>  	num_node_memblks++;
>  }


