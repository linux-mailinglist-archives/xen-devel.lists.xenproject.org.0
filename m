Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB080376447
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123976.234001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKV-0006Gp-Ae; Fri, 07 May 2021 11:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123976.234001; Fri, 07 May 2021 11:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKV-0006DA-6U; Fri, 07 May 2021 11:07:35 +0000
Received: by outflank-mailman (input) for mailman id 123976;
 Fri, 07 May 2021 11:07:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyKU-0006BB-Ab
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8e08e22-de8c-465f-abc5-46fac93e55e4;
 Fri, 07 May 2021 11:07:32 +0000 (UTC)
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
X-Inumbo-ID: e8e08e22-de8c-465f-abc5-46fac93e55e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=fJ0HrS/eGncbeQacqXx7DubhiLIztaxtWhjNuopSA/A=;
  b=Ipag6eX9mVNFChhCyI/A1arQf3dAopb/2eze2me/bW0GwVX8jr2s2Jsy
   IGbHYjzy4nchfqtC/CLF5j4yxf93LkSaG3r1endE0H9h9rKK3deIw4GMw
   /iSPifjDjxXbvzqZJ2A9VpdC0zuYVXhN7zieEPeEXNel5Wt/Wu5i3hX9O
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N6aP19wmrD1YDIrtmwNfPSrWKF5/xg8+zwz37FME2TSW4kPRByOFxUJ5GsbSgiQVNEDBC2+gz3
 MC8pY5SZ+dEnWAsQtY+QIOY3dJLITxZBLxhfq7zRjOKyk0IorPqM5cjb8L/y0BAOXWdJX2JjcP
 PJvDFZ8JjVVSHG7iV3Lqgnhh1v/dC4cxviES7UupkswTqazOqsh3ClDdweW2pFq9/gyVT+ap5a
 5Hh3T6ii29EQQ708EtTAUjFrNovIG7DyQBgH8J1mkMsbGkQympZ8zC75ao09RhOhAujTuFf+7m
 IyI=
X-SBRS: 5.1
X-MesageID: 43304436
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zZ7Tnq88WbA8Az7uU3Ruk+Hqdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNVICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8W6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOrXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6S64aT1eUZpDLS8KoCOCW+sLlXFtwqsHfrWG1VYczCgNnympDr1L9lqq
 iJn/5qBbUI15qYRBDJnfKq4Xis7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPui3N7N2K1oM3G3am+a/iqrDvGnZMoq59bs5Wea/pqVFZ1l/1WwKp4KuZwIMvK0vFULA
 A1NrCj2B9/SyLrU5n2hBgR/OCR
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43304436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3rBJT9rk31XDIsaUct6yEdAVlNNl2VOR14Rwl1F6hgTlhXXv8h1kRCQWrfp/nV6iRDUWzC/gE4fl0ZJ62DZxlWpQd2kikXf+fkxpTLoikJub31eMI95o5cu//SndnusaSLA6Q13vJo0CDw+jK7lndisUpGeL9hsk4Qxw7xkEVof7ydm85POm08tgTcWXG046BW09wV62OOLayOACgS+eAjoy9OEnQlxXpsu3MeAPQKoeD2hjv17S71CotC+dshQpF8yooXoj2mE6xZmtj6EoV0L5BVftJCUkZ8bYXzsJWm31a8LgzMTaoyzU7obf6zTvhZDTyG9HhauXeZUyiweRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYJG3uGJ8VJ4S+hSZ2uLPR8RulmRHjZIhZJGRk11WH8=;
 b=hQn5JGXs+KtWTxzm72+qH65tBbKiPbv9afUtGFR88nQkkyhq5Ch9DMLEPwldkJSKGg8oUoGa6E4L19jRcPLrUb9Mi7lThns+XkbItzfDVuApi/Ip9Vffae9qLibSP4JNDNhg9Vwxkq7Z5dM4rHRQKc2elR1cb3iJx3LbqS0jrwfWCtSIlPe/AfH7HRnEkVFwBQmb7sm0wXlfcqi3BasUcEAg5dZKhMqV/ENrTSvwnw/6PfQo525Pxt54ZfFxULSjAtlc2ywryyKvJbaMFOAQYmrPTpFrqLlQQ2aa41H0ArPhCPBYhRehUKCOl/jE2vdZdEgvO+dSkmIHESLAqm/cpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYJG3uGJ8VJ4S+hSZ2uLPR8RulmRHjZIhZJGRk11WH8=;
 b=IW++bpdtOGiSFNQlytppBQqA9oZXp9OFTIb9zA6lil/GBQ3JsndO8JytyQ1/uz9+Xe/oLwR6BhBSgfqySpieVFwX9LFBRWd7deIqCJxYURcWoiQgEbE0so+P/xZbDwXtn2niMNhO7TU15VZkRzQPnG6REZLGcUa26rRQtWlIprw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 08/10] libs/guest: apply a featureset into a cpu policy
