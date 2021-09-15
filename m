Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2A40C1F8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187334.336152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQXS-0002do-Qk; Wed, 15 Sep 2021 08:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187334.336152; Wed, 15 Sep 2021 08:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQXS-0002c1-MK; Wed, 15 Sep 2021 08:45:06 +0000
Received: by outflank-mailman (input) for mailman id 187334;
 Wed, 15 Sep 2021 08:45:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wWxD=OF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQQXS-0002bv-1b
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:45:06 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38aa068a-1601-11ec-b4e8-12813bfff9fa;
 Wed, 15 Sep 2021 08:45:04 +0000 (UTC)
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
X-Inumbo-ID: 38aa068a-1601-11ec-b4e8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631695504;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZwAgTdU9pJk4/za7hKNn6YsI/jx/DgVo1m7OBlYdgX4=;
  b=Cy2cVgZKZCz7ODT/tsHH9IefuXmrp6NdPa+cO9vzXzSq/kYTgwgofJPI
   jogeH4fkjriC2r3Gm+rI+UYk4oYsVXP6/+9+tVQbnQUv+5iSnckqfuuKk
   utN2zp2xpY1irONTK5fxBVJDbSyj9KucQwpCntrI6y5I5DZ8qgU0ptXMU
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1Q8r67l/Ojve8Ys2or7LqILnPrtt/pRDoFpAiIZnkhK+yT2QsYbvIxgS1M501+BEJlmBi7xk7i
 HPjA0tnjlBVHUx9ooVbfWTKPSjqFcoH/POcdHPVT3QXyxFoyfM5sCWUpN+pPQ6Upu4Gn3Owy5y
 oiZA212eAkPCGq7Fg4Hc5l3fTnfYk79Wap2/8xtxkZG4xHP4vT0pkBHro9NBTuQdn5crtjSfiG
 c36y5yi+YF5bLsRTBg0iKIfR2+874ceXlOgDNmx2iCfejbmgob5cpZIPS5tkbkOkEKx0nq5t/W
 Z2lZVQCsJ6TVskKt0QcWTmQG
X-SBRS: 5.1
X-MesageID: 52352312
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tlr1ZqDdqOialxVW/xfkw5YqxClBgxIJ4kV8jS/XYbTApGsq0TdTn
 DMfUWvTP6vYZzOmfY91O9vk8RsOuJTTyYNlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0E87wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ojqLpMB72
 dl2uJnuYy4uZ7X1uLgmakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHv+RuIUDhW1YasZmE+mHa
 tFGOAdTXAnFQSNwFnk0BbMPg7L97pX4W2IB8w/EzUYt2EDDwQo03LXzPd79ft2RWd4Tjkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHUUB+DsHSVsiURXoR6Oupj8DitlpHttlPx6nc/ctJRVDA3nJZoHmV3h
 wDWwYqB6S9H6+LOGCnEnluAhXbrY3FEczVaDcMRZVZdu7HeTJcPYgUjpzqJOJW8iMH8URr0y
 iqDxMTVr+RO1ZNXv0lXEFauvt5NmnQrZlVujuk0djj8hu+cWGJDT9b2gbQ8xawcRLt1tnHb4
 BA5dzG2tYji961hcRBhps1XTdlFAN7ea1XhbaNHRcF9p1xBBVb6Jd04DM5CyLdBbZ9fJG6Bj
 L77kgJN/p5DVEZGnocuONnZNije9oC5TY6NfqmNNrJmO8EtHCfarHAGTRPBhAjFzRlz+ZzTz
 L/GKK5A+15BUv85pNd3Ls9AuYIWKtcWnj+KHsGnkE38iNJzphe9EN84DbdHVchghIusqwTJ6
 ddPccyMzhRUSurlZSfLt4UUKDg3wbITX/gacuRbKbyOJBRIAmYkB6ODyL8tYdU9za9Uiv3J7
 je2XUoBkAjzgnjOKAOrbHF/aeywAcYj/CxjZSF8b0y133UDYJq06PtNfZUAYrR6pvdoyuR5T
 qdZdpzYUOhPUDnO5x8UcYL58N55bB2uiA/XZ3ilbTEzcoROXQvM/tO4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFe4ABdl/t/Y5mLz3KosU2e8xcew/ewja61
 hqNBUtKr+f6vIJoosLCgrqJrtn1HrImTFZaBWTS8Z2/KTLeoji42YZFXeuFIWLdWWfz9Pnwb
 OlZ1aihYvgOnVIMuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/0f3KJdtCu3R
 lmLq4tTNri+Mc/4FEIceVg+ZeOZ2PBIwjTf4JzZ+qkhCPObKFZfbXhvAg==
