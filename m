Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81127376442
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123958.233940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyK1-0003PB-8W; Fri, 07 May 2021 11:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123958.233940; Fri, 07 May 2021 11:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyK1-0003Lz-3e; Fri, 07 May 2021 11:07:05 +0000
Received: by outflank-mailman (input) for mailman id 123958;
 Fri, 07 May 2021 11:07:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyJz-0003Kd-IM
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6424572-4684-4312-959c-930c5b1c21bf;
 Fri, 07 May 2021 11:07:02 +0000 (UTC)
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
X-Inumbo-ID: f6424572-4684-4312-959c-930c5b1c21bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Elil3Dm30+598w9fi/VGaVFUHkrCfnckvWeQZr64YXI=;
  b=UULqZ6spiIjRziwfhlh+wTrPLkL+VBUIQ98ZvgeTnPQYYWx4Tz2/cbkz
   vNr7ycO9HM5eNNygjq9uXdahrA+GrX1bG9CFDnhPYKzsoy5SFaNsd0FVM
   pssuLOsHU2PEw2vqyLsPA8aZu1jsIinXjdVU+5EaumXxLX1t0/5yEzXw4
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bcF+QtuDdJx+VJ6xD91c+1BdMz65+Hm75orNzZDBrpBs/GjqCy3MF/fSJV8BSL8SxFeMLOWWh/
 fXdINb9JzQMv6yFo+pPXKzqBslav8Vhi0vtk4kDyuSj4d/oujFYnEBXQ8oaDv3BlHlpwUVAdE4
 jMIycqOYsZvRzlsXY8XVjmEtNnnAgMpkyqcYMYu1hUSAj5xmFH3xP7+iPPpl6GvggrSK+d6lOp
 Ikr7ta5AymAqx6RPgIok2WrcQKK9Ic+DNxHyTSWr2fdZwhNvJTHfnqfJtyNirAQ/xLdkJiiH0F
 tzU=
X-SBRS: 5.1
X-MesageID: 43304404
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rdygc6/9Z1MpzR2XNR1uk+Eddb1zdoMgy1knxilNoERuA6ulfr
 OV7ZImPH7P+XMssR4b6LW90cW7L080lqQFpbX5X43SODUO0VHAROsOgeTfKlbbexEWg9Qtt5
 uIBJIOa+EYY2IasS6kizPSLz9q+qj/zEnhv5an857Gd3AsV0go1XYCNu5HencGBzWv1fICZd
 qhz9sCqDy6dXsNaMOnQnEDQujYvtXO0InreBgcGnccmXyzZJyTmc/H+jWjr2Qjugl0sMUfGG
 P+4njEz7Tmt+v+xg7X1mfV4ZgTktPlxtxPDNfJkMQPKjn3zgaufploXLeP+DA5ydvflWoCgZ
 3JuVMtLs5z43TeciW+uh32wRTt1z4o9jvr1UKYiWGLm72OeBsqT85awY5JeBrQ7EQt+Ntm1r
 hQwm6fv51LSRvdgSXm4cTSXR0CrDv8nZJq+dRjxUC2J+MlGfJsRaJ1xjIYLH9AdBiKoLzOZ4
 FVfYrhDNY8SyLUU5ir1lMfjuBEe05DaStubnJyxfB94gIm7EyRlXFov/D3tk1wiq7UnPF/lq
 X524pT5c1zps1/V9M+ONs8
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43304404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjzPXbhvnFEbXX7cCcIyoBTT0QLqD49qzP+6v9RGBX61kHFIEwMaJX51BGs3AnIB7pdH2jowxTo5F+rrircmWgvPnd3drnF3pW5tuGIZc65unwuDR4CL443wHSU7xMGkfHwqcUzVcsZsAIO+3WuMpwOd+e+dy2Dpn0l8k2OHuqyO+HpH5d1n+TWaZKoBQgI/ByshAtEsrrn14rWAsYposbjKist2a5p2Sn8KHCHg6qV+mOaYHjLqAdfpeUIhbhD45Kh23/cnJ+PFuBL9b/uNKWpUWUPdxCAQN9InR2g2NiLZ4GtN7M0LFqs2yR4GRzkT/sA0Pra9s6LdcDX9wtBeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdUXkdSYmtbpTEHoBo3BerLgBTlLuL2N/x2tV5e9+AQ=;
 b=S+ARTF047uxONLDRhH+ir5109MsbWv4kMQ1dBVb3+ws7oRjxTQBpT2iU4HXhhqOGNzIzMfJ2v0G1kOemsxTuYlJ3vk2lkVZRkMI37lqYoSF/YTy/GFWrToUJrQTJFV39w5R6rTlfKD1oDqYQ0JGP/ErjjF3FoiZNqWsrP9Kqd/rVvdR4Td1nwAbR7nmhuR1/yhctt1VSQilbq9M5Tki8WYaDy1hS3NZMbzloT+gBBwtXD8I56b6GflfHapl5Ladvi23jGiLnrr+T44giujWCjyIoN62g4MIh4bniMqkrKWyte88AWu/sAvgHQ5V0RWyAbh/hL1YPijbQhuCBPfS3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdUXkdSYmtbpTEHoBo3BerLgBTlLuL2N/x2tV5e9+AQ=;
 b=Zp7tvoYPIdo1qkvtXBIg1YcWqGAxRtlk6URixiw07JRefZvTtscp03sOZvs0ZO60lUO9iKPip12m7Cbhjfx8WLLy9++nnAKCepAKjig4D9fTcy6y5XUi34cu+eTClwNuGp0XpnwgpDgFUn7HNHqok1acBKHUj+uJvl/rF8orWOE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 02/10] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Fri,  7 May 2021 13:04:14 +0200
