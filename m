Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B97206D5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 18:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543195.847953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57It-0004zs-1o; Fri, 02 Jun 2023 16:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543195.847953; Fri, 02 Jun 2023 16:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57Is-0004xP-UT; Fri, 02 Jun 2023 16:07:02 +0000
Received: by outflank-mailman (input) for mailman id 543195;
 Fri, 02 Jun 2023 16:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q57Ir-0004xJ-VC
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 16:07:02 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804de2b1-015f-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 18:06:59 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 16:06:53 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 16:06:52 +0000
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
X-Inumbo-ID: 804de2b1-015f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baXw4koMvisnnc7+TYfL3V7OUuhnqwBt8MHotv8HafyTC04JYOS9PRKSvMsZat6lSnupXDmcTL/D6w5w5oIl3TxC11xjEiKMdGONNGuCPcfhvVRVYttpcXNP0SxMBOMxA4g1r740gHHIAdn0ZOc/RzqfPfJXpQpn3Ouf0P82i9RxFFi0LxbUvh4cNN2BXLSclayxF/LvXFUFsfQmrldnUEIwB9Jc/GHDZmgaayRtXMAxJN4EG6/oeJORie850v6grwSYv8jTrMEd7NJXVFKrDMH+p7pSSSFxzSMJJYnYPDSDClOruO7KLU3l7/Pex0mX8VsUOegVzrVGhAn4ZWWWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a0koAUDfWHrBhedsq56FtDxkqOYbJZjyQN64OymmH0=;
 b=AQ0oFmz+OkBVzgMF3aydhXReEGmyqig3eRy3KB0xdLsFkF5UyRTLMdh8vuKG8UvYvOrX1+kY9W1t6HlKPH1874XFiyQfoB6ef3ptdvNKzDHrbOPdnQtUBxFwPbNcipBL3BkL0bHJ5NN3y3HvI87VQymb4NUFAbLLdidUDMMKcf1dG5oOVhLT2eIaeXzljq0MGMNBVZ5kQNEBoV6BwrFvBdPIIxB0TfIllwyteOCnThdkog5cMj1Ld3WGWEroFIJ1R/KMVhcgeVfl/fNwhxlTPurBad9zZITn9+Qu8oXW1No4w+J5PVdH6dRA/HBtiarC8R1RjIuWMRc0Rk9E5Yh8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a0koAUDfWHrBhedsq56FtDxkqOYbJZjyQN64OymmH0=;
 b=dOVPBDB7RTZkhvQu/3sEcT2/dq3wWj1zGGaMmM4JC+o8G07TxVMLsEFg8moGQsvJNm0/nfBW3Habrz/wBIJr4oJ9XF62y2aTzHv0OljBYp+1Vjjv3sTIYAH/AYXNwrAJlY+28aI0MfHtGEI2jjU0cyiGgz3sQe2+ubs0wwg/NGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6e1ef77c-0df4-7566-0aab-04841e927c40@amd.com>
