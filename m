Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDF5016DF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 17:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304906.519646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf1l3-0008JP-OP; Thu, 14 Apr 2022 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304906.519646; Thu, 14 Apr 2022 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf1l3-0008HV-KH; Thu, 14 Apr 2022 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 304906;
 Thu, 14 Apr 2022 15:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JhPh=UY=citrix.com=prvs=096381d68=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nf1l1-0008HP-Q3
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 15:51:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5c20ff3-bc0a-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 17:51:41 +0200 (CEST)
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
X-Inumbo-ID: c5c20ff3-bc0a-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649951501;
  h=from:to:subject:date:message-id:mime-version;
  bh=UfdD6DNA2F/xxG9DeQm9MsaviDoNXSr6zE/nTFJ1pEY=;
  b=ItxpqUI1v2hXKdzgb3pwGIJ2S+4R5MEYheTTa64P2lpgdAgF6YRMxCSz
   37MxMQFm6gaAYWHyUZxhmwHGmVfZltVZiciXDHxES7lDAy7Uto2TlaEzb
   PbRsOXDlJIaIRQrtaiphteEmdk4whehcjEKBeHAg9mSzFv9fV/NcsrGdY
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 71391243
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Aydu364ZRIJiBmG3AXjZ/QxRtNTHchMFZxGqfqrLsTDasI4TYg02e
 lBvGjDRZK7OJyCgZYg1O70CxjpUvsfTzodkHQppqyk2Hi8U8ZWaDtnJcxz+YnKeJ8CaRRlp4
 8kUM4LOdJ5tEXWMrxmkOea48XVwivjWFuGmBuSeUswdqXeIbQ944f40s7Jp0uaE+OSEPj5hm
 e8eguXSZgX0hTR5OG9Juvrbpko2tv3/5m0V71VmOvwQ4gbTnShJAMoTK5/qIiqjSOG4PAIbq
 8Uvbl2d1jmEl/v4Ior9yt4XSmVTHviKe1LmZkN+A8BOuDAbzsAJ+vt9ZaJ0hXt/0W3TxYgtk
 YkV7/RcdC9yVkHysLVFO/VnO3kW0Z1uoNcr9lDm7KR/Z2WfG5fd660G4HMeZOX0yc4uaY16z
 tQKKShlU/y2r7neLIRX6AVbrp9LwMHDZOvzs5z7pN3TJa5OrZvrG80m6TLEtduZaw8n8fv2P
 qIkhTRTgBvoWh1uK3E1MrsCk9yo2UDudxlEjHvIuv9ii4TT5FQZPLnFNdPUfpqBRNlPn1ber
 WXDl4j7KkhEbprFk2PDqy/ywL+U9c/4cNt6+LmQ2fNtmlKegEAODhkfTXOwoOWji174UNVaQ
 6AR0nV39vlrrhDwJjX7dxnm8Tm7g11bZ+ZBQtc44w286pL34z/MUwDoSRYeMYd75afaXwcCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RizrAkvoZcppPIE7KXkxEHDpy6Ij8XWG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fPtrZ5ycCl/GI+THZuhb8NIsmjn9ZLlHvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF3l3BknTqNGcugknxLNIZyglbPGN/p13PUMIgEAF6s+l2Jo
 76zyePXo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49GLsVsLOh7rrE7pRO2J
 tFcE/i97j10Ymmv0xwWbIXnrZwkcxKuhAmUODGibiR5dJllLzElMPe4I1WHGPUmZsZvifYDn
 g==
