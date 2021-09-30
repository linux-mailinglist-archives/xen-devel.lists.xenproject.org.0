Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9241D70E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199696.353911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVstX-0006jl-C0; Thu, 30 Sep 2021 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199696.353911; Thu, 30 Sep 2021 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVstX-0006hB-8A; Thu, 30 Sep 2021 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 199696;
 Thu, 30 Sep 2021 10:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVstV-0006h5-1Z
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:02:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d11b6d-2b35-45d2-ae67-175a0499d76a;
 Thu, 30 Sep 2021 10:02:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-5KlF8yv8NpaL79WgfeLpHw-1; Thu, 30 Sep 2021 12:02:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 10:02:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 10:02:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10 via Frontend Transport; Thu, 30 Sep 2021 10:02:19 +0000
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
X-Inumbo-ID: 69d11b6d-2b35-45d2-ae67-175a0499d76a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632996143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UjD7HxCfcb4pbywXa2JcJ2B7izfbj4CYQEkWazOF0kc=;
	b=d5eUPMut/mTQHVliV9thbJsKRiPrsE/AIN0je9eU2TqqzbmisM+yuMfeJToNCbM+auMBj/
	W0T/kuTHIhaaQonZc3xKsQlBz9mvU0RUQt39zMOtxYiSKLhP2Wny1gazUrMobsdn8MElxU
	N7sGFDnR9TN/lKwNjy5GVVIu+dxnVPs=
