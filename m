Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C05972E9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389080.625895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKzK-0001pN-5G; Wed, 17 Aug 2022 15:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389080.625895; Wed, 17 Aug 2022 15:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKzK-0001ms-27; Wed, 17 Aug 2022 15:29:46 +0000
Received: by outflank-mailman (input) for mailman id 389080;
 Wed, 17 Aug 2022 15:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOKzH-0001l1-Ln
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:29:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a95ee25-1e41-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 17:29:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 15:29:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 15:29:40 +0000
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
X-Inumbo-ID: 6a95ee25-1e41-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlfCVEildYDOs3QPwfF8xzsIK6W8mTyHAKg5zA1nwBAJefgndWVdecMAawgSo2a3Ruo8qc/wsn9WSW+VZC3cWxtKwG+0f5CzYmZSQC6eFNgwmtXrUKC9JnRAddlTbbmA7DRmQtNcAJ/cNHV1h75q46foRxpnOlA6TxlXiVOGpcA78fLSwYAhXZqsFDJpb7My0q5H6VpKDJJgG498nIex2yi9M9JdLVa5+U8POm1/t/8tYhLv546aXHb12Gf0r8XbzBOnn/3P0PZIkCDVC5RVgCPrhWF0Z13nVKFUCgEsvp1PQ5xD9bNVuZ41Lniu8CflTE24o6M3isrSzL4Ck8Mf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOGIziqT7l1i6MBfKdSC3Usk9MqkVDKmo5xWg5edxXU=;
 b=NXHomjLwYdq/lobOmxDCIbnShhdt4rzZEf3FhrWEqNVEplpauYmGjU/Vcz2ABgjFZWS7CZ9mFp4Dfq2rH4TgwC/3ojtCdvmvyZgtbYJIbKuSvJ5Ro9dWUAEJyj3Yxk+gahfn8uh1WRTP5rwIhRcAq/u7BeJ+IgTNwTnu5/Iv3L7aIgFz7CVwu9Li2aBUM+icJ6uku6e5fcgkBEKMjFCk+XsiShxplFM17nuwWOWPQwZgv6hz3DEXXFPOw5rOoEl87izFaXOCHodET4dJWZtRIXbnpcDbPG1u9Ym4sfirP8lhWFcHbiKpJJCzHeYr6SbUVUPNt80liVJYOOUElq0aNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOGIziqT7l1i6MBfKdSC3Usk9MqkVDKmo5xWg5edxXU=;
 b=RhAzoDdM7risy4gej3N1YcFjktl8Z0bLx1uRfitNWgL3t5r3aBGRVy5f7kQnsse4zAUeYqFJUO6LBDPVjpvWie/bVfWeL0pBkVY6eShDO1WrJsDp+KqgvTu+4vKheNV+Ee4a3aL2iu37o67RgFq6wICKLMCyYgtXEFKiPozacUgKvYwx+j3FnsaRiYJHzZH5j/2Q8E19Omg2H0REPPK1/9EE0MClAtNHB7+tTp3ojmkj8VAXfDzZfQL6CYRgW+l+OqMbAC/onYTqQSXWHEqH/xPOSkkqVv3S4SLHW0WJS8FrNtLXnpQxf7vRYruejYx5WLzw7+drxKXQ+SKu3dK1xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8ad54ec-cd86-066e-1029-320230c8912e@suse.com>
