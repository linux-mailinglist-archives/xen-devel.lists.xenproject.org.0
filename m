Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F24BBB89
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275553.471483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4jN-0005bR-4K; Fri, 18 Feb 2022 14:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275553.471483; Fri, 18 Feb 2022 14:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4jN-0005YO-0s; Fri, 18 Feb 2022 14:59:33 +0000
Received: by outflank-mailman (input) for mailman id 275553;
 Fri, 18 Feb 2022 14:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL4jL-0005YI-D3
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:59:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e1f5e53-90cb-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 15:59:29 +0100 (CET)
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
X-Inumbo-ID: 5e1f5e53-90cb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645196369;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3EwvVF/KPonXNYvygcxvUjcnvz4g9uUo0FHyIlWlzu8=;
  b=QCfdnzhXIfcwQ5jKBNVaInKcpyMBVA9EPlDTi+rp1SHcFPf5sTwNeqje
   rA85Mx7+viL2OxgDPDw2SmrMKG73L5UV9RgpYv8FJ62+V5SnSsNE90uVH
   0r3ao2Osp8oeNgZ5rUGWfMyiHC5EIuBG25hUWcoDRPU1Y71O25w2TaVSs
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66768096
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N2YvuaDxtNIQtRVW/wPjw5YqxClBgxIJ4kV8jS/XYbTApDkngzxUn
 GMbC2+BPPmPa2qme9AiOtzgphxTuZOAydFlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhS4
 5Jx67C+ETwMJ43Cn8I2DzpRHR9HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4QQqiOP
 5tHAdZpRDKHeABNHm0XMZIZmbylmVauQg17tU3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIlpLI+80GDRdDnUxq15nWDu3Yht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOl+RxeWIG2
 AeyusrJCztJm+G2QHyjz+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Q2f21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshSXPlhdwTXGY3h+Y1FAd7cYVUwZnY1QvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MqOtjtU5V2k/G6fTgAahwyRoMfCnSWXFXalByCmGbKhzy9+KTSufpX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClA4QDp4U6eJm9vMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:lciHDKGsRBZQiltzpLqFTJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNBICPoqTMuftW7dySqVxeBZnMTfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIU+rIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="66768096"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvbFzb1UaZ2osiCQYWZSrKuSxSKnz/B0U+6iA/oFLohgr1wNTmK/OsQcaTuD+zLy+312UWsM+pBrbieaMJ+QB5ExrwCDHeJ7VNmqWDr5nO29VMX0oNCI7S1n9DDzcSzCjqIY55GRoTgpwFBUcOye06+ACfngDDqf4AdmQwKEn0tMLNE4Xu4Q41LxKXH9Pa9912k9QRPVYDQXmn8aYwIrcQYtwWvbev9vxmvM8eTR5mvUtUisgtkDe0ujJgIFtuyJOlQPdPPbQCSFHLONvmgC+mleGA7O4Y8utB4OkNHt5R2IVNYi5mf1Un6DhE4qzHMBQhRvoFi2caCP4dhFS22tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EwvVF/KPonXNYvygcxvUjcnvz4g9uUo0FHyIlWlzu8=;
 b=E1+RgojrsPkMG1mIbePP696GTBTeCwWB3ZHf4K+dIKhtnvSL2ztnEhqDSp+ozaWyeTIKR1Yq7fo6evznh7FsZLc2RRJBcJXm7CTdICkBwyxKx/QPuiuvUaNmEe2CfTnK9zg2HPt9Dcs/WpS3e3ur08bkgE1qzwzfx0+YhywfYgC25w2mICQHIIi02kULOtpKILq/eFLx26itTDrCUrRgCy8htzomuN97U6IjZC8NSmzW+n3zyR8hO6IsTlW7za0bbos+aCS4AxLIGNGLfYsMRFXzFXLf/k99PcH41+sOtY59SNgw/dbKlYOPk270GIxnMI0CavHdl+L/fAJVpVCcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EwvVF/KPonXNYvygcxvUjcnvz4g9uUo0FHyIlWlzu8=;
 b=AsE6xAXwAt/rNTRZ/X97Q29Co/WGbw5jPNBl6vU60H2zdNkAn6B8sNwURFJm8bXVYCLu+hRQUakFkH4roJ9BtqvBIWq8xCd0lTkaLrD3oCnnkmF1Y2H/UP2wmGaO8mi2ejSJT86tixQfJy1+jpl54dPBFdFO9bqzM2yeN+77cUg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Clean up alpine containers
