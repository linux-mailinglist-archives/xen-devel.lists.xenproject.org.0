Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE6934FE24
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103842.198082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCw-0004zO-UI; Wed, 31 Mar 2021 10:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103842.198082; Wed, 31 Mar 2021 10:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCw-0004yV-PP; Wed, 31 Mar 2021 10:36:18 +0000
Received: by outflank-mailman (input) for mailman id 103842;
 Wed, 31 Mar 2021 10:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCu-0004un-Jc
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d4ff5b2-d862-48a5-b582-cb48b6cd8810;
 Wed, 31 Mar 2021 10:36:14 +0000 (UTC)
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
X-Inumbo-ID: 0d4ff5b2-d862-48a5-b582-cb48b6cd8810
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Y/QS2yMljZx17JZ183drY6zkAree+xKrpiH8jux6JWw=;
  b=frG6LJDBgyiknhOAFavKyQNVbCg4SzbvVd7Db3SMNzAsJf41s5tdWzm1
   6ePPHcREa6ltcdlSd5wjWiiH1QvWVrgEVJ27BQyxwvowzvd8xH9tA6u59
   c9AXv05tb+ypfSyvyY/XdbIWdBEIptOPprQdQE7PFlie/C8z6hMJ7T/UF
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wWmy6Mt5kFaKYZEc499ziIdusaUiSobP3sHa3PeByLPZx7RFckDtP7NUK6rsB5rR5Z01MDGYQn
 gDQlTMyVMP69+9Mfr0zoBq74ygorLD6xSzW/9ZbMiGDr+OkLTmpxhrj+jw/Y6uQAzeR6dZLfbT
 vbXmXKBCoz2bxbMvqH/DnG92SvXZZMKkaWQWL274dsQCPjy/SMC121m244ebIGsRI/qzIFamTS
 J59KP3hZzZy6dt3Dzgai2iiqY5aw8tFiXwRH2HdCDDnPqLzpACyPkFnfKNbh9JWH9DHkAIEcA1
 B8A=
X-SBRS: 5.2
X-MesageID: 40688166
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:s/AwqaMhpKSL4sBcTxv155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEq+GXH/a6NpJ8ZAcVI3SOTXOlUmJCMVZ7YXkyyD9ACGWzIRg/I
 ppbqQWMrLNJHdgi8KS2meFOvIB5PXCz6yyn+fZyB5WPGNXQoVt9R1wBAreMmAefml7LKE0Hp
 ad+cZLzgDIERgqR/+2G2UfWKz7r8DL/aiMXTc9GxUl5AOS5AnYi4LSLh7w5HYjegIK+5gO2y
 zvkwv15qKs2svLsCP05ivowLl93PfkwttHLsSQhsYSMSWEsHfUWK1RH4eskRpwjOaz6Es7sN
 SkmWZdA+1Dr0n/U0vwgRzx1xLu2DwjgkWStmOwsD/YjuHSABcZYvAx4b5xQ1/ixGcL+OxY6u
 Zt2VmUspJGZCmw5BjV1pzzeDxB0navrWFKq591s1VvFbEwRZV2toIl8EZcAP47bVnHwbFiKu
 VoAc3GjcwmF2+yXjTctmlr9tSmQm4+KBeAWlQDocyYyVFt7QlE83c=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40688166"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlGG0Y9eRKNseB7+FnHBhySa15xNxP1ETh0dmMygh9ngtLp5nSKdmj7aykCBQbMdgfQI/ziNLQdjo3ALGF2VpvGF5p1zvEivl+1XBGAGnY7UZhY/LfG6N2O5Tr3wBDNtXttN8WjW0MbcXgpPzLStP5gxYQEEJpXnVh44cZrT3lyFrr/YmHmBQxl4uCZkpDSaCvnu2rLxqkMsZSTOMKHyT2Z54b710Cf9fnKZCDUbcyOA2iDjP3pKK2D+eSzPYjn/MreAT4TnbFZSp4rXklqljHehIVClO15YjorL7ULHnxW7ppXYPOQw5kIyIz375u6bmT5lYBmiLlXV80Y8zzX63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6xRU0mfdtEd9NzCqYmTFj08AUSTIGMnJkukMnC1rB0=;
 b=h40QaFppjkYOH9/yXCkyL04aJz/Vc+a8fvLYNJxS0AROE0Y48opzIKeNE1P2pOeM7EqhUF/hsNi56KLZZB1l21RDYtQrKtVinY4drGq0u1GFOsD5wynFAeb7b4u4dWYieW63X5SNdwuPiPQBoDD7z7cPmT8aL50wDyHIhVa+4JdeDhdl3o3cJZGEE8qriLfyA7CWsrkQcdThyHXqvW67H/3rQkNqYrQOT6rqodhFvQvrryHI1OAQNAk5u5vy00kp4UZpE0r99DdXddnvr8D54OzsFtf2EmkhxSjmz7KCNSwekV7fJEMKcRBYrhIJaCF3Lz7QtQWVidzlEKaY1HsAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6xRU0mfdtEd9NzCqYmTFj08AUSTIGMnJkukMnC1rB0=;
 b=eSKxUZIS2qix+6UTgILv27HcsYKC0RwN7Zs0VMjBKp15yGVcusXYO+1fWO/kI2DNkxR47JXl9GtanWeCfPfvux7M7HE1A4Mdf3Takd3BjZ3Gto1jvw73/XKO4WF6PYINj2HovNmQm4l+IWcA/4ctSeH+J5PlJQX4HMLUM1c+oKM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for GSIs
