Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CAAA32159
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 09:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886187.1295865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8HH-0002fV-I8; Wed, 12 Feb 2025 08:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886187.1295865; Wed, 12 Feb 2025 08:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8HH-0002e1-EF; Wed, 12 Feb 2025 08:39:27 +0000
Received: by outflank-mailman (input) for mailman id 886187;
 Wed, 12 Feb 2025 08:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWfB=VD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ti8HF-0002dv-Mp
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 08:39:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc053e4a-e91c-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 09:39:23 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 08:39:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Wed, 12 Feb 2025
 08:39:19 +0000
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
X-Inumbo-ID: dc053e4a-e91c-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCwAHiDAxWh1Xz8ngNxrFj/Fdc50koGalerG3ca1/R9F3LlS85fy6IPHfCJVv+boHKBfKURiCH1ueXVjCP5ZnCJ05Ss7ioORvqW3pRDnsV1B3teKZm9w+F4wi/0O4kgSmVKmPT1HD0NeHOFhmw9fIWwBQM8lUJfvp2b1WQsDQZzvDgfTkkXguwRKJdeyU3Hhf1dx8Gca0aXNtHUqkv6h76wy8FIOYM7FOIKuqeYwmViKoIRbho25gB9SJrE6xaun7MXZqTuWMlKWYD5SLTNSV7xRC8gv1MaAcvknndQhzFPtmFMbQpvm6gKL7cMbWzNs7P6F/XYOCiA5eohv0KbFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS2tARmwcc8AUEXQeB7SL9BClSy5TQIiyJa+1+IpHi4=;
 b=cI0k4T5NgezBO9xN2eFHX5IkX6iUy8rGVXpLsMayLtI9G2TNQ+HO7qvVJtrJRW6CU7o/3FTL0Au+KJLNP/l5HEz8i4ySJ2JW9wHHuVFtRupzGl6vWSiwwagbpogxsDINLR2NHy1e0Fw/P5Ukz5Eo1RqhvkKDCSH0Pe2mI+eZEDZ/vE3CE8lki3r/1PbLfSbTrkDBj52rEIiXjwk2leM08gptJl6VhlBH44e9nimT55GDy7qM82Uob6WvrR9m/j5EYa0Wp2lOi4qXCJ2yTV6WsS1smB6nIEQe7csMgS33DtQ+rlWVNSB3yR507IEc/8YCODPeeXZ2DU0O2zYjDxH+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS2tARmwcc8AUEXQeB7SL9BClSy5TQIiyJa+1+IpHi4=;
 b=n0SFXGB85CvEkknRqWsNnuyevrt3NMSbDPG8K0r0EbIZOz8A2/32BlNVCIQi4jeJiBqO6XfQNEm2caUVPBHu8QTEUAexw8A1LlBoSQ8ew/BRHcCN4Cnnt0ksYCAgh0hrujXzCoJUoLjgpKMChSEGwSfIiMbiUewbxi33SLPrNKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8a655040-7df1-4a03-84a0-396a4abf2abf@amd.com>
