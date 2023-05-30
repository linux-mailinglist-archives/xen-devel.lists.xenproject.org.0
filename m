Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364D7161B4
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541176.843632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zMS-0007y7-9N; Tue, 30 May 2023 13:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541176.843632; Tue, 30 May 2023 13:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zMS-0007vr-6N; Tue, 30 May 2023 13:26:04 +0000
Received: by outflank-mailman (input) for mailman id 541176;
 Tue, 30 May 2023 13:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xzU=BT=citrix.com=prvs=507ffd061=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q3zMQ-0007vl-GH
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:26:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 842becd6-feed-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 15:26:01 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 09:25:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7066.namprd03.prod.outlook.com (2603:10b6:510:29c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Tue, 30 May
 2023 13:25:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 13:25:53 +0000
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
X-Inumbo-ID: 842becd6-feed-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685453160;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eOEQXo4OsFTkl0aJ2ZIG2pMSvNlhvx5pPvLuC142sIA=;
  b=AP7iYvCcJFXhFdyfM9HqpXEysX3nuEI9UPGuS+ry2NwVQfVbfkKqkNuk
   JOuPfOv2nSZO0gyOCQKfXt1w7/1BHzdt7q0GYuUMDdglklplDir+nPAS1
   zTfQtIPESmt5K6o7tOyjhXUQ967h0EtgOORUtABNyguGMOwjfftDC54Gl
   0=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 110253815
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k3ZJb6qMswYcTqN0DSoi0oe8gY5eBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBmPaa2CYWCge911Oo2w801UusXSn9RhHQY++X8zEX4b95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzCFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACIJSEiHv96R+5z4eNtv1+89EcjKJqpK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Yw3QbDnzF75Bs+ZXq4grqE0m2FAfFgE
 UA4xywtg60O+xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yxfQFNBqFfftisWvQGmhh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:Z0P69K8DrObU+/r6vAduk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AJL3vJ2pwC1UcBNTU8hfNKXHmUdIhVCXZ9Ev3GGH?=
 =?us-ascii?q?7O1RqGZaLdF6x4ooxxg=3D=3D?=
X-Talos-MUID: 9a23:eRSDDQTWiWflf4NkRXTcpTJBd/owwJ/0K383nbk7vcqqMBB/bmI=
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110253815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsG9dDEqku+vBj4LbbdQPgCZJPopqM9tsOpQ97DiQx364HBXjUe9+duecDQaOBYWfZJtcdaj589kSvMPx+IJjCtkhVfcR/5oueOaTO+BB9+bcJIwChdlFuvpkhxz69M9fiVk2nBUoNSc6Vgl9eY8aDLcjEEiZkzn5IhaToGiPhLtHYziz7n4Ez5ucJjTWynYe+Sg0PYKjhhmY6onmpY+gN/lqblt/m8FHgD2aXV56XeWjytzW3nyeO1wxaJh8RFND5qf4uc1Ii32De6wq+GX6KYGLaBW7TqwHdPgXBcRPKVc72HlgzQsW8HxauTUhOVXliotYXNGtxz9oBmgcLFH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xurPT9LVnL+sxGtgX0SkyeShRXmNwPFi1Y+vifVICmc=;
 b=nFaxj3/MxYkAETbg53P0gpMtbZytlkzqROwKrGavVZoxa3K37kQjcogMF3zv8T+5alvuq1HZDHKxZce1IwyjO5a4DMUdCz6U6Zyyuu0vXkXqU7EED/GRwCysTjMHy8XD49UkGUhffYyXQI/YQP7H9UWHQjBzhXPunbYTEwya8IJfKP7/7PcDh8bGh7m+2d9hVE/DweUwOGSudpreSPG3b6MN9+4VXpnDescjN2TNhrRqSGZSnWFw+EM2C+PVqx6rD2ojaeeoJXHx120z4Gr04NJLwShJX14xg/tXJGYZq2y9d8jJY/QKB3hfIsBZC0vu0f1Cvnt6iQzxOSCT7H+m+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xurPT9LVnL+sxGtgX0SkyeShRXmNwPFi1Y+vifVICmc=;
 b=rNmIJ5zLKh1aOu5gf1AtWrP1ZiFITj0UlfOfjQ0DC+FFMLnP7l1nHIBkyn+Z5gjch6eJrCBoeDH8g+OiteoPnf02/tof3saYawDtI2JQ1f0j3QZLKowkm1pzbBoH39V0kSDbtBuupr1paZL/+qeT5om/CLvDVXYIorbZJLkyqhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <db0a6132-4ee0-51d2-08b9-88a286bc4b14@citrix.com>
Date: Tue, 30 May 2023 14:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/cpu-policy: Derive {,R}RSBA for guest policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-6-andrew.cooper3@citrix.com>
 <8d31e4a3-3f3c-f7a2-8d7d-0b0febf17f65@suse.com>
In-Reply-To: <8d31e4a3-3f3c-f7a2-8d7d-0b0febf17f65@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0579.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed574bd-c448-4da1-d836-08db611163f6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+5bNUv4rHtvzME2HPeap9ZgtpiWArXhIPmcBROjir7wbLn1Hhj+ApRp8VjepwBkaPTegckIaDgp8B1swK4NXbZz5wRaLIS24SOS4QbqcwNi1Kc223faeWjdhg3b1GDLveUpBT9LoPE7w2eBcZl+4mdRgIUAywKUpS00Io3Bvuaz50MfGHb7+UuVTZyz9o2sNdZ7oTXImFhok9+xTBrnbvGu+4HtWs1qqOT4LP8Lb+xqKTFK5JDmyPGpn8VoKqEA/7n4eVnOcK6ldLnOIn+VqQphjrhPsgPRvE5PVPoOCue8GRHJRl3Ypc4xNh2n2npE53AQxvbZ9fgWk39tsMHJoRXgvyndKv+x73CJVryz0bta4+SNRLcL7KG3M4H7YwrU7vTsRoXtpXM+hkFhQi72gxdQ51RpGEJ30gfrPlrt/K3POPGvpKY8ZQiqI98VQjqUTedunN3bQJpJklYPJzTQxU2J2Ot1tOHwq8eHbw2O0eoD/PE+N/mUQ4bl+uGZXROeMWRKHsd0l/PwftAqQ8q1FeZ5PmmSLmeHhxWA+PkDjocg0NlsSOotmod+vaW6Ys4KW/OkipNSfLj/s2k8UY3FuNmLRusNtwnQETLWW6wqBgcJUE+GRXWw6siEd/UXhqqYkn895HVc8z2DruwmRkL0Tg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(6666004)(316002)(6486002)(41300700001)(2906002)(8676002)(26005)(6506007)(6512007)(5660300002)(38100700002)(8936002)(53546011)(83380400001)(36756003)(2616005)(31696002)(186003)(86362001)(82960400001)(6916009)(66556008)(4326008)(66946007)(66476007)(31686004)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FxcEgrQ3hCR3I4cmcwd0VBVXVTei9sSjNwVlBha05Wb0tYbndWYWtLT3VG?=
 =?utf-8?B?eHZiMm1ESWg2Lzh2UlhRWlZ3eG4vUzVOMllFNTlzOVZHQjVsdHpvK3ZBUXhO?=
 =?utf-8?B?bGN5SlRlYVV6d0dUamViTmpyaFVqaDdvNHpQWll1WFcrSDVBU1JjRlJ1Rk1F?=
 =?utf-8?B?UG1zTXNQTXY5TjlZS3phYllHMis3R1FXMDRlcFhIc04yUkE0RkdUb3BiYTZN?=
 =?utf-8?B?NXp2VUk1L2lnaXNMMGxQZTlocjZEb2F0R0hqTk9MakQ4S0dZQXBoY3ZhNTFZ?=
 =?utf-8?B?UW1YeHVWdkN4MTU0RzJLZ25zdzFMYmtHSUhHejFFWnNqVTFqanlUbHhPODFz?=
 =?utf-8?B?c1ZCb3paR0JKOWw5UE10Ti9UTDQ0L2VqNkgvTUZseUhPS1JkNTRoWGZ6Y1Rt?=
 =?utf-8?B?NmtyaGNQMUNvUFJaRjBuY0E4UUZkZ1E5K3pCazhFbjlxVTdBcHBPckVuR1pD?=
 =?utf-8?B?K0czenNQNWpUZFd4ZWVjOWlLVGFLSGVHRWZjU29zellVYkRpTkhpTU1qTGFn?=
 =?utf-8?B?UzV2aEZTQStDekxxNWg5d1orZDBWV293QjYvNGozK1ZXZE5aT1BVTDRBQVNj?=
 =?utf-8?B?RWV2cjBtV083V2lCSU9OZXF2RFduMUgwOFRZY0VQWVkwbzN5K21OVm5qVFZI?=
 =?utf-8?B?OFhIWlp6aXBIOUd4VDJKSENPcVRpeC8xb0lzMGxLZlo0N3FrU1ArNVR1S05i?=
 =?utf-8?B?TkhrSjVsdkZDK3E4ZTZUZ1dOR0t1U2NzanpVV0EvZ3htWFNjeUxJbzFNRWlG?=
 =?utf-8?B?YW8xWkxHM0lya084Y0haMjdLZ0loaGNiVUJzYkprWkpjUHMwYkhMVW1jUG04?=
 =?utf-8?B?K1o4WGw3dlZLZGsyWW9GeUxIQ0g0RE1YNnE0TGJSdmlXWDV3bS8yL1VmOHRH?=
 =?utf-8?B?UHNZSFdxTDJaMS9sQi94Q1JadDEvUEFXYWdzTnNBYk12bjE1bm1tSERla25F?=
 =?utf-8?B?Q0l0WGdwK2R5bSt0L09DUHFpeEMrdFRSV0MreFFZT1NkZUhiRFU3TnZkSXR3?=
 =?utf-8?B?eUo1ankxalhRQ0FubjQvcDlyMDdGM2NPTXNPc2pPY0Y0RGlIc1FKUjg4bmdZ?=
 =?utf-8?B?Uk14dituWTZKR01rSlNiTXRmUmg0cEtjVGllU1ZoTXE2WjU1clRkelVKNUh2?=
 =?utf-8?B?eWlVWmtZVFd4N2grTWc1ZzZRbEs0YlBaUXdwZjlscTZiMm1iV20xVHFuWlNQ?=
 =?utf-8?B?SFVzazAzZXBQSVVBWFFuZ3Z0b0FNRjBPL25NZEQ2SFlFNVVjN3VtakdvVitW?=
 =?utf-8?B?MlVscFlXcUlka1hmUmdaOGRBVE9qVWplSDlFOG1LK2ZIa1NnVjliNXhXL01h?=
 =?utf-8?B?M2JqSlJkUFFYZkJDalhxbUdQU0t5L29vb2luUDV6SG1rMU1MMFpsK0RGMitj?=
 =?utf-8?B?ZEtrZmFpNzBOZzRiLzJQNjVTUTJjOVUyMzFob3hvM0VEZ1FZbExITWl5Sks5?=
 =?utf-8?B?YlFUdlpHWDdNZmp4cUFPQmFsQmhjSHAyYk02d3k0dFVQc0c3bkpOQXRiRmhW?=
 =?utf-8?B?QytoN2QwaWhRdXlOT3BTUFk0SmsrK3pmTThxVG8wdEx3S3RYK2hYRGV2bmdY?=
 =?utf-8?B?WDBBbXMzTklUTG0yYWxjblhvQzhFOFg3MkxwUTM1Q0RMMUtaWnpOSnp3anho?=
 =?utf-8?B?U1Y1N1lqeUtmWDh5VE1ieXdycUNKeXRNUDgwSnNqSUY0L3NLaDVLZW1xOFRt?=
 =?utf-8?B?ZTZVZmo4K1E0eDhrVTVJc0NnQjJZd0dxY1FHRlRFK0ptL21FZ2dHay9YT2hW?=
 =?utf-8?B?Um5wdGUzSEdEa1lmY3V4SlFTZWRTNEwweWFYYmR1VXFFVURpTzQwMm56Y3JV?=
 =?utf-8?B?NEtsdk9YdFdJKzY5c1ErMDU0SHJJZ0VYei9PZGdFTnFLNjA3NFNsbWNZK3VD?=
 =?utf-8?B?MDdzenlzQ2lsaVNRekdZV1pZWWU4UkhCU3ZZclF0c3JOeC9oYzNKNzQyMVpZ?=
 =?utf-8?B?MXZkZG1Td2tTVjFNZjlrTDdHYURFRHZOaDYrbGZ0QXZlUUk2ODVISllNSGh6?=
 =?utf-8?B?dlVObVhRamEzYnBZL3NQN3pWMU51U0JXVWxuM2dDa2VMZ24xbVZRNXFGdkxI?=
 =?utf-8?B?eGVpRU93ZEVjQVhHZjhOblBvUVM3M2RUNTRoSTIrVGthRUYyVFRDMzJGbE5Q?=
 =?utf-8?B?QlVqSFRneE5pOTlUZjRsU2k3QU4yM2NSU01raXBEL1UyN0NZTTJiOUMzaXhB?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xlM2/p7Ga05I9KNXx4U6SHvis6IFbcLOFZGw0JpgZaaQKPWyYuaITq4hBgjQ5BHB9WizCwWRha9UjNs78U6T0yo1aFpgtGDNr+H1cxBJVW3ih6j08OqnepMkis3HDoOLQzvqEvttDbqTsTxvGgMcIWrUKPYyzjEmVoTJUGTB60C5iTAd2UC3KFOhirndWAuNUKBiXRiGdj+pYJ3Tq1iobLEzGL0Z/eMTqh3qMN7fgbBK0xZKVOxoOPE0GIA1mR+KYpkwkEm3AYvHAgNLAJW+/oLw4GJrjGrWcZL2iI7GOEizXHX2PmjuYNY0M1VS2nm9LhvIjuelwEZ+Fmool2wbq9fCf2uu9b/mjJA0hFkmrqAmNXZ5NLQivWN9anIKy+wT4lc9e7hubHFjvpjv//eNqisbuDrHSes6l3K+628/wJr8+h2lVTuMMuaUM2Z5w7+pZSSMgxEkxC9Jv4wpd7oiGr+EazcQIP0Is9AEOr3siNpr7pwJf+yP2tjTRc4IJ3/+vm9Jt8n5IuK6VwswJCl6i2mSI2pu2ZZV4x9AWpiTTZH2UZ2USqcNMIAVQbs+2wXIt5ptWEz7t0BxaI/tEcllAJtmh1R3EBj01bWBkRGJXgPF2v1eNR+fujMqL92cjrPLsqv1kYnCK8yMNtppHMgkUectqe/NepNpRcWRQK4yl6ROacJNiyoX1k4fDYLa9HG7nJ7ilhHJFfdlrQQZKLCYvcUoeWuUMZSUDtYdKy4NocK/nPc/hfGHZYwPft+tl5iSvbXVqUx9I1Ga8UgM+MHY+3YQOTgismc6vAago+tSz2c1XYSxaARjfP1rt1tZdsqP
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed574bd-c448-4da1-d836-08db611163f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 13:25:52.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/POXiLNLOXUCLRyv5ZoIqvMLDU67t6poVBK370IH5O8Ch6aKIvQkQ3UjS6+ggk5zEe0mr/XeNQ/8UAhHU6VXlBdasB7tIvR/hpBAapF8C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7066

On 30/05/2023 10:40 am, Jan Beulich wrote:
> On 26.05.2023 13:06, Andrew Cooper wrote:
>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>> predictors when empty.  From a practical point of view, this mean "Retpoline
>> not safe".
>>
>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>> statement that IBRS is implemented in hardware (as opposed to the form
>> retrofitted to existing CPUs in microcode).
>>
>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>> property that predictions are tagged with the mode in which they were learnt.
>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>> alternative predictors but restricted to the current prediction mode".  As
>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
> Just for my own understanding: Whether retpoline is safe with RRSBA does
> depend on the level of control a less privileged entity has over a more
> privileged entity's alternative predictor state?

Correct, but...

> If so, maybe add "probably" to the quoted statement?

... Spectre-BHI proved it was exploitable and could leak data.

"Don't do JIT in the kernel" was a very unsatisfactory resolution, and
in particular I think there is room to replicate the exploit with array
style sys/hypercalls.

As far as I'm concerned it's a matter of when, not if, a researcher
breaks this boundary again.

Concern in this area is why Intel added
MSR_SPEC_CTRL.{RRSBA,BHI}_DIS_{U,S} controls in ADL/SPR, which hobbles
this behaviour.  (And yes, we need to support these in guests too, but
that involves rearranging Xen's MSR_SPEC_CTRL handling which is why I
haven't gotten around to it yet.)

>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -423,8 +423,14 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>           * Retpoline not safe)", so these need to be visible to a guest in all
>>           * cases, even when it's only some other server in the pool which
>>           * suffers the identified behaviour.
>> +         *
>> +         * We can always run any VM which has previously (or will
>> +         * subsequently) run on hardware where Retpoline is not safe.  Note:
>> +         * The dependency logic may hide RRSBA for other reasons.
>>           */
>>          __set_bit(X86_FEATURE_ARCH_CAPS, fs);
>> +        __set_bit(X86_FEATURE_RSBA, fs);
>> +        __set_bit(X86_FEATURE_RRSBA, fs);
>>      }
>>  }
> Similar question to what I raised before: Can't this lead to both bits being
> set, which according to descriptions earlier in the series and elsewhere
> ought to not be possible?

