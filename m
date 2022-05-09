Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AB51F9BA
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 12:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324360.546361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0Yj-000365-4q; Mon, 09 May 2022 10:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324360.546361; Mon, 09 May 2022 10:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0Yj-00033k-1e; Mon, 09 May 2022 10:24:09 +0000
Received: by outflank-mailman (input) for mailman id 324360;
 Mon, 09 May 2022 10:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz3g=VR=citrix.com=prvs=1216f8a52=roger.pau@srs-se1.protection.inumbo.net>)
 id 1no0Yh-00033e-Mb
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 10:24:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26afec6d-cf82-11ec-a406-831a346695d4;
 Mon, 09 May 2022 12:24:06 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 06:23:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5018.namprd03.prod.outlook.com (2603:10b6:5:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 10:23:45 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:23:45 +0000
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
X-Inumbo-ID: 26afec6d-cf82-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652091845;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ECX+p35mrydB94rmIvJyxaxOhWegFt77CGPc3szY65I=;
  b=IZ5FvQeNK1SRrHnxRQFS/v0qAoi7CCjjR/DyCJdxaKRH3K8rgJdZ/HEI
   jZJ9ctS6HM2ByiRzFJrVDvfq4Wq8iRaKwjFA/WoOWKU8HBUFd9//ZpHen
   KtGdwvN0HtxT75WoCS3pSTP4G4LH8aNvtdlxJsQmp4Uc3d50753ZHerez
   s=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 73357848
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gsvRAaLlLhfkTjC7FE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENS1GcAm
 zdNDWvQbvzYNmv9ett3OYqy8EoHvpHWm4JlSAJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Y52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NFQ7reTEQkRBbLnqrQsfgNVNnFdYpQTrdcrIVDn2SCS52vvViK2htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMGFGvqSjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SKkLmII9AL9Sawfv1bU8Cpj0unWG8fUV/iSfZpHh3y0n
 zeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQ2IlKzd5l/DAnBeF2EZLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqfJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:aMdE4KOz04jkDMBcT13155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsX+9KK1wUh4S1bpXUd
 WHVKrnlbZrmBKhHjrkV1BUsZORti9ZJGbEfqAA0vbloQS+0koJjXfw//Zv4EvoxKhNNKWs2N
 60Q5iAtIs+OvP+PpgNc9vof6OMexzwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="73357848"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPK91CIX8qTdGBp8JLz4yktWNkianaoUaIMt8/HdLxCmfqmXJsxVsU+P3jrV7eMY1/0XT3IaelcD13XeAsvYvn0+J0EPq6omXRzosoxveTvzf8PWAcpr0y3cyAH6S2WZmvkvj1RXJZpOwXcrGrfBpr45hzd4dSI3AWsJp1iWLfm+oDQEH8rxLDiydguritS4djkT4u2eiki9qVwWlRsNOn4MqRXApejzYv3cV09BqtrVQ/Ql7sgffboH3lXrCkkdvCik5rhltYyYoS1ZUMX/Nrs93ztH8ss1bT1H3bm+aG72v6SCXveqgDovo083T0HzzYuxkZxnSNYlERku3mCaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjRohO2w6zWAWxxxxyMvxjPFxMF3NNR0gFdp/U8yXKU=;
 b=fsmTmaeSp+wS2Vj484hPBklIZ4yU6DYW/yVF4cT3f5kwM+ZBaUYdoGuObyTIr26oGnvGU4otkxmC95cERBKoS7dY7dxFtCdd+5HwKuoDx+VXQBR9s3ZgOqbjrm4txNrM+VNuVBoWnNmBw+67+ZKRKc18YsYS/vx0F4Ea9Om6WNgGh/QYI45SdfhkM4uqd6guuc8VRfv2R+0cvXazAg0KQ9le08P++GjAjqm0XsP+9lHuVGXuEqq+JhVwOhfiizJBrH+qTMxJ1CsmGu0JF6qLMk/cD6Du3AXI+UXndjyK3FgK2Qy54vSUWzwn77C6zoyZSVCXHGX973jNiR8QH+9QUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjRohO2w6zWAWxxxxyMvxjPFxMF3NNR0gFdp/U8yXKU=;
 b=QwbKdLYCcijnXHHeNG51nNOY/Z+D4uyJRRlF39LIEjN2qvYgU573CVxU7nfKpW5ORhPtCfL/wLVY8U4CPKf9cEVajiXSagX+opI6CpWcFYjWabeHCcQxNsrgVXsT0PZdvwvUS40/IrYdznwqWLnmOloZ+YMHCGg3VShyoXIkoGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 May 2022 12:23:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Message-ID: <YnjrrG6iQmUgB1r/@Air-de-Roger>
References: <20220503082650.23049-1-roger.pau@citrix.com>
 <20220503082650.23049-3-roger.pau@citrix.com>
 <7525a9e0-2334-7b6d-5d42-fb68fc6ef0c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7525a9e0-2334-7b6d-5d42-fb68fc6ef0c1@suse.com>
X-ClientProxiedBy: LO2P265CA0395.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 567ca1c4-28d5-436f-a607-08da31a5ff6e
X-MS-TrafficTypeDiagnostic: DM6PR03MB5018:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB501834E3005774C2DFD443168FC69@DM6PR03MB5018.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NSKY0xYmQfwtbsTIBCHYNtTMWwxsiZMOPq5dtkkWadfLaROJITdRSr7A8RMIvH1oaAU9Lf7Kg9OOPvlbOvrimsb9bjJhvReopZE4Up/44UbJDxn7S5r/qLDL4slqQD+eC82nLBZyF+l6mS/5imYFlp+Mxk1VG2zie+5NDdwZRRt+mHrDeYxiXcXNTXiUWTK4tN/3/u+eXQ7rPbfEkAgYvg4oODkg3TI7DBuhubsHek9+WuvrPZmOOM//1OCL5vf4u2Ipur8o6FTARnnCnwoJI8wvu+zwOBrnqx/V26QiOh6d1lnogjhcRqaw1Vx71cHwKLWNKwjzMpMq2GKqVyCuPPY3xTI4vR1DjUijFlIUb4W8QNETK3lPTtpx8oT+UycbG+pQK5JcjAoAFvq+XZPljHzuZ7AU1ql6OFX4ZoL2C/CCbZ4FBbNvAyvVM3nX38u0O1mxnlj2QzENm5syuUYlt5ZBEARe1oP4npA2/OpNFawD8g6PqZ5llpFsyhKhZA/zYcIFgFa8pN8M1uuiNnQeIVvva6OCsbAPk/WyxLFkDLCfWAtzyjDCC6zt9Ujf2d4U0rKUsm63HxJDbhdD2qQc6uS1rkVWli18CeIIfiHobSdImH5vdg9/VqmhXOnVFdT5N+/HTGbJb5yoe8TUgSqk9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(9686003)(6666004)(6506007)(6512007)(2906002)(4326008)(8676002)(33716001)(8936002)(86362001)(5660300002)(66556008)(66476007)(53546011)(26005)(66946007)(6486002)(508600001)(38100700002)(316002)(54906003)(85182001)(82960400001)(186003)(6916009)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVg1aFN1dlhOcXNXbVFpMDE3RUhkSUQybjB2T3hJRm5SdjJjdjlSRnNJRUZR?=
 =?utf-8?B?QVR0VVhRSVVkeE12NG5MM0Q4R2lBSExtbVdzUFV0KzgxcW1LWXdDM0hmOVZY?=
 =?utf-8?B?c3lHcGFMUTBBcXZjenJPMTZ0aC9iQ3BIQm52MWZiNys2cU9vUklBSi82Z3p1?=
 =?utf-8?B?cVJQQmRUUEt1VHRIbWFjNVJ4dXNqNHBOQUJnUVdnK1JQMXBSbHdhTk50bVVw?=
 =?utf-8?B?cVdjcjd4ZEo3SE0wU0hwdDRMUnhDNVYrazJ6OGkwa3hPYVVtbnFVUGRhWHg4?=
 =?utf-8?B?VHo3bTAwTkZGM0xxekFrdUJyc0lMenIwUzF1YXNhaDJUa0ZHRkkvVTRJTnht?=
 =?utf-8?B?d3JTWmdFMFhiYnhUdHdLYmxSSmxMU2ZEcElVR0tRS0UvQTVaWXljZzB5YVlt?=
 =?utf-8?B?SC9YQUpMSUw5ODBENG0zZ2NDS0VOVFFHMjFsMXRJQnJzcVlSTjFJTTN3VmdQ?=
 =?utf-8?B?NUZjN1J6MWJ5cUdteDlYUzRXTTc4M1diZ1k1WGtZODA4NlY1TnVsWjNzQ3ds?=
 =?utf-8?B?bGVKRWgxRThCYU9PT0x0b054Um1IQlZ3M252bGtxUmExZ0ZFS3dYd2pQYmVp?=
 =?utf-8?B?TU41ckhWK1JVZGJzcmNsZnFScVFNMmpkR2xLWnRnRkpFQUovRjduQmExYndQ?=
 =?utf-8?B?ODlORjNtSlNiK0w2NGNHMFpSa3dmR0pWWTlTdnIxdUlFT2dHNEVWYXFiNVpp?=
 =?utf-8?B?bEtNRlBBNFRIYWlwazNHZVZpa1JEMWJVMkhjVnRsVEVERGpvdnhsTlZwN1Rw?=
 =?utf-8?B?aThUQlJobVBxNUdtTVA3NHFYSkczbHFucDFMTW15WGlWZ283amlEQ2czdm9Y?=
 =?utf-8?B?L2xNRW95Tk9PeGc0TllxTURhWmRvSy9sUmNlZnllYUg5c1ZQT1EvM2NSaGtj?=
 =?utf-8?B?eElyS0hMTC9GMER1RlNDaDNsQUdDSWs5dmxseXlVRGhXN2ZqNEZTMTV6MU9z?=
 =?utf-8?B?M2NFMHlqWlpWV2NVd1VzdG5jYWQwTWQ5aXI4OTR1K3ErSjJrRTZHYXR5R2tT?=
 =?utf-8?B?Sk9CSlBLckNHZXpjOVJRYjJ0OVVxY25FbkZRRnJFQW1OOCs2MUNzVTNXN0ZB?=
 =?utf-8?B?bVZMWXhCTzZVYm1vczFYL2VJN2E4ejhsQTBCbkdsRjlNcVZ1Sm91ZGJDa0tT?=
 =?utf-8?B?aTY5c1RwcGEzSHJTTmZCaVhoNzBIWmpzWSsySi9HbkxZWXFGQ2VGOU4zNkU1?=
 =?utf-8?B?M0wxSm9uajgzRU1JeW5YdnBBOFF0V25wSDVEQ1lRSTRQb2VkZGJNREZVakVZ?=
 =?utf-8?B?VE1hUERWOGhiSlJSc2ZhRnROWHRpNmRDT0dMYm1UWXozellWdHJLRGVuVHFO?=
 =?utf-8?B?NTc1TCtvQldrMnp2SUE4NzBZVWJhMUltYnlGTVl0MGt1MGd5cUYzK1lud0xH?=
 =?utf-8?B?MDl2dUpqcjNDMVAvQUl2N1dTaE9ubUtNclZpR0dqWE4xOVdESXJJRUhlbXU0?=
 =?utf-8?B?M3pnYzBHd1diY1Fpd0lsM1pWOXJBMmpJcXU0NXJ0bi9DOG5zSDh5ck9aMEgx?=
 =?utf-8?B?OVp2d1FHa1ZQZ25jT0V4bU81MmdSWDB2YmZkUVIzM2FCc0tQYWIvdEVKcjkr?=
 =?utf-8?B?WDdjdXVKT0N1MEZjY0Nmd1I4bzh0cVQwZjl0dGVBbUVuOGt1U3NxcTlqSWlz?=
 =?utf-8?B?bExqVFJJQ1p0RXVVRDlFNXA2NzhUeEF2cWVsQTgzSUpyLzBBWWRhcVlpdmZ4?=
 =?utf-8?B?ZVFFODM1bEJSQWUyMkR5bnZKVFFSU1F4eHMzaFk2bEVpdXlDWloyZjhRKzBL?=
 =?utf-8?B?MUtEYkpxdlRrSUZ4NHduQmp0VVAzektpZFBtY1BaeGUrT3VFQk8wTFNkSFNX?=
 =?utf-8?B?cjFTMWpoSTgwdSs0V2Vkd0EzQ2JRb0hsSE1KSXAzNUFLVytTTUV2MVZoOXg0?=
 =?utf-8?B?dU5rTEs3NkJKM2Q4SHh0N05DbUZkUU9XVTh4V0ZLcWhpQlJlQUQ2Y0IyU0ZJ?=
 =?utf-8?B?em1sbWh3R0JoUUZWNG5MMk0xVERMZGRyR1ZqVHBwd1VDbkYxOFEyNkkzQmxp?=
 =?utf-8?B?RHJGL2pMOVRnYS9ab0ZsS0NaMEZXdlVhbHhseXE4WlppZTFXODRTWWQzcE8r?=
 =?utf-8?B?alFPRXlhTWN0VGMzbDVlU244NlhaSTBSemdMQzZ1S3ZhWEtZUWdaa255M3BG?=
 =?utf-8?B?cm4rQ3JxNDlmQ3RwczZDZTJKYjIzWTRRUVNjK1QvYlpvOUtpK09ITmc4aWhi?=
 =?utf-8?B?SFBsbnhwaHZOcytWSGthdUFBeGRxYXdva05wajUxcEtKamhGQnBsZnRMVTVU?=
 =?utf-8?B?cGZqY3JOcnAvbUxxKy9IbVlOMk1MWkhmZFdJaEx2TVZrYmVCMDY0M25Jd3Iv?=
 =?utf-8?B?UGxRdkFSVEYwL1NpOFE2K29UbDFzOHhiUjJ5a3dvOWFtS05ZeFBUUy9ZS2I5?=
 =?utf-8?Q?cX5bmtmPX5+KHUWg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567ca1c4-28d5-436f-a607-08da31a5ff6e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 10:23:45.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4enBX0m/J37nYIrhHwwD0/DtbfwNyhejz6qakasHY8k92sElDYxjxjBzMfQ5zoKD2inZ0Yi4Njm8pBXBCLwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5018

On Fri, May 06, 2022 at 02:15:47PM +0200, Jan Beulich wrote:
> On 03.05.2022 10:26, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -541,6 +541,9 @@ static void __init calculate_hvm_max_policy(void)
> >           raw_cpuid_policy.basic.sep )
> >          __set_bit(X86_FEATURE_SEP, hvm_featureset);
> >  
> > +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> > +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> > +
> >      /*
> >       * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
> >       * availability, or admin choice), hide the feature.
> 
> Especially with the setting of VIRT_SSBD below here (from patch 1) I
> don't think this can go without comment. The more that the other
> instance ...
> 
> > @@ -597,6 +600,13 @@ static void __init calculate_hvm_def_policy(void)
> >      guest_common_feature_adjustments(hvm_featureset);
> >      guest_common_default_feature_adjustments(hvm_featureset);
> >  
> > +    /*
> > +     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
> > +     * VIRT_SC_MSR_HVM is set.
> > +     */
> > +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> > +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> > +
> >      sanitise_featureset(hvm_featureset);
> >      cpuid_featureset_to_policy(hvm_featureset, p);
> >      recalculate_xstate(p);
> 
> ... here is about default exposure, so cannot really be extended to
> the condition under which this is put in "max" (except that of course
> "max" needs to include everything "def" has).

