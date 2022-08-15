Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5C592B43
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 11:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387227.623378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNWb5-0000nv-14; Mon, 15 Aug 2022 09:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387227.623378; Mon, 15 Aug 2022 09:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNWb4-0000lO-U4; Mon, 15 Aug 2022 09:41:22 +0000
Received: by outflank-mailman (input) for mailman id 387227;
 Mon, 15 Aug 2022 09:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNWb3-0000lD-Gb
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 09:41:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a62bce2-1c7e-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 11:41:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3041.eurprd04.prod.outlook.com (2603:10a6:206:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:41:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 09:41:17 +0000
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
X-Inumbo-ID: 6a62bce2-1c7e-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnpCyDEZxhKfkT/NlAHLiDus7dO4OxJoS/Q46hgeXSXhYh4X+VwpPkJoPzDmVXk+WXvwAXV8tKPclsElovLui8EVyvx81AdTlUrdoHVvBXCiBcIr6Gz5agcDZ9iqtzHJETKILcRtvu1CSrk2tCFM4Zr8CPpv1WYvAKXLzQg1T1ONgl2AZkKtxvaIa3kkLj8FOTxx3yKy191ZYFuuAk2+NOkdqBnD19Hip9bUYOaH52NDxO0iN7h4cYWTXiqsldo9XT4U3GRalkCfFzaRVJ//Acf/u11KvCx1j+7o3SBMv3RFdIQCaFASXVsiKmZ7GEYpCcn9eqgrzypD6Rh5czphzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAmZU7r6p+ZUJIoGKvwTzYYqCVvA8CxEB6Rz/NTzT3c=;
 b=bRmV2ZYgwKaYQchS3/KRM7YvycW+a4DyH5ODbdoShbJuyWHNjpyoVaIUfz8kbDkxyHFZNn+7NDBsD5qz9hmDCRTlxEB/Aws8dmj9LWtW9JJ+bJvdFANt+64+vyHFRq0yYqChPgUmr0EBPu0FNjxRdArjPWeyMDuoOXBDgmzQm93TczF6MVQs0yD/NFUElRYc+Q7b4f5fyS4A+NAmhzqLcRjRIFLHGzyHirILMxP+R913ZRUJT9lIkHXbGPKwtDzmrahFtmfrYHOycWziwUa3EGrbguT+2CYmANZpP54Xw/aq7lDDk9bXrJPH3O3uhhR0hTS/jpKn1faN+cMxWZkHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAmZU7r6p+ZUJIoGKvwTzYYqCVvA8CxEB6Rz/NTzT3c=;
 b=zuhl3iwWRFg2bk0Ti7nadsCesu9JQbgDesX/9IxTZr5UKxs7UWCaMDx49h3qBrDxPVzlHEhqZHoDD53lmzuz0pmo4mdQHd0a9eENLbLGBeM2KkEg8wa1ohO4ZFNm/0w6acr9+kcISa3SVTBZKMlU0bsHIpAvWeP6B67M44dCD80K+tUdnJ+Cp7Gt4SIzB65ejdaBnEBvmDUMx0v/halxE8Ux9zHmq1NPpYDciARqgGWX+VVm7vX+uCgh2oZbDTTGOf68xW1y1LKXVzGL4DeW48iFPIyZxFuqiMbG73EI7nrbUNwDNoRZkGCu0C8h3iO9gACYF47bsJ8kX0a6u8ORwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60389c54-77c2-6dcb-b686-25729b6e91d5@suse.com>
Date: Mon, 15 Aug 2022 11:41:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/spec-ctrl: Use IST RSB protection for !SVM systems
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220805103814.23032-1-andrew.cooper3@citrix.com>
 <6c8fd8b4-85ed-6599-5761-a3f6e9fdeb36@suse.com>
 <8ff66724-8cf2-9f1a-c8aa-2ab1d4d33247@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8ff66724-8cf2-9f1a-c8aa-2ab1d4d33247@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 001d44aa-350d-4e84-9612-08da7ea24d6c
X-MS-TrafficTypeDiagnostic: AM5PR04MB3041:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q4/ETBI88OH6H863xo2ghL8C13pXdls/wepcAzmh+4ZvQQayKqstpxNJZitP/bl2hr9EGsfT24cL8U7Ei8BcBuZswNbbXbNw2iHrEgYJUip+YGS3EXBnB/X4HHmyWSPtRHBbWuylA0ArQrROgBkyd9SiDYSx6DCwyxsPzpk9UZsf/fYyufZpzC9sKdvWJ2FiI8GrwGv+nvwiAoDasa9ceOh8rwrOli+5uQCLIV/Vb3dVaYt2CYhkrS9q05lS/0DlIbAbVo/8Bi6iXW4vxb5RRjVttzZ4SQZwMfYVkirBgVGCNMb8+ZNe3eLls3VsxeMv6nBnKu5x+PDKa0ggomM89ke2QJjq1COOsugIr6lTIvYqLOdtnref3kgezeCjbd+DVW9fnoqhrGdKbeaWRLMYKNTeS/VU5A8LS3LqgDCxUotA/lPLfd8Y1vjrrkwmGFrs+MQ4DvgQB4OpwF5cNCME81GqKEpvjm3aiG+ssfHZh99KIGXJFQkxSgNNZKlv1l9tmS52AclR616LTJ+GcLvimw/brk8M52+W9KOg/lVMpXMUx4Lbho9i5IRqAg5jHiqZLOv2KvDVd6xrwKNG+RYhv+aJaURzdHJKmBaIwSSmax50jMxPg0BzyazmXQkqQ+muWbnaFMS3+cjt6TsCxVt3R2XLGkDx/LPjQgJ/jeG9cWp9yuZ8PxrU6L1Olka+94V+qSr2t8RkmfCaf7KQacrWCO5Wz5jvRrFfTgNtCLSH8c8FLtP5DiJTE6cqwb5pcI1qEvZKDGKlRVTyIZT76q+jo3w6o1uydFAeL271bVHHKfOQjwhP4edfmUUaB9xACrp9eNoNvG2sqFq9T6xvaHk8EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(366004)(39860400002)(396003)(6916009)(86362001)(31686004)(36756003)(31696002)(41300700001)(38100700002)(53546011)(6512007)(26005)(2906002)(6506007)(2616005)(186003)(4326008)(66946007)(66476007)(6486002)(8936002)(478600001)(54906003)(316002)(8676002)(5660300002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFA3Y1BOc3JjN2pzQWxwNXhBa3pBNERQbUdvc0pMV3NxVGFDRDg1N1krcnd5?=
 =?utf-8?B?SU5HeHNpdGVvRU5qcFJFcXhLTWlIejNoSi9mRURweVpsbHZSYm5HN292eGFZ?=
 =?utf-8?B?bUtJMWVQcjJwenhrclAycnlHZ1JWNExyelladUpIa216VzlMcjFsZ2xrdzJK?=
 =?utf-8?B?aDJjTk9INE1UU1pWQk5xS2NuelJmbWFNcW41TXNmWjdNUitIbng2R1NtQWhC?=
 =?utf-8?B?U3RLNnhNN0ZLUmlnRjhpVGtIMkwyVjI4RWxVZWhneStHOUlrV0JuOWVaNWlo?=
 =?utf-8?B?MDd2aWE4bWc5WCsrNDRkVEN6YlFOR3hFUjlYbHgwSDFQNkF0a01BMXZWc1lP?=
 =?utf-8?B?QUdTVU5qQzQzRi8rNURmZ3g0RmNIRGI3cmJlMUEwUzBOZHBMdnpqWHU2Rkw0?=
 =?utf-8?B?ai9DclNHdC9uakZsb2Qrc1VkRndXam9KVGtsZ3JiTUlDbXExRklQUmZHcXNY?=
 =?utf-8?B?UWhPQUc4T0tDaXAvUDNhZzdCSTZmOVNOMDBVTGV5ZHphRDZ3VzdNdXAxWG1q?=
 =?utf-8?B?QWZuSUlXVmZ6RHdIWjNXRm9RZmx1S3dyakZaQlllNGRISXRLc2RmNVBUREtK?=
 =?utf-8?B?Sk1hZTFxOE5wcmZuMTZtR3phYVF4aHN1N0xPYnBtL3ZDRzRITUJ3U2lPV24w?=
 =?utf-8?B?L3BBSGVtZEpjcm9MM0hFb3RLc1RXb01KTjlGSm1yNjZWcTh5aG82WThORTlM?=
 =?utf-8?B?cGZMaStNb0Z4NjA5ak01VXlQb3Jhd0JaZmZqeDVsVldWK2FXelA4WlU4c3dt?=
 =?utf-8?B?ZDJLbGRCNWZoeGpkcFlVTHF6Z0Y0czNNazlwS3l5YVF5c0hqNklwRG13a2s3?=
 =?utf-8?B?eFdQcm9FZG5VOWhXMU5xeGRpVVJvSndKVEFxVHgwK3V3VWhaVmU1S3VPUndE?=
 =?utf-8?B?N2ViejNNN3Q3SXdMcDdvQ253YTJpM3ArWXVCRUwvWlBjSmk2SjJwWkVHTk1X?=
 =?utf-8?B?WmVVajdGREJKbWpBeEtXNkhtNjA0ZVc3eW55cGRXbnJOb0M2eGFrRGxyMmhv?=
 =?utf-8?B?aEsrVU4xd3FIUDBZcjRRZ2Vpd0laOWQyRlVxSE9hQUpuTEdDdVpSK095c01I?=
 =?utf-8?B?ZnNNc0NHdFFnc1BOQUJwMXI3VUR0QU5KbjJ3S0wybzBGbXM3OWx4OHFTSFc0?=
 =?utf-8?B?b2tTeWk3dWJrY2QrYlVYOHgySHRISHh1SFVaYXppM3hROGdZd3RtQy9JU3pw?=
 =?utf-8?B?MFYwUzN4bUtsS2pzWHZTcGdvbDNoUnJtVld3cDZIbko0d2E4UUtPV2hVL1Qy?=
 =?utf-8?B?T2hEUUtTTDV4VlE0aWFxK014YlN6UXJXenliQ2krRnBkWkRnTWJwTXZwd2VN?=
 =?utf-8?B?K1FNVkpsa3NIanpwM1ArZURXUldyUHFwaFptdWNZb3IycVpqUDJHMW5pd3kr?=
 =?utf-8?B?NXFGUW1DbDNaNWxjSHkwUGRGNE5Ja0pDSXVyMVowSnc2N3lxRjk2SHF4SDZX?=
 =?utf-8?B?OTFoZ09SR1F4UVVzbTlCdzh2SmluL1JUYWZJWDRVT3hvcHJySkZpZEpnRzg1?=
 =?utf-8?B?eW85WmltTjk3Z01SMGx2UUVicVN6N2FZaGMrbDNyd0Z5QVloaUdYaGJKdXFx?=
 =?utf-8?B?Mm1RWDdtWDdkbnZMOWluOHdMTWxLN09RTUtUQVdUdmtOT3BoSy9La1Q0MnYz?=
 =?utf-8?B?a1NxSUNZb3dUVVNDR0hQZXVnbi8xczdEWGRoUXBhbkdSSkM2eGZuOGlTbkNN?=
 =?utf-8?B?S01IOXVGZHpCZWtHTFpiT0NYVDJ5VkhZemFYWjQxOTNFUG4rOXpPM2RlOFlo?=
 =?utf-8?B?d0tTM0JiM3VwN1plMDRHK281c2JDQ05VMTh6TFVXRUdMS2V6aW5VZ0JJajl0?=
 =?utf-8?B?Vi9ETUFFRXdIMkdOT096bmw4Q0tDNFBVRjRHcU0welVyLzkvQXJzQWFrcWo2?=
 =?utf-8?B?bEFhVkR2Z1dhTG9uTmIvZnhyOTA2MFhrNmFZY2ZCL0VrOXJNSDc4dVJZb1BF?=
 =?utf-8?B?ZHlPRnpOdTkvK2hSUzhVRTNEa2w2Z056NXN0NXFUcWFYSWN4MjdHUlJKVjZD?=
 =?utf-8?B?UVBOd2ZOYXh3RVFOOEVTb1htVjNuemVQaDJNVml3TnpmZ1FUZ0YwUDROalVx?=
 =?utf-8?B?K0xKQ0JVczE1S3BwaXozS0IwR3Zhd3JUYXNIVnJHemNZNENTNnVXU1FaVWFh?=
 =?utf-8?Q?/5eX8zZlJwRCaEUSieBWYqDUS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001d44aa-350d-4e84-9612-08da7ea24d6c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:41:17.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rGKoAJnBaDNDvfsu9g8GsECvFQRS4OW1zmo59XDLI8ruysGd7yzGWS1g7TjZcK5lBDvwLhAyzWFdlxsn2tnKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3041

On 15.08.2022 11:33, Andrew Cooper wrote:
> On 15/08/2022 09:26, Jan Beulich wrote:
>> On 05.08.2022 12:38, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/spec_ctrl.c
>>> +++ b/xen/arch/x86/spec_ctrl.c
>>> @@ -1327,8 +1327,24 @@ void __init init_speculation_mitigations(void)
>>>       * mappings.
>>>       */
>>>      if ( opt_rsb_hvm )
>>> +    {
>>>          setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
>>>  
>>> +        /*
>>> +         * For SVM, Xen's RSB safety actions are performed before STGI, so
>>> +         * behave atomically with respect to IST sources.
>>> +         *
>>> +         * For VT-x, NMIs are atomic with VMExit (the NMI gets queued but not
>>> +         * delivered) whereas other IST sources are not atomic.  Specifically,
>>> +         * #MC can hit ahead the RSB safety action in the vmexit path.
>>> +         *
>>> +         * Therefore, it is necessary for the IST logic to protect Xen against
>>> +         * possible rogue RSB speculation.
>>> +         */
>>> +        if ( !cpu_has_svm )
>>> +            default_spec_ctrl_flags |= SCF_ist_rsb;
>> Only now, when I'm about to backport this, it occurs to me to ask: Why
>> is this !cpu_has_svm rather than cpu_has_vmx?
> 
> Because it is only SVM known to be safe.

Yes. Which amounts to only VT-x being unsafe. And in particular PV alone
(e.g. shim, from the perspective of the shim itself) is safe as well, no
matter what CPU we're on.

>> Plus shouldn't this further
>> be gated upon HVM actually being in use (i.e. in particular CONFIG_HVM=y
>> in the first place)?
> 
> Perhaps, but not locally here.  All of init_speculation_mitigations()
> wants reconsidering if you're going down that route.

Not sure - many of the settings (like X86_FEATURE_SC_RSB_HVM also being
set in the enclosing if()) only affect HVM-specific code paths, so which
way they are set wouldn't matter when !CONFIG_HVM. But the one here
clearly affects a common code path, for no gains at all. It's not an
overly hot code path, sure, but it still strikes me as odd.

Jan

