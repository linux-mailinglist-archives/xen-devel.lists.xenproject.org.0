Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53876A468F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502779.774755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfsI-0000JP-6X; Mon, 27 Feb 2023 15:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502779.774755; Mon, 27 Feb 2023 15:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfsI-0000Gp-32; Mon, 27 Feb 2023 15:57:14 +0000
Received: by outflank-mailman (input) for mailman id 502779;
 Mon, 27 Feb 2023 15:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfsG-0000Gj-QI
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:57:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64850661-b6b7-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:57:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8240.eurprd04.prod.outlook.com (2603:10a6:102:1c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:57:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:57:08 +0000
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
X-Inumbo-ID: 64850661-b6b7-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf/uk4NvgnE9PgpQajEL/WG9rwd8tMehaApCQ8UnPi/jj9NrpRLtTFBzDb1D/4R3v3/aFzp+Ye0X8jVoIr501uq/Aq1anFUm00oihaYzipNhAOUrdS+93hYEBvxUSESjxuO+dZ1+VuELpPW2sRuHR3kxJXO2uPMyaPIJQ6TKBhMRphV1rlCY/jOxCk/wl4ivEhySuBQddCUGAuO5oF44L/uoIAf+jFcVY4gnJAnyXTjaq5r552byvxtRYtc53M69ZYVTUlUkT/vyZ+vDumrTDu0TVHg3fJI4GmThbQrs9dLvP6KAYjuMmMFnnM1PCryncfVo9RWWnRsl4YM8Px6CQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL3JnhR6L2AZnifGyU/UOU3YKEc+mOlXcQYx2vMJA5w=;
 b=Sua3XsnkeOy4acHLcSFkdXwL21ZuJllFZ/6iepwKrlw0IF89cUSx//PuA0lIECevRu6pz1w8Gq3QhThKB873R7Y6aWw4AbC/q3Qcb5W5YfADR0CFJo9SYjITCQm9We5ViQ+hXyzppDJZNpYalcUKg1blJgundPjrhSfPCSa/jpQxcLFuoootq/jDczuOhEOTOf1w0Cy52+Q1/bxTwtnvmOFX75HeZuMS/a5fFqz2VOSUmG9pGRnAcgdgQChaVaTMwqYoG6ZJQHmdRT0Bcx49WtoBFdZHg9zrZ8wWG/vL+DEkdqv9vyFEvYPzj603R5znWmtkhU4RRojoTKEm7IxfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL3JnhR6L2AZnifGyU/UOU3YKEc+mOlXcQYx2vMJA5w=;
 b=Irmq+p0gweqTs/5euAUICTfP0kaESavSay0+guTBOrsgtTV5jyLX1HRbHCClLdhb5/p/Rzz0Eryt8KdhHX07p2BBQunyOc7fD1gQd85t8EC4eDwZDfdiz4K8oOqVD4mJALJKj1b0KsHx1jCFQS3lEQoCD6fY+e19/xyJOhbWbB4g+ngBeT+buuCRz9PSxRrjHj/R+wInrGo9i/N5W5iC7t0/0+EMUDmMhzwNIfQLZd+oiVPOqioD1ZppGmjz36hSgIgZSvKcZ3SAOb/goBmuPh1NyPuv8hXyC+S8Me9Q39kCao7sE2l77DcnMlEZm8OVh0I+DfPnkiZAnQ1SAe9pyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com>
Date: Mon, 27 Feb 2023 16:57:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
 <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
 <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
 <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
 <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com>
 <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d0e288-c4ba-44ac-66e0-08db18db4786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7oJkB35ngaUpLpVgiTNXhpgsirVw/BugUYJyIunv0QLAqJxxMQ8O8o3xQO7g5yUwzgFzX095EuDAPSkgHwbrQnZE5XKChWjCMbINisEtR4+plyuq3v+d6A/McGqfwIX9B5K1xlV+cS6Oj8ja8nBrj9gHEaO1YvHs3otGGSVfXFsUwpv2pQYNhDHRhJ7ZDLVbIVzn73oeOlHH3czJ6WYKKH7ICXD8+w7DoRImOXRNm88lIcFkdlzh92Xq+K6uhqy8G9qan0pwe7yU+ShYOGQuGGw/5KWEJtYemibL94iMRKuwO0KVnLHQYzQL15v/RXcXy3fQjPQiWHSzOoBJ/Y8LOVF0w/Q+syFPzeH+5apvmdyFczbzDQVUV7UU2cak3JL2HP1Tv6ILlp0EMzu37rQad61EMZZ5ap73j2/kQBZqxiTNzhj7zgmMM70gp2U6obaRlLOi7SG3nbr1Y7/HuINTTB3BZnnOTbBT2dZDdnwAMsAGkTAGPiISvlmZfuz6tZcDIV0vW8Z0zK8hraeuXEJd5xdnVpO6218d3DDIKS4DLNp+0oK91/qBVoTd8OEYEVO5MljxBHAiL6clFLNS8QZkGpd/4uVug5GhcXiXDMvT+ca4YAMQx05RrB3qTyUX0VaRXCt8nqdFJsDCKlsmKIeAb66FC9VJKpSnz4fO1Ws4hsdIUAVSSkQQoF/biDfyT1GecyIm2/hh+jFRiVPzfK27CJdVZ8nObAUKFtsWQs+hitY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(478600001)(6486002)(2616005)(66899018)(54906003)(186003)(31686004)(26005)(53546011)(316002)(6512007)(6506007)(6916009)(66556008)(66946007)(66476007)(83380400001)(8676002)(4326008)(41300700001)(5660300002)(8936002)(38100700002)(86362001)(31696002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0h3aUJvdnczVW80ZzBoOERneUtHOXpoZnpoeHRPQlpId0Nab3Rsd3c3V0xq?=
 =?utf-8?B?OXp2b0lYRmI0WXlDSTA0SnJJM1NYNlk3QVZUM1A1L2tRRGhvZENRbUZtMmpM?=
 =?utf-8?B?eDFraDdXa1JYY1BKTXBKZjRSS2hrclJXSzV0TWJ0KzQzS3YrazFXdCttRTIy?=
 =?utf-8?B?dCsyb0VDQ1BVdzZRMzdFNnB3RlBvVEZwb003Wjk5NW8xWXJGN25BQktGOVdL?=
 =?utf-8?B?Uk9VbTRSemt0SnVCMmZTaWl1c1JwWTFBMngrbmY1VkprbjBtOVVMTHZvWjlJ?=
 =?utf-8?B?SHMzb01YbEQ5emd6SjMya0FQaElhVjFRMXRQZ1NjalRHZzk2dDBZRWRnWlU5?=
 =?utf-8?B?b0tIaFhoblZaOER3QTlma2QvbHJYN25USmczYTYwTTNSUVcySHlMeVFBbHVh?=
 =?utf-8?B?T3FZak82SVBJVE8xN0VPYzdRWTdPUWtNWmJwdlZZTE9LSDhYQXhqYTA1Y2or?=
 =?utf-8?B?bmV6NjRFTFF0Undyb01GZXA5SldNQ0xUWGdkbEw4MWlEM1RGRzRTUjl6bTNl?=
 =?utf-8?B?QXVDdlBPWitWai93OXVUQ2NPQVRrNFlYWFh6bUdqR0NrS0o2ZkNJQTN3RERm?=
 =?utf-8?B?NmthK3Qxa2pzMzdvTDlwR2pOS2lQUjJpNVhmRGd0T0ozRW5yNFllTkZKam1w?=
 =?utf-8?B?MUc2RmZRY252b2w2OU5Qc2JPUk11VnFzZmlVMEpnQXcrN09GZ0R0a2N2YTla?=
 =?utf-8?B?dXpFNzVrQml5c2NmTlVyVDV5RkpyUjZkeHBGSjcwUDFOL2htQ3BhbFl0QlIr?=
 =?utf-8?B?QmF0QTQwOTJRcStDTVIvUkFHbWlnZ3ZMc29PajBOWm56eGpnZ3FMQ2VDdThj?=
 =?utf-8?B?djlGNE9mdTk1U1kwM2lMNXZ3dUFQbTNtTG9MQkJVTTY5dXZrbTNqMUV4RDBS?=
 =?utf-8?B?OUhLOG15MmNiSjVYQXo2M2ppSDBNYWYzd2xVZ1dnR08xSzZIdU9oTWE2cFZK?=
 =?utf-8?B?S2E2YXRuU0MyTytPY0FTNE5VTlNCczFHbnEyT3k4dFplZHI2Sy9zcUdTZzRj?=
 =?utf-8?B?Y1JqMjlVN05nZEV6alkrWU55Y3NLT1E3K3prbjNpRzc5YWEzUTBsRHNnWW9q?=
 =?utf-8?B?YkpvVUpjR3UrMnYwMXcxNUY1MW1ZVGlkMVFKaU5XUk9nSGhZc1k4NzdNVWxM?=
 =?utf-8?B?SHJLZFdkcVZsVUxMMDgxd3haSkR6S3N2dHhCejNhVWtsbTF6RWN2QjdSWUEw?=
 =?utf-8?B?OFppNmpqNmd4US9DdkJheFpWbit6SXZGNkRDbThVRXZLTi9SOHRjcHpKOEJH?=
 =?utf-8?B?K0tGQlJzQ05vNnlnZytjVktVajFBQnJDWlNqa1JUZ3VEMVdVU3lZMTA1bE1D?=
 =?utf-8?B?ZEJabDZQVVpnOE5STWFNdFRacjdEcW1qMDBkU3lrQkpqL1d4TFZ4ZDFSUnow?=
 =?utf-8?B?Y1V4a1J4ZlZzd0VaaVBVRXp2VlJXd0UzUCtQV2k0MkhmbnRpU250dmZZUFB1?=
 =?utf-8?B?bzVvckdISkw1cWJVVytNMWdPc0pKcGhESVlWZVdOWGw2dkR2elJkVk1vUEY2?=
 =?utf-8?B?Mm9ad3JxUEhBTXhyYUMwLzhKREhLeGVyTnpJdGtQNjdpNXRrUzdKM011Rml6?=
 =?utf-8?B?U2VoaHRtMkw5Z0VtRElEV2pSSDEwbWNkMVFoVVlveld6SzJxOFNDdjJvZFpi?=
 =?utf-8?B?WUF6MmlMZlBLUjI1ZW1qZnpxUGJ6RGNxY3VIbGl2bWlXUmZ3cHlMUTJkSUlU?=
 =?utf-8?B?YjM3b3Rkbzk4MFV5V2FLTFBZd2s2Q05Dak9yMDc2ekFCemFGWVRJcDRvRmhS?=
 =?utf-8?B?VFFMRDg4NG1FdlpoMUtFa285NitldTkrN1NCN3ZDZmxtcFYweVNoQXNTQ1VD?=
 =?utf-8?B?NCtDTFMzd3hZcm5Ebi9QNEY0dDFLNmlEc3owbGd4aFV3UVBEc1d0TnBMU3Jk?=
 =?utf-8?B?Q2Z6ZlJpM21DZURidUd0cHJRRmw2T083RjJVRy9jdkNHb2lEQkU2TEZZWXla?=
 =?utf-8?B?eFN4N2xhZlpOMXBHd1oyM2lnNHNGUFhyR0NlSklHR0JPR08xOGNOcVNXL3Mv?=
 =?utf-8?B?N3hQc3NTcUUzelZLSjZIUDI1dVdobVVleHFrUyt1bEZEOU5Qd1ZTYmlBenFF?=
 =?utf-8?B?SWJHWno0MzZwMUlHekYxMmFnNGxEQVdrWVA2MWtnM3VxaUlMa1dyZnpmR1Jj?=
 =?utf-8?Q?jePzXnWsuOsNKaEU8usTnrx3C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d0e288-c4ba-44ac-66e0-08db18db4786
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:57:08.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgW20m1+RMWYpLHOZxdpKNmwIW0rcr9pwTZlsBeIis01a2qGnNuniIVyGf089FkBYcGWWtUEymNR4eiIET9YTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8240

On 27.02.2023 16:46, Michal Orzel wrote:
> On 27/02/2023 16:00, Jan Beulich wrote:
>> On 27.02.2023 15:46, Michal Orzel wrote:
>>> On 27/02/2023 14:54, Jan Beulich wrote:
>>>> On 27.02.2023 14:41, Michal Orzel wrote:
>>>>> On 27/02/2023 11:10, Jan Beulich wrote:
>>>>>> On 27.02.2023 10:53, Michal Orzel wrote:
>>>>>>> --- a/xen/Makefile
>>>>>>> +++ b/xen/Makefile
>>>>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>>>
>>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>>>>>  define all_sources
>>>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>>>
>>>>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>>>>>> also only be included when selected (or at the very least only when an
>>>>>> arch might select it, which afaics is possible on x86 only right now).
>>>>>>
>>>>>> It would also help if in the description you made explicit that SUBDIRS
>>>>>> isn't used for anything else (the name, after all, is pretty generic).
>>>>>> Which actually points at an issue: I suppose the variable would actually
>>>>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>>>>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>>>>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>>>>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>>>>>> has caused crypto to be missing from SUBDIRS.
>>>>>>
>>>>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
>>>>> and the cleanup/improvements that would be beneficial but not related to this patch.
>>>>> The second part involves more code and there are parts to be discussed:
>>>>>
>>>>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
>>>>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
>>>>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
>>>>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
>>>>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
>>>>> top of the Makefile (thus harder to make sure the linking order is correct).
>>>>>
>>>>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
>>>>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
>>>>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
>>>>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
>>>>> but for all the existing architectures.
>>>>
>>>> I understand that the changes would be more involved, but I disagree with
>>>> your "two parts" statement: If what I've outlined was already the case,
>>>> your patch would not even exist (because crypto/ would already be taken
>>>> care of wherever needed).
>>>>
>>>>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
>>>>> into account for the tags/csope generation. Would the following change be ok for that purpose?
>>>>>
>>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>>> index 2d55bb9401f4..05bf301bd7ab 100644
>>>>> --- a/xen/Makefile
>>>>> +++ b/xen/Makefile
>>>>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>
>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
>>>>> +
>>>>>  define all_sources
>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>
>>>> The fact that, afaict, this won't do is related to the outline I gave.
>>>> You've referred yourself to need-config. Most if not all of the goals
>>>> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
>>>> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
>>>> will simply be unset in the common case. Therefore if an easy change is
>>>> wanted, the original version of it would be it. An intermediate
>>>> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
>>>> But neither would preclude the same issue from being introduced again,
>>>> when a new subdir appears.
>>> I understand your concerns. However, I cannot see how your suggested changes
>>> e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
>>> They would reduce the repetitions (hence I called them cleanup/improvements)
>>> but as we want to keep tags,cscope,clean as no-dot-config targets,
>>
>> I, for one, didn't take this is a goal (perhaps for clean, but there ...
> So you would suggest to make these targets (except clean) .config dependent?
> 
> 
>>
>>> we would still not be able to use:
>>> SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>> and use it in all_sources (because as you pointed out, it will be a no-op).
>>
>> ... the problem is obvious to solve, as outlined before).
>>
>>> Also, why do we care so much about guarding crypto/ if we take into account
>>> so many architecture/config dependent files for tags/cscope (e.g. in drivers,
>>> lib/x86, etc.)?
>>
>> Good question, which I'm afraid I have to answer with asking back:
>>
>>> If these are no-dot-config targets, then we should take everything, apart
>>> from really big directories like arch/ ones.
>>
>> Why is arch/ other than arch/$(TARGET_ARCH) to be ignored? And if it is,
>> why would crypto, used by only x86, not be ignored? As always I'd prefer
>> firm rules, not arbitrary and/or fuzzy boundaries.
>>
>> Furthermore, considering e.g. cscope: Personally I view it as actively
>> wrong to constrain it to just one arch. That'll lead to mistakes as
>> soon as you want to make any cross-arch or even tree-wide change. Hence
>> it would probably want treating just like clean. I can't comment on the
>> various tags (case-insensitive) goals, as I don't know what they're
>> about.
> The useful thing about generating tags/cscope per-arch is that you can limit
> the number of findings. Each symbol leads to one definition and not to multiple
> ones. But this is still not ideal solution because doing this per-arch
> and not per-config leads to inconsistency. Also, as you wrote, sometimes it is useful
> to have all the symbols loaded when doing tree-wide changes. So in ideal world we should
> have an option to use approach or another. I reckon this is why Linux
> has a separate script for that which allows to set all-arch/per-arch, config-dependent/config-independent.
> 
> Anyway, I do not have any ready-made solution for this problem.
> The only benefit of this patch would be that the symbols for crypto/ would be visible
> in cscope/tags (TBOOT uses the crypto functions but there are no definitions present
> which may be suprising for people using ctags).
> But I can understand if you do not want to take this patch in, due to all the observations above.

Well, I'm not outright opposed. But I definitely want to hear another
maintainer's view before deciding.

Jan

