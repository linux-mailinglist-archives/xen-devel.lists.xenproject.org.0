Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170757DBD2B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625242.974353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUf6-0005dr-Eg; Mon, 30 Oct 2023 15:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625242.974353; Mon, 30 Oct 2023 15:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUf6-0005b9-As; Mon, 30 Oct 2023 15:58:44 +0000
Received: by outflank-mailman (input) for mailman id 625242;
 Mon, 30 Oct 2023 15:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUf4-0003J5-LK
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:58:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3280509a-773d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:58:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 15:58:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:58:40 +0000
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
X-Inumbo-ID: 3280509a-773d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDnR40FcRlR5fDDZBVyCNaUoNjFQ4fGQdwQfkh4Z5aJlkVm4o7dG1JpPGQIj1pr+SYC9YwI7xKkF2fIcqx3AegbFIbrRBZYLgVwyK2WqakS94mo7O2vVaqyarpjvI4cck8g7yehfKi5nS1EshDWM1h226biZCOpWhpedCFT8y4ZgpTxq9GA0MjJVRNTSw8ESCikyZer3ArlXzLgwI9GpITf9OiymVzbJ4GVDOAxoYVZgzc7XgnguRAtKHNk19CGsmRJqMneY6KOd/4zZ94GrNOIOhPmFswB/1wiZHSyVl2x15hPZ9xzzyBy5YifB0ikH8/SUdfXHllItOJqnVn+/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxMMYCGZQJfesL30vhlhbBOk3ppBIyeZxwf+yGxd8Vo=;
 b=b8tOP3b0Y0w0ThkyAd2+r5lwZAchQWH4oBMviK9TDaekXsQ7rnVQhmG06RPucDTO4A3D+TY7/WU4a3BSQeaOI3Zl2n3Qz34dfKbRp7vTAjL2vI4aax3vHEwZVnzwV8FLBQDuIwRoNh6dcnf8FjehcnlN6NDm9FKQ2nfU2ZdzlQCNmq19Vo5Hi7nyeKLseICUECKmzFgDj8vk9hZ3pYfcR5dc9ULfBMP+JDmmpuS13BQ2920RNImWN1gXwPSb1U7SGRtUOL9BKWlW0rAbqRdc1Dg7MTpqJuo/tIc8wGTYwkcyuOjjPQ0Iqheztq31D0ZHi3Te2zb+7aANIqCVukSZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxMMYCGZQJfesL30vhlhbBOk3ppBIyeZxwf+yGxd8Vo=;
 b=Bp8mTDmwk30lwqiHQ9VriCQFKXju2JBALOIrm1Bcc/X2witnr5KBEATVMEwGFYM+O0onnwOJWNfw+6q1Oi2yP1Rf6Ig9CZPWBx8a7JGr6IRuMgOplxwQtZ4O0wwEpdAKaHGhXhpjEPfAM+p9KzLvRNl1Au0l38nVEiE4yTp+bhaJR97O1JHMHqlcn6KHcRvMZwdtl8HLKd7fRS+D/6wxLHqapWbRofWTEOWCsGFjG6pn2LSNfAYjliz6X+ko/4k9ZqdUME4qjothmKGOAIcFzVIYwWfob6FVdeNUOegJvMVaAsdmpd0sV+Wtq6efFZ0ylloen8/ZzUBNG+PzLRLeQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d133561e-8bc8-8ff7-b155-6e63e93a0bc1@suse.com>
