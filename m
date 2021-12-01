Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F3464ACB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235730.408918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM5W-0000sj-6c; Wed, 01 Dec 2021 09:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235730.408918; Wed, 01 Dec 2021 09:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM5W-0000pk-1h; Wed, 01 Dec 2021 09:39:42 +0000
Received: by outflank-mailman (input) for mailman id 235730;
 Wed, 01 Dec 2021 09:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msM5U-0000op-Qy
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:39:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aa8efd3-528a-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 10:39:39 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-uXMnin7MPoyxtPgGsd-MBA-1; Wed, 01 Dec 2021 10:39:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 09:39:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:39:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.9 via Frontend Transport; Wed, 1 Dec 2021 09:39:36 +0000
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
X-Inumbo-ID: 9aa8efd3-528a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638351579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWiLXoypwdsEAY6kyd1+aV8MaMHsKsQSdAXMXWcxPL4=;
	b=jX3XFIAMotZgGXPljnI3EYJbK2FEdpActgapowoaK/Q+bvR5QlSMKZYFCwjqfkLVjcJ+ea
	etfBYh90748paoDIEeU4mQ/iPrSk3A3S35QyNBie3762/ix1TsjRAd11S3vJqyQwgdtXG3
	/zsNW5KfYWiGi70aJjzLPebJXzBLbrc=
X-MC-Unique: uXMnin7MPoyxtPgGsd-MBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg1p22ww2Mj8PuxNEd6kVkeC6CIraUD2K+mRcgpoECbqODXaSvtfdPjQm9j82D2btGHDlWdQawNrQgtrDdNOQanFXtbwfSQPzrbSPinN0WAKlfAWHmJeQLxLQ+LXXuL0jioEqPnxDfTvyTR0PFkfb9kP8MqgPrfxUh5VFU0HyG5imqpNJJwLH38pXhsreqFW0bJWP22PSAMRbeY31c0A+on2RUfpopM8oCt3suzG5uK2Mai9JJ7zcjyS0AGbfnRSgnB6N+fcX+1dsPmHW78BbdAVlbjA0JXKS1chYUzkf3rhlblfV6hlzDOKDJHpp1p+Q/zQ/4FC0fzm7f4lLVT1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWiLXoypwdsEAY6kyd1+aV8MaMHsKsQSdAXMXWcxPL4=;
 b=a/VzMlj6WLNbnX7nVqs67SWZgi8drO7Tt2nYQdEDt+ZIn++pnzohHIqMclp0t4supNqPeqBJNExTaYMqokJFxSjtMx1NPwqpJfzm142rHvH/RWjgor0V3V9voQXmhuq3/pRr5bXP1wj/NmOOjOu5XWdm7JhoQgcMeIhaLa/z0qe9eJnUQpQR8IMVnGHEiDLC5+Mspu+UG78PVuBqRK0llAC1zkiCjHCzGd84OBqftLAwNy46wHHjoKz0qzHHtVHNP2R7JOrL58hGLPWFSbm1XNhI0Yd258jBTV6H3GpQjFFIgqgXEcjHvjQFbmcz5MyQOFb7h5R1LN/kXCn+/EB9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7a7ce32-f921-ced7-4699-26f907392eb4@suse.com>
