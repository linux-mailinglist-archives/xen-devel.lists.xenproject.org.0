Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8755EBEB2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412350.655618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od6yV-0003mf-OZ; Tue, 27 Sep 2022 09:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412350.655618; Tue, 27 Sep 2022 09:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od6yV-0003kE-Lt; Tue, 27 Sep 2022 09:33:59 +0000
Received: by outflank-mailman (input) for mailman id 412350;
 Tue, 27 Sep 2022 09:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1od6yU-0003k6-Q2
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:33:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80fce7fc-3e47-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:33:56 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 05:33:49 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6526.namprd03.prod.outlook.com (2603:10b6:510:b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:33:46 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 09:33:46 +0000
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
X-Inumbo-ID: 80fce7fc-3e47-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664271236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=toQ6I/inDovFB0X4AiCcei2Ke6x8JuxVKp4hoMqKFrM=;
  b=HHO9uW02rX16CjiNZQ1d0rPyFEp0z+gaKwL7xIV7ATi9IWRDmSQD8rbM
   Ps9JURfnxibTMEktJX/bMQZgmRmB/h53FNff8O8W+UurtO7pN3of0YBxZ
   mLaxaEPKq7ewN9y9YT6gbYcOGs0MU+60Jdn0eSwfeaT0oC/hOaZk7jGRH
   w=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 83935897
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sgWQyqCAdmcShRVW/+riw5YqxClBgxIJ4kV8jS/XYbTApGl31DFRz
 2NJWWiDMv6PYzOmed9xPYvl9EgDv5DUm9JlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37a6t4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kYY5QU9bdbAFh8r
 8cKJA0NSU+SieOPlefTpulE3qzPLeHNFaZG4DRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAJ7gvL9MLb4ECKpOB1+KLqP9fPPMSDWO1en1qCp
 3KA9GP8av0fHIzEmGHYoiPz7gPJtT/HY9wpT7+fz8NnhnyYxXRUIjAJT2Lu9JFVjWb7AbqzM
 Xc86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQCy
 Vuhj97vQzt1v9W9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdJN3r6
 zWDrSx7i7BNi8cOjv+/5Qqe3WPqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:D2mirK6Yr8MmKQ5VRgPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="83935897"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a90wsQFSMtoIcjdH4LA8NwcmmtVrQPBbBzxL6ucDC+YyA/N1sgr1OwEBbRaqFAlTKZdng+K6quEZ3yanmXcUBCcN7jF4nE0FBjSLtNhHybOsXLsKPZ3rRVbAUg0ozxhMqTEzKH2+m1ACRX09KsSUXsu4QAB+tlS72Wq/StWm5QNZEqVEtf2auBSZvPyscuLHJM49DF+J2tTZg5+kZgnBzsnACux+szRu/LMaZX0c58pwaYIxH52mE/Eh8NRSXos+203UadUVHysuu+p1XYqLBQ9SAQu7G2QgAG0SXljlWd81PL8KAgHy7yHUVnlEx688eq0uGoqSI+3tGwvzQzgqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4w2sn6T2auAzZEl+2AzSpCcJnJlNsEBPwgwER5SX5k=;
 b=SFDfFRjRcU2B6EPLjnjoVYty8+RPFvL9HXTReUj3skSVSHtfTOsfxOsauVKV3y+J6xZ5LKJzXj77w9g0aRC6v/UcOGsUwN8f4nM4ej82ThKJrUcUW6wD3bbehXFvKQ8rfv8MFVgwXtKxxqY8hczmuilf+0WmMVDhUpTEjMnXvEOCUMFXuNf7pBeMw1TzoASo0E4o7yDDNrpVjxG7JJuQ2WIPtpgaAfLA/yKFlJMd6gjc3zBO4Mlj/0yFt2zj7/B+uw56J3YZQWiQbNo61GvnPINZBYZHkYf++cs7lytjOmPmIK5VNmO6kyx1b0mqm7bI++ku00ZkofmNE9ZJBBBhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4w2sn6T2auAzZEl+2AzSpCcJnJlNsEBPwgwER5SX5k=;
 b=JDkjKtQojdS7bE1nBoduc46l70FepVFjYgNYJuc2/8wLNurjxj1oEZz2Q1gzRYMMyuX1ZgXC55sG8YGUH9DqwElifoV7YY0zgH4T0Ha68ay4KdSYqQ2wTbF5owKKwr1/4T9SCOXzq2GtCzbbt+rSOl5dS7t+9k/0UpH9rkWyqK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Sep 2022 11:33:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzLDdEPRqbUpQQUp@MacBook-Air-de-Roger.local>
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <3ab6e33c-58a4-8db7-93d2-631b60e9772e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ab6e33c-58a4-8db7-93d2-631b60e9772e@citrix.com>
X-ClientProxiedBy: LO2P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::33) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 273e8f71-a2fa-4a4a-2fff-08daa06b5fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AcTnSduOoi3f+8IF7Mzir7z6wAMgDCTNgT5Lk6DUoO/6/oSvbubQZCXyPEZpV+zO8Ueljr9AHGpu4q4EkJ8Fs72bOlJm23xR6YfJFYsdtSoF6Vt+fqcYi5GkxJR7CU0/LW70QuFpe068kwkJd+y12lkeiRAcMhEGc0fhsSCOTs7iBigBH3lJ0bQUOY+h0t+ISKs+gYAQkJFWjcRUZrLR4YcICI0R+UzSu2+WXFAimcSh1UZYUXzB/kwQnZgJYuN2Tl4md90JbNTOHe/S5VKn2+pZJ83GFl9ekQpoektUC3TM+9k322EGHV7gxToZq0+RyjNZOtSAUQcGqrDtIA2DolfT00VYDvjy7naou9MPauSeaQKCUk9Uz2MqYLQdVKvA242R7Gd+2Fg30bI1VEnLgxjoadKGbqHMM3Tn9ViyDwugsxX1L6b5pI+GMwGFVYvzO09CM1EKIW/J2bUIVGJY3tZrHzLvJ5Pv9F1VMNlR9jvWFS+ksatOj+AjBG2FJAhtLpGSbfAD0vG7RT3ckU5HrrLTPtSITSeXv9jShSxVzU51noKn0/9RrvpQRCRjgEqygmEfPKb/BtD7wpWZh4pzXO0IK+06PCxc1QeVbLy1CvzQF9zLoeBD0OPfGpC1v5JAcMN6QS5AqzFyoyayOy25dXVQuTD7Be9fHZQ+RyFnY07aHLEcFF5yDKuPBpIiPLOIemYRrpIVit4qCH5V2lSlx20mxnCd7LpOONTlJzXiSHOFKhGNvg8phsw5wMcoWO+4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(6486002)(53546011)(6506007)(478600001)(41300700001)(5660300002)(966005)(83380400001)(6666004)(9686003)(186003)(2906002)(26005)(6512007)(54906003)(6636002)(6862004)(66556008)(66946007)(66476007)(8676002)(8936002)(316002)(4326008)(82960400001)(86362001)(38100700002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTNNZTJXbTZTQjUvQmVmWFJTb2gwY1IxZXk2VVNkSEJoOHltbmhtZWx6c3B2?=
 =?utf-8?B?eDVQVHpoQWtNMnB5c0E5elhWdU9LT09jZkpGRStKYlpLL2c5c2p1bThCNEtT?=
 =?utf-8?B?ZE0vVVBKVEhMWGJWa29sdVd1M0VSSkxPZmVQOU56aWIzcmt2V1lvVHlNT2Ur?=
 =?utf-8?B?cldnMU8rcXo1cUt6dHIvclNTNkRnM3ZUdG1uTS9jNUl6ZVFLL3NBdXlCd0pk?=
 =?utf-8?B?Yi90eUpxZWo2cEx6YStYOG5kQlZiNUEvSGQwS2FLQnRSRGxEZzZXSkM2dm9o?=
 =?utf-8?B?Uyt0VmtraXJmOHMyTTlJeG5TUW1jSmZQL0M2RHAwc24wd0UwSzFMYVhWUVZZ?=
 =?utf-8?B?V3lRTTdYdmxyVjJOOERLTFZvQUJ3N1d3MkNnQmhlcGtMRkgyVWJCYXhqc0xX?=
 =?utf-8?B?UVFzWXpzUVpMSDlPS3pNWUdPM2UzeTdjTnNVeXV3R3JNQWM0ZkFnYXhNbkpW?=
 =?utf-8?B?anVQaHVwMElRZlVXaUptKy9Md1RPWjU3NHJJSXZoV0RvWFMvcHpjUHk4TzAx?=
 =?utf-8?B?TUhoaHgrdzFjaVVhTHBvcm0vVXFMRG5lVDd3ZWFGTFBqaCtCS3F4SUpFYkFt?=
 =?utf-8?B?WDhrZjZZbzFGTG5RQjM5NTgxdDVmYmN3MXA4V1JaMUwybDZ0TVpla1ZaQXNB?=
 =?utf-8?B?YjFWQ01ocnNSM3grajJxZ3NNMlZ5ZG5GdG9mUTRlRG5NMEVjRGVLMStUSExM?=
 =?utf-8?B?VnJxamowRFh6MGRyaU9JU3VPcllSdm96L2dqT2R5T05NbUUrTzdQVkp4TlJW?=
 =?utf-8?B?UWlORzJZL0RteE53RTI0dnVtQVl5eE10YkhRR1BBejdWZ0NESXo4SzdXeWxK?=
 =?utf-8?B?SDRPZFY2c2FSb0l6Mk9ZSkhVL3RBVDFhaVR0ZHNRM2dUSEJhNUNyRUtjb0Vj?=
 =?utf-8?B?dCtSZUp1ZU5vdGlHbXByMU5teGpacm0xUkQvNkpNb3o4M2hhWTdCSWRPNGE3?=
 =?utf-8?B?U3BZMlFxcndZTGNJRUFxZ2RNbGJYakc5RG5UN1MzeEdaSmRiNlJGeHJLeXNM?=
 =?utf-8?B?NXRIWDVQMm5FbWVjNkNaMUhDWnpTM2JsMDFvVzcxZDl3MkhHOHcyYm42OU0x?=
 =?utf-8?B?cEpYK2xqTU1Yakc2WnNPeVVudFlaOTVGTXc1cjJSYXB0bldUUU5xVHlUZGhk?=
 =?utf-8?B?cCtmaXMxZ2ZVMDVoRE0wTlk0M3R5ZzFiKzhGUHI3UlhaMzJGZ25KTHNJcHIw?=
 =?utf-8?B?UnJIc1VOajZPSjU2SFVYdHl4TDlrZVFIL2NJWDl1QVlXbGNzbVJpNnFwYkk0?=
 =?utf-8?B?b3hTcllGVVRIYXhaZENrU2I1UnZZTG1aKzBXUzgwb2ZVUXVzQWdUdXQzVWNx?=
 =?utf-8?B?ZEJvWHRGTDVKUXZLdWp3eHBwL0p1ZnNDUXA3SDhVVi9mdjAweUg2NUdjcHor?=
 =?utf-8?B?VjVsRklraWF3QVR2b0NOZ0d4NHlBeGsycWo5SVR3US92ZnM3N1VQdmU1VGt4?=
 =?utf-8?B?VFY1bGJHOHBYMEh2NzdDWkVvYVRnK1Fkbkd0S1A5VTJHVjJXZDFmWnFKYisx?=
 =?utf-8?B?eE8rWFRKQllUWXYzdUhpZ3gxM05rcVRienNSSVYraFA5WjJWR0hkSi8xUkRS?=
 =?utf-8?B?NVpra0YzVFBvVzR3MkFUSkhCY3FmbzkxRHJWU3NvRjQ0WWRxbUZzQjhWUmtE?=
 =?utf-8?B?TjFlUzJzREhaSlU2STJqUHV1bXBtVkFmbzdhekJCaDJuMC8yeXpLdW1jdEx5?=
 =?utf-8?B?YmV0bkoycmpQTm40THh5YXpvblNwcUlURGpYeDBTRnFvTUxUVm9CS01nQjlR?=
 =?utf-8?B?UGZEQ2V4NHRLMXhLcXVXd2ZqMGlJRC9BeGJzV05oZm9UdkFqM01lT0ZRVlg3?=
 =?utf-8?B?S3NRbVFHZzlKNStyYVZaWTNrODh2ZFZNQkxoaVVLSUNIL2o5Ylp4TmM2b0lS?=
 =?utf-8?B?UldveW93Y0l1ek9BTHRUOWVnNGdhTm56dnNEelQvMlp3VWNlNEFhQWpuK0gy?=
 =?utf-8?B?RU52N2IxQ3NGZCs3Q1ZQbzlONFY5QmV3OUNsRGlBTkZWbmJwR29pTW94TXM1?=
 =?utf-8?B?Ny96cmNnU0JXWWU3TkwwNW9pWTdKazl0cmcrZkRBdTdpcGZmNXlGeEg4aFBq?=
 =?utf-8?B?Z041amlhaU5TSGxuMFd4K0Z4M0NtcHYwQzVxTFdUcUQvUGZkTE41T1RPeHhM?=
 =?utf-8?B?R1M4dEZ0a1dSbWtWN01venJvTzV4eDZCdlkyNHhIN2FiOHZkRG9iV0FlL2o2?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273e8f71-a2fa-4a4a-2fff-08daa06b5fee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:33:46.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uta2FUuJkIED6Wrjk9Ka3bKbLRHH6q9LLBkKVonV7mqX5t1yY/789xGApermm32igvf23gGdoCaSvUcG2O8/yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6526

On Mon, Sep 26, 2022 at 06:03:24PM +0000, Andrew Cooper wrote:
> On 22/09/2022 17:05, Roger Pau Monne wrote:
> > memory_type_changed() is currently only implemented for Intel EPT, and
> > results in the invalidation of EMT attributes on all the entries in
> > the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> > when the guest tries to access any gfns for the first time, which
> > results in the recalculation of the EMT for the accessed page.  The
> > vmexit and the recalculations are expensive, and as such should be
> > avoided when possible.
> >
> > Remove the call to memory_type_changed() from
> > XEN_DOMCTL_memory_mapping: there are no modifications of the
> > iomem_caps ranges anymore that could alter the return of
> > cache_flush_permitted() from that domctl.
> >
> > Calls to memory_type_changed() resulting from changes to the domain
> > iomem_caps or ioport_caps ranges are only relevant for EMT
> > calculations if the IOMMU is not enabled, and the call has resulted in
> > a change to the return value of cache_flush_permitted().
> 
> This, and the perf problem Citrix have found, is caused by a more
> fundamental bug which I identified during XSA-402.
> 
> Xen is written with assumption that cacheability other than WB is
> dependent on having devices.  While this is perhaps true of current
> configurations available, it is a layering violation, and will cease
> being true in order to support encrypted RAM (and by extension,
> encrypted VMs).

I assumed this was done as a performance improvement (or hack).

> At the moment, we know the IOMMU-ness of a domain right from the outset,
> but the cacheability permits are dynamic, based on the non-emptyness of
> the domain's device list, ioport list, and various others.

Well, as long as there's an IOMMU assigned cacheability will be
calculated taking into account the guest MTRR values, and won't
be forced to WB, regardless of the emptiness of the device or IO
ports/memory capability lists.

Just setting `passthrough=1` on the guest config file without any
devices actually passed through should prevent the forcing WB.

The use case of allowing io memory or ports to be assigned to an HVM
guest without an IOMMU has always confused me, but I guess if it's
there it's because it's used by someone.

> All the memory_type_changed() calls here are to cover the fact that the
> original design was buggy by not having the cacheability-ness part of
> domain create in the first place.
> 
> The appropriate fix, but definitely 4.18 work at this point, is to have
> a new CDF flag which permits the use of non-WB cacheability.
> 
> For testing purposes alone, turning it on on an otherwise "plain VM" is
> useful (its how I actually debugged XSA-402, and the only sane way to go
> about investigating the MTRR per disasters for VGPU VMs[1]), 

Wasn't it enough to set `passthrough=1` in order to enable
cacheability for debugging purposes?  (not that I oppose to adding the
flag, just curious why enabling the IOMMU wasn't enough).

> but for
> regular usecases, it wants cross-checking with the IOMMU flag (and
> encrypted VM flag in the future), and for all dynamic list checks to
> turn into a simple 'd->config & CDF_full_cacheability'.
> 
> This way, we delete all calls to memory_type_changed() which are trying
> to cover the various dynamic lists becoming empty/non-empty, and we
> remove several ordering-of-hypercalls bugs where non-cacheable mappings
> can't actually be created on a VM declared to have an IOMMU until a
> device has actually been assigned to start with.

It should be possible with current code to create non-cacheable
mappings on a VM as long as the IOMMU is enabled, regardless of
whether no devices are assigned to the VM.

> ~Andrew
> 
> [1] MTRR handling is also buggy with reduced cacheability, causing some
> areas of RAM to be used UC; notably the grant table.  This manifests as
> PV device perf being worse than qemu-emulated device perf, only when a
> GPU is added to a VM[2].  Instead of fixing this properly, it was hacked
> around by forcing IPAT=1 for Xenheap pages, which only "fixed" the
> problem on Intel (AMD has no equivalent mechanism), and needs reverting
> and fixing properly (i.e. get the vMTRR layout working correctly) to
> support VMs with encrypted RAM.

My understanding of the original problem was slightly different: we
place the grant table in a BAR region of the xenpci device, and hence
the gMTRRs are set to UC by the guest.  The workaround in Xen is to
cope with existing Windows guest drivers not setting the gMTRR values
for the grant table frames to WB.

Even if we calculate all the cache attributes correctly we would still
need the 'hack'.

> 
> [2] There's a second bug with memory_type_changed() in that it causes
> dreadful system performance during VM migration, which is something to
> do with the interaction of restoring vMTRRs for a VM that has a device
> but isn't running yet.  This still needs investigating, and I suspect
> it's got a similar root cause.

XenServer seems to have a custom patch for this:

https://github.com/xenserver/xen.pg/blob/XS-8.3.x/patches/0001-x86-HVM-Avoid-cache-flush-operations-during-hvm_load.patch

But we could likely avoid the flush completely if the VM hasn't been
started yet.

Thanks, Roger.

