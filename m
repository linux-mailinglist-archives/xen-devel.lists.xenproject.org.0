Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DC651E15
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466865.725825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZIU-00088M-BW; Tue, 20 Dec 2022 09:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466865.725825; Tue, 20 Dec 2022 09:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZIU-000867-8X; Tue, 20 Dec 2022 09:52:30 +0000
Received: by outflank-mailman (input) for mailman id 466865;
 Tue, 20 Dec 2022 09:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZIS-0007xL-PM
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:52:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03306b54-804c-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 10:52:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6819.eurprd04.prod.outlook.com (2603:10a6:208:17f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:52:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:52:26 +0000
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
X-Inumbo-ID: 03306b54-804c-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjWcULBnHu4QScCMESkinwgfVVAjJdZqQrRMwpcxsQlKWHmxpGe/AvbBmlV0nacuX28p4NOVR/cAHWHluyMtCXnQgQHtmUnns2cCQwueGQybkHNGW5qCN4e5IC24fxOtgiCSThFbKW1/bssd4wPgkvTrmlCZYeHIc2AgdXmAFTpVCL7WyemM1WRVc2GVeR33y+hCSpOa8eFdOYGQVk1IRBWC0r1GSyyp0hK7HyZHCmo0OMKvn8TcNhzwcEjvN+w3dyZTk1JuT0rINDko3C8xNUbpbboEN+K9Hijl2L43q6pyS1Od3cH31d2v/qgYG1hqZpiZSDwQKBtD3n8ITlkuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTDByttxCEHiPNBRsHx3W792T2F0LzDxh/xVD/1Xkjc=;
 b=L0P7GQQ/I3uNRHCWi2OcIV4xd+DwE1TlW3AwIEZ4Ry/cdq1eFsai9ACXJzaKBi3IvOMUJIMMPVil/RamdAqRnUp5KZJtsFHLE6NGn8msEEZhRBZXbE3anyPZXdt/2ApNurOIiWYrM364tsP6HBJXWWbc8m7hKmh5vq/pN04YIJ/KMM67h2WyEnu2i+VC0bhnIL5e8qqib5YSFhNPy8UqW7aZmK3GW3SWi1YlCWs5b4g3UE83KmKRtCjDdEBGTbwCqEutqu+CuFtVfeO4un18Z+O8t9H2mUMBj502lwtnYmVjDE51ES0TlqNcUagAYAQa9mQGGxk7uyz2NlM2Dm7aIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTDByttxCEHiPNBRsHx3W792T2F0LzDxh/xVD/1Xkjc=;
 b=hzkD9UkkJ2+XIIWSh1Y8LjT4srEaxtTCubRAEH/o0LEgMX0ELRXHdujPQho15/SdPErnJUyewT1CBGwutPRgER0fofzckBJrNzUe7IXhDdRwjfZEd5DHpkbW1OAdra8DQ4lqI2/R4xCeAirPnNlNgdsLkvwlaimOcgY72jKDHYM/dP7JfZ7LDCeN8vtYsxSlx5vc+crXN5hW1GStPGDS/9YlcFU6pFZKHf8zwtgSB6mmMwg6GRYDLS+ST+2fRs45422HDwrFttKlfH358TN2W2AwmqAEpQJ5zbaOHDhs+kdkxAl+6LQzL2yAMzQBs1iaQr6DhymMJU58nQGMnRV1Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f508140b-09e3-87bc-3f86-a97a5737c7ce@suse.com>
Date: Tue, 20 Dec 2022 10:52:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 18/18] public: misra rule 20.7 deviation on memory.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-19-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221220085100.22848-19-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 476a6515-af43-42ef-b9f1-08dae26fe62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/CoS79rCgptAJAaFGWWziTNFKpZy5mjIpuCAE3XiKivBBanWq4IoQBVreMZs1M94cBIqnOPgmRokuB5pestw+IszpJw8DT/AKmJuHtiFUrv10/f1up/69iz8e8s3ajS82K8u9SYYwguqpE/6vIik0xO9KC5DZWES9Q5iHl/Bx5oTU0x64RFAMyzV8vxJaDdRbSNRIMDkH8DokEpik0RAmfWkDLg10GCL2c8g0imsiWT3OQNFiWJMz4Q8frsFLJE4QpGE66nT1afWlPWHqM6qigBmPGQFODMM45R3SMTNYJ05C2mU7kUXRdM5t3RCZwkP76lX/Sg0faVwz0UEBAvv+sUbVD+Z1LIboQ1ZYgwXkjJlUCergjk2Vyqn/3PBH7lnxiPLlHCEhV3DALkZMVLuXv6ldIddR469HTjZbK+9QI5RjuEFwFCzM/aHyTHf6Y0P4GMl/En9yTgOhK7LGTkENzOkyujvyKEJsDKN48U0iHmOqgZY1NnORDTO4GE/XU5+7/XZYqdFcxvNz+Rk0PpjqyQ78EU0OQfwttp6U3poQmGRSR9QoqQIIIcqdxkZvj8K4RgtNCm8PxyFr7sD4GDWI3/Tsz5V05L27BlquxkH5lwNJfsJHwetyEWNXl494dVG0XxBtMoqFbabu8JxSYnt31snd0yEWHvGNWd08YsUnXNthQk71IcxG+1w712W0gZTZNUFZg2y/Ozo7q4fSP0Z33iz+SQJ5jbv6xrHXBokleI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199015)(31686004)(186003)(26005)(478600001)(6486002)(36756003)(31696002)(86362001)(53546011)(38100700002)(2616005)(8676002)(5660300002)(66946007)(4326008)(66556008)(66476007)(6506007)(6512007)(6916009)(8936002)(4744005)(2906002)(54906003)(316002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUxPOW52eEY3bUNQUlpaRkk1TlEydFJHOG9ucFI3VlIwUFlHTlpCSVgvL1c1?=
 =?utf-8?B?RDcxOVgvZW5aSC9FMU0rUFM1dWM5VG9hci9kWE5wR2FPK2hGWWpmK3JwMTho?=
 =?utf-8?B?MWhxSmpjOE9XMXlCYklPSnJHZWx5R0NncUU4SWhEQ3lSTXVlR3RzVVkvcjMr?=
 =?utf-8?B?K3FyYlIyL1FEeVVQTTJpcmo3MWJzOHJJK3hwTzQyYTZZTm1XK2huZnVCc2g5?=
 =?utf-8?B?dHhqSVl5cGZtR1R2YVlCbk04cVd6TlNqc0NIaVpodjdEbGFhYXgzUWU0OVZY?=
 =?utf-8?B?a0svZnZucENQQXg3TzI0dGlsNzcwY2hkODhTWkZBT3lUZFRRZkp4OG1Tc0lu?=
 =?utf-8?B?VDNFWlJ2UEU2NEMxcEpxOHRiWWpqYVM1SGtrTVFtVTNid3hCZFVGc3pzdmY5?=
 =?utf-8?B?TnJSeVZ1UWR2UUNCMGxCQVFBZ0Z2TC9qNlpXNUR5d1F3SXFLdThYNEg1TlNr?=
 =?utf-8?B?dER2NExjSi9SUTBhSDcyQkM0dGFtYkNDV1V4NWkzc3I0eUNybm9EZEtyR0M2?=
 =?utf-8?B?K3JRd3hjdXRDYk11OHZiaXZXbzVPbVVVU1lRU3dVaG82N0lHRnFpdzRpME9B?=
 =?utf-8?B?cDdNbmRuNzhPT1BCQjVZalpPT0hiYzg4UU1VTldjTUg0NnBDTmJSRnJSSjZQ?=
 =?utf-8?B?SzlGN0FxdytBQ2tkeWducnNydldNeTdERCtVVnMvaGt2U2E4ZnZGOG1CNWM0?=
 =?utf-8?B?TGNkLytlSEhFbnpSYkpZZkl0T3QxUkNwZERCZitNamFDUmNkdDByMEltcVAy?=
 =?utf-8?B?ai81WWFUK0xnakZ0RTJNVFo2dmUvOFlzUndRbVB1VmFxY21NV01jSy9sbUpt?=
 =?utf-8?B?d2pXME9JSjJnQ25sMTA0SDJyUDZiWWJOSjg2aFY2dUttWW1jcUljdHBZSm9p?=
 =?utf-8?B?dVJBL0dlbDZjYmtBU2paNzRJTzNKb1Q0a2tXNE9QdkJaNTc4c0RQVFhyRG16?=
 =?utf-8?B?L0RQT1JkMUFlNC9WbnhUZnZIV3lPQkZWRnFKZ1VLbk5tNmhtQTRldmRib0J4?=
 =?utf-8?B?MUdTMjByc2JTNWJ2TlJxT291MHJ3dXkvdi9TT0dDUlJUQm1WTVVtb3N4OHF0?=
 =?utf-8?B?NmNZVHpRbHdiMDlxdWVKcXVxRStqLzVaR05NNFQvRTcvcUE3ZVRaU0V2Qng4?=
 =?utf-8?B?WXFRaS9tY1Q5c2I4LzhBM0pYTElsV3VzK1gzME1oeXdVSitrSkVKaWZyVjd0?=
 =?utf-8?B?WkE3bE1EVW1qRkFuR0xsN0kxSWhuR0xSZDloTHRmdDZRMzI2QmZNTVVSRit2?=
 =?utf-8?B?WVVpdU44ZFpQRlhaUXRTNTJFTDZ5Tm9JajVtQXI2bGJ4azg2SW1mU01seUY4?=
 =?utf-8?B?RG96a210VzRIM1N6dngrTm1MQXQ2N0RDUzdwZ2dYWVJMNW9Sb2dOSE5Ccnkr?=
 =?utf-8?B?WTBEMmZaTWpJN0Z5Z0JlVmpSL3hVdjdHL2U0b1NHSUsxejRrZnJUSDVhRDBD?=
 =?utf-8?B?d2NFcHl2R2drSUcrOGFHRUJkRjVOY2JPMERXbW1USnphNFh4a2xOWmc2Tjdw?=
 =?utf-8?B?SmM2Sm1xcDBJU1drK3pNb1pYaDI2bWdMcGdVQ2RXY2FMbTczV1Z2NVdMMnQ5?=
 =?utf-8?B?Zk9xaHNZNTZFUzcxMGFwbXNzQm5NbDRNbmxOWk0zMXE5ayswVnJsNWRSZHZo?=
 =?utf-8?B?ZHFDeTNMTTlmYzlqWFpuRmZlUWd1RzFDUlp5aWVxdDcrWDNxMUhEeWZTQjV0?=
 =?utf-8?B?TWdoR1JRb3VrOXR0REo0WWttVVpkSUVoSGJYd2UxbERHL1VhM0dmUGY1a2Fw?=
 =?utf-8?B?MjNHU0FnNEFsK0c5WlVqVEV6USt1TnVEeVB2QjQvTjJmWnBwM3RycjZmamoy?=
 =?utf-8?B?WklkYXByN2g1ZndpNlczOC9YN1ltQTFNRmdUSDNwV0k1T2p3OHNZb2Rvb2FC?=
 =?utf-8?B?QVI0bjVIOUs4bDVNNjNEcXhkTURsN3VDSnRwT3FveGJlUm9yQms5VVF4bjdV?=
 =?utf-8?B?dVNUNTlFN1AvOXU0RGxuNWtUK1JXVlR6LzE2aFgrWGEwTER6VStxbWZlUDJy?=
 =?utf-8?B?UFJOdXZPaFZoYjU1ajhEZmZENUZZZkNWMWJzUys0U3BDL0ZjSFpPNlZzenBr?=
 =?utf-8?B?YUFuNlZIWGFEM1U2Q0NCdzhFWnRKSHF5UzF6UWROd2tQa2lmekdQTXRGaXAr?=
 =?utf-8?Q?nfxhJW1DXyDGb/xrCP45RVXuG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476a6515-af43-42ef-b9f1-08dae26fe62d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:52:25.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3DzsweDci0Uq6b0QM0qQcCiOL9+tLnfQ4t6tQ8/MJ/ZgWMDCSo24UOZrqXvOvVRmsH4RrZjbJtPG1a6bIlkQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6819

On 20.12.2022 09:51, Luca Fancellu wrote:
> Cppcheck has found a violation of rule 20.7 for the macro
> XENMEM_SHARING_OP_FIELD_MAKE_GREF, the argument "val" is used in an
> expression, hence add parenthesis to the argument "val" to fix the
> violation.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
again with an adjustment to the title.

Jan

