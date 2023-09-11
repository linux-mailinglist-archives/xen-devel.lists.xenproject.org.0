Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB179A450
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 09:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599069.934318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbAk-00040H-Rt; Mon, 11 Sep 2023 07:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599069.934318; Mon, 11 Sep 2023 07:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbAk-0003xH-Of; Mon, 11 Sep 2023 07:17:26 +0000
Received: by outflank-mailman (input) for mailman id 599069;
 Mon, 11 Sep 2023 07:17:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfbAj-0003xB-AL
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 07:17:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe13::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 412e0f5c-5073-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 09:17:24 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Mon, 11 Sep
 2023 07:17:20 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 07:17:20 +0000
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
X-Inumbo-ID: 412e0f5c-5073-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRehhgLpCOH5eCbhccVd0IF4SaIenU6D0Veqi+hT1rHxpe6ukffuXiv4EP0zmQpIRzRa+TvmIb7VeqWlHQb6pdbsBaPY3xBo5Z/6VhDuxc53zoGgCl3hITbT9aQ08O/ox4v0TbXsvh6mekydFWQMKN8yY6P8GkmCwVVGbFZAmHe/0G6qiZcbTQ9e+GtIHTg3+02ikZwT9qY6D4YCyUxOxXjjBZJCkOzFw/PxetsCnJ3RtP0zx/X48qCzzV/B1jhIL1dip95fj1RDZrHeZnu5AlFhF74obcz15CM/CWMLzAC4DrW9dJcdRqpAZ/8zQdBbkxW387H63RHwggqzNqfk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tILWl3DKuD/GJaIYzaUKvdLRDDsfsIeahERO5i2AkL8=;
 b=iOR1rjSwU3wXiR+rqGIa6jOBQSTi3EgCxEGZYs9q6CtjDBwRMwGrxg0teIU8RlRsiYhC45r4EyasV4UFMmBB29lxsdEMyHxHdi76JNo18TRhllksWdSEVODTJ9RDsSPbDLB7ebFb2wIi0KiPQ43HPSDVBRieWAxvk1HyT0oDK/92NDhzzbLm7Ll4/SHwfBE+e3dHn60yo+vI1loJGGVIq8tQIHHOaGQxwDrbldIVLkMAKQnuiNYBGCkDy7PsFwkY90HEyIvBPNjtNCiSn7NfsccOjywh1/3TPNjWu1eekn9aHFcE0OH8ARoJHQo4lBSgTMyXosJrJzcVHHP6KsuaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tILWl3DKuD/GJaIYzaUKvdLRDDsfsIeahERO5i2AkL8=;
 b=QA9KcM5JKb438QjjtXvhzqEzxq0bIvH3Jv0mfd4P+gmsO2wWeUAKT/RYFTTMZj8OoPVu0En8pPH4dq57fA1IteDQcWqG4PxBRSxBuZ0dgvKTQMi+P4d3x4QKR9r9GL+RKfOP17lrBrGi9/HV88kx7RpwoAlZGfW6cMa7xWfjb/ieIgeuQ5RYvJIfUq/cy30aoyD+MRElX5OpXUsWMO0c2q6mtN0uwDpGtoFtEm6HJOpyJm1zY1+CnidPW6fFlSaP+Dt0pSdK450GFX3KhgD2QdnXjC0j2CfNoQMBzXJEZ96u3XsKmOD6Em8S5JFOpnsIA4ZVIFPSq5Jct0553DeejQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef37384f-c3e6-1425-f27a-1bd70f34dd6d@suse.com>
