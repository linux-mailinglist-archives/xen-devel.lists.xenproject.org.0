Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D1467645
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237397.411763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6gk-0000Jz-O0; Fri, 03 Dec 2021 11:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237397.411763; Fri, 03 Dec 2021 11:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6gk-0000H1-Kf; Fri, 03 Dec 2021 11:25:14 +0000
Received: by outflank-mailman (input) for mailman id 237397;
 Fri, 03 Dec 2021 11:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6gi-0000G0-Os
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:25:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ade10ce8-542b-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:25:12 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-ELRM_cNLPwyLocTF4jhw3Q-1; Fri, 03 Dec 2021 12:25:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 11:25:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:25:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:20b:6e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 11:25:09 +0000
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
X-Inumbo-ID: ade10ce8-542b-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638530711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOmI8Ih5PM/6pBakJPiDAUUNfeWIayaIXjU/j9/N+80=;
	b=O/tzcZmgiZXnn43uRNNs1xacXMD7V22J/gN3AhEW5YunKixrsT6GHdPWh/dUdeOHYzQE33
	L+Pbo1OOa82zbPmMnF05ed1HQgTX/vjRXnpThYZ/vHfAZnDSWA4Rt/Fe+wj05nfahUUaQR
	0C0kkMfL/N/eU+pstjgd6Sbl7g0RLuA=
X-MC-Unique: ELRM_cNLPwyLocTF4jhw3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUofhmL8p4U9VS6pWFl5oGzXMn7KB9WgqGCJVZ2r6D0FN7U580ak9rgm9WmRO0o/LKhiwAKKJgSOh/Sa+47AUWqJVG51WQZsuxvcgtWnf8Lji0lzoWbi1uw9/jOVwv6I1hnEYnCXHe3dOzOITesKUTYXMI94A+iHHeYVKpZWgJ3KQMIZAz7R0/zUi0+9vXxA/Bdo/hmAqmPu1p6NhU3F7KsHh4nmTSResPciPwvXD0Jav3T3kWUMZ+wqeikyXi2lwiVDtgLs4v5zqSO6cgfU4msqb10BFMearyIfnyLVvnnHcAX6/PB0TyfCLf71ihmHCr+xTyXNllRzSMNu1HS4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcG6n8Inaqi+6Glj4y9+FfnxSpvy+Xiyjo8nlMWC198=;
 b=UT1yTV8Y3Bi9hCTT/bIkORorjjRdJZ4A7wtRDEHXB64aVen06RpMb6PLrrospFfjNk8NouEr3FY7M0oSyUwe7XODSTFcr9kwNT5vMaBocRczqhvbHlziiHKu2Dzd/XJXn5fVisttcCNNVE6mYoL6ptEHXr0CRF+dd2aPKZN6SxM/RXXGwNLlQFhRAgYskylpWp4vOSkWIz8AqjXY8pPO8bGHoiRFBp/pNcNBoNeDoqhsjayhvqaG6RsoECs+APnkB7YUwc/xqfih7K1rtmdPU1iLpOKu7vt02239FXzTb//O4y2hH62aX4+iQUkaCv+i+eSCSe88NANeqLOuECYV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00c116e8-b3d4-bd78-781d-21a4057e989b@suse.com>
