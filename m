Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F062663D12
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 10:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474583.735828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFB63-0004Jn-9t; Tue, 10 Jan 2023 09:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474583.735828; Tue, 10 Jan 2023 09:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFB63-0004GP-71; Tue, 10 Jan 2023 09:39:07 +0000
Received: by outflank-mailman (input) for mailman id 474583;
 Tue, 10 Jan 2023 09:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFB61-0004GJ-Od
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 09:39:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e6fdf76-90ca-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 10:39:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:39:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:39:01 +0000
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
X-Inumbo-ID: 9e6fdf76-90ca-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5ot5e+fyTFJl10hHH2zNFBcd+L6Tp8bmnCN/NLItreBH1uf6vR78S9YUJHnxTp6f777fP3qXPIpb/zEd/QNsKlD1msvfVBLES2fE51BiQgzwTlg/KFf5Q3YxljM6TU81khylg3s4BDERJ24IGbkxRQJoIZFAPmaFBgQbJUeIHG8E5SGjt3kNXj6tmC6hOKWHY4eMYCBxGYkp2HAHhpPiEu5QOHw5DkUkfgkd09q7cWMek4APWYvbjj4NNwq+CjiYC65tJE8XgYrl9Cl9Qh+9siHmRPlbfMvV7uudwcaYluc939DTmQxzYF+Hzx9HH0STsgKTi7or0V5oSkm67TYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQeJ+AwqmXPde5CI4yD7WgZRUy/cEGl1FvE9Pxjw4uo=;
 b=Pb5kvVqbkdul5nXndrGV/glMMGxVlJLV1kxCJ8JeGneI6jiCUR9muX3qwug4nfFAKPVIgsOxkuYaS9/GAApaWcpNoGd+O2/vxq99QIgyV7RhnrR/jQE+UKD+8Ejjgi2FqWNW86te8ePn49lBSRhf7czh+oyv6jQFrtI2nrfcXCviyAwB47Mup8cKjv96z2JdlyXKlPE7b/Q2w7rsY8//lOmPi0CiQ7mZggaIQPuj7w7h2ugU1kxieHK7R49ZVSYyXoeqlGPDQnVh0YqEakyjgcbtIxRvbMeJgLLKfCh2VhoU9igl1XOtGpjllL7J9dCJMIiOIXgOAiQ1GFD3sW+LEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQeJ+AwqmXPde5CI4yD7WgZRUy/cEGl1FvE9Pxjw4uo=;
 b=AteIyDUY35v6sNQXDEXADM+I5fLAivyxFCQkxJuHeIgbb0PJIMaUq7C5aXeJsLGfcCkY4UEskbxEvR4mct6MeIAvUso0NBOSyeVWWLitVEs70/JgGgqxh0r5z7NzUBr6WrXecwrkbd9s+9MbF1uCKCusHBAc5O0R2bJvAniierTYBi2FTY4zW7i2fYHbvRnmMpeund51zQ2KFE2rAHQwNVKnEeckTo9bWNBhXwsUikZT69tfTg642IMk4kaejXKbFFEdpM4VA1ZRxDtN67r6oY9i/2llJTIujh+Pnr1AA4S6S86g9H4Nlmt9LxjnmO7I55JdlZc1Kk1bfOuahZUteg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1653609a-42af-b7cd-9d30-fb2bd5721080@suse.com>
