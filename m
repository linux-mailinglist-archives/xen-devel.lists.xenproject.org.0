Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E14F62B0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299971.511363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7Mx-0006tM-LR; Wed, 06 Apr 2022 15:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299971.511363; Wed, 06 Apr 2022 15:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7Mx-0006qr-IQ; Wed, 06 Apr 2022 15:14:51 +0000
Received: by outflank-mailman (input) for mailman id 299971;
 Wed, 06 Apr 2022 15:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc7Mv-0006ql-NA
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:14:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c941bc9-b5bc-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 17:14:48 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-2cAHflC2MUu1dwceugu9Dg-3; Wed, 06 Apr 2022 17:14:45 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2542.eurprd04.prod.outlook.com (2603:10a6:800:55::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 15:14:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:14:38 +0000
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
X-Inumbo-ID: 4c941bc9-b5bc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649258088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wy0BAGBUiBDqNGLlf+POg46fpf7VoNTa8vzHxtxKSDk=;
	b=IIZ+nyDOs8+jwYF3WMMyHgHg3PNplA9n/PuWfX/ooIxpeHgDxEAB0QXSu0fQjqxo/76e20
	cOv1Xh9/snkGBAyIFosN88mBUPnry0LVkINJtt8hk5ZJlA2hfV9AOq3Hz0jVuXDIUnNVBY
	qby6d8WImeawhDvb+Et+SDFdPAY34o4=
X-MC-Unique: 2cAHflC2MUu1dwceugu9Dg-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmGO6VR425V+v0xQPKLe1WodvsMeD4eBQSCc5M+9nFttesYupn6MxACA25UObhW/wTLIcqLGVOfCq+vlMKMdt4w/T5+5iR04MbnjGiWaLhNfZzCryieN++BbzOB4uPRlZbh1mgL/9eqHPuOlxxaEKsCajbih90Vy6cFjQf69h9grAWxORyGvY+y0N9J8Sibq0z/KT2GDFK4WfmM8//XORUbyb1y4oL9ycJYXHs+tC7zMPx+KKYBeuCW+pzDp9d6XfY34ihPkhLRHtadC1ohzqmY8k39NMaflDtAOdI/e/3tYpaLqLqjqYbY2Na/bc5VUnnzyNbz4hQyu9rPQ1cl73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wy0BAGBUiBDqNGLlf+POg46fpf7VoNTa8vzHxtxKSDk=;
 b=nbKG2Nn9Aea166dR2Ohf1zTgkkDfGXaOw9NItW03xQ6zcV/pjM/tS3VLaQNsW1OcWFkQ2Nu4lIkf7lm2lkydCNjSvC8JtVprUIe9D+VuoMzeT3j2/QnXYZUz8uH9DBS3ROmNuNFYLGD5AjICai9lAUDXD45nYJAQlxCrATziiA/5XWUyq+84IUdpIl+81CrvEzNr7qsqnFoanxkhhK94pVnT156J93nCe8X0uVhHFgiygaKaIwEUU3SqdH0vBwg0odHmNgiAi5lN9giwU/7myEt7JFVXqaf2t8hwdvS4zk0Dz69cpeLTvDdGkJBLjyr1lcjfKzReUhgYYmcLwv29zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f593bdb-d95a-4705-d24a-f8767d69a09f@suse.com>
Date: Wed, 6 Apr 2022 17:14:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] x86/monitor: Add new monitor event to catch all
 vmexits
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <d1a7a48fa2d46c6a6cbf8f93926a8839aaba92e3.1649256753.git.tamas.lengyel@intel.com>
 <73e6b45525e1be753d3e243d42ad632bbc5690b0.1649256753.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <73e6b45525e1be753d3e243d42ad632bbc5690b0.1649256753.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cebd7334-1ba5-4a40-485c-08da17e02a5e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2542:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2542FE9BE1AF1897681EC530B3E79@VI1PR0401MB2542.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RFq0j8iIECTN2ZtOsC3Tyo6Ahz/Jk1jLmMbg5SDKLvjUjQUlyklOLzP2J5ufPuT9VljHrzxnFoDjPe49d2vETZ4zYbJFQLFG8kOR/AI3LpDzO+TOT295cuJizimkldSEci15XhsWM1NDlXMLSOiimBCRY1cZ9rR96qv1qNOu1cQbQBSJ+OrVshVDAQyydAA5/Bm2mtuOfa+7UR/UJTgvmop8BOLpPGvhRjk09DBafLxa8uuE7KxuswRqO13TzC9IRf5tSVaklKXY+ELuwjLPaflmg9Mdy1Ipn8FrNd0hnY6eMjhyWjqShUkTKd4zQGYzYPo+eKYli6Prub3p8HRaNI80eoc9W74g1Xjl7TOa2IUBtoxtfG9vD8dRz7y1giavWBQ4C9EwDsp+0WlEuViqC7IdqqfTrptLYwv9N13Qiwzz2Ith3Ba6somZlYdN6rN0950ucdTHBPlFglBPH3KfEy93svNvAHcF2bZXFhGfjOrr1VcMBsl6SS9XshzGcvJskuwYy2evCA+6Q6/wb+W/Qx74M4Y5aAxfC2WtQmSkt2O8I+kWRK+O2Was9rbw+Yrec+Kv8cBHXt50DqsK62KNKQmQd4BW4+aUnf27EUzIvTSNslth1tMuW2udy47vqYLheMk7Ua/wOLRrMlbEovoXdhjIAKY2md6MUsR9L9YAITpHPezGkkkoSNEtOdAHeLhgx2I7Z2IQ/mwQ2IdSZZ9BAioSHwdE4Z+xKkVVfpVJx9+BcqHuAL8M2FnRQIcd8V2j5vKrjryugrXyxJHbd79Ayjib+Djlb3E8AO8cllWlLw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(186003)(26005)(31696002)(4326008)(83380400001)(66946007)(86362001)(38100700002)(66476007)(66556008)(2616005)(2906002)(8676002)(508600001)(31686004)(6666004)(6506007)(6916009)(53546011)(316002)(7416002)(54906003)(6512007)(36756003)(6486002)(21314003)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGNLcWtodG9vcHFhc21ESUhBTHZiOUdUQUtsMkZucTZpL0NrR29TM1E0RVdK?=
 =?utf-8?B?S21uTml5WTRaQ2pmUkN6bko2QkRYd0dwQzlTTUlHY3owKzQ3YkREM2pMZEF2?=
 =?utf-8?B?Z2hFZEU3eXpENXhSVDVLZE95V0gwSi9pVys4dk5DQTkxR21wd1M1NFRmOVAv?=
 =?utf-8?B?ck1IdlgyZVAxY3oxUDhKRjdKODE1K3JkODFDZ0c2N2pFbE03TnE4cUxkSjFK?=
 =?utf-8?B?Q2t0TldSajhWYmtkd0NmM3pZVzhpL3hEejRFeURoODdGdHFkbFNSKzhwdEFI?=
 =?utf-8?B?VjFVKzVKTHJMNWE5TGJWRkx6RnFVRU5hVG40enZGbEw1bGlDdDFmVDAxbUdS?=
 =?utf-8?B?N3lYb1pPN2N1TDluczdtYzlVbTkrQWtxM2g1cythTmplcXlOems4eFhYQS94?=
 =?utf-8?B?aklZeW5JR2FLZnpob2t1NlRhTDdWMUdmMFdRWGFsbTI0a04zMnF1RHRYanNx?=
 =?utf-8?B?RDdGbFQ5WEhvbjhDZys3TENXMm1zVXVFbFdic3pFYUhGelIrcll3eE9WbWNU?=
 =?utf-8?B?Y0kvRXU3dkZPNzQ0WXJLYi9JSTNiQ0VWMDJ0Y0pTdEw3djZjekRKNlF4eWhu?=
 =?utf-8?B?ODB4UndsYjY0OUhPWENqUjF0MlU3R1ZIUnUvamsvQ3g2K1BETjhvSmw0dUxP?=
 =?utf-8?B?WENwbTRVMjdhYW1xZGRlUW5ueGdLQzFXL3A3Mi9hYzAwNkVyNjgrMG5WR1ZX?=
 =?utf-8?B?dW13dGpPcURDTG1KUjBHMGljUjRrRWZpd2RlV2pXbUlCZGFyUmR0WVVWTmR4?=
 =?utf-8?B?SFBad2t1TlMrWWxWUldrUjJyazVOVDhjOFh0Z0dudHVhNUFxUGZwNjd4VVlF?=
 =?utf-8?B?RVoxcUZpakJvTVJVajR6bUQ3TnZzV0ZQSE0wbFc3ZlZHSzNzQ3BSOTdJZGh4?=
 =?utf-8?B?VjFjb204L2JmZ0dUdmVRTmZmSkMzR09EeHZ0QnFRbml4M0NnNHF0ZDd4M2Yz?=
 =?utf-8?B?ODR5c2tQZ1RMNWtiMFFhZzlDbThtYld2a1Yzc0FFeWVDeHhGYzk2S3FaaVNS?=
 =?utf-8?B?Rm03YnJiT255OEZtdUNsaU94dUhBa3BvcXRiSXRQcm5LMHJpQlpTd2o3WHla?=
 =?utf-8?B?S282KzN0cWEzL0J6OUdNRGw1dkxvR2ZGSEE2WHRFWGF6VWRJOW5sWWgvSGhG?=
 =?utf-8?B?dkh6Z2RrcE1QclVYdXFmcnJLeHc3cEwvTWg3dHRqM1pIN3ZrWWxhQmxvZGtR?=
 =?utf-8?B?VFNSaVBHenRCZTI0T01zQmQ2R1V2am50WUVMbU1FV0xaeW5EZUQrbDJSSEJK?=
 =?utf-8?B?aEswNHB4Q05hWHV3MEwyTzd5VllRNDU1b0dBTmwrMDdXRjZMcGF2NmozMURB?=
 =?utf-8?B?bmkxQUdUaXdKcjIyVzFHb0YxSGdNc1dLZDJGTVdKeUJhd1cyRFZDMlRvWjli?=
 =?utf-8?B?eHlWb2J4YnV5cWJOZ0ZKaGVWdlN2MDYzdWxUM3RRTUNsQnlOR2pGK2c2NWZG?=
 =?utf-8?B?Vy9WRHNacFhTNmNKbThuc3NHMjdiZFQ5eUNydUtOSStBZ0RLTUFwMUhrczlG?=
 =?utf-8?B?MmhnUGt3aWMySTd1WjRTbHpYRFBvNFNLckFlZW4yS0VKc2dyY0hQV0x0UGh4?=
 =?utf-8?B?UzVReEIybThvWFhpVEZVSnlRaS9VaHVCR0hoWEl6TCtEWnM5a0xPY1ZOaUxM?=
 =?utf-8?B?OXdGZ3lNaS9pKzdPMjd5eVNCc21jK0M3K3N6RUhKWGwwVHZrNTFwTVdQUG84?=
 =?utf-8?B?dHJnVDN3bGFTQkd3aHFjVXpYdHVFd2JaajUrK3dMTEkveGRlOEdkYTdwdDRH?=
 =?utf-8?B?RlNNT0YzN1pUaUx6QWhxbWVtYVdHbWo0MUpXZWE5MWZNTklMOTZQazZ2RFQ0?=
 =?utf-8?B?K20wTTk5L3ZWN2FtOWtHVFZ4QzBhRlBmY01BZHJDOEhGM3RHK0x6aWI3TFJS?=
 =?utf-8?B?ZnpBZUJ2TjlrTEJrRU9NOU9lSWxqV1ZLMEd0aHkxS1hNUmloOFBnKzNqSmxl?=
 =?utf-8?B?TVl1Nm9pWG50YkNFSWhpUWd1cmNjQzUwMlpnUkRYVitjOXd6SEloaCs1TFcz?=
 =?utf-8?B?cFFmZStpNlhrOW10dmxnSkhCcUw3VVlsaXZRSVF3Szh2b3d0aHF3L09wcU16?=
 =?utf-8?B?by9MK1hHSXpWcjVtVlphODVFdGR5akpCUnh5K1ZwaEtPMjByM2c5NFkxUnB3?=
 =?utf-8?B?TGVvVUNLTVdNMXV3dWxaM0l3SWp3OHl2MUZkd3FnMDc4djlhTGZ4bEE0QUJD?=
 =?utf-8?B?OHcyMGsvbGw0NmtBYW9ackFZMUdGdWxDRzZUZXFBdUNjZ1hJbEhMbTZFQVRw?=
 =?utf-8?B?LzdyNnRRU3JZSVlkaGhUNWpZdVU3c2c0Tjdsc2cvUzJ1ZWFmci9qZDMvZ2ZP?=
 =?utf-8?B?Sk9heERIYWhxSW5aTVZqRC9sU1llYkhNOU1oaUlrUCtZUUt2RVBCdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebd7334-1ba5-4a40-485c-08da17e02a5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:14:38.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Net841zD5kYdTesMhAJB8SXZGFmqHhaKC0Xr1xosvgczX9stVALTYOyTqhDpKNa+hVviKhE0ee7USmCBEmT3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2542

