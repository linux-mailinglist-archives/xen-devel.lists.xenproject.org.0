Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E635E0CB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109784.209593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcs-0005PG-Ay; Tue, 13 Apr 2021 14:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109784.209593; Tue, 13 Apr 2021 14:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcs-0005OQ-4z; Tue, 13 Apr 2021 14:02:46 +0000
Received: by outflank-mailman (input) for mailman id 109784;
 Tue, 13 Apr 2021 14:02:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcq-0005IR-W3
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9de22b63-6d0a-48a1-aa5b-b42364ee1380;
 Tue, 13 Apr 2021 14:02:44 +0000 (UTC)
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
X-Inumbo-ID: 9de22b63-6d0a-48a1-aa5b-b42364ee1380
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+ccNt1NnUZB51wrF9lVtU6rnw0ezqCu7LtS/VwdmaXE=;
  b=ZFZ3EEM+dzJrqwI8IzwbWGCAy7wNqP4KCmaMMuU3cVA59mNQbN9dw3rK
   NTJxmJe5IDRfi1lkdTgLgabELnMaBHKXWRisGJi8HPq1icWb3jK7wR6QZ
   snfUxhLiu4kY1wKhyFgQTdSH0mIiWYo4S+0CLxo7mzR8BxML42oXA/3sN
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2NbV4rYqUDXgZ5UCmNABXCVnZ+KDdBd0ryP1I98GHYD1xaS79HzB4oY0jKiKqAkYMWROmm5tjr
 AtOhrPe8tde13VxDQo38sXg1sjULyNvM16ef19LppKCMQyJktyyQ8VkVe3lUtiNsTJHYfc5sjh
 iQ0oivb2GVlsQw3MNM/LMTD6tsN5lUAZxY5qe+2Sha2fdh+wFbaSRrnJ/KkkTK+we+XgzI5kzn
 wx3o3BkqnTAUmjF1XU9THVDApuIoC3G3jebACxyIKk8Oln3hYAzyU753UxlkgMpG4fzKPwp2zN
 wB4=
X-SBRS: 5.2
X-MesageID: 41322176
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ohTAla1Jdk1/K7i/S073TwqjBWhyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035hz/IUXIPOeTBDr0VHYSb1KwKnD53nbGyP4/vNAzq
 sIScJDIfD5EFQSt6nHySaiFdJI+re62YSJocub8Ht3VwFtbMhbnmVEIyKWCFd/SgUDJbdRLv
 qhz/FKrTahZngbB/7TbhU4dtPOusHRk9beaQMGbiRN1CC1kTiq5LTmeiLovSs2bjUn+9Yf2F
 mAqSPVzOGJs/a3yhjTvlWjlah+qZ/a5fZoQOCJgsgRAD3whgivf5QJYcz+gBkF5NuBxXxvvN
 7QowoxH8kb0QKsQkiF5SHD9iOl8DEy52TswVWV6EGT3vDRdXYBJOdqwad6GyGpj3YIjZVH/4
 9gm1+9jd5xCyjNmSzsjuK4Ly1Cpw6PjlcJ1dIIg2c3a/p4VJZh6bYx0WlyC5k6ECfz+OkcYZ
 JTJfCZ3vpQfF+ABkqp2FVH8ZipVnQ3KB+MXlIPjMyTyyRXh3B01SIjtbUioks=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41322176"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImeAnWUtT4HOIU1JcRi3DPv2dJlJVz26OK+V1BeChRMqR+Y/vglIbxDTXpU+Oos1lGhWSlmoKFPJhY/jjOxNFEoWxPrLpz/vybS/9wN/8M3TGwN2cAl+9akTy+kkYaRVNDVgwpVDvYqmQD6PQlymPKZ0rL+r7F8kqu5EbmWNqQANjGj9I2JdmuI3XNA/TiFMQWPWsg7MY0A+Y4eYok3fWciYRDITrA3AcA4zxjNvcEezV65j1M7eG+4lHuNuOJp6u+u77BnlhrHEEhVoqegotqM39PiPs4G3dWtBbEdpdRUC1xaIz22JBddNQMVcQH+SQqELnxmzvJOzht0uCwpSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ace5hGQHWZBVqrsl47aMLF18dvATzg1Wl0vS5Bxau5Y=;
 b=HNaOC0qzi5Cr+RUbJP1PcqV8zbsoxoyItSsm0qSQlcfX7oK80ZTY0zAGSJDUeZie8YiYzYzSMFlMq/qfEJhIQqCadVyJsX2UexC57CKBoFQRaODp04bJmCk1TU+anPDTRdw0nkqjtmtDGK3mIQMkal55l/YzeX0vaY3QCQP+zCdhcug3RfSmYzOig0xzut00JhZbIhCzlstY8VbkHM9ip6KZ+87R9wafqrtYDL3j35KWr0t/lUDOR18eJFfH4lUscpr7L6VHdhU3O8BoWma4nLavYIS/13VV2u3j09c0g32WjnToIsVH8L73EIXGi8uwiKiXMIiW8yvXOakc24dwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ace5hGQHWZBVqrsl47aMLF18dvATzg1Wl0vS5Bxau5Y=;
 b=nrSfj9EBW0fo0eS6hqr5Jw8o8mwkuA2WEZuotzLMM1/hLzr+GExpU/SXoHTlaFZLM7L+pqhXwghhgGZ9jDazwMiUAXlsZw2tsXUBR0KcqPjkGfXkmIO1KopAs99OpLs/sZRCPj0AR77dr0AZJJvckv3JHJeBn7/W4m2rkCE3Muw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 08/21] libs/guest: introduce a helper to apply a cpu policy to a domain
