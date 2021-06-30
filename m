Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6D3B7D95
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 08:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148132.273663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyU0E-0007os-Sf; Wed, 30 Jun 2021 06:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148132.273663; Wed, 30 Jun 2021 06:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyU0E-0007n2-PE; Wed, 30 Jun 2021 06:47:18 +0000
Received: by outflank-mailman (input) for mailman id 148132;
 Wed, 30 Jun 2021 06:47:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyU0C-0007mw-Tn
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 06:47:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc99b50b-3160-499b-8827-d36695b7f287;
 Wed, 30 Jun 2021 06:47:16 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-QyE7b3CcPEuKKLdhVz9xWQ-1; Wed, 30 Jun 2021 08:47:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 06:47:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 06:47:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Wed, 30 Jun 2021 06:47:11 +0000
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
X-Inumbo-ID: bc99b50b-3160-499b-8827-d36695b7f287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625035635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lirN/Fyn7nOihsEVU+pGPhqLTCx1O9LAWzSTLgYYGbI=;
	b=T+bZChhkda3jr1h8K/z0NBpNqCyj7felRl6apQvLexJ2sWiiRwzHh+Gpfp3OSSAoF5aRYf
	QdWZIq1W6zs/zbmq+36eeYF0wT6WuwjFgI4ow0uCP5bBUVnmVL7dehUyVXfd5SoRZZ0+8u
	2Ve1rpQoAJVM4qI9rGzmHKaQyOqIVww=
X-MC-Unique: QyE7b3CcPEuKKLdhVz9xWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg1TASnbXwEDOeP7c5K7z8A6G2/kjfjBhCG3wyPLtWBkn55KEAUfy+f13Cf5JnSNxZRmgXmRgt+SfQmtJXRwVrrDH/imD/PxYfcfwK4/sbA1jmmkz/+DMf6qe3FO4Hd/e/VpnbCYFJ/pA4Lz/AeETv302ngPgjt8U3js7/pTmeDbv5OV9CviDuuGq1v22wyiqaGNuXWByOlf6wLRxjSRDlrIM/N7nDeYWzhPkCbMG77bg6gMmpQFTpPPfWASIcxQmt8u67q5N34k3ka/X7nUwRSrS5Z6M9iF9T23wP3/Xfxf7FZAa/oJtMl8YTW377f5+i6gkO2Eh+5NJnwp972XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLwd1wlSUaqk94eww1pmuux6R3MK0OD5v99tOaIyXNs=;
 b=Kivi4BT2WlA+GbVWr+d3whTObIKLA7lqezP04nerpT3qsL2ME7yxmSE5zhd+mopFo44xyE5rvyL9Cu+lcWv/wKnB668Sn3F9tS4fFnmdEfi81XLQAwnM0kxyDY/r3NQh6jiSkkF+cWy78HBoleRXUKSbWS68+syeMMiglICjTxyihqD8vQaY+AE0VXcloSc1bhI8OVEBrUd5FtqhfPsoqX9i5i6KhEEJOnqE4LrzTLyHXNbkntprE4UZybhV5/V3F4iIYga2sPe3UvP6z5rE+f3WgmY9+SzbiCEKMnK23Jqv3VQ/wlxnXZ3CEzx4At7+g+0pEHKCi3aiEpxApBz2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH] x86: mark hypercall argument regs clobbering for
 intended fall-through
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdbd506a-e6fc-a560-1be7-7424f33d413e@suse.com>
 <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <485b066e-d57e-a966-4ca5-734da4973be2@suse.com>
