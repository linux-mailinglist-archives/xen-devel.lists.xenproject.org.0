Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F313CA158
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 17:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156678.289127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m438K-0002Mp-Ru; Thu, 15 Jul 2021 15:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156678.289127; Thu, 15 Jul 2021 15:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m438K-0002KZ-Ot; Thu, 15 Jul 2021 15:18:40 +0000
Received: by outflank-mailman (input) for mailman id 156678;
 Thu, 15 Jul 2021 15:18:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m438J-0002KA-Eo
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:18:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e8bb556-9ab6-48c2-b7ce-eb20e67a0ecf;
 Thu, 15 Jul 2021 15:18:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-OWmyLBlXNZqZaDfmP8S0ww-1; Thu, 15 Jul 2021 17:18:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 15:18:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 15:18:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0241.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 15:18:33 +0000
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
X-Inumbo-ID: 6e8bb556-9ab6-48c2-b7ce-eb20e67a0ecf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626362317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KFZCARh7nv5b0rdkkTagm6uaY4gGVGl1BXqbU+V6X0=;
	b=F2sh6tYlVou6HQkegdhT1T6DolsoPI09A3Qk03LB2dOZiyoXiX3EdgkhOlXG8K/Z7z7PHx
	plGGe70ttb6oHzj0vS1+8gjDBxeLYW6miN0f8VR8OrCbdTfAG4zqNl0Oub3MtYDgLuzwQe
	8o/zNKIfm3fJvZCfuigqR68wbkg2Sug=
X-MC-Unique: OWmyLBlXNZqZaDfmP8S0ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYnJ2Nhpygnc5C0yzt83UKy6cl2aUfNNcJ/A4Kf7Kz6+VbjiCG2ZmU28CHUtOrKusKuuMXlE614supFbrmXnMqsyrU6WY1s/jTuaiHgTvoJH9ESoEW/NqkjhYgSkkULWfrFFgMF0nyzG9AlXjxnPzncyptzK5F80FH5qWEPy8wJ1XojtSvtBfP6Q86+eqdfoHwqcpwCnWTed7wUZeDvLfeUKaoXaPgu/2Yza39mQSY00IlPBEcQW+IUR8hAT79tC2yNAWxIcQ+y3+Ofc9JRPf+rUxcJDTe7Ef5WCiTgjKawbLhtchWCX0kwn8JiYfIydgZsHuSn5/BiHNA8TYrq1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KFZCARh7nv5b0rdkkTagm6uaY4gGVGl1BXqbU+V6X0=;
 b=XTIwvfgw7vWVFK48UT1fXRPUWlE6PTjcqTqKeVJG4AzM9lVrDEUlerLl1fq3/lEmasjAE5BibWuVs4cA3nHCKYYXQngiyNHUyalTCSdTjwdbVhHln+2gZ8kvKRuGMPbyA10GNRQx6twnqOc/jqElBE9FAKIdi7rjKsgqT3qNpBTl9kxLegSx1yxF7xsRN9kXdeMJpt+ZXIG5Fn9EoO14Z/cER5mlWT1FKHxJpHQjjlMbzwJUT49kx0AONcoAzvyzC2FHBHrzcjNYQpl5K1rWLtBCEWB5nQdF9V4aq1RYdpPQvWSDK18adzvrGPm+2g2rONBCFJvM9s7PEic8T4e+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/4] build: use common stubs for debugger_trap_*
 functions if !CONFIG_CRASH_DEBUG
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
 <d74af998bfd8d00e57ea82ce6731ccf2afc8e95b.1626286772.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1dabca1-17ed-1f20-f95c-5113f09ea2bb@suse.com>