Date: Fri,  7 May 2021 13:04:20 +0200
Message-ID: <20210507110422.24608-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e294e9f9-9a1e-4c33-8f91-08d911484db8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44752EF5BBA2EF25301DF0D88F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fkw5qYLfxVXp0wPO+PkezqWitov+kCl4L4dbi4j/5XFb44Th5QiYMH+GDQ70xe5hhie/I0/M0YSayt0XKo4KgaxMFPuGa1Qn7iiQLmUDrPRSKr7uc5uTJTleGVa5SVlxIlFJyM0zt+ZmNCFdYf9cBem/s3k4fiRcHmz4dEO6TdK2gD2k7Mc2EvD44xUvArEDc8dlHeEP/T2N8li5tPC1SIJnEMG4ZjlAKN65UJX89QAI1WKUbTSEB2n1sUg3ZprmZ+3mPBOQQA8jRNK/O4bQg8S12OsEf47+rvRf55dCL6GqyU/4dLX4etJhfwHJjuFTx9Zj364+EDeWsoFgDtqSFySsu/xKUVGyvP2FBG6wmSyVG8MhwHO13jM6zcfvn4o7a89N1hcmdqH56l6tlWrg/O/itHx/ilQMOh/1++b+s7EcCkR/npocnEFDKP9PAe3mv4La74oiYa12EFmT5LsrtCX2PvBa70owmeYOC/VDILG2KZjvENuL/mm8LAdQHARVbmLhDdfCzx88BuisBeCKdUlRMuEj06qSg3iFngRs9pG4lAN2hL0tH6Kt0HAD/rZK2PPilNP2NkuirzHjTj3426EKFns109NDksRHikCFoAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(6666004)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVJ6dnptVkRGbmFrSXhoR0NGZ1A1eG4yQ1dYM3FDUk9GUjFTRlVZTkdiTk1S?=
 =?utf-8?B?TzdNN1duVnQ1WUZ6RzhpMGVCZ1AvMXBPR2RUaUVjOUluOFlvcVpEUkoxODRN?=
 =?utf-8?B?ZmVvQ3l5czF0a3FuSk1YazlpeXI5d0dQU0ZLVkJLQmRkaVRPYTduTW9razUv?=
 =?utf-8?B?UVdXVU5obSs4NWR4SHNhd0YxUDR1TFhhNkNtUy9tZUg3QTllUW5GclNLN2xt?=
 =?utf-8?B?U2VLTTY3N0kvQWs3VFdHYXJwWmIxM1dMdWZsR0ZCM25ZR1NObzA5b0VSdmpp?=
 =?utf-8?B?cGU0YlpvV3F6eHllSGVjOHEwRmlLVDhsTGYxZ0FxSVArVGkweWk5bVE1TW5R?=
 =?utf-8?B?M2JqT0g4ZVpKUG44VE9ZaTVkZ1N5RU1UU08vSG4rOU1CVlB0Zi9Od0dHbW51?=
 =?utf-8?B?bmJ2ZkdkZFcwUVdqU1Z3MTNOelpHNDBwYmRBY0lkTWhEZGtmWVUrUHJxTXBa?=
 =?utf-8?B?Y3NIQ05iaDBHSmttdXAzdUFEUkZwK3haK0JJRzZ2NEdSUDVkTlkvdGpjalJY?=
 =?utf-8?B?YjBpRjdoOUVSa3lFbXRLWDhkaE44RHE0ZTh5enJrUldwZ3R4UnNodnliL2dp?=
 =?utf-8?B?Mm51aFVlVnRpWnhLN2JYTnh0dGFzaDk1QTNRNnRGRC8rOWMzbldUQlFKa1FY?=
 =?utf-8?B?MER3QlpLRm9FdEpOUXUxbEhpZERtcjFOTXBYVlZTemRZZVVVNzF4S1RQcjQr?=
 =?utf-8?B?RVFyQlY3UFY4WEh6cUJVQnQ4U0R0S2FlekxDQmlwMUhGRDcvTnhmZ1VxL3ND?=
 =?utf-8?B?c0JxQml2VlZSVlZwZWs4Smd2Ry9GbkVtOEdRRkhwb0k0YVdvdXpjU3pJRjN1?=
 =?utf-8?B?T0lQL2RpWU1EMzFzT3ZmMU1iR3BVU01pMEJJbWRORjhqWlpreWx3RE50b0I1?=
 =?utf-8?B?ZE9mN2NiWkNVU3czbmN0RWt5eG5tVjUyNFY1VjBkb3l6YXY2SU1RUjBPelZX?=
 =?utf-8?B?dVJrYTNGVzdqLzRZRTVMRG9YaHBVd3hEWEJHWVRQZy93VmdaUEQ1WGs4QTFR?=
 =?utf-8?B?V3huNUpqTWk4YUxFNGZQMmN4UEZwSFM0WlhRYTdvdWFRRzFIbUttdVcxU0NG?=
 =?utf-8?B?VFEwdU9uOE9uS0JRSmkxZnlUbkNsendoRlBhbC9NM0pzUzFXajZHS2U0Qmpl?=
 =?utf-8?B?M3RqRGFGWVM3NzlWRHhlNHhCRGQ2RENXZG9kSUdNY2RVdjlNRzdHSjkzcGFR?=
 =?utf-8?B?c1pONHhNVjJGVnlGcVozWGM5QXdkQWpndlhTN2VPRjAzeGt5Mkc2V1ZGaFE3?=
 =?utf-8?B?WXBTY0YwWEZyaERNZ3JIWmJ4czFTQmdqOXdZdjBoY2s2UE91MkJCZkxHVjVs?=
 =?utf-8?B?ZlgxMndKcElGYU93YTRtdnFmZjlWQVAwZDMvb21uendTREZFQ1AzbEV6ZG1h?=
 =?utf-8?B?ejA3dWdteG4yanZxSStWU1dtQVEyQkVwYmN0aFA5Qm9NaXhiY1ZVaGpCNldH?=
 =?utf-8?B?OGdQTWhVUUJUZTkzTDBJYWxsTzBqajFYbHdkeGtJTDdkaDVuWGk4MCtDZmJn?=
 =?utf-8?B?ZXA1dDBUUGV0cFBHcFBrdTc0WFl5THp2RmJOaDQvdlJwUzZkWjg0R1RNRHVN?=
 =?utf-8?B?MkVZc1hiR0w1YmR0VGM4NDVpRngxRWMyNDFzTzlneE9WOFBQMWR0R2FXSER5?=
 =?utf-8?B?SC96NlNTOURUTm5IazFOWC9oUkNVK0ZIQ1ZxbWlxYkJHTmdBNjdWNHhZQW01?=
 =?utf-8?B?d2kyb24zemF4RTlKbW5aNFduZWU5SmQ2cmFKSURDOVpVek4vNFFRRm1vUUxl?=
 =?utf-8?Q?KJVfGo1xxRGYTUEBlH+31syjacRN7uTOJPoGGZQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e294e9f9-9a1e-4c33-8f91-08d911484db8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:28.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QBrs7kbBLG9FsmolxDSdOYItsZsowvwYs/oacMf7euY3KrpsFhk/rCx27+8LpH2fVOS6mpQ8rQf/QgtfME3Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenguest.h        |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 95 ++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 3e2fe7f3654..134c00f29a0 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -766,6 +766,11 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 65b49753d3e..778bc2130ea 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -452,46 +452,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = *p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
+        *p = policy.cpuid;
     }
     else
     {
@@ -923,3 +892,53 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
 
     return 0;
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, &policy->cpuid);
+
+    return 0;
+}
-- 
2.31.1


