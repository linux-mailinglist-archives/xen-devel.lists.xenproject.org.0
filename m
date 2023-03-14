Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061576B98D2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 16:18:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509715.786020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6PZ-0001fe-58; Tue, 14 Mar 2023 15:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509715.786020; Tue, 14 Mar 2023 15:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6PZ-0001dC-2A; Tue, 14 Mar 2023 15:18:01 +0000
Received: by outflank-mailman (input) for mailman id 509715;
 Tue, 14 Mar 2023 15:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc6PX-0001d6-47
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 15:17:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66071c8d-c27b-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 16:17:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:17:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:17:55 +0000
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
X-Inumbo-ID: 66071c8d-c27b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0ZOx5Fk4Z3zIRYRqMREa5jIQeGCrs+utzcwLrTeYaGIhEOfiQAyFhewqJDogSnx37/GTay2y9UjWHJS+M0Af0BrxGKE6eWa+Om+dNKFd706KcA/aydLXsXkCHib4ArNii4tOznaMjaNlw28hGiH6OpaIuARTVmjegZCk2G2u0VYuo9mk3ZpGadQxL75weyuwgCk2bDubnBabl4DvrVk1Wt79tWgQEssl4PDzlFTzU7e2dhbzRsp+NoCeBYh8mSk7lv0OHOLdEkm+21yKBOkLQfCrIp4cB888i5hSa9T2jIuLt+0McP9l/llvpGJCtc1ldfyVNeVZcSnjGZrpwtwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP0CLX1VKiNTtvd2FwtZNWTNqLghbjIrJm1d0BFUvCQ=;
 b=BQ4wfvaO+0zX++MJOuSeIaQZm3WL1HorwTG34tycyMRcGTOuaW6+fwJ3gaJmkd/YGb/i9Kz49ut6vEgrGRKMStgDLRA8nWaGeOKvcPuxCaFh8MSRi+MPr/zr947WTLCINSzM941BB207s9uvumGLi/T4MApoJGEcOGr3L15+qC5RQ1oXGZXEtJhNzbgPxqKt5bIA6j0LDn4o5w05gOtj0G3zTOL88Q5QQMYiI7h4Zz2J7v1/KBohs5eIG6bo8Yc3t6iV4a7H2LMhhlHHVRBgmSgueqhu9B/6rSDsX+nZC/tsxfLTtJpXUXfArYMtjaeQmH3MTgMJ2VSIbV76vlD8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP0CLX1VKiNTtvd2FwtZNWTNqLghbjIrJm1d0BFUvCQ=;
 b=EekPpaMQSVxvbE9EcXjuKV/g1/fypveOIj6Uf8iZS4QWmn4+2hpCVDi7tEEpsLmqZWbfD915yIPiAra1XGz5k1ssJYEJlQYdzrv7LxvBtHMAYbvXK1KvIULQqI/s1ryA1q3vQx/eVOTdxWaMmTQdDtku+Zc51LbV3fEX91YawJNLYy9mf3TrLSIbqwqKOvW2GHRQNWdw1Pp1n4wPkHmfMikdkf5ksn47QYDfT3xl1F1XmCPUEDnbMhOfpDROHdpFVxVSxeygncUorUUqhhOS5f1p0RNswkDQA93NidSBsLu+5USLAezYJ/uLgOjv+ziMPcFMNBNJHff0arlbZi7GZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
