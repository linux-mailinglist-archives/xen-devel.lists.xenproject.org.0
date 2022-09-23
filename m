Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FC5E78E2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 12:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410718.653854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgMl-0000Ah-LM; Fri, 23 Sep 2022 10:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410718.653854; Fri, 23 Sep 2022 10:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgMl-00008b-IH; Fri, 23 Sep 2022 10:57:07 +0000
Received: by outflank-mailman (input) for mailman id 410718;
 Fri, 23 Sep 2022 10:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IiHW=Z2=citrix.com=prvs=258ce0bc8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1obgMk-00008V-8U
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 10:57:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 713a8128-3b2e-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 12:56:59 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Sep 2022 06:57:00 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6865.namprd03.prod.outlook.com (2603:10b6:303:1b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Fri, 23 Sep
 2022 10:56:58 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.022; Fri, 23 Sep 2022
 10:56:58 +0000
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
X-Inumbo-ID: 713a8128-3b2e-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663930623;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=azB7uA7BlYQBKFYyY0T4fUkuZL+s1HPnWMTwc7kcd+c=;
  b=cAENZIQMYNSdh60kfp2OhDaTUN8T9JaUP/fl2UZ4Cu10UYISb12+In5P
   8rCYZ62p2gHU7Dk8ZKl9z1Iufj//xKhtp0F7oalZngrgO2G2nVMPJYalw
   dPR5JXHJKNu8ghgyW9co/Sb6DHdig2FLCen7TWTWI7jWsBHOy6noubMx6
   k=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 81630643
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:h48JaKxnjH4TJCdi79R6t+f2xyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 GsaUTiDMqmCYTagKtx+Oo7g8R4C6MfVm9AyGVNtrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Uk05K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1MKlEWErQo+NwnOnBKr
 NsoKh8GazKq0rfeLLKTEoGAh+wFBeyyZsY6hSslyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCehNWEFwL6WjfNfD2z71gt+3aKrKNPIUteLWd9UjgCTo
 WeuE2HRUkhEb4TBlWHtHnSEgs2RtiL/Wq0oKqzkxs9G3F694GgsB0hDPbe8ibzj4qKkYPpPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwAOQzOzS6gWQBGkBRxZAbsArsIk9QjlC/
 lyEgdLvQyBuubu9SHSB+7PSpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnNL
 yuiqSE/g/AWkpQN3qDip1Tf2Wrw+97OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lR9lFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:Fc6o6qzEH5O4Vk+VTtd9KrPxyuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4fSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHftLqUwLzM2dKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+c/DqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0GnQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloAS+0koJjHfw//Zv4EvoxKhNN6Ws2N
 60TZiA7Is+KPP+TZgNcdvpEvHHflDlcFbrDF+4B2jBOeUuB0/twqSHkIndotvaMKA18A==
X-IronPort-AV: E=Sophos;i="5.93,339,1654574400"; 
   d="scan'208";a="81630643"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vkm30OQAaYK7L9W8ahCWPTC0gbc03Yz/ccPvoo8lwYGeT4Din71CQ49NZtYljuTDw6HjGhd+QDYZcSGStiRJXaSl3Pcn93jduYbswxruanZIU1VxdJCHz5Wmxf73Mn5Ls5CAXQys+LrVSGitwBMYrDUI9L61cJes3rkxNwmInXCt63lhFszyOeIylD4of/Fu9ST/Ui8HckXKmK+eVTyqrRSYU8yghhu5bkOxTswbGmam6hEYLPHcD+1eIrGnpawidkuasPKL23uKDwlZ9xtxve3aTFcwNZCMuZWy320NDCcthUSManpa0YeszKXzVceLWiCmaqeIEwzfWlkQESjh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fAJBf7y+p80xGCoM1HkmotHKEEUd2bdFx1zNnIlwxM=;
 b=SYs270M6XGeOMAjHhYcwg6w2eXPZRgiPxHDu/L2xzMu737Wfqbsh10y+MUmSMcjK0ypjTkiFqZQ4t2ux/tXzLhdokVDqmhfFiyf82GdUPySyye+a8l5bt9Yrd+3GsheWkLhmi2A0UItKy2kFjzNw5duuWCGZfJGyCCisnlBxB8TVl2seBDjuq0iGmB3S8K0P3dI7K/SEqkYJSQ4OU6p8nXiXNgl1jq1ZfFVh3PBwtoFeeNJW1fEBDbDCgBGbz4ZLwxIXh/RCx40l2bmoaNTnwi/SdpDQbgFL+o2Ev3J+NydhHnUbE1DJiA2KJkAEV/f6NVatQe1UcKDSesmi6n+m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fAJBf7y+p80xGCoM1HkmotHKEEUd2bdFx1zNnIlwxM=;
 b=GfZgpFdFpUMP+BgEw0JbRFpfyBxOq1pp78/Yc6AmQAljScT6mcd3lR+uIiXGz8cXD3CRc4EDm6RbAHHCwWBE8IQGDa8OIQ85+fvpOg+A0/tNHoPFUmRYulwxuZqBbBd7/uqWNuBR34/juZmLMAdY4Qm35vISaXk9UQynpxbQJKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ept: simplify detection of special pages for EMT calculation
Date: Fri, 23 Sep 2022 12:56:48 +0200
Message-Id: <20220923105648.12587-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0415.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a2deee-5dc9-4e73-7eb9-08da9d525597
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ws9umJc1OZa0fUUw1dh0oHSp4ZOY3G9R+dMtiF6ZhF0tWyFwCHvmiBRqOZLxTv6+izFBkHY5lMZr63qt3jaIV2urgmSXCmJvq52Cu5KtFYqVobF8C9JQI0UR3CP83xD1aoIKpRFWBohIVpSRALmNd6vsRVWKp3CCbf3SNWKHkS3BfVGeaPfPKjAr89aZ8w8jhP7JV+znclOJAUq2L32eYQJWxNx+42C1tXqHNSm78e1P+Sxjo+nwz+JTgis6st/uEQiSI7YUZE2GmRO+eJys5pM9/MIbrDsdJRROc6OfFZySyXlQ4XGg+JOwyZkj/qplWPw7b1QSsPujOwuJ8z21FcOAShA5lLHaM+5VOptgmuB5M1qZeqxv2FhcYMetg+E764bQmxLLgcrs6MJ9VYqEhMCixenMej/sqxWWvzquPXbXRQhKvzm3KNP8W98WUBg57ViKS+7FhTS0UOlBCEYwIopB7spXZS7munSu7yXnw4ye9wJWxZPrX7JmO6hLtxxkgE05SvhofO40Hswsh6bAu3YEoJmbm5AaIAdzzpUeB9wgo5xMFz45McyI9DT1avvYiFfXv6UzjMoQV/eP1uK5wnMEUyxREKHnzXybO8pmEdhuqH3Z+x5yzLijeIMYDvt5oEFyNGTqmIbzx+DjMmcDE83IUdTgbaxAr+g7MKWgh2XcpZISqi+Yz9gm1KGa18g07zKgm43QvcAycIxVEihiIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(66476007)(5660300002)(83380400001)(82960400001)(6666004)(54906003)(66946007)(86362001)(6916009)(316002)(478600001)(4326008)(6512007)(1076003)(6506007)(26005)(186003)(66556008)(2616005)(6486002)(8676002)(36756003)(2906002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFVXUUhFSW05OGNKRTlqcVg1Zll3UGRvL1Vzb1lLQ1pSTkh2MnNvTktuYmJ2?=
 =?utf-8?B?ZVBENk16L1lJSFZ0TXArQ1FVblBiWTZPanJVRVpyR2x0WHN3VVNEYmV2S2F2?=
 =?utf-8?B?ZGpXY2pJZVVGbW9SMGhqNUFjUjNaSzlCUVlCR0lHVVo5L2M1a2xva2J4ZFBm?=
 =?utf-8?B?d0xqbmVhZnJuVCtlVjZCS2gzT1V0VktSOUpCL25SaDZVUGZjVzhLeHp6bG1z?=
 =?utf-8?B?SklYUHUvck1zUk1vazQ0eHNwdmZWVDJTWE9kVVhGNzU1aHAxcHdYRTFEWG1x?=
 =?utf-8?B?T1NmRE5iei9YMDdXa284R3NIVHdVQjJoN2pSWWR5VmptdFJNMkdsWkdpa2Qz?=
 =?utf-8?B?REpTZkFFRzRiaVlnS0tSVndPZkFjRVNpYXhoVVAwS0RMSHdoWWVSa2FvZHYy?=
 =?utf-8?B?a1dBZGVsWFpjak9xL3hwcnE4bERRczlyci9ReTM0dDk4cnZCTnFqQUNIZ0gy?=
 =?utf-8?B?bE1VSDVoN2ZMbWtWRXVyRG5vMEdpTTlHNUFKaVhVejBtSVROelltUjZkaDBH?=
 =?utf-8?B?T2p6YlpCQWVLeUFQcGc4dFBac042V0IwalJreVRuUTFGMkxlbUk1OER2Qjdq?=
 =?utf-8?B?aWhCY1d3UmI0T3hQSUR3bG5uQ0dwMUZjWm5zU284SHhQVlRMQjBLQlpraW9X?=
 =?utf-8?B?K3loV1MrVkZSUmhxdWdVdVNrWTd6ZzNNV3hUay8yY2x2OVlCT1JvZ2o5aElI?=
 =?utf-8?B?b0dycjBUWVd2NUlLMnBFdGgwZW5laDArZzNOb0M1WHJ5NmlMekdJZGQ2NTBJ?=
 =?utf-8?B?dmFHcjJIRFlhbUZyZnpqNjJrMVFlZHdMTDFjYmJYV2g4WFlDUXl2b2FVSXUy?=
 =?utf-8?B?NjdUTDQxVm43Ry9LVHMvOXkrdFBFNzAxcE85Tk1KSTFqa2wxYXEwNlcrbElH?=
 =?utf-8?B?bFZJL1R1bXZnbHRFbzRQa2Z5cG9wNXRYbDdlNG9QcHNqK2N2L1YwYlp3MS9v?=
 =?utf-8?B?aHNOZm0wam1rSWtRRG9lSDBYNEhCNGo0dXdOZW11MUk2RjNxVm0xVHdWaWZr?=
 =?utf-8?B?NWpVeXhHVzR1V21JOGxVQzJwWitMSi9FeVBlN3pxS2k3TUFWRkZpaWJEV3Z6?=
 =?utf-8?B?Z3BlNG5aMGJHcUFVNkhVSFRlVXhmb05PeVpJWHpZemZqeTA5RmxmWEQ3OTNi?=
 =?utf-8?B?bVVqejdKZkRYcGVMQlZqdVRReTZkSHY0TUpUYjhYSGFGTEpVeFlwZ2hJa01l?=
 =?utf-8?B?Y0lMUkpWY1o2ajZLR2hBUkVRM0cycnRNR0JwbnlQaTE3STZPYUJHYUhmMXZ5?=
 =?utf-8?B?NXdLU3BsMDMwNjdlTm8vOU9qM0hIamI0SW02U3hIZTgxL0RXb0xXMnIyYzZX?=
 =?utf-8?B?SERKekVxVjNZMzY2enJLdFVtaXBONDgxYjZrSDdlS24xbldTS0VaOUFyNUla?=
 =?utf-8?B?RVNyREhYWEJ0NGlzN1U4aEdmVjBFaU15RnFxd0I1aEdBYmV5bzFYaWo5Nkwv?=
 =?utf-8?B?VnEwQjJ5T1JJY3ZTWHdlWFU2dGhGaG5VbVlKbERCOUpsN1FGbm0vTGN5Wmcz?=
 =?utf-8?B?Qngxa2s0bXdkL1Z0eFpuWkY1VllOTkFZZXQzOEdJK3FqMm5XUzRaQ3MrZWdi?=
 =?utf-8?B?YXdiYVhGdWpCRGlTQktTek8rVHlHc0g3T3NqK3ZuK2RpREc5WjhadFBkWFVh?=
 =?utf-8?B?a0FnNVJ0WWpadmtRNjZyNWFZcEFBaElPMUgzQnMwTTdHZ3BiQVg3RUZ4TFVI?=
 =?utf-8?B?THpLdFhXVVd6TEJmRjRZYUd6OHVWKzZ2MTVDdTNJbStmRys0NHJDY2xZTzNZ?=
 =?utf-8?B?NGZhODg4S0FQOUhXdGFjSDVURHdxQlZ6TUZ0SGFQSjhHRVZVMitTM2lDN3VF?=
 =?utf-8?B?UG44Y3ZnVkIzOVJkMW5xOWNVbkY5L0tNNHc4MWtjVDNKbjQ5WTdjQ0NVc2g2?=
 =?utf-8?B?ellDY1FWbHUxcXMwS2c4YTJEYXBacElKVTJHc2FOSVZwUGVGd0FZZDdXNlRF?=
 =?utf-8?B?blRiZVJ2WkFPbThDeWhCWkJ0R1c1ZUlTNW4yRFNtd3ZMMk9wUGtOZzNJRUtx?=
 =?utf-8?B?allRVWMwcTNlNE1tQWUzSVRMd2VpaXU2VGtMWDZkcTR2TnFuMFhLeWs0R25N?=
 =?utf-8?B?TEZWNmV4clJCajF5TDZ2OUZqNWZRZVUwZmg2cko1a04yT0pScUdLT2JCeG9j?=
 =?utf-8?B?d2JERlJuVzBwYUZVVTZKaG1oc25iajE0VFJDdWtYS3VXMEp4eUhjUDM5ZkZV?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a2deee-5dc9-4e73-7eb9-08da9d525597
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 10:56:58.0206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taNVh6fxlDsDqBiWNY7Y+6KsIuorocAY8/eC5HtgbfLsrWE4S8zkM26uZ0JGaA77wOaez9HZQ9L8J/OBTCivmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6865

The current way to detect whether a page handled to
epte_get_entry_emt() is special and needs a forced write-back cache
attribute involves iterating over all the smaller 4K pages for
superpages.

Such loop consumes a high amount of CPU time for 1GiB pages (order
18): on a Xeon® Silver 4216 (Cascade Lake) at 2GHz this takes an
average amount of time of 1.5ms.  Note that this figure just accounts
for the is_special_page() loop, and not the whole code of
epte_get_entry_emt().  Also the resolve_misconfig() operation that
calls into epte_get_entry_emt() is done while holding the p2m lock in
write (exclusive) mode, which blocks concurrent EPT_MISCONFIG faults
and prevents most guest hypercalls for progressing due to the need to
take the p2m lock in read mode to access any guest provided hypercall
buffers.

Simplify the checking in epte_get_entry_emt() and remove the loop,
assuming that there won't be superpages being only partially special.

So far we have no special superpages added to the guest p2m, and in
any case the forcing of the write-back cache attribute is a courtesy
to the guest to avoid such ranges being accessed as uncached when not
really needed.  It's not acceptable for such assistance to tax the
system so badly.

Fixes: 60d1adfa18 ('x86/ept: fix shattering of special pages')
Fixes: ca24b2ffdb ('x86/hvm: set 'ipat' in EPT for special pages')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/p2m-ept.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b4919bad51..d0e1c31612 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -491,7 +491,6 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
 {
     int gmtrr_mtype, hmtrr_mtype;
     struct vcpu *v = current;
-    unsigned long i, special_pgs;
 
     *ipat = false;
 
@@ -518,26 +517,19 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return MTRR_TYPE_UNCACHABLE;
     }
 
-    if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
-         !cache_flush_permitted(d) )
+    if ( (type != p2m_mmio_direct && !is_iommu_enabled(d) &&
+          !cache_flush_permitted(d)) ||
+         /*
+          * Assume the whole page to be special if the first 4K chunk is:
+          * iterating over all possible 4K sub-pages for higher order pages is
+          * too expensive.
+          */
+         is_special_page(mfn_to_page(mfn)) )
     {
         *ipat = true;
         return MTRR_TYPE_WRBACK;
     }
 
-    for ( special_pgs = i = 0; i < (1ul << order); i++ )
-        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
-            special_pgs++;
-
-    if ( special_pgs )
-    {
-        if ( special_pgs != (1ul << order) )
-            return -1;
-
-        *ipat = true;
-        return MTRR_TYPE_WRBACK;
-    }
-
     switch ( type )
     {
     case p2m_mmio_direct:
-- 
2.37.3


