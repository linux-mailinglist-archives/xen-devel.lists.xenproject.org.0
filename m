Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA333F6060
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171523.313000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXOx-00065R-VJ; Tue, 24 Aug 2021 14:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171523.313000; Tue, 24 Aug 2021 14:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXOx-00062Q-Rf; Tue, 24 Aug 2021 14:27:43 +0000
Received: by outflank-mailman (input) for mailman id 171523;
 Tue, 24 Aug 2021 14:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXOx-00062C-1w
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:27:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70848290-04e7-11ec-a8dd-12813bfff9fa;
 Tue, 24 Aug 2021 14:27:42 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-1PJLEEbCOMW5dBurWVugOg-1; Tue, 24 Aug 2021 16:27:40 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5586.eurprd04.prod.outlook.com (2603:10a6:208:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:27:39 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:27:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0110.eurprd04.prod.outlook.com (2603:10a6:208:55::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:27:38 +0000
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
X-Inumbo-ID: 70848290-04e7-11ec-a8dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5yL1useIB2A88uC4gSJ+juDvytPE+ii/83FY2OaNQ4=;
	b=nvi9KBGRzYU5pBbGTr3uV+T13hV0+bMuJWT3ZZRC1PHrS+6FfEdQ7qyBtU+hDq89CTzuOL
	1et74RnVObfBSsaAYuDhPjk093ZgpqOLcWFQhZnG10nfY6VyvB73sFjnqqJUnWf1omLOG1
	HWBjmbU1g3lTkRLhmkxsqSOGlkt9qVw=
X-MC-Unique: 1PJLEEbCOMW5dBurWVugOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVTDmUbxFi1DQ8LwjrKy6oljS1oQiVAk/Zv08EDzg4+clqg9PZbbL4UQFJLSQ62sDovuOTjwQQEFBoHmXiPmTU43zkPMcfolwCtlg1/ILVSqt+/wipHdaoMufCpJC5G0hROK6a7tc64Hmf5KbQt5eFJVeiD/A3oz7SfFyyIXhJfuPamAVd4fpQANo6/SO9jpEd612WA5RxQeYSIVnvzNP/w1A0KwF1gGMpTXGEZNjD2LtYGBb56Hr+x1AkdBPCT+Xab/FZq9U0aTvPkK8ezpaLmXeVEPoBXKqsjZ3mwGcZqK9RTR3UbrySvvwO8jM5ejQ9T/g85rIlqpJfepCsw/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5yL1useIB2A88uC4gSJ+juDvytPE+ii/83FY2OaNQ4=;
 b=LgbRTxjQGyBQ61/punqMJbPbTRxlpvsforoMzVB6OYDDQAx7gBFOZKUXDHFaMPUoWKfqQFUIftV2ch2D+ryfGVl5AKbXztqtI/rUCHv5D7O/tbtPb6f+CdiYe6f66FhlwtJvdGMNt0+Wm3tmr3SL9mkLneB+aRlkekLqQWknGFMbKn3ufFXfRk2hnigzfNn0hK9hoBduaRliYlu6NQz62UMQi3NjvK1WD+0pPJslaRFXvdNLCjh9WhqZzV8I7nD22tFT+rQ7Nkui+ZR42+a2nXqNyPNOhBDhezNugD/eVqQNG+JpBMbGJPaTMgVg74tsW0MLGPYNDX95gIPSAAhIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
Date: Tue, 24 Aug 2021 16:27:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0110.eurprd04.prod.outlook.com
 (2603:10a6:208:55::15) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 022cfb7c-c0b7-40f4-cbe9-08d9670b5345
X-MS-TrafficTypeDiagnostic: AM0PR04MB5586:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB558655890A02EA21735BA89DB3C59@AM0PR04MB5586.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VUHcfo6ACj6jl93631RzbKZoLjBFLwVlaNtEimo5xUdUlrUXwT/NeSnKYW2PF7VVBV0o3o9kqN6Gj0k0ZWfhPqPzM1oDgPy3LxF2LNlBzRmtL3lVbccz0I9IxFrGBhjOBAsQPRhmta9+q7ktBVtetlIztFlJDWJuqeBTiLFFPXrghnUAF9z0odAXcUdDz4JpIuwvFs+pZiVuYjdxSs8EieRYqeQHDXTzQIva5JTApF3FtI7xAWmcmBxwYhjJiQ8uTaAUMcGU4yQsd3LpUGaIqk5JKLvlWUa2uth2g/BQit1mrNktWejmX9j54RXK36GeXi3JeS7FZpLEhrp+fDUB6y0TGsW8/qeuSkYVPzDgJ5yQU/hQanVb+R3wdINNffui/B5nW2jfJeZDFHFsClb/O9TvJxf+zBFcs0aoLl3MaJHThYWvw8ZlAuxBYuZVV+UWlpEdPRDepyTz+LHngtwM/YgzXyNH31gVlE8GxqOUa+DU9AS+L8ns2jZ452E+UU+nNSTWJ7s+/3inAvHWiw8KpSnP8NlirTvKWWmzi4RgQIVj2wK4ivwRZa/bjz/MlOtoE9nO4cKV0bNr/YYASocPIrNXbnTYkoBM9YB1uWX/sz6T19MReGkDHnA/KNGz6/JovSrDU6J6KxIFfJf71BBnVX51GyGspQQcQw56osVANE9y8tttpNppk9JjAGw2nwh97Grx8BWpIKOkoUsumnlAFuF7UeYjV0Cojsiei5HdcR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(6486002)(6916009)(478600001)(31696002)(956004)(4326008)(36756003)(2906002)(38100700002)(316002)(66946007)(26005)(8936002)(66476007)(66556008)(5660300002)(31686004)(16576012)(54906003)(8676002)(186003)(2616005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW5scENkZkZaVGdHaGlheG8wZkJjM0lpcVFVenBPN3EvVElsNTJTWXpWRWJn?=
 =?utf-8?B?QmRaa29sZkl0N2xjS21kdndtK09XaDJRdkk5d3E1VFNrdGtMdVREVXVmWkNI?=
 =?utf-8?B?VzBLLzdzOFNJVVRtWGErVllHd0FhV2todk9VVkNPU00yeGtMWlY4Zkw0MWFU?=
 =?utf-8?B?eDFvbzJ5V21sNzh1UFZDWlcyTE5aL2VYRzBMSi91ekppclpzcXQ1alNPdFJ3?=
 =?utf-8?B?WStQb0NJcUNkZHF2T0NYVHUxL1RidWZYZjEwWThWdjFRQSt0MjUvTUdjaW10?=
 =?utf-8?B?VTRmS24xSzMrSlBGb1FKVUZYN3dRS0dEU09ZV2ZEc3pkZWQ4aUY0L3dPb2ZD?=
 =?utf-8?B?QWZJVEtjQm1NL3lISE45NlA3aTFvQXZTZGZOM3FwTFJIbmNyYW0ralRtNUsx?=
 =?utf-8?B?TzJ4Und5M3Y2UTlMcUVmMW1Cc3IvNGdobHVFYWd6b2lDeWd5eVFZYjQzYnhu?=
 =?utf-8?B?UXllVmpKZmk1WUMrODFSOSt3bW9jWDcrbi9JR3AxSVBsb0YrNExoR2FkL1Yz?=
 =?utf-8?B?WGJZbTc3QTcrUndnOHVDLyszQW1BQmhOQm90QnRoRnNGSWhRUGlHVmIwdmcv?=
 =?utf-8?B?TEIxaWkvbGNoN0NZUG5RU21HVTdTdWltMWZlTjNXdjFRdmMwQzVDT1grdFhY?=
 =?utf-8?B?dkhhTW5hNm5kV0VUa2NmQkNsQ0lkM05aYSszclVDeXM0bEN4dFNhS2JxRito?=
 =?utf-8?B?TjE2MWhXMjhTcVlXL29hdDN1UHc0Q1JCMS9PNnZMSTNIVW1yN0ZuTm5oUjg3?=
 =?utf-8?B?b2pOVVpRNzFObHdnb2FNbHNhMXFYZVhlaFIyQlNtRURlTjFIK0dIY0hDYy84?=
 =?utf-8?B?c1ZmbzRVUmR3RkdNdXhSTTRyZ2dCUllyOGJqTVA2QmRITGdLYmp1NTV2elow?=
 =?utf-8?B?N04wejNDcjQyUlFMUTBWelppdXpCTDAwaGg1MHpCQkU0d1lHWnNNWUZBTWRQ?=
 =?utf-8?B?K1RlRG5NbVRDUmhoL0V5RjlZcXAwZ042SXhoYkhKRnhIRUowak80d1BhRXdk?=
 =?utf-8?B?aC8yTVFvNlBDZUp1TVo5aGdsMnpXTGVpZ2xIZFU1RSt2SFlwa0xQakRYSTFm?=
 =?utf-8?B?TURMZGlMb2lWb2YrSExrTGtqZk95Qk9pQ3plN3ZqTkY1b09TaWVkOXQ0SC9L?=
 =?utf-8?B?WHZFWElwMytoM3BHT0hoamt3S0VqK0FqNmhqU1hZN3VHcjAxTnJ4TFJkZ0kx?=
 =?utf-8?B?STdZck5VcFN0Y29Hbmp0S3dFODVla2djQVVOcElKRUx2RERodDdaY2RkSWs5?=
 =?utf-8?B?RHgyb1Q3YWdYWFk2VVExdXNVdFBibUYvZEsrTVY5MC9GVXRudlEwZTgvOWxs?=
 =?utf-8?B?Vmk3aUlvYW9HYyt4eWhvazdBTnhSUzJwU1JoQ2VnZlNxZjJiNEc1RjZnalMr?=
 =?utf-8?B?MVF4ZkdscjA4dXJUYy9sOGVBaEFUUWhXOG5YbHNzTFNydGNqY09tSjlxUkJ1?=
 =?utf-8?B?YlIzdWZBbUpIbjQwYzgwaTVGOFFEVXNVOHNESHMrY0VrQnBtcTh6cWNQaVQ1?=
 =?utf-8?B?a3ZseDVuUGhteVViN0VFWTQ0T2dKTVNtaVpDZllXUzBiOW43dXR5R2kwZTB2?=
 =?utf-8?B?VWhvUElkUUQwVWF1ZENOT2JzUlZpT0hMdUxoVEJjdC9WSUp2bUk2SThodjVx?=
 =?utf-8?B?THRjUE02VHQ5aEJZcENzb0hDaHlBQnEwaHpLYmgzQ2M1S0xWZFdhMXVMcjVS?=
 =?utf-8?B?dUo0UEovL0FXYWV6clUrRHdoMmJ5elhwek9DTmFqU0xwdVRlRkZsQlVtUXNQ?=
 =?utf-8?Q?h+lGu84/SH7CBz8Gwsuavf1Y/xCTVBfw7C3Zzap?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022cfb7c-c0b7-40f4-cbe9-08d9670b5345
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:27:38.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWmxs45Fqndz6A/OBCjhl7yblH2lhZOvMG/icxABb33lAs3dynaT337+fOMopSoVfsMHfl1aXHu5CBhkrYfszw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5586

map_domain_page() et al never fail; no need to check their return values
against NULL, and no need to carry dead printk()s.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -530,12 +530,6 @@ static void amd_dump_page_table_level(st
         return;
 
     table_vaddr = __map_domain_page(pg);
-    if ( table_vaddr == NULL )
-    {
-        printk("AMD IOMMU failed to map domain page %"PRIpaddr"\n",
-                page_to_maddr(pg));
-        return;
-    }
 
     for ( index = 0; index < PTE_PER_TABLE_SIZE; index++ )
     {
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2800,12 +2800,6 @@ static void vtd_dump_page_table_level(pa
         return;
 
     pt_vaddr = map_vtd_domain_page(pt_maddr);
-    if ( pt_vaddr == NULL )
-    {
-        printk(VTDPREFIX " failed to map domain page %"PRIpaddr"\n",
-               pt_maddr);
-        return;
-    }
 
     next_level = level - 1;
     for ( i = 0; i < PTE_NUM; i++ )
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -106,11 +106,6 @@ void print_vtd_entries(struct vtd_iommu
     }
 
     root_entry = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
-    if ( root_entry == NULL )
-    {
-        printk("    root_entry == NULL\n");
-        return;
-    }
 
     printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].val);
     if ( !root_present(root_entry[bus]) )
@@ -123,11 +118,6 @@ void print_vtd_entries(struct vtd_iommu
     val = root_entry[bus].val;
     unmap_vtd_domain_page(root_entry);
     ctxt_entry = map_vtd_domain_page(val);
-    if ( ctxt_entry == NULL )
-    {
-        printk("    ctxt_entry == NULL\n");
-        return;
-    }
 
     val = ctxt_entry[devfn].lo;
     printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n",
@@ -151,11 +141,6 @@ void print_vtd_entries(struct vtd_iommu
     do
     {
         l = map_vtd_domain_page(val);
-        if ( l == NULL )
-        {
-            printk("    l%u == NULL\n", level);
-            break;
-        }
         l_index = get_level_index(gmfn, level);
         pte.val = l[l_index];
         unmap_vtd_domain_page(l);


