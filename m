Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F4CAFC90
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 12:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181487.1504522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvzZ-0005S3-Iq; Tue, 09 Dec 2025 11:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181487.1504522; Tue, 09 Dec 2025 11:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvzZ-0005PK-G8; Tue, 09 Dec 2025 11:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1181487;
 Tue, 09 Dec 2025 11:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCo+=6P=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vSvzY-0005PD-Ez
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 11:34:52 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12cbe32f-d4f3-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 12:34:51 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BN9PR03MB6058.namprd03.prod.outlook.com (2603:10b6:408:137::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 11:34:47 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 11:34:46 +0000
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
X-Inumbo-ID: 12cbe32f-d4f3-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nelB+h2Y6vD2eI/5gS+/SGLX1AcVxmbZCjfQhFNVz0SzTGKN82ZrRCh8B8vygYwRjoYQkfwouATh0PKK7xZ7LxZaZ/xNWq+aSINGGn8V0t0h7/P9v8P90VgHQPOg1b9YFb9GGIif42M8SESxv2orgqFKuCQUT3UsBqWYkUDRgrwl68zzzYd/AlElcf6NDMPaaYNTOoK5H/ndozETaF0ZG9SSh7zXkLnVGF5+H6/oAvBNqK8eijk10t0uRcnTTTjgwaalNlB5seP7jED+C95p4Fg4QoC9bTBrMoEGPTkzITYTkIpcIXf34NRccQxvg8acINdd2m5T+hilGTS18IGXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8/Y2O7Arm6bAbKSoGDzhoy0307+o5PRtRKvglM+Tts=;
 b=FycJ2c+eNzzCTM1CfVgenpMNrDA+GTDYUOpWzO05/IEv/1fcwdc8M71Nbegz3VBSuNtJIqBOLQe0Az6rXD/vLkSjgRVL8jxMGOf8WNvWfFfuILdWXmaj8z2YlxHRYHdkF6YdS6AWzA7KUo7IZbF53fquxSNB9/nUibky5R7UwLMKuyka+cFpEmnIs91R//X/mKuNFyYptPM4YBsoeZtM0JfjhJY2FVEV4Cf3BottRJcsJYktrcWvhgzxpcUUXminvmHbMZQP1BiXWuq4XZaz/kzNdbwX1m/pnmskQvPY2KMOJdd1ykkCEltasVtoUwcl+I3kjA5QNZIZsaW1f5CBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8/Y2O7Arm6bAbKSoGDzhoy0307+o5PRtRKvglM+Tts=;
 b=FpMkfjHKxX/yOqKJoCGySKSmhl4OZyqnnJ/cfH1FjakCkUhy6VLwrd+hzlT8e8ErkGk8X+s8B2Weru6PTZRVEML8S51FIu9n3XUxgpGdC9MvXjkZiH+n6rsBv7UTi5v4Zln7fc+f/rzNXLz23Q4ExpUSKTPZnKEenMmbR6UfRwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 9 Dec 2025 12:34:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
Message-ID: <aTgJUvqTIQRc66L_@Mac.lan>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
 <aTLjwbcm4fjwNJfb@Mac.lan>
 <b03a8039-e4b3-42ff-9781-031bf68ccb72@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b03a8039-e4b3-42ff-9781-031bf68ccb72@suse.com>
X-ClientProxiedBy: PAZP264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::9) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BN9PR03MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: c789119d-d2a7-46f0-26f7-08de3716f4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eExKNDZIdTNjdXc1Q2dqbks0WDh4QVVaMUhLWGVEdHNPcVJGME84QzBScVZG?=
 =?utf-8?B?MTJpZDdIbGxYOEp3TXhtK1ZWbEF5OTY3RXBFMklGbnZTOXVhM3FMZ05kd1hF?=
 =?utf-8?B?RlVNZDFPNVZIM3VzKzR0NEFFYklQamJucDRPMWhUYmt5KzZFOEVjS2lLc0Vz?=
 =?utf-8?B?b1RmSVE1ZUxTRGJGS3lTWE9RWGdSS3JtRWhUbk9McDVObjc4UmVqQTluc2NC?=
 =?utf-8?B?TWJBMjhnTGkzWjNNei82b1lYeUpxem5Gc3UraHlHUEJkOGd0WXJZMGVRQVdl?=
 =?utf-8?B?RStQZjN1NTIzdlFSKzNqTWNmLzBmUFVhTGRvdzdFbmZXMDQrUWhrN2NGVXNk?=
 =?utf-8?B?OGFlR1gxaVNFTzdEbERqVWhhcm8rdDgxeW50RUp2cm5yZWhldFRJYTBFaEsx?=
 =?utf-8?B?OUI4YjZLM3YrdnRTMnZ2cFJGU0ZrRlg2YjdkQTJaTUo3NGVsYm5MK3lYM3p1?=
 =?utf-8?B?SmZnQmFoVEdUMUhvR1BHa2ZURnZTenFqUkxXQnU4ekRtdllxNXQvaVkraXVG?=
 =?utf-8?B?OGUvQXI2L0I0QkxIbEFGcXRJenlxTWZzZ1JSK3F1WncxRml4SkFBaUpNdmFh?=
 =?utf-8?B?UWQ1cXNQV29FTVdJT2hNUk5tZ1NKRkpGREI1M09lU0xiS0FXQVBFM0Yrc3pQ?=
 =?utf-8?B?V2Z5TSs0aDZMb3VNV1M3Y01PZ1ladkpaUndPa3V3Q1I3b1pnOTg1ZUZmSkUx?=
 =?utf-8?B?NGhLaytYcWJGT3FGQkd2ZFA2YnhkSWlOOXJTbXF5eGRpalZvUXNORlNkSTQy?=
 =?utf-8?B?V29IYmtVU2Q1V2ZEOEhvZDFpbWxIRkFnMmJOc28rUzFKUUVudVppVzFXRWpD?=
 =?utf-8?B?c1BFUWxCd0lCSVZtUGdkcHJKNXkzTzBSQlV1TnViTHhVN3ZocG5UbmErUjJ3?=
 =?utf-8?B?SWZ2aWlBMGJ0eEpVcjAzb0hkSGJqVGdMemRPanNBWENWbXNkK2pxLzd5cHdr?=
 =?utf-8?B?R051dFdzclpLUVVkeUxXN0V6d3MzMGpKSWVmN2xPUSs2TDVVdG80alNwQlU1?=
 =?utf-8?B?M3pHbm9mQzRPRDREaUNGY1kvR2c1QzA4NHU3TU1ZR2xIY1R4T3BDWXJtbCtw?=
 =?utf-8?B?RzIwL0QxbWxaRTZyN2xQblNDakhmckh3TExjWUU2N3Z3SVVHbU90VFRyd3dI?=
 =?utf-8?B?ZE90R2xIQktLbXllOXVGalhZQzhORlEwZnNnTk9HSkZUNWZhMGV5dnRJTzB2?=
 =?utf-8?B?TEtqa0hCWGI0MzU0cEwyNk1sN3JSalYxcWdaS3gvQ2ZyS3k2S0FnbWdMWVZK?=
 =?utf-8?B?aWQ3Mk9sN1Z4RnFGUldNQkZhdUprWUhpSHZscDVzQnp4S0FBREZTUlBhNkI0?=
 =?utf-8?B?a2xYb2R1eW9MK2VtNUlldFptbUpnWEttL0U0SHltOFg2NEdWYnV5a3RCSWNk?=
 =?utf-8?B?Q0MrOTJmODF1VjVwS2tPOEF0T2pyRkZBMXZaU0IzVTZZckZybzFCY2xkcE9m?=
 =?utf-8?B?Z1NrSzNnUGFZemhmLzhKOGxubGVRZGgvenVIdkFFQlYxSlAwbXh2WVF3ZG9z?=
 =?utf-8?B?RWZNS3NBUmFMS29jZUNGNldEM0FIQVd3VHFSNTR2ZUUxWHcrRjZUUHNGbW1I?=
 =?utf-8?B?ZWx6UGI5bHN4ZkNuTWdGTXhKQkJSUXRhZzJ1eFFxcUxoUmpZQWJ0eGRONVBT?=
 =?utf-8?B?SThCRExGVitYUTRweldML0dudlpjbXk5RW9RQkxXS2VPWWdqSlVSRVhiV1ZQ?=
 =?utf-8?B?bTRVUHFrbDk3dWxuYTRzK0s3MVhYZnoxa0FlMm1VMUlPV3g1REtsTnBNT0FO?=
 =?utf-8?B?aURYUGJyRnlkN1BXOWpxancyQnpVMm1YaHQyRzVWZFoxR293WFdZMEcrTyti?=
 =?utf-8?B?SmNYZTlYT2Nyci9PZGhJRTc1c1ZvYlZyanF4b1dlM0VCZFBZY1VncDBDRlVL?=
 =?utf-8?B?SksrcXgvZGhyTDdVN1ZjMkIzUUQwV1Bnek5scmozVUdHLy9tdWh6YWxVVkYv?=
 =?utf-8?Q?Y7tAwR0EyIZPm/utbxjlTWfcTAFPuR28?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEpVZjVtUEpWbUIwU2Ixd0lLcEp3QUdPSXhOQjA5MU1laDE2U2lOZzUySEF0?=
 =?utf-8?B?RThzTVhQUGpocVF4V2YxaWpwSTdnNmoxMnE0aDVpNHNIcVE3TjNScW9NOXZx?=
 =?utf-8?B?OExUMGR3RUpxb1N4SVRMSUc0dE03RHdtN291YUdJTXhCRlE0Q01NRmZMRkFI?=
 =?utf-8?B?eDZ2cmpHT1hsd3JuQnlPbVhXbnVOTjVrMHdncnNROUkxN0ZCdmdFWXVRbUNS?=
 =?utf-8?B?SHltamxlU1J1c0lkbFMvV2MxU0VVRjBFUXNDSUp5KzAxeHM5T1Z4bFloNUh4?=
 =?utf-8?B?NUZXaXRmZHRPcytSWnRhbklwME1nbEZhajFRL3FLZnkvdjRaakxKVXp5SXYv?=
 =?utf-8?B?QWJZVlBVeVMyTjhoMDF1UEQyNlNoSk5SZ2hzeVlMUU11RWM1ZlZCbldYYmY4?=
 =?utf-8?B?Y0lHZFU3WkphSnl3Z3NBbDVWbXJKenJIeWQ2UVNBalpQYWZIN2NybG5XOEpn?=
 =?utf-8?B?RnR1aVQ3c0RTS3F3cHh5dk9kQTBDUytLQ1ZqMk04QWRaKzlZclN0NmtMYjJx?=
 =?utf-8?B?a2x5MnNTd1YwTjBrZko4OWpKNWFFc0lIM05mUTV3akNyekdydWRBdGVqZXBV?=
 =?utf-8?B?K0NyeVR6VGNuSFFoMjkrbGloWUp1b0twSU00N01ySVdTRkh6aXNjQ0wyNTV1?=
 =?utf-8?B?d0p0c2E1c2lZNnhzeXZqZUZhdnRjRmVSTVFicjZSMnRxT2JJa3BJQUxRbVpF?=
 =?utf-8?B?VlFqUWpQSDQwKzZOZ3BwV084QTcyTnBFR3cwcHY0RDZOb01ZWUZqVzRGaUlM?=
 =?utf-8?B?RW1oeVpjcm8waUhRR0VadVJBNmZSYURJOGdJMHB2TVhIeTJGQkR0R3o1NzdF?=
 =?utf-8?B?NnZlTjZsTnFRQ2tSQlY1eElnOU5IMXFoU3dSbDE3cGVCajUvSTh5QnFjN0lr?=
 =?utf-8?B?SlRBNGc0NnN3OU51NlFUQkVYUFJiNEhPSk0zMlFaL1BVU0FzbjliYTJtVG9R?=
 =?utf-8?B?Sk1iQlBzSlpDN041TkNHYkp0cVlMRFRjQys4cVBTenF2ekJZbXlHZXMwbzZN?=
 =?utf-8?B?Vkw0dVA5UUNsRkpyMDJMaHNCTWFPejgyYlJGVk0vZWQvSTFER3IrckJhNE54?=
 =?utf-8?B?eGhKU0lJN1Vjam40dlQvdmx4WVVpaWdvNWw1MnNWdmZuVkNYaUV6WkVWN2pS?=
 =?utf-8?B?UVRQejVEYkV4K3J3TXlEcXo0cC9HZk5UNXU4YndoMVM4aUE4MFErZE4vNHVa?=
 =?utf-8?B?ZVhNa2NlejREK0thSUlTOVl0b0NSSzBKOHpJV3RYbkF5TEh2bGxUcHFuNTBC?=
 =?utf-8?B?UzRrMytRb3VvdW5HYitHc2NET09TTjIrTzFodUVJc2NIMGZiUXJrRTlGbk51?=
 =?utf-8?B?R1BTbkVFK21xRUdqWVBRU3I1eE1DeFNuTVJhNnBJbkg2NlE3eFlLVEwxS2JM?=
 =?utf-8?B?VzNZTFRRaVUweEErZGNLeXFiY1RkbWlDZDdDZHBrd3N6S3ltem9FYy8zcWFF?=
 =?utf-8?B?OXNqQ1kwOHM1NXRUTkF1VkQxSG5POTkweXpZSWdGbk0wUHQzN3ZETmRsVW5v?=
 =?utf-8?B?L01ONGtkc0pJNCtJemJBNGVXakw1dVd1L2k5UXVIWlRaUTA2TGNVVkJxaUtZ?=
 =?utf-8?B?dU1tWG5Yb2U1dW5PQlZQeXRTM2M4dW1WUVhtbDN3amQzQlY3aTdKd2QvMFQr?=
 =?utf-8?B?YkYxQ1FGQjJSSXJHdHlraFFFZkhJSXhqazloV1k4Z1duS1JuS3h5V2hiR3BG?=
 =?utf-8?B?Nm96SGlxa0FSa1E0a3VyYmVRYW5FcmpuK04vYmJPem5FclZtdjZxS0twemNW?=
 =?utf-8?B?cHIvYTkxTllScUtBZzlIazhTb0VGaTB4azNVZ290emVJOXRRMXNBMFFkek9t?=
 =?utf-8?B?WWRLR0RYazRXQldVekhSNk56VmVnV1U2djZmTDhCN1lvbDdHVTdjMmpncnNi?=
 =?utf-8?B?V0RhUXhlRmdTWDBpZC81alpRb21vYjRSdlNaV1Fmc2VuMTJrYUZ6UWhhSnN1?=
 =?utf-8?B?bGk3LzBRZVdWbjBVbWFOTmRDYklTSVQ3YkhIdFQwZE8rMUFkTE1CZ1VQZUdD?=
 =?utf-8?B?WmVBaGlEYUQ0V0ZObFhjRit5cHJrS0dRelo4aE1kcEtSbURHZE1mSEM5ODVy?=
 =?utf-8?B?SUd1dlkzd2dka1VMM3FzUUFTd1pUSkkxaVcvSVNVc2tIbnBuTjI5RUNFcXFy?=
 =?utf-8?Q?VTKXjkgsr9J5dbhhrr9+x3b/f?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c789119d-d2a7-46f0-26f7-08de3716f4a3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 11:34:46.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qfl13DOrox7rDSUunRjQHpn31rnsZp061fxY8A2BpIhC3Uqzzoz8rjIw5ZF0rhor6RVL6XXXosdd7zG4b/59LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6058

