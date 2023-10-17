Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F897CBCE4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 09:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618091.961368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsevM-00085Z-DH; Tue, 17 Oct 2023 07:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618091.961368; Tue, 17 Oct 2023 07:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsevM-00083A-AY; Tue, 17 Oct 2023 07:55:32 +0000
Received: by outflank-mailman (input) for mailman id 618091;
 Tue, 17 Oct 2023 07:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsevL-000834-Ok
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 07:55:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8acd0e59-6cc2-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 09:55:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8195.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 07:55:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 07:55:27 +0000
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
X-Inumbo-ID: 8acd0e59-6cc2-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLXQ2xCaKZQOyhgIbYAM6WnE6H+eeHvb0puMB8nWNzr61b15CARRTs63uU6Pivi/Aex2TjUqdB/RKAS6lYy5Z0ir4XTQ2ehgrdq4SukAsW207EjKU4gY/GvAW0kgPIX4W1DwK5rNkgK+rvM4w4Z0GG3bo9M/67gsh2cZC4adF4YeFs4UCAx2WMdaFpl8PuLpd5zVTwWKk8q+kJV1rYo8K53zHWTQkArFKyuxBfBGVR3pmIQJBfOiihmmc+wn+Q5CzfnaJWufVMBpyL2c6iboFn5IK2TnA1qcnLJwTQW/OUHwyyA17XdqXeNmdwkQe1dQIX9IZuMAra/I9SPpsrFfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trJuyNf7n8cKQRPlwXajr0ncixVPL+MpA4VljwB7Iuk=;
 b=e8k9v+MsD8Goc4ed8/6Ow7GVasrE7Sx3qVZDCcJmsuOG8G8Lg+2FvliZYB7nGz2QK16X+JUJk2oYWUqwh5AksZvgUkHa551TFa5dDzxgw9BfLqUzd41BV6rYiBoLWggASrdtqQ91/5MWz1vRUsaeDAySkeSUSmRJsSCkEjN+PdjTVDkYPi/yDE4QZf4ET/2tPvB4996RDmU5ECMeg5B45rCTUEBea2y+PaKpnbvqJFw2SpwODFhQFbFQO5BNyxtqHWGmPQPEEugM7PE3IoFcsPXOWUAHKuzgE+1iMVFyyjfSjq+FXOtXK2Znhz6wmhd9ymwwe9Y86D1EcV4B1D+uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trJuyNf7n8cKQRPlwXajr0ncixVPL+MpA4VljwB7Iuk=;
 b=zij8/F3HN0ruyVy62F06SD8KsReJQlW5WWmw7SJoRRstJA9cZdVMmmqaxLK2o3A4dJFiH4iDYr4M+H48uBPbc3ye4DTSZGuMjulPHql1rf0y+duatPWVMiY4qGblrhhO/EYO7q4IovNUuImWTjUajgSuxMKll8NNRfd57JTSNUcOPOILgTJ97mHC9gU/Q/HSIyTMue9Nxs81BoJDg45aKFCjChwv2z8C5eoJe5Q/5Lu6Eq77K6TYpy/4KIzpWHj06toY1Lke5XZrrveB3E/dzu2RuwMF9scSr/qtZHctQnkcEjFpurPVwm/yHeGH11lKYMZEanDLcGEBW0wXuJBbLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af22de04-f29e-9c13-b618-54cc867f0f81@suse.com>
