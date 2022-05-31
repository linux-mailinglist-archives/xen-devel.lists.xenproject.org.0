Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054353933D
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339695.564582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw32s-0005Gc-Ov; Tue, 31 May 2022 14:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339695.564582; Tue, 31 May 2022 14:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw32s-0005Dr-Li; Tue, 31 May 2022 14:40:30 +0000
Received: by outflank-mailman (input) for mailman id 339695;
 Tue, 31 May 2022 14:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8THd=WH=citrix.com=prvs=14366b804=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nw32r-0005DR-0n
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:40:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b0fb8d1-e0ef-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 16:40:26 +0200 (CEST)
Received: from mail-dm3nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 10:40:19 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5680.namprd03.prod.outlook.com (2603:10b6:a03:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 14:40:18 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 14:40:17 +0000
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
X-Inumbo-ID: 9b0fb8d1-e0ef-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654008026;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VzAtl4PM+X21W25T6m5ON3TlrJQJeZ7bxTtbXjB59ms=;
  b=alsPJEkUzdU5ZH9Rs0yFx3nQASs6s7ihFKqKgOPKx6A85QkC1LqXTQT3
   RHmHOifBj7bzm23L0NoTamEpA+Vh1Uy5APQuD8OesO/1fM8G6w+TaBW0k
   +N7C2HUzsSMLQKcmxAPQCvcst5zczumsJvO2Wu+8TNJszzhE/VvILpw2p
   0=;
X-IronPort-RemoteIP: 104.47.56.43
X-IronPort-MID: 71887967
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KxW8T6IR2cP97gvWFE+RppQlxSXFcZb7ZxGr2PjKsXjdYENS0DEBz
 WodWGGEOqrfM2f3fI1waITn90oG78fSn4ViTQtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Ux2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MV97qXtcCQkBLPviuk/fxBXIR4uPoQTrdcrIVDn2SCS52vvViO2htlLVwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FH/6iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33ymvLGwG9zp5o4I9w27P3jAs4YTAc9uPUYSIf59fo0+h8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FSiU93VTxC+5nmesXYht8F4FuQ77ESBz/HS6gPBXGwcFGYdM5ohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnFL6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:K+IBcaFT9bckCKtVpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="71887967"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkZIv+Z4MA1M09stJ1czNjfhpdPk+ATwynZv3aKvNWeh5sDF20O3coIjJaSwPNMbZD7EOrhIBMM7n7Jbpy798Vbqhr4owgIg7FI2bgeFG31HYmmjz68tHPpPbyXiMz1cfJgrn8Cw79AopZR71dfDC3ODsfvYM0OR2wq3OlEKKl00FsGmQLBUFG4OYYDRVb7mmU6PPiG6+cML1DvedAnlhl55NSySRKIz5KCFOXefhzkGL0gBXG5UkhtmJUGKXWpLwJdHZOEWLVO9oiezNe95DAt3gLqyeuocZC1ZOUcoDQKQydvYq0UUnWX0qQ0DYAifmKK/zQRVRyndRSs2/mSDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wHdPgxuigPMScz+40o/3BAfBKyZ11tfPFxmg2k/N4o=;
 b=i0S9xswuOa6a7/U7whqhIciPMxJalEqlQWJuMWaOZen8D0nK0d/EobhFIhKDZTePuUoSSpYlUf023WUr76Z2scq+lxFCdSK6yZ/t5xKfyXhXBX0eOd7PfjAYEgEAWFH7HRlQGUvxkqgs5wtMVnWZYrnABzSqsGbhY4yKFMbhM/KpYY5VsVcCC7Z9ybWVMVwJ336B8YIgDLhxXwy5KKbXNpRmVwxPmed6PmePqA/RcIk4yDHIdNjTDDdXhq445qp6fIflL2NeRI2J1yR0XM0OxZlaaFd3KYlge2hR3yRq35TZzpAvj7TDE/25lMOJ5S0AYJujDlfbABHZ4MmJUQwilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wHdPgxuigPMScz+40o/3BAfBKyZ11tfPFxmg2k/N4o=;
 b=Izhqgeeo4l5M4dCRtukhbkUmjidDRLEovjXLCqOo4dJgIke68nLVIOJNS8DUnJdlED/EAb8hXr1qDOXw4Gi27sluJb2SPARZmdHwa78/is0naDQPNWcS5wITI4FC67H/7qXwYxPAKmVgeK0i80uq1N7D4AhTYNW9i7/UtCZ/8Qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 31 May 2022 16:40:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 01/15] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YpYozCRkfs1KdBus@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1de2cc0a-e89c-6be9-9d6e-a10219f6f9aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1de2cc0a-e89c-6be9-9d6e-a10219f6f9aa@suse.com>
