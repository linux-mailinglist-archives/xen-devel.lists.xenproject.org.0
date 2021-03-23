Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36F345B81
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100552.191654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpS-0006wS-1S; Tue, 23 Mar 2021 10:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100552.191654; Tue, 23 Mar 2021 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpR-0006s8-Ss; Tue, 23 Mar 2021 10:00:01 +0000
Received: by outflank-mailman (input) for mailman id 100552;
 Tue, 23 Mar 2021 10:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdpQ-0006iw-10
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5283454a-2c91-43a8-b4f5-40d42cda4fee;
 Tue, 23 Mar 2021 09:59:59 +0000 (UTC)
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
X-Inumbo-ID: 5283454a-2c91-43a8-b4f5-40d42cda4fee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=sKTDxYJ3rj7iDKcoGoTCGrSKTjWKjCAlgiHohEHoEzI=;
  b=C7/phOo+BQQc99HiH15nG6eILjbcUvmWtgaV4PLtZ5KN4Uk0Yjjo9olg
   7oNlvtC1pwY+uo6scR+ZbQConk6Pr+1+B6eEXEyFTp1TYIwhYazz0jY9p
   ROATDUSxr9c9Bck0FdRvfxRW7gkHOp/gyP7pe014DIKHsjUUf51uXzisp
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 05RJMFpPOZsEkpnGZ4UWBWfrkNvB7rlXZK1avQKDnL2LNL8pcGWvqp33TA0n0La6yYR3KoWAaR
 FXmCZ4XShXC2KxuTLZOm7tqVVeQkoYAWz3tOep4RcCACLwFSD8yD+7F5pZLHQyQQffOrMEH1B8
 9NN+zWkRCbjsq9mVLs/qVMUvLlyXZ6V0atOK3Xm9Ieb0BOJmB6XdXxrucsUBGuJI5znnUBAK05
 zFcBS+Fc28lcpgFdxHHCDYaf7G9DUTAdq5TH81Oatd1p3bTPCbNem5Rf7+Tc17m6SCH4BMHndZ
 HKw=
