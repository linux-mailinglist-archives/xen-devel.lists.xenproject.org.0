Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D53B7DA0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 08:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148135.273673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyU3d-0000kJ-Bh; Wed, 30 Jun 2021 06:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148135.273673; Wed, 30 Jun 2021 06:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyU3d-0000i9-8U; Wed, 30 Jun 2021 06:50:49 +0000
Received: by outflank-mailman (input) for mailman id 148135;
 Wed, 30 Jun 2021 06:50:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyU3b-0000i3-Jx
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 06:50:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 327a6f83-e906-48c2-a57d-ccaa2a99585a;
 Wed, 30 Jun 2021 06:50:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-OCxTPCXsONeeT_UfuEiZ6w-1; Wed, 30 Jun 2021 08:50:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.22; Wed, 30 Jun
 2021 06:50:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 06:50:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 06:50:40 +0000
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
X-Inumbo-ID: 327a6f83-e906-48c2-a57d-ccaa2a99585a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625035845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2TY7M9Qlj7YBm+QB/fUXr1NCcvinqwXt4230p1zNZ40=;
	b=VxzaFWqPBmlndiEpn6lbjtAQlG9089SotAubfEL7YfYGkdrJrYT9Z4oCpbezjnVGr8zqP/
	H/ooBR2z4Lc8wCjKq3FbiBz2FQ1shXOTA2FitqgjCJTSL1VDkrF3ycNpUFb/cs4zFJAfAA
	hUNg6aM8nc+xDILhE5pcIPigU5GOacE=
X-MC-Unique: OCxTPCXsONeeT_UfuEiZ6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGf9c/Lp7R2UdpH65W5aTvory9THgFXKK42hIH+g8V4BYMdhWDvXjQJOIBwEVb4vMVEQChBipvA7oScLQ3qEVCE3UyVYiYJqdVK4qSPwda38QKh9t7636Ri4c8QP2BpNTP9XxcBZ53AsJ6Lm6ZuHPSt41jv0ZI9kRabyZC3QyshTAAHPz++uVJSd17hVcfi6btocSMn9OPOe7ky++jRpY5G82v4KCOnCvSE66zqw3DwmsbHOBBGvvmPOSP0GQC0EFi547MahVaLjLl8Tnk2+uqYl499QHgJxMFnNrYOAWi/GLclYUPQEoahLTqEeoMp/55L3fJCKtcCnTGmVSkkW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7bT2vXf6JpyltTCEOL++RoyjzyGamJs2jk7Df5eEJ8=;
 b=agz9FQASxgKmPp+kAP7MAeHt+1C5A3Yl5a9haVQbqMhWgiK17+SKJA11fuKdila8SB3CuEit5H2Fs34q5Zdvx/mvPOI8KrOaTjjHhPa9YqaaJy3m4ygADrRxiC9fVnY+NpgDZfrbEb1g/Eot1DccREd3NoD+jYkUgKBIYccFWg1sBXtHf+syotVluMQfMcMnXwd4cebANoiAfa9nw+VNJjRkIejhJIi8dhlM7HUuinH50sjm+vLWFtQFNpcoGmEPsSNgYJS1RI4ZVOQY435JDotzNclsl+dqjwRqFTEflTULN2d2VZ9bu1czVvxgvXb+Gs+s4pG99svnMNGIkgNdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: mark hypercall argument regs clobbering for intended
 fall-through
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdbd506a-e6fc-a560-1be7-7424f33d413e@suse.com>
 <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89c382a0-1f1a-218d-0f19-e43d0a68de5e@suse.com>
