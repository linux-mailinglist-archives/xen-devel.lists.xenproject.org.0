Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFF759658
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565845.884410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM72L-0002iN-Sr; Wed, 19 Jul 2023 13:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565845.884410; Wed, 19 Jul 2023 13:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM72L-0002fL-Q0; Wed, 19 Jul 2023 13:16:13 +0000
Received: by outflank-mailman (input) for mailman id 565845;
 Wed, 19 Jul 2023 13:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM72K-0002fF-Nb
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:16:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e22b3cd-2636-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 15:16:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9896.eurprd04.prod.outlook.com (2603:10a6:20b:67d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 13:16:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:16:09 +0000
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
X-Inumbo-ID: 6e22b3cd-2636-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2m7Xic/2FVUsF3wd6n6/qI2h8dmPm4GALTHZOFkmF67rf0q+YHUxfLEPGxuUYgpoY626D4kmFcmldUzQDSf9ygVURVo+JE3cBshZBmLQqOMM43Gv572C3d2CUd1JBMf/XLd5HqSZaO2Vn/U6yZr6Ns4e87wRfKxl3vxmq82BHgN+mLiuZdkryYwzc73uP2fsaW7HeLflot5KIsd2Tf7qpE5Q3M0rUMvJmcwYsIx30xogPIRiTqsSL3h/4z5Twik5qAKu5G6U+wgcioXJeOJutoiW4K14YSsOSGnZzbXpqCP7/YQvxKpExk5by8dr9ysWy3UMQxvg4gquMs8LzNXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Bgp+g3AwElj32ctIFKNakFeu2sQhvPuC+/HCzNco4Y=;
 b=V+GZcKW5aZTttr48TA0angjOZZf7FOpw81QGqFP9QBNwKKPSXmWuysrLN77GCfzxhEIG98zkO/6Gds3pPhSolNbgsRz1vczIunPE02OMVV/g7seeCI5ebBfHvGtN4Hvv/WcA744WUYX3Cw1WQ/nIh9xjbVDQ8rAcuf2f9z+FVtgIvouACGNoQ81eGx5lkVPLhhc8SnKdVIt+ljPw6bC4vADlBVuCh7xBr3S6mKt6KEnLfBe+wQBhAQ9gE0ba1pccry0H72drHw8WqXHnd60vyNFDWlv+BjwjkjnVBajn+jhe1XW8yCFdJsKTO8ymtlBWG06iyY6yqizPGejxVFPLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bgp+g3AwElj32ctIFKNakFeu2sQhvPuC+/HCzNco4Y=;
 b=Qtl0HY3OGhbHLAUkUbzGH/MRQimLtAQE42mVSeOZ7w/82FfOF8sxKiyWo/yKR0u6t0kZDaxzcHkdP0mLKX78Io9FppLWH8fqvsMmqfAVSdT3dYXWeT9aceoIlcbTzcz1si47lGgY7Cpcg4b2k/BjjUXujvA3v5KG38E4L1108+DJB/qxEmuWPy/ZwAAhB/eV7I9I+byWNBARmigessI2lIeJQw/ZiLbqww9wR7SPy/agBfpJwwLe9CJP2FPA2uK7vrVGNtBcjnGR0kWUi1/4hgHiGZuu6crnzbXbR0FQ4Eg+SSXeHLWVK0ZDuJNypClFI7jii9ZgSkWnGUoDt3lr9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89590296-8c3e-5099-4f24-a2c52453d398@suse.com>
Date: Wed, 19 Jul 2023 15:16:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/mem: Make mem_hotadd_check() more legible
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230719100808.4046779-1-andrew.cooper3@citrix.com>
 <64b7ca84.170a0220.758d8.90e0@mx.google.com>
 <468474ed-60b4-9ff2-83c4-036e1252b99d@suse.com>
 <64b7dd19.170a0220.26387.994f@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64b7dd19.170a0220.26387.994f@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 31824bd6-6608-4073-26fe-08db885a512e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OSfWJ4c1yb9dbWH8TptH2HvFcvzZtgtSDa6W6k5f/aqa8apb1zrGyE802wZ6/bLLdT5scdU2Kqumer3YO0lwr+vo5zEAL52AC7Qp0N3GT7Eq1bNQC3G5qp/kuoItYHc6MzgHnRiC5viWzKHUaydNKLPs0yzAxZoOgBn+KLw8R0aXplerWqWkTLT6/NVhxfFdksjwPby46ktX/DEqgXZ/olOA0NrPJ5Pyg/PZnT7d15dBQ6KCM53pXpo6QmyMq3dfyjZszIYk3/JDk4dgNZ0TZUKDYapx4bAVVKYZGqfuli9dc5k4gbJbzb6Df76BgOVRflpTbC7l470IsD9Mdx1BSLxqOnsikTOBzJp125839ku0dM22V8h0MgZiEt0QVvnWJBiFREkJNqyJxtiZeICuEt/+i+wB7pakjlm6mlGqMWcRXg7hlm5KrBbVeGcWNJTikHizEzU9vdVmYzRQSJBMJuR14R0hfdyTaFQnLLq55IplRq4xts9Pa+2dIAaDOWT7d99Ucd0QEQ/OqZU6RfdA1bvCK1DLMNGgUpGIkBWfL88QBRC016QDpKIN6i7j+ZOfTv8kRJAuYwBuNSbWSCH7IkMceuZNkzHNHqsLXAVLE9+hs4p5QFcYhbeoJMPSLrpzeKxOQGDywhd6EYY4BiUNyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(31686004)(478600001)(6486002)(54906003)(2616005)(31696002)(86362001)(36756003)(2906002)(186003)(26005)(53546011)(6506007)(6512007)(38100700002)(41300700001)(6916009)(66476007)(66556008)(8936002)(8676002)(4326008)(5660300002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZUWXBWejJZM0tMTlpnVzNuaWFsOVlid0VGRnB5TThZaEZmV2tYMlBqbHNs?=
 =?utf-8?B?eHNHRVV1SE53dmFyTzVIQ1BwSkR2K0pYL0Nqc2NFYy9lQWNYYnJEQW94RDBh?=
 =?utf-8?B?WHdtMkhVajFrOCtacVF3V2RIWFZ6MU9XcEh6VUp1L1pya0UycjFWdEVPbUpI?=
 =?utf-8?B?YjNxN2ZUZGtOUWxXS3ZSRDllczRGQ2FGMlBYYVIvS3F4MVlQM3dWRkRZVFBL?=
 =?utf-8?B?bllYKzQ3TEdOc1V0TWMyemtxcDF0U2tqTFI1SEdiS3l1SjlSdlhVbWxySEpL?=
 =?utf-8?B?N1pjakFvUFJUaDhEcFROMDhRR1V4VDBVcDZOWkluWlpXY3djMENxc2FqTXVQ?=
 =?utf-8?B?Q3lPdGZjMWxFMkFuQlVweDFCWncvMXIvelF1NitiN2pSR0FaQklkeEtrL1Fm?=
 =?utf-8?B?eENoTGUzZjNWZXdOcjJjdUlyTGYxMFM4U1NnNHJ1bTBoZmh3VTl2UlJUNUlW?=
 =?utf-8?B?dDhKSjdkV016b3FWNlIyVjhWelpnaGQ1cCtpUEhEeTJMMGw2ekpMdEthODBl?=
 =?utf-8?B?MGZZbm5mOWtibFppeDR0TzZJQ3NZY3ZMQituQnVDME1KTDVuaHBBRUp0VkVU?=
 =?utf-8?B?TTFEUDlLT0V0WXg0RzEvVm82eUFtckhBY2FUSlM0WDRBeDhZOEMyQU9yOFBD?=
 =?utf-8?B?TlVVZTk2SVpLN2FIdjJiTytSY1N6YzJMQlY0Q0xnYXRMVitiMXhCWUJMMDlS?=
 =?utf-8?B?a1l3ckpvRjhPZTZSNWt1UEs4YnE0bGwrV1VhbFF2UWZWcStrcC9DOWtkS3VM?=
 =?utf-8?B?YWVvaHZBMnFmMWpmMFVvN3BxYUFvd2ZzTlNvR2pyN09rdXF1bjVNSkdmR2Fv?=
 =?utf-8?B?OUprWktsWXM4TDVBWFkxZHhzVEdpUWYwN3BFVGFsamk0S3JFK2NtTnJNNEdt?=
 =?utf-8?B?K2FmeXo1TWRWNHEzOVpZS2xJUTE1dWFvYmtidk0zeUpaN3ZLbnh3K3VwdGJJ?=
 =?utf-8?B?UWVVMkpMTlYwLytvemFmS2ZyL0Naa1M0S2UzbEF2TUZBSFl5QWoxNmlCTHpi?=
 =?utf-8?B?dXk0U29IQTRCYjgycnFsd2k4QzRqWDZNUFY2Y2syTkI4S1lpL2pXelJQL2JV?=
 =?utf-8?B?RkFEUkJnUnh2OFNsdWtRVXNMY2hOUHFWMXlCZC9oL2d1WHBKNWcxQldNaDlJ?=
 =?utf-8?B?aEI3bWdFN0dheS9qNXdEMnlXdGV5b2M1VmFhbjkwNVdCR1o4S1RNRW5GbHg2?=
 =?utf-8?B?RzdIVHgyZ2RROFhJT2JNUUF2aW56ZURyWVN4NHZkdStuUVZsNC9OQlViV0hY?=
 =?utf-8?B?aEtCOHZyQVFDSlNjcmJtWnRpN2dzdTZLWVp3TFI2Y254Y1gwU1lsbWV5YXh4?=
 =?utf-8?B?bndQWjJhUWRKSDg4bjNMalc2MDNkWmhVZjVYTmRpaG10bGtNODdmc0RDK2wr?=
 =?utf-8?B?a3JXdXpOdjNKWE1INEdPUDRvdFNxMnVoN0JQRUVHcVlCN015T1hnbnpXdEVa?=
 =?utf-8?B?bE9wbVdqV3NVYWo5OWZVUFg1NjhlaTZ0QUlKc0IvNHprQ3B1clJWWGhjdW9v?=
 =?utf-8?B?UVZUS0hZZnQwZmNFVW1kcVdFMzlUVUQ2SSsxYkcySldiRlhmdTR4cVVRaExK?=
 =?utf-8?B?TlJTaFIrNUxKa3FkcDJpS3VTQlN4SWJ6TzJyZVI1WDhkRWRpSjVXZW9FbGx0?=
 =?utf-8?B?NGgzT0greHBNbU85cXpqTndMWDNoMDU3a0lQdmpNSDZLeExWZmpMUVRLR2JM?=
 =?utf-8?B?R2xDL1QwcndkZFhQZ0REWDlubkU3MnFzejZKMGZhWDd1a3k3ZjloclV1YnlY?=
 =?utf-8?B?b3JaT0d2aE5oYllhQ3VIYUdmbU1LWjdvUm1oV0lKRXk4NVBuZWUzM0FmMm5l?=
 =?utf-8?B?VU9paE1RNEQ3UzdnZitONjcvOGVOUnV3VDdUU2tCSW9kYlZFZUI2Q1o1RFVp?=
 =?utf-8?B?c1FONjZvOXNZdGU4N3o0dmZPbW9idVhYNVhZNGxJRTNJVFBBam9kL1NKUlJx?=
 =?utf-8?B?b2JQeFRHTndWYi9FQ0tJbmhQaWlKdm5vNTd1bm5vc3U4OFlQcXRHblIvQTkz?=
 =?utf-8?B?Zzh3a2lmSWRrRURTb1JuWEo5a2l1UVo4cGR2eHhKb2MydXlXYnVMMWQyM2xn?=
 =?utf-8?B?WEFuTGNsYWdiVCtzNFBJNldVWkNMTGVNL05KUDJyU3hpOXR3Sms0ekM2a2VR?=
 =?utf-8?Q?TGkzZFcgXkiL5qS7st1SDF4Fj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31824bd6-6608-4073-26fe-08db885a512e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 13:16:09.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR2EnnJRDJNbGgfgt2G+PejI1qKyhjyrxJ2BOtoltZHFlatbJZckIWWLdmH9rEdcXyakopWZEM3lyxKmB9FEVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9896

On 19.07.2023 14:54, Alejandro Vallejo wrote:
> On Wed, Jul 19, 2023 at 02:09:55PM +0200, Jan Beulich wrote:
>>> [1] The hand-crafted alignment there is going to collide with the efforts
>>> to integrate automatic style checkers. It's also not conveying critical
>>> information, so I'd argue for its removal in the spirit of making future
>>> diffs less intrusive.
>>
>> ... I don't agree here. First of all I don't see why this should
>> make style checking harder. There's nothing written anywhere that
>> such alignment padding isn't allowed in our code, so any checker
>> we want to use would need to tolerate it. Plus while such padding
>> doesn't convey critical information, it still helps readability.
>>
> Considering the last Xen Summit sessions I think it's reasonable to assume
> we do want automatic style checking to become a reality.

Oh, just to avoid potential misunderstanding: I certainly agree here.
Just that, like in many other cases where computers (or automation in
more general terms) are involved I think that ...

> If we want an
> automatic style checker to be eventually introduced I think we should be
> mindful of style changes unlikely to be captured by _any_ policy we may end
> up having. In particular, alignment of arguments across different
> statements on different functions/macros is unsupported on (most?) major
> style checkers, and that's highly unlikely to ever change.

... the goal wants to be that computers (or alike) adapt to their
users, not the other way around. Sadly we're still extremely far from
that ...

Jan

