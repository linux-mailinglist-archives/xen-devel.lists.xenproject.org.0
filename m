Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8314F1340
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 12:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298243.508004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbK9a-0006Da-Mf; Mon, 04 Apr 2022 10:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298243.508004; Mon, 04 Apr 2022 10:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbK9a-0006Ag-Ie; Mon, 04 Apr 2022 10:41:46 +0000
Received: by outflank-mailman (input) for mailman id 298243;
 Mon, 04 Apr 2022 10:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbK9Z-00069z-4B
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 10:41:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe990f5-b403-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 12:41:42 +0200 (CEST)
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
X-Inumbo-ID: cfe990f5-b403-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649068902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=T3IUeHOAUwH5jnaWVMPVxz4AYqEm6BYtGI9yr57oZZE=;
  b=CxEzMaD2pLnzPUIgOja4HjndXuK4WjiSNaLMRzV7gD3j5xmWW6DUeaxk
   2CuOSR4Sw+cwiEeKa4ldxyqC+F3+Iev/eDKxna0WpS3iE+skgLu4uG9jI
   NXHy2M3H/a2hErVUlrJuItygfKCM3jrrZnwoR4sD2Au1hCXvRBVA6pSeH
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67825388
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1qSQLKIYmf8AP2L+FE+Rq5UlxSXFcZb7ZxGr2PjKsXjdYENS1jxSn
 DROXGuGPPncZ2DxLtl/Odzn8EgAuJbXzd9nSFRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NJNicCyYBU5BbPJk78HShRcQjolbKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv1poTRqaOD
 yYfQRlkMyziUjRPBmUOIrcSvNyj11bEbhQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3nsOGm3XKmDZVUkdPEwLm/7/p0SZSRu6zN
 WQT+hZyr4Eg5He1S9KmRQS1pC+f5U8TDo84//IB1CmBza/d4gC8D2cCTyJcZNFOiPLaVQDGx
 XfSwYq3WGUHXKm9DCvEq+zK9W/a1T09dzdqWMMScecSDzAPSqkXhwmHcNtsGbXdYjbdSWCpm
 GDiQMTTatwuYS83O0eToAuvb9GE/MGhousJCuP/BD/NAuRRPtPNWmBQwQKHhcus1a7AJrV7g
 FAKmtKF8McFBoyXmSqGTY0lRe/1tq7faGGB3QUzQ/HNEghBHVb5IOi8Bxkkei9U3jssI2e1M
 Cc/RysPjHOsAJdaRfAuON/gYyjb5aPhCc7kRpjpgilmOfBMmPu81Hg2Pya4hjm1+GB1yP1XE
 crLIK6EUCdBYYw6nWXeegvo+eJyrszI7TiIHs6TItXO+ef2WUN5vp9eawTeNrlptfzcyOgXm
 v4GX/a3J9xkeLSWSgHc8JIJLEBMKn4+BJvsrNdQePLFKQ1jcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:qGCQg6oApj2Rrh42zxP6naUaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSpQEIdxeOlNK1kJ
 0QCJSWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYWcegDUdAf0+4TMHf9LqQZfngiOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpOfHHclAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67825388"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFegkCdlijiqo34ncNwKI5oXINDJkEsts2JJyVvW98pqe2NawqCAExqLpPPIdrGVhL/2vIgMeTav9yWYMXTh2g5qLKIV7UV7JqzYn3TOSXAdW8R9x0kWPUfijMIrZ6DZy4VnBoJdtDHJIZxZou2rSDkDPm+3gsZRC2WQyJjZtrwSiXTzeGTER0KbKsH1AN1GA2nmQQ1A6SYsrlX5jmhLqlKCaRZLE3tenfvbLCGAKY8hJyPetnXNBGxrXAmu/BtnsFkdYPac3qRbnmeYehjQPcUzpv0pSHF7fL+5MTcfeV04pxTzcLZ8KLYU+6Wrwp0meb1lTO1BkoUQJmQ7RPGQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyBbGihEUGhAAN4xDkKaoxTfhhCkzCzAGn/Ff7r7+o4=;
 b=TPdjwmq2KC/9WWMCwZjdT7KfvXfz/1JzpKuaqv2duImQKy+7Uyn/634bK+rmZ1Ml7EC+sHvYvOmajWBo512S6P/0V43EFrHh2CibYDD1fLXQzvfdb+mAIXQgay4fZ6KL+PjKGLU7e8l447deAv5TIH4FOUBVrTrSOs9zAXpxZvgp6QF5yHw6fuf69a1N16Xeal0hTC9sx8atxmI5pu7S2+hxrR8USFe4MLaAkro5+yqCJ0qtAYdzFCfghZcl4bjDsJzeZBNIP7eHl2FAfQGM9PFFlYG99zZP1n9KhuLijPXi7vrC3TezYU/msfrmjykc1S90btjtpskCiLnqQ4aDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyBbGihEUGhAAN4xDkKaoxTfhhCkzCzAGn/Ff7r7+o4=;
 b=gdP4XWAj5gKaMoSJRdsZY6Rn7xOkWglVsj+Jy0l+E8uAwGsCP2EjtnrV1AjimEzb1csrnIQ6utW8nvW1g759yMAj7uGk8Q0aNCQaC3UycH0o2j1gJmNwoh5R2SoWClzvF8QRR/6a+1pKC+I9m3D6WB1Ln99n/HMg619c4/J6xGQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/2] tools/firmware: fix setting of fcf-protection=none
