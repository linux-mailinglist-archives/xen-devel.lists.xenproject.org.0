Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774ED365AFF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113804.216880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr9R-0002lu-8A; Tue, 20 Apr 2021 14:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113804.216880; Tue, 20 Apr 2021 14:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr9R-0002l2-2E; Tue, 20 Apr 2021 14:14:53 +0000
Received: by outflank-mailman (input) for mailman id 113804;
 Tue, 20 Apr 2021 14:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4t-0000xF-6u
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:10:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2858213d-19f3-4c16-9308-28276496afce;
 Tue, 20 Apr 2021 14:09:56 +0000 (UTC)
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
X-Inumbo-ID: 2858213d-19f3-4c16-9308-28276496afce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Vi/QQviJCSIXptO4sworOuxdl1wg4QnJXyCQBTzDZmg=;
  b=Eq4W+FvUTKSMUJkFf7EHCzAlYxJ77psNlup+w0owGfpBwqyBpzEYn/d2
   vZXk7VFPUhgJuI0XaOl7qUMxjJDnhJev0sDDJffslsOW1WrkXGSHhMKkD
   3fi/o7iXTvoEAIcqLICk8tmq7ZTWE/pG5QzEeIcI778a0NaAZfrWoLRk3
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wpx9aLvW0BGxBvCyrN1RMQg0zwqNHwOZN+CS7E4WCV3wl+ZIqT6SExzetTAnrXVVTAxaUrXIN2
 jRsA7Znf3E6DIy2Lk1u9jkyt7R4xe/ZfQnFCpjbxmJp1Ev9ITkqpL5vrz6lDqoBgfVbVcapUdQ
 jjf7dkZMEf0lwwcY0aB+ztX/WSeK1kv7iS7/aJuvLDBZMF7NzKFDf6uKTFYxj+dI24j7MpKeY5
 XcdMHxsk5EqVgEOCrKf6sXFUOzmzyI+lA5nj6LTcADBRqe9dwsamNfVnjNf6m1eP2FxfcGTprl
 x00=
X-SBRS: 5.2
X-MesageID: 41981601
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/yCU7q2NXLufcIbxjpmRQwqjBWhyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035hz/IUXIPOeTBDr0VHYSb1KwKnD53nbGyP4/vNAzq
 sIScJDIfD5EFQSt6nHySaiFdJI+re62YSJocub8Ht3VwFtbMhbnmVEIyKWCFd/SgUDJbdRLv
 qhz/FKrTahZngbB/7TbhU4dtPOusHRk9beaQMGbiRN1CC1kTiq5LTmeiLovSs2bjUn+9Yf2F
 mAqSPVzOGJs/a3yhjTvlWjlah+qZ/a5fZoQOCJgsgRAD3whgivf5QJYcz+gBkF5NuBxXxvvN
 7QowoxH8kb0QKsQkiF5SHD9iOl8DEy52TswVWV6EGT3vDRdXYBJOdqwad6GyGpj3YIjZVH/4
 9gm1+9jd5xCyjNmSzsjuK4Ly1Cpw6PjlcJ1dIIg2c3a/p4VJZh6bYx0WlyC5k6ECfz+OkcYZ
 JTJfCZ3vpQfF+ABkqp2FVH8ZipVnQ3KB+MXlIPjMyTyyRXh3B01SIjtbUioks=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41981601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njg1+i2ZTvkXEpkBMEL9xAtNWk3HTTXOh7kGvvpPWR3jT1rk+AsTeZfrCvyMWh/Eb2dhgP5XD5nJXCdbCo7NuDK1X8gpnrO0AahVnpkNLeOGBLH2SWGjLnCuBFrZp3DmZgXsyrRRuzHsVtDINz9BydBgK37CN4+SjotINOwZf5zumGADZzOJbrT36d4dkG8J1DDitgW1XE4WiImwLi9q+sGeaj8yq6MD9TMeEIHWU5ef0nDf/0QLmPMDNfNkMU47nr3ejBbDnKexXhzWNUKLnc2eMh4ltNOVpy0O8TVmJu8UN405gN3WnCBMduH3Bwm4pbbxfQGC+jwSLTC/pjXcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8G6ZphiMwjkLCnh/B+N1lg5s23KSmnn5KG1LwIN6mo=;
 b=oOpWZDQ5Txt/jQ6LUxPL1ulf/uUzALQKZkkrvtmnj/cfgjHMhGvr4J0V/Kf3LzWuOMplwxqP3+0HJ1FfRIP2eoOxiWmhbFmzc73BSRDTrfKRg6sgl5cpTZ+CJt1NJqFjDF/BUuNUL52ulIi93BWZZAiF2HdHwEmRtQFlB74tm/ZFkQDa2QjRHqwD6BvhElER3QvZ1OYSfPouY+IT4531m9B2hLpiL8HkBPA77QiWTZDvFTBFdske28+W0WuB+AuKwAy1Xe7mhThv1zPvY6d0W7xW/yhO+G++IOYP1GvPTbqkQgvYrl4prIxHcHtP9qFljJpfqBNZ0FU5smowNs2pQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8G6ZphiMwjkLCnh/B+N1lg5s23KSmnn5KG1LwIN6mo=;
 b=I/Lg/N8OWifczWXAsx6tCB93Je1iVplFFrk4iIgiwrb5EBr3ooIUVBbHvCNS1mAhmZcrJGUyhuzYD3+PlkzDXVPAgARGt5vy1DZ1Bf+LA3TnXCK2TBNikGL10DRBkYfhl0I/iPOO4pjUbvHSKr0evqagh6KYI5XPuVBJYm7V9HM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 10/12] x86/irq: drop return value from hvm_ioapic_assert