Date: Wed, 17 Aug 2022 17:29:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH] build: Fix missing MAKEFLAGS --no-print-directory
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220817152106.56601-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220817152106.56601-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df85fb54-eba5-4e61-f6f8-08da80654d08
X-MS-TrafficTypeDiagnostic: AS8PR04MB8900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8AE6wQychvvKgEcbmuCxlaNCvLUgwfU0jOIP7WO+o1oEs5cQQMAK+x4dFH6nI/jD+8/9hL5/NhSv0hCGWWhRm55Rcdne9InSJ41plkU3FZKUkC3ziR/moD2AziZfbT2JZMrDGydzrkmqJ40t/TfprEctRacsZHTEYbcKLMHOzTF98tn56l0TrDwkKC2v24ocTFSlafrFtofq7QZCE1I28md1I8k1u9C/yGOG8utn65lpM2ekvY8Qg5QhSGoMbkzol6ARV7KcfRot4hOw6E+9LXMXfOqLXU/4TVLESmylkNNSNzFuoUCHg5hz7YZl7w58z9PAIlpyxOve5qA5L7ckeZHpjKC4U+XSDv6cjMbGdNQw68qGNpJX7LFBbPR6ddWq7sujxFyP1Z4fnTKDOKx0QySeUyWlArw7PfSMrG9CcAuWbfm386YoUdjEOmuGR3/lhFXKGJ7ZOa6DvhzrkfovPepXMmD5x3OXHSuI7zbj3utpR28xyyRHNoTA880PQ8k42k9n3RfcYJ+s/oiipZPWIBP9z2hdVJvC1xS9bwAZ/mXknmw3MqcoGNk6nfN9l10ljaRMcClUFh/HLqIS884huMOTv3n8bXKei3vZUoNqWHyOX6mPgjmz09Rf0hcljSIX3LgIAXyunpVDiA4cmdvKZ5EAB88aP1za/xub4ZjsYE0bf/PLMYZnUXK8N1XSf6l4akyPrg7F2GCsPT1WT5AewrGYsBWwAnv3kaJpInUVFYgQu4vUQAmhRpyamh4a7019AZ+QTQ/xbaBKpbHm/HzPHSl7nZfYdmEA0DuhcWP561NQvtWPb/OE9vyanpvAncYf/apzSCbrM4SwNi3U0h7R7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(376002)(39860400002)(366004)(6916009)(316002)(4326008)(54906003)(478600001)(41300700001)(66476007)(8936002)(6486002)(66556008)(5660300002)(4744005)(8676002)(66946007)(38100700002)(36756003)(6506007)(31686004)(2906002)(86362001)(31696002)(186003)(6512007)(2616005)(53546011)(26005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXFvcG5LOXliRFB0dVEya2tnRDhIQmUzU3NYZStycU53Y1JJOUkzUmREOS9W?=
 =?utf-8?B?Y2pvUkc5Qis1RTA4RnZzeDRZSTArNlpMWllpdUlqaVlCempMcnExNzU3b2sv?=
 =?utf-8?B?MmF6MnN0c2I5U0ZNVWpod3pZM1NXVXMrRG1SeVNoNzBUaEpjOGh3aHAvdUMz?=
 =?utf-8?B?M2N5TnJsaDl3YmcwTXAvbC9UeERlNmV0VlVHajhiVk5YWkFiMkt4YmZJVjVW?=
 =?utf-8?B?SHZVVlowOGFBU25OeFhUVEZuakNmbmpUUFQvTTFNZnhzU2xpRjlEY3M2c3VT?=
 =?utf-8?B?MytIR1VyaTIxUFVRa2xlNFNDKzVIWU9ac1FkQnlwNnkwaWNtNmtUTkVicThO?=
 =?utf-8?B?ZUhRcm42Yi9HbHdEWFF0OWlmdXd2OTJIT1VRVjcwWHV5NVFnVThFK0k4Q3Rw?=
 =?utf-8?B?NWpiYWp2Y05adjFQTHBsQ1l4bDdmTnhYS0tEdHhYbG5DNG9qL3h4SXJyKzlu?=
 =?utf-8?B?RVlLMU52VGx4RjUxSFp1N3NFM2hVOGhraU5tMjU1ZTlCYTU1aHAydTc4cmtN?=
 =?utf-8?B?ZmNORG9jYXYvRlgvaFFINHBmNUJlTGErQVlaT1gvREJObW9sN1ZKaTk2TWp5?=
 =?utf-8?B?eWViczNTTzNLMUp4VklZODNJcHNLZFZRQVYxZThQTVdoUXc0V2RiMDhmRWFB?=
 =?utf-8?B?WkI0S05xdnNpUkNqWVAzR1BBZlBLa2p0MVovRU9TQ2tuc2pLb1o5dTNocGpT?=
 =?utf-8?B?cHJON3lqNmY0SUc2MXFpc2J6bU5wZ3NzSDJDNStKTzc3NG1ObHRCWWgvTXdI?=
 =?utf-8?B?YzZMbGNSSnNtMTFiUitHWUlEcU0zQ3U0RGNTc082K1ZKU1ZhVklGS3dUSWdZ?=
 =?utf-8?B?ZUptS3dHdkNVc2cwY2ZTcjFHRlJ4alNJRmxMZ1NlbG9iMFMrMXJkdzA3NlM1?=
 =?utf-8?B?SEhEbm9VQlNVTGk5ZDFlM1V2bVE1SlRQSk0rVHFQSGpZOHRwVkQzcWhVQ2pz?=
 =?utf-8?B?YmpCVVlEV0E0bXhPQ256citRN2NwSWZINE5ibjRyaFBvbU9xTGZkTkVFQjQ3?=
 =?utf-8?B?U2tpL2wrWFNUKzBsc3Fncjk5anBGMW9QUUVGVTFjdGhtZkx6bklhWjArWjMw?=
 =?utf-8?B?Rk00eDZzSDQxcUFVS0lOOFZyTWtzNmVSVVVZdXN2MDlIbFZXZFlGT1A4eXIz?=
 =?utf-8?B?YnBjeVl3TENzSm5JNS9PTnlITjFaQVNXQWRZajBSV3JCdy9NeGdkNFl1VkE3?=
 =?utf-8?B?aXN1ZE45SmFZa1R3WS9pams0QXFRazhyRWFyYmRpV2oyRDYwVTFwZlRvVnpB?=
 =?utf-8?B?Mi96bStXaFAwZmZjZE1EVDJMQUd6RFM0QkdvWkF6VXdiN2dTcEYvUnlDWkFB?=
 =?utf-8?B?TFRwN0NOMGRKWnB4djErcVBtNEY2cWhaTGs0YVg3djNPdm40ZlNQZkwzNGtO?=
 =?utf-8?B?VnlEWmxzVWVkSU1EVFAxRm5scS9Ja2FZZ2hvdTJCQm1sYmhkMGgyTE0rdTM1?=
 =?utf-8?B?MkhETG1ROGlPcWJ2UU9UN3AvcjFEb0h2NlJFSGZLTzVWYStiZGhNbkx2V242?=
 =?utf-8?B?bVJ3NjhXZGZudFhmYk5qUGUweDZIa2VzMTVwTGlDMmUrYkMrQzFqWEFXUHYw?=
 =?utf-8?B?RDNydVg0OThGczNTUm41VGVWMEtycWhDaU45MFgrWHdvNmR1bUl2Y0orYW9Y?=
 =?utf-8?B?akR1QlNMZGtrZzJYUTJMVGVQZGU0bk1DVW5OTFBxWUJaYTVWWjBZeUdRTmtD?=
 =?utf-8?B?TFJTdDEyUngvUW9HcURiZ0VpcmNndiswaTdmcW0ydk9XL2U5RU54cEdTR2Vi?=
 =?utf-8?B?cjRlU1pVaVg3ZjIvaHVoR25CVlc2ajBxV2ZkYW5kQ2lVNDErMGRYak0wTDZl?=
 =?utf-8?B?YkFhREJ0eTI3YVNzZWptd2gwKys3Q2FpK3VTRDI1emtTNHh2ZklOZ2lucm5h?=
 =?utf-8?B?M3RXM3FSY29QYS9ScTRjcSswWmM5ZmVPeG8wVGVXaDVCZnRZcHFuVVJyVnBV?=
 =?utf-8?B?Y2lqY20vZUVZNDhQM0xlTnduUzRqL2Y3elRwekNrTU5nZ0d5akVRMmR3aS9r?=
 =?utf-8?B?RkdYcWM3Sm9VbDdqUXRXMjBBMlBDVGc3NkYyLzBHRUZyYTdDaHFkcnVPWitQ?=
 =?utf-8?B?NDRxVXJGUTROcEphbk5IcTdDWlVSVTVDM1Y0SnFjVStKbEZNem5CbWhFbnV6?=
 =?utf-8?Q?Rx4890OFLDpQvFUxgHn6q+IIi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df85fb54-eba5-4e61-f6f8-08da80654d08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:29:39.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aZDMpReVHI5Z7TYMDnnk05rSbi373LzyY0FdqvlqdkGvwVFk12ZFiJ1MEVaq3ZX3kt3Z6uQQ114STc04HKcGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900

On 17.08.2022 17:21, Anthony PERARD wrote:
> While we already have "--no-print-directory" added to the make flags
> in some cases, there's one case where the flags is missing, when doing
> an out-of-tree build with O=, e.g.
>     cd xen; make O=build
> 
> Without it, we just have loads of "Entering directory" and "Leaving
> directory" with the same directory.
> 
> The comment and location in the Makefile are copied from Linux.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


