Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D032650FFE8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313913.531711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njLl3-0002ok-5y; Tue, 26 Apr 2022 14:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313913.531711; Tue, 26 Apr 2022 14:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njLl3-0002lZ-2S; Tue, 26 Apr 2022 14:01:37 +0000
Received: by outflank-mailman (input) for mailman id 313913;
 Tue, 26 Apr 2022 14:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njLl1-0002lO-CZ
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:01:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b3c5dc-c569-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 16:01:34 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-DdyyxF-FOZaX5suXCnQNbQ-1; Tue, 26 Apr 2022 16:01:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4053.eurprd04.prod.outlook.com (2603:10a6:209:50::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 14:01:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:01:29 +0000
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
X-Inumbo-ID: 61b3c5dc-c569-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650981694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw5u93cJDYWEddNdIN73iKCk9IJj9XNE6SNSWcsFc40=;
	b=cJzP8JqZoFNkPol3YzCgPrq/xKgDUiiIw6WWw/2xJQO9sEYWu0zs9EJl3TViKZxAHfSI5L
	F6PlbE4kSX3uqsc2088Mq26osIdq8af2uVlMBbPCirXNJtMUGfsarKjE/+g9vZOk17Ynms
	5wGfxhj+CdBtczIFHzfaNIyVdfaZK3g=
X-MC-Unique: DdyyxF-FOZaX5suXCnQNbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7+xem0bp4A3ntgLamZHeH1a1VCrW9XGxjfp4G5AA7DmHpEzyQiJ5eRqe6tN6MdpG5xqW8vdizWty6KNjAzFObdqAwB132o3PgMI2fPQac92eb/AjVZQBLdN9PuaWWGQrqN3yWGqJDgf0kZlCp7OcUWzxvARPafirRF+8cwIHuY9DYw/0O2sXWSPJtCopMvr3XCbVwEF/uWFNfj7RaNinVDA8CGMnchpIWF8AmVOzpgHlvEYRfQmaw25wBqeh9HIcPSB8lsaGY3kNiXEDRRLb1FtwSK2JX02UQGjIgJnPMC74nBqfK9cwCnxMGBLNckHC2dAUlcvb4CvR2eQkioZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw5u93cJDYWEddNdIN73iKCk9IJj9XNE6SNSWcsFc40=;
 b=EDwtknJUCUhg0XbX1GxBFJu9mYJCEXkC4re3Y1Xfi7GX9bNwka7JwTYSOzSNj8cnnpy3i08E5X99SDnH87Mw7DFrreeyr5AnJqqa28yLinxlfNZA2Ov+8E9Rhezw/SiMGPKRFM8RYqGueBjeyCRuE9k4li5DHQSnmHQnx0quRHrjFh8mr25pH9DLhCQXGIWd53EBD/1ZfypNTkHk/q7OK8jgcupnHUVadB8T3r+AenMD0I8JaveEFiiJfq+sI5JhRctR4PMweOtm3OSRwvrmZVjNbyGf6YBoZLDrnfADI9B8lTC8vqnNsmqDS9ZbmiSAmDivXATd+WtRavLjtHNpEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com>
Date: Tue, 26 Apr 2022 16:01:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425132801.1076759-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48a2505e-07f4-4c10-2ad5-08da278d42e8
X-MS-TrafficTypeDiagnostic: AM6PR04MB4053:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4053B8E2CF040269274C761CB3FB9@AM6PR04MB4053.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JFpSChrd8dJ7LrKrulVJoeDpEvIwd4y2oO37RnbjpufXFvtoaDQzndlzDEDCWjbBk9bCzZkbYBSM7hnnEpeqDJN4zAhxf7GE7x74qp4Fwvg1Zih2LUyUdsFe/uYpyO6MyfIMGj3YIig2h9qGRpMeAmqD4ZBCYWYEiHp/6tnTdzV2PSZ+Jv5E142e23W4KKc0Lwb49zFfybEeCMAwGWBcj8217TvNrmbsXIIP4U17PH/mX4FMr6ry435udvVpjETaau42l+sKV/1nJdkLOcBgGkxWJBKfFhL/J/WOYeJMotk9DH/TkUo3CrYlKG/e3LM5dX1rYhToRMkt9JCHcJ17CqaoPEnfapDMFSn+h3aaiWEe/HZN9er4f75NnbJ8khfuiV6EmaH3FAWLnxX58uk1WqB97w8EEKk6Jrs8wpr1p9Ypiz1P7PG9hMAhopnLy4vAyz/yjQaTZ5qMqM7GcKXQX7hUgYFn9lOMfY08DH/LaadjbyrwcTw1vhcMLMfKUjP/1Z3Ugi/g8nuCpX6CnTS2+8uRDQjbPm/yzlsDCLFJrQnmZMYB4pXC9q9efJ9UXRG6PVh2oIvDJ/mzY/CosHEgWDrQNqmHHlbfyH+1r2YVr8pSvYluzs60MEMOmhoStUeZhdOv/Tw/3TMTNlXBXw2+qZlu4XyqdjyGpNNcl34n0P9BXA1KjAIyrpIan0X28fNdZoVOEmnEe8KFuWWrDsJw9lv1BFxXBy6OaidsOfhVmBwbMDYVf2WSpcgnyNo9aoQY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(8676002)(4326008)(66476007)(54906003)(6916009)(83380400001)(31686004)(36756003)(6506007)(53546011)(316002)(66556008)(2616005)(26005)(8936002)(66946007)(6512007)(5660300002)(6486002)(508600001)(31696002)(4744005)(86362001)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFFSWjViSmxLUlZiSkFDeTNGdFFHU2VNTXNSM0huTTZQWTZIbGpLS25SSnlt?=
 =?utf-8?B?dGh2cjNxTUdvUHBKNXNkcFhyWWR3NkNuTVlOYUd1Qm9ySmhQMjdzc3laVFRY?=
 =?utf-8?B?WktSRFdhNjQybDNxVHNEUXpPRExJbGR4NWxzc3hiWUNJd2V0VDBoamZCaUM2?=
 =?utf-8?B?SkZza3YveW4rTm9FWDBBU1JNUEtGSjhwNjBmemM4Zzg0N2t6aWRPZ1BpRUk1?=
 =?utf-8?B?QklKdUgzSnFHVktyMVVQUmxpbnUrNVRJRFFWSHdmWGRXeGVhMTBvU1ZMSzhu?=
 =?utf-8?B?RjlnS3dCNkZhaTV5bVUvT1JMR3h3L3doSjJ1YjZna05waldkdVdaeGF1K0Nw?=
 =?utf-8?B?SUYwVE5hQTBQeFIrUHJrakZMa1ZpVzZ5WHBicWJxNzF6VmpIOTJIWURhWld0?=
 =?utf-8?B?M25KZ3ZnZVdmRnJ0U1NMYWpHWnUramI1WVBYY3UvSEFORC93RHhBMzNuVWpK?=
 =?utf-8?B?THl2TjNmSFFzSjFNR2xvNC9ib0VxODJtZC90SXBMZ2M3MFFEL0tjNE5udmtq?=
 =?utf-8?B?bjVsMmxNdlZDSEtSZkRJenZhMHovREo3aHNYRHRXU2dKSXBCSnB2SG5iV2tp?=
 =?utf-8?B?dWE4U3pmYm1zUExPSFBrREdEZDhRb2V6R2IvUnlaa2NEaDBYTXVTR2VnN1F1?=
 =?utf-8?B?eGlRUEsvNVJWclN4akRuZ3NKT1htVHNWS2xFR001UkZOYkNUcDNwbGlFa2kz?=
 =?utf-8?B?Yzd0S0M1REhOTHJrTGRpMEFJVkJqSWxjRnB5b1FsaHpuZVBKN3Irc3JqeitI?=
 =?utf-8?B?czBxYUZQVm5XTGdMMEUrQU5jUFlzZjVCaUE2WTZLNkFEc2h5OS9IMTlPbnlX?=
 =?utf-8?B?cmJNMU4vYlIvZXpmUHkyKytHSU1yOHN5eWQ3c2t6V1NpTi92cGdiOVRlSXU4?=
 =?utf-8?B?TDNWRUZsQzBHWnZucEh1d1FmMmUrUnJPRDlhekVvbFRIV1lwQXhZQ2JDYmJW?=
 =?utf-8?B?cEVrODhmNEhDZHRxWElXM3hPL0xnVk91amtmZ0kvclFHeVBUWnVoei9acGZO?=
 =?utf-8?B?Y0ZxdSt2RzgrRVRkVzNoVVdHdk5KRE5uZzdwOTJ5V1k5OGhxbmtyZC9YWitm?=
 =?utf-8?B?UC9lUFVHK01GZ3ZVbG52eGZNeGxIRnNacm1jYXpTVG5Mc002cDZ3bzlSQVpC?=
 =?utf-8?B?TUdwN1R4ZzBVNUg3NDJQdXd3ZWEzeEdjY0RvaUVFemhYMlpMd0s1ckVFSUhI?=
 =?utf-8?B?SWx2YzA4VWNJcWZ4Rm9tVm9lNE5mRjNBRzlVTGhxSFFoUmVMVjhocnp2Qmt3?=
 =?utf-8?B?dVVnZVBNdURHOW5FVE9TZzNYZjhqdmtUNWtiMVZZaVJVMVlCTmtudVZsLzF3?=
 =?utf-8?B?SkpZcWNZSldOeDNEcjRBUkk5bUZvTTRZZERwNGxxeXVyd0d2TUZmcEVkdmdG?=
 =?utf-8?B?TytOdEZjczhmTmNkUjFBdkVVZUJsR25TdktOVVYzWFVvNnpiTUZzRWd6TWMr?=
 =?utf-8?B?K1REbmdwdGNDSWxORnJzUFgxckdteFh2ZnNTUEV2b0drYnV0YXd5V3IvRWFz?=
 =?utf-8?B?VWpwQys4QklBQlBzYWhmejQ3RUlCM3I0THJuVHpOejdPdExPNDEzWnpjSFlF?=
 =?utf-8?B?aFJoQnFqSnE0d2ZrZzR0dGlhQ1dJZFhFZDF1Z2R4dGNqekVFZGtINUd5d3Jw?=
 =?utf-8?B?NERwZ2ZMUFhlOFd2eHRLWm9NV3d4anZqVTU1QnEvR0dJcW9GQ0F4QTJhSzF2?=
 =?utf-8?B?TjZWUHhGdUNJMEthdjRLeXpOM1BqdmRLVnY4Tnp6MkZGOGFLNXVUYVRtK1Uw?=
 =?utf-8?B?OTFwWk1CQlcyOWVLWXF5dlQ3RkJyWCthME9RZWRoNHJ3OHRDNGsySG9VeTZV?=
 =?utf-8?B?SnFIK1dNSG43a0RtbmthOFpBRThoTWlsRDFPL1lhZjVZQ2lMYnhKclNEOXVP?=
 =?utf-8?B?QTBPS1dOSG1uOStkYXk3THAwYlhIeTlRV0hnZUZpSmgvL3BBREZ2N0o1M3RH?=
 =?utf-8?B?WWJZM0wxYXQ5bnpIRHMwWnF0YmdhM3ZlR3BNMjZhNm1FUXg2OVFUN0R0M0t5?=
 =?utf-8?B?UTViSU9xWDNCOVdTb1FnSmpTMnNMRzQ2bGFKTHpIVktqdXhmcm9nRUM2Zi9S?=
 =?utf-8?B?cHBiWU8rWlFVNHd5TG9MY21Id0lZQ2VFREt1Smo5RW9XWUZhLzVhdUxWSFk0?=
 =?utf-8?B?dnZnTjZ3WDA0MTAySVJBeHlKSjcwU1VUdUxpOUdmUGNqZVI1WlhSczBuUXBP?=
 =?utf-8?B?MGlVc2NIdStOcEtOcVFvUW1tTElQdVJJUEJHT2pFaTBVWnJ2TTg4M0RaREgr?=
 =?utf-8?B?d0pwUUh2NUIvM1JiWjdLYlliaFBTcTA2R0NWazRtNGZwY2hIWDhxMkdMakRm?=
 =?utf-8?B?Z2prNCtiS25kbEJPM0xacHdVMEFqVnVEdTRsbVRSRWVmTUQrN1oyQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a2505e-07f4-4c10-2ad5-08da278d42e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:01:29.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoaKqKf3W1M6TSV7FZttDRUidEQpYvI4mjyBdJ082Z0T++n2xFPbRvsUs/Ihjl1ib8Cf7IE+dnZdw2ncmpwXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4053

On 25.04.2022 15:28, David Vrabel wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -162,6 +162,13 @@
>  static char __initdata opt_badpage[100] = "";
>  string_param("badpage", opt_badpage);
>  
> +/*
> + * Heap allocations may need TLB flushes which require IRQs to be
> + * enabled (except when only 1 PCPU is online).
> + */
> +#define ASSERT_ALLOC_CONTEXT() \
> +    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))

At least one of these tightened assertions triggers on Arm, as per the
most recent smoke flight. I'm going to revert this for the time being.

Jan