Date: Tue, 20 Apr 2021 16:07:21 +0200
Message-ID: <20210420140723.65321-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b0597c-efe7-48fb-b2cd-08d90405f7c5
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6000979E4BC9C94AAAF6E2D58F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koAqw+I5BsffFXgWodMN8KdbC/X0ogyAWjRXM5+7xSwBBuC1Zg1X2v6t9hWvfND1QpFTZng+E8f5vujtno+Ow0ISOS/JP3Uod65p0BQlDNjOcswIggaFFrMyso7w+7DnDlcjG+wZLZ43SCURgXd2DkyBL+nYtTPWung+4VE0lEBi03+cMSgOQI3Ik1SlTbgiUxzCOYZ9BX7yEfsWx3OFASBwbnbA7YIjsOqxtPmEbehzD4O6wg3JS7kumd14tLq2M6CQnFBZTHmwRxCHsF8jOJrMQSzxdoDtzNo/Dki26FG5m5TaU+90/0MFjmSwKxkGmfIPP+mRAuMAt8AjOjT3aA8BkpIT0gAPKJiGhV4rpSB3zBtPoKTvLNDm7oCTjDOyaEowCeaiUeVKYT9li94mI8tvTc9iIM7fP2kiYB1F7aJe85LmAMN3PnazDbCu5Z6p5/I52eJq2dl7Yeod5bZJ5cva1ceqvHxIRL0RJVhOsDeSee4gH6TZb7aRNnUu2rxCEarDuOem6rZxPSjShUcRDpB8hTN6QmkGcOdqXRLeaYrLGMT/+XdxcMFoqlbjoWw4TwyUbw0jbO0mU+4qWxjPezw1lH4fr4/n1D/7eKBAd3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXQvWVVlNkpPVUtlTGsxdEsvSW04QkZjMGhhMytBamVLN0lIV3ZZSFRDR296?=
 =?utf-8?B?a3pTRzhad2NmOXM2d2ZGN2luMzFXdmhQdjltaWZ5dWVOa21yZTdjY3cvb1BS?=
 =?utf-8?B?M1JGaUxlZjd0d0lhSkFjVkZGdGZjeWRhaTlack1zeGRLNnVLYTMxeW1kMHRR?=
 =?utf-8?B?eDF0NFczcFZJYXhxeEE4cEM2YytIWTBEK05pSmxraXFrSG9tVHN3WlN4aXFh?=
 =?utf-8?B?b2JqZmhMNkVGVUlOek00RWRjeEh0Nm1MT1BUMnpMT3BtRWVYRmpTV3VFNndF?=
 =?utf-8?B?b094ak9xZDRyc21uaUlTUis3RGYxZ1lYTHVRajdUSnJrUG9GZGFWMXhBLy8w?=
 =?utf-8?B?TGRYcWFSNSt4TndIV2lXVzRoNUdNV25wYmtMbElrK3phdjRXMHk3T2htUjFr?=
 =?utf-8?B?cjlqdkRRR2dFaUtKWTNhSGxWdkx4bDgxOEp5dmNTaUFTSEJJS2JXZ3pHZDB6?=
 =?utf-8?B?em95YlNZS2RpMTJ6d1d5dlNxQlFRUWlEb0dvbytWTHIyYkg5L0hoeXJ6cmNs?=
 =?utf-8?B?WmI2MXBtVmtxblpJVXIrZ1A4NXByR09lcXh5RTIzTU9lZHJHWjlrQjBYUWxF?=
 =?utf-8?B?c2gwRDF0T2xENzZlQi9FSVU0dGM2SURSYVp6aHpvaTJqallUcUdXam9wajdQ?=
 =?utf-8?B?L2Fpd3RuQjJhNjN4NUF4V2s5bG1QUDZHMWxPdjJtTkpXVTBIYUxHSmQrM0dB?=
 =?utf-8?B?RHF1T0taZGVGeXNvRzZ4cjNmMEFWUEFRWG9BdnNvNzJxT0NMencyTnBqMS82?=
 =?utf-8?B?Rys5elhNRk9oaTA2MDNUZ2g0NUx2YmhQUjRBYk1uQStDTmp0eUhXem9KMWpX?=
 =?utf-8?B?UzFlN3JRVUdKNHFad2d4amlnaldHNnRQb0Z2K1cvUG4zeHRJcDdzZ2F2YTZt?=
 =?utf-8?B?SU9sTzNkRFQ5TlZHTlk3REh1Q0JMU2F1ZUlGK2t2dlgxZklqQitRV0FYcjFM?=
 =?utf-8?B?ejdXMnJ6QVIrMnB2YklLWU9JOU9BSDNDM2dTKzd5WWtmdSs3YjF5RTVUbjQv?=
 =?utf-8?B?OFlFL05LZ3U4OVdjV2xIQ09PTk9XdFhTL2ZNZ1ZqTW5KbnJjTDRHQmxLcm1r?=
 =?utf-8?B?clpHTGxuZ3VJL0h3Zk4xZW9LTE8yM0NZTnkvZnQ2NGNuUkZHL2lLQ0h1YitZ?=
 =?utf-8?B?RXJ5ejhWZktHY3V5NjBOZTdMMlpUMnZoam1ZRWRDZnluMTE3Vm5iKzdnN2U2?=
 =?utf-8?B?Q2pZbUtNUmVSWWxMeWRmc3hlTkZ2dENibElBT3NPRENqdG9IYTdRb1NkRjY5?=
 =?utf-8?B?bGdiaXhBTlI4V3JmelpDS080bHFzY2ZQclQ5YnVYRHZhTStrNmRyT1BmZlBO?=
 =?utf-8?B?eG81MjV4QVNxeTU4ekQ0SHBwbFNEMTlZSmk5QzVjdEsySmRvU0VrTWdVbUlt?=
 =?utf-8?B?b2lnOCtLNkZ3TW0rNUVYd1I0N1NlaHlBV2dlYWxuWFBwNHVvU004ZnkxOGpl?=
 =?utf-8?B?RHg5RHZ1VUFiWkV5KzRHZ1pDeWliaHRNTzVBeWlWTlFRVkU2eFBiZ2ZwTnVN?=
 =?utf-8?B?QW1TMFJLNTdVa2dtVjFlbFAxc1dlc0lnd1o0SGt2ZEEyZEFiWFpHZUJYRWZF?=
 =?utf-8?B?NU5ld2VjTnVQRW82ZmFSZFZYWlZUWUUyMG1lMTczaXIzbTBsTjRCUFRVSWRn?=
 =?utf-8?B?YVBDNG1ZNzVNTkxkZHowbUFtTUN5Q1lHRmtEVjZLa2hHSUVySVN2WXhUQTh4?=
 =?utf-8?B?cEMvUWtYbG9HUlBkWEhZa0ZROUdsZWxLSmhXUk1Xdm1sSGFGTGNvWGxFaGlI?=
 =?utf-8?Q?jw1Yk2uUJ8vbeXsUf5IVSABSoJaRD4//EbdHo1c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b0597c-efe7-48fb-b2cd-08d90405f7c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:52.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXlOPkzeDOFCHxI57qG4RSNE2TSYXYksCxc0KlSuE871wK//5mKNVpTucPK5wNoYOI1YppoXDwutKNVMgNr8Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

