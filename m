Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A0697DDB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 14:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496000.766500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSICN-0007zK-P8; Wed, 15 Feb 2023 13:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496000.766500; Wed, 15 Feb 2023 13:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSICN-0007vu-Jg; Wed, 15 Feb 2023 13:51:51 +0000
Received: by outflank-mailman (input) for mailman id 496000;
 Wed, 15 Feb 2023 13:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSICL-0007Ri-5K
 for xen-devel@lists.xen.org; Wed, 15 Feb 2023 13:51:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1827390-ad37-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 14:51:46 +0100 (CET)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 08:51:32 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5626.namprd03.prod.outlook.com (2603:10b6:806:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Wed, 15 Feb
 2023 13:51:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 13:51:30 +0000
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
X-Inumbo-ID: e1827390-ad37-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676469106;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Lekop6wlNMZ1VX/CCK9nSztVmk+8oD4dkz1SjLd7arg=;
  b=gSDCFJwyTrD5EPXSChmxRk4cTUSgCd1ZjkG68frPPJL9GrVU0KkGsVzg
   4HWdUAMQN6XS+yUJpWvFwtEe4aE4bmgOE6Te1YaSok9dqu5kTTpaS9MV2
   WCQtRkxT7nFobnq5/ENWM7T5eh58rtattHXwpBKNbkQxcw1Wtn9SPlsFu
   M=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 95983107
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MmeLyqoHXMn6DHlpsx5YfgnR7nheBmIEZBIvgKrLsJaIsI4StFCzt
 garIBnQO6uCamL2ftknYNy/9EMAup6HyN9rGgZq/H1jHi5G9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEziRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAAjRS2vpuit/KLlZeJnpMczKczmGapK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKKEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpq6862wTLmQT/DjUkeke4q8GlgXewcMN/N
 HMW2Q4TsYwboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC25CSSROAPQls8ksTDBsy
 V6NnPvuHzVktLDTQnWYnop4thu3MCkRaGMHOykNSFJd58G5+dlsyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:J/98/a1Sb86++RKH5urGnAqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="95983107"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxZgO4l+1Shv+egL//UR9Uy1rMb2PhRvkn5sQQL3kWKb2A/AjYOr97Zwor5ufPztCiQbf4oGwj96ray6um2Q9K90aW0FKdLKuu896IVHdnNjPqFui9/JmlbtcdTx7dNylwmSOGuPBu5R9RVCq5QFxtM/mqPvDH04J58aYcxB+oZN80tz1G0TdJbXAiEW2aLnI2ZOuQeQVe6YVJABHq3oYLk6Abdaz75PvIaYNc7gYaDwmCIf714lfQ39Q/KuWRSxTqiQ/a6IXXhDG64fZD8aaB/XYaxgkILor59qzvW2lqRrUui2DxEw2+RvdL2syLaW52ZPL0BN7zklu/BRfDPubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lekop6wlNMZ1VX/CCK9nSztVmk+8oD4dkz1SjLd7arg=;
 b=lzaeA5zODViHFwH8bv9zPi/nB9U3A4G8tzatbIRLAhIKzsR5Jg9EtuBA6fAEAw+09r89Mp8jPiL1y5d+u4adWDwOwcKw0tNX4F6tgMy5wppuYltLI5Rb7TOZ4nNJMedVXKQkAsxOSbBrwqhHiN3PwRp/a2I0k6Z854RrS/MJfujIFrS7lcvR3cbQJUEVviWnvIS3SzAsyB3lHvjZQcmhK6juX+667b3K6eaVrqZmC7wMpl+itQqq1W5yf0tlhMEenufmfvQr4d8lRleMvjjbiHe5wIp6pHI38vMTzgwQoYVNyvdeLMGSLhtIwtp1KCE8ZaNMmu+eSmrQvl6j9Vmv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lekop6wlNMZ1VX/CCK9nSztVmk+8oD4dkz1SjLd7arg=;
 b=tcO9BSD2q6q3gHv5bZXYk2Ijigx2Ikg1+vM1Ojts5DUm8uDbrgNmzHBVI5h1LEffVMKcFEjWBHu1uZU8fDBM0OTtl9Vvr4XKE31lIeXEZjXpdCSXudwWzxHx4RJKD82139mOfAR47OpQy/Wcd39giHCD2JirpeOq8/RR1GgN6OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <11587db0-8e69-ccff-d020-e7501a61ac38@citrix.com>
Date: Wed, 15 Feb 2023 13:51:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] create-diff-object: Handle missing secsym for debug
 sections
