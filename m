Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 817BD75F80A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568960.889215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvQQ-0007h3-6I; Mon, 24 Jul 2023 13:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568960.889215; Mon, 24 Jul 2023 13:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvQQ-0007fa-2y; Mon, 24 Jul 2023 13:16:34 +0000
Received: by outflank-mailman (input) for mailman id 568960;
 Mon, 24 Jul 2023 13:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klik=DK=citrix.com=prvs=5629c81f5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qNvQO-0006rR-6d
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:16:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c3e9cb3-2a24-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 15:16:29 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jul 2023 09:16:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB7026.namprd03.prod.outlook.com (2603:10b6:a03:4e8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:16:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:16:19 +0000
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
X-Inumbo-ID: 4c3e9cb3-2a24-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690204589;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=C3BhfwxYchidX/CRUxuGBTjl1R5AfE+43xhmaIwGhQo=;
  b=D7dQ2/pnpZ3pywcXqz1D7ybwoEcpR92xXnWm4395o0HdWuWxu7vjmDV1
   RhxApsUkFmCjxgddMCRBartJFvdvm4d8h9YQW+prtNBDhfg1XCtxzy2i6
   6ryFny+p5LwH8Tdqyk2Bq34YmEz0ogVM8ld3mVJXorhQEvWuLkUSl57yz
   4=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 119843685
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RvHpDK/j4dSGieXcWDcbDrUDUH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zYaCG/Tb6neYGr1LowiOtmy8U8Eu8WAyoJqSQJspXg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoQ5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklF6
 KIfOh9UMCmfuKWN5JKlas50nfw8eZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWzHOnA9xCSdVU8NZh2HOiljNKKycoSFqLodiUlBDhQ91Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmzza7T7xecF3IzZDdLY9w7t+c7XTUvk
 FSOmrvBIjhis6acT36HwZ6SoSmvIigeLWIEZigsQBMM5p/op4RbpgLCSJNvHbC4ivXxGCrs2
 HaaoS4mnbIRgMUXkaKh8jj6bymEo5HISks/4FXRV2f8tAdhPtf6Osqv9ETR6utGIMCBVF6ds
 XMYms+YqucTEZWKky/LS+IIdF2028u43PTnqQYHN/EcG/6FohZPoag4DOlCGXpU
IronPort-HdrOrdr: A9a23:f0J4G6iAIOebGZXsiQBgzVmZunBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKF+Vzd8kXFndK1vp
 0QEZSWZueRMbEAt7ec3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3AoSJMVmg/YJnKGjk6FDtXK4P89jJueWCDy2X/ehG?=
 =?us-ascii?q?BFVkuc5m1V3+34LhcjJ87?=
X-Talos-MUID: 9a23:oGyscwQJ3RXRZoBuRXTn3B9TZJgxwJ6QFUE9kbQrpZfbLSN/bmI=
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="119843685"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3fWN55LwSV+/07AXWu9jV02PDA6ZaYmh26UjB16U6od0u8pYyC333WrpY4RezP4L+RSbn6Q6mKTj60dbkTg5OqntmHzT3xeSfVFPyTgSssRjQkoPc0yYODYc/v9bNSq0HFB78T6U/LviGHaNcAobEe9E9fdtf0Rp4oTPN0qrX3NraXFoQldAE31HtBwf5rOgvr7A7zKAKYnJ/i1V5wqVxN125wofT1n1gXI+vbZw7JFYFSr63iUEBpg35b7CjTQzupG4stQ81u6SqJuOzAP4BT+3g/BzrBbDAB49Qf4hdPORQFXaq15wyMa+CPEarToSbE012SnMP7XdpYG+Yudtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vNs+4AI76zkJDkRv5AgPDPbYeF+/XeT2zqMQI2mYSA=;
 b=h7KqaULSz+FJ5mhvJtB2oil6+GuWZu5l7xeDC2lJUC9t9qE82wFZiOw2l37NZChwg0urgOr4+8PmcBkSEIaIQ+ASEoIW3fksmgg7FWgw/q2ahx7JN7CU/WPhyvcy/Aoitpo91jxiMSLkFCjS0Aeyw3P8IBWyU2BPzYn61JXWuO+fJhMAe9Geg5Av7mAP3fJohtmh3tlAkCupwIxLN+T4uQRlDt1DmJectqKWVVczZc/XuHVD+DwdrQrkPtmYBGMLKB0IE1VccCaQFddIOEZSAGJGVbP+x/MVPlFzoUCvWMDJhMdZ4tWU8O8QBf4ZIpKCeC1cX4WooWOypewP4CsV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vNs+4AI76zkJDkRv5AgPDPbYeF+/XeT2zqMQI2mYSA=;
 b=lm5ubIecprGCZdpoIJ9e8DKDgWmtJVaiJXBLe1y6uNI3F+dQb70Xj41luuJ51o89xv5pUXz7ePRHTBrz7wTEmAaFAuAfTb05ec0jmLqdCdJZWX6/f7AVHf7LALIgCWpAgp9ly+kAq6CqoRQEQajMpb3Bg0y4Fz/fKKbFVmQjYpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Jul 2023 15:16:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 08/13] vpci/header: program p2m with guest BAR view
