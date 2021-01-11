Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C02F0F05
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 10:27:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64713.114358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytTa-0001Hs-3I; Mon, 11 Jan 2021 09:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64713.114358; Mon, 11 Jan 2021 09:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytTZ-0001HT-WA; Mon, 11 Jan 2021 09:27:01 +0000
Received: by outflank-mailman (input) for mailman id 64713;
 Mon, 11 Jan 2021 09:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kytTZ-0001HO-4p
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:27:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0eefc26b-06ba-4fcb-b379-4f187223049c;
 Mon, 11 Jan 2021 09:26:59 +0000 (UTC)
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
X-Inumbo-ID: 0eefc26b-06ba-4fcb-b379-4f187223049c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610357219;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=D3GfdfjH8H7PalqT3xf6yFYI8yx+KCQtbCKsO/H1cF4=;
  b=d7dXLeLlhLAy0Q2QvZJEI61VF6+sG1zRuoDI3IWWuSbPcAMWj4ssNXbp
   hjKmlL3yg8A0T47Yj31tG/NLpWv0GDmrMcZQlfA5YsdNruZxCraNQAsYp
   nAfATabXvZA1swbkLoqPB8yB4jIB1dJlPE2Z7IGbOR5OrcAIq/OsHwd1I
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cIaMMCDAbsde45zJPIr4K+QHJarlzPWAYLpy78FhvSOGdQwX1GJwa8TZxDdDjIJuL4XKe9jQty
 UnRo02RNbFvh/HMi3rd2eloIfTtmGdpi0tVgkfBPBdu5RByy9p3lt5RI8bmhHYtL3AR9W5bJJz
 +SmXATD1dtR7VcEoS/UgbTQPgHosTXP/upLrnxSJP9Lgnet3TNFEfYFR1uvsT4O9B+aRzflnzj
 EdAYSfDFMwC8AEZAquvG7fglMjc2ISwuMdFsNh4p0cpx5ml+xaM9S3MYkOT7hZn6qFXjkipxdB
 55g=
X-SBRS: 5.2
X-MesageID: 34799006
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34799006"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caYoh5zt2LOHqBjSkyaD2JfnkwR4DZjuQVXiXeM+nIt3C0foGmDLmQGX3iBkWQ/EV3zqDVTkhZ/FqLOpEU5yuKJgTscV7DfEFv8xg9N/V3lnlPM3r7tj307YCUSjfoRTR65CnDr1k+A/HSSdZvByAy0gc7gm50J0jIKNwqlprT36bVGbMWsvb8SoOzfWd98tx117A30K4mZoNt1tWusV5/dHbva6BU7tw/48udPpAJEFefPPlexXLrbX2wy9c0VrwiwEgxHVNqx0EwzDym8wrOHycZP9R4aB4podggfLsuESaBjfkRPZqAWavWBgj/IPgmayJEgTieYqQU8Do13oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVc0omBGxQy5myioyBcmnTwUPIFu9YdivSgFQh+am0U=;
 b=BZpVqr7oCedJLfOzxIqRnvIf532qGtNTMGO5nUsLn/v+A0obNTua9X8wvZvhQKL4QIUL/RpYg0K0BgLt6T9CW0F5hWvB0UNrruAmq2kUI+c/JPkDUc11PizL0kgd0IXjyFc36V+zF9uRzumZsuVGvJ5uXgJ7o3f5ed4FyhaBI9kI7pmJ0l/QbgE0fLnqeGBj873J39w7nU33yPtP2e/Lw0dNtevEsvI/EOv1xrqjvavzep6IM1OqW0lyMkUW1Ar815ZnWU0xAcRPrvhq3sH3FXhmpA/dgEfbkDWlMWVLyM/WbIRusa0ss7Z/w9b3TVjkHCddSIQlDiIrvcJ+MjvYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVc0omBGxQy5myioyBcmnTwUPIFu9YdivSgFQh+am0U=;
 b=MWBh/yt8EVWFf5GXqasKUHOdaugIMNOjauNog7dJhlsQHJjvOIZm/qAcDe1Qwm0T2PDyof0y4Ex3RhFomUb3ONockNak0Wyc3HnWZaEWSZsPH4HBK8PhDAUBn9s5OWeVwrBcn6O5ggmAhmlVZD/hZC8Q8UeDBEqLkexgsSnVdz0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/acpi: remove dead code
