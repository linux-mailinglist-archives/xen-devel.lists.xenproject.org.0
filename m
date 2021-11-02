Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E8442C41
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220059.381156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrhU-0004WR-6X; Tue, 02 Nov 2021 11:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220059.381156; Tue, 02 Nov 2021 11:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrhU-0004Ty-22; Tue, 02 Nov 2021 11:11:32 +0000
Received: by outflank-mailman (input) for mailman id 220059;
 Tue, 02 Nov 2021 11:11:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhrhS-0004Tr-DS
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:11:30 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a05f31dc-3bcd-11ec-8555-12813bfff9fa;
 Tue, 02 Nov 2021 11:11:29 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2Ai7Yc013360;
 Tue, 2 Nov 2021 11:11:24 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c33u9g5db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:11:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2196.eurprd03.prod.outlook.com (2603:10a6:200:4d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 11:11:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:11:20 +0000
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
X-Inumbo-ID: a05f31dc-3bcd-11ec-8555-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT4PQ1Q/L6UJHsiu2VApRWxXXBdnmYJDSWMXFVjUA6rDvyWhtIP9aiE0Bch1ErwprlLf8vOukkg6z83TX/qaO4X7bQofOO7rGYU6BJK4xj/ohV5YUtaN0FlWlU3JgbI7d14ZNGJdUAD4judgl9aYZk1KmT5xCelFPmOGDJa0wxIimMtIFGUugioIe4TQan2c0wXRz0r8C+SyGsner4xtwK5QdDyHtX5TEri+j/wyrgbjEB4fcvm7xz+l7Q74DL5g4L3uMDxPcoIAgfMNqcPW3GxcyvfQERTkymYOvogqNMYML64RSG4fjocpfvgxjRGP9WVkJtresCOO69PemhoBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a43ZpsMMXM1J9N3XgilssJomOsxNiOEfsxY08QcpSBw=;
 b=kkazGXWXrstbb3utZvuW6EwcEmTz33yHNj1z7WtHF4qCbSPl4LiHPiYNps99sTjZJ+A0L6IRT+3S2iFi568z9DUJFfZM9NzcHXljkp94hStCnQZMXtVG9Sh0tN8ntvF+wzhOHS5mivfhFsliBU2s8arz1vJc3DfsjO+zMghZWjonTUgszpEVh3y+6ewxImNLMzVx0rAL2l1sMBZqGupD5Ex5ViUaOZBX8ito3j8We7uNR2yceuzPJYdcq4zpfXoEXqxB9ByiutbLnjIZfYsE2lm41q/+kXy8PtwgcK+3u1XCRKHh7p2rqg3yA5yae5qeW7ElFRlnuSG1Yej24K6icA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a43ZpsMMXM1J9N3XgilssJomOsxNiOEfsxY08QcpSBw=;
 b=XyBBw6RKrVXuqMPzZCqMcvNGstH/ah6ra+lIqvqq50Ru9lH0GbWdKbGYI1zeeCwVp9+6edLq1yZNiA0Sus/jYOIT+TUilO+N6kFxEIt/Nt9fjli48TPQ//+VI0vpvMR9ebDSaLlipdAgD6tByW79xe58vRq3w+btShqzbc+eK2e0QsyR8PXHph+Ec5c5YPRgVnymLqrWFBdxKj55fHbuQnYqwRjKhbQng19YYpo3hu/IxzkSjjPSkAepx2kq3L80QHmgnEXZKewBwYYQfVdS52MfTXvZhh6xjUJxM0eW2ByGaFH5gnz8k23ieCxNWAX+dAZM5ZBhVy6vss3gXtNIwg==
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
        Michal Orzel
	<michal.orzel@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 09/11] vpci/header: Reset the command register when
 adding devices
Thread-Topic: [PATCH v3 09/11] vpci/header: Reset the command register when
 adding devices
