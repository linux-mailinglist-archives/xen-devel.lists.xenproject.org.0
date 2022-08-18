Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D85985C4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389627.626679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgXI-0000sN-HM; Thu, 18 Aug 2022 14:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389627.626679; Thu, 18 Aug 2022 14:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgXI-0000q0-Ec; Thu, 18 Aug 2022 14:30:16 +0000
Received: by outflank-mailman (input) for mailman id 389627;
 Thu, 18 Aug 2022 14:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOgXH-0000pp-9x
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:30:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2075.outbound.protection.outlook.com [40.107.104.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4494ee3f-1f02-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 16:30:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5274.eurprd04.prod.outlook.com (2603:10a6:10:17::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 14:30:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:30:11 +0000
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
X-Inumbo-ID: 4494ee3f-1f02-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yqlei5tMrxKwkeTz7A0u1vZv8oOcJaM/fy92y/LvHWdoPBuzxfi15xaP3mgfw2XAwO/MR9IJt2ifsSBvqC+WfNV0/eXiNlDTugF4ohL0NK1kaEGE7pSSpNyKc6sS38AuMBQAVjrdVZoXC2eV2K1PeZFNqRB/mzMBDySUqaYxd8TZKrqPppKfJkBgqZ6dxVCYu2SVVK2bgBVL5YBYIidTEAbM5WFASIAktiBqC7R5sbEH0+ZJA/XV0W2hHa1cVYkmQbGkpZ1tBs1cOssUxOaOnKPF89UzDI+8ghWihqbRcrWLVzOQKrt7nMlEZyDr+Q/w6n8itWi+cSn/4UUERLvVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPxcbN6NSN+W/lbktdMMgl/cOwLf7gi3NV8a42Rafzw=;
 b=fcRVsqON7JvdB0TTjWGEBDsmv8didXOR2wEmfGAt4eIUa4BtkCfoDkP5qS76giGkBopOY3Q/u+6MVWFJBZgCmJV4vTCn4UsMOb7Jk+DBw1/eKx5ftJrzUc/Znpqx0j+r1hRYvYD5WtE9zBa0hrjDA62DpiqT1wImULmVhiL2dY11FIMZN02LEgIY83TZIY6BEzsx/iarEhXfOERj3w2UxT5hL2Zqx6bWV0ksqgyclZOmzUgUAc//7G/yNQnhgIu4NCJmsLepkAXis0f3VbyaDzo6H/8aL7vas6Qm3EiP5QbSaR5SWR3xBTEWc44Hf8FomEclmoounQYRJJECT0afow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPxcbN6NSN+W/lbktdMMgl/cOwLf7gi3NV8a42Rafzw=;
 b=o5Xvg7z3U825X4O+ttWAq9Q7u6okVdR0UgvMz/p01OP5mgtDYDuYqsfUmuceq5ONa7S7VhyGF4WUn9EvivANQ0u99d52TTYc+D14j3YR8p72QGxySUbj9NjiI+x1V9NxE6g4KxQe7vj9pRMf8j6Z+WbNuT0KY1vrWh5LphfuaZ9aUscoPYhJmJvzGLSI/3D0VeAX04nSL+T48QrtHGlwjBa6OXgLq3qm1mLhE9ywP8njcH5czalj0SyPn5k8ZzEBo8rvu5izPBVsBTkEqL3iX4F4SSBsn9WFcnDL4yhNvaQijdmnfGLmIs/rImjXTjWwqlLUlFQAe3xB0ga/W34XKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2682b544-aea2-f3a3-48ae-4ebb03ac0acc@suse.com>
Date: Thu, 18 Aug 2022 16:30:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] automation: Remove build-* from gitignore
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <199cc377eb38606bfa4b33942f0ed688080cf535.1657636714.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <199cc377eb38606bfa4b33942f0ed688080cf535.1657636714.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15d70e8-c832-4e63-a31b-08da812628a7
X-MS-TrafficTypeDiagnostic: DB7PR04MB5274:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hss5Bv2jtpkrTXO8xjrTJO4bU/8JjHbwFsz0cb2KAQF861c08Xk17ZGJs6H6E8M7k/Yb6jvXez0zMmi12OwUjC648u2MltKumV7Szrzz2T8EXN1NEz9YlnAB88KPYZ4VrUseYUwJ6KKRXbZn6Hm7jB4ycGuItXOpNwoeFNxl09HKspSGsXSApipnfPgu94by9a2YOUNuIZrtT1CFmWJpg+MFfBi3ejwhZhGPdvFCtMTCAUCngRbm3e6tz320RryzsaB2/OdZJmX/alIpLHJR27bYnpc/cD7kdbwt/Tc3QQpskn8PPRtazZMQ1NQKSznwxvTNHfINe/lCsyL+WirR1pAl6YWboAMS3v602yYQbeEHYKE4+H2jXKgqd5mdtuvqRKgKIWMS/b7sRZ6kTD1k8u3GvSySpyFcURw0kA51jd+8/me0TCBwIpAUFnAisO150UvaaSvKFiko1BdyXtAE4HTvRYidWNioUEITcGfeMWeo+AJgMIcc47wix1GPPTFDFbxZHS+gAxil8rejI3wbNo0l84tAEYZBqRY10D4FSq6WipwumIIuWEqLr4gqJSlPnPd0eOVYxs1n3QVOfd1lupqxkyRZksu5w8Rl3OO6w1f1rkPU5GNG9AiJKVILOSDibVk8JkyTnIucc2ZNM99Ur2jHNNpRmL06rPNEt8fY5RbonfbdjNFn3CCNBrxw+ObykXLycqpmNSiHj2yxVzAhoqTYf7tsV72h/9VuEjZXTkqBg6aDvhDbOTLIRWtbyDfAr80fQH1TF+jTYzgOCstLAgcxJix3SKJyhQi300zvjyAcf8eDiJyllfGBgNNz/Fod1DBH6FKXlGUq62ZU0dmcIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(366004)(396003)(346002)(136003)(41300700001)(66946007)(316002)(6916009)(54906003)(6506007)(53546011)(6512007)(66476007)(66556008)(8676002)(26005)(4326008)(36756003)(31686004)(31696002)(2616005)(478600001)(2906002)(6486002)(186003)(5660300002)(86362001)(38100700002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elpmTlB6SGtRYldRUVM5MDhkZHRiaC9mbVpDQnBOeElkSjBxeTVzQ29CTHc4?=
 =?utf-8?B?Y0F2TXRxRVVVaEY1SzJ3RVFlZmdTY1B6Mk9NOWNXdXVqNHpTWjFJeGtabjRB?=
 =?utf-8?B?S0VCWmRtVDZMN0N3M1NXelNablZTN0RwMmJIWEp1NkRaSHFRZU1wK2tnNlY0?=
 =?utf-8?B?d2gxN2RCdkM5YW9FM2YyaHFpdndFYUdJQWV2TEJVR0Mxb2ZNbGdUVjhFQUxk?=
 =?utf-8?B?NXZJQWhoQkxkSDZpTkJaYjhGYkQ2UU4rS05ZaWJBU2VZajVJMlhqWmtlT0x3?=
 =?utf-8?B?MXFaT2dZamcxcmVVOTZMcWFOa1BvT25hL1AwVkMyS0VmVG1CT1J6ajhDSWRN?=
 =?utf-8?B?dHJCdVdGVjJpcUc2WjFEY1NPbnE0ZjJUSHdTMnVSd2RCZFZSZGNpYU5sRkc4?=
 =?utf-8?B?dHFjZFdqcnRlZytvYlRzYmZuYzZFYXIvanRxbVpsVWhkTzdMeVE3cjlKSDNM?=
 =?utf-8?B?MTIwVHVRUmM3b0M5ai9ab3d0QVE0Vkwwb0hZTlMyMVVEbXlpZ2hXT2Ztc1Az?=
 =?utf-8?B?OEJvSG1sVWM2TlZGSnRXZGFkbzdmMTNVL0JRNkUwMWJpU0pBY0NKaFlkanNE?=
 =?utf-8?B?RktnU2pWd0VjbEsvcHg5TitUc3lLUjRLR2Mxa3Fwb1BYd3VwTVVtRDk3NDd4?=
 =?utf-8?B?MTBSMUxTRTdHL0cwV05UVXdzTGF1RHkxKzFFZXdJZEpwWldFYTBuYkF4enor?=
 =?utf-8?B?Mnl4em5ScEFjZ0RneFFDN2ljSFVlRzFpQVNTRGtRQUNQVW5QcmhTcS93Uktl?=
 =?utf-8?B?TU83TzlIWk5CV0kxYVVxVVk5d1ZpZEFMV0o4RlZaMmdqZFJabHdtTkU1N0ts?=
 =?utf-8?B?cWQ0YlVhM0xUa1MwOU9WSlVuUVptaGRkZE5qTmhuYXdtaVE1Wm5ybGVaUEo2?=
 =?utf-8?B?Y1laTzRra2ovaHFTSUpEQmdlbC81YUpiWm5heDkwRzNYQmVtai82MVJrR3NQ?=
 =?utf-8?B?ZTQreXd6R0lwNnNNOTZiYi9uaWUxRzh6emVQOVAwYm56RU8zMTZMZzNxbTJv?=
 =?utf-8?B?bVBPSzl4R1FuMEFUeTBwYkNYZjUzMk5oTmNENk9udHNXbUNjQ2ZKcUNsTWdt?=
 =?utf-8?B?bFdvMEJQR0dYdjhhMXUvbncrSXhTbkRkbkgwcW91RlFLMmFJbitkdzJtNWh4?=
 =?utf-8?B?M05WYzJFU3dHaWNydE9zZU5SQUgwcUlqcG9pbDg4R2J1TkRKVEU3YU9KQ1lQ?=
 =?utf-8?B?ZElPemVGQW5vUTJGd2EyaEJOQ2pudXJOdjY4Q2lOZUEwYUdaN0FHck5hZHRo?=
 =?utf-8?B?ak1GVVg5V1NtemVSaTJrbUt4SDBrN0JWbXVObDF0SFI4eVhYYTdMNEZ5NzFN?=
 =?utf-8?B?MjhkaEo2VUdIL25lU2h2MGJMK3ZLdmhzNE5kb3VNZHc4STRub1p0U2hSaGhW?=
 =?utf-8?B?KzFkblR1MkdkamlqY2ZuaE00TFoyNDNkVFFURUhGUmhZZ3RyeFdsb05wSU9P?=
 =?utf-8?B?c1BzbVNsd3V1VThVWWNmVlZMcmh0amlodnl5TGdndExKVFVHMzV5UGRnL1Yr?=
 =?utf-8?B?TUl6eVFJTUdYT3hMUE5Mak4xTjdwME9LNzhXc2dBQnBMTVhPdFVIKzZpajVI?=
 =?utf-8?B?eEV2bEowMS95aHIrMlUvZlZnTWtNL1NocHlSOGdlSm9yM21leUhFdWNMWUFY?=
 =?utf-8?B?VjFYUE9mcmIyamRmcWM4NUU3aXd6cnIxSlM1SEcxaWUwam5tMVJJTjlFM3pE?=
 =?utf-8?B?ZGYxUnByZFdDQ0w3RWxzREVDNW1FRDZ0Nlc3YkRncUZsdDkrd2ZqTWRyS1g1?=
 =?utf-8?B?NitORUJJeUtpWjZPemJGRFlhWXFvdFpuN2k3WWdkMnNVNzJVOGNsM24ycXVs?=
 =?utf-8?B?eXpqNnhtUkVsT1RqRDhwdnp5RW9MV0R2OGRRcGFJRVoxdkZUN0p1Z3RTTmp0?=
 =?utf-8?B?K3FYS0h3c1BCSGdEaE83SGk0T0J2NkVDTWRqOTNRTFRTODcvcUk5TFRJR2Ji?=
 =?utf-8?B?dkZTbzFXRmFham1IWmFueEdRTXI1TWFmR2ZSOUlCMTB3NzhCUzBXYndQdCtQ?=
 =?utf-8?B?SldGWGQ1ZDI2VTRyY2xaMzRRSlVrT20rWDZ6ZVFOQS8zUDdVZkVYVkxrbEdj?=
 =?utf-8?B?NXBOM09ldmhGNW5CN28vRkpCZXJoRFhsUVlUY1Z4Mm1taDdLL0h0Unp6Q2xw?=
 =?utf-8?Q?RCm1KdfHIo9I0nIRaMfedThB9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15d70e8-c832-4e63-a31b-08da812628a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:30:11.8099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hd9mQpi21K4Unif3tT4QL3yr04oOkxcxumhNmm2oUlG4gSzAS/PxoyehOC0petglvKQp5fAmUm6ooGIDvxxWSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5274

On 12.07.2022 16:41, Bertrand Marquis wrote:
> ...because there are some scripts in automation corresponding to the
> entry (build-test.sh and build-each-commit.sh)
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

While it seems odd to have this simple a patch sit un-acked for this long,
it looks like I'm not the only one uncomfortable ack-ing it without knowing
why the entry was there. Old .hgignore history only tells me that at some
point build* was changed to build-*. This recent mail from Andrew
(https://lists.xen.org/archives/html/xen-devel/2022-08/msg01043.html)
matches my vague recollection of build-* being used as sub-trees for
building stuff when out-of-tree builds are possible, yet people also don't
want to build in an entirely separate tree.

Hence as a compromise between keeping the status quo and deleting the
entry, could we go with changing it to build-*/ ?

Jan

> --- a/.gitignore
> +++ b/.gitignore
> @@ -44,7 +44,6 @@ config.cache
>  config/Toplevel.mk
>  config/Paths.mk
>  
> -build-*
>  dist/*
>  docs/tmp.*
>  docs/html/


