Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884450DD0E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 11:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312678.530016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nivHS-00028y-De; Mon, 25 Apr 2022 09:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312678.530016; Mon, 25 Apr 2022 09:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nivHS-00026u-AT; Mon, 25 Apr 2022 09:45:18 +0000
Received: by outflank-mailman (input) for mailman id 312678;
 Mon, 25 Apr 2022 09:45:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nivHQ-00026o-T9
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 09:45:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c4d09f-c47c-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 11:45:14 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 05:44:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6780.namprd03.prod.outlook.com (2603:10b6:a03:40f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 09:44:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 09:44:44 +0000
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
X-Inumbo-ID: 66c4d09f-c47c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650879914;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mHj1wpbu1RnfUXZMZyMMeJPAd2UVuUrTZBPyjsXUzXg=;
  b=QRw/grylIFwWC6QXiF0OQtchma8yrw8LvmRSr2xliug456lGTxSxrQg9
   rPzZBMGBrvPKgjzBhUHHZoU1kYSmM3It/MKTlIONxUMsARzR2inPI6eEz
   m9UOWVH1e/zAWgTigeKiDybgITxUYv7qeDK+JZVMT+Y2K8GtsaK7rA0Dp
   g=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 70245856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YLjVDK3devo7YoxVJ/bD5ZJxkn2cJEfYwER7XKvMYLTBsI5bpzwCy
 GtJDW6POa2CZzf3KdwjOoy19UsH6JfRytdrQANvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1EjLjrF18OO5HekfofXzQADQxHJLdJreqvzXiX6aR/zmXgWl61mbBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfyVu7e03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianKWEF+A/LzUYxy1rIlB14iefIDJ3YeoDWS+pzjFe2t
 0uTqgwVBTlfbrRz0wGt/mq3g+7TnQvyQI8ICKCj7flunUGSwWoIThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYiXN5XH/w/+Ru64KPe6AaEBUAJVjdELtchsaceWjgCx
 lKP2dTzClRHq7aSVW7b+r6KrCiaIjQcN2sLb2kFSmMt4dDlrJsikxHnQdNqEarzhdrwcRnr2
 CyDpiU6g7QVjOYI2r+98FSBhCijzrDLUwo06wP/Tm+jqARja+aNbYGy9ULS6/oGKY+DV0SAp
 1ANgc3Y5+cLZbmPniGQROQGHJmy+u2IdjbbhDZHE5co+Dus/HqiVZtN+zw4L0BsWu4IdjPkb
 1XakR9A759Uen2xZOl4ZJzZNigx5a3pFNCgXPaEaNNLO8J1bFXeo38oYlOM1WfwlkRqibs4J
 ZqQbcerCzAdFLhjyz21Aewa1NfH2xwD+I8afrijpzzP7FZUTCX9pWstWLdWUt0E0Q==
IronPort-HdrOrdr: A9a23:gxqZkqsO7b3vyKbRYuG0d2kC7skC6oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ0fSLlMB27ffrzWFjiUWjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.90,287,1643691600"; 
   d="scan'208";a="70245856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOhG9+7wB//G87sKT8EO/iiLdzq1W0q5YVwb8I0useuBtyWv9Cn4JD1oEnWYYta6xJqK80Z9DoqGz6mhFxVdgB9wmJv1MIFYoYcO0Vq8xcibUuByLst+DdPK75A8+F2VCQ7DIj6jzNy/PYke/dy/JBCNtxNuvcTLA+k/Jodx3xjbd6OdeFuYziMCKchHzmJDV8U7ekTBatRx7E8UFKpLVBS9aeppVrbNL2vDL+TCko5DePr7Buoag865hqIfVheFtK/L2Z/nxCP+rvc2Qa7Q9ty30gPogS5s9yFjGPpVqTlz5neveRwSyYGcVbusHFcisrRYEGaIeMe9q3xSQ6jVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcc+Y9ld8mEbMiHKo68pZae1wKD5BKrF/ijBxuLm+BU=;
 b=lMLoEzhKUbEukTiAj14anO4USbfLNVt7D6ohWuNOyOeVOEZVdzT7Zoe2Xq1jcf7zPFPvIXDetbv7Kd8R8NGZnmlDoQe27qu5KcKP657IIacaO6MM1awhyUUzMrxUuO4h1CVtskG2uJdI20E92szPJOcaO850X5LAakblMAtgt68xlNSPtrbxCtgZrPCdkvZvJ0fSiG34o6nL/ZwcKXJX9ad9FQ88TgWEqJDifViZpOk9WxQXGKs248+7E6QZbwWNeUstt/u6QisHFDcZWEUHxuSbQhs5u5lTIUhlS07gcDpVabDgWfD0wzNPzQXkqWVoCob6n0KQ3uejZb4JJZkysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcc+Y9ld8mEbMiHKo68pZae1wKD5BKrF/ijBxuLm+BU=;
 b=FlI/51yIBI8JVhtMs17zKtJ+GnWL2AynSBEElSi09AEFUTdcp3/oMEBms74xMmp5KZNL5ZuVYLvp4X476QNMC/wF61UGKskFsT7GStSe2SnnNOeG1BAikllKuAoKu2NKXjQs+9mDhqSmqT0x6LqMjORBcg/Qk3wpZRS80o1v3RI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 11:44:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
Message-ID: <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422163458.30170-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ddaa212-79ce-4808-1a7c-08da26a03a8a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6780:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB6780DDF5806198A36C8A7F388FF89@SJ0PR03MB6780.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/vR10g1B5LE7kUtK1NOCQA6q7J81zyXEavOmnzIbNZfW8tNfiGx3kmpjnnJVNdMcaV69uG6siZOdDcsAbPriGL3x+0KxYgQ47KkjtTb5Iio1lIYIfOktJF6i3rXmJcOGMz/mQu/EBCAU+uJ1CjLbhRGyBg8xxPbSP5yd8mB69tpIsm90BiJlB6qW4wFwQG1UHcgeJUFuDQynRBCprkBzZyOt9wAUyg01vTUVI6ccFU8IhGPNoUe3EJNPC7P2W8R+HQZ37kY8bkGrbhwVAYgiCDr1wf7sBXJ02mgraQVATk2Qn9kQGbU9JnCTicsTlZKgEMns4sKDRpWYHu+VxDxr9K4NxQB2ktjk6B8qkbHHtjJ6zqp4vwxCz2kCj+O4U6NXXxoQ3PQHhlLs+jqiSBmi7+yPLsQvzDy6vHKAqthRHmq3qx2oTrgcVZN9LWXgfYTuLWdN5Y3+KI7ft7UXy7SSaMj8i4XC1RB4v7qzenGWWFjNW1jNiJoOG6uqOt0ETi6T1Wrkb+Ecn6b+irEy8giPryY8hhgGMRMzFIq1KQnMnsRfD7/gwlaRKwIxptWkyzIeo4aPPbNTiOQTqieF0ADbY3DjJfiQH4cNEcacEQQEPkuLICUqfTOPuH+KSzGk5t7ri7XvaDJQkCWV3hp+PlOfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(82960400001)(6666004)(66946007)(8676002)(66556008)(2906002)(6486002)(5660300002)(54906003)(85182001)(316002)(83380400001)(6916009)(38100700002)(6506007)(86362001)(7416002)(66476007)(33716001)(8936002)(508600001)(26005)(6512007)(9686003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU1TRXlPRmlSdVpENWYvU29ZQS8wWlVRQUdzZ011aGlHeW1NS2ZXd05pMWdm?=
 =?utf-8?B?TENaM2dOcTNILzlYNDloS0FHc0RLM21PK1RJN29qekRHV3pYMXY3QW0vRHpv?=
 =?utf-8?B?MmtrdmJFRlFJS0l1SUpVdk5tZEhRWDZ0V3BmbDQ0VThIZnZlcjZFMytsMEpJ?=
 =?utf-8?B?VDBFLzUwWmF5OVNub3o2eUpmckd1NUxpb2NjUkE0RG5NRkdJTEpldkw1NjRH?=
 =?utf-8?B?b0wvN2Q3cGViZEFkZVVmRTRzYlNQVzJJUFc3WUJVNEFwN0dDMjRMUWV3T1M3?=
 =?utf-8?B?Smt1SWRiR090Yk1uZ1doVElrWUlTbE05Wk91c2NwTXRvWXlYeUlaSnhWWEtR?=
 =?utf-8?B?c1dSTUs5RjlUNmFhbHd0NkFTMUc0TTFmaWI1NG56bVNsQ1h4QkdUQi9MNU9G?=
 =?utf-8?B?RkFOOWxZYk5udE0yOXZoalhjZllsUlpVKzBSdzQwY1hVYlZNS1NXS1hBaTAv?=
 =?utf-8?B?Y0xhayswVEs3WWNZa1k4VjNZeU9OSldDSUx6Wk0xU2hVdFRQU0FNT09Kd1ZH?=
 =?utf-8?B?Q3N6eHF2dWRzcFN5ZGowQnh3T3JHV0NkZWdGaDg1YVFZT3BSSENtNEp4c2tZ?=
 =?utf-8?B?ZWR2NEpvZGxnc0NTczJrRjIySWNDRFE1N2RVUUpuZkpsaVp3ZVg3d2lUbnp1?=
 =?utf-8?B?MnMvVmRyazhSZW9rNkdhOXhSUmR6cjAzV25VMHZyZnRsZWdkb0tsL2ZIMExk?=
 =?utf-8?B?TGU2UXNUY3hyUUFtb2o1d2hONDhtNjY4VVhHdVFlTzBFaUNMd3lGR2Q3Vklh?=
 =?utf-8?B?N0h2ZGMxbDZQbGEzUFMrQ0J1YTNTRDBrNDVjeHZJUEE2eDgxaVpSQXZWaldF?=
 =?utf-8?B?NkhZWjQ0YzBsNStNeE0wL09VYjdWaVlZdEFhSStlK2wvSXg3dUo4R1o4Nk9t?=
 =?utf-8?B?RHFoeDFkd2dQUDZZYzNpd3NiYUZGOU5WOXh5cWg2NGFENVFDa1dZK2Q4WlQr?=
 =?utf-8?B?bUMwL0NOYko0U2p2WWdwS0lWSDZDQ29GeVppbFlPVVlWd2VSaS9FamdhOHp5?=
 =?utf-8?B?QnpJaC9ueHlqRnVMWmk4R0QyTE1KZWxFWWowRGhZaEhpNVdTd3AzNmdueXZz?=
 =?utf-8?B?VlBSaDdrS1VjRktuNnBLTDlGYXlZRUJkOExxWjYwMko2YU8vbmdiTUtyVmpr?=
 =?utf-8?B?T3hJZlM4R0F1SnJzQ0NvZHB5NExha0VYL1BUL3hGbXFVekh6VDdQWVdEQW10?=
 =?utf-8?B?bGwyY0NBRFNxUWVTb2E3dVNvZ2pDSXI1YVk4blZOeS9saXdNYlhCTEhjZXB5?=
 =?utf-8?B?YkcxODNzNTV4akJBRnVWMVpKVnRGQnpSNU0weDEwRnZHQWp5S0dWTmw1WFUv?=
 =?utf-8?B?aDhZR0NYVzhUUmVkWlpMK2pHeUhiRis0VFJocWtlL2U1cm9wQlZIbEdwbjFF?=
 =?utf-8?B?OE96Q3RPREdWc2o3Z3pJcXM2d3dIZXZhSG5yVHZ2dkNTRTdoYlZONDJBc0VG?=
 =?utf-8?B?djF3N3FpMkphUmhjWmRpNEQ4WitxNkc0N1B6bEVnS3N1aENsSERYdzdpN3FP?=
 =?utf-8?B?cmkvdjRFYll0VEkxQ2c0R2gyRUxudkxUd1FZZWdlbkJpeFZSQnZ3R29GY0Yr?=
 =?utf-8?B?YUY4QjVwYUVPRkdqeE9acWk1RExTU3VuaVNRM0VuUnUzTy9rN3U2Y1AzZHhW?=
 =?utf-8?B?QWJaWGl5eWRYbzRzY1VLNXFmY3VrZCt1dkN0S1BlNGc4bHNzcU0vWEZxQTRm?=
 =?utf-8?B?WVlnQXNvRmI1RWJUc1NKeXdmNE0wWkNEcHUzNDhsb1orMUtjME9UVG5MejVv?=
 =?utf-8?B?eTk0T1hLSlhsTjRRV2dIVnFtcVRIU0NjNW5Id2Z2aW4vbTN3K3VmYlpSWUJ1?=
 =?utf-8?B?R0xHVW5xWDdRNlU3eUJXVVM1bDdUQ2VScytYN2ZnVEtUdWRwTm5DWG5VS1ZF?=
 =?utf-8?B?MEMzWkFIN1poWkRKR3dGZUtRNCtHMm9YVGptYVNmcmRkNjJDNWpvdUdabTF4?=
 =?utf-8?B?WlBZQ2MzNEVPNXBGK3hXakpUdDJBdEczbWlmc1JPb2NnVjhYdllyNWJYSnZn?=
 =?utf-8?B?SDdydlRFQnJ3V09nM0ZmN1NMVHdyTktXTk9YUnBtUi9YbGM3MnhmSTZqZnVv?=
 =?utf-8?B?YlAyL2F0MUpyM2didTluYlhQQ3Z0SHNWTVpEOVVnYUhBQVE0a2Ryd2xIdEwz?=
 =?utf-8?B?WEk0Y2h4Z2xWZTFOZDNGUDdjSzMwUXVHK21SOStEM28vOVJyQ044WWhkaUM0?=
 =?utf-8?B?VFMyWWlIcFBEdHQxSm5sSWxkT240TllPTVErL1F1eHo4NmlwN0V3c3pja3Vh?=
 =?utf-8?B?d0pQcllsOTZQV043bnBrbkgwWVB3VlJsREljTmZrWkZBQ3g1djg3L0JGLy96?=
 =?utf-8?B?WVM3ZytpdzZMM3d2RmNqbzFjMWhVQmtwZmpyY25lR1NJZTRLdjdQSEhYdXpX?=
 =?utf-8?Q?UxN6O05k5iWVWmaQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddaa212-79ce-4808-1a7c-08da26a03a8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 09:44:44.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTf/aVc5JVrdqtO/STaFBnaxXxupjTteH6Qs9NscXvjpGFdp7MzSip6ncne1BwtbL5ji7YKiYNzE5OfchKgLAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6780

On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protected by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by

'Some of the hypervisor code can be executed in a system domain that's
represented by a per-CPU non-privileged struct domain. To enable...'

> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit changes the idle
> domain to be created as a privileged domain under the default policy, which is
> inherited by the SILO policy, and demoted before transitioning to running. A
> new XSM hook, xsm_set_system_active, is introduced to allow each XSM policy
> type to demote the idle domain appropriately for that policy type.
> 
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/arm/setup.c    |  3 +++
>  xen/arch/x86/setup.c    |  3 +++
>  xen/common/sched/core.c |  7 ++++++-
>  xen/include/xsm/dummy.h | 17 +++++++++++++++++
>  xen/include/xsm/xsm.h   |  6 ++++++
>  xen/xsm/dummy.c         |  1 +
>  xen/xsm/flask/hooks.c   | 21 +++++++++++++++++++++
>  7 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..e71fa3f860 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Hide UART from DOM0 if we're using it */
>      serial_endboot();
>  
> +    if ( xsm_set_system_active() != 0)
> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
> +
>      system_state = SYS_STATE_active;
>  
>      for_each_domain( d )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6f20e17892..a3ce288ef9 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
>      void *va;
>      unsigned long start, end;
>  
> +    if ( xsm_set_system_active() != 0)
           ^ extra space.

Since the function returns an error code you might as well add it to
the panic message, or else just make the function return bool instead.

Or just make the function void and panic in the handler itself (like
in previous versions), as I don't think it's sensible to continue
normal execution if xsm_set_system_active fails.

> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
> +
>      system_state = SYS_STATE_active;
>  
>      domain_unpause_by_systemcontroller(dom0);
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 19ab678181..22a619e260 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
>          sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
>      }
>  
> -    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
> +    /*
> +     * idle dom is created privileged to ensure unrestricted access during
> +     * setup and will be demoted by xsm_transition_running when setup is

s/xsm_transition_running/xsm_set_system_active/

> +     * complete

Nit: missing full stop according to CODING_STYLE.

> +     */
> +    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
>      BUG_ON(IS_ERR(idle_domain));
>      BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
>      idle_domain->vcpu = idle_vcpu;
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 58afc1d589..3291fb5396 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -101,6 +101,23 @@ static always_inline int xsm_default_action(
>      }
>  }
>  
> +static XSM_INLINE int cf_check xsm_set_system_active(void)
> +{
> +    struct domain *d = current->domain;
> +
> +    ASSERT(d->is_privileged);
> +
> +    if ( d->domain_id != DOMID_IDLE )
> +    {
> +        printk("xsm_set_system_active: should only be called by idle domain\n");
> +        return -EPERM;
> +    }
> +
> +    d->is_privileged = false;
> +
> +    return 0;
> +}
> +
>  static XSM_INLINE void cf_check xsm_security_domaininfo(
>      struct domain *d, struct xen_domctl_getdomaininfo *info)
>  {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 3e2b7fe3db..8dad03fd3d 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -52,6 +52,7 @@ typedef enum xsm_default xsm_default_t;
>   * !!! WARNING !!!
>   */
>  struct xsm_ops {
> +    int (*set_system_active)(void);
>      void (*security_domaininfo)(struct domain *d,
>                                  struct xen_domctl_getdomaininfo *info);
>      int (*domain_create)(struct domain *d, uint32_t ssidref);
> @@ -208,6 +209,11 @@ extern struct xsm_ops xsm_ops;
>  
>  #ifndef XSM_NO_WRAPPERS
>  
> +static inline int xsm_set_system_active(void)
> +{
> +    return alternative_call(xsm_ops.set_system_active);
> +}
> +
>  static inline void xsm_security_domaininfo(
>      struct domain *d, struct xen_domctl_getdomaininfo *info)
>  {
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 8c044ef615..e6ffa948f7 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -14,6 +14,7 @@
>  #include <xsm/dummy.h>
>  
>  static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
> +    .set_system_active             = xsm_set_system_active,
>      .security_domaininfo           = xsm_security_domaininfo,
>      .domain_create                 = xsm_domain_create,
>      .getdomaininfo                 = xsm_getdomaininfo,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 0bf63ffa84..8a62de2fd6 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>      return 0;
>  }
>  
> +static int cf_check flask_set_system_active(void)
> +{
> +    struct domain *d = current->domain;

Nit: you should also add the assert for d->is_privileged, I don't see
a reason for the xsm and flask functions to differ in that regard.

Thanks, Roger.

