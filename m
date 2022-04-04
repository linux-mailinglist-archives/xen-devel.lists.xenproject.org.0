Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C14F133E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 12:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298244.508014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbK9c-0006TX-0o; Mon, 04 Apr 2022 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298244.508014; Mon, 04 Apr 2022 10:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbK9b-0006R1-Sh; Mon, 04 Apr 2022 10:41:47 +0000
Received: by outflank-mailman (input) for mailman id 298244;
 Mon, 04 Apr 2022 10:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbK9Z-00069z-St
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 10:41:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0cd22be-b403-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 12:41:43 +0200 (CEST)
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
X-Inumbo-ID: d0cd22be-b403-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649068903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=o1g3NtJRr/7LMB+Lp/Uv15Zh/4bOG2IVjPXu7yZ4VpI=;
  b=bs9iEoZuO3OphIcoltzx+pPyn3SSKUnUkRsipULGSimNe/YHj4BioXeB
   UUyL8qv+Kj5ECeftS39xJn4xa5zCJQRaOOvo4Ft196E08z7CHksIdOY7W
   Seqvby9ZS9NvMMHRbC5/dSp0G7Oded2N5wkgx8/4vZ4hNF7sm3A8N4Mzm
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67942405
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EI5KJ69JniOtPiSklmR2DrUDv36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GsZXGqHb/2ONjf8fNEjOt60oU8EvseEz982S1M6rHg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YDlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncXqYAl4PIOTou4mYRdxEC90Z4pr/6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4RTKqEO
 5JEAdZpRDjpTgdGJVETMbYFgPqhgynRKB1k8HvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FqC89/NsqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmOTPYHzM9JnLlzmJCyY8LmEIPwgpShRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7Ya1UwYnY1RvHNEghBHVb5IOi8BxkkeS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyFNoAWPsUtL1PblM2LWaJ29zqw+KTLufthU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/8OybeQp
 yHkBRcwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LYLISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:Rag1/6jLX4IF0K118yichH1wU3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67942405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOJPakCu2Bj0j+8C0O1aJ+vPtqQvyeMsPi+btR7FlwG2eZR2awSuUKjS27rX73fXPGAwXhgQGLHM1UhDkz3HIkXjabrx5v4f72T35seklbvefWrCfo2AEldCBWB4l+pd+aLo95b/jeekIIDe9eFL4/uyfIOIpFcz8GsIz9rSJpPI94ZDOSztri4mSygJ2CugoKW0dYuRU89bwGObMLxXOgtXWekVVM6kKSUG29LiU4pPDRNCf9n7VhYkA3+1J6GEiGGSDHrMQRjEp/0vobaxNZ1cvqsXhYHMnfX6JyGQFPHiR4uJ7PjssmbWbDx0YdVlIdO8NGX6iM5+2cMVOU2hWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrO0NN/XdxEk/kybKpxTDcn096Mdh/YZekVSRdkq44c=;
 b=DVp4izW/EOEMmDayCcfwOQvhEF074lHa6eEKT70LHJzjCVolk0sFO9sAdPOM/cym66OJ99Mp1RH91SI+W3M6H7UoSebv0W6MqSR4J2EllLf7HW2q1S4D/pEgM4fDd5KLGXw2jdr+a/XCgJRD6GUxkpZkrByLtk/xzYi7kT9GSCaPcT6S+2+zKdrDG69npJlfWmzt1+wv9wE4Emglp4NlokTIUkjZxJoM2hCKDn7VVpGsHwVUY59qvI7EAFf1u7PjWlCsnREr89Nzg+o3j11xKcXKUQP4HUzbFt21oUIqHwpgXYUIJYn55Hv6Z2toInK6epFpoTuqYLbimpwrxsUBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrO0NN/XdxEk/kybKpxTDcn096Mdh/YZekVSRdkq44c=;
 b=gri2DVB7XH/wNkcO+ejUgwI+zJWzO52KiP0bMVn83inQw3K3RAaHdmgBTiDmWJvbFPXRqLMfwAanlaBmovpzh85BFCghDRxL2lmQGGQjHU8Du/VUma8U9GvtUX15GGfvEQ6iMXij9PzqPNEm/MYL+NmtC6YQ1Q8EoCsm3MtkPIU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property section
