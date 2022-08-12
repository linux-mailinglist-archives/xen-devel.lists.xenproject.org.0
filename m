Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A4590DC4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 10:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385422.621055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQOL-00034V-Vv; Fri, 12 Aug 2022 08:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385422.621055; Fri, 12 Aug 2022 08:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQOL-00032d-Sz; Fri, 12 Aug 2022 08:51:41 +0000
Received: by outflank-mailman (input) for mailman id 385422;
 Fri, 12 Aug 2022 08:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMQOK-00032X-R7
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 08:51:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa973b80-1a1b-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 10:51:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7915.eurprd04.prod.outlook.com (2603:10a6:10:1ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 08:51:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 08:51:37 +0000
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
X-Inumbo-ID: fa973b80-1a1b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EplrB5G4M2uS/YLeAduG2sWAxQConYxbG7CLSMywfg7JW9vrDSLOJw1CHfDPDKceU3AMgot3OL/hnvFCgGRL40GihrKaYcSwB7sBKX/gXRezRkoScNdf03efe16g0j0bb91n1AUBn/Bg96u5WtskNEV35RxlbQNtiQ4vpmDUyGfBkJkKgd9fGg9ejMjmxrNwf4yxgi73lyIsM7dCFvEVB8b/+WSqXYwilAe+xW2P7c4Zm91/Ok30WYCrz8U0aa76VEEXa+MBs3nDQu06JbsEdc19N1C5KHq6/FYdEyi3JzssdTEYRgkEL93Cpmq2fpu3GATgvKt16z+Cij5Fn8sWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XetQQuZpxIoA6grAPLL3ySsHRelQ/A6IloUfXvDNr9o=;
 b=Q3ZLFdC40aTb/sQqU1Ewiu+fRcJP4AHSSYDtxqJc9juI/pC1k90hXILPgCIq7m8/jljthUdwoZmLpDEVM2aHGMHCEfdXbnKkjOgQbLNw+GQZh0w1/QUj5yk4gE6bQIQf+SKta/+spxcG6+KCjuNiZ4uIJs4WLdgK3coQrTTwK692q4EJKsnD7w8nk68gmn9aKSWU6YmEawk51cxlcEeuv3L00BVdoeFPyH4Ss/EHF4nFzEBo89vf/ma+G9wNDjvAW6iI8MJ+7AZNBx2cy9DzCM3e0EPh5Nyt8P9XD2Ik2Iq2qKNlbgqAzlXQapoDYKMZboWkM9QfOWK0zRzLryrx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XetQQuZpxIoA6grAPLL3ySsHRelQ/A6IloUfXvDNr9o=;
 b=hYZLFBiysw1N5owO3FPM5eNps/NqjbsBr+8VESk9DMfwCviD+WC4h3wiU3S482AtRrzPOex2VR4jJqXqTy4wugcL2yI77k7VhbQg7oh80AxLWTmJLKyXRL/BTn0HY9ub2Wyx6FToRQOn5rK8GAOm5dn+rb4AJl4wD4JhUAGQdGcoji1DmB7za4+FXs/zSUGTkPNPtvnXz903sw6CA2VxeWhIuZ5QcBIiBg6s4EkXrBPEfD3chDiouhc9opjFWx/qA43vUN5krtGi7GDWCCafm8E/t8whN+v6FDZde9oRe0YDIidPwg/UKz6YBr34NtoSXqrPNCl046DePL9FJlYVmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f11bf6c5-9e84-6bfb-1a36-a44cc42e1286@suse.com>
Date: Fri, 12 Aug 2022 10:51:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/8] x86/mm: adjust type check around _get_page_type()'s
 TLB flush
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <40042c40-a2ba-e491-d16a-4bacbfc6154e@suse.com>
 <764ae641-d445-f4ba-662a-c965ebcc582e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <764ae641-d445-f4ba-662a-c965ebcc582e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81b61133-5d3f-4041-d679-08da7c3fddae