Date: Wed, 30 Jun 2021 08:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b375196-cd26-4cfa-6a6f-08d93b93600c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51664F80040AAED63A4D3824B3019@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NZGy7F/qgRwQN8J+EBoTRK88PmftjRaNrajV2kpImvXbIfb6BsKm+Blnv97rOmEOuqrACKGl7RHoCdJ/iueeXTP7lzTyBFfLljWKff9tecj6UvN9FqBnCDBPsjve42zEJxEFcKO2SOZbwJPCvygojOnMdPsG5REYKSsawWgdsWkAfdjn+zhQzi6PVJCHJpyJSNSEOTp/VZLVgyfTpKuuwqdo/XaNLzux1U0nSNg3NaUwYkLcfdP/nnMWlM4DEPhgl+1nWSIFdP664XMfIxVHpYYZZYpWrsC7FUCVy9u3dNHi8+6B0FsTUReJjPR4eceC+NkcWiFMMbo/qpMExsFw0VZH64AC+hEM/UON5qz6buyVqdL1qwgE4o+ak3l4UaXQsBnXJ/Qi6dlExIPB/WbetboRmDkenZAC3yYgVXP1OPmg7jJxO56qK3MyUx9IqKSNstWd7AGdzC1EoptER4FqjjWPrAYZALOFDKap8Qyn31ELXXDXnCRo55r1gaCCpSu/nwRzU6ZrhoF6rVWTCSpimsOwjiaKPhYm4Zzy2XObDT/6O8lXsAkSqRVTNJS5JupfCbtyqZDnzeFLFBo5Vs/Rfhm3GB9YQLSNIqW358dtmW6ypVh4w1uEOFFsyq60pvR8+i16F4oP0xIodffwcz2zbWK7Lg2KAJrflirqjjObN2XeO5MukU3IFf8p9U3V5JyjNI9rO5/wMgOprsDB+c+OftYFrfGZ9H1m0NNkFvZR9xU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(39850400004)(376002)(366004)(66556008)(66476007)(66946007)(6486002)(36756003)(16526019)(4326008)(86362001)(8936002)(8676002)(956004)(26005)(2616005)(6916009)(5660300002)(53546011)(186003)(31686004)(83380400001)(54906003)(478600001)(2906002)(4744005)(316002)(31696002)(38100700002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/xbPSJSaOt8XEwtORwCeDPA3R2v7RrxVFruxqcg/cJmKHzJpRC9vp18ndtk3?=
 =?us-ascii?Q?NyAt//sjI+hd0w9mUa0MUBJ4/yYb/8ezw7FSiOOpcZjCkew7rLb1CriNnzCS?=
 =?us-ascii?Q?N9YrYjRo5al0de9CIOMFDcAeJCJIE//jGvTtE9O19clGqlpDQhOmrm4v4H0S?=
 =?us-ascii?Q?Uzqp6hgp+FWNulvG4t6CDGL2hSDg0/QswNFdAuZPHBUDan5XSCEOU9AoSgxA?=
 =?us-ascii?Q?Bv2ckdxWJuaXk9HIRGOWdib6z+BejZU81FWnRf30pgy6xHWbRaKIJs0aCHJx?=
 =?us-ascii?Q?mdY6kA9txD8O0hJG21vN8y/nUM6Wk5YvNdCuLlqC04urBL+2ja5H4wnqTSzi?=
 =?us-ascii?Q?KVAR9nsdiVBKOJgA6ZkrtEVf4baWs7RKpsn2whbraavq0yhgqwhgHwNqDZf2?=
 =?us-ascii?Q?nU2vD2cleWlUJRUD6Rchf+I29N3XflT2SEspjS1UjMbbdauztlxBavXLg6Vk?=
 =?us-ascii?Q?lbRwtSRSdZKocctVxByfBYB8AFZNll3d0zC4rdexsmw46TzxyZ1LNiv1F1T8?=
 =?us-ascii?Q?w8pwxdjXgUpIr/Je3po0OokDZfdSLekRSt17gei7j0FJY7OTY5rb4mz7jdgz?=
 =?us-ascii?Q?DLr1hcjhyXnyFp9yDciS5DFcmrTjGc0u3C56qBZ37JkZ7irTuyFUboYwUtJB?=
 =?us-ascii?Q?yF2fmZPRJ6U6CXQYARN3mihfI7NJAg5sMmTYZO1/ATC5VE31VurmL5LeeLLj?=
 =?us-ascii?Q?874W3mPDYpwZJxAo/AtBO7GO+1hZVQsudPCKbHZfJv/9XIpJfU8enx/Lb3OE?=
 =?us-ascii?Q?Vq+MhVzgi8KuFsRuwbq6ImhEhZvPjmlD4+nnul1SpeJKR5AbF/YRC1TB5K34?=
 =?us-ascii?Q?KDEXPBKw98tyw8GcLj1UfZBs9NdVRMXGb8/+6CwnFVclNqVRSsNjw7OuQV/u?=
 =?us-ascii?Q?t23p0lji4i+bUEuGqCGJnjaBt92WZ23f15DnpwLqu9qmu6oD0rFyGK6WyNX0?=
 =?us-ascii?Q?MldC/Ozm/WrPQhOQO22aKX6qp8DI2sYZJTA21nx6N3jHqyA9OaWtAeak667H?=
 =?us-ascii?Q?vmJxReUEZ/g8p/H+wU03j3dCirQfGwAw0AJScWFhFziwFS7tyc1AzC7JCr6h?=
 =?us-ascii?Q?7g4sUJdY2XH3iYCfsp3FRYfZsOFo2PH5TnidFnehkMeVlcLhf4VHhCn6bKaw?=
 =?us-ascii?Q?otBINP7X4YGh8UjD4i8is7JTP4xVJtLIvyvabAo2GDfIUylIH6meOs2zLEXF?=
 =?us-ascii?Q?Rw799sywI8O8o1KDJ7O3YNl8QHM5HAvgtq8tZqmCFFAXDG826JeV1WrkPKvB?=
 =?us-ascii?Q?XIIgYO0/1Sapxs0bmI5mEdr8RoNs+eKcb53lF47upSC/JXJcvz9IXDHdBwSb?=
 =?us-ascii?Q?i3GfdC/ZB23ufxQPG9ESL/I3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b375196-cd26-4cfa-6a6f-08d93b93600c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 06:50:40.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2s9K4cU9KrKyitdBY6s9lZI7xVoGP8dBleta/fbI2SSPCnKpWqY1vb543df+z3Y1fBxg9VOFfuKMW14R295Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 09.06.2021 14:49, Andrew Cooper wrote:
> On 09/06/2021 11:34, Jan Beulich wrote:
>> The CIDs below are all for the PV side of things, but also take care of
>> the HVM side.
>>
>> Coverity-ID: 1485896, 1485901, 1485906, 1485910, 1485911,=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Let's see whether Coverity actually understands the (relatively) new
>> pseudo-keyword.
>=20
> This is exceedingly disappointing.=C2=A0 Coverity used to have the only
> sensible rule for not causing spurious fallthrough warnings, but this
> has apparently regressed.

Actually - where do you see a regression here? These cases of fall-through
have been entirely un-annotated so far, so I'm instead surprised that
apparently there were no warnings so far. Or maybe they had been marked
false-positive in some database, and some unrelated code change made
Coverity think this was new / changed code.

Jan


