Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A56712125
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 09:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540001.841420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Ryh-0006O0-KD; Fri, 26 May 2023 07:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540001.841420; Fri, 26 May 2023 07:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Ryh-0006Kc-FU; Fri, 26 May 2023 07:35:11 +0000
Received: by outflank-mailman (input) for mailman id 540001;
 Fri, 26 May 2023 07:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2Ryf-0006KW-Mf
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 07:35:09 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d2499d-fb97-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 09:35:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8263.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 07:35:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 07:35:06 +0000
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
X-Inumbo-ID: d6d2499d-fb97-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZ9SCV5eCmdmeyxTonD/7wRfKAAHavs9Q7Go2o0d3E+PlfEx0a67ez8Kiop+m3v8BadvfHPi3apEZKHns70BybA9KX9boYmF+QTFlv35xDT2WyVdAjifDTnoqs7LYhx2RJleF5Syi5amQ3R08J7DzrUehD6brRhfdlIG2hAWvDdPbTtYCX2zlaTkwyfGQ582KauLj0UPngUdd4ZEut1nbjM1KJJu6riLxuhZ35vxajEh/klS5H2upzPDqjE1qlnquYFsdNoV3LGLlAzAGo1ZbWslxcyWbRos0qi08BbilWyfBZzqAz/jhPfPIt/8EXF5uLRGsav5r6FusUKtX+SYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbZyhmXvoa+G2jYdUn7X/SI6Ky0Cna4gbsBdriJhCF8=;
 b=oZP1yYIV67P2mlwiZVa50HsckZ19dQ1Gy/gWcvs+QhEN28tTLDN8rCmowVHapRbl+lJmwy/W7A7S9kAMlqwLwZcaw87iIIORdga65iIb78MOZj0f8oknb+na52UE0xpxydqblqYq/xJVRhWRonw5r3AHI+8Ww1IsheVnX6HD8Nwik25NDfH/iuww4XI1IivUwLZUzwrzbxCaDOo2rsgyM1b/c9IMApPf/SPS1zAq4gQeJtLkTErkURs0hl5TZhg13lhpycioVO2EG3X+Lmc5BXyyZSaPopcv2qWk49pim6fT95lCxl8ZBZNtLcn4MWPik80WgDtH1QsQm+Zo009PSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbZyhmXvoa+G2jYdUn7X/SI6Ky0Cna4gbsBdriJhCF8=;
 b=sUHq+VRPgdokegqWER2IhOvNP8ZzAPy+qT6FYuYTdVGyVByHy9ntAKvWlECgE2e30cJS8mDQI6cwaQsccXMxT+w/kN7dLvEp3wer4eBoW46SEsHhMIO8XJ1kiix8vqDf+Xw4YQbybi1bEH8uDdTgR40UGeCzjx2pMZCz1DQfYOj4nJgY545AKbRCw5MO8Er4cb0NBwZueksnMrU6Re47JXZtpsW6yQCII2Gz/tPSO9349Xjd4A2gboF1KKMt7InF1Sxznlj+ndY0o612YhV/UUZTb7Xn0N9Whl2XH6pz2XcoHd0/y0vqBh49ROc7oyooX1INuGVnZeOY628qjDKmQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5567b45d-d8ee-7f43-526f-7f601c6ddd46@suse.com>
