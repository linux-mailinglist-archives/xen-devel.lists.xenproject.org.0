Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7D376448
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123978.234012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKa-0006ph-PH; Fri, 07 May 2021 11:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123978.234012; Fri, 07 May 2021 11:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKa-0006nB-KV; Fri, 07 May 2021 11:07:40 +0000
Received: by outflank-mailman (input) for mailman id 123978;
 Fri, 07 May 2021 11:07:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyKY-0004jI-Hc
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:38 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39bce5a7-9878-4bd5-ae1e-c25afcadf535;
 Fri, 07 May 2021 11:07:29 +0000 (UTC)
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
X-Inumbo-ID: 39bce5a7-9878-4bd5-ae1e-c25afcadf535
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oDJ6glkCLlfUuzvIT1EjKxHZukaOvVKn/CkwxDpr4as=;
  b=GjW/cvxBlKVgFyv7Nx/XCLhT9xlEGXxZJiLKRG3RIVwN+64fwF0YVlSJ
   MY7pgyW8OKCzc8L2m0Uvir5s8d8tmu3QPjg2NlaFWP01htTkQsrdszI/S
   VIl5/IOk+aOxb9gYWi1P+XzqHzb1HdJNmrKbiuQCa8ckDXpR9j2wNZfsG
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XcOi2GSrpuv1xWnr7iV2sYsOi4hpzu/Ka0As0x4vD5yeD0G/Uct25IaWISTy0S3ooDi8pdsIAL
 QUWXj2hZ0Pz1nBhj93yQsm/OTDtoaUuKkoIYZYsvOunT4C8jsdcdwL37YjMANs6Xw0DWeyGUGN
 ya62LCM1AGDuP+lOB7CJy1cn6xSYr6Wwy+REivUMf2cSVHU4R35yR2fueK4yExuzE+xZ4MeDD1
 DIh3ajNBbyWutKJOKwNmjReGRs6ImYOHwK+MnNiVPS6hvgViYDvRPWbYQs/vQfG9oG8dJs8QOW
 z1g=
X-SBRS: 5.1
X-MesageID: 43096246
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ee+tS6+ufxdpXJXjkfluk+Hqdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNVICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8W6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOrXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6S64aT1eUZpDLS8KoCOCW+sLlXFtwqsHfrWG1VYczCgNnympDr1L9lqq
 iJn/5qBbUI15qYRBDJnfKq4Xis7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPui3N7N2K1oM3G3am+a/iqrDvGnZMoq59bs5Wea/pqVFZ1l/1WwKp4KuZwIMvK0vFULA
 A1NrCj2B9/SyLrU5n2hBgR/OCR
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43096246"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdGea/Sn/56bOKfif6mDtTKvRKys3iJaZ8PDCKXxHrKKNaVIAm6FJl96kr1QZKnb1HNQUGO6XSKl+eQ4UtRd0GpT0dsQfDAECLUG86uS4aWftqhXeU6KF+LXBhbvP8RpqWokixy8AcxcfpvbqgcfdVMazrcW6w0L2xjlkKRtjwtg1jIRIjpTVYbWBzHjtBHifmGR59aQdfM2LmBQsLoD7s0ffP4AsLbz4sx2NW6NNNx6eW2EIQe31GlbG0qhFMZ7Ro36MxREZ17yjXYC6UeCior9ac5EaRiQz7znxIkvJfZycLAoEqTGSKkMqdKe3HtEeu51SjRNQimj8/Y3o05+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7afhcgom3dSGOWUu5uK4ZZv4DipC5W8MhkjaH97+CUQ=;
 b=FfMfXSi/HE7kJEytKuIm4ndS26djosVP9JJCkSJKnX1gG2d4Z4iXAT8bxVOHK8ePk+hnLaqcoQn6CeSkjnyAxdKSJizy8Nfyg5Qx+s2a5aO++yhucQezOWysqMuFgNaj0YeGrDQ2+2VzpQUYSdr+ufbng19KhwDWL+gZVXJRbPBu4ZXLdU9FBFpqqDxhQ9WVtV0qPWXeR/2Ge5koTYps+vzb3BUX42nMDoU1xajCKMatQWVKt5RKI9pHj7pFudRRl3XBtGddep0gxBPdkSRks0rfw9YK64atSg0oaj0VF8Wh0DtyJZJq32KbrdVAT6orjic+t8rdGJgGbmKT6arzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7afhcgom3dSGOWUu5uK4ZZv4DipC5W8MhkjaH97+CUQ=;
 b=vnGuDC3jLESEN0kBm1T8iGtBylf0/+KXsv+XDYtAWnZd+fQYhvDu5VuzZ5JlE/hsmXUJgPA8TRhDouugbD6jUPeXzMlMSKPQcj6yM6JVlgY8J6E1vPdpEX/iUp8ypXJpKz6ysW44gk/VAVmrM3nkqeSysnC78089T3iAxwAtiEY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 07/10] libs/guest: rework xc_cpuid_xend_policy
