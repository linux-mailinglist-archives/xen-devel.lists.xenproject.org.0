Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E64345B87
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100561.191689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpu-0007sp-1G; Tue, 23 Mar 2021 10:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100561.191689; Tue, 23 Mar 2021 10:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpt-0007sM-Tw; Tue, 23 Mar 2021 10:00:29 +0000
Received: by outflank-mailman (input) for mailman id 100561;
 Tue, 23 Mar 2021 10:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdps-0007re-Gl
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6745d016-9091-4c94-b3d1-66cb4e09a1ff;
 Tue, 23 Mar 2021 10:00:27 +0000 (UTC)
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
X-Inumbo-ID: 6745d016-9091-4c94-b3d1-66cb4e09a1ff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wE73k71VkuOoBtJxmEIA4ELSt2NnSaaWq1/7synJqCI=;
  b=IHHDMoOogwJzBD91G1NySrTYVphVRFFxb0dPpghypB8tZe/yoN0zfyCk
   TijySJjSWwwsGQCB57C1gwAW29UMsP+nsoSrK6nLr1R5KEHFHHNCgsW8j
   AFYwyBTX6fFDFzKlllIoalXkSPHB/wZcwliI647em4GrOkQzHXA+JZv9x
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5zM7xB52ycpn/+BdvG7uKilxZJv/2rULgdVN5jfhFnfZV4pGZMOOzVWOuWvkqu/guyt1+SDkfG
 9nIeVRp26t8kPTHHtQosCcsKzSOl5IRjMRivDZKe3NZHTvlrogLu6AQboAZ67EkxVtp988VlEy
 jaEMgZOQr95dR2wfjy2U9dUUjEmyurVZYEDjIrQ6dJev6SrGii9A/iKWjJgrkK+cxcvnjQbXCK
 LLoyZxHM3HfsPtZIqj6s6mlwxbWkTY1hf09pzXPB/G6XTfo4Emw+hBr8EXrWvsYDJAPNmeIQz3
 En0=
X-SBRS: 5.2
X-MesageID: 39882229
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6zQUxqiQHw/8sDbCbn5JdLCaIXBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39882229"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcQrS0vFC0W4ZAmvHdzZzXIOVteHOXlVoZOl+SvqxKPIZIzkDV+/sZWAFvMCF27mCFUDiuyz2qU8iZvoZ7ER3lcMaAq+McEW98AzxjNeIjyDTcPmhVXD+Ox4oWhNEQcCvt260yMPAbG9UJcDmS03E19v3bMpE1JeNFCjxsv2Yv2aUFdhmU+RV1cth99MQ+NxZFW2ICEBQQc+cMJuvZAXtyzJGzLJyP7UDIJwl3milkk+qrAfV4DS/uie1uQPkelq2ARbBa8d9xRjbATR1X/NqB71oDwJAvFhSfcG2WuwlbKMtMZNbljVhajtc+1AkuBPgK6/O2ZuJM1ijVeZTVTwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t+NT91cGmv6RL2vL9wP6BGEOhhn8NymEq9ul10dNCI=;
 b=P10VeUCDlGPFnepMfre1po7EieR04WFVt4gLeh8X6aHnVwt6D8VFOZrGG3y5hZn+54HJfT7gSUMlb9pSyLbkjett+eM3Je+ZeIW89H/issEbXkTcEbJ21myhXewkRr74CEHYhEOcXX1gQkksagevcQFfY9czzqvbV1Ir2EdRVApVXs8MOCvy3qqAf6R0eyGWpAgohb9PnNBUt1tMby6TO4qQWOR5Zl0IG+kp9nuWOnbTG5OZ2GG15zucdrngYfSnNQOENImoTpDkQZrKR3bHcEk8b4D8FDKnUYrHsTFUuwyDGunpeS0rAfWtdwIbKm1OvtI3b6SrTeQ3Bh/C05BohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t+NT91cGmv6RL2vL9wP6BGEOhhn8NymEq9ul10dNCI=;
 b=xA3sfsLfXdVNp+SE896a72G8BTfH8mZ50Ce+0cwn2pIr1BBnnkMOxQiCfABvy/rnk3u8mAxIMlfZ6qzozqVKsvBnLOEad++88kJccjy1OOa94fimSfHgGnQSAyaQ+1gttOm6vvia2AtIl9ZhZCAdmsyOPOYv5n3yeO7va654+Yo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 08/21] libs/guest: introduce a helper to apply a cpu policy to a domain
