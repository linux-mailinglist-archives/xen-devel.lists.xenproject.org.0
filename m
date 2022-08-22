Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA959C0DC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391421.629232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7kK-000606-Pl; Mon, 22 Aug 2022 13:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391421.629232; Mon, 22 Aug 2022 13:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7kK-0005wg-Mq; Mon, 22 Aug 2022 13:45:40 +0000
Received: by outflank-mailman (input) for mailman id 391421;
 Mon, 22 Aug 2022 13:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ7kI-0005wa-TU
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:45:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4403564-2220-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 15:45:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4066.eurprd04.prod.outlook.com (2603:10a6:208:5b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 13:45:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:45:35 +0000
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
X-Inumbo-ID: b4403564-2220-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEiQZlqcvmI0JPc6qSv4LDF8H0fHIN4lIwe8M8FMHrOsblqVlo/xTuesA4MLIg2l9feVXFoi9K2Olwy16mQBCKMCjaEMA/i3RkUVAahZ0oHKg1GGISOX89A318hLg8kLn7OF9Amo3ODbz/RceI3OSbVq0rJ91+ZQHSEo7lduzmR1HSKAlv0uM1A8pElC7y35XiiqV/NrozpcjQ8yVzijGG+Rx1wGfx0f+xp9STnDjyAjinRMCd9AfK9dw8ERixn4M8eYG/g4cbHhaoht3ya/EQdIYNq68d9QA4eFuVJRj8frW42XqLRlb3bUbPEN2nUKZWQWoELvfXvDIrUCVrfQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6oYGrmXC3jbhRgM6UpIHo5ONYGEKW9otmQP1JjPld4=;
 b=GjM2IQkGaHbYSFerW9kObTWN403r7b1HXgLSGxSrjQwtHFpHn5gvkOmpyRBc5czTU64TjoXsRzTry4Ugi7iIwX9GysBsQUZBLX31Lt9fN3epIAUaWZjZyuKJGXs5hakkprXqm6W85gXAEhR4FsWpofmCKdxERX3yKXQtmM79b2Tm4yQD6ojFuQMO7yT/WQZcpc1S/F+04yjLYO9HFR2iT/OykxjeE9oOL6XE3cl1aptK05Q2MY+ECoAY9EBMXEP34iLbb+Q2jbYYo8T5JWkNR8eMnuf1y8mTVa9XhNgvgvUTNUuuQkzgb8lvlL1lnAzpE+Il00+vR+lYZr7DkQ/7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6oYGrmXC3jbhRgM6UpIHo5ONYGEKW9otmQP1JjPld4=;
 b=GARb0sCU2mvobYTBxoYIpxo4mEq8LyuXyyad60lEqJtiZpxr+N8TmvhVyK+oWin9J2laqm/b5TTJhtmlaY/XzcrkadApfH+h2HOnnndf8gFgNpXuRAos0/qn9PDpODKHVPE8x7FQqq+h99ZDCmSCkPe4ISSUfV2OojQQHghDaulXv6TboiJoq25XmVADopUXOMiEyvcMz1gZEtdio7A6Y31voO3xFDXxCoc5CuLs1e9josA3fJPCwjUx5O5QyNdLlUN/gx1v+4M08zgKP6I3bJXquugZ9veKJ484D+uMFVc7f3wDf24cTGyHRkIjxNK0C8j98g1LYI+vRaf4SLl/Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22ded444-ee44-2e5c-ab3a-e29edcf01ae0@suse.com>
Date: Mon, 22 Aug 2022 15:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/7] xen/evtchn: Add an helper to reserve/allocate a
 port
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Stanislav Kinsburskii <staskins@amazon.com>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <a6835a7c7223635da27d4e7db002eae5d21417b8.1660902588.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a6835a7c7223635da27d4e7db002eae5d21417b8.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02258ba5-3198-47a0-cbd8-08da844496c4
X-MS-TrafficTypeDiagnostic: AM0PR04MB4066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N7QGvUowqqsNMgOJwoF15Jx+miXtiJxppJkjRsnGPnOq/G8tSalrp01vhuXx+YFQvNRcTmpZaaGl7R9GZJDErY6Uuoc4Hq+AX01g3T5hhUTHw720pS493WTCXZe4yuKajh3JJCZmvBDPCAHEWDU9B6f9f0Vuw7hxzn0UKUHs0/xFoq9AIJCx5uR/1aRaFKEyVfuAlUGifS7UTnB5d2gC8mot4vdJsBMsogXh9zVV3AeCnAfx/MHcFOYpkRp3iYY9T/dVzAQD22dfgBxHr1FPG+3tAZ+yp7ddfmflVNmmDkzMaOEuWNPPHGqYl6Mzn/VZk/bvArpR/HWbQmgU0s79y2iZEpf8XoonVMJY9BERPOOG0gGh+DENzyBC9y1LWz/21sxgtaxg8vnJ/x2zNu30C5ah6equVbtzFGN6+s5vEzJHKH0lI+bfFxT2HGoHCaTBudO8kE7YOM5kKruwye7THLBWLPBertjhi0inb9LBbOmClp+nd3rMrBiwg0/r0N9IM986RDBLqLbRcSMA9UYtoLiiEHPeCADY4IfAYXeJs9uLwGXMn/RCAEO+dhqgfKYmKYkqQ6+V/CRiwFS53b9azbXfPeh/EYbKzovnacuWKNpVmlZlONrKh7/3JdTi7DQ6YMY33GRVcizKUe3yamtKTV++1E5unO2rCQk0Ao1ThM1wvrwSftoYQK43gmqyh4gl8dRFxfklbA/fsu0bw1M8roAHvjx73Ibo6eT6aDenNLVpbb6MIM7vfGZ5L/XLOi14iOIB67+/t9EU53u3WUZ7HTOFVwsjF72ceYLqxhDPTAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(136003)(366004)(376002)(31686004)(38100700002)(66476007)(66946007)(316002)(478600001)(4326008)(6486002)(8676002)(31696002)(54906003)(6916009)(86362001)(186003)(26005)(6512007)(2616005)(7416002)(8936002)(41300700001)(36756003)(4744005)(66556008)(2906002)(53546011)(6506007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUR3UlFLMk9iYXg1VHVjalF0K1pPUENUS2cvbi9SaXV1dmFvcjRlNlNvMmJI?=
 =?utf-8?B?MXhwYkc4ajFIMncrYkxTQ2MzNFNFckRHSVhrSEc0M091YkRlWXdiR1h6cW91?=
 =?utf-8?B?dTZiMTVmclZEdUV2ajJsZkYxTHJuMUFtSTBWMkNDZXlEbkFlSGIwZ3JUUGlL?=
 =?utf-8?B?K0tHTElYWlNWaTFDUnhSRW5WTkU3MEJaOWp5MTg2S0Z6Y0RoMWNuUEZ2Y3Fu?=
 =?utf-8?B?YkhUS3pYaEs4YllKMzVJRWR0S2p5MHNrVXZiMjBzbkVFdHZ3dFEwZUNRZnlR?=
 =?utf-8?B?OW1jQWwvWHE3QU80am5NSXQ1Q01RWXduVnFxY3BIdFBPK0VCSUluNFBleUQ1?=
 =?utf-8?B?TUtiN0ZCRlBZZkdyU2gvN2hVendRSnBkK0wvK2pWd2taZEZCbUNYZXo3UVZK?=
 =?utf-8?B?SWpQcWtlT2VOcmdYV1FNUHZWRUlRUVdmUlZRLy8ydDRDU20xZ21qWXkreG40?=
 =?utf-8?B?aEErK0tVZkhpL2N5VlNvZGc3bjg2d3I1YXVHbmV1L3BiWXdPcHZEM2RPV3NN?=
 =?utf-8?B?T29xZ0g0KzZFWnk3cmF3TCt5L2ZBZnNqUnBTTm10bVJvMkNLMGtWa3UvVUdM?=
 =?utf-8?B?bUNBNUkvdmU3Y3ExVU41bjdqUEVJZHNSQi8xeHlHT3VhSmkwaFZFSmdndTNv?=
 =?utf-8?B?Rjd1YytnYXhEbTJDbVVubm9kNW9QYnhjQ3lJUjl0Rk54L1JSK0lvdkhFRHNE?=
 =?utf-8?B?WHZUV1A5Z2s4bkJjMnFYYjdjM2tyL2pzWDFySjdmNG82MnlKcVJjeEtOcTk1?=
 =?utf-8?B?MXhrTHhKTTVnUFR3QmhoTzFZdDRQTy9nTVllR3puS1ArKy9RMlpWbWlVMEtv?=
 =?utf-8?B?WGUyVXpzM2t1ekRORDVqT293SGh3VG9MTWRocGtZcjhxZlhEUUdRM1J2ekZp?=
 =?utf-8?B?eEk0TWU1elBDaXNsRHF1M3hXckV4TkNNcDMya1Q1QStkMnBra2FtZjQ1Z1p2?=
 =?utf-8?B?N2NVd1o0eGJTczBrdzFHbGxKNWxISEtQL0tsRk5qUGdtcFpacUxqcC9rSno0?=
 =?utf-8?B?WjUxL2NtUWEwY1lFdmFhdGpBSUhuZEltblRISzkrVEdidCtDbktxK2dkTHM5?=
 =?utf-8?B?a0NicHloeDRhM0tVNjd6SkV1SlFBMUdnL3lFcmYzU1RVS2drc0JGbDQ0eGdm?=
 =?utf-8?B?UGx1SW40UnBHTDNPRmFOaVRSdG96N1ZGZ3JSVXpoalhtYTloai90NTdTeVl6?=
 =?utf-8?B?YW45WkZlUVF3QmhYWXoxTU50Q2JuQTFEdzB0QmJUUHVyeWpPWVB1THJ1L1Ew?=
 =?utf-8?B?ZXg4aFpPdC9JZU1ZYlo5NlIrSzljR0dLVHVTN2NQNUhLZyttVTFQWjY1NUJS?=
 =?utf-8?B?NHlrdzR3S1Nqd2szSUtSNmdJL25ySWJIcUlycGZldVRXNy82c1JZL3pvcmdG?=
 =?utf-8?B?VGsvWWZlbFpZZkhTQkticGFRdDJqSHRPSFRWUGpOVFFCOFlOYzNqbTMzQmVY?=
 =?utf-8?B?WjdEUVlIamkxbEpsYk5KM21YR295cE5IWXBoRVJwMWlZelgzOTRySTF4Tlp5?=
 =?utf-8?B?VjhoWUxuZGNVcnpTazNQaW5TWmx5aitxRUR1NXhQbDNBUks2NFJwY3cvbUVD?=
 =?utf-8?B?SVg1MmVrZm5WUk56VXpOT0dzNlFLVnIyV3pxMURXUE8zV05oYVRNeGFHUkE5?=
 =?utf-8?B?K2lhZGxaY1JMbEtjYkxmMWl0VEtSaGh6Z0xPbjNWTklHbDkzc3FudlZXQjVS?=
 =?utf-8?B?N0NVeWQ5bGp4WjVSWjhrNnVPSjluSGNDTTZzaWRVS01vVHFsWG8vVjNTOEtw?=
 =?utf-8?B?cEZHRFhzQndENGREWFJOd1ArcGx2Rm5hZS9zRWVnZ3g3d0NiNW1XTlYzREgr?=
 =?utf-8?B?WXNya251bS9VTlpZQzREaDZtaWYveE0xWVlmUnB5NDJEdmVpeExLSCtRVlVy?=
 =?utf-8?B?YXNqaE9uSnpsN2FrZ2k3ZFZKckFkV3pDVnFUTjltMU5CanQrY3NJMUU1MXk1?=
 =?utf-8?B?RGFZVERVbE1iQzYzWWllcUtXa0pJR0l5bC9OMGp3dUhPc0tqUFJzSkdqanJQ?=
 =?utf-8?B?V0k5S3BranI0c295Ni9ueVFReGRBRS9kVTZoa2tsTWt4WFhTdkM0bGREYWlv?=
 =?utf-8?B?M2JQVEhjemJyNUl6RXhMSnR1Z2dYNFVpbHR1ZHJaa0FnN0g4NVY0aUF0bDhy?=
 =?utf-8?Q?APrfKeOXYdCS2iQp5besMD3Np?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02258ba5-3198-47a0-cbd8-08da844496c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:45:35.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1Kzg4QxUm3F4/vZNBu6lJzyPnombzU3x3xAThIwGoneZ/ps2t8HUoiMO6hy7FL77rSRBcRSiQj2C6RsV/m0hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4066

On 19.08.2022 12:02, Rahul Singh wrote:
> In a follow-up patch we will be able to either reserve or allocate a
> port for various event channel helpers.

Maybe "... we will want to ..."?

> A new wrapper is introduced to either reserved a given port or allocate
> an empty one if zero.

Maybe a/empty/fresh/ ?

> Take the opportunity to replace the open-coded version in
> evtchn_bind_virq().
> 
> Signed-off-by: Stanislav Kinsburskii <staskins@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


