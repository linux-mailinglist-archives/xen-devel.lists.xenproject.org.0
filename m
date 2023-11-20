Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B108F7F1248
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636624.992338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52dJ-0001uv-68; Mon, 20 Nov 2023 11:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636624.992338; Mon, 20 Nov 2023 11:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52dJ-0001pP-2a; Mon, 20 Nov 2023 11:40:05 +0000
Received: by outflank-mailman (input) for mailman id 636624;
 Mon, 20 Nov 2023 11:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NCOd=HB=forvia.com=prvs=681316a83=zewei.zhang@srs-se1.protection.inumbo.net>)
 id 1r52Wz-0002Bw-PO
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:33:34 +0000
Received: from esa14.hc106-56.eu.iphmx.com (esa14.hc106-56.eu.iphmx.com
 [207.54.65.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15349eb-8798-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 12:33:32 +0100 (CET)
Received: from mail-pr2fra01on0100.outbound.protection.outlook.com (HELO
 FRA01-PR2-obe.outbound.protection.outlook.com) ([104.47.24.100])
 by ob1.hc106-56.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:33:29 +0100
Received: from PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::18)
 by PR0P264MB2887.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 11:33:27 +0000
Received: from PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6cd1:6e4b:677e:a4ae]) by PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6cd1:6e4b:677e:a4ae%5]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 11:33:27 +0000
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
X-Inumbo-ID: a15349eb-8798-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=forvia.com; i=@forvia.com; q=dns/txt;
  s=s1-20220303-CES; t=1700480011; x=1732016011;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=vhzFc4XhHSFn2kp7rZdQ7S9w0Ov8o26OV0bybDomLaw=;
  b=mzTDv1BSlFgDyOcWPjgM5fz2LQMEPNiKba4ManOKi3UfXCwIQtRGJGAf
   UBZ0idyhubnqwKEnNkNcuXwxPuZnMEwtA/FuDS6dtw8uS/dCOrRD1m4vW
   y/fssBGptBkockwuxB4eBDUxc2LoI0bVhwsRccw63Zu8D6uVFlrJlY4DM
   i5YG9ht3v8L3udg6zj1iqY+rXb5+4C5tPio6572QUeppKfvFaJXB7n9Fk
   ewviB0hLtT24yP8TQFM38gPbzowVjovFiPcgDj+3EWdQB09RaaW8L37gS
   jFKtoy3dXkZs/SUf8YYEjmtG7zhH7urG0LtwIVO/7agznqLFbny5tHvko
   w==;
X-CSE-ConnectionGUID: lXzUMj40Rm23Cfb73WJyCA==
X-CSE-MsgGUID: wQ51NLuPRSGzsbas2TETmw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac/q8AJY54fCEv611g8R+slqWUFTlH3uHCtM6/S5BxkZDic9xBhl3OEdOsNsMEJ0PTK/dXBhSIa51PN0ofgjbwLT+q2MTJgRDu0bb0iUrB4hz6LmyrYMRR9hvXYe4aoOV05GDqhjoVx/1Zh3xvo8PWI52uelLtkQCDPRwhwORbsFaSAgImadiOq3pZxcdp1f3aPOy3jHZS5OY4cemM2iLv2pOtY3mc3s6iUo+udn0b2+Lo90EmlahIslQhHM2wqx0RR4vy9SMBNXaEEVZsp7Djmrbdc8I4PPtHdMiTVW/McnT3yVVDlKY9ThyDRlroGkBeRieiaSxU6faCVcjpfA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGtWT7JFZxkumB/qMbpOR70Et4y4gLvFZSY12LXpFsE=;
 b=NgilxGWQMeJ3+a0WgC+Gb22+nlB+9k5pr6BEvCuVYYBsQkIQ9sWIz038/pEgY+NS31e955yNKbLXlXH26n874A0S+E0/DGrG6yLtXkbTxWcYYWWNdwjarhO8qfueBphaxvzQHIB+xVWmWGlufRZm0oCI6+/8tr9vX0KV1SysYd6bfq9j+hv4griln1fo+TySqJ2kjj0Z8r00s0Cmk6ezPqBHwNhBBLY2Mn9ZflBhmz69JVmDcAjy75LH//iTxBXRt5/sVaRPV+inclKAN8fi5QXWjUk4H8ZJTAMqUVD1q5+lWFtQuhp5HlDLzeKzfyxXpOW5DIj8cTqmJh1Yf6+QZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=forvia.com; dmarc=pass action=none header.from=forvia.com;
 dkim=pass header.d=forvia.com; arc=none
