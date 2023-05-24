Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985A70F7F8
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 15:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539050.839539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1oob-0003C6-5d; Wed, 24 May 2023 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539050.839539; Wed, 24 May 2023 13:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1oob-00039A-25; Wed, 24 May 2023 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 539050;
 Wed, 24 May 2023 13:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1ooa-000394-14
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 13:46:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53e72a47-fa39-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 15:46:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 13:46:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 13:46:01 +0000
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
X-Inumbo-ID: 53e72a47-fa39-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIOAP64M9OGKguvqRc+5WRZsESRSVtyHh38/m7PcT2hmbXCKyOIk3AAKMQ9wZgLElyCP1o4lWJZtzEQ2y8eQVLIW3rnutFFxx8NO/hL/U9rTU9Wid/Vr1+qJCAb7JBzaPrQA9L+WuORFWZ9FkdMwcjCfUMfJiLeWL7pvx7hFBjbKxBlTjdRg8vay0xDlMg0+EuzCFZn0wn+tzS0YbdQf9XHknOXc1dOFjZ7/Tj+U7v2DPXHcZIozIk1UcpBOPI5AMWL98OYUBOHiqUZisaz97+miN7Ndt2X/OcQlCzFvDZJ5/ZzwThfPSfmO6T0fJSQaSIskohya795oXpHibTWnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujJbCJNF4sWBy6RwEm197UJw1XLCnTru4XS4yhruDZ0=;
 b=ebAesyQyxg+5qM625uEsl3qLHH7NFr25eksRavZwasUbvBuBNjsHa9Kyp6IGSKnw0Lf53Q/tGYNQ47lbsLVn3dwB8yT1X/vRu90hFGLc2gLK4P0hAgRINMtzhjiccUD4PXF+PoJ/vrD+Kugzo9CYfOrn7BAQrFoyi3Ebz2jKWU24DsPEWfTW9YFgk+OClEQtWEqdfWNypEQmSGOPpycw80LC0FMwdK/EGV9ynsvP3NGq+r91FXVwR+tR6SSt9bmg9FN2YVh2i1NAvc3hm5rQA+12yJvqg45eKLwGba4FSc+/5PB5r5ne2ipaifCo5rF2JaUG7V7Q7QEjWmvu8GMuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujJbCJNF4sWBy6RwEm197UJw1XLCnTru4XS4yhruDZ0=;
 b=PLz5dl1AvYSZapm8SJDp2Rd94YY9f0BxKG9mkKdfdGvZY6Dc7mMboFGpS1WRYYzPolODQ6mZvJxkAIEd63wxapwXzCVQnfF3eHNhuzkdLX2VWXJyrars0g5FC8UCb2jA2TCg9uAW0TGh78mlNq97cKjU/OMvWI/inS5vNvDsKiKDn13+hSqIvaGyT0MsTwN3kZuuobsCmTQVW84Bn3lITMRB7NRx77TTxi9vVnDJiOL0OwFh5LBybaaWFBTNdL8Z6PRVGvPxPU+OM4qVWSw7sOxggsdpiSJDlfmEh2VeT94FdwgXwEZkac3n97inbaHMpe03cQ+zHmS7H3gEzx4qiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
