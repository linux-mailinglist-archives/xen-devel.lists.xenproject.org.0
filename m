Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66C5FEA50
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422545.668635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFtU-0002mD-Rd; Fri, 14 Oct 2022 08:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422545.668635; Fri, 14 Oct 2022 08:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFtU-0002kQ-Oh; Fri, 14 Oct 2022 08:18:12 +0000
Received: by outflank-mailman (input) for mailman id 422545;
 Fri, 14 Oct 2022 08:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaRP=2P=citrix.com=prvs=27923c854=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ojFtT-0002kK-41
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:18:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1ca8de-4b98-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 10:18:09 +0200 (CEST)
Received: from mail-bn8nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 04:18:06 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6707.namprd03.prod.outlook.com (2603:10b6:510:112::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 14 Oct
 2022 08:18:04 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 08:18:03 +0000
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
X-Inumbo-ID: bc1ca8de-4b98-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665735489;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4jyx/AObIsj50tmPt62GgwWyVO2DPfwXL6gDvX46iIU=;
  b=LmpGYgPFvRo42/U8YERuq5GEa+OgpvRnNWqMYGcE+WuHPRwF6uwXFgEZ
   IUh7wAr8yeX2RqDXOdH/Kg0Fk7VrBi/N+2LxJmrrA3cbQmhDev1pJyNrj
   xy/vSjVM0XfGjPhOjIk+1shJmsPeYMmKr2+l2cTFISb9h5xcOzZaALCLd
   w=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 82735091
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AGwi9+qimyW/++j4BdbAoKco8X17brhtdWV5mu?=
 =?us-ascii?q?6ucuGbUl+iq9fh2pTMDcFHA35ufnh6Jk+R9yDHLOZikrGOzboqUZ7KlaGJhR?=
 =?us-ascii?q?0l5uglbU/B30HVF8LDmH4j3m4S3p2kRb3rQKsyNEE36syHTNfqalk688f8NV?=
 =?us-ascii?q?j5fV+GWd1ZQKN4p/ju1B2oyEBVmzF9Hutc95u7GD/nNscv9DWiYHx+EgqHaL?=
 =?us-ascii?q?zFPIddPzukIWmGu+60GRFH6EYfVnXWu1LbpUJXr2c9Cs5W1GXHsXqv2CUJ1B?=
 =?us-ascii?q?P5kyK7MxigM0fPW5cofyO6o8Plqx2lnBGrmTE4zQaySS7KAtcQtWSUBgOJLv?=
 =?us-ascii?q?GnolsRGmx0m9/hM7SQWMWUz7/gcI+OzBQHs/h2FZgt7vA5rcOXNZCF2jfl0u?=
 =?us-ascii?q?fzyPPZV/jOLe46eE7/5o29wNXEkylX3cDQKjEtCW8Zk0aaroFehplQt3DJwH?=
 =?us-ascii?q?OCdv8TsawgxCy56n/suSk+RtctuOyw+Z2zNSwjx5c8NO6ruBS18xj41NZzNT?=
 =?us-ascii?q?VxzBX4/vp3hChoqrFBZiyhTUMXk/G7wY3Ndaq/iFRXFXS9G91TEjRqI88dRh?=
 =?us-ascii?q?4x3uCS/H0dVjwLGjqhZ/9yjNs8wt3ZFM75VMt0Wj/D8EI4PR9Ye33rqnfcsI?=
 =?us-ascii?q?IDpZl9269pc7X6ELxwPZIxtuj5V3xwtyAItEJCSMw5kkeWnsYB9XxpTPv2fU?=
 =?us-ascii?q?oDWwjDL+ImcO2veb12MEhA+0ob0PSeAGJZUBMCUb/yVNF5zHdqSfYWCSY2I0?=
 =?us-ascii?q?8h+gDzIm6LXVfN4DlljTOwP4BkY2jHZo4IvQMU82ORdYZaWQ0waLkKSjUhBJ?=
 =?us-ascii?q?qfnkCdjVmaHCXDC/j49pmK2xeo4+e4iMhScFmPf5L0maAo7QjVeCoSnPYC49?=
 =?us-ascii?q?O5XQ5vSprc44v9BCceQYgpAMJeoJZ1qR2WxYmEkVEjZKJFCeHpcvjDx8pigR?=
 =?us-ascii?q?RdrrQx70PMYJ4k/LX3xKCvmRyC5bBwcmEzZYViGDAGyWF6ifi82RsA8hk0pw?=
 =?us-ascii?q?1GJmg/cV4qn1TGeJ2mcyaOmBFU8ggDkOIGVlSVH3VsBc7kGH4xKm9FCbq503?=
 =?us-ascii?q?kZPwRLp5nLI3RSFjfw+2IGce53ieKWMSm+lnto4YbOuNsL69KXL9s99FC9wY?=
 =?us-ascii?q?g/MrjydzxTJz4LXtCE/SpZEwAm1t3weSSD+elaHs/Ja9aCNki2/NtezfPOLU?=
 =?us-ascii?q?zkSeap7NNKLUpi9N3U+iJtyFb9+UPIPCdrEotMF6FdBPRbZ8EG+imXNUEgh/?=
 =?us-ascii?q?K4JDkbxiQflUh64z3iuysBMwaZWFjF82MndLH+OyitCuRJ6n4OqreV56hFkp?=
 =?us-ascii?q?ZEztdz0KySvGF7MXAmitS88uOhgWPeRm4CsmID35CHpuT3UpJfd+r4UEQTZ8?=
 =?us-ascii?q?lnNvSEKxlrsWrtnrmC9u61cSNZB/t9WgSeTF8CNDqKVBlDQa/npzlvzfdpzj?=
 =?us-ascii?q?eIspfJ090bdXJeXw5ZVglNUbAJvr6u9gHu2QRX8YA8iiKrQzLOgmzpOoilET?=
 =?us-ascii?q?5kv4ftI01+yDWNRVAQdhyAktrb30eR5f8Bw8mchwqsLqmUtzhY7VXVLVGhri?=
 =?us-ascii?q?7u0QHJQ4gjA7HXbQguWGCCdABeltn9OsW9Xb6ExYoi1ug36bbEyIKF6XOAvy?=
 =?us-ascii?q?AiTnj6igeJs1Cb8REw2ZHpsZbhei+QED6zMe4ZBlb9rzGoVC1eV8axHjP/Ud?=
 =?us-ascii?q?bwbiW5aawJtC9fCzPiFVokcLhIasByid9WmmyZfGIgeMEL7OfSbjQiZbMTI4?=
 =?us-ascii?q?635xfTHX94m1fUJXFLK14VKTpVc39N2Bi23G6pzQGcPu5TKXvR/T1XaXLfZA?=
 =?us-ascii?q?XtlLNrBWMCW2Z37yDB0XCex1s6Kg+hXIi+2e6QY7ErikVpRRAVhof5TBzqHQ?=
 =?us-ascii?q?+YjzafvBACO7t0DkyEFddLoKqN8cot3/VKGcBUB3C/dv48JSMkm3Dy/qqMU/?=
 =?us-ascii?q?f4L4naMGTeDusAW5V5NtJEffzpjmQQrurb8zKHG07/5N9prCkmbNCkcqJu04?=
 =?us-ascii?q?zyN/YzvvjOYJU8cd6o3/8zEISxapW66MUlnALa3IyRLnrW3Bm5K3YtFPOEEv?=
 =?us-ascii?q?12dhiDqXx5YxxuSIQJqubU76hHuJV/483fzbS2guB6TqByH+FXxL6wsdukgQ?=
 =?us-ascii?q?C+e71btBB6IAYiXEoGksftN/SYib9lJBJrJLM7ZorwfodLmnjUw68vRrZ4u8?=
 =?us-ascii?q?0zUBj8AH1eW+y4I6jjX5zZwbyj+k8dusEt0smJC0ykpDk56cgcQwfxa0aLX1?=
 =?us-ascii?q?UrvR2ecAI0KP+kvjNt+vgwTEXu1wv7dUyVWLHVobMHB2Pjl7pDHWrgUBKdg2?=
 =?us-ascii?q?T+qFhIBG0q+eX3jg+uRYUffxuYphHK6juwtMR+CF2bDG2/Vy+Qamqc/LGZ8k?=
 =?us-ascii?q?ktbxqgyEOHIkN770SY2z/aUH0gL7BRw0EWG9M14591GbBotnW07cGb+vIrBM?=
 =?us-ascii?q?KLSa6EIPit42gPVMddo3Axr+96QPeaDCSbDx22Pq0d1cR1bMMpGGSxj1/zQZ?=
 =?us-ascii?q?KEFbzxmTOiJ3zg/BfAvRxf66RKgKmz/ioUMuXjGLHlnJqX7opjRYgmZqCVrY?=
 =?us-ascii?q?3j+RHMsusuu3lMmqJ5aOlJkgpTT?=
X-IronPort-AV: E=Sophos;i="5.95,182,1661832000"; 
   d="scan'208";a="82735091"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhKHrYg2oBBOysni504evTu4cz/P6+mO1Y6t24sptElJ1tVve/YSlt5xC8QyD8CKTflim0IKqDJuom1CQ5uBGyUV6TnkGE/D78kMKwNgFveIjvCHJyTPrEDQVEG/z/ggcvD/tsMloM6xf4H+SXKCsvyyzAxcofLMulHB0sfyAEguWmczeWMLZL1hlvHhtxSbHMzwStq887AfOeQ6AYcgpsmEe3eFkZ2fDb3Cp+w8ldnCioeMTeFpqynzcjaAwmHtnDMVQoq5+0qhvgdlxy7DjVyqONacwGMRrmxE7ckOpIi4RSfT7LmOA1OVuwLGCzOX56HL5NOwSmCtMFtE9bsTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlnNNg6TyD5S9ZbHSyaEVYakE2qCZoQhS55Ro3auFTc=;
 b=I3xj0ZhB21SXFolg/5+TefRLAsflrP3k8+ZKcT6aa/XxVANVzUV0D1HWTXoMJgFfXpQmEV8omeo3Y6QjXxXGSrJvMCP5Aar665WTbBtDaWbLyu2SHCWuYfg5Fw4+fDCyy/aJjwOQJza9k2hk8OidjIw51NXZ47i3mNZj17EmiMdCAJqbzkCsGjOI+sXpe+6E+zxa2oxA60Y+KXv4QbclTqdRgfG2Antk33nSnZdUZrTbKgtAqJxrLHep13WqyyW3BpF145uOuhW+7vWvIDssjBb7eTDyqCHYaq8YOByd2Y02MACFxhZQd7rJfSJgUfDH2QEHrHgpwhDpkLZSjjhZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlnNNg6TyD5S9ZbHSyaEVYakE2qCZoQhS55Ro3auFTc=;
 b=vd2NDrubQO62eZHUSb2RkoTW/D71kb0KRNh3u8DA0d33wsadWP7f7rnc+fSYNsSFcoH4rzE5pKkU3M0SF7GOxCyWWcGEMXnyKQlo4KzSCcQq+ahQXyIblUMMD+gI4aSIEwOWH/h98/V2SZu+FN5oEqnutK+8zC4svfY+EK76dJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Oct 2022 10:17:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry.Wang@arm.com,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Message-ID: <Y0kbN+Zp6F2kBFGz@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
 <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
 <Y0gXnD4jsyIp2kKb@Air-de-Roger>
 <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
X-ClientProxiedBy: LO2P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::27) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 253555e9-c20c-4503-c8f8-08daadbc9d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IH2j81NtTHp8LKQMVVyA1GgMR75e9GO4QiOwhGYBgVi9OVrnzCVdRiPSZVx1dYni8QUjWgIbabmzU8IqRWZ/PrJBaDzJwulV32C6NKVXAqpi5rm7uJ37EBVnaiujDjWvznHJ9iYlZMfSlyw20lzYOEzKKq6SZ20+DyELTpHd83q/RT/jhOsBvC0iideBfnLvlu0wiDOLBHdaKgzOvE8Pjv64yHNmDLtKT6XQhXqkXGAY+RKcQRPQS+7cxQs4RdJPj62lJO1hVrwLYDhnxbOxrMfuuBXxdEo7idVIdT1aWGqIPp8aAKCo6qXEGFXZUkbnGZ9xHbRYJOOm9essJNf76fy5HOZHaP9wLzQ7bNl8NfHrgb9m+a69kCXaFEHuA+F9mrLLThgVEQ47B8xFU90JC9YtvEX7HaM16xc241KJv+BPyhAnVjlzPzMx2zfZOWp1p7i7LXF5I375SO7bwsrqyt2A8p1skj/37d4ssdwiBgdeCH1RiuCSfLQAENyBcx2kK7zb5ElMOFjeJRnclGFmOQiesJr2gev7puSFYsX9ejKkQpULTneicGANU3wbPacqnS/v5Is4JncdfBhdesqwpoPttMx1UrleS5vnMecCXlSTv9wQWWYKrR3288m/vugm9sKL1Zqr3CsJsYiQFYR/s0lZetgWnElCvzbfV3Y5KTB6W1uhYSkFoQiAt2LsLYil/sP9V7+Fne/KsC4J4WDYbIiSU9ByzeultSt4Of98NmRG3r3hWEln7InY8CBp7yll2YJ64pPPRWTyi6snfhDxmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(66476007)(53546011)(26005)(8936002)(6512007)(86362001)(33716001)(4326008)(6666004)(85182001)(2906002)(8676002)(41300700001)(83380400001)(38100700002)(6506007)(5660300002)(9686003)(186003)(82960400001)(66556008)(478600001)(316002)(6916009)(54906003)(66946007)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjB4VHA3YTczNjFwRHRsajhpeXQ0VG04SU9oMnNCN0t3THUxUXVBMllvMVFZ?=
 =?utf-8?B?cXFOUWRRMGFXdFY4clQrbjBZK3QzUG9ENVRLYWprUGgzQWY5WDRXalZDTnFq?=
 =?utf-8?B?VW1PbXdjcHFydk1xL1pzbXhQM3VVYlFoRnl2SjcrYWNMWEhxS2tDNmRLOEtX?=
 =?utf-8?B?T0MrYmhnU2Nub1ZuOTJ6YXNGZTFhNkQrM0RMMHZ6azZ5aE1UUkdOUTdMM3Uy?=
 =?utf-8?B?SkRSWWZDaHhYZzh3UkxEaW1NYmJEaWZhTmEvaWRWaFBvcWhoWk9DU3VWZTV2?=
 =?utf-8?B?QW1XdStjMTlIOHFZb1VXby8yRkxGZk1FOUpyTUhrK3l2b3poZS8xTktTZmQr?=
 =?utf-8?B?NjRQRjdyS0IrOTVEZWFCZTZubFpIUEVuRGxRMVNVZ3o2cTQvRUJjN3pMV1Yw?=
 =?utf-8?B?Z0xLNUY5ZlNHZk44OWt6WS9jK21XWDZHdUtSSndHc014eDVLdDFzYWdhT1BG?=
 =?utf-8?B?c2kxU3RCOFJ4UEhRWXJpTFVUM0kyR0ttS2krMHBsUlJBenZTZTNGQkZnN0lV?=
 =?utf-8?B?UTFtZG50STZpeGZ5RU81YVdYVU52RlRjeTlvd3dJMktBbmZ5bUlWRk1TR2xr?=
 =?utf-8?B?c0ZyN2UvMGZkdWFYU0VMYklHNkxlRW9PVE1wK2ZCSDl2cUhPYjRjOFljdWJT?=
 =?utf-8?B?ZDBna3JzQ05uQmxrMmNmZ1A5NTJYRUZudHJGSXE0ZitkNGY5REFydGl6VHFZ?=
 =?utf-8?B?aXJ4VTFyU2JYNEpjMlBoQnlrU1lsK3pNckYzQ0NxTlA2QmVHSWJ6ZHNwU2NI?=
 =?utf-8?B?L3ZXNzgyYmp3NmlMcm1YRGdJc3NQaVVqVWFLWW9TaFN2bFoxcXF3VVV5YXl0?=
 =?utf-8?B?ckhEMUVCSkp1NFphOWRlem5tWXJnakpnSjdGUGI0YjlXZ0tGQXN5TitCNERm?=
 =?utf-8?B?NkNNRTZITUZyc0g5cGZPdFd6K0xHRUw3djFlTm5lSDkvOE55RlI0M2VLR3ln?=
 =?utf-8?B?dEtLbEJEQ0ZnbVlDUSt4ZDA1ZTczTDFBL25BZVlkai9YRnZaRzV0NGVCY1ZF?=
 =?utf-8?B?M3JZb3B0UTRVTjJsVHNqeFJDU2NxZEtTVDl6VDFmc0RFUUE1Q2s3V1N6cmo3?=
 =?utf-8?B?VEZxRkdmSVhnazVsVkZxbWlvdy9SS2sxM0xoOFZBNlNTUUhIQ3R2MW02cEZs?=
 =?utf-8?B?SGlzMFV0ejhSQ3dkVVhRNjFZdmtjNTZnMWwzT1FWVkpnQjBjTWQ1NXhpZjFH?=
 =?utf-8?B?WDJ6SUliL1EwemozWGZaSnhSSGwzekFkeXV4bmpiMHBCak5VRU4zSXRzbE5x?=
 =?utf-8?B?d0VRb3plTklnZmlGZHhGQStoR0dqZVg0VjJqRURVUW9NRGlVd1BndmxVamkv?=
 =?utf-8?B?VzE1NjFRYmlYbEE4ckdwaFVGU1lHamdwREE4dGF1NGNjd1lMN3ExYlZDelVp?=
 =?utf-8?B?UTN3Wm13cXdWM0djSXVTWkxwVm9hajdROWNVWmswMVk3dkZkS09CTFRxVlNx?=
 =?utf-8?B?SHk3VkNxeE0yTzE0SlNUMENleHFHOEswRVFLNzhRZGVkVXNHQm12aXJPa01H?=
 =?utf-8?B?QmplZjNzOC93Q3paM28wejV0enVlN2diaFNCMnNWVU40cVQyenJUOU5lMVJL?=
 =?utf-8?B?TW9LVlhEaitiNXNDMS9iU1RGVTdnL0kvcTVtS2Vybkl5K1UvT3NXbWw0cEJQ?=
 =?utf-8?B?Yjc4L2tXcnQxQjZZL2NXVlNiSCtEVStScG4zejJ4OVBDbm9mRXM3NzRpTWdj?=
 =?utf-8?B?MnFGZHlySDRPdU4wVXptZm44cCtuVFhlMDBsTnIvemlsNVREZlVNSG11RXly?=
 =?utf-8?B?OUZQb3VLUEM4RW4wK2ZsVXlCOUF6bGxvcXlyeEdncVNoM3FYNWNPa3pGTVo1?=
 =?utf-8?B?Q2hFNllYbFFWV3hTNndTc01tTU9yQ0YrQy9ra1pIK2l1Rm01dFhkekhManlN?=
 =?utf-8?B?V2FGRnRpelZJYXd6eW54V3ZMSFI5QVBaVTlTRkQ4N0ZndGE0Y2VrUnpidHRw?=
 =?utf-8?B?aElVR00rUnNCZVVFL3huSkhUVUdQbVBlTkNmbDk3VWM0NVBvYTdWc0ZERXRX?=
 =?utf-8?B?YytCQjB6ZFl3d2QveDFBQkFhaFRZSWJkQUpReFdDWFd2TVdCQ3U0MnZtWkpJ?=
 =?utf-8?B?U25aMktVQ3FjSXV4S2lRVVVOMnlIczBZRFZuVFFIdzFReVY0Y2MxaUxBeHdh?=
 =?utf-8?B?d2owamQ5MFRUS3NsVnA5UEFaZDBFaDhod2lFODdDa01vN0c0akFoMVFuaExi?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253555e9-c20c-4503-c8f8-08daadbc9d74
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:18:03.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66Q7k6zXRCYxC/aNnpBJM9m2T+xJ9rSdYx9qXtC0tgctRnjIs5G9MbyYc3azqxVW+jMegRCj5DWDs+XLWFJH7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6707