Date: Mon, 11 Jan 2021 10:26:40 +0100
Message-ID: <20210111092640.98423-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c7a043d-95d0-4392-76a6-08d8b6130954
X-MS-TrafficTypeDiagnostic: DM6PR03MB4604:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4604E5B3DCE5109503432FF58FAB0@DM6PR03MB4604.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0ScVwqDAzoYRc4EeTlhrMQpvyZuMOd6y3anJJzctXb4X/RmtLs6o11Q2cDM1X+bOG4x8+bAZtDva6in6yZJ3c6pujfySuUJS5S+hyNDXmgrV79h1i/kG3ZEZV5npGIlZ179ErcSk/n81FhlXiBXQ0QyvsrBxV7AwaHEbHVw9Qod4Q9W4IeTJRn/23RZyRepumuBYe4tKUSXPZa30S1et+2NRtrX1rITc6uskdJr35KTEm6lr+fyEbI9/WAsrIunedg9NRsmJg1xEZacGBUmdDUntbJjVcyIyi8lhZhpcnQAJgOv1+PE9RBh7HXpcwB9UobuDDZdnphaXYbJ4NMECKNthkm+YnIc3cyf6movo3W5pBa8JZKGSguhfBfynRsJz0id9Fmm9Z3eLYo/2zAxgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39850400004)(136003)(186003)(26005)(2616005)(478600001)(956004)(5660300002)(1076003)(54906003)(2906002)(316002)(6916009)(6486002)(8676002)(16526019)(66556008)(83380400001)(66946007)(6666004)(86362001)(8936002)(36756003)(6496006)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?KzlKSmxNLy9mV0wyMUxhK0FwRFV4OVAwY2RiZmVVSmN2Wm5jTWhjRWpJUWtn?=
 =?utf-8?B?c2NSeVRaVWFwc0pLMVV4Y0QzdG9GVkZkWncxZVBvNzJvbjVhaWxEYmJxNXUr?=
 =?utf-8?B?RU4xcE1JNndSN1NPRXBCSFV4MEE1SENyQ2tZaERONnFqakdtd1dYWDBVWTRB?=
 =?utf-8?B?NGR2L2NDWGhtREpVcC93bGRmeXJQWXBzR3kxbWlWQVpyR3FNWUpDU0tHaVJs?=
 =?utf-8?B?SjVNSlhrTmY5NGc5aVh1MFVJanROVE8rT001dEtUNEl5ZXR4NUY3Vm5UZmtP?=
 =?utf-8?B?bUM2TVVaSnNaTm5hZVhkTUJOTnExS0x0ZTN5dko5ZlJMd3Bjamoxd21zSytE?=
 =?utf-8?B?SmtMdkVvWWIxKzV4Rm1UMFl2UVpaUnVwVHI5Ylh3aGV2OWdsVzJ1WEhYY1F0?=
 =?utf-8?B?WldubkZyY29hdTR0dDl0aFdqN1NSNzNDWFhtVnd0RkYyMGx5NGl5QW5ySHdH?=
 =?utf-8?B?WTJ5eW5QVDY0Q3RqL3pWZk9pRmVHTVpIeHdBRUNCRWhLUXQrZnRMQjhEejNK?=
 =?utf-8?B?c1pzSENBVlRvem5Nbk9LWUJyWjJDV1RUcklmSkFZTFc1Zk9sMUxvSXR4Uzdh?=
 =?utf-8?B?dTd0dGthUXFKUVdaU2hrYjBxVWlSMXFQbEJXSFFiUlZoVkYvZ1lEYlRrczNK?=
 =?utf-8?B?QUVvamdGT3FNSGs3TnlxWUFUUVRyRkQ1UVVFYnVxUjB2M0cweTFqV2hRTDVX?=
 =?utf-8?B?NzhmNmt3WVVoeWhTWXJlZTUzUjRoK2JPRkNIR0MvVWVvSVVKVksrbERBWmhL?=
 =?utf-8?B?THJ2MW1ERHVvbHUrSlQxS0RQZ3NaMlJHRkFpOGlwY2RjSm5OaHVFZk9rSWtr?=
 =?utf-8?B?eWRFeGg0MHI0SThrYUt4UFlGcWdTRHFTUkxsZVYzakdqQ0NaT09Fem5HUGlE?=
 =?utf-8?B?azhibUdCSjhxM2lNOHpocUYzMEY1UWwwL2tmV3BYVkVoa3hYTWpYaU90cHRr?=
 =?utf-8?B?YzNYcENoR0I2ZnZmbGZXRlRmSEZPT28vRXBXTTMrUllES1FOOTB1Q1NoeHdq?=
 =?utf-8?B?YjRXa1ZUc3BOZUpUeE9NbjlORDJadmtRTU9mOXJZV2E5SUVQcnN1d3djZSt2?=
 =?utf-8?B?eVRXV1dYS3lyZmlmamVtUTdHd0V1QmcwQ0x1TFZvNlYrNnEvdkZySHo2UFpZ?=
 =?utf-8?B?TW55K1d0QTFpL1VCQnlhRWNHVGJaeWZBVW81VkJ1d3IrTW55Z2xPRmcwNVAr?=
 =?utf-8?B?bjNrVi9neG1Fa2JJOVhZYU12OHRjVHdmSmQ2cEdtdjYxV3UrYTUwK2VQU0g5?=
 =?utf-8?B?WWxMclBPY3Zaa2pOY0c3NEUwNzJmNnVqaHZGcFdTb0dKakFMNE5NT1BybUk5?=
 =?utf-8?Q?VuOdtyECrwHkjqS76oKxgIVC+RNw1w+z1Z?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 09:26:54.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7a043d-95d0-4392-76a6-08d8b6130954
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoMaWrrnk474hD6e5bz9c9eqX2e5g3A6Z9SPxr4aVX8ZWOk9YSANSrCP17oE1kgXvN+t9IYjWGFx9fW/n+L9Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4604
X-OriginatorOrg: citrix.com

