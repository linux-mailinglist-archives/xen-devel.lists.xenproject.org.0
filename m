Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F140459188
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 16:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228987.396293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBQH-0001rb-KF; Mon, 22 Nov 2021 15:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228987.396293; Mon, 22 Nov 2021 15:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBQH-0001op-Gy; Mon, 22 Nov 2021 15:40:01 +0000
Received: by outflank-mailman (input) for mailman id 228987;
 Mon, 22 Nov 2021 15:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpBQG-0001oj-Kj
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 15:40:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e0a7f8-4baa-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 16:39:58 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-qR7qmFnMPgiu6zs4HkLpQA-2; Mon, 22 Nov 2021 16:39:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 15:39:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 15:39:52 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 15:39:51 +0000
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
X-Inumbo-ID: 72e0a7f8-4baa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637595598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nA/WV77cXc/Qt4hmh824KuWrpgrzqOYrF87HGQUhCEo=;
	b=Uyp/TiYzgJSUMpocb5mPGJZ6HcZUGGXheim473ImhIoBZ38Xigw50DLzXZEts6W6AOXvVc
	WvXO6SZsC8niGQNte6W9YAPiWSpu4NePndNKdyH+b1+Ay6Yk1GgzDDRXXBWbeOBuc9KXXL
	w7U6vGpuqyd2upIP0J6xYKdBqjJ1Wfc=
X-MC-Unique: qR7qmFnMPgiu6zs4HkLpQA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7VFEk47uE3LJi+k13Ly1f1Dy18q2HbENCrsiP0SateMlP/Jl32sV/+ifyo7T4ZIYMmejuy5iPtkiz9oZIIrM5LNSWygAbIr0QYW3LM9s+612sF4Q0+DtSCUm/HPZPK0dxqhs0wyh0vjBC4EwX9AMN68QwZ/u+V60Be0gQc8scOSP685dBGud689gJXaWvL+tYlnqNyvKiTaw7RowiUMXqCI+EU348nU7IEneNh+RciZolE7X/JI7qe5lYV75CPyhLw6SKDbtElfNKVQxOLQcxLJEiksDRDTVZlBJ0wl4jREmb1ss3QfHUZRtK3USzDz6uBwIRzwEY+iUb9IluPycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA/WV77cXc/Qt4hmh824KuWrpgrzqOYrF87HGQUhCEo=;
 b=eZ8upUDpnmPYgBlEPlrmMvT9WO7+PArHT4/t1lmpTfOKHE1XqIB+0EdEDNTN7JKY9//TWaWJWKvcjtwUKm66eJieRC8VfQzoGAngr/mw598/NHksQ7NxuARewpPUIdEQPL8NfMnrA9oSiqG5Hv/aayvqA0CaJUjDJTw/xhaTOITS/KQgXmq8zpQb48DDgUOy4e4NuH7Wfoaj1fD9zgrgPPcexFOjdXQB1cf/1HU1nYSwQQYFOsCRcYgWL+gYIVpYns+bq7+2kI2KAffLLMBSQ5aTSH/PKrqXqVpwu/en40QLOsWEDYJU4qoFdGOIzwK5jTTUwSsGx0gxdPB+Zkou5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
