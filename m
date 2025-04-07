Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC573A7E71B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940613.1340318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pcH-0000xm-Ur; Mon, 07 Apr 2025 16:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940613.1340318; Mon, 07 Apr 2025 16:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pcH-0000v5-QK; Mon, 07 Apr 2025 16:46:33 +0000
Received: by outflank-mailman (input) for mailman id 940613;
 Mon, 07 Apr 2025 16:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1pcG-0000uz-ET
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:46:32 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d60bb973-13cf-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 18:46:22 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB9590.eurprd03.prod.outlook.com
 (2603:10a6:10:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 16:46:19 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 16:46:19 +0000
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
X-Inumbo-ID: d60bb973-13cf-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ndx+LHm0/zghAaP3BcYVtZnY2U7c6U2rQyJWUQSFXUUpvNFaMYEGl+PPOF/3eYgetNf5POXw2IoHZvPCAtZoxmSRMU4LVaJ1ZdEQXRVoSH+oEgWhLm4/57hRQqrsAlvkS2mgskI4INq/jo94NT0qD3FPqGvV85cOvcuGMry+c5Nq3CnEphpZhOqDklhGbIXcH+JbbH6oR00VLqUw73C6Xtei9YFEcHF6AyE4DUcOOMtQ3R6ELUebAn9tIuPANiVFhaIrh1JUflVCGn0yda8GXNrDaYpq1tNsChFbmYSW/wlF63s4e+SiYxVjrpmKTkPKszG+dRU2aWF2ErrqayLrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+EJilJ78PZwuNmgGiAes0CZGmVXgRwE+jV/ppxayRQ=;
 b=lsR9KtPev2Dt69eT8AypGbJCJbgGdF+6u7jAHePZOmRgGV+inw3pQIkKXKc/I886mNo6JHVFIClxC0cELMJUqBZOejhRGnCl9XP7HvDhwRuwl5Tr13KeMWJagzU6K0Ay4oh5HYB5cMnqa4XTl/eTOnEGoCbNAh8KfwciDisHfKHdQ92JkaWZ4CLuJXsqTPEGgpSjUcTNsUUavfME8jRzGFwa6OpR7ATqjSxs9JRd+bArcApBNx8qg7HgaQY+MmLG4/x7aMdvCxT7qCuLnC6f2PuoKNyViCR1sqt21Z1mE4UYbMuZCPaO/22UNQvkfpayqzRgpGACoqikT6WJcbewdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+EJilJ78PZwuNmgGiAes0CZGmVXgRwE+jV/ppxayRQ=;
 b=CUrMvxtwhVBcU+ukImcGflE1NoEr6GNIxqaXpfwTMtyFqPot0/1CdnrGwRUr3DfJ8CmJAzEFEGSMIXjIfAIaY864liopag+sYh2+sELXGvgqHF6ubYrkQUatPqEvM9O1md+f7uHAS1knuWJjlF4apRRSUK1M66oPuaHf09Emv8mDoLrVfivclsS9VKCNJAxTXJVUX2GZZxLAOzXdY8Y/OvBwTHDqdwYcYsmMUs5QTfPrEUvi7C4m05Aqz1NOh25/2BgsCb49sRKXQooCW2ucJfch4MyBVKfPUEoUoKe6DOMRceMDgiQIi1IplKaCoDM0TwFC/8EVQxJ+J2eMu+6daQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/2] Enable MC/DC support for GCC/GCOV
