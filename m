Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB74A9636
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265236.458572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuoz-0006so-8Z; Fri, 04 Feb 2022 09:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265236.458572; Fri, 04 Feb 2022 09:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuoz-0006pM-4u; Fri, 04 Feb 2022 09:24:01 +0000
Received: by outflank-mailman (input) for mailman id 265236;
 Fri, 04 Feb 2022 09:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFuox-0006TE-L0
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:23:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eb7a34f-859c-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:23:58 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-gBgKrGrJNPmrTBlBSZrVZA-1; Fri, 04 Feb 2022 10:23:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3406.eurprd04.prod.outlook.com (2603:10a6:803:c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 09:23:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:23:56 +0000
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
X-Inumbo-ID: 2eb7a34f-859c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643966638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNPUMy76s9V5P1WX5LpPDEh9bgK8dMDSXDK15/We5mA=;
	b=FpgkqgaHHCOWHEhh3Natkw6wNYt3IF9Thu/JnDlnyaweIAT3uP+H+dOzQeB1jqTl6RyoNy
	C+Y4NDcsHeEuibL/STCysbWvJSoj2Xn2wS2acqig0kIlLIBtxz5k9kd3l9pI3C/DSKuSZ0
	P6jesa6LIuL+741oVSAgXmvU5WTMfUU=
X-MC-Unique: gBgKrGrJNPmrTBlBSZrVZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPZjm/y3QXrpihTaa7fApheUpBiyID4p0ZkBn0c0lhhDCG1hbbHTTEnFR7srH2VbPk/+AEX1TYSsL11cGux38r3F6Xr4bX9y3Op5ZZi8EFJ8qQFkyS+S39hkTVx1ASbT6ncTCkLx60KJoNqGOU9pq+6VCxjnEDWil5M2yGqkFhv1lCn6JOoDF81nugJ6+Kj+sgV2frKyl5UWrtNrgekNg4QU6b4+frYpBi5lOKMwQypAksR3k8wc+gLU2MqSNnXe+p4/Oi+xGWA6/UPgvkiA5EeaQ4I/ZXI0WYfEpjpAfTGINPmsfAw5VFMwhM9N6XUifigA898WWDMMWsztboW74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNPUMy76s9V5P1WX5LpPDEh9bgK8dMDSXDK15/We5mA=;
 b=lWsMR09NAk8TxkmRpuwFOn30WaGPJtFAf1Mw3fmymDQ9EnAAt0hpO9EwJ6YY1He+YgBwLMrfpFxttjn+4kEeGM8PfUkHLwSMkNNHfu2WOzDpcaEuJlRrl9ZQDEgOI6dnY1TPkGcqNbX7OP/p5opzirmjdHK4Jxndh7S+ROiU3vvUCmrkPcga4yNDIPVpbOy1kiuV7adYIv/DSt9dyXno6URM8f1PoeXpx1h/BfzsK9t2sZo70pcVItgMwePGv1YNN5FZZahfUeoPkoLTN7blw0/6U3hkMybhcghU6yKzrh0YZXBXttKawjUpXHphGa55WMACLlRTrlaKkQkKglKqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68c4f398-0494-e272-47e0-6803b6865f15@suse.com>
Date: Fri, 4 Feb 2022 10:23:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: x86: insn-eval.c's use of native_store_gdt()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>
References: <0d687d64-1cf0-8965-0569-bce27cf0a8b7@suse.com>
In-Reply-To: <0d687d64-1cf0-8965-0569-bce27cf0a8b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0064.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 575a34ba-9f8c-4f01-11bf-08d9e7c01188
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3406:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3406B928D4272FACBD410C08B3299@VI1PR0402MB3406.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eFtwcxduQTYLJ4iHxNRk13a/G63z8RmJ0KUHm5wDECmW3XXWugPABxEhcQEvujGkuJ3Ijovy48wnDFwk5G0YX273YJy5k589QckZ4p/pARDYfKripjDcmqMBf1wM0zct5B0AG55dLpS6xBDPB2ASIHAwDBvSL7MmUH7sUyU84c+5mGIXcmWgsXVop8R4NYmIEe+C/6yHvbXfbmP2+lzABv/MXyzYMA47t1+GsbS3foVUBIL9KKthbma2JsVNmqo7S6IWIuTSZm3Rc95AdPgmAWs77yR5yTFl8mrhxCnH4DcTkjQ2S9UNxOHKT1tuCFCCpgcHLeB9rni2tO9cIaqiP3JvBcIY3Xn9SF3zprlB7M6bA48/oLR5fo0+ZA97WS10W9fDnJIFyZcW1VyDJieKUYFueTu+E1KdedCeaDxg9Nr59W6aPWuYZD3+gUpF/ynG98hEIZsZqAAG3W9GcZPJwM1CZxZnEc4B0Dt3ktpCTB0ZXqqs6MvTRPJ48gmBQQh8dxsZzMfasUvYy9cZ71+15U7t//JnV8Yh3+PG395cLYHNe5l9fbdeMpgpdEdDtJMKiFlfpNKIFq401TOFivwvCs4y/SKBXZbx+OTlB5ePS78CS5YeVCz5tv29ythT7KDjQuxnCM9RaQULtbXn2k5O1Q3PeFK1RdAE1YtVaYefs3EBbrOmQaH0O5CFNCo4eThDJsKRXj5Qkh/XztqCpjitEp59r2iow650eTHoN7gJJo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(508600001)(110136005)(38100700002)(54906003)(316002)(6486002)(5660300002)(4744005)(66946007)(4326008)(66476007)(66556008)(83380400001)(2906002)(8676002)(8936002)(6512007)(53546011)(6506007)(26005)(186003)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yys4M2s0czBzMDhSanBhVmlqY2gvWmM5NUk0NjZmaXBScmhFMmpyQkFzcGVJ?=
 =?utf-8?B?YVBuWngxbzF4anJhdmhRYUJUaTJubmtPQ3h3K2JqVjh3MVQvOVhoZ2pMNmwy?=
 =?utf-8?B?c3ZmSmM5RURDVERhcFk2VDJBTGNab3hVYTlDZjMvU05qdGN3NFc4T3VJUnB6?=
 =?utf-8?B?TXdyUjd1UnU2VGxpMm9rWUJaQTR3Tm16bU1uR2lGblcxcVVXQ3RqalBROVc3?=
 =?utf-8?B?Rk5FeTRFR1hjRk1NWFROd05KUjBTM09kSTVVSFEwZ3QrWE9uS0IxbkJnS0Q3?=
 =?utf-8?B?WlcrVDZCWjJXYUNhSDgvTjZiMFJlSUE3TnlQTnZGOVpzVlhLUWcrN1ZUSkZa?=
 =?utf-8?B?WlZNOG5oSmsvRFZ3dU1tbDFHK3hNRHRHc3Q0cFhGM1hxNFE0aUJObEtYazJB?=
 =?utf-8?B?Y081NnExVkpQVU9Fb1RSaWR6Z3N4bFQ0SW1KbFIzYzN0UDM4UHBIUTcxV0pM?=
 =?utf-8?B?TnVrK1NMOGU4UGR1T3lqc1VDYnF6VnNqS05kMExvcWplUEY2UTZPMjFsMUdU?=
 =?utf-8?B?N2xaWWprdXNmdDlncGFyR0EzNFo0Y2FQNi9BcC9UOFVvbWI4T3k5dnJtOC9R?=
 =?utf-8?B?K2w4OVZ3WU1JVXhxVVhZUkxVWGtjOGxKU2szNUhYaE9weStwMXNldm1IQ1U3?=
 =?utf-8?B?OFNMczZySmpqbEJZT2RydVcxR1FxUjFDY1luWFFJUXZVdFVwUE9lNWhDSGlt?=
 =?utf-8?B?OTBBN0NGQ0ZTU0J4YmZHWE1iTDg4S3hWYVdYSVFRTWJXVmRQdERrRzc0aTF3?=
 =?utf-8?B?a3YwN2wrMW9uM2JMQzZ0SHpocFJldVBEVkxoQ21OV0VVMDFPa3F2WlBMbUI5?=
 =?utf-8?B?cnBZRGozNzZKdWcxcTFQZTZPS25zcXE3T1BBbncrSmlucDR6MXB1N2FZRFM0?=
 =?utf-8?B?aG1ObWQxN1pOQWhkSk1QanIrSjYrVU9RNTluM05yWHUvMXVpOCtTdXZwWjBu?=
 =?utf-8?B?TzA5T1NnaFBYZlBUMDNtL3o1ck1DZ2k0QVkwZlpZUHlzMGg4NUhXN013cmdj?=
 =?utf-8?B?WmZYMVVNclcydDRpYnlaM1JrbFcvZmZKL3JVSDJyemV0N2RRWWp1ZVhWMHNQ?=
 =?utf-8?B?OFhIemFEZnhvQlF0Yk1rLzFOVm1UNUNwbUtNc2x3TVFJQ1RoQ1EyOGZ4ZThl?=
 =?utf-8?B?Tk1nYmFqSDVVSGdNMExobFo1aEcyczFoU3RYVlNnRUlhWHUreFNTSUV1d3RU?=
 =?utf-8?B?KzFNdHRHQ3dodlhaNlZHTkEzZUtUeDlQOGJjZHpWeFhxa1owM3JkTDJjQ1lx?=
 =?utf-8?B?V1p4MTlidmhoR0pWOEN0cHYzczFJajYzSVU5MzhPaThGR2p6M1hzVWlId1Nw?=
 =?utf-8?B?ajJ3SUlXaDE0WnhYcGZhdHFLUEJvdUVYdGh0a1M1SmVPVlZJQm5vdVZKay9L?=
 =?utf-8?B?WVhXOCtxOTVCWHZId2FEM2tkclFOVEtJamhZM3lOYjE5YWV6U1dnS1ZWenhl?=
 =?utf-8?B?a0NidUFFaGlDQ3dyU2JpUmovanpkc2I0YW8wUmR2V1VRRXBLUWw1VzlzN3Ra?=
 =?utf-8?B?NTh4cGVwTURQdHI1Q2I0UGdXRm5KRnpDcjB2RzR1UGl0aVNLYWprYTFIR2c4?=
 =?utf-8?B?eTdBY1lHcnZRYUhLdVU0YnJRZ2pPdUErVjBBZWZqc0E5WURPYXhMNzM4WFpF?=
 =?utf-8?B?aVVEQThud1J4SGVTaytpMGJlb09yZE5uNU9FSEh4ek93V05uT0hiZmRvNTUr?=
 =?utf-8?B?dTRCRzE2SGZWcHFwSStUYnNNb0IwVDJJRTZZOHIyN1FzSjlRK0hjMDV4K0w0?=
 =?utf-8?B?VVVCb0RuTHhja0JlK2tCbjJRSnpzVFRHaWhyNlNrMk5mbUMwSUY0bnJvcTlr?=
 =?utf-8?B?M2hBNzlqR3d3M3N3YzFIZUFzeXR3NUJPSTFtUFQ3ZjAwMXFBUks1NjZScU92?=
 =?utf-8?B?WWhZVUZ0cFJ0WUVJb2J4d05jbnQ1YUIzTXE0dHRFWHJMbE9KVG5xK2xNYXpQ?=
 =?utf-8?B?aFUxTVlRbE9tUGhGNXV2SnBhUDVvYzM0VnQxZExtbWxaNnIxWitwVjFtK09n?=
 =?utf-8?B?ck1xUEZWZ2FKcGZHaUZTRGJBV2xVZVNsYzZ5VGtkL3U3aVpidFN1KzNxc0k5?=
 =?utf-8?B?ZWx5YXRGa1BPRnhvVnhaTWZkOGtCYU5yR1d3WExtNmNJa2Q2MzhBMExLR2JO?=
 =?utf-8?B?SnZ3VHd4NXJCamE4L2xGRDJkV3NoZElYT0pCL3JCbnJBQ1ZFMVpnNmlzNys5?=
 =?utf-8?Q?5JYHKnDaBpScEITJEroH0FY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575a34ba-9f8c-4f01-11bf-08d9e7c01188
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:23:56.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4YUwAmqX1JurWdnO/F6kfBzcy91QD/oX3+2Lih68/gWhkO9i9gvIVxEoR+jQYQ8XUl1gkC0ampfLfcEvelbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3406

On 30.11.2021 12:09, Jan Beulich wrote:
> I think it is b968e84b509d ("x86/iopl: Fake iopl(3) CLI/STI usage")
> which uncovered an issue with get_desc() trying to access the GDT, as
> introduced by 670f928ba09b ("x86/insn-eval: Add utility function to
> get segment descriptor"). When running in a PV domain under Xen, the
> (hypervisor's) GDT isn't accessible; with UMIP enabled by Xen even
> SGDT wouldn't work, as the kernel runs in ring 3.
> 
> There's currently no hypercall to retrieve a descriptor from the GDT.
> It is instead assumed that kernels know where their present GDT
> lives. Can the native_store_gdt() be replaced there, please?
> 
> For context (I don't think it should matter much here) I'm observing
> this with the kernel put underneath a rather old distro, where
> hwclock triggers this path.

I'd like to note that the issue still exists in 5.16.

Jan