IronPort-HdrOrdr: A9a23:7G4UAKGuICeGCxGMpLqFZpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdoZJhSo6H6BEDgewKWyXcR2+cs1NiZLW/bUQeTXeJfBOjZsnfd8k/Fh5dgPM
 5bGsAUYryRMbETt7e/3ODSKadE/DDzytHOuQ6o9QYIcegFUdAD0y5JTiKgVmFmTghPApQ0UL
 CG4NBcmjamcXMLKuymG3gsRYH41pD2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8F
 LCjxfy6syYwr2GI17npiDuBqZt6ZrcI+h4dYyxYw8uW3bRYzOTFcpcsnu5zXIISa+UmRMXeZ
 L30m0d1oxImg7slyeO0FzQMkDboUkTwm6nxlmCjXT5p8vlADo8FspanIpcNgDU8kw6obhHod
 R2N/LwjesqMfrsplWI2zHzbWAcqqN0mwtQrccDy3hEFYcOYr5YqoISuEtTDZcbBSr/rIQqCv
 NnAs3Q7OtfNQryVQGQgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D5NE++
 PHOKJ1k6wmdL5eUYttQOMaBcenAG3ERhzBdGqUPFT8DakCf2nArpbmiY9Fkd1CuKZ4vqfatK
 6xIW+w71RCBX4GIff+rKF2zg==
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="asc'?scan'208";a="71391243"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGMCzwuDGAgieJR+g/ZQGYTRkA3Hi1kdYtD4oa8y1yU2E8Gx5L0XBPZphTZrFsnyQqk5UcAoa7h32h/3G3cC6a8zbza+w9/w9B5SdPbeWCZ3pJKaaESGFjw2dzM/SZrMoTLZW/XM1Wo9ZRg8B44GEDHySnNAgSmlgpPkQcSE7XY+/luRY37q5uuqKuXDrhFJyzSUoD4T+hhZ7LXjLxSzhh6kybsZ85gy45EylzorP0+TolqlmyYiq7FePPYRDQc08EKY+zz/HWK9NLYg2KaAKhoyDOKU+tcFIQO/TwV314UkkTOY3NNoISOfKXpgzyj1xxCTkEmMeZJYiA1jLhwWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGSbko+WcgL6PKsgTJywUL0utattM8w/OHIWrgcQxIk=;
 b=anb0MmBDHWm7jVfRsd6NoNLPruMxuGZwXPhjWXt3rHdahj29aZ3/u3v9IBq6gZnC5UKQj5w91+ov8JgEWlFTAIgXOlNrWZ1d5wds1LBxiKvAw+KsIqHc75vlo9wwHd9+EbrfGs9XnmLG6s14MoOAhY4YQSijGjjz+IwPDvEKM4dQ7QY8ayjOmaVJ8teVxGa5lEKD38Sns6zdf39DojbRi+lCDW9r8sJrQ6x0SAFxzfDa8qFYvNU8dXgWc2RS00g8d2HSn4OMqq5ScwNnTz8zVa7X/3fTWe6mNjv226SmgOYd/32Yt2aEFwcH7Bsp7iaTLUr0uq7ZdXVlUfTQHfhoDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGSbko+WcgL6PKsgTJywUL0utattM8w/OHIWrgcQxIk=;
 b=GpOccjMc/EsgOe2oar3K+ZbfDHB3c3+CQ9Qtf2Rh+yBjlnSkKXQU6eq+nvTMgjRj3ohxpq/Z9Gs8HV8ZYSA7mhppvy+XzgB5z1kMbbXhPo46vU6Prc2fn8uw0LMJmiD4PEl4fKV/NvQe1jguSYz0bsOABoACOaPErVFZsY2hDzA=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: PROPOSAL: Delete www-archive.xenproject.org
