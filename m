Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA599F289
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 18:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819265.1232549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0kFB-0001Kb-Uj; Tue, 15 Oct 2024 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819265.1232549; Tue, 15 Oct 2024 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0kFB-0001HV-PJ; Tue, 15 Oct 2024 16:17:57 +0000
Received: by outflank-mailman (input) for mailman id 819265;
 Tue, 15 Oct 2024 16:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QAko=RL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1t0kFA-0001HP-3v
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 16:17:56 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2608::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f882d9-8b11-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 18:17:54 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 16:17:46 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 16:17:46 +0000
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
X-Inumbo-ID: 07f882d9-8b11-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhnKpW3xRtukcxq3oGDHN9Ld+nHXLlMRSPxgMlOtLE+un6E0F2OdFiKv4LI5LLuIR5PMoicComhWVQ54sMLaQWVlmIuUuygmu03Abiigcjep0J28LYtLJu+WcQDLINYMZ/AzCq+4aHAanpD0bZhVNoL1EtrlaevbjQLJjU+JuXeXoPIPMecJANKyO0yhmIKJ+26AZVzC9Do5t+YUPNLJgaJyrg0yKHelJyujJdMXTr0kjSs0JqfXUxtBIc3SYAgzQcFb+HJUw9zrjqp5/nTgDuHrJC/CC9WzniOpRdlR4bRYi9+ZrDUoLJLnr6DoKe0LTwpcjzCOAo+AB55IrUjG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYimG7wkMEUNBnqAhLpHNTMnDjIZ7a1O8CLuOjBIzm0=;
 b=dPxEHqN+LApyDPCNtIuWn/5+evIa/khGzgJsT0Hjq6YGhDinfF/3LTdB6F/lAbS/RpGu6J+DXWJq6CVUxBb7f9z/aML2l0xpi0IW8UOx+OSL9ySFfOSfcE1cfwEAYE0GMGUzr+XoKzxWK4lgf4/olYdSf+M14lamPK9dYpehJpSAR+rq4ekZfGzcsmdsC6GuOpTPiCzpZ0jHcoB1oWwy1l5PeWjG3w1jmDV6OEWDS0bQYuG8xOY+IJPpjsPlLTF5HQtRTwrmvWsV99/yx2HO5GC4EUDy/8uXwl9k4BnM4VG0YqKmc/VBv5axi/UzT0rs5iObiw1ilYaoLcbahmFtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYimG7wkMEUNBnqAhLpHNTMnDjIZ7a1O8CLuOjBIzm0=;
 b=fYB8aBBmHSGfD2hlZ4j5/LTP8wRGrZsNm2zWt2wRc+arKY6pNBp2wknRGd7RI9j3OxBtqoX/e49prywOTDUC1iixeEVvoSp4HCBoF2AUsdrF/dBpxvAvJB5nqA6dMzXxTnLNl6JdNnNQj4iX4I18dDTVi8iiIJrlGMtj+i0SEMS++PVXsXIH4MUJt0fUaqYbe0tq8uDejED4r0QWqP1HLJIMo4jXixoLvgEtqsm45wVi79kbkgZgr3DnI194GHMTJH1pvi6FjKdF5a1UaAT/SDL7qKjAY10mylX5ZzywRI1soVI/vkA+GMit0b3OhQQDei8nGZhFaqOz+RHKRgIE6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <bd780e3d-a3dd-41cf-bcdc-f4d6ea4442a4@oss.nxp.com>