Date: Thu, 15 Jul 2021 17:18:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d74af998bfd8d00e57ea82ce6731ccf2afc8e95b.1626286772.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0241.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::13)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 887d5c4b-1cc4-4d2a-e52b-08d947a3cfa9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606C46269EEBCDEB90E35ECB3129@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l5yZwF15ShlLZXyNry0PAEBTMFt6vcqv6M0GDu4T9EO/74DKZFm04Cqg7YI15qZabYu1UA8FiYthNFcaRwQ1BPLiMXVD5VPEXsg/8Z6PaGPzfuV+SP6eA6VvEIqVLqpS5LCZFx9hR7BP6cpizi82hj0RiYTAiRaQ+4NDOTdh9PqrrHXhbxYlrS2yWwNa9m60PnBb5TVn4Vs5rPoLZIc9kNEL+WE+dxHVPWdXLgQ5vZfLQamnkuwgQ7+PWfxcwZVpiBsFHv0px2OkI4lB5+GFSyvoPASZjNw7h1NP81gi/4DISgOIeF/2fX8/DKVeGUPQFXOjKX7+Wgov1H3Uw4s2s1yQ3QdipiaVBoRr7NLF2f3YoP0snfuIptYWoCZu9hPQsrQr1Sv/3h9J9/bPvjA/wOAR2uq9kF88rGT1ASPSSjjMBw/zAACJonmUlDryC2z3epIAjlhtTcPOyrGtgccFkzfcyyzMeDfdakIU2xnAjG2Ay9Hi5JRc41il3b/QDdddIPxxGZ/FVeOSAAlGa+QClzvXUJm+HVV/BTQsXRHHDegi6lIlceRjQX4XSH1wrB3Qpqo1oj06B+iyyoj+pAwLKcHc0Uud4u/uuj+HgUCJAsHiTABbQAlRToYiEDoHMyXueb0b1589Ilze4tcqsAJtLzwo8FQHkhGwkHV1eLvCP+iwf53mqkivqJxb+tbMHf9s6EWG5w8XE61dwo11DLThfmntz1PVplBz4sXfJ8GouMi3Hrr1fjtEW46dG0OOUm3aTCuG3WvIvHEMs5hhFweKFFaDfvne6iRoprWNCH23Te1pi6BPVPuzkPpr4A8+h78T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39850400004)(346002)(136003)(376002)(8936002)(66556008)(66476007)(66946007)(53546011)(956004)(6916009)(2906002)(2616005)(4326008)(5660300002)(26005)(31696002)(186003)(8676002)(478600001)(38100700002)(86362001)(31686004)(54906003)(316002)(6486002)(16576012)(36756003)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJGTVVRNkdWUDNpeVhyeENCL1o2dHJTZUdTa3hpbExMdW9NS0VpTEpsbllB?=
 =?utf-8?B?WFlGTE9oOXp0T1QyT1RhOVJXT2N5anl2S3VBMVRIOWc2K0VCeXBrdW9UUVFx?=
 =?utf-8?B?aEF2ZnpoejRMcklGZysyZjNaZ1RnSzBGbTU1eGtYS3BPVFZ1VmZWYmo2Y0Z4?=
 =?utf-8?B?UHFjczJPZU1UZDNYTXdiRFdObk13RjFQcG8vNk1QN0R2djA5RnBIakxGdnd2?=
 =?utf-8?B?SEpmbnc1c1RNTEF0SnI5S3BBbXVySXpaZUNsZ1pVOTRLUXBvWkFMTTVqN2hq?=
 =?utf-8?B?N3k4NTkyOEk4VGVTVG5uMDRYc2JiYVA4VWxYeDFvRDJqNmZ3NEcxU2pocmZk?=
 =?utf-8?B?RVhtODBaNVVVRUR5QTIzUFp4Um5wS2oxZU9NdUVqSEoxYnV2cUZZMEhEOEZn?=
 =?utf-8?B?MHNRbVFUZ1VuMnFPOXdvelFZTmNaMlFwYVh1aHZ4UGYyRFo5Q2RxeUsyQjJq?=
 =?utf-8?B?SmVEWU1XMVNJZFBvaE9GakJJL2RJV1hTODFjNG5oNngwSGE4ak5sM2R5OCtl?=
 =?utf-8?B?TFFTWmk1QWNQOWhCOWR3YUtVQXp4UnBQNXhFZVBGWGJVZzZ2eDdodGVLZTQr?=
 =?utf-8?B?dGJHUkpsZzV4UnZTVk5yNG81S0lDTzYvV0kzeGxrcWtUa1duaUpUalJvRkg5?=
 =?utf-8?B?V2g4WkdJb3hDU3NkckQydnJvTW9XQ2FZbURPM3NJeWNMbTdGemJSSkJORDdF?=
 =?utf-8?B?dmptSjh5dFVjL2FyT0wrbW9QekFxODVhUkRyYnVjeU1UUDNmWkc2ejA5bzhD?=
 =?utf-8?B?YWQvZHZhZllUR3dsNkRhQlJDakRnd1RaUUhLeWJvTmdCTXdmSUNWalVack1G?=
 =?utf-8?B?cHMrUmowZ21xU1NnRG1HY2RGakZQUHlFelBJVVNrQ1lEK1lFaVNrRktBTWNy?=
 =?utf-8?B?dWJ2TjJ3WU13Y0FPMmVDaU5ybmZCbkk3SmFPUmFGRVJWKytyMjNUUlBXR0I1?=
 =?utf-8?B?OHNtVUk1WkxoWk9YZldZK1Y5bmFaKzZsUFpndHl0NzkwUldMdXpxR05hU1FZ?=
 =?utf-8?B?aHd2b0xiaWw0eXVQOGI5V2I4ZHJVcjdPWVlPRENCZ0Z5MXY1b0NTZ09TckxC?=
 =?utf-8?B?MVkzSzNTMUU5YzFmdysrYXFIZXpwVk41d0FvMld5M1hocHE1QVNNSENUVDVN?=
 =?utf-8?B?NkNWWDZ5aU5mbXIwSUdQeEJiTU1IV2htWDN4Q3MraXlidG5ucXUwMFBzR3FC?=
 =?utf-8?B?UWJEUE1oZWliUU95RGs5YVRTY0NFb2JaTHNSdjJNNkM4VzVBVEFKNUpSZ2ow?=
 =?utf-8?B?bEp0V0hHNDRieXlhRndFYWtRVGF2ZUN2dVlFc294Z05QWWZUNWNKTElyRWxh?=
 =?utf-8?B?UnA4TGV2RmpJaWRITDQ0ckVDckcvb3VubElpelVwNXhUQmZnTlluUEpJNkF4?=
 =?utf-8?B?U1lldE9GUWR5YXUranBabTJwekdibEJJRVdDclJhczBsOTltcHRCZWZMSzJN?=
 =?utf-8?B?SVV1Qk8xM3hlYzgrWnVmYktCS2lxVHFybXlHMzg5ZEFWWEJmNTF3Z2oycDlL?=
 =?utf-8?B?NmN0QnpRWmZ0Szl0eEc3SGVMeUYxWDQ5aXRPL3hXcWM1NkdlSG5JeG5wK2Z4?=
 =?utf-8?B?MWx1THBaZ1dqYWw1Q0JTOGpVdnYvbnFPTERtbkNwaUZMLzZCZGpLTzRsN0l1?=
 =?utf-8?B?SWZ1RmtOK0VNM0ZYeXI2VjEvT0UzM0UxQWhxWk1kRTZWZ2dIcnp5ZS9OTStZ?=
 =?utf-8?B?L1NOYUttR1VGYWNBQWR2NGdpVWRuS0VrZEZiakdRNERXR0hvbnZRNUFxMCtz?=
 =?utf-8?Q?u5cwSTFxgs8gxN9ZD1S8pLnhMKJeAo23vQwrXQ2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887d5c4b-1cc4-4d2a-e52b-08d947a3cfa9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:18:33.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7CT/V6S7Oo8xA0Rv+cKUcDCfW8vqdWxP/6nahHXD/KhaD5fEoZdKmiKplIuFjV0aJF/nPe2IDKEd9VYwq4/+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 14.07.2021 22:37, Bobby Eshleman wrote:
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -16,6 +16,7 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <xen/debugger.h>

