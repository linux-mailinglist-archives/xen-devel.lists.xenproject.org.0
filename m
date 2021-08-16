Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008C3ED9E6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 17:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167403.305565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFean-00046U-Cs; Mon, 16 Aug 2021 15:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167403.305565; Mon, 16 Aug 2021 15:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFean-00044J-8B; Mon, 16 Aug 2021 15:32:01 +0000
Received: by outflank-mailman (input) for mailman id 167403;
 Mon, 16 Aug 2021 15:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFeal-00044D-CH
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 15:31:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6b52372-3952-4938-ac2c-bcd408aa82be;
 Mon, 16 Aug 2021 15:31:58 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-gu5T-ul5PBecywOUwMWc5Q-1; Mon, 16 Aug 2021 17:31:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 15:31:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 15:31:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Mon, 16 Aug 2021 15:31:54 +0000
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
X-Inumbo-ID: a6b52372-3952-4938-ac2c-bcd408aa82be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629127917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rk5bsRVmd168z5+RIwq3jLAB6dql/1sgp2aT+H6oh1A=;
	b=IPg264ZN9KzYwe47Oyx5h/X7DZ4EUmrpF0hotGwGv/NWfjRlO2JJxw6by2A3vTCeYFVQzc
	NI+tg4s1D4pLGQGWrVqt4zY5X+vwxuqFVjng2zFS4JrGtsoG/VuIjo257IkhccEK7aVGDD
	RUvrLvT2vh0Zi5LVoiUIah2QxRZY2WE=
X-MC-Unique: gu5T-ul5PBecywOUwMWc5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJJeGuszG1fwDILxAXQ7RRkNwd0y6s0u5Sd+zv4QQwIro5almD+c0c0O32P6XKS/U8bCzSD/HwZ7GkVVFUQTIv6tQprJRfeeBooMNM+I+n8bWm8SIfUU2TUbxX0dLuY7kC91xapzLyxkZtInl1GRLOCoQqxFHphhVF+WDqOnofZ05i2P1o6CcvoyuFTnv4XmiQwpyyvyf6s6FWuqHUXQXchazP45dVNPUUtJxjGYCNiExHR+bkSvAUwAVLRuTvtqFyhx//vdAdegk6vc+QSnPAmdAoG5ldVVIlHfmNq19FStzikJlJBdRko77K249dxjL4AVAFe4eYhXXpyLV/JJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk5bsRVmd168z5+RIwq3jLAB6dql/1sgp2aT+H6oh1A=;
 b=dFbgplexrXGnSHh/MMgxfmvp34mkR41CajD+Xh+LE5p0xoitdjeqdFXC7XrUfnWv4HSMsX8Cl4hE8v8GaRKO+qQ+O7Y2wMqqZ8QvULve8fTGqEvflZXfyGSLQvOLzvNEB704O6efgAbrjSfQf0+sJJOoZqbcqq2iBr+g2VkpaZ7MyEiWQrGJy0iZED1VMTGnw6QSvu1ZfiZS1jNNYwJrZcHXLcplimV2/5BRNbYKNi2gt+BFWw2HtfD1UHtoIB/MkgPZcAYdXWL4EZJ6BezooOTWiH1uA0HOgwM+aK8OC0cAIhYAYlolThUkTK8qG6YBXkPajnYBvc1pmsRW8yUVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU/x86: don't map IO-APICs for PV Dom0
