Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2EE7911AA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 08:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594973.928430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3TS-0002Wy-Fu; Mon, 04 Sep 2023 06:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594973.928430; Mon, 04 Sep 2023 06:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3TS-0002UG-Ao; Mon, 04 Sep 2023 06:54:14 +0000
Received: by outflank-mailman (input) for mailman id 594973;
 Mon, 04 Sep 2023 06:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd3TQ-0002UA-UO
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 06:54:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9adf1e3-4aef-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 08:54:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7395.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 06:53:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 06:53:41 +0000
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
X-Inumbo-ID: d9adf1e3-4aef-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP6tkmng9Kz9rXhGlU8bwV/3aoA1D7d4gaKS6xuLWsdP9cdRgZXx+fiuZVbtgj9hVFFu9dfhT1SZ+b3QQgQ+xzaYNGAX43QXkDCp3SYQmbhwc+b/B15/ei0yN8+cvi+1t4+eS0TM7y0j4hGPksRKfyWcAHyEayxFBQK2rdpJKE9adyV4ukSU/Oq3f2OIIXXAuiGBLM7wOJ2325X9UKaGQJ6CqO9Fx+vDE6Ayj+JPympxuhCjSKZH5RVqmGz7JSEqEJ9jMbICjyrL0LulSh5scqixcot84JWZm4+EHnnm4uGWJQeyzFGX9aAJWm+qzlGk2NGr0MpDaHUoa1L1O5Q26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQCkIMJnDmpeutwPEvoHUYsip+Qlpmk/jXAZ8gbMxiw=;
 b=csMUXZp7Fkg+cGMucGaERxsX6aSe8/4iUIxd1lsgzuPKh71loT/3m4bc7EyE2GukFLzvbrNr51Wg+9ZBfH9J+IZwatHEevvdvfUD9t/4Sf9U7aKE3Qo+1kfp3x9cIOnrZZ5LZAPx/CNEXdmBdyULVAOs6rN1fY+n1uYok1BqXlbQBNjXmNBR0YwKBF3NgsLuAg2PBtpvt3WYtp0QNKkQgWR486JaLA3Pj4SlpFlk2i1Ku1jmcEOk7qdDUEqu7FrWFfxTFxK2sVkwdSyIk2FZOMAt6kXdVF98nN21h1MYUFIngeP1DDYvFOUK2CpbqAX6709WeC2uEiorA7v08jkXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQCkIMJnDmpeutwPEvoHUYsip+Qlpmk/jXAZ8gbMxiw=;
 b=Uue73rA53ebin5ChSDVZ41jb7qllrjWq8YJzAfNB1XrB0l7K/suyNMOba/Z63kLPoRS9e0rp4sq+OOhPOq42MEKK7zHiACjRzlV91MulFbNMTgupM4yfQ/gEDt6uslCsyVufapX8EKmryNyEOqakrCD1KIb6H0QcJgo6lUqSRlwDdDDRvUhDRbw6x2f6vB4jk1gD2x4sbTeghusX3VkqRmNUi52mcdPsdAKIjV9+Fi7Z0uFL14iW83OZZIVE97WZU9WPw2OYRPzhZrdh6qM4sZKrcaEDvL7brGPtU0Bwh2oMqbXqvb6tcuM/HU+S86rz0LbR1HWqjWctXf/cQgfn+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50ee02b6-45b1-9664-c001-31233c6fd47a@suse.com>
