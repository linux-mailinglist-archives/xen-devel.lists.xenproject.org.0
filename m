Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59989654EEB
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 11:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468872.728061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8esX-0002fU-BW; Fri, 23 Dec 2022 10:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468872.728061; Fri, 23 Dec 2022 10:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8esX-0002cv-7u; Fri, 23 Dec 2022 10:02:13 +0000
Received: by outflank-mailman (input) for mailman id 468872;
 Fri, 23 Dec 2022 10:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPxz=4V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p8esV-0002cp-Fl
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 10:02:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc888965-82a8-11ed-91b6-6bf2151ebd3b;
 Fri, 23 Dec 2022 11:02:09 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Fri, 23 Dec
 2022 10:02:06 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5944.013; Fri, 23 Dec 2022
 10:02:00 +0000
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
X-Inumbo-ID: dc888965-82a8-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW59o+MEk2FZBvK0FXKovR5QjJTMLIxgl1bfuCvC3atNbhJID9N/brO1AeuTAscjyhN7g17Eiyo2iJGY7mxjyv6sHmL0AuY7Hh5XAg4XATMKcyN4hN+Rw4T87KxI6GosNvEPM8fyN+y4n5kKvm5PXDVQIpysIfoeNpDTWZWTJlnLWjDxio7hDqu+mqgB234AuvrA/ikSiu8ewtRbFwghqs+ZdqZ/OQBoN4sOsuNF5x7U3NqHliL65jbn5g5qbounbBj8zqY/4SMmySEoqGI9xtSLiS3NQGLzXusDlp70pj6xs1xkqFjRXpCI72av3DW9DRAuCMY2c9DEYlQbPpl7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnFFRmEi5FA9iOd1fQdkBDOYWvByRObDw5lwSWuvvaA=;
 b=g8c06IH5X2RPqwb+fe5EmsN2GGANIYlgMj52zjR3xfXLTiYShxQmjooMyuJ3ZHlm6ooyJzxPmpl34wfrfbGPdzQw6hSRobeetQdCWuXVd4pBY4peQkcIBxir0FTvfieq0LBkXhoX8EkFtddZ+eQnKOEogF9Oye1jP/qC1Wx6Bsi/SCcA0es60kzJ+nJoFaOLMnCItsq2hxulWIstbyW07Crl0/3/5U+FhaoiyIOaGcTPcYD3K5RychPX7oel5aRAXijB1e4PaQrooH2ngRmwECPbd8p0SuIom41nd718eeWXNwMz/2Tzkr5gahLu0LDdLBHxanOIbwjixNwH0RLn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnFFRmEi5FA9iOd1fQdkBDOYWvByRObDw5lwSWuvvaA=;
 b=mE/2eRZhWt0+CatDJikU98zlw5VgCyjBjoStq/qbpF6kdSyIfraIN+yHNmOJ+Zfn3k1P7NAxbrVpmAyYbypN3pAk3XzBNBpVYfPN+OvOfCS6eCEDliC2dEnCOjAmer0Nca9jKRg91SS/LCnKb52QOepSLe5CV7TqjdyhHb01pmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5bc9435e-aee9-006c-a35a-ee9c7f946f91@amd.com>
