Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B8458CC9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228784.395940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6yG-00008l-Eh; Mon, 22 Nov 2021 10:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228784.395940; Mon, 22 Nov 2021 10:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6yG-00006Y-BS; Mon, 22 Nov 2021 10:54:48 +0000
Received: by outflank-mailman (input) for mailman id 228784;
 Mon, 22 Nov 2021 10:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp6yE-00006O-W4
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:54:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9af418c4-4b82-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 11:54:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-kTEkZs-POLuvagiswBFE1Q-1; Mon, 22 Nov 2021 11:54:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 10:54:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:54:43 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM0PR06CA0077.eurprd06.prod.outlook.com (2603:10a6:208:fa::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 10:54:42 +0000
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
X-Inumbo-ID: 9af418c4-4b82-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637578485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOIX9oemLjHqM/R9APrgkScQByzdubnKKyLUM9yrkg8=;
	b=dlZY+xFciFmPawkQrGsBP36X0tmfcFQ0JWxM1ryz8OWldnve4WyyJs5nuezeh1cqsYN8yj
	jNEjsWb17mEQldaM1Ajgl7auv/Mn0XlMzAuaEY0bkV5OZcZqAy17xsdHfkHr8+6E8UgI1l
	7htlL3RM/iYKzljLbPJ2VB5Qxk1e2kQ=
X-MC-Unique: kTEkZs-POLuvagiswBFE1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD9ZXKlP6jnMiOM/s8FTWTX4plzKIMxi27f2WWJit6iXpVxvJMrDw6CS3bOMu20Wkf8YSs0aN4GQev78lg8EsneRUlMrxcLZNAsxKCX3MEnM99D8tbPYeiCJ1duuJli4VL9brdCIScxnUj1JKMuSX+/trH3FtlaOPbok04H18Tb/7YRsmYU1wvDq9o8yJrc9HRH3gkcc/izRMytaM27xqhyx7dK6sbB1NtYM5NaqWSJoKwr2yI7RFqF6e6Ko33MwzE/qEEpE4CcgjMXqGh6TwdRtbo06RS8jARDnWMukft41QX+x1z+MaN0Yff+bqgE9shK9ov6eozp0cNbyePg1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnMc43omA2wJL5UaZtt2TJn3nJlsQwK/5Y8hRVd6rjU=;
 b=lMG+yVF8lLTTq0wOKW9Gtg8plACXQuI4h9DrL8aA5LpSeetNykT9KnPD/iGaczVU36VSNOqNmXKP52WkXorU76LVzMKhoCkZoBO5ladmC7d/mIQP5EcpNcOgRQguvT+V0gDx99AJvN67/0O4kWO9r5wvjYTp9EQYuALxBkkXbI3uiYQGBfajd+m6CDlKz/4tuBYbWT2gIz4Qj08uRsSsIvI+d5jGr31370LdmzPIUYYBuQ4eMq4Iqdwa52xwuZToO3NQtKTc+uCkbB1+N5UG2OpLZBt+eI81ZcgAgQp1CEbOJUhELyho45twP+2GVihC4OVKFdPvtIdqFjhJNJ3svQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0345cce-5b44-6cdb-681f-002403893e31@suse.com>
Date: Mon, 22 Nov 2021 11:54:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
 <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
 <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR06CA0077.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2515519a-f1cc-4b4f-e42d-08d9ada67d5b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6672F8F5FEB073A52C8E751BB39F9@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:407;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TSwXud5nz3819AJp7fdVAM6Fa8BcJLnis8Li/Zzvpr/PBqymVApkhHriIR3WabZEx3c/6vbJzsBJy3R2wjQjxhpVAfz5phUBnpmQY5bS/bZUfEMlyhHiSK0ExmqZY3VeQnbn7N3smPKadoN54AlHn2UykBtQ7zMyXxpJpbvOqB0uNXnYKWpRDAx793kz1ZFudSTtqmXDQbYQ2tTqW+r7dgMm6Dm5Y4Nm+bIT+T8yddc6nZEiFOEZKn+CCKTmDKbnKZBWShmq9lX4QXkAtHoUzkubaahwM+AP8Gqo3POqeFvYR8UweT5DPT7c5Ba4SmiWD8k6uTqfX4UDzLCUJ8NFzGra+gfXtYngTDnjJW2y+hLl8ncA1aJRHkozFH0JTa8nj3mmalye3h+t1a3j1Z8LU5M8BLO6NChxEPjyzjLc4xAVkgvRL/s52ZIveYgIpdRt50iex+vFoj7JAi/Rh0iII4VfjVyJeZKsM/zepUuS/kDQBBn8HXUPpcjyA2uEhn9BRnpsS/WtjqjgQLhbitFAra1VXVimNNoOijEgfIzRSnAK4Kf8U48FOR+GZlL60Ywcmwi4c3zisF+rM6qWh2boB8ySvV+BKM6U4AG/4Stx1mchSO7ioHQ3tBspNGcXwYAGr2HSyu5b+6nY/xYi+Nc+IyUce1mk7KDZO07O+QWiJiC/PuTtcMfRxPGt2fHc0eyhf0LZfgFw6QlnreSr0dco4HPhkIdlvwPFXv4qmvapG/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(36756003)(8676002)(31686004)(316002)(53546011)(6486002)(31696002)(86362001)(83380400001)(66946007)(66476007)(508600001)(2616005)(6916009)(54906003)(2906002)(5660300002)(186003)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ocOaNRwmxMWxAGKtAXzAAM3jV/hXSXWSaZaIUJiNeuoIBnV5vpLIwfZzHLtO?=
 =?us-ascii?Q?SRrS1kciWPo6t08MC9PETuX2Z8a3VCafHqZaiTSfbYt7NMo7Ubo0ciT2dY7j?=
 =?us-ascii?Q?zTjdSn5wAMwFEF96QpwXhN6ge2dH8AEWdkBmtsUdeM3NEb0iq7fkUkXP1xN6?=
 =?us-ascii?Q?kWJLVdLPrZa2uizoB34Ax5Etp3N60/C3+scLj9/JuBcdtJEZxaug7+hVXyQb?=
 =?us-ascii?Q?0SvaZwIzZtJrnkx2uyyGghiKYfryagBvWwzxHyaTJA+XN/7cDluOL16586xl?=
 =?us-ascii?Q?4nIY5yd1goRvS0NwL1Q9o52Oq/uMmGuIpfAa4+q681cFuI7qsdi1JkmsFDWu?=
 =?us-ascii?Q?Q2keY6VHsXVb7nBToRb5BcEkH4ZdX4vu+XIGF1OlGXVoRmLW2cisGDX1jxoJ?=
 =?us-ascii?Q?jn7uoyfdy4PMLbwiAFUrNNTxpn+G1w78B2KRv87+jPjjl+X3faQWpxC8vMRV?=
 =?us-ascii?Q?cnfbXDQCqHKu96kL8lZ2zXxk/YsYxcwTcppUJYAs1QjfVJBn0oZMUC9gMRvA?=
 =?us-ascii?Q?GkULrfEKPyEDwb7DOaw2exJAnmyNUnYcf+ctyiu73MecfFL8Dzd/6Y3YovQ+?=
 =?us-ascii?Q?uq3wesVhiPexdw70RnUjnLHUlMS8xcx1qFxAN6g5ZJyD1UtPX7dEJJ3Avaci?=
 =?us-ascii?Q?ESjhMZ+l8eKJbvNGFYAbNIfLba3irOH4pX/FXsoh9HbkASnPRMCsYuyyCjnU?=
 =?us-ascii?Q?K32BCFtHSOp5dCgfIOBPT3d+mpxufpcH3LUMdi7vzIWrsBNqVpMumPlO6Nu1?=
 =?us-ascii?Q?ocPWbIR0Cv2kxyyMM7pHN8mfwph0Sw5QF5I/9LOlzHg1EbnM5urkxlXWT6ES?=
 =?us-ascii?Q?w3Uz+fuMa8iZPvDJXnC/fXHmHasKkeOFpG0cVWQdf7hfsrhVOHTigOLYiCch?=
 =?us-ascii?Q?Bv2OOfdas3Xo1DiYU9xKEQ/LQmbyUoM514oM78fijSGyivroPPP9TwMQxXkC?=
 =?us-ascii?Q?QPkuTDsBWryv924VHAp4W+j1bZfys4iavBuNP/PpVraMexFiRcby9aYzcqQJ?=
 =?us-ascii?Q?w4+Wb3Gv/7Y809wBG5x8Q+C3yTeqJry0yxh2AmUk9+yA50DmmXf082gWLXxo?=
 =?us-ascii?Q?p3cDqi6n0ogKu6Kx6U3nJhqlZVoOUFbYe0VHjArILvZ9AtzuDypJbdoo98SA?=
 =?us-ascii?Q?TVNzQcBmm6AQQ0MhQBEFD39mnV4Qo02EMn6BCtys5uXPDiPP8eAG6DNoGz/3?=
 =?us-ascii?Q?iDCBKdV7I7NiZNf8TOWvLmCaVzN8cWB2j6T0Iey6m9Of4RypzWYCseZ5od0g?=
 =?us-ascii?Q?Do7Exzpgy3HSKqrtBCQLxmWeDeqOqsDc5faOPqUAnhlbBO9vMAlrMuybcV6E?=
 =?us-ascii?Q?TbeP9vDmvGod+bsCH3oxLnqYohmPMAJQoq5PFMrK4fbLHvkkCJEA82bTnzpI?=
 =?us-ascii?Q?Xt9j9+XiX1zRA47uFx+mSrgDlMZu8Uc1L2lT8Rh+SQFHDEo8k4adv7sjtyKm?=
 =?us-ascii?Q?0t3poySLKwxoyVyGSqFdNbqJnTSVReUWOGVTA+DQJ2rxApr54QDzGubLPokE?=
 =?us-ascii?Q?KuFM+2/U0GfFfEsotF+IO4oC1nkMK8rixaA9z2xQewCxPpPgRY7gZpb21d5B?=
 =?us-ascii?Q?AytYjNGb+1rjqyP1MsWF6Pjv4qrMd8mhvCIU/mLnIU7Ev9rCwGoezUfb3md3?=
 =?us-ascii?Q?JLeX/mquN2kVwNyJkqGCr21UCVX9UXmvDxsUd84CQ8N/AFw+aI9o70PVMxKf?=
 =?us-ascii?Q?nHqrbX0fw/Xo5U6WXLPD6wihJVk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2515519a-f1cc-4b4f-e42d-08d9ada67d5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:54:43.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZUM/o3wvB4ros4h9wbOwanVvbwRHQhq92OuLD55B/e1GLp5G4xI/YFEhvYwlviMUw4ZLMNPXIr48LxIQqxKzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 22.11.2021 11:50, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 22.11.21 12:43, Jan Beulich wrote:
>> On 22.11.2021 11:27, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Nov 22, 2021 at 11:28:25AM +0200, Oleksandr Andrushchenko wrote=
:
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -206,12 +206,16 @@ static void defer_map(struct domain *d, struct p=
ci_dev *pdev,
>>>>   static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, boo=
l rom_only)
>>>>   {
>>>>       struct vpci_header *header =3D &pdev->vpci->header;
>>>> -    struct rangeset *mem =3D rangeset_new(NULL, NULL, 0);
>>>> +    struct rangeset *mem;
>>>> +    char str[32];
>>>>       struct pci_dev *tmp, *dev =3D NULL;
>>>>       const struct vpci_msix *msix =3D pdev->vpci->msix;
>>>>       unsigned int i;
>>>>       int rc;
>>>>  =20
>>>> +    snprintf(str, sizeof(str), "%pp", &pdev->sbdf);
>>>> +    mem =3D rangeset_new(NULL, str, RANGESETF_no_print);
>>> You are still not adding the rangeset to the domain list, as the first
>>> parameter passed here in NULL instead of a domain struct.
>>>
>>> Given the current short living of the rangesets I'm not sure it makes
>>> much sense to link them to the domain ATM, but I guess this is kind of
>>> a preparatory change as other patches you have will have the
>>> rangesets permanent as long as the device is assigned to a domain.
>>>
>>> Likely the above reasoning (or the appropriate one) should be added to
>>> the commit message.
> If I fold then there is no reason to add the comment, right?

I'd say you still want to justify the change from "anonymous" to "named and
accounted".

Jan