Date: Mon, 22 Nov 2021 16:39:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210914123600.1626-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e06a8327-cf44-4453-579e-08d9adce536e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3773CACEE7F2D8C06F3C6874B39F9@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZhyB/WK8sva4fCGlvo10mrqTfzNCR2B4WkZ3WlL3LDOvd46N3Y098VaoOcow6Voo6NvHfzj92JmthZP3QjvutSxp3RpzwtV1Cv6wWQcvdsay3cpWLbyD6O3xCUfJ7OtAUxIpx545OCskKVu7xU0jEszaojbvfbL6t999p6HItxHdYltHZnOVCj1otaK8vE4PM6bU6PLWHKOhU2jdc5psdKhSmKWwc+nYBDDZg061NT8n2Qx7XMYeAmnXV6N2X1aNPTV7mamJO7GfPmgPJ+OIoycVdCUXrEHoL/R518y17Nw8y6SdpOkW8aDXwos6YlhlyzzS/tBJRgjgJs7YNbaWa0BV7+W296LtK+cQ2HiddjbPtJpaOlh/TRvSBhv96Jm/LiAN/QMb4d7E+RDHN+qZifoD/QzSNYyBDrYLtSk4uR1OF+Fg8oI0L6UwLMOR2F4YRWIfC4sY28jI19Hf3RWeoMwISBJ4q/qHAXtsiolFnnMm2At8B/mQTaU3C7WOUDXmfJz37HaRSvqIkJ//dKfA5wHMSFwNawDI0mtA8GX3qZnVAYvBvAgm7TNZWcICTn56d6Y8M3NBcUOVTbozqnDffPY+B4LMucYRbVshj6e94rgWIRLDXQ8I1zzQ6IMpSx/O6b/SaxRw+z7F1aIVmgEn1BR08KsDQrxtIKO7YQcNs3W1oGSImSXeter9vE06cHq2PsE4eyIklO+KU6zmtl88383iuR3vk2pFQLxCIMfdDH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(37006003)(8936002)(6636002)(86362001)(2616005)(54906003)(83380400001)(5660300002)(4326008)(8676002)(38100700002)(186003)(6862004)(508600001)(7416002)(53546011)(31696002)(66946007)(66556008)(36756003)(316002)(66476007)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0JrMnBIRXhtMDdvV1RWL3VYNkNJOENocEpaY01jcXlFaDdTUjdNeUV5SitP?=
 =?utf-8?B?aFlidGhLREFlVmtBMXNYNlBvUDFhL3FQejlJRjNLbm82WHhHelcyaDYvT3B5?=
 =?utf-8?B?c0psOVB0WDUwbEpYYlpYc2V1bVVPVFZUaTc1T3p3VHVGZFlnS3BWbnFlalJt?=
 =?utf-8?B?d1ZZQzlRSWt4UkdTbTdrZU5QU25SYzJGWGF4NitLbXFvWTgvbnF1Vm5RM0Zz?=
 =?utf-8?B?ZXd4SEthWTBmbWlpL3VtbjJlRG1JbmxXRGE1dFdSVHd1cHlyRzNCdkJSVHNa?=
 =?utf-8?B?SXloTzIvaDRPeUI1NGFxUUVlL3NPQUlVUW91V25aSFJnVWFOaUZyTWVuN0NN?=
 =?utf-8?B?dzJEMTJaemIyeDAxWlNUSzVVZ2VwOW9OOXNlVVRrMmdORWhpWk5YeTM1THZz?=
 =?utf-8?B?eUUzRFpuWGRneTNxeDdtdG9yTWFwTlJ1SXFxTVA4VzJYVEFKaGg0M3NrcEty?=
 =?utf-8?B?b0NGUk04ZmRYVjYyenpLOGo0d3BidUxnTktlc2dSV0F1bE9vSnNzVGo4TzJ1?=
 =?utf-8?B?K0p0OWZIWXlEVUNHTm5ySVZJaWpaUFRuQWtESDF4UnBoYmhmbG95c3doZk00?=
 =?utf-8?B?d2JnN21LUlptTXJCQ1lSY0VFZmtKa0xYZ2ZpZVhXQ3B5QUhYWmtRWjQ1eEsy?=
 =?utf-8?B?QXczeDB5aTVNRFZmT29KSFVGZlk5Vnc3eW5RYVhkTlVjcDNzUEU3c1I5Tzg2?=
 =?utf-8?B?WUY5YkYyS25LQXhtcVlxdmZCUVdmVm9iamUzQ2pRNzNLL0Z6L2V0NDIxb2Vw?=
 =?utf-8?B?WnI0SFRnMmJWcXhYRHJML1R6eG9QMGlRQlpEYmQvOTVvL2lLR1E2aTN0bmZM?=
 =?utf-8?B?bVJLOXlRN3NYaWNaRmVhbTh6ZkFiZVdQTkNzOUY2UDQxOVhmbWVJU0hJRm1v?=
 =?utf-8?B?RHlrcm5lQkhTc1NBQzc3NUpGR1lyRnlZbjBIMzdtYnpRdTQ4WlVqVUtkQzkw?=
 =?utf-8?B?VWgzS1A0dENVYlhwaHNBUWVtbmRsOWo2MllBbmI4UkxSWDdmZSt6OGNmOVdD?=
 =?utf-8?B?ZnZZc0htVUYrbjdxWUF4bGp5Q2lwUEdKOUpuOWwybDBqbUhnR1ovU0MvN0h6?=
 =?utf-8?B?Yi84RU9kY0I1NFh2WmZCREtVK2FJaHJXRlppMHNpaXp2TlU5ZWtLczA3WGZw?=
 =?utf-8?B?Q2hLSms0OVJ4dkxPd3RESlhjSkN3ajdrTU1VMG9EeUVKUTFFSFhFanFHdHQ4?=
 =?utf-8?B?bTJCVHhwaFZxUVUvdHh6c1VpdlFTclRxdEh5Zm80bWtKUzB1VGM2dEwxNU43?=
 =?utf-8?B?SXAzVkhKWU9MWVRjOWs3K0k3QTdlV0FFK1VERFBab01qU0IrUkNPaWRTVUs1?=
 =?utf-8?B?TEVERW1Wa1pTV3VScWs5NjAzZTBuWUczb1JqcFRWdEc5dUlrbGE0RHF5YzNI?=
 =?utf-8?B?N1Q4ODdHQUpkekJJYnVsSElmSFo1RXVsMXBZVzlmZUZhbVk0UE1nVjczd3FH?=
 =?utf-8?B?WjRraWdURUdhckJHT1hWOWhOdDJ6bG5DQndzVGdCTGt2T3YzNUdGK09aWSs5?=
 =?utf-8?B?K1NCdmxsdzVoM1ZscGpUcjJQeHVLVGEydUZYdVNHTjZVSjQwNDBaSmw2Mko5?=
 =?utf-8?B?NXM1NGNIcFp0RGpFcG1kWmJxWkQzTGwveW94NlRFS3o1RjdrQzIxTTBWTHRZ?=
 =?utf-8?B?RFBMbDQ5Qk9FNzBFVG0wUXNhSlNYUC82S2twZ21qQnR2THFjczJUZ0pGVEVF?=
 =?utf-8?B?eHE3eEwwWVNHU2ZPYjZyaXpsV3JoR3YrN2ZmWnp0ZWI3Sjc3cW9tWnVmTUpv?=
 =?utf-8?B?Z3FIUjN2WnNmWjB4a1FFOHl1MzJIZm9MVFhZSGxFSmRrcHFnZHEvSkxRaHZM?=
 =?utf-8?B?cU1aU055NjZhS1JLUHU1em5vVXpnaFZCTytHV29hdlBFdVU3bEdadzFDUTE5?=
 =?utf-8?B?aTM2ZmVqaU85VmtWSHRjUlI0WnNsVTI2czB0aGV3WDRzMks3aStyVlNyZWxv?=
 =?utf-8?B?TmZ5RXVUZ0VJazVKWHRkNndEV0FnMDlqd1ZVS2l6clZlcjVpK2JJRDFnay84?=
 =?utf-8?B?TGt4b3IvbGNPSmpLTDJuRTcwOVB3S0k1WEhxSUtONnQybEMwWEFJZUNiZ3or?=
 =?utf-8?B?a1k4Nzc2b3N1a3BhWW1iYmh5S2hDdzBvRTYzNGY3K0NaTzQwNGRXVzdKY0Fp?=
 =?utf-8?B?V05BSWpYLzB5eEt0aDByeS9nazQycEJkZzRXMW1BNHMzNjNsQ21qK3JIQzJE?=
 =?utf-8?B?bHdBZ2tjL04va1dFSkw0U2xqdm1KQnB3anVJQWY2cWJyV3I2UEVSMHVYWWVp?=
 =?utf-8?Q?dAM5meCzvOk/G4y3El40BLEgGFkB4Rbrn9hXnuxcu0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06a8327-cf44-4453-579e-08d9adce536e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 15:39:52.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+kOcXU3KpEXHPKbGnNORNKlJ9CsbhuDJQyXkB4z+8Id4V+tecQ+TqyvyBU9mjsQ3PF0IvYuHeOmI664M92qPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 14.09.2021 14:35, Juergen Gross wrote:
> The sysctl and domctl hypercalls are not stable, so tools using those
> need to be in sync with the hypervisor.
> 
> In order to decouple (some) tools from the hypervisor add a new stable
> hypercall __HYPERVISOR_control_op

I'm not convinced we need a new hypercall. New sub-ops of the existing ones
can be declared stable (and be made bypass the interface version checks).
If we want/need a new one, "control" is too generic: There's a reason we
currently have separate domctl and sysctl, and I think if we want new
hypercalls rather than new sub-ops, then we'd again want a global and a
per-domain one (unless the new one had provisions to be able to serve
both purposes).

> with (for now) two sub-options:
> 
> - XEN_CONTROL_OP_get_version for retrieving the max version of the new
>   hypercall supported by the hypervisor
> - XEN_CONTROL_OP_get_state_changed_domain for retrieving some state
>   data of a domain which changed state (this is needed by Xenstore).
>   The returned state just contains the domid, the domain unique id,
>   and some flags (existing, shutdown, dying).

If we go with a new hypercall, I think you want to split its introduction
(with just the version sub-op) from the addition of get_state_changed_dom.

> --- /dev/null
> +++ b/xen/common/control.c
> @@ -0,0 +1,52 @@
> +/******************************************************************************
> + *
> + * control.c
> + *
> + * Entry point of the stable __HYPERVISOR_control_op hypercall.
> + */
> +#include <xen/err.h>
> +#include <xen/event.h>
> +#include <xen/guest_access.h>
> +#include <xen/hypercall.h>
> +#include <public/control.h>
> +
> +long do_control_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    int ret = 0;
> +
> +    if ( xsm_control_op(XSM_OTHER, cmd) )
> +        return -EPERM;
> +
> +    switch ( cmd )
> +    {
> +    case XEN_CONTROL_OP_get_version:
> +        if ( !guest_handle_is_null(arg) )
> +            return -EINVAL;
> +
> +        ret = XEN_CONTROL_VERSION;
> +        break;
> +
> +    case XEN_CONTROL_OP_get_state_changed_domain:
> +    {
> +        struct xen_control_changed_domain info = { };
> +
> +        if ( get_global_virq_handler(VIRQ_DOM_EXC) != current->domain )
> +            return -EPERM;

The function result is stale by the time it gets made use of here. If this
is deemed not to be a problem, then I guess it wants saying so in the
description.

> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>      rcu_read_unlock(&domlist_read_lock);
>  }
>  
> +int domain_get_dom_state_changed(struct xen_control_changed_domain *info)
> +{
> +    unsigned int dom;
> +    struct domain *d;
> +
> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
> +            DOMID_FIRST_RESERVED )

As per my comment on the earlier patch - the use of DOMID_MASK + 1 vs
is quite puzzling here.

> +    {
> +        d = rcu_lock_domain_by_id(dom);
> +
> +        if ( test_and_clear_bit(dom, dom_state_changed) )
> +        {
> +            info->domid = dom;
> +            if ( d )
> +            {
> +                info->state = XEN_CONTROL_CHANGEDDOM_STATE_EXIST;
> +                if ( d->is_shut_down )
> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN;
> +                if ( d->is_dying == DOMDYING_dead )
> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_DYING;
> +                info->unique_id = d->unique_id;
> +
> +                rcu_unlock_domain(d);
> +            }
> +
> +            return 0;

With rapid creation of short lived domains, will the caller ever get to
see information on higher numbered domains (if, say, it gets "suitably"
preempted within its own environment)? IOW shouldn't there be a way for
the caller to specify a domid to start from?

> +        }
> +
> +        if ( d )
> +        {
> +            rcu_unlock_domain(d);
> +        }

Nit: Unnecessary braces.

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -894,11 +894,16 @@ static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;
>  
>  static DEFINE_SPINLOCK(global_virq_handlers_lock);
>  
> -void send_global_virq(uint32_t virq)
> +struct domain *get_global_virq_handler(uint32_t virq)
>  {
>      ASSERT(virq_is_global(virq));
>  
> -    send_guest_global_virq(global_virq_handlers[virq] ?: hardware_domain, virq);
> +    return global_virq_handlers[virq] ?: hardware_domain;
> +}
> +
> +void send_global_virq(uint32_t virq)
> +{
> +    send_guest_global_virq(get_global_virq_handler(virq), virq);
>  }

Following my comment further up, I think external exposure of this requires
to finally eliminate the (pre-existing) risk of race here. I think
get_knownalive_domain() is all it takes to at least prevent the domain
disappearing behind our backs, with the extra reference transferred to the
caller. Yet we may want to additionally be assured that the domain in
question continues to be the one handling the respective vIRQ ...

> --- /dev/null
> +++ b/xen/include/public/control.h
> @@ -0,0 +1,80 @@
> +/******************************************************************************
> + * Xen Control Hypercall
> + *
> + * Copyright (c) 2021, SUSE Software Solutions Germany GmbH
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __XEN_PUBLIC_CONTROL_H__
> +#define __XEN_PUBLIC_CONTROL_H__
> +
> +#include "xen.h"
> +
> +/*
> + * Definitions for the __HYPERVISOR_control_op hypercall.
> + */
> +
> +/* Highest version number of the control interface currently defined. */
> +#define XEN_CONTROL_VERSION      1
> +
> +/*
> + * Hypercall operations.
> + */
> +
> +/*
> + * XEN_CONTROL_OP_get_version
> + *
> + * Read highest interface version supported by the hypervisor.
> + *
> + * arg: NULL
> + *
> + * Possible return values:
> + * >0: highest supported interface version
> + * <0: negative Xen errno value
> + */
> +#define XEN_CONTROL_OP_get_version                  0

What would a caller use the returned value for? I guess this follows
XEN_HYPFS_OP_get_version, but I'm less certain of the utility here.
Incompatible extensions are easy to make use separate sub-ops, unlike
possible extensions there to struct xen_hypfs_dir{,list}entry.

> +/*
> + * XEN_CONTROL_OP_get_state_changed_domain
> + *
> + * Get information about a domain having changed state and reset the state
> + * change indicator for that domain. This function is usable only by a domain
> + * having registered the VIRQ_DOM_EXC event (normally Xenstore).
> + *
> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
> + *
> + * Possible return values:
> + * 0: success
> + * <0 : negative Xen errno value
> + */
> +#define XEN_CONTROL_OP_get_state_changed_domain     1
> +struct xen_control_changed_domain {
> +    domid_t domid;
> +    uint16_t state;
> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain is existing. */
> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain dying. */
> +    uint32_t pad1;           /* Returned as 0. */
> +    uint64_t unique_id;      /* Unique domain identifier. */
> +    uint64_t pad2[6];        /* Returned as 0. */

I think the padding fields have to be zero on input, not just on return.
Unless you mean to mandate them to be OUT only now and forever. I also
wonder how the trailing padding plays up with the version sub-op: Do we
really need such double precaution?

Also - should we use uint64_aligned_t here?

Jan


