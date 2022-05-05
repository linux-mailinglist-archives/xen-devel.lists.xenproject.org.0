Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640B51C086
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 15:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322125.543332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmbPO-0004Vc-3y; Thu, 05 May 2022 13:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322125.543332; Thu, 05 May 2022 13:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmbPN-0004SK-V9; Thu, 05 May 2022 13:20:41 +0000
Received: by outflank-mailman (input) for mailman id 322125;
 Thu, 05 May 2022 13:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmbPL-0004SE-Kq
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 13:20:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25b2c983-cc76-11ec-a406-831a346695d4;
 Thu, 05 May 2022 15:20:37 +0200 (CEST)
Received: from mail-bn8nam08lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 09:20:03 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2973.namprd03.prod.outlook.com (2603:10b6:300:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 13:20:01 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 13:20:01 +0000
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
X-Inumbo-ID: 25b2c983-cc76-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651756837;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JKLRraHfvav+WJnxq7ne1MwcmnXBreSib1heG5ceGCk=;
  b=PIQlHwChMuT9XyX31N1DE6+fgW425gLfjQrUy+eGmRHrpL+V0Iy+kbB4
   yc9JNankKv8qawrU1tGhxAjPk5xqkHEAQxwlZPB338xPXYL/qgQAW05BB
   CW1K5O5oa/vd4pxIhXnjhUZrlB5Cxqvtk71Eyn4DUsx92x+rLHE53YHZg
   A=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 70523173
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aSMsP6Bt1IlURhVW/1/iw5YqxClBgxIJ4kV8jS/XYbTApDwrgzMAm
 GQZCmjTO6yOZWvzfNt2b9y3p0hV7MDTn9BqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nh39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh0k
 epw6cexaT1zEZTigvombStxAzFHaPguFL/veRBTsOS15mieLz7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l6B8ydK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7/13CKmLGYwRFS9nYUswTHc9RJLwObvLufHftOGeeFapxPNz
 o7B1yGjav0AD/SdwzeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAq/VGvZsnwWVu/unHsg/IHc99ZEul/4gfdzKPRu1adHjJcEmAHb8E6vsgrQzBsz
 kWOg97iGT1otvuSVG6Z8bCX6zi1PED5MFM/WMPNdiNdi/GLnW35pkiWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:G+2QX6/36DsjiNyVTE5uk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="70523173"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpSIBrpt8jp1OZgADYFB5nXwixEOmqw86KvzpVrUS1V7wW6pBn6kUe2k0lbtDof4FdrFQUPV1Ef9EuMhKdTlf4eDQnXzc/94xmi+YPWdXOvbThgFoD252hYbKg0bb/ZhZCMeoSd3EpwN3U4rrLHa78Wnr7Q79ciP+toxkkOb7fE1gxL3E8KsluUZU+mQ4RWDrRKg6r3bJGoOVnLE+9y6SYwoTXULEh6296nfS0se8FaPBUS/5KWsMqDTFqDqH+TQehJf4xwJ9qiNY1geY4I/Ab2RMzEHkyl/6fX1t7ni0EtPIbf4TZeW5Y38H+mDKlkHcBpVCcysloyHubBkbO6jNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5hHCjWk86eXh5ysv1fYYsjEaFY1oeuhyXEOTXkQ07o=;
 b=X9DIRa6Uz63RSYWCrh3HVJzg/WWgOr0AxKt9GCcSOSa1mnHwoqT0q9NeEKjjvuEX0IoXHAuX/UZwU3qbPgZS5uIssCfqC9gcpAywaoyHYilTapIo1m5QX0YBujLVOuEraGeFq2I8CB6VOxfOMqlAOGdekilaeNJxqkSkV/RN5AiGOmKMhg9gQlnzmBz2RN57eVvBqeIcnBMhllnHWnnFUVxnzTS0/efRTxBUnE1qX9dD8kylr6lQ8Ru8UCY6VZV1nzjQ1ukQM5Qns9lasJ/zT9RjKHmdEii6NodgjCqjqFKtrYCvc8y5a05J2l8PTnK7ECl1sHuSI8UzX614HyEJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5hHCjWk86eXh5ysv1fYYsjEaFY1oeuhyXEOTXkQ07o=;
 b=SsSDYwy1oTbBnO1mOTjaPXyvGDHp1hEJxIPHpZIo15eakWYmyfPKvdz3xtBzFmGE3Cmb98KxkPCtewQ/D71AHG3xGfvcZq0mOUNAdnzUOoa92gO8MrHEkFXu7TE1Wnm8vqCV/zPiYBtWma3X5n1jJOb+uMuE+gL9SK7pAX7OGAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 15:19:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 10/21] AMD/IOMMU: allow use of superpage mappings
