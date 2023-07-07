Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6674AEDC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560389.876291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHivC-0006QJ-Nh; Fri, 07 Jul 2023 10:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560389.876291; Fri, 07 Jul 2023 10:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHivC-0006Nu-JW; Fri, 07 Jul 2023 10:42:42 +0000
Received: by outflank-mailman (input) for mailman id 560389;
 Fri, 07 Jul 2023 10:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHivB-0006No-EF
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:42:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd3b7742-1cb2-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 12:42:38 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 06:42:36 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SA0PR03MB5564.namprd03.prod.outlook.com (2603:10b6:806:b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:42:34 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:42:34 +0000
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
X-Inumbo-ID: fd3b7742-1cb2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688726558;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6lM6MWjgbJYRIedmI3NWFMD+CBeKc2Qq5H1BZDBbuaQ=;
  b=WPSdZoteGR11RxkGR0jy0musHwsBRfHB88GKADp8cTFeyILyIuyLMAVu
   lTp8To+SZM58RKqzomqQmu/WBTjfJPbBgiVW7R04LcE/3AeNpyQ4qd9ZN
   zESmQ+/tmniwATrALsvI93An4BcAtgjLJuemKaDXi6pDUCmgyL4C6IOKc
   I=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 115483587
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DPka6KoTq/sKviCDI0P6c323/19eBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBnTbP+CY2HzfNgkPNzkpklXuZ/SnddrSlM++SBgHngTpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzyZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD1UMFeSpaH1+r+2evtvvMYxPNnCPpxK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtPSO3jq6416LGV7kAaKkVRFkOgm6iom0Tka90Ye
 gstxQN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zvpd81hxeWFtJ7Svft0pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:kFG7U6qSilSytjsGCgWBI5EaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-Talos-CUID: 9a23:RZ7clW/oYS0ALXB7kPiVv0NNRIc0UD6e9nrdE127M2R7WK28S0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AH+f3TQwmL71ym/NZUv1Rr+OFvu2aqIinKhhK0o0?=
 =?us-ascii?q?dgZiVJCYqCzja3XOOfaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="115483587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T40JQgzmIeqs68Gww5ZZnKxP9HZEgIUSRtj6/LC1I2b1X4px7TSOGbGFNykrbB2BmYdYCK+XxYFfeKRpg2bcJpJQoRyjjWH5SOJEw/5SBeTH+YaGb2PvA9E3SlZUrGgn32EsJNXgkIqN/dzSqxSBeeOJKx+Toni/iAW0wBquLxzUt/lF7h6UGudvITMzIpxXkGcTTR3EeEl0LxzpHDctHr/5ir/eJVizAKndCrm8lE8t8TOp2UyY5ekZqUyDMj6zi1xMV7Gzo9GmHKkk807udXrehfj7lvyM2t0azlblxeFvINf6L2SF6tHHjzcDCCAJ1dPVWXFwc5PHPj39mWNvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZJKvhsg11+DsODq7tJU0EgDZ72sQ8MusxpZkfbhiK0=;
 b=GTnsmymz+A135UXF2MrGy4b/GaaJO4hgo+smrHud/l691n0mha5pIyEoURClQVqt30KYw3ja0/i47+pGfOgShN3pani3bxhg9sWx30rYcPuCaoedUobHmc4c4qsh99go47zicelpaLFsJn4k7QtLgcSXTlcSzTRGlfMjxzmEtHc+ahI1dEFOBF7mW5QsdfOmJoeZsDLc70piAXEiFm4ZOYF8CuhU//U6wG3B4bSuDSHUVWlqyb1513vSd1jmkhLlbTZf3O+hpkR4ov9l2lKHllGwhWEJ9GkxyiPE7uunNgYGE6eus3zNRdXaJ2GepFhJ81Phka7irnudnn9+Q3NoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZJKvhsg11+DsODq7tJU0EgDZ72sQ8MusxpZkfbhiK0=;
 b=wrdS/GJk4KYymB1Vb7WaSvjMhb75M+J9Dt/XsTyR7yzZhFKK+iQ4qxdp69bZ/VxAIfqyPsIA0aV2UT4gQK98qorn5m6APO3CDKwWQmSSZ3jqp/emPD5RnnYmPM60zjQQlkU/33QYfOBeYDCbz0YijaCyxFo6O8NZikTwiiNqetM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 12:42:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/3] multiboot2: parse vga= option when setting GOP
 mode
