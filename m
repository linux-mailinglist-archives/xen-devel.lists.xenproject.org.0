Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9737EE18C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634210.989552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cSG-0005cT-OL; Thu, 16 Nov 2023 13:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634210.989552; Thu, 16 Nov 2023 13:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cSG-0005ao-Le; Thu, 16 Nov 2023 13:30:48 +0000
Received: by outflank-mailman (input) for mailman id 634210;
 Thu, 16 Nov 2023 13:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cSE-0005TT-QA
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:30:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5865ffb7-8484-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:30:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 13:30:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:30:42 +0000
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
X-Inumbo-ID: 5865ffb7-8484-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wn3nRCmCEs61VWr52m4tDcEkOaobKUyKymTF8Ty7mlGDnTJJP5aYyJJXaPTHW2Q+qAT3pR3Oskq2A/qaoZDAlcX0g2oYrEtzpxCzudqXFeQH976scPLBAoQ+rcS5Y3OmtUCUk2V2cm8c6Q8+j1fLkHOCYIq+h6tEGdHTkxsZUjARn6/7pRTJ+B53V+2Um8OHPcqwAqzsErCdpUoIgn/x87y6Y4j/kfxEkURFnA9+t3tdCjl1lrOWhrP8UFwzr5mDE7eOBvkUf1X6UzBnV9VLjoSJ6y6PRcidKkSZ0WAKizMqcrHHW7gwFgNiw1oPOCQxuJ1HnZ2h651xMq/YzNSYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdKtcSr8M9eXHCSqSFrd/lo0ZHHHdKLLAqWgHdGZwDM=;
 b=SDM83vyblz0x8KohuYknEzaoiBcAkGSl+pHYBoMexhw/CD+QWsUP1ufMIhUbc20v1+HiM2B88oMFGF/KF1nkTpR5QG844VkhHjdF5J/2fUX2cNaDlth+Z08xI6ogElGMjfp+Kt9jlfJGSD8ZN0k5GNeLDvR1CDBAQOwPF5XbsO79Mjdo0b6UV4BOxrqlaP3EUaHISusZ3EU843ZmOb4OJBXMYwFIgrcuIaxjGPytD5PgNJHg9hUI9SZqXwepLgNoAoaKE3flPKmStMM+AlkEYys9SPL1lzvULqT+UaCVMIIowDkCYYzJUY2eVaWT6JkdCayzNt5JJIfjURgtEQyqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdKtcSr8M9eXHCSqSFrd/lo0ZHHHdKLLAqWgHdGZwDM=;
 b=yN7tOlqKZH5lYTgKqxINPhdZU3AWSl5iwe7J7OaxpApdYhCS2FW0rUg4+04M1U6s3iAu2iL3b6PA9UsYek0bRa7PQoe0m+HKimpWNec9mzWret3XwRFxwVKlBoErcgFJOMBHEiCcAaanPVEl/9DHfJL3FxaUvdAGFY8gcZ3uibdL/U5DqqCaXRJ1uo8QlP7ckQLcRkX7ffiSh59ttzWXjUSmzWa1qQNsgPWAdWUkrqXzZyd2tQJamH8G9+o9gJl5y0WjSGUMns9y6O0n+L4jVsmpN4zqQSY42Nm6fU3koBlq6JrFbrPloYQY6+n3XlB3iYcLNuKiW2jIULEB3BH9VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd9d6043-4877-4156-97d9-4bdf7cc8fe04@suse.com>