Date: Fri, 2 Jun 2023 17:06:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: Listing the tools required for Xen development/testing on x86 and
 Arm by the community
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
 christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
 Stewart Hildebrand <stewart@stew.dk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
 dfaggioli@suse.com, elena.ufimtseva@oracle.com, anthony.perard@citrix.com,
 george.dunlap@citrix.com, rosbrookn@gmail.com, lukasz@hawrylko.pl,
 dpsmith@apertussolutions.com, mateusz.mowka@intel.com, kevin.tian@intel.com,
 jun.nakajima@intel.com, paul@xen.org, Wei Liu <wl@xen.org>,
 konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
 samuel.thibault@ens-lyon.org, christian.lindig@citrix.com,
 mengxu@cis.upenn.edu, tamas@tklengyel.com, aisaila@bitdefender.com,
 ppircalabu@bitdefender.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>, Xenia.Ragiadakou@amd.com,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
 <ZHnV2lhkU1EkrQ68@Air-de-Roger>
 <9079757e-72e3-3a68-5e78-9130822003e9@amd.com>
 <ZHoJxMWlOLT02yFB@Air-de-Roger>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ZHoJxMWlOLT02yFB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::25) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: a3be72cc-3fe4-4604-5ab0-08db63836130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7vKKmhL6X8DmnjjtOB7lFZPlci6j9LecL1nxGaWEefxOsxyASWxLCh4tq2Vhc2d1wybJOUmHFRN4lqhqPt+qszkylHG7ZteUK6da8iREwa/0W0A34XGD80ivxveYdSFzNji/Ax3h6XumoVwJJk6MDx24SEQ80obgQGZCcaXdfBNTDiZyoVBXoLFBYEHczCiDSpv/C5Q4GguOMR5ObK8TGFDccJvHRaM6/vJu7uglDI4BUTVDPF61S5JQrnb5dRSbIaCyCgAdFqquCfHt12+b25zSUXIf4K29pPfCEKpqpZntTCuXlspMFffKkpyAuSYukHO94ZWswKmr2OCfcOGPnxfZtX63SsduGZmqWAlxEImZQBRP+5nss63KR0VHHw+ksSRyBA75B6XYJtW0eMY/NWO43m4zIH5yTrFTD2r4M5D3iLREy48WpsRQnUV1HL/b9gAnEduiFZB0dyvLnpfctXrCqEBoogYwi3LfAmdKAE7lJItfqm/ohDa8ENd+gyMDdSZPDfqVfI0EZSXmjUa2YMX0vndb3zjA88R+LfRG1WijDDI1lv6GS0vBgYA/VbtuOFRXGQFbymvWLXqLZmECv+LWUI9mkFhzqHi6W4Tn/XgWywKl1lS2fzZ1yq2u9NM6VCFPPpgrVOHxQL79iEZ9H32VN01Tu0Ks27HSgk1XDtCqRk8yOHNHLGzPJqA4aR1L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(54906003)(8676002)(8936002)(2906002)(66476007)(66556008)(66946007)(6916009)(4326008)(41300700001)(5660300002)(31686004)(7406005)(7416002)(478600001)(316002)(966005)(6486002)(6666004)(6512007)(53546011)(6506007)(186003)(26005)(83380400001)(36756003)(31696002)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3M3SDAxYkNLeFdIdjdVV2lrdGsyUkh5U2wzS0RMcEZtRk1ObXpVQXhhUFZv?=
 =?utf-8?B?TFBrajZnZ1h4WndnczVHL0ZPdG5Nc0xYVmtxOUxnbUljUnBPbC94ald3L05n?=
 =?utf-8?B?ZVdRclBOU3JEMmd2aGo4Nms5R1NjcjF3SHFNa1lDbU41OG1aV0RnOHFYSmlr?=
 =?utf-8?B?NTVMK1crZGVqVDdXQU84U2xack9LUnoxOXUrakYvR09EUmNXcW1BejhXam85?=
 =?utf-8?B?dWRIRmZrUVcwZndUaU1oU3VhMFdXa09OVXZWaVlyWHE1aVB2Z2s4WWJ5cVhr?=
 =?utf-8?B?V2pvVXVqTjhWcUFJYW00VVpzaktEc2RUSlRaLzlEMGt4UFpYU3ZQZThvMkNl?=
 =?utf-8?B?NzZmdTBxOHFOQTRrcXVhMVAzY1RoNFlaeXZPSnUxS1djbnA3YlphMzJRU21l?=
 =?utf-8?B?SWRwREU1QUtVc0o4aytIZXMvMG9VRzdLZ2lKeXF0WXp2R1I1d2JvUCsvUXdL?=
 =?utf-8?B?elNVcWo3UzQ3aXh3U0RHTnhCWjUza0pnbnUrZmRSLzh0VW9HOUhFdzhvR1Bq?=
 =?utf-8?B?YzdhRTlZUEVJS1JaMXZROTB3SUh4cmdUVlpWWGFGV2tzTnVpRWZFR1dPQkJP?=
 =?utf-8?B?c0RpaElmQ1RCZHdIZEUySjJUSFlnMCtxNjNJYmV4dnV1RnV0aU9ScEg3QnRR?=
 =?utf-8?B?VWFGWVBUNVBYVzRZdDJzcHRicmVCZFpVOWJuc1k0Y3V5aXM4bVZkbytNYXQw?=
 =?utf-8?B?c3VHN2psdjdrMGJ2ZFBwTnhIRzRjWmN3VXE2clI3K0p0Y0FDM2t0empRMHd5?=
 =?utf-8?B?dS9kMXR2amNtT2FsWUE5RFVJSnZLNU1YelozVkN5akN5Z1hGWVJtRHNZUFZx?=
 =?utf-8?B?eEUyWFFlZFZHSW93R0w2bndJa2l5elF0bkZEM2lPTW9mUmcxcUNST3phcEwx?=
 =?utf-8?B?dUdKVEgxZjhrRUFhZGVZc1g5czJPTHViU2NGckltdjZ3VVZGSEc0Mmk0bFZW?=
 =?utf-8?B?aVBzWS91NmRWMXBoTk5ZNXJxaldMSTFGM201TW1kR0VrYlI4dEMwTHVad1JR?=
 =?utf-8?B?THFVU0Fta25zaGd3ejdBblFyc2ptL0orN1AxakpXdDZzb0ZjM25Jek4wdTNK?=
 =?utf-8?B?a2RoQnVWVFpRc2FYSUhGYm5GSjJqNHREVGVMNWV0dEgwZVVOdDlUUkNaTHZw?=
 =?utf-8?B?R05OVFlBUHVjQ0xQQ1FjbDVRWnhaa0R3dG5KcG1JOEE5dXd5dHpGT2xUOFVr?=
 =?utf-8?B?a1NJWjZXdkZrS2k4U3l0TkhsTnFUVE5pdFlld0pPV1FIUEwwUXBsNkF4NlF1?=
 =?utf-8?B?UmJRZ0tsc0VlS2FxSjBtT0lOTWJ2d29oVWZIRUQ0UFU0UTlBdldFNW43YlZ1?=
 =?utf-8?B?eXJMelV5cUFIeHRHNm1OOXJZdUtBaEhlZUk2NEdBaVdnTnNCQXUvTGJsUU4y?=
 =?utf-8?B?MlpuRE9WMDduYWZQNSt6eFoyQmtyMFhjcmdrQmlRb2RPdmlESldEOVRMOHk2?=
 =?utf-8?B?NmJ4Zm9BdFBoRzZPT00vSEhWbExnRDRxamd1T0hDVDRIU1c5Nnp5SG82V05j?=
 =?utf-8?B?L0hWWmdPaXI3b3ZUa0Eya1VKM1lMZitac1lROHZDM01QQlh4dnRoSGtmOUx6?=
 =?utf-8?B?K3djZjdRTGgvOWxkc3dFSzl1U203ZndxaFNTR2NDRGQyKzVnUGhFZkFPMVZn?=
 =?utf-8?B?cktTUHRBVnRFN2V0VnZlb2pMVUlCcjk4UHNtdVpRSTlRc3owZDFTNG5nMTRy?=
 =?utf-8?B?elRoeGVZSElVTkdwZVcxUWxOWDA2MllxTXJhNFRTRGMzbVZtbXFRZWdLK0NO?=
 =?utf-8?B?K2ZoNGY5UENQOXpZK2NQOVJ4elVCY01CVWQ1VmZMM1QzcU9JZzJBbzhrYUZa?=
 =?utf-8?B?TnVEYXk0Uk1MQzFZU2pySi9TUmp5S0pwWEZiR2o2LzMwblp5RXNqZVBENjFW?=
 =?utf-8?B?TjJYT2x6RlpPOCt5Z1lOQk1obEFHcWc0c1lhaVZXVlF3N0grc3NRZHBFd0hR?=
 =?utf-8?B?NVh4NDJwYzR4UFpKdVBFaGswVmU2YmZCRlJ4SzJWTktPanpUT2hrZEdWVHRT?=
 =?utf-8?B?bEY1aHQreC9Nc2hmZWVqV1kzZlQ0WTBxaHdZR0JaRHVjUm4zMW1abnBId1Jn?=
 =?utf-8?B?d0QzUmhoZ29ld0V5RFZnZHFQVmVNY0JYTkYvUlBrL0JsczBWcG5qdkhRZUUy?=
 =?utf-8?Q?ntBrCYeCh1SaD00f668K2yV4z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3be72cc-3fe4-4604-5ab0-08db63836130
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 16:06:52.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEsYr8sRcL+ANhXDpkr77TyK5d5oYEMlA7AmGgWD73wewX9d3wcKhR+/3cCDPJ/WOnTNiVYZFSSBGX/WSmWSCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610