Message-ID: <20210507110422.24608-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50ed9f27-5c71-4d82-33bf-08d91148392c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4475215F8B684F381FB59ACF8F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1u00ywYucUyhVcGpKT+DCgkXkqg4vi11x2ZKwGMnFA+sVUCRn/oJInvOxR6j2JnmdzdcEoM6K+pdTBUH7gvC1Jf/PahP1WsvKtDX4LgcKoeLQYsC8q/6PgZsgVcLphnDiVAo6rWS8VKJIvhVaV0oqHC/QEEMCR6QrnIxF2vFholApGDt1Lqyi0pw/qo7afZiTGgiZxMpXjM2bYkj42XZmVFpLbhQ7wrZLu+oTXe/rUGfvDrtWMeU9i6x9ywjDcMdun3jGDiC2QCMCscJYeosz3gL37RYAytXgXYieb7z6xVICVRCfUqLhPSiujhVvIhYimqBv/bEzLN/j3DXj2wuRlr6UBd05REnNjAFEK8QRlh8uOKmneLeIBTsS22LoDLKhzq6/zJ9c3voOE/jXX26X9LoqAC5tBiyRPcq2qUwgWyeo5Wd6ezUq49nGT98/rxxuzDzmQSyvjgTTrCCJbnYPJsCnbicdYgmHA/v6F9JipDGSAZho8+1WXDq9db8d77S/oKTEgWYj03TVdoXoiL/zWQrqOLefjMgsb6rlGC/3DLgrPL6yiwfao4GC+bpSfGyILfE47ltlUfpB3nVuXQf19f2X+sYHzPVBUgm93FK4As=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(6666004)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1REOHlZa3ljVkdGNTBXZWZDMTBVK2ZCUFpLRHU0VWJ3Q2dGTGM3aXZkamFG?=
 =?utf-8?B?VXpBZzhVZXRyTStDb3VSekFWbHVYdXV4eUV4aTNQS0tQTXdQYStrRW9GNzR3?=
 =?utf-8?B?Y2Qwa01tams1LzB5RzRTUmZwbEZjQ0NpQWlOaXRqcWt4Smp2S3VBZHdrT3Ew?=
 =?utf-8?B?dWdkSE05eW5qbHlUWTJMUUhqMWtYWE9ORE5tQzB4RndmejFUZlRNLzhKSW1T?=
 =?utf-8?B?d25NbVpXSUw1Sndva01nRWdWdEl1VGZma1R6akJRSy82ZUVBNnZEaGM2ZVZ5?=
 =?utf-8?B?RnFiNXJuNUxJY0hMUmJFY0U2WDdDTXZvVDBGNkdEb3RzOUxMTWk5ZnRIMkJn?=
 =?utf-8?B?VHJtUUJJMUcvUWJkY0FVeENKdDNyWEppcmlWUEtlaFViNjJ5ZnNibDc1TGFE?=
 =?utf-8?B?aUREYnA4c1crclJqbXVoYUN5K3ZvOWsySFRSZENpbHFnTVZNOE9wVFJDK3RJ?=
 =?utf-8?B?U0x5ZDFISVZESmVLQzZFcUNtV2pMTHBhQkwrMDl2VU9LaE9LbEhBTFpibVAw?=
 =?utf-8?B?TWg1NFNwQ2VrTk1ETTFIenB6Q0ZURXJPdFJlQXVFZjZMT29KcE5OaXpkKyt5?=
 =?utf-8?B?NW50ZXhxK1Y0b0RZRDRIY3U3RThGa003M1lBSjNGR21Iaklpd003TEZYT05i?=
 =?utf-8?B?ZXZRckw1SEVGZG1zNmhmdy9nNis1cGVyTTlEMWlva0VRMEZUUWhCOVg4bjR4?=
 =?utf-8?B?aGRFZ2xjWnE5c2ZhNFIrTERIbnhTUTNOaVA5VVV4LytZNDJ4cllNR1U5YnVE?=
 =?utf-8?B?YWNlVnA1UHBDNk9vRjBzNThWVUFEaUhjMDk1b1laSXdYOWFjNG1hOWRDcVBn?=
 =?utf-8?B?cUR0c3NtcjI1ZnE1U3JXZkwrOHVtZEpkZ2hvVk4xNGttZDhIMVBaY0pLUk4y?=
 =?utf-8?B?QllucDhXejNTTDJZMlhKQ3ptbnZ1WFRnK0Z1YlZabC9jb2cvRk8rbS9mMkdS?=
 =?utf-8?B?dkUzMCtsK1ZNZzBGOW5NSUJNUjY5N3U5RWZhV0U3WFR3NS9HU3U1TlhUd2JB?=
 =?utf-8?B?eHFqem5WK1ErSFN0eUNhYkt3VGZBVzZoWjV5aXR0ZlNISk1iUFF4RDhSMnZ4?=
 =?utf-8?B?cU90TmdxaCtRWldIdnAvdzExbzhFVnBROTByNHJLb053U1JGSjVidkdaMXo4?=
 =?utf-8?B?UzJYYk56ZEJkemwweFg0TTluWDMrSldsNzdUZk5VT1pqeU5MbE1scnlVVXBY?=
 =?utf-8?B?VGt3bzJaRGFWREFOOGtCS3JsMVlHUDZUL0lYelZhVUJkUDc1NTdrVVYwMzRM?=
 =?utf-8?B?MFM5NDdYb0o1NGt3aERlS3RrWFRrdGpZQytXUnF5d1g1L05jUSs3K25oNTZS?=
 =?utf-8?B?enBkZUpZL0lGa1oxcjhMdFdSRC9FOWFhVHNNZjZTbkN0NlRHRUppSngrUzVp?=
 =?utf-8?B?d1ErUFhvaW42Mml3bjUxTGFudU8wRlNRTGdpS1d5SlVWb0dNczdoL2JCdDhx?=
 =?utf-8?B?Sjk3WTgrSzhuaUhIOEN0MEZpeGNYb2srSWkwaGhzYzhlNWcvT0dkU3RLcnZt?=
 =?utf-8?B?NFFCSmhodGJZRzdxckJiTmFxRkp0disyZHQ2M01sYnc5WXZtT1UrRkhVampB?=
 =?utf-8?B?SVBZTlRFS29BYjJuRmQwYXh2ek5TZFdpZ290NmxYSmtLcEw4ekNCV2tocm5P?=
 =?utf-8?B?Z3pkbDlBUEtGdFB4VVkzWVlISTM0VXlNaGFldjdjc05kZ2Zad3BueWNIQVlp?=
 =?utf-8?B?K09DRXR0SjlMQUxUcVFtTmhxSmNJL1puTXB0dEpzeU1uKzJpWkZsd3RBYmh5?=
 =?utf-8?Q?ruxwbb3ZKgsjar30JJy6C4Y0LtxTMrY0Bbut76Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ed9f27-5c71-4d82-33bf-08d91148392c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:06:54.6063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYfdFJTREafTERBYaPJkpspV5/KM5VJ5giTlA5p7XwO3gFZ69ni0HbsYXmy2A0FBry9v//loTLAB0bSi80dVIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Note that callers of find_leaf need to be slightly adjusted to use the
new helper parameters.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use x86_cpuid_get_leaf.

Changes since v1:
 - Use find leaf.
---
 tools/include/xenguest.h        |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 03c813a0d78..7001e04e88d 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -744,6 +744,9 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                uint32_t nr);
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 144b5a5aee6..460512d063b 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -860,6 +860,29 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    const struct cpuid_leaf *tmp;
+
+    tmp = x86_cpuid_get_leaf(&policy->cpuid, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->leaf = leaf;
+    out->subleaf = subleaf;
+    out->a = tmp->a;
+    out->b = tmp->b;
+    out->c = tmp->c;
+    out->d = tmp->d;
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.31.1


