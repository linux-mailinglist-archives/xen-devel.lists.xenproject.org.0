Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2D77283F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578575.906138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1cC-0003KH-1n; Mon, 07 Aug 2023 14:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578575.906138; Mon, 07 Aug 2023 14:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1cB-0003IH-V3; Mon, 07 Aug 2023 14:53:47 +0000
Received: by outflank-mailman (input) for mailman id 578575;
 Mon, 07 Aug 2023 14:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1cA-0003IB-C6
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:53:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3478dd4c-3532-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:53:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 14:53:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:53:41 +0000
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
X-Inumbo-ID: 3478dd4c-3532-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UetFXkql8vaSB/0repBN/1hkv2tY2y//HXuoTZ+Hqg0NEsXjgwi4ZxJ+KickBvIakYbBKqg7Pp1TaRjJ5adZ63aziW5m1A6pPfZT5mo2kdISGreGmpPmKARY4tKCfu7sOxLQvE6XVkN2NMxc+Jadqb5NQnhQaIv89uuKTlBO4NOLQC0n2Rv35JY1OR8/JG9gXhA2fi/o+uIGTCwZcCD2gE6WakZeexS5cZW/a6D1dnPGzOLBtPuyvZ6U5Vdgaex2DaJQjZ0evnHMiD8lv8bP++LTdUYoI+8TOE3q3HnDZXUz4IFA1P5IcnE3IBTu/BOBm/HvYtmMjhdc1qOnlE44+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3GqZMkYaiPIMpUv/+jU5lovX5ftrYTCcTrwCIvzZao=;
 b=gP5t0JBchPjnFMOlsMfpTfcMOILGzvWX3yxwCvl88jwI6VXLz/yldkOcngwsE8FIHEJyKa7iugz+LFHIq2UNfeabFiI5+54xYcCMiRID8gsm2vo0Pb7wMUYEy7ktgDPKKgrtP1DemByvXi9q4Buy6AsTA1Omw2l1nrmRTQj2cf5gUdlX9Uw3jhwhXcTmh06X5K5kXDQpASJ8Jk7xa7mPt3voIkT7u7LpPNeulUuafF6dKQs3ipUOhQ9IEiWpBqNX1b3lS9SjQkgG0i8qoPMGG8lFo1X+fBROfoMhIOtZk+3c+mMcdVrXV1KbReB/CbocUbo5Z/dDdoLwJglF9MPulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3GqZMkYaiPIMpUv/+jU5lovX5ftrYTCcTrwCIvzZao=;
 b=z/uGS+NaKXw8qpar3dmVIxmAhUdvYI4RR0MvQkf6wwxTT8cav3j/+HkRs9bZwXE9k8N4YNVLsEvLgb9FeRvy1QliB4275uofwNoTq9HgFXeOrsk+Zuz/CEhpKJhcZRD4PAYI+nUpAfHS9gG7yxOT6Vf7nnjAdKGPLzkjbDe1DwGWWjvnYYRwXkp91FmV9NaBEoWU10BmjNCphQ3WN7UYeEir+6gtr3dg+0W4Az/Xh7428j3W9NVw/+b48muZzUJc+zvFNkWSt2IsA7fMLNoWOoz0plqTmdJRh/iEa1RWrUptEA6OpnMBx+4fRDBs9088as6TOgEuldF91d4UUKgfbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ac671c9-d983-c321-d004-63f8e7f1af1d@suse.com>
