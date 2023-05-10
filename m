Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E46FD949
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 10:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532695.828952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwfAj-0008HN-Jh; Wed, 10 May 2023 08:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532695.828952; Wed, 10 May 2023 08:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwfAj-0008Fc-Fu; Wed, 10 May 2023 08:27:41 +0000
Received: by outflank-mailman (input) for mailman id 532695;
 Wed, 10 May 2023 08:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27j=A7=citrix.com=prvs=487c252bd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pwfAh-0008FU-NJ
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 08:27:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8374b93a-ef0c-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 10:27:35 +0200 (CEST)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2023 04:27:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7171.namprd03.prod.outlook.com (2603:10b6:510:242::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 08:27:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 08:27:19 +0000
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
X-Inumbo-ID: 8374b93a-ef0c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683707255;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=E+5t9Cnnc8is8cu+ovngMamcXn3LD83riIPAV6If2BQ=;
  b=gfF6VbMH+rHGq2orR3YGiz/QytydahAIPCElD+Q3B8QVp7OS4I2WTRmm
   hHKI37lvnv6M82KOLyupqf4mT2iX8/crdQIRFMLYDsFk1CopSjBVquWRr
   sgpvBeEjI+cOIds7kL3NMlyqdtIznUrdYlJ7zHJ5l4V7d2v4IG0D7C1qk
   Q=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 107254847
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wHpRN6N8UWIAGOHvrR2OlsFynXyQoLVcMsEvi/4bfWQNrUpzhjdWy
 WUeDW+BOvncMTH3Ktl0bNu/9RsPvMLdz9M3QQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wRmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qVIOWwe6
 9dbESIAYh6umejo/riXasA506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujeJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrz3LKTzX+kMG4UPLaI5vdgu3KW/XwwWTM7SGSVu/q2q0HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O+439gCLjLbV6gCxB24YQzoHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mpZ5piBvKFopnCPTs0YezHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxawZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:Hxp0sa0Y44iCxRW80r8K3gqjBRZxeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5uxpOMG7MBThHO1OkPcs1NaZLUXbUQ6TTL2KgrGSuAEIdxeOk9K1kJ
 0QD5SWa+eAQmSS7/yKmjVQeuxIqLLqgcPY59s2jU0dMD2CAJsQiTuRfzzranGeMzM2fKbReq
 DsgvZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K10jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtigPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4SkWVfxjIRLH4zJlO81GkVKp
 gpMCga3ocOTbquVQGcgoCo+q31Yp18JGbcfqFIgL3l79EfpgEI86Jf/r1eop9snKhNEaVs1q
 D4FuBBmbxPSYs/cb99bd1xEfefOyjxZVblPW+TJhDfD6cLJ3jRgZj77NwOlbKXUa1N8b93tZ
 jFUExVrioJe0zoAdCTx5EjyGGdfEyNGQnIjuV3x708gZHXaJrVHQDGdXALv6Kbyck3M4nnf7
 KWELJyR8PeDUaGI+t0N8iXYegMFZHbOPdl5urSnDq105/2A7yvi8jyStqWFZTANhwAfF/Ta0
 FzAgQbbf8wnXyDSzv2hgPcVGjqfVG69ZVsELLC9+xW04QVMJZQ2zJlwmhRy/v7YAGqiJZGNH
 dWMffiiOe2tGO29WHH4yFgPQdcFF9c5PHlX2lRrQEHPkvoefJb0u/vNFx6zT+CPFtyXsnWGA
 lQqxB+/r+2NYWZwWQnB8i8OmyXgnMPrDaBTosamKeE+cD5E6lIRKoOSeh0D0HGBhZ1kQFlpC
 NKbxIFXFbWEnf0haCsnPUvdZfinhlH8XCWyOJv2AbiXB+n1LMSr1MgLkuTbfI=
X-Talos-CUID: 9a23:6EoB+W+WG4/nkNPHmomVvw0rIs11bFae9WXdL0GVF2w3dre5aXbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Anh+YDw/rERGgFEqYcgFiwiuQf8xY862kM28IqoU?=
 =?us-ascii?q?l6uepKBNeITSSrTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,264,1677560400"; 
   d="scan'208";a="107254847"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MveKHGzMySexfteJRyWnsUa161pRPSg+CbSoAoEUHZQVLTJoToqisJeH2sDTWK7z7ciOu8VHSs9iL7JEoKeT2CsmkgBn2f5bqJO0AdJrJFlJpnTltXcPlvEFripe+/VPHYCnC9Cfr5fBY79rYCSQsoaPO3rM4WKFP2Ih5Bf/M5BRukv/KobgSWaZbkcQwlUHBR2vmRNwPmYiHTCMXu6cAOQmzLvEJFM2rx3ahGygA38kor0hm8V2J5JQWHeNo6eQuPF0BcQbKiQ+oamakKwWS+hdY7qKTwoQGPY+6aU4YisBaDsLjogGAk3ee56dQOgcPT2rIH408wyAKV3Kej95Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/Hp7+SOjMITpVc8Q+NNKeJqENwNVZysazit8HgCusU=;
 b=CWLTxMA+9h9tfobPRq7TCroVOh8V1k3w8HITimZl1lLw7+F9R9vAL+YAPNXLv2qWmgFbLs6MGU9T6kzWjvuJSRxUpZspWOw1oTi40GzvhlqKJqTTOuhVf3M4pUii+lX93P7N7USwhf4dbhFqy84jsI7epaMp6mXAtImiW2MzB0K1BRl5t0u8hzcVhshElQRC/Sj/aOFEe5Q/8ReAoTFWbvUS2O35JC4fovyK+38Z8P0xK6w1BiZa8m8Iwj+6g28arIlexdQEyJBd5rbuCkqqK1rHHtPXHZLArs5WPEaU2QQx9gWdQWp+jQiCoLM39MxHho5jf0q/f3wLO2d/wuqTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/Hp7+SOjMITpVc8Q+NNKeJqENwNVZysazit8HgCusU=;
 b=I2nV1nmoR6Eu8BdyQv9HBtLoKNq3J/fNFnYFR1a2BCqeNEz6nGcZxUPTgLDBwCxRiKfntFcISMV+RChrX298XnPli6hQQw1Wp+PgMdfoka3qAwPxz9KvfULQrOqItS1x75xMSYD3S0ne9Vw1YGs05jjutqcsT/aHj2NlV4zmhPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 May 2023 10:27:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/vtd: fix address translation for superpages
Message-ID: <ZFtVYEVsELGfZxik@Air-de-Roger>
References: <20230509104146.61178-1-roger.pau@citrix.com>
 <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc750b8d-77be-f967-907a-4f19c783ad99@suse.com>
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 925c38d1-2feb-4ce8-cc29-08db51305ed8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oW55eTveE6X19YZPLSfmldGlsb68ZLosZoNY5H4R3mxvgzX1/TMM5iB6KpFq3I3U7TdbpJ/pS1a59Xa2fbWBmH4Wd6mEPZzYRczd6maFYb1zH5eWBikG7b6UGVpuPRoYpJ5J2pMizy42cP33G/DakyWWNPl9I0VyyUVsa+xwIbCSj+qEJYWMmcKxfY91+t/Z8lOe7MgTc/AGeZBiBd6ZBIaGgpjUOLozTHo4bdOqxqth+64ib7ZOm6UebMJGhNdPn9EOWKepMhQ413dE7X2w0k0UZK3iJDSTGs3bogezXXIOBlUi/mgQrFSlonqzvYuW6ibl4CF3UlQv6DDVH5e6I0cS57DgSlv7BtGf9BRK+GnZ8JBjYeUzUc1/5ejF1KahI5OW5gTJZHBeV63NoDHdoUpxbIDOvOm6IeUTrZgbCkG68bfFmNB7pkOPjcA15VhvJFutRRlHVy071rzNguln6dzrelaz8ck6Gr6JjOikTLLp36+V2qDaFZNpuPn3tY5MOyN+hleoU7Tk5KgK2wEKW1U4MS+6ulD11NtHKqy0yjpQB6xWCM9IozTM02UDN1Tx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(83380400001)(82960400001)(8676002)(8936002)(316002)(6666004)(66946007)(4326008)(2906002)(6486002)(6916009)(5660300002)(66556008)(66476007)(478600001)(86362001)(53546011)(186003)(9686003)(6506007)(6512007)(38100700002)(85182001)(41300700001)(26005)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2ZFUHVOcVdWdXhreWxOL2dtODNPeExZOWVOZlBUOE45SGd5TTRtK25mNjJz?=
 =?utf-8?B?MEpQVmxpQ1llaE5sOS9tbFpqSHlCR1JuVkNYTDFTOTFON0VlZG9XODI0bHZ6?=
 =?utf-8?B?elJxenFRdUhvVmRhdld6ZGdIdlVtT2RyejNUTlVkb2V5VHpXRGx6UkFBNGpR?=
 =?utf-8?B?Mzc1YkxFRzdsM0kvc1lEOTRSRlR1bCtpVmhVYm5BWGpaTEpSS3J6cmF3MExE?=
 =?utf-8?B?UFRmVGhHMngrSjlLR1F3ZGJuR2ZWdmI2NmFFbzU3aDZDYTE5UWxjWVRGbzVM?=
 =?utf-8?B?c2RaZFl2L2NTRDRKakZUSzlNQzFYVXBIbXNqZmZSSkVGMEYrQUdSSHN3NUdx?=
 =?utf-8?B?MUdDeTdnekk2bmtHb0lDNWtodDNYdTdxM2dxY0l5YTQ3aDMxK2hVQURJZWEy?=
 =?utf-8?B?S04vOFZ0Q1RSOFpNWEk5WFNDTUptdHhrblZ4bEM4Q1RoTEQvRHNwQVJXd3gw?=
 =?utf-8?B?SzRNVEdPOTRuRjNIY2V3VXowRXBIeHlzQWw2N1hvUXVTNjBQdXRlamNnMU1E?=
 =?utf-8?B?aDVPK1U3QTdGdjYzRHA3eWhZN0RUcHBudEtwb3dIcUI0U3NMdlJLZ0FocDZG?=
 =?utf-8?B?cmlaUmpKRTY0RnBPUjZheU5sRHdHSEcvWUFPQUZGYXVQZ1Z0aXA4WkxQZm5Y?=
 =?utf-8?B?aDFSSHdrK0hlRDVoQ1dGVFNod0dPMk9xVm9aTGhXR3F5MHl6TkhIZmtpa1FV?=
 =?utf-8?B?VWpyNUMvTlovOUlRMzlFK1Rib3FiZURubXB2K2tyVjZrVWRHNGlvRGczTXBB?=
 =?utf-8?B?dU9BTDFJUGpldHc4VVorYk5HY2FReHY5cXZ2a3F0TUZNN3Z6Tm51alVDVUFK?=
 =?utf-8?B?RmN3UmtpVmt6N2dDZlRETTJlVXZ6TzNZK2Q4N3RtUEVKTWU0SWFyUTA3OFNY?=
 =?utf-8?B?amtGaDdqSXpzZkgxZWpKTGQvMlc5N1VCQWVBWmVicnpzRkJEUklOaTVybDJY?=
 =?utf-8?B?clBubWpZVUVYU0xXTzVVZjh6N09TenVTMFNiRndwazJ3YThEZU12SDN6WnBN?=
 =?utf-8?B?WmliWGtLUURJYkhnK1hZdHJPbjJHcDBBVnIwVi9ndC9GWm1DY0lpRXpZNTRK?=
 =?utf-8?B?STduakE5eHBOcHFlaUVvQ09IL29JQnNXbjBEYkhSUXhoZlFvS09lL1FNZEtZ?=
 =?utf-8?B?RXB1V0NRSDRGYVNCcjlEdTNhWU1RWE01VzFRYm5ueDN1VjhleVdxd2dPZ0Fw?=
 =?utf-8?B?c0lkWmJWOXV5c1MzcXpWbmFkR3o0enIxaUdkc3ZpZ1lmOUJzOXMxQUwwUUd4?=
 =?utf-8?B?aTFkbXk4cjMzaElMSTk3WW44eU5HNE5hd0cyS0ordXdOWi9SdG9wSEd2MEZm?=
 =?utf-8?B?alIvbWZPRXlzVFhJU0psb0NUTmV2czVJKzQ5VmtSYTBzeUFNZXFiV1ovK1l6?=
 =?utf-8?B?U0R3Tm8rZE5FbFZUWWhrUzAySmQzV2J2cDVnaE9VN1owOHd5bmUrSm9rTU9v?=
 =?utf-8?B?amc5WU04UCs1ZWxBUk96RWptbUJlZTBKb25ENFdTWmc5QXkyVFlZanJ0VFBL?=
 =?utf-8?B?SmM1QU44c3BQS2NXMktTVFh1QitQUk0yd1RvZ2VqOWl1SGpEbEhjUXRENE5i?=
 =?utf-8?B?NWZHS2huNFJDbHB5S2Jpc3IyUDA3UmJUaEhMbXF3TjhlVVhJZUtqTTB4bHpY?=
 =?utf-8?B?Vmt5SkVvTWxXSGlUSzhyeHJqNFg4QUU5YkYvNkFnY01KUkdycTdQQVBmQnFF?=
 =?utf-8?B?aEhWQldFZWtybW5tWFZBQlRINWRSajhId0ZyK0NUV1RwSmlweHczckVWbW9F?=
 =?utf-8?B?cTV3dnlOVTRtbE92M2NCZVJ1RjgvTkxNeEc4RlBaenVFNjJIUUZBd0NZZG9z?=
 =?utf-8?B?OWNMMXg2KzVkanY3OUM4SFJpcjBmSDFsSFJVVXBNMWVDb0RIeThHRkVVdzR1?=
 =?utf-8?B?VHlIU0RGeFZ4a0lyL3VZNk1ncU1wWVlUZFh6UlEzdmQ0TzlqWVNqR0ZxUndT?=
 =?utf-8?B?Tmx1K3B1TVFVSVo1dXhIQzcrZjc2K0RYRmNDRmpnMi9qYjhQRHJBR3Z5OVZQ?=
 =?utf-8?B?dU9YckFxM3h4cXpqeFhkeklNZWU4MHBEamp1djVNT25sQXg5dExSc3FUYmRx?=
 =?utf-8?B?UE93MjBhODg4ZjVkQnBxb1ZhVWdsRzFIRnNnbExWUTlKOU82MjdBSTRHL3Bj?=
 =?utf-8?Q?cB1hhZweNaZXDwTzaIwGbiFKw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FuPkU7csWNI1MZarc/LyjRvkNzSVhTu4oM6SBrL9tdTdrRZI/kFbH07wfve580SwNInWoO4StyuTTlNUzqvcGotscuApo3EMsnOHRr3yTXWTnXDMpPbdbFoZMVkRs/bnbtpivI3WbhoQ56EeJUWbizr0z69JqfnGSeBv+GWXICehIr2DedBoTEBth6I0t8D7rA33kkkDphtWmEHqCYUEk8pD7OtjwtOlB5xKKAN8FRNtmm2meB+uEKvGimoi5KBgpaoYPfXCroyQGH8GJpJ1Jg8bUIowBpyjJLG6XdFWzV1/np3pnvmWtTxy4KF1t91kLtsLcTEjIEfMhNo5UL4zGD6xucjS9F8nQrWjnqiQKPXG3i60diXcM9idMqoQVC2byJdnWY5Z2zpOPru/FaqCxn/aaojZKoFulrd4A92B/PfhKUMPml1Mlws3bzc1EG0KSrHAnK9SEv/3XEkYfk4P6MSBBA5a1JT+fxMQmgbHNwMSakPAdxf5Qt1Bc8Gg3Dc8hTBI/SRaQyyCSpXjIh/YXdc52K8JESQvFEk1ev9hAPpjxcdE297+bEIaideonCaZKeUNTjzaik/B8B1tuioPbLhX8ZQcBy4bzaKe6apDNaI8b6Y6f5exmBGKPYRB6GIxwo6nftbOK2jb6/IMrvcV4GkZK42ZTseWTtjbLDq7hqJ5QyxOMCOpxvcI9J2GhDdGPj1NmS6tQsnLzXWHz54uxyOs/jAQQUMFCedRjLiw5JUUwHqJLyg61du6K2NJOZ1tTjtcwB2NPcupYVzuoH0ETfOYbUmOt9Jmmf4dWh/MFhJB3Cdoi/cjgoEGuM+OJ79n/OsLr5Cs4QWSGJDeAFXQog==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925c38d1-2feb-4ce8-cc29-08db51305ed8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 08:27:19.7986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNFt2840DiVtrI8belwtwo65WfGXKDs4xrW/tsqZ9v/3fQ8KfDH5l/ZHuXzF+voOH+hcvqJALPLWXUpNKNo3vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7171

On Tue, May 09, 2023 at 06:06:45PM +0200, Jan Beulich wrote:
> On 09.05.2023 12:41, Roger Pau Monne wrote:
> > When translating an address that falls inside of a superpage in the
> > IOMMU page tables the fetching of the PTE physical address field
> > wasn't using dma_pte_addr(), which caused the returned data to be
> > corrupt as it would contain bits not related to the address field.
> 
> I'm afraid I don't understand:
> 
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -359,16 +359,18 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
> >  
> >              if ( !alloc )
> >              {
> > -                pte_maddr = 0;
> >                  if ( !dma_pte_present(*pte) )
> > +                {
> > +                    pte_maddr = 0;
> >                      break;
> > +                }
> >  
> >                  /*
> >                   * When the leaf entry was requested, pass back the full PTE,
> >                   * with the address adjusted to account for the residual of
> >                   * the walk.
> >                   */
> > -                pte_maddr = pte->val +
> > +                pte_maddr +=
> >                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
> >                       PAGE_MASK);
> 
> With this change you're now violating what the comment says (plus what
> the comment ahead of the function says). And it says what it says for
> a reason - see intel_iommu_lookup_page(), which I think your change is
> breaking.

Hm, but the code in intel_iommu_lookup_page() is now wrong as it takes
the bits in DMA_PTE_CONTIG_MASK as part of the physical address when
doing the conversion to mfn?  maddr_to_mfn() doesn't perform a any
masking to remove the bits above PADDR_BITS.

Thanks, Roger.

