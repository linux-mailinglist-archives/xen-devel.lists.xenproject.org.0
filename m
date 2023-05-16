Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21745704E77
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 14:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535186.832826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuGx-0005B5-1J; Tue, 16 May 2023 12:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535186.832826; Tue, 16 May 2023 12:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuGw-00058K-Uh; Tue, 16 May 2023 12:59:22 +0000
Received: by outflank-mailman (input) for mailman id 535186;
 Tue, 16 May 2023 12:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyuGu-00058A-MD
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 12:59:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 768e2576-f3e9-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 14:59:17 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 08:59:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6053.namprd03.prod.outlook.com (2603:10b6:208:309::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 12:59:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 12:59:13 +0000
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
X-Inumbo-ID: 768e2576-f3e9-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684241957;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LulrSaczLJNPUqHUzIPQWjuKyFXbTUuOGlusYHUZ4UA=;
  b=XRTEpw8khjLb6uoV0B6r1JLDX/t7rv4FZQ67TTExMesvvGzr27GJAhLF
   ec+RVCuinI3O0Nk/2WxuQyrlNMnSZCktWwFz2x7YL6GZicHkR+YBzHcgi
   2mfIrtvKiKex8+bezc5b0zbHbEH5+FRyUdGUGnTgWbeoxJLNi2WT2GCMx
   Y=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 111670360
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W/GVDK22p0Aq9FqMU/bD5f5wkn2cJEfYwER7XKvMYLTBsI5bpzECm
 mAfDGqPa/qPMDDyLthwaYi2pxhQsZeAzNFkTQdkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFnO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfX2QU2
 98gCHMxRQ2loeCVzriXbrN1v5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KklwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAdxNTObmrpaGhnWWwCsyED89U2eRpLq8pGrvfokcG
 XY9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A6d+zpog210jLVow6Tv7zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:afbS/68G6MF0cJ5TNm5uk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3ARU+NVmiJQx++dgDizJCmwtE/2TJuLHiH4lToAwy?=
 =?us-ascii?q?EIntPbr+2R1W83Pl9qp87?=
X-Talos-MUID: 9a23:hYkwdgYlh3GL8+BTsjmrpSlAH8FUyaHtDW4pwLBd+Pu+HHkl
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111670360"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt7E1E4haJOBKvUBVGURg0pn0Jn1d381FvDd/xkLbLiy7AxM2o6M3LKgKuR4xA5T9QSPeCyyxbb3rqFJvNN1XiOAC6oblRbuLQheq2HQo/mpWjMmigLBumDyDWd7CEeFHVe1PaXkWyr2yDjVGWy3E2YIBkjN7GdIrvU51e4NXKAn7nUJdPFQM23F2g2jkOeDEm1b3lp721lgXz8BJFmBYZx8Mvrk1cuLKSX0hVmILNVbSEkF9mFtVfWaPwgIw/l1hX21ggYXH0AdUQF8j11RSvsiHot46jJnJNCC3wn16ruj74Ybi4Xe2J5013W6g6o9gl36exEztQEhmIEL5mUpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yymk88xLfET+N1rPKyG5v1fh9t/6tHL6bBLVffnZmGw=;
 b=Yn1j1BVYTxwtOz9KWQZ5/2sCLe3CTB1rU3a6wZGDPu36C83PTmMrcWu4vNjci/n3TxzPztI2Phw4bVtjNxX1nuQ26e7vTTIZIZD3c+fmYfVppBDho0zqyxRsZh7fds2nwqz78LzY3fdHJvUxy11SE2LmK0DKBiYA7SQX8OM1sKVwqtBoC6IDkIjdcETmiqablVHXVy6ErfORttoJtU/Pk5gIaDhWTYHC1GCElEZLBCS+UdxnrrkscaQ3o0NeRD/4bdWX5MV4UNUGk+OLSpg2rY7OORV4i9iRfAoU6HyOuiYGWhP75eSAKzGchqMS0D6wdcBhk7Xeqta2O5lIsGRB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yymk88xLfET+N1rPKyG5v1fh9t/6tHL6bBLVffnZmGw=;
 b=o/OW7EimGVrfb53F5JSwbxyFlxe+Cd4r3MeJEZUqfV2bYR0WRSKwYrMM1M7ISFJrkUro4xpmL3TdGiV2Y0zZQM/XcnRBXe8UAHC1A5BLHVzx8wkMkEPTXS6Y142De9NL1/IxLVDVNSb0bfdJn6+AdW5DUfyV43l4O0dHkPvksT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d3b7e5ce-3a6d-12b3-2ffe-c7b904274070@citrix.com>
Date: Tue, 16 May 2023 13:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] x86/boot: Record MSR_ARCH_CAPS for the Raw and Host
 CPU policy
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-6-andrew.cooper3@citrix.com>
 <f5f56c2b-f382-b007-3949-2bf4bd37b392@suse.com>
