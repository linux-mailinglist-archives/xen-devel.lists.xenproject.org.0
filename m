Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E047758C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 16:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248026.427766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsTe-0004vP-T8; Thu, 16 Dec 2021 15:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248026.427766; Thu, 16 Dec 2021 15:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsTe-0004se-PO; Thu, 16 Dec 2021 15:15:26 +0000
Received: by outflank-mailman (input) for mailman id 248026;
 Thu, 16 Dec 2021 15:15:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxsTd-0004sY-Cf
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 15:15:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd2100b-5e82-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 16:15:24 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-QgA81-P3PXyrc7JjKpX70w-1; Thu, 16 Dec 2021 16:15:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 15:15:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 15:15:21 +0000
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
X-Inumbo-ID: fdd2100b-5e82-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639667723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBuna3sUWfypxfKGttV//Yn0A8Mar2E8GUFCkwofBqc=;
	b=BtyA3Vb/cyRJ257PwXQ6/wqWaepi8kUf7mDjXCq1UiGDu8+nmv/kfbWjlhLPmKje5ouu8W
	CZY0nmi7Ca69XzViZt5ecA39pkb7pBzNY/mXuyrQbjNd/XPWaWkOtA2ttMA2GKI8MiHPc4
	mk0RVEi00+0l8KgT/cHkIwYk6uj5i8k=
X-MC-Unique: QgA81-P3PXyrc7JjKpX70w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4AJq1AYTfxuwKXC3AEB2RAkgrDVytfVqM9aZl3oiGnGyQE6qNmJis1eoDTk3lqZIkmvCyRPCCIV55xdSh39P7wdN39ty0ipBV+yO5HO654XSSa6hnKE/Qprr94cKEyBnAsaXj9gM25dAqk3ictOfVn1iRsvcqxe0NVb/nHn/9X3jyNQcJP1UCo+2aKKCDy7sHJolMKcjBJ7MlzOvQAVgpo62nhG02Ejn7E1wDcOsit9CxD4RL1HxCvDqm16nfff7b+Kx+Y+H0kRk4+OXqmX82OdkAgSE4DwcOQZFLyLl47SUfZIJOAIlgBHyY5njlUprVGlNofxQapFVPonD5IAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bubbYSp+rLrksIJwv3J3gi332AdAKd0RX6X9fxKhp/g=;
 b=A2En2iVklL8kj6jVG13NEaK+lOUqYPpu/nNOXnjNlhH5k9VBHSoaXO85A65/IbY0bqwg/hdvon5oR6iqTfmMKsU1YTUrrcn5OawLfY+RXELhKLedU63/Yvuj/BF60BnbWv7Vgwv6vR/c+75azlitMJFch8KHdNCDzuXRxZhXmGkZ6Mx17eUr85qM/QEF9CBNj4iWK/Dm68tBzun5v+gGcUL6dbrFzgC+3qf3k4OYmlmfXBKu8QIx/cznRMe0jAN/kNG34wruUGl4fMuaWFqJrCbL9uSfkMIxGkjpyQCizvHZz0f58IUdIthP6ccg22dnz1wWW8qH1fSGJ27so6eP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8993520-ab01-f462-9b95-318171cf411a@suse.com>
