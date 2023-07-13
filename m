Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35575231F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563162.880216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw9Q-0006gV-P7; Thu, 13 Jul 2023 13:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563162.880216; Thu, 13 Jul 2023 13:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw9Q-0006cC-Kx; Thu, 13 Jul 2023 13:14:32 +0000
Received: by outflank-mailman (input) for mailman id 563162;
 Thu, 13 Jul 2023 13:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJw9P-0006Y7-GE
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:14:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33ba69d8-217f-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 15:14:31 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB9114.eurprd04.prod.outlook.com (2603:10a6:10:2f5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 13:14:29 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 13:14:29 +0000
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
X-Inumbo-ID: 33ba69d8-217f-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCne/XI7ZWO6nCeEFpI+5YL8me8GRfPQxgSKDFAAGFhzWXe0lebxIbVdRAGUtZOROpO8FyikiyCFttDMXwhvK+OYhoGEehV18SrzLkFoneaVbbfzVwhzKY9ac64EpgLWm5a2SV470K9qMW20Dz2RbzBCGzFSL15vsIV6PS5THLh4X3Ul9S4gEUBxMo+JokHFUPGQWAmJYHeRFwoCRrBzewOxr2sV9Y6NgepzS4izPj6Dwa/asypmwrK+rHq0/h2BlQvLhgEYhMQt21T3pcF1RLFO3UmoyvRETHThxtIBwLKFZcp73m002brBdxrAJ9kzrCFo8EtmKRzHWaWkAB0Iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlZX91p8o+J8o6R9G8RODh9CdY9TAzoNfg11XvRDMjI=;
 b=L3fls1SME78uk8SNoRzOgkf9c95K2dgGqpNLOXSO0gv4Mt90R845G0uOOuMH86LD0p1BJWAWGWzeUdxmLJN1PU8pjqwuZ+hX0YZoHjmYzWbS7cnXOXjx+4tJf5vUamXVHNnGxK1Cl6mr61nXv6UwvyRDwLlAFat6VbXy58IJ0AyfEgXP52ofIMPJ9jAsyqnme2NhUmwMkXuWLVg/XTl27rH3iyik21ivtGT80h2LBJHR33L1+qCcKkyGWyqtBrEHkHhXkcJlGdaWS55YirUJQ7oDDilR/70FxugNjMBr+IGI8ILMmZq1TwL0qVQuHjWkq5Qmggq1QSyXFzkjvYoLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlZX91p8o+J8o6R9G8RODh9CdY9TAzoNfg11XvRDMjI=;
 b=zBZziDsWhZjoU5Ne33Z0JV1hqAIDX9pl2XwfgFTTz+ryrJ0PAcxicw6RGYLkyYYNEKw4T9sysvGL2tNmumy2nAP+DJOq5H2FMFpCvLZgzKAPxteYxoxsuXWM9mRUe6g30JNpqfkUq/Tp3HHBV3RMhITgCFY/DWpXIU+7pPAJvsnCVuQqTqpcogRhYgyD+67odCqXGhkpWBp56IrfrzdpXCIS5KuKLpZySpb774HGK+403zOXRZ1rcY/MY1zG+ArKGzNkBJ1VbJybA7gz+HtspKXM5z/wGiuvJaphnaEoWaGA5a8q874oJlrw8Jk70lOQw5fWtVsvJP0VV5vBRM5h8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9338d641-5833-caed-ef3b-5653247287ad@suse.com>
Date: Thu, 13 Jul 2023 15:14:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] x86/APIC: adjustments to error_interrupt() loop
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <880212ac370425389688f8b4fef2fd27c4fba446.1689191941.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <880212ac370425389688f8b4fef2fd27c4fba446.1689191941.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d24798-8887-4a8a-8f48-08db83a31725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FpbznjFGz+778woaRLeV7UkyVKcKcaJZY8IonbWCJ1Rm7SVOSDQe7X/EhLnw8QMmatvGw2PMIbyTyhIZkZfYylTQlLJ+w5ciqQZDGhmOo9PspjAQB2col0rtItazaUfCkMEBob42vO1iUQPr+PZaE684ENyoAm8DijoiusDWA6MT1b4ng5FnioDJiu6clV7c01O6VTi//u6UEm+2zxe8UbqlCMgtYY4VARg1fM9Y4sN9BhxsAM1oczWcC8ncuZDLSmZlFdS5E8HCmkNcK2w0UJuucb5nsObQbIxcrhnCAK2Li2O23oDmQp5YdM1k5F402CiaH9JwxVV/eFLBQ8vZ+0dIKAd93H2ua6KT4sUXA9Az/NoxYWKUR/MyL8cUOk2XhMF5kAFAaSccCazQswhhEyn3K059YitoBFIeavd+yDhLfBvdi2S7aaLej5TUMH+iAqrd68RoQHW6yica5BW2E82/cBT/60MuIJW/D1EfR0SIS094e+WDL/fH5YUPXpMOd3JaIxu3cdpD2WXNQO2Izl0nyOWi978z5Bqvv3wGLKj5+WOyBphf+lQjl00l0SEciTV/ztEo7Q6apH0dBNPIV8fdbE3USbVt+tlCKLICl5WWOE/7lmmhQ+uBxQa5sFJD2m3megXZnSabDnJXcPiY9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(478600001)(31686004)(54906003)(66946007)(4326008)(2906002)(5660300002)(316002)(41300700001)(8676002)(8936002)(66556008)(66476007)(6512007)(6486002)(26005)(6506007)(53546011)(38100700002)(186003)(2616005)(36756003)(86362001)(31696002)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3NDNXV3V253UXhoUjZ1clRGTklHNkxBRzI5eXZkdXVRMWpWK3VRWjcyWWNJ?=
 =?utf-8?B?YkpvZlg4Tnh6OHl6dDJMMzNudDJRS2dzejlVMmNYLzA4LzJ6eVVLR0QrbE5a?=
 =?utf-8?B?elhLazFLbVo4aG85NUxyT1pqUHc0R3ZtZFUyWG12eHRTSWJUcmhHM1NJNTVX?=
 =?utf-8?B?cWxRWFpJS1hkbGhxbDAxTHZSUmxuVTRaSHFiNjhLRFA5SnNzSGp5anVRVko0?=
 =?utf-8?B?QU1yOEZnbktWaWxBUUN2SUd1SVVQV2VYQ00xUVpqTWxhc2tlTzRkbjRacHRB?=
 =?utf-8?B?SklYUHJQNWpwZVdaVklkcE9pZkhmZWZvd0FBckovZUUrM2VkRU9wNlNmZzFs?=
 =?utf-8?B?cGFUWWFSOWw0ZVZ4TmFvQ1M2WWFGdzV4NWw3aGplK2xvc1NhdzZhVS9BOFN1?=
 =?utf-8?B?bnRWd3AxdzFzQlhEbVNNdVF3VXJ6ZEhKaWVxT2tqbjR6QnY5WkhYZkdVN1pW?=
 =?utf-8?B?Y0Z4SHB5dk9ocThBZWlwcjAwS3NVcnFDdGdBZU9IRVNoWVlUVGR3SWNBaTZO?=
 =?utf-8?B?Z2E4Vy9JOU51OHBISXJaOHFVMGI4Ym14MlVxSDRaMTdrTzFucGZqc0xHcTlD?=
 =?utf-8?B?c1hLZjhPTmVyemFVb0tPR1V1MDdPM1RoTjdpeEpYemJwVWoxU2pWQ1FPK0Fs?=
 =?utf-8?B?K0VaNXc3a1QyN3lrSXpJeHdjYXQ4THlERmF0Q3BaODZoVm85dDRmNFBPcWxI?=
 =?utf-8?B?VXNuMXZ1TVRtNVp3MXJvTFhGQVRPREZ6bkg5c0JnTWFBcXQxYzE4akQ4akpY?=
 =?utf-8?B?S0I1Y25zN1E5MFg4QXBBS1RmZ2xLd3A2TmV1YXlkZjdWMkpYQXR3T1d4NGJ2?=
 =?utf-8?B?a0ZpYWZJWDk4ZFplcGxESk1XdVpUSzRWS1RKRmRWZFZwOGI1ZVAwejFiZHQw?=
 =?utf-8?B?YXFtWW5CZmg4bFdYelgxM2xHbGY4LzZaamZlbml4UmZ4VGZaT0p6ZFRzZ1RI?=
 =?utf-8?B?bHlndGFEYjI2cWk4OUMrWTRNbEtNdEEvU2FPYzFvK2hidk50VDk5YW5KVWl5?=
 =?utf-8?B?WHRXOTFBMEFPVXFkbmptUzBiMmF4Vy95WGw2SlJEeG0yRmNkVCt3T1BrV0l5?=
 =?utf-8?B?QlRFc3I1M2R3bkQyVTBXWXdlb1Q3MTlzNVRqNkZTUlc1VndhTWpIRzRsc3FG?=
 =?utf-8?B?c0pDNEE0WVlRZGJ5cVg1ZlhPUFVXb1JYK2RXRW9qNHV2M3VSMnkwb25LbEVt?=
 =?utf-8?B?RnVOK3hWZm9UZTFSaWxWcFdlVVFhK3Azb1Y3MHFYNWFGalErQWdOeEdvL0x2?=
 =?utf-8?B?V3NTQjlKcTZpdmYrRCs5cmFleitiTHJMR1ZzZ2xXSFNYbzd3bTRTd3JibU53?=
 =?utf-8?B?QjduZk5ZMTltMEhkR1lMVkd2UGRmZTlIY3JCa3NRR3FOODBXcEx2ZlhtTHh6?=
 =?utf-8?B?MkZkbERVUXU5YXEvOVZKcnlmTVdhd0FIMHBaTWhMRHVuUm5Lc1lGTHlhZHBw?=
 =?utf-8?B?WnN1eFBPRS93S1FrT1J1ZHpnbXFNMC9vMERFbEV5amFNTjVPWlpBTTlKSXJ6?=
 =?utf-8?B?NisraitHNVRMelNTOWhwMW9nU21VODlEWTRuRjR3NnA3SUYxSjRqdHU1aGY0?=
 =?utf-8?B?QWlXMGI1QnF5dENkUzJJYUluY3QvZUt3S3E5QVlLTHA1bXhQWHF4U21qWThE?=
 =?utf-8?B?UVo4TVMxbG5ZSUlXdUw4NlEwS3BLWTRRNEJOVjVkKytZck95bDJXa1NlV0oz?=
 =?utf-8?B?amRFVFVlcUIxRytOcngyNzFELzVheDVRQXU5ZThEYUdMZXJSMk5PdG9jSTB3?=
 =?utf-8?B?TzIweUZQS3owcUlCUGIvcHJVKzE3STdsczI0MXFYV0dyQVROWXlsRVZIYnZx?=
 =?utf-8?B?aC9Lc2VGR3N0K3BPRkdiSFh6NTFTbkFCdlBWU1pUeG5yUis5dldQK1NjUFI0?=
 =?utf-8?B?UXJBRUZWTUVDOUJyeGFnbUJOcWVDVlVHRXVJV3I5VEY2Y0pSUVduUkIrMEhM?=
 =?utf-8?B?dWplZENjWmRiR1BacWFWZFN2UldnMWJqZmZNNmJ1aXpsTE5ZKzZ4ejREV3pw?=
 =?utf-8?B?WnZuQk9YWFFwNFZVQzVNYll3M2trRS8wUzBLME5zNDE4TWxTcHNHZ3UyTTkr?=
 =?utf-8?B?c3FLR21kS3FNQ1ZoSmlvcFNEa0hOY09rUTVvaHBZb2ZZbzZONWp0dkIwV2VX?=
 =?utf-8?Q?Mx2gWx+ardlYXH8H0vKNL5Pyu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d24798-8887-4a8a-8f48-08db83a31725
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:14:29.6505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVbWdAgi+btD5+WsHCgZmoeTEfmI2xPhY47SmEYqUk2qNfLuAnXn8xU645sDta4n8gQHf9JXDpKXEdhUAv7OFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9114

On 17.03.2023 20:53, Elliott Mitchell wrote:
> ARRAY_SIZE() makes future maintainance easier and thus less likely for
> bugs to occur.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