Thread-Topic: [PATCH] CI: Clean up alpine containers
Thread-Index: AQHYJMoUO4xl86uH0E6ly+blvuakQqyZYuyAgAADuwA=
Date: Fri, 18 Feb 2022 14:59:24 +0000
Message-ID: <b5beac90-cec0-1548-829c-e376be107c3c@citrix.com>
References: <20220218131811.31133-1-andrew.cooper3@citrix.com>
 <Yg+xK0xO3Rk8+xZe@perard.uk.xensource.com>
In-Reply-To: <Yg+xK0xO3Rk8+xZe@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a8cd335-857a-4ae0-1806-08d9f2ef40ad
x-ms-traffictypediagnostic: SJ0PR03MB5407:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB54070F374D408FE125BDC52ABA379@SJ0PR03MB5407.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T2kUwP1givDGshHl5xYZMIm4RUf8aNyk+0DcxxeZOXNU/zK0+jtSOsRXH4z9Gwqq1SxWiYyeH4HT864bS4EftlIq+8iqbQ88zXS1PLUQ77TwSRxMZYKiNl0iQGkcUcox0ddqnSdieX1YpzZH9mfxoZ5CD+dAD8JfK1CvCG6TFQ5kOm6i8WahBVBURb5YaTdGgcxT9FzA0QDb6yGfXVbJ8ds8hVbNnoNX3msm+ubnqd5twy884kmTfYilRMyBE4T4HiYfDyIkNjyOmbIfoUx3+sHY4UmMAn90GUC50kFVkZc9QjsuRJwP2VBJKXfnx8hB2P+lRIFrY7ZJGz/Hggt/RCpOpXDT2tg11q0eAwKBcZKE++EUTyXCb9lcSOkcCVr5McVNzABAxTb6RXk1RREaPDjY+OMsJI1FmnqXezB+oCVwvi6qF2AUP0oWu8j1PQ4mGb3eCcZ7L+R+1ioiyRL8EhcfR/1vXvPUUhWDaIx8IAFB3hPuvARQJBYBMYotd55bSXSTrw3PtH0zpsL1VebieEEtwVlSdacUr7skDkecEssRkmS1UKKkhCWI32XFL77XfqK/wzcf7OanGd24wyq63qybI0YFcAA7ZU8+E0xJTRGl4J5+STkdkEAsQFNsv834QwAr3QhGKZvB7eO0qhVa3D7xQ7b91if1dpSVCzRykEej4OFYjYpTrS0ia4VQUfZH76Yl3xpyhsPIKrBbOBrt0WKsXxZHkq/BW6BWdBh+j58PfjGSjQNBjoNsferWc1Cv8PiF8j4VD3kzv3t6iYcCOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(122000001)(82960400001)(71200400001)(6486002)(53546011)(6506007)(36756003)(316002)(31686004)(508600001)(2616005)(6636002)(37006003)(54906003)(8936002)(66476007)(66556008)(66946007)(5660300002)(4326008)(31696002)(6512007)(26005)(186003)(91956017)(38070700005)(86362001)(6862004)(76116006)(2906002)(8676002)(66446008)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWthZVZVVi9LZ3o2S3dzSHR2YWEyNWcwWVUwWmNpRHFPWUc2SHZqWXlTSk9h?=
 =?utf-8?B?TnF4a24yRVpkRkxJdmsvdTFJUG01S2JTcXZ6Vm9PcEdjcituOVg4OGt3SDc5?=
 =?utf-8?B?M2U3UkxUL2U0TEplOCs5TmxVamtLcFBnbFR4cXV3eXQzcnNDSHNVY05Ma3BD?=
 =?utf-8?B?alUrRzMvMlBPblVyaW5qc2hIRWFvMUNOSDNGS0I2L01lV29lSWpFYlZYNE5U?=
 =?utf-8?B?WjBjbWwxM2trOUJvdUVpU0NNWThMUVJjYnRNRGVyQU52Sk56c3RmV3AzWUI3?=
 =?utf-8?B?WkxOVjMvR1ZQaUYzdnlpN3VnKzVXdVJnK01NV09kRkdCSnlUTm5UcHVnMDY1?=
 =?utf-8?B?MzZWb1FTT2pzamtuSlAwejJSM2R2SE1TNzh2UEV6ZHVZRi92MFlHM3N1Y0Rx?=
 =?utf-8?B?Tk1zeFlSdUk5T0VtcnFGZjlPZENXOU8zd243WVpRcTR4VjhyOWpvTDJMK294?=
 =?utf-8?B?WWxub2l5anlxaDZIcVNmTzB6M2FXVlpBNXNsTzNCSk5vY1Z4YUh2dmtQeEYw?=
 =?utf-8?B?Tms0cGlpSnVRTGNvRHVHSVpqZWw4WWlEM2t5dGJUVWFpanJQYUVKTFlPZ0lu?=
 =?utf-8?B?ZUR2UmNmUE5WaGN1SFA3SElFQXNmZzJKVTJVNEt1TmNqbSs1K3NmQzcySU11?=
 =?utf-8?B?cXNPWjFEZjBGdVhXUXhwM1E4R1ZBeXV1Y3N4bU8wWjRBeWdzeUtRU1pnNzAz?=
 =?utf-8?B?NCszZWxKREJKZk5CcVJna1RuRE5EQ09NNzZ0T1RmRzFHZ2p2Mkx5aHdONUV4?=
 =?utf-8?B?QkJPVlFsYUFieDlTMVhCdnBsY2dqR2hWZFJiQXVZRHA1Z01Mc0JYcUxiTE5l?=
 =?utf-8?B?TlE2K1VEbTBlWHdUdkQzU2IrSFIwd3V4ZCtGMk9obUFYdy94U1FKUGNNc0Fr?=
 =?utf-8?B?UitQYWVraFpwOUFIWFdGUWQvUzVCcWs0a3RocEVtN09VRzBuNlJNVUZmOTRC?=
 =?utf-8?B?T0pJTnRVSE9RQmhMMDdFeGhkUjBrMXAxdm43c20vbzZ0NGJGL1A3NS9jMWQ1?=
 =?utf-8?B?bFVhZGR4cHc0M21ieEkzaEJzMjNVRDdxZlNhaDBaSzQwWEtHdzFYRXRyeW16?=
 =?utf-8?B?Y0c5cTB2KzVzcFZBSVdzQjFsNVhPUjJkQURUSzErZVFjOGFDYmE1SFZjNmRV?=
 =?utf-8?B?aWRYcDFDZXljNnpjTWlZNVo2OG9PRStVQmhienpHcGZJWW9rM21OL3JnTXR1?=
 =?utf-8?B?Y1JReFB0dVJobWlCOEhmYWlKUDV3RVpsQm5kS2xSbCs1djZjZW11dVpyYi9H?=
 =?utf-8?B?d2FHck0wbTAzblNocURSU095YnVMT0RkdE45OHpyN25GNXIweDduOFpFbnRF?=
 =?utf-8?B?eXBldnkxeW9aaDFCYTVvZ0Jqc2ljbzRUeGgrbE5XT01lOEhXWmtFZEc5Uzkw?=
 =?utf-8?B?NnFlR1g2U0R1b1NaTFBKMzNPTjFDbHU0TzlsOU54NmlIeUFEK0lhUytUc21R?=
 =?utf-8?B?VVhQcFduTTFZTnB2Y0x1cWwxZXhMclpHWVMrVXBvV3ZNZFRScm41WVpQdkJ1?=
 =?utf-8?B?THE4anJKMzA0Rk9LZTZwelVhWnp5aDhaajYvb2V1UVo5MDhKNWYrNitFb1E2?=
 =?utf-8?B?eHB5QUVGTFZhVkcrbmhKRlBaVGpJZGZ6Q241RnJYcXVOejZSeHhzOEg3Nk5r?=
 =?utf-8?B?blFVejlnMmNPZWs2QkNvWEpyTnN5eThjblNUQ1dXUVZjUWgzNVZ2SnFPS1I2?=
 =?utf-8?B?T0ZsZm1ndVg5WGJiTmpzR25ibXp6VWFHeTRKV011U1MweWZKWFNkYVE1SjNN?=
 =?utf-8?B?d1h5cjE1OXV4R3NJcXpTRTBEZmNPSHBsRWV2YVVFbGo0L2JKaTlIQjVOWi9k?=
 =?utf-8?B?bDRuNUdtb3pPRmtqUU9MQTZtbitoVW80TllMQVEwRVhwZUorZ1VvaEtiQU93?=
 =?utf-8?B?eDgwS3VwL1hCVU1iNVQrOVRsMG1wZ2lqbk94WmtPQ2REUGxHUm9YL0pQL3ZV?=
 =?utf-8?B?QXpmREcvM3ZtNndVTFhIUm9XdGFyVmFKbWxKS1UvNWcxR0VPVGM0dXN0M0JK?=
 =?utf-8?B?YStYNG1hMzFnTHM3UllLRU1nb3BTOVE2SlEvSWt1RWNoRXoxZldlWWxwbFdZ?=
 =?utf-8?B?ZHUxSEFxVXdLaGsxcjNPcG4ybjdxRHQreXFLQXZXckM2ODlvT3gzY3pqL2Nr?=
 =?utf-8?B?RU9pV0M5dEUrTURLc0hLU1RsSkxCZkMxRElNZExhN3prRFVETXlnUSt1Q0pX?=
 =?utf-8?B?OTFUallmZURUQ0VXVCtNQTZObmlDWGNWSkE1cmFlY01PRkVYc2tjUldiMFBK?=
 =?utf-8?B?NzNVaGxZYTVuL1VuQWFKQzJGVTBBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6CE50F7C1BBBE4B893FBCECD820517B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8cd335-857a-4ae0-1806-08d9f2ef40ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 14:59:24.5045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtzltdBtAmUBLXYHq62dt50tTFAJ8JlqFoQLeP+hoLVtn1LXnh3q2+u+veFmD38aelpCAklAjBhrigsRpAO1xnLtwtgG7V7pfwrJAm/TQg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5407
