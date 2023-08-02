Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4976C737
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574754.900324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6V2-0008TE-Th; Wed, 02 Aug 2023 07:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574754.900324; Wed, 02 Aug 2023 07:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6V2-0008Qk-Qn; Wed, 02 Aug 2023 07:42:28 +0000
Received: by outflank-mailman (input) for mailman id 574754;
 Wed, 02 Aug 2023 07:42:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR6V1-0008Qd-IJ
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:42:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe02::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fa3bf18-3108-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 09:42:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:42:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:42:22 +0000
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
X-Inumbo-ID: 1fa3bf18-3108-11ee-b25e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQNDVesECgA8x0MH6Po4rUnBqEetg29KdK5Bmov0mumH14YwYpxuLI47MNE22NmVvEuryf41duEbODrCoruFh5du+lYLvU0/SBggm8/ZJtxZ0xWh3TvqZ5wYIpro7ZfS5dJFn45hRY3hgmO7Cb8x0O89pFA1juc8xvmhXL1pWP9AJAVprzPEEpJQEZIjCGk8QFeRIzDxCFC8nidzkpUUsA3H/4ELakvTtijtkHcitwJHaIwjpudajpK/iHpR+2ntX3d8yaX5yrk7skBBJdB8h77Hg1JQ/RBf3Y99PQHqp2OCszHJMuOmJ6O4HOJEk4prUq4VRAccI0JI0Vsjnzul5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wn7uAtj3uJy6zSmTzq4KrF5V4bBuF2v5ugXcovyBDE=;
 b=SrKunJLJ/OI7kwx7ZSVeB6pfZj9M+8+AXqL0EL4gByuRBrO5fiUU013mAdSqXI6AEqoa7G7FHdPPYH98CuiAZc2Fm1/5A/gQQBzfu1gmoUFFSJGdzCGv/4L+aYYFd+CZnoH/cSLhYdFpKVcNrPgf12Qx0r/Vaj0U/xev4KLqRL71aoxPooV1qfr+KVL9yTK3Pcl5Qqp1KQ+Ko6SOTxed+PpNDih0i/DNtMG/fohq3OHjam7yT5WWSaq5ym6sG5O9fY+XZINgR/ptMGWsbTwjAxd+TpqIlJWfh3AS4oA4rtyN8wVMym5nm/3cPtd4lZz3SznxxeoZjW9uNc492xStGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wn7uAtj3uJy6zSmTzq4KrF5V4bBuF2v5ugXcovyBDE=;
 b=NC61oG0Qj0OAvfkfdgOKSDidS6dziIC3FdxJj5v26/AOc/uKlJq+NyNmDAbbZ0GJk4iGptS5x29b0kxmRjyLpT9RbRrRyplz+alc/JkQFdXZ1SOHWTq3gNHWFXFx+LugRv1jy72pdWYuZhlo+w9cCdEZry6RFEZpqX8A/gWkeNbZiUngT224B1v4kolAnWdEqMiT0E1hGMaBDLWPRimYY2KQ99+XaSkK5L+LGh6rHb+nS2DK4JNWjh3COmzwlYteDufKH91zze/AG1MK7Ii+cuYvLHHnn88dhMFG7THm6EUsz5l6JuEeCqSZdxKBXN6Ua+R5CKXI0P31EHITLgOoww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f4c0430-42ce-bb2c-3755-d5f6af8e3b40@suse.com>
