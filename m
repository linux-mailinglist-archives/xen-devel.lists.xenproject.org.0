Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0A43C77B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 12:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216862.376631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffzf-0007oG-DM; Wed, 27 Oct 2021 10:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216862.376631; Wed, 27 Oct 2021 10:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffzf-0007mT-9W; Wed, 27 Oct 2021 10:17:15 +0000
Received: by outflank-mailman (input) for mailman id 216862;
 Wed, 27 Oct 2021 10:17:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mffzd-0007mN-Jy
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 10:17:13 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 661050cb-5fbf-4b10-b194-81ee377379e1;
 Wed, 27 Oct 2021 10:17:11 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19R9N0PJ015567;
 Wed, 27 Oct 2021 10:17:09 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0b-0039f301.pphosted.com with ESMTP id 3by0vn0y4f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 10:17:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6769.eurprd03.prod.outlook.com (2603:10a6:20b:284::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 10:17:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 10:17:02 +0000
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
X-Inumbo-ID: 661050cb-5fbf-4b10-b194-81ee377379e1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ/AfkCy52lvOvbu4Gc1tw/8ZRW3HHo1tGwHgx96lFRRzYNflpPO+KOgTOvb4i11TflLqKCDkYVNL6/PAq54K2Byr9koCY31+9cEQv5j7dmTjKZIYZUYYPQkUQJ76454ZchiYwbBpbn9DaxPVW2g9/gdDH53aE2t+Hso2MmM82cLjuVdI24S5rq5V7wuclhNONe0NyM0sQY4pk1V45uU50dnTvVZwW7cc0D8HBt+3g92bUSUqER5KC9EUMoZWg2tK/jGwsrQ//6wQJ1xV5547ClFdSIonuwemMWmI3yH4kJYG+wb4K/emyYPdTA1hZe7kvDzRrV1RlUXWUyFKz0e8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQK98qWp/1lENa6X6N98dzHtyEK5xhe6l9LbTzVHU7g=;
 b=CWU1EEMl8jMYfal115hxCFBKNB7ue9uiBKw5OdejKNZAkUk1TFxprXVXGUAS1rFTlHxDKYZAOxkH1ew/1ywWTTnZfACQ3R8/i8LZAcP/Fk6585bJGzq/jQWO3CYPeiMJf9wxei5hquSeGgRp14zFT4PHXyqBOymYrZjCfsjQfxgTrmPgBhyK5T/1bjRJP8HPdt+BDt7Y74c6CPD2VNU1PcvSlWxXYUj/HhxF3yE6OVnIAioybEgqr2JH0cYoyqH+7HWXL0PavLKOwKLn6CAdfaqV06N9QzBiqHWq5mXuy6pLu3A2+vFkwvtKdWSbhvRVEX4i7EC7otdZmm7nnX5xVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQK98qWp/1lENa6X6N98dzHtyEK5xhe6l9LbTzVHU7g=;
 b=lA7bCNs2CfJQCS5rQ0ScxnAogCc4tSlwZBHKA6mvsatbwmpLx9bf3mOUVDk9BT6stQ/vek7L/0rUI9+IKGzqBnbkqbbPvG4OpI3gAiR/gumrk9F33tCjsuU3xZANj6eu7IxfnQdPnTjhyl4kRQvcdXArOQfdTFAiBuEaJMoMH6Tc64p4/+1oMxCBxK2lIlKFc4ZeJDz+882x9cDaPeO+WKlTXQh+I5DnlAdDIlZsGfjmSxeD+QxpsCkcTsPbHvy5Vz0G/4WJUf8SvL9GfiidpXJAEnai6lYJ1r0dq3XAmWDsv0WH8sWOB8p5qetCZ9SF0/LMjLf/gFMYm8+r4FPLow==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Thread-Topic: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Thread-Index: AQHXtdAhPfrDnvz+/U+T4IKIC1fCcavRBz+AgBXEsIA=
Date: Wed, 27 Oct 2021 10:17:02 +0000
Message-ID: <89e1f09e-c840-860e-e596-38fb141aa707@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
In-Reply-To: <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4195fb99-d868-46e2-3921-08d99932eb67
x-ms-traffictypediagnostic: AM9PR03MB6769:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6769B9CC4B3F1BE8DAAF970EE7859@AM9PR03MB6769.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IARElCVdqexSeIEgEnpRJJYAelhiIZemtoZJRrS0E1mNC9G/y8BZih7ZWQhWsQSLVxyqlOQwmqdMFyvQQH+S7ohcJ2YzrFAtdt0TWef3o8ZD9kAn5EV+YtFB8b0EJ21hxw++03YM6iL6MLRIalhQu6CUcFHmVEm8hanQIN7fAPqzV9KaziOojwU5lJuEn6h0xMHas4usvFPxuoPoIDA9WyuTk8uaHexjKd1KqW2PeBecvRQJOLOWIDQaQz4QZmZSe4JdJCHTzB/OPR/xrFeil+rlCRt01bjVTmRtT/JCopgSIK6eXU5wbPf60JIOLX2DFM5r5HiKCyJgaKnMUBVim1VprYhxWNU10ei5WHt1LCH9yTbe9XBb9QuTCB3/x8b/7nTu/0MHqXs6rWmmdZ90/SewPcKjCe7gTGxy5X81wkXMCiuIjG5EiWQAFZmmvs1AAcMVY3E3zPR1UbO71cYf0WS1KH9KlpBVCtrYlZ+cCVtXZobNldGvD7pQKZe3BMyTVGoqsSOhTa48mDhOwQCO9O7BhN7qw2P4zWIsmv5JvKZOJPwuKlup5KfPGns79YfjZq2nB7oaralKPvocXDAUWW/jN7xTPN+rHmcDZu0D8NP5w57X48SuoCv1JfgS4FjU69Baoz8j94XNP+4iwk+cBNYN11d0kKI2YolKHNQgd+ZiKk2A+L42l29onK9VmWsOd0s9NetJBVTutuL1Mg9KUyiZN6g3edl4tezxKCpVL11fnYorCqf7hdEyBclnTLMb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(66446008)(66556008)(5660300002)(66476007)(64756008)(66946007)(38100700002)(107886003)(186003)(2616005)(4326008)(31686004)(31696002)(86362001)(71200400001)(36756003)(6916009)(6512007)(6506007)(2906002)(54906003)(316002)(53546011)(8936002)(6486002)(76116006)(91956017)(38070700005)(26005)(508600001)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bk12Vnk0bXFqWHk3dXloa2NyT2ltSlZBWi8vSENmTzNDSHV5ZFV2QkIzd0JT?=
 =?utf-8?B?RHBPZWRYdXRqTldFSUZ5bm15REpGK0xEMXRORnFhV1BUWFJxTXNyblBIYkEz?=
 =?utf-8?B?UmtGMTZSVk55TU9WVCsvVGh5RGpNeldwcnl2OWVCL2pmSWpTR0NqNVZnc0x0?=
 =?utf-8?B?TGxRbEFHak9wTW4rNXJhZUJMZHNyVDdoOFZIYTN2MGE5bHNseEV1RW5BQnFy?=
 =?utf-8?B?OEpCOHFaSlZLQ3YweC9pVXpqMjgwYldwd2VucGlhK29BaW1weUd3azVsNUJn?=
 =?utf-8?B?RzZwK1FWSlVuOUhLVTI3emtOOEhxTm5CMXovcjhMOVM3WU1ncEZwZHNCVmcz?=
 =?utf-8?B?SXdsL2kzSitIeEMxd2FQb081eXZsUDBrZ0w0cTl0K3NGRE5DcG5FYVZPZ1c5?=
 =?utf-8?B?cWxmMWZ6LytpZ2hsQWFSZnA2ZEZ1cnp4SXdqbGpBYjFyNG52Nnd1d2VUZy9h?=
 =?utf-8?B?Q0YrVjdPd2lNZ0NoRlo0WVA1WVhCYzgxc1ZFV2JCZGxCbDU4Q05ZQ0dEQ3pW?=
 =?utf-8?B?Yzl0TUZCWmRjVDJnTDM1VWRkM2k5YUQ3M3FhSFBmY2dsdHZaWFBBZVgvMFpC?=
 =?utf-8?B?d2xGQ2V4REVLQWRMVE5nZzArcjZEWnhDMHNFSnZMTW8vVkJQTGFQYlZWelJP?=
 =?utf-8?B?dHFZN0FFdHh1R3lxVUlYK0V1akMrVkpIV29iN3o0TDlCNTFDSnUzdkdsaDUy?=
 =?utf-8?B?TUduWTFwK2JQOUczRmRIY0VnakdjZGloWFRXeUxrMkxYSDNCODRUNW5qUmZD?=
 =?utf-8?B?dG90S0VCRnVtU29Jc2ZKUnFsUXhLeURXUGlIMmpCY2p3L2ZSSFhBVUhIUG40?=
 =?utf-8?B?MWZGY2hMc2VVaVdsc1JGa0kxVU03NkVXQzJ2MU1leVBubHQ0OGlsRTRGTWVx?=
 =?utf-8?B?Y1VRMTg4elNERWNaYTJFS3g0eFRwYVIzdG00TThSWitKRnU0Y0ZyT05qcDlN?=
 =?utf-8?B?N2lmU1R4VkhlVjgxQkpKWXNPczRoQ2loVE5oeU9JS1lnbGlOd2FyMlA2VE9V?=
 =?utf-8?B?ZlQyYVlCZnI3VnY1d0RZSTFFaEhrT21CSUNWRHdGTDY1VFlxOStSY0gvVDdv?=
 =?utf-8?B?MHNJOW54RXFwbjJCWUJiWGhoa01tUG5scjQ2SHpGM0ljRzF6T1U2SHh0dTFW?=
 =?utf-8?B?ODU4dC9zRUhCT2dZWkR3S0ZRUVdpMUZXWHJDelNWeHdZR1BlNVFISmw3K0RY?=
 =?utf-8?B?SzBhdTFiclRCazRDSzM3d2NwN0dsdnQ1czBOd0p2S1duRUFqZ0NtenNpOTc2?=
 =?utf-8?B?OE1NTFBLVWFRQU1wWEdUS3hhNlN5SG1DdUYyL1p0bUpvTGRyUTNSa0JXZU5S?=
 =?utf-8?B?d2pWKzNtZVoraXhnbVBNa3lzMFUzTU9IZGM4NnZKNnY4NVQvc0t4NjNaZXp2?=
 =?utf-8?B?R0QxV0pLUWdXVms3YjB4czJVbGlRTGZza3FlTGRVb3JZMFBhcnlsTklHVjFP?=
 =?utf-8?B?OHQvbzRHeGt3MHFoYlFPWmhaSlFsb01ZdW45Tys5M3FUcTVXUExJYTVLeCt1?=
 =?utf-8?B?d0srRkdiVXJzcjRNVWhXc050SzRGbm1TNFE2SDRWUjBHZ2dnZkZVUWo3UFRl?=
 =?utf-8?B?UnJnM3NkQXQ2Q3ZTVjFKTENDWG1uZmFxb2g0cXhKazVwa1NsTDN4d05MTDcw?=
 =?utf-8?B?NzF5UE5qdERnc2o4TFQvWWkrMmxnWXprT0o3bWdrVVVPdTEwREJ4a2Z6cUlD?=
 =?utf-8?B?QnQvc3puUFY5ZU95T0tTWlN2SXJxZnN0Y3BsREJWMDJnaHFSREJVZFU0MGxF?=
 =?utf-8?B?MDQxd0RmMENrb21CVk5LcFpjUE85U2tiOFpvS1Z6SWZVZ05hMkFKb2VXQytw?=
 =?utf-8?B?VFdtZkZIUHhueG96a1FLbkhRcDZFNktUS1MrQjRxQmVRY0ltaEdTYWhjc05n?=
 =?utf-8?B?RWx1cWFWWUZ2ZWE3eitJTnl0ZW1pSXYxSlRNNGhoWUNWSjl3RlJqMFljdmc3?=
 =?utf-8?B?SzB6eUcxZm1lVU12dTdPYk9BalgycHNhQWVUZm5XblBSUmhqMVhHalR4ZDhy?=
 =?utf-8?B?a0UrdzFRYjA1M21GUzhyWnBNWm8rbVo3dC9pL0dXUXNwNkVvTjhudHNDRzVF?=
 =?utf-8?B?OFByN1N4THJrS0VBSzF0VlRpWEkyVTIxNVRDc0J4ejFURFNhRUwzdmtyTkRz?=
 =?utf-8?B?bWJ5SGozZ0huU2NEU2lBSHkvaWdyVHRrbnhGZFBQK1R2M2dObFhOL3BMN2s1?=
 =?utf-8?B?eUZ6aXVySmhHRzdXdU5EOUx0aFFralkyQ1paMjdzZDFsUDl5bklQWkM1WlAy?=
 =?utf-8?B?Uy9kZXQzeHhTckN6eERnc0V5aXVncno0c3FZUjRqaWdsYXNOd2JvL01POUhX?=
 =?utf-8?B?QzVEUTdBRkRwSUdHWVcrVmlzNUc1ZEkxUGVmVUtRSFlRTHA2WWdsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54F4998B51A8AA44B688E3E83E82411B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4195fb99-d868-46e2-3921-08d99932eb67
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 10:17:02.4848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pXHCWwNWVRn4lnypKapzTqq8JNcJM8nSec8in/TwvZFCtTLyjIS4wG1ru2HdOy7eF3aQOkDWLk57dPhNPTmYzoVrfapElhdvFmkOIQVt/ncwsJtkwUnk/cewq4OCWI3f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6769
X-Proofpoint-ORIG-GUID: pbdVdSAx3MuomTobX_2Gw_Pqq_Z0lcjZ
X-Proofpoint-GUID: pbdVdSAx3MuomTobX_2Gw_Pqq_Z0lcjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_03,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270063

SGksIFJvZ2VyIQ0KDQpPbiAxMy4xMC4yMSAxNjo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MTVBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGhpcyBpcyBpbiBwcmVwYXJh
dGlvbiBmb3IgZHluYW1pYyBhc3NpZ25tZW50IG9mIHRoZSB2UENJIHJlZ2lzdGVyDQo+PiBoYW5k
bGVycyBkZXBlbmRpbmcgb24gdGhlIGRvbWFpbjogaHdkb20gb3IgZ3Vlc3QuDQo+PiBUaGUgbmVl
ZCBmb3IgdGhpcyBzdGVwIGlzIHRoYXQgaXQgaXMgZWFzaWVyIHRvIGhhdmUgYWxsIHJlbGF0ZWQg
ZnVuY3Rpb25hbGl0eQ0KPj4gcHV0IGF0IG9uZSBwbGFjZS4gV2hlbiB0aGUgc3Vic2VxdWVudCBw
YXRjaGVzIGFkZCBkZWNpc2lvbnMgb24gd2hpY2gNCj4+IGhhbmRsZXJzIHRvIGluc3RhbGwsIGUu
Zy4gaHdkb20gb3IgZ3Vlc3QgaGFuZGxlcnMsIHRoZW4gdGhpcyBpcyBlYXNpbHkNCj4+IGFjaGll
dmFibGUuDQo+IFdvbid0IGl0IGJlIHBvc3NpYmxlIHRvIHNlbGVjdCB0aGUgaGFuZGxlcnMgdG8g
aW5zdGFsbCBpbiBpbml0X2JhcnMNCj4gaXRzZWxmPw0KSXQgaXMgcG9zc2libGUNCj4NCj4gU3Bs
aXR0aW5nIGl0IGxpa2UgdGhhdCBtZWFucyB5b3UgbmVlZCB0byBpdGVyYXRlIG92ZXIgdGhlIG51
bWJlcnMgb2YNCj4gQkFScyB0d2ljZSAob25lIGluIGFkZF9iYXJfaGFuZGxlcnMgYW5kIG9uZSBp
biBpbml0X2JhcnMpLCB3aGljaCBtYWtlcw0KPiBpdCBtb3JlIGxpa2VseSB0byBpbnRyb2R1Y2Ug
ZXJyb3JzIG9yIGRpdmVyZ2VuY2VzLg0KPg0KPiBEZWNvdXBsaW5nIHRoZSBmaWxsaW5nIG9mIHZw
Y2lfYmFyIGRhdGEgd2l0aCBzZXR0aW5nIHRoZSBoYW5kbGVycw0KPiBzZWVtcyBzbGlnaHRseSBj
b25mdXNpbmcuDQpPaywgSSB3b24ndCBpbnRyb2R1Y2UgYWRkX2Jhcl9oYW5kbGVycywgdGh1cyBy
ZW5kZXJpbmcgdGhpcyBwYXRjaCB1c2VsZXNzLg0KSSdsbCBkcm9wIGl0IGFuZCByZS13b3JrIHRo
ZSB1cGNvbWluZyBwYXRjaGVzIHdpdGggdGhpcyByZXNwZWN0DQoNClRoYW5rIHlvdSwNCk9sZWtz
YW5kcg==

