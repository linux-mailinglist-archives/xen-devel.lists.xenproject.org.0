Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3647B35E0D1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109807.209653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdL-0005uw-5t; Tue, 13 Apr 2021 14:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109807.209653; Tue, 13 Apr 2021 14:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdK-0005u2-Uq; Tue, 13 Apr 2021 14:03:14 +0000
Received: by outflank-mailman (input) for mailman id 109807;
 Tue, 13 Apr 2021 14:03:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdJ-0005sc-3M
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fb40aef-70d4-467a-8144-dd57e73ae0be;
 Tue, 13 Apr 2021 14:03:12 +0000 (UTC)
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
X-Inumbo-ID: 1fb40aef-70d4-467a-8144-dd57e73ae0be
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=uEN8vdruq4R26ejVTvoHnlj4zKLnkKaq8by+dBWlaWM=;
  b=X6QvBQVW6wgWmjPObBJpU3D3kSFDPDzGW8iarWPjLcJbbcM9c9Cvr1ZW
   p+Uvlr6/OobVTJLlj/oiu0X7OwDrvYmRXgNRIvBCG+F+qUCAiZXUW2FCE
   v+stWOC2GjGE/lGVd+Nt4SsSUsQfcsES4L59OTn+/1ZbEvyetkASSOBcI
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UvUOwl0n7404jnOeNInaf0XiQm+TDLJgyj1L8gyDMXm7gqmpkGJXB1DFE8eEr/Ow33Vzk131SN
 UEuZMtb8lMHd+2Hhy1Mhy4Q6F2ChXyZsHTq6Zy2chFtMWAWrpr5PS9IoiV+1udualNRPrfHjH4
 6Z1t6052sy0bl3lRJQUoRlylWW/vQYcw33FRaiafF5x2xko1PsHBJDD30ySSVHtm/KNYNRTC9/
 gUfsloqv/NLx0z0qJm1iXaAgNkuYzjg6szm2WAqwe+GZLkbm7N0iE4H8ieCJL7XvDyF6vcZAcv
 kqE=
X-SBRS: 5.2
X-MesageID: 41613953
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:muOtX6sSYC+vRwxdcLCfb3YS7skCrIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde544NMbC+GDT3oWfAFvAG0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JaDqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ8bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUtpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zU0IidDq0nkGup
 3hpAohItRS5hrqDx2IiCqo4SbM+nIP7GLv0lCRi3eLm72HeBsKT/BvqKgcVzmx0TtFgPhMlJ
 hl8kjcir9sSTTHpyj578igbWATqmOE5UAMvMRWs2ZSSuIlGdhshL1axmx5OrEaEhn37Yg2ed
 Med/301bJtfVSWY2uxhBgI/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv50s9yA==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41613953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwVANm0qhv5f/T6gaMK7OXEZyxJVMIQrbyFB3AFurCCogxs0xoGNxk65NVG5I2jDuKckeGKJYwl9rwTAN4xT0xjSrswH6ncNjWYGJ6e4bgL/0K92oNlTvxOoxWiZQCQh1+MZQ5uwhpc5gTVDzOzoDMBmp2Q9K+XjwVj8hqRAqJ+B8UkWbTm0zIQVg0kSm3WN83w63Lvqozpn8WEraruWwzJl5AYHi83wdbKE+dhdAsTlH5BHiYyAcjGBU4OYhGltaGNSed9DOIJXF95o39dQ2wLFMaDccFwOUSf6qP0RXKgEPu/K+fZPWMhxIjv1XpFE8gqLkgMKbwJyLmxV9WKOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zjRbsyq+DaWv6wnjrp/39MtyMLtRSSqzlhDBppNwHA=;
 b=dVwroCq1zzWGRtUBiZ+QSTsOACxThy4KsBpY5gobjrF5kOuf+n2c0JerA0+HwBQibTF0c3BifHaZUM2pdv8qdjIRrOVRwrVjRgvVwk0I4Ie1LGyckuE/8Dx3eMLWVG4q2QeESg/PZYHMR89hF5KUqznM8UIBRPgUJJsxbck2Y3ckjkvy2cU4NPaszXMqMqCC6k5cT0rxI1D1/rpXGs4k8nwzFt98VgYAOL6+RZE7qvhTBt/MRtN+sRRAbIxKMlVFsekx7bpY4hDHDE4ZyNEIGlH1dzTP4vP6+x8zRAkyS0EXXNu1oNRmBTs6HOUoa+5/goyvytiDWEoobMBxALWjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zjRbsyq+DaWv6wnjrp/39MtyMLtRSSqzlhDBppNwHA=;
 b=ay8pvTHaaoefeJzIGKHYTPuWm1BkIiEYI+AqI9O6zbWlhSLBwgFqwFtX6HxnSOHX/Lfh4HmAUhGxzRi9DFjb9vuhM6qiKk1H+OauL/BDmW+ehZuk8PpAi6plAH7ZOXA+cI+SqyTFvmCmSF3qZg6arQPa45X7cD6Gh6RnlWH4nuw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 13/21] libs/guest: allow updating a cpu policy MSR data
