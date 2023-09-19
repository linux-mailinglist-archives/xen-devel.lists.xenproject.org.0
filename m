Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7567A5A2F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604415.941783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUa1-0003k7-Oq; Tue, 19 Sep 2023 06:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604415.941783; Tue, 19 Sep 2023 06:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUa1-0003hF-L4; Tue, 19 Sep 2023 06:51:29 +0000
Received: by outflank-mailman (input) for mailman id 604415;
 Tue, 19 Sep 2023 06:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiUa0-0003h9-QO
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:51:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe16::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f42db3c2-56b8-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 08:51:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 06:51:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 06:51:25 +0000
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
X-Inumbo-ID: f42db3c2-56b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPeZ855viKnVd1VnKQDnIrXRs3DT+zkXvFowgYtnVVEmx+mgku6HqyMULYdvuMJ+gyDTsxCrScZL2nMI5Xhus+H5n4RGKMFGficlQBkd74GaLK/WaHDpBFRrgGfkMwiihTIAWz7Hw59LZY4BujENgSkkgRmA4zlq9qKHTK40c6DZahsfQb6tfGOgA2EGTsbElziHQivytf55qihnAB9IshLCj1oQBwVlVuxbrPhTAqc9/O7p5c6v6ygXKYboRGotEkeMzNUNFARmv+TGamr2z3rrU00FyEPwjma69/Xb+tHVdDkdgiJxzDk6FMK+DamOC54TxKgnFBzEdYnvD8l9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB0Svx5CAOCahCmefviXshc7rJgq5c9YMB1e/qBvLWA=;
 b=ahZ6xptYzN49sLMW4KlZ48b9K8taMLDsLAQ76mtLbB9JLKEC+V33ESOlXulpbqoPT+fJHvCmQvTSpYKisA05DuIQbqNI3C1i9mTTz2Bh/Nsq1kFkCyeItk+syLmVOL6Z4fhzYrfkk0ig7kNX3gzJSHu2BD0L8lDClbQoayHoWDOiDJ2Fl2zKUQgfBkqdBbmTa+dkKznSioIna9SA1H7JvTlEXAcU9wQI/BdNlmR9A/fgnhQA7CJFD81hd8tqDYp25z6vj13U0KljbuGYKJl/l1JHBHTFyseMqDh5Bbx1SsCiRNJldM6ML2JOJtSD6g+9Ayi7EVBs1UgsawL3Ti+faQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB0Svx5CAOCahCmefviXshc7rJgq5c9YMB1e/qBvLWA=;
 b=eZQHmGJTU/3+fN6HI0+TpDwLTH+1qbbFJPEt3a3J2FMemtth9zIZtLSoVeHJf9pWgm1Vix/ZI8PNiwT/q/G87UjOpUt8tbOc17EMRfez8L73dbeEkBf7Ncd+ZnFLcvyOIhdZ717vKsu3f09W8csyiJ3g0oHCh1ToL0soSqUz6iVC/0nOWVfCaqYiva67tXZPf1NCU0rx3o29TOLM8QIo4MCbqhFS6mk3AQS8DUuVnnjPu4a6f7tpT4s24jSyVisT6n1irUgU/ny4eImizaSqvdOPp8OyYHLc0PZ3Xbr8HYyuLr8bh4BNB44J2zatRh82ZGiu9FlQ72qptTpIe0Hi8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88b6839c-ae82-cdbd-b49a-898ada49932c@suse.com>
