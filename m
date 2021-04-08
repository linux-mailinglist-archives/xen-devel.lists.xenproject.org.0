Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F635833D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107289.205113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTjW-0005cG-4C; Thu, 08 Apr 2021 12:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107289.205113; Thu, 08 Apr 2021 12:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTjW-0005bs-0V; Thu, 08 Apr 2021 12:26:02 +0000
Received: by outflank-mailman (input) for mailman id 107289;
 Thu, 08 Apr 2021 12:26:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7yC=JF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lUTjU-0005bQ-9a
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:26:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aefcbe47-8b33-4a2a-ad4a-34345222beac;
 Thu, 08 Apr 2021 12:25:59 +0000 (UTC)
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
X-Inumbo-ID: aefcbe47-8b33-4a2a-ad4a-34345222beac
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617884759;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Yr9vQzIO6ldStPEebUzy6G1W5rriQJt6tpwHJQHGt8s=;
  b=F1i/Sttve+YIpEZ7/2ySB980I8ZK0vhrgrHIw3Q07T3JfV419sWyZUbq
   DiDlnOsj6D5OuoBIRrrTrQletFo1UjKhE9CV4UuYD3v9yTPYw086loO0J
   dNS92qEqcSlzc2Ww6h2NmmBMHEdNT+G8v0Qtt1i/ATNcV9pGQDHpJCazY
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nXIkj8KdYND5sA9n7TdNPtG+NKl8VcH7ZeQULK2uR3/chCe80RVpS30rHIWhTcFShNW6qKMX6D
 tTKpeRv0NTSomeJby86CPpywQrL2FAxvnyV3dsnmfttIomx5L4ONSsnKDHf2/44cemM+6wHzkR
 XUP3hrzR3eX+o9U7LqH+JQ25Fz/pYym0o4DgkOeEU56e/2RFvGh6g9K0zXnwvcn7f0Wc2uRM41
 Hs5acvQJZhufTR/FFyYM1MxMGAnaR1abhIjg+/cSv34hIXGWS63uXlec3mKIpPIlweWWf8kSY+
 B30=
X-SBRS: 5.2
X-MesageID: 42622967
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7EPNoat5xizjPoKI0rqk01/n7skC2YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwQeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2gjehlIxqov9n
 WArhzh6syYwo2G4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYH7hJdKaFuFkO0ZiSwXYs1O
 LBuhIxe/l0gkmhA12dhTvI903e3C0163nkoGXo80fLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNk+TgbB1kmlG5pnAvi4co/hpieLATdaNLqsgn9F5Vea1wbx7S0pwtE+
 VlEajnlZNrWG6dBkqp2lVH/MahRTAaEBuAXyE5y7ao+gkTtnV4w0wE/dcYj3cN+bksIqM0l9
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XWp0vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg1HwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDeq5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZ4bFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89jQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS11gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PwE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU85b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 hM2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQBuyy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9+O+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt9gTF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh9rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N8gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRJEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH29PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhBF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTiS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qOqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XjKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNvr3JupRd9llDs3YC64GDUWWF+WDep86l+bH10KXiHjc
 PM7O6C8m/yiQI1gqX+KA==
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="42622967"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+IIhNh3SX+j+RDQ6KxLHzGDHCIpAoG0N+FfGA6xGr8ZUV02C783xJO4bUN4B1OajUpKAorLnKCCi5TcN/JauEH0UuybVTH1w+eyvpDngu0syEfuo6KRavg3pXfSpl4Y7RMBVw4aGvU4dWL4tpHfEZfxQ7tpb9sZttuLOBdUhXoiQE03gXuwPiPvS9425O3ejFmq4uxDT936ROWOz6jkwxBok34qY9BoGKGyctE36GGCw8k7BJ+y8dFToh7urzBSaIl0IbjEspk/Lvebk+EnWMSIE7zWkE04cgQ5sFGpuMF8glKkss2o3fu4LJQm/luMI2o2TiQgmZjOg1A8aBAFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu2WN9nGdMp7kCNhADIYEuQCY6LUzH07WnhwEhOWnBk=;
 b=iHFFMxaZPqEEWEEBkYA0evQs0GwB/ykdPMq+OPwObVgx8FFDJC1ksvXN3343g+1xUGB5fxtWiFaLyQnNK7hWP4l5OC7SX7I/8mTLP7vjIiCbFDgCPdqXZ+D2e2sWKTRit6fuvPkt9Y6Bt7OWM9sZxuz5RjD1FsiHJ2fuu+i7K9G68E4hHD6w/AcHrEUfZAD5gmKvDcobY5XOOK6I3dollousL1dX0ENdIXQ+sno2PjnBB+xdEZv2V6zaRm4zHSZ4qUn71HhNxwgJrzRo3ahDmqRz/08cAv/nSAhQLnox/Ts6UgyqYgQrNC1j29o0Zkm5PA9EwUYzpwqQpcopEjPpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu2WN9nGdMp7kCNhADIYEuQCY6LUzH07WnhwEhOWnBk=;
 b=CJLvrjf6OIG0pY/ZLrJpn42uAGPTnPxhlg3ufLLlxJrbpa8lowkQZOjlkwpwoJNoTbFf/GoJTvMRGMi7E4dW6/fKBa7P6qqWQp1m9zvpuPuR5Jdi3OMxgev4DSUna11PD7cGlHDryA5kds3itWXquPF414QTWFAdBKWjdwnplG4=
Subject: Re: [PATCH 02/11] x86/vPMU: avoid effectively open-coding
 xzalloc_flex_struct()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <ec03cef8-a883-fd68-a062-c243d782394c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ededfb52-6dc6-6c5d-1684-d6fe0e14eb74@citrix.com>
Date: Thu, 8 Apr 2021 13:25:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ec03cef8-a883-fd68-a062-c243d782394c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::17) To DM6PR03MB3627.namprd03.prod.outlook.com
 (2603:10b6:5:ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb467065-3899-4cd0-8ee3-08d8fa89755a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5196CFE1A4C23813C815855DBA749@DM6PR03MB5196.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8bvDdNYV1eUJIX+XQG+pieuKvNkvf3/tDQWIZxLaV/CEmLDN4xk96MjHoDxtEoPz0OoJZRfnpaH23BHq9flgSQQNVFWlXwqUUypXIKdLya3nVTLVm0zTkg8XqJy6GvhIPjH3SUwcStQv6VxZjxBz4z3wYuFOfJ0tIl47hQS2ukg+AI+AshThM4RqzJBT2INatJ65fzfmNZoY+AfAIP03NyPGtyGHurVINMIteGosYpkQqdDlsiV39VVHvrJdfpq7Ol290Qc6PWB4CHH12/JVH9T1elsdN1uN2/KkTyerXPeVMw5OmMFwhaWLBiYERF96xAnpk6jFz0RFw/Iwhk7zknuH71CdNebF/Do5Sqpt2Ql0pBs4flJO7vVNWTSElHo21QwrDWbkVXUiNqy3UTzi9MQcG97Vtg1DR8T70cQDKPdQVFPEMm9tVTDQDQab6Vb377vOlT44wIIaP/+KmszYc7lkTDnfSEcEsNUrCQwSHFUmfYlwu6KOnxJwyhl1dczydUqFDRRWH2WCLHMYcsYGcmAZvnT2g7/HqZA8OT+VHgoWEfoPBrKDZKY/y3d7zN17F3upSuY38VCh4dF62Ja6khakYcQpkEyhKiUUYNxn8eKK0uRy67zFdVXmVHmWi71JziHbS1o/8mCaa+BdcK1YZDWQ7WD9CrfDOEIYwf4JvBKdv9MfQzAH7MuRwIO1JhHf45df4IAzC22LFjyAAI82bappfu1wTIdCT9pMOit5Nsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3627.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(16526019)(478600001)(54906003)(5660300002)(110136005)(86362001)(2616005)(186003)(53546011)(956004)(26005)(6666004)(6486002)(66946007)(316002)(31696002)(16576012)(8676002)(4326008)(36756003)(2906002)(66476007)(66556008)(31686004)(38100700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDZFT09KMVdSZmtsRFQwNzQxSVVUYmszdlB0WlJBQmtCbzVYd2dlZThvQ2pQ?=
 =?utf-8?B?YkhMblVldDlTeE5Gc3ZNR1FZdC9NNXl6OHp6a1lwOVRLeXU2Vm1LWnNQSTJW?=
 =?utf-8?B?SktYZjNMWndGUTFPRmYzUEk3NXBJSXFMN0QrVGFZOVFKdHI0aXNZMDVUU09K?=
 =?utf-8?B?MnVNSXZWRWJRUVk3eVZqVjZsSkw1eWJ2UHBLdUxRcGtTc210N3VaMVZUbGM1?=
 =?utf-8?B?Tm4zRXF3aXZUZXM5MUllbUZ5amdCUzh0OXVpRjFuejBsak9HYXdTWUc3TlFO?=
 =?utf-8?B?QkNNVFNhSXZCZXUram9QeEFHS1JtK0lhcCsvNThEMGJRTlErSjlWbUdNSjhS?=
 =?utf-8?B?RXdtS3A0anhtK2JIWDhacUVScnZzTEZjOWFWNkFzbVBGZU0yTVE5aGgzaWJo?=
 =?utf-8?B?L0JiZjhrRVFHMzVBV3YyeEdleEtFOSsrSUpBSTFxMGpQVVVEa1Bwc0R6c0h1?=
 =?utf-8?B?U2U1eWpOaE43cjZqdHU3S1g4Qi8yNnpDVkRrbGtQK1lHYWN2SzVOQmlramJo?=
 =?utf-8?B?VS9iU2tSeWVwb21uUkZ6U3FJOEo1TEJtTG5lUjZpNzFDNk1obXh1eGh4d0RM?=
 =?utf-8?B?bkx3SHNyM0NRUW5jVXhmVDM2QUNnVTJicWJZR1JGcm1LOHdFa1Q4dzBaMzEy?=
 =?utf-8?B?SyszcTNUa0srVU1ONjNEYXpvMkN3eUdEekl0MmFSanlxQk1sQWJRaXpqTGIy?=
 =?utf-8?B?MFRlS0wrc0Z1c255OHQ0dSs0ZmVjdnR5UXBmMk9qcXV0Y2QwQmRKR0FFWHBu?=
 =?utf-8?B?RElUUFB4ZlJYQWVsbTVsMVBYdVR2UkNuWXo2VG8zdllRcUxCd2FNOWtCZitC?=
 =?utf-8?B?RzhQOGwweGFjeTFIZmNTRjNEa1pJVXY2UTRyT25ja1BhVU5zYVFTSnRhalZR?=
 =?utf-8?B?Rm9DWVhhZURZTFMyT3NKT0dscGFNM3EyL0daNVp4NnZKaUdMNExxQVkrUnRL?=
 =?utf-8?B?SkRYTE82WlJKdjcydHA0dkVGWmdySVUxZjI4VXNWNWhaRHNFYW10MTRzeFFN?=
 =?utf-8?B?bFBuRUhqQUNyVzU0eEpzSkRBaytTYmptZ3d3TGFBWFY1b1hLVVBzTzBValdF?=
 =?utf-8?B?d2tNb0xRVi90NWNQRkpqTmJNVS8rb25ZTERrcmNadDZMSUFuV3VldW85MUJC?=
 =?utf-8?B?UmZpVVRoWUo3UVdrT3k3SmhXMi84bTROSG5HckozWXVGelVyMWZSV09UUWMx?=
 =?utf-8?B?c2x3L3ZiNDN1MTlsZ1N4elRUSFhvM1hnQUZjM0ZVOE9QQ1gzSkRmOE5qVUhY?=
 =?utf-8?B?Y2padytqdlJtSXI5Y2FMM2pZMGw0RFg5bTRJZkVzTzREQ3g3TElFdnFtbVpa?=
 =?utf-8?B?aEF3aWdJWEYyUXVNVlBFVXFZVnQ2NEdmblU3NUh0S0VFMkNFbHNHZ0FXYy9W?=
 =?utf-8?B?THJrams2TUxqOUpiUUdicVRiWk01OTA0RzFmQVNMU0FOZzl3NTZib3QxLzdp?=
 =?utf-8?B?SDJWZHU2S2V6SDJqZVVyRnBPdHZkbFpra21pQnRXUUNCQ09UT2dFRUVvREov?=
 =?utf-8?B?MVBMd1ViRGxWWXFDTUphTFYrcTRkK0haaVFXR3RhbzdMZ3ZBaTNyUGlUTnhh?=
 =?utf-8?B?Nng0YlFxQVFhMStCQmhWbCtIakVtenQ5Z2dlZ0Z3QS8vc2diOXNXc2NzWk5m?=
 =?utf-8?B?R1hIZDdMcGZWZDVGMVNRRFh2UWFkdk9qc3p6UU5lUFlEREVWek1QYkRaR3E3?=
 =?utf-8?B?WER6OEMrdExhd1Z1M3RSd1FPR0VrcnJNVzRNanl0WTUxUTJWQ0VPNkY4ZmhK?=
 =?utf-8?Q?pFq6y3XmjOkgOVRjs5gbtlfHP547+mGKqW79Te8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb467065-3899-4cd0-8ee3-08d8fa89755a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3627.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:25:56.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKt1jV+fyodpdNV8HrzhG2QEuw8YKyNzMg8PWR5OT2vUImH5+JPhagLUe0A6Nq+VTdSqsehHEJfiDnRjy/PvWwpxuLO+f5tn74ptsuoJli4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5196
X-OriginatorOrg: citrix.com

On 08/04/2021 13:17, Jan Beulich wrote:
> There is a difference in generated code: xzalloc_bytes() forces
> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
> actually don't want it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -461,10 +461,10 @@ static int core2_vpmu_alloc_resource(str
>              goto out_err;
>      }
>  
> -    core2_vpmu_cxt = xzalloc_bytes(sizeof(*core2_vpmu_cxt) +
> -                                   sizeof(uint64_t) * fixed_pmc_cnt +
> -                                   sizeof(struct xen_pmu_cntr_pair) *
> -                                   arch_pmc_cnt);
> +    core2_vpmu_cxt = xzalloc_flex_struct(struct xen_pmu_intel_ctxt, regs,
> +                                         fixed_pmc_cnt + arch_pmc_cnt *
> +                                         (sizeof(struct xen_pmu_cntr_pair) /
> +                                          sizeof(*core2_vpmu_cxt->regs)));
>      p = xzalloc(uint64_t);

However, this is very wtf, and clearly wants reworking.  I'll see if I
can find some time, unless anyone else beats me to it.

~Andrew

>      if ( !core2_vpmu_cxt || !p )
>          goto out_err;
>


