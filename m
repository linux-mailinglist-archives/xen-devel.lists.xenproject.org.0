Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73815FB83A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420433.665265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiI1U-0005gz-IA; Tue, 11 Oct 2022 16:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420433.665265; Tue, 11 Oct 2022 16:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiI1U-0005eh-EZ; Tue, 11 Oct 2022 16:22:28 +0000
Received: by outflank-mailman (input) for mailman id 420433;
 Tue, 11 Oct 2022 16:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHIK=2M=citrix.com=prvs=2762267ab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiI1S-0005eb-BD
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:22:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2dde4e1-4980-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 18:22:24 +0200 (CEST)
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 12:22:21 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6723.namprd03.prod.outlook.com (2603:10b6:510:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.18; Tue, 11 Oct
 2022 16:22:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 16:22:16 +0000
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
X-Inumbo-ID: e2dde4e1-4980-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665505344;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=w3ykRHEsqkgARQeFChrLO2Xs20bHdqLTH2B+EJCqL2g=;
  b=XyaudOKAckWYcNDmcQejdmQs6KrdjZXpR2njRZvKybJYdiPRsPlVFAjJ
   /Rd6DdAqh/9fpRRBJMW1yqlfMZ6GqekJfW6HC1MgXsmQw8UrcnrBNbcJF
   Cr3dH5Hp6xixj79jD5dWJjaceU2l1ZbIM5vI5Qo1C+u9pSBslwMAIfx3Y
   E=;
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 82909578
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n7CfxK2im0xOeqs2dvbD5ctwkn2cJEfYwER7XKvMYLTBsI5bpzMPy
 WtKXDqPPq7YY2X0eYx/PoznoxxXvJ7Sm9I3TApvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GpB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUZueJoBjBDr
 sBfJWkIMxuujbm87p2kH7wEasQLdKEHPas5k1Q4kXTzK6ZjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g3J4/Zui4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWDUqiPx2b+ncSXTW40uCuOG6qZT3R6hynE+Kj0rSlykiKzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fCITfWkLYHdYSRNfu4W65oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:0ZdiNq077q3gx4yqLrbUkAqjBVdyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 DskfZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolys2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RLYGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUQTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+qZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wVh4S0LpXX9
 WGMfusqsq/KTihHjHkVyhUsZeRt00Ib1u7qhNogL3U79BU9EoJvHfwivZv3Uvoz6hNOqWs19
 60TZiAq4s+MPP+TZgNcdvpEvHHflDlcFbrDF+4B2jBOeUuB0/twqSHkIndotvaMKA18A==
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82909578"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvCXc4Rc1wAV0srkO6xKEzsTN4wNzZktanKJ4ARks7hO0C3QaHkqQjT2ADe3OzxamnODEX66o9QWG8e1bgPSqKrkdxYu4KwwCh1zNFbHPWlkXzwMV2ko3QIIL3YHSTLv/VdUAuaZ+NJITOrJQQZeYUfIMO9sAbzUgcbu+kJQIhVhXkKCaAcHSNHjds7F6VyqdakTsmQAZ5v43LmgLZa/QG5Arvk6F7v5L0u2N/4ZbMNBz1htf683ITxTlJfBo1l9stgEjyn5ffVoGXdHFG16fH0RFVvzenFSBzua1LijdJPwjj/3WnqrXMHvfIDZpuh9hW8GBtkY147tj5j2iR51tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAqLP0bsxCz0hHWLie1B+857fbmoIn68UrorEMA+1SU=;
 b=TvrFhTvGynMbUZFA8zAuGvS44NkGHiG0GuxFzMcCfyb/yFbASeMHX1OSaHkBL1bq2pJKJTkNNaJqtF8f8yTc02Em5/k3iS85VK/TZSlN3ZyAUWbWwC6qtWhDPU3zU2p9qC3heYCHfEYtxRxVrtK2u/W23c7VPPUKC2N10BSPH+dsI+1+U2t1owVcIz3iqz5xnyiYzkYAl7TvK6KRmLvcWQBOwJf/OGc6wmJfQfolfivUQjKHj7NblZbwXrQMuVQQE+gr0zvqckDHMfVobHlXemQP1r+NUzf1ezIOLHLesGnCo7E2UrcFdW8hDR8UP8VW3VTfyLHC7jpXi3wLx11XcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAqLP0bsxCz0hHWLie1B+857fbmoIn68UrorEMA+1SU=;
 b=QSlPevNY24xNn3ukVuHeET+OKfrVIZCXZCK6+tQu4+z/8sA2EXqkHWjaeXl3Bx/R/MbPTF5Gfk6u/JC5Rk0HPwBKI6Sku3ah88PHWSBS6N47kJO7xH1m2xWTFpZRRLqB3XDOuqUGcoQ4EYJmLuTsA2h00SqRtZuhRrGRdTUw1b8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 11 Oct 2022 18:22:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/5] x86/mwait-idle: add 'preferred-cstates' command
 line option