Message-ID: <ZL55nfjyL-WpIWyt@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-9-volodymyr_babchuk@epam.com>
 <f2b8945e-cedf-3b38-042c-7b1288cfcde7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2b8945e-cedf-3b38-042c-7b1288cfcde7@suse.com>
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba0fa0a-61d5-45f0-37b3-08db8c482b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dqlvJDJ8XVRg/nDthKILOdtp/jFWz3PoToC6N/xo3IfeMmXuTVTCCzyamTps/EDMVheFiQgD1oFgJ+8pJCEsq2ex84EurXD5EkgiF2XtVUaaz9cYEIVxXVFJs1xc8Jz218uSVW4wndyT13/4e52fDEr9K/CGsezjw0rnSy/Anrw5l2lVNsOFaQOeTbKw+Cz1W9FhsnmQeixVfr4YAgWWr4XZ/UsQdp/rFgQ2AlH7Lb04dJqwZvu5Xd7Cqi9StDB7MztZJ0L3lzVMtlpPhxRIrdnSHAoTLTgDXAwkMD53ViJ+4uaJNgZlN8XSLK+uYYaq9PnyyAQ7k0iAiUWQ07xvwHB0T51sQjXcQBzOVpNGdMUJVYKA+LmRbBAK4RoKaSFnxSHjAOjf8dPrz7IPm+b53KBjskbcXp3eBtDVZLTlwwXjfU43S3l66EDNi6foersmUVaFPTViYN29bfHjyXnHmwuNN6U9XPlD9BJpFE9wLuP4VEEzpW9zE4iKzQq5Dp8oeNWbFnY71q30tS1c7ud2tLDR5HgyiIzmZpZ4Ji7g7emz292KmjvvS1tdMp0VEblH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(26005)(186003)(6506007)(53546011)(83380400001)(66476007)(66556008)(66946007)(4326008)(6916009)(316002)(8936002)(8676002)(5660300002)(41300700001)(6512007)(6666004)(9686003)(6486002)(2906002)(54906003)(478600001)(38100700002)(85182001)(86362001)(82960400001)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVFUWnlxQi8vTy9Wa0RnclNtOEFTVG1wUW9OZzZrTG42eWNNNnVWM1R0WGZq?=
 =?utf-8?B?bFBVSk5zQUc2cW8zbFNHSkUxbzNITEcyejJENW9Cc3J3Vi9KM2RJMjlKMHht?=
 =?utf-8?B?Sks3K25MdnFNZHVXYVdRdjRDd3E5dElNUWtIUk9KTzZHaXVtOUx1QzcrUWF0?=
 =?utf-8?B?MnlnVmxod2tTZmJWSitWZXpueEtYTFRpeEFQTy9talUrUXIxanNORG1Lak9U?=
 =?utf-8?B?cEJDWjRGLytkUHR3RDEreHYxWHNHazFWYVZOU0c1b2UxWTVlYWd4OXNpS3Fl?=
 =?utf-8?B?dzVtS1pmZUhDTjZwNTFhZmZVYnA1ajg3U2lPekpOWW9LZ0NYYUZOM3lUTndo?=
 =?utf-8?B?VUNYNGgybkJoekEzaFlUdjRvQnQ0b0RubUppV3lNb00wcHMySzB0dzgwTmY1?=
 =?utf-8?B?Qi9ub0lTVnBvTXhKRG1tQnJieEdGY242eE9ybG55Y1gyMHZGMFRWbTcxRTVh?=
 =?utf-8?B?ZU95MG5Ga2VSNW1Id0R5ZHRtN2FzeXFTRFdJZGllMG9UNVV2djdJUU45MDdQ?=
 =?utf-8?B?U1NJeDIzVUZIQWVPSjk1TFZ3NVA0OUxpTnRDMW9vOWFKaEt4Q3BwK3IwMjds?=
 =?utf-8?B?UVFLS2p1dkJTT1hQMU9VeWthZENCRmFWTVg0MVBBZDlud00rcEpaZ3ZuZDZJ?=
 =?utf-8?B?SEplMHh4Vy91RHBYdHRDVmVIS211TXVEL3oyWEswTVpMOHdZY0ZlWmtON0Vv?=
 =?utf-8?B?SkdLZkc5NG90NjllN1o3L2M4em9qZWlBSHZCMEVVVEhBRTMyTC9LVlBaeTRz?=
 =?utf-8?B?OHdwc0hGdkY0bzdBNnVJc3YrU0c1eWt5MG5jRGxiZUtrc2FtR0srM3JQN2Fz?=
 =?utf-8?B?SWxVNEJkdkNPN3g2eHhIZi9Sc1ptcCtvWTRvRzhDeUlNc0gya0dCb3MwMGlk?=
 =?utf-8?B?YTFmRkNqTE5ycHR0dVNxeGtUT2c1WGR1cjFWbFJlbVpSNlFpekhxWFdUZ2tL?=
 =?utf-8?B?QjJwTnduaXRTU1g0b0o0bjdkMktJY2JzTm9xbHJPeHFlV0NicW9Cbk1UbXV3?=
 =?utf-8?B?Vk4xZnk5bXBsUm1DaWg2TktGd0wwRGw3Qmxwb2NOcUVaSzArUm43MCtaODNV?=
 =?utf-8?B?akRRUHFBQnUzdk1aSytHVktacEhBMWY2SnlGc0dlQnFHUktWZUJCbVVTbXJ3?=
 =?utf-8?B?YVVLVHcrRUVUejZJeHBLeTJsZjBoaTUxWXJKblFYc1hQWVVHKzN5YmRXRTB2?=
 =?utf-8?B?bnh6NmNmSXh4b0s5d1RSK01ISUl4VWhvVTJLbE5aY3pHdlNlT2hSR0plbVBH?=
 =?utf-8?B?Szh3ODVrNDlrVzRlMXEzZUxkSHRrUkNCN2VDU0pCKytQdnlMc1ozQ3NlVFNn?=
 =?utf-8?B?bEVLRTFoam9LblFXSm1wMTdlcll4NmdVY1BzamZWazdxT2lGZWxaUC9LSFNG?=
 =?utf-8?B?YlQxejYrc0tNdk5pQ3hYNTk4TlBCNjhPL0orWlM3bHRVVXByVm81RHpubnZx?=
 =?utf-8?B?bi9vanBWeUxYZFNUdUxoOGJwaTRROEJYd0JEWWw4OUlwNmkvMW5ETVRQMXRo?=
 =?utf-8?B?ZmF4c2NBNTljUSt1THQ4ekhLUEZHdlFVOUt0V2U1dUxidGVlN0VIUmdJUWg3?=
 =?utf-8?B?R0RUSjN0L1VMTUJLYzhoUmJuVjRCNFhiVkg3dEMwS1BlL0dWQnlsVitONWIr?=
 =?utf-8?B?TTFqREczZ0s4anRqZ25IbDkzM0J4RGpTMGYvTTM2NkVtd3FxWjlTZVBkcnNx?=
 =?utf-8?B?bWNjdTVqM3FoM2I4ZTBuRWM1NkZGQTJ0WGREM1hrTFZTRC9GNjRHRE5jTnht?=
 =?utf-8?B?NHpZYWU3aU5KVWZzQ3dQUzl3SlVXOHZGTDVPS2JlMVdLRmRhQ3V0T3U5T29O?=
 =?utf-8?B?MmFzSkZ5cDd0MERrWGpMejRIcGk0QXhGcmYzZG5Qa0xyUDBQaWVvSkw0cU5n?=
 =?utf-8?B?N1V3VVlxTFh6ZU1rVHdpWTYzRy8vRFg3UWtaV1RuZXZyc29kZzdpMXdNekdS?=
 =?utf-8?B?WllXTnF1dVRrMnluLzlUekJ5SGphalBsV3E5ekR4MXNqQjVPZ0VLbmp0OVJZ?=
 =?utf-8?B?OTlORlpsNEIyNytheC9JeVhpOEtWQ1FTenY0TkhrYTh1bHh3ckFtMUpRNTZm?=
 =?utf-8?B?aWVjbVB2ZzFtTWVGcDd0L2luV25veVdvYzlGRWZ4eFgvcWc5Y2d0NVNkR1Az?=
 =?utf-8?Q?b6GOC4QOieUkvEKq0fRUpJ77h?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lkOtMpxxmDvsC3edRRoUUwWxuHrfjuq3tI5TVJimBNu4LkUtlywJzE4pm+kBNWDYHl9QOfEkUQLG9/MUxSuhlRSFigSpYwF5d5IqDdX2nNu7EG4FLdvkvRJ4B9eLzDGd5DneIrKzIIstNEn8xJxbYxIfO1J3rrFrPLP/fL4hAuDonopHWmQeMDyriuxJj7fhcqFJnLke47TD7WHmgklINLCFIMf7+ke4VWYInkM71+yaS0AdSjZdAgwNH2kzmy2Gvwz8t0D+rqqcOZ1IbpH9ZYk3ZIDU1v9xHq47te9mNax/y35rka1gV7AtdapwYaOn6pKP1JmR7+e3EeDtfKH0sGFteHs+qj3KwVMHedhqANv1w4Fnf7gw4YHkpilUlbD2NbOsvk51pFN/w7FxITxwAPNtwu1lL3ONX5Lg9BNxTB7rB7YOZAnkmxEjgmhhYM2GgQVr+8Q6oVlt3wlb+QPv9xR3CDhQ3NDGqvMBwJ/4xv2SzelBKeM8JZgVyjRzPGt74ey/0YE/3+Sm9X48koP84z79XZ6FkBYco8zuS21pZkCgwVcJnjiPPMiVxUm/6bYmcxPh8J/snzpfyZ/BTltINNzbIIgZhazADRVsnVSr0B1BFhLMeyPwmp9EcZ3Cxcd7qR1QycQ8BnINn4pXH4Qt0HoWBPzEkSRG+06xU21z+SeF/kVRcjRUtcMWiqR+xOolYaimc43dY79e3kWy74LRIWKmtRxH59DNm6hpZKIMOlSCxLdwShdVWdX2TzTKt5gLANvjRY5D+QFUZunxEVVnnLAgLqQQNywDrcbh1l/Yz3tNJhXKz7JSuuZ4KEl/bHYN4V0T7ZnR97t2dCIjm1isDg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba0fa0a-61d5-45f0-37b3-08db8c482b2d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:16:19.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjrGRBsuYRBQn6ExAHFrFdJAdS0OecncXh4gw9lnu54OIRCobmjnl4TEdnBfsLtv6oSR7jWTv4XynHlw/VC+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7026

