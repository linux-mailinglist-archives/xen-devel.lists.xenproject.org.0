Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47856ECC98
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 15:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525360.816508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqvth-00030J-Rf; Mon, 24 Apr 2023 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525360.816508; Mon, 24 Apr 2023 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqvth-0002y2-OP; Mon, 24 Apr 2023 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 525360;
 Mon, 24 Apr 2023 13:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqvtg-0002xw-ON
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 13:06:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee8220e-e2a0-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 15:06:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 13:06:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 13:06:19 +0000
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
X-Inumbo-ID: cee8220e-e2a0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej+TeqkWiR+wSbk7KuX/ayQKhD9MVi+MzY9564NwC3z/74nPUj0mfYP+cHPzl3ykzdxNQPSuDcVH7wE3T90wUvUhyae0azGV45SJCES2W0sJgz8RBKEU7ibw3Mipg7NAFsJEoTifHHpLNxj042Tx87g+zNbhoOfNWlEsGvn6sFIyDKJmdjkJzQ9iHXFAQXAheDsIA8/ORkm/PVQG1e/IfDR3rtwbMWmKHcGS93Mt8K51xelm6t62M6tEkcHKjk+VJbywc/5ShWU2NOzA7MPg2n2QgkmNA7CPSqNStF6Ov+jklMxwOiMDUh4efD0VJtlP36Q7fi6ZZ/fIC7MxRPkr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yupQeBK2A76Rgix1ZCPhY0pBSR/YgSQd2xOTQtLMNL8=;
 b=Fp+8l7j/hpjk+XPRPqDMRxtWq6XBWuyNOT/QjSUR1s9it9LLZcmQXv6uG5v45gmOrtzjhrMhn97v2d3j/kJeNGdA9lSc9bnwOQfjJ+l2iiZWWJhaojgKyaU3vLCKnKBCcM5bvu3dNTYiXjmx3Xacee33GfEu49V3L7m2useDmMsWr6dE3WM3cX/sUUY0sJzGWa8jw5U1YXc3TfbvFqfRIFxnf7Q79Q5OI+GooMnv4F4EtTsacTbaHn+NMfC3Y3M5aZAXVKNmyKKYNOkq3aYigOeLNnmzOIlg/yqNWQVsXKD+0asbW0eZCvUOXxw/PFJsi2i7Gpswa7QyAWM/HIOO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yupQeBK2A76Rgix1ZCPhY0pBSR/YgSQd2xOTQtLMNL8=;
 b=FaC6GINrUCd9ytbGo7dxBbOGX8Hs6HT/OINDXsp6LgqqvZtblFToWiEuegkzPIRw7be+pbuXAiG+gaGKkeGdQGHcCgfVK7lgR/ILAmpBGqmBm19uMt7mDnygU3mgZDvMuPQ+XzNpeVKEP1LVKM9ZiWffxlNyKE03wXrYU/oG7bsdkpiyz5RsrGsOeMjB9nCqKEKpBbkb2Nh06EhgG6W1xYH3WsDgPzth+N+3tBRbCFXUZ30CHx0aN+CV70RV8HWPlD8MdMvJFm9QKmw1iTPTk940XYcHc8zIkHK2DLyXlVBOKej+kgtMMUd4v+YAMcnjPx9ac14DMNzTlsxcRr1LCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6d866e9-c313-a0db-f12d-acf285e78c94@suse.com>