Date: Mon, 4 Sep 2023 08:53:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
 <CAMacjJz4-Zd8ferGuZKh83qiUCw_hh91Rep903Qys6pAx3kDfQ@mail.gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAMacjJz4-Zd8ferGuZKh83qiUCw_hh91Rep903Qys6pAx3kDfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: ca13eaa4-a287-421d-9183-08dbad13ac3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jRqvialsfwGepKd8GIvDhCSnE4T8MWcXvXbTdGfAys09Q62TMZPZXOgOK4ojULbcCPfmtnOoL5avq5aEqa9WWm8Rqk6lo3RNX4NGVW+WYWy59/T5Z7FWOMy6EE6bAVLeAGtutOTZMN3Bk3g40mhhc+lhn/wL7K+XMOhLdSP3R0ZSpTMLMbz8DIhQpMMANXCQoHrIO30Xi7HmA7f/igO/TaaVEri/Gj2oZXE3LreC6ikeVm9GrWHfsCIKp7fiL25UCcX+3ssZavqx2xVyo6vfZOGdIVdg5NAeRmLnr3sfr27f0+RkrOWbhflNVB2RHxWkVrWtppvCd623XORlcBjeXTgzGhzfaaQLDG9NXh2gDhxBr5fTfIXfCm7w0LuAi2HRiBa4lMuivljH9iU/43o7X/nCyHr1PplLygfV6es4nXvGd8moGR3K7dYT8UrPcY4ULOBE+iHYLaX1ak0WGNxTnaTxSrzjXnidB/rtdFSCo5hH5CNZo2/t613851UEZw3yYj3V+3IjQOO9SeS0xmtNl6S50c+DY2webJbsNhrogJW4pgyOBxIqEs2o//Ca7I80n6Qu+tYVJlYmwtgRXoxFme7qX1DeGPLuY6lf0jg5pXXeSJc7BChnopQsMkRn79YAtAFyn2hbzfXiWR86pHPkPogZ1GlIIFNN4Q34M7YkucY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(186009)(1800799009)(451199024)(41300700001)(6506007)(6486002)(53546011)(478600001)(38100700002)(83380400001)(2616005)(26005)(6512007)(4744005)(66946007)(36756003)(2906002)(66476007)(66556008)(6916009)(316002)(86362001)(31696002)(31686004)(5660300002)(8936002)(8676002)(4326008)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkdNeUR3WWc4OXJKUFY2OVplV0wwMkZXTkZXYzNONG1jNDIwNlBPZVhTTHdq?=
 =?utf-8?B?YTZ5bWxEWTk4R1lUdkp6ZWx1Rlh2M0l4TnR4V3FPS1VzQnVFbWRCc2FER3Jx?=
 =?utf-8?B?dVQrdHlNV0JRYWNvWUU3dGlTR1QvcDY2aTUxQTdtVDNuVS9PejJGTVI2YTFz?=
 =?utf-8?B?Y28zb1Z1NU1YSkhpMnRVQ0JHaXFkNlFhdEd2cHpMZlRwTVh1R3F5Wm15NktI?=
 =?utf-8?B?czJJay9hUXVzT0RvSVlWZ3kzaUY4OUtzajkyMExYMnJiemg5aHhWQUd2cEls?=
 =?utf-8?B?WU9JeFRPeTIxbUhhc2tXQXlKVEZwQlFWQ0NBUEtLc2FnV0M1UGd1K0tQUHBj?=
 =?utf-8?B?L3EzdTdQWDE3WCtzMjEwbWFIZDVCKzI3TWFFZWFBVGs1ZVFPS0VOQ1FzUzB3?=
 =?utf-8?B?b3RPbmYwSm00OFNjWUNRVGNIUTg2ZkExZGhvNXhJUVRNWlovMXZNRUFDd3VY?=
 =?utf-8?B?b29TZnZpcmNrY3YxWmJQNndVYjE5dExMdWUzUzNPMXdqMXJjd1REKzdkZzRl?=
 =?utf-8?B?MzhzN3VPQy9LWCsybWthcVJVNjlTOStGSHdPUEM0clJBdjJjekxnTm1VTVlS?=
 =?utf-8?B?N3N4dllUUG1RTnF6V0FrSVpyS0NudXVBaVFTZzlkUko1WXJtRmVBN05EempB?=
 =?utf-8?B?N2lPQisra0dVQ25IVzFjMVdUSWFHaGR3aU8xdmprYWU2emV0MW0yZU9pdnlB?=
 =?utf-8?B?UjJVOUJWM1NaMGt2QVYzdnZyeUtkOE1zOExUNUtxM2NIMjBMdlZRc2wvM1Yz?=
 =?utf-8?B?MFBrM1gyNm8rTHR1ZWJTWkU2NnFsbWozZkpLOEFBNnVJdUp2Y2NJdTNWT0tC?=
 =?utf-8?B?MDdoeGVsOU9YTHo3MW03WjE4YnVBamwrNU9OUDFxUXZpcWMwMWM3UnVJaC8v?=
 =?utf-8?B?WS9uYXc1b1FDcXdmL2R1dVZyS0xYc3RBaGZKMElwcDZwYzJZSjk5b1MrOGkx?=
 =?utf-8?B?MHpmc1VTMHMzU1JzeDdRK1VEZGpsNXY0ZjBlZXExa1l1V3MyYnh0ZHVNc21l?=
 =?utf-8?B?Q2RGaGYyaGczZFhjQkVEZzV6bm1pMzhnOVdxVHVMdWtJNlhCZTlQZzZiZkZ6?=
 =?utf-8?B?NGE2cDNpTk9XY1ZDb1ByOHlKUzg5cUpieitHZEpDTzJVYURvbmxuY1hiVk80?=
 =?utf-8?B?bXFTQ0dKWXJhbFNGZEtEc0IvUFZDMTBVTDgwd2t6N0JYdzJMeUlsMk9TK2ZC?=
 =?utf-8?B?ZDJla21pNVRKYnJCZTNoNlRHRitBL3Z1TUZvV0laZkVuTnRHYVNLQkRtbUJv?=
 =?utf-8?B?K0g4QlpveEVNYWZreWNqTWFIOUdUT3dmOXQxU2p5T1JGdDJvYTJkcldqK0xw?=
 =?utf-8?B?VWdzaHRqYmxBVlhodFRZdkQrejY5Uzl5SkRpcXpYQUpHRVQyRGthSW5WakFC?=
 =?utf-8?B?REdydkNRYlhaNE4ydWxDYytwSmpCbVRweUgzVEdXNmNsU2FhUXM4K3ErSDJL?=
 =?utf-8?B?MXRQUnpnVEk5cllqWDJMVkdWL0ZZa1J4ZXRDUVlXZUlnVVRQOFFsSW10RmVP?=
 =?utf-8?B?Z2NQZmttckJ3bUNUb0pkeXU3b2N2eEVJQjYxWjMyYTYyVWRISFp1TlA2dk1E?=
 =?utf-8?B?MlQza29EUTRqaFdpRHY4dHA4WTFHb2dVVm9iV1MwQnVDSnVJUHJabWpKbWsz?=
 =?utf-8?B?bGp0VXJpdDJ3cTVJTXFGOEpBSlc3czkrRlB2NmZaSDdnRnNLaVN2UmJ3VjlV?=
 =?utf-8?B?WTRnN1BRYUhoUTIyY0Rid095eStIM1drSXVkYzY2ZlA3WE9VdmpzWmhIZGU2?=
 =?utf-8?B?RHcxQkhoRU1nNFJjWVBwTEptMEhxemYweXEyMXh6UFZkblcxb2NMaFpHUURN?=
 =?utf-8?B?MTJVZDI2YjBuZDlDYUJWdGQ0aTduRm0wazdzKzV1ZFRpQXRUV0NKRkM4bWFO?=
 =?utf-8?B?ZFdOcXFjMUFlWlhscmlCc0lla1JYUUNLL2FPMFBnRlhCejFlUnhrbUtZOEVB?=
 =?utf-8?B?aWlpOHBXQ1RkNzI4SmgyenFuRHZCYlluUjUvNE9mMmRhTWZhSk9HY09ObWp0?=
 =?utf-8?B?U2twbEN0L1M1b3ZGb2ZQVmpXZ3BWdE55ZkszenAwRlhGYys5VGJ2Y2VjTmVL?=
 =?utf-8?B?Z1N3ZnNTK3JWWXh2ZWFxUWM1U3lYZmJsZmE5MHE0ODUxaDNlS1h5SzdMTGU2?=
 =?utf-8?Q?nUiWVMje4tYeB3V2+YpNMtG/s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca13eaa4-a287-421d-9183-08dbad13ac3e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 06:53:41.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a5gwknw56PfK96nsy4l+996B6lKg0NVgBW1ljnhcatLZrSTME/hCntqeR42IZvq2Vi6qN83yw4ULkuANCPSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7395

On 01.09.2023 19:14, Oleksii Kurochko wrote:
> The change which adds generic-y += vm_event.h to ARM's Kbuild was lost
> during creation of the patch. Should be added in the next patch version

Which I guess is an indication that ...

> On Fri, Sep 1, 2023, 18:02 Oleksii Kurochko <oleksii.kurochko@gmail.com>
> wrote:
> 
>> asm/vm_event.h is common for ARM and RISC-V so it will be moved to
>> asm-generic dir.
>>
>> Original asm/vm_event.h from ARM was updated:
>>  * use SPDX-License-Identifier.
>>  * update comment messages of stubs.
>>  * update #ifdef.
>>  * change public/domctl.h to public/vm_event.h.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

... any earlier acks would better have been dropped.

Jan

