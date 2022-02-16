Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA744B8B0C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 15:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274151.469516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKKyN-0007sS-Bg; Wed, 16 Feb 2022 14:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274151.469516; Wed, 16 Feb 2022 14:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKKyN-0007pf-82; Wed, 16 Feb 2022 14:07:59 +0000
Received: by outflank-mailman (input) for mailman id 274151;
 Wed, 16 Feb 2022 14:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKKyM-0007pZ-D7
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 14:07:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d71f3e15-8f31-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 15:07:57 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-JK-5HfZ6MmO7c7aXa1U--A-1; Wed, 16 Feb 2022 15:07:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6075.eurprd04.prod.outlook.com (2603:10a6:10:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 14:07:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 14:07:53 +0000
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
X-Inumbo-ID: d71f3e15-8f31-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645020476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJJn8F/jiv93/xBblC5frLONhzdSY4epWGtoae2cyoQ=;
	b=a7l4cV8ovIB4yKNC5gBXgJgBfiXd0Og5nWuQZUP2YTmTWBHVSf4yeX2WJ2gIPxNeW4VvIb
	rmD2jRzcVoFvOLXdJrvd1emD85UJtUnNgB3P4wxXz0iIul5NGX0zTgHjRRfMmNs6YZseft
	E3NwzybbqnIUx/8urv2HihsvA+T5rZ0=
X-MC-Unique: JK-5HfZ6MmO7c7aXa1U--A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqAk/LoloeXzVVP6lc1VNlFZb37vXR0wFssgh90X3dTeG5MCRrcoc9srSlFRKH2FDMnlU0yHDe02JO69bnHQhAkliS0Py+0k4QZ/FzyKZcvBg9EVaGLEjw9jD2MUOZdkLgVIMsWSuXusDDKoEHMMQXUFJ5ZaLFQh2wpb9ZIm29rwJgX6OaH516PsOXsaPjFdVOCZWslOZDnLbfcjBDM7/8qdK9t+nw83KbEqbQp3CR/xxke6/kQM1DyFMfTo7bz0idvXOcUN+0XXf0tYfK+ARLdnsrs0fso1SkNJDDMRej7XmNnlfMxn/cLTRIUa0bRlKYXde4Ar2CPWrF4J3LD2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxFF7yzodAj2dLHF+8uPBkHqQBl/XIXwrFeV8H6HRgI=;
 b=i1VMKEiS8sTYXBCCF9wKz575Uf6ojFVcmWSS0kX29L+CnwHHsi0JD2LrGorGGEsctta3sjEOsXGlxz0P541sGjpbjkqPbIUHZyePpTYy/yGuv8NjZj6L++IboPyy7Pd3NTMZoTbarrVNLwfiUVsX9AKTIMSM2PIQSdJ6H8p8lKGXLa0EHcugi2oLHf85s7sDrRwIVA6jJ3UdH3pH+cGA9qoy6Zz5qvtK7C3nzNB0ZpiqU7AZaZSI+OtZ1NPGUBlCPBCn4xp400pBY2NdbayFsF6z0EE8fRT8VXn6UxmVkDkmuHHCwb+vp7jffePHJ7+JdTIjzPXk8TkQnZBquXokLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f35a7003-6ecd-bf33-0f1f-873b96e967b2@suse.com>
Date: Wed, 16 Feb 2022 15:07:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] x86/clang: add retpoline support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216090300.9424-1-roger.pau@citrix.com>
 <20220216090300.9424-3-roger.pau@citrix.com>
 <c5657f85-e3c4-9c39-1a67-b5162b1f86ef@suse.com>
 <Ygzfcop5TrpeXfG1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ygzfcop5TrpeXfG1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5d9b51-883d-4722-6697-08d9f155b954
