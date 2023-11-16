Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CF7EDC63
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634019.989222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XBB-0000Od-1N; Thu, 16 Nov 2023 07:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634019.989222; Thu, 16 Nov 2023 07:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XBA-0000N0-Up; Thu, 16 Nov 2023 07:52:48 +0000
Received: by outflank-mailman (input) for mailman id 634019;
 Thu, 16 Nov 2023 07:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3XB9-0000Mt-52
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:52:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe13::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21464171-8455-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 08:52:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 07:52:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 07:52:43 +0000
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
X-Inumbo-ID: 21464171-8455-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW1gMoX2eMzaZQhvFh6qrpW9QygxoOAbdaXBq8bT0kco+yiJHDkEo0Keb8iJZSdkZfnbi1USnLUFW8WyKFJ1gsuvcxEDOtuB512+p0+DF457SOWkjvsHAvh9FRfkEKxLQJMBUHBVmWyX74NnncR4kUP0fFEGbkFDBnF3oceAZQpsf8mqGt7eOj/kLtjgoBLie/Dj+F4LShfH4DU+Hs+hrVSUNIVTWCztrlxsazw3cLoI/31ioJt0+ux1TCppMSEztR3rCXDLPWlFZF7ZIFGo0HnV0x83oYBg1apvuP74ht6rc/x1P4VdtRvyijo/FhsGHo8uW4QVHZCWtzvYleNGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvAgaVrj+2lveqS8b5XcXGIxZwEB3p0RNzRd9/vouQw=;
 b=derHbbbAE60mV2cPqJcImRDyR24Jt1TUCfET6QZ9zVaDlJg/5o6v9OEEexO7nYpQjHCCiJmoXz4/w28Bwq2KRuMtg0WckyUJ2t+UlHS1X9y9h1yps9ra+s9sXnIeGpblin0QdZ4xEfB2lpnA11LAD0j6NgWOumnK9d8dGG9obACfp6JXNab43+irHrUEjOLAINROPAU9CtbLxxvI3lhw3LuaQe/LPtMT5swh9rN9HM7rAb6YYWb5dLYGOB42dXP3+ELX7jTFs59AelwPKBEyuZ64KJBLyvvsqK3+jkUu15wT/V/gJhitqxq1DbesqHFjV/7jmX35SUurKd0VG/FHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvAgaVrj+2lveqS8b5XcXGIxZwEB3p0RNzRd9/vouQw=;
 b=KmqDYdRhuoWZ3HgK4Yd/Rl56UfLhvgXSb+Y37rlyPu9vnDQpAf1bC8Br5lqqTc2GRZA0SAXLhLxv++QPkFEArRehr0KqnpzVct3MIoVgnvPhgVkPr5eoh3p1kSNNNJrVZX6biLDVlEm+rDlU13Olft6R8QOqnyn9T3rywncqQnCPvI05DcVJkfYYs9K+7EcPGK++ObN+32VtxlBbt0TqxQVl3AX5XKv5kUAvggREeWkG0fLFwiIELj3TubzD7QbB077YxYq7BQ52hQMZ7HVPF0YlZPQIElJRuYWDI1AJ1jX557p0nJvdHXvMmENVyY+YL9Cvpq32/NEwEoXTXLWSuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9202e48c-d2fe-4474-abd5-3110b805cf89@suse.com>
