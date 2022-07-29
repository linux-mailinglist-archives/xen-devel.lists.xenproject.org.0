Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95005584BB8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 08:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377323.610481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJS2-0004Ud-OK; Fri, 29 Jul 2022 06:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377323.610481; Fri, 29 Jul 2022 06:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJS2-0004Sm-LT; Fri, 29 Jul 2022 06:26:22 +0000
Received: by outflank-mailman (input) for mailman id 377323;
 Fri, 29 Jul 2022 06:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oHJS1-0004Se-9N
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 06:26:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c19360c-0f07-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 08:26:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB2988.eurprd04.prod.outlook.com (2603:10a6:7:1e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Fri, 29 Jul
 2022 06:26:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 06:26:18 +0000
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
X-Inumbo-ID: 5c19360c-0f07-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMMiP9mTyYza4c4sbXusG4MT3SnNm8+WuI4JmDj1mNHm6bpeZVVtzMxaLZU+A2qmGLPK7o2d+dX0idEi9+6BgCvxrZKnTFj9Fu8CrMfqsV3xA3pTB6MHyhv3KzpV7UM9u56VDRxzVWWySVckY5xYNSe7VQCaB9X0JcvLqfgc9FYX9nQFbgk35ita0fMbYa993Z4BmwZxgUo5MSEyF0AhOIk2kXfULURB9ENZFZxMrNjzeMTeUQF/ZEg5dVsWIX3i8Av/T5ursfYJPasjtGNVkLaEGwVqVaaZ5cuquklPPSIDrMUqZGkIruRg0De+anDSnoh2fRVpGAFMfrVzQX+pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBBSuU4xfU+gyIFGQY9nTp5nRAfNW1b24aKWveF/5ys=;
 b=Zq/jrUWicRIWtHPyaENQNCVwYB7VJRwJBQcvlvgokEDwQZgDepGMFbseD694Uy7guT9pAyqwNgPuGGwPEZrGi+dNRUUZhsaCTJwZfVp3IPIUFPNAdDW6AiSihtkEoH+m+mxOzPA5t162dKZzi2eVf4Viz9QhGb3hL2BpuhAioOQcb+uCMvx1z4bAQIMnQEAc21RJuEphDVnt3rtZTRgrU7de91vJlcFkS4x7mAdHc4nN7nHxN4l3O6lhtjvjcC0JoYYt5pN9Ig/Exz6oWWB7aGPDbtTwDTkxeVA8hSPGzvQeTP1NwMkwET57Gyy+jnBPrrBEG/ttCeb5zuQIORAu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBBSuU4xfU+gyIFGQY9nTp5nRAfNW1b24aKWveF/5ys=;
 b=nvgfBTN9ErMWHj1HR6zANY9FdjfTVDZySszAhEP5cY+LdnmRXTN9xCUKWeKXl9fHKeLqNGP4qR4uyHKcc37RJhLOWP+m+Vej2hGrGWack5+7XXf8th7pzzua99d9zpPLGwJT0nFilJq2f+EgnePII9lqApleC8Fj7v6BRYu8P+rpuQp0u8FC/CrCAQI/lB0iR8jS+Pv05EtJZ6xlzymiDQC+x03R+4dk/wxfGk6EX2JNs/BLMDu9eAXmZBGtsF7BHsAQun/tNcZI9Nz8rl+1WzRd+gIl1sYG+v1kV7/iK7ekpk1aDAPNrHlBuQUtZJCyPTQIx1kwVQlWmufpfWzrzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
Date: Fri, 29 Jul 2022 08:26:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728162151.1228747-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220728162151.1228747-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60ba7da4-9b3b-4583-9b9c-08da712b3f01
X-MS-TrafficTypeDiagnostic: HE1PR04MB2988:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CueqHDw841IjgqA6YRMr1Wwx9LxsUtzawpERNhgZ7PK8+lmdHSLdRfXEglOiOugL/hK6T145Ph+g2vRDu1lDP+1ci/Gn0zY9gZKcGoo4cDpBxwiKP//eL59lRmJ+Q9C9B/kiGXQvchlX9oSWX7JDknvIFEYogGRLAxJDlN2DDVqzDrpZp/fc+68eCT9W+b04ix2p2yMI/XaXLOQSOM2heawefh1GmcV6hVQOCm+EAA0f1Q91FwKok/LSLE3kzO0gAmEhNNuvrwl2OzwAF3Eez2FLfpcOdfLFXBXGG1LXq/1rB9SvT/1U3Ze8OL5ivZu3gXslW2UwQ4yNLbb3ebzs6Zj4WoxIK2Ax1rkdSE6vQpieJfTDcAmIj51JoFy8jAQrR5QRH/ghbltEczFLm1LpI5mECf4EwfNa1rqvJlYoDfT3Aj7ErWmXRfuKqu/WOV8ru0fFXR3bRRu4mzbev5AwrZ9CtqID+D36yvH4u0YP1vTcqZbkH/ovbjypaFysUeg/7bcSH84WgM9l2WHIs5WjcR7mo5Y4VQUSHT8g4aP+qWWhhwwRw2JYhO21BSfKi79kxmnMEo7Eek0rUAgaNKV5tOti+GOu846m61cRQbYAmlZnqE7LV5yF0pm1ErdQTd5O9TZNU6LM3Wio7GkGA5HH0NWgo3V6l2y34QBFBKOjl+xw0b/ckMzXGpEdQ0gjVeStp1pJSa9otVNWf6TRm+qAAHgo213V3IUsS71wudmEd0TD/3JB2wXkxLTdttn84cOzRKdpTtVPbmue26mjQWB4AwqXMRGuSe8a7LaqAmm4lAVmWjgzGB6K5bSNgsIrzBgn+prXdBfYBwF6p0yvWDqatg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(346002)(376002)(366004)(36756003)(8936002)(6916009)(2616005)(41300700001)(2906002)(38100700002)(31686004)(26005)(66476007)(6512007)(6486002)(478600001)(66556008)(66946007)(4326008)(8676002)(6506007)(4744005)(53546011)(54906003)(86362001)(5660300002)(316002)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d011VEJESUJvV2sxNVZFWUJTOVBkeU52YUVMdytGMVEzZC91YTdtcWJnYUY5?=
 =?utf-8?B?Y3ZJOEVoUG5tN0ZYWmZnbncxUy9ETmJIZGJnTTdRYWV2dzI5Ymlvc0hrRGpZ?=
 =?utf-8?B?elN6Wmc5ZUtDU0lmV0Vjd1pCa21sNmR1TnJaYy90L204bjdabUIzYmVZc2RT?=
 =?utf-8?B?bDJveFkyaGZ5bUt5VVN0Y1hRb01KZ3kzNmJCRXRkQmFYRm56NzFsbktLTmNn?=
 =?utf-8?B?MkZHR1ZvVE9LdXkrVWdIQTdocXBabXRqUmJCcHdTQWJwdVBCbmp3eWNMVGNZ?=
 =?utf-8?B?SjdUU0hJWjNvZE5CV242b3JmNitPSE1sR1I3UzBVcmFtN3RTQlNCd0plWHBT?=
 =?utf-8?B?T3hZbmF6TFJzZzRBbXpVOWE2TWxtbFlFTUk0L3B3cEo3Rm4vTGJtV1pEelpU?=
 =?utf-8?B?YnAzV2JqekpEMU9Rcm9TTG1HSzJtaGVKQXRMSUd3OE9MZWt4c0Naa1ZWak9x?=
 =?utf-8?B?MTFYRy85N0NTak5OSDZzN0lFNHhsKytOVlVZc0MzVE80ZEczcktXQ2Z3OEIw?=
 =?utf-8?B?ZEZUa2E1UnhzTjZRMnhpWmJhSStQUGlId1IwZzlFai9rbENWUFhpYmc0bFk0?=
 =?utf-8?B?TXZHaWQrMUxEYWdBU0NzMklaUXJZRGpIQmY1ZG85dHBxWkRXZ1VhZXdsZm9t?=
 =?utf-8?B?RUtEUUhnTFFiaVVNaHFqeG1NQmQ3MlQvVjlaZGFUZDBQWGZyVmtHMHAzWHBo?=
 =?utf-8?B?a0FGSTRCUWJ6Y1VJLytQaDdpL2M4VFRZNkJycDIvSFJac2V6c1oyNUxGV0gx?=
 =?utf-8?B?eUtJK1E3VGd4M1Nzb2RjbWxWV3g5cEl3NkdwcTliZ2VFYm5tOEdCMU12dnBz?=
 =?utf-8?B?Q3NWNHpnQ0hQREM4Vk1IbWs2Y1diWWgweWFWOXJCbmFMOEZXcVlmanRqY1BX?=
 =?utf-8?B?U1NZeElsNjc3TDlXelpMNmJydTZ3Q2xvNjVvY0RDQnBad0xKYmRRNDA2VkN0?=
 =?utf-8?B?cWpIVjhQQnFWMXhLTG9tSUFPVFBiUXhhTVlHbk1EUVkyN3c5NFlZcFQ3VC80?=
 =?utf-8?B?MkljWHg5bFFmYllxNXRONy9iMlI2QnR5L1BmbDByaXdjRFZpM0JlRXc4Y0x4?=
 =?utf-8?B?RzNqN0RwdGVRTFBZNHIrMTBOSHlwWWRCdmQ2RUM3bktncHQ3K1VBa3Fza0Z4?=
 =?utf-8?B?Lzg4YnZjYmc2amFndGRqQjVqcmN2Snp6bGUxZU4zUkRQbi96MW9kR2VXUUE2?=
 =?utf-8?B?WFY4dXo5aUFNbUdnMUk2eFFwK0ROOXM4VVlRM1A4YjVKNFRjUVVNTDBvVGNB?=
 =?utf-8?B?aDlOVVUzVi9sYnVPUGJOV2ZGNFgvOWIrek9yUXU2QU02R25rRTFEZTViejB5?=
 =?utf-8?B?SmVHbjNRQXAwK0FMMEltdzVhSmJVek5PbExKNC9oUzZWKzRVbEdDM2VZY1RY?=
 =?utf-8?B?OCt3NThya0tEZ2tDcmdqNk5GY3FVaXlUKzV6TFZlU1QvRG94MlliM0Q5TUxO?=
 =?utf-8?B?TnlyelB6Snl2cncwZy9PU1FpYk5hUHRpdmQzdVplN0lnRnhycy9TcTdjOFcz?=
 =?utf-8?B?RklwejFreUZoTFVOSHNxOHJXNUZ6ek5yTWZ6M3JqY0tiK0ZFc3BEaVJ3VjBC?=
 =?utf-8?B?OEZTMVQ0M1psdjF2dDZTU0RRZk01SXpuZjNWNGowMkFoRTI0cjBpYVU0akVQ?=
 =?utf-8?B?dmIrcGk4b05QeC9BR0JVdGw4NWswekRlazFlYXk4Wkt0UmJka3ZFQy9LRDA3?=
 =?utf-8?B?a2dFem5TVndjL3ZkcHdla25RYzlpb25ERnJzSFdQMlp1L3A0VndNbGRCczIw?=
 =?utf-8?B?aEVta2hNMHk5ek1RTUlIUjg5eGxsV3NQM0dnRW5jS1l0eWdGckN0dkhuZmFL?=
 =?utf-8?B?akk4elAzM1JHMHJyZmVFYmRhSFl0YWlzQXhSK1NvZ2VIMUxpcEFQZ0xRNkVv?=
 =?utf-8?B?eXg0NUZzeFVXOHIwek0yRVhucC9peXpsd3VPZWN6T0pmNXdDS3hZbkVxb0Jo?=
 =?utf-8?B?ak9PR0hLM09oS0Q2aTI2ZERRdlphWGNmWmF3QU9IME50anFzMWhwSi8xTSsr?=
 =?utf-8?B?Vmx6cThqWHRudEE5ajl5S0U0TlJMc0dwZEpqSis1aXZOODcydjdxTGdhUjJ5?=
 =?utf-8?B?OHZuR09BZU5VMTg0TDVLNUtZeXZ3QjFveFNiTzNrTkRKZ2pncGdyeFI4SnUr?=
 =?utf-8?Q?tVE4oPLfWqe27zJW0cz+KeSQI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ba7da4-9b3b-4583-9b9c-08da712b3f01
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 06:26:18.2823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jv8ZNc9X5x8Ua/BHwbuM2Oo4RtpLdiDzw83FBCiJ29yWAVQVFKmKab2cNmW+MpHd6Yqb4zY/t4R5+lTmOwlgng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2988

On 28.07.2022 18:21, Xenia Ragiadakou wrote:
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -63,7 +63,7 @@ static void do_idle(void)
>      rcu_idle_exit(cpu);
>  }
>  
> -void idle_loop(void)
> +static void idle_loop(void)

While you're adding "noreturn" below, shouldn't this one be marked so
as well? Preferably with the addition:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