Message-ID: <Y0WYM/trMDVja61r@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <0690742b-21c8-e5b6-e8ff-5d4709e0c3ee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0690742b-21c8-e5b6-e8ff-5d4709e0c3ee@suse.com>
X-ClientProxiedBy: LNXP265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1bd29c-99ff-4495-eeb3-08daaba4c30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6KkcJ0Z2t7pxnCy5djYYt/60XLELoYwTc6V1nFIv0sblP7yePr4atFnY6iX5QUkdifoq/kWhgs1Wl2lVgqoO994ERWy2l3k68P9b9a4Smv2aQ+ZPKrtWDqWg7Md16g7AeBp9BSW39KHWpHjCh4UQVKsMaAf0oOqNyCI1TF7M+Y1eUB0xtH4IUFqHh6AvdpxX23Yzq3ZkWvezGn+16pkETt8x+Y1XBu4cPoE2Y43qEk8O/ASI27PS8nQ34uMjl2azQm2qLXoWh9MJZDdxKe2PKiWy69Z2vm5kFgNvJX7a4649IXqBgaUygSKCSeknLFZTT+4Bsd9KHd4UELc4KfP1j6mzrtvzNOtgNfTp5IwMen9/1R8Ue2eVv1xas1JOY527z257w+PR7lPxfqgAZolwFV8LcDGPtsMCHaSBvHS6GFOU26ZX9hJi6EKok8f1kcmrJ13UhGID3JAnUMXiojZyz/ZLm0cmtUbWUxihoyiUgnx3YLgUnYbJFvxJllCZHMQSTopEotf4czVmpkjFi9lvj3+05XVjNmQOFe7hstEoMKMNEm6XuMnkSkk3GO8kyo7LsGF//j5xkmhHrHd6M3HujwJmj9AGRAyLssK8tP4EqOqZT1E3r+qiVrCu/MqoxVqlyC3BMTZUEEX3rgR6d6AT0kVKeo9Izq+MFuzDB4hY18hi/XsXs9Ptfft4C6xLj/aP+BgyHMbjEekupcEOt5O4Ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(9686003)(6512007)(26005)(54906003)(316002)(6486002)(82960400001)(478600001)(38100700002)(85182001)(86362001)(66476007)(83380400001)(33716001)(186003)(6506007)(4326008)(6666004)(30864003)(6916009)(8676002)(66556008)(8936002)(5660300002)(66946007)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nys5empBcm9ZMFJrd2pPaDZ3MUUvTThIRUNXZjk3WVA0K1VZY1RsaVNxa1c0?=
 =?utf-8?B?SE1HakkzZnI0cjZsb212QmcwNXRFenY1SnFoQS9TYlBZcEg3R3ZiVWVkZFNP?=
 =?utf-8?B?eXEzV2xFSTBPV0FYUEV1Snp5SVRDRnpGTkxmREJlUVQ5K0hGcW1ubXp2K0lw?=
 =?utf-8?B?Z0VQcWxPYnROQkRBS0ZhZncza3Z3Rk1KY1d1emo4Y0R4REowT25pSHFna0ZY?=
 =?utf-8?B?QnpUSUhtTVRuRmhEcUdzOVAzYXIxbUg4QmFveHMyL2J6REVZcVJWa0hIZFVC?=
 =?utf-8?B?NjV3R3d2R0x6aFZDbXV0eGE4TFJJMVRtRGhVd1JJTXBjZnpXeEpkTU11T2VR?=
 =?utf-8?B?M255SDFld2hhT3hIUHJGM241K3FLbExSaktzN2RrRWVtdHR3bnpVNUNRbWIy?=
 =?utf-8?B?aXRLZG90a2ZxbnMvZHVlWFVES0ZibUVjeHpZNnEwNGtNNmdTVTgwWERHTnl3?=
 =?utf-8?B?MnVrRkt1eW84QllDdHpreXd3SUJTb3B6ZmdtOEQ4eXF2MDFOT1I0TkJNT0lE?=
 =?utf-8?B?VWlKMkpCbFc0djBrYkQzd2tnZm9qaHdEMWN4ZUNkR1VDbGMrNnFIQjZqaFBF?=
 =?utf-8?B?bWorWnNhbE1OU0NTYkhray9SdkFZanh1RCtLSmtjZjNrYkhhalg5REsrb3Np?=
 =?utf-8?B?RGQ5L2QzVll3VU40dnE0ellZSmsva3BNSHlIa0VPQ2hkYTFVNFlpRVdReVor?=
 =?utf-8?B?ZS8vSEdiMHRXeVFaVkhFMmhKTWl0RkhMZ0VsVGJMUG9qcHhRVVR3Z2I5d21r?=
 =?utf-8?B?VVY1Mmw0elJPWk9sR3NjUVYwZG1ZMmVyaXVXTUl4UmhkbEwxS2s1QWhQa1dr?=
 =?utf-8?B?dWd0YVlEa3YyU3ArWlFMVVNRd0txeDlacUtIaGtlNEZISzRsK0g0Q21zVjVU?=
 =?utf-8?B?M2NTUUF4NzA4ZnZPVjhiQVlZbjRXaVZMUmxldWEwVHBpb2kxYjhVNlJYenZp?=
 =?utf-8?B?NzVIdlpSamlzdGlnVWtTOXJUb3pKRUlIS2tobUhMNjhDaWpZWFpiYTZKMCtP?=
 =?utf-8?B?Wm1SK0FkeGs2K0FDd25uSVJ6Y1hNN2M4QjdoNDBkeEhEZTd2VE5NV1dyOVZj?=
 =?utf-8?B?UG1VZll1NnZhaGxsZ09kbW9aaGJ0cm5nekJ3NHZaNEpqYnFmaElFQ1pNR2tz?=
 =?utf-8?B?SVlRaFFGV2FEcC9xOVdyZ2puWTNlZEJ6MHM4SGRRbmlpWWVaTGNuMjAvb2VX?=
 =?utf-8?B?MkF5Y1ExVDBCeFQvbS9pbHVPTFZPaHFRMGFHMXY2U2ozRVlLTUJ0M2NTVmxv?=
 =?utf-8?B?VWFnUTJZcXNvU3A1QnNqeHhrQTVwR1JvVGRLc3lsMmVtRmU3THZaNm5lbmNO?=
 =?utf-8?B?RnRzci9hRmtybzlheVJwWHppLzdkSmNRZ2o4ZlhWV3ZsSzVQUzNLYy83OWZi?=
 =?utf-8?B?cjdTV3Y1T3c3anVvOVhKb1dJblp4TFVpc2lxcWNtcGlrQzFzRTZNUkRJWUJt?=
 =?utf-8?B?ajZqVFNITVR1RjdPRjR3K04wMXQ0ZUs3MkhjZ1pqR3NiZVhVYXlPMDdmZUln?=
 =?utf-8?B?QTlXRFNzL3BTQStTRmJVcnRtNUJRYTlPc3FCT2tyWTF2cmlOREN6NXRWdE5l?=
 =?utf-8?B?VmgvcEU2V1hBM3ZHUUZ4NTZ1b2xmbG1qK1ZyNEdTR3BQVVlIdFY5NFIwUEll?=
 =?utf-8?B?MkRUTzZ5dEFuaDV4M3M1THRzY1N4bnZFWEF6TkNOakhOZC93ZDJ6L0JiRStR?=
 =?utf-8?B?Y2dVVnVCTHJ4dUtpbnJoVkRWRDhTM3ptcDdYTkxmYXN6dThJc0paZ1h2anJh?=
 =?utf-8?B?ZUYzcFU2TkY2a2JqQ3o2a05MLzU4bkFWYmJIL3RVZTBXME9nb0pGMmJUSEFi?=
 =?utf-8?B?dmdBNUtZWWdPcmt4MnVvUmFQQjdRME00QVRqd295eHlGOWhBUXNyQWdJVkc0?=
 =?utf-8?B?YU9ybzd4TXkrTzZYNWpZSW9US3ZxbVVTUDVOcmduanJhcDg5UXNPemdsNXFO?=
 =?utf-8?B?eFd0UkJzTWxzWGdVTkduQ25jSStQbXVrc2RjMk1CWWF0bUZDMTdwWWI0QlI1?=
 =?utf-8?B?Kzc0Rkw0Rk1MNGpSVEp6MW1GL0NzNFpyeEFRMXIyTnN6UTBHbDFvTlpUT1JY?=
 =?utf-8?B?OVA2NFhva3Y2Q3QxQlZuM3ZMeEJVc2gzRzRyL3dFdnRsVmIxT2JRQzFyaVNV?=
 =?utf-8?Q?Xx3Z7upPRxhBqmAkV0gP5OD1/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1bd29c-99ff-4495-eeb3-08daaba4c30b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 16:22:16.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NIbY2wZXjKlKFzlmdZFYFmFHSor9yvQZA4CO2vq2tthVW6AbYMAjTGAOOCDW8WKPaVOhgk5ZyWxeJP69sJOLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6723

