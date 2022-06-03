Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714353C9D7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 14:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341481.566704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6Id-00074a-Ae; Fri, 03 Jun 2022 12:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341481.566704; Fri, 03 Jun 2022 12:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6Id-00071K-7G; Fri, 03 Jun 2022 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 341481;
 Fri, 03 Jun 2022 12:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx6Ib-00071C-Tv
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 12:21:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37721e2-e337-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 14:21:04 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-STEBMNdRM2SViYaKXgYZlQ-1; Fri, 03 Jun 2022 14:21:02 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 12:21:00 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 12:21:00 +0000
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
X-Inumbo-ID: a37721e2-e337-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654258864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrCx3zvRfXMrvo/sgtY5g7UtAwTMvt59RmLiIHbQNDg=;
	b=Nkano507JBZ7AGWIjUw2RrlO2LWd3PSVKYXavMzN1g18/dlf4cGpCFukkApHudn69l/mkg
	9tGN8UYNW9rEUgavgQeaNubQGohchMmj8kd8RrpL6OgM7UY5TV/9dog1OrNtVTK+QYER7h
	Fk63ftLaBzicatKqduuO458GM3mJXzo=
X-MC-Unique: STEBMNdRM2SViYaKXgYZlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVvAOwm3yFYt6sb3IHab7Do+8NY3tjMVaZYbKFT146MUNWFxgJCP66RN/VtEwBMr5XZIjRDoINEheY9Z/pnTvYqozvRozSM6XllcS8en1fKHCuyZ0eHjdtrVepHnIOwNvUE8G7ByFMun0M07gCLNohHQ2nYRAvSie3VyQIZ3287/pcyyJmjMvJ3UxGhLGH6veSSOIDfktfd5/f23uO2KLoUQyBJdvYz7rwJUaUgixl3KwmLPe9fmAqrYuaEDTLwUT/abaVrtiPKeE2eDNJiWnaOpjNDIgiauka0CwiEt0ITMpO5hUBaQpDvvdNDiTSu1QIcp8L+ljrdzBkfVcX1gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDGABYpZW8mbeuAdJoj4HZ9UwBekeVDl12fji0rR0vI=;
 b=hKVln/ml+zBajZ1BpCQRFCFo2uvT4XblnabpKwCpC5U3jypz57Wp03q5kiUzX5hFcbreDR6aYIMGbhei02OSbM8NewXqLMw1akddSbfTmw1gPB4g424cgnfWrzwx51TEmqqv48ANedHaI1OVEqROd9M7VRtqcy9BDmWG3Ims18+QcEIQcbhLe2JjgPB/iFq4OyJhdiU3uy+XPrXfSAdqli3EzmluSUmYQLsIrKvfBf2El+HeRRn0+9lDk5+FXlV+R7J8kEtpkSrKG+rbpQUDKxQtgP4cs1ExpNbKeOFqdJtqM3ILAGkPIDpJMDWLgMZyWUA4u9ZkaG9XWO8c2gtqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3629434d-a035-59c0-0fc8-f3db5fa6c18e@suse.com>
