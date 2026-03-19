Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJDUFKYmvGkxtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:39:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B917E2CEF19
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257399.1551803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GOT-0002wV-D4; Thu, 19 Mar 2026 16:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257399.1551803; Thu, 19 Mar 2026 16:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GOT-0002uZ-9w; Thu, 19 Mar 2026 16:38:45 +0000
Received: by outflank-mailman (input) for mailman id 1257399;
 Thu, 19 Mar 2026 16:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3GOS-0002uT-G8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:38:44 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 166fcd2f-23b2-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:38:42 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5035.namprd03.prod.outlook.com (2603:10b6:5:1e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 16:38:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 16:38:38 +0000
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
X-Inumbo-ID: 166fcd2f-23b2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is7baWtADlXZzrNul6b8Wk+zB3rV5NctClJDQxT/5LwQHQjpwX/+2WVBxLiSArLomTm2+BTAuwjxqBlB6Vk389jGkgyVWJd7itY94GpMkOa2zAMJIz+UTWcwgp8YPDmvBGhVi+O/wPSvyAlk+d2+xFiJUsvMX8HFkIu0OXPTZ8O9cLBq7XPtQkVRt2NW8B8sDz9JEI1gNlMpmHWjgkx3wXa5rnoi0ID2MRIjD3TZZNhNG+SU0GtipQOA/MJaLLAF6vvPWVNzzXm7Ja9rQbHHcsw11MADaeD0Zw8qmvwYTEeaJcexygfjVBs9KmHC8beZx6U1g2Esb72Mv8cfawdwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgR34ti4Vj78jjx6affmOqgPQGdNrHTkN731mp2HtO8=;
 b=e1+JwVIxxuH3lCNrSIkDK2LgmvF9biWJLOvSsagkC1ww1K3hMYR7yp+uJpC4v+KehDNCqdY3MQKh6X+1a0HApBugiHcv83dWaxC8LI9DBBLSJvtmJRKd/Fqi0w6N9VxlC5swoZMQU/0em12PptUhEM8b5yb4lDl3/FHcuYIZxWgJFyivoAfxg96A5VDA77Kkqm42+NIMY/zv+jp0C/BTH5LnyD7Pnq2HiByH1Le97bZS+VVmUKRxzS8C+qqHCMeaFpYwzLVCqQ1Ir2WljoyNOJoSgMYOkloR5TxCywRYjd36xJ6m2II7tLDLnwqfZ8o5Gfz+ZwW1oexS9V1CN9cUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgR34ti4Vj78jjx6affmOqgPQGdNrHTkN731mp2HtO8=;
 b=L6igGCZVQE5K7oTXAekDBICkSrRbNh1EX8c5v4q7qq+pDUOcuNu7w7GSYpMwKzLPCD7CwiQFghkR2WETLN2VmB/Y/2DDfh552hY6QPRO+MF9mkmYow7q20jJWa67qTYnIC38l7tXinB7ax3HZVsoTnwHDPTjfvF/Ot8mQTQTT/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a67bbe7c-9c41-43e4-9d28-f5f221c96b95@citrix.com>
Date: Thu, 19 Mar 2026 16:38:35 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-3-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 143cd90e-6646-447f-38a9-08de85d5f8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J4fcapXRcw73TgcUoHDSdhcLYwcBmwNJ+roJNorcsk9yZOJw1ayHd6FZt2jE/lu+upes1pGeANBck5NVHB3E2/4OSqSYRK272gnsqLiRGRQNF45X7G055dsC+va7mANn7AU1basUkeFlxfPTONrAnQXAgllchvGOYOqUqAwF/W1dNk1ufRPZcVrQ7lVrhfWta2CWsS4jhv/CuvdMLQgzZJMTdcniQwvywCxUdxwCzRBqpeFR7Od52K1WlczC1i1Iq+X0qLQOPZFntGrC9fJFXACyjtlPvdrUeyn4x/DTjk+rXoIcuNTF4AD1jUzvRd4hrtgpKZSsnX2LGKWues7z99o8Ez/qC7i7edCFBVdE9oOMcEvPVL3A/5ej+80rJ+eAnsCpQ9WNbYjbfM/yeSILt0hJOxgCtTaiiVl/JE5kf74kFh1YJCoH+D0cTXbn9BQTOtrlxvMmeW87m+4+UgJaNjv8Y/BJ9e+ouWrc9zKB8gMLY2dIm3bOFoWGJu/jotx3C1QQbsdi71Jw7PlmP71NJkoE8HNJxM7Clvee9DSFRG5QTXlZg5Jj3hGs95fos1CsuKgcysQrITNjDhCydkbi5NOtcs3Fe8c8wswB5F7UArscKDmYUvdD2oA5adG7DvVgB7sRv3xJ9kDDosk01qMKCH3Npv26fWKJ6tryJYcQE7XavI8iB21JDDwTk1uerL1PPwZdzZgLVu2fkDzh58eLDcrmdb0IQU/ydawa9KjXCMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3ZrbjVyWk9UcW8vVTJaajhCekdma0swNTZGU2ovemQ0eXZCdENKRGIxMmtK?=
 =?utf-8?B?YW9Lc3NhUEtxSUVHWFJkdUd5dzBZeWhlUTBXbFlIeXo1amw4OXpsV2M3VGc0?=
 =?utf-8?B?SmthbU1LRTRRdzgxSmdmOUJETG9MdUpzOW5JQU1vVGgxT25Hc2lSVjNYQi9R?=
 =?utf-8?B?SDVkMXdFUXdyTzl2M3J6OUdXclgrTmNqdDQ2WFg1bEpCbDRMNTZCNlZ6RjAy?=
 =?utf-8?B?bDk0N1JwaUw0ek1SQTRtV3JCaCtZT2RERHZJZUxVNmd4a01CeUtGYkV6Nmp4?=
 =?utf-8?B?cVBNMnhNNTg3SWdabk5kNTVmUGxFdmg4aWJMM09ZMEtPVGw5REd1cVRYSFhT?=
 =?utf-8?B?RnQ5bGprYi9FZ2ROamdvWllxSHl5dGo3K3FNc1VOc0NGeTNZeXd2eEp5aFFE?=
 =?utf-8?B?SDVMMjNUZ04rOU1JUWhTRUU5Z3JRcjFrRUxRK0R4bEIwenNEVkNHV2hxb0pm?=
 =?utf-8?B?VVI1SnFhRkpOV25FcDJhNDhWNUFVU21xLzZCTlR1Z1hPcGhsUHpEaW1uUHZ3?=
 =?utf-8?B?N20vMWgzWXNGVE12UFphMU1adVUrSHo0ZElTM3daVHk2MHArbFRIUGcrcGJl?=
 =?utf-8?B?c1MvQUl5Z0txN0daeWhVR2tQbzJNOGNiOUxlUU14QXQ0aFlBNEY5ODBKOFNx?=
 =?utf-8?B?NENoQlJ2YzBMSkVtVkRjaVFjaUg1blJmd0o3V1hDYVZDcHdnZnl5c0NsWGJF?=
 =?utf-8?B?bEY5U1laK01FakJ4Nk1OcXVXV3FvRnRwa0FXSUdSQUpaUmJqTUt5T2grL0NT?=
 =?utf-8?B?RkFOUWVJYkQrblQ0KzVrNXJqUTl6cFZjQTlzU1kraFp6Q3orK2Ryc1Z4WWZi?=
 =?utf-8?B?Z1RJdFhZV3p1dEM3SDlXZU0vOE5wQ2hzdEtWWHZjenFFa1UrSWF0QTJld0po?=
 =?utf-8?B?Ulg5bkhqeWE3OW1SZEZneklsVGV0TUl2Kyt0TFpXQ2tKbk9Zckx5SDZqOUZF?=
 =?utf-8?B?cm4rNGNtVEsrV2lxQ3c0a1JSc2NwaER3akoxcXg3V2VkUENqSmpTUzJ4RWNR?=
 =?utf-8?B?RXEyS0VvT2dZcHVUTWMwR2s0MUIyZE9makx6K0QybU8rdDNYUlJkc2JSbUEx?=
 =?utf-8?B?aHh5M3ZZaEdxM3RVckhma2VXdEM0aFIzV2I4SHFpeDB6ZjlNWnJpbG5Kdldk?=
 =?utf-8?B?ZTFrc1N6MFhjZ002cXY3SUpwaDR1QWt5MzJ6NGUrVDg3L2o2bjJkL2p4U2h1?=
 =?utf-8?B?bnk1QlpFRHhIRi9GemhmSUxYZTFab0kwMnQ0YkNVK05RQnN5cWdWd2NYLzNE?=
 =?utf-8?B?cVZpS2E5bXNZc3NMbVdreUs4UzYwc1p6NDVSY21pR1NiOXlFUDRFaW9RSXFQ?=
 =?utf-8?B?Vy9CSWxPVVZEVUhzZzNBdTdiM3RNdWlsT1BoY0FJTDFzRnBwRm1oUGJuUGNu?=
 =?utf-8?B?VUFLTHZoeThheDhIMkM2eDQ2WTdkN0k0eUtFbCtxWk44OFZjRHlzamw4WTVL?=
 =?utf-8?B?SExKWHB6SUNCRWlsT3pNWStNeHFqc21qQzExRG5nUWZzKytPRG5TT2toRi9J?=
 =?utf-8?B?S3BoOGhYMFdRanZGUDFiTDAwMmRrdnZZcjYzR1VFK29kU1JseHdwK0tKcEdm?=
 =?utf-8?B?cll1NEFySmlpclJtdE91clpoajFrRnZ2OC9hR0dHVVpaVHhlRWFseitXaTEr?=
 =?utf-8?B?L3c0eHNFQWhSbGlqTjJCd2dWMEdacGhlQ2NZbDI3OFdUQkg4TjZ2UVMyQ2xa?=
 =?utf-8?B?VHVyUnZISFY4M0cvbFBZb2tLZ3NsM1dtSEVPbDJtQ1hkZ3pSVWFKQm9Wb2xn?=
 =?utf-8?B?MHB5VkNSRWtYS0d4RFozblk3LzlxZEZYYUtWM3EyUFlpM0FQTFpMUWJ3SkF1?=
 =?utf-8?B?K2JHcVJBVmVVNW05TXBiRDVueWxlN3F5Zy9qYlNwSjVsRnNXZHhXUnlwVjJv?=
 =?utf-8?B?LzllVWhqaUlrSStvUDdicHpJUk9DemNQVU5VSEFIZEdVbEJMRlI3YWcrRzVv?=
 =?utf-8?B?dWc0KzMzQ1Z1d0dHajkrRnNnay9ZRTUxTkRWRnZUb0ZKaU5RQmhGMDd1K2s1?=
 =?utf-8?B?TmR4OGs1WjJIQ1F0Z0t4M0FUc3R4SWlQNEI4MDFtb3RmdkFkMW1MaG9TOTVH?=
 =?utf-8?B?c3VRc3ZlcnlTL0ZseWxLeCtsTjBmNHlOd1FrQWVXR0hGZyszbXFyTEZhVVlZ?=
 =?utf-8?B?TlBqRlAyRXZzZEpOeCs3VHVPRlpkNGdUeVdzbkhiNFBQelc0eWYxLzd1VVJU?=
 =?utf-8?B?MVV5SGxrUW5FRG1mNDNUMjEyUGg1MWVMbENHSmpYQVFlc3Z5QzdJbWllQkhG?=
 =?utf-8?B?ZXlIakpwTXdtd0VKMXVTNlh2VTlMR2VQK2lDd01MSk9zSFNyQU1KVTNaYnFU?=
 =?utf-8?B?eDRNdGVhNGJUaEQwNkx1eEk0SzRXQzg5ellCbDJwcEZQQWtGcnR3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143cd90e-6646-447f-38a9-08de85d5f8f3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:38:38.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTFpdH+GVk8Mtnte1rNpoGIVSfehuoeiZNjJa/C6NXAg63emXJnGT9tjB3OGjBS63K+NVndObspXMFy/WJHc3xyaDa0RYh0hVt2LzwM/G2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5035
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B917E2CEF19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> Remove lazy FPU support from the VMX code since fully_eager_fpu is now
> always true.
>
> No functional change intended.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  xen/arch/x86/hvm/vmx/vmcs.c             |  8 +--
>  xen/arch/x86/hvm/vmx/vmx.c              | 70 +------------------------
>  xen/arch/x86/hvm/vmx/vvmx.c             | 15 +-----
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 -
>  4 files changed, 5 insertions(+), 90 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index c2e7f9aed39f..8e52ef4d497a 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1247,10 +1247,7 @@ static int construct_vmcs(struct vcpu *v)
>      __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
>  
>      /* Host control registers. */
> -    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
> -    if ( !v->arch.fully_eager_fpu )
> -        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
> -    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
> +    __vmwrite(HOST_CR0, read_cr0());

(Not for this patch) but I'm pretty sure there's room to optimise this
further.

CR0 should be constant, both here and in SVM.  Reading the active cr0 is
an example of the anti-pattern we need to purge to make nested-virt work
better.

~Andrew

