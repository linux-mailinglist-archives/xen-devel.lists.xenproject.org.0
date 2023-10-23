Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FA7D2FB3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621258.967537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus5c-0006NI-Gf; Mon, 23 Oct 2023 10:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621258.967537; Mon, 23 Oct 2023 10:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus5c-0006LG-Cg; Mon, 23 Oct 2023 10:23:16 +0000
Received: by outflank-mailman (input) for mailman id 621258;
 Mon, 23 Oct 2023 10:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qus5b-0006L8-5c
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:23:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb3b4b4-718e-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:23:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:23:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:23:10 +0000
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
X-Inumbo-ID: 2bb3b4b4-718e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5qCtbAk1rUWyktE9nfZIHp5aEEJpyWwG2Rq3NSrTIszXNUtP8rr0mny7ri5JT72tjdY7rxNHr5SntzVAJcLqSFc+kgqtGG4FiAW3vwQYTaPnUl09Da77/O6frvyvItzhSFEP9ubc1x7UN/6TCLl6AeWr6fcBVc/PYSW+hIuaH2d9qt/5xvqez2dkekPudLGp7L+DAJEly/3B8QXJNj+uXubLCnt8qRS3qefmD3VpkZvaMwyXODhRMgEwZlVCZuCuwU7Py8s1D2nuyQ6JvUWxqj/0rRDugHk+Duk8faXjR5E613ULZx8+d8k7wG/55yoYJ0B31Y7R5dBubrAp7GjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vq0FD3NtD7VVYQ1Yh3ihrvzQJ6QxntSQviu57XyEZwA=;
 b=MgsWbdqRR+PwJn4+KM7yoMuBQwWbtU+eAvjnudqbFoOJARKOYw4An5jMQ6HGd8hxSwAanhlg3D37EC7yVqlSHo7RB8UGXI460Eyw+5O6JCeFNifu5h0uvba0zBWM/HZ1EveN4D+L6n7Io/I6XtAUxlee4efBEjZ31rG8yvR4sOmuUAmcg7GQX+JcCWQAr3i/MtDp6pdXKmbF3kg8NmmwD0Y3g24dERKMNTdkQbNW46Y1bn1uhbJFqxJ/vNZjosKowGRcEZdR4bkLufk3UjEiZEay5b2hDr+BKpBg5fZyx9zRI9JzKcv99LDDgD+DPgv0Rn2V1cNoLQqAZkBL9QUlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq0FD3NtD7VVYQ1Yh3ihrvzQJ6QxntSQviu57XyEZwA=;
 b=fWlZ6IRBi6kl8mrYxOlcvc1N+yOnfBS9YDEn9oNNPSBW+i4lv4+TM132sAGkt0NmmaJvzGfHQccwFsUXea0ykSGeS7fRD50BMYBZSAVbwhHGffJT9LC1WrihzLHQRbD4oquJ8m+THTHHio2QleFEPkuYgiHtpctBPPJ0RrFZ/i8MuH4KfNNEBLdVM2RvKTQcaT6476rg7dv7aanJo86OYR3EuD0KARCC5F79aPCowyRmRz7d6RFDCIf9LaJAImL4dxSPozbnW4wDVNn88xo7gdXbX3NiNwr2VM/GX2LH6/UOY44rl9yW1dCiJ3WOnWu7IulccEb2t0OHSw52FOXc5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29ff2917-3828-710d-01b4-67941ec16ae3@suse.com>