X-MS-TrafficTypeDiagnostic: DBBPR04MB6075:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6075D43978BDFB13F6F70E54B3359@DBBPR04MB6075.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tjN7fqeasK3+4q9nAhZEW/Vun/LMqwAG3uNwYjh42ezRfz8BOrmBw3cDVnbkAcKTD369uoe3VzMp6K4sxKqSHbf5tvN8PrxR66oShLpjzNQF88crOtJhFoSWDnrSwgTEtID2JIiHE3IsWDJXvptS7FBXK0JPok54moSfc7FiIVi6qckAhCggcBtVgP1iRRgssaXqIubpzLWOQkhqK+4o29cj3fE3RPFY8RsPl8EI+C5YUsiWlNbl34WbhqVhpQcpa9r/N1CypOTVa0OXOId/Sq/5yxTArFVbUVt1xt5cd08heIFbp8jjWaSLsltV65410hxamtAT3Yddqaxm6jAcLtYkPwVf7C6+oc5Am65MtUyfUB0P1PyHzaKBlLdoJcEMO8u6KNnbR9Xb3umAW2f5LhCtl6Cc+36TOL0Wv5KybqKZgY70ZNPyKt78Q8Dt5Zz3OUW71aO7Z1WDkVEaR2yKMd5kFxdwBW/QxpAeqr0aYDCHFSbioBnA1qTc3Zdol7rKqiwJVhQ2/zUxY9p3gnHzhbJ4SFFfXTbQcp9MpGnrSbvwC448C4wJOoxvK3bkzj9Yu2v/dt5plZhsBt2lyrirZghSLEVfMZEwko66aDv/DIEcfZv0w6lxGoYaz2cRGJvTuPz+D14U3PTjKfPymwan4883IbVr0ab32CiPxcGamb0yueA+izYP0gR/u7avXTCb6xmYcsx/a2i5WdIE/7VPghzdWiIln/UEIvd8JUxYRBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(83380400001)(4744005)(6512007)(8676002)(186003)(26005)(4326008)(2616005)(66556008)(54906003)(66476007)(31686004)(66946007)(31696002)(86362001)(316002)(6916009)(5660300002)(36756003)(8936002)(508600001)(53546011)(6506007)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g5NmsQDNp7qQ/ddx3C0Y6ACPgCUHsTKj1mPn1rOH0XqTcxuyWLq/GXlUvjQm?=
 =?us-ascii?Q?HcD/04Se02r5SwfMnc0zBcm/xJ0Bekv7d+ZCPtnDV/EKD9SkDkB+CFo2CNHW?=
 =?us-ascii?Q?u36vnhuzbc/vmL8aj+1gCNyCAlE0+6pPRh8ePyAfQ3uotPL2x4HEfnK7eGdq?=
 =?us-ascii?Q?Jbx3DbV//SNRb+9DFRSr3cGcKkyuOz1rwPC+LJjCQF3Ral6d14PU8QUY7nnj?=
 =?us-ascii?Q?EPVVWQu3BNH3HkI3zkYhSYwQlZ4D6ydObmGAc/5dPslcvnRrLYJbHmIV/42d?=
 =?us-ascii?Q?p+q5epVWqBept4oWpczSNA0rQcVCdHDtqn/QDdYGYf5pOfQKtxp1aqbMVfhx?=
 =?us-ascii?Q?WfMlhqICBcIMpv5XUCqNmnqk17hQ0X907eXgRr4KezMZR82WZmVwWaQovDpt?=
 =?us-ascii?Q?sgiJvpvsiclLFuUC4aPH01cbboez3xZSTGjVUorqROxc72JV0kLueXTz8lN7?=
 =?us-ascii?Q?ijmrpuu3kgxDulOSXL9vyOAU2MqkUdfo9UoweLKXOHW7HqPmekxiUH+qJgpH?=
 =?us-ascii?Q?TIVqkx4hgWg0xcZvWOuxnD1gJvTwc9G1SXzouihDQycO1lfPtb4q4CRgcrlI?=
 =?us-ascii?Q?BWi6bTxMBzmlR/lOLKPLb4A++32j/6i51gDlwt1xEV51fl1t2IS1A6I5QNwn?=
 =?us-ascii?Q?ApJiaqGiyruFTht2tr0HzI3BVC9UpK1q+YH8DkilSmyISVBwJB58Bc2DRl9E?=
 =?us-ascii?Q?2ib1M/4nIb5s0yRdKtNwcrEUmaJukXbmlN1CIQUhTpQUvnHgko1jNXtUoKNY?=
 =?us-ascii?Q?bYViu2cCH/Ga/09WEYDt8MURmbdckENUKUgDWpmGD1ILi/1vQf/cGRcevVif?=
 =?us-ascii?Q?2o+d6wBvKDA1IRpjjD3RBBgpmVoDUvr2Z7+RxX3PwfTvTojCX39b1qVkf85k?=
 =?us-ascii?Q?em9X94rM5iQIbIPxP0zZiG55zVbl65nzGs42ArXzqvGqU6oFx+JlGSmFd6RK?=
 =?us-ascii?Q?CgCYfcSamdbN+zBc0qjEbBIqfm7WUxFi6P+79i9k+NiW+MMO+nyvH/WsNnvU?=
 =?us-ascii?Q?NkFR+FExpuMROBt2NFPBeiGuMeh1ta/zqL/I/Dmt0DKg8UB2nScN2VhIQYft?=
 =?us-ascii?Q?oGU1daXNzinVt9BMQGRTrZ1Ewr2AANselSX9vI73PYIxpgfBmM6aoxNZFunZ?=
 =?us-ascii?Q?1B/CvhI87KIfmIWxEmzKHQDXB8fekjCDOQpSz8wsTC4y4XiOxT90jRKbwx15?=
 =?us-ascii?Q?euuThDP7Y4ZDyt9SgfX3bdJ62v1gRiVEHZhyYcwu816YugT0BzX+X187KSev?=
 =?us-ascii?Q?3n5ut0axzuTUNmxPg6pfV5mfx6l7heKpbRT0fOJPPBLtv8PFI72s6LOKMEJB?=
 =?us-ascii?Q?YWaIc5t3HBYrl1yQYpMccT98njbFw8vGVVWtUS82uAcLh5sBOyS0JiAsEku3?=
 =?us-ascii?Q?WvWtapO0AcGjbCBdLkECT84Q+0lTDoqH/orM+nTD13bY6wiN+54E2p6hNSHi?=
 =?us-ascii?Q?aSZwOXoQkvoxxKf9AEB6II9JpbxA796f1z+AUiygC4LQI5Jpm95FLisjCoq9?=
 =?us-ascii?Q?nVE6fUAhMDBqonXpz1MepEOxzCekCV5yI5q3Zhn61NVJ+Lg0KJ+0LR8BUHmD?=
 =?us-ascii?Q?Plw3ivWlvRoceAtcImLZtlsxp1VzAKPMc3E/bRKLAr5FxEur1PV3wkyq7Y6w?=
 =?us-ascii?Q?9y8gr6JK8gRY1Z+ijv5rejE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5d9b51-883d-4722-6697-08d9f155b954
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:07:53.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUPSi5ImwvI4szYDxrcM4G5RoRpWKlr/4IC7cblQ7riRGn8Ka1UswCaLGyBn6lpWVvEWNRvSyU4IBGCJgU2hrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6075

On 16.02.2022 12:26, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 16, 2022 at 10:47:52AM +0100, Jan Beulich wrote:
>> On 16.02.2022 10:02, Roger Pau Monne wrote:
>>> Detect whether the compiler supports clang retpoline option and enable
>>> by default if available, just like it's done for gcc.
>>>
>>> Note clang already disables jump tables when retpoline is enabled, so
>>> there's no need to also pass the fno-jump-tables parameter.
>>
>> That's one of the secondary gcc side arrangements. What about the other
>> (-mindirect-branch-register)?
>=20
> clang already passes the return address on a register always on amd64
> so that's not needed either. I can add a comment like I've done for
> no-jump-tables.
>=20
>>> Reported-by: Jan Beulich <JBeulich@suse.com>
>>
>> That's Andrew, not me?
>=20
> Ops, sorry, I got that mixed up then.

With the adjustments then
Reviewed-by: Jan Beulich <jbeulich@suse.com>


