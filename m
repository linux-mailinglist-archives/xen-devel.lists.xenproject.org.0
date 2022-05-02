Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B102516E6B
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 12:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318778.538690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlTd7-0000Ag-Au; Mon, 02 May 2022 10:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318778.538690; Mon, 02 May 2022 10:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlTd7-00008f-7y; Mon, 02 May 2022 10:50:13 +0000
Received: by outflank-mailman (input) for mailman id 318778;
 Mon, 02 May 2022 10:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=deGg=VK=citrix.com=prvs=114a22fc5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlTd5-00008V-Q6
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 10:50:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0a43240-ca05-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 12:50:07 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 06:50:04 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB4847.namprd03.prod.outlook.com (2603:10b6:208:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 10:50:02 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 10:50:01 +0000
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
X-Inumbo-ID: a0a43240-ca05-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651488607;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pWDuLEAEFf5nRVlCvoGlDESZ93GYkTTylokiwwOLIc0=;
  b=IXjI6nXaX1Ik4JPl7h7OeLl6QhFl6uVs1Gz2f3aiwPHF2GFnUJr8oPNz
   wMD8bTzlfJW00AM/NVHUvMR76BTVb30lVbEeDTgmuMchESRnKSqDiKL3z
   V0JS315JRVhYWCujL6mVl2azwckgVI5jXaadXgwkMNksvm6cFgcugR816
   o=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 70247119
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wD+G8qNknVo0HXbvrR2QlsFynXyQoLVcMsEvi/4bfWQNrUp0gWQAy
 TZJWm2DbqyIM2T3fNggOY21/R9Su5Hcx9dgGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 MpVj5XueV0Qb4KWmNVCT0N7IQxSBPgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHPuiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iOjLGQB+Tp5o4IRwXbvkAVz0YL0IcX7YvePZMQEgliX8
 zeuE2PRR0ty2Mak4TiK6HW3ncfUgDj2HokVEdWQ9PRnnVmSzWw7EwANWB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Geog6RrLzbHI+QGHHWsVZjlbYdciuYk9QjlC/
 liShM/kHiAqubGQSHS15rqStSm1OyUeMSkFfyBscOcey9zqoYV2gheRSN9mSfSxloesRm+2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:UoacVaNZ6JnMTsBcT0j155DYdb4zR+YMi2TDiHoddfUFSKalfp
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
   d="scan'208";a="70247119"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHlFBrgn/FFDALMXg1DEjUkPnMDWtxrbDm+BeAzAduBoi7f3VsDkC2ggS41XzhjLpgV4d2Cfm8TtqaXEnuG1BYjPzobwB6OeJ1LCiDJAIm3VC8nYjMuH+AyEDRbbwEQY4yZRflrM2q5wXMHMCD5tnCG1mQrQQxDhVP2+4oh/P7Kv88Yc5lHUZ8o4a46auzpnjKnIoFmayfBmco+d+cwR7B4U7+iCNXw5T0x2bmNQPBEwMt2b237uH53FSg73r9AH2HQOH8OaoJFwOzZnqeSiWHhwBmKGapgFNxhE+QIairdgsYQxB/fb2hLlLaLGR9ISnQRulfOBN3ZjKX3YISO9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLm4VKES2xR4AoS7eswrhG3rPzPMjBBZN3lUm7Ngte8=;
 b=neBSSdEL82kFrqJQLAqgz0w/DjM0LVEKe4hhljgESX+QIuBZ7I0NokNTyi5L9INutFxf7lzGEdI5uoJQ7lBWoEotKsGaZjJra6z+8nGJaIEwjxrCB/g+g7Gd1TpGK+Qiq8UK5dLgScwYg0e0g+zP0XmcnzdWQ3vY/2uelkBRllq6WSol099jP5Az78Ioy4hLa4CuRNXkZrExCC/1Ibhe7RhasXxWFAO9zczHhBfwII6x+qfOp/k2UpsoZ8L1Rk3Kqxtn1/pV5M/IPnAtLwjwi9+caC/GxQRFN29NAr0uheK91vZ0Um4p5ebmet9Kd0bLomy+gsN7n/pXt7WozAREHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLm4VKES2xR4AoS7eswrhG3rPzPMjBBZN3lUm7Ngte8=;
 b=irc+2pWVJ3vpwF2GiCuPh2WVgNKzy6DeFmCIv9oKVfGV/hda4lnf5z/B9HOK/dyeZ+H85L/hklgND/sr/WZwAHB/6YCtqeVXMvzqVrDnvIylN85k+7GYPovnbqfPtuQuASm/vF0jVabBxqdqtIMYClg7fApRHOno+dVbhJZ3hGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 May 2022 12:49:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 169819: regressions - FAIL
Message-ID: <Ym+3VIAvoit7ZhTm@Air-de-Roger>
References: <osstest-169819-mainreport@xen.org>
 <Ymu+WnVjTANHk+na@Air-de-Roger>
 <25a16b3e-e235-698a-452e-bb87920adc89@suse.com>
 <YmvFYK7tk2174HwB@Air-de-Roger>
 <7ddc783e-cf0e-4a16-dbec-8c45fd603b9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ddc783e-cf0e-4a16-dbec-8c45fd603b9f@suse.com>
X-ClientProxiedBy: LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 048d3b05-5b94-477b-6e46-08da2c2981d4
X-MS-TrafficTypeDiagnostic: MN2PR03MB4847:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB4847AF02914C34F3DF48CB7D8FC19@MN2PR03MB4847.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Yi3+nn/Mqmej+5Pk3j+rXahKXxh03Bycmm9Y/CICwypMMblLN9keygGEinAQfeJ+h1/2PRin9Kp7OUU47FPkeGPIdMORDNvgNX0KNbxYEkmIiuU51/53OJ2WT0jUeILfimOEiwLbpdROUBTSoAMRH27gaZwd+iTg4QZRmLkIb2MfyMFa0bhoR5/6lu6x5fdOXGQ0jE9ul6yVGLW5SG3CYjAKG8l1zdfBhyG2p4JctLPSdlNhW2JEcUY59Dczc0TNbEGoDjZMvK7NtBSN4UQxeFPw+yVrm8kB0Izd7k3fmxNScVRqdbVAvz5SfmzyIZCMmFF2J1lbqZrVJikIGFUfC6hp2Qh7fHgf3Hs2Ox0hXPNG3/h6+dQNX24J4Ntmr9930NceVjOndZ/E6gaWTUrXpnK6DLfqw1n3f8dTYSFSMy0sgpK8rk3IRrSa/C1O9ZEKnON4HxRFbFYgcCvpkH2LhjEdKgSEwPrpoBPgSiK1xyxesKT1UM41VXhvpTK1P2mZptIJeZQxVN1MAqogjPYheJxjwIgBhEqgUKBloX9GRwIDUb7aEKyst6p3f1fQS7lv4olnGrKvLaU48m4I3njAR4BIntB1HLfMcSTtLvmpDCB+oqBtDedyMsqbAOEFc1UVHYjv94fvX3eCMltub7LsqSlnERmYpn+QX4qiqrFHIW/dlrNTA2eX5RgnfuwkXL+EilMoPCNzs9/o/imOmnt2Bd/xZH9rj1rrr8nNzbJNmZOCMyT4Zc+nCY6duaoRV3s92Z9ahDhEhbDIX8yC3Tc0KUNxaOr4wDj3T4y8qKwh/KmtxfC5Mw1TrIO/ak8kWKL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(4326008)(33716001)(8936002)(966005)(6486002)(6666004)(6916009)(8676002)(508600001)(66946007)(66476007)(66556008)(2906002)(54906003)(5660300002)(38100700002)(6512007)(9686003)(26005)(6506007)(53546011)(83380400001)(186003)(82960400001)(316002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmlkQ0hrNFNjWjB2VFo5UHhZNWVUMXR6b0JlYXVJdFhDa2ZWWUw4Y3hWT0cr?=
 =?utf-8?B?b2xQV21vSzhXeDZFVVpZSTJmQlVqZVR5aEw4UEtibGlUV0g2RE5zQjZERXVl?=
 =?utf-8?B?aE5DdUZoVXo5SUd3azJ6R21VRTFxYW5mMFdrSU5RVnpnZy9KOGNQTHUvcExU?=
 =?utf-8?B?SnNTdm90TU5NS2VYSmRid0RtTWlsQVVwVFUrSmpERHU5ZGphK0UrMmlGb2hn?=
 =?utf-8?B?cEduWWZpR0dONVN4K01RaXN1MDhIOWVpT0dZbW9odndMMW1SekJUTEdQckhE?=
 =?utf-8?B?c3J0TVR5NlZlY3ljNTF6eldrSXRCSUkwTUVQWHAxOUlZb3Zqb3pGQXVXSWE0?=
 =?utf-8?B?QUpManpvRk15UXM5L0lOSS84S1NjOUNiVmtBcllrVmduRWRzeHBYTEU3d2pI?=
 =?utf-8?B?aGdQdVhxVVNXSnZjU3VrcG9NSDZnMFIxb1pzZEZnMmZSQWxXcXBodDN1Ykpk?=
 =?utf-8?B?NE1BSDhCWlM1QktwcTJCUVV1eUZQTXNzendybG9xWWdhLzQrRStESzNmb2tr?=
 =?utf-8?B?OWtxSTI2blhDd3M0eitxdDhzRnZWV2p3RVcxVXBuUWxVWlovMjQxRTg4Y2Q2?=
 =?utf-8?B?NEM3eXZDaXFEbGJVR2VML0RTdmtwdTVlVnRWZW9YcGJpSFl1cm5SaHlCdUtS?=
 =?utf-8?B?RHRaNytnT2lGNWdjcWNsb0gwQUkxd0lkVjBBZjZSSmw0QjJVR0QxS1hEOUxp?=
 =?utf-8?B?czlsRGNmdXJJME9FQWFtQ2twL0RlOEtZdjA0b0xzNk5RU3pzbGI1dWl3WWdR?=
 =?utf-8?B?TEtud3RtNUdXZ29HRXduTEJNYldTMzgvWE9TaHdmQUovSVM3TmpSWEpYR0d6?=
 =?utf-8?B?TjVRUmRKQW42NEQrMUd0RHpzNjRkK2s2c213NkJhY1lsSmozRHZEZ054bGpV?=
 =?utf-8?B?cFNTWFpvUjBZZTU2SG9uUDhvQ3E5RGhRblRzV1h6UEE0K2w4QTBvMmx5bDFp?=
 =?utf-8?B?SkZ0QmVXQUQyY2hlK3RMRWEvV2dyRHlaUmNJcDA1T0VDWWZWTFdGaEpsMUMy?=
 =?utf-8?B?VzdYSTdCVSszV2VFSW5LS3h1czBtMUx2UUFhMVN5WWdEQnRXTVF2c3EwczJU?=
 =?utf-8?B?RHNwR214NmhqaWxqYjI1MVVqd1BOdlhQMXVWODFiU3RMd2g4eDZtb3NsN3hr?=
 =?utf-8?B?TzlzcUl0bmpPVWRnWUozZXhGWi9FWmo4OHkxYytJZ1NiVXJhaDFaRDJVcCtG?=
 =?utf-8?B?dC9xYTNDTnFHVHZRMkZIcnNtNm9XRXZtVThlK3AxamFjVXBjNHVpRmZMWnV1?=
 =?utf-8?B?NnI1cXB5RGdLQ3NIMjN4NW1rdTNRc08rMWRrQkEyMVRQWEJjR0ZsRzV2U1Zz?=
 =?utf-8?B?RFVuclg1bFp1L013QVlXa3FmM1FFc0xjV09GQmJHVVRXVGpWa2NqL1BWTXFp?=
 =?utf-8?B?aGgvMkZzdm9KYkd2STd2UjE0aEdDU2VhQ1ZkbHBTT1h3QTVpOHZxU251VzYv?=
 =?utf-8?B?Q3J2bFlxZ1orZWNGQ2hGbGlmaU5IclcrWUxXTnhKbUtnRVZ0MS9oMmNNVlgx?=
 =?utf-8?B?STVwQWlrUTB4bjhKZVd0WHZ3S1NRRWUzU0U2YjVhWUlUNmZaRlViM09LNGdh?=
 =?utf-8?B?cVloRmhEdk9DODRSTU0xb0U1YzdhOFE0emJIV0dkUzRWRXpMbmNEMFRET2w4?=
 =?utf-8?B?V3Y5ZnlTREh6aWN3YUdMZytCKzZ0V29DL20yY3UrU2JNa2YrcE9FR05oNDB6?=
 =?utf-8?B?Yys4Y3FjcHRkb0MrWVd0b3VVSnNHTm03U3BNNXJjbVBUYVg1WHRjVUU0Ritz?=
 =?utf-8?B?N3lSUThXN2RiMzVvQ0Fndk9wRGtlOEJnc2h5SkJnUXR3eXl3R3d1eFRJZTVK?=
 =?utf-8?B?anBRZmZ3ZWZ5WnlCN1lub1RYU0VYRkpvd1ZxUU5RUW00ZXVCKy9sRFRHZXp4?=
 =?utf-8?B?UjRnRlZWNkJMeFMvcmVZaGxyVTNKNTNlRElWMWlLWUZWeGthVGxuZzFGTjVI?=
 =?utf-8?B?NXlwVU5MdFBMTlBCbEllK0wyZzQrQnpSWEFtYTgzT3J2TE1jbmcrNndRTmdj?=
 =?utf-8?B?NWVxSkw1cHlocDBHTFdwUk5OUUdVT0kxS3ZPWXoyTTZCcUk4cGw0MmkwQ29v?=
 =?utf-8?B?QjdUQjVGbFd0d1dmbDgzcUprbU5USGhiOHhpUlFKRjc2cVoxRGZnVWdzOThM?=
 =?utf-8?B?S1pILzZHckRvUnoyYUJOSGJZS3hiSG1lMzZENTNPNWJBeHFKU1ZMZzNCT0g1?=
 =?utf-8?B?bWpKWW9VM2YvOFVuNHllaWd6eTAzN2NrOTVOUEpwRUJlOE5FTE1ueTh0M0VX?=
 =?utf-8?B?YzVzTHdUY3o1UEkyQ1BuMGZUblhpU3F2cjZHcE5SeURZSS9nRTkrWTB3aVhK?=
 =?utf-8?B?djdMMUtXKy9vYUlKTUZwbmZZeWFIbG1TT2tBZU8rNU1zZzFvNmVCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048d3b05-5b94-477b-6e46-08da2c2981d4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 10:50:01.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82j03UP15vcLa3G+tXRd+5Wf5IUHDVyBLnbeaycVEGw4zrWm4viXyacM+/4+bJ2LpNXIDA2MDEYu/HD/GnxcEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4847

On Mon, May 02, 2022 at 08:51:40AM +0200, Juergen Gross wrote:
> On 29.04.22 13:00, Roger Pau Monné wrote:
> > On Fri, Apr 29, 2022 at 12:37:13PM +0200, Jan Beulich wrote:
> > > On 29.04.2022 12:30, Roger Pau Monné wrote:
> > > > On Fri, Apr 29, 2022 at 07:46:47AM +0000, osstest service owner wrote:
> > > > > flight 169819 xen-unstable real [real]
> > > > > flight 169843 xen-unstable real-retest [real]
> > > > > http://logs.test-lab.xenproject.org/osstest/logs/169819/
> > > > > http://logs.test-lab.xenproject.org/osstest/logs/169843/
> > > > > 
> > > > > Regressions :-(
> > > > > 
> > > > > Tests which did not succeed and are blocking,
> > > > > including tests which could not be run:
> > > > >   test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 169775
> > > > >   test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 169775
> > > > >   test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 169775
> > > > >   test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 169775
> > > > >   test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 169775
> > > > >   test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 169775
> > > > > 
> > > > > Tests which are failing intermittently (not blocking):
> > > > >   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 169843-retest
> > > > 
> > > > Looked into this one, and it's slightly concerning, guest seems to be
> > > > stuck at installation:
> > > > 
> > > > Select and install software  [  481.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [  509.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [  545.093820] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  573.093809] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  609.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [  637.093836] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [  673.093957] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  701.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  733.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  761.093817] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  797.093898] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [  825.093863] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  861.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  889.093945] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [  925.093974] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  953.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [  985.093832] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1013.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1049.094031] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1077.093860] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1113.093938] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1141.093803] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1177.094051] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1205.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1237.093955] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1265.094004] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1301.093835] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1329.094039] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1365.093883] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1393.094167] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1429.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1457.093900] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1489.094026] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1517.093997] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1553.093996] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1581.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1617.094076] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1645.093882] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1681.093896] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1709.094022] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1741.093870] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1769.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1805.094017] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1833.093837] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1869.094043] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1897.094101] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1933.093879] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 1961.093933] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 1997.093952] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2025.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2057.093895] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2085.094172] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2121.094018] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2149.094021] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2185.093931] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2213.093864] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2249.093951] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2277.093899] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2309.094054] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2337.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2373.094111] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2401.094132] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2437.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2465.094003] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2501.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2529.094050] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2561.094027] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2589.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2625.093999] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2653.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2689.094024] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2717.094093] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2753.093913] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2781.094095] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2813.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2841.094117] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2877.094041] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2905.094009] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 2941.093893] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 2969.094085] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > [ 3005.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 3033.093917] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > [ 3065.094060] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > 
> > > > debina1 is one of the boxes I've put into production recently.
> > > 
> > > ISTR this issue having surfaced randomly before. With the randomness making
> > > it difficult to investigate.
> > 
> > Indeed, it seems to happen on other boxes also:
> > 
> > http://logs.test-lab.xenproject.org/osstest/results/history/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm/xen-unstable.html
> > 
> > At least doesn't seem to be explicitly related to debinas.
> 
> How valuable is it to test systems using a kernel from 2019?
> 
> Chances are high that bugs which might trigger are corrected already.
> IMO trying to find probably known bugs is a waste of time.

This is the kernel from oldstable Debian distribution, which is still
supported (until June 2024 AFAICT).  I think it's not unlikely that
people are running those kernels in guests.  I wouldn't mind testing
newer guest kernels, but someone would have to update osstest to use
Debian 11 which ships with kernel 5.10.

Thanks, Roger.

