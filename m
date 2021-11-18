Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C15455DBE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 15:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227445.393377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mniBc-0001fw-P4; Thu, 18 Nov 2021 14:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227445.393377; Thu, 18 Nov 2021 14:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mniBc-0001dp-Lk; Thu, 18 Nov 2021 14:14:48 +0000
Received: by outflank-mailman (input) for mailman id 227445;
 Thu, 18 Nov 2021 14:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mniBb-0001dj-Gv
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 14:14:47 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1323cf4-4879-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 15:14:45 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIBmkN4028356;
 Thu, 18 Nov 2021 14:14:42 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdp9pgrqk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 14:14:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5010.eurprd03.prod.outlook.com (2603:10a6:208:10b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 14:14:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 14:14:36 +0000
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
X-Inumbo-ID: e1323cf4-4879-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIfuQRKR7cdSZQmdczQZLV0fMFiVDneHSBW1e+uGud3phRsnc+ojIUe0EKYRPs5oX1H48CuKnMqlbyXrHgsJyl2uUlvb1pNNch+Ddy8pSdg+1TXwq81I+gtSw3DyUn9d2mIsCjG10rhPSU+f5Pv5aw/srS87UWvkCxG6MfqZvSHy0+LdkvC319hMKHS56zaHgcvMVH1z/2Cl0EfT7/k9VKKVozaXfMs41lKLA/UdtkojHe3QlyZfTY+naX2L8J4JzfpONF0c7uYlmzP6A4mio2J7lhBJBMrrHg93VedCDUuvPSQ4dh9W7gsFt55X9lJZk95E8DdIERVgr5zLaJGszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VNnTl4tnYO2aRP/gEH87SetkkaUDK12tfHXudF23Ro=;
 b=TvWRo5kmWpZXRQ9LknOyjZnSlaUKMmP7wWoNkVvI9MjDlYTILzEHgNp3yVgr3rQQPBvelrtH0IzUJ/xH668YlqOCYyktOWXtp1vh/xic3eF3XHDcRNu8v6JTqeEG8L/c99px9Ri2beiiTYBcWrjAiIXMmDvy63a2AbCLmMJyoll8yLO+t2dlY6srEkiiwSx01/T9NUI0T9mzesA6BZKSPpCX4O4qLRr05DgNvt7GSRUNKDiZPZ/T99bZOUZKznciCU9E5EkVLepAhpkshTrktK+wH4g3LFu1Z2ViF+oCyWU8sMNCBptsMrSKimnXs21oGX/wMUewUJA1lkpqQaCSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VNnTl4tnYO2aRP/gEH87SetkkaUDK12tfHXudF23Ro=;
 b=LoOvNI4Xc6rXIwFcA8r4UjkdBUdZWhUuSNBCO1Lq1KEKK8Gs0hDu5QzoGb5ZldmVkIjUy1p8XV6MNyP224chR9o6Gcx+cEermW386gg0CbWK/V+QrFb/G/nXrX6kutrwtFDa7arZmhBNlWs/oHQtpaJi3mxgx6eYAIEenn5nmxdQ7iwizcncv+cEMpvjnCuB9tv2AyZBPm/5msG53BM0jfDIE2Jlzz1aHAJvudCIn9WkrXI8Vl544PcovF33l+Xbu8zHYfBkjVBJnOIjuedpd2h7jn0A1SfzHaUF0qEPYwna9zg4H5Gi5JjcYWCEbQ5ZBVt3dKvEwStTNCks4CwtbQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIA
Date: Thu, 18 Nov 2021 14:14:36 +0000
Message-ID: <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
In-Reply-To: <YZZdU1oCaMt1HxTj@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 068cf1c8-e7dd-4226-1a48-08d9aa9dc09c
x-ms-traffictypediagnostic: AM0PR03MB5010:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5010D66547CEFFCF02FC0429E79B9@AM0PR03MB5010.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3ivKE5aRk5m2v0V8ySzQC2qATkiwP/oOj6b1W/WDjeKzHg7TWaS+7fJ9rGHgYpEOZqHeBXFVy+3G5+90zp6WGhmxqyYHUaGoEcQENTje/10pdchauNtVwdnnCc8G3dp7/SEN+Wlovlf34AMbnE+162hrAFoAJS7u12mG1/kcb4jbJb78ns1tzVOqPC4T7bX5j2mebLQLHU/KlMtRRwf38VzVFZ0xDykrBYkh3Q/nlxzMM5j8FQ11j4jIHNr2i5PSBzw/FYQEmV67TEPzcl1fBqITS4NY5vTvZtYjNcIFqoxukFeNsKjE8Pg8abcS4p0TAGse3s/j+N4bkXlLNLbgJ+HNBbxtPUxEu0vICd+nQ6K27+k++7ESl6Uo8aWQm4fsn7xIyktXff+/WuGKoZifpVc1G2k7tDHgWvU7+vJOtYjXi3THXIy0LWGSxQwyZEG1VdaoDwa8058oio6C0/MZ+oRA5nChLW/sdBwegFfPJfRTPdbUzVeVjZMz3F7x2nRXxeIxKATjG2EB+8iIc9YR8/qZIuZbGx1OrDS+hmsWIyXPHh4M03zlBc19tz5KbWG5jDvgmw0XWCXLtOPrOBYWBtEK37uxQvz7eNkoCBiZpnIvTxn9YDOP/UgJywUxhlpr/AQ0+/rNjOiIX0ZSPAEZ6ESqukevP5pLAF2j+QO2Ob+FdfUXPPV2FUT5vIYUFTZKwgBQQGS68fJncNlCC+3gvkpnE5C5HYgIG7fqILWofhIbMo5IIwaQtkMNenNRhml2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(2616005)(66946007)(91956017)(6506007)(66446008)(38070700005)(6512007)(5660300002)(66476007)(186003)(66556008)(38100700002)(6916009)(2906002)(76116006)(54906003)(8936002)(64756008)(71200400001)(6486002)(8676002)(53546011)(7416002)(31686004)(83380400001)(4326008)(31696002)(508600001)(316002)(122000001)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ampSemY4U2xPZkhnQjRrSnMyWFFHS056VzVmVVp1VERPZHNjSUdOMFdQd3RP?=
 =?utf-8?B?WEw5WE8rSlJxclBsdzA3S2Z1QWlLR1ZVcFdMOEdaMFpNdzI4VU9LclJMYTl5?=
 =?utf-8?B?aXZzVkxqRmRRdUF5b0Y4TG43V0dESWdmcFRhZExkckJ5T1FDU0s4a0c3blhT?=
 =?utf-8?B?MlBsWmw1b2JvYm14ZHlkTi96bGFPeUthYk0xQ3R4OHVwMEFRalF0dEN1U0xw?=
 =?utf-8?B?R2hhZDBPOFBvVmFteWpXSzR0c0VrUkFIaVp4OEZ6aFFxNWI5S3YvV2hPc3By?=
 =?utf-8?B?cUl1NHZXMk96M0JSQmhvbTVPWkNBbmlHRkhnQndIZmVuZlJtY1VTWmZBelNh?=
 =?utf-8?B?L0I1OGFkSDBHV0dQcWxkYWVvazFzTlFYU1V6Qm5tc1AvNnJRTjBmWERtZ3FN?=
 =?utf-8?B?cUJVNEx5U1EvbTdMYjQwb3Q4ZUNCUHRpOXh1QUtpNktuVS9RbWlWWHhQWG1Y?=
 =?utf-8?B?aUlEemxmTTdRV0FlaVB4R050RGJvYXpnQkNTS1F0bTlaSmxDYVZ4TXpyMEpK?=
 =?utf-8?B?dDJsSXBZaGFEQ3ZYMkFPUm43d2dBV2QvNFdnTitVbU5OSFFwbE5FaHBCMWlD?=
 =?utf-8?B?NW5EQldsdzVwYTZuOHJhQnROSWFhU2UvR1hUMWFXV04ySms2TU1rVmlRa2VS?=
 =?utf-8?B?UzhIWGdSY0h6bGhEMXplZU96R3prU1BmQ3ppV2w4ZzdERmtvU0JsU2VCUDho?=
 =?utf-8?B?Tk1yQjh3eEs1ZGM1S2t1NGtjUE4yM01Gb0NINFc0UEFFRDZPSnVxek4xY1or?=
 =?utf-8?B?NGg2V1dVTTU1QWxXSTNNeWNQdUI2Vlc5U24vSzhkWG9RYktXZWFNeVQvd1Ez?=
 =?utf-8?B?NnM2Rzc2MlhWYkluTlBvSkE5SzFSS3EzdVN0RDVMVCs5U3RuQm1Vb2N3a2xm?=
 =?utf-8?B?WjEvUDNDT3lqSitkbzRaQjRRNDlpYm93QmptbTZ4ODgrNVpRbFYxOTlvRS9a?=
 =?utf-8?B?M2FMbGtLU3AvZVZ1VFZUZlZCSGVCaEtjTW53a1lIVC9FNVB5NnJGRDFwTzl5?=
 =?utf-8?B?SDc5ZzNEWWptNnJHOGJ3L0RmTER5WHZyc3QrbGc3SVR2dUhtZWsreDVDYXN0?=
 =?utf-8?B?dEVCL2M2aWNQY0FMZjJadzlDdkw3aWtyd1NOOWhuTXpjUXFGc2VqTlFuaXRv?=
 =?utf-8?B?bEQ2SUFSeTlsa3prVGovanN2NGJHZDk0NXFtMW5GRTVreVgxb1dnV25tTUIx?=
 =?utf-8?B?VUVXMmMxZHU2SGF3SkM2dzBrYkZsWXRWYUtERU1URnU2Q3ZqTVd5NHVTbk9O?=
 =?utf-8?B?V01XSHFnNDc5OHRkQVMwQjVncVVSQUpBMzRFaUx6enRIWWJtZlVCKzVjbHlz?=
 =?utf-8?B?aDJhN1BramNpWDh1UU9PU3ErZ2lKNnREWGdDWUszMERoYk1zTmFndExlVXJ3?=
 =?utf-8?B?VFlJVXM3WXRlYjBXSmZEdWN2dDI5MmFGK045ZWhkeSticTZUMTRsZEhlSnEy?=
 =?utf-8?B?M1NFWC9vRXRrRWs2RHZsSkdIdjA0ZlNINGNjL3dTVURHdUc2VGNVcXQ4L3lH?=
 =?utf-8?B?Q2ppdExZRzlDdmRtVVpjQWovWnl3RUhSUzJ4QXZBZ2tSNnF6em53djhpY3Er?=
 =?utf-8?B?djJXYVlHUGVRd1p0cUNRZ1NYdHErdFRGcUYvVXAyeUZubjA5bWJwQkRwczJt?=
 =?utf-8?B?WStKUFlwNXloV3JCVTYxQytQcmZIdWdtRGxjQjNmR1hpTzlhb1JqaC9va1c1?=
 =?utf-8?B?ZnRDeWFBSVp1Ym84TUpoSDZuMUtWK1lIM2xnTnNwVW56UnllWTVHcmlOTlNW?=
 =?utf-8?B?UzZKbWFIRHlwOHBYUDRUY2JQTU1xZ0NCSEVqZDZsOTRpTEVQWHQ5UzI4L3J1?=
 =?utf-8?B?MDg5QnFPSldibXJHMzVweWpoa0RaZ1h0K1pDc29FcVB4NDk3RHBGcWVMUkhz?=
 =?utf-8?B?WkZNMnpPVzJLU1RVN3IxMGVXUFA0a3VDSXd3cHdWNWUza2xocDVsaDZRWllt?=
 =?utf-8?B?M1NYVmR4QjRRUVJ4QjJPY3VXbUQweU5sY2VCTU1GcEpKbktJS0doR3BxZXgx?=
 =?utf-8?B?dFJwdjBkb2hnd1B3SlF5RjQzSEtKbmN3d010QzZ6eE5IOEp4MTVpT21VYUli?=
 =?utf-8?B?VlJ3MGhwQThuQXZsMXpwRjNxVDEwQWJQYXZYRnV0a3NDaXF2SndEdmRoTjRh?=
 =?utf-8?B?V1lScFdnS09yV3A3aVo3YXNRay84VndSZXh1Mlp6R05EWFlTUFEwZmFsRi9k?=
 =?utf-8?B?NGxzbHI2U0hlVmlqd0Z4bG5BaWJBVTRpOFFQTWoyUWsrRnFYTmxjNHFqRmx5?=
 =?utf-8?B?dWpjL3k5OFpuMEtwY3h2dHowZGNsQmxCaDkvRlhOalJMZmo4d3BGc2tLNUpa?=
 =?utf-8?B?TTdsa0wydFJZcmpmV3E3M1hDNjN3OGh1QVcvcnRUd01TSWsydzVVQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C5090ECA5E9F47BF375D197F67F2BA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068cf1c8-e7dd-4226-1a48-08d9aa9dc09c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 14:14:36.6822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsdvdRJFcwV6yGsyGPBUl/26Q3CHMXqgM9TZYhCWjkGllgLa3tOpEsXIXfueZQet7bisYo4rYY2I5OMoX6bGprmghh9knnBU24JPRRbaIC1tHo8/ng+AjdCTEL/OfPkP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5010
X-Proofpoint-ORIG-GUID: 7TQi96NYGyjgToYoK5GdMgJuVhka_4fl
X-Proofpoint-GUID: 7TQi96NYGyjgToYoK5GdMgJuVhka_4fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180080

DQoNCk9uIDE4LjExLjIxIDE2OjA0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBTb3JyeSwg
SSd2ZSBiZWVuIHF1aXRlIGJ1c3kgd2l0aCBvdGhlciBzdGFmZi4NCj4NCj4gT24gVGh1LCBOb3Yg
MTgsIDIwMjEgYXQgMDE6NDg6MDZQTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6DQo+Pg0KPj4gT24gMTguMTEuMjEgMTU6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9u
IDE4LjExLjIwMjEgMTA6MzIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBP
biAxOC4xMS4yMSAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxOC4xMS4yMDIx
IDA5OjU0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxOC4xMS4y
MSAxMDozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDE4LjExLjIwMjEgMDg6NDks
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTcuMTEuMjEgMTA6
MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4+
Pj4+DQo+Pj4+Pj4+Pj4+IFdoZW4gYSB2UENJIGlzIHJlbW92ZWQgZm9yIGEgUENJIGRldmljZSBp
dCBpcyBwb3NzaWJsZSB0aGF0IHdlIGhhdmUNCj4+Pj4+Pj4+Pj4gc2NoZWR1bGVkIGEgZGVsYXll
ZCB3b3JrIGZvciBtYXAvdW5tYXAgb3BlcmF0aW9ucyBmb3IgdGhhdCBkZXZpY2UuDQo+Pj4+Pj4+
Pj4+IEZvciBleGFtcGxlLCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvIGNhbiBpbGx1c3RyYXRlIHRo
ZSBwcm9ibGVtOg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBwY2lfcGh5c2Rldl9vcA0KPj4+Pj4+
Pj4+PiAgICAgICAgIHBjaV9hZGRfZGV2aWNlDQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgIGluaXRf
YmFycyAtPiBtb2RpZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVM
RV9TT0ZUSVJRKQ0KPj4+Pj4+Pj4+PiAgICAgICAgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMN
Cj4+Pj4+Pj4+Pj4gICAgICAgICB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+dnBj
aSkNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KPj4+
Pj4+Pj4+PiAgICAgICAgIHZwY2lfcHJvY2Vzc19wZW5kaW5nOiB2LT52cGNpLm1lbSAhPSBOVUxM
OyB2LT52cGNpLnBkZXYtPnZwY2kgPT0gTlVMTA0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBGb3Ig
dGhlIGhhcmR3YXJlIGRvbWFpbiB3ZSBjb250aW51ZSBleGVjdXRpb24gYXMgdGhlIHdvcnNlIHRo
YXQNCj4+Pj4+Pj4+Pj4gY291bGQgaGFwcGVuIGlzIHRoYXQgTU1JTyBtYXBwaW5ncyBhcmUgbGVm
dCBpbiBwbGFjZSB3aGVuIHRoZQ0KPj4+Pj4+Pj4+PiBkZXZpY2UgaGFzIGJlZW4gZGVhc3NpZ25l
ZA0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBGb3IgdW5wcml2aWxlZ2VkIGRvbWFpbnMgdGhhdCBn
ZXQgYSBmYWlsdXJlIGluIHRoZSBtaWRkbGUgb2YgYSB2UENJDQo+Pj4+Pj4+Pj4+IHt1bn1tYXAg
b3BlcmF0aW9uIHdlIG5lZWQgdG8gZGVzdHJveSB0aGVtLCBhcyB3ZSBkb24ndCBrbm93IGluIHdo
aWNoDQo+Pj4+Pj4+Pj4+IHN0YXRlIHRoZSBwMm0gaXMuIFRoaXMgY2FuIG9ubHkgaGFwcGVuIGlu
IHZwY2lfcHJvY2Vzc19wZW5kaW5nIGZvcg0KPj4+Pj4+Pj4+PiBEb21VcyBhcyB0aGV5IHdvbid0
IGJlIGFsbG93ZWQgdG8gY2FsbCBwY2lfYWRkX2RldmljZS4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4+IFRoaW5raW5nIGFib3V0IGl0IHNvbWUgbW9y
ZSwgSSdtIG5vdCBjb252aW5jZWQgYW55IG9mIHRoaXMgaXMgcmVhbGx5DQo+Pj4+Pj4+Pj4gbmVl
ZGVkIGluIHRoZSBwcmVzZW50ZWQgZm9ybS4NCj4+Pj4+Pj4+IFRoZSBpbnRlbnRpb24gb2YgdGhp
cyBwYXRjaCB3YXMgdG8gaGFuZGxlIGVycm9yIGNvbmRpdGlvbnMgd2hpY2ggYXJlDQo+Pj4+Pj4+
PiBhYm5vcm1hbCwgZS5nLiB3aGVuIGlvbW11X2FkZF9kZXZpY2UgZmFpbHMgYW5kIHdlIGFyZSBp
biB0aGUgbWlkZGxlDQo+Pj4+Pj4+PiBvZiBpbml0aWFsaXphdGlvbi4gU28sIEkgYW0gdHJ5aW5n
IHRvIGNhbmNlbCBhbGwgcGVuZGluZyB3b3JrIHdoaWNoIG1pZ2h0DQo+Pj4+Pj4+PiBhbHJlYWR5
IGJlIHRoZXJlIGFuZCBub3QgdG8gY3Jhc2guDQo+Pj4+Pj4+IE9ubHkgRG9tMCBtYXkgYmUgYWJs
ZSB0byBwcmVtYXR1cmVseSBhY2Nlc3MgdGhlIGRldmljZSBkdXJpbmcgImFkZCIuDQo+Pj4+Pj4+
IFlldCB1bmxpa2UgZm9yIERvbVUtcyB3ZSBnZW5lcmFsbHkgZXhwZWN0IERvbTAgdG8gYmUgd2Vs
bC1iZWhhdmVkLg0KPj4+Pj4+PiBIZW5jZSBJJ20gbm90IHN1cmUgSSBzZWUgdGhlIG5lZWQgZm9y
IGRlYWxpbmcgd2l0aCB0aGVzZS4NCj4+Pj4+PiBQcm9iYWJseSBJIGRvbid0IGZvbGxvdyB5b3Ug
aGVyZS4gVGhlIGlzc3VlIEkgYW0gZmFjaW5nIGlzIERvbTANCj4+Pj4+PiByZWxhdGVkLCBlLmcu
IFhlbiB3YXMgbm90IGFibGUgdG8gaW5pdGlhbGl6ZSBkdXJpbmcgImFkZCIgYW5kIHRodXMNCj4+
Pj4+PiB3YW50ZWQgdG8gY2xlYW4gdXAgdGhlIGxlZnRvdmVycy4gQXMgdGhlIHJlc3VsdCB0aGUg
YWxyZWFkeQ0KPj4+Pj4+IHNjaGVkdWxlZCB3b3JrIGNyYXNoZXMgYXMgaXQgd2FzIG5vdCBuZWl0
aGVyIGNhbmNlbGVkIG5vciBpbnRlcnJ1cHRlZA0KPj4+Pj4+IGluIHNvbWUgc2FmZSBtYW5uZXIu
IFNvLCB0aGlzIHNvdW5kcyBsaWtlIHNvbWV0aGluZyB3ZSBuZWVkIHRvIHRha2UNCj4+Pj4+PiBj
YXJlIG9mLCB0aHVzIHRoaXMgcGF0Y2guDQo+Pj4+PiBCdXQgbXkgcG9pbnQgd2FzIHRoZSBxdWVz
dGlvbiBvZiB3aHkgdGhlcmUgd291bGQgYmUgYW55IHBlbmRpbmcgd29yaw0KPj4+Pj4gaW4gdGhl
IGZpcnN0IHBsYWNlIGluIHRoaXMgY2FzZSwgd2hlbiB3ZSBleHBlY3QgRG9tMCB0byBiZSB3ZWxs
LWJlaGF2ZWQuDQo+Pj4+IEkgYW0gbm90IHNheWluZyBEb20wIG1pc2JlaGF2ZXMgaGVyZS4gVGhp
cyBpcyBteSByZWFsIHVzZS1jYXNlDQo+Pj4+IChhcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UpOg0K
Pj4+Pg0KPj4+PiBwY2lfcGh5c2Rldl9vcA0KPj4+PiAgICAgICAgIHBjaV9hZGRfZGV2aWNlDQo+
Pj4+ICAgICAgICAgICAgIGluaXRfYmFycyAtPiBtb2RpZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4g
cmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0KPj4+PiAgICAgICAgIGlvbW11X2FkZF9k
ZXZpY2UgPC0gRkFJTFMNCj4+Pj4gICAgICAgICB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUo
cGRldi0+dnBjaSkNCj4+Pj4NCj4+Pj4gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KPj4+PiAg
ICAgICAgIHZwY2lfcHJvY2Vzc19wZW5kaW5nOiB2LT52cGNpLm1lbSAhPSBOVUxMOyB2LT52cGNp
LnBkZXYtPnZwY2kgPT0gTlVMTA0KPj4+IEZpcnN0IG9mIGFsbCBJJ20gc29ycnkgZm9yIGhhdmlu
ZyBsb3N0IHRyYWNrIG9mIHRoYXQgcGFydGljdWxhciBjYXNlIGluDQo+Pj4gdGhlIGNvdXJzZSBv
ZiB0aGUgZGlzY3Vzc2lvbi4NCj4+IE5vIHByb2JsZW0sIEkgc2VlIG9uIHRoZSBNTCBob3cgbXVj
aCB5b3UgcmV2aWV3IGV2ZXJ5IGRheS4uLg0KPj4+IEkgd29uZGVyIHRob3VnaCB3aGV0aGVyIHRo
YXQncyBzb21ldGhpbmcgd2UgcmVhbGx5IG5lZWQgdG8gdGFrZSBjYXJlIG9mLg0KPj4+IEF0IGJv
b3QgKG9uIHg4NikgbW9kaWZ5X2JhcnMoKSB3b3VsZG4ndCBjYWxsIGRlZmVyX21hcCgpIGFueXdh
eSwgYnV0DQo+Pj4gdXNlIGFwcGx5X21hcCgpIGluc3RlYWQuIEkgd29uZGVyIHdoZXRoZXIgdGhp
cyB3b3VsZG4ndCBiZSBhcHByb3ByaWF0ZQ0KPj4+IGdlbmVyYWxseSBpbiB0aGUgY29udGV4dCBv
ZiBpbml0X2JhcnMoKSB3aGVuIHVzZWQgZm9yIERvbTAgKG5vdCBzdXJlDQo+Pj4gd2hldGhlciBp
bml0X2JhcnMoKSB3b3VsZCBmaW5kIHNvbWUgZm9ybSBvZiB1c2UgZm9yIERvbVUtcyBhcyB3ZWxs
KS4NCj4+PiBUaGlzIGlzIGV2ZW4gbW9yZSBzbyBhcyBpdCB3b3VsZCBiZXR0ZXIgYmUgdGhlIGV4
Y2VwdGlvbiB0aGF0IGRldmljZXMNCj4+PiBkaXNjb3ZlcmVkIHBvc3QtYm9vdCBzdGFydCBvdXQg
d2l0aCBtZW1vcnkgZGVjb2RpbmcgZW5hYmxlZCAod2hpY2ggaXMgYQ0KPj4+IHByZXJlcSBmb3Ig
bW9kaWZ5X2JhcnMoKSB0byBiZSBjYWxsZWQgaW4gdGhlIGZpcnN0IHBsYWNlKS4NCj4+IFdlbGws
IGZpcnN0IG9mIGFsbCBpbml0X2JhcnMgaXMgZ29pbmcgdG8gYmUgdXNlZCBmb3IgRG9tVXMgYXMg
d2VsbDoNCj4+IHRoYXQgd2FzIGRpc2N1c3NlZCBwcmV2aW91c2x5IGFuZCBpcyByZWZsZWN0ZWQg
aW4gdGhpcyBzZXJpZXMuDQo+Pg0KPj4gQnV0IHRoZSByZWFsIHVzZS1jYXNlIGZvciB0aGUgZGVm
ZXJyZWQgbWFwcGluZyB3b3VsZCBiZSB0aGUgb25lDQo+PiBmcm9tIFBDSV9DT01NQU5EIHJlZ2lz
dGVyIHdyaXRlIGVtdWxhdGlvbjoNCj4+DQo+PiB2b2lkIHZwY2lfY21kX3dyaXRlKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBjbWQsIHZvaWQgKmRhdGEpDQo+PiB7
DQo+PiBbc25pcF0NCj4+ICAgwqDCoMKgwqDCoMKgwqAgbW9kaWZ5X2JhcnMocGRldiwgY21kLCBm
YWxzZSk7DQo+Pg0KPj4gd2hpY2ggaW4gdHVybiBjYWxscyBkZWZlcl9tYXAuDQo+Pg0KPj4gSSBi
ZWxpZXZlIFJvZ2VyIGRpZCB0aGF0IGZvciBhIGdvb2QgcmVhc29uIG5vdCB0byBzdGFsbCBYZW4g
d2hpbGUgZG9pbmcNCj4+IG1hcC91bm1hcCAod2hpY2ggbWF5IHRha2UgcXVpdGUgc29tZSB0aW1l
KSBhbmQgbW92ZWQgdGhhdCB0bw0KPj4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgYW5kIFNPRlRJUlEg
Y29udGV4dC4NCj4gSW5kZWVkLiBJbiB0aGUgcGh5c2Rldm9wIGZhaWx1cmUgY2FzZSB0aGlzIGNv
bWVzIGZyb20gYW4gaHlwZXJjYWxsDQo+IGNvbnRleHQsIHNvIG1heWJlIHlvdSBjb3VsZCBkbyB0
aGUgbWFwcGluZyBpbiBwbGFjZSB1c2luZyBoeXBlcmNhbGwNCj4gY29udGludWF0aW9ucyBpZiBy
ZXF1aXJlZC4gTm90IHN1cmUgaG93IGNvbXBsZXggdGhhdCB3b3VsZCBiZSwNCj4gY29tcGFyZWQg
dG8ganVzdCBkZWZlcnJpbmcgdG8gZ3Vlc3QgZW50cnkgcG9pbnQgYW5kIHRoZW4gZGVhbGluZyB3
aXRoDQo+IHRoZSBwb3NzaWJsZSBjbGVhbnVwIG9uIGZhaWx1cmUuDQpUaGlzIHdpbGwgc29sdmUg
b25lIHBhcnQgb2YgdGhlIGVxdWF0aW9uOg0KDQpwY2lfcGh5c2Rldl9vcA0KICAgICAgICBwY2lf
YWRkX2RldmljZQ0KICAgICAgICAgICAgaW5pdF9iYXJzIC0+IG1vZGlmeV9iYXJzIC0+IGRlZmVy
X21hcCAtPiByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpDQogICAgICAgIGlvbW11X2Fk
ZF9kZXZpY2UgPC0gRkFJTFMNCiAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHhmcmVlKHBk
ZXYtPnZwY2kpDQoNCkJ1dCB3aGF0IGFib3V0IHRoZSBvdGhlciBvbmUsIGUuZy4gdnBjaV9wcm9j
ZXNzX3BlbmRpbmcgaXMgdHJpZ2dlcmVkIGluDQpwYXJhbGxlbCB3aXRoIFBDSSBkZXZpY2UgZGUt
YXNzaWduIGZvciBleGFtcGxlPw0KDQo+DQo+IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpP
bGVrc2FuZHI=

