Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295D4D31F3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287958.488312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyQV-0002r6-Nc; Wed, 09 Mar 2022 15:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287958.488312; Wed, 09 Mar 2022 15:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyQV-0002o4-J9; Wed, 09 Mar 2022 15:40:35 +0000
Received: by outflank-mailman (input) for mailman id 287958;
 Wed, 09 Mar 2022 15:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRyQT-0002ny-9w
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:40:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b38bac-9fbf-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 16:40:31 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-gACokkQbPKyDPiuuK1WbfA-1; Wed, 09 Mar 2022 16:40:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU0PR04MB9369.eurprd04.prod.outlook.com (2603:10a6:10:358::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 15:40:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 15:40:27 +0000
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
X-Inumbo-ID: 40b38bac-9fbf-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646840431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ge7aVOXHwPcohO/lcsLquwGxXYGCEM2NlDdA9/IsuDw=;
	b=Bbem0WwbP2mbEvGMASPJ5yhHIaV4brYVqN+f8TiK6hpmhgZDQxmt2f9nfLBWY+JuJSz85l
	K9KdG6r3KjHNw0apyICdCy3R08ZqvYIeIWz4l/0eMxt8Lsk9AP36oMjq4d2GATXYOlQZGT
	370y1Gn8Ma3X7woeH3zNMr2/TpqO6gQ=
X-MC-Unique: gACokkQbPKyDPiuuK1WbfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaMWF48MwaKycwcDPnSxNP+8zvKYK4tnjiwaHxLlfMP41QsiYSZS5MhgOkZJ6xn5GzbTdSMhSjv1LKq3BKVIM3dDTBPRypn1SY+pVB4Ev5acU+gABNupkJOPLjxQF5hNUOvgylJngXPbBQR/J4JePkyLnH30P46OqN/35aOy2Cvm69jsegndD6LJyciDiPoqtLjDmjE1P61t1+ILKZ93UiV0/BMRZTKxLVwcfIBnUXi0XBFtiYzz0hAGWQpaWk/T1rYVJRhtZ/AHHqX3SsU8e06iI0MP03MWSAYePwtkBemuar7Anj2rsK7nzPW+d4u1GcDCbWwSBexHM3UtQO2LdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oV/3+xG0PWBethkSpKIKtEbialgZA7TCxx/K9Tn9Kgg=;
 b=R2tv1moqgHRawKNunNIW0tOAAtzVyor+nuN/OZIuLyGY2NIq6NwH9kfhqLhKP2dwD8BkjXFmuPPN2ptoD/DYkveNSkvwwQI6FBG7cBpTPVU8lnw5fn6YvsjcAz9GV5lKUTqL+Y3tEqb6TLNv2PjhGYJxKGei+sso1b0ms9yRP4eu+WPNpYPBRf/2utUDW/9zZq74uAMI4KtechozD4ga00MswtKQ6uUu0Im9IJGs2nxCvM7gmcfn1qrZOV2g+D/yy79ajY95bvF4qXvdPVMrOXrk1a+nIviyt8kS5Il8ORoTQaQ1RSMT80y1vZ+p7VXIYfSJILVORvdXnu5IdAPf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d0d901c-fc7c-2655-6285-df07101b852d@suse.com>
Date: Wed, 9 Mar 2022 16:40:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on
 top of SPEC_CTRL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-2-roger.pau@citrix.com>
 <8e7f3193-dee6-1ff4-0c68-081032e240d2@suse.com>
 <YijBpyOlmTA7tIUl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YijBpyOlmTA7tIUl@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0139.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f77d68-5fea-4cc9-7663-08da01e32237
X-MS-TrafficTypeDiagnostic: DU0PR04MB9369:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB93697BCA9F0AF7FB942F320AB30A9@DU0PR04MB9369.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NN38sGmAe0BeB5CDGLM9M9HDYl1nHAXCikFaPFqrsetZUiUtm5v9cZU6LZjRB4Z102bpmaEpoDRApRzTHS4ekVh0p2SLxHoTliP2irgAnzU3Wbruj8fhenR19U4QcHWXlghPa7mJYxA6Wg1b9IqwDtU1YeddFbndO2TDaOjCF7oftk5+bGGXai7B1cfm1+6X6yeMONbn539FHXlgzRq0PZTKUBXvs16LHjUIY/AWY90bZfVOVrI8UhQ5pfo/KGerbas0Wh3kBosFsiJc3yf9sMcMTSlImtkL1fMqG2lpREGPatWG9KZkc2NPkXuD9xSuMrQFHrdyD9xewzP4ZjfDLZPBxEfiffISz8fn/jJPBTdqSUBwIw7z7SCi6/KbA3JlGqFQhmK/ErzjokeIr8tAwEWBhTath+lWyThslDjgtnIGGlbxDUyPDKn/REZuxNKc8g2EKnOWDkv/KR5DzFX8O4amJY3Uqex4jzAW90AXmfLo+Ga23qa1qSd8QIrGC+/1I+NhwJ9WPfCppCL9HLb4sIjNAsoW2Ip2ecotzb1wLg74q9qqt14XzN/x3FHc0G1O5NKgbVP8XZMHzkeMhYZepZTWfrtrJECdFLX7o5tYdk/Guoc7MhZjAfm7telZIbZe49a5PkhznAzaGK6S43hNN7DlbkEXaRYf6kIKd4K5FzBqYcRCz8bwLjE+Gqu2mA9gV0GMMv1RGdNfqR3CV28xRpRnL7k21/FN6zWW+e3WrYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6512007)(83380400001)(2616005)(186003)(26005)(4326008)(66556008)(6666004)(2906002)(31686004)(508600001)(31696002)(54906003)(6486002)(36756003)(86362001)(8936002)(6916009)(38100700002)(316002)(5660300002)(66946007)(66476007)(8676002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2mxEKlWgPDeAZeWJ2Y4CnJGcvro5xVxA2bSnxFQ8jkmTBwvZdJqzw0iThAh+?=
 =?us-ascii?Q?7vALdjMxnNDqhfwJWCRXDEmS33ibho1e5478X99OdP2s9Cu+GqYfIQop6XG6?=
 =?us-ascii?Q?22QdTvldTnQcVyVL1FnhRkMTUONkjE8o4BFEUX2wtQpKBjgvbo7/mqOu9kdv?=
 =?us-ascii?Q?Jt2Rqcq6RHjWUxdBZ1FT2IlYhHABqsAIw80gg8qbOLyYNwutYgKGz6Lpaskt?=
 =?us-ascii?Q?114xHVhuwwCR69PEmiEJnr+KXffVZTXJrMm91MPh/x0sWMuQ7y8m6qX2b297?=
 =?us-ascii?Q?SUWDKlDRXERJA0kAvWm5+7aVNAoZft8F2pZHLfRNR/sgrCVhihyIeziFvSzm?=
 =?us-ascii?Q?r/nW3WZH8q27Ql2rTsV0P/zULTdhDyO8HtfAYVPVsA2xI7ly+buLYNr1pZsi?=
 =?us-ascii?Q?MWJwsMs+ty+9vo0KOHiBUw5Zsq8bn+keDJvmtXvsx3sjK81H6T2Or2m6I1Xu?=
 =?us-ascii?Q?NrKy7ep06oHVUSfnePA23pR0/+aibrv6evYKlmuNx5iimcdBC2dQQlZ5jo8D?=
 =?us-ascii?Q?o39WfFIumZn7UN8QVwg+K9K/iwfOP5cyzX/bx9zlTLMyXI1avxLrqg68ILu0?=
 =?us-ascii?Q?9XP6XXBV5eBmZogD2RdBeYXxLSJXbgmCAfQKUKLq/T19MC7EPTE4IcR5h2c9?=
 =?us-ascii?Q?8Up2xpmAUJPpl42PZ0eqBN7sQXW0jwWm5TW40jghiHL3/+K44nATFsQrQ5YP?=
 =?us-ascii?Q?+4Qk3QgMnBvYCawIBwB98FKExQsPY5jvn1limu5H3X8VSFFQdXb4CRfO7Afh?=
 =?us-ascii?Q?2kL2z5wB9nrFGwUx4d/BZvtY2hBQZygcKEFSiQu9kyypDyfou8JDW/Eg15IX?=
 =?us-ascii?Q?iOBFzoW3ftpzt1SPVdp4zn98AxikU19X4lX2xak1+L3UVlHvcRA29B55BZLX?=
 =?us-ascii?Q?apFPg8GN3P5tJiE/NG0d923Y4y6EjbuDkGqt1zFSLLABV5GN0XRxhOYz5UWf?=
 =?us-ascii?Q?LLywxx0bUrJD0ANHMHuTf8Ot2m4YHq0SAFSSkfl41upPqxjXE8noyy2hpyJe?=
 =?us-ascii?Q?U+2RjjlqJL6j6eKw053nTVggVknd+NGk5/i6Ye4VIgUcFv8aC031BOwa1HUc?=
 =?us-ascii?Q?5iUIRqamTRYfF9imhNHarMTFZKp4MfeKkQkkGuFv8zWBxclypaGa+/OpAY6F?=
 =?us-ascii?Q?zyazPG3YDrVi4UVbGG3FNR/wRcayZdQF25BtBKGxJ8AVCws8ETyv7TstS2KJ?=
 =?us-ascii?Q?EDsJIeAq6DJ5FDiYm/sLT26ZIK2lrAOsZiZlMKo01KBj3hUKoEhotNIXs93l?=
 =?us-ascii?Q?TbWh9TVhqKJMs6J3+x7zJVkUGe/iIaOVjcFRFdKKcDgBadcFhFrB+2mgnfUD?=
 =?us-ascii?Q?JXzh6CcNs2Sd65D0TXJNjVNaQn+8+BDqGHwKpff3Tv8yQ48+tfar5NUKkf0S?=
 =?us-ascii?Q?M4GClkK8JUPHwBAmTzTKsLDKA7NwzP6JWnEv3zqeMWYwuGdDJar5xy746tgL?=
 =?us-ascii?Q?vWSu6qmmVSVVWTpoim8IK76RLwghXf/qPi2tq8msIK4yV+BC1CKBGsBqY8U9?=
 =?us-ascii?Q?jp2izW+entacATFARaKaEaCqC92WgkBDGGnO21sY4qFG+VRn5E3fYA3N1K0B?=
 =?us-ascii?Q?Fok+eAt7ojMD0aV3n2NNLu8Ri/cXw3Nhc0LlR75IERU5hJYTDsVOhcYUws5S?=
 =?us-ascii?Q?pgIIF7yYACsgAQf3mK+jDS4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f77d68-5fea-4cc9-7663-08da01e32237
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:40:27.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsKqvxYBCdLrPmnCf9WRb0wDYbISc2lWMkG3vwYt8m9YjgVnUGzaRca12YClR8f/oB7G63t+4ee9FWbB7jRaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9369

On 09.03.2022 16:03, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 04:07:09PM +0100, Jan Beulich wrote:
>> On 01.02.2022 17:46, Roger Pau Monne wrote:
>>> Use the logic to set shadow SPEC_CTRL values in order to implement
>>> support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
>>> guests. This includes using the spec_ctrl vCPU MSR variable to store
>>> the guest set value of VIRT_SPEC_CTRL.SSBD.
>>
>> This leverages the guest running on the OR of host and guest values,
>> aiui. If so, this could do with spelling out.
>>
>>> Note that VIRT_SSBD is only set in the HVM max CPUID policy, as the
>>> default should be to expose SPEC_CTRL only and support VIRT_SPEC_CTRL
>>> for migration compatibility.
>>
>> I'm afraid I don't understand this last statement: How would this be
>> about migration compatibility? No guest so far can use VIRT_SPEC_CTRL,
>> and a future guest using it is unlikely to be able to cope with the
>> MSR "disappearing" during migration.
>=20
> Maybe I didn't express this correctly. What I meant to explain is that
> on hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
> default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
> policy so it can be enabled for compatibility purposes. Does this make
> sense?

Yes. Can you re-word along these lines?

>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2273,8 +2273,9 @@ to use.
>>>  * `pv=3D` and `hvm=3D` offer control over all suboptions for PV and HV=
M guests
>>>    respectively.
>>>  * `msr-sc=3D` offers control over Xen's support for manipulating `MSR_=
SPEC_CTRL`
>>> -  on entry and exit.  These blocks are necessary to virtualise support=
 for
>>> -  guests and if disabled, guests will be unable to use IBRS/STIBP/SSBD=
/etc.
>>> +  and/or `MSR_VIRT_SPEC_CTRL` on entry and exit.  These blocks are nec=
essary to
>>
>> Why would Xen be manipulating an MSR it only brings into existence for i=
ts
>> guests?
>=20
> Well, that's not exactly true. Xen does use VIRT_SPEC_CTRL (see
> amd_init_ssbd).
>=20
> I'm unsure how to express support for VIRT_SPEC_CTRL, as it does rely
> on SPEC_CTRL when available.

I wonder whether the command line doc needs to go into this level of
detail.

>>> --- a/xen/arch/x86/cpuid.c
>>> +++ b/xen/arch/x86/cpuid.c
>>> @@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
>>>          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
>>>          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
>>>      }
>>> +    else
>>> +        /*
>>> +         * If SPEC_CTRL is available VIRT_SPEC_CTRL can also be implem=
ented as
>>> +         * it's a subset of the controls exposed in SPEC_CTRL (SSBD on=
ly).
>>> +         * Expose in the max policy for compatibility migration.
>>> +         */
>>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
>>
>> This means even Intel guests can use the feature then? I thought it was
>> meanwhile deemed bad to offer such cross-vendor features?
>=20
> No, we shouldn't expose to Intel.
>=20
>> Additionally, is SPEC_CTRL (i.e. IBRS) availability enough? Don't you
>> need AMD_SSBD as a prereq (which may want expressing in gen-cpuid.py)?
>=20
> We need AMD_SSBD if we implement VIRT_SPEC_CTRL on top of SPEC_CTRL,
> but we could also implement it on top of VIRT_SPEC_CTRL (if Xen runs
> virtualized) or even using the legacy SSBD setting mechanisms found in
> amd_init_ssbd, so I don't think VIRT_SSBD should explicitly depend on
> AMD_SSBD in gen-cpuid.py.

Hmm, yes, good point. But when the prereqs cannot be expressed in
gen-cpuid.py, I guess they need to be encoded here.

>>> --- a/xen/arch/x86/include/asm/msr.h
>>> +++ b/xen/arch/x86/include/asm/msr.h
>>> @@ -291,6 +291,7 @@ struct vcpu_msrs
>>>  {
>>>      /*
>>>       * 0x00000048 - MSR_SPEC_CTRL
>>> +     * 0xc001011f - MSR_VIRT_SPEC_CTRL
>>>       *
>>>       * For PV guests, this holds the guest kernel value.  It is access=
ed on
>>>       * every entry/exit path.
>>> @@ -301,7 +302,10 @@ struct vcpu_msrs
>>>       * For SVM, the guest value lives in the VMCB, and hardware saves/=
restores
>>>       * the host value automatically.  However, guests run with the OR =
of the
>>>       * host and guest value, which allows Xen to set protections behin=
d the
>>> -     * guest's back.
>>> +     * guest's back.  Use such functionality in order to implement sup=
port for
>>> +     * VIRT_SPEC_CTRL as a shadow value of SPEC_CTRL and thus store th=
e value
>>> +     * of VIRT_SPEC_CTRL in this field, taking advantage of both MSRs =
having
>>> +     * compatible layouts.
>>
>> I guess "shadow value" means more like an alternative value, but
>> (see above) this is about setting for now just one bit behind the
>> guest's back.
>=20
> Well, the guest sets the bit in VIRT_SPEC_CTRL and Xen sets it on
> SPEC_CTRL in order for it to have effect. I can use 'alternative
> value' if that's clearer.

Well, as I tried to express in my earlier reply, I view "shadow value"
to mean "alternative value", so replacing wouldn't help. The question
whether it acts like the shadow values we know elsewhere (VMX'es CR0
and CR4, for example). If it does, using the same term is of course
fine. But it didn't look to me as if it would, hence I'd prefer to
avoid ambiguity. But please realize that I may have misunderstood
things ...

>>> --- a/xen/arch/x86/spec_ctrl.c
>>> +++ b/xen/arch/x86/spec_ctrl.c
>>> @@ -395,12 +395,13 @@ static void __init print_details(enum ind_thunk t=
hunk, uint64_t caps)
>>>       * mitigation support for guests.
>>>       */
>>>  #ifdef CONFIG_HVM
>>> -    printk("  Support for HVM VMs:%s%s%s%s%s\n",
>>> +    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
>>>             (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
>>>              boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
>>>              boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
>>>              opt_eager_fpu)                           ? ""             =
  : " None",
>>>             boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL=
" : "",
>>> +           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC=
_CTRL" : "",
>>>             boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"         =
  : "",
>>>             opt_eager_fpu                             ? " EAGER_FPU"   =
  : "",
>>>             boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"    =
  : "");
>>
>> The output getting longish, can the two SC_MSR_HVM dependent items
>> perhaps be folded, e.g. by making it "MSR_{,VIRT_}SPEC_CTRL"?
>=20
> OK, but further patches will add MSR_VIRT_SPEC_CTRL to hardware that
> doesn't expose MSR_SPEC_CTRL to guests, at which point it could be
> confusing?

Yeah, I obviously hadn't seen adjustments done here by later patches.
When I saw those, I think I understood why you things do this way.

>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS p=
rovides same-mode protection
>>>  XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer suppo=
rted. */
>>>  XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Invent=
ory Number */
>>>  XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD availab=
le */
>>> -XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
>>> +XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
>>
>> What is the ! intended to cover here? From guest perspective the
>> MSR acts entirely normally afaict.
>=20
> I've used the ! to note that VIRT_SSBD might be exposed on hardware
> whether it's not available as part of the host featureset. It did seem
> to me that using just 's' didn't reflect this properly.

I wouldn't have assigned such meaning to !. In fact if we emulated
a feature completely, I think it could legitimately show up here
without !. But then again I may also not fully be aware of all of
Andrew's intentions ...

Jan

> According to my reading of the comment at the top '!' is not used to
> signal that the feature might act differently, but just that it's
> presence cannot be properly expressed with just the A, S, H flags,
> which would be the case for VIRT_SSBD I think.
>=20
> Thanks, Roger.
>=20


