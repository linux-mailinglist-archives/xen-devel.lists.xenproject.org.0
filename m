Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7A6A9709
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 13:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505955.778959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4IP-0003ww-5f; Fri, 03 Mar 2023 12:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505955.778959; Fri, 03 Mar 2023 12:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4IP-0003uW-2D; Fri, 03 Mar 2023 12:13:57 +0000
Received: by outflank-mailman (input) for mailman id 505955;
 Fri, 03 Mar 2023 12:13:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY4IO-0003uO-0p
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 12:13:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc2ca65d-b9bc-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 13:13:53 +0100 (CET)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 07:13:50 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6173.namprd03.prod.outlook.com (2603:10b6:5:398::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 12:13:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 12:13:48 +0000
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
X-Inumbo-ID: dc2ca65d-b9bc-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677845633;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G++MmP20h1eba1/II4lLFzrNo31250ZZlU5kn5n7Is8=;
  b=NNUoLpDznU/2tRQYeKOdNrfZBBBvSeD7d2+hTBZt1o2IR4Kz35qQOzB9
   7VsEi6QaYZuNp013tLLwdtadGrVgsIzD6g+VDdgmSENKhTxusbE/VqrIe
   Ptz86jrEiTJIwd6WlpEnUKESgk8ZIoieWBKNlLrPsz3QfEif7c2iUol3m
   s=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 99735361
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0NHyK62xB00PXDcqGfbD5R5wkn2cJEfYwER7XKvMYLTBsI5bp2dTy
 zZJWGGOO/zbN2L3fdh/aYu3ox9Vu8TQy4VlQVQ6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdmPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJltQ6
 NlCLmo3cTfYn8Gv372pQchSv5F2RCXrFNt3VnBI6xj8VaxjbbWYBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6PlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHKkA99JSuTQGvhCuUSu3nI9VSQtaHy0pNiWjBGdYdIAN
 BlBksYphe1onKCxdfH4Xha4qXrCuQQOVt54Gug2rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqW/62Yqj6aMiEPIWgPIyQDSGMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMWgrwSiYsH0v699FWf2Ta0/MCVF0gy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:3Ye2VKBaH8uRirflHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="99735361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYhqLVyHO2leeinGhNOvTv6uDCM1MyI32C7EH1LmAN/hauic0s56I86v7kYS5xvIwNlxi5rupwF2J+JkCTdbgOXbTVm5DA99U/fdKTgZ/8w3+lfKpG+jwkoav7yyZI3TW+Wum6DIFXh9o0qnFZol3djdLtXIf5EMx3Xf5QWmFKy90k0ne9n5SFig0XA/s+VbO7jD+K7C6SJNFhKA+JvXkhNvEYW4SAFdFP//xCMeMA6xGbz37al8mOszfX5Nb8jGBiL1w8nHTJxgHZUUcqQfgiO/ys+nmCW8AXQJHtdrCrzPwpTxzxitudTRIw2wm5te+kkrvJpOF7ViOUjOO2sCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92aB+LnbXvGRvihEybIkk05yCZObe3KkoLc0g+7xCgY=;
 b=oZCje8ZRHkRKrZXElqXDtzwqOmzLtlzGTo+tMePFZ87QgEiDBPKiTbdiVguQK/u0s66NJ/t8jKX/izqUsu2Wis5wViE+I/KQHFY8wfUP6AMUOFlKSPLkpB3NXi2pad2bfqc5PgvNTiQaMTIuYNyzxC1QrnRlTicl22k80iHg9aMcGlAO8vsj98mm5nrvxXqjsTL7mT11POEerv+pPV6bbSWjTG0/43SeOYUthFFKrF9uVSOjo/Lm9vgE9FrkehQIsK9xN+nThgntlq8aYs77e+NMcAf7pc0rvErzz+GXUXFM9AJu8RvMDgCU3ekTeCWTIB03pzTlXkXynB/UsTSTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92aB+LnbXvGRvihEybIkk05yCZObe3KkoLc0g+7xCgY=;
 b=AEgR6OGCL63gUpXIVbS9mHz6+zINr1MdjG8EQA23uAYLP9hctPgCw142otCTCjNHnEW1luGpPkPv2dD5G6//rYICW1+3aryso45WF06MvrkkcSo59tQp/ZjrJoZ7hZ+mYWTPg4A635YIB21cChNJAbIqgy4WO3jYuYT1wJu2DfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2820b89c-7d96-8ed8-8513-032514e6434d@citrix.com>
Date: Fri, 3 Mar 2023 12:13:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230301090644.4452-1-michal.orzel@amd.com>
 <62e997e2-8e45-9048-10fa-469bfb28b08b@citrix.com>
 <631c534d-5781-7884-4814-7182b0c59621@amd.com>
In-Reply-To: <631c534d-5781-7884-4814-7182b0c59621@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7d89e8-5358-4843-71a0-08db1be0be5b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A9uSrYOIoUeib0SVZatF+bmaDzpk6t8J7cCFy0ZYljyWJVmVPCtXtK3H6fi0qXeAggaE/klMIQ4LTaHACV57ftjD3faQkITlu73O/L0KbCxODhQdQJ8S784Z8sgJ4/bQekuXW0f/fjU6I92wCXRtDuKs2B3/Qy21ymTJOyUc41JeqxtC/LUZFvGhxEtakbV1bAJmX3G8lJel83r3w28r5bqJs8veiPgTItUKDcdp1jzc8Q7SnHcxIw8hESl5vAmgIt5Rp6uzKdwEELodou0xwrLwu1sMLLDix6kDEhjEWLNGoyM4WRoIeuJ7xe4Qfw/jUndWvKeAzXRBC75H/XdMpo0xHt+vHepBhyooUgaLXXm8AMG7jmX/ZWZGFCwDvdmvxy+PDvX3IZtfHwwwfpeU3YNUClrvLliAajEg8GOBX92J5RpmBcvgoDwnu70fClmWfyCd2Td1sZVa0P0x08+7Jyxx9pPIPUXvZU7RiZlsi84kSAgKcdVmQo2Drvkpr4aW6UWyI5XtEcfBz+Ds1QPTx732y++93ngojj86uEBg1jHaE89Milqv2iEs5YuV1V8SBuOzx9y3Jk/y70fAXSmXd18FgNGZP/DS8YzDpNygGA6Ua12PFezZsLLxUV6DUb+i1yBFPTyWMHcO/9t6MmWttv2LfPiuAuV3T9cHZZEis7JA+a0nIjnN1rCX1ZPZh60Avuxk5pVNiuYB3GV+xfgLGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(31686004)(107886003)(36756003)(6666004)(38100700002)(8936002)(82960400001)(5660300002)(478600001)(2906002)(86362001)(31696002)(2616005)(186003)(26005)(6512007)(6506007)(53546011)(6486002)(966005)(8676002)(66476007)(66556008)(66946007)(4326008)(316002)(54906003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmlndzg0U0VPbzhib0dMUlM1Vi9JN2FEcWo0SUowVXUreEN4VlhSc0NxbGVh?=
 =?utf-8?B?U3RZK1pqaU5sQVI5Y3I2L21Fbk00MVpOVXN1ZzZ4QWlBME1paHVnQWdCRXFh?=
 =?utf-8?B?T2hUeGIyUXBDcDdRbGRJQTRzMDFSRFN6d09LTlM4N3VJcmFodGJRSUM3RWxJ?=
 =?utf-8?B?MDVaUGlIbkxGTkNwdHU1RW1sSUR5YXVRT2NqVUNuUG0wZ1N1aUVtN0h0WVRC?=
 =?utf-8?B?K0h6ZDU2ZXlOSWpSejZzS2dtcDVuZDBpekwyTjdQdnpSQ09MZjN4ZzJ3c0dC?=
 =?utf-8?B?T0NPazZ1ekJvSTE2UHBwMVVWajlwdC8yMUVZR1V2Rk51WFZNSHM3UmZsMmMx?=
 =?utf-8?B?ZFMzc3lKOGd5YkdIQjBLdjRoanNnRzNwL0ZWVHB0Z1hCQld6MzBaSmJOczhw?=
 =?utf-8?B?WE1rSW8xQkRnRXhDTUdKMWxqUnRwUVhzWHBpdWp3T042cWtsSXhRejZoZHNk?=
 =?utf-8?B?ZE1WZHFDRUJ2S2dEbXZNUFJybkV3dDVyQ1VENjB6dHVFa0NzK0lxY2duR1Bm?=
 =?utf-8?B?QmVFU2tSc2ZsNENHUHZ0V2NPZkJuODVrM3A4ZVArUjRscTBueDBzMFVpdStr?=
 =?utf-8?B?MVcxd0V0RGtKd0NCSDgwNE1WUzdSQnRiUXkvbEtkaHRQZmhac3hIbXc3UHd6?=
 =?utf-8?B?VTNvb05PVVo4WFZBYjFQZDNuZzJTaEhPUzFPaXkzNDJ4NGwwaUpNdE56azBw?=
 =?utf-8?B?OGFzUk5VTUNXMFpSWnNUbEdldDZvRlVhOXAxVjJnbk52Y1NKUFZHdllwa3Fq?=
 =?utf-8?B?Wmh6TTlBcHFWZXF5YkFFSThydXcyeG9YeU9SVHNTSXN4Yktvcm0vL3R4YVBL?=
 =?utf-8?B?MEwyVGJpTlNlSndZQkwzQVJzQUZIb2ZYSjZMWkRQQ2w2MlZyWjJzS21yQjRO?=
 =?utf-8?B?ekRORDlTbWZnQW9WYm5CdjNwYVc4Q3E3ZGRNMzVXSVdHcDBmTlFXQlBxNEkw?=
 =?utf-8?B?NWllL3RPL0N5RTBtVVFIVDV6ZG54V2c0SmVDNWVPbENTOXRkL0RJWE51VTR6?=
 =?utf-8?B?MU5zNHlUcTV1WjBHK3BIRG12WmFFZGxLVW95eEl5aWtOdWRseGltZE0rb3hk?=
 =?utf-8?B?eVRqWTUwTWpsMkdlSlhJYit0QVlKV1k5UVpnRnU5bHl0NzdzbVkrbTZtT3hz?=
 =?utf-8?B?bm9mMERmWjJpcjRNV0tZT1M1LzQ2QlBkQVlpN0s5QzRJS2tNZlp0YkwxaFJ4?=
 =?utf-8?B?SEVsSElmY3MxM3pidmM1RDFtNGN4KzJaaDJCTmxyUFpVT05VTTFkdStsd0RV?=
 =?utf-8?B?Szkrd2Y3Y1JjTHJ5MXgvMzd1S001dysrUHpocTljeVYyWnBhYS9vNWxrQjJn?=
 =?utf-8?B?S2tURklnUTNIcjI1Z3Z5aWZqU2hoeFkvWlplZXVnMVgvbDB6dVNLcXlzUlRC?=
 =?utf-8?B?cnlJMy8rZG1ySTExS3FwdUlQck9rbXhueUYyVTkzaUZGc3dCM296NitxMnBs?=
 =?utf-8?B?OS85WUUvTVFORVc5YnRJRnY1RTZ2Qkk3ck82WXUrY1pHUDdJNE9Mc2hIVnA0?=
 =?utf-8?B?aVlkM2poS1hGaDZUVWNjaXhjRVFXSnl2TVdwb0gyNENXTXZUZ2hrUUUwTkNU?=
 =?utf-8?B?b3V4dkRGaUthWXlLb0hKaXhBM0h6ZWxpck1DWU13S0p3QjlYeC9UUEN3L3Jv?=
 =?utf-8?B?YmFPSUxSSVpYZERkaGZJRVVNMlBYYnYycUJpQ2hncjRDM1F0dEFNZktOSWJr?=
 =?utf-8?B?RytMN0F6dUk3N0c3UlBGYUVNbFZ3OFplTEt2NnExV09iYk9XdUZtNDZFcG5B?=
 =?utf-8?B?T243ZytCMlo3RUJGNDJXVTVTc2d2UlVpc2YwYVAvdHRhaSt6VEJlbTFvUFlJ?=
 =?utf-8?B?MzcrWGEzQ0VJK1ZmRlBoMml2WDl2VStjc1duV2gybytDVFhpbHNSNVJTQk1Q?=
 =?utf-8?B?Z25WK0Y4YU5WQnd2eFhyYjhObzEzMDVEMmMrbGJvdnF1bEdZeWJWemU5N0Fi?=
 =?utf-8?B?Q1V0aGlvdVFBUWUzQVhvcmMyWVRhc3JVU0lsaGEzK1VRMWQ1andZRzRQMkUz?=
 =?utf-8?B?TkdmNVl4UHBzK3pCTVI3WjkwUGJ1cDFYVEcvWnZRL0VFbFpCeUFNSEdCYWMr?=
 =?utf-8?B?a082N0tjSzlMOXNod3d4bEIxZGNHTVhHU3IwQXFYZmU2U3Y3U29tcU9waDJK?=
 =?utf-8?B?RW5xMXpudWh4cFo0Z01rWVg0QXkxb0dtYllrWkxuTnhodU5Ub0ZtVlI3Ui9o?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a+sBCDhQYBV0YvWBmW+Fg7IW/XZkZpHiN5Xfwoazj9w8W8ANaVypZS42/R9aDd4o9NkGx19pVdhiwsnCi8OfuJkdlMDPjoGr1x1eP5IKk7av4Osjo7gPkGWoMDbQ/xaxhBViaG738NU6I+VE+AqgEU2oPUCLt4/TXFByUOrKvrNBzxyMfxxIWh6nw3wr98coPX1TAyAFYzGJU27UD7dUIVechZaaEkcy410gQjqnQZbv6UXPvsNLXXwGMWTci+o1JApD25bf9dnGv37qs4gya8Ho86pYg/qW7ttUFV4NPBJJCqmUAasBH7CMXD5AHoylQl8UGb5I3F11m5gUdM6eu4ez95v7g6UcKPcXPh+zA0TVjAMDK98+8ipOkmmBMurmUz1RCdYjpFm7cTLTz2lnnEA3ppY7NCS83LVXF4WjAsJsfG/7p5IRRnhLerUlb9Z3eSLdf+P1Rx1uZ1bdXIt7O3MSsZMQB2iRHAjbtdJUsD+bGcIJo1F622PRgzzaK1Th0Ef+Rwl5lv33ZYWsImGSFShynEei+a3NuwCJbGoAIsGBXFDij6V2kiq9M+SDWMMkE0jmj71yLy06IUK2K8qutH3hOL2a2lLOrGja+7icPXyu4GKuQWO8glhx/Mg4XH9yz964R+A3UvhQVCqVw7IpEbzbsmitrAJP0QS5KKI2hQQ/gIQrYbye3bfH+yw8tXQ9jtYyDX6PfXg0ZO3FhfQBlurcn0u8htozW4EclD2KqqQngDbZDPYzDaeOAtp7hAaXFZspLFNeLv/K1KnZQHHTEsbJ0ZY/EWi7zu2uOazquZEsAHAmM/gOu18+hf//X49q0KxBXVRt4zToCG/kUoxTgslzmN8DrqjOQVDmqMEn9sk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7d89e8-5358-4843-71a0-08db1be0be5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 12:13:48.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1/Kya4Koi1vYNltTcG+uOKGBSg7YLHgD60HQ92H1GfdxON4mOVHOybKwGzUe/n+gNWCUjQHl6Hv+LNIVxC+lV5ACxJwtd12v9p7rl9+awk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6173

On 03/03/2023 12:09 pm, Michal Orzel wrote:
>
> On 03/03/2023 12:59, Andrew Cooper wrote:
>>
>> On 01/03/2023 9:06 am, Michal Orzel wrote:
>>> Add missing aliases for:
>>>  - debian:unstable-cppcheck
>>>  - debian:unstable-arm64v8-arm32-gcc
>>>  - ubuntu:bionic
>>>
>>> Remove aliases for no longer used containers:
>>>  - centos:7.2
>>>  - debian:unstable-arm32-gcc
>>>
>>> Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Open questions related to the CI cleanup (@Andrew, @Anthony):
>>>  - Why do we keep suse:sles11sp4 dockerfile?
>>>  - Why do we keep jessie dockefiles?
>> Because we don't yet have a process for retirement of such things.
>>
>> Right now, all branches other than staging are using the jessie
>> containers.  While it's still in use on any branch, we need some way to
>> rebuild the container (potentially with modifications - see the recent
>> HTTPS fun), and standard practice is "patches into staging".
>>
>> An alternative could be to patch into the most recent staging branch
>> containing the dockerfile.
>>
>>
>> sles11sp4 is more complicated.  We specifically tried to get a SLES
>> container working, but it was always in a weird state (only @suse people
>> could rebuild the container).  We did eventually replace it with
>> OpenSUSE containers, but I can't currently locate any evidence in the
>> gitlab yml that we wired sles11sp4 up.   Which is confusing because I
>> swear we did have it running at some point in the past...
> Ok, thanks for answering. Stefano wanted me to remove these unused dockefiles.
> Are you ok with that or only to remove sles for now?

So https://gitlab.com/xen-project/xen/-/pipelines/791687536 is the
latest pipeline on Xen 4.14  (yeah, that's a concerning amount of
red...) but I don't see any SLES runs and I do see the OpenSUSE runs.

So I think we can safely drop the sles dockerfile, and drop the tags.

But I'd like to keep jessie around until we have figured out what our
deprecation process is.

~Andrew