X-OriginatorOrg: citrix.com

T24gMTgvMDIvMjAyMiAxNDo0NiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIEZyaSwgRmVi
IDE4LCAyMDIyIGF0IDAxOjE4OjExUE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAg
KiBgYXBrIC0tbm8tY2FjaGVgIGlzIHRoZSBwcmVmZXJyZWQgd2F5IG9mIHNldHRpbmcgdXAgY29u
dGFpbmVycywgYW5kIGl0IGRvZXMNCj4+ICAgIHNocmluayB0aGUgaW1hZ2UgYnkgYSBmZXcgTUIu
DQo+PiAgKiBOZWl0aGVyIGNvbnRhaW5lciBuZWVkcyBjdXJsLWRldi4NCj4+ICAqIEZsZXggYW5k
IGJpc29uIGFyZSBuZWVkZWQgZm9yIFhlbiwgc28gbW92ZSB0byB0aGUgWGVuIGJsb2NrLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo+PiAtLS0NCj4+IENDOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+DQo+
PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+IENDOiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4NCj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+DQo+Pg0KPj4gSSd2ZSBhbHJlYWR5IHJlYnVpbHQgdGhlIGNvbnRhaW5lcnMgYW5kIGNv
bmZpcm1lZCB0aGF0IHRoZSBidWlsZCBpcyBzdGlsbCBmaW5lLg0KPj4gLS0tDQo+PiBkaWZmIC0t
Z2l0IGEvYXV0b21hdGlvbi9idWlsZC9hbHBpbmUvMy4xMi1hcm02NHY4LmRvY2tlcmZpbGUgYi9h
dXRvbWF0aW9uL2J1aWxkL2FscGluZS8zLjEyLWFybTY0djguZG9ja2VyZmlsZQ0KPj4gaW5kZXgg
YTFhYzk2MDU5NTllLi4wMDZjZGIzNjY4YjMgMTAwNjQ0DQo+PiAtLS0gYS9hdXRvbWF0aW9uL2J1
aWxkL2FscGluZS8zLjEyLWFybTY0djguZG9ja2VyZmlsZQ0KPj4gKysrIGIvYXV0b21hdGlvbi9i
dWlsZC9hbHBpbmUvMy4xMi1hcm02NHY4LmRvY2tlcmZpbGUNCj4+IEBAIC04LDQ2ICs4LDM5IEBA
IFJVTiBta2RpciAvYnVpbGQNCj4+ICBXT1JLRElSIC9idWlsZA0KPj4gIA0KPj4gICMgYnVpbGQg
ZGVwZW5kcw0KPj4gLVJVTiBcDQo+PiAtICAjIGFwaw0KPj4gLSAgYXBrIHVwZGF0ZSAmJiBcDQo+
PiArUlVOIGFwayAtLW5vLWNhY2hlIGFkZCBcDQo+PiAgICBcDQo+PiAgICAjIHhlbiBidWlsZCBk
ZXBzDQo+PiAtICBhcGsgYWRkIGFyZ3Atc3RhbmRhbG9uZSAmJiBcDQo+PiAtICBhcGsgYWRkIGF1
dG9jb25mICYmIFwNCj4+IC0gIGFwayBhZGQgYXV0b21ha2UgJiYgXA0KPj4gLSAgYXBrIGFkZCBi
YXNoICYmIFwNCj4+IC0gIGFwayBhZGQgY3VybCAmJiBcDQo+PiAtICBhcGsgYWRkIGN1cmwtZGV2
ICYmIFwNCj4+IC0gIGFwayBhZGQgZGV2ODYgJiYgXA0KPj4gLSAgYXBrIGFkZCBkdGMtZGV2ICYm
IFwNCj4+IC0gIGFwayBhZGQgZ2NjICAmJiBcDQo+PiArICBhcmdwLXN0YW5kYWxvbmUgXA0KPj4g
KyAgYXV0b2NvbmYgXA0KPj4gKyAgYXV0b21ha2UgXA0KPiBTaW5jZSB5b3UgYXJlIHJlbW92aW5n
IHNvbWUgb3RoZXIgcGtncywgSSBkb24ndCB0aGluayAiYXV0b21ha2UiIGlzDQo+IG5lZWRlZCBl
aXRoZXIuIFdlIG9ubHkgdXNlICJhdXRvY29uZiIgYW5kICJhdXRvaGVhZGVyIi4gKE1heWJlIHRo
ZQ0KPiBhdXRvbWFrZSBwa2cgZ2l2ZSBhY2Nlc3MgdG8gc29tZXRoaW5nIHdlIG5lZWQsIGJ1dCBJ
J20gbm90IHN1cmUgYWJvdXQNCj4gdGhhdC4pDQoNClZlcnkgZ29vZCBvYnNlcnZhdGlvbi7CoCBX
ZSBkb24ndCBoYXZlIGF1dG9tYWtlIGluIGFueSBvdGhlciBjb250YWluZXJzLsKgDQpJJ2xsIHN0
cmlwIGl0IG91dCBhbmQgZG91YmxlIGNoZWNrIHRoZSByZXN1bHRpbmcgYnVpbGQuDQoNCj4gSW4g
YW55IGNhc2UsIGNoYW5nZXMgbG9va3MgZ29vZDoNCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpUaGFua3MuDQoNCn5BbmRyZXcNCg==