Message-ID: <d01563bc-ae9c-fe91-b313-19a30af09170@suse.com>
Date: Mon, 16 Aug 2021 17:31:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a564d33d-1c1a-4082-1f41-08d960cafa6e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63811F7072DD13B26C23DD4EB3FD9@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbr2cnnGcWRph5tLpuSP9jZloElWgi1x9PijZtCDALY8IB16r3meUhXIxi4+t1vUtl15AuHDgjdft//RmtR8dnaugEwrfz6tG/0W5KYpaJ8FreFEOH9bST8/4W6cwp4FmnKYstlkcZowJaeS3a9hiUhfw6xavhugY2jhZQmERvMPMucONG3F6M5kZ0U7VSrsX7mT8fb+/WlwdcP2qrMGta8YyESV1npFPsPg8X+JRt+YsxJu+LWdAAPMrXvAYh3KuiZQP9MfaGEwL6yfp4EM8lbS4FxxgrD5oHkNf1RZSm8ggCg9F5pqsdOG24ng8E2DxzIFgn9LP3wnGPozczgXDqvwx0k26gUnhH17P7D8Mdnu1V/WymMq4bYM8R/KlgLUt/fDb+PPulL5Rbq4Y6Nbpznk4RJ3eUJiHPVVrLNiKXvMS34YsJIF/OlHaiC+C2zYKXtus+IaT6VfIBA4qunOXCrtnZjUng5fWWueg3itTzMN4NYKyl+ypBUEAuH7b7t7WJSnBmPtyD8/UvZTa7uFFNmnStmIDTNtLoq/A/yOa8wHosX8Zf+m4A8ZJuTrQNr6IhQ5viCc7y1ymcDKFJbYjKhdVpgcoyMg1getD/hdMG5gBMFkm3MrObWaXwCEsJIL0IjZ6zR88gu3JODmNgYZtk9IvvXsEGIRsStxmqo3y8iRBEJAUgVSDQLbZbY1pDrsSlsAmtaMWfQMOSWnotboKVzvs+FOSICmzww/MIRBj3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(366004)(376002)(346002)(31686004)(16576012)(956004)(316002)(8936002)(26005)(38100700002)(86362001)(2906002)(31696002)(66556008)(66946007)(5660300002)(66476007)(2616005)(478600001)(4744005)(186003)(8676002)(54906003)(6486002)(4326008)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWJ5a0RQWWc0cHRrMHZQOHR1NWxVVE1HT2dlSElieG5zN29wdm05cEkzMkJh?=
 =?utf-8?B?emhEa2MzMVRPRHlpSTBveHdYU3FUYU1zZCtjd2xxTjduWHJpTHBNemxnMEgx?=
 =?utf-8?B?ejJFOWROTTBpMnZFYy9pUWlXY1hTT0wwMThKYzBWSXRrS1laaTdwbEJkWXkz?=
 =?utf-8?B?QXh2QUlER0JJaWtwM0ZhOTBqOE5TaGNwcGxVcG1vYWxreTVrNzcyaTBLWllI?=
 =?utf-8?B?WmJ5dzdDczFOVzN0ZGZBUFZTdG9rTE1QN1NLVFAwMFFEZGlGckI4NGVaNER1?=
 =?utf-8?B?K0dVLzB6enk0cDh6SElkRXZESXFwODFTRk5kNms4TnBRSzJOOGtpL2kyWkZW?=
 =?utf-8?B?Zmx0dk5aSGlRa3hncGw1b2V4Zjd0ZVgzZWF1VlhNSWFhdXlCVXJhU0JhOHVJ?=
 =?utf-8?B?d0lXZUM1U09seDNqVmJrVlo0Sy9lU3MwKzhqWmVlOEZBTWwrNWVLOURCTWMr?=
 =?utf-8?B?cHM3OG5FUWZlMm14c2N2L2dINDMwRm80THpzWnlmem92dmJjbURocnZKL25w?=
 =?utf-8?B?V3JMT1lRNWhWdzFpZlFOaEhmaENXOWt6ak95ZTgwbWZKWmZSc1M0S1lFM1Vz?=
 =?utf-8?B?QnJDKzJtelROUldWdGRwT3JzZWdtOFBaTDBvRjVuM2VlZExiSEFqWXY5ajhq?=
 =?utf-8?B?T2phZ1NRMWZLKy9kTEpwWlh2Ym1DVzJDaXJ0RXZsdmlGYTN4U1EveVR6c00w?=
 =?utf-8?B?eThvaDNDN3lvN1MxdlMxMEhpUnljSFNld0hqUlJHVFM3bTE0aVlxQWRzYmxE?=
 =?utf-8?B?ZktWSVJtc20ycXc4R3k2TEVmOGlvUjMxcHVUcXRUblREU2FHTmM3ZDFIeU10?=
 =?utf-8?B?SzR2UTQ4V3huNTBSc2xtQ3NVM2d5VDdRSnJjWklUMDByYll3R3BsMTQ2Z2sw?=
 =?utf-8?B?YjIrTm5pRXMvemVkb1Fvbnl5YTA2UDNLOU5LcHhDTTN5cWFpcGQ3UjhaZUk3?=
 =?utf-8?B?enFsZ2M4SDY1Nm4vWDNyZ2dwTUh4QXZxT1VtRzB3RU0rWkI5cFQ4eWtmdk1L?=
 =?utf-8?B?dk56eDlKZVBYWHA1RmJRQXVVcTdySWVCKzJ3WDNpSHA2NHMwN0VBZ1JCOEV1?=
 =?utf-8?B?S2djREpDU3FxQU9YVjlJSDJHUHlaYzFpUkRxbWkvbFJnVmVwWjA5Vmc5QVQ5?=
 =?utf-8?B?YUxKbHZuUTBvOU5BTW1valhvc1Njd2VsWHFiSE52MjBFelJ5TUVQc3NibU5x?=
 =?utf-8?B?dnU5c1kwNzRldEN4MTFmM3dkeEhNSDFoMTVQWGMrMi82dnVDbTdvOGlLMDZG?=
 =?utf-8?B?bTEzQnVaZEJjWE5yVjBpdkEzUEhZdjBqN2x4U0NEN2dFOVFZcXYxc0EyYWcx?=
 =?utf-8?B?VUdxNnZvQjRGWDkwMGtDZVpYSDNJTnZ0NUlsdXRRYVE0Q0tTNkZaL1Q0SmpY?=
 =?utf-8?B?Zi9tMGVuNm9ZSGFPRXE3eGI2dk9TbU5BaWhyaTVUVVhldjR1RWF3alBLZzNJ?=
 =?utf-8?B?MHlvMWJZZ1lMdERIcm4xUFFQL21PYjVSN2RjbkRzUnRNWUVUWGhlNDlBcEU5?=
 =?utf-8?B?a2ZDTUcyMWVhNHQ0WCtNSjE0TnZ1eTRwTVFMVTl6eUN3QW9ZTUJzdFUvaXJO?=
 =?utf-8?B?T2s4Zkd2L1VKMTVBU3RlTUZ3SitNYktSOEtqbTR3YzI4ejBvekxSa1dmSnBU?=
 =?utf-8?B?dUJvNzNieXo5U3VpVC96TlZQRExWNzBVd1BzN24xSVVYdFhwWlR0dTZ6TXN0?=
 =?utf-8?B?Yzc2dmhvaUZ3cjZ5RzVMTkMrOFN3T2VVMm1rRDRSQTdwK3JoZzcrZ3o2eEdi?=
 =?utf-8?Q?P6cRDAvdBphR9Go+lSPuw1NlkRm5S6VJQcvTWgF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a564d33d-1c1a-4082-1f41-08d960cafa6e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 15:31:55.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GStgEkS1SWgRRyitjzOd0ClIn7vDn70bdu4U3Ev6GJA0/HL3i0dyFIZy7XS0c6pmHmDyjm2DDP7apm16hh4fDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

While already the case for PVH, there's no reason to treat PV
differently here (except of course where to take the addresses from).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -199,9 +199,18 @@ static bool __hwdom_init hwdom_iommu_map
     if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
         return false;
     /* ... or the IO-APIC */
-    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
-        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-            return false;
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
+                return false;
+    }
+    else
+    {
+        for ( i = 0; i < nr_ioapics; i++ )
+            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
+                return false;
+    }
     /*
      * ... or the PCIe MCFG regions.
      * TODO: runtime added MMCFG regions are not checked to make sure they


