Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC552A72A
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331164.554639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzKt-0002oD-B3; Tue, 17 May 2022 15:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331164.554639; Tue, 17 May 2022 15:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzKt-0002kI-7Q; Tue, 17 May 2022 15:42:11 +0000
Received: by outflank-mailman (input) for mailman id 331164;
 Tue, 17 May 2022 15:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzKr-0002k3-7P
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:42:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8cb4a8b-d5f7-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:42:08 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-XDsYJjxnM86ahUr7rPEXnA-1; Tue, 17 May 2022 17:42:04 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:42:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:42:03 +0000
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
X-Inumbo-ID: e8cb4a8b-d5f7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652802128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gcuJQCz1RB40wov1I8iEjE3i26sf/KauDhMpafyhOk=;
	b=BlOt/EhW2ZzWYoehYIiElRHfovmrtO+zYUeSTKUtG71GdzT6ESJ0f/Mf/yC1mq20E6cHLE
	Bi19FEnT1shL44FQhxLpNKEi2T6grGmtWGABqxikcOK1XiXksvU9zD28kQQx3x5ktoYXhL
	BGf5Bum63aqUzPOAZnyX2EpmpDIuzGg=
X-MC-Unique: XDsYJjxnM86ahUr7rPEXnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhh06njR9ZAktDJ8zrJ6D1dTfPpVTMlgy9h3eIsc19mltPafBXWomewwKYD6xe/3TqYddrEIwdxSB0gH989axBrzNWhR6fojQZXa2Utk3vVejS2qK3eA7UYHaZwMC74kNvmUyF6W+Ac011WYKTFVxVMEuiWB3cBNPVx/hf4E7w8UJSIKR5ik2DDzzet+lh+QT+pxit+rIBRtopVUN+GS3H0+86qrEoTls0yRIByRBZZ4mg1ucVbBQSAjQ5GguPoh7p/RCfvXbKYRcqCWkTyen9Nwk4tg/nenC0M4RqL9ikWGECu7LYYsI3tfhMTCRJ6Wb3SRx74YckKqYzmIBOCDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNPrV+DyDhbr8Yj+oOTfeiRm3xfDfHFhqrhSn29H4xI=;
 b=bz5gU3gsjNvNeTGuRnzCqwqApdaLsOrTH4CvmROXZrBsJqzxzIUVyNNBg2eIGq0MQn3A3SGDfVeMzwLuywGsO61JYdCt9z9pA0IgdcqynWucRKODa9mBLB1Iclg/3z7RO7rgQHDkRkVOPU4em90VhEeDE4wUG9+4KtG/rCYkBa/YmvbwoW3iP0jUbjJawf/0di4tTxP/sg8C13iGrmAyKp02ysXTECUy5qF1mMwmw7jPcfWPyleLfaFPZye4ijW9SSFWG5iMzpmm2mJ3gw+77b8hgQs4rx2/2Zrkc83myuGqZLBoGrnoj61Q8OQpUc/5oCrAKg9sMhiuPTnQmRZ7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8329106-5af8-3c7c-455b-fa0f3ddc509d@suse.com>
Date: Tue, 17 May 2022 17:42:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] common/spinlock: Drop inline from _spin_lock_cb()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-4-andrew.cooper3@citrix.com>
 <Ynkc0WbLY2be3OKG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ynkc0WbLY2be3OKG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0093.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70f9695e-56f9-4d87-df4d-08da381bca1b
