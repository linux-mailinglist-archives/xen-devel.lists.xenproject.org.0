Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2CB3AE38B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 08:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145344.267419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDoG-0000KS-SC; Mon, 21 Jun 2021 06:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145344.267419; Mon, 21 Jun 2021 06:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDoG-0000Fs-OK; Mon, 21 Jun 2021 06:53:28 +0000
Received: by outflank-mailman (input) for mailman id 145344;
 Mon, 21 Jun 2021 06:53:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDoF-0000Fl-Bc
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 06:53:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 309c829e-7998-414c-af78-a00854850643;
 Mon, 21 Jun 2021 06:53:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-FpNKF-fqP32nTzXhmLp3ig-1; Mon, 21 Jun 2021 08:53:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 06:53:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:53:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0043.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 06:53:18 +0000
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
X-Inumbo-ID: 309c829e-7998-414c-af78-a00854850643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624258404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLEXoIilmuvkCXi00yf0q3lLwh+NaukY5dn/yNHPvCU=;
	b=jkeRvyitHoHZ8R/h0AMcJTfNaqTdH2mvC9RwfY4XNzeHSc0yFCZ6fhkP5mHTfnogNaEAao
	EBK8/DfOWngNF61IFQqjVzu676hTkaUVTQWiwFoy8nIXy60W5VTK/r9oHpWZbMti7SF+e1
	AdkiHZJWBnXaY9ef0lus3p+OETg/d7I=
X-MC-Unique: FpNKF-fqP32nTzXhmLp3ig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djAl4iIIR9yiCSDJuRvV7+iJ8zLjCjBMz1SNkgrcXX7/nexs7tN6oiNdV6DlqneZ+mOPHBlf1rPhMFwebsOQ4WiEYozVvzk+IiKC+utFAoxQtjr+hhqmUAFUNwxytgE/IjwRbK5V1I2yv0JkwDkwkPW6evCcAiTj8ohW7jYoBp/b4N0urF1AW1ouGYAMeowCG/5RRwJZHt2zqEkeEgL3eTno5ITTTUbEk6IG2Qw1VpdNhXAj3qzt/5LBLzjfYCOsbucMVzi81WSjwgRac8aRtDC1FY1Xf69TURCxt7eoNicmJ6hnxEupUmi2dRx9OX0l2JM1F/Te/qY6GphqQhmJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtwSiBQbdc9hHT/mQAjV1D2ovZ6TtLU975rgOZo9QIc=;
 b=jK1Xv2SaU1hLHeJMKe8L9E5RLOwsKvCMZWiegrjXlstCnOs2LMcVD2AncO4XGsb28SiA4CIkvBOEAc+dKlKACK/u+9v+siacOBxIlNb9AFeN5EIU88JqCG+wng5zlMAUwfZgTL0FEMdGTJCxH5+2u09/dseu7tpIGks3Rn5xTIFHbWH5UIC0w2iGCh6N2gpVnbgxfq8EgfgNnnoWvoOTo/23QoLgDPv4TvNzwEtZfvbYGnCwP0NkdsvtalZ/UxzU/cmTy8OA+cGiJ/XLWrk62tcgc0Rict4Lkrjx7WABaVViGdjY3hICI0Lz5W/mX0jguIuTMkxmEqmHBxWFYWrcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <a8d60866-b9d9-8a76-3acc-703799b204b6@citrix.com>
 <3df8648d-f706-9684-4e6d-9438dc9f0894@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca65acbc-c57c-6056-7abd-299ce5ccd643@suse.com>
