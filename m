Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8B578070
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369635.601096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOfH-00071E-7f; Mon, 18 Jul 2022 11:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369635.601096; Mon, 18 Jul 2022 11:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOfH-0006xx-4b; Mon, 18 Jul 2022 11:11:51 +0000
Received: by outflank-mailman (input) for mailman id 369635;
 Mon, 18 Jul 2022 11:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOfF-0006xr-Sm
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:11:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aec6ac5-068a-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 13:11:48 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB4321.eurprd04.prod.outlook.com (2603:10a6:208:67::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 11:11:47 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:11:47 +0000
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
X-Inumbo-ID: 6aec6ac5-068a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7EYNF0j+kg3WFo8WrkGD+n7F2diC2prlFeYd0dWR2NpHBvlPyWXcXRBFqnpO43kBuZ43BSkkmFsgg6GJujeZxWiMwzDrDx+QsRLUVFZubB2/v2/tOJOItGmex622BOyfTJ4fuoE1j29tdN3MvW1jg4Pe6OxbLVtVluI692z+OfwyDFejAbsO7Q9JyyUMUQMoDrTlenUHlPxUbQLgLUeIDjEnOhL7/zkVk4yBYsFDAaln5UKHgsKQ+gFop6YjkV3XJkShS8lnx9T3z1bA1DeBiWk6PRL9D4zHPoXPco1v26+Ax2XoS5JGJTOl2nN8cPqJtC8kbY576enJ/rSi+C9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43kb2Wrds5TSNOBRPSTFd3YDku/KYxEUrcx6EseKCGU=;
 b=DOC9C/5t0Q7ghmmFyXRFgaCEoJrVyVFMx08Oj8E28mtuwJOzbg8oQMnOaatAAPV4IO+pp5n/4HBoyNg5JCBqqCLm/tEvPw4R1IibsSiX7T6kfhyKuyxbNcjkOXrQ5d/XIRBsYy0NX8nVvFmA7j0qRbrv38+/0POuQgrJS60H7Lhx56zw8u8wZq4IGqKMwXULjH+sps/I4TS23mP0y1aOQSjBVGPtJUWgkQOMXSkVKpkFv7XsHXx3GbscCcyjqJ/JqmHvqTE9L8sQj9Ji0T3nEY1ry0keS5Zi0deQNAdk+js/rfmohFjrWKUbdp0uuaFHZBmCCJ+ilPv5HVRvPiDrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43kb2Wrds5TSNOBRPSTFd3YDku/KYxEUrcx6EseKCGU=;
 b=cKDupusRd7emRo9QAh2x+ZAAWyshec4Guzl/bhvejcYJTR3sa7tqSw+qZtPloul1RLi8u/6l+r86oPKkMZq7RVjGID1BFwMLcBcxaAqGVJQZ0GLbQdzakja8RN6sVX93wAvHaeWQDawtPaSocmiB5iheGE6fejuoF/56y0nClhg2PV8dao6ucJ5zfhdMgnb2vul71KQc21fgAl2SJLL/JB+whe/MKkiymULTqzYwiEsapYTtDBrU+S0ZAM+Dk2oCyxyMM9Fai9piju5haGxLr2NPEy5w7nW8Gcu3IugSIzUv6RTwDbHAoc2ddjIXZdDDODhcCzvmI1Zaqouv9nH4cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf69cbf0-428c-55d8-4383-6300a3913f2a@suse.com>
Date: Mon, 18 Jul 2022 13:11:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] xen/wait: Improvements
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718071825.22113-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7e9871a-bb6e-411b-fe0d-08da68ae4e5b
X-MS-TrafficTypeDiagnostic: AM0PR04MB4321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LWQzNT1PCSjLCYPIQUVIvy8x47gdDTifpW0VDzJ+NDKzhsIUlD5j4sLgA05gXO0paDyVxOVudQg+dUNWgGtUtcLwKtFDAfoOBRDF76NdVA7XpVNbaUNcPcJqcNnBU+xx1RLQNePIUKC5RlMXp/EEPaH17A74lxrQGQmzUQDJ3JYqNuXd0xbU8NuA1G9dTZ9JyhkduYEJX3DzKPdDk0s5S05ctzMTbncT2p0GWEa+5Agh+8TXQ5PvixV5+QWDMl6X8XJSYfGJNC5vNE3pYQ6vdG1/tC3nQuJZuCJP/yMz20CRd/c/++j93ZDbvEn3TBcWcM0lLkNrAky+NR+/YgjNlo8lxmnV4G3MgbSSANCSz2S50UYmEYHQUnfkRESWgaIJNu82GRhYrJwUG+g2EjPGqMyN1lshL+/EFSwFIoi6Zo2x9ADCVHH4A5IUMbaQ13zTFU117KDJ42hgQDaxU9zrLH0BPI9tIbbl/p8aFUOtd5LodvM1UMJ82W6PKJTsutgg1+WAYI1d6OkwrgGW1e9ncKmUy8sVGPMLPhALABKpw33T7u9/R8nMm4zoD3CaScHABmSdYC+O6jMrQVJs0/JNwNo+5/oqP0/ZQZWltb37lYMXMGK+QGeY4JDK97tI69TeuGTqMKMEtuvM6orPQoj/RFpOWTw47xgAnrA3YpQK/mPgLmiOzZ8EMB+LsOAnFz4iBWtHOmB+3GpXnlSJ2DN4SfK2FuSHI6TOsBtNWwU+HkTW4MMB4PxSZZPo3X9fe+UC4GHRjStraCRP8kgBEwcG4BaupGdvUorskGBllX0dzMQVBWsRUy7/795JsB8Aa3RByoN4sLmmtuo73VEjn0xl7437iueEdoURAXF5ro8M8Ec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(136003)(396003)(39860400002)(186003)(110136005)(54906003)(31686004)(316002)(38100700002)(36756003)(86362001)(2616005)(8676002)(8936002)(83380400001)(6486002)(2906002)(66556008)(66476007)(478600001)(66946007)(41300700001)(6512007)(31696002)(6506007)(53546011)(26005)(5660300002)(4326008)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpuZyttc2F1RjNacGhjSGJLSW05Tm4rdFVUazVkeWVoaVRLa0NJMElibHdp?=
 =?utf-8?B?d1lyUzFjbEQydGhjdm50NXBDd1Y2WjZXNTFXQjhJVUxJL0lkN0NjaUtlZzJ0?=
 =?utf-8?B?bXl3U0JpVFBWKzd3WFdyZ2pIcUg4VGtGL2krWk5ITXdSbHVlU2FTaVN2TFli?=
 =?utf-8?B?dUYvV3p2TjJUVk9VS0FkckVMUUN1QmlvQTFYajZKdGh0VlVUdmt2bVprWUVM?=
 =?utf-8?B?QkJyM3NCRnJLTU4vVGVLeGxHdkxVK3l2TWdoOVpOcVJjblMzRXVtUVV0VmFL?=
 =?utf-8?B?VlV1UDJMK0RWd0ZmTWVqQnEvNmZOYmREbDJJdFRYZG85QWNrR1lFUzQrZVBK?=
 =?utf-8?B?SzBvY1JXVFl3ZUFNQ2hRaDdzL3lzbi9HUmRHZGZMQVFqSEhwSUROYmwrdGJE?=
 =?utf-8?B?WHhhSnRmdUlrTWdJUWRiQXZvNXZ6TjVPRWpUNEhIdW1nbnBPNDE0S254WFg0?=
 =?utf-8?B?VXROd0dDQTJsaHg5SmFScW1aRzQ2WXl1QlZTWnZhbElDS1k1VzRoYUVNQ3Z3?=
 =?utf-8?B?RHVpSzZMTjViNGxVUWxiR2lzbm1VWXpJNHN1cUFRdlFZN0daSG4rV3VFV2s3?=
 =?utf-8?B?d0hjOG8yRW1keUlBYUVsY2YrSlFLQTcxSmEybER6bE1Oa05vUFl2Q2tuTXI4?=
 =?utf-8?B?VDkxbFFSYnZiQVZENEtCd0JlWlhTaEdLdk9FaU94NWUwVTJ1M2pjNXA3bmts?=
 =?utf-8?B?cUc3K2k5dmZXb3ZVVW9QaHVSTzhETWx0djBrbE9PRlJpT3hZUHB4bmVLbStm?=
 =?utf-8?B?LzU5aXB1TXVlUVB1UHZwa1dsVmUvSFIvOU81eEpCa3QzMFhybmM1Yi9lMDc0?=
 =?utf-8?B?aCtmVHcyU0xKUkdyREtRdVVZM3N5bHhyZ3BaS2RMclRWRURjRHNZcTIrRm1q?=
 =?utf-8?B?V3J3b2RoSlo5a3FOdDRSM2lXZUV0WFpYM3lDRXNOQlhPSzlwVit0cnRsVDJv?=
 =?utf-8?B?aUNheUdDQ2szb0kvZ2gyNU4vUm4rK2tnQ2UvQURkZkwrM05uT011Ykl2VzBt?=
 =?utf-8?B?R0tiS2wyNjFUYXhCU0lSTHI2WWtOWGNJUTdoSUJ0eFVwRERFRGlMdGcyRFFo?=
 =?utf-8?B?K2ZMN09uN083aVpQeUpqcmllT3V5M2hCMVlrT0NJYW84WEQyckIvZUh1dDg0?=
 =?utf-8?B?UHhLWWs4TGJBSGZmZkNjVnhLWWVXeEpEVEFRZ1cvMVJGY3pGanRMUzluMzU1?=
 =?utf-8?B?ejJzUW5tampMR3JkeGdzOW41MzVrZkRBR0oyaDRZT1NhMFdZQnoyT3RFYXRC?=
 =?utf-8?B?dnAyNk1iWm1sYnRsVG1OdmRRcEMrc1JFNllKNW00UzIvYkgrbEtTZjMzTGRx?=
 =?utf-8?B?VUpxTGxuSWZwL0xPeUh4V0EzLzE3MHFJdERQNWl6TGlMbGZZNThtQ29zeHNY?=
 =?utf-8?B?ajM4b1hURTZESjlWNWZOYlY3VFZMcXlPamhMK094T1VwSTd4bmhCRnhjdGI2?=
 =?utf-8?B?c2lZeHZRZXZ2U0NCZ2xPSjhsTXRGdWFtamRMNHloU0g4d2hQM1FuMmNtNjhH?=
 =?utf-8?B?cFIrQkpGVDZQbWVlckdYVGVxRXJjejg4SmZQWkd3Ly9oaFdncDBKVGFjOHlN?=
 =?utf-8?B?RTltZ2R0QzRGSzcvQy9CMEFKWVQxOWQyclNPY0Q2VE53VlpCK3dQMU1yeXJM?=
 =?utf-8?B?aTVLbzRYWXVVd3ZqV2FKR3BnT2FsbVMrak1mMHRqYytmVks0MVlKaWlHeUVX?=
 =?utf-8?B?VTdVeWlFUWM1djZFVzV6cHRlanNSUzBYMXFCSnc2RGt2WGc3a0ZXbUlXVUMv?=
 =?utf-8?B?d3EyV0RDNzZjeC9FL1hkY1dTVWplY3c0dVp0MWZwa1FTRGcybUx2anA3Yjcz?=
 =?utf-8?B?SDl4MmlhYlFmemN6d3h1bWVLNDRMVjEweE13Ym5KNGdWakJYTkM2bEkyQW9C?=
 =?utf-8?B?dS9xVlVKcXV3YlBCODdUVDdibFd4VElTRzR3a3paM1JEa201M2JIWnJvNE9S?=
 =?utf-8?B?ay9nUDFnNnMyWDNOaWhNTUZSQnFRZnZURDc5clFTZkNNWFYyVWNUWGdqREpK?=
 =?utf-8?B?WVpnVzVyN0d6Y3dBSWlCRzI4c21kYWNwR1locCtHNWtZU3dGZDNYZDlNSFNp?=
 =?utf-8?B?QnNybVp2Z2ZDTHhTcmdBYU5QdjVMbmFxVVZTMEZjMmpBWlh2TDVHYlpmZUph?=
 =?utf-8?Q?aFxe4QFbwIbrVoaBBHLMpmqQg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e9871a-bb6e-411b-fe0d-08da68ae4e5b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 11:11:47.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcO2wluWLekgHBZJxZRVogAer5/02K/DQeo2FDrw1agPsOt9lrIet+/wxyBTtbJbExNuJYBFa+onCYo4QWRWfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4321

On 18.07.2022 09:18, Andrew Cooper wrote:
> This started out as patch 2 for a different task, and quickly identified some
> technical debt, long overdue for cleaning up.
> 
> Andrew Cooper (5):
>   xen/wait: Drop vestigial remnants of TRAP_regs_partial
>   xen/wait: Extend the description of how this logic actually works
>   xen/wait: Minor asm improvements
>   xen/wait: Use relative stack adjustments
>   xen/wait: Remove VCPU_AFFINITY_WAIT

While going through this series I came to notice that we build wait.c even
on Arm, and I couldn't convince myself that wait_event() is actually not
reachable there when e.g. there's an Arm-specific vm_event.c. I would
generally prefer if non-functioning code paths were actually compiled out.

Thoughts?

Jan

