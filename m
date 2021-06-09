Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072B3A1540
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 15:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139353.257711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxjz-0007Hm-AF; Wed, 09 Jun 2021 12:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139353.257711; Wed, 09 Jun 2021 12:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxjz-0007F1-6v; Wed, 09 Jun 2021 12:55:27 +0000
Received: by outflank-mailman (input) for mailman id 139353;
 Wed, 09 Jun 2021 12:55:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqxjx-0007Ev-PT
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:55:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b69c10c-d5b4-4f42-9906-fa84a30d1c82;
 Wed, 09 Jun 2021 12:55:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-L5tsVD-BM6WnaEzkI0BWyw-2; Wed, 09 Jun 2021 14:55:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 12:55:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 12:55:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Wed, 9 Jun 2021 12:55:19 +0000
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
X-Inumbo-ID: 3b69c10c-d5b4-4f42-9906-fa84a30d1c82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623243323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmHvrMpkte4ytLDshOAZXNuIdB2Pqg6y97Gg+VlDV0o=;
	b=DYotaHlb4Y0DBJR2kfgXH9HymLF5/3/GLk1nlekTLwuDoBesRYYc+FeRbge/rgbjyTiH8r
	J4fFkU8fKks7vbrMvxucsSCBzxmnafn09A3HkTTequAplsXbGGvaJl2qHsSQ0lYO7zEpAY
	Ey2Xy5+w3ZjM4nNBta8m3vN+BHDsAsk=
X-MC-Unique: L5tsVD-BM6WnaEzkI0BWyw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCBxBi4JoCt3rhBetzur0EySKgMqU5HuXJMzgHP1q7RLKJE8CWC8gOxmdjr0el4WFGHMiu/5wbsD5IM2lVrE4juAzozBAe8/nH9CmRHsjLvC4hQfq86TfRKsYWvigJkOAdeZ/IaJ4aXjuPNrGiM4kC8ogtkHFG4t2EhBTse3/aGugsQB5ejxYRGymF/jJPARRyTcZsher3SSDjinQjiRDpOvlNxjYHTtEoqm3/9RQ0ZZEbEoOQqYzHU7zIbItAMEwP9+LSoJ/hFDy35XpViZm2zeDu3esyphgNFc6z/7uFKba6/Tmki14p72p0TsSspsCIY9thoKUEWULymWborjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kg6luS9joI3pnts8ELKvhBCYkGIedGlOoUecLoDH3lE=;
 b=Ax4xIi+FuQkJUYc8sMeuJENOduTP5hk2Qv6FReTAVkYb0DPiA9FVDbCtPRDR+ETsibuJcdWnrDGhSsisIxfoPT6k7hDvJyDwnTt9Ac2xD7Il+XZap2c91UdkaWnW7lYRYm+ZxMOw7oSRj5Ow1kIaz5V4R+6lFOkoHTMOh6yM7a8QBzDp4KSkoLovgd7oiT7SnhqUDiiahTPN9x+zUUuhUH+oiV7kA/wBri5za1MRPsRyB1cILJo2mKpClmWVXnvmt5IozXHTJC3UDvjQvEofw12DuP9mISxmKi9TZp1/p7TJhvnEckv4a9d4arcAqGQfTqP6X2NKpcQ/d3k7HMJo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: mark hypercall argument regs clobbering for intended
 fall-through
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdbd506a-e6fc-a560-1be7-7424f33d413e@suse.com>
 <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee3a0434-c4b2-3dcb-bd26-3550b80188c4@suse.com>
