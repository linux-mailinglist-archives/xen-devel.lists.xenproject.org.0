Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852367DBD04
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625231.974313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUdt-0003M4-AK; Mon, 30 Oct 2023 15:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625231.974313; Mon, 30 Oct 2023 15:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUdt-0003JI-6e; Mon, 30 Oct 2023 15:57:29 +0000
Received: by outflank-mailman (input) for mailman id 625231;
 Mon, 30 Oct 2023 15:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUdr-0003J5-Gy
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:57:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 059786ab-773d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:57:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8918.eurprd04.prod.outlook.com (2603:10a6:10:2e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.14; Mon, 30 Oct
 2023 15:56:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:56:57 +0000
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
X-Inumbo-ID: 059786ab-773d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2V1IeXEEgywQTKbc6fyykQKKuoVgu3Wp9PmsfOzMrudRm9rRE7YlCyZxq/7yg5aU4zJfLs9ai56s+03MydCQypPcNCU6/lzyIjKvsEkp8mpPT9YNVF8EhW8KNQGVOGouKBFBkG7sAGNTaBIea8JqZ+mNJAPwMf8cmlnR0wo0XAqLJDRXj48PcI8IpDlMW7LVctf8WWiuwj68yRcluOG148a4rYf6eyQOivHK6YmuiEapWX4dTxD4Y1+XwUl6+hxFUPUNWwiRIhe8NJWWISjwCUyFlPGRNE8T4jybQEDOFkVzMftzME6qZeGbWJp43116gQZf0KHrHcOFa4ml3oHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHvAXIKJXjd2kg3190fn2MFCqtoogmJbKQNVOwWpCqI=;
 b=S1d53URh+mHCMh+4eZh8h2E40EZXhu36Bj+K79T74fv6KGWxD8RLCnFUiqyIRmM4B/A8ECoXk6RK9ZKV2D+yizxcbV8Ancerw9PwSI3QKIxePg/u+O8GnCjx+wx7KK/xI7TZt9ly9N9xAkvAfZxoTUftIPQld09Bi1L5QWqTrxdWan4gnYlgvCVmckMmFJVbFnLZLb8QiMRCLuEk6zc9g5A1BlDaosoIahMghNl5sKcTG/CNPo7lBLfNZb4MV0kF8Ekp19RuAdBa0Ji8fxwRrxF+4GifSff9cgXRi4xXA1rBY5jUOIY1ygXtCvALPqWPoA9YOwCnVgKrF6n53oZeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHvAXIKJXjd2kg3190fn2MFCqtoogmJbKQNVOwWpCqI=;
 b=H3rDlZ/Oqq8pJ0hvvJVG9VuvTaGbLRujH8NkS+9pKf1vo44DODbvTKUtdBW2YMHmwaSJm1IhrJgymYrAknWBG/qdIHXjBi1mxvnOd045G8dnXi1LtOz1kNRdL+BdOdB6oxO+zNgbhGdWepuCkL4FDw6KDm9luw2CqvstR3tUP0u0Hbm7lKDAec+f6TFBKVMxzVWP8KLw8n4lW7eFAeXuSIfzChgasBTqOo9N+laLqK9Re5pmCpNuI5NXJ9uu1yf5jcm8/uDb5OLmUHR4hhQ4p3Zz7iLT51nbQVueY9bXx8h8syhdo5oHnFbZm9/Ij+OjlVriYZl8gU69Qf5Nk6nOBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6de291b-24df-0899-d0ba-17313f5b2c88@suse.com>
Date: Mon, 30 Oct 2023 16:56:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 1/8] x86/hvm: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <4cfdc887fa3e384dd0d160755350270208c3693a.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4cfdc887fa3e384dd0d160755350270208c3693a.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 792ee75c-5565-4cb0-7e9f-08dbd960d85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wgnBQJdKigVfIYQtLczA7tu+AK1aA860RXAIHRkQxe0Mt3LHGX+E6zrK6ayG1b6sqTitRpWChcyjiFWA3nQl5ZbQqwFE7Fwze3G2IXT4NkvzX4Rl94GeEmbGyO5lLa7uqYIukUnkh1ccuXRuQIzi/zfaWxhXTWXmS+zvQ5m9V//IWoU6uoNEsecPRU8rLro9zAU1nON+Hzml4pIXirWawW608eYYtWTmNR3CEfpixEcZMBBQ2xfHdyF/jEyf0pj8LCz3HF7+07TZW+ol2HpZO2fXtrP2tiDAnPQZL+OhQk80siq/CSf52fPqcFCDb8Lht6TJbjwXfnnROZvPy6aGJIbJ6NmHGBftz8TMqWc8Tf1yMnvcF0vGXPYvBILhdYZRqbfhrWKmd5fwTzQVwmI9zn6HufpNDxBlyWvxrPkT9aozqgpEmLYJB9tst5hykBChNqUn6/qqjhBAfwPnmb3b6jHqoNYUMcmi4iGwnM0QDrBGHA3qCIec0QRpIgwjKbOcVnwiyR7BUmXERHBSBsoQ3SZI+AGs/sLwET+V6oNnW6qGVnUOnPSVPyJJPwTJzjG8ttnsnFgkWsUQUuzgoHGJp4cVTqE+FNljQu5FdXfxJy+nROlFB8IOe3yYpGEWOZ9QMjwn7Vu1k/njNZTY9aTdTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6512007)(2616005)(26005)(53546011)(478600001)(6506007)(6486002)(2906002)(66556008)(41300700001)(66946007)(5660300002)(8936002)(66476007)(4326008)(8676002)(54906003)(6916009)(316002)(38100700002)(36756003)(31696002)(86362001)(558084003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YS8yN0IrVVZMck1yRXU2UTB0a256NUpGNFhac0ZSOXptZUFFN0Njd2szbTdh?=
 =?utf-8?B?ZU5ab09QQjlJcStRa1V6b1IvSlFMdUtKTGRPWjVHc3hZSjc3RHA3eGs2YnR0?=
 =?utf-8?B?aHBHSUlXU0I3VS9LUmZwNXN5TE9XWThFOTkvY0tFYzJ4ZGFDRE5mcVllSFFw?=
 =?utf-8?B?NzB3M09RRzVHb21ZbERDYmlCSFRWRmhmYlozd0xOLzdHbTdWa2FFa0U3Nklw?=
 =?utf-8?B?eTNsZmlERjluVWdKWjJ3SzdHWlF6VHhkdjlIZjd5TWtNWkQ1cytwK0tFR3Vy?=
 =?utf-8?B?S1ZVZUl6VmU0Ly92Z2VlYTBMUWpkemQ4VWVKUHNENndhbFZ1eDBVc2lSQzVs?=
 =?utf-8?B?QWNGVXhNZHFiK0hNQTFkZEF3NW9Gblk0bVViSFlocnNqbjljQ3FVUGU3NERO?=
 =?utf-8?B?amc1b2QzRGNxZDZBS0ZSMHFCdUJTUjNob09Tb0U3TmM0UFIxdG5pMlZsOVd0?=
 =?utf-8?B?ZWIzZTJ3VXBSbVRSY3lGZkZGV0JBY0s1TzFHcS91THROTWtjSjZVMTdhRU95?=
 =?utf-8?B?ZW1LMzdHWHNUV1ZPaDlGQm5LOXU2cmNneUt5SGFlaHhGekxWbWQvRUxhWGwv?=
 =?utf-8?B?d3g2MGxkSG1BWk9YS0ZCZ1dBLzhSNFpvWHBPT0I0MWlTU041OVVFUnplMmFu?=
 =?utf-8?B?andFaFh6d3k3WnQrOExoV0dmK2xKa2wyOGZ3MjMwUjdmT2ozK0NqM0ozNnF3?=
 =?utf-8?B?Si9LSkVkYmc5UmpGWDlBdzBZOGNqL1ZnWXlxZVVvTGJ4SGVmTHlZdGpyQy80?=
 =?utf-8?B?Y0xDeFErd292bW5LeENndDhCRE9jSUIyMnJQTjVxRldxYUlIdWEyTXEvQ0ln?=
 =?utf-8?B?SFNwVkUyR3pPVWRxd0NxcGQvKy9sMmV0R3U0Q2huc1JJMXg5eTdhM1VkZkF4?=
 =?utf-8?B?THNtV3pUbFE2M3orbFZvS090RzJ5R0NLbUE3bVYxN2sxM0thVmpWbEorQmZO?=
 =?utf-8?B?MjJpUzUyeXNwdmJSQzV5Ui9ZRTZiU0ZPN1ZxSXBCU0YwcWFFTzNBeHgwYXJm?=
 =?utf-8?B?UCtHSkRmeXhIN3F5YzVlSHFpelQxUkxJL1M0RkxHRUtCTTFJQVR1UFVQcmp0?=
 =?utf-8?B?b3NscVBVc0xuVng1K2RZQUcwWDl5WDFoS2J2MXI4WFdTUGppbnpNcFBvRHB5?=
 =?utf-8?B?VnY4bTREZHZIYUljUW9HQys3VzM0aitQUWxBOWt0VjlobGwzVVZxL1pzOXYy?=
 =?utf-8?B?MlZNTkhyZVZLNExzd3lpOGtVM2F4QVJPTkx3ekFLTXJhT0o0eXJIYzRMd2Vh?=
 =?utf-8?B?ZDJmWDJvQjdJcW5JNEZlc3Q0ZHk5NzRHaXlaRElNenZzSmYzTnQva0FEdzFR?=
 =?utf-8?B?VVB1ZEYva0piSFhzVFMrZWN4SGlodDdhd2w3c2ZjekJER2NiQ1pHQ1BaKzJy?=
 =?utf-8?B?S3FsM2J5ZGFnSjRvdGNQQStBejhlN3lPeVRKV3hoTU5PSUNCQzVZRCs4Ymtp?=
 =?utf-8?B?T1JjT0VDNmpHVkN3Tk8vRnpuRTErVGVMdnRoMHJBbjB2YjlyaTk1Uy9kVWRl?=
 =?utf-8?B?SS82aEh6RUZuOGxQSnVFUm5RbUVjZURDSUQ0MnF0UmVTRk5ENUJqV3FmeWM0?=
 =?utf-8?B?S2wxMXJ0Rmx5TGJwMlNuS0poc2JOcno2RHlJN28xaEVhNDJRbnRtN1Q3cmw2?=
 =?utf-8?B?dEh6ZURxNXpUbVVsYVUyajJiTVNxeEtBVDZmTEhoWXhJcDhBREZLM2lWNFpV?=
 =?utf-8?B?RFJqY1J6RndKRU16UlVUUWhKVnBvTzNDeThCaTljSWYzT2w4VUFDZkVJYzRR?=
 =?utf-8?B?eUx6VnJwQ1Z0T0dUbHZhM0xXc0Y4SWwvNkxSb05abEZuVCt6YWJjY0xFUmlP?=
 =?utf-8?B?N2Q2WlVsb2x5NjdKemdpYWZwMytialdIV0VXSEpBM2JoaFNXaEhZdE5RS0s2?=
 =?utf-8?B?ejJ0cHY3YzRjcVVXSlhobHdHM20yQkFRK3IvRnpjTmtFOVR0QVBaUHFuWm9J?=
 =?utf-8?B?TldyMWloYXl6STNtZWs1WDZtVU00N1puSkVpWjJ0MjlFZ3lrUWJ3cW5pSlJu?=
 =?utf-8?B?NzREdHcwN1hHV211ajlncUJsbWVPUHpFaHVwUVJMTUZCK21LcTNSaGxBKzJr?=
 =?utf-8?B?RTFJSzlvNGZFamJjRm5VU1NpUExnS2pkMDhHUk1Tc1htYkxiUFdLT2ZjZXdV?=
 =?utf-8?Q?xJToKwDX1R3QDCbOPDyFLDcqx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792ee75c-5565-4cb0-7e9f-08dbd960d85d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:56:57.4687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/1JSo9jE+4StwlmSxsUcCfskpFudLS7pStQD4mKnCz6Zls+Zh2cTQh/Hrp9e0p43/HrmXhpTlP4/6t1wX5OWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8918

On 23.10.2023 09:22, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



