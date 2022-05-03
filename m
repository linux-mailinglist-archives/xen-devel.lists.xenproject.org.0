Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12894518475
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 14:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319560.539839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlrn7-0004oW-8q; Tue, 03 May 2022 12:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319560.539839; Tue, 03 May 2022 12:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlrn7-0004m2-5O; Tue, 03 May 2022 12:38:09 +0000
Received: by outflank-mailman (input) for mailman id 319560;
 Tue, 03 May 2022 12:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlrn5-0004lw-GB
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 12:38:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00a2b4b-cadd-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 14:38:05 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 08:38:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN9PR03MB6122.namprd03.prod.outlook.com (2603:10b6:408:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 12:38:01 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 12:38:01 +0000
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
X-Inumbo-ID: e00a2b4b-cadd-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651581485;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ObH/qGbGICEOq1jzPGRDkQ2AO3LHWAuIwkDOzDnXjII=;
  b=ZWhdnuLxXqD6vhYWofZhKxYBTBGSDa3w6zwqU4+PVr0Ln5F4JNk1/3K8
   iN2KYwK9K/YUG0zIi3PavwAoKyMlHpIsB3N2W8kJNFQzw69ciOF20Z9T0
   0OLeo52Uxd0/hfntm5e3RlkZPbM+dVmuOGhlD/yKoEiy+lBbPt1o1CVeo
   k=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 69855749
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:v3boi6I9jmhuwms6FE+Rp5QlxSXFcZb7ZxGr2PjKsXjdYENS02NWn
 2RJWzyFb/aJY2ahLtlyat7lox5X75PTyNdhGgZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Yz2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N9Onp6eQCwGBffNlfwmXid+GARfOaITrdcrIVDn2SCS52vvViK0ht9IUwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsiFGv2QjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2CivLmAH9AP9SawfymzC8zAy27PUNuHZWoyTZulVtR+dq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0ZjZLO+gz6QXIwKyL5Q+cXzAAVmQYMIZgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:jbpjHaPviPCOX8BcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,195,1647316800"; 
   d="scan'208";a="69855749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH8k2tzEDwdY0pZJCf5/wzEEzI4MsOsEW48LlQvdKQnpy3GATr+IvUiU34qJRb4JVn5oPsNNgbcGRWdeJ4FxtUiaXubS8ht4TYk5Or2E+k4cdDZ5MV+l2KzLTAda3wWFlOMjnis5wjq7eDRwqFLR+rnRzNJkgel5M1ipX/RVNInzAmV5he0E52ON4N6igcwjTmfCQ10LO6sM7UOKHxvlur+YOsWii0zLR9e8AFv5+jvNfcwildsfv16S1q1RjiqCbuTtE+phnevaqfRDeVbu/sOfOboMH3h1C2Bli6YyXzjpUle/Eu5o8PS7mOetgchos0URJ3YpFvo+9TnQ//mE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqF83QpIP/SYRtexbd+dCcyjdIUa1UXi2ZExKJFDhpA=;
 b=lLTxKUP+UKUtZhF6t15mFYkHE5Nd5cHEo+N2fyHtxZNgeYHlpYj8UQQsiaBgvMlnKXRSDsa59EDDlkG9Sdl1Ne4WBU4KasW9TV9Yjy4EbsjnXiB/Qh/lnkMWcmESSQAm86XcDlpI5hXOJDX5ge6UOo0JC1AiCgAMuGlge3UoZSJ8KeL46ADyiU/TvS1CQWhy1t6byJKtulfgCNEdF/WcmGVJ5QkF6rWMQd4YFX88DM89zFZ7fg7224CHZnHb8PXCtTK9KUaZGSR0lYMLjiOqdiZse4nLGfWdoafLYdb8t1xHd/eYJvPR7DnzijPBQLnMojfPiW61sOPVWN7BJqrsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqF83QpIP/SYRtexbd+dCcyjdIUa1UXi2ZExKJFDhpA=;
 b=DrvA0oWNzpPUH8CpwiFebYZYSO4ZvAaadj5RkfFYHWrGpvwDMJtG5l+I9RXdO5EVfWQQkqg40Q1C/RY5NMZiKk5RpJ0OaKqPwG1i4i0cQRnSrVQHIRFREYeabFzOFNEWr7aSNeauy9QofRB1fydV4MdhBMz8d7xd93EWOb3KS6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 14:37:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 04/21] IOMMU: have iommu_{,un}map() split requests
 into largest possible chunks
