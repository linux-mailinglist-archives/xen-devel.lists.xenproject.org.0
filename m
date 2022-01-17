Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90283490796
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258141.444231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QbG-00076J-9B; Mon, 17 Jan 2022 11:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258141.444231; Mon, 17 Jan 2022 11:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QbG-00073N-6D; Mon, 17 Jan 2022 11:55:02 +0000
Received: by outflank-mailman (input) for mailman id 258141;
 Mon, 17 Jan 2022 11:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9QbE-00073H-OO
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:55:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bfca6b7-778c-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:54:59 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-Pnur6eeBNm2VAWP-d7f7fg-1; Mon, 17 Jan 2022 12:54:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5291.eurprd04.prod.outlook.com (2603:10a6:10:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 11:54:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 11:54:56 +0000
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
X-Inumbo-ID: 4bfca6b7-778c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642420499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tF7EoSdsXN5dsIB2FlfnzPAzm16dWjtNWjTI1dg5Vho=;
	b=XyjMsxVcrWNEoEzNeW6Dqr0jTZBiZ7veU4srdUGuyrwPDdskwTMnjQ1WngPKgv8hqxFerF
	Yl6t4d+OUsMb5WXzQl71mb+E0BsJFoaa4qkDlst6u1ked5cDNXPyQkNJ6nM8LXvi3/TSpY
	xRG15OIlcYWRIC0yC5UIGKjgpqctZR0=
X-MC-Unique: Pnur6eeBNm2VAWP-d7f7fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDhcGG+zVE1urjdJ6YoCClkbGf58EICEsaFIR3oGXd2hzJwnezD/TZnZI8ZA3l4bDwQsqxI7anVgj3UiWJUSww4HlFOGjwXUzgo6UddyTJNeCI3HiaUjIebyPefTOgc04UOM5DD5yu7lapfxuHlM1ipZCjwjpvr82P0vz9jnMdz/djKl4a7jSQY2KNT/Z1iDuTsAmFihPQQosrw0F/L5SZl+CAYV6QaIb1PTuyz7jN+GaP01S120RrgSPh+3YVKDCT6zqcCGXX09N3hWFgOTQ2FjuH18+e2EOWSjaFKabm2sigJmDh3AGqOggvRtcFGi6j8eFcdAZLfbN3RZE063FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWxoo2cH0Hp918njVehIXs7oY7R6eWjY8pcibjeLxVY=;
 b=CZ2Wha5g/oFfaOciQpyhUxxb4nsI2Pdd/zaI3LtQo5VCychfnidZLy/k96rtwLYfUbPNh2S3QcXJWiDfnHQR+BP0/C29/qVGFdhWYxRSLazqb4oV17kMfiEZ1bQrVz4rKc8fOXb+wnaA94nTx2VvOYcHT2UscZgzHiMXRSU4vGOyn8H82HT6BVFle8GA2fny0axTuSoXKxxg6d3++b1qXApKFK+DaA63hSupS9WrEa4uk1zz+cZ+LYbv2d2R1aRuK72F8XJiwBHgxNX5OXGvLWsTv1vR4cHdB1+CGM8racBqVfv9kZZ+do7Hed6Ce57zXFeDE/horenKPVp9KeQDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e25ea29d-d306-94b3-8659-07457fb1c498@suse.com>
Date: Mon, 17 Jan 2022 12:54:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] x86/msr: Split MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-2-andrew.cooper3@citrix.com>
 <c060f55e-7b18-b559-f703-b3aace50f438@suse.com>
 <63a36178-7ccf-c682-bbc1-5a9f812a47b9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63a36178-7ccf-c682-bbc1-5a9f812a47b9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:206:1::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34051d27-dcbb-4a34-ac93-08d9d9b02e49
