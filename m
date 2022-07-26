Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9858160F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375409.607773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM9e-00073W-96; Tue, 26 Jul 2022 15:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375409.607773; Tue, 26 Jul 2022 15:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM9e-000702-5k; Tue, 26 Jul 2022 15:07:26 +0000
Received: by outflank-mailman (input) for mailman id 375409;
 Tue, 26 Jul 2022 15:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGM9c-0006zg-Dl
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:07:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7173820-0cf4-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:07:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5263.eurprd04.prod.outlook.com (2603:10a6:803:5f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:07:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:07:22 +0000
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
X-Inumbo-ID: a7173820-0cf4-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFPCWEOBwEx7gJvAE6g9GCHi0KcFyABGQyUkiQIpjHMLqzepn6YHrXLIMv+BZmE78rvWd6QUKOlI/n2tyBUMwarFk+etp6Xp5DbwtIXgph1Jl6ayrQNsHiGvRWo2Qn5B2Xs49SNhvebw0SNwcJDb/y0i4TDmms6K1pmWe2eNqfal0kJmN6/iDwNtg8j71MVxjTV4HPDEnkyFo5gdA0ClL87iSIPmJ0XCzXC0wGV81eO7fSpfbfcHwu8rggPoRyTUlGYyn7ozYgU4VnVkxUX1g4GiDBtWJlhMVNL15dVOoar7t1Sl2Ywt3sc7HXfMudkVZ2b/dALUkhPj2DZ45+id/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P39mLUMBFr+t+yPKzQ0SAp905mLsarWdbXQUoRfK9Ls=;
 b=nfOt/o4r5x+jPTLmPqhlba6bHYXo8hjrAw7/Ct8KTNs9JReUqczvczulgehQlsw1Oof3lLtmjNiDQcB/9cIxGiMsBH62s/9FuXStHd661vrjAQls0ZiFWbqvB9nUY1jFk4Uy+cSA+53Bs+PHy9/Rma1w7aSLKiegUIcR274HZaD3AIiEcS0CL7weHYsCXbbUZJeszzTTklRJ0KTgjHobtGdaDErEJWd4eTG3SOqdj+ofOIabjnxfh1pomypSoFe3PGJBWy/UoNxpmzdAPDY6JQmYSODBR0xJClHMkm5NMEAGd6n+4I62diELuashfWpKXLWVlqx1ZHfrl7dELvUm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P39mLUMBFr+t+yPKzQ0SAp905mLsarWdbXQUoRfK9Ls=;
 b=LGmhI+rguRpxptW4SXu/rsw2ZFiodOJyayDct7+eXFeeBj4vktN4E9y47MLl48UQ3lSpDS/4Klb8nxo8locME42HeadJg1rWixB7aw3a1nBcRgSEcyE0rUyNZpfaR3SFiYZltYooYtLV58vlkThJii4V+3MO5+YGzT0fPCT5O90JU1E5tnNGDMA5BuaLYi2ifjFDl8zFDcs5vD+MTC+6fMjSDk2zU9aMwzMYlDRb0a2ex6OV4MtV5KDtCff0NE32LUc3wK4K1W2BfxiWeg5kPplRouMkva5LbyZA8ye0xvaFdOBGe9//6TNS224OgdZNgpwHEiou//NrCxCytjXyaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e656bf59-890a-b2ee-3a37-603ef8c66154@suse.com>
Date: Tue, 26 Jul 2022 17:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/msr: fix X2APIC_LAST
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <d4fb4631b82643751fcb3356b094be65e5bc9bcc.1658846616.git.edvin.torok@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d4fb4631b82643751fcb3356b094be65e5bc9bcc.1658846616.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a9887c-e2d3-493f-332b-08da6f188a7b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5263:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QgqIUJtgUEY6bRV5fKQH2X4mErGg5cxQAZDY/5HBABcmz0AD2jz6szybiaS/iLUL+hrCh91rVPYzG80p3cEYqjqp25RXBa2Hi9PpD4ek++dX1z75WcrsN4hWk8a8n8ppgsJAYcdb/oFkNAj9HyV9zPM0C/kPyfg+jq6bvKtIYfOuZwy4A++tc0gszMge/EnVqzbt2n3Yxyi3dDUT4txLo2byyM8GRsAqWPbxk3sHI9Ux/tlZPOre+hEDHCxzlDDHFTAGXF9bj8V6j9CZCXWI05BDgE9tN+FCHKeUD1dQ+bv4bTDlWQIvfkAhYHgWTY1ygczbY4tYw8uaGR81E9cA7qKb9e2Ul8EiDYTkORnLm3NFju9ooMi4/xrezvaCWCEudhrUxiz+JCsHFHrVUbgfnTwf1/cStQC7m0z1ZzLPkV8fBmpkH1niwHB6rBbz8om38YJ9vSE0j0nWEmI/RKgXpBrxJWS8rMvNwy9JbJx4hZ2ct/lrJ5Q6VC2iBncXYxliQfzSfN2Ve0KDddwv2wXDwqClGo1NTtjgc4sPrCNOEl1KMMLh9ITotd5BH4e6OmZExfOc6yFX7p72XnkV60eztNBq2BySKTcdquc2iHYVxg+T0O3kxtzfaqo69+O6/zEI7bNojThELQjo+0CxOeSs/7xlvF0FFfz6LJAFWMbK2+TjNjVYCd4xb/Jl//QqYYOW8Pj8LzUpTXWGyZUKClXCduTJ4ej7yP3JzMUOBsuHpTQIwsWVkErDSmiWI+fmNGJcD0hAkmdORlPnVA9iuKGOTMCSDlo6CzkN302009iWw5Bd/BkMNsNWDC1b+rC650evddbQOiEdmPbY179yMomjiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(136003)(366004)(376002)(36756003)(316002)(2906002)(38100700002)(54906003)(26005)(6512007)(53546011)(2616005)(6916009)(86362001)(31696002)(31686004)(186003)(6506007)(66476007)(41300700001)(66556008)(66946007)(8676002)(4326008)(478600001)(5660300002)(6486002)(8936002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG9UeXVwS240b0tRMFR5SmJSaFdzcU55Y0dzMFYwajhjYnRLeXNuSFFLdVlY?=
 =?utf-8?B?VHgwcEwwRHB5Nk1LSWlycVVDTUlYcEhVaXAvR2JseGdta0RXSElrUDVpTERp?=
 =?utf-8?B?RE43U1YyMytCRG01cCthR3ZUSlpENm9LZFVnRlhhd0tIZFB0TjdZb1BLNWFv?=
 =?utf-8?B?V3NCbkNOV1hqUWRpc09nU2I2NGFjdDZYbWdXeFhhd3FTNUk4Nkk0bUlyRU5q?=
 =?utf-8?B?aFdkdy9XaGJ2ZFhET0VScGxITGVvU0hXbnRkbmFJQTIyd3V1UjczMUpCR0U3?=
 =?utf-8?B?VUxzKzVYUDhqTHRMSFY3MU5hZzlTdzl3MmFMZjVxcHJWT1hFbkxITThTVksz?=
 =?utf-8?B?TG96alM5Z0hIcmdqVS9HMWtjYVVsY0l6bUdxMkM1QW9xa0t6cVlGRGs1V0xO?=
 =?utf-8?B?blNWdDFrY3RLaEhHK2x4Y0paaWVXVGVNdUNMc2R4V285N3FoZkNYZEVMSkRS?=
 =?utf-8?B?ZG5sem5xSzBrZHpxSnY5Vm5vWWJNcDdoUkpFMW41N2U3YThENkdZMjY1dzkr?=
 =?utf-8?B?STJ3ZjFVS0ZjVmNsSmowZkZYNGd0WW9oSDNYeVRaTkgvSWFLaTVUUzAzT3la?=
 =?utf-8?B?YnlUQUhrQ2pnUlhNU3FZaGhiZVIxaVZmL2hrYklaZEprK2o0dEZDN2Z3cEww?=
 =?utf-8?B?by9MTzlvdDkzN1A4b2FsOWVkZUxtT21IR1NTOVJrOWx1Ymt6VGg0TUY5Y2lU?=
 =?utf-8?B?cXpFTGdHcnA2L1doOEs5Umg5TWZlVytRZU9rdnRYZ3M2cEwvYWNRQVZrVWp4?=
 =?utf-8?B?UXRMVStEUllLNlZkRUxHT2R4RXpHRjVTQis4SFhOYklHdzVNNGZzU3lDSjZ1?=
 =?utf-8?B?enZ0UjVGNUxUVDZnZjNUMGtaRjE0dVBIdTExTmJ6VnphZWtEWmJTajlhTHAy?=
 =?utf-8?B?WmJ3Z05lcXN1UkNHTTVkTTRtRGh5aHVQNXhIdC9kN1lYR1lFM1VMNUhnRmMy?=
 =?utf-8?B?S2ZtYjRWRlBBMElYaG1FcVBUSDJOSzE1VHNPSkZoWnRoSWxmeDRKUTQvSy9L?=
 =?utf-8?B?cC9vVWUxdlRDTGdDam9abU9LNUpYNkFtUjVaWFFrbVFBbE8vSU5xVmdCSFFl?=
 =?utf-8?B?dGhITEczUHVrRUdPVjdESkpLU3VTaUptcWwzazJJNnBzNFc5RTM0UVBMbXR1?=
 =?utf-8?B?Rm80SzRhQmRpYzRhVWhNZ016TEk5NVpvNy9oM2w0Y3pEQlJkZXhFZ3ZCZmF1?=
 =?utf-8?B?dnJMSVZFYVgzcDVzZ3ZIdTNrenRSS3NNNmZhSjlYTDFPYy92NlhDc1ZVV1lO?=
 =?utf-8?B?aFlucFp0aXhOenNjRXptcEVBN3NRNHQ1RVBEKytidnBPOFc2VzZzQ0NsMG0v?=
 =?utf-8?B?bGtVVHBuUEpTTEFXaGgvSUZHU1YxWkdWYmdUdDlqd3ZqTWpkMm5RYXVuWDA2?=
 =?utf-8?B?RG1aZUQ1akE1emlYbmkwU0MxQzV0KzFMdTVXRWRrVU1hL1NISmRydXVFSEx6?=
 =?utf-8?B?QjdkbU5pdHNaS0c5bFQ4ZGVuMk9ZaFZUcW5iVnBHaG4vbjAzZWtPN29OclFD?=
 =?utf-8?B?d2xNcjcwRGZjKzh4V1BsZ0wxODdDaGtmdml5K2tjQUFSc0tDYnFidXBlV1RQ?=
 =?utf-8?B?SytHOW1WbElEVGQrOEJUKzlkeityT3FvYUZFUk1SQjR1VXBBSEIyQzRvazlV?=
 =?utf-8?B?ZjBPemNkSjBwQURXUmYzTU5KRWtST1FvakI2cDdWU2lxdHhYc1BWY0NLdVpv?=
 =?utf-8?B?S1hhOGxpQitEZ0ZCSmJXTkNrQnF3SHhVNlgrSHF1RnZoVE5GeU5ibWd1bXJL?=
 =?utf-8?B?SGxHRklWak9XcW9EOXFqaTgyME5uK1kxd3N6UVpjSnFYaGxIZHd6VjhXTHpM?=
 =?utf-8?B?QmcybkxFaWNNNjNjU3U3dVBZcjhGOTZESFg5cGJUQkZkNUJwSFFNZmVNeXRZ?=
 =?utf-8?B?V0s0cXU3SUE5eVRiUjhTUy9SOEowUHZnVVU5Q3lLRnp0TXZOaHhZTDlqRmhq?=
 =?utf-8?B?M043RWVlSG5uekVhNjArV2RINDN4NCtUS0x2VGMxeXBaYkJ3RllmeHpJdmN5?=
 =?utf-8?B?V1RXRndnSlcyVjdSV0o0dFI2S0VPQTVVWFd6QldBUnhnd0NqRWx1eXVhSFIx?=
 =?utf-8?B?UUQyZCt1cHBrcTk1WStiUWVmaGFtcnlobzg4ZTUvbGxPdkZqdlBVS0d2OG1E?=
 =?utf-8?Q?4vt7tU21/y+2L1P9m0oDolvrf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a9887c-e2d3-493f-332b-08da6f188a7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:07:22.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iyr190qya5EFBlz/BkcjQPYPZ+tPoOIhQZaf0ZmQ13ew4lpqzt+eS1+Ze7nWY+9RJsM0/NEqOpAflZajW7v+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5263

On 26.07.2022 16:43, Edwin Török wrote:
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -148,7 +148,7 @@
>  #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
>  
>  #define MSR_X2APIC_FIRST                    0x00000800
> -#define MSR_X2APIC_LAST                     0x00000bff
> +#define MSR_X2APIC_LAST                     0x000008ff

May I ask that then the now open-coded values of MSR_X2APIC_LAST
(two instances in vmx.c using MSR_X2APIC_FIRST + 0xff) be replaced
at the same time?

Jan