Date: Wed, 24 May 2023 15:45:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC v2] vPCI: account for hidden devices
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1a3f79-f118-4d7b-f40f-08db5c5d35b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V0F8gMfpdIxfLDD88Svo1Aes34fKQy3qpJFBfN3sEfug1y4zyBQUyQfWl1kNhe/BkfNZDdth6ddB2TnhzNumCFGEX0SfxOaTB7C8bASAMxOvpdho0vqeXA6ENWIpbV7u47sJTxNouAkAsDgph+EbbEYe2hesMNTbwWgtLzfUzgXlO5u1qD1ATLxBNpEb5l/ekBzjjWNZ9HX/Z91iS2DbNHDRnkb3N9SAn8eL3CsDABIj+aaL3XsKSnBQyUx7rBnRIxVj9KjwVgI+PTqrRPP7qRmAi/W2muzKTGGjrhWmCzZBR5eqCzrD37ubaz+tV8xcW03c6nVeGftH7KqM06a6KH6rb3MHEBwFvqrNNmfQ0QZxCKfqWQb+5yxWwAhwqpzv0rnU55Pre4I8eHi+TzDSPbp3Wd1SqUyKeACmwbPMtkwym8YxqAw0szNfjWdRloihZ22HcsIKuomY57D1S/ZWwtPFxA0WVXYp+KCe58pDmsi/SC5iNDtngT/TrUKaheklL15NhmsgFGA5nBttd4pVkSii0obFELB8NQYJk2MSwcRw8INq5/IUjxX7FlipKdFacUXFJDILwVjsJTJdqq8YhlusdEi3LLZoblgRVWRa4QBfm4FHo1F/nYFMMljlH1sZuAFp4LxteT2RjC9qw3PJpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(26005)(6512007)(6506007)(2906002)(186003)(2616005)(36756003)(83380400001)(38100700002)(316002)(6666004)(66946007)(66556008)(66476007)(6916009)(4326008)(86362001)(41300700001)(6486002)(54906003)(478600001)(31696002)(31686004)(8936002)(8676002)(5660300002)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eS8xcnhPWk9wRmZyU0hZeFBMQ0FhZmFCdmxLRHljVzI4cWk2ejlHa1h0c21L?=
 =?utf-8?B?SmR1b0dtWU1LWWFaQk94eU1TSmFxVldDZStDMDl5UFhPRk95ZHlzOUIyOVJw?=
 =?utf-8?B?SElwZGNZTTdBSXNqbFdDWU9JRUM4eG5ZVWx0cWkrdWFpanI4VnFONGRkYzVs?=
 =?utf-8?B?VDBiK2FZMWZCbTA5OFVaVGhDVG44VFVmaVFxVG5mL2pGNGU3K2FQejQ2Nndq?=
 =?utf-8?B?MHBzQkd4eG5iUnE5bmRUZlNhZkRKQ1JjVjh4NkoxU0hsOTVYSS9zdDBEMkR5?=
 =?utf-8?B?bnBVR0VDWDF2STVYZDhkOVh4aXRUQTRROHRoeGNkdXdtMmgzYmFnSzZMTlVZ?=
 =?utf-8?B?WXNvcDRlMTQybjNSWUNTeGg5ZUV1cXRaR1ZMTzBzVjc0dnB1NE1TQkEyY09L?=
 =?utf-8?B?dGxxeDQzaE5jQ0g3VWhkRitObVZyYjg0Z2E4V29yelRlSDBNZitKV2tHUkk1?=
 =?utf-8?B?Zk02WFRnd1lsdVNDbTVlaU9wcUxxWlJSbS8zR2dPK1lVNGVqR043NnJCL0Ri?=
 =?utf-8?B?NjBVZ1JKZXdKSUNUZmhxWHZSb25RV3lMWmw2ZmNMSWxKUjRPYStrLzFnRzNQ?=
 =?utf-8?B?QVU2VVZuNlNHMHo2VFRFVlhaaXlnSG5lNVM4WHRPVCtveDM3NzBvbnZpWXRJ?=
 =?utf-8?B?RTlpbkZVejlzSFEvbkRoMlpRV0x5bjBiRjQzbWNNVVVybFdKUkJydlBmcVZk?=
 =?utf-8?B?Sldsd2ZnTVpyQVVuM1ZRMUFMZUpWckI2RkNHNGgxTWQ1SHo0MCtxVTc4SS9J?=
 =?utf-8?B?UXp0RXBLa2lraWIvREJ2ZzdkWmp0KzJQOG5OTnEvRkhjY1VqWkY0RmQxSUZW?=
 =?utf-8?B?dkFwR0ZzOXNTcjd5VkdneXZXTmZZOThKa0MwSFNkZU1GTkhOT09NbGN0T2ZR?=
 =?utf-8?B?aTBUQTRidlJueXVPZVdtUm1qT25UUGIrRnBjcng1WE96N3FoTGlqOC9FMXg2?=
 =?utf-8?B?K0xzSU1ZQXowTEJNc0tZSjU4cUdoRXdsL3RGc0RkeVRBVm94dWNKbUIwajB4?=
 =?utf-8?B?T21XdmNnN3JmQnFJUjQvaEx1ekk3dE5EcEkwZjBCVWFwdzUwcTUyaXZiSk5o?=
 =?utf-8?B?UlBiT1NqcG9HK3krdXRESXBuaWtqbGlyQkJaL0ErTTc1T0I5SlZHSzVrb1Qr?=
 =?utf-8?B?dURNUzB6Z3Y5STd2ekhnTkgyZFozU1NxbURmaHdGTmMxUEdFSWsrR1lBdDQ5?=
 =?utf-8?B?Q2NyUDJvQlBYVk1USTJjOWc1eEs4TENXWSt3aXA1RTVLOGVqaVlzZ0NzQ2Zu?=
 =?utf-8?B?UGdLZmF4ZndORFlMYjlwQUpadHIvcmoxTUw1QjZiYkNjQ2FrVkpSMDd3MlZk?=
 =?utf-8?B?SEYvWkVnTGhxUDAzNllzWnJrOExBNjcxVWxEQUFxSFd2Nk1wOC9qUFlSMWlF?=
 =?utf-8?B?WjV2UzdvQ2t2bWlCSHkyK1U2UllzUWR0WDh2SjJwdjM2N1dKd3ZoNkdQODJw?=
 =?utf-8?B?YXZXVHB3QlVucUI3YUFNY2pISXZlVXhpMmtSK21Fc2gxMzhTbkFLSEdIR3lO?=
 =?utf-8?B?QUVnZ2JtNkhDSHRJdTZQNjBTZlBRdmhqRFB2UEJoVk1sTHc4UGE1UVJuekdh?=
 =?utf-8?B?d0JkYXFNZWVCTTBROGg0cXM2RWFNTnJFMkxaWG9IZmdyTzcrd2VkUVd0bzBS?=
 =?utf-8?B?Z3VZS3l5L1FOUXVVWldJZkk0K3BnVHNibEZsVmRHb1B0aUluYllyKzUwTTkr?=
 =?utf-8?B?dzN1SXdiN3F3OE1TVFNCRzRuTnRGa0U5RGt0WHlPSVpza2kxSnd2RG14SjUy?=
 =?utf-8?B?aE8xQWtIbnUwZU0ycXUwYTF4dnF3K3Y1T05NcTVTRmd4OFMyRFVOQ095cXZo?=
 =?utf-8?B?UGtpZmhrcUdkOWRSOW5ZMEswVUR0UktGN3hkUndCYU5KdHRPRDNZMlozekZo?=
 =?utf-8?B?eG9kSEVQZlJhcmxVZWRrTDhLelFmd2QwaHR3SFdmMjNOTUZtUXU4OC96VWhH?=
 =?utf-8?B?T0hPL3NFSjcwMEhTNDB6MVo2dGt4ZjJRSmR1bEliWGdTWnZrYlJuN1Vud2pp?=
 =?utf-8?B?UlV6b1JqWnB2ZHp4cUxlWDB1SVJSbmdCU096UWRielMyZWJxZXJVMnBiRmZ0?=
 =?utf-8?B?VHZhL011UHhRVVF0bGtnTTVXNnBGZ3YxMUIrZjJsOHpZWkwrYnMvZWdQWExP?=
 =?utf-8?Q?s+ThaM0LMpeWugWVgSBWyms+H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1a3f79-f118-4d7b-f40f-08db5c5d35b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 13:46:00.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ySPWVK/vrMnr7qu+IzCka0SmU+qYzz5tmUHLw3zgKWAPWgQpdoxKokwUYL1p4uz7NVauh6lKCnXOV9fgPSfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