Date: Wed, 31 Mar 2021 12:32:58 +0200
Message-ID: <20210331103303.79705-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0102.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f54b22c-0caf-468c-47da-08d8f430cd47
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59680B755A84FAB46BDF0C978F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qV69vlMrlqyZ5belblE9aRTkOBzKR54r4QshrMwQWAeb2G4R638+S7LgF3CJAacPm7363t9nwMXV+kmwsKPYUcDwYhcspGqllPHB2xnYDfnJJX45e8YDQnE3+tuoLhDZDmENUjGYitaK+IdM2K65P02P4xQgRavU5UedA6jfFgzm+s8Cp0HpgNI+HSBt2gW+80lLHe/FzZcKy/kFDdz0IaxJmlPGtbU5lqXlArMNjUTnVm/IIhzj8xXgtymgJFO3PLrle/wKe/oH07knbTlnEFmuRNdB6+++3FD7wIgcS+vgtlLNZkCsXnyTzIFoQvmr515j1t8YuRSlAMnRQxsE5IjjlyooBl9OslXkIsGz0akvPEBk7P0IWwpRK/gWWNtg0sx/n2OVJsFdPYfXbZUTlkzv3nbp/nQfxPG7nEt314rvCzBcN3GPzVFZFyB8GZnwnMf9jqbYV2XqkPGOQB91Lk3kTc2JX02FC5AVwDwgyWokymRBld7x1jOeWq4yKRDZi0e4jC9mtjEbP839NBMXqYBsxluknwOgLGAlHHQ/eHh35+iquYq3wUT8EXYVVdB4lmBex73pvS7v9wylGlqKVnOIs70NFViv2pUHSyFoDr38D9FwLbNExjyuMjLIzZ7K9EggGhDX9Cc5yudQGycwqbI8klMMtlJY9eR4E6GNC1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(30864003)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTZuZFlMc0RtUWdvRjBubXU3bGc5V0dkUlVVYTlaRTBURDdPZGhnYmxtb1ov?=
 =?utf-8?B?YlRaSENZeDFnd2VQUWJBcXFLdGpMcTBuMnBTMW9XMXRkS2xVQUdTdHh1cklC?=
 =?utf-8?B?UGovd0tTR25mdDZCZEJKdG5EdjYxVUI5REJGOGgxVmMzcWFQdjB1dlVveEtX?=
 =?utf-8?B?dHhOZzVxa2lFRGM5OFQ1T2dFWkNQQUJVTFoxYU9oRExlNy9xOXg2QmFmZC9s?=
 =?utf-8?B?N0tTZlZOM3VRdUt6VTR4UExSMElTWXFmRlF2c2VpVVo5QUREbVZSUVJlc0U4?=
 =?utf-8?B?OTZpNUJwQXVnQTZ5d2JTd3VldWJIblByZmp3OGQ2OCtHS0FsNkt4eVN4Ri8w?=
 =?utf-8?B?Q0hwUDJ5SnAxaXJ4SlgxVE9adTNiZHhvRzZ3dVN0dFA1WWpDa2ttWjF0dUVP?=
 =?utf-8?B?Qi9UL2NjUUtneE9SYkNWQ2lGSk42cHlTWS94RGkzZElZTlhhN1lJakc5T3hN?=
 =?utf-8?B?NWFvMDRHT0FrNnZCT1hvVytxamNFVktBbWVVUTNjMWpJRGlmYkczeHdWRmJs?=
 =?utf-8?B?Sm1WQ3RRaUpNcEVhc3RTMGhBZitMbEsrOEo4UnhodUpyR21lWE1CU1Q2U2ZU?=
 =?utf-8?B?U0V5dlBlQ2xvcFVqWEpaSFo5S1JjaVBMOC8raWNXQWVXVURoVlpxdnh5OElX?=
 =?utf-8?B?ekd5cis2dWlKMTNkUjYrSVVPZXVlYk9nVzRyY2Q5TkhsOTRURTg0dGRGZWg5?=
 =?utf-8?B?eU5XRVZRek9jQWJOd2hRYWZnQmJyY0JMUER5ajhVVURLY2l6QWtLeHZML2FY?=
 =?utf-8?B?ZkM1L1N2cmJMYWNxZUFHR3RGWFoyVDNwVUtEYVl3UzArdWRGYUJDeEJFU0dl?=
 =?utf-8?B?di9KQ1JHZEtDeTNtSkZKcFFOYlVaVFRYVUc5WVlOZ01mMkErTktaMUJFd2xm?=
 =?utf-8?B?WUFoejJTMytYMzhhTER5cWRxc3ozTmlIMWJMQlMyREU5R2hmbVFMN2hsSHkv?=
 =?utf-8?B?U1V3R0JUT05jRnUzMnBBbVBWRWd3djBqOHNaM09OQkMyVFBBRGE2d01qMmxV?=
 =?utf-8?B?VStTdWJ6dzNBNWFOTWU4VDZPbHQ3NERWYkV0Wk1hbElxdjlNWjd4SzQ1T1k0?=
 =?utf-8?B?UjlKN2NHR2VZREZEUkQ2b1hVWXYvajZodW90M3pPZlhTVHlkKzBpV2UwaVdy?=
 =?utf-8?B?aUVkS01HYjlyeWE4VHdVUnFqRUdBSjJTa1o1UGs4WFNycUJwaG9oZUxrb0Mw?=
 =?utf-8?B?WHpha3FFSlY3MkJLSmpyNE51QWs2cEp0anRMVnkrSExyRFloaTBXNmltcTlR?=
 =?utf-8?B?VXc5MWNialJxQi9MWWozRWJzWEE2WnJvWVBuMFFGUGthOVJPbExaZWd0RDkr?=
 =?utf-8?B?aFd0eUdlU2lGN3N1eXQ3Mzl1cGh5Zkd1ZEUvVTBZekExSzF2UkRMZHVlNXRl?=
 =?utf-8?B?VlBjRGtwTi9uaWpzeHZ3emc3MWlnMi9MLzFNWmtTb2NMMGtMTmh2MDhTRUV1?=
 =?utf-8?B?OHpqWHVvSlExdkw5b3Y2OHlrcytWTmNnWmlaUW4rcTg5citmZHRKMFVXdWMz?=
 =?utf-8?B?SytGaGd3SHJvRGNwR3pmU21VZVRYWGdLTmQrSXlFNjNrbDhiNU1HVVZ5bkJt?=
 =?utf-8?B?M1RxOHBLNzl3QUNYcnp3US82OFlvSXFaTnNQWlVxM1F0em9VVldzRUpSSkI4?=
 =?utf-8?B?dmJUQUxDYklQOE5CelZ3U2RIRWlLdENaRHluSkpGT1lkREx2UGNHb2VISTZu?=
 =?utf-8?B?SWRGck5vVVl0K0dPaVAxVGgwRDVhekdYUE8zUEhlbmdJK1pPQ0pLYlNIcWdm?=
 =?utf-8?Q?P7FstRd3Ho00txK3cYkfJMFr1zbBPN4FAl6GSf5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f54b22c-0caf-468c-47da-08d8f430cd47
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:11.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzdZ8MiIPU753/8ugFMbGJJ/81w6i/f97lWoooA+4q4+OFsADL4AQZp523tqyFxZOLqNkHzAuzfVWnZ9HckujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Such callbacks will be executed once a EOI is performed by the guest,
regardless of whether the interrupts are injected from the vIO-APIC or
the vPIC, as ISA IRQs are translated to GSIs and then the
corresponding callback is executed at EOI.

