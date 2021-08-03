Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAA3DE6C8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 08:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163265.299103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAo2x-0001Sg-MP; Tue, 03 Aug 2021 06:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163265.299103; Tue, 03 Aug 2021 06:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAo2x-0001QD-J3; Tue, 03 Aug 2021 06:37:03 +0000
Received: by outflank-mailman (input) for mailman id 163265;
 Tue, 03 Aug 2021 06:37:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAo2v-0001Q7-M7
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 06:37:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34954404-f425-11eb-9a88-12813bfff9fa;
 Tue, 03 Aug 2021 06:37:00 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-2Zu6JGwvPMi9Acg_4aUYeQ-1;
 Tue, 03 Aug 2021 08:36:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 06:36:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 06:36:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0281.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 06:36:56 +0000
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
X-Inumbo-ID: 34954404-f425-11eb-9a88-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627972619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gvorB2bAKxSGd+K15aXSjgPZuo8+2gRDaoxoILDIo0=;
	b=Tj2+Pr+hHzrWtFZ3VnEsRqG8ULEYxcMJznaPKxZS753NEpg7xMrGtIjqE3WMKM/2TCbmD/
	KoMPxnqmJcuJ6Jo8U2ZvaMRqssK5kM0cYIQ+qBiV4b9c5uBBagz1oCvTdj7qrODbujPjMW
	QCc+pqlau9bYkiZq+JgycbrhpjBHMBU=
X-MC-Unique: 2Zu6JGwvPMi9Acg_4aUYeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YT2qaK3LSQdkuDunwxdlPyKeLcLxTbdWOL05U+wdxT4f6Izz0DeBJeS3phV+8Zbzf/v9FTfFN8WjAjL4UmWnGOPvKwXeaCWQFXulorDfsb/jRZXHgKLLgXZ6UqkAoTjYjFC3JZd0BgDfo46E7fdHm9hMm6M8yBw+iNhIWEjoxxZXSydHDJzhgpS5AOwZNdvX3YwS4Cij78jaNH7eoHcmI+W3Hi4d4Qd3mRD8ImoqgI5jqnLZLxcunweJwTwqV7nHt1ZZoM3s+RuEXDtt0yqO15ETVngKNBO4vvLqHB/S9Vzf3d3vNPXD5sFdZngPaqqYndyBqDzIeQs/dERDz54aEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTFbWo0LAlQtKrRXwTqchUKLUMRBYNyaswmEe3W2Z9k=;
 b=JsOqPs0qDFTJKabPKCzThLXYuLqPTlrqL0e0LVzztWUwYJg7+IhD1GsC31tBZI8r0MgO9e0ybzSkJVLVvz/SCpvHZc7vSqnAeccEXDDy9uwTnPy6DZe0DtKPhDErnLayKpXYnrltM0YwiLL9iSl12ZvSmcL0kjg42Tn2LG4UuzcJNRW0KzKQlF2eDPYZ+KKIGa+zyoD0uWV7/MggU+eMGKn2Zx6YmO+fSxq2MwQYG5QP8rmEQFTZDYjbGjCd6p1hWNqgzgjnw+bhLztU3VPpQ6fkYfIOHfl7+3GrgdoamERwT4HbGMdaCgvAf/X6Vg5A9P6K1ivK0Ja4/bhhWg/Fmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: work around build issue with GNU ld 2.37
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
 <69a34c1f-0df8-47c2-4c67-2b22abb9fd21@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28bc0732-9c20-c670-4485-8b39bc595eff@suse.com>
