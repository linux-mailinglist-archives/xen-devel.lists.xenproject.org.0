Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B2C3C74C
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 17:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157136.1486041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2vl-0006lv-61; Thu, 06 Nov 2025 16:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157136.1486041; Thu, 06 Nov 2025 16:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2vl-0006kN-2t; Thu, 06 Nov 2025 16:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1157136;
 Thu, 06 Nov 2025 16:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oVY=5O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vH2vk-0006F5-5n
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 16:33:48 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5734fc78-bb2e-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 17:33:35 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB8929.eurprd03.prod.outlook.com (2603:10a6:20b:5e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 16:33:32 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 16:33:32 +0000
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
X-Inumbo-ID: 5734fc78-bb2e-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwUoCVZl/08I50x6U9PQyV13vt98lHQ7aC21pEBN6kNI2Q8HIEe+4SVQCiwX25O6Wqeh5Mlv3HVxfiv95eYmQGGlUNsnL23U+/ehyVmPEaym5AKV1y6agRJAROapeVy7t402MHYeld//NGD+gTGFajEn2jA6v5vs0TEbJ9mhY+I52EkGo0B/9Z36P7o6MgkcZRLExKiF79hrEgD9txayuX+6oQpWV3UGebA6SIjh0OBCxLEzLixnIXdGkU91KPW0rlDB+Alul74I2CDd6czVevoAhK+f6E0WHIYrLwkesg2kq66P9OG3ANr8swsQyVnGFAoU2OPUBCtuxo4Fm/DmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVPqj5q9UbtWaoRouyUelUFaGv0lx7vbxPctgZixcR8=;
 b=K2/4rcAy14c2bfb5EsEk9NTpeo8e+qS6PhZXArWajE7jpVxBZRvF1QxIpWLmvt5VfpMaaaHV+wS6NnhISV1GS/EdpfFIaGh5TFTdcDQSPa42qz3BMkpvNFA/APqO+/AUP32OOilyKX8+974BgWkLb9npgrZpBzRArQnhlDZOTj6tBBFOsOPAW/691MRf7elk7VJMgVb27hwpKHs/mHZeyXmsStEZhznqn85wSrC6U3qA1StOeAtBYDD6caJcs6gFV4t9u6kx02E3G9hlB8Uiirr8j1QGO4uwg/zBOiCnQNAt0dEobeCilmoVaOnd+Ci/kU5SgIQEE2wUctbWcqAAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVPqj5q9UbtWaoRouyUelUFaGv0lx7vbxPctgZixcR8=;
 b=qrNyu/zZPCHtaHSU44WtZmLHHNGUQ3P7ViSK6hKbdYl3J92xRGwx1i3cXPuNBj+j242tuEaFFuL3KCOBYjPZ9EhuQoLRXH3MbS08BMTAgO03BzOy+Ooh7UxNRL0tedkXsGA+pKlZQwmQAzR6V9eUUvyRkw6WbgGu3c0Ueg0vVcUymwdftsxoSQi/7+8/SiL6M7Ccf9CRXG6FNLbC8reF85ecM0Fh30AgdrbT2XjFIPhN4TUB3GC/y/scH1csNoSs7TAHnUcAzZMbqY9VcKw9O1OrWK0e/Se53KHzNrIAHh1PQp4S55e4U2S8+714So/yHK/fASQ87FeQ3E/+YEbtBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com>
Date: Thu, 6 Nov 2025 18:33:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
 <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS2PR03MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 2563d124-09de-4175-ba12-08de1d52394c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWRrSjM1TTRFQzdGRXdFbitabmErbXMzV1ZkQWhRRXkrMU5memJLbTdGSjlJ?=
 =?utf-8?B?MTlPenN3emE1Y1VnTGQ4bzFuUEFLc1V5RXNYaWZZekpEMXhTWVJ2ZkROR1A4?=
 =?utf-8?B?YTljR0J2eFYzVldJbWsxeGxTRkFVUkRnTGJHWjNEY1UxR1ZxZGpkdmhCMkpY?=
 =?utf-8?B?TElKVC9xOUU3RzFReXF3MEc4cTdDQmxTbkxNM21BN2NrWFVjMTE2bHB2S2Zh?=
 =?utf-8?B?ckZkb1E3WTJaa3ZURnZDU0lJblJ2K2s0QjRKU1BOcUZ4bjA2K0hFR0V5SkpB?=
 =?utf-8?B?ZDV0dk5hNTRzUlZ5Y2l1eXloUElXODAzZ3F6UCtETDAzV2xqV2FSenZLTVlZ?=
 =?utf-8?B?YjV1STRISitMQ1Y2WklTTUFCbWMyVVZWUFpNVG0wdmJ3NlBPWUJSNDd6cHZB?=
 =?utf-8?B?Y2NYSUg0SmFGdEE0alN5SVRTMkF0bzFlUFVBdkpLZ21BUDU4K09iQUYwY0lN?=
 =?utf-8?B?eWtPeGJXLzZzQ1RjV1N1a29MVmxqUnRSTE9yc0VHODZSUUI2MzJTaTZHWGpm?=
 =?utf-8?B?RnMzZWFtWmRvM1NRNkJ2Tms5UXNFNm9laFQ3SHd3OFc4d2FUNUN6ZEpXUmha?=
 =?utf-8?B?aGN6S1NaeFo3YWNmKzk0emEyN3BCRmhGdTYrM1VLN2U3WE56SGdMOWt6Yjdm?=
 =?utf-8?B?MzZFSXQ5ZVNvbWEvZnJQT3IvTVJ5UUJrZkNPaFNxbjY4OTdzUHVwOGNqRWNy?=
 =?utf-8?B?WjNDaldzU1RQOEp1cGdWY21LWVUrbWxGTWorWWZHWUFFZmZ2ZHE2Tnk3dUMr?=
 =?utf-8?B?djJ4Nk8yZzl6ck1kMGloRWIrcGdXKzdxeGlKU1ZaN0dQQ1g3OGs5ekVPVFRT?=
 =?utf-8?B?Y2VLcGd5YXJhRGxOR2N4dFJSU1F4dU5qUUphSVZ1MC9ra0FVdXBCVE04M296?=
 =?utf-8?B?d3RvVmMzWE8yRUhRYVRCRVNhcTRmb3ZNeEsyUERwS0s2QWpQSjgwUlFtd0tl?=
 =?utf-8?B?RVhjWTN3dm5SSnozV21aN0pucVRiaGgwWGpydFB3cm95Mm5OS01QWlF5L3dP?=
 =?utf-8?B?dGxIZHRWQnE3aTdyYTFoUlFveUhwY1BNVFd0ZDd6eHAzMGRYcWZxKytiOVBF?=
 =?utf-8?B?S2g1NE5ueUtIb3BUV2dkQkE1SGhFMWg5RjkvWFFhUllCeUc5emNpbTZEdFkx?=
 =?utf-8?B?MzVHWlJKb2ZkL09yUjJCQzl2UTdreHdIa1hiemphVXViQmV6ajhoeWpyMVhY?=
 =?utf-8?B?czlOU1VVYWFjbzlSOVR4ams1SUZuN3hab3AwcnVGRFNDOHo5TzlhNEpDV1Uw?=
 =?utf-8?B?cG9PUFZrNHVLOWpJaTZYc1NWMloxTllQVWx0bWxwZDEyLzZOWmVWVnBRcUhW?=
 =?utf-8?B?VlllUm9tUGd3UXhjcTFqa0h6S3VIVGZ5b2RtZmRseFR5N3pGaWJkdjVXejR1?=
 =?utf-8?B?Q2tocmp4dGZFbDRzSVM3VHcvR3hHZG1LYVhsbldMVjJ5alJ4NmtYWWNrUm5H?=
 =?utf-8?B?ZXc2MWZydysyK040dFdXTkdOOTBxajNaSy82YWl0MVMyWWpHK1ZxOTNaZm4r?=
 =?utf-8?B?Rm15QlJyNUdKaGN3dFhjSWpnVzhPZkF1cTFFb2dQTXlaa2I5Mmp4cGUxM1Nq?=
 =?utf-8?B?d3orN1podEorTVRQUll6Q1d0VE5WMkQyTjNTbEprdThxOHNYVTZsTFhPbm1O?=
 =?utf-8?B?elc2dHV2Z3RJMXNLNFNzZlB3Z2lkUWZMVnFxTWc1QTdyNmNOQ3dGQmIycUNC?=
 =?utf-8?B?T0ZpcnlZU2lGRjRGWTNGOTE5K2lhVkF5NlBpOHppVTdySFA3ZVhraVo0Q3Bw?=
 =?utf-8?B?bnN2TWZsQ0k5OHFKTGxsMVZ0Zy9YamRVa2JySjZsK2tsZlNMd1BvYzd4VU56?=
 =?utf-8?B?MFo0Z2tZdGV6b2lSZGVSTytpVGQ4UzhsS3NsVEZEUENPR2xyVmN5YlFpYm1R?=
 =?utf-8?B?aURmUEpTUWxvdFNGZVRSMmNJL1IxZGZMYy9iZ0JjcmpaU3hMaGx1cFBnaWJX?=
 =?utf-8?Q?0LVCz7aF7P8K4+x32su4IrLnrWa99AQ3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0FQMElmd3pxbnhnK3RnWFZmeHJJbFdCTHUzemlpNHpIdnIwOTdOZE9GNUI5?=
 =?utf-8?B?a2FDYlQvUnBvRXlkYitrc29CdThtV3VCckVDb1RER2FRRHFqL0h3K2pHdWJD?=
 =?utf-8?B?SzBVTUhZczJvZXpTdGh1MmFUaFdGaC9aNWRFTzQwNjhlbHJBb05ySE80N0My?=
 =?utf-8?B?aldKVVcyWWFkZzh2WDF4cXBpSjcyQlpMUVBCQVlSMmhjTno0QmI5WGs4dXBN?=
 =?utf-8?B?V0VmdmxvLzNtVEkyWWRCOUU3dThSUTN3OGQyRlI1bjJSbldKajhtbzBZTkNV?=
 =?utf-8?B?RllYVFFsQzV6bmtOWmNsMUswbUN1dXFrZ3hXNmwvTHlmQStVaVZjN2kvRk1T?=
 =?utf-8?B?L1YxanZxeXh0NGJROEhZRmtpaDA3R3RUZUdlTE9MbU8zTldJUWdtaUdzWENz?=
 =?utf-8?B?cHMrNkJlOWRuZDd0NHVoWnVtZkg5ajk5U28xVHQ2QjRtUUVnb2tia25oWGd2?=
 =?utf-8?B?dVJjQlNId2Z2QWNqMCtscHFHM2RZSElIM1FvQUl5NituazVkSzRPejZPS2NV?=
 =?utf-8?B?YTBuSTJKRmhROFNncGxaakRYWXYvdVdiNFp5aGxlOGdrT3JvdTJPdERqRkpw?=
 =?utf-8?B?eU03dk5WMUY0RW92S0x4UWRwUmJpUG9iUUg4VzcxOUVLdk5PK1BOOFpKT0ZB?=
 =?utf-8?B?ZlBSWWd3ZnVjOHU3cGx1TmRqbTltLzBXd2diM3lZZk40U0dpMVgybzUxQkda?=
 =?utf-8?B?WVdrbytZenk1Mm92Y1Fvdy9iZVNjcXo5dndHbEorQzVKTS9zdlN4dmFWZUVC?=
 =?utf-8?B?WS9OZ2R3RGNwRWpmU0ExTnl5ZkY2SlBRdTRodEdEeStJUTBVSlRKbyt2MllC?=
 =?utf-8?B?SWwwcVJhZHJhTjZWR2xBYiswZjA1RUhDVVJ4Vit5Z1hWN0liaWIzZ3EyMUk3?=
 =?utf-8?B?TURpUjMvcnR2eWRNMEpLYmVpYzhhQktjZlhhSFk2S2pIV2dmVkdNVDlkdUdI?=
 =?utf-8?B?R2NOUENsMW9LeThrN2I2UXVOckFMczlzTFVxbVRZVEZ3Z2lIRXNoa3FDU09D?=
 =?utf-8?B?VUl1SDQzNmV6WVBTcGlQeWNlc2JKd3lTV3dGTjU1c1ZNL1ZLN2Y2V0t3LzEy?=
 =?utf-8?B?QVhNbTQ0VmpRYmN2dmIvVCtqMVhPeE9HSkJVM2lUSGVkeDE5Z2FHUW5NelM5?=
 =?utf-8?B?ai9kQlRvSnk2aFVJM0piWjl0S0tFdXZ2NFJmb1lMcFh1ZytQQjkyQXFJZzFR?=
 =?utf-8?B?RWlKcDVVVnZIOG9qMHhXR0tBK2FKcUZyS21lUjJCK2RYWUVTSWN4c3d0c1Mr?=
 =?utf-8?B?R2JPR2wxaHFMZ1pYWjlTVU5xTGFDRnVoNHA3M0hiVnphczFUbWRqTDQ1cjVI?=
 =?utf-8?B?Mlh3S3dqZzhnWmYxM0V2Mm1JMVJBbWlPZ2xOMnREanNYQzdWR3dDcTVNMXdn?=
 =?utf-8?B?bitiUktycEkrSWtLeERtdHdCb1V2cnR2REZIYkVmUlZqWWZVYzJVZUs2ektl?=
 =?utf-8?B?ZmYyMzkvSldrSjl0VzI4WGhqSFZ0VzYxeXM0R0U3UVZvQlhJMFM0dEY4WmRQ?=
 =?utf-8?B?K1llRG8zcWs3Q1BrcVhPNE9JVkM4TDZ4TlJ5bk9tYkp6Y0o5U05LTGdobURs?=
 =?utf-8?B?WXp6eUVXekFsM3dXL09rZnRxc2Z6ZE44R2MyTzhEU2s3V3BiVC92a3FaMlF0?=
 =?utf-8?B?Zm1NQkRiWW80QUNScjZDRWdXWCtEK0xDQVZmUkZHT253dnRuRGRraDJ6anBT?=
 =?utf-8?B?QUVjTEh2a2dwcjErK1Y4OXpZUWppOUlxQ1I2OFZHTXQ0dlVUdGJzSTRKR0Ey?=
 =?utf-8?B?N2R1M2NqVUpFQ3pOTnYwbTdWSHpIbW5Da043Y1lOM2NCUFg5RGdGU0U5NTBR?=
 =?utf-8?B?UDJheUcvY3hQdWJmZXdCaWxWNnppcHFiMjJOR2hvTnpwQkNveENWeU5LY3VM?=
 =?utf-8?B?NlFmVUpGK1RZdlEvYWFGUkdvdldSTkdsWkxpbjRaeUNUZkVneVk0ZjM4Uk9M?=
 =?utf-8?B?SGVrTFhZUUdOWHdvbzRwRnVkaHJudHpVU005cjA2M01UcmxLYUxsbGMvbXNZ?=
 =?utf-8?B?cGUyWi84TVgvaXpNMVJkV3ZoUW96NjFvSGc3c3E5R2ZrRXFhSmlaN0xzQ0lm?=
 =?utf-8?B?N0kzUXNBbmE1aVgySFBkSzZvY0RuR1JHSTFqbVo0aHZPOHg1b2N0YlBtWGVw?=
 =?utf-8?B?WURPWGtGUGdYeHN0SlhXamhBbHBFOUpsbDNYY3oxSTNXNytxbnY2VnEzWXNO?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2563d124-09de-4175-ba12-08de1d52394c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:33:32.0284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6AIliBKX/PhR+KCdSbiV0IRo9D36dpgytNgGT1+d+c7A2TKd6WdqoncCBEjDVEuSBswhIhLQ6PF51zb1BAz5TAB3Lp8pIEOucaz8bVrwFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8929

Hi Teddy, Jan,

On 06.11.25 17:57, Teddy Astie wrote:
> Le 31/10/2025 à 22:25, Grygorii Strashko a écrit :
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Xen uses below pattern for raw_x_guest() functions:
>>
>> define raw_copy_to_guest(dst, src, len)        \
>>       (is_hvm_vcpu(current) ?                     \
>>        copy_to_user_hvm((dst), (src), (len)) :    \
>>        copy_to_guest_pv(dst, src, len))
>>
>> How this pattern is working depends on CONFIG_PV/CONFIG_HVM as:
>> - PV=y and HVM=y
>>     Proper guest access function is selected depending on domain type.
>> - PV=y and HVM=n
>>     Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>>     and compiler will optimize code and skip HVM specific part.
>> - PV=n and HVM=y
>>     Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>>     No PV specific code will be optimized by compiler.
>> - PV=n and HVM=n
>>     No guests should possible. The code will still follow PV path.
>>
>> Rework raw_x_guest() code to use required functions explicitly for each
>> combination of CONFIG_PV/CONFIG_HVM with main intention to optimize code for
>> (PV=n and HVM=y) case.
>>
>> For the case (PV=n and HVM=n) empty stubs are created which return (1)
>> indicating failure. Hence, no guests should possible in this case -
>> which means no access to guest memory  should ever happen.
>> The two calls of __raw_copy_to_guest() in common/domain.c->update_runstate_area()
>> are fixed for this case by explicitly cast the return value to void
>> (MISRA C Rule 17.7).
>>
>> Finally build arch/x86/usercopy.c only for PV=y.
>>
>> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>>     add/remove: 0/10 grow/shrink: 2/90 up/down: 163/-30932 (-30769)
>>     Total: Before=1937113, After=1906344, chg -1.59%
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>    xen/arch/x86/Makefile                   |  2 +-
>>    xen/arch/x86/include/asm/guest_access.h | 38 +++++++++++++++++++++++++
>>    xen/common/domain.c                     | 10 ++++---
>>    3 files changed, 45 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index 407571c510e1..27f131ffeb61 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -71,7 +71,7 @@ obj-y += time.o
>>    obj-y += traps-setup.o
>>    obj-y += traps.o
>>    obj-$(CONFIG_INTEL) += tsx.o
>> -obj-y += usercopy.o
>> +obj-$(CONFIG_PV) += usercopy.o
>>    obj-y += x86_emulate.o
>>    obj-$(CONFIG_TBOOT) += tboot.o
>>    obj-y += hpet.o
>> diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include/asm/guest_access.h
>> index 69716c8b41bb..36aeb89524ab 100644
>> --- a/xen/arch/x86/include/asm/guest_access.h
>> +++ b/xen/arch/x86/include/asm/guest_access.h
>> @@ -13,6 +13,7 @@
>>    #include <asm/hvm/guest_access.h>
>>    
>>    /* Raw access functions: no type checking. */
>> +#if defined(CONFIG_PV) && defined(CONFIG_HVM)
>>    #define raw_copy_to_guest(dst, src, len)        \
>>        (is_hvm_vcpu(current) ?                     \
>>         copy_to_user_hvm((dst), (src), (len)) :    \
>> @@ -34,6 +35,43 @@
>>         copy_from_user_hvm((dst), (src), (len)) :  \
>>         __copy_from_guest_pv(dst, src, len))
>>    
>> +#elif defined(CONFIG_HVM)
>> +#define raw_copy_to_guest(dst, src, len)        \
>> +     copy_to_user_hvm((dst), (src), (len))
>> +#define raw_copy_from_guest(dst, src, len)      \
>> +     copy_from_user_hvm((dst), (src), (len))
>> +#define raw_clear_guest(dst,  len)              \
>> +     clear_user_hvm((dst), (len))
>> +#define __raw_copy_to_guest(dst, src, len)      \
>> +     copy_to_user_hvm((dst), (src), (len))
>> +#define __raw_copy_from_guest(dst, src, len)    \
>> +     copy_from_user_hvm((dst), (src), (len))
>> +
>> +#elif defined(CONFIG_PV)
>> +#define raw_copy_to_guest(dst, src, len)        \
>> +     copy_to_guest_pv(dst, src, len)
>> +#define raw_copy_from_guest(dst, src, len)      \
>> +     copy_from_guest_pv(dst, src, len)
>> +#define raw_clear_guest(dst,  len)              \
>> +     clear_guest_pv(dst, len)
>> +#define __raw_copy_to_guest(dst, src, len)      \
>> +     __copy_to_guest_pv(dst, src, len)
>> +#define __raw_copy_from_guest(dst, src, len)    \
>> +     __copy_from_guest_pv(dst, src, len)
>> +
>> +#else
>> +#define raw_copy_to_guest(dst, src, len)        \
>> +        ((void)(dst), (void)(src), (void)(len), 1)
>> +#define raw_copy_from_guest(dst, src, len)      \
>> +        ((void)(dst), (void)(src), (void)(len), 1)
>> +#define raw_clear_guest(dst, len)               \
>> +        ((void)(dst), (void)(len), 1)
>> +#define __raw_copy_to_guest(dst, src, len)      \
>> +        ((void)(dst), (void)(src), (void)(len), 1)
>> +#define __raw_copy_from_guest(dst, src, len)    \
>> +        ((void)(dst), (void)(src), (void)(len), 1)
>> +#endif
>> +
>>    /*
>>     * Pre-validate a guest handle.
>>     * Allows use of faster __copy_* functions.
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 4f91316ad93e..c603edcc7d46 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1985,8 +1985,9 @@ bool update_runstate_area(struct vcpu *v)
>>    #endif
>>            guest_handle--;
>>            runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
>> +        (void)__raw_copy_to_guest(guest_handle,
>> +                                  (void *)(&runstate.state_entry_time + 1) - 1,
>> +                                  1);
>>            smp_wmb();
>>        }
>>    
>> @@ -2008,8 +2009,9 @@ bool update_runstate_area(struct vcpu *v)
>>        {
>>            runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>>            smp_wmb();
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
>> +        (void)__raw_copy_to_guest(guest_handle,
>> +                                  (void *)(&runstate.state_entry_time + 1) - 1,
>> +                                  1);
>>        }
>>    
>>        update_guest_memory_policy(v, &policy);
> 
> Alternatively, we can make all the raw_* functions `static inline` and
> have something like this which should have the same effect with much
> less redundancy.
> 
> static inline
> unsigned int raw_copy_to_user_hvm(void *to, const void *from,
>                                     unsigned int len)
> {
>       if ( IS_ENABLED(CONFIG_HVM) &&
>            (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current) )
>          copy_to_user_hvm(to, from, len);
>       else if ( IS_ENABLED(CONFIG_PV) )
>          copy_to_guest_pv(to, from, len);
	else
  	   return len;
> }

Can try.

Jan, would it be acceptable?


-- 
Best regards,
-grygorii


