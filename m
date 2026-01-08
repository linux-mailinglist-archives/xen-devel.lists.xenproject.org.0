Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B221D0635C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 22:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198134.1515341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdxFb-0001qI-ED; Thu, 08 Jan 2026 21:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198134.1515341; Thu, 08 Jan 2026 21:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdxFb-0001oL-BI; Thu, 08 Jan 2026 21:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1198134;
 Thu, 08 Jan 2026 21:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HrZ=7N=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdxFa-0001oF-FO
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 21:08:58 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d7f22ae-ecd6-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 22:08:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 21:08:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 21:08:51 +0000
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
X-Inumbo-ID: 3d7f22ae-ecd6-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gptx12/RyU+UAJsXor04vXIeyQ2MnGIIvLlgSiu4g5kZN3RvkvDnyIuBm6oOqQU/HILFvMEd3n1R3EQcZfqazkkVUBIvVK1QWAlF/yEljLNcbUuAvrMQLBd+wxQWVh8zO+nkaT5h18GQcfY1wPM7pXL7gNCveAsZ3+tQUE073B5joz6ZLOCDxLUI/4/SFHyaEj/Y4FL3DEmIucL/YxDcuKUBVtwYJudCqKVn6JulEpDiHY+aStgRTuz+5YUPa//BrFl1T06ZqGfd2+hQetQCY2AmN1b+iHvknl2E2dG8nCR0BITsCbrJAHNo8xVWu66OQv89kYxJIfq4/n4dP3FOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ufw209kKfDJMc/AykLWlB6kEa/Uoa9Oo8aZrdexWpLE=;
 b=zJA8Iql3cNEwGLfhG2XSXODqC03ORS/ENv/+1Q3yq4f/DdyZgIepUZ+9WzTsJEMm0+GfWRQ+imaFfNNYIez3AYFDGrx6I/VhoPfRCvwQv8NAuSUIb3lZIs7Y9/4eKtgXaDK4iM+V6F4C12XZjZrUnXQGtSt17DTTWtniAJmtxqGp8i6mCt6jM1HKfwxI8T6P9ue+JqCM0LZQEGkaOo3D6gYkPn0ottsNnGbEzGZKwjG/ZxArANCq2GNzf/HisKH72+t1Y/y1xWbQIr5pGaaEattLaZL8V7iwRM/bsy1v3cU7Y0n3OFfNIPeT0XubD0XRToF2BOZE8MQa6dmmiCKelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ufw209kKfDJMc/AykLWlB6kEa/Uoa9Oo8aZrdexWpLE=;
 b=ru6V81BlsWdUZHS+m4wi3Ry4JcpXSNogaTb4ez3ZCr/GEa6KfwGhcX68GAh965BqTVH+30A6BtdAP03+U8C7KBuAMaKYy2/l299xWPyKe96SsLBiEcdhODKIVGsFk6A/kbfqob0qU9iSw8mfYFgkSmHG/iQMqGWifbiuvQLw15A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91a64181-212b-4515-9e2e-82b3eb4b4364@citrix.com>
