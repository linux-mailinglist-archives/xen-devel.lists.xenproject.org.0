Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07A4BBC5F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 16:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275563.471493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL5Ri-0002Rq-Py; Fri, 18 Feb 2022 15:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275563.471493; Fri, 18 Feb 2022 15:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL5Ri-0002Pp-Ms; Fri, 18 Feb 2022 15:45:22 +0000
Received: by outflank-mailman (input) for mailman id 275563;
 Fri, 18 Feb 2022 15:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL5Rg-0002Pj-Q5
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 15:45:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4bb2792-90d1-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 16:45:18 +0100 (CET)
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
X-Inumbo-ID: c4bb2792-90d1-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645199118;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WKNIonxcahKNHrmTDcEKSy7WRj7ghI/H77ZzKPmKQEo=;
  b=e+0fGZNzqQj4A2se4dTf2W49oM2GEaA3hjOrey+2xvPvNOY/n7ag3Kn+
   H9rVwRG+w3LZJxoaqMmsre3gUWJPYVkGlJ/38gY8f9mZ9loW0ANfoXDF/
   yWyKzA56/gMXZgpBdaPyqKeZ83C5NA5jQorBa4mvez2om1SXFevCyk6mE
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 63966704
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cd4gz6t8cD6bKVl+nlEhWkMg++fnVJteMUV32f8akzHdYApBsoF/q
 tZmKTqEOarZMDP2L90kPNyz/E5Vu5XRydNiSQVuqXw2FyoU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nU6
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8rHpTiuOQlciAALCR8OY1EpbT5HFKG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQ0PUqePEUTUrsRIK89mt6HpH/RSmNBqU+ZrKcroFHL/hMkhdABN/KKI4fXFK25hH2wp
 H/C/mn/KgEXMpqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhTGSAAY1LVcjXHc7SAkBw9u+q78OpCuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqT1sQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJq2XFF52LJ9k4DNRCyKFBa5dsldjBO
 hK7hO+pzMUPVEZGl5NfbYOrENgNxqP9D9njXf28RoMQPsUoLlPfrX0wPBT4M4XRfK4EyPBX1
 XCzK5vEMJrnIf4/kGreqxk1itfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2JOAn86MfbNzNsJIso990ijvryTp
 S/Vt44x4AeXuEAr3i3QNCg4Meu3BcwXQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN0211gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:NJZt7K3YFZdzeQANZ3kZfQqjBRRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5expOMG7MBfhHQYc2/hRAV7QZniYhILOFvAj0WKC+UyvJ8SazI9gPM
 hbAtBD4bHLfDpHZIPBkXSF+rUbsZq6GcKT9JzjJh5WJGkAAcwBnmRE40SgYzdLrWF9dMcE/f
 Gnl616Tk+bCA0qh7OAdx84tob41rj2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpJmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF5d1HqWxa1O
 UkkS1Qefib2EmhJ11dZiGdgzUI5QxerEMKD2Xo2kcL7/aJHg7SQPAx+76xOiGpmnbI+usMjJ
 6jlljpxKa+R3n77VTAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdo99Q/Bmcsa+d
 NVfYvhDTdtACSnRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtZ5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdA15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAX23G4gMy0eFPGC1z3dLkeqbrXnxxEOLyoZx
 +aAuMjP8Pe
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="63966704"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw3d3d/u/V+J+pE+t+IpiC9VXT0G7AsWxoNxKdYUTmDgEsEiUKfU7bdY9vcrOPom3kd4fqRcT53pHGwPqPh37RKtW+2SLAgQ3a4i/re9pwFBnexb38b/Ob+zxg5ntvMPlCaTc9oCeBPiymkEuo8Ps/GJ4OJMbcn0VWm5MXVGerT7HSkjBWmA2pfAPPn4bsuwA61Xmtjc0Y+q7ELJ7hKApnd8Gp7yJfcOGuzm10L+r1ie8KYdIqmu8R4Vu67oXAF2C9/9cnS1ttEI5onpDraTWFHEpIDLVNTleaMDvzZM4AjLhVuyn5a1W9YJBTVHXmgUZ1Bn7PbjritdzMO1TucHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKNIonxcahKNHrmTDcEKSy7WRj7ghI/H77ZzKPmKQEo=;
 b=iOGxMWB3//CzdZOxTrhD7uIC+HLcbp+DApr2qvs6VYIcp7ij7LYE8xlUonIJnAs0wSdgEnGSouMQLbHPagw6JTVe3EuZSnTrcfdnyMcB0gtLVb5W8TH5dCeBNRPxiT92vzrwK6zGX96d/YmGYI8Fo8+unbwsQttZVaG/0lRXJFEo8UpVdNXGDhrOopYJC/r7joIAM4VxkXnRwknp1CNk1tsy4KW0vtfW3Yv0vJ8YpTIsrR2eow7eUA5hGVNlmckc05D8KKjYnbk1y+ChuOLnH52+DlD/Avt8eQJqy5KjMy+j+Q6D8UP239Y94wrCL2laslSEWEGcL+0XnN4X/5AjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKNIonxcahKNHrmTDcEKSy7WRj7ghI/H77ZzKPmKQEo=;
 b=D8O+SA5ghp0nvTJ5eYCYvSDKJiBph2QTu/2GuG13Q0oJE8IACc8ZTUQfvhujXBeBgeFd6rDP3HBSmHSZ+QNOWFR0o9+2yXUHPhKTe79MbtBNp8FrAJTrTk1JwDPy/NyM9J056Y+Z41lpclCS9pblsaSzDt9X6i7a7dXPCoyeiz4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 0/3] retpoline: add clang support + Kconfig selectable
