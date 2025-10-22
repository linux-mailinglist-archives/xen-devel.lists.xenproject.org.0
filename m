Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A210BFB588
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147838.1479985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVqt-000583-Hu; Wed, 22 Oct 2025 10:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147838.1479985; Wed, 22 Oct 2025 10:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVqt-000552-Ee; Wed, 22 Oct 2025 10:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1147838;
 Wed, 22 Oct 2025 10:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBVqs-00053v-8x
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:13:54 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf18573e-af2f-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 12:13:53 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CH8PR03MB8202.namprd03.prod.outlook.com (2603:10b6:610:2c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:13:50 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:13:50 +0000
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
X-Inumbo-ID: cf18573e-af2f-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fc+i5COOxaLkJOHHB+gWyGBley7r56SsbIbQa0g2oBpzQZCHXLqkOI6rnxVWvNGTsESYNrIIVX9d8nI+SmfUrSZj2Ha7SEuIe3HawpzMswJ8Qn44/l65IVHIj1UrOJctOLA1Tg/58v2PVBYiJ2S1GG/g0P/QBTlHVz2srkm2Skw1pa+VkUHmu87J0ynX4IqyF0ZcakAtjHUrm9dhg8kWMivrRqk1WBH06Q+5+TeHxAXhCo7eAhGZglcq9Cdb9gzNht/lMSV5QvqXEeXnHwAlabJsvNjbjjDGr1p3Kwy9LbhbPp9cJTYd94wzZA+DUKkOqvXQBBOW/55qIvewNjN1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX+8kL8hXMd+fXcnSs+8jpvv8rpvGXSdcl7GagP3dsQ=;
 b=juqyIUmqoUYHVLP4Fnc0MYfsBAnSwxCeBDGUaNUApYY9lZAhd4Jhj6yl15yHxpl7LdFB1Jwn0Xh8m6zFUKxFPRNm8khCuNDUyfsER8wyXfqO3CPMRKpxBZbtZg30NqAdDYyl1IeJsu14qLnK/PXMuEsqKK6SoXP0Jab3z4caexU8OxZSQI0BGdd1D9S8HVjgDwjvcUOm+u0HT11llFmXO/I1z81LQQAFk/ayVU6esayWFUEarp6XrcDjARahCo23OvqWX6XtMh+JnYX2D2Kr7wkSLI3cGMlqhB0buMJmiwOS6SiokdSNRy0LFDwaW1W3Sxu7cIjeZ4PMQEQaK8F+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX+8kL8hXMd+fXcnSs+8jpvv8rpvGXSdcl7GagP3dsQ=;
 b=eitCO8Hefzjz+wKI6FgUV/jurHPORHueRtXSMirfatKlDVOEWBcpDaIJd7Ky+lzmuCpB5dOW+JT/iXERUlFNYxrwGc6sw+VrZU865krsBJju8oWRMkyP56OcNUy0/ew6pozf9lDR2DiYi3hhSPwsRsF6KEMRUtd2ql1TeYdgHr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <413a2226-bab8-41d6-b858-0255e25ee96e@citrix.com>
Date: Wed, 22 Oct 2025 11:13:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] vtd: Collapse x86 subdirectory
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1761124632.git.teddy.astie@vates.tech>
 <0b9cda94fc8b69563a5f8783d6bc3ed22b0531d9.1761124632.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0b9cda94fc8b69563a5f8783d6bc3ed22b0531d9.1761124632.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0390.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::18) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CH8PR03MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: c89d3032-2a28-4685-5117-08de1153b21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUF0Z3hKYm56cUhVTVd1K3NoengwWVdqNjcreUdJdGJ5WjVlZnhVMTNVNkhm?=
 =?utf-8?B?L0ovZ1RZMEgwQmwvbGVycU1TN3VLSlY0bmZiQnJ4TzdPR3RJalJMaVNqY1A2?=
 =?utf-8?B?Ymp5KzRhU05iVGlWR2x4ZXlsODNOR0xRNDRHc21pc2IxcU5yRDQvcmk2SHhO?=
 =?utf-8?B?ck9JUXl2dzNBNVMySDJHY2RpTGdaR0pOUUt3Y2JMRk96aXJ6dXo3Nzh1MXdu?=
 =?utf-8?B?NE80dWE1SEFVQWVpbTZRVXBDWUxuY2tmN2pXaG1OZTJKTHMrbC9vWlRUdUFK?=
 =?utf-8?B?cU9JN2hQNWFXYnY4dGNaV3M2M2l5V0pFN1JRN2swVEhIN3dZNnMyR2xYTUZv?=
 =?utf-8?B?bURMNUNDODAyczRER01oME0wOUk3amVSUjFkTVhvZURmNHBsam5CK0dSRGw3?=
 =?utf-8?B?d25mcUIvOWpOR2YwUUhBNW1uOUs2b0VDem1MZFl0eVlUeTMrYlZUeEtUL3Uy?=
 =?utf-8?B?bGpVRFN3VHV2Tno0VHZyZStSYkdoUkp5eEVSVVF2Y2RtTTdnb2NJRG4yMGZW?=
 =?utf-8?B?WnVOZ2YvUkNaWUN3MzJrbWhZZG5QamhON1NwMitlQlZWVEhjRGhIZC96bm1w?=
 =?utf-8?B?UmNIWFhYS1VRVElNcnZ3Ris1TE9VL3FmU0xoN2xxZlR0RDhPSHdXc2xjZU55?=
 =?utf-8?B?aUtTRm1GbENRakxZaGNvdkxKcllmN0JQbTBHNk9vdUJ6WjBLZTJCeHUwS29L?=
 =?utf-8?B?bDJQTTkxdjNzWnIyQURyUU1LaVpwQXcvQk5hMmVrOWNicDIxdmdUOFRWTktG?=
 =?utf-8?B?TUMvS21ZTnU4SStOSUtST1VFeUR5U25VNDJERTZvaWpuZ0pLSG9DQ2hoN0M2?=
 =?utf-8?B?UG1zQzFsNTJ6NWZVa01ZK0N1L21FQWF4QUV5ZGFpMnVKK2pHMkhhTTFxWkF1?=
 =?utf-8?B?YjJXM2ozZHA5bkhlL1BsUzNEUEo4QlZLUXJrWkdPc0VEeWhER2d2b0ttck9y?=
 =?utf-8?B?NW9WdTY5RGcrS3o4N01DRi9LbFdCeEgra2RqU3NndWJxdGcyZCtnTEluL3FN?=
 =?utf-8?B?OFVjWG9iNHlYQlR3ejFEQmwwU1pmMEJDeXdwdVQwS3BOeFRvbFJMNEYxNGZG?=
 =?utf-8?B?K1dUQ0wvdXNIOWxhTFJ0dklzT3V3ZjZSZXNuNXMydnk1T3lFOFFzN0tSQU5u?=
 =?utf-8?B?R2pYcURVUkwrWDVNdHdzc3MwSEQ0eTZYK3NpNll4MUV3ZkNmbWJwZXU4bkhj?=
 =?utf-8?B?WFlCV3J1b2lDNE0zWjQwMUNSVWo0TzlnalZPZnJCN2hhempIaENhdG9sUFMv?=
 =?utf-8?B?MklMU041b3huZ3dJQUUwb3BaUGQwblhKQTh2S2NuNCs5YXlwMWEwbHprK1BT?=
 =?utf-8?B?WE96Mjk3RlZsQ2FWUW5ORUdDc2VkNkdWMDhNdjlicmRFQzBUNzNiQW4rSWVV?=
 =?utf-8?B?Uk9Ed0dpY1NqYWJTYWVqN1haMnBUS2c4bExYTmtzanNjZklUbythd0NPUElj?=
 =?utf-8?B?Rmt4K1hOcEZtbjBrMGw4aGtqTFhsektqbENtU1FnWVVSbEcvWDF0aytROC9i?=
 =?utf-8?B?TGJZeExMZE9SWEcxVzlvQ0wrUlY5NmkwdTFuWHIxNVZOQm9oQVp0ZlRRWnM1?=
 =?utf-8?B?OW9vVVRIN3VVME1PMzFqV2ozejhOcmpxOFZCS1FJT2RIeWtUSjlNZG1YM2N2?=
 =?utf-8?B?RG5xMzh2aW1Ea2lHMEJISWIwdUZkdGtlVktEMXIyUDllbXNvTzJKbUk1YlY3?=
 =?utf-8?B?ZThoSjRLUnFya1FGU05UTDNvbWZWOFNBVmliT1FsWGI5TDVSdGRQSzgxZGda?=
 =?utf-8?B?SUlFNU9iaDJlZDAvaStGa3lHOHBuNE95Y3BLMk1ydVA1UXowSWdyR2dUVjU1?=
 =?utf-8?B?dHR1VzRsS0RGYmtpMG1MSzlrTGMxcTV3ZmhFOXQzWWdHTHVLRHdNejB4Sk9q?=
 =?utf-8?B?U1V6amZjeW9zc0lRNUdNVVhJaFdNSlI2MXk2U2dOMWpGUkVQUVFyY2kwZmx6?=
 =?utf-8?Q?Jdq2qsxbrSf/lYscOyNDG2EzDH+smsaR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3pkaFBReEk4SlBXQjFBb09uNWZ0OEIxV2c4bzh6ZVhsYkRVVjVlRUdmaHpE?=
 =?utf-8?B?OXZJbVJtWSt6Vjc2MmdPb0YrSnVWbUtDYlpVTzVHR1p4eXRVSW9SQzJENUo3?=
 =?utf-8?B?TWlyQ3NWUmR2ZGlyVkh0LytnbklzSGxGMXoySTF2K1lRVloya2xZMzIzcXB3?=
 =?utf-8?B?NUpXdlpOaSt3QVFhdGxPeUJkbCt1Wkk2SkYzemFObjVheEo4NWxBeUdHektR?=
 =?utf-8?B?Zk54eDFibUN2TVRsM2lOQXROemxmNnZVbk1qcTBBZzFQN0xXeHpMTEFIMjlJ?=
 =?utf-8?B?SWFmWldNcUFtTUlTKzlCbUtBYU5PZVpCT0xlbGlWeXBnZlZkeEZaQXZRWm1O?=
 =?utf-8?B?Y0JpK1lSMklaWEttNkhrN0ZORlFkb1JOUjlJSmk0dXN1OVM3WTgzL1NCTWZ4?=
 =?utf-8?B?OTZyYUtrTmdJWFF6dktsN09xc1dobGFLOVE5Qi9sQlIvbXI3OFd3bDM1c0ZP?=
 =?utf-8?B?d3ZNbGNwZktOUlhiUDV4UGI3cmRhS3RKRVp5aVBaMUNVZnZkTVFNamJVYS9z?=
 =?utf-8?B?M1E5WU83aHQvQmtvN1B4VXI4d3B5aVlZU2F6djNsaCtwOEZqUnBSemtXTGlD?=
 =?utf-8?B?cmtpc1crQU5VSkVQZE9PRWxwbXR2eisvRm5yT3dmbVRPeG5ubDNkcDlySHFP?=
 =?utf-8?B?ME5ha1AyMFhyQ3hPT1pady9VR0RWMnl0Qkd3eEI0TFAvSmxrOWt5aU9NT3ZN?=
 =?utf-8?B?Z2FqY1VwZTYzNmt5SUFwR3p0ek1SVlVxYXQ2UWdLSEROSHo2bHFETGFrRU1U?=
 =?utf-8?B?TEJHNjVzYXBMQzNwT2tqbUo2ZWl0aWxoaHNzNWlvUllseGM0QWxwUUEyRUxx?=
 =?utf-8?B?bUVqTzJiLzZpVU80SEM3OE9qdDNSUTNlRHFXeU1pbHo3WWhweUNockxxVXBh?=
 =?utf-8?B?WVpMbTQ2YVNDcjRaUWcxZlJ1TmFHNXlUZU0xMEVzWFEvNzAvZGJpRlc1emE4?=
 =?utf-8?B?aW13RTY1WEdxNXlneDNzVjlaNTA5Tjdta2VNMi9ka1VPMUNMWlA2YUJpemlm?=
 =?utf-8?B?NWlIUjIxWjNpV0ZRbDFaZ2REaGpvVi9laVJ0S28vL0RYdndqK0hia2toQ09z?=
 =?utf-8?B?aUxYenpuc3Z1M25pSDZ4d3IxeHVkcGdYVXg2bysyWm1YbnhiZkFtMlBYTzVW?=
 =?utf-8?B?TE1ZZ0lvRVprM2lrVlJUWUJYY0g1QXZnWHBFN05ya2YxM09CS0lZdDhtdkJ5?=
 =?utf-8?B?ZCtCQ1BhdytFa2ZvZXZEWlM5eG5vQ3h1eGdLTUN5NWJxMGU0KzBvdllnbE1M?=
 =?utf-8?B?ZXBUMDJXRnpscWNWY3czS0pqdFpnTWtpeTBsQ0ZsTkNETHhyck03UjF0NzBP?=
 =?utf-8?B?ajhsZGFqSlFHZVhCQ29VTElUR3Z1NWc3ejBrZVZ1eHE5Q1ZxSDdoQVIwbnln?=
 =?utf-8?B?VlVpQWdCam1GWUF2dFZyaTBSOEJmSWFURlc4ZjJHd2dTMkh3U21idFU1UlFn?=
 =?utf-8?B?bGMwSkVOcWVDazJUdWpkNFZyNEV5OTMzb1NWcng1YWhnNGVCOGNYYldpbXJP?=
 =?utf-8?B?RGN5T0FrK0hUYTgvNzgvbDhZOXloS29Xemp6bXZlR2IxNTRCSTFmZmZxWnkw?=
 =?utf-8?B?ZG55elpZUExQeittcVg2bng5S3FXdSsvY2FkQ3QzZDNWWmg3MlQ3bmxOTXdt?=
 =?utf-8?B?VWFuR1dNeWhHNkNjbkZQWEduSURjcDVRVnlQYlVaUUlwVWtaTW1nNGE2bnFR?=
 =?utf-8?B?aEZ3dHBib3cweFFYTVp2VXZDZG11U1pEbDQyLzR4UkJhQnJiWEwvN2Vyd0hq?=
 =?utf-8?B?NzZMakp5ZkE5dWdON25aV1pZaWFiRjVCSjVlRlVQTWhWZjh1RDlaQjY5U1NO?=
 =?utf-8?B?ZFdsQ1R1VGZ6SnVnK2htQ2RCMy90dU1xZzg4YzRPWWpDa1lrN0NJK3BlRFM1?=
 =?utf-8?B?cTNqZ0JGZlUyTE9VbmJRR2N6UGRaMCtjRkNlRTk1STd0S09kcm9MOW9nUDlw?=
 =?utf-8?B?ZHFIS1F3T0p3blVCd3VvaGdoU3RMb1ZkRlVsZFRiSkZUVEtzR21yUjZTUkxB?=
 =?utf-8?B?dWVQTHcrbGZDeWNmNlUrN3I0aUwvMXhhRmltM1oyUHhHQ2hRSzJhTk45dzhQ?=
 =?utf-8?B?SjJzSG9DWnJDT2Q5M1d2eExsMlFNMFpPSmJVck0zVU5kSyswZzROdWRGV3RY?=
 =?utf-8?B?UHVhYTMyZEl4a2l1aEJWaGxzSm51SnNNVXp1MnRDWEVmMStsMUE3VVNDOTlD?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d3032-2a28-4685-5117-08de1153b21a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:13:50.3145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TahZ63vKtMKrwm2vZJvPfWf7+ZhXvb+oAzjS2Jca4psGkAKe4jk+OPNXqnkFM+lh+Ca4dIm2LaNxYuXXynksoyXaDKrSQVEw/f24Gq8wB5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8202

On 22/10/2025 10:51 am, Teddy Astie wrote:
> As VT-d only exists on x86, it doesn't make sense to have a x86-specific
> subdirectory.

VT-d does exist elsewhere.

Xen (via the absence of ia64 support) only implements VT-d on x86.

>  Moreover, now that vtd.c empty (once we moved the deprecated
> iommu_inclusive_mapping parameter), only ats.c remain which could be moved to
> the upper directory.
>
> Collapse this directory to make the driver structure clearer.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Do we care much about iommu_inclusive_mapping ?

What do you mean?  The functionality, yes.  The top-level option option
that's been listed as deprecated since Xen 4.12 (7 years now), probably not.

But if you're going to delete it, it should be in a patch of it's own,
including editing xen-command-line.pandoc.

~Andrew

