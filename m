Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94736FE18
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120597.228085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSZ-0000XA-AD; Fri, 30 Apr 2021 15:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120597.228085; Fri, 30 Apr 2021 15:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSZ-0000Wf-6l; Fri, 30 Apr 2021 15:53:43 +0000
Received: by outflank-mailman (input) for mailman id 120597;
 Fri, 30 Apr 2021 15:53:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVSY-0000Uy-BO
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:53:42 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6e58172-2242-4fd7-a63c-504f03630e9e;
 Fri, 30 Apr 2021 15:53:40 +0000 (UTC)
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
X-Inumbo-ID: d6e58172-2242-4fd7-a63c-504f03630e9e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PCmZiBcei6/dqF4Y6hVv7Ycr6USHYz6GfRbyy4sLFtA=;
  b=bZivxbGxVSvCDW1P97fi6GOk3CmkPhQcOpBYPayL41vXDdHJW/fE32YA
   5KaWnht1bxJyNHQnR9RNvVl7bR7z5g9WRYqJUiVEjNVfg63hbDlfz/And
   Lj0uH2qkPs27ejtyfnuux9k7tfJgKfJLB/cp0DJvtWxmhT14LWfpLYJK6
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xNn46K4gSBOG8/JwAtcR+3jZ5Bk9XVEdayKXa8Ec/Hcs5H/UAR6/ScYLqBbQUkFeDyGDsDnL+D
 WwwyLZ3kY+Kt+hFMXuT7RTYd5xwtJa59aH+Tmhf5QvXMls9VY3QN713GBijZ7QoLYwVGxRGHLC
 I2b11ZXKB6MN9u0HrAF486hMEr6As8gjhvjZZy252sobb7wFItS0purJnoWhnVQD0NX5kFgLqC
 +baL8mrNen7zmf9RG5TO3txNWBd/xr1F5nWZQ6Y9AD2Nibg1kPt9WI7XYe1gRo3jygJ/F0TaMU
 feM=