Date: Tue, 23 Mar 2021 10:58:36 +0100
Message-ID: <20210323095849.37858-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb982bf-8782-49a5-982a-08d8ede27a20
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4969E40A9CD99401CA8978F48F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eII0boAvoI9hURjapK8ngY7ozlzy15cv9UIhroSmvCnJziaEZs3YIByCeDX/9GbUpAf2X1665EDO1+fUUMLqQ6o77LlvrntXFPKjNTQmYWQCTxhm6mRvZ0IMmrZbqE7AjM7Nx7pLoZZ0QUtu1XFBLOaLEkrJtaZpDc8YYs0hlwB9kwIsbymvGAUPItmPhnXl95zySCXwLfw7f91tLqrUTm0gGZWUtZMAjwe5vMU3DElYznUuX7CFhNjRr1C25KZ1fOdtOYJz+ZiceEHGRoOQNqFV7AfAjsv9jxlnlos1jnzZFO8z12vVjhDJK1f3zSpuo+KxKYCekafQYsCGojzDX4UKPTHThbvFfk3617gqFsSl3O9WtEVi+gWIP9tMdjZz9rVCW2NtCfmJvy5QpRM57RIvL2lcU7ve14OoVXj4+KsxbYeupSdcz8grW/9LJKxD/okqY5YuVacpgr48rN/hTcyunj+2r5O5ayp9wbfavH87LXErfnke7acqW7oiEEZuf5tk3V/9qZtZauK0svYEbLXoAIDUhUiDgdN65qRbH7jpBi3rOGUBTWwbA9il/YIhG6Yi+vOQnDbCZFdg0+iolHa2YfKuLcoWsDtmpYMptLUJ1BPb6IGi7NVg+YCWCM3DIxmrnpb76dUOY32NkebNhXC0y3qqA//H7qN/g9CElw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qk5PeU9FWG91UGlZN1MxQkQyVkdtOG50Rk4zY3VLVm1kSkZwT1ZKVFIzR010?=
 =?utf-8?B?N2psY3VLN1FnemNCM3NuNEFya2lWY2tYOW50LzV3QmFTUXRTMkhhT1Z2OWZp?=
 =?utf-8?B?d0ZFMVQxRFM0YTA1WjFmTmFIcERTaTBlS2p3c3M4ejdZUHErVkRxWHkxOEc4?=
 =?utf-8?B?a0Jobloxd3JGTE04THVmM0xJRkNxaFpleDlLQ1FyUkZ4OTJYUTBWREtaWWda?=
 =?utf-8?B?VzVtbEJuZDFNekF3UVJPT3czR0p1UmJFcFlwS2FqMHZ4YURjU1VRcWVFVE0w?=
 =?utf-8?B?eXZIL3E2QmpRY081aFd6alVNUTZwY1ZiRW5oNXJ2Unl2NDBRbW1Dd25VajJQ?=
 =?utf-8?B?K1lOZHRnWGV3VVZwTEVIVUlNak1hc29wWkhCVGhKR1A1eGJHc3lkVzFUY1Ax?=
 =?utf-8?B?dmFmTXVGVi9lOTc0S1JTVFRKYTRCL3A0a2RvSndNdmE4NjcyNnpLY283RjZO?=
 =?utf-8?B?aHNxYUxIeGd2SEZiVjNDanBJQTU1OVZPZXFhREV0RXlPOWNRRlBYUkQrVkI5?=
 =?utf-8?B?alJrKzA4MmRDNXgvYjJuYnNEQTlrZXdadWYyWU52Zk5Bb3hZQ0ZKY2d2RHNL?=
 =?utf-8?B?M2dBdWg4L29EVW4rLyttekVJM0FvcDU0MmFYQTZLZUFIYzh4ZXcvYUZkVE5C?=
 =?utf-8?B?d0oxYkdqbFVJOStaeWNNMnBMVUJ2TnVTZzdEY3FQMXdUMmpTazgyR3RKMlhq?=
 =?utf-8?B?QmkvNUJOeFBTaUwvUDRlRWNxQ2lIMzBBbExHVE1HQ3Z0MnAzemdwQm9sNXNH?=
 =?utf-8?B?bVl6ZDZaTU5GeFZkZXEza3J0MC9XQjVpM2hqRzV2QU04TjcrcExiUjQ2aWxT?=
 =?utf-8?B?STZCbFN4WDRFZjZGb2s2S0tkckNNNXBIM0Z6dENGOWVVOFljbFMwN2d0clNI?=
 =?utf-8?B?TnQxZ2R6QzdMcGhzMTlhRzBZSXdSdXora0kyWVFZQXU3MU1XR002ZDdLZytQ?=
 =?utf-8?B?OVFScXRJMDBhRG5xM05ybFgwTzlxN1k4Vkg2NVd6a1o5WWRIOTNDTTJxRjF2?=
 =?utf-8?B?TkJNNjY4Q0FkcnpRYllwNVhNSnRGeU5MUTJONnphYlBLT1BxcHVhc1RCdUQ3?=
 =?utf-8?B?aTAzWlVpNmgwUnRhU2pDVmdMS0piU1JTYlpVM1Z4R21CRGc5TS9ESU94NWZI?=
 =?utf-8?B?UWZiZXhVcjhBYnBkN055ZGhySTFTakZjdmlma0hqVm9ONlo4bkI0SDNMWXVz?=
 =?utf-8?B?bm9rMWUrSnlDdmFmLzVmeHN6bGZMRXppQ00vY1NPQUY5bi9idXNWalZlWk1a?=
 =?utf-8?B?SUZZK05Jb1E3RzR4TnRvWXZFR0U1WDNRNFIzcm5odlMrMlFCREd5cXI5ZHpE?=
 =?utf-8?B?RWlMN29GbDJvY3VrdEJsZkVxUGJhVkxzNndMS2NpRVVXOVBESWFJOGtBK2VL?=
 =?utf-8?B?YW1lQk5iOE9pcUpZdjI3NTBKdHlKQm9OZWtDeGlrOENDajN2OTZJWlFmQmIy?=
 =?utf-8?B?eCtTb2NRQzM4RHpXVi9hZkI4aUh5ZTdnNU9oT09KM3p6dWZnandLUXl4YURH?=
 =?utf-8?B?M010SFZybWxDSGZUcGc0QjF6SUhJZHRCY09PSGwzVGNOVFpZUkgrWklJNm9B?=
 =?utf-8?B?c3JmZUtSOVY0NkYvTnRudS9xay9sWjlkT2RPZm9NcUhMQXo5aXdFcXB5N0tN?=
 =?utf-8?B?djlrQUtmUFlITGZiYmg5Nm95aGNZSXFkdDIwdSsxN0UzQmc0VVd2cVIyZEd3?=
 =?utf-8?B?L2diM2JDMTMzZHd5dUNYU1g1aEFYM1RkUmFJVE5hNzlQSjRzZ09IZ0wvWTJr?=
 =?utf-8?Q?jfdctgLdQJalQn5VB+EhVzH6NmSyJGTsHDFtExE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb982bf-8782-49a5-982a-08d8ede27a20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:24.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KG+mWYvp6GaE8EkarFpvGXNzq6lSNJG1cVhVZ47yzQ+ut10B43MqcIE7xcZvkiZt8cs5/3M0i/lmnUdDg9LlNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Such helper is very similar to the existing xc_set_domain_cpu_policy