Date: Thu, 8 Jan 2026 21:08:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Jan Beulich <jbeulich@suse.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <4b051e1f-0d99-4637-b433-bade93e67e0a@suse.com>
 <e34ecbe6-5b74-451f-8540-037966f1be21@citrix.com>
 <6062efac-8285-4062-926f-dc3ece871654@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6062efac-8285-4062-926f-dc3ece871654@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4be481-590d-435b-5078-08de4efa1fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFNVVjMrb2ZKOUdiYStzQTU0REcvamNXR0lRL1BZdkpXNVcyMGhiTnVLSmNw?=
 =?utf-8?B?bVpqRkdocTZQMmQyUldiaUdCMVloZGRyaFdZUVI1WU9TSzM0WUp3UUkwZm9l?=
 =?utf-8?B?bUZQQ1RNOWlpL0dhMUZKaHhxTWxmS09GVXdkd2ZVQUQ4a0ZXb2NaMEtMM0x4?=
 =?utf-8?B?VWczQ25FQWU5dC9QUXNjdlR5OENZNC94YTRQc3ZpUTB1QTlDMnJiSnBtelJz?=
 =?utf-8?B?Y1ZwT1pIQ1pVWVVlTkNSR2J0a2s4dnlFMGlUaHFUaFYwcVY4SmFLaW5RMDBZ?=
 =?utf-8?B?Rnc5RmhPMnVWSVFiNlo1bmdDRmp4aTJuWkNtZk9TMGNNWWowWXZ2UGFHRGox?=
 =?utf-8?B?UVkyZUFmODQxM1o0NVNOdnNVZk1lZ1A1T2t0ZjA3L2ZCeXREaURQSFFIU0xs?=
 =?utf-8?B?b1RLMGExa3FyWDZaWGRBVFlKTkhhd2ZrWUhsbnlKbmJ3ZXFJVUh4eHVkTGd5?=
 =?utf-8?B?cE1CQTJlczRZTmFvTEFjM2V5Ly9XYjBkSXlUa2RKUEVJRGo3YmU4Q2I4d2c5?=
 =?utf-8?B?a21mZnBQeEhVT0UrWWdmTTNaKzdudDNqVnhVbWJxdjNVUk05c1Z1VlBHdFVk?=
 =?utf-8?B?MmJzOThuT05RWFNsOUkwYkF3eEtrNnlRYnQrYXFVSmVaYytSaXZhVS9CRjdy?=
 =?utf-8?B?c0lBay83N2VPSE9zS1pyVmFYdElMcWU1R3Nlanl5MzJyejJIT283OEtYNS9Y?=
 =?utf-8?B?RnZxUkdIMmVlU2xTZGZSbnRaZmhOVi9HR0pKbXB6NVVMY2NmN0ZZNGdLa2d0?=
 =?utf-8?B?a1pxeWhQZlh1dEIwSDA2bnNuZndkSlZqTER2MENlSXhtWUxEZVEzdVpEbWNn?=
 =?utf-8?B?R2JOSUVPbWpFZGJCdHFITUJ0aVNvSWdyRERXQlJYaVdrZlNuOEN0SCtacWdu?=
 =?utf-8?B?SGN5d09leHZjMmxaQ2lUOERXTFd5SEpkVERzdEx3d3VVK2h3R1Z5SDN3VTJC?=
 =?utf-8?B?dk9NN3VrSENZZWtPa2VJQytPY3l4ZnZMOVVUS0tTeEpRbXNya3k4Q1B3WjJn?=
 =?utf-8?B?WlJXbGdCanh6RjNCUkdVOGJqQ2dZZG1KNExScmhKSm5uVngwRytYcTVIS1VD?=
 =?utf-8?B?UzV2Z2V5YXFpdGIybVhWYmxXZlVNQVMzVEw1c1pqdlQwNktiZDlqOStDdUFK?=
 =?utf-8?B?amN4bzVTWXgxNnE1UVh2bmRXdGs5QU9tVEo2b2JkdU9qekhjZko1NWRBd1NX?=
 =?utf-8?B?U1hsWTlNaGttRVVqODN6MzdITC95bS9BT2ZHWmxWSVB5OXNxdEd1TkQ4SXVp?=
 =?utf-8?B?eEpYQkJiUlpPZE1qNkdXQkZLNzlYT2x1ckI2YnFjUU8xd2tpZE9rMHNmdmZM?=
 =?utf-8?B?cVRVaER4OTVRYUhTcVA3NjE5MmpQeXNvTGo3Nk8rdHZwajY3WmVkRDJ4Unc4?=
 =?utf-8?B?S3dlb1ROSUNncWpJcUFqN24xN0E1WUJUejBBVVA4a0dldUNCZFlZZEd3dGJV?=
 =?utf-8?B?WHdhbHAzWkpkTEVQQWhjMkRJaHJRTDFLbnVhRGpvc3NCWFo3ODBmTzRxemVP?=
 =?utf-8?B?clcxY3R6cWc0V2JvNjJLdFd6MmZaME1mNTJ3bDBzSnNObnprOWZMQXpNa3BF?=
 =?utf-8?B?UXg5UEc4RTFQQ1k2RWhZZE5HSmV2N1BXdHRBQ0YrMW90STZjOXZUZmJHOCtE?=
 =?utf-8?B?ZmlLaTVVU0ZaUEhYK2EwQ09CcEVtS0E2VXNnNTRWLzhOcGJTYktIQ0Z6c0hH?=
 =?utf-8?B?OUpNVk9SRU9DQWtlZFVpcGI5U3JEd2tFMWh4V2lnTXovU2F0azNYUmNzS2Y3?=
 =?utf-8?B?ZjRsM1JkdjMzVW5seVpnbk8zbXhqSXlPWExjMWlQRXhiVXJsMnFkMWh1RTF2?=
 =?utf-8?B?Ymt4NXMvUllVSTZEbUNSMHNIMUIwRzZPd2l0akoyTE9QWnRvYkRIMVg4MHFv?=
 =?utf-8?B?ejJOS3kvN0tXN0VCRGNjQWM5Zy9MNG5lTVJxUWVUY1d3U216bC8rdlVlbE1t?=
 =?utf-8?Q?JRE+FBfQAKDvQHAoco9SDPwyMQIK/iYR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGE5dmxzc1FCTFE1TWl2bHVzOCt2N3UwaUdLN0V4dEFkSmFSRytiS0tMNjd4?=
 =?utf-8?B?T0JpNXpXNzFkd2R5dTZDcnIvaTBOd2J5eStjRnhtb1Bya2QyMjVCdWJGWEsr?=
 =?utf-8?B?dnJIMStSU05DczVlZ04xdWJqNkZ6dXdLWmsyWHU4TGpNaGQ4RGpWMEhueHZh?=
 =?utf-8?B?NjNoOGtxbk1OTGV0NEpoemJZZ3U1bzBIbVg1NUJYdWg0T0FqZzhxL1IxdjVC?=
 =?utf-8?B?Z09rZ3RwVkxhb05KZDdWVHdETmpJcnQyK25MZ1FTVVJVcHZxM0QxZ3FGQ1Bu?=
 =?utf-8?B?Z3ZxOG9TcjEvdjljZUduSEc3dlBoOTFtaisvT3Z6dVdoVnFUL2pYeVk2MCt6?=
 =?utf-8?B?N2hXOHlRMkFrZGozRHhKb01qOWI3RUdFM1oyVFk3OEYxTEV5MkhTbE9pYjAw?=
 =?utf-8?B?MzYrMFh3bFphY2gxL1JkdEsxV2ZJcVBYaVJ1RFlyYThuZ3B6R0E5R1A0K3pq?=
 =?utf-8?B?NXJ1YmY2TU96dGtlZHhSZTQzL0t0cG85QWVaMWtXcXlrUkc0eXZlSDJVY1gz?=
 =?utf-8?B?TjkrRjV3VFlXVE1jUy9Tcy9EakQ1MDBsbi8zaW5ZOW5qaUgrK0t0Wm11cjFq?=
 =?utf-8?B?eXR5TlRZNDU1UU1GNW56NVh3RnhNQy9meWJOb0FUWHlFSEcyRXF5U2YrWWJQ?=
 =?utf-8?B?VUFkTDd3RTRhSHg5MThkczA1UStpWElLUEMxOGI1bzFwY3VWUW5idUZWVHZo?=
 =?utf-8?B?Q0svUWRKOFNOUHhLUk9uVGtucDBDWE5qWnFJOGMrRDZSWitHcE1uRkl2ZlBv?=
 =?utf-8?B?Z2JEMzhVa1pRQVYvSHljQklmVFhuVVBnelR5TnkyTDRGV29sSHZ2WW9NWXht?=
 =?utf-8?B?Um1pTjlZQitTWGI1UFd5Tkw3RXpCUFR6WU1HRXF5WVpFSEMxUHNsa05iMlZi?=
 =?utf-8?B?MlozY0cvM2V0SDJKaUdtc2E4akQwalQ2YTlhT0dpbVFlZE9XVkVMWk9TeHNp?=
 =?utf-8?B?TEw2MVVtSmo4VUYwRTcvUmtra3pQK3V5U0VmS3lkR1ZDdHV6YXIwTHFONFQw?=
 =?utf-8?B?QTNoMnVNNm84d1gyNDRVRnR6ZUJ6WlpSNHhpOE5jazhWV05nV3NEZ0duc3Ro?=
 =?utf-8?B?Ui9ud2tsM2VLQnArUlp3VUJzR0lYS3phT2R2bkk0dy9KazFJWEloTjMrcklx?=
 =?utf-8?B?c3oyQ0F6V0ZOdWRvYy95bWVwU2ZKcmltNzBPRFZRK1lZU2pHNGVYTjd6emRm?=
 =?utf-8?B?dE9rWHFWQ29Ua1NXOVNtOGE0WWgrVUlVQmY2ZGs0bWhCdzZ4YUhrR3NCeHFs?=
 =?utf-8?B?TXFSZU9kcHVuOVRlUlZzUUREaUt1djN2Ulk2eU5ySktGMGZNVXYyZ3hmSWpj?=
 =?utf-8?B?RTFzeE10dkhVOHd4NWVsbW0wZEVRNXNsTGl0OFRJdk5UQ0JGd29QZjhNVXRz?=
 =?utf-8?B?SG05elRvN3BUdE56WnovSGMvWFBiOERWaFhGclczQno1K1JqTnRxQzBCZS9t?=
 =?utf-8?B?aHU5dHAzZGcxeW1FdFlrQ25McW9Ua3prYzNNMitPOVAvbWNaNjFRSlNONkRV?=
 =?utf-8?B?bXI1VExFQWRDOXc0WFFEcXBtTUcxcUJxRzFETUY0STlhbjJZSHdsTkQ0UHpv?=
 =?utf-8?B?TTE3L3dMdy81Mi8zbjVodjVDV3lEYS80d25QVWpvSHN1bUlZRWJzRlI4a0Fz?=
 =?utf-8?B?N2dQK2pVWXE2ZHNzaHhadXk1aXR6citXOGpmNHd1VFJIQ2QyMVIzNFRhdU54?=
 =?utf-8?B?Zk03Y2xnZjdldXhCM1NRc1N4ZlVnN3lScUI3ZCtNcWV4MTlacnJqM3c2TmpP?=
 =?utf-8?B?bll3UVE1TDI2QThEMFFxYkYrcHJqTngyRXdkRHhUdTVyK0p4RE5ROXViNWVF?=
 =?utf-8?B?TUk0YW0zc0FzTk5xQXkvbzhmTTVsUDFEL3RiYjN0TEF5RDVsamZQTDE0d3hS?=
 =?utf-8?B?SUVxSWF6UElyUXhBUWZkWVVnMWFFSGNkNDUwNlh0bkxsQ0pLNFV1MTJxQytP?=
 =?utf-8?B?NFVQUVZyMTBBUXkyUER1L1RvbHV6cGYzNVFJVkxiOWNEaHZqSjBPeXVnQ0NS?=
 =?utf-8?B?UUxid0FoajhUVjk1YmUrT3lFNWltZ0JVeDI1YXJpbmhDc0ovcHJteUVlb05I?=
 =?utf-8?B?d0grUkdHeEdQNzV6Uk1UanZYYVhKK2xHRGFYa0VFRE5yK2tLRnlicWR1em43?=
 =?utf-8?B?eDJnRW11VzczdSs4dlpsTUVnZHVKdTZQeWdjNmFjUG5JYUxmQWltcGhPWXhm?=
 =?utf-8?B?Q2pDcFdrQXpqVXJOMGxYYSs5djdna3F3cEZva1p5bC93bmFaSDJhTnJRSWx0?=
 =?utf-8?B?WWZpa2VxOXczcmsvZjlxVmVZckd1S1hmYkx3MDJ2dzFGY3pXR0drMXRYdVNC?=
 =?utf-8?B?c1RPWnlJaWFCcjZKRTUxYU1Ma2FoYTRKLzZ3aDJzaHdmQVhZUWcwci9JWlpo?=
 =?utf-8?Q?jVPl274jpcJ2wcMo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4be481-590d-435b-5078-08de4efa1fa1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 21:08:51.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTxVWpDtrAwwIOgG53sbtkDEqsI+K5fL9u38ck08aM5TBV4k0vgDFhJ+HIRUOgsjnzPP9MI3X8MwLi8EPBVjDqbZztSNRAfyJd20VDFKhvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669