X-MC-Unique: 5KlF8yv8NpaL79WgfeLpHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTxULLFYfRsnAvrvBXSGQGZtJoBLb3JA+t/fvFjf/TgiM2ugxK1zTr3icFtufi/jNpcuKj3e42fAHljhJVvrL2W+Tr9JaEge36Os4VC0BUIGiM3QwH8TNDsTVmRS2kqwHhTPO/YlyYK5CbTyTaaQOnMBxElw3oNwZBx1EqtscNxLBOyIw1wUZe63+DmiLdEbZ9DThAqJcz7Bk9tsiAcKKo7apZm33UrlDO3/bac1+Hb7aECjxvbLrwg35dUnvsUkrGE61ChveB1VfJwbVKOhgl0TPyx/pufKkfoyiFfCcanSQMC0q4z2izU2J+UPiUWT29LipIlfhZCFJdtQtMsIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UjD7HxCfcb4pbywXa2JcJ2B7izfbj4CYQEkWazOF0kc=;
 b=kJf9r6Vlaya/SlARVC3rk+ZNMY/sYlyhmFxqHUJ+V88HhH+2xe3T/l+HKFdiZciI+IlrAjsAohlo/4usbWZLsisMUA3oFNpazhk8QaIa+uNOo1cSw5EyLJr62Jji5pRzfD4QBuXnxpJSMPx2FfDuDcT8eEy4vvl4KPuYZeQ8xuAhB1YHEFOuiPEifmqR6Q3IzQopZ6YnvUS5ZDB7NgBHvBGXsJLa8K7H1inEAX2qPHsXAOkKCrlYwoPY0AChr9bII92c7nCLYsZcxwLJrYeBt9Pt9DiwStulZ2ad3oee1/oKeIUIsQpJ/JQGnnUslZyqxF1Or7dfU3cDCXtw8I7hcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: x86/mm lock order enforcement
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <47986e72-5794-7679-1cd9-2e05cf71bbca@suse.com>
Date: Thu, 30 Sep 2021 12:02:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05ee0b57-b82d-419c-7ab9-08d983f9641d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150B5ACB6B073B291A738CFB3AA9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCq4jPscxa4YPS7ZcX5VeYme3Ts0R/BByUP23qFRX5qhIDOkenBbx1AcwpWi9GZAay/YAJuJ/AXaW4iVAMaXlaeAgHLD3XAfQjEEWDT/mO4mXmX/ktDmJ3JuqZxaXqDyB4gN09lp2a+58M9zzDm3vT8lDf3FPeB6xuq62OgImNBKFTzyaHkwaND7kidAiYzNmVyyUGkLVVPvWhrklLTWQXeiLZVLcWlecitB4k2MNLrLpU5emKsJ/70XES+sDWmKwGBdp1AbrXr2mJraC/GqokLcuOVt14+8jv35ZMBlaqO3XT0wWu732Bol4gQ1nvltSbDqOVlU6k1vsnIbE7pku4CKAsrQ/vUCOFf1SKIwcOPxsyRo6Vsvc/UwJEL4W3D9AvUcFmSzF3TGebOV9zUYcrMvGEDZGxEzo26Ey+OPn0N+EloHRumCFqi6BBmeGfE1mByncVH1X1NZ7snmRh3VVeSW+rJavFmPiym+hS5klJCDvaxRq4IuixOZPO5VVY0V1B7DVyc8UG5sEgNJR+sCp/nRXpKZhyVMNxKAakQP0N0GFTaD3JrZnJXI9XUQUTchaSZ73k2ukJMaCbus3DXI5pbDhJj0OB/ewVFM/pLQiBmpPffeiqEpXOfGSND/BFIwc/jKRBuykrcgcx26Swtb3znibHs1utLeHJYtTQ2g+9FxXGm1NtV4byQ5ewn9y5fIFA6JoYKn3SgwJXYmZj986nv5pT+P6wddpKaP+XPJZJAxq62hFogoNV2DUswT6knYtaB/fclObrZ+PfzBSQ3qoT/UWmQ2AU7jeMYXEE1mhl4Xr1T0FRViT5twlgsKviw+28SpNaWU4gRH21XCPviHORFl4x+W5oXz60Ishttp0Lc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2616005)(86362001)(508600001)(966005)(36756003)(31696002)(4326008)(956004)(8936002)(38100700002)(5660300002)(31686004)(16576012)(316002)(8676002)(83380400001)(2906002)(6486002)(66556008)(186003)(66946007)(26005)(54906003)(66476007)(87944003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RG0RRLceMD2FFD94JzHY1l68ifAVXK2R/fkMAybSgO/MNk/rHyBUU6pGOvUQyPtqTJhXhDd4F0AshQ3t138f1wuE/1Zz8FuLWhG+NPt/nLjnbbcky5mvkmALR3LtPxnUmKkq1K/onNFE0liYq6tJ7ta+fSqaFvLpOwfl6tvUoq5a+bT/n60ER+IxFdpphy3IK3liIUFWeu3PcViHVIYN0eFq/YelxMoPupauooRpRruezgnBatXVk4WRy7qgXO8WIYpFBkSxO8gjr0A89qmXieJtzodtgY3sTgTAzLN3Be5TxkVAWuOMK51LFR+5i8xE3t1jLiYCu17L+G5K+gJEZBb16AAdgJDfaA3JWU5HM6CRWxzF9P2ET8FZGyHbWaGgZ2e/qy0fafbLI0zzSdDfhKkQc1xIUyn7JtoqcoawKu/PuJsd4sMTL/JkzSVs45wW/nGnqujKJZHjwPJW7hxglUllBuGoLHdZtw1Esyf5rQuwahWaxYcLm0AokEE7W/ugMuGruN3KSZ0wxCX+1CNCK60aKNai+8V72JQtwFKlMOQ3Upflske5bxdM1IBYd+w2zuBFj+Jb8TK/cd61/47fmMUbT3XJ+0RJucDCZ9dxbQBiv440MUUU3SHkcWpgNLDkl+6nkiyw121ekeih4p6/olTPS45ehmtmOc+8oNpjAQZOLxvLObCU5O9pDT3JeQ7dEqKv+FB2tMf/y1z5zM3TtgKcKxlYOXmDTT0K/Ef6XVbDkBdCgsogPGUO/sQX8jic
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ee0b57-b82d-419c-7ab9-08d983f9641d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:02:20.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rT6AoVnhAhYviApWluqQ2ISDJUNVH8sBFDp0reL+SQpBp9uTCJ8T0nMEbXlXYnws77eJKGKFvh6W0HZB1eedLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

Hello,

the issue pointed out in [1] (and hence the proposed fix in a reply) is
actually pointing out a bigger problem, addressing of which may also
invalidate that proposed fix.

First, fundamentally any code path reaching p2m_pt_set_entry() (i.e. in
particular any caller of p2m_set_entry()) is liable to hit the same
lock order violation if it holds _any_ of the locks numbered higher than
the p2m one in mm-locks.h, due to write_p2m_entry()'s call to
p2m_flush_nestedp2m().

Similarly I think ept_set_entry() -> ept_sync_domain() ->
ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.

But what's imo worse - there's no enforcement (and afaics not even a
rule written down) when it comes to the many p2m locks associated with
a single domain: The host p2m has one, and every altp2m as well as every
nested p2m have one, too. _check_lock_level() only checks whether the
already held lock has a strictly lower number in the scheme, so all of
these p2m locks are only put in just two separate groups, the members of
which are then all equal right now. The two groups are altp2m (all the
altp2m locks) and the rest (host p2m and all nested p2ms). Within a
group the various locks can be freely acquired in any order without the
resulting issue getting pointed out.

A similar issue looks to have been recognized for mem-sharing's per-
page locking: These also all fall into a single group. share_pages()
has special logic to guarantee uniform order of acquires. (I don't
think the comment in mm-locks.h is quite right there, though: "We
enforce order here against the p2m lock, which is taken after the
page_lock to change the gfn's p2m entry." To me this contradicts both
the code in share_pages() and the numbering in the scheme.)

A first step here might be to have _check_lock_level() consider not
only the level, but also the involved lock. Since recursive acquires
are frequently intended, the two involved levels being equal would
only be permitted if it is the same lock that gets used.

Otoh it may be somehow implicit that all of the altp2m and similarly
all of the nested p2m locks may not nest with one another, in which
case it might be good enough to separate the nested p2m ones from the
host p2m one (just like the altp2m ones have their own group). If so,
I'm afraid I would see no way for myself to determine where in the
numbering scheme they should be placed - them currently sharing
position with the host p2m lock suggests that any lock numbered
higher may already get acquired somewhere with a nested p2m lock held.
Yet to address the original report they would need to go above of at
least the PoD lock.

Thoughts anyone?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-09/msg02231.html