Date: Wed, 12 Feb 2025 09:39:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Julien Grall <julien@xen.org>, Grygorii Strashko <gragst.linux@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
 <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
 <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
 <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e18289-9dc6-4cc8-b703-08dd4b40be2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWdTSzFVMGs3d05lQ3A2c2VMeTJUZFJ4c0VBSFJnbFQ0Y1VWK2FRV3dVSGU3?=
 =?utf-8?B?emhtcDhCOUplQWxFK2JNRi9aYjd5M1RvbVljK2NXZzF2Ui95OWg2cVhzWE9i?=
 =?utf-8?B?VkJtUTY4aXBqL2NzQzRhRmNLL2EvWHB3OGwvVDdZaXpnNXhqVWJLRHZOUTA3?=
 =?utf-8?B?YTdkc1g4MmQ3Y1JIb25rdGoyVmNOVk1OUjc2T2VPT1lhWlhJeHFDQkdYUnVk?=
 =?utf-8?B?bm1vNXk0N1dkQ3R0dUgyWEswWWtkdHVjV1QrdXhoNm5ZZjJaS0RybGlFMkd5?=
 =?utf-8?B?dDVJRHdwclJtZ2ZYNWlRaUJzN2ZUMHFjTklneGh4ZmVKZkZnaTlnT2NyekJD?=
 =?utf-8?B?eG8xZ1JQUmlUZ1RRcjl2ZFJRUG03WmxiQTMxeUFUV3FKRmxuOU5VYzI4LzJt?=
 =?utf-8?B?TTlPL1c2eExzNWFhNWtFemJhdVI4dW4rQXNTREQ2YXZYbEg1WCtxdTNiUmw3?=
 =?utf-8?B?alc4L0dUWDNDUVd2a3h3M2dyZkgyU0dFKys3d0svOFlUSW43N0RnVXQ4THhH?=
 =?utf-8?B?K0cvTXNDVEdReU53YTFDTGxEbHlnTzNJeFFmVWFyV283eWFBOWtrZHJmdS9n?=
 =?utf-8?B?S1dieENWVy8zNU1wY0xvbldzRjFqeUNKY2dvNEROTCtSZlFmeSszNzdlNHNN?=
 =?utf-8?B?RllnMkk5WTNOOUhDMDd1UHhSN1NHQjduLzE5bUVLRUt4VWFvUWgvLy9kZS84?=
 =?utf-8?B?VEdDN0NUeGxQQm1Jb0hYWXVpN1hrKy9oVWRBVEI5bWNhbnVEdWpuMzBCODZ4?=
 =?utf-8?B?TkZTQm1qZUdGdjJyNXh0dFB1bTNxbTAxcG9jTjlIcHdqVlFaVVFnV3pVYjJO?=
 =?utf-8?B?azJBUk8vdlhkUS9HV1NEcmpPc3pTZ25TVjB2UjFsRWYwOVM2NTNXZ3puM2hJ?=
 =?utf-8?B?NmdmRVVqaGkxQjNIZVFuVWlxeU0vM2dmWXh5RlNxTUZiM2h1SGZpNlJ0T2dV?=
 =?utf-8?B?S1RMeHR4RkR1N20rS2g1NlNaY1ZkcXc4ZkVZYStTS2xsMXBkMEVkNmpZMDcz?=
 =?utf-8?B?OVV0ZVVyamRPZnF0Wjh3QVg5VmlaRkxzdHk0cXZ5R1o1cnBQR1FJYnRIRDlV?=
 =?utf-8?B?RVVyZnIzRzFWeEFvcFZ0S1dhY1RoVWFzNEgxdVJWUFp5WnRUU0dLdU5BUkJE?=
 =?utf-8?B?aDY1WGZIbXplbGJmbG9SY1piV1ZZdkZTQVkySytTRURsd2NESzd0SjVSL2Iw?=
 =?utf-8?B?bG5HVWVlVldBMmhaN0ZuYm9UZWpaY2h1eDhLWXZTVTd1cC9CYlJZNzhCa2sy?=
 =?utf-8?B?VW9Bc21xWDBnVWx4bFlmZmM2Vk5jSnFsNGtOT2Q4eVlFajZIZllRdlMzazdR?=
 =?utf-8?B?VG8yVHVCNWJjbnNGaUZkQWV4MkJwVXJ2TUliNFhpWmVENlYxSjExT1E5andE?=
 =?utf-8?B?cHVUNFZUdDc4WE1GR21Gd0NhdUpsRFFBL3BvbkR3MUx4YmpmTWVaUFd0d2lY?=
 =?utf-8?B?WlBzUGU3ZXkvL2lreXJ0SkhRL2hEbkFKRVE2YXVQRk1Ia1JTMkVzaGY1U1Ji?=
 =?utf-8?B?aU9wRXVlcE50TmtIUlFZeGptblZFcytNNU1IVVlvblpGM21PSWoxOEc4bzJL?=
 =?utf-8?B?Z0VSc0FwbklDK3FCVkx1U0U0Z2ZIbGZ0VzRGMTFDZTlYaGl1R05Nc09mbHJV?=
 =?utf-8?B?MFJJQTRJZXpnZHVTb3NNNWRDM2JPODJOSlJZMnNuVVJTSmk1MFA3aVR3V1A1?=
 =?utf-8?B?NlNpRXNWdHR1UkNxRjBJQXlkbGxvaGJmalJKR1hodFNoWnhWVXRqbk03alRW?=
 =?utf-8?B?bDRGMmlEMmdGRG5XVmFlTUhiL1dFN0xxdGl2dlNLTUVpR1BiNkUzV1ZMVjU5?=
 =?utf-8?B?VUF3NDdDNFRGWFR1QThoK1BsNXlaSnM4cHVjQzBXenQ5QUFScEQxUTRyVzhX?=
 =?utf-8?Q?sYfkaq41xqGd5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzdGczNJZEtwQjlpVS93eFpNWWpCZjlYa2U1NmlsdGdGVWY4MU9XSzBxUllM?=
 =?utf-8?B?bDRGTEtmTlpocDFVKzJlSXFEbjl6ZXNDRHZoUHpHVStzWWhtWmdmbTFpcTJU?=
 =?utf-8?B?WHArMnZWdlF5eGIwb3ZiY2RpMFFQZ0dncmFqTGI3SU5HaWhTVGJCaWpGYVNq?=
 =?utf-8?B?NDBpYmZTZ3ZRQXpOV3o1bXBnZ1IwYzlTMUx1T0VVR0hRbjBpRlo0M3h4Vks5?=
 =?utf-8?B?em5DMkRuOTdWelc3eEZuRUwwMGFpWGRMR05pZ3lsd3NYaGVGWXozUE5oTTRt?=
 =?utf-8?B?MCtlYzhOSUQ2T0FrUkRoZXh0ZzNlWWtKWGpkQWtUaTRNQVE5RDFyR0ZNWFdR?=
 =?utf-8?B?Qm4wUHh3RWpHQ211QWZVeFdyaFkvblFjcU4reHVnL1ZNVFJ0S0w3L3k0QTVk?=
 =?utf-8?B?L1hhYzAwRVBNbTdJS2hSRXBncVdRaSsvN3kwWGdjdGJZb3hCVk1Hc1BONlJu?=
 =?utf-8?B?c2NNTVhrbS9oZ0w0Z2NKdGRNakorOGdQdmhLWGw3WWRxdTFyV1pac1U1dmZo?=
 =?utf-8?B?T01xNVdobHVCWDVQQTNhb08wMDBsek15YTBaQ0FVVXZiK0VWK3czcVhuRjg2?=
 =?utf-8?B?TUtRVUdZMEsvNlUwbks4Z2hRTnlTcDcya2VadDl0T0k1NjNYcmhlN3VzRHky?=
 =?utf-8?B?RUoxaGdETU1tNU9rRFZRZUJTamtLOVF3eTBWbWR6Zm56dmc4elVod3RtTmh6?=
 =?utf-8?B?NzlpaU5nWkozZW12YWt3dERSY0dhOWRieEE4OUFxS3BOeWFwdGNjVVh0Y24w?=
 =?utf-8?B?blRzSDdjQVpleTFLd1FiK0kremNVb2ZvNWVCcjFYZUhBdWhsVHQ4WXZ3V3FU?=
 =?utf-8?B?QVJhTHlZbDFvZmMyWnZrWmRiOUFkUk1xd1VMb28zc0hWNlJCTUJVL1FPTmpj?=
 =?utf-8?B?WkdFYjRDcHVvVTdQTm9XMVpkMWRJMHQvYm05SUlEc0UzaWxCSTBkUnBkTTU5?=
 =?utf-8?B?dklCSVZKTU5Xd21JNkpMR2pMOEdiM0FFTDUyTDh2Q0JxTHFPeTZVdVZTckRI?=
 =?utf-8?B?Vll6K0tLWGVBN1AwMm55bEtMOUtNWmcrZnErcThQZTFkWjV4OEpqS24zeTgr?=
 =?utf-8?B?cmVBaTR3ZWZnUGJaOEp2bnlQMTRqSU1abnYxL2w4aGs0MVpjSW81UjhRTndD?=
 =?utf-8?B?dkJhS3FjNVNLbkRrTHNlL2VPWWkvZVUwSXM2cThEaExCYlRUTThNTEwzMHB1?=
 =?utf-8?B?Wlo2Yy9HYlBJVlNDQXZTd1IyN2NVT2ZiOUlqMERsVHNTeTFySlZYZmo2ckUw?=
 =?utf-8?B?clFuZy9DbERKK0laVWtpYWIxMk9hR0tSTGRrSGlGM1Fwd29IZGZCRG9nQWVP?=
 =?utf-8?B?ay9KQWRjeFI3dnc2cWoxMVhXblk1cGpXbzRYbGFIZG0wUTA4TVQycWNBdlpo?=
 =?utf-8?B?RnZ4UFk4T3dqOWk2Z1ZyNmdiaE1uN3AxNTF0dzFGSEU3elFvK3RjWEh4REkr?=
 =?utf-8?B?QXFYdWpSTVAwa1Q4T0kxRjJRZjVqUVY1QlEyOU9rSlhUL2ozb0ptRzhRaXVv?=
 =?utf-8?B?SHpwM1hxQTkxdjlKaXEyNThRWGtTdU0vNXd1QVRlNmpFMGgwTVd3Q1RjeFdv?=
 =?utf-8?B?VEFTSVlpdktITjRGdEtnZkk4UWY5VDBodHhhTHE3NUJOMlBTMG1IYVZlblNO?=
 =?utf-8?B?dVh3VnF1c3lwQzJLTW4yL2l2cCtIQnBaSks0RTBidE1SZHJVS1N1LzJhZ05K?=
 =?utf-8?B?emE4VnJwcitjTzc4L0hBYVFGbkxkeDVReFh1STlDb0RqVjBSTGVCOW1wRUNr?=
 =?utf-8?B?TFQwRVpTTEVrQXhldmx5WlJGclpLaGVMeStHK2oxQWNzMERFek1YU2VyaGJT?=
 =?utf-8?B?Z3ZzN045TjkrVFhUMUhtM25mVFdiMjZsQjBlM2ZLQXp3cFM4emtYaDh4RE1F?=
 =?utf-8?B?YUZnYzJLYndCK2tpRk94bGVGVTVFeVdMalp2amZaRU5neE5KdURoMWw1QjUw?=
 =?utf-8?B?WTV2eGI2NDBocG54K0c2aVhoTlpPaHMyQnIzM3Q3c3d2cHNHL2VoODlmbEly?=
 =?utf-8?B?YVFFQ0NlRUZydFo2MFowMkg3Qm12b0pRajlNS0JLaVBMOXg5bUFYYlFYeWhO?=
 =?utf-8?B?YmNsdHlQUHk1bnBsNVdBRzBLZUdkaEtZZjFzMWJhRE9RUkRROUdXTHBBcnEx?=
 =?utf-8?Q?veuTdGZ9FHHoQUUDY9F2eWiEh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e18289-9dc6-4cc8-b703-08dd4b40be2b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 08:39:19.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQdtj+hMtZ9/FRWToCcgoqe67+bnuJfik3dywjr323XXrIFp+IGEeTZmH7NHVAk1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223



