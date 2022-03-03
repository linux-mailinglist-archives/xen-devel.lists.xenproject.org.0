Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D14CBB69
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282991.481886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPik5-0003FS-OR; Thu, 03 Mar 2022 10:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282991.481886; Thu, 03 Mar 2022 10:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPik5-0003DN-Kt; Thu, 03 Mar 2022 10:31:29 +0000
Received: by outflank-mailman (input) for mailman id 282991;
 Thu, 03 Mar 2022 10:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPik4-0003Bk-5l
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:31:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1369bc8e-9add-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:31:26 +0100 (CET)
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
X-Inumbo-ID: 1369bc8e-9add-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646303486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zp/O3+irhFt1NPeqnpO+/nDma/XFODeRS5LZWsgogwI=;
  b=HM9jUQzVP7L6Wt1X81H1TQk5pZWMRS5JvW9g+WzAosnFnQTiNa/2ZArq
   EqTr2FmIBsHdhIpLtuyer4lDDtXlCgKJK1cyRorq8Kf6Zuy26gY0Ky14T
   pGBUAanfEtmGcQPT+NPw1yltYrC6rKSmH6R3iFX1FOaBA4bNWdM6xTi3G
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65783134
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RCtgeKh7FPKeN0SRFq/KbIEaX161dhAKZh0ujC45NGQN5FlHY01je
 htvWDqDOqreNmqmc9l3b43j8UMG7J7Xnd4ySgRqrS1mFy4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvW4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQ0KIrX0uspeahobP3pmIpEc2JTtI0Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 JpCMGEzBPjGSxFLeXMbDMMHp/7r1lf+SB5lpG+z+YNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRABsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4Gc4m8Dmv5Ont4EW1XXAbcmRhQ/YkjZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBewaByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3aJpaJW6yP
 xKK0e+02HO1FCHwBUOQS9jsY/nGMIC6TYi1PhwqRoAmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKPoN5LcAtTdiBT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:R5CTkK2IkuJ9mWxwSbs9rAqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65783134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAzU1OLGrGbU02r+zkbGSmgmkO4IaPOqTm48b7ignoYZ9WUSbW4JtPbdNohyil3/Ca4scEL4c+R+WbRAU2/IOKKHTgckn1tlVccjuBgkuJUou9OJfCpgTuy0ywa0xHO10Cy0nq0UtGNvW2q4cCN28iyTnfB5h/ns81oEVrf8N5DxGCPzaranhOZGMDfZfLzwJkpyRRv+DZjJyLKiRwUswltwNvnvqWh2m1Yxpo9WFe+DkiGUefBvhEeBBVy1wVTufzBpVQEQPnX0ELf7hPvRfYw2SF7Lf3Enav+TPpaTi5WTdurk3dvTZviNjxHzdByMNuL6dk6c23kTemz87JitSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3ryk5q8FKUxx6AOhcSeGFHahYVASbk58h3VZK2SFNM=;
 b=Rv2PMRcXhfviph68PBY0QfD9VhCyIsA8v+xlwnazRpw1+9ZTXPO9ObGdSCGeyF0TO5WEic7BgqxXYNb8X/EByQxe4UMXP2wW6+Idq4UJ1BgHeD/+/RHbJcsSA3B6TX1S4Dguq7rZlvz5Oen/JAc0FimyWq2gLP5Fgbp8w1mjqWKTwQ//c63cL/YZ0/FPIGUjThk5Y69pswBTperEeL8FrGW2e3+qROWp7/KIEdnvZprTDG55I6gBxJAkATYgEcu1hDNrsJljczLuFe/MbFUQZJ9CtXPLcI0wf5BeSNu+BfsZdAc+oBxMJH9UJNHa+wXApY4J42FW3PQ6+DZhuVLymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ryk5q8FKUxx6AOhcSeGFHahYVASbk58h3VZK2SFNM=;
 b=HcFahv03F3OQhK7/7B9fk2QHciWsx2lCojHIJIx4Dv9OB/erMfuSUJLF2PdOH70msHGY/Rn3XYR6hYaVGPIlJnvhRnrlS/H+yagmNcWqiXGelpidpDvL7sPyiuLGzbt81xfDOTe76Tjn40LeIZ2C29+ah1NuyoGUSdSunzM/F/w=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] hvm/irq: tighten check in hvm_domain_use_pirq
