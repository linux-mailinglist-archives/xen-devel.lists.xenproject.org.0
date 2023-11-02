Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E347DEE86
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 09:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626783.977340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTWQ-0000LJ-0J; Thu, 02 Nov 2023 08:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626783.977340; Thu, 02 Nov 2023 08:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTWP-0000Hg-TY; Thu, 02 Nov 2023 08:57:49 +0000
Received: by outflank-mailman (input) for mailman id 626783;
 Thu, 02 Nov 2023 08:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyTWO-0000Ha-Gm
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 08:57:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e30530de-795d-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 09:57:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.17; Thu, 2 Nov
 2023 08:57:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 08:57:13 +0000
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
X-Inumbo-ID: e30530de-795d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZzWRhi4OwfASZB966pqSquMt4OhgHcKhWd3gxgYbYw0+nG+uFats6TFIElo3b9qSxl01bj4Eh3aQ+5b7MOBmpRdWxcsYxOPwBroSugz21Otv1XKgKqRx3FvisBlCTnEpTYb8/BKGi2nlkW5zWFaOG/tOMC/4MbPA0rAtTMrlBSdxpMC71FK9DOkHTjzZfq9C4M2VX5BUG7gUobs6IZQP2g2yV5ge4JAu+4d/T5AbRYoHVAAtc3B1oA0Yz6hPqLyS6v2Ria8kGplV0zxb6HjbWa66ymCw/pA256Ntx0AhJETyiuHEcqhy16Xrxbsx3UOD20Kdh7cSFHNv5hHkdoXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lx2DBSHOCtaeXWsGPxrWeetRuva96p2S+AOcz1No1g=;
 b=QUZqGdmj/M6xKDAyughbw2VyJIuiATs92iYjcFBwUhSGmNqKW0L8J3HF0RM1IDWtaSR/BzDkiZJITPRprsYNMEnmjT6gp6K5RwhRQ+e8Gup/tDlnrB8agR3vtd/mKmYH7fqLcR5fdQyBu14Jljy31FTjKGR/mN5vtJyuEOHz0sUiqPbOqdQnOwlqajhksypMZKVz9ZMendVQbj1J0/dRGmKGJaRW8ZDZlR3hQkt0tngSdZ2n0F5F+mTqFi6OnjzaAEO+opu0rcroBdz0fdQXDuhJ+a4d761GtCv+9zdEoh+BGvB47+Qsmn+k+JaFv7ow9fDnk7T7c05jQSn9kMWbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lx2DBSHOCtaeXWsGPxrWeetRuva96p2S+AOcz1No1g=;
 b=UUWDiiDYzUB9UAugOMIwDrEHNDTVYSzyW6/5hpcDKin6jIQYHZR7kFCLrDRameC44Rfy4f5WlU846Vq3xMvBRAcDGi94fKgvPnRsrwGCKTK9Gy8gKlk5KowxIvGot3Tzvp6XdWrXjHEtH31b/a2q3Kiss7SynrICIjTnwBkbmNsj5lqMxCFwfxl0IW64hP7MimgiqGP1BEbKe71UrkG82w741+4FsAuJVqxSg0fexVOrPNUNOkzDIH3hBuxicBqoIaMIU1k8CAXOQbFqVoBx9JyoSKEGilZ2SlrxLaxoSrSGJKBxc5OSZutlyELqM37Dh+Gdl++hNbBUuj+0WVpTyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ea5ad46-dbdf-2d9b-1d90-14ff20d94ab8@suse.com>