Thread-Index: AQHXtdAlyl+du69X4UG+jShhj1IBLKvlRdCAgAsDSQA=
Date: Tue, 2 Nov 2021 11:11:20 +0000
Message-ID: <4ad7a854-69f7-84d1-8f48-e8f19235df39@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-10-andr2000@gmail.com>
 <YXff21oTvTm7EomE@MacBook-Air-de-Roger.local>
In-Reply-To: <YXff21oTvTm7EomE@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9259f0b-72ba-42dc-aa68-08d99df17fe3
x-ms-traffictypediagnostic: AM4PR0301MB2196:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB21960AD93A7ABBBBFF14F334E78B9@AM4PR0301MB2196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PvOfEYXGUTub+5CkMVmuphaNHtGzP0qJ3AlF05BujCe8WQ+UVdIAdXHj00ATVoTcYzqo512AlzAy/jRrRXERw0DoqUmbFRr9UgRjglV0OXXIRLtTi9+O+5l/P/WHxgoQNN73LUj9GdRiVYRYr4Pq4eB53tp1MTk4UXa37sD2s+rPouqvLdlwmIig5blpR6M7FkUfPd/MEyakMxAlLXmW9qvxVt9RHB/pMzHULIn0PRRolg/4QwfrZG9gY03F0e3pwIVgVo/3bwNpdJcfWk5rw5b4g8LVV8U4ODncnAacuhuMv1+Lo1bUmLqebajWNwDY8T4hbjdK+GjQjw0WAL/YgeECbFhZy06qxR4e8c8lpbNIP+xjNg8dQ8KFuAKljgy1KDvEyZhT5te/pKSIaBay71EeQw2/jsuoPWjndWNS2wHvJPEi/29cRsu1POeZbz1UgcRKtu9se0kt7HELa5Gn0tpElYaZiUZ/WpTf7SkLXgrW2gcT3yHo3ckHHEPt0uvi5lRSrNJqbiF9D+1e7pOPwqLqSnao41B4vUPxW3/JDnfls4AvrMIDEP9ilrKtcNG/jocEPucZYRBTRcK+nvFTzOMov+Xi+RzZofcNkE1s3rOqqvrkLBZPWOd5JLnXbYJtOb1wxRekhQVx5djTotM9xjFTpikpXt2z8hEN96CUzwI8Z5YQbm36PjxzGSLhomBkAmynWE70iE9eeFN3XkBjX2fUXmm/HKCfuYk9YzNyRvfme4EHegogGQhI89+KXYpM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(31696002)(26005)(6486002)(6512007)(316002)(38070700005)(186003)(54906003)(71200400001)(8676002)(38100700002)(508600001)(107886003)(122000001)(8936002)(53546011)(83380400001)(6506007)(4326008)(91956017)(76116006)(36756003)(66446008)(64756008)(66476007)(6916009)(5660300002)(66556008)(66946007)(2616005)(2906002)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFRQSFhBMkIrUzF2SWFSZVE1R0I3NlAxVUNSNHpDUERpZkdqbm1ERXVwVWJR?=
 =?utf-8?B?eFZWcE83MUxUWjRSZmR2WGRaRDN2TGIzbnJaMXdGUkhJVGJYZ0t4Qk5ObWdq?=
 =?utf-8?B?MUhWenp2RXQ5K0w3UGJOWXpxb0hxcEtSaFFmTS9VVW1sQ3N1MDFvWS82R1pH?=
 =?utf-8?B?a0h3cE5jVkg5Q3NLbzVZYTdsdDBnNnhaeTg2SVBBdUpwcUQ1WHlaank3eUFy?=
 =?utf-8?B?S2VqS3dzUjduUWpDRllTQmlVQnUzaWlMdnEwRDFxWVN1a3hRUEVNMllqamhX?=
 =?utf-8?B?cGt2Z0hHaVArM08wbldVZjlnR3FiM1hzcGZCbWpERVIxbTVwaFlHSDF4aWxW?=
 =?utf-8?B?N1VtWlVqdGtyYUtLYXZvYjBHVWJXSWJ1Z2s5YnU0K0tzdWtjd0NBNmEwdzgr?=
 =?utf-8?B?TFBwWFJrejdIZUNxbHJoOTQ1Y0c4cjllaGNQK3F6NHdBS0xFNnU0M29ncVE1?=
 =?utf-8?B?c29LYXNDdFpEbGpKd0ZlWHYwNXZCSytYemN4aVd1dVgvNG1IajhtZk1GQ05H?=
 =?utf-8?B?cStJZjg2Y2ZPcHNkSjZ4SVFyVTkzcGVFWWxtZjRtUHhGdkdCZ28wMHlPc3hy?=
 =?utf-8?B?dTVSVnBvRVVPTFcyTzdtaDFHL2FzMm1Kam5YaTdmaThVazZXcVA5SU0vVjVC?=
 =?utf-8?B?bVhwOHFJd1MwelJPaFJuK0ZzbWhhN2tUV1RDRUhraUxmejVFTUdNUHlVRUVO?=
 =?utf-8?B?TnFacTJENGliQTZ0aHNmbi8rZnhTU1V4T3hxMTZzbDFXWHptSXpZSWZXRGYr?=
 =?utf-8?B?Z09DQW5vdlBNcldDR3kyUC9xQ3VVT0tTS3BxS2xrelhBZ3J2aTRpOWg2eUg4?=
 =?utf-8?B?MWUxV2dwWm50N3FGWTRCQXhKdzBZU3B6ZnI0bmZTVmJIVkt5dzl4Y3B4dDRX?=
 =?utf-8?B?emsrYy8yb1VHa0xBVHJIVjlWWklpTWw3dFNTS05Ud2FEZHY0SllXbVBPL1JK?=
 =?utf-8?B?R3hQZUY5RUFXWFk3eU5UNkx2YmMyTlF0OHpnaS9KWGwwMitncG9HWE9oTCts?=
 =?utf-8?B?SjJFMSs1NUdZTjN6UHlRdTluOCtqam5ocVV0ZDRTZU5NeTdYeU5OY1B5N0xS?=
 =?utf-8?B?bTNCU0dhaWQvZ1FFUk1XVU8wQUFUQkxTZ1hmQlJmb296Zy9FU3ZWU3dKNU9a?=
 =?utf-8?B?WjIybG1hUEtzMzBtaitCdnBIM3I3RnhVM1l1YVNKS1g5a2xsdC9IL3U4Wld5?=
 =?utf-8?B?OGd1ZE1INWlnNlJuUDUrVFl2Uk1NTEhmUWRua3JDQStiSU04TThoS0JMZVVn?=
 =?utf-8?B?YzZSVjlzejhRcUJRSzIvbDhFZ2w3V1ZVQkpMZ1hOSUllaVdDWi9Dcjd6QnR5?=
 =?utf-8?B?TU9UQ0Q0aWFIRVhKRllUc3VFR1NVRGZvZWoxdUszZ3hOb2lYaVU1RW9YWW9V?=
 =?utf-8?B?d3hJYXBKOGxtNzAwbEpjK05INjBlWkJnNUFKdUU5S0lJZnAwWHBXcFd5YnBX?=
 =?utf-8?B?aTRKKzlvV0hHN1RtQ0ZIeHROYkVoN0l6N2xHK0Z5WXpFZzlmT2hlZE5mMjlV?=
 =?utf-8?B?Mi9oeSt1VXhTaThNOVVzeDRKSWVZbmpraTZZOWs2SjNFMUo4TzhXV3EybFVQ?=
 =?utf-8?B?SEQwNUdnWFNmalRuREpodURQWXhwSGlBODdQYXZsZFhlcjBmRVNMRXhHODg4?=
 =?utf-8?B?bzcvQ3A1MVdTUmVlc3M4Um5pbXAwdHdORDhjalhOVWVzT0dyMGd3TVJkcXdC?=
 =?utf-8?B?MFJhZitmZFVzRFZEKytoVldXVmkvWmRmY0REUkQzZlE3eUFRUmZ4V0NHQUMv?=
 =?utf-8?B?aFZMbnhzeFRBOENnU1VseUhuZERydmhvWjhhQkJEcUZJWjlTSGhIWGc2QzZT?=
 =?utf-8?B?ZXdMNW5yQS9meDlHR0FNTHZBQTJDTjRHbklMMGx6MHhYSWJ3cVozaWZPSGtm?=
 =?utf-8?B?QUVISWpqVTdEb3ZxSXltd2JodTFwZVdJZ1llVlJMbUx3MjRveVNvS3duMVp2?=
 =?utf-8?B?OXFTY3pqR1llTS9rcjE1WENxdVQ2WklqMU9KMVo2cFVKSmg2OE1VRFAxUlBM?=
 =?utf-8?B?RVZvMG4zcjZxWEQraHdaTWxzZGcxejlyYWpKSUd5UHpuN3JtVHBacTlObWl0?=
 =?utf-8?B?Y0ZVY0pSQmdkMnlDZFU3NlZuaFZkZS9oNTU1dXRUS0ttVUM3Ujh3TktnNHpl?=
 =?utf-8?B?WGU4Q20rR1FLalh5d3FqM3FEdGYzQzlLUGMyc3FaaWFvdTZaVnRXNG9SWm5s?=
 =?utf-8?B?SjczWG5XRUF1NndsL0tybmFJa01lVTNpdVc4ejVBYTJaTnhHeXFWT055OTdx?=
 =?utf-8?B?SERLYUJucVhnRDUwZXRBa2ExTEhkY2RudnhOS2pGbXlDN2FyVVh4UzdYdXZk?=
 =?utf-8?B?SWNLT0Rnek5rNVR6UzNxZkFiTGtPWWZ1YkRjOVYrSDdnazRtcTFMdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E71259BC6E312341B661BDDF50829618@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9259f0b-72ba-42dc-aa68-08d99df17fe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 11:11:20.6458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0eKb/dLJBOx9TnTBSqzznCwGw1Gck8TB7u4AK9A/WGwoCme8uLFuOY2n3fthRVAe4BofL6vnRYq5G3pK2tNRjCwatRnBUByu6p459DMZ20bc1uOmkQ9MzFgGBFeU8Ut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2196