Date: Thu, 16 Dec 2021 16:15:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/build: Fix `make cscope` rune
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216092014.707-1-andrew.cooper3@citrix.com>
 <a6dab969-ce3e-a328-03bc-c27abbba0448@suse.com>
 <d8b5d939-0682-f8e1-9392-2ea9748282cf@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d8b5d939-0682-f8e1-9392-2ea9748282cf@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 302ddd94-b125-4be7-d863-08d9c0a6e06f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57447EDDC6C82BA6758BE184B3779@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ho1FhTMw647bCRzTDk+//L90nQ+P9t9bBctrD0ikIlfVerLh4JfwAP+pEY/a6cN9IBhc2JPvFVrZz/gbJwXJsJJim/DH0d4sm6hfvCSDFVok9okzqqtbzh3nMVxvqaE2KASXc8p3ILFFSsvpjFPbmZcdmz30hlluZF1jWwEaEapcLtR3IaTU3bjLcw5sCP5QoiS1NJFk6i37CGyaHoULcrs/zUUsFPtkh7O5hSFCPTLQR6htVyyT/paXNxeMzS/9sQvOnD7Mva4Qclk+iHqi60sBLamQckP+sdyzWckZUY4BVOjqHRMEpUsVXsefieJOEUuokKPehAnPMIndKEQu6VatdklG98EPckw4BoPj/2G+y2YcJo3EjtS3gajhOk2WsddIcxI6Z5Z6kV5+m1eg6Z6ezih87hwlgoL6FJJsiUgkmXzLD9Cs4UsXWjZGeOPX5rgetLcFsz3c8/cBovgC6T6wXmFG2m0gQmUbPcdCeNmyY0xpP1Tr0JxRoT1fXlcPfaLYXsk6pkaUazSV0Z48A4EeVIZQjJ3szR/vdQpT/Y63EVaGpxwp1CEyHA5WMjSOiksfzMWrugerTZdY3IgqHGrhkxJWM55OWKQG1cYjb0J/v6Zv6XyFRX3P/Z8t3I8qDP51q2mCA9tY6bt5PauQKEDpovoH2LON1MHaFyOSFG3TxGyvGLk+SYwwNPie0m8fGdQ4g/+N4oB/sI2G1Yee5oNhttkmkwrKXb/GTPchv38QZifc4c4Z2bTdwyuVvxUfAKQYM/JUrbp8XC4jmEiyHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(31696002)(66556008)(6512007)(86362001)(2616005)(186003)(83380400001)(508600001)(66946007)(110136005)(8936002)(66476007)(316002)(26005)(5660300002)(31686004)(7416002)(6666004)(4326008)(6486002)(38100700002)(36756003)(2906002)(53546011)(8676002)(6506007)(81973001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bPicpdd9oMWBfqqAghFatkSr3D2jXtFKwmqy+NDBvyTmW1ld9Kwjnt4u+7xB?=
 =?us-ascii?Q?3mkDJPZN47pZDAIBEoUSfwcje3RQ89A5cEKTiE1yMzot3QOoOqnIppmTZwUp?=
 =?us-ascii?Q?FKPMCMGnB2S80snGMmliTxLqsohpKozI53xCKxl3Q7muLRfsTwzgVS17uWjp?=
 =?us-ascii?Q?Y/aHqHlNzAvhus/RZyuwZcARaL0hmN1VUQ4vG1UrJPYzvjnhHr+MSIOmc3aH?=
 =?us-ascii?Q?BNXeOECi3UCMOTOtz88jQz91zKExFTL6ErOdGhLYBV4UNpgZKqJ5xSLUMIVJ?=
 =?us-ascii?Q?XrAYn1d4UUFXCX91pGAyIGPkyY9qRw7VK/j20t7SIDKwuqSAhoX/IuuJqji6?=
 =?us-ascii?Q?vwtL660+N+toAuNbAT9B/yeLVoCOoNtgLiqMn2AWiOmCBeBySEte+/3i2idY?=
 =?us-ascii?Q?W0UtoZvPTFEvaNGw7Ow8a0Z8jQwH3Zaqu7uU5fom9ArbiqkJSS2jxfPgN6Zu?=
 =?us-ascii?Q?+okLyCgnpgi/TsFH0pVcKhD/wVhsTihtZtvGYX8oOCEYLGQ+vSKe+I8+k9HP?=
 =?us-ascii?Q?Rsgifs+Gw2Ve/4ZOLvQwnqdwIjj178RpCMXO1dRaDZW1xss4K5EyMSaG75Tk?=
 =?us-ascii?Q?1tfTfZt+4OPDvKY6atM8U8k3Y/ovbPDrXg3ZEmSBZPBdZ2rI6Ch5iXI8v/QC?=
 =?us-ascii?Q?zv2gLBB76jqOdESX54XQMjNnQ3qZRuxVLvhV5wpphy+iNMCngjGYBXbuCjOY?=
 =?us-ascii?Q?8OAmzR77VPTmSyfo38O6KOWLQ6dHreJykmVoBZLeYlSDswJ6YOQIrLw+rTDX?=
 =?us-ascii?Q?B8FGpQam0JLkxl4ua/7i+6n3EmUlke0cJAmhuomaBFutV0UKP0Ujp04alq0o?=
 =?us-ascii?Q?ngJvbSdsHw+5gQyPBGYNw8MISzwQynP9DhGxBHfiRhCxlRu/5+W/CO6xAkEl?=
 =?us-ascii?Q?suuFyhbo8XL86TiB2LAOmUc9ExQuzDJOAluwwFu6ciYxKcr+GHaWw4Y/pwQH?=
 =?us-ascii?Q?QwvFJkGQr5LfHT/pr6PmZiT0fhLMAbTTnK64Qcaxc1jZUMnbZbl0AWrjNfrw?=
 =?us-ascii?Q?BpwVoLFvR8A10XSfl4tnUJ82dlVCatZz9uowztfyqA5B+VY0w2gXrYIZ2WC5?=
 =?us-ascii?Q?T/pFwphVQBl3L2Otq6QO3Sqxw0b+95sZeAsz0awEX1mtmHGumb2JmdgxTWNE?=
 =?us-ascii?Q?k/hMlaL3gSHjDzHltUf+AgQUZ5uoGl97zpBYST6mTGp0iX8RtcZlKz/j0dci?=
 =?us-ascii?Q?c5kmuxZQmG3QkPZlHCeu9I8N1tduSVL9wLYcUD3D1QpaT5KexIRO2WjpnMqB?=
 =?us-ascii?Q?ZG1ddFdSJoarj/sL+C1weTeQR8urTvJilqeZufA0DtS4ycuuCo0bLfJjWTc8?=
 =?us-ascii?Q?rQOzsXxO2KmUEs60G+Zko9XcRXmr3LxMRD25ajFAu9tasQvnF1TLIWXXdfcm?=
 =?us-ascii?Q?r5w8neiR6SQPonrm/dLIj1NwGQ0TjjKmgJNyiOjKB1dIW4DOsk4RxU3pmp/l?=
 =?us-ascii?Q?0TnFrK7L/frNyXdrELOM/hf4n2zceg+/kpDVswsD87WW5N7udhkZ0zydMrKG?=
 =?us-ascii?Q?ynfA7u9yTZBy5aIhkMKQ4jaSnzpWqKTXqrEr9HTImO8eh6iaJlM3IBB3i1Bs?=
 =?us-ascii?Q?xsfrcUJCeIyW984E/k98q3Wme7phwJljSl9r7KTa6ZMEMum4fS4TS1Ex76EU?=
 =?us-ascii?Q?K83gNyt8ZWf8GgASt3jZ45E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302ddd94-b125-4be7-d863-08d9c0a6e06f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:15:21.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iG4N2Uq1EEKUd91jtxYID3GZBhn14yiQm3Pz8ODLgkV57UaShgyLV2iDT01waZHEljBVnA+XFGvb8Ip7nHTQqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 16.12.2021 15:58, Andrew Cooper wrote:
