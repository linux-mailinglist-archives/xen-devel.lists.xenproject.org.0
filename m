Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A340C443F29
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220648.381989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCPj-0006oE-Df; Wed, 03 Nov 2021 09:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220648.381989; Wed, 03 Nov 2021 09:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCPj-0006kg-AG; Wed, 03 Nov 2021 09:18:35 +0000
Received: by outflank-mailman (input) for mailman id 220648;
 Wed, 03 Nov 2021 09:18:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miCPh-0006ka-NR
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:18:33 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4ade422-8d7b-4f8a-832f-f1b3c0e526e0;
 Wed, 03 Nov 2021 09:18:32 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A39F5ar003191;
 Wed, 3 Nov 2021 09:18:28 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c3qmer0cb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 09:18:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3376.eurprd03.prod.outlook.com (2603:10a6:803:1d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Wed, 3 Nov
 2021 09:18:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 09:18:03 +0000
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
X-Inumbo-ID: a4ade422-8d7b-4f8a-832f-f1b3c0e526e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzT5AGeRpTZlhA5Fk9zEaTUDvCIDY5MdPjzfmyG/KJQ0LdbcC0CY2myN7d9IjZOrtbegEYykAaSx1NBfgdaQrfE7j3pT7nJmIZxBoIFJcNW5D692VHq2XqE4nenRbQSe6jGeqlSNKjE+XXfq+paSpNK8gckUzHEGyFm21GQqvylPeLdgkApqojq3E+ggkXmnsUHFlyiEiC/np153hzba84Zy2iuRDNHM/oEQcctuJiN77uz46wj2SxqD0CtfOjhCjyyI9EWoCThfOlQPyNTErrIQs/SsV5/YvGcPw8XrKRkWsvhT+eysDw41M0okZc/22dwNntbGn5FYb/wXrjmlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnzZ8TvgqhZS5MW6fpjCVIyDv0MGb/fQkMZ3v1A+WPY=;
 b=mwmVdxllXAuWdIDyGuEmyLoeVcZVajqBidm4FMsF0KM5j3rfNlyeZWAa5GjcZfVx6jIX+Iqlh8pWmw2Kou3zDS/A3K2ZOdkqdpsVFoMxrCzO53wifkWWDM6wPM/6DfgHHwka3pJ4ggHvpnoGCkD/Xm80armai7neCeBA70tms2RclOgsfWFZBQpFBivkEvRh5lVu7ZQJ7Lx0GFKY/dMf3fyv27UO57fxFPHEaandJjBqAmq/USPJTwBYu9lKhBO1P6QbM1Amr5vXZT6e+7JaXvQ2rFLA9tUSPqZDimoZwfItqTdZmbg1aQPHm+IA1rps7BgDr+vEPPIxm3Xz2aj4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnzZ8TvgqhZS5MW6fpjCVIyDv0MGb/fQkMZ3v1A+WPY=;
 b=CuzcPCbcwSkBZOtwgmsKWxnCXywf8SVobeoVCB4msoYSsOR5COgUzlhzrrwyyN6LSE+1i29Y+xqI5eXFMONS/2DrOOi/IlxOs+f0nR8st81k62BlRHqgh6U2ZV/qtl6hhbmkVrsrOX8LqUgVi7Tx8uug29Xauu1BKLY9ep/1o3sL8W1yTRKQjh3XYSHH4bRqAo0cat0kfZ0d+KdfFkTL3pPQSxQDXfzs4dvT4vJe0mYXJZnwyiFL3Pa+y73VA1sjTVAGexFEnyvpjNhlsq201ZFSlNyESDE10xGSsEdD2Dne2pQQk9c49nT0p5GTRJ6Qb8DMmIO2H1lsnYtCKoqQTw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgA=
Date: Wed, 3 Nov 2021 09:18:03 +0000
Message-ID: <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
In-Reply-To: <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed8d7564-0ef7-4146-60db-08d99eaad6d7
x-ms-traffictypediagnostic: VI1PR0302MB3376:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB337662649EBA42EFB5AD2297E78C9@VI1PR0302MB3376.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rGubL5LPdzmRCpXMjTAag0O3LbVB2DWkAL/bqLwdq96dWToQSq1AQQgtNtKC8f1MEoSIIOl1/yKSeGfWLEgIC3jwh1RChBHaqTrY8jEoiDG0PW/l2oCy7UyGI1v+C7M1a3z+6BSftZU+X+PuRA0JFBdxYON7gHagw87kcOKCaLoYSLqxqwj6BGapOCPGu0Fe0/TfJZrx21cTwFhRlZ8fBMHEWDfBK1S3DnVP/pjYxWtQ9qUrCmj71jXeSKDygbaEFoNEEpFr7xgsdK7soGURmTwGPw5icm8/RJQjhkk+aSQDxrkear3YdJ3wiQNN8wsX7GvkzCfRaKyoR0Q8oRx0SaudlTvJq8mv+JTzXTj0VE4Ks699esPKrZg9oQwzocwkovoQffnY2aylM2ZWmAOiWU/RWSF/tcmV6X69j2iKnvDvN4niOehnRb/iggE4o2j+TklCqzqdqERUPX+zRnffEGF5yGyxxAHtJmtoXA0gWDwwLOyH7F8EQSIm8yzkHbuBdmCIaxgJM1AqjWWNi9ZTmZ1DiF1IHTs25T00++HmqmlNiLJTjZmUddzZsPWj37qXbcf0AQl9oLSTH1WSXe79k7TdMEHZvLxYFVk6XEAN5qn07FBiJBeFzK/kXiA4RzGAgnrEHSq8Cb6e8kSG9QPQGdhDMGdBrT2nZGtG1UpIwQ7OT5bgqaf0+tngSaNnjmWHjnFdkjWSjiKth9O3ApIx1ZIwS1pI/CL+ZD2fdRni3zOl+cfjhT7AzfTBu49MBSBx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(76116006)(38100700002)(4326008)(91956017)(66556008)(38070700005)(122000001)(2906002)(64756008)(5660300002)(186003)(53546011)(6506007)(8676002)(8936002)(36756003)(66476007)(71200400001)(66446008)(6512007)(6486002)(31696002)(26005)(54906003)(110136005)(107886003)(83380400001)(31686004)(508600001)(316002)(86362001)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NDZ3cUorclZ6dmZLM0RKSWJhTVptbmdhajRSVmN2WlpDQzNmNWFJRndReVVY?=
 =?utf-8?B?UDYyK0IxTXV0TjVza2labkw1L1BrY0xrd1kxTUEzMFVtcFRQQXp5ZEpwOW50?=
 =?utf-8?B?TXdiNlhmWldra1JLRENyU2Nkd214Y1FvNndQUWJHTnRNYjdNaUdNK1Brdkc0?=
 =?utf-8?B?TTFWMWNwNTA0b3BiNER2L2V3ZXdXVTNwV215TmNCUmlzcGxKV2YwbnU0S1FK?=
 =?utf-8?B?emRYNTVkRUVnRUpZZlZGZStLNFNWUGRxcFkyTVB2R3V6NjZRVjBVQzRFUVBu?=
 =?utf-8?B?WGZ0TnFzZVRNMXpqM3Z2RHlva0hFd1NGZHdrZmhWdGhab3pzOEcvRkhic3Nu?=
 =?utf-8?B?YkIxUHFvaE91ZzdscXNGblREWk92S1pxWGFoY09jcHZ4MTBEVTBnbS82RlZK?=
 =?utf-8?B?aGNlTzFQY3U2SnZoWThMd3d2dnBpZHliS09hSTZBVGtUeVo1MmFHbUxkcFZJ?=
 =?utf-8?B?bVk2ckEzZFVPT3Btc3RpZ2c1VFU4YU5tMG1pN0JxZXh4VHlsNGxpczE4NFZl?=
 =?utf-8?B?Y3FkMlYxaUw3TTVnL0hOQjZ1bEFwYTk5UUtRRXlVL2E2S0VUaVo0RUI2aWov?=
 =?utf-8?B?RHdpL2xJU3YvWXVvd1orakoyYnZBNHhLZWt0K3RRV0dDQlZ6dkZIdnB0eERC?=
 =?utf-8?B?TkM0RkJTRkVnUlRMMTBsVm0rM3Jzc2FaR29kSVptekowYnBwVHIwWUIvdk1k?=
 =?utf-8?B?aCtXUzF4V01DdUhMZHNhdE1mVEVRdGlrTXYydlN1a3BBTExlY3ZvT0ZaUVkr?=
 =?utf-8?B?SXZJdXFxZHNSZjhCajNlUUZhNGFUSFJzYm5rWjd4aWhrOFlmeGFKTDM2REpE?=
 =?utf-8?B?YUM0SGUvVkZwMGF6VFV5WTNrSjUrU0ljRHcwOHd3OENLOEl4U2lVcUJGVjhz?=
 =?utf-8?B?UkxQdWx5c1JqQVFrVXY5emE1bUJxakh5cWhsdU5ncitPZVNmaVllT3IyY3V1?=
 =?utf-8?B?ZnQ3SzZGN1ZGYkFibGd4TGhXZzNqRmVWTy9kbm9uZVBER3FqRWRSS2t2K3p3?=
 =?utf-8?B?K3E1ZnI4WHJCU1ZpVk1OYjJYQlVldXVwVDA3S0IxbU8yT0g4QUl2NkJJajl0?=
 =?utf-8?B?dE1MdU9HN09YMlROcHA4ejVrdGJVSi9YbUhwbDVGbitQbnJuN0pVK2I5TjdM?=
 =?utf-8?B?VkNFdW1vVnBrL0FkOHdRdmdudWd3UjhEMGdGR0pISDllNVlqWXRwOGE2cDZU?=
 =?utf-8?B?ZERLZVdVS2w1WWZobWZhMzhpYjQ5N201em1KUHJvOUlCYmI4SUNVQWR4cjNH?=
 =?utf-8?B?RlJoZEZvT1diaFQvdHRrdjAzS29LL2pRZzJPRkxsSG43UlFqRGRIYkZJMEQ1?=
 =?utf-8?B?bTRCZGs1R01qeHlTRDE4eThqK0tUQmFmbVRiK0VsSkFyV1NWWTdMRjhoc0dL?=
 =?utf-8?B?S21KcG1oSGlJSDVBRzNuSXRXMmNBb3YxV2JDTk9BZnlwTU1Sdk1BTmJNZm1P?=
 =?utf-8?B?NHcrc0xaU1ViZGZBMTIzOFQ3TWoxTmF0QS80UWNPaEdTMDlDQU81Z0pKV0hS?=
 =?utf-8?B?aTRqYUZLOHhpTEFXRERCL1RYc2FqeXBuanp4aWxMUzBBdWtHNFFFUFRWYjI2?=
 =?utf-8?B?dUVkV21EZ05BVzExZ3EveDA5ZkpaQllNQjFHM1k5Kyt4Q3dNT1haUVNVQ093?=
 =?utf-8?B?Qm1TejNSZ3dLME43RmVBMDY0bzdidktTeklZRVkySEdqYm1iaDg4SVdKTVoz?=
 =?utf-8?B?L0xraE1rRVFnNHVpMzcxZTkxUzBpYXBmWUV1djliNEZxd3pTbllYMCsybmlt?=
 =?utf-8?B?N1VSUlFzeS9CeWlmTndFVzAyUFloZFhQSnRvN0ViMkcySklKMk1maWlBN05v?=
 =?utf-8?B?NGhVbmdaMjNKSlFwRm0xN1RlNUZmNXNLajhPVEg3aTVYVFloTlNuVWNPeGM5?=
 =?utf-8?B?a0lKV1kzUTV4NDlDSXNCTWw5UG1xNVlhVGZOQXUvYkUvVElQaUZPTC8wdjlM?=
 =?utf-8?B?U1gzLzVZT2NPZ3NvOVdNZE01UU5NamRMRUg4WjJqeldER0ZVUnppQzFneGU2?=
 =?utf-8?B?VVZUcVo5VzhFMHMyQ1lBSkRsN0l4TThZcVljMGF0bzQxcmh3UVlpVmRDUnY0?=
 =?utf-8?B?SEhPcXJSenZTeWlLRXFPcTZYSnp0Z21oWGkyQlo2Zy9iMEVUMVB1VG9pZFhL?=
 =?utf-8?B?NmNaaTBpZFFNbm9ELzdMN2hNcE1ZRWpnaWRpRnZIUTFyVHF3dWk2eURRaEtJ?=
 =?utf-8?B?NTNORFpCOWZ3WE1icUhrS3NMbW53YnRzUVB6TUtZUkxLY3NDSENEdlJ5TTYz?=
 =?utf-8?B?bUpWazkyZ3R3MVdwbjg2Rk9EWUlJTmoybVA4SU5vdDlsRzV6Vmk0ZC9nMjVH?=
 =?utf-8?B?ZHd6SmIwK3VTRzQ3YTJqSitGV3BxWkRJUU1kcXkvN2FScXhKVG1Zdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CCFA4EA75DA7547B7D9260C37644B4D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8d7564-0ef7-4146-60db-08d99eaad6d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 09:18:03.4648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSQo/ChDko5yI4ac5PGdsLIMDXLzXaTub/BiSzpDzodXJoehtuuFOnVvweAcNDPvSGLuiuOlS8+hkGlcg4WTisK6zrWMIGY7iuAlVUexQ9iMa24RAXQ8/03TIePzZT97
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3376
X-Proofpoint-GUID: XLEuTfT2qeBCCQAk74SEM2a1qrG5ba7S
X-Proofpoint-ORIG-GUID: XLEuTfT2qeBCCQAk74SEM2a1qrG5ba7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=746 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030053

DQoNCk9uIDAzLjExLjIxIDExOjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMTEuMjAy
MSAwOTo1MywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDIuMTEu
MjEgMTY6MTAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDAyLjExLjIx
IDE1OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDIuMTEuMjAyMSAxMjo1MCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIFR1ZSwgTm92IDAyLCAyMDIxIGF0IDEyOjE5
OjEzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDI2LjEwLjIwMjEgMTI6
NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IE9uIFRodSwgU2VwIDMwLCAyMDIx
IGF0IDEwOjUyOjIwQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4gKysrIGIveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4gQEAgLTQ1MSw2ICs0NTEsMzIgQEAgc3Rh
dGljIHZvaWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBp
bnQgcmVnLA0KPj4+Pj4+Pj4gICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRm
LCByZWcsIGNtZCk7DQo+Pj4+Pj4+PiAgICAgfQ0KPj4+Pj4+Pj4gICAgIA0KPj4+Pj4+Pj4gK3N0
YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5z
aWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgY21kLCB2b2lkICpkYXRhKQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsgICAgLyogVE9E
TzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBiaXRzIG9mIHRoZSBjb21tYW5kIHJlZ2lz
dGVyLiAqLw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICBpZiAoIChjbWQgJiBQQ0lfQ09NTUFO
RF9JTlRYX0RJU0FCTEUpID09IDAgKQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiArICAgICAg
ICAvKg0KPj4+Pj4+Pj4gKyAgICAgICAgICogR3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHguIEl0
IGNhbid0IGJlIGVuYWJsZWQgaWY6DQo+Pj4+Pj4+PiArICAgICAgICAgKiAgLSBob3N0IGhhcyBJ
TlR4IGRpc2FibGVkDQo+Pj4+Pj4+PiArICAgICAgICAgKiAgLSBNU0kvTVNJLVggZW5hYmxlZA0K
Pj4+Pj4+Pj4gKyAgICAgICAgICovDQo+Pj4+Pj4+PiArICAgICAgICBpZiAoIHBkZXYtPnZwY2kt
Pm1zaS0+ZW5hYmxlZCApDQo+Pj4+Pj4+PiArICAgICAgICAgICAgY21kIHw9IFBDSV9DT01NQU5E
X0lOVFhfRElTQUJMRTsNCj4+Pj4+Pj4+ICsgICAgICAgIGVsc2UNCj4+Pj4+Pj4+ICsgICAgICAg
IHsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICB1aW50MTZfdCBjdXJyZW50X2NtZCA9IHBjaV9jb25m
X3JlYWQxNihwZGV2LT5zYmRmLCByZWcpOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICAg
ICAgIGlmICggY3VycmVudF9jbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgKQ0KPj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0KPj4+
Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+PiBUaGlzIGxhc3QgcGFydCBzaG91bGQgYmUgQXJtIHNw
ZWNpZmljLiBPbiBvdGhlciBhcmNoaXRlY3R1cmVzIHdlDQo+Pj4+Pj4+IGxpa2VseSB3YW50IHRo
ZSBndWVzdCB0byBtb2RpZnkgSU5UeCBkaXNhYmxlIGluIG9yZGVyIHRvIHNlbGVjdCB0aGUNCj4+
Pj4+Pj4gaW50ZXJydXB0IGRlbGl2ZXJ5IG1vZGUgZm9yIHRoZSBkZXZpY2UuDQo+Pj4+Pj4gV2Ug
Y2Fubm90IGFsbG93IGEgZ3Vlc3QgdG8gY2xlYXIgdGhlIGJpdCB3aGVuIGl0IGhhcyBNU0kgLyBN
U0ktWA0KPj4+Pj4+IGVuYWJsZWQgLSBvbmx5IG9uZSBvZiB0aGUgdGhyZWUgaXMgc3VwcG9zZWQg
dG8gYmUgYWN0aXZlIGF0IGEgdGltZS4NCj4+Pj4+PiAoSU9XIHNpbWlsYXJseSB3ZSBjYW5ub3Qg
YWxsb3cgYSBndWVzdCB0byBlbmFibGUgTVNJIC8gTVNJLVggd2hlbg0KPj4+Pj4+IHRoZSBiaXQg
aXMgY2xlYXIuKQ0KPj4+Pj4gU3VyZSwgYnV0IHRoaXMgY29kZSBpcyBtYWtpbmcgdGhlIGJpdCBz
dGlja3ksIGJ5IG5vdCBhbGxvd2luZw0KPj4+Pj4gSU5UWF9ESVNBQkxFIHRvIGJlIGNsZWFyZWQg
b25jZSBzZXQuIFdlIGRvIG5vdCB3YW50IHRoYXQgYmVoYXZpb3Igb24NCj4+Pj4+IHg4NiwgYXMg
YSBndWVzdCBjYW4gZGVjaWRlIHRvIHVzZSBNU0kgb3IgSU5UeC4gVGhlIGVsc2UgYnJhbmNoIG5l
ZWRzDQo+Pj4+PiB0byBiZSBBcm0gb25seS4NCj4+Pj4gSXNuJ3QgdGhlICJlbHNlIiBwYXJ0IHF1
ZXN0aW9uYWJsZSBldmVuIG9uIEFybT8NCj4+PiBJdCBpcy4gT25jZSBmaXhlZCBJIGNhbid0IHNl
ZSBhbnl0aGluZyBBcm0gc3BlY2lmaWMgaGVyZQ0KPj4gV2VsbCwgSSBoYXZlIGxvb2tlZCBhdCB0
aGUgY29kZSBvbmUgbW9yZSB0aW1lIGFuZCBldmVyeXRoaW5nIHNlZW1zIHRvDQo+PiBiZSBvayB3
cnQgdGhhdCBzdGlja3kgYml0OiB3ZSBoYXZlIDIgaGFuZGxlcnMgd2hpY2ggYXJlIGNtZF93cml0
ZSBhbmQNCj4+IGd1ZXN0X2NtZF93cml0ZS4gVGhlIGZvcm1lciBpcyB1c2VkIGZvciB0aGUgaGFy
ZHdhcmUgZG9tYWluIGFuZCBoYXMNCj4+ICpubyByZXN0cmljdGlvbnMqIG9uIHdyaXRpbmcgUENJ
X0NPTU1BTkQgcmVnaXN0ZXIgY29udGVudHMgYW5kIHRoZSBsYXRlcg0KPj4gaXMgb25seSB1c2Vk
IGZvciBndWVzdHMgYW5kIHdoaWNoIGRvZXMgaGF2ZSByZXN0cmljdGlvbnMgYXBwbGllZCBpbg0K
Pj4gZW11bGF0ZV9jbWRfcmVnIGZ1bmN0aW9uLg0KPj4NCj4+IFNvLCBmb3IgdGhlIGhhcmR3YXJl
IGRvbWFpbiwgdGhlcmUgaXMgbm8gInN0aWNreSIgYml0IHBvc3NpYmxlIGFuZCBmb3IgdGhlDQo+
PiBndWVzdCBkb21haW5zIGlmIHRoZSBwaHlzaWNhbCBjb250ZW50cyBvZiB0aGUgUENJX0NPTU1B
TkQgcmVnaXN0ZXINCj4+IGhhcyBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgYml0IHNldCB0aGVu
IHRoZSBndWVzdCBpcyBlbmZvcmNlZCB0bw0KPj4gdXNlIFBDSV9DT01NQU5EX0lOVFhfRElTQUJM
RSBiaXQgc2V0Lg0KPj4NCj4+IFNvLCBmcm9tIGhhcmR3YXJlIGRvbWFpbiBQT1YsIHRoaXMgc2hv
dWxkIG5vdCBiZSBhIHByb2JsZW0sIGJ1dCBmcm9tDQo+PiBndWVzdHMgdmlldyBpdCBjYW4uIExl
dCdzIGltYWdpbmUgdGhhdCB0aGUgaGFyZHdhcmUgZG9tYWluIGNhbiBoYW5kbGUNCj4+IGFsbCB0
eXBlcyBvZiBpbnRlcnJ1cHRzLCBlLmcuIElOVHgsIE1TSSwgTVNJLVguIEluIHRoaXMgY2FzZSB0
aGUgaGFyZHdhcmUNCj4+IGRvbWFpbiBjYW4gZGVjaWRlIHdoYXQgY2FuIGJlIHVzZWQgZm9yIHRo
ZSBpbnRlcnJ1cHQgc291cmNlIChhZ2Fpbiwgbm8NCj4+IHJlc3RyaWN0aW9uIGhlcmUpIGFuZCBw
cm9ncmFtIFBDSV9DT01NQU5EIGFjY29yZGluZ2x5Lg0KPj4gR3Vlc3QgZG9tYWlucyBuZWVkIHRv
IGFsaWduIHdpdGggdGhpcyBjb25maWd1cmF0aW9uLCBlLmcuIGlmIElOVHggd2FzIGRpc2FibGVk
DQo+PiBieSB0aGUgaGFyZHdhcmUgZG9tYWluIHRoZW4gSU5UeCBjYW5ub3QgYmUgZW5hYmxlZCBm
b3IgZ3Vlc3RzDQo+IFdoeT8gSXQncyB0aGUgRG9tVSB0aGF0J3MgaW4gY29udHJvbCBvZiB0aGUg
ZGV2aWNlLCBzbyBpdCBvdWdodCB0bw0KPiBiZSBhYmxlIHRvIHBpY2sgYW55IG9mIHRoZSB0aHJl
ZS4gSSBkb24ndCB0aGluayBEb20wIGlzIGludm9sdmVkIGluDQo+IGhhbmRsaW5nIG9mIGludGVy
cnVwdHMgZnJvbSB0aGUgZGV2aWNlLCBhbmQgaGVuY2UgaXRzIG93biAiZGlzbGlrZSINCj4gb2Yg
SU5UeCBvdWdodCB0byBvbmx5IGV4dGVuZCB0byB0aGUgcGVyaW9kIG9mIHRpbWUgd2hlcmUgRG9t
MCBpcw0KPiBjb250cm9sbGluZyB0aGUgZGV2aWNlLiBUaGlzIHdvdWxkIGJlIGRpZmZlcmVudCBp
ZiBYZW4ncyB2aWV3IHdhcw0KPiBkaWZmZXJlbnQsIGJ1dCBhcyB3ZSBzZWVtIHRvIGFncmVlIFhl
bidzIHJvbGUgaGVyZSBpcyBzb2xlbHkgdG8NCj4gcHJldmVudCBpbnZhbGlkIGNvbWJpbmF0aW9u
cyBnZXR0aW5nIGVzdGFibGlzaGVkIGluIGhhcmR3YXJlLg0KT24gdG9wIG9mIGEgUENJIGRldmlj
ZSB0aGVyZSBpcyBhIHBoeXNpY2FsIGhvc3QgYnJpZGdlIGFuZA0KcGh5c2ljYWwgYnVzIHRvcG9s
b2d5IHdoaWNoIG1heSBpbXBvc2UgcmVzdHJpY3Rpb25zIGZyb20NCkRvbTAgUE9WIG9uIHRoYXQg
cGFydGljdWxhciBkZXZpY2UuIFNvLCBldmVyeSBQQ0kgZGV2aWNlDQpiZWluZyBwYXNzZWQgdGhy
b3VnaCB0byBhIERvbVUgbWF5IGhhdmUgZGlmZmVyZW50IElOVHgNCnNldHRpbmdzIHdoaWNoIGRv
IGRlcGVuZCBvbiBEb20wIGluIG91ciBjYXNlLg0KPg0KPiBKYW4NCj4NCj4NCg==