Date: Fri, 3 Jun 2022 14:20:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] x86/vmx: introduce helper to set
 VMX_INTR_SHADOW_NMI
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220526111157.24479-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0062.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::39) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5c70bd-b364-4ed6-7b5c-08da455b8535
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2438:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB24384E56DA30385B6329F170B3A19@DB6PR0401MB2438.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	29aZruL3CZw13EsjhaakOQ/KYL9osMqOkbT8XZld8twJXAx2VWtO6xZZBcITHYBd27+Y4DZpDDryljZSxsAJMKQPxpJznVN6KGlV0f/Y/t7IC1nda20wiGmpaQ9GOw/VdkpsiE0i96PyVjAUyrppCXhQV4C/rDMO4lwPtmTNA/o9s/YdQLBj2U2eIJwc7P1xnefLblq3gHyPt1JO3yK25Ppbd/cHpO13/OtS+pfDQB6P+bseUUaAG4sR3CKuIP/vAmjbE/pP91UM94et6tJZbAyOZ/+EAybpIqFGBunBp3VvlESdeJVSc3ZF2j20vfB3YDEBauwQ+5xrjlZQ9XSt36/2olz3LX50qw+JZKtMrsSpj+6BPcGCDrfGI15hCUIFxZfzkbvjz1YSUFGfudOCopXLeze/O/acQ3PuvrgA59iQzuC4SRVPn49TmnLdJmM1HPR9bSbS2HKIYtYM+uakOUSeuzNrd/gFrpYvYiGoucrdVLXgo3s8lJ3Or14hb//mcksSUx3PlAIPCiVDh7pkAKo+HWNp5XuX4p+WRdbw2oeyLjWeis3+DoJJ5HgjHCkUaVOK0CM5oVg0wTdKTCVUEr/z+guA9J2Gl5ac0JRrnv3R6hjnl+4gT7np70+cuhOKJUWK86GWFt4a7FDuZaigcgVaxu6+SaQqu8gmetKv6zrqsHonevLq7EBoG4qR+OaBnMZRK/ZmFaTAz+ISfvJdJL7NQOZuOCXGnPCjHX45RMIOPEF7QexwpuReNMkyW1ej
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(2906002)(38100700002)(83380400001)(2616005)(6512007)(26005)(31686004)(186003)(508600001)(36756003)(6486002)(8936002)(31696002)(6916009)(54906003)(316002)(86362001)(66476007)(4326008)(8676002)(66946007)(66556008)(4744005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ERtSObzUpajR9fqCZd3Wv3bn47x00EVqVWDLUqnpvhebdjhuDIbBuj61LHWc?=
 =?us-ascii?Q?ITip5FogUW04NkwsEhEiTjCku7I7ccRWTyjZg/kaQVYh/pg0Av7vJ/9as7qm?=
 =?us-ascii?Q?5TXqhyDnJHHi5lfrOZf17sHjApIJYjjHSzp08Hx5fhOmszMjHq/iS0bb/Mfx?=
 =?us-ascii?Q?cUNiNKDyqyxRLck6YDYrmBGXQp3dWznfigY42jRvfTskGu5LN25hGFOL8u9y?=
 =?us-ascii?Q?n0EnP4uZgfYqyepoDU3/lEQiwc7cx17dSzJrdZogA0arDx0Lm85xA/Y4st1O?=
 =?us-ascii?Q?S+nhBXt2TazV8+OtGfXoJDv3WFV66nQXuTVIlFqcrD8bkuzYOpgBnAUzywtD?=
 =?us-ascii?Q?40A4NUA6O9GAUfMqBB0iG8/W3lMchqwY7l6a+mzjhd0vUj6fla2BvdQaQIBs?=
 =?us-ascii?Q?zmGATh5UdYQrbXIupcH+j9Wn41naUR2USJHtKCP0L/K5a55p9Cjc4D9iGu62?=
 =?us-ascii?Q?54fxPo7S/zAOJ9LvSx10PXXPnJvsArOShCwWgxLmVJF938vbbEh6FxxBneuE?=
 =?us-ascii?Q?zMWsEkFhGuSw9hg0xvipbxHD0pNmL6mu800QANBhLpf0enSV21kQWOCsWWLu?=
 =?us-ascii?Q?0is4dh+sBQEjV5bS6yl/GsycrLoKUMgeluWXdKcqJdZlKZgwmnnPWvcHEyh/?=
 =?us-ascii?Q?W3A2fzSWcriVhn5EPKhaX2iFcAdMIhs4/Ueg7nOnA52XiMOlX4omA8KI2wHQ?=
 =?us-ascii?Q?/E/XO5oqJtKTIsNYr9naq7RZtsAMQ7/bSO3HpbBAU3wCNdFQs3udAou7eytT?=
 =?us-ascii?Q?JWSIosIh6DG2H1biugE9WMS4nuBGtKCQmJ94EPPTKKUlFHTBtQd3TfFpRzWN?=
 =?us-ascii?Q?+EfobQhhmZORRMMcCXWkyVN2mkAbndMPBWn0MaYhenWCJ14N6KNq4SUrZq5E?=
 =?us-ascii?Q?B2+I68MEFh9ub+p9P2Kyl45oQ9Jc/5f784/WwfyFMBo/cN8m0tw4iqUgwbgI?=
 =?us-ascii?Q?nGGX2jgASo88TQjp2WpVoNgHyHZaxTRCkUPAHgleTMsrY76TQQKNIOPItM62?=
 =?us-ascii?Q?pIRWT7SnMNnBe0Gnihj1wvTIx9NNmGTqt3sXgaE3g1f4Qeh9CFJoETszFY1v?=
 =?us-ascii?Q?Cwn15ENGyxNGmESKwJvFfRxzdP+sff1emPgbVi3UviQ5MV/wh096UdT6rthh?=
 =?us-ascii?Q?hbLxsjyNhsKNddbYyp2SDvVQCSD5f0UAcR5jRZBrwDKSiEunLR0xQdVR1eR2?=
 =?us-ascii?Q?yc/IC63Fp081T4jAsQLgyFcT674hHZ85IyGL9bLTibvNw07lIhk9q89XNwTs?=
 =?us-ascii?Q?MOU2MG8dsjFfoiWQbxS1t2C85xbZ8Bf6p3g1MLBdPg7FkbPHcbDRzgnv9e4j?=
 =?us-ascii?Q?J/+rtilPieMcZIWokx9cyEq1u/aIZv9taunzgCjQDRsk1sfQPtiSqWdPlUzu?=
 =?us-ascii?Q?PUmeOho98ue5qtjmJDiLlo+5Os4vrhQStX5ZJvIW1RkuQLMwGIqCfqHVGizL?=
 =?us-ascii?Q?D95j59++wMPfpJyBA4Xrlp9IKQBWzZjtd2VMJW45A7r08a/RXtsJym+yRKmv?=
 =?us-ascii?Q?oz+iHQQMZpcy7BhBtdyCAzQuZ8vLJb/BkKLBJAiWlk81ynFmPLqWCyq4Bthw?=
 =?us-ascii?Q?FyrrfonhsMgIiSuAkMfmvYOsKAdeqBZ6KZmHayKnL5DnSyk8w7HZ8OgEZZAz?=
 =?us-ascii?Q?wPx7rSFrWRhSDqLQ9F+44oxLI1On0rMbUea4qR9BITFVFk0S0reOvxm4AtxV?=
 =?us-ascii?Q?w4qafCwg0EourJZb7DmWe0RTtnURnwDv/jt+bZyH1RPFcBj3nT2RJDhCGAq2?=
 =?us-ascii?Q?b/ZUEAkX7A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5c70bd-b364-4ed6-7b5c-08da455b8535
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:21:00.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK6kEiQo2+dCAT8tMJV36Ys5IDza6Zgm7lLOweBCGbUDTlK+ApU0t5gnAEhwz5dy7CM8dMCco/+BU24awv9CGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2438

On 26.05.2022 13:11, Roger Pau Monne wrote:
> Introduce a small helper to OR VMX_INTR_SHADOW_NMI in
> GUEST_INTERRUPTIBILITY_INFO in order to help dealing with the NMI
> unblocked by IRET case.  Replace the existing usage in handling
> EXIT_REASON_EXCEPTION_NMI and also add such handling to EPT violations
> and page-modification log-full events.
>=20
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


