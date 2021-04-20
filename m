Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF92365ADC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113757.216809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4H-00014s-Je; Tue, 20 Apr 2021 14:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113757.216809; Tue, 20 Apr 2021 14:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4H-000146-CE; Tue, 20 Apr 2021 14:09:33 +0000
Received: by outflank-mailman (input) for mailman id 113757;
 Tue, 20 Apr 2021 14:09:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4G-0000zG-2V
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b40bcfae-143a-4654-8be5-2c212677886f;
 Tue, 20 Apr 2021 14:09:29 +0000 (UTC)
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
X-Inumbo-ID: b40bcfae-143a-4654-8be5-2c212677886f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6L0j1iiPQW70GePi9+FEHwvdvq0ZaAVrpOxXuvH7hIQ=;
  b=byfWbq8+7g7HtmToX2U/qtSB3R7JWJlcji6Sa1xis5YRMY8d2hQTW9+9
   IyF5xXek6ctTkqJ8JhJ5/M1mQL9eqWyy2AL5GvzVmLo4GLdkZxy/6sWCl
   zRDzev50k14YbG2+wXhzI80H/Q7/PVfsCZVTQ5/PcwazkNm+m3whINX46
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zhkjseTqvvuYOwR7qST6apGvsxr6Xik8h2qGAqLUuc/iAtQJ3CsL2sFsACEtxUMm66VazzNgaf
 +/BoNIG2aZxbcwoEjF2sAEo2Y2834eR7/zE3DL7j9cK13rlC+0oHyWR2SdesZmlRdQ28zd65eO
 u2MxNxBI0Gc4QYoYRnJqSS2h6j/2EojTATrj9m1CKdnlWo9NWVwP9h/6ylVBAO4+Y/KQvbYPK2
 KnfZ0PoDb+45F6YU32u7AxquHJvwpKNrdLjmIZx6VUXyJmUCjXJ7MpEKN3Sjq7hN+/OXl60G4U
 +eo=
X-SBRS: 5.2
X-MesageID: 41988265
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YqHlVaF4bRfW4RtzpLqFMpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrR3TA+ZlppbQAJLvKZniChEKEDqFHqbHjzTrpBjHk+odmv5
 tIXqBiBLTLYmRSot395GCDfeoI5Pmi3OSWifzFz3FrJDsaCZ1IywtiEA6UHglXaWB9ZaYRL5
 aX6spZqzfIQx1+AviTPXUZQ/PF4+TCiZOOW3U7LiQ64wqDhy7A0s+YLzGk2H4lMg9n8PMZ3k
 Xu1yf44aiitP/T8G6n60bjq654tfGk5t9KBMmngtUYJDP2mm+TFflccozHhh8ZiqWC70srjc
 ntrn4bTrhOwkKURE6Zi1/M3BTtyzkn4XOK8y7mvVLT5fbXaRh/Lugpv/M8TjLpr3AOkfs57Y
 dwm0WejJZTBQOoplWE2/H4EytEu2DxnWAvioco/htieLpbUpB9h6oF8nhYFZ8RdRiKk7wPIa
 1VAMbQ6O0+SyL9U1np+m1mwNmbVn8uBBuxQk8bpsyP0zRN9UoJtncl+A==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41988265"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqQtk0CwPztfWf60ynG8Os+hHZs3pZ62aG7RaxLK5Mmq3EYMWfJbO4+0tc1TLZfoQ2iu+SqYtO5SFjZNiJ+zl9G4mrw6SdMzibA4JOHjgYV211dfiP4Frl5tn6yU1a4jPIid4uIsbW0s3MUt/3ZopiPXz3QOx5iMdXkeOlbqhZCGHEhpF/qStGd6Ic1FlntcQGR35JftIEmpwBjvrfJVyCncn+wkbrRZ2KuBso5klj8PiB+uQ6OZlFvQNZ7p+kDe0JoBNFOopIa0lUAQqmmOsdXVrugZQTzUnQepuxcRRl0KgoPvHhaaWdv2eFwrKLJYBK0AjNdj5t0hsWbZ6e+ueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpUsr/JnxQIEWmJlrtvNxTXkMm0vHvWvojx4g2pQUcc=;
 b=MIYlEK2t3m7btstQBZDo03dUwFN6brqNUK1zyp/FlkhtJXyBbDwvKfP0OlD9w+SM2OPlCacyzcd5WbiBxGEVGQS3DswGT4ABWIviP7wszuTWLAm416lRZ6saI+/tjMdr5yeqMhf91iu9sYRYamJLKmOqE/0bnwuHaSRQNd/+sY1zQvO4KeUMfkAPdWbsN7LQWEj1aEvdguO/Yd0tp8yOEPzKrhEd/n/4PyKRi1pBkwKMyYzTmYUq1xkpxSDN4MY7rxD6pylDJHxhBvQJY/wYB4jx/XuEYbrx6O0EdY1ci3pvHbeu5yGgd3RsXwVL0E22cwJAashi3BP6GeOPt/SPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpUsr/JnxQIEWmJlrtvNxTXkMm0vHvWvojx4g2pQUcc=;
 b=LUceU/r6nVW8V3uurI3Cl57VJTvQaSvY6BRauUYHaaXP/8Pm3jqI0O5FJHvmY+DKS5hOoez7fnoE9RyHs8kHr9mG+NqTxabZbNkSKaaolBzg3EXy8zeyUT2LoYGXdU/Yd/n+PF37LVjOtIKVzZ4kGLMoMAZgAYvqljLUXSCr2GY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 06/12] x86/dpci: move code