On 11/02/2025 16:14, Grygorii Strashko wrote:
> 
> 
> On 11.02.25 14:32, Julien Grall wrote:
>>
>>
>> On 11/02/2025 11:57, Orzel, Michal wrote:
>>> On 11/02/2025 12:18, Grygorii Strashko wrote:
>>>>
>>>>
>>>> The dt_device_for_passthrough() is called many times during Xen
>>>> initialization and Dom0 creation. On every call it traverses struct
>>>> dt_device_node properties list and compares compares properties name with
>>> double "compares"
> 
> 10x
> 
>>>
>>>> "xen,passthrough" which is runtime overhead. This can be optimized by
>>> Are you sure? Looking at the calls, it's almost only used at boot except for dt
>>> overlay.
>>>
>>>> marking dt_device_node as passthrough while unflattening DT.
>>>>
>>>> This patch introduced new struct dt_device_node property "is_passthrough"
>>>> which is filled if "xen,passthrough" property is present while unflattening
>>>> DT and dt_device_for_passthrough() just return it's value.
>>> In the past we were skeptical about adding new fields to the dt_device_node
>>> structure for use cases like this one. I would say this optimization is not
>>> worth it. Also, why would you optimize dt_device_for_passthrough but not
>>> e.g. dt_device_is_available.
>>
>> So we are trading speed with memory usage. It looks like we may be using a padding, although I didn't check whether the existing structure could be packed...
> 
> Actually I see it consumes nothing due to alignments:
> - before sizeof(dt_device_node)=144
> - after sizeof(dt_device_node)=144
> 
> But it could be made bool is_passthrough:1; together with other bools, and probably moved at the end of struct dt_device_node.
> 
> By the way, below diff can save 8 bytes on arm64 per struct dt_device_node.
See below.