Date: Fri, 26 May 2023 09:35:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vPIC: register only one ELCR handler instance
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: f60df170-e778-4783-f49c-08db5dbbb9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V9vNXTxr9AaVO8POA2Wx5VHYH2b3zMmmwwPrSVmtBcmQexeE5qCTWchB5sjayXAAT4mIvbRkhDuqDdGpJa4jfxIhjcub5m6hvDzMjPX9xxouozMQzgosfyInlDPJFfTnFTdWz24q7WQ3pkWFLwBY6GK/QDfSXKF457l62f4Pr2YD4/RmOTJtu/p++BBAW6HJwCFRUHvvmTUSOA4GK/6bNRHYEUn8XebcqBRE3xm/7INn0F8v1gZd7ButODa4u6aVE5sKl31ueth0p2x4n9J3AoBPQjGhY9pjDoLSTkPg8dH1FIYk7cNochBoupt/JBayPpDC0fKCRu+LAz16QEHQIOaCIiVad6CJNceqcICmKACCh2DgLF2YTtQpThAzjceb1rJZyq8V0+J1BZPfne78dSTKdpYAXpFYbzIbVbxMIStS0wnVsUuSU58lb0WzyhMIzwsfnxG6fnND9sPT91l1GlDy5q0p6UQ3vg/vdXhRumDoQhw5+lHUayKm5RdZnt+p2w9h1z8/zzkzKEkIPPRI/xhzoUUibtGAeI/sczpphJ4Phme5isuNRuSs3NU3WcH0EHwl0+qJyBllphvIMF7HL1SpQ8bhsCPJDdBPX5gg7mKvnXFeI4Od0HhgSYaO/GltqetnoxctqaFSKRa2FkZ+8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(31686004)(54906003)(86362001)(83380400001)(31696002)(478600001)(2616005)(186003)(2906002)(66946007)(6512007)(6916009)(4326008)(66556008)(66476007)(36756003)(6506007)(316002)(26005)(6486002)(41300700001)(5660300002)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE9VZFdJZDh4dld4c3V2amk5bjhFNFJ0TktxYiswekNvSjVMTWJpUzBSb293?=
 =?utf-8?B?RHh2Q0ZvNHI4QzFSb1dMQ2NkQ0IyV1AxaFB5S0dGS1E5WXlWbkRSMGNBeXpv?=
 =?utf-8?B?RzFRRUo2UUwwNXpvaXpZNVY2SG92ZTdITmdPc2EvR1hEYnR1SWRKRjJsWm5h?=
 =?utf-8?B?UDl4SUVoT3FBMVlGK2lBclpwazQwNVQ3czZVNFAyL1pPdTcrQ25MOFVOY1hv?=
 =?utf-8?B?dXhRZXY5ODBqenJhWkZUOEhwc25wYU5uTXRFYkJMcDdrZjgyMUZCcGw0MjJH?=
 =?utf-8?B?ZGp3cHpNN1ZIdDZVQmU0UEo2cUgwR3F0SzE1ZGg3aXJiQTNkZ250NEdqMnFv?=
 =?utf-8?B?K0c2K2w0VjMwdzJqSlJtTEZxMVR4cDFpV0ZGNDczbE1IUVNTUWw0Rml3UHFM?=
 =?utf-8?B?RzkzU3FzcTdsTU5uRllLMDlnY0Vwd29yanpHSCt3TWRmQWFvZ0VIclJmdE5C?=
 =?utf-8?B?ZDM2U29lelhlNFNBOHM3VWsvK09SUUp3NitOL0xEcHFiRHlGQ2dETUhaWngw?=
 =?utf-8?B?NWV2Q2hyTkdNVVAxVHgzMHBCbFlUbENEZDJPaWo2VG5YZmFNQjFYRDBmTTg3?=
 =?utf-8?B?OTBtakUxNFRWSGdHL0ZaQnJ4cytKdUJBN09UVFFEY1l0NzFJNzJmVnhrUDMx?=
 =?utf-8?B?Z3lBbHFwOXhINUQyTVN2VkpMaUZYU3VvYndxbFRwbkxqR3NDMGdZYitnOHls?=
 =?utf-8?B?bFJLZFBTREF0M25QRGYyelBLbXpURnRWSnhpdkVPb04wdEFESzJnTU83aGFl?=
 =?utf-8?B?UGtZdUZqa2lqY3JaMzY4aXkyQ1VFaC9jUlBvamtxNUxnZlVaa2dMT3NSeHhm?=
 =?utf-8?B?MVYxeEZjYmtCcDRpM1prMTRXNGIrZS8yY3lyT2w0SGtuY2JrbzlSRHFXYUpR?=
 =?utf-8?B?ZUovSytaZmxHSmEyaWs0cEpXb3hsb2JUeURETGl1SzZESzZXbk91V0IyV1RO?=
 =?utf-8?B?THd3bFBXZnZPa3hNaG9GYURXclh1ZTR5NWJiYmY0SXp0Q1ErSktXcHd4dXZG?=
 =?utf-8?B?WlNwc1JsQmp6eWpFVWJXeitMRzBYRUF5OEpGamJXdHBVNmZmMXpyRnYyd3dM?=
 =?utf-8?B?ZGE2WFc4ZGFnQ005SXAvaUpxMmFhUWxrcFN3VTAyZTEySlNlWHVDVGZGQzVk?=
 =?utf-8?B?cUpEK1Fsb0tUYytHb1BxZXRFRXcwSnp0aHE2QmdKME9vZHJNUUdJbDBURHZr?=
 =?utf-8?B?ZStsN0NnYUxZYk5udG9lVU5ad3pTY0pDZGxTajJhOUxjOVprckhUKzRZZ0th?=
 =?utf-8?B?VUtvV3lhU0M3ZlJNK2V2ZWFMcEwxdlF6Q0NybE40eUd6QnhNdDFtUkNqVE9S?=
 =?utf-8?B?bkRBNFZyNVowajl4SkVrVFZ5dVUyS0tESkxPZmUydU5nSUZod3pYUkFVTkhJ?=
 =?utf-8?B?ZGwzVVBDVlRNUFFMczIvRGhnemZpbmszZVlLK3NORzJjdGZnNXQ0ZlZDNksw?=
 =?utf-8?B?Q1JKdlhYaTQ0UC9MZ1daNXRSQk9aUWRqUXoyVTBqTGlCdmJxMGp4eDBMZnp3?=
 =?utf-8?B?OGliS29ic2Z4UWdRKzYrL0FwUmxZNG9jelF4cnJXaW5HR2N3KzFVL1h4bG1n?=
 =?utf-8?B?a016QW45TStuSHJNMEhqMnFJbkd3MGdEamgydXA2TzVGR2VGS0QzemVWWktt?=
 =?utf-8?B?SkV1QUNCNG5SRkovZnF5VVV4aWR6OWRzbGlYU3dkeUNOcmRZNFJFRjJPeFRx?=
 =?utf-8?B?S1dvTlpsUTd5T1Y3OU80Y3hoYTRWNFdnei9CQUx6L0MzYmNwOTh1YURHbHQv?=
 =?utf-8?B?VGI3YmxPRFZndDFPLzFNaHc2SS9BaTVQK2JYc1lja2M0Ry9qYU1QYXAzdDFE?=
 =?utf-8?B?dUZ6UXk3Y1AyK0tBOHVWcUIwbHRCZ1FRN0xBbGxqZEI5aU1BV241WVZIZWJp?=
 =?utf-8?B?SitGeXdMd0RhYlJURmFodlRpaHVRT0ZIc0x2MndMd0g4UkZUSzhlVEl2NGRQ?=
 =?utf-8?B?UGJUZTVsRmxXelJuMXovckY5OTY4dFJOZVJJUnhNblpLdU1oSEhHOHM2RW9Y?=
 =?utf-8?B?S3EvcGx0cFhwMlRaSnRZczRFYWYxTWRNRGZCTEpvMHdmVXd2RTZFcVFzeTlh?=
 =?utf-8?B?L1REVy9nRGkzU3pqSFFaNkZkYWVLYjBWdnFqSnZwOGZ3aGw3cmdDNW5EbENM?=
 =?utf-8?Q?KOU3vVVWkg4ZbSA8FXMDcsTgU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60df170-e778-4783-f49c-08db5dbbb9ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 07:35:06.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAoX0lRO4H/Ydp8LvAZm8p9lI6Zm3AZkC6zTm3bW21SxnfPZRsE7+sisags4dQBoxQqonLLAUPDmg3OsjCIb+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8263

