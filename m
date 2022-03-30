Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E84EBE26
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296175.504114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZV6H-0006d2-OF; Wed, 30 Mar 2022 09:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296175.504114; Wed, 30 Mar 2022 09:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZV6H-0006aw-Kk; Wed, 30 Mar 2022 09:58:49 +0000
Received: by outflank-mailman (input) for mailman id 296175;
 Wed, 30 Mar 2022 09:58:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZV6G-0006aq-2Y
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:58:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdc479b5-b00f-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 11:58:47 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-2S8JVsHiNweEI8ia8DeTxg-1; Wed, 30 Mar 2022 11:58:44 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR0402MB2833.eurprd04.prod.outlook.com (2603:10a6:203:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 09:58:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 09:58:42 +0000
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
X-Inumbo-ID: fdc479b5-b00f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648634326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vz3FBfUI0XZC0vRPupOdJkYmWe1uH6DSENETWncMJIA=;
	b=AtW9tnnAIok974bBMXK2wqnEq4+G3qsKJYbhx2wRnnxSbmuSXul2jd0+09eiHoB9xmCdYf
	cVgwCavYulwLPvHF9de5pWpZ5qXNhk/BgvC2u9L8eov/3dwbHcsp63RSIoPNxG5V2FJqHe
	BWVJawFrPcu5TSD+CJ33UkokawZcICA=
X-MC-Unique: 2S8JVsHiNweEI8ia8DeTxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDIDPZi9AXT3uMrrJ192Vk+UvJAnEPHh69d2v9uv23VUBD/YhmvF5xf9LV3yvdlBGgxlP1MI/uIeG8ItN6Aqp8tTcO3gsAR/4MLhnU7syQ9hlI4HIKKwa/9+bDVBWsbICK32FwE4ibRO6LKgQKTX+1xfg/iRcE73vTH1b3p9OsiQBtwA+HSKsClSYVnDGHL9Po8kZoHISczzAEnYiUxNi/cdl9KvuLbzUkqEzO0ue1cg4l74PWTTLr8Dt4ZX6o0pjnXx3ZQguaUZwMDLGf6+ETSvTQyx2j7QFiZmWcEl2MhdFQbevqHwoS/oxgi7ImpYyBmzzRxhK+nFR0W3AWsJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz3FBfUI0XZC0vRPupOdJkYmWe1uH6DSENETWncMJIA=;
 b=P9Mvm56Y7LF2Eujk28ZZjAYLKcEY+pAHnoln38m72XT6fE1g9WZzKWD939vuB0sUdU3uh+p4QvZVnssIRSaVQ/+TKdpf/c7BAjEwHGYqSpJ1TaYpZSr+vkO8c4kHw7kdckswGSXut0s0SFgzxqUntO2quMkWCvLePVbiECDdZgckduVlHY6EXiym7wR88L1GPv3PIB59Ni8KYq3/EYlDCfkypcAdS530JSpN5VHhTTtwFgswZvqsPRzBpbLccCFvd7KJ04KE26K7r/okIDjMboBxckEibesWsAqotsgfMknH7VdvFhcjpNxP6Ps3eOwwOua3yBNKW0PT6taDmW14RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <570e0ca9-c07a-0fca-d146-82d655c792e6@suse.com>
Date: Wed, 30 Mar 2022 11:58:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 4/5] xen/arm: retrieve reserved pages on
 populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-5-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220330093617.3870589-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0018.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0067a4b0-b9fb-4c61-e6cf-08da1233df29
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2833:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB28335ACDD38AF5CB647B3E08B31F9@AM5PR0402MB2833.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lt6VW2SvzYS0o648wqN37Ths7nNR9qtay2JMaKgnFaKoQCgDIR1AZqk9ALPNic4uy7WgF4yzRPuNMkPxrfwENptB93H6FIsYUJgb6XqTpt5apnpvC5nxu6hZ11OJ+BUiYyhi/2G5fjmNlGDlWrPn3ydu0by1yBJluxNRNPVRpczGnxxzlZC+GjcHiA+exnmJP+R1egcFU22MWmSooi2W4TCoy9pO6iFGuJ1f35qMnyr05ydbsODvqykUXRTYOzLdZ8HwlFd9O3n8B3RuiaoMOPBT4vRXp5dfqAc259621w+fDdzFjuBcVcsUKWeQwxQOS/V3a4sLowNHbJuIQY2Fh77tsR2cH2xhaU9fRkLjZZHCcNa41x2lqptuflZ25gNqARN44KjDcMKvLUKNm+LojwJFVuevYi0DPPkpOIfqaYZyRqBlXGAMKmAhslIDZw/s7XTLWFDZsy63O+cgOf2LeBclRnaQWUmJJcd70vXuB0N8nRaXrBIyhhyfGUtfgV6y8aB27LN/+8vJ2V9o8OeeoRzHHiiIayeaRGh9M048LUzM7CxIHdYxl+zdbkJkY4ooT4nMx73q+yst95awRinKnMciRJpWO+c51v1j4swBkd6RTKu4cX3GIMLZJhvTGZuZzisjVcnQdkRQrHNwGUPvEmBQ3Yk9NAehHKevTwMXCdpvv/vllsqfTlO3hLZaZiGuQYDkVm5ZHP7ahdmP16e8XV3joqK0MdwX+ruo2+C6qxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(186003)(2616005)(26005)(508600001)(83380400001)(31696002)(8936002)(316002)(54906003)(36756003)(4744005)(86362001)(6512007)(6486002)(8676002)(2906002)(66946007)(5660300002)(66476007)(66556008)(6916009)(6506007)(38100700002)(53546011)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdreHN6Ty9GaUNwWnZZMk5iRXNuR2ZpQkFqcS9yNUtMNlJvdi9HbHh3ZWkz?=
 =?utf-8?B?RzJESVM0aXd1Y3AzdGdTN0pFZGdiUzh4VFpsT2l0dGtoRnc3d09QUk5yL3Zn?=
 =?utf-8?B?cDZPbjRDQ0tsbzdOeUhpcXJlUFUzOE1RdklUcWFZem9NbEVwditkV1VsNXp1?=
 =?utf-8?B?dUNwam1xeHA1QmNDQ3pDa2ZielVxT1VHalhhWmpNN0JnSWNIR2Q1YnBhWnVQ?=
 =?utf-8?B?Vmkxc1hLL0lxVEFkcXE3eDlMVE9lNlpnYndObHU2NVZQZC9VL29CTUlMT1pH?=
 =?utf-8?B?QUl5MVpNdUlFME5BUndDSzM4ckNNMkwvMFI4QzY1TURSa1B1aXVnaytYdW9Z?=
 =?utf-8?B?N0NIZUdQTyt1WE04WWZvbWZFbzl1U1NBNVpkNjlPTmJ4WlJRdDJqdW1yTTlK?=
 =?utf-8?B?Q2oySTArQWVkcGE2T0UwOXdOQS94eXhoMVhUQnpQWWRJaTg3cTE0RGRxeXJY?=
 =?utf-8?B?cGtqTlhKVDhOOWNtaGxyM2hvQzE5ZS9XdFFEbDRCcW45NkQrTFIwN0ZrUG02?=
 =?utf-8?B?eENJTG1tdUwvZ0s4RWl2UzI0MnlxeXBXM1c1UmtXK0JKcFU4THVqTGZROGNR?=
 =?utf-8?B?WUwrZVUzMnRVVHZPTmdVaE5XTVFmaXl0UkNWMWhadlVESFpsMHRVeFJUYTlR?=
 =?utf-8?B?NzA0RndMQ3FjQlRJME5TdzFreTYrOWFzS0pnOWZ5Qis5VEZ6Nm8vOTVOc2pv?=
 =?utf-8?B?N21yMkRKN2hlTFRRQVQyV2xjdGdqaGY4N2Y0T0ZsMXl6ekpKMStNamRlMEVN?=
 =?utf-8?B?UTJERFIvN3krdWtEQkl5cnNENGd3OUxLZERPMTFBZjlwbDcrTGM4SzBqb1hW?=
 =?utf-8?B?LzBIM2UrN29TRVpOZGpOM1BhR1RXVE1YU2F0OTNsYXZzUTN2TEYwd2Vvd0Nw?=
 =?utf-8?B?aDg5dENnc3VnVW5FL0YyMVFzWXFpdUZtN2NndjRHQXpNQm1iWEdOYUpzRGI5?=
 =?utf-8?B?TzBQa0MzMU1rZFVZT0x1Tjc5ZVRUVnpFVk9kY24xSnIvWWRHb2p5bDNOMGIr?=
 =?utf-8?B?YXlaR2g5R2szcUFTQTQ2UmdrZGJKNmRleDdGTGxxVjFpenRlbUdTdmhONGxS?=
 =?utf-8?B?NnRuUVNnV24xQTJyc1dOeDFYQnpLcUpydVpydkFwSUlEeHdaWGpJbHdEY2Er?=
 =?utf-8?B?L1p5bW1JNG1UanhJSndta1FyelZMemx3Z0VNUFZTZkhRQ0lvaytsMkJRUkM0?=
 =?utf-8?B?WjlEUU5VWERxUS9VaTFXMVlUNk9sZFpmNUZINFBiTER1ZysxcW1jQWtiSito?=
 =?utf-8?B?alpzSlpFanNhSHUzZXZRaEFnb2xVZ1YxL2ZCL1dINndub0ttNU1qaWlEN2pm?=
 =?utf-8?B?SmUxQ1hYaTI0RWNtYVdSc3UvR2xyc3liYVNwS09GOHE2bFp2alRpSjNIbzlW?=
 =?utf-8?B?dnlyZGdhRDQ4VFRjdzl0WTBWeFY2djVRYkJWeHUwbUN4OE9iaVJFQzZSQmU3?=
 =?utf-8?B?WFErWVZmV081L2NYTzYxdmRCWFlnV3c2SWZtTnR1bmFVQTlUWGJ3b1MwT3B2?=
 =?utf-8?B?dkRVVUNzdmlHSjA5NWxpWW9jUWY1anhvK2ZVMmU1UUN0N3FXYWFGTWljZmNT?=
 =?utf-8?B?MUJhMGtIa0swQ2JPMFhqQ1czWEFtZVU5N2lkTXZNQy9BaUJxSGw2Yk55TXBI?=
 =?utf-8?B?cWhyajBmbWVrQU52S0xubkJKNkFFanpXaDZSRTQzNmdhaW5WMWw0TG9aT2JH?=
 =?utf-8?B?c3FwZ25tY3k2bnlBT0RtVzY0UEVkUlU1UjZ3VDF0V0NnODNHMHYxQTFhaU1D?=
 =?utf-8?B?NkdabXk4Q1A3Q1JUY2FnQWYydERRdE1aQTJ6UUVZQ0orYnp3K3VEM3FHMDhW?=
 =?utf-8?B?MkFLWGV1SUZWQlRQSFZCNkZud2U5aDhrc3AwUS9TQ3dWMmN4YWJjL0ZBeitm?=
 =?utf-8?B?aGh1QjMxTzlMWjZVL2p4ZVF0bHUrZ1VSQ08ybGV5VjZqNUZHMS9zelFKTHhr?=
 =?utf-8?B?eXEvTE16YjBYQktGZXJ1RlBpZmhSK05vcTk2NlRIZzdwb1hGVG9JRkl5dzNB?=
 =?utf-8?B?dThwWXhoNzhESTRsMFJjbWVURWg3QWFFUjdsYkFMZ0FXakNRU2xFblM0aXJZ?=
 =?utf-8?B?dFRZTTJTVFZUdUE0VTAxSHZXWVpuZmRaNDBaMnRqR2xMVU5vVklzclA1THcx?=
 =?utf-8?B?enMzS3ljTHBvTFNNd3VlL2JUbm93YytlTXNFemlMdUVoWFduQTZWSjFrVHh6?=
 =?utf-8?B?ekpGQzRrSG96MGl0T1hMUElRZXdCdk9CR2hKd1dmcEFXVjQxZ1haTDVDbFZa?=
 =?utf-8?B?d3NzZjBVZlZvSmdQZnQ4dHF5M0NNSGpEcjg1dWNpRWZVZklDblIrbFZNUkVN?=
 =?utf-8?B?WUVZVnhHdmlxcDVtZWttQW5DbktjOW1XQXR5K3p6a0lHbGR6R1ZWUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0067a4b0-b9fb-4c61-e6cf-08da1233df29
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:58:42.3824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RLYnbEyp1OtEh58J/MgBNr+Up6U2vWPlVEkkur/Gf5i3Zec8riauwnlMHYvLOp/gd3ezUo3m3y5B9H1jFFm+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2833

On 30.03.2022 11:36, Penny Zheng wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -249,6 +249,26 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> +#ifdef CONFIG_STATIC_MEMORY
> +            else if ( is_domain_on_static_allocation(d) )
> +            {
> +                for ( j = 0; j < (1U << a->extent_order); j++ )
> +                {
> +                    page = page_list_remove_head(&d->resv_page_list);

How do you guarantee the pages are contiguous, as required by a non-zero
a->extent_order? Did you perhaps mean to forbid non-zero-order requests
in this configuration?

> +                    if ( unlikely(!page) )
> +                    {
> +                        gdprintk(XENLOG_INFO,
> +                                 "Could not allocate guest page number %lx\n",
> +                                 gfn_x(_gfn(gpfn)));
> +                        goto out;

And earlier allocated pages are simply lost / leaked?

Jan


