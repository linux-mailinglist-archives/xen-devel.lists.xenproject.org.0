Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F515F9CBF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 12:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419197.663957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohpyR-0001cC-Ib; Mon, 10 Oct 2022 10:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419197.663957; Mon, 10 Oct 2022 10:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohpyR-0001ZJ-F8; Mon, 10 Oct 2022 10:25:27 +0000
Received: by outflank-mailman (input) for mailman id 419197;
 Mon, 10 Oct 2022 10:25:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ohpyP-0001ZD-9t
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 10:25:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9d84227-4885-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 12:25:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 10:25:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Mon, 10 Oct 2022
 10:25:22 +0000
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
X-Inumbo-ID: d9d84227-4885-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0s28RPbKYG+g6zLXgAVnCktb1B2BckzMk1+bJbVKy1sL0Ypvrbin+Ud4OYEJsrFtdkkJJ1UG1bhrjkWo7aunV+fiWOeDJmWoUAmSaB107UV165ql97x+Dhllq8fUqFQGAR94s/rdrDO4+1M2j3sk3DC0dyb/sZ3Vj4XNpcpXC0ySpN3gBL6cshBd1qgOrx2HKCh7c51F1d4cLEEmqhoaBa8/XXkzBAputT2L0/UJepYhfyaEgIEtpmMm29KQfmhnC0DqpkwO+L0T4RdmeP0/KOEwVf7ai+GqA4cRnZZhNz70gcS9GlBRNWEeFYjEuyPXMTlj5CuwkCwEJAPAqo9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoHimJzIzLxQ1QhsWTQCOEJZBtY6WWGzTNfOK95Ww9A=;
 b=Zyzb0pZYKVgEUtFRqEwC68n/Tn1e6yZ/lhYEm7TQzP6ey7/jJrd/D/k7j+OULxPUiZMwMGP3l1T1QRC3IYz+7nZVi2v9LUS/EgeY93sLjE2AF10s2NVB0p0dNVGoKUquDgHsAbH6pjpgnIiFgkbyPcFWTjmcQm5AAYu9EnP5nOyjNGu+wYyRbpCKO0Z/JWABu3Yu1YAuWjb+UUcSpqXkNBi3/GOVdvPUY9baYhD43Xt4Afye00J/V7k8M6ZsDrUMblPfg/xCKdoBriv15Ld09J9/lEN7e9AlSeVRZjXwN+qQkI4aD+BOo+iyKTbFTP5cFnfYE+4PueK2tnxH2FSe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoHimJzIzLxQ1QhsWTQCOEJZBtY6WWGzTNfOK95Ww9A=;
 b=e8hC42UF8KnlUoTlQ3yh82qjRAMiFCnJMsUY36wxm43f/Q569OGU18oMqEGf+36QF89cWOIV/Ss3LZemvJX05NZb7yTk65jGIFALCtZ5ArcLOY5Gm4HK3Kb+tkGRDJ/jt0gUxzjuXI6eMDsV29ohg933/Cqh+CLMpP9ZGLAHGYKchPqcJxA0yN1sJZwrhnqXMqMRmblsfCeZWRZY93JY4ieyrN9ygbNXVToEjHrZC54kfHhTSr7TntbtdEz99M/w11ZTs7KQXaddjSW4tEaBNkHvUlsYhJIWNNqQmH2vBFx99IvVkPtGCfi+Gzf/WDUxmFkajCmCQdP1b8iDhBmT2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c1cc983-6c16-4efc-9686-1e7a79c3122f@suse.com>