Date: Tue, 15 Oct 2024 19:17:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
 <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
 <b8419295-cc63-41b3-9f2d-277d81e5f85a@oss.nxp.com>
 <a24807bd-5224-4110-bc0e-946287f5c90e@xen.org>
 <1de8ea10-f801-45b9-ab6a-25465ecd6b76@oss.nxp.com>
 <e2acb3bc-85ef-4d46-b392-5f1dad013226@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <e2acb3bc-85ef-4d46-b392-5f1dad013226@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:208:14::22) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: b1efb46d-56b0-440b-98a9-08dced34e7bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmJvaXZ1dzZUMWdLTXZjSVdMQWJmeEl4ZUFreExDKzVwMXI2WlpXODU2Sis2?=
 =?utf-8?B?UjRYbHFWVlFCZWtlZndUcGQ3QzNBd1RFa3V0b3JiOVlpQjRVTTZTcmpKUTlF?=
 =?utf-8?B?eCtrenhBYW9WRUpZTlNMczIxZmtLUVhNaE4zWXhOa1cvaHFoSFUzT0RlQ0JI?=
 =?utf-8?B?ZU9jU0F5TVh3dW44dlhDOTF3RG5BUEp0V0NQdVp5c0JWeFQ3STIwaUtrWXBa?=
 =?utf-8?B?MWt5NWxPZTZzcFl2aVZZd3BWOGRZdndBV2c3WlR6T3czNFBMRjdpTzBpeWUv?=
 =?utf-8?B?UTlVVVZsM09jZHJMcXNEeEV6aXpoS1hNaFlOMnZYRVU2aVhxRUY2VkU5Q1lV?=
 =?utf-8?B?YXpVdnBLWDE4c1FnMFdObWxNdXZ0eFg0cVYwekFFUjRlUmtJMnJKODRxN3h1?=
 =?utf-8?B?TjNVUHZNdm9ZNlZaU2F3ZXNRR3JyL2V4YSszRXAzN0tOUW1FRitSY3NvaDFq?=
 =?utf-8?B?Uk1kN2tSeVc0ZVY0TGpUaHhxNklNMFVDVjVic1VSTlVWZXlzS3F2V0xSWFV6?=
 =?utf-8?B?R2Y3aFNSUkw3NVhWaDRWSlVXaG0wc3plVDlyaUxtTVBjMzUrczNWdzUrZlVr?=
 =?utf-8?B?T084N1ZPVzBEbTR5T0dLUjdHQXVLcDJiYzgweUcxNS9TcDd0NHJkTUdsa1U2?=
 =?utf-8?B?SmtKZ29DdzlvZ1RqNmcwT0RBT3RML1E1STFsc0xkSXlaNUlHVW9IeVJNK2JF?=
 =?utf-8?B?Z1Y0bjRFMWxCczJFWGpTRVJZMTdUbFdjT1FFVUxrSWZpUHJWRUlLdU5xUG9Z?=
 =?utf-8?B?TXFyaVJnU2J4V2xLWjFmUzBvdjcrTXRsdHZsc3hnYVpPa005Mk0vdHFYU2tP?=
 =?utf-8?B?VWRkdGpvSGQzcEd1c1Z2UUs0eHphSkJyeFdDYk1QUG8wTlFJczVJRHgwSWFj?=
 =?utf-8?B?MGJpeXRHM29mNFRaZ3Ryd2liZnB1Y2l2MXFtWXAvTXVYY2YvMEVuWGI2WVZy?=
 =?utf-8?B?OXFuc2QxMktBZ0EyT1NQcVZYT3ByamZzZTE4OC8vUHBKc3U5QnBERElKUWZX?=
 =?utf-8?B?YlIxOFF0YmdVTmxPVHA3TmFPczQyS012TFJ5UVdGeVVhb0dUb2V5RUFadDhP?=
 =?utf-8?B?SnlCR21lTXdxbkVZUUVyUlYyREwvNUIzM092RXhVVkpnN2ZrbXpXMG5xbDFN?=
 =?utf-8?B?blZ3N2xZVlJRVlA3YytTSmNRUW90Z2dJVUx2UGlKL0RyRFA4YmxjKzhySWl2?=
 =?utf-8?B?QnZ0YmpFTTk0TGhwdEhZOTlxTkkydWZtTXU4Nlg1VGNQTUpNNnRZYTdDdXFQ?=
 =?utf-8?B?d2lqNllVWEdJdHh3eUtPeGpESnZDTitIbE9mV2JWTnN2MWpydW1PazlTL1dQ?=
 =?utf-8?B?UUw4SnB2Vkx2SHBBRlhGbmVGQzIxQ0xzaTJIbXJsZVQ5R0lCKzNjT3N2TFo5?=
 =?utf-8?B?NnhPODF1a0NzMENONWh5aDBmS1hndm4wb25vNGNkNlRJcTcxM0FxdmRrQllo?=
 =?utf-8?B?dmdhMjh5VDBtTWxqSktHMGtRMHNWT3ZQTk1qZmc3SWRuNS9OcEJwa2h1Y2I2?=
 =?utf-8?B?NEdjbm5hUldkRk1rVHQ5TkQ4ai9VNzlGSGtyWEh4VGorUnJFZUxxdnoxcUtz?=
 =?utf-8?B?WnZQejcyaWlsUGY4cm1rbmNTVkpWdUp1eEIwdXhIY1VLK2t4MC9wWHZSelk0?=
 =?utf-8?B?SEFreFVRb2Z1R1BFRUFDdkxSUGpKZ0xuT1d0SUdaUUUvaFdrYSs1THFWN0pF?=
 =?utf-8?B?Y3l2ZGlmdzEvbmorSzVPTHVHdnFCeHNWRmQ3TVc4L1hhemxTWHB0VFVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW9ITCtFWjFnbmdSRGlZU29qMnFZeEhLT2lraExYWmp1aTBWREppdUVwOXlv?=
 =?utf-8?B?MHA3Y2lrYkYzUzF5NEptV04xRENORyttc2ZpL1NNUEYzUmtXTUNJU1Fxd3Jt?=
 =?utf-8?B?azM5YTVzQ3JQRUF6cWNialB6QkpSemlmbmswVVI0SUdsUDk5elhXcGtyS0tV?=
 =?utf-8?B?VW1yT2c4bkNZTEJXN3BYNVppMkFHbUQ0eTJZMW5wUXlNcG9BdDBRVGplR3p6?=
 =?utf-8?B?ODlVcWMrWEFQRkVBVUdhSEp5OFRiQjBKODJIV1ZpM1AyQmlNTGN1UnA1U0Fw?=
 =?utf-8?B?NStlNnc4cWptN2JxaUpQaVBkT3VTQmZ1OFM2NXIrQjNZdHgzd1dqMm9CMEJN?=
 =?utf-8?B?bUhYNHUvNGV0ZzVDZnZ5ZHUyajR5QXBLY1RzRHJyTU5EaElTeTJVQ0Y3K0lG?=
 =?utf-8?B?NEhCQUhYYmp1TDViWDV0dWpibnkxUWJDQ2dOcm0wTUJOV010QjE5NzV3UEtj?=
 =?utf-8?B?U25Oc3d0OUVPMVlSNG9ZOXNkK29tMHd3SERhdXpzQys3QmtmbUhmbVBsZ2Y1?=
 =?utf-8?B?eDRVTzR4ckttcUI3eGVOdlkvemRKSFNzaHhILzNxc0lLdmkvQTduY1VOV1BB?=
 =?utf-8?B?Z2VNTGo5SlBUL2c3bVgrZTJ5UGZybzhXNUd3c1QvemtXckJab2RMcDhPSVlZ?=
 =?utf-8?B?MWt1WlNXMEd5VG5HL3BINVhkQWEvZmFEenM2ZktibmxuemNrTzBNaUVWTmZw?=
 =?utf-8?B?dGJMTEpDUXRaenlqRTZ1NXhqai9Qa2poOFFTeWVpM1k4bVBKeGVKalhNbEkz?=
 =?utf-8?B?Sk5JVUcxdHpEUEZpdDQzdkZDcXVtSCt3bXVVbk84bWRMTU0xTElrMXBmd2xv?=
 =?utf-8?B?ODRIUDhFTnZsL1Z3ekhpOGpiN2FxdE9tcml0ZHYrd3plb2FGanlYcElwekdB?=
 =?utf-8?B?dlJQdFR3WE9BQlp2UnZOT21NUktRMFc0cnpBR21xMzl4Qkx4MEQzVmxqTGM0?=
 =?utf-8?B?TTdkNHVKNkVSdGM5aW9CSEk3SWNwVko4N0FZRDk1am0zV2dIOVRFeHdOWWtq?=
 =?utf-8?B?UkRQaVBhZmZKR2Z4TkdNQmhMMEgycVFtWXVkK2s3eHU3eWxZbW9sMUJMN0VP?=
 =?utf-8?B?aUNRS1RCQW9aV0tReENOSU9GbEJPY3pESi81ekcxeHNHNmZmT3dnOUpld20r?=
 =?utf-8?B?dms2NVAxUzBhWXk1eDlDbWNFb055N2NpdTFQMExYeThabFlRMDM2dmd4TitC?=
 =?utf-8?B?SWVBWDZFNFh0NENGU2V3bTl4Umx2WjNwU3MzRnJick1iQ28wb0pobWdjT0ZR?=
 =?utf-8?B?dE5xY0R2Qk1qL2VOTUFoZXRNYVFLc3U1dTNqKzVLKzRraWhIZ05JNnlTbHdO?=
 =?utf-8?B?T3JvTVV1R0pQYXBLUDVzRTAxemlzM25CL1VVYUpuUzFzcFJsSjMrYVEyd0Rs?=
 =?utf-8?B?TDdscGtpaG41dmFvREw2ZlluK216RGlpRHpXenQ5UUsrNGlXdUVvbUVxeEtK?=
 =?utf-8?B?d2xoeDlnbXN1eFU3RHpjL3FLbXNUaFI3UzltM1cySnVFdXJEOXlvancyTXZL?=
 =?utf-8?B?bFRjUVp4aHZyMW9vU3hHelhxckRLY3VoTzJZNU9PYVVUWEVLRWFmS1pGYyta?=
 =?utf-8?B?N3NLTHR1VmV2VnZYMjRNS1UyRWJrV28vUHQ0clJRcFAvOCtMbXRYeFI0Q1p0?=
 =?utf-8?B?YTNqZ3NXNEN6V3FEbWtkMkJabDhXWEdKRHh3V3VyRFBxT0lINlFOUFY0N1pE?=
 =?utf-8?B?UWhpK1p4TDZBZEc3S3krSng2ZWxwRlF6eTd0eUViUk9PczhCZWlVTGtUT3J4?=
 =?utf-8?B?Rm9JK0dzV0Rid21oMDlobWZRdklCaWhycUI3OEtxMlFWYjhjelc5MmhHZXR6?=
 =?utf-8?B?WW8vckQvSDJ6S3JuZFNMQXZ6bEk4TDQvaUxVaTRGSGF2Ti9HNlBIQWFqMWlJ?=
 =?utf-8?B?YjJtYS9hczNQaVdkeFRmNEZ0TnppWWt1SG9pVEVTYTFoRklsRUl3dFZFWnZs?=
 =?utf-8?B?R0ZFUlY3aTcrWUFwUHR5UVVwYmF1RHpxbXdMeWk3eG1GNVB4aWtVYnVtbFJy?=
 =?utf-8?B?S0hJQ0grbmh6aVVmNGdoQzR3cXFCVWtxOWJFQTZ5Y25iZTNUenc0RytRaGs1?=
 =?utf-8?B?NUlQWlBNY1dnNVlJalF5S2tWL2VxNERHS3FLam1NVEREZTZoREZudjE3THVT?=
 =?utf-8?B?eEN3K0d4cmlaUDZTekFPQTdpcGg2U0FXM3hqTmR3cHRzMFpvYVJyQWpCZElv?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1efb46d-56b0-440b-98a9-08dced34e7bc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:17:46.3997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFnbWtEzolA+VEyxMmg9QRmB1CSW6DmR7bcKzrOXL2DkV0pr12lh9GXowXcQZrgGTe6K/kZ6RekCnExujP4crV9v65FDkQf6T0oiQYRABuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641

