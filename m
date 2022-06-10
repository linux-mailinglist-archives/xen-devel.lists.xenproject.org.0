Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA55469DE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 17:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346535.572363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgyY-0008U2-SK; Fri, 10 Jun 2022 15:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346535.572363; Fri, 10 Jun 2022 15:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgyY-0008R5-Oy; Fri, 10 Jun 2022 15:55:06 +0000
Received: by outflank-mailman (input) for mailman id 346535;
 Fri, 10 Jun 2022 15:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0XP=WR=citrix.com=prvs=1532263ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nzgyX-0008Qz-3w
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 15:55:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b00193de-e8d5-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 17:55:03 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 11:54:56 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5802.namprd03.prod.outlook.com (2603:10b6:806:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 15:54:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 15:54:54 +0000
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
X-Inumbo-ID: b00193de-e8d5-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654876503;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WcX9YVltZnpPo+Uvp37QfKg2Rw0H3rDnGkYdVEdWPcc=;
  b=LAmrI8pu6tgK6GQFhaWpmD30zNSK9hEz95WU86EEiuhrG1m82ZLMvGA5
   Jnoolm3+BCPZgBPY5A6yMC2WM4+ZCKV3BJdEotOUGu2w86dTcHYT85mfh
   CW1TkFEVUza07NotQQWi3czSAfxV4m8sC6ed3e3+UvvnTr3BgJoWAVUx0
   8=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 72677450
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pRKVKqgBFsgRlZvGKIFkSh39X161WhEKZh0ujC45NGQN5FlHY01je
 htvW2mAa/vfN2fzedBxOtm+pktV7J7Xz4diSApvpCgwHygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVrV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQAOJIqRsr4Xah9nOgB5PIAd2e/gDlHq5KR/z2WeG5ft69NHKRhseKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI4ehWhs7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wjL+vVrvjC7IApZ36fKc5mFKsCzTNx8vUmig
 mTWvGfAK0RPXDCY4X/fmp62vcfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAtVCJMbesDpcA/RDE0/
 lKRltavDjtq2JWXVHac+7G8vT60fy8PIgcqTyIeUREM5dWlhYgplw/OVf5qCqvzhdrwcQwc2
 BiPpSk6wrkW08gC0vzh+Uid2m3w4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1UdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:ULUOlK4mgmPUy4/ykwPXwS6BI+orL9Y04lQ7vn2ZFiY+TiXIra
 uTdaogvSMc0AxhPk3Jmbi7WJVoMkmsjKKdgLNhS4tKOTOKhILGFvAH0WKP+VPd8k7Fh6dgPM
 VbAs9D4bTLZDQUsS+Q2njaLz9U+qjjzEnev5a9854Cd2BXQpAlyz08JheQE0VwSgUDL4E+Do
 Cg6s1OoCflUWgLb+ygb0N1FNTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P+7E/6m
 LI+jaJrJlL8svLhyM05VWjoKi+q+GRhOerMfb8xvT9ZA+cyzpAL74RI4Fq9ApF291Hrmxa2O
 Uk6i1QRfhb+jffeHq4rgDq3BSl2DEy62X6wVvdmnf7p9flLQhKfvapqLgpAScx0XBQzu2UEZ
 g7oV6xpt5SF1fNjS7979/HW1VjkVe1u2MrlaoWg2ZEWYUTZbdNpchHlXklZ6soDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgwJu9CT0TJRgHdlpnFosPA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZnCOIIUaKMexzwqNL3QROvyHjcZd060ij22uPKCZ0OlZ6XRKA=
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="72677450"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALqAPiZgD3ZpJmwq0faFIoKCL/Zh5iREIAeu6FZBH+btpeFaA15g8bXj5gRWwWmGiaGVZDaRwfub1mNtibXaldzFUi7nukEpSHRKzUd7eZlNlFXjQ9cnKvfUlK4BxLD7N2EB6UDEuT0Puf+T2s2QQns24PjxlXletnqTH8mZj1/5e9wUeOEHHp3IbPoxFgcu+zu6I3Hc6WG9nYZJktHJGb2Sr35eJ6u8cxosAl1NTVo8ytt+rGTG2lNpE3qf1HzgY3iIC5Y5gabRGv8V/NqvBdcLrXRrSvijbObtCBdLQGhXXm8DGh3i9CMl3iY5kfLxcnCJ46YUXj8XZiCEthMuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/HjZAoPu/UJkDRozx+9PbMjOL6X89wZ/5Jj0mzpoGw=;
 b=WKwchkz1qpAFXYTxZH5u+TNut3tioqZBWbsaHl0u4UR03P9tvrL2/gkJFdy86EOnPnJMbXoZbazeb0zAaU0vNE+9gxHAr8tocLqrXeMEotFujIwByMhMCg01OzloJlqxFnsuANh4Nmf/AFj/2yV/uYTaJaPzb9uqTpKads6rFCOkIe75fRAwTdeLSLmXCXEqAkY5Y4RU30TrrGuEGZT2LJAzMqB1Ioi2GDfEvmu5l9lFVg8RhwucZ/jz8J0+aigdNq7cdfJqKiNMwE/uYwD5OIjo11yr+R1jhF4v3wFSmFgoI/o7GZzrB91aPhYDalhU34Hgt51++4qdTN1VBQVtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/HjZAoPu/UJkDRozx+9PbMjOL6X89wZ/5Jj0mzpoGw=;
 b=iVaw13SUrvc11mwicC7hLd8G1872LjupGxK0dtHRq1cqQmyZRvbvCoHHa1ipFyydSlj9XgRxixxnquRlC2PpP+AVOMgGO4h29Tb1ZAg8a81ywtYf+eW5xcKwiUQlEgsQU874co7bcszzjFKRFj2/jSNnIxjOAm6Ophl3Dy+Yva0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Jun 2022 17:54:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	George.Dunlap@citrix.com, Artem_Mygaiev@epam.com,
	Andrew.Cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com
Subject: Re: [PATCH] add more MISRA C rules to docs/misra/rules.rst
Message-ID: <YqNpS94THUjnY7Vx@Air-de-Roger>
References: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LNXP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bca57f1c-c4dd-4542-c362-08da4af98fd1
X-MS-TrafficTypeDiagnostic: SA2PR03MB5802:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB58029ECCD89823DC52D4FB2F8FA69@SA2PR03MB5802.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	toH6z2p8HhhqR3I8QYYkwlOUZp9AqwZYRm2YccEMMW5kW40M+ZLE2mvEOP7oGBweCsVz3kdAZJotMg2I/yFminpWylRQ5XwWIzYbx0CgTwXxKCwsVwmOF42coma+afpMc+pbAY6JIYpOhixJwhTltTjbqomft6jjnE+sZxHyps2sVYVQfSu7JLZ0yrHr+4LX8v983Y8vXzPUJLsQflN9eL7O9ySTRGjEoiAciSCSt/wjTJncOxJYEmVG0u5W7BgTgcK6Y0oSDXHNh3iPfr8nFoaXljnzF2TOuzXj2gnOD/OTYjZEpHu4ZLRb1XKJ/g257Pta/ie8cV/4RGGClJCf3kywHb+XnuIXsBAfdDhEbRfpk526SNwFW9fXoOPAzup4E+OhGTIzSNLvoO8UUbMNWEaiOVNQ11fu+npAwCwUeNWQpfBi0sPanm5k3xgLO8XbMqOlElwFinLIHnL7GAlodZpTB8tTnqbxLrqtXFNjL4O3l2slxDT8e78QHRjQmEjlVEFIHdt6QoZpfXIwagu+H0tkUYbCHY0BWijI9hFv3B9I62Z6lFv8Fsx5NBCsyThy6UTx0fNqnl9RIIWPJfBQUFqB8Txl7WwOw/nO9VZ/MGOuQIafbtSS1lO/sRbv9i09nE2iL9l5ny+S9+gL6c073qzLhsx3/PQq1817iba00R+dt4UlWDvCKJ6sZvb95d9nqN8udlLIy6NydDi20hakAfuWzfxLuEWy7DbCE5dbSr13c+YOUFrv0cv54lPIicWU+zfCrleuzFxB62Lv/vj8vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(8676002)(26005)(2906002)(5660300002)(38100700002)(6666004)(6512007)(9686003)(508600001)(6506007)(86362001)(186003)(8936002)(6486002)(83380400001)(66476007)(85182001)(316002)(6916009)(66556008)(66946007)(33716001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFl4N0NQQ05xYlpSNjBlZ010Um9LWkRRS1ZYSHpXRFN6ZW9MSTc3Nmo1Ynp3?=
 =?utf-8?B?VzRlTkIxOXdPNDdUczZJSDhsQmptVlJjODlJTmNPbkVreWhlQ09KRis1SWt5?=
 =?utf-8?B?S1hnWXByOHFXZ1JyZ0ZhRW1MV0c4NG5YdkN0TFlFK0pqdFh0REJDMDQwUUNK?=
 =?utf-8?B?SHFwSTBXZTBuSDFrMldST043ODBnczRiNUFhcUZIUWhkU0p5ZzliYUJLWlJW?=
 =?utf-8?B?OVBtc0x2d2JoUkxRNmRaYlhqOXFaeDBNVE42cWg3Rmx3VWNvNE4yWVB5bUda?=
 =?utf-8?B?ZWMwbXMxeWU1WExpSkozU1JvYkJWSnMySTVSRXgxaGNSbVNrQTQ1SjcvMWxX?=
 =?utf-8?B?ZWhMdVZHYkVISWVHRTVSVnVrcGtSUGRhVVNNZ250UStFcFhKdEhKMmZMaXp3?=
 =?utf-8?B?NHk0V1ZIbVNJK3YwTStxeHJJSzRUL2hIZFJlMExRSDZMY3ZmckpIVGtlTE9Y?=
 =?utf-8?B?RVlSNFlKOVZDSXJKZmNWdzE2VnBRc3Q4K3dMNHdLLzVhZ1RXUlRPMG14bXlN?=
 =?utf-8?B?MDJLUG56VDdTeGFDMy9NT0xTa3Y4Rktac29nYkJ6Mnl1ODdUeDB2T2ZKR21t?=
 =?utf-8?B?NDNPNnNULzBlMFlVRGVpQXY2ZFNEY1ZhdFp5M0gvSDg1MEttR2JNbmJvM1R6?=
 =?utf-8?B?bDFKamtZZGdLUktCcnByaHpxWThTZEhqK1plTXl5OEp6b3d1OEFzN2MyaUhr?=
 =?utf-8?B?RVJkTFpnUjEwdDdmZlZtUVMxVEFtQ3pobGtaL0xsUUI2OHN4dWxNN3czY1Rm?=
 =?utf-8?B?bXhZSmk5UXNoM1BUYkFhUE5FcHhHMFBkL2EvWGdMMkRKKzQzMHYvVWdTeEMv?=
 =?utf-8?B?UTlMSW1rWGw3bVdHd0hwYU16UU1uLy9WcXNHK1BHbnZEYXRQbmFFZVBvb2ZV?=
 =?utf-8?B?MnpCamVaM1RReGtnS0NvUDluaExiMUlhTFdHSE00YnVNUmFNZjV6SjhBcmN0?=
 =?utf-8?B?ODF0VHdMRVBwb0pJcEM2WGRhZnU4aVVmSHl0YmxKaDVNTTFVT0ZWUSsrWW1v?=
 =?utf-8?B?T2pFSWtMVXpFbTJEVWlRODNPUkYvOEs4OVk4L09NVEQzUHRlUXJKa1c1K0tv?=
 =?utf-8?B?WVJPOGpTcy96aWhiMkx4WXBrQ2dpSEgvWStUdExJc09xdFA3Nk5sekV5Tjk5?=
 =?utf-8?B?bTdneHdiUzYvYXoyaU5oZm1WNWliNDBHUzhpVGI1ZUhJMVdsNDVVdWpNTzNU?=
 =?utf-8?B?dkNFSGxRTDBVdHdrZWRKcnkyRU1zRGQrVWJBaFgzMmJzQThETy8vaVM4NDdN?=
 =?utf-8?B?T2g5SWZZTGV6OGQ5ek9EVUxjV1o3Yjd6ZmdWck9aZTBnakk1b21pL0ZVc3hO?=
 =?utf-8?B?WE5aYVlORUJjOTJnRWhGOEZ4bVZGYWxCeGdhaWdOMS9saGxOK1VtNm5FaGpw?=
 =?utf-8?B?cWhraVVvaFBOWEFlTW5sTVJFTzNMV004dUx2QWR5dlhVWUJZMWI5TVErVGJp?=
 =?utf-8?B?bjd5dzRLMTdwY0F3QlJrd0VUblc4SmRSSzJTdXkyMjFrL2tIb3RoT2Zzc2xi?=
 =?utf-8?B?M1ZaRUkzTm51WS9lbnRReVduSHd1V3ZnejNoQk1UWldDak4yNkpCNW1QdzV4?=
 =?utf-8?B?VURuOVNLTWZiT0hVdm0vUWU1VWlBZU5zQld6aUpuL3NpV05FaStYUDZtd1A5?=
 =?utf-8?B?Njg1SUY2cGNicTlSc2JSQjU2UkVLV3Z5eXluVERZNEk2aU41MDcrQWU0dGpL?=
 =?utf-8?B?VllOdDlsZFkydkh0TzVTU1hCaEgyMDhWMkQwaGlOdTZDUmZvTU9GbHhrb2pT?=
 =?utf-8?B?Vll6WStzZGxPcUVaVS9VelVBU1dja0tqWVJlRGN1dlhKd21NazNhNmdBNzRt?=
 =?utf-8?B?bmtsNEN6QXBxclNDZ0U2dDNJRTE1RVZDZGk3RmlOZTlYam1OYk9US0NaQjk4?=
 =?utf-8?B?N2Nrc3F4elArK3diS21MN0kwRFJyVjRpREJCQUZSKzdjNzFxQUxrWGQ5YVlD?=
 =?utf-8?B?dEhTM0M0dHpSSmZrK3ZGZnZjUkpBcXFBZ25vMWxJVzZCd2MvaTVmeEE5RTMy?=
 =?utf-8?B?UjdjYzVENzI5ZlFjaTF3N0trMFNYcFFyVUVuZXplZ2RaM1QzMXpiNlRpTU5K?=
 =?utf-8?B?Mzd5S0I4L0pxTkxsM1RRdEFhRW1VVlpOcEcyQzJEL1UwMWZqVUdBd2NubFg4?=
 =?utf-8?B?TFdKMWxJY2M0RTNpWVBsUzB6T0RXQ2hNVFdKaGJkSU5kNlVjS2QvSWhnRnFD?=
 =?utf-8?B?QzcyeXhyUGpBYS9oZklTdkJjdDU0ZUpzcytJZ083TUx5N2dUWFpEQXl2M0NP?=
 =?utf-8?B?NVZSMlBWMHkwS2QxeDNMZU01QkJYR3ZpSjh6N3c5ejN4NGVEWkczbmZxenA3?=
 =?utf-8?B?d3dYTHZ2QU4xblJUVFpVbmt6OVAzeWJzbWVHZ3hlZmVKYUd1ZlFyNFYxTC9j?=
 =?utf-8?Q?UoCFVI7tvRJBq9A4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca57f1c-c4dd-4542-c362-08da4af98fd1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 15:54:54.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1q6A1tWYWuuFx3AMRudTS+Xix31+goUcfghCL3o3L6FmBk4OO2CYpHChpOwFeUyvqtaBQFn4ACVnlMZJH+k8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5802

On Thu, Jun 09, 2022 at 05:48:26PM -0700, Stefano Stabellini wrote:
> Add the new MISRA C rules agreed by the MISRA C working group to
> docs/misra/rules.rst.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> ---
> 
> I added the rules that we agreed upon this morning together with all the
> notes we discussed, in particular:
> 
> - macros as macro parameters at invocation time for Rule 5.3
> - the clarification of Rule 9.1
> - gnu_inline exception for Rule 8.10
> 
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 6ccff07765..5c28836bc8 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -89,6 +89,28 @@ existing codebase are work-in-progress.
>         (xen/include/public/) are allowed to retain longer identifiers
>         for backward compatibility.
>  
> +   * - `Rule 5.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_02.c>`_
> +     - Required
> +     - Identifiers declared in the same scope and name space shall be
> +       distinct
> +     - The Xen characters limit for identifiers is 40. Public headers
> +       (xen/include/public/) are allowed to retain longer identifiers
> +       for backward compatibility.
> +
> +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
> +     - Required
> +     - An identifier declared in an inner scope shall not hide an
> +       identifier declared in an outer scope
> +     - Using macros as macro parameters at invocation time is allowed,
> +       e.g. MAX(var0, MIN(var1, var2))

I think you want to use the {min,max}_t macros as examples, because
those do define local variables.

The rest LGTM:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