Date: Mon, 7 Aug 2023 16:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 11/13] xen/x86: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <40f438ad05338dd86587eb469c7b0614e1d69462.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031757440.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031757440.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccd18c5-5dec-4c07-c4ca-08db97561731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qrph2RtdTAF3mXn07PmFUOfoZiVl4+XqEXRx+GxAm+0Vw83CGk1CKDd1QwxIEQvj2AbrFl58D0j6apBJlA7FNFJaV5cntZj+BrMzKJuKpkJxJIWwddTIUaP+bZcKDgqNZXVDWFkBrBTXkA1UGcvWi49kXlZCypBYFQ+djsawM2+VeCbp6vaRmWo7SddEVD8pBlQyyBPYJKuuUJq5wiPFTzk/Ca+y88Sj8BH+YYh785epRzsOd44TVMTOWJpIit9XAIBiHuDT6J+pp65iWj99nWkW5kdxUgxjRx7ZT0mL6dBu5wWP9xkWU82AJNMLqcAh/jBX6tNBI+eC0xNdSXijksfe+h+xlunaEABV4OBA5rNBHdiKuP9Lrr8VtqPSnj85IOsalwR/h8mG4XJt0nZYTcFjSmhCc7zsL/ElOAwHAsnxOu9IQmdmYSu2SL/p6zR9zUFESaNH4k2OGb/Qc79xFTE7Ofhxq+lqgsHx/72Tc6r0P2WRaNkwmrUMz/kNdF9KEYpuyconarGiEZcEfKjKdHs2aQSaKNk1wQbsAMJIGwDxEt7+vkqCZbmmTV2srED0kbeKjvknQvkkig96DFai2Q8EQBKOdbKI/3Jpt+Q7ccQPYdmdd2J7gIFQvp0dli+aUm6DRhs+3YCg+DcYZGLbkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(1800799003)(186006)(478600001)(38100700002)(54906003)(110136005)(31686004)(2616005)(31696002)(86362001)(6512007)(53546011)(6506007)(26005)(36756003)(6666004)(6486002)(4326008)(66556008)(66946007)(66476007)(2906002)(5660300002)(8676002)(8936002)(316002)(41300700001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHc2NldCK0F2SlIrb3lpY0d0dHpWZ0krYVpmdWcxdmtTQ2ZzMlIzbUlZR0Y3?=
 =?utf-8?B?bFNnd2xIMUJYRXZWQVlHVTVqY0lOc0tROCtEZjhkSjBsb1FudGVTOWRkNUto?=
 =?utf-8?B?ajl4ZS9ONGdzVEN4Q1Bwc2lWczlsMm80RE9COXNZdWZyTFpQN290RXdLdmto?=
 =?utf-8?B?cFUvVXdDd2hDYnY1ZEJxejVET2ZDZFFEYnUwYVdZb2IzZWVscUc5WEl3V0dp?=
 =?utf-8?B?emlTTUE0YVpMSmNaMENQTTZiNXIzdUZramg4clhNME40K1hvWHkyRU05SHA1?=
 =?utf-8?B?bkhVNUJzWk4xaTJLWDVOUWVpRmZadCt3TFlmMWgwcTNNdFhlRVY3RGNKQmZQ?=
 =?utf-8?B?L2lpeG9nc2JZL3lJbldjQ2lqbUhxdTJTNnZjeCtMUERibTl5eFppQ245NWxa?=
 =?utf-8?B?dHE3amxnS1VwTDU3SG1hcnBpMkV1RVJwQjBQUU5lVUh4SS9PTjd3azNrSXlL?=
 =?utf-8?B?UkJSWVZWRkNsSHRYNEd0bXp2VWNvS0dGUnVyR0djSHlKdjFkN0YyZmVqYUYr?=
 =?utf-8?B?bVpIZXY5VjR3dXhPRC9JVTNTRDQwRlJjdGp1VmNaelZvYkpVWUptYlRZbGtz?=
 =?utf-8?B?QXdHcFFuc2orRWRwL3dLSk50ak0zVnFlVEk0N0hKMS9LMitOODFFazRXV0hM?=
 =?utf-8?B?L0JhbC9mZ2ttbWNJbVdwTjFsa3I1d3hTZkNYTGlxQ3BsMExRQTZjb1I1K0g4?=
 =?utf-8?B?YURDTDRtOWtkd0Jwa1g4RUlzdjVZaGdJN09ObVRmcEVEekhxZDBSdEtOMmI4?=
 =?utf-8?B?RVVWUEJwM3FaSFVkUEYvbHplZnZnbUxURVlsYlpNMEI2ajZwQlI0VUpiZW1G?=
 =?utf-8?B?RHhtT080aUxpM1dmM0o5ZVJ1UHRPU3ZzZjA1R1ZxZURqUGw1Vzc4eVRjMzlM?=
 =?utf-8?B?Vk5sbUtVNXBYbmk5cmZBQ3hReXk5S3JJaUtVb01RYWYva0QyOWZuRkc4ekVn?=
 =?utf-8?B?ZEpwRGZHbXB6VWYxeXdOcXhjb0R0SWpvVXdUb3FBVElIcnd4VWZUMjk5SExQ?=
 =?utf-8?B?RHlMUllvVDVtOWQ4YVphRmp0byt0VThEdXNmOTVnRVdCVWVFZmpZMmpBUU1i?=
 =?utf-8?B?WWhvODk5TC8yeDA4WTBzZmZKVDRSWS9qUXpZMHo2aFBlWEd0bDFjZno2OXZa?=
 =?utf-8?B?U1hDVWtod2VEUnpoUGlZbXJDeGxDdWt1QTlTR1Q0ODhxQXF5NXBuYmcxMFZh?=
 =?utf-8?B?cEpBWEFsOTFaQ0pnNTFEc3Z2UVNQMVZNcmVzRmsxK0U5VlB3ZkJ0OFJXcG5y?=
 =?utf-8?B?dGNjY1dEYUdxbmdiL0NOM2R5a3JkeDhVdG9uWG5EMWdvOFR1bXdNeXNKbWc4?=
 =?utf-8?B?YW1McWlOZEM1U04yQnhDQUxTbE5qOGh1ZFE3RnVuajBLZ0pZV20rZ3FLQUFv?=
 =?utf-8?B?MFhWcmZ3QjlVWVIwVzhyN01XLzR2OTBtNm53OUlFLzlPaTlaeDV5YUFnN0Fm?=
 =?utf-8?B?VjdzOXkvbjVENFpuQWh5eVB6KzQ0elcrcFJ5RmNINkZlaVRKL2x4ZmNDTEg5?=
 =?utf-8?B?OXRDK3pDNi8rZmJ1RnVTNkhBN1VWYUFZM2R4czZKN3ZNTm9DZGY1TlV1c1Z5?=
 =?utf-8?B?YVI4QnpIT0w1SlZzdW1kYnpsL3FZampjMEVwdEV3TTYwUDVuYmJiYllGVTVE?=
 =?utf-8?B?YUFXRFJqcTN3VllNL2tqOWF4d0M3TngrVkNiTFZ6STc2N3hleDlkSUFzMi9p?=
 =?utf-8?B?bUpYeDI3VVZ4aWdZOTNqb1libWRDNzcyeTFQNDNrQnBnU01qdEdTQkhVbVpu?=
 =?utf-8?B?Q1ovbG1wZ01aRng5QXdpRFpWaWU5ZldkUk9HVVpnSC9waWpkWEpSUEh2Mm9M?=
 =?utf-8?B?bk9YWnl1b2pxd1Y0NjBGQnR4cVJFejZZaDVXZ0JSQkgzTk8vVDNKRlpiVTMr?=
 =?utf-8?B?Y1NBa0xGUEVoMUxCVlBJSEIrSmNzWFZKMndoNjJjWjRZWGhYR2g5aE9jUE1C?=
 =?utf-8?B?VmRURy9FZzdTMUdIQlErRkNtbHk3VEJOY1RNSjZKcjdrdGRta3dPdEY3b0pz?=
 =?utf-8?B?VHl1RnRYdy9yL3BKRERkZmkrNjU5Q1RrT0hWZUJIeXh2eGFySjAzendCSW9X?=
 =?utf-8?B?RnR2MDZvODB1UCtRdFJNNTJTU211Y1FESnc4K0xBMVY4b3BsVGtjK3hSdUs4?=
 =?utf-8?Q?BP/wIxWcE6jCiKFgB6omKcAWS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccd18c5-5dec-4c07-c4ca-08db97561731
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:53:41.6621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfDaCn1YiS+FZ/qrKQNncpRDpcoB1M94gIlnm5U1Wn/mFdgr0wnDF7IkLqebd/wY0LxC3oaif8fcclRGahu9Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622

On 04.08.2023 02:59, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

> But I think I need an eyes exam after reviewing this patch

Thanks for sacrificing your eyes for the good purpose.

Jan

