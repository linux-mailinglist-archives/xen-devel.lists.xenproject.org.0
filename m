Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331A5303F2A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75051.135031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofb-0002R0-Jy; Tue, 26 Jan 2021 13:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75051.135031; Tue, 26 Jan 2021 13:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofb-0002QW-Fn; Tue, 26 Jan 2021 13:46:11 +0000
Received: by outflank-mailman (input) for mailman id 75051;
 Tue, 26 Jan 2021 13:46:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Ofa-0002P0-Nb
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38afccda-a70c-45c0-a946-dd50e345cae6;
 Tue, 26 Jan 2021 13:46:09 +0000 (UTC)
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
X-Inumbo-ID: 38afccda-a70c-45c0-a946-dd50e345cae6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zV5p8UFyPoTSMQmezKe1+4OLo2ijl2EWElgcz3mlZ5o=;
  b=W/s44bZKgtx+PNneD1W5waOeSL8npcHo2IBh90dFUaKHvqy9Q/HNpe3U
   nlIkJ0fCHI2cu5zhdJD+aD0YSAspqwCTkpt9kcmYmPVe22rYPbSngfUPn
   NBR1ZVX8rlZBshAjUNKFTO93h7rvTgrw3ea2CTpkOU+/APcnRjq3c2mU9
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3g0MHlyjz83bFPKSEK3mrM7Yf5VPEJjGiByv0XXBxdYClo0qVrD7NHNT0X+KH8dndNpAth34n3
 2iZG4G+u30BfGWkdI09mJtMF1SBCFoQIM505YgQatM8NhET0chZWRGm+P5fIf+BUNX7bGntVZT
 2xfqJOE5RmpKndq8eeVQrZTIuIwfSPBZKK+ZQefYKjRkjMle0jDaNvDhyHokpuBTIysqZrXZhi
 JEVJ3Vxf+LkPUd0zgaQB0ZXRCleROSZmsrTWaC61JB5QAYAmXbxH8+dEEiOSr1M18RhEeaochS
 638=
X-SBRS: 5.2
X-MesageID: 36071568
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="36071568"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIQUYscEWzfUmza+yPPFNyot1r+qQBC9HGKEj7i+ZjGyvcMHtdSlimZcnP4Ssm+2pyBjBe3Mmv4zhmnyBF5UCP770m91/XLR2NVWOkzbKEvEomXQ5N5WuvLt2835O6HqSO8gVqKe1pTs5qSGN9EjtJNcy3BuJtsSXkQEgFiGgKyIrcfKA4g6EKScuPFagMfNNZtOYXVINDjL2A7Y0tZTe+chxpz0s3g7wM5//KuHU4HWP+pBlvxh2KX3GohQNhelGIxev+J3RigOGIr3zsnxqioJafjgN+pWHnBf0aFNm3Mi84Ahm4j0kyd/w07/UYGV/clsQNDivP/W5PdkYxSlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOg4CQnce8V68jgFkjekq4x4TGd9TVd2TOnMUjeWQRw=;
 b=dZuUOkllXuhDZk5nbrwONmEqSx5xxbIy9K6DJcFmJZwfUgSIXQ+B7AqdTpIwc19/BuU7PsX1ACyPepu8JQUq1qK3FTzShaH/IFq5LzyQP/KwGpoRAvtYEiZbnv1jiO5sgn3abBaXyk+ExkWb3CUhxRHwRuv3eSRxTuGTO140ARmes7sMl6ClFzCMaxbx5wyE+k1UeDTu8TTALbKs7d0LdnHYkmVfOM9k0GQWvmBCrlomOAhTIqMnww/AnxBEPp21N1RbsoTLyGHoLOZlQPWUjS82nYPM0iMZjhd6GDrfhc8qnHQY41kjFRQ9/LEdz/VpXwF53gXj5A+MptJRyrA7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOg4CQnce8V68jgFkjekq4x4TGd9TVd2TOnMUjeWQRw=;
 b=wf+wrodDQ/kyH0nzD2xKCPAIFilwWevjP6dDuqUS6R2D+US2JVVcCeV9cCxGDpCDnQqs6VCk8NryGxesCu/pF4QgauK7oAt/U0+uwDmQ9kKNl+YNex6RhoaJXiiDcyjNl5STaWHh20PnuFDUGLhgIVH5lYSGTK7URa47TuM0sH4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/6] x86/vioapic: top word redir entry writes don't trigger interrupts
