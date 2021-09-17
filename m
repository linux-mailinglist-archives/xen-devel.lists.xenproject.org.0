Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C3040F22C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188914.338327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7BQ-00011X-79; Fri, 17 Sep 2021 06:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188914.338327; Fri, 17 Sep 2021 06:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7BQ-0000zV-3d; Fri, 17 Sep 2021 06:17:12 +0000
Received: by outflank-mailman (input) for mailman id 188914;
 Fri, 17 Sep 2021 06:17:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR7BN-0000zP-QZ
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:17:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2dffef6-177e-11ec-b66d-12813bfff9fa;
 Fri, 17 Sep 2021 06:17:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-TziojznkO-uiertQfHGRlg-1; Fri, 17 Sep 2021 08:17:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 17 Sep
 2021 06:17:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:17:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Fri, 17 Sep 2021 06:17:04 +0000
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
X-Inumbo-ID: e2dffef6-177e-11ec-b66d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631859427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2jfRulNEr3zGjCFpmvySCoH63JC7fzl7FjmUjzdpIQ8=;
	b=MqaeA98Q4rhzR6VB+Ex86yBEmYOVrKBD3ASetPwRIamTfreQ+UonuzRmSjiFoe1gMSIyos
	RFdWcfDBKQlbxESntH5jFY1XimvYes/S8YvGK+St9nI5x3QFFjqE4c4HkOSJeFmK6UfMuH
	80vnLIdcAZonxXVGxKTBDO00fngdJkU=
X-MC-Unique: TziojznkO-uiertQfHGRlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsjoerqQX7xjsY7AZmXcZwLnkHcunE9VKx9J4DZzwwagW/4WJ/E5rq/7U/Znj9g8+Sqw2PdImwTNDQ4su9YxUQ/zh6x4wBnYgjUy9VoSxk9RmJ3usR20GocOzr18UmYovqxogaWc8etRGS2uZhtTIg8ND948pNEqHIHgqdseHhxdHoo6LYY5A3xJs0ll4Un4kQaRylypkOmGP8n1nBuJwm1LwDQ+33OsjD4ceDz9TtL4hdxrnqVE/f9oS77DTDiEnEa9BGmOQXdQHGY3EsToLrz0yfalKV0Dv70HsPj2CpGT7cmbS7SI8kz6peosOv6EFf/2QXAtDACli/9Jn1Ptkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rh/EC3CAU/E8XbmlJ9mJqxNlOX4p+TIrptso6vc3xdI=;
 b=WD93xzn2iL6TbrNzz6YWS4x9VcAoDu5tA2hmfh4JWzUohCQAmAU5GxdsVk0+VPoLKHaJwFZsWfeYiGRBX36I2B/xWFlnrfn6eBbqJJzo/OEvITiSs/7585jbYFcSMmei/nqdg7Z75QoBcKO6H0O41Hupaw3rwySEqEXKoscyT1CON7MG7mo+6qU/eIrqtvP3njos+Snckmsv0xWmimXAEVZFVQ8HNZ58GBasVDRQHITsXd9FXtD0xaSPYaJTL6hOU8l/yI1OuaTdCdOlli6yWclHHRm/t/bzHsh/cEIcwgCRM3APgrW2TiIJY2M36RDA/vvMznBXsna6I8EuglshZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: yandex.ru; dkim=none (message not signed)
 header.d=none;yandex.ru; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Dmitry Isaikin <isaikin-dmitry@yandex.ru>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
