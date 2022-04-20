Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E550859A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 12:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309082.525118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh7Me-0003aF-F6; Wed, 20 Apr 2022 10:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309082.525118; Wed, 20 Apr 2022 10:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh7Me-0003Xf-BC; Wed, 20 Apr 2022 10:15:12 +0000
Received: by outflank-mailman (input) for mailman id 309082;
 Wed, 20 Apr 2022 10:15:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh7Mc-0003XZ-Ng
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 10:15:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb8b3aa1-c091-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 12:09:09 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-3ok_hlvePsKhFJAtCevB_w-1; Wed, 20 Apr 2022 12:15:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3505.eurprd04.prod.outlook.com (2603:10a6:208:25::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 10:15:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 10:15:06 +0000
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
X-Inumbo-ID: eb8b3aa1-c091-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650449708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5m3438VyS9HHNrGeG1RmloZAWK7+eBdkG3jaGsrzOzk=;
	b=Kb9esCj6LXZqCF5gLYZCRx3bRKka9eJN9bzh69zwiY6WXN/VNGqpiHFDB45gZ9ro4bSIO1
	zOgtqccUIAt8Phztk2TngYW8EtMvzxgD9LOMYaANlVatH9/prIwuETOPQCQX6w1oxL+pNu
	CjPRjbWkD6WdyO1CX1TxXcBMTGYDLaU=
X-MC-Unique: 3ok_hlvePsKhFJAtCevB_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMB66/Wh3+E83wOn9L4CizyRyYKXTcCD2SGwLRSUl6TAXmVDgiKdtvgTRlrEjnx8dbZ2HxS7pIsMbioD67CVvMKRf17nE6M7QnLf9fb+ug19Cm9q+lZcKdFohZRoPZCRBls0qN6dP9EM+QvPQD6zN4wxGKra5RXIluZwZVjQzQD/WopcgEq/TJmznm9xjaEpOV5z+uJgeXV7g7stPWVC18AKWUg/OiSkOvY3fUjV4ee7muSaktPGsZuj++xAXck7+rmthFBFyPgKYcOByg2QF9QeSvsjhfh2A6l3j7nt7YNMOGHh3mUa2t9uvBqoz0GaqHEd+t4nPC7oC2hf9xCeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m3438VyS9HHNrGeG1RmloZAWK7+eBdkG3jaGsrzOzk=;
 b=gRWr5WxxC9VqjMYPPLlHx14Lskymw9dEzdchv+aklZ28qBUDkD+JIGbROtAYqKD5HbxBVrfNUT7tyTLpp6Uv2peR4cBj4tu5TyTHfp92Fm6KPuL5rqIWLASrSD2XwD5NQjbKwNOGMkP8MHY3bnfp+X2CKVozxv5JP7YBqJ9Vyui0aV7B17h05RIm+mBfhj2mp/6kl+fp+F4ZSKKXTju4CKVi9WBjrrnhX/hGEKWm4Ugkrb//VJPu2ITWFOl15wNgHCfJ3swra1VVHBkfeCVlUWIBWagEwhFFeWGrfCR3JpE9QZK7YUcexBB5opxYB6e8XkcnTyaQCOFqpZNI8kMaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1365ce99-a195-66ab-45ca-5e85c3fda930@suse.com>
Date: Wed, 20 Apr 2022 12:15:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] x86/build: Rework binary conversion for
 boot/{cmdline,reloc}.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
 <20220414114708.4788-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220414114708.4788-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7e6308-cc5b-47dc-632a-08da22b6a439
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3505:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3505AD7472FB384068E052BBB3F59@AM0PR0402MB3505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDWrfjvd8hfBlfuhvPEu9mrGsdI9rgFYUXb0J4OMKudLbrf+3snOZaHGp3rSsqc0qsUxmb9rwIravI7qJievOdXkOQ0i+dD0nIVCwFLdrfrVuXZtNBTYX13bhs0kL+CR3z5BAyNEy1mEcfkIkCIyoCQ+5QNmCpvPX6ljdLi8VvoWqRyoQendjuk2rhbJEyIwxpoFXdifwiXB8T+GAyjviiOav2EUR2pmqhlbYq9+k2Sfe2lmB5v1QzKHqR1SETlQwtKFHo7SezSksjCaBAqeR/pVG/pnWkIZy5l4BhBsjNlEaieBkOomz5zYl1z2lhEIuMGMT3tY4WZs0SDPF0+JscYV8tUdYuSLtoVyfYqpnc748kCWj8Iaxd/0A7i4L1csw7evJ59TjSSjL9aemkxLgfRKnIpcatqis/Gqv/VxcraWdtcScMmYmri6zp8JwkKUze6tSewYJKvxl6vX+8kggav77QKyNnMFL3PfKCYBkRMgU/3p6lv2cbckhOqWBhc23CtawX5aQxgx/GgQZVB0y1BUC4nKWaJo0pCCbrHJ3XMBv8NTgNJCupT7RShyVzpmyLnTGsWva44H2Va9x1P4xgSop74+zUyDCFxXU6okwVMKp38WOSePosZTZejAnq9A8CmncL8lOGRzGEX5cZBvgzO7Xn21fap913E0esUDPnr8UetjhWiXaDGQPckkMQLzXANSMVlX+aA5vN2YsePqNHmM3Gfd/XiRk2QKEXGO5P1Gbax+gJ0mjCd5SX2LvCLB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(36756003)(38100700002)(31686004)(508600001)(5660300002)(6512007)(6506007)(26005)(53546011)(186003)(6486002)(2616005)(54906003)(86362001)(2906002)(6916009)(31696002)(316002)(66556008)(8676002)(66946007)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RThucXBIaURRTmNPS2RHY0xURkd4WGkyVjNpUTJCb2J3WjZuSHE1eUMzYUJH?=
 =?utf-8?B?TG1RZWE0RVpKUjJjSXkrZndLYmtNbWFNc0xRazRYSzFZNUErcUpCNW8zSTM1?=
 =?utf-8?B?STJCRk1zbmZRRzEvdUZTSmFvTTJjVDRkM2g5UWJScmdtKzdEME8yYkxBdjVE?=
 =?utf-8?B?NDVpNlhDRFpBSFdIeFlSSzlZcTdtdHJTb2NadUw1NXB5UDl6QUo4M1g2Z0R1?=
 =?utf-8?B?ZU9SMFcveVdRUVFWUWlFUzVTb2FoU2dpS05FNTNmOHh6TkNzNGVidVlNeGVu?=
 =?utf-8?B?bWhtVzRPeFFkSWl3YkdGV0lLN2wwZTdOamV4d1pVWWpOVTBCc0JPRnFkYUJj?=
 =?utf-8?B?Y0UycWpzOUwzUnBERXI3QjZLNEZNTDdHa08xeGV0VU9seHVpcG5OQ1ZRTENY?=
 =?utf-8?B?NGpUN1ZYSEVYb0pXRkM2a3ZvSW9LWEJEQldTZ1NOc2VRWXdCc2U3SmNxVnd0?=
 =?utf-8?B?bHBYQ2dmNWVlNzFhM21WbEFBRDRsbFhteUJuTnc0aGcvTkhKa3lRTGZNKzI2?=
 =?utf-8?B?dkRNejVTZkRiK1RvbC9KMW1EN01zb3JuMFZKK2N1Q2VPSDE0RVdkc09QOHBn?=
 =?utf-8?B?aGxudU5vNzdiUFl5ekxSZWYxa2VORGFNQVFlL0NHcW95dDBRTUJaa05ZWkNE?=
 =?utf-8?B?aksxU0dIUGN3Y09BbFpnc1cra0VzeDFoVFFSem5mYmdvWlZDdHpOUnFIelR5?=
 =?utf-8?B?K1JxaDJwdE53UTJFbU9WaW1KTnZ3YVlNb1AwdzBpS0J3cE5EQUFUbkYzUDNz?=
 =?utf-8?B?ZnFpQkN6QitOazA4VWprVGh3amxiY3BCZjN6U05ZSUIxSmI3THJjWkxMTHZa?=
 =?utf-8?B?STd4WnVPYmVhNlNEbnpJUzhoamErNW9SUkU0VUM5TmhZdmNGbWVhSlR3ck9B?=
 =?utf-8?B?OGVCc0puU2IvTUpFeFlyL0RFbUpZckk0Z0d1dTBhWEU2QkM4eEtvMDFJdVpQ?=
 =?utf-8?B?Y2NkV0JJQ1M4UnQyVFcvbkE2ZjI4ODlFY2cvV2ROenkwcjFDVUZNY3hEaU9Q?=
 =?utf-8?B?cStHUUsyUEdrTlpkWG1nbmorbWEzWGlWWmxXTWxLZUZZK0djQ3A2UnNCdWtw?=
 =?utf-8?B?OEJwbTYzbVFCdGxEUUN2aGxvWkE0dWZESHR0cGVxc010NXRxMDREaFZOTlll?=
 =?utf-8?B?a1lYZVFEcEFwdWJBTnF4YUF6b3B2a21zRmFqSUhkZVBubXhwQlNjZ1k1Tnhx?=
 =?utf-8?B?SXhsYkFUdWk4bUE4ck1hLzNHMlR5aVUxWjQzN3Bqak5teWRRWFpmR1pUdFZR?=
 =?utf-8?B?Z2FUOTJ4NmI3NkdIb0VRY0QwTmx4djZ5NDhtZWVTVGsyaVU0cml4Q1RsZWhu?=
 =?utf-8?B?MzMvNmJZVDh4bGg1d1JuU292S3dtQU1pM0dHSzM3UlZpeHNldTk4SmxhVU9K?=
 =?utf-8?B?WlpoVjRVODdOOFV5YnVkSitUUWcvaE5kRXZXa2dJYUdtOVhMMVgzNEtOeGtN?=
 =?utf-8?B?SjYvakFGTFRVRGdZQ3B1OVdvc1l0Y3RpSDNmN04xVEZVWFJTaTI5MldzdlJ2?=
 =?utf-8?B?aWRLSGtJVi8xZG5JV3JKK0FnUStKdkFZWW9zRE9HYVpUb01qRTQzb0p6Z24x?=
 =?utf-8?B?OXFjTHFsTllsdjhKaCtlc0J2VDNwZXpWZXVVL016aTk5L24wMHhrLzJsMmlK?=
 =?utf-8?B?STZBbkdseWcxRjBOTnkzOU9vTi91SHcrMGQ5K2J4Y1JQbEhQOTZsWE9tMTQw?=
 =?utf-8?B?NklDeGF2cWttWVNEQVVxN0huaS84RnNEVWN2d1ZTWGtsUUsxZGl6SFFUVzkz?=
 =?utf-8?B?MlR0Zi9tellpNFF6c0dCRDQvNmp6bC9ySjcybk5XMmFMbFdCZ1lFYkU5VGpK?=
 =?utf-8?B?QnEvWmNJNWRYcnM4TmxqQXpHMG5sRndlMHo4Rm90N0gvNkR4ZjR5U0Y3Tjgx?=
 =?utf-8?B?VHl5MUZnNlBCV0ltMWc0bDhXTHVCdHAwRnBPaEtiSHA1Ni9PRkJkelp4c1ZH?=
 =?utf-8?B?Rko3T3NBOUdmZUxFSGJKOVlaU1JaSlQ2L1JJWGo3dDlFWGRFVEoyNUU1M2pD?=
 =?utf-8?B?QnNwb0x0YXd3WFcyeno2UXZ4NjFweEREZ2d0WStNZXpaK2JPSlNXQWhhc2ZS?=
 =?utf-8?B?bEJVZUk2dGNOdkJXQUZwWUplOHdjaTkyR3JtQ1BiWGl6T1lyWU91ekhvbWRk?=
 =?utf-8?B?d3NyVDJ5Z3Q4a1pOVkRPSDFvWmVpWnJOb0NETU1OU29HZnhqaktaY2ZrSUgw?=
 =?utf-8?B?aGQydnhkZ1NvajNVeVBzT0Q3dEhMRU10RGFwZDdVTzVuMzdzc3F6LzUzZTcr?=
 =?utf-8?B?ekxkU2loTGxZZThJalpReTBROUUrRHY1TGtKU1NRT2VPYUhRWDZhUk5TNzQy?=
 =?utf-8?B?bjRyZlJhdTNrTTZIRi96bmFWN1FCcVBjb0h6UHNwalFkTzQ4ODFUUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7e6308-cc5b-47dc-632a-08da22b6a439
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 10:15:06.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+CbSJmkBL9CCIptGR2t/WX1hK3R1dYo6l3fadmqa8hwiZZvO3zXqwFsb3HUG9On4pIM6rl+ioPsE7EIIWrDgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3505

