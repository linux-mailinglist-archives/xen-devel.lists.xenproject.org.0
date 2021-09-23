Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2974161F5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194446.346402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQYE-0007df-Vy; Thu, 23 Sep 2021 15:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194446.346402; Thu, 23 Sep 2021 15:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQYE-0007ba-Sn; Thu, 23 Sep 2021 15:22:18 +0000
Received: by outflank-mailman (input) for mailman id 194446;
 Thu, 23 Sep 2021 15:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTQYD-0007WT-9s
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:22:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1310704d-45fa-4451-8c65-8a8254a335f9;
 Thu, 23 Sep 2021 15:22:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-KJ7ZvzHLMkuqtin62IXlRw-1; Thu, 23 Sep 2021 17:22:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:22:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 15:22:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 15:22:09 +0000
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
X-Inumbo-ID: 1310704d-45fa-4451-8c65-8a8254a335f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632410533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7Pl3SWeBURLTZQxDHrHpm8C1w3I54d7TkktwoukbbU=;
	b=XmKY2Qt3cJFwDEldNeHx6DPFjiC+6ym7dtFtRpyIVDaGnrDxe22mB8Y0XxO+9Ayo1JDZF5
	pgd/k3jlS4zHJXOhromzYisg5qJOxJd6sRmoI4XR8+xmPwQ3K7QAeD2EZXT6E/kBMyiyJ+
	PEflQdvbM1G88bQYHDT3UQpQLZFoxf4=
X-MC-Unique: KJ7ZvzHLMkuqtin62IXlRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K61WgJnFEqxShCxcPAFIQom1g3D4L9mCeViYzeJfbxbCuOM1dmY/WnRhKW+VaVzcrWXOguCjI2Kgi5plNHzmRgM+BUu6ZqHvzePaKRbSipgmAaUyt/pdSjGve0UCxFvSZLx5MagnuODOl0i//NxlCQHOwzCrw5YeubzEQyfHpo60jhs0X7KLXP9d7AFWbbk+cFdYb7u3vTo8noRH8p/mk48f/ruILtcJLicEILSoSR95TcWmOXVuI+zvVCl9GR83OqS3HtTXJnHGg3lycoT1m3MnA2Jwsc/CrvqlW6STZP7UI3RHH5WUdoy6zHELVBEgDsr0ZqjfJHQNbg8PFSXh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=S8F5spUXCIFyMGVa/FcabhfBFjtAKXUGA3Y0aDXtnNU=;
 b=EKfctUrY1SXXDK7jHadv0VkeIkdYPOI0uHTfvLlIjNh7HgFq8dJhkl4Xu533gurSdQlrHyEXJit/SIh/3s6002edqFrmnhk81wHAThRW49iQu6BvGyZyh7PDT2KLi2HJo8ZGpQXaz6nLB8JhCaF8bh56kzr5A9SPwaH2vjBWPpbeyIaVKm7BMWWE52w5bjv10dbFDNgP3OqtWqkmtk4sCOalcIYSxmhXwHfYDlZMe9UyvmqM/U0fRbYDNRgRZyV/TlEpxMmoot3/47S8f5Ge6m/V7fLu/VSkOYxgYK4XNmYQqHOZBJaG0nsIHPGLyKrzApZgJv2CbeVYE67rBwf1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
 <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
 <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
 <YUxrE/kx8wmftVIX@MacBook-Air-de-Roger.local>
 <33abd731-7c2e-8c9b-963a-fd446a21e87a@suse.com>
 <YUyaCrdAdpnn/o0K@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <959850f7-1d06-7dee-b9fe-0d28d068b8e4@suse.com>