Date: Thu,  3 Mar 2022 11:30:56 +0100
Message-ID: <20220303103057.49181-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303103057.49181-1-roger.pau@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d902a93-6ceb-4873-254e-08d9fd00f54c
X-MS-TrafficTypeDiagnostic: SN6PR03MB4464:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4464C02A2E278AFF5C8946748F049@SN6PR03MB4464.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xocbL/xjY/nhk6kA7lKa434DJyTRbC/lFj6NtumvLVYaER8L8fd/DmDt+kcMYafJYhaVUMQIIf3IVQHvbHXw/VKZCbLvltCRUWWsE/WCvMt/WZJnehEoz2Iyhrsc0VJvtylkuds9SOcdj92qXvwAQ5+8ZlhWeRk65DgVelMqkPJW3qBF5Thvdjdm37uohVYr+qP3TFNtcM/v3XCr5GRLS/7Wo4rgKh4hRgvJmROdeqhlQpEH7HV9YT9LvNOH5CkLS3U26GYQMhgNa0O8TcQk4nS4T0FFrq37BjxRNXB6terqIUWH/09RdT1jlDXQeOnsCm/+40krTdacpJnL2MlgLd5piZuz5lmNKbJ5UcHFIQkHBntx0RPVlMWQmr6tUKGKbRbsgWVsUZNMB58cCn9hYNXJw4HmSTtJ8VvXhjDcx1rLnNhuu4vuol9vhvIJbZ6ST1QvejB4JIQ+3jZyIOOF/eiXfpT+u8YX+hVWSUVhHX+JxbtzCaRzCwZoyZnbcNd8lbxAsJtjW/8TFqGQtMktQr7Q4N6i1Un1HpywKMQhDh+u7BPD5iTYMSDpWfXQXjawJTyhufeyy4/Xaj1rgqZVeJlL5dS99opUFrt1WKj80MurPRyHWYYIQSI1f20eZj2MJ63lVL1dX1xsaQxLDokNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66476007)(8676002)(4326008)(86362001)(4744005)(8936002)(5660300002)(82960400001)(38100700002)(2906002)(26005)(186003)(1076003)(2616005)(6486002)(6506007)(6512007)(6666004)(508600001)(6916009)(54906003)(316002)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdmQ296TmxDWXAxbFBZSDEyTjFXM1p6anBvUER4Ly8yQUJSdExiRjhTWjAx?=
 =?utf-8?B?dis1RE5NTWJodGdzUzFuWm9KV1B0THJHaHhhd0ZyUTJGcUNJLzhkaFdMMWdW?=
 =?utf-8?B?aHVPSlVBcHZBOEFBdHpVK253MHJ1RUNOTzZkSzFsajJ5eTlDOFRLTStRWVRE?=
 =?utf-8?B?NkF6Q0Jvd2dnS1Y2ZzhhVUF2eFRRdkxXN0dPc0x0ckxwNXRxZG9hYkpvbFQ5?=
 =?utf-8?B?QllJbzdPZXBWWlRqMG9keGlWektzR1dtbGZyeUM4QVdRaU4yWDlwcFFzSk02?=
 =?utf-8?B?Q0x4TFcvM2JtQXlnVmM5Y0JOK2k1bW9sNGY4NGhKTW9zLzFORTM1V2txMkdu?=
 =?utf-8?B?NlNQQm5jMENQclNGOHhrUGxIY2pVdE1oVGYzRHFFeVpBTEM0ZUgvU2dDaGhX?=
 =?utf-8?B?akdCcTJDN2ZoMEhubXBTbEczN2prVFZsR0pXc1dpVlRNTStnRmxCRUIwOXYx?=
 =?utf-8?B?NDh2ZFNFRVZCQVdXbC8zSEhyUHkrRkZFQmgxRERiVEwwdjRVMWZFbUJwdlVr?=
 =?utf-8?B?RUtQd3ZBQUc4dUpvdDdnWTJzOERKcXpHL25tTXBBazB3dllXTCtsd295Qnls?=
 =?utf-8?B?UGFVSDQya3JpUi81aTdYdCs1NjZYQ1RKYm40R1FOemlITWF5d3k4S3VLT20w?=
 =?utf-8?B?N2ZrSWh2c1BhUWI4OTZwUnZXWkVLQkxGYTF4eER6NUNWcjloOFBOL1VYZTZk?=
 =?utf-8?B?S1lHRUJmM2RldWQvek85OWY1aFc5K2Fsc0JMcnk2Wk4wMW92bWowZy9idmc1?=
 =?utf-8?B?MjJTWk95VERvUk9qK3NHVWJQQjBaK1YvejY0eDFPT01MbGpqMjRnY0NMK3pU?=
 =?utf-8?B?dEJ1WEROcmg5QnpkVUlMc2xmbnl1bTF2ZUhQREJVWlFjdndUUjRFYzBTOTNI?=
 =?utf-8?B?MGZzT05JYVNIU3g2cC92WCtlKzF3U2dUSnhqcW1kMjNPMkN5cDlRSTA1a0lI?=
 =?utf-8?B?cWtoUDBvYVBwUkxoOXZ4Q0cyNjRaKzFEck9RYlNvV3NWNUQzT3lqM2tWRFRO?=
 =?utf-8?B?U3VwOTFNVEgzd1l1aDdZMHBiOElLaHRIZ3JUN3ZwSEJid1dqaTdyNy9BWXlN?=
 =?utf-8?B?b28yWmRsaG5ld2RsWG5wWks1TlVueUtaTVo1NkNWZWhFTGZCb3NjWFNKeGN0?=
 =?utf-8?B?VTJnNUlaeFlXYWUrQnB2bDRmaHBRV3ZSSlJWd1NwNFF4SHZZdXNlWTBMc3dx?=
 =?utf-8?B?Q0crMUlmSXROWnZOWlRhR0lWV1ZMWWFJamNKdkxubjZsMk9Gd05iTXNReDht?=
 =?utf-8?B?WkhGendCKzNSekozMDJHY2x0L2VyelFORjNCNkdtcVhRTVpvYjRWS1MxM3Z2?=
 =?utf-8?B?UTVRN1cxZlAwUDBaMkplSGlYR0NlLzJrSytMaEpzTUhBUnRHR3ZqWTlHRHQ5?=
 =?utf-8?B?SXNNYklsZzA1K1h0S3FVVG5ES1FJSzYzV2hRNU1hVEdZcUtHMnU3cENPcGRy?=
 =?utf-8?B?VmZPKzR6YmQ2UEkwTi9TL3JScXVuZi9QNC9PS2tRdkQ3Y05sQ3h5aHdOcTNP?=
 =?utf-8?B?K0w1QTZsSitmVzdIMWhmVTQ1N3ZQSFNBNlp3NmdmcVlRVTNtZ29VRGJMaVlQ?=
 =?utf-8?B?TUZOV2NNa0RIMlFjaHhsR1pNZ1o5dHF1N3gvUGlvckxYZnpia1IrNDE1bTVE?=
 =?utf-8?B?MVl0WExuc1VFR2drSk5pdTUraXZseCtYT1psSDVOVUxHeE5QRWJCMnFrbFM0?=
 =?utf-8?B?aU1pV0l6dXlVNThkTXNuRy9TRDNWWGtCR1A1VHE0QWN4YitIb0ZHM0RKOHZS?=
 =?utf-8?B?REpzUU5xcnFoNCs4ajRoNzVJMDBaVWYycGdha0NHRzNxcUwzN3ZUVHNrZXpp?=
 =?utf-8?B?NnY0d090dkVqekNKcGV4Z3UweVBtQUowdWF6NDRjRWJ4Q2xyYzR1MmdXeCtV?=
 =?utf-8?B?aUVHeWpSYi9CTmpINFpsQlVPZ2tuS1B3OTJuQVhESk1rdE0xUmJkc1V0NjlV?=
 =?utf-8?B?L2VOYnM4MVpjR3c3NkdYZ1YvTUJVRGZscFpXQm1zeThJaGt3Yk5YMjY2OGt3?=
 =?utf-8?B?Tm11R0crMGFvVk93QTE5TEdEYnYvKzdOVEYxczJHQVI4Qlp1MWNtbmVqRTdy?=
 =?utf-8?B?b25yQkp0UUptQWFxWnJwV1dQZnNjZ05GT0h6cGlxMGk5VjA3MVk2eGV2bkho?=
 =?utf-8?B?TUk0NFN3ZUFZV2h6SXJtNTVFQkZ4dWdmckxFell0U0YwREFIdWJtQk01emZ3?=
 =?utf-8?Q?mgZ8Dsyon1mgqKH0U5DclaU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d902a93-6ceb-4873-254e-08d9fd00f54c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:31:20.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZdQjcYZIL1ZyviVvfT5MDCPUDMfxJKqdnGeMSmLnY6efb7tS08PAkMqrr5AEiNbBsQo6HFupxnwICa7jq7Vog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4464
X-OriginatorOrg: citrix.com

hvm_domain_use_pirq checking whether the passed domain is an HVM
guests is pointless, as all calls originate from HVM only paths.
Instead check whether the domain has PIRQ support in order to avoid
further checks.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5a7f39b54f..7c5dfd3c3a 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -30,7 +30,7 @@
 
 bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq)
 {
-    return is_hvm_domain(d) && pirq && pirq->arch.hvm.emuirq != IRQ_UNBOUND;
+    return has_pirq(d) && pirq && pirq->arch.hvm.emuirq != IRQ_UNBOUND;
 }
 
 /* Must be called with hvm_domain->irq_lock hold */
-- 
2.34.1


