Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA76E4C2CE5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278275.475462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE5b-0006gJ-M9; Thu, 24 Feb 2022 13:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278275.475462; Thu, 24 Feb 2022 13:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE5b-0006eR-IS; Thu, 24 Feb 2022 13:23:23 +0000
Received: by outflank-mailman (input) for mailman id 278275;
 Thu, 24 Feb 2022 13:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNE5a-0006TH-9B
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:23:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efc28a13-9574-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 14:23:21 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-pr-1GSuRM1un-WgVWk45yA-1; Thu, 24 Feb 2022 14:23:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8114.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 13:23:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:23:18 +0000
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
X-Inumbo-ID: efc28a13-9574-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645709001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+YodAfqsPKICzS0Dp2bGIso17g1NohmT0LbRbyRij88=;
	b=bcdbUzJqsRLNHgorC3Ct19HY43ifQ3K4Zhhn873+jZk1UxPZm3pAEoMxoF404jObWeq5++
	qsUVDoClrNRSAbD3sFolgm03cqgSZSBS/fgQNaSjzvN84dyWPyA+9WCjY+Jigpqc3L+nXW
	yyiuj6CAitp5RS4muO8vxFCp8u34oQE=
X-MC-Unique: pr-1GSuRM1un-WgVWk45yA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNMUMznUgBa0K9agSGpU/mVlU1/ep/aqVFt5xDR6kPSepP6WBnqYDNhMirfHnr2ATl81GZzM5eqZACrEd69hgorE9sKNSX7gr6nJ1wg8qJHS51YwhqYydv8iBFv8k15eqwJse4QoI9h31vO2QeNR9jFBDTBqpWJYiSuTF5ar+yuhPP/zB7ovv7/k3Tbgeu1u2nTYu5LYBeJJQ1twxtzd+tb47N89YUR18d81u1PDnsxlnmDue/MCiHw9VcjoRbhVo2vuLbZTkLCXVG+Z1QmL8OoolK93cL4XQ0qiecI/pScAm8OJ42Kk5cowxwkoNFz0A4uS7gbosx8+FOiBKJ71iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YodAfqsPKICzS0Dp2bGIso17g1NohmT0LbRbyRij88=;
 b=cv2Upzs0/mG48IMq0cGVA2J5eo0sOShcsROrYyEuI7UY8dXSB2SLZN4CyKPYUQiMaFEB4PTyskJ9UCXGBxTI88pn62q6TVZdkYsMddCHtR23nltlXpHr4NtnKccdgV23lSVGInY1P8WAGGuWUhkLHA2ofORt0Z+fHKJnALjHgJi2ktF2LC4spFooASQXBIxkWILfKfm8llGYfTSPr/pvpaCilQREpZA5RaAjDuiBpuhnJC4Em9ElLORZge0vBzHkO7wRpCiykXTHiqo9FGYgDwRgUv9AebfE0j6+uNMSBJgZNsqYVAqNfiueIEAL7TvXn3Pc23XEvFVlHdZ1AD8N0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
