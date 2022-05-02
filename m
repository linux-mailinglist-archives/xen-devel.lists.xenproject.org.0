Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A367517262
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 17:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318962.538987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXqs-0001zU-7y; Mon, 02 May 2022 15:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318962.538987; Mon, 02 May 2022 15:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXqs-0001wP-4B; Mon, 02 May 2022 15:20:42 +0000
Received: by outflank-mailman (input) for mailman id 318962;
 Mon, 02 May 2022 15:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=deGg=VK=citrix.com=prvs=114a22fc5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlXqp-0001wI-Qn
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 15:20:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a83b9e9-ca2b-11ec-a405-831a346695d4;
 Mon, 02 May 2022 17:20:37 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 11:20:34 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4135.namprd03.prod.outlook.com (2603:10b6:a03:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 15:20:31 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 15:20:31 +0000
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
X-Inumbo-ID: 6a83b9e9-ca2b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651504837;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9IHSZv3VrMJDLhDfEaoQ4Rss2y1EMmvsxsBMllo85c4=;
  b=SysvcZQTYF8mgjSx/4YjG1fkh8SoBXV1OtI28wRUtVMPp9vVOF6KBCMD
   BbsVF4/C05Hsj7GhoXwiEShgqJFz0xECUX0n4HiEmY4m0FdoLoGZUQa5V
   cGfuTbkAkx0sSJWuQdvzFbychX7V4k6OQFVheiH2Mwrn13J8ALR1r2HEt
   E=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 72856731
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Axbc2atX/3aXGsBvV/frEwwxpOfnVCJfMUV32f8akzHdYApBsoF/q
 tZmKW2FPPbfa2DzLYgnb4jl9BsEuZbdzt9lTFM9+Ho0RHkQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17V4
 4uryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8PG4DTg/tHbCB8UAhnJ6gc4Z3gC1ew5Jn7I03uKxMAwt1IJWRvZcgy3LkyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4AAmm5o2KiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3P9fdpvDOKpOB3+IjrHoSKVPmpeeFEtF66+
 kXcwWXFXQ5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUHBBqlz6PV50OTADcCRzsYMNg+7pZuG3oty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1LUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:2G5w4qn9eiKCat44pX6XbykjxS7pDfOximdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhRYtKPTOWwVdASbsP0WKM+UyFJ8STzI5gPM
 RbAtVD4aPLfD9HZK/BiWHXcurIqOP3ipxA7t2uqkuFIzsaCJ2JuGxCe32m+wBNNX97LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HuVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW3zRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDBnfNAszOQoQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEK86JX/r1cop46zuNDd3B13Z
 W5Dk1WrsAxciZvV9MaOA4ge7rCNoWfe2O6DIqtSW6XZJ0vCjbql6PdxokTyaWDRKEopaFC66
 gpFmko/lIPRw==
X-IronPort-AV: E=Sophos;i="5.91,192,1647316800"; 
   d="scan'208";a="72856731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/73PCc3lX/nqVDqmLzheK9xYTfsjxQh4UqVttEj3/XQjCtWBTBXa0DMeQ7v/YQNFtKiaFu7xGEpjQGC+Td4ZcMsh5ttorxd0C8RtiSIklXUVEgh0zcwm3v8dg+YT37P3Kv8ormwUkoIu8zkMWp0+uynI6v1NhXWG716KLYVLiDVpqmhRpWXOgkU67wo9+RN0qAMgQpumwaY2yrkTblVn+dnG+ayIEUOxso7PuW+bnDvvR9fd39qNIJhQifdfBLyatWHiYxq8hXU2RasL0ggukUHMzrHqt7awYHLUaDRUbPDrdINSTdvLxIxndypWhlATl7fJTFHVH7Ne6rqemQAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIWelanqbp4RinFXdsKwb8IPkD2GS6socD99HZAMs4Y=;
 b=DVICLoyN6fcarufQEsjokd6S5eeDJhkih/bHvz/JZLE2v+1ryDwMhA3M+7YtnJCGpKHqNNbMBeyJ0Fh9ZsNac6yfKD2iBkUMsT9WdlFo6csyUTflrGcL2ueisofbV/3WthEwhmKeW/yWoZrjT8LHjGdXiJMdKSGyMJgALGD02Rv+x8wHlDlR87stpATncPWnx7pZNHDCcV3qPlZIzDu+Ijn3QGkhSLoUD0P9nEm6BYIqrrsjjtsr7EbOJVE4BDkj/2jpC4e7/MRyEE1puPDjxZsed/rk+vNy4uAHm/RrZ7BVhYAGKchz2jsCSCUsRSGZMptQwsbJuRBwXxcvOvtTDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIWelanqbp4RinFXdsKwb8IPkD2GS6socD99HZAMs4Y=;
 b=vaT1Gldezc9rTEZYEmHIA6+nRly2hv43oTsrRa7gPXLr8r0LRXHe1r8J2nb4Nb4OKr04oM4zgNu1stU6xFw0GDzrsuTT/UV4j+L3qBOKVBvX3OxOd0d5BcOpmixK4LxC7efCmMszRB1klR3263FlOVmgFFwpJ8Gule/kHkzrZ10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC] x86/lld: fix symbol map generation