Date: Mon, 10 Oct 2022 12:25:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17?] VMX: correct error handling in vmx_create_vmcs()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: fb50c21e-5071-437c-c585-08daaaa9bcad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jpCzpZ/c1NEcVHUd6dk/DfZlb+mb1zDUWfw4jS+DvqcmNWCecJt5205nBXOgzPsFLdMlk/DUYWKtE55KBV52j+U54MsiNuBgjxqHyGAW8hPItqRkUSNhEIDWHHF2OzQp8hsKrTUqaM8xvODl+P6JoNK5n6LjVNmsyBXqKeE30EP7wRBFO90kbps69viSTFnz6J0psIR26jcsgaG23kMLc//02/zZNlnluj2e/zfB+X0NVVLZKM7x781K7movXZ6zq+urS2bBBxbsgUbR20Z7jpG3oah3aNsQbps7m3CTe5eZ4OA7i2GxI6AaTFHNfwFtf6wEl7dl09dDj4mZ2mC4z52c29f/QDHDdsLN+6KrfP44WJ0hSUZTyl/yfyr88LhhZsZzKMpUjII3qnizbFNeGFyEH24VNYFUKiWPYlLbOJa9jkqUysfRBIvUbLdIjoQD8b6KuwHU6cndehAzQv82Yk08uaW6e4Dtn71lwOBakjhDaFQo/ACZE6Lg2fr9dLESRX4jEdFX+YsBX9yzXzho/8/023YXfflvtbNPdWSzL68YOpqPCKcXC8VRXElniBT/DlD9XgjrvhAqyEZOvOGhvUeZiyf/9c1N+yjfJvXfvtOvyM0t8R2BCTDx+SjuzDRXz62llofOeYHjuRj+rum/8S9gnLtEhKKU812W4ecOh0bgnIw68EbL4BOg77R836ecuqedGOpXAuZPNSIzGHuOV3m0Wsg/Ygq1S+ePeueLJ1onr6QqrQrbJ+ZOZ0zm1s2cGc6K7kVViB7H+YjAOfvc0hVk8Dyq/4OyvRM2ZZ/YNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39850400004)(376002)(346002)(366004)(451199015)(26005)(6512007)(478600001)(186003)(6506007)(6486002)(2616005)(83380400001)(4744005)(2906002)(316002)(54906003)(6916009)(5660300002)(41300700001)(4326008)(66946007)(66476007)(66556008)(8936002)(8676002)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHFMd0wzT052S2NmSXhFWHlPQ0hzSzZ0WVk4OU8rUjkvN05vbU1rWXROWFNa?=
 =?utf-8?B?Qjlkak9iaHg4aHQ0SnY4a0tUdHdrRGQrV1h6L1BMNkI3RHhaQXp2TkxHZFFu?=
 =?utf-8?B?V0h3Tm03bnVPRHVnV25kb1hUamtENWZtcjgxZVRTT1k1OUtMdG5lRUR6bkVt?=
 =?utf-8?B?T3NGU0hwdUgveTdVcGF4YTNielhONlUwYUZzclNka1ZCYVg2UW1HRUN1UktW?=
 =?utf-8?B?cFY4SlE0ZC8yTzQzd3oyc2ZpTGpEaE11VytaaXhBZzZwdktuOWVmM3I4UDM3?=
 =?utf-8?B?TzNMZWtmSjZNNk5Qd3I1VEFMaTQ0OXdIN1VOcDNLNU0rcURyWitmUTZMbzhs?=
 =?utf-8?B?Y01oWHQzVVhPVzFKM1hHeWhHMU5BbU1QU3FpZjlNZktkYTNnaHZXQUdHTWc0?=
 =?utf-8?B?OEJ3RHZUZStxeGovTXpVMXJYaUlIdHhMNGhNWjJBNmZpVE1PY25zT0E2cUhP?=
 =?utf-8?B?RU56KyswZ2NUSTcrSW54bUhLWG4zMFJKd01CVnNqTkN4NzFoZkxTSndVaEo0?=
 =?utf-8?B?SElxbExVTFh2YkdJYVprdThvenA1VmJnQVp6RXR5TVp1TmFGa05xdVVnYlB4?=
 =?utf-8?B?TzhydTh2UFdCd0dtUzM1QVdZUllJUDFlQVkwUmczQ0p4UFpmekxzaUl0Zy9Q?=
 =?utf-8?B?aFVGeFl3WjQ0YTA5dGRzdWt2Q1pUZzdHNkZ1N3Z4NERBOEJWMG04aU5EM3or?=
 =?utf-8?B?Y05wWFVFaDl0dmx3Qit1RUNuR1ZSZHMybUFhMTlPV0NjeVJhWnBKcmFOWFJv?=
 =?utf-8?B?SmY1Z1dzTjA5ZElzcnVnZ0RZV0NERDNoTmNJSlM2R1lBYWlTTG4ycjdDM3Ez?=
 =?utf-8?B?Q0Z5TkgxN1BGa3ZRZ2xVMnQzaFNua2tHSUtjd0dranZwd2FXY1lMZU5ROXVF?=
 =?utf-8?B?ZXBlTzUrQjdRakpIamJzaXVvVTBhdW1XcjNiQzZFaktwNmpCMHg3M0cxNzRY?=
 =?utf-8?B?Z25jaGpHOHBYcVA2VlhMTVZFSjdLMzE1WFVQclNxZkN5SXVRSmQ1VUJteG9n?=
 =?utf-8?B?clhqQ1NBdVVrQk84UXVJTzRpOUdTTlJGWTFDaEJVS3E3TDZ4alpuem9IYlJw?=
 =?utf-8?B?c1VaM3N3Zkk4K1M2K05VZlRmWXI4VDZOdk9KSFZvdGZjQTlNYWpkVWxYRmt2?=
 =?utf-8?B?Z3ZHQ091Q3BvMndmZjJ1VHhYSG93c2xxdXpyYzg3MVFHakU5Z2daUVZoaWM2?=
 =?utf-8?B?QUhVZktybU5wd1YvejZLY09KeWQ1blB2MDU0M2lWYnQwTURwUEp6QWx5V0JE?=
 =?utf-8?B?NXNJTFhsRU1LTjJnVGwrdjFUVk9HM2RMWGpKTng3N1JWN25IOEZDblIwQ3hN?=
 =?utf-8?B?YWFUdUhRVFlIeFh4aW1sWVJNZzlzdmtTWHcwYXhBT3RHR0xmSnlXQ011RnY3?=
 =?utf-8?B?VGFkelJ3YmN6NjVBdk5tNmdLbU1SMWxYUzlxSGFPVXRXaDZBZTV4ZlRWbDc3?=
 =?utf-8?B?enJBbENwL21tSXNtREF2T1lSU3ExeWNsN0Zyd2tHdUtEdy8xVzhCdm5QTnFT?=
 =?utf-8?B?ZWdLY2pZNmtTYXJ6djZLaG9oWFcvdTU2YVRkNXVWNXVybjVEakVab1pPcjB1?=
 =?utf-8?B?UUQ2Uk5MZlZ5d1RMRXNoWUt0OXE1U08vbk1uN2RQREpNcGZ2aG1CT0VMSEQv?=
 =?utf-8?B?Z04xSXRRSUxHbEpqV0VmSG1zMnVuSG5iakhQcEcxQjBBbUErKzNTNTJwNDN3?=
 =?utf-8?B?dE5vUk5DQ2hBWjJiVWpNKzBmQUJwTmF2LytZdEZJdzk1K0xEWG1XalRadTNO?=
 =?utf-8?B?ZnNMamJHNjU5SEx4cTNhRU5WbUtkZysvRmY0bS9DRGNFaml5eHR3bVNFZWFV?=
 =?utf-8?B?QVVzN2V4NVcyRDR5WWVSL0ltTktpTGQvLzVpM2pJN2ZnaUhSZnF6eWIzR2g0?=
 =?utf-8?B?NDJxQ1Y2U1dkY0pBdUxzMCtuYXZ1YnBkeitHYlp4UnJ4dFU3NEZBaGliWVps?=
 =?utf-8?B?VndtN1RoRHRwVmNibElHY1lmYU9pb0Q5WjMrc0s5eTdDYlp6VVBkUCtZUzJN?=
 =?utf-8?B?aU9HL29mWnZ1KzBaRlpJRkNVMUVreTFTRWlCc0RwNDVlQlJLZlVlOTNEWnMr?=
 =?utf-8?B?Z2RRLzJTdndidjlkRDJJYlNCUEIrZVVjTTIrYkNRWXNra2x0Vk5ZOHJQaHBJ?=
 =?utf-8?Q?LoNmNvPsX9VeOYGjw/G2yWAxe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb50c21e-5071-437c-c585-08daaaa9bcad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:25:21.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tcwaYprkJA1shnNEN0LiM76NAqe0y7IP6r1HMbRXMw+oxoUS9K8TC9rG02RIzXaH4D5L2lT4nA6Ksc3mA0Klw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

With the addition of vmx_add_msr() calls to construct_vmcs() there are
now cases where simply freeing the VMCS isn't enough: The MSR bitmap
page as well as one of the MSR area ones (if it's the 2nd vmx_add_msr()
which fails) may also need freeing. Switch to using vmx_destroy_vmcs()
instead.

Fixes: 3bd36952dab6 ("x86/spec-ctrl: Introduce an option to control L1D_FLUSH for HVM HAP guests")
Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With both referenced commits having been for XSAs, we may want to
consider backporting this also to security-only stable trees. Otoh it's
"just" an error path ...

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1821,7 +1821,7 @@ int vmx_create_vmcs(struct vcpu *v)
 
     if ( (rc = construct_vmcs(v)) != 0 )
     {
-        vmx_free_vmcs(vmx->vmcs_pa);
+        vmx_destroy_vmcs(v);
         return rc;
     }
 