IronPort-HdrOrdr: A9a23:/U9uraEyUulc7cz6pLqFdZHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkgdCVbKXlvgxQpGlRGt9dBmxCe3+m+yNNNW577c1TLu
 vi2iMLnUvsRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIB/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF4nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSgWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KBoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFnLA
 BXNrCf2B9qSyLeU5iA1VMfhOBEH05DUCtue3Jy+fB8iFNt7TdEJ0hx/r1Xop5PzuN6d3Hoj9
 60RpiAr4s+PPP+W5gNctvpcfHHeVAlfii8RV56AW6XX53vaEi94aIe3t0OlZaXkdozvcIPpK
 g=
X-IronPort-AV: E=Sophos;i="5.85,294,1624334400"; 
   d="scan'208";a="52352312"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbvsJ7enWwaavjjULKBD7idImaK3WPB0tOVRhALCCoCWwoQ7RlkNJ8j/KGhPT9B3hyfQkVz7C2h881bBhPKaHNI/yKpCP4ZSQZIEQTDfuI5B3cIsNn4zEKS27xW1naSmp4NHpmrMD4yEdaejuXb0VMJ44cxO3C1ZzuvEFxviIX/0P2TJcMPvrK9W9le1EndHVCUyCUuilf5WifkAk2tFSufOG4D/9wLoblxnJLfkGU+A+IJUtlyOaK6U6trJoIVGqlsalaqYRctfp/CpDTUAXpHD4dc8po7pYvnV3RGHB30wOZZiGwC0KExftr37eZV7nrfYXYgwtmsfBAYhcR2pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QYj6oQaFjDX2lnu9xCgHFKYYTC1RRp4yRVSQUssYdMQ=;
 b=lgAt53q1U/Nb/0mf6ZGo/8lzHSZZjPe4vM0SipFhTz14kEi+P5ycoGozEN9r1pSaJuCCRR72KY4xdm30SMPS0Kgtwb2RsIiliKzrKaqHeV+J7WQRk/0NpAYDlC7hrR9/BaNjbxlqswYbXLBP+L6G7hvgaWqQA2QKvFmYM+JySFQHkmlcuxZT8SjG+XBBVwIlaehlRzXW4XhCPxtwWe3j7/VyHNo3WgA8ZnTMGveQ7b18QOxgAwCTPhlkdjrl4vNsG0L0YvWI6rRjYLJFg13uUQsQgZ7DfF52sPiLTXAF2XrIZqL5QqE4JArHfoHibqkNNClE1Cfhm5Ihyt2PHp1gKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYj6oQaFjDX2lnu9xCgHFKYYTC1RRp4yRVSQUssYdMQ=;
 b=bk60A8uS7ScU54wfDrDz/w8g2bPM444mNruPwFipYCxDdWGLnqFeotJ57+odEyCyj78VAUpLYiuqhKBp/Jl8J4DTZs+yrznAxv5UIin53tAA2dZXcLlBl2RROQ55kEIjAM4BM7iiKriYkkzViMHi0S3PpzTNHOX47DFUqsN6G2I=
Date: Wed, 15 Sep 2021 10:44:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/p2m: fix xenmem_add_to_physmap_one double page
 removal
Message-ID: <YUGyhk0uZQMf9c4s@MacBook-Air-de-Roger.local>
References: <20210915080342.21346-1-roger.pau@citrix.com>
 <1d70ff4d-bef2-1865-27c3-27d17c15d17f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d70ff4d-bef2-1865-27c3-27d17c15d17f@suse.com>
