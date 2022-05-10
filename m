Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984AE521ED2
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325801.548555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRq5-0002gi-Mo; Tue, 10 May 2022 15:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325801.548555; Tue, 10 May 2022 15:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRq5-0002cw-IQ; Tue, 10 May 2022 15:31:53 +0000
Received: by outflank-mailman (input) for mailman id 325801;
 Tue, 10 May 2022 15:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=To9D=VS=citrix.com=prvs=122921be6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1noRq3-0002KR-Dz
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:31:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bcbc5a1-d076-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:31:49 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 11:31:28 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5472.namprd03.prod.outlook.com (2603:10b6:a03:27a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 15:31:26 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 15:31:26 +0000
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
X-Inumbo-ID: 4bcbc5a1-d076-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652196709;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=A6uRi1n+JomLmF4L1lFXPu41zat7pbZVCTEakTao+hQ=;
  b=Dq1wLpY5zUE7GSgTDYY6YMLstlVuA8eIzgQtPX2LTju5a2KD7+l/w5wu
   RuuTOSJE9AwefeQG4isK2rsYRtDY4Am/KBI+IHGDZKQJuMZvSQvocD83i
   zW94ursX1oYgcZVjg89DHYPKD4w6OuU/ZzK2AnW2lEuICsU9s9CSbLEco
   0=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 71394708
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gEiFrqAIksqoNhVW/1jiw5YqxClBgxIJ4kV8jS/XYbTApGwl3zUAn
 GcZWGHVOa7camT3L49wa9u1901QvpLQy4VgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhzz
 uxXtbLrSjsKM6j3qb82b0FFTiVHaPguFL/veRBTsOS15mifKj7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mcHs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx3SijLGUIwL6TjZQF/Vn+kjYp6ensFvrEI+6we+R3rm/N8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1iPwQPJVGuw+rQuLmqzd5l/AAnBeF2EcLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqUFr6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:2YXk1qMzeCfiWcBcT13155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsX+9KK1wUh4S1bpXUd
 WHVKrnlbZrmBKhHjrkV1BUsZORti9ZJGbEfqAA0vbloQS+0koJjXfw//Zv4EvoxKhNNKWs2N
 60Q5iAtIs+OvP+PpgNc9vof6OMexzwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="71394708"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIquiaxEgU5A9+M364Ulcn5LPoYegQIKgfgCu6yzJu0/RPTSYt54yd+xQATsU1MG/4RkHFNJ6bizaIE14+ivIWc7/VbiDyOcguDrGahAXweCClN85PZDJiP0665xbzCb6Q2qwg9WcbbEF7tb2aOAHgk1MvwkZcLXEvdT46px/IycB7xsBROdekGGaQMMGe26UBxbynIwzIcSCVoNgLe8PkgWhU19Xpd6DZh7nKhdFaGqPPPzwj5gvnFcagqW2lFECi6/BoKVN28x6WbTUnwqQnU2wmbVG9ag49zjznhOu10HBE/kS4sHYJd1az8Bqi8AMxpF9V7FETB5Hmu5v+425A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z1GN4x7PzE/ViYEEyjTtXbvTs3ZPRlGD1cF4XrGlSg=;
 b=NtA6pRciKhnrbzLpDSRpm3D+SDcA1ddshUhlBZvqObCZOJTB/ASkYkRCCgVcykHh6L1e7awxv32OI79Q1B1TcgKRjOMPD/zA2bdBRwe2qCG8zH+xmZ1Mj4HchHWesDCO0CGqVSnmERa3+tOt8CWz7G79oa/nZylt7E9Hm3v0spOlYTYMf6+yV9DjelSfr/4yEKYM545l2Fvhb/areDLuRouOpi1aJczPZARYcFH3s3cuWbwJT7rPKpUTa3/jRqhh+DhQ/Ds+NY9MqGURXYs7iWV7YLW+3NYCoaWSaPg+zrFVpZq+MJP8qfNsahxpld7ObhWJ9XOcJSz2zv/LpVUxag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z1GN4x7PzE/ViYEEyjTtXbvTs3ZPRlGD1cF4XrGlSg=;
 b=mYSyaENYABqRdJkpiDMJ55P6PweA1/QDsAf/dv/NUHN7hGZETPh8pdmUIkA2yI0uoEn2K2kHm2s6Rz851YdGQiVDXCdJ2qIR9/lLnfT2aSIVzrxSZ6mnwhh6q9kAQ2IS9HuvJOMw39BdzsLhZEdSvD0WykddBBzQHB7TtyZ7KRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 May 2022 17:31:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 17/21] AMD/IOMMU: replace all-contiguous page tables
 by superpage mappings