Date: Wed, 30 Jun 2021 08:47:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59eff27e-c1de-4051-3e96-08d93b92e3a6
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27021707E39F359D99347E78B3019@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aP84Zw4RT4tUfjwZS/Wyx2fWY/fvaHcZSaJh5+XqKmMM0rAy1fsri21u9hBkDkFXuW8ZvQhb6MHeokIhcXE9PPixvJw5pN+kcbN3kTDvPmDXmX0fI0YJ8KGCRsuPCupsQSj6WXOSfRLDHhjGCPtvsWMwgsjxkh7Doq55uOeMwSgd8B/bX69OOL4f5PftnfioHbiEKgxkFfkAlnIwTsFabMlFe9gLKoI9/zWRkiMHRpAdkC5iHYI+tBD2xW5o58FxnyBdvs20bmquyhPf8lpvZugVKMSFbIXMvVd3LUy5jVcbiMlL2jeXt21FrN5O/z7KduNWlt1+biWrXlReZZ4bPbmU9OE+uQkjmOS4P6HcQv1yBD8N981gQZ/Fw/emZ4g4fqz4OO1CYflJ34WquHJTB0pjv3PUqvD6USMnknR5bjleqc7D2tGsLXa6u2dCjTq85N3YneSAGFRSuYzqXa0hQYgpbx4fb2gf19Xp4wagk/IRenzDjSLhnTayB7vz9cWDwBhqxnwe7f86lqkVRQ/6ffjQ/A3biKTtkksCt/AkcW9MUbg1buby7IJ3XX1F2oN45cJpaLqB8cHOegNUqUSpto4AuaqewcwsJBCcjBDkqv4/eq8/BGoZ1Q0dEprqfXzFPAA6+JWIS756IBeDMKIzZwf8uca394t3dWGCeUJCoC8MrBtXgJPBBrWu0kpRnILWB/KDc2DbhYU1IRKIDcwx2IefDV0ZGV+Y/dhH9gqFjX5B2ERu54G2ZhEHA5Jj9vtH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(39850400004)(346002)(366004)(86362001)(26005)(16576012)(83380400001)(31696002)(54906003)(38100700002)(316002)(6486002)(4326008)(2616005)(31686004)(478600001)(66946007)(956004)(8936002)(5660300002)(53546011)(66556008)(66476007)(6916009)(16526019)(2906002)(186003)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jInFlj73xRMuGJAL0nOrjqW5VdUe1AujwQqiXy0uIQb5LYyd0Bt7RPJYgvw/?=
 =?us-ascii?Q?3Eky52e/67o9FsZ9Cby/GEX5TEw0ljNCC7UtkaWwwOdVGJhMs3rHV2ncIvvy?=
 =?us-ascii?Q?sWl9bEC/k6ijdLKCd3O7pgOHjZ8O/VNO8K7OKED8Nw7rItnIywK2u2EnT7Ac?=
 =?us-ascii?Q?xwDsBcgaKWxHWuDcVCdzRJhF8vgWFaY+6UGTW//HhzhgCgF+8XaULt6NGRwi?=
 =?us-ascii?Q?Sxt3XV5UdJ2N1ZhtjFT88u4v70gry7s8MinLmR2IvQr/eLKZX8cp0NTmT8Qw?=
 =?us-ascii?Q?sn36TWfNppCSlVr97EUYI1xkZRypN+n1b2aKoE+gY+yAlZptaiRnJ9HaVIYH?=
 =?us-ascii?Q?p3xdzt23rHaygOXvZ9wNRYA8jXy+4V4Ha7TK5zy82AMtkCDJTuPoQCJrYDic?=
 =?us-ascii?Q?Im8MjZ/E5jNzL+GmXvPV1OP8NSObykVwFC+f1qcui8u80HNjRIMwDqfO+jSR?=
 =?us-ascii?Q?Ra9aVVJ0D5EBvLJYIEA2s4K6XT0aQXvqZiF6SGW/ytlHxk94G22rKJ0xERB5?=
 =?us-ascii?Q?f1wlo6dm85FzRspNDyL2gtUeY1FurVNwuCS19etEc5NOGhAw2W6KZnPJX91B?=
 =?us-ascii?Q?Jf0YcA2dq15YPtvfucTroHO4ljJ7x1j3XRzWq38WJEXDfsz9zyaV7maJjM0L?=
 =?us-ascii?Q?El0/cf2zArKGnMYsPYKmBW33sEsiz1KBXpJk4Gof6BhJRLrVbzbHIc1bVV0d?=
 =?us-ascii?Q?TfDGSM9ctbWrPtKz+ZziOzfgb7zL50jyCXjNF3K8OXFcsnmDvI6SYtx2sF35?=
 =?us-ascii?Q?LbE198/MR/jFHWEalJMioeDRG77PO+SAz8KVkXTPt7p/rHXffQ6yWhcSsGNQ?=
 =?us-ascii?Q?KiVUZs2B6+OdXqchMfS1SXhI385Bs2twNKPKM1+kKxHMsHfKIFwLVHytRDXl?=
 =?us-ascii?Q?3IZIKpDoNSUQj35s6vkGYZGQwNF17YgK6V54C7cRc9XyZYOu1yAlbw8i3a49?=
 =?us-ascii?Q?2PyfH5k1d5uDx4As65MIgpkMKBbopSKi2Ag+rBvwq6SpN6PgvZohifb+vUUL?=
 =?us-ascii?Q?CmzLveTKIw5al2QO0OdgZPRGGClpvGUr6AzlSUB9b9IEng0J/LJJBTI5nfvU?=
 =?us-ascii?Q?bCMFF/UetihtMsAuuMHESXKQJgDI6Bj8ZkdG5hHF5sVIHiFnaMF+iIVntEI8?=
 =?us-ascii?Q?wI9+owYOei9w2Hto70tvLmKi8EfAZJmeLs2xuTAPNrIwfVKga8aeJS3FhPQT?=
 =?us-ascii?Q?PLUqkejcwcNAIkwXBzTBDx19NaOo+tkKpvyDCKd5W8ms3plAyWgznryRmm+u?=
 =?us-ascii?Q?j6EFzf97+Sg36xJKdOkKsPk9GR3Yljjw0jwLT/3KqY1ytwzc+lZ7VI+R/KoK?=
 =?us-ascii?Q?LjWnFRkIrv1Kpuah876llYpR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59eff27e-c1de-4051-3e96-08d93b92e3a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 06:47:12.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPShgnxD57NgXhGdPmRnCVQuaw1srp8NjQIFgvJk9WCajHNjx4L5XKV7+tWgxAkAMLmUjFB/bDmtd6dSrHLuEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 09.06.2021 14:49, Andrew Cooper wrote:
> On 09/06/2021 11:34, Jan Beulich wrote:
>> The CIDs below are all for the PV side of things, but also take care of
>> the HVM side.
>>
>> Coverity-ID: 1485896, 1485901, 1485906, 1485910, 1485911,=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Let's see whether Coverity actually understands the (relatively) new
>> pseudo-keyword.
>=20
> This is exceedingly disappointing.=C2=A0 Coverity used to have the only
> sensible rule for not causing spurious fallthrough warnings, but this
> has apparently regressed.
>=20
> Coverity works on the AST, so ought to be after GCC has interpreted
> __attribute__((__fallthrough__)) if applicable.
>=20
> However, I doubt it will work in the fallback case, because #define
> fallthrough looks dubious.=C2=A0 To trigger the older logic, the /*
> fallthrough */ comment needs to be the final thing before the next case
> label, and it isn't with the added semicolon.
>=20
> Given that this pseudo-keyword is restricted to the SMMU driver for now,
> we don't actually know if Coverity likes it or not.

My reply from the 9th had no further reaction, so let me ask more
directly: Besides leaving the Coverity issues open, what alternatives
do you see? IOW I'm missing from your reply any indication what it
would rework of the patch you want me to do, if any. Or if none, what
it is that stands in the way of getting this change in.

Jan


