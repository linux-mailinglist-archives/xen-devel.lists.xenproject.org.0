Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7570C347
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 18:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538034.837773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q18MR-0008ER-IX; Mon, 22 May 2023 16:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538034.837773; Mon, 22 May 2023 16:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q18MR-0008Bp-FM; Mon, 22 May 2023 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 538034;
 Mon, 22 May 2023 16:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXMk=BL=citrix.com=prvs=499503587=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q18MQ-0008BT-4o
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 16:26:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c4381af-f8bd-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 18:26:11 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 May 2023 12:25:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6746.namprd03.prod.outlook.com (2603:10b6:a03:409::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Mon, 22 May
 2023 16:25:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 16:25:52 +0000
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
X-Inumbo-ID: 5c4381af-f8bd-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684772771;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x/z7FRGiRtq5/93DtD1VroEMpJhQJKR2RPRMQ9XH0SU=;
  b=RRiuvGRb9PWoaN9rXcQXCCOlzZOgiVV7AeizVxHKCaT00GAUbYZTgvsb
   uNwhuHo7fAYq1sBVGAU5qv8ZHrN85CeUrRH9ooYcfY9fCDyXKO5O1k5uW
   W1GnU/QsA+kGreW78sgsjDANtGnHvr+DiVhBk0FlgU8sD128C4+Zb6noa
   o=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 109276189
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zMRF664/35cR6gXHIx6QxwxRtBrGchMFZxGqfqrLsTDasY5as4F+v
 mAaUTiGO/aDazGjLot0aoq290kGscSEnN81SVFl/ioyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 e0/IjxWPy6/wO+k4aP4EMJNqv0MBZy+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6NkkotiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpDTuLmr6476LGV7nw5IzAMUQaamOWgp2TjZ+sDM
 Wga5AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zmv9s1hxeWFNJ7Svbp1pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:j8PTLay4x5Kci6WrtvA+KrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ApACUsWmem7tvD6FY/GEznPIDPvDXOUHM633ceB6?=
 =?us-ascii?q?GNSFkWpyECgW72Y9dvOM7zg=3D=3D?=
X-Talos-MUID: 9a23:AcHusgu2LUyQ5GWtgM2nlBtJGd1svoWXFFkgu8g6gpWeESJuEmLI
X-IronPort-AV: E=Sophos;i="6.00,184,1681185600"; 
   d="scan'208";a="109276189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFsWs5yN/6PtY5cJF+f8A1+FxGo6EFaPKI5aoFybnZWx0+T6FSQNF6hDVibiNYQ0w8oBdXHKqYT/ntZol86hP9/KoolQeaphVpCdUiGMbgoMAd+ez1vJEspi+JGIA3NVDHnkGuv9NvQI/0qxvIb4nnwzUlvnvAR8mpW0US8gfYUjKzvDW4/TR45gwrnssRPjbYLl+Tqbb+dqOEIDsQDkDkOLVOezIwPMVb8FEUkCPQq6tfB2mCioUz9plC8gWRzMSgHVfYadEeVY8/+mxLKKWBq1jYUi6LEbw8BWCVxyQPFFiWz3KowNP81l+/R42hRESxvVHJhS2n0he7ssMktmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/z7FRGiRtq5/93DtD1VroEMpJhQJKR2RPRMQ9XH0SU=;
 b=NnQpKWVNy0ahxjM00+yqX+mGLcgXOo+eI3Om58cETJ6d4X3GNL+FZ/meYxx5YPUoTxSDxLDxng7X6Xi1irbe8w3JLB+5g7B+KnaDw/Yxtq3rG3APHzL5XyxPd0IiEIoesRIyDTrHchmPtHWRk9ha7+wGJgZE007u4+vzA2uUNAs7cGNiOzXPqVoAfDRWjLMIjfz1ofkA7qCHnaNuqhnoo00TWwwqNdif2Fc7kd/Pot8OgiUfwaGR3yGwPjmv920a9GVikBDL2czDBoLKGPJISl0vSMgajhnjqynxdy5mrxu+Smtvz+wlNgB1vgCdWXqSWIFET+OMY61AZl/LEp5+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/z7FRGiRtq5/93DtD1VroEMpJhQJKR2RPRMQ9XH0SU=;
 b=S+YJqXWLl8nJwSAjgusAblXUZFQx4WwSUiXq8R320xuHKdhdAOzgUVEzclIfkFV+1VtEQ7eClu3D484C7tZ5d6DjCACuiSZF1bnYQAqy1ixaYVxiq4ABknThIbAhsqSyDgUYo+2kKIfsTYfz1ebuzyW/pTKRpNGLd7zn1mCRjFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d6aa8dee-49e2-1493-adb5-2adb474af067@citrix.com>
Date: Mon, 22 May 2023 17:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 00/10] x86: support AVX512-FP16
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: c898c02c-6762-427c-09d7-08db5ae13589
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n1VowiQR8uE7mc7hAgSXLA7+FzPg2cRwMERnxq0Fqx/m2cA36JRSQ9JWv+vbjNZiTns3khC+AdsfaX/T7vEaG8AjuOWjXuc0S7hjLNdSeq/p7NM/W/pgCQuKvWTPa/iIDP/VgTOg1lP0kJ78to+T1aomDSUTX0Lfsa3uZhNMkgalcYi7aukjb0HiYEcmUbOgqwsPo6iMT2EGfdpZTIuV/3pHqca87A3/JwVoDkYMy2Bsvk3GJoFiiv3hCj42urtIdqRo96p53uPq9oWnBwXxMTbO9MJSfrlL98dvwHmXqfTtMjPMxSPLdXBPX8VifSBXrSrMouUc2EF0BLjdU/Vm15aauXy8kkEriXth8w4rSkN88qpupGc7pT3zszY5sVk+PFtwc4gcT+ov0dGt/+WKBnKB7G1Yl8r3/1QxcMq7CfStkIfw0iMPp38oqqJNN5tBZM6+VR2vBkuLnraJ409W2jtdWw8aQHuGYBhuherSRK1qjcO7ya4/2XcIeo9SnWFBZlPx1OoFC+CKJIrZAZbnveEAmlER3WbF879i2DMjJM/Rc3UWdnUh7CPtMa/G571bMu5A4TnIEPHI5jaPWDDUWXrS4m8/iIQq6TZ6cbEq4Mgt/jS7Twx88gA5aDml+ulNtdaSXtNVCUajh/voqQ6FkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(54906003)(110136005)(66556008)(6666004)(316002)(4326008)(478600001)(66476007)(66946007)(2616005)(107886003)(6512007)(8676002)(8936002)(26005)(186003)(53546011)(2906002)(41300700001)(6486002)(31686004)(6506007)(5660300002)(38100700002)(82960400001)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUtZTTRiUjFSVzZ4NUlRcjh4ZzFab3lMdU9HUFo4aDNNYkY5MlJzMkVMc0J2?=
 =?utf-8?B?SVdLVUVoU2JBMFVYNmNRRWNuUmY5NFE1UzZRdWwyYmdsRTBsRUJVbDdtK1VS?=
 =?utf-8?B?ZFJwbExmdkRQYmdKOGhHV3d6NUJqaTRZTmFiSjZaR2wxT1NYTENjZE9zWGpr?=
 =?utf-8?B?MXBhZzNOaUZuYlBEVkFzWE51bzR2bnV0TG9CM0Nnb0dUYitaNnA5UGtzZzN3?=
 =?utf-8?B?TVBwWXpnbG1Ib2xVNmdSVmlCdG0wYkZKUGJOT1BuQ0lnUlNlclpVSTBnaWZB?=
 =?utf-8?B?U0NnNGhZMUR0a0FlMEVvYkdQdGUxOFoycUw1YlgrSXp6cWhnQ1d3eHgxQ2kx?=
 =?utf-8?B?RHk5cnE1U0s0N3BwaWg0OGpDNEZqc3cySk1tZk1NOVNnQ2I2NS9XOUJRM2tr?=
 =?utf-8?B?TDhKSkQ0RUdtaFgrVDd5Tlh3TnEwUU4wOTc1MVlncTROMmQ5SVFjamZBVHJD?=
 =?utf-8?B?THJ5Wlh0TFZWRnBTNk9aSDlVbXNaejdzdlZaRDQ2ZmNpRnpJMzVkRGM4ZW8r?=
 =?utf-8?B?TlBmQitPLy9WbGRMcUI0RjlwVWRZNktzZEdsWDFFdmp1VkVpcW91SVhKWlRS?=
 =?utf-8?B?cG91bnUycmpZd0dNL0NkTWFJb1dJVkh3WWVsWW9MMHdXN2cwcmFBZGNmcmh6?=
 =?utf-8?B?VmJtdkZoNHFyMkVac0QrQ25OZTY1T0RsUUtOam84RElyaytQT3lDVnljaE9U?=
 =?utf-8?B?NUpRZUhhSlNXR1lYZFVsdkt5S3g2WE5VV2J0UGZGQUdsOVNldWM5eGI5eklZ?=
 =?utf-8?B?RjRQUzE2MEhJaFlLbkpMS3JadDJCb0hqUUZ0L0xXQmVOb0ZDNHJWSStYMWNh?=
 =?utf-8?B?M05peXF5aFNCNGFzYWZJdFBFWWdmZFB0WXhaYllLQ0hJWlpxMEZFTG9GMURo?=
 =?utf-8?B?ZGV6YWNpUDVpNHgxMlVXUlpab1NOWStWdlJyZkF5djdKcjl0Q1FkRG5kZkhK?=
 =?utf-8?B?V0h6eXBCK2VnVzRaMm5IS0hzRGZKMFZhNXpmZENaVGlLc0JBSDBTbU9iZUkz?=
 =?utf-8?B?bFVkb2tzOEJUUzg1SE5pNXFEK01BMm1yQnNlMWdoeTQ5TFNvMlY5MWVVTDF5?=
 =?utf-8?B?NU1oeEdPU3NOUkkwZi83b2tyN0p3MzF2Rlh2ZWZwQ1lwbXQ0RCtNakxqT3Ft?=
 =?utf-8?B?M3h0VWxpUmtBMUM4a0xOcE1rWTZma2xHK3pZYkFCYjRhUVJnT09qVHVvc1lp?=
 =?utf-8?B?Yjk4UkxxNXJ2QWhjOUZZZFNLTFJmV2wrZlZtUGVQaTdJdHN6aG96K2t5MHhT?=
 =?utf-8?B?UFpxQkNSVERVN0FaZ2ZOa2dXZndRQjk0VlRZWlk2NVh2YzJIdFV3M3NGU1BS?=
 =?utf-8?B?blBzUjNSU29reWxFTTNodExMek5SanVtSFBqYlZjUDlYWUdDYkhrc3QyMjMw?=
 =?utf-8?B?anFoWjAvSm5JWEVRdXZzeVc0czh5UE5XMXNPaWZkOEdRVFhzZkdXV1JCNzdU?=
 =?utf-8?B?NkM0VDJzRGxCRTVWMng0T1JzalU1L045YzMzeDlMbGJGQ3hPTk5BVmlFY3VS?=
 =?utf-8?B?Z3VjN1RCZ0dZV1VQa2RURkJuM0psbC9KUFdLZ3RHVXQ5b0twclFpRW43STR6?=
 =?utf-8?B?RUx0S0FTWUI0U3pBWmxkd0R6dUdzOWlwVTRBOFllMW9vazdHdnlOellhWkM3?=
 =?utf-8?B?clNIMHUrR0RmOTA5eU1NZFpkU3U5Y3FVR3hwQ2dZcCtrbytmTHNzb0JCSGlE?=
 =?utf-8?B?Y1ZTTVJ3MTR1NWZxOXVRV2FZMk1KY3hKc3BJbVVIYXkvS3RSbkFGalZmU3ZJ?=
 =?utf-8?B?YUJIMW5yM3YrM0tYZjNOQi9CQ2FuemZHYTN2MXFjZGZ2NnlDbnNKNUorSURl?=
 =?utf-8?B?ZFVUU0Y5SGhia2xZZy9FM0I3Y0U1ekxhV2NMMHpsQWN4VHFvRkxuQU82cG9O?=
 =?utf-8?B?a3EwYStPT24xSEV3Z2FuMDhiNmVQbUgvZWlVRGJtcHpWNTBQVzBrcmV6Mmdt?=
 =?utf-8?B?dHhtNU1BOWdiZlBCTGpkeldJWTYwSnRRQWhHNlhNWjBZMEZZa0NYS2l0N0h6?=
 =?utf-8?B?a0w4TnA5cXV0UlJPQjlXTnlqcGNPRHRzR1I5RUxVZUxFaXNCTlNleUxIQ1JQ?=
 =?utf-8?B?T0hoMzF1R3lKR2xjQlNQL3NUcDJWMjdlNXRzNHIzcFIzRDhhNmhtTWxYdXlY?=
 =?utf-8?B?SHVLVkN6L1kvRERWSVUxaVFhekh5S0kxN1EvanlIT09yZGJrVUZheUgzOXdB?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NJc/ArCoaAWTd/3AiDJO4OmXCjhAYqdiJS1fV5agqdfVD/80VqNeoJA2v5kWhM240DPb0ufTohEFKvd/mw9Em98cLc7DJCSxks8VHJ8v4bPp8IXomTohq4U5OZnWWVctlCf+jIqjVts3o7OtG2oNzgsBp5IBDaFd7dvkif2fV6v0sfvMu6iaF+5A0nybSxjHPSSL0j6j692p4RHFABOV/MjIPVMaa5y08jCmSWKJz/qWFpRVBeR38NFK19wMovXnXkYNpzytMfNOGKVeJSUweLpuzKJXQtjGDOXliyq8QM9YBfYqGMsRfi0vhtVTsErvhH0rlDvgdTbOmrBkmYwKck06bGRZ/gkq4mY47JVTFaeJeQnUjFZRueu+PIEAmqPuwBMV//fgn9KwsbcXdzVEeueqEvXB9bhHe7yEa18hXKhQP1h4UdUW5IGcSWtFV+DlemW8+wJSEipB+6/p34zv+G67gy1cPJZwl73dW4iXh+VLEC5/HVXpZez1mKpdDuI+duHMp/pE2aQq5BC1c7PI2LlxNocmIUa81+BbETF/08Lo2+MISuE2jacgaJ5zPcnIMLSQXHoPZ2cp0DFvt+tbgwyGF7Z8sloSaidpt+2APZZ66jbFWHHWBkKVKQ40RupeEj7VkwhGkXq8CoxRp9RaG6p6KbFHtmLOqCP3KZqeNTiqb9b8NQv0hlktnKOuFsP8+755UtYY2rB6JYnKxl5JoatHXMa00qx/Xf2bDFwYImKGQV5CCFhCnTfNxd0TUNNq8UUMvKFr+W8kbLp8+Dysaw6VN03XGLhm0AKrZg8fcN6HJGE54G2g9snhhZII04Dq
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c898c02c-6762-427c-09d7-08db5ae13589
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 16:25:52.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Do5+ZgufIxIq/aNyZHxgK6nZdj7YoERvVKD4FqzZJKU0FAFCKE+By/+bAK1Tv5Cs/sTRCeDb2ZtsbHv2oT5Z26UnXIaU0PBLu+dgrYwYbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6746

