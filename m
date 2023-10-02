Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5A7B561B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611612.951154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaj-00020n-T0; Mon, 02 Oct 2023 15:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611612.951154; Mon, 02 Oct 2023 15:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaj-0001xo-Q5; Mon, 02 Oct 2023 15:12:13 +0000
Received: by outflank-mailman (input) for mailman id 611612;
 Mon, 02 Oct 2023 15:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKai-0000iK-K0
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f0f17f0-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:12:11 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:04 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 15:12:02 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:02 +0000
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
X-Inumbo-ID: 0f0f17f0-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6gHhxFy+J8280ZMPe8YdCojqqUzWecDthtEiavpBLrU=;
  b=Y59ob4G16EYbHfvqLg+yIAJef5XjO92f/oHqF6Q7xdfvnuJ+Oh9ZmHan
   Gzu5kXxFNStrOfX6Vjb3SXjYuK74Zcymqc9KJjHGds6QLBil/O7nghUF5
   ca5L6YhUv4FwVSzd89t5NmJCj6/BvQRH8tyRspeoDj+3fINrIG60JY8X1
   I=;
X-CSE-ConnectionGUID: vwv/yUlCSAChbpnQdCPfaA==
X-CSE-MsgGUID: it33cAXiTQ2FyjIh9QvMYA==
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 127150636
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:SnCLT6pNW2KxtPo+gMuvVi/OXF9eBmLvZBIvgKrLsJaIsI4StFCzt
 garIBnXbveON2X3eI90at7lpB8Ev5SDnIAxTwVvqiA8QykQ9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzyNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC4ScFeSuuad+5uQSuN0gP0vB/HlNapK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhNTeDgqKU06LGV7m0PU0YdfGu6ncDjpF+8etIOE
 lIxywN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc2SDowx
 xmWltXmLTV1tfueTnf13rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseIa3k9n0FDfY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN7AxjbYqhT4Wt4Erc67BLK4Pxc7Wal
 H0Nmszb4OVQC5iIzXWJWL9UQ+3v4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:x8Rm563EYxJwQqK48Jpq2gqjBLYkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO/f6gylNyri9vNMkY
 dMGpIOb+EY1GIK7/oSNjPIduod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3At2NXu2olz6tktoaObBqAaMnmUd46bDrM8XP7GGa?=
 =?us-ascii?q?TCWxxToSZYmee8Yoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Atn60sQ/c0GPDktsl+S3FFlSQf8Z0uP+lIXAMrax?=
 =?us-ascii?q?cldiGFCwhAim4vR3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="127150636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjL+MVsLPPengiOIOnasL8CE/lGTyGQE/wjz2pqvGx772wKtMEHtX+StBgpCsyXvqJd4NZJk/MOsNIQFLPofvAdChEzpnHkKCuFLl9Crl858Vu8rDsZGDL+rW/r8OrchBHJtA7VYsW3w8D7UsGUwyjcI1qI/c5HUMaGfY4RMnD/gWe3Ygi5WYRdTYCY4WSC3e1sOTJaIkX82sjQKxLbZyhplzZFs7/Q8UgmYCvP7uoLweny3/k72xtf5XkS29QJk7UW+FSgxHs/vip8dx/33wn7wjQ2TMN2RbOLApWrXcZqwt82aOq6gRDhXW1PnQCGJX9C/Y8Vj+U4XuCIKrbc35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0a+M4UUU+XHTQe2PaZicm+9CI7a7rFkdkSd/BDJVyU=;
 b=Bs6UGNs7pkwIc9mdtd68DosxabGM8Zv9JBKhZaAP4YT/uSga/PtdlE8lAFBigVNRaOUBwjRhXVZqekIuIoI0bCfa0UM71c5nX24gzeVpYJjXWQ1m4GHyw/zCn/bQYkp0OqBzMR6GDt3ACCpfH1D3xDSAfNFppjuJ4olUgdRlEEcgsuA9HdsjWouoZ7Zm0Y6m8zZUm+Z5uEoWlZ0ynsEeLEQEYLHhvjAR8svZcMh4tfCR8adPnsbEaWsCLXjVBpUYtk+W2UQbHW6VHiRZXcoCtqeDj1nwi8zjqb+/PlxPhPRy1oYEUnw0O/FIuI2s/moUrMzGmlipNg1aMJaZ7kyYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0a+M4UUU+XHTQe2PaZicm+9CI7a7rFkdkSd/BDJVyU=;
 b=J7CENvX5CvT4seag4bMLif0sdYaNa/XMUUMh0X3oHafI5aEtF4oESkqTwNMydwg78EbgSJ265dAMvpGEtQrwSe+LTb1jlPfzXvZvBeRhMnUJWPTU5O8HHElDXVMcUtHqPVrHYhQTTRYhWGHJWQdH1SqzpU4iiZKAn5Ukn2sW1Pk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 03/10] domain: GADDR based shared guest area registration alternative - teardown
