Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A50D429FDF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206906.362591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDAb-0004oP-Ca; Tue, 12 Oct 2021 08:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206906.362591; Tue, 12 Oct 2021 08:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDAb-0004lL-92; Tue, 12 Oct 2021 08:29:57 +0000
Received: by outflank-mailman (input) for mailman id 206906;
 Tue, 12 Oct 2021 08:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maDAZ-0004lB-PT
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:29:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92ecb6f2-2b36-11ec-811b-12813bfff9fa;
 Tue, 12 Oct 2021 08:29:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-8Lp7VwHvMwOkquJV_Vl9vA-1; Tue, 12 Oct 2021 10:29:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 08:29:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:29:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Tue, 12 Oct 2021 08:29:48 +0000
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
X-Inumbo-ID: 92ecb6f2-2b36-11ec-811b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634027393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CoQlxc2pXslrQ83VKgQjeoyEexGYt+PzcmC7VDLMAbU=;
	b=L+TDwes85K81stIl4wEiY024ozzmVlNLIH8/2/AhG30ZvY4jX08uikppPFejG0RoRWN3Dg
	aI7yUcbAQUy6IYVqqAuAbx+BUJ8mrqjp8QzxXR6K1mleE/s4h7dv6xrynmiG3TdumPQzRc
	Lu2Ae+0k8mTi+SLOA88d/C2EsXAA36Y=
X-MC-Unique: 8Lp7VwHvMwOkquJV_Vl9vA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b648thI8HlwTNvTJT+fKwzU3PC7L/g++UvRAJp9Lc54VdXUBCLC76fFjyDSAp1P2whQmtM+Y0lnewd4d9S9Jb/tyurwbqZ6rNDXbQmqYApOPEpdZYyDJD50GIgkXhAh+EorYg87mq+ml7PmAlON9RLJ42KzSkpjMArKk6oakif0mi1KWzeIIhoKmkUAy3gT7vxF7KjBmi4e+jC+YasQco44EM6E5sKXlq3SAtz2pDE78jfxIHOCQKmQUOl61MdEQOWTPKBVtlWgRia0b+vY4ZrQkieCoKb7J6t1RNF7s56OZfNbwpgy34GWlHpOBlrPaQHOu4UDrx4PuesOzk6BshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmcOL/lOL1QTNko6R0vSnQ0zydXSr2pqSTo0WVNFneQ=;
 b=ZdaYNfjVUU8UNl3oF4JebI/qaFOCgY2NER5o5/zjZ+Z3Qw24kn4aOWM2tT5dJhpxwNeHfpiYr1CZR1i3fqMT1DAZjwVHY3NJbCp/r6/ZJejroqj0b+rclOyvpVNNNuZaY5ehcO/wV6o4DaTe9uGlug9EP0ETTd9ZDZ4UagIg1Z/NfaJ/QlyieyJgmEiunmfGvVQzxXZQ1Wm4zZWJG+6JEehHVwEznNs6GkiR3hSjBo7tja3f/bQvi+Fu0TgoDObpQBIDYen6fe20ILaQ/V3HX9tYLCrKTN828lYe0goOknHI0tFoFUTD9pkCKz1ph9SD0dw9X+k5pKNuQFUOI/ZBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