On 06/01/2026 7:59 am, Jan Beulich wrote:
>>>> @@ -489,17 +484,17 @@ void xrstor(struct vcpu *v, uint64_t mask)
>>>>              ptr->xsave_hdr.xcomp_bv = 0;
>>>>          }
>>>>          memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
>>>> -        continue;
>>>> +        goto retry;
>>>>  
>>>>      case 2: /* Stage 2: Reset all state. */
>>>>          ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
>>>>          ptr->xsave_hdr.xstate_bv = 0;
>>>>          ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
>>>>              ? XSTATE_COMPACTION_ENABLED : 0;
>>>> -        continue;
>>>> -    }
>>>> +        goto retry;
>>>>  
>>>> -        domain_crash(current->domain);
>>>> +    default: /* Stage 3: Nothing else to do. */
>>>> +        domain_crash(v->domain, "Uncorrectable XRSTOR fault\n");
>>>>          return;
>>> There's an unexplained change here as to which domain is being crashed.
>>> You switch to crashing the subject domain, yet if that's not also the
>>> requester, it isn't "guilty" in causing the observed fault.
>> So dom0 should be crashed because there bad data in the migration stream?
> Well, I'm not saying the behavior needs to stay like this, or that's it's
> the best of all possible options. But in principle Dom0 could sanitize the
> migration stream before passing it to Xen. So it is still first and foremost
> Dom0 which is to blame.

