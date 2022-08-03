Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240F588F51
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 17:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379986.613946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJGGi-0001e3-Iv; Wed, 03 Aug 2022 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379986.613946; Wed, 03 Aug 2022 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJGGi-0001bM-Fz; Wed, 03 Aug 2022 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 379986;
 Wed, 03 Aug 2022 15:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJGGh-0001bG-1m
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 15:26:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9d6352-1340-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 17:26:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4044.eurprd04.prod.outlook.com (2603:10a6:5:1b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Wed, 3 Aug
 2022 15:26:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 15:26:39 +0000
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
X-Inumbo-ID: ac9d6352-1340-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdeQ0k1JnShDdh/9xn+h4PyGUNLLlKcS5wAzDhCSEcRAwj8hzwU2bbQjwY7SbM8WOc4XxFV3bWu3I8EFlKiSVUhVTiBxVVSWB/tWXTj4Ejk9OZYjZlpbjgOz47Skaud8We1jcN/BGeXujaRnLGHQQpbLoH2/hs0PHSuFM+lS9Y+nw/lrXErXfoDsTaEnWIaK+8qIJuRPo3tgByw/W2pYVzy200yHu+4kBjVssG4loKIydmIv1uqUA0/4HBHqV/ViO3HLjZR/QtHm6lMAU8SGD/igXNFdF9DoskwLyajyzuRjk2xYBNYpDpNy7osJxeQoDzqtMrqol0FmL/PMG+GERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWbPPtiBfqNGS5wxu/ZVhDZ21YGlbWqmW7a1ODdsy/8=;
 b=ge1nNvhDZgVosmZGyZGZwTrIpSCmj87twVDlFj63NUn3pr50bFhzV1LvLDto5WUm0mOsVkIpfb1f7mvt1qDu2opdRzrNQLcZNFWtjGMOGRt5t/2gpr1lAhkA24sksZxqxfj1qI5PglCVtir0JnOoepAyXTomPDN1DNiL0Zm1HAHggxME80e0dRzsdWBNhgkHaAh75rQA5nBKCahSf7o/AsCvv4/d5TmHd+rvOmljMchcXnWtVBtSu0L8cI0cMimdrGU6ST8EcPzkanH9mwIdr8XHcWb0nzctYEtPhhktMsKiM0Pf1Gaj6E4pX40Ox8zKdfRmObwGGzN5TFc5BuY3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWbPPtiBfqNGS5wxu/ZVhDZ21YGlbWqmW7a1ODdsy/8=;
 b=hZXdU1Sti27SiNM7VOOgyyF884AkapMkXOmf7sJkTEk9kpi5Xo+K1rfhGBHc9VAF64Dp1fRqkx6tmM1g5NxEIbepob4NIGrdF9+vVMx9wzgGYkc6Sn2GmNWTZRVOW97HHhAj5sS7XtF/ZAtyBiWFZFt369LtaqM0ik1fxkvmJytDozY0bnaCuuap5GxImeHzyS7WwWK1bjLaR/WlviglzhwJDKb8YbmRXCWAttIcfcRZeBytkCZEu2jumCc4QOEhI49Z+G7GN7Q+SVdTfqMzG8ZzRApwj1iePoZlbUx/7PaqETxAOWLxWRxMyrINejSLsAPe7wOLRxrGfo6VCghAMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9001446-157a-99a6-29cd-dcbbb6d59527@suse.com>
Date: Wed, 3 Aug 2022 17:26:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11] xsm: refactor flask sid alloc and domain check
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220803151741.7826-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220803151741.7826-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7ed9f47-302e-40d3-5128-08da75648f64
X-MS-TrafficTypeDiagnostic: DB7PR04MB4044:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4iPZKOiodkBP74gFtL8NmaFtn04ar7DErUzow+UFrlsM5/wPkjeB9lycr4JAnmg4h+uqWyg0GzAybvG28mzKffZLgxVxKx//NuKLHfyref7He9RD97TgX45BZQgEShaUVtu0jZOCynI6SIstVTkwHCbqzcu/4kTK+WoG1m4FJt0mHEjrtNiwZzJ+TdkiyIW9O3XVMrOKhcvlHEybRtzHfQYF8lgGTupGcWTwWYdXPCiQCUJPf9D1/E7aCHnVfxhqP+4Xv2SBjrOMhAv8sIHKDaNwz8hcNaslcQoCswRrt+orGGT/SSpjQ4+j60ZYKHcucllyW2F7/HhSnnVx//D5W69xBotaforL4IG6s45mQC4mxTOOdhP5mm1zx3yLlFNx0KJAuB/KDikuaZtBHYX8TjHzF8I+5OM30IUJX51QOwl+YvIVVHI9cy7gwFZ3/rPfo8YLMh+vw7qL+JtGXJ7b6doz15WYQvi/Et8nKlGIyeXnHzF3C7Wgnio2+r+9H6hi3cPSoEoPaRWof++CGw3K+mY+3pxcNUVK6xWi935rd5G/9SC93uk+jtHLE9e4hNr/6lAM4EyocwM3UID7OKQl9/TbpqyBsg5J3A+D5AOb4L/b5ICo4PlPqy0ymtbczTNrSWVRHotOo2P0f1H5fKzJxhQJzHzRrZqi7W/P42mMtwpdoZ+dvNLcQmFLJdXTs4IF8s+TbMHTD5ELi2hW/aWyez234rkvhop61L/1qnaH8P9EvudxHTPVfeqZ8E2XE3cufO0XxLp6T6eAtNnz1Ety3nVtxPcOsAS2bMl4E9q1+0LKrUDMWupJWfM6dqe3Deo1xeaC8Z5SM7NkepcsJKQtyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(376002)(366004)(396003)(6506007)(36756003)(26005)(41300700001)(6512007)(478600001)(31686004)(6916009)(6486002)(54906003)(83380400001)(186003)(53546011)(5660300002)(66556008)(4326008)(2616005)(86362001)(8676002)(66946007)(31696002)(66476007)(316002)(38100700002)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1dsT0dYMHNIMGExbkJBQkhtbzR1MEE5WkI4S0k0akp5U3hUS1V0VTZRbnc5?=
 =?utf-8?B?Q1o3bkhjcHFNc3R6U0VRYWpYRXdqWVZIWU5rT2lrTEpoYXVPMmZNVXNRNUlC?=
 =?utf-8?B?WmZ5T2wwTm1VUldNQTZ6eEJoMUVmT0c1WXF6SDFWclMzeWdCK2ZVN0lXZmhu?=
 =?utf-8?B?MEJidU0xSTN2OC9BQXYxRkpXVjhLalluSUg4RFlHT0hldHZXOXA1OTJuMUw0?=
 =?utf-8?B?WkhwcWdWQnB2c2Q0S2NmSkxaRG9NaWhHODRKc1hoRExZd2N0R0k3RUwydVll?=
 =?utf-8?B?bk1LZlBRdndVTW02Q0ZnWll5c2dUMURlbk1VbnIyQzZINVA5SUtWOERFdHZW?=
 =?utf-8?B?V1RuUCtZRzZCRWIrYUFUSEtlaVN4R25aaXFWM1JpRFJLTHU2UWhJZ1V5UUhX?=
 =?utf-8?B?ZXkxY2xiWTRPTG1JYVc4ZStSUDREY25tTkVrTUZPYytsVTJQUHIzTGxoQ3R5?=
 =?utf-8?B?eTkrTUo4MzNKNzRVNy9PcWs4cndXbzlVTkNkVGhUZDV6blhJem8xS1ROTUJE?=
 =?utf-8?B?Nk0xLy82c0VuS3NMVXU3UW1WZ0FVU1RFbHhTQUxqR0srWk42TDhIbUpPbE0v?=
 =?utf-8?B?NFZ4ZUhwR1VPRjdXekpGeHE2RWppeEJNRzJ6MG9CSnU4T1FPUEt6SmpiVVlL?=
 =?utf-8?B?OW9sVVZRUWI4VmlrVFhoMEE3WUdPOTdmb2F3a3oxM0luZ0oyN2lzeVBBdjFj?=
 =?utf-8?B?dzViaU5DWHQxeExvUzhMZXp5WlFPcG5qM2ozOVJDSTJON3hOanQ4VlJtMk11?=
 =?utf-8?B?a2MyL0RvWGozQzBPTWxReXNKWStIYkx1d0pTNmZHV2MxOHJoYm96em9aN0tp?=
 =?utf-8?B?K3FCWGV0Q3JaWDhCbEE2Q3dPMG9tR1hvY3pOMFFncGtSNHRPQTFJS1JhMXgw?=
 =?utf-8?B?cjYxdWtMY3h5djl4RWdFcjRxbUcvUEdEaWdJNWNNditERU9OVStFNjY2Yjh2?=
 =?utf-8?B?aThYYlQzY2VrcHNRTm1HMXI5bmU3eEVDZXVMd3dKaVBDcnNQcXp3MExnZlFm?=
 =?utf-8?B?NnY2bzNBaGQwbzFHZzdFdWFPRlJVNGZ2QmV1NElHajhFRWxESC94aEFiTFA2?=
 =?utf-8?B?K01aQlRmTFR3dDVlTWVqQzYwdDhwMFBHUVE4Ykc4TWVkdGNJQ0dyTTVTUGhs?=
 =?utf-8?B?NUhpRk1LOG1JSjZDcUtSenkvb00xMnphLzluc2lveFlJRmRDZ3dnUVZoZ3A0?=
 =?utf-8?B?QU9LZnJyN1o2VktzMGhYQTFOcGsreGMwaHhKbEJwSUowQk1OZlkzd0NVdnlq?=
 =?utf-8?B?L3ErV0l1TDRBQmJvSE1oUFVFQjI1cWh0RDNjREpJdjZhbjJhT1hhcC85RjBC?=
 =?utf-8?B?bHI4eVV6RGsxbFdlYnJ3NkpTVTYvU043Y1FENmg0bS9TQjBHTnViM2F1ZFpV?=
 =?utf-8?B?WWFPRnVIeG1PdVoxODJVOXFUbmhhK3FWQWIzNCsvajR1ejhGSjdLRDRUb1BQ?=
 =?utf-8?B?RXVXSWZTTjVDUnEzS2x1TFlJZnhFZ3JESG5HVFRmM1dSU0M0Y1E0RVRoZkFR?=
 =?utf-8?B?UmhBM0NrSXJJankwS1VTMjZGYlk5bWFOaEpZdFJZNnhUNXljbEtnaU9uamVF?=
 =?utf-8?B?dXV4WWVUS3dLaGp0MVVVdHBLV0hTWFBmaWcxSGNSZWVmZ083NDduZHJhRXRY?=
 =?utf-8?B?dnhuMGJtWkZyMlJyRXV1U1ZHNUg0ZnV6S0dEcDc0OUsyYm1Nd3B5LzBKODRo?=
 =?utf-8?B?VGxBR1h6QnR6UHQvSktRdFF2azVsSlgrMmM0L3RReWl5Y2dLV3E2NmVSdHRU?=
 =?utf-8?B?dEVuZzZUWFlYUktpdDlRV2VIZEZJVWJZQVlRNVdLbmR4akdpU1lWWi9HL2RZ?=
 =?utf-8?B?bFhoZnU2Y0pHbGFDZk1TeTM3Y3JXMHRKSEwxVmswTWJwS0h3MlhCdXdhWXN2?=
 =?utf-8?B?NGdaZml2dFBWR29KNDJiQ1NTVFNod3lJUzVMbjRabS9JSHFtaytmUzdydHFt?=
 =?utf-8?B?SWhTWkViWldvTzA2Y1U5NGpQS1Q3V1RReEp4QUFVWWp4ODhwcDlWdzZtOHla?=
 =?utf-8?B?WjVDK0FOU3FTRlhnZlp2N3k0QkhWUW40eWNXNFVnY1JLcCtUYVhGUi9xZXAy?=
 =?utf-8?B?WE9GNFZBNFA2SG1PYWpRVjNnTk03dkxsQUt0V0swZzZNUE1rditJR2xmckNH?=
 =?utf-8?Q?mungeBRsRWScNvfQxyXJC+2p+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ed9f47-302e-40d3-5128-08da75648f64
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 15:26:39.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foA1anFBR0g1og4j02REpe8HBjKWhfMzn3j0miCKp/C04zp0NSnx5V/mILNn1iEysAvsbO1ZHkRxzY3eqV1akA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4044

On 03.08.2022 17:17, Daniel P. Smith wrote:
> Changes in v11:
> - put back dom0_created variable in flask_domain_create() to ensure the
>   enforcement that dom0_t is a singleton label

Stale patch or bad rev log?

> @@ -548,22 +556,19 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>  {
>      int rc;
>      struct domain_security_struct *dsec = d->ssid;
> -    static int dom0_created = 0;

The variable is going away here, and it is not re-appearing elsewhere.

Jan

> -    if ( is_idle_domain(current->domain) && !dom0_created )
> -    {
> -        dsec->sid = SECINITSID_DOM0;
> -        dom0_created = 1;
> -    }
> -    else
> -    {
> -        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
> -                          DOMAIN__CREATE, NULL);
> -        if ( rc )
> -            return rc;
> +    /*
> +     * If the null label is passed, then use the label from security context
> +     * allocation.
> +     */
> +    if ( ssidref == 0 )
> +        ssidref = dsec->sid;
>  
> -        dsec->sid = ssidref;
> -    }
> +    rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN, DOMAIN__CREATE, NULL);
> +    if ( rc )
> +        return rc;
> +
> +    dsec->sid = ssidref;
>      dsec->self_sid = dsec->sid;
>  
>      rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,


