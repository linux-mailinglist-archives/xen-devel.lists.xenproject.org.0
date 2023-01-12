Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892576678AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 16:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476271.738358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzEf-00036M-FD; Thu, 12 Jan 2023 15:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476271.738358; Thu, 12 Jan 2023 15:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzEf-00034M-Ba; Thu, 12 Jan 2023 15:11:21 +0000
Received: by outflank-mailman (input) for mailman id 476271;
 Thu, 12 Jan 2023 15:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFzEd-00034G-Qq
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 15:11:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d58f2a5-928b-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 16:11:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7407.eurprd04.prod.outlook.com (2603:10a6:800:1ab::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 15:11:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:11:15 +0000
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
X-Inumbo-ID: 5d58f2a5-928b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp0z1NsmVxnz3F9l+1K5a9hswCCRWph4PNgAi0cubC7sEx0FN2Sl9owKW6IKF14qgJZDMjJ8pnY3dKLVn4Pth2tU4BWAKTt7ozY1GFcvKiMIw2zeEtsxjxO9xdUjKRJSf6gcAUDNOY09ZHMaTUPjczg3HZUPD9jqfE4IwSA9ecYexpoakB7vAmRy0Zo3D94kKCIzXNf7NTaAYn5zt9cjQBzo+RIt2uh+TOgPuVCdVPhLMSv28EeKSFNNXjnLL2i/dbZAwW6AZnzxQ+MEsYXx+VMSNn7708vdOwCr/TP+pP9IwN0xSyd66hoP/HzJszAXD4TPFhsVQOSGxog9MohIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/iseJp9/k6CNN8jq1PHuSQPPN3JG/b5ahqOgQKVN0w=;
 b=EaoRJJsFgz6+nCJllJ3Iufrxrb6eDwDZBHIDBgC/HID25iEXO/YUd7yoDBBwuITVO2KP5f7BJVUddVzuJsoWuAmICmjtJfnkjFojHgZC+3J3OY0Fb17V4K8bsQXWj/vqoLHhCd/2QpiRxnzNZBdE87by1lTuzlMnWDgZiKJHZdCGl33cEzmlazYj1rd7aWNlSgpABS9ax9GP5gE1JJyQZG/uZWPtnGFDPtRgHF1ZvbXIjAzqch0CfKnS4eMBAFEVJiTrKkcVg4wOfyzs1kjZI/vnRNxTS0Xy6bvfBqggQ7l5v8fQxRusM38ILUSB9+/+4ecxohszrhWO6mGXPmsdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/iseJp9/k6CNN8jq1PHuSQPPN3JG/b5ahqOgQKVN0w=;
 b=iDy1uu6UppiEAsViEG57A7mItYWQTZ9PBZP0kVRc8CpJpGCBTE/lANEHY/iFXPZlnfaA8TvXrWoIdBEf1j+z5QJ8J26VwoT4u0x/SzsydSyMHGK7snL3pXS3eQmPL8L1yzbete3uGbAkU8/+3epT35FY7HpoWITrEQEIsqW/kK9KxN8qjuISwhU/tKLUxkE5Ug/MxSlcLlq6Q3xRYUi2zDzyIJYT+QxaS+SUi2IhqG/YzxuOYDkz5Nub+Wv4DZSVQabO6D99flPmHIQ7n83vUB4hPxB50YYhqTdby7TO7HHiB/9M2Wm4karFB4BAcTi5mOT8MtUhhQGzPvoxo9Q1Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86519ac5-1f37-f3a9-f586-9c41f0ef66cc@suse.com>
Date: Thu, 12 Jan 2023 16:11:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-5-andrew.cooper3@citrix.com>
 <97d16968-57fa-0114-1a93-4d0d253b8172@suse.com>
 <2e568a8d-02d6-5761-8b55-c37a8de1be0e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e568a8d-02d6-5761-8b55-c37a8de1be0e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 36098c67-ace9-4efd-7587-08daf4af3ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BzTzKzwUb/lEl/FKSiaS6PYSya7uHcK4pqt9uJvYlfLrWyhhmbsWxd2lY1kulaeHJ8Y1kAH44DdqXJrp2FiFQn47VGtcYeewhP6JbAgwO+ceEsZ2FaImhE40k8PyrpzgZYTl2f4Ceftg18Hb20mejcJcyF5LLldNyr1uFta8Mo0QzZQ/VoyQtjiXgWMyvofDZXkvzbI0QVzAsQqV8fhQJiOdIBs/dVM8hZjLho4Xz64XYq6F0UfcnVt+pxRfF0NgZhJxNCWrtD8BQU0umq18vqulpyKn1TcwvmTcCj3lrWetoDZcTl4b0u3aTtOkqgZRFCd+s8o7CJO1cfeFhozIJfjFCtqDuWtW+pxri6UUTRsvWkmWUiXKbhSLdAEEhryzctB4ztdID1WuoLS2GFf0EnOV2vF6RLPx69mkxidSmorwaJFyHOFP7xbxL2yEtMip6rnCbOYbdPtk8nDIO6rgE3pz/pBqcHxPlMD5k/BELHir0Htoyk9wyEbI/nQtDbLfMlUJzbhscglTbBx9JV6+9M0KkEoxD2JF6mwhFZNn6nyP6RqpPDoC+hBTR2clyX2Mpge/wP0AXPayhrJO6tVtGtjuMYeUN5ZNptH0jWVWPtBgFHEiFd4f1LYOLlx0qtglds/cvqqtTqk6yA3YGLKkQrUdRy280O2ONjaRUSY2nZ84sQkaUfTT23HvG/KaBg2k7O43UeGzcxLXJ2ThmKLjpvyeWcKMMgyG/jUMQAGV3uI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199015)(478600001)(6486002)(41300700001)(38100700002)(6512007)(86362001)(31696002)(316002)(54906003)(2616005)(66556008)(26005)(66946007)(186003)(66476007)(4326008)(36756003)(5660300002)(53546011)(6506007)(2906002)(31686004)(83380400001)(4744005)(6916009)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBYdGdVL1E1ZjhiU0tqb2V6MHBzRHd0emRuT0Z0LzRWeW9iMjdUN3Y0R2VH?=
 =?utf-8?B?b3pSYWF6SlFyK20vYk1SdUJxYUVpdTRtU284M044ZE9VWWVpNS90Z3puaEMv?=
 =?utf-8?B?Ui9RK20wQjJFcEFwKzZqQkRBd21MaWhCUWUwb2IrdkNzUzRIdlFFVk5WZnRV?=
 =?utf-8?B?VUNseEJhck1QWWNpWll2c2UvWEFvWjFtVk1nSmhMaWdQNjZoN3dGQmlmdS85?=
 =?utf-8?B?U3IvcGxCMzVlMktNQ2FsUDBNRkZET2VPenR6WjhJdjdWTmNBVks2NFRTZzFE?=
 =?utf-8?B?Mk9pVWlUcmR5TWpxZzZ4VWI4eHlVNGQ4MmVUSi9yTzFxVjlZeFRSZWdFQW5p?=
 =?utf-8?B?RGd0QWpiSnd1Q2NieEtYRWNsTW5LVG84a1pGeWkzMEcrK0piUDZualhQakF5?=
 =?utf-8?B?WVIrNGFMUkROVk4yZWFJbjJoUENqZHBCQ1B5NlFWQUdQV2MrYkhHL00zb0tI?=
 =?utf-8?B?VnZZRlF5djE1dWh6NE80WHhoMWUzZ2hsUHFMT1R4SWIrMzV1SUM4blhFK1dE?=
 =?utf-8?B?elJCVHRjSnd3K3ZvSE1BcDhKQ3dmUE5zOEtHbWllUzZPd3BZU0kyYlQxM2lD?=
 =?utf-8?B?YmpJbVFMMTZPTE54aTYvRGt6aU9qdVJPZzlsM0Z1QVQ3VUdRTlk1S3NPc1lF?=
 =?utf-8?B?QW9KUWpGd3BqUE9BcGFkbTV3N1BzMVAwbXU1QzB6eGhocFdFaTNQckVsbTA2?=
 =?utf-8?B?eW5EQkMvUVNzMHdaNkl5aXU3b04zc2pWeEJMMmhVV2RhY3VONHpkU1lTMVhS?=
 =?utf-8?B?UE1iU1RIcDcwWmc3VTg4NlpjcWZVZTZtb3JOYTRJNzBWMFJBMVZWdUw4MlRx?=
 =?utf-8?B?cnRsZW1DK3BPWm1VSDBETGN4UC9nY1ZSSzBvZlVGd0Vaang2YU9aemp5aFox?=
 =?utf-8?B?Sk1MSkFMR1hmTVhGdUNkeDZ6N1VGNUtZWG92cjJPbXVwWkYrVkNIeEc3dzhY?=
 =?utf-8?B?WVRNT2htUFFQQ0pUenRBeEV6bm5DNnp1YXcwL3hOMG53L1phM1FiYkxPMzdk?=
 =?utf-8?B?N2t1cUF5UkJ3N2N2QWEvclBIaW9DODZ6azU5YnJZWFVJeFQzTERGQWJQUGpQ?=
 =?utf-8?B?ejFmTHl6bmVyaWE4b1Joa0pvK3NQeTlDZFhXNitEOTZaVm4rQ1JrOGF1R3RQ?=
 =?utf-8?B?M0d4RjZQSDhyYm9PU0lId2JMV1lkekdYQXNWVHU3cWZKNkZMcUdWNm94dWc4?=
 =?utf-8?B?ZWxHK3FMSTlIMVIwS0xyVDNkR0lUWm9EWkg2MExkTVNMa296VlJ1UWd5dkxO?=
 =?utf-8?B?bmlwbWhQYU9WNHo2ZGFybnpRS0UwbTRoWUpZdHZ1SUo3R2Y2aXFjUDNkaWdh?=
 =?utf-8?B?SlhMMC9zcjNGMG9MOElyc0lqbFpkaHhKbWxoV2d6dkFWREFweFc0V20yQ0E0?=
 =?utf-8?B?WWNZS3I3TW1CUm1tN1drdWZqSmgxeFVhMHI0UWZ6NTR3aFRDVCtMN0htK0hx?=
 =?utf-8?B?bG9iTEVKVFcwMDZHc0YxMVRuMFBRczZzTDJwMTA3d3NZYkNpdlcrUklHU1lN?=
 =?utf-8?B?dmcyRjRpSXdvSklkU1lxSEM1NzduanQ3d3lxMndJUkJIamNnVWZTYjd3bDkx?=
 =?utf-8?B?SkxsZ1ByemdQZnlKWkEvQ09yLy8zd1NscXZNSmVLWlhGMDdYQnBvQUgyK3M3?=
 =?utf-8?B?TlpHYVpuQUhBS0RlSkt6b2xwMUxPY2diTWc3NWtKb3JIcnN3N3JMWVEyT0Zz?=
 =?utf-8?B?SXdvK1RTUi9JcnprQkR5eFJGNWRGWUlXK2RPY3pqOG9wd2R4TWpGVklYYlpR?=
 =?utf-8?B?OVRWczhZUXd1dUFUMUtxNTQwZkowVE50TWR5amJCdjY3ZUc4ZjhPTXVQK2Jp?=
 =?utf-8?B?OFRnUytPRjBrWmpMVXJtZlZHMEx2UTBFNFBmRFNWaWVQYjNyOFJpN3VLaTgw?=
 =?utf-8?B?bUVwS3psR0hSV3VCck83dG5DNHRUS2VWbmQ5VzUzOEZoMEYrb2JxcEhMWFhL?=
 =?utf-8?B?bDhWbGN0dTZyemtEbUN3UTNrbWtZQ1FxS1Y2MnVuOTlOdVl0ajlJaHVNOEVN?=
 =?utf-8?B?SGlZMmlGdkFOaVpBRkw2SmVxN1czL0NlbGw3d21vZzQ5bzFUYkNxdEpsdERM?=
 =?utf-8?B?QkVWMDZRYjA0eDlITWVLQ3NHQldidWtoZGRYRXlQZXhKRDZrT0dnVThMTjB6?=
 =?utf-8?Q?otb1p2JdV72jL9SSEJz5o8zsY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36098c67-ace9-4efd-7587-08daf4af3ff8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:11:15.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mark2qVHJWiUqsRBhXbosdB/otXq7Ac5iATBfQGSDH9eu9gPtQHM8IEccRKmKWI/qqwH+rzCOIY2SnlJZAHbOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7407

On 12.01.2023 14:58, Andrew Cooper wrote:
> On 12/01/2023 12:58 pm, Jan Beulich wrote:
>> Do you have any indications towards a CS prefix being the least risky
>> one to use here (or in general)?
> 
> Yes.
> 
> Remember it's the prefix recommended for, and used by,
> -mbranches-within-32B-boundaries to work around the Skylake jmp errata.
> 
> And based on this justification, its also the prefix we use for padding
> on various jmp/call's for retpoline inlining purposes.

While I'm okay with the reply, I'd like to point out that in those cases
address or operand size prefix simply could not have been used, for the
insns in question having explicit operands which would be affected. Which
is unlike the case here.

Jan