Message-ID: <YnPO/B9rzxkYrHkh@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5866e22e-9f31-84ab-1df9-db84aa802944@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5866e22e-9f31-84ab-1df9-db84aa802944@suse.com>
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2876bf-af9c-4a0e-e4b4-08da2e99f555
X-MS-TrafficTypeDiagnostic: MWHPR03MB2973:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2973948AAB2A0C888C38FC5F8FC29@MWHPR03MB2973.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cA8s76bgwdN9yCyXzWTi5l216iq62BbMIv27OPNymY6RJ3petyeHXw6kuM5z4+M+8WRTy0G6ASz+W/TPsMUoffqAN7lsIztZmTCBeXVmNN5x+58oM9Ttcm/JNdo/p6ak0TQg4ZbyNlxPGtcDdBo+kAQSFBJAhjP/PBxl1BCE2Z2UB9G4IA298+JNtOF83YRu5WXNbqeIQZ2uKQUfCHuCI+NcmKeuRBNmPg7CPc2dVLfsEldEE2u25yT1SDuYwe97M6K2LHPztLzbOb4mwBRcDp0un9ARkMYlU9f0aGXE5zDYsLOb7EqxH8970G4biJDWiPd0+5VsGxpnd1w2aybUMArgA221CPp+QJqzuVeq6+UUfe3sO87u/+fuIkSyVABgY0yee0JgWVixjAk35/Ff0ohaK8w2bYVVxdLl5ep4KVMpTAJEz3vfPi/ePsDTssoO8UuKuu4ntgHxYBjOokQeDbzhigAqpP/j0k4ZoisblglZD1eTOE2akCZxTZBnqWaiIIFFJx9r4tZggssh3Wov+K6M6A+Nm7mL0f77fyQPnwyMopSoIn3KA+a6ImIoRrcUnaD4nqbr3u1aSYyoaiZUnMwIptlHYkLx8SqwMNWLjL/YrsP/mTw1FAFeOUE0VkkeagoMsxT/FHqNDfo45JF0ug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(66946007)(66556008)(85182001)(8676002)(508600001)(6506007)(66476007)(83380400001)(54906003)(86362001)(9686003)(6512007)(5660300002)(6916009)(186003)(8936002)(2906002)(316002)(82960400001)(6666004)(6486002)(33716001)(38100700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N25qc3FqR0pwRCtoWVRXY0VCSTVxYnZCUC9XclNqT1ZFMjlGdklNRU9qQ05O?=
 =?utf-8?B?cko3TkNuWk5HdjNPbWNRMXAxRGRjZnNWb3NDRk1NNThuOFdJL1dyc29TeW15?=
 =?utf-8?B?UHJyMkZpWEdONHdVT1A1Vndoc0V1YVBkSDFCZGpWS1ByM0p3Mk9aS0s3Sjk3?=
 =?utf-8?B?RXJ2M05UMG10UUZmYUhpWktXRVZUS1NVblFPc2tIUWVoUG1GZFR2aXR2YXd0?=
 =?utf-8?B?aVJhM3dEbTVlWE1qTkIxVGg5bzk3YnFQMUFMS2lkeG1tdUt1MndGWkcrSVkz?=
 =?utf-8?B?ZzBJc200bEVrd1NUaVNkN1dnS29yWmZmSnFQQkJsYVRQRFlwWEVhT1Y4ZGx1?=
 =?utf-8?B?Y1dpcTdZTkZvWGljN05yZytjUExOaTc2eWNMTHE5Q2FFR2IwOUdNN0FKZzdO?=
 =?utf-8?B?T21Fd3F0R0tTdmFkZk9QbFk0ZWNDMS9ZU05NWmp1L2JlemJmZmJzY2VKTEZQ?=
 =?utf-8?B?SGFkZ1ZiMm1JZGRUdk55dmM2bDZqVWNlc0krekN6UWpLVWVJc0tpWU5GSkdD?=
 =?utf-8?B?SjRqd1l6eFZrcmxRUUg1MVg4T2lqSmxjN3FPdk4vbDJqZTNFN1R5ZS9vdGc3?=
 =?utf-8?B?VWI1cFBmb3lkL2tOQW9ZTFFCcVFOcTE0WUZPMmtKUUd2cUVUd2ZCV3FHMW5K?=
 =?utf-8?B?RytrN0lkL0ZMMEpyRFZaVy9oYTdITUFpajRBOXlnZEY2bjlLTkhXK3oySXg3?=
 =?utf-8?B?UHZSZzR6Vi8ycytIaFMzcUZQRGRMQzZMNTBQWG4vL0xIUjhLeXh6elJLV09G?=
 =?utf-8?B?U09ib0pLWWF5bWMwVFNUMGJnVGVQQkNWc1BJaldJOWlTU2ZJNXpSaTFubXF6?=
 =?utf-8?B?UVpmNzFBTDcrOVBzOHRZdjNhdm9VTnl6bWlJZG9zakhSbVcxZ1JCVTRBVVlT?=
 =?utf-8?B?UVppRFE0WnpHWjlHT0g1T2psVWF2YUxDZnk5QUIvb0ZvYlZ1VmR3TjdrNVVq?=
 =?utf-8?B?R2tNZXJpNm1pdWpKZDZGMzNUYmF5M01pTGI1Y2JqZVl2Rm95cjNaM3J3a2xB?=
 =?utf-8?B?MVZOZjVlQnE1NGNmekdyQVdlOUNIUnkyVHh6bGJkenJZeCsyYVJqQ2lFWWx4?=
 =?utf-8?B?RE9MdjFlOG9qY2p3M0xpSkdTUjQwWm5WK1Z1Q2Y5TlppMDEyM0Z4Y2tCRE5R?=
 =?utf-8?B?dFlJWUlYOGwzR1VBZDEvTGlHRlAwZFdIZnVmM3NEN1RqU2diOEozY2NvOW5W?=
 =?utf-8?B?UllVTXlrTCtHUTE2anJVd1dqVm1pRTA2NDJENjQ1RFBtTHRtRHpYUThFTFBs?=
 =?utf-8?B?NzVpb2h5ZUN2My9xODB3cENiSDRFbnk1cXpwY2E2SkE0TW9ORVVUTXA4dXN6?=
 =?utf-8?B?djNtSDVtVHlNWEI0eFRiMDd1eFM2YWlhZE9xb2JmWDQ3Q0dGclBOSlM3VEJD?=
 =?utf-8?B?Wlc1VUlaWHZMSGkzREthMEI1emVFTXFzYlV5NXFqbkwzem9uckNIWlBvTWxl?=
 =?utf-8?B?OTN0dHpKRjlBWTd3UDViK2Z2SVg1UmNMWEZVdUgzdXdoanMzVHM0aXI1TTJC?=
 =?utf-8?B?dUJacVdvenVMRXQxTHZ3cU1KYnFldXRCK25oNU10V05id3JFcmdFQTNJUlJ2?=
 =?utf-8?B?bXpaNkp2UUdqbkMzN2pNU1V1KzVuWUc3Q1hUTm9KdFZaMmoyQXovOEVHRWNN?=
 =?utf-8?B?SG5XUUgza2oyUzFLbG5PNUhaaWlPM1FGZm5UbDl2eWxycmRHbVZjZXV2TVJS?=
 =?utf-8?B?cjRqVDNSMFNKV2lidWhuaHdRR09hVDlXd3FCV2o1dTFUNS9PZTQzKzFwUjZL?=
 =?utf-8?B?UFBmVkxQdnltS3MwU2VabVh6a3RmWGJ2elNrT2J2dzkrcWF2L1o4d2c5OGh4?=
 =?utf-8?B?bUc5eWNmL0VQSGFXbGkzVzZlYldKVHJOOC8zN0J3RnVOVjVnbUkwRG9iTkJY?=
 =?utf-8?B?eXZFZ05SdVVucUdRZy9pdFhmdXVsNTM0akYvM1VyRGZGTm1rV2xKcEdHL05Q?=
 =?utf-8?B?ZmRuOTZVejB0RXdLVm1iREdmMmdFaWxVWmd6ajN4QkUwaW9jQ3hGUFgxbEp2?=
 =?utf-8?B?M1V3MUpjazY3RXAwL2R2MXZITG43cGxaMmgyZHIyTHZxZGZLTmVHa3I4Nmxl?=
 =?utf-8?B?OC9CQllScnd6d1RadGVNVkVXdFE5cTBJTmhKMWlmUWgyWlJoRnMyeEdJZ0p4?=
 =?utf-8?B?anVESXh0TlVZcEF0TC82ZW9ZVjlmbWFEN0gwZldXcW9oOGFwaEJsZHdNY0Fs?=
 =?utf-8?B?eXRXekNnOXlvVDB2SnJGYzh4bTdGRkllSitVSnNhdS9SU2dJSTgwZFo2VUs0?=
 =?utf-8?B?M0JVTEw5REl5SmNUMHhyU0N5MnpQTWlVQlkvUml3dVMweTVPb0JGQVFDNW9U?=
 =?utf-8?B?bSt2SXlsZkdWS0JvRGpXbERLZ1haRUI1TENsMk15bFZwdXZpejYyRHRZek5W?=
 =?utf-8?Q?vXZHmwjAPo8OnOo8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2876bf-af9c-4a0e-e4b4-08da2e99f555
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 13:20:01.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxUd48crxTOHcu/H23fI1/HNCPZtsxkQkeSCrlHYfg0iUgiXdyn4VD1SFbFJ/v05MoK4Xcx4RzY+3HYgIPZEbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2973

On Mon, Apr 25, 2022 at 10:38:06AM +0200, Jan Beulich wrote:
> No separate feature flags exist which would control availability of
> these; the only restriction is HATS (establishing the maximum number of
> page table levels in general), and even that has a lower bound of 4.
> Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
> non-default page sizes the implementation in principle permits arbitrary
> size mappings, but these require multiple identical leaf PTEs to be
> written, which isn't all that different from having to write multiple
> consecutive PTEs with increasing frame numbers. IMO that's therefore
> beneficial only on hardware where suitable TLBs exist; I'm unaware of
> such hardware.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> I'm not fully sure about allowing 512G mappings: The scheduling-for-
> freeing of intermediate page tables would take quite a while when
> replacing a tree of 4k mappings by a single 512G one. Yet then again
> there's no present code path via which 512G chunks of memory could be
> allocated (and hence mapped) anyway, so this would only benefit huge
> systems where 512 1G mappings could be re-coalesced (once suitable code
> is in place) into a single L4 entry. And re-coalescing wouldn't result
> in scheduling-for-freeing of full trees of lower level pagetables.

I would think part of this should go into the commit message, as to
why enabling 512G superpages is fine.

> ---
> v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
> v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
>     where possible.
> 
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
>  }
>  
>  static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
> -                                                   unsigned long dfn)
> +                                                   unsigned long dfn,
> +                                                   unsigned int level)
>  {
>      union amd_iommu_pte *table, *pte, old;
>  
>      table = map_domain_page(_mfn(l1_mfn));
> -    pte = &table[pfn_to_pde_idx(dfn, 1)];
> +    pte = &table[pfn_to_pde_idx(dfn, level)];
>      old = *pte;
>  
>      write_atomic(&pte->raw, 0);
> @@ -351,11 +352,32 @@ static int iommu_pde_from_dfn(struct dom
>      return 0;
>  }
>  
> +static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
> +{
> +    if ( level > 1 )
> +    {
> +        union amd_iommu_pte *pt = map_domain_page(mfn);
> +        unsigned int i;
> +
> +        for ( i = 0; i < PTE_PER_TABLE_SIZE; ++i )
> +            if ( pt[i].pr && pt[i].next_level )
> +            {
> +                ASSERT(pt[i].next_level < level);
> +                queue_free_pt(hd, _mfn(pt[i].mfn), pt[i].next_level);
> +            }
> +
> +        unmap_domain_page(pt);
> +    }
> +
> +    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
> +}
> +
>  int cf_check amd_iommu_map_page(
>      struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
>      unsigned int *flush_flags)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> +    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
>      int rc;
>      unsigned long pt_mfn = 0;
>      union amd_iommu_pte old;
> @@ -384,7 +406,7 @@ int cf_check amd_iommu_map_page(
>          return rc;
>      }
>  

I think it might be helpful to assert or otherwise check that the
input order is supported by the IOMMU, just to be on the safe side.

> -    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
> +    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
>           !pt_mfn )
>      {
>          spin_unlock(&hd->arch.mapping_lock);
> @@ -394,8 +416,8 @@ int cf_check amd_iommu_map_page(
>          return -EFAULT;
>      }
>  
> -    /* Install 4k mapping */
> -    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
> +    /* Install mapping */
> +    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
>                                  (flags & IOMMUF_writable),
>                                  (flags & IOMMUF_readable));
>  
> @@ -403,8 +425,13 @@ int cf_check amd_iommu_map_page(
>  
>      *flush_flags |= IOMMU_FLUSHF_added;
>      if ( old.pr )
> +    {
>          *flush_flags |= IOMMU_FLUSHF_modified;
>  
> +        if ( IOMMUF_order(flags) && old.next_level )
> +            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
> +    }
> +
>      return 0;
>  }
>  
> @@ -413,6 +440,7 @@ int cf_check amd_iommu_unmap_page(
>  {
>      unsigned long pt_mfn = 0;
>      struct domain_iommu *hd = dom_iommu(d);
> +    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
>      union amd_iommu_pte old = {};
>  
>      spin_lock(&hd->arch.mapping_lock);
> @@ -423,7 +451,7 @@ int cf_check amd_iommu_unmap_page(
>          return 0;
>      }
>  
> -    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
> +    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
>      {
>          spin_unlock(&hd->arch.mapping_lock);
>          AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
> @@ -435,14 +463,19 @@ int cf_check amd_iommu_unmap_page(
>      if ( pt_mfn )
>      {
>          /* Mark PTE as 'page not present'. */
> -        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
> +        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
>      }
>  
>      spin_unlock(&hd->arch.mapping_lock);
>  
>      if ( old.pr )
> +    {
>          *flush_flags |= IOMMU_FLUSHF_modified;
>  
> +        if ( order && old.next_level )
> +            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
> +    }
> +
>      return 0;
>  }
>  
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -747,7 +747,7 @@ static void cf_check amd_dump_page_table
>  }
>  
>  static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
> -    .page_sizes = PAGE_SIZE_4K,
> +    .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G | PAGE_SIZE_512G,

As mentioned on a previous email, I'm worried if we ever get to
replace an entry populated with 4K pages with a 512G superpage, as the
freeing cost of the associated pagetables would be quite high.

I guess we will have to implement a more preemptive freeing behavior
if issues arise.

Thanks, Roger.

