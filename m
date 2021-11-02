Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D79442DA0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220168.381322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhseo-0001Hv-6b; Tue, 02 Nov 2021 12:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220168.381322; Tue, 02 Nov 2021 12:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhseo-0001Ex-3S; Tue, 02 Nov 2021 12:12:50 +0000
Received: by outflank-mailman (input) for mailman id 220168;
 Tue, 02 Nov 2021 12:12:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhsem-0001Ep-OH
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:12:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30cb3d3a-3bd6-11ec-8556-12813bfff9fa;
 Tue, 02 Nov 2021 12:12:47 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-dsSn2HWhPWqy0m1C0H2knA-1; Tue, 02 Nov 2021 13:12:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:12:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:12:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.6 via Frontend Transport; Tue, 2 Nov 2021 12:12:43 +0000
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
X-Inumbo-ID: 30cb3d3a-3bd6-11ec-8556-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635855166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kp/cFWWPNFd4S+Sof3P+V387ePicF7tuTQi7nlzVCgs=;
	b=MAlaYufrRmVX5HyJjLhU2CdqbjWiFZ4YqsGBqC2SSoEur//sw+XjpSDiI3IPQ0Amzdd5IK
	c6N0uEcz3+xr74jz66BNBaiE2RGmQ1iIgg5dpXvTifCf4RbMQcJTs+liqf8Y3w6/ClVgOa
	juAnSkMDYDDIPn/NIY3ZpMXKf3bi4zA=
X-MC-Unique: dsSn2HWhPWqy0m1C0H2knA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwNg8SRUK5Drr8uHMdpKg9dOqBEt6+XFmdkfEuurGQo7VxsDIS04mW39475voUIO/KIPYYjK1JpUzb0iAhewz/FsC2FWtF9f7w8WkqpPw45IstUachoLEdX8cb3uWZm4DwHIukyPv0pzo/BOYuMWnX1qaXKKPNvUWiZJJP1YB2RDRyRrRab8qV/7mzxufpvh4TvM6RsQ+AZgraoHWCYoyMtid1prUVqnlODShMc9MlQcutTng2h2nIGtCHBTpQlcMbgQchrZJucxz5GucNxSI41VvhQWsvFNHq6uEShj+vhw0sD761SAKAZmdhi3iu+ROxT/T+Z7bV1NIYHVlPopcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W//mcTxEnQG24WH8H84I2kT696pxUDWRtyKCBtqPqj4=;
 b=RoRQ5yf33lkqVgDePJ/k7hpsorQ2u7QAy8bhkxNObg49jiKACNYnNzvMO2Ejc1VzZzQ5g0fW6WBlurtL23+Tt+rX/RXeqpqeurECWbxgPd9e4AKWKANY1Yca4zin0e/W2N0PzPM2wMbVLk2z7L0pN5wn10tXGi4cY9zJCpXZt9ILlr8ohWU1JnpGBxHI7dZ93IVdrsKylfO/mWnAc8fn5vyE33E5qDlRT+rhTdMEqCnDEG8Ci0VBsE3g54+D7UOpYdH4lAexf+ITu0pz4lfjULPauVC+DUZoG9yqLEGp6wibrKA4H5wsjhcSz1YBPY66rSz2pvFTtw7FDyH8/3ijog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43b87e4b-292a-57bb-5f70-5c8ecd0ea17d@suse.com>