Message-ID: <ZKfsChflOUtYQCpk@MacBook-Air-de-Roger.local>
References: <20230705114741.11449-1-roger.pau@citrix.com>
 <20230705114741.11449-2-roger.pau@citrix.com>
 <47cc5f67-973a-2095-932f-6ebea2d3bd9e@suse.com>
 <ZKflLxsh1AKyvPOT@MacBook-Air-de-Roger.local>
 <3bfd9a21-e4e7-2d9b-8a40-8b77c80e4fb7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bfd9a21-e4e7-2d9b-8a40-8b77c80e4fb7@suse.com>
X-ClientProxiedBy: LO2P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::29) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SA0PR03MB5564:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2b3e9d-07b0-4784-f81a-08db7ed6df59
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qeD+Gjw/ElIQcFzPiVtjZmUAEczyUhok+fSK57GIvVmFrgYj3X/0V6bGxVGDGCEsz21pLnyw3cm/0Q6LEn+j5MWLr87e0hJRXAOz4eFezX5N/3pPMre651TOedDsZiB+UR695nYtEDwK9RNTZpQJUeoYGqMGoeAv/z9e8pk+f5dIyt6eN55AU6MnYK6EXMFuWVfWQPXO1+jZ0m7K4/ZA4faPwBfsALDPldLC0cvBb0qcGEQhdw6INteEGDqjGGlnAj1ndQkvR8ZXUt87DYBPKBLwdW6Y9Lw8k5FHNGgkyTV5VNB9LjWYoQRGRMdeiiUywSk8xonfYTdQgDidrK/xvDJ4Wnc7Rd60EKHlLAu0vYRvHfJL9UFstU7fxPOp0JDU1niyP5+vSb9GamrTyGGjOeKpX4TAVfk3sWgVYY96l1oJOFGvDxe9sEbk4vaag1ezKkWzWCL60OWzEfTgT0ZdAG7FV5+uBgqYPuEQijCxOtXHz/uEhoRifM66wqlwOqo+O0jP9S5o17oWARAfW9V74j//kn0/wAR9IMWGSo9QbsZCDs6hgyXgiIQH9/QGJXm9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(478600001)(26005)(186003)(6512007)(82960400001)(6506007)(9686003)(53546011)(86362001)(6666004)(316002)(66476007)(66556008)(6486002)(54906003)(38100700002)(4326008)(6916009)(66946007)(5660300002)(8676002)(8936002)(41300700001)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXBpaDZMRXRyNHpocm5pMWVoWmZsVnoxcDU3MnM5TUJqNEkwMEFhdHNwNUtF?=
 =?utf-8?B?T05aNTVYSkZKSWRFUGFBMEUwbXhJMEh4Q3JaN0Rxb2RwUU5HRUI2cytmamZQ?=
 =?utf-8?B?aytmSDU4dUJyUytDVzhhdXFYWDA1VjZtKytsdFFndU1UN1ZlV21weTJGR0tS?=
 =?utf-8?B?NWRkbnFjQ1J3RHNnZWo0VFdYakZHbG5RczY5Q3RMYzVuNlRlbHA1bUd1TGdC?=
 =?utf-8?B?NGZjdTFkdkNRMlR5TjdiZVpabG1maGludkowRm1pdkk1NzBaTkNsMTFPakYy?=
 =?utf-8?B?ckFZLzlkV0FEa3dDeEsxbllSRGRKbnExbWd6YTNuNFFsUDlpOHNxeDVVeTFP?=
 =?utf-8?B?RTJ0Qjl6NnJtOWRmTVhKUWNnL09RNitjZDBWQjl0V2JBNU1hQW5oRGpKbXFa?=
 =?utf-8?B?cUNkeEtxRzFXQ2ZCbGkrZmxVZDRhTXJLbDQvM01IYkxrOWJVVEk2ZmxJM2tQ?=
 =?utf-8?B?MTltZ3JVcXU4VTVZUFV1RTdNb0pnbUREcnZPT3EvZE8yWTN1dkFqcy91YkJZ?=
 =?utf-8?B?QVBTUVczZEhWY01VL1p1d3NiNTlqc0cvdndZQXFHZHVJdnplMHBPcHZvU2lm?=
 =?utf-8?B?bHNKd1NYRS81RFlseFVaRVRaMHE0bE5WaVhKSm8wdGlSeDAydUhXZkxydUhT?=
 =?utf-8?B?MXljSXBqYnY1MlNtSVBra0JMQ0h6cCtPSlYrMnFxa0s5OS9na2FpcFNBTVR1?=
 =?utf-8?B?b1lOVVMybWxzUmw0VlhHUTVBY2poRkdqZ0I5V3FZaTFXMGQvZmFyVUsrcDNI?=
 =?utf-8?B?SHVPanJ5RXV5Kzk0VyswWGdkWWM1b0UwQitSK1AweURZaG41b293ckpxZi9z?=
 =?utf-8?B?MFFjQVg0a1EvNG9nZkM2VkFYZlNWM3VqZEpqVFdIY1FmMjJvcHhtUXR1WTI3?=
 =?utf-8?B?cWlVeHBoNHV0T0NCRkdPTG9oMjQ3a3pzVFlaZW9zZlduM1JuSVBEcmFoR3NK?=
 =?utf-8?B?VjV6a1hsRVMyemtrSUZTQ1pMa3RvcWpnbzhBbW1FYVp4VTFta0pKTW1wUmU1?=
 =?utf-8?B?STdQNkVNV2ZXU0pPcmJ0bDA2YWVpRHMzZzVKL01PVDV1WDNIN08rZFU4a0x4?=
 =?utf-8?B?OGZPTE9lRThtWVMrZ3lSMWJkamFLQW11cmZOcWtLZGxMdFlKTHc3RkVodDFM?=
 =?utf-8?B?L09LVHU1R0wxMFNETFRiN3BPWkQ5TzdGeC9CTGhhem0zQ1lKMytOTUlHN21s?=
 =?utf-8?B?UGFuQ2R6Z3Zhd3dzNCtiVk1HNjhOTHlQZnhWMjFpQ3BnUEJKUm1URmswbVdr?=
 =?utf-8?B?dTI2emx3RGdXazQ3QnIvSjJTQktDWndCMWNmZU9OVHY0VjIwUHFqazdiQnZu?=
 =?utf-8?B?bDVvcHRqUHNjak1JbUtTSUM5Z2FCdWF0Mll4ZEx6djA3SzJKbFdXOWdHb3hv?=
 =?utf-8?B?VU9Mb1hCRFBDNXpKcmNqekF0a2p6YThHODk5K2Y3K1I5R3dMRjF3MkFHM0Jt?=
 =?utf-8?B?V0g5aExpWDJNdzArV2pTWm5oSnU2Z1plV0ZoNUtTL0V0QXBPR3RHbFc0V0JU?=
 =?utf-8?B?M2tSSE1UYzlVaEp3eGhlNGhzcFZaSFhGOXRyRHpFQ2M0NE1lZ1pBKzA3cUJn?=
 =?utf-8?B?T0hZQkRNdkZhN3h0U2dFRDRxUFVGbGppSUlrZlpaaGRxdXZtRHZrTmxwRUxB?=
 =?utf-8?B?RnRDQktoK0lGVEoyQUpvdFRpaGxLZzM0ekIyWXcwUVRzcHlJaEhZUzJMR1Fy?=
 =?utf-8?B?SjdtSnFNalQzZ2dEOWR5MWZ2RFpnWjFYcDA0bW9RNnBPd2xCZ0NiNGxMbkNq?=
 =?utf-8?B?a1hMY1hTS0libXRmQjdFMzFxU1RtUEx0NmVtWlNCSmdtcHFXcUpZZVpPN2hO?=
 =?utf-8?B?UFpBNmRSZWNacFJCaWpIU1l1MUxZUUF4ajcvazFuUFRkNUxNSk1LbURLWENx?=
 =?utf-8?B?Zk9tLzl3S3A1Y3IybEhuY2RZWSt2T3JpZ2g3ZDNUNGlHMzBtMy9EakxjemMy?=
 =?utf-8?B?NDlKSHdOb2pxdU8zMGFGdGV3KzE3VEhhUURXWk13U3hNQkNrejlYeW4rZWp4?=
 =?utf-8?B?TXlMRllNZzhSYnpaOTd1VDBDOXFkTU1saTNoeHdRdm1EU0tqN2dyQ0g1Nk1s?=
 =?utf-8?B?QkRzU1FodGNueTQ3THBzN1MzWGlNdU9rVStBVlZkK1Qwb2NlYlBWd1VKa3pS?=
 =?utf-8?B?U0lmQjNjUGhzMVo1Wkdkd1RqQlZncHhyTm5HT3ZDRVluaEFQNWZxUmx5RzFq?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ql53PO+2/YxmgrgG6kKKP2EVi9+TpdkRCaMRuzR5wunA3zlNSznDPD6mDSxkNk0/OBePdj4tXvBaNkd3hsKq2DTrDbFpIEZKZlpVgfj6fe3p4ZK9ABTN2mZasXpZWPOr682GIoZbROvPfqt4luWMuMIadR2T8ImIaLIhjiHp3sJcu/pcNaCJJxxyz7SHVbSaTKlEfgQVBw+OuCdVtXh8LgSfFxwxt3le6ihDEbd68GtAA7szoGEFN4S1C88RlM+yAhEj7HZqRXmoaF5+X3N1F7umGobynIzsbaJIpFhY+qjX0+rbzuVP5zC9n+2bMPx0LUj2ybayJD4lqhsPT9WKQbebTInY1D+SlAClRswkf33JaeDDLX5zyru1H3H6vNtlzmZiqVuZfUC5vXtBwOHSxjLXL93UQ6ccp6NJ2J+l8OWFtOpHRGrE3d05rcaRXX12yIgttylf5pQilDatmjVXXHMGYTmZR3MH1/aKL/E+cAhRz9e5QGLTruwtfjnUKcePVCnsFiU0cvCeTyF7x1NSJa7RgsvE3jPOpoAG+cHLIXye3xVeAnplQ8Tq4APr0VnyA6NwpnY5UV3nbaIyb1qWpCNZFrEWlo20cBKe5s5eOSH2LNx8vF/HwRL6tyUFWX58YqAODtUgcBfZI9qA9FAH6qmbAog/h4co0SakZgfmELEg5/TUkSLQhFikrNuMLrRACSK31+1xB/t6CCSYO8qJFaSnzmFa4YEV/zju9AyYuC1ChlriS2uE+y532WcBL344gk+/IeMVwIkquB/NowrJ9w6twgoWSJcINTDJA+maY00NdkrQvxRFF/Bfn7+i+YD/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b3e9d-07b0-4784-f81a-08db7ed6df59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:42:34.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZL6GbVsqzUFOhueQkFYOpag6lRQaTth8RepUPMpj3kxXGv4yquGzu4Ojb1RgmpWERXff5gBKflK1Fdu4tpr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5564