X-ClientProxiedBy: LO2P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a04522d4-dae1-41fc-f7b0-08da43137b12
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5680:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB5680AD5FAE03C5D931D47DEB8FDC9@SJ0PR03MB5680.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EXxJJr4najynZZD7zsEP2NQdTFIedVFa7v7pGIE6MBHHY+rVTwIChYDQLjC5UjED6JeuKbN2cnfJOpHJ99TKQbi396ZOD4UJN3L5PAzRYcWAR8XdAbrmntMDJELc5BZE0uTYsRS7oSADKs+H59vPSRWH8xKlUsdGrbWoYLyZfe1EbTkaSWEAF0b3fTld7PhTkSSZT/AmJNPthq7yBqdZzRZvYU8qYyz5A3PaWEzZL+ApX++ZCu36i6yvfIl+A5/NYTk0mIAVY7v2u9eedOehJHHxUml0xgvOxL4lS1JqA1EA2oPma+YvVgwfGgpvZxstkuhfQfZixTsQH7yOMqAslhCmEJQgpWGKMgScNSLRzqqd75G5i2aKm7/C2d30dDiawHl/5cdS7c5jqjdEsByGifJtfdeEe1kLstpW/okZyl2oo8j04GXTZhiK07j9A1amzaRtB5ZUxYXQMZe4z74zidUIQJ1wOmp3wN9UrCRfmfMXBy+PUTfi/jqu6ECNDsLx/8UFDtTNZqHlL1HaRQOzz1g9YTBa3PtRRUvv+TiGh3jcdir7pRl01+wpxoQuv8bKMSV9lW9eAenCy/RlaTjfAy8zoC5PYv/81SvuB8EISqg8MZ8hI7LY83QOFrvuxD2vx+7ZG4I+cEEEbaTiZeqrqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(186003)(66946007)(6916009)(54906003)(316002)(85182001)(8676002)(4326008)(66476007)(66556008)(83380400001)(8936002)(508600001)(6506007)(86362001)(6486002)(5660300002)(33716001)(82960400001)(26005)(6512007)(9686003)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFdPMUd1QVNGZVZ3R2F2elVTWnVuVFBldURsZnljckd4ZVNBT1RzQVFkL25F?=
 =?utf-8?B?UGhBbUlXQk1IUFZWUVo2d1gxYXdRRGNkbG9EOWo0WWhUUytFSVpPZXpDRlE2?=
 =?utf-8?B?Q3VMU2p3UldkYjZRRkxhYWRwWExVOUJadVJxL2RIUXN5dkhCcThGcHB5RllL?=
 =?utf-8?B?djBZN3BRZjI2SG44d29UOThKaWw5M2FkWjFOS0NzT0xuNjBBUnJqZ2dWRHE3?=
 =?utf-8?B?L1RrUWJ0aldEeTB1L3JmMkgyU1VSVGQrUlEwd1JJMnJmUDNpekk0YUF2b1d2?=
 =?utf-8?B?Z2VveTQ0MCs1OWpmMURId1hYcU9RMHJPVjZycndkeUZkVS9YOTB0cUh5aTlJ?=
 =?utf-8?B?M1V2QzBFUnNvUk55U3lnS3lyN1FYaDFWWlFVVzdvclA4dnI1ZnJNZWJ0alNU?=
 =?utf-8?B?WnB0dVAzOHVNVDVxUVpRSkd6T0k5UE9mdG9yYUhCaGVmOVA1YjllNzFobFY5?=
 =?utf-8?B?ejdaVFhkRUsySGJaNlluMXVUUHlGbmVtQ1RndWlKWTNzdkFsWEI3Yks1aUdI?=
 =?utf-8?B?QkZPenpwRDVmbmxDdmxRQ3lpU0NEVzlVRGNBWCt5dEwvUCtXSFRmV0RCYjhG?=
 =?utf-8?B?K0Q1RUROalI5VFZpdDNVMlZkdnJDejJ6NldVNGRpVEs2VUtoMjR1RFNha3Nz?=
 =?utf-8?B?ZnBhZy9aUTdUWjY5NVRWMWZtLzdlNU5pM053MzBLSE9qNno1R3pSdnN6bzNk?=
 =?utf-8?B?RVJCSkNJVWxHdE5DcmRjWTlGK1NVYy9WSVFSdEVzeVVrMVp2NGcvT2hKNW9y?=
 =?utf-8?B?TjR0Nlo5b3JGb2dRU2FkY0xMNHBCcEFabFJOQkFmajVQL045R0w4NVVEaW9I?=
 =?utf-8?B?MTBpK2t4NHJsZEdvMjRIdjZ2aFZ0TThhVGNRSlU1bWZKN0JGYjRyc0plakxZ?=
 =?utf-8?B?SStnZlhNdmcySW9HZmNmbHlMM3FtbHNwM3ZFRHVvOEp2ZG56KzN0Y25EdFdm?=
 =?utf-8?B?WWpKeU8zR21QaFJJNkk1bStUQVVmNHJXKzlBbzhlc01YLzFmU0wxMms4Q01P?=
 =?utf-8?B?UDE2aVFZRXAvUGZQZTQrNGhweXI3eGVWdDNaWlJDMHFpUEJiMTZHcmlnTitv?=
 =?utf-8?B?SjhUU2d3MSthb0pUbFBnTTlaaDhXVXE3WjdYMWwvYXM3YnE3dzQzYkNKZTJH?=
 =?utf-8?B?SjdBUC9ZNkgrbkZTYWt6WFdlOGN4cjIwS2NMQ1pZbmVic2xrbFZuclFDZzQ2?=
 =?utf-8?B?U0V6SzROZ2Y1THAzWEZ1MDNJcUh0RTUvTnF3ZVVFcTRscDBKMHJ3enp3dUtL?=
 =?utf-8?B?MW8vdnRScjNlY2pCZFZ1Mlh3VjRtTEhpYnVZY2ExRm1ZVkk2VVNLZjRGdTV2?=
 =?utf-8?B?TXR1MnFCS21OUmFvLytRZU51TTZoOWtXM0pNSXBydDl5T2UzVXB5cXEvVGJW?=
 =?utf-8?B?UFF4bXJyUVB5ajlkVi9OWlp1STNSMjNOd0hxd3U1R3gvMmN2SHVXd3k2Vk5V?=
 =?utf-8?B?Rjh1Y2lBQ29qdUMrRTNpWFQ3elJKbXZmMkZ1WXh6YndzdlR0UDhLZFVwS1pG?=
 =?utf-8?B?dlFiZG5vRU12MHVEUExmRVdOcDE0K2w0L3I2QlBoMkc4VGlKMlBoay9kZFpJ?=
 =?utf-8?B?dE1DSllRL2s1OHdZV0ZnbzVuRVVETmJLdW1kcHVZVk95NEdTWmhzV015ZUdM?=
 =?utf-8?B?VnhLcEJuSHBDWmlNeHM4R0pxVkJ3WXc3OGJqR2FoS2ZaVStjVmNWRDk4M3RL?=
 =?utf-8?B?ZEJPVDFlVWM2dkg3TDhSeUI5TS84VjJQSEhjUnFWVU02aUJTd2RzZ1JORzU5?=
 =?utf-8?B?WXhuNURTREdiRHhVWGZuaHZYWDZZWHo3OW9xZ0QzODgwWVB0Rk9rSWNlalZp?=
 =?utf-8?B?NDJld3lPMm1KdlZ4bmhqZHJVSFpPcUc4TmY3YXNjcmxzMHhPUnc2YURTZzNu?=
 =?utf-8?B?Z3d1RTdXV0tnenl3U21nWWFoRnJXL3MrRE81VXIzbFZ1TUpndXhoZmFnZzh3?=
 =?utf-8?B?UmlYN211WURmd1RJUkJzY3R5Y3pQVFcxcndySWZDb3UrZkdiN2ZVMzA4eFh5?=
 =?utf-8?B?RXBoRUNzQ0NUUEtnZ0tIeUZZa2g2SFY4UlVGeGNlQ0s5VFdzVzA0WHVtNCtF?=
 =?utf-8?B?ZFR3d1AxNjZNc0R1Yjd2OTNxR3J5NzFwSjNoRFJlQmxzS3Z1eWJwUFN3WkhQ?=
 =?utf-8?B?NTFjWnh6dmtuTGNmVmlmYUhPcDVQcEVVRWp5UkpncHQ4aDZmUUo5NmZaOFpQ?=
 =?utf-8?B?bVlFclJ1c0JVNGNUYmx6c2hMMlc0Qi8yNDZCcWtKeUNGZXZwQ2R3TFduYUt3?=
 =?utf-8?B?T0k4WitnNGZ5Q1I5ay9IdFNzRnRmU1ErVytPQVE1S2d0L2J4cVhYSmtkMk9u?=
 =?utf-8?B?SVlOWTFmRy85NXFVMzZBWUhTRU11OVFyVzgwN3dmOE40Si83T1NXU1NCWm1v?=
 =?utf-8?Q?okOdP133/avZoO00=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04522d4-dae1-41fc-f7b0-08da43137b12
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 14:40:17.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFzCsAaCEo3L4XOa0FKhJY8M5S7Q6ruabX1m7A+UXbe6tP2ApWwl8mm6aoGGLCO7Tbgy+E21hy1Jp2ePPCT6Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5680

