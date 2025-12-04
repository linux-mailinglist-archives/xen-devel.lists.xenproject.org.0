Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E4CA599C
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 23:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178296.1502171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRHcd-0001qK-GU; Thu, 04 Dec 2025 22:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178296.1502171; Thu, 04 Dec 2025 22:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRHcd-0001ot-Cy; Thu, 04 Dec 2025 22:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1178296;
 Thu, 04 Dec 2025 22:16:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYI0=6K=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vRHcc-0001on-Dw
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 22:16:22 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5640e5e-d15e-11f0-9d1b-b5c5bf9af7f9;
 Thu, 04 Dec 2025 23:16:08 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB3PR0302MB9260.eurprd03.prod.outlook.com (2603:10a6:10:434::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 22:16:06 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 22:16:05 +0000
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
X-Inumbo-ID: d5640e5e-d15e-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub4MBmxF/b8/IGCerG0rFXrWl4bR+EkYOLJ/gQvbVNKmkrZzLMwXWunluTlSfHWSYr/iSZN6MrTIHSzHb372l96IN/uSkdu51WAEYmhWDLXVLqUUnOiBhjjFb5kiZspu3UVTl93qChJJnyixrJq3u/d1plEli8T56cbl5nvcR17JzNvq6AkhB89+uxQc/MNF07VCJw5SJUebTloaluWUH1MqcG2RDBvrF2XlQP5T17sM1kaYSDfsh2BbzI0Tca2NHSA1kLfth5uTNl9U8WnO6bC7QtLncMsnaJePXNyYiNNF/MFY7qy7LvH9HF18EpPF7vO1B9b9dHQfhGi/56nq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEpOz7Z8v/q7AWokUrghZoT+a2Ymm8BMWlMf6wU5JF0=;
 b=KnzUGMX83kOaQ5zDWx7K5+LRHCbqJINIixJtImpNQQRqepYvqlByEgQ74VvIAKZ2t47NI5S8hY6SUM5SdalIlmLXsjbXqZ5lms58JSk2L0cjtANI9EAdonPlDgv5b4BfuRTW9aemxjdXoPFr5odzLA30o+xcpL16KF/Jkdg+QnH0/4BUOVRL5Hp3HV+h2RaHmI2VMZCZavJFhNsEI3EpdNyghaYJXcRd+SUfCiiQCraciYZe3Ab4X95rj9Y1jdpqLskPHrigdJiuF2KgnAUPRN2CRGiWyoR7W1ikov4Lzl7A7Alsf5X20TBNCFAVnxFGJ8wEgCM/jHqpChLG+BEJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEpOz7Z8v/q7AWokUrghZoT+a2Ymm8BMWlMf6wU5JF0=;
 b=nU96XCtQRVfLclvu62NxpO5vJ/ie6AqLnSy37PURCwfH/iDTDeEL2FA9S0D0ioltTIPjzFM2/E3QDLrNjqAVNnllxx2J5PqsJyp2fSIyuM9T8FHhBRYWaSx998RoMVqTJg8AQOKxzeYmO5lbuxB5D+lGRrjNeqTyN2IfndylSB3BbhkQ5bu/zp7V2X7prhxqCkLGwCnNZZ8+yOHEyailh1mh4WSk9Nj5wMoIRqT1SoNL0e4qHW+wXSOIQX7EOVmz0Qt77rU0WCy8p+99S/4wXAvv3VTnBld6Thzu3OZyCZFG1GPFdRkd2Kd2GGhdwI6lYXzHusdGmSPJs3efm2z1VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <33a4d97c-8ad6-47c7-b42e-a5eaca7296d7@epam.com>
Date: Fri, 5 Dec 2025 00:15:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] coverage: add extended coverage capabilities
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
References: <20251203222436.660044-1-grygorii_strashko@epam.com>
 <d477a21c-b621-46bb-94ce-4775b2b6a90e@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d477a21c-b621-46bb-94ce-4775b2b6a90e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB3PR0302MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c21350-3e01-4cb3-4bf2-08de3382b734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qytwb3dSbVdrQUFrZWNQNWY2b0tJaUlER3dnUlF3Sk9vOXZuVjMwM2NiYjZo?=
 =?utf-8?B?SXBNOVo0VUNLcFR2V0x0aE9EWFZsZGs4QzlqN3VqS1RYRnZLQkhBV3ljaVN6?=
 =?utf-8?B?ZkswaURmRGh6Q2R5SE5ic1BseDRueDNnbG9xTGJxbm9PMHo5bXV5ZFBmRzdF?=
 =?utf-8?B?cHJ6SFM1Y01ORnhrN3pNczVjRHlJMURtWUpjY0pZTTVyWkg1Z2QzTWJuaGZN?=
 =?utf-8?B?RFhtcDlGaktHSVN0U0I3WFMva2dMZUFYdUFtb3RtN0x5bU8rOHNoZnVCR0dM?=
 =?utf-8?B?NldiQmRLMzlBam0wWXY5V21XUmxuRHlESDZkdkhDcDNBR2FsUmRNb1B4RkpY?=
 =?utf-8?B?aHdmc0x3aUhCcHdDZERpWE1VU3hwUEhJcmpBdlV4bDJ0OW9jYkdiN3VkQ3hV?=
 =?utf-8?B?THlkYnZrTXF5ZFBQT3dyMlVBN0NYOUF6a1hidEIya2JMN1BhRUlhVTZqaG0x?=
 =?utf-8?B?dTZlUWJ5VFJacThla2xtWkJBUExlNGxMUVl0UTkzUzdkTDl4cnZQSHlwdjZk?=
 =?utf-8?B?V2ZZVEVYNkVXUUhIVjBpd0lIYk1hTU5wZEo2MzN3cVo0MXJYK09BTU1VTS9F?=
 =?utf-8?B?Wk5UTWtocWVna2J3MmUxcDQvRWJEdm03bWl2NTV1ZzJpRkJWb2pwcThvZ2hQ?=
 =?utf-8?B?K2dIeWxMVHByT2dyaEQyWUMydHVjeklJdHNsWi95Z3NUWUFwNTZEWDErdEF6?=
 =?utf-8?B?MmIvWm15OVBwNVcrNVBqV1huS0xFUEhMNnpEMnJWY2RhOE5iR3A0M3VlVFNh?=
 =?utf-8?B?VE9DTWFmZXVJcFAvMnZRWVFJN1Vma0xHMitoWW9mR3BMMElaQ2ZUVWhTQUlJ?=
 =?utf-8?B?Wk9VcWtudVJQVk1xSEt4cmpPQyttRStkRitOUWxoVWhoT1hxR1JPcThlWjMz?=
 =?utf-8?B?R2xCNzVmdDRHTTZGcmpPNnJSMHF6UTRmeHg2LzhBOXNodG1iQ2pqK05XOHZn?=
 =?utf-8?B?MUxhU3M3WUNNTjFvQWdCWk9CM1BBamZxV29QR2RGSlAvcVh4ZkxpQUlmd2dN?=
 =?utf-8?B?ejZTS3F4UXZtUXJabzVBc3didUNNTnhQVlZnWEc2MWlTUHJobGVWVXJpWFA1?=
 =?utf-8?B?L2h2Tlh6REJVbzhBaExCQTFYcUFVY2ZGbFdqWFZ2cXRBa0REQUNzeWpvQlU1?=
 =?utf-8?B?dVZEM2s2N21Rb29RQkh0UTJ6UnZZUk11eDVxWE42SUxDWm9aSFpaWkRjd3dp?=
 =?utf-8?B?b3pmQ0lJYTZ5bFR4WXJnZmVTUVI4WHFwdjNoTFp2MVRqNnBsaFl3eHV5WDVx?=
 =?utf-8?B?M1dLbVcxV3RrRE9qdlhlQnJzbkRmbHdiUzAvSmZ5bUdvRUQxdU1XUTMzeUVP?=
 =?utf-8?B?VGhtRHB0eDJIdGF2b0NCL1ROTGpJbmRSTjRhbWprYzlZK0Z6cDRZM2ZJcjQ2?=
 =?utf-8?B?WXpyZk1WeWZmZ2lyM1JyVGFVMlp5eXpvSEJFeHRFajVoamg1STF3K1U0d2Fk?=
 =?utf-8?B?VDNXVERuWVBaSllxdDVMVHBuaHBwNFZpUHFhaG02VFZORkZFVVBrNG1WVVpn?=
 =?utf-8?B?Qk9NUXVhNmxFZlRSNFppa3Y3WVFZTlFWL0szWHlyeHNya3AvNVZFVi8rVmJL?=
 =?utf-8?B?RDlGS3pXTWtWakN3bEREbWI1QXI4bHFtQjZnSktxbWhqb2VNWW8wOVhCVnNw?=
 =?utf-8?B?RGdwb2tvaVQ3TElMSXNoRnNqMnJlM080Tko1OWZjeHpQcnZJZVNWcWVnNFpt?=
 =?utf-8?B?MWpqejhvbkMxWTMyODhxQWRROGVrSkJ1WnpLWU1wZlNmckZaZ090SFhrbFEz?=
 =?utf-8?B?SnF2OGpDMkVhL0hGZnM4SnF2b1o2RU54a0E1b2IyaHpIVmtENFI0QlQyaTZQ?=
 =?utf-8?B?VmRMeXYyY2N3QTBXdkp0OHpiaUw1bHJXaTZIalBSa0dzSzJLdGRBQ1lZVGgr?=
 =?utf-8?B?MmgvUk5RYnR3TEordEZvL1JrMzBER1ZUbkM2ZlY4NjdQRVZYbTBBRHZPUmV4?=
 =?utf-8?Q?CmKe6TBCyFMYJbd98ImfIdoBjZgfOqyC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTE3ZDlIZHBQQ1h1L3FseFZnTzNvcWVHWU9Yc0dRRElSY1NxZ0szQUozVVZv?=
 =?utf-8?B?WUY2UXlvTFdEWlVjU1paZUpCR3d4N0wybVZBUXpyUWpYbXZVZysrQ2V0Q3la?=
 =?utf-8?B?enlTaml3TldGbjRRQ1k2c0VhSHhNc0RKWkZQZTQ2ell4MEJCbVhOMXFIck1E?=
 =?utf-8?B?VHFKZmRESzVONHhKRmxtQURoOWJkamhJVU8vTEozVjhYcmRXM2YvK0hPWCsz?=
 =?utf-8?B?Rzg0RUFBK1c2MTg4eWMvT1IxVnIxOVRKZ0d3R1FBZmR1NFUvUURaUGJ6Zkdt?=
 =?utf-8?B?SFRpSkRuN3c4WCtxYnNpQ3VtckczaElEUnQ2UXlDK0NxODhWUkdqTjhtNkFk?=
 =?utf-8?B?Y050ZitpdWxKNGd0SDk1SUlqOTQrU0JvaFZiUGVZUWJpTkVqR1VIdzlHNFo0?=
 =?utf-8?B?ZTZvc2hwUmkzRzBmeFJMbUt5eXJFc0x0cDZNZTVRbnV3MmMyRU5XcXZWdzAy?=
 =?utf-8?B?Q0pSNldRcldad0tNYmdhSUtyQWtVOGR5QStQRXowT0FKWEU3bDlHWkdIRDBP?=
 =?utf-8?B?TGtUZythWlR0Q1JRRVlSQ1pVL1BQMGVSeVI3TDJwUU95ZlNUM1JBeUxlWnZR?=
 =?utf-8?B?eTZpVWo5NUJhV0QzZ09jeERwUlRYdHlVMEIyUHdqTE9PVktZWkJxd0s1TXd0?=
 =?utf-8?B?dW9JeDY5c0E4aTljdzkwSDAwRDBYcDR0c3FkOS9qV0o0VkZINzVDb29taHRh?=
 =?utf-8?B?L0lVOG9BbGJXUEdYbDFRd2grNUlGUnlPTG4vQWlHZVBJejI2cktBY2UvQmY4?=
 =?utf-8?B?WUdGeGdVL0N1UHRuY25iNFpMZWhkOEtyVkw1NHN0dDRPR0pqNVB2ellDN2pT?=
 =?utf-8?B?SWI5TlBJV1o3NFNhVXVlaHZFeHNkb0NaTWNHMjdxbnYvSkxUK3ZKa1V2RHVK?=
 =?utf-8?B?ci9WM0JGUDBtdDZnWlI4TmRLMGNFOXVuRUY0anRGMEJ5WThOUEpYVGVDWUh1?=
 =?utf-8?B?ejNCS3NJYkt3aWlybVlRdVNSQThlRGNIcDgrZURCclNKMHlxNkZQREREZ1dO?=
 =?utf-8?B?RGROY3FOUUgxSjUzRDV0bjcwa1d0WVdlZFpTM3lGVXY4cHh4aEx0VDlzRGpi?=
 =?utf-8?B?WDJvam5Ua0hmZGJsMEp2WCtkc0ltbzgySzl5YVZpci9HeHlIVWlDcmtBU1pl?=
 =?utf-8?B?YXA5TndqWG9VNlV0ZHI1WFlhd25zQkxBMjUyWkE5K1JaN01VdE9tb3RIbGdx?=
 =?utf-8?B?TTJXNThwNThoTjU1SUhGQ1JkblZTa0xzeEpTYmcxVEp4WWlyQUVkTDNPemJp?=
 =?utf-8?B?Z0NyZ2JKaXM3dEJSdnlxbmZvTlduS3RDWVJzNVRNOGZDdytmeVJoOVhVb1JD?=
 =?utf-8?B?UkJnSlpDQ2NWbU1tdHNuR0IxSlliRE0vK1hwMU5vVlRWNGV0NFBEeG03RSth?=
 =?utf-8?B?RERGQ2xXN0VzZVlzMnZHNEhPWjAvMGZocUtUdGg4QkhIQ3JKZ1pUb3NxVW11?=
 =?utf-8?B?ZVY2dWhKSEgzZXMvdjM3TmRWbnFLTHpnb2tBSW5kQlh1cjc1TXhHbVIwOWlo?=
 =?utf-8?B?K0YzTWVDZDJ2YlBKakpaRlFSWkNwTjJGUWhtdy9KRGxHWHJjSm56ellBOEgy?=
 =?utf-8?B?MmE0OHNpUnFkK3FoWVZ2Y2UyT3ZUNTNXaStydzZocEZxbFA0MkpHTXJrQ3VN?=
 =?utf-8?B?OHlibndab1RHS051d0R5c01DeDNSa0NKUFZYcXJRSGltSVB6MXhQN05qY0Vz?=
 =?utf-8?B?dEVvQjl0aUlWYzBZSW5BQXVlaE4yOGxSaE4vVGxyY3JBYmtpcnZWeHc5dTIy?=
 =?utf-8?B?OGY2ZTNaN2Q0TzZQTTk5cDR2aHBVNUhJKzhaRDFaVjBVV1ErYWVGekV6RmJi?=
 =?utf-8?B?anptelRBQTZZQ0IxbU5FeWlwZlFUeDdtTHZhTnBqOUNSU21QRVpyU2hvSmt2?=
 =?utf-8?B?cUVCU3V5cVlTckU4NHE0OE5xNnhNTlJYRW9GYlZjVlNOM3BzMER5VXpoWkU2?=
 =?utf-8?B?U0FtbzJ5alFrYUhhVXRIMnhrZDZERy9TdDRmTGNza2FMcERLcGh6OGkxVWlJ?=
 =?utf-8?B?VGM3YzAwendXYU9HY2JwMnhuNzNxVnY5MncwcHlGS0FnZkhoUlBQUVl0aTds?=
 =?utf-8?B?czNUTXBvUkNXMkNHei9IUDI3TDFkMXBCc2ZKaXdSNlJyVzFSbWtmeml3cTRa?=
 =?utf-8?B?NndCSmpXS1BINVVKeFVVUlNjVDBvbWwweHpTQ0F1ZXExQU01K09zcEViTFdy?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c21350-3e01-4cb3-4bf2-08de3382b734
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 22:16:05.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYvULseugfjvVVVvrGGgkbLwCreaczOZwCei8+3qe/a/2TLTI70uFRmZML5hT3TOKtkNBFCFPRdfzWKVDeIMVHKXdyCsR52YxqeKcms4mbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9260



