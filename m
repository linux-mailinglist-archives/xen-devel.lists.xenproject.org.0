Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FE4C2DE5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278303.475495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNEna-0003wn-P5; Thu, 24 Feb 2022 14:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278303.475495; Thu, 24 Feb 2022 14:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNEna-0003ud-Ld; Thu, 24 Feb 2022 14:08:50 +0000
Received: by outflank-mailman (input) for mailman id 278303;
 Thu, 24 Feb 2022 14:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNEnZ-0003uQ-8p
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:08:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4866d23d-957b-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 15:08:47 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-OQOdiJDrMB2PcIafJHdfvQ-1; Thu, 24 Feb 2022 15:08:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 14:08:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:08:44 +0000
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
X-Inumbo-ID: 4866d23d-957b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645711726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twAYqpfIAWzpQBv+rZQzOTUhOvvrZrIE/diNjvuKhno=;
	b=Uxdrr31i5FBXXANoo+Nbmgz+njdjDSlhK+0jD8QNFY20K7X88MeFNxPwY/ZjEyPeX4HOZT
	AyD88m32qSuJhqOf/PI3wSoQrzbVL/QPSdmBB356VeRACKknZF0ZmMFELrP3CMY/yP6bpo
	jwoiNFaMSTwuHEXFA33ho5bKaBAxw+c=
X-MC-Unique: OQOdiJDrMB2PcIafJHdfvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou7y4gg5SFQctGjGmWJ6S52jla420mZXDRuo/FrhXCXLzOELgjKNz+K6KsaOUKBclo7fPNthnVV+3Bn89d6d9KBaa1QkbCL6loJ0XXD0lGpu7FynnLB8r1o/UqmYIZdueG41a70paPgaUwKY41Th+tx93L/wVQz0aFMB5L9sTx9xjt3y+NTAAEya4WIlAfFX3pK6xBX8J8qYCCeAwjhYsLuGdkpuvRsfTaXd0LOzKpWAJBRgdKAifu4rCxov7SyAP3FKKuByL0w+H5tFn60NEtrxCit/1neL/+FxrIWpZ6scL61aR15zK0YbGf7alAEA7qcDmcv7G1pZSKpHfdreYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twAYqpfIAWzpQBv+rZQzOTUhOvvrZrIE/diNjvuKhno=;
 b=cHrkvCcNM/+ZH7T0D4u+EH9/cSfIHJuFXg0OCRg6bPiggRitRzs+B8mKCp1Fge5l6zoWcrpAMWc20iC/Ai6OZwtLlxa95DEliO9x1JWJkqzIKgWMReXKvFixgIejUeB0TJAInzbRGAFJoAAopvz/DSAtP1waDM8ug+gO7xhLRJs3zb2wtNOU/rVLssMhlk4YC84npuKIupzbJrgIdyO1AtaS5ftNnk7/RyNTk3iLsk01d6sywe4s5CIbrCLCY/7p+F/nGZa258djNj8bhn2lyOg2AHR+Yp/k+sjdSHEmiLPMRrlauy74xc5rOiRDcbT66RI+b2JiaysDDGkJwaGQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