There's no point consuming two port-I/O slots. Even less so considering
that some real hardware permits both ports to be accessed in one go,
emulating of which requires there to be only a single instance.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -377,25 +377,34 @@ static int cf_check vpic_intercept_elcr_
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct hvm_hw_vpic *vpic;
-    uint32_t data;
+    unsigned int data, shift = 0;
 
-    BUG_ON(bytes != 1);
+    BUG_ON(bytes > 2 - (port & 1));
 
     vpic = &current->domain->arch.hvm.vpic[port & 1];
 
-    if ( dir == IOREQ_WRITE )
-    {
-        /* Some IRs are always edge trig. Slave IR is always level trig. */
-        data = *val & vpic_elcr_mask(vpic);
-        if ( vpic->is_master )
-            data |= 1 << 2;
-        vpic->elcr = data;
-    }
-    else
-    {
-        /* Reader should not see hardcoded level-triggered slave IR. */
-        *val = vpic->elcr & vpic_elcr_mask(vpic);
-    }
+    do {
+        if ( dir == IOREQ_WRITE )
+        {
+            /* Some IRs are always edge trig. Slave IR is always level trig. */
+            data = (*val >> shift) & vpic_elcr_mask(vpic);
+            if ( vpic->is_master )
+                data |= 1 << 2;
+            vpic->elcr = data;
+        }
+        else
+        {
+            /* Reader should not see hardcoded level-triggered slave IR. */
+            data = vpic->elcr & vpic_elcr_mask(vpic);
+            if ( !shift )
+                *val = data;
+            else
+                *val |= data << shift;
+        }
+
+        ++vpic;
+        shift += 8;
+    } while ( --bytes );
 
     return X86EMUL_OKAY;
 }
@@ -470,8 +479,7 @@ void vpic_init(struct domain *d)
     register_portio_handler(d, 0x20, 2, vpic_intercept_pic_io);
     register_portio_handler(d, 0xa0, 2, vpic_intercept_pic_io);
 
-    register_portio_handler(d, 0x4d0, 1, vpic_intercept_elcr_io);
-    register_portio_handler(d, 0x4d1, 1, vpic_intercept_elcr_io);
+    register_portio_handler(d, 0x4d0, 2, vpic_intercept_elcr_io);
 }
 
 void vpic_irq_positive_edge(struct domain *d, int irq)

