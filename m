Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E75303F2C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75057.135067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofz-0002ip-QX; Tue, 26 Jan 2021 13:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75057.135067; Tue, 26 Jan 2021 13:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofz-0002hf-K0; Tue, 26 Jan 2021 13:46:35 +0000
Received: by outflank-mailman (input) for mailman id 75057;
 Tue, 26 Jan 2021 13:46:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Ofx-0002gl-En
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7072411f-a9af-4426-8466-b6aa6857452c;
 Tue, 26 Jan 2021 13:46:32 +0000 (UTC)
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
X-Inumbo-ID: 7072411f-a9af-4426-8466-b6aa6857452c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IUh0RVE8w61pnOPOiiWTKkZqV0zgf/HgssEZSrgxWxs=;
  b=eW5RdTLO6hWCZgl2kijJ+R4hfNXUSD03jN6b5LaMFK5j5hjh8whBe8wO
   TP7/YR8NkloLe50F9B9fMAKrE1/DMc1of52yzhGwtpY9IINNETF9vRh1+
   /+QxKhEknV2YfZJHRCzafLpVxNoyPJiUts/XhIQxKWKXpMF3H6iapmrHL
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bPRthZlSwnuU+7vlFLpn7h8vnrNhWd303H2gOghQaR9vhrNR1p5rttKr+y5OLvQSEhSyeywj+f
 F1L5Ozf9sVfN86fsQGfFBQGC28MwBeUl37LHxuTAw33FF3RUgOBE35GQVdkgusO3yMj3ZNPnl3
 IMoAnFvFJPNm/VluF/RgLsrOwN1b6NnY4YLmiB5IkyJge3mnAevxZmgrFJP6OPJtAkFvbOVjf8
 Ws/LAjde5dTu4H3X87uk/MdM3sE78J3V/lHKYm03XvTtAaSX8zpbRIx6wop0UreXny1+BENOyl
 Gjo=
X-SBRS: 5.2
X-MesageID: 35832614
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35832614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiBi/si0raOzLF8LpSiwHVd4D9QJSCS3dnZKzoJvO3m3YSYqT4UWayW2NjpR6o5bl6oO2/ZTz3cK95gzD5jxE2Ntktq2DQH7xiyEXeTJ4cX96POhsO7rd9DeJpHjMPFqbaGX0kQZuQWUxy4/Lh7XMLAeFUDBExlUJJasbJR+6K6RMGE68ZIs6roPM4Pe64TfMveDccnuuVRIEbb0zTKJorPkPf0nbzoBk87Iu3sVfPJm+anJywM1l7DxY/E0vufIFbI5Mi62DnVX7cpFbdJ2Axsg2T4YvmkE8G0nV63Bo9Jt7zcKQ1doRE0WYdPjIvZa1erVI45zg9YEVhFJCrJ26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/2YxvgG6p6cjj2vAugUvonXsKtSjBfUQcfmm0qKKj0=;
 b=GeZNcg3nCiqc7MjMxuNF5uHh5e0NTokEGboMLBVIJeTgqvv0qig+K6EoXNYtYs4OpcmuhMXbmB7K3UsShVEooqA9meKRFtSid+rGTfg2ZccYxrSGV6lnu1ntkgooETYBLTU/7PqeVttnbvP+I1Kf6gOe4o5nDik3at9Cw35bRpUGBIJI2xIgyAWn3d+gviC/mrgvOBi2xCEgfkc5esADu4Qk0t+xTzPkqJXG1CiwBKiyF1gTIS2PZaCwD7czH12I790j8OXco2GkSlZxZFssUPsYQk/5FzhwusCX31fXFAiQ4AxEzYMqie/1XfDLnL5uS/KK7nz6QU62PQPtzlxYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/2YxvgG6p6cjj2vAugUvonXsKtSjBfUQcfmm0qKKj0=;
 b=WoUxnWPMZBX1zXzWLnHs2zPTx1YdeYtuHMWse4jnU8Mi+AH8S+GgrUmhXhGmyj7C71X5yUjxZdqEyFiUqX2KTrYeKkZN5qTeLUJSxcjfuJ0hPRnAX4QWxFY8Dp/f8OBqufSnUGgSt9ZlUnO1gtr5AK/sstXC/ZWcqal3eAumyVM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 5/6] x86/vpic: issue dpci EOI for cleared pins at ICW1