Date: Mon, 30 Oct 2023 16:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 5/8] x86/pci: address a violation of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <19fce0e146462d713e3f7dfd816f87b35a94636b.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19fce0e146462d713e3f7dfd816f87b35a94636b.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c71114-816d-44b3-a4d0-08dbd96115f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YbBYq52GmTj+6Ws2NuEfdghMRxX6ICp3EaqFx6oy/NWZAJVA47NdpfClso2aW/tH4V2ZxLq6kyXn0gWDMzPOiGtWvHLpLAOvM1KNivJZlA4HsFZjhxdfa/xFB581FwUf2uBKWixoHS7EySk6yCaXFX+3qCuy6HEjfq1iuaCWkb3oGLHOPglP5cHdd7Noie4zfi5NG+v8Ir/3vb/iLlFakTJ1QHyu7KVgBexBtnJBB5UmSqr1jqyi9xyGMLLrk9gbhImEJjSbK9EjE3FG4uIX7EVDLd+ZEQ/WCdEpxYzb1iNqatrqEr2Uyf/7A4psSz21/UBZ9l2P47eKZR4VZMwV7iWtFl6UBbXPEc36Hh3xxC+GtmqXNeJ81p06fGqCqsMyDVj1gyZcOMjevoxRiin9AmwwBuQ6KXKOrMs6hUyRH4uHaNnVZkIRurA5Ly0iF8nkaoKX7d7CEp53QntvUc1/W4Y6iO4lCcXK9a5edwCKvQ0BJJAunqZ8zckR0RFCIp5ckpn7fxkaWFzXydgLqkKKBY/dhhQ0iy5usXIzlT3etau+B0iJgvPUHE5exMloSADFl1A6BXuR7MGAaXZ+2Iqa3FQpghzchCD2H0aiwykmBT4l5PAzyUslNIgbHdmzUHgUsOyUdixcED89oJ8Rurd8Jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(86362001)(41300700001)(31696002)(5660300002)(66946007)(31686004)(6916009)(8936002)(8676002)(4326008)(6506007)(2906002)(54906003)(316002)(478600001)(53546011)(2616005)(66476007)(26005)(66556008)(38100700002)(558084003)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2pDOGZWaklkblhsZE80dXB3QkhnTEQxeVdVdXZXRG1pWExhMjQ5QzlnaVdV?=
 =?utf-8?B?WCtXTkNYMTlPSUNCUDdGdEdHZ0JyMFpFUU0xeWZaRERJYVQ2RTdMU2ZVYURS?=
 =?utf-8?B?Si8yNjVQLzZGNUJzTThEMHFQOWowL2F2MHpwQ21ScjlOdWJybmg5VGhrZVdr?=
 =?utf-8?B?OVNhNkREeXBTZXZiOXNBc2FNR3VIUEhQUmo4a2RYazJ6enVuUE81Rk1TTlIv?=
 =?utf-8?B?YnpkNjIzUmxEUStjLzg2ZWRiL2FlSGwrV1MyV3d6bTlEYjVYQ2lrZGpNY2Jk?=
 =?utf-8?B?UFltSDcvMFJNT0kzN2d6T2E5ZzdGRFFKYnJNOXFJN0plMEpabi9DRmY2bHd3?=
 =?utf-8?B?cjVMck94UHRrMkp6T1pwTVU4Um1aa2RMVE9jSVdjOExXYm1iNS84VTlBVVdN?=
 =?utf-8?B?dHdBK0I0QVdPamtXQkVvSUthTFRBYm1PenJTcE1iM1FYL1R5bzA0VkxYL0pW?=
 =?utf-8?B?eXNwaWcyMjVTdGhsQVgrZWUrMXp0cE9GUzVLV2J3VlZiTy9LNGZQczhUSmZY?=
 =?utf-8?B?bUxIRWxJWXk0UDVPUGdrYklPMExMYzBsSGVuOWVKT3lWYnhnTzcxSUtsUUdS?=
 =?utf-8?B?SU84VmJNbXZPRG5pYzRlMWZJSXZHajNnK1ZsczVMdTkycnZ0cnB2REZ2WTFx?=
 =?utf-8?B?QTZrYm5MY2N0eDZDN29sZ2lPL20wQlUvMmRFenJrbmVLTDhiMU9BTlZJUDh1?=
 =?utf-8?B?cjdCS01KVWNROTBRaFdPdmMrMzBqWGRDc1BYRmo0Q0xMTjBJbDFvckE3Sm5Y?=
 =?utf-8?B?WUVTcTRqSFMyaENuRWxXMkhnb2lUTm8vckdCc0FhbVN6RWZCUXpualBrV3dC?=
 =?utf-8?B?MnIvcndVSlhtaWRsdWIzd1FobHQyaE0zek5xYzRIT2RLZHcvblZkVUUxLzdU?=
 =?utf-8?B?RkcrYzJ0emJPYklFalBNQmJKK0NtVmo5VzR2N01XSFBYa2taNFdPelY0cTd5?=
 =?utf-8?B?T29wS2RJdktBSzkvOTJQdHdCRzNGRnpNaUZnWStkME5FejdkMlFXREJ1MXB2?=
 =?utf-8?B?anJIbm9JSk9wMDRwcUppWmpCOEJmeVhwa3drTWpFdlQ5M3d0N3FnVE0xNldw?=
 =?utf-8?B?Tnd5Ly9keERMWUxNVUgzWjMzVXAzMEZSQUtkS0VlUDBGRHE5KzRoZjZyZlp6?=
 =?utf-8?B?WUdkbTloZXFZOW9jUVd1OTY4OVZxbmxYMFY1UStMbEhNczBmVDA2TlJ5L0Qy?=
 =?utf-8?B?UXhsRXo4V1dCUDlkQmxnSE5hQS9xL0tCbnZZazJWZDZ6ek1ReVFnY1dXbklH?=
 =?utf-8?B?Ujg1ZVpjbmpNS2hhcGlRMTU1S0R6ZU1EU0hYNVdGWHEwdjJMclFWQ2U0aHh1?=
 =?utf-8?B?UjBEZnpmVlMya2JiQlB0WEJYVFUrdjlxUjJBUXl3bk5XT3hxMEdrdVdEb1JY?=
 =?utf-8?B?QzhRWDhjelBZcUJOSnJ2NWI4WTFpbTdTVzc1eUxvNnZQcjFNSTVZaHNaMUti?=
 =?utf-8?B?YSs0MU5BNTh5K0NTY1BBSDZqbmR1WFJpcG9kM2R0VVRiNnlaVXJudTFHT0Jr?=
 =?utf-8?B?MEpkRllQa2IwRWVjR3JMalFEdlFPczR2akhnV3lCRzhZRnQ4R3RvQ0syYitv?=
 =?utf-8?B?SDc1ZUlCcGtYSmlpZnc2Y1NMTzUrU2U3TUpqWnhkeUozek1YblJmaVd5ZzhZ?=
 =?utf-8?B?RlZLRjZkYmFPWlp1anhycm1ZRVprQTBlL202dEovMHg3eG9HcVZvQUp0aGNO?=
 =?utf-8?B?RWlQMTUzOHo1WjBTTkVDQ05MWlUyaDlKYXJrRHdWRlk3L04zS3o4TTQra3R2?=
 =?utf-8?B?b2ZzWmdybDlHajllSHVuYWpDbDBNUHd1dDZKK0VJeGZuZWlKVE0rRWduVmZn?=
 =?utf-8?B?SVV0NnBHT1M3VnN4by9GdmVPRno1TElyVTQraTJzN1Y4cVc5YWJ5Q0s0WHU2?=
 =?utf-8?B?cEx6ZjNiRHVpMldIZWtjNnFTZ2xMY0ZwQzRkSVUrUFA4SjhrcEljS3ljeVky?=
 =?utf-8?B?OXZ0T0kvbFpYVkxXM3FaRkp6YWNpZnR1RW0vYTVid2syZVJFQjRFQVQ1b0RF?=
 =?utf-8?B?RS9sNk96bU1LVDBzNTl5NUpjNG8rb3RPODBSOUNVdUlFekJnU3VrNGZ6R01l?=
 =?utf-8?B?T0JmSDI2QkRoNEJVc25SRlp4NjdrNSt1L0k2YlNyWUprSzg2Y2V5SlZuWUtY?=
 =?utf-8?Q?PLbJ41PPhq/DlP0ZT+ljbj47G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c71114-816d-44b3-a4d0-08dbd96115f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:58:40.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsjSiCUYPPR200Oa6TGN2He07XtrGFwFQ4rK+DgY29dWW3I9VIEZ5QAcjjN0fjTVs9zZBswEku+TTHTmzf/aTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341

On 23.10.2023 09:23, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