Date: Tue, 10 Jan 2023 10:38:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Problem with pat_enable() and commit 72cbc8f04fe2
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Andrew Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <BYAPR21MB16883ABC186566BD4D2A1451D7FE9@BYAPR21MB1688.namprd21.prod.outlook.com>
 <03edcbc5-2dd7-1ddb-bafe-8412d8fc95aa@suse.com>
 <ba24157d-92fc-f472-9ef5-4eae3c63c12e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ba24157d-92fc-f472-9ef5-4eae3c63c12e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 55782c39-384c-4f77-2050-08daf2ee8100
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YWwdvNqmi4VLZRsO850o7cAGqXNxBJp/iDYaK0szVM9qDDM/JSxUShrwD7EfeOFfKtpC68EVujTJTywHHbjp3R9xV31CnP/yQsltHvFa/tV091KOlW0DxeVvRDFBCQOhHE/4PnWXfXImxObK6SCJ7Y7cZtWpC2faXK0h3gA1r1C3SFp2G5NQBdP/aFMctZS0NYC3HjidSxkN+3BFGKnvs4nWNxhpyiR6XUzKc++PPOuEa92wZYaSk+Gmn60C76oecf8G6iEwDmMxlryEHk4dyEE3bI2KM+Xg7GTSe1J+9sFs7SGYmMHiD6iPgTq1k6t1CKc2tc5NLBphcdXMC5bgh6/0xQ65Emj6JdhiShf1NsQi52Pk6RvPnW8NTmDJcD53DUKp8pJ63NMYRpsy39sR9Zohf0m0+U5rNYPPfidBiNEWDRoEz4wtO7pBfhDMZWYbHvQ86IojViDiDPkNd/obKuJkKk4wS+tWQOe6XQ8PmlYIEYfTEU4bhpqNQ6h6iU991EEwLm3tRe/galLe4YLCv3r6BolA642Ltpy/Rpfu8GvZMVMjqVksqKY963TlW4gI/2vFCMZvc0wE/BDJMSBhXk2DCPi2pDdKC12lLuiXk7FKMvXUZPh9h1xb+Y51LHlvfZZciCtQ5lRwVdy5SAwfThe8IMPTObcSOnfrhk+ztwZfE1KyTwKJ5qs1D/XVJQw3uL0gcVUTvpkfHedK7uv4MkvVkK0OIjnYnYRZ4SHZmTxu5nIhzqJlasxO87xyPxec
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(53546011)(2906002)(6506007)(6512007)(26005)(6666004)(478600001)(31686004)(6486002)(186003)(6636002)(2616005)(316002)(54906003)(37006003)(66556008)(36756003)(66946007)(8676002)(66476007)(4326008)(41300700001)(5660300002)(8936002)(38100700002)(86362001)(83380400001)(6862004)(31696002)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzU2ZFd2S2l6TmdlQkw0a2JONkppY3dQVTBCZzNQV212SFI5UlU3TjhCYnFR?=
 =?utf-8?B?QlFTVmNtZzNIWnlVR0J3UU5JazdwSnZFaEtGcTlsZnRxK3A2RkZFeThDc2Zq?=
 =?utf-8?B?Z05LMHZRZHZ6QVQ1M21nTXdYeVZkUWd3SC9lTFdpNXZraVV5bW05R1praFhT?=
 =?utf-8?B?aVZGbjhUNmxVbERudHVSK003L3pTTDZIeGdTU2VIVmp4OS9TaUZQRlV6Y1dW?=
 =?utf-8?B?RXk4NSt0Yzkwb0VkalJMSGtEQWZIWXlKY1JTb2ZhcHRBemJhOURpbGgrQ0x1?=
 =?utf-8?B?aDNTZllDSjE2M0Flbk9zUUF4d0Y0ak5nd2NjM3p0a1hEdlpWT09NT2RXeFYw?=
 =?utf-8?B?NVExQjNCRmJwQUpNcHJrck93SHY2UitsZU1aWWFxRjB1Z3Z2MnRLTkduYVk3?=
 =?utf-8?B?VW1hUktJWGxMZURKYWFWRHdnRWdWbWZZNjVVZytYS3hEVEZzdENLbTFYR1Ex?=
 =?utf-8?B?QnN1NHJqMG4rRWh4Q0k2bkFRWm1UZmxIZlk5VFBWZXZYSTdGUlp6aEg2cjg2?=
 =?utf-8?B?Q21jNkxGRG90UXpqelZiOVhSVVcyL1NTYWhNRk14N1hYY1RxWjFKdHQ2LzFk?=
 =?utf-8?B?bjdrREZWTTA2MmVlOUNGcTBnQ2tXeG1heVpKTzl3dkpmaDViTXhOVE14TFNG?=
 =?utf-8?B?cTlZL29MQmNSTS9jRTZZZnBXbjlRNEdRdjhJWkk5RVY1bDdLWlkrc1NrK0Rr?=
 =?utf-8?B?NG4xbUw3aTB2L2s5cWlRMm9LcGZCUDU4UWVxL0Y4NXgyS0IycEtMaFpjdDZD?=
 =?utf-8?B?Wlpib2poWWJvKzFMK2FLeHpHYkJLTDV2WmVTdWRFWndzQWF3RWtlekEyVnl5?=
 =?utf-8?B?WDJOWURLNm9Gb0JKU3dkYVBYRXczamMxNXNVV1Z4eE9VU3YxcGRDY3M5MlJK?=
 =?utf-8?B?U2FzOFpUbXZCQXVwNElwdysyN3NXRjFLbmErUVdSdnNBQi9wUm45ZU5iQngz?=
 =?utf-8?B?eDRMSXR1S2p2cDRNaTFjRFNZVUhvT0ZhMWVaWXZ0RlZZMjQvdi9ablZ1cWI5?=
 =?utf-8?B?T09uVi9pMGJkUi9VU3BNVVJ5K2h2OFNNMUhiRkxpKzd4WG91dnpUenNvUUZi?=
 =?utf-8?B?dG9VcmladU5iVFRDTytuR1JwN25nWkdmQzRpSzRFTS8zWmhqTld5ZC9nY2ov?=
 =?utf-8?B?UDBMQW1mdWVUdXFRYVV1QmtPVUQ4TytIc2grRzRXRm5YWTU4UyttUnc0eHBH?=
 =?utf-8?B?UW1aZ3R2bWNKdnNtcGQ5a0J6STdVbnVLbHRsK3hla1BDZjFUSDdTQ3VsRSs0?=
 =?utf-8?B?Wk1YUHJwL3haVS9rbVBhZjJreURweit0Mm9kK3JFK0VQeldvNnhDSy9UV1JM?=
 =?utf-8?B?WExSQlNUcHdhZjA5KzAyKzhLOVZaQkJYSnVzbHA2RU5YU0RNaFRvK1ZhdHdO?=
 =?utf-8?B?VVp0dktFVzMzU2NHNFZ3bHNJNkdjMWx5SGJ3RDdWRWtPYnMrU0N3dlA5UVpi?=
 =?utf-8?B?TVpjd1ZVMHM3ajJtQkZ2c2JJbFI4TmQ3Wm1TSGRPV0lGZndpbnA1d0lRWXpX?=
 =?utf-8?B?ZVBwL29vbmNoMEpRZE9GcmRpeDNRMFJrWHNIVVFMU0wzQ05vZ0hEN0lSaEha?=
 =?utf-8?B?Y0JOekJrWWdwY1Y0NzNHSmhiTzdlbmphUXVNQ3lDQ0tqMXhYYm9lVDQ0QXVV?=
 =?utf-8?B?ZW9Pa0RQYXVaOVpER2tXNE5qeitBenIzRytoOWF1Mm9IZmNHcUdSeEQ2VVFS?=
 =?utf-8?B?c25iVEZWdEEwV1FlNExIODVVUUJlSkxQbUI4c3IwVUQwVTJ1WXlrUFU1N0t0?=
 =?utf-8?B?RHhJQkR3SW1wb2RIVjQweTFCOGJrMzFMcWFjS0J1elQwWVRtc0hURkRTaFZC?=
 =?utf-8?B?aG5MeU9SU215RjJVcWNyb0JJZWlpV21EY2ZyMEdIdnZmbmZucWhEbXhWdC90?=
 =?utf-8?B?dFJvdm16TFFtd2IrK1ZwZE5Qc1VqVTMxWW5MdDV3N0txZWVZMHJIeVVyNFZj?=
 =?utf-8?B?U0xtU3pSRjE2T3FFd0R4UjdQY0IyNnJONHFhV0FLMlZST3JmRkxpTTg5K2o3?=
 =?utf-8?B?NEpYRDU3NzJENGoySHdYZGJFK3RkT1Y0QlpFK2ZtOEo4ZGpuNkJBVUxnUWxk?=
 =?utf-8?B?Vm43Y2VKZlM4VklMdUdjSW16MUdoNnc2NC91Q2N2eklubm5TMGRxU0doWGNC?=
 =?utf-8?Q?D2kDcCAVBwI7eUHpP6LGiI7FW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55782c39-384c-4f77-2050-08daf2ee8100
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 09:39:01.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMB3rXEu78pG8LBmIHS4jDVRaIiPhrtDa/I3UNm/tVSsJDkFEijEKrLZeJ3Ns1FjQadP39iWz2IN5Q3Bry4Uwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