Date: Tue, 26 Jan 2021 14:45:20 +0100
Message-ID: <20210126134521.25784-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
References: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 909f7242-960f-49ba-2fed-08d8c200c888
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB320920124CDBF73EED17B59C8FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9Kf4G15ufgIYCd2mREST3ieBgIRmZEgn+gigioPoUPeZkq/ATd80arvbWJbAx4Rs3UynQidkWIKQlx/ha08FW20T30UVmt83rlIrLkcVvGWO9z+mmQCVfX9/hshLloFewp6UBUdfXcVUpikqwEH63nBnrHOH/sqResr57Bp/UucIdocNeO3Bf6ci5yPA+RI2HoHA6i2+yRib7ewyVm/H5U52UtItQCZTDW+xGGPcHatz54VAVnqWIx7icN2nGPOdDJPPeiLSzxWXkViE5kr3dbD3n6jrotDy6C0r6kMvDsqKupb9n6Rtp1n/5Be3z9GpWuSYOwgPIOQ8NdOtMjbAmmFGxm3tMQBefBEXwAYlngFFJksNU9ARxbLOhero6ad2nub1C91/diP8bZ67T6V7P3hjfVCaZb4Tx4VueuHeqnkK1JzH5oFbQxT/7v10LgvO6S5jmLe7MfreaXGzYffvDi1kSb4Dj5rms4JotRc2X7Td3rrlt741Jt0Ix9FnDnq+zvIlZyO11bQt28MqLws/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6666004)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RE5ycEp0R0VHbHIrNk5EQUtpbzE3MGxIeWpNakE2a2oxeERYY3crVEM1ZGwv?=
 =?utf-8?B?RlJNeGYwK3NzQXNSQkFvS3I2OTBkUUc2UkxTY1gwUWtkOForYXRKWjUveFJ5?=
 =?utf-8?B?aGR0TUdVWDZ5NDIzMWpYRGhIb25qWEh1MTQwdWFpRjM0U0NrUzc2SE5ramJo?=
 =?utf-8?B?Mldzc09OS1VOV1BycXRmNDcvd3JUeVQyV09MZTJjbVRxNmFvc2pESGRkZGc4?=
 =?utf-8?B?T2NTb0JHbUI0REJNU3RQSkFkU1dvd0g5MUxJOTI5OEcxMUZzcHFoYjl2eGdM?=
 =?utf-8?B?RWJqSTBaUVAyMXNtNlJrTWtCcmZBalF2WGpqUzRCTVhLc202bEFibXJjWEoz?=
 =?utf-8?B?S2Rod1R1aUIzdW5HRVU3bWF3ZW5GSmIxdWpNMDB3aklObWlTZkZlWWdOV05s?=
 =?utf-8?B?Y0YxeCtTNVJGcFdJWnZjL3JlYlJxeFBINndrbDZNUGZuZ3EybmZJRkd5MG1P?=
 =?utf-8?B?RUZBQlQ2VFBQUmoyWTUwYS9YN1FYNU5Cc0lBdWNUYldxakJXcXlGRzZWNHRx?=
 =?utf-8?B?Yi85SUZUTXQzUVZtaUN1TGxPTW5FQVJLOGdLMGw3Y0VhWVBoQkJSQzI0VkR5?=
 =?utf-8?B?aDJ6bnpVNVo4c2h1V0VERWRPSHRtWDl6c0FWNS9qb2RDdzhkemFhZE5sanMy?=
 =?utf-8?B?RkYrc09XNUpId2pxT3YwQUY0aWkvd1R1WStabmNwZmNiSTU5eFJpcVFQa1Nt?=
 =?utf-8?B?elVvZVdVa0dFMWxxeEUxWndwQ25wMmFiblV6RytRZ3MxVU1Ha1R3cFpVelc0?=
 =?utf-8?B?QVRGK2dPNmtwMG9TYkVxdnZ5M3ExMmhOVk5DU3hhNzJ0UjNJenovcWlabEFY?=
 =?utf-8?B?b2ljNWl4Y2NheTB5MmRSeUJyYzlKN21TKy9IcU1mNTRyN2EwRmZOVVNTSEZ6?=
 =?utf-8?B?UnFCVXFlL1BuaGlJeWJ4YTcyWDJkNUtwcHVjckhpenJubkpWMFp6VU9GQjBa?=
 =?utf-8?B?Zm9QV2RyUjluWjBPendOZDR0Zk82SlRUMXJhaWh5RFgyOUJLL1RVeG51bXAr?=
 =?utf-8?B?aXJnUUVEMDZaSHBQZW5LaHdPZkYvdHloZTBjZmszR0tMY08zRmJ1ZW1rbVg2?=
 =?utf-8?B?ZWRIZnNaZC91YnBjc1hwV2c2NEsvUDZxVEszdUNQR1NNVUsrWVp3YVlxZ1FL?=
 =?utf-8?B?MlpHNnUrQlJ4RElzeGw0UU92cmlkZ2pWd1BGbEloeEk0Nm5Da1RFM29Ta3VF?=
 =?utf-8?B?dGs3UUI1NkVsWDBnNmZhYmdVQm00UTd6NXg4VTJUM0xLS2FrcFY3cldoTWdZ?=
 =?utf-8?B?cTkrMnp3S0Q0YzlCaWxiQ0o1QjBLMzc0U2x6dUZQUWtjZDFvOHVUbmU4eHhw?=
 =?utf-8?B?dW5RdVEydHdWU09QeEU1bkRlYnlMWExuRnJnK3Z0cEdIYlhmU2x4ZldxWHVT?=
 =?utf-8?B?ejh1ak1vRWpRNllHdlVyOVh5Tno3cVF6SjdrNWlWMEx1bkJnTkxQazJQYmVm?=
 =?utf-8?B?NTRkbmo2ZG9kZ1FlbkpNQkpMZVlVVlo3UnltczZ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 909f7242-960f-49ba-2fed-08d8c200c888
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:29.5391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B09+9vjU6k30frnSTFqbdc7UpmlSDJ4yUx8YW2qvMTf/iCS5X93AqHKcUi3tTQaLsssN01BIuElGDbimDyryuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