Date: Fri,  7 May 2021 13:04:19 +0200
Message-ID: <20210507110422.24608-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4ff7b6-5865-4937-93a7-08d911484ae5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4475E290E5F4A3C385DAC39E8F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aij6rlKiWijTiTV7DBdQe++PiZyMcSpgPb+tt+GQ+Dhadg4vmNtDPrflPhjW9n/LiYMg4Jke/wF9v842+KZtPOJ7+V51SnuRicSWIygvtL5utHkGrrzeXslwCtL6KLHNCuovWCA6ovMuV7jGRpWu891DzpUwM3mVmC6rGayUxqjOCRobNNOkb8o7jugfVN1JxAWpgTWoGxgKkin2eg7IDHgQDOy85zN3iQjeMwlAI+OtooG8I6gbciWczphfXvR1VPRBMpZLlE8JXPFfN8xeY6FA5Fyiu7LmD8wrSPySVPrYT3eoip7gB9IdEXg5OfKlMl5QKKOSGDmzTtC2b6NG4VS2M27IIycCc3Hp1LgO8SR15wOwRO+kx6awpGYEXHR0kmNovRNTe2oZZ2evEd+xGyDc1R3kB0wsNHYIBc6bKEa+HynkAAIpVuvZel0uEOM9krg5/jykbixe0ESEh2pUJLMDQnry+RcHRf3bXMRml5FRYClqbP26jGMbxPpfLrrwvoUuYjGJ6+qlyldrW5nVBGGyMw6PHAfdxmcP4LUXzvdO2F6LdG+wJ6I6DAvJbBjKIFvgwmed0eE4DsK7gEbMUBQ3g5H4XMmF02/6jfvNnNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(6666004)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q29zVnhUY3MyaVplc3E1empjbW1lNUx3MTZOeDl0QTl1MlgveWdlQUxPR2xI?=
 =?utf-8?B?bDVWckRGaU4yeS8yakdLQ2VVUGc1RDY0SEV4NFl1bHU5eVhkTElPc1RSTVRH?=
 =?utf-8?B?N3pUMm5kNzA2cC9MY25iT3ArbnJvMXdkaFFGb1IxMjZWRXBxQjZlUHV3OVJH?=
 =?utf-8?B?b1hJNzg5WWxLL3B2ZzN4UW0wbFZVYmIzcXM4d0ROSEtzNGJPNHRLeG1sWmpS?=
 =?utf-8?B?eUFPakNBM0Z5ZUw4WTlxc1FxdlY0SUJmMDF6QXFDbWNWZUZwYkE0cXlDaXVS?=
 =?utf-8?B?ZXh3UGlOWkVrcDlPbWZ2Z0VVandiUUhSbnp4bFc0YmxlL2hKQ0lCTkVaSnFC?=
 =?utf-8?B?UUs3SDBlK0gvcFBaOGdTeVJ4YzF1dFRIbys2VktTcnFmaDBiNTd1UnFyZnND?=
 =?utf-8?B?S00zR25vOURhUFkrWjVkR3JMWnFOc2gwTk1Od1RSdHNrZHVQSW1FUVppa2lw?=
 =?utf-8?B?bEtJc3M1UDBlZ3RoeStvOE9pZkJlaE81cDhMNUJFY2NvOVJTYmZUZXRua1BB?=
 =?utf-8?B?ay9XZDVIS3U0b2Q4ZDh6aENVOVRVcmFDVnN1RWNxSllKUWZkcEdVd0UyaU9I?=
 =?utf-8?B?MjRnUSs3SmlJRitRUnNtMEhEOHJ4SE5VczN1RTVVRlpzTDJldmZVRkNHMjJL?=
 =?utf-8?B?TmFiT1hJcVdxSEY2L0dkRnhUMDFFWDFKNTByeld3VnBQdmhDQ1BNZ0hWeWJD?=
 =?utf-8?B?UEZEby9lRVdNZlRFN1FPYzNqSWxLakhOWS9HZkpaNG11eHNac1VFSXh3MUJH?=
 =?utf-8?B?NDNkWXJnMnEzTFRyVGhyRnBWSElhbTFrK2t0ZHVoajNkamoyQ3lucXVtclZl?=
 =?utf-8?B?eXJ4U25kOHAzMlU3NVZBWmlYdEVXUlI1T3UvZ2Y5QVF4WjlSclV6MmRBeGY5?=
 =?utf-8?B?YU15S2NjamJZbnlXdVNFMFRvbVJTTTlSdWhQbmh2cFc1Y0VZZDlLemJsQWhR?=
 =?utf-8?B?YWNKSVNRQU9wWUpDQ1lTdUlEMU81YThYdXROcFR4MGhYTVN2UStGamZ6dGxO?=
 =?utf-8?B?MTBhdEd6cENXOUVFRnRPeVhFTGV1R21aQkNFdi9zcExXUlZFeFhxOEtWNmhk?=
 =?utf-8?B?akp2OHArVHF0aEpyaHpzNW9kRGNzRnVidHZjVmtVZWIzRDZRSm1MR3U2YytR?=
 =?utf-8?B?T3gvdDZSRzlsd1U4dVA1VTlaYkFpYVEvN2xHTUxpeXJZMHdCVStBdGxRNWVK?=
 =?utf-8?B?V2dPU2QyWlo3bUdORE1PNWFZVnZIazdWMnRmN2dSRFFvc0V6L3pqUTJQb0l6?=
 =?utf-8?B?Y3lkZ09tbzJYZG03d0ltUnhGazIrZzFLZ05aaHN6L1JLblJacFBQSzJKLytS?=
 =?utf-8?B?WkQzU2lSTExRT0tMenlpM3V4WitnUENYdFpaMkZ4MDlwNlJNckh0U3VLU0Fv?=
 =?utf-8?B?b2Q5M1p3MCtoVGFidks3eHBzdWorSGZtSmRXSG9PZm8zbHlVdlI0dGRUMXQx?=
 =?utf-8?B?czVDaFlFd0E2Q0czcUgvUEJ0cGg2UXVxbXN2Y0t4WUd6N2h2NXlTVW5oTVBx?=
 =?utf-8?B?UWI2R3g4N0FQaURxUS9rYjFrbkhzNnNwTlJ5SUNQVmQ4azlUcm15S3ZwTlMw?=
 =?utf-8?B?c2RxclBrWHNhTFgwbGhacWEza0NFMXpza3Y4YkdrN0hZWVUrY2tBZjhaZkxl?=
 =?utf-8?B?V2dMWVNFUkRVS1dpUFlhU0pXZlNwS3FoMkFTS0RHWGt1WlJjclloNXAzZWg2?=
 =?utf-8?B?ckppNW1mb1ZVNVJqMStxWUgwT3ozOERnUVUzZjVZWWMzT1J5WEVJY2NSdWdw?=
 =?utf-8?Q?jVQMBeHfqjPrGNT+oBrjQbFXYeMTLMWGiDS/L/F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4ff7b6-5865-4937-93a7-08d911484ae5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:24.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9aDeQb/0NbiazOuZBiFXOYFwActkUD9NuWiO+6uJbDLdDBQOxZ2rFXtNWXEi9bct/BW+yJ2mH7Mp5lNoCKbfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, as the