Thread-Topic: [PATCH v4 0/2] Enable MC/DC support for GCC/GCOV
Thread-Index: AQHbp9yWGdOlaD6DSkiV7Tp26KtCBA==
Date: Mon, 7 Apr 2025 16:46:19 +0000
Message-ID: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB9590:EE_
x-ms-office365-filtering-correlation-id: 14295405-d703-4284-3304-08dd75f3b8b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RjZmeVpXTlpFbnRWUWxSMDlpTzZpOFZxRHl2d3JGOEFxVnZOY3ErZ092dnpO?=
 =?utf-8?B?UmRDdlNwVVRkWW1SenRselhzbWVieWFsVis1UjkwU25mMXZtdlFGTGxNaHcw?=
 =?utf-8?B?SmxXeGlGUkxuNnpDaExmc1ExQmF0UEp4STcvNXM5MHAxRmY5Nk54Si9WTzJ0?=
 =?utf-8?B?a3lyVEV6cWtPWHJHRFJ3dUQ0NVBMWThOL2dDbHQzSHB2cXJSZ29EcSt1SWpV?=
 =?utf-8?B?VzBJZjhCaytTVDJqYUQydzBuV1RrK2RuZ25lTVpnbzJPQi9MUUFLZm04d3pM?=
 =?utf-8?B?ZUtXTE9iM0RGMDkxZ0tuaHJlQ2RtbENzTFZjQkYvL0I2M2lXaGplQm1YUXlu?=
 =?utf-8?B?WHdjdFpLUXdqMU9wSVJaWVJJcEZuQzRGdFZ1dmtTVU1ORUQyWURUcFJLRkEz?=
 =?utf-8?B?OU5RWmZ3Nk5lMWhDSVQ1OFRpMFVUSURhY3VubitETWRaWW1HSno1RzVLbzYv?=
 =?utf-8?B?ckl2RE82cDJIVU9rWmRyeXdPTDlUT1ZEK2xVWFUzNVcyZk1wUlNPUDhvWVI0?=
 =?utf-8?B?bjk5blc1TGIxMkdBUGJYY0lXaFBnYndvOWxQb25VNnkzM3pGYlhjWWwxRE9B?=
 =?utf-8?B?SHAzZFlDN1FieVlGVEdBcEYrWmlXS3BQek5mN1NrSVRRcW9WamgyaXV3dEZB?=
 =?utf-8?B?TFdIaFRkbHlHRS8ya3I0RDZnaG44L2tRS3gvSEZPbEkxWWJVWTh4aWJSdDN1?=
 =?utf-8?B?VDdkMHVRRTRGMU9Ld1lFREVMWnFvcGo2MlpDRmRmVVk1Q1hNcU1vQXh0M2Z3?=
 =?utf-8?B?WUtVZlpzSlRJY0MzQU1vMGJKNFJZU0J5ZHFwQ2dEWlYrejdmOGlIZll0aUtq?=
 =?utf-8?B?RDBhRjZOZlVpRmdLZVJGSjQ3dWs1NzFUM2ZwKzYyWjNLditMTloxdERhZUwx?=
 =?utf-8?B?NDZDWUxQMXUyNENId1NyL1lWTWIrVFY5M3Iwd2xiY1JVU05na09ZV3RodWpY?=
 =?utf-8?B?Um1hYkgxTHhrTkRLQkVPM2JXZVVmWDZjMmc2WGd3aGNSRnRaL2pOQjhZbHJ0?=
 =?utf-8?B?ZEZVamw3QVVUb3MvT09QekpmaTdPTW5GYW5hejkxQXpDR0YvUHpJWDFVM2FC?=
 =?utf-8?B?RTFFbWd0M3BKSWF2N0RtR0t1UERZVmlCc1BwS0hXQWxnMHA4dUEwTGlGcVZS?=
 =?utf-8?B?ZExpUkJCT3d5RlRwSHc4ZVYrY3JTVDZKWFJLVlVwVWNRdEgwRXY1dW5WbTIr?=
 =?utf-8?B?RW5tenpBdmhsaDVuQ2lpZFMxbldMR2Z4OWo4Z1A0NHZMM0Z4ekViTFkvb0Nn?=
 =?utf-8?B?eklLcnkwS3lZeWdOLzArUnJGOU1QTnczVGtGNXN4aGcyd3Z5Yy9URjBLVWlj?=
 =?utf-8?B?TE9JdkU1UkxDa21pT1BEUXJlU3pqa2J2TC9UMFpydGVoWHJES0VQbW9ocjE0?=
 =?utf-8?B?TkUxRTlHY0ZmMytSZnlGb1RKby9Wa0tVQlBtNGMyYXJXZmxraDV0WDBoRXBP?=
 =?utf-8?B?R3NpdFlqK29YVGRYL0sxMDdZSjdlSXMrdjV3R3h4bUJ0SEZzbHZ6dDJaaUNi?=
 =?utf-8?B?UWwzZmJrRitZZDRLczlOSDFxVDVNMHNVL0x4QmpRYTgvTzBrWGE5K3g1Vmdt?=
 =?utf-8?B?Z0xKZ0xhMmVEQ0xMN2N0TmpBU1lxeDJNQjRwUlFBOEtYRkcrc2lDODhxRlJB?=
 =?utf-8?B?UVJaejhwTHBvZFh6bThpdFJGOTVyek56dHhRK2N1SWpPYVFoUHA2djNFNHNi?=
 =?utf-8?B?dEMyZllKTm14OWxCYWJpczU0S255RWQ1a3A4K2l1K0xoYldzeW9XZkhGdkpD?=
 =?utf-8?B?OGwzVSs4dzN6K3gwV0dzZkJqYXRPclYzemxyQ2JBWFJRWmVIYXp5UW0xWDdL?=
 =?utf-8?B?S1ZKMUZXd3dYa0RQUFg0UlZxeStFOGg2a0lvS1Zmd1ZsTzdtTUlTTXhLdVFt?=
 =?utf-8?B?T2dnRjQ5OFg0N2l4Y1F2NmVIeUMyYWpEZk13cndrbGxZUFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0gxa0VmaFJBc0p2VFM1YUNEby9qNnoyWkVhQWlQdGhtaSswdWxtdjVicjVm?=
 =?utf-8?B?M3c0cFVWRjRQK09SZzFXaGJQZ0F0QTlaR2wxRjhWOVl1NWhTZFBKclZnWG1M?=
 =?utf-8?B?STVhNUhOUHgyWGR1U0hEYXV5ektOeWFZT0MzVW82SFVUVm5maC9QNVRHN2dO?=
 =?utf-8?B?dnc1YWxiUWFRZjZneEE4SlpRMGpFcmQwZm0xZU1FRTdxclJDM08vU3ZGdS8v?=
 =?utf-8?B?SVJ4QkFCdjRJc211ZDBIK0lEY09KR0Fza3FET3NUb1dKaG1LNkRQUUJUK05D?=
 =?utf-8?B?d2loVU9ZNUcwZVhaNG5KRmJPUk10a2VYeEd1T1JqZ0RPMFpaVXA1Ymo0MHhX?=
 =?utf-8?B?L0hzTmw4Z3ZGZDRPZWdaWVJMQmJlaFJuRGJKMm0rV1g1VWtJR1Z6YmZ1UTBW?=
 =?utf-8?B?T0RySzFKOE1wRUVsbnRlazRxc1lac0hUUHNsUVdlYXkvRndTcFp4M0RNZWtY?=
 =?utf-8?B?YlhOMmtOZlZMb29aMno2SlhiYlowOXROcTY5YTlrU3FrYURHb1lIajQzT2dV?=
 =?utf-8?B?djVtTkJFOEpYQit0ejVJdFYwaDBpZXc4Tk1GL1hrOVZwRzRqbFpjS28rVC81?=
 =?utf-8?B?cGEvendEQkp3d25aajJheTJKUHJweU81LzFZY2xDN2VPTU1ER3FIVzEyVmZW?=
 =?utf-8?B?a0dxcXJ1ckhLZzRnZ0U4cHVJU1A2L3BaK29hSlVvY3RadzdTa0k3MU53OFl5?=
 =?utf-8?B?Ymw1Ty9FSFZya0JyMVRYZmNzU2V3ZjcyTHFCTktxSE9mcVA0Z09PdzdLd00w?=
 =?utf-8?B?WTAyZTJET2Q2VmJCVTl4MTZ2R2w4M1FEMHlOK0E4OGdDYXgrVm5oUlJ0RVdh?=
 =?utf-8?B?TTNUZGtUY1dmalV1M1plenk1OEppY0hvZHdtUVc1UU5ha2ZzVzEwT0t3NVB3?=
 =?utf-8?B?Vy9zWTZpRTdSTVUzZHZ6YnYwc0xWVDdFcUpMNURuNWkvOVhMbWtPWW5EQTNa?=
 =?utf-8?B?RS9RYWdZODA2YnhVVXlNcGk1TTZ2ek83QkMyK0RYQ1Q5ZVg0KzJjcXZmNUlw?=
 =?utf-8?B?S1pFWWdHNFNJNm9LVTRhSEEvZDBoakFEMVByMVpJKzZZUzJ2YTJsenI2b21O?=
 =?utf-8?B?QkVwVnFObHlvVmlTTHhrSFR0SERIVUMrVncrZFNkMDgwcG9iNjNJZ1JIZmJw?=
 =?utf-8?B?blcwRHJaSzVaNGFSVlVBdVRUbjlIc2xOZk1ibWt2SVVQSTBkbkpiMWNqbjBG?=
 =?utf-8?B?SkxhVVNDa2pIUjVQZ2piVUU0OUIwa3dOY0hYOXhnYWpBb0Y4Ynp0T3M5ZEk5?=
 =?utf-8?B?R1FiWFhQVG9Yd0Y2Y1d1ZmJzOGZwTGE2LzJmN2xVQXlMWVVPQWE2MHA2bVZ3?=
 =?utf-8?B?YUVaaGcrVHBnM2FOZW5qa3hQd0dRRnZISW5yRlppTis2c29YVjVpZWN4T0Jp?=
 =?utf-8?B?clpzTk5KNlZJZ2tWT3Jack5kMmJjYnFNU2w3KzRFcWRzK2w4YWZYVEtoN1M0?=
 =?utf-8?B?dVhURkxnVGtOSFA4dUkwdU9ac1ZYZzQrdUZITkJsTlp4SFRxcTVQZUdWK2VD?=
 =?utf-8?B?UTQ0UTdhOC9JK1dNTHlvS0d4OHZyVlhzQ2xmUldLcEJQU2FXTElVTUQ4blVy?=
 =?utf-8?B?Y0wyZHNzcmVnNHFpYksyZ0NYdm1hY0o1UXVTTWNwNEtTQlMvMkw1aCtXMmd3?=
 =?utf-8?B?cXNPNmxsRGMyWmpYZFNCaW8zcllURE1kbnkzRXU5KzR1YVZYZ05UQ0w5SmhU?=
 =?utf-8?B?dWVjVWxpRUozZDN4RGJWenEydTZqcUl6M1I0V0NXSUtqamg1M1VqZFhqNHgx?=
 =?utf-8?B?TjhkNUtRa0VxaHQxSWNxM0ZXMkhRUDZad0ZydGtxTHRwTWd1NjZxZnBOa0s0?=
 =?utf-8?B?TSsyUnc0SHVNblEzVTJCQnRWZDFGWENoem5pZy9GeSsxaFdjVEF6TFBFZ3d2?=
 =?utf-8?B?eGNKNk1kVmovbXQxU2hNMGVFSTRGOTJIWVcwNnAzSTAzUmFZd1dFMVVLY3Zk?=
 =?utf-8?B?Qmg4VXJjSEY5QjNITkFPVEpCNVBYTDhNNDQ1cFM2Y0drVTFVY2w2cW1DWUJG?=
 =?utf-8?B?NXJ1cGh1QmQ1SHc2aG8wRXFuektiYlFTaXNYMGYzTEFhTlhsV21ES1FmMlV6?=
 =?utf-8?B?N2FiQ0xzSFd2TWE3QlJ3ODVmMG94Y1pEK0Zrekh0RG1mK0pESmlKSVJSL2FX?=
 =?utf-8?B?QUpnTnFFcm8wd1E1ZlZvdWUwc0xzUzFLbmVvM3RsVUFzOGpKVDFXUzViVDRx?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41DED93F77E0C942A9444D73545042ED@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14295405-d703-4284-3304-08dd75f3b8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 16:46:19.2437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkfoakBQYU8U3zzjxVBt96MIJX6/fpDGJUJE0d5jYL3pbY/eXzJPWJirPtHxwx4Fhf6uwuV5nCMEKDKt12v32iqVQGOpL1DzxLqsiSx+X84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9590

