Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2A456D1E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227716.393950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo109-0001No-L4; Fri, 19 Nov 2021 10:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227716.393950; Fri, 19 Nov 2021 10:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo109-0001M2-Hk; Fri, 19 Nov 2021 10:20:13 +0000
Received: by outflank-mailman (input) for mailman id 227716;
 Fri, 19 Nov 2021 10:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo108-0001Lw-Gc
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:20:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46a81cb8-4922-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 11:20:11 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-oK8rPr-fPAyE3vRvy0ugQA-1; Fri, 19 Nov 2021 11:20:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:20:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:20:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 10:20:07 +0000
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
X-Inumbo-ID: 46a81cb8-4922-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hvD5f7vYvUumDXt1OhnKd+iB6NRIj6nlyTFIoMhRVPQ=;
	b=MyUQIi5rRuImSPl0ZKoIPHFDMPL0ek6mpHq1kO6YNe6pAhEY4af+q+RbAfNmq+mpxPy8e+
	JTBdmPhXShUpWpPZk33CNUxIWHR6ikUJ6DhVlrmHN748Uf04nIWEssGOohHYCcljgRsE8X
	6hq8lCquYylDqEgbyzalLl/KCTfCQPE=
X-MC-Unique: oK8rPr-fPAyE3vRvy0ugQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB11S88sJOQc0o8gyfcfsB+BaSOz1atCcdIg1DPzxiAK8leKb0b1EXM/y2WXINJDHC30xtaAcYd//BYDbujN0Bsu1ztiJHT6v9qA79BBU1yafiqYGBYrvHUNdgpNthjC5MW75zK18y6kXBJn6/6g7j0gp2wCCUf7sUvHNyc8Pfh31zJS0ZHUOvC71QJUU6OPCOZE9X1p5u/Zem1jpsMyGxItsLtUprVf0wI1rja+ChGflrpkFLnDQovepMigGSCsi++CGeu87edxFgVuD02UbEBpQvIdWgwJX6EDcBnFZLALfl/X3AFar5l3KXsgcmYR1k0O9MXZqRLfi3oL03fnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvD5f7vYvUumDXt1OhnKd+iB6NRIj6nlyTFIoMhRVPQ=;
 b=B25ZUIKoELOAeJDDU0ICNr7RJGKLfarp9m9cg6NZoD1zztSLTS8c4TNUyvVs7VQ+6PFPZx+etScgpUnlLBLwkcdkCTu6GTO9eNsNbF4zLExpr5ZpSXNWzNm9E2njD+K6XWgpzzQAm2guUWUjHjYneLDvoqMN6LIuv0u5GbTxa0anu8cQfYYeGBKQz+8tTk5Q6RCSNw6PVi9JhcyKp6KWb8OZ1AQi5Ag725wU+nCY8JvTTpUW/WYspo9ngzkTTLFd5d9CS59FUd5etnK+kqIGtP272cn1f5oGGwTdU9DJYbr6jPc7l/VDseh0bl9SE9cPHwCVidF8HKWpr1l1p1HmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Date: Fri, 19 Nov 2021 11:20:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] (mainly) xz imports from Linux
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c42fa28-1ce7-452e-6698-08d9ab46291c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270486A223D7FDABBF5EC4F4B39C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hhnZeQW+HFCMJUy+HpsDW1s79axNpqECPkZoXLwTZnx+g0kU69NtdbKYKB5HlmdHr8XS+MSm2JAq4uDHTYK03yg3Lose7la7whnN1bcgLeRzOWMZM9X23p1DpyGO7ir59V9Dt6RW3vceklat2bi1aJj4Vvxk3KW3CbC7odmuQPpbFHKiSqgJpbISa030/5b36TfB8YesO+yx3oOqUBXhGg/w2DhL/Bh3CQ5YdaUVPeFETZBf0avUueP/WwHW8QGRkY58hHQHgupUcRjENRk9oiLpDisW4H2PakySE2cJYGiCxK+Zdh4VFfA7MbA7v47b3LPuQIaOGUNWDncXS5FwQ7unXXMmsL041nQ5FbEvf1+p//gUkIMCu1gOm+8siLJkq/BYxQYNjGIaUCWLyHzwyblugJlqtRRvzU5lW/M4P8pYW5u7Ytx/yODboEKxR7AQncVuiCc64AIqswOfiNHzTdOqudlNpsb8cQZxgbxMQhm3mihjf8Z5PObHgjR96uCWe0bf+GMGEyJjpp7p4z1MvTZ2eHAHX2xTcLsCdd64EKC8JDIEuOO3QbggL5nuX92ieR/UMUx2wKhNl8OzhqSL6Pg748x+Dg1DyYWV+dexsZeS+WUV5r+65YsgtKqVt6wrkXPRyW7cKuWC6no3PcCYNLjGP2DC6o7sE36qW8C3B8TSY8ust22D+iJxRr0YsRcD0qcrrGyeyG4lBk7vKoH0pAweyoARp8MvmQdHl2f1cww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(508600001)(2906002)(31686004)(8676002)(83380400001)(66476007)(66556008)(86362001)(956004)(2616005)(4744005)(5660300002)(26005)(8936002)(6486002)(186003)(316002)(66946007)(54906003)(6916009)(16576012)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERCVExjVE0wU0dubVlYY1RkRXRKSkIvdmFaT2MraWd4VStkUllPTmxoVGVx?=
 =?utf-8?B?dENxa3FGSm9RWGY3MnVnQm9zWHIvaUdDZUlHLzhHcVdoanNHVzFSRUJWZm95?=
 =?utf-8?B?WTFaM0JGdDBYYjhVbmxFbENZajBWQ3JJVjNoV0dXMG5paVhsT1o1S29KbTFx?=
 =?utf-8?B?MDVxVFN5SEdNUjRTWU5tUzJrbEROUnFZVEEyWU83RkdpL1pydkFqaFVGMEQy?=
 =?utf-8?B?aVhsc0NRZk9BOTdHaGQ3WjFNODFVcmdubkpsOGtCci9PMERYZU1Hd2JCVWJF?=
 =?utf-8?B?WTI4Nk53Y3hYdWptaytVU1dldkFJbWtMN2pRcWFKTnhnRk8zeEtWTUx3aTM0?=
 =?utf-8?B?UndTWmduQXg2Qkl1dmZsOXRBSFh4QjVpc3FRcDRLRTNkUUdmbk5mZ0MvZjRG?=
 =?utf-8?B?NS96aHVqWjZtMVI4R1cxUGJ6aEZHUUtoR1FQUjc5bTZuS0w1QUJBZjByQXps?=
 =?utf-8?B?bjFiMVg3V1ZqREYrVDk5cSt4K0ZIbkk0T1VodUlaM0p1TVpzVE9NaXZGZGtY?=
 =?utf-8?B?T3BOZVVHckJRTSsybDBpV093Yk93NXNrZFoyaFJtckRRR2RGYlR5WkQrWi93?=
 =?utf-8?B?c3FNMVdnMTJ6dk5mY1h0aktVZ3dLbkoyZi8yaVVwM2kvcjhPcXZyY1lMbW5h?=
 =?utf-8?B?ODFvcmJLbnQ4MjI1Rmx0bG5POVJLM245Ti9LcUFWL2NNZEo0SVlqRFJucHlI?=
 =?utf-8?B?ZTMvdlYyQ3VESCt5aGhyNGpYNTFRbzZPVG1BV2dDb08xNzRsUXgza1RqNDNH?=
 =?utf-8?B?ckQ2RUltaTdTNmxNVFhBSHdsOGcvSDhPT05rM2d5U1g1Rkl2cm8reUdwRnVY?=
 =?utf-8?B?TWw5Y3o4U0tyU2QydkFld0VSZzB0VHoyMXFIYlNXbE9oaFNaYU96MlJtNEty?=
 =?utf-8?B?WjlldU5UTng3UUtDN0VNK2NTM2I5L3NJTXEwMTJVazNBZTNwLzJDYXNpQnlL?=
 =?utf-8?B?WC9qRFd6ZEx6U24rTzNtR3dUR3l5Wkc2NkxxdE5SbGFjU1AyZng4czVTUVlJ?=
 =?utf-8?B?QnRNTTFmaWFIRWdHNGtjUEpIV29QQUorQ1RSZmRlWjFBMldscFdNbm1PZGt6?=
 =?utf-8?B?QURUOWRZRTFSc3pWYkNhSmloTmtHQ01RSW4xZUF6NmRVRjNqdlgzWk8rbjkr?=
 =?utf-8?B?Wmgvd1dIWEwxREJrY2J4QVdwOVI0cU1xK2pSTTF1MFdyQnJNdzJxazhrT1E1?=
 =?utf-8?B?STJLY0xGczl3ZzRGQy8wbERIWHZHdTM0L3lHWHA0YkoxOGpPL2lwWGJYZXhI?=
 =?utf-8?B?MlpzVkRKdkVuUFVORGVaZWZybzB2VW5ha0w2NnF0ZkYrbzArV1lzMnJLdFdG?=
 =?utf-8?B?TlpXZEZXVTRVWWJYcVVUaDh0cjJRVUlvSTlUR2JjVk1nL0RiTzVYeng2Uktj?=
 =?utf-8?B?MWF1OTNLMURwbm5WbmhvaHlyNWd5Q0dVcWg4Y2FxQUJRVWZIcnlnTXpWTWxi?=
 =?utf-8?B?OFYxWUFnUnBqUzdjMDBRTGJWOFJjR2QwNWgyUGZJanRLalc1Z0hFVmtMaUpE?=
 =?utf-8?B?K00wS1o4bWJTNXFNM0JtcWJwUWVoOS9NblVINFJOcTJTWXNWc1FGdWdFU2t1?=
 =?utf-8?B?VEVzMytaaHBwY251T2RZaFJORXJSbWJnZkVyd0ZaWUpPeGdqOWxER2haZElU?=
 =?utf-8?B?NGNUeVNZSnhmK0VwLzFoRG5yeVEvMjJmM3hYdEFjaXg2ZzNkODZKRk1WUWZq?=
 =?utf-8?B?VnlDaDFockFJRkE0T3lNcEtCQkxRUUhkYW9PU29rR3dnUGdVWEZtQ3JWVlVs?=
 =?utf-8?B?N1hpMnNISVZJemFPcWVIUTZ2c2Y4ODVqMU5WUEFKakUyUllKRzNsRDJRZnhS?=
 =?utf-8?B?ZjNlV0pBU0NsNm0zTVBkQVFmNGpHN1hGVkE2WDErZnZOMjY2TGJMVENlbzlC?=
 =?utf-8?B?TlhSNENINitscjExWFc3cmx5YVZTM05sbGloWVkvTWxPM1V0ckxWOWFyOThW?=
 =?utf-8?B?bitDN08yZXd0a1liRkROdmFHRjFaNGdHdU9EUWxFcERLQ2tZWWNKRnV6WGhC?=
 =?utf-8?B?ekxIVDRFUDJTWjVIOXI0Y2V6b1ZKeUw3ODJ3OWUxVDlybU1hSGNQV08xcjlB?=
 =?utf-8?B?Tzd6WjVqc3BWa1dTVHJxbDFheXVuNGpwbHpOak5kNHhJdThmNHQzeWFyM2Vz?=
 =?utf-8?B?S09SdDFsZXlJU3l0QVM4cjdibmRkY0hHTkJpYUJnZDBTTytpSEZZa0oxbHF0?=
 =?utf-8?Q?xZXcV5uFyi267gI5l7UYobk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c42fa28-1ce7-452e-6698-08d9ab46291c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:20:07.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qm9vUAsO7jegxQE4LsSz7l24S+x4NgKYndJstbhUG48U1oquqRIFHjE4yReu82v3YH/O8WdM0h7hBTI2chf8Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

While going through their 5.15.3 log I did notice two changes, which made
me go check what else we might be missing. The series here is the result.
Linux has also updated zstd, but that includes a pretty large change which
I'm not ready to deal with right now. Them moving closer to the upstream
zstd sources is certainly a good thing, so I suppose sooner or later we
will want to follow them in doing so.

1: xz: add fall-through comments to a switch statement
2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
3: decompressors: fix spelling mistakes
4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
5: xz: fix spelling in comments
6: xz: move s->lzma.len = 0 initialization to lzma_reset()
7: xz: validate the value before assigning it to an enum variable

Jan


