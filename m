Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53256DF97B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 17:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520248.807630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmcAX-0008IA-RW; Wed, 12 Apr 2023 15:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520248.807630; Wed, 12 Apr 2023 15:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmcAX-0008FX-Nv; Wed, 12 Apr 2023 15:13:57 +0000
Received: by outflank-mailman (input) for mailman id 520248;
 Wed, 12 Apr 2023 15:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrgk=AD=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmcAV-0008FR-D3
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 15:13:55 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ecc93e-d944-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 17:13:53 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Wed, 12 Apr
 2023 15:13:48 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.028; Wed, 12 Apr 2023
 15:13:48 +0000
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
X-Inumbo-ID: a1ecc93e-d944-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4CJLINdkooA43MQr8C58k69DehRV4CFeX4n8Jo1c2g05nrDNrSaIbqbccDOZ9OLXpE6j9S6ERS3zFYP7x6840neJWQn52JF4KqVXO9t5sHCorRkYpYkbUxcjlPd9wZyV0XU6MkdXfhJlgXA8vNn9A8mR5VcIAdeChoPQbTeGbpYGdGdMm3JpHzufuOWAP6Tlei5Qsk4vfKnwhUHTzonxvFmezj6l+/45tQcyxBmuh1/KEG+rkEhCGdJdC7SAyUD/2z4XOxqcRY6vm/is07wK3Ru/fjH/J4JHp4WO40MTvvZ3TdsHhuDO+pVRWrXHIF6SQH00M0p+gDZJXiktfjA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTQlqOpWjyxi5i6sQJNA7jdhRycZqCJb3WK+QddfC3I=;
 b=VMAL1Kkq6kZKfpEeKq3x+yrwNKqvNbg5G/y8cy2QSEqsJ2dpI95FNFP/5KyeHp8OJvyXYmfGTxTIbgQ59sDRYB20LZeLKODuWqLLWLvPtd2Nu9WL1igATrw4aKli6CScZUyVRQFdpJWyGnG6Vr8e0izcv5SplMdcX8pTX/gROhsIAOXtY9D7WsOaV/bUD5STHx2eEr7X9iP9ScBgNM6DBnhNjrmZ7PPm+Phi4UOqYojla1dVUwGHsv8+UPcWKtiwjVXimoyXFcJIUCPBEXCuaxsWsxaIKWVlZSbBuIaNvzAMB7ZeuDUsYpAWFsdnf/uUsN9E/zlFnmuVJW+zFTqNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTQlqOpWjyxi5i6sQJNA7jdhRycZqCJb3WK+QddfC3I=;
 b=a5bo6F9I5l+hiKp3LVPTQFE81zcwCrIxmxGj7GG0hFXzz5duJ6a0PxQRB3iTiAijVuMiuDJ/vSJwnx6BIlaKwpoJ7wCpQO2WQm0e8aJXVvaqirC9BXkFgHMS+7nATarFRhbLl0ZWM5ujZLvLWeHmagqSaUMAyloBGVD9qpbhFK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <41e4a106-c06b-ea29-4be4-ac46b561e17a@amd.com>
