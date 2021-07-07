Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC58D3BEBC5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 18:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152606.281909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1A26-0007jc-9a; Wed, 07 Jul 2021 16:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152606.281909; Wed, 07 Jul 2021 16:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1A26-0007h5-6U; Wed, 07 Jul 2021 16:04:18 +0000
Received: by outflank-mailman (input) for mailman id 152606;
 Wed, 07 Jul 2021 16:04:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1A25-0007gz-4m
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 16:04:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3ce556d-5f5d-42b9-9cc3-91a7563fd1f9;
 Wed, 07 Jul 2021 16:04:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-A__e8K_HM7ioSvIb_NXWjg-1; Wed, 07 Jul 2021 18:04:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Wed, 7 Jul
 2021 16:04:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 16:04:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:101:16::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 16:04:12 +0000
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
X-Inumbo-ID: b3ce556d-5f5d-42b9-9cc3-91a7563fd1f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625673855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMFN60umjUjUenjwkiIMAW/z2ogUhgCmiAccqgiY+Jo=;
	b=FzdPBuyGmmeRvzm1/giAbTd/8U6wxts1k9JAonlaBGarY8iNITLh4J3bux/BF/7k+IclkQ
	bTMkfEMbiz+e/z7whWdSxFQjSygQi3s7EHm7EC8I7aQMGWE4AcGY2jZ7TLBryqML2ufR00
	sj7+M3yU6titNPFmW7l0hdNVlqtAH/k=
