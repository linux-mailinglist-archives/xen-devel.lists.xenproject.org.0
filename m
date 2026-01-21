Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN5gFRwOcWlEcgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:34:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989935A99F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210080.1521910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vic5b-00051o-6d; Wed, 21 Jan 2026 17:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210080.1521910; Wed, 21 Jan 2026 17:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vic5b-0004zW-41; Wed, 21 Jan 2026 17:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1210080;
 Wed, 21 Jan 2026 17:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vic5Z-0004zK-FY
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:33:53 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 594e98c9-f6ef-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 18:33:51 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5579.namprd03.prod.outlook.com (2603:10b6:806:b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 17:33:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 17:33:48 +0000
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
X-Inumbo-ID: 594e98c9-f6ef-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLM2V7Z+rej+B/ebLn6K/ZJdMhWWqLOaKcjlAsXXwjmqnpVhF0ANl6VlXmr9nHZExqJAybnKKx6k6ZuHxgnCL1MGAFX8TBZIim9XXZAwa+lm2qEJZc3fMfEmFQaBupiLKlHfGyLubkQoN1g2M1cWaJOQ7NijU5faoOK3agY3oyneVaR2iPqmVZcFK1gziQl+RHz8ByBMCOddj6qoUiVdnIDi3eDES4LoSstqVyrS2oNvCoj1pRE+JTvgoyFZ15861S4PeEZPsLUUzpvxl0x8ESieCc46mGEkPVUoBCNp47yoavYxD3T3pdI77Bb6a3Z7FXNARFhB7uml70usCkSDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mlf0EoKlcLPA4FV/FDAgNfurSltHR/Tz60fc3BYg4Y=;
 b=mkI41il5Ogw5GwLWJu+FyOg+vOgGkv2oLXaftJm9InCsqe0iF7f9LIAbXB5DjH1PY0/My1KxjMTBCUXRfHsrJvBouGON0lwTLWSjIMIMApccfQ1aw34UZBMVY1giMewp4nNU5vwqujAr7aXlBsZj+oOnl70UVL9LgPudHzUlSQ33x+OJCMNKQzbC2tfn7cY8hi5hOmZ7o9VjZidoIhi9lEqiK4Hezek1BK3+haeqhAecs5AVrlM3J2xItorCgP4nhtfs8wE6h/FqUfFInYQ3P/hirqmxCCao78WULZN4k3vuGx2949F6B66XAkgMqdTo6CBjj17ABYAfUfmfHHca3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mlf0EoKlcLPA4FV/FDAgNfurSltHR/Tz60fc3BYg4Y=;
 b=Hn39StSSAo8UrMSo0WKuyslgKq3EfmWFG8mJx43wDnDYkfqR6Py78++mr3Jfz2Yz8K17VSdbkXOTbgy/L4b9Ua+c5+bo+4XYmW5cMIpR1p7NKErZBh9g7nT7/l6fIiNUh4a07GudbMiZBV0srWgaHRI6cw8Y8SjcY7VEa7L3yGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d9d3a0ed-f101-4be0-90dd-fb1bcc051272@citrix.com>
Date: Wed, 21 Jan 2026 17:33:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] x86/svm: Add infrastructure for Bus Lock Threshold
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
 <20260121142857.39069-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260121142857.39069-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: 18adff49-8fd1-4b13-8b4b-08de59133c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnZoSDlZL1RVdEVvbmE2MVB2VGlNK3VVWTU5U1FIMGh5RjRZTkFhRmdWSHk2?=
 =?utf-8?B?ZXdjOG9adW02WUd2ZExxZkp3aTd5ZFVibStBODJheENkOHovK3dMM3FxT2Rj?=
 =?utf-8?B?bldkODFJM2x6Rno0bS9CMDVPbjR4dnRGbU1DM1hKR3lyaWRFeEcxU2Yrc2Zw?=
 =?utf-8?B?dTdaVUN4amJWNTFxbnJvbU9ma21nWkE0NkRJTk1YamxkWUVwNytWc0ZJd2cr?=
 =?utf-8?B?c3cxdEt0REhGenFrZ0RldFpxWERvQTJZUU1yVHg3M0FCWGN1NmlXU3VuV1NS?=
 =?utf-8?B?d0tVQzNJUUVFM3JGYlRNVCtjOUljaXYxWTNNNElMTG0zTzljdFA0TjZUQTlE?=
 =?utf-8?B?KzBLZ1VJYmt2V2hKUzFPSFhiM1grRFV2KzFOQWx5UGJ6emJFK2FYbXRMaENn?=
 =?utf-8?B?RnRxTDhaZ2lZV2tJRWVOUVJJM2txS0NBOTVsUldTaTB6eUQwc0oyaW9CclBT?=
 =?utf-8?B?NUtwNjg2Z0VCakJPMjg3YmlqUTdhb2VGb21BaFZVOEFpT0ZJV1gydmxISWxP?=
 =?utf-8?B?d2NNd1VhaDJNekVITGYrcHFyR1NLOHMvTWNoRUVyVnkrb0xDaU8zS3pnZXMw?=
 =?utf-8?B?ZUxZT0U1aC9zbHpzNm5SOFFuRkdXc1Z4dDR2bERnL2kxanRjWHFMV0lsdEsw?=
 =?utf-8?B?V08rNHZpcDVZT20xSUxWbS9BVXcyMnpiWVE2eEFjcGQ3cFQ1c2hEZXhsd2Ex?=
 =?utf-8?B?UmhvUFVRRENaOW42eWJUb2pXM05RRHVpVWpWTmxMZ2RRUFVXOHg0enJ6QURY?=
 =?utf-8?B?QTVnVVFQUjNzYnFBRExBR01WalRzdXlRUjFvU05kUXRYZU5NZWwwd1RhSmlt?=
 =?utf-8?B?RFFkT21ycDJkZE5Uc3FXTGZhcXRDVU94bVpJYTlUN28rNTYxWTlVWGFZWmpj?=
 =?utf-8?B?TEM4eEYxNE94VmNwdDlqdldhM3FDRFo0OUdoMVREdGpEaUlJaS9pWUxuMW5J?=
 =?utf-8?B?b0hnbm1DWXlYcW1KOHZkSFN0dlJIeENIKzh2WjhBR3cyVFJqd0RmMjBobFpZ?=
 =?utf-8?B?cHhVck9pb0VPUVJuV21RNW9LUDAvUDdGZ1h3RXM3RTB1TUU0VlZ6Y0Fxb3lP?=
 =?utf-8?B?YkV5ZXdlRkY4TllDN1c5cnV2eC85Z2hBL0ZGRzVrQ0V6THNUVlBVSlA0Zkdk?=
 =?utf-8?B?RmZOUjNSZ3BrUUZHN05ncTNTLzcwTzdHbW5OajUvckx2cHUrS0F0dDN1NXFQ?=
 =?utf-8?B?YlQ2WDMxSG5uR3FZcnFvdE5ySnVkZXp6c3MxdENlSEVPTTdxYzNUMCtJcGIx?=
 =?utf-8?B?RkEzdnlZYS9YVXd2RkVXbytOSkQ4RTgyRGFja1M4UStJMUxzblFaTlRWcFpl?=
 =?utf-8?B?Sjl4eGpndklsZzA2cFhqYmlGQ1ZMQ3NVYUJvemozSVFrUFIwekhlbjZka0Jx?=
 =?utf-8?B?NFRyWlNyT2lxd2prTkUvaEJjeEpZZzgxY09FMEVXZzhmZTFPbnp2WWlGbVhS?=
 =?utf-8?B?Y2lRNXBKRW1TR2FuQWdWanJiMTBwR1ZhcTVkMXpkVzFPRVNTYnFrMHV5ZVox?=
 =?utf-8?B?WFJMNEVvMkVpQUtnYWtQNWZtUkRzOE1Wb2dIbHlyZldVcnc1c0RZN0p6cGxY?=
 =?utf-8?B?ampodlgzeE0vaHMxSldHeEduUmtjN003T2t2aUdQS2M1TnpydzNhOVhoc0RK?=
 =?utf-8?B?L2t3TXRpeWhTN1I2T3hLaUkxeEY0bnJEVFE2UWx6elVTeFd2blQ2bkc4c014?=
 =?utf-8?B?bStra2FUQW1TVm9IdHF1UUQxQUcxRU5neERwTHdkK2RQVFJESFRZMmVyZHhp?=
 =?utf-8?B?Zm9mTEZIM2dleTBxNm0wSlh1cFF2bHFUVGsyR25ENkoxQ1lBVFFYemZRdjdB?=
 =?utf-8?B?MndQSGNnRnd2Y2lGajNYTDZGVFdsNDFRUnd4S0pQT2JWOGI4dHdyZVF4WjVi?=
 =?utf-8?B?a3R2alg5VmRMWUVuTlg4VWVqVVdwdURXaFlPTUdYbXZSM3ZrU2xlT0YrS29Q?=
 =?utf-8?B?YkRPRVZob2hoc1BwSmFRdGNVLzJCMFdoNnY5dG10SWdaNE84RS9mZkU2SkNG?=
 =?utf-8?B?N3dNTUpWd1RLdkJYNThGVFJDdnV5ekdMSmU3ejVOTjdjY0RocnlMdURjc3hN?=
 =?utf-8?B?b21Ed1h3N3hMOHl6VkgrMFI3RlFXU3FCdHpZSTFlSGY4RW9LY2wxc3d1M3Jy?=
 =?utf-8?Q?oMsI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejJ0QnVnYXdpY1VUdUR3am0xdVp2MXZONHdCNWFyQ0xOa25UcFAybUdjbzgr?=
 =?utf-8?B?ZWRFNkpraVNrRjRuUVhFcituMW8zMlR5WjdGOG12b0hRdUlFUnJjVnllbkV1?=
 =?utf-8?B?TjllZExCRnA0SWhqTXRlZisrVFVlSjlJQkV0amRrZkRRODk4UHlUdjJYVGRo?=
 =?utf-8?B?bGYvT1RHT0oyNmQ0MHVReEhLTUcxUXl0OW9DakVYZGRYS1FOeW41WTNKQk90?=
 =?utf-8?B?Nk5YU3cxY09GOUlCNjNYdGZhVEU4YWh0Z2NpV0tmLzdqb2p2QWVUYWpkOE9r?=
 =?utf-8?B?eFJuUnRkVVlMOXJhMTV6NDA2VlBvdmpQMzFBUHlEYzRMQXFBOUMyWTNjS1V3?=
 =?utf-8?B?RlhVTTMzTzJHdGZhbUFhUTJyWmFmckwxWGhtK1kwTkw4c3pGc3ZOUGlDS3JV?=
 =?utf-8?B?ZnRYUGc1aXN0RGs1cUxmb21jbGlCVnVyYmhuaHBEY0ZwaU1VeDYxeER1WEg5?=
 =?utf-8?B?UnVidDFEb0FWN0Y5ZVpzNHBrN2JMZCtWYXlhT2x2N2o3c2FCcHJmZDJ3U2dn?=
 =?utf-8?B?ZmVPOXFDMmZpZzV1cGRZRUZIYmErd2FZL0x0YVJ5c2ZPeHNoRVNnSE1jN1Rv?=
 =?utf-8?B?YXRzcXlrTHArYzV2Rlk4bmp4WXdYb28wM1ZWNDE3OFFMa0NlOUI0aW9zc3dD?=
 =?utf-8?B?akZqQWc2MUdwNnlTUHEzOVlVRzJTemFZYXlzUGtpd1BmNmxNT0tlNlk3cjlW?=
 =?utf-8?B?S0JRSkZJZnFsd2tkNEpmU1hDaUgrT3RVYnNheXdOODkvV2NKWnVSMlVHQTFl?=
 =?utf-8?B?RGV1ZUZHUXNzUHZTK25uNXR1emhnVzlDMEN1ZCt5THNTZWNJVnN6MGV3R2pM?=
 =?utf-8?B?Q0k3UHBNSW50WFlPeWVFeWluWms4WGdudTN3RXRLa3hTSldXMStVdUJsOHNo?=
 =?utf-8?B?ZmcwQVV0NEJKSlJIS3VlZlRoMkJHWXVIWGM3NXNvbUlLd0lCbng5WnY0NGhP?=
 =?utf-8?B?bnFLV3NCQjd1NVNBcnlZc0x5TC9vTU9iY2xiY0Y2OGhpMGphK0tVanVEMUEy?=
 =?utf-8?B?OXdVRHdNSDQ1TDRxNlQwZmhNMVBZWjNUcDlkdkI0S3Izb1hoRjJuZDNOOFNK?=
 =?utf-8?B?Q0FnQ1NycmVCdEhybW1qakJKbkFKdlg4WTFod0RYaTZYYWRqamd1RjJ6MElC?=
 =?utf-8?B?WDhpSk03WExkY3lFUzF6RXA0cG5TRVhDVkEwclRONmRWcFZtL1JuWHovR3BX?=
 =?utf-8?B?TmlGQXdPZWdSdXlNWExjTkJiS1RSSXhIV3MveGN5Zkd3S1FyaUFFNSs2WThM?=
 =?utf-8?B?TGFMdVVkRk9VYjQwL2NUQ1lrUHBrSDFaQWtwcmlxWHppVkNkZ3Vid3dRbG43?=
 =?utf-8?B?UTh4WHhjRlZVeVlmVkVVbkNMdUhDbFRkNDNpckc5V3RrMklBZWU3dW96UGNE?=
 =?utf-8?B?VWF1V2E3Mnh3MXcxdkFtTURRYWN3eE9UcEpWcUN4TTc1ZS8yaVpzMi9MeTRr?=
 =?utf-8?B?QldMa0xURmYxYlBUWHgvdkJWTmJoR2dBT2dJemhreHh4bXdZRG95enN0ZXgx?=
 =?utf-8?B?Nmt5ampNMHZ4RlgrUHluVUtJWFhFWkxoaHU3K1pHdmJOejlkbHZ3aGNUbDcy?=
 =?utf-8?B?cUIrT3YvOWVUU3M3a2dwWlVBTnY0dTlsU1NLOFNONDhUZllmQzgrSmNGNVBD?=
 =?utf-8?B?ejQwZGpKMGpFZ2VQZWw5RHFEc2s2L0hPTlBZWXJpU0RhMUhwT1p6aGtmb3Ri?=
 =?utf-8?B?bndvVUpUMmNsVUZnbDdHaURWanJQV0J4U3VSVFQzeFpLRGlwNU9QaFNjRzNr?=
 =?utf-8?B?ZTh1WXNMZVZwN0pLWGYwNkF1VERMK2xsWXo2cDBxYlRHNlQwYmxqVjFVSkhX?=
 =?utf-8?B?SHRSOXo3MitzTEcyTzNCQXNod2F6Ykp0Wnh1aWR3R0U1SG1ORys0Tklud1VM?=
 =?utf-8?B?ZXY5UG5SZkE5NHBJUmRiQ09zaU5mTHBlWGtFTmxmVHFScWtrRXg4UHZ3bFZZ?=
 =?utf-8?B?UmlZZFpHd0VsUGRFSWQ2S09MVGovVy9XT1JYSlpmb2gzU1IwK1dHOXV5YW5U?=
 =?utf-8?B?Y3FQcTIvV01DLzVvcFdwNG5teWZTYXhjNk1GbTVYVWdJTWxoRStyQytiSHlL?=
 =?utf-8?B?RlN1WUUxT0wrcThMVDVmak5lU3JwVUprZkExRmtPN3JkTE8yYXp4Vjc4ZzNu?=
 =?utf-8?B?RWN6aVN0ZTlZbks5dHNDUEYxeFZEbkdGNFRzZFRrbFZVNVpMbTNmbkxYNXhM?=
 =?utf-8?B?ZFZxVDZEYjQ3UzdYS0NQc0YydVNOU2RhVFBRMFplUWtucjhUOTBuYjVpUzVR?=
 =?utf-8?B?dnM2dStVMFc3V0lVQjI3MXhqbTYzQVZHaDJ5R1Y0YkJPa3k5TE5vWFhPc2pE?=
 =?utf-8?B?YWpJVWQ4NkV2ck9uSjh0ZkVKQ1JRMzlqeFBQM01La1lyQ1lUdU12UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18adff49-8fd1-4b13-8b4b-08de59133c0b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:33:48.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jp+ddHeaY19/mMOyRCAXHABdgzzGpHJzO/N2K1rCjtKGI1VeDQIKt5r4FmlfGjzI50UYIR/w9tpfIRn+o7YSsEsv9mSDrkTMGv5otQVy9TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5579
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 989935A99F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 2:28 pm, Alejandro Vallejo wrote:
> Add missing scaffolding to enable BusLock Threshold. That is:
>
>   * Add general_intercepts_3.
>   * Add missing VMEXIT
>   * Adjust NPF perf counter base to immediately after the buslock counter
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>   * s/general intercepts 2/general intercepts 3/
>   * removed _thresh suffix
>   * added missing _svm_ infix in the SVM feature
> ---
>  xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
>  xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
>  xen/arch/x86/include/asm/perfc_defn.h |  2 +-
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index ba554a9644..231f9b1b06 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>      GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
>  };
>  
> +/* general 3 intercepts */

