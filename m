Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DB4E6F56
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 09:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294605.500989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXf8Q-00052W-SZ; Fri, 25 Mar 2022 08:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294605.500989; Fri, 25 Mar 2022 08:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXf8Q-00050b-OJ; Fri, 25 Mar 2022 08:17:26 +0000
Received: by outflank-mailman (input) for mailman id 294605;
 Fri, 25 Mar 2022 08:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXf8P-00050U-J1
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 08:17:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00054d8e-ac14-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 09:17:24 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-rZZTBHDzNwmuG6SLqyXHcw-1; Fri, 25 Mar 2022 09:17:22 +0100
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM6PR0402MB3607.eurprd04.prod.outlook.com (2603:10a6:209:12::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 08:17:20 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f%9]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 08:17:20 +0000
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
X-Inumbo-ID: 00054d8e-ac14-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648196244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CF+h87r3VZg9kM1G6vtG6dFYUB/hOYzdN73hDFP0M68=;
	b=a9n3lSxkg0x9HaHJtQ0Wf9GHeXjdhn1nWgGcsgIyknik9y69xP2l6MEmaZBMcwDx4XN0Ut
	h0yS9VqJrP1FFAgLOgH3olpO0nCA4lONzeRY75x5Kng0JBgzinjM5i+lCMkBbuHsrsf2uq
	Al+aZeakx8UAigmpuhQt8AyGDw8mbds=
X-MC-Unique: rZZTBHDzNwmuG6SLqyXHcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8em4XaR33IwKATU5c2jkHCP7RF4U7VqPDDPEefDypE+pjnJSv9SvwvTz4hAULBNGzFvlBS939Rc8N39I/iKONBmjPhZ7hiab5aTes5TpKzgCIcs2bUZ5QcT/7x0+ZmjqzR1L8+1FAieXjV2zrYomF+BQjOgMXzvMFxzt56vLpIoGmsoRtVvF53+hOwSSNQjFY48BFIwZdAq/qN+okcA08umY26kKPd/7S0beGcj+OUVwxIWDSIObTu7AtHJQQAxHRWOj8MVNNXapgvLVByNvF+zgiZEcJfDXcDRm/TrVBis0RmMAlsXwiZhzJ5/auj5rQ/PhVIzUfn2W+2TyTJfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF+h87r3VZg9kM1G6vtG6dFYUB/hOYzdN73hDFP0M68=;
 b=GPk7U7m8+TDCIlhr7PgZByMHKnp0TtGESDnQfrhiZbrNBHQrrnO5FSkhk0JlikT/R8wUC3GuwAZBtinjj5/yHUs3/nFXAhLd33pLdm6AFgm+vVFjzJJFar9KI0Y/deevhrcVAN/C4y07wogQ9v2xBaWXAnBEdf+CMeJZotQlcswHdVmbY0MCJcXxZPwq/gxhB8k6KahZNqZitItv3j4p4Lgu24J7Qg1TUcKSsYgBAdvZoC+BI7SryBUUmRSYKIIQjotHGsardaayBt5NMGIu5tgHwRyVJewoK4H5j0cwl9n2KHxZVJ0h81t9Q/lfyfICbdjjCjPvp0SArsCE/XZ+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <319d05ee-d750-0f49-dc10-fa0725f8d9bd@suse.com>