I don't think this is needed here; instead I think ...

> @@ -41,7 +42,6 @@
>  #include <asm/acpi.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> -#include <asm/debugger.h>

... this wants to be done in patch 1 already.

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -3,6 +3,7 @@
>   */
>  
>  #include <asm/regs.h>
> +#include <xen/debugger.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
>  #include <xen/param.h>
> @@ -20,7 +21,6 @@
>  #include <xen/mm.h>
>  #include <xen/watchdog.h>
>  #include <xen/init.h>
> -#include <asm/debugger.h>
>  #include <asm/div64.h>

Not sure about this - as indicated maybe the code needing the include
instead wants to move to x86'es new debugger.c.

> --- /dev/null
> +++ b/xen/include/xen/debugger.h
> @@ -0,0 +1,69 @@
> +/******************************************************************************
> + * Generic hooks into arch-dependent Xen.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Each debugger should define three functions here:
> + *
> + * 1. debugger_trap_entry():
> + *  Called at start of any synchronous fault or trap, before any other work
> + *  is done. The idea is that if your debugger deliberately caused the trap
> + *  (e.g. to implement breakpoints or data watchpoints) then you can take
> + *  appropriate action and return a non-zero value to cause early exit from
> + *  the trap function.
> + *
> + * 2. debugger_trap_fatal():
> + *  Called when Xen is about to give up and crash. Typically you will use this
> + *  hook to drop into a debug session. It can also be used to hook off
> + *  deliberately caused traps (which you then handle and return non-zero).
> + *
> + * 3. debugger_trap_immediate():
> + *  Called if we want to drop into a debugger now.  This is essentially the
> + *  same as debugger_trap_fatal, except that we use the current register state
> + *  rather than the state which was in effect when we took the trap.
> + *  For example: if we're dying because of an unhandled exception, we call
> + *  debugger_trap_fatal; if we're dying because of a panic() we call
> + *  debugger_trap_immediate().
> + */
> +
> +#ifndef __XEN_DEBUGGER_H__
> +#define __XEN_DEBUGGER_H__
> +
> +#ifdef CONFIG_CRASH_DEBUG
> +
> +#include <asm/debugger.h>
> +
> +#else
> +
> +#include <asm/regs.h>
> +#include <asm/processor.h>

I don't think you need either of these for the stubs below.

> +static inline void domain_pause_for_debugger(void)
> +{
> +}
> +
> +static inline bool debugger_trap_fatal(
> +    unsigned int vector, const struct cpu_user_regs *regs)
> +{
> +    return false;
> +}
> +
> +static inline void debugger_trap_immediate(void)
> +{
> +}
> +
> +static inline bool debugger_trap_entry(
> +    unsigned int vector, const struct cpu_user_regs *regs)
> +{
> +    return false;
> +}

Of these stubs, after patch 1 only debugger_trap_immediate() is needed
outside of arch/x86/. Perhaps everything else wants to remain in x86'es
per-arch header?

Jan


