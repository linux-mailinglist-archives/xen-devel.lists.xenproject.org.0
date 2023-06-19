Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB1735B6E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551173.860553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH4A-0004y1-Sn; Mon, 19 Jun 2023 15:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551173.860553; Mon, 19 Jun 2023 15:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH4A-0004vZ-Ps; Mon, 19 Jun 2023 15:45:18 +0000
Received: by outflank-mailman (input) for mailman id 551173;
 Mon, 19 Jun 2023 15:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBH49-0004vQ-RY
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:45:17 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49323fcd-0eb8-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 17:45:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 15:45:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 15:45:12 +0000
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
X-Inumbo-ID: 49323fcd-0eb8-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I79SduadvLItub2hJ+BdN+h5/mYWvDN61WfyUINQCgLRf0t7FSZbgNGmiAfi42Wum4gl6oy6wtMcy48ZfOD1TXGBsqTEX94BF/GTjqsrTd1o9KWTyDqfTv9Gu5TPDN5oDW4Z0VzcSjpGb0U/3+F5Sh0PhVeSOEVdJTDsOuFaf5iGwEcjSfR/SJQ/XzFItd4IuNx5sLvb/iTEumfQHo9V8AE9UdV4OED39hbLSm99OZ2hZLtw/9+g9GGyYuJAtiWEUEHyZpkvpIruTViKYcwpKrGv5b09HNZ0Bxje7iBHt4y3bAlwJhxEsTEPZ0yFjaQ4O445N5oeUXhRCVwDxS5h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBIQVeXYGkUiwTtpLUC3WdPaoUvfBUWTnS+eF7jDy/8=;
 b=UMbiokDo5DPDomWKmqv9XSxPPk/0YOo2+NoidkqLkG5fADVET60hijz8uJFZWruhCJHSl1R5qQo4Cpn78g1Bz3sH4GM3kAqP0WDH/vF00Ur3edflVclPuS5Z+0sa7bK+fDBhk6kcmsweZy4MPoL0zFeDApKH8koj3MRqZyji8BlLT1qrqloI0aM6O6LGlRaiIv+6j9McpbTxwqrHsoCYO9Hh2KEV7Onq3O+sk+qgMgX2RxlvedKDCST95LIxetnVDZFUZVBjaTe9+XCbXpmwWkrfmSJ0x15S3XmMswqhim560bCZ+SHYbmvsu2qNi5EHt6f/OQ4mUNwdKPIFGu+axQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBIQVeXYGkUiwTtpLUC3WdPaoUvfBUWTnS+eF7jDy/8=;
 b=dutK5BwHqKcMN1EHBeHP+T9VIlynJ7EAUZAyNCRXP+N6wI42yQE5wbyycK7G8w5ejmKM8tB7DZ7KbwjI3SgjDCJBXDrm/N41F/pfOo2bzl33rKq4KJ8Up9AAb+g+pO4ypHEZ6N5pPHH9oik3FZmqUd5CIf6D7tPCbbGZYG8JIJSHSnOC4RJ7sKHoLcvmnXM6/V99oKchZnA5oMntpEFnZnScJxXs0NrZg1PcOJEeuluMsFpuAihjhNPD6vLRL9l1RPqTmGg9bN+pNngkO/x1KIDkubbzwY1zDm4MQ4vX6APwwXy6DCv9c7QPfs/PBYQBHJOVv1EwEehumeTHy96Wxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e774b3e4-58c3-08ad-ce49-f05286e2640e@suse.com>
