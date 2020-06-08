Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E425A1F32EC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 06:17:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiVh4-0005xM-DF; Tue, 09 Jun 2020 04:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2DJ=7V=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1jiMyZ-0006kb-Li
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 18:58:27 +0000
X-Inumbo-ID: 0862ede8-a9ba-11ea-bca7-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.109]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0862ede8-a9ba-11ea-bca7-bc764e2007e4;
 Mon, 08 Jun 2020 18:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8MXqTkqnikbHf0FX1cA9r7b0WqohBhhzPtX9E8K66TjybXkbUILfqgV4QtZdltJuy2Fs2JIQMNoB/wb96nCZtpmSr7u9I4+6g0i65TUhyFfh+wYWOpeR+kR79I77wiOabrAx1tkkDapE8eIMQhaPAZZ+5baYwfZT/RsJIaKwttGPcwZxmAiLjfJ81LAk8ZI/6KJJuQr/XRruKd8QH1SqO3s7Gfz3aVwWLAQtQ+PzsRRw3CQuQ8wduEsiodmdQAEobQazuD8lJP0gK4es4aAhb+KBMmXq7Wu4CjwzuhGUp6sYM2st3aHdibidbpoACUh2oG7Y59lK6A282XbSMj1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCUYPl0W15gXDPHhXLwNxUU5qzU7SCq5Q486mwyIsNE=;
 b=KtlVPXHC7mGGIVDA54MLXZl9C60e/HEmKyFNACER4+I1aMziTRrJfsMjZB7ldfwoh4IkIzpFAEppyEsldvdA1acCReQIgMNMlRUolWAgYkKGZawRLuvM2hy1pMugIMEtCsD/Avz6b+D1rG0GhH+nD0a6nEHCeNZeq3TbSr3HzWrfGE4GSRJl8ksCNy9xP8v8Wphr7JGrgIYcAM+35xy0T3m0HPOk9OHpnn0eivmtm6xKjTSZTi5kO+ZCJYteUjDtZLHiFQ9sacnuRnARsqBBsfwYel3j9aeIWfwHVGmQFcczD9QiTHSj8fZSS7s89Aao3eEuYoiCJ/sI39Pt91uklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCUYPl0W15gXDPHhXLwNxUU5qzU7SCq5Q486mwyIsNE=;
 b=TZHdESQVvmM9djmipsAp9zN+dnOIbajCu6f+x4LZkZrwxCeR5xP9wB2xZDBXaj418bnoLKwdggCxnTTzg610moet9qCDMuvgno0A6wUu/Mg9fXQ9tc4rI9n/KBnQqtJ6x95jwmm2ljXKkJw9cmx9BiztBj0dEMZ3slM3hoNlIfc=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com (2603:10a6:10:e5::15)
 by DB8PR02MB5817.eurprd02.prod.outlook.com (2603:10a6:10:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 18:58:24 +0000
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572]) by DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 18:58:23 +0000
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
Date: Mon, 8 Jun 2020 21:58:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0401CA0019.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::29) To DB8PR02MB5434.eurprd02.prod.outlook.com
 (2603:10a6:10:e5::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.228.119] (82.137.38.55) by
 VI1PR0401CA0019.eurprd04.prod.outlook.com (2603:10a6:800:4a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Mon, 8 Jun 2020 18:58:22 +0000
X-Originating-IP: [82.137.38.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef27e105-144d-4f72-a802-08d80bddeb0a
X-MS-TrafficTypeDiagnostic: DB8PR02MB5817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR02MB58178ED117E43C03AF2C908BAB850@DB8PR02MB5817.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M9wR/yx7wsl6LrMzV7EYCH7rmat3FNjP73vXZbRbu0mLB0p1haRfNisax5R4HELn+caGWB/t3QUPf3qp5NxAy7yqA+CSPT1DB+ytj8WWbADgpESC6F0r/yd7YP2T2P9sWHJ+SGkWB3j6fsp5ngU8f15EglnyONEKr9QOObKxoLgucUlBlRPZREOW6rFDl9n78q0mMiU5n+eW58QxIbmAEmm+ISyO7dBCO8IZ1NpNDLrs1iOwJ1Y3kHxZ5O75TkiLRerg2g4j6ZvhWcxvEsSZcO+eTpgRGAtdFqy2wTOQOAuEszPm3VxE/7nQMxa9uvndIQ0Y4cZRRss4xauLM/Hh8W+lnN3AhCd0QW6UOnxumfQi/aSEJTKoCKA02nmNndtK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5434.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(4326008)(107886003)(31696002)(2906002)(66556008)(6486002)(66946007)(36756003)(66476007)(5660300002)(478600001)(83380400001)(2616005)(956004)(86362001)(316002)(6636002)(31686004)(6666004)(16576012)(26005)(54906003)(53546011)(7416002)(52116002)(16526019)(8936002)(110136005)(186003)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Y2AG7aRT1pE/jIFFTvQsU/CdQey2hKkvayFgzA0rnTAZ9oHkXOdF877nQ7mvMaz3xk0OdGhqxVYtrVryxUBxP0Md7Ntz4vWtCLR9dIzggkC5oABp+kRnyQBxrDReXJCsnf6hrTNtZiLP9KkXsc971/tBuVVbhIDHZ4Xf4NCfCRt5RB+C6WHOzLVzHqzg66VIzOWOB+JKCyXqJeGn8fnIicZFOs6840fhcCoFRZNh2/GCf+HEWI3lx02HFM7iXo8rRgd4BdQm4YMAZT4ypmcDBmYVuFtkZBcyqddQu5T17q1X4hP6uK3yAFyqVrojpF/nDpPPjwmf65kLVHxg5u1WGuYn41qwf3Yua7ctV3ySWMU05l7JlX85+nNz9TJOzSfqADUGIxgY84SiK3kdHm5zB6EUkQXnjtNxez+8DnjknX8ECkw27Kox5qteyOF3oGfnd9yvMVA6ZpgqUHLk6gNVeS3duKEkcKcq/8BRo9oDObA=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef27e105-144d-4f72-a802-08d80bddeb0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 18:58:23.5395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWUR4HCAseTpW7lXNu6W54ihWXOABOgGQpaKNkruGnYi7weTZ9kMxP/do4GX3we2cdw+WWgpvfk2d7Tyx08XV7d0h//spYgsIlh678C6gJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5817
X-Mailman-Approved-At: Tue, 09 Jun 2020 04:16:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrei LUTAS <vlutas@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/8/20 6:55 PM, Jan Beulich wrote:
> On 03.06.2020 17:07, Roger Pau Monné wrote:
>> On Wed, Jun 03, 2020 at 06:52:37AM -0600, Tamas K Lengyel wrote:
>>> For the last couple years we have received numerous reports from users of
>>> monitor vm_events of spurious guest crashes when using events. In particular,
>>> it has observed that the problem occurs when vm_events are being disabled. The
>>> nature of the guest crash varied widely and has only occured occasionally. This
>>> made debugging the issue particularly hard. We had discussions about this issue
>>> even here on the xen-devel mailinglist with no luck figuring it out.
>>>
>>> The bug has now been identified as a race-condition between register event
>>> handling and disabling the monitor vm_event interface. The default behavior
>>> regarding emulation of register write events is changed so that they get
>>> postponed until the corresponding vm_event handler decides whether to allow such
>>> write to take place. Unfortunately this can only be implemented by performing the
>>> deny/allow step when the vCPU gets scheduled.
>>>
>>> Due to that postponed emulation of the event if the user decides to pause the
>>> VM in the vm_event handler and then disable events, the entire emulation step
>>> is skipped the next time the vCPU is resumed. Even if the user doesn't pause
>>> during the vm_event handling but exits immediately and disables vm_event, the
>>> situation becomes racey as disabling vm_event may succeed before the guest's
>>> vCPUs get scheduled with the pending emulation task. This has been particularly
>>> the case with VMS that have several vCPUs as after the VM is unpaused it may
>>> actually take a long time before all vCPUs get scheduled.
>>>
>>> In this patch we are reverting the default behavior to always perform emulation
>>> of register write events when the event occurs. To postpone them can be turned
>>> on as an option. In that case the user of the interface still has to take care
>>> of only disabling the interface when its safe as it remains buggy.
>>>
>>> Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm_event
>>> reply').
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>
>> Thanks!
>>
>> Reviewed-by: Roger Pau Monné <rogerpau@citrix.com>
>>
>> I would like to get some input from Bitdefender really, and whether
>> they are fine with this approach.

Hello,

Not really my call to make anymore, but I do have a few notes.

First, IIRC the problem stems from the initial choice to have the
vm_event data allocated on-demand when first subscribing to events. The
proper solution (since this patch doesn't actually fix the problem),
IMHO, would be for the vm_event data to _always_ exist, and instead of
relying on the value of its pointer to check if there are event
subscribers, we could just check the emulation flags individually and
never miss a pending emulated something again. I did try to go that way
in the beginning, but it has reasonably been objected that we should cut
back on using hypervisor memory unnecessarily, hence we got at this point.

Secondly, I see no reason why we couldn't adapt to the new default
behaviour provided that the old behaviour continues to work _exactly_ as
before.

And last but not least, the proper sequence is: 1. unsubscribe from
register write events, 2. process all events "still in the chamber"
(keep checking the ring buffer for a while), 3. detach from the guest
(disable the vm_event subsystem). Not ideal perhaps (in that it's not
guaranteed that a VCPU won't resume after a longer period than our
timeout), but if the sequence is followed there should be no guest hangs
or crashes (at least none that we or our clients have observed so far).

So in short, I think there's a better fix for this by simply not
allocating the vm_event memory on-demand anymore and never having to
deal with lost pending emulations again. It should also decrease code
complexity by a tiny bit. Then again, as stated at the beginning of this
message, that's just a recommendation.


HTH,
Razvan