In this case, no, because the max values are fully discarded when
establishing the default policy.

Remember this value is used to decide whether an incoming VM can be
accepted.  It doesn't reflect a sensible configuration to run.

Whether or not both values ought to be visible is the subject of the
outstanding question.

>
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -318,7 +318,7 @@ def crunch_numbers(state):
>>          # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
>>          # as dependent features simplifies Xen's logic, and prevents the guest
>>          # from seeing implausible configurations.
>> -        IBRSB: [STIBP, SSBD, INTEL_PSFD],
>> +        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS],
> Is this really an architecturally established dependency? From an abstract
> pov having just eIBRS ought to be enough of an indicator?

This is the same as asking "can we hide AVX512F but expose AVX512_*"...

> And hence it would
> be wrong to hide it just because IBRSB isn't also set.

EIBRS means "you should set MSR_SPEC_CTRL.IBRS once at the start of day
and leave it set", which to me firmly states a dependency.


>  Plus aiui ...
>
>> @@ -328,6 +328,9 @@ def crunch_numbers(state):
>>  
>>          # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
>>          ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
>> +
>> +        # The behaviour described by RRSBA depend on eIBRS being active.
>> +        EIBRS: [RRSBA],
> ... for the purpose of the change here this dependency is all you need.

This change is to make the values sane for a guest, which includes "you
don't get RRSBA, or EIBRS if you have to level IBRS out".

~Andrew