Date: Tue, 3 Aug 2021 08:37:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <69a34c1f-0df8-47c2-4c67-2b22abb9fd21@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0281.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c5718b-e842-48ca-e21e-08d9564916c9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26078D4D126F613B976AD428B3F09@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aFM67gIKy1WN96VcEkeYRjXAn0UDIxOG0KEs5CODMHy93mbVfVky806oMMwJ0simvtmH1KYY9tSZJVK+G+WyAMdEasDFAKtVg5pRn1pU9mwMO+8gAKR5sUEHSIy3CfwFlT3I3M85GnnuLeoYbOeTstl+hco6QEoNvX4Wero+SCvH9/S3yq83ej8eRe0Gseh57vmr2FdWZfNQwuFQPejx5M3NzVDwtM3XpiLuKE2N4DV+omLcJZS72mycujpVQJul66HlFbxdV5e991pJWH9AUYxhRlaZSjffOZpzCwwgShU5oGzvIOyA7U0lJO4aAMyV+UTaQDlt8FgwoduyruuBerm1RvoFKUOb3FSCSqMjUjG3r5kSuo3UL15Gz6wgzNZaoJO8tfDQGPO02/7UA+BQGb1Udgjq06g+q9E4LOWdyIMR9OFgskY3pJqfHlEcsSGHCmAwEvziENlzFLweQcjJQUrXIh2jbggW+Iakg41LMPxEa7Uw456RJ9IewusMjo6WPMjf7yyLRp+VGyme/tBdnGLCP29A4Mp72iJkMtqKsO9DxNJ4f7tC3ODGuPvXH4iV5WtvGlFLOsuBdcTSsPdXozHM6x+T5uKMRdt6aPxsj7Y1laKD2VF/6av9OU/A4lHHbwvWTLSG1t430V3b0RcyRmd7sPlZFCCbPxVcfu8OXKWQDUjjAzoiT/K17FOiWOCZFsWChaHs917tycwmCocibAqmgUkoQx5Db/uNyT5xOYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(396003)(346002)(376002)(136003)(36756003)(2616005)(26005)(956004)(53546011)(31696002)(8936002)(2906002)(4744005)(8676002)(38100700002)(186003)(478600001)(16576012)(5660300002)(31686004)(66476007)(6916009)(86362001)(316002)(6486002)(66946007)(66556008)(6666004)(54906003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YfnLVpq991Tkk/wRyXlyqnULCpp9YELVPMHLyrhJ+Ou6IKwPG7tMQbD4DmAR?=
 =?us-ascii?Q?3gJgxOMKkAf9U1yYaGu6HTpqrvzohTcDsW91XSdDU6NCUh1riP4ozd1D23/h?=
 =?us-ascii?Q?D/pZqyXaHBZH9VN6J+Ph2fEqio9qFRKFL2Tc/iFcb6R3rrBOM3qfTcZPp6kB?=
 =?us-ascii?Q?ROlwpB/0xKCaCznt0eIlk8ia36NWjiQ3Dw+Z1+SELuvVp9ODu9FghQk0H+ua?=
 =?us-ascii?Q?IbN1FNQYox+0tRj5P5e2Yt4/4f5gUj0fHTUW5AIvca2Rg/dZRwHpVQb9wCdJ?=
 =?us-ascii?Q?9cnkz+kOq6a4YJg5n1frrr+QbHu1+LmvhUSoytFu/bDE96IhbsBtG82E3V+R?=
 =?us-ascii?Q?XFpDBUk+PhWZWhS8q452wrG6Mn5BsfCkn4Rux0tCjFIj91YzznXvp9ZJyo8K?=
 =?us-ascii?Q?J9YRvd+LxkVbCYpbYJaetl8JzU+bFXsoAle01j/YFoD7G6TlydeHeyQX+npO?=
 =?us-ascii?Q?S62AhVH3IB1rIvQGZRmx4VLVTH/6Q1+jH3qzjOrihnxd99bN9G2IYK4/XvUu?=
 =?us-ascii?Q?j4z1HhK6dvLG96CP0KxVuP9p8JT0ggzpFjSxQUkj48heSrwr7Ecw6qlh9BWt?=
 =?us-ascii?Q?a9Xk0/JeCOTiAH+j3LtWBPSQAyFzWajRdkJJ6uyeCHikXtXyjSGZj7KJ0o2H?=
 =?us-ascii?Q?U3ngg3wVwO9TwvnMRgGbVmTq7LbjBF6cXFuPK8P8hOBmbOZ5GkkrajP9qGOI?=
 =?us-ascii?Q?TdF35ygQFK7prRQwqb0FmEMal90S5KVsPKO9D+Uky9zv9fv/TrsGCv02RK4W?=
 =?us-ascii?Q?BRfnDhcNnkgxahCvxmxWxxJ9Angsw3BDSv3jmX4YZx6BO4iHPExG+r5yIaFd?=
 =?us-ascii?Q?asEg714fGFMRWEaB27rT+Vgh+y0FNiYXyw3MTPK14U+YxyZxoFZGjqStOE92?=
 =?us-ascii?Q?9jcQ9kPAdBjSYYYJgLSoa16Dz7CZOR8W7LfmAa9ErqwyL5TuAVp/fZKVTgoG?=
 =?us-ascii?Q?X5jgs7TZse8zZ+2+dc8zHuTckQAbGw1YRIAVX09VgpgQ8LlUQZWR0b0C10dw?=
 =?us-ascii?Q?KouyHIqV60VJcJKkbdbqjTNXwbpn3tKIBSKi5xRYLfMeCtI/pFtzRUUgf7m5?=
 =?us-ascii?Q?fhkce5YMSq9eDwSpH2S3AWrB5h3N+jenyhZyScwyqXav9O6Ce4Qg0lwQ31p+?=
 =?us-ascii?Q?rUmmtRCP8Tz/4Lkh/SpO2Lb24GQBbf9YwaqXUaDCrjy1NlxcFUQ1GsX1nM8/?=
 =?us-ascii?Q?rHlQy5kQm09LrOCr64CO8wUiewk4VvbJzB/3d2GAnuJx8R1BtbljE79FSD8v?=
 =?us-ascii?Q?CoHUSV1B5tPXi7ZHlDHZkUm/F5FXM/FinNiH9aP6zZHWX/GczPEm06Z+tJh6?=
 =?us-ascii?Q?s7D1IvGqvm8KOMAHSdCI7JY0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c5718b-e842-48ca-e21e-08d9564916c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 06:36:56.5965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc9iiWf3eRv9FNH/LseUvJkxCaadCRBvs5ZUTu2DAtlQeNeCJVGOuYnN0kzzDSoB34qyjO+SdI/sCRe1heZc3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 27.07.2021 14:33, Andrew Cooper wrote:
> On 22/07/2021 10:20, Jan Beulich wrote:
>> I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
>> which broke the hypervisor build, by no longer accepting section names
>> with a dash in them inside ADDR() (and perhaps other script directives
>> expecting just a section name, not an expression): .note.gnu.build-id
>> is such a section.
>=20
> Are binutils going to fix their testing to reduce the number of serious
> regressions they're releasing?

To be honest - I simply don't know.

>> Quoting all section names passed to ADDR() via DECL_SECTION() works
>> around the regression.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I guess we've got no choice.=C2=A0 Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks. I see you've committed this already.

Jan


