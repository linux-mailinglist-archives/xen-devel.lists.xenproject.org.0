Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433E4E22E6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 10:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292817.497268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDy0-0001Zz-Mf; Mon, 21 Mar 2022 09:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292817.497268; Mon, 21 Mar 2022 09:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDy0-0001XT-Jf; Mon, 21 Mar 2022 09:04:44 +0000
Received: by outflank-mailman (input) for mailman id 292817;
 Mon, 21 Mar 2022 09:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWDxz-0001XN-5n
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 09:04:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1828dc2-a8f5-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 10:04:41 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-NxPxJy2DNqq1yObXOMrJeQ-1; Mon, 21 Mar 2022 10:04:39 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3514.eurprd04.prod.outlook.com (2603:10a6:7:83::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 09:04:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 09:04:37 +0000
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
X-Inumbo-ID: f1828dc2-a8f5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647853481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzqsUEraQzLbxAKczaPbXHLk1rU4oaB5qv+1d5hDDyU=;
	b=DiRYnfbYf1WpycSX0mTCs+jw4FvRlcvQn5Vo1G7zOqxG7oKfmdlbbLQVifMVPzPmuJr3kz
	M/5FVLs+eVe+CjZBK+mVSNFSPbQ47+7IPZFuosFa8iOQm/QK51id/6bXCJppXDljdNurZN
	hgIOS4+nHqWDZgi/djzURce8B3wzSXo=
X-MC-Unique: NxPxJy2DNqq1yObXOMrJeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leZK0PjkaO3rOqsvu5N1xOSXHxD8c+Df/Dgm5xqwDkNwOCdFpR55t14mBS642afCSh/dzGBiIip9qsezKrojz3trANQAFhNgq072/+vUr5S7CH6zI8YAFISCJwKpqUvlE2ANAyHi1cE8pI9aMyA/H9M6UDmP8uHmMsbS8rhSs4ujGFzwosPU/fRveXMzuAWP83ND+urUekmSCMF6dewPAnXLbw0UCTakofFPEMjUPXFGGgcI75kYKtfp2TfEvAhkwW4sQBBpa3d4cFBA8YcMJ03rx4eXZy0IPjrpakALuApyp1qERqjctM52kvu1xpMj+tnKSbl9UJz/ISUJHbiTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzqsUEraQzLbxAKczaPbXHLk1rU4oaB5qv+1d5hDDyU=;
 b=Ng1JfZb4K/Ppzh8BnK4U/g+LkjZlIS2jSWl1cfTL5i0Etl6kU/qCeqMLnqXor1aGM/U8Upfp71I1nH/peivjVCSUQlae1cvkxIlvyIhBZV+gdo1ZsP325I5mcK5b1tqUwVCZQgr/BNZuTCh7EhA/RceSyArCdQ2F8SgNokBZJeoaiVqkYteZl28iseeV4hJ04FgYivtTEYhtV0ZJOFkwFCSSTYvmYuB04fL2U7LmAm8Q8M++W9NrtoZTTZI/+WKNkpb1Z/qTyymHqijqH5XasAZat5XrU58zsaEpWE8vCPTh+F7HitTKV3zHBPMvqqTlMMuXzk9zDW8dMatLOBA2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14f16003-3ea7-d0e2-e209-3debfd89f34f@suse.com>
Date: Mon, 21 Mar 2022 10:04:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/6] arm/dom0less: assign dom0less guests to cpupools
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-6-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220318152541.7460-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1079eb42-985f-42b5-5c32-08da0b19d2e9
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3514:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3514D866BE3F1E1226C8F5F4B3169@HE1PR0402MB3514.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8C2ACdeTI1+acEOXXEEpD6bdtmjk5/xDQRdGFlpYuHTQb9vtuV+TNEBnkJq5AwiLzHzYn9PMm/b9Wq1N+/dluNqch6mujx1Q3qyyfW9QlR6zvzjiaHlkgmYqhPlHAoVM4xRXBEqIUDM/uNv4VoFPCDfJZPzHS/viW02FvR+Jk/TtiFzR/f5q+Wi/vrkeM4YD9FlrHFekQ+LRI48Vd5gzXe8kgnUpNuKgHct9KVsX9jQ21HK6y1xbzRD9DBkoelcklCSPnoTvYxWZFJg/Y8W7RvIoGsmhcMsxiT2Do3QhRn9g8yTR+KZDJnwqBmjNuNhU5tF+DBiQU1EVkHSKUq9B0U4MdZhtwt8U+ZNTPfwstm0nwTyV0ZzO0FlaWFfgpoWtLA1/9tugafOVkcU6IxQJ7bVSovWAwhdm6EceSGSReAE9GWg+ctFccnwq8I8tRq1rBKNoYRfEkW6gcxYk7p9SoDtmEYcrtjnWwaMhoiNeh5Czj/qyV7FA2dru/HCiALxPwHINiMPpa8jOJloGsGuzDTSMMa7sGoqy284zjJLgrky9MsM0TtE+a5sPdsePbkkxL/HhJd/U7Yy+OPmaSitZ3DYakjG6CEXwlqGgfppqn9YegGiFwXxS44v51i6rlN2EN5dE92WgND1+4lFuJEA4II5ixBhNrvZSnB3n09uHl0OotJ1zXNGvFvPil0eopv0/Vyhf0i/YzKQ26cwFiZ0QzFj+SnRUrCXo7vCsY2kQczcgmXN+uiJNV74RAWavbulJf7sZYE3/P4kYOksgFOqokw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2906002)(6506007)(6512007)(83380400001)(316002)(54906003)(6916009)(31686004)(36756003)(2616005)(38100700002)(26005)(4326008)(4744005)(86362001)(7416002)(31696002)(8676002)(6486002)(66476007)(66946007)(66556008)(5660300002)(186003)(8936002)(508600001)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1ZTUEdRSFZXWnVXbDVvSlhzUjhPakovb2s5aXlkTjE5MDU1UzBZc2JXVXo4?=
 =?utf-8?B?bG54RTF5ZlZ5MmxMcWl4OUc1cElIdmpoMytvSzF2M0NVeElpZlozMjBkME52?=
 =?utf-8?B?YmdNWnpFQUhuRHJuZzNmcmhCRExXemtHUzFuaEVXZjJYQzZtK3Nnc1lVS2Jt?=
 =?utf-8?B?Z0oyVmRhNGxhZ09hWG1IMDQ2OUZjSTR6L3o5dURmVXpmV2x6eVV1ZEd1TVlO?=
 =?utf-8?B?UmEzcWp5eUE3eExnWjk5V2FyOGNnU2p0R3MyU1RyeVFXUTFFb09jeE1WVTBX?=
 =?utf-8?B?UUtzVzF1RDdkL2ovVHpzU0J0TEd1U2lMcWFQMVRPZUM4YitqTll3TVJaVVd2?=
 =?utf-8?B?T1ZhdUQ2clRhSWhzYzdQNmY1SXZJUGkwcUpNQUpNZzg0UzRkMm0xNkREaVYz?=
 =?utf-8?B?cG5uTVRkbTBBNXRCZ09rVjM5U2ZzRnZwSXk3WlAxdDlGaHJBVTJQb1Y5OTlj?=
 =?utf-8?B?emt0aE1MbW5HdDg4bDdJRTVvd2pEVGdjQmEzOTc3elBvTU14MFBFWU94S2Nw?=
 =?utf-8?B?L3BySkM2SVVCSFJ6NVZESVhaRXB4d054eU4xc2swZy9SOW01RmlheEsyRVlp?=
 =?utf-8?B?WllKclAvMjJScEVYaHAzb0wyZ1dkblVsRk15R3NYVzQyNk1JaStqSUZJVnBP?=
 =?utf-8?B?UUJHbUl2YkNZWjVNVEJpOTFlbjBDU1hQYnN3YjlRcmhWRGJaL0NJTmpKOEpN?=
 =?utf-8?B?RUY4UThXL045NUpZYm9pUXlZTVBKZzUzUjFkbHo4bnJjQWlxWUdJOWxzTXZm?=
 =?utf-8?B?Z21XNVJiTjhwSFJqZ2M5MVFsVTVLOTF1NDFQeEdEd3ZZTjhnV1k0L052bW9u?=
 =?utf-8?B?TTl1OHVJQkh2emdveWs0eDc2c285Q0p3Mms3dmQ3Q0VTV3BDM2FDakVPa2Nt?=
 =?utf-8?B?SWZYOWswTU1kY1hKUlFiL3R2Y0M3L1N4MHd6OUtlekVBdDFwMGxuUVFuQXNV?=
 =?utf-8?B?bDRKZGhkNE1XTVZRZWhnaXVBeVh1VFhaSnRxRTQzakFXblFzbzN3L2RCRE5n?=
 =?utf-8?B?SnBrSUVJamdEL2djTEdia05VNDRKZlJrcjFzUUF5cW1UZ010WVRYdW5YQlFQ?=
 =?utf-8?B?Vk1PWGl5NkRoNnM4ZkJLbEYrUTdtdVZLeHZkdUt2bVcvQnlFdVBiWjhoRWpy?=
 =?utf-8?B?dXFPR3dtMUl0MzJGc2FwcUplb0s3WGhEZlBYcDhwQ2h3dnNodnlCd3UvVmhM?=
 =?utf-8?B?L1RvVmFEUVFacEYydDY2NzZ4RktoTUViOE54byt6T0I3Z241bEFWWGU2OWlY?=
 =?utf-8?B?cHZkTndxbmZMTWc3NmtsdExyamVhb0N3VzA1eXVoRWZtTElBSExneVF2emRI?=
 =?utf-8?B?YU5ocFdRY0V4cnRVZFRiSEtjYVJOM2JMbUdtUWN1QnE1cEJ5eHc4Umg5RW40?=
 =?utf-8?B?RlRUeTNBWTVSRkVYcHNnY3BqbVVwb3FnZDh1WnBXWjRPR1Z3aFFTVXZoZW9D?=
 =?utf-8?B?UGFES2gyNlQ1cFgva3c3K2xUZ204cUtpN3hRY01CNGd2WWgzZnI1N21oUDlw?=
 =?utf-8?B?TDhsVWRMS0RCRFdzeXBiTENjZFZubERLU1BiN1YyL29QRSsyeWxlcUxGMlRq?=
 =?utf-8?B?N1R1czZidytTLzIxWldSa29MbXVtejhKTlBSS09ESER2cEU2NG5wbitxQldQ?=
 =?utf-8?B?Y1pURkQwUHdpVFBodkd5Q0YyckkraDBkdjVFUFlqZHJVakRUcTRaZjVSNnph?=
 =?utf-8?B?aTNCUUF4WHMrelBUQm9sVFIxbEhJY3V1RWVOWERiejB0elFhbzZHdGN5WEEw?=
 =?utf-8?B?bmNkSXVXRGM0YVdDZ05FaFNHZEhadzRzUjZJeHRlNmtuNXpRQnRiVWJqcFhu?=
 =?utf-8?B?dnJlTitEdExISlZCRFRRc1hUWkdLa3EwaTV2Yjl4Sy8vdXJMalJyblNSSFA1?=
 =?utf-8?B?Z2g2OUxBUmJ0T01OWnB0QmhSNE5XdFkxY2tTdGxmSDJEOVA3ZXVLVzdmWTQ2?=
 =?utf-8?Q?cF6R1N+EFFjvkVfqWBbUltRJyGJ/03tj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1079eb42-985f-42b5-5c32-08da0b19d2e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:04:36.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Zyn+Kxc1yJCNNNstdprG5MOTuZQ/Rf9LCvj2fsB1Nmby5D13JlqLETTNGFtx+xFQd19CM2oQ9m32uFELgojHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3514

On 18.03.2022 16:25, Luca Fancellu wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1182,6 +1182,7 @@ unsigned int btcpupools_get_cpupool_id(unsigned int cpu);
>  
>  #ifdef CONFIG_HAS_DEVICE_TREE
>  void btcpupools_dtb_parse(void);
> +int btcpupools_get_domain_pool_id(const struct dt_device_node *node);
>  #else
>  static inline void btcpupools_dtb_parse(void) {}
>  #endif
> @@ -1193,6 +1194,14 @@ static inline unsigned int btcpupools_get_cpupool_id(unsigned int cpu)
>  {
>      return 0;
>  }
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +static inline int
> +btcpupools_get_domain_pool_id(const struct dt_device_node *node)
> +{
> +    return 0;
> +}
> +#endif

Was this perhaps meant to go inside the #else visible in the context of
the earlier hunk? It's odd in any event that you have #ifdef twice, not
once #ifdef and once #ifndef.

Jan