Thread-Topic: [PATCH v3 0/3] retpoline: add clang support + Kconfig selectable
Thread-Index: AQHYJNSfcDAKqGNVbkqTBpzLddC15ayZc12A
Date: Fri, 18 Feb 2022 15:45:12 +0000
Message-ID: <9500afea-3ca0-deb9-9d48-4983454b1c4f@citrix.com>
References: <20220218143416.34475-1-roger.pau@citrix.com>
In-Reply-To: <20220218143416.34475-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a879f4e9-fd03-4363-a93a-08d9f2f5a67b
x-ms-traffictypediagnostic: PH0PR03MB6478:EE_
x-microsoft-antispam-prvs: <PH0PR03MB6478B38562FDC1499E9144BCBA379@PH0PR03MB6478.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m7K2WfhS4E6WSG+G+5BwPKQgoWH1GkBEvEPZH6Kxw8w6mQ59iG4/jL+kJf7ON0NZ/lnOxWnv1SPfA2oq33w/jg5dhnRSbbwL8r+TPqpM4+pFv8CV9q4Ae8k76UtD5yhreXzmRAUKBWB5yhSr/5k/2No7HwbJKTT8Yn8FA1/JwGig/ZsgnU29kumvJh4Uqbz7FdkhebJkRFrfriD4GU5L/nOXtG/MNv/E6Tz9u6925p+oBZVPA+tjwYSZc3AXZKto1s8IG3SEpMzN13cteWA2Jsuo3Rjhltv8xdYjBDwxuLWzJUMHsG8XsZ2dmElNwGa423btG2Srh0DMgmZSmHYNuMJaGs/FM/+nKyzpGe8dEl8MOoUWdmGaO1PkQWRwa1o+mr/knyr+lAPcNMk+OgjzOKPJq7fi/+buVrtTFYj//8cgNhKCuZYIPjAeRtzFp+5UAT1O95JsUslGDomP/gpSXkgYzZlNLRJz2YoNGv4MXgmt0KNiN55Ke1PAWHToWL4pE/SYVc5xLdUqfaH7Bkt8y/65C0hmwcMkI3P3av/2QhR3zgyecJaeZaePC/Hi2fRBUg9Jw1z4gbWrPFHy36H9Q70SzAFn8jg2Q6HKvrVxXGpNqBjpDj0FkLfeCbztDLKs6mACAQpYGu/6XfcNHVQHyTl8A56BrDP3ogetW7OYxKlU6lknwwr8AxUS27i3GViQeL5+ydST+mpjBfDzAlEYwqJVKGJmiEsCKjcmM9A1smc4Hw0SA3VSv2Id1Chd0t4QJg2K/v12Yab1TLnSwv/ySA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(4326008)(8676002)(38100700002)(8936002)(66946007)(4744005)(64756008)(76116006)(66476007)(66556008)(66446008)(71200400001)(2616005)(186003)(26005)(31686004)(36756003)(53546011)(508600001)(6506007)(6512007)(38070700005)(86362001)(82960400001)(31696002)(6486002)(110136005)(5660300002)(91956017)(54906003)(122000001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGdUaUd3RDlaZURYS3gwbkxpYlZicFVmN0pHK1N4K2ZSdzVTRXZPb0pnc3lI?=
 =?utf-8?B?YzFQUWpmUEVXc2ZKMFd1K3RhWW5HUExxUHlYanNFcTdXLzJhL2IxNHd0N2Fq?=
 =?utf-8?B?Q2VRQ05mdVQ2alNsQnZqUVhWYTlJUjlyMjdIbm56c3UvaXVOenFsWGlQbng2?=
 =?utf-8?B?cWdIRG93N1kxL2hMVzhsMDZTK1hncTJ0U3NjRzZaclB2WlVsOXBhejVMMnFp?=
 =?utf-8?B?RDdtdEEvVXdvUjFUSG1XVjB5WXZXSzVnYVJ3UkJrdGZ5M0EyVmJVZEU0ZlhO?=
 =?utf-8?B?ZVFsZzRIQ2pFYWpsWnlRcCt4cWNKdXZ1bHpwdm50RUJsSnAzaWhCU0Y1Lzlx?=
 =?utf-8?B?MVVTbHZIYzBSSDlvdWdmQkZJMDRYVThNUkVVRXJ3bGYwY2xRMU9EdzhrQndF?=
 =?utf-8?B?VnprcXc3NUZmMEMzaXJ2akU1TGtxTHF4ZElzTXV4MElpdkpiZVdoY3pkMzFC?=
 =?utf-8?B?amhJeStWN3MrVU0zcFluWnRMSFdlbUVCaFlKYmxtb1JKODJSODBBbmROa1NO?=
 =?utf-8?B?VmwvMHAvSkJWOG9aYnRSQkphd2dCU1Z4YTZpYzNRY1ZDVWVIS05iRWtLTytq?=
 =?utf-8?B?MVZzN3UxUHNRUDczWFpJY1BaYURweXFnUTZSQjRUZTFYSi94T1hJK25NZDAy?=
 =?utf-8?B?RVBMZkdPd1JrRjBLcTNScDJiQVFVaWZoOERBUnJvSVZDT25tWTdySElzUlcy?=
 =?utf-8?B?dkx1YjhucnVKUEI3VmZPOUp4NUEzbnVmMXRBbE45TVhUYUdXN2FMN1RXSTVP?=
 =?utf-8?B?czJ0TFQ1eWRMOGZPbEh1WUc3TU9YZ3lLa0JNZldnS2dPYTB6RjgyOG1ZWjRM?=
 =?utf-8?B?WG9Xb0VLZFJpL3lHa056QUZsOFE0M1luaEtmdWRxMVpTMG80UFRZVDJUM1BS?=
 =?utf-8?B?OVhZR0hjZngvaVl4TXRjZit0VWYrQnZrMVA3M0o5RlZzSzhtVXNiL1dydmNv?=
 =?utf-8?B?QWxNZk14VDdDWlVoVTcvZXFhd0N6cDdqdmVuNnZVUEk0SGFoRE9tdVphUkIv?=
 =?utf-8?B?MmtxRDZYeEQ0Tkx0dGFia3o5SWpIQ3dGdXd5U3NSSnhtaUh5aGRYTnZPM2gr?=
 =?utf-8?B?OTZWMmh3U25USnBWTDBvZVdXMlAzaWNBNHd1MWVjcHBDOTdrbjBQS0dDWVZh?=
 =?utf-8?B?UnQrTHhPeUhQRnlTNkpzbXI2djh2Uy81WmdhQWxsSnRlMmhoZHhnQmlCODha?=
 =?utf-8?B?SzV2N1MvOFhFN3BUZFdlN0pvd0ZmcGJXTnpUL2Nxdyt5UUJISmRDZzVzdVZ0?=
 =?utf-8?B?aWZ2VUVPQnJuODJGeEFqdlhiS2t0NHlaZC9EajhseG9QNStVOUFid2lHVERp?=
 =?utf-8?B?UHZ6YitLaE1WWnVDWmZOeWJkRDloUGs0NnVqdUMxWndMUUszdTAvaVFvY1ps?=
 =?utf-8?B?cFlLcTBTMnZ4N2hUcXRFdFRRVG1kWnFpVDRLSS9uRHJCQ2NnZkdzTmo4U05V?=
 =?utf-8?B?eVljZzBvU3FvRWI0NWkweHRzOXE3K0JRdnZ5K2svU2toOXllbVRFYXQyTnI5?=
 =?utf-8?B?ZnRFQ1RhWHFzSWNXclNueThCOVVNWk5IaDlmdmViZDh5YnNYVHlZa0U0ei92?=
 =?utf-8?B?Wk9nMk5Td2pneHZWRmF5OURIeFBaeDdHODgxYUErc1JFakh4MEpLUm16Q0ha?=
 =?utf-8?B?VEZJSFVNWWhOWFVVQ1h1MFYvcC8weWN1bkNra3BRWmNsdmVjWHRIWEVtQWYy?=
 =?utf-8?B?emwveElieGptQjgrY2ZHQ2d3VjhiZk5ja1U0UnVMU3FDL1hrL1JiUG1rYlJx?=
 =?utf-8?B?OHpMUjVrYm53ZE5UVGF5WEpwSWdVejB6eENjMFdsWkVOOHZQZUVUWmdaTDVJ?=
 =?utf-8?B?eFdkVXVYRVNscGhrMm52ZFl5Y1gvdXBUeEQvSzduVVFTVy9GOFlyUnRLaUtz?=
 =?utf-8?B?UElmOUpZeWJIaGxWUXAxMzJaZjZERGR6UDJoMGVYVFNMUG1ZQlI2SGs1aFB0?=
 =?utf-8?B?c0wxWXpjeHk1czJ4b0VJS3FDcGRXc3lGc3k2MkRrVGozS1Q5WmdXK0NOTUJJ?=
 =?utf-8?B?ekRYaVdSbktLSWRBNmJZVlpENjgxMVNVZ0JrK2F6MjFJMDJZbDZBQ3V4d290?=
 =?utf-8?B?NGl5bGJDU3lYVGhzaDZ5Tjl1c0xkUjNZdmxtZ2JlemdnY0hReXNWaHRZMEZZ?=
 =?utf-8?B?VXRFWFR1VGVnUlRtdXJrMXpKTllsUDdTeFd6QmxlR1NKVnV2bDAvdExpUUN0?=
 =?utf-8?B?N2JTMVorWHkzTDk2djd6aHBVbVhyNGpxMzF4eDJwZXFKUWx3d3VNUkxkc05V?=
 =?utf-8?B?WTMyRDgyb2xMdkZkMWdtc0Rnc3pBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF285C9EB2CE9C489D5A55CAF4635634@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a879f4e9-fd03-4363-a93a-08d9f2f5a67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 15:45:12.2886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EG5Y/7stXaCoATTgztkH8xxTezY62KZd+2325EN/95uD9f8lixpBXf8KqY5OvgUBig0+y205AAjVwcCRoKrrzLjxtg4UbwOoaYj0RvTDk4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6478
