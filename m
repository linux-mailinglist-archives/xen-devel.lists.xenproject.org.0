Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241233F8328
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172768.315267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9rg-0006mP-BE; Thu, 26 Aug 2021 07:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172768.315267; Thu, 26 Aug 2021 07:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9rg-0006jp-81; Thu, 26 Aug 2021 07:31:56 +0000
Received: by outflank-mailman (input) for mailman id 172768;
 Thu, 26 Aug 2021 07:31:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ9re-0006jh-MQ
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:31:54 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 305dd24b-4ae3-4abd-b3f1-7835cd594043;
 Thu, 26 Aug 2021 07:31:52 +0000 (UTC)
Received: from DB7PR03CA0078.eurprd03.prod.outlook.com (2603:10a6:10:72::19)
 by AM9PR08MB5938.eurprd08.prod.outlook.com (2603:10a6:20b:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:31:40 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::4b) by DB7PR03CA0078.outlook.office365.com
 (2603:10a6:10:72::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 07:31:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:31:40 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Thu, 26 Aug 2021 07:31:40 +0000
Received: from 12f7027c305e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 73DD2B97-5146-4DC0-95EC-4738105F56D0.1; 
 Thu, 26 Aug 2021 07:31:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12f7027c305e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 07:31:30 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0802MB2598.eurprd08.prod.outlook.com (2603:10a6:4:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:31:28 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 07:31:28 +0000
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
X-Inumbo-ID: 305dd24b-4ae3-4abd-b3f1-7835cd594043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklQ5srt9Mp86xBFA7T3TX5swikPbzprfRwbRsWOg1M=;
 b=Uy9Jk83PDcHHmf7ncdoaK12K8eRviWelv9nqxkM0TIPWJB5kHO9WASFFDpEFyCc/iOReAfDfgzfhisVt5sQUATMGw+pNUnQ+UewhJ/wGcnNMtXRcho/P/s8532C6M+qxJ3R7FF2Xff0lEMOfYh2vbb69DtylqBP3/X4SuqIm/V0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbRHwR2S/DyV1SIOtSCLecOiFW5Brko2H7y93VPkYh1yrRsYWCHbjfZUPQN/qerTwm19AP50L6FDFcErM7xBV/LemnvKHk3B4PclM6ramAgxfF8g3n9s+rKtkFjQGukgj37gLG55nwpCHl2LUwiA8PZ5rKi8krQRHDJEqBZWKnGaaX0YmkGQRx00UUN5Zgo+fpe+RJXfy0Fvr4MqCqUtoOnovMe6OKc/cLUbh1YEUa1RwLr31OVQjkDjI2BrCFNRFKC81Pnvz6HhnvRTsMaRQI4W9Fl4iPnXN6k3hyQycLOBXytyuSrS7/zF5aFy0Jw7Dkd7mjp/Oy/xqUM9tCNX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklQ5srt9Mp86xBFA7T3TX5swikPbzprfRwbRsWOg1M=;
 b=QBE8dpzmWx6iVXixSJDFIsYNbRtM5CWmBQJp5BN/skM9aQ9/IogPfPofPdyn9iUeJIWiVbBWVICQjUaGE9Dst12D/gisL3rbPctfhXDP4kgxPq7tpORfczsUKNmz3By9hsFMIwJRbjc0hBVKyVO/JnPDUo4sfCyqfiU5fFUgElyieqWh8yE/briJlv4n6rpdW0Zr/rNqlkdHlxTj90Jyo05XGZiSt+sml6B2IOS9V+i1uekGTQAAXzw9PBp9hXrX5FovRhMLWrFxrb6bG08NdfcQUEP2h6o152383ej4ga28eYxsE8BNelkHkCXuAhHqjt3C7WDAJo8LHfVuA8bRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GklQ5srt9Mp86xBFA7T3TX5swikPbzprfRwbRsWOg1M=;
 b=Uy9Jk83PDcHHmf7ncdoaK12K8eRviWelv9nqxkM0TIPWJB5kHO9WASFFDpEFyCc/iOReAfDfgzfhisVt5sQUATMGw+pNUnQ+UewhJ/wGcnNMtXRcho/P/s8532C6M+qxJ3R7FF2Xff0lEMOfYh2vbb69DtylqBP3/X4SuqIm/V0=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: RE: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
Thread-Topic: [XEN RFC PATCH 00/40] Add device tree based NUMA support to
 Arm64
Thread-Index: AQHXjpsd4nR+5Zr0JUK+Jd3HYcfrq6uE//aAgAB7ZxA=
Date: Thu, 26 Aug 2021 07:31:28 +0000
Message-ID:
 <DB9PR08MB685702F4EC63C0DB293E296A9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <alpine.DEB.2.21.2108251644150.24433@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108251644150.24433@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D3656B7D20788D4CB8D3300516947685.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ba766ca5-f500-4250-8541-08d968638be0
x-ms-traffictypediagnostic: DB6PR0802MB2598:|AM9PR08MB5938:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB59381746299B744AF93EB82D9EC79@AM9PR08MB5938.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kKC1Tlk36958uOt1PM+0vTLmWA2XhyJiZSEVSGv72gcSVM/Skmq9Eve0WHr1EeYxD1hbSKf5WaEKRoNskt8RBj2jz/HU3dKfRUC75A5I1DtPGQqQx/jbuOE8iGyvF2QdDperdIL2Tn19mPFBMsIu0+LRb7X1yj9Tag1qSqRxOtrDXQqstLxXDyF9RdLGNUcENSY/rjxSG7xCY+/g89viBQOJox7XS7lk7RwBWKf0i7Mgwz58hl5RzcJVFbMy4t8cdWTLewbeQeia7zRtFyoUo4GroxdiTyI9uYfD+7SjfBMVorxRZKS3kYr0vonocf0v47JofW/3D0u08UhyNscE6G4mrTd/CyPKz0kxb5XbTFVC2d8eowQm9UnB+ahS9vCUn+rQRDEwqcY5foDq0AI1qNLnBZ63wuwY/sb/7EI9oR2GwOnuzAnnpvtO2rca6wovwpo9b6gxDXF9hq8RHCyRMOoXQU3OYyl+Vt98XwxZKfJqmJlMlG3RAZ//mKBycHHDcuLGjIhldpgVzm5cSnInnFDAa2mPkeQVpGJwDEe87w/aVrax7LA8hP630VE0LiMmcpQRZhfL8Zvz42smKZIfXqqmLgpk9ZYPAJ3BMIR65LTixZc3N6dLj5PRFKclZH24dv91GZ5P6C7Z328jZ38dEcgfWXdbMnNiELOOQ9o5ggInlJKS/Q3QF/12mS85YdWm1cwNQkZaBwmI271Ca6sXYPLQ6QP/oqyLyW4YFPR0HY2tc5l2SbCNx1cXHcGUEUPlDFI8Xso4kVaurphQ781PxZnXL7QEnmJaQBH4jdU5kxU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(71200400001)(66556008)(66476007)(122000001)(8676002)(9686003)(83380400001)(5660300002)(66446008)(33656002)(38100700002)(4326008)(66946007)(26005)(2906002)(64756008)(316002)(186003)(54906003)(6916009)(478600001)(86362001)(7696005)(8936002)(76116006)(55016002)(53546011)(6506007)(52536014)(966005)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QjJkV003aHFYR2FIZWxnYjN1elBOVGhiK0w5WjhzVGJFMExzVEhNRmJuSmNi?=
 =?gb2312?B?QUthOTFvTEJkYU1VVGZhYURQeDVsbDl0YS9MQlp2UzIwdmdvM2lkMjFVcm00?=
 =?gb2312?B?U3RLeE9qUXZTdzVqZlZHV2MrVzhrbXVMZWpWR1cwUEZWdkhEc29xTXZOTFpa?=
 =?gb2312?B?Qk1Fa2hFaTcrQnF6aWFpYTRQRWJzNk1lbWdtUXZ6RUYwY3N1bG1MQlRHa3lz?=
 =?gb2312?B?Y3ZzdWsrcGpUYnE5dWFlajRsdVVwOWlyNXlNSzBpYXJGUkg5NEhlM3Y1aU1D?=
 =?gb2312?B?KzBNcXhXdnBsMUVLSE9BMGdpbUltalRCR2YwL1RiOXdYUmVIVVJyWllmc1lr?=
 =?gb2312?B?Szc1SjVMUnd1UVNxU1dZSGtPTUphWklvRTZUQVpjOVJ3ZTFod2Vrd2VjV00z?=
 =?gb2312?B?MFlCVkFabFhVakUwZGZiY3d2eTBZTVFzdFlIRGRid0QxNzRFUXk2Q2Q4RzRR?=
 =?gb2312?B?blczWVRNaHV1QWcydjUrQm5qTDM5OUpkSStZZTZBQWpDTXNVMG1RQWlLVmYv?=
 =?gb2312?B?YTF4b3JOeXBocllrTndHakZQOVlXbWJuM0wvQ3gwY3ZVZ29OV2tzR2JJR040?=
 =?gb2312?B?U2xjcVVHQ3RVQkdPUHpDMWNPazZjVG1uUktUTHFHUkFGUFUveVBYRkZNejJv?=
 =?gb2312?B?djg0VytYS2dLZkRqcDNtcEk5MlZweW92cEQxRE51aTNmYzB5K0ZSMTZ4TFYy?=
 =?gb2312?B?SmNlTnUzUVNPZzVuZkl1TlRMcm1OZmxuZUNwQkZ0N2o3UHlOMU8wMERtT1F0?=
 =?gb2312?B?VFQ0bEY1UVduc3ZhL0J3Tm9GWnFFWFhjdFdJQ0QyMXI5cit4anJJbmFvVTgv?=
 =?gb2312?B?YzBDdHUzY2FEY2N6WHpDWVhsTmRkbXI1bENGeWFTS2FMVEN2V2lOcjdGWlpF?=
 =?gb2312?B?YVBmd1haaEpjSkxIRStVcmlRRnFXb2kzbjZoNHduTVFsRzdXaWpBZWZYTnBq?=
 =?gb2312?B?dmFEUDlwVHhjelk4eFdYVCtmYVJvbXRzMmpEU3UxRmNIN2hzeVMzaGJtT2tK?=
 =?gb2312?B?RGRGZ3VKNS90MkZtM3BzeXo0Yy9DTUZvcWpFRUsxZ1NrUEowaUt2R0thN2x1?=
 =?gb2312?B?VGZBSHJDb3hMQjdNRzhXUmZUYlBhSDJxN3dpbE9NQVFiVnVQZ0ZtTWQ0V2dE?=
 =?gb2312?B?Y2Y2R2lEdk03UDZkeFJxaVZRK2dWVDlCMldoZXNSYVZiYVh1MzJML1ZUTWY5?=
 =?gb2312?B?dW5DYVJLdHk0M0ZFRXNKcSs3dnU2WDU5MW1SNnFrWjlXUHZzbTZON1BFM0hm?=
 =?gb2312?B?bEhHbkxZM2VITFJHQ3o2ZDhUbHFtZm9DeWVoNTA4YmpsRXlBcXRsTGhZalVp?=
 =?gb2312?B?Nis2d0lLNHh2dkl3VWlaVUR3ZW0xVklTcVMyc1lmUkMrdlgycnp2amtjV09X?=
 =?gb2312?B?bDduV0xCdEFFRUtENCtsbWpjTGFUazUzcjJnUEdVNXBRMnR5SXBsVWt3c0Ir?=
 =?gb2312?B?ckhvYjF2cngzNFJxNVpIMktSYVlpalFUaXBDcVdQM1JVOGtLMWxXTFh3NFVJ?=
 =?gb2312?B?RnNudnJhajhkOVYrM0hSOHkrdERPdTVsUzR4cnJRR0tVaUMxYTRqRldyMFVN?=
 =?gb2312?B?ZWpJM1VKUjZPTVZjRjh2VW5Mc1VpTU12SzJQZkVmZTdCN0dNRXM3bEY3Tmhy?=
 =?gb2312?B?Q1hIYUtkajJsYXRUMyt5VGtIeHVudDZCazZlam4vbGFvaWtBUkMvREhXRllM?=
 =?gb2312?B?SldQd0YrZzJxUmFrZmlaT3oyZUl2a25pTGo0ZE96Q3J0cTFlMjdXSjZZQ3VZ?=
 =?gb2312?Q?vULkHi8FiG/b275OywMU25HOh89CsQyUiBqxeSr?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2598
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86749afd-951d-47bd-2ed1-08d9686384da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8HvtgrgpJ3wZNJJeq5DzsZTHByfiu30iidpCL6it73cKx4zE7EtNG6N9zS9Parm8T5yAZi9xNlXiNJpUcuR81MS0nqgXKkWtpqfC4cBr8BwqiowiPvweeBMYAUmuqhGskAx6S9r2AAIbF4Xb7vNQhUFmtkrVKRKW4Z8WeLlZvi90lAAcCV21quWs/vjXgLmGfthkTpeACME760ZYjpVnbYuw/jttbnjoydb4QXBObFm7d16DLIlQDlly554ZmkFOcMll++G4YNXVZ2kcYkd11vAdOpz5cXXqy+mc5Sy3fLmVexkvTSrUeH0fZAPCvDLSMw+Y9vPFMu1f5tOb0JjubAqnPVwEvXV3/Yr9os1Fd6YXNfRRQdJsF38BlT8Uf/xk6LeMRVibkhCQju119+KF+5fP7pGhv+hREJYPIT151dbOTy2w+/y085C6DSe99vtlIG7tAxjM/aGgR2nO9R0TvdLuMZSOyiUd/PpC17nHEul1jKPjRhJObaMb4jXn0fgciAmN01H90WdyiT/TvxpWCkx6fUXtMViElzGDi7ob1xLF/y806sjlZ5zKWJM9Btv352QP1k2RP+DcrvA0TPPH937xw7zv3n7zwKjzKLrrobq76i2l22+Un5U3szrXeaxTed8wSz4kStNQutE0hxnr58GBWr8e7PkQ0KlAFE5047HSROjU8YDWmavWgm9zO9v4BI18vXnyvbW0Ar/9sKlCkVTsLiMkucCc4g4P0cAPZJ39C+9e0aFS9W6ZqvFa2s4w8uaj1hFyM+BZ03ZexxnoDnyoujsaKWGobxh7KG3he24=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(83380400001)(4326008)(82740400003)(86362001)(47076005)(33656002)(336012)(2906002)(107886003)(186003)(6862004)(26005)(81166007)(356005)(82310400003)(316002)(54906003)(36860700001)(7696005)(5660300002)(53546011)(478600001)(70586007)(70206006)(8676002)(55016002)(52536014)(966005)(6506007)(9686003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:31:40.7334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba766ca5-f500-4250-8541-08d968638be0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5938

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjI2yNUgODowOQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQ0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDAvNDBdIEFkZCBkZXZpY2UgdHJlZSBiYXNlZCBOVU1B
IHN1cHBvcnQgdG8NCj4gQXJtNjQNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGJpZyBjb250cmlidXRp
b24hDQo+IA0KPiBJIGp1c3Qgd2FudGVkIHRvIGxldCB5b3Uga25vdyB0aGF0IHRoZSBzZXJpZXMg
cGFzc2VkIGFsbCB0aGUgZ2l0bGFiLWNpDQo+IGJ1aWxkIHRlc3RzIHdpdGhvdXQgaXNzdWVzLg0K
PiANCj4gVGhlIHJ1bnRpbWUgdGVzdHMgb3JpZ2luYWxseSBmYWlsZWQgZHVlIHRvIHVucmVsYXRl
ZCBwcm9ibGVtcyAodGhlcmUgd2FzDQo+IGEgRGViaWFuIHRlc3RpbmcgdXBncmFkZSB0aGF0IGJy
b2tlIEdpdGxhYi1DSS4pIEkgZml4IHRoZSB1bmRlcmx5aW5nDQo+IGlzc3VlIGFuZCByZXN0YXJ0
ZWQgdGhlIGZhaWxlZCB0ZXN0cyBhbmQgbm93IHRoZXkgcGFzc2VkLg0KPiANCj4gVGhpcyBpcyB0
aGUgcGlwZWxpbmU6DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hl
bi8tL3BpcGVsaW5lcy8zNTE0ODQ5NDANCj4gDQo+IFRoZXJlIGFyZSBzdGlsbCB0d28gcnVudGlt
ZSB4ODYgdGVzdHMgdGhhdCBmYWlsIGJ1dCBJIGRvbid0IHRoaW5rIHRoZQ0KPiBmYWlsdXJlcyBh
cmUgcmVsYXRlZCB0byB5b3VyIHNlcmllcy4NCj4gDQo+IA0KDQpUaGFua3MgZm9yIHRlc3Rpbmcg
dGhpcyBzZXJpZXMgOiApDQoNCj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6
DQo+ID4gWGVuIG1lbW9yeSBhbGxvY2F0aW9uIGFuZCBzY2hlZHVsZXIgbW9kdWxlcyBhcmUgTlVN
QSBhd2FyZS4NCj4gPiBCdXQgYWN0dWFsbHksIG9uIHg4NiBoYXMgaW1wbGVtZW50ZWQgdGhlIGFy
Y2hpdGVjdHVyZSBBUElzDQo+ID4gdG8gc3VwcG9ydCBOVU1BLiBBcm0gd2FzIHByb3ZpZGluZyBh
IHNldCBvZiBmYWtlIGFyY2hpdGVjdHVyZQ0KPiA+IEFQSXMgdG8gbWFrZSBpdCBjb21wYXRpYmxl
IHdpdGggTlVNQSBhd2FyZWQgbWVtb3J5IGFsbG9jYXRpb24NCj4gPiBhbmQgc2NoZWR1bGVyLg0K
PiA+DQo+ID4gQXJtIHN5c3RlbSB3YXMgd29ya2luZyB3ZWxsIGFzIGEgc2luZ2xlIG5vZGUgTlVN
QSBzeXN0ZW0gd2l0aA0KPiA+IHRoZXNlIGZha2UgQVBJcywgYmVjYXVzZSB3ZSBkaWRuJ3QgaGF2
ZSBtdWx0aXBsZSBub2RlcyBOVU1BDQo+ID4gc3lzdGVtIG9uIEFybS4gQnV0IGluIHJlY2VudCB5
ZWFycywgbW9yZSBhbmQgbW9yZSBBcm0gZGV2aWNlcw0KPiA+IHN1cHBvcnQgbXVsdGlwbGUgbm9k
ZXMgTlVNQSBzeXN0ZW0uIExpa2UgVFgyLCBzb21lIEhpc2lsaWNvbg0KPiA+IGNoaXBzIGFuZCB0
aGUgQW1wZXJlIEFsdHJhLg0KPiA+DQo+ID4gU28gbm93IHdlIGhhdmUgYSBuZXcgcHJvYmxlbS4g
V2hlbiBYZW4gaXMgcnVubmluZyBvbiB0aGVzZSBBcm0NCj4gPiBkZXZpY2VzLCBYZW4gc3RpbGwg
dHJlYXQgdGhlbSBhcyBzaW5nbGUgbm9kZSBTTVAgc3lzdGVtcy4gVGhlDQo+ID4gTlVNQSBhZmZp
bml0eSBjYXBhYmlsaXR5IG9mIFhlbiBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgc2NoZWR1bGVyDQo+
ID4gYmVjb21lcyBtZWFuaW5nbGVzcy4gQmVjYXVzZSB0aGV5IHJlbHkgb24gaW5wdXQgZGF0YSB0
aGF0IGRvZXMNCj4gPiBub3QgcmVmbGVjdCByZWFsIE5VTUEgbGF5b3V0Lg0KPiA+DQo+ID4gWGVu
IHN0aWxsIHRoaW5rIHRoZSBhY2Nlc3MgdGltZSBmb3IgYWxsIG9mIHRoZSBtZW1vcnkgaXMgdGhl
DQo+ID4gc2FtZSBmb3IgYWxsIENQVXMuIEhvd2V2ZXIsIFhlbiBtYXkgYWxsb2NhdGUgbWVtb3J5
IHRvIGEgVk0NCj4gPiBmcm9tIGRpZmZlcmVudCBOVU1BIG5vZGVzIHdpdGggZGlmZmVyZW50IGFj
Y2VzcyBzcGVlZHMuIFRoaXMNCj4gPiBkaWZmZXJlbmNlIGNhbiBiZSBhbXBsaWZpZWQgaW4gd29y
a2xvYWRzIGluc2lkZSBWTSwgY2F1c2luZw0KPiA+IHBlcmZvcm1hbmNlIGluc3RhYmlsaXR5IGFu
ZCB0aW1lb3V0cy4NCj4gPg0KPiA+IFNvIGluIHRoaXMgcGF0Y2ggc2VyaWVzLCB3ZSBpbXBsZW1l
bnQgYSBzZXQgb2YgTlVNQSBBUEkgdG8gdXNlDQo+ID4gZGV2aWNlIHRyZWUgdG8gZGVzY3JpYmUg
dGhlIE5VTUEgbGF5b3V0LiBXZSByZXVzZSBtb3N0IG9mIHRoZQ0KPiA+IGNvZGUgb2YgeDg2IE5V
TUEgdG8gY3JlYXRlIGFuZCBtYWludGFpbiB0aGUgbWFwcGluZyBiZXR3ZWVuDQo+ID4gbWVtb3J5
IGFuZCBDUFUsIGNyZWF0ZSB0aGUgbWF0cml4IGJldHdlZW4gYW55IHR3byBOVU1BIG5vZGVzLg0K
PiA+IEV4Y2VwdCBBQ1BJIGFuZCBzb21lIHg4NiBzcGVjaWZpZWQgY29kZSwgd2UgaGF2ZSBtb3Zl
ZCBvdGhlcg0KPiA+IGNvZGUgdG8gY29tbW9uLiBJbiBuZXh0IHN0YWdlLCB3aGVuIHdlIGltcGxl
bWVudCBBQ1BJIGJhc2VkDQo+ID4gTlVNQSBmb3IgQXJtNjQsIHdlIG1heSBtb3ZlIHRoZSBBQ1BJ
IE5VTUEgY29kZSB0byBjb21tb24gdG9vLA0KPiA+IGJ1dCBpbiBjdXJyZW50IHN0YWdlLCB3ZSBr
ZWVwIGl0IGFzIHg4NiBvbmx5Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZXJpcmVzIGhhcyBiZWVu
IHRlc3RlZCBhbmQgYm9vdGVkIHdlbGwgb24gb25lDQo+ID4gQXJtNjQgTlVNQSBtYWNoaW5lIGFu
ZCBvbmUgSFBFIHg4NiBOVU1BIG1hY2hpbmUuDQo+ID4NCj4gPiBIb25nZGEgRGVuZyAoMik6DQo+
ID4gICB4ZW4vYXJtOiByZXR1cm4gZGVmYXVsdCBETUEgYml0IHdpZHRoIHdoZW4gcGxhdGZvcm0g
aXMgbm90IHNldA0KPiA+ICAgeGVuL2FybTogRml4IGxvd21lbV9iaXRzaXplIHdoZW4gYXJjaF9n
ZXRfZG1hX2JpdHNpemUgcmV0dXJuIDANCj4gPg0KPiA+IFdlaSBDaGVuICgzOCk6DQo+ID4gICB0
b29sczogRml4IC1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZCBmb3IgeGx1X3BjaV9wYXJzZV9i
ZGYNCj4gPiAgIHhlbi9hcm06IFByaW50IGEgNjQtYml0IG51bWJlciBpbiBoZXggZnJvbSBlYXJs
eSB1YXJ0DQo+ID4gICB4ZW4veDg2OiBJbml0aWFsaXplIG1lbW5vZGVtYXBzaXplIHdoaWxlIGZh
a2luZyBOVU1BIG5vZGUNCj4gPiAgIHhlbjogZGVjb3VwbGUgTlVNQSBmcm9tIEFDUEkgaW4gS2Nv
bmZpZw0KPiA+ICAgeGVuL2FybTogdXNlICFDT05GSUdfTlVNQSB0byBrZWVwIGZha2UgTlVNQSBB
UEkNCj4gPiAgIHhlbi94ODY6IE1vdmUgTlVNQSBtZW1vcnkgbm9kZSBtYXAgZnVuY3Rpb25zIHRv
IGNvbW1vbg0KPiA+ICAgeGVuL3g4NjogTW92ZSBudW1hX2FkZF9jcHVfbm9kZSB0byBjb21tb24N
Cj4gPiAgIHhlbi94ODY6IE1vdmUgTlJfTk9ERV9NRU1CTEtTIG1hY3JvIHRvIGNvbW1vbg0KPiA+
ICAgeGVuL3g4NjogTW92ZSBOVU1BIG5vZGVzIGFuZCBtZW1vcnkgYmxvY2sgcmFuZ2VzIHRvIGNv
bW1vbg0KPiA+ICAgeGVuL3g4NjogTW92ZSBudW1hX2luaXRtZW1faW5pdCB0byBjb21tb24NCj4g
PiAgIHhlbi9hcm06IGludHJvZHVjZSBudW1hX3NldF9ub2RlIGZvciBBcm0NCj4gPiAgIHhlbi9h
cm06IHNldCBOVU1BIG5vZGVzIG1heCBudW1iZXIgdG8gNjQgYnkgZGVmYXVsdA0KPiA+ICAgeGVu
L3g4NjogbW92ZSBOVU1BIEFQSSBmcm9tIHg4NiBoZWFkZXIgdG8gY29tbW9uIGhlYWRlcg0KPiA+
ICAgeGVuL2FybTogQ3JlYXRlIGEgZmFrZSBOVU1BIG5vZGUgdG8gdXNlIGNvbW1vbiBjb2RlDQo+
ID4gICB4ZW4vYXJtOiBJbnRyb2R1Y2UgREVWSUNFX1RSRUVfTlVNQSBLY29uZmlnIGZvciBhcm02
NA0KPiA+ICAgeGVuL2FybTogS2VlcCBtZW1vcnkgbm9kZXMgaW4gZHRiIGZvciBOVU1BIHdoZW4g
Ym9vdCBmcm9tIEVGSQ0KPiA+ICAgeGVuOiBmZHQ6IEludHJvZHVjZSBhIGhlbHBlciB0byBjaGVj
ayBmZHQgbm9kZSB0eXBlDQo+ID4gICB4ZW4vYXJtOiBpbXBsZW1lbnQgbm9kZSBkaXN0YW5jZSBo
ZWxwZXJzIGZvciBBcm02NA0KPiA+ICAgeGVuL2FybTogaW50cm9kdWNlIGRldmljZV90cmVlX251
bWEgYXMgYSBzd2l0Y2ggZm9yIGRldmljZSB0cmVlIE5VTUENCj4gPiAgIHhlbi9hcm06IGludHJv
ZHVjZSBhIGhlbHBlciB0byBwYXJzZSBkZXZpY2UgdHJlZSBwcm9jZXNzb3Igbm9kZQ0KPiA+ICAg
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZSB0cmVlIG1lbW9yeSBu
b2RlDQo+ID4gICB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UgZGV2aWNlIHRy
ZWUgTlVNQSBkaXN0YW5jZSBtYXANCj4gPiAgIHhlbi9hcm06IHVuaWZpZWQgZW50cnkgdG8gcGFy
c2UgYWxsIE5VTUEgZGF0YSBmcm9tIGRldmljZSB0cmVlDQo+ID4gICB4ZW4vYXJtOiBBZGQgYm9v
dCBhbmQgc2Vjb25kYXJ5IENQVSB0byBOVU1BIHN5c3RlbQ0KPiA+ICAgeGVuL2FybTogYnVpbGQg
Q1BVIE5VTUEgbm9kZSBtYXAgd2hpbGUgY3JlYXRpbmcgY3B1X2xvZ2ljYWxfbWFwDQo+ID4gICB4
ZW4veDg2OiBkZWNvdXBsZSBub2Rlc19jb3Zlcl9tZW1vcnkgd2l0aCBFODIwIG1hcA0KPiA+ICAg
eGVuL2FybTogaW1wbGVtZW50IEFybSBhcmNoIGhlbHBlcnMgQXJtIHRvIGdldCBtZW1vcnkgbWFw
IGluZm8NCj4gPiAgIHhlbjogbW92ZSBOVU1BIG1lbW9yeSBhbmQgQ1BVIHBhcnNlZCBub2RlbWFz
a3MgdG8gY29tbW9uDQo+ID4gICB4ZW4veDg2OiBtb3ZlIG5vZGVzX2NvdmVyX21lbW9yeSB0byBj
b21tb24NCj4gPiAgIHhlbi94ODY6IG1ha2UgYWNwaV9zY2FuX25vZGVzIHRvIGJlIG5ldXRyYWwN
Cj4gPiAgIHhlbjogZXhwb3J0IGJhZF9zcmF0IGFuZCBzcmF0X2Rpc2FibGVkIHRvIGV4dGVybg0K
PiA+ICAgeGVuOiBtb3ZlIG51bWFfc2Nhbl9ub2RlcyBmcm9tIHg4NiB0byBjb21tb24NCj4gPiAg
IHhlbjogZW5hYmxlIG51bWFfc2Nhbl9ub2RlcyBmb3IgZGV2aWNlIHRyZWUgYmFzZWQgTlVNQQ0K
PiA+ICAgeGVuL2FybToga2VlcCBndWVzdCBzdGlsbCBiZSBOVU1BIHVud2FyZQ0KPiA+ICAgeGVu
OiBpbnRyb2R1Y2UgYW4gYXJjaCBoZWxwZXIgdG8gZG8gTlVNQSBpbml0IGZhaWxlZCBmYWxsYmFj
aw0KPiA+ICAgeGVuL2FybTogZW5hYmxlIGRldmljZSB0cmVlIGJhc2VkIE5VTUEgaW4gc3lzdGVt
IGluaXQNCj4gPiAgIHhlbi94ODY6IG1vdmUgbnVtYV9zZXR1cCB0byBjb21tb24gdG8gc3VwcG9y
dCBOVU1BIHN3aXRjaCBpbiBjb21tYW5kDQo+ID4gICAgIGxpbmUNCj4gPiAgIHhlbi94ODY6IG1v
dmUgZHVtcF9udW1hIGluZm8gaG90a2V5IHRvIGNvbW1vbg0KPiA+DQo+ID4gIHRvb2xzL2xpYnMv
dXRpbC9saWJ4bHVfcGNpLmMgICAgfCAgIDMgKy0NCj4gPiAgeGVuL2FyY2gvYXJtL0tjb25maWcg
ICAgICAgICAgICB8ICAxMCArDQo+ID4gIHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAg
fCAgIDIgKw0KPiA+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgIHwgICA5ICstDQo+
ID4gIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICAgICAgfCAgIDggKy0NCj4gPiAgeGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICB8ICAxNyArLQ0KPiA+ICB4ZW4vYXJjaC9hcm0vZWZp
L2VmaS1ib290LmggICAgIHwgIDI1IC0tDQo+ID4gIHhlbi9hcmNoL2FybS9udW1hLmMgICAgICAg
ICAgICAgfCAxNjIgKysrKysrKysrDQo+ID4gIHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVl
LmMgfCAyOTIgKysrKysrKysrKysrKysrKw0KPiA+ICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm0uYyAg
ICAgICAgIHwgICA0ICstDQo+ID4gIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgfCAg
MTQgKw0KPiA+ICB4ZW4vYXJjaC9hcm0vc21wYm9vdC5jICAgICAgICAgIHwgIDM3ICstDQo+ID4g
IHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgfCAgIDIgKy0NCj4gPiAgeGVuL2FyY2gv
eDg2L251bWEuYyAgICAgICAgICAgICB8IDQyMSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ICB4ZW4vYXJjaC94ODYvc3JhdC5jICAgICAgICAgICAgIHwgMTQ3ICstLS0tLS0tDQo+ID4gIHhl
bi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDMgKw0KPiA+ICB4ZW4vY29tbW9uL01h
a2VmaWxlICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgeGVuL2NvbW1vbi9saWJmZHQvZmR0X3Jv
LmMgICAgICB8ICAxNSArDQo+ID4gIHhlbi9jb21tb24vbnVtYS5jICAgICAgICAgICAgICAgfCA1
ODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgeGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMgICAgICAgICB8ICAgMiArLQ0KPiA+ICB4ZW4vZHJpdmVycy9hY3BpL0tjb25maWcg
ICAgICAgIHwgICAzICstDQo+ID4gIHhlbi9kcml2ZXJzL2FjcGkvTWFrZWZpbGUgICAgICAgfCAg
IDIgKy0NCj4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggICAgICB8ICAzMyArKw0KPiA+
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggICAgIHwgICA2ICsNCj4gPiAgeGVuL2luY2x1
ZGUvYXNtLXg4Ni9hY3BpLmggICAgICB8ICAgNCAtDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYv
Y29uZmlnLmggICAgfCAgIDEgLQ0KPiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaCAgICAg
IHwgIDY1ICstLS0NCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oICAgICB8ICAgMSAt
DQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9saWJmZHQvbGliZmR0LmggfCAgMjUgKysNCj4gPiAgeGVu
L2luY2x1ZGUveGVuL25vZGVtYXNrLmggICAgICB8ICAgMiArDQo+ID4gIHhlbi9pbmNsdWRlL3hl
bi9udW1hLmggICAgICAgICAgfCAgODAgKysrKysNCj4gPiAgMzEgZmlsZXMgY2hhbmdlZCwgMTMy
NSBpbnNlcnRpb25zKCspLCA2NTkgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB4ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9h
cm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9u
L251bWEuYw0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K

