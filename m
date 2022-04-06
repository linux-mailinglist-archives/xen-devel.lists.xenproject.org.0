Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF72A4F58D4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 11:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299758.510920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1m0-0005g0-Uu; Wed, 06 Apr 2022 09:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299758.510920; Wed, 06 Apr 2022 09:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1m0-0005cn-Rs; Wed, 06 Apr 2022 09:16:20 +0000
Received: by outflank-mailman (input) for mailman id 299758;
 Wed, 06 Apr 2022 09:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc1lz-0005ch-8L
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 09:16:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36d50705-b58a-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 11:16:17 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-ULWxf4xKOtCsv5TO4rrkZA-1; Wed, 06 Apr 2022 11:16:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 09:16:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 09:16:12 +0000
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
X-Inumbo-ID: 36d50705-b58a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649236577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9yAEP5k7efnIZnWqwKNIuoZpKMaIHJzs91t79TTAI4=;
	b=hCn4FM92nKSVXO2xQ2ulJMmkJoNPfjEqgRaZPE6l3hugJkC2Ob8AjEcW/8qoWoKNWeQm9s
	i6kUUzmChTMWL4bYPq3k1SXShtr6kzaKrlCk3YAx8W3+0068op6Cf8lGKZSQ7+qEmpdmJ/
	HmMJlEv3wAmjPT68EYVh58CFHEWIW8w=
X-MC-Unique: ULWxf4xKOtCsv5TO4rrkZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLIz3NnOgm8aZZBIlNKtJyhw0F4K2WKdAvvJT7etg2au6ACGsWbU9r7v/3TKVSwSZi4Fz22BECNt6euah7Sr06SuuRA7dI2yaaCSwF36QLGvP1+9mY5ti1FDaVdLh1LSDzT3szwDDvkDG7M6W7fpe7ijnc1osPNc1Ryn2wKmbWLswb8PWa4KoYaB0gkl3n8idj17Wkw4KkaaKlxJfavZUlkcBm3Qfn3SWzZr8tra6+aHO/NuoA2WEiXCmjU0ab2K4FQSudlVyoqnwXvbo4bbv5IvWGj0P87CxZB4nwyX6CYtS8vOtC32zsOVOpgivjqRc5a1adhoDq1IywD2v49Sew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0+jSX1zBmlTyBdzekTCZUFKTSINT9foCCv5+IWzDho=;
 b=cyD9cdbbC7NUij64vzwf3dR/Va0p8eLgkzbBWQjbM2Mppmczy5QjjiaIgZhktlKAVhfVRyHPcSdMwuAL8wK752+tPuuoHIc02ORJfRxZRu6v81azAZ7KHbmVF389uikLNI3v8+DXAMk9vosqQ2ZD4wgkrayPWuzb5eSuj7ZcDrPLD+NAyJSF+QejGOzsoBO8FWOtmQqk7zD03j7ukmL72ZXPlrV8p8c12Po5V6VsWMMLpiwgmwYYQulMrQ7fIa353xHsfUf0zKUEOsJm0GNI/WRi/oLP+aX4FeARQpBqbLxfF50KMHdwsOFj8wm9RyDN0KH2z1KS2eN0TMk+WUN12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48e44681-822d-8e00-a2c8-808984a0cd50@suse.com>
