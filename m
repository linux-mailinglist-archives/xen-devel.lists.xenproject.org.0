Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2A4F299E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 11:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298677.508901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfpM-0001h9-Hh; Tue, 05 Apr 2022 09:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298677.508901; Tue, 05 Apr 2022 09:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfpM-0001ed-EM; Tue, 05 Apr 2022 09:50:20 +0000
Received: by outflank-mailman (input) for mailman id 298677;
 Tue, 05 Apr 2022 09:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbfpK-0001eX-Sf
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 09:50:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8515061-b4c5-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 11:50:10 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-vjBCIHNKM5K53e3DRSubcQ-1; Tue, 05 Apr 2022 11:50:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB6950.eurprd04.prod.outlook.com (2603:10a6:20b:105::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 09:50:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 09:50:09 +0000
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
X-Inumbo-ID: c8515061-b4c5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649152215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qp2ByoPAY/8DAZJpeNEOCm7civFrFP5567MBR9L+nA=;
	b=gzQBOjUMCb0mqRH3PxiEiJCyXvDHLsbRZ058fPrQ4OMNYfGhMLGXoXtraqS5FQumrpfZ6O
	l86oOKSi/DWb4NXYlwcxGHp5miIGyT6F3iY5se65nzfZJV2oiPkhpj4Xvq/BWUjexPMoyO
	jUoXJfmf/OKbBF1w3JtK3OohOhnjW18=
X-MC-Unique: vjBCIHNKM5K53e3DRSubcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJXHzDVCtQkWETSRyqVo6fskQV7PL9XSM7etYWxkYAu3jd/jlfP2d1nvwvSpJKhRuAYeh4sor3led8OuT2bPJw+mt47mGmNwt3ziIuS1cDEJBlKKNrPL692yog3vKW1fOPBheitbnyJemtElKxnVVWOGU65xl/hI6G2T858G5xRUwzLXYlgItYw+AvAhC4vyCNESwv4otmJIcKX3Xh7fiVoMKjt83wJYB6d9PcwKzOovWxd1SLJpFI8cU9Y9Ua788sids6mP6/kw2TZAJk3npPadKSgW5jNnaBX7hDGBkkaCt0lg6iALIF5i4iwqhv+PiR9of/ITdQvRibR4v1NKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qp2ByoPAY/8DAZJpeNEOCm7civFrFP5567MBR9L+nA=;
 b=e4a4vKMyS0YR0mTq36OUGYA2pPJwOb9LdstworxbSt3PF6J7pJ5n/w/PzPq+9hB7ss9WI6cbY4GkXinzP5ZO5Z4PT7FVSVdqH1vjhgXX48Du5d6tLKSyhwYkTXV1FPtRnulkN5GfRa6u5Ao34Ury8FB74RxWNxrtFRxTWRzjuSYV822Vc7Cbi92eJs2fdt+1QwynM0T5wBBLLRxBmZzzj0InlDDHsqSeOgzFRZ/YSoN8yLp7aitIX+nwk3HjnJLB0F2W1n/G8lIf5sJ4eNkGC+215qqBDDUy6GKiZEznfLT4ZElW3Aa2v6q056abmkVrh+puqZaiJqj/Ua/zv6Moog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9e2ab93-f2df-9261-43fb-12784c13c821@suse.com>
Date: Tue, 5 Apr 2022 11:50:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/9] xen: export evtchn_alloc_unbound
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-4-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220401003847.38393-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb6189d6-adf6-4bef-2a6c-08da16e9ac0a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6950:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6950DFFC2795022225C3829EB3E49@AM7PR04MB6950.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mxz7Ct3XL/jNXWVuEsUXBJSCbUd971A5bmI3KuX826JtaC/gRnE84IDSSAdFodXijV8Q21wFiQCC/XNha2wj5PzSH115+O7m8e1LV0Gv1pQMsbhqw9qdyvbvAv1h2RXe+IEfYmKz1J9OudfyG41ERy9Q2D+lGf0qLw+hpSrNJ4i12XXHVzTZCzRS31NhxgpUezKwy9x1N2vMD7MV41xtgukrOp/RDyodB2QFFsCFhjUR4EcNkrX03hp2xYK6uP94qeYIPU4sIcsGbnWqx1QjTXn3/i3uwAsOhvmgKb+HdUoBT6Y0I4VzISa8mXkDcOs9k2T4ze8WGrZStimLBm3ruSSvlnbVA3bM45g8M08JdLQ+xcfmVjZTrVGhG8xUOuE5rHO/CyMOTT3hqGqRLllZPbnxmfjL0DkIP+LjDkRJCLzEBuKfTLspcI9WM0VAqtKgDjls5K0r5bvgWLdbjwbHn+lNE6CeHDCTmfqcJhz7mpv4T0+nbjshHZGSxjwNDtkWFCpySYrnkZdg4jmXQacxiafVxItSLZlkQdqK52KCcA/beYo8WGxaDZO/TGlGqCp+UU1DcX3dBANUR7QNklSEw//NRrJ+yuLd4y8HV/XFgnPEYpkJSYg8PkfDZUZ36DDAf3XJIwdxsWwntQHG5BAfrNxS2XmKgYcUpgE/CoO4jMvvWJ6Rqt2PudYUB0oaja1YLvCaD/5bhhsTy6SWjsV3YWzTZO2GjMQGPtvHJGd5Ym0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6512007)(38100700002)(36756003)(53546011)(6486002)(4744005)(6506007)(31686004)(8936002)(6916009)(316002)(2616005)(5660300002)(66946007)(186003)(26005)(2906002)(86362001)(4326008)(66556008)(8676002)(31696002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MS9CR2NXVFVlREhQZnJIa01HZEpzUFp5NitmcW5FNldEaUh1SzByaE1lKzhY?=
 =?utf-8?B?N0hsRG5pUTcyZUQyNXYwVEY1RUhmWkthTFBDYmdTdUoyOGQ0UmhDcHRGd2x2?=
 =?utf-8?B?U0lHT0dhNnZZYTJXQ3EvRUQxV2FVdi9sTm5xcEtJc01uV21WRTBNNEpPQ2l3?=
 =?utf-8?B?SjJQKzV4aTdNV3NZQitva2RDZkVBbUhWeUR6VnB3WjljVVU5VjFnRGMvWFBK?=
 =?utf-8?B?OVdRbDN4TXA5TGtEMjBoN05ZN3hNRHJrMUhTSW5iWWZHRFkxUW9DZWkvZW8w?=
 =?utf-8?B?bkw4ZHRDUUFJYVBNZFNDVU5VcENyTVV3eHpEM1BrUGZTV09RNzRqVUZGSXo0?=
 =?utf-8?B?Z2FmYUd5bnl5eTR5VXJkNFVEc2pJcUdzclZrWjQ3blNPNGloTnpnQ0tWcTNy?=
 =?utf-8?B?MzNqbWVGaHREOXNacnQ4S09wRHByVGViN3RWa3RmbWMxNTh1NWlOTERMU1hi?=
 =?utf-8?B?ZWFiL1VpRTJEUDZpOFAwMlRVbnQyREx1Umh0SHN3TkNMRUFjUDFERXpJSGRu?=
 =?utf-8?B?K1B6b3hVbUxiQWxHTkZEd3puU2gxUHdxQTY1L3ZLNWhRNjJpdVRXRDBJUjhw?=
 =?utf-8?B?MjNLUGR3R3J6Z0c4eXFxL3p1WG1VdkhNeUpQbmJhL3ZFZ0llUXBpbC9zQnNq?=
 =?utf-8?B?alpaaExuZ0lHTHpGSWNlTEJXZW1YQ0JhZzB4TWxVTUlrS1JxQ2JVcFkzTUZo?=
 =?utf-8?B?dHIzeUF5K3hzRGlyTlNGcXRTZkw4d0ttUERlVGRqc1c5OGV4Z0lRcHJMZDMz?=
 =?utf-8?B?bDVHQkdSa0xZWjlKaTN0bW1NMlMrOVlTa0FleG5INVBQc2xCbG1pTTdUR1l1?=
 =?utf-8?B?VzNEQ1FhNXlBcFhHbEF6OW9rWnRlRUc1S3R3bUpocGZrbEtzTENOUjVuSWxh?=
 =?utf-8?B?Q3lPTnhlNTV3K1VUV0ZvTlZsemt1b0cxVWMyRUxseXlmL1VxbloxSnZSd3l3?=
 =?utf-8?B?TnNYTzdIQWxhR2htN3pSVFlpYklnYldQVzdzRTB4V3RyVjljQ3J6VDkrdlJM?=
 =?utf-8?B?MnZIZmVBcVFuVzd1TG43ZXU4dkxrTzVjM3RmckpuVmVuTzdIaGdlQ1phbXJG?=
 =?utf-8?B?bTd0dnJ3ZnE5cFpSVVZVTjBYSE1VWDVTcUFYNWg1d1ZQUUtybC84cDlhZUJY?=
 =?utf-8?B?Y05jRERxeVJFa0s1SkpEUUw2dmJKVkxTUXJpaVExZjVCVmNiN2xwNVBSa2pq?=
 =?utf-8?B?c3JEWmVaVHA3SHZJTHp0WFdBdDNxMkZHb2N2dXRlOXZ2R09tOFZXQXdLRE1t?=
 =?utf-8?B?TlkrM3o1L0YwTklnRHplWGhHdytRT3FFeWlPV0dIMWs5eTVvQ2p3M2ZYODd6?=
 =?utf-8?B?TjRVQk5XblFCbHhPUHFrbTdlSEpsU3BnL0hIV2tURmMrY0RyRnNzVzh1dnNT?=
 =?utf-8?B?UDlnV0JwZUlYS1VlU0lMR3hPeVA1VW45YnhkRHRkMVhsZW1CV0s4cWswYmUy?=
 =?utf-8?B?YXQ1c2h2Q0czNXpLUGl0aG90NXV0RDZFYWJpUVhRbHhUcENpNldQR3BDbG5q?=
 =?utf-8?B?RVQzR3lTMWV6VEg4MzMra1lQWUdxMHBEazExTUp2VFVLMUh1bDlHLzJZajUx?=
 =?utf-8?B?V2R1S3g5RHphUFZHVmYrOUJodUd4YWpZNkJaOVVvc3FPREwwN00ySmMrZmpa?=
 =?utf-8?B?WFNpZGVPT3JPSEtyNVZIUlUxSVZtZUFLV05IK2RTWlFMY0k0UzhwR1pPWWpn?=
 =?utf-8?B?N1hpbjI5SFUrT2NxaUthT1dTMytCOFh6YlBCZGhlVklsUnlSc1ZTV0RTZDlM?=
 =?utf-8?B?YW5RTUhIZkZhemhqbHJJNzF0QThDVC9vUUpXRnpIWWFPSGJNS1JwbTJ5ODJI?=
 =?utf-8?B?ZktqVk9WNE5HZ3NKNDJmNkdGUFhLazlWN0F2RE9ia1FpYU0yWUdMSzZhOVRo?=
 =?utf-8?B?VUtVbm9tcWY3aEJ4ZzUvNFVLbUF4eDJXUHBnZEMrbUM1akJLd2NzaHpsQ3ZK?=
 =?utf-8?B?ODNRSWlnWHFqTnJic3F3UmF1Y2dwSHorOHBIT3dtcU9EUXRiMDBUaDdGdU5r?=
 =?utf-8?B?VHNUbHlKTnhLenJEUy9EVGtTR1poRk9DRVFkVHhGZFdZbUtsRnVIbDVBcUY0?=
 =?utf-8?B?WWQxRW5TUlJ4SjVaSHRPMW5GZTRLN2FxMTMwYllmWFB6d21SaC9ENWh6U3g0?=
 =?utf-8?B?d2lrOXNvMWxLbUhBWGdMRXR0cWpZVG44aWhpelhadzZIcFJBb0xEMlhiTktv?=
 =?utf-8?B?ckg3dlhQb3lhMVRiR2VYSXk2RVNTQmxaZG4rUXJIbEhwQW1iaUtyQWY3VnQ5?=
 =?utf-8?B?T2ZaZ2NReGdYT2xFSG1NQ0tKdU43M21saUtGRTVnUGlMTjVaV2NzSFNubTNJ?=
 =?utf-8?B?VmVMNWxxb09wNDZ5TDFUSEs4VXFlZGg0eXZJb1crd3IrWVlVdGxXQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6189d6-adf6-4bef-2a6c-08da16e9ac0a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 09:50:09.7603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tamhE57lEhcKid31sx1R0HoS/+ygLhj5a+0iWPLL7LTYek6RNcDSPUXR+x4ICym0AMAsw0W77SvTWs/Cp9vonA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6950

On 01.04.2022 02:38, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> It will be used during dom0less domains construction.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

I think this better wouldn't be a patch of its own. Functions should
be non-static only when they have a user outside of their defining TU.

> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -71,6 +71,9 @@ void evtchn_free(struct domain *d, struct evtchn *chn);
>  /* Allocate a specific event channel port. */
>  int evtchn_allocate_port(struct domain *d, unsigned int port);
>  
> +/* Allocate a new event channel */
> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);

I wonder whether while exposing it the function should also become
__must_check.

Jan