BNDCFGU contains a pointer which, for PV context, needs access_ok(), not
just a regular canonical check.  Most supervisor states are in a similar
position.

Just because Xen has managed to get away without such checks (by not yet
supporting a state where it matters), I don't agree that its safe to
trust dom0 to do this.


For this case, it's v's xstate buffer which cannot be loaded, so it's v
which cannot be context switched into, and must be crashed.  More below.


>> v is always curr.
> Not quite - see xstate_set_init().

Also more below.

> And for some of the callers of
> hvm_update_guest_cr() I also don't think they always act on current. In
> particular hvm_vcpu_reset_state() never does, I suppose (not the least
> because of the vcpu_pause() in its sole caller).

We discussed the need to not be remotely poking register state like
that.  But I don't see where the connection is between
hvm_update_guest_cr() and xsave()/xrstor().

Tangent: hvm_vcpu_reset_state() is terribly named as it's attempting to
put the vCPU into the INIT state, not the #RESET set.

But it only operates on the xstate header in memory while the target is
de-scheduled.  It's not using XSAVE/XRSTOR to load the results into
registers as far as I can tell.

>
>>   XRSTOR can't be used correctly outside of the subject context,
> Then are you suggesting e.g. xstate_set_init() is buggy?

No, but it switches into enough of v's context to function.  Really its
neither current nor remote context.

But, it's single caller is adjust_bnd() in the emulator so it's always
actually current context with a no-op on xcr0.

As said on Matrix, I think it's going to be necessary to remove MPX to
continue the XSAVE cleanup.

~Andrew

