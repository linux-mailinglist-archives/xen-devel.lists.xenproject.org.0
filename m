Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEMEGno+c2kztgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 10:25:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA35733C4
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 10:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212087.1523397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjDPT-00020s-41; Fri, 23 Jan 2026 09:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212087.1523397; Fri, 23 Jan 2026 09:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjDPT-0001z9-18; Fri, 23 Jan 2026 09:24:55 +0000
Received: by outflank-mailman (input) for mailman id 1212087;
 Fri, 23 Jan 2026 09:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vjDPR-0001z3-EV
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 09:24:53 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c196205-f83d-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 10:24:48 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SJ0PR03MB7127.namprd03.prod.outlook.com (2603:10b6:a03:4e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:24:43 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%5]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 09:24:42 +0000
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
X-Inumbo-ID: 5c196205-f83d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcxBNtmW7t3mn1NlRSzkJQz92X6xBIHWGkdf60GOpfj0+zW/YlXALtRYU49Oa5yqhde/6h8yGvTXG/P3TJj4QaV5WofhFltzT61XrADjFuJqKir3mBZvmV15xKiYEgWQSuXjyCcGMD6cEGWRA/eFH3a0OPJH6rCc+nJ4fBdOBRdFKniseDXxhRvhs7BpT0YDlFBXM6dsY06EbdUh94aridZy7pdmLd5sfZDnhhpYaFon2quiFwjFaGj0OHypCeFiOkjotFI4EgiqfYcAlUwnAHaFLSGNnrqt8jlNwZNW9yW2iRkLS4elZAsDXQoNAbhzPLRlcBlhsKnpt9Wqb1cMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmTpNVi3r6er9zMHlLRWeHxm8slqUa3wab6mLxwHHzc=;
 b=O9GIXRZWuNSff2qJnlxD+7WcMPNqc2F0mzeGkl4f96AUJGmZu4k1qWhKcMI31nF9hGKbL2W0etqCX/YtpPNLi1j7do5a6Wr4sibJqaO0H1Sasu4QRPSRuuMG7wjE/CEG7VMsaF3SjVJrl8WbHIR3pxGzMjUqwkdLUhVs0nqrtRb5TwSQ/19eiusqM/oAyRcWZyvs+SEBjXSkoiQKL/CtO6P/9FECAJW2vi38CQsP2UYGtQKQ282vuwOyVFlParbxr+dDhG7e5X/eP8hrv98d1KN6EaeffOJ1N+/H7RVOelf1iJntoTKiTJH0XcBFCKyJ002pKWm/dpfVrLgywavzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmTpNVi3r6er9zMHlLRWeHxm8slqUa3wab6mLxwHHzc=;
 b=FQOEidZKm5rsVU6598qOtq+FbjQ3XaKVttdiTsCEUzZ+Ajrxln+zuCBBP3iqEq887gIMFh7Jvh6+qIhscflSkaTn09+yuriaK+ICClRDx9LbYChmJi24M6ZV85f/anCQWb6fLGzhy1CeObiPvQVNOUJdt+Hg2dvmL5QZadAgVkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 23 Jan 2026 10:24:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: MTRR init sequence in Xen
Message-ID: <aXM-VlfMTXW4Pmjw@Mac.lan>
References: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
 <e46ceae9-0680-4fb9-adb9-84530745fa4d@citrix.com>
 <aXJgNUxe3kiqlgaW@Mac.lan>
 <64adf935-1fd8-4d3c-b9b2-cafb0e065463@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64adf935-1fd8-4d3c-b9b2-cafb0e065463@suse.com>
X-ClientProxiedBy: MA3P292CA0060.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::19) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SJ0PR03MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abb09ed-c068-4726-391c-08de5a613dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW9EMzBZMU5Cc0hsL1l1R2Z2c1ZRZG9XdTJwWWZqV2N1TDFsTzJ2NGJPT1lZ?=
 =?utf-8?B?NEU0U2dXeHpGNGJ2RHQwYmN3RHlMUHZLSHdJaHlZNzBRaXlQUEk4cFpYS2Yv?=
 =?utf-8?B?RmVpWVhMM2NWRHVndXUvVnBSdGg4cmZiSzBBRTRsUXc5bDB5aWloK2lqNDQx?=
 =?utf-8?B?SHk4aWNvQXVrYURWR0VSRHJVOFp4Q0wwV2krNHM2Y0g5MUZkVFdnRXI0V1d1?=
 =?utf-8?B?UDhzOWRFTEhReDRZcW5kUWpBbS9jRWRyaHRlU1B3S292ejdqSmpJdXN5ZmFL?=
 =?utf-8?B?OThlVzJaWHpOMnRudE9BZU1hMTYzOWlYQlVOZEwyVE5ZZUNLYVAwWnRzUjd5?=
 =?utf-8?B?UStQM0diVVgydDhMZVAvME9jNm9jc2Y1b1RHZFY3TGZzQkpnSlUrS3pMbElI?=
 =?utf-8?B?TVBxVllENkxkdzZmV1V6YmVoWkNLcm9LMlU2Z0ZleWd6ZlgzWWhKTjdpWW1Z?=
 =?utf-8?B?Q3d4YWdqRm1DSCtZVWxpVDJvT3Q2dUNUbWx5bitmVzJmejhSdVlQY1l6NTli?=
 =?utf-8?B?N2ttQnJrd2pXL1NUWnlTbmM5amVUb1pZSFFITlhXTUJBY1h0WGVGODRGME5G?=
 =?utf-8?B?V3JVYTNVc0NjbUxDSGJvV1crRHp0TUpHSG4yZm53NENpMEw0N0wraithakpi?=
 =?utf-8?B?aCtaWTVCajk3NXlBWENQUVJyNU5JbHJqUjNqOE91VmYwQUJBVmo1T093OTVQ?=
 =?utf-8?B?cFZUMXBTVU4weERqdXREbHoxcGR3RlY0UkZEU1krMU1uWGpLL0tKRStPSWZI?=
 =?utf-8?B?dWxCNVdsV3M0d01tajhnL2lseUZpdG1qUUM1MlA5dnQ1QXlHNlp0aUw3Vkla?=
 =?utf-8?B?TEloTXFvOVBkRjhOb0tuQUxTNmtIM29xOXpZbncrTjY1Qi9LRVRPTG9iK1Fh?=
 =?utf-8?B?TC9GYkp2d2VlMk9sR2MvSGhJWFNOWTg3NjJtdXBicm1YZ2ZCdkZpeVpLM3JZ?=
 =?utf-8?B?M2pwYmI3eHhOdGJHMWhrVTI1WktMUWlqdjNMVGZ6NmMxT2VvUlBqVDN1c0Jt?=
 =?utf-8?B?T3E3c25TN2kxYUxOOXdFUjFJUFJwSEMyTDFWUlVqUGQzcUFMQmMvL0xrYmF5?=
 =?utf-8?B?akRuUUxXNys0RC9ZNjNUbDFqYjROOEJjNEVjOEF5QzRXblhMVVJhYWdCUENG?=
 =?utf-8?B?TkpzN1VXUzlhTk1UZFBBbUo5SVVqQXZ4Vm9ZU2Q3cXNWYUFUd1YrUU9hODlo?=
 =?utf-8?B?RHJDL2ZiSGxGcUt2NldCM3Q0NWJCZE5MSnV6dU5objZJRHlRMU04UDdCRXh4?=
 =?utf-8?B?UGRGUnJMUDRjRTBrNXBCTlA5L240YnNpK3lmaGtScG9zbjJYOGpMenZtY0lL?=
 =?utf-8?B?Mkx2UndCRWpaMEFsd0toem5QaFViM2VBMDVzbWwreXpNV2R4SWdsTjRPakFR?=
 =?utf-8?B?ZUg5VEdwOWY0Y0h6OW5nRnZoYWJ2NTZVbmp3RzZUcW1TdmRGeG9oZ0dHR3oz?=
 =?utf-8?B?Q2syZ2RzMGdTcW5uUlRuazdwdmVEdUdMU21hWlBoVm5ZdzdyRnNnT3FUblN4?=
 =?utf-8?B?cGUzdHd5eDJydHV2cnNVMTNsU3IrYmZZNTFtMjBZZmtrM3FMalMvOGp5QTVi?=
 =?utf-8?B?YjkzSzVDME1uOXE2MDRGWU1RWTU4OWNvWW1RVDBXR2tzb1VBN1FXWmExRDJE?=
 =?utf-8?B?cElNOEkvTG1GWEk2djZMUVMrc0F1TFdMVU03aHBPL3NuWFJ4c2pXKzFLR001?=
 =?utf-8?B?WTI0ZzAyaytralR4RlR1VElEMlBCVmZPWTE2cExxZVBKRlJvSnBMNmx2NDd0?=
 =?utf-8?B?MUhCQlFvVnJFSDhvT1cvNTJZUEdGY1VaU2pJckdkZ1pFVTRpZWtIbm9BOCtH?=
 =?utf-8?B?NENML3pvZXgrUU9vQWhtc1JzK0JjVFRUTXhSRHpPUEx4NHhlWU5wenUyMVFu?=
 =?utf-8?B?NFFiMDlPWDlWSWMyL2lwRU1ydnZ1QXZjZXJ0RlhXNnZSVVltSHg1Q3ltYWFa?=
 =?utf-8?B?WXJRdEVBRFMrZ1o3MWFway9JTFVOeXFKTDN5cldmdmc2NnlrdFVNSWt5VUFY?=
 =?utf-8?B?VEtLdnNYdnR1ZFNQbENkZXVydU5sWGRYMUVPRWV0ak9ORXhqVTIySmptRjdk?=
 =?utf-8?B?RERENXlVdm14d29kYS9kYjd4RXF0aFgrWEEzcFh1QnVoMGtQTHlHdHZhMmx0?=
 =?utf-8?Q?rqPOJBL7Rk4WzV+YVyaEn7iTA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzVQU1dZTWUvSXJYU3VjMzRacTBseTIyRlI0TFBlM1NXVXRsRVpDb081Y2Qz?=
 =?utf-8?B?d2JVVkdpSjJWYU5HalYyOHhBc01SYjkyKzRQaEJTYWgvYjlEckF6a2tQaW1n?=
 =?utf-8?B?a0RBTE9aWkxWRHQxNTNNYTVJU09TeCtHWVBaeThuRGQzcEdYNG1UekNESGpt?=
 =?utf-8?B?VlhXdWZSNFV4VW5QOTAxYkVmaG42YnZHTHZIbFhvQmlQUExGTzFvaTEyMGly?=
 =?utf-8?B?eHZtU2cvOE9vNEl5SWE3VWE0Y3U5bW11RktkRzZLR0xVZnpkOGF6ekdKRVk5?=
 =?utf-8?B?MWx3VkE1ZTRwNXhFd1FjZnRiVjB6YlV0cWNFTUo0K2s3WjFZZmk4bUpoME84?=
 =?utf-8?B?T0hYbVNJMU5tK0grb1pzaGtVWWpXOVFTY2xlTUZlRTcxK0FkSVFRazFlOHNp?=
 =?utf-8?B?YkdMck5DZkp1dGtJaU0ya3hQOWFodDVsSm5xVmpkdUdmaWpveE54ZHN1Nldl?=
 =?utf-8?B?M2YrUnhpTUdJS1daODdnK2xQM2xXZk80N3k1TGQwTzlac1hlSVpZbGIxZ2Yz?=
 =?utf-8?B?ODhUQU9oanl6WGdEOTdKYjRQUjdtb25wQmZuT0poSHpIbzdpMVB3NzhpYnhw?=
 =?utf-8?B?T1Y1RkpXMDArVnFqSzB0TlZXajhISzdyQlJLTU4zaks2Ym5MOU51M25VL2Vp?=
 =?utf-8?B?MlNENjVSUVB4VDdRZWlRakY3Tk5oQlBhOWUvNklIWVI1K0cxV1p3Wmw0MFJZ?=
 =?utf-8?B?UUd1QlR1ZTV2cm83b1U3QVdFNllZbVpONkVwYzRUUlBjdlUzNldNQll0MWd4?=
 =?utf-8?B?Q2NzeHFmUXpTYnYrMEdJWFB5MUdCNkdEVkNYbzh1UDc1NjFMV0VsandTZmda?=
 =?utf-8?B?WTlpRjdQaERwb0d6bjdmYkVVWFhnUkQ0eWhEOHU4WDU2d0tNS21UNS9uUEZi?=
 =?utf-8?B?T1Zma2Fza1dxUGQ1Y1FrQWFySXE1M0tOdDJRcS9NM1pxM0ZEZTlMNEFSWUln?=
 =?utf-8?B?YlB6OHdwRk1Qeis4WGVGcHpsbDFHTlZ0V25rMUpJWDVWVjM5WWV6VXdzRWU4?=
 =?utf-8?B?alZybXZ5UDg3NU1Ca3ZPdzZDbnlOMW9LTHVYdGhUVmtCcnVJa1JmeW0vVHJj?=
 =?utf-8?B?bnYxa2JrYjBnZDM5QmErS3lzMWM5blZjRlh5NGNadi9TVElnUEFKNkxwOWhC?=
 =?utf-8?B?dzhySG5GTk5jQmpLUVdXbVNXWWRmWjI2UmtzdERtcVpDcTd3UWF6OHc1cDY2?=
 =?utf-8?B?NHo5amsyejFHL0VYa1NmclgrMnVIQTdzM2xabXFTNmU5Mnk2QVVad3lCd0p5?=
 =?utf-8?B?NEl3SU1Rc2hoRFhYNGRNd2E5ZE9WTHBpbHJjaTVTN1dwb1hFSTVNd0RneTV0?=
 =?utf-8?B?bUk5OTM2eVdTbytpS3YwSW9MMjBteHZQQStpbTRWSjFnUXdhN2piZmpVcEhw?=
 =?utf-8?B?TFYvL2NHeWI4YmJzb1FqSUVIeEt6VGI0NGxobmplenV2b3NJOHpLdGNSQ3hC?=
 =?utf-8?B?aWxndnJGZkxTUFhKS1lkeHd5bi9VdEU1QnV4Zjd2U0pWTkwwL0ZBUmVQcWti?=
 =?utf-8?B?OEZyVFFNUVk2RjdUZFNpVU8waUN4enJVdzhIWXlUNGJPS2hnbitWWXBjeC9q?=
 =?utf-8?B?eGo1RlA3OTR0bzBUNmNnS1JiZzRaUitOeFZrRzVjN282bFhzcVhCN2VvbmlH?=
 =?utf-8?B?SHBrK1EzWlJvemUyRW9aVEhyL0xMQ25sRWhzUXdlTnMyUmFzYTBndlBwWTl4?=
 =?utf-8?B?SU9Wb1hNQW1OcGMwVmdBckJFRldBZWVzZ0xDTjZlUW80YW02REFZdUFBYTRL?=
 =?utf-8?B?MFJRM0FWYVUyVmpCSHQ2SmRuY2JaZERTMWJUa3VVeE1tTnQrckN4N1hla2VK?=
 =?utf-8?B?NktoUHE3bnRDNk1rb0h2UGZEM1JTaDJIL0hRY04vSlJJRyt6ODgzTFJVMWdz?=
 =?utf-8?B?SktxQTFzV0dSRyt2WkFlYVp3eXpId2RLZWZWVHhldEo3U0oyWHZvTHVPTG45?=
 =?utf-8?B?ei9hWmpwWk9ENFhlWVlTc2liU001K1o1TEtwS0V3SW9xSG5GT2o0ZzhQMHQz?=
 =?utf-8?B?NnVBS21jU0hGZmZRbGtTSzVxcU9YRDJMQThtbHhYMDZyM3JnWlFXOC9KcUIv?=
 =?utf-8?B?WEQyTDByaDF0dDlFU2VVM3RMSzRvam0vVi9FYjh2Z3plUERDZk83a1dFazlK?=
 =?utf-8?B?MFNYaGNYSHNyaUtkOWJMTkxzNjFPa0NZeE9ZcEJBNVF1a0xCTUZ4NEV6Rmlm?=
 =?utf-8?B?R1NvYm1ZSGd0NDVqbUl2OVN3YWt1OTNickQzY21lUUE2T25Yb3Vmb3dXQmU5?=
 =?utf-8?B?NTIzcEc2dUFxODVFYWdqa2gybGxraFVjR0RCenY0YUo1WEplUWlnSWY4T1lS?=
 =?utf-8?B?RTA2d3pxZTMzcyt6dE5yZ0NLL3hsbldZQlJ5ZjBpVGR5cnhvLy9kQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abb09ed-c068-4726-391c-08de5a613dae
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:24:42.8952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZUD5vQZnu6fgko6MreMlTEA5ERBRCXCa0+C3eUbzoKyKEikiiiWkuVUsxGchiOAv6WhddUHEu6kTgpGXyCjTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.531];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CFA35733C4
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:24:11PM +0100, Jürgen Groß wrote:
> On 22.01.26 18:36, Roger Pau Monné wrote:
> > On Thu, Jan 22, 2026 at 05:21:12PM +0000, Andrew Cooper wrote:
> > > On 22/01/2026 3:56 pm, Jürgen Groß wrote:
> > > > Just as a heads up: a hardware partner of SUSE has seen hard lockups
> > > > of the Linux kernel during boot on a new machine. This machine has
> > > > 8 NUMA nodes and 960 CPUs. The hang occurs in roughly 1.5% of the boot
> > > > attempts in MTRR initialization of the APs.
> > > > 
> > > > I have sent a small patch series to LKML which seems to fix the problem:
> > > > https://lore.kernel.org/lkml/20260121141106.755458-1-jgross@suse.com/
> > > > 
> > > > As Xen MTRR handling is taken from the Linux kernel, I guess the same
> > > > problem could happen in Xen, too.
> > > > 
> > > > As the hang always occurred while waiting for the lock, which is
> > > > serializing the single CPUs doing MTRR initialization, my solution was
> > > > to eliminate the lock, allowing all APs to init MTRRs in parallel.
> > > > 
> > > > Maybe we want to do the same in Xen.
> > > 
> > > I suspect Xen might be insulated by the fact that we don't have parallel
> > > AP start (yet), so we don't have the whole system competing on the
> > > spinlock at once.
> > 
> > Oh, I think I've misunderstood the issue.  Linux is doing MTRR init in
> > the AP startup path, and so if it takes too long Linux will report
> > that the AP has failed to start.
> 
> No, Linux is deferring the MTRRs until all APs are up, just like Xen
> (or Xen does it like Linux).
> 
> > 
> > This is not an issue on Xen because MTRR initialization is deferred
> > until all APs are up, and hence is not part of the timed AP start
> > path.  This optimization was done in:
> > 
> > 0d22c8d92c6c x86: CPU synchronization while doing MTRR register update
> > 
> > So even if we did parallel AP startup we won't likely be affected,
> > because we would still defer the MTRR setup until all APs are up.
> 
> We will be affected, as its the deferred MTRR setup which is the
> problem.

If it's the watchdog NMI then than won't be possible on Xen, as the
watchdog is setup after the MTRR synchronization step.  We should
however fix it even if it's not a fatal issue on Xen.  I assume the
avoidance of locking will make a very noticeable performance
difference in boot times.

Thanks, Roger.

