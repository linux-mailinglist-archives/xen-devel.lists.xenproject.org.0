Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609E6CA1B2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515152.797747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkRj-0005cw-SS; Mon, 27 Mar 2023 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515152.797747; Mon, 27 Mar 2023 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkRj-0005av-OM; Mon, 27 Mar 2023 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 515152;
 Mon, 27 Mar 2023 10:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d31z=7T=citrix.com=prvs=4435eb1af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pgkRi-0005ad-5H
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:51:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4faaefa0-cc8d-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:51:23 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 06:51:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6579.namprd03.prod.outlook.com (2603:10b6:806:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 10:51:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 10:51:15 +0000
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
X-Inumbo-ID: 4faaefa0-cc8d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679914283;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nDfU7XxFcQZEnuPg1aMvF4AlPD3NK15QX7R5KpAqmyI=;
  b=acuiPN8b/nyO59bTT8AqHhG1UcsKQ+TlE0LZ5xIqTeMi6WikFEM2lSAj
   Kg7SpNUB03fxXB5vJLU+YM4FszjmEB74A/pd3HqgK5kO7OgznEzBIfFPD
   5WA08De5yHscGBbLmdwESF7F1SupJFa7BE61ajgvhjui/h5Ij3CQwmF2+
   A=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 102966163
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+CrQQKom8kzfAm3wVN8SDTSRC4BeBmLFZBIvgKrLsJaIsI4StFCzt
 garIBnUMq6KZTenfI9+bNiw9EIF7MLWnNIxTFZq+C9kQ34Q+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABcJYUiouPjm++yqaMwwhZ89HpLkFbpK7xmMzRmBZRonabbqZvyQoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYWOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpIRePmr6Ax6LGV7mYYBwQcUQOUmtDnhFO1e99/N
 RQ44RN7+MDe82TuFLERRSaQpXeeuxcGVtl4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGRA0J+cj+o6k8ixvOSpBoF6vdpt//FCz0w
 juKhDMjnLhVhskOv42k+XjXjjTqoYLGJjPZ/S3SV2Ohqwl/NIisYtXy7UCBtKkbaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhknTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:hBYFCqO+QNHJOMBcTgajsMiBIKoaSvp037Eqv3oBLyC9E/b5qy
 nKpp8mPHDP6Qr5NEtQ/OxoW5PwOE80l6QFmbX5VI3KNGaJhILBFvAY0WKI+UyFJ8SRzJ876Y
 5QN4VFJZnXK3MSt6rHCQ+DeeoI8Z283Jrtr8H44FdCcTpDVoFHyENCJjvzKDwUeCB2QZU4EZ
 aH5tlKvVObFEg/ZNigG38AU/PiirTw5fDbXSI=
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="102966163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZdIB7451hry+uNdd4vyXFp96oNQqhQ0wGScUxxr5by3ak2eT7Ajr6A+/YRN9iK++Vdl0QEitijqGtB8DiRT9MUzWP0RI7Ue4RJingAHwCVQW4vjA+PZuhOZLle+ZXy1DcewEGiOil9hl+jVp1ZizWIkLzzasKSPupKAWgaE0MXM6G88J2OXbmEuYJk1mv9JuizJBmZwhHD5Z3tPAjBhPtlpvsd+XCXAIdLzZmXFyMaJxBIecOgxsgd+ibQJ9ON4AryrHpi1HjkHuRyL6XYKARIQHi+LZn9smG1JVdexOeFJu8mvwQbkMUI4T9wDvurOFEJ+NhT3WTcduYpTJXvOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxLmlCri/Usr7kBiuiOAj4nioLjSMOq57h4BhbeIxDQ=;
 b=VFN2axTdpx/Pldxf+ZA/A1zZFKqObYx8dWd+i06hTWWg5XQo9IR8r8mcNJBEpq0wC8tqvoapAgOILuo7aN7Sx1hCGABDk5v1Y9V0a1NuHhZNYWUL1RvnScr0Wgw6vbiUAd2xruoe7DuCYh1dZs21KHACS64+5chk+Rk7/wWI8bzK8F6Tu3tgr69zdL+OuyK+nwzWG/QoB4EtNVvqv4KfL+YZn/fbCHZM+/HvLLfhe1O5H15G8ld5WC67gXi2YGgb80yik3+D7Z9ZT+O/pcet6XwT1bSQzFCrUlL6HjZeHYelggRCGiux7M2rGTewW2C0aK8Ufhs2xB0zIuYGIq1YXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxLmlCri/Usr7kBiuiOAj4nioLjSMOq57h4BhbeIxDQ=;
 b=ix34M8zrzPNETBpf+PjPr7IkMmuBD2hfJJUHoaoMa5+C6+4wmvhYpEz6puWk+R5PKs+7PXDGqTdiNACoEu+u/W9kXW2oLYJP2VxB3QCPzmiIhNQY2i/5IV2M7zhwMoPbMcdLoXE9qKCgN1aRWl/junxYcR48g4t0FTZz5MmbOis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Mar 2023 12:51:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCF1HX6Dp7mrm65l@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
 <ZCFvPTpOixe582JU@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCFvPTpOixe582JU@mail-itl>
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3fe690-0099-4d44-4995-08db2eb1302d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J25Q0Hbx89abG6n4e+6mFQF6N9lq7mCsWHQVT1zL09s3ZcdpRGcarLfjMjVIRnigyTKBw3qSAfJMs4Ihe3CfM8+1ykSfk0oSry7Bt9KTceh+wyhn6bDR0kB+Rz7oJIUGZ3f4jh5KhV9DD04UuCI0727j+EA7bvUPNDYe1NuO6fzwN6ggwGDYmorPmyUXCceHsPdo6CUCb93GGGK5teAGy/VVFK9QnN6awR+FhE4/msBcgoUfzSQekL4hSFR0rNqcyz/eAA6QnjX69klYOZSVrTGL+6+c1thV7x/fjrVeueRhYIijCa8p7mgobJ3lNVCIIpG+nnQ4Xtjs4P8LfvKMGtbuQbpDFkekg0oSn7mp2wR/WBh8Wkgdpfw7jSxKd3S056PETGkTMW5vzqDCzVPJZitaapI2n884R6+IEVXLXpo7N/e4fM7bB37+Oqry0W0O+GQ2mK/v8teIDaZZB/q9/URBLzbEf058u7tFs8JRHCqpHBSCAGyGSvDtluJSWxlE180YM5SSBgidUHPFWeKgt80tTjFIvh/15IhyS4WO6TkGD/B0hfEDD87+re1BW8Rw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(8676002)(38100700002)(4326008)(66899021)(54906003)(85182001)(82960400001)(6916009)(316002)(6666004)(66946007)(9686003)(86362001)(6506007)(6512007)(66574015)(478600001)(41300700001)(5660300002)(6486002)(66476007)(83380400001)(186003)(8936002)(26005)(66556008)(2906002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2ZwcndxUWgvZXlhemNxdEZrSHZjWUNYUmlJalZOTUJpRnd0UDlCcCtjNGk0?=
 =?utf-8?B?d2d5TDV3SEtSRWU5ZDRwU3pVMTNoRld4NW40SGU3SzA3MkN4MnZUc3FQdXcx?=
 =?utf-8?B?UERsQndTYkpTYi9kVlIzcmRoSi9acEdoMGlWMSt4VVJkNFRVN1ZLS050MTJG?=
 =?utf-8?B?SUxhQzlIWnNwQWZqUm9qaWRKUmRRaS9xeTNkTnNvTGRqVUxCeEQ3SmJFNlUr?=
 =?utf-8?B?ZU0vQ2Rycm92RjhkSVQ2Sld6cHltbVdhRkNxTnU5bWFQQkFGTmwyeUxBVnVu?=
 =?utf-8?B?WWRXSFE4Vkxva2lTSFhCSG8rWUE0dHlMZForMTd6bis2QVNGS0RlWi94dFV0?=
 =?utf-8?B?ZzJqNUpONXNBa0hlTS9jam9qNjRUZHRwUE01NHkzZzlpSjRSTkNzM1FLN1Jt?=
 =?utf-8?B?M0ZGWjE3U3Q5RnJueUtMZGZjNjFGRkZVcFhuMStUTUZrcW5PUjZnTU9MZHNo?=
 =?utf-8?B?Q29SWWw3M1dhUlZSdGxTVjJBMjlBcVJhYlVFZnRnRmZJVmlLVWFNZlFPWlVP?=
 =?utf-8?B?Z1dlY1hxVmZwTnh1VVk0VWhxY0xHZ1NONVFUU2taTnZxcU5ScEpqUlpXbWlG?=
 =?utf-8?B?Z0M5UWlLOHhoNlRzS2NQSVFQSWhibkZ2eWFrS3ljaFgxclNidWJRVXFuRGdZ?=
 =?utf-8?B?VmJYdUhVUVZTT1ZvVHFuMDUwY0VWVkZIaHJpWlQrcmg2THh4em1RY1VtME94?=
 =?utf-8?B?bk5DNFdteDNIWWZkSVFVTkZrNk9HTXUyZUwwWGtJNUkvTmFnQWxRUERDWW1t?=
 =?utf-8?B?MHdtY29wa1MyWW1CTGNHTjNYVXF3S0JENkxzSnFHbVNCNnRsT0cvbGdyK2Ra?=
 =?utf-8?B?VjlQVFBvMk5LMUNmK1NlcU95VFRnSnJQK3EvZTNrZlJHdzZrS1F3R1NwNDB5?=
 =?utf-8?B?U2FjREZwVjVBaUNTMjNnTC85RUJwNTJVZVNERGF2VUNKMzE0aStQbzRKMjJt?=
 =?utf-8?B?NXdZbnNvWVlGVVk1MDVIZnlxOEVkZTRjVldpWnVObkNJL3BlTWsxZDRkRlhw?=
 =?utf-8?B?M01uRmY3YnlLRlJsRklWeWFEMnRnbkR1MGN3aHluM1NyaklqK3JxWmtKOU5i?=
 =?utf-8?B?aGJIbzJnVUxwd2hkUEVyRHMzUmYyRW03elhUbFRjNmdOVU1sejEwS0RyVDBu?=
 =?utf-8?B?Wndqd0h2dkJoVDIxTHlQYzlPc0JHb1M0ankwN3VudytGR1FyWWVGLzFOaFN2?=
 =?utf-8?B?K2p4WERRYUh5bU5wQ05kKytlN0NLSit2WENUZ0U0azg0R0RmTy92ZnAwOS9q?=
 =?utf-8?B?Z3pRd1BacCtkK0l1TFRFMHIyaDlLQk5pNFpRWjUrQjMydVlEVGJROVpvS1pN?=
 =?utf-8?B?QU5zeCtjWXV6WVNTSVNSVVdLQ3k4RWpyVWV4b2czMll3cnp5YU40S0lheWp3?=
 =?utf-8?B?bWtaMWRZV1dGYThqdzF2WU84aGhzL3l3K29nczJlUml5czFya1ZQMHpybWp4?=
 =?utf-8?B?SHlJYnM3aFg4M2ZpZHJjV3VDdG54WnNCQ3ZKbllGQTc2VFRrZ29aRHpiWWk3?=
 =?utf-8?B?NGZmVVlVRklUUmU1L3ltb2ZDTUZkbS9hbjRtUHNlOE9ROUJZV0kreEFNV0tW?=
 =?utf-8?B?aVRmc2tPcWM5eEJlWS9JUGhDTDF3UlQvSXlUV01FZHdqamxjSUFyL29NR04y?=
 =?utf-8?B?VnVGSGpCUitRdU5iUTVOa05vaWxOZXh4M25Gb0dQYmVWMVZLSlo5K3dWaUlv?=
 =?utf-8?B?dFQrMWgzcWVQUnM3aXFlOGlsVklrQS9JdURJY3EzVDlDQ0t4SUFrUkxZT2F6?=
 =?utf-8?B?cmoraDRudjZzMjdVcDRVUDFuclV6SGFBdUVaUHlKNFFXMmNQZjYrZzAxR05k?=
 =?utf-8?B?MDhXWFc0SmZwd1JrYS9OWlVVbWs1UldHdlE3cjJWZWVSaHovOVlKVVlNY0pM?=
 =?utf-8?B?N0RTVS8wUDZwVFY4TWJqQnh4Tyt6RGZVTHZxc0gvY0xlVEpMNFI1TGRJanN6?=
 =?utf-8?B?c2xhWUtkQnVsYUVYMlliT0dMZ203Zk9PNDcwL3p1d3Fvb0FpYitPR0hVaFBE?=
 =?utf-8?B?cDd6ZmQvNFE3YlpRclRndUs5Vk5jZy9GcmVWeWxRbVVKeGNBcmEvY01qWmIr?=
 =?utf-8?B?elh1Sjl5OVVXWGUxYnRqbU5kV21PTkl1QzBXVUdpKzZJcE1lemlPWHMwd283?=
 =?utf-8?Q?vNhp26HebfWSig8OZMsnUKanP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	niVaPL+rBNA4sS5JdSDPhtmSpSguoFR+kmXIjNwmyfnWJkCWlZDkEfT143YMvqUIPX7SYXu37toA2fr7gZuy/qH2WhmyOLQCbSNBKZFwERA22q3UQFAOnOYZS/56w2t9dTKYLHl5L0HUiJj9pxy11zPc1VnBV8eSzpE3t1YS0irZ387po39iGmOYnF4SzOBXHGJRpibf/grs0/gWRkfcg1vxMvhJTgaVbe5SwgtluJJEDV/l+zDqot8/PlKUO05Hmq+qRoG6f+XdArGvKPfOT2fO9FsiB71S6TuOPR47xR285NjEM98UZ17m1tTlDlSBNGH2yM0FVOeODhn+9O5+2UeEerkd+k8bGMH289TAw0/Q2hox8THB+9HGOKF1AydvIfEv3Apu8FNpbQjSekhmGztNqAwhaYUS0dNM39/dAqA+R//5euilooXzGQnl1ojqiX15JotMDFCMk5vD3LTAZenNea8Lg3oYDdgCo5U2W1caC73RHT3HsUpopzdeh+mI3nuYimn6g+J3EhJ7g+4YKGa+QbBywykhl9N/vC6I3qBgZczXww27ZRqTNKgVS3QQFP7mSavX45c4G8KMaEw6EhZJXKytZQ7Lx2IycfGk9Scap6PKdiUOdmzvxI3i6ot3RUb3PQ0AOkG0vPwHweOKgTaDFrg+EraD8FL+vusHtZtNSJ5x+6E1EaWLd0CXsCvDBFOZPfQ0BPro945+RVhpAf3Dy0D1gnCWLbk+SXxAkSJyKtL1ZqFMFKTbASeLbp5G9OsHsA/v9qZ7z1Lu/K3+NKPLzF5tJRC9WQHUwVIpkXysL/C3syp71k6pcMnuOToFW01E2BxeOQobgC6vQkXJHvKGV+OxM4qF0uEci5TtuqUFfzitxVGGNIsUvnaPAVrsniiGSNvkoDeyIir8fAjYuOYtiXv5idLiQB9SKTns+1U=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3fe690-0099-4d44-4995-08db2eb1302d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 10:51:15.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHl8cgYpCNQaM99HnWCHli7SM56E9Rhz2Kh7LGsxch+g3OoDXX6qdE6TDPe2hTjxvgD45a0eGWCPhyjUh2+NpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6579

On Mon, Mar 27, 2023 at 12:26:05PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 27, 2023 at 12:12:29PM +0200, Roger Pau Monné wrote:
> > On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-Górecki wrote:
> > > QEMU needs to know whether clearing maskbit of a vector is really
> > > clearing, or was already cleared before. Currently Xen sends only
> > > clearing that bit to the device model, but not setting it, so QEMU
> > > cannot detect it. Because of that, QEMU is working this around by
> > > checking via /dev/mem, but that isn't the proper approach.
> > > 
> > > Give all necessary information to QEMU by passing all ctrl writes,
> > > including masking a vector. This does include forwarding also writes
> > > that did not change the value, but as tested on both Linux (6.1.12) and
> > > Windows (10 pro), they don't do excessive writes of unchanged values
> > > (Windows seems to clear maskbit in some cases twice, but not more).
> > 
> > Since we passthrough all the accesses to the device model, is the
> > handling in Xen still required?  It might be worth to also expose any
> > interfaces needed to the device model so all the functionality done by
> > the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> > passing the accesses anyway.
> 
> This was discussed on v1 already. Such QEMU would need to be able to do
> the actual write. If it's running in stubdomain, it would hit the exact
> issue again (page mapped R/O to it). In fact, that might be an issue for
> dom0 too (I haven't checked).

Oh, sorry, likely missed that discussion, as I don't recall this.

Maybe we need an hypercall for QEMU to notify the masking/unmasking to
Xen?  As any change on the other fields is already handled by QEMU.

> I guess that could use my subpage RO feature I just posted then, but it
> would still mean intercepting the write twice (not a performance issue
> really here, but rather convoluted handling in total).

Yes, that does seem way too convoluted.

> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > > v2:
> > >  - passthrough quad writes to emulator too (Jan)
> > >  - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
> > >    #define for this magic value
> > > 
> > > This behavior change needs to be surfaced to the device model somehow,
> > > so it knows whether it can rely on it. I'm open for suggestions.
> > 
> > Maybe exposed in XEN_DMOP_get_ioreq_server_info?
> > 
> > But I wonder whether it shouldn't be the other way arround, the device
> > model tells Xen it doesn't need to handle any MSI-X accesses because
> > QEMU will take care of it, likely using a new flag in
> > XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> > part of the gflags, but then we would need to assert that the flag is
> > passed for all MSI-X interrupts bound from that device to the same
> > domain.
> 
> Is is safe thing to do? I mean, doesn't Xen need to guard access to
> MSI-X configuration to assure its safety, especially if no interrupt
> remapping is there? It probably doesn't matter for qemu in dom0 case,
> but both with deprivileged qemu and stubdom, it might matter.

Right - QEMU shouldn't write directly to the MSI-X table using
/dev/mem, but instead use an hypercall to notify Xen of the
{un,}masking of the MSI-X table entry.  I think that would allow us to
safely get rid of the extra logic in Xen to deal with MSI-X table
accesses.

Thanks, Roger.

