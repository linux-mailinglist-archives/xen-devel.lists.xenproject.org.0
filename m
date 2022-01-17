Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F08490805
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258144.444242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Qe1-0007jP-Oc; Mon, 17 Jan 2022 11:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258144.444242; Mon, 17 Jan 2022 11:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Qe1-0007gz-KS; Mon, 17 Jan 2022 11:57:53 +0000
Received: by outflank-mailman (input) for mailman id 258144;
 Mon, 17 Jan 2022 11:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9Qdz-0007gt-Ok
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:57:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1ee0845-778c-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:57:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-IigfIFL9Mp-0kpkSceKHcw-2; Mon, 17 Jan 2022 12:57:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 11:57:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 11:57:47 +0000
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
X-Inumbo-ID: b1ee0845-778c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642420670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bLjFHx30tdnmm6vZASZrGCGa8HrGKg9EJEEFy5nLjww=;
	b=BNPMDrM3lGbTN5hDNiJrIk3KLeQHsuRoUQxJjdsKnBPZoah2lbVhHWxNORlNHkYS3IPC8L
	Yq1pvLfD18udB2XifQRm2ZuYkyomsAN3FrOHwxfJdLPFPSRkS7w+kHMjvjbc2ZOv17UA3c
	WenwZoi+yZUBj2gosNFZUaQEeaJFgNM=
X-MC-Unique: IigfIFL9Mp-0kpkSceKHcw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmSOE+NMaJzofeOn+KNVmGE8N5V14LcdJAaZvw+FEU8n3Z+WO7l65ObDcUUXXE/EnCVT96z8NgqmHIptVvqiWLPchqJrfS7+2gcH01IcBxq5QLLPMkTW48Ho94sMUneFUcuax1Us5PW5YGAy7oHsl16TIX1KHeSoXi5M3Y9sj4tFA88b5aC6bJYWYiD+d4ITwsZ/3a1nxnHaSNPkOwK4OlzneLoeJQrQmViqzxd1ffqoolG5CBqlSpeCvw/4YNrMNelwTmBUL3+YK1NnnbIVwxIDDpDVlCDeisRWYI4Cefohwkb7Egt1ncOquJYe6i7NboJyVAPcPSBPwWYErbe8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ/zTNOMe0OArpgikcOSniJL63ljcgoh7uNa/JxE8R8=;
 b=kE+OBcm6GCIIsrBEYBo8VnNx9tvhBr7fkSUVPnTLg/L6l5pD7jEP+1rZBAVWIn09Y8IrowVmufzn7UhjJYz84M2MzIcgNDF7n1aGrjHsEXzUq2DCNy0TUOPFKjIGlouZO5URvoPjJRP1nIFlUez0LRy1k/II1tKmBjA4A02ajpJLV9ofs5orR/g3Li2TzC5hats++h/4K/FGl3dwz+kQHauavazx/l0EauEEI0PN31u2D4PWybRH9LPe0TQ367SAgJvTBsPdkUl2XWsSSRYG7yn+Wk7TewJYg1kxnM+biIL6HgQYPgABsr4pN5tF9UIHYItuBbUtvdq+EzNwgyQ1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d44be0c3-8514-4616-cc98-85f6b06d91f1@suse.com>
