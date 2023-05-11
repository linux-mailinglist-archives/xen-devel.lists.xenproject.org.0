Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3556FF533
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533447.830134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7hc-0007ze-IL; Thu, 11 May 2023 14:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533447.830134; Thu, 11 May 2023 14:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7hc-0007xB-Ex; Thu, 11 May 2023 14:55:32 +0000
Received: by outflank-mailman (input) for mailman id 533447;
 Thu, 11 May 2023 14:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+vG=BA=citrix.com=prvs=48888ca5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1px7ha-0007x1-SQ
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:55:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd29d21c-f00b-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 16:55:28 +0200 (CEST)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 10:55:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by LV8PR03MB7469.namprd03.prod.outlook.com (2603:10b6:408:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Thu, 11 May
 2023 14:55:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:55:17 +0000
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
X-Inumbo-ID: dd29d21c-f00b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683816928;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iLzNp0Uil+lUeDT7rXJ7JiIdPzmdObHlI3GyQ34QU7o=;
  b=fmbWBE5vorV0iEMPgNLil/tykVykg2M5Nf4SkvzANPeWhoPLCY1XrClK
   NXbqFLBz1HGbT9VEX1rMliXFdFbZg65PcPz0X0o3+bASI5qpG4s91I35a
   kbavm4HmEVaXvZfe8QRCzJblKrHEJGHazwbugw18PTe6TaRd6USZLx/8z
   w=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 108018898
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8oDHEaAchVX21hVW/zfiw5YqxClBgxIJ4kV8jS/XYbTApGshgzdVm
 2UWWWmHMqmOMTb9eNsjaYq+8E0A65SEx9BrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5B5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo+NsM0tg3
 McieT0nPz/evfmv+427c7w57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xrsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37efxXqrCNNCfFG+3twpjlehwV4KMycxTHCpouOerHOnVusKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRSXKa9THuc8vKYqGi0MC1Nd2saP3dYHE0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdvG07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:135BXaCFXQRPDA/lHemW55DYdb4zR+YMi2TDsHocdfU1SKOlfq
 WV98jzuiWbtN98YhAdcLK7Scu9qALnlaKdiLN5Vd3OYOCMghrKEGgN1/qE/xTQXwH46+5Bxe
 NBXsFFebvN5IFB/KPHCd+DYrId/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AmIT6JmsO7sYBtYEFDip7g/dP6It8d2bv5ln5GHX?=
 =?us-ascii?q?pBEw4Z+CvUkarx6Ndxp8=3D?=
X-Talos-MUID: 9a23:NBBNQwZoIkscBeBTlXzijgNlBt5T2YO3I1IOi7IghtCJDHkl
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="108018898"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McbQrTMfkEtpM4g5V0BJM4Clv0EJSx7LJKcSl+cb51bMuyUfKGfspXpk0fTXozSwkML0XDAatMJzk01tOG9C+6v0ZolQsnEBe3EidREew3h1YVYVLnFV5x0LeVMjYVKfSNhgMMKExIaT6ZK4mQehVmF5DejGqZx/Rr4sjDaVVDa5DbDNZBPad6Y2iLCi2PtfdWzMyagZkLvv6vjDvU0TOqOs67eGpZKyYr7sHiARNxGKuan4EySZqyjNNkV78FUSm2eP/WghE6Wqn3uQdPT3DeNEkqJySD5W4Yu1tMIN4n4BpaZ+npQuEATVF6yABCHq292TyeXV3wEM1omA+ojU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLzNp0Uil+lUeDT7rXJ7JiIdPzmdObHlI3GyQ34QU7o=;
 b=VgInGmBUxhkPhXJBT2Q62M4/Notk3s6aOh90wACw2+6FrpyNBzNkeepkrOOZL+2EHODQ1wroaCsbsgFIFLcFG/jl+vp/yPCgxRa+Uk3n6pTZtg8qELgOXj/R3wumc7wYgW75IuuII54YzVroMZv9kN8c139yvdViWVs2q3mTb1BJz1K/bGufjcc0lum5yMXyHLGLMmO2NywPoLZmiim238jFEn+rZRnJ0TJh+lanWh8ZcjtW1uwnNfymnWp+CTCIevoFeZcgqYXlUTcTX1ZbpaisD8cmX7tOfgrOKZYOC6iJFv99DbSUk0dX6yW2s2n7VhWTkGuiIIqjy2+QEvOHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLzNp0Uil+lUeDT7rXJ7JiIdPzmdObHlI3GyQ34QU7o=;
 b=icEctXHmysuER4HXslgcV5pmj4tRBRUBg0Gdhn2WsZTN6dJqCpSoNYOGJhlQLyn4lG1lkQFd/9hElQFGF6iWo+vuJaBdwtnm86LVg2PXO4XEpUq1R4Wwo4k6KqM468hglifAB1b4/9U9gxnR5JSnexUSqf393sI5gp/kAQoJKeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <83be515a-a327-c5f2-68d5-88d2e00ba806@citrix.com>
Date: Thu, 11 May 2023 15:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] iommu/amd-vi: fix assert comparing boolean to enum
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230511145152.98328-1-roger.pau@citrix.com>
 <5aedc6b9-2ef6-2c85-1949-b6cc333a7267@suse.com>