Hi Roger,

On 02/06/2023 16:24, Roger Pau Monné wrote:
> On Fri, Jun 02, 2023 at 02:46:03PM +0100, Ayan Kumar Halder wrote:
>> Hi Roger,
>>
>> On 02/06/2023 12:43, Roger Pau Monné wrote:
>>> On Fri, Jun 02, 2023 at 09:48:48AM +0100, Ayan Kumar Halder wrote:
>>>> Hi Xen developers,
>>>>
>>>> We are trying to better document xen project development processes and
>>>> related tools. At present, we are targeting **x86 and Arm** only.
>>>>
>>>> These tools range from bug/change request tracking means, compilers, infra,
>>>> editors, code-review tools, etc which is connected in some way to the Xen
>>>> development and is being currently used by xen-devel community.
>>> What is the end goal of this?
>> We are trying to do an initial assesment of the requirements for Xen
>> functional safety.
>>
>> As a first step, I am trying to make a list tools which are in someways
>> related to Xen development/testing/deployment.
>>
>>> I'm kind of unsure why do you care about which editor I use to
>>> generate my code, that's up to the developer.
>> I agree that editor, email-clients are something that are an individual
>> developer's choice.
>>
>> However as it is related to Xen development, we want to atleast put down
>> some of the commonly used tools.
>>
>> At a later state when (and if) we go through the list with a safety
>> assessor, we might prune some of these items.
> I have very little idea about what's required for a safety assessor,
> sorry.
Same here :)
>
> Will this have an impact on what tools are allowed to be used when
> working with certain parts of Xen? (the safety certifiable parts I
> would assume)

