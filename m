Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D14AD416
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267707.461447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMG0-0002Ri-OP; Tue, 08 Feb 2022 08:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267707.461447; Tue, 08 Feb 2022 08:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMG0-0002Oq-LL; Tue, 08 Feb 2022 08:53:52 +0000
Received: by outflank-mailman (input) for mailman id 267707;
 Tue, 08 Feb 2022 08:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHMFz-0002Oj-Mi
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:53:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2476ddf-88bc-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:53:50 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-eF0rY_uWM2iaQl97FuTyIw-1; Tue, 08 Feb 2022 09:53:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3783.eurprd04.prod.outlook.com (2603:10a6:209:1b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 08:53:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 08:53:45 +0000
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
X-Inumbo-ID: a2476ddf-88bc-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644310429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHzFYP58fe1Zc6pevN/mIujNWLFKjLAZvo2b8nQ8yTI=;
	b=UxTbaQcY+i7OQrgrwrzNv7PH6B+5Cpr4wWDbMJx6GnSL2vQq5t44cv9U1/D3rR22cgEH1k
	oowZnJQR+CyI/AK8cJNGuai7Z9qkeWVmIr+7Y0HAJQAL98/AQhxzsGDD1SliuZF4Zagtpm
	m782JURBV2zMQghUEvd6fIzNDc8z5kI=
X-MC-Unique: eF0rY_uWM2iaQl97FuTyIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCQ6jhl4JWXUy/Is1YhyKQNcdD7Br092gYi6ZP56Hbbb4T+gA+HbaFgZXycpf6EWTi0w8+RzYcv5A9Bzq+M1WF5yXpLe5xQ/MEk8IHkt47nZzdHuMakRhymYW/fwPIQpWn3kUba/XIt3Vk60mjDMClk2gT+odlpZEmuLBcVZSqLUk3YNF9ugtNW6MWg+6U7EECvkgof4OfsK+YsHBKPyUiy6HlE9yJfXHq+EpVx8KmXMj+RJdT9N9HDvnXwLEYluH6tv/rCnPJdZkZkf2FBqKNzBnzNmjAOtrWYuntu8DekahTAmVJ1E7NphpHsgZEFzGtZsVljYboQ11YJ+cdQMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9Y7LnO6rzoo1GXUBfHSExrNotLx1RihnMsF9EkbczU=;
 b=mFBPvPWKjxWD+lKbEAx+c18oudKsz6yrxtRRVLlRZ/RF6ElkrifQO/7HPLKVmHH6R4KZ4DA3nXiJdCKVtTjkZnkfUQ16UTQ1w+l/NgeEUSBTz4mVp7NTnfszTPMOCgwk3BUq+Ju7wXrYsVTRk/Qo4iQA2zVA4YfTMOaYp+Rr7PRukBzwqomg8sXMmmdQzv+OYvkFcK9VNMI9izjfiJQF6UFKG0IEgMxEDI6VgxfmblDjRVqnsYKKInCG+CQLTfJjXMTgUYC5i/UYg9CSQ4I+sTobcnFieL3MiyihsZpBSBd4zy2K9izUaZJ0/qt/1j+LR45INcTH6WAF4OjPvDkfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df369309-3767-632c-912e-e83edcf6a2ad@suse.com>
Date: Tue, 8 Feb 2022 09:53:43 +0100
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
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0108.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8373ea-6272-4a55-0ce9-08d9eae083b1
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3783:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3783B7483EF4C66A7D19A997B32D9@AM6PR0402MB3783.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Og8fIIAmy4PKsgzOlhl2eBATxq71951x4zEWixuCeiPVH7/jPAqTodwVOZaCbUhTFCsPCee748cyESYlrxhLjH03HBW/j9ZBFF0plymr5MgiGT6CEbq6VJ70SoxDiEjM+uSOHkJh8ctGOTnPzuTXt0pXal09GCYGAeG79+bQbURFKs9RrbW10uJbDyJl36WRHjSoYFVohtE6Iw0W1XGg0w9/QGp9fPTqo8PPGCshGgJkc6IXGdFEfeyjAG/rVSgIHRX+WZzLGOHxMKPl+pRi0E7c1R4DQSzMq9rvYO2nAoygQpy/3gPSBCDOZwhPZRbcxN9wvp0qslm/MY/kFih7TbddGi7pzKLMPYb5Wc4qnZnQWUreLvVwZq5/DFbgy9Qu5xfysHggqTIcoX2oNhHr8KsCcj1XTvqotjj21eNK9gfxW4fda79xO5T2rtmaH79bI2wczSCkxebNGHFQgj2ldybVCp+9rujfj8EWayQl0Th2AW3EAS1NAZiZxGUqnr2xKceUKCRpfXEtaiL4HVmf0cCw2tVRYcrnpf1J090jrd+PwEwle3st51QL72bS/l10Wz2FA/Xh5jm8K7PyXX5ielzS5FZ5e8ndfTXwCer6m4wQkuhVd68VVSBd3ooDi28K+RAsUkYOXLqaNjJ25Gy2b86UrDWiLwW5r9vC80LHgmZc5mEuqJaknUniWJRd1+hQGtnR5xN8diknvffM+SB7WG4Xu8T9q89Vxh5vjootvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(83380400001)(6512007)(6506007)(66476007)(6916009)(316002)(54906003)(7416002)(38100700002)(2906002)(31686004)(53546011)(186003)(26005)(8676002)(508600001)(4326008)(66946007)(31696002)(8936002)(86362001)(6486002)(66556008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzbjOWh4D+P6mWP7GeZ7L9B8dDwRBmKnH2SQbFN+kKIHBPvUxv9TZNA+lC4I?=
 =?us-ascii?Q?LJmJK6ysNxxKDqqfsb63dhrOethS6ohLc6Cx1dPFi/kUVNAv62hYcZqh3Uar?=
 =?us-ascii?Q?zt9CJDX1WADde4wsbnEykFItia/8yv1BZpPj3JuhDhqujOqt4qLeOzDe4V7N?=
 =?us-ascii?Q?EDO7PAT63YBwELJCVcAjQhaNk6AJ0bF0sFjVRRH/5E3eQsCutaGiej7atXHN?=
 =?us-ascii?Q?GeE+RwrVhNTA33Wec1lUYe30tDQd+SvaDH5N2yYFM42pLHrQ3rBuOU1BKigZ?=
 =?us-ascii?Q?2LuzDlMKVJvWEMZ3tIgcKtexJNbU/yDJx8q4NAjgaq8minzNYGZkVqVIHS+/?=
 =?us-ascii?Q?EAy6UVd1/0b9hLdL4DCJlhX5+HEYmxv68D6F2RlitNs2SYwVcoaJ+msvRrQW?=
 =?us-ascii?Q?iSQAfjOkFmdSelRI3L6x9KSMEK66hqBZxX/kd50WrOtmkXPheHDpOWYC/MDY?=
 =?us-ascii?Q?mRS8vVv4OUaYZNDbM7GCX7inLfebxmdF81OgxwI8FaoMnrXKYJzaOS3CwNC0?=
 =?us-ascii?Q?GODh3M12EFgcBhw1b/JjzQ2Q1htJrtXhcVPXdbKu4V1IMTxgYp8haSjK4ykw?=
 =?us-ascii?Q?cSclucuhr8FevugZobnF/RNOnS5dI21WkcmstgyLrDuFcqJBd+g4gAlDijnD?=
 =?us-ascii?Q?rNSqTBSLG5bASV5nYkvEko5POTT+kbT5tRv7111KhaA9lL4EVFddzhZdne+e?=
 =?us-ascii?Q?y9zEAfd8U6GoVLulhuPQvV/d7seIhgaIx6NzZn+uRD8Do6WcUkgHzs5xWx7F?=
 =?us-ascii?Q?vColcqw1tmUxKyniu+NMhJYhAym8egzWVcnnNqjFRbrN4SI9wQkVb0k2R0O7?=
 =?us-ascii?Q?MJvChtkiy8XKy+4k2W6u3u/R5KzDWmaEbiFMOs8coaLcrTN00NltQWcNKN0Z?=
 =?us-ascii?Q?8Vll3vK2o8ELMDRgSXuAJV2hnfVHidVm+vkBsfJv9dSXD8+Q892dHYCzZthj?=
 =?us-ascii?Q?onR7j55fzEkPtW64oowkljAAgikapWz+BbKNU37hSIKlchiUar/801Wwljab?=
 =?us-ascii?Q?bYuxiTZFn2ARgQ/cLv50FXYJKV5o0qsx+aCWriGoWrzXb21kexvJuX+hN7di?=
 =?us-ascii?Q?zgvWlhum+pRH3y+TdP2T/GMcUPQfqtaCvwzZ/jqvSEm5m9cZ+8wtw2UasD7Q?=
 =?us-ascii?Q?9fajb2FWmlyMsjm2WJfVWqAXUK1cxXyJyPaOIgsRPYv3b2zLBJjpuROuQAcI?=
 =?us-ascii?Q?uUbKfwODV+dUUZ4MyZrUUn8hBE3Ofuz4X4VHwb1mz0cxv/2B8xLL/hyxCRVj?=
 =?us-ascii?Q?np3fsLCjaqL9ENYYbRfDIC9uaAjVXk49jzmtzaA+w92a+97r+jGOXaofFmln?=
 =?us-ascii?Q?ZCR2h+rbqxsVOdNqxjCtpbXtVS9HkYx+89Vh05Rl5C2u5soiUQYTvDKdmW+K?=
 =?us-ascii?Q?fjaq6xEgLbllWpUHZbhzwcr8FkPvIvDrt3/gOmjTDialwQrk8P4PmeQiXThy?=
 =?us-ascii?Q?Fk6x7Y3n7BVI8zlhD0BU2R6W5GmtaBldBNesBZXDQ75Npx4qTLLHX6pH8z++?=
 =?us-ascii?Q?QY0LahbGYueDzyyEPjQQMbh+kbDIIdDSRER360XFahSYevK8UVi4nNYKEzcP?=
 =?us-ascii?Q?H/Tb6K4ZcVsxFtsT+NSjMsaYiOijTV5IkZ4WCG86B83flO0yBwEBn8VqdIla?=
 =?us-ascii?Q?6edlpGXW7iYaepozbM3MObA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8373ea-6272-4a55-0ce9-08d9eae083b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:53:45.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r7SipNty4otM7jRpx5hb78mSqToVrVnOQAku2foAOq1CcU04ETxcmwLikUSFDwBFFQZvN5tI4wyCBXf6rcRew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3783

On 07.02.2022 17:44, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 07.02.22 18:37, Jan Beulich wrote:
>> On 07.02.2022 17:21, Oleksandr Andrushchenko wrote:
>>>
>>> On 07.02.22 18:15, Jan Beulich wrote:
>>>> On 07.02.2022 17:07, Oleksandr Andrushchenko wrote:
>>>>> On 07.02.22 17:26, Jan Beulich wrote:
>>>>>> 1b. Make vpci_write use write lock for writes to command register an=
d BARs
>>>>>> only; keep using the read lock for all other writes.
>>>>> I am not quite sure how to do that. Do you mean something like:
>>>>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t data)
>>>>> [snip]
>>>>>    =C2=A0=C2=A0=C2=A0 list_for_each_entry ( r, &pdev->vpci->handlers,=
 node )
>>>>> {
>>>>> [snip]
>>>>>    =C2=A0=C2=A0=C2=A0 if ( r->needs_write_lock)
>>>>>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 write_lock(d->vpci_lock)
>>>>>    =C2=A0=C2=A0=C2=A0 else
>>>>>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 read_lock(d->vpci_lock)
>>>>> ....
>>>>>
>>>>> And provide rw as an argument to:
>>>>>
>>>>> int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write_t *=
write_handler, unsigned int offset,
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int s=
ize, void *data, --->>> bool write_path <<<-----)
>>>>>
>>>>> Is this what you mean?
>>>> This sounds overly complicated. You can derive locally in vpci_write()=
,
>>>> from just its "reg" and "size" parameters, whether the lock needs taki=
ng
>>>> in write mode.
>>> Yes, I started writing a reply with that. So, the summary (ROM
>>> position depends on header type):
>>> if ( (reg =3D=3D PCI_COMMAND) || (reg =3D=3D ROM) )
>>> {
>>>   =C2=A0=C2=A0=C2=A0 read PCI_COMMAND and see if memory or IO decoding =
are enabled.
>>>   =C2=A0=C2=A0=C2=A0 if ( enabled )
>>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 write_lock(d->vpci_lock)
>>>   =C2=A0=C2=A0=C2=A0 else
>>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 read_lock(d->vpci_lock)
>>> }
>> Hmm, yes, you can actually get away without using "size", since both
>> command register and ROM BAR are 32-bit aligned registers, and 64-bit
>> accesses get split in vpci_ecam_write().
> But, OS may want reading a single byte of ROM BAR, so I think
> I'll need to check if reg+size fall into PCI_COMAND and ROM BAR
> ranges
>>
>> For the command register the memory- / IO-decoding-enabled check may
>> end up a little more complicated, as the value to be written also
>> matters. Maybe read the command register only for the ROM BAR write,
>> using the write lock uniformly for all command register writes?
> Sounds good for the start.
> Another concern is that if we go with a read_lock and then in the
> underlying code we disable memory decoding and try doing
> something and calling cmd_write handler for any reason then....
>=20
> I mean that the check in the vpci_write is somewhat we can tolerate,
> but then it is must be considered that no code in the read path
> is allowed to perform write path functions. Which brings a pretty
> valid use-case: say in read mode we detect an unrecoverable error
> and need to remove the device:
> vpci_process_pending -> ERROR -> vpci_remove_device or similar.
>=20
> What do we do then? It is all going to be fragile...

Real hardware won't cause a device to disappear upon a problem with
a read access. There shouldn't be any need to remove a passed-through
device either; such problems (if any) need handling differently imo.

Jan


