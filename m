Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0036ED0F0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525470.816691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxmF-0000YO-5R; Mon, 24 Apr 2023 15:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525470.816691; Mon, 24 Apr 2023 15:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxmF-0000V4-1U; Mon, 24 Apr 2023 15:06:51 +0000
Received: by outflank-mailman (input) for mailman id 525470;
 Mon, 24 Apr 2023 15:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqxmD-0000Uy-Vv
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:06:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2af8612-e2b1-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:06:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8937.eurprd04.prod.outlook.com (2603:10a6:20b:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:06:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:06:46 +0000
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
X-Inumbo-ID: a2af8612-e2b1-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGP+jhii0DZb6TPsYgyXDI0zYJ6xqqkVIdHqhYYC8abFQoonSJWPBpitVWehtgl3uvEXVisc9T7fyFg5EYHf7/pUbwlhcc1ZYRQ/C9aAf3lo5MCu77zhrsbKlO1OfNI6HEYMdkweWCoE+awOTM2QIolGDM/Il227XDoltYlYEucfNFVTiX+RFKG9QUzexxCJWiUybvhb8zjSMAjLTN3HLLATnPIgPRDngk3ENYb9c0o9XdiUIGebmf8dhiZroLoWarbdBfG1NePod9nXVD0Y3H4M7qtOQ466Nyp9BJ8M7wdorhEeF2MxBjaghexir+SSRHsX1qmqAlmPjk2z4SoERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd/MreHNNl56toIgF9vvqrwW1dSYYssWj+BiZVofhWk=;
 b=b5dCU/AkbQRJb0gCyrkc2qqNydtVN7NyqPrQouOEGWKVybkK5VbzpIUbNHTeMCC+aXT00enoEHQffdy6K+TjYDOczkrcZXZigUMWMql11A7s16qdTeuIe0OPSKtGMNEdgNHuF+//ZLfr8lCNSKfQ4Qz0arqIWKWQr73Wmww7fzGtzTtiymZWm9nCgLCRibcYgR5jovcbjLnk1zPVz/uf2j0rkLOmj7/uEx3nhJP2casZHPF4c+SqIoQi9pIR4goYZiovyrS7h+uT4LQwq48boWIgXtz7EHszs9QmjxxG+wQ1PSAJo/pjsFNNFyQ8X6NN2+7sGiWjtZMsO57tRz879g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd/MreHNNl56toIgF9vvqrwW1dSYYssWj+BiZVofhWk=;
 b=r8KtfXj4ZyA8YHEJ9jyPTL9//X3R4jojUwjt39oEvOvyNU6VGVbnbDBR0WFep/CFXLRJfURkY3JRtyqowJBcbwcTe6KbmtLPN16svrzHlimUQYiuJRLJNB4vmvv3UEufx7pOgC2FogasMAriGudUYdfb/ybJqgcRPRh31mVqfmUhQBxo2h4tEEMecLNuJvdycqmSlJMWukwN7mzjru7D7ox8U4T1deYmuH2ab+K0binAEcHzNMdMPr+nF+V9AScVKBvpWubq4RjmArkew9RTzVRCdUujaOO0av4NHuNht3wz+Aj8sh3BXFV/czLYb2rPZWIBjBDiZXbfsoiWByZ1CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
Date: Mon, 24 Apr 2023 17:06:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: f5156f3b-4548-4dc4-0917-08db44d585c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AKSBntMfuYiEkX1lBoWsTEyVlg8ARCvYvtXZdL33g7yzuAeb855CQjJBtk+UJ2VuScU1T/oTg/sTI1FAZSjoQ+TQL5MWUIAiKYN5KRlVa4ax//lfn2rnhaTefd0wgt/JMtzi7Bbbi1gZFc1EeoOeLM0MnaBeQJhk2lgnjNqCGR3eUJG7TWhyaS2OLokZWDjKtuyoQkeaLcO1v+VVOrpJEmJSQ9zsorWddxEFCJpsS8RrgdEJoUxjHBJ8oqA6O2FP5IZtf+dnAERy6AZEtLjcTUdd927ZdzjJKgQQqzVMMT6sBoSFHHN0fm2d0CJb6y68ISaCjzTDd56wx5yPs678b4ibtzQ/eptoi/DhEFfCHQlvllxa7KhGCrrO6hTLOJcpeO77rzG0rKnEyLP9G1rM4uF23/vWsMZEcuts+5TZTMghEdKl34emk6QwT1nTxlh7iI+4nAeRiRey3kk5rhiSETnKmJBT8GOxtCLZMVFdVF124eCPKscXtaalgsNWNjNdIkNegAKepupqeDFHyLa1j/gUVZGQehl19LhOsnwmNa2TTZ0+oEootSbUIQIr54SiaXRdlf3f9V9hZei0B7p4YHJ/BC7FLI7ECeaz3Z3ze5ZNjGxfzZ2iS5IkkB8TVvDRv6NwSzTW3LMko1MYiAvNvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(6486002)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(7416002)(54906003)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnRMZmFhdHkvQzJhRFFCSEdSVWQxRjFUSkRmY1lTRUY5NXowN0dIV3g5ai91?=
 =?utf-8?B?V0NjWW85Yi9Sa1k3RC83bkFXQzVjc2hMZmtBcWp3d0FtZ2NCbXRlSEhTMnV4?=
 =?utf-8?B?akdOdTMyTGY4TTN2M2prejhjU2l0T2w5OUtrOG16QnZ1Rk9qS2FHQlY1NjJ5?=
 =?utf-8?B?MjlFNjhZMGVTa2NCOGVNQ0l4WnZ6Yk1DRWIrMWRkTzlVdC9LN25QU2ZHQnhn?=
 =?utf-8?B?ellRVFozNUNkSXJyZVBmR1A5U0NlZE9BaUF2NUxOaG9SSDFyM3NFKzI0VnEz?=
 =?utf-8?B?ZGRjL29ianlJR0p4K29mU3NNNWpxZDFXV2NlS3VoSmI2Z1lUNFdseTM3L2FP?=
 =?utf-8?B?QW51eGt1SDZzQTcyOXJKcTlRTWlRWGpHY1B3SE40Z1J6NURZZEJUdXY2UHJO?=
 =?utf-8?B?WHdNUUlsS3hJVmpwbzFVL1VjZkNxNlRENGtPaC9nRWt4S0xEeW53Z1pCdzFN?=
 =?utf-8?B?dWFWNFhJaGdyTWxCTzhIenJvQ3FyV3BhQ21XbUNjT01vUGlnMHhBZHczMlJF?=
 =?utf-8?B?ZVRSMmpsWjhGWjFzTmZENG0yTnR1amxIS0cyRTJOZjZ2Qk9lZ1RubXlnMVEz?=
 =?utf-8?B?Y1d4UjZBRzhYdmFtdnNaRzBNQ29FaktDWm4zNXdNWVlrWmRUZy8xRmU2Tm9n?=
 =?utf-8?B?TkowdndzaW1PNDVOMFZqUkQvSVU2K1crSHhUY21MNFcrWVZXWnQwWmNEMi9w?=
 =?utf-8?B?QTZaT1IvNEZRV1VMTlZzUzZvUDIyZzMyUVQ2MGovb2lkN2VBajZPaGdnMTUy?=
 =?utf-8?B?b0RSSGVNUTZzMXV3UEw5SFVjZEVTczNFMXhvM2Q3R2NvbHJqNkFRc2NISEZy?=
 =?utf-8?B?WitEUTNUMjdKUkoyNlRCNGRKM1Zhc2Z2bndCcW5tY0hsTlpSVks2RVZGRHJH?=
 =?utf-8?B?T3JiR0c5RWJNN21DelhieklBeXJBcXZWd0F6SnRCSS9vcklKNk56bEtDRDhv?=
 =?utf-8?B?NlhicmJTTlBLaTkwdFlMZ25DMm9oRW45bERoQlp2eTRxUVB3UlU5eFBjbjRV?=
 =?utf-8?B?ZG9STm1vS05rbG1pelpWbHRXY0k1ZjRSZ0RLaDlUQnVsUzIyTFBYeTh3dVV3?=
 =?utf-8?B?Nm51eG53aHZtZkhnNDcxK1pMeEpiTWpqaTBhemhqeDMya3lsZjlabDVKZFNv?=
 =?utf-8?B?NWJhUE4yYXRmQkJmTUtLVzRqelo0alRxNkl1MVJDSWZNVnllbWtmT2FtT0JC?=
 =?utf-8?B?ZkRTZW0rWG4yZEZhMzFnVTgyWFRqOVZES1A1ZnVCeVd2N2pDLzVyY0haWjMv?=
 =?utf-8?B?YUJVSSswVFZ6SkZ5aGFVSFpIaWhXK1J6ZGdDTjdlK3g0dG9ja2dmUzFYMVU0?=
 =?utf-8?B?VHZkdTZuVFhSaTgzOVc2dmhrcEp2aFBMZU9nc0dtYlZvamF2bkk0alFjS0NI?=
 =?utf-8?B?dHUyTGR2YklPalJMNEhUb2g1SHRZZk1YSTZ1UE94VUJUbURhMXI1b3VTNmRq?=
 =?utf-8?B?RnI0Q3UydUpidU1MUC9qTm9mMlErMU9aWThlV2xWMFo2Y0E1eGRvSUIxeXJh?=
 =?utf-8?B?dXVQNUxnVUg1aS9Lay9oTnBJTXFUK2p3Sk92b1liMzlNbWJQRlZYelRTRWlz?=
 =?utf-8?B?cC9IaTJNNkFwd0wxZUMzWk8yeSt2RWZBUExZVllieDFsK2d4cmJ6aVdlODRG?=
 =?utf-8?B?RzNYL28yeUM0STFucDM2TEtwNE1yZ0Fvb2tsd29aVExxQzlkK2R6RmhNWGFZ?=
 =?utf-8?B?QXNTbFBrc2ltQkl4VmVDUGhCd3hPRXhwY25mUVc5RGdxY29jelpSSWNyalVO?=
 =?utf-8?B?dmdWSFMweTBlZEkySng0blR0OG1RdGFtbTlxYmJJdjV2OXhqclZkZFZuMEZk?=
 =?utf-8?B?NVk0NnozUm1HenlIWVI5cGlUSTlJcG5SME5TYWVkVE54Z0VQL0dhVi9KZDNH?=
 =?utf-8?B?NlhkSEVycUtKVy9CbTArMkZIUDF2TmlTL0xObTFvZEhocTh0VXVVRkIvUlA3?=
 =?utf-8?B?eU5oeGZ4NmRzalN2NUNlcXZEWkRHUDkxK2lhMmt3Ykx0N3UwMXdHL0xXWTM0?=
 =?utf-8?B?L2ZlbXhJcFpYRnhETkZlV2Nxbkt6Q3NORGtiWFFldW1pV3pDdnU5ZmczMWNZ?=
 =?utf-8?B?SkNhcVdNZFM3RGNROUk1WmVaMHIzSFpxdzRKQWdHM1RMNzU4VEVoTHVRTnFi?=
 =?utf-8?Q?kcjtiS+c2FdAMLhPFX1LIP1lW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5156f3b-4548-4dc4-0917-08db44d585c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:06:46.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFykURRcfEBg6lOWGofL9ThW41M/jG+g8dLdn48rm7AYSGg7chH2Qlecq604pS9B3lQ4OpSe2gFs9kbdnEH9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8937

On 24.04.2023 16:57, Luca Fancellu wrote:
>> On 24 Apr 2023, at 15:05, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.04.2023 16:00, Luca Fancellu wrote:
>>>> On 24 Apr 2023, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.04.2023 08:02, Luca Fancellu wrote:
>>>>> @@ -30,9 +37,11 @@ int sve_context_init(struct vcpu *v);
>>>>> void sve_context_free(struct vcpu *v);
>>>>> void sve_save_state(struct vcpu *v);
>>>>> void sve_restore_state(struct vcpu *v);
>>>>> +bool sve_domctl_vl_param(int val, unsigned int *out);
>>>>>
>>>>> #else /* !CONFIG_ARM64_SVE */
>>>>>
>>>>> +#define opt_dom0_sve     (0)
>>>>> #define is_sve_domain(d) (0)
>>>>>
>>>>> static inline register_t compute_max_zcr(void)
>>>>> @@ -59,6 +68,11 @@ static inline void sve_context_free(struct vcpu *v) {}
>>>>> static inline void sve_save_state(struct vcpu *v) {}
>>>>> static inline void sve_restore_state(struct vcpu *v) {}
>>>>>
>>>>> +static inline bool sve_domctl_vl_param(int val, unsigned int *out)
>>>>> +{
>>>>> +    return false;
>>>>> +}
>>>>
>>>> Once again I don't see the need for this stub: opt_dom0_sve is #define-d
>>>> to plain zero when !ARM64_SVE, so the only call site merely requires a
>>>> visible declaration, and DCE will take care of eliminating the actual call.
>>>
>>> I’ve tried to do that, I’ve put the declaration outside the ifdef so that it was always included
>>> and I removed the stub, but I got errors on compilation because of undefined function.
>>> For that reason  I left that change out.
>>
>> Interesting. I don't see where the reference would be coming from.
> 
> Could it be because the declaration is visible, outside the ifdef, but the definition is not compiled in? 

Well, yes, likely. But the question isn't that but "Why did the reference
not get removed, when it's inside an if(0) block?"

>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -324,11 +324,14 @@ int __init parse_signed_integer(const char *name, const char *s, const char *e,
>>>     slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
>>>     nlen = strlen(name);
>>>
>>> +    if ( !e )
>>> +        e = s + slen;
>>> +
>>>     /* Check that this is the name we're looking for and a value was provided */
>>> -    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
>>> +    if ( slen <= nlen || strncmp(s, name, nlen) || s[nlen] != '=' )
>>>         return -1;
>>>
>>> -    pval = simple_strtoll(&s[nlen + 1], &str, 0);
>>> +    pval = simple_strtoll(&s[nlen + 1], &str, 10);
>>>
>>>     /* Number not recognised */
>>>     if ( str != e )
>>>
>>>
>>> Please note that I’ve also included your comment about the base, which I forgot to add, apologies for that.
>>>
>>> slen <= nlen doesn’t seems redundant to me, I have that because I’m accessing s[nlen] and I would like
>>> the string s to be at least > nlen
>>
>> Right, but doesn't strncmp() guarantee that already?
> 
> I thought strncmp() guarantees s contains at least nlen chars, meaning from 0 to nlen-1, is my understanding wrong?

That's my understanding too. Translated to C this means "slen >= nlen",
i.e. the "slen < nlen" case is covered. The "slen == nlen" case is then
covered by "s[nlen] != '='", which - due to the earlier guarantee - is
going to be in bounds. That's because even when e is non-NULL and points
at non-nul, it still points into a valid nul-terminated string. (But yes,
I see now that the "slen == nlen" case is a little hairy, so perhaps
indeed best to keep the check as you have it.)

Jan

