Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5F516ECB
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 13:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318792.538712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlU7z-0004XR-7s; Mon, 02 May 2022 11:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318792.538712; Mon, 02 May 2022 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlU7z-0004Vc-4V; Mon, 02 May 2022 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 318792;
 Mon, 02 May 2022 11:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=deGg=VK=citrix.com=prvs=114a22fc5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlU7x-0004VW-3Q
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 11:22:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 167c2de6-ca0a-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 13:22:03 +0200 (CEST)
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 07:22:00 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Mon, 2 May
 2022 11:21:56 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 11:21:56 +0000
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
X-Inumbo-ID: 167c2de6-ca0a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651490523;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y7NXiw3N0a8BkFT1wr6SrlMM7QI5ROjAHEcLs6Gb2qk=;
  b=Yjbml0IyFf3rWv5jeJwcaRlVMeWu/1eWty5zuc9PnTEVpVJ7LZSytySD
   NxrdeCyyq9ZiwnHjPtmauKZzKXNAVJtPsg3lSx0itVQozic6PoajljNif
   aH+q+cOlEt98VRnx/7y0Bwe1g1Y2OmdtQUYwxHuZFLkpOVKrDG71JwzVb
   M=;
X-IronPort-RemoteIP: 104.47.58.176
X-IronPort-MID: 72835104
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AMkHPaNInSXFABvvrR3RlsFynXyQoLVcMsEvi/4bfWQNrUoghDxWm
 mYYXGjUb/eDZzbxKt4lady1p0NU7cKGzYMwQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 tNws6yUE0ATELDRnMIeQTQHKCVZMvgTkFPHCSDXXc276WTjKiKp6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7EdaaHPuiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33CmkLmQA9Dp5o4JuwXny5gZt+oS3c9DbcZuSGvtwrmOx8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FOvZsnwWVu/unHsg/IHc99ZEul/4gfdzKPRul+dHjJdEWAHb8E6vsgrQzBsz
 kWOg97iGT1otvuSVG6Z8bCX6zi1PED5MFM/WMPNdiNdi/GLnW35pkinogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:LhZ8MKPcFIIjIMBcT0j155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DsrvZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolCs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REIGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUETA9OL8y7qvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wM9HdwGOt15Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexrwqEH3QSuvyWqOLtB0B1v977jK3Z4S2MaGPLQ18bpaou
 W1bLofjx9+R37T
X-IronPort-AV: E=Sophos;i="5.91,190,1647316800"; 
   d="scan'208";a="72835104"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl1VSg/8w2F7xDVNLwgDdrju1d/g7nhltjkCcjzYG6lv+c7roGKbhvJcuLcX6SdRzklDwy+Qz3pp0TVM1NwV/EVcvMvyfYtlS/j8YlwZvu1ycLxhY3aCdptkb0Qg9ImgdyqP3n45UrVzArYRTETzDLJ2WfBGzuQL6kjCwP3QiytDuZmeeSghi3QWFmt+LhD1AtlhKQYVjCVxaXgsdI7dy+dAiNmXQwHZBpcHJLjQY5kVRMyL7YDAWXxS9rh9jDraOB0DUyQyLld6s29NEu6AGhbeRcuWdU5zRgOcoJwbkF1PxwdK7Cx+15yYvb2NT3hh4rMj8ulZ0iucteSy6VmVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9V0//fxVELBYtkHnCNEllJOvAOLy25v9knmvwKQPEvE=;
 b=DlZ96Qncrsw+iBmOEQU0ZFEpmLaH2V/kYIePjyI649KzAbRV1/GwEQn5xbU49Qz+HbOw7VI8dui/W/DCGReu49XvM2MN38miw/h8n2Xkzv6+H580uIZDglmBlDHURb/inAc9viY6bDN5qLpynS5VyYMoY4fMm6XiitE+jbqo4IyDh2Z9uklYpG/5s8CRjY35ZxJ4vWaB3LZyv3WvtLeGqlgEbm8yqZbz3OiQoPcDClTe9cYP9SSOSeAwWx7WNvdSOeMuGceZWDX0gn9B1ymVbyP9MTfi5M/aeVrRiPwcr6M0DWb3vvahBfx3U0EV/7/16FvdKktNHiacOahsvP6XHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9V0//fxVELBYtkHnCNEllJOvAOLy25v9knmvwKQPEvE=;
 b=U7+nFcJCMg+saS9TXXOI5gZ6g7RGJfQF9hKByNAoy75sC8IeKYFnDQdA7eLxr2p1D2h9D7CcIEZTjglVYnLIDOwrUz5ODCKvKKbn1XCbzoU1LE20LuP5XaqrISyFwE+fIGJvExP3Xd4t9XxhyYwsXF1p3E9YfO2IHdiivC3kdUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 May 2022 13:21:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <Ym++zzcrjGX084bm@Air-de-Roger>
