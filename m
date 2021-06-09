Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC163A0FA9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139096.257314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquWM-0001uw-Om; Wed, 09 Jun 2021 09:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139096.257314; Wed, 09 Jun 2021 09:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquWM-0001sW-Kp; Wed, 09 Jun 2021 09:29:10 +0000
Received: by outflank-mailman (input) for mailman id 139096;
 Wed, 09 Jun 2021 09:29:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquWL-0001qN-D3
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:29:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a0b0085-7e88-4b03-8904-56600271e260;
 Wed, 09 Jun 2021 09:29:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-O5LBzrL5M6WxY_Bt2DdAcw-1; Wed, 09 Jun 2021 11:29:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 09:29:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:29:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:208:122::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Wed, 9 Jun 2021 09:29:04 +0000
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
X-Inumbo-ID: 2a0b0085-7e88-4b03-8904-56600271e260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdIIKv781vcvaB9/e0X5fG6O/EkokaPYCef67sSMkIA=;
	b=SlIl0W7Fv60Q0n3DONFgABQKY8ULsGwD8rTN3mJK6zTN+5yk6CN1Yk2QA0b0nxJCNcJGa4
	87U9sEgC0nN+GcXtspa19iZUGQu3fF+RrAYvZx+ApZ+l/cME/VZ1WTYQGbrLiB8giI3dxt
	ZP5f8aiXxuLjJfCn3vkP/KYFT2e/iOs=
X-MC-Unique: O5LBzrL5M6WxY_Bt2DdAcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDPfesniEpPeHlNwJRDkUoJG4vN6INT1kyxXqXEtAxpalMdF9/xwV2rq74v7SHoXFvSDGzO+NajZW66pvl2O7TbUldWfb/S17fgg/cNP1hJKIJ6ads433n3N4kJvk7DNDZVzqft4IZ+BV2PPOzFS/JmIhPAzz0W2Yda9WnWvpSrnx1MrwDnk/0ctUV0HnENLk8H5y5VQ5yU9g59kveAow+BfNEr03BKu2GmZanF1n369qDvc5ZnVQO9UUDq+HkdoVcMSTsUjxGdMWeECpWTM98hraK+4Z2Yc2y/BDcj93RbxBL5YaOgjyXsGDif1THtRM2dnghuFAE6U8n13obI17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdIIKv781vcvaB9/e0X5fG6O/EkokaPYCef67sSMkIA=;
 b=GgBX3XSsNOhx1FdUSpzcf1dWzYNzEuIUZdK+KjlmhOvbGLlpmtByq0wDWOVKKtaQONijhAwFgU0bsOwTFtN0AB2ThM77dZmB8dpkqeYaAPawcCgD3Hl5uXxABQ3CQQYxZy6M2jj+v5m4h4+Bc5OrXCahMwL/UVB0K6EZMCwdpv3BvOCXU53hj0bKm5RWCcDmmY/2OIiwR6GIb/39x3X+bonhVScDovoHDdBDJcTVnzYWLkYoMuLcBHW/QymXb7D4lRpsor/zopQHWnIEvBG0z8TTWVLt/NCEJaTSdo+amQP+hHxulgtiIMdaaqQqBfgK/4G5Ceb0HUwlO2i/mltlhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 6/9] VT-d: don't lose errors when flushing TLBs on multiple
 IOMMUs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <8a4f355e-c381-412c-8949-061851d0f7e2@suse.com>