Hi Julien,

Sorry for the slow replies.


On 08/10/2024 23:31, Julien Grall wrote:
> Hi,
>
> On 08/10/2024 20:01, Andrei Cherechesu wrote:
>> Hi Julien,
>>
>> On 04/10/2024 19:24, Julien Grall wrote:
>>>
>>>
>>> On 04/10/2024 16:37, Andrei Cherechesu wrote:
>>>> Hi Julien, Stefano,
>>>
>>> Hi Andrei,
>>>
>>>>
>>>> On 01/10/2024 13:01, Julien Grall wrote:
>>>>> Hi Andrei,
>>>>>
>>>>> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>
>>>>>> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
>>>>>>
>>>>>> S32CC platforms use the NXP LINFlexD UART driver for
>>>>>> console by default, and rely on Dom0 having access to
>>>>>> SCMI services for system-level resources from firmware
>>>>>> at EL3.
>>>>>>
>>>>>> Platform-related quirks will be addressed in following
>>>>>> commits.
>>>>>
>>>>> I don't see any specific quirks in the series. Are you intended to send follow-up?
>>>>>
>>>>> [...]
>>>>
>>>> Well, we could use an opinion on some SoC erratum implementation
>>>> and if it would be acceptable for you or not, from any of
>>>> the ARM maintainers.
>>>>
>>>> The erratum is about some TLB Invalidate (tlbi) instruction
>>>> variants (by Virtual Address) which are handled incorrectly
>>>> in some cases (for some VAs), and that need to be replaced
>>>> with broader versions.
>>>
>>> Can you provide more details:
>>>    1. Is this a processor issue?
>>>    2. Which VAs are affected?
>>>    3. What is the impact if the erratum is hit?
>>>    3. Do we need to do anything on the behalf of the guests?
>>
>> Sure:
>> 1. This is an SoC issue, present in a subset of the S32CC processors family.
>> 2. VAs whose bits [48:41] are not all zero.
>> 3. Well, TLB corruption.
>
> Can you provide a bit more details? Is it a corruption within the same stage/ASID/VMID? IOW if a guest corrupt the TLB, does this mean only the stage-1?