Date: Mon,  4 Apr 2022 12:40:44 +0200
Message-ID: <20220404104044.37652-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404104044.37652-1-roger.pau@citrix.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e165241-ae3f-4fae-7a80-08da1627b20c
X-MS-TrafficTypeDiagnostic: MN2PR03MB4669:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB4669039510326AE187B1C26F8FE59@MN2PR03MB4669.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWVignJRv1EZsK1YZ0gnQdC8wMNEn3j/Q2MoTWHmjBhdbTYMiw4/OiQi/J1tWeRk2n7qveDMgIJCoaxwHRPDhRgEgpVfRdG7MuqwXHB1IjpI7uIqBd2D6eYxYBqzBgxohNHqJ0lxy8EX6xCaU9nIRPI1UlcboOnKIXVM2+DnQuZ0Lx3IGUjcu76aylwoFQfKJttMlY0aOlYQ6/waA3FAm3p2z4bj7pumeAfdZwf2rcFQdjvuJdPq68zwJe8/vNdUWnWCHmVexHL0/wHqNYsF9Yu8HQmcR70up79CCPcTG53WK1AsDQbMCFZemY1wNMyEvYqYiL6S2OgRTM2///uBpDTEBRUBlI22fhAppmPidB1pm3vyfSLaelVJpHelezKhO2TTNQjdL4Dd1XEj5NQfUR5dyIZWYJbnx+3gnse/e87No2VvOBpJE38HShwd00dPB2U/xRjt7igWyaO95Jo5YdtaIAVPfoq/Oj+0gAyI1BattCzGw88+ZdUZvwAbN/E8w4otTIbIo0UkZRHww00g/rfx5ng+iViR3KwD+20t0bOmjJYqs38kOU0c8P7xINyIZVrJhD3uv+fp8CcJZm4cGTqFyZnFjuJkwfx4ea9687vuzP/IzUoUomWRSNAErsJOFDgH5LNH9Ro0PLLY9lINw43nj284ArftpzsC1qiuveP/MYuTYTSlngTMnCQoVsVYwyJqCM5DryvDUvHbIpUrXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(36756003)(2906002)(6512007)(66556008)(8676002)(4326008)(38100700002)(54906003)(508600001)(5660300002)(66946007)(66476007)(316002)(6916009)(6506007)(107886003)(6666004)(8936002)(1076003)(86362001)(2616005)(83380400001)(186003)(26005)(82960400001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk5mMXBicDh3MElvMVhJbytSL2pnV0c0bTFiQW9mVEJQdjVyU1BrN3BjUGFQ?=
 =?utf-8?B?NGZ0elZJRU1LOEh6a1dZc3RXeXl6SVBRWWN2WE8vY0hHWHlKRjIyWFdVc3l3?=
 =?utf-8?B?cFJSM1FqeXY3S05sUFdTSlJabWdZN0lqS0VPRExuc0xYZWR4cXMrdGppMEdD?=
 =?utf-8?B?OU9GQlZVQld1TkVLZnNSWjllL0JDcXl1cmtmMy8wY1hDRktqMXRCSVRibzZw?=
 =?utf-8?B?S0JldnBWS0d6YWIyTjFrWDRUb2xFYUtSaGNlNVd5bDNWdVZYZUFHRnkzT1U4?=
 =?utf-8?B?UUY1S29Pd0RJMitVZTN6Z09GN2RZc2YyZVkweVFERG9Oa1R0YnJzR1hhZGVH?=
 =?utf-8?B?aUh2Y2ZFcFpJWSs2Um44N2ZlcmdVak5iWW1RY0RVeUYxUGhpUk02clI5dzZh?=
 =?utf-8?B?cE84ODIxUlBHTGxzU1B2RU9OTjRFUXUzbXhmd2VjMTFMcktqQ2hLRnJ1TjhJ?=
 =?utf-8?B?QmhIMzEyVXhyd1ZYVW91NzY1UTRLUWxLajFaNVZ2dlFNNUVFTHUxUERQcFRL?=
 =?utf-8?B?Q1lXZjgvY3gyNzhqaEx3dWlabHlRZm5aeE81alhZb1QzczRSTW5xVUJ1bk92?=
 =?utf-8?B?QkxsRXZxUWNtclArRE15RE1UUjlPM3hTMzF5bTFnTXJYRE1ER3hTL3NENW1K?=
 =?utf-8?B?YzlpTmNrekFuaDJCeU9OMEw4N2tGeG5mV0kvUGJ3ZU5Oa1RoVWR1YUl5WTZB?=
 =?utf-8?B?VnZRbXNJZ0VLODVVdjUrR1hQc2pCOEhJWkFFZDJ1bGZzWjBGaTdaT0pjaXBh?=
 =?utf-8?B?dUFWZUxOeUtIQzZmelUydFBRSm1ycnZmTHFseThKeUpWaHdSdXU2SkYwVThP?=
 =?utf-8?B?ektTUHhtYS9BRW93bFZ6SXhpMHN4MjdMNE95aStyTjh0WTMvL0tvejZVZWsz?=
 =?utf-8?B?eUcwUU1oMEdyRW9PVDJmc3RabklOSHZFZGFFeHJQenlQeVZnZXBuKzd6THRs?=
 =?utf-8?B?eTBlbmFwNUtmS25lNk9nOFZ3WkRYTDVxdHU4K1RyU3FOS1BNdnlzcDFSOVRG?=
 =?utf-8?B?eWQ0elpqanVFT1FVMkV2akJOL0FFK0xOVHRZbTJJZkhRNXRIaW01TUFhTkVk?=
 =?utf-8?B?WjY5VmZPSXRoWHpIK0l2a0VUT1VHOHBjRkVsa3d3OHkyWVZFUWtVa21vZUlI?=
 =?utf-8?B?emlGRmR3UTk3RXk3TUJObWprV3pGUjMvdk1GdkhqK3NtRCtzR2loLzhUY1M0?=
 =?utf-8?B?b3Y3KzdYbXcwNFljKzZMa3JyaUQ1VUU4aDdBcFd4T2pVWDQrRzBTR0ZWQ2V5?=
 =?utf-8?B?MnZYWW0yejlBWmlpRnFGcFJ3d3N1aHRzbDBXa0pTK2tLZEo5V3B6aWhIaEpE?=
 =?utf-8?B?VFExaUZEdC9XVE9KQUExajVvb0VHOHVSTWR6MUNpN2RIc2ZQTUtXdTlMVUZm?=
 =?utf-8?B?L0RvVUgzOThGaFVzVHhDOHduam9XUDZDSEdsdSsrT1VUbkc5TjFCT1ZGRTJR?=
 =?utf-8?B?a3lmWDRQYlovaW45N01xZUh3R1ZCUjBvYnhSTWtpYVlSWklsWUIzcWNMWWVO?=
 =?utf-8?B?SGxES0NGaktGdlFuRnhjVU1udVM4Sk5WZ3JublBaT1RKYWFBTUpEMlpoR0lE?=
 =?utf-8?B?aW95ZjU2ZERaSE1UQ0JiZ1hqSVFhRDFvd1pEMER6cThZVm9yQzJJWUVxSnhi?=
 =?utf-8?B?c3pPTFZIdzg3QTlCblFEc2pyWnIrWExXTXAzT0RlOUZ3dVFhRlN1cDA1Y0lw?=
 =?utf-8?B?ZnVRR3BvemlMazVYSHY5Z3d6WGpGQVpreFR3WWxqR3U1ZnlHbXZsYjNDam9z?=
 =?utf-8?B?eFNzeUg1OTBnYm4yTml4RjFNZXl2UXRZU3M5UytUVlJ2QytmQzcwZGFzUG9U?=
 =?utf-8?B?enNxcnczTmkreUxxcXZhdjJhOS9QOFc3SHRmLzFkTWU5YU94Sm5iZlJlVWpL?=
 =?utf-8?B?SFpzcmNXbFpuQjJ6TlRtVXN3c25mSDFlb01GYmsvOUFHQXlXaVNYaFNpMjJi?=
 =?utf-8?B?NU53QUJIZUtBT0d2R3lLdVdOeUpWTnlYdWtpcnlCeldBU0tlSmhRSElOazBl?=
 =?utf-8?B?dnRJWndCWVdta1NoeW16bVBsNTFWMG9rdHRIbXlwUzB6WlIrS1RzNHlJZTZr?=
 =?utf-8?B?Wjhxam1OZ2lMSzFWYm5YVFdYL1l1QzRwdkV2QTZGbms1dXhKSFJHMllmZkVG?=
 =?utf-8?B?RDlFOHVGeWxuOUFUMVB5dWIvT1A0Yk5YVWJnT2p6VUFybllJNHlNQnZpdm1Y?=
 =?utf-8?B?NVdRV1RnUVNJVjJsdGdwQzhKMVB6clEydldHSUdTWEpNMFpsdDJCdmMrQTNy?=
 =?utf-8?B?c1pxc0Q0UkZlYVpZUGJtcm1xVzdUMjlSdk81blAvaUJJR2d2bWtQN1c1a3BR?=
 =?utf-8?B?RTdyZVhLaG56STRRUFgvMFRiVW5HbkRkUkg1Rm9BTG9HTjIxTE9HbElGUkFX?=
 =?utf-8?Q?qpCTsHbfl7ezr7kE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e165241-ae3f-4fae-7a80-08da1627b20c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 10:41:37.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVThAmDEYlrplitSsNTNHgagvpsPPjLRDZnkrgqQS7z5dL3sozZq6krIuS0fiLTi6qdvx/8lhOJQS+BA8w4FQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4669
X-OriginatorOrg: citrix.com

Prevent the assembler from creating a .note.gnu.property section on
the output objects, as it's not useful for firmware related binaries,
and breaks the resulting rombios image.

This requires modifying the cc-option Makefile macro so it can test
assembler options (by replacing the usage of the -S flag with -c) and
also stripping the -Wa, prefix if present when checking for the test
output.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add the option to CFLAGS.
---
 Config.mk               | 2 +-
 tools/firmware/Rules.mk | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index f56f7dc334..82832945e5 100644
--- a/Config.mk
+++ b/Config.mk
@@ -91,7 +91,7 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)"
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
 cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -S -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
+              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
               then echo "$(2)"; else echo "$(3)"; fi ;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index c227fe2524..278cca01e4 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -17,6 +17,10 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 
+# Do not add the .note.gnu.property section to any of the firmware objects: it
+# breaks the rombios binary and is not useful for firmware anyway.
+$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)-mx86-used-note=no)
+
 # Extra CFLAGS suitable for an embedded type of environment.
 CFLAGS += -ffreestanding -msoft-float
 
-- 
2.35.1