Date: Fri, 17 Sep 2021 08:17:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a33c854-b125-47bf-7c5a-08d979a2c51c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494423C8C8E7A358E2555249B3DD9@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LiJlaa0EtDRgGiHBoPZVs4Lzy9cXU/hooOnOqsmri0gqJ0p2lXxjLFTyZNh5zyk2izWx12ZdfbCpAbjFySszmB6e9XzT/fv1VJr4uLV4RHgNFoCjGhHEd9UeAu08QCsoZYt4DS+ySEHzsHx1chYY6aM2fNKGdfUFqAnVn26caPPDbVmf8fYcJYf0RC3IuSa9BwHWcjxqxcsjiEdeVUXHr81XYIAYP0s4rxOaJl/ImZGyxw4vHhAozeQkLZxr2v2ix2e+XO+6QZkOJ/6jgr18sCUaHG9rYzrbsBsOWp81mDu2YFTyXDMdVtU4p0mejb2KzSXVoR9rVt85iGKmGgr5zCqBm0f0NGeJ1tE38anCwCC8neyBtsu1vxDlNpCg83uwM8BOYu07YeBhdrFAhIUFlCtCmorZygH9udWVrLvd36lYmK0hOwPsyNlEf7ItS24FxxGVdXDqHqOV3aYOvhAECtwoiHXFXyPdjEayDMCcz/7hF3VKXJicv8auP5+j4DutQsrQuUzTmgy2x8uXXj1DxBzEvID/82H9KG148MFECEpwWjZLtJJ15QAwec0h1mn+9qls5UdWb4o/wbOxZySCTptGbF2mAZRnCGF9c4AXwNsOKpOmao4zQ7mnlA0YkeAm+UvdghrRLl5AIoTGx+ijreyLZpfDdf+GyAuFcmoHsjA8gq3ATcNkw57GyOed6xBKZelNVwQzMd0Tv2b8rSmvEzX/QF84F7Wy/h+ef/O7Sb9R3pq5QUThTpkWxlL4EWwsrl3qyEBbTw+JW3o3ayj1oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(6916009)(8936002)(956004)(2616005)(66556008)(53546011)(66946007)(2906002)(54906003)(6486002)(66476007)(16576012)(86362001)(8676002)(26005)(38100700002)(186003)(31696002)(316002)(5660300002)(31686004)(83380400001)(4326008)(36756003)(23180200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMesRSQHt8kuPDi8Ac1lzkeQo+0dSa8c5seO8ySoOG0IRPPOsqnD8fhkPSt+?=
 =?us-ascii?Q?Wgr/chZbK2XCott7NZQdjxMwC1euTfWYkc0UA6H5FU585KffJKW/Fk8ePBcP?=
 =?us-ascii?Q?RfV5H7aglvuPjmveSGvHw676zBoFPD45qyPGf02PGCegzZBgptRd578bz6bU?=
 =?us-ascii?Q?hmluINxcsSYg3Kgkkt+jYSWbD1dJ7h0Zp7IqWhBL4f7jtxvmaWXr55SgbJPh?=
 =?us-ascii?Q?nWEXsDdAsAKshSOhdDGlu+O6cIvIRtRGr4FbVPCTNNLKG/eyDGTSRKj8lrNY?=
 =?us-ascii?Q?JYwob2I4pNb+vWxL7DJSZSjctZCbSb6BsrqKuggD+DqTR0C7oLBalf99f2yi?=
 =?us-ascii?Q?zFPh/OEen/DUPLdhYZ8GvzQeqivBoLjSg119Kc7BzXkVlOujNMDnNWhoxPg4?=
 =?us-ascii?Q?LTgNfHmtyrndo0gvXgcUQ/4OawJQ3xvNeznQ2FWnfWZg+/fdH/q4mTLdO+fE?=
 =?us-ascii?Q?GE7g4CGvuJYPR4htYYTB6lgJldRFn01KjL6BaAPGQFy0/uL2VNns2mwlsTxv?=
 =?us-ascii?Q?FScNP+HzGCkO7f5CO8iJZOUGeDA7RWquEnSOJFDa2ZTqCO3PaizVmo3FhYt9?=
 =?us-ascii?Q?IBHjIox33F/+pk4IRi4x29y7VEfv1qxjYG88LYs91de0i+MyBMVzaR6pbGPs?=
 =?us-ascii?Q?OZcFMJc/KK796hVVA6qMHgaRIzDyeIEdW1+yf3isHVuJX52lRSVv8Js0MWJ4?=
 =?us-ascii?Q?ofzy4xZuAVL5yT/nf0lupT606CxWsLhpBROaKGg0M1inOY6MTMulE1UIXRXo?=
 =?us-ascii?Q?tAD2YAO/qkA1TCMDiMxZkwshLabKmv97sY/FZXjleUVaFJVQqD2He/Hq93hL?=
 =?us-ascii?Q?36a/ovvm52ea1lmWsytqMZ0EnHcpRLoqu1gnlRXf2LoCgFNorl6F2/LnbO6U?=
 =?us-ascii?Q?czXU8wifvGmQOFdpprDc3JQU4VgqQDnglxgH2XVkuafnMGVjmeXyyz5rtEEJ?=
 =?us-ascii?Q?9rF5u/wyde3evtEKQ1+3ICsgp5T+Z4kBWisekVQUMSLl3Ehc4j3V61EXZSHt?=
 =?us-ascii?Q?JqI8KLOLN7LIfxMR64IML5tXS16PrM7ZI33lrfhtep46cN/NHwuKTQw65bwb?=
 =?us-ascii?Q?Xpzv88I/lYluQ883cmY6OkdIXZrT8v22bCpWNnhK3M8uOUiJ1nhBxR9l5xCJ?=
 =?us-ascii?Q?+Xb1H7T/pO1cugn8a83dMipgUfYRimNOrHIKlnhxW4R2Rn0fhFAHGyPS9jaa?=
 =?us-ascii?Q?wssRYbMrHdJ18lb8CnIVKEA2UEGU6P93dyzhPvTQEQswmNRzw7f9NIuqTp52?=
 =?us-ascii?Q?alSitj3u/bbJy2NyZHrp29WySIyFEnA/MJ/rZ75cT+WQE0dKhf05wSkNh1JP?=
 =?us-ascii?Q?LMHo4aPsZIxmM1GTdxoh79Py?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a33c854-b125-47bf-7c5a-08d979a2c51c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:17:04.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09Wou8mrFhgA2z7b4UCdUGrGRTWqBj6B/jUsaqJ98N/XjFBwKIHquepfbvferTBpr6oQNx+wK265j528o92TmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 16.09.2021 19:52, Andrew Cooper wrote:
> On 16/09/2021 13:30, Jan Beulich wrote:
>> On 16.09.2021 13:10, Dmitry Isaikin wrote:
>>> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>>>
>>> This significantly speeds up concurrent destruction of multiple domains=
 on x86.
>> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
>> improve locking during domain destruction"). There it was found to
>> actually improve things;
>=20
> Was it?=C2=A0 I recall that it was simply an expectation that performance
> would be better...

My recollection is that it was, for one of our customers.

> Amazon previously identified 228ab9992ffb as a massive perf hit, too.

Interesting. I don't recall any mail to that effect.

> Clearly some of the reasoning behind 228ab9992ffb was flawed and/or
> incomplete, and it appears as if it wasn't necessarily a wise move in
> hindsight.

Possible; I continue to think though that the present observation wants
properly understanding instead of more or less blindly undoing that
change.

Jan