Date: Wed, 1 Dec 2021 10:39:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
In-Reply-To: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9caa85a3-1e9f-4c7f-fb3d-08d9b4ae7d4b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54719C067BD76C4BC167108BB3689@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vrXTh9NIooEEuC4eaWqEdhTcoVz9Kh0HZipCq1Cpr5R3Z6Bg7TzYsMqyePa0gIkoDpGzVB12kq60aHCjSzc5O+PAzD1Mpe75hfqm8M+O8OLcs5aGBS3EGoONIkWNCswOt/17KepgGip7FwzeIjNaV8ZPdafFrkR12RqUTVIqRR8GSEmBLLMxhU6WhU5BhN1M8oPhi3NHUZKEcxTEh6m0Jf7CulAvB41KeITAc3p/IAM8ZuyhD7tHUeDPSIx1uNIQHHTbKlWDVaOltj30dnA2JYrINIPxCvz+JoYVKVZz0c7gsfhWRGCVw0Hra1/tzaZowomR/oSZr/f7AM7n8WLfO8wEDiRkTxeKvDkvllBOMc47YLQKmsAdLQLn2+WpnhpLMc7pAPnECimmoEXAdeC1ItNdxGqsNriXDlt7ohUvry+pDy0b9iTjPeY9bAVTfuaBYVaVvPTNtmBb5o6cci5Ex2xIAtHgC3lrE+bN7IeeeUSXRbULqxfPv8l0d4h4+OKwmW+wJtRfK3N5NgyxncwkGuvG/4AwrEF1fv4sV/QkUqZLrcLG5OW3RoNNmWFjs20hSzyO6nBrPGNQYfF0wnjbSi6bpHzwmbGea8mkYD8A27bUpJnzxqXkO6F4xn0S2p77UhXXyx/3vWbowfjVb1qXDwtCpAR5zf4vFlp7lFqse6hSIGZsnMKFRnU3Edk2xGo9uphsQCzCqsRm5KnCVzeNzJ5lJjRE0Z5Y8E+UoGtK7vThScI27ewxO63VN+aWyxtG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(16576012)(6916009)(66946007)(4326008)(66476007)(5660300002)(508600001)(26005)(66556008)(186003)(54906003)(2616005)(316002)(956004)(38100700002)(83380400001)(8936002)(86362001)(6486002)(36756003)(31686004)(31696002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpYeFA2T3FHRjRQL0ZwT0F5Uy8xZ1pIYWhuTStoaWRSR2hMaXU1ZHgyTkdj?=
 =?utf-8?B?Z1ZKVmNGQmh0bzJOR3lnaEIyWEJLeEdoMmJQcmozTGhwb2RTZStBeFE4TTU3?=
 =?utf-8?B?QXdueG04YlVPUGxLaWxncGc2MkZOd2dEbmRrQTlhcm81SmV4RXlDS2pyazFl?=
 =?utf-8?B?cnNGYklDcXBkblNURkdpS2NFbzN4U1JUS3RuTVB5ZFZDTDFlYkVYdHdGSGo0?=
 =?utf-8?B?NlRmeFJOejZIV3dwWThWTUY5ZWMvN0UvcGpqZ1Z5azF0MmlTbE8xYVVTTXJF?=
 =?utf-8?B?YVh6U1orb3ZaYnBNdWNKZytOdlk5TGNtbm1kQnpMQ1pLZmZ2M0pydU94cnNB?=
 =?utf-8?B?cThkQmlXMjV3RTV5M3VwN3lVak52YVVIOVovc3pPaVk5SFVNMlVacFU0MXhs?=
 =?utf-8?B?YW96ZU5ERGJHRUlMQitGbFBwcmo2RVN3LytrWmpZYmxUYWM2YjgvTVB5RWc1?=
 =?utf-8?B?NVJXMkdURTc0dWozNUpOU3EvWGJtb3NrUHpUOWtSNFNhdHhGTW9ldmdjbmg1?=
 =?utf-8?B?NVZ1VXJFZ29wS3JMaGlhMkc4cXpCNzAxM1AzZzNBQjBnK1VxaFY5eldEMStO?=
 =?utf-8?B?Z1RnbXJaK05sWUVyOE05MDd5TzJ6RjFZS0tQOUhZblZtK0xTamVIckNtTFov?=
 =?utf-8?B?MzBrckhHdzFHQ3lMQWlXTEdMdGx1SGZTbHJ4YlUrcmZkYlliT2lRTzhjc3Y3?=
 =?utf-8?B?RktTOEV6VityU0lpU1AzMUkwbDNxd0V2dXNJUVNwNVZZbndMT29ta1dYT2I3?=
 =?utf-8?B?ODYreWt1Vml5dkJJV3B2YkRZMVd5QzdnQ2pPMndibkxJZUtSb3RIdnFNYk01?=
 =?utf-8?B?cGpJRW4rNmZDY3krdGhldDZQay9wUFR1Z1pTSzFiQkJOZjdlcjVBeWdrSnF1?=
 =?utf-8?B?OEZFOHpZeU9rbDhmVFpZUnVicUQvbmh0Z0lHbFl0MkVJanY2dVBlSzB2RWYy?=
 =?utf-8?B?NlRPeEdTbFprZEFDU1VtQnJEUU1RRC8zS3ZOdCtOOTZZRzQvWWgwbzlCNEVO?=
 =?utf-8?B?a0RhMFVhZ3FITi94cktKZXpmNUoyR2RsRlcxbDVxUG05Y0Z3LzBTMUE1d1Yz?=
 =?utf-8?B?UC82NUNlYjlTS250WS9Pb3ZMYkp5dzN4anI0N0w1WHJZZHE3KzBnQnNmSDZx?=
 =?utf-8?B?YzFrZjRwYUpkWVh1QmZtOGdwb3ZzbkNOQjA2YjdzbXQ2aE9FdWZ0TUxZU0li?=
 =?utf-8?B?T1VQM0NLYysxazdiMFJBbzZWdFFEY1ZtOE9sVU0xREtsR2k5STZHVGJFbTBl?=
 =?utf-8?B?dEdtL3VZaDdJMml2MU1pdXhDdFlud01pc2pDM2Z6a0wvSmo3QjcxQWU2R3Na?=
 =?utf-8?B?T0d0ZEsyd1NIZFRoRCticTNMSDk0a051NmZ4MlNOSWFoaFU3aXlmZzhTTktV?=
 =?utf-8?B?NEIwbjJoeWdNZURwWmdQRjNpY3ZPMnE4b0lsd0p6TkQ5NElSTHBuQy9vcXM5?=
 =?utf-8?B?V2tSWWdKeitGQXZLTFBGUzVkM3BlVmdsSkt2VlpkMFVxa2xKT05qTzNjajB0?=
 =?utf-8?B?Y1lUbzFZYk1PNG1RYld4WHNSdzVtYm5CRE8wdys5dWluNjdQY1MzWDBpTmJL?=
 =?utf-8?B?WDg5b0ZTN2tCY2dnRkpqckZSUFJqNXBOeWJ2S3J6dTJLWElvZTFITjZzeGtK?=
 =?utf-8?B?UjFGK21sREZKVVBIMUw3M0RZNEFsNkZ4RmpvSjh1TTBQQ0piOHp1encxb0ZS?=
 =?utf-8?B?T3U5K3I0YnVwMVpueXdub2dLR2twV0FrcXBUb1lYNDY5ZE9peUg2Ni9BZFQr?=
 =?utf-8?B?S3Zydm96Um53K3BuSjNMWm5hMm1KVjVjTzgremdxQWVFNDE0aXNEMW4vZmFu?=
 =?utf-8?B?cm9ab1h5WWFHc3JnWG96OHZya0JaUkQrN2xBQ0VPWDdwdWRXRU5uR0pBNmxB?=
 =?utf-8?B?ZTY4S3JEMHRlRE1JT3o0QU5COUY4VFFkYVg0c0pNUHkyUXo3cVVaOEtCeW11?=
 =?utf-8?B?SlNXNmhFcGtYSXBwOUh5MEFTbTRRK3lWQmZnekUvVWUvRVFnSi9hMVpTMTZ5?=
 =?utf-8?B?clNCamlwNmg0NVBZS2RuVCthSDJIb3VaVE5kNDlmbTVpQ1VWUW1qODNpMHN6?=
 =?utf-8?B?NGZQSTZGa1IrelZNZFFiRVBmZVVSdjY3bGVZVldtcUo4cDNBWVZMZlU2bmlh?=
 =?utf-8?B?RjB1dHlsbjdQSEdxbjUrTW0xMEdJU050MnF5VXBuZkJwV3dQRThaRlU2NEVx?=
 =?utf-8?Q?jeL/Fxeawi5g7ydOQlAH6vU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9caa85a3-1e9f-4c7f-fb3d-08d9b4ae7d4b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:39:37.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cA5etbvuCg52XXzDe7gtqaaLdff4JtzyuoC79iWrzq5XE6b4HV7K1/QfHfIFV4iBXJeYSCUP87SBDdD0k6QvrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

This is, once again, to limit the number of indirect calls as much as
possible. The only hook invocation which isn't sensible to convert is
setup(). And of course Arm-only use sites are left alone as well.

Note regarding the introduction / use of local variables in pci.c:
struct pci_dev's involved fields are const. This const propagates, via
typeof(), to the local helper variables in the altcall macros. These
helper variables are, however, used as outputs (and hence can't be
const). In iommu_get_device_group() make use of the new local variables
to also simplify some adjacent code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -198,7 +198,7 @@ int iommu_domain_init(struct domain *d,
         return ret;
 
     hd->platform_ops = iommu_get_ops();
-    ret = hd->platform_ops->init(d);
+    ret = iommu_call(hd->platform_ops, init, d);
     if ( ret || is_system_domain(d) )
         return ret;
 
@@ -233,7 +233,7 @@ void __hwdom_init iommu_hwdom_init(struc
 
     register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
 
-    hd->platform_ops->hwdom_init(d);
+    iommu_vcall(hd->platform_ops, hwdom_init, d);
 }
 
 static void iommu_teardown(struct domain *d)
@@ -576,7 +576,7 @@ int iommu_get_reserved_device_memory(iom
     if ( !ops->get_reserved_device_memory )
         return 0;
 
-    return ops->get_reserved_device_memory(func, ctxt);
+    return iommu_call(ops, get_reserved_device_memory, func, ctxt);
 }
 
 bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
@@ -603,7 +603,7 @@ static void iommu_dump_page_tables(unsig
             continue;
         }
 
-        dom_iommu(d)->platform_ops->dump_page_tables(d);
+        iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
     }
 
     rcu_read_unlock(&domlist_read_lock);
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -861,15 +861,15 @@ static int deassign_device(struct domain
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             break;
-        ret = hd->platform_ops->reassign_device(d, target, devfn,
-                                                pci_to_dev(pdev));
+        ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
+                         pci_to_dev(pdev));
         if ( ret )
             goto out;
     }
 
     devfn = pdev->devfn;