Date: Tue, 2 Nov 2021 13:12:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities
 to the toolstack
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <20211029173813.23002-1-andrew.cooper3@citrix.com>
 <YX0qmTXBD3jSXjBI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YX0qmTXBD3jSXjBI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec352171-8083-4cd7-96b5-08d99dfa130b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4189B26C723C3D965D71C250B38B9@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LcYeogG6UPHgtNMPtbXBCR/MDKA5Ax6V5sfTJdjj2lRSRbfLUPhY/cQioX4uFm6dDfkVnAcVdBm5G/UDCbnLnsUH3L1+TlMhYwKIACimC3kWnmhbD5Aq5wJftOrnYGaeLsMl5A/P+9JjIkoOOPvkXx3Dn5wMfo3GgGaNJoRraorOnIFAATc9g8arBkVpyNACBRctyaockmXVmqCykSdDr8XQ0G5Odl90gnU48gaHQr/1n3zUkGMsfHzfmXndbI4rNxewGJZAWRhU2PSeOkUDBd1EqAN/wLrigDI0w9OFK6sJeNVYi7sCj+cpjLxUN65GcsRR4vI6bqcc1kWiiz+0F1JLhth1UNmGXxENe2TFK5xkurM6satApuxMoVzOPbZLeLchxKssIqtQ0u5mGR/C0/bf5Phdh1/WFXNmp9HELLyQUlt2GyraKmYwaCflfgGKfDp5atv/Ub28MLowLnKotIf0dqEDRpS/91F3iD+gHb1WwGDW/cMuWeLUDIJYtv8lgxgtG+2BnrXZEyykkBzNnJDzM+ljpMk5vQPuk3Oaf3zBxWl6JEkpFDoa3qG508GGM0lTllUaisyhwwf8EZT0we1k14YQk0wIsXQdnj8OqepFMNkwDMFZLe5EJn+jEoWlXROLJrzxpFwqCHX7ZD++Junu8p11cP0WLdg9PPNAtLxSLBTYOwx0eOCH4A3B39EMuoLvXccOX/663VI5YaOKfhHrlK9/xnKiYbbCWQ2gTu+dTET0ZF8dLzam8/Q8RMb8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(316002)(8676002)(53546011)(31696002)(16576012)(83380400001)(54906003)(31686004)(956004)(2906002)(8936002)(508600001)(4326008)(86362001)(2616005)(7416002)(38100700002)(5660300002)(6486002)(66476007)(36756003)(186003)(6916009)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y/Ax/W80vF9dQ0z7HgooSbd90sZLVpBpd0v46pit1jEDf+56Wy1ovry+v7ww?=
 =?us-ascii?Q?wde8zEf7/MLC4lYvHRhApbZ0yO9OcZbuKXdy+Jy+HvvNUbbGUFztVs0vbQfT?=
 =?us-ascii?Q?Nq4G3lmBqorRJuW6dd3DV1At2wLxPvtizQR6m2PCfrkFojOYGhyOeveeIBGb?=
 =?us-ascii?Q?w3RGpyB4URC5DTsBXfYo8fAiaGGoXinqm7zSd99+jT3tA8GILUBy+p3DoZgK?=
 =?us-ascii?Q?qQS2iiJlZv6fU+s7zb5KDhMrNB8flnKfM4RfCuP88Ea5VvcyAlGF7vLEkek/?=
 =?us-ascii?Q?ZK0Iq3Uor4zMvXkSUER9rTGtTp551Ki8u+ey8/9lIUEq4ZaxVubj2qXLUiYF?=
 =?us-ascii?Q?GsOeY3S+dyC0m0YanN1TLPhVeB5oCYTNC0S4ywDalUDc4BMf69qIAyQXGEht?=
 =?us-ascii?Q?Cp6qsxXp/15qOySt6+nP4xMvmGNRIVlK7EkVMSxQRr98b440tDiNiBoP6Vox?=
 =?us-ascii?Q?oINF4N44vm2k5075CGQSExIRzlVGDkm+Fuswu3HX0cALfL2mg2pZnHgQoeNZ?=
 =?us-ascii?Q?/4FSFqshTfzILfjOKMm+qiztJZM2ygrYcfRkmahUZ2xFS2c1jF9qS9MBlg8l?=
 =?us-ascii?Q?YCVC2wsI2X7mY79RPOxNCnJ3mz5gfKb3kNhzZNOsVO60wMKyHGL2fn64MzMP?=
 =?us-ascii?Q?7L9EvR/gFHGLOKMWEm2TjRatpma1oHAmIGIZClfc8Lm/lPa/cn8umliSo1Tb?=
 =?us-ascii?Q?M2sZy15OZOHjRJTkKoee/WBorqVza1NUnDTMMnRPqJXR/WnAZ2Co/Xyp51/3?=
 =?us-ascii?Q?NTXcSk1zYM03fMiCA1/YWHXw7QHZkOCRvl7aSANAtYGny4KndeTeILnOWQNt?=
 =?us-ascii?Q?22fm9razu5TMG0KaAAsI7O3A7YFICUcH7CuIUOG5vWUZQTByrnpkUjzI9kPp?=
 =?us-ascii?Q?pGYEy9wrsi7lwtMbBqDa9nFYOcXTlBlLuxFB/7xDnzLeALdJB6sG3G9mFlBK?=
 =?us-ascii?Q?TE0XyNfRuWnGQe31cmOqjJV8hHryyhH46ERVlFHZMgD1P+vE7OOtxkXJpAMs?=
 =?us-ascii?Q?zanP0P9OZLOqLGom9j7SbJfa1iyP99y0YKEQ/wFBlW2uvAxqV4bjb2+DNAC5?=
 =?us-ascii?Q?xYCIfcVKPwFoiAEPPODXi92VznNNbkQiZ8E7oEt1Y/kQns5ZwtKflEo5mYzU?=
 =?us-ascii?Q?3aR2o7ve04mtFodLkP0tvuFGEkbdwc+ceAS8T1tAZ5IImEBprFx7m9fqxnR0?=
 =?us-ascii?Q?Rlls7SqX1j7jAiea5LCFyFtUhb9vJr6KdOM4PQXoe5LBVoeUcstethj7Y3zh?=
 =?us-ascii?Q?XiykZcJOaPSK+ASGWLZBEqMZu0JHcpypeBRzWo8gl+r90DXml86tERmoKIA7?=
 =?us-ascii?Q?PCLrVxeEe2EX+AJtsEZ/gQeL9ySFYiC3zrtbd92h2XC8Rv7UpCqsNJ4DQhz3?=
 =?us-ascii?Q?PtH1r3mlBzT5gslqN7OgCJbxneRxROsV892+2Ouy4vVAAjLZbcqWiFaI+5lo?=
 =?us-ascii?Q?wThz3aPbO9xYxPMx01IOoZF7w3t4uRrbSfJWAB6Xj2cikvW+F02PzmVIbcNQ?=
 =?us-ascii?Q?XHQ12INiZqbwjNbHX39X0ho7QRdAaNMlkFE+TB2oaNbifUCqenoO2hNrqoqK?=
 =?us-ascii?Q?Y8ayvv+Cj0/YBmD90QVpQZTkjcviG9IRMKVVRwgf+89BafU0vpzVpMUUMSaH?=
 =?us-ascii?Q?KLJmtHt2ongDS38rzWo6nho=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec352171-8083-4cd7-96b5-08d99dfa130b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:12:43.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVHyUl1pa/6CLETdrn9NZ+Z+SziZnu+tqL1CpbSmaEzu7oZkiTLDoKw7cmZlgMwhMvkAKP98UkoUcNSFE3mMFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 30.10.2021 13:20, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 29, 2021 at 06:38:13PM +0100, Andrew Cooper wrote:
>> In order to let the toolstack be able to set the gnttab version on a
>> per-domain basis, it needs to know which ABIs Xen supports.  Introduce
>> XEN_SYSCTL_PHYSCAP_gnttab_v{1,2} for the purpose, and plumb in down into
>> userspace.
>=20
> I did consider exposing the versions supported together with
> max_{grant,maptrack}_frames using a new grant-table dedicated sysctl,
> but maybe it's fine to expose the version as a physcap and fetch the
> other two separately?
>=20
> I certainly didn't look much into this, maybe it's pointless to expose
> max_{grant,maptrack}_frames. I think the toolstack will need to be
> able to fetch grant related limits on a per-domain basis like we plan
> to do with the grant version in order to assert the destination host
> supports the current limit applied to the domain.

I think the other two are a better fit to expose via hypfs (alongside
the version). And indeed they are being exposed there already, just
not the version (which would imo belong there for completeness, not
to replace the exposure as a physcap here).

Jan


