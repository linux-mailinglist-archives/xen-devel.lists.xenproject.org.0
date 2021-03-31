Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668734FE25
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103852.198095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYD9-00059p-G1; Wed, 31 Mar 2021 10:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103852.198095; Wed, 31 Mar 2021 10:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYD9-00059H-B8; Wed, 31 Mar 2021 10:36:31 +0000
Received: by outflank-mailman (input) for mailman id 103852;
 Wed, 31 Mar 2021 10:36:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYD7-0004un-G9
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ebcf666-c292-4331-921a-0c4d40323d28;
 Wed, 31 Mar 2021 10:36:21 +0000 (UTC)
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
X-Inumbo-ID: 4ebcf666-c292-4331-921a-0c4d40323d28
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=G6eLB2/DpmPMrCYF/OQauXM9+ZdnMyF85mx9b/zikNE=;
  b=Gk6GOavTncp8Q66d8nLbHVDTxWR8uAQaBksnFFUqhnYOpjg/6LeSQ2+6
   ozCDHdc8shkOkR+oAFx5r87B49Mk/vaY6Wyw1J71xrCpssTGB67Rmrl6U
   Al33v4pEadg/1LT9bNgx0vaNjsDPzSnRVmixDpWJx/6fs71kO7/yUhUYr
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WyPNu5IIhJ6yPNAk93xEijNLhrSkvJsFi68KvRM7XH5BvO/FoNqLy88K0wesJMofLw+OwMWiv0
 fqQ2j+5QKHI0J28RD1mXb2u+wvB9ho+DRvMgSbXHpqO/D3M77KEvDV+15TvAAktxIeM+9G522y
 x2RmiKswoH+DPdFLSW82EtWrE4xNIiFQFmPPFV8ZEK8Jf2YvwJVZvbcDgP1hHni4eyEPDO0Cx2
 zuB+R6bYEKdAy46HyZwx/ZS74YR9t5W1T31VWUAHFhnTXbU19rMdAufMn1D1zryctxr+0gSBY6
 Izo=
X-SBRS: 5.2
X-MesageID: 40545499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9NCh2KrpzMv1gt5H5O1PZCoaV5vxL9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LRy5pQcOqrnYRn+tAKTXeRfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYaNi++HldtTAdLQboVfa
 D92uN9qzCteWsaY62AbxFoY8H5q8DWj5WjWBYaBnccgzWmty+i67LxDnGjr3Qjeg5IqI1CzU
 H11zbXy4/mmPG9xx/a2Qbonu5rseqk8PRvLoihjsAULx/llwqnYp9wMofywQwdkaWUx3sB1P
 XKvhc8L+R/gkmhAl2dkF/W9CTLlBYo9nP4xleTjRLY0LPEbQN/MeVtr8Z9UHLimi4dleA56o
 1n9SalkqASKhX6kCH097HzJmlXv3vxm1UOu6oulXBFOLFuD4N5nMgk025+NowPJy7+4JBPKp
 gUMOjsoMxbdl6XdBnizw9S6e3pWnwyGyGPSVQZtvqU1CBLnGt4w1Fw/r1noks9
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40545499"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6R1bRtfnaMG1VyI6gla0ZC2OzHY9+J0GJhXzmaZVnDwvyCumRpjoCwxecgK5cyRVoG5sEyakI0U/Uw3F8PLnKC6ZKToj023GioXMOeY4D68Kie9kqxSfcbfy/Wnw2wrHeSyA7umDsnWUN2fwREd17yTB+Mulyf375zHAMPuQYKRsCZrsfgY0IgwLdOWMhnn+0XIRBl6LpB2dU367l+jalr+l5c5I+32C4rMnOzb2cYWnHXXNDUtwbQ7PtJkC1qzvvrCSZzFYgwLB0EUtpCXeXDEAQt4HSeyzS3peC/miRSQRF5TkuoA+YLswwfZzsbdRuaB7GRTF7Q9E96FVyz3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATUqzH1qQW24zHt8gWyGrgI3bjAA4vJXVL7l6nZ/QcQ=;
 b=i0zitUg0x3h3G4KEIQccro8tRY/Y13rHr3eqY7E0bfTha1jkjzm68N3owC5tRz4FxGDVdOhRAs+S4CHIkvY2dKipNWHBGEFhb5yKRacmAht4O4WJgXv7enJBkGCsneHVXHtaxgZdqcPFZ7u6FhhcI9sNlkLMQcBgtYA6nmRdGO4WdAFootLvzyIcAJvCD++exqYhPd4zt3C/65ZswDHZslZh3M0OjifEK0tzfQvmQhyKQzzznudziENJa1XyPoK41PisEpjdEwBtxbM7BJHU3sBithCy21urXzNEPtBtoSA4f5dUsZnIyD68EfWs4KnOl9L6UujWkLfeJnxJ0O3v8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATUqzH1qQW24zHt8gWyGrgI3bjAA4vJXVL7l6nZ/QcQ=;
 b=K8+tiS5EvbJovhv80DDTBKu1pmFYZ447Vfjgxo912QYn/dl44ugnRKOmMSuEADja8c0vY0BzoFOJhLGsK0uD41nFygR01MpPRhFMi+CpUMH3rDXPEUO+fT+y2hvxel072gnuU2j6PeiBYMttuBch1L5XSLLPBhzgna7WzQw8iAw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 07/11] x86/dpci: move code
