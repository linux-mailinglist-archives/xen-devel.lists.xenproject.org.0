Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A34557BC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227228.392938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndNE-00024X-Vd; Thu, 18 Nov 2021 09:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227228.392938; Thu, 18 Nov 2021 09:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndNE-00021Z-S7; Thu, 18 Nov 2021 09:06:28 +0000
Received: by outflank-mailman (input) for mailman id 227228;
 Thu, 18 Nov 2021 09:06:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mndND-00021T-MU
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:06:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1848de-484e-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 10:06:26 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-QNeMx1XPOEuZZ0RLGEs1Tg-1; Thu, 18 Nov 2021 10:06:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 09:06:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:06:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0346.eurprd06.prod.outlook.com (2603:10a6:20b:466::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 09:06:23 +0000
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
X-Inumbo-ID: cf1848de-484e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637226386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzYPmiFFtOZJr02TIPeK6LVt3dijkTC9mFGdDhsO/qc=;
	b=l+t3q2NsYpRvLu6xPlrzmVXZJw9JejuJUojBn2eH5bmXEFIRnsTDIrOJ9W5khSy5jYegwH
	qhSW062gGm0f2pCjLLqMv9JKbdXgSAUu/YcvGDMztjHqKRwRVO+dbxlOtGJsf9RMlvzGBY
	YtYUSd/fq29/y8GH9zG2xr2vybOoGAA=
X-MC-Unique: QNeMx1XPOEuZZ0RLGEs1Tg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG5gvOFpZMjlxo4x6POQe9C/Frz0vn+RcGL6tVWkJQqmQYiwXeKydb5tF1aVO5XL9Duj/9nYNvojz1rYEu4ym4AH6ORw+MbeyfF94DkkTRb56fTG0gPw6W+SFpq18spA/O6Ci+LHtJwDBpSq8NRh2kqrydef/KWAyprS09OoFbupiG8slW9l1QYAHTGTglClG15YzjQTSASkLKAP1NJa5LWILAy+7gSSxkIzwyeO9tVB9OPTFlwG/RIfygmztwZ1DyrA5+Iq1S9PpTbHlJKHt1W+NmRVg5e/2H7474IbQEAaQOWs+UIHKNy2eQP3xfabov/TlGc6eIwt87bm4Iacvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9Kh+thLpiBTnf/Qnbgg3blH8jli1hgBYOr7EBkBOLg=;
 b=BohjzPvrCzbZ3pi/QEY+qTJzFXs/EwmxIOdUIDoOpBL1uHIDV6i2ldA8dE7ZG18v2YlRzVlNea4HIs4p7HRieAq4dE/8KlRTlXEabYNyTs+P60odvo7ToO1axip4n3qtLWVcATf0N+Y/hEXx4N+RIMD621hKsuQ75toUXYEwA41Fp9N8jmg5UJAmAkav3a7rq9UDX8kfrvXAvdmFC07sLdbNwSALKvxKywI9+euRZ0Le4B4+YByd0tqPsI4XYvifGsnq//lypjKxMzcjBgT9tDXowsTfOaPTkBtg3TwO70P4U1R41lqWPb8PCyDlSlxBf4FoGbcG0IMKnvyGS6xOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e16c1767-0e3b-4bac-b07d-05fe6944ae5f@suse.com>
Date: Thu, 18 Nov 2021 10:06:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] x86/ioapic: Drop function pointers from
 __ioapic_{read,write}_entry()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-6-andrew.cooper3@citrix.com>
 <e220b6f2-3cb9-e7b0-6b74-4b266e4e7fb6@suse.com>
 <6935bdd8-6b4a-80f6-d134-768dc0d37abe@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6935bdd8-6b4a-80f6-d134-768dc0d37abe@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0346.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e1201c-acd0-444e-7482-08d9aa72b1c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176A8330890EB42C023C716B39B9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nlwKk/VNf9PB6yo/9clMtTfy10m6NH1zg+/8p/pqGL2z3T8Ojsj4Axb3uBMxochtDog4JkQLs7XN1v2qmSkNe5/HLHlCdhbthHjHUJhJPYsL3tZ7afcrCq9rGaDEK6FHXUswF+G/SmnreBmImzlKs8dVHWAOveXXGpVgKn5umP5UwAboEEuK7FAUdH5FSOXdwMN2sF/4ky0qw3tZMX28oQvz8H22xVNQ+BO3e4VKLEYDCq+OZSnItj8spZiHxEjXuzCJKeFXVeqGe3lFD/Q8fuJpcgTzF8U4pR3NnQKleyii7zDGUJnKurfzFZiQQMZsvp8bokfYRTsdyKXzRKRAdMuJVS7NqeYcu2Mw2M6hNgjnd9+mcK/yE3j41Z6Px6KJf0gB8rzuWdP3ktZUwK51+1lqUaeyUmke28FpBE5cqgRM/g6yAZ+5UY3+kGBZUJjov+OHPd6OKq83vJjmXyxWmz5kCs8ms5ibc+TzNjS4okM6321lmD9E7OGPspT/0uKt8oHKCg1Mad/lEAcGLS24ebV49eRPvK0i2tQO0Zl1cbrGMjHn9XaBTDlf/sPGhOWoK/1CBQvikcci41IAZpOF7JeHancy0DV0W5sfsBOSsped8c87AR6zciyLxrUPWCu3s88QXmouNS37VDDkLlsIi6/rqJEu29qVihuUZwzh7Y5CpFs+7QHMU3rP7AioAYqHaYlKQov7RtpPIQH5y+Re0tGBCGLep510tll+ZtIpFfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(110136005)(54906003)(66476007)(66556008)(186003)(16576012)(66946007)(86362001)(4326008)(316002)(6486002)(53546011)(5660300002)(26005)(38100700002)(956004)(508600001)(31686004)(2616005)(83380400001)(8936002)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xc+uGhWNOXQmpwrhnoUxYjEOEL3iUUceKbN2/iGjhMCnFi5o/z3/ON6bEv1E?=
 =?us-ascii?Q?W2u39Ay5zsjrl2JXtBHwNeV6//PqRV5QVXCfNIDXTyArQ9wM5vzFF1wKFqTs?=
 =?us-ascii?Q?p2rh9bgmBFsiSissLWYzaMz9ekwf3m0vHB1CjwDIA+SSvmWFM9a+J5Gd7a2m?=
 =?us-ascii?Q?keSaOLNJlst0B9/P9JnlTXbQv8LkBgcaUh0s7zUvaAuyT/SkaPMnXb6sIHfK?=
 =?us-ascii?Q?INjy0iHwWZwno8AdLkMxkgQ1igFm41a4SbP+UxaOOhh+gMTkj2ThmNouth5c?=
 =?us-ascii?Q?cIj9TvzWMiV2kLfjGXsl/cOu2NYoF/yWKETcu5YD7OoiJkCoN/n6Y52mZrba?=
 =?us-ascii?Q?OsQD2Cbv3kySYQ0+f61a6x3GkwJ0JzXEk57DB0WWcF9Lp+6TFh/QEAmqdcto?=
 =?us-ascii?Q?JBNZBmHB502JK7RIhYAGJNyHo37L4+rQ5xIOSrNMgO6ervjBbz2XBMT5FDtI?=
 =?us-ascii?Q?Pb628u+HpvBnduMeOuWx4j555lTcTbzp5IE8sjmyk6rZSd4wul5VyBHrFvei?=
 =?us-ascii?Q?liQ9jmNIOkop5quZbglDFM7xec26A2RH2V3Cb3EHWOJx27PO9RQ8u8OaGDom?=
 =?us-ascii?Q?3jzv/TBQIh2UAsZHCgWGjShMARPgVooBn+N7PdSmaF9VMvWj0QjnAylosEB8?=
 =?us-ascii?Q?7JDpOOFKLRJjcPXPWDQjHqa0/rdgIDLpADoIyxUQAXOLnI20SbqH1ZI6hf5k?=
 =?us-ascii?Q?NKoszo0r0D2qHrZIk29cHBCo677EIBAsS/j0uKp0KhLth2aUYqij1xgk2aQr?=
 =?us-ascii?Q?bwJjb8rGfwo1Qb5PoNVXyDO8vdpEp5lGxkmeOrzjl3mXxDaNXFCwP3prRq9q?=
 =?us-ascii?Q?z3Pql7wwTz0/k4WPY/v2f5DXy9kvvrjodw2v52wpH8h0Pw2DyBhAD18bQZir?=
 =?us-ascii?Q?Gzff8b72wysuzIChJQMap0yOPdpdpmwiQQj5fd6AWUAuH7VazZ7kBcs7sGWJ?=
 =?us-ascii?Q?cNYPc16LQwZf1CPp1W6g87/j1qS8aJ3RuIPYrepZWWJjbQvZnsKjNB2N9X7j?=
 =?us-ascii?Q?R3y/kG2Dy/yKRVQw2g0HYdOdihSNCEaVpAx0gGnB3Qxj+ZGM4mvAtVGQvw3l?=
 =?us-ascii?Q?iVZ2swca9DcnKwtJeAVhyAtXvqH97IpZuTxwd6ziBq+eDreuWVGT3Rj0oAJ5?=
 =?us-ascii?Q?xEXHc5cs21yk2cNck09o8bYegHVxXpwJQVjhn1UbvlhsVicmOv8p8f5ynIk/?=
 =?us-ascii?Q?k75fCik+FMh8D9ywkXU8vbTkXka2nY3zXWj9m6Sbl6NMYauETrlbHpSUxZob?=
 =?us-ascii?Q?lSNVSJxZ6E1KcM20k/EDFpRwu7QmawPcAg3ev0LXFbhWgDy3bPaBEnzlP/ul?=
 =?us-ascii?Q?ObIyMK9+uuHggurFtWrj2nSGLwYvHHsB9sin8KKr45KKLWkgG2Wvvu1e5lHb?=
 =?us-ascii?Q?n+3tk9D73IoKvn6XEYxnuf/YxB1cnX4X3e9LBv1V4ACY1ENHZjtfGvd6hE6I?=
 =?us-ascii?Q?41Do79i8z//6s6s6bPdOdmcDXC3yvVnSpRoHk66E8V5guB0ZlG5vD8G1R2Fx?=
 =?us-ascii?Q?K40KGb74GIta/7+eFSMt7oTl3iMavzMNZWhuIz0iUTsYYpcZ6A5CaxR1yGC6?=
 =?us-ascii?Q?bq5pbY+PU4nIvHuDOpOaxzooIftsWnF4h6f0/mb0LDUUCoYuCtRWFzyg3AdY?=
 =?us-ascii?Q?m2spPHRmnP1TnFnbJXfIGJ8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e1201c-acd0-444e-7482-08d9aa72b1c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:06:23.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyNdFLXxbj+2VLjlJQEXQlJDdiCZv3vAWtsapRBm03MxD47hIdktKbThc2GS8tr2XCv/J3vTsBL+l1HYFAbIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 18.11.2021 01:32, Andrew Cooper wrote:
