Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1DD4C8B2F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 12:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281286.479555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP19x-0005o8-8W; Tue, 01 Mar 2022 11:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281286.479555; Tue, 01 Mar 2022 11:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP19x-0005mG-4n; Tue, 01 Mar 2022 11:59:17 +0000
Received: by outflank-mailman (input) for mailman id 281286;
 Tue, 01 Mar 2022 11:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP19v-0005mA-Ll
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 11:59:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035966cc-9957-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 12:59:14 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-cmQUEMhtN4i_4aw6HG3yoA-1; Tue, 01 Mar 2022 12:59:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6364.eurprd04.prod.outlook.com (2603:10a6:10:10c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 11:59:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:59:11 +0000
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
X-Inumbo-ID: 035966cc-9957-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646135953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euxWGwpNFpXQayf1WVFqTvC95+comyZxg0/6MsdppYw=;
	b=TTcKVg7hyks0yn+5ZxFsoGAATtO8/Ljks057xnTnPqyUVhjDg+KTATff3WdfOpofNP390C
	V5h/K4k21HckdFLh8253tPNep59lHkuNFLBzrJEr9eSSy+TSPiZtpX96F1zWD0oy32qqMR
	1lp7xxB3tmO74r6CJWrAGbxfE1kNYbU=
X-MC-Unique: cmQUEMhtN4i_4aw6HG3yoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/lJyp+tvL1+Jbk1hCI0A2FR/JKfRj7kCfyWsae94+/z+eeblDkKt2ovyDsGl8+40BU81ulfTyXNbMNO3MaY4VkdAghXtze/cEAg+EPmU4Bg25LSpN1VclQdlbguAfitPh+LvOMJ1OJW+G2tNlQmUtv0w8FTHIkxG3ANEkFD+26+7ZHw+9Be4rzgLHOnlYKE+tXNu2MKG7ImYJo1z1amQ2wWfkagj9X4O2kXu3rTaE5m1zWcZ8VBEb70f3TXkG4QSPNFg2ccR6EDqxZ7Dv4yI7zeVw+nlN3KmltLz5mhEOQeSUxLS4KTxZgZ67YXjSI+4E9KQkzH3FEf8CSvZYyjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euxWGwpNFpXQayf1WVFqTvC95+comyZxg0/6MsdppYw=;
 b=MQ7O+YEthIfeHC1OI/UADKld26qo6JYGIpcMlcJbqQ5AFvanF/J+UtYIatSBuh5cLrRc4PojIjNthQoEJSYJOXvUviIhBArFeeNHel5d5bS7g0tGikzyLqT6b5RE1CbUXa6M7ZxDPwdVHBTKWw4eJ/psXQdJ6lD9iXBqFqb/pI0Sumq057pClpMOSKoV+g6cBjiq0J0G3hUX0dv+vX9knY1EiVx2zqT4VM6nO8BcCASdvVH7MB/uHki6lGnSi7fZofsnWxg/XogRe1ALyLyzxtw9CEDlZS68Coef6iv7OEcAgXRX4ppcCjmZrzMNLmNh2P+IWspgXVE3gCKCNPueeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2808e805-60a7-2f1e-0ff4-8da123c79afd@suse.com>
Date: Tue, 1 Mar 2022 12:59:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125632.24563-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eed71500-e4bb-4936-0b64-08d9fb7ae5dd
X-MS-TrafficTypeDiagnostic: DB8PR04MB6364:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6364729299960C907717CE98B3029@DB8PR04MB6364.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xI1d0FboKO00E1aOgQhSI4AMHfCi4zpb2NiVPbhD967g36GwAgQKauZb8PnJDz3dJIqgKFVSL4TxQyWRkp5YqZQkSBK5LmvRqBn/XiPKJV0KQSUREY1S3bNis1XloYJjRcXGGq6BW1lbaJLSk9u5OZIS5Dj44vmVNf0z9l5sSaZUy15TUnb7//kjoZxfjog+4rK32bj23HDUoAZvVxEb1yKNCfTH8LQByZWZzxJjpwC5pVueUkIcSOTIVqMpg1ovzqkgr8Ecp97hISYni2DrvOzl31jD3tV6ANYihMeiE0JuhCKul5svFSrQZboHXJkt+fM0yW1Dyjt0FX5qAoo45PN0n4wuzTAZ9zzzmN4LOm+KtysOiB7Raon+C3LKo0cwVaf0G/Rf7eiIam72orjgsmi4j3EMNNPtCNqjSvdeWrH20nBvzQv7Nod8gH7vbnI02mDG/JT1PPwJt6skyj0kBaOj/15e+6oNLIrMUWMTJE67iDnWaLett9K+Zrft6lt1e2arzuyQzJNg7aoBFsPNDc/SeYLKUnZAFmbxWynfO9hqmOXqnci5D4ABsfQZirVwt1zzYUhljgrU2Iw2aT7W8vt6vAMnQ/d+z62Ns91tgH15Ep3bVzhw3UlNcfoT6SIKV2sFzVyvf61pc5KjJbLUP4mJf1q5Nziz76LmANewUkxcbyUzbpG8lDJIuoatCyw+V2Z7rIOCQNP02B0Wog6UYJo4LWcV664Z0JColO8zBdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2906002)(6512007)(38100700002)(4326008)(5660300002)(53546011)(6916009)(86362001)(83380400001)(26005)(186003)(316002)(2616005)(36756003)(66476007)(66946007)(54906003)(66556008)(8676002)(6486002)(31686004)(8936002)(31696002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0VmcGZDSFR0T3BFWmY2S0Q5YWZoQ2VlalZOVjVJeUFpbk8vUUdhVDdlTWRp?=
 =?utf-8?B?TEdKeDh5dkVKeXZtb1VjdUJEcnZZZzM1aXdTb1B4TUkxTHp6NWgzZzZ5Tkcz?=
 =?utf-8?B?a2wrZmFSaTdvVkNxMzM4THhkZzV4SlM3T2lKUk9QQUo0MW5jRFZXbHc2Nk9K?=
 =?utf-8?B?cEwzenVTNjMyVUgxNitzMVpXemZYaERGT3BFUzRod0ZzZjlJV0FxUnkrb0hl?=
 =?utf-8?B?NVV4TC8zSWw3QU9seCtIdDNNRE5CTUdRRTVrYnVhNkJqbmUydHhaTk03UXdP?=
 =?utf-8?B?bUVFbUxaSmQrdnZVTmI4UTNHbHkyeVRSQ2NLN3EybFg5NjBodjM3bXpHUUh2?=
 =?utf-8?B?Z1BSYTZwNXJSTkYyZ0djL0Q5N1MyUUxGYklHMTdvNUtUVGp6Mmt5dHpiZExp?=
 =?utf-8?B?dDFCR1F6SDV1NzV6WTZQQWc3a1JJSDhrMG5YdUNKa3dtSWlIdnhnUTdQcmM0?=
 =?utf-8?B?ek5YcUhZVlN3d1VRdUJUS1g0QWRONE03Qit1WTI3MzBGOFJXQjRFRFRvaklP?=
 =?utf-8?B?aVVQVmVqeXRwekdnbXpJa3NaM0lTenpHQXZPSnprZDF2QWpucis4b2R5SXNS?=
 =?utf-8?B?TkdOVHE3K1hiM2RTeEZkajlnbXZ6Qm45RTYrekpRMWd3d2Z0VjJSY0xha2pY?=
 =?utf-8?B?d1R0SHlrMnJieXBacjNSRjhhVXZsSTl4YVpPWlZvd25Gb2NTNFBIbmo1SnFX?=
 =?utf-8?B?TktpZnh0eWF2VC9DOS9PODB3M2xINlQyYjFmVkhLdXptME1LV0RwYSswV3Vl?=
 =?utf-8?B?VDlwa2JlbFVIMHZRQWhmbDVnOVp2eFc4Syt1WVNPVjhTSE5PbWYrZzVTSXhQ?=
 =?utf-8?B?N3RuNGpIeExWb3JTWm0xbG52cjd2eXJWdUMvY0xnaTJlRFRXWGljeFNYNXQ1?=
 =?utf-8?B?VTRIN3RFQVV4N1lZRTE0ejZ2d3FBeWpVMklhRG1rKzFyS2ljUTg3V0xZUTJV?=
 =?utf-8?B?WmtBa0F3TGxNOU90N09NUmw2RlBhL1JsZnhzWGNwR1FRS0Zpb2thTzRPdW1H?=
 =?utf-8?B?TEFQSzhpMERQa1JYeTdHdjQ3ZEZWNHhCamdGRUc5Z044NDJmNUJvVEczSFAz?=
 =?utf-8?B?b1V1V2VWOVFWeDhaTW9ITldoYWxweUp0eEowMnZYTW4vRDU2NEtnaVQrblc5?=
 =?utf-8?B?cXBjSVN1TG9YdjcraGJhQ1lpUkFjSG1YdjgvaEdLU1lma1piRmVPMEQyY0Z5?=
 =?utf-8?B?UkROV0NyaU1JNUNHc1F2VmNmQVhMa0JaTks3RURZSXpvTTRhRGZPV0lOMHI3?=
 =?utf-8?B?cW9qV2RPYTUwVFIyTVRYaExEbkMyS0dGNWlIczFISE9tUjdBa0xMY2hQYVhX?=
 =?utf-8?B?UnBtcmdYbWRYb0NYbW9lTk9hTUY0d0NyYzdRUmpETkR4OGFjR21LU1ZHalZy?=
 =?utf-8?B?djNHSmwycjFjRHJ6QVpIVjZTaE9QNVRodkUzMDlYWDJ0bytvN1I2L2pRVVVs?=
 =?utf-8?B?cWFJNGJPelhOSmNueFg5c1F6bS9rblRwVGMzYjQ4TXA4QUNqMm1XUVhQeVVU?=
 =?utf-8?B?SFBBdzd1UDVkVDlaQzNsUVVUZ3VweUFRbTR1d1hsaDBoZTlNcE00RFMrUEpD?=
 =?utf-8?B?VXVLRVRnZVRFNE9zbkVMU3hQMFVsQjZHNDRDZ2dSUjBEVTd4UGJJMnhBb3Bw?=
 =?utf-8?B?ZGN3aHc4THVTNHRUL0lVT0ZYaTFmaXZLdnJTTFNzemhmaWorR2hlTDkrMjhq?=
 =?utf-8?B?RnFTUjkvTTBPNmREdGIyNXRWRXlYZTdja2pXVmRuLzVPTHBBM3VNYUtPZkxP?=
 =?utf-8?B?MEMxN29SSUFqWTBJNGtMUzlHa2V0bFB1b2FhM3I3Yyt3WkRkQ2h1dklMTmlq?=
 =?utf-8?B?ci9LWTNuM2J0c3h5TjMvTThBcFBXcWQzZFFLcWQ0OGtCVnQ2QUw4dkdWMXZJ?=
 =?utf-8?B?MVpqaWlFZElWMUFnci9lZnlUQ2lBZS9Id2h1NmthdW9CalMvK0dPb1pHSWZS?=
 =?utf-8?B?RVhzMnk2Z2lKWmRGQy82d0l2cVV3VmQrTERRUnNxdmJOYzY1QS9YQktNYy9v?=
 =?utf-8?B?RWVDbWNXZFRoQ0FFRmVoaHdMS0RRY2pYelBNbHoyUmJ5dlhqRWx0YjVyOHYy?=
 =?utf-8?B?WXU2Y1Y4cCsxdFhNVWRhTThWOEVVRU1WeCsyZ0o5WW82WHc3WmhQYm9DV0Ja?=
 =?utf-8?B?MjEyOWRadE5BL0ZDVkdJT1hOTzJMWFdKK2t3MU1CVzE1MjRRSmVJQzlvYzJi?=
 =?utf-8?Q?9GgY9gbstvp/M+9/zLmp1TM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed71500-e4bb-4936-0b64-08d9fb7ae5dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 11:59:11.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LWfnp9o5A3JWhpLZ/OSKOZIDXE2o8sr4dEnYZ9hKeRcp8g/LuLlGsLbUWh1ALAVps3soozerWQOHhXSSZixZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6364

On 14.02.2022 13:56, Andrew Cooper wrote:
> @@ -330,6 +333,41 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>          text_poke(orig, buf, total_len);
>      }
> +
> +    /*
> +     * Clobber endbr64 instructions now that altcall has finished optimising
> +     * all indirect branches to direct ones.
> +     */
> +    if ( force && cpu_has_xen_ibt )

