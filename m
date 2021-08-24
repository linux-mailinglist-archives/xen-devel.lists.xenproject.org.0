Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0F3F5ECB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171366.312712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWGr-0000eE-78; Tue, 24 Aug 2021 13:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171366.312712; Tue, 24 Aug 2021 13:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWGr-0000bc-3n; Tue, 24 Aug 2021 13:15:17 +0000
Received: by outflank-mailman (input) for mailman id 171366;
 Tue, 24 Aug 2021 13:15:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIWGp-0000bW-LK
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:15:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 512becee-04dd-11ec-a8d2-12813bfff9fa;
 Tue, 24 Aug 2021 13:15:14 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-6gPiPR1dPiut4aRwoz0IEw-1; Tue, 24 Aug 2021 15:15:12 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM4PR0401MB2370.eurprd04.prod.outlook.com (2603:10a6:200:4f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 24 Aug
 2021 13:15:10 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 13:15:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0062.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 13:15:09 +0000
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
X-Inumbo-ID: 512becee-04dd-11ec-a8d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629810913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6bT2KFRmXu4RnfBIRkL4+78D4y95MzJT4S6cySUp770=;
	b=cn00++ALqPq4kFbNvANweOVJcvqWrOSixvCI/MGM8q+KmMRSZN3adGn+Bb8Gi2zlbJ1zoA
	7YPQhPwc4+APik2mbllyYN3riqsVq+SgNyni5C64U2aLRLmnYNzSQp9yJokI02R1QyII3T
	EPhdwDrXuoj8A4zzzu7ZvXcsT1mc/Yk=
X-MC-Unique: 6gPiPR1dPiut4aRwoz0IEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdFUS1WFedHHrriJ4bgtb6ubletEYnDggU0ArztnHJee+wKDTtKwGx2mX+ecKbgMs/gHaAkcp41GngB8fAkKJ0eLgrJqUvekzUY3u6OG0Hl24u6oszzDWMlNu9nxB5aRm1cK9SjEGHZbtcKvqF05jdCGiHtUOU1HsDOKrPVry4m2OTpaKkQ3aY9RU5jvWHFZCq3gq3jfyiegKw5xWHz9iuwvz9Tw8mnSp1YlZiUrRxbsF2PcooE+J21ElLANoQD+o5Ue+7dL2szOq1Pezl1N0HYxZCFvrZZ2OENTIllHjstrVNtBvgBP1M7LGznV4Bds3BM0GKODwtdbI73IRlescA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8gRMcdCCI+LNKSDO/B/I0uUqDiS/hEIfeAjBsv9avE=;
 b=FBz7D7l8NlKtvXY4GqfnreYYcbvfCz+JEhQjN2GEEp5ZUs0rq8yA57HXd/Y/nj17rYun+fK5/aRDGcgP2C3pefDT+trNQofiGMXRh/8aJqarFepESj+Csoi6LCGGaTtiqSF7VDFuiUn19WTXtRpZTyppmvM0MhRzWWKNRpUe6akSYcKhKjCocYNk/NC8NH+TaqROfH3dn5+DjRd2+OwzN7+ohirMnsODpIKK8GQgUZoKqw0sCxld5Pi3YRaJWWqQKixDNAVF5pG1MtZt4Pb44wDxFhsqpsqMKIC4lbjvL01wEdxvfpR0/pA5KiDl+gN4HwQ6iGFuczgTa45SJfNKjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/3] x86/spec-ctrl: Split the "Hardware features"
 diagnostic line
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-2-andrew.cooper3@citrix.com>
 <1ba952b1-ad26-79e1-7aa9-af7df28774f6@suse.com>
 <34905dc6-f8e1-afdd-7f05-1c8e93eab3ff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <709c7d54-2088-415a-6460-bf44002d1d76@suse.com>
