Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120E5A101C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 14:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393381.632299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBkj-0003PO-6L; Thu, 25 Aug 2022 12:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393381.632299; Thu, 25 Aug 2022 12:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBkj-0003Mu-3e; Thu, 25 Aug 2022 12:14:29 +0000
Received: by outflank-mailman (input) for mailman id 393381;
 Thu, 25 Aug 2022 12:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRBkh-0003Mh-O1
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 12:14:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ea209e-246f-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 14:14:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4761.eurprd04.prod.outlook.com (2603:10a6:10:23::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 12:14:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 12:14:24 +0000
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
X-Inumbo-ID: 72ea209e-246f-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXKAH+1ExCvZIFRpLbJP7QWQaUTHrd1X7N9Eor36bskhyEvlaJb6v92Nd9TwRexK8OsUWiIWPkj7W2aYHVXGyd9hhHHt+XRHYhDqRK4+F2ttFdqD5aAOnCxb547ITXyTBBSN6xUdymAJaz5yNNcDhGMVkprcHg0FNu0eEtm24n2uy0PKhY3lucfseFftaoTdb8sxetjoq4JnTvRlJ9yZ84xCVUVVYOB545DArPr39GDqRjcprYB2TbswB/dvPBS8J0FnE8Zvcb7UQys0Gftg2DiFh5JfeEwv1EHl0YgjTMINQWpC4UyvZhcRiLZGV54GIHE4ECjcXLJK6I24TARmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AmoUbQ6pH/b51sOzjlF0OcJwOkkHcGX4j2xUzL2BQI=;
 b=FvOqMBvrb91W/v1c7zC8txe98Ud9WqT9bp5PjDqJNzAB7F0RhyX8sg7oXaWS07dP9sgG0yO+SF7ZH4tS+w3Lnu4qGmujOwBFpf7mk6siNDArAH1mylNB79vC+ehDh5+ZyRbsSERpBBunAHzb6iy2dH56sYIJUaK0/LbpniFOrGlUiI3b8v3QrWlsybKrjNAmvgi6Oxn4Ozj7baVzyb8JilsJHfc5bj9Q+8d0+CnnQxcEINGHkOgDVDHh1BNDztujqE+K9rWLbwF4I5kxQAbBK6dGj5LdIexgfo8cz9Fc7mBoLha4VXEOlYsTXY1EZz8BT5Vd4l1lAji6rpLZqrAGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AmoUbQ6pH/b51sOzjlF0OcJwOkkHcGX4j2xUzL2BQI=;
 b=f8KZvOtuH+5mffhFBCm3QAYzrUPNInn5ugJn/zJ/CRbO1LE01xRjbc9BtATFg7O2BjmWyo9i+EiqLAc6F5gbLCDxZCg0EpjuLp4Q5WNz7M+jpkJWegzd20KL1Cf5Ye0encwAvr2mzgRpTrsU/Vuu6lUY2/wsS2d1X1HBPVB7OpNFiUQzMt6dHscTSaRr+I3nhX5Pr2DXvWQL/nhuMrwiWqgG5OJWNpu6CYyOpR0s1Kya6d/i/irUYgj69EEX3QtJXT8rThYq2N9L1AEU7ARqIh+GX/iqkLEMRjGcssKOk5dUkz6dIJwfLA+yQj04x82B2Cohz3zrt3jSRTi0Iy435Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <392cae07-d8da-8ecf-4356-cd5c6f983629@suse.com>
Date: Thu, 25 Aug 2022 14:14:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 4/6] xen/x86: use arch_get_ram_range to get information
 from E820 map
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-5-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822025810.2240707-5-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d1b1df9-6b01-4e31-1eba-08da86935966
X-MS-TrafficTypeDiagnostic: DB7PR04MB4761:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YZD5Zki7JPEevc5HNj2fDtYVnEXTNOMobIOvpZA3DLMtN6BAoLu8g47nGwa41ZgF0P0eqcoalEQ3Seeyt7Odk1e0wYyvxXiH7IDXDDsc/5uYBWKGacmS7kPVqGDmSH+uRtls/Xg84El3uRker69wWXo+fGMWfTlAIidx++fWtzpdNvmVMRn8EKJKFhplnqNTMVihOC7Fr5b1CZweaGf5YxdIYArTpMTThYGtJ3vGsjg9aOlp3pC2v1EbZOadXd5gFOVgC5cXZD+Fia7xp1O+LqN4t4Q4NMCS1ix5B3HtQj1Wp8WlAGv6o+3s+rBsus5SugEngVe+9lob6ZMFl163y8ARhbVy+HuSmj1peK3P0ILnG5ewSEiGJ7xkATjnRMBlzNfx21KqhC9lMmZva2yMWUrwWeILR82rTd0WTdrDgDdlKgry+thKtaxlP/twvQouyPvjeWdfiNdIfUvC/q+ysH4fMoGg5wbN3D3a8M+hgkG44XHt8DrF2diKWHEcmHs6E8Lq0HFfxg0orf7zpt745ogzKPbDwxoLLG39hnPxpgdeD8qr+APK5sYqko9Ofh3vQkoR4qD/tNeSQz25Y+QtZcERmwmKYROfxfEr7qiT9eS1T8/VaHDA9S0fZcXAL5cU6k8gNeJ+sinkViO/q2OWVzCnB24NJAxFkzAeIRX+w/ZLDcAz8akZCwWIZqlhUJxoegOuK1cbj2siqyhC1drOakPG9PlDhuJ7lTeF5YHgLgRlpxj9GNSNGJeWwwgbx4T73KTKSwkEV0E+GlcrIlcq0QiOXtQxKH3o6JnOLo2UtJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(366004)(346002)(396003)(54906003)(8936002)(41300700001)(6916009)(36756003)(5660300002)(6486002)(31686004)(4326008)(478600001)(316002)(66946007)(66476007)(66556008)(8676002)(2616005)(6506007)(26005)(6512007)(53546011)(2906002)(86362001)(38100700002)(186003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk1wamhLNzZ5cW96MkEwS0JFSXUxRm9lTk41c0JGTHA5N3V3eG4wT1ovVm9I?=
 =?utf-8?B?emJzZnk0ZVJoU1pxR3hTKytqNkkwSitRck5nTUxlaUEzbjdjd1FDakNUZStO?=
 =?utf-8?B?M00rL2xaYm8rYjdiU2w4b2dzT3BNcGZxQllKRUhrU1VsU2ZHZDlHOS9mL3RL?=
 =?utf-8?B?UnBYV1hKbkRHL3kwTDdaZzBLUE1McXRPQVFreVVHMGhvb1ZFeWMvQVRpOGpN?=
 =?utf-8?B?ZERsWm1ERENNR0VleTI2THlFNHJUSmFPM0VHM1lDamlqZlVLdmE1c3BERzNZ?=
 =?utf-8?B?K2NyN1QyeHlYTDArd2JtditOUEFhaGpxU0J6azF6bjRWS3Y0bXhNU282Q3pX?=
 =?utf-8?B?Qkx5Rk91TWZObnAwM1I2N0Q2WGhZRy9wQWF5amVKcmMzUExnR25HVmozd3F1?=
 =?utf-8?B?OC83VnNaYzlvWkRvR1JoK3dZbWh3Tk1OVGFGa3dnREZVc3dvMGtyaFRmekx0?=
 =?utf-8?B?c2g2b0QrMG42cmN1d29SRlNYcjRBS3VnREk5R2VvcVp4WkJMNXhzT004SEhV?=
 =?utf-8?B?bG1pb0J1RThGa3NRSGs3b1RNbThZN1BmbUQxdGVheXZoQzVUUmMyKzF3R2s3?=
 =?utf-8?B?dlM1cFUxTzljZUtUMnQ0ODJ1T094T0pwRlRwMWNPUktuN0NsOEJXd2FxQVYz?=
 =?utf-8?B?K3NUeThwTlZsZVlldk56SlpOdElxMzBaTjZ0UUwxZ0w2czhEVloraXNVMXZx?=
 =?utf-8?B?ZXJOMnpMTGNJVWJualBVVVVPVEkvbkhEY0cvdFJ3ZkhXbG80Znd0SmsxQnVM?=
 =?utf-8?B?UVNhTEY5djBEOGdCbE9EeUcvOWZ4VythamlQZlJvWUVZR2RtUzNkSmNvYWNk?=
 =?utf-8?B?WmUvT21jd21keFk0cTFnMGhpQ1puNjNadnZSeExDSTZkTkxwaFBUZU5zS3ps?=
 =?utf-8?B?VGR5K0JwMEN2U1VoUjFMWlRoQnRreHlqTXBGaUJoUHF0WjFSemZJeCsxMWJY?=
 =?utf-8?B?c0wxY29GeGpFWFNwVzJaamdQT2IxSjNjSU1Cd3lVbmxUb2d1bWZFRE9jbW1p?=
 =?utf-8?B?RUttaGVIdHp3dlFPa01rdUpnNDJ1Q0pNZmZKRGtQTkVMZGpkYitOR1hnb25j?=
 =?utf-8?B?dnM0ZDMxOWZYT0Fmb0pEdW1aRmI5NlZWaUdYa2V1WTNHSHEyN0dkdUpGWWg5?=
 =?utf-8?B?NHE4MDBOTzhQU1Q0Rzk1N0ZRUG16Q0ZmcGd3V0Q4MTlPL1NkeGdVdWFHcUY2?=
 =?utf-8?B?Wnc3aXhVb2pBSGVCUE92aXNVaVY0cE1ZRG53QnhqZGlwN1hQUlBjY3NUSlpa?=
 =?utf-8?B?VkJhbkJrYXNERzAxT204bml1aHlBWitnMUtyUkc2VllGVWxpU0hac3Zmd3h1?=
 =?utf-8?B?U0VIeTZpRVRXZGU5ZjgzUUNjUWI5SzczSWNaTkliaTBLRWVOTnJUb2VkcElq?=
 =?utf-8?B?cTVMWVAwR0grZytlV1FOazk3Zk80WkV5R1JCbmVEWGNVRVRYUzVDMkRrNmJu?=
 =?utf-8?B?ZTFDSkZUVE94TDl4WnRaaU9CNGpDakFna3Q3K1lnRFY2WkVJbGUvaUVnd1R2?=
 =?utf-8?B?dk80anEyc3dOUG9mOU5Oc1B0d3hLQlJYblh0ckJOY3MxbzY0SEt5TEdDckZN?=
 =?utf-8?B?c2RJS2FXTnlDb1krNkdSU205ZElrS2dmZUJLV2JtOEZYcEdtY0hxOGE1Z1dZ?=
 =?utf-8?B?dHFwRmxCQzFTeFVLWXhXSEtRS1dOZ0t5dDBoVXNlUVJYNjkxenduRURTTSsx?=
 =?utf-8?B?eUE2d2V1RkRqQnkzdjd1TGJNYUY2TDJkZHlvU3ZQU05UQUlKT3pyMEZIMTRm?=
 =?utf-8?B?N2hPVHZXRlRxVk9oZzJRZ2tZSFA0VmdLU25MMGRrMnlDN0QxY2xrdlMyemhP?=
 =?utf-8?B?NGpLMytHQ0dLaTNXYzY4YTN3WC9QNXhjeHI0Q0tyS2h3b2xmZUwzNVBKK1hB?=
 =?utf-8?B?ODhCbjJ6cjdONUVqenNqUUlLenZOUnEwd3o2Kzk3MGdJckRvbXZubDBQRTRI?=
 =?utf-8?B?U0FCRXc4ajNsMm8yT1ZsR24rbjVGemRDemY3ZEhDNDBmWm1QaWZvRDBqa3Fi?=
 =?utf-8?B?aUJCSlkxWUhLcUJhUmllV3RMUzlCOFZuVmpJU1JDdU8xZTFUeXFDSENPVkll?=
 =?utf-8?B?NEphbVQxRmVvVHBYM3cwZFplNWU3NDB0UTg4aVVvSldZeE1NbE9uTDBrbE5K?=
 =?utf-8?Q?cA2uudc4D917TM3Rot8VyC79E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1b1df9-6b01-4e31-1eba-08da86935966
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:14:24.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6jyOfeFQ+cCgGMZ8VRrLf+1JOtnddZGeu3rWWyaZ7bgqvOaJ8V8/seeqwx4RBAZ2xWRRtPXEF0TyLI9RKY8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4761

On 22.08.2022 04:58, Wei Chen wrote:
> @@ -96,3 +97,27 @@ unsigned int __init arch_get_dma_bitsize(void)
>                   flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
>                   + PAGE_SHIFT, 32);
>  }
> +
> +/*
> + * This function provides the ability for caller to get one RAM entry
> + * from architectural memory map by index.
> + *
> + * This function will return zero if it can return a proper RAM entry.
> + * otherwise it will return -ENOENT for out of scope index, or return
> + * -EINVAL for non-RAM type memory entry.
> + *
> + * Note: the range is exclusive at the end, e.g. [start, end).
> + */
> +int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)

