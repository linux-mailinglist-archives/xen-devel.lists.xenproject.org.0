Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E071600C
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 14:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541157.843603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yd0-0001St-1E; Tue, 30 May 2023 12:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541157.843603; Tue, 30 May 2023 12:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3ycz-0001QA-Tq; Tue, 30 May 2023 12:39:05 +0000
Received: by outflank-mailman (input) for mailman id 541157;
 Tue, 30 May 2023 12:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3ycx-0001Q4-NF
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 12:39:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4b5edef-fee6-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 14:39:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8276.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 12:38:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 12:38:58 +0000
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
X-Inumbo-ID: f4b5edef-fee6-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvAGqtyn56T87B0hutB68vkVzkAc6aQkwNEdsWAuJjmwXJa9os8ISyNsZDLF4S6cXfoEg7+pYwsG3bg9BoJzlCDROUVlytctUCfwZYDyHFIPug+S/LYiGyedj+ZQTxRF3oG7N8cwlmCYrzBBzwTBW38GXDymj5h6cidByFr1sC7F1QUCVt14mWWsonMYgZ7boo3W5PFG1sEvWIF018Y5eC2Hh76viJPwqEbhX82Zh6W9fRC15TzxOcLiJz3jkBovmzc73PJzmyiOal+A7GygHn87TihBQRwE6a7V3CTXPo8C1LspWlKtqHwQwqVyY/4oaCgsjT2Ztl4TzcQVQ1RdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sdhBVPmtL1e1+Kh9sGgFXp6ChoVMN6PauBpRwmz8hg=;
 b=Opw8qOrBox5dvxlHv6gkUsV+dwwjCO0rNwV2i3e1DePZNn+cY/KkFlX2q5paTNCLw+pq4/Gxgxn/GLN5s2oAocdzmkhhIbb4hoihYvBZv+Jv0L4nX0sI5C240QJb4cPYyAG7b6LMnoCEDIgX9DqZMtJKUSLzMBElA9fWfAPJ8nB7NFsDrzMwCryc5BdrTs9mDdX5MiQEOI2qzJXM6hwYbJijUuc013jj/hyFYpAZ8meWeHBS8tzISs5aS1SdT1fhUupL57978iBVswiwxt+cFmFi4LssZ5CAu9zA2232t5p9H8E0l6sSavLFcb9+Hke94/oDaXNC/xBh5tuCgipZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sdhBVPmtL1e1+Kh9sGgFXp6ChoVMN6PauBpRwmz8hg=;
 b=nsl/fpf5S/L3e+fwUumWP4TvDdaIidpHGVY2WhiJOn4znTJCjtgOH4hum4IWrCEccE+/Jzk7bqUO0h5/FuTaI4jBguh8Re//lTB+ffNTaUsZSPRFCjw+4gaJ5IEVqvXMa8U43288+pA3AKibDKxuxjq/Y9wyNI206/Uhj5DkLdTkF0/MQmvR51QU49XQv6pDf/8NAXW6dFTrwD44q79TWyQyaYmoiMZGThVrhC3wmvFoCLDbk/5+7SlLq3KOfjFMOLzBOZrIhF27XhJs0rPXsu+v60bRVL9O+0b9jDm+Sw0BC3ROyFG8ny66I7tgSHcqYSVqHM8Y58jFTSLRHCw0bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1c6e297-0046-73f6-981d-af776b271f24@suse.com>