Content-Language: en-GB
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xen.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, sergey.dyasli@citrix.com
References: <20230208180457.800671-1-ross.lagerwall@citrix.com>
In-Reply-To: <20230208180457.800671-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b6b2c6-c872-4690-ada3-08db0f5bbdd7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iCAM4A/LIRKwtOQt99kA83AfjBKddnqldYa8gWova762TnO6qOrdWFoANy2E/Jk0y6SZiYfxrFvLs9DHHiOWit9bJZtP8AhuOK0JTypmFmk+laWWwD3fsqhSInFmUj39MoB5bDFY3jITDLz/V86dSY69N72qmrYElF2OMGfUrfJkGzq11Th36XGOpby89q0THN/fGXpc/+qkY8Vo+hMBZNFdPBYo5KvsU4LPI6TelpLiErsmcr5NxJU8C1moLU91pNnbQcgBDdwSvmnmZWCUcUVgVyCuqm2JVQWJlx+NGaO+h9GCy6DAXc46/5IBzUh3pctmv4zrgqrkIvhfYs5VEbUXL+HYhg/myHQq81LzDyPNPsv3OMqL9JTCVlnCYstdIedJCJ2Q7eoH1n8pA5hITZoegGIodjwE/Jn4EReu1dvifK13zuvL+lGXuhUDSZXPc2ci8f8wqMuFt2gUgJOkL61zw1yKuu6/2LEWJyCFD2Y2xcOvXlKPNUglnHkLF9DoBBw05l4OpwlfBmyfHyqmTOphhzkRcwA3pt5ywTGccoOusZPTdtllRtCTnhhoYquFPc1KaaMNPwzG4f4GA6GpSW/RyfyAeFX2g/v3wH0XHt3iF5+dMNXcoKFOVwyfW7cB60IaaRilsrieIREdG7F5UbKEOY533nF+tCiFVDkZsyT6HqvyilLR9ZzEh6dknJeLErS82Cxs+okVmqMc/XdH9uruKqUczwYh9E+gexNFS5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199018)(4744005)(5660300002)(36756003)(2906002)(186003)(82960400001)(66476007)(53546011)(6512007)(26005)(2616005)(8936002)(8676002)(4326008)(38100700002)(316002)(66946007)(478600001)(31696002)(107886003)(6666004)(6506007)(41300700001)(86362001)(31686004)(6486002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkw5NEowYTJ3Qjc5MTZQWC9wUGpHd1RXb1NMZEVqSG44ZVdmQzZHTmNhOEJD?=
 =?utf-8?B?c1BOSklmSlA3ZHJ1OUV5TWhKblRmQllxZmxPeVdmVkJCbDRSV1FCeG5ra1dU?=
 =?utf-8?B?ZXUreUR2L21MZWczNjBzdGJZMFpZVFNaelc3YnhKQ2lnSEFQenlXSS8rVlZ4?=
 =?utf-8?B?MWFWU1BWVnlZTW9lNnpXZDgrY0YyaWJ3VUNjMThyRTJuWEhuSHgwTDhucVZW?=
 =?utf-8?B?dWFkdEJJMmI1Y0ljZnZEZldNbEtCSXA3RlQwL01PUGVhVVEwN2JDcFFIZGsv?=
 =?utf-8?B?TWpNRHhCNEUzb1pLR2tpV1VPeDFaSytPeDAvSUpwd0lhbSt3WnFyMWErcjNH?=
 =?utf-8?B?RnRaTXYwYmpsclA1bUNnYnpFQmNuU0JOQ0crVTBHbFVFbWtqL1Q5dWZnMFNl?=
 =?utf-8?B?QjMxYUt6OUVoWlZWZUsvckZRSGNzdFBoM0tXdTIvZ0JBdU9WbXUrYVljc3hw?=
 =?utf-8?B?QU9XdEpUTk9xNzVVek9xRmp0WWU4UU5FUDlNeFBrZ0NqVXBUOTFtVldLdDI2?=
 =?utf-8?B?aDNYSXA4ZVJFWmFBZ0NOaVZzOE8yODZaTkNJVVdoOXd5UVJZekI3TGNtUGI5?=
 =?utf-8?B?aWg5dTRobUhBWGJkSXNWWWtQOCtjUFpSNXRDL1dNcUxtRXU4OGppYlhtRmZx?=
 =?utf-8?B?TzI1VU9yclErQjJEVUF3VVJyS0NucnJLL0dnS0xGVzViUGVhL3R5Z1R0VGk0?=
 =?utf-8?B?UHF3UzFGMTBPQkg2akd5QjhWL0VsMk1CcTRCT0hvb2JZdmtQKzhobjhzcG1y?=
 =?utf-8?B?SmY2Q1FPbWQ1VTM4eEJBTDZlMTBnNEpOQldkRlpjSENNS2lTZWxXb0l6dnNm?=
 =?utf-8?B?MGg4NDgwdHJ5eGIxeGxmam1IWWt1RDFFK1lTWEl5T2k0QmNiLzl6eGx4bm85?=
 =?utf-8?B?SGY5b2hnOUJ3eWJkYzhSK01Gd00rV2hxS2xnSGpKb0FNa2VVSjkrVGxiZlNG?=
 =?utf-8?B?VVFGbzg5QXhkek9RS1UvYVV4b3BhTnVTenVVb3NBOVVRL0ZnSHRPMHNFOC90?=
 =?utf-8?B?RktpVHBpR1FtS0hHMWNORDBvZStFcEl2b3FKOWt4WkNxbnVtcUt2bEpFUGtR?=
 =?utf-8?B?cUZxTlhvMlpCVTJYQXFkWElidXBoLzl5UzNUTitQb1duWmU3eHZIK2N0blI4?=
 =?utf-8?B?RlZHRXdqOFE3Q0VqcXRLVU4wRmVpVVlxZEp4Z1VXOTlqdHJiV0dBYWYzaHJt?=
 =?utf-8?B?WlkxQUVsU0lQZWZLRVhvL1lCaklMVEpKelg1MEQraGRxWjJaTmt6dHJmb0Yv?=
 =?utf-8?B?UGo1akc1YU5oTmFaczhzMk83dWtMODFkT2c5dThBTGhpNFJueUM3Z2dGVFBt?=
 =?utf-8?B?ZlRiL0VSNm40ekJVTG9DZEdwd25JckUzYlJpUHVKV1BmOUM2Si9pZnZ6d0dW?=
 =?utf-8?B?L2VHWFRrcTRnb0taUnEyYWxjZ3VxM2twdmh6UnJOREQweFp5U0owc3U1OWlt?=
 =?utf-8?B?K1dNMUVzVkVSYU5LbWI3aXowV0J4MkN6UWxHZDVndG9yamNXbTBJV1FTOEwx?=
 =?utf-8?B?VXl2SzRzNFpZUzU3WElSYUw4RHgxYTgyUGhDajZwT1JRSFhuL0VNRGIrbm55?=
 =?utf-8?B?Yy9nT1MrdFVqNVByTklOcFcxa2NIMDlzaDI1L1R4NGpPczRKVm55bGJFRisx?=
 =?utf-8?B?VXNrc242cWN5Zm15RVY1OTNYUjhBZkxqTGxUNE9pTFVkdFFMVm5vSDJiZ2hj?=
 =?utf-8?B?dE56UWVRbmg2a2sweFcwbUpSSmxBdFdBWHpYTEV0YlZDSjFyQ0VDU1Q0SklX?=
 =?utf-8?B?S1NSdXVmOUZ0ZGVkd0pPYjRWR2d6QllPZHBPL3QrWm12T0EzV1hCTXRMbUFB?=
 =?utf-8?B?MVRBSURrK2NaQUJvOEFjSmlWSzFGME94ZWZqTnNHd2FERUU5SGNvYjJpMVdZ?=
 =?utf-8?B?dEJ3UTB2YVdqRHhOQXYrVDdYR0xmOERCdjZwdWw4REpjblM1V0JrZ284V0NB?=
 =?utf-8?B?L0ZteTQ4Lzlwajl3dmlucXpUSExkUEFqZi9OWW8xUi9qcUNoekx5THNNVklu?=
 =?utf-8?B?NnYvUGF5MXBGT0Q4bi9ROXpkOStUSGZxUENaSy84RFI0WG5nczUyOEdoU3FF?=
 =?utf-8?B?bHFyUzR1c1pHRTZZSDJQVkFjM3cwSzlGYnJwczVsY2FweVVnRkFJMHF6ZEVW?=
 =?utf-8?B?dEVMVWNaUUh6YWh1ZzgrZGhxYXBFR29BZHJqY0lIcDVjeGQ1bldvQjF0aThl?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0t2PVc/anR1FXbCO758rrCvsYMUA7YVO3zbEqy7B+vOYQYJY/3gvydCBmC1FQazhvqLyaCzPNTIVWl9/EUdy/nrjbn/uYlPWKImEp0S2jbvPSuFDgFJPhgP6qXyC/JkTeMrfRUPz3z91jc9LM5FSNTQgTXDlyEiAnQy1G3IOEoBxgTIMekOd4HuxOjxdOV/C3Eh1Z3ttzZOHPdakqNA4+/sWFSC3ffN6WNC2tx4Zhy6LLIpOJtWEbcMgwjqlkR4nlzpIcYArPb8C6f3XlocYd30wwnPo8xsDJpfR5Xff9pv/E6T/q8UP5erQkez1RWqAr1OzznEe6Z6HFOBqH6tjceWiki1v9c34kN1Nd/U1a6Ldy+Eatr3zGVZ04XpmcoocYOQoPsUdNar5oa1fxAbdqx0HShdtmK+7m0u4r1rujHAUFXnSyNsMq+ad0XeI9w+6IiFXT7nsz3BJaglmp1lN43otozPOsbMDAI44xflY39cT+EiES3CA8NSl2M/2zUn/s2MGe/V/PeRzLLFwumLnY1RBfGsgbxgY5xaG4+romPHfLqcbvnKBR9udcJ5bJ3FhF2UTXH3KASurXIOb0KmQk4+wl0HFgFdHxZk224XHGJoRMEniHf0tjcE7i58L1F6w6az7nxnlkZgTu/aocO4+sZjWkr7a9dx0ihZ/jqFmfdjpeubQDTnLzx1Qfa+JZdD/WUb5pd3PdVD9zm9evlVnesTI+/xjSIMx/nT4lHY4Mvx07cIf9HesI5h0Qgdcjyt+iEg6c9zQcemlnCfpaLYt7liTPxhFbZh+RV4UMqKptvc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b6b2c6-c872-4690-ada3-08db0f5bbdd7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:51:30.9057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eL1/GdcPUJyA4YkxmCO60ZZzhFT2Ep39CcxLvYbzyot3OKnbpty0Kp4sDH1IkgqMOkDNc8N7D5ZHUnCzJqkUKyQQO3lWfHMb8R6rD8sz7HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626

On 08/02/2023 6:04 pm, Ross Lagerwall wrote:
> Certain debug sections like ".debug_aranges" when built with GCC 11.2.1
> are missing section symbols (presumably because they're not needed).
> Instead, of segfaulting, simply don't include them if they're missing.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

