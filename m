Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863350F584
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313565.531161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGxQ-0004QD-It; Tue, 26 Apr 2022 08:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313565.531161; Tue, 26 Apr 2022 08:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGxQ-0004OL-Fq; Tue, 26 Apr 2022 08:54:04 +0000
Received: by outflank-mailman (input) for mailman id 313565;
 Tue, 26 Apr 2022 08:54:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njGxO-0004OB-QR
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:54:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad862c5-c53e-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 10:54:01 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-ucKoAe8RO7KpfGUQJAcsSQ-1; Tue, 26 Apr 2022 10:53:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB7127.eurprd04.prod.outlook.com (2603:10a6:20b:113::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 08:53:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:53:56 +0000
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
X-Inumbo-ID: 6ad862c5-c53e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650963241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQoK8qMH+pmcRX0aCwjGFUHjI0xneEzZZ2wQfZ8XyL8=;
	b=QeJblDmIbL2nhTCQoQuT+VHkyicbAODsEshiNMoWpflj86U94dknXaocDjwph/fwDhNQbk
	/cowzHMLBeNXVHijBRfMA/koel5G7yC2fyGM/kiygqteAbMghoZ1r1PQCoLWsgJWF/PVwz
	uz3eaduFhA1LkYWGx8hwRIn1e7yCJKY=
X-MC-Unique: ucKoAe8RO7KpfGUQJAcsSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8QUhMGQKATdgz7yWpH5NlZZbnsOhBQqsU2qhsoAcAy6MmU80U3pYtqn1UU0cnPttmopBF2PZXlnyunuqqRQ7Nk0iYM+tYc/bVZdiWTSxMLdNKOnL4q+xr+abvP67dY8OQZ9MH7ATtUC6hbSieGvR5+C3gUR0LmZeIFYqxRebgGARVpMYRtv/XR+gUoCSuL1JbilwqXEdu/XAmBbaH3JjfXrrh02ILn3V9JMZhxTb2psqae2wL13elgRUqKjlnByb+KQn36U8RWGpGsG++doOSugVCJmNY4Ja4KQX2Rq84Q2CGpW8YJxz4Ptmuugk15sta4gsmNCdLdoDAhjiWSG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQoK8qMH+pmcRX0aCwjGFUHjI0xneEzZZ2wQfZ8XyL8=;
 b=D+dZOKM3XbywCz2DIH7bclVJxEJQ3/PJwUXCChetyGqSM01FmPT/va9W8+QCCZNhl2YkzuUPGsWtOkUjkLknlqdwlK9oE2N0qX9Ccwcnv4X/jB80WyJ8Hh1LMVpVtolioXc1O9vuCDY+2Nm3JQvZkUHyUwBUCvzMBN5PI9/1QdLgKcRr6U1D5Q2itLfagChoT1HG1ZxEx3/+H7Ughx4S7bSHMak1fULsRl3OULgU34V4EQvnyR6efhfmjBlGMVN6jD2e1hX33z5Hq7u/1+cCol5K3OFUUmQ7GZeFmqD2cZOf6kLe9rDL/jAqMf21DgDx1q4q/Kv3dUGW5nHzSeyxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
Date: Tue, 26 Apr 2022 10:53:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418090735.3940393-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0246.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::12) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc78357-a958-4262-0a67-08da27624c20
X-MS-TrafficTypeDiagnostic: AM7PR04MB7127:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB71270D14AA9836268DBEB342B3FB9@AM7PR04MB7127.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3swJVC4BBANn1YrsbHulGAyGPGSGEkPViS27bQ0XHEs1mbMtCsu0SbAX3aVkPbgTJ0eHesvA3K5iHUyNR3I9rKhkfbpJKL7FE9L6/A6ETt0/03y8zWbjS++OzPOo/ME3wZfAQ54w8PJrNAARqY3in/dxPuvzoaRBL5HabP+iF8UU7JibZsrsxD+1KkSU0KQOh9JDtvj/0f83uqveNyW1ytNoizHiT5eaUckHLa3tBdiI/qVR/++e2/j2U36NjzUIu3PEq7DLKAKxoxG8J6t9krKHCs2Gsx3NF7gZ3ZQri2Ue4oTxDCFtOHVbAzPcApb14FS2yBIbeXHK6qA9gDQgNRrFFtk75AsvpOF67e47zY36PN89n/H0QQQSeReu5xwduocrgHxNuLSBMO9nMOxirR1s7z9fhP/ad+3x7Kl8DBeq70Ml+x/B2KLU6q0A3YJPFH+aD2OV+PcFVU/hCzeptwBXjEmT3QPr61FkK6O48X58E+1AXe1M/lhtT+J6JmI7oQZBtVOzGdRTOkGAxEd9G3ak9MkO35u/wJSsziVLtvzo61WW9/g0gP63i1BHhFpLmGIHr8OYfE/9g07nte75YjM5fHpeZjcrrylh4O1aJwHb1PWswtvKRkXhCdrlN9PAUcZksEcHlS56up1B245bfFX9OMGjAxC+8T6q/doukYFzY3PIru9sKLvRaF/RmygRrRcMXQS1RHisI8FBkfckiUyFVjr6GXEZ4mdhRIU0j/ldNS0Y6X8KDUnZlghpo/ev
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8676002)(66556008)(31696002)(86362001)(66946007)(54906003)(2906002)(53546011)(5660300002)(38100700002)(186003)(316002)(2616005)(6916009)(8936002)(4326008)(31686004)(36756003)(6506007)(508600001)(6486002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFE4ZS8yWlZQK0haWEJsOHVpMGRzQ3JHd2hLZzJ2SGJ2Y3lyaU5DMEtsb2NK?=
 =?utf-8?B?YllaYXlIUEEzVUc3NFQwbUxiZUE2SHRrRVlaOEFJSTdCWTEwczJMblJWMFVG?=
 =?utf-8?B?Y2xUaE9WSEdEMVJ2Wll0d1FXV2xlVGsvQWNmNnp4STJWNjJweFRyS2lYZUpV?=
 =?utf-8?B?MGUxNDJCMnZHM2U5YjJzeG5ETVQ4SmVCU2JoK296VElKMHVzcWhlWThSandz?=
 =?utf-8?B?dWxuWHRqSXhsc2JJTlRxZVAxY3d5Y2pjeUJrQ2c5THE3VE9qaU9mMDIrWHhX?=
 =?utf-8?B?aFhJZW9OMzhtY0FnKzZHUkpTdkhxdTVmZmVNaUtkczd0L0NkWVk0Z1ZQL3FK?=
 =?utf-8?B?S1NVb0tYWDBNbjFMNTRjN2V1UXczdjVrRnVzeDFES093bnRlaTNKcTIvMnlu?=
 =?utf-8?B?K2lvMGdwUXUrVGlYY1AzcG84S0ZmMzhFWGR5VVREblpQbU95azl6ZWdPWkk3?=
 =?utf-8?B?YWJlaWoxUW1jVXZoaXoraFYrUExCVlZaR2FER3lvcWcycEtnMGh0Z2xKUnhi?=
 =?utf-8?B?eU9wd3RMMXJWRGpoaU1XVmJTUFlaM1kxSDZLZWJSSmY5ckJLYmNzaTNBcmYw?=
 =?utf-8?B?YmU5TGZ4dUVOZzQ1VWtXN3RtK1lMOG9FZW90bWNybW95QUNSdzFyUjBJT3FQ?=
 =?utf-8?B?QUg0MUdORlBVSVZRZ2pCVXFwM1lnRS94M1N6bHQ0eXViVWMrSk9KNjhneFZT?=
 =?utf-8?B?WlFTdGVCS2l1SGVLcHFDd1JORk1wODlZUHM2Y1o1Z2J6cjFiOWZaUzAwend5?=
 =?utf-8?B?MVFhc2ZJaG9JWFJKSWdVYlozeXBQQitDMlNpK01uQjJQT2lNMzZsMWRNOUtq?=
 =?utf-8?B?T1NTZUZYdHE1ZTYzQ0RXZEQxTUo2bzVDdkpDR2RzcFFwTnRsZjFVaUovVFZz?=
 =?utf-8?B?b3psK004Y29lb1ZOaXpSNzZHakFNN3JiV2VBNnN0VFdWdlRoZkg0RkJXWDIy?=
 =?utf-8?B?dUtZYTRCSmJvblVja3hHbis0Q2w2QXlsOWxsWDU2bHBNMFRiK2xoRWc3Z2ZV?=
 =?utf-8?B?SlNybGxXTVZOdG1NYkxLVDdPblZzSFhFRSs0NytEZWFORjVLWEZDNmpCRVJ0?=
 =?utf-8?B?OWcwV0toL1FsZzRHRVZQd2h2TTFmKzkyYUNhcGRNell5U2xrS3EvbFJBUjJZ?=
 =?utf-8?B?b05Zd3IwcDBXQ0R3WEgyU1FPTzFIQ2JncFhJdkF0UGRlMHZmeTBNZWUrY3NM?=
 =?utf-8?B?V0VtUkNrTWpiaEtWRDk2cHozUGo3NFhDT3d3UmJSYnlyV1JyZm5KU0NVVGNy?=
 =?utf-8?B?QklHQXR3ekJaSU1KRlpQZExRd2NXOVQ0YWplb3grWTIwSDFBUkZtNlg4N1g4?=
 =?utf-8?B?YW44Rk1ZTzNtckVEakliWnhiZ3krMGk0U3AzdDZaOXF3aVR1bmpnSVFjYWsy?=
 =?utf-8?B?UVl3Z1NIclE4WU1SdnNIeU9OOUZOYkE0amZUVk45eSs3V1dPQ2Fkc3JyUWpq?=
 =?utf-8?B?a1I1U1JXRVJqWUQ1VkYraThmblNKZ3hBc1A0SE5RQ01pYW90YWZmSjdSdkZG?=
 =?utf-8?B?dXR4clFkbkxJckdWR1JuTFp0WndhUnozaEk2VlFTWDRFVkN4QVZ1ZXZuaTJh?=
 =?utf-8?B?czRUYjAwY3hZTHU4RGxGck9kditoS3U3My9jU0lLZHhCQjBiY1dsR3p1TTRD?=
 =?utf-8?B?STZpL3IxL1JrQ2lnUEkzb2NEQUtaZ2dWTkw4YXVuMEwyTW83bDEvUVdZT0wv?=
 =?utf-8?B?b0xLVFpjY2RuczdFTFZnV3JGSUVCZzhnVCt3cU42Y1laZ0lHdnIwOFUxWXFo?=
 =?utf-8?B?dlBRdyt3RlJHL2xVR1gvYktyVHAvS3JKcnRkaE9iampxZm9TMGdiMG52UDNI?=
 =?utf-8?B?aGFwdlhVaGV0L1JQbVE1TDZRRTZuWjJHUkNZa1I3NkxLSThFUDZNM29vRm85?=
 =?utf-8?B?VDZUamp3eldnL0ZHRm1WeXVuZ0c4NEs2ZlI5azBDL0QrNzlrOWthK3M3RHJq?=
 =?utf-8?B?Zm5nSGJqUTcyT0ZnS1JzalZIa0E0UElzc2JqNkxocUtkZ2xBN3FZSmpkNjUy?=
 =?utf-8?B?ZnBja1pocDEvM2l0WHc1cWNZQWI3U2dwMFpRZFBhRStaM1JVZXUyNzN0b3M2?=
 =?utf-8?B?dXJYcWhrRFIzNi91eXh3S3BTbHVMOHlTU2NRejR3T0t6TUc5QTNsYWVnZHMy?=
 =?utf-8?B?L1VhMndwTDBMYkxkSnBJNVh1UmdrekpKdzZFaXVVZ1lMd0d1cVg5NzVaZzlo?=
 =?utf-8?B?K0J6MkkzS2Z3K2tZNndieGtWTUxXbVVOaG1Lc1duaDZKLzdRMHlPbmdNaGtF?=
 =?utf-8?B?Uk9QMUJkRUE5QkxkdkJXZHJVSDc4azhEWDlGRXdVZ2JjM2IxOHpZTm5nK21C?=
 =?utf-8?B?ZmplRitWVUd5My9pU0I0OWJUb3dUenAwMXJDVS9NaUNjRmNXQW9Zdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc78357-a958-4262-0a67-08da27624c20
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:53:56.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAqFBU7dUXTtfeAUaxtzEbpdhmt9qigoV0Y31H3/QWGrcIriZwQ7juRuWqqOEKL0OxJY2yYg6lsDsqWsJY3kYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7127

On 18.04.2022 11:07, Wei Chen wrote:
> diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
> similarity index 71%
> rename from xen/arch/x86/efi/stub.c
> rename to xen/arch/x86/efi/stub-x86.c
> index 9984932626..2cd5c8d4dc 100644
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub-x86.c

I'm not happy to see a file named *x86*.[ch] under x86/. I think the
x86 file wants to simply include the common one (and the symlinking
be suppressed when a real file already exists). Naming the common
file stub-common.c wouldn't help, as a similar anomaly would result.

> --- /dev/null
> +++ b/xen/common/efi/stub.c
> @@ -0,0 +1,38 @@
> +#include <xen/efi.h>
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +
> +bool efi_enabled(unsigned int feature)
> +{
> +    return false;
> +}
> +
> +bool efi_rs_using_pgtables(void)
> +{
> +    return false;
> +}
> +
> +unsigned long efi_get_time(void)
> +{
> +    BUG();
> +    return 0;
> +}
> +
> +void efi_halt_system(void) { }
> +void efi_reset_system(bool warm) { }
> +
> +int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
> +{
> +    return -ENOSYS;
> +}
> +
> +int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
> +    __attribute__((__alias__("efi_get_info")));

I doubt you need this outside of x86.

> +int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> +{
> +    return -ENOSYS;
> +}
> +
> +int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
> +    __attribute__((__alias__("efi_runtime_call")));

Same here.

Even for the non-compat variants the need is un-obvious: Are you
intending to wire these up anywhere in Arm or common code? This
of course is once again pointing out that such code movement would
better be done when the new consumers actually appear, such that
it's clear why the movement is done - for every individual item.

Jan