Date: Tue, 24 Aug 2021 15:15:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <34905dc6-f8e1-afdd-7f05-1c8e93eab3ff@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0062.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::7) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5854bb2b-2bed-4c6c-2163-08d967013338
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2370:
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB2370E5E04BE45A7D6CE6AB3AB3C59@AM4PR0401MB2370.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MKRiFxjrwQ+Kz3d+AZJfBJCaOZqJhMmoRULUx301guD4mzoOGf1NimQQ9eecmEaajznQlYL78+DpgdaBn0O52B2fOk5lLQIX9E91TrDM2WnJ3cQv5541349N3pjfLKwMnH7uAPILr986hPimf8j3w9yA/mf2gpGdqtL6EH3LKWTHzLDIYR4YnN8Br6Njnvfw4UCW5w42LN+Y5ip6IjJ9a3txXUmqkW/yahwe7ly5lg3awEhGP4SMvecGTVPD29yLG0mRRhk7kYA5LK+i8IakAZU8AVfZSgAZRNQZIarzOVygxRp+42zhKZOZ1yF/R6kP748iaJE9twNlrh92QpwPVUhWiolf30K1w7K6QdbsNevx79jYXu+aUKx1RF+mQryFiIKiUeLfTSNnQmxXv3RgC+i3eeWhH1EjA4C0QKYV5dFPLbl0AqiovzpjoIaU6AsGtTLcteFIrkNytRFMDqPwMokuirUEv1VdP8Gt8JC3DbvBlQD/XGH8UDtuno9491NwY8OpVLyN/qI6CPjFG5f758Q3wPeGKkWNKmQWPuaIMsHPZYvNdLVSTHTSeJLRhu4rHT4MvU1MJ3qC7xDFP2rUjieIoaIM6xl1orObXPteScICeqStbC6CbB6KXjFaiQeQfrpEXz2/LiGhcULYh09StUBXvmWKOFw6ULVydbq+ox1djFve/3WagWWcBKqTY1P7fPHtjiNK+a/5BqCmUKZ4Fp3eHgQyuSlcOeFX2gi41fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8936002)(2906002)(8676002)(6916009)(5660300002)(6486002)(86362001)(66556008)(54906003)(66946007)(66476007)(16576012)(36756003)(508600001)(31686004)(2616005)(186003)(31696002)(4326008)(83380400001)(956004)(316002)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SLWpqv8d5009Setz8BmeCNl8pGo6gh0F/Q1TaMTihhrsX9MqSMlvMzjxYyBi?=
 =?us-ascii?Q?GdQ537RhxHqzqxxOlA/lF556JKKg9SvOvKevcNvA/v2AYqTMknsNFN2cyO/3?=
 =?us-ascii?Q?4/06zeCx9xfkaCT4JA3z18xGooXxWfbSnsZSlCC+L5apdic9Zjc38sBrZe/W?=
 =?us-ascii?Q?mjp0uQ4C2PI36Za5+zYVNrjxxiPazZsL6fZwQW7KX2/hEa18CODWQEq1HROD?=
 =?us-ascii?Q?mV47MR0kOo+RHPly25obSGL5wg/68NRNIV4zTciBYTJPgULrUFhAhgMsG0X+?=
 =?us-ascii?Q?axkl3qrCBNYwAWhB3FV6arl9196jBB8hE1/OJiwt6ZNyZCrKjEKwBw1vHOwe?=
 =?us-ascii?Q?bC0oZAjvlnzvnXC6oEEQYYg3D87b5OZteeFcytfSgd6v8kcdxl/Dlr1mPl03?=
 =?us-ascii?Q?59adP5JoG3kg/HZD3UhrLfakh/I6M9CmAXnXCYskCDRukuXibnngVnGPSbUL?=
 =?us-ascii?Q?tLPNB6OVQjLqRPUk1awKfqAPeP44VpSF/rAZYmGpUMGdxpCkjWKE7R2Fsw+m?=
 =?us-ascii?Q?QKQQhRd0UUBT3GLgHSgmboWlbHeS4tz7tOK2q56OIdKL3Wjp/BzqoDYm0ftJ?=
 =?us-ascii?Q?QcuXl4ETq3maN3/qpgs/CHrw7VqRQgFK2KbHLXVgxMFQ/wi+fk6cZn2nXwSo?=
 =?us-ascii?Q?CmsuWotG5Rf5iJE6CgNhJjL74Ye04j/MogdqRsaHuPgwTVhSdHQH/lQYS6xW?=
 =?us-ascii?Q?q2vFgBcg2Db342kXRY0slhlaXs1CfEzjjZiMinYKIH7s2pVG5FhPWD4P35SS?=
 =?us-ascii?Q?EgBEa+ubn+39ydJo3zxMYD46HX4q8ljL42d0d7Ff9e2bS0oFQ110BX7XX1XC?=
 =?us-ascii?Q?cbmUxx9cU1iSEpm0R4EL9mYlyTgYKI8oNnCWRQPWJuqmynZxGY4PKTqpk0bQ?=
 =?us-ascii?Q?422wt65v4TB7SOWxgnpdvLN9Fm8goCnnrmSyhnnX2TBgMyaqwHucgBPcXgMx?=
 =?us-ascii?Q?aB4ntvIon9GTUpcAdxJSqpdglDllf7bHlFzAfSrQhFJRWoXSpiFcTax9Fc/N?=
 =?us-ascii?Q?1p7WGENiM+Mnm9icBhr6Lg4lTREUzPBubMoRgB2Cy1W6Q3hjEbxBG3Afpofd?=
 =?us-ascii?Q?08WkHtl3bkojls9Qh6o33bm7sYaAw2Hq5oEhU+bFB4Qwub66EVz3OL7t+YxX?=
 =?us-ascii?Q?pcTu6Q7fkSHOmR+nCGrRoQwZsArxVxKeqrm+4uYDi13WkK/pSYyETAJPi9F7?=
 =?us-ascii?Q?kbBnRkQIxtSntqEe/tA8qYVt7LJ3A6Kt1FwEU0VS4FDEX0SbHWgLMvBA3eEo?=
 =?us-ascii?Q?HIdB7p+SxfF4DtpiMp8+5yDhYRezTpQdfRQGVB+12zDaCIsFq/mws4Aq2y65?=
 =?us-ascii?Q?Lt8BeNRbpp46dduuIZT/NaAN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5854bb2b-2bed-4c6c-2163-08d967013338
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:15:10.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mtjJHzAKvY1lVuMPw6HeHhrxsP1U4KaCN627720s/xkUygI3vi6ZP837TEforZ0jF0IRoMu323kHZiEmhF8iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2370