Date: Wed, 2 Aug 2023 09:42:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 roberto.bagnara@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-2-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011721030.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308011721030.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: c51bc3a9-edfd-40a0-4227-08db932c021f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6J5eUIwCYel/77T3DMmFnaiwVK5vKE3gWvBZmpRNQw6g7BJCD2T2ov767TfIeD9d7wT1+VriwKhTdq6RkuSZUNdBkaPQv7AFD3vlw7zztPj/7+xdzOLjLkvq16iFp8FWit7OVeYzSp6e2yQ/gb0loLXwmUgysKBmpPy6PIlGG2LdhPaOpKmaTYMG7vl+03i4hh/UuvQbo5bvJQsS+bQD03BoqzEBHShPC9bc/eBWiqVQl17ZOaFFMtN9DXwuhZBJy/rlh2zSXFhGUzEtlNmPZtC2yIi7EsQQrnIT8nt+FChZffctXUZ1wk4zakasgB3VppITrteBDCQQVFSdFHT2ZgOb+ywJhb+6bQojecxln59oQY4SlAdMPE9h1ttqRVnrZEhdCHRGT6Oyr0GNY95EBCqdl0keveplw7g655s0kEIOvXphvwoeRfdxu60O5q3xOyKt40vWVY9WUICjjMPuSRIsTIF1aKJGYMsaQ6WDLDhNmmvPhlzI78Kx4LfRTwf9VxD/VdFPYqDGwD+W19e1NzqqyY2vmkXwwJSKl80gaOkEHuTAS8CqHF2OwDhlbk1udPIKnhvkvaelsk5Fig7Jp+75nKf5bYjwuzm6hioGHF+6MKIMHEPEH1DZpbSrmJmU2wla8RQU6ltrPOO6BDSung==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(6486002)(8936002)(8676002)(478600001)(54906003)(31686004)(6916009)(316002)(66476007)(66556008)(4326008)(6512007)(66946007)(38100700002)(41300700001)(186003)(53546011)(7416002)(6506007)(26005)(5660300002)(36756003)(31696002)(2906002)(86362001)(4744005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm1RRGVkeUJnUURBQlZiVWdmd1o3My83Nm80OUl2WnBVT2VqSFEvVVpxa3RS?=
 =?utf-8?B?VzIvT2o3RC9KUzVsV1RNRkNVVjBsR1p0WXN4OGJobEI0TGU2anRJbndXaGI1?=
 =?utf-8?B?U1VPaFVGeExVMzFKYklGL1oyNTRMTXZuMnRHaTZweUhyeldwM0J6dGZINTZx?=
 =?utf-8?B?SWNkQXNlT0I3c0pQZmlBemdIL2tlRFhhV1FRNXJvRUFJQnpiN3JRUlRGdXJ1?=
 =?utf-8?B?c1ArNUZsdllUWWlqd2E5cko1RENyZTQ2Ky9IT1hTVERRdG9aZU51SnRMcC9U?=
 =?utf-8?B?akVqNU9VNTYyNTIrazhwT0s0WW11VEJPMDQ3VDlqNlIzdTdXdWlpK21nWGsw?=
 =?utf-8?B?SEVtblV2MGxIZXYxQk1uUnhEOWUwZUdERDdGdTZxdTQ2NXJlZmV6czg2U0dH?=
 =?utf-8?B?Rld2OEw3djhybGdtL0VFNklCUC9PQ2kyZ1dkZStaZFJyaitvRzBGU0ZRTE5m?=
 =?utf-8?B?c1QrRFptY3JLMXU5RHNVRGM5QXJOWTREbWxOYWZqOFpQeWorWVljMWRiOHY1?=
 =?utf-8?B?Y0djQVpzU1c5RCtTVFE0ZE9mRDVPME02c2pvZ0hwSlZZSWxWeTkrU2hHbjl2?=
 =?utf-8?B?R2FWZmFZWmQwcUVRd3Vud2phNmFhZytjdUJlR3gxQ1oyT2pBeU9ic0g1VUV2?=
 =?utf-8?B?dU1vanRXRGtGc0RicTNXamJHd1p5ZEM1b3hJNkVZL1hXWmxyZmQ4QjlaTjhD?=
 =?utf-8?B?Qm1JN1lCSDZjU21zdVppT09aemdLbjcxaXM2Y0JGaTRBUDlQYjNTaDZlMlho?=
 =?utf-8?B?R05ueUYrMUVhQnpOcTdWU3JBeUU4OHlUbkJXOUtzSVhtamMvWElhbjE2Y2pK?=
 =?utf-8?B?NTdsNitiMFRpcVF5RmRRbklMdzdYL1FTbXhLRlhCbi9pcXNkbm1wVXlZZDNx?=
 =?utf-8?B?czdpYW1aM2dlMmZ1ZU9rMklCb2Y0cVZtQVRrSytnN3VPZTVMajVZNThIRnNh?=
 =?utf-8?B?YW42YS9IVFNaRXRYM0xqNEZHb2V6Ukg3OHhoR2dDRXNMeU5GSmZQNVFCR3Na?=
 =?utf-8?B?VmxtSzBLaVNXVTZCSGhFQ1ZMTC9GZ2kyOWtzUzRnTDJwUEprUEFKdDIyNEJ3?=
 =?utf-8?B?MnlORXN5NVc4MDNGTTZQcnFweUJxUDBhdURxcTl2VUxoUlRMWnY4cFZZSnd1?=
 =?utf-8?B?ZGViVktaMTYzcUxjd2dqd2cybHdqYTdBWDE1aWlaWVpaSjJkdjBSVXJCUHNy?=
 =?utf-8?B?alZGb1lUK1MzNlkzdWFFTWJLSHdFTlQ3aHVNVTQvaDRTTnEvRDhTMGw0dmk0?=
 =?utf-8?B?TXpnYW8xYi91N1p3TS8zSnZkOVM0MTVRSjExRnhwR3hpOGY1S1NmQi9vbmdX?=
 =?utf-8?B?dGpMRTNFSkQzSzRqZlpVS3pTYktPYzQ0OEJZZy83amplRUJnNk04VEhJMFlP?=
 =?utf-8?B?ZUUrNWZ1RXVvR0lyeWJBbnV4Umw1elovMnhQQTZyak42WkFKNmZkdWhHOGho?=
 =?utf-8?B?QnZvT0xUSGYzSWxjVkRQbE1ZS3NPMldXZldNNnBDeFhPYnozMUlxNTFCVE50?=
 =?utf-8?B?d0tYQ0xWV1NqaHFGKzBFdUJQKzhDa2hXbnlqSkVucEpNYUpVK2tRcGNlUWMv?=
 =?utf-8?B?Y3dXWmd1YVdKbFpOWkN1eFB3dzZwUWN2eVRnMm1FRTF4QXZDUjg4ZnVZZlcx?=
 =?utf-8?B?VHByWXhYRXgyUHZ5TldVOG9zU2thazU4V0J2MktSMzZSUHRTTTlSNjB3Sldq?=
 =?utf-8?B?K1Yzb0MrRlNsQjh2cmJaWE9hS0dpSktkaGlwODhPT1JYTUxyZjgrU1g3S2I3?=
 =?utf-8?B?K0QzVUo3L1ZrTm9ORElzTm5BQ1krVlZ5Q2lmejdzQ3JwbHd4YUh4OWV3b0k1?=
 =?utf-8?B?ZFFxWHlWbHl2SWFQOGJoZFZvTmlWZ0VFdmsxTXRYNXlleFRBaVdYWFhqNVEr?=
 =?utf-8?B?d1dib1pUcnRRclV3SzNRL0lidTJqMnFrM2MrWWRLNUhnZHU0K0RUM25PNklk?=
 =?utf-8?B?SGY0bm85cE1PdHJGcFY2QWQ4enVoSEVlY3FYQnArSFZNZjd1Q1dERGNJN0Ux?=
 =?utf-8?B?YmQyTUljUFdmcUl2UzVDZkJUcnJWbXZrVUUyclVkeStLd2R1Qmp0NzVoNDlj?=
 =?utf-8?B?bUhKckNUc3pRZUhtclpyNi9EV1Y1ZWFrNXdjWmM3RWR0YXBrVVhBTmVzM0JH?=
 =?utf-8?Q?XCpg/IMbbqpZ90FxhxTC9Fpt/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51bc3a9-edfd-40a0-4227-08db932c021f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:42:22.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pO78Epa877BiJzPIVoz+XU0DqpNizOcOVy1aXi8GyJeRSi48dog4FTX3OT9R0Q7ACAmg8zRoYUm/FbDspE9cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249

On 02.08.2023 02:24, Stefano Stabellini wrote:
> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>>  void watchdog_domain_init(struct domain *d);
>>  void watchdog_domain_destroy(struct domain *d);
>>  
>> +static always_inline bool is_initial_domain(const struct domain *d)
> 
> I know you used always_inline only because is_hardware_domain just below
> also uses it, but I wonder if we need it.
> 
> Also, Robero, it looks like always_inline is missing from
> docs/misra/C-language-toolchain.rst? Or do we plan to get rid of it?

Under "Non-standard tokens" we have both __inline__ and __attribute__
listed, which I think is enough to cover this specific case as well?

Jan