Date: Thu, 23 Sep 2021 17:22:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUyaCrdAdpnn/o0K@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7357a8e9-c829-4d9e-9f9e-08d97ea5e90f
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29574DF8ABB2A7E85148DD17B3A39@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VtDoDP+Dciln7mF5+2qU8w9L0uPG94m89EpKy6ZW9QrTObAkGV+4SyCTVGDH0oodhF6Y0kYNxN4LpHfUNAA1zekTUe85YQQXtoYe/nsZ23eBtNL0CdLtvUmErvS2TW4AjGYBQtOBPdVoEXKH3mFTtlmE0yeo27vYNUPeRM4gGfBplaZ/m7+cm5kUZI18jBXmaUl10mzDI8rXQSTyoTt6KQyok0MTYsKfLyOzlTChUM87vrIxLhnVCweS99p9RVCRi6MsA90elHKeq2QqmOby94c+UUsslIvJX9bwSXJUzNhvdSKB85XAq9GZnrRgYLLnwW4ona5SmG37NmM9LcYEwbnRtZMG4wxJ9s7A62EQqfkh/o8jw09N9Nt0vKL4PNmxKT5XZhOj8o26rylbWldUErYvpC0fLy6+IQgKEBK5iT76A0Zh/sFDH5s1vhvAGHEc8261gHTUxUYP/a7E2I83/FVEz0HGEZUY3TP04HDLDrUsNWVytD054VRKDvVWR5IFLtYvFKY4moaNmGLLJIM6gtyoxhp08U6uvQ6WBnGB1qY+a4luNFaGiOLpF+sd1M9FY/Tz+Kr/89yDsbJOuFePYHYtkg5vS+FV/IkPdODFLKKx7zBXME7Cz4t0BB21+aLZcfgQ0tHLL9Y7e+aSdnndAobOclagptfN+VTK7aEhlZCvHSPHz5wr3b6wxeY3Kwfd8cLZIXgbV1uJr/aPZKWMyxohq1AiUL5hkcQRjPfGgV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(86362001)(54906003)(508600001)(38100700002)(26005)(186003)(53546011)(2616005)(956004)(16576012)(2906002)(6486002)(66556008)(36756003)(8936002)(66946007)(8676002)(6916009)(5660300002)(66476007)(83380400001)(31686004)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IttuWFCkOS3muAKFW1Oc7uT1HjltB0YZB21bSXK0M+lm5+gjmjKezvF9pu6V?=
 =?us-ascii?Q?YwyMJB5Nwr7Y/TpiggjIJo41QeIIhvDsvZgkmLxHqIFTXZ4HH+q/pvYNCj3D?=
 =?us-ascii?Q?bOqSM+thK34TDH1GDuZ/OUtl40G722Cd81FwdINzRi00ixCshT7P5w7CLcdC?=
 =?us-ascii?Q?vnpYcO7D8LtriAZH2cthJF9Xhv3ROySRKHS6lCyZibcdDB8UNXTlmw1G/kPE?=
 =?us-ascii?Q?mtyvZ1rVnULyadkdkYg5DJ2XCqwC4GNbWvupOoTo0nbb6dwGTPbzNbodGFfv?=
 =?us-ascii?Q?zHcs7dtPV8659PnPD6Fs9nbRqTyOnAE5S9j5rpeTk3K8MpLTxm4H2Bovkzm1?=
 =?us-ascii?Q?ugrpiujUxEVQTzqiBT/KJZyfb1xJdRM1uIH4ygbhaGYl3pNKUtXKG5G3aSuS?=
 =?us-ascii?Q?tPCzzSzJ8YbIltnQXjzvvyrGwcusQsecYsc2DvuvyPFBHuewN5iE5Vs8oBvH?=
 =?us-ascii?Q?R6cM7N0DhPJIxP7z/ZOrXBHLd2o9a/QnUPoWFA3m+6uNcAv0s4/oLOAAlt4L?=
 =?us-ascii?Q?I5OpZxJN5I5ls7H7lnfjtxv5sXLjJtuMXWa/LGFpiT4py9IhpteHNz2t5Y21?=
 =?us-ascii?Q?e69L1bhlFpfr5DyvVBv1NLJZDwC36qzBR5D0CN8j99P1xR3PI6hASmXRXFTS?=
 =?us-ascii?Q?yLTfnh9S6yzzz3cm+67Cu2TY3mpONh8wy+FLxC0Gb0q/hGrl7vCNUIqCBt5q?=
 =?us-ascii?Q?lNyKEWbWA9Tej5gioXp8/Ht6l1AgY6M0LwkBiu9Fp8zckYRWnL2kG5T82D/z?=
 =?us-ascii?Q?q+p8+qU2NvnMgfdI0/FQ9Yi1jzQXVJ9Lgp+Jqn4NKihSz4CkGScKfOaBXJ8m?=
 =?us-ascii?Q?PGnrDIrPeTMdBDKVHsRHzs5P37JY+3faqLE0hr917vSRSI1Y8BG4fCIEnj3q?=
 =?us-ascii?Q?FpQUYclCcaIlCzy5BPWyrAQpw0OuVJZvrgO+GwqnHsdZ970PvgyUnrxhucex?=
 =?us-ascii?Q?cnACG1hLDNIZbh7uuxf0U9FF7zDWQUzNeHuqVRkAzGwyRxLVn0Mqo00GZFT+?=
 =?us-ascii?Q?Yo33Q/tB608zE3YxYaqwTs6gEljsplbC3qW7h5NlBfJzD71RQOBh92keCItZ?=
 =?us-ascii?Q?QutyqKwbIQm9y4AXGnv/blp6y9FMJfKScOqkNMvzW8mEVo89XeKLIprtN8W+?=
 =?us-ascii?Q?ezl/DaY7jqoQINSPtjAEOZe+8qmXCTDfTc63s/LkKMwEVWZjVi+mU+7yA+qK?=
 =?us-ascii?Q?RSlLTsFFDav/4GzxupVxEqHo63x6QUjuVzvyh6dKR7Y66/sk6yp8eKySC9p2?=
 =?us-ascii?Q?beHG9enrMdrR7YQwOTpC0O23psvvAbSu7j+6qQZHLj5WMTMPYJFGFzn31msA?=
 =?us-ascii?Q?z7lAVRWeEevCNwiNzu5mw49X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7357a8e9-c829-4d9e-9f9e-08d97ea5e90f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:22:09.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGBQPRXTEGh3BtQ/AJ2yk7mhV6DzP/f8ZOeGPyeGloW9WykqT/pxT/ObC8MFfN4ikQ9YSDuc5tIgfjqtgZvdKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 23.09.2021 17:15, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 23, 2021 at 02:15:25PM +0200, Jan Beulich wrote:
>> On 23.09.2021 13:54, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Sep 23, 2021 at 01:32:52PM +0200, Jan Beulich wrote:
>>>> On 23.09.2021 13:10, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/arch/x86/mm/p2m.c
>>>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>>>> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
>>>>>>              return -EPERM;
>>>>>>          }
>>>>>> =20
>>>>>> +        /*
>>>>>> +         * Gross bodge, to go away again rather sooner than later:
>>>>>> +         *
>>>>>> +         * For MMIO allow access permissions to accumulate, but onl=
y for Dom0.
>>>>>> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() =
differ in
>>>>>> +         * the way they specify "access", this will allow the ultim=
ate result
>>>>>> +         * to be independent of the sequence of operations.
>>>>>
>>>>> Wouldn't it be better to 'fix' those operations so that they can work
>>>>> together?
>>>>
>>>> Yes, but then we should do this properly by removing all abuse of
>>>> p2m_access_t.
>>>
>>> I'm not sure I follow what that abuse is.
>>
>> As was clarified, p2m_access_t should be solely used by e.g.
>> introspection agents, who are then the entity responsible for
>> resolving the resulting faults. Any other uses (to e.g. merely
>> restrict permissions for other reasons) are really abuses.
>=20
> But some p2m types don't really have a fixed access tied to them, for
> example MMIO regions just inherit whatever is the default access for
> the domain, which makes all this look slightly weird. If the access
> should solely be used by introspection, then each type should have a
> fixed access tied to it?

I think so, yes. Hence e.g. p2m_ram_ro and p2m_grant_map_r{w,o}.

>> That
>> is, if e.g. a r/o direct-MMIO mapping is needed, this should not
>> be expressed as (p2m_mmio_direct, p2m_access_r) tuple, but would
>> require a distinct p2m_mmio_direct_ro type.
>=20
> I guess we would then require a p2m_mmio_direct_ro,
> p2m_mmio_direct_rwx and a p2m_mmio_direct_n at least, and ideally we
> would need to differentiate the mandatory regions as present in ACPI
> tables using yet different types.

What would we need p2m_mmio_direct_n for? And what's the (present,
not future) reason for the x in p2m_mmio_direct_rwx?

Jan


