Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11247D3907
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621494.968000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvfz-0004pw-JA; Mon, 23 Oct 2023 14:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621494.968000; Mon, 23 Oct 2023 14:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvfz-0004o5-Fe; Mon, 23 Oct 2023 14:13:03 +0000
Received: by outflank-mailman (input) for mailman id 621494;
 Mon, 23 Oct 2023 14:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvfx-0004mc-SY
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:13:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 450866ba-71ae-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 16:12:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 14:12:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:12:57 +0000
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
X-Inumbo-ID: 450866ba-71ae-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIl0KyPqk4VT9jZo+nAtHLSFilIhSXi7VMHPL2ezAU/UL6kb8IKnnBUPT/nkRP6+16ukEprD8wo7FU5duDHwiJCQLHAA1pM0AvO+AJbCbp/BwUfxskefkD6OkVjIoWG73IRM65r2Ok7+Q4tny7PNrPcA6AAcvTNCXi7rKdp+9PSyoJCLuIa/3ARQpAxr+dv1So8HL3TDgEHNHzwfENpH0DsKKEHZ2ej5ViBLqhffYbLdmHa0z5RyJB689Vu+6L9xs/aCQuYhylQFmyxv6PHIrsjvVQrvm3yr8W9gHongl+OgYf8HrxYk/eeyZ63K4oq3BIFGy+ccENl40XO0RpASZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=MmI1bFlLdGdh7udDyDr54ZHed5djgs/0Mi3RQdYBnLcZ/yfeTCI9AsQlEEpYdUx9JD22EM60M6C7ela8hKwvIzEZgnthFPIVE8Csud5QcoaDxqTdOJPPx//Et7vHThiqUJ5UBtyN5duFwK6UgThNIdVKvVE+Mek6pmswGiNYbAtQ9jTAsyY8M4+C7q3AKGUgnam+NadDjzTFv8H8AFCoKPVnPJNCY4YB+CZr16ucc2xENTpGoaBJdItSvlJjn12uluVn5bcf5t4oHPEzQLJcUWqi2n+wJm+eqdStHYOjbxGiDC4lW2lTa8unFMNuxR/odqN3rnosG8q2QmOS7zFc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=bVQxzDOxNnXJfuTn+tFC5533ImjXIs1exP7jM8RlTO0ATtOg74b6SqDfX/bjsVTv15Cdzi12qFhh5KqZwvrSOz66QUWeD9jF6DGe9YwfPvOjbtl+sU+nl2pQy4qVMYcWrvakTmqop/sEBZx+1t5jaA5FKh+Gv0OKQ2WRn8GcnA73rA19aQ+P6HmdJJ3h0X4g2MLOyf/+qWCR2NVNY5AVnusAbJi9cWEBW6Uzfu20JPHA7vPygeuvHTWUUMNf++s4xltStSXSRKLyUjYhMBahF1W/9wDaYWXN+1kuCW5cL6795GOjtgtLAK1YSPpOvwtY1KxewL8Vm1VpPOicqg+lsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8cad110-1ad2-e64b-cb89-fbc53a8948fa@suse.com>
Date: Mon, 23 Oct 2023 16:12:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 1/7] x86/mctelem: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <3e811e830f6f49af6cc5abf4fec3c8c74b72256c.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3e811e830f6f49af6cc5abf4fec3c8c74b72256c.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 409bf574-512d-4219-c2b0-08dbd3d22842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WR7t04HM77bu39ZjbK7Rap3guSU/LoWW9qLaeVUOvcWV30LXSch88Z2LWL75T1YLN77FkfQj+ghqkZGV1XC/kZUqogEbF1GnT38QMG9BqOWmcv0DoZ6PYolz6hZgKOtt3eP5qcw32ywWfmZh48Ar3AdXE8vEaDHafszCDTJ5P+YXZsl8HTsyAIc7nPySjHWP3ONLVuirLhzSSBKk8U61Dl9vFo+BbQFh4sZw4lDqP3gUXhtuNoYuydgnH0RctxkP3U984Z/9DihiLJhXC+/0aHCrBM77D7LcSej8hib9Nk5bZr6k4l/YuwYRDDBKrJ822zcIsCO3Mekw6xYQR5vW5z763y1gDJRzolmyxZ3EUmWAppSRjrjMpPBX0ApUgIgx6BIcrxxgGcjIs1pvvy7pMNB0l+4Hn44ET4xyLX8wv5RX7zAtTn/oO0Y1vx8/ajJomp81cpyUcYT7Lx7zD9vY+iWgzOf+BrhZ4e3CRx8tocg+E8BGDCopGdnATpqye1m+iHSWLSFhgkLynhv5rODRWOgyO8C3MxM3BGPF0Z0gVVpM5b+6SuoUDsVSQOL2rM20c+2uF6KB6QKaK5fqUairCubtwCS8eRsdMZ1uP/IKNLUnIv720Ryrc51L7/KaFlAKjoLY7MJ2P0C6XjGWJYVLyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(8676002)(8936002)(41300700001)(2906002)(5660300002)(53546011)(6512007)(6506007)(2616005)(558084003)(31686004)(86362001)(31696002)(36756003)(38100700002)(26005)(6486002)(478600001)(316002)(66476007)(66556008)(66946007)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHc0NjVBRXdacVFpSmNwYW12cSttdHQzVzRBb0hPZWpRRlhLenFWTlhXYVV3?=
 =?utf-8?B?VzhxNlkybno3aUNVLzdBTjNsVllWQUNqbWp3aStlaTNpK2NDV1JHRk5WeVF2?=
 =?utf-8?B?T3FERUtGMWJGeDIvam1TVFM4Vy9jUG5tSHhuU2RseWFqUE4vRFFnQlYveDls?=
 =?utf-8?B?S2ZybUo4VU5BY1dQSk1Way8vdFNheWlBSzE1aFpBZW81VFR5bWZ4ZHBOM3Rk?=
 =?utf-8?B?ejg3d05MdE82MGJ3eExScHdmRG9yWGxwb1hWaTZNZ290eDZ1WWtzaEx3WUMy?=
 =?utf-8?B?QnhzWk1kWjhpczNoK3cyZzIyM0RjR2ZXL3JLOWs4S1dLM0RIckVQSWlLbEU1?=
 =?utf-8?B?bWYzemdVYm4zMjFJOThvV1lCMFBPdDBJcG53emtiMTVGMjhkdm03NmQrd1px?=
 =?utf-8?B?M1cyMjBGOCtLY2p4cWcvajl3SkZmdUt3eTg3Y1plM2Rxa0NxT0s2c3JoS3Q5?=
 =?utf-8?B?T3h3UklWUStzb1JtZE5pNlJnWUsvTFNKdVQ0cjdjaGJrK1JTWEF2VnhVQit4?=
 =?utf-8?B?R0h1MC9Rb2FuL1lDKytKWDlNbVlDWTZ0OG41bUJJN0wzbXJHZXlxZ2lveHlW?=
 =?utf-8?B?TUUzdWVBZzJyZ1RJMWU1RERjTEJudHNKVzY0TnhZNFY5MVBoNE53SEc2T0M3?=
 =?utf-8?B?OWcydVVIWXFicWI4QmVIbHhVN041MGFjdkFhTi9OZUZZMlkyTDl1c0M2bE00?=
 =?utf-8?B?UlJqa2R6VGFIRmd0NDJjSHBFcFhCSFNXY2psZnhsaDkrdHRPOWdKRjB0ZnVC?=
 =?utf-8?B?RGJyQW0rR0FWRVpLODNKU3UyMDBJTXZvWEJEU1RsdEFEN1p5TEdnSG9CYU9t?=
 =?utf-8?B?TEFjVVNBdHR0S09teDBiN1BRaXFUZ01yVEZVLzZmNzFhSVU0eVowKzIxL1hM?=
 =?utf-8?B?MERPWUZwWlFSTGszSjI4UzIySEtuNVpCcEs2K2YwUS82NmlyRjR3NnlnTWxa?=
 =?utf-8?B?bnJaU1Irb1duQlBxaURPdnQ2YVlkNFlZeGdqMVFoZ0o2VkNhTWVNRGt2R3ZW?=
 =?utf-8?B?QnFhRmR1bmxUZExYRFlYQmNmVFJ1QWJadlZVS3lyKzFBQ2J3UGV1ajFPajJM?=
 =?utf-8?B?WHozd1hscGp6alJkWlhTREZjbFBQTG8rV2NPaklnaFI3bXBkbDlpVmgvbGFK?=
 =?utf-8?B?Vnhtbk5uRWZiSnkwOUpyWXlTbVRrL2pWRTAzUUFpcUZEOGpNWEpwYkc5aDBy?=
 =?utf-8?B?ZXAvalQ3THBNUDVhdkFQTlloZUliRGFaRFNhRjlJNFhKYXNTK3lvT0svRHBI?=
 =?utf-8?B?OGZpcnhyWHRPK1I3N3FCNDZSUGk1bUc5Vkd5U3o3K2UrQnpNWEhQb1o2RUNY?=
 =?utf-8?B?aVh0TnVud2Vva3o4NzdQUzdIbmhrOU9nMTZwTTJTWGs5WmVuZHExM29vN1FQ?=
 =?utf-8?B?U3ordzlQOTdsNGFnNHdkVVBwVldhd1BZZFhUVEVKRm1PZ2RnUUcyeWhRUEo1?=
 =?utf-8?B?SmwvOGFESUZ6eXV2QmJ2SjRlQ21NYmdETVB4bGdleFM2Mms3Zzg5MUpQT3p3?=
 =?utf-8?B?WHZTNkUrTkpCTUd6NzhGMVUwY1l1YWduVis0Zmp5bUNQd3NmQmRvUmNxZFEr?=
 =?utf-8?B?eHpET3lBQzZOK3g0REdjdC83d1JQU3dkdkFjTEEwTHVScUdtS011cm9sWnl4?=
 =?utf-8?B?clhML1ZDOEFOdlIySXRMVlVZOGJ4ZzRZK0tqWk50eFpmOHRjSTRuTm1HS0tl?=
 =?utf-8?B?bDFnSzFTREIwc0xyYitkSmFBZDVIU281dXpNcENxMTRHNHpBcHZrRVM4MC9z?=
 =?utf-8?B?MUJJRDFjWE1hUFFYZ3c2RThpSExlN3BtSTEvVkxQdWNLMXNQZXcvRTdQZW9p?=
 =?utf-8?B?M2M4czgwZUN6cVlFRlhaNlF6eVJ5M3pUZHlWNjZ2ckFiS3NqdHN4Z1V4a0Z6?=
 =?utf-8?B?b2dpbFI5OUI0WGtCVWwrZCsxdjY3Y1JHc3RmZXdudTBzSDVUTW5pTEdtL0tq?=
 =?utf-8?B?RENtelZSZ2U1R3d5ZVhobFVqS21VamRMTmsyQVNvRHdzaHJFZHVuSDVPc21D?=
 =?utf-8?B?dWlCN1laTVBCdGRERHN2eU1ha2JneUYvRy8xcGZJajdzL004MlNidWV5dHpG?=
 =?utf-8?B?ZzNWVE5wUHNGc0h3VkVaSUFOQVFuTmdJckNTcFROOXlJbHhrSFBSMmhBL1dW?=
 =?utf-8?Q?9293fcnXmQ7Dw6246CRgxOE4a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409bf574-512d-4219-c2b0-08dbd3d22842
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:12:57.6598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FK5X/FF5LDJ0aDxUTiJK+BDIVkUdwzX1bqGK9DSklelKhvUoyAWroOnEdWVhrgWums1wigWbj1pQsMwQwlTn7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

On 18.10.2023 16:25, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



