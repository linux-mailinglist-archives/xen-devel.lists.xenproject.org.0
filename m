Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0049B726
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260451.449938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNLu-0003pd-NA; Tue, 25 Jan 2022 15:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260451.449938; Tue, 25 Jan 2022 15:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNLu-0003mW-Jr; Tue, 25 Jan 2022 15:03:22 +0000
Received: by outflank-mailman (input) for mailman id 260451;
 Tue, 25 Jan 2022 15:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCNLt-0003mO-6V
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:03:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d652f719-7def-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 16:02:39 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36--7XrMmnfNIigxKwBdAq5bQ-1; Tue, 25 Jan 2022 16:03:18 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 15:03:17 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 15:03:17 +0000
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
X-Inumbo-ID: d652f719-7def-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643122999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7oGU8sft9scSsEtwHFSvTIG9FntoKmTgIXocTnV564=;
	b=jRDXcp/DJEZHH02wOGImsXFqciDxYfZ9mc8YPCriIjKBx1zvG61i6VBf7Qyzt83BNurxdu
	DYutg32fjyNNlbuxPsysdhkvhZ++RWvN0Uuv76ZY8pXm8mHUmBhEUZ57+7yx9taEJnQNAe
	FYctDZjcX2c3VmEdDFeKybDhlPci70o=
X-MC-Unique: -7XrMmnfNIigxKwBdAq5bQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcGpPX59oGZqaR1NQIdFDb2/3uRPlKudJOvlBMEbyLKkJKWgYKyEeYC/pAl2XvUNRaM3JzJW4KHpiot8B8qFRn+2vLJXDwrluKtfc0BM2l2GgrOKCZS+v5Zj1VzalMBuEeZ18IhJJs5gb5Hs3rSTVg2ohChGiTOmYW2I9+TLlhAlED74FgjjMJESqfeHVjmT4czl8FQv/MCzHEOrc6fPOoV8zoLG1kzWO4zVbNwsjrGV7yeJ7YXZIp9f6GQXlLux/glKPw8ighIXB8vYNc7j54y7zWMylx5TkTqJZr9doYGnAF2jv0i0Vu4Q2yjNJ2UxuMwzbkpp2MpNrTFm4dn8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFMJfLtsgAcoesICBqMP+HjYvME6QiTK/0iCNxlvy88=;
 b=WB+qM6phO/e5n4qjCW1Q+OuEJVY7n0gCxecBXnB7qj1RYOusUX4hINKwWZdslMIPSPwGdIZWNvmotyvYFXoDVsVGUMbVa5wXDVdf+i0PTUYFtzNoP4IVG2ho/dZHoap7egMH6mAU9DCjzp0z8uVL+7nW/61he7iGFu2kDK2fhHJRelrS2Vs0oP/T0vW59FWpA/Xb9Sksr4qDJWjAHQaL77ATnFEUzCHT5Ph7kxCxsynIYbY1Tb1uKYampJZzm1gnNNuD+2na5/e7D+EWNbiYZqSY0Si0u6Mjcih0YL4kielaawMbSsI1lBMRrqAyl+tr5d7i9m1AijPzsdBG8OyiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6b5cdcc-d063-5b48-1f33-d67accc2678c@suse.com>
Date: Tue, 25 Jan 2022 16:03:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 01/11] libx86: introduce helper to fetch cpuid leaf
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220125144935.44394-1-roger.pau@citrix.com>
 <20220125144935.44394-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125144935.44394-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:206:1::41) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aee2a2c9-5aa5-4fa2-4eb0-08d9e013d154
