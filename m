Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60514F2910
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298596.508694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeWo-0000Aw-VA; Tue, 05 Apr 2022 08:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298596.508694; Tue, 05 Apr 2022 08:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeWo-00007r-Rp; Tue, 05 Apr 2022 08:27:06 +0000
Received: by outflank-mailman (input) for mailman id 298596;
 Tue, 05 Apr 2022 08:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbeWm-00007l-VG
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:27:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b1e1c7-b4ba-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 10:26:58 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-Q45Oclf1MmmJKJGjzggvIw-1; Tue, 05 Apr 2022 10:27:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB2996.eurprd04.prod.outlook.com (2603:10a6:206:6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 08:26:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 08:26:59 +0000
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
X-Inumbo-ID: 28b1e1c7-b4ba-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649147223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d27+30hA0jLtQPGYSSic12DifZW7BygFpuU8vKCLWx4=;
	b=HeBIfxetO8vHZ6kWiPIMXU5DoM7AaijzUhXnv9STi4gbq25GJnAP2zvnPyEjXFVSN/Wur0
	AEqf4aau6ZAQ98H2SaO8x7iC+TnBnivDT0PmuvmGyCg9Qqxlx2TJJ/3wYdf9oUlFM4Q96d
	l4VIIcDLs7asMTUIJvv4EnzkdOP0peo=
X-MC-Unique: Q45Oclf1MmmJKJGjzggvIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgDz6tu2L9QoeUPltQN/4QwM9XURQxjVhYV9gt3C903Sd3RvYAxhALhj7yE8JQU7XigVx3oFeWBQsp4u4Oz9U9KiP6qn4WKLCQzgVJgrSxh8z7GiXKwcshbsJbvo40/QEvnV/Wsxn+3PrJYoRTE+m1qoDXh7URZ7TTu4Y9JOCFcDVl4KxWcHNntghYK92IaGD3KWqeJhYItOlX2a4XCYAvevaixx35B59yb/Vbi69aROq5QETO3qpxagzDMuVggucOW/wMbshOJ4YXFwPFW03H/0QK48/53LV8nxy4GySIerO+xfMz5RBk5uusia3ENiW8pDi8jkmmegyp7p6ttuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d27+30hA0jLtQPGYSSic12DifZW7BygFpuU8vKCLWx4=;
 b=ePdQ1WyUzIvzBM8JcGi7wE+mK/VWBu4jG6T5iOifNohNrZnTOTqUStCeAwkpxzD2YJoV9FDkOsI9CD20ZmESd+l+2rvvnPGGGi1LW/Icq2sUiKoxD89+v/tPeh3ZwkzxtJpSI+jTIS9mj0ET2ygy0GeZOdPpalZRQEzDbzN4aFsdJCCzP1E476ChZM52iDmNELqUhOHL8PFbzTLQNpcj0ZNYBS3xPnvZhL+fsEPQMw7A1OaTnkA9anzsBZ8oXO2X1krj5KgSjX5xIpAUcWJhT+TfeDF1KlXWl7LL/9Qsj7pztl1k4z+HI37g8XKc5xfc3mDt5U/1lOlF+SKg+TyrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1c3923a-9201-c200-1b1e-9a258d47e64a@suse.com>
Date: Tue, 5 Apr 2022 10:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] arch: ensure idle domain is not left privileged
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220330230549.26074-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da1c355a-6172-435a-8160-08da16de0d5b
X-MS-TrafficTypeDiagnostic: AM5PR04MB2996:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB29963DA10700B9E642F34256B3E49@AM5PR04MB2996.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t28wN8jReFfC/lblkNNhqLz42+e2gw8i3eWqj14RcRPL6oGu9L5t+e7LIERY1pbAziMtSzamPssq/4XchVfq43GhuH7jHEsm/fEN+pkUDdJLxgARD0GZSeHHCKz/8rbWcF4nszAXnEhNSIPnBWig4Biq2t1V2woFWkKNGUab2RAPSiirVq24zvbTCO5/ZNTanAdNot4tfHyyFTQuw1Vnpid2695CFTKFjX9BQWR1JwB6SuEqeSqbjhZ09cGab3trdLU6hZC0/xoq8HrPH2Z71VNL+rMxHPJGCjG64NOPytbiak+d/am0eF99pv40NfI/nzdM2xHwpkmBQmlUbmFwuXsWWVbQ4MVTTZ+ahuouWOVhITd60Duxb+2P7wDWix+vwlPTgVD1bQUqpFFF2s0l7kZgz0c1xykyCbuI8LvpK6lJMyGdd5zpAFzNaVJlKvMlWqKJ7hJVy86t5zAT407O2dzpNEhmDyQLxcBFCW0J04WdtTXcR0oKqU0xXZQLfzVdlr5WwJYp7k9xlBdOW/gL4Smh7xmtAVT/FJJXEiN7N+DqSF3ntGpj7g4kO/u5sE2EiNw9tjkMJtSCNORcX56vjU+DT+nPO73nob9co4c7RPoWc4f82PtNHe7MtZvMhQBE5wNSWQBiToofIz6XVxU3oCmMeSG401hyePAOWqjSHcl6K9lOxK+Q14vcwUtUX2wUJoPzf6/910iPoHj6IjnxGFzCLjDilqolSPpmPHuMEdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(36756003)(8936002)(31686004)(508600001)(7416002)(6506007)(2616005)(53546011)(186003)(6512007)(26005)(66556008)(8676002)(4744005)(38100700002)(6486002)(5660300002)(31696002)(4326008)(2906002)(66476007)(6916009)(66946007)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJ0S3lLczI1N1BQbVQrK0RsM0xLYkNEQmlPMHVHMVE0anZZZlVkYkxNcndG?=
 =?utf-8?B?NFNhSW1pYlNDNlkybnVnaDM0UXpBWlNUSWpLVG9WcjFxZUJaVmxnZzJXaU5C?=
 =?utf-8?B?dkc0ZDhJL0VySS9PeU9FN1dBRVl4a1NUM0dLMFlkQ1pWVCtjaHpiYlROWUVw?=
 =?utf-8?B?YUpSVk1TYnVWeEFIRGdVVUhDRnVxOHpQcDV4eXZ3Q0t6dWFSeERycDRjRHBh?=
 =?utf-8?B?UmxadHZQU0tHeEpZNy9oVlV1SmpkSEdRcktnOUc2TlpKZmhXOWI5enUwK09a?=
 =?utf-8?B?TzhrUGhkaEhZckNiVVhkeVpETGp3RWtxSnRYSUlPSmZtcTlKc1k4WFpvVjlm?=
 =?utf-8?B?V2tBRGc2MVJ5K0xNNDNXUnA5RGdSSjh6bElOMWtvbzhvM0E4dHRGL2ZHd1VH?=
 =?utf-8?B?NEoveUprL2oxOWd2S0IvMjJlTCtQbUY3T2hrZHczYTIwdHpNQ0lTdjV6a2Y2?=
 =?utf-8?B?bU1nUGg3UHpBZFFia2p6clFHaUNIU051WFVRdXpqZTlBMng1YlNXVFJWa0tW?=
 =?utf-8?B?S0pLQ28yK1dPM3prYlNkY2lJT0IxbGdTOXZyZVNLU2IwWlBtL09zZlpYanFR?=
 =?utf-8?B?MDZRUXBFd1NsTTU5Tlc3RzRQWWJvNy91dDVmYXg3TDROVTZ0TlVMZlJ2UXRp?=
 =?utf-8?B?V2tpV0FhQXltRjdwSFVubTBMTmVFRVpncWo4a1VhVzBxWHJJc2ErdHJCbldO?=
 =?utf-8?B?NjJjMDRNaWRmRTh0MWtXb0ZnWWJwa3FCUWRmTE44TjlxWXkzSURnUzB2eHd6?=
 =?utf-8?B?bEFnOW1wclJzeUJzdHpleWZUckxMNGovRzJta21CRTViOEFKL0pRSWxvOEpy?=
 =?utf-8?B?ZjBaR0pVblZKKzVpUHAzbVA2Rm82SFh5ZG0wYTJYcWNVOUpobDNEYktYYWlw?=
 =?utf-8?B?MC9tbHlaN01McDAya1VYTEZTYXl4cll6NkdwM1JOMFVsTzFobGpjL1orVjNM?=
 =?utf-8?B?MjFhY0c5OW8wa2FKSlhQaDBFZTlYaURVOS91a3NpQkx2TlhoUzQwamh4Zitw?=
 =?utf-8?B?cXh6MHNIYkxOYTdPY0NLYUI3Unc3a0FXckRmcjF1ZkZzbjJ6MDB4eEpmY21a?=
 =?utf-8?B?d3NPelhhdlRIa3U1aURZdEppeDhHZVByYktrT2JBaVBZNTVZMFV4OFkwRkd5?=
 =?utf-8?B?UmxWLzJrZStBb2xqdmtYRmhqcXpHY2tSaTJrTk91OVI2TlRwNjMwK1JnWkJ3?=
 =?utf-8?B?d3RVOE12RjFqMTlaQkQ5bEljU3JrS0lsN3lZT2h0eE1HWnl3TFExWCsxTUUw?=
 =?utf-8?B?UzJTc2dEbUxoYS9zb29vVmM1Nk5xS1RjbU9pRFhYSEthR2FiTmljMHduTWt3?=
 =?utf-8?B?bFZqd05taElML1NyK2hQbWdnUTZ6Sm12YUhtSlMxbm1zNFZEaS9kR1FoRS9H?=
 =?utf-8?B?MVdZbEUrRWczVEFZeVMyY2RTcFdMRmtDS0F5YW1QUSsxZnk5d1g3NHF5YmZD?=
 =?utf-8?B?V2NXL1RyOFdlZjNBWHpLcFdkU1NCWG9OMUVXcDVWV2ZCZGFhY1YrdTJ2UXgy?=
 =?utf-8?B?NWdQM2xLMG5HYVBKWTZNby9SZlg1OWRwSWF6Y245enROYitJb29OQ3Mwd2RV?=
 =?utf-8?B?ODBVaklUd3NKZ08wS29OcHFScFBUZDllMUg4amhmdzljVW9qOFhHRGhqTEkr?=
 =?utf-8?B?WlVZYW83TjRESFpSb1o2RUEybmdmUk1oY29STnYzRDlmdWI2UlJtMWFwWERE?=
 =?utf-8?B?UldQTE02WXl0SktIQ3k3V2srOTBGcVVmK2tqaEJ5VTQ0andjMWtRYmFwMmF1?=
 =?utf-8?B?YW5TVGpVOG5aL25LL3ZvblBNRmIrOGo4ZVJwR2pkL2ZsR21DMVZ5SW4xazRO?=
 =?utf-8?B?K0p4eHFrRDVDME16R3RvbnNGNUFTbFJXRzBud3JZZVhacWE0ajZ5QnJxNWJt?=
 =?utf-8?B?OXRMd2k5Z3NNdmhyeEhxUEtTSTl2TWNCbEhWY3BpbGphMmFScm5QWlpIZnJQ?=
 =?utf-8?B?TmNWZFA1REhpQVM1RXVtcVdMQ3VMYzB5dGEyUE93Z1V2Z0tYUmZHVEgrejFw?=
 =?utf-8?B?Mnk1V2I5OEtqa21ZOXBNVXFwL292V09FNmFSeUkvaWkyYkRGaDcrcHRZRjJT?=
 =?utf-8?B?eUpWYll3ZHVGQXFjNXd4NE0zd1dXYkRIOGZDTkxHTUlMNXIzUTd5VUY2RU53?=
 =?utf-8?B?TllPN0RVR2xJRFRpSW5UTkxMRGI2YjB6anZKZ3FJQ1hPZkpBQVFlSW5yQkpP?=
 =?utf-8?B?andhajFadlBpNE9rK29hckgxeXl5TkM0b3JndFFBYUtWYS9yb1QweXZSVStI?=
 =?utf-8?B?RDRKdGltUXhOQmdEdzhNaVBRUWxhWDJnVktONWJXZjJEVjBFa0lmZVpvT2ZI?=
 =?utf-8?B?NnVZMjZBbXJ3MFlVc3d2cmpYMmV5WHY2U2pZM3pwMjlzU21ZWGJXdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1c355a-6172-435a-8160-08da16de0d5b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 08:26:59.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz8K+uMA4q+v68RVNqdCA1J0cWCPIp6uoCu6zMP1Ib3ynUfKAdRRYV1aghYzN+vhFsnm5b5zKEmPLtTWJRAj9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2996

On 31.03.2022 01:05, Daniel P. Smith wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -589,6 +589,9 @@ static void noinline init_done(void)
>      void *va;
>      unsigned long start, end;
>  
> +    /* Ensure idle domain was not left privileged */
> +    ASSERT(current->domain->is_privileged == false) ;

I think this should be stronger than ASSERT(); I'd recommend calling
panic(). Also please don't compare against "true" or "false" - use
ordinary boolean operations instead (here it would be
"!current->domain->is_privileged").

Jan