Date: Thu, 24 Feb 2022 14:23:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86: correct fencing around CLFLUSH (+some tidying)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9327b4b-8802-41ed-7a54-08d9f798d25d
X-MS-TrafficTypeDiagnostic: AM9PR04MB8114:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8114B9154A4AE907E9409519B33D9@AM9PR04MB8114.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vBgelroo1j2MeD5jY+6E8ydPo4r0qIhxMmIAMfxHlyRlqNEFDwXrUtDV7XFj9cPiIuzBgLvQsEJ/wEkIhmzHN6w+nrYBJq3UWXtTxtGgiPey2Nofh25K9S6JqtghfEPV0aideWeEKcLDbUdd52+mO0zlGtlaSPdsv28/kbT6M4x3WzMYm/It/YRud2Tx3WiZUr8TxdZrHJFrmV8B90Pu2kt4LYe9GMv/wJdn63spJR8NnN0w7AxaYdbFQnv066pALXcSBUvbH4siNJWqY4bEoUypHcnxwLhO9ctriCABVDErCMFSJADT5azGHHsRT3/1N1bR4vqQWqDnZSgl1+LCcyK2A1wTyusgT3W29gTfh0qthGzxdApVM086A5NUy1ghnkWGMoERT9uvyOrWEmLgB9fw3Lhkge4zf6OdLPMkIknQCfAjPmB20HUOoFzeP3+wgtu3789eHdFdvBOZXhWUv+h6Wl0cZcmuVeZZ+ghk1GblgM51LTQnwBoO37QLB+mnnynhCFgs7gAC+acxbiDiKOKeCspJX9vWJZF2ow9ew0xvwocG68+SjosaW7hcxFmAOaTwrc2rmySnxbo33qLaDWn/dydpFVu70cCrfW3xdXN25cY3nDDAVUjP0K9rMy46ce0ahskArRb5iegz/HsiKkHojCVqZV+day5rscuHsaYlpDwRkj28Uws+DViywryQmCMHqh2otcLMhjd9vL3y4mlEvW2tcj2ntXnjGj5uDTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(31686004)(2906002)(36756003)(508600001)(26005)(2616005)(54906003)(4326008)(66946007)(316002)(66556008)(6916009)(8936002)(6512007)(5660300002)(6506007)(66476007)(86362001)(6666004)(31696002)(8676002)(38100700002)(6486002)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3Nsd3R1UzcrMGptQVlOelpPTVZ5alFoWFlTRTA4TkptVW5NL0NMazRHcTJE?=
 =?utf-8?B?eDBDaFZYdHVJT2dRUyttZEdwdjhubnlweDFBc1lkSHkyZWwvRU1hY1hSV0xE?=
 =?utf-8?B?Z2Q2YXcrZVVhL3FqUkNFZERoZnBwWW1wS2EzZkxFdkR6Nnl6anhJL2RKa1cv?=
 =?utf-8?B?OUx2RzErd052S1RuejJSOStDWmNML0lWd1pBcjMvT0xDM0FxY3lydWc2SmZI?=
 =?utf-8?B?NTBUa283NnR3MktJZFlKeDNjbEFnL2F4VW91YUR4WW9rT01jWSt2WStLbFJD?=
 =?utf-8?B?NVBacVJrTXBudnlqSFhKU3BYSEViQVFQaDN2U3A3VHVhZ0Z0b1BIaDB3ZmNy?=
 =?utf-8?B?SDZFdDlmQ1ZqcVdqVnYvRkN5N21nREoreVAvOVZXaUZUcTVheGpJQWY1bEEr?=
 =?utf-8?B?ZUJJTkRZVlhwQUoreG5TcFpSSm5Semg0OTQxWDczczFpLzhScWxuYlpETEdo?=
 =?utf-8?B?cDR5b0RKeXhSNTMwVnZWeVovZ1Fnc2UwamRaN1YvakM3dzMzN2NzMTljUDBD?=
 =?utf-8?B?RTFYc1J1MGlIWDQvRXE4TnNuRm5Ia2VTSG1NbHA2THIzcHgxZ21PenFPN0pa?=
 =?utf-8?B?VEdUV3NzMS85WTVZeTZOSTVQa2l3M01HdnA4U2VqNjJoUGJiejYrMURDVE9H?=
 =?utf-8?B?dGcxQUlWZHRLaldlb2Fxa0JKR0xBUWkya2pXS214S2RsMHJiaDE3M3hnb1dQ?=
 =?utf-8?B?YlBpUHdJTStxbGsySXhKc1hwT3Z6RStUK0N6SitkNVVVanc3WkljZ0NsVlpI?=
 =?utf-8?B?bW54YkxDR2p0NS9LUCt0UFd2RzZvNkZydXFVV2pIaVJSUnNBQ3ZPT3VKWGM2?=
 =?utf-8?B?WW5NSEZSYmFQUENRbllTRnBOUS81L1RTR3ZGcmtGLythN0pOeHJXSW1GRnNF?=
 =?utf-8?B?TFk1RzBmdHdNbThIckhTUXZYM3paZUlseURnVVVzK1JoUzlVaDNOdTJadXEy?=
 =?utf-8?B?UGpPdjA3dnFreWhRRmJoNWpyOTg5a0xvM2tIYzRoQ3RYTk1IaVludW9kN3Js?=
 =?utf-8?B?S2hLTDB5SVNrbnQ5MHh3WDEyRk45MWl3d2kvaElPdHFqK2duakFabFp1S2E1?=
 =?utf-8?B?cVo5ZFZsWVJBMm9TRWRNOTF1cjU1Nm4ybXdETFBBekVlYVQ4TnFSMzFPaHRR?=
 =?utf-8?B?MTdOVlVXVlJuajhhRVRscW5uYlNLRDdZUCtwQnJpaXpMSkNhQzJzUHBnRHpZ?=
 =?utf-8?B?S3hSNFd3dC9RUDZpWWVEWitnYnd4SlRPZGx0THBrZ01weWpldG8xT2FOV1hI?=
 =?utf-8?B?ODkxdHBPcnZzMy9MaW5aUHdnUm9pR3ZmTVZnbTVrbitoUDlVSzYxanNZV0Rm?=
 =?utf-8?B?WmNRLzVLS0l1NEgvNGpkNkFFd1NqdlRVNTloUW5LUVlXNVVLV1ZYYU50Rit3?=
 =?utf-8?B?TlhKamRUdEE4VnJvcWI5WnMrV01RR2FVOTZMdjlrUFliUzZVVzZFQjVvbWpC?=
 =?utf-8?B?ZGtnTXdhSFd6SGU5ZEhGU3NTRXRVcHhmeFhrVE1IYkg4SjlicWo1UTNaZnBL?=
 =?utf-8?B?aktnN0tRR2FNM0xqZmRGWERIdGpQdndLNnk3S3pqMjFlTFlwdEdPVjcyN1VZ?=
 =?utf-8?B?eFRsbXdDUk9nbmw5ZTJNSkIrUE11Z25EQUE5VFlMZ0gzMDFyYkJwVWhJNEMy?=
 =?utf-8?B?WnRuRHBDSWhUSzZyMmcxMEo5dFRzV1ZjaTBWUUtJcHZsMkl3WHV2cVhTdEly?=
 =?utf-8?B?YTM2TlBNYlo0YUlia2pEYWlIRUdkZG8raWlvdzMvMktwVFFHaTNmMlZpNTcx?=
 =?utf-8?B?a05mOThaWm04V2djd3p4Und0V1BhVEVsdnozcHlzd1E5eXl4cDRLMVJJZkJY?=
 =?utf-8?B?VFJaKytmN3dUdWJGckxKV3ZnZlB3Nnk1SjNNUkNCTnpmUGpycUpBb29PTUpj?=
 =?utf-8?B?SWJvZ1NOcTNTS0JVaGlCNjFsU2FWcURtOHJsN3lqbG9KcTZOcDlTT1g2U0pY?=
 =?utf-8?B?Z1FwNFVXaXJFeTI3ZjNqanZGWTFXUzVERk1iMGxnZmZUMnE4VEEwbE1rNW1S?=
 =?utf-8?B?VlpkQzk5a0FhU010RlV1Sm1WblZBdUpOMWhXQkVSb1ZhTURrL0FUSWNldjBW?=
 =?utf-8?B?cXlMVEhyNFo5WElWTkcvMEpITkJqY0RIU1lHdGZOTFJ3MmZ4WFVPekU5QUdX?=
 =?utf-8?B?ZXdSVzNxMkUrVjlwMTRWTklKSzRzSVRpS1MzS0liT2JCa1pCNk5WdDdQRDEy?=
 =?utf-8?Q?Megnst8P9o6RbdmAqdO8tIw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9327b4b-8802-41ed-7a54-08d9f798d25d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:23:18.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtZL8nPqtG2+vkOeRKoS9ch3DwO/h19dSvUfHR70MswmH77JvOqMSctlAPW8oRBR/MRsmPhSbWXo5Fu3CUqadQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8114

1: AMD: collect checking for bugs in a single function
2: correct fencing around CLFLUSH

Jan


