Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C22376B601
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:36:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574194.899424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpYF-0004Rp-L2; Tue, 01 Aug 2023 13:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574194.899424; Tue, 01 Aug 2023 13:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpYF-0004QB-I7; Tue, 01 Aug 2023 13:36:39 +0000
Received: by outflank-mailman (input) for mailman id 574194;
 Tue, 01 Aug 2023 13:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpYE-0004Q1-3e
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:36:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fd846e1-3070-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 15:36:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8458.eurprd04.prod.outlook.com (2603:10a6:102:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 13:36:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:36:34 +0000
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
X-Inumbo-ID: 6fd846e1-3070-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4ITu7ZdNEDYe8tPY23Di+f5HOzumdazDSq4CPS7mIeH1Pd0ZmirhnTy6CHQ2fbOlfbCV1HOKlUJ7NN3MMZx98g8I7PVgIeWy6LiH2wjOKv0Z4u6oojdKPIFujFh/5tscAHpqoiaDNZPonCkwY2gSJe4tnw6mLZ0c4Vkj0YcK6qIFxGkAKjLMlbIfOBzOnwKffPrNA8HMymRVQqA25FQ8cVB4NoSMEdAOshi2rjpcfUhToPWJanMHTETWxLmWr2TNlPWqcb8VNOY/w3GgKZNfMWHM6VkS6NLQefdfyEvzcordrDi1HLpns8LnCEfdjJMo1Ka6RuEetO9mPh0eZVc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hozC17tjp/omz3GU5XAC+yq/4W5SBZ74JNY0BYP1XQU=;
 b=gevGrBb6iAHHgmVe/es0x2Vnbu6GrRMb8gtxXw6dTjgJ9437cY3K9q29Dz5CSMRu/U6gdJz4aP1UQ9Q+gJbhpjkcYef7yO9PXXvr9aY5ZHI5icrgMtx233raegYdbENSbZNIIjmsbaYj3m4LzvI3nOQuNtzfEMeirLjP7dOQrn0IQRRjUn5c19C/0ttbw2h59utiKt8uWxhYEF/TS2BaQuSDj3LImQAQEaC+I203ep/rZ2rtNjDJ90mq53zuwsPNWdiaKjexWEXlut1cTggBYYFJpEHuKxIieiqBBkDqIZbb9tEDiZtcfjQHeZ74HGaqn4n16JnqIThOz0ZDZoRelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hozC17tjp/omz3GU5XAC+yq/4W5SBZ74JNY0BYP1XQU=;
 b=Pnd33K6GujtS++tpoxX0QVKi15Mh3+JOImaV70tHqhoh+wXLR1C7pkwvpm/X9d3ystRcdtS7czh6kisLLUk2TUg1ckqCOvFdSFXSTo+WWMUsltR+O1Z6E4Mm7gFy4cv39Zq/ZFWyIh6jsQcG0GSEG8L0KxD/ZRNwnq+cRCzhj6UP7b5M3yOuDE8oUb3wStTduI8gzJ370SB5khCYaSML009j61ZBnaORl2eoZkdreLsqXLSKrSdwu/RSUUSvm9rgFW0e59DDGQaETjteFBxNFIEtPgnQIpANjfGJy2SUgeemDsvNL7ctB2p95/3blERZ5i7UsKPm+Iio3MqbNyo3Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1a49d89-2643-8b6b-787c-85d53abdc0d1@suse.com>
Date: Tue, 1 Aug 2023 15:36:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 2/3] drivers/char: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690893696.git.nicola.vetrini@bugseng.com>
 <69fad93eeafdceae5de1f2483015f05d1798b6be.1690893696.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69fad93eeafdceae5de1f2483015f05d1798b6be.1690893696.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 888fc257-c8b8-4cf2-cd71-08db92945290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MMHDjYSwCFouI6pAydHLnDVnJhDCmCiNQ9aWQd0M4GcfycLCSbTzwyW4Dn5jiREw2AWBdIpbhkwzMkorv5HPNJCk6SY77KAWcfdw16SGbBetoKHW7zWGJmAbyTkSWCXRuKMk/OcmTFfd/Hf3iXLzB/4UMhhxLEWU+UFgkrjAFw2viv0GnYcSuQLRcSWxszdwwRZqDD9PnZdaOIw+vzGk681UoftV2KVGGCEDLw/hr3/ztD4lMond1c6w/+hOcKwi2C7riS33D7RJHHUIvdLxymAkCFtF+/9BD+XIp6U4fZ7G0LZ3g2KKkcBHo2cLrzBpEc+oviV7VIwLkfuAsd3nawhN3IL7csmeL6v4yRMpMtw58U6R1pxzccwk3kxYe1JGSYHyPtF9PK2o/N9E78pK7raVg1G0r52lPc29KzhJcjz6TaYFfjiCHgHb6ikfuXvBrDy52xGRClAtsbs43hUVvSzHrxguX7L1/ow9+UPsQY/8d5dCvdRQFOWGXgeAdBPFqTiSUoIBS9yz31zvaN3GGxPI+daJtJFxApgwgxK/68FbJQFqnRxeKGxRq+nwSW2N4uM/ir5RUFzDIrLagrYeC6Ygyp2c6t6oqqJ6yRShr42Qckv7/ln9AcYw82T2JfL5wQxS5kq4H7TYlCL1VB2v+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(6512007)(31686004)(6666004)(5660300002)(7416002)(186003)(66946007)(66556008)(66476007)(4326008)(6916009)(66899021)(478600001)(54906003)(6486002)(316002)(41300700001)(8936002)(8676002)(26005)(38100700002)(31696002)(86362001)(53546011)(6506007)(36756003)(2906002)(4744005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE40eEd1SjZEQUMzVEV1b2Y2Sm02RXpGUlF1Mk1peDcweERkUWFxSFJwQWs2?=
 =?utf-8?B?YmRvaW14bVpHc1NhM1U1SlpuYzRNaEtGTXJuMmlFUUNxRkYyU1RoN3FOYU9v?=
 =?utf-8?B?NDNqNDFRV0hZSCs2OHIyYmFZaEx3Mys5TkZmZld6RnQzWUNqYUZkNjAvREhU?=
 =?utf-8?B?bFFqNWdQb3Zia0NHR05SckJEd3BZWlA2Z0U1VXNNaDJXMFZwdnhLcmR2Sytm?=
 =?utf-8?B?cmNhZUJacXFhdkdtN0RJVCtXMXppU2JPaTgwWFJ2T1FZdEI5ekM2Z29xSVRS?=
 =?utf-8?B?MVB1NVEremNlWGlrbktIS2k3NlRndGZ5dFRrZzJlN25VaCtOaDFLSTVULzVz?=
 =?utf-8?B?bDAzQmVubUhtNUhUcW9ld3lmcmR5M0ZDWGl3TlhTdTZPNUxoQ3JBMXFCQUM3?=
 =?utf-8?B?WWtxa3EzZE8vV3hDVTVDczMxQm1ma01paDVZbWhNMVNUVGdyZkZ3ei9uRUZ0?=
 =?utf-8?B?eCtFWElYY3FOUnJSaDVxd05aSGc0OU9SSyt2bnBvN3JRc0RPWFY5SDMxMDE2?=
 =?utf-8?B?djVkR0gvYTJSSDNBODNCNDYwT1JWTFUrNXN3N2V4VnpnVndVb3U5MjBaUXYx?=
 =?utf-8?B?eERoRTE0d1k3d3BzNHg2R3NMcXI5Z3JGQ1F6MTdLalNrQi82THdaa0pjY0w4?=
 =?utf-8?B?TkkxaGdZcEtKSVpRdXp0ZlIzVEdWUk9mZEplK1BzQ3lRZzlFTVBHQXAvVlh5?=
 =?utf-8?B?anpCdG8vVlFOalY1WmxtMkNDaUJrQWV3anowQ1FWbjB3bHQrZEsvVEVOZjZt?=
 =?utf-8?B?Qy9FL0FPV1VPUjhQQVVJR0tpOWhJcUhNNzc3NzBRUTIxYy9ldm5yMVBTRkl4?=
 =?utf-8?B?MnJ2ZUpLc1ZjMEFsVThZTlBISUtpWTluVUpRSy9EeDVEbmxRcFFCUjFTblFu?=
 =?utf-8?B?MGRFb29Dc3FaUCtOckNkNWs2L2dXNWRQSnlINWd5bmd0ZFBjSHR5Ulh4Y29p?=
 =?utf-8?B?WXFPV0tyaUI4ZnQ0b085M1MwRmllUU1PM0lZL2NSaU9hT3c4cHZzK3NyK0xk?=
 =?utf-8?B?OGNQK1g1UC9hQ0lSOUMvUGdJVm1lbmFqZTJxSkZBMUdpSXVBSGlYakFnUEJx?=
 =?utf-8?B?M2VCRVVuSGRZTHZOaW1wcU1NZFo4UzQ5SUpjeC9RS1VaTWZCcFplak4zdHpM?=
 =?utf-8?B?UFE2bENLY24xQWxvUkhEODBOekgxaWVMSjNtUityMWYwWlRIK0lwdWdaYmNO?=
 =?utf-8?B?ek1Idnh4enVFRlkvcy8yWGRuWGMwNEtFUlRoZ2R0Y3V0VGZTazY0OURPalFy?=
 =?utf-8?B?OUpoYVU3M2MwZUoyYUE5QXNwbSttRHVYKyt3UDg0OXpDdklkQm0vbnUvZEpl?=
 =?utf-8?B?cHBvWXJOK21hVmx1V0x1MDNXQjZpczFYWThnbDZyUncyZ05ISXBIeFNzMFJw?=
 =?utf-8?B?eS9rbDBFdDNLTmlUZjJCWEVndXhyUFpFZjg0VEtESUxxVzUzMkluSi9XbC8v?=
 =?utf-8?B?MnJpcGhtNWNrQUozVFozSktQSFFESlJCRHNIRkZqUWxHKzZIYjhVV2RudzBD?=
 =?utf-8?B?SWZObU5SNDd3TmRTVCtTaWR4RW5rVGhXd0JJK2VpejVnVzBVYlY4eEIrM0Ni?=
 =?utf-8?B?SWlMWFdidXBXdUdXVE1XZmJUOGtCV3l4MXRENk9TZk5jY3YreitrSkJqMjFr?=
 =?utf-8?B?emhOYWNGQUtBNTJYbno2c3krTkNmNk9EQk1tck5VWkt5cWJRbllXYWowWlRi?=
 =?utf-8?B?RS91UDhtUlkxL2llY1FGYi9vc0k2QnovdGxTTmJZR3JKVUxoZmpFdmQ0eXl5?=
 =?utf-8?B?aFZ1ZHkyZEtMVWo1TEZPYWdrNEtqTnFzZ2IwTUwwRjMzZllnZUtCVEh4WU9E?=
 =?utf-8?B?MU4zNDBqWkxJQWsrQzhhd1N3YVVadktlbFdYU3U4TjduaU9aN0NZY3AvT3lV?=
 =?utf-8?B?ZTVvRTJ5SUYyNWZkRmY4WmxiRy9DMlM0Mi9HcVE0T2VoT0hmalBZbzUyTEhi?=
 =?utf-8?B?aXg5N0lHVm9wWGdCajBEbVpHakYxMU9XTjZlQ3FWZ0Vmank2eGthNUtBQzZm?=
 =?utf-8?B?aGUwTjlWOHpwRWxNUTdjT1RGRG1Wb0RLd1ROSFR5OEM2VSt6cXY5NFY0TC9u?=
 =?utf-8?B?ODVqeXlNSC9uVk0vSEhvOEpuMVNOMFpxVTJHU2IzdUVhck5Dbk10SzVpM0w5?=
 =?utf-8?Q?BXZySUJOh0qlhTRSCHysV/B2c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888fc257-c8b8-4cf2-cd71-08db92945290
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:36:34.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTwIbitSdyasAsnoVxynS4EcIliggnWwGl9HCNHAEuLptGOqesr8OBRyrO7tpMs8TC2SqqvSELBhIsH1fS1lpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8458

On 01.08.2023 14:47, Nicola Vetrini wrote:
> The following strategies are adopted to deal with violations
> of MISRA C:2012 Rule 5.3:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope".
> 
> Local variable 'ctrl' shadows a variable defined in an outer scope.
> Since the innermost variable is used only once after being set, it is safe
> to remove it entirely.
> 
> The enum constant 'baud' is shadowed by local a local variable at line
> 1476, and renaming the enum constant avoid such conflicts.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



