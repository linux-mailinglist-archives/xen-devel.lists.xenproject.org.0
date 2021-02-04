Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1767830F13C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81235.149734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cFQ-0008N0-Ry; Thu, 04 Feb 2021 10:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81235.149734; Thu, 04 Feb 2021 10:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cFQ-0008MW-Nd; Thu, 04 Feb 2021 10:52:28 +0000
Received: by outflank-mailman (input) for mailman id 81235;
 Thu, 04 Feb 2021 10:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jl0U=HG=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1l7cFO-0008Lq-LK
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:52:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1834f8bb-4c26-4d96-871b-c44142cb3259;
 Thu, 04 Feb 2021 10:52:20 +0000 (UTC)
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
X-Inumbo-ID: 1834f8bb-4c26-4d96-871b-c44142cb3259
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612435940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w+eSnEMZo+Fvr7EATVEwt8D2LR7sG6sRWlxkuonUlFs=;
  b=RTxFBqfuCTp7t87uUuB+E3eZrnbA4xhvWAox+oI2V8whcEuvD5K7CY0f
   cWvnnpAIwi1xYLfi8N1CMv5CPV2a9rI10Jytr6LL9Q+3JfjEKfKvPWUac
   gEDwOan0R56BLC9o6dRnzwn1EVf3M+o37OeRubUMPFBG7lIWNsi87AJ0b
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: z8kux/NTAjLe3PbkGtlgiZpHKHsQnmzUYSocFiR2sqeaFd42IAgBV0mnPvu3tQwtijhfpiBw7/
 zes75GM8pC9k86PGqewIWn5Z6ZoCJo/gSd7m6kgHzq7qixhU/WoBm0CfvsuAjlsr0KXMpOH15k
 9EzyaiEuXNDh+oxJAEngNdDLguIcKnwVph/B/bE4o0U9D1pyRhLz+I2VAE4EuF4YYXDLIZGDvW
 98bshymUiJA1k9pw7RJvk7woPqaiduGPQu4RNTXXjshG4v79vFc5p5w/OHMvOw43Ms/n4U+Xp2
 BOU=
X-SBRS: 5.2
X-MesageID: 36739196
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36739196"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUOTa+jodZ4nkioSn9m9ooZHzzdR8d4ooTnwPNwIIfWcCXPQODp3gRXh5zZ8d0Lj0Z0NJcUOmC+HB72uhjHx0DtDZkQDXSr6mYDt9LX15FdRsnR8/o4J3Gjw7SV7pptT8gGjiml0O7mZYairLX9XgCjp+xmvqadiEvWP7McypXrpbHRspPNdNpXLUC9ZWdPsteBHlxrIe8MklFkE+PXrGx5RvRvAiVBprzC9bvtYUy5QE99kIb0F+z9nG2mybmdsOMGpswmSS1lcOVUUBSKrxH62vZa91Gd67iPiItEFbuuSkM1eFQtn4EEBzXAbs7SPDurrJIbNd4T0TGQk17gKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnYF5xPRmcA32qmT+a3lNmLeTEAOuYmt9qGvzr5Q8ss=;
 b=L2V9STWyYb2zVff5heyZ2ZC+Fyl1bk5HlZJtc/cUrYDeU8nXBup/28CUqHbYYDec8mMBu7YzQPEqYuVIZ0ZNRTdj0b+G5P6del9tNctPmHNkN3Dp2Ac83BGiOSuN1L587gvNrdzMALSdPglQOFcVo3+XxRZBjYD3P2Rav145S+QcIO9z2mT4W4Q4vFCFxlpp2B/H1Mzm4sy3JVwsEAlXNrDdbTNTMEj8SIWNLZmv/FVOnw3OXinIyzwLQSfGGA79jhWGjGICN+y+IYeHaqlHBk9WscFj18Q+iEldA/c+LG4KsZg8rEfahxPIB1ZQT72S2aPtVGIXGuauHFqmAVOeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnYF5xPRmcA32qmT+a3lNmLeTEAOuYmt9qGvzr5Q8ss=;
 b=GtTnUHa5DfEDfidpk+lWTHDz93BZYGxJfDnyjRiQKS51IS0eIKFgjJ9FWpj2+1Mk4lw+STEsZmEgeIASz4lECal9tPxiNT69oF1b2JH8IdZMTstcL+uFFWO1fwhB/RQ8cxaAH1ClgtI2IAEZJU15MpCJU57X9+3tf3+/F2+wCLY=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Edwin Torok <edvin.torok@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] tools/oxenstored: mkdir conflicts were sometimes
 missed