X-MS-TrafficTypeDiagnostic: DB9PR04MB8377:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8377F9F3668B6D0653755368B35F9@DB9PR04MB8377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XhuvqoirtVYZ/M5+Qad6+K/ficZcfRnDkKxgbmRnkwEgyGKRmXadRkY06YcdxeS/Ox8PFb68g+q0JInOqCWpGXzzpRz12w0HXlEpdfJ5iZm72dUmQBXwqvpTJgP4bg7RUwlmK+yddTwenwU71ha/JXTl8R/W31EyUWgtq00zxTeJvXusrWwMvVhH6ExLypR+6d7v5ygndUH9u8BeMKiMtBumcPXIG0i2E5396FjjHJ+cr1hlzydO7Nl1c+wRUyfI0FbJdPjDldKbLAgiP2HCkPUJ/30D9GbUa2QWQt06oS0vPXZf1lE+kN/MbecWSMSqm/12aHxLZE3BKbxYFTYhIeIsNPvXowmPDAcKmAggeGkEaAP1mDCW+BWBlZzqfKOkIIytpvlfIKIfJm9k/GzGRlDGtnVc29XERJ6UmUF1Ct0MSZDdIXfh970sFur9yv3Jsu/kVATtg6XYCLri5PY/iuCzQB+prErU22bqHFwmDJTrJPyv1chgltc8a0nMbbei4T2oXi+MjDDoceT6UmLY7/IveWxD++9xwAlxWGt9LUR4iYHFPtMOZ6JF+FJQyt/RVFpxFY+a8vM4QNqIuKzvh3RgNdC3MIQZU7v1rqtjUPciVP/FneF7LUSoGOuEt4Bmxg8GaEErU1uSNTUWOjdmQ9UjKltYaYSCQyJBkIwHBpA1IOUWSpJWxDvgsyBoznJM3tsXP0djgjN1hN3++6rHnrxMB6i3DXfalY+8kJXd9DQBz0iGnzKta89fRucz9Sdu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(2906002)(6512007)(53546011)(31686004)(86362001)(31696002)(66476007)(8676002)(186003)(6506007)(66946007)(83380400001)(316002)(66556008)(8936002)(5660300002)(54906003)(2616005)(4326008)(38100700002)(26005)(6486002)(508600001)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ea3gj9cBdEgzYIt0/KRWQXjXVHZgZh3D3PIP8thuYz5BWmFNoSZN6vnzUDAi?=
 =?us-ascii?Q?UQ+J4jr0owQ+/H76Zw/vjUCLYLIxkDqLO2dBR9kmNXWKQwTmk7Ky21IQ9hrW?=
 =?us-ascii?Q?d+iFXUyic1u2QqMspAzklK7Q9ZZ3ohcJfU5yxFVwm2SMg2Pl1ye8QPc3g/87?=
 =?us-ascii?Q?KECN9falpqtTwQXxMN1OgqsO2Lk6BS/N1v2Jv/CH8jsfrgmn5tNONUC1/m+g?=
 =?us-ascii?Q?splS6pELm9i/jt8x7e50ifAnWNXqSNQLf/f9VF5/6qpfEjuMYMtyYq8U5IcI?=
 =?us-ascii?Q?PzXMGVea4yWYXV/tRy3FFNQNdJ3a3Hy7FFhEnHEcw8ex/lQdTRa0CjcPIyjz?=
 =?us-ascii?Q?1kgiirrfTwTcwOoTOix4tYicKkQCEXUu4W4x1oUlzV8afaGYqYFwt+q6Lo2n?=
 =?us-ascii?Q?Rb7H9/shi9XH9M3HCMM8j/qwfj2+3ZghBsmo2NvXAAnPztq+/KsFVSrxPtgY?=
 =?us-ascii?Q?eqnILrE8ICRe2COsvdMRBj0+UtqedoueTskfL6/FfVOh3q1lvHiKRlGGyi7I?=
 =?us-ascii?Q?eR5h1mltFU8BBRT6qFNVTTvMZ20NW/hyIRlsllwzBkCuY5OCTO6TTYaUOeC1?=
 =?us-ascii?Q?3PSIfixfYtxczt/BdZVe+FWBAfdpSiPpVyHz1TvSD3wIF1dwiPcy+cWpcPrz?=
 =?us-ascii?Q?GW/IKKZ0xPwzEfT7nC2b8a5KKpnCt7Nwsdm2Kkr6TzryvUlr+urxAu4W58q1?=
 =?us-ascii?Q?J5vAGjBZefLxF45CJJUr4EzYem4eChFHhZNqFRP2sOds1bziN9NDB2MqEAzG?=
 =?us-ascii?Q?woPw4bY63dRs7wdpHQ/0/VuJT0WD3tGvhs64TXISHvTTkN7Y5OXEcPYc21gY?=
 =?us-ascii?Q?NbieoTltES4ZfhRfyvTdaIa+ztOYL40NBNuUsYZvscMkNv4INo+UgaBKGxfb?=
 =?us-ascii?Q?ydLYn0jdx8yqmdLDyCR184jSli3UBRw0QcgFr2x5psvUK3mJTXbwQs4rSTWC?=
 =?us-ascii?Q?fd7wvND9MeWJRRfWGiM4SPgi7gLtq2AJyO++kcBtBMcJizA1N6/oRlnuydFm?=
 =?us-ascii?Q?qaHuE+ZXLBN6H8dtjhyvbkmTV5JyGcRMxWo8NZ93qxDVTGoGt4OXZEpVnNH2?=
 =?us-ascii?Q?/oGlhnTmNrDec9rM1F8HTOjUHjwOu/rcByorkH/C9pryal0YfS2rkgqHUDiZ?=
 =?us-ascii?Q?kZlzWYj29XcMwmu8JV9bPsMC+PWz3wdkQOlsrf9dJmJJ7lRgLaEmyR0Zn7Z/?=
 =?us-ascii?Q?qHCd7L34UYsFOBNo/iRVxKFg03roVVrs3gxBhOTApdsmFatTYZ9eE0mluH2G?=
 =?us-ascii?Q?x+0eGL1/Mw3lQ13OdjUNKf35blG6qdJ8zXf6v65dpfNH5YUVSKa3WTfFHrDs?=
 =?us-ascii?Q?IqiMQVPE4pujlbWuGJO6Ib23CluvoqXwt1VdMqHdE8gOE8YA2B/aDQoowINN?=
 =?us-ascii?Q?B3GZoE/FOj+R3xT0ZMhVb5pWojTAED3MiKIC2Vp4gAI/AYWJcbwXirgHPZze?=
 =?us-ascii?Q?XB9VwB3Xw++nV28bDHPBQWfTT6Sjbzlh2XH2Shyt6oSZdoNe+L96gT2cl6Ef?=
 =?us-ascii?Q?+Gz65jJcWAvo8rbNACsDK1PU2xENWOWuQBpH6wRJia6Hx4ZTrae6OZ5j1mrf?=
 =?us-ascii?Q?+uXyMLZ4r1BYl6IrzcrIMdKzF41lqOwKG4gfQne3LOaU6udoIYtnWiZMLd55?=
 =?us-ascii?Q?3E8Zct/rCHucHaCd2vHwyZM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee2a2c9-5aa5-4fa2-4eb0-08d9e013d154
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:03:17.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D32c0GReN4hIEYJj1HgcXOhSzdbEOnSBmSAnwD7WsIWwbcIJgi9RjiwNPuzSbS4+0ItZuO1al+ZbsLMcEOurhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

On 25.01.2022 15:49, Roger Pau Monne wrote:
> Introduce a helper based on the current Xen guest_cpuid code in order
> to fetch a cpuid leaf from a policy. The newly introduced function in
> cpuid.c should not be directly called and instead the provided
> x86_cpuid_get_leaf macro should be used that will properly deal with
> const and non-const inputs.
>=20
> Also add a test to check that the introduced helper doesn't go over
> the bounds of the policy.
>=20
> Note the code in x86_cpuid_copy_from_buffer is not switched to use the
> new function because of the boundary checks against the max fields of
> the policy, which might not be properly set at the point where
> x86_cpuid_copy_from_buffer get called, for example when filling an
> empty policy from scratch.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v6:
>  - Add more tests.
>  - Drop Jan R-b.

Please feel free to reinstate.

Jan


