Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B961755B80C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356244.584347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5igY-000094-6V; Mon, 27 Jun 2022 06:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356244.584347; Mon, 27 Jun 2022 06:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5igY-00005e-3F; Mon, 27 Jun 2022 06:57:26 +0000
Received: by outflank-mailman (input) for mailman id 356244;
 Mon, 27 Jun 2022 06:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5igX-00005Y-4p
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:57:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64851d99-f5e6-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 08:57:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4488.eurprd04.prod.outlook.com (2603:10a6:20b:15::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 06:57:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 06:57:18 +0000
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
X-Inumbo-ID: 64851d99-f5e6-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeGXKaiH3IFBEFxJjV2E3ij3WQdyXFdM90/pvzR4bLTbUUdhAcfUdKcWobVsJ6ahYD5JK/HG4fvZ+rKNWnVJPU//WDK1orBgVzWqBTFP/3l/PoDYZdQ7SbQWFLfRECJ3zAfuV4bxBt0ELPYo0VgAD0QiyD9KFoaI0O9kblqhtz95jMDWPC1ytHlQQvCUzTKTuIBgUbl2KZrv6n1joeq3I0oVvhwB7gBn+EwoXzvSJtPMk1JASXAQT8i5vuV0XnNGZlF75mgh6ZaFW1vz2YxN0xtGvgDy3ShgVE+HwJY6gvhSFzN8biMFjFBH1GHtYu3ukYS0OImJ/wMrxIHXtIboJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DBhxCmD8w9E0mWextSw33DyRZn7iIh2zAv1//e6U30=;
 b=oYzJ222AcK+6NlZJQgKWGAwwsWdKhS+geswlwuE7cVjRFnv38UH4QzOfstrmxDJ/M2aQlF2Fv5VRNMxVn5B2yrSKLdhOqoz7eFnlf0QPgUDq1f4fA9tsoJZSeoUkfuDpA/5je3U2TfGjTKuESasnyZtE9ELrVy/XgVXXYzHCSNuLc1fjBtL62k/FrVZAnia5vMydVwlwAJHl99FqstslKHqWparTJAcU9FzJXuJMhwBffdiMoMqGjYtp+JxSXQ8SfpnMduYKmJZrLU4VovvapCVXdKZHjMVC6P8Z0UR3xIlHYjiyski1LX9xSzbk955uqxb2A3C0Mv9H+w1iGN1NFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DBhxCmD8w9E0mWextSw33DyRZn7iIh2zAv1//e6U30=;
 b=0rYeTntnHHcc4mr1SY7Mc7uTy8AfbR9BrfzWm7azF47cmjsH8B4ni9rzgFBmmYbEIvpZ6it776xfV2FQE+OhMi3jrbl0npOMqZXZMYck2r5ESfH+N/MtbCKtlgco+6q2rEFXcmqQdx6NTLp1K/atDclNFRZGphLJRGMkGA+m6Yxb1/jFXT2dtuWHwO2ldMmv8O5PXjlT4B20TWfvVvij1kZeacAZhV7yYAVFyhygBBNc0gnbSu4qCIM4NOKL7r/zkl3oxVioVVkVb9L5BQIkKkNqok3YmEsZZqbIaCB2AQl8gQELoVX9kfFzhaUF+VKrdluUvoxxl937tYOa8kMh0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d135e1aa-d0bb-8a7a-cb1d-7dc9387f1f24@suse.com>
Date: Mon, 27 Jun 2022 08:57:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] public/io: xs_wire: Allow Xenstore to report EPERM
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220624165151.940-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220624165151.940-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb93aa6c-49cd-490a-6641-08da580a4692
X-MS-TrafficTypeDiagnostic: AM6PR04MB4488:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLymrTz+9xeEMe0gv3UljnLp6P++KBU9y+7TjvwFbvL3Bu2vLaAS4TNf8MmgFiTV1+DvPTsQv8O2C/Hazr1VBf8tvy2XxuM7AY3YZ+wNwIX3wqN3hAm7s5CdbLQaxEKSgsGWEqcxbRT/yakc+/96HfqND11/SRDLbp0GySpY1dKvNTCUahR0q1WJnveOD7ccA4YYXF6os4bRmzkFRC7udGLLNBSJASsJ2eL+plZlfHChzGyJbjzkHEFhQ7yCB3N3JEhMz36quuPeboHLoRTlv4q5jnSjSo6Q2cPjG+UiIqJ1wUEW0O+4aB6e3w+WLEzDdC1SL+kFNUYTJLBspJDuIYfdZyktd/xr+CqqC6kyGUx+UZJh3F+O46eFYQpQo+5RzDlDiegIXt7aGbCMwGy8LLA1km9z0W9/3IXRmNyDyL5Wcn1elo/kOHgWxEE5IugdaxyHauFOHnQ8j5GfGyZi4IyDqm3L8Sa9ibQbXvaAPsk10B1C7a8glSmDgzlBx/LxkJ5AePw3Dq2oi8sdW2diiwVXZ4V3K7/Wq+Znpd4zn7rbBV/dQuqA0uawziALZgIvEwhrkoTHPfX1VI3Vw5pob3BYBocNX8UGMraeuDuGBpGfC/1RQG7f9AsdN5gJly4uAwYaBAy1WycjPKyWIJAZGSVvnGNUI/QPf6eqjbU7sOpAhj/0HIsSfw/RRf9wWr0Z8UxST6ObsBr+fQVO18z1XQUxmz1ilILdAXiq2BiGddTmP2aFZoi9PATv2OVradq/vgPtE7TKlW/L0b+gBD1VHdiZ+jrzzsBi50K5UQy/iDVWbDBwPEhA6igR2SkLx8VrbHQYN6P4TFLwvu5eK32GjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(39850400004)(376002)(346002)(36756003)(31686004)(4326008)(8936002)(5660300002)(4744005)(66556008)(316002)(86362001)(66476007)(6486002)(2906002)(38100700002)(53546011)(478600001)(54906003)(6506007)(66946007)(41300700001)(186003)(6916009)(8676002)(26005)(2616005)(6512007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUNhZHZZanUrQkF1bGtVN3ZTQWl3L3VnaEc4c3VQblZoS3dmWWxVYVdyYkRX?=
 =?utf-8?B?czl0NDE5aXR4Ykh3QVcvUUxFS214bFVzeUUzMU11YVJHajMrVmtTdHZ3KzBN?=
 =?utf-8?B?YzkyOVdBSC9QM2NMZUVhSFYyUVhPNm9OQlUxUW1OaU5CZmRMWWxNWmRST2No?=
 =?utf-8?B?RU9XRjJmcFU1c2VZek9HRDgxTExKcVNBN1M1UzByN2xyNVJVNE16ZTU5d2h6?=
 =?utf-8?B?Tnh2NmZTenJqU2U1STJGWGxtZ212ekwrRUxYazU1Q1BORDNuOGEzL1ZoUWd5?=
 =?utf-8?B?L0FZay9oRGZMRVlOc0cxMmVObzl2ZXVyNTZPUlR5ZkVBdUN4WlgreXdLR20y?=
 =?utf-8?B?OExqSGVSTi9SYUd1anZJL0drSkRtWGZxTnpVclR6UVQ5NC9KY3dJVTM3KzdT?=
 =?utf-8?B?L1VhM2VlZmZJMGw0Q1ZVYnFTZlB2bDJ2VlYwUmIrMFdxeDNQbndvZmRnWTZG?=
 =?utf-8?B?VGluZEpSS05mdjc0RFNCUXlFQTNPYkliRkFLWHllK3YyOGV0ZExtZnpuRkJk?=
 =?utf-8?B?ZnE2TVJNakY1UWJKOFNMY3BXUG1VVEJkdW12VmsreVlib3JCUW4rcWdLZnFY?=
 =?utf-8?B?dDRUR3I3K010WWlSU1l1TlZoUHRxYVczR1VmRmYwODVyM1BOYWgwQ0Q1TmNa?=
 =?utf-8?B?M3hnNUJoblRxd3ppbVdPUERDQWV1ay9sSUZONi92dkl4MWJYamNtd08vc3Uy?=
 =?utf-8?B?b3JWUm9BemIwcjR6NytjeXlIWDJZaVl4emZNSS9KcjZWK3AwSnJ3d2N1R1ll?=
 =?utf-8?B?MWUvRDlXZVJUOGlOVVl0eHpKTjVoNWV4dGJyN2NJbEhtRThLSUpIbkE5cEll?=
 =?utf-8?B?SHIzWW56OGV4dEZlMmo5dVJxb2VoZy9pOVFXUHl2RForV1NabEQ1ODEzeUNh?=
 =?utf-8?B?eUw5QXdlS0VVVWRRNmxlWFBLUDVldmZoN2VxK0piU1BGR0E4dzF4bGRrcTYw?=
 =?utf-8?B?bUdRbk9nNER5RXBodjYwb2xwVkVyeG5hWWYyaVFCTzI1QlBpYW9EbnJUanRB?=
 =?utf-8?B?eWtLS3JYTWVvdWlEZGxIK1ZCc0VOaVdxU0hqZXZSVk5BVlZaT2xVMzU5c2ZY?=
 =?utf-8?B?ejBTeXJEczZtUE1WUFNkRVB3eHdURmp5TlQ0bE5pY3ZEMUR0Zk81NWovL0hm?=
 =?utf-8?B?UEh0dnNYcXk4ZlVGRkgrWFl6WlFhOHZTcndCTHd5b0E4a2dWNGxOaVhHeWxa?=
 =?utf-8?B?dGI3SlJidWJ3R0k2aXdzREw5QktJNHlFanJoTm5acDg0cHVpeGpjQ1pHV1I0?=
 =?utf-8?B?QVFtOEhqMXJ5WUdrU0wyUkxRUDRaTDVEbFk1ZEJYZEhzRkhmTS9JMS9lanIv?=
 =?utf-8?B?L0t5cGZNenZwN1huNXc2bXdsQ3FFbVFoYkpkQTFRV0dFL2Q4eFB2VDJpR2Z3?=
 =?utf-8?B?c1J2dTA4Tjlqai9Td3lwaUIrTVRGOUN3VWYrcGNPNEM5SXN2alJYZHo2dmtz?=
 =?utf-8?B?R0Vzdm0wOWgxNDdTRDhZbFJrRVN6ZThBN3dFVzlUb05sK25nVTh5dzJMSXgz?=
 =?utf-8?B?OGhYb1JVVFdMR3k1Um1pWWphM1VNYUQraUxmakhuS0tLRFhjbTdhWEhGdm5k?=
 =?utf-8?B?V1hHRWNsWi9CbjZxNDZiM0VHUDlwSTVGS3ZCZmJkUDQ0dVBEK0UycHYzTVBs?=
 =?utf-8?B?NFQ4WEpaOGQ1TmZQVGY5dDNFZGFYMHMvcngrTXVBM0lZbkJ1QlY4VitGcGNl?=
 =?utf-8?B?UVhyUzRPRWdJZzRPV08xTkhxV3Vvd012UDk3dG5QTm5iUi9la0h6U0JTcXVJ?=
 =?utf-8?B?bWIwa242aGZ6ZHNCWmNzdlp5SElFTnFDY1ArcnlCWlJOYjY1UFVYR0MrQ2d0?=
 =?utf-8?B?S0xyZGhZRVRxNVNMS1hCNjFaRkF4SHZTdkFGR3FQcWsyVGU1WGtJZW9DNmdz?=
 =?utf-8?B?eHp5cUJFVUdmRlBTWGxwdTFFZ2g5UmxJY0VFblR1VGExaTBxNjJ5MFYvOWI4?=
 =?utf-8?B?aDcrclZ5NUVlM28ycCtyLy9iWTFxRndPOUExQW03WUxSOFRERHJYdHNuMFdo?=
 =?utf-8?B?UlJaVk9yU0ttQTAyTWtZK2RZMzBGMGJkUEdiME5zL0NjY0l3MWpMN25iM0lz?=
 =?utf-8?B?S055eW5xcGJldkRnd2ZIbmpZMCtjQkpndVBLRXNjMlVNYzVVQ3RqcHRQSDBX?=
 =?utf-8?Q?xylc6GjknUGHVL7/3e45gW9Sx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb93aa6c-49cd-490a-6641-08da580a4692
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 06:57:18.4981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XX/EN04ZxRvQ7f1rs1UNWELzKfkkmohX2tLwreyiYKEbjz8SfjdMb2M+kzyk4qEzuPPs2SjS8T2HlmpqHozgcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4488

On 24.06.2022 18:51, Julien Grall wrote:
> --- a/xen/include/public/io/xs_wire.h
> +++ b/xen/include/public/io/xs_wire.h
> @@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
>  __attribute__((unused))
>  #endif
>      = {
> +    XSD_ERROR(EPERM),
>      XSD_ERROR(EINVAL),
>      XSD_ERROR(EACCES),
>      XSD_ERROR(EEXIST),

Inserting ahead of EINVAL looks to break xenstored_core.c:send_error(),
which - legitimately or not - assumes EINVAL to be first.

Jan