On 14.04.2022 13:47, Andrew Cooper wrote:
> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds
> @@ -31,44 +31,36 @@ SECTIONS
>          *(.bss.*)
>    }
>  
> +  /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
> +  .got : {
> +        *(.got)
> +  }
>    .got.plt : {
> -        /*
> -         * PIC/PIE executable contains .got.plt section even if it is not linked
> -         * with dynamic libraries. In such case it is just placeholder for
> -         * _GLOBAL_OFFSET_TABLE_ symbol and .PLT0. .PLT0 is filled by dynamic
> -         * linker and our code is not supposed to be loaded by dynamic linker.
> -         * So, from our point of view .PLT0 is unused. This means that there is
> -         * pretty good chance that we can safely drop .got.plt as a whole here.
> -         * Sadly this is not true. _GLOBAL_OFFSET_TABLE_ is used as a reference
> -         * for relative addressing (and only for that thing) and ld complains if
> -         * we remove .got.plt section here because it cannot find required symbol.
> -         * However, _GLOBAL_OFFSET_TABLE_ is no longer needed in final output.
> -         * So, drop .got.plt section during conversion to plain binary format.
> -         *
> -         * Please check build32.mk for more details.
> -         */
>          *(.got.plt)
>    }
> -
> -  /*
> -   * Discarding .shstrtab is not supported by LLD (LLVM LD) and will trigger an
> -   * error. Also keep the rest of the control sections to match GNU LD behavior.
> -   */
> -  .shstrtab : {
> -        *(.shstrtab)
> +  .igot.plt : {
> +        *(.igot.plt)
>    }
> -  .strtab : {
> -        *(.strtab)
> +  .iplt : {
> +        *(.iplt)
>    }
> -  .symtab : {
> -        *(.symtab)
> +  .plt : {
> +        *(.plt)
>    }
> -
> -  /DISCARD/ : {
> -        /*
> -         * Discard everything else, to prevent linkers from putting
> -         * orphaned sections ahead of .text, which needs to be first.
> -         */
> -        *(*)
> +  .rela : {
> +        *(.rela.*)
>    }
>  }
> +
> +ASSERT(SIZEOF(.got) == 0,         ".got non-empty")
> +/*
> + * At least GNU ld 2.30 and earlier fail to discard the generic part of
> + * .got.plt when no actual entries were allocated. Permit this case alongside
> + * the section being empty.
> + */
> +ASSERT(SIZEOF(.got.plt) == 0 ||
> +       SIZEOF(.got.plt) == 3 * 4, "unexpected .got.plt size")

While here you've adjusted for this being 32-bit code, ...

> +ASSERT(SIZEOF(.igot.plt) == 0,    ".igot.plt non-empty")
> +ASSERT(SIZEOF(.iplt) == 0,        ".iplt non-empty")
> +ASSERT(SIZEOF(.plt) == 0,         ".plt non-empty")
> +ASSERT(SIZEOF(.rela) == 0,        "leftover relocations")

... this (and the construct making the section) would need
converting (or amending) too, as 32-bit uses .rel.*. Then

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