callers should have the necessary helpers to modify an xc_cpu_policy_t
themselves.

The find_leaf helper and related comparison function is also removed,
as it's no longer needed to search for cpuid leafs as finding the
matching leaves is now done using xc_cpu_policy_get_cpuid.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Drop find_leaf and comparison helper.
---
 tools/include/xenguest.h        |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 200 +++++++++++++-------------------
 2 files changed, 83 insertions(+), 121 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 6fe01ae292b..3e2fe7f3654 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -762,6 +762,10 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                   bool hvm);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 2c89c59cccb..65b49753d3e 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -263,144 +263,107 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-static int compare_leaves(const void *l, const void *r)
-{
-    const xen_cpuid_leaf_t *lhs = l;
-    const xen_cpuid_leaf_t *rhs = r;
-
-    if ( lhs->leaf != rhs->leaf )
-        return lhs->leaf < rhs->leaf ? -1 : 1;
-
-    if ( lhs->subleaf != rhs->subleaf )
-        return lhs->subleaf < rhs->subleaf ? -1 : 1;
-
-    return 0;
-}
-
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
-{
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
-
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
-}
-
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
+    xc_cpu_policy_t *host = NULL, *def = NULL;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if ( !host || !def )
     {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policies");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
+                                  def);
     if ( rc )
     {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
 
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -408,25 +371,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -434,7 +391,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -554,6 +511,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     *p = policy.cpuid;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -571,9 +532,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.31.1