From: ZHANG Zewei <zewei.zhang@forvia.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "ray.huang@amd.com" <ray.huang@amd.com>
Subject: AMD Working On VirtIO GPU Support For Xen Virtualization issues
Thread-Topic: AMD Working On VirtIO GPU Support For Xen Virtualization issues
Thread-Index: Adobo1s+5ZENqT0uQjS822lVvDb6Fg==
Date: Mon, 20 Nov 2023 11:33:27 +0000
Message-ID:
 <PR0P264MB2423CA7C396A70D21D08274C80B4A@PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-Mentions: ray.huang@amd.com
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_ActionId=d715e922-4bf3-4286-8029-b832696e087e;MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_ContentBits=0;MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_Enabled=true;MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_Method=Standard;MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_Name=InternalAndPartners;MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_SetDate=2023-11-20T07:42:12Z;MSIP_Label_eafdac3b-4115-4c64-bf62-f9099ec36d84_SiteId=5047bca2-da88-442e-a09a-d9b8af692adc;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=forvia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR0P264MB2423:EE_|PR0P264MB2887:EE_
x-ms-office365-filtering-correlation-id: ad9218a3-1db9-4e0a-73c3-08dbe9bc83b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vvL83qFCV3Y2vyknKHxiZnsAVZL+8/2YTZAt5UBA9YPgphBlIhSzIDq8K2/Wa96bmdgEDRWMpK0320w4QlJweIy1MtFq6WmxnPY7J7OXKQh9nZKaj9yPIUxjlnci7JOUACKSloHR/hOkmbLkWh5e3fEw2SM0CiDiFycBPGvM07bybygK6vLVrrnchASfOQv6e8+gK2Kkq13vrVb2gXOYzHOnUFbBjkrEqI9IdIiFGswttB1VZb9IYft0YRocewk/AZfxof3kj90FQjYRvvPskHBtqsPVRaDHtYdUSNaArf47zBZUT4PWXE8R2wv020Wqk9cF6pxKMDg1f3P/CpAgREpGoCgyk8I/mT5cJNHPf7vXadYwjPnUgi6vpBplqBbibVKIXFVLuCMi5q2xri/3tlj0wutjuf4eC8lycrbXf0QtZyW1V3j0J5CoCyP+1I0xH9SYbt5atOQC8hfgrnt7s5jd66vRPXz3YIkZHijWfeNfGphEkrVPODA2RMikKncM2A5slZ7AG9CQ9fBd57i4a7ptbi9Ux4ESvCI0pz4cdps=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(26005)(55016003)(83380400001)(478600001)(9686003)(99936003)(122000001)(71200400001)(7696005)(6506007)(66946007)(316002)(6916009)(64756008)(66446008)(76116006)(66556008)(66476007)(166002)(52536014)(8936002)(8676002)(4326008)(38100700002)(5660300002)(86362001)(2906002)(33656002)(41300700001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Vk11TVY5Wjc0YW5ZUVJJOW1PeW1BMG9QVGhuL24xenlMUVVNTjFiY0tReGVt?=
 =?gb2312?B?TGZBbnVSZFJkam5ObFJLcEZxYXhSckwwTXRhQXYyQU9CTHNNc1dZeklpYnlo?=
 =?gb2312?B?VTBzV3VLQmZkN0RVanpZQ2o3RUNhQVpvUnlkSDVkVkxXRXEvSCs0bDlhT1Y0?=
 =?gb2312?B?cnBjZ3d6cUlXR0Ird1dJTmdnRHYrOHc1WnpOS0JIbXBhNzNOS2w1bEo0YkpJ?=
 =?gb2312?B?NTlHMkozc1VkeWdheE43NGJhWjB4cHM2M2RaaVBOR3luaWZjNVNCdmt2TVht?=
 =?gb2312?B?WkNscFNXSWI3K2FxMDYvS1BybEFPU0FtME5xSHZpWEYwRTBQWVVvNlBGTHFh?=
 =?gb2312?B?VFRJbmxTbGFDSEI4RlloeEdZV2Q5VmlvQTlTdFhyU1BPSXo3dmtvTWlpWkJQ?=
 =?gb2312?B?SGFWaDhnK3IxSm1FNTNWN3g1dUVpQ3diSDNvcy9OWFRITUp4QzFVUW1aQnk5?=
 =?gb2312?B?NDM1M1EybWlXS3I2M0RVZkdMK1RweUpEc0V6Y1RBTmtITW9wZVBGdWMrREVS?=
 =?gb2312?B?MDB5UFo4cC9zc3UvdERRUEpDOFJJL2JqT0FMdzRaMHZjaGp6RGgwTmo0SlA3?=
 =?gb2312?B?VzU0dzRoSDdFLzd1WTRwYmtXYW05VWZOUEtRcHo0Zmh4Z3lIVmRQaUx4K1ZE?=
 =?gb2312?B?dit6MXdId0djbzVMcFhUQmh0SFJMYlJxWWhkLzluQW8wSVozcG5FSllJcGdh?=
 =?gb2312?B?L0hzYVU2WDNZRzIyMmtRazdBYjh3azRaSk5DWGFFUWN4Q0dpZ00rL3VFZjZ3?=
 =?gb2312?B?V1VrRGg1YUtTRGJhWmh4VWJQcFdSMGxBU3lZUWdZR0pBYXg4Umk5aVRORC9S?=
 =?gb2312?B?a05lS2diMlBkWXF0VFo2Y2FXalJvY0M2UWE1Z3NaSGJoM3ZRajNrbFc0eUUy?=
 =?gb2312?B?R1hIbEFFamJQZ2NLNk9FVUlwQkQvczJOeFYxWTdsUnY4SkF1QUp3R2ZUMWpG?=
 =?gb2312?B?ZGlaZlQydU5rdjQ1Y0NjUlBhRXJUaEtmdERyclkzVlpjNXlza3N3RE1vUHV5?=
 =?gb2312?B?SFZ5RnZMVVJaYndFVUNyTEU1NGZWNVBkOTR5WXM0Q1kwSUs3bG5Ia3QreFpV?=
 =?gb2312?B?NkE0RGRwZDlFUDN2VW9yWTlSVHMzVytMdDZLMEpqQ2Y0RGx5S2hsdFVsWGU3?=
 =?gb2312?B?NVZsalFXZVBrblpvdFVKZ3Z4RVBvUDI0aU52Q1JLRVNWRVNaNnN1Qlp0MGsx?=
 =?gb2312?B?Tis1QWpHVmQzMUtoZHQwY1paUkFSa2wyL0VPMnNLSHhlNGdNNXk5OWdJN25E?=
 =?gb2312?B?TkNzU2EvUXpRZ0lSdkd3bENsVklaV2VNMDVMTUN5VklNQkpIdW95R0cyQnJO?=
 =?gb2312?B?U2FxQW54d1Y0U1crOU1nSm1EWG5aUW4wbm15TmdtcU9hMTdsa1o4TVdlTzJq?=
 =?gb2312?B?WU1TalZHa3ZyNE4zVHM1dWlSam90UlFzU3doVXlUaHh5S1JwY2M1bElSM0Vz?=
 =?gb2312?B?bHRpSW4zTVJiTDQwajgzMHZNV0M0L0FEMllCSStreURWSWk0YnEzN3FkN3p2?=
 =?gb2312?B?c2h4R2o5Sk1XL1lkcnozTlV6UjBoL0EzTnpMaFQ1RWpNMnJER2tQWjBQMERt?=
 =?gb2312?B?TGhKOElOczBUNXREMzA4dnNyQ2p6YUl3K2MrL211eE9BaVM2bHdWRHg2cVdY?=
 =?gb2312?B?RW54NDJtRUJnWGVWVFIrUlhXdUlTTXV2U01IOHlFTlJIMHYwd05VRmJVWklY?=
 =?gb2312?B?NTZuakNsSWpSbGdVNE9hK1lOVm5KcWJJbm9lWU5FTloyczlSVU45OVpUK3Er?=
 =?gb2312?B?cFRrS2ljVkl6RXJSMGFaaTl2Z3BZRE0vK3NIVFZla1FYR094ZlJtQVY0NUZI?=
 =?gb2312?B?STRacUZuUDl1dDQ2QzdmajFtT09jQWZvRnFVWWJOeGQxaGFXdUFHaVVoWmtw?=
 =?gb2312?B?MEdCd0xDT1FETXJaQWkvb2x1N09VSFRGTk9qWW9nMmtnSmFUV2t5eXFzWk1O?=
 =?gb2312?B?ajhPdnZiZXk4QzhDYnZPbE5YK2lwZWl3RC9JS3lRWG96b1BGTW1FSktRWG90?=
 =?gb2312?B?NW9xWDBRUERSV05OeEJiNCtKOGRHb1ErVnFRd0dWaVJMeGFWdlA4WWF4R0E2?=
 =?gb2312?B?ejhHQjNLOElZWHRnem1VVmJjR2cyb01pR1dwQitrSDVXZHhkUGsvWkJuMm52?=
 =?gb2312?Q?GKUjKPpEpZ6v0FJkcpgVHyV/Y?=
Content-Type: multipart/mixed;
	boundary="_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LLAsIL7Q+NNmHffMNCXCBMrSP06109cOhcChW53WwO0lJ5uTb6zCd/X/BCeGTXCRJOAfOsr/p8Avc5/NlfkwsyZbpKBT+nIt5z2didB0TIO8Pf27rOqNgyJvv3QHpwJpdb3P1FfPRpN889sVs14gnzYJQtD/b2UhR+CgbMFU0lMEIQGNZu4CLbk2O3G4dPcWFAZihhaJdx+HPCEM0+CoAsxsVpXkAVj4dZwhRhUdVUaFME2F837wvXgAy6otx4FlciYH+G1Hno0XXQfqY7atTXokd2ZIK5ip962IragRtOT8EaSlFEq8lmte/NkTTUzCAbboX1rdJvwYN9ahr8yy6EeXk9LuKaykoUFKH7csz3+l3o0f2N8FZVVx0X3CahyOtbnDKiVaK/hi7AMpDbfLw/8n/Q4ZKQil28U0keYEr/D3OUbp59+cp/B4wXPE24Pu866Dg1AElSzmx3JjH+zpvrZb4fZzdtjrT6FDI8WBILVk8irsa61LfIucq0pemu+nDEzhXOkKpcDHCtrJtHE74iijCG8wczjjfHszxxxpUysDvTymRJH74QBIw0EGQsUzR5lAOoEDPmZMcir7yfLgYw3709vkRVBQHYYCijoGZV8SHPg0nrKMfDvweT73YYRzlxy3ZZNWql5P+oT0bazxKlNgIudw6K2TOlm95yciuXt9hI5ALxNzw3kiHz7TpfqbBbWvK7gVO9zeyEBEYI/Fo1Bzuws4z/QvbtjCTUSfl5vj8tM0KinFJEHqaBSGU8nq8zNGLp/UNMow8z+5jFHm4VE6LMBEK1b3VFMGt05J+bEaPSNWmSA9TC0Lf+rIHHX3evGZf14pz1sfePCyWCVGglYlwjYbDhh49stkRjRcujo=
X-OriginatorOrg: forvia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9218a3-1db9-4e0a-73c3-08dbe9bc83b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 11:33:27.5865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5047bca2-da88-442e-a09a-d9b8af692adc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0B7gy6o5Vmv1Z7Tgtrd7SG6tuF15P2+UscbKKWZt5VBsWwFIFcMJRwCiArpWC5VVWgAbYr4Mz4Wwp8WE0QeSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2887

--_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: multipart/alternative;
	boundary="_000_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_"

--_000_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SU5URVJOQUwgJiBQQVJUTkVSUw0KDQpIaaOsWGVuLWRldmVso7oNCiAgICAgICBXZSBhcmUgdHJ5
aW5nIHRvIGltcGxlbWVudCB0aGUgaWdwdSBzaGFyaW5nIGZ1bmN0aW9uIGZvciBkb21VIG9uIHRo
ZSBBTUQgKHYyMDAwIHNlcmllcykgZGV2ZWxvcG1lbnQgYm9hcmQgZW52aXJvbm1lbnQsIGFuZCB0
aGUgc29mdHdhcmUgYXJjaGl0ZWN0dXJlIGlzIHhlbiArIHVidW50dSAyMi4wNCAoZG9tMCkgKyBV
YnVudHUgMjIuMDQgKERvbSBVKS4gV2UgZm91bmQgdGhhdCBBTUQgZW5naW5lZXJzIGxpa2UgTXIu
IEh1YW5nIEByYXkuaHVhbmdAYW1kLmNvbTxtYWlsdG86cmF5Lmh1YW5nQGFtZC5jb20+IGhhdmUg
cG9zdGVkIGluZm9ybWF0aW9uIGFib3V0IHZpcnRpby1ncHUgIGZvciBYZW4gdmlydHVhbGl6YXRp
b24gdG8gdGhlIG9wZW4gc291cmNlIGNvbW11bml0eSBhbmQgdXBsb2FkZWQgdGhlIHJlbGV2YW50
IGNvZGUuDQoNCiAgICAgICBBbmQgV2UgcmVmZXIgdG8gdGhlIHJlbGV2YW50IGluZm9ybWF0aW9u
IGxpbmtlZCBiZWxvdyB0byBkZXBsb3kgb24gbXkgQU1EIGhhcmR3YXJlIHBsYXRmb3JtOg0KW1JG
QyBQQVRDSCAwLzVdIEFkZCBYZW4gUFZIIGRvbTAgc3VwcG9ydCBmb3IgR1BVIC0gSHVhbmcgUnVp
IChrZXJuZWwub3JnKTxodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMzAzMTIx
MjAxNTcuNDUyODU5LTEtcmF5Lmh1YW5nQGFtZC5jb20vPg0KDQogICAgICAgSG93ZXZlciwgd2hl
biB3ZSBkZXBsb3kgdmlydGlvLUdQVSByZWxhdGVkIHNvZnR3YXJlLCB3ZSBlbmNvdW50ZXIgdGhl
IGZvbGxvd2luZyBpc3N1ZXM6DQoNCjEuICAgIE15IGNvZGUgb2YgeGVuIC9xZW11IC9WaXJnbHJl
bmRlcmVyIGNoZWNrb3V0IHRvIHRoZSB1cHN0cmVhbS1mb3IteGVuIG9yIHVwc3RyZWFtLWZvci14
ZW4tdjIgYnJhbmNoLCB0aGUgeGwgY29uZmlndXJhdGlvbiBmaWxlIGlzIHNldCBhcyBmb2xsb3dz
LCBzZWU8IHVidW50dWh2bV92aXJ0SU8tZ3B1LmNmZz46DQogICAgICAgICAgICAgIGRldmljZV9t
b2RlbF9hcmdzX2h2bT0gWyItZGlzcGxheSIsICJzZGwsZ2w9b24iLCAiLWRldmljZSIsICJ2aXJ0
aW8tdmdhLWdsLGNvbnRleHRfaW5pdD10cnVlLGJsb2I9dHJ1ZSxob3N0bWVtPTRHIl0NCg0KDQoy
LiAgICBBZnRlciB0aGUgZG9tVSBpcyBzdGFydGVkIHdpdGggdGhlIHhsIGNvbW1hbmQsIHFlbXUg
YW5kIHhlbiBoeXBlcnZpc29yIHdpbGwgcmVwb3J0IHRoZSBmb2xsb3dpbmcgZXJyb3JzOg0KICAg
ICAgICAgeGVuIGh5cGVydmlzb3IgcmVwb3J0IDwgeGxfZG1lc2dfdXBzdHJlYW0tZm9yLXhlbi12
Mi50eHQ+Og0KICAgICAgICAgICAgICAoWEVOKSBkMHY4IE92ZXItYWxsb2NhdGlvbiBmb3IgZDE6
IDEwNDg4MzMgPiAxMDQ4ODMyDQooWEVOKSBjb21tb24vbWVtb3J5LmM6Mjc3OmQwdjggQ291bGQg
bm90IGFsbG9jYXRlIG9yZGVyPTAgZXh0ZW50OiBpZD0xIG1lbWZsYWdzPTB4YzAgKDE5MiBvZiAy
MDQ4KQ0KICAgICAgICAgICAgICBxZW11IHJlcG9ydCAgaW4gbG9nIGZpbGUgPCBxZW11LWRtLXVi
dW50dVVfYi5odm0ubG9nPjoNCiAgICAgICAgICAgICAgcWVtdS1zeXN0ZW0taTM4NjogLWRldmlj
ZSB2aXJ0aW8tdmdhLWdsLGNvbnRleHRfaW5pdD10cnVlLGJsb2I9dHJ1ZSxob3N0bWVtPTRHOiB4
ZW46IGZhaWxlZCB0byBwb3B1bGF0ZSByYW0gYXQgMTEwMDgwMDAwDQoNCg0KMy4gICAgSSB0cmll
ZCB0byBzdGFydCBwdmggZG9tMCBidXQgaXQgZGlkbid0IHdvcmssIGl0IGxvb2tzIHRoZSBzYW1l
IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBJJ20gdXNpbmcgdXBzdHJlYW0tZm9yLXhlbi12MiBvciB1
cHN0cmVhbS1mb3IteGVuIGJyYW5jaCBsaW51eCCjug0KDQpMb2dzIGluIGF0dGFjaG1lbnQ6PCBz
ZXJpYWxfeGVuX2h5cGVydmlzb3ItbGludXgtdXBzdHJlYW0tZm9yLXhlbi12Mi50eHQ+DQoNCg0K
DQoNCiAgICAgICBTbyBJIGhhdmUgc29tZSBxdWVzdGlvbnMgZm9yIHlvdSA6DQoNCjEuICAgICBE
b2VzIERvbSAwIG5lZWQgdG8gYmUgY29uZmlndXJlZCB3aXRoIFBWSCBmb3IgVmlydElPLUdQVT8N
Cg0KMi4gICAgIFdoYXQgbWF5IGNhdXNlIHRoZSBhYm92ZSBpc3N1ZXM/DQoNCldlIGxvb2sgZm9y
d2FyZCB0byBoZWFyaW5nIGZyb20geW91IQ0KDQpUaGFua3MgJiBCZXN0IHJlZ2FyZHMhDQoNCg0K
DQoNCg0KDQoNCjVhY1hqelVrDQo=

--_000_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cordia New";
	panose-1:2 11 3 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=CE=A2=C8=ED=D1=C5=BA=DA;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}