console) are associated with DomXEN, not Dom0. This means that while
looking for overlapping BARs such devices cannot be found on Dom0's list
of devices; DomXEN's list also needs to be scanned.

Suppress vPCI init altogether for r/o devices (which constitute a subset
of hidden ones).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The modify_bars() change is intentionally mis-formatted, as the
     necessary re-indentation would make the diff difficult to read. At
     this point I'd merely like to gather input towards possible better
     approaches to solve the issue (not the least because quite possibly
     there are further places needing changing).

RFC: Whether to actually suppress vPCI init is up for debate; adding the
     extra logic is following Roger's suggestion (I'm not convinced it is
     useful to have). If we want to keep that, a 2nd question would be
     whether to keep it in vpci_add_handlers(): Both of its callers (can)
     have a struct pci_seg readily available, so checking ->ro_map at the
     call sites would be easier.

RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
     modify_bars() to consistently respect BARs of hidden devices while
     setting up "normal" ones (i.e. to avoid as much as possible the
     "continue" path introduced here), setting up of the former may want
     doing first.

RFC: vpci_write()'s check of the r/o map may want moving out of mainline
     code, into the case dealing with !pdev->vpci.
---
v2: Extend existing comment. Relax assertion. Don't initialize vPCI for
    r/o devices.

--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
     struct vpci_header *header = &pdev->vpci->header;
     struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
+    const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
     unsigned int i;
     int rc;
@@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
 
     /*
      * Check for overlaps with other BARs. Note that only BARs that are
-     * currently mapped (enabled) are checked for overlaps.
+     * currently mapped (enabled) are checked for overlaps. Note also that
+     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
      */
-    for_each_pdev ( pdev->domain, tmp )
+for ( d = pdev->domain; ; d = dom_xen ) {//todo
+    for_each_pdev ( d, tmp )
     {
         if ( tmp == pdev )
         {
@@ -304,6 +307,7 @@ static int modify_bars(const struct pci_
                  */
                 continue;
         }
+if ( !tmp->vpci ) { ASSERT(d == dom_xen); continue; }//todo
 
         for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
         {
@@ -330,6 +334,7 @@ static int modify_bars(const struct pci_
             }
         }
     }
+if ( !is_hardware_domain(d) ) break; }//todo
 
     ASSERT(dev);
 
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -70,6 +70,7 @@ void vpci_remove_device(struct pci_dev *
 int vpci_add_handlers(struct pci_dev *pdev)
 {
     unsigned int i;
+    const unsigned long *ro_map;
     int rc = 0;
 
     if ( !has_vpci(pdev->domain) )
@@ -78,6 +79,11 @@ int vpci_add_handlers(struct pci_dev *pd
     /* We should not get here twice for the same device. */
     ASSERT(!pdev->vpci);
 
+    /* No vPCI for r/o devices. */
+    ro_map = pci_get_ro_map(pdev->sbdf.seg);
+    if ( ro_map && test_bit(pdev->sbdf.bdf, ro_map) )
+        return 0;
+
     pdev->vpci = xzalloc(struct vpci);
     if ( !pdev->vpci )
         return -ENOMEM;

