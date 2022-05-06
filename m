Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C851D67C
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322924.544407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvwf-0007Bn-JE; Fri, 06 May 2022 11:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322924.544407; Fri, 06 May 2022 11:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvwf-00079h-Fe; Fri, 06 May 2022 11:16:25 +0000
Received: by outflank-mailman (input) for mailman id 322924;
 Fri, 06 May 2022 11:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4KMJ=VO=citrix.com=prvs=1183625ce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmvwd-00079X-C5
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 11:16:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4121ea2-cd2d-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 13:16:21 +0200 (CEST)
Received: from mail-mw2nam08lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 07:16:18 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB4388.namprd03.prod.outlook.com (2603:10b6:408:39::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 11:16:14 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 11:16:14 +0000
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
X-Inumbo-ID: f4121ea2-cd2d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651835781;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KofVYXAQpkaVCAEjQn7ua47HVDW7o6zFrctFxfdUSuo=;
  b=BmBLZiQG1dZUtEvr0Zbf6ZXK9susk648R/RvMr1BurG5uZz72AuN19OG
   JHUwjBTrgMPrHf9WYaOippiola+kG1ASrJNBVFqrm8zTeRtrE7Eu0dcfh
   4ibr6O5I/KvED9YsQXHpng14u32MRsT6vrzk9YVwNAtexqZ7sINZxkBhJ
   s=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 70602401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zFCahq0KtaqT4dYtBvbD5alwkn2cJEfYwER7XKvMYLTBsI5bpzFTy
 2IfX2uBb6rZa2v1fdFza4Tlph5X65fSm9YyTQZvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /12j621Cg0UGZTsp70tDhxWNTkkLK5/reqvzXiX6aR/zmXgWl60n7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfyVvre03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianLWUC9ArMzUYxy2XR7FxD9+L0CfX2YtOLad1Hl23Cg
 luTqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM/JPF8Uq5QfLzbDbizt1HUABRz9FLdk57sk/QGR60
 kfTxoyyQztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:HcI3f6kEzCL3HnQHVpmlsQT9FdfpDfOwimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 r525RT5c5zp/AtHNNA7cc6ML+K4z/2MGXx2Fz7GyWWKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70602401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Suqd5Xc5BazROHJB96adv6AL3gXb7qL3BCxweyTOpwLniXKkFhGyDqgsajmQFk8jcUAHaHMte4JFTMJqqh+V8v3bPWuNH5QOAHu2AeakJiUheuIPceQkB8iVTJFTjjEZ5OvnuTakyyrCiAfYJzxfRjcVvE6dqCxiQf0vR4502QzbIrBIB4zdgzkXd09mTcnm2iub6ifQo+RmB8BekiR5smzMnczFoKdIcKcwJvRG1EmjW4jH94hQvWIXi86lGxC0zG6IPzRGTo5MP263C+Y81q6dSh20M/0lyyIJ7rdF4iFh3Zn6Qmnl8PDsr1D8t554VIdEPowPjnE1dCs74hAL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5mWNDydRom74FI2cvlU8uvhR7nBz88hVQp5h7X4TY4=;
 b=NjnUxTKtcKMYKHHQeUhvjGJJI01SowiSw0ESma2dOY2xM7jewFULP3I7abe8MLxZWboXfajtdRC/koUeG9AGSg1D3+LLH8ZCGKkM8PRj2+WgfWR7oPlx1Ouq1in6G4VLX+UyU2oS1nQrqjqF8CAGIFAyMG5em4+6juiFqaRII9ptBqLseZH/jOE4XjQw3+7WZBvbdAj8XuiQlGgiikDr9vUiujxy410x/RA6wv8TSPuKiz28ZE1VV9KerspSOyhC+HWq0TJYOylQA/2+Dkfg+76Rl7UnybRad5DZpP97m31xCSw1779d2dhDKPpT5WwgxZ01j2e7Ji/tFmkObxq5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5mWNDydRom74FI2cvlU8uvhR7nBz88hVQp5h7X4TY4=;
 b=TYHM9QzRQWNycbqPCXjbULkhZo6BE2OXlCVqeHN1w5X0Z0G+9agGVvDsnU6tMdiHljvYloVE3Zhqf8+XyIntmDSQ0Yk079Y2qQlskuHixzYhScmQ2pcCF0bdo2burkOgGtaC/f9X1bu7gUMcBPv++15aXNxmc2kRAeIdJGo4LHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 May 2022 13:16:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YnUDeR5feSsmbCVF@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 560d618b-a5d2-4b67-7773-08da2f51d50b
X-MS-TrafficTypeDiagnostic: BN7PR03MB4388:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB4388791E175F0E46713BB6C68FC59@BN7PR03MB4388.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S2ENZc0ekqZZFUCvmzP/WA/Y2AKNka4Q72zO73Q+Iya6hVaW/yvkHPC2V+6yB21GtHE5DrUYKQLTl2+rBw+FnGDWZZvoupT+77Gd2JxIeidhp3tSXdDg2ULI9OycAY2oJALf3vSPO0LfCO+GBU1m1xEMDeWQ4pYod/qSL1w/JkhAaBMu8dBu4eXhrZkYEvcoSJz0Teln4nKmTFmc49el8LuaSOgqdTtLTqKGWuAtipB34m0yLDFF7uWyFtygv7nq4652CFXc6teZQcqSOlkCvHXvL4D7gqmv0Bs4kwxjdCMCUEy0XONUxlGyX89lFxiA54MGs+PPCMwg+bw0LMxVlu9zpKRJ/M7N+CYU/d8cZan/1oKIKVmKD3IDAhQOIJ+D3mfO15ip40kLDf9BU7l9+00A+GUevVvasTwYdcL2qOWF2OzZaDUghGsp4ryQUgVQcEd/b8+9NdiZHN1xRCB8Sxx4A5ZNSv8a+JnNI/rvTW/xQVNP4oLZOhMGkdXR9WGkBiox+Dxrnzs3ZcPx++IKl1uV1OEqqQnU6ryo2Z8GYEoL/WlQGkTzkEZx5o2z70v7m9UiAIs6lgp+GO2S+9JeKl6Wm72SCs3XBfHqsM7nPUDtmLWqVEtquU99cCjBX+oXNJNmItuMly0c4RifV8Xwwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(85182001)(54906003)(6916009)(508600001)(316002)(6486002)(83380400001)(2906002)(8936002)(82960400001)(6666004)(66556008)(6512007)(9686003)(33716001)(66946007)(66476007)(6506007)(26005)(4326008)(186003)(8676002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmhsTC81WWRTOTFpeWIwZjR4ZEhVd2FsYk1ER1loelo4S29vaUxNWVRJVWNQ?=
 =?utf-8?B?cmVkUzUzYW9GNnhJQjJrSWNmTVdBb0FIREJId3I0UjBPZDRRZmc0TkttcVE2?=
 =?utf-8?B?d09ubnVsdzhUSmJ6R3I0U2NTU0pHc2VVTnF5d1BBNzdYVUZranFPNkFsRVVE?=
 =?utf-8?B?SVMyK3ZJazdORGdTL1hpeEMxSGlCTFFHR3JIK2szK2dGclQxai9PRXZNdnc4?=
 =?utf-8?B?Unl6WmQ5aFNtMmwvWVZXQ1ZtcXdZZVo2WWVUVUFNcmlPdXVTa3laWWxmVEYw?=
 =?utf-8?B?SmpSQnBDbmVWTnZNSFRjck50dEZNcUxOTXBhSTIvRlU0bGxoMng3RGxyRFo2?=
 =?utf-8?B?QkpRK3ZwTXgrRlVWOG9EMFVnMnk3K3U4dlJnZTYxMzR3YzFwYm5taldOYXow?=
 =?utf-8?B?R1dqZzJhMUJpWFNPYy9yazhYNDE2ZXJTRG8wblZzQWd1VlQrODFLOVJYVXpG?=
 =?utf-8?B?UTcwRVRSNUpSZGlpS1crdkRMOS9VbVY1ZXFpRE1UUUQvNnMxNTVyM0tEbU8w?=
 =?utf-8?B?ajB6bkpVYnFYVnliZER5ekk1R0xRVEJVWnVvSUhza2tGd3VyWXVhcmptRnhh?=
 =?utf-8?B?cUJHOEpqNk1UVmhKZG84d1RqWWVjRTRvQVoxTE1iOU5uRDZ2VTFzK3VCQ1Zn?=
 =?utf-8?B?WFZHV1M1NC9nbXhsdVJJTEdnYWxYcXBwdFF3TFQ3NWUzd2kxNlYzT3BvaXBN?=
 =?utf-8?B?ZVM2NFBqRXJiUy9MNW85ZHhtQkxTMmtmWUp4VUE4UW1uUzV3VVFscTZQbzg4?=
 =?utf-8?B?b0JWVEl6S1pxaXZqbU9HTDI3aWtROEpLSzFWYlVqM2QrbFdXRnBUTXg0Mitj?=
 =?utf-8?B?MDVtbVo5ZVY4Mjc2MG10ZS9LaEcrd2VWQk04TkxCS1Q4OU9HZE5FWDBsMEVj?=
 =?utf-8?B?YkdRL2p0VDZVdXVYQnZ0NDl6Y09uNFlUVjZIbVJzS2EvZGFCakhuclpBS2lT?=
 =?utf-8?B?dTdRRk1nOTBMLzd1Q1pFNCtPRnY1RE96NkZiM05LR1VvMlhOS1ZNN2NNbExq?=
 =?utf-8?B?czRuZ3JkanQ4NEk3ejgzVTFvWFgvU3k1QWI5TGZmYTFjSXVNTHhRMW1qdWdM?=
 =?utf-8?B?L3RxRG5UR2lIU2pZV0dWUHNOOW9tUnZkRUxQU2lFMXRzVnJqWkUzUTRTbEV0?=
 =?utf-8?B?MDhCMmhCNkYxaDJiUWVFVEhaVk9ZUStKTStHYllVN0laenp4L1B6Z3l5Wjdi?=
 =?utf-8?B?SFR4bm02bkNkeGRZZ0VjRVBuYi9YeERNMWRFWGNoU083eUR0Rk5XcStHL2RR?=
 =?utf-8?B?bzc2Q0NaTUFRUDdXM200bXlxTkpqK3VKbHhQTmJtUGZmNXc3bjRkMDAwRW1m?=
 =?utf-8?B?NUVKRjlJNkNqaTVTQkd4Nm9ZQVZxMmI0NUZnQzBiWm1UYU5ydkNPaGJVa0V6?=
 =?utf-8?B?ZTZHamp5UFBaeUhMRmt2S3ZjVk1SNGFqc2NJTUtZQmlzNVhyS08vNFpRWXMv?=
 =?utf-8?B?dmtBRkV0dC9TU3ZWc3k5SXIwYUNXQWcrdTF2WHB0WUorRlZRSHoyeG5NOXhm?=
 =?utf-8?B?ZFRKNCsyUGJHR2NlT1lIOWhSckl3VmYrSGYwUVh4UEUzeWdrYlMxOWtISENh?=
 =?utf-8?B?N0VOcTg2QnpraXRxTStRWnRFNnBKT3Z3UEluOVZKSmRJZXBPN2lsU3AwRW1P?=
 =?utf-8?B?Ry9PWTVtRGRWckc1ZjNkZEN2NEJwb3Y4TDJuSFF4UUVOc2p4Qk9WMjFDclh5?=
 =?utf-8?B?elQ2cHBFVzQ1Y1A5NHlTVkV4NGVQSDRZZDFGSkxNMEZJcmhCYUdBbDF6bW51?=
 =?utf-8?B?SkF1ME03U2kvSm81ajdTdnVDT3lTVHQ4aG1sdzNlbVY4bkg0Y05WZUVzdEVu?=
 =?utf-8?B?VWdvY01lNE1MUGF1amUxaWpqeHRWbmlYS3JaSEJqVkNNSmNPT0xuY1NFMHFh?=
 =?utf-8?B?aXAzRGFuYnNWYzVWbDErZDNscFhmRGRVR2RHd0lwT0haSitLbXdmdUliN0dD?=
 =?utf-8?B?cGZpb2I3NGZqeWR4dU00aFFVdkZ4MEdjT2NtNEdJWG9iTFpNTVZxVkZuQXF6?=
 =?utf-8?B?YjcrZU9oN2cwblpJZldsa0ZUSG9xS1lMODlYZmlmRE9RMlhmVWZsVnJjOE15?=
 =?utf-8?B?MGxQSnJ2anNoaTNldmg3Ym1zcUdmMURnZEZFUUtQQ2thQisrZFZVZ3ZOdnRx?=
 =?utf-8?B?aGxaUzNWMDkweVlpUm9EQVdqTW9iMTJxM0Q1Q0xJVDhHblhLSld2M3dmczNx?=
 =?utf-8?B?TUxjaDZPeVViOFJWSXFRb0QraFhIbFR1VmZINVViUytoVUF1emduc255Z29o?=
 =?utf-8?B?UktYanIwbjN4UzllWE1USy9TREp4YVRaS3d4bDYvVnVLZllQTTdXbGI2Snp1?=
 =?utf-8?B?QkRlbGZkcEI3YWd5M2VPWXF0ZTFGUGFORW52cHppaW1xck1oYWN4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560d618b-a5d2-4b67-7773-08da2f51d50b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 11:16:14.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExixGw1XxhPVUOXHCfJLvWIrZDM+dq756XuK54FoXuqsyaU9wCAspz3sYKKYJ1tfY01O/Ho/fPAvqL8ffIMHAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4388

On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
> Page tables are used for two purposes after allocation: They either
> start out all empty, or they get filled to replace a superpage.
> Subsequently, to replace all empty or fully contiguous page tables,
> contiguous sub-regions will be recorded within individual page tables.
> Install the initial set of markers immediately after allocation. Make
> sure to retain these markers when further populating a page table in
> preparation for it to replace a superpage.
> 
> The markers are simply 4-bit fields holding the order value of
> contiguous entries. To demonstrate this, if a page table had just 16
> entries, this would be the initial (fully contiguous) set of markers:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
> An alternative to the ASSERT()s added to set_iommu_ptes_present() would
> be to make the function less general-purpose; it's used in a single
> place only after all (i.e. it might as well be folded into its only
> caller).

I would think adding a comment that the function requires the PDE to
be empty would be good.  Also given the current usage we could drop
the nr_ptes parameter and just name the function fill_pde() or
similar.

> 
> While in VT-d's comment ahead of struct dma_pte I'm adjusting the
> description of the high bits, I'd like to note that the description of
> some of the lower bits isn't correct either. Yet I don't think adjusting
> that belongs here.
> ---
> v4: Add another comment referring to pt-contig-markers.h. Re-base.
> v3: Add comments. Re-base.
> v2: New.
> 
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -146,7 +146,8 @@ void iommu_free_domid(domid_t domid, uns
>  
>  int __must_check iommu_free_pgtables(struct domain *d);
>  struct domain_iommu;
> -struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
> +struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
> +                                                   uint64_t contig_mask);
>  void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
>  
>  #endif /* !__ARCH_X86_IOMMU_H__ */
> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> @@ -446,11 +446,13 @@ union amd_iommu_x2apic_control {
>  #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
>  #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
>  
> +#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */
> +
>  union amd_iommu_pte {
>      uint64_t raw;
>      struct {
>          bool pr:1;
> -        unsigned int ign0:4;
> +        unsigned int ign0:4; /* Covered by IOMMU_PTE_CONTIG_MASK. */
>          bool a:1;
>          bool d:1;
>          unsigned int ign1:2;
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
>  
>      while ( nr_ptes-- )
>      {
> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> +        ASSERT(!pde->next_level);
> +        ASSERT(!pde->u);
> +
> +        if ( pde > table )
> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> +        else
> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);

I think PAGETABLE_ORDER would be clearer here.

While here, could you also assert that next_mfn matches the contiguous
order currently set in the PTE?

> +
> +        pde->iw = iw;
> +        pde->ir = ir;
> +        pde->fc = true; /* See set_iommu_pde_present(). */
> +        pde->mfn = next_mfn;
> +        pde->pr = true;
>  
>          ++pde;
>          next_mfn += page_sz;
> @@ -295,7 +307,7 @@ static int iommu_pde_from_dfn(struct dom
>              mfn = next_table_mfn;
>  
>              /* allocate lower level page table */
> -            table = iommu_alloc_pgtable(hd);
> +            table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
>              if ( table == NULL )
>              {
>                  AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
> @@ -325,7 +337,7 @@ static int iommu_pde_from_dfn(struct dom
>  
>              if ( next_table_mfn == 0 )
>              {
> -                table = iommu_alloc_pgtable(hd);
> +                table = iommu_alloc_pgtable(hd, IOMMU_PTE_CONTIG_MASK);
>                  if ( table == NULL )
>                  {
>                      AMD_IOMMU_ERROR("cannot allocate I/O page table\n");
> @@ -717,7 +729,7 @@ static int fill_qpt(union amd_iommu_pte
>                   * page table pages, and the resulting allocations are always
>                   * zeroed.
>                   */
> -                pgs[level] = iommu_alloc_pgtable(hd);
> +                pgs[level] = iommu_alloc_pgtable(hd, 0);

Is it worth not setting up the contiguous data for quarantine page
tables?

I think it's fine now given the current code, but you having added
ASSERTs that the contig data is correct in set_iommu_ptes_present()
makes me wonder whether we could trigger those in the future.

I understand that the contig data is not helpful for quarantine page
tables, but still doesn't seem bad to have it just for coherency.

>                  if ( !pgs[level] )
>                  {
>                      rc = -ENOMEM;
> @@ -775,7 +787,7 @@ int cf_check amd_iommu_quarantine_init(s
>          return 0;
>      }
>  
> -    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd);
> +    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
>      if ( !pdev->arch.amd.root_table )
>          return -ENOMEM;
>  
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -342,7 +342,7 @@ int amd_iommu_alloc_root(struct domain *
>  
>      if ( unlikely(!hd->arch.amd.root_table) && d != dom_io )
>      {
> -        hd->arch.amd.root_table = iommu_alloc_pgtable(hd);
> +        hd->arch.amd.root_table = iommu_alloc_pgtable(hd, 0);
>          if ( !hd->arch.amd.root_table )
>              return -ENOMEM;
>      }
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -334,7 +334,7 @@ static uint64_t addr_to_dma_page_maddr(s
>              goto out;
>  
>          pte_maddr = level;
> -        if ( !(pg = iommu_alloc_pgtable(hd)) )
> +        if ( !(pg = iommu_alloc_pgtable(hd, 0)) )
>              goto out;
>  
>          hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
> @@ -376,7 +376,7 @@ static uint64_t addr_to_dma_page_maddr(s
>              }
>  
>              pte_maddr = level - 1;
> -            pg = iommu_alloc_pgtable(hd);
> +            pg = iommu_alloc_pgtable(hd, DMA_PTE_CONTIG_MASK);
>              if ( !pg )
>                  break;
>  
> @@ -388,12 +388,13 @@ static uint64_t addr_to_dma_page_maddr(s
>                  struct dma_pte *split = map_vtd_domain_page(pte_maddr);
>                  unsigned long inc = 1UL << level_to_offset_bits(level - 1);
>  
> -                split[0].val = pte->val;
> +                split[0].val |= pte->val & ~DMA_PTE_CONTIG_MASK;
>                  if ( inc == PAGE_SIZE )
>                      split[0].val &= ~DMA_PTE_SP;
>  
>                  for ( offset = 1; offset < PTE_NUM; ++offset )
> -                    split[offset].val = split[offset - 1].val + inc;
> +                    split[offset].val |=
> +                        (split[offset - 1].val & ~DMA_PTE_CONTIG_MASK) + inc;
>  
>                  iommu_sync_cache(split, PAGE_SIZE);
>                  unmap_vtd_domain_page(split);
> @@ -2173,7 +2174,7 @@ static int __must_check cf_check intel_i
>      if ( iommu_snoop )
>          dma_set_pte_snp(new);
>  
> -    if ( old.val == new.val )
> +    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
>      {
>          spin_unlock(&hd->arch.mapping_lock);
>          unmap_vtd_domain_page(page);
> @@ -3052,7 +3053,7 @@ static int fill_qpt(struct dma_pte *this
>                   * page table pages, and the resulting allocations are always
>                   * zeroed.
>                   */
> -                pgs[level] = iommu_alloc_pgtable(hd);
> +                pgs[level] = iommu_alloc_pgtable(hd, 0);
>                  if ( !pgs[level] )
>                  {
>                      rc = -ENOMEM;
> @@ -3109,7 +3110,7 @@ static int cf_check intel_iommu_quaranti
>      if ( !drhd )
>          return -ENODEV;
>  
> -    pg = iommu_alloc_pgtable(hd);
> +    pg = iommu_alloc_pgtable(hd, 0);
>      if ( !pg )
>          return -ENOMEM;
>  
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -253,7 +253,10 @@ struct context_entry {
>   * 2-6: reserved
>   * 7: super page
>   * 8-11: available
> - * 12-63: Host physcial address
> + * 12-51: Host physcial address
> + * 52-61: available (52-55 used for DMA_PTE_CONTIG_MASK)
> + * 62: reserved
> + * 63: available
>   */
>  struct dma_pte {
>      u64 val;
> @@ -263,6 +266,7 @@ struct dma_pte {
>  #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
>  #define DMA_PTE_SP   (1 << 7)
>  #define DMA_PTE_SNP  (1 << 11)
> +#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
>  #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
>  #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
>  #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
> @@ -276,7 +280,7 @@ struct dma_pte {
>  #define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
>  #define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
>  #define dma_set_pte_addr(p, addr) do {\
> -            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
> +            (p).val |= ((addr) & PADDR_MASK & PAGE_MASK_4K); } while (0)

While I'm not opposed to this, I would assume that addr is not
expected to contain bit cleared by PADDR_MASK? (or PAGE_MASK_4K FWIW)

Or else callers are really messed up.

>  #define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
>  #define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
>  
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -522,11 +522,12 @@ int iommu_free_pgtables(struct domain *d
>      return 0;
>  }
>  
> -struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd)
> +struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
> +                                      uint64_t contig_mask)
>  {
>      unsigned int memflags = 0;
>      struct page_info *pg;
> -    void *p;
> +    uint64_t *p;
>  
>  #ifdef CONFIG_NUMA
>      if ( hd->node != NUMA_NO_NODE )
> @@ -538,7 +539,29 @@ struct page_info *iommu_alloc_pgtable(st
>          return NULL;
>  
>      p = __map_domain_page(pg);
> -    clear_page(p);
> +
> +    if ( contig_mask )
> +    {
> +        /* See pt-contig-markers.h for a description of the marker scheme. */
> +        unsigned int i, shift = find_first_set_bit(contig_mask);
> +
> +        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) == PAGE_SHIFT - 3);

I think it might be clearer to use PAGETABLE_ORDER rather than
PAGE_SHIFT - 3.

Thanks, Roger.