@font-face
	{font-family:"\@=CE=A2=C8=ED=D1=C5=BA=DA";}
@font-face
	{font-family:"Arial Narrow";
	panose-1:2 11 6 6 2 2 2 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:377825090;
	mso-list-type:hybrid;
	mso-list-template-ids:2068761800 1071791900 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:39.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:210.0pt;
	text-indent:-21.0pt;}
@list l1
	{mso-list-id:917907350;
	mso-list-type:hybrid;
	mso-list-template-ids:1646170976 -1499554382 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:39.0pt;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:210.0pt;
	text-indent:-21.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<p style=3D"font-family:Calibri;font-size:8pt;color:#808080;margin:5pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Right">
INTERNAL &amp; PARTNERS<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:12.0pt">H=
i</span></b><b><span style=3D"font-size:12.0pt">=A3=AC<span lang=3D"EN-US">=
Xen-devel</span>=A3=BA<span lang=3D"EN-US"><o:p></o:p></span></span></b></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We are trying to implement the igpu sharin=
g function for domU on the AMD (v2000 series) development board environment=
, and the software architecture is xen + ubuntu 22.04 (dom0) + Ubuntu
 22.04 (Dom U).</span><span lang=3D"EN-US"> </span><span lang=3D"EN-US" sty=
le=3D"font-size:12.0pt">We found that AMD engineers like Mr. Huang
<a id=3D"OWAAM9EF3F52EDE5F458496DAA04A8BA7981A" href=3D"mailto:ray.huang@am=
d.com"><span style=3D"font-family:=B5=C8=CF=DF;text-decoration:none">@ray.h=
uang@amd.com</span></a> have posted information about virtio-gpu &nbsp;for =
Xen virtualization to the open source community and uploaded
 the relevant code.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; </span><span lang=3D"EN-US" style=3D"font-size:12.0pt">And We refer t=
o the relevant information linked below to deploy on my AMD hardware platfo=
rm:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;text-indent:21.0pt"><spa=
n lang=3D"EN-US"><a href=3D"https://lore.kernel.org/dri-devel/2023031212015=
7.452859-1-ray.huang@amd.com/">[RFC PATCH 0/5] Add Xen PVH dom0 support for=
 GPU - Huang Rui (kernel.org)</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; However, when we deploy virtio-GPU related=
 software, we encounter the following issues:<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:-18.0=
pt;mso-list:l1 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:12.0pt"><span =
style=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times New Roman=
&quot;">&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:12.0=
pt">My code of xen /qemu /Virglrenderer checkout to the upstream-for-xen or=
 upstream-for-xen-v2 branch, the xl configuration file is set as follows, s=
ee&lt;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-size:12.0pt">ubuntuhvm_virtIO-gpu=
.cfg&gt;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang=3D"EN-US" styl=
e=3D"font-size:11.0pt;color:red">device_model_args_hvm=3D [&quot;-display&q=
uot;, &quot;sdl,gl=3Don&quot;, &quot;-device&quot;, &quot;<b>virtio-vga-gl,=
context_init=3Dtrue,blob=3Dtrue,hostmem=3D4G</b>&quot;]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:red"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:-18.0=
pt;mso-list:l1 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:12.0pt"><span =
style=3D"mso-list:Ignore">2.<span style=3D"font:7.0pt &quot;Times New Roman=
&quot;">&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:12.0=
pt">After the domU is started with the xl command, qemu and xen hypervisor =
will report the following errors:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xen hypervisor report &lt;</sp=
an><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-size:12.0pt">xl_dmesg_upstream-fo=
r-xen-v2.txt&gt;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (XEN) d0v8 Over-allocation for d1: 1048833 &gt; 1048832<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;text-indent:21.0pt"><spa=
n lang=3D"EN-US" style=3D"font-size:11.0pt;color:red">(XEN) common/memory.c=
:277:d0v8 Could not allocate order=3D0 extent: id=3D1 memflags=3D0xc0 (192 =
of 2048)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">qemu report &nbsp;in=
 log file &lt;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">qemu-dm-ubuntuU_b.hv=
m.log&gt;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span=
 style=3D"color:red">
qemu-system-i386: -device virtio-vga-gl,context_init=3Dtrue,blob=3Dtrue,hos=
tmem=3D4G: xen: failed to populate ram at 110080000<o:p></o:p></span></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:red"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:-18.0=
pt;mso-list:l1 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:12.0pt"><span =
style=3D"mso-list:Ignore">3.<span style=3D"font:7.0pt &quot;Times New Roman=
&quot;">&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:12.0=
pt">I tried to start pvh dom0 but it didn't work, it looks the same regardl=
ess of whether I'm using upstream-for-xen-v2 or upstream-for-xen branch lin=
ux
</span><span style=3D"font-size:12.0pt">=A3=BA<span lang=3D"EN-US"><o:p></o=
:p></span></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:0cm">=
<span lang=3D"EN-US" style=3D"font-size:11.0pt;color:red">Logs in attachmen=
t:&lt;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;color:red">serial_xen=
_hypervisor-linux-upstream-for-xen-v2.txt&gt;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:0cm">=
<span lang=3D"EN-US" style=3D"font-size:11.0pt;color:red"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:0cm">=
<span lang=3D"EN-US" style=3D"font-size:11.0pt;color:red"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;color=
:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">So I have some quest=
ions for you :<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:11.0pt"><span =
style=3D"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times New Roman=
&quot;">&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:11.0=
pt">Does Dom 0 need to be configured with PVH for VirtIO-GPU?<o:p></o:p></s=
pan></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:39.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-size:11.0pt"><span =
style=3D"mso-list:Ignore">2.<span style=3D"font:7.0pt &quot;Times New Roman=
&quot;">&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-size:11.0=
pt">What may cause the above issues?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">We l=
ook forward to hearing from you!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=CE=
=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif;color:black">Thanks &amp; Best regar=
ds!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-family:&quot;C=
entury Gothic&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></b></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l Narrow&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:9.0pt;fon=
t-family:&quot;Century Gothic&quot;,sans-serif;color:black"><o:p>&nbsp;</o:=
p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:2pt;color:#FFFFFF;margin:5pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Right">
5acXjzUk<br>
</p>
</body>
</html>

--_000_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_--

--_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: application/x-zip-compressed;
	name="serial_xen_hypervisor-linux-upstream-for-xen-v2-txt.zip"
Content-Description: serial_xen_hypervisor-linux-upstream-for-xen-v2-txt.zip
Content-Disposition: attachment;
	filename="serial_xen_hypervisor-linux-upstream-for-xen-v2-txt.zip";
	size=6539; creation-date="Mon, 20 Nov 2023 11:06:51 GMT";
	modification-date="Mon, 20 Nov 2023 11:33:24 GMT"
Content-Transfer-Encoding: base64

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

--_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: application/x-zip-compressed;
	name="qemu-dm-ubuntuU_b.hvm-log.zip"
Content-Description: qemu-dm-ubuntuU_b.hvm-log.zip
Content-Disposition: attachment; filename="qemu-dm-ubuntuU_b.hvm-log.zip";
	size=255; creation-date="Mon, 20 Nov 2023 11:07:17 GMT";
	modification-date="Mon, 20 Nov 2023 11:33:25 GMT"
Content-Transfer-Encoding: base64

UEsDBBQAAgAIALqYdFfYwuZeawAAAHkAAAAZAAAAcWVtdS1kbS11YnVudHVVX2IuaHZtLmxvZyXG
UQqDMAwA0P+dIgcwUJmIFPzeMUbUzAXaxrVpcbffwPf1Phwrlm8xjij3afSAGzdZGZpkE8W2E+6h
WzUZn/aUJDZbrtwtQZdrby0WOc7Dw8PJycOLJPAGpnDoUQMZQ6YIZND3zk3u7/YDUEsBAhQAFAAC
AAgAuph0V9jC5l5rAAAAeQAAABkAAAAAAAAAAQAgAAAAAAAAAHFlbXUtZG0tdWJ1bnR1VV9iLmh2
bS5sb2dQSwUGAAAAAAEAAQBHAAAAogAAAAAA

--_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: application/x-zip-compressed;
	name="xl_dmesg_upstream-for-xen-v2-txt.zip"
Content-Description: xl_dmesg_upstream-for-xen-v2-txt.zip
Content-Disposition: attachment;
	filename="xl_dmesg_upstream-for-xen-v2-txt.zip"; size=4559;
	creation-date="Mon, 20 Nov 2023 11:07:42 GMT";
	modification-date="Mon, 20 Nov 2023 11:33:25 GMT"
Content-Transfer-Encoding: base64

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

--_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_
Content-Type: application/x-zip-compressed;
	name="ubuntuhvm_virtIO-gpu-cfg.zip"
Content-Description: ubuntuhvm_virtIO-gpu-cfg.zip
Content-Disposition: attachment; filename="ubuntuhvm_virtIO-gpu-cfg.zip";
	size=1037; creation-date="Mon, 20 Nov 2023 11:15:39 GMT";
	modification-date="Mon, 20 Nov 2023 11:33:25 GMT"
Content-Transfer-Encoding: base64

UEsDBBQAAgAIALqYdFfMgdYCewMAAJsGAAAYAAAAdWJ1bnR1aHZtX3ZpcnRJTy1ncHUuY2ZnrVRd
b9s2FH3Xr7iwH5wCkmynabAZ0EPXdGmBpijQxhtQDC5FXUmERVIjKdvpr9+h5ATr1pcCFQRbJO/H
Ofce3jkVP+NJ5vT6JHTfMb3Z3lEzsA8kralVMzgRlDWw+EmZEOlTqzzhFVQL5boH0sooLTriMwhb
07EVIdo4/ntQjiuqrSMRcTwhzOn3uEfaOgba6BkYR6pi8sx06nJZNxcvniWPOR8pMXKbMRDYtewo
tFh/2E5xk/DQMxU0aw96Fn1vx3oYoTmJP/FoKAcThvtdmT8arS9/yUoV6P7+7c0IFoGpslooQyJy
bcGuYjkSNYMu2eVwu/eMaMDcsJlRsIR/BioUwTCp+qkA+UgCIbkWQxeo5FYcFPKA17/dBBk+TihY
yJaCAuKIZeoqrH0QLowBY97I5s/zk33n5/EZSb42okR/7pR01ts60BuUymXbsfwQSqlw2gsHZC4M
olN+VA8t4cumU00b2Gg2wGECu1pI9jl9GpxRpgFKoIO1RDOU7p09MP2hTGWP/tyZOSEdiquFkaBq
qpE9Osh1FIFj4ED4iqtkDgiqUghV0Dpif2tUUKi9ZgjmgUTXWTmhu7j77Vly3i7oavXrNUWHO3FS
etCPDqMVwtQTTryNY1T8rJ4vk9kiwjFjwX0n5J6OquumklMZc6KtAEcXYxDh/aD5zI727AzDeOh7
C/MoorMLqoPcWpyQBBBfrC8jwPejiuJt2b76cP8xOch+8DieDjkcrdtDLweFKmPnJaEfIZovDqr2
PcsFmhKcitfBw9BLp0pcNRWvWWWlX2rl5fLUZWYKln0zE3It3B7NMbHWNfJ+poUWslitNuvrzXPe
rKrN+vlmtU5j4D4UsMpsz+bgjyrINi1dlH1hD750qwX9lTyFiQtguFF+TzffIfClwskPMYgO/4Ef
TiGJ21PKvn3YLDVDMcuvX4/LSgSxVLpZTjd9d2KTY5m2lUiPi3RRQ+n/s59ss8vLfHWVX2bAsw+2
z4Surq9y5S285UZWzurUnSlOs2V7+zIOJ287/nbupsRqnFAfb94R9LB9/yqZ+6obRT0/GImPFSXz
pj7teqgptG4osJFMbd9pW3G3E67xOwyqkeks1qLvxMMspRlCpU1XWBMX2eQUP+P9VTY7NCJruhSQ
Ap/CDmM6FMENnJadLaev1voAVRZXtzMwmpfWhmImZ8k/UEsBAhQAFAACAAgAuph0V8yB1gJ7AwAA
mwYAABgAAAAAAAAAAQAgAAAAAAAAAHVidW50dWh2bV92aXJ0SU8tZ3B1LmNmZ1BLBQYAAAAAAQAB
AEYAAACxAwAAAAA=

--_007_PR0P264MB2423CA7C396A70D21D08274C80B4APR0P264MB2423FRAP_--

