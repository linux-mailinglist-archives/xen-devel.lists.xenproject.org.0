Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A941303F2B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75054.135055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofp-0002bR-Ex; Tue, 26 Jan 2021 13:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75054.135055; Tue, 26 Jan 2021 13:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofp-0002ah-9m; Tue, 26 Jan 2021 13:46:25 +0000
Received: by outflank-mailman (input) for mailman id 75054;
 Tue, 26 Jan 2021 13:46:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Ofn-0002Zg-1u
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b18f3026-a1ff-4350-8151-e7f68628931f;
 Tue, 26 Jan 2021 13:46:20 +0000 (UTC)
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
X-Inumbo-ID: b18f3026-a1ff-4350-8151-e7f68628931f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JvRvsHHvH7pmKkTxhEwl0srUY6VJQz4q8V1tghBlLzQ=;
  b=X6dUWrjMmsB6KwW6a0vttLdPXDYDHe0txDGNlBEVFvcttos0YC3D+VvR
   mnCJS7WTUwdmARzPsM7zUyf3kE/JciXTcsEE9QmuTL+jpsnFK2cqc586N
   krZ7TsJK7TpOGL6zahPR8DEJ51KQQFGbBtTz6U0Fv/ldQmoSa86N/TNOh
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qR/5MSr+HtpjAaQUVpqKQiPOckkx4J7t+1xd1cojpHnJJ+c2EonPZz7B6ydDGgpnu93zpJjWCP
 FNWWCyH557PXvHSORTr0LasNV8H0y2MUw2P1oTmLwpBfuo3EmI45Xq2d+VhuOZg3dNbkxW28+S
 y5gRdRhGfBzMcFyXN6iCFj1AfqeP8yaqaVzIYvCr1IPu1eTVMubBTFO7h7kOjPTldTP7xeKShX
 wZSkMQwC2TCswBnss1u2A56gHbtDCvpMkJlBwUyg3GXWdE5Qqfc8fLYULNN67ccgEPA4JowzQW
 un0=
X-SBRS: 5.2
X-MesageID: 37178127
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="37178127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnsplQ0GHmSVg/79U6wCeEkztiHlNBGJFIa30K0fmyL5JX1e1I6g+KEsaM9B6AC+7Vhn6iYzj5LlbQ2ttSKC5l1yrLefni+N1NNEnGgoRevse1YdDYsxwUttjHDUMvez2Skokk7PG7pzJtHHUMflyhfh/u3clkuLiMWM2ljUSNOXU7GRBzGzQjJtD7N1bnvKGVsgmk1EmPUmUm2Q1bCRHHOXPcYD0j2hHCKrnDW5JnLMA9S2EtUlEx4mXwHmOlUPnY2aI05FzN0DI08ug1B52tWUzCQbo7IzON16JlE2/J8TGX5J9p/PBdzUXax/sXCYx5mHceyrCcv9pMFpfUOCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk5/Yanq7YakWGqtSzKO9ebXzxAHQDzGRCoPFe7bjPk=;
 b=hMKPH1ipHxbIim+vyQAAPLE1x5xP34aMPQAFeiliirlwiZGKAdC/TrjBEQHd/grhaJfGz2sIpNlR/ob+5E7qHKzntVhuVqAM28TgJMPFeSTmzl9Ij8sqSe7Ze+Z+92RjSET+oEaTZwJSKM34HoTYnrfC6x8jD1EdvzBDcoMC0cr68noG2/6oA3bJf+IHDIOLZfF2PEzlny/8LzU4WVKxP176MVAMu4vBuqz0SR0Ds5kjffevaHs0Itvqy6NREDcOsxw+20rxS/Hg+Izi4Y92pa1CdKHnLvLAzUEx4UbESd1FPAdRyWY6QGjL7vquTCE9D1Yr39Z3K9kfkfD9lwqLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk5/Yanq7YakWGqtSzKO9ebXzxAHQDzGRCoPFe7bjPk=;
 b=RnCl18kmUiFu9riztXTiIw+KwZ6ny50HYD2CRKAIkXgTJmt/0g/z2SX+GKtX1KjokMTX70vlC5itthZLbgyTxuLK1VzSM6HGhWMm2V+pmkk/ki5H6WyyP25RFJ6u+MJHKutnJBMO3+S8HfrF0jQYoxsWO9ZtxjUDIlATSDLBeDs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/6] x86/vpic: force int output to low when in init mode
