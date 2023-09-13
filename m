Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE60079DFD6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 08:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600964.936827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJ9o-00034L-RN; Wed, 13 Sep 2023 06:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600964.936827; Wed, 13 Sep 2023 06:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJ9o-00031b-Nh; Wed, 13 Sep 2023 06:15:24 +0000
Received: by outflank-mailman (input) for mailman id 600964;
 Wed, 13 Sep 2023 06:15:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgJ9m-000319-LG
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 06:15:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94d16a9-51fc-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 08:15:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8651.eurprd04.prod.outlook.com (2603:10a6:20b:43e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 06:14:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 06:14:49 +0000
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
X-Inumbo-ID: e94d16a9-51fc-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQb6JrD8v39jiHDCkbvJ0qpjsmNu+LV6NURvA0u2n8EC65b/ytZ03tGVxIlCeZ+kWtPhsvMiTfYuWzzAvO8KaTxa+BfEW0z2WoktAdU2dBQxUNZhX9FXWpiZQIKL21No624lOMZOwtf+pfjMzH6gEH/jJCszzDljlqEXatUalUjrnvXGCV30aePo/aA9wWJRJqX3QKFvAeurdMG1Se1WL22Wx5M5kl38Qu8geARUKT7gAAGDRONag/xn2wFO4UexhGsvYF8svT8l35MQL5OrXDCzpl4n1PqpJW5Pb0G20MgYvxk/cSs6fyPGkT8AzlQIZjC6NZ/n6m27GzpgQs4btA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doQScRTSSLO5FgT9Mpf5bp5s6lb3TaNX/sW5y16v3J4=;
 b=W+tVlGuwxSbhqyN9HhKVq4nEbdRBGaDYWWx6ee2XSteKyonZwYduvd8i5kTTLUII41cFWxDCLnFYkk4zJpqjykx5ZmRAN+BjP6zWR+42CrOGumb8Ki9U7Q44rVzwlCmrb11tAGtfcIvkuWRYqndgfncrUoBa+oK1iSDu+ULtuUFN3Vi6JaOplIpszO0QcVSsUP9bbVDdpE3yEunq7+oRf++vYJL0L3y3qwbFA4cWMaVVe0+JXGxnHlf29HzGBiorr81pQ/MZgWcQ6nFeulNhlXbvG47XfpTfE4KtVDmVkzL02u0y1IbQFIisq+3jM/I8HJjlk4T284/XksZw1wBcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doQScRTSSLO5FgT9Mpf5bp5s6lb3TaNX/sW5y16v3J4=;
 b=lkOMEgTgPAhLswr416qm1pJQ/YYfpdiS+5UhXjSxGSEDTGdPDIXRUMXtaayh0tivKtDjgHPZLDAka7tZqvp0SXQREt+ZlmTAnb3T72nAqxIQoK52TRt8FrmYX8ozC7kxeXXMaWHT0li00KinXXei9yy2/6BnPvI+9PNtouHsJxRE3Ejd1slO8mb9b4J30tfDQtllUmn6z/BHj5fnxAq8M0USZGtNf1q+wigbLT4ttKWoo2KVlmW5Ayg6HcrYrcoup82ZQOdSds0atbDVaWRSZ2O4BiDFomLxkYrsLXyV1powNsPVpOnp5bep9DVKvcsXaBnCKY+LF/gr6TjyUFNfGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <809ef122-7060-c033-e50d-6e372ab89de9@suse.com>
Date: Wed, 13 Sep 2023 08:14:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230912162305.34339-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230912162305.34339-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: fcecb6df-f4ce-4b02-de67-08dbb420bbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wFYXtuCMe30NVJjUxlnedwxB/CUGp0YwEzNKsOwnEHjZicqjX00EByjOGp22sNfpCerEbvFh54aMoZxQdCo+UO2sRuEHj7LmzcLZfmEe+j8Tk2z62n/8rR2gDMVXWTiL+SIj2ZIdfznBj9r/2QeeZE+gcC92VFfWNZiWWDrUhQWgyO3d4Yd93e5yDkY8nzmAPrrr/pfvLQmjCCfkzRtcbJJCgywBak954RcTMUeqInPOnKsxxJv0k60/i5lV2cXTZrIX8a2087F5HnCECpk5RZYFEE20Z9QDjVYDjdwLIjSfBcnkz+pPO1WZuPK8qIMcNKhGxy5Q7L94EkfMYY73SMSCZbA43qJKSjm2+w3suWwyg9l65PnKeGchloyRG7LpS4GZMuf6/4FQ7KInkjjj8Ide2+8F1jFWPgn7rw7oN6gFXfvfG7+gVo1KMx5a9wChRBMERysKonxJBZkzo7/EXM6XkTGYfKF+K3QVUvpYQMlXJB69x3iFmxlJiyx+0g2bMrHm3+IKc9CpGsHH0E71Oryc2tIGrR6SWzuSrPRByYWfHKNpXvvsl4upQxf9p3Y3cAsDUprkWqYuQB9NzGu3gjvWbx4N1J3YIdPUV7zrgNMJBglkda/prNOILJmvODk4weU3WoY+S/alRnYn0XPaYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(38100700002)(83380400001)(31686004)(54906003)(66946007)(2616005)(66556008)(41300700001)(6666004)(6506007)(53546011)(26005)(8676002)(66476007)(4326008)(316002)(6916009)(5660300002)(478600001)(8936002)(31696002)(86362001)(36756003)(2906002)(6486002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmdta0JRUm9HQVhkd0ViTjNlMnlQbnBudkR5NFJLZmRidDR0ZE5mSWdFWE1v?=
 =?utf-8?B?SGtlbldxeWVZTHdTc1FlYU1YUThScStiYVhFZUtnRnVMdXlTVFFQRG9BNFdC?=
 =?utf-8?B?dHE4OWh3eDdmRnZyTVkzN2NsUUdXTHh1NVZJTUNPamJiZnhsVVhaTi9ocytL?=
 =?utf-8?B?Y0VqS1RDNVpwL2VGQnJWbTRkRUlzcjlkdUtNVHloUzlRbUNHRlVJSy8zeUJR?=
 =?utf-8?B?UmtPRVozUDlsbEJSOHNGaVluYkZ5Qi83V3NiaHBRWFkwR1RCK0RxR0JDYVVC?=
 =?utf-8?B?NnE3QjQ2c2Z5MUxKRjJLaFhFWkFGejRra3NCcGNRMWhLY3lyVktJVVpHcUZm?=
 =?utf-8?B?UThyY1ZUWXRHcndXWjVkVXlSeW9vN3lQRC9sS1RGVVNTbDNIWVhQeWZxeU4r?=
 =?utf-8?B?K2UwYndhTWFjazRoUHlRb01uRm80Qnlxejk0ZzRFNUVuTENZc1BzTzAxR0M1?=
 =?utf-8?B?QU92eEhDYlRNTmtuZXZUdjRESXVMS0VGd1FpOGFydXEwUXY3aVd6RzlqVzBS?=
 =?utf-8?B?OG1RMk1RK0FKcWpkTHMreHRZT3NYdDUzendxMGF3aUZ1anY4cVJoUVZ3Z2p0?=
 =?utf-8?B?bWNOMmFURW93dXBSYllkWi9NNFBvQjZPVDdtdTdLQllHVUYrUkVWUXNDY0pp?=
 =?utf-8?B?a043TzZPYkVOTnNsZFRyWU9kK3lLTzNYL0hXR0thM053WGp4VFNMeWhxWi85?=
 =?utf-8?B?Q1ltczAzTWFuOUhkNHJidmd6QzVtZkozcjN4Vy9DdEhSaGRLRUtQSnNSZmZo?=
 =?utf-8?B?LzlDckFMNmIrV0d6R09NbklLcjVkMmhJR2hIS2JoRU1RZnJmQlZpdENXcWFj?=
 =?utf-8?B?SmlOMk1ERDNUQTFHZUxPdjd4cnU1SXpleUZMdE5XdFpISzR3NmliV3kwa0Ju?=
 =?utf-8?B?Q0E1WDZPSnUvM3pObHd6VGtja2tBZFo1QitNUjRycmhwWDJBV3JPd2FZZG10?=
 =?utf-8?B?Tk1MQkpldkRteWtFTU9jV2V3SUNGRzZRMUNSR0FzOXRqQVZGVFFLZzRqZlJL?=
 =?utf-8?B?V0FOZDNrMEYxOGRLd1lzdW9CcmJ4elgvc0FkWTlBM1pienNzT1E2Vm5kUEJJ?=
 =?utf-8?B?TFdzRFgzNndicDU0bWlFNktHbW0wbjg4NzBsdWNlVkFXMXl4dGp5L2l3Rk1Q?=
 =?utf-8?B?N2FqSFhCcHVNVlV2NC9KZWFpNlR3TmpDTE1DbFd5RGp3TDZpMytBS045TFNY?=
 =?utf-8?B?Q3FXdU5YSEZJaHZOSTM0TVdqM0srZTVTT21RaWRXZmpoOEJSdlREanowYjQ0?=
 =?utf-8?B?aXBBcklpWWswL2hCWWx3TVBRVXBOWm8zYWJFakd3TnFFem5wTzZRNEdUZ0ZR?=
 =?utf-8?B?VzJsdnJUaFZ3b2tqQnIwRlJkVXZRTzNydGN6aVFnU2JBaklZOGh5N3BpeHEy?=
 =?utf-8?B?eVg1d21ZYndUWXpSNjAvU1g0VDdYd3UxZGRKL0JEK3NFWExBeUhFckxNZVV6?=
 =?utf-8?B?dmNyWDlqajBTWG9leGlGc0w0bzk5UWNXcmM0bjIxWHhvV3ZqNk5aUXpGclJq?=
 =?utf-8?B?RFRueEpBSHJFcGRZTzJXS3Zna25VQ0Q4WTZ2ZmM5SmRqK0swM3BmTktnVGRq?=
 =?utf-8?B?c09NdE94aVZVaEVveHNmYTFPdWt2MXRoK2xvMmg4M0FjMmdyeFd6cmN2Tzla?=
 =?utf-8?B?d1lOVWJJYzZjSmdxeDJHaWduTytkbmFzTGR5bUwxcG9Pa0VxV3l0eVZKTGhm?=
 =?utf-8?B?aU1hU0pKRlNuZnovWFdweGJXcS9pMWQyaUd5UDFJeTBLb2ZwZFZXMDlXbHNu?=
 =?utf-8?B?aTVSOWNXWlZvYS9zc0UyTnArdEdNMFl4a0dGL0grMDl0QmdoUWFxQllwazhG?=
 =?utf-8?B?bVdwSE14MlZRRmxITWVPZ2IvZDQxUVI1RTdZMjZpZE9XQlRlQmV2K3FFVUJT?=
 =?utf-8?B?OUhvUmV0TC9yRVBjbFVleWdOaGxyWXpVV3AyZ0xQSTkvKzFIRmdJQVgxR3Rm?=
 =?utf-8?B?TzFrUC9OZldHWWtRQ2U3WVlpSGNYeUVoWnozQkxha0VaMEpkRWhJcHdnemtm?=
 =?utf-8?B?a0hzKzBFeGtUTW1BT29uMUVNVFVnMVQrdHB0MGgrS2JWSkdweVo3UXBvYlJn?=
 =?utf-8?B?SWxnMHpGSVNGd2FSek1PWngyWTMwbktXa0xqRy9zMm5HMUk4TWpOYno4Znls?=
 =?utf-8?Q?MVwxCfzSuq2uu8mSV38GWTtcv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcecb6df-f4ce-4b02-de67-08dbb420bbc9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 06:14:48.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdCG2wssE0okIlHu4xX3Arj8e+Ti1bUx0frHx5IC/5vuqI9MRkLZ3EOvfzIQh5P5uekWU0KYbYZUhOs/ODtVRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8651

On 12.09.2023 18:23, Roger Pau Monne wrote:
> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
> set, and will also attempt to unconditionally access HWCR if the TSC is
> reported as Invariant.
> 
> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
> a suitable solution.

Why is the warning bogus? The PPR doesn't even state what the bit being
clear means; it's a r/o one. On respective families it cannot possibly
be correct to expose it clear.

> In order to fix expose an empty HWCR.
> 
> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Not sure whether we want to expose something when is_cpufreq_controller() is
> true, seeing as there's a special wrmsr handler for the same MSR in that case.
> Likely should be done for PV only, but also likely quite bogus.

Well, keying to is_cpufreq_controller() is indeed questionable, but is
there any reason to not minimally expose the bit correctly when a
domain cannot migrate?

Jan