Date: Mon, 24 Apr 2023 15:06:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/4] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <f799fdc6b6899fa65a07eae0d6401753f7d61ef2.1680752649.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f799fdc6b6899fa65a07eae0d6401753f7d61ef2.1680752649.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f45e8b4-0606-4b23-753c-08db44c4b192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jVlOjyQoMR+rVja61kCiQOQgMl8LAbnr64qFh+BmMs6nXWRWyHoIGEbJO2pxEbgtVtsluYsShKHubC3Jn7fsX8FBlAf2J2gRtfT22Ir8yCUR91q27x4WCb+94ngAuvuno/thH+U21uvsz6iLbxWSjGHPpfbiVvv9DXNy/gZRurL4C5PKo2Bz5IXkNasm4pdwScaifvavm8diHlLFnhKnS32hzUpanxQhIASAOsSQ9yY8QmtJlbsQRUQXtTw0ozvMowmQ94Bv9x6akDPuqcoiEJZTxpLMJktkPsS+Ruu26xiR/yUOEVJ7XJ7uxdVGBg/0t2F1EZqX9a5RYry81zKHMw5Y1K2GVVUOe6tR64eJDkgFCzHu1KZiQO+IUYs0aalBXOMPaJA29azAFY9EikJfxzlc01uVEYnUFEcnD2cJqEBNhq5wiLldqkzixzRhydWiDDxIPbvK5GtVAcjEB/tI8yGCCDfaOTSMf4pc6OchRNVUYpF9NWg8YFBRBsc62eqkfxpg63DkfGI4NlPHyNaZ2FV78zqgaYWoOOBF8RpW8t10X4j0Jb4PUq8cpoJ1TxdOQ2/0DGfLWUl1EwtR/4rajpLQ5JTSPNMO2KyUrJgNhjFbBD2nC352a9/CLYw/f31BcenitG8WFh4dJTp9TiU3oA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(6486002)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(54906003)(38100700002)(36756003)(86362001)(31696002)(66574015)(83380400001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N21kNURXNVFjb3NyT2g3VFlFM3V0TW5tdWJtRHhrY0ZlNnR2amxuOU96bGMy?=
 =?utf-8?B?N0NZdWNJTlZUaUdPallYbnBGbys3Nlp5WjFkTHNEQ1QwNEl5VjBnRTFteUF1?=
 =?utf-8?B?Mmd6dmhmL0J6UVdwUjArZEtzbFI4czFVdDBVWTdXdDZhVVAyMnlMZHJBajBD?=
 =?utf-8?B?UEJqSWErZ3VOZnNvcW45NlkvL05oVVlrTVorMXVxZXN3QjNMTFY0ZFFBZkJl?=
 =?utf-8?B?Q0owcnRjZGZYMnN6c1UxbmpBT1Q4NnlqNTJYaVo3OUxvdUR3c3E2bTdHODlr?=
 =?utf-8?B?ZnI2TDZJQWdSZ1c1dnFzdU11b2g2THVFMFo2WGIyVzFINTk5cmlKN0duN3lZ?=
 =?utf-8?B?QU4zMzVsMUZnQXhLTXIvSCtabVB3WWV0ekpxZitmb2FVMWFsQmsvdGhtTVNV?=
 =?utf-8?B?OTVtS21XQU5oV25uRkxxS3R4ckljajBwL284SGJwcTJidjExQnlDY0c0Zk8x?=
 =?utf-8?B?bHpRWmRNeGJCWUJGd0RTbEVPOCtjdkN0TXh6aDBWSHJGMElTK3B4b0ttU081?=
 =?utf-8?B?OG1jRzRuMGU4T3lMKzR0VzVvV0RqaXhGZXdVbnNJSlBaMjBqVlhtYnR0cWd5?=
 =?utf-8?B?MW5CYkp5ZzlKM0xMdmJFYktzdnFDS00xeFkvZTZKYXB0T0hLdDdCemF6R2xM?=
 =?utf-8?B?WDhLY0VUOUgwQ1Zyd3pkcFZnK0JxM3dySUxGdzZ5V0tDWjZNcXdOT09MNFlS?=
 =?utf-8?B?aVg0NUNCT0hDZVNnaHhBRURZOG1jeWJhMHFyYUpXbC9haUVQWWFjeXM5eXIz?=
 =?utf-8?B?cTY3SzRQeHRmdThrU29qOWNmRFFqMmVaeDlkZWVyTWhLQ1A2bUlGYmZKRDFl?=
 =?utf-8?B?QTBTT2FCRDAxZG9nYWk0OXFLU0dvdUp3dGF1OHdDa2xRY0Z0WTl1djhNVGVV?=
 =?utf-8?B?VzQwZlZjT285d0ROazg3TFNrNU5xbDZpRGdKNXRiekR6dlhGZEdOSTRJdkd5?=
 =?utf-8?B?V1I1RFdMWkE0RGhjRGpmWlNsTkJscEZ6YjBJNW1nd3l4VVB4VjY2S1VDUjlZ?=
 =?utf-8?B?elVOWFdaMDJ4eGVIZ2J4eHk0NG9JbTNUektndW1FZ3UxbTV3WkVmbGlzUVps?=
 =?utf-8?B?Y0ZTUzlKbkZPSHRLZDU0aThXZExYbWZ4UUFrR2U3anNhVG94b1FyR05xNFNL?=
 =?utf-8?B?UVFlYkFrUVVhaUEzWkJxcjZ1WENMOHQ5MGkwK09rT3QrdTR6RGdzbGIrdDJv?=
 =?utf-8?B?Z2hWNmV4VGNCdEhrSXRPRTVkVGdRd3ZMQktKa0dJZ1QyMXl3cUNYMVVLc2RD?=
 =?utf-8?B?R2trQ2o0UWt5TXhacFJrYVNYcm1jWHVZY0p4alZTWVdROGVjSUpmdzVuOG5P?=
 =?utf-8?B?bUNRZHY4ZnVnZXRIQ0J6dHlqT0dZVGRqSFdDSjE0RXA5dFUyRWtsZ2M3eVZh?=
 =?utf-8?B?WHA5ZkdqRG1PNUpDeEdsT3BZcERVYkVIcGxSa0k0NGJVYUxiejdUTlRQSEh3?=
 =?utf-8?B?WWlnYUgyUExyMTB0SnJJYmR2SSttamhqZjkreTlFTFZPZ1E0RllXcE10a3JY?=
 =?utf-8?B?UzB1ZjFIOWE3TmczMDJoMlRpeU50NFRpTUhqS2RVWmlWMjluZVVwOXJnaWE1?=
 =?utf-8?B?emxiajZzSU5HbHExR0lZZFA5aVJySmVRUmFBcGlRUStuejdiSTlNNlFJRkcv?=
 =?utf-8?B?Zk9xVUlFU1JTTTRhTVRxZ3QrU2duWWFwZmRKUHRnbGtPSmdYOUp1M0lRYWls?=
 =?utf-8?B?eUI1UmFqaU1iOGdxdHV2clpiL05vTW8rT3NOVXpFQ3NCR1RpVTZwRVlyNlFj?=
 =?utf-8?B?YUs3NmFmYm9WREU1enpJWUNXWWV5YU1kcll3dFRLMURtUjdrc0FGbTQ5bUFv?=
 =?utf-8?B?SzR1VXd0UlBpK1hPS1NWN3BvUWx2dWtiT08ybUdkUzhQcGJvamRQOGViZTZi?=
 =?utf-8?B?YVhNakQzUmw5c21Pd3BBNGZWVHN2ZGV5NUFRejdCcTh2UWJQWFZTa1RDZDVU?=
 =?utf-8?B?cHZ2RGVoeCszcGRTdDBHWnhhTzEyMW02OHdDRkVFTUpGQU41YVU2bUE5bkYy?=
 =?utf-8?B?bG8zSmJFR3c5ZWFzZllLWUZzUUtPSXppd3RMM3p4Z3dNeFF2VXZKa0ZNQnhO?=
 =?utf-8?B?akxOdmZTUEF1UW1vWStnaXA1V1hncUZDQXJFUUZBaUpiQXRFb215ZnYxbjhk?=
 =?utf-8?Q?6tacAiOEbrqTNDvCuu+SoNATE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f45e8b4-0606-4b23-753c-08db44c4b192
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 13:06:18.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AudaRhCcYtLje9x24knwY7vMYh/Ylzb2NAIYpCHn8DX0b5Psc/TbcCVNm/6ffO1tjk99WRyceMlIWn7bFzU0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

On 06.04.2023 05:57, Marek Marczykowski-Górecki wrote:
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -272,6 +272,15 @@ out:
>      return r;
>  }
>  
> +/*
> + * This function returns X86EMUL_UNHANDLEABLE even if write is properly
> + * handled, to propagate it to the device model (so it can keep its internal
> + * state in sync).
> + * len==0 means really len==4, but as a write completion that will return
> + * X86EMUL_OKAY on successful processing. Use WRITE_LEN4_COMPLETION to make it
> + * less confusing.
> + */
> +#define WRITE_LEN4_COMPLETION 0
>  static int msixtbl_write(struct vcpu *v, unsigned long address,
>                           unsigned int len, unsigned long val)
>  {
> @@ -283,8 +292,9 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>      unsigned long flags;
>      struct irq_desc *desc;
>  
> -    if ( (len != 4 && len != 8) || (address & (len - 1)) )
> -        return r;
> +    if ( (len != 4 && len != 8 && len != WRITE_LEN4_COMPLETION) ||
> +         (len && (address & (len - 1))) )
> +        return X86EMUL_UNHANDLEABLE;
>  
>      rcu_read_lock(&msixtbl_rcu_lock);
>  
> @@ -345,7 +355,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>  
>  unlock:
>      spin_unlock_irqrestore(&desc->lock, flags);
> -    if ( len == 4 )
> +    if ( len == WRITE_LEN4_COMPLETION )
>          r = X86EMUL_OKAY;
>  
>  out:
> @@ -635,7 +645,7 @@ void msix_write_completion(struct vcpu *v)
>          return;
>  
>      v->arch.hvm.hvm_io.msix_unmask_address = 0;
> -    if ( msixtbl_write(v, ctrl_address, 4, 0) != X86EMUL_OKAY )
> +    if ( msixtbl_write(v, ctrl_address, WRITE_LEN4_COMPLETION, 0) != X86EMUL_OKAY )
>          gdprintk(XENLOG_WARNING, "MSI-X write completion failure\n");
>  }
>  