In-Reply-To: <f5f56c2b-f382-b007-3949-2bf4bd37b392@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a48bd0-e481-4ce3-d79c-08db560d58e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N7jaEki5lDISzKvjbeeyeuPaSduJCOEzWnz0EbwrKA0anoqlLJX/UBYBQ47ZOZ9EzNL9IecG0B3Mp+RRm1gp692wvxsXQBxN0JN2cNIsi6FPWNOJfmV88v+5hLdV6CX1vpnVRLt0L7td6iwHybO6JFT2k7zQV01+OtgzozdIfblgUxOpxHbmh51ukga51H1FgjKbwMAj22pXJXjB3OWvQCpSqMfRGEZv8R9lGgxeCiBuM4hKW38uI1QVLnPDPeiES/+UPdJWGtymRNS4vlRERc5jS0VMZT2h++UvpgqXTpwMUcF5max6WIg/dTDZSa+Mo4E+M2DSf5PkOyvD+k1+AXQJuSDUW2fU9ocCDwjRa/HGYsbr4XLwT6CBdNgxS37YubJqksK/6DVaahYOHiir6Cy4aKQS2BnyLKMhFl+JrChaWft0rArRW5jsmlyxWXPf8DKFG6qtM4b2aPhSLWGuM40d5YszAM5To6Zxh+i6bBYbWgcnEll+3B1xgIK4vue14Ic5jsCT3zlD0ORPUhc1YRUvoCXDFpUlNtXmsHypeoc/aHaxTN7KzLxQU+xpUOZwU9mAgCmkhMvBqLnJjvSUj8HxCU7S+m14npkYUKOTQ4d0RW64nk92PZVwLx/YQjYAgL2JZGaBR1Fp8+3t0Nj3QQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(83380400001)(478600001)(6486002)(6666004)(54906003)(2616005)(6506007)(6512007)(26005)(53546011)(186003)(2906002)(4326008)(36756003)(38100700002)(6916009)(82960400001)(66476007)(66946007)(41300700001)(66556008)(8936002)(316002)(86362001)(5660300002)(8676002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1PVWdkTWlpRDdNbXFzMEJTanBUY20wYTZSc3VBcUV4Zm1PMStMYVpiWTY3?=
 =?utf-8?B?Z1k3dGZrQXlvWUY2dzV4Q1BsSHF3VlBFVVV6Ylh4Z0JNWER2b2tRdUVWSnVQ?=
 =?utf-8?B?UHBYSWM5RkUzeUpsYU5reUI4enAwSFZ3SnlIUHRNRFovMWlqcEVnUktIRlhD?=
 =?utf-8?B?WHFvWlpBVisrZzhpOGJPZ3k3Q2hmVGFPa251TW5WcVNUNk1mbEJJTVZERlk3?=
 =?utf-8?B?RHlEc05lMHJ5bmdjNTY1T1BaQ0VSMDNzWS9VNHZnYlNCYThzWkpCOEdvVE5U?=
 =?utf-8?B?TDE5U0xTazMremhmTUxsdnZHSDkwaEhtTjh4Q3kyd3hjOHF6ZngwaFY2ZTl2?=
 =?utf-8?B?VHBteUpyc0N0NGE3QU9GYjJTNG5jaThnUnZaN1BUMlV0b3p4SWhuVDBoV2VU?=
 =?utf-8?B?clBuNlpZQXZYKzdhN0F4dE1NcjNRR01ndkhsUU9lK1RmVmo0UkRvdFVmVnli?=
 =?utf-8?B?QjdRNmVoUFJTL1dqaWVBNXVSb29iRVBINi9wclJwR2ZkS3ZZUDQxTFdTcklS?=
 =?utf-8?B?ZHlNa0QwaG5DVEdpR2NSU0E3SnExd092ckI5VnljY1FlN083NUxDUHYva0lX?=
 =?utf-8?B?VDZQZTBTR2FSeHpZaXg2YkE1OG1rcVFMSVFtSmI5ZEs1MGpsejBnVlR4TzVo?=
 =?utf-8?B?YXA2dWZjZW1IS0JidExzOUpjVUNSVGZKVlpxQTRmQ2tIOTQzNWk2K2hFWTEv?=
 =?utf-8?B?bitoMWNTM2czOFBkWkVDTlkveEtzTDJ0L1JtNk9VWEtwZUxwQndJNFZVK1NP?=
 =?utf-8?B?ejZVMC83NThHSEFrakVrbE1raW8rdWViNlhrNE4vZUxhWmF4djVDL2lxZUwx?=
 =?utf-8?B?c3R6NnNhU2wzNkloUzBKQit5MHlOL3FyMFdsOFNROGVqdFF4ZXFSTVY3V3Y5?=
 =?utf-8?B?RHpSeUpvNWRHQTZRMThYNE1xT3VGTXp0SkVxUTRBREU4Zno5UlBJYkxCK3c2?=
 =?utf-8?B?YVVOU3FlSjdTL1RZZnFDc2NwTVdTVkhNMnBmZjAxY1lFOU02U0V0d2ZYVnJ2?=
 =?utf-8?B?UVl2NmxSUjZnVWk2WnJ1TnBsdXFyZ2NicGozR2F4UmJTcDdFb3dzdVFMQTJN?=
 =?utf-8?B?T3ZVZDU0bmhwSThvYjdpK1h4bHRYMzM0MHl0T2orb3hzUklUTnpKOFFHQTUw?=
 =?utf-8?B?SGJmYi8vQUVNN05qcWhiczc3QTZ4c3JpVVB5WWxvVFNyV1FhaFNaSk5jaGZw?=
 =?utf-8?B?Vm12ZGtycXNBcmowT1M0Y0RackZsSWNEemZYbzhIUGlrQ0pYUjA1RURkaEhK?=
 =?utf-8?B?WndLUzB3TDFYZVFuZktZdEgvTlhMaThXeEFqVGRNUEc0azhjUEY4a0Jtd1lZ?=
 =?utf-8?B?dXE5aUUrLzd4VFlZQUE3TGJacnRjdGRiNzgvbU9ZU1RhVHFKYUZHbnh1RjRr?=
 =?utf-8?B?aFdiT05YejZCU3lMb0dVVzlXVXI1eSsrNFUxbGJmaHZoSFdkOE93UE1FQ3gw?=
 =?utf-8?B?WWgzT1dpaDM0cWhmS1A5d1dwdTdXMjgzMFlnbzgvWGZVdlNFY0lxZnZmZjR4?=
 =?utf-8?B?OVA1ald0Qnc2YWNPRUpWVzlwdkdGZU5NM3lNVlU2enVnbVhBV09MaXRJMlhl?=
 =?utf-8?B?ejlFZW0rTmFmOE9FV2w0Y3UxQnVyeE1qcldpMXh6TkJSV2pwblZzSlVORmox?=
 =?utf-8?B?aDV5TEhCNHRzQVZmVThXVjBRZ3pkdVYzM2FNbUdTamRwakxzTDZ1T2FZdGs1?=
 =?utf-8?B?N2tuYVBGQVB5dnZKMElRNHI0N3ZKZ1RSdGErZG9SS1RQaTNHeVdMVkZDM0lC?=
 =?utf-8?B?TUZ0ZklERG0rb2ZhYnhDUmk1RkNySUZjVjZFOVFrSmE4eTVnWnpoY1A5NTdM?=
 =?utf-8?B?a1NwdjZWVldOVUxobWhjNnk2WEw5cTkzbUE0YkVpeVd2WGx1UllSSDdrcGx0?=
 =?utf-8?B?ZE1BYU5wd0txM2p0RTlVSU53YnA4TmRKUTZ0SitvVSs4eHhkazNCZzZxcjhl?=
 =?utf-8?B?Y25aTXR0Z0tQclpYcnM5WTNzNCtSU1hDaC9JY0d0Zit5b2hFT0NjK1NhNVVB?=
 =?utf-8?B?MCtRUVNBOVA5eUwwMXY2MzhPL1lTTlRHOXZMY2VITDRSSTQ3bnJ1RkREclhB?=
 =?utf-8?B?eGpvMkZTYmdmcVV2cHNrczZyZktRU255SzBCYTFUNWo5M3cyL2tIcW81OW5x?=
 =?utf-8?B?ZkwwU01hc1ZHUTFiWWNHbmh1blk3VFpzRm9kYnJ2NjA3VFNwMUtUNHVCQnNQ?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x509ztbyeumEhzLH+Zftdd1q86OG7mo5EJN9I0tg3W7NNwidgTnLxvZtcrU3toJflszdLokg7cbScEBvaa+fLjeY94n2FiWkwPKAC5rKeevkiRux0IrzTWsdKY9lzilhZRWaFWT4QlhSnyXUiFUkz5dimPPmisusiFJLeQX/WMkVjIM3Up/g1+PH/krttvG9ndilBKBJZuanJIKzPdslgIa5t9yEGgIUIAAbn9ZwV5z5DGQrbqGEfU9O6zmAvkfb2SxfXHbtrBngp6YtJw1vNFiFcWnZUrDRkz8dzRhWFqvsKBgW8dwBQoAgDwo6MUH9aelfWnMD+2yeqFLIXqIEoKGiatYkUKWayfDkqtY31jbFT9s4DphUp0aa4PaXKVIflqJlGkBgp4+kDVJyCGM0p23OhkjRpqdfKQ2FG9azi0YySzkjFbBiEDtsbGPJX1y3VK6dBOAUn9JaXwkyu6bycj2QFwGTNpFhqCO8C2KX8ISlWtV8QPPj9Bt4Cshm8bFlQtt7tpHTrCqoN2MN1rJ4gueXRVOg4IDC1j5NN7o1bXumIPYNwD9yDmkyR+IrxKl3bwh5dNe5zSwml6Ob0qXohJq8gJ39lvU4ldtlZp6KaUy78VEpCcT1yh/mzR2D1bbfr0pQ968RkFafWll88QEQXurBxN/YTs1FmD30Te/OvTQNXMW6+5YgvYG0UWeVU98U5AnrOo1k3SrLI9c18kyvv6wohhKXWaonp5YATGX60Q6Ylvcgdo6Brk/0AvgHzHa/qRp08BQF8QS3qr1zimjzs6pLMfhDjS/a+UsgOCalEnwGpBQIwiHLAKwTEFS82b/dj1+P26aszW+ijN4tlNkjbQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a48bd0-e481-4ce3-d79c-08db560d58e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:59:13.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KRlkOd9nA1y4zaxDvvVecNq6qE2s5YtipQsM5U6oM1iWckK+LVs7LsuPKzraEyIU7XNeTilVtDC+JRHLegtk1Vkgzffr3zzNQjU5vkgre8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6053

On 16/05/2023 1:53 pm, Jan Beulich wrote:
> On 15.05.2023 16:42, Andrew Cooper wrote:
>> Extend x86_cpu_policy_fill_native() with a read of ARCH_CAPS based on the
>> CPUID information just read, which removes the need handling it specially in
>> calculate_raw_cpu_policy().
>>
>> Extend generic_identify() to read ARCH_CAPS into x86_capability[], which is
>> fed into the Host Policy.  This in turn means there's no need to special case
>> arch_caps in calculate_host_policy().
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I have a question though, which I think would be nice if the description
> had covered:
>
>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -226,7 +226,12 @@ void x86_cpu_policy_fill_native(struct cpu_policy *p)
>>      p->hv_limit = 0;
>>      p->hv2_limit = 0;
>>  
>> -    /* TODO MSRs */
>> +#ifdef __XEN__
>> +    /* TODO MSR_PLATFORM_INFO */
>> +
>> +    if ( p->feat.arch_caps )
>> +        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
>> +#endif
> What about non-Xen environments re-using this code? In particular the
> test harnesses would be nice if they didn't run with the two fields
> all blank at all times.

Right now, I don't have an answer.

In Linux in lockdown mode, there isn't even a way to access this info
userspace, because /proc/cpu/$/msr goes away.

It's only a unit test, and this doesn't break it.

~Andrew