Date: Fri, 25 Mar 2022 09:17:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith.dev@gmail.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::27) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a612ad75-2a60-418b-47b0-08da0e37e1d3
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3607:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB36071DA5402391BD4FDF4592B31A9@AM6PR0402MB3607.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wV7YfCABelfI1iURYJnEeZcOrEPoaR79zhY9icI8GAlMT0hSEqK7yA/8GquCIkzfOeowfhTIHzh6KnwD8hFLeVRjeJOQALZ3d+qPU8t3hf0CfA+ccTYl92Jvfzfebd8XRuitncM77bs8Djw15L2mh0Lzc18Gkf2/9rbjD8Pb5I3Kv/petKrWTBMJ9SDc1FuYdFDJQn0zuS5zBOt1N9qqnhIayL6rU1EpH2dwMPih2CEzKcc3JyR2zZM1gs0sx6IBnnG0czJdVDnpt6NSKMCBCnzoYXagxmntE0VMt+L9g/KtIU+PFedBJsQtkUUGb0eS1K0qtRw8k6ALiJ8rDJdfmRGFPTFpRnp8cQ/X5ngSNh95aa/WughcPEUTWo5VaFdXnI7b5WHYSBa7ojUnYLmkIVBpv+NpvwI4H0fDUpzm/OBUMabRDS3jcl6a9tam1dVwry09Sm4x/ulYA/D0mkgiOqyLiJ3R/xf87GBwhbVa1vPmg1vdlqXYvVjA2K6pRYM4aFfPvMY7EXfX7un3Sahkh9JxCHbc9mEcVlzSZ4+eIVjG6oGNMPfmGs0mXICFUe+m5hE7/JjYFBjroKs2LVtlKjuFCApEl7qDl4Gr6HQ+eFKTT5n1KlWxsAvpXDocO9l4ROO/Io1DlEaXhlEnubWb0T5b7dA7gknDLuRSEoZ/Woh5uxvQr8bWYok5HRr7fN1OnZJde5mxFHGxKobk/bm/3IjJwJZlbU8eT6GlNo97RW0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(186003)(26005)(6666004)(86362001)(2616005)(6486002)(2906002)(4744005)(4326008)(38100700002)(31686004)(8936002)(31696002)(316002)(6916009)(54906003)(7416002)(5660300002)(53546011)(66476007)(8676002)(66946007)(66556008)(36756003)(508600001)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJEZzFQZDkyTlg0aGRwVk1LOU55M2JVbnUyWjVxbjh4dGlOQ3RtNmFqQ0ph?=
 =?utf-8?B?bWx4SEpnVWR3NlpDMlNSb21URkhVcFJmUjVsWml6RFdrNVlZeVU4SXBzYUtt?=
 =?utf-8?B?YWM5WTNRY09VbVQ1c2d4UitmK1lMTVc2V3JHVDBRdHFpMXVkRTh2ZzhLTmJx?=
 =?utf-8?B?ZG9kKy9QRGlPd3J1S0dFOU40WElzeGxhN3Vacjc2VDI1bWlYM1RHYTdTRkJo?=
 =?utf-8?B?ZXBFQnpuTTNINXNROHZkQUFhWDNWWEdzdlRDSXRjYkVOME10d0FadlUyTmtP?=
 =?utf-8?B?RHRocy8yTEFCUEROcVk5T0VYdGdpUGFCbjFHSGIrREIxUTU0NEZjdzU0SWls?=
 =?utf-8?B?YlNCVURYTGJxOE9XbjR3MFUxQWN3R1hEYmhCRUU2OG1ob3B2UlNGL05hWWxL?=
 =?utf-8?B?Q25objR4N2FHWis1d3RTbkZkbldOMkR3QVFGdTFPOUdhNmNtV2RrRDVWUlMv?=
 =?utf-8?B?Tm84eDVCNmwwWVEzd1BwN2k0czg2MkF6SEJRWjhLVlJlWmxTLzMwam9XdjQw?=
 =?utf-8?B?MTlmMHRubGVXSHM1enlsbG1tVVVhdmpXcnpwNEdENVYvSHBKclBDRyt0Vzhn?=
 =?utf-8?B?b2RiOXdpaDBjOStpT2xJRERFTUxoM0Z5Q05uTTFrSG9RVUw5TzNwWEpmYURN?=
 =?utf-8?B?S2dRbWNZRXNhRCtWRFBLTEdTSW5ValA0bnQ0VFVuTGppb0MyTUpIUGR1Ymh1?=
 =?utf-8?B?cHFtTGRIS2NkZUtMUmw3QXVFMFFDVnU2ak1GQWMxbjg2UWdiR1RWb2ZWRm9M?=
 =?utf-8?B?b0pMeDNFOEJob0RLL0x0cFdzTGtadnhyWUtQR1hsYnlRc3p2UHJtOTZXazNi?=
 =?utf-8?B?ckF4TEI0TjF5cGxwYmt4Q0N4Nmc1WEtBTkYvd0VaK2RoUkNneDd3NGJ3Y2Rm?=
 =?utf-8?B?eFJNRW9aWmNmaWdOV2k3N01WTm5MemRmczRyalQxTXBnMmZJOUFnWnAzZ1F5?=
 =?utf-8?B?WFpiMG4yQVhnOXRXL2x3TXZJdnIvYXB0c21vVG41U2ZKS2NEZ0d6dUwzRUd2?=
 =?utf-8?B?L1pNOU0vK3JMOVRPOEJWTWtQMkpxQWcwc0lpaExHV2toMFk1aC9tSzJlQk5u?=
 =?utf-8?B?dUJTbnROSFJxVmRZc0U1WklpNDR2Z2dGanFSN0l5bDVYSU5waFBsRnZGUUdN?=
 =?utf-8?B?UDIwbzlIdmgwd1oza1RWMlU5WnJqd2ttcGVHNVBXa2d0Y1czL2h0OEt2TlFV?=
 =?utf-8?B?L2lSa3RyVEVGYlkvNi9ncFdOT3hRemZUcUwyMXhFZWpCMElWVXFsNjRlUGhj?=
 =?utf-8?B?cnhWbVB3NGNTbUxwT2dONXhhdXE4NmtBWnpucjR2QXVGTVU5QjBWMmJmYW1a?=
 =?utf-8?B?aEZzMTIwQzBGRWJMU3ZLMnJtNXBjN00xbWRxMm5OUEhtclZQZmlZS0I1L1dF?=
 =?utf-8?B?aU8xQTAxc2UzWjA5VEhHcTVwdlNRSkloZ3hNLzRCQmE2Q0ZiZG5MT002SXFt?=
 =?utf-8?B?eXA5QVEydGVMNVhhV0hMYWlEa2FKWmluUkdReWQzcTI2UWpOcU0xaVpydEpj?=
 =?utf-8?B?dEtFbWUyZkt3T3JrOHNJM25EMWU0czdvVThSSjIxZHVVSHhLdXFJSnFub0NR?=
 =?utf-8?B?RnIyRnRJeWNjOGpOSlFmck1YcVZyRVpxZVkvMjBoZ1pWV3pNcm5OL2pzSkMv?=
 =?utf-8?B?bXpSUHRwUlZYY0JrRlZUcWRYSDZkb2liNjZDNTBXaWpLdWVKUEV1clZMQ05k?=
 =?utf-8?B?WkRCSEY0amlRd3ZCbzdFMFJOdUpOalNQeWV1aTlNdmhpL1VsUklXeURPN1Nw?=
 =?utf-8?B?U1cwUE8rSklyMU1COWJtdFgyUnljR3BoU0dtSUpXQ29zZDVqbGlONzZhNmlU?=
 =?utf-8?B?L3dQdlRpOEFMSG1DMXlsdnJ4QUNsUzBPM3UvQ2UzWGc3YnRLWWVyY0lENmJZ?=
 =?utf-8?B?ejBBeEwzZEJua3A1REI0ZjRQTlprTlFyOFRPOGMxOGN4SzI1YUMyU0k5SXFP?=
 =?utf-8?B?eVF2TmNEWE9CZlRvRkZmdTNVU3BnZXc0QkNFMVJLWlJ1ais5ckEwbGdPcVJs?=
 =?utf-8?B?K3VzQ1BEUHhXUXNrV3puMTNvZzlZT29Vem13U1Urd2xQU0ZvRkxqQTJGZXNn?=
 =?utf-8?B?MTNVZU44TkNsSnB4R2ZnbFgyMFcyVlJUMDN5SGU2a0VoNzI0MDd4TXgxUk1k?=
 =?utf-8?B?TDNMNExNQkxHRDhyNlhmRXk5ZmFiclFFdENmY2FTRUpmeFZUUWxtNzhTRjVs?=
 =?utf-8?B?b2hIL2JKVmtpTDJNZjFwNVMzSVBtMTlmZWZLZzJlMXdVUVVyUGFJTm1iK2Ji?=
 =?utf-8?B?bDk2U09UeGw5WDRYaHdKMzFwNEV2TWNyMkVUU1BsN2YwQ1lsc1dyRUZqUG45?=
 =?utf-8?B?RFp3aTNTcEoyaGxtcTdacUw0dlNteDNYdXpBYnQ4dDRNYTVVMU5Sdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a612ad75-2a60-418b-47b0-08da0e37e1d3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 08:17:20.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9tRtVgV3xqSxXCZIIbabDfWGrpSc3+ySWMr8+xWSHKhTny6VyZm2QzXuC7/zreMbgJcW1yW7PT3LP02jEJq8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3607

On 25.03.2022 01:30, Stefano Stabellini wrote:
> Maybe, instead of exporting get_free_port, we could create a new
> function in xen/common/event_channel.c and mark it as __init? This way:
> - we don't need to expose get_free_port
> - the new function would only be __init anyway, so no risk of runtime
>   misuse
> 
> What do you think?

Maybe. Such a function would want to serve both your an Daniel's purpose
then.

Jan