> On 12/11/2021 10:43, Jan Beulich wrote:
>> On 11.11.2021 18:57, Andrew Cooper wrote:
>>> Function pointers are expensive, and the raw parameter is a constant fr=
om all
>>> callers, meaning that it predicts very well with local branch history.
>> The code change is fine, but I'm having trouble with "all" here: Both
>> functions aren't even static, so while callers in io_apic.c may
>> benefit (perhaps with the exception of ioapic_{read,write}_entry(),
>> depending on whether the compiler views inlining them as warranted),
>> I'm in no way convinced this extends to the callers in VT-d code.
>>
>> Further ISTR clang being quite a bit less aggressive about inlining,
>> so the effects might not be quite as good there even for the call
>> sites in io_apic.c.
>>
>> Can you clarify this for me please?
>=20
> The way the compiler lays out the code is unrelated to why this form is=20
> an improvement.
>=20
> Branch history is a function of "the $N most recently taken branches".=C2=
=A0=20
> This is because "how you got here" is typically relevant to "where you=20
> should go next".
>=20
> Trivial schemes maintain a shift register of taken / not-taken results.=
=C2=A0=20
> Less trivial schemes maintain a rolling hash of (src addr, dst addr)=20
> tuples of all taken branches (direct and indirect).=C2=A0 In both cases, =
the=20
> instantaneous branch history is an input into the final prediction, and=20
> is commonly used to select which saturating counter (or bank of=20
> counters) is used.
>=20
> Consider something like
>=20
> while ( cond )
> {
>  =C2=A0=C2=A0=C2=A0 memcpy(dst1, src1, 64);
>  =C2=A0=C2=A0=C2=A0 memcpy(dst2, src2, 7);
> }
>=20
> Here, the conditional jump inside memcpy() coping with the tail of the=20
> copy flips result 50% of the time, which is fiendish to predict for.
>=20
> However, because the branch history differs (by memcpy()'s return=20
> address which was accumulated by the call instruction), the predictor=20
> can actually use two different taken/not-taken counters for the two=20
> different "instances" if the tail jump.=C2=A0 After a few iterations to w=
arm=20
> up, the predictor will get every jump perfect despite the fact that=20
> memcpy() is a library call and the branches would otherwise alias.
>=20
>=20
> Bringing it back to the code in question.=C2=A0 The "raw" parameter is an=
=20
> explicit true or false at the top of all call paths leading into these=20
> functions.=C2=A0 Therefore, an individual branch history has a high=20
> correlation with said true or false, irrespective of the absolute code=20
> layout.=C2=A0 As a consequence, the correct result of the prediction is=20
> highly correlated with the branch history, and it will predict=20
> perfectly[1] after a few times the path has been used.

Thanks a lot for the explanation. May I suggest to make this less
ambiguous in the description, e.g. by saying "the raw parameter is a
constant at the root of all call trees"?

Jan


