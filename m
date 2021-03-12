Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA5338B6B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 12:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97028.184142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfu1-0006EV-9T; Fri, 12 Mar 2021 11:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97028.184142; Fri, 12 Mar 2021 11:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfu1-0006E7-5p; Fri, 12 Mar 2021 11:24:21 +0000
Received: by outflank-mailman (input) for mailman id 97028;
 Fri, 12 Mar 2021 11:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kXEp=IK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lKftz-0006E2-RG
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:24:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c7fe792-0423-4c33-ad23-a4168172364b;
 Fri, 12 Mar 2021 11:24:18 +0000 (UTC)
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
X-Inumbo-ID: 1c7fe792-0423-4c33-ad23-a4168172364b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615548259;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=m9WeZJLH3Jfij/W8i2dxvoR4y00n894swAc1kcs58sU=;
  b=RicV8jI4c5JblQQbWpniTc+vYz79JtEytlXacoN2sMHNruye72WNdhRK
   vK81EUYnsjEUc8tv5PJNsJK3NfGfDyOZfcAQdyIpEVQc9v3jkWzX3xZBc
   v/TTdP4VqOR9agtixbZrQ8FBW9XT+fxmraE0fFJagxXvCYDjPPrnFpMPw
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5doDNDZHwCB8R2ldLcSfpcXl18dNYI11nYz0hsfJQt6KGK55nky27z1YRCNSbZVcuL3N1QCvQR
 6ZEe1kNgcLyCe6qtTYjAruWtogxFebv/Ijr0TWfg/CVPDnHIl2bUEhYU1kq+jCFIFZxtVDZ9TN
 XbLE3Wa11nK817xBpQjJ+fWDH6s9njBlKjjIoHnv91N9zEaJSiaI6kketqM8XIQSCPfMAWCuni
 h87fT4bgPrNRDtacRWBAv9tKm348h52tWYXgOjfdywH1tPdURnY7ymFw/LRDE+PMfdMXfIO5xw
 Gt4=
