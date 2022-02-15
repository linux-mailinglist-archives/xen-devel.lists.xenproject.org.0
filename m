Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868914B73EF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273456.468653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK15C-0003fy-KV; Tue, 15 Feb 2022 16:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273456.468653; Tue, 15 Feb 2022 16:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK15C-0003cq-Gp; Tue, 15 Feb 2022 16:53:42 +0000
Received: by outflank-mailman (input) for mailman id 273456;
 Tue, 15 Feb 2022 16:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nK15A-0003ck-Nj
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:53:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d32d0b97-8e7f-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 17:53:39 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-Axr6iLwCN3GN8gERyOydHw-1; Tue, 15 Feb 2022 17:53:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3906.eurprd04.prod.outlook.com (2603:10a6:208:e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 16:53:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 16:53:37 +0000
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
X-Inumbo-ID: d32d0b97-8e7f-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644944019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8F0MgvW7RpJXh1waPLI80VrIznjq+BPIlelFky06mU=;
	b=WlTPlTtY9PQlOFDIO4syA7wR+SeORec+DC/brHCFeIvOHGeZSOcqy23IvPmI1D3GSrhngF
	bjaIdDDEXoICH/m2X5NRAb22n4ZqPSK8HILRORuyWEQeS0XG0HdrKBdPzGKknhhK+lFO6O
	RH8SOhSyZroAocmJC1khX9WDgAo5DZM=
X-MC-Unique: Axr6iLwCN3GN8gERyOydHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVZlorzwaXExJYQ6AKnQujOVqjdkpiNsdNi++avTUAWLxKHqK9WtYAwIuWsIR0kp8NESl6me90eIbm25U8JspSQQlhl4BMcSzbL37QSjJ0tnrG8tM2rNNq6bfO6nv+INsAteG1gI0YZKCYsai69daI1N/YAKjvm+D1iYKuRZSfpkjepWKAhXY7CACpuMEn+pYWqgBuOaEPOMOozi80vTUl6Yw3rvCTqmdTLEIz0ZPR/8PinEoO+m3Un7ZsG8fCEqF8XLyELrYzC2DVczLJuWF6ch9F/eei9BtBY7573evzJf5OrxLcE9DuIxJv4+ToleLqqf5ljFBWEPZRvL4xxyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8F0MgvW7RpJXh1waPLI80VrIznjq+BPIlelFky06mU=;
 b=nO1WrzzaGiYxfEF29OskjXxhuRNOmZAsKopYJxj5oLKCtRduPehJiXls7PP8bNH7+rmdomyj+qLtMeyEmHrgMSRwLq0Q0Sicjg9mKwj2zbmu4O/UpcOrS916fTwBaNTxXnh9bF8leNXBtRL6heu4IRFw5shivImo7GA5dAwWcs7QDufP4bsF5RpeVgxZmxBCqxryFNZI3ulGPdVbmCfNmHsu0X8Pohw2RrGrXiOktJRQY6GR4B+T5XutvS9QveXldQGJlOU97LVdr2J4MMfkWZNLej5E2l+TIQW4zI/BJBCCEwD9z/KlZfgSEdtJJ/lLQxnXSP7QIAWwlmcv5p6zMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0eede8ae-c2a2-cc87-d4cd-47ceffd4e488@suse.com>
Date: Tue, 15 Feb 2022 17:53:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 69/70] x86/efi: Disable CET-IBT around Runtime Services
 calls
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-70-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-70-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13f71bfd-4db8-47a4-1d5a-08d9f0a3b5dc
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3906:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB39062304FA2DB17A30B09F18B3349@AM0PR0402MB3906.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PlYKTWV+H4Bc5qfZYx7nPLk7R7QQbER1sEGPQbpCa9NeRvaYzCJgKXUYd1Rh3gmhyRIIFb6KzUakZGTa4JsTo4HrJY2uu/Qh5RCbd9Ul9jjbHhFE+X5K36PSdMd+r0wlxuw37c1KE/zQPNnpgpgUrHTQNcATeUEeAZcN17Z+PK9XvOwCyvHNaQvfUaygPL5p8NNUX42RFmb8JVY67yqlisFmh2sRgUQL88RipCyTZ8F506x4Ge1JPjwp6XFpWa29Yoq8+IjPfmUYIvwsgKGAygYdpg7/eZDORnOweoBZ3LzQAPzN7EraCW3O8HGb5e8ldLROgvqR/Yex1W4c4g8IQ/5fC6UfJBaFA96zqrwS7Nd789YFAJOfni4qSiGH7FYcWZ+Ze1s+rhVD2aITqRNc9N7r7RNS467q1m2NTCm/Y6XTfeYAmLYZ3Lc3mfXi/xW68XDsKa++A20J3aRst/HpwnBMBd/AmPKTlur+V9FdTbttafHAy1e3fMIx03TKJl25CAGazW4C5HIyamiyv632Z4EJd3lJEHqj4JQHYTnvTCU4JwO9SyWzYV+o4QX/uy5FbKiEZ4zYHAAT9Meo6Wxs4uVsEFOf73YEnfn8F4FPcAuAFgQOPY6c8ct1U5gmVZUTaWAKIc/G+14Pn2/Ga7wGTEMy7BTjf1XP/1roGrJT+91yebi0R4ZIo3jAMCLC/tUNuoeXSY4FuKPxv9qbF7AUau4lB3qj0a+tp0nhxxY4MUnbVEemsCws5NckkTCNnpGd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(186003)(26005)(6506007)(508600001)(2616005)(66946007)(5660300002)(54906003)(38100700002)(4744005)(6916009)(31686004)(6486002)(8936002)(66476007)(36756003)(53546011)(31696002)(316002)(2906002)(86362001)(8676002)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHNWRzVPL2NlTUxjZm8wUXovU1V2YnluVDdaWGVtejhHcFcvR1hXSU1uVHVX?=
 =?utf-8?B?OEliM0JrMG52d0Z6T0tIMnZBTTJDQU9uS3lZdCt1N1lKVTdzTk5JekVYdDVK?=
 =?utf-8?B?UnhLTnJ4cnhNWVR2YnFIZC9MMTZPZkpoeXRYQjg0UE9YUnRoR0F2d3VDTTVU?=
 =?utf-8?B?cUVlWXJiS2V6ZDJoRnlpMmZiYjRSUDZYV1RmTG1aaVp4cUlXdTgxa29VS3BH?=
 =?utf-8?B?Z0lnVmhDR3p6OFVFQkdqSHFQNVdISlNaSmVPcGNXdWpqd1lmR3B3d3lvYkUx?=
 =?utf-8?B?d2g0djFMRXBPLzBzejk3OGFzanozYVFhSHdxTm5VM0tvY0tiSUpFZWlSa1Z0?=
 =?utf-8?B?TFZYdWtrdk42N08raFRZZFRvQTQzSllNTjJLUzdyTU5WcnpCNnNKMlJIb1hB?=
 =?utf-8?B?WW4vdXhSWUtNUnJHMkx2OTBRRm5KNzNIYTZvSGxFSE9zTVNQTXdGL05QWlJX?=
 =?utf-8?B?T21aQTdhdnZ6VzVIWUpSMDBXUStZeEdSTGxrTGdPT2tzekIzZGNBenBvR1Fy?=
 =?utf-8?B?c2MwbUZBYStlTDQ4VGt0TFE1d201cytkMndBN1pnK3h5a1pPNmpEQTMxOFpV?=
 =?utf-8?B?OEFLQTNXMzJXQmQvZTVvM25tU1B4OHhVZEtlUmd3WC85TGZYQlkyTzRTbDlk?=
 =?utf-8?B?a0p5a1QzSjZndlpZai83cjIwTlpqTzBpV1lkQytCWlZXK0dmRVpRdWFGQW9y?=
 =?utf-8?B?amRwYllQTnNhUk41V2hsR3V1cU53UkdENEpMZlBFOFpxWks4QUZ1V0V1NWU1?=
 =?utf-8?B?WGdJWkduUm1NUTRkbVZmY1F4VlBZMHNEaHlWOFp2OXZHbzNHbExwaGNQWkNV?=
 =?utf-8?B?bk5EVkthNWtlUzJ3a0wzUldmWXRabW1OeFN4YzVMMVR0Z1ZNVUxDZzZDdEVx?=
 =?utf-8?B?U2xPUnZmMFBKZTVUZFk5RVNCbVNIVmwyK0tMWDFNaWZpV2o5UGFYYlh6VWVY?=
 =?utf-8?B?dXdMdk9oMnZ2d2lmeXdWN0owVnVTTUZtRCt0WkpXVDdudlhTSmMrTUZoNHhv?=
 =?utf-8?B?dXA0bEFOYmJtTTlyeC9YR0doV1pjci94YjlNYkIxRDNiUTBZcmpZR0sycWl5?=
 =?utf-8?B?UDhJUGV3UXRZRmFVczFFdDlOV2U2SzNuK2tjbElMZlMvWitMM0c5ZFZWOVl1?=
 =?utf-8?B?VGxZWlBvSExWdGd4aGlqa1JWa3RKZzdOZXp4UkdNY3pYV0lEWFc2VkFpU1V3?=
 =?utf-8?B?QUxpZFBKTUNpVHhjQys2ZmVIMko1TFZsU0tyamg0cXVBK1FTUUNLNUxaRk43?=
 =?utf-8?B?RWxQVm1uLzRFOWZwSUQ0bmZmS1hsRVZVU1BaY3ZyT2V2eEZQaVVhK3lPTmdP?=
 =?utf-8?B?SDZtTk1ObEE5bDZZd1ZmUmhFTzJqVVF2cmFtazkxYUxiMG5IYlZuRGZDaDd6?=
 =?utf-8?B?WFBJRStjK2dndVRpTHhTbEU0cUFQaklJMTB4bVVncTZUenFiUkNQZTJFbEI1?=
 =?utf-8?B?b2pFS1hVU2pVcmlmVGJEYVI4bzRISjVSMnEwT3VSNHpWRm5oZS9tQmhhVjRj?=
 =?utf-8?B?d2pXQ1ZKamxESVh6L0oxbjdMU0paMVE5NEFMODV2TjRrWlpCYUFGazRpeVM5?=
 =?utf-8?B?a0twUUNYKzJjM2RZVGcrTjQ1NlZTVXFHQ0hKUGE5WU9JN2twZitOU3FoSUZq?=
 =?utf-8?B?OXVYNytSRjA3cjJaMHlodlpaYXpJMnZhS3lLNTEwVmJCM0FlSTRXZHVVYTFK?=
 =?utf-8?B?UEVVOFRFWURsdGpzYWl0NlFOc1dIZ0lTZEh3ZEpxWjNBU0VHazY1U3JwU1RK?=
 =?utf-8?B?RnpsNDY5YXBsK1UrUGVEdE5NQWlqU0RGclh4V2VKVGNycUhpUFErMzNJaUl6?=
 =?utf-8?B?RG8veUk3OU1DdTB2RnFwNVpLQUZZcnVldlBIL0pHUmV6UE5UYnh1Uk9YUUxR?=
 =?utf-8?B?M0lkTDduK2pwRXBHbXhQaDhrUWZmSXpwdFF5VjR2bGU1OFZYVEQ0amJIbzln?=
 =?utf-8?B?L2VuKytqTXF4bWNLbzZPRDRuSkdjVkVYd2s5VFNKemdjNytRR2NqQTQ2MktT?=
 =?utf-8?B?RjZQR1BEVytEY096YTZsMWJNMjlzVFZFbVMvRFY4RngrTVI1azRHRGU1K2I1?=
 =?utf-8?B?WGZKY3JwVFZqaURPNTgxNlZmUTBzMmZVQTBzT1hqTG9DcG9McjF1Rm1LazFY?=
 =?utf-8?B?eGhKckVCMWxHS2phcDJhZjFVOVN0NGc3NmgxU0F4VTdNS1RnQytaUGtiWXpS?=
 =?utf-8?Q?sm79TLJsk4/xObfaL01vGCc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f71bfd-4db8-47a4-1d5a-08d9f0a3b5dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:53:37.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viLmgAX6ATDpToEh8YJk5oTCtweuFsIhTR+D2Gs21c5DyUspcj55AQ1gA/0UtHtsTJE2mxM4qtED5N9KYcorYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3906

On 14.02.2022 13:51, Andrew Cooper wrote:
> UEFI Runtime services, at the time of writing, aren't CET-IBT compatible.
> Work is ongoing to address this. In the meantime, unconditionally disable IBT.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -21,6 +21,7 @@ struct efi_rs_state {
>    * don't strictly need that.
>    */
>   unsigned long __aligned(32) cr3;
> +    unsigned long msr_s_cet;
>  #endif
>  };

The latest with the next addition here we will probably want to ...

> @@ -113,6 +114,19 @@ struct efi_rs_state efi_rs_enter(void)

... no longer have this be the function's return type.

Jan


