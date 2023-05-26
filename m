Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7F712546
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540079.841564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VJk-0001Vw-11; Fri, 26 May 2023 11:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540079.841564; Fri, 26 May 2023 11:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VJj-0001SV-Ts; Fri, 26 May 2023 11:09:07 +0000
Received: by outflank-mailman (input) for mailman id 540079;
 Fri, 26 May 2023 11:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VJi-0001SF-Ie
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:09:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b95a61b4-fbb5-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 13:09:05 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2023 07:08:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7297.namprd03.prod.outlook.com (2603:10b6:510:24d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Fri, 26 May
 2023 11:08:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 11:08:56 +0000
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
X-Inumbo-ID: b95a61b4-fbb5-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099345;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jOKHXyI8yUBES1UXZ5ks+cEpqCkC8PveEW4UQ9MmEtI=;
  b=ZxCfU6lVB+H3PuNMvxq5tBnu8WSvGv8om+LLoca9vSljQTNa8fyfWYn3
   kqw35xW9IxLGKN0DDXQCrQ30H7GZXIx/TeH5b3ZdIbCWRhAu3qBo7b1xC
   HV7zcClJD/pLaR4BF3vnL99j/jTd1FYwTOchQhbkJyHZWxCXkGXvfE6fV
   c=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 109859152
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ndZfJanIl4mtbo5l9m/0k97o5gyNJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaXDvUPquIY2TzLtx0bou+p0NQuZHVzdZhSFM9rygwHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgW5gGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dFfGAxSLVPbvtK74bvgFbQy3N14EfC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCyWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOzoq68z3Qf7Kmo7ODAUfGu8o/6C00uRAo5ZA
 HMX/C8qsv1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 lqAntesACM1trSQECqZ7u3N9Wz0PjUJJ2gfYyNCVREC/9TovIA0iFTIU8pnF6m2yNbyHFkc3
 gy3kcT3vJ1L5eZj6klx1Qmvb+6EznQRcjMI2w==
IronPort-HdrOrdr: A9a23:GrAk6aPVUxXO+cBcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ilfq
 WV9sjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/PYOCBggqVxelZhrcKqAeQeREWmNQ86U
 4aSdkYNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-Talos-CUID: 9a23:AFKXdW+Lx8zZFOlndvmVv2NTKvx6MT6F9UfdAkbjVjs3EqTOdGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A4iFksg2VylPSowi+NhZRMNsngjUj04msIXAKk5I?=
 =?us-ascii?q?94syrbHB2EAieijGzXdpy?=
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="109859152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXircX0PHbMBQulGBrbRzvmQEGVLHVkEfK6hTyxp3fOSM1qbZ3HAE2gShWyKQfKZAMg0aKMy4eOcM5x0nUNKuKgLKzIg0d+70R0fEfdWhSHSBKcws/g+n4oaVMRrV3osx4JP9Ci16dvGZ2NS4KQ3VwG5yxFksi+khjQXZBnjzG2i0UsYqPTYhNRFfVtbZ5lmbZanmJnF15dbd2wOZsjTiozBnAzAvWu9NC0vzWdU1qaY3LGDkVVyp2xD3ouj55tS+lSNkKpi0y+NJlaK9jHqIK/8xAnyGcba/GZQrd/bFt5OmJggNMLqJBV/lnHs+EPkId8BbFNRb4tri46xvRSL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBYY5bMh3hQvbzjPhGt+16NXqWuUmSKHdlWdKj+FKT4=;
 b=L7LHNhJg5yeG51qstQLWGPyCAmBG/AO2g5kTkifyA/LidGC/w5hZddUrf24BGrre7Wd5Se9ny5T9lGQ+h4jVSNoDMDpsI9lZ2WEEZry2L94tj2MVxLmZXdUiMWzoqgqC0KKKqiKtgn3uwi4rVDLGcLGesIit41g2NADHwx6pTbm135M8kF/sBmcbkgE72dkKGzjFISLjDPq8bwcD2yiVzntgWi9+4EvM0QD/48175Ils86ZpazyQQ2nWw+N2S+dhh7oBrUta4fwAgB6qQDs1m1yI9VfDl/JS+kVi7SQkqkjbQxlVjQTWL2wgK/Gxjd7+8n7Y5G0RXoArPCtodmIZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBYY5bMh3hQvbzjPhGt+16NXqWuUmSKHdlWdKj+FKT4=;
 b=knafUeEQPEgkUCLwNW7qxwNNtPzRlBLm7cfNlatCX7OHS5QjVVvL0WLKIEIKqUFFiW7MmqTwcaDHlkTpwyyYgSXEzCnQZDqu4go30tGiU+8qprjQL1n5tTAYvnj2aBNQA9azCiC5c9hfzVvRo+DiwJxCVP04D2r3wWuS2HpklGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bf51f176-4076-8a1c-7cbe-c7ff24c1cf3e@citrix.com>
Date: Fri, 26 May 2023 12:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/spec-ctrl: Synthesize missing RSBA/RRSBA bits
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-3-andrew.cooper3@citrix.com>
In-Reply-To: <20230526110656.4018711-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e19128-45f1-4e25-53af-08db5dd9987f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u9jAPGNmDr8gNo8mhWlycW6OLkwBwzmzcc/X7gcjX6lghMp7c7kdcIaNAU5LmNiJoYl/zbmSVBcsBNk3D3122VFkUgOh22i00/jF+HVt23CYAmOyhHVu1v4sUPz1wL3zrUbyucgpZe2z+VXlu0vyfM7zNuk/OBNdjS1EgHTzNPObpkEkuhSkVdoIyrTo3Kj7E1XRqHexAZkHQSmkXYwSW8zkpYu2kcHvI8cGAPKrEHafFYw7cIUR7itIpnFhdHPmqHx12l9psoe8POqH5Y0md422rWJnnIgJb039uPGQC2n68ua9nSuxFq/sq8Dq8nzNx0jhpXkmfckMvWOvIt26ttHGDGrbzT0kzj005z6mPw4PCq/R2MPaysCOb5xWJhpF+BROrI0DWi8KmYyy528vpMvf+kEbENz2Ws3IwqshqpIN6JmmGh4BIqeHojmA7abQd+byepXw/VMo7E4pGutJIyCp4FYK+FMWrasVCXsPK30EqpPhchvghtwmky0NNNiOl1sIJp3Cxc5f6Xts4QT83PUo6skzPIgh9ys9q+NBMi4o8HtX/ptGPA397FTZpzUbsx/zbazjV5c1s26qn2ZAO4pI+a0zpEGQFYax+ttBE11dtCwsRCz72HziMApzw5G0x28E2d1Znd1UNVMUqSxDMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(5660300002)(8676002)(8936002)(2616005)(186003)(53546011)(4744005)(2906002)(86362001)(36756003)(83380400001)(82960400001)(31696002)(38100700002)(6506007)(6512007)(26005)(6916009)(316002)(66476007)(31686004)(66556008)(6666004)(66946007)(508600001)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFFlSUlsdjg0eHBrc2dmbWV1OXYvOERJSkRtbitlRng5S0VaMjY2N002aExo?=
 =?utf-8?B?MmJaTTh1K29qSU9tS0JHZTdIclFGWUtaOXhXd3ZEay9EdHJZb0xEaHdOS1FZ?=
 =?utf-8?B?QnZadjNHZzlRYTdEYUtjK3lyc0kxZ1ViVEdwM2JFUVVWUVBTSG1OcmtTVG9o?=
 =?utf-8?B?V25JQUlNalpLU2Z3MFV0YnFhZG1WSXFwSjhLQVlZMzUxUEZNWnBRZG91R1BG?=
 =?utf-8?B?OS8ySkM2Q0tuRUNpODFmRkhMWlZFVWJXdG5jbE5HZ0Fxc0dKaU82dGNyUWRQ?=
 =?utf-8?B?Y0c5WUFNTWhjTVFKRjF2aEVzbnBkUXVWZXhjSWJiVFVLN2l6RUtwN3BmNkNo?=
 =?utf-8?B?QjZ3Vlo4TEU0aGs2aE5KcVg2SW1tZkdqNU1PV2NubmZBck43bXV2dEF6Sysr?=
 =?utf-8?B?WStMWTYzV0pJczNwMy8yRHNGR2dKVHJSVnVwM2pldnF1eTNYMmhiTjkyQWc3?=
 =?utf-8?B?NDY3bDdBRmVVcEdUTVNQTDllVERaZjlSYk03RUFUM2QxMlltY2c1TDhRUUlP?=
 =?utf-8?B?VEVoS25Qa0lmeWw2OWNnTXcwN0w5bzZJVDd5OTBtTEp2OHZNZzR6dWFHYlR5?=
 =?utf-8?B?Mkx4WkxkaGMzZkZtUkt0anYwaXM2d20xTnk2YitEYmZjMlE0NU01QjlXQy92?=
 =?utf-8?B?UFBKbnd4b1lRd3RaVjdqR3Z6RzF2QzZVWGxURDI2YXBFRUtCWXZTRHluc3dl?=
 =?utf-8?B?eHM5YnFIeVZqY3NUZkdCbEFGV1kzQmRyK3kzK2Y1VWtlYTd3R3dlQVJDZWJu?=
 =?utf-8?B?VzF3bTZRcFN2NytTL3J6T1BhdmxoMFFIUVFXRjFtOUJLV0tmekJwM1RmQ3dv?=
 =?utf-8?B?dlBKZHRVOHdjKzVYTFZ5SjVDdTRsU3g5NnBvdzRCUFRuQlEvZW5ZOStnNTNq?=
 =?utf-8?B?ajZMRkFoT1lvQk91T1ZCWk5HdmNKTm5CZ0Noa2xLd3J2U2w0RWRRQVVVVStu?=
 =?utf-8?B?SHJLUXNFcmpvdllYSXRnY3hGVFZwTlNXekNVcTY4T2tzbUpndDgvK3IyWEJv?=
 =?utf-8?B?WXZRRkRRN0lJV0p1QXh0ak9tQzZOb3NGT3lzZjV5T3FSNGxoWSs1Ly9IbXQ0?=
 =?utf-8?B?Wjd3TTZjdE5aRTNPaFY0TkZTaTRPZVk3aFV2VkVkRnNPWXZmU3RQN0pGcUtq?=
 =?utf-8?B?YlRTTTlnN0tJam1Tem9vMEVVQmloVWtMRUt4RlN3OWkvWUs0Qk5RN3FhbTVr?=
 =?utf-8?B?VEVoakZmTlUzVEhBQjVBbEtCTCtrU0JRcnRZQk1WWktIYlpwdzRLSVBWL0tO?=
 =?utf-8?B?K2k3ajNZQmJPVWcrRCtHUTlvUHR3ckhNVW5iNUdyZjE2U0s4bkdOMlI2S0V6?=
 =?utf-8?B?ZXhkWlJoMFE0N0VweFc0Y0ZOM0xER0ZDM1JWc2pkQm5SREwvWWRQSGFOS2t5?=
 =?utf-8?B?VTJKRmRoS0xTa1Y2TW5ITFBva0tpdEhacTVRUkR4UXhwWThKYlh4a3NIMXJX?=
 =?utf-8?B?YkhmZ3JjSlRyeEJHa21PVHdUdFFpTVlLelV4VGQ5Q09EN1NtTThkOFRjT1Zq?=
 =?utf-8?B?aUlxYzQ4TmVqZU5rN1FYMnY1dnhUbmVUVWZpdW96UnREbTJQd0Q2K2FHc29v?=
 =?utf-8?B?TDlGTFNlanYydm8yK01HWVUvNis3eWdpaHlRdVVsRTlCMWhBM1FBYXBVVUc5?=
 =?utf-8?B?eERaOUpKYmIzc245eGZtd2w4eElhV0tUclh4S2t4bFJ3UW13dFVMcmxkaDlZ?=
 =?utf-8?B?Mkg1QzNPaWtmYnFtenhjWFEvUjNrdHdiK2VMN2JrNDQ0cTdJWWFnZk9oMnZk?=
 =?utf-8?B?dzZlVkFXY2ZVME5KQmVWTzRUQXkzd1ZKNlJUTjlHQjV1Vy8xSVRLTUZDaHdl?=
 =?utf-8?B?bWpRaXc1ZVppOEtVdlVoM2EzbDQzMHZSUVY3YkE3dyt5TWpHQjdSRHpSeEQ3?=
 =?utf-8?B?V2hBYWJUR0N0cHp1alVhNVZBczVtYjZGT0lWZ3dsQ20rTmRTV2xwNnlQbG5u?=
 =?utf-8?B?VXdEblVhVStBYVV4R2FiRjRySCtMSG1PYXdLbUpqMmh0U0doaWwxMEltMXBJ?=
 =?utf-8?B?VkJwOVZIVm5FKzFYWlJHSHQwbjl3YUswQnI5Z1Mwdko4WEU1ZDdZNzJPeUF5?=
 =?utf-8?B?QytTRnQ2RXZ4NFN6Y3diYTFOa2YxMGdKOENBN0VhMkZ5enFOT09aQlVEVXJS?=
 =?utf-8?B?QVk3QlljVHhCSjdmYXBUM2hCb25ROHdMRnNpMFo2SnZUOFZkOE1EK3BVUXRN?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9F06OL06gmK37Xof6gWn+wesBEYfjB58T8wScBstD3CdzHum8bdWXlsMey9MdIZUEb1r5wukMSvgLGdXoxeWTg41885YfKwNHpp6HxatkixNe3EXAYSF05Y/IJfKazI08mSOjG1uHZNMgEHnrzS1Xptvpq+cvtF+lunv3LvQg0Y4gWU8VWdccsyZLWrRm3w530oKWjjFCT+FujwhEtLRL549ErecDRp5IKmW+nYQW/mZ1ggLEd9TTaoBseirEEZCaicbPQGqqbnm2VujN40pSzaNsQ71isB2a5Xo90l9QQ9XMMxS8O1ya2w8pZdRTTTPtY+JPhGfWsX/vsGggLmj4gKyEfPbkpT3dDEIPSUPNXp4vJ5f6AVLK/SvoDMtm3qtBt1Clfhve2hG1n3BEs45J9/2tOdR9AHcR9Fj7WbaGnIbxgEC2WA7Cs2KDZSTv7e+004WLsElqD/2ATYCtFDY3vzymEtaW+IgDbOFIzMz41DWZ5UNq5DbRlgwwb9gaVb3sy373kxAe8Rtork3oPNinkYUCnpK7mAEHfu4o/x1Or+S6X+tzuNkTkjt2+iB41MsYqlCer/V7yGqd4WKI4o240/N+Nvk/5gwFaFO7JsFL70yvLKZBZ5+TmnnHRwmKrJfDMZePUTJi17FAzBDMiY3BgpgfVaNsqKlN9AHtJkcLw4qH4n7SbD5PuaTSv+dZchaKYwjJMnqgfhPNf3wfCl72i1r7bc/BFcox2CuyZyAe/mSFvVrijbL4mWF891JcGHVhRuRfsR6CKG61XYe5nJ6ZA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e19128-45f1-4e25-53af-08db5dd9987f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 11:08:55.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDzVgYjhzR9fSIJQdCd0blSRX3R9WWTHVKZe4RU6ryf66qSTBjC64b0JOzKu1gQgtPCz6sw27Lw8baoeZ2T+YhIGZeOC+kk34Urkc7c3GJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7297

On 26/05/2023 12:06 pm, Andrew Cooper wrote:
> ---
>  xen/arch/x86/include/asm/cpufeature.h |  1 +
>  xen/arch/x86/spec_ctrl.c              | 50 +++++++++++++++++++++++----
>  2 files changed, 44 insertions(+), 7 deletions(-)

Sorry, please ignore this patch and look at the other patch 2, which has
a commit message.

~Andrew