Date: Tue, 26 Jan 2021 14:45:16 +0100
Message-ID: <20210126134521.25784-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
References: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad5f4f0f-e6a5-4d0c-c61f-08d8c200bac0
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32096E4D6B513F19FD725F9D8FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEWQJnQst59alvtZKhAelpI5B/a8J9WBtLPD7f4zz5rF9LtDxz5OSv7hx9ma2pCctqN+XyJxmxsilf2YsbvAGTJZ8a7qCNzIkvUQeV3of4hitGnPGBWdv0T30kL8vg/aWzf1BQ8Y00L+eYHn5XVvZrbHheeb/hJ/+HvFjYKsL14MMKtjOWEPBJY8WJckKQBY1VOunZJYdRFJ6LnhA7MGcGo/Bauh5lDPgIcx4v7PNTEksaFeudTN3yn85BhFqJmhagVBFBo4YPdSIp24fgOgelEKdEpmuNtg6saIlLKTeBYJCRiJuMP3Ip9f+nGGrPd19ZHSbgvxecxpf0ZGNgBK8YiCMcuxOVoCdyhaasi2BIrDjeyogSMCPkFD0l6OPoRD45gXJiSzLaCnS/iaVuapIrgHC2Gi0Ed8Fss4xemCMPgZeH7imwSWpB0j6pSkviCQi13vE/CN2uEHxOB+TZMeifJBhY0uC6m3LbrWLl0wzCqNkjmghIZnkO0pVO93vvgSqHWWiVMfwtoDZOnqeh27Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6666004)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(4744005)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WDZuNHExSVJnbnllczRmU3ZjNFlleU4xRzdqT05pZWNnR1NOdHZBa2pjRXJR?=
 =?utf-8?B?bHRFak0welJoWEVCL0ZOMWxGWWIzYlMzVkl2QXkwZUdiNlJWY2llMU8ramVz?=
 =?utf-8?B?Wi95VWRNdWh2T0lLYVVnQ3dmQSsrOCtjWVBmRTZUREpIdXhla2ZaWlEyREdW?=
 =?utf-8?B?WEtqWUd0bmU0SjcxeXljcCs5UHFZK1BCSGh2bjVESTd2SnNPNE1kQkFvaEpS?=
 =?utf-8?B?STZVdk52VVZGelJTSHJZYlpSKzh5TVN3MWo2OTk2Qldrc2Uvb0Z2YVFkVWdk?=
 =?utf-8?B?QW5YUWpCN1hwV2VOOVNDVWRlU0Jta2dxVkQ5QVlvWEVCSkJHbVpHOW1UelVR?=
 =?utf-8?B?Q243UCtnZk1HcEc3MDhrUzUvdi9uQ2lSNzRvZ2U5Uk1BWmJPVUgwV3QzNHRr?=
 =?utf-8?B?S2d2RTd4Y3RLeU9vL1J2YkwxczQrMHFvTFZzOEZsREtEWmdNbTFQWFVSZUll?=
 =?utf-8?B?NHRYb1ErM0Q5OU9BdzNqNFFSSGUxdStSZGx4NXNxSVkxQUtkSkFQRWFRTXVZ?=
 =?utf-8?B?dWVtWnFGSTliZkdxVWcxNDRhcEdKUHV6cUJPVHZYakFjSGFUVEJSYWxLRHVZ?=
 =?utf-8?B?MHRzTTBtM0lDOGh0QWJ3bFcydzlkTDFxSGRXZHdjWFlMQjBubkYzLzZ6OWZ0?=
 =?utf-8?B?MkdYMHNBdENrOWw3YUhPbEY3ODlzTGRQRzc3SFlMZmNnRmdwVDQvTzU3RmdV?=
 =?utf-8?B?K0lqQnEzMlkzWC9ZQ2NiVlVlUE00VjVOczJTN0J1TWY5a3ZqY3dZeVo3VlpQ?=
 =?utf-8?B?MzFEWHRtY3BEcWNyR1I5MmZnZW9EWnRXU1R5czZTMy9tR2Jqb1JXRDZ1bHln?=
 =?utf-8?B?Nzh3UFRhNHFTSGl6TFROY1dyZTRIWWxpRWRiWlFLaWtrNEY1MjF5NnM4ZnFB?=
 =?utf-8?B?T0FQSXI0K01NSVdTenhQL3N6Tnh3RmRkN0xPMlhqS1RMTTJ0cTl1Slh1Q1ZK?=
 =?utf-8?B?OHdMMGRwbGc4WXNpcmI5a2p4MitDeHR6VTlJS05jQTRaR0NxUnNIcjNYMm5u?=
 =?utf-8?B?Y2pyay9vUjRmeVZCNzJSTE43bnFaazdYd0crajBuNm1KRGxVSDBldUw5d2t0?=
 =?utf-8?B?R2lSMzYvZHNHT3Y0bkRNbTRTRGgzUEFCWSsycFF1VVhOY1FYb1BLZmt1Uzlx?=
 =?utf-8?B?bXhLQitjMlIyMVQwV29QUzZoZWhpcXFXQUE4anBNWVNmaVJUVkpETXJobEFz?=
 =?utf-8?B?d1JMNUlBRUc5amdBdkk0YWNoc0NQZHFvL3VpeGlpS1YrWnFId0pLanZtWUQz?=
 =?utf-8?B?dEprUjhDbEI3WVJackJuMlk3SC9STW5iWi9RbFhGSXBDL3pUVVd2cXQzQVpj?=
 =?utf-8?B?WXJkYmtMcTdvaGhLUFFiNkRpVS8wVWp5QkJ4WEpkcnZSdDVqYmNXcDZEblYw?=
 =?utf-8?B?TktFL2xIZ3A3WWtuSG5NOW15NHhYN1pRTjZOQktJK1hDSVpjeThrWjNwSzBv?=
 =?utf-8?B?Q3FaNGVhQ2V1Qyt4MDNKWHluOHh4Q1V1U2JxMm5nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5f4f0f-e6a5-4d0c-c61f-08d8c200bac0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:06.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xthL3nesgoWMqxwRWyUHriVQtfj97fvqY/mQcnoJkJwyidu+PFOuQ7CgA0plwYipMFRErkGlp3JLnni0dLBqeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

Top word writes just update the destination of the interrupt, but
since there's no change on the masking or the triggering mode no
guest interrupt injection can result of such write. Add an assert to
that effect.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 804bc77279..e3ee747b7d 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -262,6 +262,8 @@ static void vioapic_write_redirent(
               !ent.fields.remote_irr &&
               hvm_irq->gsi_assert_count[gsi] )
     {
+        /* A top word write should never trigger an interrupt injection. */
+        ASSERT(!top_word);
         pent->fields.remote_irr = 1;
         vioapic_deliver(vioapic, idx);
     }
-- 
2.29.2