X-MS-TrafficTypeDiagnostic: DBBPR04MB7915:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZfdVPZRh04M3BPsnm3sygYcKCF/jJ/BM1vk+eSQQax141cDORG8jD1NpfOPy4y9i8o5ygjLXYXFaKn3GJgiSCDc120bkh8OPK0WSb+dmWnPv0C7Nf2y9wcNvCz0uRqD6LNXcz1gLJoRudEXY7C8HPwO8uqwRm3RT8rDp+qdFl39LtDm2oWT85u0zRkGNQzwzuswG2cK7qpZYijhPg+b+2HM702AwSflDifZpp7EdiEGBe66qndU4tceeOcmkMjnuok3GpOMwki/AS4WJzezyqkyArvuSnE5wXZ3knXcx94e7ibdsexvKV40jc6Cpv2YhHb70LamRonAhRhGYBr82SEbGsk8JvBqRGpeHcwjqv2Me/BB/uNQ+fCYYNgQtzTrGC9yPOuwd2dGQX1dQPKVCtTEey045Sq5EwSjRI1G9BxL/hhrm9VKOZw4rejzRNJ6GzOcwK9ghFtWlt/GwQ/+/5Pa0hM4x/PPpHMIymp48sx23UWBpKpmNMXDSZ8gE3v0vdDEdUGsZ4GNM001s3pej2ASO4fGtHT3Wn3N39REe8C3y3/xfmp8bTdQRbAQK6owdoxhJ0MLYsu0XlDNJ1hxUmUamS9YDZYXZn8Z2w6JCMES+AfsmmQMn0t2WydfdLcbsZE6Kea+FdepahJWOYdZAX05zvXAlD+iKgGNltdYtO/Q3QOdmmmJa++2+LwAl4E+qoNaia6foW9ez0Pwl6a2Gnx/406u642qIxyTRmpokWdI0AtPq36ctCB4IKYVpAxwe9KsBBWh8Bce+K8KJXPx6/mcnbK1D2QEltxcAQMOtAgAU1VEhCtgnzJrZ3E1B9D1P8iGlg25ie+AzCKVj6SF7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(136003)(376002)(346002)(6506007)(6486002)(66556008)(66946007)(4326008)(31686004)(66476007)(478600001)(8676002)(31696002)(8936002)(38100700002)(2906002)(5660300002)(53546011)(41300700001)(26005)(186003)(36756003)(2616005)(6512007)(86362001)(316002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlhvM2I3blpxVldsSy8xdTRBb0ROQmVnK1kxUmRFcERadGZXR0JmbUkxNUpw?=
 =?utf-8?B?WkcrUjlSNTFHU1ZSREtJdG53SG9peXo4aHA1LzUraDRNVWxRUjlCSE9TdWJy?=
 =?utf-8?B?bXJhbFN1RFh0NVozN1pmd3FiTFVIa1pJc0R5QjU2UXdvcHdBT2wrdTczUkNr?=
 =?utf-8?B?OWJySmc3Q0dXYUd4ZTZ3SlFZb3Q2UTI2d212UWtVcExGc3VDY1hjeFhZa1Rk?=
 =?utf-8?B?NTBNblhzTTRnWVJqcTRYbkhmNzczRnA3R2FvcjVhYzZid2x0OGRraE1EZy9J?=
 =?utf-8?B?ZlNGdldQdFEwckszY3JBVmZ2SWI3Rk9HT0pXbWQvV2t0UDM4MFdIWTg3L3NX?=
 =?utf-8?B?NHJ0cHZuRzZlRitFNkdSTWpQRjFMQjU2RVFJd2pQZERaWWJrYXlRS3htV01R?=
 =?utf-8?B?emJFaXdMdTRJeHVTTFkvSXVnY0UranZtdHBUb3p5MlM3c0U0L255ek9UNHZD?=
 =?utf-8?B?dmFFZkZ5RTZBVHVpZU5vU1ZheWZOOEoyVnc5eUpGMWVjTUlNUGxNdjVBSWtI?=
 =?utf-8?B?bE8xdnBWT1dHcVdEMWRpWXpwU0doaUd0T0hPSkpvV2tFbngyb2NFaVRmV0F4?=
 =?utf-8?B?SjhtSzhIQnZTeGNXMFJ6ait5MTVtN1N1SCtHM1BQbGdvU3pCb3RuQXo5dFBQ?=
 =?utf-8?B?TjVYS2l5blhDTmw1eFBwZzV4MVVPb2FLOGNNUzRTTFZCOHIwL2lrYWpveUQ0?=
 =?utf-8?B?ZDI1aFBIQ2ZrTHFmRUxxVkh1UFB5Q0U4OXFnYUVsSkQ0dEVoUmVQRjcrdUR6?=
 =?utf-8?B?aGhOQjFadm5OeERWYUZlcDFZL0hMcXUzamEzMk9XKzZZZDBxWjJ1V0I2b1JZ?=
 =?utf-8?B?QS9MRGVNaHpGSTN0cXU0WFZQaGpLTVAzSkYzbVRGL0thNkQxMWZodDNOK3RZ?=
 =?utf-8?B?R1A1ZHRFSk9Wa1Ayb0pHZlVzejFBMjl5cjVOblJiaGdqQ1U2RU9SSjczYnc1?=
 =?utf-8?B?VEV4cnNqU0tmNG1vYVh5QWxndnVmMUt0TVRBUWtGWUJ4U1ZUaHhzekhHRGdW?=
 =?utf-8?B?REFVUGsyZ3hUY0NWbGtxMkE4V0JwVzF5clUwU3FtZVhZSVlvUGhPYUpwMFRN?=
 =?utf-8?B?VkJhT0RUYjJhekx5MHFMa3NMYUI5Y3B0VG5NK3hibVdYbWs0U3BlOThRbUhJ?=
 =?utf-8?B?L2x5N0pkM1NkNG1udXd0ZE42WnM3VkI3amlRbnNHdmNsQWU2azNlRTRCYXhU?=
 =?utf-8?B?UEZuMHczVzcwWDVyVnR2YnhOY0Y4VWhkQ21rd2I3M1d4bllCcjlCVndIWFdr?=
 =?utf-8?B?U2lnbmJGOVJkbWgvVDdKRjM4N3J1RDJ0cWFKRHJ0VlFxUTdhSHNvb3R6ZnQx?=
 =?utf-8?B?YkoyZ1EySWhCN29iR09NQ052MTlVL0ZFQkJKUmFWVEJXOG8zOFhUam9EYXBk?=
 =?utf-8?B?VUwrSUgvZjhtdURVemFYRmN6UGsyUjcvaTNvOTFKeDkrODVmOVNYaUVvbHZR?=
 =?utf-8?B?QkRra0ZxVTBVdXhCVjhvbUZoSU16aXhDUDhkZStXT2FTRkU2Z25TemorbWVL?=
 =?utf-8?B?bm1UNjViRmJVTmcrVTd2cXRvaVFxMEJrdTJhQ2UwdllKQlIyb2Z2Y3M3NHlr?=
 =?utf-8?B?bGxtR0ZwRkU3ZzkwdHVWd1VEUXBBZXZVZzk0SThXa2tuL2hJMGlsN1AvV0Jj?=
 =?utf-8?B?b1B2SnZFczN3OXFWVUdxZXlpQng4SVFiKzJKUFl3TWxOVHg1dU9UN1hyZjJX?=
 =?utf-8?B?NzdOUGJyQXpqTkdOTVQyZG1jYzFqdWdQbFQrSlY3K3FlQTBOMk56dUlZN2M4?=
 =?utf-8?B?alp0YjJmd1NGRHVtb2xyaVExMnF4SHNmSkFwUDMrclRyVUVhTTVlS2ZwQjc3?=
 =?utf-8?B?NDVjeVJiKzFIblN1R1hENkp1UUwwVnRBY2VLUVArQlFmVXVpTFZYRDlsa21X?=
 =?utf-8?B?ZlJ1Z2RZRUloa3RPODVMZGFCT1JDcnNYTCtxdWxtdFRpVG8vdm9nWUlBRUVj?=
 =?utf-8?B?R2lFQ012K0sweDNLcHlpMlJDV2pZS1kyOXJZeWFGeEM5R1h0OTV6aTRGb1or?=
 =?utf-8?B?NitlK2NIZENrNmxicFlSdkVFd1dIMmVud1JLQ3JsRmY4c3FUbFd1KzAvdFFz?=
 =?utf-8?B?RlFEeGlhdk9OZytoZ0lkejNoeFV0RlNGNzAzNi9OdXpjMmxsMmVDUytLWE9t?=
 =?utf-8?Q?uVyMrc9kYRB4FxE+/4BPi1mUb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b61133-5d3f-4041-d679-08da7c3fddae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 08:51:37.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjVO4cRzmM3Yj/AFvKaT/FZ3SWs6mHErncpsadzaqOmhsarpTf+/dOPy3oR0x2lZiCcz8Wt54JyOxdJQW2HKKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7915

On 27.07.2022 20:25, Andrew Cooper wrote:
> On 26/07/2022 17:06, Jan Beulich wrote:
>> While "type" can include PGT_pae_xen_l2, "x" can't, as the bit is
>> cleared upon de-validation (see also the respective assertion earlier in
>> the function).
> 
> While this statement is true, it doesn't really explain why this is
> relevant (or not) to TLB flushing.
> 
> As far as the change goes, it's safe on 64bit builds of Xen (I think),
> but would not be on 32bit builds when this logic was first written.

Actually no, I don't think it's safe, and I therefore withdraw the
patch. (I'll re-base the subsequent one accordingly, which you did
give R-b for already.) Whatever content may have been in an L2 table
which is to become a PGT_pae_xen_l2 one may still be in TLBs / paging
structure caches, yet we'll replace those entries without further
flushing.

The opposite direction (previously PGT_pae_xen_l2 trying to become an
ordinary L2) is "fine": Due to the Xen entries still there, its
validation will simply fail.

Jan