Date: Mon, 23 Oct 2023 12:23:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 8/8] docs/misra: exclude three more files
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <741b3eee4c25296bc114cfcc0f38d7e7c2bef667.1698053876.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <741b3eee4c25296bc114cfcc0f38d7e7c2bef667.1698053876.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2ef827-ace8-4dd7-242e-08dbd3b20ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKeYE+OJaI6mmrMaz/YcYMz+oH6H39L5sbtyAkqkHdRupqvMTnopKsvAOxze6RQYv9Lf93tm7owx0kpg9n/DAznBkH16RGy2uKmgSCAsXopK+1fcW69WvbwoRzEm4i/X0x6ezmlmURqwsbyY2eVkQGlMW9FeJ6mx52waMwdhC0oAGUeAr2xCGs5E6H75Csmvo1nf6pLUlxhEPBbYN03ZgsQOhwGbzn9fgv+I+ETlgZHZOEm76IUkFiM7/+e+z5iPwxNG6rdt2bfkREl0poLBCtg7tSNhaExTpiruAJvXDNaCIZmqxg34lhZ8YCbMrjihiODOVWaz1tjLff4Z+eapGM5JJihREUgNl+psR+4FAUhQPf50jA470eK6xmf/CJdB3vyWrmVBSx3vcKNM5HHquAM4sqx54wykplK8C24uAG3vPgUa8HOHuvoOOV8B+twz5L3bHNlvs6+dftasobHjxdtuu8E2vYMMJpaapEahAMraRdXOCondu1M52Em2fD1zngW0XqhTm1Yq6fnjgd/uKE8dz2QSTUI6FR0cUr7akiS6cTcMmY0kL0H/EIuEqmnsMeEPOccnc60ZK0NGxKDCDVr1MoAhcsgMOZeEC718TJuKx0NJrhfkt1VhPqWA+NH6lY6dpOgKdSSVq65VCvcZFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(31686004)(2906002)(4744005)(6916009)(5660300002)(8676002)(4326008)(36756003)(8936002)(41300700001)(7416002)(66476007)(66946007)(6486002)(316002)(478600001)(6512007)(6506007)(2616005)(53546011)(66556008)(26005)(38100700002)(86362001)(31696002)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnUzQU5PQ2xKUTlnMmdTY0twcTZRQ0hNTDU2OEZORllOM21QTlU3MnV1Nk9S?=
 =?utf-8?B?Ykt6YWlhM2NNSkJDLzZTL0FtSityU2FEaHFVQ1dZZVY5K3VWT2NjUUtlaTM1?=
 =?utf-8?B?eVRnMXcxYVdCeGZwaHNvL3VuTnlkTFRtVlE4RWUyT2NNMEtJM1BLOTM1Zllr?=
 =?utf-8?B?WVgzWlpPcUtkajFBU0RZYm5vbmNrbDNyeks2Zm9YZXpDeEdiVWpXLzVkVzJW?=
 =?utf-8?B?NER0RXFoeXpNQTM1TCsvblhCVXBmM2lzN2hUY1ZEcGhocytRNUJTekQxTm8z?=
 =?utf-8?B?U0QvSWtCOUwwU3NXNm52OG1GNldJNjhSWkdwaWV6dUVYelB6RWJ5L2R1ejdv?=
 =?utf-8?B?MUVXNmpHSy80QmtzTVRUNFhSVWhKY2UrTGFrU3JLZ0c5ZjBLaldWcDdWb2tC?=
 =?utf-8?B?ZytySE94UFdCR1RCUXNZQUxtSFJDdEkzNDZSNUdrbnhtZmZSMjNrN01TdWF1?=
 =?utf-8?B?d0lHNCs0TnNqVnFOaWlhdmdESnpPdHNSWlF5aGthemZuczZucnVRcU1vNHBE?=
 =?utf-8?B?a0M4TmIydTVoQnV3M1hDTmU5R1Ywb2ZFcmxzRmlLT1JLVnNpVWlHUTcxMHZJ?=
 =?utf-8?B?bVFZSDIwalFja2VUTGtSTHRncTJ3dFZRYVk1VXFMUXVJU1Y2MGpzVEoyamls?=
 =?utf-8?B?Uk1CRWpzUHRKSkVNUVcvNDlrcjlNSXpMWEFnazJLSDQweVNsZUdscXFaKzM3?=
 =?utf-8?B?dlg1RE1JUC9pa0RqbThzbE0yYStiRjFhSG1YWmkrM2tqaXM0eEpCVDBRYzR2?=
 =?utf-8?B?SWJvYmFvRGg3eEFXaXdYbjJ5U0Qzc05leTcwVjM1Y0dieTVMOTVIR2haUzUx?=
 =?utf-8?B?aXhSbTYxOTJ0SHJ1Y1AxalRkYmh3NHRudHBib1V1eGdlT1pnWVhuaFp0MjRi?=
 =?utf-8?B?cHZWWlI5TDR1QkdVc28wUjF1MWg2L1BzR0R4dGpuVm8wR2NkZ2RNeXQzSUtq?=
 =?utf-8?B?YzlsRHE2cWN0bVIrZ050T1NSSUFDUzNCZVJsZ01xam54UFd1cnFlUExHaWFM?=
 =?utf-8?B?NVo2RU9vbE9SM1dlbXMzUHRYdlB1U285Yk1XUk5McmxUdFVIVlNUd1hJVlpP?=
 =?utf-8?B?bG9RcUhCcnJJZVNlK01UcDZGa090Zkh5SEtjZGRJT2lna1FIc0xpOEVNbU94?=
 =?utf-8?B?dkRjN2FXWXhSZHR6Z1FTa1RlRmtJQmFHMDcyZ1UvR2ZjUnlJY3FuSjRmdjNq?=
 =?utf-8?B?Y0gxb3pQZjRDb2FaUWZIVkwwYmVoT1lXclUwcWN6QitKME1zSE92YzV2YXA1?=
 =?utf-8?B?emdRYWs5b0lYR2ZaTlFDT240NWttNDVqbEthOEJSY1d5SGo4Ymx5V290YnhN?=
 =?utf-8?B?QVRvODRRUUUyazRLYVFWeU1tN2VOcWJIR2kvNzJHdzVTQ2llQkpXdmprc2Y0?=
 =?utf-8?B?N2lOd21YNWQycXQvK2N4SDA2d0IvWnJDaVNkRFRwMnAvQ1VRL21ZSE5iTDlk?=
 =?utf-8?B?bG8rM0dXUjlZQytqekpBcWNHcnZaTnovZHdaQWlRT2QwdFVVY2swY3hvTXMx?=
 =?utf-8?B?S3YxUzErRU9VSHY1UTNnMTNVQ0pkeE1xWEJLRUIyUWkwK3FrZnBnd2dVK1c0?=
 =?utf-8?B?YXc4am9YZTZLRU4rSTRQTGl3QVpZajgvL3RxRGVnR25OT1VWL2UveERXN0sr?=
 =?utf-8?B?SVFMMkJkZWNZK0FjcWtadkJ2OVhoNVVFNW5zMGhYRkl3YXRBeXF1Nkt4MCtJ?=
 =?utf-8?B?a0h5Y2FCOTlPbHZJVlJMSlJnRU9aYnJXSzE1NXF0QW52WXdLQVI2WUxBWXZw?=
 =?utf-8?B?dkFtU3d1Z2Rtcmd2THN4NnVpanRGdkVkOW9SZjNwdU1uZWFzMytpdHVIYWJQ?=
 =?utf-8?B?eWRXVEIzUU5qWkcyTmNzYjdKVU81bEtiZjdEYTJZREkyUzZlcXpWa29VU2I5?=
 =?utf-8?B?UlM4WHl4ekhxdU8wa2JMU3NHOFpvcmU3TTJGUU5GY05VZDBDMHM5NEpOSW1V?=
 =?utf-8?B?N0NnMCtwUnBvMXdJVStWMUFOM0t0VnBaaDZhM0NFN0c3R0VIRmJVSU9uZ2tN?=
 =?utf-8?B?Qm1VYWNvTC9yZFU4RzFUbmlpWWptaE1PTEJNSlloa1dZRUk3ODUvMXRlcU9o?=
 =?utf-8?B?WXAwOG8xeDl4NFVSZWNLcHMzOWF2L0pKU2Q3Mjk1QlV4Wm4wZVJIdXRhYkh5?=
 =?utf-8?Q?gxrpEmBu0Lax5g6rZx6xewmcc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2ef827-ace8-4dd7-242e-08dbd3b20ea8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:23:10.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSWRCakTEHiPiarCcIexflQY1QA2p2dyWly8aVJxaUAaKf8R5KhaOODGiVqB7RgreUSbSwgDUt00/t/1tZLPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 23.10.2023 11:56, Nicola Vetrini wrote:
> These files should not conform to MISRA guidelines at the moment,
> therefore they are added to the exclusion list.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> These exclusions are automatically picked up by ECLAIR's automation
> to hide reports originating from these files.
> 
> Changes in v4:
> - Fixed typo

While there was an adjustment here, I don't think it invalidated
Stefano's R-b?

Jan