X-MC-Unique: A__e8K_HM7ioSvIb_NXWjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kzzq6G/Ch+ns8G9sJ/VtZVOU2o686grjFK0FshFjFe1eXGuH1tApVmwP78R2jTD0RsaDFnLUauuu75NdHxMnoqzsi4RGFExUjwnq+8CYhvEPTc6Z+EGrW44oD+G0uLI5itCKnjGUBxCgZIb0ynRF3yvejL/N/M1O6VK3wXAddliyvYU7/ug7bedzUUcffedPIC3Kxd6k2UXp1YzJ1OLyvghZL+t8ihAXSDyVMQ5qL0tM0/+6qNbn9mVdc2f7t9YGPZjZftPm82FCyGSys0rz6y3fBMz+93emqLMd1pRusKGU+FohCdhrRQ8j7GjjR1iEYBsUnAj0lsQ3gtVeGiDRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMFN60umjUjUenjwkiIMAW/z2ogUhgCmiAccqgiY+Jo=;
 b=NIdcDGVrdd2NaS0XPPdRreETbPuJzAupx4cFYR0L500Yi33hE0wo94qW0wka5WcWgKekI2pr24yA5+ieWsT42T8ObSECh8Hr8m2Mq7Nrz10guztYntsB/YsqfvXDmmZE9b/IAqFSvljzi+hK8CuD1VLbWk7Ou6ElFcD5nfKm0EQhF8pQEfVb46hBqtU0HhHtDv0nX571VcQ1bLoLwWvfbATQK5IzDwdGYeG39Oz/QFA6VOyllLwIhYpk9ln20MEqeaJBCo9eEvpmLdt4z8OtxB9NsK6xg+57Yi6uweAz/WwZ3GwRWTtah2CAEcRumadDG7hovkbu5t7xLF2qeHh75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 23/31] build: fix arch/x86/node.o rule
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-24-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87726f1a-3368-1e9e-8e6d-10295232aa98@suse.com>
Date: Wed, 7 Jul 2021 18:04:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-24-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:101:16::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9fc82f-ad1b-4edc-32c9-08d94160dd02
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329359E49F918ABF9F9D2A65B31A9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xo5Ih1Omub0pcL9GDWPoJCmk34715BjUGcvR9kqDKlooQ14qW6k+qgPG9wkO+9yyIXEzFfUljz6ov8SIE/iUTZg2qFFtud1WpIkysussIjSPRIhhuUSEztBHimngwnkTb7JXyAntCbF+uc51y+es2GDoQTFI/qY7X+icGlk61SVxQUOYotRw5j7g9sUy18kxhE5eSrSWcCwHVppxVnWLyFnIBjyTRK+sR+MBOm6EYgCmGL/rJiDbXH0jyyW0/nH7etly8OtWr9M6nL82pAZrwBR8zQhBgZHBsV1shGTWAu7juKkmRodGA75Dh0fRbwjCxy+tmzWClD1E00YOF0N3H68pPGeR4wEct83WPoZUx4nexKP2tC0+QDRb7TxY6f6ROh7340p4fR46E3TGcNiQNR4b2haTqqNrm0Q+9nAkt1eJ9kGzOIjmdlkh70LM2CVej1QJAmyEoJwghbNUNiUSJsR+T/jQ8H3Nk5hcVFrUvgTQJgFJ6MBptTFbJXLFKyhc8B/BrCG5COZ0Yozo6uAo8dn1ihg2IG4W6Ek39xNsU1yKmR+5pnd2ocWxqyBtFbmQHfpqQj+X+nZetZc9MUiO0lhELcAuX3UdTDippY7N5H+phXEnpgYmGhrMJIGVusQ8HpqA2w+L3SkeJ+xRFouJNyM5h3SRFyJkEJgSyoRLeKEsqQM2OiS+UZ0X+xQ3DAZWzK0NK2nijabnwQbAq4ZK6gIO9rdBBx1rbbNQ2WANSOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39850400004)(376002)(136003)(366004)(316002)(5660300002)(31696002)(956004)(36756003)(8676002)(66946007)(38100700002)(66556008)(186003)(66476007)(6916009)(86362001)(54906003)(26005)(2616005)(16576012)(31686004)(478600001)(2906002)(4744005)(6486002)(8936002)(53546011)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkRpK1hXZXE4T2p2cmEvQzBzai9BWUdSb3ZXQzhSRTV1TkpnVDE2SEZyaTgr?=
 =?utf-8?B?ZmRnY3lpc1MxOC9MT2RnVk9LV3dOMlY5cmkzVy9DMGhvM2EweElhNW04UExM?=
 =?utf-8?B?dGxlbkhuaENuU0xFeWNvMFZoYXcyQkZkS2VjR1dGdjZZcXNhb0VKdVFpRU9J?=
 =?utf-8?B?RHJTYkJWZ3Y4L01kRi9xV3NCaFR4UDdMSVQyRTYwdGhlMEFEUVZjMUtEMlQy?=
 =?utf-8?B?Q2FYS3p2QlNCem5ZNHd5RXZXZGlUa05udUdJNXVZSkRubVpObXFja2VEZzlH?=
 =?utf-8?B?VDhva2NnV3BPUXJRN2wxc09DNGcwdkF6N2FKbFhVV0Y4WEFmRE1uNkJtQ2Nz?=
 =?utf-8?B?elYrWVNhcjROWjNlM2xhbDZXTnpWZ05XYTZjZXdJR2E4RmhHdlkwNllmbkZJ?=
 =?utf-8?B?NVRlYXhkcytmNWNSU0pVMGhZeDhoWWxvbnEyZTJ1MG5yaFppR2ZZNDhGYjMw?=
 =?utf-8?B?RU81bThubkpBT0o2QVRkSzhaK3RwWVlUNXlWMnFmczFablF1VExJNVFMZE4w?=
 =?utf-8?B?bFQwUkdxbEYzSEx1UkVPK3VuSGhTdmk1T3pnaHdVRGwvWXhxWWZRcXl1dUQx?=
 =?utf-8?B?eW9zeVY3bTJBNU4rU0ZrWXYveWhibWt1UUxLQ3FrTjNQSll3VENGQUg5aSt1?=
 =?utf-8?B?RHZ6YzlBY0FLZHNQaW1CcGFVbE91Uzl3dFU0NGpNK0FqVzBCR0hxckZjOXBZ?=
 =?utf-8?B?dGdTSkpIOGhQaHRlRGxKb1A2ODB5eG9CeGU2LzB0M0Z1T3l2QmRaTUNWaXls?=
 =?utf-8?B?TlA3N2RMcXRYY2I0MjJXR1lnUmFnSHhGLzVrMFpBSnJYRkpOUHdWelBXWits?=
 =?utf-8?B?dlpycUpEOWVSUFBmRkNKdUlwZGJ0UjJLNm84dnhEUnVXbHVaUlB2L1hBWVNr?=
 =?utf-8?B?Z3ZIRWJSSCtNVmJkU1lrQ3kzTGdSWFlQSisvK1Mvd1h1aUFSYklrbXdBSTVI?=
 =?utf-8?B?T0ViMGV5SEtFVUhGYzlGVURVdURQWVNhejJhaE5EZTNXc2QrdTV0bk1uRjlR?=
 =?utf-8?B?cHBHazN2Tm00aDVGTWxuZ1k4ZTRVWmgrTEpiRERqUmp1eG1pT1h4QkR3UDlC?=
 =?utf-8?B?VnlsRU1qY2lPR0psRVFlcXl4d3grancvOHN5elExQit4ZTBvSk9wcDlVaXI2?=
 =?utf-8?B?dGxmaE9mTEJQcUhpUlFaakZvWEdMZ2JtU1dhVm5Ja2YvUnZ4eWQyT2V6K0VW?=
 =?utf-8?B?NkxFSEo5bnB6anlwZUJHbTNGSFFteXV4SDdIczRPYlFoOWxpSkEvTFAzNVpy?=
 =?utf-8?B?bFIwdXRGNXFYRlpMZjNVaTBDRUt0dElYdk1MZUtaUU45b3E3WWVZcG5rVkVy?=
 =?utf-8?B?UndoNTRVZVVSK2c3aXdxbm0vK3gxNk02OWNxSFVRdGxZUnNVVFlGU3JRbkg3?=
 =?utf-8?B?WWNOQzFyb1BmWnFQdW1yRG43RWVVaGJKNnpNNFgySUFYVnFad3VBelcxVWVn?=
 =?utf-8?B?YzJNTDdCL2EzendxTHVBcEw4SHJYdFJCalBEdERycnpSVzNkek9pYUpKc3p3?=
 =?utf-8?B?NWV2TmpqS3F4ZG1FRW9abzU2REIxUzQ0TENCdXRxUnVLdVpGSEoram5wVzll?=
 =?utf-8?B?RUFoaUliL21NSmtwejl4ZGcwb0dHYnZWWklzaGxMSEYwZlNEYkpDYXJIQVEr?=
 =?utf-8?B?U1hCUXZsWXV5ckJSSHFidGZOQWpWWUk4eG95anYrbk04SCtlNitKSzRmQWdR?=
 =?utf-8?B?YlNLUitzZGhyT1VFUzA1WCt1dm5hZy8vNFN0anFCbENWbkpCMDU4ZVplOXd4?=
 =?utf-8?Q?sS6oyrgx896TG8mzwhkIW3cJOvuBJTQ8ktiCo0S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9fc82f-ad1b-4edc-32c9-08d94160dd02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 16:04:13.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ph0/K626ToFmvU2x2K4ltO2PjuulRmmhrKKc2muhtykGZq+RALGcJICJkbYVbIYTaVauXYXD+/q6mSc75Mdfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 01.07.2021 16:10, Anthony PERARD wrote:
> Avoid different spelling for the location of "xen-syms", and simply
> use the dependency variable. This avoid the assumption about $(TARGET)
> value.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with s/node/note/ in the title (I was very curious what this patch was
about, and hence peeked ahead in the series).

Jan