Date: Tue, 19 Sep 2023 08:51:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Remove myself as RISC-V maintainer
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 xen-devel@lists.xenproject.org
References: <20230919053833.1410609-1-alistair.francis@wdc.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230919053833.1410609-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6e6462-f747-4cd0-68fb-08dbb8dcd776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8jBrJf6y1n3Gw1PLtH48rgYgAr4DEkZ/Df/PLiYteJCG2xpCutXzcZgdO5jPbA9KSq+1AGW73NmB5hGYNg3A/UuT7/Z0a7J+ECnZYKidcGkIgNONW/DOORjzVnf0EoURxONZQydbwQD6lx0D5zv9zhrysKuENTMGh13R6rbliNUIm9J3wkk9E6FYImFSYQvbAC4x9hrQJhq/CDEi0n9MFkZmDb1q8/duBngqsA/UUZluFeGheTiJIT9GxqF7kr1Asi6pQ1peYIowtSWIUdqkgdi3obv3aOIGhQJ+Tk5djLdV4u5k812zN4Fq+Up7AyR4yBjf2T/6jf4n8VtMZtC3hM8O6t2/QHIetsi7mB9FyzUOOSo5zUa8FuTr8neGKNX5noPChDpROEn+Sr97MTO3g3ll7+oYlC4ACkgYyQyUh/QPGGYsiv4F26DmeNy5tv4vPV6om1p2Uh9kv/e34S4fLfgchfHOHBhHjNnY8d1I/sJAri2mt9blLEZ0UzZwxIxneK8Hw1vqryzHlV8GIt/ZudoPmZH0HbaCvn0/JfW0k7Qqz5dInAMEJvOX6MPuR1c3Cs7xtThC55Q1EzBjgG7FvSZUzzFouXSGB33lZ2/pIvxpo6BixEWxvSUug7lOFMt6lQ21WHERsLjb28wZPl7wPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(186009)(1800799009)(31686004)(36756003)(38100700002)(86362001)(31696002)(558084003)(6506007)(53546011)(478600001)(2906002)(66946007)(66556008)(5660300002)(66476007)(8936002)(4326008)(8676002)(6512007)(316002)(41300700001)(6486002)(6916009)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTgrRUp6TkQzZGxCeGdYOVZ4ditocllVOXBaWExrL1JVZjZEcFJtWEs2R0Nu?=
 =?utf-8?B?NkJZQUtRMDJGNWVpNzNhSVZEWG1OU2x3ODJYMFVtcW1BWHIxSTRlZmxmSHp4?=
 =?utf-8?B?RkFGdTd6bUMxSVFnb3krVWFjM0lYaXh4M01SQUlNOVB1MGpRLzBTUWp0Si83?=
 =?utf-8?B?VU1NNWJSQ3FhL3U4REdnVkFKMzdqVFFSZmFFTmVzUWRSWjhMVGl4eXAzMkpw?=
 =?utf-8?B?UWNSS1NSd3FHUTFYZmg4V1hHcXJnSU55bG9ZNGNHT1JiaTBvbG5VQjZHc3kx?=
 =?utf-8?B?MmZUam9leTJGTlByMDJHb3YxVllLVG5NaWQyazZXdlZBUDNJQURob0Z1b2FR?=
 =?utf-8?B?Njd4RVpKWkVEQ3psUU9hOEZIUk5TUjhhZzQ2SGliaHMzYzMycFAvS3duYUJz?=
 =?utf-8?B?ZWl3TWN3TURzRDlvL3BzT3BLc0lSNDZmdDE5WkJDUGFUQUk5V0JNVGw2TG5z?=
 =?utf-8?B?dEg5N0xkN0dTUWxsUWpyZTcrNlQybVlLRlMxckZjL0tkYVJkYWFjY2hlZ2Jq?=
 =?utf-8?B?eVNmNzFjeTNUUnFrSUFaZ1dwS0pYclozMjV0dE1KNEVYdTZmL0ppNUtLK3Z3?=
 =?utf-8?B?Z1RyUStCeWNsNnNQOVVYWFhWbTl0ajZmSXVXaXFRUVVjbUE2anBRMWdyWTZr?=
 =?utf-8?B?Rm03dUJreVNqNlV3bFJiRUEzbmxFNEZLMnRNZERxblVzK2F3NTJ4eXFIUWxv?=
 =?utf-8?B?MC9VUlJITXZianVvWmhMZXVLeSsvUzBHOHdUcFNoRlF6RDJCK05uNTFPVjVU?=
 =?utf-8?B?RXdDK0t4ZTlWZEhPWW0rMzJueS96b05weUxyYVFGQUNlQ3dmWWxXdm5FdG5C?=
 =?utf-8?B?bTByYkhPMTh5N2NDand4MVNSWWZjMGVzRGhEbWg3c2R6TUpUREhNbndOUktZ?=
 =?utf-8?B?OEZhUDZxRldmRk5jc1hWbXNBN0w4YkQ3ZGY4VHlzTGNLT01tbXoxVjduZ1BS?=
 =?utf-8?B?QkJZbDdEdmRMRHIrYnpMc1FMVXd2VGF0Yml2Q2hOU3d2bXFBSDF4dGpWYnE1?=
 =?utf-8?B?a3N1QmcxdHpXWjFoVmVPL0U0d0ljWjNKRUU3Zk1ZK3U4Z3VkSk1OMU1NcmFo?=
 =?utf-8?B?TndXYndMby94Rk1uaFZkUEtZalA0blRiVjkzUU1DaE1QWnQwL3k2dlFWUmJK?=
 =?utf-8?B?RExSMmdWaWlwOEFiTy9SVGZZNDlOTEdWTFNsY212TW5hV1R1eENqRnMrLzdU?=
 =?utf-8?B?WlFyU2xoRE1DK0FyRSs2MjZ4QjQvcEF2eXQySjU1clFhRlNFTVJQeWxINVgz?=
 =?utf-8?B?c2ptUEZhcTNVNVRhVHdYT0E0VGZpVmN0Qzh5L1NGZVN2WlZhdFd1OUdYajBl?=
 =?utf-8?B?Nnd4ZEs1a043eTBKS2g5bGdGcGRUVlZFR1dwaktTV3NnTnRYeDJYcHBsTFRP?=
 =?utf-8?B?S2dlVVBqeEtSZmcrTWEvWk5EZWVHWExUeFFrUUJmVCtwc1AvUVhGWkVrdjJQ?=
 =?utf-8?B?bFQ4Q0xZR1JwTkN3SnN1ZnVQUnpFRkx2QWVCMTdibmFwVXR3VSt3L2R2dk5M?=
 =?utf-8?B?Y1VldXpQNUVLUlJCekFVNW8xTnliVERDRGhHT0lvYnVOSnB1NHFodU9wc3lX?=
 =?utf-8?B?dnp2ZG14T2o5VVgwdkxXRkVHL3F5aENtZDZKOUErbFN2Q2w2V0FLb0hFeENB?=
 =?utf-8?B?SURNcnRRcUhjSDhiNFpBZnFyeTFQZXdyaUd5OUdPWkJ3RERWWnNudzdFMGhz?=
 =?utf-8?B?NmN1aVNzME8zUzV4ZjQ2Mm9TR0xERFZMV1ZoV2c3amo0TlJyVDBwclBKZXpv?=
 =?utf-8?B?MjJka1NweVZpU2I3b0hFTkh5V1dWMnFMaEtJSzhDRCticCt2VHBOd1JxOGll?=
 =?utf-8?B?TTNpTmV6cHppWlVKUU4zQ1FiWk1iRVU1NUcvZzRUZWRWckpaQ2FxakFlbWtS?=
 =?utf-8?B?N3o5Y0V5M0x4bFJpaG16czhhcnlDVFQ2QThlY09DdU1tMWV5S3pwYU5QcEtz?=
 =?utf-8?B?WXBrOHhvNEQ4NERzVlNvREFJV1Y0c0ovQnFrVk9McXZHSFdsSWMxNGVnU1dY?=
 =?utf-8?B?cE1XSStBdEVTbVdUMkRMMTVtZGs1RjFyYmhsV0lrVjRZNEpac2toTlRyUmxs?=
 =?utf-8?B?S0cvQTI4UUlQZ3F5a0JGUEx1Vnd4Yy9pWUcwTmZNNWlXZFZmNHJmQVV3ZGZh?=
 =?utf-8?Q?ZusP45WcTtR0Uj+Awy1mEsflk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e6462-f747-4cd0-68fb-08dbb8dcd776
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 06:51:25.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xK8gTZce1I7D4eucjBX9PjRa2gjhwyjzaKub/3UWOyscCigDozWUvFPxklDm/rDSUZJuGtadY4nCicErlfQrOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959

On 19.09.2023 07:38, Alistair Francis wrote:
> I unfortunately don't have time to be a Xen maintainer, so remove myself
> as the maintainer.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