Date: Fri, 23 Dec 2022 10:01:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the
 translation between u64 and paddr_t
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-3-ayan.kumar.halder@amd.com>
 <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org>
 <alpine.DEB.2.22.394.2212161643400.315094@ubuntu-linux-20-04-desktop>
 <74786a57-d99a-6cfe-f475-df11c0d93afa@xen.org>
 <alpine.DEB.2.22.394.2212221520020.4079@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2212221520020.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0438.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9bba83-55bf-4951-15e1-08dae4ccbbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GB03CzcQ9bfT797/qLnsMOzhjJwKrHMjz3sl86xQ/bU/q87laloqqxgWTARXNgNKp+beWV+upyXu0LxrZ0I7DxTREu6b1Rw1ZkkMhY6kG/qzvbvRvh3dnX7Dkt1XOfmiPzSTbAb5dUpgJfN2y6wy/Tt7I/5Ce2uA/LIP2TnqQvHv8CSyS7nzZW8obh35J7YG31BZGFOkxArxqWNW9fPG10VOBYZLSxe9gIXw3AZJJpr7gXW9JV6rCETVyqwqIFkaOkOt+1+SD8nG169xhFjaZDTwv4kwScLI0hGDg4ZS1uDrTXbgQPVIwaqNYL1qxIs6R8ouDj7Mj8eq6jCSgGMh5rGdZkMPM5kzd2SW2OHAxkBxxKCrxRbvoCoBJMwV84v8kFvH+KTb9VAmNjB52lynIvoDoQOTUeiT5SbdNnGhrjwMqDl2V2mnzI97AKM9a7eT0L3Uvqwf+GP/ZfPP4ojg9JTaQxZr3n4AUyPtolKpOHFTIyc4YSu6BGMR9Lj2H0/PTGSZxRzQUe8gNNSLj3bS9djfVwHlCF3KYUzDP3/FFSVTxziImVLXvHuuw2i5BE5+pl1G2f2RWBgciFJ+GywpG1YWl79ZNppJuaAO7NtGdiX1g0oBvJNBPbCmEQ9e85lhU5ddyx4fjXpSnaZiQcUdZD4m6drlBl7T+MsfSXCNwSekYbqsFYZlbeFOsO11sqdU326K/1Jez9pXtW8NVQ+1fcMK6oI/TF5RC5iQHpzWUZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(8676002)(31686004)(5660300002)(110136005)(2906002)(4326008)(66556008)(66946007)(66476007)(6512007)(6486002)(478600001)(53546011)(41300700001)(26005)(6506007)(6666004)(186003)(8936002)(31696002)(83380400001)(2616005)(36756003)(316002)(66899015)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDFTa0lXM3RBZEJqRlFLZ1hOU2E0amEyN3J5aGZ2eStkYnpGY3BlZnZ5THpT?=
 =?utf-8?B?V2ZpTlNLSWx1aERzSkpybmsvdnp6SFlNUWpEN2xHNFh4VmVyUHlNQ0dIVzlT?=
 =?utf-8?B?UERJcHBXb0k2bUhyVmpvcHdjNWxTZks0aWRmQk92WlNjbUZjeWFTRXpTTjFD?=
 =?utf-8?B?QU90MjcyT0hhYzFnZnc3TG9kTW5GVTJxbS9oWDFkWW9UMmVNREJ1cmVGT2gx?=
 =?utf-8?B?OEpDZEdVKzVOd2tiQmVvOEtzU2g5bUlYSytFNTR5R1ZFeHczKzNUbDRSZGNj?=
 =?utf-8?B?QzVUUlNTU1V6N2xtb0g3enpkdWtpalE5REdTdVJTVHBuT2tUd1gzQzFiWjY2?=
 =?utf-8?B?ZlRyelpDVTVERW1XM0NqaWtEYXdTcW83T1B5Tmx2cFlubk96Z0hldHVIY2hx?=
 =?utf-8?B?OVZQMGlXbDlqRHNMd0dtVUR1anVoaTJiZlBrMjMxVlg2LzRqYU52OU4yQyt5?=
 =?utf-8?B?OCtMRUFjTW9jZnpPUFFwNUkweFd3bGQzWjdRTnZTOFVYOVZXUlYwUnJHZGRZ?=
 =?utf-8?B?aE9FUDlpdGp1Z2Jqc2FCYkhQN25RSDFUdjU1VUZYT2tPczdIcGFDTU8yUWZz?=
 =?utf-8?B?NkJKRVQ1amJzd25BbUcyWE1ZY2cwR2pwZXUzMTVmWGZDNlozOTU2MnEwdWVB?=
 =?utf-8?B?dS8vcGhjTk8vV0NTQTd3THdwMlREbTc4c1ZScHQrN1BYVXRkYjVpQ01jNmhX?=
 =?utf-8?B?NlYyNkJHbEs4bjR0RVNHenhwVTB6NThlbFFOVjczTUtMVGZLYmtrcFppVmNC?=
 =?utf-8?B?ajhhcm1qV2wwTlN5amsra1hOclVVVGhMQStlTlpJWGFjYzZRSUU1emdHNWxG?=
 =?utf-8?B?WFpQYWIzN2ZEbUtyMyt4Zmw2OTNjL0tHc1cwM1FtU0dWcHNLRTJsR29JNHlr?=
 =?utf-8?B?QkxNZHYwOU9kRmpoU215enhrN2RHOHVLa0tGVVlQQW1USHE4cks4ak4xeVN5?=
 =?utf-8?B?cXNENUcyQlVpeWhjWklXNjFHMGo4eHQ2LzY5WjhQcXo5TVdxMlltR0EyMWhE?=
 =?utf-8?B?clB3UnJkMXg2eDNQTDZxZmFSU0E1RXdOczJtaVBTSXN4Yzkwc2ZnM3M4UHZ3?=
 =?utf-8?B?cXNyMmtDM0dTTm80K2hBL2JYaEhkdjl1SWpnMnh3blNlbkc5NDFPaUlKZnhZ?=
 =?utf-8?B?c3gxZ1phOVA2aStPZlI1ZER2b0hTTDU4K3EySG1NS1dIMGlNZDlGQ2RUcWpJ?=
 =?utf-8?B?OGtid3RxRkFOTHJDZ3hDbUE0d2ZiVHRLVGN2SHFtaXJxczFJVmQ0RC9Bd2xt?=
 =?utf-8?B?b0NEK0ZiUjBoREcyMnlpRGc0emx0L2FOejhDTXptcThvbUhiTDFpNFZEdG1C?=
 =?utf-8?B?Zmt0SDlkUVhGR1FhczE2ODZYc0VqUUVtcnBsaFBKKzJKdkRpQVVzaDJvc2hN?=
 =?utf-8?B?TG9CTTdPZHE2UndYTW1PMWljL01rL2o3dnQ0UXhNOURHMWk4cGw4eCtjRTRy?=
 =?utf-8?B?YnhwNHdNQ1FiZ01lN1ZXZWdyTmZlT1B6eUd5RTVhUkRFSkw1NUZZT1JyVHZP?=
 =?utf-8?B?M1pPcUZDeDF0VmZkMmk2RkY5bkNVRDRRZ29uaERNSzQvcXk5aCtGQ1lTUXdN?=
 =?utf-8?B?eEhZNEZONStkUmtLeDdTU2R4Y0paY3FCa2FtSjlMeG5jenY0UUJBMWpwTElE?=
 =?utf-8?B?bmFEbjFoaG5yVmpvcWcxWEtrZ0FBVkNhdmZSV0grNjQ4ZUx0N2xIK2ZMcjRG?=
 =?utf-8?B?NlNOejNSeVQ4MjBoajY1aExIMnBjQTkrVVdtTmJSMlV4NTlYSEZlV05KbFdX?=
 =?utf-8?B?a2s5N0hyS1cyVXpreTJxaG9xa3pkTEdUOHVOeVBNSHRrd3A0UllwUGRqTHpm?=
 =?utf-8?B?bmZCVzh1cGo1akI0MUE1S3Z0UjJ3NGkzR0VVMHZQQmdIN1d2bVExMWNDUk5M?=
 =?utf-8?B?b2Z3WE5FWEtZMm5SOGRacXVoS3FEYWlBQmJDaGN2WmhvVkRZVXFZdWJRa0tN?=
 =?utf-8?B?aDBJNzJSUG1jRFFvNlJJQ3RLRjJqbHQ0SS9sRGFmYVBhU3IrS3g4Ui84ZnVK?=
 =?utf-8?B?RlRjWndESjV3VnJpcmdSNGV1YVFmbC9EdHJDVHhOT1o0KzY3Ti91bXc0bzdk?=
 =?utf-8?B?MXdKVW9rNFg4eHBkQldoOE1BNndDOXVocnRITmFyb3NCZXZXSWJ5bkx5OXlv?=
 =?utf-8?Q?cF3J+EKwmvfsUjO1nHGpM/+FF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9bba83-55bf-4951-15e1-08dae4ccbbcf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 10:02:00.3749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vX9nwZCHdee7sAdnryTxPKzK4cv8t5xu+kyx8expBg2n31yefmhdyiokADRNNNiS4Ja8WWQF3rKQwSZ1pOFPAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536

