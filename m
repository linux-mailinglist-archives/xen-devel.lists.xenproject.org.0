Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E144CF29D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 08:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285661.484888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7qa-0000Ei-3e; Mon, 07 Mar 2022 07:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285661.484888; Mon, 07 Mar 2022 07:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7qa-0000CR-0S; Mon, 07 Mar 2022 07:32:00 +0000
Received: by outflank-mailman (input) for mailman id 285661;
 Mon, 07 Mar 2022 07:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR7qZ-0000CL-2K
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 07:31:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab65c19c-9de8-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 08:31:58 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-Ophk5rmnN4KNl7zVnJR-zQ-1; Mon, 07 Mar 2022 08:31:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 07:31:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:31:54 +0000
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
X-Inumbo-ID: ab65c19c-9de8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646638317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9MzOaZCQ4KsNhbKy2oDZ8s6PNB0BqvBTtfujc6kJ9nQ=;
	b=EzO/7xCh9Gkau+9Y3sVaLc+mVDO2X7T+nFPq8QQd1OSNQHOXbZp0GYk0zv9N1L2YJI150r
	Bm3BBpFksTtuA296linbu+G9KG0YGBG9+vnMhISRhUSmFYb68YfTcja8GtAakBelhqmZU0
	yyQ/Gc7LVMESAg0uoD0j8/ydqSuj0KM=
X-MC-Unique: Ophk5rmnN4KNl7zVnJR-zQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT35G+w8uJ9OnQ3QH5e5ocNjTqu0Xpftfdmgq7iIS2ZIVliKJ61fKaijYi+wk8LFC7RTZar2ijHLvW/BDVUwg9dv8nV7VEoWEWpMJeJn9fK76FB99VIJ95bLdxVIkve1jHRlj40Rw08JgFUQmSdV+NqDxghAu6F4WDLB/Qm0Lh7sPKl25b0SZ+UkVHXCY60ZxXKW9ywrBZFcDXG7Arn9RsJKfcExRdxrOqJeJ2R09Y3mLttFrJYS6+4r4yNO09CZ53VfCLWSoOwtujHQgQQw3sstW5BKb0XTR6oNATA4TgVh6JaoU3B0cVU538Uv5tG50reQimeeaVvoNryGTvypSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MzOaZCQ4KsNhbKy2oDZ8s6PNB0BqvBTtfujc6kJ9nQ=;
 b=eGKbGZdfSzwFcHw6AuT79FJRDf9Vao7Jt7WrOTTszyNS8IOXoZDgCTXCTsq2MQABpzGcVYYyhxnnGAfyRY8EeA6Mxj9y5k7R//32gOaoGj3v16Y+dqrLC9gBcty1sxPHn2t4nsbc6QH5Uhy/Io4/9lcF+OsWKeKHLJn5RDN8rxf4MOyZuM8e6P7Pw+1ZBx+EKAuXrsiTC1lgcGVrxgx6lm2smHj0AmgjK9jMLvdtXiTmFBU7uSbb6nzhi6jvXmVsC4OVk/wN7ntWXMx1ptcBbtoGr7ylkO8hUNNWM3Gqa650mzm+5mQFaIRBlv0jViMWUk6ToS1q2A1JlI0oOZ2juw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79adf785-622f-c897-cede-7f54b025ed55@suse.com>
