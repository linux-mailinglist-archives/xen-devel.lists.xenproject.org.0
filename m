Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A606142A12E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206996.362711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE9j-0000Wi-Uy; Tue, 12 Oct 2021 09:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206996.362711; Tue, 12 Oct 2021 09:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE9j-0000US-RW; Tue, 12 Oct 2021 09:33:07 +0000
Received: by outflank-mailman (input) for mailman id 206996;
 Tue, 12 Oct 2021 09:33:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maE9i-0000U4-3z
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:33:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66951bfe-2b3f-11ec-811d-12813bfff9fa;
 Tue, 12 Oct 2021 09:33:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-_hn4KmnCNYm9L6wx4HPYQg-1; Tue, 12 Oct 2021 11:33:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 09:33:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:33:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 09:32:59 +0000
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
X-Inumbo-ID: 66951bfe-2b3f-11ec-811d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634031184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlI/HVsUnSbYF2SmiCes7TEgINUyNDX3u3LORnPGhR4=;
	b=FsloSH/QVbZp6gAPD2T0N7Ea9oknkAgAajugXbt0/hshFM3goNRvSCI9x0jwxjemDZiEEO
	AcZbix/Hpme6+ueDnwUECyg9Jb+BmHvOLrjOFIVuIQRJlpJHuRlQ0i4GyelPq+MojMhrdY
	TXF6t40VekXBce6pmezw/nzWSv154Yk=
X-MC-Unique: _hn4KmnCNYm9L6wx4HPYQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNpWD9Ej/mrMsqUYLXq10MNAzlTimq+EI5WOUVNZEcvqRALQv4NGcpcUFfJe1ONlofPAfECPnY6kNq+y4j7ZCi2BRkZBUX76q6r8yDN7rHN4w8ML3KW3meA5dHYfLch0U9E8SL5FJWjv0EUhLY7JPMP5fudl3gD/SMAijZX0Y5cOhKvsy9NXFpVr+qc4gy6XEzPmJeOmSrmRO0BoE2IvXKA2clAMo6MJ2PniVDSXqsJjyPSm/YSMwsFRQ1OyZKKKNOj9q4FN6BMH7n7+lJomUjXMuqbpLWecClc6ucKm/8O5UFbYHOFYj5lbpWsTBkhOtxfLQxXpdT+6+k66JoqBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlTc4OsIizvgWEywmcw3f300USyHnitFoSeAdgXICXM=;
 b=MltWd9C4ebx8oAWUqXx1XP/K9u2378jpa1ck38xNhsfuzU3iV4mzxA4EyAgvHH/1YQEpQXpAsk+J2H9Wg9kSdXC8kgg3VIAIwgR3Myn1+GG0TI3dih/sBFm9dg/q/m4YlkC2JxN0F10IIEPccI137DLAEM11Un5/bgAqBgL3vV0aaBgxN/c/897/mL5l1cLPP3uujMyeYudqQp+NocVwazlAJGocQKFCfmvmXqgfOO7Ttwk33xVPKCXVTBpFuRSJ/WwtGYXDkk2pQ8Wu2XVn5QyS08ZTl5jAAxd7vA83HsTNlqf9yvWEJnxBuCH3hdsfbaTN7DteudAa0QVC5fHnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-2-luca.fancellu@arm.com>
 <f29c8062-8430-6e08-7d4b-02096a6b049f@suse.com>
 <4FFFB177-883F-44DE-BF7E-53137AA7F0CB@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0bae71a5-4637-d2a6-ddcc-3497e22470f1@suse.com>
