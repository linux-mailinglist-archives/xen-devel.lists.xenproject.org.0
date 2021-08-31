Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7193FC813
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175734.320034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3gJ-0001o0-3X; Tue, 31 Aug 2021 13:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175734.320034; Tue, 31 Aug 2021 13:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3gI-0001mG-Vv; Tue, 31 Aug 2021 13:20:02 +0000
Received: by outflank-mailman (input) for mailman id 175734;
 Tue, 31 Aug 2021 13:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3gG-0001XN-Sp
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:20:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b704680-5954-4ec9-8076-f4dfcdc86456;
 Tue, 31 Aug 2021 13:20:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-ubiRxiTHMUiZ6nkR_QlOpw-1; Tue, 31 Aug 2021 15:19:57 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7380.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 13:19:56 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:19:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 13:19:56 +0000
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
X-Inumbo-ID: 4b704680-5954-4ec9-8076-f4dfcdc86456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630415999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6V6uuT0G947Mwmi6dQgwHC5zdbhrt9/01qST5DIQKM0=;
	b=ZQ84TNwz5TIn/tVo5inY6afoUBWapNW+Mji4UVQhHbNVXnDcE2qtXIqu7OWoDEvqfHkHsF
	2qWC1rlJXrqYGZjHZa566z00gGm+2EQrbwXdQqtIefn3eYLBJykCVbmwW9Tjux8kcsSAOH
	KZ9LuP4KollDv9zkstu0bHx2pSiKQw4=
X-MC-Unique: ubiRxiTHMUiZ6nkR_QlOpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiFYqZKtNbDEWhsbZLzbyzGreY6+tAWamaqytBa+VdKvs9Y6Su+jr2DAb9MP74oANP73CHTbX0jvYJzHWZGHZ4H+cocgnWb11YdxZGwnTnXVHj9iFaE6JqfHBipqA8MuLTrbF1W2KUt9xGC19qLNiuODqB9rrSjWGWprT7imIp98aKYabBeigG6xuvKIA4U5pqfn7g7YlmeGNjlqq9YwEDFQijvNY1Q+k5ZG1DFM4OVHDM5TnJ9pJSg+4823tkKRwoM4jCTq4rPGpv3IvDE7c8tsFHCxJB4Et2GhliPac3QoicgTy2m3Sg09iQY73Aiqskn/Mdr/rng7pynYQjbXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUpDt3mfBHYyFfaBCdlU8s+kZ/hw79jnuiPV/6S+4w8=;
 b=OJelU9t0TanIfonVQ7oZkp0I9ElfTuz019ZbsNLKkfF/yr3wOVCwHIGdF5rBmoMMZd+G59T1gXb984lxeKkTKu7/C69/+LsZkH9LcLaSIqObXzFHorRAsbLYx5VQsiyrxJqhyK3eXTctsmNS/VP4rc1mbrTr8ljxQxgiW87aDFUH6baFM4LWJmb9p50jmsLCLlIWxJzqTZ9s80IIDmANpj/L/mnz13J+jK8iYatXX1iIWG0jqRZN+TCX9Eg59HZc/ddA9VbVAkbkD1aQQtO0fhLnJjukGKI4Q/FHD5oDbxt+kaZCSFxgqlsdXX6jBblRjhiGugFWP7SgqCoKKz7qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
 <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
 <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