X-SBRS: 5.2
X-MesageID: 40261142
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8NXDdaxVIRa8umfn2WASKrPxqe4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf+LmRdQg5aCZ0lUK
 eG7s1cqDa6PVgRZMK3Bn4KNtKz2+HjvpTgfBIAGlob+BCD5AnYlYLSPjq5+lMlUz1Jyao/6m
 StqWLEz4iqrv3T8G6760b99JJT8eGRqOdrJMvJscQNLyWptwDAXvUbZ5SnnBQY5N6i80wrlt
 6kmWZRA+1W52nKdm+45TvBsjOQqQoG0HPpxV+GjXaLm6WQL1hbeqkx975xSRfX51Etu9txys
 twrhiknqFaEA/am2DF78XIPisa53acm2YokuIYkhVkIOwjQYJWxLZvmX99IdMrGSL3750fC+
 9+DM3Qz+Y+SyLlU1np+kZo29CiRXI1A1OvRVUDoNWc13xskGl+1FZw/r1Sol4wsLYGD7VU7e
 XNNapl0JlIU88tdKp4QMMMW9G+BGDhSQ/FWVjibmjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyU1iGM7zP4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqbpekFCMGzYY
 fzBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH32UpMbmLZDrq/z7fP7fKKGFK0dnZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjubJ8eZKqutQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffCmqO/rm+mwHbQ4wxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCARNjUcXMEk
 p6q05s8ay6a7ycrBpSRe6PAya/tT8+tXiKR5ATlumo/sH+YK41CZ4gRehWDgXEFxt8nC5ws2
 ddYAo4RkvSfwmeypmNvdgxPqXyZtN8iACkLYp/snTEr3iRoskpWz8mRTK0aNWWhgwvXjJQoV
 V0/8Yk8f29sAfqDVF6rPUzMVVKZmjSJL5dFgyKaL9Zna3RdBhqQX2HgiGbjB8PanPnnn9i9V
 DJHGmxQ7XmE1BdsndX3uLR/FR4en60UmhwZnp52LcNXljuizJW66umd6Cz22yeZh8+2ekbKi
 jCeiZXCBhp3cqL2BmcnyuiGX0qyo41BPHUCK0uftjoqzWQAbzNsZtDM+5f/Z5jOtyrj/QCVv
 iHfRSJaBz/EOEk1mWu1wAYERgxjENht/zm2BfotjflmFE+BOffO1RgSfUwJcqG423tWvaP19
 FYgLsOzJ+NG1S0TuTD76fdKwNnAFf0h0WdSukzs5Bava4ortJIbtHmeAqN8EsC5Qk0Kcf/qV
 gXT6t66o3QI4MHRb1mRwtpun4S0OmVJEQlsgbKEvYzUFEkgXjcJc6I6dPz2M0SK3zEgAPxPF
 WFmhcth8vtbm+m1bQADbg3LnkTQE8g6G569OfqTfybNCyaM8VC9kG9KHmzbft0T7WEA6wZql
 Jf78uTl+GaMwr+1wa4h0o3Hot+t0KmS9i1GgSCBKph9MG7I02Fhu+S2/GI5Q2HAAeTWgA/no
 1KdUsZc8RFhH0DteQMo1ePY52yhFkknVtY6SxgjXj31OGdkT7mIX0=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40261142"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikA4WW9FVNw8sQq9FVBmUh2iYFw9X8pd5utQylRER89bmHB7IM1Q73QOfIgqgOrueBwlcy9rzxVuD0GiL+stTP01zHWwzTF2jNK3aPabZQ0wteb+TtTEYT5OabZa8gZ6v1wNuaRJvLxsLUKZL8cDBB5EbDeKulc5EmIiREUfUzbCGt+lul3LnlNaZALQr1SNMCsWPbL0RDEZZmbPhtLp/bhVo4dadAplTCuVomw6Ad45ORump55z7kpFiXWnVcCLtj6tYGXuoIw8kVmnhM0Q2+4RwmJHSHh9ff6Z+l6cmDBuNsrqF3lad9d+8c55W44KXivR6hDs8LiE8Hm4x5W+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiniRgb9Usi7cOKyAntrG74P2w6ZoVZ1eSYmJ4efxZU=;
 b=PdEDnW8tL8CSRxxAukw/wrUPNe7sjHUYj8wARYpMVvtWW+fbfYvG6UkFcGlaHkXqTJ/4ymSusy1va8xxRrBTDjB49GYP1vPZrTPiKR9ldSjKF2nKvtczaDOtNdlBVb2ZGvtIl8K9PcFXSLQwyYCYheNjjNnfP/h3Unlil+JpSDJV1UxjYxfYF0WrZb4nCLzpZilyyoLv++YsMCeiKDzGFSPO27wIgORZ8vBACikK13WQxag7Q0AaPZNajo3RwBkbcs9XqEDRXNaucHvybVz55lj0Yqw/2FWd6C/QMP8c08FZkqsLiPKNg5ARoCORgIcpPf3f95EhZcvBlrW4E3wnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiniRgb9Usi7cOKyAntrG74P2w6ZoVZ1eSYmJ4efxZU=;
 b=RBOajU+Tjs0IsUqY2oJPzIPeEOy8aOQqNpcQXvkBUyrHpeO2jWy2zJdNTB4PSP64At1fJgyXMaqV+AcH6elYkXUvyF5kayK3vBe8XzqbtQWSThe3ctK+iQN3vulb0j8hEq9QWu+uKdHIy//VGyipWaOWpCM3BKQ39QPpu5ttsXw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 05/21] libs/guest: introduce helper to fetch a domain cpu policy