X-SBRS: 5.1
X-MesageID: 44331678
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fEGxaqi0mfSDLtg5CfoFV0q8SnBQX11w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIzVuL5w/CZ
 aa+457vDKmY3sadYCWAXMCUujFqbTw5e3bSDQBAAMq7xTLsCOw5NfBYmSl9zo9cxcK+7ct9m
 DZjxf0j5/Dj9iXwgLRvlWjlqh+t8DmzrJ4damxo+gTbg7hkwO5ILlmMofyxgwdhMGKxBIUnM
 LXoxEmVv4DmE/5Wm2uuxPi103B/V8Vmgff4GSVi3fivsD1LQhSY6Eq6PM7A3mpnnYIh91y3L
 lG2GiUrfNsfG79tR/w+sTSUFVSnle0yEBS4dI7tWBVUocVddZq3Ooi1X5Sea1weB7S2cQMFe
 ljC9zk//BGcV+WRGCxhBgf/PWcGls0BRuIWU4Ep4i81CVXhmlwyw8iyNUYhWpozuNzd7B0o8
 D/doh4nrBHScEbKYp7Gec6WMOyTkjAWwjFPm6+KUnufZt3dU7lmtrS2vEY9euqcJsHwN8Zg5
 LaSm5VsmY0ZgbHFdCO9IcjyGGPfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y8590CH8zgXe
 qpMp4+OY6iEULeXaJymyHuUZhbLncTFOcPvMwgZl6IqsXXbqLwsOj2d+vSOarNHT4oVniXOA
 pHYBHDYOF7qmy7UH7xhxbcH1n3fFbkwJ52GK/Gu8gfobJ9crFkg0wwsxCU98uLITpNvugdZ0
 1lOo7qlau9uC2T9WbM5GN5BwpFAi9ukfLdekIPgTVPH1L/cL4FtdnaU3tVxmG7Khh2SN6TNw
 JDuVJt++aSI4aLzS4vT/KrW1jqzkc7lTavddMxi6eD7cDqdtcTFZA9QpF8Eg3NClhSggZlqG
 BKbSceXU/BHjbSiaGo5aZkRt33Rp1ZukOGMMRUoXXQuQG3vsc0XEYWWDaoTIqqmwo0fiFVgV
 dw6qcbp7KFlV+UWC0CqdV9FGcJRHWcAbpAAgjAQIlPgLjkdDt9SnqwiSWAhws+fXfr8Esuln
 XsRBfkC83jMx54gDR1w6zq+FR7eiGmc0V8ZmtTnKd9GW7F00wDm9OjV+6W6S+8e1ECyuYSPH
 X5ejMUOBpp3M3y/gWSgiy+GXIvwYgOMuTRAK84Saza3mqgJeSz5Pg7Ns4R2KwgGMHls+cNX+
 7aRhScKyngDfg1nyOSvXQoNUBP2TAZuMKt/Cegyme23HQyW6WPZHtnQqwWONGa4SzPQe2S3J
 BwkNIyuq+RPwzKG6m74JCSSwQGDBXZ5VOSZaUPj7t/uKoprrt9H5XBS1LzpTp69SR7CP2xrV
 8URaRw3avINYBudfEDYi4xxCtcqP2/aG8Q9jHsCuAwfVsRn2bWEtOA7b3Ps6cuCCS61X3NEG
 ja1yVc+vvfNhHzroIyOuYVIW5MblI752kn1OSed5fIAAHCTZAPwHOKdlu8eqRaUq6LBPE5qQ
 t7+ciBm6uyezDj0A7d+Rt9LaQmyRfqfeqCRCaNE/VP6dq0JBClhbar+te6iHPPcgSAAn5ozb
 FtRAg3dcRMij4rkY0x3GyTc8XM0zwYumobxypmmF7r0pWh+0HBEyh9QFXkvqk=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="44331678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkBWrQJskZdbF3bwRGFqRxUm4BUhF5+duVbTnaV8lC9uHbfC4w7l8dZi7sodtOyzmG1D8oySR+Tfy2b7w0GBMTvxk+YVje8AkE9UVyyoVemUrqBPG8IqLyJfL8K7wUs3XrA9JKUpPNSlcwxMYMd1WScnbDjaUbAzfBBYQ1seMmww/0CI/Wo3waMxRIps0vOXQqQ5syFBhmKhCxhkKjPNiYaxhaDEtWfYfNJ68HI446ZAQl9m8KAtOxPvZzunMzQLYH6BJICT+ZJwH2Gi+Hq72pLNhDn7bOGdRr1IcQiL1ldhGSHhGwotVhhbU2HZBpp2doODRY8D20YIWTXu9/ePmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgb30KFYcBaUuDasLfF1eBFyIimrl8aSOAVxfb7Zs3E=;
 b=WjJx4oZy6hRLrLgo1lK2iX4xx/iR75htJThriuiY08Ld4Mgct0b0sKDRFoqTnZGrIZSltfWbd/zW81OHCbQOIkLDEdQSuH+bUJ4JGzgE0ksNe7QUzt62FE3Cfsa2xLhLPKjbprlcwTt/zofIIAXcyN5++ifT4pmK2v/V7IdZiAiR8c/EkPsStyULR0zVg9AFspA6uiN9X6varaxn8MzI77Vi6OEFNA2+wMQGUZJn/b+MuFnuQ6Zwwr3Hxk4LJRPE7+lzqRnPKVM47BcI0dlbZ/0OOq5cQIBlil+GwMxaGiGIqyXNyDwKK4Y1ZXbuehd1zvwgY2VeuOEXDXGHBwGQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgb30KFYcBaUuDasLfF1eBFyIimrl8aSOAVxfb7Zs3E=;
 b=rX7iDPuu3pLc6HmZAvYxcyCJaXl+xcdEYkUxS5bx67c8mVLzLHGNL64J8gMn23ZHZT5VOu0L/fftApZyuKBWZPoWvjQUuQKfWgJX7mZS2wox6WkdYgZRnR5T7liZ7waHB1ZDGv8vc0mJjveyjANN1j50dW2zTZOoQSadssi7jmk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3 01/13] libxl: don't ignore the return value from xc_cpuid_apply_policy