Date: Tue, 13 Apr 2021 16:01:31 +0200
Message-ID: <20210413140140.73690-14-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0157.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c5831c7-9221-454a-6ee7-08d8fe84de13
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2553FBF104CC45392D5B91108F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iP48MwPvjkxfeHds+UhOHvvY78axBKbnoz9h6a9+hPhXTvp+Q1JtDhCFSEbbWOwlakS6tSOTVrVxSPc07piAhAcwZobLde6d74fDc5wtrWJc8fKU3dzfFiBoAIIZe97pbDFLT9k7XcFAXGPr0PUUWBXqsCGgxkRqk2sV5uhebrYYB2C/oOPoanD2ygl8gQL+VQygC+WSOs7S27oPoN5UvJI2DtqUT9uofrTlD1lhG5EGFuffRAUpkJyKjqAEF8BYvHNWSfSwQAh2X1QPDmcgpWsuj0u0IxqawOT95tzJR28zgtzOlVsSnfhB71e5T382eRLFxUKHaq1Q9ruMPvE2ntiT8DzttY44HBYCVvTQRHdseOJEM5TGUAU+N8R1NyrzHhNj5yPABDEIBdXocjWNNQttUvZAp5BY9bPTN629mLRyrN9JB83/eA+25t2j13YRls3IcR8FzE8p+A+V/XlAmES6EN+v8mLJhQ4nCUwJQzWad0FXR8+CZZda/1sxJ7eDMFQ7XUPIsJG1X1t9yB/wcgSfKE71j6HdC10CgSeR/Ifn36SaoSThXz5o8Hx7aH+5VLUwWiJL2BnVfifw/PzEGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(83380400001)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzZ1amJLNm5WOXNtTWEwS1RlYVB2c3ZnVjE1TEFERnRZMVJFZlZtS3I0Z2Rh?=
 =?utf-8?B?YzYwbG1oMEM4WTAvQktZN0wvQm0xMGZNSE4wckk5aHJ0MlI3bHk1dk5lSDBR?=
 =?utf-8?B?VC9WWTNtem9QR3pQYk43U2EzUHd2b3QvOUgvYjU3dDl2M1ZGdXpiZFA4MVg5?=
 =?utf-8?B?M0lFeXdFREtxa2J4N1VDVHA1dXpFY0F1aG9ZdnBaNW02bzNVc2xrQVhhcUxu?=
 =?utf-8?B?azROcUhzdTd0Z3NLVjVBcU9VUVFkUG5xcjlQWEFRbEUyMUMydkQ5Snp2bXBQ?=
 =?utf-8?B?T0JaMEc4UzFWeERRWkFDRk1HK0ZKckFYbWhvOXYzaFJhMm8xd00wTThrNnFr?=
 =?utf-8?B?Q1hiUUtmWi9yOHY5M0hZaTJWZmM3TWJHK281d3dNUnVyL2Z0ZjJURHNQU29U?=
 =?utf-8?B?R3ZOMkQ1WnhpWXJlTWZ0RThkOWtRTEE0eWV6SnRLRnk2Ry8yQXBDWHRyaDdD?=
 =?utf-8?B?UHh0bFdUbmZldnBLcFg0K1JMUEV5SGczWU9WMytaR1crQ2ZXOWhpQ0F0dnZX?=
 =?utf-8?B?Vi9mdmF5OWI4dkJielczWGZvRDd1N0FmbG1id2p2TG94TWhhYmc0MEx5ZWgy?=
 =?utf-8?B?NVlKelFCcjR5b2RVSlpCZFIwYzU5dm5pcUxaWU9CN1NWU0RjV3ZJd0g2cFBa?=
 =?utf-8?B?eXN6RitPcHNQVFhaM1hQVG03L3QvV083SHRNYmd5U2lHdmlXOGdCQ1NjSzcw?=
 =?utf-8?B?Vk5rM3hCcTUvd1ZxZ2c3VU0vemF4bTNOc3FqMDNFM0dWalRKOU1pdjNTWmNZ?=
 =?utf-8?B?c0hqcXNISFFRaFhTOWVSUEphaGt4c2tBT0VMd2ZpbytzZUlQcTB0SHpWV01a?=
 =?utf-8?B?a1Z3c3FrRytFQnVrSytEMHE0UW9jLytjTDk5M3VCeThDU1haSnQvS2o2T1Bi?=
 =?utf-8?B?YnkyVUlOMzVPNlFMNFVUQVhIQUhEYW81SFdET0UwV0xZc3QzdmFIUUZGV2hs?=
 =?utf-8?B?NW1TN2ZvY3QvdkZuSE1QSUpPQUcxNUFENE9GbHZhR09HVmRHMm5SRTl0SEZD?=
 =?utf-8?B?cVJlbkZ2REZUVFFWVTBtbGpIaTlIN0lIWlowM1FzZFpjbTBQYlBkTElTLzV6?=
 =?utf-8?B?dkpIRjEzZDVZREJkVGkvcHJtakZ0S2tqKzZlNXJBaGh5TG5TQktLRWIydEwy?=
 =?utf-8?B?T2ZGbzE1T1dIVXEvK1ZYcXhab3l3NnVLUVFnSmt0TlllWjZDZ3FjalNYK3Vh?=
 =?utf-8?B?SlJZdEVmclBBVE94aTU5Q2szRGJacms0WHVyNmhiU1hvdHB0OGJiQUV2UWJw?=
 =?utf-8?B?NFdQWjFiQUNqbEhaQTFlbGViM05WYUZNR1RTVDlKZmpleTdmaDZMOHN4djNO?=
 =?utf-8?B?MFBXQUVQYk5tNUhkcnludWhwYXcxUTdjakM2OEpIbFlUaFcraEdaWDRzeUxl?=
 =?utf-8?B?Vm4ySXdpdmoyaWdHVGs4bWdsYkVXQWE0Sm5yR0h2R1FjN2dubnBzK3lrR1h2?=
 =?utf-8?B?cnloYU93cWVsQVRMWjJWL0UwSWFUNzgzRlNVSCs5N2cwRk9IS1BBYmpuZG5u?=
 =?utf-8?B?eHV2a0czNTgrWk1idnFKcFdhQmw2T3lLN2psNll5YWNUb1RxVFN2RFB2M2pq?=
 =?utf-8?B?czlWQ3UzdDhkM0MxUDNYSlhESkN5ODEwRCtjbzhsTVU4NkxpTzZXZVUwT0kv?=
 =?utf-8?B?ckpqZzd4bWQxZlEwOVZEcVdXTHhhS0t4TS96Uk5aSTRQQ2d3M2tyd2diY21U?=
 =?utf-8?B?WVg0MlhaOU1ieGZrZE1NelR6OU5GQytMVWkzcFdUMmEyOU9XT3I2a3JUbFFL?=
 =?utf-8?Q?aAC6uRzvg2AwpXR1XAMD1CDSZkjQuYZPk3OyiUD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5831c7-9221-454a-6ee7-08d8fe84de13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:09.1632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcWNFVqJ3mA7hl6vYTgE/RKSAyjN7eXZUXHdVq/x2mkJxmbhNov/vu/6x29R2IEGf2GCP7lcZgd5c/gtBY0QLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

Introduce a helper to update the MSR policy using an array of
xen_msr_entry_t entries. Note the MSRs present in the input
xen_msr_entry_t array will replace any existing entries on the
policy.

No user of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Drop logic to update entries manually.
 - Only print failure message if err_msr != -1.
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 49f919f16a7..9a6d1b126d8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2616,6 +2616,8 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
 int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr);
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 00595e14cc3..26b09322dfa 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -907,3 +907,21 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
 
     return rc;
 }
+
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr)
+{
+    unsigned int err_msr = -1;
+    int rc = x86_msr_copy_from_buffer(&policy->msr, msrs, nr, &err_msr);
+
+    if ( rc )
+    {
+        if ( err_msr != -1 )
+            ERROR("Failed to deserialise MSRS (err index %#x) (%d = %s)",
+                  err_msr, -rc, strerror(-rc));
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
-- 
2.30.1


