Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22179CA21
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 10:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600106.935699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfysc-00045K-TD; Tue, 12 Sep 2023 08:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600106.935699; Tue, 12 Sep 2023 08:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfysc-00043Y-Ph; Tue, 12 Sep 2023 08:36:18 +0000
Received: by outflank-mailman (input) for mailman id 600106;
 Tue, 12 Sep 2023 08:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfysb-00043S-3u
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 08:36:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fef9c3e-5147-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 10:36:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7433.eurprd04.prod.outlook.com (2603:10a6:102:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 08:36:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:36:14 +0000
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
X-Inumbo-ID: 6fef9c3e-5147-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+ZTpXZuQBzvdyxfg4Z4rqsWDzUzgtrqV95A/PLsGyGXSpNm4KGNWhKR9MogN0ojqiOCMY9WK8ZXxYry2WZnTGsYBZannpop/bPhfhCEFdNGecwhGe579vJozBRZZcaniEbFGt5oIFOGyYND/pSeqr7nGYwbpv3crWklVT2+zFpiO7mplE9qsPW1T96KEoiiSk/bUv/Fv4G2kbvoKi8ouMsJKdR32cpk77TKaz/X70a2TZphS6Av53/cbN7tA/CJhdzxdTWDDdn7mg0eBYef4LLVBcimlVrgeIYpFzPiZu1GhK4YNtVlkRteOESGiKJcdX3U/163YxlDd9UtkfDwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmL7Jeg5F6aabbSSkb+chV53w/nKTUTcGVIeaubMQbg=;
 b=NRLQTdUVSui13gF7fBASXsJ1stgEApjxTx96jbND2h9tC42BH6J/gUxBLtunbuCP4lDnOQRk7h6IOUVqPIxk9OxNBWWUElsErGqBzOxiiJ5XB5NAOGYki+H534//5TaZuYb1G6H12o3KABf4Bqh6XgR+GkRnn+PEPlztisl1Yu3UvGiZgVSYEka9l+5OlsxDRusUEIDgD8khuiZPpu+bWX6EiL7JlzhUxNfxFdHMMO9R8FjzoL5V6VI1Soxh77kVcoxJvac4SpTGlikgdsUZqIYtb3t2BxqS9ijVcdJA0WQXbbn+1QCBQk9ZsvSk4ymFw5DW0gkcPTfP+jWgZiDoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmL7Jeg5F6aabbSSkb+chV53w/nKTUTcGVIeaubMQbg=;
 b=xmHfodXZO+lWbiygQuXibeogD7zcGRsdPUnCyValesLWXuHxTgrzF+VWPCDfC7BaKYTx4rnk1CZKZyqSLKL0DqoXQsyIwX1/1AoH7oXdzru7zf7IhY/zRmL5Uwp+ugspJIzgU/+lhuYa1TsNX3iIBXHgDKf1etR8I1SiIZ4n75bDYt3BWNZyNuHpZEm0eOv352ILjnyAJkvbRbg3I36VhZuIbnTHmQdbsJO/28VVm+KYsyGV58uunJc70mirOah7yhN3YkY3ayU/CVIKcgP7N+TZPN8Ob7+s2+wc//KGZjez6pJfm7J8XgjU4FoyBXSItOyM9uBhu/CIkofPFmQq3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <199d3996-81ee-12b9-91a1-c0152e911b94@suse.com>
Date: Tue, 12 Sep 2023 10:36:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
 <b08b8f05-afa5-4999-139f-dd7837db12ab@suse.com>
In-Reply-To: <b08b8f05-afa5-4999-139f-dd7837db12ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: d65d59db-d48f-4b3e-25bd-08dbb36b52fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9MJQ2uQ5MuYvKatdkFQy2NrStj+NHvN1s4Ek2vGFDaAdh4e3CEdZWeyn/6nOmn3HXLZbnjtGB+T11H6DLpnpr0BDgK9JE9ryTwszi0DSV92FHZTLYCJfs8DqT1TVcjsS5TcTkQ48ShSg6L11paSb7CMkICdeBtviQigd2uP2jOeCN7lwO3Sz56kiPivy2nc9VgEiLKnZYhZu2O+TH2C6DlRny7chVb+lwuBznkHQtbkhvSsrjmTmT5JiY4z3dLsLTAS3YNaYpO3RiIogYkJEimKnNAwtFcFeGVKhO+Giq3DreZOdpXS9fyIY2HvQW6EVOgFp8ow/Piz0Gdp/SiLJNtaI+Sf6up9CnNvzxXO9WTK9gJntzeegmjtjrrpCrLu1q8iBkbF1sPQZDKQHuUdH5FInvKJ6KlhgyJqzzX3oK24QKC4ocxRDpRLJ74nT9yzyQmNfkq1vHYz5V8e3R/rjDhsZHS44H5q1TMMdVB3v+sFev0h57IP0VnoO8wQ3TSUtd/0v5fIV6GvhL5ZiA9qPtlKPhD6JRVvr4v3PbdgPHin28cyjPzgU2B14il2Gzj1tvbQI0pkCLohjjwGSvTYrA35PRGRvzVPfrNXVOBz0cyEdNyYG1QJXlqJC0DgvLlEzl4XFzszfsFwUf+t5EQv0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199024)(1800799009)(186009)(66899024)(31686004)(6486002)(53546011)(6506007)(86362001)(36756003)(31696002)(38100700002)(26005)(2616005)(2906002)(4744005)(6512007)(478600001)(5660300002)(4326008)(316002)(8936002)(41300700001)(8676002)(6916009)(66556008)(66946007)(66476007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGMyaDBmUUZHRVdkcVZsSHo0d1g2dmdMdDFLRHNJc3ZVengxRC92b2ducGZU?=
 =?utf-8?B?N2xWcUtQRSs2cC9hV1h4UHIzazNTbVlybG16U3F6Q1hudFBUelNKWFpXck9k?=
 =?utf-8?B?blNJQ0FkR3hYZ3NPWHZESndKajFEUXhuZC85ci9hdnZxaGt1OHFzK29TSG9Z?=
 =?utf-8?B?dHBqcGNIYlUxUXlERlBXdW5RR2NJR1JaNGxGMCtoZ2RIQzVKTnc2U2YzdGdl?=
 =?utf-8?B?WmFmeW1SL2ZMbkNXMWZrb281MTcrcWRTdUcwa2EvdVhMeHFZUzg0V2FoL204?=
 =?utf-8?B?L1pYOFJ3SDYzRlcxN2pJenhTb3pHOGx3YU4ybUN1YUV3ZEtDUER4b0kyQzc2?=
 =?utf-8?B?WGpoRXM1UFB3Ly9yR0hvVEY2cTdXaUpEQ0pxL0lXamxQSEZpUlVMSUVob0ZR?=
 =?utf-8?B?WnBrdTZISEpCeWpCOHRNRThNZGtzRVpnS2pIbkQxT0ZjZVlNV1orNnJQUGRU?=
 =?utf-8?B?TnNzYlFPWUJ1WmJRSjUzRWNQUWZnclFsaFlrWHJMV1U3bzNEdGd4eXJCNHRy?=
 =?utf-8?B?V1NuMm1PaERzS0JvSlMybGJMRkVwODhVWlovSkcvTU9jWnlsam9ZVC9LTFJt?=
 =?utf-8?B?Z3o0dldhOCt2SGFDUjM3UjdzSFYvRWhJem10Y2ZSRzltNldDZFhpZjdmV2l6?=
 =?utf-8?B?T3VmRGZSTDdueDIzY2RtcXVRMGMxRXVGemxid1JrWEJVYmkyYlhxSXQvaVRC?=
 =?utf-8?B?akhaNVdlWkFodUJDSGR0ZUxSdGxEQWxKaC9yWE81WTI1MlBONFk3Z2w3LzNX?=
 =?utf-8?B?cXloRmJmU1JoajR0NVk4dFg3b3ZFL0l0UVV5ZmxqWTFNOWp4Y0N0aHdSV0Rh?=
 =?utf-8?B?WS9oQmJFcW1EM0c0WE9QWUpxRHhuTlJxUFZYSzVqRHA3R1hEOEFLY2g5R01r?=
 =?utf-8?B?ZTFGOFNiSHdSYkVKQUNpZlBIeHRselNmWWZYTW9TU1l1OTlSWmN0a2t3aFNk?=
 =?utf-8?B?MVdyTExxTlZ3NWJUTUMwYWtSQWJNdllCUnF1K0ZDUkFYTFRKZkczS2xvTUln?=
 =?utf-8?B?N3dzRndPdEQyNDMwenV6eVM4bkQydytCcUhYWTlVUkN1ZFVBMTh4aXBJUGUw?=
 =?utf-8?B?ZjFCQVNocjloWkdlWGJjQWdwQWpJaFB4TmRqZnhzblYvLzNIQk8ram5kbnVX?=
 =?utf-8?B?THNDV1diVUU2bXFPOXVGLzBKK3FzM0RlSHR3M0RJendRV0tBeW1NUUlxdzF4?=
 =?utf-8?B?YUthSDhVR09RcHpHbmxrajdCZHovU3hVUHVLK1k0MmtYUTJTTGpUK2ZqQ0ll?=
 =?utf-8?B?TCtFM2V6ekc1cDQ1L24ycG9ldEhKT2VrYS9kc2JGK2hSRGlCQ1NnRkFvaGtL?=
 =?utf-8?B?Y2R3azB4YnFrU0ROc0hZdzdtSHF0U2QvallISW8rTkIxNTdUS2dVcy95TFJB?=
 =?utf-8?B?eUtuc0Y2b1I3VFFrVmRzRGUzV1MxbUI2M3gxYytKVWZrRHJsTmJVTGVYZnBS?=
 =?utf-8?B?LzUzQTVLUG5aaUJCT0c5OUh1bU0xcmt3dDhxd0Jsc1Awc3ZwZWZ3NVdiZzhT?=
 =?utf-8?B?c3RlU0lvQmhTVEN2L0JXWHFNT1dUcW1XWDJzVnRSQUIzaFlHd1ZNNjZpeTJS?=
 =?utf-8?B?TTNvbFROMEtmQUV6aHkxc3FOQkhyd1BXMGJ1Sit5RUZ3U1pWWkZlSWx2d1Nx?=
 =?utf-8?B?QkhqWk9sNUlQK2JFRGJtR0FVMjR4d0hqYXY4MFY2b3FGYm9nd0tTbXVaYWN0?=
 =?utf-8?B?OXVSMjYxc2h0ckg5TWFueEttK0l6WHRadWY2eDd3c2FtQlBRbERMcmtueWQ1?=
 =?utf-8?B?SndNRkJBbWJXUEJaRGJlTXdabnJzSytRajhVR2xWWElIb1RuR2RWTWhpRkJu?=
 =?utf-8?B?L2dmeWtUdGFJZFVxeUg2M0Q4WTNIcXVSc3BqV1VwelpYSTdpOW94bzZIQ1d5?=
 =?utf-8?B?ZG1pTDlscWNJQTl3NmtWU3pIUG5LTVdLZFZoQXR4RVRydHRiOHZxL3FRUUdC?=
 =?utf-8?B?bFdlNG0rdHd5TWcvQjQ4RDBnV1BCMGVMYytiQkFXblZsRzdTSFJUUW52T21O?=
 =?utf-8?B?UUVYU2g5WlBVRi85dTVEVGFsYzlPeXcvRzIwVitkbTMxOTZVZDlMSG43OHEx?=
 =?utf-8?B?OTNPUnNsc0pWUEQ5ZG1GZXdTYk5qcDluMmV6MnNSL0Nhb2Y5Wnd4SzZkMUZK?=
 =?utf-8?Q?eP9KVS7q66QR0uSn9KxLRRIkw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65d59db-d48f-4b3e-25bd-08dbb36b52fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:36:14.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it/aJBCXsK++2y09CoaJSyW8jbmN1yGSd6FXWARps1NL8BWN5Vp1Xyw6p/R9fqICtyoUvqOazr1SoJIUP3UsJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7433

On 12.09.2023 10:33, Jan Beulich wrote:
> And note how I offered a compromise by someone (Simon, you, Roger, or yet
> someone else) sending a patch against SUPPORT.md. Yet that hasn't happened.
> I therefore continue to be of the opinion that I can rightfully revert the
> patch, based on process not having been followed and alternative actions
> not having been taken.

Hmm, I now see that Stefano has actually sent such a patch, just not on a
fresh thread. With that acked and committed, the primary reason to revert
will disappear. I'll mention the other aspect in a reply to Simon.

Jan