Corruption might occur in other TLBs from the coherency domain.

When a TLBI by VA is broadcasted from a cluster, the invalidation is not
handled correctly in the other cluster for the affected VAs (with
bits [48:41] not all 0). So the other cluster cores' TLBs will contain
stale entries, and we need to use a broader TLBI variant instead.

It applies to both stage-1 and stage-2 translations.

I hope it is clearer now, but let me know if I can help you with any other details.

>
> Also, if a guest manage to corrupt its TLB, does this mean it could end up to access host physical address it should not?

Indeed, there could be mappings leading the guest to access physical
addresses not under his ownership.

>
> BTW, do you have any more documentation about the erratum?

The errata document for an affected processor variant is publicly available [0]
on NXP website, however, it also needs registering. The erratum can be found
there as ERR050481.

[0] https://www.nxp.com/webapp/Download?colCode=S32G2_1P77B&location=null

>
>> 4. There are instructions affected at both levels 1 and 2 of translation.
>> The guest will have to work its own way around it.
>>
>> In Xen, just `tlbi vae2is` (only used in flush_xen_tlb_range_va()) seems to
>> be affected, and if we go with the 2nd approach from the ones proposed,
>> it should not be very ugly to implement. I am of course open to any of your
>> suggestions.
>>
>>>
>>>
>>>> It doesn't apply for all S32CC platforms, but we can use the
>>>> Host DT compatible to identify this. My idea is that we define
>>>> a platform quirk for this and check for it using
>>>> platform_has_quirk().
>>>> Then, we either:>      - modify the definition for the affected 'tlbi' variant
>>>>       in arm64/flushtlb.h to actually execute the broader one
>>>>       if needed
>>>> or:
>>>>       - define a new wrapper for the tlbi variant we want to
>>>>       replace the affected one with
>>>>       - check for this quirk before its usage and call the
>>>>       more potent version if needed (there's only one
>>>>       occurrence of usage for the affected version).
>>>>
>>>> Number 2 seems better to me, it's more customizable and
>>>> it's similar to the existing handling for
>>>> PLATFORM_QUIRK_GIC_64K_STRIDE for some other Arm platform.
>>>
>>> I need a bit more details first (see my questions above). But if there are not many VAs affected, then we may be able to re-order the Xen memory layout to avoid the VAs. So we wouldn't need any specific change in the TLB flush operations.
>>
>> I'm not sure what to say here, we would need to have the layout
>> limited under the mentioned VA range in our case, right?
>
> Correct. Is your SoC going to ever have more than a couple of TBs of memory?

No, that shouldn't be the case. Is it possible/preferable to do that for Xen?

>
>
>> What
>> about the GVA layout?
>
> That's control by the guest. We could potentially tell the guest less VA is supported, but it is free to ignore.
>
> Can you clarify why we would need to care about the GVA layout?

Right, the hypervisor should not limit it. But the guest is then
required to handle the workaround for stage-1.

>
>
> Cheers,
>

Regards,
Andrei Cherechesu