References: <994cfe5b-21b8-c59d-8160-792975304604@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <994cfe5b-21b8-c59d-8160-792975304604@suse.com>
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0a25c4-4b3c-47ee-4d2b-08da2c2df754
X-MS-TrafficTypeDiagnostic: PH0PR03MB6979:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6979297252176BA43B3E92A08FC19@PH0PR03MB6979.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQRQCcUf3NmJa4nTxRr/eLsET6PRBpaIXldTGceRoS5VnmSkbffigKXq99cQSndZ5kkYaAis8jEoAbHFZkqVuSI50y+LoGRrCPBpDRpFV9mJ+Kn6t0MkQCShz35/fbE5THrf/g7sYUIRHr2osFkwsdzwcmtSZkAu2dZD2op8Fh66nu3VV6N+0uYk1lSbS5lGOeErYHFr3y8M52eORUMNzOyDSlQ1R6W0pFtex8GDSNrOehsJ5Etd1KzkDA5imjR0O5P4az24cObeXfJbG4vgx0s62Sja7Df5G22IlCz1q8btZCYu+Nti1z8+Q4ejFPqLHRfWSyQh1jctFaO2+yTs7zfuG7Lfpyxrf5bKW0C/Gs9dmGjp4gNAC2aqgFCnQ3ME9DJ/X9dX2+BnLnIlh+fye7JU2go7pws2RB2UeUc6VRfLO43dRPPPevD4k237fh6OU+5VJuYgltEQ2z+RjC+BCOtPmSrJA5Dtlh6on5RNKjPLYrgBjXsYIP2OA5s+/0jB6HoEps2M9xGUIfnx77rQkFwjokVaKwOv/koJ3WkWyqQPbnXNmTX7HKhVfXOsLp5PTuOcvPA1KENuErG/xxvMYta9HlXp2yiU0UF1nHnFQo6wHTi6z6gKwoFt/vyxE+qR2Xnuuy8cXzv9l4V4aiJt4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(66476007)(66556008)(186003)(8676002)(4326008)(66946007)(6486002)(508600001)(6506007)(6666004)(9686003)(26005)(38100700002)(54906003)(82960400001)(316002)(6512007)(4744005)(8936002)(6916009)(2906002)(85182001)(5660300002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGp4UFErNjhaaHRPQXpWekZHbHdzUmRIMDdjWGNlcTArdHRyZkJLUjNoNkk4?=
 =?utf-8?B?SThMYmI5M2FTa09RQVczSHpxNU9pU3ZFVGRKQ2h4WVpLZUFRU0NOQmdVQjdN?=
 =?utf-8?B?REw5ZnZXa2ZpN2VXZWlvcVZ4ZmtGL2ZRRE5yemJPNHZkYlJ0N2NPUlE4TzNt?=
 =?utf-8?B?d25CdTg5ZGsvTVlQYUVVRmc1ZForMm5rWVVqT3E0cktpZ3lVVU1lc3h3RFEy?=
 =?utf-8?B?WTdSWVJqVlhzMStCRVpPMlZKTDNvOVUxczQxR0k5bEtBZktVa3VHNTlNMWpa?=
 =?utf-8?B?U05nQ3A3TUxEWW5mUW5WTEdyTUZxdUc3UmF2NEdnVWhzTWpoVUJxMG1wWVZG?=
 =?utf-8?B?RnMxOEFVaHdzNWl3UjFycWdQNGVEc241SVMrSDkxWloyZnhDeGNMR0F6dzFa?=
 =?utf-8?B?SDQ1S2svalp3QUZLYkpYaEt5TXN2dTdSeU1ldVpwNUFBMy8rUkpPRFh6RndL?=
 =?utf-8?B?RG90U2VkQXd5b01ZZlR3TWRrVjhsQkNaZmdTU1dkZTVkSVEzaGZqR05mTDFy?=
 =?utf-8?B?TXNDVGRtcHR1NUhnWXRZUzBnKzQvaXVaMFNlL3htcy9hZS8vMEVTaFY5a0NR?=
 =?utf-8?B?S1MwWVVsL2VlYmVVb0c3ZjlLTnNXTGJjVUowd1I3ZDVIeEE5N0M2ZGEwTE9k?=
 =?utf-8?B?VS91R0RRdnNVWVZRazh3MGIyRVNaNkFUTlBkNTlYSjhVZTlZdmNLQlNvYmRu?=
 =?utf-8?B?cUJVS3Fud0p3b3lBaFgrY1gxb3ZMNnhpU0MwZVFpRUo1UXVmU3VaeHRnWUZZ?=
 =?utf-8?B?RE1wUVo3bGplYjlwejNBdkg3MTJGcUVMUFpIOUY2VXYzTGdvWmRrVDI4aFI4?=
 =?utf-8?B?YUFLelkyakZNQ0Jwekg4bTdBTXgzWGtseVJKMExYT3dIY1VXTzBmWTNVMzFJ?=
 =?utf-8?B?QVVraWswZjJ5NEJOY2Q1OEo1bTRvbXorNktQeHp4bytjK2ttT1piSld3RDU5?=
 =?utf-8?B?a0FEKzg0NExXVGZLRnlQQXF3S1JLZ3k3Q1NEM09LQi8zbWhMUmoyM2htM1hz?=
 =?utf-8?B?VmtSTHlsM1dXVTZwRDBKOS9HSWlBUlRuRmsrMjBoRW9hQXVWR0ZPeE96VXcv?=
 =?utf-8?B?REdnV2FBUWxNcEp5ZnJpYnk1cDA2eTRlQWg0YUI1M2RRNVduZUN5elhEYTF5?=
 =?utf-8?B?NkRFY3NJejFER0tsZVEyTE5vL20wZC9kS2dCVXZsbHhZSlNGeUU3K0dORllQ?=
 =?utf-8?B?cFlBeEtxc1BaNTdaVUxPSVVaUlYxcnFFaG0yZ2Y2R2tZU3dzNkJpT3djUHRx?=
 =?utf-8?B?RWQ3SmdHQ3JwOXljdElrUDlaT3ZZQXliVjJSSFBoSmZLT2FXQWRsNkxCR3N4?=
 =?utf-8?B?OUVxRUZEZ0FRZ3JZYWR4a2gxUUk5WXI4Tm5IZ2pYK3hOK3Fndkp4UFdUNUxH?=
 =?utf-8?B?QU9CZ0ZlV3BUZWhGZnN3RmdsSjRNUjk4YXl0elYvTE1Gdy9uTm8xamIxYzdl?=
 =?utf-8?B?NFpzalZBUTlxVUNRMWJFZHpkcC9yWUFtU0JsMDJtNDlpOUZENnFlNTBlVVJZ?=
 =?utf-8?B?R2RRUk1uRDFjUy85dDdEOW8rbmxQalFreElka3EzM0VNNEtrUW04cVYzZDJ3?=
 =?utf-8?B?Z0tlWTJ5Q28xMkpPeGZKS3E3WUxzRURNaTZOMkYzZllBRW9iVG1VUG42ZVcr?=
 =?utf-8?B?cVQ3aVNaTmZrYXRaYzZjSlBxckpkVEVWOHdlaXhTME9NYlVZTEVCbkZtRXF6?=
 =?utf-8?B?WmFMTlNvMzRLR1VJVVZvMHZSTUxPTkpTdTkyUEY3U1hYRkhFRHpKM0lZdlpp?=
 =?utf-8?B?WHpSYVZyUTZpNUZWR05HNVJtWVBzS1FmUVBMWjFTbXZoc05nOFdNNlVpM1U3?=
 =?utf-8?B?RU0zSk0vSjk0U1NmRDh5UFB5Qk5haDZETVAvMWJZUE5aYjhKQUxMTjFTQ3RP?=
 =?utf-8?B?M0Z1UU5Nd2xNeHArQjIvT05GeXFDK09JZEkvbVJGc1FNUmhUWHRLNnZkcjFT?=
 =?utf-8?B?TWd6MVRGbmMwYmVnenREYlRsZWNIdDlzRFo1dFNhd2E2Umwrc1ZoaDUvdk5t?=
 =?utf-8?B?Zk5JT0J3YnFNU013WG9BWjhUcnd1RGtqMndQbjlYb2hXOWNVT1dwUjdsTDMy?=
 =?utf-8?B?U1ZSK0pVMnNGVmkveTVmeUZXenJiY2NRY1BtQ2ZXRlVCWTFvdlQ5bWp0VFlB?=
 =?utf-8?B?dFhWbm42eW0xM2JYcXNvQXExRWYweEF5YUowZXV3S2k0Yk1iYllqc1NFR1dQ?=
 =?utf-8?B?dDV4ZlFUM2hJN1NyN0RBWGkrWVhhSXZLNG4vWGJyNE5aQjNKaEhQMDFtdnVQ?=
 =?utf-8?B?cVR4UFZnZld1Z2I1NmZFUkRmNVIwaVgzR1ZTUCtVczBhNEpXVFZNN2FrRGVH?=
 =?utf-8?B?eHEyYkxHaTF6OWRJWktUdjhodmZpdU9tLzZUREVNWlhBTTRRb0tka3ByQ2ln?=
 =?utf-8?Q?EHwyOvKlQWb69C4U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0a25c4-4b3c-47ee-4d2b-08da2c2df754
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 11:21:56.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofHH5L7W2SF/BL3cDuItVsUzrvoCBIHHoIMqRr3UXJF+Nbse8QvCjEV2tIw+k9P6Hf7CyLdWOf0Iz7GRlP9c4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979

On Mon, May 02, 2022 at 09:09:46AM +0200, Jan Beulich wrote:
> Support for this construct was added in 2.22 only. Avoid the need to
> introduce logic to probe for linker script capabilities by (ab)using the
> probe for a command line option having appeared at about the same time.
> 
> Note that this remains x86-specific because Arm is unaffected, by
> requiring GNU ld 2.24 or newer.
> 
> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