On Fri, May 27, 2022 at 01:12:06PM +0200, Jan Beulich wrote:
> While already the case for PVH, there's no reason to treat PV
> differently here, though of course the addresses get taken from another
> source in this case. Except that, to match CPU side mappings, by default
> we permit r/o ones. This then also means we now deal consistently with
> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below.

> ---
> v5: Extend to also cover e.g. HPET, which in turn means explicitly
>     excluding PCI MMCFG ranges.
> [integrated] v1: Integrate into series.
> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
> 
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include <xen/sched.h>
> +#include <xen/iocap.h>
>  #include <xen/iommu.h>
>  #include <xen/paging.h>
>  #include <xen/guest_access.h>
> @@ -275,12 +276,12 @@ void iommu_identity_map_teardown(struct
>      }
>  }
>  
> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> -                                         unsigned long pfn,
> -                                         unsigned long max_pfn)
> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> +                                                 unsigned long pfn,
> +                                                 unsigned long max_pfn)
>  {
>      mfn_t mfn = _mfn(pfn);
> -    unsigned int i, type;
> +    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
>  
>      /*
>       * Set up 1:1 mapping for dom0. Default to include only conventional RAM
> @@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
>       * that fall in unusable ranges for PV Dom0.
>       */
>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> -        return false;
> +        return 0;
>  
>      switch ( type = page_get_ram_type(mfn) )
>      {
>      case RAM_TYPE_UNUSABLE:
> -        return false;
> +        return 0;
>  
>      case RAM_TYPE_CONVENTIONAL:
>          if ( iommu_hwdom_strict )
> -            return false;
> +            return 0;
>          break;
>  
>      default:
>          if ( type & RAM_TYPE_RESERVED )
>          {
>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> -                return false;
> +                perms = 0;
>          }
> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> -            return false;
> +        else if ( is_hvm_domain(d) )
> +            return 0;
> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> +            perms = 0;
>      }
>  
>      /* Check that it doesn't overlap with the Interrupt Address Range. */
>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> -        return false;
> +        return 0;
>      /* ... or the IO-APIC */
> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> -            return false;
> +    if ( has_vioapic(d) )
> +    {
> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> +                return 0;
> +    }
> +    else if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> +         * ones there (also for e.g. HPET in certain cases), so it should also
> +         * have such established for IOMMUs.
> +         */
> +        if ( iomem_access_permitted(d, pfn, pfn) &&
> +             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> +            perms = IOMMUF_readable;
> +    }
>      /*
>       * ... or the PCIe MCFG regions.
>       * TODO: runtime added MMCFG regions are not checked to make sure they
>       * don't overlap with already mapped regions, thus preventing trapping.
>       */
>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
> -        return false;
> +        return 0;
> +    else if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Don't extend consistency with CPU mappings to PCI MMCFG regions.
> +         * These shouldn't be accessed via DMA by devices.

Could you expand the comment a bit to explicitly mention the reason
why MMCFG regions shouldn't be accessible from device DMA operations?

Thanks, Roger.