This part is okay with me, but ...

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -743,7 +743,8 @@ static int ioreq_server_destroy(struct domain *d, ioservid_t id)
>  static int ioreq_server_get_info(struct domain *d, ioservid_t id,
>                                   unsigned long *ioreq_gfn,
>                                   unsigned long *bufioreq_gfn,
> -                                 evtchn_port_t *bufioreq_port)
> +                                 evtchn_port_t *bufioreq_port,
> +                                 uint16_t *flags)
>  {
>      struct ioreq_server *s;
>      int rc;
> @@ -779,6 +780,9 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
>              *bufioreq_port = s->bufioreq_evtchn;
>      }
>  
> +    /* Advertise supported features/behaviors. */
> +    *flags = XEN_DMOP_all_msix_writes;
> +
>      rc = 0;
>  
>   out:
> @@ -1374,7 +1378,8 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
>                                     NULL : (unsigned long *)&data->ioreq_gfn,
>                                     (data->flags & XEN_DMOP_no_gfns) ?
>                                     NULL : (unsigned long *)&data->bufioreq_gfn,
> -                                   &data->bufioreq_port);
> +                                   &data->bufioreq_port, &data->flags);
> +
>          break;
>      }
>  
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index acdf91693d0b..490b151c5dd7 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -70,7 +70,9 @@ typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
>   * not contain XEN_DMOP_no_gfns then these pages will be made available and
>   * the frame numbers passed back in gfns <ioreq_gfn> and <bufioreq_gfn>
>   * respectively. (If the IOREQ Server is not handling buffered emulation
> - * only <ioreq_gfn> will be valid).
> + * only <ioreq_gfn> will be valid). When Xen returns XEN_DMOP_all_msix_writes
> + * flag set, it will notify the IOREQ server about all writes to MSI-X table
> + * (if it's handled by this IOREQ server), not only those clearing a mask bit.
>   *
>   * NOTE: To access the synchronous ioreq structures and buffered ioreq
>   *       ring, it is preferable to use the XENMEM_acquire_resource memory
> @@ -81,11 +83,13 @@ typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
>  struct xen_dm_op_get_ioreq_server_info {
>      /* IN - server id */
>      ioservid_t id;
> -    /* IN - flags */
> +    /* IN/OUT - flags */
>      uint16_t flags;
>  
> -#define _XEN_DMOP_no_gfns 0
> -#define XEN_DMOP_no_gfns (1u << _XEN_DMOP_no_gfns)
> +#define _XEN_DMOP_no_gfns         0  /* IN */
> +#define _XEN_DMOP_all_msix_writes 1  /* OUT */
> +#define XEN_DMOP_no_gfns         (1u << _XEN_DMOP_no_gfns)
> +#define XEN_DMOP_all_msix_writes (1u << _XEN_DMOP_all_msix_writes)
>  
>      /* OUT - buffered ioreq port */
>      evtchn_port_t bufioreq_port;

... this isn't: What is obtained through this hypercall is information
pertaining to a particular ioreq server. I don't think Xen behavior
should be reported there. To me this information much rather fits in
what public/features.h has / offers. And XENVER_get_features isn't
constrained in any way, so any dm ought to be able to retrieve the
information that way.

Jan