Date: Mon,  2 Oct 2023 17:11:20 +0200
Message-ID: <20231002151127.71020-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::14) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 38be95c2-ebbe-4ce0-ef56-08dbc359ee0c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q5IIaaKWvl1P4qfTeIXDxiToucbhAN4CPKbvvwn0fMRamBr7CdV0b52axDJDov1mPrR0rGrBaWSzhGXja3RDgDI7JJNwSsOz2mdt4Y9vEJuGNZAhBwCr9O54OnhS9I11TIdUY/iscDU76Zt9qz2WutCpMMHlxfzqu/zCJj/NVwv0L3zd46KvC1+T6LnY8F+/okGCsQ3rA6Ov7g3ynujhsALABVHXGTW50vxW2+KZHmfcj46Od6kxBdr+9ETbA4KpPgSyy+3nrpMvFajnrf4q/6aqDDF596ikQGgjNd/tiHrs2KZYnCsUTeBjFRVJXO2cgIqdckZEWaE6qWQdUvv1BIOb37PnUABcMJvr6gbpECU3lHZMSNWljRMvd6qku02R9p4hXAyHMKGW0neH9oW+n5Pe+Y1lmHrv8WIA2KZ5tx/Udvq13uNCpmjeMTZ1jyJRdIXHfsoqzJnTHoqm5MjabY2kbxUYpLPsIC1oXWsVsozOBithn5POfCKh5slO+wwKahAdhY2Mhy6yyINgRsDldWhIwjVH4u3ein5W5hMcTW2+Yz3BpMRaUK1gGXz52rLR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4326008)(8676002)(5660300002)(8936002)(6512007)(7416002)(478600001)(6666004)(6486002)(2906002)(6506007)(26005)(1076003)(83380400001)(2616005)(66476007)(66556008)(54906003)(316002)(36756003)(41300700001)(86362001)(82960400001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEIyeG5qOXY2VUd2RndUaFl1WmFpZDkrekhOdEFneGxsV0lidUVBM2VVZjht?=
 =?utf-8?B?aXRzOGRwTHJMRVczNVZNSTV6SGNzUXpJZHZtSDFKNTdPQWlrVHNmVWQxV0Rp?=
 =?utf-8?B?TmNpaUNuckpsSE9uTUV5UGFzbm5sMjNSbWpTcXlUaThWL0YzRTdGZ2U0RW5C?=
 =?utf-8?B?aUxibThaUy92TWNzUXBnbWlrYVI2clVKcldyODEzeVB4OU1RM2h1UnE4dzNP?=
 =?utf-8?B?VmY5bjZ6ZTJrRmVLSCtQbTBWd1lhekdnZVk4b2h3cDBvczBTQ2ZjTWlqeVZO?=
 =?utf-8?B?SUQ2dEpzTWxVVlR3K3pyYzdvU3lMUDZLbU9SUkd0MFRzbGhtYTZjdzJzVWZj?=
 =?utf-8?B?NEhqS0R3ZnJ1L0lOY1JROTNuMjAvK1VyMThHdmtnQk9ObkgzK2ozdzNZSUFk?=
 =?utf-8?B?MXkxaWpLVG9ubno1RldyemNMQzAvZTdHclMxUDk4NVArWEsweGpTSU80Rkpl?=
 =?utf-8?B?MGtnL08zbVVoaW0zdzdxb1VEcG5nelF3U0dPZG9rcnFyQ3BISWRNbEJQT0pO?=
 =?utf-8?B?d2tTVWxhZ1k3bUxLWnl5d1FTYkl2Tzd1b1daaGFYOFA1MUYwRVgwOUVkQiti?=
 =?utf-8?B?STM5ZWQ1UXRZWjY0Q3RHOHJKSngwd1hHMjVDL3A1STdYZTZNSGljeHgvTDRP?=
 =?utf-8?B?c0kzYzE0eitQS3lDSkhoWU5IMFpMMkdBR01SdktvUlFTcldUeWo1d0s3dWhC?=
 =?utf-8?B?MHVuQUlqM0ZFYlpoY1ltQXZ6MDdpM2o5SUw5dTF3d0Jla0V1V3RBc204QUVr?=
 =?utf-8?B?ZUo1T1NPTUV2ZnhyWHJtNTI5YkszUTdLMHcrYU5kSk5ZbWZ0Z0cxYmIxZUN6?=
 =?utf-8?B?RFdkeUhydGdNVnFxTGJyT0g1NytFSDVjQlJUdGh6VXRMdlJoY0JNckszcDlJ?=
 =?utf-8?B?WTl1MCsreXdRZU1Rb3BxYTc3ZG1wT3FuS3NSalNNUnlNN3p0QzJabHRIeTAv?=
 =?utf-8?B?OWtMcEkrZnkxNHdVM2E0RWI1MEFnS0tyUGs4UFllbFd3ek05VEJQVkIzM1lZ?=
 =?utf-8?B?UmhCd2lQYko3dEJmaUxCQmFCMitlS2ZQU2JNNFo4eVl3ZzAyNTdweFA0ZmM1?=
 =?utf-8?B?Y2RaZjE0ZjZycG83SVdpc2xoekZLeE5LMjVicmNibW52eUFIRVkrYlZlWXlK?=
 =?utf-8?B?RnFKY3g3dzhwYTN4Q3Zwa0V3ZXVhdVFrcXo3Snk2MjRKTG9ZbVhGK214Q3cz?=
 =?utf-8?B?TE9OOEZCdGFnUTJRcVFqMFU2RzJzMFB4aEFUbnJiTlY2TVhHMkJXNlZKNmJM?=
 =?utf-8?B?Yno2aWFwSGtPTXB4cEg5VHZpREZGaXlseStLNkI5UGNmZW42YnFwekM1Z1gz?=
 =?utf-8?B?Q0FBOW83VjFwdm5oUVVva0VISkFZbTRWbTJ3bWtQSmhiM2VDSnpYWFphNHFp?=
 =?utf-8?B?WTZCK0ZyNGk2NnEvUG54ckN6RHdPYUUrakNiK2dOTnV6WFN6VDloT1NlV3Zj?=
 =?utf-8?B?MGk1TUthY2tmT2xIOUpWbzJPY21aUWxhOUNsT01lSDlHYUxuMlJ3WFZmQ2dT?=
 =?utf-8?B?NWozSGJsYkdTelNGbk8zOC9yNFFsLzdWcDZUK2tJNDBteHJsUXoyVkZTUDM3?=
 =?utf-8?B?WTcycTAwdjROemJiRWhkc0QvaWlTNEEvVGI3ZVY3eWlON0FsaGpGMzJiRmk4?=
 =?utf-8?B?cVRLcXlOYk1pdDYyWkpSVXdyZ3p1Z2c3WU1ONUZSWGFzVTlRbGNOU2pCM3hX?=
 =?utf-8?B?bWFQWU56cHNRUUo0MTVDcjlGZjZ3VUpsR0tWMmFLanJSazZYWmdINStMK245?=
 =?utf-8?B?dHBZWWdTd0o5TTBSUDFaZ05HOTlIVjNLRTZDVlBSNit1ZmtxQ240VXQwQnRI?=
 =?utf-8?B?bWRFaFZnSko5TkExQXM3UXJ6Z0ljVzluSjNHTFh2MUUxNWxGTzhwUWpITDRD?=
 =?utf-8?B?T0RVSzB4cGp3dmtVTzRxbDdGUlRIbm1qQWU1MG9xLzNjZWpJTS9scHp2c05I?=
 =?utf-8?B?ZzdvMWIrcG5WQUpqYVQ2L0hFYzRPWVNqTW9iSTMzaDJKd3hwZkdJMEJpR0Yw?=
 =?utf-8?B?K1ZJTUd5SFYrN1IrbzB1SnJ0T3hWTi82TFlUQlllQUZvWURGbm02eUdwQ3pL?=
 =?utf-8?B?dFo3S0FldWJ1aGhsWTB3Mlo3TXREdXJXRzhhQ1RCZzFRMVI3NFpDeGdEblV6?=
 =?utf-8?B?ZkkxYUs4RGVnZThISG51MStHZmFNQkppSTR1eStsaStIRTJPbElyVlB3eVc2?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w5MnxePAS1sT3w1Bj2mpJhDfvCjvss0uhm5c0dWOgdYtPilkaUMJjIAnuh4Ih5R+7Bs3Kmj/JPtMyT7hsak7g+LDdsNPgeU3s4+jRq2Emdl31XmeXicaCu5t0ckCw3inYFDsqzobwrK5cogyRrlaYjbstpBK7XyEWRZlV7JZH4Y5aYbpHZexIM5BXGEtm1zYTg/ZuReJwflaZ4CZHxSzgerlK29ENraBpsGVEfsfnd7T3SHdB63V94DVTuIeOvjueXn9PceVQ66/VSLi2Fzm9hmRCL/oGgsnWwhUW6FkO7WdWfdf999KWxHn3sJiBH2I1xG2o2/mdYsZDaRr3ELK9u7bwCCQA0rlJGRl72jx8KJywLNUmT3nWsvA2Ff80L2lblzBwMh+1mbFjFgomFeQpwOQ6VxbridKSdgiGxg74Az/OtXCOA3cmnU36XXCCccNZrcUyaaQ3H83Yn6AQTHkhdUdqFrHcJWrfUudARnGEReKOAeIbhMVCdttWEX8yeO+pJDiXLI6Eqb4uF4uP1rKZL+f2tzk/zOcZcIyFeYa8d4+SRV6/Xz9Vc0cYZbHisyII/mcd3+cmP66zvv0lZxikeU/FRAxr8I/Ewd9u7al3or+53nImlMu5yg7kYNzwgCliApXjtOFFsh3+SzPaKMgUzX+UvLBoNiBevUmAE3YaHmJzPnib5Hsf/AWLxD6ZfsAid/pczddvNW4CYe13xmkyDWozwBXtYXEut+YUf5uZlpyCjCoUeSmaSTFGAh48HejFjvBw6E3cMqgFhrnYawctOPkzpeOD3bhWQmXqmGE+EHuIrermALoWFslw1KHoL1wpTOkX7UCfZSoOFAXuRyY6ZH6V1OdQXhQ7G3Qc8xItZmfZuN9ih4JbtKazPJ3glGXpSXSItxsh8H7FssnO76X4A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38be95c2-ebbe-4ce0-ef56-08dbc359ee0c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:02.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQC5AlwV2Yj4mpkgh8W/837aFeWHPvCLpeAxy8EVwUWnSYBFv122Y6qTisJCUNOkaz9615DThZT5parXoV7RJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

From: Jan Beulich <jbeulich@suse.com>

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary domain cleanup hooks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c             |  5 +++++
 xen/arch/x86/include/asm/domain.h |  1 +
 xen/arch/x86/pv/shim.c            |  4 +++-
 xen/common/domain.c               | 17 +++++++++++++++++
 xen/include/xen/domain.h          | 11 +++++++++++
 xen/include/xen/sched.h           |  1 +
 6 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 645675d87d9d..9d352defa25e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1024,7 +1024,10 @@ int arch_domain_soft_reset(struct domain *d)
     }
 
     for_each_vcpu ( d, v )