On 03/04/2023 3:56 pm, Jan Beulich wrote:
> While I (quite obviously) don't have any suitable hardware, Intel's
> SDE allows testing the implementation. And since there's no new
> state (registers) associated with this ISA extension, this should
> suffice for integration.

I've given this a spin on a Sapphire Rapids system.

Relevant (AFAICT) bits of the log:

Testing vfpclasspsz $0x46,64(%edx),%k2...okay
Testing vfpclassphz $0x46,128(%ecx),%k3...okay
...
Testing avx512_fp16/all disp8 handling...okay
Testing avx512_fp16/128 disp8 handling...okay
...
Testing AVX512_FP16 f16 scal native execution...okay
Testing AVX512_FP16 f16 scal 64-bit code sequence...okay
Testing AVX512_FP16 f16 scal 32-bit code sequence...okay
Testing AVX512_FP16 f16x32 native execution...okay
Testing AVX512_FP16 f16x32 64-bit code sequence...okay
Testing AVX512_FP16 f16x32 32-bit code sequence...okay
Testing AVX512_FP16+VL f16x8 native execution...okay
Testing AVX512_FP16+VL f16x8 64-bit code sequence...okay
Testing AVX512_FP16+VL f16x8 32-bit code sequence...okay
Testing AVX512_FP16+VL f16x16 native execution...okay
Testing AVX512_FP16+VL f16x16 64-bit code sequence...okay
Testing AVX512_FP16+VL f16x16 32-bit code sequence...okay

and it exits zero, so everything seems fine.


One thing however, this series ups the minimum GCC version required to
build the emulator at all:

make: Entering directory '/local/xen.git/tools/tests/x86_emulator'
gcc: error: unrecognized command-line option ‘-mavx512fp16’; did you
mean ‘-mavx512bf16’?
Makefile:121: Test harness not built, use newer compiler than "gcc"
(version 10) and an "{evex}" capable assembler

and I'm not sure we want to do this.  When upping the version of GCC but
leaving binutils as-was does lead to a build of the harness without
AVX512-FP16 active, which is the preferred behaviour here.

~Andrew