X-Proofpoint-GUID: 7P8E3WBhXzqDrSRFsEGynLM-OCV5NkxA
X-Proofpoint-ORIG-GUID: 7P8E3WBhXzqDrSRFsEGynLM-OCV5NkxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020066

SGksIFJvZ2VyIQ0KDQpPbiAyNi4xMC4yMSAxNDowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MjFBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gUmVzZXQgdGhlIGNvbW1hbmQg
cmVnaXN0ZXIgd2hlbiBwYXNzaW5nIHRocm91Z2ggYSBQQ0kgZGV2aWNlOg0KPj4gaXQgaXMgcG9z
c2libGUgdGhhdCB3aGVuIHBhc3NpbmcgdGhyb3VnaCBhIFBDSSBkZXZpY2UgaXRzIG1lbW9yeQ0K
Pj4gZGVjb2RpbmcgYml0cyBpbiB0aGUgY29tbWFuZCByZWdpc3RlciBhcmUgYWxyZWFkeSBzZXQu
IFRodXMsIGENCj4+IGd1ZXN0IE9TIG1heSBub3Qgd3JpdGUgdG8gdGhlIGNvbW1hbmQgcmVnaXN0
ZXIgdG8gdXBkYXRlIG1lbW9yeQ0KPj4gZGVjb2RpbmcsIHNvIGd1ZXN0IG1hcHBpbmdzIChndWVz
dCdzIHZpZXcgb2YgdGhlIEJBUnMpIGFyZQ0KPj4gbGVmdCBub3QgdXBkYXRlZC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+DQo+PiBSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6
ZWxAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gU2luY2UgdjE6DQo+PiAgIC0gZG8gbm90IHdyaXRlIDAg
dG8gdGhlIGNvbW1hbmQgcmVnaXN0ZXIsIGJ1dCByZXNwZWN0IGhvc3Qgc2V0dGluZ3MuDQo+PiAt
LS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDE3ICsrKysrKysrKysrKystLS0t
DQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYw0KPj4gaW5kZXggNzU0YWViNWE1ODRmLi43MGQ5MTFiMTQ3ZTEgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtNDUxLDggKzQ1MSw3IEBAIHN0YXRpYyB2b2lkIGNt
ZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+
ICAgICAgICAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+ICAg
fQ0KPj4gICANCj4+IC1zdGF0aWMgdm9pZCBndWVzdF9jbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IGNtZCwgdm9pZCAqZGF0YSkNCj4+ICtzdGF0aWMgdWludDMyX3QgZW11
bGF0ZV9jbWRfcmVnKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MzJfdCBjbWQpDQo+
PiAgIHsNCj4+ICAgICAgIC8qIFRPRE86IEFkZCBwcm9wZXIgZW11bGF0aW9uIGZvciBhbGwgYml0
cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCj4+ICAgDQo+PiBAQCAtNDY3LDE0ICs0NjYs
MjAgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gICAgICAgICAgICAgICBjbWQgfD0gUENJX0NPTU1B
TkRfSU5UWF9ESVNBQkxFOw0KPj4gICAgICAgICAgIGVsc2UNCj4+ICAgICAgICAgICB7DQo+PiAt
ICAgICAgICAgICAgdWludDE2X3QgY3VycmVudF9jbWQgPSBwY2lfY29uZl9yZWFkMTYocGRldi0+
c2JkZiwgcmVnKTsNCj4+ICsgICAgICAgICAgICB1aW50MTZfdCBjdXJyZW50X2NtZCA9IHBjaV9j
b25mX3JlYWQxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCk7DQo+IEVpdGhlciB3ZSBrZWVwIHJl
ZyBoZXJlIG9yIHdlIGRyb3AgdGhlIHBhcmFtZXRlciBhbHRvZ2V0aGVyIGZyb20gdGhlDQo+IGZ1
bmN0aW9uIHByb3RvdHlwZS4gSGF2aW5nIG9uZSBjYWxsZXIgcGFzcyAwIHdoaWxlIHRoZSBvdGhl
ciBwYXNzaW5nDQo+IFBDSV9DT01NQU5EIGlzIGNvbmZ1c2luZy4gVGhlIG1vcmUgdGhhdCB0aGUg
cGFyYW1ldGVyIGlzIG5vdw0KPiBlZmZlY3RpdmVseSB1bnVzZWQuDQpUaGlzIGlzIHByb2JhYmx5
IGJlY2F1c2UgZ2l0IGRpZmYgaXNuJ3QgcmVhbGx5IGhlbHBmdWwgaGVyZSBpbiBzaG93aW5nIHRo
ZSBjaGFuZ2U6DQpzdGF0aWMgdWludDMyX3QgZW11bGF0ZV9jbWRfcmVnKGNvbnN0IHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LCB1aW50MzJfdCBjbWQpDQp7DQogwqDCoMKgIC8qIFRPRE86IEFkZCBwcm9w
ZXIgZW11bGF0aW9uIGZvciBhbGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCg0K
IMKgwqDCoCBpZiAoIChjbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpID09IDAgKQ0KIMKg
wqDCoCB7DQogwqDCoMKgwqDCoMKgwqAgLyoNCiDCoMKgwqDCoMKgwqDCoMKgICogR3Vlc3Qgd2Fu
dHMgdG8gZW5hYmxlIElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWY6DQogwqDCoMKgwqDCoMKg
wqDCoCAqwqAgLSBob3N0IGhhcyBJTlR4IGRpc2FibGVkDQogwqDCoMKgwqDCoMKgwqDCoCAqwqAg
LSBNU0kvTVNJLVggZW5hYmxlZA0KIMKgwqDCoMKgwqDCoMKgwqAgKi8NCiDCoMKgwqDCoMKgwqDC
oCBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+ZW5hYmxlZCApDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0KIMKgwqDCoMKgwqDCoMKgIGVsc2UN
CiDCoMKgwqDCoMKgwqDCoCB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCBjdXJy
ZW50X2NtZCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCk7DQoNCiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggY3VycmVudF9jbWQgJiBQQ0lfQ09NTUFORF9JTlRY
X0RJU0FCTEUgKQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbWQgfD0gUENJX0NP
TU1BTkRfSU5UWF9ESVNBQkxFOw0KIMKgwqDCoMKgwqDCoMKgIH0NCiDCoMKgwqAgfQ0KDQogwqDC
oMKgIHJldHVybiBjbWQ7DQp9DQoNClNvLCByZWcgaXMgbm90IHVzZWQgaGVyZSBhbmQgY21kIGlz
IHRoZSBkZXNpcmVkIHZhbHVlIG9mIHRoZSBQQ0lfQ09NTUFORA0KcmVnaXN0ZXIuIFNvLCBJIHNl
ZSBubyBjb25mdXNpb24gaGVyZS4NCj4+ICAgDQo+PiAgICAgICAgICAgICAgIGlmICggY3VycmVu
dF9jbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgKQ0KPj4gICAgICAgICAgICAgICAgICAg
Y21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4+ICAgICAgICAgICB9DQo+PiAgICAg
ICB9DQo+PiAgIA0KPj4gLSAgICBjbWRfd3JpdGUocGRldiwgcmVnLCBjbWQsIGRhdGEpOw0KPj4g
KyAgICByZXR1cm4gY21kOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBndWVzdF9jbWRf
d3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGNtZCwgdm9pZCAqZGF0YSkNCj4+
ICt7DQo+PiArICAgIGNtZF93cml0ZShwZGV2LCByZWcsIGVtdWxhdGVfY21kX3JlZyhwZGV2LCBj
bWQpLCBkYXRhKTsNCj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIHZvaWQgYmFyX3dyaXRlKGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gQEAgLTc5Myw2
ICs3OTgsMTAgQEAgaW50IHZwY2lfYmFyX2FkZF9oYW5kbGVycyhjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgICAgICBnZHByaW50ayhY
RU5MT0dfRVJSLA0KPj4gICAgICAgICAgICAgICAgICAgICIlcHA6IGZhaWxlZCB0byBhZGQgQkFS
IGhhbmRsZXJzIGZvciBkb20lcGQ6ICVkXG4iLA0KPj4gICAgICAgICAgICAgICAgICAgICZwZGV2
LT5zYmRmLCBkLCByYyk7DQo+PiArDQo+PiArICAgIC8qIFJlc2V0IHRoZSBjb21tYW5kIHJlZ2lz
dGVyIHdpdGggcmVzcGVjdCB0byBob3N0IHNldHRpbmdzLiAqLw0KPj4gKyAgICBwY2lfY29uZl93
cml0ZTE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5ELCBlbXVsYXRlX2NtZF9yZWcocGRldiwgMCkp
Ow0KPiBJIHRoaW5rIHdlIGxpa2VseSB3YW50IHRvIHVuc2V0IHRoZSBtZW1vcnkgYW5kIElPIGRl
Y29kaW5nIGJpdHMgZnJvbQ0KPiB0aGUgY29tbWFuZCByZWdpc3RlciwgYXMgdGhlIGd1ZXN0IHZp
ZXcgb2YgdGhlIEJBUiBhZGRyZXNzIGlzDQo+IGN1cnJlbnRseSBmb3JjZWQgdG8gMCwgYW5kIG5v
dCBtYXBwZWQgaW50byB0aGUgZ3Vlc3QgcDJtLg0KQnkgcGFzc2luZyAwIGhlcmUgYXMgdGhlIGRl
c2lyZWQgdmFsdWUgb2YgdGhlIFBDSV9DT01NQU5EIHJlZ2lzdGVyDQp3ZSBkbyB0aGF0LiBUaGUg
ZW11bGF0aW9uIGNvZGUgd2lsbCB0YWtlIGNhcmUgb2YgdGhhdC4NCj4NCj4gVGhhbmtzLCBSb2dl
ci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