X-OriginatorOrg: citrix.com

T24gMTgvMDIvMjAyMiAxNDozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBIZWxsbywNCj4N
Cj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgYWRkcyByZXRwb2xpbmUgc3VwcG9ydCBmb3IgY2xhbmcg
YnVpbGRzLCBhbmQgYWxzbw0KPiBhbGxvd3MgdGhlIHVzZXIgdG8gc2VsZWN0IHdoZXRoZXIgdG8g
ZW5hYmxlIHJldHBvbGluZSBzdXBwb3J0IGF0IGJ1aWxkDQo+IHRpbWUgdmlhIGEgbmV3IEtjb25m
aWcgb3B0aW9uLg0KPg0KPiBJJ3ZlIHRyaWVkIGFkZGluZyBhIHN1aXRhYmxlIGRlc2NyaXB0aW9u
IHRvIHRoZSBLY29uZmlnIG9wdGlvbiwgYnV0IEknbQ0KPiBzdXJlIHRoZXJlJ3Mgcm9vbSBmb3Ig
aW1wcm92ZW1lbnQuDQo+DQo+IFRoYW5rcywgUm9nZXIuDQo+DQo+IFJvZ2VyIFBhdSBNb25uZSAo
Myk6DQo+ICAgeDg2L3JldHBvbGluZTogc3BsaXQgcmV0cG9saW5lIGNvbXBpbGVyIHN1cHBvcnQg
aW50byBzZXBhcmF0ZSBvcHRpb24NCj4gICB4ODYvY2xhbmc6IGFkZCByZXRwb2xpbmUgc3VwcG9y
dA0KPiAgIHg4Ni9LY29uZmlnOiBpbnRyb2R1Y2Ugb3B0aW9uIHRvIHNlbGVjdCByZXRwb2xpbmUg
dXNhZ2UNCg0KVGhhbmtzLsKgIEkgdGhpbmsgdGhhdCdzIGxvb2tpbmcgbXVjaCBiZXR0ZXIgSU1P
Lg0KDQpPbmUgdGhpbmcsIHdlIHdhbnQgQ0NfSEFTXyogZm9yIGNvbnNpc3RlbmN5LsKgIEkgY2Fu
IGZpeCB0aGlzIG9uIGNvbW1pdC4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo=