Date: Mon, 11 Sep 2023 09:17:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230908230318.1719290-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230908230318.1719290-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: e3eb8701-5af5-4e50-c956-08dbb2972342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3oNs60J8/RcfwndJDCQP3haTyHPOak5izdtAZxfeGQFQ0BIPy1Am9uKFhSPceOHo5BOClqDhvI5DuFBVsWOGZmzMmsNDVl4AMDm/co/gr7tVEWr4Of3VNFQWPutNN6pElwGYmMxD3m7upw04xMKaRn5OXfxkSXd+S8Zw3lj6krr3pmdoIUf+s3IlQafDM6slERNBFuSRGHVURoDcjGm+bMNf3houjYuXNtkzD7VJzGgtOSBqAzKS2arMIA60iWy+TW1qG494c9KqDLs4uQSnx7vzhm4J3pnkvX4H9scOGg8ivtbUItbrbDLqdbC3XJOd7H3QstmXdNhU/JY8EvMRowsPgtSlQGFdVOomF7TNk94Nd4L5ShWVb0wkhrTKFaQ3jKfV8jZzQ+WMGZMnGDohgPGsksX+ql/MDmlxpWdaZ+JYA0bfJG8H5vu9rwYadUyMBGR12U8jHHL8zbGl7UX0JRGC5lJlOg6tG4SAbERWmAL59w43rfPHjmmfymjmcOLbG4HRA4D5U4VLspQF0gbiNs5XJCIjJeXaC+a1UHlMeBmmu42gsYXMsvK2SM6kTLdeyrEEvuj33h4zGnmDcI23PvzOJeHt2PAdgh68tOBT/QM+6GPPMcVezRe4rnPfaNtQ8cn/W0zR/toC6ZkjGtGqAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(1800799009)(186009)(451199024)(478600001)(53546011)(2906002)(83380400001)(66556008)(7416002)(6486002)(6506007)(6916009)(66476007)(66946007)(5660300002)(26005)(8676002)(2616005)(8936002)(6512007)(4326008)(316002)(41300700001)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEVlNVRpOVpNNjRTZGxJRG8xQURNU2R4eE45WXViTS9QTWhuSEFMZmdZV2dq?=
 =?utf-8?B?WUtyaW53K0dvR1RxU05ZcGhsSFdzTUx3cVlDU1ZVZHVpWkVvdlk1dkdwRFd1?=
 =?utf-8?B?cFdCc28zNG1OSjFSN1AyRDRuQUo2ZnlSK2pxNFpmUHJDT0FENlZjU1k5ODR3?=
 =?utf-8?B?Vm1xazA5YW1ZbTEwdWFldDZYTnBSZGhBb0JpUUdONkVWZExpbytFZUFZd1lW?=
 =?utf-8?B?RkJ4MGdTZjVwM3FkcktSc2hpbVpJbHV2N1o3Zms4dm55SFFIVERuUzNaNnBx?=
 =?utf-8?B?TU1lNjFibEQvODRPaE45Uk9vcW1vbkhoZjNQK3R1NXVhYnhERnFDUVNXS3VK?=
 =?utf-8?B?d1daaDI0eGN0ZnNWcmxiWnNMT3p5UExhSDZGWStxWVl1dmJGNlVVVGxhSjZa?=
 =?utf-8?B?QVFZT1d0RU9ITFdGS1dUN1VPOGU0bzRzRFFqYTVTSS9BWXJLalpmL29MMUZD?=
 =?utf-8?B?TXR1eGp4N1oyZnovM05NSEp0Y0JRVXV0cXVnY0hTUXY4RGp4UURtTnZmQWtT?=
 =?utf-8?B?WFFiRGp2ZGVDeXVwcVErZVg0Q3BHYUtBVWZ1ekJxZWU4WlZXZ1hqeHpha0F5?=
 =?utf-8?B?eUszSWFRNG45RWZKVFV3Q2hqdTd2R28vdzROb081Z1lwclkyejRWVGE1Yllp?=
 =?utf-8?B?dFNjZUxWeDdnWDNWRzZKaGVTc1g1SjlQZk1pZ2dkNWpxR2xNSVdDSnNoaTM3?=
 =?utf-8?B?QnQ1Y0h1cG5zemtrS0o3NkhxbHhEeHpxT2tjWGFjeTdIVTA5UkFPQys3MTIw?=
 =?utf-8?B?eE9ZSkZ6dGlEcTVsVk5ULzNFaXVhOTcvQVVNNG4rS2hIR0x6U2I5WGVtQ0F0?=
 =?utf-8?B?SmFSNFRtZU8rWCs3ejFQTHZMdXdNUWJNQ2VjU1pjQjVrc1RSSEtoNHNvSEdi?=
 =?utf-8?B?cFRFQVBPelFTelNXQlZaTSsyK2x2RjJSeE1yUlUraXJaUXo0cWFqSENaSW9C?=
 =?utf-8?B?UjdFSFVERXZPNjk1aGdERHdxVllWeEtiOC9ucEhCYS94bngwVU5jUjJlUzBs?=
 =?utf-8?B?UlZnck5aRTZGSVBTUTh2b3N3dXQ4bzl5QTkwSDNEMFpJVXNwaHhyZGJXcFlt?=
 =?utf-8?B?T2k5SHhJS0NHVzZEUHNMZXZEY25wT0JGa3NLKzRPdGo0d2pjdjNvZHE0Mk5q?=
 =?utf-8?B?ZzV0SDhEcFUrMTdZRkwrWFZMYzV4YUxnUG93MFZaTmxmV1o3TUJ0OE5XQzRr?=
 =?utf-8?B?VCtxa3lKeUZBNjVNQ29IUXdGUTUyTVBrQW5UYjVWWW1zbDJ0YlhHTFZtSGdt?=
 =?utf-8?B?N2RFQ052aDA0K0wvcWxNUGhKc3JxZEJwazRzK2pyTzdiTTU3cTRHUUFQZFVT?=
 =?utf-8?B?ZGYzQlJQaTRPY2QwYWk5bWdvdEFQTHh1RngvNWR3VW5FV252cEd0QTVKS0tP?=
 =?utf-8?B?STdPOGJLb3dqZFJGcG5jMFJsaGtONEZWaVRvc3JtUk5ScEkzWHBvRnVQQzdo?=
 =?utf-8?B?Tk9OU1MrUjdIOGdOOERYVmlGV0ZXTDNzRVcxU1ptUGMzTTJLRWczMmtpN0o3?=
 =?utf-8?B?dmlqaitLTWxlNW8vSnhUd3JXeUpzWW5YR2hEZ1hFRXBvSmlqdEhwaWVMd0ZG?=
 =?utf-8?B?VXFEczdEUHRQaE1mQ2NBYlh5akVCbzFxbENtaGI2RE1jbnBOR2RLL3lsOWRR?=
 =?utf-8?B?bzU0cjJ3WGJJdlBGTW1IYTh2MFQvMVRORThXWVl1Zm5SOG1ZQU9xbXJUeWJL?=
 =?utf-8?B?TGZwMTFDR25QaWNIU2VONFJvM1F3ZDh2SkRlQ3Y1a2tXRDRvR0NBdW1TdzYz?=
 =?utf-8?B?NUkrbi9HVWZ3RXlvWlA1VUM3STJLYTFTL0dIbDhYZWt0WWo2S2dXZ0N6amNl?=
 =?utf-8?B?NU1SeXJKZzNwQWtYTHFJTjRSTldoZjBoWXRKZDdqR2xrWjl1Y2tvRzNqaCsv?=
 =?utf-8?B?U0cxRjZyTmtPcHhyQ1dUYkNlWkFQb0ZoVU1WVUdmcUFQOVlNUEVaS0hlYzFN?=
 =?utf-8?B?V1NsNnRheGNYeG1jNCtpcVZPblh0alAwbEdCTVd3SzIxZmtzQXY4cVhGbTNT?=
 =?utf-8?B?VDlTTlcrL29UK2hyR21hd1hmZkxQOGVZRDkzNlBDazVaUk92cmRKS1pRRXpJ?=
 =?utf-8?B?UHFQSjN4ZG91V0Z3NDBUb1RzTmhGR3R4YllQNVVuQml2dUdPYmgyQ1YvSmZq?=
 =?utf-8?Q?H0pVGEPvIzBCt7Uoetnd5askE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3eb8701-5af5-4e50-c956-08dbb2972342
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 07:17:20.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eaLT1l0ZhVaSIpB0CbBpJfIEtpJe5Chr5wtojY9lyAsV90dc3RkYrDMnbhHoD06KO1X7rp2+5fOtJvIBQeAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9640

On 09.09.2023 01:03, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptance of Rule 2.1, we
> decided on a few exceptions that were not properly recorded in
> rules.rst. Add them now.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Nicola, does this work with ECLAIR?
> 
> I am referring to the locations of the SAF-2-safe tag on top of
> call_psci_system_off, BUG, etc.
> 
> Changes in v3:
> - added SAF-2-safe to safe.json
> - added a few SAF-2-safe examples
> ---
>  docs/misra/rules.rst    | 13 ++++++++++++-
>  docs/misra/safe.json    |  8 ++++++++
>  xen/arch/arm/psci.c     |  1 +
>  xen/arch/x86/shutdown.c |  1 +
>  xen/include/xen/bug.h   |  2 ++
>  5 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 34916e266a..82de4c645d 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
>     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>       - Required
>       - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> +         - Switch with a controlling value statically determined not to
> +           match one or more case statements

I (continue to) consider this as too lax. I don't think we want to permit
something like

void test(uint8_t val)
{
    switch ( val )
    {
    case 0x100:
        ...

Imo like in the earlier bullet point I think this wants limiting to
compile-time constant values, at least initially.

Jan