Date: Tue, 20 Apr 2021 16:07:17 +0200
Message-ID: <20210420140723.65321-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf3ad0de-373d-4716-2073-08d90405e7b8
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6000F0D62CFB830EB27B93088F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1tLRgrbaX5cc9IRLzM9BwJzsahNRZsJ93LOUczHqIDBGOJa+BvHfmC1+kzEU2McxOGFBGABV0Jj0wB+0cyLIyk/b56zVywMQSjNJqItUXqPiQzp+QinfLjB200E6Uq+bsXfODGVn9jIeDk4AFDJIQmuABW3iHEWUpai2qY5oDNs7U8yuIhbNHZ/lENosKAlbiQ0D+5RimtyPJiv+GQfWNEESuL/WrSGBeGAtkw2/CYfKdJSGVw309kQ4ib/22x6d1WfNiq1j/kvYRaZUyw8rPLmeBhBOdvQg70HkwmFFIROU5q3GsjVkYA7V8mIzWglbEfPA/imQnJU2ExxRtuMmGgVEdePzsHExEo6qkOc7BNzLQugyzpAWcBbJdJ3mIxDFE0PstLI+h6KEPbH+zxx1HA7FItT1SUIvZG+rSAga3co8KnXHvsxP94n7na10NAXmLVFwkhdP/9uvNdmsYOSo+SqVV4JrGTvuExnE5iFdw1RNUvaMz4qAGVjv2aXsubBVNn0yUTsWOb/xsAg61OIePa+P354eV74sr8PSoagcU07k5FLGvZDxmt7daJtrVRJuQX14DIWOx6mw248FNKU3RfJfmq5g5uS8VYL9mo+kXAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dG5jaXIzMzVhYXVBUW5WRnREVEl3VnBEWU8wYjJESG9PQWk5bk9UcGNZUk0y?=
 =?utf-8?B?MnA5ejgrOVJ4VnFhU1dRczgzNk1FM1V0eGl1V3MrZHBKNVhHZHVubk05c21a?=
 =?utf-8?B?dTdMOTlMYWZhYVNpOHdsLzg1YXQzY2lPYlB0NFhaVC9PT1V2SzIzVlNUSWxv?=
 =?utf-8?B?bXZ6WjJKUVFLTmpCeHcxTmZYQlplamp3dzFlbG1kZnlhSk82K3NaVURkbDRj?=
 =?utf-8?B?blJPQktZbExkSys3Zmk3YXhQbGhaOHVRbkxvK1ZLcHI0RjgxRmlOUWk4SC83?=
 =?utf-8?B?QjNCVFhUVFNlOGwvQTIzSkJlNk5sRmluNXlxbDBmZkxkNTNseGxIOXhSZzdK?=
 =?utf-8?B?eWdqdGRDWVliT283OXptSmF3clZOTi9QQzF2amp0RVlyejFVaGNQaWFFZ0tO?=
 =?utf-8?B?QXNHMm00R21JUnB1UUdKUEdFenIyMlNySWtyWWtvamU3ZjZmYXVzZlhwZE9l?=
 =?utf-8?B?QUpVRFRueEtLNmdFOEFPNW9mczhtSkJVYkdlamRtaGZJakYxV0dMNmFwVXp5?=
 =?utf-8?B?U1g0bUNxV04vWmNQMlFHN2lUNWhJbjF4MjZ6YVMvUlRhTVBkRWtNTXdRcnVr?=
 =?utf-8?B?QkI4OFVIZEVaQ1NiZGtsdDRDMENwUm96RVAwRnlTRGhva3JkRHhJM2M1VUNG?=
 =?utf-8?B?M1NNM0s5dWlOZk01VlA1YmdOSzY4Z1JuTWF0NnN5dis4WWx6cFBYRFVyQkJI?=
 =?utf-8?B?S1kxeUUzY3VoSjE5YVRFTkFjQUI0aG40RmtVSFVQMU1TNEdOOEZwTmY1ME93?=
 =?utf-8?B?Z1l3SkVQdGZmSTBNcDBoOHFaNGRmT2xFaEYvK0JGeTV0NmdJTmNMeVA1Z1hl?=
 =?utf-8?B?NGMwUDYwaWRUK3p0Z0FmZTMrOUR4azhPNWlvU2ZORktidVllSnphVm43a3hV?=
 =?utf-8?B?WWxkN1BzY2NmV1hNSXBQVk5TREJxMVl1NFBnQXVITmJYMkVYK1lGb1BXNHRh?=
 =?utf-8?B?ckdOTk9TRk4xckZMakU1SlF1VVljR3g3QnJJNXltRDZkb2w1UStSSFFld09H?=
 =?utf-8?B?WDVKZkd6MGNSNXpVUjFlNVVEVW5Dam1ML1BsaUdDV003RzE5czVTME9Ua2pz?=
 =?utf-8?B?ZFVrRkJZM0tiNlpHbStGdU80MGd5cXhCVmRKY1huMWRDa2sybHZMeHhpVXdk?=
 =?utf-8?B?emdyVXVMZElkNTNHeElWdWphelZqUURGKy92YnR5ZGRmSkxCOVh3c01PMVZB?=
 =?utf-8?B?RjBLa3htU1Y3S3NQM0ZvUUVycXZjS0xhblBvdmUyZFc5OEU2Nk9zL3RSQU1n?=
 =?utf-8?B?RzFsVWZLbU42YlJvZUtRVTV4NElzaDZiRTNEUG5wOEx4NXFNeHMzdjhTUE8z?=
 =?utf-8?B?YitRYXhqVVpUVTJPRmdpY1pXMlFEMnhTekIwL3JjeFpUNGlTMXJDTE92Nlhi?=
 =?utf-8?B?OWNJYysrVmd5YXhFYUp2dTAwSHQrUGd3TXhPcHh3UU9KdkpqNG1wb2NSbGZU?=
 =?utf-8?B?dHl2cG9YeHZHcmZMd25kMHduUkhMVkFzV0pLSG5mZHdXakoxWlk4aHNrZUpx?=
 =?utf-8?B?dzJ2MlVPVVJjb0RVbzhQampXNWdxeS9idHF6SzRLcWJ1TWd0YzBmRWJjTlhy?=
 =?utf-8?B?dWhWL0pYVEZLMXJKVHdzZVFUbjhoV2dJQnVDRFVoOTJYdWFiSi9LUlJHRlJ0?=
 =?utf-8?B?ZStxanRnK3I1eExqWlFubG50eC9yekYycXNQcVE2UjdmMjFFUXhKRWdMQ3Rj?=
 =?utf-8?B?ZVhYeGpPaWxIbksxclZ3Uy91WVZtYkJJSWF1MDhzT1RLUHhqai9yZVU1Slll?=
 =?utf-8?Q?n8N7ctH4qhEPhkULMpaZUzPIPy4d9H+T01Lr5lt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3ad0de-373d-4716-2073-08d90405e7b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:25.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67TMlg6cG6+8pgAyISVinxZF4Pg8j8pCqtTngRllmZbVZSteeG3WnfHX+IvqMskAgIp4D8ywzBZ9clOALq6CXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

