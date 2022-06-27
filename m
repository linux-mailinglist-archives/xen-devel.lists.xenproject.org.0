Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88255B9DA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356658.584938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ogx-0002Y2-W0; Mon, 27 Jun 2022 13:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356658.584938; Mon, 27 Jun 2022 13:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ogx-0002Ub-S9; Mon, 27 Jun 2022 13:22:15 +0000
Received: by outflank-mailman (input) for mailman id 356658;
 Mon, 27 Jun 2022 13:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5ogw-0002US-0z
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:22:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254579e4-f61c-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:22:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (20.179.234.89) by
 PAXPR04MB8639.eurprd04.prod.outlook.com (10.141.86.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Mon, 27 Jun 2022 13:22:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:22:11 +0000
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
X-Inumbo-ID: 254579e4-f61c-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EO79UDzHgj55nTlEkAv/LCDfxm0UK0CQmCwHuUPE93lYWAUYMST5Qs5OKSdyRbOJst5I4POMkF2cPMfZ6dsCFQ1pmpC2BJTq210errOwfXfJ7VJL92vvMzmum1/UZbRpimJgb9YloYdbj1/zeNcDadMtZx0ke+Lhbb9H535E1o2D1MJOcXWcXzn7Mb61t13nUR5gKyM9eoTqt59qtWOUuulj89WmkzowTATT7Xrbvb3Hae5Rf8fX6eJUEyLAS5rkJ711BkYMJQJemL9Yffh9fM8JnpmrJFAio6aVjPHseURGBb802R/RgtnhbBOmz/Fjm/5pC0dbKJrKGfENS72YXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=VZxtFTlsbeYKqoyoP9tVUjwcR6hbWVpUKDJ5+u9qm9SdVpa3YxR50mo1YgGPl08AiEmReM55GaDfx94/1IEvqLujPCq5dVSpb+NrET6y47tY0cCFm+jdCOccKzNaUsxHx1JrPZqGDHOmgQZRL6EqAnLa2EjmkpPzWQEFMd1YUICT4wR7xa9iQs1juXuuyxiNi1jv3nLga7j/ttH491RnPsQqqNJoe4tX1Kw3wkAVyZnlIlzmRF5L0LI1upEJdn2U2wWm/2+QH/RdDYbL1KtcNe2IMlWOrNhkDnJghAWyfOGuTsoZsysSwVomhZ2DWdeJQksgtCM/Xte3wxnWQi1MHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=LmXFW/onTFzbM1elxXLzc2Bc2w/D9vIEPNd0iNk5kuSbfIePZ5pLJa82TxmpZ8oIYHFyr3SehHfjN2pi+ASmt4LlS7uHVYGYuIGGLQRiRSM/R5IF5YOhJ8p/X91aVFZrZStB2uFFn7my8BXR7Q+kG71pS1z2fg/7KHk0rXXXqK5BJ8tI9WJu1Pv0/dApTeV1ifMV+loE6CYI8fiasp6gcyoPXvDOq/ntfEWfEo0zFe1mrb+sAfQPzNp8rhCbCBBn4GvRcZU2zc+zl90cOyXPMl0PS0LAPdejjuZOmSue/QWlRIO9TXVSNXt/eY2Nljx6PrJU9VIFNVZv4bouGSDoxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11a782c2-9a8f-62fd-8c49-2ab16f5cb4d4@suse.com>
Date: Mon, 27 Jun 2022 15:22:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] xen/domain: Use unsigned int instead of plain
 unsigned
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-3-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627131543.410971-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 334491b5-629e-499c-e6b9-08da58400afc
X-MS-TrafficTypeDiagnostic: PAXPR04MB8639:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y7z/y1Ly6xoNaJSNK0itKToLr0thZmAaLyY5fqHyceUFWD3MrUDfvoUzHuWJQ5QCFO+yfaygADByLPezNHLoO9nt4avEGYHfuI9qZ643qHr1gthODdequq2vHqbLY+2I8qe7jxMK0fMLhuj2e8nfy0hV1vLlMxSRRVNKn7gcZjT/ebT1xfhbDbyLO+5DcOvoGJxlTmv877PD6jK50gyOTugqwpqrq7lj52TECrWqD+yABR1SBDZ+6uVcL+osAGcf0/xTrIa/gBsqZFYw5gd2Fyac7GTfsVxjahh+2Q46qX2uMR2mJPnHS2gKvafI+eFIcZnM9JratHAJL0wqbvDX80OYhTkrB6MwDTBV7QtZ3XYfwmEavOQvTBWbtMLCkDF25XnlivcNVS773PGP0yeFBqqJlypfhq2/rUnXHaVUFd7u/zHT6saqBxc2hX69I8eczsT1KzDSgzNNGfIOuI+Q0rG5tq4eoJxW4HjvjwF8KECfLvyyDuepLNeTrDUCjAZBILq0ocmaMm7zxfEXk/c3kh9cdHwuBdRzJ+HrMEriYtPQ54JUPbLq9V/xjHFpWZP+piZ8MzTvlYW6HB3tw9WGTcQovvfxkJx+PGjg1Te/lhF4JgghyiFK4dJXuBg6SGsZJZUEcgIVtTVsKQOu5fleAb8D9LI4Pf3BwSdBrUd8gRAo5uxFcInZypMT0SXv/UiJtTLvCUpDnk2wRzbCiZU0St4wf1US8Y4/g/DQla3ya+w8S0Pg8+I8s9FQVyW6PpueW8KFSx61Eet7o7VfvgNcAeR4ggXiUoAS2P/T5jWYBaEoPebX5jICKSF/yuMNyBWS5VFKLw3Vql8XaOhbHlqREw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(136003)(396003)(346002)(316002)(2906002)(66476007)(6916009)(31686004)(54906003)(4326008)(8936002)(53546011)(2616005)(38100700002)(66946007)(8676002)(6486002)(66556008)(6506007)(86362001)(478600001)(36756003)(5660300002)(6512007)(31696002)(41300700001)(186003)(558084003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2YvaXY4NTdEZExTVklUYnU0NWlsZ2ZWZXlUaVQzTlhZc3E1aHBSKzF2OXdq?=
 =?utf-8?B?RXE3VlZ0WVpXUXNKNFJnVlozQnhVV1pmbVlFTXFLYXJaOUtqczhBOVlSR28r?=
 =?utf-8?B?ZldpQlZnYk1lRjNMZDhIWEQyNmdtU1h0S2VWQWhQUlMwa0lObUJVRVQxdlUy?=
 =?utf-8?B?VFJ4QnJwUko2OVJnaTV4QUJ3UmxScEN6bnRJamh3OVNNQWJIbmFLZzYxZ245?=
 =?utf-8?B?WVY1QjFQUjVoZXVZTzQ4dUluWkNLcHllQUpFdXFBcTQrYnd1aHE2WHFHd1Vw?=
 =?utf-8?B?TzRVOGl5OTluVk9lZDNsWDZkYlFFS1VuL0xiR0tKMUk2OTFhb2Nsem9OZC9m?=
 =?utf-8?B?dk1VR3RnbnZqdmt1NFNjR3pBdHhIdzJKZjA1b2VvTnJQZktLUjVFMkhXV0hr?=
 =?utf-8?B?Zm5FYUJaWU11UUI3UVFLNmtEblFieW51MzNXYU9iV3dCVFRBNitnWVZwWFMx?=
 =?utf-8?B?L1FreFlHNjVrR2ptTDVTamlNbVdqNm8wMWl6Z2tRZ3JDc0FPUlZ1SVhQTGJp?=
 =?utf-8?B?SXk5T3dLTUp0SWk4ZU9EVmpESXY5MEhBaWZRUVVxdmJMNHcxd1FjT1pUM1ds?=
 =?utf-8?B?NlVKcXBVMzB6cktTZnRXbFZOYjh2WnVXYXVTT0VGcFQ0SnZMS0VWT3FMWVds?=
 =?utf-8?B?NzlEMkhSVERqU3YyZGNORnhoR2xCcjMrQ2hHZ09ka1dIUFpndkYyT1pxV2Y2?=
 =?utf-8?B?RDVtMkE4L096OTlLZ2dqdGRzUEIzMDFlTU40SzBwSTFLa3pQaHQ0Zjd3UTVt?=
 =?utf-8?B?OTZIajNOTStLL094NjVtUll5azBaQmZUdXNPczR4WkNDdGh6WjBUUHREeUVp?=
 =?utf-8?B?Mk9NV3RvQldsQmJEbFZONzVWT1pRZXY1SERNSUdVeHhPYlJMU0pmaGpkZDVK?=
 =?utf-8?B?bEc2ek50MXE2dVZtTThqWmt6UUxWVEJkV255UThvMUNlc3BmVDBpWXpIK2lY?=
 =?utf-8?B?UTUxZ3ZtWVdGUjM1QTdEZ1ZyNGh0a3BCajNzZFRqTEl5UDhLanJ0aHZRTTR6?=
 =?utf-8?B?TUxtSWtiVjJzeGY0NVZ2SVRnQjNTdS9ROExyVFJ6d3BmanpKTUdNMXIwanI1?=
 =?utf-8?B?ZFE4T2EyVHdsS1B0K1RsNFRQS3hzSjMvclhrU1o1RlljdlFKcjVqd3FjUEJY?=
 =?utf-8?B?YVZrNmxLaWlTNFVIbjFOVGFCWkl6dFpNNGR4aUJrZEFHTEtndWNNVnpmdzEr?=
 =?utf-8?B?a09QR2FqY1JoMEFqbFlxU3h5OFR6R3RjWDBEYk1SNTRheit5eU43M0JiWkNJ?=
 =?utf-8?B?QlFYejRhNmlOR01MM1lPUXpFaVR0OWs2eWVpajI4bmQ0VGQvWW1ad29MQzlI?=
 =?utf-8?B?QUNRcDd0V0Y1K0hBdlNMWnd2NFJRcS9lZ1Bic0hVRnJldzZjeXhmNGRWUnJW?=
 =?utf-8?B?RVBHUmVmME9WYW5GWVk5K20vNXF3UE1iM1J3dDdFb3l1dzJlRHlNVndhKzZk?=
 =?utf-8?B?MG9neGFqNUN0OW9WTHhzVDlEaWVHb1V1OVd0SndjZ2xwQmdOWERKWDduWEpB?=
 =?utf-8?B?L0Q4U2VDYklWMmpSY2hvdHJIanpHM0ljYmVuTXFlNGRVU0xaRGVWRHVxbUtu?=
 =?utf-8?B?Z3plaEs2S0VMUmRQb2YxOXVJaCt5cjNrTVdPR3ZvZ1VoV2s1R1pCRW5tUVRU?=
 =?utf-8?B?UGxRZzBtZlliMmh1WlN6YUVEZHlySWlndU5OMG9nL2xmR2prbytrVzg5cVZi?=
 =?utf-8?B?TTVNcUVqb3RZOEJ1VGwvd3lnL1hSa0pYY2xEaExqa3VHaE1SWXJzN0lpQzhZ?=
 =?utf-8?B?cTJzWDRLbGpSazArR3dpYXArTWtoeFpHeVVueHhQWG8rSGJIT0tIb0U3MndW?=
 =?utf-8?B?blEyZUJWQWI5ckthWUEzRUorTktJVjdwdXpmRlFqRi94YW5jb3d4QkZtWDZZ?=
 =?utf-8?B?Z0w1T0pjUm1ad1NlSS91OThqWWNTaU56RldNTXVjSnhZQjh5OEVvcmUwZ3Zt?=
 =?utf-8?B?OHkvYWlXVTZpakJLRUl5dmR1Q2NzTDBjaFhpOTFVVlFxOHZtWkcrTnNrK0No?=
 =?utf-8?B?S29aOVB2K01lcnNBZHpxQkFCdTc5djhtZi9meG5ibW5Eak1qT0FsK25YaFVi?=
 =?utf-8?B?QmRNRHVnTTJtZGkyK2Z0d2xvUDVQQytZaFd2Q21qb3Q2NlJrNFpPSENCNTNa?=
 =?utf-8?Q?wZCBSKeFfdYRb9Up9txlLkXJl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334491b5-629e-499c-e6b9-08da58400afc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:22:11.3406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75jI+bpHglQ2SgJCCJ3KUfvS6Xiywanbe28GJAjCqB5ee9JRzoXKVNyMJb8OSEsSbq9SWKAgNtKgZ/eCGHZsEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639

On 27.06.2022 15:15, Michal Orzel wrote:
> This is just for the style and consistency reasons as the former is
> being used more often than the latter.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


