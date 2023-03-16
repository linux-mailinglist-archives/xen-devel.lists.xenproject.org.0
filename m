Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11436BD691
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 18:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510747.789045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqz6-0000YX-W1; Thu, 16 Mar 2023 17:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510747.789045; Thu, 16 Mar 2023 17:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqz6-0000W6-T6; Thu, 16 Mar 2023 17:01:48 +0000
Received: by outflank-mailman (input) for mailman id 510747;
 Thu, 16 Mar 2023 17:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcqz5-0000W0-Gn
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 17:01:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b5400ff-c41c-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 18:01:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9744.eurprd04.prod.outlook.com (2603:10a6:102:383::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 17:01:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 17:01:43 +0000
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
X-Inumbo-ID: 3b5400ff-c41c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSlPtAKY+/Z9Otkqw3uFhXazDznlebQD0WONTtHXusGsijD73GVNx0VnPSsWEFS5AI4oTMdQS6rC7fxAkpZlvwkgNMrEvAum0aKGKb8ew1wmwF1r7O4eZz8nmAdwMmG62FU8TypkHwff4l0Y9Aaa3npsDv1vkXn3DkMwRl/M6SSE0jK7awGCt5m2Axh3vVD4YHQ0N+MrcgrizLusXr822Ga3fP/Xgjvk5EVcOoBvs89JXxQyrOauUFKRMGiV/Ms7WpBCOL17jfkF2JD8xBYOeez72bNHDDaNGjHikWCMqO3d0GPiysM6Jrwy51NqMv4qXiTnFfrL8MSUSV6nDzaZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0zqmNGtyNBxwZJ7G0RJaTA+YW8M6jhF3wozVWt5Xvs=;
 b=jATczK8jYga5FPRmHY5vN3B2um3taOFKMKgDRus6CyPX3/LSxhXhKGd9OCmuuUEy7/v22X9cjnGCpPLPxhvKRrmBlqiQdMtM0TYi/RZcZ0L8KAUXDqtjVzPCqahYLVIEAgK+749+eW37+ms4J1AgG9Y/MJOP8CEMhAOBVtfv//ovQN0uZufDnzBlZAf9BGoTxK/djNj0MLE6SePF5mYgFsXlJAt/7KyB8o4SNgUYGayTCin3M/Xewn0fORgIgJSk2iCWxWwCkG26uXbxaD+GF5s/uTc/aULYaN3aDHg5K0sGFiof6tEh9qyPmAzbkdAQrW+riiriXV0qbVmHXwwwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0zqmNGtyNBxwZJ7G0RJaTA+YW8M6jhF3wozVWt5Xvs=;
 b=kulaIzKN3PgGk4KOGU92PUSHReryP4JHXCGsA6IaFPjCl6cqkGowMEMnknmn6psdhFx2X2YKnhyVsg2qdAXHEusEHXHeD9cPSxT1JA+wBrqU6d9GkRM/2+ljXQZgTdIUoD2IAkZP84yXLfKZDOCPOU8Bowz1vT8FeHKa9zXPaF2GONE+p+6r8RCqquCkeHsAwAROfRSz64LhsfGqrxlNBXuaVCIjUoo4oXkp4RfcQO6d9FJ6BLFmWpBMoqHXN6ugUuMHc81922wGFbKkAUlR9pisKusVnaYubEnMbLftMxNGIvFstD2lFF69hyBqjOjqirTstzONoUpfIJerGhQnaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57c7c2e4-ae68-19c4-2140-f5a41fc1a6d3@suse.com>
Date: Thu, 16 Mar 2023 18:01:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: d402d530-e461-47c9-6c02-08db26401e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fINNB/I9A3F50MMR39Bikc7ACXNRUDtRPw2IRZOt8DetIT+31PFX3AUxHsPLNHpsioJ2cjyY63mExEmxb3kffRNLqgH4QZI3loRkqf1gqEQRpAlwoaYaVn5SC5dCTp6DQuK/ShMub4MXKZZZsy5StpMhHae1fYXvsx/Kuzw4BsK///RChtFRzxOccsqwxmvI4w0e7WuAnrr+ApEeyfklIhX2clWQE6LwCXhuFel0vH/0zK3udBg0wjZWRTLFTK4E2pNhrUkFTIl0/buSB5lZ+coT/Q92vgThS2qj4hkGFB/509Q0iE+rfi6GARRvNS7NrSdDsFD/3AJWVnNZUAZWxwW5WEBBZlZ4Hbyaysb+1NHundzhkLn/N5xFwKKNdglZRcl8fUT4gVE6g7m2RziZ+XEt1w2gNQ5jS8BWS+yD+LzyG7VnRbnVINUkzIDkotVvx3ijubljuNhrIPeRdTey142gBdce7lk6EeM3av57mQeBhJh33XBb1k25bTomPk7cQec8J9VxR/r4q/wzfSnoB90HmNEoCxdT3xaUUJKQq65JQaBjcpEmAtF6smDT64BINwoSdwqoUGVdcC8/j1VO6yju5ZOA49nRIn8F2bdqwQA2GPUgIvL6s/+YUyBJzRHt2m33zFczYnVz+kBjV97+/gdkx8sOAfjPe+drAfAMXlt9pPPuEbyWpFNgJTBugngPa7Mk130Ecr1OQlfJi2/WiRfBrJ64DqpK+vsAdAJbl74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199018)(5660300002)(8936002)(41300700001)(2906002)(6486002)(4744005)(31696002)(38100700002)(36756003)(316002)(8676002)(4326008)(66476007)(83380400001)(66556008)(86362001)(478600001)(54906003)(66946007)(53546011)(26005)(6506007)(6512007)(6916009)(2616005)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bllIZ2VvNlJkQm5tMVIzcWZSbkpWOXpOVjllVjBFY3VyRHRiQlQybkhkRFlo?=
 =?utf-8?B?MXgwdENaK00yMjVGOHhQRHJGUFdhMmFGVitvRkpDRWhXcjQzdG1qTjNxVmlh?=
 =?utf-8?B?cmE4b09xcTVmUmN6eFhaL0pCTjJQbHNhZkVHNG9ZbFNmN21hUFRxVnhESXMz?=
 =?utf-8?B?QURxS1IzR04xR2pNYllnVEVFYXZYNjBwWnRCb1luSnZTa2RGb3J4RVkwRmZn?=
 =?utf-8?B?eHRXUHhUdldKbVZ0S2pRWm9oU1dtRFU0Zmh4Y0FLa3h0bk1yVnFaeERLditH?=
 =?utf-8?B?aGVCdVdIb2RjZ1Q4LzhmZmZsT1pwa3dlMHB6VnRHNHA3Y0llNnNBWDA4ekF2?=
 =?utf-8?B?bm5QaDhQS1V4VnI0ckNvTVhkN0J2Q0Z2bTl0eklnem9xaTI3RFNpSFQrWUpJ?=
 =?utf-8?B?enBtNm5MQjFpODFvUFBMSnlGTWd4WHc1WVA0ZC9IdzY0Nmg5WU4xYlhNL3lq?=
 =?utf-8?B?RXVwMklHWC9aZGU2WVhGQlpFU28vMUN2ZnVWWFhPSnBXaDN3RXQ3RjZ3MSti?=
 =?utf-8?B?QytLSWhlQloyVHRVRDRrdGQvd2taWisxRHB5OU9SUHJZWnBNcXkrWG03R2xh?=
 =?utf-8?B?d29lVVV4QTZhNEhmVERYajRLS2wrdGFEYzluVzJLY1EyR3Z0YXYra3dXeVkw?=
 =?utf-8?B?RVNhTzdiYzE1MEJ3Y3Z0V1ZvWGNLTzlCSnkwT2tja2plbnZwTllGWjBBM1dh?=
 =?utf-8?B?RS9FY0UzQVd5ZFJqSXMyaUFhRzBzdjVVbnJnNEd1Q0lPRjZPR3grSWpSanpm?=
 =?utf-8?B?YVFFdkdsZTNncU5hTmlVVEtUakkrZlFMOFZFNGhqRjkzT3FYQU1vcVc2QUVu?=
 =?utf-8?B?N1JDUnI5UFczZUhzYmJETmhqNW9jZVNDdUFCamxjNkJDNWRIWHJrZVphOGZH?=
 =?utf-8?B?MEVWWWx5NGJCbUVLZ0wwS3BaT01HMXFkUUhER0lNQWgxaEhhTEJLbHpKSDhp?=
 =?utf-8?B?VllMK2l5MFFuTWFtRFJ2SEEwVFVid3o4citXSWNRbE42Y1lIUDFrRThRVUNZ?=
 =?utf-8?B?VEJjaW01RG5MUDFpcFl0MUxOY0c5QVB3SFBqYVRDSW9PTGN2VFhmSC9qcG1W?=
 =?utf-8?B?TUR4OXF3WVZvdjlZa1VHSHExNjFXNGRuZEFuTGVkT2FmWUxPNEpER1EwUzJq?=
 =?utf-8?B?eTZYamQ1ZDBNT3VjWVZHYkpnMXdnUm9sdVR0dmNpL2VJUWlMUlBISTFVY0tE?=
 =?utf-8?B?MGhJK0VFRHJpQkNYcTFzdUFGbnZ2WG9uOGxhV3pCZU96V2l6RmYzcFAxT3BB?=
 =?utf-8?B?UU1CMDZpalRGbE9HaXpxWk5SQXhtVGhrRnJISVhjK0JLcm05UC9uUjVoUkZQ?=
 =?utf-8?B?VmQ1djhnZHZSUTF6ZHFFR0VSQ0FSNFhpUy9HRXVBd3czb0pweFlKZnhLYTRa?=
 =?utf-8?B?d3pmZ2dNcVgzTlNETmlPR0pidzArMVAway9NaldMTC9oazBvejRBcGExUWVM?=
 =?utf-8?B?OGtYUmV4QWlzOXZNTnlrV1lxUU5OVmVpV2JpUWpxV3RETEJQUzY2alU1d2c3?=
 =?utf-8?B?RWttUDNJeTBJZkVDQVAwbTROWUxDcG1ZUEcrd09LWHVDWitubS9EcVdvbnpJ?=
 =?utf-8?B?RG9mb0F2aityci9wZVk1ZERPQUMxTTdLSnhsT2M3RmRCa1AzSC9VbFJIenpH?=
 =?utf-8?B?NlpDVDh0VWYwWkhKeDdIQXNnMlNpdlJEeW44YlZCRENoMEZCbWV5L3VuM0g4?=
 =?utf-8?B?eGxPTjhtQkxIQStnU3FNK2V6S3F0TkwydW9uSUlaenIrdEREZ1FBdWNia3Y3?=
 =?utf-8?B?Rm1ZdzVCdTZwb09SbW5lWTdHSCtnZHBCZGJMU0dHQk40SEtEcWhRaUFDa2pU?=
 =?utf-8?B?Nk9VUDkxbk9tT2RqNTJ4Y1haRkU0TFVEY2U3VlVjU0Z0R2RHdGFYbGZZSnRC?=
 =?utf-8?B?bSt1b1ZxSkx2ZjZ3TTRJTkNLS0Z1WlRwa3ZybjRqdGZObnZsb2htU0pkalEy?=
 =?utf-8?B?L2tTQ1laSGsyeW1DR2FTYmU0bWgyRVJyUFpQVlRrL0RKemYrM09KQnVIZkJP?=
 =?utf-8?B?SzJBYU1nQVNUN0hjV3BCZlV3SE5yZnd3ekZmODM4aWNHdk5SdUNFWTFqZ0Nq?=
 =?utf-8?B?MkkwaU8wcFIrMzR0Z0dTU0ZseTB4ZVVBZUVKaFhpY2YxQ3hRb1lrdUJhQ3l0?=
 =?utf-8?Q?4eZOrLBvb/kY0fy1i7Pe03mQK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d402d530-e461-47c9-6c02-08db26401e46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 17:01:43.2626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zw8UhMEUKnvtAHRYRdQiiCBiWC/BA/SKH+BvtS0QXcKjM2NmJ0UihHuEsJe+7PbMD1YCrJjAJuBFUGqRQGDfNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9744

On 14.03.2023 21:56, Volodymyr Babchuk wrote:
> +static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refcnt_t *refcnt))

Hmm, this means all callers need to pass (and agree on) the supposedly
single destructor function that needs calling. Wouldn't the destructor
function better be stored elsewhere (and supplied to e.g. refcnt_init())?

> +{
> +    int ret = atomic_dec_return(&refcnt->refcnt);
> +
> +    if ( ret == 0 )
> +        destructor(refcnt);
> +
> +    if ( unlikely(ret < 0))
> +    {
> +        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);

It's undefined whether *refcnt still exists once the destructor was
called (which would have happened before we can make it here). While
even the atomic_dec_return() above would already have acted in an
unknown way in this case I don't think it's a good idea to access the
object yet another time. (Same for the "negative" case in
refcnt_get() then.)

Jan