Message-ID: <YnqFSWXRh+TEO9mZ@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <e0e2d865-5ac9-d7ac-c763-f4b99b699224@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0e2d865-5ac9-d7ac-c763-f4b99b699224@suse.com>
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0004c40f-3631-4dc0-8ba5-08da329a255e
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5472:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB5472EC7F52CA10F59CA2FB658FC99@SJ0PR03MB5472.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cJfe+sM3mFDk1VekDG+IE6uU3CywIUIsjuoZbpSXr9D47HbMm3GgBDTg+zZ5j5Pu4v1KfgHSRw5FsXE5MbEHIvcUvtfrRPKXdjZWdWRNrRSgM2ZaZjquMYKh5JmY6x4THwfERldN/OAF+WlbK0T6agbigs/GBw5LOwZu5c2uuUoleT2tlyplc7oZfLTa+rjtyyCj6yzEQ3cQbyl8yHbBVG2nnwAr8eUWD6+vcNYPQnwBMOb8dGGgaSUa1bsxQ8Z8iPZ/jT0j7nshJgIRRr2Vq7fvLN1xZPzYP2+RpFp5Y1xIwH4Lly591hkEaEIhhgeh5j17Vr1SMn0ogQ0Sx4x9P8n772T7o/ZO4Sn0e+0wxhq9URKeF1Wxurns8zT2XEiUO1Qqh8NC4rd5nkaQE4dJBC46uHeHmY4FNnvccqeeyWf0utUbIMeEF6A31WPWDQofJ50X/1iGIkzwHphNUb3zZ6noBocsQyt9sngSf6ka4NvLk3T1WbUoUw8Lxo3GREX75KYXde+joFd5oO41ww3JEyB7Q7t79MR5/2ZnVNrinCvwI4fkebVoSdhdWyqTTNof1vV9fvRZ41gH1AgQ7qgEVgZGSNnX9KTdbmcHdDDHVbk3Kpg2RlGRajhmPvWYnVFjHCjdqmdz0hh5FF0BiluTKrXwDXu5VLcRWn2z7QQocInz5ghwAYWpeiLywZX0QYC8KKGpzlopm1D8YOYBAlVLrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(38100700002)(33716001)(26005)(6512007)(9686003)(6916009)(8676002)(4326008)(186003)(316002)(66556008)(85182001)(66946007)(54906003)(66476007)(2906002)(6666004)(508600001)(86362001)(6506007)(6486002)(8936002)(83380400001)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d09vN1JsRUVXQ3FXTEl3RGdlR21rSHB3Sy9KSTZoWDlJS1cxNmJMLzRsVVFt?=
 =?utf-8?B?dDA3SHh4M0JuWllTQ1Y4YlkzcGFNeGo1bEJjd2RJQ1MrR3BMdEdtMEZDaWdj?=
 =?utf-8?B?czNvMklZWURrbWl6QjBnZzdSMFNHbjRRSDlreDVQNzh0UVdZWkowYnNJZkMy?=
 =?utf-8?B?amhpdEQrN3pMU0NoUkRTQzJjWjIrZ1A0QlVHZ3h3czBWOUExeDA2S25GSmdl?=
 =?utf-8?B?dm82a0FuaSt6NC80MWRqUjdCU2ZWYStWbXdiMWw3b3FZb1lFRWwyaHZyUHNt?=
 =?utf-8?B?SWJ0OVRWbWVlVXB0Tk41M2poWHBEOVFoR0VGV2NsQUE0MzF2bTd3VXZrbFVT?=
 =?utf-8?B?R3lKa3VWUktVYnAwWEw0MDVZcE1Sc2RQY3R6R1dTdStaN3Z6YUlQS3Z0eE1w?=
 =?utf-8?B?WTNrZW5heW56TW1WMUxjdkQ3ajZNakZCcUdIUFVKb0FHUG1JN3dyaWxYRTV0?=
 =?utf-8?B?c3NGMVFqditLNndpdUgxNk9ZcDZSQTEvemRDd3lQYkVlc3pVZjFmTTlpUDhs?=
 =?utf-8?B?ME84M3J0UmhzOHMybGd5ZzRYQlRiZU9NaFZ1VURiT0t4ZmRMZEJLQzNqa2R4?=
 =?utf-8?B?Y0R5R2txRExVbm5vQkZzMjV0RlNVNXdta2c2aGNVeFZVbXlJYis5b244eDFT?=
 =?utf-8?B?U0F3WitDd0hnaFF3VXZkNDZDKzRLWUo0TDQ2ZW5mbWtsRjZqVFJQbTBEYjk2?=
 =?utf-8?B?K1NqZzhhNytSMW9FVmVQT3piVzU2UGV3TE9zMmtQRVYrU1pZYVJYanlnS1VP?=
 =?utf-8?B?Zlh6NGw2ZHlLYzBZRXJTRUV2WU1ZYTZIYzkwbkRsTE4zZnlwQ2cyVnRUbWhx?=
 =?utf-8?B?cHlSZUdSZ0FrdGttbEJjZEE0Q3laVjNkUS82QUF5dWZscWVBL1EvSWcyYXpw?=
 =?utf-8?B?b1BvYkZDdHQxRElwNyt6RVMxOVB3elVHUHJMUGVLNnl1VXQrSUJTVXd6RnBN?=
 =?utf-8?B?U0NCbmsza0hORk03OEQ4VzV5ZTMzOXdRa3doZC9neEFmbU9qOXNnYXozeTVG?=
 =?utf-8?B?LzRSdnpIc0ZIaGs4VXVNQmRDdEU5OWgzcEhrTUc2KysvNHowRGtqQUNacnBP?=
 =?utf-8?B?ZGVGVkdLQThIMjJDOXRyTjBjRUplWmxIc051K2J1VHQveWJvK1d6Ukd6b1NN?=
 =?utf-8?B?MGZhT2FhZkhOeit4YXplTHQrSWIveHhReDZGY0IxWWdKbldCTWpyN1NvYiti?=
 =?utf-8?B?WVd6d3JUZGJWMEh0QURaQWRhUmdJRUNlaGcrK05oamRtUU1FZVYwb0YwR2Zh?=
 =?utf-8?B?K2tVMERwWnBlL2xoVTBaaXNtbDl5SnZHMFQyQUQ5RlM0V2FCaE5yN1RGWUpz?=
 =?utf-8?B?V2g0M3R6N1RIT2hWK085ZmMyWmpMOFBodkxRTmpEWmhGYXU1R1RpWmMwVFRq?=
 =?utf-8?B?Rk9jWWtZY2FBNGpsd2NXK3FhQWRob0FsbTY5OWZnQW4zWm9sdVFvZlR2ZDNF?=
 =?utf-8?B?NldDcW92Uno5R2hFd2ZIemw0eTQxQml1K0dwYnM0bjVjd1Vwc0RMVEMxNkhz?=
 =?utf-8?B?ZmdudjFCZUFFdDJub1RZalFYL2tjZ250S2kxT1IyYW5LSG9ycnpucG9jdmJU?=
 =?utf-8?B?ejJBaW8raFQxeWwveW5yZDRnSndqbG9SR1UxUm9WWHdtdTVDbHd2ZHh2NXZm?=
 =?utf-8?B?dHVhVEdKNUlDOExpci95RXZIbTExZno4a05Wc01nVGFVeURKOW84dm9uWGYy?=
 =?utf-8?B?UG1yaDZqRS9QUnVvQ0trTFRsQmNmU01ZWUZYTDNFU3FSN3Y5MEs0ajZzR3k1?=
 =?utf-8?B?ZUJXQWlqR2tjeU9wQkVZSkdhNjQ0dExOVDVrVDUrNkp5T21aTlQrVSttblF1?=
 =?utf-8?B?eEd0N2FiYnRqclNEZXR1VVdFWGpwM2x1QWNRb08xOWNDdE1yTi9IRS9VN3dN?=
 =?utf-8?B?b2tQZGFkaEtJbW5OaytXa2hJNXdOa0pMcm50bXVUUVJKYWxWSk9mallMVlIz?=
 =?utf-8?B?emJEWWNsZkdHa3ZueTFoWUh4M1RGZlZtYU9TV2pXeWR4K3B3NGFEZW4vY0xO?=
 =?utf-8?B?cFdHUmxPMmxIQmoyYVRSQlhNb0pvWVFySjNzOVd1alpPeVNwUnViMUxkQXJW?=
 =?utf-8?B?TnVSbUR5TEhqR1hrU2gxa0NsZ0d0QmdPZTZ5eUVZQmprRXBuVGV2TENYaFEy?=
 =?utf-8?B?dW5TM1A0MXdiVDJTaDdnanlXVE9hTHVVeVhXRzV6MDZRUlpSY0VDR0hUQjRo?=
 =?utf-8?B?aHB6N0tLd3dvMm5maHJWeFZ0Q3h1WW5rZmNlK3N1NE5JOE9jOWFDaGxVaEtG?=
 =?utf-8?B?WDR1aC8vdUJGbzYzREtnNUx3QU40ZXduZkNpNTQraFJGOEhhVHBtRTAvcjRJ?=
 =?utf-8?B?dE4yV3hNOC8vQXlSbmM2UVMvU1kyVFlXTjN4MlNLWGgyQlNPNS9pU1U5Wldw?=
 =?utf-8?Q?y1Bao8gmzT2afc/o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0004c40f-3631-4dc0-8ba5-08da329a255e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 15:31:26.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxUNQiKQZoTGT3kGDhpoi980Y7G5mMB7U02UFqBpgywbjMtt4szCHXIssVKwLzemLb2Jq0l5vLOKk84xmqJfhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5472

