Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390126444D7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454853.712406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YGz-0001mo-NO; Tue, 06 Dec 2022 13:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454853.712406; Tue, 06 Dec 2022 13:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YGz-0001k9-KS; Tue, 06 Dec 2022 13:46:13 +0000
Received: by outflank-mailman (input) for mailman id 454853;
 Tue, 06 Dec 2022 13:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YGx-0001k3-S5
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:46:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce26e80-756c-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 14:45:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9654.eurprd04.prod.outlook.com (2603:10a6:20b:476::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 6 Dec
 2022 13:46:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:46:05 +0000
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
X-Inumbo-ID: 4ce26e80-756c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddZ91rCTqgxY7yZ86oFWqtPQ//hHgz7+cCCPKVlbW7iJpSvfRB8FfJdQYKpv+LQ0A37R8ATz3GWmHsSFRBGBFN6gVfbem9NNh6WgfyQpn+FYWybbrA82MVaX5dtdPhjBsBrtAQyWu2L89fq2WtT5sBN0arOcZUYy3uXkNshfeL3p8rPvVlAoTIwG4p7WACXdUEeNqhx2FBibUvBngyvuNKo6lkKpqDYNB2qV8V4Js4xGE81gbW75QpvAfaVtabL477bJj0abhhW62KK4uMFWN2YPKN6vFFl9fOyU+iaWRG3+yQ5E07EnPGPth/HCU71LZjKk9cvVap8+tgC1lH7Pbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duFnB/IwvJt5wp9SXSqzjxVVxW21ojMLD7177JkGJ10=;
 b=W/ffVA4IsPqm/Z8kvYX/8vyWdDX1iP2KtJh3Uiz4ZI+U7gVMnSVVV+RDBXidLB5uNr6nHiFWwyDWi+QLstJQHNuLDFKjZ3w++mvdo1lXrFuuhzxtuGyfzZ+lFA1O0Wi9UjmCgktZPKrHR6MZ2HTNdbIt7g40hgJ+UUox3whaE50B3MY1keKOgpW7ghNGZp3GzRtirz5tTCG5hxojxNDja17opH0f1i3Pmo3OtMrNv+nonq6sSDHnk+FiDZPKB2yDe+aHU3lMAdUqIdI0fu622i1sAseQafGhSXkKkiQMwvk3G8zklxzo75SBGMTm99r1oG56srKb50mRqfMrs3J5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duFnB/IwvJt5wp9SXSqzjxVVxW21ojMLD7177JkGJ10=;
 b=4nJjGG3qeYys8uXyEybYHsMUXsfwFfKn9u6/AaAhXtoaqHKvBV6eQrD3GIjkOoGtP86szvzHr3LrnMARwIYxH/1CICiDmHp8pJoyFtBH14v59qGZ0ZnFVeTcHXzhdRVlaA4LiUsD3+qd4z9gEkj2I0gTOFANJof6BJ0hklg68N+1CjuDH3gokXmzAHSasPH9rGOpDufCfL3uz8QXGrC9fsNNkYclnis+JbRyUZWqTZ/QdNhX3FwVAgR3GOJ+wTorMpohqANEuoHI/oO2PPPpK+lUWac+cdU6Be96bADkFqsNOgjcZbrpLkmjgG0exKKj33GYax9kr+Y723bn7jBPtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf7f8deb-ec5c-c6ec-ba5b-b7099830fcb9@suse.com>
Date: Tue, 6 Dec 2022 14:46:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen: Remove trigraphs from comments
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221206105932.11855-1-michal.orzel@amd.com>
 <0bfa1b1b-7ae0-03c9-0291-5ce3f6877693@suse.com>
 <92cc2cf3-4c95-1395-be2c-d076fa5d397b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <92cc2cf3-4c95-1395-be2c-d076fa5d397b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d01b72-b87e-4cdc-7588-08dad79038d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KrqwSfU2/phx1G5Xw8UHxKzU9cJcRiULYaVztwWWKbO9ZXqnWQno/Vtl2wE/fLgSJA8SLRFUm4zZ3T4j67ZedpdVwwu+E57XPGJK+/GATGWZ2IlHX5MBn8BEyERF6NhOc/zkBKF14CcbFtQ45LONUZZEyC1trKR4gVVqAGpBSzNN+VJ/ddPP4cBhL1IPh7guAMN831jhPm5oQTAKTHI4GeqHk1zqHwv5OEfUzgP9d7Z09JRnug+H4b2UC+0+yU/H4JgDiRoUmS/JAIvitNChEiK1VNgH313DGBq0PIMPkOUWeojveQVsGsRJu5Z8bPcDNeJzmeXi/YKxJi+5fUG5NjfqN8SKnP+Klwff2XBY+icl3lskkLv8SHSuu3wLoacwT0Qm1/0ugWdb5ao9cRJ1bXEG2nBtNKtPhLNNED20tCq6EhL3GI+f1uOKQFFGL7WomZVKDRsAMjCtBl09TepwUACSKAniYWDjVfXBlEJzYkUbx1vpIF/Rt05z6su8IOvsIUGY5mzMvGz9cJKFoeSDYLmSvHP1C/kpIaU1bocAYKVQhqRBVDlPevNaIYqxq5DrnfKtjSKxj+stU5+etN7WjJwWV0p7IIIGk1JKk4rKZOAf0n+jtYMKtetQt5jOotQxTNCCSu7Zndu6GppmcUNa7Ub28QyhaezWUfDTKT63Nmbrx4t2SOkIJiKQD8nMPdW2aUtmPJH27uHQxW1x01drOD/4Lo3XllDHabJfWR4ojQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(8936002)(41300700001)(36756003)(2616005)(31696002)(86362001)(8676002)(316002)(6916009)(66556008)(66946007)(4326008)(54906003)(83380400001)(5660300002)(38100700002)(53546011)(2906002)(478600001)(66476007)(6486002)(66899015)(6506007)(31686004)(186003)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THNxeENrV1FrVS92OGk2dExicncySE1xQ0w4ZWpZWEZRcjFFY0RZbVRtR2tM?=
 =?utf-8?B?R010Wnd0cE5mOHp6dnNQODVvVEN5WEdnSDc2UGFEdVZpcDNDeHNKcEFLUHli?=
 =?utf-8?B?c1Z5M1krZ1pKdW9qR3VOd0tGS1ZPd2FoQzlOOWhsVVhXTGRZUER2Tm9aYVZj?=
 =?utf-8?B?M2FMOWRrdUFPQTY5bWFGSG1lYjZlTmsrM3BwSit2dzd5WXhvcnhjKzBtSitl?=
 =?utf-8?B?OHBYYnlYS3dYN3MvK1FRemVFaWtaN0ZjeThiV1Uva3F0UjVQVDRuMGNkcFFp?=
 =?utf-8?B?SEpmdldDTS80V2VndDNTVElQVVNNM3cyZEM1czNnazUvOEdzZXU5SE1xN3Zj?=
 =?utf-8?B?MytsQmVTb0FxckttQ2xyRVAyMnR4SzRpVFJmSHlQaUhna2pobko4T0s5aHgy?=
 =?utf-8?B?UlVTdzhOSlhOTlliVjY2dGRDRCtUUVF0NCtuVk5uRVQyTU1nTG1TTlQ4dlFr?=
 =?utf-8?B?U2RyOXlpVExDaW0rYlVMaWFTSmh5VDdvV1NyeEE0bE1wVWtFbU0rdXJrdGVT?=
 =?utf-8?B?YWVqczhlUmx3QlZoSE1XakROc2N3cnlZSUxBaUhPWEpwdHlpOEtJc2x2WEhM?=
 =?utf-8?B?SmorOWN0SHZhMGI4eGxJT2pkWEJEQ1hDdVpyNmJBL1FhNUV1MXM0QTVTb1ZY?=
 =?utf-8?B?Vm1hbmtNU3hIdk1FSlZza09PeEhnZVQxV0hUalpYSTh1amhrSSs5ZU1DTHRT?=
 =?utf-8?B?RHBUczBvS1lkVytlL3h5QmViYnVPYVpsZXhubmNnQ0lCbFhTck5wS0NyWEpU?=
 =?utf-8?B?cTArU3kxZ1UrZEVaMDczaS9vWExOa3JkNERjMEdaTWV4UWgxemxZNk1BM3g3?=
 =?utf-8?B?STkwWG5haUg0MFV1dHpFSE1ScjlTUnFtQ01FU1lpTnViTENqMlE0MkZibkNY?=
 =?utf-8?B?Szl3WmNmS3ZSMG45WnV2YU5NS1FmMjhUOWVrSndzd0pwTk81QUxwUlU3aldU?=
 =?utf-8?B?TW4xRnlHY2w4Tlc1UlJ1QkxIYm1WQlhzZGVOK2o4NmgzQVVDZ2ppNWJzelFJ?=
 =?utf-8?B?QnpKb0lMdHV2am1vaU5BMkRGbjZXcEt3WGJpNEpNQjdKWVZYRndTU2xUaFpv?=
 =?utf-8?B?V3F6SDhpTWc5ekNVYWNSTFJ0L0ZBd0dkeDQ5N0dqalkrTzYyQitpYW0rWHdF?=
 =?utf-8?B?QW8xMFFpSmQwSzk1SGg5SmFHQ1lTLzNHTjVHZDlLcDFCeVpTN2VMSFNtcXFI?=
 =?utf-8?B?Yyt2YTllSEU1MGgxM0NTUWo0NWxURXM4LzhoY3YxaC9UUkFxU3VZRHpSaDBU?=
 =?utf-8?B?RFFmdzhvMlFocmdVNTF6NzZMTGJrRlNwR0w1bS85dGVvT3Z0MzVFcE1FeXJ3?=
 =?utf-8?B?V1JqZEVzQmgrNXA5TFQ4MXJCdUc4bkVvcjVqS29WVm5UUGk4YXFVQnJpZElt?=
 =?utf-8?B?b2ZSam40ZG0xemFaUVd5b0JabUNmYVZ5Z1krbTV2ZmcreWtycVFsblQ2UGJk?=
 =?utf-8?B?WHl0M3dYM095dlN0aURJZGNITkU3STdHVWNkZlNTc0pqVUZKVldPZTNKZEJz?=
 =?utf-8?B?NTFsM0svMHJCZm1LaldqOEVoNHNwRFIrK2EyMjArUUc4Uk9qWG5oSUp4N0Vi?=
 =?utf-8?B?c282Nm1ydTJBYVdpWEdmY0w3cHpNQ1R0NGI4eGhNVzJ0VWpCcXNvQnB6Uy9h?=
 =?utf-8?B?UW1tdmlvbVJaNjRaK1d1UmFuczNlU0g2UThhQ2UxMXVBc3JNVFl6MzJRNTZx?=
 =?utf-8?B?VENycWt2VTBWQVhHcXJqcHJkc2N6amhXRHJ0aVJNVVluZW5mcnlFNUtyYjQ5?=
 =?utf-8?B?akhodnJpZ0FrUG5td2lEeGhVRlAzMFNBaWs4N3IwYTgxR3dVdk5qTkxDK0tV?=
 =?utf-8?B?N0ZYakg2QXJBcFZwa2RaRHhQOEE1UFQxdEQ1OFB3MmxxZjhqV3hUblNNNUZ3?=
 =?utf-8?B?K0NlRHhSUHoreTBNNzFGbjJGREgyaGhjZDE5eVJqVEdFbFpuMVJuY2lsa0pY?=
 =?utf-8?B?YVZXV3ZReDdCa3cxZ3RkbkR3TUc0Q2JHU0QzR3VQUlRUZjB5cGQ2cFg0Uk4x?=
 =?utf-8?B?N2x4R1M0ZjdWQUx6b05BKzhQWnVFZXEzSCswU1JwTGVlVWxqVjV1SDNtU0N0?=
 =?utf-8?B?dlJVQWNnZm55ekhYcy95dkVkSWlkK0dNM2pMaUpvbUJxUkFWWUIxT3E4YUNx?=
 =?utf-8?Q?DymywU45n4cMFnp71t0/jrewt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d01b72-b87e-4cdc-7588-08dad79038d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:46:05.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzJTgQddp6NMCXuHzMCfCmmlSNJ+RYeHLgtlNb2/BHh6GuMU6aXA8GGp2O34LDWPWJSSQfyY6Lk40A+jT4wgsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9654

On 06.12.2022 14:05, Michal Orzel wrote:
> On 06/12/2022 13:42, Jan Beulich wrote:
>> On 06.12.2022 11:59, Michal Orzel wrote:
>>> --- a/xen/include/xen/pci_regs.h
>>> +++ b/xen/include/xen/pci_regs.h
>>> @@ -246,13 +246,13 @@
>>>  #define  PCI_PM_CTRL_STATE_MASK      0x0003  /* Current power state (D0 to D3) */
>>>  #define  PCI_PM_CTRL_NO_SOFT_RESET   0x0008  /* No reset for D3hot->D0 */
>>>  #define  PCI_PM_CTRL_PME_ENABLE      0x0100  /* PME pin enable */
>>> -#define  PCI_PM_CTRL_DATA_SEL_MASK   0x1e00  /* Data select (??) */
>>> -#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000  /* Data scale (??) */
>>> +#define  PCI_PM_CTRL_DATA_SEL_MASK   0x1e00  /* Data select (?) */
>>> +#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000  /* Data scale (?) */
>>>  #define  PCI_PM_CTRL_PME_STATUS      0x8000  /* PME pin status */
>>> -#define PCI_PM_PPB_EXTENSIONS        6       /* PPB support extensions (??) */
>>> -#define  PCI_PM_PPB_B2_B3    0x40    /* Stop clock when in D3hot (??) */
>>> -#define  PCI_PM_BPCC_ENABLE  0x80    /* Bus power/clock control enable (??) */
>>> -#define PCI_PM_DATA_REGISTER 7       /* (??) */
>>> +#define PCI_PM_PPB_EXTENSIONS        6       /* PPB support extensions (?) */
>>> +#define  PCI_PM_PPB_B2_B3    0x40    /* Stop clock when in D3hot (?) */
>>> +#define  PCI_PM_BPCC_ENABLE  0x80    /* Bus power/clock control enable (?) */
>>> +#define PCI_PM_DATA_REGISTER 7       /* (?) */
>>>  #define PCI_PM_SIZEOF                8
>>
>> We've inherited all of these from Linux, and I notice Linux still has it
>> this same way. Ideally Linux would change first, but I'd be okay with a
>> sentence added to the description clarifying that we knowingly accept
>> the divergence.
> This file already diverged and we are not in sync with Linux as well.

Of course - that's the case for the majority of files we've taken from
somewhere. But a Linux patch dropping the (??) parts of the comment
(perhaps once whoever had put them there convinced themselves that the
names of the constants and/or the comments are valid / applicable)
would then no longer apply cleanly if we wanted to carry it over.
Hence my request for amending the description.

> Also there is no functional change being made by this patch so it is ok
> to change Xen and not Linux in this case (which has quite a lot of trigraphs all over the place).

Based on what criteria are you saying this is ok (unconditionally)?

Jan

