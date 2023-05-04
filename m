Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBFD6F66FE
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529618.824187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU5r-000205-8k; Thu, 04 May 2023 08:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529618.824187; Thu, 04 May 2023 08:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU5r-0001xo-4V; Thu, 04 May 2023 08:13:39 +0000
Received: by outflank-mailman (input) for mailman id 529618;
 Thu, 04 May 2023 08:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2gh=AZ=citrix.com=prvs=481e65374=roger.pau@srs-se1.protection.inumbo.net>)
 id 1puU5p-0001xe-5u
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:13:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 905933bc-ea53-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 10:13:35 +0200 (CEST)
Received: from mail-dm3nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 04:13:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5511.namprd03.prod.outlook.com (2603:10b6:5:2c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 08:13:30 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 08:13:30 +0000
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
X-Inumbo-ID: 905933bc-ea53-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683188015;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qV+TOaaCZDXGVxD1MZbIph6jolX0UTUma1vADEkvVAo=;
  b=Al5g7VJjN3n0axQMGELbHGIY1BzU4HYnrka5D4/bMSl7/QY5GzxTmrk1
   jPl9JrGHbymtOZdxojMh2R5VXXwbWpxXNMdoQ1TF0eTLU8mS9G/3JqjU0
   jJjhC5pGS4HAFlcu+lfn6hQ9a5HR8C2a8fP8uQDRUTz2mKoB7rnvoq+Of
   M=;
X-IronPort-RemoteIP: 104.47.56.43
X-IronPort-MID: 108229542
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XLXcIq/u6JVRGPQz64+fDrUDBX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DdJWmmPa62Mamf8fdx1YIq08UIHupHRnddqTVdsryk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkke2
 PolcQwiRyrArNy60q2ZdvRUhvg8eZyD0IM34hmMzBn/JNN+G9XvZv6P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilAquFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37efx3mqBd5IfFG+3qJDm3mjnlUjMSZMeFyGmtiz02KvcusKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr78el9IR3qO3u1XOmSuxp4PhRxQwoA7QWwqN8AR9Y4K0Yp2y3lLS5/1AMYWxQ0GIu
 T4PnM320QwVJZSElSjITOBWGrisv6yBKGeE3QUpGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:DTSA3a5tJEaikQxsXQPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-Talos-CUID: 9a23:7w8DBm9DxBkE3OmwbdyVvx45HP18TlL09jT7HUOqFkRVVYWVdUDFrQ==
X-Talos-MUID: 9a23:U3ddTglXMzWeD6JIh4eAdno+HdxM0/yXOHk2y7gBhvKlP3VcKh6k2WE=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="108229542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFYl15GBp1EIN8kUSHhn47Ih3N+rdQQfuzFF7M/NC8sAcSWZXIX4736q4CJAwV5pqt8+eZfDudB/78S/pnjMe6h5gz7Ele68X+KZ53I7vUbsy6CNelU6LSiOmJjiOfWnc1kOnQr7FHv03xS4QMSv0GpigjgvTzH5zTVBN1gE3DXvhTx1W8H+eK1bDjgS88kAvcOmvnH5+WzEP7LGoEhobHy+GVNYzOGZaJNeLX3OiHJwyZL9OpZZGkzKrkAEiN9qakcsvJ/dwwS0baLSys0sodhySV8SEJVEbmnDiNa2rvEuvMlP1lTCFW0frHPK7XDlQN/duMc5TvzlVmeglqVqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZxLcVB2P6h+bOOzpC2vFL/eewznKkbc0nq8gWRwdeM=;
 b=b2bcsF/CK9uIoTLvesFEUm53Qoay1BVeIvrIF13wPvG9OQA1UkwGAd0NiwXbcNo6BHCqiF7xw77DlXQB68Ss8Nnl559cajgY02Pganub1RPNoSGbWa+bszW7rKd0iOunTIYrw203Z4rwRBrE6h9T1LkfzHTz0HkNMHgrosHKbmZ2Q/d554bZOldJUUAaXdZQ/QDcqpK2E8KoaJ1qAg9vMmLlFpbX9yS3gsXmXEOqAg4BGAzedP3jqb5g7Wf3kBnwlfo1yGwjh6wmoVQrnq4t48TmZ9VtzQPgONXDjiPrns+vA5vQBlzqP9qfpdpd2BMnWWj3DOkc6xXG2mFTIMk01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZxLcVB2P6h+bOOzpC2vFL/eewznKkbc0nq8gWRwdeM=;
 b=P0yzwMgPXeZ27ynzm5KvP0fg6LS71iBD8+uVZF68jNVbZzNVcDNLTIPXCdz4DikHSCqA4dhHg4s6C2yyrBr8mwVhIS+VTv1QnX680Xe1X8EDRdvx20rtH/XuUOCH/+Z0VfIdmGQwGaeevafiHJBWvP+GhFVyFswHD//dSK9ib5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 4 May 2023 10:13:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Message-ID: <ZFNpI929Zk61sZ5X@Air-de-Roger>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <ZFNiS8oxfozlxCz6@Air-de-Roger>
 <2a46c7df-b380-cc41-5582-70b4829d7f47@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a46c7df-b380-cc41-5582-70b4829d7f47@suse.com>
X-ClientProxiedBy: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9715b0-4cec-4c6e-5614-08db4c7771bd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6SMcK5RiNVI37CcDdt2pC+XR/yDWLG5zZl8kmIXotKs2RZXbNKAN/L/m2ELjUJBqp5dDyPphOYQzWZzxd7T8rbb8C2MbJ7nUwUONuAHJ98FE8nSaXa99TxhQemeQtAcd/WJja2dxkQnkclhf6nKMUFQ5r0SDKql8VysrDXrkc/wlc86ryxw1TfZ0tX81aCBSBNq5UYEMScxVNLW+k8kuR8wdcPxM3iLbahfIbbJqObti0Joxbf8S6wP9DAAXbd4/kZxetQ+uihK6jrie3zj+mTlMsv4TmLIYZMAXROdclFbFdII+2hy1A3w8cfZRgQtQaFeUNhfilvQ8KM/lfmX1ZAwqACGWEyhAPg2yLcUh9wy+hwFFSy23iZPI6/YB3WPqZ6Zi3fKyvoGgKePH15vjEwM22hH7VIAOf2vp4ZKv6f7CXskPnluu5PnB2MNRjJZL5WdUaSAqlBqBF+DcuDYNmzm8+jL/TRoVfjX3gQMmsaNnN0rFtmA0qu7yE9vLpXDGJx0oyHIn/gLBkDyR2n+Z/MINfUBlxbAkHCY1Gt4oaAM+mdGDDhmfpV5KCRMew1tN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(66946007)(6916009)(66476007)(4326008)(66556008)(5660300002)(186003)(2906002)(41300700001)(316002)(38100700002)(83380400001)(82960400001)(8676002)(8936002)(85182001)(6512007)(6506007)(9686003)(26005)(54906003)(478600001)(86362001)(53546011)(33716001)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmR1QUNsaHB6bzcwMTlYY2Zwa3dDQVBFZytsSEJzcW9pTUFQdm8ycHNLTkJi?=
 =?utf-8?B?UVMremV6cXpxaEtlZnJMeXJ6RFM4bDA5emZUZUcwQVJIUjBraHBraGdmeThm?=
 =?utf-8?B?TnpvSStLM1VTeHF2cHg2RE0xOWJjNXN1bVhrcytxc28zMXpja29XMFlmOHZu?=
 =?utf-8?B?VzdNTjI0dStrVVlEWVZ0VkFIRUhHelY1cnB6QXRyVEI0S3NmbHpBV0JieWd2?=
 =?utf-8?B?WGRobXBZeWVuSCs3Q0lGWlkvR3ZnQkVaem96VythUFJocUxKd2VvYzFiNzho?=
 =?utf-8?B?ek90OEQrSWVOdlZJSEJDZmhYanpFOW1lV1pYODNDdFNPc1ozOGdEeEVmUFhz?=
 =?utf-8?B?aFVpZjZTbkdXSThScW9VMGhiLzRwK293TDNhWktPT09zUTh4d2FmVExxQ2s1?=
 =?utf-8?B?RytMSVl3eVhJalRVdC9aQjlFK0lHN1B3ZzVPUHVXd3BDM25paVhGRWdIa2Jt?=
 =?utf-8?B?d1J6d0FYZUpYWkttRnRpWWlGN2d1ZTRiMHpHRUVnRk0yTXhyb2tkWmFsYjQy?=
 =?utf-8?B?eGYvVzBPSmpodDYrcnBsKzY3bnljSDg0bTRpUmFQZndMcnNsZWdXWVNSRzg5?=
 =?utf-8?B?QlA5dFZIY3hIWW53VjFiYm1EcE1sb0hIVzY5OXRpYUNVSjNOUHp4ZWpzbHNQ?=
 =?utf-8?B?QnpIQ1hQQlJpUWk5NnFrYlJkSk8rakI5NFg3T0VySFZyTWN4Nk9QRzl0bjBy?=
 =?utf-8?B?QWpFbEdOazMzVmFaa09pUGlGU2NlU3RGenZzUlNFYy9yYkhzeDcxaFNIcDRv?=
 =?utf-8?B?eXhjY05DZDQ4MTloY003V0t1WEdjYnNDZkhWanlaMG1LblpRT3ZHZExvTFJO?=
 =?utf-8?B?ZW5FR2xaYXp5cE8ybDF5UW9JMXVSRmYzNldjQTBpd2NGSU15dWY5MDVVbjFu?=
 =?utf-8?B?MGZxdExHUWJTUHFKcTYydmtNRWIxS2g0QkdaREd5MDNVa1U0aTEva3pxd0JM?=
 =?utf-8?B?UTBIV0liV0o0RW5Bb0VvSXo5akJTL1ZNeDdzZ0t2M0FXM25Rak1WVFFWbXBh?=
 =?utf-8?B?YWlqbkdOUVFSNy9jbXc3LzA4RG1Ib0hNb3FscndZMTBWc2dhdHJuOVh1akF6?=
 =?utf-8?B?RWdqaEVmV2k0bDNmcStva3UrdCt1SzdvL1FjOG5SS1I3MFZpNDZpOEZpendP?=
 =?utf-8?B?N2lBaDd0QTJ6MytQWitveUUzVTFzODVraklQZ0xDUS9sRzF6NWRiU0hONWtj?=
 =?utf-8?B?NktKUVdQTGdhbkNNRGlVdWpRb0xBUGZGY2N4YktHUThyUGNmSUlOcUVFMks1?=
 =?utf-8?B?MU0vM0tGakJWbGs5TmFuOVV1VzlGZzRPK0Q5RTVLOXZIVzV5N0FQMFFMVlJ6?=
 =?utf-8?B?bHdHanVFRlF3ZkpWeDBnTGk3MkNRNVJjaFRaVFpkZW5jNHk2MXc5Z0QvWTF0?=
 =?utf-8?B?aUlFMzJ1QXBOaUJTaFpGemhtRlFvZFJ2R2VwbHlyRm9aZnp1MW82TThrMTBT?=
 =?utf-8?B?QXdwZlFORFd6aElPU2N5UDBYcC94UmxLUzFKRVducjlpdXV4WDFacVg3Ni9t?=
 =?utf-8?B?aFdQZG1WV0hzQmwxSTQzYVE4ZUZXb1ZwTTQvMnNyUkU2YTZCU3BBWHM5ajJC?=
 =?utf-8?B?QWRDRFZwU3lmWVRkSE9aWWFFNm03TFJ3Zm1RdWlPN2IvOWRxWmNVaW5LYVNr?=
 =?utf-8?B?TURYUUhocWNOMmJKS2dmQmo1SmF1cVljYjhOS0VrS25kNzdMT25DSy9JbVpn?=
 =?utf-8?B?M01QTXZnWTBQNlNleTFUaDVLYmFtdTVPZGI5OERGVGlWaDQrcFZrT0F0V080?=
 =?utf-8?B?QTM1eCs1dEsyTk8vb0M4UzczYWJEQnZMaTFzOE91VVNhbDZyWHVmMHpkT2hB?=
 =?utf-8?B?V2IweWZIdGd2b04zelFzdkhxcEZIU211OE83TnVuUXd1Qk5aZ1ozdkFxN1Ru?=
 =?utf-8?B?UUxnV0JNdWJUYWk3RWd2SStNaUI0OXpBTnVXZmlIa1NtelQxWGUwdlY5cndX?=
 =?utf-8?B?Z1VMQ29PMU5POUI5UVpuNkw2bHFsRXo4UUxwNjVzYzBXamZ3UEtadXpiZk1P?=
 =?utf-8?B?SG5paXBzQzNRSE9YNExxRlRKTFVwN3FpVDRsT2lXSzJ1b1BGandMUGM5aDBR?=
 =?utf-8?B?YVhaNVBKZGtBWUZKNVJhWlAveS9XcVZSU0pzV2lrV01XZ29CVEpvWVpPWnAx?=
 =?utf-8?Q?cYAxxNzxNnUh7QP+BcGQ4UqVb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PSzg8J0dl8lWFFxNiwQ3gJEJ3+0oKWeH5tce+3dKoHdUIBJ72tSxA2eSSDu73JZKdFRUIefbbAah7JIFcOYeJRUtsSFSkV3OCpHvbKL+0eAyBBQjqhdYzOGMKAn+7nzy2JjrOsyfpfV1HM2neXQ61tcB6HgKayq3ePtR3F2yTDfSfRZ/9qCclPHrHG3DnksW8YOvcZL4Yw4y6YsAjCgs4K7W7B4jyg2MqGlEkpQykQaO62+6NnrgSkRlYVVXI1W29/LZv5aeEj2u1fewVX/mBkgco6r1HIp3390kGpLGl8iUK/pi/RkrxfpLXNgkYGPcoOllBWeBApjo7BfoWzMtcQjY+ltGwEfcTaIzqYZP1djeZLLlhvrBhgIj0MajjyaG4EdVL4dzK/d/f1DYZXS99faiyoVaLiLgVl85cwW601eIDiXh5iBccnX3TGz4dUTF8gh0o1T/EzLFmKIEr9hVE89vkZ7cm+SyQJvZ8yXxlHtdGr3VtJrO7qOR0c3lZ0RKX+d+u+ltZ3lcie/hkwXz1u/EAYNlrLqmUgh0roYA+JpW0NBPFmGVCxHavps7h70WXgYjEWHLFhxU7cviJzYCe3sJqz4AypZSs94IW8AzDE2RoW3Rx3fyyPsu+3cbjyXrriFIGaCxMQfHDIf56ZdEdPK6S3Xf6wWjEkpue6QMltrUMop8eNxck1YxLENHM5+y3kJTZKYP/2Sv4mQMxC1LeYKnf361rvRnRfNkdOr/Hwrp8aDnNHK21KldWeuxUZSOwBYS5tmWScjxvecC6gfZ4uqPQETWFoODAC8/seOYU3nTT5YM/F/dt3HZ6/hEVNHbRR35Ie+DIzNj5e17nUKhFlgdnkYNNbsQEI0FJFJK17nOOrCeNOMNJlHfGn4B3kr97IXN6v+PebGzNPHnbrjQxg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9715b0-4cec-4c6e-5614-08db4c7771bd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:13:29.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFzbkuQCfwiHOx2IQJroyVkQ8TnsKWXOo7ViTwRFWt9bw2+gt5AzhccZsuCLV9aEw0t7+DlckNJO1xGh4c9gVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5511

On Thu, May 04, 2023 at 09:50:27AM +0200, Jan Beulich wrote:
> On 04.05.2023 09:44, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 05:33:05PM +0200, Jan Beulich wrote:
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -438,12 +438,14 @@ struct domain
> >>  
> >>      struct grant_table *grant_table;
> >>  
> >> +#ifdef CONFIG_HAS_PIRQ
> >>      /*
> >>       * Interrupt to event-channel mappings and other per-guest-pirq data.
> >>       * Protected by the domain's event-channel spinlock.
> >>       */
> >>      struct radix_tree_root pirq_tree;
> >>      unsigned int     nr_pirqs;
> >> +#endif
> > 
> > Won't it be cleaner to just move this into arch_domain and avoid a
> > bunch of the ifdefary? As the initialization of the fields would be
> > moved to arch_domain_create() also.
> 
> That's hard to decide without knowing what e.g. RISC-V is going to
> want. Taking (past) IA-64 into consideration - that would likely
> have wanted to select this new HAS_PIRQ, and hence keeping these
> pieces where they are imo makes sense.

I'm kind of confused, what does Arm do here?  AFAICT the pirq_tree is
used by both PV and HVM guests in order to store the native interrupt
-> guest interrupt translation, doesn't Arm also need something
similar?

> I did actually consider that
> alternative, albeit just briefly. If that ...
> 
> > Maybe we would want to introduce some kind of arch-specific event
> > channel handler so that the bind PIRQ hypercall could be handled
> > there?
> 
> ... and hence this was the route to take, I suppose I would simply
> drop this patch and revert the 2nd one to what it was before (merely
> addressing the review comment on Arm's arch_hwdom_irqs()). That's
> simply more intrusive a change than I'm willing to make right here.

It's hard to tell whether other arches will need that, I think I need
to better understand why Arm doesn't before making any judgment
myself.

I do think it would be cleaner if the field was moved, but that would
require us being quite sure it won't be needed by other arches.

Thanks, Roger.