Date: Mon,  4 Apr 2022 12:40:43 +0200
Message-ID: <20220404104044.37652-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404104044.37652-1-roger.pau@citrix.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af3af710-203d-4ec2-ffbc-08da1627af39
X-MS-TrafficTypeDiagnostic: MN2PR03MB4669:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB46696E146B5F06438C20D4518FE59@MN2PR03MB4669.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gcB+Dd4si7tr1z1e3wMAhJ70hzi3vDMxwOtZaHeHGIkA4lrWLnseRfGWHh1EidvcNq7343KLUQgujj1/BOSFgSFbYJf/lgi4DfABFyIR0DvIDt2hN1TahkSeIWQd9fxV/hxa/bL1qAr+fSNd0Pq4z1pWyM9WlJ/VNxIMeIzuFiPCHc7GXTmJy8XN/gACoaBuZ5Ah9OtjtkiRVeW/PLctgZJNTKcz20iqTT0UgnIRnGtZRkdGEyJg1l8aRDQ7Uy4vNeHNvCZqpnFrlKXubVVbZ2LL4UBmkRyFg6ayIno/zHKHGGvhRIM4UW383jwASkTJRPZmWxUPgUNX78b4/tiHdP9wqp65BbJFPuUmPzUOY1dOx08VtkBvzRifIlmXjOSvIQoXw/5OOoNA4fvbr/Ik/6AzSUlZvV+zco7rnkcJYjBpBdXXIaebdfgRoy6pRrXoayZGuBmbCIxHi1m5bzn+vuxNDqr79G09nzUqDQKxx1YKrkTx7kzfxbNfgCV073vpP5tdmCVsnadIWB8P1j2zY5IC/LMpVF+Pi5tZrZSjCwDT8FJGkG87Fwtb4viVGM7bmXyAaqaPakPRd6lVNa4NBgC50Rctqigzi7gPx1oHPk9BaLFZnyqxgjjfFkYu4bV/N20Xd0fqZb09d8GAXgIjbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(36756003)(2906002)(6512007)(66556008)(8676002)(4326008)(38100700002)(54906003)(508600001)(5660300002)(66946007)(66476007)(316002)(6916009)(6506007)(107886003)(6666004)(8936002)(1076003)(86362001)(2616005)(83380400001)(186003)(26005)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3YvWCtFZ1ZxejVRN1Bxd0F5TGFVRldHY0UzQWtPdWU2U0hrTDRHT2xObmlD?=
 =?utf-8?B?L2dZSEtnN1dweVZsRS82TnlFcDRaMWIxNk9CYWJKZ2JKUk5VeGFSYXpLNDdy?=
 =?utf-8?B?N1lUU0ZWRXJZdVhvRjBVak15QVd6WVk0YlRWY29SY0RJT2lnVHg0VjBrOENQ?=
 =?utf-8?B?cXhSeG1IYjkyVzRaWnR0c0lTcVNoRkl4Tklsa2RDSHVDTmtLTnNsOW55VXJ5?=
 =?utf-8?B?WGhScGFNVVVMbG9nU3FaQ1J3TDRzMFpKdFBid0dyRVhnVGUrRVZYSVNZRTZU?=
 =?utf-8?B?ZnBiMTdFTThwSnVQcDFCam9nOEdKdDI1SG5qcXYxWVl4WFdvbXhxOGlIUU4x?=
 =?utf-8?B?cCs3VFhKcndpclJnNGlIeTkxK0tnU3lOWnRLYnYrK09yVk5JV3hOa0Q0NUMz?=
 =?utf-8?B?akRmRDRTViswVzRWMjBPV0IvSmlFcmRsY0FpdllMQU5tK1h4cC9xY01peUs2?=
 =?utf-8?B?c1daS2g1cEo4VjE2UStwOXAxMmJEUWVlUnlTOG1WWndsYW9KbVZpV3IvL2dH?=
 =?utf-8?B?VkduUHlJQjJMajlDNmxBRkNWUkJMSSthSnNoYkI1TUJzenVqa2l5UmlSYUJj?=
 =?utf-8?B?ZjZvcHYvVXppVzIvcUFISDZTMVY3bjBId0dqNEVOdG4vd0UyUERMK0gzMkxS?=
 =?utf-8?B?alFNZVhLaG05NE8rM2ZBUDNra2oyKzc0VU1HdXp5T2VWcEpHSERHYUR2SEEx?=
 =?utf-8?B?K2N6U0t6ZVZQNStvT0c2VUxSbC9TcjFiVEpVc1d3VGJqcktlNzlSNVRSWTc3?=
 =?utf-8?B?bjlYTURieEZnb3ZYMFhRb3JUVGhyeG5ENTFzbkhabnRaSUo4bXBiQ2lxWmZj?=
 =?utf-8?B?QWt0SVJocFRaWUZYZG5BLy9IWUpLU3lXdzkzMHBxNS9lc3BhUjRYN085MlpD?=
 =?utf-8?B?WklGeVpPSW5tR2FqVlJjc0tDQ3NOV3k4NXFEZkw1QzRjRHVRTzc4aFJqS2Ex?=
 =?utf-8?B?cUdHbUZldStyMXpQUUt2VktvS3hGeGxLemlOSkJncTZDZEZGY09HYUFoKzR0?=
 =?utf-8?B?bGRoNjFXYURRMkRIR0ltWGVoSGdhZlpLZHl4Yk9ycmttazg5cERJNnBhcVND?=
 =?utf-8?B?ODlKWGp2LzhUenY0TTBlL3hOaTI1VkM4Qzh3QUVQRDZNamk3NG9QUEIwVnBr?=
 =?utf-8?B?cFM2Qy9UZkdNampsVHJaNkhtM3UvdE4vUTZYeDI3K1p5NjZOdG1uVEp4MmNP?=
 =?utf-8?B?QlhLVEhxODhJVWxuWEFPYUtrRmF3ZUVCTnJIVG80RlVOOStleUl3VUMvdFNS?=
 =?utf-8?B?MzF2YkJUZmM2M1FkTURZdzUwUWtXR1lFRnFtUzR6MWJxRGQ1ZHNKbEgydzV1?=
 =?utf-8?B?UXB1QmNDYjJqM1NUdjg1azQyV01oWFNyZFEzYjVLeUNvZ0tlMjhkaVEvVmxR?=
 =?utf-8?B?a1NkNHRCcGNnZ1RvQkEvM2tiRTdpdlQxSTNRUXNVSVVFS3lTVTY0bXFBdDA2?=
 =?utf-8?B?WW1GTzVSNWdRdWhETTFDNmZrMTFqcERhOW5kZEZiaytzMGF0Szd0cEJpZW43?=
 =?utf-8?B?QnozUkFpdFZ5UnVxam1JMzJ5RUJ2dVk4RXY4Wk9RVWJ3N25oNnBHbGdvQVdr?=
 =?utf-8?B?Qko3czVZdlJ0c1N1d2RTTm9zOXJ2WGtGS25za3NLbWwxVW91RGFqNHNjNnRj?=
 =?utf-8?B?SWg3QjRoMW45ajB3ZjRZYkxaYXA4SkwyWE5sbFJaZnQ4SWp1d2RWZzVEN21a?=
 =?utf-8?B?eENmOEtxRXlKcXdIcWpVQmlHZEZqTTF5Zld4L3NFR1hhRSt2Y0hJSWNBc2RO?=
 =?utf-8?B?dHEwTFlnV0tTN3dYbzJobFFFdXlWT3lPeTROaHRqRWpDWTVlMTFpYkdROXpx?=
 =?utf-8?B?aFhtMGRnbXVqVENGTUpiR3lJU1pieTU0YUo1OStWbnBwNGlEbStkSG9WQVBL?=
 =?utf-8?B?VTZudUdzNnpwUnR3UExZUTZSdlhDUzZhOC9BU3hQTFpVWGJMVnpuaVlJalVK?=
 =?utf-8?B?dEhBMjJIcFA1TXNGaklOSHFsWXJKNUErU25xdGZ0VExlYjQzdWtwZnhZbkcz?=
 =?utf-8?B?aXMxSmZHbXpLRzNhaW5OV2tuQXZ4YktWNGZjR2NVQjJ3WkdnNk5OR2RHazFO?=
 =?utf-8?B?ZXkyODBPTjVJcEp6cXMzeGI2L3E1b0tFSFJ1ZCtjalFmS2YyQ1FyNEpBdUl3?=
 =?utf-8?B?Z3R0SGsxNDUwOGRVbHdGQjFha3N6TmxYbXNPY1EyWWtnU0xHczVBY0RrR3pV?=
 =?utf-8?B?dC9FMUZucVJpUE1YYU10REtkTS9tS1VjTnJiSnNjOXpiOWtjUGdWVjZqdk95?=
 =?utf-8?B?WG5raDVyS1JNTGNRSmp0dVJXZGhRTzdWUG1vWmUxamNTdzMzWGx3eWt1RHJU?=
 =?utf-8?B?UnNaWjh6bTR6TU1QMmF6c1dRdXRkbldmRElTaW85aWxUVm9sMTFxSy9RelN2?=
 =?utf-8?Q?47sDNqNf7RkcTi14=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af3af710-203d-4ec2-ffbc-08da1627af39
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 10:41:32.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJc3ASUxZoHqCTH1k+lHgtxityfP0FsoAUKpaGprDT+HRHNjqCGHWNF96zfcdWgvm5Oy0c0N6stY7N7Znuz1LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4669
X-OriginatorOrg: citrix.com

Setting the fcf-protection=none option in EMBEDDED_EXTRA_CFLAGS in the
Makefile doesn't get it propagated to the subdirectories, so instead
set the flag in firmware/Rules.mk, like it's done for other compiler
flags.

Fixes: 3667f7f8f7 ('x86: Introduce support for CET-IBT')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add the option directly to CFLAGS using cc-option-add.
---
 tools/firmware/Makefile | 2 --
 tools/firmware/Rules.mk | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 53ed4f161e..345037b93b 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -6,8 +6,6 @@ TARGET      := hvmloader/hvmloader
 INST_DIR := $(DESTDIR)$(XENFIRMWAREDIR)
 DEBG_DIR := $(DESTDIR)$(DEBUG_DIR)$(XENFIRMWAREDIR)
 
-EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
-
 SUBDIRS-y :=
 SUBDIRS-$(CONFIG_OVMF) += ovmf-dir
 SUBDIRS-$(CONFIG_SEABIOS) += seabios-dir
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index 9f78a7dec9..c227fe2524 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -15,6 +15,8 @@ CFLAGS += -Werror
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
+
 # Extra CFLAGS suitable for an embedded type of environment.
 CFLAGS += -ffreestanding -msoft-float
 
-- 
2.35.1


