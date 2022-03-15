Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC04D952B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 08:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290649.493003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU1Vz-0003ih-F6; Tue, 15 Mar 2022 07:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290649.493003; Tue, 15 Mar 2022 07:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU1Vz-0003gr-Br; Tue, 15 Mar 2022 07:22:43 +0000
Received: by outflank-mailman (input) for mailman id 290649;
 Tue, 15 Mar 2022 07:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GQWC=T2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nU1Vy-0003gl-3E
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 07:22:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b247e001-a430-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 08:22:40 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-WvRVBxHnPDCbGRm7L1fmiQ-1; Tue, 15 Mar 2022 08:22:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3913.eurprd04.prod.outlook.com (2603:10a6:8:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Tue, 15 Mar
 2022 07:22:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 07:22:36 +0000
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
X-Inumbo-ID: b247e001-a430-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647328959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u72Vg7qMfFNjQ1OsUo4s7WCJxv1LyPu6VoVAmgl3OJE=;
	b=hC9khRMpVQZAYb4p1atsvtXaA7jmF3XM/FadGk3WDby+j5xcpwT65OmLPpacYAmJJ4TKxv
	8xuoUN2uhpRUMWjDEWZ+my99AVFOND8OAJmBV7antqb2UgdSIhoClr2HkIbClmtgH5qK5T
	0+kTW2fv8L+BCDUH8ZrJVtmdbfUFzJ4=
X-MC-Unique: WvRVBxHnPDCbGRm7L1fmiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wpk4/mrzFmmNh75h9GqlQqqiDiMv9YuZzpyAoV2wDw1UH31bxTl/Etp2myE8UFg/FttW2qEqfUvd3eVLXUdeQtxAOW1azF3I2izffcXZaS8dS/X4UGvUutzjxWuUB4+XAY2s/AKSUxlJt+yv+e1iB+8kXPyh4HDTaJAyEPbpsKY0uWXD+uiUaWxGggPgFBpM1WZQHhOMcmgJqvLlUa6cM6Emv1FA3RrIeFq15M0vBVUnli2lWkxJnrRUgl1RoBaRo5uqusMwK1aHvAex+5AnVywg13CSwLxWudhrx6dktHrWsFR6JmtlhhuE9Lbu/9/s/aU0dZOtKXrdh2Sj9IKtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u72Vg7qMfFNjQ1OsUo4s7WCJxv1LyPu6VoVAmgl3OJE=;
 b=dtxYMEfFvQDg+Nhffzvg7P7IG/kRFD5qNWR7yy7wkNQgpJN8jOf9YeAQA8lhyUi2USh1h22gF7anoBEX1sm0AyMG2c1vz1uoVGDpQXVJsbXvbhc8FGaCFtBOylAgHEmxJj8amIUMkiVAQMYPIzszEEn35fsS8okVAfv40smNepH107N1SiNfnU+wGzOP2zfVnEl13u/P7guw5u1s52yu91HLftPdgw0u4O80eimmHvyCFRPxpjb/vLNOEAoo7HNC3D32kMADZjX+OBeFlGDF2C7lREr0+Vpp/larqpMKIbn8S0FrlKeW1AlY6NvnqfDL3hIuvMd4crBlLyNmbPkuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12d7cad7-f4fb-f28b-8839-33d8b3532959@suse.com>
Date: Tue, 15 Mar 2022 08:22:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN v10 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 paul@xen.org, roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-3-ayankuma@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220310174501.62040-3-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0001.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6be6782-eae8-4284-1686-08da0654948d
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3913:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB39137DF9159648B8D54BE846B3109@DB3PR0402MB3913.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2mVoulFj2DmlTt0MavrvSrGg1zn4j2CFxcdqMylAhTOjuu3qZgL9xxvgIzaAdsAQGo1n+EgnjuKd2JbeXbIRSasuOht706jj8r/taaJAyxMoaQCvgZlq/HEzy3ueVr3lyF4c3/Rdp5RaxYPxAAcm0rLBbvKehcGfNZ09y8mnmRay7DuQtucVjwrfwaMYQkzUSBvFZyyCDyOHfJ0DlPoF6QMsByBquDjosBQdeAB3uNULQqgGFdw8fWII1PM/J96uJaql9oo7h61EPLDVlrwMXzOnPq6W6pv/qeGwqKtUYBqzcJgLt9FRA9Qt5I245dXtZdnc5gRc8EaJ1U4otHLXV4wAGLX4RuD7fEp37TQ7/w8Gf0O7ns04mWXSAkbs5Vh/UPWdMg9I+hmQboteYCeSVjkJnwOKxHuTonwJWrfnsOzdyaIFQ0BPo4yZITQA8It3vOus2YA9YE+t6UX/FPo4AAlk3r2XD9BnAvHjbtMjp8tt9JS5ORTp15jfefXPy56ueHwyG4+0epFgEYcI8aeaVtVyKjbAu6MZTLPKy6SvE6b+zEKOSTqX1MF2/G0zi1DAkdAg8PVdfRDsDM41eVxnfZF71xPlnkOU+zPbbL4Sa/drveB5ijnhp6zLVdA4L5tgK1GfLTULUP7G9yoZvf0qnZLEW8NhVC3FXt1DGoLWTNRpvo+PIeOl3ynMJRcSI2aZfyOKlDwrHFZSs+B6hsvqjJBR+/vZ0Jn6Ookv4UbNu8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(83380400001)(316002)(53546011)(36756003)(8936002)(2906002)(86362001)(26005)(6916009)(186003)(6486002)(508600001)(8676002)(6512007)(2616005)(31686004)(66556008)(4326008)(66946007)(66476007)(38100700002)(31696002)(5660300002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXBnRGZUODlweTZrVHpTeXIvbWpKeUZpMCtEVm1yc0czVnNUWFNSMGYrZ2JD?=
 =?utf-8?B?NUNLR2RiRzBVdTRBUmNXTmlNNzNTOGxWSllQelZSVDUrTVhVNnE4S1VQV2ZZ?=
 =?utf-8?B?c1VwVkhFQlBleE1wcXViSCtWMGVEMGpYanMxdXRxMVg2ZHFUbjlHRnQyY0xO?=
 =?utf-8?B?OWdBdUo1bWRKUVlkVTJFNXRyQXhyZ2g3emtkTVZtb1JaVWptT2dBdm1JbFhk?=
 =?utf-8?B?cE9FMHptUFErK3dpcVhwZ0gwdXJvVngwMml4cElDRjRnQ2dVb3JNOHlNRXFN?=
 =?utf-8?B?YVdSMlE5eDVXZE9UK1lHYVN6ZmxOMCtOczdycElNVWhOai9ZYWh3dmJYWEVv?=
 =?utf-8?B?Vk9jSEc1NFBDZ2p1c1hsWkpoZVEwbFV1WGVHdDZDZHgyT1dGQnUzZ2JpdkFs?=
 =?utf-8?B?aTNMelhRR3luSFA2VFJlcEt0WEdIREdCZFZKTDB2Nkd2ei9qNVBvQ2ZINThC?=
 =?utf-8?B?bTZlWjFFTWhHd1k0R2k1NCthVEliOTdrVTVMWXFjbVJ2UG8yMUlUSWl6QmlH?=
 =?utf-8?B?SUlMdTZpUzVEVktEOG5HZ2JpY0M1TDlma2RaeXFHYWZSR1JVWERjSEI5ZDA5?=
 =?utf-8?B?WWRCQjhuZ2d4RmF1b2cwRXoyTUpXViswM1JGRkhlN0xLb3R4RmgvZkNXanpq?=
 =?utf-8?B?TzF2U1JxVG9FOS90bDNwMWFGRzl3Slh0Yk5YSGFVN0s0VVNhY1dTc1ZCcjVX?=
 =?utf-8?B?VXpVL0FvTGtxbjhFT1NFZW9WbDJTZC92VHpYK1RyMmJxMStrS0pXVHZKMmg3?=
 =?utf-8?B?VDFUcEhpa1A2dURoWEJDT3NlcTZyM0ZnZTlVWitOS05pc0R6Q0ZFNlhNMjhM?=
 =?utf-8?B?eEltQzZ5NDB1b0Z1aDJrWk1NY2FnczcrZ3grYmNhaGhEOUFoNmc2L1VEYVBK?=
 =?utf-8?B?eWM4SlpBNGdLTE5pRW11UnpiMWdEaVJyL3FjTmI5VGJJSWM2NldESVJtZzdn?=
 =?utf-8?B?NVhJUXJjZk9NeXo1aDFFcjN5L0FScW1yY0htNnBYbkdORHlGUzNyaVZNd1ZR?=
 =?utf-8?B?dWo5VEpwODNnUmNmb2Z0MldIenE0eG54MDNkNnhIdFVSbHB4T20rRFVyRldE?=
 =?utf-8?B?UWw2Vmo2N2gxSFJnY2x6NmVmWG9hK2JKcWdabXo3YkRqelAxTzlqVCtwNlRT?=
 =?utf-8?B?SzZPRWF1UjZKMk01eTE0SHNHQTBsMngybVRYUHFnbFl1VWFiMHMvMWY0d3BO?=
 =?utf-8?B?dGdYNW9Kd25DRUtBMDZUejJrOHljUXhMaldyT1V4aGl3Rkg2VG1iQ0IxTS9a?=
 =?utf-8?B?K3NWVTdNajBuU2kzQzVnZHZWT3dsam10eTBwcERDV3Z3WExWcWF6bGFES3Bi?=
 =?utf-8?B?TGY0MkFlOFZLRU1TVGRSTW90LzFUZGkxZDhmZEVEZE9BZkFWQkJRU1B2cEZ5?=
 =?utf-8?B?NDZTa2FIaU5VWk5vbjIyclkwK0dHWHlLelRCai80dzk4RGNBRjZWN0xtOXZW?=
 =?utf-8?B?bDVnVnV2aWNGM0ZCblJBbmk4TE9YNXJDYXdTY0NDb0Nwa3RCNzdjMU5md3BM?=
 =?utf-8?B?eU8vUy85Z0FFZEhzMEJJYWdGeHFLTVRxY0plVDhZOFAvM3V6TnQyNStlaEZ2?=
 =?utf-8?B?TFpkNDIvSVlzb3J5TjRxQUlXTUVLQzdUOWw4c2Fua1N1WXB2NE81bGlVQTk5?=
 =?utf-8?B?VXFTYVNBUVNxQ3AyR3I3N2trMDdTSGNodEd6K0s1NXVKWmNJQjMrYzRMYlpW?=
 =?utf-8?B?RWxrbjJkMHFpb28zdm1WWGNjRFNpaXFBWENUMkVuR0Nzd2pmNlB5a0Iyb3JP?=
 =?utf-8?B?ZUZBTllwRWNPaDV4TlpLbVlXZ2I2UFh3cXZON0JXZTI3SnBkMHBFa1JXdk8r?=
 =?utf-8?B?RVByalpUTHdVaUFQWE9kMjZTV0I2bHBLdDg0ZXJDaTJvT0lQcGZHK095R2RI?=
 =?utf-8?B?bU1hc2xyS2RvN1A5RzZqaml1b3RON2NKTmRueHljMXV6bEhQNVFzMUxWRk1w?=
 =?utf-8?Q?vDuv8BACEfqarZfeL0r0FoYe50Wf9+K6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6be6782-eae8-4284-1686-08da0654948d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 07:22:36.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68O5CAoRIZEOKqQt+goPYNujgSjeo1q+C32oZj6hrS587wRYv4OolDM6pLdbxjRI8nqmdCiUOGxvKQ2EZgPcww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913

On 10.03.2022 18:44, Ayan Kumar Halder wrote:
> When an instruction is trapped in Xen due to translation fault, Xen
> checks if the ISS is invalid (for data abort) or it is an instruction
> abort. If so, Xen tries to resolve the translation fault using p2m page
> tables. In case of data abort, Xen will try to map the mmio region to
> the guest (ie tries to emulate the mmio region).
> 
> If the ISS is not valid and it is a data abort, then Xen tries to
> decode the instruction. In case of ioreq, Xen  saves the decoding state,
> rn and imm9 to vcpu_io. Whenever the vcpu handles the ioreq successfully,
> it will read the decoding state to determine if the instruction decoded
> was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING). If so, it
> uses these details to post increment rn.
> 
> In case of mmio handler, if the mmio operation was successful, then Xen
> retrives the decoding state, rn and imm9. For state ==
> INSTR_LDR_STR_POSTINDEXING, Xen will update rn.
> 
> If there is an error encountered while decoding/executing the instruction,
> Xen will forward the abort to the guest.
> 
> Also, the logic to infer the type of instruction has been moved from
> try_handle_mmio() to try_decode_instruction() which is called before.
> try_handle_mmio() is solely responsible for handling the mmio operation.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

In addition to the boot crash on 32-bit Arm there's also an early
build failure on x86:

In file included from arch/x86/x86_64/asm-offsets.c:11:
./include/xen/sched.h:164:26: error: field 'info' has incomplete type
     struct arch_vcpu_io  info;
                          ^~~~

Note how on Arm you have ...

> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -281,6 +281,10 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  /* vPCI is not available on Arm */
>  #define has_vpci(d)    ({ (void)(d); false; })
>  
> +struct arch_vcpu_io {
> +    struct instr_details dabt_instr; /* when the instruction is decoded */
> +};

... this in asm/domain.h, and thus visible to xen/sched.h, while on x86
you have ...

> --- a/xen/arch/x86/include/asm/ioreq.h
> +++ b/xen/arch/x86/include/asm/ioreq.h
> @@ -26,6 +26,9 @@
>  #include <asm/hvm/ioreq.h>
>  #endif
>  
> +struct arch_vcpu_io {
> +};

... this in a header which xen/sched.h doesn't end up including. I would
like to ask that you arrange locally for at least an x86 build test
whenever you touch code which might also affect x86.

Jan