Date: Tue, 30 May 2023 14:38:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] vPCI: account for hidden devices
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da559de-489f-411c-5cfa-08db610ad672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHh7WfLOu2hiAI3P8oNMVwsx0g8tEKLT72n8hrvWJO/9BKvGOkXeINo+5WLMng4BvjUOLi93ilFtjmQ+lZJMl1sZx88QCHoMme5+8Gez/j7YaldsQVWGBYtRu5Y4E7LYuTiimtkffyWnds9H6T0PtPNzyinoR75F8HuYbzUXvPDKthq8RM86ze7Gs8jGE6Tl533AA1IDlILGW1dbNZRr0STrLkVaWLwlu7+aK5c+ZjvmoYqUZf9YNJacnRtPVq6azRKEYNedwKxZIM/XZHaqKLMwrFV59tU44+1ScBv20bXFTeJYuMmUOUdUiMW5swk7XyN6ZW8lPmJKnbzeIKrrFy5lqC42RumYc9p+gSV7S1rAgfwh/AuUXNJ2DD1NeOb4Wa6X4KA8/9p+aulnxoHLZnL04/aoCs2T6Oh+JBjsKrVf4y2P+nO121U1e45wo+1V5K61iZ0gFu+OXzvYeMKnXiHa616bH6Ex4ugxOG+v3s98eYmhqGOCT0E4vGLSh6Kd9L12eRFu5vVYEsYkAerY/s7h9zMfB8wQdPhGz9MhjuHFn518Av5w8OzaS7r+1mP/VfHhwODh6Up3BiXRFr8O5zHFNi6ruGZu61FiEo3TLjlIyXXgpvtp4HiAo+ngDufM3P1XUo8OAsqu5GBmzPpJwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(26005)(6486002)(6506007)(6512007)(2906002)(316002)(186003)(5660300002)(41300700001)(36756003)(8936002)(8676002)(478600001)(38100700002)(31686004)(54906003)(6916009)(86362001)(31696002)(4326008)(2616005)(66946007)(66476007)(66556008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDF6b2tPVm9rQklOb0Q0ZzQrc1hlb25kcXFVRm1sYThyeWVuenphT0FLaDR6?=
 =?utf-8?B?Sm1hSFlucGFJSU8va0N5TGhiNzJDZmZ6Z1BGOFFXYkxKTDNKOEtWMDdxKzFW?=
 =?utf-8?B?V1ZCWm54QUVLTys3WGo1aXpnNnh5dVJ1bUFVNXBJMTRQMzJYckE2bDZOMk9m?=
 =?utf-8?B?alJFWW5HMXhIczhiOUNaNEphaHY4eWZrQ2RFcnlNOHdyQ1oxa0hBVC8xWnRC?=
 =?utf-8?B?NlYyRjJDODZ4R3NQM1FrWWI2RHRaNHJtUjE1THdOOExKemJYdjhic0ZiajJX?=
 =?utf-8?B?T1d4VXpBRElJNmZ3SG5ZdjBCaEYrZWdxZnpEV2V0eHM5MWZmQjdvNXB3NmNU?=
 =?utf-8?B?dGxlSWFDUmtOMUlaajF5VGxqTEh1c1dWSGFPSXpxRkI2QmJCaEpNSkVzQjdI?=
 =?utf-8?B?YkRtMmNQVlQrTExpVytSUS8xU3Rzb010Rmpxc2w4MXBwNDBJVFFCcldrRHVT?=
 =?utf-8?B?Z3dnN0hWSHhYR0paNHUxTU5QU20wQTZXS29tWmk5YUhvbEh0WmtrWjMrL3V3?=
 =?utf-8?B?bWQ5bXFZZjZEWUJqZ2s5dlo1OWZzaXd3UjFMY2haTUNYdnl5RVJzVmN2c2ZI?=
 =?utf-8?B?VWVnOHhBT05OKzFLVzhFWTY2aE9HQzZyd1BVUkppdDYzZkpXYW1JdHBGMWtV?=
 =?utf-8?B?ZnFDM3pncm5JYy9Sdzhqei91ZmR6RWE1bjhWcEN1VkYxa2R5cy9jNzRKNXM5?=
 =?utf-8?B?VCt2ajViQjlaWVYwbkhNZFlndzlVOGlqdEwvbG5RNFh0UG1HQWtTdW1SSUll?=
 =?utf-8?B?TXR6aVkyNGZUSnlQb01XQ3lLR0JkWWVNRFpMM0tIUm9NNkdJb21XRVJaTEM3?=
 =?utf-8?B?T2F2MFFqSmdGSDlzY2REN091NzhTSmk1WWcvT1pBSDUrVXVjQ2JsZkY3bnVU?=
 =?utf-8?B?T3h6MXhTMFFtQTYxWTVYbklZL3ZvUGx5d2xRa1UrWVc0NFo2MUt1WGJ3dElG?=
 =?utf-8?B?N2ZWVHhIZDhKamZCMUF4eFZZaTVhbEppalJIdnFVd0FpU0kyRTlXTW1WWnRN?=
 =?utf-8?B?bUt5blphWVcwRnltUzlVaFhDMDNvbXBwQ21MTU9sMUE0SHYwK0MzdWh1YkZQ?=
 =?utf-8?B?K1NTNmg0T3Z3VnlNVVJ4TXAxVWFjMVhxQVRxTi9ZeEhQQXA4MDZkZHpBUHZs?=
 =?utf-8?B?VFMvZlI4eFpjK2Q4SXA5QUNVbTQrWFlYY25KZm93enhtaXp0bVNpMFhHcFZK?=
 =?utf-8?B?Q1dnN0tabmNCTHBraEFmd2ZSNmVYbDkyQmNoSWxuYUh5RmtyZ1phNUJvV25I?=
 =?utf-8?B?VklXK0puOGtPTG9DZ2FQeEExcDl3RUd3QUJHTjd6ZkU0anREcjEvZ2tTNjVZ?=
 =?utf-8?B?VnJNdnBISlovemU3VzV6YkN5OHFPUzJmTHlDN0hUU3JDZGN1VkVDaTNtM3ZG?=
 =?utf-8?B?T0MxMEZUU1JiZzhvWGxObldkNlk4aDUvaE1zSzIwWGUreXpQTGI1OVRqeVVo?=
 =?utf-8?B?Q3MxM3dCR0RyTS9hTE1hTTU0TzRydG51UGIrVHh3N2JadzlrYWtkRG15ckcz?=
 =?utf-8?B?TmNKRFJ5UXlZbW1tTnk1TEJhZ3NkdGtGaktxS2pSaERoR0ZiWGxkMHR3N1la?=
 =?utf-8?B?UVJaT25xUWs0VkREK3pXM20xdjdYZitWL2tJYmhRSnVldzFzZVdndG9jb3RR?=
 =?utf-8?B?VVh5ZFZybXFyeDNFS2gxbzRIWk83TThFalRyYkFnSzRKS2ZKMGNpSmd4UnJr?=
 =?utf-8?B?VjVGck55V09LZ2d6aFZqSTI5bS8wcjhtV0MxQ2JCVVc5Wk1OdDkzRTRWTE9m?=
 =?utf-8?B?TnBaQkJUVUxzOE5IT3RqbHUvR0d5dFRYcHNxRDZGbVNwZU9OTnptQmVLVmd6?=
 =?utf-8?B?NTJvSjlUTlUyRjlWU2hod0JMUTNjNFRvVDdsc0hrb0JhbTQ3djZmQW9UbnRG?=
 =?utf-8?B?Q3Q2bFQvVVNZSStYM2VDZVRqWTl6YW1TRmwrQkQ1SlZVdGlYVTA5SkZ1WU54?=
 =?utf-8?B?MjZXMk9HNVRDSHRXQVhqS1hPT3F5U2w1NXlNOCs3d0NKdTE0ejdJM3FyaVA5?=
 =?utf-8?B?UVVsWmFnTXhMdE1VMnd4VUxJVzRkRk1KcFR0V0EwSXVrZzVFT2xqeXNCd1A5?=
 =?utf-8?B?ektXSndMVnBlV2JlcDFFL3hJamlmT1dOaFViN3hRTHlPeVpVNWVsam5DMW5k?=
 =?utf-8?Q?uENQ64sDIE8x+UdSeiPZ98llG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da559de-489f-411c-5cfa-08db610ad672
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:38:58.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD8DoXlL+yDTdYIZ5EQK+WYzXSVWkFfhORv//XYfWPyPJBzFwJIw1ps8MtbcIUDVIG2fuuEsP7nt6enG+qMRPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276

Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
console) are associated with DomXEN, not Dom0. This means that while
looking for overlapping BARs such devices cannot be found on Dom0's list
of devices; DomXEN's list also needs to be scanned.