In-Reply-To: <5aedc6b9-2ef6-2c85-1949-b6cc333a7267@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0337.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|LV8PR03MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd707c1-8821-4e01-ed2d-08db522fbba1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D1J3q0xJuBxHNVuufACgTbazwFFRak/EZgI95cQ5CQFYsIIgcWxIOaXwkD839xTtboLpiifH4ySPjj33U10AXdo5f2XiZeyDw+jgUx17eDnmt6OxjXHCjs8NYSyafNtOhtcDWrIMaXN7jsz6lfHT6gif5VIQU8JBx3bwjsE9/5z7J01nB3JwEJH/enhjMcjp79IhRgmjBhd0O4YwbrCufDuGdaem42xgF989tuINmtbgdRZ+m+mD0wd3imHR0iRXlE7tT2qGvTCJ2i2pdwenCthCXjPPvM888gELONYqDZiWcHk9ZhMoV2owt5MUMnLMeEuQaA8QJd3N6BS8AZ2xL2tpAsAAywxza5QBpVKaNr37WJ7BYMlzxu7pF8KNLWZrZ6LFFF/lGVzM5lbDE6uyXTa5w4oBFUYmKp+aMKhsTEAimnYlMzBsIMvc9l7gZr9kGwKSJJQCywSbu7ixH2V6sAn79TPW5Y+Gy+ql6uXv7+4M/xG5DjBghEVpafIvklOkUXotw/sh8wKpAKoF+QfEVzcnZTTEQy+UPwwodlNELPqdjpNvk1brsofDXM0PdCkc9q9tS0+955XJebP5VF91DVnBg/vUw1lnGvd/9KPDsJUkeBG8GVuMFEQKJC8F26PESali9vAGNunGvXWLljVcfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(6636002)(6512007)(6506007)(316002)(186003)(4326008)(86362001)(66476007)(26005)(53546011)(31696002)(66556008)(66946007)(478600001)(110136005)(36756003)(5660300002)(6666004)(82960400001)(6486002)(38100700002)(2906002)(8676002)(4744005)(8936002)(31686004)(41300700001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzI0NkNGcnhFaENSOE9vQlJKUlZxYTFKbmJCVEh0MjhmNkFiK21RZk9hUTBM?=
 =?utf-8?B?NmhQaHNuZ1NIVE91Sys5QlcyVmp4WmNNN3JuWjU2ZW9XczBvejNBZ3k1RHdR?=
 =?utf-8?B?NXZiMVRsZU8zN1NkS0lqWjBQRUV4VjBNamNyeWo3QUNMRFNndjZUY3J5ekVy?=
 =?utf-8?B?VUhoakJwV1dQelJYUUZ4UjN2d3F6VXhra0lNNG9GR1ViSTI2bUszeUhMU2Ur?=
 =?utf-8?B?TUEzU2JPYlpGampiM0RWV3FPaFU4djZYL0pOWHI1aXViRkExSUVrZE9IOVhB?=
 =?utf-8?B?bDEzUExRU3l1bUhSeHVMYU9TSGdZOUxYb1Y0Z1ZhTk9hVFdUcll3NkprT283?=
 =?utf-8?B?OHBIZHlvc0d6cDZ4K2swMHRpajdUaUV2UkZ1SHVEYjVIanFZRStWVlUwRGRm?=
 =?utf-8?B?aUpXN2lZMldBdkVrL2cybmhWQjlWMHF1OXU5QVhIaEVlSWN2ZnhxUVBUYVJt?=
 =?utf-8?B?T3FDVmxQM2FVcnZ4MVdEUmdEY05IRVYxd0kwZldZemp3ZEt1K21yNjRoVkda?=
 =?utf-8?B?eDQzOFpMUmRFQjdPdWZCS0pKNURxM2RMMFUyY1JkVFpTa1laeFNiWmhseFkr?=
 =?utf-8?B?Rnk2NVFHbnpzdEdwTFpacVdrVzRmdHV3M0c3ODY0MFZRcGlCazY1SHVDQ0dM?=
 =?utf-8?B?bGR1T1JhdllVQVlHQlZVMHMxa1l2TVJiS1ZWUDBHNE01aVpqdDlxUm8xeUR4?=
 =?utf-8?B?ZWwzb1l3S2RDTWdVa3M1bDZJN1loV3ZQVzlKU0t5SlRySUZEb3VvMFVoWmE0?=
 =?utf-8?B?SHVUU0duM0dvOEdHa2ppNURBY2luekFhNzZTMk8xT1VuSEV5dm5NMk4rSHgw?=
 =?utf-8?B?bjhuR1JQU0tlZE9wY1FTbFJGN2lFQzgyRzdyTCtEbmtlSk5peC9rUXRia2xk?=
 =?utf-8?B?d3h0QW9xbGE5ZFRzQys3ZUJMOGpWY0dnd0pNWGRSYWJpRFJOOHNPNWlQbnpu?=
 =?utf-8?B?Y2NpNmNZVnpoN2ZEYkVqa0M5RVJVWHBJcFJxanJOdVUreHJoYi9NTDFQcEFv?=
 =?utf-8?B?SUpmTU1icW5tUzhyOW56STcrb0d2SlhzNzhCK1g0ZGt5RVpSN0Flelg0WFVv?=
 =?utf-8?B?M0ZoTGwxS2MrSXh3K1RkekMvbHRkTVdjV3JwYWgyZE5SdWw0bFNNZnd0dEtL?=
 =?utf-8?B?ZXJBdE1FRVA3NkRnSVBvZXdzSHBlMHpqV0NNTWRCaFlsZFBMQzg5VXZzS0Nm?=
 =?utf-8?B?ckdudE1vQU5Zd1ZialRHcjBEN0YwKyt6Y1lzRnZhZFFHb092UGlPYkpVVFVr?=
 =?utf-8?B?N2NucGJkN1o5MW5zUUFNa1ZhQnVSRjhHSUlMbzBLeHlKUmlHNW1BbEd2TzR5?=
 =?utf-8?B?R2hxNFhKNDA5OVNHU0M1N3A0Qnc4RkZqd0NQUnp1bStFNXpiciszeXp3c3pC?=
 =?utf-8?B?bXV1b28zS2hLeGJ5NFJnbStNUjlMVGhRVGw3VDFGNFhLa1lXUjlrWUk3UEIr?=
 =?utf-8?B?WVpiTExiOEpIR0VFQ1QwQkN3MTFjMWdGd3ZLekhEQkR4cW1lc3RxeTkvNnlo?=
 =?utf-8?B?cnZ1ZkI2NndJZXR2b3k1eVZ5elp0cGJBTkREVWpEMEw0bURJSS9CSDhackRC?=
 =?utf-8?B?aFVwSjk2QkFCQkduSXg2WHljN3dRU29oSDRrRUZMNm93SFp4cmVlNGZYUVFr?=
 =?utf-8?B?a0tjSW40QVlNcTJqUVZCWHFiOVk5czZYb3dLQitoVFpkT1ZUVmMwNVNKMW9Q?=
 =?utf-8?B?eFB2Wm9DWDYrKzNUZFAwMHZKdHJXSXJYSnhoYnArNThZYXhibG1hUGsreGk1?=
 =?utf-8?B?cG5saVhZNjJRMklFS1VkaGxrT1RUZHVlM1hWY1hna0JrdFFTeG4ra0VhMlI3?=
 =?utf-8?B?WndBVUlGUlZlV09jNnFPZHJDcGlrOHphWUdONFpGTWZRenF1YzFNRDRIZjVt?=
 =?utf-8?B?SWpXbGVQRWZ1RWFVdGFwRStWZFNYK1ZNR2RUMzNBelJ3RXBXOXhqelFPZTha?=
 =?utf-8?B?STN1cS90K0FzTDRKOVR5cHpnZmo2WlI5N0lDV0VRL2xsQ3Nkaml1QkxxZ0FF?=
 =?utf-8?B?Q3ErVmRVOWF5MFhSWm4zcENxNURJUjg4K3RydXJQb2VuU0dRNHFkNUVqTEZr?=
 =?utf-8?B?dHRHTDdMOG1xV0ZzQXNUdHh1NzdZUUhKQ3Ntb3ErSlBpS1NqTlFwRWhKK0Qv?=
 =?utf-8?B?UkZYM1ZCWWRPdDQ1aTFiOE9TYnhGVStUSzBNOXI1SzZMbGgya0E0Q1B2OFBX?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QcrZL9mXzibKpqfUQfLKG1Cv4Wdo/BIrs9Nc4TDa7UqLbfLGX15DI6CCLzpN15Yvg9FlBEeTIXevbmTLnImtjCgoubnvPdWkYm6TrCyGJjQZi19JmkYWp1SRYJn5g89ze8ruHkBJi1fQYNDMpj1kmUzB81SABBIA7ea27fVEHIIP+Ey2/v2u9eWUp7BXKZ2d5F50+HMqp2VoGitE1mhU4idhVjMZlWn9pX+CsqEX6l9JmayMUTqpR499JAHwXwhFqfBtd5NdGuZDwHSquY7hZnxzzyWhfv6/pjYZbatqtZQHoe4kE+7w6sdZvnETIoQ8zf57wS/c88/w4qWQDjj/4s7qasWF45PYukhELNf8ETEcgTqgC8YwSMYKMoaZE1/2zDS3O+nzfLuV7tvVljsnEgQtvEAvdjvTl6QINpQLaPdc34IvcgCL+AA/K0wRrV7YVRSIorAVABdFNcxaOycjxhIX4+oBJaUaCsSJzeuH2aduwSssL8mmD2K2K3LxQT9L44wlb4D0tTbA1kIsj3IIhLHqGJ2sF7Esq9872FFYsCbPoTibX1wa9H+riSxgLwBhTOPzrSqDkqFS7kB7pQRnZXVya1Ke90AFmxCDjDeUlLlXHVwKsHdQQVDih6fty7X5plGCEUbSTKZPeNjGsIJ9AOeYIJtKsAkQBDqD9/7JSYsYv0wx7ZARls5yxGIYXyMKVP/mNFG1GH7l/yVg2njAxU3uX7nbeGZ3u0tTvk830Z9mXTVHlmupF7kuFmh9sCvxReL8ho3FV/a7Nx1r+6SipJxPNVtPPDdnuL/UQMQFaQE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd707c1-8821-4e01-ed2d-08db522fbba1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:55:17.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aA7ZYFJ+nfHY/uiiGFOPk6k/XrNXhVBt5/mxRVdWxl4ntJxiPdy5PrvCmybI6xjloSxVtVzlI8vnK9gYXkv2HN1B/lz8VDePsCwMz7bfIGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7469

On 11/05/2023 3:53 pm, Jan Beulich wrote:
> On 11.05.2023 16:51, Roger Pau Monne wrote:
>> Or else when iommu_intremap is set to iommu_intremap_full the assert
>> triggers.
>>
>> Fixes: 1ba66a870eba ('AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

It occurs to me that this might be related to the reports we're still
getting of some problems on these systems...

~Andrew