On Mon, Dec 08, 2025 at 11:48:00AM +0100, Jan Beulich wrote:
> On 05.12.2025 14:53, Roger Pau Monné wrote:
> > On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/mm/p2m.c
> >> +++ b/xen/arch/x86/mm/p2m.c
> >> @@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
> >>          {
> >>              p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
> >>              if ( !p2m_is_special(t) && !p2m_is_shared(t) )
> >> +            {
> >>                  set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
> >> +                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
> >> +            }
> >>          }
> >>      }
> >>  
> >> @@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
> >>          if ( !p2m_is_grant(t) )
> >>          {
> >>              for ( i = 0; i < (1UL << page_order); i++ )
> >> +            {
> >>                  set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
> >>                                    gfn_x(gfn_add(gfn, i)));
> >> +                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
> > 
> > Have you considered placing the respective
> > paging_mark_pfn_{clean,dirty}() calls in p2m_entry_modify()?
> 
> I didn't, but since you ask - I also don't think that's layering-wise
> an appropriate place for them to live. Whether a page has to be
> considered dirty needs determining elsewhere. No matter that ...
> 
> > There's a lot of repetition here with regard to handling the side
> > effects of p2m changes that are forced into the callers, that could
> > likely be contained inside of p2m_entry_modify() at first sight.
> 
> ... this way there is some redundancy.

Redundancy is one of the aspects, the other being IMO code more prone
to errors.  Having to do all this non-trivial extra work after a call
to set a p2m entry, both in the success and failure cases, seems
likely that it will be forgotten or incorrectly implemented by some
of the callers.

It's you doing the work to fix this, so I'm not going to insist.  It
seems a lot of extra complexity duplicated across multiple callers.

FWIW, it would be easier to understand if we had the logic to mark
pages as dirty in a single place, rather than scattered around
different callers that do p2m modifications.  For the time being I'm
fine with doing as you propose, but long term we should see about
cleaning this code IMO.

> Furthermore p2m_entry_modify() also isn't really suitable: We don't
> know the GFN there.

For one of the callers there's the GFN in context.  For the EPT caller
it will likely require some plumbing.

> >> --- a/xen/arch/x86/include/asm/paging.h
> >> +++ b/xen/arch/x86/include/asm/paging.h
> >> @@ -165,8 +165,9 @@ void paging_log_dirty_init(struct domain
> >>  
> >>  /* mark a page as dirty */
> >>  void paging_mark_dirty(struct domain *d, mfn_t gmfn);
> >> -/* mark a page as dirty with taking guest pfn as parameter */
> >> +/* mark a page as dirty/clean with taking guest pfn as parameter */
> > 
> > I think it would be clearer to use gfn here rather than "guest pfn",
> > and the function parameter should be "gfn_t gfn".
> 
> For HVM I'd agree, but please see the one use for PV guests. As per
> xen/mm.h gfn == mfn for them, i.e. we particularly mean PFN there.

Sorry, I now realize.  paging_mark_dirty() takes a plain MFN, while
paging_mark_pfn_dirty() takes a PFN.

Thanks, Roger.