> 
>>
>>>
>>> You can check with other Arm maintainers.
>>
>> Before forging an opinion, I'd like to see some numbers showing the performance improvement. Also, is this impacting only boot?
> 
> Sry, indeed only boot, need to be more specific.
> 
> My DT: ~700 nodes
> Number of calls till the end of create_dom0():
> (XEN) =============== dt_device_for_passthrough=2684 dt_device_is_available=1429.
> 
> I've enabled console_timestamps=boot and did 5 boots and calculated average - it gives ~20 microseconds improvement.
> 
> 
>>
>> Also, I agree with Michal, if this is a concern for dt_device_device_for_passthrough(). Then it would be a concern for a few others calls using dt_find_property(). Are you going to modify all of them?
> 
> I follow the rule one patch one functional change. Regarding further optimization - I think only generic properties can be optimized and personally I see now only "xen,passthrough" and may be "status".
> 
> Ok. 20 microseconds. it's probably more like a measurement error margin.
> Please advice if i should continue or drop?
I'd suggest to drop it.

If we want to optimize the struct, then it does not make sense to do this only
for one architecture. If at all, I would do:

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5ff763bb80bb..0ff80fda04da 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -81,17 +81,10 @@ struct dt_property {
 struct dt_device_node {
     const char *name;
     const char *type;
-    dt_phandle phandle;
     char *full_name;
+    dt_phandle phandle;
     domid_t used_by; /* By default it's used by dom0 */

-    struct dt_property *properties;
-    struct dt_device_node *parent;
-    struct dt_device_node *child;
-    struct dt_device_node *sibling;
-    struct dt_device_node *next; /* TODO: Remove it. Only use to know the last
children */
-    struct dt_device_node *allnext;
-
     /* IOMMU specific fields */
     bool is_protected;

@@ -100,6 +93,13 @@ struct dt_device_node {
     bool static_evtchn_created;
 #endif

+    struct dt_property *properties;
+    struct dt_device_node *parent;
+    struct dt_device_node *child;
+    struct dt_device_node *sibling;
+    struct dt_device_node *next; /* TODO: Remove it. Only use to know the last
children */
+    struct dt_device_node *allnext;
+
     /*
      * The main purpose of this list is to link the structure in the list
      * of devices assigned to domain.

Results (defconfig):
ARM64: before: 144B, 16B holes
ARM64: after: 128B, no holes (-16B)

ARM32: before: 72B, 4B holes
ARM32: after: 68B, no holes (-4B)

~Michal