X-SBRS: 5.2
X-MesageID: 39050134
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:evbN7a2mP0bHd4jTwbYNegqjBRB3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7x6gWgDpIEyN6I7KiniY7lvg9QZCttbLxt6Bo8KivzKDw6eCBtA50lGJ
 2Aou9OoDS9cXoaB/7LfUUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr1sjehlIxqov9n
 WArhzh6syYwruG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYArhJdKaFuFkO0YKSwXILtP
 WJnBs6JcR07BrqDy6IiD/gwRPp3jpry1KK8y7gvVLZrcb0RC03BqN67OozGHq412MasMxhy6
 UO5mqFtvNsfEr9tR7g7NvFXQwCrDvQnVMekPUeh3EacYwSZK45l/15wGppEYwNFC+/1YY/EO
 MGNrC52N9qdzqhHhLkl1gq5ObpcmU4Hx+ATERHkNeSySJqkHdwyFZd7NADn18bnahNBaVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SG1L6D6sKUki96qLf0fEQ3qWHaZYIxJw9lN
 DqS1VDr1M/fEroFImo0IBU9AvOBEGwRy7kxM0bx5URgMy9eJPbdQm4DHw+mcqppPsSRufBXe
 yoBZ5QC/j/aWT0H4JE2BD/RolSJXESXNZ9gKd4Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGDj/Tf8wq3yDazvdulz8Snntckvw8dZbC67B5dUez4ALK8lJuggRglKp+9GTJVR5w+gLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ilVWhLqw8MO0b9aq0CpN2bZGBX0BK8V1xCZvKTND
 Qai0V8+KqxIZDV7zslEcibPmWTiGZWuGiHVI4GmqqI5d7sf5QxCppOYt03KSz7UzhO3Sp6om
 ZKbwEJAnLFHjT1kKO/kdg/H+fEbeRxhw+tPO9ZoX/Srl+nuMkqX3cXNgTeF/K/sEILfX50jk
 c027IDiLCA8AzfU1cXsaAdChlwT0i5RJhBFx+IYY1InKuDQnAMcU66wRqAix8yfWL28V41nW
 KJF1zNRdjCHkddtndE0qzj7VNzcSGHc1htb21h2LcNaljuqzJ91/SGabG01HbUYlwewvsFOD
 WAejcKJBhyrurHnSK9iXKHHXUiyo5GBJ2gMJ0zN7XS0GiqMouGiOUPGOJV5o9sMLnVw5g2eP
 Pafw+eNzXjDew1nwSTu3Y+ISFx7H0pi+nh1hGg7G+22hcEcIzvCUUjQ7EQONeH6Wf4A/6OzZ
 VilNow+fKqLX+ZUK/19YjHKzpYbh/Dq2+/SO8l7ZhSoKIprbN2W53WSyHB2n1L1Ag3Rf2E3H
 82UeB++vTMK4Vvd8sdd2ZC8l0lmM+GIUErvgb1a9VOCW0FnjveJZeE8rDIob0gDgmdvwP2I0
 CY6DAY8PHfXSePvIRqQJ4YMCBTcgw753tj9u/ZKNGVBwWuau1Z/F21dnW6a6RQTaCZGbMW6h
 Z2iuv479O/Zm79wkTXuzA+P6dFt2CgSsm2CBiXGeFJ/8ehUG7895eC8Yq2lnPvVTC/a04Eno
 VLekwbc9RbhlAZ/fwK+zn3Trayv1ksnFRf6yx2j1Lh2oCp52HAAEFNWDep8al+TH1UKXiHjc
 PM7Oie2jD8+VF+qOf+KHs=
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39050134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYZd7GG2i0COZNJp7QndNNSVRjXKqDZRLWT1MExrlHXWYln+LZKqZbeJOeiaxbPFGNh3/V3140gi0TSPl+yW7YTsyc1iWW4auL2fe0NiRX3q9aqUygxfq2AoSySiGFiNUaoqc6DOm5UT5oIBS36P0Fsi4GE0v59kgk5hGM3h3trU6Qo/iQnbWjnih/AkSeZREG4x2i8ZmpJSND1eadLCsfJjuw5Gna8WKMHwhufWosAjEaNH6QWJWVXETs0tVN0Wk9aADpPuo7CZLrBCdrU9PMBtuANWEp5f6jqdhKktH0yfpdsucO+jH+arFeiYFoXEeSZDIMMYE6Tx065BLqPDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9WeZJLH3Jfij/W8i2dxvoR4y00n894swAc1kcs58sU=;
 b=AXbYT19oKxtvp/ff1l05os3ksOf0/6CTYXB7w/wq3KYzdfmZ7bsqO20DGCzuRGGp4KA9AFNf/R+RKwVVtt4hbDyawGGWKM2xvAbBzV3OXr9ziSrx8MEYUPyKEGc5SEI8hIYb3i0BgfeItEH6PAORRf0/iZb1amERXWKX6NQbpiLyec5THqBthDX4NRBTDzjnGoVxIJanhCWe0UUcJoKnpy5w8ninOCtCkkJHdSWsdZDOZWeDj3LiAFsqUgKH02ZtbtVFRCKn6Xltp8TAncE2Fg2gec+rpedUzb67lJ3/WwWvMb8qnRTBjb94m7G1Om9ApaM7EL5AskFCLDN6ITl6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9WeZJLH3Jfij/W8i2dxvoR4y00n894swAc1kcs58sU=;
 b=eoK1TuvsZs/hd+fF2ADLMcR0y7J1AFH/Y5j0kYkVM0mFH+pkGaTN3wh2U1EUgDw3yMZnidG9e2KsaBzFUFO4VFxDNbRm+z7Gop4K/N6OutGSYhqdUnf7kjrhxTW2spgB2JgWsM4N/uq7S7zXJMySxxZgYtOwvGAnZSF9a8lQGds=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: TLA files for XSA-287 and XSA-299