Date: Tue, 12 Oct 2021 10:29:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc7c9813-f2f6-4b40-caf9-08d98d5a747b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438176882A857E61C2704E02B3B69@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G15zjZDD0EZ8plfUUSfvtOaxs0BBrQdF9wDfYFQSUR3zK+oWt2cdK4AOGUqwprLB+T4eOUZLGKsSreN8hyUuZOY4VOyVutq+84T/J20w60K+rzimrsJQziD1Pm1HUov1a9uuLjrWhLt8ezcz41pYoFBcjrLpMOj3VecXa9Z2RNxFb5ZyM/KFnA8lALn9Ix4FnxKpYcATRZTJfT30LBZIJXYVL9EyYui0y+pAKEIgSDN7Rkwnmwt8++YmezRLpV/2mXmj8xTeduvrjjt21tBgPXhQ9VCe7WFkFxhKQElc9OOgZ+hbGicGmjwyT3OjbE2otsg3hbgJorN9kLkInYMH0G86EfQpnI1VmnlmCm1LU02zvLftr6+1JVKYyu2zAi35y17JomlfUmy/RdjD042iTtvCwiiM/H3Yb55qfVB/lTuEOtAigoMTH7iM+vwxSjtZvgfyJvrM/qw7c9vfrlkQv2QCoO8GYQiGbSnqxJZeA+GkE2h0NsIJE8+wUGnztBhj/cHBIbRg465at2CNkxNQPDyCWGYWzHe6ojeSYwK+7xH8eOkk3Y0K+jhraw0Q9219aZlVlOxgjsLGbqDL+SmFcdnlL0nBMNodKqooYrwbt6VAxsbJmRZpph7IepvRutLMoxJVMxNJpU+kxzEcFp1CT4/C6UUVvZL0ajMCzYjc5vdIKx7P90Z/s4+hKNaEiUOGAzFUhx1m4arG1EeGmEMqGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66476007)(316002)(956004)(66556008)(54906003)(6486002)(16576012)(66946007)(8936002)(5660300002)(86362001)(8676002)(26005)(186003)(38100700002)(6916009)(83380400001)(53546011)(508600001)(4326008)(36756003)(31696002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NEEWQliKOIDElNLHxbE7AO00NrRJNpw/h8VfHJj+RaFJ0cO0/q5NKHSUJmRT?=
 =?us-ascii?Q?EPnAjWjV4sAGeCM9gmtcIyFXsRP2jLTFN3vxbhd0IwSEDrC9xqyHKO2xiq5U?=
 =?us-ascii?Q?my0OusoJwwAUYKxSDZH3FpYi6VWOAdfds/zxDu6ssjooBIE/Xv7zyCu4nPn9?=
 =?us-ascii?Q?SFYwYZDaCV/CX4QHfo5ON40s6QMgkzKYmcpW2Rt84WIw1ICUP3KMsmSYyOgC?=
 =?us-ascii?Q?Nl3dP/EgFHxTNAq0aIksthAFcAMBLQ15mbEWs8b5MkPAvWWAJ8F/7FaixXLd?=
 =?us-ascii?Q?5NDCihxYfT2dQuJ3aVC6rLt5Ob3PQGSA5Ck/ZSB3C4G3zHM+IHolI3qd+XMd?=
 =?us-ascii?Q?DlIW31VINAuc7S5kvShNXbJOPGeFzGjSEifeLnZB4Ycuh856lzmZcpMrlMKN?=
 =?us-ascii?Q?xjZ1BAhgH/gy1MZObw1+9VsmnLbHeqTtHDMEjElUyp9DadRicMDhr2PucK5N?=
 =?us-ascii?Q?y3mOMdVsz5nuIXi3jrC49S8fXpsKppmUyJbb3eDQ7pzAdpMRarbI1GILlxvm?=
 =?us-ascii?Q?GtmRrplnbKNhtBw6dYlswx/0G2s6YCFkZwNPh3Iyr/aVeNRwZn5wIwAVEO0L?=
 =?us-ascii?Q?P/4Vx8eurV3319nfiICFrUB/fbWSkdr/xRBBQrV7swYQnLn2lCT+I8Yc4nxT?=
 =?us-ascii?Q?asSTgdbtHK+kYjuKiBXS8uVF31kWcQQa5b7rinisq9z6kN7JHXyKWOCGmVkZ?=
 =?us-ascii?Q?nQv3tz5kGVyKBuHWIIxwy7dMsWonGyc9ixAPTJ3vGK/w46rjoQDrtAAi5eH1?=
 =?us-ascii?Q?2kXNydvLN2ugJvSpelbapiKkIbMkXn3GD7jLSDkfpeOcYsNKinfmdYrylif8?=
 =?us-ascii?Q?0IChfEbzQiSxBkYDOFmr6Z7VpZzsAN6tH3gYFmXxPmKoAuX9kH9ZOwJmFYbo?=
 =?us-ascii?Q?1VKW+Ek8wYIt8mmzu5QapxvqwSnusvkXA2amJIRzFfaHKnx9S9JrhGvA1aAF?=
 =?us-ascii?Q?DR7SDunsuChta0NNvk6ejesjbe21s4ZVlOkAgjttc0bNwI2uSYOMWhqrt5HQ?=
 =?us-ascii?Q?xEcWDDAYBS3OZW8Uc4+kDzVsgQXFJtb1HBHotE561BU+RgQ4Hl1PkvoRYniT?=
 =?us-ascii?Q?eD4U2Xg+pvj0WFUXJVHSMoxt4Jws7jE1CyQnibV+GNKtbTSXYJf3tj3gJkSY?=
 =?us-ascii?Q?cJgaDrc1VNwL80GKBSA6c1J3xC93qkiCtlY8eOcBoCIRLzIlTH3+FD9E8Vox?=
 =?us-ascii?Q?dnXAef0ypAs9tpP/9afx+LIvYqkL3UiKRt6xNNV1Adh0Z7ZG9+o3V442ce5U?=
 =?us-ascii?Q?nsGWZoBVUZuu1uw0KY8ieXRFZUGBpGN99fGTZM/y5GFjwsJyJe4P1Z3AqBRR?=
 =?us-ascii?Q?eXx6iAq6BPbpnKIitdxbUNcy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7c9813-f2f6-4b40-caf9-08d98d5a747b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:29:49.2677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COKIUFKyOO1gCes2bFqle6xbdSe9uMzjfV34h3oaw/mEUlV5DC4wwjFLCwWEw3kGGcQ4TLtDhSVqvqG4dmYonw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 11.10.2021 19:11, Bertrand Marquis wrote:
>> On 11 Oct 2021, at 17:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>> On Mon, Oct 11, 2021 at 02:16:19PM +0000, Bertrand Marquis wrote:
>>>> On 11 Oct 2021, at 14:57, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>>>> I think the commit message needs to at least be expanded in order to
>>>> contain the information provided here. It might also be helpful to
>>>> figure out whether we would have to handle IO port accesses in the
>>>> future on Arm, or if it's fine to just ignore them.
>>>
>>> All our investigations and tests have been done without supporting it
>>> without any issues so this is not a critical feature (most devices can
>>> be operated without using the I/O ports).
>>
>> IMO we should let the users know they attempted to use a device with
>> BARs in the IO space, and that those BARs won't be accessible which
>> could make the device not function as expected.
>>
>> Do you think it would be reasonable to attempt the hypercall on Arm
>> also, and in case of error (on Arm) just print a warning message and
>> continue operations as normal?
>=20
> I think this would lead to a warning printed on lots of devices where in
> fact there would be no issues.
>=20
> If this is an issue for a device driver because it cannot operate without
> I/O ports, this will be raised by the driver inside the guest.

On what basis would the driver complain? The kernel might know of
the MMIO equivalent for ports, and hence might allow the driver
to properly obtain whatever is needed to later access the ports.
Just that the port accesses then wouldn't work (possibly crashing
the guest, or making it otherwise misbehave).

Jan


