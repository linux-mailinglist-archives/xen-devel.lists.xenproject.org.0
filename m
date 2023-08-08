Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81AE773A6D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579857.908029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfK-00041j-Vr; Tue, 08 Aug 2023 13:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579857.908029; Tue, 08 Aug 2023 13:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfK-0003yG-Sw; Tue, 08 Aug 2023 13:22:26 +0000
Received: by outflank-mailman (input) for mailman id 579857;
 Tue, 08 Aug 2023 13:22:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTMfJ-0003ij-Ia
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:22:25 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c943163-35ee-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:22:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8052.eurprd04.prod.outlook.com (2603:10a6:20b:234::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:22:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:22:21 +0000
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
X-Inumbo-ID: 9c943163-35ee-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyAPWua5zCdja2FoLnbNhQRPl3z1vuQj1DMYL52NCjwHJAVAiggMaT62rcctPVBNFjLSgI88yCHqoQRb7LIt+mi3AIPGUZCi1V8tAxaFP4P7wOGuRMQqZ6po2n0y0XxXKfOtuqtzU7Jr5Qg22ORKy/hV9s8EKtgjKa/wDbs76cfqon2n9hibuFcwvN3SdhhU1RQmNvv7rm0dAy7oLJWWYbfDQhoyLSD8Q5z/k3rDcl0MZhScUTNJMZxT/WlONIB90H6xHm021O+8A9h+CqideoZT9YfyqB0IoFFB2S2iYWaSaH8TpGKkE3XLgyBdlmWznHv74+1p9MNCfJIP0/kEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXcdRd7ipB1pLLnNe0yBmXkY6bBajuyKhto5TUY9SDY=;
 b=RP/2mBoj1qbXJlvqHJNBAYCHstOvVc4EO6CM9sC/MSqMlJwnPMOmddioDoKYIFbb3kf7SaG6LCSKHf7fEKYXXAVjr9Metm2/etVhCWO2acQ49lAeXFuslZj2aaqWYfLWN2X3+Ae9VddJxxiz16wGZgHJf+dMxmd2Z9Vp2KiA2ZNM5GxcOvLo5jDyXmFPEhFIC4vnaZK4qzl4XTTVmbKhI9iyTZxn+4VFQVs9SAtvx5seAnfYzYjKuOEicpXuHK7Y6VQVgY2QXb2ejb57XwOEzqsgZxDrzCJU5p7iEgNpJjvJBqIPAxaMUWt1e8pqeFTv+swAEzPjddN4LP8XZbSE8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXcdRd7ipB1pLLnNe0yBmXkY6bBajuyKhto5TUY9SDY=;
 b=Ro70st6lFaSyU1rN7o2pyFAdPY5RYeOhYYnT/oIdbsHndzTL8W+IFxkPDiVxfEqlmbEZ+jZXv1xxFfNFhKLsir+atsyAOYss+vFUr3CTDarMTHZ5OxXb/+B2KUmfzCNrWE+o48li07lT9wTkfxjI9RC4s7xxoXez0vLWJHvd0v/x/m0wmqaKKM4o5ncd1XGPIbaXTiyl0akOFPLB7nGI7MB7HwXP0mwru5kjxlEoRawkv5pND93DhHi8xdcJi1bRnJtTmfNqiC21kvlimWMi1vgsgYouqq/G6z8IrT5NI4yOYlxvRdTff4orsELwTatclZZlrI2EzM14Bg89/OLLhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e5f208e-7419-b16d-c705-592959dc0ea1@suse.com>
Date: Tue, 8 Aug 2023 15:22:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v3 1/2] x86/vmsi: rename variables to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
 <605687eff99db7181ef6c05bce671e20f194b46b.1691488505.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <605687eff99db7181ef6c05bce671e20f194b46b.1691488505.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 61298191-510b-42aa-0b4d-08db98127f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TTWOnXNa/2yloyvnNKZ4WJFl8yBX0CiRydM3Ioi1kXnQU0OMu8LMsWOZUrlObdWaVQNHLdWSUgP3RoYi84tDpNq2CG4a5TwuOKZvlr/h6mJQljjsqWsrIazu8W74j1zeiH7599c+/tlUAspxrZvAXUUmmfd3Ulp6oa+3ApRkPQTnfoAAFw8+4MF+2ijh4sF5hJZd8AVLhl4APaJTncW3ohncwRDur37YnaxGzGu/+p1G+A8cmm1jQvZ9ChcnzTnoJvKMahEMDGBeT6IMaOFPSyqjH7PjXvkcAdB/vDhFGzjxYD7cAc4fsxgKylqvB4Ak4OruUKt5sL94VEHKZBYgKoY7YfRrq3PY9aXKhqICkdQSPUVf9E3NWRUk1yUvPRGxan4MMlllevlAeblD6eie9F3JIwG9oWTA8QmMFM7EmtNulkj7KbW8OZQd0FkesGA7lKKRDum2gXrCGTL2orP4uRVqP0WqxwT2OIl8Bdcls5M5qAtLthnGRNb5pWw7fhp+s4Q23DzHXcucGgCL5YT08D9lijKGvftx8aQnIgY34PbI+lc2mglyey4fx2juoklDI30P5kRPDTrYynBdULQIyWt+/h4UND7gneTlNcgSxumBZIi+nzfK9dpBKpN01miltAzW9irdJymkxRnKY8XvoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(396003)(366004)(346002)(186006)(451199021)(1800799003)(66946007)(6916009)(2906002)(66476007)(4326008)(6486002)(6666004)(83380400001)(5660300002)(7416002)(66556008)(41300700001)(8676002)(316002)(8936002)(38100700002)(2616005)(54906003)(31686004)(478600001)(36756003)(26005)(6506007)(53546011)(31696002)(86362001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmxxYjVYSStBQXppRi83Z0tJMzBVSnp4aHBRbFRaZ2tOTW84TURKWXlXYWc5?=
 =?utf-8?B?U3hmUW5FVUsreDVNa1dOQ2t6KzYzYlM2YkFaUUN2TUpNNGw5dzUxTVg5bWlN?=
 =?utf-8?B?RVdROXY4YWJYd2JzTjBudWcwdFNHQ3k3OHFmZnRrNGF3TFdXeE1JbTV6eHNT?=
 =?utf-8?B?VjMwSnZDQWJxR0pxVmt3L1BlMURTVjdrcjQvdTRWaEdxRGdQOStPN3VFOGNr?=
 =?utf-8?B?VW1UNnQ5dTd3VkVNQ3VBc253cnk1cmEzSTJVcGd0SnNDQVNBZXk5UUptWnNn?=
 =?utf-8?B?cUZOeEZnWEFFWUlTMTlGWlhpZ2hPNm9FMDJweWhUMHk5aWhDYUdxRG44Sktq?=
 =?utf-8?B?U0lWZC9IOFl5SS9naVNVYnNPdUF5NWg5T2xvRFhDZDlFZ1RXbGd0RzFJcktl?=
 =?utf-8?B?SHZFa3J3YWYxQm5OV3pxWVp0UDFHMTFtSTZrTUlsMVVaQ3hsVFNBOFhEeU1P?=
 =?utf-8?B?cXZEUWU4dlFpWGNKYWtibzZhS3pHZnU4aXVmeFRWaHd0cEd1SzhIZGE2dXYr?=
 =?utf-8?B?K2dHUDFWeG5YYXFuVE4zaTlqM2wwUVdXeHBXQW1lQllUMmt2MVBIcHFzY2p4?=
 =?utf-8?B?c1IwTEtEWHdHL2JFSURJVVVNeDdJMEdqaTFjTDhYcUFWUmVGN1JsNWtrZ1dB?=
 =?utf-8?B?Q042eVJKcGg2RmpPeTR0ZnZ0NGZGd0Y0NzNXVm1zaE05K25FT3ZXNGhNUXRZ?=
 =?utf-8?B?YlgyK21na29kUzhiL3FVRjNBYm96T2xLSUVRdjg1TFhzejFyaENjd20wVzNs?=
 =?utf-8?B?a1VMOEgxVTVwMTUycUk3bTIwR3ZBbnJ5UWhMSVVkeU13K2JQSy9xTm5qMGRW?=
 =?utf-8?B?aE9PN1JiRzBuTmw2dFNqN3FiTUxHN01CSVYzN0hrZWtRZnVLemJIYmpIN1N1?=
 =?utf-8?B?RHBHN2UyS3QxS3U5NHhyRG1nbkNOM0Y1L3BnN2RFTnBZTnFiSk90WUxibVg2?=
 =?utf-8?B?SEdFa2pPbkFqQjhZTHE0WnUxR3RXRVFoVjBIeEFpc292NG9hSXkrWFBibHFa?=
 =?utf-8?B?aXE5N1dnVXNvbm9pc3FHWnBXcWorbWJXTmRXS2owSnp0dlVkUnpJdnZ2L2l4?=
 =?utf-8?B?djBGcG4wMitQMFMwTS9qUVlKc0MyLzJjQjR4ZUIxOEkrblRSbmRRZCtqOHlH?=
 =?utf-8?B?YlFoT1A2OE5NYVFRdGt1SmtxOXRRaFRIWmFOckpqekNpQVN5OVc4eXV4YVdX?=
 =?utf-8?B?VHNERGpYZXBMaU5TNEk2V0dxb2dVT2Yyb2M3Nk15N0toaHJ0ZzFQcFo1WTIy?=
 =?utf-8?B?N1BLTVBUeXZOZkE5WGhoWlQrYk5GdnF6Z3RTWGlFdEFyZkdQRGk2VGdRc2xF?=
 =?utf-8?B?OUJPS3JiMlJwME4zdFhpMSswR1FUazJRYm9ITmF2bEFtdkYxdXRSa3llTkQ2?=
 =?utf-8?B?bUFvZE10bGZFc1d5Zkw5eTd5cHdqOWs4NU1OQTJOUnNmZ0Jjd2VmNVRScmFM?=
 =?utf-8?B?MmdobXUxQUpSV2hyRHRGbnRlQkMzRVVEMUZsZlBnMmsweHdMNkJablZNSS9p?=
 =?utf-8?B?dnMvZ1JXYUE3QWNDVmtNSVIrb01CN3BXNWRtSkZLN1Q5T2loZlNMT2VUU1hK?=
 =?utf-8?B?ZXBmZ1QrRXppNEx4UU8wV3BERzY4UnVkWFpHd3U0a0FSZ29Zc1RQa1FVSWVM?=
 =?utf-8?B?QVFKV0JUK1pkMmdpNk9CVkozdzl4YmNCTnhxQ29rc0JjQkV6ZGFaVi9NbTJm?=
 =?utf-8?B?VU1zNnVobTZlOWY0SHZUaVZFbTA0azhnWjVUOGl6clBiYVg2eWl3MU92WjNW?=
 =?utf-8?B?blc0d1V0aDdNSzFIeTl3dnp3RVNDd1I3V0xSczdhdEhJcTBaeCtuZEpzbEYz?=
 =?utf-8?B?bXFSMnZRT0p1OWdMdzJDUHdwc1ZGUGFWbFZ6cG1QS2JHVnNmaEl2WERsNWp5?=
 =?utf-8?B?cFc0MURFdFNIaFRGNHlIeGE4QXg5R3BMcEt6UDZOa09CVys4U0ladDZwczhv?=
 =?utf-8?B?dGZ2VVgwdUNWZTdIeThtUWNEQUhNTEIyTVRFaUdVb3lQYkhxNHBDUkdTNTdC?=
 =?utf-8?B?eHRmNUJ2TENVcXRtZjZ6KzlIRVBOQ3JIYmpxWXlMV1pSQVRxMUc0alZTRXp2?=
 =?utf-8?B?ZFVJN3RFamFZeWxaMnB3NFVvOHh6d2R5YzI3Z2djN3k4ZUFDNlpNNHN2N0Np?=
 =?utf-8?Q?cE2ANH92/mUX65THpvnU1dpn8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61298191-510b-42aa-0b4d-08db98127f03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:22:21.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Df371Tflgggjh0QrSEvwQkWkH2s/oz1/eQTTo5ndeFfYJcb0eqH5hx4CCzeYkVwrH3tbFW02C7YKrQJ8CoXyUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8052

On 08.08.2023 14:22, Nicola Vetrini wrote:
> The local variables 'irq_desc' shadow the homonymous global variable,
> declared in 'xen/arch/x86/include/asm/irq.h', therefore they are renamed
> 'irqd' for consistency with ARM code. Other variables of the same type
> in the file are also renamed 'irqd' for consistency.

I'm pretty sure I pointed out that Arm uses a mix of "desc" and "irqd".
So "consistency with ARM code" doesn't ...

> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -281,7 +281,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>      unsigned int nr_entry, index;
>      int r = X86EMUL_UNHANDLEABLE;
>      unsigned long flags;
> -    struct irq_desc *desc;
> +    struct irq_desc *irqd;

... require e.g. this rename. As mentioned before: Let's limit code
churn where possible, and where going beyond what's strictly necessary
isn't otherwise useful; there's already enough of it with all these not
really helpful Misra changes.

> @@ -462,7 +462,7 @@ static void del_msixtbl_entry(struct msixtbl_entry *entry)
>  
>  int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>  {
> -    struct irq_desc *irq_desc;
> +    struct irq_desc *irqd;

This one indeed wants renaming, but then - consistent within the file -
to "desc". At least that's my view.

Jan