Date: Fri, 3 Dec 2021 12:25:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] EFI: move efi-boot.h inclusion point
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
 <8413bd97-90f5-1b9b-9090-d9fd3bcbcc66@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8413bd97-90f5-1b9b-9090-d9fd3bcbcc66@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd4bba9a-bc23-4e03-b831-08d9b64f90c0
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375C552CB8712BB550FD799B36A9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+qBAJqb0tyo0U6WyMsD16NiY7mikkbUGxQZIgoQiiJoQiF+pO3lNI5Ul4RO8p/xUZ3UHNwfFOrz2YvpmMWcCTDkNgBtCKnR8gfB/w1KEbzoOaF2ZUvnRO92PD4R8Im/42vRljWw9iLrnsrfwAcAmIGD3typmxs63MyrrcMevtXk658ghluIIDId0RAjacvksuekFlIrd+J68ZSW8iLmFDTV91rdVwDpX8QO3G8dzh1ddpwKMWyDgNOqCEPx6i+WMw74txs589Osr0Nmzwd8BRVZo/wtnR/U86H+TNby3P5hTAMAvSWWLsipfp3vx+wrVrTO0kyw7L76X3VsSO2sJIR+T4or7A9jMEYsLdfEYb4sh5EYfz13Oaq06UCc3fRet7TZd5grc+IVilmu/TqRMtRsvXIS16AQwpFUTagvm2V9OUSdMttU8brU+4KkIUqhNotVhceECU7ps95hL99QhdHNw1rpSlZNxyPDBwGZFsE3tRdBN3yxmYoltj7V2wWdk3ebKeDskeEx9Oph0wnJ/rUd6dgdlbTLnJoydAiKWbXvhOTynaowg5JVYI7giQRswPLPJpPYQD+aG41Dld7DV1quEhcKT+0nIUMIBjzyqSEIYl1FXfRvOkm9qBvvcpqh1EYmUauaHrHrGQuc9WvSaTgyQfOfazNfAywoozDtpjkdTio2W7sYdDVq8uTIkebTUgMSvVRjUOseHK9w8JWMxyy9v4OKjzKBQjAiiMZwgDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(16576012)(26005)(66556008)(4744005)(2906002)(956004)(6916009)(54906003)(66476007)(31696002)(2616005)(316002)(66946007)(4326008)(508600001)(38100700002)(8676002)(83380400001)(5660300002)(53546011)(86362001)(6486002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlCgo5AUf2F8MDdIMh9T/R+rAPxFXUBX5Wwk9lTRray4hvqaP7Y9Qyvw2QnE?=
 =?us-ascii?Q?2bfgvblkwAVaP1Ijx1S0ir7leccrK+ewCTat19EC0QWlmahoTaWr69J6dpwG?=
 =?us-ascii?Q?d/71y8qP8UOeXkQknzb9NqoysE8Olh5vjt2HJOJGGqIvwAeVycs6+7bljVR8?=
 =?us-ascii?Q?GbHxNZhGT6ruE/BRDMwsGieLi56p0rEbf9Y0G4iBvLCC+D9m7XhBnWDxoApT?=
 =?us-ascii?Q?Lox4/umNG0GXWs0/kICQkXNT+mPIymYGZn/9h6LtfF2/hlpokz053IepQPC4?=
 =?us-ascii?Q?ZkrPBSLKkC5/CJjdyhoQneGlfoZdf4KlaoT9LragjYV2vX9TLXLrO0Dt6zng?=
 =?us-ascii?Q?g9Oi5rDX808QV5oY3/pYn5ojdIX/s5WByjCrKUhDXHnhe1Jj4e+LF4ScXX4K?=
 =?us-ascii?Q?b6kdChOGsnew3qjniwH5i+rWD6aKN2QIm8Z1LqpjH23SYY8h9uC/Sv4rub9V?=
 =?us-ascii?Q?4bi/7syL10GtGaZRuXETCk9an+ZUIYSTW3UMkQy2DOTx2b0FTNUG3IUkqoiG?=
 =?us-ascii?Q?63BALlOCf87ztvYtEfq0KiFjBPRNePbxB8tq8zDsYHrAQJnfE68Lns2t/zjX?=
 =?us-ascii?Q?MtxnmSJ/FJhPFWihE7SrsroEz90DFOun4YWVjIlhMxWlhBX4u7+IxwxacWwO?=
 =?us-ascii?Q?HIjq4PwYKe+z5KQSV31o+y4w9CehhNaCFTMFGQhVPzw2B90iblmw8gvkJJcb?=
 =?us-ascii?Q?O+djhz5Tk+KS66fn4algx+pGtx8338VZKu1XV8bh7ApR60nvdd9HNYeMvSYP?=
 =?us-ascii?Q?KdqOysCJnXObqxkcNnH3cKl0FITEDnAzx+RUp5M+Y6+K5AhwbY6IEyUsqJ0D?=
 =?us-ascii?Q?Cae7Gf9JVv38uRlSvbbLp5SrcEHAeVjGO789lMfIvWWK6AJpQwYPcf4gJKlh?=
 =?us-ascii?Q?D9ikFxWzDg3PFwTyBJKSZjFpAvm14PA9kOuM8Q56GKPfcFvYUwUWvuGOlNwQ?=
 =?us-ascii?Q?UEGAeCp4BQHDuAF8F8OcA1WCu8PeyFhp1wnF2HgDrZPGfCZ7Y4hSWGBve1+W?=
 =?us-ascii?Q?l+OuNG9BGaEsZEOusRI1aDBMFnwzz69PGD3XOiiFotBrwW1QlQ/yHxad+e+4?=
 =?us-ascii?Q?DglHL0hxcRMVNlBHqT01qz6wbesFht1VZS7/bNA1RKFMgjzzRLaIDp9PfDpE?=
 =?us-ascii?Q?/oJZSH6eJbHf9aeiEL3dN/OyzEtrnpHnmdR6mZDAk9/AOPQRMZluRNBHqOjW?=
 =?us-ascii?Q?m2cRkNAyfQtpP0QxWwczpC67arPtZSPxU9Y0FD5ri+qPUYDsATBDgE1e5wwz?=
 =?us-ascii?Q?MwsDbnWdhzbBELfWsKjoogsh2Im3p8UuDZG6NEiJMkrCF+hcWU7hrT3FK9hx?=
 =?us-ascii?Q?dUNKgI+rJKYjr7+1lAsT7soWhEDnAt1fBwzz8SR3I1qnCQbqUgmeEznJhhNZ?=
 =?us-ascii?Q?bS8GEUM60GkUNJSUJEr9taRznokJUNf81xNaUXoxjHs/oJf5C7iKsDesPff1?=
 =?us-ascii?Q?w07UPNLDdMS6vdyDf4LiU2P8ngAmbg0BSl6nTZEpjTBar26cLGZsRPua5AtA?=
 =?us-ascii?Q?e91lZJPzxfSnR/kRGLbhFbGxCKJ/nogc0lfFrNKYuxOuv/pchCmgYBd3DgNm?=
 =?us-ascii?Q?h5ydj/GBaYOjbx2K8oLWDn5XDZuw5zH7mIkfz5sL2zFZxrF/XIsLRqqWaE4s?=
 =?us-ascii?Q?TqJTIgB6qLMmBAMfe5UYqaQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4bba9a-bc23-4e03-b831-08d9b64f90c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:25:09.8245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrShAkS3ulHkEytXBQTYoHJJgj/2i4KeH6ugN5yl5OXbuU4WLyDWaUM2iNg2DFGkfdQwhvGcbyRFN8YoBDYMyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 03.12.2021 12:21, Andrew Cooper wrote:
> On 03/12/2021 10:56, Jan Beulich wrote:
>> When it was introduced, it was imo placed way too high up, making it
>> necessary to forward-declare way too many static functions. Move it down
>> together with
>> - the efi_check_dt_boot() stub, which afaict was deliberately placed
>>   immediately ahead of the #include,
>> - blexit(), because of its use of the efi_arch_blexit() hook.
>> Move up get_value() and set_color() to before the inclusion so their
>> forward declarations can also be zapped.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Why does blexit() need moving?=C2=A0 It isn't static, and has a real
> prototype in efi.h

Oops - clearly an oversight of mine.

Jan