On Thu, Oct 13, 2022 at 04:20:45PM +0200, Jan Beulich wrote:
> On 13.10.2022 15:50, Roger Pau Monné wrote:
> > On Wed, Oct 12, 2022 at 10:30:45AM +0200, Jan Beulich wrote:
> >> On 11.10.2022 18:02, Roger Pau Monne wrote:
> >>> @@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
> >>>  By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
> >>>  when hardware hints recommend using it as a blanket setting.
> >>>  
> >>> -On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
> >>> -option can be used to force or prevent Xen using the feature itself.
> >>
> >> Why would we want to take away this level of control? Shouldn't we turn this
> >> on while in Xen if so requested? Which would then either mean enabling it on
> >> VMEXIT if a guest has it off, or running with it turned on using the OR of
> >> guest and host settings.
> > 
> > Right, but then we need to context switch the value on vm{entry,exit}
> > which is problematic.  I could move the context switch code code out
> > of the GIF=0 region, and assume that NMIs executing with the guest
> > selection of SSBD are OK.
> > 
> > Alternatively setting ssbd= on the command line could be taken as a
> > value to enforce for the whole system and prevent guest attempts to
> > change it, not exposing VIRT_SSBD, AMD_SSBD or SSBD (haven't
> > looked at whether not exposing the SSBD CPUID related to
> > SPEC_CTRL.SSBD will have impact on other features).
> 
> That would be my preference (albeit I'm uncertain about the "not exposing"
> part, as we don't want to misguide guests into thinking they're unsafe or
> can't guarantee safety when requested by user mode code), but ...

For ssbd=1 we could expose the SSBD controls, as the guest trying to
turn it off would have no effect and it would still be protected.

OTOH if the user sets ssbd=0 on the command line then exposing the
SSBD controls to the guest would be misleading, as the guest setting
SSBD will have no effect and thus it won't be protected when it thinks
it is.

Thanks, Roger.