Thread-Topic: PROPOSAL: Delete www-archive.xenproject.org
Thread-Index: AQHYUBdJiHjKQTnhikefVXxt1bvp5A==
Date: Thu, 14 Apr 2022 15:49:55 +0000
Message-ID: <C3E2E17D-BFC1-48FB-837B-7FB621A3A3F7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f145b23-be89-4a26-4ed5-08da1e2e6c49
x-ms-traffictypediagnostic: DM6PR03MB5033:EE_
x-microsoft-antispam-prvs: <DM6PR03MB5033009D0B8198F76C67E84199EF9@DM6PR03MB5033.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: meUjPo8xZQ1167yzVhmKYwUa5tw5pTv/BcZd2bKORUvBZ6tz3kJwL1/Q9ctW79ybfCQM8jm4N28nUhmAw5cndBXtdm4Ls7qGhDjp/Oz53fQwFqtFnuatINKAW5fuNdh931YZ8Wt8yesjc1cp721De6FLbH5M2Hcm7fwInVmVJ79YFzUiGQP7cTyFEh1s8vQ0A78F5hR8YgH6SUQFT4O5r1No/GXJSHnnEeS8hQATT5BCDTSbpnplgdP8gMAZRHZpGWSSkMFvF+xsEx+ahISKRggH+WkyMRbt8L+trDN50XuV5fjsVPL7rg6wzWj4sr/Y36x9gefW9dnvh204SDiFlyP0Z+PKuMFiX11lSzED3rGsEYnHO03ylkCuenRtNfaziny4xkwON7Yrh5AQgXGCf9NiimuZGRj9liT42llzhj2TG5fvuzkVKy5jcsJUMRFCr81zm8dn333uNnfoz6BLmME1xCOBgG+fZJigVYpjGx3lqQap9cXoBpbp9vHJrz1Opya4pErvMJklLAWbHXS+aR9qYI5z+xMNvFbHczIQ/RCRIVGaW0vKKW0OkianCia6Q0EFZWhWXzWd8DXlA86Pyt5C42Lsu/liQJOTNcR5VPxMWoiS3wl2vutwL01lX6hlRKrovTVZShnQezKTvylS4+Nhnpc2WbhuQcpBviUJPvnmP9sOkq6b/5R/dMBzZn3hcrq9DkRsc2Yyk30oTN48vgD0OeAeJNAfEOhoyvoBCiBmq/2z6OT93gJp59vB735KzTQ2/luiefH2yTSQSOumqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(91956017)(6916009)(66574015)(33656002)(38070700005)(86362001)(99936003)(316002)(558084003)(6512007)(122000001)(38100700002)(83380400001)(82960400001)(2616005)(66556008)(76116006)(66946007)(66446008)(64756008)(26005)(186003)(66476007)(508600001)(5660300002)(71200400001)(8936002)(6486002)(36756003)(6506007)(200143007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHYvOTdQbE1oL2k4aGsrVjZUc013UVZnVWZ4VjRCTWlhNHdQd2U1cWhoRklU?=
 =?utf-8?B?NUQ5Ni9WU2hkMlNTSzBNMmtOaE5xZEhWSHNxOXFIOFNxT2xrOUU1K0tlYjV6?=
 =?utf-8?B?MEQ3blF2WGNUWUl3dU5uN2VkdnJ4eUxGbHRtZWlBUDdZbk8xb1daMFd3OWI4?=
 =?utf-8?B?bW5xMGFTZkxZZTlnTjF2S0tCOTJIVkswU2hsTGtPY3NhSVp1SGN2KzluUUEw?=
 =?utf-8?B?TmRBSTh5S2xtdlJCTlYzMklXZUxkclR2UUFJYUdaQ3U3U29ZblRIQURrZlZi?=
 =?utf-8?B?QVp1bktDNUcxWmgxcVNSUER2ZnBmVUVCbWUvZ3c4Z09Dd0dOSTlKajZoWjg5?=
 =?utf-8?B?VTZzT01ZbjQ2UmpjamUzVTdVeEczald5cGdrS1dQVldrOXdlbFVWSEsxdjlV?=
 =?utf-8?B?T3h4TEhMZEZ6a3BtaXMvQ3llVW11N3VkQXFiNDVObFF3ZWUybnRHVjZLRFdS?=
 =?utf-8?B?cFEweUE2Y05nWnlkYWVTV2pUOG85dzhiNFpURWRmQ2tubGIwY1N0NGVVVExR?=
 =?utf-8?B?eGVRYk9CRVRjU1kyMXh2NS92eVB0bUttbzc3ZWVJU2tOY2pxOU95ak4xbjgx?=
 =?utf-8?B?NmZQaHNhczNVbkt2R3dGalVjMStRUUUvWUxXNjByZkx5OGV3dDZXS1Y1a29j?=
 =?utf-8?B?NFA2NmdlQTRHUlhreGpCUlE3VVljM2NUbXQydnM2VlNXMjJENWVScWcrL3NT?=
 =?utf-8?B?Q3lnWm5GeGhlUVpVUWwzV3pGcnVHa3RrVHJmVGdsMmJDNEJxUUZMaWFXeGxV?=
 =?utf-8?B?cDZ1Qk4zbXM0Qkh1emNhT3J6cmVldksrN1FLQnA0ejlOS3FSM29iTTNQWEdQ?=
 =?utf-8?B?djROMEl5SEpERTd6WGJVUFpIdmNmTjR5SGpTR3VMWXNaRTdGdVkwcDRKZzg3?=
 =?utf-8?B?Wkh1b3dyNGIzZ1c4dTFuRWJVS1FDNmZab3dwYjBpb0VhWWxGQkxneHh6a3oz?=
 =?utf-8?B?SUNKNURUQVdhOWxCNjB6UTVXRUI2NzE5TmlvbEFualdEbnpYNEFKeXExVDBr?=
 =?utf-8?B?TlNOVGZxbFQwVENwOGw3cmNGTmRLUUJuMk9vZ2F6M2xha1A4eGw3cEJBSTls?=
 =?utf-8?B?MzJVTjQ0c3FBOGNQZHVtOWJ0UjU1TmtxdXQwTGZBS2NlR1ZVQ205SDgxcVg2?=
 =?utf-8?B?NzFSbnp6QzVYR2JWQ1RhcHQ3ZDJtRU1aOUtUenlkZTF4N0MweFl1WWtYM2hX?=
 =?utf-8?B?MXNpOGJDSWNXV2ZJWDZ1WnJvVmhpQVlPdEZVc0JmTVlSZmVob1V4cWdYbEU2?=
 =?utf-8?B?eTVheG95RFV1bTE2Q254QXZZL1czaTM1K0duUWZoeUg5aEFJak9iWmNWSU1Y?=
 =?utf-8?B?djFXUVlTQlhUV2FIcGxsK2ZUZHdtUEY1QzNSU2dDVm41aDc0blAxTTJINno4?=
 =?utf-8?B?cE9nOUF4QS9rRGFyeTF3eTROcmcyTDJsNzZ0NDFMVDg2ZXQzVm1IZGVuWG5G?=
 =?utf-8?B?cnFtWm1SeElteE9nSytsbThxR29kNDFkK0ZaVUVlNlp2WXZwQTg2QzNiM0NP?=
 =?utf-8?B?Y2UzTlIzdVVIVS84SXozZEpoUlBld2RDbTRnN3FQRFZEY0g2S1FjcHFmVy9k?=
 =?utf-8?B?Wnl6ZnFIcUx2eDlLWkdKUjJGSEVLcll0SmFnRFhBbE5nYkFZQzhBMis3dUt3?=
 =?utf-8?B?TXNSbGJXdldGTUFiM0VYL0h3Unk3MGQzNCtGNSt1UDdibGFCVCtVM05OYUp6?=
 =?utf-8?B?Tzh0ZFVUbSs4ODBtRk5CdVZ6ZjlweVFzdEVLUVRrVm9wQ1hFcFduTTBlOUJx?=
 =?utf-8?B?WnY0VnBRWGhKTThJUTY0TzFTTGFxTlhlRi9PMEpUc2FrMG9vYXdXSyt2WFFv?=
 =?utf-8?B?KzM3RGVjZXYxWkh2UGMzVlBDVXpzK2Y4a2RvTkZSQkVZdkRVVjc1aXVxNVNJ?=
 =?utf-8?B?S3VIOEoyWDFMMEVvV1JNNjlRN1JsNkFwcnk2Mk5QZmVpU2ZJMXZ3QWpYb0Fh?=
 =?utf-8?B?cGtQMVdFQlN6Ni82c2FkRmFCVWpZK1lid0FJMGQwendTbnVCUUlPbSswNGtp?=
 =?utf-8?B?MXlETG81UGExRUlLTzVSQVUwQ0JRRzNXZk5sNWZqQzc1YnFqcHo1OVpTWGxa?=
 =?utf-8?B?dnFOdnhsczNDNXl1NUNXdHBQSlJzWStDZU5UWWZTQXNVU2FBejNwUnliN2VI?=
 =?utf-8?B?eEd0dUVrM0dlNjE3M0FJS2Y0T2tMelovR2p6aVNXb25pOTJXU3pvSFB3YzdX?=
 =?utf-8?B?bjUyd2w0TkFxTXBjeEpCeDVLcjd5QnFmYjBIbmw5cXFvQ2dYMEw0T0xEbXho?=
 =?utf-8?B?MDlWMUJJM1M4NVdoMmNhU2E2bEY4QjhJYlVwaG9TMmNBaEFrVEd1d0hybkg4?=
 =?utf-8?B?SW1lRFBoRWhaR1A0a2hMZ0RxcERPSFdLUW13eHFmQW01WVk2cEdSenVTNGpr?=
 =?utf-8?Q?aaVVX0Qw5nMoTilo=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A4E434A6-7A7C-4722-9D37-F034685ACC78";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f145b23-be89-4a26-4ed5-08da1e2e6c49
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 15:49:55.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LptqeFsEN6kourH81jYlC+UJOYtAKHjNJgs+51avpBW930Ny9vm1lvPMmCbg+/1QI0+0qP+tSlX9qg9y6jnFOtBukKQCsnbecyp/HUEQe8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5033
X-OriginatorOrg: citrix.com

--Apple-Mail=_A4E434A6-7A7C-4722-9D37-F034685ACC78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I=E2=80=99m pretty sure www-archive.xenproject.org is at least N-2 for =
websites; last updated nearly 9 years ago.  As far as I can tell =
there=E2=80=99s nothing terribly interesting stored on the site itself.  =
I=E2=80=99m going to pursue deleting it within 4 weeks unless someone =
objects.

 -George



--Apple-Mail=_A4E434A6-7A7C-4722-9D37-F034685ACC78
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJYQqIACgkQshXHp8eE
G+3FYwf/blNC6aoYQrBGcxE+UKaLKg9bmP8/wuMeV7iylMwCLd+C6pnwzKdPuA81
uZXC9FZR8/CB8ZuorfVYUlYGobKj/21gotZrOEJR10mseq/YhrwVOZoiTQcAO4l9
8mt79exa7qA+uOlYu2yLCr5j9tmucc9wypBcw3QOxi32XxyLZAPjTFe68M1B2cSy
Taq/4eBCw15xY4GDXVDe9f1QYKrBQMzpP/uA6W2xJHi+NYFrzIQOlKbJXSsjPCOo
NNt52E0lkEhlLkxdTjJ+FlaSUhismh2DSVWELTMiWdlnUL17TaQVICTP5vKUBdTI
hCy0lDORiOAQ4Qab47/d17FnV6ha0A==
=ijfN
-----END PGP SIGNATURE-----

--Apple-Mail=_A4E434A6-7A7C-4722-9D37-F034685ACC78--

