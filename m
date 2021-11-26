Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121AA45EF0F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233065.404264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbBN-0007Ou-Mx; Fri, 26 Nov 2021 13:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233065.404264; Fri, 26 Nov 2021 13:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbBN-0007M6-Ja; Fri, 26 Nov 2021 13:22:29 +0000
Received: by outflank-mailman (input) for mailman id 233065;
 Fri, 26 Nov 2021 13:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqbBM-0006p9-7p
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:22:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e648f7bd-4ebb-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:22:27 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-UrTzf2DFObWuPCm4LZPEsQ-1; Fri, 26 Nov 2021 14:22:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 13:22:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 13:22:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0171.eurprd06.prod.outlook.com (2603:10a6:20b:45c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 13:22:23 +0000
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
X-Inumbo-ID: e648f7bd-4ebb-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637932947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzmExEs+z/a2k12D3JtnVlJRQHbHGaldXaAqrln4EsU=;
	b=ZeEfF1yiYUx6kMsEOR+4lxEYtPuk1yiTqy1eVYIXpGB6aJad/a60gf9ypgLO4rO6+WE2tO
	4clnYfu7CEdPahtS6q2e+VlGW1s8C++UBqNfHoNnPKfmM0c5uRN//rBTnj0YbncYaP2KhO
	kP3GxUiW1op0PKPUiJBUeciFsi+aU/I=
X-MC-Unique: UrTzf2DFObWuPCm4LZPEsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnz4Ms3L8qZc688Z6PAZ9dvnA1DxXQ370s8+K3KL07SHJuRnMUkFX2P5FTIzS3iJq0P5Zz4hW0vHx+EcnOOTh7OzvUiJpVAtgK4/itGz3mGC73ypCqiMUN2DJDLCeLaMASkOIim3cw7w6J5dytPiO4aDC1clOxM2Ob1VQA8Bcgh3OZL72eVHz4Ufs3VDgM0KfWf/0I8KKksNGB9FgEbyq3fEp3iqOUFm08rBXkuTEUaj+bGbCS3S1yL+3P6yS4etvk8TtR5SYGeGxv3wSawwvJZNGKLrN9Ganv1Hz5zAnTLiucINaAIwN1u7mXMVEq885sX2h8P3BwZatPORWTQFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfjdDBwDMPHBrBZZWErItRoUqmgu4pOq+aqdGmATT7o=;
 b=jm1yfG2iRyYnFAArfb5wrseNIM06HQYHXFdW3/P2Gte/DgM4PAZQKyNFVDM22A66ZM9XBGcNnxQ9/DMfY1uxRi918LY6RTbtxjQvb5y4sQpgR0nmhIXFIIX1zwNYn24ZCTFbS5BSnWseQFgPcc1jkCvFlQW89xfEFqV9jCUXwwDENP6tIgDq41MGt5RTuSuuEckcral1kPWdPgoeE5VLxL8bzDj1aWKOCLFKWyEzNENNNAjUkBpvGPDYsQMoatgOg6miuN2FH4dYTbKThzPvDnfEVlmss+Oxs0sPbuIsc9EbztAklT8Fkagc0uGUrBcUjzFmquzqIBLNOnqwcj2nnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce727ab2-da21-b013-9650-98747ebf45a0@suse.com>
Date: Fri, 26 Nov 2021 14:22:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
 <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0171.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af7675a9-cd47-47c3-c269-08d9b0dfc869
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5902C77BA3DBC3FC4EA28857B3639@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ZP433BKrGp+184PlsMPXxKiuZxtI9ilRcJKqbqaX+I350WeqG7rDIo69KetGoCXpvwrG88Mt8H0sAAxgL7b2ebvEDJcO9MPVyqSqarW20/tG6iDvMtuswtPaW1vsxRc/pJBZZ2kH/lj8Lcnpr5TFH2lmtqiLgbriXWpt6hwMUP/FOmJixtJAiCw4HG494SDR03iUGYJY7+1QXqP4JwQ5HkebkSMPLpASuPyJc/OZa62nmxxOwb51SgPnwDJwmhTtOCRHkzh9mf2mydCEx86C1HKoW1UnMGilLgMNuq5obgMDxvWKWx8pRdR2ihKNaOuFR6cdBeTt9cK5DplNmc+/Kz5AchDlBeHW58dkF9PXmR4g0fUkMvt1tYA9ByX+ioRX+9W2J1PNhzcXnMYm2Yl61NW8yd/WHcQ+o73wjaZpxNbWvSOqIgbx7aQADnUo2wryjgP8fNmLp+5+s37wo2Vhjzfx3sc1bsMAhx2xnSVUaLaXwE6qrVePAl1CPDZjjrc7u+E2wYLTeD2NK2tZ1mV99CSoVliTdR3VbETIBhAxqu5iyRu7pXwhCmtgWqREhJMIbVAwlbVsh8PR77OzRk6KMaD73nd8CJtw3ZCxzGRPIPi5NCG47ggdZwGuELM3glT/O6SgE3Ls4ldqLrq1Y7y+B3ruigLP0EDtdOTdTp2NFTjqi0CKFJzTY21cdV5329YLBJtn2rt5am4kBYautup3yqZz9flT7g1HyKWN7CtO+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(8676002)(8936002)(316002)(16576012)(5660300002)(2906002)(4326008)(110136005)(54906003)(186003)(31686004)(508600001)(38100700002)(83380400001)(53546011)(66946007)(66556008)(66476007)(86362001)(956004)(26005)(6486002)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z933R9g32hXpa6SRowb3YZcNSbruUt1Ge7oI5KcBthv8lv1rkGgrM2zK/M2z?=
 =?us-ascii?Q?dxVA3alMcYh+S4hCNMNFk03QAQvZ4uhTZ6i4mxaw2IIK3pungDGLxO15aI7R?=
 =?us-ascii?Q?FD36OatlDa8554QytMzGIhF1X9BWkyp5ZNFHoaFKugvFZrC9D24CMNBrnPhU?=
 =?us-ascii?Q?G5b00nURMDjtZX41mfaAvSIKffQ9ugNfKXe8MyVGLQWiFleX0/p4S6zK6ll2?=
 =?us-ascii?Q?Ga/PPhgqWLbJ+gKF7v3U0S3rsm4NfLXrt5Lhn6P8+cdV43b+ibX6h/Jsy6QM?=
 =?us-ascii?Q?kcJasYnpH0w91I6KDec/H53DY4aGxLTfAKh8+z8IGE6LfYmmDa6KVzMeZPci?=
 =?us-ascii?Q?ed6apGkFpWW+1s5STUL5cbaC0LeMm1Tejgjl3FNT1LV5YSEaQrTDrNNV1izF?=
 =?us-ascii?Q?2BwQ035K9QWUVnNwrhroWehSezXAjfd9+AtfcDlkTu65YR2ICrmtKklnTrL9?=
 =?us-ascii?Q?ZtIL09kiZuTLfpmZWfQMLpdaS1RS7YsOsVqMHRAOlSNW3uKTvHL6WHLS8tfn?=
 =?us-ascii?Q?6CiHLpWrS/E+sWeArvPqUxDmKvOTQxJcqAf0AqTVU7EWMH2wnzNy3dWDlxW3?=
 =?us-ascii?Q?SYZ61rcZjwEsZUG0m4n5v2Zmw44RV9yFZe92c5R20kafVPvTmSXwItkyYC5u?=
 =?us-ascii?Q?Wqne2EFa0j9UGZT/rMjvfHonggY4kUTdI80Bhgq8jSyXWBT+ddpp1EH+Xiqr?=
 =?us-ascii?Q?u/PZs862J0k5kvEnm6wFGmtGN8BMgIlmzf/pZvhHJmATmmaTTyHlv3KFc4Ae?=
 =?us-ascii?Q?D+jHfCsubP6ATE4tiwRL1kLRAo8ESPPWz3niRjCFdYcb3SET0D1toP3rzHaa?=
 =?us-ascii?Q?/bL+KCPuKWY5m+jCF2rM7aqRW17ke/HIKuKP0kXEd3B/hzxJUNtoXYJJ1E1/?=
 =?us-ascii?Q?y4puP5k3+S3WerzlkZQBtPEtFCnIubpH72t7QHhUHi1KyMf1EH7t+9Zpwq8H?=
 =?us-ascii?Q?f2cg5v4CxO44VGGfBdbUyaNX8ffGCSHq5bN2TRytNjZVnuh9miI2BFzD2SWJ?=
 =?us-ascii?Q?dsXwgF8smKgZWqIQ5k4KBtiMhiZSkCz5D1glUTq0ibDafrCvOShoMK91xpgL?=
 =?us-ascii?Q?/NTjo6NwiqfGO1p8YjMF6u05XKg3CO/aqHqX+cN8kYlm6zDC7SyM86zBTaZG?=
 =?us-ascii?Q?ul1wIy+AyvS8e0iliBUT8OCV96CAXyjxlGZ8ayb/oiJV/NjAmTnx/KUcCN2r?=
 =?us-ascii?Q?W5Guq+um1M4Zqv6+sYX6SZRdOV/Hwve4Xpebitfrze8G/Yzilb5RZy6zhhkw?=
 =?us-ascii?Q?hwq5AijPk2lsPAqS/+ai6Ad1xdIqoEVL8rwJ0p8djTEtafC/7RrIdgBjn5Xj?=
 =?us-ascii?Q?xlUeLVELDO3eBXM0kqGAVS0Iuz3DBWekw7rTaXWhnPypSg+RW4nqwiC2nl8P?=
 =?us-ascii?Q?jMCvvHp9d5hIpUPVG2mmfLHy1yX0a9FPPy+fbvlLpLhLie6cGKzkTgviJgkq?=
 =?us-ascii?Q?ztnoyqp8m0vEOjyNGL+QoR0EgUP5EoWGcUK8VP4cK2uz+qGyQt3brvI/uaQ4?=
 =?us-ascii?Q?Rp5Lp+ByZ9F4j2s7QkPYMQSdJQz3LpN9+XvrBE4J88nonL+g//AZUMeaAZzR?=
 =?us-ascii?Q?jPLYXccvIUSPfjxK320aL9/ShPvPoWcp2eMsXecEFqFJbDwec4sKM4HKYrxG?=
 =?us-ascii?Q?46X7+boHnNcbyhGdXI0ytck=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7675a9-cd47-47c3-c269-08d9b0dfc869
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 13:22:23.7764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Jv4BCVJEt8We1T/uJlh0PRyG7XMNZf2szcuDejYeirk6RA+r2IVvRTcOEZP5BgUoyDfS6CDuVS5FxVnKxIsgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 26.11.2021 14:13, Andrew Cooper wrote:
> On 26/11/2021 12:48, Jan Beulich wrote:
>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>>   * I have not checked for misaligned endbr64's, and I'm not sure there=
 is
>>>     anything useful we could do upon discovering that there were any.
>>>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), =
but
>>>     this doesn't account for the structure of x86 code, which is most
>>>     certainly not a uniform random distribution of bytes.
>> Do you really mean "misaligned" here? The 2nd sentence rather might sugg=
est
>> that you mean byte sequences resembling ENDBR, despite actually being pa=
rt
>> of other insns. If so, checking might not allow to prove anything, as e.=
g.
>> displacements change with about every build.
>=20
> I do mean "any sequence of bytes resembling ENDBR", because that is
> ultimately how the CPU instruction decode will behave.
>=20
> And yes - you certainly can hide it in a 4-byte disp/imm, but it's an
> incredibly rare imm32 to find (except for tasks such as in patch 64).=C2=
=A0

A disp alone won't do in general, as the top byte will only ever be 0x00
or 0xFF (as long as our binary image doesn't go beyond 16Mb). But a
ModR/M or SIB byte could start such a sequence, with only two or three
of the (lower) disp bytes used to complete the pattern.

> You can also hide it in an disp/imm8 followed by a specific nopl, but
> I'm not sure if we'd ever emit 0F 1E FA as a nopl by default.

We don't, and the tool chain doesn't either. Only canonical NOPs (opcode
0x1F) are to be used there, as all others may gain a meaning beyond
plain NOP.

Jan


