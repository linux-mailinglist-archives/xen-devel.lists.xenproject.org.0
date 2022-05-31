Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FD53929F
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 15:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339645.564525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2Ip-0005h1-Lm; Tue, 31 May 2022 13:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339645.564525; Tue, 31 May 2022 13:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2Ip-0005eq-HK; Tue, 31 May 2022 13:52:55 +0000
Received: by outflank-mailman (input) for mailman id 339645;
 Tue, 31 May 2022 13:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8THd=WH=citrix.com=prvs=14366b804=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nw2Io-0005ek-AZ
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 13:52:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f640eb7a-e0e8-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 15:52:52 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 09:52:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6301.namprd03.prod.outlook.com (2603:10b6:a03:3aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 13:52:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 13:52:47 +0000
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
X-Inumbo-ID: f640eb7a-e0e8-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654005172;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P50d2cIm7kn+eFdB7UGO7iqgfOSzdyVrPeqX7LdpKaA=;
  b=MjXUuXN25dvHI+MxHjzyaj/tAYRHOXLIeeOqH7pUJG8JReGTqMdqxdWT
   35l8+m8+z5BGFwz6u3AvLJaFXQHQY2FpoIDhc54ywVq7F4fz0pZHW0vK1
   TkveGE7iWh2HnBum0+6iY0ivR9HyFC7a8bFoQIFtZuL4Kf1rIQsNzPigW
   w=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 72530620
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Po/+jKpA0ucsZ6uP1mxESX3aH8FeBmK/ZBIvgKrLsJaIsI4StFCzt
 garIBmCaavbNmDzLoogOoSy8k1XvseHyYIyQQVr/ygwQntEoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 oqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPPWdmPVDdDBjLH96AqNk5KHmfCiYvpnGp6HGWyOEL/RGKmgTZNdd39ktRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkGgnFs3aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3P+PFvvTKLpOB3+KPSNsOFVp+yfOFYg0CZo
 26dpDz/CShPYbRzzhLAqBpAnNTnkTvgXYMOFJWx7vNwnECI3WsXFQEXUl2g5/K+jyaWcd9FN
 1Yd/CZoiKEo7VGqVfH0RRj+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDQcbSSMV7t+lp5s85jrURdF/DOi5h8P0Ahnr3
 zmQqCE0wbQU5eYA17+65kzAmzKhvN7CSgcv5S3MQmu/6gpzIo+iD6Sz8kTS5/tEKIefT3GCs
 WIClszY6/oBZbmPniGQROQGHJmy+u2IdjbbhDZHHYQl9jmr026ue8ZX+j4WGatyGsMNeDusZ
 VCJvwpUvcVXJCHyMfQxZJ+tAcM3y6SmDc7iSv3fcttJZN52aROD+yZtI0WX2ggBjXQRrE32A
 r/DGe7EMJrQIf8PIOaeLwvF7YIW+w==
IronPort-HdrOrdr: A9a23:hIMZnKjC5v1AcH/9r1CK6kA9FXBQX0Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0md
 gsAp4Y642mcfVmHJ6VJN1xNfdfWVa9Ni4lDgqpUCTaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="72530620"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv6790iImzoRyx26sREWnVKDXHVukJAe+czRMQ/cawM8PcDyVAMoufv0/KyEtb9B4P/Lh6HLQd7Zb5v1SDhZnITx2XefqetKu1dcuTPOmXbQfNtRmCLT741gzl2v5K8XLZfTG1hx+r3a8fn0lrBm+u6XasVhxUbtk/OSAFM0Maq1ZBzmnLYsNL3otYZBHDOusAoP4V5IXD1RN0oGWSlTzmD+cK4ydsVQcz9Y3aHjRUgUCyaGp5BrjYklqyfcIReYjQ/71BLxZFpVhmEwEykF2MVw1+zPCMOXfzVKYf1xtkaphVcFdYGRt4NSO2tp5q2foe3ykEDFLZKukm+z5m3adA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIn1C4Yf2sYQVQqc1+sjrjhbdIG+DLfOkbzzWo1orWk=;
 b=TvM1ZD6Qxk+cz82MPPBZU3z/CF1uM+ma5kI3mK66n4nhbcerRpuACpTKs++8HkpwyJ3vlZb/N0fK2cPIl2sDPi6SnydOpNi3x0fM1h4dDvAPkrjzmVtES8Ck2hk/LTRYjSdCBxySnSSyjSuRNagvcXR6myzwhppgB5wnN8nTd+4iotQOcgUsiZ8ffbH5TP1aXUBYZtw+XUg1igeZcxlO1U9YIYO3ouFQ7wpqBkyoXX1LxzilBaaA7UFLkXdZpV5XK7dRzmXNTWQOSJDPOHVipnrZPIKA6q5YZIO57vQCw47wZr3A0SwEJqLCAxmsYCkFYy7OR0xbGUh8RR/U82lMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIn1C4Yf2sYQVQqc1+sjrjhbdIG+DLfOkbzzWo1orWk=;
 b=MXzEuigqcFmPU+kZACDmgYCDC/6GJriUn7H4jrYpZE79lpxX33/n4Ywfa+A3qbH/I4tWWWmOtYB+B1tGhAEwRfG8W3Kt/PtXEZFjc9VCFxkB8tNByzAijfITzOtxd5YnsH10r2oni+WwbhVYMWi/o1xAhxTm3hS2oA90YGnOm5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 31 May 2022 15:52:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Message-ID: <YpYdqglsWIlsFsaB@Air-de-Roger>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
 <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0235.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c8f2822-c557-4844-f03e-08da430cd85b
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6301:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB630106ADE24670259D2A642B8FDC9@SJ0PR03MB6301.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W6PTe+ON0qKytxaoTthawYXCUmvxfn7TyYnFZ3vu+h3Wknjbyd6WQSqVo0Mcy+66+AjouEbHqg6sw3aMada1Okx/OAitfUAbxgu3/E2ufcVlG1c7zkzQzG3H0pD5RxKOtEpXg0KJ5ibcyOg8sPrPnXOgIKWZdU8v2MWBqS9Zc1kSAIv6jb6nmI8DpGIbqy7DkNnYI2KGKPC6+E4m9oeveYn0T3wbI7BVchCQWM3EcUNMTN1zrM3LjQT5c6xFokWlz3JP2aUSJ7v3GF8xO89vQxCr8QQ4YbNeim7cLz0eY5XnKoMs2wf9yFBF+z5u1o9yO8ipGiBbPu37gctFbIruWCq5C7Wl5cv+ZXoUphADE0san1zH8HCpQgm3ImfBflynZZ8UZY1su4fJSKBkN4VCIU3Va5B9wK4j7gH/YKcdO9ldVHraFjjFjTBbi0/pdthKACdhKeddDj7vHZpuKXqnLmHpSJ0+4mE2k0kjQWeTC5OEjuc1C8jbXKlT9yRuiub+itj/hof5wwxo231gxYXBS0nj7K0xL5TUUUlcZ6pAyZLzfxJz5vLFs6hPcx7AUf7K+gkX8Iu4+HZJXKNWxzTKS1CZx89lNyDHcl1S6eUzvW8VH29tMSmRc7bLNRvWWGoJ8TOcQu/kLLf2kn01tn8hUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(6486002)(82960400001)(66946007)(26005)(85182001)(508600001)(6512007)(9686003)(66476007)(7416002)(4326008)(66556008)(83380400001)(5660300002)(6666004)(33716001)(38100700002)(316002)(6506007)(2906002)(8936002)(186003)(53546011)(6916009)(86362001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0xCeFFpaDh4VThWRGpENjF6WW1PQmJXOFQ5a0ZUMDBzRWdWajdNVURIRGZY?=
 =?utf-8?B?NEIxd0VucHFYTDVkT2tDa3BnQXBYVHB5eWx2UXovWjQyRkQxT09ZOXEyQ20w?=
 =?utf-8?B?ajZsdjdrQlE4YVNlOHZhTGY1OGs5K2tGNHVNWmhwSEtKK0tpODloN1FleWlZ?=
 =?utf-8?B?ZkNVbitRTURSR2pLNVBBaVBHYlJvRHlqM2J4dW5wbldpWGtUWDE5UGRwbmMy?=
 =?utf-8?B?Y1djM28rbmYvVE84Y0poTjNyYjFEZ0ZCR2hZTnlRd1ZLb3d3WEpTVGl5bCtV?=
 =?utf-8?B?VmdlbFhLdUlmc2lCaHZuT2ZZdkRzLzZHWGs5Rkp2QlR5eUhabmNSMGluY2Fa?=
 =?utf-8?B?bHNHM3dyeStkZ0tvNmI2b01FY0I2NDJCQ0QrZlFFeFNxTnZNQm1DTUNkK09q?=
 =?utf-8?B?U1MxeXVRU3VhSGNkVUxId1lhRE85TVNZMnFIUHRVVDV1QURYYURiVElEODFC?=
 =?utf-8?B?Y0lZbGx4ckh1K3FyUklBOTVOM3VvRUhsRHlrRFNSVWRDc1ZUTDAvNkJTQUNK?=
 =?utf-8?B?L3ZQWnQyMHZPdlB3aStyU3dqYWJvdFpXTlhoUDhHRzdENW5GUlUzUlZvNzBL?=
 =?utf-8?B?MHVMdi9aKzN3bkZDNmEvY3ZBQmhkWUpwTFdOZE9mNUxCT2hVVHVTVDIyd3A1?=
 =?utf-8?B?QWxhZzc1MHY2TmVmaGVTU0ZMblFoSWc1RUVuUU1nZ3RTSzgrU09HU3hNYWZa?=
 =?utf-8?B?VGFCRmkxN1JUdjhob3ozNjNHcEsxZlpsOGlNU0xmRElic0RQdVRIeUQyaDdh?=
 =?utf-8?B?dzc2UTFaM1c3Y2l2T2NYWFk2M3pPUDlRZDVneEY3ME1IL2ZpempXRUZZSlN4?=
 =?utf-8?B?WlZHSGdiUCtnbGJlZnRhbkQ2UmxaNTRidXBPOWZnSHFyZEIvUU10aHBRMGc5?=
 =?utf-8?B?aGx1UThzN24rbU9aNU5NMUMyQWZWRThPS0loL0tmcW5NTFlEZTRidGtvL2VW?=
 =?utf-8?B?OXE1QnJCUnd0MEdKL09vOWplbHI1LzVYWHhoalhhTVNaZGFVY2dvUmtzZjNX?=
 =?utf-8?B?bEhyN3BhRklhUzQ4d1k3L01lUkYzdEcwNjJvRkRsUzBKcWx6empTWUg4N3VH?=
 =?utf-8?B?U0N6dkc1M2RjMVMrSjd5ZzJPQUpBeHRkTzIvMnVqV1NnTmE2ZVBQTkFYbzZ2?=
 =?utf-8?B?QytScGJNK3NSY2U0Y2tUUFJKd1pTZFVKdFk5SjQ4UWNvSEFtTUUzK2pYL1hO?=
 =?utf-8?B?NDhzayt0bTZWS1EyMVRFaGVZV2pkMjl2UTArdFZad1dialJ4eHBmQlExL0Yy?=
 =?utf-8?B?dENZMTgxNjNTNTdCMjNTemZoZ1htMGs2US9kTVlnSVRFemYxVGZJRjU1ZWln?=
 =?utf-8?B?WGNCMzQ4UkdnQnpuekFpVmphZjdzbjZvVnY5ODBEOVFnR0dpNVBkM1JWN2Nu?=
 =?utf-8?B?SlNmMmhQTmw2MmNKZFluQXlBbFB4S0JyYm15SEtqemZ5N2lseXpaemxJbUJO?=
 =?utf-8?B?eDFMY0QraG42OGRadzJYekh4bFdHTlVjS1ExY3FmSU54V3g1c2U5bmo4OHZz?=
 =?utf-8?B?SkdYcEtrS0RZTDVoN1hYczdCSDYyU1ZhSlFQbFBXSEpMZ05oOTg0dzUzWUF5?=
 =?utf-8?B?S1BBOXdKMnIxK3Z3cnZFTEh6MTlnd3V1dzZuc3pYSTNTMDRtUTI5Z3lKZWtZ?=
 =?utf-8?B?M2JLUWdwU0hseXBiMS9QKzNzeFB3VGZkeHBNZ1FTdUlMaytVMWxIQWEwR05D?=
 =?utf-8?B?OGM0STNnbGpZQTJxWThFN3NWWCtXYWdPZnllQy9MbjU5UlZnaWJRVDhNZzE5?=
 =?utf-8?B?bUtlUmhHUDhicXkxaWpBeUwwcTl2SVFVSTlLZzBaeXZ6cEg4WVNKLy9lL1dx?=
 =?utf-8?B?b0hnQjY3ZXJDTEsrZnlzQkRkWWxnYUtwQnhISSt5U25YZnVud1M2ZE4yRm5w?=
 =?utf-8?B?U3ZmamxRTG5aYnkwV0lZMkRKMHJrVlpGOUJvT1Z0dU9ybk9zd2RYaVBLVHli?=
 =?utf-8?B?NzNRYXF4NFhqdGZydnlXd1ZxaUNkbHM5UE5vSHcvbmc1ODBIdUtIT09aVWxR?=
 =?utf-8?B?SVFBcGxwSXF6MFhoZHc1Y0ZSYlg0Q1dxcVhtVlp3RHVDa040cTdubWJKMjJV?=
 =?utf-8?B?NHBnSlNLQlFqdG52VFAwSHQ4VTNyMHc4dTFnbFFYSHZMQWNGZTQxZEFJT1M0?=
 =?utf-8?B?MmpYZjhtKzB5QlFLS1kveUgwOVRSQUpidGJRalFvVUQydjZLbWhFM2lSZXhR?=
 =?utf-8?B?NjV4Z0krNnZWSUFnWnlaUXdhU1M4TDJxdGF0akFOdDVPUDhrZmt0blZITFp2?=
 =?utf-8?B?QTc3WXJiUFNOVEZVZk1JeFNFNlJDK2R5bHNrd0h5UGsxakZrdE9zQjhuOXgv?=
 =?utf-8?B?QlZERVdVRFJ5K2cwbmIzU0tBZUlyNVlmVUpyMUFzdTQzVlFqdzg3dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8f2822-c557-4844-f03e-08da430cd85b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 13:52:47.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iogy5yYYMMkW0EHjK2zF2wfjJDOzVcgJRpSJB3eeu8NvTNsA49bXBzXzX8enYJxd861I8CPW9ISzpOraD1tcTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6301

On Tue, May 31, 2022 at 06:45:52AM -0400, Daniel P. Smith wrote:
> On 5/31/22 05:07, Bertrand Marquis wrote:
> > Hi Daniel,
> 
> Greetings Bertrand.
> 
> >> On 31 May 2022, at 03:41, Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
> >>
> >> For x86 the number of allowable multiboot modules varies between the different
> >> entry points, non-efi boot, pvh boot, and efi boot. In the case of both Arm and
> >> x86 this value is fixed to values based on generalized assumptions. With
> >> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in large
> >> allocations compiled into the hypervisor that will go unused by many use cases.
> >>
> >> This commit introduces a Kconfig variable that is set with sane defaults based
> >> on configuration selection. This variable is in turned used as the array size
> >> for the cases where a static allocated array of boot modules is declared.
> >>
> >> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> ---
> >> xen/arch/Kconfig                  | 12 ++++++++++++
> >> xen/arch/arm/include/asm/setup.h  |  5 +++--
> >> xen/arch/x86/efi/efi-boot.h       |  2 +-
> >> xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
> >> xen/arch/x86/setup.c              |  4 ++--
> >> 5 files changed, 19 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> >> index f16eb0df43..57b14e22c9 100644
> >> --- a/xen/arch/Kconfig
> >> +++ b/xen/arch/Kconfig
> >> @@ -17,3 +17,15 @@ config NR_CPUS
> >> 	  For CPU cores which support Simultaneous Multi-Threading or similar
> >> 	  technologies, this the number of logical threads which Xen will
> >> 	  support.
> >> +
> >> +config NR_BOOTMODS
> >> +	int "Maximum number of boot modules that a loader can pass"
> >> +	range 1 64
> >> +	default "8" if X86
> >> +	default "32" if ARM
> >> +	help
> >> +	  Controls the build-time size of various arrays allocated for
> >> +	  parsing the boot modules passed by a loader when starting Xen.
> >> +
> >> +	  This is of particular interest when using Xen's hypervisor domain
> >> +	  capabilities such as dom0less.
> >> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> >> index 2bb01ecfa8..312a3e4209 100644
> >> --- a/xen/arch/arm/include/asm/setup.h
> >> +++ b/xen/arch/arm/include/asm/setup.h
> >> @@ -10,7 +10,8 @@
> >>
> >> #define NR_MEM_BANKS 256
> >>
> >> -#define MAX_MODULES 32 /* Current maximum useful modules */
> >> +/* Current maximum useful modules */
> >> +#define MAX_MODULES CONFIG_NR_BOOTMODS
> >>
> >> typedef enum {
> >>     BOOTMOD_XEN,
> >> @@ -38,7 +39,7 @@ struct meminfo {
> >>  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
> >>  * The purpose of the domU flag is to avoid getting confused in
> >>  * kernel_probe, where we try to guess which is the dom0 kernel and
> >> - * initrd to be compatible with all versions of the multiboot spec. 
> >> + * initrd to be compatible with all versions of the multiboot spec.
> > 
> > This seems to be a spurious change.
> 
> I have been trying to clean up trailing white space when I see it
> nearby. I can drop this one if that is desired.

IMO it's best if such white space removal is only done when already
modifying the line, or else it makes it harder to track changes when
using `git blame` for example (not likely in this case since it's a
multi line comment).

Thanks, Roger.

