Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF276D016B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516581.800925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpg8-0003Wv-7b; Thu, 30 Mar 2023 10:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516581.800925; Thu, 30 Mar 2023 10:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpg8-0003UU-4s; Thu, 30 Mar 2023 10:38:48 +0000
Received: by outflank-mailman (input) for mailman id 516581;
 Thu, 30 Mar 2023 10:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phpg6-0003UO-TJ
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:38:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b769cda-cee7-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 12:38:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7855.eurprd04.prod.outlook.com (2603:10a6:102:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 10:38:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:38:42 +0000
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
X-Inumbo-ID: 0b769cda-cee7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C81zHsjAR0k4mVTAb9pSqr1/Vrpn73OfNFuAS4Fw+IsjWHcNnR1PuWD6aMOzhs35xyyds/z99aRKq7XlmZBzY74HcURjVIEloxqJKmanjWm+H0HQY5xHemttAm2i8gZ2wG0nu5RbE+0UEaGzyzOvpV5PxaAZAguJlpVEco/01YMXYh9skhBsw/wPqFxHTEoxuI7PywPHkoupnqa4h+6MuUh9emRrH+k8JlrvOgSvK7/WEcLNq/VPnyqA2RYuIxz4h3OHrfiu8FgaseBB1wgflaGxUERIZRI6FoZdmHweIJ052TjeayXH1q0JK0U4laFreC6sr4iZo9NBRgjX2KOmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7FJlYloGtZt5b/LqpsUIPTZbUKroDx6AHGsuVW6hbU=;
 b=bvXofdowwZwUBAbcxrSLkWA9sZCNIk0bulBIoENDJJN0JMv6LLXF3dYvKRxaWe8VsQuIMnrpkjR+xUwMwAKvQxayWPIYrtbh7WqMEMDlduKysFlz/2orUZlbDGAIVKUyluOF2WtW32TDoERTmjg/InxWSiKbqdl7v34EgLVpNproQuy5gOXVKYRepR3rO8CtEHRDqykeaCMQ1P3jQ9zsfVbnw7OqgjfliSoLeiCfcR1O/QlV+bVN/8VQAuK/SOqRYWN6CDMfyj5Z6Vl+i3rzHCP9ExhkHWJdZfVWf11+nOnFrHQT57G1Es/fY6F0kinHH4ZfIaIHlEK+9DITXhro/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7FJlYloGtZt5b/LqpsUIPTZbUKroDx6AHGsuVW6hbU=;
 b=fLHfgRc++uJ+oTFPK5svn6eN//0HiHtyCY9CiVKxhzHactnnRygfYvU4FNKyr6Tj4rzKNvc1tmjdUd0RuTj+pb1TdxZZJMVX3KVUsHg3SDmEAGpeNj0cLNEp4xGMP9uvL9SnxMANrOnnslpiTy91kvWH7GlaRC7paZXz/GYfvXiOECIRPrgCVndLz78Nx1fcyCnGv0l4QG8yOXWnzVGoYs2R6xQ/Dm8WpL8xQE6QpxSIIuK2qGTXSJzbSVpkdQoZuVtnOg3j2mOn35DevvxpiJTjCFCR+PFsUY1IPcmd2Jb4ZGrjI7gEWWtkXqIw9ERS3rYcBElUs2RKIh5CeKGojQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22a58367-6a7d-867a-348f-b2d18248f3f5@suse.com>
Date: Thu, 30 Mar 2023 12:38:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] bump default SeaBIOS version to 1.16.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb9ff96-8f57-4f25-8b2b-08db310aee85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/1cQ3oC/UqWqp4DgIdI+zFRq+QQ8M6IVdZ3w8GndgEm8cPF26EhL8cTYtF3c8/nQ02HSUmingZ0i7R8WTbMmP8j0WPDA1woYCsbDyQEdqgl9XZSk7e05/5a/Um+fStpYSs2p5yOTPbk1rDrQg2aDD+avflDEMXygzSEKk6Bb+18HAO93Fv/njLkpbknorkPY9YKFpnpcFYYfcvllfxAwk9jvlIIdi6fKPIRWxEMjdAsMbFdpmZsLbu/kVdrMSOvOO5KXrIJzvMWt9al+DP/AaoiALVneaQfD1oxtsNo9xTtRKgee7qkX4ZYW3iJ5DYTuGvlSqHw1dIQywul6kkPXPqpPZ8+2FnuXxuAFsKJ+hnA12qVozE9QR0aAX0OwTb0YB7FICAaEYntWXfg7RKntkjYinazssVd1il0SGb889pMJtRKtY+dRB7c9brH5x1cD7N/1GIk0KZU516UGizY6dm4QlP4X7xFw3kUCy7p0vN3ShAgr4fR+bxjVVY9POaXbH8bPloFXuUxfNiesACpWbWLkbXc/7GhhiJf8I4/oi1o25kxo/mdl3CJqXS3KcBOdmTIlJKzwtD1rROpSPtUwNzmUADNFqbAMraLyYL/MMQsaWKNUle+2zbggS/ihmrlaH150sjVoXMGRGJhjElhgpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(316002)(66476007)(66556008)(6916009)(66946007)(38100700002)(54906003)(4744005)(5660300002)(4326008)(8936002)(41300700001)(8676002)(186003)(6486002)(478600001)(966005)(26005)(6512007)(6506007)(31696002)(86362001)(36756003)(2616005)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNEZll4M1BMeExOTjkzeTN3UTMvaldublM3WG9BcHA0c2FLUDI2dVZUaVR3?=
 =?utf-8?B?WERxVmF3N0syZGlvL0pLM3NvTW5XYytlekVsT3BPOUlhMUM0T0ZhQkhsMlNT?=
 =?utf-8?B?U3d4RmE4b3dEMnYrWWNKNjNUWHFJWitqUTB4OHc0cWtxMDdWaUMrYmJ1UUlt?=
 =?utf-8?B?UlpmdDg1blIvcElaeTQ0THo5MUQrYkp1V1p5bGxEZ1BQMkxFWkhmVDIzWFFJ?=
 =?utf-8?B?RDQzV2k1eWVjcGJKWi9JdmNLSm9VR1poSlpJQWFpM3A0bGFKcTBGVlJBZVNT?=
 =?utf-8?B?M0hIanczZ1pvN2g3OTV0cEpVejFzbnI2T0tUenppL2hmbjlKSWdhN0xKWU9y?=
 =?utf-8?B?Zjl4UkprM0ZFQTVOb1J4bEJpVWQ0OGwvelJRSlJVRU5PZnBaaGQ2R04xV1Vp?=
 =?utf-8?B?WkJPTjh4ODYzQ3JScXZ2U2p1U3dZOC9tM29Md1JHSkV3MGtpQWV0OFNTYzBL?=
 =?utf-8?B?RDQ2L3I5VldwSCtrMy85WTNEeENVOXVxYUE3b1pFTkJHZTdMMmIvUkd5eUJL?=
 =?utf-8?B?enBwQzF4c2oxT05rVk5sWWVqSHNKWXhPMjhGSFlpelE1eHh5aFBuQWM3UitL?=
 =?utf-8?B?SjlRM3E5Ni8vQzdJUzNOTDV5TDBza3lFME94QWkzSmw5L3pxNnQxTFJ1UnJT?=
 =?utf-8?B?R3BOSTY3c1l2dXBLam15NXpQeWV1RWpPQjh1OTZhKy81UGN1UVJ5dnYvNTFp?=
 =?utf-8?B?UkdGcmszek4yTEhHWlN2M1NqZGQ3YW9lQUJDdnVnS09Bb1g1NUtCQ092dlh1?=
 =?utf-8?B?YkZ2Z00yaGVTamMrNUw4UVVKSmlmTGRveFpuUWVtQXhUL2VUd0dIeTJwRlQy?=
 =?utf-8?B?MWp1M0pLTkFiU2J0RkJUVURURjk5cWxkbDBET3grUmZHSi83MGZyODJ6WmlJ?=
 =?utf-8?B?MHVMeVBUNmlhcWU3SE1ucER4cllZZEF6aFJ3L0o2RWhQVnVMYkVzek1qK055?=
 =?utf-8?B?WGpKaGZ4WW1SdkJtU1ZSTXNPMEduaGNKOTcwSTZxOGx0OUNwdnFhYlpuZHhR?=
 =?utf-8?B?SnpBalloZkdTYmVDSVRZTkZsZGM2dWlCK0JGVVNYUVlCT3didGxYRXRORVZr?=
 =?utf-8?B?cUlVWlA0SXZrMTZPM2d5UXRkbnVXbmh2ZDFYSGJnZ2FRSDFqTUkxbk1nM2Zr?=
 =?utf-8?B?SG1MNERJbW5DRS85bnltL090UjdrdVBFbElVK0NJaHhhTW54Z21USGd1bmwy?=
 =?utf-8?B?WTZLUDZ1Q0JSTmNDRU9zVnA4R3VXMFNGLy9OczBMM1A5WTJsYk1TYVBkdlBi?=
 =?utf-8?B?bmNXYVlZNmhGUWgyNGw3NVUrY09OTnpmNERuZHBKc2xGdFhtZFhQcjRvODl5?=
 =?utf-8?B?bmdCbzFZNWZyaHU5dUxRbXZ3OHdKeXRWS0lUUW9pNkJ4cHNRU3JrQ0FJdlA2?=
 =?utf-8?B?YStPQjJKQWNRZE1pQ1lEZ2JoQjZwVlpXdWY1d2NVaDJWMnJXVnJMWjl2RFRi?=
 =?utf-8?B?TmtVMk1wUjVVd3JSRU5odUtJN3lGaVJlZmdWMEQwVSt4WUoxZGJKa2w1dDhO?=
 =?utf-8?B?dzRvQUFYUFkvWVZlWEVJb09HWFRzcHhCbHFDS1YwNlpRbWN1MGowSmtTSFBL?=
 =?utf-8?B?QlJOVWZyb2dHNENXR0wzbXFVNHRLODlZalk0czlyT090RkdJcjk4MUdEc29P?=
 =?utf-8?B?ZUV5T3lHZEVvT0xKZkUvclJNZ2d3eGpGUmdKcXpKb2l4ZTNTK1NvOGZCZWp1?=
 =?utf-8?B?b2ZMNzNSd0UrcVFaWWFONTE2akdhK1MyZnJuNVc0ZGp6Y2t5blRlR2pnK2NC?=
 =?utf-8?B?UktFRkh0T1hMU1NXeERoT2s5S0Vha1RkbjZWZncrMmMvRXNPa29wQWpWRDBk?=
 =?utf-8?B?Z25IZFlNSzdmZndFRlpNeVZBbUZabVh0SGlJSmxxd3Y4dVI1UVB4aHdUQlNY?=
 =?utf-8?B?M2tPb3ZmQkEzRDdRK0Vac1kvdWkyeTBXZHZ6TU5YeDZ3Uk9EL1BGYk1mLzdh?=
 =?utf-8?B?ZktNOUorZjd6Uk9jb010LzdBSThiUWR2VzRYTGUzbXlTTmw0OUFLS1lMeWcz?=
 =?utf-8?B?Wk05bFk3cUFncEtyWEZhbkE4cWgweGw4Y0NMcmVCM01XbVJYRGg5d1d1dkFY?=
 =?utf-8?B?SUxiSkxsYlc1a3AxL29wTC9pS01Mbk5OVVFXOW1Lc00zWTJnQS9EWlFIQkxL?=
 =?utf-8?Q?HfmlGRW59m45PHVHHOSRQLV+T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb9ff96-8f57-4f25-8b2b-08db310aee85
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:38:42.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4Nktdx7aGlA3sbwYR7cl83G867kyitBl8Tc5MJ8A8hR4fjLdg4UrH/EvxFEE8QN1zy0kx6J+gK1+goszH2uww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7855

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -225,7 +225,7 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.x
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
-SEABIOS_UPSTREAM_REVISION ?= rel-1.16.1
+SEABIOS_UPSTREAM_REVISION ?= rel-1.16.2
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 

