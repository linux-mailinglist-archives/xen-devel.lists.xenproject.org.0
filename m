Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6814B6D58
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 14:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273179.468269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxrP-0005gA-8o; Tue, 15 Feb 2022 13:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273179.468269; Tue, 15 Feb 2022 13:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxrP-0005eK-5Q; Tue, 15 Feb 2022 13:27:15 +0000
Received: by outflank-mailman (input) for mailman id 273179;
 Tue, 15 Feb 2022 13:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJxrN-0005eE-K5
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 13:27:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbb31f2e-8e62-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 14:27:12 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-QPKjZAOZMmmgykC0khjo4g-1; Tue, 15 Feb 2022 14:27:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6136.eurprd04.prod.outlook.com (2603:10a6:20b:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 13:27:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 13:27:09 +0000
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
X-Inumbo-ID: fbb31f2e-8e62-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644931632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYq7aUrzgzpmsolmfJyPbc99v+gIpc64qMdVS+ZMwfQ=;
	b=H4p6zX1KMW0MKlp0hoenadIiv594m1Hi9by55le6DdY7Ox26Kk3qqAl/uqk0BrUMTYW1bw
	87xU8vLSDp0Pnxss4eAK8Ieona3EZF7RR+5y0zgs6ZLv/jbHzS2vR4Ie7CLIfUAH0itq7Y
	5rfTOG82GiY51o/zaw/soD14erq3deY=
X-MC-Unique: QPKjZAOZMmmgykC0khjo4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NH5ZvlSHP20jec6o4BnjKMQLA7dGgIbBYvY63D9kLNdeYZz5Hp7ceOzSlxx0neYwWmTqKA0JsPRCItCYcCpKGMgIJ/XFBusM1GBufMKh+ZOon/7eSiOFSgrqL099D2zIwCUbGY4Zwiaf2CzR5NTe3P4XhQNLCaiqYs2YmKtneOdw/LC5vsFm0N1xLfv2mQm/m34CBKsLT+EliApQ5PcTjBF1Ht/g5fLeqhW04VJmKbXcO8PYJ98yux/UMfd6qGn9uosJOu5E+/9jaj/1xnGDcgczGKciH2FQUXtugD0gf95vRtZYRefp1xvqFrRpNvSWQwAYRAdJdqGaAL7xrelLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Afwp3MJaiCv2u3+xI34I5714rqRhtEykHH/+zGcWUM=;
 b=bJ6y6GzsRhq38ywly63DGLdlUXqsv3U2ssVo5+40eBIJQ1GNmiMFXkf+ZrwH7ajFAxvLal/ZJdLUlrhZDfeHRiNOD37i/DK00D5iqBgWaxp157lzNaiChml/a2h5sgIXl1k5ft3ICTD2qIO2/TQjmajonGN6fUXd3tbfp4QhK84RnUeVHlUEyyduutPbV0r5iI2Wc1jZcmlGTN7V+gVyKCmsPzk2cI73gPiH5R7YB+NZaXLOiVQZlPCBwsz27HSKK13JMVUCpJa5Nur0bnNTAd1FbDMg65+/QB1e65jRGn5Kz8nW1HZv29qQN5CwsXmaSwMGWlFZ5M+OyHNMYV8oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b254d8ac-8bdd-af65-f9d3-e2fe69ffdde9@suse.com>
Date: Tue, 15 Feb 2022 14:27:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] x86/vmx: remove dead code to create domains without a
 vLAPIC
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220215112835.99230-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220215112835.99230-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed198f64-9617-4d06-ab7b-08d9f086de1c
X-MS-TrafficTypeDiagnostic: AM6PR04MB6136:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB61364F7A62C790170105654AB3349@AM6PR04MB6136.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tDZo1s6PIOqDQgPP9zQs7eRBy7081cDfaOopxZRIe3bNoGbxDqg2kmyUlmKoQkLM1H4OvWtAWjZVc7BqdHlhA5K2GgotddP3OMd3Q4fJHqtotFWiL1LIcXVw6iwWsVpSeDPDJes3QMXTprSLu/JywbFA3/fRNdYmhJwXXV8OI+Cj50m1sGl0xe443tmEuvYmuWigy03iZRt+yVKSgxPGiKMzy0tEdnGP11Mf7Tw3D29h6V9xVluBHHh2C4ityopp7BKfKY+PAexh2Eq1Ml+7Ln7SImvM6LhVFPlaqht43vgmS448FyKA71SqQ1dT2AtTsexHcr4GqxGytKpBSDsgWLMtTCkT/QeLQPz84aHRkfpZdkHeIfAMUjpHVQVxoNhcxp6nyvWF93xXbPoAIiInWwYcPLUn3E9LpzzMrBqMtY+SXZTmAHUZjJQjfbdZd0F4AUuh831zKAO3Y3BKalf2N70bhzFpBE24gMH+SSMNd2ZzOJZjRyfRVrZJsiZ3S4hTszPuA+/p2YPE5xUV6M4wpE7IACEDO9cZVSeMwU8ttWa96YhWtccIxeDXEpqxh3yla2kCUjSw3G6Y8AXW3FsNwZy/qYOMvsC6WUaMqC4aRa6wyKRuhZKerOwsXfBzZ2EvmTQ0BwI7CrjdCWgwTKM3uWYGnvqL1HnnBYpbWGudEYGvijx0/G5VDrgy336nPEK25rcQdo25FrUiL/zHXqh2lY44G/tE7hB9KUj+4e7KmhA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31696002)(6512007)(4744005)(6506007)(36756003)(2616005)(31686004)(508600001)(6666004)(316002)(53546011)(6486002)(2906002)(86362001)(186003)(26005)(8936002)(6916009)(8676002)(66476007)(66556008)(66946007)(4326008)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NSqT6J2m/jeBCW0DKjKqB2v1QzBg1qt78ZU+lv2iaPfM98YLYKASbaDGnFWP?=
 =?us-ascii?Q?oMWNFQn6u9CzfWsjeBMKrOXsR5ffy8t7OJiPAnZdsP+xBAHUnvoBA1AqzsbR?=
 =?us-ascii?Q?+5eWT0poC/psejfJsS33HzF9crdsf3nzK9hK7H72tIe5I48N8mb2RdTFxFpd?=
 =?us-ascii?Q?mgZHKbrPexFBV0U6WFCg7NpJBn5Dtza3nsr5VrDAHggwuihZfxIPVbcAUBq7?=
 =?us-ascii?Q?qBng7EOS4/Ez8BgvJt5O4b6OFuBwCAzhMxL8te3erj9U7RG9eapxahqYAQfJ?=
 =?us-ascii?Q?ydtMnjvv4NGawIociLzNaKSSKQCt5WsxLok3ewEtyrJh0O/fxRxrSX/hKSv8?=
 =?us-ascii?Q?Cio9nHS+K4kLJ04n/cV3mbDUeRB8+HcvTNs+fmW33grvKAHEYCcBuWKpSL2Y?=
 =?us-ascii?Q?r3fk+vx1cgvpOiOe43vejWHBbovZmxgBHRAmcN0OTkRpx7N1MWQV6zMCVey1?=
 =?us-ascii?Q?m4+nJZVV/fIn/rJjO4dlJl/fkDqI0IodT82Nyi6iePcIQ0D3ZN4yCksH0o9M?=
 =?us-ascii?Q?sWKiCfNwuDn2tXXYoHXzAMPONjENYCUsQYTDuYJL+rcTfA16+qpElAJxdlM/?=
 =?us-ascii?Q?9iKADsbw3wfu3HLieatlmvttHljNwbsqAezqutXRHNL1QCYXdncsfd4xaVvx?=
 =?us-ascii?Q?kNg9QTdQHGKi7F1FEgx+WAGyzTVnIVZpElq1u7wN8QBST0IbAdYfT1dPtcH+?=
 =?us-ascii?Q?NYpu6i5bu83nEmYfyrByEyaUoqmbP8Dt39VHxYT730jJFF4fs8To1YhcUq3L?=
 =?us-ascii?Q?6Dg2c3Ro71MhZom5ezKdamrOkdN4ZkdXGc5T65SgDKX1+fUrvKXxc9035fZ9?=
 =?us-ascii?Q?goSxil7Wxf9C6IqashZ+pHS8r56mCb9OyVxe/E+mYd36ppeHQTgQZO2zbaHJ?=
 =?us-ascii?Q?E4w2AUURmuFrOWis85/J2pBidIGff70tOygdC23Mfciq486tbBbPz3FUzZq/?=
 =?us-ascii?Q?MEMedypzPYXit2NClGz38ZNmvmMFzIloLC8WBLefO3FpqDidO3u4R2HXLOdj?=
 =?us-ascii?Q?5LUDFayKJAv6Uwayl/mr+SlNzeLJLl1miKq2+bqsiw7pVWhRTJlXJue8+Z17?=
 =?us-ascii?Q?7zPUCxI70iCSw8su2Df6cry6QPl23vSGDYee8/2U158KIr4FzIsmK1bAe7E1?=
 =?us-ascii?Q?txm/laWsdszo+RFNqo3V7uo4xQQuVkbUCv17HGLwm6PiXOidisC6Oxmox5RE?=
 =?us-ascii?Q?Rt+41FFq+3Ayfpj9Og7SSgaruttTPR0EKQHtIp4WFzoZArIbIXWV9+aWq4d8?=
 =?us-ascii?Q?i79t6zB1A3pEuQehddBZTwgyJr8nejfMqUYjA+Ro+i8rrOzD2m/XsAXdVjoR?=
 =?us-ascii?Q?lPtudYuWSeVJ2q7DViuulLFW+oHh0r0vHbvqIc0bbzisCfFehVuUhRgRdOhH?=
 =?us-ascii?Q?M3t4g8z6m735oE60YgjQZoXVUNEjB6aPEdqsJ6bfV1uDA8bnZDf3FsVFIPY8?=
 =?us-ascii?Q?IhtY9ktEq+hK0RGmjUMuTjvQ/QbPlYtWQGArdl4mycIuJevQ9v4CJEeszMbd?=
 =?us-ascii?Q?XOp23lbsoOMcnr+ujDHPDHHl9kwgkcc9uWlL+jI4r8aMFXcAZzmE7ZjIOm4a?=
 =?us-ascii?Q?KsSjlY9EAFAA47Tq4yBhDrlxnNeJRH7yTKAjfhAn33q2lD9iPxVwO4AqCf2I?=
 =?us-ascii?Q?514pHmjoBeRT9xo2nc+3Cys=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed198f64-9617-4d06-ab7b-08d9f086de1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 13:27:09.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DriN0o1l4RSenkU7T8eLZTFIbM3a4iYQzrvwOg44Ce2VtC29n0hmcXZ/6n+gjfregLv++fKPHrpURYsmk+wQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6136

On 15.02.2022 12:28, Roger Pau Monne wrote:
> After the removal of PVHv1 it's no longer supported to create a domain
> using hardware virtualization extensions and without a local APIC:
> PVHv2 mandates domains to always have a LAPIC. Remove some stale code
> in VMCS construction and related helpers that catered for that
> use-case.
>=20
> No functional change.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