Date: Thu, 24 Feb 2022 15:08:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220218172943.12182-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0021.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a92330-d722-45c1-de7c-08d9f79f2af4
X-MS-TrafficTypeDiagnostic: AS8PR04MB7557:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB755798A5D145B8936323F094B33D9@AS8PR04MB7557.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	scZtbggFA9uIIDXqmSyzHYXoBWtItiETmWFxOEmo59+IKU/rlZzeAu/Uan+dBvuPXYmIPtGFZCZG7f3a/GyBV0pvJFS51IOpp4tJZlk4xxI6GpaquYx5R/8O5WXaZXVFwdHFtENLjzkcSynyOQklDbzy2J68ivJWNvnUSsrgamCJSILjPsgZq4k/KOL7fFeN+OqKNpngcLVNiLYOeuq2K0DtuE4dYO8ygEvbTiooypfRc5nGRlmVL2eFTNbJjx5nO7F0YJGXCCQBor6W2WYuNUoy+NsB+y1a2e9mpoOnx8lCnrEtgbMR0XbrzhBTWeIAoIYkOfYMe587To0c7UU/ndwmd1XX4t7SVXE8SjgIj3rtwagdBBRALvzZnBWNZ+lHyLiMysxG6ydFhMtETjeg95zuFd1qCpQbxgzdgnxWHzIcGDqnnsJew5smDqH3tPx8SQYujySkZai0HIMlNn6a9h7fqaZdUkzdI8t+nXQp4pYVkbEvHcFaubwVDdIoOa+QerkhIJuu1cHpoBz5RfW768dOtA/Ba4vFfOGt/kF98q94rb3t8o4papdRiS3u1GhHYQbqGMqvTLzAgA0oP+GTMHRBYx3oLPOlYhsYrgsJYlIcNqPk5utIsv2hTzeaQODrBMHSFdH/AMOY10T1UNTy3YYLtBQKYXTNvPwq5HIC8acnLOtkMb7YJSfw6dHGh5tW+G18TYH1R6Q5K0dIH/9ywTSEPxEi8B7ygwZ9xutARUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6486002)(508600001)(186003)(6916009)(6506007)(53546011)(6666004)(36756003)(316002)(26005)(54906003)(8676002)(7416002)(66946007)(2616005)(38100700002)(66476007)(66556008)(5660300002)(31696002)(31686004)(4326008)(86362001)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHYwMUdtSlFod2N6RHJlajc0eUJTVCtsVksxNkg3SzVtNEZGckEvWlYvdDdU?=
 =?utf-8?B?WWpvai9FVU9mbm5DdGY1eEp5VU44NHJXc2VrUkdlSks2TzhQSmpVWDE0dStV?=
 =?utf-8?B?cnBoNE11R3VNd1JTVlE0aUpmWDlETUcxanRPVzhJcTd1V2d3M2FKRGphQkNu?=
 =?utf-8?B?emEzb0RselpHRzhub1phY2huQjJVdGZDekZFTTlPNUwva3J0a2xsODFPUFZ1?=
 =?utf-8?B?SWlnbW1semFjcThpZ2NMNzBJUmRjenlFcWp0WC9rVXpVdU4vNlVsMjBnam9z?=
 =?utf-8?B?c0JYNFpXY1hUNlBUZEw5Y2ZESEtpOTBSOHFaRkdJQUtkTkN0WkFiUXRvVmpa?=
 =?utf-8?B?eTdNcHZwaDNuM1gwUENraTVmMHpaZGJmY0hRVk9Qa0NycmVYWjVZdUx3MEVV?=
 =?utf-8?B?T3dRRmMxWDNwbk5MWTFmQnFiL3l3V3BNeDZuMk5uZ2o0aWUrcHk2TVRjTFgr?=
 =?utf-8?B?M0xNSjU4N2xPb0RqbVkwZDdCVDBzT1hYU2ZXVVN0NDJQM3V0U3ljNTVmclhZ?=
 =?utf-8?B?YTI4ZDhldlBKRDlVS0prUXpPYWljVVE0ZkhXOWd4TnJWVHg4ZkdnNXRnM0Zy?=
 =?utf-8?B?MUdPcXpaL2pqbC9hRVlTOVRZdDRwZFRYN29wUCttbzliQmUrSDBVRjZWTFRX?=
 =?utf-8?B?ZTd0YW5NM0w4dTdoemFHVDlKN2gxdi9Fb3NCRWU0aWVkSXFtQWY3ZVdjSmZO?=
 =?utf-8?B?YzlvdnhRKy9LdjFJbmJta09NSENNUi9nalgrRUtCbDFUeEVwWE1GeDhTNnAy?=
 =?utf-8?B?cGtrWWNRMWdLU0lxbDUrNzJHVVJTT25Hckx3R1VJRS84QnZROGxmUFloWllJ?=
 =?utf-8?B?MWdaaG1JTzlINlZJRk5CTEtPSFhDTmdOYzU4VW45dldSTWhRZmlpQ3dpaVlq?=
 =?utf-8?B?RFRFTnpDdkRPT2RHaTRXb29VUXFaOGx1WjhDTkUySG9UYjFJZFlueGhDYzNx?=
 =?utf-8?B?cWc0NG5SNTQ0ME9nUUp6MCtJZFFtaS9iOVNOUEFzNTQ2MDNMSjZCcVBTQ0o1?=
 =?utf-8?B?RFF4L2hGcEt0M0dEbEl4WG9mUU5vVDVpS25UVDBZWlVVODd5a012Q09QK2VL?=
 =?utf-8?B?ZzVDS2tlcDBrcnVlaHhYajVOWXM4dmhJWHRwOW5pWW0rT05WSy9aa0NLRS9h?=
 =?utf-8?B?MEt6dlhlSDFyRnhTdXhWNEd3QkpsSHdtSjNWVkVhUE00M3lQa25YbDZrdHEr?=
 =?utf-8?B?T0FCbmVJdTkwRlVzRkJDU2NScS95WjNscXc5aUpjNmFUVW5RaHZjNWRsNnVD?=
 =?utf-8?B?QmZVajdBVVRiM21CUExwcG5ZSHNoazhHNEt6ZzBoZVl3ckkrNEpOa1dOVUYx?=
 =?utf-8?B?azdNVG9NVlNtSitzYXNsMk5HRDhaZUN2WTRaZmZqdnF2ekYvZXl6NS9UWHdk?=
 =?utf-8?B?a1Q0WVlnR1N1ZkJjMFlPbzUvcE85cDBMbmNVUFJ6MGQxTHcyMHNjWmhpeXQw?=
 =?utf-8?B?OEUvN2NPSHpnMDVmYS9PV0JDclBRSUhJdGJ2c3QrK3NqSkhrNCt1VUc2KzI3?=
 =?utf-8?B?QUc3eHBCUUt0enFIVWNnWWtaMXpEdDRLeGlabTQ2Y2gwVXRzNEplQ3BjTjlk?=
 =?utf-8?B?eFBZZ3MyMjdBaHhHTVdwcnIrN3Y1TlZvUlZXeUYvKzJKZDVjQ0hPTTIxM1RL?=
 =?utf-8?B?VlhIRjBvdHNWSVdxTXNYQVdHbG95YWg3cllkTXpXYzBmOG96YkVoNU5zQXFx?=
 =?utf-8?B?UisvYTgzS2dDTjdWNFcrZGtqaHp6ajZyc0JGUWd4RVRQN2hoYlo2MDdNNWhB?=
 =?utf-8?B?WkdaNk1sUUVoN1V3Y203TWVCNy9JWmdmVTNLS2lJMnBGdnlQMDhiNXpOQmVn?=
 =?utf-8?B?c3lHQTRXZE1zaG1oTlNTb1g1MUZtWC9ZVmpFVDczYUJEd0cxTmptMXFLaVhM?=
 =?utf-8?B?ZTJodU1uTDUyTjJuT1lkdURpcUptd3ZWRXNCQktscXM3ekRJbzliV25ELzdI?=
 =?utf-8?B?SXNYQmdITCs3VjUzbkVTWUdaaGE0Nm1Ob3RyQkk1NkpjUEJxRjlzSEMrTUww?=
 =?utf-8?B?bFZoUUQ5dThLd0c4eEZ2VVRSMTFheFlqYXBLcXZ1WDBvOU5yZDQ3RkVxVkdK?=
 =?utf-8?B?R1o5cXpEcXhiaGJrTGZtWFNNa0dVZWczQ3NkQmYyK2JyS1V6S2xEa1dweThy?=
 =?utf-8?B?VmpxaDJyc3JueDVrVWVQR1hhdTVER3l4ZGgrREMrVXBvVk1Tenh1MHJuNW9M?=
 =?utf-8?Q?SeZf+5ggFG3IqYnw3E5GwjQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a92330-d722-45c1-de7c-08d9f79f2af4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:08:44.4530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wLWyIRXncu3ChdX2b4vkDr1ksXYXlaQ1YQwf7C0J0M1zDjfxEr+T33yHZKLETGoViP7E9KugwPDQz09XJpsGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

