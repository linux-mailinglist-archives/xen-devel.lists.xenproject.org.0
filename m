Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A07403BAB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182144.329587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNygT-0000a3-GV; Wed, 08 Sep 2021 14:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182144.329587; Wed, 08 Sep 2021 14:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNygT-0000Wv-DJ; Wed, 08 Sep 2021 14:36:17 +0000
Received: by outflank-mailman (input) for mailman id 182144;
 Wed, 08 Sep 2021 14:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNygS-0000Wp-6j
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:36:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e7118fc-10b2-11ec-b160-12813bfff9fa;
 Wed, 08 Sep 2021 14:36:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-7td--1hNMv2e53sBoxk4yw-1; Wed, 08 Sep 2021 16:36:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 14:36:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 14:36:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:36:11 +0000
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
X-Inumbo-ID: 1e7118fc-10b2-11ec-b160-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631111774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbpT9o6qcRjHxsKKMwBw8BXxu4vaTaXGYPkuG4Lg9uE=;
	b=Y5cmscKmLR/CGI+zwiVKgF23G8YSgoq+TgQYhD6T1Rz2WClMqiF9CkJA6AlzWJapBzOJ1S
	2+2oPQgk8sekreF+nQT3D4p1MP/Ge6G/3D+/Ra4DUaRzRxxIWIHFNYjrTmeBuuAd0gIQgq
	5HMDilOnHuwvFYD5xEgrDS/K1OaD6S4=
X-MC-Unique: 7td--1hNMv2e53sBoxk4yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TerP9x9BmiCHfpDlH0Sh4Idd/x2veCKc/65Jroi2thxHwagBmHIkh1aKPGXyuMhzOKXfyOzM/ZTNq4yzRehYW194lYbKCAjTjVZ5+1gZ94+Y8ol0KRiuVuQD2kFE92trog9lzX2NRN2dj5+Prz7lO37fWcXdMnlxS6kcDbTGiqoiEw3+6fOwhepNX23PSWfv0HC9u8AmVWlDRCwKSDWjZ0TlZ1X6lbfZy1cX8xjanR1PjZZuyxS/TDzeBAb1/vbov3nOs7/ehgnosFva58Pj9ACeQ4vF1xPMfXn3Vm96yY2rcLdGH1Z2kRdhST6nd6OzhsVRi6enknYOw3Lyh57ZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IDcu2Y264VS1Qq2YwjagZznV1KTSt9QTfw5Vn+imeYY=;
 b=lT7Ft7+/G+uqvRlXwGz0V/xB+gCHE0uuGPpAFTyhveK70oNX+JrsI7hxCd+gZ3gumfX/ZKzXrmFU4NXZgnx9Q5jguqjb+PmmtnOkJc0fO9GRXpuR7qRux8D5qgFfTOzH6XsEVIcdWQPOSsIRO3K6Sf7Z71UYHv9yuvvAHj6LCEu/8WNXgG1F+3TudShS9yCY/g0hP8P7qU8PoptC8k7E/Lyt/Es0yWjOdzwZ2yv5VFiFlSsnoEzv4I5V2G2Hehj3eFW8YFTDpxV1NZuJusgx26suA+R11mBepHxQfK1kbmrZrI65oYZ0uEokEODcyuk35wM0d1/tx+PlvIP5u+ZXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/3] x86/boot: fold branches in video handling code
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
 <33dc91cf-1c80-b386-f9e0-6cdb8e32d5d0@suse.com>
 <6d74fb5a-d7ca-8fab-7f6e-09f6a0a9a700@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <704e971f-5e52-60fc-0a54-6dcca9157745@suse.com>