Date: Tue, 26 Jan 2021 14:45:18 +0100
Message-ID: <20210126134521.25784-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
References: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7817bcd-014c-4455-263f-08d8c200c194
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3209A0FBC4826742F114607D8FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxOvEM0AcBDLo3uJ4HWaMLhGfwAKkHc4WuU1gqTAbCkq0Q017ksuqbe5+z9tMvDRy1eJioagvcQSHPDrPYBbLjUdr36p7/mzFX01IIBnrtAVCztBS0Oo89SoESLCIvVE9ZmC+Sk+0nEBiFC2kRMKX1NhFR1UoUcEZkxtR5ofYLRkqfdeSy7OCRbW59McwYVS8ZpgQHXO4rw4wAVDWDDmMY+J62+3cN6WQpL6yTGCoqQNjRaO5CcdWUXKTfNIVbRIJYvyEZbDRn5DWOBMgw+mpwBeGQileDwuN1iZOXEqf1LwWu0SVUbfbLcmj2LkXhpcqO47WhWigLSCUcsr3DfGLvSQ8XoshRzQ7FXrEt1eX6eS/czSNmM9axR9pmBReWpCq19FiMjfKLSrKSlSwBCg7BZc4+5y3996zrcrKw0hGb+JWJNxqr0yHxwZOy5kPfglEIaIpVX1n6qLOSHDSVivLOjaGxwvpgAYunisM+JWeMMc4c2BUx2Sci5tYEY7VAqG2WWX+/BpUZKm1aVcz6tRAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eTQzdGhJenlXZGI2SWdyL1JSS29HRVBYdHN3ZG1PZERJYVQ0QzVxZmpSWHhZ?=
 =?utf-8?B?YlMvYTVYcjA2ZW93TXBERTJXSDdDREpQaDNLRmExNm1HTFpSNlVTNzVRMTc5?=
 =?utf-8?B?Y1ZIcndCV1dqSXZheFRtTkpyOVJVb2lRVWRFMXpaTVd2a01YNWZ3dVIrT3VK?=
 =?utf-8?B?M3ZQL2RvbEprdGhtTmxxcjdCVnRmMUduK3VuYUxUQnE1cVFPcTl5VEw1SW00?=
 =?utf-8?B?NHJSSzllUG9oQUpuN1pjU2VsdUdGYVVzZzNubFNFTW1rcWJUakF0N25kT2d5?=
 =?utf-8?B?UlBBbTZKNnFmYWJ6TkhiVXMxNjNXWVRMQ0xFYmFQaXNubjJyQkp5bXMrSTl5?=
 =?utf-8?B?UWJOK0twc3NwT0paOGZ6MEs2UEhSVFdoZmZQVWhWbGFSMVRPZmtDQWltS01Q?=
 =?utf-8?B?VkdTenAvaXZOSUFkN2lZWlRBZWRSUzdidDJDUVNmdEV0d2dhejQrSE1mdFZ1?=
 =?utf-8?B?VkFkQUZHbC9Kd20vZTFxVmpKWm5XaHQ4UGdwMW9CcFFIM3pRKzFBbmEvSGZJ?=
 =?utf-8?B?bUkzanhhWGJaMjNIZ1VhWlMzMnJXcnpCZnFGTmNuUlEreWdnRlRGSjZLU283?=
 =?utf-8?B?Z0RDS2RIdDJ2MzFRMFhxRlp2N2EwR1loKzA0dW5EMzd0NUlkczZOdEtNc2Qw?=
 =?utf-8?B?V1E1d2t0SjJnSmdnSU82UUlMZllzNzdTbEVlSyt3YXl0dnR5bTRlbzhkaXR0?=
 =?utf-8?B?cERGU2I0bUJWOWN4U0ZHSGVLTUI5QXdLVW9ZZjNKVWM5c1ZKK0M5U1pvUktK?=
 =?utf-8?B?VzA0SDdjZTRnUXNaUGJBWVZqajF2Z3drb3pHUDBrUGJqUzdDVVlkc1ZSMzJD?=
 =?utf-8?B?U3hBSUdtTis3Nmt0Q0d6RHBuNU4rZTJmRTJZUThjUmlxRjh5ZldhZXNLSUtH?=
 =?utf-8?B?MEQ3cytLSGFJNUswQy96MjUxa1crNmt5K1RWbHlJWEYwM3kvTXdTRDhUNmtl?=
 =?utf-8?B?RGRkOGlDNVN1WlZSNFg1THlRRXVLWFFHT2VlaUVKU214NVc0OE4zM205R2VW?=
 =?utf-8?B?V0lrU0FpZDA0UGswbml4VWI3N0JVdlBkMWNBMmY0ODFUUjFyLzhaNTdvcC90?=
 =?utf-8?B?b1VWMHJIQlF3aStyK0pZYzNMZ2h2VlFYa2tQVUpMdG1nYWpkdzFHdTFKYUdz?=
 =?utf-8?B?NEN3M052RnZqVE1aMWpWY1Z2UytFMTc2SzdldDFzTk5DYThoVFVpdEUzZytQ?=
 =?utf-8?B?dkFvMmtlbFhReThyNG5RdjBoSk1HSFpydUlZK3dhOUxNOEhMWTU1SHZaR0Ra?=
 =?utf-8?B?eWljdkc4REI2RURQUGMyK3BTNGttYTBIVC8wTnFOdyttVGFGd3FmakN4QzRu?=
 =?utf-8?B?UXFRa2xKc0Y1c3pQaWlNc0FYZ3ZRWWtrUVdEbmJ1OS9NVXpDNTU5TVJKSkdh?=
 =?utf-8?B?TzRZb0FKTFBjbXJKdkZ6SENmczRQaUNvSm53bGp5WFVDU3JGZ3BTWkUvWkd1?=
 =?utf-8?B?WU9tSmdzRGhDeG9DYjRMQ3QyVzlCZlJDTHZ1Qm9BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7817bcd-014c-4455-263f-08d8c200c194
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:17.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IV+MFGKpHgDJE3PIwnzhqW7hrVKP+SFj5+HmgBfATm1QQwpp8a/YOMuONcy3KXy5WiOtPFyjrEsvsWJQdUlsHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

When the PIC is on the init sequence prevent interrupt delivery. The
state of the registers is in the process of being set during the init
phase, so it makes sense to prevent any int line changes during that
process.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/hvm/vpic.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index c1c1de7fd0..9195155ff0 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -101,11 +101,14 @@ static void vpic_update_int_output(struct hvm_hw_vpic *vpic)
     irq = vpic_get_highest_priority_irq(vpic);
     TRACE_3D(TRC_HVM_EMUL_PIC_INT_OUTPUT, vpic->int_output, vpic->is_master,
              irq);
-    if ( vpic->int_output == (irq >= 0) )
+    if ( vpic->int_output == (!vpic->init_state && irq >= 0) )
         return;
 
-    /* INT line transition L->H or H->L. */
-    vpic->int_output = !vpic->int_output;
+    /*
+     * INT line transition L->H or H->L.
+     * Force line status to L when in init mode.
+     */
+    vpic->int_output = !vpic->init_state && !vpic->int_output;
 
     if ( vpic->int_output )
     {
-- 
2.29.2