> On 16/12/2021 14:00, Jan Beulich wrote:
>> On 16.12.2021 10:20, Andrew Cooper wrote:
>>> Second, and this way for a long time:
>>>
>>>   $ make cscope
>>>   ( find arch/x86/include -name '*.h' -print; find include -name '*.h' =
-print;
>>>   find xsm arch/x86 common drivers lib test -name '*.[chS]' -print ) >
>>>   cscope.files
>>>   cscope -k -b -q
>>>   cscope: cannot find file arch/x86/efi/efi.h
>>>   cscope: cannot find file arch/x86/efi/ebmalloc.c
>>>   cscope: cannot find file arch/x86/efi/compat.c
>>>   cscope: cannot find file arch/x86/efi/pe.c
>>>   cscope: cannot find file arch/x86/efi/boot.c
>>>   cscope: cannot find file arch/x86/efi/runtime.c
>>>
>>> This is caused by these being symlinks to common/efi.  Restrict all fin=
d runes
>>> to `-type f` to skip symlinks, because common/efi/*.c are already liste=
d.
>> I have reservations here, albeit of theoretical nature as long as only
>> the csope target is affected (simply because I don't use it): Make
>> rules should really be independent of a dir entry being a real file or
>> a symlink. I did run into problems with that already years ago when
>> the shim was introduced. My arrangements heavily use symlinking, and
>> any assumption on files being "real" ones will break this. At the very
>> least symlink checks should be restricted to cover only relative ones;
>> ideally one would distinguish ones staying within the tree vs ones
>> reaching to the "outside".
>=20
> all_sources is used exclusively for "tags" purposes; the
> TAGS/tags/gtags/cscope targets.
>=20
> Personally, I'd prefer there to not be symlinks in the first place.=C2=A0=
 The
> EFI logic is unnecessarily complicated to navigate.
>=20
> But the reality is that inter-xen/ symlinks for source files are also a
> duplication as far as these `find` runes are concerned.

DYM intra-xen/ symlinks? Else I'm afraid I'm not following.

> Apparently tags et al will follow symlinks, while there's no obviously
> help online about cscope, other than "resolve your symlinks first".
>=20
> In either case, you don't want to end up with both the regular path, and
> the symlink, ending up in the file list.
>=20
>=20
> I don't anticipate the usecase for all_source changing, nor the way we
> symlink things, so I think sticking with `-type f` is the appropriate
> action.

Well, as said - I disagree, but as long as only targets I don't care
about are affected, I guess I'll let you do what you want done.

> Furthermore, you really don't want a directory (e.g. include/foo.d )
> getting into the file list either.

I certainly agree with you here.

Jan