X-ClientProxiedBy: LO2P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 064d84b0-459f-4ee2-685f-08d97825193e
X-MS-TrafficTypeDiagnostic: DM6PR03MB3947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3947374217596DC9C5D3548E8FDB9@DM6PR03MB3947.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5r+Hyx9J5nBNJzmPPDLcP/VQOP99adJkVXULM6GF85nRpX9kW7DdXuTwVNsB4/K9wDE9i6oPPhmB6qcWlPixWWaseIW1+jbiPQ9HGfLxHj8l0uHcwnmjIODWwecAxev9lztWEFk+KrMf9PcqKp1X8pZrWcLuEeUhhiTUGkZ1LmDAhhNxNI+CTAM2C6IKhOZAnj4iaLv4rLLtM28zKevtQZ5f0+kBHhOYz3JXRdLbf2XbdMQeDGo2X+XDWSG6WH2XhygRZJri1yEZU2O1rP8MxhKn4Y2ZFe9uiDDygrecJkyrntApx8KxzCH7H9fNaXE0AdkMA17MgAuqZKSoel1yOo6P9Cnrz8s/3VpaJ1BAspq8PFQ2+ujVOIyMfnep67Puq9GMOIrR6Quq23pHeBMVV/oZn6vlZvFX1j9CjoVT9O85DkeyKCcCfLYfFnIDltOjaaxiXiOI7bg++CaH0ml/0oPhbfTkKV1cPmoITPnY+LXzM8e3QR1GNPkrG7MBaSdyXek01tslSxdjD4xHF16x43V5y/wI7fCArOA5SRsWn4hhRvOcvJnK3eMggYp0GBKbmkTrKCkaYAjdjSOg1A6zcFHFTebk/BCjUNzIvMVcLp7cUkppVCrha91ItFNN6JlhIhkBJcYoTn9GJdAbgHwB1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(8676002)(54906003)(316002)(83380400001)(9686003)(6916009)(53546011)(6486002)(6496006)(4326008)(85182001)(5660300002)(6666004)(66556008)(66476007)(186003)(66946007)(2906002)(956004)(478600001)(38100700002)(86362001)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG95cUZpQWhONVVIODhvakxlMmFla3IrZTBxTzM1VWFhU0w4VnBMRitiZXcr?=
 =?utf-8?B?MVk0Y2R6S1pZSXJBOWVRL2EwMEpHbHNFT3p3Qm1JR1B5QnRTbTdVby9mZ1g1?=
 =?utf-8?B?T2dUTXR1WE9hSk5ndjQzcVFhOXlaNTJJUXQ1U01IQ0E4TThBczhobGh6SzFH?=
 =?utf-8?B?eDJhZERJcVFZeERTOWRORCttSmxEcTVVVzgrbm1SUCtWdFFMS3hkMTllM2x6?=
 =?utf-8?B?UTV1RXIzakR0V2prd1ZqUFhJcktnTkp2NTNGOTM2a2YxOFVtTGFuUC8rSGhr?=
 =?utf-8?B?SjA3TG56MndwVVY4WU1jSUduZUFLRHE4MEZUMkpxTXZLcHV5MlNjeUJlVjNs?=
 =?utf-8?B?TlB4MElVQnRrQ1YxdFdkUTBqbi9XeWNBZlRDS0k3T084c0x4UXhLWUhMR2d2?=
 =?utf-8?B?N29OUDVFa2d4VDRLRHI3akc5TllOMnlwS1ZZWjltNTlrZ3JoWDZ1VXhycVhL?=
 =?utf-8?B?V3NUT1BXOGpWanNLdGdJNE1LUTg3UG44MWV2TXBndWRNaURyR3FnSzlzSFho?=
 =?utf-8?B?bWlSNDZURkVBcVhvNjhtYU4vMTBiSGF5VDY4SVBUY2ZPekxwMzRuWVJnTEJL?=
 =?utf-8?B?MUo2ZTR5amNNeUVJMFJhTXdDMXZ1cXNTN0RhVkpaMmh4M29aRG1Wb2F3Vm1P?=
 =?utf-8?B?RnJ2V3BwSkxoNmdkSlhLSlhjQzRZS1lJb1doREJmVHhCY2EyZDY4MG9qM0cr?=
 =?utf-8?B?Z0szUk9RR2lBenhMV2JOb3h3TXduRkVMek5oVkM1WnVsdkNVKzM2eE1jbzNk?=
 =?utf-8?B?czAxK05mVWZYSGltcis0cVRobmNScGhpa2MxelZPSW0yeitneTJaWmJ4TFlQ?=
 =?utf-8?B?ZzJPb2VzL2hMSFhvQytHMWtiZVgzZlovaTR1ZVFnS0UyUHhQWVVNRVVzKzlP?=
 =?utf-8?B?RCt5Sm5kVkF4OUVqRjNZd3dZYTBJSHVseFhJdk9jb3l5c014WUQ4TU11YjNK?=
 =?utf-8?B?RTlGU2J5WTEwam5RQXQxQ3VsU1RvWHlPSWV0cWVRMWo3eWtCbCtPQjNzM2tv?=
 =?utf-8?B?ZjlzQXY4NmxVQ0c1UFRYTWVPallBYld0NU5xVTRwWm9DUU5NRXZEOGk4ZlZv?=
 =?utf-8?B?MXhmTmRlMlZGSmh1T0ZiRmdlVXk2S09SSnNnSHgrNGFlQXRLd3lTN3NQbkEy?=
 =?utf-8?B?SkkybmFJakJMV3RDRlRUdGRBQmxtejNjWnFVQjhOL2FZdFEzN20wazdnNHJ3?=
 =?utf-8?B?b0l6M2pldm5RSlArc1k1ZmpWeWtGSFN6VXE4NGhHKzFLUCtUMnMxSUpkT3A3?=
 =?utf-8?B?RWorWEdYVXdVVXpOU0c3OXRna2FPNXpEeGNEUHBYNHIyRzU4QkRSZDlieE0w?=
 =?utf-8?B?YldUZ2tSWnFYc0RTQS9vUUFBUVNDcjVOaXhXbnM0SU5lRmx3ZDh2TVRNNXFh?=
 =?utf-8?B?NEFPcHdEYUNzd2VhWVBBZW9Mb0RHcXVXZWtZR3RORVYxdmNZL09ieklUQ1Fy?=
 =?utf-8?B?QzBXcWJqTkNaOFlHT0xVZzZoVE81Nlh0UlVPd1BhUS9VNEpkcDBHczVpUUVx?=
 =?utf-8?B?M2cwS3EyVHVCTS82TG5pWU1uOFp5eGU0QTJUdEtlZUp3UjYxUUhiQy9uVWNx?=
 =?utf-8?B?M1FsMUs3dnVRdENoTDhSRURNcmdvZzNLaTgwdUFNM2JqUUMxUHhxWVJ6dUtG?=
 =?utf-8?B?eXNibVhMQ3hBSTh4WVpkbElwaTlIazVRTXlGa0JLclBQWG8rM1Y4c1Y5MXAx?=
 =?utf-8?B?ODQzZ0d4OW1ETDNoekowTDBQam1SbmpNbUNVc2ZjSEJjYTUyWW5TRjZZR00z?=
 =?utf-8?Q?Hmu+vC6LcvOh4RwEbGhKr6Ei92yqOmpzzK/Ztkk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 064d84b0-459f-4ee2-685f-08d97825193e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:44:58.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGHoWiff+HrpNl5xY06bqkMFkoEuOOTKp+BD1lvQbBKmtahyUlJkSybW/s96Swa9ydFudKuC7SZHTliZqPp1Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3947