Message-ID: <YnEiJKezb9X4X3Dg@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <227d0bd1-c448-6024-7b98-220271d9bf63@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <227d0bd1-c448-6024-7b98-220271d9bf63@suse.com>
X-ClientProxiedBy: AM0PR02CA0143.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a8fe357-77a9-40ae-de96-08da2d01c270
X-MS-TrafficTypeDiagnostic: BN9PR03MB6122:EE_
X-Microsoft-Antispam-PRVS:
	<BN9PR03MB6122C53AA81DEC850191AABB8FC09@BN9PR03MB6122.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KIfrsuFLkEjzgX7DI37ris4CtUm+s2FPNlr4Qwrcn8UhYTEiObKoOs+T7Vroe24jhm1tXO0intweWKmFMEfru6vDq9kDOjKnJVQnRme0oN6dLhclea51YSKiftJK440G+8hSuwiAK675MaaNlvdwLDHRlJ81FLm7XlbWiYGMbHs3P8ska//fTVsr7fPaeX7ruOo6ME2VBjOrebOYC1yDpxj1OzH/cvUPh+bZ8SRYKvEWXujcoVYh1WT3myA5SqA8biYoa/24uok9bs87BXNuIu6miXf+dFDL+UoRkxg4LUJPZu3bezN7lM2NACVy4Xi5nAhPo08Bx1cV6FN5S1yZ6iq0vTVLVrZTjwlN1SyoRkVilCGIRBEVKpVA2v3M46/fSRN7YfKyP4UIwYAencOXofTKUUbLnH6E1gfkRllJBcBccUaCpzIiOD70nCIBwbUOHP2p7JvjLFPu+kwM57P4MW0uFGyq785rjvs8yYG59twG6N9IOInpEnxD8Exo/16Qk2V52kUvBDyaOIb3kbWJV+jT3StpDl1Zs9c2V75ECd0RSbuGpbtQorkYLN8tx7c5W5KF5DPgD4RmBTiZeA1UWftA5Qybwh6XxYD18GGQegylUfIgvL+qwajrqEyiPh8Q/aBCfPlagYj8tpCw3s3QRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(66476007)(66556008)(8676002)(4326008)(85182001)(26005)(38100700002)(2906002)(6506007)(66946007)(6486002)(6666004)(9686003)(6512007)(86362001)(508600001)(82960400001)(8936002)(5660300002)(316002)(54906003)(6916009)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXlzV2UwemJNY1RmZkdOZ2luVkZ2S3Y0TEJjL3pBSUJ3MGdXTVhkeXVhcERR?=
 =?utf-8?B?LzVJZEpDU3crbC81dEg0a01qcEpFMnI5RHd6ZVNaWmNKV2JmK0x2SVpXQmdu?=
 =?utf-8?B?VFIwQ3BIQkpkbVRWRkJ6VU8wUnI0SGhHSEE5R1M3RkttVDRDd0F1N0hkMVc4?=
 =?utf-8?B?amJUVVhmRitvb3YycHd5eVNHYlExVnl5Qmo1Ky9vSTZGbk15eFRHb3dmbG9S?=
 =?utf-8?B?R0VkdGF0VXc3WHdKQUM3Wk9Oc05PcXc3MytsNmVTbmkvZzdRRStmSmNuS1Na?=
 =?utf-8?B?Y0VoUHdiRG1uQks0K1pwU2Y4aUVkS0dqeXl5RjhkS1k4Tkx4UU9hUTMwY1FF?=
 =?utf-8?B?VHpSSFVpQkxXQURvRmtDYktiUjNvTm1VOVdxRU1iN1pyTXpQNldacUFpUzNq?=
 =?utf-8?B?QzRERCtSWm1vTTNMYUVzK05SMzFFTjZRSU1KRmFrQUZseGFBTGNDZjUxMUtz?=
 =?utf-8?B?ZVVGV2IwazgramxuK2NyeGRvTzZ3ckRnSnpxd3NBZHFNVXExUnVDeUg3eFlO?=
 =?utf-8?B?YnB5QTFmYzJYNU83Mys2eklmbVk0WG9JdDVrVTVrOHRNTFpyR3FaaVROQXA1?=
 =?utf-8?B?a0JsOFNLVFU5TnpWTW8rbEFPWWM1VStLd3g0SC9xbmRQeWJEMlF3WmFHcTdv?=
 =?utf-8?B?UllFV3RBTDUvN3RVNkFjREhiYkdOWk1tUXk4Q3ZUZGlNTGtadUo5UDRtK2Zt?=
 =?utf-8?B?ZUtLRVV1RmhlR0RDS01vZXRSaUtkU2tJMGZhQzRtMjRSK0ErK0xRSUljMGZL?=
 =?utf-8?B?SHZLZGlrT3JjQ2RzTzFMZktQa1U4bVVmQkl2alNWUXJybVdteGhCU053Tlda?=
 =?utf-8?B?UzR5VXlGSmZqQlRScFQvRGpGMlJrYzIyVnk1aFVENEdKdC9SU0ZsRVlhdHNu?=
 =?utf-8?B?K3dVN2t5TnVmUEZrU3RnZHBwZytuQlJaODZqcEJFcHFJeEh5emZmbEhJNWVP?=
 =?utf-8?B?Sjl4dGMyTFN2dWluUFpQb3d1VEhKUk1uZC9OQ000MUw0M2JxbXV5VGhUUGgv?=
 =?utf-8?B?L3J0Z09zZWc4M0RtbDVBL2dySVVIamZ1Yy9ONVpLQjEySEMzMER1SFgxM1p1?=
 =?utf-8?B?Y0g5b2dxM0I1T2VzVmZSOUorR1Z2UG5OZk1NOGtMUkp1YXNVY0xIczBDYko3?=
 =?utf-8?B?a3JxNVNDT1VrdG9LZTNVdkRZMWQvNXV1THRWNXVpdVd3SW14RFhpT2YvOGl1?=
 =?utf-8?B?M1hLdUJrZUtxY2lBOU9XU3BzVUFrV20yZ2JnRjZPQ1JIZ1VCR1FyNS81Sko5?=
 =?utf-8?B?Y0NNVTdFMUJDWEtsKzZCMzlrZU4rOVNmTmRDUlJPMGd5RGZoTVNTYWliS1RL?=
 =?utf-8?B?a00wM0VnV2tWZy9QUDloaTZyZEhrakI3b2xvSXI3MzBxb20rS1NxRVVUS01G?=
 =?utf-8?B?b1RqUVlTcHVkVEpNSGtlNzBHOWRWOEJFNk9ubVdlZ0dxYUZKZXF1c3pLa29o?=
 =?utf-8?B?Y25RVnB5d2F0QWErSHRCeVdWQURsSGlPVU03ckpkVHFXK2U5Qm1jZTRmYjlD?=
 =?utf-8?B?RzhjYjl0L2tvYVNlckpTVmNyK29hWHBBTnMxQUpDMFBRN0E4cGRCNHVWTnRp?=
 =?utf-8?B?d3MyUGtjNzEzR2VabG03Q3FpaVdJa2w2WkhCdWxQQWoyMEhIdXJSQWUvT0NW?=
 =?utf-8?B?eVJqWDR0MVJQMFUvMktIUytsbTkxd0dXK0YxK0l4OE0raHViMGtYZjVlOW5U?=
 =?utf-8?B?RVBjZitrR3VuSk96K2E2S25WVnRBSDJDUkt3SWpDSjNwNW9MbFQ1RlpsSGlV?=
 =?utf-8?B?MEFuVlV0SFlWYzllWjhwb1M1dkVPMXE5bjFvUzZ4YmRzUW56ajdtM1pVUEtt?=
 =?utf-8?B?QVBXek45SHZWcVRSR0J2T25SSlpLYXFDcXZWeTBYMm0vU0VHK1hzZFJoWmVq?=
 =?utf-8?B?SlRiMmdZdERhT0tCdjVGanJPc3A2SkJ4Z2hGRUZQL0YzYnE0VHFMbHg2Y0ZB?=
 =?utf-8?B?a3pyU3dSN2dveXc3TkFhVlU5MkJ0U21BbUNyY3ZjWm4vcGtmeTJRdE5HNDl1?=
 =?utf-8?B?VDI3SnFwa3JOMWRjRUFxT0hOQlpacUVncUpHSmF2VnZLblorRHFXa1R2TnRq?=
 =?utf-8?B?b3YwMklROVh4NjNOYUdzblcrWnBVQnBQQ3d1Vmc3eCtVNDFOWG1hQU9lRnhi?=
 =?utf-8?B?VElXQktTMEJPdUZ4WmpyTUkvbHcrVFFIZDZWODVGVVZMNnI1eGRQMGNCZjNn?=
 =?utf-8?B?bTZ6azVUUHhmWjVveGpYdUMxWnB1TjFTSExlMlNReTFXZjNnVXFDS3RYWFpJ?=
 =?utf-8?B?YllFR0VCYnBsYk1Rd0x0dFF2MXFBNUFtYTdWYngwYWV3MkFmRmFEcWJqREJv?=
 =?utf-8?B?d0EvaGxQTXFnblZQSW9YMkdQaXptL2pZUWQvaDQ2ZEZrNzlZY2ZiRUJNeGlW?=
 =?utf-8?Q?Ffv8xtFe/oS9OU2U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8fe357-77a9-40ae-de96-08da2d01c270
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 12:38:00.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8tn/11k5LUFVOb2Dk1k7xdCH8W+yrolNTJZbG5NtmvPDalc9tGJq9UgI2TX1+nVuZZ8s31UrRGNr4A3s3GkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6122

On Mon, Apr 25, 2022 at 10:33:32AM +0200, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -307,11 +338,10 @@ int iommu_map(struct domain *d, dfn_t df
>          if ( !d->is_shutting_down && printk_ratelimit() )
>              printk(XENLOG_ERR
>                     "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
> -                   d->domain_id, dfn_x(dfn_add(dfn, i)),
> -                   mfn_x(mfn_add(mfn, i)), rc);
> +                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);

Since you are already adjusting the line, I wouldn't mind if you also
switched to use %pd at once (and in the same adjustment done to
iommu_unmap).

>  
>          /* while statement to satisfy __must_check */
> -        while ( iommu_unmap(d, dfn, i, flush_flags) )
> +        while ( iommu_unmap(d, dfn0, i, flush_flags) )

To match previous behavior you likely need to use i + (1UL << order),
so pages covered by the map_page call above are also taken care in the
unmap request?

With that fixed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

(Feel free to adjust the printks to use %pd or not, that's not a
requirement for the Rb)

Thanks, Roger.