VGhpcyBzZXJpZXMgZW5hYmxlcyBNQy9EQyBmb3IgWGVuIHdoZW4gYnVpbGRpbmcgd2l0aCBHQ0Mu
DQoNCkNvbmRpdGlvbiBjb3ZlcmFnZSwgYWxzbyBrbm93biBhcyBNQy9EQyAobW9kaWZpZWQgY29u
ZGl0aW9uL2RlY2lzaW9uDQpjb3ZlcmFnZSkgaXMgYSBjb3ZlcmFnZSBtZXRyaWMgdGhhdCB0cmFj
a3Mgc2VwYXJhdGUgb3V0Y29tZXMgaW4NCmJvb2xlYW4gZXhwcmVzc2lvbnMuIFRoaXMgbWV0cmlj
IGlzIHVzZWQgaW4gY3JpdGljYWwgc29mdHdhcmUNCmNvbXBvbmVudHMsIHNvIGl0IG5hdHVyYWwg
dG8gY29sbGVjdCBpdCBmb3IgWGVuLg0KDQpGaXJzdCBwYXRjaCBpbiB0aGUgc2VyaWVzICgieGVu
OiB4ODY6IGlycTogaW5pdGlhbGl6ZSBpcnEgZGVzYyBpbg0KY3JlYXRlX2lycSgpIikgZGVhbHMg
d2l0aCB1bmV4cGVjdGVkIEdDQyBpc3N1ZSwgd2hpY2ggaXMgbm90IGV4YWN0bHkNCnJlbGF0ZWQg
dG8gdGhlIGNvZGUgY292ZXJhZ2UsIGFzIGl0IGNhbiBiZSByZXByb2R1Y2VkIGp1c3Qgd2l0aCAt
T2cNCm9wdGltaXphdGlvbiBsZXZlbC4gSSBoYXZlIG9wZW5lZCB0aGUgYnVnIGhlcmU6DQoNCmh0
dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTExOTY2NQ0KDQpUaGlz
IHNlcmllcyBzdXBwb3J0IG9ubHkgR0NDLCBhbHRob3VnaCBDbGFuZywgc3RhcnRpbmcgd2l0aCBj
bGFuZyAxOC4NCnN1cHBvcnRzIHNpbWlsYXIgZmVhdHVyZS4gQnV0IENsYW5nIDE4IHVzZXMgcmF3
IHByb2ZpbGluZyBmb3JtYXQNCnZlcnNpb24gMTAsIHdoaWxlIFhlbiBzdXBwb3J0cyBvbmx5IHZl
cnNpb24gNCwgYW5kIHRoZXJlIGFyZSBxdWl0ZQ0Kc3Vic3RhbnRpYWwgY2hhbmdlcyBpbiBoZWFk
ZXJzIGFuZCBzdHJ1Y3R1cmVzLCBzbyBhZGRpbmcgbmV3IHZlcnNpb24NCmZvcm1hdCBpcyBub24t
dHJpdmlhbC4gQWxzbywgWGVuIGJ1aWx0IGZvciBhYXJjaDY0IHdpdGggY2xhbmcgMTkuMS4xNw0K
YW5kIGNvZGUgY292ZXJhZ2UgZW5hYmxlZCwgY29tcGxldGVseSBoYW5ncyB1cCBkdXJpbmcgYm9v
dCwgc28gdGhlcmUNCmlzIGNsZWFybHkgbW9yZSB3b3JrIHJlcXVpcmVkLg0KDQpBbm90aGVyIHBy
b2JsZW0gd2l0aCBjbGFuZy1iYXNlZCBNQy9EQyBzdXBwb3J0IGlzIHRoYXQgaXQgaGFzIG11bHRp
cGxlDQppc3N1ZXMgd2hpY2ggd2lsbCBwcmV2ZW50IHVzZSBpdCBpbiBhIG1lYW5pbmdmdWxsIHdh
eToNCg0KaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcz9xPWlzJTNB
aXNzdWUlMjBzdGF0ZSUzQW9wZW4lMjBNQyUyRkRDDQoNCkJ1dCBhdCBsZWFzdCB3ZSBjYW4gaGF2
ZSBNQy9EQyB3aXRoIEdDQy9HQ09WLg0KDQpDaGFuZ2VzIGluIHY0Og0KIC0gb25lIHBhdGNoIGxl
c3MsIGFzICJ4ZW46IGdjb3Y6IGFkZCBzdXBwb3J0IGZvciBnY2MgMTQiIGlzIG1lcmdlZCBhbHJl
YWR5DQogLSByZXdvcmtlZCBpcnEuYyBmaXggYmFjayB0byBvcmlnaW5hbCBzdGF0ZSAoYnV0IHdp
dGggYSBjb21tZW50IHRoaXMgdGltZSkNCiAtIG9wZW5lZCBhIEdDQyBidWcNCiAtIG1ha2UgQ09W
X0ZMQUdTIC0+IGNvdi1mbGFncy15IGNvbnZlcnRpb24gYXMgcGFydCBvZiB0aGUgc2Vjb25kIHBh
dGNoDQoNCkNoYW5nZXMgaW4gdjM6DQogLSBDaGVjayBpZiBnY2MgYWNjZXB0cyAtZmNvbmRpdGlv
bi1jb3ZlcmFnZQ0KIC0gQ2xhcmlmeSB3aHkgd2UgdXNlIGRvIHsgfSBsb29wDQogLSBBZGQgSmFu
J3MgUi1iIHRhZyBmb3IgUEFUQ0ggMS8zDQoNCkNoYW5nZXMgaW4gdjI6DQogLSBDaGVjayBmb3Ig
Z2NjIDE0LCBub3QgZ2NjIDE0LjENCiAtIFJld29ya2VkIGlycS5jIHBhdGNoDQoNCg0KDQpWb2xv
ZHlteXIgQmFiY2h1ayAoMik6DQogIHhlbjogeDg2OiBpcnE6IGluaXRpYWxpemUgaXJxIGRlc2Mg
aW4gY3JlYXRlX2lycSgpDQogIHhlbjogZGVidWc6IGdjb3Y6IGFkZCBjb25kaXRpb24gY292ZXJh
Z2Ugc3VwcG9ydA0KDQogeGVuL0tjb25maWcgICAgICAgIHwgIDQgKysrKw0KIHhlbi9LY29uZmln
LmRlYnVnICB8ICA5ICsrKysrKysrKw0KIHhlbi9SdWxlcy5tayAgICAgICB8IDE0ICsrKysrKyst
LS0tLS0tDQogeGVuL2FyY2gveDg2L2lycS5jIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQoNCi0tIA0KMi40OC4xDQo=