X-OriginatorOrg: citrix.com

On Wed, Sep 15, 2021 at 10:16:41AM +0200, Jan Beulich wrote:
> On 15.09.2021 10:03, Roger Pau Monne wrote:
> > If the new gfn matches the previous one (ie: gpfn == old_gpfn)
> > xenmem_add_to_physmap_one will issue a duplicated call to
> > guest_physmap_remove_page with the same guest frame number, because
> > the get_gpfn_from_mfn call has been moved by commit f8582da041 to be
> > performed before the original page is removed. This leads to the
> > second guest_physmap_remove_page failing, which was not the case
> > before commit f8582da041.
> > 
> > Add a shortcut to skip modifying the p2m if the mapping is already as
> > requested.
> 
> I've meanwhile had further thoughts here - not sure in how far they
> affect what to do (including whether to go back to v1, with the
> description's 1st paragraph adjusted as per above):
> 
> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -2799,6 +2799,13 @@ int xenmem_add_to_physmap_one(
> >          goto put_all;
> >      }
> >  
> > +    if ( gfn_eq(_gfn(old_gpfn), gpfn) )
> > +    {
> > +        /* Nothing to do, mapping is already as requested. */
> > +        ASSERT(mfn_eq(prev_mfn, mfn));
> > +        goto put_all;
> > +    }
> 
> The mapping may not be "already as requested" because of p2m type or
> p2m access. Thoughts? (At the very least the new check would likely
> want to move after the p2m_mmio_direct one.)

Is the type really relevant for the caller? If the mapping is already
setup as requested, I don't think it makes sense to return -EPERM if
the type is mmio. I'm also unsure whether we can get into that state
in the first place.

I'm unsure regarding the access, I would say changing the access type
should be done by other means rather that replying on
xenmem_add_to_physmap.

v1 was indeed more similar to the previous behavior IMO, so it's
likely a safer approach.

Thanks, Roger.