Date: Wed, 31 Mar 2021 12:32:59 +0200
Message-ID: <20210331103303.79705-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c6df4d8-d138-4cce-6bed-08d8f430d099
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5968CE6EFE7448166F53E6088F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JuB7cRfgXRCIY6UngSzwRfzM60q+bvW2x9w7sWLbpN4OpNf2ezFPfDOu5EwkK5PxFtv+NhNzpWE9V4uwkv/UbJ74DYjut67yDyLYg1Myv++YaaTdSWScMYUKLZjYM66eEBjRHF3xW+Opej9MU2N39wfpmVia1YoPKK7pvw19hfEZTe+sfCnqFhwoYQXHWzCgoOJtNJc12c0gNVD4KxctiszPDx9ekKVVRQFLbTWuksybbLeHPeWkADWApQ3S+DEBwgsTVZe3RYJKZynI9afFpwrpMQlNDkwyodRKlMdmABemtG0XsUl96KmrjDyGFrGIeilS4DEpmdnFKGCowfgxWQlRcyyXlR0qxBnuZAPRC6HzgaD7RpZwc3ZH4VV+KtWYTKnRZ9pFA+Mn2Omm40bNqRDOVp5s2l5bxn6y8DG0qtiwoYIfqBVrN3CFh4jRnoXbwvghQlusgZeHqqJJYcfHNb9S5Hz4WGA/Q1C6oqZI6zAvuPpdeh0qqWP4ye3U2mMEkDv1UJtRl/68mnuWeq8HsS2x24awsAk1rXgwUvYGxMuHYDRsZUrko2DLicHRdyyqhLI14WU+Q73iIgvRk2uROHq/DXtpnKScyuhsllhe5nExC4lb37FW93MQS08pqrHYVAuDXl3i46rnXiOLvYNd5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1lQUjgrSFZXWURhZVdDYmFqMVUvQldTY0hZb3hzMTdkVTlCWGUzWkwxZlVI?=
 =?utf-8?B?eFAyODYxZ29RWHY1RWVPSTJEcFFGMXFyWkpQQm40WG80bVFyNVpEK2xndm9F?=
 =?utf-8?B?bXZUWVY2K3dGRE9OTXFhcFRXTVlGWGJCR09EV3hVdzNrM3lRQXZSeUI4WGtw?=
 =?utf-8?B?NG4zMW5LTmhmc2ZUOGNyanZ6dVhPb3BGVkZhbmVQbFR0dlY3enJrRnBRdWlI?=
 =?utf-8?B?RHFOalc3VUNOY3hpTkRKcldrcitPRTY5MWRUNEppTi9wbW9PTmQvOXZqTFZM?=
 =?utf-8?B?VHU4M0ZmTXdybkdCeWVDKzYvMEVmT1Z3ZkpVNER0T3ljWmQvV3p1cDhxL3RQ?=
 =?utf-8?B?TWRIMHc4RzdUS3JMQjRmRG5oUW5wTm4wMG43K3VBTk4xRk5ObUFnVU1WZGRm?=
 =?utf-8?B?S3FuWjQ3VVZuV05GSzcvT2JvNm81Y2RxRmxjSWFNcExTRnpZN1dBTG42ZXZw?=
 =?utf-8?B?Tks0d0xMYzNXbmp2eHNaTWppc0VNUzZrdm50RnYzQnhnRGRtOGtsUUl4S2tY?=
 =?utf-8?B?ZnZNTTdBOSs2NC91UVhESGQ3c2lVdGNva0k0bGNUSXlLL3dtK053ZDFKNHRu?=
 =?utf-8?B?clFUSXhQVVlGVVc0WXYzWnF1QURRUC9NSlNuOU1VbHl4Sm9QbG9Bekc5VG53?=
 =?utf-8?B?L0hSSEJQOTNXLzI3c3JDeWdMQU9HcXYwd1d2U0pYZmJkTHo2YlFpQVBRTWpZ?=
 =?utf-8?B?ZDNqaWVPeGNJajhNL3ZNUW1BcllOSVdaNnF2ZTBNaHF6eXhISEFDSmxXc3cy?=
 =?utf-8?B?d2xtcnNtcWpab3B0Zk9jWjhYaUw4UkdqR2hZWFdXbnk4QStuUjR3dVRORDE3?=
 =?utf-8?B?b25ZdFg3bjNpaHRVOUhYZmN0MmI1MjhpRlJTcFBlUG0zWEdPN3F0MHFKZEdu?=
 =?utf-8?B?QWRFSkdONzlSc09vbUJuS2svbktZMXBpOWRZT0cwSUFnTE9BZ2gzWk83Z0Ux?=
 =?utf-8?B?a3ptRitSMVExa1dDNGxhbGVGVloxVXhhcmd6MVBHRFV4RlVNZjVXd3BuMDE5?=
 =?utf-8?B?eUNwbHVEbmpqUXhhWmZoQWFNYjdxUWZFWmZDWjlkdTZKVVFtejFSZ1ltRmUv?=
 =?utf-8?B?cEkvWUVvK1o4aVVNQkFhVTNiTGxORUNzSEZmeGhockN2MDdZTFZwOU9QQ3pu?=
 =?utf-8?B?WnF0WnUxUEkwYUFVc1UzblNjOTE3VWw4VnRzNkM2RDhONFlXak9VNzA4bXZL?=
 =?utf-8?B?RngwMWdXTEhGZVVhekljYXE3UHg0OTFlVWN3dVo0NHgrZDF5S3JtTHY5RCsw?=
 =?utf-8?B?OWk4c1pqMFZjNHJISXlnQWtVQlNFbDFlYzBrbXpjbW5ocmZ4NEMwNVhLWFl4?=
 =?utf-8?B?QjRaN05pdkU3TnZYcHh3Skp1blpOZWpvMFE1UmptdENSTDhxQTYzYXJmNjlm?=
 =?utf-8?B?REdGZzl0QW1HcW5YV0lBWTh5M2dablBzVHZRN3VlUGMwSHdsOUJsSDYzUng0?=
 =?utf-8?B?ZGJPVWNKcmFjazJ2V1hYRnU3dWNXYnN1Rk9FdXhJdE5ldURERjJ1RzZXbC9r?=
 =?utf-8?B?Ymg1Y0lpV1pzbTlmTGg1YlQxckJ4YnNONGd3ellDR3lPbFB4aU1RWkZGenZ3?=
 =?utf-8?B?UjlTRktJQUNkUElWMHdIRGlBc2FGaFVveXBBbnZvRVNiWkFscFpHY2VKejFt?=
 =?utf-8?B?aUlpTExWSEttU1JDM29pbHA5R0lTNC8zSDVVRVJYMWw4V002TVgxazFGRFA2?=
 =?utf-8?B?WXdGL3FzSXpQMXprVXpsL0duWWwwVmFUSVRNQjFwMWJKRkpXZk5Ndnl3VWt6?=
 =?utf-8?Q?qjBgprGTqN95ABeiWuyqUSZoPWVRECzhAPeN0f/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6df4d8-d138-4cce-6bed-08d8f430d099
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:16.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1Vef2Js+LNx3GeP55HIspzoUuNe2uflFDTbMtxBH+Pef8qaUlK8aOfyUPtqcbBem/PirJOm/QEGx4bz8th5Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
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
 xen/drivers/passthrough/x86/hvm.c | 164 +++++++++++++++---------------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 2331af896d4..ecc7d66e600 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -205,6 +205,88 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
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
+static void _hvm_dpci_eoi(struct domain *d,
+                          const struct hvm_girq_dpci_mapping *girq)
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
+void hvm_dpci_eoi(unsigned int guest_gsi)
+{
+    struct domain *d = current->domain;
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
+        _hvm_dpci_eoi(d, girq);
+
+unlock:
+    spin_unlock(&d->event_lock);
+}
+
 int pt_irq_create_bind(
     struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
 {
@@ -860,88 +942,6 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
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
-void hvm_dpci_eoi(unsigned int guest_gsi)
-{
-    struct domain *d = current->domain;
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