Date: Tue, 12 Oct 2021 11:32:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4FFFB177-883F-44DE-BF7E-53137AA7F0CB@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba76ea30-99cc-4dd8-5c67-08d98d634828
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958D0A82F395224DC1315E6B3B69@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D01znZXJv8i2k3ivH56RCUD7jzAjFjYGL+PZhRIyRPwVqWQ9nL3q2odisFI69pr0GdNk3mks5YCRB7O0XsMkyXn6DAXXWBlkISJVhH9AbMju1NmNsOH/0kwuPfLJa5YE9VVuwKw/2dn04O5O2U3ojq/x5qCthoplDuOQQiQ8qM5Yjcl28cheacFI5i3LjtxBOG+mB+Fds/FE4zIavAuHqrYPe5EX6PkicpsYPkxVuK/9oKc94qG/DLNAC9Pt5HaUDq/N2pelyEwEpKc5dMQtrRrQ6KAVQ3l+2RTccudEWAcfOHYsSKIkZxqXG512S/oIgSGlnlzzM9C7fZmvdTQu7SEWUK6tJlhWMUlYkDlPWGEhAyeOfkAqcuARvlgRuFCxtSDOuU//2+SzHiY46pt55U3UqzfeqXv60WycdAP99QpkMDlE2geqeHJ9Pb96T2ea6LPI7eQOAtuTDnXUqjnqVy/n8QS9Cu7tTCxOx4B/nUibg3MDNr6jbRCHVjBQQW7dfjIkUHeSUyiyowfvPdAuv57pjUmKzoA7l2mafCZNzYZdzbTFQc+UBUl8ZHipreLb5H5brBi7tfNjsy68BMOhgmau1k0guTu2JtGry90Ay0+9s+fdBlPc8iNtomT1eYeQIBq572WfDgr3zOc+pXq7xb3n0s8Jj+Yqitp+xGDEo6k1GWMyJzQS/SVuzc1XF7p9KZVFacABovXA4lYBmJJymHv3GIdBS6/I6zu2m2sgDSZod3nWWKzZHqiAXY8nFpRwphZQaWVTyQe464R46fFelg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(4326008)(36756003)(6916009)(26005)(31686004)(38100700002)(16576012)(54906003)(6486002)(7416002)(5660300002)(8936002)(186003)(4744005)(66556008)(31696002)(316002)(66946007)(8676002)(2616005)(2906002)(956004)(53546011)(86362001)(508600001)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JtLOmxohozkzMfnczFVOZcF0yXJuSmfIKMECWgE7nN5bHDDX/DueHpuDkI2z?=
 =?us-ascii?Q?2H9x1tge5yUgCic3Nq1izKf+mmKQSlIzTrjzLmVq0+hlquBmay0NwBYow2Ca?=
 =?us-ascii?Q?/ael/excL5jmz41xZwP4k39COK/3avW6CtSZq7sKgdfj05SFR2pZmRfn60Ts?=
 =?us-ascii?Q?C/BdJ7ToIe5PQ9izBdYdNjqu2q0mqEEYceutNBFbUY/mp01797TAbewMx1YR?=
 =?us-ascii?Q?4aircRetfXvQUNApviiV1r+aHSFQfUFg0R+cjWqUZTYPPeWwRQNLCbIx01eB?=
 =?us-ascii?Q?ZYTxlZSoY5TfvvF0MQqlUNyLEM+J045zFfpl9bEnt6MawDWrcNwC8UPjBY3x?=
 =?us-ascii?Q?la5yNWIyvBL1Cbz2fIscBDwSkFmmy+/5nKZ/wahx7iwocFEc/KStrCFN7iNh?=
 =?us-ascii?Q?GW/N2iUO0FFA/QVW7AdUm+minTaiBJhCoyTXxbxtGXa6QRCc5kzomLi5m7L9?=
 =?us-ascii?Q?0Hxi6tw8diOiY2OvABgkgUwRWHWg/5ZqKW27iPYNGuc8dqZ5bk3DZE0JjPBk?=
 =?us-ascii?Q?IIbJKYdBC8f18zBmkyuOjoEwcRnogQbLOn9zIbAVT3WW/c+CLrqeqJmPNgwe?=
 =?us-ascii?Q?tMc0uJfink01WWZvBRB89Bs291Hs7KrLatUPW/fYYQr98Db6IQLXF6eWRMej?=
 =?us-ascii?Q?7OiTEWcztcGyNdggmdkqkVomQaeUwv6POGur6pEeBQbr0ZCNmfVjonTjD97s?=
 =?us-ascii?Q?tOHWIb4ZofAkGsvTPgOTafxUclxF8Cs+0T7YMf5VnAb55KDhp2kDjwKtYjec?=
 =?us-ascii?Q?ol3zAiISO3jSdn/fzVq3bBHX82cbeOarPbDLLw5OB4BsFwCq0+6ZQzWNzFjz?=
 =?us-ascii?Q?1ELhgqA93U1QImKkFyNxzXrI99WzrGT6yOyEE7JlDNLBNDBqjn3BYVRpq8FA?=
 =?us-ascii?Q?/tqw/oquH/Gwwe40+It9r8u9qNaXkBjBFuXTP6rO+XejDpBAtJ9o+kQOQE7R?=
 =?us-ascii?Q?fP5u1DF0bOd7MhflauWuplyb2ecAgbXLrjhsG4XyRmrjhD4iNERrK+Hakg5j?=
 =?us-ascii?Q?cwT98SQGFMMYJeYKyFAp5n6QOpOULsLeHWfYuaHUspQEGV99kNw+k2eI5vJg?=
 =?us-ascii?Q?1kXZqo3VzRucdqSUUZzRiZx4lGmDz9bWven1nVu8TE5GuN1ZmGaDUu9l8o10?=
 =?us-ascii?Q?UHvcvhQ4uwIXYQ5qRKYvBDG8/woD7UcV0RIBWV9uAhsjNn7h0UTf4TT0Hrtx?=
 =?us-ascii?Q?0lyINs2aRlYoVdCN4WhRbxFPBoncYtf0ZuULswXD/vXAoBDhIGuqJ5G6N5lC?=
 =?us-ascii?Q?ilIkX+bg2kaCwcG7Vq67ZrkurlkdQ+mVBrBEbMnYk8cF6u0XZGbUo/YEyFOn?=
 =?us-ascii?Q?pjWwBzoVsIEy95hityLGzt0P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba76ea30-99cc-4dd8-5c67-08d98d634828
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:33:00.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pdl6S08b3jeZyfrD4Ae6ExXsffYGrI+fDyZ3OtmyWnzuIJJddpOMRtKdfo+m0e9lk0trSiZhHLg0feyBun+Asw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 12.10.2021 11:05, Luca Fancellu wrote:
>> On 12 Oct 2021, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.10.2021 20:15, Luca Fancellu wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>>>     StdErr->OutputString(StdErr, (CHAR16 *)s );
>>> }
>>>
>>> +#ifndef CONFIG_HAS_DEVICE_TREE
>>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>
>> Didn't we agree that you would drop "inline" from here?
>=20
> Yes we did, really sorry I forgot to drop it, I=E2=80=99ll push another s=
erie, given the inline
> Dropped are you ok with the patch?

Well, yes - I had given my ack for it already.

Jan