Date: Tue, 13 Apr 2021 16:01:26 +0200
Message-ID: <20210413140140.73690-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0103.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3f6c4db-9226-4c75-9e5a-08d8fe84cd99
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB25537061323BBB46BB2DE5C88F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbaJTcdYwbS4Hftkmgy4BuKsisuCKehgtSzsiAqcrNddh4rGwloRznuiO+iyHaVQBEh1cXgSt98XjEFltXMs4jBuxWrdvb+3sgg4zpxdWPY36zqvJNFOBYgMVcnJz/PvM+WpZwNNdQRQTzKaPomCMVGJWeIHZo9LS+0gHIhZLFaCROMs2pmf9Fp1tG57lM/U2ZDcenHwCHg7IpOYW9sMpFlvBUf0K0mdeCQvi45POhDajb8vRnF+33jEIcJx4iRElxPe5nICCoqVw3in+UkQOhno8BV6ISxANgxFU7iGG+ZeOVEkZ7B2ps9HIFt6n8VzTd/lrRzVyD0d+b+Ak4msaPZ9N2DbBpmjPbnejRrTzFlvA6u61j/Sq7rLDFBc2tW0fJ17wSNS84vVIq5uyWRsyAJkjtZ+2Xsoe536D06JVVKHCmsDLUFRngVVX/oiWLTH+WuC3BZSYD/cgP9aRZc9F4s5s2GHfM7kYbGeWUHi/0sxRYTQa9fJgjSu6Xb1zJeS0x2lq4o3cvYH/I9dnD3yEy+f3dVDxoZYsUaX2q5kC1/hvqMiakAswUHVGipB+XOJuOsWR1GYke57E8XE5fdPW1D6nrjDKN7SdKVBUqQ3Z0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alM2Rmd4UEdHV2gwM2RubUlldU0vTmM3OGxJWk5WRkl5R1Z1VENzRUxwQTdl?=
 =?utf-8?B?MzZmem51VlNKVjBIejhLS0c3ZC9hOXh0aldkWWhEZEhNWE9ya1ovcTl6U2Fq?=
 =?utf-8?B?NWhQdVV0YlluZGpYbGlJRklzOWt2dnNVdlZlaDg1R29XdmhZTGwxblJtVEh0?=
 =?utf-8?B?RFdnaG9WS2dBNnJyR3p0SXp2Q1FDQlE5Ty9SOVFQbVgya0NVSCtBU1BZb2hh?=
 =?utf-8?B?UDhQUVdGME52dS9xVlNYYjBNSDE2eGtxNG9sbWJwajl1VDFRUW9FUXVPYVRZ?=
 =?utf-8?B?bktJVWtRSzUwUEhhK0Y5KzdETmpBUUVzSGo4bXI2UlIrOVR3cXZiMkd5SEZI?=
 =?utf-8?B?d2dhN2dTU2kvc29yYktQR1FyWUlBOHI5ellFQit3aU55ekU3WHhNdHpLcExH?=
 =?utf-8?B?YmFpeE4rM0d1alhVTHJtNk5YV3FLZ0pwVjJJdy9US255MGxMSENyQVplaEFN?=
 =?utf-8?B?eExEQU1KWm4vOWd6bXI4OGFFdmUxUmtPMlBMdElLZ3plSjR2UHFWMVBPUFpQ?=
 =?utf-8?B?MzhGQlNVU21Ta2RsTDlJdk5jZ3Q0V1RKZC9xc0lINXhqQ1YzSWJhK2R0RTdQ?=
 =?utf-8?B?MmFJY3JHazZDQlltaTRZaXBVNFVLNWdBbngyWnJBdTlYME9sMmcyR1pUSHJF?=
 =?utf-8?B?cHdRdDZCbGc4aE82RWtWSWxTSVlMUFlsdU9rOEpWMjFKRSt6ZlB4VHd4d0ZE?=
 =?utf-8?B?aXMvYjhCSVB6UDBmcVgyTkFNTU9oQnZXZ0hIYzA4bXVFNXE2d3BjU0RQTE1u?=
 =?utf-8?B?NHh4YlUrL0pJVFFqbzA5MHBhOFB3VXRRYmNyTXJrZU14NytIV2ZxUCtZTStY?=
 =?utf-8?B?WWQveGl1MzdGTGx4bS8xTlFUdjRraVgvVDNJeFE5dzhZcFdzcTdDdkM4VHR3?=
 =?utf-8?B?RUlyTVVBTytNNlEyb045UE9ndzNnYVlBM2FtVnFpUEMxdHB1Y2QvK09xVm1H?=
 =?utf-8?B?cE55c0U0MVRwbzB0UnhQWGkzZDhoQUxFSUZScXBzdGcwekQ5dy9vczNjNjRB?=
 =?utf-8?B?R2NROTdHaSt1L1BXcTNUQ1VYeFdMTEFheU13cWQyQkFjUXRWYkMzMTdFME5H?=
 =?utf-8?B?QmxxNmNKQ01KRTVkd2FvK1E3VG5tSFBGRkRqNHVDK3ErbDRyUkFNVUJUME5y?=
 =?utf-8?B?UmR5eFBneG9ZK0QzVVRGZkQ5NTY3eUVkZ3gxR0NzcEhVdGVMdUhCWjVFNG0x?=
 =?utf-8?B?dzd5TFV6RXhwdTVEcDRyUEEzbjAwcVpnU0FVYWFsbVVVZjA2dzJ2YWMvOEJz?=
 =?utf-8?B?RlhrS3R3K1F5N3A4dDBIYUFjenJwWk8zMjB6NTFlYkZCNFNaeGc4bmFuZHF4?=
 =?utf-8?B?ejZ0OEhGVmhSZFpISjJCek9Hc2xBQ1k2MEpoNFRFL1hkQ0VxYUZ6aFpJTnlC?=
 =?utf-8?B?MHg1RG5BWHlwcnZqZGpkc2FoYjEwdlpwclVQWHFhc3RzU2FRcmc2MjZRRWI5?=
 =?utf-8?B?VWxOMThQRTFoMVAxUUhhNHFLYXNuTUdoS3VOZjh2ZXg3cFczZ3Q4T21WREhs?=
 =?utf-8?B?L1V4VXF2SEtLYlJramJ6Rld4NlBWY2xDYXZkeWx5bDVlZGE0eHRndXpQNE5Y?=
 =?utf-8?B?NWZtd0d5SVRhQnA0dEpGU0JRMFZ0Sld3bjYrUWNzcGtpTHdtM1B6QTVuQnJi?=
 =?utf-8?B?ZjlqazRUdnBYS0NCdko4UkE1SGlsUEN6TGxaK2pVdUFwZWwwdk5TazFYbHd5?=
 =?utf-8?B?ZkZKNlU2M0FqUEdGWS9pRURlYzZKbjAxOVZicXpldW5Lei9XK0t3dzNYM1NP?=
 =?utf-8?Q?WzowiovRUwib3f637tAo6YTVJi0UvUVnlTDAlW6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f6c4db-9226-4c75-9e5a-08d8fe84cd99
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:41.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0AO5Pq5+kolurdDtasd6/dgSgBN99V8Oh/C43+OSRqVuYZNeNbOg1RaXlAzQ9eFMoUxQUfjf3GoMyCvdsZZHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

