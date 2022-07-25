Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E337557FEFF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 14:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374563.606641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFxBX-0001lX-2z; Mon, 25 Jul 2022 12:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374563.606641; Mon, 25 Jul 2022 12:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFxBW-0001iP-Vy; Mon, 25 Jul 2022 12:27:42 +0000
Received: by outflank-mailman (input) for mailman id 374563;
 Mon, 25 Jul 2022 12:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFxBV-0001iJ-SO
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 12:27:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cac8cec-0c15-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 14:27:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3440.eurprd04.prod.outlook.com (2603:10a6:803:6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 12:27:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 12:27:37 +0000
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
X-Inumbo-ID: 2cac8cec-0c15-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ9PwsNLb9gvhZHujDMvCsjIPZhHW6Yg+EexJlS4GOBvJgpzo/PkADswNlYKnzN+viB5EPXFmPoqVj67HXhe5HEzBsavbIH5wIOlwJDq2nbVetmpcaErvpft+BNWXgli/2VPM3K1Hm14kqkUsCi7t8c8+aP2CgOTp+BDMVm2Su61czat3CJqbQZV4Nuhgsj8vzXsdxrbeJVdOc4EmDD2iqJxmKUN+EWmwdJ81MOsBT/G1YLyOGNfnpHPTsVqxeqBQEk2ajRql+ulFqjM1ujGbtUWE4KuhB+mvLNP0fMTf3UnquPMLbJdIaRm3HCcEKnlVu6w0DKNTxiSnUuPMzdjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbUmj3ceKPymepo19iMVy/3v7AEDccGvYecKu3QwyVM=;
 b=oDjMnDaf1Y8FM72t6eUM44n1gdQqeXxz7HIHCE3JrJgVUorEfXDhuoWY4nPwIlMD0cWHY9uWJfbZPUxrUzIxVq8RxJH7cOnemAdofZmPf2/tvcbVJrFwOXRn6GpfIvavBMMNSvBWgg07c8SN9E5ZSTyQrDZ8nW6KVUMZSJILlmJfOkNEtZWx0W5R/H2JdXtEMX+ocp0kgYCo6qPVbVXpClWoz9H6+lrAdKB04xKKsw5DicCglgV0DpiO/Jix8sxSA6vZuokfyzFTlJ7juU5VXSA5/+MoioyZn5iIrASFQYwu04aOVmCnaJMrK02GRQ1St4xK+rgMJN16ktPCx167WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbUmj3ceKPymepo19iMVy/3v7AEDccGvYecKu3QwyVM=;
 b=iGK43dIsBpoCOmxItcQPewLni1hfnrad8yme9j10j9AnZsY2mnxxc3k7cijKz9sAdyruYPlj+4PzDHq3bhg1f3qTc+duPbuirVA+zoz1VrmOgdlPuPDkG2JlfQMWelQKwwsK3kh90mwWrbQtzy5+WPQyTY2xrW2K2+CXMe5M72kIRWcpUErGEz9oszRW0R7nBnFSh1hxwawnLhgZ8LhmcoQMBXrNN74ju/5USKwLLYpmjVHq68HuGZNf17AI1qVL8Ho3Svfgf1nWIEBWXcYCsIQgK/cIvMXNWWynDkcKVxw588jWGhd3SGyQSUfoLWZnrLazqUmHqJvh0E+1HwJakQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <242213b8-694f-524d-7c1e-a333c352c985@suse.com>
Date: Mon, 25 Jul 2022 14:27:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: limit issuing of IBPB during context switch
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3327586c-1489-4af9-0fa2-29f48d957954@suse.com>
 <8b347c26-d1c3-b3c7-8e78-2e43b274255a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8b347c26-d1c3-b3c7-8e78-2e43b274255a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1509538-f1ee-4f1c-aeff-08da6e390f6b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3440:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otag0myZ6MbblVhx4CW5LfsR01voc6s3+K3Zl26hzrz3LCCU61eT/RMwOrnybeUDNVh2DLA3Og+rbq2eIOunlJxU08LZfDTpOFTVrRGFV7fE571AZw40bbNrPk0eBnYaYvMtHuQffnxk3VY7Qqt2x6DHyMH8otlNLT5SDWQWDavHEc1llb2dALZHYkv6R/55tKfq1T4tciBr6jwcP8SsTIIF2+2KLtGVzSYBF78FwV3md1vcyPnSHEP/XZSpzv5Yw+kaI9QGqub/K6+KeY2TMCjIhMRwuHX4lDc+Hwbl1WReKaJqVYcI+2YQgtcQx7kF6EiprSNry+E3nWZvRcH/c15aMuCe651qKu5IPJJkFkWTvnd9Y5wo4nfYoilM8lcVFHIF7NDwtpiM3zI4O4bRhWBQqBMsBuZOlUkvR8rCGdk00Y2TBKxIOsxbiP+fLLUT8ZzwDIRKi0tjDb/EYLZktzsn65oe8jb0kO1DVKVNjQGb0nqPhkVRXX58I85cHogO5/zTSxWY9TyxqDMgDLg7jF/rMt6y5qT1q5gfjHoAJ0LjVvYeZfDsyNtAmyXLzmhy8aZGQ2g5/NgkDJyzeilYOdjOyOOe3sE1+eul6qR7iKqkr3IqR2QH+NAYe2SbjAhlf6N2OlbrpeKjri3iDtn2OQerFZdwJRHAtKSgDDskNqM79OQF0u0aQVaEAVLN3Um2s00Kl38FiAQ7Y6CX0y2F2lGdkTl3xYaitKLWW3Wz5kEYeBYIoUMHgTYZg+85dxIUc4FAfsJY78TwYR54gJqXyQuqPwLwWobcHgZKhNfbCmJlrIRFixUGJf0PqzywbbQXeFumNLjcNNK5RTUcPX/ehw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(39860400002)(136003)(346002)(31696002)(6486002)(8936002)(36756003)(53546011)(6506007)(2906002)(478600001)(6512007)(26005)(86362001)(4744005)(41300700001)(5660300002)(186003)(83380400001)(2616005)(66556008)(8676002)(4326008)(6916009)(66476007)(66946007)(54906003)(31686004)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ljd29TZ2kzS0tHVnJpYXZyem56am5BVUZZZFJsNTlaYStmY2g2cVUyaUR2?=
 =?utf-8?B?bDlPNHZTdDN5SlpQWnVEOVUyMEpETXc4UTZyY2FkZVVOT21PendSVnhOdVd1?=
 =?utf-8?B?Z1FFZFBxeGlEcGRXRzZUVENGbjlvUFRldTlKcEpyaXVxdFlZVnhFQVNtMU1B?=
 =?utf-8?B?THZsMStmS3dSNjJoRTN4YnZtMnM4ejl4cFo5NHRIbUlxVGxJaXJGL3d4clBv?=
 =?utf-8?B?YytsVVBtbzUwbkpBM1hMZWRBSFhLeHdCYUMzalJ5aWJlSXdjMG4xc04wUVd4?=
 =?utf-8?B?MlBYUEE4OFAxS3p1d3cvVGVIYk9TQ092cVhoZzlGaUJQUVF6TDVkZmMwVWtN?=
 =?utf-8?B?UlVLTTVnTHNRdURoY0hNQXFnL1NrVlFhTWNmYUpyWmt2MWgzRWt1RGhwUUJR?=
 =?utf-8?B?ZnFIajhCLzNIUEZqbW4xeVY0NkxzeUJXampHNnZkTG43ZlFoQWpMZjJNNkRy?=
 =?utf-8?B?aDVYejBaMEZMUWdjbUhSYXVkemxxUUtxZ3pvaEdRZXRpbmpuQy9qV05sVzRV?=
 =?utf-8?B?Ym5wUGd1UHkvZkR4dGo3T093OGFkVTYzcFF2eEFwRVBRUXF4WisvK05Qd0RF?=
 =?utf-8?B?K3h2cFBwa2R4WXBYbFNLLzU5c2hSR2U0UVFlZG4rdi9BUVoxajdmWjJhZVhG?=
 =?utf-8?B?c0hhNzUvN25UNUYvWmFzQUliWlEwdHoxWWRxeGRxcXE1cmJHOEJQR01SRCtm?=
 =?utf-8?B?bDdNVm90VzhUek9HUGYxL3NCWjJpdEJjVkxVaXA0SmtWNWhLWHVpSjNlSGVt?=
 =?utf-8?B?MHFLd3c2b1VKWHNGMjdhb0RoWlVod2pCc2Fxc01OZHNDdUpkRGVJUmZnVEUx?=
 =?utf-8?B?cTBjeG1XZ3Z0TE1DRGFIdUw2emk0NXIrL0h0dmgzY3BXNkEwWjJhOHVjUWxv?=
 =?utf-8?B?ZzhOTnEyS1BxNE5GZWZoTHRLY0NIakxVZFpReVlDTkxvZzlPeUtSbjEyWnNt?=
 =?utf-8?B?eWNjT1VUalkwVWkwR0l6WDBORDB3V3hSZG5QMEs2VHlWLzU5WElDSzllMzBZ?=
 =?utf-8?B?ZzJVNlVQTy9VVHZFSGVhdFlNMno1SkdZb0dzNUFyN0N5QzJjdGQ3ZnRaM1Fi?=
 =?utf-8?B?eGpWdk1RR0RQWE80OHByMU5DQWYxbHRCT0pqWUwzZHlHaGlvNnlWQk1IWXJn?=
 =?utf-8?B?eFFhV3VVdXlmaTNoOGlleVRJa3AwWDJPbk54K0lZL1FkakdQL1RGVDFHMlFa?=
 =?utf-8?B?c0tnRHJRME1sRkhBS1YyYkJ0Q3lzcjc2aFFZYVVwNWYrUkN4QUkzMkRGaU5N?=
 =?utf-8?B?Qm5RdDdMckk3c2xSVElMMGhxQllkRDA1Y3VXcGVkMU02RnA0eUMyUHl0bHQ2?=
 =?utf-8?B?SWZMeFZ0OFRDNDA2ampGRy8rdDNOaE1FL3ljb04wcm5EUVRvK3JxdFN4emNL?=
 =?utf-8?B?elJiOXloakFVdkNSUFJlQklCZkFBOHNWdWx1c1FCWXpCNEU2VnllM3VtVEw3?=
 =?utf-8?B?SkNHdEZtV3VzOEJ5QmtkOU1SY1VCUWxsNzZobFZaWlBtQ3lwWXZMVGIvek1W?=
 =?utf-8?B?OHJHWWJTTWZXNk42bzVnSEllQytpMXpUeU5JeUxLVVhKQjlxTnVOaklZT1hw?=
 =?utf-8?B?SnZyYkpJbGtqdEx3cVdKTmVuVTcvZVJLeDY4R2Rhd0dvSEplUmNVMUJzQ3Nz?=
 =?utf-8?B?a1M3TXpQSDRsS1ArTnZldnRqTUtWMjRVOTFvT01najk0Q2FoNm95UGxSUURu?=
 =?utf-8?B?U0tHREF4emV0NFhnY28wVWh1Uzhtdmd4OXNiYWdIUUFKcUdqcnYzUlBqNVM5?=
 =?utf-8?B?dXo0cHJ1Z0dGc2NRS29Oa2pKa25TT2FGbXZjd05CdmExYWNLNE5BM210dHF5?=
 =?utf-8?B?eXNiS2NmVklIb1NzYVUyK1pwNjExUnRPUXNSZkRHdnBGZ2dtaVh5Y1dmNlZX?=
 =?utf-8?B?c2lLQzlRRDlwbXVpLzdRV2JXbVM0WG9INGpyZ3lacUYrV2ZXMVlzNDRtYlRp?=
 =?utf-8?B?Sm1JVzJNZExyVCthdWZuL2t2Q095T2V0eDM3M1pnY0VKWU8xWXVPa1N1R29p?=
 =?utf-8?B?aUYycHFmR1puQzBKZlhQZDJDeTBDM1NiUCtMOWVLZDFTWDIvT2kzcW03bWd3?=
 =?utf-8?B?S1RhTXRCSjAzL3NNKzIzTmkrOUd2SjV4dVZ6QU9oWU9aYU9NRUZZTU9NOW1C?=
 =?utf-8?Q?ErNeJaEdYKV1FjDXbszW+XtXI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1509538-f1ee-4f1c-aeff-08da6e390f6b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 12:27:37.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjx5UOxhfYvZYMeecqqN6wkZVB+0tW4hGMHxLmLHu0DYndcp3TIcEpi8MfG43uLfVflS4bH1F0yRvtALQG8UPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3440

On 25.07.2022 14:15, Andrew Cooper wrote:
> On 25/07/2022 13:09, Jan Beulich wrote:
>> When the outgoing vCPU had IBPB issued upon entering Xen there's no
>> need for a 2nd barrier during context switch.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> That's already accounted for by opt_ibpb_ctxt_switch conditionally being
> not set.

That option defaults to false only if both PV and HVM have the entry
barrier turned on. In fact, if it wasn't for Dom0 I was first thinking
the global could go away and only the per-domain setting could be
inspected here.

Jan

