Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E45CD1520D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 20:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200911.1516710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfNx8-0005FX-0K; Mon, 12 Jan 2026 19:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200911.1516710; Mon, 12 Jan 2026 19:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfNx7-0005E8-Sy; Mon, 12 Jan 2026 19:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1200911;
 Mon, 12 Jan 2026 19:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfNx6-0005Dx-IB
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 19:51:48 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f197859-eff0-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 20:51:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5006.namprd03.prod.outlook.com (2603:10b6:208:1a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 19:51:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 19:51:42 +0000
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
X-Inumbo-ID: 1f197859-eff0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAj6v9b/5I6iHbVo+TNiAr+GWsvpNWxCwAPuz0wcKxae/pab0sgpVTU0iHqIaGhftGjnBUQxC51O+yo6Xw8Trx71a0v2mOY7ZksedZhTYweUSSaOV3gIriUMZAPE6yHjfXvuJnqRwKfGUkR2Kkp2GZqR/4g8BB/Co+7XpX+tttP7+Uw6fdFncbmjGihId0mq1IkUeydhL9VcV+RhkyvHSryEGtrTywPhlfF3GWn+rnL5daOBf07OxA80kMhtJPdwS/UI3SRmOMHR8KNFgkhtbW8PbQ+4IJPX+HE+F0wZa7OZlcObuJohqp28tF73al1QsvmpaYv06W6vCEfsbz6ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWFk+q3EFqAXyrK3dawiPlj98LVzN7Lf6nZXfrgFruU=;
 b=lcOYEVb9sOJgBYUe+6ct4LOyYzAEwNS83G2fLMK524M+sD1BVaKGfjNdmJBC8XBcGYu+jVGXS/w4VzuTRBMDPMZpzbWjO1tkCbjAoGW+72BMs7BYMqzhVnb5GJVOQEoglHdo6v4JdrZ1jzLrd0P6Z26Zsb4R/+O/enWyY7hM2NwzOVV2u/rsArfTgjAU/tFN7n84dJf/xDh7/h7SjKq+Is/f/ZDJBcLDClgIlyU+X9TZ80YPwCkAWOuv9XZdSZhXxopkumWZKRRi5q7TkRmObv06qWu4m5HDRn7FmYqwSnlBni+mpopg8wtFTjkQjscpXqlsFG3e74so2UU8GBay7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWFk+q3EFqAXyrK3dawiPlj98LVzN7Lf6nZXfrgFruU=;
 b=lBaP0yQrybpcyfqoGEVlzWIz2gUFSUr7woPok4fzPRB4CFC/evbzu0EQHktDrdcZ/C9PPCgGSuJmr/BRbmJx4oAxG9PNttQbUj1Bj4HJAuEHuVwxWFUWTkzWrWEUX3WqqC2FSIOv8cSWa/rbIyLTxiEOX/xZSu4eLEXbFiiR2rQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2c471e14-e2c8-4117-a7ef-9d8abe859fbe@citrix.com>
Date: Mon, 12 Jan 2026 19:51:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
 <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com> <DFMULPGYXFY8.2B2XN60W4G9IA@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFMULPGYXFY8.2B2XN60W4G9IA@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf4d0a3-cbc7-4c62-8903-08de5214023b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGo1UTB3cGtZQXltQkozYzByWWFSL0o4ODgweE9nZTRpUk5DMXRxWDZTU0pt?=
 =?utf-8?B?QU15cW5veERhYmVXY0ZmT3drdXgyak54bk03T2pKYytXcm4rall3UkpCeStn?=
 =?utf-8?B?RExYZmxibjQ0dkV1K1BPbWN0UkU5dmtRQ2I3NmlPdzI1OUwrc05MRCtoL2Zv?=
 =?utf-8?B?R3BkVmp3YmFBY2ZqQlg4SWswSDdRckM5SXpGNFYrSnhlekJSVFkvbklUN0pk?=
 =?utf-8?B?VkcvTnVZejdFdnRJM3hWZ1k4OHlYZlBwUVJ6RktpT29qZllJSXlVNFF3dlBo?=
 =?utf-8?B?MTBzdnliZkl0aVNtWDJyYkdDdHhWODBmYjRqNWtmV0t4V3VyVExHcW1SWWgv?=
 =?utf-8?B?S1JIVGpUT0IzbVdxSUcxOVBhU0JXR0FYVjZIbk03MWF5QXZKVytTQXhIc0Yy?=
 =?utf-8?B?RitNWklUT3J6WWR2MWdWUW80cVp6OTZNVUljMHZET0h3d1pISUsxa0cwa1N3?=
 =?utf-8?B?YUV2QzY2cGdyL1k1WkZZTkRWMTYxaFFSWklQODNmalYzZm9iaUFlTkFOMXhu?=
 =?utf-8?B?T2t0S1hmUEtNRS9yd0tPZkdKV3ZNRFdBcks1b0xyYTloaVNYM0t2WEFXV1gz?=
 =?utf-8?B?TXF3U2N4V0Q2dTFla2NyaFNMczBJSHQ5NzU5WTk5azF6UTUvQ3F1OFNBdXh5?=
 =?utf-8?B?WGZ3YW01NjFHQjlBR21CSG1ObTM3blZkWTJJSnNleW5lcVBSKzE5WU5tNWVj?=
 =?utf-8?B?amcvNW9rQjZLRDlEdE10azlLYS9rWmE0Q3NpajBBYVdUOWEyMGF4YWg2K3Rm?=
 =?utf-8?B?aDYrUUtOYnRQU24xZzM1YS9LOVpXT2dmLzg4am5NNDRSRXlxNDZ3bVBUNXlM?=
 =?utf-8?B?Q0NONld0ZGdEVzIza2c5dERGd3B6TmVpNk1NZUIvTFpJRW9EYmNPSmpCbldL?=
 =?utf-8?B?dzZJMENVWklyRTkrRmhEdFF3dk05YXBkekpXbS9pSVU0QzgvSTVvS3pnS0lZ?=
 =?utf-8?B?UlZDQWhyUDVUL0FuZk5vSDRJTHdsMmdBNXFPNDBFbTZRRm1zQ0FCTkxOS3VP?=
 =?utf-8?B?NmQxS1NEeTBmdHV4RHRpSkdVMy9GMFp0elhSV05keTQ3dzZwbW5QdkE4UGRF?=
 =?utf-8?B?RzJpNnY5dDNhSU1KYmI4akhSSGdXaTV6dGllRlZlMUhLVVZ4SnhnTlBUcUdH?=
 =?utf-8?B?U09RYzBtV2hPVmZvcXB4alRCT2lSSW55MGFqVWtwYlcrTXVnTGtyY0VhMEgy?=
 =?utf-8?B?RDkxa2w1OTA5SmVDSmhIMFNSSlgwN0s0SU5RVGI2cmVHblBjL25LL25jNGx1?=
 =?utf-8?B?c29XdUdzY0dhUnZyUHdzWTd5MUdkQ2hCOW5lL3cwRXQ1Qk9Fd2pURzJmT2Ja?=
 =?utf-8?B?K1pZVkkxaFR1NzB4ZG0rZ3F2WndkdUtjc200R1VKMW13b1lRdStpbWgvTmhT?=
 =?utf-8?B?UUNtOXQvOFNoTVZ3UUtqMEpkSTlmN2hpUCt5SGxYQWlzdWhTZ1JiSTJSZDlX?=
 =?utf-8?B?TUQvUHRmdVJNL3VzdDRBVHVWYUVQZDRwdElUb3lrdXFuN0xXRERWUDdEdWxI?=
 =?utf-8?B?VzY2Y2FMQjFyL1daR0pkWGpFbDQrRDhIWkxlT1Z5dFNYNmNoU1RqUVBaRlhL?=
 =?utf-8?B?S0NHdlYrMFMrU1kzY25hNHBzZHNhUWVJVDErOXBIakorK0pGNVgyV1hMajN4?=
 =?utf-8?B?RXVXY0hkVk8zdFZaL1RrTStsamdHWS8yekpYR1JQbVl1cWRMem9xandLcThj?=
 =?utf-8?B?cWNsaUpIK2JVWjc0SXNQLzVMVTl0NnJBRkxBS2V3UUNVbWo0SlVIMHpVa3BI?=
 =?utf-8?B?UURVaWdPQlZpTjVzTjJXdDZEVmVka0lQVE1iWmpIeXN1QmtxbUpwa1JsSGI3?=
 =?utf-8?B?aUNZRXpDQmFuaDhwQW1HczZCWVFodFcxUkdla2NGM3BuSUQyTFJ5ZTJpdUo1?=
 =?utf-8?B?MWNEaGRkUjNjd2FSQllReDZRVnpTSExzSVJPbjdYOUNvNXZvTEthazZzWS9x?=
 =?utf-8?Q?HBO5vR844aOT9xCoyI/SOZ+veRDNBsxA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE9ySFdML0hWdE9vNHhNZHphMFJ2Si9IM3FLTGlPc3p1UmFSQ3g0bFdWM1FU?=
 =?utf-8?B?Y0IreGJub3NiSWFTSjFiUXA2RXNYVzFkaXRJejg4T1BwTDVtWE1wcXc1S1Qx?=
 =?utf-8?B?NVlqN1RNaVNiUVRLQmtmZkZSSWpnUU1WNE9FRXI1RW0xSzRJS3NOTVJad2lH?=
 =?utf-8?B?dkFsYmhTOTUzc20vcFR0amZNMkwvSjNTOXRqNkt0SUozdmNoTGQzYlhMWlRN?=
 =?utf-8?B?dnR3emtPWERTU3NwMjFjb1FVNFMyZkRneTdhUHhveE5LRnZkTmFlbHNFMkJR?=
 =?utf-8?B?YWtKU0l3Q3E1T3lQTUxDTjNQeW5ITkVST2k4bU0rZTMxY1RpUjJ0RXBEMHZQ?=
 =?utf-8?B?ZWtGb3ZMWWRXVzBGNkNBM1ovRHc3K0wwTDdXaHh0c0JBN1ViQUxoRzk4SlJ0?=
 =?utf-8?B?QStJeWpDUU1SMWIvRlZTTTZJMmd3L0lTRWpKaEl4clJqSHo5bnoxdGQ3dmg2?=
 =?utf-8?B?MTBra2RlV3VEc2YveWNDSnlYYVF6RFNQc1JaK1hrQ29kbzFFUGo3VFZITWhH?=
 =?utf-8?B?QmRhcWFudHVvYjl5OUFYWkIxL2dYS3hCenU1eDlrYmorYlNtajFJN2g2MTFm?=
 =?utf-8?B?cW42VzZ1RERpNGMyNk5NelNCU2JFTm9Qb2tZdVZQcjlVdGtHNDZDTFVUcnph?=
 =?utf-8?B?UGwzUm1OWTJjYmZpS2QwTTlVbkpuZjFBNTJRZnQ1TUJ2dUwxZWM3Q2dzYmNK?=
 =?utf-8?B?bXRtR0RVOGdkelY0WUFHUndlV3AxY1FqajRWMWk3ZlhwaVByYy9nMzJRZStP?=
 =?utf-8?B?dTI2Z2Q1SlRzOVVZd0lqczA3eTJUeHcxMlpkVy9iNERhNEJBOFJQQnlTN29m?=
 =?utf-8?B?cVBRSW9sMVdVTWNUVVFzZHNCRzZPQW1xL1pDSzhsMUxyV0lhVFJjeFJXMFpV?=
 =?utf-8?B?LytjNEV3M2hFQkVOUG00RmFqUmZUNVJpamRQYU9pUzlybjdjeEl0blo0MStT?=
 =?utf-8?B?dEw2SXhubVpkZkhOdEIzWFlIcnlkZVJpQmUzbVF1NGlqOEdIU3JuSFR4VDBy?=
 =?utf-8?B?U2JCaFpJRG1xYzBDMmRuMElCTHhPR2lrM3lYVmhDVzg4QlZ2cDlQL3VsZE80?=
 =?utf-8?B?SWpaMXEvMGFpbjR0UHNhRHcrQ1lZT2VMMkJ6N3V0YzRSOUFwUTVoY2p1VzlE?=
 =?utf-8?B?YVdFRWpFaTVYYng4aTErQ1U5RHJUdW1leW8yZ05pT0lGL0FDanFyWUNNU0xI?=
 =?utf-8?B?STczYXNCZi9XbDRPS3FmaHZyTGt1aVpUT0huR01UM0NsbnhmUTFiZ0sxU2ls?=
 =?utf-8?B?Ly9lTjduaGNMbEwzSVR1OGNGOFNNUjg2U3grTTdJV2dUL1VBeDB6VkJuL2Ft?=
 =?utf-8?B?TVpJRC82TGx5VkxNT3VDRFljaVNLM2xTMVNRclA3RnRaekNiK2RjTGVrajVS?=
 =?utf-8?B?TDRWMWRKM1JsSFkycmlLOE0wN0dUT2ladExDbytnOUxXbEV3aDRBbzJEUlBk?=
 =?utf-8?B?eHcvSjNtU0d1ZkM3c0JLWFZHZk1JaXFFRTNDeENwTlVoSVRiK1djWEFkeldC?=
 =?utf-8?B?a3NnVVN6M2RwaGl1bE81NWhqOTd6VEdkdkhMQnFBY25qamNtV2JZdmp0MTNK?=
 =?utf-8?B?Z1FubUFncU8zUlJxdWlFNzc4R0xHTFB0aGIxdzRmWmxpaFNhUkRtRFBQYytQ?=
 =?utf-8?B?Q0pycVBrUUpxVWFKTE15SjZUOE5rOTdjZStHUlhpZVdLVXFTL2dRTkJJMWFh?=
 =?utf-8?B?UDNjbEFrK1lQa3MxeURQQmdlMUZJbW53c0gvWkpWNFNXQTFvejdMQStDVnp4?=
 =?utf-8?B?Q1JkV1padWJ6blEySTBPZzdSS1N1OFpoMjhzcENPelNkUWJyK0d6U0tES3RN?=
 =?utf-8?B?UlFCTXd6dFV6Wkpiazl1Vm83SmUzT0x3d0FWVmxjK0szdUt5K1AvQmFNTHRM?=
 =?utf-8?B?emVDWmp1aEw4NGRrZzg3cG14cDF1V3M4UWhJeGxXWnR0WmlKT1UxUlZYc3Ro?=
 =?utf-8?B?S3hwLys0RTdHZ1BUcGc2dHc4WmFTdHNTT2hSaVVRc3NmcmZsV21lcWtPOWlq?=
 =?utf-8?B?c1JHWGpVcFdMUlRtOHpGeGVKK0d6MWduZTFCMG83U3g1MHdCdmMycjhYUW80?=
 =?utf-8?B?RmlJYi80TDVNOEhyZXZiMDl1U0w1dlRrVTRDQVd4K1NTVUJKSWl6QVM0RExw?=
 =?utf-8?B?eEQ2TmVpVEFQQVVsNndMRmtScmJPUldjNW5rQmpXVnJ1OUJWQmRIWmdDdmdZ?=
 =?utf-8?B?UnB5emJyODArcEtxcVdFY2Yra1NiUXhWQzhGbGt6R2VxeDhUQy91RlFsbnQ2?=
 =?utf-8?B?cmpCTFcySlNkazkwdEFOL2RXcjNnQ29USFBoZFVFaVVIRFpBWDFVcGg0UWZi?=
 =?utf-8?B?T0RRaDBaUHl3bCsrVFVsZFRETnNkdXhIR21tUk9uN3VGNFdxUGVNSTdNTFhi?=
 =?utf-8?Q?bD1cjK15hvd0PLl4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf4d0a3-cbc7-4c62-8903-08de5214023b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 19:51:42.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJhzIXqv/TBl9Evuk1b3l2twbyHV4skuX8Wu7PLRUv28yUv9k611GgVZkOaFcWlSLFuPO6WbLT6p5qQcpzDzdPfBUD3ejmnfg7HAdrfSWds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5006

On 12/01/2026 7:12 pm, Alejandro Vallejo wrote:
> Hi,
>
> On Mon Jan 12, 2026 at 7:47 PM CET, Alejandro Vallejo wrote:
>> On Mon Jan 12, 2026 at 6:15 PM CET, Andrew Cooper wrote:
>>> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>>>  automation/gitlab-ci/build.yaml    |  2 +-
>>>>  docs/misc/efi.pandoc               |  2 ++
>>>>  docs/misc/xen-command-line.pandoc  |  4 ++--
>>>>  xen/arch/x86/Kconfig               | 14 +++++++++++++-
>>>>  xen/arch/x86/cpu/microcode/amd.c   | 22 +++++++++++++---------
>>>>  xen/arch/x86/cpu/microcode/core.c  | 25 ++++++++++++++++++-------
>>>>  xen/arch/x86/cpu/microcode/intel.c | 16 +++++++++-------
>>>>  xen/arch/x86/efi/efi-boot.h        |  3 ++-
>>>>  xen/arch/x86/platform_hypercall.c  |  2 ++
>>>>  xen/common/Makefile                |  3 ++-
>>>>  10 files changed, 64 insertions(+), 29 deletions(-)
>>> Much nicer in terms of (non) invasiveness.
> An interesting fact came to my attention. If you set a function pointer as
> IS_ENABLED(x) ? foo : NULL, rather than ifdeffing out the compiler doesn't even
> need __maybe_unused to eliminate the statics.

Oh, yes.  I'd forgotten that trick when I suggested __maybe_unused.  Sorry.

>
> I'm adjusting as needed and creating something so that...
>
>   custom_param_if("ucode", parse_ucode, IS_ENABLED(CONFIG_MICROCODE_LOADING));
>
> ... does the right thing. I'm sure it'll have uses outside this (minor) patch to
> remove a number of cmdline handlers when the feature they control isn't active.

This I'm rather less sure about.  The lockdown patches are also
competing for a 3rd parameter in the param() APIs.

Again, I think microcode is a weird (i.e. rare) subsystem where we're
only compiling out part of it.  Personally I'd leave it as you had in
this patch.  It was minimally invasive.

~Andrew