The vIO-APIC infrastructure for handling EOIs is build on top of the
existing vlapic EOI callback functionality, while the vPIC one is
handled when writing to the vPIC EOI register.

Note that such callbacks need to be registered and de-registered, and
that a single GSI can have multiple callbacks associated. That's
because GSIs can be level triggered and shared, as that's the case
with legacy PCI interrupts shared between several devices.

Strictly speaking this is a non-functional change, since there are no
users of this new interface introduced by this change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Latch hvm_domain_irq in some functions.
 - Make domain parameter of hvm_gsi_has_callbacks const.
 - Add comment about dropping the lock around the
   hvm_gsi_execute_callbacks call.
 - Drop change to ioapic_load.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/hvm.c        | 15 ++++++++-
 xen/arch/x86/hvm/irq.c        | 63 +++++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/vioapic.c    | 29 ++++++++++++----
 xen/arch/x86/hvm/vpic.c       |  5 +++
 xen/include/asm-x86/hvm/irq.h | 20 +++++++++++
 5 files changed, 125 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e7bcffebc49..0279014e66e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,7 @@ static int hvm_print_line(
 
 int hvm_domain_initialise(struct domain *d)
 {
-    unsigned int nr_gsis;
+    unsigned int nr_gsis, i;
     int rc;
 
     if ( !hvm_enabled )
@@ -655,6 +655,14 @@ int hvm_domain_initialise(struct domain *d)
     BUILD_BUG_ON(NR_HVM_DOMU_IRQS < NR_ISAIRQS);
     ASSERT(hvm_domain_irq(d)->nr_gsis >= NR_ISAIRQS);
 
+    /* Initialize the EOI callback list. */
+    hvm_domain_irq(d)->gsi_callbacks = xmalloc_array(struct list_head, nr_gsis);
+    if ( !hvm_domain_irq(d)->gsi_callbacks )
+        goto fail1;
+    rwlock_init(&hvm_domain_irq(d)->gsi_callbacks_lock);
+    for ( i = 0; i < nr_gsis; i++ )
+        INIT_LIST_HEAD(&hvm_domain_irq(d)->gsi_callbacks[i]);
+
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
@@ -714,6 +722,8 @@ int hvm_domain_initialise(struct domain *d)
  fail1:
     if ( is_hardware_domain(d) )
         xfree(d->arch.hvm.io_bitmap);
+    if ( hvm_domain_irq(d) )
+        XFREE(hvm_domain_irq(d)->gsi_callbacks);
     XFREE(d->arch.hvm.params);
     XFREE(d->arch.hvm.irq);
  fail0:
@@ -776,6 +786,9 @@ void hvm_domain_destroy(struct domain *d)
     vioapic_deinit(d);
 
     XFREE(d->arch.hvm.pl_time);
+
+    if ( hvm_domain_irq(d) )
+        XFREE(hvm_domain_irq(d)->gsi_callbacks);
     XFREE(d->arch.hvm.irq);
 
     list_for_each_safe ( ioport_list, tmp, &d->arch.hvm.g2m_ioport_list )
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 38ac5fb6c7c..b9fa8409b9e 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -595,6 +595,69 @@ int hvm_local_events_need_delivery(struct vcpu *v)
     return !hvm_interrupt_blocked(v, intack);
 }
 
+int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
+                              struct hvm_gsi_eoi_callback *cb)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+
+    if ( gsi >= hvm_irq->nr_gsis )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    write_lock(&hvm_irq->gsi_callbacks_lock);
+    list_add(&cb->list, &hvm_irq->gsi_callbacks[gsi]);
+    write_unlock(&hvm_irq->gsi_callbacks_lock);
+
+    return 0;
+}
+
+void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
+                                 struct hvm_gsi_eoi_callback *cb)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    const struct list_head *tmp;
+
+    if ( gsi >= hvm_irq->nr_gsis )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    write_lock(&hvm_irq->gsi_callbacks_lock);
+    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
+        if ( tmp == &cb->list )
+        {
+            list_del(&cb->list);
+            break;
+        }
+    write_unlock(&hvm_irq->gsi_callbacks_lock);
+}
+
+void hvm_gsi_execute_callbacks(unsigned int gsi)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(current->domain);
+    struct hvm_gsi_eoi_callback *cb;
+
+    read_lock(&hvm_irq->gsi_callbacks_lock);
+    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
+        cb->callback(gsi, cb->data);
+    read_unlock(&hvm_irq->gsi_callbacks_lock);
+}
+
+bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    bool has_callbacks;
+
+    read_lock(&hvm_irq->gsi_callbacks_lock);
+    has_callbacks = !list_empty(&hvm_irq->gsi_callbacks[gsi]);
+    read_unlock(&hvm_irq->gsi_callbacks_lock);
+
+    return has_callbacks;
+}
+
 static void irq_dump(struct domain *d)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index d29b6bfdb7d..099c29466ba 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -285,6 +285,7 @@ static void vioapic_write_redirent(
             ASSERT(prev_level);
             ASSERT(!top_word);
             hvm_dpci_eoi(gsi);
+            hvm_gsi_execute_callbacks(gsi);
     }
 
     if ( is_hardware_domain(d) && unmasked )