Hi Julien/Stefano,

I want to make sure I understand correctly.

On 22/12/2022 23:20, Stefano Stabellini wrote:
> On Sat, 17 Dec 2022, Julien Grall wrote:
>> On 17/12/2022 00:46, Stefano Stabellini wrote:
>>> On Fri, 16 Dec 2022, Julien Grall wrote:
>>>> Hi Ayan,
>>>>
>>>> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
>>>>> paddr_t may be u64 or u32 depending of the type of architecture.
>>>>> Thus, while translating between u64 and paddr_t, one should check that
>>>>> the
>>>>> truncated bits are 0. If not, then raise an appropriate error.
>>>> I am not entirely convinced this extra helper is worth it. If the user
>>>> can't
>>>> provide 32-bit address in the DT, then there are also a lot of other part
>>>> that
>>>> can go wrong.
>>>>
>>>> Bertrand, Stefano, what do you think?
>>> In general, it is not Xen's job to protect itself against bugs in device
>>> tree. However, if Xen spots a problem in DT and prints a helpful message
>>> that is better than just crashing because it gives a hint to the
>>> developer about what the problem is.
>> I agree with the principle. In practice this needs to be weight out with the
>> long-term maintenance.
>>
>>> In this case, I think a BUG_ON would be sufficient.
>> BUG_ON() is the same as panic(). They both should be used only when there are
>> no way to recover (see CODING_STYLE).
>>
>> If we parse the device-tree at boot, then BUG_ON() is ok. However, if we need
>> to parse it after boot (e.g. the DT overlay from Vikram), then we should
>> definitely not call BUG_ON() for checking DT input.
> yeah, I wasn't thinking of that series
>
>
>> The correct way is like Ayan did by checking returning an error and let
>> the caller deciding what to do.
>>
>> My concern with his approach is the extra amount of code in each caller to
>> check it (even with a new helper).
>>
>> I am not fully convinced that checking the addresses in the DT is that useful.
> I am also happy not to do it to be honest

