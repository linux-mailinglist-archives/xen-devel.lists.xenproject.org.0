Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF541C554
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199079.352918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZPg-0001QZ-9F; Wed, 29 Sep 2021 13:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199079.352918; Wed, 29 Sep 2021 13:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZPg-0001NX-5y; Wed, 29 Sep 2021 13:14:20 +0000
Received: by outflank-mailman (input) for mailman id 199079;
 Wed, 29 Sep 2021 13:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZPe-0001NJ-Up
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:14:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f65c171-facb-4f78-9ad8-bd66e0b63ff2;
 Wed, 29 Sep 2021 13:14:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-1Hr4OE5JMYGecOgmdzLptQ-1;
 Wed, 29 Sep 2021 15:14:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 13:14:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:14:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0070.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:14:15 +0000
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
X-Inumbo-ID: 6f65c171-facb-4f78-9ad8-bd66e0b63ff2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Le5BJdNW9ne/Xmuzk0IFXev47snchE6r7a8FNfwFXaI=;
	b=jVzA3KkMCAgyEEzDyakJPzQvqXQDvaNxtdFT7cSpdHODA03ztpxdw23t+deBhPhNlQPgxO
	GPHZAzD2Df6M1r6uf6ueJ5Zn6H2LHyOeArrERaOLsw0lpZBIYL8toZ+uPyxkIRPK+OECTQ
	RGR64opFRVbow6ItAd+dJJlDuOq6VgM=
X-MC-Unique: 1Hr4OE5JMYGecOgmdzLptQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pa70P8gc42nrhMzTduy6SDxlH5qd3UO/ngbw/+cAe3IVXwkSZ2qKjkip8D+/unc72MTUZfnmodjNlqdszToP9P4NN0d4DuF6r1mciUUBpO62X25urL4zcSLYpen2xxvu2SoFWAt/HZaikGyMldbuBDDVzEASmH6DHuZCR8lcfqN6Qr9nPJLgT+mDTsOqjeK6+gUhAcXNkanVUwwjVXbqHGtcePYgoBdrATgqkTmJVN2BkIuDS4EFYkVRo8D8I4caRxy/C4ytq/3Gxe+soqv+VqnnhD0jpQB0GYP/e+6ibDKgLNmpDu71b9ZXRkFRAigCJbMc4IPuaA0LjghRVomeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Le5BJdNW9ne/Xmuzk0IFXev47snchE6r7a8FNfwFXaI=;
 b=gQpLzv+oOu6U5g7uL1B8nU321iyQ6d7bKLQKBSnBGFRe69dOiMPKKKwi4FqGrNmM3vcACEo7M7u/64e4VzeTmebefSdw+bcUHPsopXr7z1XKXqF50RAF95DuKmCfGTPkc+UXtbvaNnnVUi+0ujaxQJlz1A7ge2dGkZXulVVutTon9YwfGIg9Nu5Z9PWx3eVoUspTzPPfHakX3zweGDg7fJasoouZP5KQpeE/LOYK5TLt4l5v8B1dXusbWSZZ2H0CXk9LhrfEcQ4sFOVEghgK8XwPNc1R3bGxjnDLetAJIG0vklz53oVGZirFHZbDbGdzT2X4M+ZtPGAu2q5MXZ9xAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v4 3/6] x86/PVH: permit more physdevop-s to be used by Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Message-ID: <f7023f65-5cb7-fd2b-f320-c46a8e6e1ac1@suse.com>