Would you be OK with adding:

    /*
     * VIRT_SC_MSR_HVM ensures the selection of SSBD is context
     * switched between the hypervisor and guest selected values for
     * HVM when the platform doesn't expose AMD_SSBD support.
     */

> > @@ -3105,6 +3116,30 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
> >      vmcb_set_vintr(vmcb, intr);
> >  }
> >  
> > +/* Called with GIF=0. */
> > +void vmexit_virt_spec_ctrl(void)
> > +{
> > +    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
> > +
> > +    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
> > +        return;
> > +
> > +    if ( cpu_has_virt_ssbd )
> > +        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
> > +}
> > +
> > +/* Called with GIF=0. */
> > +void vmentry_virt_spec_ctrl(void)
> > +{
> > +    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
> > +
> > +    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
> > +        return;
> > +
> > +    if ( cpu_has_virt_ssbd )
> > +        wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
> > +}
> 
> I guess the double use of current makes it difficult for the compiler
> to CSE both uses. Furthermore for symmetry with the other function
> how about
> 
> void vmentry_virt_spec_ctrl(void)
> {
>     unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
> 
>     if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
>         return;
> 
>     if ( cpu_has_virt_ssbd )
>         wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
> }
> 
> i.e. "val" always representing the value we want to write?

Yes, that's fine.  I've adjusted the function.

> With at least a comment added above, and preferably with the change
> to the function (unless that gets in the way of the 3rd patch)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, will wait for confirmation that the proposed comment is fine.

Roger.