Date: Mon, 21 Jun 2021 08:53:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3df8648d-f706-9684-4e6d-9438dc9f0894@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0043.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfbaf96d-ab69-4211-150f-08d93481413b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70240FE2961B1338C4F75BD4B30A9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5UuBDVCF7rnQWqYha2cetAy7p7aI9Xk5DkLzi1rh0sDXSCoYHh7bGpkTKHCIvM8b2Zz/Gqe2Icex3Rh/sj/Haw/bANPN/15IPtZtYjCZ0F+VPt9fkoRkDWiYLj4oXQ8KYqUcCq6Qnbu/gVNPDmmY/dWuiHxfKvpnl1hU/DfdTiOTPia6N1ux04ZnA/e2faFOERgUfSGRbm/PJ8vPam4JT65XtzryCal/c70qMYSpGIM79/sq7GkIg99J9eb2zJXgyDMHXMJR7xXuee957b6FzEvuDkP5Ve3rJVitW7YIl9YrbWxmdD27zYF8N3qMR9b5a1JgToyyroN1rNuy4veIwaboPvGdi89O2R1alCKpIRocT1/AWxTyHGj2ktl4rdOtq7LXWC6zFwbrLjMJHfgRVJV6VefXfyG8Wr+l23doKr8F9QFGRza04iF6Lvc1+AenIyTCEVENT+b7JpOla8voVroSNTW2kMLjat+lG7t4ColCoc5R0y4Y+bJN9F0Vm1C47Mt/HLzDd/bB0ChusZWZG1mKepeghZNRnGLyC1u/SZZMyoUxhcZ7yDG0+CQ50ISGvq9430+7+KXKwPiXPgrFdsDT0TT0KxJ0VO6FnDuPeT5KDsSraWLd/u2MbnTZTzW/geJZgxN8rs1gB7doGIpGsTbCWfhlIv2Uc+1h6CdPSdWckrbPoKbdbg1fntmlLV9t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(53546011)(478600001)(86362001)(316002)(7416002)(26005)(38100700002)(4326008)(36756003)(2906002)(6486002)(8676002)(16526019)(186003)(956004)(2616005)(83380400001)(4744005)(6916009)(8936002)(66476007)(66946007)(54906003)(16576012)(66556008)(5660300002)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IiBXYvCpvQZ1Zmg25p94wpeuOB9og5VBgNvTXg0yAClEu1OFZHxIda40h8L+?=
 =?us-ascii?Q?csiaP4AJOeq5eIq+WC63SNH7X/TdhjY7A9nmD2iJfFFfWm8BABHoxQ3ZZRFs?=
 =?us-ascii?Q?T5kkLsUyZOLLJ/NJWUk/P8JJi36T72gwaIVuZzrLtzVWoIdMDf7hC7Mfx/O5?=
 =?us-ascii?Q?08fPm7AhPq7sTlT19SK6jI97XFypXfZ+IVRebrNtyDSad093r8PxvJ5/Jl9y?=
 =?us-ascii?Q?iHpEECROrRNRIZDn+XaEJ9HH6trRzhGd/l6lSTdJkbqMhgHCsY1BCGLFQExI?=
 =?us-ascii?Q?54i4U0TCum5J1FRox/ItwGtiMUaFQQIpS1pFIwiSYjuA2jJ1eeJx2E+01yg3?=
 =?us-ascii?Q?OHiGBp4C6V0yClPvCbS6dD2NlmhKvTwYI3cO4Z2R/9enT30wyYI8XOah/rV7?=
 =?us-ascii?Q?VdLNxqqVOWFGC6SzjG3RpBuin0vKm9y8iIesZaZzrv6T3btApvJpWG34QV0y?=
 =?us-ascii?Q?0IKsabwdRpL3a6hD48Gwj1SlL0TnMWdGQncown9NgLO7rR1/WXLRJOScQ9DE?=
 =?us-ascii?Q?uKc2JfgvJEsG4g3+ymwYitIT8PoYTqeirs605HKmsuV75U7Ew39s6u7pFeuW?=
 =?us-ascii?Q?hu5yqxPt+cBwsaM7nMt4R6FPzfmuexK41hyyz3bzNkolaIL6p1mJ8FVQ6c8s?=
 =?us-ascii?Q?Ya9tjMBjhqwoA4jnacedNqZY58tV47+VmrPEtZw9HC63Q88pA52Czdg8L+9V?=
 =?us-ascii?Q?cFcHQN/IXbZzv+0pn/0Qm/3eJl6OxA+06ja+rQvrWSS+3+7ABgE6bzoRVF5i?=
 =?us-ascii?Q?KPZunY3Uy62/skSVWV76wRV6m1fuXPRshPIe3pYYdrkRr1qgkchm0ZK4urHk?=
 =?us-ascii?Q?03+k1Akcam+T0ReVu8D1P5cEx/tevvyWi2lf66LT4pOWhjwLbOLj+ua+5dDQ?=
 =?us-ascii?Q?sWWaNbXlrngdWpoiFsGq4kem7DKqcYyKW1VqgFQOeljJFMTbQLhsJ7ulpySW?=
 =?us-ascii?Q?hxSjqFYstpZIDqNSqqotsA5OtJEXsGOfuCBZJ1dQF9lztbeZt73ryC2AIflr?=
 =?us-ascii?Q?W6WaVshGizzR3OOvDTrVSbLAvEe80zV+q/xuPCueJH9nNFaQuqGidu9xiDt3?=
 =?us-ascii?Q?k+//WZ17zKJME3lKi05r7jUkf5aBQc54TrVfJQmDAbqKRJkhF9S941aQ8Vu6?=
 =?us-ascii?Q?+C0t1pS+kLePtaqs4eXg3ia0Og24k1zFGxG/nr3851BpS020B7E7aIqK6FfJ?=
 =?us-ascii?Q?oGQMMGEq33FA3hKV9N0WLs+bRMHia4r9X6ZLKSggc0n7YSr4GtS5J39COWjd?=
 =?us-ascii?Q?0XyVt39UPjMRE6DSgqvFbEm8afDxuLtgqhrOQZB8RBKSPN+Bf5DISayt5zwH?=
 =?us-ascii?Q?2AiKEZtD7pUrF9i+vGYGiM5Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbaf96d-ab69-4211-150f-08d93481413b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:53:20.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0Aunz1n3EpvHbTL5fefF9YzHu1P2xl/9nwi5b4UOcyuHAM1bsCLxW8/Id1ygaQFxP8oMI3/lX8brOW3EDAPPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 18.06.2021 18:35, Daniel P. Smith wrote:
> On 6/18/21 7:53 AM, Andrew Cooper wrote:
>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>> @@ -250,9 +261,8 @@ config XSM_FLASK_POLICY
>>>  	  If unsure, say Y.
>>> =20
>>>  config XSM_SILO
>>> -	def_bool y
>>> +	def_bool n
>>
>> I'm not sure we want to alter the FLASK/SILO defaults.=C2=A0 SILO in
>> particular is mandatory on ARM, and without it, you're in a security
>> unsupported configuration.
> The intent here is the default is the classic dom0 configuration. What
> if I did,
>=20
> def bool n
> def bool y if ARM

Besides it needing to be with the order of the two lines flipped, if
Arm requires XSM_SILO, then I think it would better "select" it.

Jan