Message-ID: <2265ca67-2a30-a858-38ba-a6343782929e@suse.com>
Date: Tue, 31 Aug 2021 15:19:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0181.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::25) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab662744-e9a7-46c4-3136-08d96c8206d7
X-MS-TrafficTypeDiagnostic: AM8PR04MB7380:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB738062175BA101B9385B5DA4B3CC9@AM8PR04MB7380.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9rSqqb6szJMDVGdJt8VtBiIh6dygFqbZ6+UPh4qAF906CFbaoQPk0r3b68ddI9SRvqVLJiAJ+9Nne/LPsDUXNJkmpzIvqev53q7DFzDudpAsa5+JBT8rEDxcbwFj91B1KLfXMlFHA5QtUD21O//IhsHCJv51au0tyBD5mE7XPz0x0Ray95GCTsPApP8uDsUFtcsex4CjzViYSEHHnNHGKSGfvJpTOgAlUQBDfUtaBFszYU3Fh+dEzUMtCno+0uUZ0fAEUL7wwbXV7In0qIeYmJn2Eh7E12Apikr8Ei9FOEQ9+hwlZKo4oBgFLgnJSae5w5hwGFUPbzcZjzyj05aQJtzLXhFPUEv4JWZqUS4w0xK/ppds3l3b5d9QuiNKDgrPyHC6xuOTV0pqisbPiZPK5qOs5xO7Bj94/REi2pR6bytFLD0+3SBsSsRqiQYtdnu4I3S9MH1QbvvyoT61ajy8ptxdOYIUnwikW1+0uck9JwqYpShiZnPWrJWDQiKi+6gYW9VmbbS1DvELzi/C3+iXwBUmoKII3DI+8+mtL1xkxxZYTJQnAO4Fcj1DQvqBv5nWl15Qgxsd/wBmT8qaqcspg6MrsBmq57mcUcsJOpZiVLOngWOSJ2Jd/u8p2WJlGBpT9xmhwEQ1Y+7uZaQFMzRUGhOLpFwqsxelUZvFNss2WsAtTIuq0ZgoreQD2Rx7rckFaHFmeHtV6R7elcStdr+zrGX++RgubBS0T+rrsSK9afk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(39860400002)(396003)(366004)(66946007)(478600001)(8676002)(6916009)(36756003)(186003)(31696002)(26005)(66476007)(66556008)(54906003)(4326008)(5660300002)(53546011)(38100700002)(16576012)(86362001)(956004)(2906002)(8936002)(6486002)(316002)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iD6QEv542NAp3dNWdXbSCwXpDr8DROcE+TmOdFJIg3XYwmel5E0j8Dg9zE3I?=
 =?us-ascii?Q?K1ARiq5Xs0eueoM8HlGQdNdYh1IZLusBCMfa4tTbLxiTPJx4tBQDs4em04Cw?=
 =?us-ascii?Q?FJc2o4t/8DmQBJ4stadPRNPbyA49RL6VCSMvSa9h8Zg0jvz4fOdEeRXrwP0c?=
 =?us-ascii?Q?wN3mhzkiolJHW5s2jrQQdKlQpr3liy4bZ75Rg3n5LMQA6DfJbP8xBIZ8iChm?=
 =?us-ascii?Q?xpRNbOpyNWa65gF22JpafvmloUqzwMLNpgK4/8F1pnnMAmY+4cfzrDdgd/87?=
 =?us-ascii?Q?TsyTEZTwkmXzh0emms96Kf81i2r1XKXZ+9z/1u09MChDEkKIPC/+9ntVDrQY?=
 =?us-ascii?Q?ANWiKX7gI5Zwu3e2KRdtvNuK1fHpETx80qrYPFrl65wRlGf9SEjA6ztZkOGc?=
 =?us-ascii?Q?Qec/pVPIH1OQYMEGHfsmjgJmB9SAQuijyEG5Oy0K3L99pfF7hM/A3/igfQUc?=
 =?us-ascii?Q?oaPFe7DhQ0hVGJJjFquoB7zsiee5VRYABVqB7U1F5rG/0TvMLZ53ulB+hNwQ?=
 =?us-ascii?Q?GIvH6fyguUDwG2tzoKHM90BDyf/3dygXptd/9XTrlini9YGAAHXvnC1sO8fe?=
 =?us-ascii?Q?R1d71IhxzIDZ+4qc9hVZwIPx3Iwv6zIoYJFwYcUwsVz8Sm5FLvYzW26yczaW?=
 =?us-ascii?Q?biTbYH7Fd1eHboNE2tHWwrDufR1s4W8XAU6RYaX7B5lcyh6M2NvP44S0soAQ?=
 =?us-ascii?Q?5iuaSnFYtu5RVGjYOXhlzBw9RgpiJwZwTVDe+ponIFwoB4HS88UYl8v8i1Rv?=
 =?us-ascii?Q?yCzrihP0OuGR2ag5jBNxlqRc6UQbtqwYrDZNiWWCLhWekZbShwmoxfGibpm6?=
 =?us-ascii?Q?mfBiZsSNQ90dX0WcBVGRjDnzWNdntOvUVJeHfBuehQLRreiqhUtAKcX4ELgN?=
 =?us-ascii?Q?XgVQzUkYzlaDF/trvt0Xxft1lF0IDWuk7HHF6f+/hyXJKAwU5ZKyYU4AjV1q?=
 =?us-ascii?Q?bYP48xYEo91TmZhaCJW02WMOrj+51MOnlxk1YhdvVkaA3QOiihctWBV5AGHX?=
 =?us-ascii?Q?1fi5L203sHRFrA7KEeulaHBgHxCKXKuBPJoX7Thxx5m/4oQykeL1KETP+GGz?=
 =?us-ascii?Q?Ed8ELhw7cIYYaIqNF1f/mqMIe3ZfUlPD5gkyv0ZmGQzAZdfK750LpAxmwHU4?=
 =?us-ascii?Q?E0YbgLTa8+7xJM7QP5rqVQOM7pFCisQSwQFtsvuuMNkmDNoV4OaDYno+LNTF?=
 =?us-ascii?Q?6WgYleT5JG4W1/dcYMugkkFNOvji07mHKvO41ofJVHuXCkRa5DK+fCUk29b/?=
 =?us-ascii?Q?gpBbgWwtDaJAsqrJr47rYvX7jnKZmNrLUjHFjuPsrlk0JMl7fLTiUA8fllIK?=
 =?us-ascii?Q?X2xAnFBwa67YDmj2OidIzCl8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab662744-e9a7-46c4-3136-08d96c8206d7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:19:56.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYrh2nzhtHgHkKAoh0bVokEdqQGM0u39HZFHzNP2YzX1odUqUOxqgXVb2JdVz3WSQC/qENtTs/QroRj1KPzrrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7380