On 10.01.2023 06:59, Juergen Gross wrote:
> On 10.01.23 06:47, Juergen Gross wrote:
>> On 09.01.23 19:28, Michael Kelley (LINUX) wrote:
>>> I've come across a case with a VM running on Hyper-V that doesn't get
>>> MTRRs, but the PAT is functional.  (This is a Confidential VM using
>>> AMD's SEV-SNP encryption technology with the vTOM option.)  In this
>>> case, the changes in commit 72cbc8f04fe2 ("x86/PAT: Have pat_enabled()
>>> properly reflect state when running on Xen") apply.   pat_enabled() returns
>>> "true", but the MTRRs are not enabled.
>>>
>>> But with this commit, there's a problem.  Consider memremap() on a RAM
>>> region, called with MEMREMAP_WB plus MEMREMAP_DEC as the 3rd
>>> argument. Because of the request for a decrypted mapping,
>>> arch_memremap_can_ram_remap() returns false, and a new mapping
>>> must be created, which is appropriate.
>>>
>>> The following call stack results:
>>>
>>>    memremap()
>>>    arch_memremap_wb()
>>>    ioremap_cache()
>>>    __ioremap_caller()
>>>    memtype_reserve()  <--- pcm is _PAGE_CACHE_MODE_WB
>>>    pat_x_mtrr_type()  <-- only called after commit 72cbc8f04fe2
>>>
>>> pat_x_mtrr_type() returns _PAGE_CACHE_MODE_UC_MINUS because
>>> mtrr_type_lookup() fails.  As a result, memremap() erroneously creates the
>>> new mapping as uncached.   This uncached mapping is causing a significant
>>> performance problem in certain Hyper-V Confidential VM configurations.
>>>
>>> Any thoughts on resolving this?  Should memtype_reserve() be checking
>>> both pat_enabled() *and* whether MTRRs are enabled before calling
>>> pat_x_mtrr_type()?  Or does that defeat the purpose of commit
>>> 72cbc8f04fe2 in the Xen environment?
>>
>> I think pat_x_mtrr_type() should return _PAGE_CACHE_MODE_UC_MINUS only if
>> mtrr_type_lookup() is not failing and is returning a mode other than WB.

I agree.

> Another idea would be to let the mtrr_type_lookup() stub in
> arch/x86/include/asm/mtrr.h return MTRR_TYPE_WRBACK, enabling to simplify
> pud_set_huge() and pmd_set_huge() by removing the check for MTRR_TYPE_INVALID.

But that has a risk of ending up misleading: When there are no MTRRs, there
simply is no default type (in the absence of inspecting other criteria).

Jan