Date: Wed, 9 Jun 2021 11:29:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:208:122::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ab675b8-f533-4885-19a4-08d92b290673
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845078DD2FB4EE3B1F30200B3369@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	clgvOzyeGfAea+7RLH4EaBGyO4g11cgn6cP4AQUSQ7k5MRUmMglndIcfeOA5jvDEhm2hIOu1Q8cdWfpoDTajL7bVeN1FNo/bngwvP/9W3k3uGssEWKuGMjs/FWISYcGgjC35a0fue0B60R5tzJSvcPc+Ke5T/ukXyTuqrFP3xFBZLo/ddZZUKUztYHyK+0w6HG5PDNyeFUVQV0NuATfmDKNWDpZLu1eqA+rrvsBSbSyh+tqsqeDN54fNeRDO9Nomp3Myw8mgcNCttwVL0TXiZMZa6bbJOEYTfC/P+vL5FySJ5en84abUtMQ4gvwJT1ksOqOk/SdBgYjBQgqUu874Va3IQevl1P6hJOFYTJftXa1BCmDrwAcm6V6qa0kOXM28yCgki1aOOuiMF1z9xz697RDjf37DOf+XfuGvgGp2yItqnrHjMqBMglXPPJuh3BG3ehxCGZVr/pQXpPxDIol02zR6dEx/ExybZoy/YcXpgE5+HYo5Yu00Qp76KaduKXlVP7vhfapx6T7DGduV8MXXzflKREvanIx3lzyge8ABpmzgdTDjHiO3iljCcH8rE/5pbMHJIp0jyypQVkIki4Y/82nBXDeWDzfjlOfc/8JPiYDe+KxEh6ESLPLdPhRNOBigVG7NGUtOEZXspLxLX3owusuHxyqERFnW/7SHBqfS1FHDKL9kOAY+fObZ7O/VXi7Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39860400002)(376002)(346002)(316002)(478600001)(86362001)(8676002)(38100700002)(83380400001)(16526019)(26005)(186003)(36756003)(956004)(4326008)(2616005)(8936002)(5660300002)(6486002)(31696002)(6916009)(2906002)(66946007)(54906003)(31686004)(16576012)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?QXIwR0pQL2FXKzBMZDFsMmJacERwODhuSHdKSG16QXZSdVdhU3p2TVBQbERR?=
 =?utf-8?B?RzJaamsxbjVscDBOZ0FVdDE1ZS9rTE5pOGN1Ym5wS1V2a2ZrV0FrY3l2UU9Z?=
 =?utf-8?B?TTBMM1RTSWxqNlNYT0ExbzVYc2l4bjF5WmpqTlRPMC9lWFFiNmVXOG01UE5D?=
 =?utf-8?B?eEE1Z0Fza2RKWnI5NTJoUEluYmdyRG9IdXEzU09XMHdNa3V1YXM4RDZRU0Ft?=
 =?utf-8?B?OHh4UFo4N01vb0xUaDdGVUJROHV4RWdZWDNHWkVKNVd5Z3B2dHVWSWlDNHJk?=
 =?utf-8?B?UUFLN0FINTc5ektnN0FzYlgzVjkvYTNLWGdIN21COW9vUWpjbnR6a1ZsYWRa?=
 =?utf-8?B?dm11d2UrdTVvUFpwZ3BzTGxaQ2p4NFFsQ1lzZ3NuU2d3aUlCdllvWTVKMk9R?=
 =?utf-8?B?VkNHcjBDV0tGTHVScEd3M3lQM2w5S2ZRbEpNdWRHUXhFUjZCcXBscWc2TVV4?=
 =?utf-8?B?OEpFcmRQeUo0SUJaSHcwM0FmRlhRZzZXS3gzaExuRTdLS1NKeVY4aThIRll3?=
 =?utf-8?B?QjVOdkJpR1VDa2NlNUR5QVh3aUdGR0VVOVlPUkpiY2VNQ0xFeUtSdmlYNjhw?=
 =?utf-8?B?bHlNdlBnSkRDZXR5VTZXYW1KeEF2R2xMVGVWK1JMYmJiSUs3ZU9qK3o2M1hu?=
 =?utf-8?B?UlR3Yk1lSTZqTzBudFdKOGVDMjBDMWo1VGg1cXQzZGV4bC9aZjZPY1JQYUR6?=
 =?utf-8?B?UXpPdm1qZ01EVE1ESVhXS2l3d2RJdm90Vmo2dWtWS0FqeVZMeU1vR25ISHFH?=
 =?utf-8?B?cFNxc1hjd29ETVRSV21FdjIyMVlvZ0tJVDFSa2RJL0Vzem80ZVFSK25sbVYw?=
 =?utf-8?B?eTIxYWNTeDkyeExTSnRoZldZaDhnZHRFN3c2L3M3VVVkOG1JaXVnVm9oYTZX?=
 =?utf-8?B?TW5PV2RGSEJaRFViNHMvcHFPSWVpWWtzOW5OTDhpZW1UQ1g1VWZZblorTTEr?=
 =?utf-8?B?QXFuZ2MraG1RN0pCQzNFY29DUndOZ2JBRXIyYkduY21FeFlnU1VRT0h6RlV6?=
 =?utf-8?B?d0t6TjE5ZUVwc3Y0TVc2dzdhN0haekFJZmJDREcrU2paZDNMRk5hTHo0VXJH?=
 =?utf-8?B?TVp1b1JKaEVjZ29rdmtWUThUUTdvcjQxZzlEV0dmanhKdHZ4Ymp5RjFldVRK?=
 =?utf-8?B?SksvYmFGakFKWnNqSEY4WmFVbDhvaFFQTjhGYXdiT090TWViTEh1U3VXcjRP?=
 =?utf-8?B?VmtSUEMxYTNGdHROYUlCK1FIVWFqbFFKSi9tZ3VXVCtjOHhJMTVhQ2Q3UVN3?=
 =?utf-8?B?Q0ZGKzdFblRkaUlrTm1wSjZ6bDM1M2k1OW12YmFaK0p3d0JnOEhCWHp3OWRv?=
 =?utf-8?B?cllTYUQ2aGdZMnkxUE1DT2tMRk5SdUxWeFBmRC9XWHMzL1duQ0hYMzluT0dE?=
 =?utf-8?B?UG5xeUp1UkN6NXNHN0h4d0RSOEtIQ01TejRmY2xGM1NHUStDNlZsSTdaSXhC?=
 =?utf-8?B?aVZxSDJTWXJuZHZBekVqWTJ0M1VyYWVGRFZsOHk4eWJLaHV3aGNRc096N0dn?=
 =?utf-8?B?dVF2SDhEMkZiOHUvZGlvMnJMd2NYOEVvOCtSQ0EyeHpqVWxoczdIRVptTXFL?=
 =?utf-8?B?V0RSV2gzRnZHYmY5SFhxR28vRFN5S3pTeEJaWVNVVXJ4RXNlalYxeDBIZ3ll?=
 =?utf-8?B?Y1N2Q0RUWWc5VCt6WFNZMTVaYmtLSmVFVVM1SW9sdkZ2cnBkeXVqSVd6U2RW?=
 =?utf-8?B?eEZrT2Z4RzZyOWhKRDRUT0JWTmRRRTY5VEdaWjZHZEJlTEVCQ1JiVHZyN2Ny?=
 =?utf-8?Q?ED6GIlCdbKTGJCEUvzprQTKkk0Cm3Il8jgHFEHG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab675b8-f533-4885-19a4-08d92b290673
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:29:05.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCsL72nNclbwx0FAHEcIUi8BXiZiKmnIH+Isbuz+N4drvvd06e2PP7ku2hgcxzFGSC6i5OQE0iPgxfOejgXKSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