Date: Thu, 16 Nov 2023 08:52:41 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: 4.18 vs mini-os
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 39dd758e-c04a-4745-6388-08dbe67903d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wFYSOgPtbCSFt88YczKR+UbE/bvrSU6+ruyniB/iV59zEvF1jnQd+eXkmcuOfqp+YVkUwvoHwEBCbLhwJPX5sgGkVHu39HM3+PyUn+ayW/VIBfUVhpCW4sQS5KNa0P5YXDx0BVIQ19tkTbN3ZgEGjA5LWG9CN3fto0TJCp5hvYbz09b9XzDjead6UGSKZqeQuAYp8FongYDM5LmU+QNB0lExwH9jnEg4cVaBP8R4T9swbEhyunY42lLDjdH51i9TD5j/fKH+TzvTKA72v1GNtEMBFkLwsFdoUvu+p/1Gqd2d28/zbbApxgsogNUJ7rwLw6RHqpD4NYohXFynB9OQ673/a7l07SyUz06UmP1uMBIOW9MBRoe2OdAUybco20l995GKJu3wLBzRyQYFChobjyt6MaYI9hWbZU/HiP2YsF6mbnUgtO2vtIh5f9nnCVmmUbeG9ps6mZLjscdUKB0btoqcGVJJ/XItSbXoOhs+u0QUkNJpnLC/+aVWOfUtJ5qk42FezX12i2o0OT0OiwfMowN6cVnJBmoWp6OMlJLHBwoDCBxRvOlfEPW2y77iZAbi91F0/qww0chSdamH2nVtjWHxhuQcQNDnGJbzZXlQBPSsOUTFMttpt87suWjDDN0/Ct1vxlahsWdQgQWKL8eyjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(6512007)(4326008)(26005)(6486002)(478600001)(31696002)(66476007)(36756003)(86362001)(2906002)(41300700001)(5660300002)(316002)(66946007)(8936002)(66556008)(8676002)(110136005)(6506007)(558084003)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlVtbkNEdWd3MGZ0Sm5EV1RvVyttSTl5YmN0VDNhUmFmUHR5ZWNseXRWdVJ0?=
 =?utf-8?B?V0VGZHVrRkJvK1lBSW9aZk9IVnpmdGoyVTM1bFJsbkFRWFowVkhyK1ZIRmZC?=
 =?utf-8?B?TlU2OHBDc1h0M2dKNTJiRTBLVzhVdGVrb2NrYk1aMG1FMTlyUHFSd1FRNFZB?=
 =?utf-8?B?TW1WaE9rMDZBQ2crdURxUXBYR1JpeXZiS1JaWUpCbjF4M240eW01b2UvaXV1?=
 =?utf-8?B?aTAwMERSdjlYMk1aT3p1V0VWRjRnYW91MjBhNm0rTXFkL05JWXVCcFBndXNr?=
 =?utf-8?B?ODVXekdYWHlybzN1SHJ0WC9hMnEyMWNXWmtMT25yTkF6eUpDbHAzTGc2VXhF?=
 =?utf-8?B?UTJETjNFNkdyS1BHME9sRFBoRWUxRDlUd2g5SGNnNStUVHB3OVg1SUdrcEpN?=
 =?utf-8?B?ZmtSakpqOWxXRlRNWGlIQjFpMGRRMCtXVk5EOWluYnQ1UktHYUJSWWZPTUk1?=
 =?utf-8?B?dVNvNzZMOWo5d0pWbVpyRnBvSkZScGVvbzdNYjFSVDJXUmhzV2xaTEh6QjJK?=
 =?utf-8?B?Zysxam1ILzZoQmdIdXJkMlVzL0hpVU9Dc21wSHVHS0FUWFo4dXlRaXphSWtN?=
 =?utf-8?B?Y0tISzNVUERDMWFSMkRuUlUrcENOWm1BMFVZTmtRNHRRb203MXhsQXBqcUs4?=
 =?utf-8?B?cTZQTkF6eXI4SHEzNmdWd29DN1VYWmR2elFEL3FwM1VRZzJacDFpZ0VmMHRZ?=
 =?utf-8?B?RjhuTU9vVXJDeEdraEFpZkRucnNMZGxOR3FkckwxWjhWdFJ5Rytxd21Qa1cx?=
 =?utf-8?B?dU9IYVNMVlY2dDl3NW5lQ2MwRnRDZ1hUQ29oV2pnZytZdzBCcyt5NDg5MkFL?=
 =?utf-8?B?R2lZZE9ncUFWakFYTnlXUjgxY1lDVXhoQjdXKzV6Q29wZ2ZyV0RrTHU0RFl5?=
 =?utf-8?B?NFNXbFY0UTdqZ2oydkh5STVickFWeGNoeEk2WXI3QjNqNXRqREE5b3dhRGx1?=
 =?utf-8?B?R1poUHJsZ3BCQXRTRWxTdlhxMnNxRnYyRjFndWo1NUJ6cG1GMVNFRnhBNzZ5?=
 =?utf-8?B?VE1jMnpMOHU3MGdwU0pVdXhDZXdmcTZMemdHSWJuYkticTZRKzlKMnVEMTJL?=
 =?utf-8?B?dktRSzZHOEZoSWZVZjRsRXV2d0ZxM1EvTHhBTHM1MTRLem9IcUFOL25zaFlF?=
 =?utf-8?B?b2FaQ3ZWY216MmR0OHBOWCtUT09uWDBxRHFGS2RxNzJyQm1jY0N0NjIzai92?=
 =?utf-8?B?eitXanlHR0RWZUUwazJWMUpOUnhONVZ5MzBSQnRRcDhyQ2xMeGVIYWovWG1Y?=
 =?utf-8?B?RnhjUkdENEdTTnBTRGUxQWdkUHFpa25uem1taDJaZ3JxTEE2cjRhQWRBaisw?=
 =?utf-8?B?YmIvVmhoL0NaWWpsRW10Q3U2aTkrTGFFTjlKbDhjK3hGM3QrVDZ3cmZ3aWs3?=
 =?utf-8?B?UnlyUU1ueG1RN0krSXB3NGNMb1RPdEJKcW9IekoxNzUwc2ZqYnZ2SUp2NzhM?=
 =?utf-8?B?Zlh3SElONWQ1bG5pZ1lrWHozWmhGb0tOYndZRmNlTjVFSXNaVWszRkN1QXVY?=
 =?utf-8?B?U09xbTNlMCtFNTA1T3VqUkF6RU00SndkK0ZsSzFnR1l3MGo0V0RqRTBML09R?=
 =?utf-8?B?Z1ZUL2RSbHdyTHIyYWtlWDg4U1BnVnd1ZnpXZ3FKYW0zR2tSeFZPdjFaWHg1?=
 =?utf-8?B?SU03UWN2Nnc1Y280ak94ZVFKbVMrMmtJdklsZHk0RXU1ZzRxWVpmQjFPMUlR?=
 =?utf-8?B?WlBGTXU2WnF2TFdzV0pKUHdMaGFMS1hERGFzWjdjek5WOTlaU1ZwQStva3or?=
 =?utf-8?B?YUdvSktJQWs1QjFxcEl6Y250UHN2Y0xlUWhNc2l0SHhrQXJqQXk1TVNrNkIv?=
 =?utf-8?B?M2RSM1NGR1VleTQyOVZHdGxEM1BTdTJISmg0Q05mbDhBR1l0a0hpeG1PUmEv?=
 =?utf-8?B?clhNUmZXcnFzQ1Z6NklXZVJJWTVVcm9tNWc1YzE5MGFJTWtTUHNya0VscHhP?=
 =?utf-8?B?aFpPakhZL3ZkNlZucXJJRUtadE9kRElpVXMzdkppSmEzcWkrZTYyUVo2cHV1?=
 =?utf-8?B?bWpDN2F0K0tjL1orcm9xVGMzcUFud05ncm5STTMxUzdqcGtieWNiZzFLSnpI?=
 =?utf-8?B?blZjZXp3L09kQUhISlNYZTV4QjltbjZXNEZPYlJpVlFRdHAwOWoxc090RkFX?=
 =?utf-8?Q?vhlbx56uAq7GYkNYpaz5LpayB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dd758e-c04a-4745-6388-08dbe67903d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:52:43.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nNMTsovwp70rBbYJ7+y+8iWXjSJzOcEB8Vgy5sNkuZ5EuLR+xzXXkK5+w3EC2J/GJxdWvLsWzSeuruO7lGgMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781

All,

may I ask on what basis the xen-RELEASE-4.18.0 tag placement was chosen?
It matches the 4.17 ones, despite there having been new commits from
Jürgen dating back to January / February. (My own build fix would have
been nice to have, too, but I can see how that came late.)

Jan