X-MS-TrafficTypeDiagnostic: DB7PR04MB5291:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB52913B9A0BC95920548BA515B3579@DB7PR04MB5291.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aiETHE+cFBZMiGcABPUftAXb85jEDzPPVzBXo+/mlAjG17S4g8ZPuDsMdueJVkEXJtvg+ssZiUAzw7oFMBye0muCcgy0ZoOco6vBWBzuHEtqJrZx2m0MdI2ezUumkqXvU3iOyJtNMGmM14qQuxQfOBN5bepySUcjUMZIrWaNFcPSghBrkKafdjVonJ6w+47kWjrienjM37B+ZbA7JAoH/hYZj6qPNDJMSigIXBNZLvTSD4xjbKgixtTHKtYsEB3kGj1aH2cKT7pAo1iXomToCNzfr2uLL4b6oXYGyVOV2GK72eUfJ8kJzk8j1o6a/anCDVUfnzqkaJmHcvGcODDrA/pNP8kBkD88nWTliOyMe18osOzRv2VjPX/1HKjxjlhNKbMv5jo2ak8tyCSYxkxNO3OcjvABuiRxGxe3cTU0iHzhzmKW6a4q0TtLjIA08kDpUD1IMzCzXWr9mtVuknUesv6eL+6y7p36ietnBqo9J2Q5PmCwkgyPC7o9VEcojzb/WNLks4x3+fScSiQY3klvm9nKI9DhaU9fbjCvxd/5uaL8+HYQQefcgye+U6jTqalv7XlXeiRn3ISo7HeomD3UM1gh7Bfca6y15tqsKTzBZxc5CTiLk7imWfM5UFE8M12+zUvyztUDDbppflVyxXBj0gzXosoUqWPH5iszc0mshQ3nMbQFuJK4P2RtKL1Ok6TEJfvBFsVBDKEDIueQ1pzqMZVRQ18IWW2YzGZz3qvY2q/rV7yWSu6Yjbk2PPNteptO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(2616005)(316002)(508600001)(8936002)(2906002)(4744005)(110136005)(31686004)(54906003)(66946007)(4326008)(53546011)(8676002)(86362001)(83380400001)(31696002)(66556008)(186003)(66476007)(26005)(36756003)(6512007)(5660300002)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UuFkJi/MNHsOV4Qgg7hAVMzbqJ2n2X9vIT/F3PmN7tLD+phmWE70Px4afvyw?=
 =?us-ascii?Q?2TYiygxIq5DB7uTWe4ArgfbxNext6CZ2zEDVtzD1ZhexRXvpFGSN80ODf0N2?=
 =?us-ascii?Q?haCNmso7yxtNUXr7VidGx/cwgmkwrhZ4n2Ukhh7H1JFmDYg5o1SLk/ZbqNzp?=
 =?us-ascii?Q?RMDFNfoX7tDvfEpPffLStW+6OiQqC1Q2nGqJ/2kDSGKaiUaxEuG+5UHZKGPv?=
 =?us-ascii?Q?jGAFeHgyZVm1yTXIr8vKwos8XgR58biS88cj2A9WDvOukKWN3dCvu2S+TwlP?=
 =?us-ascii?Q?iw9H1kf/ederw1J7vfBRvnTNeF1vX2OjJFs9PFN7XUpTPevm7uSiU3rjohdQ?=
 =?us-ascii?Q?on1vWfC5azzDk7i1veme1CFFlt1Xo5aDhLg+ltwRzvMIgeFDuyppI+iV1Zmx?=
 =?us-ascii?Q?uH65QfgplfoXvliIZd5IecHzAd3pL94rcHQkvu5dzDcP/yTwOGDuttZwRDmx?=
 =?us-ascii?Q?OSOThjxRjZ8xkSoPzsWxRCh6WyFGiMe4R3Ncq5FdvgAzAg4KhGjYy2z3QvhK?=
 =?us-ascii?Q?MfkUkV6AaFkU7xsm101V13npTosLR2/BaimjZ6/6tN4gj7Hkc1Xc9d6nG3Oa?=
 =?us-ascii?Q?np+mi8v3YZVOdZNQoLKRLQRZIKCZvOdB8gIjqpbcldybtR+Ry5mDl+5TIdIC?=
 =?us-ascii?Q?Jm+Lefjz66e3epotHH3Wy2H7RNcks/hd7zdo5S1LurAg/gzpvaBKVR9akAIo?=
 =?us-ascii?Q?rxHDW+UvYI+bgNXZyhPqJHkw683QHEcBqcMldnKIxypkSFKTMkLF6Nb5p6P3?=
 =?us-ascii?Q?wIMNEHJmp5RtEx5eodSrd5gIVwpA0GSYmEb6j4yvOEOtcbJ99svFqQQxho+t?=
 =?us-ascii?Q?LItCaiusoP4FsDZauk+9rh10pTU5DDMwCO1dvcN2797XnGJgZQSGUV7e5QW8?=
 =?us-ascii?Q?DHwNwrYu2W81H9XUbXQfbON+GeweTvpoMDVmEQCpm+wag+Jpgf453VLMgyl4?=
 =?us-ascii?Q?/v2ag3NVNdsXHK9Jx6SdP7W+4o/ZpP+TnWADKyDRH/Umc6KS1k9mQEDKIwie?=
 =?us-ascii?Q?0cYDqixVMqQqsMyf2ZO1LC+B0LeL0WiBmtcZaDYFjqY3KqaaNluka0y44SEN?=
 =?us-ascii?Q?nNAF3DJTFTFJvAHJlqkP+pCjJeL2Ry9MJYYuKGqQ6KHLvAyZhPMc1DaSxjsv?=
 =?us-ascii?Q?sdr4pJ1Nj2SnqdZZ9NKC73ZHT2uIimspyVlKFvkHYuZO+uGIv7nsCetGanf8?=
 =?us-ascii?Q?MYi7T0HR1/blr905V/MQAFnsrA419b4A9eiwTZNz0C+K98OZp+ikjLmbg/hP?=
 =?us-ascii?Q?QFiNHz6On5gyZXY9g9L9r/jmA0vlDLyKAbWpIxtRrymJV9YLHZoMg0O5M/Fc?=
 =?us-ascii?Q?HMhN9N9FWUIL+xCa7uqcRbZweB1EFQunECyqck08AgHj+ccvxlUfySXbyV5R?=
 =?us-ascii?Q?64PV0K/XMOHKgoHYVyb20ZZ4YR/iy/GL/MzgWGw2T63xDIDg3YghMAlLZz7U?=
 =?us-ascii?Q?YRXvMMLnUVhifnzLVcUSwp+5MklsAWR93xr7pBUiGKpfVEy+XoSm8csRGQKf?=
 =?us-ascii?Q?Ng1ayU1KtpWQ+ITyTcqSKd6PMlCZYvLH/yRjY3hsAi+oM+XjOBao/5P9rEPh?=
 =?us-ascii?Q?XIDl7wxZD2A3ofQm6AVxkSSOHQEbuPx/c8A2IKfpIgUbDEc1TtNTOPKB8xDR?=
 =?us-ascii?Q?LOHJWCwOy/yxYr/tu5ZdNpw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34051d27-dcbb-4a34-ac93-08d9d9b02e49
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:54:56.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQRk0HrC+YhHdsgkJEqpNYvGthNT6WO0w8m1BwWZESYiE7AdOi+I13LtKI5MEOmYNRld+bGM60krN99bA2/BBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5291

On 17.01.2022 12:24, Andrew Cooper wrote:
> On 17/01/2022 11:07, Jan Beulich wrote:
>> On 13.01.2022 17:38, Andrew Cooper wrote:
>>> In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, there wil=
l need
>>> to be three different access methods for where the guest's value lives.
>>> However, it would be better not to duplicate the #GP checking logic.
>>>
>>> guest_{rd,wr}msr() are always called first in the PV and HVM MSR paths,=
 so we
>>> can repurpose X86EMUL_UNHANDLEABLE slightly for this.  This is going to=
 be a
>>> common pattern for other MSRs too in the future.
>> I consider this repurposing risky. Did you consider using e.g.
>> X86EMUL_DONE or X86EMUL_RETRY instead? Neither of the two is
>> presently used by the MSR machinery afaics.
>=20
> RETRY is used for the MSRs which can cause a p2m allocation and hit the
> paging path.=C2=A0 DONE is not remotely appropriate for this purpose.

Well, okay then. I would have said DONE is as (in)appropriate as
UNHANDLEABLE here.

Jan