Date: Thu, 2 Nov 2023 09:57:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
 <20231101192058.3419310-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231101192058.3419310-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 0766f9e9-1baf-4ff5-a942-08dbdb81b4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j3VkxbThi63d9eMLkife1AK8l+5Oeyd6hBL+N9MuUDOBnNph/NOeC4pp6VYj5PhxqeNGeCssFXppxn4WefikXFb5Z5pUlXXLD8rhqAgI+KmAAi3HLCH2zDJgqReQr8u4MLJ2v0A2+h5eiH0CInhL8DQqt7YyAepK4Q40ttK50qfqiX3pD4pHZ262N13my5rNs31bQq16xK3SS5ckmo5N0aexGjC35aUzg/Oe7AmhBeFyIBHeumDBm3uOQBhi2kLY9elxohzr6Ir40IaZpHkPmhQ3HBYjbHnHKTSYMvuskNSed+EFBzeuiNxraJHtaO9WiG5v1vc13cgr6nwBnHsOo4uUd2ajZQNGN8IoK482zeY4fjQJkMX5FcV+uX71cO1sG1qRq/aZ64e9iQZuryBoZG9m2tKfEAqQ4HGMzkrhRvPEB0aOr+bg1k56dXbspFEMRfnXnKLNTr/GrgU25MVHsRJ3KFrSYAyU04D2Mgw/SFYvO0yicu0FPljyR+e7dOinWPW1ZmOGGr0+NkB6NiIArbx77SaScekrT0hAO1IlwMwt/AnseMb/VDJNbMxsZvMMfZyvM410Boohio0xpKZtpjA5vAgnyuVi2CrURDmxtcm3DeMbf+Nvc9XhQ5yyqXincziUDpqdc/ate27OLPEFbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(36756003)(66556008)(66476007)(8936002)(4326008)(8676002)(6916009)(54906003)(26005)(316002)(66946007)(4744005)(5660300002)(2906002)(478600001)(6486002)(53546011)(41300700001)(6506007)(2616005)(6512007)(31686004)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2xPSjBFcTVlQXc5UjJnRDdxSmk3SG5yb1NTU21TMFA5YlVTcG1GYWxhd2RB?=
 =?utf-8?B?ckl1MWpTcVpnN0svVUtKY2RUc0NHRjBJcWZWVFBRelVPZXpRdmNvekdIRUor?=
 =?utf-8?B?NS9nQ1NPYzVPbmxkUEZLUDBWVXFKbVdndDJYaVBIelJGNU9zby9PWExGdTdv?=
 =?utf-8?B?K0dFbDcwSmhmQll6TERSUEhtaWhmV0hGVWR0WllEVi94MG1iVzlvMWZid3JV?=
 =?utf-8?B?UTNsbXoralZHZXYxU21YZllqNG1naE1kb3FiZ2l2b1VBYXlDcU4wZHl4YVVh?=
 =?utf-8?B?NG04YUhydjRwSEt3WGU1OVBwZDNCbFNxWVRCS0o3ZHlXTlQvNDc2cTJoZmFp?=
 =?utf-8?B?SzlUV3BGN1FEUzJuVFIzUVdTK1dINVdvd0Q4bEozMGlCV1I4U3V4enBYaGdQ?=
 =?utf-8?B?Y2l1a1daZzVobndycVJLckFQZjEwUU9qREFnTHBoR2U1Nnp1SVVkRmNHZlpU?=
 =?utf-8?B?eWxLODJ1MFdMa1R4MmZlaE5KUWhnMUpCL0JjUEMwV2IwYWdRR3d3WHhCVnlW?=
 =?utf-8?B?Z1ZXV1hlM2JYZ2MrT2VHT2JTbGtYd3RrQkFRa0NwOVIzb3FFaSt6eW5YVnFH?=
 =?utf-8?B?aFA0SEJjR3FjaUJHUmR2NU1kY1JGM0tWdlZCVUV0ZXFsR0tJcnVWSDdMUFNS?=
 =?utf-8?B?ZHJkRk5uZEI4eStKdUlXRHdNT0hWSklIeDdFdnczc3dYeUZPeGxJeE5yenZS?=
 =?utf-8?B?Z3BSMUFTZTJDak5CeEJuWXZiUXQwb1ZnbjNRNXdnYldJdkZ1SkpxNGRTN1pC?=
 =?utf-8?B?dVNVakJtMEpueENGOXRhSE8zV2lZRDZEUUdQdjN1dmlBL0wvU29GS1dmVzQ0?=
 =?utf-8?B?RDFQN3FCQ1NGYXFHQkNFV29MMkhWQlR1QWVTRy9Va2g1NUNSR3NxY1BiOWVu?=
 =?utf-8?B?Ykg2bktzWUF3YlR5ai83M0JvYWczZWZEL1hEMlFGVldsWVhuaytQcUxZakZx?=
 =?utf-8?B?eTJnejk2M0xUbzhNMkJ1S0Y1d1hlSUY4Ty9ZNFpTNWROa2s1Nmx4d0ppV0lK?=
 =?utf-8?B?MHdYd0JrWjhEdTJzdmZwUmJmVS9TTWEvaVk0NVJMcThmWjFleU1KZ3Fza0NH?=
 =?utf-8?B?Q2NTMDUyS0o0SkswcXRCbm0zVjFXOHJuWFpWN2Rac0JEQk1XSEZRVmN3UTJJ?=
 =?utf-8?B?M0l4N1J6MzlkRnVXU2xwSldIcXdxTFRPdnNRUnRXa2lReE5mY0Vld1JrK0RE?=
 =?utf-8?B?TEZncDhPNjd0MVY3QjZPWWNSYXBZY0psYTRiS0lXWm1zaEdJSzV2Ym55a3Z3?=
 =?utf-8?B?T3dhaXpaTHpNTzk1Q2pyU2NCbVg1RHplcTFmWGh5MkJTRWU1Uk9ER3c2K0Z4?=
 =?utf-8?B?WU5YU3QzdmFYWCtNblpSQ0ZXVkxZbXNHd1AxdmlyQlkrUUd5OUZBTlJsUjhO?=
 =?utf-8?B?MFYvbjYxR291RkVpSVA5VVFXNU9qaWpXSkEva3hvRXJZWHQ0TlRxb09JOXZ6?=
 =?utf-8?B?WjNyLzAxUytpM2sxdDRSeVIxQXlLTXQ4c0NkT2ZzdkliWXhTTzBMYklaZTV2?=
 =?utf-8?B?bmZ6Z1IrVXlKT0pWclBZY3VFTndYTUc1eDAwOWp5ZEhXbXVMdVFJMlpGVGdt?=
 =?utf-8?B?MmFEcTliNXhWQ3FGMGtad0htNkZZbmQ1M0MyMy9nM2V3SGRMZFNSNVlEbStq?=
 =?utf-8?B?THhlOGkxLzIrUThmV3VYVGE1cXJJcXFvS0dBemJta2M4S0NDbnVrVm9OYnRn?=
 =?utf-8?B?dTRneThMSmRZV1pxcmFHSmcvb2JCZnMxKzMrTlpBOWM4a0c0OVlPeTFGTXFD?=
 =?utf-8?B?V0xmRHlGbkl6Mi9RVnloYmFwNDFsUFN0aEVUSWpzem9SdTBTT1Z1dzJKenBn?=
 =?utf-8?B?VXh3cnh6NzFFRlVvK2tqbWpqZW83VVdDWERkMXdqdFhTYnhrQ2pWSTBoUlg1?=
 =?utf-8?B?V1p2RW1HRC9BVVl2WlFMWmk2bnhZbkFldXhQTWZoU1hUcE5PZHlEYnBab3B2?=
 =?utf-8?B?QnlCa2p4UUZrcGpYNmdnRGEydTNwbmFwSjJFV0lRMmdyVXhYMUFDaUxZNUoz?=
 =?utf-8?B?WitmUXhORTdoMkNyNTltdm80T1JZL09SeHBxSmsvamxpaEdNQ1RBaGF5MkI2?=
 =?utf-8?B?aTVSbHJ2MmpXRDZpZVdVa01rWlBWYUQ2SFpqRzJ3ZE9BckplOU0rc25xcWpq?=
 =?utf-8?Q?i/L7Li2aOlngT8RQxbO/NeiJR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0766f9e9-1baf-4ff5-a942-08dbdb81b4e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 08:57:13.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82q+k4CEto+mFEK9lxl/2vDanTZkkROk9G/jhpkZjwYzKpH2NWaXNU6DqUgjAXuxKShnYi+kCNnvn8iYQu+DvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

On 01.11.2023 20:20, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4097,10 +4097,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>      case EXIT_REASON_MCE_DURING_VMENTRY:
>          do_machine_check(regs);
>          break;
> -
> -    case EXIT_REASON_INIT:
> -        printk(XENLOG_ERR "Error: INIT received - ignoring\n");
> -        return; /* Renter the guest without further processing */
>      }

Wouldn't the printk() better remain where it was, and just the "return" be
purged? Otherwise between here and ...

> @@ -4390,6 +4386,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>      case EXIT_REASON_TRIPLE_FAULT:
>          hvm_triple_fault();
>          break;
> +
> +    case EXIT_REASON_INIT:
> +        /* TODO: Turn into graceful shutdown. */
> +        printk(XENLOG_ERR "Error: INIT received - ignoring\n");
> +        break;

... here there are various paths which bypass the main switch(), and hence
there would be no trace left of the unexpected INIT in certain cases.

Jan

