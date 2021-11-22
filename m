Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39C3458F91
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 14:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228880.396095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp9Y4-0005nX-60; Mon, 22 Nov 2021 13:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228880.396095; Mon, 22 Nov 2021 13:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp9Y4-0005ki-2A; Mon, 22 Nov 2021 13:39:56 +0000
Received: by outflank-mailman (input) for mailman id 228880;
 Mon, 22 Nov 2021 13:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp9Y2-0005kc-0f
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 13:39:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aba26d87-4b99-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 14:39:52 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-Vp6QOr9iMmSDtARCqAMpdQ-1; Mon, 22 Nov 2021 14:39:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Mon, 22 Nov
 2021 13:39:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 13:39:45 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM3PR07CA0118.eurprd07.prod.outlook.com (2603:10a6:207:7::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.13 via Frontend Transport; Mon, 22 Nov 2021 13:39:44 +0000
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
X-Inumbo-ID: aba26d87-4b99-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637588392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJDqWIOAnkp8AdqbabskQ33CEAxTCBaUXGUi5TwqvBo=;
	b=XJKeoYC0n/gqvvzzrI16vDmfWRkWeisjhphkPX7yPhkSBkYMMsFDtrGAZtfFRUK8k51xNN
	hCscNv9PNG3exBEouP89O5VzT0HnxIoKw4sTVw8akxgpl7dss1awDfeXJeo6tp4LbRA4VM
	oqeauh6vnLyH1c9b2+6qlsAETQf16tQ=
X-MC-Unique: Vp6QOr9iMmSDtARCqAMpdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc5klzW9ofX5YaYLPJhqRB8ut5o/JJdRfGaMK+nJH2iN78G8d1NHlFU8t0D311IJ42fMnNouU1YkR9GrCgsMunjB7IV8og4M16+iQ5gLn2psOVyBw4FfRoXngfovqyO15ejWSci7tzajXh1gpi6KQWggRzisVlfeDEb6O3HIHSFzWhQ3cwdX9jw/PVh5i3Fwbm7v+SdCd57EjHiuqUsq8k6XOR4APemo/h/qckfO68n3XPZXy1TDpjjbkoCJdtFFW/Ahqs1kELYyhbddkyxw57Kqskasrt/wQAdhy9InUESJPudJ5WEqPBpko0V4ezY45/xqAarWRDfOmIeAi9dwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdLh5QL2I942orzw8vED+ukwbVfREOpx+dAqvB7Bfuc=;
 b=WWAQ5Vs0BeVcCTRRguJDdh3t0b2awlGkbZMr9MV/BSFPHCAzBw2pmwy5pMJsBq+bAHostrkWcFPhkxJrhDwSgxPJ6wZHlxgSMKYXsOUuw8aofF3Zpe0ZY1HGdETmqMfBQXL+yqmkkB0iL6rtUKGy7zMLagCLmkFq/YDMdh6C3VozkBXP9Yh387O+StXsMkVe/W35ewlU5V3zLVKX0+jPCaFVBCNlX7ZMI087gL1usmmIlmxANeM3GYvCsVWcm9NafbTeRz1ik8JUofEiADMg3k6cZtzbRYZvi+lrIpao6rlkz57egKZsgJ3fG0SKlRi+Ksq7YVCSWtNe1saLcnc1DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7c09b1b-a34d-5352-a6f2-a444f1e27f98@suse.com>
Date: Mon, 22 Nov 2021 14:39:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
 <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
 <e31fd752-a170-f169-5557-ec593b7a27e2@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e31fd752-a170-f169-5557-ec593b7a27e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM3PR07CA0118.eurprd07.prod.outlook.com
 (2603:10a6:207:7::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c353c56b-cdff-4fdf-4098-08d9adbd8bbf
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6383614806E73D264074F7DBB39F9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SzGT2c7xL4cd6Yh5D/5ShGpb6iDSWtDfhjqbqZjhQkwq8Uk/3iML9lF5NZJrFbC2u+tZ8qoLEykNM69Kbw/0Sj1lHzPWziq+ESDzyl7Z17EAZ7JElvSH1rEZ0ASVe0WmcXNJQyc1W7R2mm9vN3sTjeVjr5O7PXDpULo0Q4LgC/RnpRhKGx7cVcA4VOY35kNHhDuw6v1sFaq+PFfAN7ORlT7WDArVmlfhUiMFP8fIuM9MxPlUkx7Qc7OJF4jwPssbtagsTR+h+Zc3f0+ikH0pwKk0S3TkKashcI0SUJdCrC1PRqxNyj/xV7CHsQbsBY45/Gd7tC8BwlMImwcUFc+HA7g1RWZicSBGaxyOmj3x/0ZIYfNAOoSvmms5b/xRcHLSGsgE/mx7eA0k2vYsvVHS9Q4PaCjUftEqSL3VbSXpdSv6eCYH23d/ZJnjjBUpZ0sAviiHjPkESBWv6CBd0A7fk5S/ejpnV3YG+VtFlM8jXIAKU9VdN2EvJbBMCw5JrDeXnRnxB6i0s0qOhlhZCKQJyniLU7/y+/QT6UF2uzjRpifrbZSQmBYKXkm2W4HGY1CRK+gZqKV4RWkXaDNblV2L9xeOEjYC4ESp9RAldnGpWCCxs8h2dmug+h9E4YMq8Ke94AKPrLlCcmtweAMhpAZJrt5W5wEw21kI1YD/0b6hti9te+iYzTzxC2PRClJBo9nL5ZVWwh17NBLJoROBViR3UJ4hKPqfWO4CM4VEVlzbFtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(31686004)(2616005)(66946007)(6636002)(6486002)(186003)(508600001)(66476007)(6862004)(54906003)(83380400001)(86362001)(31696002)(5660300002)(8676002)(2906002)(4326008)(36756003)(8936002)(37006003)(53546011)(38100700002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DH5JkyAYqct1AKy6iijPsTyFtiTlOnX5l9tW89ctNHTRUwFm9B21fxtiWGXl?=
 =?us-ascii?Q?xY93t0d7KKbFuB9orni7RioioHd6TePA/LU295Q9WIjCzs4U3NCwSdrqMMRW?=
 =?us-ascii?Q?HA3W7Yy3cH6+wSBCvLEW62Mvlp7oRwParkYuL496EG/L12dCfJMCW09vSAxA?=
 =?us-ascii?Q?OrmInCzNR/Y08qiToHuC3zwglnCGjn+Scr7c0Tk/bLS8u9gy4QCdTVrvc9hC?=
 =?us-ascii?Q?EjzrkLYa10o6HrF6x5ZKXIiHr9yslKbcDXEMzAMTInfvMKHSOvEzmDIh/bZI?=
 =?us-ascii?Q?3j0FhOeEgaOS4ke+ob51VqZTObQnWLKjp3IKIQNVIxmcGyXEgdSAtpy9qhzc?=
 =?us-ascii?Q?5u8zSnYxs3w8Z4y2Id1CXWftYEoOMpABqz1D408oMXkUJr3La1ATFJOgqTbx?=
 =?us-ascii?Q?/WtmaGsaWsHvRGEJASFhW1P+ieDIccqAWCNilLc7OFBdOXGj64iRnvKT8CX+?=
 =?us-ascii?Q?omuxoWaYu9yY+7YWTyxzQJagcW52W2cpQjD+LnqLEBZYAT/UGPkJkXAjyQQJ?=
 =?us-ascii?Q?dkv9Jau4pxpMZxIpAI3ndPZCF49FGhU5j+MnAVhfIowaw4qmf7qx+wUwYdPD?=
 =?us-ascii?Q?tI9e31A88XPMTwrTQC47RMRF56B9uGR4lDmRoxtRCvpPT5gGwelteBiaPa2R?=
 =?us-ascii?Q?0upobrmzQxaLT3Z45ZVkKTNnCG2vapq/doGmEsCQvn4uJ3/kFqfODeC5JEl/?=
 =?us-ascii?Q?etXPI06z9mrYVfYC5LtSCUo7BU3v1ZCD3IqVJw4xIiEKkX16QTEpZ2EpXCH/?=
 =?us-ascii?Q?ExKHey/Ty0QS758sP15fIHzD34aixTcDyhNPsSbKD2N+aCZTd0x+iFaVnpBQ?=
 =?us-ascii?Q?ry/DFcYMnbNGovBTS6gZFA2yoAtQTlp7UzJSJZQuuHm+3/9YvIGZUGlB6p7N?=
 =?us-ascii?Q?6qrDzWJwh0oXkzKJTdyeyk0ptUoF2M6heVXq1Nrsg0vg9dXqGOXa8tzrUf7P?=
 =?us-ascii?Q?nsuAbODLyO3wibZwwdwhruHanvHOBDuQ3DgQBeoL1w0Sn3F223tIRVX1ij5S?=
 =?us-ascii?Q?lYc5mzj8owBCb4fMads0+I7uKLjno3NTA053Ob8PdaJT4d+GHyEqN0yiwSj8?=
 =?us-ascii?Q?oXUOqd1VZf19TKjOptL3Wvf3DCEXjApx1F5Xc/ejizIKEvFWDQelBtZXb4iW?=
 =?us-ascii?Q?dpBg0D83/BShgdm4WvBEafSSU8MhxenZAwZm/MCggPI4M1A8/12dWvf6qgBK?=
 =?us-ascii?Q?ZQ4sYImbSz/5f5KqMnywy70VfjJVVNzmH7S7ot08nBEMRou7q8HznkV+IjT+?=
 =?us-ascii?Q?KoFPZWaGYMaqr4my2vTb3T66fK6sWKRIwKyUrs7EUsRjh6aBOd22HyFCwtBK?=
 =?us-ascii?Q?rI7axSrTyh3/cJwP19qEmo+xaSG1u+Vntf5ZftE1JecW982W54L3HCY7j9f5?=
 =?us-ascii?Q?kUIxof3lYpbJrftVYStv19RiHD8cMQjHaDKGi2pqBcPalH42YaSPVPWJw6Ba?=
 =?us-ascii?Q?t6IuILpTtvXVPtWl5dlS77Xa1PVDW3Nz8it2l4b+GODuSKo/AtVUMp2jYusq?=
 =?us-ascii?Q?VKLB0JRBZnQ0RvXhPZtje84MjYWXJ9hVQDWEv+e5JoOn7bgqXwYcFmxbYAIJ?=
 =?us-ascii?Q?+TzI6+OjVGrjC+UcjLUlURh0Kmx1Jd3/BOdDVighOSErXlst2GR+bL0smEeL?=
 =?us-ascii?Q?guF6aChSmJWXH/6HoHTA1aoeLBfqhXpU0AiNDWR1fpbSY3iv26ut4vlJ5ABP?=
 =?us-ascii?Q?xkUL7E8ohAYZ+I1yCWKI1DULT+s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c353c56b-cdff-4fdf-4098-08d9adbd8bbf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 13:39:45.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tAzYQDhrpwp54l/EAzNlAOqkuSjMjkzyFSoJ16+E1aBWjd9xMFH3xsm2rt3c+A1rGJQ3pP4i7f9XLKZd8plJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 22.11.2021 13:46, Juergen Gross wrote:
> On 22.11.21 11:41, Jan Beulich wrote:
>> On 14.09.2021 14:35, Juergen Gross wrote:
>>> Add a bitmap with one bit per possible domid indicating the respective
>>> domain has changed its state (created, deleted, dying, crashed,
>>> shutdown).
>>>
>>> Registering the VIRQ_DOM_EXC event will result in setting the bits for
>>> all existing domains and resetting all other bits.
>>
>> Generally I view VIRQ_DOM_EXC as overly restrictive already - what if bo=
th
>> a xenstore domain and a control domain want respective notification? Hen=
ce
>=20
> The general idea was that in this case the control domain should
> register a related Xenstore watch.
>=20
>> similarly I'm not convinced a single, global instance will do here. Whic=
h
>> in turn raises the question whether the approach chosen may not take us
>> far enough, and we wouldn't instead want a more precise notification mod=
el
>> (i.e. not just "something has changed").
>=20
> Yes, that would be the job of Xenstore. It would provide the more
> fine grained watches for that purpose.

And the watch consumer still wouldn't have a way to distinguish two domain
instances using the same ID, would it?

>>> @@ -1141,6 +1161,8 @@ static void complete_domain_destroy(struct rcu_he=
ad *head)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xfree(d->vcpu);
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 set_bit(d->domain_id, dom_state_changed);
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _domain_destroy(d);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 send_global_virq(VIRQ_DOM_EXC);
>>
>> Wouldn't this better be in domain_destroy() immediately after the domain
>> has been taken off the list, and hence is no longer "discoverable"?
>=20
> In this case the call of send_global_virq() should be moved, too,
> I guess?

Possibly, albeit I'd see this as a separate change to make. It doesn't
seem outright wrong for the vIRQ to be sent late. But I agree with the
idea of keeping sending and bit-setting together (ideally, even if this
was to stay here, the two would better sit truly side by side).

Jan


