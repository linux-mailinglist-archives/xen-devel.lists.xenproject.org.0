Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0C4AC5E0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267256.460982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH71Z-0004fJ-7L; Mon, 07 Feb 2022 16:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267256.460982; Mon, 07 Feb 2022 16:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH71Z-0004cd-3R; Mon, 07 Feb 2022 16:37:57 +0000
Received: by outflank-mailman (input) for mailman id 267256;
 Mon, 07 Feb 2022 16:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH71Y-0004cX-4o
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:37:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb3ba4f-8834-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 17:37:55 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-0kKyA77CP_qSec7lv1WvGQ-1; Mon, 07 Feb 2022 17:37:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6246.eurprd04.prod.outlook.com (2603:10a6:20b:bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:37:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:51 +0000
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
X-Inumbo-ID: 4cb3ba4f-8834-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644251874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQuY2Ha1SAcxC+SIoY65EjeeZujx0YBOcHmcl01a08Q=;
	b=Dvzh+sWnbkdCOKIdOnJJ0de2MWfpnRqQAMiak9o6RN1lB4LwzjWnwvVk/dPD7oshUidJNM
	aU/1rsLh0/dTM7C9G91OWM9XQhWI5aPbrB2R1EZXSFEA5LoNkktZRbK42EXrHN9mUqqAng
	m9xH38ZIUnMEcd3fpbEsI62wlGiXb0o=
X-MC-Unique: 0kKyA77CP_qSec7lv1WvGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj88K/sthJ5TD6WeUvYPZyCOGY0VVOw3vE41aStQJO1xHzggpzxCbyhiYHZHAausn4X7sAZYD1D+pgOVii1q8qcVQmO86XOeMZLyFhUStXYafhM+SpZXoMJoZ+tE9rLz9Vu5XbL0YJrPGDfruGzPBL6t4h3w4UHT7bl2pvA3VTlSbPNv1IKrEx44V//P4gzIGKoe+4oYTWV8md8gKn9XgFPsz7Kcq+wtq6MTfX88wqQ1v+Ezn3Dl3FS2lV1vUDthR+GkZPoCsQULyZGy8TQIzEtXl1TNt1eox7IRjQ9+t2oLKTI1703/Z/zJL3kXBLq9wrJofO2XILBnkG6fpUpdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAHNb6VYbu3Zo8raeT6jyRxhzlTg98SLOUNeWj2Ehjc=;
 b=HDrbqfVbBO0Yt+F22ugWxTZyVwBdKkNTx6U9r5OBZH7AgCwf6DmcBBvLanA2gyvb+zQXwIuOEfq3/1SvUQSAHjeqbD7Y0RGhiwZdSOG017MnR0KdyOKqabZFnt5rahsRsqXYzIFVhJWmCFjTwDMzE5A1ngTxWv2052YKDb6NLpH6ArdlpxvtVnjEFi6pV51rTnQyyrlzlk60PFxV11TTh1wP7EsFdwllpvF5HN9qyQ/eaOjaAukb/VmBFgeZl4O5UGYLOSUWN94ybgrzKaeNMb2z8HZd7UWxKkSrq6h7bUvwBCIqrdX8x5hhuIdDoQ9rkt9Y/f3WgGG1rkDzcCFazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
Date: Mon, 7 Feb 2022 17:37:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a3c3d00-a596-4d19-4591-08d9ea582f10
X-MS-TrafficTypeDiagnostic: AM6PR04MB6246:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB62469773D2E3DAA6A3060257B32C9@AM6PR04MB6246.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wAR785CzXnwnBvoO4EqXSxbyh6UxK5AY1AYrHBqwr/n2ogMjs1YwxKPA2YIsz0NYgIJHHD7ZQuuFGzLo5eoIgFFyBuEJ53emD+A9pzk/swoyKK5yCBZlCCpH5NdZwFRrEJQEVAWdSR0aj0N0rQWyqtvC+dGXacv9jtUMSN2Jm3rzs7hjxyD2ViW3IdzT/ZYcEo0DP18gmDxRjbP8fyfWigwTTAtOt1EocwL/VLjJEK5lNVxQbvW4Xb798+ukColLvUh/02Vk17MxnjyBGre/jQOV7sq0+IbMn3CqCwSYrlLWoCzJ4nO4M+82ABmfQAFyFvMzgYAaPX07cRFFMOBLv+oNjE1q3ZNOJtkDqx0sLq8GusN164UiwKjYfSJvGnkMl+sW6dp9r6o3tHY2SisT9tE0sijhSquw5leoYFfGi+eQPQK3y0XocFJ6HtpKBGiVuln9ZcoksQf69TRRloT67norFomrDvHO1LFmontCgRMbpMF2nhpKO4HxVUpS7DhDQahIu2dndvqx7myib8j7mKP/ui120wRbP4lCf3KqDW5UM5Gmk2751OSVVsnB2+4z/Tp+WotuS2wSsziykoYyVuen1cyC7Crb8w3wTFtOjmQTwDjF4SDYZYKCwbzHH2uByDBRdEq1AUD/NwFBdLZSgBuSnjAiw2KY91TbvtEcR+8obcorlOunzrRePQTajrtghsa5vUg5YFxV22BPCKVnI76HRvKchcqtS9afjvPS/t0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(5660300002)(6506007)(2906002)(38100700002)(31696002)(53546011)(86362001)(54906003)(316002)(7416002)(186003)(6916009)(66946007)(66476007)(66556008)(8936002)(4326008)(2616005)(26005)(6486002)(31686004)(8676002)(508600001)(83380400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ULWwTZgMBdajo38r/SKKmuhIvSs3PuIcqn5Ab/qM6dUQaMBjJWQEHnRU4VNz?=
 =?us-ascii?Q?UAgPHr3SXbA1DR7bxG+/idCoUC7hD0DRsMqxRAj8rTfRLnR+AqqDEWNHX+xm?=
 =?us-ascii?Q?OdZqiDkJRA4zlp4136PmN1tZ0BUFJKPmzi1m/8tEpwsDRN3hfOdw2FmGFGIC?=
 =?us-ascii?Q?2eMckisM/wQp4b9zhuDfZ+Y0j/f3zDfr6ZelnIowu9qTSSskyVpO9BHkH56F?=
 =?us-ascii?Q?HOna7pqMvUypyocD3CKmO8MxfEt7fuMXQBtZeOxK99qE6SGTlPO4bFtE8FyZ?=
 =?us-ascii?Q?YBOsmSIqSdtMDeRq81ZzQBdmKb5GABreUyolSuk3V8BL1/JGyO9V81n3fkOI?=
 =?us-ascii?Q?BCUkQ6gTjObFSa4470LSoS/RFScoY0Qv9WB0NvT8QBXkgq8cdl4dFSwetkrW?=
 =?us-ascii?Q?Mdy68wcTaFig3yOpXlGtroj/Ex0WI890mbGoRepMwlkKt9rpnOwl8daMoSr6?=
 =?us-ascii?Q?ZDTV05kyKBF8LWW5nzxqAQd5TlfvM41E+Nyg+nksDSZDW/rxTyyJvLIvjio+?=
 =?us-ascii?Q?Y131YX+X0G9K3ShEPveHsD6p5mHmd2ebpj2l5tqrKuolNYu5uHgWEdYLXYl/?=
 =?us-ascii?Q?SxZh2l9WAUUiakQ3mdb0IS5vohNIJuJsmm3+/NUoWJ2YS0cvu+hzGSjXuRFn?=
 =?us-ascii?Q?V2kpJjiNcNynXkNxYEXmByvTUHUuJptiHnd7niBzqn+NI9RbCrAO5eEBPtEJ?=
 =?us-ascii?Q?hLAdvEgkM9WihRfn0Tl37ThJ6kGjYr2uaTfb9SH9jhyb8E7JO3ntoQQc8iJ1?=
 =?us-ascii?Q?jy3P4dXKShZl3nCcxQ0gQY6nI49j8EYAwUG3ea+0QCkn+ajURZMUqtJCxJ8S?=
 =?us-ascii?Q?japltqioBuZAh/4Cy1QaI5UcnPkScS3KwyyPS7Kb1O1kyGbehuZ1q/Zlqs/Y?=
 =?us-ascii?Q?ID+wEnYBAMwVuMlYH+4GZQTA4cvaJZjxNfbx4b6aoS7SA35YQmo+J8TRzVGJ?=
 =?us-ascii?Q?bztVQhiULHrT5MmDY+vsuQswDi3rcgv/znYgNe22b2cMQic4hGTJjo+hWtEz?=
 =?us-ascii?Q?uLKQprONNug0aQg3sS9mua39N6qo4Wp3POXv6SgOfBrDsPnNHfK11zE5jI/S?=
 =?us-ascii?Q?+/ItlXPXSvRsF6/RiW6HDWK5kalHuGiJYHCjNqv2gb5mA98szQQ76pfn+eNt?=
 =?us-ascii?Q?b0Rd6ISPboCOnb2okVTG5PEwsaT8bAYyU5PpqdNC+O6oCl6qiVCUCQojJvAo?=
 =?us-ascii?Q?DHx0+KoiViQ5U7moa+hNyw/xvV7JM2A8+OQ3uj0fdE5wQnlH/lO+QgBprg+Q?=
 =?us-ascii?Q?A10XLYYYnybfa5E6/u/IeSupL2yysUNtAJy9Xp1Z6EAT/9JEVfvW6fHIZIb/?=
 =?us-ascii?Q?C4pmWodRlRC/NmJsPzmwM544M0d6s65uEShB/J90lOuTXfMrb+F+0OUZ3mav?=
 =?us-ascii?Q?myK3fh86PecqDVTwy473bmHZrOpeIBepvJFDWLkEDxFtAPZzor/Ol8dd67BD?=
 =?us-ascii?Q?1gqDfDpbmYYz1rXgX5z4HVPnLtYx3nJem+u1/uKALxKFzyBJApS2MzgBxwUK?=
 =?us-ascii?Q?HqC99FC1pmxPBfcfEudrmo8foH3OWNzBlUbzoBxEeCEkNCmwomSav/ZG1zY2?=
 =?us-ascii?Q?+MFaU1IuwIAuTiC9Ij/BXiLUdjNr6BhdbtC17J2pnZ3mIpcgS4tseFZWu0ui?=
 =?us-ascii?Q?7egDYulA3DY/SxT5EzEMG5w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3c3d00-a596-4d19-4591-08d9ea582f10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:51.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhlarDbv3xrs330yTzFYNASKTi937bXCSQxj0M7hIoBn/xLeQc8q+mt5WbqDv3ftlSBRuY87fHJluPXkVdb2aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6246

On 07.02.2022 17:21, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 07.02.22 18:15, Jan Beulich wrote:
>> On 07.02.2022 17:07, Oleksandr Andrushchenko wrote:
>>> On 07.02.22 17:26, Jan Beulich wrote:
>>>> 1b. Make vpci_write use write lock for writes to command register and =
BARs
>>>> only; keep using the read lock for all other writes.
>>> I am not quite sure how to do that. Do you mean something like:
>>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 uint32_t data)
>>> [snip]
>>>   =C2=A0=C2=A0=C2=A0 list_for_each_entry ( r, &pdev->vpci->handlers, no=
de )
>>> {
>>> [snip]
>>>   =C2=A0=C2=A0=C2=A0 if ( r->needs_write_lock)
>>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 write_lock(d->vpci_lock)
>>>   =C2=A0=C2=A0=C2=A0 else
>>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 read_lock(d->vpci_lock)
>>> ....
>>>
>>> And provide rw as an argument to:
>>>
>>> int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write_t *wri=
te_handler, unsigned int offset,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size=
, void *data, --->>> bool write_path <<<-----)
>>>
>>> Is this what you mean?
>> This sounds overly complicated. You can derive locally in vpci_write(),
>> from just its "reg" and "size" parameters, whether the lock needs taking
>> in write mode.
> Yes, I started writing a reply with that. So, the summary (ROM
> position depends on header type):
> if ( (reg =3D=3D PCI_COMMAND) || (reg =3D=3D ROM) )
> {
>  =C2=A0=C2=A0=C2=A0 read PCI_COMMAND and see if memory or IO decoding are=
 enabled.
>  =C2=A0=C2=A0=C2=A0 if ( enabled )
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 write_lock(d->vpci_lock)
>  =C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 read_lock(d->vpci_lock)
> }

Hmm, yes, you can actually get away without using "size", since both
command register and ROM BAR are 32-bit aligned registers, and 64-bit
accesses get split in vpci_ecam_write().

For the command register the memory- / IO-decoding-enabled check may
end up a little more complicated, as the value to be written also
matters. Maybe read the command register only for the ROM BAR write,
using the write lock uniformly for all command register writes?

> Do you also think we can drop pdev->vpci (or currently pdev->vpci->lock)
> at all then?

I haven't looked at this in any detail, sorry. It sounds possible,
yes.

Jan


