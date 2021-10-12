Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DF429F50
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206835.362492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCmO-0005lS-Sf; Tue, 12 Oct 2021 08:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206835.362492; Tue, 12 Oct 2021 08:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCmO-0005jf-PI; Tue, 12 Oct 2021 08:04:56 +0000
Received: by outflank-mailman (input) for mailman id 206835;
 Tue, 12 Oct 2021 08:04:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maCmN-0005jV-HI
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:04:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08ae4144-eddc-478a-a03a-913d0c8dc80c;
 Tue, 12 Oct 2021 08:04:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-Lbj6k39cOESxxIvC8fSXDQ-1; Tue, 12 Oct 2021 10:04:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 08:04:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:04:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0360.eurprd06.prod.outlook.com (2603:10a6:20b:466::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Tue, 12 Oct 2021 08:04:48 +0000
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
X-Inumbo-ID: 08ae4144-eddc-478a-a03a-913d0c8dc80c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634025893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVEXBl0eMQBubCfHAGRRC1pbQ6ipJZYOZgJooedLi6c=;
	b=ijLTAnyS/TLOctzFZdSYOmMBDahz3Md8mqj1hGjOHaWQQd/iXs5qEtt+jHHhBe3VwYpmey
	2k5k2uIuHwj7/qTzQt4ftVz5HZvsgDqjc0mB2i8Trz0jByF46QN9kntr1eWJ+dyRS3y+rF
	fp3WrGoCblhJ6YEziXcpFrvDroohoCI=
X-MC-Unique: Lbj6k39cOESxxIvC8fSXDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur+XKUpi9ZRqHLuW/o3hCh40flWXPGBdrX2wkiZLwJLZywUCIwT/QNkEYQ+WD63ESL2F6eG7P9WLEA8mQCno2mn7SNeVOnebrZvLaWXx4JFEgBTpvKWoCNucZOArITzkGoOCrRZdcaWMDVStP75de4WdhllJ7xKiDykB8BIk4oXwfKfLuZ8dUJDP+p5BjQWEofJO9U7Ch2+06NAo/pOyOpB1hb1uxQtNpO4RI2HRsT6vdYbG/oNo+0qPB/D54+Jm6oMUtkolnR8on/zgTGAP7qRsgJxUWJzMzzPwVe3XBvTgl6unzsBYkjKAD+dpiwXQ7vkLA4Y25TVbA0bK9bRheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVEXBl0eMQBubCfHAGRRC1pbQ6ipJZYOZgJooedLi6c=;
 b=MNWrAQmOOfHFdegdFT7tmlWR8K0Ld3K4NEGboqZZ2lPqEhh+vrnHTVINKKwD/d4ABzgnogrJMv0exwKVeqQ7Ybg+EQqbtx954c3pfsRwOp0R4Y9UTejR5Gvyk8P1ipN2WTaFjXvaAQ6+SKWS3HnCT0KMe0Qa1CyKzrA0rZz4ha7inQwn/izqMoswd2dRtoQKawOhSCJO2l38gdue9UCVE+w1+9M/kPrZGCexzdjUWcFr0pqviqe4bVpBv2G1bVwoKkVke0o56ehw7HaRsqxOkRwC4sHlSCXKzqHNetYLGN0KgCnrjAAuitDprBIJ2aGsYV0qn2jsLbkXRAx16CaS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
 <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
 <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fa4d2e2-7daf-6d52-ff4c-38a482af1fb9@suse.com>
Date: Tue, 12 Oct 2021 10:04:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0360.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42da314c-90ae-4949-a21a-08d98d56f6d2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260515262E4184005107A035B3B69@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TGRW6AmqItX2o0n8LIyKvORwZDeZaaL2D8BT9WhjwvrGP+UUm1BYfC7jJAnwycLfeaj+OQsXYUy0+yrruvV7mCVOMwkj4/fzhm04idk9w/N+InHVX4fQKIDn9xJ0mSgSCnpJs55tV8uu7BzWhwfwkSiUPt+leaNNgoPzKzrHk4gLmlVOa3jg1P3DyIlAcWbpJzulJ9pt2nNHfsP2luGBO6jysA/P0Tua8nLE38lvsBuY4rlUGnq6DstRTwfQNMZu6UvSkQrENXzdaPA8Eb3LsPdQqatOOMgFDCSQdU5j6i7/f6XE6sqcOgSNrRwlRGgOQgB6aWFrGrjKZXa4TlaKpGCF3814V/YcDUCsP/y0ZPRx2xo8Esewsjjk9D4b8zfa3cXJvP37rrXmzJV3GxN5UoGe3qUp7xd7rZ7RbKPorMAH7dET10Iqjg+cgxXtyimjI59y2OEJGvlhb0bkP6XubWoYkAQvTitJF1DR/exFA6O5XkXGP/dfOCPQRsJtbxQ5oE6OHAm9kwMAY5rWICcphCSgEOlOcGS5tOvVfw/eDN0cS0RUm0kG5nCS6O9/a4Srbmgvh5Sxi93CTOA+unWJn/gEeR6AV0JyQmEKJpGDQXC0I0s8mxNngK5ZNW1sRP9FBXnvbG5W+OEzbVNOvqSi9E3LzWbi8Rl3BdNbKzaB2Y0GmiRm0D/Oij8oc0F9A6Q5OQjhi83r27LT3LC556jlZrAx/f8seWEAPwwSuoYA4t0qm7/fTywKbGiQqUUJ3N1I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(316002)(36756003)(83380400001)(8676002)(2906002)(53546011)(8936002)(6486002)(508600001)(26005)(6916009)(7416002)(66556008)(38100700002)(16576012)(66946007)(31686004)(5660300002)(66476007)(86362001)(2616005)(31696002)(54906003)(4326008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3ZXcXF2ZXhMbDR6d0RTS1VWSjhJQmh4eEFBMkY3UVU0YlI0Zk5heHBqSDIw?=
 =?utf-8?B?NEFTc2swQmJqRXRaazlqVVc1ZWNQMXJJUlZxZjJYQm9wQWZheTZySS9YWlRa?=
 =?utf-8?B?eUU0QU5SdnJ1YVNQRFQ4cFRMd0JMSitSeW1GbHQzOU9UTjhUdk4rUkQ5OHJF?=
 =?utf-8?B?ZnlzS3JUdjlYTUdQWCsyNjl1RUJrazN2aXhsQ2orSlZobW44N3QxZXZ0Z0Vq?=
 =?utf-8?B?dHpReFppQSs4M1B6eFdWcUVBMUw1ZlE0L3NjTDZoYUszYkRSR1VkUGI3ZFEv?=
 =?utf-8?B?OGR4WnR0ZElibW5hNmJBOTBqbGZRY3ZkOGdCRDdjZDBzc3kxRWlKeW8yR3pq?=
 =?utf-8?B?MU01VlhoRDh5dStXeVhkZGVQTzZWSGtNRzc2ZHJxSXZna1Jaa3JlYjlKdEZi?=
 =?utf-8?B?VHM5aTJjbVJNQ1Nta2U2aGNyM1NLZmVGejZVRGd4LzhFbDZBcVBNTVV5cWMz?=
 =?utf-8?B?Mk9jTUd1MGtRWURVNkhGSExKOS92S2ltck1yZXF6MitZRVBibjVQSk5SREdz?=
 =?utf-8?B?YnpoL3ZwTHpxN0ZobWxQcEF4eEZwRElqTDdFQkRyT2lCV1A2T2RKTmNjQUpv?=
 =?utf-8?B?M1N6RmVzK3k5UWVFRElGQzYxWWdrbDlOaUlkSExsV0V3NFJOdS91QVhOaFg2?=
 =?utf-8?B?VFNKZ0hpcVQzemtaaVFGMjFzd0RkOHBkaFI4NDg2d3BYY2pQTUpITExBMXZH?=
 =?utf-8?B?VG9ZbmNMWk1lT25IR2xyeDIzZXZ3ZjFlNGNvVTZvNURrRnZkaHJiWnJtNTAv?=
 =?utf-8?B?d2xQZjBDdlpsWm1CS3pVaFFJUGw2alZsN3VZM0xmanpFNU9zZjZYcXFvRk5E?=
 =?utf-8?B?UEt5bHByenA4Y1hjbVQ4Zkttdmo5dkNIL3lvWXJxdFNDYUl3N2F2ZDFaWUNJ?=
 =?utf-8?B?UzNZSmdUQnpDbHhGSldRM0poZ0NSZGdMT2tzMktNRkFpSXd1eWtWQnEwMnAw?=
 =?utf-8?B?bWhsTTU5cmRiSzNiZUhTUFYyWERCa0dYZ0ZZYUNKYWNlUVdKTk9hMFRmTjhw?=
 =?utf-8?B?ZGVjbXpvdkJjTVpmL0RJV051cEhBaEFPZ3JZZzVFcG5UbjBSV3hlM1diMEww?=
 =?utf-8?B?SFN0U1dHZ0lXTG14SENTdDdqc2MvTXJTZnpPKzFRaWY1WHg5dTVQaFZWUVov?=
 =?utf-8?B?Z3NTVU1Mc2MwSDJyRG11bU5kbHdpeXZyWUxmcmszOExmVnRXOXNzL2FiUGc1?=
 =?utf-8?B?bktVK2grZkJMblNhcmJUbkxtTjFpUmRCTTIyY0YrWFk0Ykx3cEsxT2FXQjgz?=
 =?utf-8?B?VkxmZWZnb1JvVzFIUnQ1WlVPUFczM2FRZWRoeERyYXVyNjVDT1VtQXQvam9C?=
 =?utf-8?B?aVJoeFdRLzNNY0xoNHdjSXBsUTRQMFJIazN4N096Z0VsUElQQktxNmZzbXNO?=
 =?utf-8?B?d3BYdnJZWE5CKzJOdWRneUUzNGRnQXg3cDBQWU1XdjJVNmdoaVJrbTFOeGQ0?=
 =?utf-8?B?aEdzclp3TGdZU25HMnZQa040OFUwM3lOcVRBdzVScnNWZkJ4eVVSQStWaXdD?=
 =?utf-8?B?Y1FuSk1yaG9NSjUxdUJCQUhUaE91NEM1SEZDbWN2WmVJRzJhWUo1L1hZdjYx?=
 =?utf-8?B?djE2WlgySExlRXA3M1NtOHQydmprTFBhNFRsVUVhb3l1Q1RZY212RU9FRmxG?=
 =?utf-8?B?UUYzblBFRmJaSE9RTU1Vblg5UXoxU0Y2MVRZMW5hZ1d2NEczMU1wblpyR1dh?=
 =?utf-8?B?QUVuY3FBZEtzZWU3MlcyMVNyUzhTS3hPU21DVVlRcVZNeGg4Ymh2TGYrcW5Q?=
 =?utf-8?Q?6suBYBp9ENwJj/jbAmJD6jwKQtS6Pyc0Clj4wgH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42da314c-90ae-4949-a21a-08d98d56f6d2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:04:49.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOd0+yBzOZ4KQMWkElgLcAmCthezO8UwizXJOsRdV5nvgHShHyn7h/zcBXDA2KuVKCKtQYOKlMAmcMo9nvUtJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 11.10.2021 20:18, Stefano Stabellini wrote:
> On Mon, 11 Oct 2021, Jan Beulich wrote:
>> On 11.10.2021 15:34, Bertrand Marquis wrote:
>>>> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 11.10.2021 14:41, Bertrand Marquis wrote:
>>>>> But digging deeper into this, I would have 2 questions:
>>>>>
>>>>> - msi_cleanup was done there after a request from Stefano, but is not
>>>>> done in case or iommu error, is there an issue to solve here ?
>>>>
>>>> Maybe, but I'm not sure. This very much depends on what a domain
>>>> could in principle do with a partly set-up device. Plus let's
>>>> not forget that we're talking of only Dom0 here (for now at least,
>>>> i.e. not considering the dom0less case).
>>>>
>>>> But I'd also like to further defer to Stefano.
>>>
>>> Ok, I must admit I do not really see at that stage why doing an MSI cleanup
>>> could be needed so I will wait for Stefano to know if I need to keep this when
>>> moving the block up (at the end it is theoretical right now as this is empty).
> 
> I know that MSIs are not supported yet on ARM (pci_cleanup_msi does
> nothing). But I wanted to make sure that the pci_cleanup_msi() calls are
> present anywhere necessary, especially on the error paths. So that once
> we add MSI support, we don't need to search through the code to find all
> the error paths missing a pci_cleanup_msi() call.
> 
> To answer your first question: you are right, we are also missing a
> pci_cleanup_msi() call in the case of IOMMU error. So it might be better
> to move the call to pci_cleanup_msi() under the "out" label so that we
> can do it once for both cases.
> 
> To answer your second point about whether it is necessary at all: if
> MSIs and MSI-Xs cannot be already setup at this point at all (not even
> the enable bit), then we don't need any call to pci_cleanup_msi() in
> pci_add_device.

Well, at the very least MSI can't be set up ahead of the traps getting
put in place. Whether partial success of putting traps in place may
allow a cunning guest to set up MSI may depend on further aspects.

Jan