Date: Tue, 14 Mar 2023 16:17:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230314142749.8845-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314142749.8845-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f6546b-37dc-45f6-4be2-08db249f4941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wZTVm6KvWnkRxmkyLKfdFkeoDcXxyvKtG0ikvuW5WV8W244B27DSugfzuBVxbusqa/qEDXlF6Da5J5Fy5ovXrANFcbszQPwwotRE4qe322c8+6aKj0hbE1a/MC+Ccke6zQlmQ3mGc921qU+PMvMG/KOyVJsPI3uuuDDr2yxiq65PZmmEXvJ/92c3P/+wSZTZZSbZrp4sbygJBXejcPZxxKLHGVeyHt7fJtX/N48eHFmtHN0B0Mhd7vORBrxxWiXw2zOsB4M24KIR6QQGXdBaDmTlpB23dwtiZ02nO2Y7lSzkTYcos4xZRV2e9qgsFi8Mn0oZYf+f52N3of0IiYF7FsQO5ssliVqyTUDGbWqXNd0L2gpxJyPe8BZ4FWDXDcc9m7i6jhAQ0mbakmoI40bYTLai8Hcz80J8esDKcxCIYjIThmIvK4YURiHrYBbn5Zu3hOrxLQ/t8Gfe7HTDu7PKMKpJQOV1g0zf3LXi0lZQ81E9A3LhZGOA+YgD/hiAMTFp1je3FsM8Bbj++DVA0yJYUlNxGZzsD7Lw8hu7AZnYiV8YyTc5bEFBwv7i09Ms6pJr2k87uBn3Xzn00XOLnfozWW7wQga7Zl550ldKJ3xBRIHGB41H2yoPi92wR+NhTShwPwDCa/T2SGmV4ucnY378m4AlqT4bO670RlyoI8Lv1pGYPpqbvjSboezzZNJib6bZIbl0ZpdW4rRHM3WdXPtr6935ekJb8FrLyhCxm6cUTxmVTM9/NWT3WQTEwnKyxOLj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199018)(38100700002)(2616005)(6486002)(2906002)(31686004)(53546011)(6506007)(26005)(6512007)(186003)(316002)(41300700001)(478600001)(83380400001)(54906003)(8936002)(66556008)(66946007)(31696002)(4326008)(6916009)(8676002)(66476007)(5660300002)(36756003)(86362001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE5lRi82OUc3Ylk3L1g4d3lKQ081K21uV3lVS0E0RTVNQUJyVG45SjNHbVVC?=
 =?utf-8?B?bTBPLzRRbTNOVXVBdHBESWMyZC9QRVJQRFpZLzZvREk5MFVmMzRkcGdydHpZ?=
 =?utf-8?B?VVRQTE0vSm1LZ0VhR3JzeXkwNVI2Q3l5cnhMbS9NTEExNlNDR1l6S2Y5b3Jh?=
 =?utf-8?B?TjFrTEJmT0lFaDBLa0dEZ3UwSGxGS1JvMVh2aFFCRjg4eCtvVnE3WkcxaTk3?=
 =?utf-8?B?VWd1UmFFMGVUVWVsdkxpZVpkcXFEb3FFdjkvZWpLcXVUL1d3aEZ0NXFza3ZZ?=
 =?utf-8?B?dkxUTFl6Q2lzaGVBOXNSdDFWdTB0N3NQS1NIMGhpS2hEcjJOQ3liVlYwSGlr?=
 =?utf-8?B?dDZaVUhTY2Z4YlNDeFI1UnRrUnVVd25YVk9YWlJFbTV5am0ySjc5cEJqZjM0?=
 =?utf-8?B?OEI3Y0lmb2hwUVhHSnZGS2xwa2Mya081bnRkRVdLUldqZ2J3ZFA1MjgrSWJn?=
 =?utf-8?B?c0NMS0ZIeEEwTGVEK0pmVVk2QTBFOEZlRVV3ZUwzSndjaG1wYWF1QjZ1ZFBu?=
 =?utf-8?B?c0M0VWtSY2pKdGVzZE54ekNwZW1yN0JVTnRpb1p1ZGVmMmZoR0JBdWN6aSt4?=
 =?utf-8?B?Y3hHUzEvdGExSEIybGxQN3Q5NVB1T0lkRDB3OE1VOXV3WXVjMUYrVXFZMnBP?=
 =?utf-8?B?NWRKS0t6VkM1ejc5ZkFLdHoveVpoQzRNU3VtOU1PUFRpSnNkR0RSVXRzdWZx?=
 =?utf-8?B?SXppdk5JQ3A2WUgyR0l2b0U4Z0FwQmFHT2ZEQmNDaS96eFZ3VlplczRQYUVo?=
 =?utf-8?B?ZEtTRm93dzVYT2Y4bm1xcm1yQU95QVJaaHVOcEdpSDYxT0s2WGFaQjNQaXhZ?=
 =?utf-8?B?V0NYSWZGc0NSVTVYa3ZCNXoxV3lCeXhGOXI4QXR6ZHRCMFZjNEwxTjc2V0pG?=
 =?utf-8?B?eEkzeWdDUkZGb3U0WTNUWU5MeEVmL25LRENmaFJKZmZWblN4aE1WaVNEajF0?=
 =?utf-8?B?YmMyS1NDQzd6eForQVFCL1c5cjlGS1pidkE4S09CV0xqOGhOTEYxa3dCaWgx?=
 =?utf-8?B?U2J1eDZmSjFxdmZyanB6U3JYOHF4Q3BUbTN5blB1SDZsb0VXYkV0WjF1WnBG?=
 =?utf-8?B?OTZpNmEzdUIxOTc2bXk1KzJGRTN4RGdnb3AyUkw3Ui9DZGhFb3hkbUlqQ3lQ?=
 =?utf-8?B?ekttdW1lcUo5WlZ3ekxtVzFWaTArbU5nRjBGV25nYzNNUWpVOGlJbjZHL3J1?=
 =?utf-8?B?YzFDN3VhcGdDeERkazUwbDF5TjNsc090emRnbnpSc0FRSEVXY0RQSmVpNlVN?=
 =?utf-8?B?RWlxb1BPTmF2Y2xkTHZDLzhIcmpHYS9EWDJHVnBiUVpkeHhMb3JGdStTTWpT?=
 =?utf-8?B?MHNjRC9YSXRTdmhrUlpGdTkzdzFIMThhUzArV1MxSXdVcHFqU1o4N2I4Qnpq?=
 =?utf-8?B?SWk1YXFQV2p3S1VjN2JXK3ZhWWhJZDVVbHBoRFVPOEM1VGpHWEZsV3dSajM2?=
 =?utf-8?B?czVVNjk3ZkRGTzZ3eWQvT2xCNGFwZDFvQnNaMlllM1BEZEJQRk5kM0FSblNi?=
 =?utf-8?B?RUJpdG5pc04rOTAzRCtMVUlOYzFxV2ZpdUdBQS9XSFV0MVlQL1hXVGx2a0xm?=
 =?utf-8?B?cEVyVVVoaVRGK1FwWm9JU1FMNXVHalhDNHFBYW8ydm0yTDJCeFpEaXZEb29I?=
 =?utf-8?B?ZXAzeXdiRU80dG83UkN4Zy9ib2xyN01zdGhGbDlOWHR1bUllYk9xb1d5ZHFX?=
 =?utf-8?B?eUZYR216NENUalV1TTBtY0FJNFBZM1pSdGFLMmhWTDJNTE9TRm5TQkpDekFm?=
 =?utf-8?B?OVdnZFEzdmpCcjlaTFl0VXdnK3VoZHdZZysyT0pqZ1grYmYvVWRtZzl2VEhD?=
 =?utf-8?B?dW9DdzN3M1RtTm1wblNiUm5RWjRrMmwwcTZ5R0Iwc3NUZ29ENTFjNHFlcjRM?=
 =?utf-8?B?Z0NSdHdwMERibC9mVVBuYlhNTzNQUDlzVTY3djBzNDRwcFdCZUFoKzR4RDcx?=
 =?utf-8?B?UENxSitzQ283M0tLSFRLSWhLSm5peXdIaVV2Qmg2Qno0TkZkSUZTb0cwTTdS?=
 =?utf-8?B?Nmk0bGQ2R1NrSnpUekJtZW55K0NSSkJ6WGxwUUd3bWwzZjdPNUNZMTdQSHhN?=
 =?utf-8?B?NjYyVWpnenFrbzdycjJTcUNrVkpQN1FNVVdoZ2dWRTN4Q0c1b1dUTVdSMGRt?=
 =?utf-8?Q?qNLlXLB9wwllJVGde2HvqYYXc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f6546b-37dc-45f6-4be2-08db249f4941
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:17:55.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHuwopSY3a+4JGPHZ6q4wDGBCUfEiOBwonHelKi2WWwPPzlBPsS6zUtLZyhsORMF7DGJjpFvsi9xxOu2jGPY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

On 14.03.2023 15:27, Michal Orzel wrote:
> At the moment, we direct serial input to hardware domain by default.
> This does not make any sense when running in true dom0less mode, since
> such domain does not exist. As a result, users wishing to write to
> an emulated UART of a domU are always forced to execute CTRL-AAA first.
> The same issue is when rotating among serial inputs, where we always
> have to go through hardware domain case.
> 
> Modify switch_serial_input() so that, if there is no hardware domain
> (i.e. true dom0less case) and console_rx is 1 (i.e. input to hwdom),
> we skip it and move to the next serial input.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Makes sense, but I think there are more things to consider.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>      else
>      {
>          console_rx++;
> +
> +        /*
> +         * Skip switching serial input to hardware domain if it does not exist
> +         * (i.e. true dom0less mode).
> +         */
> +        if ( !hardware_domain && (console_rx == 1) )
> +            console_rx++;

The consumers of this variable aren't really serialized with this
updating. That's probably okay-ish prior to your change, but now
there can be two updates in rapid succession. I think it would be
better if the variable was written only once here.

>          printk("*** Serial input to DOM%d", console_rx - 1);

When invoked from console_endboot() this will now switch to Dom1,
i.e. that domain becomes kind of "preferred", which I think is
wrong. Instead I think in such a case we should direct input to
Xen by default.

And then I have a question about Dom<N> lifetime in dom0less: Can
such domains be short-lived? If yes, what you do here for Dom0
would likely want generalizing, to skip any domain that doesn't
exist (anymore).

Jan