-    ret = hd->platform_ops->reassign_device(d, target, devfn,
-                                            pci_to_dev(pdev));
+    ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
+                     pci_to_dev(pdev));
     if ( ret )
         goto out;
 
@@ -1300,7 +1300,7 @@ static int iommu_add_device(struct pci_d
 {
     const struct domain_iommu *hd;
     int rc;
-    u8 devfn;
+    unsigned int devfn = pdev->devfn;
 
     if ( !pdev->domain )
         return -EINVAL;
@@ -1311,16 +1311,16 @@ static int iommu_add_device(struct pci_d
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
-    rc = hd->platform_ops->add_device(pdev->devfn, pci_to_dev(pdev));
+    rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
     if ( rc || !pdev->phantom_stride )
         return rc;
 
-    for ( devfn = pdev->devfn ; ; )
+    for ( ; ; )
     {
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             return 0;
-        rc = hd->platform_ops->add_device(devfn, pci_to_dev(pdev));
+        rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
         if ( rc )
             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
                    &pdev->sbdf, rc);
@@ -1341,7 +1341,7 @@ static int iommu_enable_device(struct pc
          !hd->platform_ops->enable_device )
         return 0;
 
-    return hd->platform_ops->enable_device(pci_to_dev(pdev));
+    return iommu_call(hd->platform_ops, enable_device, pci_to_dev(pdev));
 }
 
 static int iommu_remove_device(struct pci_dev *pdev)
@@ -1363,7 +1363,8 @@ static int iommu_remove_device(struct pc
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             break;
-        rc = hd->platform_ops->remove_device(devfn, pci_to_dev(pdev));
+        rc = iommu_call(hd->platform_ops, remove_device, devfn,
+                        pci_to_dev(pdev));
         if ( !rc )
             continue;
 
@@ -1371,7 +1372,9 @@ static int iommu_remove_device(struct pc
         return rc;
     }
 
-    return hd->platform_ops->remove_device(pdev->devfn, pci_to_dev(pdev));
+    devfn = pdev->devfn;
+
+    return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
 }
 
 static int device_assigned(u16 seg, u8 bus, u8 devfn)
@@ -1421,7 +1424,8 @@ static int assign_device(struct domain *
 
     pdev->fault.count = 0;
 
-    if ( (rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag)) )
+    if ( (rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
+                          pci_to_dev(pdev), flag)) )
         goto done;
 
     for ( ; pdev->phantom_stride; rc = 0 )
@@ -1429,7 +1433,8 @@ static int assign_device(struct domain *
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             break;
-        rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
+        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
+                        pci_to_dev(pdev), flag);
     }
 
  done:
@@ -1457,24 +1462,24 @@ static int iommu_get_device_group(
     if ( !is_iommu_enabled(d) || !ops->get_device_group_id )
         return 0;
 
-    group_id = ops->get_device_group_id(seg, bus, devfn);
+    group_id = iommu_call(ops, get_device_group_id, seg, bus, devfn);
 
     pcidevs_lock();
     for_each_pdev( d, pdev )
     {
-        if ( (pdev->seg != seg) ||
-             ((pdev->bus == bus) && (pdev->devfn == devfn)) )
+        unsigned int b = pdev->bus;
+        unsigned int df = pdev->devfn;
+
+        if ( (pdev->seg != seg) || ((b == bus) && (df == devfn)) )
             continue;
 
-        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (pdev->bus << 8) | pdev->devfn) )
+        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (b << 8) | df) )
             continue;
 
-        sdev_id = ops->get_device_group_id(seg, pdev->bus, pdev->devfn);
+        sdev_id = iommu_call(ops, get_device_group_id, seg, b, df);
         if ( (sdev_id == group_id) && (i < max_sdevs) )
         {
-            bdf = 0;
-            bdf |= (pdev->bus & 0xff) << 16;
-            bdf |= (pdev->devfn & 0xff) << 8;
+            bdf = (b << 16) | (df << 8);
 
             if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
             {
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -142,7 +142,7 @@ unsigned int iommu_read_apic_from_ire(un
 int __init iommu_setup_hpet_msi(struct msi_desc *msi)
 {
     const struct iommu_ops *ops = iommu_get_ops();
-    return ops->setup_hpet_msi ? ops->setup_hpet_msi(msi) : -ENODEV;
+    return ops->setup_hpet_msi ? iommu_call(ops, setup_hpet_msi, msi) : -ENODEV;
 }
 
 void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
@@ -403,7 +403,7 @@ int iommu_free_pgtables(struct domain *d
      * Pages will be moved to the free list below. So we want to
      * clear the root page-table to avoid any potential use after-free.
      */
-    hd->platform_ops->clear_root_pgtable(d);
+    iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
 
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {


