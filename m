Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7B52E9D4
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333684.557551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzmv-00085J-LE; Fri, 20 May 2022 10:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333684.557551; Fri, 20 May 2022 10:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzmv-00083Q-GU; Fri, 20 May 2022 10:23:17 +0000
Received: by outflank-mailman (input) for mailman id 333684;
 Fri, 20 May 2022 10:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nrzmu-00082X-38
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:23:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da277654-d826-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 12:23:14 +0200 (CEST)
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 06:22:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB4353.namprd03.prod.outlook.com (2603:10b6:408:36::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Fri, 20 May
 2022 10:22:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:22:53 +0000
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
X-Inumbo-ID: da277654-d826-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653042194;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QcEmnplIxFiWVnNUSRM5zx0GUhssE5uGEVHxBoSVwHI=;
  b=AGwy5ckI61l/KTQlTz6uIgVhqT/VKKe1iBBm611ra8V+7N35Knfpgwge
   IqR04TYqv6YBg+OqxRRrJG/T6mZtc+dluwSxoYKXiPM9eBXwD7f2ril2H
   yw4m4vMcqPQpSFhACwde8nq31RIf2k0XOb5KdOta++rcIZaef6dgeOGLy
   A=;
X-IronPort-RemoteIP: 104.47.58.171
X-IronPort-MID: 72175587
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pL2SKajzZxMfeOS5tQHgR5OAX161ZREKZh0ujC45NGQN5FlHY01je
 htvUD/UPvzZYGOgfdF2O9njph4BsJGDn4NnSQNuqXo0Higb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQgID6j0xc5FakVJKmZdAa1N5rLhBUHq5KR/z2WeG5ft69NHKRhveKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehWhp7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wjM+vdqsze7IApZ/r63a+CWR9q2eMB13Vm2r
 Tmc32ncDURPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWgqWOAlg4RXZxXCeJSwB6J4rrZ5UCeHGdsc9JaQNkvtctzTzp60
 FaMxortHWY27+TTTm+B/LCJqz/0ITISMWIJeS4DS00C/sXnp4YwyBnIS76PDZKIszE8Ihmoq
 xjikcT0r+xK5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:TgFSuqOH2hvj6cBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,238,1647316800"; 
   d="scan'208";a="72175587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsZA7Ze47mbye8DlWugW/8fXnoAQ8B5nJRG4gIsdBCm02VfkfvY1KD1n/Ht6Z7fVd+SAtCqNNerzvRj119YyhvfkSdIvChKefQNk45xUpcXAFGdnIppxd0leYVhzzdcSCD29zcVzrSZiErmkgQWfe99ivGHisrLt/UltkDOKUI7ttZ7Kb6K/RKR5ChhHBnc/mH4BN5M5wXVNcjOnQ/533iwK08h3D8ERU/LQl4cWWRP2sZCgg7d2T5qeA7wBcBj3QOqOYPYLr553j39yuCn087y8KNaZYSsQ7ZObgaV2Bg2wwspN11wJjRjnnLzLCKyF+x/yH5yI8HS8epI5rN+DyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOF31MhYg89v7WzK1ZURVJVvLicKiIw52Bpp2bDuph0=;
 b=HvTdhg6HHacRsNKdKSUQHSVWjwB+uLlR8XPfIdY4ShoyhYxHfAJ7H1BAdZSZNaGixQnYUn1QV4KPEGdZ3DR5NKEaGERMniqql6AmtLOh+MSI/9VcnOoC0VC4s6bizxdKrrff0U+tIZ8AKN98dSV4tIkZQpxYuPPLPMqsGxbGGfuxduHxQDOwM4ahsWWaEor+BWfSvEmJmE3jeQEpmA8gCsznDqze26lwSNVr2oJft9jlIjhFgZ0fU2sRjPaHzVIlyIgdAXQeU3/Vs7xU7m4XFuo1t0Vgq5aEcQ5SD6pds3tftoG1bSu+WWcDNShjvCcB76QPhKsVDhyWf/VQXaBmKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOF31MhYg89v7WzK1ZURVJVvLicKiIw52Bpp2bDuph0=;
 b=afMiyYqZWFJYcFvrBZm7DMygKgs5QYcHI6dZWE0p4yx2JvlPqfKowVHtoT8V6v27EC6kxTJTXcqmC3UJcfLJcDPWLX89tgFdWCe1nY0Kn69ssadTfdx3duz/U8bal2iWd10cRE8vw1oaRilbagXI/pzZaBOxAkThhMvjAubMZV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 12:22:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 14/21] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <Yodr+fnu2AxmNdO/@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
 <YnUh4ZbDMZZdCw9w@Air-de-Roger>
 <80487976-5d72-5388-139c-422210bca73b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80487976-5d72-5388-139c-422210bca73b@suse.com>
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c73c81-4c17-48a7-c956-08da3a4ab302
X-MS-TrafficTypeDiagnostic: BN7PR03MB4353:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB4353BB59ECACC101441209A78FD39@BN7PR03MB4353.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QdeoWrv+8DXZscdkIqeBpE7wDaU5f9zu6yFTvOWnQHqFe67ahNNFy4QPoIsO8m6wolC1vY4I2zFQ2ZC3Lcxm8ioUXL5ovY4nNdPRz0xYi3GFGYXGpWMkPBXB6b3CFzNEmbfPMkUR9ngXDIYfsQNagXsGzETqqHcgXaA+1xXJO4xIF1/5X9H04oywtiG7sNuY4yzwhwpt57bjnhLM5N8MG0t4rcrZIc4YGmk66mcHTEKw7e5/rFeTzcCVgYr+Et9HdOADUZyUZ8dz/H8HQf3AGXoFA4bkjEScCe6DldUYutsuL0+sagXL5ajgfm3eTz64BD9kjTT/3vrdLuza2I73/yfMwJJsCIat+67NxmPTBUm/fsg3/fZIOnkITWZTTxvx2FSebOoer3pWg/ijyObrCcJAhPcDlJd1sSu9UQdIr22hbc2sJPmu3NRUsREPDavq+mfM5p/GZ0O3W6tgfl8oXNDsHp188PIV/mknjtBV3jWTU1Nxs5ctj4ZiYlkIufLxzK9AehkaihUREhLnFTx19zP6Syfs4r/S4eleg6dcOHLV0u2PPSBpeJAi6Ja9A9OQacW8ONreLsErQsIFt7hp+7CWVBtFvvsuQ8KE6E3CDW7VJyKNgdHVxT69EzG3blczq+PHUZnRT0S1sKVAQ9OkjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(54906003)(6916009)(6486002)(38100700002)(508600001)(82960400001)(5660300002)(6506007)(86362001)(2906002)(6512007)(83380400001)(26005)(66556008)(66476007)(33716001)(53546011)(316002)(6666004)(4326008)(8676002)(85182001)(9686003)(186003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGVucStLTDY4Y1dpbUxYeWxCU2N6amtnK3dDTFg3R0lacDd3aVgwNDByWVNY?=
 =?utf-8?B?UW1ySHJCVEg0MHVYRHNEWGI3Y250akZ6NTlZckxYTDZ4M3o3UzRVdFdSbWht?=
 =?utf-8?B?VXZab3oxLzNkZFlmaDdsZmc5RDJtdWNvT1BvcUwrMCtJWnBBVW4zRkdaNFQw?=
 =?utf-8?B?bkdGbVVNT3VHc0VnSkpIN3RFWjJaeFNCU0NtU2xwTWo3WWNmOUlBcXFQenRr?=
 =?utf-8?B?S2tOMTlHR0lJYjNhQ09paHowNWdFeE9zTEk2WjlneVVPTGlsL0NwWVAvWUxa?=
 =?utf-8?B?T3FqTENnVHY0czZPT2RPQzFwUjRyTm0wSnQ1c0llNWhuL29tR2NPWTBFNEVL?=
 =?utf-8?B?VUxwZXBwRWppVk81OXJCNHhHZDlPSXFZbm1kcDVtaWgzQ1B0bVdkVE5mUVFT?=
 =?utf-8?B?Zy85d2hwWUNSbEMyQ0tNZHpqTXJpeFlnL2VpWjNKUUFPQzdJMzhOekhtRUJ0?=
 =?utf-8?B?QmpXRW0xd0c3Vy9XS2RXSERoWGs1SXZ4Z2hub1hsR1U5U1VHZ05wYW51cHZm?=
 =?utf-8?B?N3FGdXhwTmdyMk5OcVY0V0VTRytnbnhhQzFKQUpnS3UyVmNZayt4K05ESFFv?=
 =?utf-8?B?MFNtVmFsWFFaTkJwaGRrR0xIQ1pkY1dqVWZqRG1nd01YcGE1b2ZodGI2MWt2?=
 =?utf-8?B?WWlVejdJRDFLNENzMWRIKy9XOUxta1ZseGFLT2IyL240cGUxZkgyYkFNM28r?=
 =?utf-8?B?RjNGbWwxSWpKQWhUbEZsR05ydHdET3VLRDZmOUZydW9pRk4zN3c5U0lJQlBi?=
 =?utf-8?B?bTNxUUlLQmNWdTRMQlFEZkZsa3NZSmo2Ui9VeUZnelRiaGJSTUYzMVpNN0Yz?=
 =?utf-8?B?S0VNdVlxd2FWMVFFN05UTVZBY0lrZzJnRmVQeWUwUVl6T1c3eXU2S3I4NktG?=
 =?utf-8?B?cGl3N092TlJpZWtRblVPU3JKNGt5VzFIOEluZFh2cXdGU2kzK2t3aG94a3Rl?=
 =?utf-8?B?RGlkNFhZZFVOWG1HVDJ2SEw3WjBRUHJZRmFxUHdTaG9JZmh3OVlhY1d3a3hx?=
 =?utf-8?B?TGRmeFUrZDR0R1JHR0owdlFhYXpSM3RRUUFWM3pSLzh4cVZxaDZCT3BtaWx0?=
 =?utf-8?B?ZzgvNjhObFhGYTFJV3NBeWIxY0JITFB2dVVrUFZXa2I2V3g1TkkyTjh4cU5T?=
 =?utf-8?B?OEQ0YUNhM0MwenM2OEZVTTdGWVFib0dmbzB2cEVuMXhENEJpaXJhMlZVdU9p?=
 =?utf-8?B?NWo0MWN1VFJnQ0ZnYm94eU1FbC94THNBWVFYZ2NtRUlDZGp5MHdJNnZoYlNL?=
 =?utf-8?B?eFZMbFZleFZYR05IdVdPdzVtQnIyb1o5V1RGcGhXNXc5U3VoNW5GQ1hIUGln?=
 =?utf-8?B?WXN0YlZDbVE4S0FIanVZUmYycStvT2FyUmtvWmdOTFFMcHU1bE5ocVNEZHoz?=
 =?utf-8?B?Q0hLaVdJZ3dsRjhxM29RbjVhaGlPOGM1QlJSSjBVYnF1d29pWTB4Z3ovL3N6?=
 =?utf-8?B?SG1hQTBiSHpXaVJ6aTdiZlo3clFaNUVXTlltNk45b0MxdTJSTXhidit4eG1D?=
 =?utf-8?B?NnBYeXBJRFVPQmRSWSs1QS9TV1EwWkZBai8yaVpSemdFcWZ6aFQ2WWY5VVVX?=
 =?utf-8?B?d0JYRGlSeHFKNjQrNTJUNXFwaDBMb0toOWQ5OWV4YWowdGtVVWl5ZEFEbm9r?=
 =?utf-8?B?Q2lKMGdxeW1QT25tblpTWkpJTTJzejcrSXRMQUFEYk1xN3VtUVVGaGhnSkJK?=
 =?utf-8?B?Nm03REZsc1l0NmxWTS9kUm93Y2M1ZXFVVTlOZ1UybzQ5OXV3d3pIcFBpY2NG?=
 =?utf-8?B?R0dZbjJ2Z0dSRTdNRnh5aWRWQUYyYlZrOGRaVGVMU2dTc3VtZWxBUkZOT2g0?=
 =?utf-8?B?QzhNL3h5VHYwMkZDZGliczFBeFlIWFhMVWVXN3Bhbk9aMU5uQnRlczRtdk9p?=
 =?utf-8?B?WmtDRWJiTXZwTXBGTjk1ZTBJNit3TlRkQWVBYURPUEliOEl5QmNHMWo0ZVFB?=
 =?utf-8?B?OWNiMm5odlBGSVNFMTVFd1ppRHBtOXM3Wm1meTBTamd6ejFVM1JOT2tpZEpp?=
 =?utf-8?B?elZCTFhZUVkwMmVVNHd4K2Nxd3VXR1phSjMrbWIxVk5OVmJEVW14SnFidG5t?=
 =?utf-8?B?a09ESFJQU0VVUFJTc3pHVWJFTk9lcENCdE0yeENDeGZLRzFDR0V2V3lpMnk0?=
 =?utf-8?B?Z3FMR2VTbXgreldCa29ZeFN1SUl2TFRaSG1TYm4yaTU2b2k5YlFzNXVRT1Ft?=
 =?utf-8?B?VDJrWjV4cE5GNXFjczcvbWNiaDFmNTNwamJQVksrOTdPQ2RuMzNRenpXMGpy?=
 =?utf-8?B?S0NzcjY0Q2dreHdxU1UrdGhpdGFpVnUzZHdXbW10WUFrL01MWER6bGdxRkQv?=
 =?utf-8?B?aUNtR0ZGSi9EdDRyMzFSanRLWU9YRVJ3M1lIci9Od1AyV2h5NkZXTFY3ZHgv?=
 =?utf-8?Q?RtE08+KMOSZrnCqw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c73c81-4c17-48a7-c956-08da3a4ab302
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:22:53.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5iuYXRQBFBMhT8VVuiFvvzofcsDaLJW/Pep5qwSFScy6aLNxNykLRk4Nnwn5W/C4ddiiYU8ag2OZAjQvdKMKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4353

On Wed, May 18, 2022 at 12:06:29PM +0200, Jan Beulich wrote:
> On 06.05.2022 15:25, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:41:23AM +0200, Jan Beulich wrote:
> >> --- /dev/null
> >> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
> >> @@ -0,0 +1,105 @@
> >> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
> >> +#define __ASM_X86_PT_CONTIG_MARKERS_H
> >> +
> >> +/*
> >> + * Short of having function templates in C, the function defined below is
> >> + * intended to be used by multiple parties interested in recording the
> >> + * degree of contiguity in mappings by a single page table.
> >> + *
> >> + * Scheme: Every entry records the order of contiguous successive entries,
> >> + * up to the maximum order covered by that entry (which is the number of
> >> + * clear low bits in its index, with entry 0 being the exception using
> >> + * the base-2 logarithm of the number of entries in a single page table).
> >> + * While a few entries need touching upon update, knowing whether the
> >> + * table is fully contiguous (and can hence be replaced by a higher level
> >> + * leaf entry) is then possible by simply looking at entry 0's marker.
> >> + *
> >> + * Prereqs:
> >> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> >> + *   contiguous bits (ignored by hardware), before including this file,
> >> + * - page tables to be passed here need to be initialized with correct
> >> + *   markers.
> > 
> > Not sure it's very relevant, but might we worth adding that:
> > 
> > - Null entries must have the PTE zeroed except for the CONTIG_MASK
> >   region in order to be considered as inactive.
> 
> NP, I've added an item along these lines.
> 
> >> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
> >> +                                     unsigned int level, enum PTE_kind kind)
> >> +{
> >> +    unsigned int b, i = idx;
> >> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> >> +
> >> +    ASSERT(idx < CONTIG_NR);
> >> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> >> +
> >> +    /* Step 1: Reduce markers in lower numbered entries. */
> >> +    while ( i )
> >> +    {
> >> +        b = find_first_set_bit(i);
> >> +        i &= ~(1U << b);
> >> +        if ( GET_MARKER(pt[i]) > b )
> >> +            SET_MARKER(pt[i], b);
> > 
> > Can't you exit early when you find an entry that already has the
> > to-be-set contiguous marker <= b, as lower numbered entries will then
> > also be <= b'?
> > 
> > Ie:
> > 
> > if ( GET_MARKER(pt[i]) <= b )
> >     break;
> > else
> >     SET_MARKER(pt[i], b);
> 
> Almost - I think it would need to be 
> 
>         if ( GET_MARKER(pt[i]) < b )
>             break;
>         if ( GET_MARKER(pt[i]) > b )
>             SET_MARKER(pt[i], b);

I guess I'm slightly confused, but if marker at i is <= b, then all
following markers will also be <=, and hence could be skipped?

Not sure why we need to keep iterating if GET_MARKER(pt[i]) == b.

FWIW, you could even do:

if ( GET_MARKER(pt[i]) <= b )
    break;
SET_MARKER(pt[i], b);

Which would keep the conditionals to 1 like it currently is.

> 
> or, accepting redundant updates, 
> 
>         if ( GET_MARKER(pt[i]) < b )
>             break;
>         SET_MARKER(pt[i], b);
> 
> . Neither the redundant updates nor the extra (easily mis-predicted)
> conditional looked very appealing to me, but I guess I could change
> this if you are convinced that's better than continuing a loop with
> at most 9 (typically less) iterations.

Well, I think I at least partly understood the logic.  Not sure
whether it's worth adding the conditional or just assuming that
continuing the loop is going to be cheaper.  Might be worth adding a
comment that we choose to explicitly not add an extra conditional to
check for early exit, because we assume that to be more expensive than
just continuing.

Thanks, Roger.

