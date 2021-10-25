Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108AE439297
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 11:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215694.375041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mewQl-0000iR-1I; Mon, 25 Oct 2021 09:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215694.375041; Mon, 25 Oct 2021 09:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mewQk-0000gD-U0; Mon, 25 Oct 2021 09:38:10 +0000
Received: by outflank-mailman (input) for mailman id 215694;
 Mon, 25 Oct 2021 09:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1v/+=PN=epam.com=prvs=0932af52eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mewQj-0000g5-5F
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 09:38:09 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd9828c-b117-43d8-9a04-6059a61707aa;
 Mon, 25 Oct 2021 09:38:07 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P94cQB027774; 
 Mon, 25 Oct 2021 09:38:04 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bwrrqgb2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 09:38:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4883.eurprd03.prod.outlook.com (2603:10a6:208:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 09:38:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 09:38:00 +0000
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
X-Inumbo-ID: dbd9828c-b117-43d8-9a04-6059a61707aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYyNuS/FAH1Gb8jPkEw1nnGSQDYdo0beu3R1gGMndgoYNchLJDF5+x0UfYnOD2BOlAxOFlcz8Yt3He5qCFD3K6t+9Iz47pV/j0W7R70bts8+kc3igHj+/N/dfk5qpRXoUNwAHw7IF/iQhSzm1qpsjZadxU+V+NoP/l39FUUsldUTYw5cjsAtm7ITZEAc7VKMhMqHtcw89/f5VzYvFMe7LfJw5U4QwFuPOjfn9h+k4WepeJx5DwXic9Y5wed09YIGwx58GkFsOC5dJlig14ct9O5ENrePsXQF4XFTFGOxaszmi1WPh5Cwyd4qiCTbN7Z6KsLSNkpu4eMLT1nRMVeiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t6ydvK0+SOZDzah9cAZ3VHC4XWqTsLMD6r/s+pKFJQ=;
 b=IfiDr+6+Mfng/XLk7xIm60EFOtfTA0KtX31a9aubgW3S2939sfEXEXcfz7dkvF+IskTwwSIY0OScwE3BvsYeKZG79BifYZD1CelOdI0TRQvpKi+4csN87Ow6tXmz92wj8TW0Fdq6FmPQvY5kP3zCRMum7YTIQFvHdaPu8kBKyqlzDQXjKju5UFLLLlZxjHwav8HOLaSFKvPBzBsmAQD5QMLhGyIg7cR2JyOkbLHy/rMDf8UvInj7qMU0AGfgu4xeE7bZOCa/dc5iuZI5RELFV8gHuUYoh8mx8hACJdkB5htToAxIP4lvsZ2F0BCMUOsglFDpbPi8d+XX2NCVk8BeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t6ydvK0+SOZDzah9cAZ3VHC4XWqTsLMD6r/s+pKFJQ=;
 b=Y8D8VnlQkGfv4m4fj39K3WqzGgIlQHBENk6Fu7RYBQ/EOP5ci8nylONZ9Og+eblHiYFyU1C+w41GtCJLiDjPmxlhGMde9YT7CbJ5j9RHgl41umIbkPLtM/0BPhVQvvuVSKxHB/I5OyhRsfeYoxhpseVPIDSOc//qRnZcUbqFdvggXpxgO3vSSDj5c4bmd3KcfvQBvV0+ikruRJgZD9AS/X4KdZwokR4xm3SoyZfvTCWz9fCxEwrSF4DJD6bdvvvB4OO1HQvbS8sDWNECGyLToO70COFvj4tXIK4WL4nCGau19K7WFsuzJ/gzfo+pWSS1CXc7qcM/7JA3eXxSEmKI+w==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXvAknAgtt9sKLd0u6OFwp+HT0w6vQvTaAgBLStoA=
Date: Mon, 25 Oct 2021 09:38:00 +0000
Message-ID: <7f2a5875-69c9-b40b-287b-1355698598e5@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-9-andr2000@gmail.com>
 <YWawvYGqIe3DwZfI@MacBook-Air-de-Roger.local>
In-Reply-To: <YWawvYGqIe3DwZfI@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2368d4a6-80d9-4eb6-c008-08d9979b229e
x-ms-traffictypediagnostic: AM0PR03MB4883:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB48830F2146FE1401E8A4D492E7839@AM0PR03MB4883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FAGySp/HzuzpRynLEQiTpEV3UHJbBqUgt7nbTXol5Ti5yj6+59kbDDhpJMkifCZdDfzUy2BX4q6jYDmY3Q/5cQNwkP1O0AhVB0o5LYW4EYwZBSPYaY/UZjllItNcUQqkrQxHAIbFwLJomMJLYKwFTPGKpJXTQhPehFicE2Sn0qwZx6bUA5K4AizqVZPIKrABnuucEBQ8Gd3mYF4FkNyOrSjVLXmb44pA3BwBwzJ+xKZdeoG3tO/kR5DHgFQjJ2sD+nraNJQZS0WL+ycub0jQaXDQzOVk9MljwOwwBz9JoPXktfTOWWYzEcQea+/K/JFT3owHxAf313xCgTRPwr1GOl8aRZGu75+nVyOSAUpwJeoD5zYJQ7NdtGnYmYqlQvFrOuIY8GcUhF9wtrCrjVKUaNVCtr4rvw9/cU6Vde5lXBGvLKhKWoCCd2WwhmoWe9Gdl0De5u5ttTg+WfpP001bg91SkZEh2AvUgo54e2CAJ1h6br237eOK9gi3trw99ijIdIr2hX6YZZTMFIk/ZIALCMNknAtDXQhnff68jSL2vb4T8uEA8j1eXStX8HtQyOiE58WVKRAqndOhMcEco9ZzoemLYz2cTaW/lSkBOQe/Mf0Y7Sj9Kd0Wko46lWerCyVgc1uXVoiFNS3p6n5cKYsdDZaLhZmMLKG27tSQQoBl98+hzmdieSa4YH19wwkAVqNzvqEH3E+KlfWZLRM94cI9lyjBd6e1O0kA1+oFr4+fDWIUWTKIM5IHrZvEs715csVF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(316002)(71200400001)(107886003)(54906003)(508600001)(4326008)(26005)(2616005)(66946007)(31686004)(66556008)(6486002)(66476007)(6512007)(8676002)(186003)(122000001)(91956017)(36756003)(83380400001)(64756008)(66446008)(76116006)(6506007)(6916009)(5660300002)(38070700005)(31696002)(38100700002)(53546011)(8936002)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0QvYkVxdjJYQ2drb3M2dTJVTTRKQXBDZnlCUnFaOGFuTk1pY3Jya0tSVzJN?=
 =?utf-8?B?ZDNLM09BbXdKcnlOZ0lZRDVhYXpMbEM2cWJOUldOY1pLNXVpNGEwcWpRdllD?=
 =?utf-8?B?YjNmQW0zRUxjMVpvZDh5T0pGeDRJWjl5a3NOVmtNMmZCQjVTcWNpdy94SDBx?=
 =?utf-8?B?b2tmVFRMZzgwRXVaRUZia1R2OU9KeVAyTFF2Z3RxZXR4RGFzV3phOW9VVXND?=
 =?utf-8?B?enBzOVZaNFlSMEg1RlhneGgreW5uTmVJakhGc25uZTlFVGFTMlAvVnV3bml4?=
 =?utf-8?B?dmo5cmg0NFpMOThGVitZdjNiYy92eUw5aElKclQ3MjhoQnZiME5KRWlNMCtn?=
 =?utf-8?B?TEh3bzhheEdvNVphVlRjb1pJL0VnLzk4Y1RrT0N2OGNBcCsrYVpQUE5iOVR0?=
 =?utf-8?B?a0p0MGZiYlh0VWNmVGxvdXpoczBSdFhTVjdRaW9ucTkrYjRITmpyRzBEYWU1?=
 =?utf-8?B?LzYrcmlGcVk4cmxzdjdidmVIOXF1NVNPOVFDZ0U3MmNydnJTVHFnYnJIbDJ3?=
 =?utf-8?B?UFFjeXowWGdvZFFweVdkWGhXN0V0VTB3RzZxb1BlSmIzTDV5TTdJQTdqY2tC?=
 =?utf-8?B?aFZjK1BQaWIybnlYSjhBNTBya3p5cGdqNWNGS1lmNjIrV293Y0VhY2lXcjBk?=
 =?utf-8?B?WFJDNVJDb1M2NEVUQzhpQ3o5cllsNXZyQ042dG95OC8zOTdmeENpLzJpTTZw?=
 =?utf-8?B?VXVXbDNCRURpdDdXdzZTN1ZLamdOY1ZvVE11QXNsNWlLeUtSTVc4QnlwTnRG?=
 =?utf-8?B?S3FoaVNuOVlCd1BjOTllNzEzNmE2THByNGIvS1ZGbmZJUlh0WXRUanVxOFc5?=
 =?utf-8?B?M01TeFBZQjlVN0JickUrZlZBaW5zL25QWFh5QnI3a2xUZDBHSWVNVndLcGJ6?=
 =?utf-8?B?Ui9nOC91MGhBaGs0dnZRaTZCQ20yZ09mV1BKNlIrYlZpanl6THd5Wi9GSGJo?=
 =?utf-8?B?ZU1IZkNhSzJYZDArZjIrRVZBRlZNM240REM5ckVHMU1BQzBSeDRhTjJzcDdM?=
 =?utf-8?B?QmNhS3IzTm5LbkdYNkZlV2tQcGpDRG04ZnlZSVA1Yk5ZVFJ6bFNaQmowVk5q?=
 =?utf-8?B?dXJxSXBFclpDbFVhdHZBcHZ3QlAyaDBSelVuRE1GdHRHbm1jMWZDQnI5ZWk0?=
 =?utf-8?B?alhyaGlBOVBURERUMGJVNWNqaEhDWE5nY3pDMGJCZVFVTWhMcWRaY2Nqd2V0?=
 =?utf-8?B?Zy9wdXozSEpsZyswUFY5MnQ0U3haeGdXUVB1MnI1YU5pMDlmd1dVazJIdFUr?=
 =?utf-8?B?amdVQmc5M0o3dUkycjRTMjRVRjVCemtYZVlabnhBWko4T244K0IyaVc5M0ln?=
 =?utf-8?B?QlRGZXpFUnVuOWJtWGZxWUcwRFR3ZjlhRjVVWWNiYzdwbU41S2N3TTBRYUlI?=
 =?utf-8?B?Y284RmhpNUkvdnM3Ny8ybVRjKzNBUFozUkNwUmMzYndQMzZLZFVjVlFQY3lu?=
 =?utf-8?B?eXdxSjJoQjIxcHBiSGxaOEhJWDQ0dllwYjZVMmZzZlBpM3JPNDdwNTJxdFpk?=
 =?utf-8?B?azZ6MmlsUHpDb2VZQTlJVXRJUGtsblZQYU95R0FmNzJxRzZ6Z3owUkJ2MEhk?=
 =?utf-8?B?dGI0NGtpNGowTXNkYXdlcjRHV3A1TGl3MkEvQWwrMi9pdDJ6cGl2VklMc2l3?=
 =?utf-8?B?eGp0N0JZRXNOdTA3bUROZXdCN0hIeE9FRHVNSENRYWJoWGs3Yi9WSHdOT1hp?=
 =?utf-8?B?NW81ZVBkb0ttRC9DTTM0YWpKdURaVEdTdGtZUmZMWCt2eVlGWVVQYUJvNS93?=
 =?utf-8?B?eWR0Mmt6WUlDdkRsZnU3SmRrNmI2Q3U3ZTllN08xWDZWVDdPTStGNmVudll3?=
 =?utf-8?B?RUVQL0VTdWVIWG4xQzFFc0IzQjhFZDRKcGgxb05pcGJmZUVwVnRwWnFmVWI2?=
 =?utf-8?B?NVdzTjdnV0VacDZHbzE2L0NNVk4rN1J5ekxHcG1xWGZ2ZThqMzBsMFVnM0ZD?=
 =?utf-8?B?Z04rU0VmSk5yc3owUm8rVVNjcUxhdTJhekRHeXk4VzZrWGNOWHNtdVV0VTcz?=
 =?utf-8?B?YWFXRmNrRUFPUWRGRFhOWEtPZGs0d2I3MmRxMmJ3Q3lQODlCZ2V6TkVvbkhL?=
 =?utf-8?B?akxFUXN1RzBObDh3bXVGY2tRK1pRd1BaWk40OGlwZS9JMEtnWGJMN2ExVWhJ?=
 =?utf-8?B?WWxlNENJUXRhaitRQStsWG9CMnJsWDk2OHowbUZlK2VqUkVMbngxbXY2V29l?=
 =?utf-8?B?aFVESzdCWjJqVGlRbmxuaVRMWHF0eE1Mcm5MVzFQck9tNHRSYjdMRHdwZTVu?=
 =?utf-8?B?S2pPN1h3TU9jZE5OVjBDRWM3aGdPeEJpeTFDMUxzNnBqV2FCUXZzNTQ5U3Nt?=
 =?utf-8?B?cGxmdW80VHpQSWx0OEdkcDc2cXFpTEIwY011Sy9FbEFhMlpyQm5UQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E23CD6EF932074AA5EDFAD063FC0F2E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2368d4a6-80d9-4eb6-c008-08d9979b229e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 09:38:00.5015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1cqlBrbc6S/rk5jWD2nXljldq7QWjE2bOGWUJwTZB6E/nW3VNxR9gtGlui4qXketBy/TKgMgZc38QzaSfKRfw30FlP8kfYDkeP9kjMuGktxc2o8DODP0vOaAyBVNT8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4883
X-Proofpoint-GUID: wKWCXAu5Fx1pdctUkslOWvQh4_pT0Yvz
X-Proofpoint-ORIG-GUID: wKWCXAu5Fx1pdctUkslOWvQh4_pT0Yvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_03,2021-10-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250058

SGksIFJvZ2VyIQ0KDQpPbiAxMy4xMC4yMSAxMzoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gRnJpLCBPY3QgMDgsIDIwMjEgYXQgMDg6NTU6MzNBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gSW4gb3JkZXIgZm9yIHZQQ0kg
dG8gd29yayBpdCBuZWVkcyB0byBtYWludGFpbiBndWVzdCBhbmQgaGFyZHdhcmUNCj4+IGRvbWFp
bidzIHZpZXdzIG9mIHRoZSBjb25maWd1cmF0aW9uIHNwYWNlLiBGb3IgZXhhbXBsZSwgQkFScyBh
bmQNCj4+IENPTU1BTkQgcmVnaXN0ZXJzIHJlcXVpcmUgZW11bGF0aW9uIGZvciBndWVzdHMgYW5k
IHRoZSBndWVzdCB2aWV3DQo+PiBvZiB0aGUgcmVnaXN0ZXJzIG5lZWRzIHRvIGJlIGluIHN5bmMg
d2l0aCB0aGUgcmVhbCBjb250ZW50cyBvZiB0aGUNCj4+IHJlbGV2YW50IHJlZ2lzdGVycy4gRm9y
IHRoYXQgRUNBTSBhZGRyZXNzIHNwYWNlIG5lZWRzIHRvIGFsc28gYmUNCj4+IHRyYXBwZWQgZm9y
IHRoZSBoYXJkd2FyZSBkb21haW4sIHNvIHdlIG5lZWQgdG8gaW1wbGVtZW50IFBDSSBob3N0DQo+
PiBicmlkZ2Ugc3BlY2lmaWMgY2FsbGJhY2tzIHRvIHByb3Blcmx5IHNldHVwIE1NSU8gaGFuZGxl
cnMgZm9yIHRob3NlDQo+PiByYW5nZXMgZGVwZW5kaW5nIG9uIHBhcnRpY3VsYXIgaG9zdCBicmlk
Z2UgaW1wbGVtZW50YXRpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+IFJldmll
d2VkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IFRlc3RlZC1ieTog
UmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+PiAtLS0NCj4+IFNpbmNlIHYzOg0K
Pj4gLSBmaXhlZCBjb21tZW50IGZvcm1hdHRpbmcNCj4+IFNpbmNlIHYyOg0KPj4gLSByZW1vdmVk
IHVubmVlZGVkIGFzc2lnbm1lbnQgKGNvdW50ID0gMCkNCj4+IC0gcmVtb3ZlZCB1bm5lZWRlZCBo
ZWFkZXIgaW5jbHVzaW9uDQo+PiAtIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KPj4gU2luY2UgdjE6
DQo+PiAgIC0gRHluYW1pY2FsbHkgY2FsY3VsYXRlIHRoZSBudW1iZXIgb2YgTU1JTyBoYW5kbGVy
cyByZXF1aXJlZCBmb3IgdlBDSQ0KPj4gICAgIGFuZCB1cGRhdGUgdGhlIHRvdGFsIG51bWJlciBh
Y2NvcmRpbmdseQ0KPj4gICAtIHMvY2xiL2NiDQo+PiAgIC0gRG8gbm90IGludHJvZHVjZSBhIG5l
dyBjYWxsYmFjayBmb3IgTU1JTyBoYW5kbGVyIHNldHVwDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gv
YXJtL2RvbWFpbi5jICAgICAgICAgICAgICB8ICAyICsrDQo+PiAgIHhlbi9hcmNoL2FybS9wY2kv
cGNpLWhvc3QtY29tbW9uLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgeGVu
L2FyY2gvYXJtL3ZwY2kuYyAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4gICB4ZW4vYXJjaC9hcm0vdnBjaS5oICAgICAgICAgICAgICAgIHwgIDYg
KysrKysrDQo+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmggICAgICAgICAgfCAgNSArKysr
Kw0KPj4gICA1IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBp
bmRleCA3OTAxMmJmNzc3NTcuLmZhNmZjYzVlNDY3YyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb21haW4uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBAQCAtNzMz
LDYgKzczMyw4IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+
ICAgICAgIGlmICggKHJjID0gZG9tYWluX3ZnaWNfcmVnaXN0ZXIoZCwgJmNvdW50KSkgIT0gMCAp
DQo+PiAgICAgICAgICAgZ290byBmYWlsOw0KPj4gICANCj4+ICsgICAgY291bnQgKz0gZG9tYWlu
X3ZwY2lfZ2V0X251bV9tbWlvX2hhbmRsZXJzKGQpOw0KPj4gKw0KPj4gICAgICAgaWYgKCAocmMg
PSBkb21haW5faW9faW5pdChkLCBjb3VudCArIE1BWF9JT19IQU5ETEVSKSkgIT0gMCApDQo+IElN
TyBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gY29udmVydCB0aGUgZml4ZWQgYXJyYXkgaW50byBhIGxp
bmtlZCBsaXN0LA0KPiBJIGd1ZXNzIHRoaXMgbWFkZSBzZW5zZSB3aGVuIEFybSBoYWQgYSB2ZXJ5
IGxpbWl0ZWQgbnVtYmVyIG9mIG1taW8NCj4gdHJhcCBoYW5kbGVycywgYnV0IGhhdmluZyB0byBk
byBhbGwgdGhpcyBhY2NvdW50aW5nIHNlZW1zIHF1aXRlDQo+IHRlZGlvdXMgZXZlcnkgdGltZSB5
b3Ugd2FudCB0byBhZGQgbmV3IGhhbmRsZXJzLg0KWWVzLCBJIHRoaW5rIHdlIG5lZWQgdG8gZG8g
c28sIGJ1dCB0aGlzIGltcHJvdmVtZW50IHdhcyBub3QgbWVhbnQNCnRvIGJlIGluIHRoaXMgcGF0
Y2guDQo+DQo+PiAgICAgICAgICAgZ290byBmYWlsOw0KPj4gICANCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2kt
aG9zdC1jb21tb24uYw0KPj4gaW5kZXggNTkyYzAxYWFlNWJiLi4xZWI0ZGFhODczNjUgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiArKysgYi94
ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiBAQCAtMjkyLDYgKzI5MiwzNCBA
QCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBjaV9maW5kX2hvc3RfYnJpZGdlX25vZGUoc3RydWN0
IGRldmljZSAqZGV2KQ0KPj4gICAgICAgfQ0KPj4gICAgICAgcmV0dXJuIGJyaWRnZS0+ZHRfbm9k
ZTsNCj4+ICAgfQ0KPj4gKw0KPj4gK2ludCBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoc3RydWN0
IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAoKmNiKShz
dHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSkpDQo+PiArew0KPj4gKyAgICBzdHJ1
Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2U7DQo+PiArICAgIGludCBlcnI7DQo+PiArDQo+PiAr
ICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGJyaWRnZSwgJnBjaV9ob3N0X2JyaWRnZXMsIG5vZGUg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBlcnIgPSBjYihkLCBicmlkZ2UpOw0KPj4gKyAgICAg
ICAgaWYgKCBlcnIgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiBlcnI7DQo+PiArICAgIH0NCj4+
ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK2ludCBwY2lfaG9zdF9nZXRfbnVtX2Jy
aWRnZXModm9pZCkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRn
ZTsNCj4+ICsgICAgaW50IGNvdW50ID0gMDsNCj4gdW5zaWduZWQgaW50IGZvciBib3RoIHRoZSBs
b2NhbCB2YXJpYWJsZSBhbmQgdGhlIHJldHVybiB0eXBlLg0KT2sNCj4NCj4+ICsNCj4+ICsgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeSggYnJpZGdlLCAmcGNpX2hvc3RfYnJpZGdlcywgbm9kZSApDQo+
PiArICAgICAgICBjb3VudCsrOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gY291bnQ7DQo+PiArfQ0K
Pj4gKw0KPj4gICAvKg0KPj4gICAgKiBMb2NhbCB2YXJpYWJsZXM6DQo+PiAgICAqIG1vZGU6IEMN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnBjaS5jIGIveGVuL2FyY2gvYXJtL3ZwY2ku
Yw0KPj4gaW5kZXggNzZjMTJiOTI4MTRmLi42ZTE3OWNkMzAxMGIgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBAQCAt
ODAsMTcgKzgwLDUxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVyX29wcyB2cGNp
X21taW9faGFuZGxlciA9IHsNCj4+ICAgICAgIC53cml0ZSA9IHZwY2lfbW1pb193cml0ZSwNCj4+
ICAgfTsNCj4+ICAgDQo+PiArc3RhdGljIGludCB2cGNpX3NldHVwX21taW9faGFuZGxlcihzdHJ1
Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHBjaV9j
b25maWdfd2luZG93ICpjZmcgPSBicmlkZ2UtPmNmZzsNCj4+ICsNCj4+ICsgICAgcmVnaXN0ZXJf
bW1pb19oYW5kbGVyKGQsICZ2cGNpX21taW9faGFuZGxlciwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNmZy0+cGh5c19hZGRyLCBjZmctPnNpemUsIE5VTEwpOw0KPiBJJ20gY29uZnVz
ZWQgaGVyZSwgZG9uJ3QgeW91IG5lZWQgdG8gdXNlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IGhhbmRs
ZXINCj4gZm9yIGRvbTAgc28gdGhhdCB5b3UgY2FuIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0aGUg
c2VnbWVudHMgb2YgdGhlDQo+IGhvc3QgYnJpZGdlcz8NCj4NCj4gQUZBSUNUIHRoZSB0cmFuc2xh
dGlvbiBkb25lIGJ5IHZwY2lfbW1pb19oYW5kbGVyIHVzaW5nIE1NQ0ZHX0JERg0KPiBhbHdheXMg
YXNzdW1lIHNlZ21lbnQgMC4NCllvdSBhcmUgYWJzb2x1dGVseSByaWdodCBoZXJlOiBJIGNhbiBz
ZXQgdXAgaHdkb20gc3BlY2lmaWMNCmhhbmRsZXJzLCBzbyBJIGNhbiBwcm9wZXJseSB0cmFuc2xh
dGUgdGhlIHNlZ21lbnQuDQpPbiB0aGUgb3RoZXIgaGFuZCwgd2hlbiB2aXJ0dWFsIGJ1cyB0b3Bv
bG9neSBhZGRlZCwgdGhlIFNCREYNCnRyYW5zbGF0aW9uIGZyb20gdmlydHVhbCB0byBwaHlzaWNh
bCBTQkRGIHJlc2lkZXMgaW4gdGhlIEFybSdzDQp2cGNpX21taW9fe3JlYWR8d3JpdGV9LCBsaWtl
IHRoZSBiZWxvdzoNCiDCoMKgwqAgaWYgKCBwcml2LT5pc192aXJ0X2VjYW0gJiYNCiDCoMKgwqDC
oMKgwqDCoMKgICF2cGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZSh2LT5kb21haW4sICZzYmRm
KSApDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsNCihCVFcgSmFuIGFza2VkIGlu
IHNvbWUgb3RoZXIgY29tbWVudCB3aHkgaXQgaXMgQXJtIHNwZWNpZmljOg0KSSB0ZW5kIHRvIGtl
ZXAgaXQgQXJtIHNwZWNpZmljIHVudGlsIHRoZSBwb2ludCB3aGVuIHg4NiB3YW50cyB0aGF0DQph
cyB3ZWxsLiBVbnRpbCB0aGF0IHBvaW50IHRoZSBjb2RlLCBpZiBtb3ZlZCB0byBjb21tb24sIHdp
bGwgYmUNCnVubmVlZGVkIGFuZCBhcyBKYW4gY2FsbHMgdGhhdCAiZGVhZCIpDQpTbywgSSB0aGlu
ayB0aGF0IEkgY2FuIGV4dGVuZCB2cGNpX21taW9fe3JlYWR8d3JpdGV9IHRvIGFjY291bnQNCm9u
IHRoZSBod2RvbSBsaWtlICh2aXJ0dWFsIGJ1cyBjb2RlIGlzIHRoZSBmdXR1cmUgY29kZSk6DQoN
CnN0YXRpYyBpbnQgdnBjaV9tbWlvX3JlYWQoc3RydWN0IHZjcHUgKnYsIG1taW9faW5mb190ICpp
bmZvLA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJlZ2lzdGVyX3QgKnIsIHZvaWQgKnApDQp7DQouLi4NCiDCoMKgwqAgc3RydWN0IHZwY2lfbW1p
b19wcml2ICpwcml2ID0gKHN0cnVjdCB2cGNpX21taW9fcHJpdiAqKXA7DQoNCiDCoMKgwqAgaWYg
KCBwcml2LT5pc192aXJ0X2VjYW0gKQ0KIMKgIMKgwqAgwqDCoCBzYmRmLnNiZGYgPSBNTUNGR19C
REYoaW5mby0+Z3BhKTsgLyogRm9yIHZpcnR1YWwgYnVzIHRvcG9sb2d5IHRoZSBzZWdtZW50IGlz
IGFsd2F5cyAwLiAqLw0KIMKgwqDCoCBlbHNlDQogwqDCoMKgIHsNCiDCoCDCoMKgIMKgwqAgc2Jk
Zi5zYmRmID0gTU1DRkdfQkRGKGluZm8tPmdwYSk7DQogwqDCoMKgwqDCoMKgwqAgc2JkZi5zZWcg
PSBwcml2LT5zZWdtZW50Ow0KIMKgwqDCoCB9DQogwqDCoMKgIHJlZyA9IFJFR0lTVEVSX09GRlNF
VChpbmZvLT5ncGEpOw0KDQouLi4NCiDCoMKgwqAgLyoNCiDCoMKgwqDCoCAqIEZvciB0aGUgcGFz
c2VkIHRocm91Z2ggZGV2aWNlcyB3ZSBuZWVkIHRvIG1hcCB0aGVpciB2aXJ0dWFsIFNCREYNCiDC
oMKgwqDCoCAqIHRvIHRoZSBwaHlzaWNhbCBQQ0kgZGV2aWNlIGJlaW5nIHBhc3NlZCB0aHJvdWdo
Lg0KIMKgwqDCoMKgICovDQogwqDCoMKgIGlmICggcHJpdi0+aXNfdmlydF9lY2FtICYmDQogwqDC
oMKgwqDCoMKgwqDCoCAhdnBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2Uodi0+ZG9tYWluLCAm
c2JkZikgKQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7DQoNCldpbGwgaXQgd29y
ayBmb3IgeW91Pw0KPg0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAgIGludCBk
b21haW5fdnBjaV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+PiAgIHsNCj4+ICAgICAgIGlmICgg
IWhhc192cGNpKGQpICkNCj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgDQo+PiArICAgIGlm
ICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+ICsgICAgICAgIHJldHVybiBwY2lfaG9zdF9p
dGVyYXRlX2JyaWRnZXMoZCwgdnBjaV9zZXR1cF9tbWlvX2hhbmRsZXIpOw0KPj4gKw0KPj4gKyAg
ICAvKiBHdWVzdCBkb21haW5zIHVzZSB3aGF0IGlzIHByb2dyYW1tZWQgaW4gdGhlaXIgZGV2aWNl
IHRyZWUuICovDQo+PiAgICAgICByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoZCwgJnZwY2lfbW1pb19o
YW5kbGVyLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdVRVNUX1ZQQ0lfRUNBTV9C
QVNFLCBHVUVTVF9WUENJX0VDQU1fU0laRSwgTlVMTCk7DQo+PiAgIA0KPj4gICAgICAgcmV0dXJu
IDA7DQo+PiAgIH0NCj4+ICAgDQo+PiAraW50IGRvbWFpbl92cGNpX2dldF9udW1fbW1pb19oYW5k
bGVycyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gK3sNCj4+ICsgICAgaW50IGNvdW50Ow0KPiB1bnNp
Z25lZCBmb3IgYm90aCB0eXBlcy4NCk9rDQo+DQo+PiArDQo+PiArICAgIGlmICggaXNfaGFyZHdh
cmVfZG9tYWluKGQpICkNCj4+ICsgICAgICAgIC8qIEZvciBlYWNoIFBDSSBob3N0IGJyaWRnZSdz
IGNvbmZpZ3VyYXRpb24gc3BhY2UuICovDQo+PiArICAgICAgICBjb3VudCA9IHBjaV9ob3N0X2dl
dF9udW1fYnJpZGdlcygpOw0KPiBUaGVyZSdzIG5vIG5lZWQgdG8gdHJhcCBNU0ktWCBUYWJsZS9Q
QkEgYWNjZXNzZXMgZm9yIGRvbTAgSSBhc3N1bWU/DQpObyBuZWVkDQo+DQo+PiArICAgIGVsc2UN
Cj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBWUENJX01TSVhfTUVNX05VTSBoYW5kbGVy
cyBmb3IgTVNJLVggdGFibGVzIHBlciBlYWNoIFBDSSBkZXZpY2UNCj4+ICsgICAgICAgICAqIGJl
aW5nIHBhc3NlZCB0aHJvdWdoLiBNYXhpbXVtIG51bWJlciBvZiBzdXBwb3J0ZWQgZGV2aWNlcw0K
Pj4gKyAgICAgICAgICogaXMgMzIgYXMgdmlydHVhbCBidXMgdG9wb2xvZ3kgZW11bGF0ZXMgdGhl
IGRldmljZXMgYXMgZW1iZWRkZWQNCj4+ICsgICAgICAgICAqIGVuZHBvaW50cy4NCj4+ICsgICAg
ICAgICAqICsxIGZvciBhIHNpbmdsZSBlbXVsYXRlZCBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRp
b24gc3BhY2UuDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIGNvdW50ID0gVlBDSV9NU0lY
X01FTV9OVU0gKiAzMiArIDE7DQo+IFRoZXJlJ3MgYSBzaW5nbGUgTVNJLVggbW1pbyBoYW5kbGVy
IHRoYXQgZGVhbHMgd2l0aCBib3RoIFBCQSBhbmQgTVNJWA0KPiB0YWJsZXMsIHNvIEkgZG9uJ3Qg
c2VlIHRoZSBuZWVkIHRvICogVlBDSV9NU0lYX01FTV9OVU0uDQpZZXMsIHRoYW5rIHlvdSwgaXQg
aXMgaW5kZWVkLCBzbyB0aGUgbnVtYmVyIGNhbiBiZSByZWR1Y2VkDQo+DQo+IFRoYW5rcywgUm9n
ZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