All these comments are useless.  I'll do a prep patch to delete them, so
they can't be used as a source of patch nitpicking.

> +enum GenericIntercept3bits
> +{
> +    GENERAL3_INTERCEPT_BUS_LOCK_THRESH = 1 << 5,
> +};
>  
>  /* control register intercepts */
>  enum CRInterceptBits
> @@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
>      VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
>      VMEXIT_XSETBV           = 141, /* 0x8d */
>      VMEXIT_RDPRU            = 142, /* 0x8e */
> +    VMEXIT_BUS_LOCK         = 165, /* 0xa5 */
>      /* Remember to also update VMEXIT_NPF_PERFC! */
>      VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
>      /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
> @@ -405,7 +411,8 @@ struct vmcb_struct {
>      u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
>      u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
>      u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
> -    u32 res01[10];
> +    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
> +    u32 res01[9];
>      u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
>      u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
>      u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
> @@ -489,7 +496,10 @@ struct vmcb_struct {
>      u64 nextrip;                /* offset 0xC8 */
>      u8  guest_ins_len;          /* offset 0xD0 */
>      u8  guest_ins[15];          /* offset 0xD1 */
> -    u64 res10a[100];            /* offset 0xE0 pad to save area */
> +    u64 res10a[8];              /* offset 0xE0 */
> +    u16 bus_lock_thresh;        /* offset 0x120 */
> +    u16 res10b[3];              /* offset 0x122 */
> +    u64 res10c[91];             /* offset 0x128 pad to save area */
>  

This wants a matching hunk:

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index cbee10d0463d..8734fd2bca11 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -430,9 +430,14 @@ static void __init __maybe_unused build_assertions(void)
 
     /* Build-time check of the VMCB layout. */
     BUILD_BUG_ON(sizeof(vmcb) != PAGE_SIZE);
+
+    /* Control area */
     BUILD_BUG_ON(offsetof(typeof(vmcb), _pause_filter_thresh) != 0x03c);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _vintr)               != 0x060);
     BUILD_BUG_ON(offsetof(typeof(vmcb), event_inj)            != 0x0a8);
+    BUILD_BUG_ON(offsetof(typeof(vmcb), bus_lock_count)       != 0x120);
+
+    /* State Save area */
     BUILD_BUG_ON(offsetof(typeof(vmcb), es)                   != 0x400);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _cpl)                 != 0x4cb);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _cr4)                 != 0x548);



Despite all the comments, it's very easy to res[] arrays wrong when
splitting them like this.

I can fold on commit.

~Andrew