Date: Fri, 30 Apr 2021 17:51:59 +0200
Message-ID: <20210430155211.3709-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f5d6a9b-15ad-4092-de43-08d90bf01d65
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923702E9408595AD199409D8F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBoySspwKzEnKdv8wZig951N1yfvuUMCFO8N19jCqTWGwPJ9MwM2LhoAUZ0C8fBHMFmjmf50HeoBBhx1NEuXJiR8eH4Je/EeLmi9cmIlhfnkGEJlYDb8cYLGQOnMHLqqSatHQfXVr/MnljaDtL0juo8giIm6UnLmo+DMafnffx18FMWU9oJajA/kCmYOViHybNt27yaDwsFza7cu58WsW2RyMSQmRmVZNwP677DJ84ZtJ4hgg+CbaA98EzV4iEiiin6C9fpRYq9gKKmVu/4V7ewL4g1C8DWNphTn324PfkDSl02XP93d/Og9gvfNoMP/WeeHejkgfr5PjKKcV44narkC/sk23+4MMSduyH4EilVcHggNOTnpfjqFvL2CJAeQjTQCbAUf4L0G3nYNb2TTRKwcMqbXVHAT6zr0mOgnDNmh14WjD3kgpRWFWQoUFoHJIY0kTiAkSefRwFP1A9/Ja/A4y4B3jpmhv+RyV9cW76l8bP29qrvy8Tw1Hw+oFR6/JrB69it+QFJDF1mwbcgQ9mZrZa50bnJH+drwyg1Gu3IqFQmGao0vzBxD0j8FJ9KQ2HMSxmj+Y5q6W7OYk7BdCNAhUEK6XzU0PzW7/ZMmAoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(83380400001)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWtxWXdzRGNDNWRKNWJxR3R6Y0ZnTnhhdnc5Vkorc2IzY3JyU21FMFA1Sml3?=
 =?utf-8?B?WTExZXNONXdic3VPTjY0STFBUTJKY1RaaDBqbzB2YzlJR1NLZHRzd3QwcW9M?=
 =?utf-8?B?N0hyNUlTaS9Iek8wZS9JaHlMUWt0UE1OQllNVXlFbEdsNFhYMExLb0Erdi9i?=
 =?utf-8?B?VFh0VnpsTjdxQklOS2pzZHMzN1QxZE1XanJpczBJTmFQT2xBUW5yVkVReDFS?=
 =?utf-8?B?UU13WGRhVld4UXpNdTY4cXVkNTYwQU1kQzd0dWxjZVJxNlNnMjlnU2d5V3Jw?=
 =?utf-8?B?UDF6SnhDVHA3UFhUYmlFSG9oZkMzd3hJaG5KRmdLckxFdzNORzlRSXVUWWNp?=
 =?utf-8?B?aFdYOS9ubUpPVjNzaWVDYlJFNGh1QUJyMEpNMHFuUk14dVhnK0xsMnJtTEVs?=
 =?utf-8?B?Z0tMdmFaRFAycHdleFlyeHU4SXlWZGI5eWRWTG1sYkxtVTZmTktYYTJPS05S?=
 =?utf-8?B?SktyTmRlRVhlMWZsRG1uRDFLZDFBaENZSnAzM3BFeXd1TmR6RXpXM2dWL2hU?=
 =?utf-8?B?aVBjVmNYRG9iTnkvOWRiUW5KL21ZZE9BdHJJbW9zY1hCTExWaGxyeHVHU3d1?=
 =?utf-8?B?QlRBRitlUDNPWjhPODJLNlpPem5IZjRwUmJ2bzlCeVBMRlBaRmNCOVhFUFF0?=
 =?utf-8?B?bEorME1tSmpNMnYyT2JxRVZJWjBnWUtleFp5ZnRHRUNkQmFEK0JlN0RXaVRi?=
 =?utf-8?B?V1I5WEhkdEJ5b0VMK2EzK1dxMEFvSk9EdEhEbGY5MXVqd3V4WkkyOFpiSlBJ?=
 =?utf-8?B?MXdNL0NldzVMcnQ5emNMa3VDWlQvbUZISUxHaDRpL1ZaYXRHczBjL1RBTkZS?=
 =?utf-8?B?dFliRitjRzljOCtZWTZ4bmZ2bFBXYmFRUVBUK3BpK2duWCtNSlJ6UVBqSFdi?=
 =?utf-8?B?UnQyanhibWJXNno4cms4Nk9TdWVad3NUdi94RDRidjR1TUpBeTJWZ3ZoTEcz?=
 =?utf-8?B?VS9UU09VYmV1TnJreFE5SWZJeWJzUzFGZjZ3NEx0RStENzNNR0ZEcnF0U3h0?=
 =?utf-8?B?SW94TFFPMGgwZW1DU0ZKTUN0NTJXY3c2T3RpQ0N6eTQvVm5SSWpwOG40V2Ri?=
 =?utf-8?B?dU5KbDhjSDA2N3c0TTVHeGxvaTVUZnBJWGJwbVh3T1hLTXI2TUdjZUlwZERC?=
 =?utf-8?B?QTNWZXVPQXBrMVkwazQrOTlheUFwMHZuSkk2cHVyeExTUWhkNFFmZ0pnNmRS?=
 =?utf-8?B?bGZlZ2tJN0xvZFlyeElUV1drRHhTTVAzVXZkZ05ZN3dMdkgzSmo1RkUvb1BM?=
 =?utf-8?B?Y0Zzd1FiM1dEZjlhTDB0dHVyVzlVb1MwUGxzVWN5Y3F5NTFhSkZRbmMyTllm?=
 =?utf-8?B?bEQ4MHJkRU9MU1JsTXloczVjSi9PeUE1MWpiSysyaTZrMys0U1FWVmZDTmxt?=
 =?utf-8?B?Mmd3ZldPZXNONlNMVExEL2M2REtYcWUrRmJpRkdsUE9XeDl4Q3lGYWo5VDBC?=
 =?utf-8?B?MDVpZ2ZBSXdsVVRLTnJmSWlHcEpUcTQ0VDN3STN2Sm5kUXF6VmlJeEh3Q3BO?=
 =?utf-8?B?Q1JwbnRUWXhieVRwU05XZThWamM2bHlueEVBdnZraVdQelhBM0UySWVZSzhD?=
 =?utf-8?B?bkcwOWFEN1hCU0o1ejRLT05pTHNEc3B6RC93OTlrQ3czb05LeVMrNXZkeDdT?=
 =?utf-8?B?RmFObjJkVnRkeFhYdWYvTUtmZ1ZURnpwckJXR0NBZmdzR2ZNVy9JUVp1ZkdL?=
 =?utf-8?B?NitvN09wWUN0OWVieHYxeDM1WmNzWFN6djVIcGV3SFkvRzV1a3lEOXp5bFFi?=
 =?utf-8?Q?BF06MdsqccBx9RcbRxd0dHCsD/Jhws4XyNHcVwf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5d6a9b-15ad-4092-de43-08d90bf01d65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:53:36.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93V7NCGb8vxD3WefAtltGzc+FJcV16TnQWKHOjYT4barX0uOkAQ6mgLXWMnHoyxO1GqHJ3e4ORh4/kKjGOoKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Also change libxl__cpuid_legacy to propagate the error from
