Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFF710EF4
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539659.840781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CU5-0001p0-FI; Thu, 25 May 2023 15:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539659.840781; Thu, 25 May 2023 15:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CU5-0001n0-Bz; Thu, 25 May 2023 15:02:33 +0000
Received: by outflank-mailman (input) for mailman id 539659;
 Thu, 25 May 2023 15:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q2CU4-0001mu-JY
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:02:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a8efb73-fb0d-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 17:02:30 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 11:02:20 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7273.namprd03.prod.outlook.com (2603:10b6:806:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 15:02:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 15:02:17 +0000
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
X-Inumbo-ID: 2a8efb73-fb0d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685026949;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H67qnQ+xhgPRGu0oig9yV912KhvTtsBMFwRut9xU/Tk=;
  b=S9I3InzVK8bAWxKMzaZKFK/1XgNwcmtosp0yS1YX89togCXfzFgC24+B
   LpY++MlHfPjjaJ32vkpxw0VTWkCN0n+Ck89JhNmpFOQg7PQC6f2Dn/MoU
   1KJxyWSdxGnqORZ7JOcxRfvvJYdCo6Dvm1B+T1JC+fuphFfRhuSJgKkNx
   0=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 109177803
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dZ9grKnzBsrqq/OqDakb2HDo5gyrJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcUW+AP62Lazekedl3bI/goB8PucWGytVhTQFpq3g3FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgW5gKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 achAjEQThqxvuON5ryYcPlUgdUmc8a+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuqAd1NROXjnhJsqAC44DINCQYGbmKcoeXp1E/gVo8cK
 2VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJobixvOSpNpFv6zh9isQDXom
 WnU/W45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 xDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:OTt1F6hj0LPsj5b0KUk9KjDOuHBQXtgji2hC6mlwRA09TyXPrb
 HKoB17737JYVkqME3I9erqBEDiex3hHPxOjbX5Zo3SPjUO0VHAEGgF1+HfKlbbdBEWmNQx6U
 /OGZIObOEZoTJB7foTQWODYrUd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AEG735mvjUnQjrnhq9bTGfuYL6It+S1fc0VfaEXa?=
 =?us-ascii?q?5MkBna4eFcViB/fxrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3APCpPMQ1EOD+1xC5w/gnGtPW3cjUjvo+IVl4MioU?=
 =?us-ascii?q?9gu6EKXwuOmmQ0Xe3a9py?=
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="109177803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4xkXM5IEIcibrohRbzzPymj83u0wLprEA9smrVs1+ZhLesJ2X8KVt8Y4zT/N+1q8HHbWtE0tjIlE0jgSxMgmUAgjdDp/drbHrC9PpU3e65VH1je8xh7NCRmRpiIhxy4g64x3dhpz16h/ljbdxIcmzh7v53Tgv6NaamAdCeb+aE5uKQMGBtHHSO1rA8OZprO+2WlxueyWWBp6rwpBZ9umDx/vXPVeyZ4pc31MV76RH9QX1RvBEMSQex8qDIyCMQ3DGrYD6re4zkRxVkitHMBXTDe3tKEt2XX031JiQOL96zsqzuicypWqUpUQTijwb/irUFT5kOz3yLUVeal6145Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nv/Cp1Joc8laf1E+rCi3GRW0NW+O6nIj92ZsL2gumXQ=;
 b=YsWBonGZa45haX4ZEKoEkNXTsWeuSZYxQyYplHrNJbhEstFnsRWhFV/UEBH4UViy1wjwpF+V5uWElLivVNok3+G3VkbMn7ZJUFE/iQJWydNjTLQOD79Pleu51MQs6omSfIcwjHGvl6bUniQhV0S6o6wAZOJP6NfaVsUHEIYKHCDpSZvtWML32QYqhQcrzj/ULPgT4JbY4YyRBT408ex/dqnV4y/v8txodgJU64fVTQLBBRfXL2wuKxlSnMPg6O7AgJ+mxXAkPEma2YjZFzZ2DQw5U4VZeu0/c8tRnP5aLU3qIWgEAGPWwhf717+4B1S/Xse+/XgoNwXWhaN9GEOBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nv/Cp1Joc8laf1E+rCi3GRW0NW+O6nIj92ZsL2gumXQ=;
 b=daESfjU6IUzepELMns3FkEnuGk7+gBCuF69LQa27zUhCRAQqcKRYH6SuVCaUaMwdpeS3XKydr6iLDMVu+oW0EOpXsexgHjELWcSHi6eqeWJzqCy4uHUI+AS3tSiMkSd+Y+9IXqLfu0p0+SjVndZ6h0/iApTdMMz13C0uPuoPXwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 May 2023 17:02:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZG94c9y4j4udFmsy@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
X-ClientProxiedBy: LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3bf8c2-7d90-4042-1698-08db5d3107fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JmYKOOHx6KlZEepp0E/58ing6tc2NXGUQSp4NNfyL8aq2SRaxMZtrCyemFOOwv2W2HYFPFRkySt6xyhiyWptpUL37S0cri6lwuAWAfoFcW/U9R9WUEJl7/IhehRDDWlDUkZGa+HCWqY8OY9GHFDetiwBfiiwk04O4I9aHPXO7vYro9CzdoYtxfGlEIuy/ZgaUHut2ySuKA026WV8Rj340TrLmhQCgF1Digye8p+/taztdmJzGrw9GgbIhEzxYnn8J8chFc+MwfCTBUAeW/dssxObgBYhPSShyJvmvWAy4AxlWByLx79/oqpDXil8X0Sv3mLaLG6LPilOh78hr7EtaZqMw0J7UGaUHdcDTkgtHMnJQ7Whut0cmb+snYA80tKNbeaiv69l+NvYm3jitVkh254+3ai05JuBHp+9Qg5Fw3Fue+Nx1ONzqNaVI0Oc+FZIdbPzuy2ZU2ayyoAHEVt2qWIqCOFyEF4bkrTE1ZZDzBudwsPk7CvPQPUuOqJgPUMaSet54Vh3QlvqsFJJB9OUtXjgyOA4ehB2cGZvw8OCs0NdJOgeeFwP9bGyjO7INUbM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(54906003)(86362001)(41300700001)(6486002)(508600001)(316002)(6916009)(4326008)(66476007)(6666004)(66556008)(66946007)(5660300002)(33716001)(8676002)(38100700002)(6512007)(15650500001)(26005)(9686003)(186003)(82960400001)(53546011)(6506007)(2906002)(8936002)(83380400001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmNhY0RxSnprTjJ6Z05tUlRDQmg4bTZxd0V4czNsQU1NOVZJMTY3VVZnSm9Z?=
 =?utf-8?B?c0ovWU5sOXMrWnBKcncvTk9Pa01QTG5ZKzd0QjY4U0RKanVlcHU2K1N5M3ZK?=
 =?utf-8?B?ZHNjc01LTUJOWGRHRFVYNkhheVFTSkhRVml3OTlFUVRsa1hTMW9WbUV1NlRS?=
 =?utf-8?B?Tm9Tc1RuVW9tb2FpL2pPVHZtb0tPb2N2b2xRa2tWRHg0N1gxcVNLRUVHOFI1?=
 =?utf-8?B?NmgzRjZLeFVkcVd1R3A4YlNUbkVlOS9naEV2cGFMcm5OMGNRNmM5VlRkYzcw?=
 =?utf-8?B?R2lITFE0MGtncmNXMUI2NnN5dW1rUUU4dzYvWEFyZXgwQjk5VkNJc2JKSTB6?=
 =?utf-8?B?bVNteEZpRkdxSGE2VE9JVkh0ZXdVNklvZXltb3UrMUlqM09Xb0w3L0xrTEpp?=
 =?utf-8?B?ZkxZajJhWEZMNnI5QThPL1d2NUpEeVg2VnZrbHRhakdFZlNkNnUwVkc3NzhS?=
 =?utf-8?B?c2NwcWV5M1lzb1RsWWRoWFpubGlqWEd3b3FOMUdoWnJrbTBUczJPZkhaVmQr?=
 =?utf-8?B?MEpLN3BVRjZCSi9qcFE0eVNkRDVVUDRkY1lWeFdXSi9Lb0wzdHZkcWswWjZV?=
 =?utf-8?B?VENXcTZaaG0vQjV6UlJsZkdHUUZ2Q2hWTWhFdDJQUEtIVWQ1ZklFdVNRWVJ3?=
 =?utf-8?B?Znh4ZVBaSmhmSkdLVWpUdjl3c25PZDFpUWppekpUK1FzT3FCdEZwZFIzTGNC?=
 =?utf-8?B?TU9GUkJVSGp0Vm9XL3d6WmJ4amJUY0ZCKzVmeTY5TG9vaUVIY05wVkx1TVJ6?=
 =?utf-8?B?T2g2Qis5SU15cEk2NU1MUlRYSEpwcGxIaUIrNm5TNXJUNzF1R254cWFqOHBU?=
 =?utf-8?B?UEdLbTJ4dWxlbWVBKzkvb3NTSGNxalZ0bDFZVG9BY1BMTzNGVHNiR0IrY0Jt?=
 =?utf-8?B?VkRJYW5pVWVIZEQ2dWlhR2NXd0lpNEJ2WUFXQXB2eE1DcHBKVmE3VnZxZzVZ?=
 =?utf-8?B?U0xyMmZ5WmJycnhFOHF3blEwUmRWa1pxUFpoWWV2eW5ldjhES1RpWFExZDhZ?=
 =?utf-8?B?S0pYMXBhVnl3VjFhVXN5dGVNOWlkejFkMmNFdW5BRXFBMWY0d1B0akJSeEll?=
 =?utf-8?B?Sm9EaWRjTVVJQWpsVkxLNUljR0cyQWYrYU9ydmk0OEo4YnlFY1A4OUZ5K0NB?=
 =?utf-8?B?aGVTV1RhTXZra1lMNGFJVE13Rml6aHhyR1Q1SmRxcWVyVnVOYitaNHpaZmJS?=
 =?utf-8?B?THBCalA3ckRha2p5YkdDR0RDV216MmtNTUIrVlRjQW4rN2Vjb2ErYmlveDFw?=
 =?utf-8?B?b0JzOVNvRWNOWFdzWmRTZTNRQlJHYjhCTzVQeXh5TjBoaXdOUGErTzdxVDR5?=
 =?utf-8?B?c29Ob1FmYzlUandmUmx6Q0wzeC8xdjBZYWk1T0FlUndWL3h0bEc5TmpVQWtu?=
 =?utf-8?B?VDRDYitHVWs0eWt0Z3pobkRKbGg4MklDWWpQSS8vTkJIL0Z3WDVMaGtXT09Y?=
 =?utf-8?B?OVdyeWg0UTRJYm12TDVRaEhvRWNxY3VmbStjMFBBeU9NdFNnM3JtT1VJcWtY?=
 =?utf-8?B?MTc0b3ZYclFZa3Q5eWsreFVubXE1TjZQOFlDWCtpQXdvRnVpNXpsbG54a256?=
 =?utf-8?B?RS94TDJqRERPVkJ6R2Q4VUZTdXVzY281NWxPTGNOcDlBOHlNMUVERnVvTTMy?=
 =?utf-8?B?SWxaOWs1WnJRODRzU0ozZWZUeWpBOXNFa0l0TjNMWlJhUnA5ZGpBM09pLzFp?=
 =?utf-8?B?ejJIVis1UHZmWjVIZGI1bEJLVXFUU2lPZVN5Wm9RTHl1eUZKNGdlV25MVGFz?=
 =?utf-8?B?blpTajB6VzlLYUp0OElYTVI2NUh3cjRFVkszWDdwdVgvUUorZ3hRL3NCNXBK?=
 =?utf-8?B?THgvRjR6QmJCdEtlVzJtczdnekpPSXdKSjhwTU1Mbitzd0JCZnhxRUZXRHFp?=
 =?utf-8?B?NGl6SHl3WW5mT3Jyc2Nsa0lxMksrUUd1UkFjcFRRSlhmbkxEN1pxeU1GdGF0?=
 =?utf-8?B?UTl2NVp2clVlVTZ2d2l2YmY3eE1hYmFnUFdDQUNJcDFwa0hxSlQ5aklDREdJ?=
 =?utf-8?B?djVTSVI4S0hqaWtmR2RNZVg2NkV4VytpS1lJSFhmbHFSci9vVWEzU3R1N2lT?=
 =?utf-8?B?SFJvUnhVSXFuSURCdXFQMmdHeTVxWGhQS2ZaQ2I3Si95d3Z4Qi9wQy82V3VW?=
 =?utf-8?B?bTdubSt5c0RIRmR4TklZR0dCekhEbjFnQUNUZFFGdVJtV1dFT2EyeFFOSlRt?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oOhTQajh1pYTSPEVzwjLBVoAuontOIpNGsWTHOjGF5EWHCn92FrvzHtZ3K+J7lf7wqJ30rOaBAfHlxkuzn2jqfYT3xoDAYhtPtTCpueYGSFaoc9KXNW1tjlWhUYi80M8ffZBdxszzqCcaoFa2+XNEkivU/WKThTIku7+8ycWSNRMmN7RqxRQYhk6IDLFqhMbpXsb9ovJP63adeDBBgX9oxTQFvjZ5cBVFb4add8obuZp3FoOQk7/QFJBnugabwk28NdtDZ2VvZimIZpEZRemq9algcGzVbZd0a3GypEbAOrRv6xFmfOy0ALECA03Fp66L+MleqOa7s6bh49KgDbu5eDUpeK6/oD+4NsoOXAB/IGpNHT2toS6Pz4aKVwY3j2yYa0lroj8LJO0TZkYqvQ7D1qyMAjstWqfaoHF5qOinukAi+Q0KP04B75zZ9+RHHcaIvbP6eTpbExc0RXzrm9FhOYoL9Yn2FRBMcmxKqa380ieiKkIfaEzrX0bLJbr0CdwW70kRiATlut7lqQ0VrK3eyq6KN4QD9DaaLmmTam/ql99sEL0Yn0Ujmsj18pKcNUiNxRL8txGTqZbGgtQSHTLC3BvSbUvk9+ZEfp0cBZkTReE3wyY36gmaaCreDPqbYRDtm0qaanCnoTIrQiqTYse5NXLMEWzGiPxHTvvrECI/46Nmz8laRMbcYE8EL0Fg0jsalsx8GnGxo+s9PzWbI2Siga7EmsiNljxvxHExw7QS4f8NLDhJrdzkmgXrzUqaDDLRAEiEXqga8+BY2ar7G4kXFGiTNmP67F+LOPok777uJqN0N/8uSO/+xcW1aTAYFfygLCeh1kFbop8lYRiocGhaA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3bf8c2-7d90-4042-1698-08db5d3107fd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:02:17.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJgovvR3QXo2Nxk3gAg2jZjx/aCdDNfupzjxa7P/gOWBeM8+UF6PDlstSRn8Ff3M+BWUqpPGAC4FkPyqUEr82g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7273

On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
> On 24.05.2023 17:56, Roger Pau Monné wrote:
> > On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
> >>      struct vpci_header *header = &pdev->vpci->header;
> >>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> >>      struct pci_dev *tmp, *dev = NULL;
> >> +    const struct domain *d;
> >>      const struct vpci_msix *msix = pdev->vpci->msix;
> >>      unsigned int i;
> >>      int rc;
> >> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
> >>  
> >>      /*
> >>       * Check for overlaps with other BARs. Note that only BARs that are
> >> -     * currently mapped (enabled) are checked for overlaps.
> >> +     * currently mapped (enabled) are checked for overlaps. Note also that
> >> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
> >>       */
> >> -    for_each_pdev ( pdev->domain, tmp )
> >> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> > 
> > Looking at this again, I think this is slightly more complex, as during
> > runtime dom0 will get here with pdev->domain == hardware_domain OR
> > dom_xen, and hence you also need to account that devices that have
> > pdev->domain == dom_xen need to iterate over devices that belong to
> > the hardware_domain, ie:
> > 
> > for ( d = pdev->domain; ;
> >       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
> 
> Right, something along these lines. To keep loop continuation expression
> and exit condition simple, I'll probably prefer
> 
> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
>       ; d = dom_xen )

LGTM.  I would add parentheses around the pdev->domain != dom_xen
condition, but that's just my personal taste.

We might want to add an

ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);

here, just to remind that this chunk must be revisited when adding
domU support (but you can also argue we haven't done this elsewhere),
I just feel here it's not so obvious we don't want do to this for
domUs.

> > And we likely want to limit this to devices that belong to the
> > hardware_domain or to dom_xen (in preparation for vPCI being used for
> > domUs).
> 
> I'm afraid I don't understand this remark, though.

This was looking forward to domU support, so that you already cater
for pdev->domain not being hardware_domain or dom_xen, but we might
want to leave that for later, when domU support is actually
introduced.

Thanks, Roger.