+    {
         set_xen_guest_handle(v->arch.time_info_guest, NULL);
+        unmap_guest_area(v, &v->arch.time_guest_area);
+    }
 
  exit_put_gfn:
     put_gfn(d, gfn_x(gfn));
@@ -2381,6 +2384,8 @@ int domain_relinquish_resources(struct domain *d)
             if ( ret )
                 return ret;
 
+            unmap_guest_area(v, &v->arch.time_guest_area);
+
             vpmu_destroy(v);
         }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c2d9fc333be5..e0bd28e424e0 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -669,6 +669,7 @@ struct arch_vcpu
 
     /* A secondary copy of the vcpu time info. */
     XEN_GUEST_HANDLE(vcpu_time_info_t) time_info_guest;
+    struct guest_area time_guest_area;
 
     struct arch_vm_event *vm_event;
 
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 7e4bacf7ae40..f08b16bae2fe 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -382,8 +382,10 @@ int pv_shim_shutdown(uint8_t reason)
 
     for_each_vcpu ( d, v )
     {
-        /* Unmap guest vcpu_info pages. */
+        /* Unmap guest vcpu_info page and runstate/time areas. */
         unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->runstate_guest_area);
+        unmap_guest_area(v, &v->arch.time_guest_area);
 
         /* Zap runstate and time area handles. */
         set_xen_guest_handle(runstate_guest(v), NULL);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 304aa04fa6cb..76a4c2072e10 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -992,7 +992,10 @@ int domain_kill(struct domain *d)
         if ( cpupool_move_domain(d, cpupool0) )
             return -ERESTART;
         for_each_vcpu ( d, v )