On 06.04.2022 16:58, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -328,6 +328,24 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>      return monitor_traps(curr, true, &req) >= 0;
>  }
>  
> +int hvm_monitor_vmexit(unsigned long exit_reason,
> +                       unsigned long exit_qualification)
> +{
> +    struct vcpu *curr = current;
> +    struct arch_domain *ad = &curr->domain->arch;
> +    vm_event_request_t req = {};
> +
> +    ASSERT(ad->monitor.vmexit_enabled);
> +
> +    req.reason = VM_EVENT_REASON_VMEXIT;
> +    req.u.vmexit.reason = exit_reason;
> +    req.u.vmexit.qualification = exit_qualification;
> +
> +    set_npt_base(curr, &req);
> +
> +    return monitor_traps(curr, !!ad->monitor.vmexit_sync, &req);

vmexit_sync is a single-bit bitfield; I don't see the need for using
!! here, even more so that the respective parameter of monitor_traps()
is "bool" anyway.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          }
>      }
>  
> +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
> +    {
> +        int rc;
> +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> +

Nit: Please swap blank and non-blank lines here.

> +        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
> +        if ( rc < 0 )
> +            goto exit_and_crash;
> +        else if ( rc )

Nit: No need for "else" here, just if() suffices after "goto".

> +            return;
> +    }
> +
>      /* XXX: This looks ugly, but we need a mechanism to ensure
>       * any pending vmresume has really happened
>       */

A few lines down from here failed VM entry is being handled? Wouldn't
you want to place your code after that? And wouldn't you want to avoid
invoking the monitor for e.g. EXIT_REASON_EXTERNAL_INTERRUPT,
EXIT_REASON_MCE_DURING_VMENTRY, and at least the NMI sub-case of
EXIT_REASON_EXCEPTION_NMI?

Jan