@@ -412,6 +413,7 @@ static void eoi_callback(unsigned int vector, void *data)
         for ( pin = 0; pin < vioapic->nr_pins; pin++ )
         {
             union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
+            unsigned int gsi = vioapic->base_gsi + pin;
 
             if ( ent->fields.vector != vector )
                 continue;
@@ -421,13 +423,25 @@ static void eoi_callback(unsigned int vector, void *data)
             if ( is_iommu_enabled(d) )
             {
                 spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(vioapic->base_gsi + pin);
+                hvm_dpci_eoi(gsi);
                 spin_lock(&d->arch.hvm.irq_lock);
             }
 
+            /*
+             * Callbacks don't expect to be executed with any lock held, so
+             * drop the lock that protects the vIO-APIC fields from changing.
+             *
+             * Note that the redirection entry itself cannot go away, so upon
+             * retaking the lock we only need to avoid making assumptions on
+             * redirection entry field values (ie: recheck the IRR field).
+             */
+            spin_unlock(&d->arch.hvm.irq_lock);
+            hvm_gsi_execute_callbacks(gsi);
+            spin_lock(&d->arch.hvm.irq_lock);
+
             if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
                  !ent->fields.mask && !ent->fields.remote_irr &&
-                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
+                 hvm_irq->gsi_assert_count[gsi] )
             {
                 ent->fields.remote_irr = 1;
                 vioapic_deliver(vioapic, pin);
@@ -443,7 +457,8 @@ static void ioapic_inj_irq(
     struct vlapic *target,
     uint8_t vector,
     uint8_t trig_mode,
-    uint8_t delivery_mode)
+    uint8_t delivery_mode,
+    bool callback)
 {
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC, "irq %d trig %d deliv %d",
                 vector, trig_mode, delivery_mode);
