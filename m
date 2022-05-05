Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BD451C407
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322246.543500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdWY-0008Mj-Qc; Thu, 05 May 2022 15:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322246.543500; Thu, 05 May 2022 15:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdWY-0008Kw-MZ; Thu, 05 May 2022 15:36:14 +0000
Received: by outflank-mailman (input) for mailman id 322246;
 Thu, 05 May 2022 15:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmdWX-0008Kq-Dm
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:36:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 165b34d1-cc89-11ec-a406-831a346695d4;
 Thu, 05 May 2022 17:36:11 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 11:36:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2545.namprd03.prod.outlook.com (2603:10b6:404:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Thu, 5 May
 2022 15:36:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 15:36:06 +0000
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
X-Inumbo-ID: 165b34d1-cc89-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651764971;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=p83qnC903DgR4ZAsrP/IDojeu4CGm3Dddul1l3esC7s=;
  b=FrR7i69OuNPv/OvXj4YioligZEuI3tv7n1v/FzkdPt5vLeMlWMOQwFRx
   KLrZs+wO7h8d5usRi6YKVlKOxZHi6RL/B1e5a4yeBnomRBJ3fMNmz5yoG
   wdmXB0eGYu13n1IgPaX6cOOo0aLDZ374ctCsE6G8ONEUluV0FLmNhmO8S
   s=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 70057089
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:loTgLKBiSNei/xVW/1/iw5YqxClBgxIJ4kV8jS/XYbTApD8mgjMOy
 TNLWz+Gb/6DNjP2e4oibN+3oUlUsZXSx9JhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nh39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhb4
 o5Nj8KqZDwMM/yWp+EYXEZRSztxaPguFL/veRBTsOS15mifKj7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8mcHc0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjw3iSgK20JwL6TjfNovzOJ0zFb67azAYvOVsGyHM5cnW/N8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1iPwQPJVGuw+rQ2IlKzd5l/AAnBeF2EfLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:g+qPL6BkKjwG763lHeglsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY15dPoWXo8kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ1yHtycegB2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB26ffueChPaHbzYfJt3SU7lmtrQ3Igfwt2MVdgh8KYS8a
 6xJW+w81RCNn7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="70057089"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LovIObcxhGQwiPyOcOg/vQczF1LeucDu7g+k02KSIjUqxUyCBWidZhsiNKh4o/xt4ocC8Ra76dXygcIh/neX9nzq8xnmxJJmH2L88enJ+d73bg8/zfPD3ZQFyLmyLmfUyrOTt6ycLfaeD+imo1xYlwn9uRf98DEZtxpwhotOwSLPnuUDX3XBuEF4togEQpsrjyh5qaB1c9AIVIttSClw0wpK8eCH4hlE9Sqhyo56+LKZd1Mv76rBgTJhlQbm/3x0kEpFnsgzIZuacPKiWbC+DiRo+R5KVTyevSXeWj5uJZJxZaCxFHLZqUQeHq5oWgb0QU0mkstN+q0UPo5fK1K5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXa0/MB+g4pt58q5OHvQmFFGrsxQEvV+ZbgK9Q/Cl7k=;
 b=UwWkvIF/8P+qYMaEIL4oq//OysB51TOKUV5kDsm2dL2RlZsAPmjJgwnx0A2em+h9JtnJGUyUpPvM9woX+SvAV7ixrMsbNmj3T6NsMnKl0mLVj9yb7zDqJkITPbQEj0S1vB4Gf7AjuPf+dTjPjOwaOHSolHItUDq7tHW9qiT+4aG0VLQIc+s23Z7LUOPBmwYsY+FfnfHbK2NDvkkEcIsos4L+L4e5iiLD2h4ITqXsIML7iqk56IpMtHJiZfeFAhN+Bb/z5KCgOz0/lB+YY/wYGmEZWyp+Qw7bAxpQFtffbicK5i4vbF9YBcY4PPIN1uUjESfal/8BcbpJlwJ2nn8Now==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXa0/MB+g4pt58q5OHvQmFFGrsxQEvV+ZbgK9Q/Cl7k=;
 b=MNlqDgu2d5BHa3+lgqsR1mMir9RR+A791WV9BEztUqYzVWTK/ASNEzbTc8P28xVgVfz2Op/BhoHE5EscjGE+4U8OUbiQhvBFQc1WZ6oK2QrF6wLpRVUkOtodv0nme8i8HVa+g5nl50IUz7mqwU5C9tcYtVfj2quF1oBH3wCE5NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 17:36:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Message-ID: <YnPu4qeNsObPI03X@Air-de-Roger>
References: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
 <YnPmmjPQcPf4ZmO8@Air-de-Roger>
 <7361709a-0c2a-f98b-2741-fc4c0a12bb50@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7361709a-0c2a-f98b-2741-fc4c0a12bb50@suse.com>
X-ClientProxiedBy: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fe6b687-1d53-462f-d8b6-08da2eacf8ac
X-MS-TrafficTypeDiagnostic: BN6PR03MB2545:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB2545D9D5A04AE0225B9AD1CA8FC29@BN6PR03MB2545.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hC/7VOAsx5wvqjdbnTLE+dSjIXOhCsdwHCVw7PmAgZ+fHEtalF4p7/MP5JuQal/ZdDm/JfQKiEEwOXW9vNgp/ItbXdPwqyyJlsCxqhNP+B/05cBkRanBY19elQ2EqcPhAdycrypwO/rDNp7k162gRPx741eW9cfD2XMqowVTjTeS+8WIJ+cJlRZjHi/Ndpsm6mLN5yqNhm8DYasL32/JY73ipC0u5J3KrPIqtj2DxVowxnIZyIUSatMfpl+oGbh6YUMLJQtqzfCBppXbrhmAxPrwDNEL7w36d9zUjzGIehG9Scgc0uURKgE4Izv9/YaUBxLey7FWVRlye0s/uw7A/X+oUHxLmwmYjsB9zZBhvI0k0nbQzayUusj1fhDMP3wsqHLZ1jlxwQFVADYVsrlK1hMJw8Cww/jfkOm1eXx2XgwBj17C5rnOE76KJwKMezVF+25g5+yx3ccea8YcU2LxxfFDnO6nDC4Qy0ihzax6IamoT8vUrdcMHEAkYvIjRZfYk099GRHGoyf6BCKSUtu0Op09IvcjCCzKN/g3Ll9pb7bPRVjbtMYEy8zMd9lKGwD68dVSzJiMYU06LbiyCq+SL2KbYo7zVd7bHwi6ezl16WfbnLIdx9/rS/+UmO3JQYcmcBlmd4m0gQFd+gxgcByctQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(82960400001)(6512007)(9686003)(8936002)(6486002)(2906002)(26005)(508600001)(6666004)(5660300002)(53546011)(6506007)(54906003)(6916009)(83380400001)(33716001)(316002)(86362001)(66476007)(8676002)(66946007)(66556008)(4326008)(107886003)(186003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K01hQ3FvR1hWVnBjRHorWnNvd1hrWHQ5WkZLV3BpWVdsTHJLT09XcTBMVXZv?=
 =?utf-8?B?MVRhSTZNNmNLRzZrWDlCd0d4YVUydzlFZ1pFd3FxTEFLL3g4TTI1amV6UW9O?=
 =?utf-8?B?MTJFMmhpSENnMURGN1BybzVBZ3krdGd0YTJ3U2k3V2ZNM3U4cjZlOGpkdkhl?=
 =?utf-8?B?MzNUN1VIOTFDQWtpN3FDQkdjQ21PRmVJT1FWY1VyVWcrdlJ5MGkzQmxha3A2?=
 =?utf-8?B?Y2RWQ0o5ckdlL3dmdjRtSUlzSEtveGZ6Y0pYSHNFc1ZnNUNEWFVaZWZ0RmFI?=
 =?utf-8?B?UEhUWDdEL1grd0pMYm11YiszeDdxUjZyQU5Tc2JlTW5VL0RRQlBOMlcreXBj?=
 =?utf-8?B?bXRvdXNSWEI2ekVtSkl6UlluVTFzTnpXVVhNUUlVamlxU0Yydm1Cdk5aQ0tV?=
 =?utf-8?B?N24xdGZiY1NuZWFWWXNIeHh4U0xEOEhWMEYrK2FvdlBGeERYdDRpNTNxZXhP?=
 =?utf-8?B?UzZJdGZKUFQxNXgrbWJSRllDT253YnB3RXFXSXJxR21INFZranUxaU8xNmhH?=
 =?utf-8?B?MGE3WFFjdEIzRHo2ajdDQ3NiWHVxVkY4NG9Hcy9UNTMvQTh6anRrMytqZGUr?=
 =?utf-8?B?c2tXaW8xN0tlNGtUZFhTbEZieERaZStrTVJ5cmlTZm8zaTlad1d4RUtkYitp?=
 =?utf-8?B?cGJtMC81YTYvVzlIdlczMGV1RjlNbUgvcUxjMk1IUG01NDVzSEQvK25CZXRZ?=
 =?utf-8?B?TXJXQ3MvRDBnOGJud1VSQk9jRWJTMGJoSlBJOVB4dm9JMzZySi80VnQ3ekpl?=
 =?utf-8?B?a1NETG45amk0K1JmVUd4NmhvaHFNMFMzTnVIK2RaeTFHZGc0dlFPRVpSTjhY?=
 =?utf-8?B?d0VBNkQyWjRzRkZHaTU2VWlnNUZhb0xOQUE3eWVYSk1adkRBcjZUUk0velpk?=
 =?utf-8?B?Nld6Y1c4Qmxad1FtblZ4K2RXazZaOXhSNHJVcDByK1lvMWFRZU5CU3BxRnQ5?=
 =?utf-8?B?RlhPNXg1bmZwTUkzYitWd0hLOEVKZnl5N2RnajMzTHVTdFpzdnUxaUsxZmht?=
 =?utf-8?B?Q2Y0YXdoWjdVYUxZUmxQdHZKVTgvSjZvbzlyRUVkeTcveTI4b3Q3TzlnK2VQ?=
 =?utf-8?B?WStNZjBNMWYwS0l1ejdLdDZvMGFWZ0hrdjdwMC9kNlk4aGg1a29VaUw5ZkZy?=
 =?utf-8?B?OTkzWmxPUitvaFlRUEUycHo0Z0RKclp5c3NuTU1rV0g0L2ZFUWd6K1ZxbkZl?=
 =?utf-8?B?SVlVR054TDNjRlMwSnJNMzZ1QXB1aDZLRjAvWStXeWtubnV1dFhkUEVqVVZ6?=
 =?utf-8?B?QU5FejI3bEQ4RTFjUE5kL0lZSG44WGJad041RnZVUWVGandpUitLVHVIKzl6?=
 =?utf-8?B?SUdCdVJTcTNtK2xGMCs3bnQrVko4NFdQV3p5anU2dGl5LzZPZXpXNjB3NU5l?=
 =?utf-8?B?TytiZmZuR1YydUJ2K2JaN2VZNGJYQjQwNE51aTdMaWFPOGdkazY4QmlDWndH?=
 =?utf-8?B?MWZBZERNVENEU3dqR0FQcnphZjh2UFdZK2k4bHltOTErTERsRkViRWVkczMw?=
 =?utf-8?B?YVpIUVdBQTlnQ3h1bXpPZElOVzVuWnprNzFNYXRobmdSTHV6NExFTDB0dkhy?=
 =?utf-8?B?WkdCT2ZVV2VGVzU3dFJJN1Mza3llSHNOU3JqVzlkeUlURWdRRzIvdTBrd2ox?=
 =?utf-8?B?cGtiYm4zMkE2cUhsQVZuMlBNZDlMRzBSQ0JwZFlCR2FEUUFRaDVST1F0S2xL?=
 =?utf-8?B?Zm1JWkl0Sys5dmRtbjIrdEw2aXRieFVPOSszdWNETEhORmNsRVVwZHh0NldM?=
 =?utf-8?B?OWJBNjl1eFBMNkNBN2tYRU9SeEpIVldNSUxxVDZIVU5RdmdycmtSOVNtQkZL?=
 =?utf-8?B?YVY5VUlsTVQ4aDhxRTRUb3RTYllZbExaNW1hMGdKcWpMUEVuQnZkNDRJZE91?=
 =?utf-8?B?a2NFdWg2c2F4MGJpWUJ5MHhnOWxxSTRaL0p1MGM2MHl4TXBPekNjUGIyQkZP?=
 =?utf-8?B?Sk9PbEdBUjNBaTdnNnAzeEVFbVRmUWdwSWp3NzFxNitjc2JUazhqcW90Qkwr?=
 =?utf-8?B?R0RDeFgxbnUrQTJkcmF5TTEyRG91aVB4d2dlT1pPdFl4akNrL3F2aS9FL1Fj?=
 =?utf-8?B?ZHY3SkkyVi8zOTJiTFBtOXU3ZE9uVVR1MFYrMjZDSUZ5K0phczJlUEh1QU1o?=
 =?utf-8?B?WTVJUXB5MUVJYXVnb2ZTa2hXeExhYlFhR2NoV1IxQTBscXFPbTdWdEtMRjk5?=
 =?utf-8?B?N0lUY3hlK2xvSHBZK2l2ZjB2dkpiN25Pd1BaSkVKR2dCdzJGT2ZlK3NwaytP?=
 =?utf-8?B?QU4wVVV2UlYvZ1ZWSTBDUGpHZktwZndBVEdRdEIxRENjT1FSTmZEMTRKOUx0?=
 =?utf-8?B?cU9IRWNEYVJjSlgwT0FQZUhtZy9ndk1NRVl5MG94MFZ2R3JHSk1jdk1GSE1l?=
 =?utf-8?Q?NavA5tpd37l+VDPA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe6b687-1d53-462f-d8b6-08da2eacf8ac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:36:06.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXzyBNhtPxLQginK/zKWkevYG+9zaGZFSi05AazF/mBf1/EgERa0/imJal073wGvY9wvBGMDOVwBu4ucgFUzuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2545

On Thu, May 05, 2022 at 05:14:14PM +0200, Jan Beulich wrote:
> On 05.05.2022 17:00, Roger Pau Monné wrote:
> > On Fri, Apr 29, 2022 at 03:05:32PM +0200, Jan Beulich wrote:
> >> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >>
> >> IOMMU code mapping / unmapping devices and interrupts will misbehave if
> >> a wrong command line option declared a function "phantom" when there's a
> >> real device at that position. Warn about this and adjust the specified
> >> stride (in the worst case ignoring the option altogether).
> >>
> >> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > FWIW, I would be fine with just discarding the stride option if one of
> > the phantom devices happen to report vendor/device IDs on the config
> > space.
> 
> Well, I thought I'd try a best-effort adjustment rather than simply
> ignoring an option.
> 
> >> --- a/xen/drivers/passthrough/pci.c
> >> +++ b/xen/drivers/passthrough/pci.c
> >> @@ -451,7 +451,24 @@ static struct pci_dev *alloc_pdev(struct
> >>                           phantom_devs[i].slot == PCI_SLOT(devfn) &&
> >>                           phantom_devs[i].stride > PCI_FUNC(devfn) )
> >>                      {
> >> -                        pdev->phantom_stride = phantom_devs[i].stride;
> >> +                        pci_sbdf_t sbdf = pdev->sbdf;
> >> +                        unsigned int stride = phantom_devs[i].stride;
> >> +
> >> +                        while ( (sbdf.fn += stride) > PCI_FUNC(devfn) )
> >> +                        {
> >> +                            if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) == 0xffff &&
> >> +                                 pci_conf_read16(sbdf, PCI_DEVICE_ID) == 0xffff )
> >> +                                continue;
> >> +                            stride <<= 1;
> >> +                            printk(XENLOG_WARNING
> >> +                                   "%pp looks to be a real device; bumping %04x:%02x:%02x stride to %u\n",
> >> +                                   &sbdf, phantom_devs[i].seg,
> >> +                                   phantom_devs[i].bus, phantom_devs[i].slot,
> > 
> > Can't you use pdev->sbdf here?
> 
> No - sbdf was altered from pdev->sbdf (and is also shorter to use),
> and for the 2nd item I'm intentionally omitting the function part
> (to match the command line option).

Sorry, should have been clearer. My question was to use pdev->sbdf for
the second instance.  I see now that you don't print the function, so
that's fine.

Thanks, Roger.