There's no caller anymore that cares about the injected vector, so
drop the returned vector from the function.

No functional change indented.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
 xen/arch/x86/hvm/irq.c        | 8 ++------
 xen/include/asm-x86/hvm/irq.h | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index c3d8f2a786a..1c588e212f9 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -47,24 +47,20 @@ static void assert_gsi(struct domain *d, unsigned ioapic_gsi)
     vioapic_irq_positive_edge(d, ioapic_gsi);
 }
 
-int hvm_ioapic_assert(struct domain *d, unsigned int gsi, bool level)
+void hvm_ioapic_assert(struct domain *d, unsigned int gsi, bool level)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    int vector;
 
     if ( gsi >= hvm_irq->nr_gsis )
     {
         ASSERT_UNREACHABLE();
-        return -1;
+        return;
     }
 
     spin_lock(&d->arch.hvm.irq_lock);
     if ( !level || hvm_irq->gsi_assert_count[gsi]++ == 0 )
         assert_gsi(d, gsi);
-    vector = vioapic_get_vector(d, gsi);
     spin_unlock(&d->arch.hvm.irq_lock);
-
-    return vector;
 }
 
 void hvm_ioapic_deassert(struct domain *d, unsigned int gsi)
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 4e3534d4eb4..fda2f8e8ebf 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -226,7 +226,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq);
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data);
 
 /* Assert/deassert an IO APIC pin. */
-int hvm_ioapic_assert(struct domain *d, unsigned int gsi, bool level);
+void hvm_ioapic_assert(struct domain *d, unsigned int gsi, bool level);
 void hvm_ioapic_deassert(struct domain *d, unsigned int gsi);
 
 void hvm_maybe_deassert_evtchn_irq(void);
-- 
2.30.1