Date: Wed, 6 Apr 2022 11:16:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
 <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
 <Yk1Ta9ujHBuj+svN@Air-de-Roger>
 <dd4fce17-2625-603b-25d5-3a586a682210@suse.com>
 <Yk1YtHYzS3aAbQlr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk1YtHYzS3aAbQlr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0197.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc0b4f74-0406-4fb9-e5f3-08da17ae183e
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB936601C1E605A5045B05B2F2B3E79@PA4PR04MB9366.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SbctrIB2o6mXJy3E8fLSzRlZweUngCLI7JO0Fofl6ZNpG19QrICE6Mxvfu4mzDpATHafVhteSDHGftZ0n8sdfmfynMXKWCyFUgiF9QeOywrxPa+p/je09LI72JE/1PEf6u10jUEh654id9gI2M2b+FDe1DlmTAujVInfpRJTcg21TNBNHPkqqAhNLWNM9u30EC1zND6dRd1gAiPwVvBTVJyl2IQQ5rmLzjkjggHdpxR4XwmuRz41Ajje+/qKwcPqCaBdHuso3D4PErUpWKw+EpyPUhln12MQdzyIYD6R5HlNkv/SwDsBJp8N7QBf5Ab9+yZmZo+/qeph8MIkjNn4ZrIq5j+nZEWwAt0LWQaByo8l5ZAhRBn3pPZWflqYeSiHIOXKloFWfbSp3HW2KzpzvPQg39HgFE7Bt2mYe504jC+HnLCE1e01T9yTEFsnjTHAMRG6TAz2KlyWulWiNikk9H/SLPUe1FDNeleVwqgpkjann5Q/SJvbnlW/tcU7Gdwl6BgSb0ONKraim8VdwE/SKjPJnke27YgrOeNR/0ouOy42H0eEBANApris4j/O10FTLskaYtL843gnwbeXjAZ/Vse9DZkeX3XkiYeZCPs16i9B1g6DM16y7XON2z6BMEbxMZHu87TTZMvJZ25rxBwUX9BOu9NOm3YohyXIjAQGzXmxqmWBfOlPnnJGfsa/PEvnVi7Jt8Ik64vAk/kJWan281XvesQd60wlTM7GAxX439Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(2906002)(5660300002)(8676002)(38100700002)(31686004)(66946007)(4326008)(31696002)(36756003)(83380400001)(186003)(86362001)(6512007)(6486002)(54906003)(508600001)(26005)(6506007)(6916009)(2616005)(316002)(53546011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KMOvL2327M1Fvqs97j6yDMd4hU2lotT2vclJ4fRfPbDuH4vJivUbUA3Snqi2?=
 =?us-ascii?Q?VMQi7e4PVhpF5iDeD+d8PGzbT7GgylvzNMKS9YJmU+usy4208BCt3cXU7fNC?=
 =?us-ascii?Q?yGZx5UBsH36ZmgJqaVuxREEGHf9LeCAJXjBygsOf03uANfWV14dPqJ97laKn?=
 =?us-ascii?Q?bm8wU4F8w8gmvuRv/OXsCoAKP9Gwzvx1HhPRSaXYC6sm/WGKAGclzp/zQXNz?=
 =?us-ascii?Q?HjMnN7w6AiMzGQERQN738BHI35qrnSfeugjMEG+/iEg754u78wjI0pa6Dd5Z?=
 =?us-ascii?Q?welSsEKQt8SSg6Y0Y7NM6ibr7IlfxOEfJlPN4496D83bRKAubqlAvAMlyfYZ?=
 =?us-ascii?Q?LmJCqx8Qp49BFzd3Muj33l4wRc8R9XGXnr6fk7kBbDq8LOz7P6QyVi/KMtz2?=
 =?us-ascii?Q?CXpF7Z4Jf2CuADVc53A1vInRMJNMQfihir8bGDVQJoTSnrvMGidcK0/1kYF8?=
 =?us-ascii?Q?7q8AWGnpwnsJlS0MUJLsnIOXiwkNtVUsvSm5PECa3HpDxwv/uHszUKNBUorB?=
 =?us-ascii?Q?4ji7yEIV516LPkUCIImzAncCLcLUq6NNwm1pyuR82hd4drQyyw0uF5HpVBAj?=
 =?us-ascii?Q?1MRKN3WpgUcPYS9Cd8OPs8bSqvwK1GbZ/nVgs428i3crIVSgJyPKFNaV4b0N?=
 =?us-ascii?Q?dQY5GyAx6GCb0T3q0BRDIv2dp7rPqLjVRss/7asX2P02GBkyh0MpuTj46Tgc?=
 =?us-ascii?Q?C4sBtiFwkBYJxTNwv4JfF7nPQ0RzWSZzfrVd1tZ4xmqIkvfqhkx99jU/feXv?=
 =?us-ascii?Q?iDlPyFuq0CLbMhsu3Bw9C/lPE8JITOcEVIv/L23ZIzINTGhWYznzH6k8DGyP?=
 =?us-ascii?Q?HYIr5i2rVCqY9N8BRArT6LZRDYPnrIybEIyFRWn29+3bJ72vdo8Q+jS7nEQB?=
 =?us-ascii?Q?WfGO7yvkVqR5BsvHrIEOgKqIGFtcr/qyC7ufcyikBsZisCAIgMKK+ZpxFwy+?=
 =?us-ascii?Q?CokGjVmUyGYwwep9Vyg78BewYGk3SKU0qzXG2PGzjpDThNDbd4O/FRXhoDs8?=
 =?us-ascii?Q?yZrDY4D8mx6a6BkimEUCB+wFUBBWW4YexPMyLfXDU57FujyoCvxzt+anf6xS?=
 =?us-ascii?Q?vIY+UGwrt0YIUqAmSC6a3KA5oHZ+BD3r7Kx29x2W9YEuGD0pKnvbl9/S6xrh?=
 =?us-ascii?Q?+jD3+0m6xuGLmdhHxGLY8IBSCfDDcaYFBgGF2M8IYhU8r7kj6aMT6+dRtTkS?=
 =?us-ascii?Q?xI9lsW0RxujndjozbAjp7eEl2OlDRj0fb7YsHRTXtNRN+535w9MMV7JWT+nZ?=
 =?us-ascii?Q?K8XA4OqHqQe4huYQrXov1lUoZdo6YHuKreCBnPOt5OJOhFQkkKRN2tr+ciFM?=
 =?us-ascii?Q?WnR2tjS/lvINBMttIoHZwrf++gBS9x4ISvsLaQ9LNZUipf5r4Ns8SpQaGRZZ?=
 =?us-ascii?Q?JondUIcq4ZgR6rFUNA1guvn0JSJyx12Mtl5yhOftiQy1AvzeAt13Ast8T4B9?=
 =?us-ascii?Q?2UY+2bBB/9UFMB53wh0u2teMRXHEiP1eiW4O7OqrQ66ODfkBU/NOvMTH7mR5?=
 =?us-ascii?Q?6HcAqIAK/4G0q75qNYN9UCOsnaM8TJKbCUvY7sL6il/DwqtALSLBUPh7JLz/?=
 =?us-ascii?Q?isyYlAqvxyf+havdjnlXSMv2ieSBhK1H4spZiKFb7C8AnDA+0IhdhMtwl2vz?=
 =?us-ascii?Q?y5X0im/kengkURfw1h3Y6/7eDzXksgnVq1Mg+s1n9Jy6cND6FtnQqQ33SZ2o?=
 =?us-ascii?Q?6GXncigX36nLgHw6SHv9UWuhnLCI0Et9Sgk3mhLWo6PMMiY4QDEnz3XodAJR?=
 =?us-ascii?Q?AtLk/D8/xg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0b4f74-0406-4fb9-e5f3-08da17ae183e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:16:12.7056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcxQI1VelM1H0S6qONJrzagyi7zwp5P1kllGhSDcXNGizqkswRjACenLeaVUh5oEyjW0dF73oC9KR9NRKuffVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9366

On 06.04.2022 11:09, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 10:48:23AM +0200, Jan Beulich wrote:
>> On 06.04.2022 10:46, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Apr 06, 2022 at 09:06:59AM +0200, Jan Beulich wrote:
>>>> On 05.04.2022 19:17, Jason Andryuk wrote:
>>>>> On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolut=
ions.com> wrote:
>>>>>> On 3/31/22 09:16, Jason Andryuk wrote:
>>>>>>> For the default policy, you could start by creating the system doma=
ins
>>>>>>> as privileged and just have a single hook to drop privs.  Then you
>>>>>>> don't have to worry about the "elevate" hook existing.  The patch 2
>>>>>>> asserts could instead become the location of xsm_drop_privs calls t=
o
>>>>>>> have a clear demarcation point.  That expands the window with
>>>>>>> privileges though.  It's a little simpler, but maybe you don't want
>>>>>>> that.  However, it seems like you can only depriv once for the Flas=
k
>>>>>>> case since you want it to be one-way.
>>>>>>
>>>>>> This does simplify the solution and since today we cannot differenti=
ate
>>>>>> between hypervisor setup and hypervisor initiated domain constructio=
n
>>>>>> contexts, it does not run counter to what I have proposed. As for fl=
ask,
>>>>>> again I do not believe codifying a domain transition bound to a new =
XSM
>>>>>> op is the appropriate approach.
>>>>>
>>>>> This hard coded domain transition does feel a little weird.  But it
>>>>> seems like a natural consequence of trying to use Flask to
>>>>> deprivilege.  I guess the transition could be behind a
>>>>> dom0less/hyperlaunch Kconfig option.  I just don't see a way around i=
t
>>>>> in some fashion with Flask enforcing.
>>>>>
>>>>> Another idea: Flask could start in permissive and only transition to
>>>>> enforcing at the deprivilege point.  Kinda gross, but it works withou=
t
>>>>> needing a transition.
>>>>
>>>> I don't think that would be right. Logically such behavior ought to be
>>>> mirrored to SILO, and I'll take that for the example for being the
>>>> simpler model: Suppose an admin wants to disallow communication
>>>> between DomU-s created by Xen. Such would want enforcing when creating
>>>> those DomU-s, despite the creator (Xen) being all powerful. If the
>>>> device tree information said something different (e.g. directing for
>>>> an event channel to be established between two such DomU-s), this
>>>> should be flagged as an error, not be silently permitted.
>>>
>>> I could also see this argument the other way around: what if an admin
>>> wants to disallow domUs freely communicating between them, but would
>>> still like some controlled domU communication to be possible by
>>> setting up those channels at domain creation?
>>
>> Well, imo that would require a proper (Flask) policy then, not SILO mode=
.
>=20
> But when creating such domains in SILO mode from dom0, dom0 would be
> allowed to create and bind event channels to the created domains, even
> if the domain themselves are not allowed the operation.
>=20
> That's because the check in evtchn_bind_interdomain() is done against
> 'current' and not the domain where the event channel will be bound.

Yes and no - the check is against current, but that's because
communication is established between current ( =3D=3D ld) and rd. The
function in its present shape simply can't establish a channel
between two arbitrary domains.

Jan

> Maybe such check should instead take 3 parameters: current context
> domain, domain to bind the event channel to and remote domain on the
> other end of the event channel.
>=20
> Thanks, Roger.
>=20


