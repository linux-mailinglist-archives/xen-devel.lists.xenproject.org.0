Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C29769530
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 13:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572934.897071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRMj-00062f-GK; Mon, 31 Jul 2023 11:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572934.897071; Mon, 31 Jul 2023 11:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRMj-000610-DX; Mon, 31 Jul 2023 11:47:09 +0000
Received: by outflank-mailman (input) for mailman id 572934;
 Mon, 31 Jul 2023 11:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQRMh-00060u-Tv
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 11:47:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9382701-2f97-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 13:47:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9271.eurprd04.prod.outlook.com (2603:10a6:102:2a6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 11:47:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 11:47:04 +0000
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
X-Inumbo-ID: f9382701-2f97-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnXr39GAjj3kmTLgBEWasQVxmb+J3Mru2nc/vbyA+xHNsO2SgM7n9XQA1cqMXteYNkVrHuWY4RXpxGHJuJJGkNh0qZmVRc/a0Mxi9EWUHnHJsSUFSSEz2mt/DVDHMPK5hqXdp1NNAs09rxcRh9MgTey5fACzPSR5r1xhNn3ga3tTT1dQkdYJC4XpKASpt5VbXdqpeI0LSqn3OSg9xbkrPgqbGWk8TfztE99RgJ7xCtPeDEMDBgppccLrDeDWLHNMl4nMfEB2EkLICDTnZSlZLB/AXnndYRRe+S0qvTAsforSGVm0BRHW+h+x/yueE3a45HgH7RWLt8HrgJdjKMBcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imALnMsTSg632PBB97Srx8D9nMUjfHLOjZQI9qW3tuI=;
 b=KtLTpo92Uw8sgG9Y+dx8xTuwzAeix9WdbQUsXFZDA9k7qzAtcmmZxfvFNQDXysJfhKG6pgl0TQlJh7osvsloS83XHvcGQimz2z6iKu7FeYe5/DlT8v8wUyHONne+vnFnaubfgGdHmSGr/5FICaZzvuWp/pdvJHdqJcQqvBp0/NnS2KzS1DHQ3Vb+A8a0ErMiOZpBxNbW8TH++LR+Me6aD9P3H/JYGwLztSDPjbyJB/aZFTz6lkcydHHHDpSp7Hic8QLhKRsI1JnHx/vtkVfDSv7wQH2BT+GYiUROK9IV4qZuld9B32JsRAw0qMDmuxikgIQs5Y/GgSO31z7liaOjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imALnMsTSg632PBB97Srx8D9nMUjfHLOjZQI9qW3tuI=;
 b=hnqmMO/noznN3JH3OExu7zgRmnABGlYXysLIoHQT7b9cvZk+Mrs11opLyoIKFhCvlnsplBski7RnGOYjtmP3NsV+8snbmsvOaaEtwyl+WsxJxidMI8Dy86+Ox5TKGDthyeHyKo5EXVOkFRoGar1DdbQU2nHRlLG1UhNpLkia90GylWloE+yPR5VDrt77IhlXd3CNmZxWjZnYS0yG0iaDJCHZG0HEirMXprRaiNwp9pPPw2dyA84pdNtxoexHJu2Zm3OMStRSXtl/o30lhWruEPKUe2h30WHp+UB+j/twKcJZkpMR3nLj2VTd4tYmj/ek76cLrowUCOt7IicL66khBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b518e00e-fbf3-e5b5-6678-0ad5f40bbe29@suse.com>
Date: Mon, 31 Jul 2023 13:47:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 2/4] x86/mm: remove variable to avoid shadowing
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
 <734fa59e3f1ee384a5481fb9952f79c8751f04cc.1690788513.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <734fa59e3f1ee384a5481fb9952f79c8751f04cc.1690788513.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bf1a92-34e7-47aa-0f24-08db91bbdc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lFH6ybyA50nqiVmBjjgyR3HC0evkO2HrDBEXQ/bnWCS79PhyNLNg86SQkA4Dq+rVDlgfxJ0O+DLEijwFIvkN1mk4kqtu5j6Onv1wH4lmFSPnvMqnuTMmziOjl44RPzCoNzg11P1YWJofAHu9prbThnUzy/oyNcA0j3MqXeffmq1x8Oxg7sfsjum+ryyxwYjCJEc+VUWLU74pphuEP3ZPGEhEF/zAcHNemyjC4YVPWG6sL1T4uK8CVE6jzIfyhF6xca3em2zSNNjrThKdgSLifJXIZtkF4vcR2980G5uS+Mr3URWjczrnRoN2rWBV23TLyDFt+nnV9JsnIMOFXy/apHD3BoqUdNi3GQdIOuoypSKUhNIem0Abi3rHNSYtaYhUnBS9rEX9uZ3vC1gDVqBzZDb/AEsIHAB8XDlVlewSJsp20xIocmCA/dAghmeV8XmzyqmF7nUDIlccp3wS30ARuxAh7BHQVGj4hW3BuF6lv7JjF7ZfsW3KtpyuhoNLjq90BbOfpjIsf02L4lLuA50xXWncMj4YGpr8gRX6R1FOxwsTce+v7XIevpy2+F811dareZYRA+IVeLQHwOUWT/5FbIiZ/lT+iYxPtBGBXYiMA3lKCi2lYZY8LcLSwZKfiZElXutxdIQJbk0xzf0Z5mnccg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(38100700002)(36756003)(86362001)(31696002)(6512007)(478600001)(2616005)(6486002)(53546011)(186003)(26005)(6506007)(8936002)(8676002)(7416002)(5660300002)(4326008)(6916009)(66556008)(66476007)(2906002)(66946007)(31686004)(54906003)(41300700001)(4744005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukg2cW1oUEdMbm9QNW1qdkNGc2taMGRodjhvN0o1K1VuN0w0cUhPdmsxMWdy?=
 =?utf-8?B?TTJnQVVIbjhhYnd2WExKNVhlb1BEbVd0end3OWV2cUhhbkY5dSsyem55SHBF?=
 =?utf-8?B?K3pjOHlpVEM0STJmWHl3UUNYbm5rY2VwT216U2wrWHpXN0N5ZEN6OURBcVh2?=
 =?utf-8?B?TDVEcnB4Z0xleVhlLzI5VGV6MWs4SXNKcDI4NTN0S2dxdmhxQkljL0N2eHVo?=
 =?utf-8?B?V0FnOUlWQjFTa2VCMlBBNGIwYkFMUjV1UVY2YnFnUkxLRmVPT1NiOFNqT1dq?=
 =?utf-8?B?SXlzeXNTSnVnbmlIMmM1VTVoRTczSjJGYVFtdVR6cERTQU9lSU9sUmVyYWtU?=
 =?utf-8?B?MTZNclpad3dPWUpLcU1yTHQxOTA4cG45SmVVOStpOUdkOWNhZ0I1clEvaHg4?=
 =?utf-8?B?MThRK0c4RkJ1aG14R0tsc3laMDZiMDhBb3pQRTQvYmdKUWtOVjVCd1E5Q1hT?=
 =?utf-8?B?NWRQVGR0TE0valAyV0pSTVNZZ3ZxTTJxN3JyQy9wYmhnY3k1Vk1HRGNBYk5N?=
 =?utf-8?B?N0ZzcnRXSGp0MWZMVGg0c25DR2JqNWFNeFRqWVBnUXl1S1MrLzluN0lrcEFj?=
 =?utf-8?B?QmNLOFBnN01aVTREdW9HZUVPNThBUWlSc2dDbGVFZWovcjJOaHB1aWNGR3Rr?=
 =?utf-8?B?T0w3UzZoREF6aHY5ZEVFaTU4RTVkSnVrM2JLWHIvY1d6ZTdkcFE5ajQ3TnpR?=
 =?utf-8?B?TFJCT29VaHFSS2N0UEkzcG1iRWZSRzU2YVdyZ1UybEJmRjlxRm81K1AxR1Bh?=
 =?utf-8?B?dWFCMkhLeVBtd1g3UUlCRWROeGNUZGJUZEFFck5Xdnd0WkVEZkNFbHk1U0dh?=
 =?utf-8?B?RkpNRDhldklyelY5SHdUckYxYUxLTk9kMzBpWWlGR1FqWXR0dWVBanRjWFpX?=
 =?utf-8?B?b3RUM2pFckdMemI3cTZ2bW16b05pNTQ0MUd1NnEzTUxkcXp5UlVIa2d0MHhx?=
 =?utf-8?B?N1hsNlFZUlZia0pmVGtITnVoeEFrT2N3NTJjaitvaVUyUnA5TTJOS1FLOC9h?=
 =?utf-8?B?czlWVHVJMUdjWlg4SitXMVl6b29tSmtpNmw4WUwrb3hTdlpsNldvMFJKQVpu?=
 =?utf-8?B?MDZseklLWFdpdk44aXd0dE5GQjB3ZnE5eEFPcHppQlVwcW0yUEY1QjNCcTV1?=
 =?utf-8?B?U0VhcmRrOUFqYmZlOUtGQ1puU2x3aHE4ZWEwdTkzd0dWb2laM1MrVmtPN0ZN?=
 =?utf-8?B?UlI4cE1GajNEWlZCWkZSaUNEbXNQaERvRDdEQ0RzMjk4MWkzTHN3K3FGVXow?=
 =?utf-8?B?SFVFWXBaOElIR3RxTktZTWxSaCtJTGJxNTg5VzR2amJaWmlhTmpFSWVqdlRa?=
 =?utf-8?B?Y0h2S3ZOYVdLOFFxelpVSGNEV0R0Q3hSZytxRkxIK1ljN00veHkzOVVmZTBk?=
 =?utf-8?B?RjFPZEdCL0tUdFZWSWZVVVB1ZTRDaUJ5Kzk1cXp5cHIrMG1ESDJYZ0NWMTlm?=
 =?utf-8?B?WnZrd1NRV2tXUVNGVWgwSWNQajF3bnBzM2V5bVAzU3JMTUlVeHl5TVFWRXAv?=
 =?utf-8?B?Y0gzMGh1WHJNSzczLzkxTm5hNjFXV1g3bjVURkUxdHhWUkVPdW1LWmhmU3V0?=
 =?utf-8?B?cnAzSmFCZ3M0R3pLOHNCS1JjaURzZ3pFeUo1b0xKMEJlY21UdjZlNWNKQnVG?=
 =?utf-8?B?bmxyVVI5YmpSN3RLc0d0WVFweFdBMjlvUlREb3NvenQ0d3ZnbCtvekdIdU05?=
 =?utf-8?B?MVJNNDlYUG5aQjhscXdwN1JPT3ZoMU4xVnV1Sy9xNENobjFVTGRlWnUzWXc1?=
 =?utf-8?B?a2tlSFhJMVRpdDBlV2pvZ3IxOFlWWHJoa2lkWldHc1d6VFEyUTJhSEpOZDFV?=
 =?utf-8?B?VVZLWTVtc3dHRGFNRUN4Qk1XVWVMeWk3RmxKMThqNHQ1SjA3cjBkaXluWnpK?=
 =?utf-8?B?dVdDYkpjT1prRHZpMWJQRVBQZk1RdUYzSkc1eTUrd29ENGp1alZBc0hYeU1N?=
 =?utf-8?B?ZjJRaGh0dGNZdkJ5SUxLb09COUtvS1pzaU4va3YrclQ5QVN6RW9CTXIvR0pq?=
 =?utf-8?B?Wk4xMHViQ0lGMzM3d3c3b3E2YklTeGNyOFNqMnBJNll0bHZWN0o3TE9RQjhl?=
 =?utf-8?B?c3Z0azE1ZmZ5cjVRYy8zRTEvZTVRaWtXbHN1dWNRVGMvZm4vcXgrTkhPR3dH?=
 =?utf-8?Q?k3j6UQ3Yg8sayZspfE41XtsHg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bf1a92-34e7-47aa-0f24-08db91bbdc84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 11:47:04.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdXZKiIsvCcFIHq2r2QbZWB1lZAK4yRzQYw9kO+HqAeS2e3e1Ho5RN82X3FqFxIwu6TIgPcRbOiVl06fGaDy5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9271

On 31.07.2023 09:33, Nicola Vetrini wrote:
> The local variable 'p2mt' shadows a declaration of the same variable
> in the enclosing scope, but removing the inner declaration
> does not alter the semantics ('p2mt' is an output for the get_gfn
> call later on) and this resolves a violation of
> MISRA C:2012 Rule 5.3.
> 
> Both variables were last introduced by commit
> d4f699a0df6cea907c1de5c277500b98c0729685.

No, that commit moved the function (without correcting the issue,
perhaps because of not noticing it, but perhaps also intentionally).

> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

With the misleading part of the description either dropped (which
I'd be okay doing while committing) or made meaningful:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