On Mon, Apr 25, 2022 at 10:43:16AM +0200, Jan Beulich wrote:
> When a page table ends up with all contiguous entries (including all
> identical attributes), it can be replaced by a superpage entry at the
> next higher level. The page table itself can then be scheduled for
> freeing.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Unlike the freeing of all-empty page tables, this causes quite a bit of
> back and forth for PV domains, due to their mapping/unmapping of pages
> when they get converted to/from being page tables. It may therefore be
> worth considering to delay re-coalescing a little, to avoid doing so
> when the superpage would otherwise get split again pretty soon. But I
> think this would better be the subject of a separate change anyway.
> 
> Of course this could also be helped by more "aware" kernel side
> behavior: They could avoid immediately mapping freed page tables
> writable again, in anticipation of re-using that same page for another
> page table elsewhere.
> ---
> v4: Re-base over changes earlier in the series.
> v3: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -81,7 +81,8 @@ static union amd_iommu_pte set_iommu_pte
>                                                   unsigned long dfn,
>                                                   unsigned long next_mfn,
>                                                   unsigned int level,
> -                                                 bool iw, bool ir)
> +                                                 bool iw, bool ir,
> +                                                 bool *contig)
>  {
>      union amd_iommu_pte *table, *pde, old;
>  
> @@ -94,11 +95,15 @@ static union amd_iommu_pte set_iommu_pte
>           old.iw != iw || old.ir != ir )
>      {
>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> -        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
> -                                 level, PTE_kind_leaf);
> +        *contig = pt_update_contig_markers(&table->raw,
> +                                           pfn_to_pde_idx(dfn, level),
> +                                           level, PTE_kind_leaf);
>      }
>      else
> +    {
>          old.pr = false; /* signal "no change" to the caller */
> +        *contig = false;

So we assume that any caller getting contig == true must have acted
and coalesced the page table?

Might be worth a comment, to note that the function assumes that a
previous return of contig == true will have coalesced the page table
and hence a "no change" PTE write is not expected to happen on a
contig page table.

Thanks, Roger.