Btw, this is now also entered when the function is called from
apply_alternatives() (i.e. when livepatching), but ...

> +    {
> +        void *const *val;
> +        unsigned int clobbered = 0;
> +
> +        /*
> +         * This is some minor structure (ab)use.  We walk the entire contents
> +         * of .init.{ro,}data.cf_clobber as if it were an array of pointers.
> +         *
> +         * If the pointer points into .text, and at an endbr64 instruction,
> +         * nop out the endbr64.  This causes the pointer to no longer be a
> +         * legal indirect branch target under CET-IBT.  This is a
> +         * defence-in-depth measure, to reduce the options available to an
> +         * adversary who has managed to hijack a function pointer.
> +         */
> +        for ( val = __initdata_cf_clobber_start;
> +              val < __initdata_cf_clobber_end;

... this being main binary boundaries, no action would be taken on
the livepatch binary. Hence (also due to having been here before
during boot), all that I understand will happen ...

> +              val++ )
> +        {
> +            void *ptr = *val;
> +
> +            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
> +                continue;
> +
> +            add_nops(ptr, 4);
> +            clobbered++;
> +        }
> +
> +        printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);

... that this message be logged once per patch load (with a number
of 0). I think the enclosing if() wants to be amended by
"&& system_state < SYS_STATE_active". If you agree, I can easily
make a patch.

Jan