Date: Mon,  2 May 2022 17:20:20 +0200
Message-Id: <20220502152020.19768-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0045.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f790ff0c-7028-4910-28c9-08da2c4f4b9c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4135:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4135659394B748817CE1DF058FC19@BYAPR03MB4135.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N3Nj4kvoD7Of1JVSY8MiT3LvXTZiT68OfzT76GKWWcSkIP2WxQQiJQhRFYNmGB7yWUJR2FKmJOOoGnkKI0cdI/UeihMu04l8CtSdZoPTFby/pj8bfqbHXTly8iJTw2hTR6PNHR+/gJCMcDZNjjMWJsgL1MH5z7X+Wx62Ok5LoIK6G19xB7i0GqjWxjjPNg3eLJwNpzsYIKrZiCIyzwxt6yleTSrnJ31WSiTRYBcVimUa0BxQTMZOzFDpvpIbJJ4xuRu5fAu46PaSCZI7P/OgHjQA3schgx3/q5XE/YgpMQpd3PbZFlU4DqwhKX9sXo020ksCCMiVCzcetpl8KS/WbEF1hqijgtl3FJ79dXSyslJ+DrTexj3FnwrfC+v7G4LtX1JHyY25JRuZPiHw6lkFNkd+9lBbfIqO2bEutx6i/tyCdt47Q4Ohf/12aSwE/VGsogqJNwGICauOk9w8BhZA0u42gzh7w7rVvYDxT9i2r5xXkkq82wuMyyNWg768rm7VZQiTSOqTINz+cwVcVDPsXcCG2+Z0MjcqzNjBXQCJ2tDYF3G38I7vOtxYI4BF2uQCiuoE2+nBfxwhGRtudxC6RKCjHOOeZuZKwlzmTK4qKYPSAyuu7yNiCNRA6WVu2KEqtWqb5BA8q5f2aPwuZs8A/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(4326008)(66476007)(83380400001)(8676002)(66946007)(66556008)(508600001)(6486002)(186003)(6512007)(2616005)(1076003)(316002)(36756003)(86362001)(38100700002)(26005)(6666004)(5660300002)(54906003)(2906002)(6916009)(82960400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2k1T3BVaDQwMllwa1pON1R5VnBWS1MydXRyRkR3VzVRUjBkcHpQOEZ3UmZB?=
 =?utf-8?B?bkw0cUNxTWwyV0t5L1hoYnBWLzZsRTR0WEpTOXA5WnRYbGFIRUdlVXdYZTlo?=
 =?utf-8?B?QkJxdXJidis0eThPUDZPMVhwdm5uR3BMeEVTbjZXY1BmTkVXWTNrbHN4YTBX?=
 =?utf-8?B?YlVHREw3TUgrODdia1h3dGs1VUxOTXpzVTVvWXRIRjl4M29kMVZ5YVhUaVJO?=
 =?utf-8?B?NVFQdkpETzhselZNQnUrKzRGRHJCT3A1OUIrc3FWNGdKaVQwRXlXcUxMbStl?=
 =?utf-8?B?SlNMTXJFVmRMU3ppVWRCWnhhclg0WDE2Zzk4ZmM3bkxjNDRBaXJtNW5aaWJQ?=
 =?utf-8?B?V2VycElpTjVCeU5qUSttUmdGekxYcENKekxpb0IweTAyZnprN3BLK0JWNjA3?=
 =?utf-8?B?cThvOWlWT1BrRDdXbEZ4SnpMaisyeEwzQVM3VVFPNTEvODYyNjBqaXlKMzRv?=
 =?utf-8?B?eFF3amxBVEdRemR4SnpWREJjaWFKRm9ZS0t2SmdncnROenhuV0NsTWhiSGht?=
 =?utf-8?B?WUxZQVZ6TkYxR3d0NWlrMnQ0b29IMFNNZitHUTdYTHZLWkRSdmo0Q2pTL2Vr?=
 =?utf-8?B?V2l6SDZLVEw2YmVpN2lmck50WmM0TTZtTU5IcG1QWndxZkFxYlQwM1hXNlRC?=
 =?utf-8?B?amd3a0dmelFYNkI0YUVLWmJ0UmkrV2trSzZBUSt4Rm41MFlmV3o2U01WQlhO?=
 =?utf-8?B?U1hyUzFqMkFrOUFCa3VGa3RHMWFUb0pSQkxaU3hPaVZvYjVjdjBQRms0UWl6?=
 =?utf-8?B?ejhrQUtTaFBjS1BmejA0dmRKckExWmtiOWM4aFc0MWxSZnZUWHlYODZXTHlZ?=
 =?utf-8?B?QTVFMkJkdzFEL1RLcm5tenRlMVUwLzNjOFYwY2I0TFQrL1Bwbzk4b2wzcUdM?=
 =?utf-8?B?UjZTaWpsZk1KdGdUT1M3UCtreHJuU24rQ2twYVhSbnMraHJhZXFEY2VCSmpL?=
 =?utf-8?B?aXdWdTNzRldHSW84RDk1ZTJzR3EySmQ2QlB4UytlcEZZc1RSOCtyZEdQbTBL?=
 =?utf-8?B?b3JSdFhPVWcvWHNBTDdtOHdWWCtJZmRTdHEzUE5RdEJiTDFkbnUwQ3h3d1VO?=
 =?utf-8?B?QjdscUI3MnVGanRURStaLzZtOVlhVERieDdoVUVWd0lvalJUZ1hrM0NOWnpF?=
 =?utf-8?B?STVLa2lTV25QS2o5OUt4OVpkeHhKUmtWUFJmSWw4aERERmJvUUVxdlVNT1Bn?=
 =?utf-8?B?a3JWaytYNmFOOHR4YnFtdHJ1b2FwMTNRQ1JpK1R1MmNGaEUweFJKVm9MUDNu?=
 =?utf-8?B?VDRPRlpiMm1PZWJtTzg5eDJLVGhXTnFHamtDMTlkeEUrT0lKbnJ5MUp3dnhG?=
 =?utf-8?B?MFhvdjlFVk0ya24rdG54ZE9PbFM1Y0RhUjErZHdkdG1oOXdBM0VZeEJwNjE3?=
 =?utf-8?B?VFhwdUR1cy8zd0ttWW1YcnNLUVAxYy9RQ3A2QkY3WjliN25GbDFvcEJsYTlT?=
 =?utf-8?B?OWFka2kvK3hodDdJc0xjUzF6VUQyN1JlZ1RLcEIvMXNhWUtqRGs3YllQejR4?=
 =?utf-8?B?OWZqUGhSSjZhT3lhVjd1b1VRVnhtS2VISTRJaWJzTVdlT2NjeEU1V25oRGpt?=
 =?utf-8?B?MkFZV0h0Sm1VTUpST25haXh1ZVlmTG9SM2NqZlVDb05mc3JBMmYxKzc3Vnls?=
 =?utf-8?B?MDNzMlB2cHNFVXJKOEU1R0pFaHFxSXNDcHZBbDhoVGZOVE1FU3Z4R0l1TFBQ?=
 =?utf-8?B?TTgvZDQxZDRjZkczWmpwV0ZQNGtwYUp3NmQ1aEtnZHNWeHZidDAxcUYzVnky?=
 =?utf-8?B?NlFVVzFwcDZrajNSSEVnY25XcmNaOFBYOHBDYWsraVNuWFh6YnRCY0JUaHgw?=
 =?utf-8?B?SGxGc1lUZFFCdWRvMk9qWWd2VWxoNjh5LzdJekVxVkx2L2hheUVaQzZJTWRN?=
 =?utf-8?B?NVQzYjcyUFBaNVNiRHdlZ0tKcHZvdWVBOEhTU3FyR2FNZWRtZjlZSzgxREZG?=
 =?utf-8?B?SGQrRUs4cDVwMkR2UXRveWNPM2djZWhzUVF0UzVMWENEdGxpU3FEM2ZmNTdn?=
 =?utf-8?B?K3hiN3pUY3g5OHlYVGR0M1N4SkFySW54VkVaMjliZWxCY3VMWEhnYmNNREFP?=
 =?utf-8?B?N3ZETE5tbTFWRW8rVkRtZGR2dlMyUXM2VWVXWUtkMUQ5eUc1S0tLN3c2aVlK?=
 =?utf-8?B?RFE5ZFoxZkJVVXFtN0pIR0hQUFN6d0dBdkdUckVPRlpJS3kzM1FOU1JVL1R3?=
 =?utf-8?B?Y0FSMFYrdm1GaUZyTnZhb09mS2V5Y0Izay95dUtSc2t6bkh2cUczb21xVGZS?=
 =?utf-8?B?RXFpZXVMUURtMzlKYy82ajFvN29QRmpRdTlLN2ZmbVJqSlhqaUdlSC9IbllT?=
 =?utf-8?B?eGgzOVRYOU1GU1pMUWJYeHV2OTZZaDJHbi9DN3lzNEZDTGJ0K3VZUE94akcz?=
 =?utf-8?Q?W4tHMDmZnVbUnwn8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f790ff0c-7028-4910-28c9-08da2c4f4b9c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 15:20:31.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md+snsYtAkobTAs3y4RSBlhViRz3cengoc+2rAL1n/uAml0t7xO9g8z0+OwDqDtHcabmyaUqMLKqKGC0XrphOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4135

The symbol map generation (and thus the debug info attached to Xen) is
partially broken when using LLVM LD.  That's due to LLD converting
almost all symbols from global to local in the last linking step, and
thus confusing tools/symbols into adding a file prefix to all text
symbols, the results looks like:

Xen call trace:
   [<ffff82d040449fe8>] R xxhash64.c#__start_xen+0x3938/0x39c0
   [<ffff82d040203734>] F __high_start+0x94/0xa0

In order to workaround this create a list of global symbols prior to
the linking step, and use objcopy to convert the symbols in the final
binary back to global before processing with tools/symbols.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't found a way to prevent LLD from converting the symbols, so
I've come up with this rather crappy workaround.

Not applied to EFI, partially because I don't have an environment with
LLD capable of generating the EFI binary.

Obtaining the global symbol list could likely be a target on itself,
if it is to be shared between the ELF and the EFI binary generation.
---
 xen/arch/x86/Makefile | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 177a2ff742..f3817827bc 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -134,24 +134,34 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	# Dump global text symbols before the linking step
+	$(NM) -pa --format=bsd $< | awk '{ if($$2 == "T") print $$3}' \
+	    > $(@D)/.$(@F).global-syms
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
+	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0.tmp
+	# LLVM LD has converted global symbols into local ones as part of the
+	# linking step, convert those back to global before using tools/symbols.
+	$(OBJCOPY) --globalize-symbols=$(@D)/.$(@F).global-syms \
+	    $(@D)/.$(@F).0.tmp $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
+	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1.tmp
+	$(OBJCOPY) --globalize-symbols=$(@D)/.$(@F).global-syms \
+	    $(@D)/.$(@F).1.tmp $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
+	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@.tmp
+	$(OBJCOPY) --globalize-symbols=$(@D)/.$(@F).global-syms $@.tmp $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
-	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
+	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]* $(@D)/.$(@F).global-syms
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
@@ -266,6 +276,7 @@ $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 clean-files := \
     include/asm/asm-macros.* \
     $(objtree)/.xen-syms.[0-9]* \
+    $(objtree)/.xen-syms.global-syms \
     $(objtree)/.xen.elf32 \
     $(objtree)/.xen.efi.[0-9]* \
     efi/*.efi
-- 
2.35.1