+        {
             unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->runstate_guest_area);
+        }
         d->is_dying = DOMDYING_dead;
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
@@ -1446,6 +1449,7 @@ int domain_soft_reset(struct domain *d, bool resuming)
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
         unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->runstate_guest_area);
     }
 
     rc = arch_domain_soft_reset(d);
@@ -1597,6 +1601,19 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+/*
+ * This is only intended to be used for domain cleanup (or more generally only
+ * with at least the respective vCPU, if it's not the current one, reliably
+ * paused).
+ */
+void unmap_guest_area(struct vcpu *v, struct guest_area *area)
+{
+    struct domain *d = v->domain;
+
+    if ( v != current )
+        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
+}
+
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct vcpu_guest_context *ctxt;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 81fb05a64275..a6b22fa2cac8 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -5,6 +5,12 @@
 #include <xen/types.h>
 
 #include <public/xen.h>
+
+struct guest_area {
+    struct page_info *pg;
+    void *map;
+};
+
 #include <asm/domain.h>
 #include <asm/numa.h>
 
@@ -77,6 +83,11 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v));
+void unmap_guest_area(struct vcpu *v, struct guest_area *area);
+
 struct xen_domctl_createdomain;
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d8c8dd85a67d..f30f3b0ebeab 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -203,6 +203,7 @@ struct vcpu
         XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
     } runstate_guest; /* guest address */
 #endif
+    struct guest_area runstate_guest_area;
     unsigned int     new_state;
 
     /* Has the FPU been initialised? */
-- 
2.42.0