Date: Wed, 29 Sep 2021 15:14:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdfd7ed1-bf90-4928-51da-08d9834b097b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352577B15E7CF548F0EEF11B3A99@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fg1eFR7mqDHdR2QtkDYfmq3AFHlXbA4h2xrfxmREYz5CYm5BpsDEGj6Z01lot/bmnX58Y1l7fbDRCpP724EVqZPNjv6bw/gj5/2ssK1bW5qHGCzrv+dOVsmow+0a/HfvZvO+xktB182VoUzcvP+vHkhUHAxTWMPb6zrJEYXGEc7NAAR15TSpyEDl/W63sYpV5dWYfBQ1yvg7pyDL78AD8hcJ51Y4sjLJBAjsDMU7lID0OoILEE9CpiQ7Wqcy/izCbd9ikHyjrngSmb6+HjWmmuR1Ol5CYU2GnOcl/3rP337ZobrCQYoQUcykq2VRTh4by3fWoujhkMdRQLoq1cjDRPQvZNzS5FMGDM9Z0IX/+GC8KBd/eBV0ktvPrpcnOpJZ2tO8CXx49IuKpo+hyQFTNi8uMwJw6clrnbfHULY7uFprrjkJgJWKXk3vZKz5kTdFg6rpcbNYAfFRd6nqMJ/8tDGANyLIcdNAKx+KUvu2JjGJ/mt0XVz8dIQPM9+qByIsuJ7uKHivyjLLR4DohtvhiRL9jMl0l2juBgXxhEXhy0OAFKQkJn4ZljSw5Rmk1z4VAcVI8wN6+/eXAJ43TCIG5K9liqAS2+srX1jy8+vXx5NsQBW2He5XDJePxUNscGzWjjBy++/xcefpscxNEH6Kv+51/A/hCYDE4KSAS9hbgyCZIGXPi+kzyepmHHPv7nc+nGWruZghQq+aKqf8Q4W+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(6916009)(5660300002)(38100700002)(54906003)(8676002)(956004)(8936002)(186003)(26005)(31696002)(316002)(86362001)(66946007)(31686004)(4326008)(2906002)(36756003)(16576012)(66476007)(66556008)(508600001)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkdmVmR3c1lvMTl2bkVUSDE4c2w3RThUSnZSUGJ2a0tHWXZxM3VScVhSQU1N?=
 =?utf-8?B?dzZOSFAzZm9FVzVza1lzQ0FveUhKaDNOSDFrVGprTHRjRUFNZU5YUnRiWVF3?=
 =?utf-8?B?RjJ1am5UWElmYnR4dkxEcDVyUC9kd09ZdjBXWm1RQkVXUjMzTHU0bk5sVUlJ?=
 =?utf-8?B?MTJJaWZ2dGc2cGJGdTJrVHp4MVpYaDlBK0QvZlBCeVNvYjJTT3J2cDNWZTFt?=
 =?utf-8?B?QzhNN3J3Kyt1bzdRUlBSYmZYbVAzU1dDMG11MEt5MEwwaG5ONU44QVlMWWNl?=
 =?utf-8?B?Lytrbks3bStHSXBzb1BLN3o4OFhmcGpPb25zWVVyVzdiTFcyOGdMSzIzbHpj?=
 =?utf-8?B?Mjc1U01RVW1UM1FLVzRwNEFudnVNMFQ4YkhVMm42aEFRZ3ZHbkV2WUM2c25B?=
 =?utf-8?B?UkxkN29GaXlDS3gwWUNPbUNWMW9jSlBzckM3UjFLMXpvbXBmMXdaaW1SQVd1?=
 =?utf-8?B?WmxiOFVKM1VoUGxUZ2Zua3hKeWpBclpnODlGaVhkRHZYdnlFL3FwbGNlcE1U?=
 =?utf-8?B?MmFrdlIzclEzRWtLU3pUT1BmU1NDSUlWK09tWGlvbnFSN3p1K01NYysxNU9n?=
 =?utf-8?B?ck5pSG5rMkswdGZrTmZrRXZjWkx1WE1pdnhDNDBnWmhZbkJJMUdxTnY0RGpk?=
 =?utf-8?B?TUZmRnVyb2xKTVlXWU50am1ETHVwMzdjdzFVeWVEZXI0MzF3OVhZMWM3VTIw?=
 =?utf-8?B?WjN2eCs5Y2R1WVM3NGduZjk1SnRQSUt0MUczaUtHeVFFU2drN0xpZys2dU0v?=
 =?utf-8?B?OGFGSTBSSEptQVFFWmdlNFpTRzRMMmtJMk1sbG84NDFxcUdmTElSY21ZQ0ti?=
 =?utf-8?B?Q055cUhJZjlXaXdKb043djl4RzZ3YVVpVmZ6dTZVZGZXeEtmTUFHeTRhSEh4?=
 =?utf-8?B?c2Q3Q3NLendWQ3JJV0MwTHc5dzBIWXJ1bEpJdU4xbnRSZ05xVnFKRmszS1Ev?=
 =?utf-8?B?OHI1b3VYbGNtUXh3TlB3OVBNa0h4eTdkRHZBS2JHNzA4WTBSN1gxd29ydTVy?=
 =?utf-8?B?OUljSnFzVlU5L3NhWmQwYmtJanR4WTdNTXpTaC9NREkzUDhWeWlIM0tGSTRw?=
 =?utf-8?B?NVpCem5yS3kwYVlMVUJ3T3pUeER0bEZWUXFSTWtlNGZQdmkvWmU1V2N5Z0Jh?=
 =?utf-8?B?dVFUWkRFM0RVcEpIbWUrV3k2NVJlSlhkNVEvWVJkZktFSWFOMUFKZm9mUDJU?=
 =?utf-8?B?dzc5Q0p1T0xzUDczSm9Oa2N1SFBKWHNzd0EzUE1hMzd4bVptcytZekorM05n?=
 =?utf-8?B?RHo3OWJscCt6QjdENHdXdU12OTRDdlV4dGpNcGppVWc5VUZId2JBZmtoVDBk?=
 =?utf-8?B?R2NkNnRJMjJLczdRaVA5cWxWYXBnRnhHeGdnNnBzaVFSNDBieFFQalRhN1Y1?=
 =?utf-8?B?NVd3VDZsbEc1UWRaMXdmY3pZeGpuNDhaRlhkY25BSk93UlNqU2ZBYnovR0J6?=
 =?utf-8?B?QnBvN2FONXA2K1dCOGxMbDgrRGNic2ZLTnBaQlIwdTV5OVZ2dlF2VUE2dVg1?=
 =?utf-8?B?dDlqVWx4L2dveWN4Sk5Jc2hyNlR3eXdCb1pMR3FlR3RvYWU0VEVvcWRPZFI1?=
 =?utf-8?B?OXFtMnhDb29jM2ExS2Q5Y1ZNRzhzWnhPaTNUc3FFNHhxOHlybHVOaGxjdjVt?=
 =?utf-8?B?czhwQ0JDNk0vUjRva3pJVmw5NUVJR3luaTFPNHVQSVA5eFJYQUtwT2ttTEpF?=
 =?utf-8?B?bGZBV1BsNjlCNWx5VjJTOE9peUxJNFgrdW1Ta0dEMnRNNXNyT2E4TkUrWVZL?=
 =?utf-8?Q?8XeYtbEdrJgsJ1FIf0hLlo2AI+C8j5mZUZfqJT1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfd7ed1-bf90-4928-51da-08d9834b097b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:14:15.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UR8z8fFJToAsruZwi84K/Tl1R3UgHsesdCpTcyKMP29xs+w5YTbNEjuHpuinF5VvSp0S+xAOR3Xug+wBYhN61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
running in. Permit further PCI related ones (only their modern forms).
Also include the USB2 debug port operation at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm uncertain about the has_vpci() part of the check: I would think
is_hardware_domain() is both sufficient and concise. Without vPCI a PVH
Dom0 won't see any PCI devices in the first place (and hence would
effectively be non-functioning). Dropping this would in particular make
PHYSDEVOP_dbgp_op better fit in the mix.
---
v3: New.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -94,6 +94,12 @@ static long hvm_physdev_op(int cmd, XEN_
         break;
 
     case PHYSDEVOP_pci_mmcfg_reserved:
+    case PHYSDEVOP_pci_device_add:
+    case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_restore_msi_ext:
+    case PHYSDEVOP_dbgp_op:
+    case PHYSDEVOP_prepare_msix:
+    case PHYSDEVOP_release_msix:
         if ( !has_vpci(currd) || !is_hardware_domain(currd) )
             return -ENOSYS;
         break;


