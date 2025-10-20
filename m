Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D2BF1F90
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146446.1478871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArOj-0002wU-Tt; Mon, 20 Oct 2025 15:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146446.1478871; Mon, 20 Oct 2025 15:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArOj-0002v4-Py; Mon, 20 Oct 2025 15:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1146446;
 Mon, 20 Oct 2025 15:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BTWa=45=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vArOi-0002uw-92
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:02:08 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be9afa03-adc5-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:02:07 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA6PR03MB7567.namprd03.prod.outlook.com (2603:10b6:806:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:02:04 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:02:04 +0000
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
X-Inumbo-ID: be9afa03-adc5-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UA/3XrocGMbEctI9dx5XdGZnZn37QfRCEALaUdcCMsguJWV2BizxtodpaiZ1nT6jtS8MU8jmoiqfdEf/qvWlQcIXhNau3VC5NKLjWkjZavjOE2OLfNpHnBkSNQack6TXq/xF62F7+xejTuQ0Pagn9RquF/9zcOesaFcGm84fIjbL1xmvRL0TbnAFrtZpUrp7n6NabcHXaf6Pk8YbKy7eKUinX33Kg7CIWbqWnehgg3C6Q0C13wshjgqMIb4kPMu/ZCadc4gL95dybNtXXXXo3nrQVl13RAq0kH11px0X01Wn2j8ewD8e57xn3ipu6xzBYSfLzTtfpY4X0IB4Lhz6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiIPfcOa+ixrFeeRbsU4tuw2ho30qNBiWMI7pE+gWQM=;
 b=Vm3LlHbaf7zbDpx3FcRzQHE33c5lkpFnHHtj2AycWEjAY/JUTJ/PvF/V7WjUsxMrRRiq24TQQ8xqXQeUqxWANZ8a8hc9MWqa+FsWswmShqugezrB9/ldG0CTLC3zG0igZWFp56r1M41BIRJmZKW7fVuMYP9qpzgOwovwDXgAHfbCT7Ov2zrY2RVc7QGFxrToK7wchDAFFdsWO2MjJeP1vuAFK48WShLKv3OBLG4bQltGq/4q3Dxo4aeO3WFbbZWrc9HJ1w1/DGVE2VPzcKNPKKsjznzlhxOrC4FdWKn6X6WTlRzIExtjUqBU4JZpW7dhRd5iMpZyeqpYF3SzNBC1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiIPfcOa+ixrFeeRbsU4tuw2ho30qNBiWMI7pE+gWQM=;
 b=UmF+VMcSzMyX6YhGjuPzDP/PPVQNysGLxpj6pwNTQU3trQkqCYf4JkvLPl+bYAFwxUQYqeJ4Y+FOBYigviCCgXxKOtJSZGMraQG2pslnNeDAGqIAf9i2mfPfbvGokhl7bIfNdOkAGeYHj/+JDh6EHH7FditClhy53hJR1ekooYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e0f978df-e838-4f62-838b-1789208c24ac@citrix.com>
Date: Mon, 20 Oct 2025 16:02:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21?] AMD/IOMMU: unshare IRQ .ack and .disable
 handlers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::18) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA6PR03MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5fcd90-3faa-452f-9eee-08de0fe9a12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enRZU0dZMXZhdzliYnJZV1Zmekx5MS9vNTFLZTdSNFlQdFZBM1A0OG00UUR6?=
 =?utf-8?B?cjl6aEtXRmVYVkZpVEd5b3pZMjVuLzRlSHhTRUMwcUlFU1V0aHJEVWFzYkRx?=
 =?utf-8?B?ZHNURjBvb2pwV0w1dVBIRUNSWFE5SUw3eFpreUVvcUxqdXhzUVRsTXMvZ2N1?=
 =?utf-8?B?Q09NRHF5bzhDMFVOdkQrd3c3MzlJQkZWNmJDNjNpQVY3MkhNNGttN2RvZ0JN?=
 =?utf-8?B?QS9yR2JGMmtxb3U2VzFIUCtWSTg4cC9iQkV1Tk8zUnlaRFNmR0w2ZFpIZDY2?=
 =?utf-8?B?TmtHVDVFbHVpbk5mMnNUUE12ME9qR1hUTWpHQWZCOXZjaHNTNERFS0JnMzZC?=
 =?utf-8?B?MjlENjlrdVVuSzdKUXpmbmtibXo3cTNNS1NUZG1YN210NkdvNHkrZnNBcjZB?=
 =?utf-8?B?RXNQMnpLK085M0o0d3dueFl0WlFiYUs2L2h6VHYyRXdQTjFhYzNEVFFucVR1?=
 =?utf-8?B?SXhBbW1DenE3MUIzZmMxWXlIaXdXaW95MmcyRGxadjdRTGNPZ1RqTHE3akNO?=
 =?utf-8?B?RWhtbU1lNTlQYnV0UE9GWDhVWnRYM090MDFtRGlyOERXNmdmaDVLVHN5V25v?=
 =?utf-8?B?dERRSVgySXZUVXc3T0ZEM0JFam56QVpFbDNCY0VycFJ5Snh2SXdJNGNsR0Ux?=
 =?utf-8?B?RTl2d0FiMHJQTDNWSDhUTDJodHlUV0tkQUtGNjE2cDZlLytKcXJIMG5ZTmtN?=
 =?utf-8?B?ZHkxcnRFbTNFbXhra1p6Y082bUdKRG5uMFdSZUlKUHRLMkgzMlhEbkRrVUg2?=
 =?utf-8?B?Q0JBeVdxeTMrUU16Mjl1R1A3QTF5dC94TDYwNjhza0VLL1hkZ09oOGE5Wjd5?=
 =?utf-8?B?V0tBUzBKc3BXcjZCWWd0dTdTeVlzUFJuUXpabGg3UXJlYS9BNkVsS3ZjZXVY?=
 =?utf-8?B?VUdZcmpzU2pnem9DVU1ZVTRjWW9tcnRFUWZQckJ4ZDRwYjRHdlM0QjBQTkZB?=
 =?utf-8?B?Y3RnNmt4UHZzcWFtRUJsWHNIWEhOMWhiSVZUc29RaldXRzI5allZRjhWOEZQ?=
 =?utf-8?B?bEJVZUVNdHJFbWlQYkloVDdLYndiL3g4SnVZbnE4dkxtZFNldEMydE15aFcy?=
 =?utf-8?B?dzVDSDhsTU1wZVhXL0Z0OXkvZnRuSUwxTUZqQjFwb0ttYU16ZFdNcXp6cXpM?=
 =?utf-8?B?REhRZVpFNUt5UjJkd1dqN0luaXhzMm9kSFRiSDVwbk5zaURvSXl5dG5SakRE?=
 =?utf-8?B?MU9UelMrTVZnb0hoSzlyU3JBMitSemIzY0gvQlpCYnBmSzFIeCtnTk9od0Rs?=
 =?utf-8?B?bzdkbEdENW5KVWNzQjFXZTQxK0pMeEZzMEVTMnEzclVlaTVEQ0FuWCtST0Rz?=
 =?utf-8?B?d2dVMUFraWNSUDRaKzJYOG41N0Yzdk1QTkN5M3RkcVYvNFhUVkhyWVprK05a?=
 =?utf-8?B?Qk4yZktuRThXc1k1NWhWY1UwbjV5bEFNTGRIVXJQZnFjU1UzY25wSmZieHda?=
 =?utf-8?B?VjNpS1A4WTNBa3d5ME4rT0N1d0w5YWNXTU1hTi9CeWVCa3RQbTZNdURiZVdW?=
 =?utf-8?B?YTBFZFdtVXhTZnBNS25vZWpPMG1IVmtHWHdkV3ZCMWc5cDlBSVRIVENxVlYw?=
 =?utf-8?B?Yk5FY3V3Z2Joc1VYUlNyMlF3djJlaU5tZjAraVBUMmlJMW1WWDJVSXNaK0dI?=
 =?utf-8?B?VEtKUmRnV1dTcDRGTm1IL3pSZk53YmJEazJacy90SVJQODFaRjFrVGVaRUJL?=
 =?utf-8?B?OWFqN2orQzR1Sy85T3R4V01DL0ZFZTYraW0xbkVxRndLVy9HSHJJZ2c1ZkY3?=
 =?utf-8?B?MjM5UklvdFZNOEovc1M5N0hyU3hSMllQQnNTZnNxWlZnSDY0dWJBemxjV3VT?=
 =?utf-8?B?cWZzK3RPQUN0Z2tRQ0YwcTZaaUdOL3JOUEo0U1lmK2g5OVU3OWRQelYwVkI4?=
 =?utf-8?B?YnFJSW5UQ25DOWg1K251WVljRHZJRm9oTkk0bm5kc3U4cTJualp5UkJDM1NB?=
 =?utf-8?Q?r4csyIOtyJxKx8lrkqbY/Eq1rQh4NanZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2hRQlMrR2hXNXUzSFR5b1ptWVdQUjgwQW9kRHR5TWdZRU9ReEswVTN5eE5K?=
 =?utf-8?B?NmFZODAxOXhlTjZqUk0rSURURXZDSFkwRjVnZWROcDUwTnFnMmhHbk4zcDVZ?=
 =?utf-8?B?bUc2ZDh1ZzBUZnM1akJDMDR0alhOamk2Q280K3BUMHBwajRXQ0dWSHFIOFVO?=
 =?utf-8?B?MXptVFNzMGZGdGkxbEhWYVlzb1ZDb0RlQWxGbWNHNkpGMUJFeDdFUTNUdWM0?=
 =?utf-8?B?ZnY5aVpBRkJPNjY2cHBBNVc3dlpZT3BzaTZlQTU5VXRRMTdZbVZFRS9ERitB?=
 =?utf-8?B?T1NOTmwvd1k5NmN0SlNQUWszaW1LVEcwa1o2M2xpWnZMb1RucDJFRE9aT1I5?=
 =?utf-8?B?aDdpLzViUHlmclhiUzRhZ3RyNHVRaFJxWTRnT3k0aktldVJtbjNzaEc4d0V4?=
 =?utf-8?B?aXN6S2dFTVZFUWFFUWlrUDBLZXpBTUUvRGh5UjZkWk56eDhqR2FZRVNwV3NY?=
 =?utf-8?B?VGdoUHZTbzBlbU9vV05xaytWRUdTSkowWldUblhyNEtud0dZeUJBSG95V0ZH?=
 =?utf-8?B?MXc4MjV6eVgxUGN3YTNjRVdrWlFUaWFBWVd5cUoyU1hoWXVyMWxpQldXTnRN?=
 =?utf-8?B?OFB4YjJoeVhzamc0SndhUXBKRWdTK1c0ZFMweUFUU052R2R3K1ExT0w0Q1hU?=
 =?utf-8?B?QkYyTkFISUJHY1ZpTW9OMGUxT25jSzhQb3NnVk5seFpSc3V6YmtFYzdpNDV2?=
 =?utf-8?B?R1d2VXJMd1ZlQThOVVFPMlpZM2xuUENER3hZSCtjVUtvM3h1TlQ5TExpb21Y?=
 =?utf-8?B?YlM0UDV2Y0xoeVFEeXRFczUzclUwS1JKU0VNQ0Z4c2NIMlJFay94VVlYaENC?=
 =?utf-8?B?Tk45eWEycFZmRDltWE1PaFlHb3UyLzNkajN1V0NOcW8rYVpMZVlEZmNsR0xu?=
 =?utf-8?B?ZEt3K0xPUno0UE9rQ2V0UnVmVDhibzB4dUVseW1vRW5ReW4rS3N0UW0ybGhq?=
 =?utf-8?B?dVQ4YjR6TXltSWVIY2FBb0cxaHNyd0N2dDBQU2pLdXViZkNseWJ4RURueUFz?=
 =?utf-8?B?WWNvWUswUGxLRXI5anZESFl1V1VFbXRiclBTM1JlTWxEZnZITWFKRnprSlE4?=
 =?utf-8?B?Sk5UclpyM0tGTklnSFE3SG0yV253aVg1c3BQWE1LdjZsQk9icWE4WEhaV0pP?=
 =?utf-8?B?MDFoUWpxTzJVZytqZElxdmRBellINmxVZHhYa1ZTQUdRZTloODhTSU1iNGtJ?=
 =?utf-8?B?NHNKR1luSUlxd3UrNlBVQjlPbDRIWGZIVXBBaFNMeHd6VlFaQzZyaDhaaEw2?=
 =?utf-8?B?SmZ5dDk3S1hYUVZXWVNBMG5xNWRtUkpNS0xkcnFnU0RHcjU5eXB0c1I3alRS?=
 =?utf-8?B?czJ5VDZuQWtlT3ZWMUNxdWVWbzNmbnhSNVJwUHIydVdLVEtTSEplazY4RWd1?=
 =?utf-8?B?dkZoYm9GekIxRG10L1F6NkpwaW9nZ25saXV2Z1ljcUNDcnlvUmhpUDVVME04?=
 =?utf-8?B?a2pjK1F6SWhHRDloMjliRmVVS0pta3lHenEwUFRTNjlRVDUxVHdCeUIzRGJV?=
 =?utf-8?B?NWVaclNEc2doWVo5bVdYL1hpYzlxTkdtUW5tOS9EeVFCMTN0aEJzOHNZanZM?=
 =?utf-8?B?bkRQRjBLREdVQ1lxSjdQV0diMysvd0dUc0dmVkhGVmpPWGZNOEorWlU4Q0Nx?=
 =?utf-8?B?R0dtdmxUTHJOYlJRa2t5R0NNVGdveTFEVnRrK01GYVJOdHlqMENEUkt2OG16?=
 =?utf-8?B?MEFXQWZxemFUbVo2QmZ3Um1PamFsNlZRbm53b1RLSjhzVXpHY0ZiM093NFli?=
 =?utf-8?B?Q3Njb091TWllWmNhcTZaaHFuMldDdWNIWWM2RTA5UlArZTFIZWw4eU1MWFU3?=
 =?utf-8?B?S1JhaTZ1YzRvbVdRWWZISE9NaWxlL3BKbGVVSFRaV2ZhK1g2Z095N09pSHJz?=
 =?utf-8?B?UHhjL05XYVYrd2laZHZ0OUdvc3I1OGc5Y1lnRjZVR3JjQU44MS9ENnpiN0to?=
 =?utf-8?B?Tm04NTIwcDMzV2JYVmxaZmZLNWw4TitWZlljVUpvVUkvWnlIK2xxTDAxQlRY?=
 =?utf-8?B?amMzN3JIN2lCNEFqNlpoTjE5cXJEZkpBVzBaMUJVZllCbGxYV2xxZEtqTnRG?=
 =?utf-8?B?ck40aGF0d0RCcnNuZGczb2dOYWxrKzdOOTcvOHdMUUcxRzMyNmRVN1pSN29k?=
 =?utf-8?B?cDBPcGJ5aThxZnhCdE5neXBBN2hSZjFhSWhVOXNQYnhtWkNlU3FkNjdFKzdS?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5fcd90-3faa-452f-9eee-08de0fe9a12f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:02:04.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9ibRmjX6cx6leitflWwm/l+sLtvq/GXic7XQHnPSoPuj2PbNlVKr+tt3eeokEzWoHEq1YYH2Ptfo5/hJmKdA5+12tmrGftUbM4v2pe4ZGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7567

On 20/10/2025 3:16 pm, Jan Beulich wrote:
> A .disable handler can't typically be re-used for .ack: The latter needs
> to deal with IRQ migration, while the former shouldn't. Furthermore
> invoking just irq_complete_move() isn't enough; one of
> move_{native,masked}_irq() also need invoking.
>
> Fixes: 487a1cffd71a ("x86: Implement per-cpu vector for xen hypervisor")
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