On Fri, Jul 07, 2023 at 12:24:10PM +0200, Jan Beulich wrote:
> On 07.07.2023 12:13, Roger Pau Monné wrote:
> > On Thu, Jul 06, 2023 at 12:41:58PM +0200, Jan Beulich wrote:
> >> On 05.07.2023 13:47, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/efi/efi-boot.h
> >>> +++ b/xen/arch/x86/efi/efi-boot.h
> >>> @@ -795,7 +795,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >>>  
> >>>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
> >>>  
> >>> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> >>> +/* Return a pointer to the character after the first occurrence of opt in cmd */
> >>> +static const char __init *get_option(const char *cmd, const char *opt)
> >>
> >> Nit: __init and * want to change places.
> > 
> > Hm, yes.  I assume that placing it before the return type is not OK?
> > (static const __init char ...)
> 
> That's still in the middle of the return type then. Technically gcc
> accepts it being placed anywhere, but they reserve the right to change
> meaning when not placed appropriately. Recall that you may alter both
> attributes of a function (or variable) and attributes of types. Hence
> to disambiguate both, proper placement may become necessary down the
> road. And while it might be that
> 
> static __init const char *...
> 
> would also be okay-ish (albeit I'm not certain), that's still against
> how we do things commonly (i.e. a not written down style aspect).

Thanks for the explanation.

Roger.