On Thu, Aug 18, 2022 at 03:03:33PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
> exclusive - only one of them can be enabled. By default, 'intel_idle' driver
> enables C1 and disables C1E. However, some users prefer to use C1E instead of
> C1, because it saves more energy.
> 
> This patch adds a new module parameter ('preferred_cstates') for enabling C1E
> and disabling C1. Here is the idea behind it.
> 
> 1. This option has effect only for "mutually exclusive" C-states like C1 and
>    C1E on SPR.
> 2. It does not have any effect on independent C-states, which do not require
>    other C-states to be disabled (most states on most platforms as of today).
> 3. For mutually exclusive C-states, the 'intel_idle' driver always has a
>    reasonable default, such as enabling C1 on SPR by default. On other
>    platforms, the default may be different.
> 4. Users can override the default using the 'preferred_cstates' parameter.
> 5. The parameter accepts the preferred C-states bit-mask, similarly to the
>    existing 'states_off' parameter.
> 6. This parameter is not limited to C1/C1E, and leaves room for supporting
>    other mutually exclusive C-states, if they come in the future.
> 
> Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
> to disable C1 and enable C1E, users should boot with the following kernel
> argument: intel_idle.preferred_cstates=4
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6
> 
> Enable C1E (if requested) not only on the BSP's socket / package. Alter
> command line option to fit our model, and extend it to also accept
> string form arguments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Also accept string form arguments for command line option. Restore
>     C1E-control related enum from Linux, despite our somewhat different
>     use (and bigger code churn).
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1912,6 +1912,12 @@ paging controls access to usermode addre
>  ### ple_window (Intel)
>  > `= <integer>`
>  
> +### preferred-cstates (x86)
> +> `= ( <integer> | List of ( C1 | C1E | C2 | ... )`
> +
> +This is a mask of C-states which are to be used preferably.  This option is
> +applicable only on hardware were certain C-states are exclusive of one another.
> +
>  ### psr (Intel)
>  > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
>  
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -82,10 +82,29 @@ boolean_param("mwait-idle", opt_mwait_id
>  
>  static unsigned int mwait_substates;
>  
> +/*
> + * Some platforms come with mutually exclusive C-states, so that if one is
> + * enabled, the other C-states must not be used. Example: C1 and C1E on
> + * Sapphire Rapids platform. This parameter allows for selecting the
> + * preferred C-states among the groups of mutually exclusive C-states - the
> + * selected C-states will be registered, the other C-states from the mutually
> + * exclusive group won't be registered. If the platform has no mutually
> + * exclusive C-states, this parameter has no effect.
> + */
> +static unsigned int __ro_after_init preferred_states_mask;
> +static char __initdata preferred_states[64];
> +string_param("preferred-cstates", preferred_states);
> +
>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
>  static unsigned int lapic_timer_reliable_states = (1 << 1);
>  
> +enum c1e_promotion {
> +	C1E_PROMOTION_PRESERVE,
> +	C1E_PROMOTION_ENABLE,
> +	C1E_PROMOTION_DISABLE
> +};
> +
>  struct idle_cpu {
>  	const struct cpuidle_state *state_table;
>  
> @@ -95,7 +114,7 @@ struct idle_cpu {
>  	 */
>  	unsigned long auto_demotion_disable_flags;
>  	bool byt_auto_demotion_disable_flag;
> -	bool disable_promotion_to_c1e;
> +	enum c1e_promotion c1e_promotion;
>  };
>  
>  static const struct idle_cpu *icpu;
> @@ -924,6 +943,15 @@ static void cf_check byt_auto_demotion_d
>  	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
>  }
>  
> +static void cf_check c1e_promotion_enable(void *dummy)
> +{
> +	uint64_t msr_bits;
> +
> +	rdmsrl(MSR_IA32_POWER_CTL, msr_bits);
> +	msr_bits |= 0x2;
> +	wrmsrl(MSR_IA32_POWER_CTL, msr_bits);
> +}
> +
>  static void cf_check c1e_promotion_disable(void *dummy)
>  {
>  	u64 msr_bits;
> @@ -936,7 +964,7 @@ static void cf_check c1e_promotion_disab
>  static const struct idle_cpu idle_cpu_nehalem = {
>  	.state_table = nehalem_cstates,
>  	.auto_demotion_disable_flags = NHM_C1_AUTO_DEMOTE | NHM_C3_AUTO_DEMOTE,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_atom = {
> @@ -954,64 +982,64 @@ static const struct idle_cpu idle_cpu_li
>  
>  static const struct idle_cpu idle_cpu_snb = {
>  	.state_table = snb_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_byt = {
>  	.state_table = byt_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  	.byt_auto_demotion_disable_flag = true,
>  };
>  
>  static const struct idle_cpu idle_cpu_cht = {
>  	.state_table = cht_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  	.byt_auto_demotion_disable_flag = true,
>  };
>  
>  static const struct idle_cpu idle_cpu_ivb = {
>  	.state_table = ivb_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_ivt = {
>  	.state_table = ivt_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_hsw = {
>  	.state_table = hsw_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_bdw = {
>  	.state_table = bdw_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_skl = {
>  	.state_table = skl_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_skx = {
>  	.state_table = skx_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_icx = {
>         .state_table = icx_cstates,
> -       .disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static struct idle_cpu __read_mostly idle_cpu_spr = {
>  	.state_table = spr_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_avn = {
>  	.state_table = avn_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_knl = {
> @@ -1020,17 +1048,17 @@ static const struct idle_cpu idle_cpu_kn
>  
>  static const struct idle_cpu idle_cpu_bxt = {
>  	.state_table = bxt_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_dnv = {
>  	.state_table = dnv_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  static const struct idle_cpu idle_cpu_snr = {
>  	.state_table = snr_cstates,
> -	.disable_promotion_to_c1e = true,
> +	.c1e_promotion = C1E_PROMOTION_DISABLE,
>  };
>  
>  #define ICPU(model, cpu) \
> @@ -1241,6 +1269,25 @@ static void __init skx_idle_state_table_
>  }
>  
>  /*
> + * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
> + */
> +static void __init spr_idle_state_table_update(void)
> +{
> +	/* Check if user prefers C1E over C1. */
> +	if (preferred_states_mask & BIT(2, U)) {
> +		if (preferred_states_mask & BIT(1, U))
> +			/* Both can't be enabled, stick to the defaults. */
> +			return;
> +
> +		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
> +		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
> +
> +		/* Request enabling C1E using the "C1E promotion" bit. */
> +		idle_cpu_spr.c1e_promotion = C1E_PROMOTION_ENABLE;
> +	}
> +}
> +
> +/*
>   * mwait_idle_state_table_update()
>   *
>   * Update the default state_table for this CPU-id
> @@ -1261,6 +1308,9 @@ static void __init mwait_idle_state_tabl
>  	case INTEL_FAM6_SKYLAKE_X:
>  		skx_idle_state_table_update();
>  		break;
> +	case INTEL_FAM6_SAPPHIRERAPIDS_X:
> +		spr_idle_state_table_update();
> +		break;
>  	}
>  }
>  
> @@ -1268,6 +1318,7 @@ static int __init mwait_idle_probe(void)
>  {
>  	unsigned int eax, ebx, ecx;
>  	const struct x86_cpu_id *id = x86_match_cpu(intel_idle_ids);
> +	const char *str;
>  
>  	if (!id) {
>  		pr_debug(PREFIX "does not run on family %d model %d\n",
> @@ -1309,6 +1360,39 @@ static int __init mwait_idle_probe(void)
>  	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
>  		 lapic_timer_reliable_states);
>  
> +	str = preferred_states;
> +	if (isdigit(str[0]))
> +		preferred_states_mask = simple_strtoul(str, &str, 0);
> +	else if (str[0])
> +	{
> +		const char *ss;
> +
> +		do {
> +			const struct cpuidle_state *state = icpu->state_table;
> +			unsigned int bit = 1;
> +
> +			ss = strchr(str, ',');
> +			if (!ss)
> +				ss = strchr(str, '\0');
> +
> +			for (; state->name[0]; ++state) {
> +				bit <<= 1;
> +				if (!cmdline_strcmp(str, state->name)) {
> +					preferred_states_mask |= bit;
> +					break;
> +				}
> +			}
> +			if (!state->name[0])
> +				break;
> +
> +			str = ss + 1;
> +	    } while (*ss);
> +
> +	    str -= str == ss + 1;

I would add parentheses to the sum for clarity.

> +	}
> +	if (str[0])
> +		printk("unrecognized \"preferred-cstates=%s\"\n", str);
> +
>  	mwait_idle_state_table_update();
>  
>  	return 0;
> @@ -1400,8 +1484,18 @@ static int cf_check mwait_idle_cpu_init(
>  	if (icpu->byt_auto_demotion_disable_flag)
>  		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
>  
> -	if (icpu->disable_promotion_to_c1e)
> +	switch (icpu->c1e_promotion) {
> +	case C1E_PROMOTION_DISABLE:
>  		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
> +		break;
> +
> +	case C1E_PROMOTION_ENABLE:
> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
> +		break;
> +
> +	case C1E_PROMOTION_PRESERVE:
> +		break;
> +	}

I find it kind of weird to user a notifier for this, won't it be
easier to set the C1E promotion as part of the CPU bringup process?

I see we also set other bits in the same way.

Thanks, Roger.