interface, but takes an opaque xc_cpu_policy_t instead of arrays of
CPUID leaves and MSRs.

No callers of the interface introduced in this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 161dafd234b..d82c99b2f0d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2601,6 +2601,8 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
                              xc_cpu_policy_t policy);
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t policy);
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             const xc_cpu_policy_t policy);
 
 /* Manipulate a policy via architectural representations. */
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index a8133d5cd3f..48351f1c4c6 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -812,6 +812,46 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
     return rc;
 }
 
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             const xc_cpu_policy_t policy)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    unsigned int nr_leaves, nr_msrs;
+    xen_cpuid_leaf_t *leaves = NULL;
+    xen_msr_entry_t *msrs = NULL;
+    int rc;
+
+    rc = allocate_buffers(xch, &nr_leaves, &leaves, &nr_msrs, &msrs);
+    if ( rc )
+    {
+        errno = -rc;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
+                                 msrs, &nr_msrs);
+    if ( rc )
+        goto out;
+
+    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, nr_msrs, msrs,
+                                  &err_leaf, &err_subleaf, &err_msr);
+    if ( rc )
+    {
+        ERROR("Failed to set domain %u policy (%d = %s)", domid, -rc,
+              strerror(-rc));
+        if ( err_leaf != -1 )
+            ERROR("CPUID leaf %u subleaf %u", err_leaf, err_subleaf);
+        if ( err_msr != -1 )
+            ERROR("MSR index %#x\n", err_msr);
+        goto out;
+    }
+
+ out:
+    free(leaves);
+    free(msrs);
+    return rc;
+}
+
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs)
-- 
2.30.1