X-MS-TrafficTypeDiagnostic: DB8PR04MB7036:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB70360CE7950A447DFC6791B7B3CE9@DB8PR04MB7036.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l9dnuZtsTTg536jVElzb+aqCUrk7c7dZRETedk2vgQnlcekzwQT3p2E4Pwfs+vF8SGhHW3IpOVsaBY1qXfeaTEkQzCwO2ccCqsoT5SQ7Ik7W9v07ssnl8vJC94gL5bOz/SjltUwEKFzdKosDgFBnSsHpvV1OmuxAQk+rlgDCtwrVTWqDYbzMTnKXtdq/GKPz4hZ7sQEIREpkUfHe3YBjIdyTUelqmeaOxTS4VQaWLFKegBbmym4OR5xjrgA7Adwr3gw1nhh4rsGfcXg8HKuaazxCizKZrZsQCecoYCa5zIhIqfODz7YAm/U5UBAorGqmJSnhQ9LRE8hOa5UfPuv2e6qD7POdQBKFG2FSXZP0VMw2phnDWLBwZGDR0QYU4XCUeZhz+tJZKLRb834Bj+v0j1oNAb8b3iaYiNHEbqdZcmcPHVmUfu8BUhW70amFTIN5oOTDtErRuZGOjcCDp/DCxkEdSdB9O1bCWpExYQHwApPQ87A8DfemelIepCVqhe6X8ZDdpczu63BiIdgxWOlfJN8g5+GhwNhI+v7sNIvSOeXHMYRe891mvPIEg1bIsuOVX7A+I+F52DeXBvWtW9PG9w9OEoDLugIH8Swe0GTTkogxE1U91DN4FYkigJfPEcQNHX4msZd0QwQL7viznYAiFmQQAgXyCpCdI7doQhLRJBbUuC0pExRtrCzw4jSkcOVmrVHGLmvk/8fdLSgPeCetvvrYYayIJqyyDVbo38HwxlXKmlTHoYtHTE9XbRHRYCVP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(6506007)(186003)(53546011)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(2906002)(31696002)(66946007)(8676002)(4326008)(66556008)(66476007)(6666004)(2616005)(5660300002)(8936002)(83380400001)(316002)(4744005)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VyO9rnh3jxUIWjVTig6ozPAkaXZ2awio7kO+v0k22gknpR8UU/pJEuEydr7c?=
 =?us-ascii?Q?W2D3untblsMcH+ug51FhTW2YHJzdjyBfYXg+K1hHMafpq2ULvDY/d6jejz73?=
 =?us-ascii?Q?O2z5a/ZLkGS2dpwiThlPMZDfTVm2OT/Oc40mAtgjJPvKpqZNYJEET+iHlrZ9?=
 =?us-ascii?Q?n14uaYPEV1TxP5Iv2hsF9E2qDLRGC4rDdq0/LfcdxjFuY8FPgP+on4tkl0i+?=
 =?us-ascii?Q?qOLWqMIWz98zJkmzGjgdT69yhtTJfFcQ6pHT7ev04d0TaJdajI63pnQQhxg+?=
 =?us-ascii?Q?l/zodmxZWDFVNbQiMVKfBErUPYu7Q/Zep6NLUQS2tNlBx+RkvKO79jJFs2+X?=
 =?us-ascii?Q?Ta8YasQ8XWQtWP/23SiQs2rOZGc6X8ujsEeLRNHA+S55E4yNhVPRPqIqz19q?=
 =?us-ascii?Q?y1flK+PKKM7DVvYfRwdCXMw7yPaqGUFiPwu2FBmCWbyl4x3dFGneE+3mpVFx?=
 =?us-ascii?Q?/vlQ2TAVdZLDEyP+eufjAPXJk89qI43hFTP5Hvz12scgMvfEDiqP21vu6BbI?=
 =?us-ascii?Q?A24327RTS3LexHSlyKG+ZcgixZpnklens2N8xp22RR9j0S88ogYzfnKh2k0v?=
 =?us-ascii?Q?5Z6oiwLMycwCIjy/pTYZPc1weLDwSaIpxV3Y9vVm268ud+pwJHmx0waI9cf7?=
 =?us-ascii?Q?SeyxP843aPGRdeOpsOc+oyxfFsMaDXsg45U9I9c9nJ8JMh1kK2junqyJ58Y7?=
 =?us-ascii?Q?ejbi8Fz/NbnWN5vLkfPFcAmNqE1+ZojqLNLj+oNV2UdUKNkImcZZ+bH4IhaN?=
 =?us-ascii?Q?hYgg1tzJhrbNNwLTS6ILuYNWE7ry8LaYvOf/OXJquN+ngEq0kqJ/ZPZpaKtT?=
 =?us-ascii?Q?fXkw/Ocly+IweymSo5pqFJD3zBNrG57SqnYrex/fClDbQrelakiVlYajJqRt?=
 =?us-ascii?Q?JkVq3JVS74GeZss3Z2O1H12+eu9OAD3KX7dzxkct60OBwdeQgCfu6bM2+LGu?=
 =?us-ascii?Q?X10SpZKPZ3mv18DDwOUyYQRKsUOqGRkFVDQZNrIaWkdVtTvhSTX/28vIbH89?=
 =?us-ascii?Q?GYGNXXh7tYkDBi+9XV3w3/mcRdj/YkRzGltOr9YZuIAr7Gy9ToG6f2Ar89eM?=
 =?us-ascii?Q?pps/6ZZ6Pb7PR8JquQIMw8rLvUgDp4WcRdLrDZQGIeLJ/+AiLbxXS4SWMJcu?=
 =?us-ascii?Q?hyLBHLHfZsy+Sr37DLxdIQfJ8+vgNk8L6FdDsLZZKG+MG6L6t37meg3YjMIs?=
 =?us-ascii?Q?/WjbeKaLkNH3Ges3P39OJTpz1WWkfmhCI5MUWnJ5gsakONkEu6ImCdEMhkzM?=
 =?us-ascii?Q?GYcdE2A7q68De6rvmUYajEcGa1Lxghx/FluIfDIMFfdMWJrgHgvQdnqZGBNy?=
 =?us-ascii?Q?M0NToGsXXuQ4zBFCCjr4FqpXxayhqYfhqMOxh6L3kJ3GLiQmbbOfuqDp8Ode?=
 =?us-ascii?Q?P7Pe+yKfS4ESjPAN5tIVPDAsEINW1hXjFhGUyctciPgstXDlZ4g6AMsDXobr?=
 =?us-ascii?Q?KLK2wpd3HTJxsYhn6NZnUPEqz2bFWkKORP2TFWAVrGb2c4kYdnwMJBDzIEwY?=
 =?us-ascii?Q?jN4OyYjrLNuoq8qPb8zBgRtoA/j34xfd4ZB/qBNfxj4nMVVCV37Rx9f7fard?=
 =?us-ascii?Q?pBSLDc0mhMACN5S5+KXPZbMHBq1KvM4/B8yf/ghNh0FPndii/f8JXJYH8cEm?=
 =?us-ascii?Q?Nj8Q0+5hDJr7V+nsUSvx3HNkRuCobddFBBp/fLfMUexzecsJK9U+PgFmSXZ3?=
 =?us-ascii?Q?egJ44R97mXAXZyUdUca4qRpab+B33gWwz/08TkhylD8S5wfDyi4kFqrlbly2?=
 =?us-ascii?Q?g74tFFVUYA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f9695e-56f9-4d87-df4d-08da381bca1b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:42:03.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAWDbUiQVhQN8xc9OQrsgrVSmMzppxkXnRTPrKeRAAZo/FM7xtSysk3s3ohvcIjVUrjTzIB8R5yA3zeX3RgyGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

On 09.05.2022 15:53, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 09, 2022 at 01:24:09PM +0100, Andrew Cooper wrote:
>> This is undefined behaviour, because there is no _spin_lock_cb() in a se=
parate
>> translation unit (C11 6.7.4.11).
>>
>> Moreover, MISRA prohibits this construct because, in the case where it i=
s well
>> defined, the compiler is free to use either implementation and nothing
>> prevents the two from being different.
>=20
> From my reading of the spec, using inline defined function with an
> extern declaration could allow the function to be (re)defined in the
> scope of a different compilation unit, kind of similar to the usage of
> the weak attribute?

Which would then result in a linking error due to duplicate symbols,
wouldn't it?

Jan