Thread-Topic: [PATCH 3/3] tools/oxenstored: mkdir conflicts were sometimes
 missed
Thread-Index: AQHW+lMOM4p+9lOZ8UOKE5A9Zry5AKpH0usa
Date: Thu, 4 Feb 2021 10:52:13 +0000
Message-ID: <MWHPR03MB244589C19C6055D7635A34D3F6B39@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>,<20210203173549.21159-4-andrew.cooper3@citrix.com>
In-Reply-To: <20210203173549.21159-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c42bfd20-e674-4386-1235-08d8c8faede2
x-ms-traffictypediagnostic: MWHPR03MB3278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB327863FE8A6ADBA64A90D59AF6B39@MWHPR03MB3278.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MICMyx8k8R9a8ZzKzPbE4yCqOe/WvWHHJVFC7qIesVmUSavg5M14EA5QPhkFITcr7F/zXZ+/BSQHF1qVqgeuTxs1mQ2cm8b7OP7e4M6Q9gT+kfR8DkjNkWEBHb421z7K3gMU2PTbc5NSaWwBPLYNii6DomyAOfsqCwBYNzVodHp2TVW5jSQBK2WA0UTI8EuEQx1e0ToRLYOKn/kebrJONmXPzjRXg8/UpN3tp9XkScUYCJStujsGHRLLNA1ktRuUNE2O8D6+xpMIKl4VBwCCYCroK4SDB646yQZtBrZoHbds/MW90LRZMJzXttGw1P4R4sjEAcD9imdanf6rPYL76riVsgcSwG0o6ghuoIZly/A99bkIP5AccLJF3MxPsYKzVEVMZVHUoGi/oWKErXuvZxFXB5m3qQ1QsziPmRM3tLcAPfnr7pwHyYJto8qSZYH7ydmk6j4kXKjtGsB6kcBryjI9gkxs0x26y+7h/LPyXYaxKFgkRTuxUTWhEgUlGghx48iQHwevzPtmbudWWi3uDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(2906002)(9686003)(71200400001)(52536014)(44832011)(33656002)(54906003)(5660300002)(110136005)(26005)(6506007)(53546011)(66946007)(7696005)(66476007)(8936002)(66556008)(66446008)(64756008)(91956017)(76116006)(83380400001)(8676002)(478600001)(86362001)(55016002)(66574015)(186003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?5DqU0ya7Y4Hb0UBRuSs6S1x6EY1BYkiCfcstcikoNO9jYb2Y/zk2l6e8f6?=
 =?iso-8859-1?Q?cBZj2xvwjAxemDtQNbX0ovc341A+E9y3T8d/l4PG2G8XLYty/oh7Bt8GZZ?=
 =?iso-8859-1?Q?PSvASl9QI88e1uaDx94tCP6lN2FVEfWZMUMyDlDQawoUUvyPFqWVfp4Dge?=
 =?iso-8859-1?Q?+4gHatTcka7hP4P+lGvOWFO0bFhwABpwGTZp2lEtj8mYxitJhAm7IA6Afe?=
 =?iso-8859-1?Q?aLVun1udoGp4gG55hoxNQakbarVQVNlfqs8jcnPaq7fi7xl5frJhWbgpf8?=
 =?iso-8859-1?Q?j8i9wDiMLXuucXZMoRDKy5e3mzZ6IbQ0O0hTJhQFB8pU9NtqmwEYTzYmAi?=
 =?iso-8859-1?Q?z0gOX6ng5Pb4m2g/NdrKkV148c6exyHpnWq/z6Ov6oAx3jEj8HAtXER/3y?=
 =?iso-8859-1?Q?VNAnJPhGHLtVBUyK+vBPhfMTO09ce4Xeib1QiLfpFZfqXPvZWFbqYt3ygM?=
 =?iso-8859-1?Q?0S+iMVidPYjvCfc3FIISpbRKftjtRbHHeW245F1zgne97q3ssn+w+dea8W?=
 =?iso-8859-1?Q?e2h2ZMPAYdAVo2fYM6+vY9HfcnIpdXMzNj2f3PHOcxuQA4Jtyh7F8kQgVD?=
 =?iso-8859-1?Q?asWkK4akZAp+diATsAIX/P2R+wTJSk1mwZVESTOUcTddPDG5Uoy9wSjDlb?=
 =?iso-8859-1?Q?h0eEGjLBn0DPObUW0s3f8+DhbhjUrgcQicWBazJLfcQmynh2oUeveFrqph?=
 =?iso-8859-1?Q?K/uCm6j9VI9T2S9kK3A1pXFMz7CCqOy3BQ4CCJXLZcyIh85A+ogaXzF/jQ?=
 =?iso-8859-1?Q?gmkEw+OZPjoJwpmjaf/IRB6X0e/Oh9VD1O6iW7RPubnK2RmlZxcyVCaMsA?=
 =?iso-8859-1?Q?iVtbEAPTK8BhcTepnLO8MthnriU/HvvTwcpWvCOZrlR2Zr+HH5b3TAv7cC?=
 =?iso-8859-1?Q?6GrDH73gvfOiDFFVc1/1cYtrCIA6JDEC6gg+7K3JNvVF9MYc7AJy2/yV13?=
 =?iso-8859-1?Q?gL0W9kpyskdjlQ9APTGmdjtJNH2uiQi0F9tstp4eDIrVACihBzDyvy/zkK?=
 =?iso-8859-1?Q?Yolj/pm5bnj6MxrJyE9rsPmBoEh8jCwTKtEUL1UhnJrEtBJpXAhB1tFFrP?=
 =?iso-8859-1?Q?bOgjbwVUmmYaPHXLN2/AAblzWrtcMovtxuYarbfI2xex?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42bfd20-e674-4386-1235-08d8c8faede2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 10:52:13.0225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40cvniULwi4NGqfg75XxFaoFKV1BS6ZX5risj1mV1KLhftgZr7EBQSS9Q8NbfzUVuzWXQTX4wNzrXh0Q9xMvcfL+V46zzoffZN0eZ57H/ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3278
X-OriginatorOrg: citrix.com

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Andrew Cooper <andrew.cooper3@citrix.com>
Sent: 03 February 2021 17:35
To: Xen-devel
Cc: Edwin Torok; Christian Lindig; Ian Jackson; Wei Liu
Subject: [PATCH 3/3] tools/oxenstored: mkdir conflicts were sometimes misse=
d

From: Edwin T=F6r=F6k <edvin.torok@citrix.com>

Due to how set_write_lowpath was used here it didn't detect create/delete
conflicts.  When we create an entry we must mark our parent as modified
(this is what creating a new node via write does).

Otherwise we can have 2 transactions one creating, and another deleting a n=
ode
both succeeding depending on timing.  Or one transaction reading an entry,
concluding it doesn't exist, do some other work based on that information a=
nd
successfully commit even if another transaction creates the node via mkdir
meanwhile.

Signed-off-by: Edwin T=F6r=F6k <edvin.torok@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/ocaml/xenstored/transaction.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/transaction.ml b/tools/ocaml/xenstored/t=
ransaction.ml
index 25bc8c3b4a..17b1bdf2ea 100644
--- a/tools/ocaml/xenstored/transaction.ml
+++ b/tools/ocaml/xenstored/transaction.ml
@@ -165,7 +165,7 @@ let write t perm path value =3D

 let mkdir ?(with_watch=3Dtrue) t perm path =3D
        Store.mkdir t.store perm path;
-       set_write_lowpath t path;
+       set_write_lowpath t (Store.Path.get_parent path);
        if with_watch then
                add_wop t Xenbus.Xb.Op.Mkdir path

--
2.11.0