At the moment, I am not very sure.

At the least, our first step is to gather the list of existing tools.

>
>>>> I appreciate if you can let me know anything I missed or mistaken and the
>>>> version currently being used (for some of the tools).
>>>>
>>>>
>>>> 1. Code management portal - xenbits (https://xenbits.xenproject.org), gitlab
>>>> (https://gitlab.com/xen-project/xen)
>>>>
>>>> 2. Project description - wiki.xenproject.org
>>>>
>>>> 3. Project management - gitlab
>>>>
>>>> 4. Code review - text based email clients (mutt, thunderbird), git-email, b4
>>>>
>>>> 5. Text Editors such as vim, emacs
>>>>
>>>> 6. Code review history - xen-devel mail archives
>>>>
>>>> 7. Code revision management - git
>>>>
>>>> 8. Xen coding language - C89, C99, Kconfig
>>> assembly (gas), python, perl, shell, Makefile, bison, flex, ocaml,
>>> go...
>>>
>>> Likely more that I've missed.
>> Ack
>>>> 9. Testing tools for Arm64 in gitlab CI
>>>>
>>>> compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)
>>>>
>>>> binutils - GNU Binutils for Debian) 2.38.9
>>>>
>>>> emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, poky
>>>> disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)
>>>>
>>>> dom0/domU kernel - kernel-5.19.0
>>>>
>>>> rootfs - alpine-3.12-arm64-rootfs
>>>>
>>>> firmware - U-Boot 2022.10
>>>>
>>>> 10. Testing tools for Arm in gitlab CI
>>>>
>>>> compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, arm-linux-gnueabihf-gcc
>>>> (Debian 12.2.0-14) 12.2.0 (most commonly used versions)
>>>>
>>>> emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)
>>>>
>>>> dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from
>>>> Debian)
>>>>
>>>> rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz
>>>>
>>>> firmware - U-Boot 2022.10
>>>>
>>>> 11. Testing tools for x86
>>>>
>>>> compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) 12.2.0,
>>>> clang (from Debian) (most commonly used version)
>>>>
>>>> binutils - GNU ld (GNU Binutils for Debian) 2.40)
>>>>
>>>> emulator/hardware - Qubes HW (**need details regarding machine, firmware,
>>>> etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)
>>>>
>>>> dom0/domU kernel - kernel 6.1.19
>>>>
>>>> rootfs - alpine-3.12-rootfs
>>>>
>>>> firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by EDK
>>>> II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), GRUB
>>>> 2.06~rc1
>>> I do use an LLVM based toolstack, so that's usually latest LLVM import
>>> on FreeBSD.  We do also test this on the cirrus-ci, see:
>>>
>>> https://github.com/royger/xen/runs/5334480206
>> Thanks, this is interesting info.
>>
>> For the moment, I am ignoring the downstream forks of Xen.
> That's not a fork of Xen, just plain Xen hosted on my personal github
> repo.
Ok
>
>> I am only considering the tools used by the upstream Xen and the associated
>> CI/CD.
> Gitlab CI does test with LLVM toolchain also.
>
> osstest does test FreeBSD guests, but no FreeBSD dom0.
Ok
>
>>> I_n any case I think the scope to some of the questions is unknown,
>>> it's not feasible to expect to list every possible combination of
>>> Linux versions vs Xen version vs whatever guests versions a given
>>> developer might be running.
>> I agree . That is the reason I am picking up the compiler, linux, binutils,
>> firmware, etc versions from our gitlab CI.
>>
>> It also acts as a proof that we are testing Xen against a known set of
>> compiler, linux versions, etc.
> OK, so the question is not what every developers uses, but you trying
> to narrow down the scope to a specific environment?

Yes, I am trying to do 3 things here :-

1. Gather the most commonly used developer tools - For eg vim, emacs, 
mutt, thunderbird

2. Gather the current tools used in any existing upstream Xen testing - 
For eg gitlab tests, OSS tests, XTF, etc.

Here, I am particularly interested in the libraries, compilers, 
binutils, kernel, hardware/emulator, firmware and their respective versions.

3. Gather all the dependencies for Xen - For eg C89, C99, python, Asm, 
OS packages mentioned in README (as Christopher pointed out).

>
> Maybe what you want to do is create a specific container in the Gitlab
> CI that has the specific tools versions you care about from a safety
> certify angle.

Yes, that might be a possible approach.

- Ayan

>
> Regards, Roger.