Date: Mon, 7 Mar 2022 08:31:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 11/36] xen/include: define hypercall parameter for
 coloring
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-12-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-12-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0029.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8298d7d3-a544-4499-1d64-08da000c8de1
X-MS-TrafficTypeDiagnostic: PA4PR04MB7646:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB76469AE151EA55D9845D595DB3089@PA4PR04MB7646.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oF7vql6vger3MkJWg8rp4cHcdJtsbUx7dyuIeMcw3HYkZ3YGg8lq4n8LPaK4RLwJ2SVEzjkYEj/AGheJAF54lNBTWu9LAWP6qo6mKMCGST/vJlIUZK6cxD/yWlHbs20cxps5eZA+hcIEUfGg/qh9Ug/PIQvsE7Xa8AstiKabRMqEWOfNQ2Ca3RDV2cHouaUJKqQPWlx8tjqvcVfFIov3TwKHgCwkJy9pvw6MpxBKvIDB5LePDIc2QCiaF8Qw9EzBHHEwnbcI+pUYjmpcUECshEkM9gLn1G5EM8HOBp0CyfxZsraBpdPAEbV2IZBiVJ86aT5bGqFh3ykL4GmA2flCCCSKDrQSmckGB//PB+IvdrfmYRE3VfCijI7O01c8Fuc4F7cAdYZ9a6UAHb9pQZ/lPYFfbclX5fhKXjD/lAguRFa48x/g0BP/sl8qESG1UTwzl3fmJHC6IotGaSvvm9i5F1DU/6BfnL4WtFe3AwXnpjR3Uh/DbZs2WNsgTU6B7mPLiggqkR9lqlEjt5E2rnbR2hLCcAYoFfEznptjwj5BmSNZYBCKv3hwMGk1/cwVbD/nj+QtN+gnUlFMj0EasUffLhA7EbuLzUDxs468F1qv4VeSOi5KRD8aSHmN9j2KAVkqIkSU+GdYC+US4hCNYDFrb9HdAbw7IDjS+xeF3TQ/8yuDKaBMwVTFcDe38nM279q6LIS7NqWSrjvv4/PYzMWqh+HPExOQXX+XJOGuPFq1BTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(83380400001)(53546011)(36756003)(38100700002)(2906002)(186003)(2616005)(26005)(66556008)(66946007)(508600001)(8676002)(4326008)(86362001)(54906003)(31686004)(6916009)(316002)(66476007)(6486002)(8936002)(4744005)(31696002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm42V3M4WVlRekJzT3hYUGZ0VTJtRTI1S2ZTMWJLVG9zTnNHaEhKeFlhbWFi?=
 =?utf-8?B?a2dWdDZQdFNBK0dsNW1BQmwrMFNHMU5tYy9EY3FTeTVQelpkKzNyQW45d3Fs?=
 =?utf-8?B?azU1bFdEQkRIU2h4VTVkYW1sNTdnMVJqNktxaTdRZHlUN21RMWJqWXJrWnpQ?=
 =?utf-8?B?VWJyN2RnMUZoVFJRbUdqVDZSZm5BbEFLM0d1bC8ySzJMNllZdVpSSDR4Qm5Z?=
 =?utf-8?B?UnRiYlQvQ1lUWHlOa1doMDRTV2VkTHFIR0VxenhJSWN6bkFFaGhCdlU0K21S?=
 =?utf-8?B?NFZEV3dJaHZzcEROMzJkL0tGUmxyc1NuQzM3ZnQyajBtVVhmWE1NN25OUGNl?=
 =?utf-8?B?VXRXbG1QMHRWN1g5WjNTcVB4WkFLQU52V2I4TUxYUWJRRlhYV1VHeUo1RHds?=
 =?utf-8?B?SzZDMGhsMk1qM0xFV0pOUTBwMWpkajF1T3JLbUUwNjFyWHZUU3Y5ZkZLWkN1?=
 =?utf-8?B?OEZhVS82Rmx0enJCeFVHTUhOcUhHSENLanJPTjIxTFU1Ym44THNjb0hZTERX?=
 =?utf-8?B?MzhVWW1WT0xMb0MzU2xPU1pXZ1ozWGVUUlp4bWZBeVNQUWo3aU9USldvSUx5?=
 =?utf-8?B?RG9lNFZwWHpoMGpqTjMyckF4bDMvRW9LeEprL0JHU2d3YWhObDBOTklHSWxh?=
 =?utf-8?B?TU1FNnI4bjNVTHNweTI0Y2JSRnZQSmg5TFRGVFlQeVFocnpQVnFyZGM4T284?=
 =?utf-8?B?NmZ5UWxSV0RKcDNTckI4Y3BOVVNHc3F4UFB2TDEzOEk4WXhIdWovZVM5Y2Y3?=
 =?utf-8?B?bXFERmNmMEJ3d0p4b1lXMzNXMm5nOUNpSDhjTnU0VWxzL3FwSXNIamcvN3pM?=
 =?utf-8?B?ZFhRVnIzWjgvaUdST0hBcU1QQkpLaTVVVGFKMHVtRGZhOWhieWo1YVpjK2hZ?=
 =?utf-8?B?WXVMa25PN3RtSitNMzg1T2dnbEY0KzFidU9nSktQUXozRzBqZ1NQaThnSjBr?=
 =?utf-8?B?RFRXV1lEcGVBbmdlMUVaVkp3QUlBZHNHVllzK2JlaVhkTTQwVTFGYzRzckJM?=
 =?utf-8?B?MnpxemRhem1CWTdSbVJFcHFaK1ZQeit6WHo5RVdrSnZrVU5ldE4zYWhmSFA3?=
 =?utf-8?B?dVZGTVJzS1ZxWWl6OEpwMTdNL3oxeDkyeVBaZXFIbldMMWRsbTlLcFE0UlVP?=
 =?utf-8?B?b1FSbEZGY2Z2ZjNtdjFrQnZjazRHYjE5WDhqaG54dkJzQ2Q4K1JzM3Fxbkhp?=
 =?utf-8?B?TVd2MU81NFQxUnNKR2FwajdWQXdrOWE4c3p3a3VWWlhNYUNET1A4WmMxRmE5?=
 =?utf-8?B?U3Z2VTE1RVNTQkdPOTZUZ3VMbEpYdnB2T3R0YlVmdW1CUFFEblovZjBTdCtX?=
 =?utf-8?B?QWUwT0JUSzhwQ2QrM1ZjUXFyU0s5T2EwaXo5SGNza25VbXlIUURheHczd1FN?=
 =?utf-8?B?a0liZVhNUVFEZzRZY2RoQTJuTnhocjdoejRqV1lGYUZ4UHNscCsxRGQ4U0l6?=
 =?utf-8?B?MUs2VWhBS1NnWHV6Ky9iOE9uTVdyekN1NVMwMitRVTJrRWsvVGJkbHZMR2Rq?=
 =?utf-8?B?ZitLYnlzZ1Vqdk9DOGFYQW1DR3lzSllJV2VpZnJkeGdEdmtXWVRjd0RIME9U?=
 =?utf-8?B?YjJyOCtOQ3FGUE9Zb2ZKSHA4Q09SaUVVZXlDQlJaWitoOTZ3OUxDSitHVmdj?=
 =?utf-8?B?WWU3elZ3c2N0TE8rTUNEaGxyYUtDRkVNZmQrdis1d2xvd1pZWjBaeUh0dWRT?=
 =?utf-8?B?SHgzTWVNNS90TEZFN0J6Zm95bFRtK09mSFNsaTRsa1I5Z016N2R3dWZPdnZY?=
 =?utf-8?B?M2JxTlRIWDc4TVh5QWQyWEJzQXZUa1g1c2pTSFlhZ3BEczJNVmZ6aE9MTTlz?=
 =?utf-8?B?Q0I0bnNtSmk5Y2FzbEJvbzNtcnBEa1NSMjRlL1lzOWZvTTB1eCtVT3hCSU1B?=
 =?utf-8?B?MHBCL1QxWElaWVVRLzdWeG9sMS84Nzd4VmVsQ2xDeldUVm9QY2hMMDhMdnov?=
 =?utf-8?B?cUxIVThQL0g5enlZMSsyanptQ0hlajVnRWIvWVJxbjhuUmdFNlJkT1Vhckdk?=
 =?utf-8?B?cE9DQnVOYU40Wm1XZDQyWUtQMkM1eUVoZGwxZ3psT1I0TGN2aU5PNG9xb0RL?=
 =?utf-8?B?dVJyNjZJRUhiQmJLZVZSZy9XeWdnY3M2NTllQ2pKMVVhcEVFOWxxcWRkYnFa?=
 =?utf-8?B?eGpKSXlvZ2xvTVJ1bTBrL0UzZnNHWkg5UWlVZG5JVU9URGx3dHhyUWVuSXVV?=
 =?utf-8?Q?OzAp7E5UkALFq6SPc0zTOc4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8298d7d3-a544-4499-1d64-08da000c8de1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:31:54.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTaKUtUr3baVsPSHqStQ44+HfJj6WETpbDOjEZAh6Oeg4F5DqvbmhndzBV4pz+fIO+loxGbt+Wr6FKlXbXs25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

On 04.03.2022 18:46, Marco Solieri wrote:
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -303,6 +303,12 @@ struct vcpu_guest_context {
>  typedef struct vcpu_guest_context vcpu_guest_context_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  
> +#define MAX_COLORS_CELLS 4
> +struct color_guest_config {
> +    uint32_t max_colors;
> +    uint32_t colors[MAX_COLORS_CELLS];
> +};
> +
>  /*
>   * struct xen_arch_domainconfig's ABI is covered by
>   * XEN_DOMCTL_INTERFACE_VERSION.
> @@ -335,6 +341,8 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /* IN */
> +    struct color_guest_config colors;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  

Please no new additions to the public interface without proper XEN_ / xen_
name prefixes on anything going in some global name space. (Personally I
also wonder whether a separate struct is warranted, but I'm not a
maintainer here, so I've got little say.)

Jan


