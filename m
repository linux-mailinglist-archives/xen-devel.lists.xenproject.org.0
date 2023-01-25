Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C367B5D6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484410.750971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhdS-0007o1-Vv; Wed, 25 Jan 2023 15:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484410.750971; Wed, 25 Jan 2023 15:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhdS-0007lU-SK; Wed, 25 Jan 2023 15:24:26 +0000
Received: by outflank-mailman (input) for mailman id 484410;
 Wed, 25 Jan 2023 15:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKhdR-0007lJ-O6
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:24:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2084.outbound.protection.outlook.com [40.107.8.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58444f55-9cc4-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 16:24:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:24:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:24:21 +0000
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
X-Inumbo-ID: 58444f55-9cc4-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoryF+zXzbdVZnKxwKq1JxwkHvDcdlHX1piCQfei9pV0pv/AuGdY96256hF88egQzQrP7YtKTs5EHnKiELTfsuSs7LDDO+RWXEB4VzHKtT4XNHvIST4fsd8QN/FUVfGVu7aha40lmBDAp8nqv0dQ2MQvCREMrtqs2uddfFrK+tVqrcFv/UjfpnBEQa9Fvj+FqjxNU6khAcgTN8uL1L3vfK4pYU7gXGgFVBoJ6ckFmpg2A96EuktuOIVC/R2hAjdWpE1xGMJwV781Cwqa487Y3RCXznrgo2G2GaKiT4BT/R7p7FkOo7/qKNxSbVaGzUOqYVdGshMEPnEJzBnz/Y+1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LGB6M/zSypAQqdu7F039ipa7i1HTcq09wHgGgOd0tE=;
 b=lkeIpm38aXAkp718tIVyAZcwOJlpoHDGGwg+ny/XNVWB6seMPbGhhi8TniM8IE/XaNVmnzhu65krF3i6Q6yPomSSegT0zGVoCMgWSHYegePJ16Af2kQIJfWwnkxqv07L1GIGOgOR6bJeset/r2zW3OWbF8ENOb+uBNi1op4JKW9cZTu8MS6q+eHE8BtTzjw/ranWQ0Uq5oFpgF1LdxWYyCW76Sx0PXoAldqrGyILkyqpYyxjBOwbSCQzsj3SRpC51wKGH7gIR7lsW+VfvHOvwid+VwuqWbg+/AzGZRavhF5ymzk8ABt179DFB8+H2+o1OHpxs/NklaEDJB1ZhwQ56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LGB6M/zSypAQqdu7F039ipa7i1HTcq09wHgGgOd0tE=;
 b=43GevqWSHikkUEp8tnTUGPv+/lDVXgteuYPd2xo6wN42g7fa25ivkKnYrvLTJ8qBm7XUhWSQjDx/GujDLZPGXVcRLXtICezorcu2fXzBBQIr7eUe8HVMffR/JnwIBUfoP0MnIDbWWvHzmCvhlh9Rp5PaBw+glarrfID32e2DpTdskZIi2QjlHc3kCuBzDcajZXd2qS6u/ikw5+30boTw5c/kJ+MJjszVzqX5Vhv2xDFLctJSsBjASsXQIbwbFw85xLU+eCX5ZHgx0gDlFqDOsjIsc25JTsL7k6CwJHdTI/29HZqaV/C23SSGCc4vPtKQX77cV3JmHEJTt/nbkD6ooA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
Date: Wed, 25 Jan 2023 16:24:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86/spec-ctrl: IPBP improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a365d8-4397-47b1-6ef8-08dafee83b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NHg8pu1oi0Rd1/V/Otr8WY8ta9VeApn3Ec4loYc/h60xBDxUqdm1wpfc1eamgSpYzxcTYNdlq0gXZxakLIrcy4omhyqr9LAL2fv2/XnkHkdngh/FCFUpP7zlDL9lrZkQumwmUOD7/z2D5IJfV4afXF7drvRCvvd1mPBL43srP9kQt09+oJY6AsCKYXR6cz6Nkxpi46pt0MAdR+V+xXGHgw1GpQto6lqBGxUxKcbP5L9+FmHefF07yzDvZKmDIhc5wgEF62lYts/k29Ff+9HC0RmzaWYdPpb9PpKbtQXJqSmLQ9m5RZ/SQ0hAk4b35NrrHC/4Nz13vOUW7zFIaNQEPg4UDW/45ofaNK584knLwT9N2cdJeWa1+9wPQc61TPQTYDGoy3w+yUATbPhR3B4wk6jpsiQ9A1qk+pUpdv7TRsJQJ3REHK3ItJZJS+Or7ph6Mu/5fYhtzkMci0GkgpTXNuTomrUm24R9wrHB6ArNj2sm5mZdRHrN2HMNzr6c42VT5WBl78zUuQQccI6/Qbg967o6Pj13/vJo/xAPUPj9j5/r0Khe2ddwMVwCRDpORt4MF3JibWzdXwcYwax6czLPM02k8R+c9LnTjEYKaYAlXqg90h4fP4mqcscfrqjuvq1rKgA0mVUKAC8bsuQr+/Avwfz8e+eHZ99bND1GIi7BNqrnBGlo4Be84BsfGyM3of9aaYZSc5TSMFSKaItvQl3fdb1RhyifnFkwXMgiuC73Hy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(83380400001)(38100700002)(26005)(5660300002)(4744005)(2906002)(41300700001)(86362001)(8936002)(4326008)(6512007)(316002)(6506007)(8676002)(186003)(66476007)(66556008)(2616005)(54906003)(478600001)(6916009)(66946007)(36756003)(31696002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHNtQ0VUdE9FUFp1Q2Y0V01jMWl0YXFTbC9QZ3RIWTBOMjRrUlVjYlNLejh4?=
 =?utf-8?B?WjBsMEQ2bGljV0d1WXRCa2V4b1FpcURzRTU5TDlMbGlMS2twa0U4QjEyOXFk?=
 =?utf-8?B?RU4vQVFldE9XcXQvNFY1RW1VdEJWQlVMMWlzRGRmYytkT2JzbSt0WDFNTTV6?=
 =?utf-8?B?TGZJZWFQbGJoa1ExalhHbmdST3NCWVVvYUtyVUw5cnEwOVdnM1BvT1F5MjV0?=
 =?utf-8?B?dkZ1ZmxxS05lYXRlcnZjQXVDVjMyS3JFbGxnSzhidVNjd256N2F0NjlTR2pE?=
 =?utf-8?B?N0JDUkkzNUVhaDY0dyt4OGYvSC95dGRwVUc0TzYreVRoVTBHREUwV0Z4TUdQ?=
 =?utf-8?B?WXAyUnQwcU9nMlUrZ3RIc1FWNExvbmtBNlpDbyt0cHgralNpNHFJckg5cTRT?=
 =?utf-8?B?U1pJQ25wSGFRcHJ3VTI4a3NiZ2FTeFp4cUtXU0Y5cnMzYmREa2FSbm5DQktx?=
 =?utf-8?B?R2pKdEo4Q1VTaDRXVDh3d3lVL1IyREI2VFg2Y2FlMlF6bGIvbjVKUjlHUTJL?=
 =?utf-8?B?R2kyZDVoc0hJS1pIZEhZMGVuSzl0LzhFQWVGaGZYN2sxeGhScDE2ZE14bnJy?=
 =?utf-8?B?T0w2eHNHN0krVkhIQlRrMEg2NFk1SFNWTlIrRDdKZVd2KzRkd2JLZTNIS0ow?=
 =?utf-8?B?TmJWRWhFbHZkT2tDQm9PbzZuNTkwM0JpdlVka0VROXBHVlZKYW0vWXVhWi82?=
 =?utf-8?B?VlNUOEplSHZhN1pKME9DdFhwZlRxSC9wSi90RmNncWVtMFA2RTZmbnE3bHJt?=
 =?utf-8?B?QVhTQ0JWVy92eVAyaWdOQWdUeWRNb25mMXpjVE5oQ1hRdzdOZ3VGU2dQKzBx?=
 =?utf-8?B?SXhXZHovek5WZXAxRkluWm1ocDVrWUVXSFp5Slk2T3hZNlMrSy81OW5wVVo1?=
 =?utf-8?B?RTBjTU81Sm9VdnhHT3pjM1hQaGdVZDE3UTBXVnc0TzYxdmdnbFB2K3lZL1Jh?=
 =?utf-8?B?b2lqSGJUV25zaUR1NHRHbVlnNlRDZ1Q2RkZJSlduOWtpWkZIUTd3MnRYN0hX?=
 =?utf-8?B?SzUwS3BTakg2ZHp1eDg0a29Ga1FSdWNRdGxadFVtWDNWamNyVXdyYmdqUzZy?=
 =?utf-8?B?bVVKdytOSVIxcUdqMVVjU2FEbHQvZThJREs5UUl4QlJSdUVDYzZwT1B0NHVB?=
 =?utf-8?B?Q2FBamY3NEF4TVFxM0Ivd0V6bTUybHRLVHczMmZyMHhsWGdmbmpBSmEySzRE?=
 =?utf-8?B?S2VpMDJIbXkzQnNsWFcwS0tBL3pRa2JHdTNUUStkaEhOeVd3MUcyRHJBV0hm?=
 =?utf-8?B?a0pkSGxlQnJTZzdRY3FSZGJVb3VTVXdJWWFzblEzYjdMOUFTUm9mRnJSdHR1?=
 =?utf-8?B?bFBIRDVZallWaHo2cU0zbjlkbnRSaGM1dStRRU0ya3BHc1FJeXhzUGVsMnA3?=
 =?utf-8?B?TVV3UC9uZHNpRnh0d0RPSVpUQkFjSmc4alpXR1pMTCtsLzJpcDZ0anJGeFY2?=
 =?utf-8?B?VUxlVkZGMTQ5TU91NnV0eVk0SlBFWGRuV1kwakdNb2FzTmw4S3VVenBpUVlI?=
 =?utf-8?B?RmF6THpSU2tYY3Q5NEpzS2IxQ2d2cmJmMUw4K2dhMmFkMmplZUROcjE2N2d1?=
 =?utf-8?B?TklERXl6VitBeEJtMmJseVJUak4zQW95L2Z5cUlNUkx4SXdLZUFPR2RmaU8z?=
 =?utf-8?B?WGVETGxXZWgzYmkxRWh5UXE5YW1uZ2xYcWxyTWpnM2VJbmVpUVRnMy9tZWlB?=
 =?utf-8?B?NjRDN3BHUkE0VStUbTQvSjBTSHh1S2lCa01acERxcWhiMlRQL1BWYng0N2tq?=
 =?utf-8?B?YVRrZklzanVsTU44VldyZzNYakwrbmx0d0tpOVp1VnlVTlg0cXR6MHpNL0wy?=
 =?utf-8?B?V0tIZFQ3QlNWRGNkSEY0VHlBdXFrY3B5WlJkRlJmelFqUDg2Rk5GUDBEUjlK?=
 =?utf-8?B?SUJiQTNVeUVObXlzaEl0a3cyVWhOQm96V003dlFBNnhPaUlTSFRwTjBWLzN3?=
 =?utf-8?B?dXhsc2MxMXo1REhPdUpXUFNvVjA3dWV3QVNLWTNvWlhqNHNxc080RVNrRERG?=
 =?utf-8?B?aUJmM3FtVzNXR09yL3Nva0lOTGNEdmo1Z3c0aTBJMEhGU0FBR3gvZGhQM0Ur?=
 =?utf-8?B?Mm9RekRGU3RLZWZWS1ZyYXJuYWtLdnRZYkN1bWo3alZFRnNKc2ZWRExFT0xm?=
 =?utf-8?Q?pSgpCmQPArAzWTcYnyt11oBHa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a365d8-4397-47b1-6ef8-08dafee83b51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:24:20.9437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PGgNULCcOcrVDLTvb1QpHvXdUSN2mvTpvf7bVCzuFrmE4QpHAKdVf/8TS7v/9vn8cQj05ZKebGXQpOXz1nhSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948

Versions of the two final patches were submitted standalone earlier
on. The series here tries to carry out a suggestion from Andrew,
which the two of us have been discussing. Then said previously posted
patches are re-based on top, utilizing the new functionality.

1: spec-ctrl: add logic to issue IBPB on exit to guest
2: spec-ctrl: defer context-switch IBPB until guest entry
3: limit issuing of IBPB during context switch
4: PV: issue branch prediction barrier when switching 64-bit guest to kernel mode

Jan