Date: Mon, 17 Jan 2022 12:57:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] x86/spec-ctrl: Drop
 SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-3-andrew.cooper3@citrix.com>
 <aebd4542-8eb8-5073-a578-5b96a6354b84@suse.com>
 <c609152c-9a4c-2ce1-2d32-37b095c85181@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c609152c-9a4c-2ce1-2d32-37b095c85181@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0270.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da7bece-2999-438e-5277-08d9d9b0946b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB583121A858136FD707152849B3579@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	56CvltdNs5VXvy+2DvMB376h9IDTndfstFzX/+JCT1Gvk8yXuapplNujMLklpZM8nwF0sTMf1i4ouHDq1la6oaO6N/OYcmi6u9K5/ZgEn9ghpN/vLmF3j/4T4Kmha5i8PrcKbgPBsyMSetb7ObrB1bvN24kS1oL0yP+0urcfMpj0FOmX5NhV7yX/aXLeoDTwd8OnBcmu631UUWB6bNj4jbEatAXloLqGRAWIATWGUkxpn3UJRa4C8nMLlA/rUrTpOU9qtQhaWLgUOOD3NkdV3FcK0ShO9QxwNWTG9/t/fxy0IVhVnXC6Z48PSgRhTdD2ZsUQuqVRHg0Zz8v4ImA1Wfcd1Rn3vPbcEA+XaDBpuUd53N03Haz7FpkM3tRY+qdXxjlWxj+LG58RHvCnfqOELjxQ5TTNcjCImlxj8/kwIm05iHXj8pcDixBsBR3RWlxzc+/Dj2xaCVxAWa5OFFF98BeLAwyehfiUeNMDqYErb3iHx4rSe+Xn+d+BmffcDiRqCswH3RLbNuk6MRkLUPupEsrilZ2NbNFBzt7aZBTyZNePw3FadDGRTFqkMlHijS2tTSgkZeS6BPcKkvDlWM0v3WJh/zG+VIY0OznHcuFrQSvsB3RuV7U46763OsJxLbYELmtH1DZaUZsqneB+0rXfObjdDSIVeTi+SlBvLLrXFuZgVxq6tbtQTzedhkrGi0nYiMWcwDp8OCjchncP9YUB6VSTqfVZUEuSNt5GrVDqCZWgRvaNz6zyCbPT+mhhZ1qR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(26005)(86362001)(66556008)(66476007)(31696002)(66946007)(6486002)(8676002)(2616005)(2906002)(54906003)(186003)(53546011)(110136005)(6506007)(38100700002)(508600001)(4326008)(83380400001)(31686004)(5660300002)(8936002)(316002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4EnVw4heB1fZto6r6vh4CjFd/ntQ5TErAzxZF3uQXnCFAbIcwrnKOIKJUhqO?=
 =?us-ascii?Q?xSkvXh5uY4m97n5x3esM2scX+y5fvYxeJAdmbCmwGohsTIlX1qXp0VnwORb+?=
 =?us-ascii?Q?Hv+1WtC9As/IJbtjM8/mlxrb0dKFrStqcv3nnqIHI4OoQnDGcYjaVCNQ1ZjK?=
 =?us-ascii?Q?Td+T8+Zzww6dwQWZGs9SvR5SDY0JKa0NCD9U1h3N7VWyBH32a5Ii8o+PfILZ?=
 =?us-ascii?Q?gQ2yHCZuCc0l66zwsQey6+D0dyu7rAyLxBiHAsMeScUv6g+wNTV+YcduE9v7?=
 =?us-ascii?Q?hX0d98ZJweRY5yIZJsUJMO/3/W73FZfQT3LeCDmeNm+9PW1FpOg//c11Hx6Z?=
 =?us-ascii?Q?ZYGz5kqopSSjqeQYaGk/PJ/Uh85RRKvRTxOFb329m+7ppbBAVmoGDw4VlSvB?=
 =?us-ascii?Q?J4DjX7moxZnpON6rNmYqVxpWrI3R70E04F6Kf2zeZblWjiUAqIOBAXm1OOvT?=
 =?us-ascii?Q?KH44VWYJBf9W1zJi0X5CuZl5Vck4jqAPoA/K8e0BMXbfT5n1SZVF+XaseyK1?=
 =?us-ascii?Q?Es3PEEoxTwy3UfmYipi7OgmAEeNIHyE7IrOJWOPcKwEMBMgC1QXzeDmDl4jo?=
 =?us-ascii?Q?m7JiLtk7O0+vPL6KxYbVYGERm9WPx0VjkhWfcgnQqGI32LpQ4aWssqGT8+99?=
 =?us-ascii?Q?Ofy0a0mfNaCNyXU4uq+bxtgNRuEZlWEMxuOnq01VkmF/OCq0arAXM+QJJLxC?=
 =?us-ascii?Q?ejQ8mQpz1q+jnyGQwXKvg5+dG3syXkC1B2Ex1qoXjHwlDy/lJej18K7wwXe3?=
 =?us-ascii?Q?sEKTqwMvYiVTUJud/ECyZekUWdeO9aF9xpv8nq0NxvGRKL6kLdSA2BXDdjo0?=
 =?us-ascii?Q?n5oX0zVQsAt0D9Uo1Ns/Q/rEYOxEWJCshETKy14CiVugojYWpVTgfYnxvedh?=
 =?us-ascii?Q?dNoXKaGPk08QR0YYyaIRT9zeXUgcdl+XA3dCr2myXgRB72dwmT03dcbY8mqY?=
 =?us-ascii?Q?ZlsFDz946/SRtIKTe6l0q5vbn4b8pdxXsWpawkKPJoynU45PV+ZKld9+hFxw?=
 =?us-ascii?Q?Zy25fhlbBTCoS8Oqf5IgIK8jg15sZdEp1TZOyOAB6b/mANNvCoqg+p1kpISm?=
 =?us-ascii?Q?+lens3MP5ZNUWMBKPcPm1O1BUYzVfKi+7ZLLaRnp52xgZpU+YepI1MXt4CrP?=
 =?us-ascii?Q?0FRjlHY9QD4VZlBqgSt7ERUcwsCaTzYfIkm9TD5KC2nGVePGfOq1RZLwn7AW?=
 =?us-ascii?Q?5Qoh+ak/0vpVAFVNFNU4r7qMlAEHSNuWOl+wVM3ITq1Jz0sF1TcnvJWH7Pi1?=
 =?us-ascii?Q?wvcaMYJeVbARfUFg+g0coEAGZQG808wNpBGedh0NWVatJ8p25ALduDJgdgDF?=
 =?us-ascii?Q?tEo3fIyq1ldukaP9Etd53LcLy1Nyh8+JT8JevXKVdnn/WUP57Zw88XLMRd9J?=
 =?us-ascii?Q?latipH1ISb3I+YZqb4KzloZfVTiNRIvzz8BFLk5lKhKI6oDGVTyIZTMXnve8?=
 =?us-ascii?Q?8M3U8oCrZyhn6jNWh/kAvUnDpgjY2779vlYWJ19rqPUwh4hC/f/A+8mdK1u8?=
 =?us-ascii?Q?ZZjPxwKv+5lS1xJNT7NoBYDnJ8KBSzGZLIAIgIy+kR0taS17onqLs8bDybCn?=
 =?us-ascii?Q?11J3r12iqqzDvMuPt+HLAoT8oojlFpOTa+eY1W8OfYkecLfa91EGktY0DnHR?=
 =?us-ascii?Q?G0LCV9aj8fPhiiZbsTjFqsQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da7bece-2999-438e-5277-08d9d9b0946b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:57:47.8508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjG2W337OE1AcRdQMCkwghfb+F6CG4OodICCaABs1yvTYM5hhvOe7C8s4MXIjjMGbW4tbiSlPzamTI1acvVhNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

On 17.01.2022 12:41, Andrew Cooper wrote:
> On 17/01/2022 11:22, Jan Beulich wrote:
>> On 13.01.2022 17:38, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/svm/entry.S
>>> +++ b/xen/arch/x86/hvm/svm/entry.S
>>> @@ -59,7 +59,7 @@ __UNLIKELY_END(nsvm_hap)
>>>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>>> =20
>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this poin=
t. */
>>> -        SPEC_CTRL_EXIT_TO_HVM   /* Req: a=3Dspec_ctrl %rsp=3Dregs/cpui=
nfo, Clob: cd */
>>> +        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
>>> =20
>>>          pop  %r15
>>>          pop  %r14
>>> @@ -86,7 +86,8 @@ __UNLIKELY_END(nsvm_hap)
>>> =20
>>>          GET_CURRENT(bx)
>>> =20
>>> -        SPEC_CTRL_ENTRY_FROM_HVM    /* Req: b=3Dcurr %rsp=3Dregs/cpuin=
fo, Clob: acd */
>>> +        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=3Dcurr %rsp=3Dregs/cpuin=
fo, Clob: ac  */
>>> +        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
>> Just for my own understanding: The comments you add aren't commented
>> out macro invocations (as I did read it first), but comments naming
>> would-be-macros which are then expanded "manually"? That is partly
>> because initially I read the description saying "Expand and drop the
>> macros" as meaning that the macros grow in what they contain, which
>> looked contradictory to them getting dropped at the same time.
>> Perhaps me not sufficiently understanding the difference between all
>> possible meanings of "expand" vs "extend" ...
>=20
> They're grep fodder to be able to easily locate where we're doing
> entry/exit speculation logic.

And I don't suppose I could talk you into replacing the use of "expand"
in the description, even if it was just me who was mislead? Perhaps by
"Open-code and drop the macros"?

>=C2=A0 These paths will continue to diverge over
> time, and cannot have a common implementation.

That's understood.

Jan