On 24.08.2021 14:57, Andrew Cooper wrote:
> On 19/08/2021 15:38, Jan Beulich wrote:
>> On 17.08.2021 16:30, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/spec_ctrl.c
>>> +++ b/xen/arch/x86/spec_ctrl.c
>>> @@ -317,23 +317,30 @@ static void __init print_details(enum ind_thunk t=
hunk, uint64_t caps)
>>> =20
>>>      printk("Speculative mitigation facilities:\n");
>>> =20
>>> -    /* Hardware features which pertain to speculative mitigations. */
>>> -    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB)) ? " IBRS/IBPB" : "=
",
>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_STIBP)) ? " STIBP"     : "=
",
>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH)) ? " L1D_FLUSH"=
 : "",
>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))  ? " SSBD"      : "=
",
>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR)) ? " MD_CLEAR" :=
 "",
>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL)) ? " SRBDS_CTR=
L" : "",
>>> -           (e8b  & cpufeat_mask(X86_FEATURE_IBPB))  ? " IBPB"      : "=
",
>>> -           (caps & ARCH_CAPS_IBRS_ALL)              ? " IBRS_ALL"  : "=
",
>>> -           (caps & ARCH_CAPS_RDCL_NO)               ? " RDCL_NO"   : "=
",
>>> -           (caps & ARCH_CAPS_RSBA)                  ? " RSBA"      : "=
",
>>> -           (caps & ARCH_CAPS_SKIP_L1DFL)            ? " SKIP_L1DFL": "=
",
>>> -           (caps & ARCH_CAPS_SSB_NO)                ? " SSB_NO"    : "=
",
>>> -           (caps & ARCH_CAPS_MDS_NO)                ? " MDS_NO"    : "=
",
>>> -           (caps & ARCH_CAPS_TSX_CTRL)              ? " TSX_CTRL"  : "=
",
>>> -           (caps & ARCH_CAPS_TAA_NO)                ? " TAA_NO"    : "=
");
>>> +    /*
>>> +     * Hardware read-only information, stating immunity to certain iss=
ues, or
>>> +     * suggestions of which mitigation to use.
>>> +     */
>>> +    printk("  Hardware hints:%s%s%s%s%s%s%s\n",
>>> +           (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_=
NO"        : "",
>>> +           (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_=
ALL"       : "",
>> I take it you flipped the order of these two to match the ordering
>> of their bit numbers?
>=20
> Yes.=C2=A0 IIRC, the first draft spec had the bits in the opposite order,=
 and
> I presumably forgot to flip the printk() when correcting msr-index.h
>=20
>>  I'm slightly inclined to ask whether we
>> wouldn't better stay with what we had, as I could imagine users
>> having not sufficiently flexible text matching in place somewhere.
>> But I'm not going to insist. It only occurred to me and is, unlike
>> for the IBRS/IBPB re-arrangement of the other part, easily possible
>> here.
>=20
> dmesg is not and never can will be an ABI.

Well, sure, I understand this. I said "slightly" not because I would
use the log this way, but because I know of at least similar (ab)uses
of logs.

> Amongst other things, `xl dmesg | grep` fails at boot on large systems
> (because you keep on refusing to let in patches which bump the size of
> the pre-dynamic console),

And instead I've taken the time to reduce boot time verbosity. Plus -
the last attempt must have been years ago. Given good enough arguments
and little enough undesirable (side) effects, I'm sure I could be
convinced. (But yes, especially the "good enough" aspect is definitely
pretty subjective. Yet then I could be easily outvoted if others agree
with the provided reasoning.)

> or after sufficient uptime when the contents has wrapped.

The boot log can easily be made persistent on disk before it can wrap.

Jan