After the recent changes to acpi_fadt_parse_sleep_info the bad label
can never be called with facs mapped, and hence the unmap can be
removed.

Additionally remove the whole label, since it was used by a
single caller. Move the relevant code from the label.

No functional change intended.

CID: 1471722
Fixes: 16ca5b3f873 ('x86/ACPI: don't invalidate S5 data when S3 wakeup vector cannot be determined')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/boot.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 6345490f93..73a321d83c 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -389,8 +389,14 @@ acpi_fadt_parse_sleep_info(struct acpi_table_fadt *fadt)
 		}
 	}
 
-	if (fadt->flags & ACPI_FADT_HW_REDUCED)
-		goto bad;
+	if (fadt->flags & ACPI_FADT_HW_REDUCED) {
+		memset(&acpi_sinfo, 0,
+		       offsetof(struct acpi_sleep_info, sleep_control));
+		memset(&acpi_sinfo.sleep_status + 1, 0,
+		       (long)(&acpi_sinfo + 1) -
+		       (long)(&acpi_sinfo.sleep_status + 1));
+		return;
+	}
 
 	acpi_fadt_copy_address(pm1a_cnt, pm1a_control, pm1_control);
 	acpi_fadt_copy_address(pm1b_cnt, pm1b_control, pm1_control);
@@ -458,15 +464,6 @@ acpi_fadt_parse_sleep_info(struct acpi_table_fadt *fadt)
 	printk(KERN_INFO PREFIX
 	       "            wakeup_vec[%"PRIx64"], vec_size[%x]\n",
 	       acpi_sinfo.wakeup_vector, acpi_sinfo.vector_width);
-	return;
-
- bad:
-	if (facs)
-		acpi_os_unmap_memory(facs, sizeof(*facs));
-	memset(&acpi_sinfo, 0,
-	       offsetof(struct acpi_sleep_info, sleep_control));
-	memset(&acpi_sinfo.sleep_status + 1, 0,
-	       (long)(&acpi_sinfo + 1) - (long)(&acpi_sinfo.sleep_status + 1));
 }
 
 static int __init acpi_parse_fadt(struct acpi_table_header *table)
-- 
2.29.2