Date: Mon, 19 Jun 2023 17:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/5] x86/microcode: Create per-vendor microcode_ops
 builders
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615154834.959-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: a698e0c1-93b4-40cf-d059-08db70dc2b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RcT6jjOAQh8ciWNVPEqFmfpm58Y1MtxGm+GWhWz8dIC4BTND5uueN2VNjFbJlPjISQB4unH1ZJTYXyxmznGhZxXzzo51D1+q7v0kAKlx6qJ6yGytLadxZIleAPWlaQiOzcax4GZAxl0yr+qBZHHALrq0pgPIl6IzhWFdxlKJyt/A+uq2JfqZ6o4puvFH08zK2dpcrjNlm78Vju7L4Zf9Q4O083pp88E12NPhduA5J5zvHwcYPaDa8ndgp6wX0sE6U2bnDYxATrqe+Kk6Z8qbkdEBrcDas4t7pzMMqZN+2M+FIya8/cWes6KYjJaUryPAYuQR+7Gyqtk4d8deiKIe9UcoYan0mu2kTbroYgpGpYTvx+nH35hcQWO37kZnji0sYBr6ivbGXW5ls1hBjFvwtUIjbUO7D34D4lVw+p23FmwaA/qUmUNeWfh2ARhFR8r/LQqo8dn//fzT4BwfSxfpAzW/tyHBduxjRTJUotc02jSv7DY69zcQHpHr+Fzy2/dVE6L4SvJxSdqBCTEWtG3yR2RjXWknqi0qPb8rwB8HTxsHyW4jRxqge2VrAoqe1N3Y4XzUt1FmuQvmFgCeU6PuwSnVIBjFPCnr6MlRdnjficGojuuJG73yn+SWbt/LEMgaiBc7KVjFRyFfr9+eu5Wcjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(186003)(6512007)(26005)(53546011)(6506007)(2616005)(83380400001)(38100700002)(478600001)(4326008)(41300700001)(66556008)(66476007)(6916009)(31686004)(66946007)(36756003)(8676002)(316002)(54906003)(8936002)(4744005)(6486002)(31696002)(86362001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtHZndHZXZCa24xR1JPSjJSQ0VCVlRrNGNQblIxYmJTdzJTNUtxZHhmYkFN?=
 =?utf-8?B?WFpGU2k4K3NKaGRpSmdxN3VjWm9JVjZ4RTVkOXMwaDRVYWNUQnZhZGhDeDdN?=
 =?utf-8?B?SWIxd3J3UlV2d0g1UEFCa3FUMW5kVi9QM3BTUDNCMXhsOTdSdUZBWUxMT21t?=
 =?utf-8?B?TXBBNXJGODMxbjFIR00vcTExTVVjczR2TWcxMkZrWnNBb0ZjZS8vUjRxNmhG?=
 =?utf-8?B?V0x0OGsrMkJsU1UrQmF6eU9SNEFJTEdLeERDaHJNZEJWQ0IrbUZsOFovdTZk?=
 =?utf-8?B?N2xVUXJTaHltUUtmRE9va0kxcWJzVks5MkJwVDBQOGpqTEt0Vzhua0ppRGMr?=
 =?utf-8?B?R244ZVZHRXFwQ0dnUUpmaDFyenJCUnVCU2xLUCtVdWxtRTRSRlZnZEt6WWxj?=
 =?utf-8?B?SWVDczdLcXQwbFdTSko0VDVrc0VENmxHZlZkOGxmZjh3aU13YlpuQitPQnNM?=
 =?utf-8?B?M0FaYkNrYllLeVc1T2haYXhES0N0QTI4cXY5STBwNUcxUVJiSDY1VCtOczIr?=
 =?utf-8?B?ZFNWd1NMSkhSQVd4aGFubGthWjB2bDJvZDZXellVK3AzSGNPTXJXWkd0SVJC?=
 =?utf-8?B?WnFCdFVVNENPOU5NSE8rZ1VGd3c2NytIOVQrQXQ2S29NdmxWbUU5akFHeVAx?=
 =?utf-8?B?a09TMHBhTVhxOWs5WG00Yys4czZ1Qk1ZTDU5bW5RVWpiZzNkeFQwMW5KNnRI?=
 =?utf-8?B?V0tYM2NpbFNHaGh1eEozekpmSXpqU2ZQZ0Y4ZXJtYUZOV2lJQXRqYklHQmtZ?=
 =?utf-8?B?TUFURmpEcWliU0c0NjFtY3Q5bzlLSFJQMGdXdHcreVdVZjNtc1MzZnNTQ1Uz?=
 =?utf-8?B?ZUVxeTlUKzFISGVJK0pyL25tVVRZdWcrSFBpQ0lhRjF3eVB4N0crWFZCbllF?=
 =?utf-8?B?MFBDRG8vcnJ6Q2ZVYllmQ3FwMmJFTFRyKzhkNC9SbHF1YjliWnFMZGxmV1FG?=
 =?utf-8?B?d1pxb1JKUlduR0tEdXhOeXkzaGZGUjduZkZYS3RlVnRhdlh6S0pRN09oaCtM?=
 =?utf-8?B?cnM5VS85TGRZbFJQV013R2tKSEVPMkNjMDU3cW0wd3RSd3JSMkcvM0FMUWU3?=
 =?utf-8?B?Q3phVFIwNlc5WEEydHA0Q3RkQ3Mvci95K1hDSUpGMWVvUGR2YXp5Umd2dEMv?=
 =?utf-8?B?Z0o4UFZqemdob0FYSGtudENBSTROdVNhdUt5RGc0RnNXdlczZWExR014SzJ0?=
 =?utf-8?B?S09NRmlUQmNsWVBZVmUxWG5rWkVZMGZEaHRrd1BZREFjR0xtRWFDdzYzY20y?=
 =?utf-8?B?TE83aG1SenVnY09FSlQxS1MzbERXdjZlU2hmZU0yNndPdi9GN21PZ05sZVpx?=
 =?utf-8?B?OFp1cFY2aXlRVy9DQnRWU24vZXZVRFdOSUJjNXRhb282ZDZoSVdCL1hSOHM4?=
 =?utf-8?B?bkxyOXB2dmp2S0RPdStSNVlXbXJsSjNzK2JhbVRFK29XaFhVcTdqeWlLWjM4?=
 =?utf-8?B?M0dCQmd3STR5Y0R2UldGRFl2TlBIaXA5em5wc0l0R3pmYUhDbFloSlZjQkkx?=
 =?utf-8?B?cHRmcEZxY2g1b2lISlg4OVFPQXBSZ0tML0o3bUU5UDBLb1Bld2w1Z0tHaTdB?=
 =?utf-8?B?UmdYMUpueSt1VllrdjR2M3VRYllSbXNtT2pqM20zcWQwNlpRTXptRmtmMnJW?=
 =?utf-8?B?anpNaWdGUUNMcWU4YlRUQTM4MHUwb1ZaZ2JSK21ZMmNlRjlxaElQdk5oZ3Ju?=
 =?utf-8?B?UTJVcitMUzJJK1JOZ1dBV0hWek1qeXdQVE9YVG43UnF3a3MrTWhuV3dEWWov?=
 =?utf-8?B?cGZDTW16M0djYmNDdTJkU2JQaHY4d3kxcFR0Q2IwNlE2ZVA1dU15QVdHOTVl?=
 =?utf-8?B?WnN6NWJRbEhCYmNOcTZNQ1JUbXd3NFc4MWxZV0h1TjU5SStFenRBS0tUYzdq?=
 =?utf-8?B?L3pzU2xUSGhhUUFCR2crSHh3emRhTHlNV3orUG9Zd1RWS1NoOFBwN1Vhc0Y5?=
 =?utf-8?B?cmhaRklBbXpsb1hLYkxYV3FnZGk1N1VFRC9Fa0k2WXp6MnRpQktjcVVWRWJP?=
 =?utf-8?B?VHVSQVpTbGJVQ09vZjJNMEZEWVp2WXJLVlB3QW5pY0xqUHNmQXZqVXBrUGlS?=
 =?utf-8?B?OWxlK2JwanZIbGVrdjlMVHRPN3NXRktCeGlCdWZWTlNqTERzUHcxcHFlNWRU?=
 =?utf-8?Q?WwH2evpew0SyEP5h1dNYvlibp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a698e0c1-93b4-40cf-d059-08db70dc2b42
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:45:12.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fc0rZw4F7OxYWaub4pcq7pQW85XTW96KzX5FJR8zR9EgoQnfsG06wbJvkmOgkOSJJ6SagMRqFz1e/YkBXti3Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

On 15.06.2023 17:48, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -432,9 +432,13 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>      return patch;
>  }
>  
> -const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {

Something will want to be done to retain the cf_clobber aspect,
i.e. to be able to get rid of no longer necessary ENDBR64 after
alternatives patching is finished. I guess I first need to see
what further patches do in order to maybe come up with a
suggestion.

Jan