Date: Wed, 9 Jun 2021 14:55:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0bb65b0-4131-4bf1-a41a-08d92b45d66e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233585AB65D828BA2576DB3FB3369@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ydo/5ZavBOpjy09fHg4JGHlJYy0+yeX/xoWKHIAo2me8jjTBXOpc/2a5iuJ5ANhzZvDvYKvZH7LjtZhWkiVVCxwP7qHL9AxuoaAkjABAMAgAZYx+LbCRBvidQ5aFAlEq7SIlMSblHuE4g+5TdRIsJhZ2rQDvVvZ+aS1AuHmkzrjT69BHjOtS6HdxeCq56ycOqJdiy/Xhbszf10Ma17+i/PimBAt155s9+fqjiC9QQxZpytn7QindlrhkZcD5ONTy7V5I+UOLVyNqXqMRVTn7NRHt0rQTIgUKuA1w59P6c8rdio6ytyCams+IENn6l6sNecDzAA6Aai6vTDoJxMuFdIFyfqXgucou3E1+42+4b5Btw6bC3S4z1ixhrF3AeWBP1VNW6U0zsXPkHmR5YZwZclyYuZvp5jd7O83NXnbQqCAmyx0VUibVBJZGTiwefALw8JUjLqM21GaRBFbOHbb2gvH5zMCoHUw8qiBpZ4y0sCL6MZuaXlABXafIcoEMO/a8Kkb64r4glDKj1iV5X98t0AfET0xof5D5GC8opzsU9izOtIodtoV8OD1KOjyPwOUZTpg3iHcCCyQQTXFUHyi2XEH3ABp81Rc42RNUiHL/ROYFF+oq/QweO1lVilVg1HJ0w5lndvsneK7jkSJ3K8iFsa2lYnfJSPqVZLAvDaxB+KcGjOpnEFQ1Q3b05VEJ0NDu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(376002)(396003)(366004)(86362001)(316002)(26005)(8936002)(66946007)(16576012)(66556008)(53546011)(5660300002)(38100700002)(66476007)(54906003)(16526019)(31696002)(186003)(2906002)(31686004)(2616005)(956004)(6916009)(6486002)(83380400001)(478600001)(8676002)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?7zi0I5vRxElRMnHUZjTMzBjvEK+wi9nhKyqtitjIxZt7WiII0b5uVLLD1MQP?=
 =?us-ascii?Q?oIGLImsZvpo81TkpYi0NsuiEW2nZHPmmhfJaGHG/TLFs7+fLxReaalX0nPTf?=
 =?us-ascii?Q?KYKezqXMWkMHpdvQbt1piCTf1W+ImsXF8A5ftfae4YqcnavVo8h1bl4uH0YZ?=
 =?us-ascii?Q?K72OMVU/HV3dx/K60EapgruLe/Z27TEf4ItDrEgnGeLb94E58mFam4A1U6mv?=
 =?us-ascii?Q?MIvNvwzY4yfvxvHMPtuVNWTbE0tkOwP8c9rSAKI8JD2wiC7Vtzk/yhRxOn/a?=
 =?us-ascii?Q?3r7iCHkngAmJMXOhDIFou9FYiK1U28NLCMc2GbfvNUroi7/wCFaQD8MjtQLh?=
 =?us-ascii?Q?HlF9iRQFpxErbqdHHOjYUFIfPgBcR06fAaWuC6UDrxYyu1t9n4n/KsTx5CT1?=
 =?us-ascii?Q?OWGIKNC6oorYY3uHX/VEdFjfFt9J9Ru9ZLT18/ID5HMcFiib8eeJriWarZri?=
 =?us-ascii?Q?WkcihCWR7aBaX4dWnYMB4DKYHHoMe/S2vzCJh8lSrb6tH13oBlK7TNAlg8vS?=
 =?us-ascii?Q?WHkPQVGetuRi8QJZG/FjCjoQGE/wV8FrD5XAEOuFPX78HHscl8bFXdq44VUY?=
 =?us-ascii?Q?ekX5BRfisZRJFXRw8J/XaIRT0WvekAzyxXYRe0p+PhQ/YjHi54hlXZGcGLms?=
 =?us-ascii?Q?j08FDiy1skR+KlJNSHCm6xtkkpnrPKmWp4POonVT16SnbBxVm5NzmEN2H4Mj?=
 =?us-ascii?Q?NJ4plDvKQUPTXm237zdZKUS0GLeD4wYbU1LO2fpCNBa/XNvkejbRmrAmiXoy?=
 =?us-ascii?Q?sfmX7aYkTAI+p0+1ZSmT4K5YU+/G2JJrDmktzF+f0EcEQFdzA2Q+3lCvhyCK?=
 =?us-ascii?Q?eUbDU20mLPMJLa5SkpZOmS6574aslTkkiw8WLPJX+XiMOvrQ3oku0k1wk6yn?=
 =?us-ascii?Q?TmYoowwVWHpPM8JJT1FV4LBiAv/mVuPg3ueNrd87OVd6xFGJ41S4pMKlY3te?=
 =?us-ascii?Q?UWWNtSXoD76imM730nVuUERRidVV2VPHXXk08sw4Bvx2iEAzpC7ZeZEK2CNk?=
 =?us-ascii?Q?RyEXk5bSruzUGQbWuyWj5YXZfwAmNO1rNVGbaLULGqT2k6yk63ebra0M7RtW?=
 =?us-ascii?Q?ywwo6dUZkakta/T29SNQG/P0uKjYZTlHYxVOrPs9KwB3aHDjhiNPxNb0AsS8?=
 =?us-ascii?Q?cb8HnFq/8zG2prSOIaJFdDnNag6gAqfJfme26eH2b7JA+qY+KW7YvP9OcG89?=
 =?us-ascii?Q?jYZXruJMNUHDaGgN+IplZB2DHN3JwfKeSU+XDoiHi6T+K9BJ5rc/nDpX7wiz?=
 =?us-ascii?Q?RUDU5U89xNUn+NHCcRYNUia8NSH9u5gmDxQyR8o0C7FP08wqpWwb4EBuzLOR?=
 =?us-ascii?Q?t5VGSR5ZPlpVP9rzq3KBOm6O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bb65b0-4131-4bf1-a41a-08d92b45d66e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:55:20.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GKdfhjxuK5wI74Cyi/LfIcsGB6+iDUeZFQmkasSs2hg49qnph0Vdv0si/+9KLcGfgmO4AXzGBudN2TwYpkgzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

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

When it was introduced, I did specifically ask whether it pleases
Coverity. I was told it would, and I had no proof to the contrary, so
I had to accept what I was told. My asking at the time was precisely
to avoid having to have two forms of annotation on every single
legitimate / intentional fall-through case.

Jan