Suppress vPCI init altogether for r/o devices (which constitute a subset
of hidden ones).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Also consider pdev being DomXEN's in modify_bars(). Also consult
    DomXEN in vpci_{read,write}(). Move vpci_write()'s check of the r/o
    map out of mainline code. Re-base over the standalone addition of
    the loop continuation in modify_bars(), and finally make the code
    change there well-formed.
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
@@ -285,58 +286,69 @@ static int modify_bars(const struct pci_
 
     /*
      * Check for overlaps with other BARs. Note that only BARs that are
-     * currently mapped (enabled) are checked for overlaps.
+     * currently mapped (enabled) are checked for overlaps. Note also that
+     * for hwdom we also need to include hidden, i.e. DomXEN's, devices.
      */
-    for_each_pdev ( pdev->domain, tmp )
+    for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain; ; )
     {
-        if ( !tmp->vpci )
-            /*
-             * For the hardware domain it's possible to have devices assigned
-             * to it that are not handled by vPCI, either because those are
-             * read-only devices, or because vPCI setup has failed.
-             */
-            continue;
-
-        if ( tmp == pdev )
+        for_each_pdev ( d, tmp )
         {
-            /*
-             * Need to store the device so it's not constified and defer_map
-             * can modify it in case of error.
-             */
-            dev = tmp;
-            if ( !rom_only )
+            if ( !tmp->vpci )
                 /*
-                 * If memory decoding is toggled avoid checking against the
-                 * same device, or else all regions will be removed from the
-                 * memory map in the unmap case.
+                 * For the hardware domain it's possible to have devices
+                 * assigned to it that are not handled by vPCI, either because
+                 * those are read-only devices, or because vPCI setup has
+                 * failed.
                  */
                 continue;
-        }
 
-        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
-        {
-            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
-            unsigned long start = PFN_DOWN(bar->addr);
-            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
-
-            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
-                 /*
-                  * If only the ROM enable bit is toggled check against other
-                  * BARs in the same device for overlaps, but not against the
-                  * same ROM BAR.
-                  */
-                 (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
-                continue;
+            if ( tmp == pdev )
+            {
+                /*
+                 * Need to store the device so it's not constified and defer_map
+                 * can modify it in case of error.
+                 */
+                dev = tmp;
+                if ( !rom_only )
+                    /*
+                     * If memory decoding is toggled avoid checking against the
+                     * same device, or else all regions will be removed from the
+                     * memory map in the unmap case.
+                     */
+                    continue;
+            }
 
-            rc = rangeset_remove_range(mem, start, end);
-            if ( rc )
+            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
-                printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
-                       start, end, rc);
-                rangeset_destroy(mem);
-                return rc;
+                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
+                unsigned long start = PFN_DOWN(bar->addr);
+                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
+
+                if ( !bar->enabled ||
+                     !rangeset_overlaps_range(mem, start, end) ||
+                     /*
+                      * If only the ROM enable bit is toggled check against
+                      * other BARs in the same device for overlaps, but not
+                      * against the same ROM BAR.
+                      */
+                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
+                    continue;
+
+                rc = rangeset_remove_range(mem, start, end);
+                if ( rc )
+                {
+                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
+                           start, end, rc);
+                    rangeset_destroy(mem);
+                    return rc;
+                }
             }
         }