Date: Tue, 17 Oct 2023 09:55:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 1/4] x86/microcode: WARN->INFO for the "no ucode
 loading" log message
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
 <20230830155326.10199-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230830155326.10199-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 395eac6c-a317-4f7d-560f-08dbcee66d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P+SOjbnOkyCXzeQ81xS0FSsVsrSBKDORfOC282r4oTrWQbp6c+Ddm7vYTE4+96JS19VhtfcmgzW7DSeVL++goerzwfitnmQZz2nerPwAC1R066WW1zv+t3iXqfI5xBr84hROqjobYvcy4BRbgHChRcaYqrLdwSAuxRA1a5s18z319lZYDS/kTY1GoAczNGcma22z/cIhZn9V4J5XyjVtZ6rS8IRczjVgtnYlPrZKshddVRi3oeEcoLCgLJzeeiN6kz2JVHB1SxO/3q/ylT733DxuWy/7kKbl4iBN9ADvhyJw4nlCyHuBmYRAaA9H+jI+rMg3sUHQJ+DdBOaFEbLE5PPoTZfe3oaByqNRK7RfwZ6dJ/vW6E0JqeicxcFzvXexwhlFojYaAYvpgUhI9eMLRTS+ZadxLIjYrmAeLl7e3G+JToQ7b3RJMRtBAvdx1T01XZdUgbdFmUSzbuOtO4dk62h8fY/6Jhl+v0uvZKhNg5wUwJvA8xIz2CEK66OGkWc3MK/rtUEtrY1SIdQVJZTu4YHuPVBOIGCohIo2yqbVj/VsXkGmWyGrc2r10JXJyihYsYEPjM4333vu/vfKF7RBFiRN1w+wKiu1BftMJwCpMDdFY3BUfX4DNKgKeIQFw97bLu3gmwAS8O3qCMjziemSpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6506007)(31686004)(478600001)(6486002)(66556008)(66946007)(66476007)(54906003)(6916009)(83380400001)(86362001)(38100700002)(31696002)(2616005)(6512007)(26005)(53546011)(41300700001)(36756003)(5660300002)(8936002)(4326008)(316002)(2906002)(4744005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JOVDJGVDZMbS9OVkxXMkVBNDFHenRJUHVCL2Vwa3Q2T1NsbWtqUy9ZSWtM?=
 =?utf-8?B?cUwrNlkxbVVNcTRhVGRNaHFmU2diaXI3NUkyQjhFbFlBaktDZnI2aHNWdXV4?=
 =?utf-8?B?d1d0M01BaEc2SW5uZkNIN2hZM0ZLR0h2VWttN0d6UVN2Q2lGcmlJTHllK1B6?=
 =?utf-8?B?TXNRL3ZvNEdYdEhobjFYU0lPd2hGbDFUS2J1cTRkcHpwbFYrRE9xd0RNS3NV?=
 =?utf-8?B?OE1rdjVBNDlkS3psVVBqQmVqWjYwMU9yRWw0cHA0Z2xJS1NEYitWK3BiREt0?=
 =?utf-8?B?eHpQR1RVNU1rOHlVQ04zVm5YRHVENGZYaWdsZFl4aGUzQ3NZa0RsREdtUXpI?=
 =?utf-8?B?amlYRXVEaUJZVnBZRHFuMnQ5ZlZwaUh3RDdmVEE2V0RuTXgvekN4L0RQTGZM?=
 =?utf-8?B?WEcyeC9yOHQ3ZURVd1A4OEFiaVpLaFNRSWhPOFRybGhUVERodEtMZFJZaFdJ?=
 =?utf-8?B?VytXV3JGVmR6K285bER5aFNsZXNhV0xjSEpSQmk3NU1IWEdqK0FIZU53VXIy?=
 =?utf-8?B?SENjRDZLbHM4eXhBcG9WVE96cC80Z3prMUdOU2g4WFNQRVNCOXhxOXVBSDFK?=
 =?utf-8?B?Yitnc1ZWNkoreTY3NWErSGQ3enVJZ3lMT015bXQ2bGhDdE9ULy9PQWFqZ1Iw?=
 =?utf-8?B?MUFXV2lXS1RnRVBubXJUd29Ha0ZLU2I4T25GT1dRY3duNWQ2STRSSHBkZTJL?=
 =?utf-8?B?dWFxdEV3WnMwYkdJcUljZVhsOHhoLzFXcjROSDFCTU85NTl3UHhTQmdmUGRL?=
 =?utf-8?B?a1lDNTlSUGk0dS9oanpVTEZGZXByaEtzMjNaSlJCWERjSGpyUWo4VzBINmtM?=
 =?utf-8?B?Mmc5TURxcHVlZWllTzZuUXhkOGhnV1FVMW1QOXpScWR1d3o4NHUyeVRwQVFO?=
 =?utf-8?B?MjhsQ0J1QjhCa3JpVDY3c0ZMQi9xOUhhcUhWV1BlZU9HMko3TnVSZ3NuQTNF?=
 =?utf-8?B?Y1hRRzRCQ1VRUVh1R243b0lwOVora29WS1lhV0NHTUlDaDFpelNrVy9yRkVY?=
 =?utf-8?B?ekFLSGJzUE5xczlUcVpkc2M3OU9VU09YbU1CVGdPbE9zazAyT3pIZVZKRzIz?=
 =?utf-8?B?QlpSVlk1T05wSk5NcldzQW14RzcrOWhDd1JKUDQrcktlc3pCejRraThHcVlv?=
 =?utf-8?B?SUw0VC9razJsM0hmZDBFYWp3RmxKWU1NaURtRDlPZlVJb1dXSlgyUjlldTY0?=
 =?utf-8?B?eCtQcXNveTNXNWtzLzYvR1dBUERHZW9iKzA4UXY1TWp2b2U4eTZWVTBJL1FP?=
 =?utf-8?B?c0hoMXFkdkp1NUVNTFhhc0h6ckM2Y3RZekFCMEFIQ0xkT1BVZFJFS29mdGQx?=
 =?utf-8?B?SHpSTGE1MHFvUDFLSVZraG1JelRKbDMwVS94ZVRKTUtybHM0bGJMYlY4dElx?=
 =?utf-8?B?SEExeHpxOVluYnowUFBMNi9IbWw3SC85eWs3d3YyVFdjNlJNbzZtcWprWXBI?=
 =?utf-8?B?aUdmMjlMNGxaWVQ2VGpBUUh5Y2d6N3FSaU5XMklmYXZuSFhzQzJKSFhtbGJ0?=
 =?utf-8?B?ekRPcGFwb1RoQi9QZUtBcTM5cXVrNEFySVJSWkdadzhrTHNaRk1Vc1FsVHBW?=
 =?utf-8?B?TnlDVThuenNBb29tWVdJTWRHTUJXUE9VTzcySDRlUys2YituSnREOEZMc2hH?=
 =?utf-8?B?d1lqRTI2TjJxWFh3KzhhaG5PWTM3Um5jdnRNVjRJOXkrYzQrUGFXY0RwV0px?=
 =?utf-8?B?dFRLNE1mNGFSRnFkNFNmcWtQRXY1ZEZlNFBCVGR5azJDTEF5SFJSNld1NEY4?=
 =?utf-8?B?L3R4bFE2MWlFRExJRXdHQng4RHpEcm9xZGlMY24wQXJ5SWVub3Ztb3NHcWNR?=
 =?utf-8?B?d0hmWE1Tc0g4NkxSUFVySkpTeStvaFoySm9nVC9weWcvRUZrcHNKUHM3WkJN?=
 =?utf-8?B?c3orTmg0Q0NnajlhUGhVZ3pEVk5GZEZMOG5sbkxsRzFWT1I1ak5ETHFvNGJD?=
 =?utf-8?B?NVlxYi9jT3hPYllPdG44eGZGR25aTXd6YXVWeWFuTkk3MVFnak9JZG0xaFl0?=
 =?utf-8?B?THk0aldmUDF1S2pVV0V6OVhDT1N0RnpXancwTmdlSU44a3Q5aERPRVdkQzVp?=
 =?utf-8?B?RlFKYTIxRFNua3QyN0tmeUMyNzdrc2dQYkFmZlVVeVRFcGtsOUxiZlI1SGRk?=
 =?utf-8?Q?vD7oI//9P9jqnA7dVWrGONtUO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395eac6c-a317-4f7d-560f-08dbcee66d5b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:55:27.7201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYZTjq9kGMltHLbfZY3vrn9ZB+unnA1DL4L6pH1uA4Wyp5YftfKb8rZo0HFa+XSteDpBPcOtNUvhN7XRE2E0jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8195

On 30.08.2023 17:53, Alejandro Vallejo wrote:
> Currently there's a printk statement triggered when no ucode loading
> facilities are discovered. This statement should have severity INFO rather
> than WARNING because it's not reporting anything wrong. Warnings ought
> to be reserved for recoverable system errors.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