When pins are cleared from either ISR or IRR as part of the
initialization sequence forward the clearing of those pins to the dpci
EOI handler, as it is equivalent to an EOI. Not doing so can bring the
interrupt controller state out of sync with the dpci handling logic,
that expects a notification when a pin has been EOI'ed.

Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Remove the unmask label.
---
 xen/arch/x86/hvm/vpic.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 795a76768d..f465b7f997 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -197,6 +197,8 @@ static void vpic_ioport_write(
     {
         if ( val & 0x10 )
         {
+            unsigned int pending = vpic->isr | (vpic->irr & ~vpic->elcr);
+
             /* ICW1 */
             /* Clear edge-sensing logic. */
             vpic->irr &= vpic->elcr;
@@ -220,6 +222,24 @@ static void vpic_ioport_write(
             }
 
             vpic->init_state = ((val & 3) << 2) | 1;
+            vpic_update_int_output(vpic);
+            vpic_unlock(vpic);
+
+            /*
+             * Forward the EOI of any pending or in service interrupt that has
+             * been cleared from IRR or ISR, or else the dpci logic will get
+             * out of sync with the state of the interrupt controller.
+             */
+            while ( pending )
+            {
+                unsigned int pin = __scanbit(pending, 8);
+
+                ASSERT(pin < 8);
+                hvm_dpci_eoi(current->domain,
+                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
+                __clear_bit(pin, &pending);
+            }
+            return;
         }
         else if ( val & 0x08 )
         {
-- 
2.29.2