Such helper is very similar to the existing xc_set_domain_cpu_policy
interface, but takes an opaque xc_cpu_policy_t instead of arrays of
CPUID leaves and MSRs.

No callers of the interface introduced in this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index e9a86d63bad..27cec1b93ff 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2601,6 +2601,8 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t policy);
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t policy);
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             const xc_cpu_policy_t policy);
 
 /* Manipulate a policy via architectural representations. */
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 208a247bb6e..8b48c51a8ee 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -757,6 +757,35 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
     return rc;
 }
 
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             const xc_cpu_policy_t policy)
+{
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
+    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    int rc;
+
+    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
+                                 policy->entries, &nr_entries);
+    if ( rc )
+        return rc;
+
+    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
+                                  nr_entries, policy->entries,
+                                  &err_leaf, &err_subleaf, &err_msr);
+    if ( rc )
+    {
+        ERROR("Failed to set domain %u policy (%d = %s)", domid, -rc,
+              strerror(-rc));
+        if ( err_leaf != -1 )
+            ERROR("CPUID leaf %u subleaf %u", err_leaf, err_subleaf);
+        if ( err_msr != -1 )
+            ERROR("MSR index %#x\n", err_msr);
+    }
+
+    return rc;
+}
+
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs)
-- 
2.30.1