Since the comment is intended to apply to all architectures providing,
I think it should go with the declaration (once) rather than the
definition (at least one instance per arch).

> +{
> +    if ( idx >= e820.nr_map )
> +        return -ENOENT;
> +
> +    if ( e820.map[idx].type != E820_RAM )
> +        return -EINVAL;

EINVAL is so heavily (over)loaded that I'm inclined to ask to use e.g.
-ENODATA here.

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -428,18 +428,22 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>     Make sure the PXMs cover all memory. */
>  static int __init nodes_cover_memory(void)
>  {
> -	int i;
> +	unsigned int i;
>  
> -	for (i = 0; i < e820.nr_map; i++) {
> +	for (i = 0; ; i++) {
>  		int j, found;
>  		paddr_t start, end;
>  
> -		if (e820.map[i].type != E820_RAM) {
> +		/* Try to loop memory map from index 0 to end to get RAM ranges. */
> +		found = arch_get_ram_range(i, &start, &end);
> +
> +		/* Index relate entry is not RAM, skip it. */
> +		if (found == -EINVAL)
>  			continue;
> -		}
>  
> -		start = e820.map[i].addr;
> -		end = e820.map[i].addr + e820.map[i].size;
> +		/* Reach the end of arch's memory map */
> +		if (found == -ENOENT)
> +			break;

What if an arch returns a 3rd error indicator? The way you've written
it code below would assume success and use uninitialized data. I'd
like to suggest to only special-case -ENOENT and treat all other
errors the same. But of course the variable (re)used doesn't really
fit that:

		/* Reach the end of arch's memory map */
		if (found == -ENOENT)
			break;

		/* Index relate entry is not RAM, skip it. */
		if (found)
			continue;

because here really you mean "not found". Since in fact "found" would
want to be of "bool" type in the function, and "j" would want to be
"unsigned int" just like "i" is, I recommend introducing a new local
variable, e.g. "err".

Jan

>  		do {
>  			found = 0;

