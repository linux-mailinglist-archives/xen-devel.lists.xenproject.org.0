Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F14C85C2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 09:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280935.479060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxQM-0008RW-PX; Tue, 01 Mar 2022 07:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280935.479060; Tue, 01 Mar 2022 07:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxQM-0008Ou-KY; Tue, 01 Mar 2022 07:59:58 +0000
Received: by outflank-mailman (input) for mailman id 280935;
 Tue, 01 Mar 2022 07:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOxQK-0008Om-JX
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 07:59:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94ccb4d3-9935-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 08:59:55 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-uavKTY3TOYCWMSoI3YLkiw-1; Tue, 01 Mar 2022 08:59:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0402MB2820.eurprd04.prod.outlook.com (2603:10a6:203:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 07:59:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:59:53 +0000
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
X-Inumbo-ID: 94ccb4d3-9935-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646121594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmZljKsuipJZNrFyF0W6Vga6KwbGVTf3g9zbiLcGc2Q=;
	b=Ab1RZx17TP8keATLOnrx+M3lAP2h0KIdmVecOnmSNWca57Q7mqJkBzYR4OU43wm/yc5UOK
	nWPgpirLAx1TQ1+BP0geMtPVFywupOLRxVjmwFE4JjaStfWp1cZR4leZlXodnz9YAvxkpN
	tJuD4cRDqYfwePGaFzsGEHEJtgMBzWo=
X-MC-Unique: uavKTY3TOYCWMSoI3YLkiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lieZF3Dm9vzlwmrhF+63sDTj6vVWllum6zIu+/s+fMbj+MIIXZiTvCUWkjrB3DywqijDtHPTr4O3V8q4SoLEEt9b/IIFxneS9nGwIf2m+NGytsYIZY3CbasU9O09WpAA0AsQ+zkH4lGcdXNBJcyrLMqljdfxjA1PNy9G0qGtIbSztZubuQZzr1kPExIf9MQtXQzHuhIp7Xg2YHSOgHuqdK1xHTXSOIguNmPf4OWjMSpynGarkqjwuNvS9938hOg6HrObpL/Df1AeKZhT7IKN+UPX8k36POmNTbaEgN9YEHsHl0z8IWsrjW3SI0+N4dknjlxmN/FqWF7gyKIsTYUh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmZljKsuipJZNrFyF0W6Vga6KwbGVTf3g9zbiLcGc2Q=;
 b=JyISvSO8Q8/vSU3NIT8MMpgvxR1EbF+gkJDOfELotm4fd3lozKhaaxEQxq9cTrc6UYhGLs1QKebVRy2tr4HI2AlQ7NjBMtqTSnZLzhxK3P++sw5xcy5F4JfOoNXnTAcYSNB/a4g21lIykWEoxMzGnMVm1+exbsm2dYhq4mD/o7q6XTxIlz1WWDZMuqE083LxHLpHNGwAMCjfDDXwvI4zZV1WoX2tmSEI3OUR/yhwlwMGnEu6QjE+wUd2M54RTYulphTitogTGucmRaS2+tWduq1321hLo87xu+hVVvgO0xcs0nZmpZ+tZnhX3Kek3+dlw4OIFTViJFSPpRH8KWafbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9ada15d-394d-ab15-76aa-9f5bb09f026c@suse.com>
Date: Tue, 1 Mar 2022 08:59:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/spec-ctrl: Disable retpolines with CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220228225117.14327-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220228225117.14327-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0098.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76efe257-18ae-431f-7585-08d9fb5977a9
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2820:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB282029314819444181D8C162B3029@AM5PR0402MB2820.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cehzoZpAjW+CxNqT0Yfk1mgmm30mkVsIV+9ZgQe8F70esOZlxU3qxDk1yNZTLunOlbIJZDZWsoxZGL0wlTjsbDUoflnLd+wLHp6xn2K4vVziFcoC1hTMMvX7lo0fBIWYFrs0I82uyfw9RLp9+6qhz6REHmbsjv9B5l7Zh32ty9H5MTAUiOo52q8/Bw91gUv0kfM7ZIS+8mhMXy26rrqHuZubFlCBPntceUe3yju24CpnVS+PMH/Um8M7jBNMh2E+mQC48RgMbRSkObveiWc9g+ApXCuf5RSNhudIvgdaYVjGoGcAyP5ZonQcCB2YvkvXD7K/k1OChcp0gMpdj4vEjPD6GEPHgsfUR5j1CDMGuGLGTD2Oehun50xAaGE4PMoiIcjSlhW3FR8rXW6n19042oTBQeU8xSFiaIv3HKYEThJ+7a9Fv6pcioPjhSzxbmuRl+U8+YhKMxngTk4quUvs5/AuDpx1rSeXzMf95TpWnuyuony2cKSTs/BTtQD4jXbC0XIu0IiUpxH57tGUOxQLFXrCVqAtG51ogmQZCFfbFLwqg93Xsl1xyveWnaNw7wZLUNY4Y5XLWsPJ9zTwe2PykafhrIcJ/bSSTXfqwU7FcnZ2qTPCvP4AatuJxyvr2X0uslJ8E3dXwsnLe66U+U1r8nnpq0zSBvemAY7tyGBiAeY/S7zloAXcQ7YC4OeCcYPuiCmQiKr2rNT9uxaJUgoKGX2aCJ6RFrRlzxAozr/WBgSZO4ugalsq6COrvRDrSNch
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(31686004)(2906002)(38100700002)(5660300002)(53546011)(2616005)(6512007)(508600001)(6666004)(6506007)(4326008)(36756003)(186003)(26005)(66946007)(66476007)(66556008)(8676002)(316002)(86362001)(6916009)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmNHR3dGN2dPOXdmRUhyNlpRNTFOajRXcU54ZnV1L0xHUzMvUzV1MHpYZVI5?=
 =?utf-8?B?VnlWaGhtdm9zSlZ5N3BqWUNUMUhFNUtsL1NjZlo1NXVtN1RBWE1GVFhjWkpi?=
 =?utf-8?B?cUc4ZzhqWUtEdjVtdkZVN2hHN2hOakMvbDQxRmlubHg4d0FaK2VpeWxiamJ3?=
 =?utf-8?B?dnFYaDVGSnlQdDdqcUpZUUtwMmUya01oVE95U2s4cDVnUWZaVGIraWlXVFA5?=
 =?utf-8?B?YVdmTVB6WmN5WE5obU50dS8yaXNRbCtxdkEzK1lmVkNBa1dDdkVFWnQvN3Nj?=
 =?utf-8?B?dlNFSytvL3orMWVneVZpZnNWUWZFVDNpRGR1MzFuVEVnUTM5VTE3dkZWYjFY?=
 =?utf-8?B?bmRJVTdzUW44bldOQ05aQVFSVkRnczQzWi9MeStQTVNKekZQNjR1VnNzWDcy?=
 =?utf-8?B?NnpiMEZHRlVMSk1HUDJlSWNSMmNwaFYwb2VMNHlySU1Oc1RXWHgrSS9pMTlw?=
 =?utf-8?B?K25lYUQyYTV0RlNyc2h1dzBtSWNueW9GMmxQTVY1VW52WStLVGR6Y3RqYzNG?=
 =?utf-8?B?dFNiTEVJb0UyNGU1RTREeGRLN3hrQU0za1pnbXVvWVg0eCthTDZVMjhKTnhq?=
 =?utf-8?B?VWtsbGovNDlML0tZY2oraWJBVmJIMG1nNE14dG9nUnBFL1BnSk03c0tEcjBC?=
 =?utf-8?B?aDVGWGJPWHFjaEZOTnJFaFRYOURocjFJbUcxYVN2ZGMyVW9MV214UnYvMFBI?=
 =?utf-8?B?OFZUbEIxT3JJRTBMRlN0eVM0UitzVGhsVUdEbUFqZ1NtdlR0REJUTGZidjhY?=
 =?utf-8?B?Vyt6WU04RGtkbk53cVpFeGVSQ2h0b3hQcVV2K2txTWYwMkx3UmRyMWJGVUt2?=
 =?utf-8?B?NVQ5WHlvK2pmTFk3YWVXZEtJU2t3UEpDREVRaXZmU016NStYSnFJZmpXVlF0?=
 =?utf-8?B?OTROYTlLaWptYzVGb1ozd2FEUDdxR3JDRWlyMWFYS3o5ZDhFYnE1Qi9IaC9C?=
 =?utf-8?B?RHdjT3pwYW1BVTVsN21wNC8zOWhzSkxodFdnQWVuS1o3YXlIdEkrUk5PMXFL?=
 =?utf-8?B?MytVVSs3eC9DYktiY2gwb2REVDFESDVXRExsdE9jUGloYXdUR2w1R25xTzdj?=
 =?utf-8?B?VUVDQ2xDK1VldHB6cnNLMzhwOGtjZUZzM1BPMUlyUTA5bGtNdGIzbWpRenl4?=
 =?utf-8?B?NmFRb1gvaU84WmhCMTlTY2VpM2gxeDk4NmRXNVBINTAwblQvajY3NVd2NkxP?=
 =?utf-8?B?a2o2YnVuRExRYlBield5Sy9RVy84eUtGOUtaYkk0YkxSUGxteSs1SnhlV2tz?=
 =?utf-8?B?RDNTdzJTUks5YkJRY0JMNjlRa0xuOUlJREhpK21qcXAyRzcxeCtuNnNjc1NL?=
 =?utf-8?B?cTZqQlg3RjJGbGhBL2JRemFnZi9ta0R0cXVhSk9FNTJWN1BJSUVvZ2NsTnAx?=
 =?utf-8?B?bW1ZTi9leWtBRlZSOUIwL2dGRDBKTEhSVFJuSEhSYmYrSmt3dkNqbXZad0lH?=
 =?utf-8?B?Z1JpTEZWVS9vbzlIMFQ1Ui8zSjBydjExSjh5b2dGKzdaYm0xNEg2eXBVTHFJ?=
 =?utf-8?B?MFhpcVpwYzFVVUdvZU0yamdnUzV2cWE0d29iaUczUHM4dnUvYm4xM2pjVmdh?=
 =?utf-8?B?aWlSYXpNSzBWUjhLUkJUWmNpekRNb0MyUHJQalhMVmJYczJvZ2lIUVk3cW5Y?=
 =?utf-8?B?Z3hkWktoNjN2OHFrQk1qM2YvYzdQZm9QVzNhQk9XNFFtU0hyTGxiQm1qQnhF?=
 =?utf-8?B?dnlCQjQ3TzhSN2p5cXI0UGd6K3luVVRXWE1nbEc2aHY1eWIxTWhRZGdRcmRt?=
 =?utf-8?B?WmE5bmkwMi9XeU9KR1llMjlIMjZWUWVSUTBvUW11Y2JucHdKT0lwWU9qcEdG?=
 =?utf-8?B?WkxWTUZsOUx5MSsxNDg4ZkM4ZldQV3h1b3cyVzMyREVJQ3Q4dnR1RkhsQzlH?=
 =?utf-8?B?dm13ZXI3SWhQTGNjZ0QxMGtUNkN2aDlUNHQ0M3J4RGg0cHYyNUJQVHJPY2dz?=
 =?utf-8?B?akxnZ2RFQ0x5aVg2SU9OR3hoK2FtbytBcWJSMTAwNUc0MGNpY0dQdGdNSTlN?=
 =?utf-8?B?K1VaUUxHOWU0MGZWMG51MGRHMW4vUU55SnJzcWQxTFFBU0Rzak9vdmJrTENl?=
 =?utf-8?B?U2Rhd2NzSzJRWmxvRjFIVzQwai9qMVFERzBwNnp0R0kvVGhTRnYxakwzL21u?=
 =?utf-8?B?clVsUnM2MG5OVzF4ZTdqNVltMDJ3QkcrT1V1RkI0VkRQSlZKd2ZCZGpKVzBB?=
 =?utf-8?Q?b3T/lMA3/9JI6DfGviVokIc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76efe257-18ae-431f-7585-08d9fb5977a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:59:52.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdQUAg8hIxFGj9tVYxPuUao+Qf4rqVWZnyEiZ8nYdCzsiySryX0+MHqoy9ctHgQB6ExQU+K4xEgQEZCKg9qA9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2820

On 28.02.2022 23:51, Andrew Cooper wrote:
> CET-IBT depend on executing indirect branches for protections to apply.
> Extend the clobber for CET-SS to all of CET.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I can't decide if this wants a fixes tag or not.  If I'd remembered during the
> CET series, it would have been its own patch.

On this basis I'd say no Fixes: tag.

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -944,10 +944,11 @@ void __init init_speculation_mitigations(void)
>                       boot_cpu_has(X86_FEATURE_IBRS));
>  
>      /*
> -     * First, disable the use of retpolines if Xen is using shadow stacks, as
> -     * they are incompatible.
> +     * First, disable the use of retpolines if Xen is using CET.  Retpolines
> +     * are a ROP gadget so incompatbile with Shadow Stacks, while IBT depends
> +     * on executing indirect branches for the safety properties to apply.
>       */
> -    if ( cpu_has_xen_shstk &&
> +    if ( (read_cr4() & X86_CR4_CET) &&
>           (opt_thunk == THUNK_DEFAULT || opt_thunk == THUNK_RETPOLINE) )
>          thunk = THUNK_JMP;

Just for my own understanding: Why unconditionally THUNK_JMP and not possibly
THUNK_LFENCE?

Jan