+
+        if ( !is_hardware_domain(d) )
+            break;
+
+        d = dom_xen;
     }
 
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
@@ -332,8 +338,13 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsi
         return data;
     }
 
-    /* Find the PCI dev matching the address. */
+    /*
+     * Find the PCI dev matching the address, which for hwdom also requires
+     * consulting DomXEN.  Passthrough everything that's not trapped.
+     */
     pdev = pci_get_pdev(d, sbdf);
+    if ( !pdev && is_hardware_domain(d) )
+        pdev = pci_get_pdev(dom_xen, sbdf);
     if ( !pdev || !pdev->vpci )
         return vpci_read_hw(sbdf, reg, size);
 
@@ -427,7 +438,6 @@ void vpci_write(pci_sbdf_t sbdf, unsigne
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
-    const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
 
     if ( !size )
     {
@@ -435,18 +445,20 @@ void vpci_write(pci_sbdf_t sbdf, unsigne
         return;
     }
 
-    if ( ro_map && test_bit(sbdf.bdf, ro_map) )
-        /* Ignore writes to read-only devices. */
-        return;
-
     /*
-     * Find the PCI dev matching the address.
-     * Passthrough everything that's not trapped.
+     * Find the PCI dev matching the address, which for hwdom also requires
+     * consulting DomXEN.  Passthrough everything that's not trapped.
      */
     pdev = pci_get_pdev(d, sbdf);
+    if ( !pdev && is_hardware_domain(d) )
+        pdev = pci_get_pdev(dom_xen, sbdf);
     if ( !pdev || !pdev->vpci )
     {
-        vpci_write_hw(sbdf, reg, size, data);
+        /* Ignore writes to read-only devices, which have no ->vpci. */
+        const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
+
+        if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
+            vpci_write_hw(sbdf, reg, size, data);
         return;
     }
 