While no longer an immediate problem with flushes no longer timing out,
errors (if any) get properly reported by iommu_flush_iotlb_{dsi,psi}().
Overwriting such an error with, perhaps, a success indicator received
from another IOMMU will misguide callers. Record the first error, but
don't bail from the loop (such that further necessary invalidation gets
carried out on a best effort basis).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -643,7 +643,7 @@ static int __must_check iommu_flush_iotl
     struct vtd_iommu *iommu;
     bool_t flush_dev_iotlb;
     int iommu_domid;
-    int rc = 0;
+    int ret = 0;
 
     /*
      * No need pcideves_lock here because we have flush
@@ -651,6 +651,8 @@ static int __must_check iommu_flush_iotl
      */
     for_each_drhd_unit ( drhd )
     {
+        int rc;
+
         iommu = drhd->iommu;
 
         if ( !test_bit(iommu->index, &hd->arch.vtd.iommu_bitmap) )
@@ -673,13 +675,12 @@ static int __must_check iommu_flush_iotl
                                        flush_dev_iotlb);
 
         if ( rc > 0 )
-        {
             iommu_flush_write_buffer(iommu);
-            rc = 0;
-        }
+        else if ( !ret )
+            ret = rc;
     }
 
-    return rc;
+    return ret;
 }
 
 static int __must_check iommu_flush_iotlb_pages(struct domain *d,


