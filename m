Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D687C376444
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123963.233964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKB-0004NO-3g; Fri, 07 May 2021 11:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123963.233964; Fri, 07 May 2021 11:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKA-0004Id-VK; Fri, 07 May 2021 11:07:14 +0000
Received: by outflank-mailman (input) for mailman id 123963;
 Fri, 07 May 2021 11:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyK9-0004Ft-9F
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d44f0357-35f2-497e-9f5d-e0d4b2da5183;
 Fri, 07 May 2021 11:07:12 +0000 (UTC)
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
X-Inumbo-ID: d44f0357-35f2-497e-9f5d-e0d4b2da5183
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gLlCE9etf3gr9KUeqpSgZ+qsCzt5Isc3p8Bma0wZMcA=;
  b=V31Xg3E7EXRueT539etYQesTh0S6n2vxkEi6ID7/nn/YiG3NmNvtQtHq
   Fq/jWEt7jtQbX/lPWh8jxHLvBsjxHdeA9F9wr8q6xL+pu+gscGXRqYGCH
   FkEiDh4A6C4cghVYNuf39l0+iEqf1qbUeJE0aspu0V5S6Qrarqqbe2Nfz
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0XEVxeCkgPP3MJ8zvkOM9bW3fa7tRXOPah6AlJsP6IJK/7PSvjmNkIANF+uJHcu9GdVauWf2/R
 2uX+pmAc4MJneBqeE7IH8o6XMAI4xRSCOQbB0b6bDopLeWSm4i9UFIJKmU4Wqm+81oyV4s3KgH
 n2etB9Y6HwLrxv5xowRZPmKu7sSViByCYndlIsegkhTAi5oJu/+nZHaEP2QJR9DuHEbynlALPL
 yhsCZD5CzjKtaqTQoimhgAw4hgSpuO1gDVNgf3m8GzELCUuJAOtSMjRv6pG3j9UDxrFfpbSKpl
 NtA=
X-SBRS: 5.1
X-MesageID: 43096222
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gXwzZ6zyPKc9zSPfDdMmKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43096222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtBUQR/5Vfr9FzBxfvpAet6RymtnqRWfcpqg4BtAiwED9JhDre5rvgf+jBR8qsu3KMdHccTgmxod7yMLwRllWXM/dXMmrzTSzDbWrPUTwEkyHRkEPwNl8yHS3WlGtea34p/kXzbk9KsqNsYNKR2ggItS00HNgCT1t2ADYonFf4qRt89nnxQIOuAqftwSlTFTtT6PdhML6XVgFytOHq5atn/TjcXtHyaEu0OiLQHYHDv5A+X8Rrb4FxCfwkm+soJ858clzQa8K9Jn+zjAhQcSChXqDi9EdKNo1t5Qy571E7u4AeKDmGPsvEYVQKr9w1HfO3B+lqeVvueQOavd9bWw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFiEJE/7tweLfCqiWGwMSdcuoNYoTfrGmGb2P+8nYGc=;
 b=lhP3T70AXPGiR/NGd+UtLjlkgEAHJfirCuYZGnMLdbRfRWrDvUjT3poFh/w2WCCkqA4L0x1A2W3b06v7uCG4Q+DrIExAJu2WV9/0foygMMFoaC6Rhhi9IBgNW4QrAeC6Zw81h8IzPWwdK6BfcNcfxfwcRVjxVO//dDN4M1Y6+rHHImVfT6W0yH+YwV+oYr+ilcUL4EQIfjm04iYNHa2N4j0HSRtVrlBMKd896Nli49b7kwfVAUQ6VfRRVbQCpu5gGrokLBj3ZZZb+/CutfLc7zNTM6BtPvd+jfbE6cBAnTTSQ/lftJsAMzT5AXiJ0lmjtd4v1thutKLAfkXZpaUluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFiEJE/7tweLfCqiWGwMSdcuoNYoTfrGmGb2P+8nYGc=;
 b=Hnz1VIO9BchCJEoq8j5sJ+hRvrx32LDiNL/JfzFk7naRAXN6s+FMT0zLhOHMtORX29J8enBPYqDGfG1hv0gyVthFThIr/z3T5Kh3VVVHvtHASpEVVRXQQSdP63bpgumBQV1n1dJjh60eU/CQQAlLsIeIF7IHESiCUEQn0tTEp5g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 04/10] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Fri,  7 May 2021 13:04:16 +0200
Message-ID: <20210507110422.24608-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5beccb37-55fd-4398-1d13-08d911484079
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44758B09089D36328509588F8F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJCs3J1vTBEQoX5ebu6k19yYh4Ob6MZgsWaVZPjPR2zUt6SNMJAwSppNgFotJ/lxrTj/QMxY5EXf01v4O9ZOlSUvSTAT0WVyVhj5Pwgr31+C/QeEueCUgTvYty/5p1bkWzyPXSJvzoqfq0zRL9xQxf+gx48TawzZWRAJf2+4MnOji+L+f1Tt8JVnjnD2jj3nofUx8VnwmVY0ZckJJ+Rdvx6r2Q/JJU9nyWwUbC8tT5WaQ8KryNYGYjf5Vlwiz7wzVpmD3I5wTiPKIr/pwv15d36uqBMPqtc9HvSvkKbQ9RE2FV+6slg6pGKImf9BRUvz/IG+L/pneHr6srw5G3teKAUfUXM4KNUh+8tKe4BDqM0akTg4lACsSWyL5JccEzzRZpFI6hjiWO8yuycuc4WuWLotvhfP5IKXgX2hILK2OkyDCG8i2jbV58LWuLHQeSuoo1v92cQRcnKavP3ICIrd5WxrVk6GM9ZyKdGf/afogaDiGRZKPe/21X6KZ0P5KQ2GUtd+V3V0l44dKFgD4edzp+btlJ37qSozVIS3Jbp3alnaaItDEKDMSCk3sHKXuGLplmaeOpZi3uG77TJz4b+WREmDhfLGLOLx3cXMi+zIXRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(6666004)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUZYNW9JcjJ2Ny9Lem1pM3BOazQ2VHZoeTYxdnhvTFVmTWhMaGVMNEo5aDVq?=
 =?utf-8?B?dlJHS20zcFVSSDRROVpKWmxnYWpZM1FUSGNQUnh1VHFLL056WU04bmJKbndO?=
 =?utf-8?B?RXdpNk9FZEhuY3VITHd4aUZwMzBZYlZJQWFGbXJ5M2UvUHZjMWhJdGNnM3NV?=
 =?utf-8?B?bUNSYlhmTXB6Z2d3WVY1c0NpQXFVOEhGeGZEMHdySmFYQTFEa3B2TDBGMTJ5?=
 =?utf-8?B?WDBvcE14cGZ6aFpkejBIazVCS0d6eUU1clRWM0V5M0pWMFdXcmZGd3hSd1RQ?=
 =?utf-8?B?eFluVUFOa1F3MHFWMUJvZEliSjNiRWpTK0c2dGVOb2lQTS9ad2h4NWxCdGNI?=
 =?utf-8?B?WUp2aWpUUHlEL1BLaS9CeU9DOXNZdGxZRDl4VHRMZEthWEpWVEQ2RHZNVkhv?=
 =?utf-8?B?NXJ4bWVKdWlsY3R4RG11a0V6YU8wQzVoM0dBNjZtUERVMUdlb2lDL3FrNGJW?=
 =?utf-8?B?TFpmQ0Q5aW5zd3FiOEZaZmxwT040MnBnTEVzV0Zpak43VmlHOTJnVVZId2t4?=
 =?utf-8?B?NDdMQ3NYOWs3eDU3Z2pnU0I2WThlVWxyWHBJS3paV2RKNytTSno5S3pnbHhz?=
 =?utf-8?B?MHd0TmdHekYzc0lPeFA1UWJiK1pQcitoUy9yYzNLVHF5WEN1UTEyeUwzNC9F?=
 =?utf-8?B?enFZQmlQRHJ6TTEvV01YcTRMc0svWEo5K2tiZHNtdUl1ejc0alNzZkNFR2Zt?=
 =?utf-8?B?NVVBTzRGV3VjdVh6V2JSdjdtQU1ISjRjdkRZYW55YkR5RFZEUTQ3c0lpN0J1?=
 =?utf-8?B?L1pxbUpBWTVNNDB6WVRPYlBIVnZpTW1lOTBYWXFzcCtoWW5hUU5McVVqdktV?=
 =?utf-8?B?K1MzaE0wQXJuQmZjaHhFbi9IcnBXMXI5aEhsd1pxbkVFaDRvTkUzNE5oMDRi?=
 =?utf-8?B?VlJMai8wR3V3aS96Y0ZWdUd0aDM2MVJuVExMZndrZjFyZTA4SzJwUnR6MXpE?=
 =?utf-8?B?WFV0UGlGeCtrUXpmVlFoOUVtYVRNQ0xjL3YzcTM5bzA2L1B2dnRGWVUxb0Qy?=
 =?utf-8?B?ck9qNE5oeG9QM0lzSmlvdG8yR2NHQWtYYTRnbnJ6VENub1RQeFZLMXIwaUdn?=
 =?utf-8?B?TnZ6MUJ4TmNxSEFkSGFYcngrSzllc3dnYUNXancrK2pPRlQ1RFMwWGlHZURO?=
 =?utf-8?B?Z0lPMGY5dWo0NTNBMm80YWtuMjdYd0N2eVdJMUhWRldxNS9HZy9HWnZSbzcx?=
 =?utf-8?B?OXN2WTAvZFE1cjZKNmpWN2R4bk9HRzlDS1czeTFISHFUL2pKOGJsTzZubnRu?=
 =?utf-8?B?a2ZLTmhSZVZYUTVhRXY5M042TnRlbXpUZU5jamhvbTJVei9sOHpEZ2hyRExo?=
 =?utf-8?B?T0NYeVVTcjFDSndHMnZmOGlkd3luK3ljN2hLNVBzbXVxUFRYM09nZDVMdEh3?=
 =?utf-8?B?ZlI3VkhUd2NCT1ZDYTlOQ0FQKzhtZEwwV3YxRTBkSEx3TUJXQjF4VnppOE01?=
 =?utf-8?B?Rm5hSjBvVXdGSkR0R09QZXZudmxQRmJTUDJlcGp5cHdyNC9FK2dTZUZMaUE4?=
 =?utf-8?B?elNGMzh1ODI5cWZEeHFoNTh3a3ZZK3AydGlKSmVwMVd1WW9hdG50aE9QWWlF?=
 =?utf-8?B?ZTczQzlmZ3pTUEhZTW5BOUJ3RS9YT2hyQmwyWVRoYTRjVVJlNjhRclpYWUt5?=
 =?utf-8?B?ZGgwSkpiZjRuUEtaTFJzbVl2NkhRRHZXNkRCbWwwOFNMaW5TWUIwczdYYS9L?=
 =?utf-8?B?cVh2cW44TW1Qb21zZnI4NjVwWGt2NE1oRkdwaEdQdTBSM2JwUm5JeXZ4NFZU?=
 =?utf-8?Q?Po7iq3iexQIQWgckxacQNvtiQo7nraFn0UEbD8u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beccb37-55fd-4398-1d13-08d911484079
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:06.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7nbra2GcX7zG0CQF8deHXrdv9YigLlAXYqIGkqIFsFrsf2CuelA/FRg8Qf3KXEv7sL7VfCKqaVZwClQP75c/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use x86_msr_get_entry.

Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenguest.h        |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 7001e04e88d..8e8461b0660 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -747,6 +747,8 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 460512d063b..cdfc79a86e7 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -883,6 +883,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
     return 0;
 }
 
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    const uint64_t *val;
+
+    *out = (xen_msr_entry_t){};
+
+    val = x86_msr_get_entry(&policy->msr, msr);
+    if ( !val )
+    {
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->idx = msr;
+    out->val = *val;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.31.1