xc_cpuid_apply_policy into callers.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Use 'r' for xc_cpuid_apply_policy return value.
 - Use LOGEVD to print error message.

Changes since v1:
 - Return ERROR_FAIL on error.
---
 tools/libs/light/libxl_cpuid.c    | 15 +++++++++++----
 tools/libs/light/libxl_create.c   |  5 +++--
 tools/libs/light/libxl_dom.c      |  2 +-
 tools/libs/light/libxl_internal.h |  4 ++--
 tools/libs/light/libxl_nocpuid.c  |  5 +++--
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f32c5d3a6f6..eb6feaa96d1 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -426,11 +426,13 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
-                         libxl_domain_build_info *info)
+int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
+                        libxl_domain_build_info *info)
 {
+    GC_INIT(ctx);
     bool pae = true;
     bool itsc;
+    int r;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -469,8 +471,13 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
-    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                          pae, itsc, nested_virt, info->cpuid);
+    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
+                              pae, itsc, nested_virt, info->cpuid);
+    if (r)
+        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
+
+    GC_FREE;
+    return r ? ERROR_FAIL : 0;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 43e9ba9c634..e356b2106d4 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1434,6 +1434,7 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
 
     libxl_domain_config *d_config = dcs->guest_config;
     libxl_domain_build_info *info = &d_config->b_info;
+    int rc = 0;
 
     /*
      * CPUID/MSR information is not present in pre Xen-4.14 streams.
@@ -1443,9 +1444,9 @@ int libxl__srm_callout_callback_static_data_done(unsigned int missing,
      * stream doesn't contain any CPUID data.
      */
     if (missing & XGR_SDD_MISSING_CPUID)
-        libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
+        rc = libxl__cpuid_legacy(ctx, dcs->guest_domid, true, info);
 
-    return 0;
+    return rc;
 }
 
 void libxl__srm_callout_callback_restore_results(xen_pfn_t store_mfn,
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 842a51c86cb..e9f58ee4b2b 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -384,7 +384,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
     if (!state->restore)
-        libxl__cpuid_legacy(ctx, domid, false, info);
+        rc = libxl__cpuid_legacy(ctx, domid, false, info);
 
     return rc;
 }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c6a4a187f5b..44a2f3c8fe3 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2052,8 +2052,8 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
-_hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
-                                 libxl_domain_build_info *info);
+_hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
+                                libxl_domain_build_info *info);
 
 /* Calls poll() again - useful to check whether a signaled condition
  * is still true.  Cannot fail.  Returns currently-true revents. */
diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
index f47336565b9..0630959e760 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -34,9 +34,10 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
-void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
-                         libxl_domain_build_info *info)
+int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
+                        libxl_domain_build_info *info)
 {
+    return 0;
 }
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-- 
2.31.1


