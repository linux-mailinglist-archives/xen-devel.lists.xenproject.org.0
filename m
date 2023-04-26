Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EEC6EF4CE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 14:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526691.818576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prej7-0000Em-79; Wed, 26 Apr 2023 12:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526691.818576; Wed, 26 Apr 2023 12:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prej7-0000Ca-3i; Wed, 26 Apr 2023 12:58:29 +0000
Received: by outflank-mailman (input) for mailman id 526691;
 Wed, 26 Apr 2023 12:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prej6-0000C2-1N
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 12:58:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085f2683-e432-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 14:58:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8799.eurprd04.prod.outlook.com (2603:10a6:102:20e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 12:58:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 12:58:24 +0000
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
X-Inumbo-ID: 085f2683-e432-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORN+xLgr0lLUhcJP7FXsrmJQR311RJRO9i510VZO8H3+bnf5AxQVXgAKidEC1J/7EkwHPPvT10NFob/GD9B5jRqLsD6FD+1ZCiqsiSKj9c1zUAeE63wUzVvVVEudtplmegnrZjVlNe5wTMf/a+G36iZRvVUexHpCr83yKyacyV+anlElWewLchewf+vkYud1EIXzRBwDidtOL92iS49AVs6H3YHKvYNDy9FAHnGGfhJVMdwDfFIbdt758xyo/4JFWFmNyu8YtT+CTBcmZg3evBk1Op/PISsCNY59p9aF8tSZLrN3rj0B89sZtXibI5BQ20q1w5O1FYr6Mldtpzus/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCLLEbpWgJusYs/t7RT986NWsS87zkp4TQOhZfhkS8s=;
 b=RCGJHLukDiZdoPnLPsUv0pqlO1pca2RT8tBRMvG3Otzsrm+00D2gvkz6J/P3QME1BaV/HfvxqxSzCMR3CMit9E1IGx8S8xdGdKRGEsUJ87u/+7wVwTWXRisq9rBaoU38mrbRg4nuS/+M/G39z9hhQTjkJxVWpx9ZbblzyJVimr7groFg65eloI32v8PxdSGn76EwMCqd5m4zLE7y17BC7aoRGs0fPuKsyq7I9k/Mb0EhH6hArMyTkYA9kHAx2CoPlPq0qblNEQYwe++TA9sFnai5YSXzzv5+CPqda9ZKADctxcVw6OargIQbZ5wr1xQq7ntNBY2UMoepZKs2uvON9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCLLEbpWgJusYs/t7RT986NWsS87zkp4TQOhZfhkS8s=;
 b=vA0ySRO9nFWScDA3zD5c/7EIEWikOp+dGgZ3CMijzG5fqtRrJT+9nlEVo+OA2F789oQAOg9AfXW1vVCfp3WI6Z4LXzRUiXyM335lNPNhARApml4tfBeo29/e14w8RW4KobmN7YkfrpRMyYgecQmfiRbCzmLcnzl5zqhkqhFi4qHZLu0FmSSHdM2DMQ7jIvrvAYEI/kV45a7B1RIfEjLerIfoVzUqSFhwhloTv8L1EXYoU22V2NHnE5JJ3KV0Uj7pm9/mTtDv/M5+OvJdETyAnfzdDFe3CZvKufjTM0mAAvCFPdaxxxOB01yGI9KcCuN9/y8kRnXnsOpIDfm3YFuZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa9e9ece-df60-e249-7cc2-ad3af50d26bb@suse.com>
Date: Wed, 26 Apr 2023 14:58:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 2/2] VMX/cpu-policy: disable RDTSCP and INVPCID insns as
 needed
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
In-Reply-To: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: ced1774d-3f67-4fa3-6fcc-08db4655ebba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PBxy5op1H1AtA5GPjJHpLsfteFVc0Ms9pOQDVi2utmWAqUk/AKODPo4tUzSFBtoAb+WD4Bc0dAnXXJQU4OiYmY0r0XoUFk4ljYq6IQNtU9p/S88cc6wDTMNJWLtbILbrhz9BYN0d1CfmuJsoc1Hy65nlA5jN+zcdFBKkb2Ci7qxayWnLmeyEt2KdubDaVV/R8mohNMqur4upkXqVqfJ5g0lN0CWedFJNSHPlyTVUg7uzw8dx3AfN+kvqQ3ACjr18r9/d2Aw2uchJkfNXz0wmSk9MCK1YvTu+Xpz+6F/2Y9ehy+MQqu9KbwOrImkF2ws10vIZPoPTT3hQSyJbV9C8ZdeQDNfER39IQaXzmjrtjTv2bhlM74ZWyx2eTBMk/F6yreZ8/oYmnuTjy8yqaZji+G10ccVVvKOft2/cjglpVe7LmbFdtMFv+hsKagEHDKigVl2UMhm6NARsO++tNJtIL0fDvhO+ohvkOKy97rMP9GA+aLDtWw2vu8LIEVCiUZrYqJD1W1LvJVK9jWkCOIJb8NZfhTrO1AQbqLRjOHMCEggDMrs4rJn6bLNK16rjQlNpaWCA7EZOOZZHktvF30OPEz6ORNtPxAZkU2hCySfNxwBivy3zZ9ZDF3kqdYu60MhP36qeh1H7tIf1zlEsyyDisQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(8936002)(38100700002)(2616005)(8676002)(66946007)(66556008)(66476007)(86362001)(31696002)(6916009)(316002)(4326008)(5660300002)(83380400001)(41300700001)(478600001)(6486002)(54906003)(186003)(36756003)(26005)(31686004)(6506007)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEt3VU1tRGp0aDhFcm15STFQSjk3TUE2aDVoNEc1VFdnUGxicklPalJCYmww?=
 =?utf-8?B?UU5hVUFVa1RiQzdPcnJIejRqcmtaN3UrVkZQcU9KZlhSMWsrb3ZHaGV5NjRi?=
 =?utf-8?B?R2tKdmNrZmwvTVFrR1BJcUFTb1FlbFkzOGwzZ2xUQ0hzVll1aUxyRW44MUJL?=
 =?utf-8?B?ZFBRK3JJaXJzaHFDSkVSUjlKL0lhV1dyZmJVWDZDdnQ2dEhqLzdTZzJjdy9y?=
 =?utf-8?B?TlZ2eGJMcXdQSC9hVFZUNTRZV2FaWFBnVWVjbGJHZ2dUNWR4alpMcTdHVkFk?=
 =?utf-8?B?b2ZEbGw1cE93UVVWNmw5RGpSOTU4azdNRFhVdHhJZ3JrL3pnbWRqUUhYeWFa?=
 =?utf-8?B?R01wS3ZpeXFUVUtSSEJ4V2ZUb05ZOUNIS1FJNFdidjJWelp6b1VLUGtxelVk?=
 =?utf-8?B?ZnFqUjFPcFZLU0Nia2VQWm5Oak44YXQxc01OY1JxT2VRNFoxbG41K0tLd2xU?=
 =?utf-8?B?M2JMWkZNblRtT0JJUHFDTGlSdnVja2Z3YnY2R3I4amc4NEk3aHJZbmhsbEw4?=
 =?utf-8?B?WGgwV2xDRGtVaGZNSUNRZk45ZUFDS3Y1YWFZazZOM000cURsb2hkcFZiQTU1?=
 =?utf-8?B?aGhTUE4zdDVOUHM4c0h6cG9hOTM1eEZFSTl4M2FCT2hmeGtmaUpQb0htUC9Q?=
 =?utf-8?B?enVsQ3gwUTk0dFA5bFhLRHNvRGk5UE9iSzVuSzA4TXdsaVdDVTU5TWVSd3Bz?=
 =?utf-8?B?cmlmMWhpNm1XU3VySUhmb2dLQzQ5dVNCQm5wSDRWSzZTZDdOWmRvNXZCd0pH?=
 =?utf-8?B?QkVScEtadlZzQkRjdUtQZjBKdXU0TVVhMDJsMzNWTm5TV2lBa3Jpd0N6emdl?=
 =?utf-8?B?eG1GdmVDVWdGVUFXR3lOYW9rR1JYMFdiVG1VU3RrUnlpRHRCSFpocHlDa0oy?=
 =?utf-8?B?TklJeTVNTzVsRk04Q1dDeTloT3oyanloNDBKbGJML0RmcUxlVG1CRXBhWEl3?=
 =?utf-8?B?ODZhaE5pVWlpUnRzajA4M3pUS3UyNlBQa3R5OGNQemtyaTQ1MEtHSVdQbzJy?=
 =?utf-8?B?eTRiTVhLVVNsRVEyUHgydnJHeU5laXgvRmVQZ1JQTDY5OGFoRWxGZXlrOXV6?=
 =?utf-8?B?UUhsOURWWndweXJXNkJkY1ZNZE1PQzNMVU1KQUxIMkhacktOUkpzQmRIb3Jm?=
 =?utf-8?B?MFZnTXhIMGNPNmZEc2toZklZUGZwWXBTczNLbmxaUnZsRnlGaTF3d0xaWnNY?=
 =?utf-8?B?SWtBS09IS3ZWZ2lnTmh0OE0yWEphNmJSdlVHaGxSMEFsRUhGd0NBTmpzU2w5?=
 =?utf-8?B?Mk5XY2RSU1B2VGNXbHVGendEOWhCNHBWVVMzUUhBVU9KUTVsTGhtcUxDNmpu?=
 =?utf-8?B?c053S1BxWmpyV2orNUZNZk50NEdqYms1d254OEpWU0pjUG5IUWNwS1BiLzA2?=
 =?utf-8?B?bkFHS21yUnNvcjJzRUpoNnJJTjVRMmVmSnlRdjVacWdneDdGUGFaMVZTOVJr?=
 =?utf-8?B?b2tKeUVUb2g0OGN6bGVmUmFJNCtwTVVGNXV0QWlEajNwVC9jdzRuNlhuQjRo?=
 =?utf-8?B?QmhNVlNKSXRQUTJTWEpNNGlUSEdKVzUyaGRNcXdpVTIyK1RZS2s0ZUpJOGpx?=
 =?utf-8?B?Wng3WVZxSVpGR3ZpWXVic0NMOW0vZGxkQ00rYkFFaDdHejZQZ3BUUjU5VUZ6?=
 =?utf-8?B?MklxRjUrV2JjU2tlUmxUQ2RHaTRub0lGeTZSOS9mZ0ZXSmlTd2owcE5EditZ?=
 =?utf-8?B?UVRFdHRVQ3RxRnNZR1p0U0pZa1IrOGpqcmtobmg5ODFWRkMzdjRRY1lRUEtC?=
 =?utf-8?B?OHhtbEhIbXFsWE10d3Q1NmxMUWFyZ01hM2orcm5TS2tRNXdOazVITktCSU55?=
 =?utf-8?B?eWlGR0RPU2tYZWFITEhUR1ZQdzJsbG10eTJiWFNqQ2h0RkhBR3VhcEVaa1hG?=
 =?utf-8?B?cmczUzlhaXMyM3V2TTNRb1JrZUtYY3dlQmZ5a0JRSm9seG5XcU44SnVXV0lo?=
 =?utf-8?B?cE1SK2JTMjFLZDA4NUFpaS9VM2NWdmhvTHlsSWNoTGJqV3k0Y2JtSjA5K0tW?=
 =?utf-8?B?YittazRSR3dwcThLbHRyZDI4QmtVaUtDNEhpWTNPaTlMN016bTFNZFE1aWla?=
 =?utf-8?B?aVhOcUM1L2piM2IrQ0FZQXJsM3AyWjQwYzVGYmlsRFRicWgwa1RCWTcybzBH?=
 =?utf-8?Q?UhMrgxpZ+79wgguURX8DwN7Gc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced1774d-3f67-4fa3-6fcc-08db4655ebba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 12:58:24.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1ZZ10yQjFzMJrIpOLDTc7m0qbiqcAX0l17FMwG5uLPuYVAUczzayjblNM+Tn9c6E2ofvVtGtmv/IM+PxcWXhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8799

When either feature is available in hardware, but disabled for a guest,
the respective insn would better cause #UD if attempted to be used.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -785,6 +785,30 @@ static void cf_check vmx_cpuid_policy_ch
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
 
+    if ( cp->extd.rdtscp )
+    {
+        v->arch.hvm.vmx.secondary_exec_control |= SECONDARY_EXEC_ENABLE_RDTSCP;
+        vmx_update_secondary_exec_control(v);
+    }
+    else if ( v->arch.hvm.vmx.secondary_exec_control &
+              SECONDARY_EXEC_ENABLE_RDTSCP )
+    {
+        v->arch.hvm.vmx.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_RDTSCP;
+        vmx_update_secondary_exec_control(v);
+    }
+
+    if ( cp->feat.invpcid )
+    {
+        v->arch.hvm.vmx.secondary_exec_control |= SECONDARY_EXEC_ENABLE_INVPCID;
+        vmx_update_secondary_exec_control(v);
+    }
+    else if ( v->arch.hvm.vmx.secondary_exec_control &
+              SECONDARY_EXEC_ENABLE_INVPCID )
+    {
+        v->arch.hvm.vmx.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_INVPCID;
+        vmx_update_secondary_exec_control(v);
+    }
+
     /*
      * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
      * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.