Date: Wed, 12 Apr 2023 08:12:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
 <877cuhpg1z.fsf@linaro.org> <87ile1clg8.fsf@suse.de>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <87ile1clg8.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c649a81-fd7a-4467-ac5c-08db3b6883d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JQB+wd4d+wpf889o0ntlAXJpcBnTscZCn0PQMCPOkoy7tweyvw1AtoXakiMaLmZ/qHw9Mo2YtfOWWYBiTDz1lRcjY5eapa/JVtSDU82g/fqk+dCUQKHlDU0HQfusbewLWUx2IkqT53RFZIAUf3t570zKqHSSZFDOngjUuBKH5UJ3t1IIudmNXFjKXHCAVfFO+Ct/Jzbm5rkK9qEeQhF2mzbAebHthV4Wvk865fHJwIl8hmwA0ulyPyqFXzotyrdsa/rZp3dvm2HEcHExxdQ+H354jWQG5QDGEymxpQUXmfh97h47SGTUgLGVmo6Trnz5fAVCPveRnem4KUFa/5I1uL4ts+WwnLP7QZ7CEdGa4Z/AqFdbgx9p6Af/DqhkBROBFjRI1YzhZWq0SdwL6bZwDB0ewKR/SqX80+Et3rp4D58vreYWK9s7n1U+JtipWHYglozvpDGSua1LuN3lFBOakRYVHkPRBcPIMRv7KtlHR0vK4WKDLoLT6m3r+WKB7XuLCSjb5jcklMiEfHjNMslLhucezNHcFILRQ0EC4/851FSNo3kOMm7u91/8Q60tPtulMYRv6pxTfXeE1uGm0OU2ZzJDvhksn7ERXhkjWSZqppGZgdPKAPjgdF6BmLGjsIUwF/UUGdGH+oNCsG5FMhQleA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(6666004)(8936002)(44832011)(6486002)(966005)(5660300002)(31696002)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(478600001)(31686004)(110136005)(54906003)(38100700002)(53546011)(316002)(26005)(6506007)(2906002)(6512007)(2616005)(83380400001)(41300700001)(36756003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTVOYVlYL2N4RUlIeU15TGZhcTlVajNHNVh2ak54dERnUzZuMFZ2WjlTdXlU?=
 =?utf-8?B?TGZSVThnSkFjY0p4MUpZd0lWbnNHbkg0K01aSDQ0dG13QTR4MFVJUzdsWHdF?=
 =?utf-8?B?WE9KZWtNUENKL2lZU3Y4NkVtbGljNXI3RXRRa1RMaWtUMU4xcGlIY0x3YTV5?=
 =?utf-8?B?c0F3c205cDR6dS9PWHNGeE9OOVA1dCs5TkJzZUFwMmtSSERYaDZnbFNueHVN?=
 =?utf-8?B?NzhYdDBIWE1HeE9PUmg2WHhFNkdaWGFQK0FPQUtaTStqYmIrbWYrR2htb1l0?=
 =?utf-8?B?SDlKZlhQMUxoMDNyWGdLenQwWjZmekdoMGdzdGlBOGhsM01QZGswR2ZvbUJI?=
 =?utf-8?B?ekhxSHozdXNwNFkrZnRjUVgxYXpkajI3aDQ2OWJOSjgwYk54L1RXdFl4ZGJQ?=
 =?utf-8?B?bFlTSnI4NG1ZWFV5SVd6WTkwM1ZSdzVZczFndTBJbjdiM2hKaENDN2oxT0lM?=
 =?utf-8?B?WUJ5WnJpVGcvTkx1S0VHRHZDWWlnMjhuQ1hWLzdiWGdibHdxY1p3Z2NGdVNk?=
 =?utf-8?B?cVRFTStIbXVrN2hzc25vTG9uRDZqSjFaK05ORDQ2Yjh3clRsRmRFQXZnZm1D?=
 =?utf-8?B?NW0yZDFTYzh6SHBvMTJZVTY1Q3JXSHlraERjQ2tHOTh3UUxYeStydE1DYytj?=
 =?utf-8?B?aUlDQTRnS0NlUXBqbnJrVE4rZXlOckxWZDRjSWZ6ZWdWWUpoM3VpWmV6dyto?=
 =?utf-8?B?NWw0QzJqMUhtVDhjSkRNMS9aLzF6N3B1NGpjZkJIT2V1UldkTFNzTUt6TnFn?=
 =?utf-8?B?Sjgvb3FHZGpUaDFNcDN6dVdKeW1IMDdOUmVQcnk5UGFNbDc5VXVLb204dVFM?=
 =?utf-8?B?eEVCTUxTMUh6MEdsR0FQeWZ4SEJmLzVaSlpXcE8rNnY3VE1FL2F4YXpyWEEw?=
 =?utf-8?B?SzlkNHZlVGJOR1BXMHZiZVhhT2d0SXRISHVZejI2S2M0ZTM0VDIvbUprVTE1?=
 =?utf-8?B?QWNqM3FjWFNHMENJK0VEVXB2ZER4aWw1T1pTTWZoc2w4NUhNQWltSmdSMFNQ?=
 =?utf-8?B?L2pXcUc2VjJmbE5BdDhQR1o5emx4YjQyQW5jSTRVeVhZTlUwUmNQYkNFU01I?=
 =?utf-8?B?bHoramRYTXdUZXdDMnpmd2tSZE9LYUY4bVNPd0hGZGJINzRFNWczQkYzVEVo?=
 =?utf-8?B?YUNidTIxYXRzQ25jY1VtYXhucEFkcmNtSUpCTm1jOEdSNlZRd3FTZVJWNWF5?=
 =?utf-8?B?RVkvVVBreElFTHVHVWwrY2hHbjhVa1J4WHRzbXpOUFc2VmsrNHE1NnZYU0pU?=
 =?utf-8?B?dzFTMWVkQnlreFo0WERRSXRGeXZFdzRwNEVxcTc4Ymg4ZHZFRWdyekpPaVNs?=
 =?utf-8?B?SmlnbFAra05SeGgzVVZ0aG5zQm9nRE9NMEtVWGx6SkZ2RmlvdFRzVFozbFR0?=
 =?utf-8?B?TExZVXV4dDZBREtmRUYveVdOTFgwdEFadCt5NmFQd3dyZnBxSm54eGZuTGNK?=
 =?utf-8?B?a2dNTHJQSDA1RXdKQ2Q0U21pWk1aRy9jdmhDcndsOVNpNFl2bVc3QTFieHJW?=
 =?utf-8?B?ZzhqQSszZW5NYmxLdDRxbXlWbEU2OXhrRDZycnMzc09zOCtHaXMrVlpOamNP?=
 =?utf-8?B?d2ZqQ2NZTFEvL0wwcE1DOTZFUXgzNjFYNVl2cElPY3NNejVUeGhSbFlDVVZP?=
 =?utf-8?B?NkJVeFkrbWprTzVaRS95bTQwZlZrUlY4OUx4L3daYVcvcGRZelU3U2lLK0VX?=
 =?utf-8?B?ZXFqalBZU2tGbzVBK3pjaDR0cCtjZmczc3pUL3djSXI3RTExbjRZeUFETmYw?=
 =?utf-8?B?ZC8weWhHUUxxNjB6SExYVVUzSUNMbEE0eFhPVFBVckJBR2dBeHRYNkhGRVhL?=
 =?utf-8?B?dzhoSGZjcFhBTFFTRHMyaDlSc1RIc1E1OHVBVTdvMVM1aFlCWElEZTFhNVpU?=
 =?utf-8?B?dE1JbDBYNTFEUTRyUUVJcTZMNXdzK1FpY3pFakNqZENER3ZnUDBBcklKWTVu?=
 =?utf-8?B?Z0VSSU81M05IcmpYNXRHMTZKYVFjZHNFK0NvZ3poN0VBOCtwZkhySVpCR1p1?=
 =?utf-8?B?UndNZmRJOEpNUTlHSW96Ym1rU01UUGozSFdQTjVtY0ltaG1RUit6ajhPcVRH?=
 =?utf-8?B?bkEreTdOZ2loRzVvdCt1SmJSUFd2cFlZeGdjZitxenRiN2E1czU4SUVrYnJV?=
 =?utf-8?Q?cE5WM0mKFclvp7CL+pdl920Yj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c649a81-fd7a-4467-ac5c-08db3b6883d4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 15:13:48.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yU0jEEMPNN6yexGevDFCMMIsBFrUeKxOvW0ntI0xa3+WzwJ7go/mSw66MdUof4ihDtP46dJhEWLrvhJkYmPiOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603

Hi all,

Yes, gdbstub build issue is only for for aarch64-softmmu target and that 
was the reason for this patch. x86 targets build fine with 
''disable-tcg" option.

Thanks Fabiano & Philippe for sharing the existing patch series for this.

Regards,

Vikram



On 4/12/23 5:51 AM, Fabiano Rosas wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
>
>> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>>
>>> Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails the
>>> build for aarch64 target.
>>>
>>> Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> ---
>>>   .gitlab-ci.d/crossbuilds.yml | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>>> index 61b8ac86ee..6867839248 100644
>>> --- a/.gitlab-ci.d/crossbuilds.yml
>>> +++ b/.gitlab-ci.d/crossbuilds.yml
>>> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>>>     variables:
>>>       IMAGE: debian-amd64-cross
>>>       ACCEL: xen
>>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>> x86 should handle --disable-tcg fine.
>>
>>>   
>>>   cross-arm64-xen-only:
>>>     extends: .cross_accel_build_job
>>> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>>>     variables:
>>>       IMAGE: debian-arm64-cross
>>>       ACCEL: xen
>>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>> Currently this builds qemu-system-i386, but with your changes and the
>> work Fabiano is doing:
>>
>>    Message-Id: <20230313151058.19645-1-farosas@suse.de>
>>    Date: Mon, 13 Mar 2023 12:10:48 -0300
>>    Subject: [PATCH v9 00/10] target/arm: Allow CONFIG_TCG=n builds
>>    From: Fabiano Rosas <farosas@suse.de>
>>
>> We should be able to have a qemu-system-aarch64 supporting Xen without TCG
> The build should already be working on current master after Philippe
> fixed the gdbstub issues. My remaining patches fix tests and general
> runtime issues. I just sent v10 to the list.


