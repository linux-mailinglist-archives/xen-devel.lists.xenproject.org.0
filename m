Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61EB517FCB
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319256.539422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo02-0000wC-5o; Tue, 03 May 2022 08:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319256.539422; Tue, 03 May 2022 08:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo02-0000uI-2b; Tue, 03 May 2022 08:35:14 +0000
Received: by outflank-mailman (input) for mailman id 319256;
 Tue, 03 May 2022 08:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlo00-0000uC-DO
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:35:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f136ac82-cabb-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 10:35:11 +0200 (CEST)
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 04:35:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4179.namprd03.prod.outlook.com (2603:10b6:208:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 08:35:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:35:03 +0000
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
X-Inumbo-ID: f136ac82-cabb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651566911;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=25UJov5Cqw3/wwri3/lPpxqfRNDYAC/4d/Lv0XxgBfg=;
  b=ZRZhmMa0O0aRlpP0OLIpebY1Ns8SmkT6a9UY3VF6Udfk7ybbXgTI6UI8
   cyhr+PoIsgWw8ZyNzuBlcP+rQjbE688TXenSckvgmaglgp/NaDeEzQSk0
   651eVirGWrgj7ohMSyBrLUj8WNdXrmvwm0gLK34KMrBQ4nWl77XKEPiVg
   4=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 70447533
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LIxvYaLHB9g7xrJIFE+R8pQlxSXFcZb7ZxGr2PjKsXjdYENSgT0Om
 GceWDqBPvqPY2H2cop/Ptu2p04Eu5PVm95kGVBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Yz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Nxu67Dsdz0HB6fdpeUUTBlFTB9uE6ITrdcrIVDn2SCS52vvViO2ht9IVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMmFH/miCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iWjLGAD8zp5o4INyTaKlT16yIL0H4vRRIemZZ0El2yH8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHslj4RXcBBVdIz7g6lw7DRpQ2eAwAsRTlEbcEgtdMnAzkj0
 FaGksnBFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1c5dDm+N43lkiXEoolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:uOfNkqMf4fmPkMBcTyf155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmDtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTAyYt6gDncIcuDfr5mT/aiWKCIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7WQywPa1UXU85NK8eGRvOdrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30mUdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjxUC3abFuJ4O5kLZvsn+8SPw7bWPHAcEcYa
 JT5fjnlbprmQjwVQGYgoFtqObcLUjbUC32AXTqgfblrAS+rEoJs3fw+/Zv4EvojKhNLaWsx9
 60R5iAx4s+OvP/U8pGdZY8aPryLFDxajTxF0/XCWjbNcg8SgLwQtjMkf0I2N0=
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70447533"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5AT45Y4Xrp+uFyV9z3ycycOsZPUZIdXmZCv7KJ+yEeY8sr+XVpWQPKMoJZg48o7/qxfsjxzOG3VHf5vj0rLuTaeg+dTrjTmYm3274pFqi/1oBNTGSNBTQoL3ONEAM/vRIi/aIibe84EJldUnVls+xpdn8NANAzgkpDOzgbKATG7GfCyJm6osEbHB6NvK1f/IXNtlhb4pCXy1FP6GtaxPQNCEOUK0Qk0oBqMv/s1ehWCm+C3f5A6wVIuCAGo35kozAy8GIvF6jbIBQU63nNvaLl0SA2nGdRJd+dLFKbn31Ur6dIwMMGv+M6slER75lDAHGncwSRMQy4EMGsJHSrfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3qHloybC+YWjO8T943bJ2MyrTbnzE0pNcV0UG+PM68=;
 b=T4MJV43XM34Uw96xDRGF6akeABjd40ye5UptfBClA9ui0GfwvKmzRZ0Nbx0sOJR3e2j8W4CYGFNScigkwNyRqUbCuE2s6rIi1Kl6O4Y9RR8jeElm1kTwZ/cIZlrcsJsFx0y51u0S/fjfZbZJVuVRmkZmCuUC+hgOiY6FWZEsHjZMgSXgTAj2us80frYRLrQB1vJeBumjgPsvpOnzROqLtKFmf0f8Y1ciFs67KR5lVcZHLaUdC9L8XjyEHvQi3GI8CcSc6fbLHiJq8G/8ksbeJaPERFXm75/8zjf1nCoVEsZtbcvNXob0FshsJI/0tAIasUhCfxseDJ/p9p6WuvWFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3qHloybC+YWjO8T943bJ2MyrTbnzE0pNcV0UG+PM68=;
 b=KOdyw2gcc0T265p+NTxp0MDyTESUcJ7d76Dq8m5GEQrUZqDc0psIM7DFvVItRI56NzzpnqGMCE+PJnh7wxA0TihNGhy+MkfLv0Bo/LYbLCf8fRUbUAQhvlbEO7Wz51DIxcJIIOv36eqy64/xxNL9Y0gTt+BXRdgkvgbri/pA2Uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v5 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Date: Tue,  3 May 2022 10:26:47 +0200
Message-Id: <20220503082650.23049-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:c0::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 119daf42-147a-40e5-d15c-08da2cdfd183
X-MS-TrafficTypeDiagnostic: BL0PR03MB4179:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB4179A4EF3E9E16C488BDCA038FC09@BL0PR03MB4179.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8JT7fuc4lO3+E52Xi68WbGyzXEJAJJAJxBTHHYdvx+D9xQATX7B4lJLHEqHSKHSwyMV36z7TsBZWd6nbpJ8DxZbyrJsEA9NNyk+V4lupJ/xCOHuOJDHrnRf3GrV/KF/6mtmLJDds73PztTTSAF8B96LhhJrte8ukiF5VgnMFf4TKvbXg93NlZCHsnUuXNdq8Qp3sCDQoS8WyZen1Cx0I5rDemqsno1QZDl3gRg/leKf0GE+mASIq+8ujsqNUSWJnltdpW4Pu5aZYEQtWXEVgmUbJpnXZqtHy++U6nGAD03HxYNey23m/CW2jJM25DzbnSszLKM9z4SQJGR4Xbr6ajPQY97f0KNKExYDoky55o88AX2DdUUWXiTFkMcwAXFSsYmPdK0m+qY1w1FZjCLAHZ/RSDnt9aPPK6wqLaLbeNdxlmkw+NsqZRiaf/F79io93fEzH8Am9MVtkb6/QVi/uCeThpprk/Sj8YFG1x3XI0UoOoKpXPnV0aUUrgX9+Y6Qpc8s8Uc5VRkHKMZX2hh/rHD2Cv0MRIa5ML3+/yNgZgw7Cu87Bwd5cb7QRnLVNeJUTeT1GMT9ZbiHLyBEIZx6dw2hb/sdQVp07AeUaONWt5n2nTSxqc1jm7fX/x5anrBSS2gCpNTdt60iv8Lvo50r17w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6512007)(26005)(6506007)(2616005)(6916009)(54906003)(5660300002)(8936002)(83380400001)(186003)(2906002)(1076003)(66556008)(66476007)(86362001)(4326008)(36756003)(66946007)(8676002)(38100700002)(6486002)(508600001)(82960400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0M0L0FFQkVwWmlkSnB3SDFrSCtuY1FqTTZtWVBxU0sra1FqVkNXK0pjUi84?=
 =?utf-8?B?WjVMR1c1ZUNBcFlIVy9PdmFzOWJ5S1NDTU5QTnhKRUVuOHArclhpVThxanJ6?=
 =?utf-8?B?QytMVDJqd2k1SEgzYUsxUGlQV0FMTTRxT1owbDBUMzJyOG0yYWF6SGVBWE5y?=
 =?utf-8?B?VTF1VGdWUHJRVUp2T3dKTjUvNzFKRHVVb2s0TG80OGt4cXc0Rk1HNkhLWjIw?=
 =?utf-8?B?cUtyanQ2WmdBeDNWazRvUjJvUklLK0ZXSmVMaGpyUkIyS21tZ1RlcVFZYmIw?=
 =?utf-8?B?MUtTdEVHNlFQQzRKdGJIS2ZZcnlvY25OZ1pocmVVWVVjMTloL2MrMEdNWnQ4?=
 =?utf-8?B?d05CUTJrdkJWNW4zdE4wWFZkYVpFWjBpRXBxWEJjVGU0K2cvTkxJb2xHVnB2?=
 =?utf-8?B?NW9TaW5rbnJ4WWVlYnJkQVRVcTYrcTg3b3VRMURoR0RQQUNUemNMZG80ZEw1?=
 =?utf-8?B?OXl1VnVraDlUUlFMMWg0dUlLSUxhTmlTNEZrdm82eGJONmhHZE9Ocmk4ejVV?=
 =?utf-8?B?UkNkbnRwVXM2UEltMDZnVlVZVXNsVHpXWmtUM1BBSSt2T05oNzlYYTREc0lB?=
 =?utf-8?B?Q1FkaXoraEpWVVQ0TUNlaWxwdmZEaVN0QlNXSEIva3FTZ2F4aW1UYkNWU085?=
 =?utf-8?B?U0JrbFV4Z1lWYWN5WktSdjkxMjZsRXBRRTNSVnVRaWExMEQrY2J6bFNmL3Q3?=
 =?utf-8?B?V0Z0dmlvWlMyV3pyWXAwS0p3MWVzTUxFeWFBQ0NZSFhxMjQ2SU9RdlNObVl2?=
 =?utf-8?B?OTNzSUdxSGtEMmR5dTIwTTZCN0QvV05sZ05IWjVsSWYrdWNma2UvYTFlRERK?=
 =?utf-8?B?YUNLNU9DOXc0VnJEZkkrbFFWakRrd0xDMHF2amtWckVyLzhNa3hBZzVqcHc5?=
 =?utf-8?B?VW5LVVlHZ2NidWcrbU12N2Z4T1preXp5WWZSNS9wdGk0OTlwYTRxRVBPMis4?=
 =?utf-8?B?YTVyNDdLM0swMUw2QXpETW1FK3lUWkVTSzgzbHFaRk0wNUN5RWVRSmhDQmJS?=
 =?utf-8?B?U1JEeC9kT0loK2c4SUI2cGg4NDNBY2pEcE5CZnhkUy9lZDZOTzNPYWdEdDZk?=
 =?utf-8?B?VkFuUzJoVmYrSUZZOU5Vb2t0cEFSYWJEbFRXTTFkckt1ZVppa2gvVE9WYTBl?=
 =?utf-8?B?alZ4KzZ1a2RCWFJNTlFyeGpZTENTaEYyNzk5SHNhVjJpREs4aTBZMW45QVBq?=
 =?utf-8?B?bEVxbDZ3cy9zZlF3SEhhR3hVc2FJcXdSeXNYb0NuWmx5bUw4SytYY0lwYVd0?=
 =?utf-8?B?Mjc0WjBKbFByaWpkZVk4QVRBR2g4WldwMXVScFU1U08wK2lZZGxuRnNZRTNs?=
 =?utf-8?B?MGd1OStJOXdXUkRKLzY0TFk2SUtIeVdaMUJ0cFNtelVINkVkY1lraHRlZlRx?=
 =?utf-8?B?UTU3SkMzNzQwQW9KVGJYSWJ0eHhMajFGRmIxekQzUWNiMkxEZGlIT2FTZ0Vw?=
 =?utf-8?B?YjBKelJvU1dmSVBvL2dLZWV1NHo3OE9UYkxqdXU1SE5ORnU5ZHRUWXhzVUdt?=
 =?utf-8?B?bnNxdGpiYkhIWmEzNWNaZ2d3bndRMjU4MWxodnBZYnZRTkdpNUhCM1ZDbW9N?=
 =?utf-8?B?alhrSVRMMjZCZ2NwUFc0STVDc3UzWUJMMEVZa3pSejZMMXZiNW1ZT3pLL05R?=
 =?utf-8?B?QVhiVDNQQkkrMGN1dExHb3h0R1NGMXR0ZnNUeENnWEt6eGJ6RWxaSVZtQ0Ft?=
 =?utf-8?B?RmwxTzR4b0g5bzhZRjFtNkNvSmMxQzJqUm1UTDNsNmZDdnMyZmpDYndsYm9T?=
 =?utf-8?B?WWpkMlFDQThIcDNDcDNJdFB0ejYxS0Q3bjZ0ak9iUWJmTVhlbm9vMXZsWXVx?=
 =?utf-8?B?WE9ucTh4ek1IS3dCMTZIS2ZXMFhFZmxZcHlFWTNBUEdvblNncHBxSVAzam55?=
 =?utf-8?B?MDBZWTg5V21rcEdLbk83NEtkYTljS01ueUtzTDB4SVViS09rYXgwaFZRaWg5?=
 =?utf-8?B?VHYyd3lBNzM3NzRiSGlBV3lzWm1kck9JdDZiTXJkZGVUMjduclRkR2l2VFBX?=
 =?utf-8?B?N0Y2QnJOY0V5aWk2bjEybmhVTXpjekx0OS9yNDlwTUNkOTFtMDk5VFdYLzR3?=
 =?utf-8?B?S3lYNG5hRWNhMktac0hoL0xjWDhRaGFWMmdIQXlLeHppZVRPd3YwVldaVVZi?=
 =?utf-8?B?UUZzRko2MnhjbzcxazVjRTh4ZmFKSjgwU2ZqNENQME4zdkJjMDhxMk93RWRy?=
 =?utf-8?B?bVVqTkJVRXFvdW5CRUx6Q0RyMm9ocTBWaTQrQ3ZDVEM2UVU5QUZlL1FWTTd6?=
 =?utf-8?B?MEwvaUZ1Rm44T05ENTZ0UFpHajNmTWVVZWFIYlFVOHVXcnR1WDRwVnBaNjFr?=
 =?utf-8?B?NnljMmtLTGRkeUVncUptRGUzRnFDMFNnNlFDclRIUzV4RklXWVlkRzhlWEtl?=
 =?utf-8?Q?AYxCuhBg87n6KeS4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119daf42-147a-40e5-d15c-08da2cdfd183
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:35:03.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeeOVodjOU8ZVGh806Lk5VEPj8LrtDGHTHD64rXr9FxjuENXmGu0RTSfru6908ji1szf54hvbkuA58ePxfbVKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4179

Hello,

The following series implements support for MSR_VIRT_SPEC_CTRL
(VIRT_SSBD) on different AMD CPU families.

Note that the support is added backwards, starting with the newer CPUs
that support MSR_SPEC_CTRL and moving to the older ones either using
MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.

Xen is still free to use it's own SSBD setting, as the selection is
context switched on vm{entry,exit}.

On Zen2 and later, SPEC_CTRL.SSBD should exist and should be used in
preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
compatibility, Xen offers VIRT_SSBD to guests (in the max cpuid policy,
not default) implemented in terms of SPEC_CTRL.SSBD.

On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
abstract away the model and/or hypervisor specific differences in
MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.

So the implementation of VIRT_SSBD exposed to HVM guests will use one of
the following underlying mechanisms, in the preference order listed
below:

 * SPEC_CTRL.SSBD: patch 1
 * VIRT_SPEC_CTRL.SSBD: patch 2.
 * Non-architectural way using LS_CFG: patch 3.

NB: patch 3 introduces some logic in GIF=0 context, such logic has been
kept to a minimum due to the special context it's running on.

Roger Pau Monne (3):
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
  amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

 CHANGELOG.md                                |   3 +
 xen/arch/x86/cpu/amd.c                      | 121 +++++++++++++++++---
 xen/arch/x86/cpuid.c                        |  17 +++
 xen/arch/x86/hvm/hvm.c                      |   1 +
 xen/arch/x86/hvm/svm/entry.S                |   8 ++
 xen/arch/x86/hvm/svm/svm.c                  |  39 +++++++
 xen/arch/x86/include/asm/amd.h              |   4 +
 xen/arch/x86/include/asm/cpufeatures.h      |   1 +
 xen/arch/x86/include/asm/msr.h              |  14 +++
 xen/arch/x86/msr.c                          |  26 +++++
 xen/arch/x86/spec_ctrl.c                    |  12 +-
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 12 files changed, 229 insertions(+), 19 deletions(-)

-- 
2.35.1