Thread-Topic: TLA files for XSA-287 and XSA-299
Thread-Index: AQHXFzI5g/uR9VaBnk2lG3H9JEKxLg==
Date: Fri, 12 Mar 2021 11:24:10 +0000
Message-ID: <BDA69EAB-2E31-4CB5-9835-5DC4D39FBAF5@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c63322d6-b3aa-402c-eb74-08d8e5495bf8
x-ms-traffictypediagnostic: PH0PR03MB5910:
x-microsoft-antispam-prvs: <PH0PR03MB5910B03D4FA35C189140F2AE996F9@PH0PR03MB5910.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIErHQOKhZUv12P+ph600CaidZXc1hGvqWtq/8U+J1Kg9BtCb/YTShgMzT8Ux5PyLdEhmXSppkKFsuCmHK7voPupMiubDrskz2RcXUHovZv21FnZmkfSgplhneR+hkPnnYiMwS/9vNpjXggaFnIVEPbJEoHgRlEqRIQ2wPMs7DmA3Z8/lGja8hwkd6X5aI24JBoAeVDCas5l4Yhw939xRkSoA8oWJ9Dl3vP8MIgHmz0hEhZz1rAi60+FjQMonkb+BxX3KQybENumDbCvUz3849tPtIRp8IXzvkFc350IGbL69Eyv8Zdpa1bXbHg0z0RIaZogeQk1y0FdeZo0x1rdamx7Sq3gj80jm+YZ8i0ipLUXdlzf1ee4z1gL85VJQL5kjtL65BAX0i/LZjvCef7quf3lrxUFwoHUEHvGaOOi9xXWr2hqILqTnLzIPSyeyQgNtj0eMRo4vaQJ5MjEzGETGXO7mKyS2cGGoOIB3hGUC7ZN5q2xOe/IKx23R+LU4iUc/vTrWBTpYPACaDAlf9FALA18yE3h2xH41BxMWdbrlDSCaPKwYlXN51v2uRe24MyWIgzRAlYRnYR2Za8Npv+YojocjkuSIohIUSgIXr/fpiHpG+NiB1TAZfVyEyvEm8wV8x77jGme1GO9qkKkqmsEYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(4744005)(33656002)(2906002)(5660300002)(66946007)(6512007)(36756003)(66446008)(6916009)(86362001)(71200400001)(8676002)(66556008)(83380400001)(64756008)(6486002)(186003)(66476007)(91956017)(26005)(76116006)(478600001)(966005)(2616005)(8936002)(6506007)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eDRrVmNQSUZldkhsVlJSYkZvTERRNGs0V3BVakk3eW5LbmZYZnA4L05USkMv?=
 =?utf-8?B?cUpWZ3NzRXdqMDVYc2JON2hWbG45YiszcmN4WDQreWtlOXI4WWVNWnY1Q3Nl?=
 =?utf-8?B?SjVJWUEvNFlYZFgvVWVkN1ZKK0prZWc0LzFUeHZ6cUVTb29QUGhBL2JoNUpo?=
 =?utf-8?B?WmdJSEdUc21rMGpkTUl0bXIrZnN2Sk5aZzd3T0h1bDZVZU1MbmhiVGNsTjNx?=
 =?utf-8?B?bVNYNkNMTWxoYnRuSHZjb0IyQmdIMkVFaEVROHIwdHk5OEN6akV6a0pLMWRN?=
 =?utf-8?B?ak95bTdoRE5uMm85NzJCVVRoUjNOQW1iVkQvb3pDdVZtYzgybW5zMWVBaGwz?=
 =?utf-8?B?emt3QlNSMmFDbUtOMjdWTDg2MGZVcHlPTHRXQlptNlArRThma3N6OHF0SXZr?=
 =?utf-8?B?VGtNSURGeDZIZDk2VDdsOTRQekRNZWRHVGc2Y1ZoaVlvaWhucTd5ekQyZDl1?=
 =?utf-8?B?dzY4U3BaTTQ2RWxRbUlXMVBCL3pPcUlLeVFGNUFDYmV4SDBaMERrS3ZoY2Jh?=
 =?utf-8?B?UncySWV2LzkwdnhTVVV3L3RWNjAzSklWNXM3dG5ncmlDY3MwenVqS0RZeXRi?=
 =?utf-8?B?bXNWVjVJRTZvWTBsMjJVT0xwcUZTQVljR2k1eEJrd3lsSDNGV0lJam1RVWtu?=
 =?utf-8?B?a1ZPbmwyMGZ6ZFhTdlh1YlhBQ3d4cnZIN1hTOGZFZlB4NFJxcDMzSmZIaXFS?=
 =?utf-8?B?QkxsWStNSnBoM3RzWHh5OVJzYUZVd3dQSndadmlPTXdwMEN5VDNRd1lFSzBY?=
 =?utf-8?B?bzNLSklKb0picUdRMWF6MDNtVGwvYWErS0J4WEE2MGRFcTJEcmkvNitRbyt0?=
 =?utf-8?B?SlJDdk5mMG9xYkZuUkRIbS94eVFpaVJJNmYrREhVSWZjR0E0Uy9OQnJCN1h1?=
 =?utf-8?B?dGZTMHpjVXJzZE5JK01kVjdlanRjN0kvbkJkNG1DaEtjUElTeXRIYkNqZVJk?=
 =?utf-8?B?MXZLejhIRXluOURIQVdBR0JNZE9FTGN2bGRKRDEyZVRnRlpqRjlaNHJXOVRH?=
 =?utf-8?B?Z2hYUjcwU1A3bkNnYTlOVFhVeTJoM2NLQW5ZVWIranZ5UUVZNzVteERSTFV2?=
 =?utf-8?B?T3FGamxDWHg3VXExQ2tidW44aFZQdk9PVjZ2UmVuQVNFWjBWemcySjJNOUNS?=
 =?utf-8?B?dXNQam5TOEwvSmJNdS83VW5UeWtONXZybjZpLzY1RU1ocmE3amhTdlZXakpO?=
 =?utf-8?B?a0NVUVFOUXMvZ0grMDQzK3hmbk5QNGFqOGRKY2Z6YTRZY09BTWxna2ZyRzhU?=
 =?utf-8?B?WlVZbU1ZS2grbjMwSW5xT0pTUHV3SmdvS1RPekVSaGtpS1RNcDB1M0R4dmJV?=
 =?utf-8?B?RXFjQjBiYWVMM0dxNHEyZkRWeDlWcjAwVHloWFdrM1RnTXU2aTU1U3g4Mndk?=
 =?utf-8?B?RzJvWnpyaysrekY1TURoVy9VUTZ2S0hTdjB1WWxYcWxvaU9td0hQc3FYV2tj?=
 =?utf-8?B?K3pvU05hT1lJamFIMVdKdktzZS9QL0VPMGhSVGdlQkQxbk9BdVptZm9DVEZE?=
 =?utf-8?B?Zlg4Z0plQzdXWXFwTVdxWmZuSmVlSlF6T3AzZVZjVkVMM2JSYkNEYUljNWRO?=
 =?utf-8?B?eHJqK2tVdlRMUGdEczZ1QWExRlg4WGtqbUVZVkJRNHMxWWFnRlcyN0F4d2dj?=
 =?utf-8?B?cDNIOVRITlZlTzJwL0hiUzEvSVVxd0drTWdKeTY0UmQyMXVPRk9GL1BFQUhx?=
 =?utf-8?B?a01xMHRqaTN2b2NMMmcxNjhQdU00UDRGMWZtL3c3cWlNeFlQNWJ0VEhOVGMv?=
 =?utf-8?B?b3hBNU53MFIyakIzVTdjZGs4bkNaUkh3dm5PQk5YcmpmZ0kxT0dtcGwrdTh5?=
 =?utf-8?B?S05oMDVrSjViK2MrUmlzZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DA198A29502DC448141903D2FEBFA57@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63322d6-b3aa-402c-eb74-08d8e5495bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 11:24:11.0004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBz778inbGtzNd4UqN2PHcGOgfK3KmhopfnCzXei+r6gYFIlQaIcWENaHsHaOkZQBNqMRWWhA+zW0S6SgpMpJttB1GeViScTY6tfrn1HIUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5910