On 04.12.25 12:02, Andrew Cooper wrote:
> On 03/12/2025 10:24 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Added CONFIG_COVERAGE_EXTENDED to enable coverage for .init and lib code.
>> When enabled - Xen .init data will not be freed.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   xen/Kconfig.debug          | 10 ++++++++++
>>   xen/Rules.mk               | 13 +++++++++++++
>>   xen/arch/arm/setup.c       |  2 ++
>>   xen/arch/x86/setup.c       |  4 ++++
>>   xen/common/libelf/Makefile |  4 +++-
>>   xen/common/libfdt/Makefile |  4 +++-
>>   6 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>> index d900d926c555..3e04e1a3992b 100644
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -44,6 +44,16 @@ config COVERAGE
>>   
>>   	  If unsure, say N here.
>>   
>> +config COVERAGE_EXTENDED
>> +    bool "Extended Code coverage support"
>> +    depends on COVERAGE
>> +    default y
>> +    help
>> +      Enable Extended code coverage support which include .init and libs code.
>> +      The .init sections are not freed in this case.
>> +
>> +      If unsure, say N here.
> 
> IMO this is unhelpful.  Noone wants to opt for the model we've got right
> now.
> 
> Instead, I think we want:
> 
> config RELAX_INIT_CHECK
>      bool
> 
> and have CONFIG_COVERAGE select it.  There's no need for any user
> visible option here.
> 
> 
>> +
>>   config CONDITION_COVERAGE
>>   	bool "Condition coverage support"
>>   	depends on COVERAGE && CC_HAS_MCDC
>> diff --git a/xen/Rules.mk b/xen/Rules.mk
>> index 2b28d1ac3c18..6d66a2332fb0 100644
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -260,6 +267,7 @@ $(obj)/%.o: $(src)/%.S FORCE
>>   
>>   
>>   quiet_cmd_obj_init_o = INIT_O  $@
>> +ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
>>   define cmd_obj_init_o
>>       $(OBJDUMP) -h $< | while read idx name sz rest; do \
>>           case "$$name" in \
>> @@ -272,6 +280,11 @@ define cmd_obj_init_o
>>       done || exit $$?; \
>>       $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>>   endef
>> +else
>> +define cmd_obj_init_o
>> +    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>> +endef
>> +endif
> 
> This wants to be something more like:
> 
> @@ -261,6 +268,7 @@ $(obj)/%.o: $(src)/%.S FORCE
>   
>   quiet_cmd_obj_init_o = INIT_O  $@
>   define cmd_obj_init_o
> +ifneq ($(CONFIG_RELAX_INIT_CHECK),y)
>       $(OBJDUMP) -h $< | while read idx name sz rest; do \
>           case "$$name" in \
>           .*.local) ;; \
> @@ -269,7 +277,8 @@ define cmd_obj_init_o
>               echo "Error: size of $<:$$name is 0x$$sz" >&2; \
>               exit $$(expr $$idx + 1);; \
>           esac; \
> -    done || exit $$?; \
> +    done || exit $$?
> +endif
>       $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>   endef
> 

above diff is not working and generates build failure :(

-- 
Best regards,
-grygorii