Date: Wed, 8 Sep 2021 16:36:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6d74fb5a-d7ca-8fab-7f6e-09f6a0a9a700@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a414b58a-0f09-45b4-5972-08d972d600fd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55985266FAD0E2FBB227FCFCB3D49@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eLDWtceeFD0jUiNIH5rJRxXUtNWs5W2+sWz1HdaVLHwErxRvKsZgQyl2MVsEQvhDyWZR7KOlu5UlrYRrSXy390ug5OaeLuoO4MXUYprVsqTC06vWVjaxIS1z9FotuaVtFRmQqsl26QbZojFb++nt4IdIG51u63/+msEwl1HHkvOFpWfqKHEwTZslsKcoL9krWXai/MkKuYmyPyoudT80x0lHdSGLYuj3oQMz92i+xyuMQcrLpikofGtTvwLk1lezsMC87qdJ+1/tvZzQFBlj+7aaM4NUprl8YGTSi2ZOICAuzH1z4R4ocFd0H2zedrn6HDK0QkOfEuzFaCHzy4dItEEa3++FQh4fHD9LBo4FMJ2q1Qk/w2RdG3m4AbcOnKmx/r+VbkvNdEkgfri35ozix7ARX+zHUaXxS6b5KS18nv+3Ap4PK1I2J9jxaEmxlM7UaFv0OfMxzy/qAgxO4mnzSN9Df/QSv1KvT+7myxmw/2VxbPEMiFz/04GWo+/1U/DDUwoTBB8pqSzwQyDsIl047CCKnEfx+buGBkXZiMQs3XHZCEjZoVvTd09GKcEz74O66JIBGJoNdYwGnf1rcL1r6eEFyVrmuevMEkifYkFxWqRbbd0hGj60Xfm8/DQakamp4gaeYgeEXBX2WUADHdjO8zyX7FQYdmNy9AbCa46C5WI+aNWGbuek+QoG3IjZx6QGNDy65TOsHQ5ViD5YT3+bq2LD9IJ1m5H3QLBeh4rIUzGYrjmtMuckjKUfChnNna3c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(956004)(26005)(2616005)(6486002)(54906003)(38100700002)(478600001)(186003)(5660300002)(31696002)(316002)(83380400001)(6916009)(86362001)(2906002)(16576012)(31686004)(36756003)(8676002)(53546011)(8936002)(66946007)(66476007)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m3KkL1kx8Hw6DjkCbKbH5+vtgLd22g4QSw2Gwy5or2Qq8r43Q68as+emytnl?=
 =?us-ascii?Q?odiMRTe/YHtvanL3eo+0zQXsLcByka3QY7W/0L6phHeCWdLM+a6Jrd3DH+Ew?=
 =?us-ascii?Q?XjQkVBdutoSQnyl6sQxe2MrO0bLOnvAAEMT1u3YMG1yjzgn6+yk6jf5AYhxV?=
 =?us-ascii?Q?9s2sFg8MtfMihdYuwi7lAuYPCnxpDmsIr3lwiJPaORXfXpl66yvlZ3Epwz/9?=
 =?us-ascii?Q?2h0+KwFrhrcgFPqoAyx210fr8EecU2Jr2bBvMWZNJ74n6HULeboeuq6IuRJl?=
 =?us-ascii?Q?BScrly4OVQaZmUqZIoydy84fPklqMcal/LxrEFGVhGO+rHPLLN2ZnthBZ5Y9?=
 =?us-ascii?Q?lBmb44vyJhwBvMhZ1VEkXg3f9gRca7I41zCq+7I9QL2AlgHBbyibQMLvV82e?=
 =?us-ascii?Q?wIa1RykiEZ1qgu4HbwE1yAMVxeXg8KcQPihyvOJnNy8GvpxmsI4bysRD3ybi?=
 =?us-ascii?Q?DAd63xHxPNFJLLo7zX7aB6ikKDdFjp4fnRbujTTFmQT7SdpwIdKfFl5Cv5rQ?=
 =?us-ascii?Q?by5c0YBLZW8AbNrrzBgsKC3jNupOreaG+rMqDu1oDae5T0iqtBP2dgVnKfBI?=
 =?us-ascii?Q?KT+4bcMYnDeEqinWvwlS20BZCLX+RfAaj5rjsg1F/yjov+RmAVJ52fg7ypjW?=
 =?us-ascii?Q?Lbaru3cLgMf5+12NeuHub7toSCVKEt1NyIZgeLSW7JwfI2L3/QVv0BsG1CBm?=
 =?us-ascii?Q?sL6feznvCgij0hB63Hg3ZSCXSWwpSwLWRknB6VtL7kIBounOyjLzO2edC9x2?=
 =?us-ascii?Q?xpUB+wJYHGEP1NpUomN/PDiGyvKAnI9kgm38DZGiSJrQrZheMazh3nuawJWb?=
 =?us-ascii?Q?UvS6VC8OyUeiozZ0BohCNUqqCUuJd/12YkzbS4nOXZP0sFBqRSigmQIqy6Kh?=
 =?us-ascii?Q?oI6Ed3AYpF973d+1FKWtPergovik0+6sUF1fMcqBzv36Uz2rIx9wCB6ao1/u?=
 =?us-ascii?Q?SJob6B+rCmXf0fHQLb1SWee6i1BRqMVbeQR7A2n31BiLZ4tIoDCIhcR0uKvL?=
 =?us-ascii?Q?83Vbh8fKNWyf5eqoXSrr6gKrhqiLSgkkQtMMxFTXQgYYvcqbH2fRo37mOVJ/?=
 =?us-ascii?Q?Eb7kFbfvqFcf4Bpl6SMIDTZ8XOHCxTMCwm9LdoTzWq2uDWFnfWMKTlVs7oNM?=
 =?us-ascii?Q?3Xrru7NkIwdHl9AlUG5WZ1LSBF9UxXwRVHl3iWGLCekqd3H4v6pfDUDRg7cC?=
 =?us-ascii?Q?1lPLIL42ShFsn6W5bS+50HyRTR+aejpyAotWd5U/w70nJVPF8S+URH6gvoYa?=
 =?us-ascii?Q?sJsn5rRbGubISbed/3K0tAbtwHHrAzK+YXPi2kZ3ZatyXB19h2iQ7m0URqUy?=
 =?us-ascii?Q?3mVW8vrvyJanSUAmlm0NuHP7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a414b58a-0f09-45b4-5972-08d972d600fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:36:11.6216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7SeZ0VVO6ISPNSt4cOjZ7h2zOuVp31DB7ZY7nWhp61EW8Fi/zfICwG4SUqFwt58dpqovWqgK/gA07INJcltJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 08.09.2021 15:49, Andrew Cooper wrote:
> On 08/09/2021 14:24, Jan Beulich wrote:
>> Using Jcc to branch around a JMP is necessary only in pre-386 code,
>> where Jcc is limited to disp8. Use the opposite Jcc directly in two
>> places. Since it's adjacent, also convert an ORB to TESTB.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is an easy change reducing the overall trampoline size a little.
>> We're pretty close to needing a 4th page, which I'd prefer to avoid for
>> as long as we can.
>=20
> Honestly, it is high time we ditch all of this.
>=20
> The interactive video mode menu only appears to have confused users
> who've encountered it, and it is a weird thing to have in the first place=
.

Iirc that's not something we've invented, but logic we've inherited
from Linux.

> Furthermore, the Multiboot1/2 specs have supported passing
> video/edid/etc information for longer than Xen has been around.

As per patch 1 you can see how successful I was with using mb1 with
grub2 when it came to graphics modes. (Just as a data point: Afaics
the tools configuring grub in our distro still use "multiboot", not
"multiboot2", and hence we'd be hosed there when gfx bits only work
in the latter case.)

> I am not aware of anything we currently obtain via BIOS INT calls which
> we can't rely on the bootloader for.

I'm unaware of replacements for what edd.S does. Which means ...

>=C2=A0 Furthermore, if the bootloader
> can't provide it, we've got 0 chance of our 16bit assembly being able to
> do something useful...

... I don't really agree here.

Jan