@@ -452,7 +467,7 @@ static void ioapic_inj_irq(
            (delivery_mode == dest_LowestPrio));
 
     vlapic_set_irq_callback(target, vector, trig_mode,
-                            trig_mode ? eoi_callback : NULL, NULL);
+                            callback ? eoi_callback : NULL, NULL);
 }
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
@@ -466,6 +481,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
     struct vlapic *target;
     struct vcpu *v;
     unsigned int irq = vioapic->base_gsi + pin;
+    bool callback = trig_mode || hvm_gsi_has_callbacks(d, irq);
 
     ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
 
@@ -492,7 +508,8 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
             target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
         if ( target != NULL )
         {
-            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode);
+            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode,
+                           callback);
         }
         else
         {
@@ -507,7 +524,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
                 ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
-                               delivery_mode);
+                               delivery_mode, callback);
         break;
 
     case dest_NMI:
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index a69aecad912..ca484c31b6a 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -235,6 +235,8 @@ static void vpic_ioport_write(
                 unsigned int pin = __scanbit(pending, 8);
 
                 ASSERT(pin < 8);
+                hvm_gsi_execute_callbacks(
+                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 __clear_bit(pin, &pending);
             }
@@ -284,8 +286,11 @@ static void vpic_ioport_write(
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
+                hvm_gsi_execute_callbacks(
+                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 return; /* bail immediately */
+
             case 6: /* Set Priority                */
                 vpic->priority_add = (val + 1) & 7;
                 break;
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 07b1ab99cd1..0828c01dd18 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -21,6 +21,7 @@
 #ifndef __ASM_X86_HVM_IRQ_H__
 #define __ASM_X86_HVM_IRQ_H__
 
+#include <xen/rwlock.h>
 #include <xen/timer.h>
 
 #include <asm/hvm/hvm.h>
@@ -79,6 +80,10 @@ struct hvm_irq {
 
     struct hvm_irq_dpci *dpci;
 
+    /* List of callbacks for GSI EOI events. Protected by irq_lock. */
+    struct list_head  *gsi_callbacks;
+    rwlock_t gsi_callbacks_lock;
+
     /*
      * Number of wires asserting each GSI.
      *
@@ -138,6 +143,13 @@ struct hvm_gmsi_info {
     bool posted; /* directly deliver to guest via VT-d PI? */
 };
 
+typedef void hvm_gsi_eoi_callback_t(unsigned int gsi, void *data);
+struct hvm_gsi_eoi_callback {
+    hvm_gsi_eoi_callback_t *callback;
+    void *data;
+    struct list_head list;
+};
+
 struct hvm_girq_dpci_mapping {
     struct list_head list;
     uint8_t bus;
@@ -225,4 +237,12 @@ void hvm_set_callback_via(struct domain *d, uint64_t via);
 struct pirq;
 bool hvm_domain_use_pirq(const struct domain *, const struct pirq *);
 
+int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
+                              struct hvm_gsi_eoi_callback *cb);
+void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
+                                 struct hvm_gsi_eoi_callback *cb);
+/* data is an opaque blob to pass to the callback if it has no private data. */
+void hvm_gsi_execute_callbacks(unsigned int gsi);
+bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi);
+
 #endif /* __ASM_X86_HVM_IRQ_H__ */
-- 
2.30.1