On 31.08.2021 15:14, Jan Beulich wrote:
> On 31.08.2021 15:02, Andrew Cooper wrote:
>> On 30/08/2021 14:02, Jan Beulich wrote:
>>> One of the changes comprising the fixes for XSA-378 disallows replacing
>>> MMIO mappings by unintended (for this purpose) code paths.
>>
>> I'd drop the brackets.=C2=A0 All it does is confuse the sentence.
>>
>>>  This means we
>>> need to be more careful about the mappings put in place in this range -
>>> mappings should be created exactly once:
>>> - iommu_hwdom_init() comes first; it should avoid the first Mb,
>>> - pvh_populate_p2m() should insert identity mappings only into ranges
>>>   not populated as RAM,
>>> - pvh_setup_acpi() should again avoid the first Mb, which was already
>>>   dealt with at that point.
>>
>> This really is a mess.=C2=A0 It also seems very fragile.
>=20
> So it seems to me.
>=20
>> Why is iommu_hwdom_init() separate in the first place?=C2=A0 It only doe=
s
>> mappings up to 4G in the first place, and with this change, it is now
>> [1M-4G)
>=20
> I guess we'll want to wait for Roger to return to shed some light on
> this.
>=20
>>> @@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
>>>          nr_pages =3D PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
>>>                            d->arch.e820[i].size);
>>> =20
>>> +        /* Memory below 1MB has been dealt with by pvh_populate_p2m().=
 */
>>> +        if ( pfn < PFN_DOWN(MB(1)) )
>>> +        {
>>> +            if ( pfn + nr_pages <=3D PFN_DOWN(MB(1)) )
>>> +                continue;
>>> +
>>> +            /* This shouldn't happen, but is easy to deal with. */
>>
>> I'm not sure this comment is helpful.
>>
>> Under PVH, there is nothing special about the 1M boundary, and we can
>> reasonably have something else here or crossing the boundary.
>=20
> As long as we have this special treatment of the low Mb, the boundary
> is meaningful imo. I'd see the comment go away when the handling in
> general gets streamlined.

I should have added: And as long as Dom0's E820 map gets cloned from
the host's, which will necessarily consider the 1Mb boundary special.

Jan