On 18.02.2022 18:29, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> v3:
>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>  * Have assisted_x2apic_available only depend on
>    cpu_has_vmx_virtualize_x2apic_mode

I understand this was the result from previous discussion, but this
needs justifying in the description. Not the least because it differs
from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
vmx_vlapic_msr_changed() does. The difference between those two is
probably intended (judging from a comment there), but the further
difference to what you add isn't obvious.

Which raises another thought: If that hypervisor leaf was part of the
HVM feature set, the tool stack could be able to obtain the wanted
information without altering sysctl (assuming the conditions to set
the respective bits were the same). And I would view it as generally
reasonable for there to be a way for tool stacks to know what
hypervisor leaves guests are going to get to see (at the maximum and
by default).

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>  #include "domctl.h"
>  #include "physdev.h"
>  
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
>  
>  /*
>   * Read console content from Xen buffer ring.
> @@ -111,6 +111,13 @@ struct xen_sysctl_tbuf_op {
>  /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
>  #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
>  
> +/* The platform supports x{2}apic hardware assisted emulation. */
> +#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC  (1u << 0)
> +#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC (1u << 1)
> +
> +/* Max XEN_SYSCTL_PHYSCAP_X86{ARM}__* constant. Used for ABI checking. */
> +#define XEN_SYSCTL_PHYSCAP_ARCH_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC

Doesn't this then need to be a per-arch constant? The ABIs would differ
unless we required that every bit may only be used for a single purpose.
IOW it would want to be named XEN_SYSCTL_PHYSCAP_X86_MAX.

> @@ -120,6 +127,8 @@ struct xen_sysctl_physinfo {
>      uint32_t max_node_id; /* Largest possible node ID on this host */
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
> +    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_X86{ARM}_??? */
> +    uint32_t pad; /* Must be zero. */

If this was an input field (or could potentially become one), the
comment would be applicable. But the whole struct is OUT-only, so
either omit the comment or use e.g. "will" or better "reserved" (as
people shouldn't make themselves dependent on the field being zero).

Jan