So are you suggesting that we do the truncation, but do not check if any 
non zero bits have been truncated.

As an example, currently with this patch :-

-        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_number(cells, size_cells);
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &dt_pbase, &dt_gbase);
+        ret = translate_dt_address_size(&dt_pbase, &dt_gbase, &pbase, &gbase);
+        if ( ret )
+            return ret;
+        dt_psize = dt_read_number(cells, size_cells);
+        ret = translate_dt_address_size(NULL, &dt_psize, NULL, &psize);


With your proposed change, it should be

-        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_number(cells, size_cells);
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &dt_pbase, &dt_gbase);
+        dt_psize = dt_read_number(cells, size_cells);
+        pbase = (paddr_t) dt_pbase;
+        gbase = (paddr_t) dt_gbase;
+        psize = (paddr_t) dt_psize;

Because, we still need some way to convert u64 dt address/size to 
paddr_t (u64/u32) address/size.

Please correct me if I misunderstand something.

- Ayan

>
>
>> However, if you both want to do it, then I think it would be best to introduce
>> wrappers over the Device-Tree ones that will check the truncation.
>>
>> For example, we could introduce dt_device_get_address_checked()
>> that will call dt_device_get_address() and then check for 32-bit truncation.
>>
>> For the function device_tree_get_reg(), this helper was aimed to deal with
>> just Physical address 'reg' very early. So we can modify the prototype and
>> update the function to check for 32-bit truncation.
>>
>> Note that I am suggesting a different approach for the two helpers because the
>> former is generic and it is not clear to me whether this could be used in
>> another context than physical address.