Date: Thu, 16 Nov 2023 14:30:41 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] VMX: drop vmx_virt_exception and make vmx_vmfunc static
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a3734d-e63c-4db6-0404-08dbe6a83b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YJEYnXAtvxkRsQuLRv4zyXHjpSWlJsXSq8TvNih6wiMdxcGq0sOPWjuRhU01OiUNlzFBqGs62fq4LrPkjiaeXmSGsR905MQuf0Kz+AjLvEkmwdvraB3Z1Tg/7J06ZM45DkdjUaK7qNP8dHmtnB7MufUHHN9mT/5zpjcIJEZ6HZE1XEbs4l95HHl2IC3HjWWTuIRmcgpKu1U7C0AZUrk+QKle2a05e35hEVoVBzd3VntqKrjOFTF+8c3jqE0PSAY0hY3PkU/Be5koYYtyLiUYPB17Uwd2EYnBtBHkoUg22nLqzl9If9ksTns3yEvYr7TrnQvvbzMUMOtnbJkHNITShiBNsuG6TdGh2fmb9MqHGL1Y9HyTbOMB07sQlV2gkFG9ODUuebGy1SJUM2PSI+aREpfXmG7k+DwJHVHDT7amBAWxinX0UCtZMTpVjjIuS7N7KAP3S2nfLD11Ao6/nV0gx+HwU8y+Nsd4GxAUxFbI1bccpFefr3MtoqB34+SFEfohVRSgFwLOrkYZfMAiFCm3Pf+K04uJRHGLeFt0eF4SjCoO4dIlD+Gh5074xh+LNqIqR8GR7Gcn5OZJL+nUE4/5I4kLH8JYgAykk17s3MjNodmOi//ZyeWvhSyQQ8X2f21XmRkQHXyqTLSyuo3iUBR7fQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6916009)(54906003)(6512007)(316002)(36756003)(66946007)(66556008)(66476007)(26005)(2616005)(6486002)(478600001)(6506007)(31696002)(5660300002)(86362001)(38100700002)(2906002)(31686004)(83380400001)(41300700001)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHY5TEdaYThMa1B5OVpoZkN4Vm5ONlJCbzJRSzhNak9GVmxNdE1oVXJGME8y?=
 =?utf-8?B?NXBHOXU0THB4Q1RKMEd3eFVZUXpXdWlaZWZRS0lTOUoxWUNZR0VVWHZhNGt5?=
 =?utf-8?B?SWpOeFAyNmxFcWtCSHNkVW5oNFpMaG5Kck5VbHAzOHo0YStzalB3aG91SHRV?=
 =?utf-8?B?bzlUY2w0NGxqK0xjZmFsSGJCNVE4ZXEzbkYvUFpvdWEyNGFiZ0dqVW1TQXlq?=
 =?utf-8?B?K0srUG1MK2FmTDdpTzVZckZzR2JPR284YkNRUVdSa2w1cWwvVjRldzBka09R?=
 =?utf-8?B?QXFrbG9KVmdLU1Y3bk5yck9UVzdqTlZxQ1huSDV3dWI3Rm5GV296QlBRTjd0?=
 =?utf-8?B?cHFPZkliQnMzY1VKeXlsQndvM0JvcndjbU52dms5VmxhS0FyN2xtdzUvVkI3?=
 =?utf-8?B?ODdkQnRsWGw0ckVueW5PcUhyVUVBSldEdDJjNlBxdDV0aHRaOTl5d0VTbTlQ?=
 =?utf-8?B?SlpHWFRYL2ZpTk1SK3E0SHFlRERoY0J5N0FHVlpFeUlpOVVMZ2tXOEtlRUVG?=
 =?utf-8?B?RHU1bGR6RUxlUFVObzRFRzZ0b2dZdVh5eHlZUHc0RUg3b0M3QmJBTU43a1NI?=
 =?utf-8?B?R0RSQXZINU5HbzZkZnRqK1Fyd1pqTGJxMTVldkZpMmkrNnRTaHpCb0xEcGVD?=
 =?utf-8?B?YUQvbitjb25IMnJhcTY1b2c3KzJKNnZiNi9LU0lha2UzMlN5dG1Tdjl6WGVO?=
 =?utf-8?B?VlFCQUdteHI2dVg3VmVQTTR2blMvZDQrQkRQS2tSMkdBQkFzcDBHUDZPNWp4?=
 =?utf-8?B?R0FzR0N3OU9ESEtlYjk3RXA5QXpTdEh3TGc0SlZsb1gvRlcwd0dSQ2MrMmJP?=
 =?utf-8?B?Y2dkSTc1eXMwcGhPVGhqcFIrbktQWTBLUmF1QVFtMVlkL3VtbnJvM0R6ZmJE?=
 =?utf-8?B?VitjNTd4SGtuYjM1M1lZczNpdC9DMnd6UFpFYXBSem1WVGZyaGJ4SmhPNFd0?=
 =?utf-8?B?RnZJaXhCNTNZdXJ2Z2lHNTJQR2hDVExmUzBvc3gwYlcvcGJ6S0NlNklndzRy?=
 =?utf-8?B?UWZ0aHdkekphdjl1cEJJdmVaVnZ1UGtzSDMxNGc1RXNQSFVlZFZlZ1F6Mk9K?=
 =?utf-8?B?TUc5eFVlTGRNUVBnUm1LaFR2NlZhV0NDU0lvS2xrOXIzWlAzRS9vT3Nhb0RT?=
 =?utf-8?B?MFpHQlZPbzYvWUNFWnVJR0lyR3hLNVkwQzRQa2xDaWdTVDV0TkwrdmJCWU1N?=
 =?utf-8?B?cnpPeFNQOGhnOFlod2ZDbzJRR1dvbWN5dXBYZ2JyVW54RTVDcTJGTE1QYnBV?=
 =?utf-8?B?bFNvK21MMDlYSDlQZGQyVEE4d1hEbmM1WDYxVE9uN2t5SFFUN2kzOTU0VjRi?=
 =?utf-8?B?QzZ6SjlHaFQ2am5XODZOUHZmWXZBazhweVR0MmVyM2phMTMydzBseEhYQVRl?=
 =?utf-8?B?dWh5SzVuMyt1YURrK1RQdm1tSnoxQXRsTFRDdFVYNVFjRnNsV3JzWERuZVlE?=
 =?utf-8?B?ZUpjMUlNS1JoUEx0bHM4WWdQMy8vN3BsYTJOR1Ard2Y0R0NRcjNkeDJyb3NE?=
 =?utf-8?B?V2pQT0ZWWWc0c3FzbXpwaHVISnhGTFN0bElxYWgxTHhmcHdtb1BRdjJMTGc0?=
 =?utf-8?B?bEp1T3lnTmRPVGRDZDNieWNOV0FLdzZHY04ycU1wVVJCZTR5OUs1aHRDdERQ?=
 =?utf-8?B?M3FxdStDdlhmNXVvTElzc2lrUzNZTGhDaVE5SzUrWWdtRWllRVNQV25OYU1l?=
 =?utf-8?B?MDdXSXY4RUpOMHlodTB2dTE0dEduS0czazgyQVJMUnc0M3NEaWMvUnBTM0Ru?=
 =?utf-8?B?QUFKRnV4eVNjZ2ZTNXlFNCtQaWhUWDdVcmdlOVBaSDkyVnp6eUZoTmV0eW43?=
 =?utf-8?B?OEpSMWltSVJ1K0xsRkZKMHVKMmYybmltcmtEejRMaTh2TGNQRE9LSjIzMmI2?=
 =?utf-8?B?QUt0d3Rzckd3WkljcnYxQzVnRmVXd1hSbUNZUk4rUFhteDNTSUQwZ3UycXor?=
 =?utf-8?B?anZNckNXKzJIQ3oyek5TV1JwN1BXTTZQTlo4S3VKSHdYQ3F3RGJ0T05nMnhk?=
 =?utf-8?B?blFoRmdwUXdFTFV3VHpPT0ljblk0cFJHRmRWNHZydjZtdHlYaXpKbTJub2xB?=
 =?utf-8?B?clFTTWdPdmdxNzZxRmxVNkZVWWhPNjlCb1B6T3Z2b3RKdkRkcWJ1VWtqdnUw?=
 =?utf-8?Q?hMLesxmaSEgJGLEG5TxxpO8gF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a3734d-e63c-4db6-0404-08dbe6a83b19
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:30:42.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wU7hfdgAQ+yjACfZWL98Eg8mRb1oGGhX23ClscEkmoemNL8uZ2LazJRSBFSD4hW9y/dHWW6b7aR3bL5DrG6NZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140

The variable was introduced by 69b830e5ffb4 ("VMX: VMFUNC and #VE
definitions and detection") without any use and - violating Misra C:2012
rule 8.4 - without a declaration. Since no use has appeared, drop it.

For vmx_vmfunc the situation is similar, but not identical: It at least
has one use. Convert it to be static (and make style adjustments while
there).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In how far the sole vmx_vmfunc use is actually meaningful (on its own)
I'm not really sure.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -167,8 +167,7 @@ u32 vmx_secondary_exec_control __read_mo
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
-u64 vmx_vmfunc __read_mostly;
-bool_t vmx_virt_exception __read_mostly;
+static uint64_t __read_mostly vmx_vmfunc;
 
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
 static DEFINE_PER_CPU(paddr_t, current_vmcs);
@@ -475,8 +474,7 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_basic_msr              = ((u64)vmx_basic_msr_high << 32) |
                                      vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
-        vmx_virt_exception         = !!(_vmx_secondary_exec_control &
-                                       SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS);
+
         vmx_display_features();
 
         /* IA-32 SDM Vol 3B: VMCS size is never greater than 4kB. */