X-OriginatorOrg: citrix.com

SSBkb27igJl0IHRoaW5rIEkgd3JvdGUgdGhpcyB1cCBhbnl3aGVyZSB5ZXQsIGJ1dCBJIHVzZWQg
VExBKyB0byB2ZXJpZnkgdGhlIGZpeGVzIGZvciBYU0EtMjk5IHNldmVyYWwgeWVhcnMgYWdvLiAg
SeKAmWQgYWx3YXlzIGludGVuZGVkIHRvIHBvc3QgdGhlbSBvbmNlIHRoZSAgZW1iYXJnbyB3YXMg
dXAsIGJ1dCBuZXZlciBnb3QgYXJvdW5kIHRvIGl0LiAgVExBIGNhbWUgdXAgaW4gYW4gb25saW5l
IGRpc2N1c3Npb24gYm9hcmQgcmVjZW50bHksIHNvIEkgc3BlbnQgYSBiaXQgb2YgdGltZSB0byBj
bGVhbiB0aGluZ3MgdXAgYW5kIGdldCB0aGVtIHBvc3RlZC4gIEhlcmUgdGhleSBhcmUsIGlmIGFu
eW9uZeKAmXMgaW50ZXJlc3RlZC4NCg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Bl
b3BsZS9nZHVubGFwL3RsYQ0KDQogLUdlb3JnZQ==