On Mon, Jul 24, 2023 at 12:43:26PM +0200, Jan Beulich wrote:
> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> > @@ -52,8 +66,8 @@ static int cf_check map_range(
> >           * - {un}map_mmio_regions doesn't support preemption.
> >           */
> >  
> > -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> > -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> > +        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
> > +                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));
> 
> Aiui this is the first direct exposure of these functions to DomU-s;

I guess it depends on how direct you consider exposure from
XEN_DOMCTL_memory_mapping hypercall, as that's what gets called by
QEMU also in order to set up BAR mappings.

> so far all calls were Xen-internal or from a domctl. There are a
> couple of Arm TODOs listed in the comment ahead, but I'm not sure
> that's all what is lacking here, and it's unclear whether this can
> sensibly be left as a follow-on activity (at the very least known
> open issues need mentioning as TODOs).
> 
> For example the x86 function truncates an unsigned long local
> variable to (signed) int in its main return statement. This may for
> the moment still be only a theoretical issue, but will need dealing
> with sooner or later, I think.

One bit that we need to add is the iomem_access_permitted() plus the
xsm_iomem_mapping() checks to map_range().

> Furthermore this yet again allows DomU-s to fiddle with their p2m.
> To a degree this is unavoidable, I suppose. But some thought may
> need putting into this anyway. Aiui on real hardware if a BAR is
> placed over RAM, behavior is simply undefined. Once the BAR is
> moved away though, behavior will become defined again: The RAM will
> "reappear" in case the earlier undefined-ness made it disappear. I
> don't know how the Arm variants of the functions behave, but on x86
> the RAM pages will disappear from the guest's p2m upon putting a
> BAR there, but they won't reappear upon unmapping of the BAR.

Yeah, that's unfortunate, but I'm afraid it's the same behavior when
using QEMU, so I wouldn't consider it strictly a regression from the
current handling that we do for BARs when doing PCI passthrough.

Furthermore, I don't see any easy way to deal with this so that RAM
can be re-added when the BAR is re positioned to not overlap a RAM
region.

> Luckily at least preemption looks to be handled in a satisfactory
> manner already.

I spend quite a lot of time trying to make sure this was at least
attempted to solve properly.

Thanks, Roger.