Date: Tue, 23 Mar 2021 10:58:33 +0100
Message-ID: <20210323095849.37858-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31fd0c1b-e2e9-4a97-4847-08d8ede26874
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633DB9C1CD390D709B81B388F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8GrBI1odyLIpbb0bCGG8EdkjagxIrpA1WBzJiz7XN3Y9RIFGI6HhdgnuLFtCwtvZbXzGdyvcMhvWIK1J0AdZot3HVidqqsCG5ME0sek4NAVVEibR2Sxx8KKZV619TIhr68uG7yxRhCT1DN7GnXgxWr5Tau3cxY+ZeTLWI3HsvPi6BeuL8HpcOXo+xPfskJAFfycoSyV0tQXbCjyO0GRJlT3N3YUoFs7OsjH+cWJFBBDbXDN+VdY675tiwLgAgIw8Q7ZIRLU50Tjd0EGgYUH7XaoVW+Z/wNH5bN6CjX8+gTNN88ALyxCmBFwfp9e5q6OnZue9GzVgzNKyiXMkdKaoaywv1TqkQvt/r8Yuu5xcrNXmNzkZcXl+vrR43ych4baXTD4afXsdaN4X1zunFTi4qNIkaMnyK7+0nGS/siWAeZO9goo8MFkWkJcNXo+4HR8iYCUfdtTexl8DL7DjQRH8vZ2s039m3nICcI15P93fQRyHYOWjYCVhJhah+BNcNE+058+/lD/l9jNZSw1nVphDfQx80QJ85MDIfG9SkQl+2f3M4Xcu4YZQvHeAlQMV8P/s6Ulie2lJlzFwUGyUfiBg0EjCqZ+Lsqb8mDVmpwhfNClRoykxZORAUg7vVGNPq+9wu8ercLsys/nYK1fx4Z6y0RSYdvo2jJ4bzsxfmZImv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(1076003)(16526019)(316002)(2616005)(38100700001)(956004)(6666004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emwxdnRucDREWEVKYXVWdllqaU92OTUwTzIzVmZZSzBtY1QxQkp5Y3NkeVNm?=
 =?utf-8?B?bkN1WC9DVmNkSk1Xd285UjR4Y0E4OUNuaWlNZUljcWJ2WEpxbExXeFRSek5Z?=
 =?utf-8?B?UGZKYXlsL25HMnVPNHlpUlQ3a2ZHTFZIUjFGcEo4eWVOdUl6SWxNQUVWV1lI?=
 =?utf-8?B?N090VTdDYjJ0UXpCUWVjRFdhWDh2YmZ4bEVMZUk2ZVNOSjBMb1EvS0tHdjBS?=
 =?utf-8?B?RVZhWjYyS1BPTWdkSkhOR25hR1czSjFYUW5RZ3hhb2xYcFg4cmZMYjI0MzB4?=
 =?utf-8?B?TkVudVQ2YzA1bUM0ckdHRG53ekxHUVcvOThIR2VDVFMvV2Z3Mkh6bUJnWTU1?=
 =?utf-8?B?cTZjSDdXNEpzbW8xazV2UUxzV2s0bkJQck9RZU5PQ0FDRzRLaFA4UExmTTN1?=
 =?utf-8?B?MFlGME5VcmRsRHgyRnJ6N3gyblhCaDVFTGNtcWFQYmw3ZVAwaTR5VDFrVFlE?=
 =?utf-8?B?Mkh0a0dSNVJaWVI0ODZPby9aWFlPQmd4THhaTURpbFlHL3lHYytPalFvREdO?=
 =?utf-8?B?bE9DYnF5MkptdW9DUC9XM0FrUFQ1ZDM4bzI0WmFVRFh4ZUpoYWNUZFVFR3pa?=
 =?utf-8?B?a1pRU3pDTzRwTmZJN0pHblFWd3ArOVlVOHBmc0xqbTZkbk9vN0NMZ21aVzdQ?=
 =?utf-8?B?K2U2ZVpiMmpodG1Zb1pIYllJRmxUbEpNMVloSDNvR25LUUFZZSszK2Z3Q2dM?=
 =?utf-8?B?VnZ3MCtYVWlUSDJrdzlVYytXcXJRc2ZuaFQxT1BMU3Avc01BS0xVSGlnSTlG?=
 =?utf-8?B?dWF2d2kvTnBzT1FERHhmZ0lCendaUmUxaWpxS04xRlpzMzduM1BPcmgrTEt2?=
 =?utf-8?B?YUc2OXBmcVAwMmFRZUg1UitpRXlON2d4L25rWTFLclpZajhUWlRNS3U5azRp?=
 =?utf-8?B?WFFPQklJNFpiNmNwbENaWGFSaUllSFJkZ0RwRWdMUHgzK0FrZm81dEt6OHFP?=
 =?utf-8?B?anZHcGdscm5adzdCaUEyN2Q1K0NqeG9KOGpmT0FqYmFaZ2dXMk4zSklkODJ4?=
 =?utf-8?B?d1Mvb29hSCtlKytEY3BNNHg0Yk53blgrS2U4U1JETEVYbUVTZzdvMkFpZ3lv?=
 =?utf-8?B?NzJTVVBzQkdlWDY4WUI1dFBGMmc3ZCthcDN1TE9pM3ZEN1dLQ2lwTm5ZK1JH?=
 =?utf-8?B?V3dKUWRzMFZIOUdSWGtKNUhhK2JpMi9RaHE5SmdoTkNaQ2tCbWxGVHIweGpF?=
 =?utf-8?B?Q2g3UldaMDBBTFh5a0tFdFRaQ3JHU0hsQkxzV2hXNk5ZZHJuOTRTYzh6eXpQ?=
 =?utf-8?B?QlFGSU13c0ZGb0ZGKzNOUE5OTlFxT0xwQ3FiOFZ0cEROSmxBVjQvU1gySTJr?=
 =?utf-8?B?SU5IWGxXN2lDSXBoNmQzaE95Y2NSdUtwOXVCem1UVXpTcUFHeFZoczYxRmVD?=
 =?utf-8?B?SkllU2RyMjBuZWowVGxFWWpRU1JFenVMb00ya29LTGRNOXJpc3VXY290OFU2?=
 =?utf-8?B?Ni9oUmtXdWkvWEMydlhMR0Y2N0hwcGM4ZDlzQmdDMjVPeGRzR3dRQWY3T3dY?=
 =?utf-8?B?N3lvVFcxMG5jY1hwQ3RIdUxyMCtXTXZXejFPUnVqYzFMYWRpdjJMVmZXSU1s?=
 =?utf-8?B?SzZ1QjdNMHU4bVZ4V2pKWElWU0hRdllEM1lRMEVWazZGcGE0MGtGL2NpY2cv?=
 =?utf-8?B?UWpJUis3V3RQU3ZSaXNSQWVNTTVsbkRHenNJbm9SODBPeUJocHB5N0tEODJ2?=
 =?utf-8?B?d1BremZEbnhqaDhaclAzUitBRWlXMkVJSTBSQVJVZStMVndZM1llczFuZjRS?=
 =?utf-8?Q?jEb5oJ1WqahHoNHmjGVq+j5kV7CWC+6tWqTqMSr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fd0c1b-e2e9-4a97-4847-08d8ede26874
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:59:54.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3flLIZS9a+/qHR8u2FBopZvPkjJX6OnSDjyqkq9bjb7eU3e5ND+EhFilGQkNXBbcCutF68/ItZ/Er5X4aWPTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Such helper is based on the existing functions to fetch a CPUID and
MSR policies, but uses the xc_cpu_policy_t type to return the data to
the caller.

No user of the interface introduced on the patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index fc8e4b28781..8b8b30a2764 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2599,6 +2599,8 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
 /* Retrieve a system policy, or get/set a domains policy. */
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
                              xc_cpu_policy_t policy);
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t policy);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 3710fb63839..75ac70996ac 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -777,3 +777,37 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
     free(msrs);
     return rc;
 }
+
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t policy)
+{
+    unsigned int nr_leaves, nr_msrs;
+    xen_cpuid_leaf_t *leaves = NULL;
+    xen_msr_entry_t *msrs = NULL;
+    int rc;
+
+    rc = allocate_buffers(xch, &nr_leaves, &leaves, &nr_msrs, &msrs);
+    if ( rc )
+    {
+        errno = -rc;
+        return -1;
+    }
+
+    rc = xc_get_domain_cpu_policy(xch, domid, &nr_leaves, leaves, &nr_msrs,
+                                  msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain domain %u policy", domid);
+        rc = -1;
+        goto out;
+    }
+
+    rc = deserialize_policy(xch, policy, nr_leaves, leaves, nr_msrs, msrs);
+    if ( rc )
+        errno = -rc;
+
+ out:
+    free(leaves);
+    free(msrs);
+    return rc;
+}
-- 
2.30.1


