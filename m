Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F064149E501
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261499.452865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD642-0004Ay-CK; Thu, 27 Jan 2022 14:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261499.452865; Thu, 27 Jan 2022 14:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD642-000496-7q; Thu, 27 Jan 2022 14:47:54 +0000
Received: by outflank-mailman (input) for mailman id 261499;
 Thu, 27 Jan 2022 14:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD640-00048y-Kw
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:47:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19e9cdd1-7f80-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 15:47:51 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-QkxKy3ZaNgqEP2Vqov5T6g-2; Thu, 27 Jan 2022 15:47:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4887.eurprd04.prod.outlook.com (2603:10a6:20b:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:47:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:47:47 +0000
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
X-Inumbo-ID: 19e9cdd1-7f80-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643294870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I1TgTZD2+5dVGqfXHMBx1Zok2HcxjSuWbMR77W+8Ws=;
	b=cQOT8IBdtZ9Oo73nlaXx8Y80xzutvzOmhTHxE11d6bNMBjWzuF4vzs7D57uQp2XIyZgUtL
	ONTLSZSkpDDcbxX1tQrlnr63u5/M39GiD2L/UyxgPuXPIJxcQkU6rMAnmHSLzMV8yWGKaB
	H5iUksDy1dxJ4162gxkejycI49EwY+k=
X-MC-Unique: QkxKy3ZaNgqEP2Vqov5T6g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQpV4RTvgVx18TqU0PPmTGJL48fXXOE1ztN7ZTmddf8XKWIJhAMQV4gJjZb9I1VjUcz9drWzklw+BAratZk47jb6wi3kADV0Q5aepfA3Lq9R6WH+ZgfMYyr1u31BIK24m3qDRMIEtnQgrhHDuoWQZzN/e8y3X8HcMoFbuhSQF8+PrqCOzO/oXrD4am6utCPSmr0mHnNgFpW8OMVtZsL97FIDWEpeCZLAqww0nzMjnXSre3HB1dY72Tr9roU6hXhR0glMbN4qaZjuZ5VRMmNs53+DWK1FSJlX056zB0o90cYMM0uPxr1nURckYE9knlM9QctNQTVuOF0q2m3zbD5LaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I1TgTZD2+5dVGqfXHMBx1Zok2HcxjSuWbMR77W+8Ws=;
 b=npiY8yXiJ7YagaTA07oXIy6vY3pB1o3i9D5bx/np6YrYR/eK6Uc4aTypkBYiRL3PDYy4v+6MgQXMbE1in3Gbwpy6MgiF1kknGNKdyj8PLUEsdClJgE+O+PT80wqoXX1Vt+iK8lkB72l+7YC4kOGFSGXLAYy8C4RZ+t6QB7Im7fg1ZxOMsTgL6m+9mGmix+XT+zCSaJPtbUAbHP4Nzmtm8I7yDnDdspnGbkf5kBuejiUZW5TXeeRIpEMqYjPS1HfbIWRVV+9UUomEkAJ8CsXAAPW0Zr/PtksGa4vIhH8UXFFV1KoM8I0R3GeP2qPRmDSUf+pWf2XceJt4vntRUJRkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
Date: Thu, 27 Jan 2022 15:47:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
In-Reply-To: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0047.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c63a46aa-a43f-47ef-e60c-08d9e1a3fc25
X-MS-TrafficTypeDiagnostic: AM6PR04MB4887:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB48875BE5C2886FEEF1FA6769B3219@AM6PR04MB4887.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oy+1oBsgj5mTYoNqMUyONYC3EvkFF6whnq3Ovi93Vg2iQTdlnNvKkxOKL05IDyPigFPuv1qIWszkTBwCwctHDAH3fF1U5T4zlfGe3hVB72SRaixICi+gnW9B7+ZAFpYV29ZZE80+1e1ULKwuIwQm2HmykPPX4OOUUHAdAz9qrBu7VrmhvAD2UiarjuWRFai8L9IVUHo9Ie2fPgqA2m9jGc5iGDUU/T9guHRojWrjOCBRv2C3JwtojcAKM1MLFns0lk8+SKBy+mC5q4xECM14ob/MyB9/wPYGBF7+R0Ge5R2R6+NYfhhjuOSfpkpmQn/HoxyBRecUBIbHvU0ftVxJFsjeQTxlLKUpWyvLi+TrtKuYIbIDfzU+MJAAJN07w+dcik154I/e1POmgmbWat54mwHHqOAW2CHMgmbLDPsZkl7POw6+cGjSiDB2y9qAtZNVu9qZd54ALPNaPKG0sMMlvHO3Aj3G+8gVKDsrjMg7E2/cXSp9xGDAP1SDUyhbirOsYvM+9MKVCW5DGXnD6RL65P2JBTl4rp4V/DYrAe3geR/opQxP3GzdjR8hpHehLD6vTEDlGjNmbJ/BinyIiVUuj3WME0/kwV7TO5z/hpx9Yl8tI+yVBFIQ5zBQvoq0TUGTaMtAaYnjItM1JDPMxx7zIv5m3GTxQi7rc4gxYtgO8MlSnSZFSXC1B8u0UBd7qB8/ouqe+GhSKh3Xfg44ExpMX1+SkhEnXYUg2R1f0HmdPODhaT3hH0djkkpYVdeWHOFa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(83380400001)(6512007)(6506007)(186003)(26005)(31686004)(31696002)(6486002)(2616005)(54906003)(6916009)(316002)(86362001)(508600001)(2906002)(4326008)(8676002)(8936002)(5660300002)(66556008)(66476007)(38100700002)(66946007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2hzKzVTNEo2eUcyRTRDdnROa3J2Z1BZVE80b3phTzliaE1yREJvdFI0c2dh?=
 =?utf-8?B?QW9oOFhZdmhBbDhrbVRjaDNEcEs4dlREcDN2K2FqWlh4NGJ5c2pPYWZYTGZG?=
 =?utf-8?B?TjBUWDA2bnFVT0pOY1FCZDBQc3orTVBRamlhMnUwaGpsaVlxb1J5U0R4d3FU?=
 =?utf-8?B?d3M2QWF3RktIZVp4RlhTcnNwa08vU2gxMmNEUG5HeWhmbGZwbktLQm83eStB?=
 =?utf-8?B?RzhDb1l1c3FjM055QzlYS1RNNFNwcWdVNmg4dGVYM0hPNjZ6OGNZUUtNNUhT?=
 =?utf-8?B?cktsT3krY04ydDlaMU0yemxNZ0s0OTF1RmZmTVNwWUo4bGZKY0RKNUh6QnQ3?=
 =?utf-8?B?V0tiQ29ISm05OFFadWJHV01kM05USjNxMWEyNko2OU5RWHVPRHcxa0JoV0Fx?=
 =?utf-8?B?S2JVbUFlc0NDNFl6d2M2Sno2cWhvdUNLdSsrK2xFTEorTXY0V0Q5STk0U2Yy?=
 =?utf-8?B?Ym1CUmNkWHZHM0dHZmxBWVJ4OHI1MCtvM0tCY0hlRFdCdmlCSmw4aXc3L2Ju?=
 =?utf-8?B?S0JUckFPUDZIMVk4eDZZbDZ6V3NzM0hJc1MwSGdkMHpiYkpwL2xOMWFmak42?=
 =?utf-8?B?T0pCeis2YSt1V3F4ZVZKSWRmVEorSyt5b0gyeTR6dTJpTHBBdDVhb3pZY3pL?=
 =?utf-8?B?ZmdvNHphZ0NLcVYxbEZuempQZWJzS2gwU0g2UW94OXJSQ3k5T2oyMFhVVDhN?=
 =?utf-8?B?Ui9xdk9BbHgwbWdoN1BlajNGOEgzQ2NEeFdoT2U0cWFSN3JaVy9Fd0d1TFZn?=
 =?utf-8?B?UW0wOTFOVFFFNXdaV1ZqOXlGeER2U1NSUGJnMFZMZlFQOXJRQ0N4QjdQNWRF?=
 =?utf-8?B?M3ZxNFBMbjZqVlhXbXRXSTRJZUV5OWxLMkZFM0pKKzJQQVROTmoyUFYzYVJD?=
 =?utf-8?B?TGZiemVOVTI4dTF4NzV1SzJ3bXgzdE5kQ2pxaFBEL2p2cWZKbG9FWTVYblpV?=
 =?utf-8?B?UUYyNVdaMVZobmFqVVBtbXVFeG5WdjliUFdlQ20yNlpwcGwxdnE4Y3ZQdlNZ?=
 =?utf-8?B?ak5jdkQvU1RFUS9hQkZQSlNNRFpLQ1FaUGRjeFhGRlVaYzhmZ3lpWThSWUdP?=
 =?utf-8?B?bml1QjdwRXVpSER3SkJmVWVlTTVibHBGYWxxQi9HczRMOXNTYnJVVWp3dUhr?=
 =?utf-8?B?LzRqcU9tcTJsMkRKM3VEaFQ1L0RTdklQbkJhaVhDaWJMRHpDWjdTaVdaR053?=
 =?utf-8?B?dGpMSy9Wa2hpeVd1bHhOUUF6K1EybURGN1Z0QmtWTUt1aW9qdGZXTk5DWDdO?=
 =?utf-8?B?SzJNejZ6dkxPU2pWVGx3SDVieExLUlFpQWRVcU1PMHF3cUV1dXVMVXd1TFJY?=
 =?utf-8?B?RHl3d3RiWmNPelM2RWVWSDIvYWRQc0RVOFQ5QmpCVXdPTGVjTUlJQVVWSkFB?=
 =?utf-8?B?NTFScmRpTFNNNW9HY3A0NVJQV3JFYzNQWE9Pdk1PaGlRL3BsOWhIS1F2WVdt?=
 =?utf-8?B?V0JhWU00MnlzbUludWVZdTZEQUJIWTlraUFHbWpDRzdxSUpUVGQ5QUQrZmVS?=
 =?utf-8?B?Q0lXWENkcWRaWjhEYU9MelNXd1BxREZyR2JmdVNERnJlS0ViZEZWVnBhbG41?=
 =?utf-8?B?VHlLL0djbnluOHZxOTFQc1VrNjhmUTViTStRZStNN255UUVqNEN2VE9Bc1M2?=
 =?utf-8?B?WGJzMDJuUXdUd0VxUThxb1NodFU5d2ZudGNMa3REMFBDWHJ2ZTlPdm42R25u?=
 =?utf-8?B?N0UvaERORUw1MUhOMXE4Y3RGQ0gvQlBieURxUWpickFJTEZzL04yM3k5WWZ6?=
 =?utf-8?B?WktMZ0t2ZGxsQ2hWRzkvalJYUUZqMDQ1N2I3RmZvVUk3Y1gvN0UzcDB6c0JH?=
 =?utf-8?B?ak5Lb0ZoUitPeHlQZ2Y4UkpRNW82UGw5Q1hoNGNNbytYdXpycy9rcDNyR0xY?=
 =?utf-8?B?WFVadlZyeFJSekJ6M0pxTHJSVjJaSDhQRTZkWnVoeE1RejgvQ2c5SmMya2NB?=
 =?utf-8?B?VFBKek5rMGcrQjJ4UUV0c0RQRU9OWCtNTHAxTnBTQWtWWEswTEtXYnZqZmJ2?=
 =?utf-8?B?VkpKMU9Lcnc2czRYRHY3MGUyVGl0VnpUY01UbW54eTJwMS9QMGZyNkl2QWVW?=
 =?utf-8?B?T0ZDeFQ0NmxYM3dUR3RDQzA4MjZnbUdSb1hqL205UGUveXJNMFJXRUtYdmJy?=
 =?utf-8?B?V1lzeUZqNkdVeEI5Q3g2b3FETEFyTCtVbHNtODQxaUFOVklYaDFsOHdpYnVp?=
 =?utf-8?Q?A+O1fZdgAo5sUoFPYO1+bUU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63a46aa-a43f-47ef-e60c-08d9e1a3fc25
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:47:47.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgTQ62oT5ODM3RxKnZjnlxbH9QpUBnc0YkYXvCHnB1z7lAvXGSSastUBuIuzDxrwsX+nO/3U16ZFfR+N8lBWKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4887

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
@@ -145,7 +145,7 @@ unsigned int iommu_read_apic_from_ire(un
 int __init iommu_setup_hpet_msi(struct msi_desc *msi)
 {
     const struct iommu_ops *ops = iommu_get_ops();
-    return ops->setup_hpet_msi ? ops->setup_hpet_msi(msi) : -ENODEV;
+    return ops->setup_hpet_msi ? iommu_call(ops, setup_hpet_msi, msi) : -ENODEV;
 }
 
 void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
@@ -406,7 +406,7 @@ int iommu_free_pgtables(struct domain *d
      * Pages will be moved to the free list below. So we want to
      * clear the root page-table to avoid any potential use after-free.
      */
-    hd->platform_ops->clear_root_pgtable(d);
+    iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
 
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {


