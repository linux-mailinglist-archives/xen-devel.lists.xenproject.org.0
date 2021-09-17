Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77D40F668
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 13:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189299.338914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBc7-0008Et-8Q; Fri, 17 Sep 2021 11:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189299.338914; Fri, 17 Sep 2021 11:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRBc7-0008CM-4x; Fri, 17 Sep 2021 11:01:03 +0000
Received: by outflank-mailman (input) for mailman id 189299;
 Fri, 17 Sep 2021 11:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRBc5-0008Bk-BC
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 11:01:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15ba86b3-c4a3-4e7b-93e9-93551948eb10;
 Fri, 17 Sep 2021 11:01:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-85KPOHlRNvOtDdsEpc1B1A-1; Fri, 17 Sep 2021 13:00:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 11:00:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 11:00:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 11:00:57 +0000
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
X-Inumbo-ID: 15ba86b3-c4a3-4e7b-93e9-93551948eb10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631876459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPv3uK8bqSIgwLCsg7oLnpJv0fedDK5iubeaeJBmDWs=;
	b=JAXznEpDxU/T0/JiYq5pz2hICcn/M/uavPpBjrJjiNpCrrotgPxWUT0MDu+jvW36DFvDk4
	3O5QAzoUucEdh8mPDrh08erO1HZBhBESQLyXpZZkPGb432AgvbQbnrGgfTehN9sT78So68
	ovL3ihjI/Un0/Q5Wt7KlJ5W8Vj/+bKI=
X-MC-Unique: 85KPOHlRNvOtDdsEpc1B1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUvvTFdXKYnQSW4Na6p4WYAg6rkEuje5wR8MNiExTSXDxdWPr8r6W/d+gk8D+wk8m34o2hS1m7aMcUrGlGLMdwhBnDqM2VpYDIIfSNMFJh/a8hrizPWQlNlykTMd6h7NGrry6hntOst1rYsPmrq0MZDXh/Ai9aW3XpD5QBP/j1V4uvHVdG11Dco9NGhLuL11xBlT1yO25/UHpWslUlpqb4dAH3lWO7P8EnRvjZyf+UKibpQR2cDU62avo5bczCg4JkjZDjJ89tcZ3azPTgFVLpVreQivUvGEYw7G69j6pu9CXhSj+FNdMf+vHkXvyTu3mfdOCUFvcmAl+m8pPa8O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TPv3uK8bqSIgwLCsg7oLnpJv0fedDK5iubeaeJBmDWs=;
 b=JSbiT1d6FmCTnu1o+VNb0Zlx8dUtna4t4MbB1lCzCHBlwI6FQUAmIFPK85EIv8XL/onRm14aqpM/pd/fZifjRP82zIxs+pAfOOY/7zNXaio2+3hxMpJgQ5o7DLTaMhiBBtLZEbM+FPRmGlG2BE5h/0WTlimZp/scntxyab1RlLEboo/9JD+KXHk598ex7MT3WAEcHfWaWakgqVMapj5A+19J8Kcve5DhM7O2Lp0fDuqBWHLJ6trj023GHfgjNyQD1qfyTBaETyrpDz39wBhQTV9RvjPFBornYgEYWkjgeERdDXyfQVTl4+VPB/lDfVSmMs4KwVWTdHK3MyLZnj04YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 3/3] AMD/IOMMU: consider hidden devices when flushing
 device I/O TLBs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Message-ID: <09b6d94d-0116-c8ee-5daf-ddcc19d37029@suse.com>
Date: Fri, 17 Sep 2021 13:00:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36cf4f44-f01b-4a7c-8621-08d979ca6d4b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270328D1C14B1EE4A5272B83B3DD9@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KGTGPCCMm0q1JRK10lrwyZx1NeJytN8Qpzh4Ejmx8egLCQ85cv1fou4gEnKnRodjrOHhMsh7fVt2cuIW1zd6/7YSD04PUS5363B8Ixlq7CF9UIOVPt/y4xJwpJGFSdSmMbgwqHnV1ewEOgcYfhMPqYGKsr+kFsQL8OORDngmp1DrcbT1cWdpZEkvBl94hX77tbatzvyVrbg90GzT85eF62RaPTkOuJWWkM7LdLssAOiVJh7TphoFajCYW13F7s/RjzzEaxFZOdJzeIB9/H9fn32G8s2aANb3sRVdQjwulw92h/uYitDEf/8yanFzhU5l9DSBmX1aVHoLE6Jz/uH1/LVi+qs+nGfA3O2Q66sAEwCSZ+a5r/zkP71tMpPeCaX8061ov0eHgui84PkGxZ4gSUE5J5aa9AnQKEuuS61kGMCXtgbA78RDvetDRH5oed8tt8+WF/wRdAJOoJDSpS2glYpQ0BGebO5teInyGts7g3EdOXH5PU856qDmf/VuuKFchLwgg+cD39LeEhKUJIHTOnPGZdKJljfvKj/UHL7NOOOVOf7I99K/KdUdOWoWJTue+4GuBAwolZNe6dTZ70vnn7Qfhzd2DDBpGPa26NHfmoa0igN9tjUDxLMnW6zcXn0nDFZwSj8ICBML5VnSEpJ+WiNoKnTYDcMC7nSAwx3344fNS6+gcbi9TKFF476kOMu7hNw407mfnDN8YSXiKsPJHAdFK61KkrlSRWVa9IU8yvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(2906002)(186003)(316002)(4326008)(16576012)(31686004)(956004)(2616005)(26005)(8676002)(8936002)(31696002)(6916009)(83380400001)(6486002)(38100700002)(66476007)(86362001)(66946007)(66556008)(36756003)(5660300002)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkN2dGZ0NnpmRGtNV1lKTE50eVdnU2VRMC9LQ0g0dnJVSnRWSXFVSWRNUVNz?=
 =?utf-8?B?RDRtNHAxT296UHJoajBjN2FpSE1VSGtWYWM0MTdqSm1LeENud1ZsUnZsdjdr?=
 =?utf-8?B?aERDUWl0Q0F6dVBrQkIzV2ZpNjBvb3M5R0IwQVZRV1pzNzRwQU94WVNMMHFy?=
 =?utf-8?B?QklSaTludVNSbzJpNGNQQ3diZkt2bURMU1hCVEo2cy9EWnkrZ2FjUHdLZ0dz?=
 =?utf-8?B?WmVUWmw3bThNTWdkWmJtZ0UwbGx0TGFBZWlZTVdjRmVmQVpBY3RqNDA0TlBC?=
 =?utf-8?B?bDFOL1B6dTRtZ0VHdHFFdFpaekV5cUduci9TZU1NUjAzQm9wTnJCMnE3MlBu?=
 =?utf-8?B?QU9jeTI5V2JWZ2xreWFVM0MxMHdrT21xWDZEUzdWQkRTZ040eHZadEpVaHY4?=
 =?utf-8?B?R3R0RDFad2w0bUNJMkFDUlBXMURDTEtKU3lleDk4YnJmOE1ubDRMN29nQWRW?=
 =?utf-8?B?WFY3V3gwWU1VcHBDbjFSMFVrZmFmMmJyVWZwaXJJcjFZbWhnYmZNTUtvUUxL?=
 =?utf-8?B?c3Uwbk9pUW93Nkc2VzZqaGh4dExBNDBqYnlwUU1KL3VtNWk5VkYzU2hQOTVo?=
 =?utf-8?B?ZDBta3B4eVEveWRneDJTOTdqVFVRaW1BTVBGR3JMQWhuOHloN2ZXcTFLZTZB?=
 =?utf-8?B?ajFpUm5RRkVtZ0JVOUVFR05BSEk5OGlGSXVUSGVwMFFZYnJ5R01MakFvSmxj?=
 =?utf-8?B?REhJU2JkTHdzRGlNS3ZZTnA4bTEwcVhDSVd3OTkzSHk4bExXbEVTbE1pREY0?=
 =?utf-8?B?WUw4eFlrdVJhV1dyNEJTSG16VERNNmpWNlVtSFEvN29DSEZiVVdUWXdWYTVy?=
 =?utf-8?B?TVJFM3llZmI3U0VhU3ZYZkxBaWdPcEg3WHNOSjJySDhtNllZYnMvNGV4MzNu?=
 =?utf-8?B?NUlyWk52UXlHWWlTcGo0UXg2RVZ6V25YU0JaRlZiMy9wbVErRGY0cHUwdDY5?=
 =?utf-8?B?WmsyWnI3bHVVaDcwOGFSbHE5aEdPSWEvdjlTVTVQZkZsbURvaXdIOVhXMWNX?=
 =?utf-8?B?MHdjVnRmY1c4c0JvS0xEOVp3Z1ZJRk5YeUV6OEIwYjB6VThPQ1pFMzdjL0lT?=
 =?utf-8?B?VVl0UGI1OGpZakM1bTZ6TzQzaUJnSE4rcldrS1FNc2tKS00vLzhzZHN6UEtH?=
 =?utf-8?B?K2R0d0RjWGFrVGFsZkpOWHFQNlVNV3dFZHB5NlFMYmVuU3ltWVpXdDI4RjF1?=
 =?utf-8?B?WUFvRDRWMjI3cTJmNzJ5MHlES3Jtc1NieWFtVDI5ZFZhZXFrVE9VM3pBdFpE?=
 =?utf-8?B?VUhUS1dlcXFOY092QmJHditsa0J6VzlJOTF6bEIwZkFnZlZUek9sTXNHbjh5?=
 =?utf-8?B?NWhPZ3BoakIwdXdQalljVWgzS043WUdBYTRBYWw5WVQwVEMrSHY5b0lJb1ps?=
 =?utf-8?B?dThlZTc1ZVJ5RUcwU0hjUC9LZXVGb2IvcXVEUHVYcGlaaHBtTDBpYWwzU3Zn?=
 =?utf-8?B?UHBuL3BzRDhzMldaRm41Tk1LVWo3NjVPZXNmdXMyUjZmazk4UjBxZlNSWEds?=
 =?utf-8?B?cjZMbXdyRy9DbmFYWmxGUTVWSDA2dHJLWXpyaytveTJTblJselhvcU44emNP?=
 =?utf-8?B?SUwrZkxuSnUvL2N0OXFuTVB0anQ2c3pOSXpvQXU1Z2EvNGFlMFkvdjRCT0pJ?=
 =?utf-8?B?WnlGYThIU0dNME1BblNBTzNqQWsvTEYzUDB5MlhDVlFOdkJTTTNWdU1lYTNq?=
 =?utf-8?B?OVY3OWFneTUyYXFWTU5XWDhmd0MyWWFTNXpCNHNHOXZzeHVTNTRUNnYwUm13?=
 =?utf-8?Q?0q2bFKecNqmiTZNcyPdFfd/YQ5P/lNULqFXD95s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cf4f44-f01b-4a7c-8621-08d979ca6d4b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 11:00:57.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUD4ROF98DrhOs/ELWeR88UJWCn6VOx8NZyK0TGaGfogV5msEMo+hSbD2+Y9esviinfECq2G95hDZAneVRihZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

Hidden devices are associated with DomXEN but usable by the
hardware domain. Hence they need flushing as well when all devices are
to have flushes invoked.

While there drop a redundant ATS-enabled check and constify the first
parameter of the involved function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -308,14 +308,11 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
 }
 
-static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
+static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t daddr,
                                        unsigned int order)
 {
     struct pci_dev *pdev;
 
-    if ( !ats_enabled )
-        return;
-
     for_each_pdev( d, pdev )
     {
         u8 devfn = pdev->devfn;
@@ -343,7 +340,16 @@ static void _amd_iommu_flush_pages(struc
     }
 
     if ( ats_enabled )
+    {
         amd_iommu_flush_all_iotlbs(d, daddr, order);
+
+        /*
+         * Hidden devices are associated with DomXEN but usable by the
+         * hardware domain. Hence they need dealing with here as well.
+         */
+        if ( is_hardware_domain(d) )
+            amd_iommu_flush_all_iotlbs(dom_xen, daddr, order);
+    }
 }
 
 void amd_iommu_flush_all_pages(struct domain *d)