This is code movement in order to simply further changes.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Drop one of the leading underscores from __hvm_dpci_eoi.

Changes since v1:
 - New in this version.
---
 xen/drivers/passthrough/x86/hvm.c | 162 +++++++++++++++---------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 8f78c0935b9..0db26e5dbb2 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -205,6 +205,87 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
     return dest;
 }
 
+static void hvm_pirq_eoi(struct pirq *pirq)
+{
+    struct hvm_pirq_dpci *pirq_dpci;
+
+    if ( !pirq )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    pirq_dpci = pirq_dpci(pirq);
+
+    /*
+     * No need to get vector lock for timer
+     * since interrupt is still not EOIed
+     */
+    if ( --pirq_dpci->pending ||
+         /* When the interrupt source is MSI no Ack should be performed. */
+         (pirq_dpci->flags & HVM_IRQ_DPCI_TRANSLATE) )
+        return;
+
+    pirq_guest_eoi(pirq);
+}
+
+static void __hvm_dpci_eoi(struct domain *d,
+                           const struct hvm_girq_dpci_mapping *girq)
+{
+    struct pirq *pirq = pirq_info(d, girq->machine_gsi);
+
+    if ( !hvm_domain_use_pirq(d, pirq) )
+        hvm_pci_intx_deassert(d, girq->device, girq->intx);
+
+    hvm_pirq_eoi(pirq);
+}
+
+static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
+{
+    struct pirq *pirq = pirq_info(d, gsi);
+
+    /* Check if GSI is actually mapped. */
+    if ( !pirq_dpci(pirq) )
+        return;
+
+    hvm_gsi_deassert(d, gsi);
+    hvm_pirq_eoi(pirq);
+}
+
+void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
+{
+    const struct hvm_irq_dpci *hvm_irq_dpci;
+    const struct hvm_girq_dpci_mapping *girq;
+
+    if ( !is_iommu_enabled(d) )
+        return;
+
+    if ( is_hardware_domain(d) )
+    {
+        spin_lock(&d->event_lock);
+        hvm_gsi_eoi(d, guest_gsi);
+        goto unlock;
+    }
+
+    if ( guest_gsi < NR_ISAIRQS )
+    {
+        hvm_dpci_isairq_eoi(d, guest_gsi);
+        return;
+    }
+
+    spin_lock(&d->event_lock);
+    hvm_irq_dpci = domain_get_irq_dpci(d);
+
+    if ( !hvm_irq_dpci )
+        goto unlock;
+
+    list_for_each_entry ( girq, &hvm_irq_dpci->girq[guest_gsi], list )
+        __hvm_dpci_eoi(d, girq);
+
+unlock:
+    spin_unlock(&d->event_lock);
+}
+
 int pt_irq_create_bind(
     struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
 {
@@ -860,87 +941,6 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
     spin_unlock(&d->event_lock);
 }
 
-static void hvm_pirq_eoi(struct pirq *pirq)
-{
-    struct hvm_pirq_dpci *pirq_dpci;
-
-    if ( !pirq )
-    {
-        ASSERT_UNREACHABLE();
-        return;
-    }
-
-    pirq_dpci = pirq_dpci(pirq);
-
-    /*
-     * No need to get vector lock for timer
-     * since interrupt is still not EOIed
-     */
-    if ( --pirq_dpci->pending ||
-         /* When the interrupt source is MSI no Ack should be performed. */
-         (pirq_dpci->flags & HVM_IRQ_DPCI_TRANSLATE) )
-        return;
-
-    pirq_guest_eoi(pirq);
-}
-
-static void __hvm_dpci_eoi(struct domain *d,
-                           const struct hvm_girq_dpci_mapping *girq)
-{
-    struct pirq *pirq = pirq_info(d, girq->machine_gsi);
-
-    if ( !hvm_domain_use_pirq(d, pirq) )
-        hvm_pci_intx_deassert(d, girq->device, girq->intx);
-
-    hvm_pirq_eoi(pirq);
-}
-
-static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
-{
-    struct pirq *pirq = pirq_info(d, gsi);
-
-    /* Check if GSI is actually mapped. */
-    if ( !pirq_dpci(pirq) )
-        return;
-
-    hvm_gsi_deassert(d, gsi);
-    hvm_pirq_eoi(pirq);
-}
-
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
-{
-    const struct hvm_irq_dpci *hvm_irq_dpci;
-    const struct hvm_girq_dpci_mapping *girq;
-
-    if ( !is_iommu_enabled(d) )
-        return;
-
-    if ( is_hardware_domain(d) )
-    {
-        spin_lock(&d->event_lock);
-        hvm_gsi_eoi(d, guest_gsi);
-        goto unlock;
-    }
-
-    if ( guest_gsi < NR_ISAIRQS )
-    {
-        hvm_dpci_isairq_eoi(d, guest_gsi);
-        return;
-    }
-
-    spin_lock(&d->event_lock);
-    hvm_irq_dpci = domain_get_irq_dpci(d);
-
-    if ( !hvm_irq_dpci )
-        goto unlock;
-
-    list_for_each_entry ( girq, &hvm_irq_dpci->girq[guest_gsi], list )
-        __hvm_dpci_eoi(d, girq);
-
-unlock:
-    spin_unlock(&d->event_lock);
-}
-
 static int pci_clean_dpci_irq(struct domain *d,
                               struct hvm_pirq_dpci *pirq_dpci, void *arg)
 {
-- 
2.30.1


