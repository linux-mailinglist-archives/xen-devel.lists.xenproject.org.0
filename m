Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A857248DC79
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 18:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257331.442150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n83Uv-0008A9-Cg; Thu, 13 Jan 2022 17:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257331.442150; Thu, 13 Jan 2022 17:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n83Uv-00087H-9I; Thu, 13 Jan 2022 17:02:49 +0000
Received: by outflank-mailman (input) for mailman id 257331;
 Thu, 13 Jan 2022 17:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n83Uu-00087B-71
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 17:02:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a15857ad-7492-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 18:02:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-PUVaXqXrOzuqXFbYa5zCgg-1; Thu, 13 Jan 2022 18:02:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 17:02:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 17:02:42 +0000
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
X-Inumbo-ID: a15857ad-7492-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642093366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4o09gvlURgt6DohoIthTsazujGkFQ0G21bWcFFvWZGc=;
	b=mX6Xo1DwOqE3AG5FHwBhGtV7MUH+241gOi9ycswjUzC2I5oGl6fd+xexqcqLxEFVNME3Js
	fwObCiLSLAvudER3M2H06R6yHiw0tfBq7U3IIRveAJWuSb46tkn0xbDw/Y9UFu/Tc7t9xP
	BpF2wW/sowDV0TwRVBsCPwoWw6dEQGs=
X-MC-Unique: PUVaXqXrOzuqXFbYa5zCgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcjTN0v+MPe1b7vFv5Y2nikJ+wWZszkduYskalxLQE8Dj2RXpJoFsJq+jKzdkG7xbg/Rm7JlOnhtyBhEUUSB/Nnx1OmJQMLBbiazR4yPiTRhBD4KosqFxnjKdr956ADW/iQRMaBsMLg1zQt01+yr0JcNJRNJezjq700ia0gyI4jRA+2kaXFVNEdD9/Xi9d8avwJoLN49Uqdj3eWeSxkXYBZtpzsX3C24HFMqu8S6+I+BWLs+w0vqrtEZSZNdEcyKEkqklO0TitPROM6LmOAj99EY0Et2XbuR7tjnKafg75wA/TyGEFa8FusnQ131F4PowwM4fHjHvoo/eTFOfTopWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o09gvlURgt6DohoIthTsazujGkFQ0G21bWcFFvWZGc=;
 b=dKnwPsI8WG8C5AMlC5BQ0n7xK3cIGhiXRb7M4D4c5gnQ/X1S/4/xHgk5w2OOrOXkKXnBgSZHuptXmqEEWyR+O4OvisR3upVA8qOAKDy6FeQt597eqJZ0RkSepgfvtGKZg4kIzijiVpBYs+WdTsh71EtfWnWq6BEGb4G+8hHUQ/HG7ubeJ6PMxj1xApKnIwN7F6eg7CWIBzV4RXS2k4rKSbq+jVWWNvj1Bnu4K+9rLSo9PqWoC+zHG8C4CBmrTf2z1g09M66xZRSGjLbzSf1smCxTrOkHkPM0ug0+c+SRuirTlJ9LS1+irGsFurS10UPlwAA3erdip8Kr7VzYEXZstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed34964c-c612-497f-0350-b9202c0ba057@suse.com>
Date: Thu, 13 Jan 2022 18:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/HVM: convert remaining hvm_funcs hook invocations to
 alt-call
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0083.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d9202a-44d5-430d-166b-08d9d6b682f7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606897183233A545B3DB62EB3539@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zAgHwnu6JjDP+cDL9bwU34B0esHc85znUzTALwOCIq3XkE4eTxHoLxaC6QM4L8WN5/IbtnBFNu+W8Q59y7UzRDEzxEIwsPihfzgZOL9Om/IFBRpVs+rgxD0fYbbiyWzqBo7EFpIuMibqp3RIKiq2H0Only8Kz3icEHKwCjD7Wn4lA/LNYll2wUs6eLaJ1vjWZMGPOYbW4C5BSdwoSHfruunVEFp2pCs2ftlxfgXz8k/MvgBMhRBKWpffVCv/lROYwdF2AGKCX6vwdAki25B/eX95o8rP/DcEaNMXo12Ds+b9T/3oG44MfryJIMGx+Q3oA3hMYtXyMSd6j9Q8h+hPc7C5uLfIIae+XP4UO7s22+8+koWxSSqIQEPOZ4w68/Lx8HONU3/sl8C2RHafc+AHaBkUjYU5OrFr1ASVJDA3h6owkgtru7NCeSLyp/rbXeY+NevskjRnZYh2aIY7YI9avK2rGPuZHhPPnVWe5rd98KJXVluEIpZo2LKLw0TxRzRM4w+ZUtIACjzyfJqfFq1iXNHMPsj9CCY5qpbd6Rqoxc+buM8uxYZcqUFiZorKi1OOVWxDdcpM0dKrkp+M7xFMj+wtNtX0gAVWmfuuPxEl7juvt46UkHLhmrx7S3wRf4D9g5W/8R554eiPeDYtVoQyCiNRTQnY1ldB1WLfWoxvn3YaqyVJya+SqODzFndDQnxoziCrnNJ1pfjcuOvlCyPXrOMgWz0O5e2jb27rCEj30unqgYhyhmUk65hdPW6wccUEjCFEqrlB53TMyzna6MAMN+58pJnEysAuv94KKbAoKL6Rg9VPnslq3muM+sfsPQRj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6486002)(54906003)(38100700002)(6512007)(6506007)(8936002)(8676002)(2906002)(6916009)(5660300002)(508600001)(31686004)(4326008)(966005)(2616005)(30864003)(26005)(66556008)(316002)(66476007)(66946007)(83380400001)(86362001)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHk1Lys1Y1QrQjVsdEp1SW42S3c0NzhyRHBCMitoMGsyUUVOVmNhVzdUb2lG?=
 =?utf-8?B?VG5odUxHOHZPaUpCMXo3RlNHbTlFclBrK0FUM1REelFrWllzYnZ2alIvZHoy?=
 =?utf-8?B?VHlMR3VBbVprNmwrVTdzWnF6dDl6Qi9aYjB6UDJQaGZVdTRLa3dkMXZKeVFW?=
 =?utf-8?B?ZjZ4c3plRTRRODZYZlNsdWFieTcwQ3QwLzlwOEtpeUpqWWpNV2FPYkErZDJz?=
 =?utf-8?B?NUh2OUdKQ1lJK1RiOFFGdnR3dDJqaE4rT1NxUzB3MmtQa0pEWHpGNFZFcFBK?=
 =?utf-8?B?akI2MFM2WDgwMEUvc1c5SzRHZkJwdGRuaXhjTnpqRkZxRElWSHRTMTN2U3dv?=
 =?utf-8?B?eDZ3YVF6Sm1tYmtvOXEvRUxyWUpTZjFBUXpvNExVbzl2QVAyTUtRUzRHUHl0?=
 =?utf-8?B?Q2lnRDRDOEpsU3lzVlZwVktiYUlSQVBzRHJFQSs2MUdNVzRSbnNKVzRqbmQv?=
 =?utf-8?B?SGpNWk5ZOHVuRWJZK2JLeVFZdFk4cjg5ZFhxTkhScE9UN0J2anpsNmw4TW4y?=
 =?utf-8?B?eEY0SlR5TUpQeXh3WFkxVjJ2R0tDWnZIclZMNUdtL1g4djhvUi9lV2syay9o?=
 =?utf-8?B?eFpNVzJFOXFNclRvVkhIRDFIL1pxZFIycWt6L1BGeXk2RUJGSUcxTGpXdHda?=
 =?utf-8?B?NCs3Y1FBU3VsaW9DSkY2OFBNZXhiM29EcjEvajhtb0xtWWFta2poY0VOUjdk?=
 =?utf-8?B?MGNrR1JybzNydGplV0RYQTJ3ditsaVR6bExzK04xeDRlMzRiS1M0N29xQlF5?=
 =?utf-8?B?NEtRWCtoUS9mbVVFTjFNTXVYQmhRZzdsbG9zL3E5WVdaeENzNUpFNktVQndw?=
 =?utf-8?B?VEVvRzFZWFhseHRqdUZremRON0twV1JOV25RMlJBWnkzUEJ5dTI1OVQvOElF?=
 =?utf-8?B?aUdUbWZWdmVsR2g0NGcxNFh6MDdQTjdoVldwQkhPZWhyVkZiNmxaUGlCaHkv?=
 =?utf-8?B?eWw5cGptbERwVHJTVmtmQWdHWVZuNHMwSkV0TnF3QzJlWktOa1Zlb3NKQlFY?=
 =?utf-8?B?bXdja3A3UWhtTUg2VlJKL3hYdUFUS0ttbFlDNHdCeUd1aGkwbFBBSUlod1Rs?=
 =?utf-8?B?ci9sQ0JpSGZrcGdlOFdSdzFwSmpHUFBPRHlYcGV5REM3OXNuYkVTeG5mWmZN?=
 =?utf-8?B?dXZvNHcyekJjN05ic25TVU1vcjdSbTBiR3RnOTBLK1BYaGt0cVB6VHJPL2hx?=
 =?utf-8?B?SmI0cHBkWEFuc2pwYWVRaVNsZzZBZmUwZGdVQ1QrTFJETXVudnpXM01ZN3A2?=
 =?utf-8?B?QzFSeTF2eDZqYWExQ3dNK215RU1DTzJBU09YQnl5akprdURrdlY1OS9aU0xM?=
 =?utf-8?B?VHhyaFJoUUVpNG5FNUtMekNtU3NPeXg4SC8wOGIyb2lrZkJEVEhsNlUyV1RQ?=
 =?utf-8?B?Mk1HUDB0RUNGZGV1OUJWMGlZKzZTc1lrSDY0dDRqYUZSQnhWa09PN3gwS1Q4?=
 =?utf-8?B?N0EyWWd2QWFWays0MlBKWHRrdktSL25TN09scTR0SXVjenJRR2F1RVNQOEw1?=
 =?utf-8?B?M3RtSVlPQmFGLzVqUyt0dHhRbE11aUZmai9BYndFczFrS1BaSlM0eU1ZMURk?=
 =?utf-8?B?USszWURsb1QxMlRZUVlTQzFTdFBrMlVwbVE0ekVmNmh5NlBrQXV4bHhhcGt2?=
 =?utf-8?B?ZHhMQThRZFFtUmtMY0hqeW9CckxPaDhoc0laakhiWURJSDNjblZEWVBTV00w?=
 =?utf-8?B?bUh3Z0U2eUxGRzhjZDZ2ZDdpWlZGUWxkQjJBVkpqYlBpVFNqWW9LRjgzSU9h?=
 =?utf-8?B?bkovVGJYY3NqQXB5bmFDZnErSGx5cUtiVG9IamphYUluK2lseXhlY2t3UHNQ?=
 =?utf-8?B?Q29RT3ZnTnNrVVFBTS9URDNBMFJLRUV5NkxFeTBNSDhFbWlLUkN5OE45bkJ5?=
 =?utf-8?B?dUd3WVNJY0V1YW9tNGlIbkFIZ2JHT0xlZTZGMWlEajB0b1RmMks2UURnVG1T?=
 =?utf-8?B?WjQxQ3paNXowUGgwNHZJbDIySjIvQmgrTXFyc3RaTUF3ci93ZnpISzhod2x2?=
 =?utf-8?B?eVBYRUdXZXdIdFQwdWNoc215MWVMRGJJeWFaaWNhNHJRbDMranZrZXphQUwr?=
 =?utf-8?B?K05FbFNlVFEvU29uRjhaTUlzZ1lHRXUycHlZcis0dmNHeGQyZHdSc1VLOWZG?=
 =?utf-8?B?bmNsMG13cjkyMTFhSXNDck1mZnZVb2QwazlqeUtsRHJZZU1xSXZ5Q3FSdm9i?=
 =?utf-8?Q?Gn469C4Xguu3YJ/NhKQ5gVo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d9202a-44d5-430d-166b-08d9d6b682f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 17:02:42.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iweB1gB7EXojwj5SU879Z92nqAVSPheoUfXq6BMnJebBBlmYh+gLM9cfsO1DFi2e8HTiy7CF/OybjOVlhymWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

The aim being to have as few indirect calls as possible (see [1]),
whereas during initial conversion performance was the main aspect and
hence rarely used hooks didn't get converted. Apparently one use of
get_interrupt_shadow() was missed at the time.

While doing this, drop NULL checks ahead of CPU management and .nhvm_*()
calls when the hook is always present. Also convert the
.nhvm_vcpu_reset() call to alternative_vcall(), as the return value is
unused and the caller has currently no way of propagating it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html
---
v2: Convert all hook invocations. Re-base.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2549,7 +2549,7 @@ static int hvmemul_vmfunc(
 
     if ( !hvm_funcs.altp2m_vcpu_emulate_vmfunc )
         return X86EMUL_UNHANDLEABLE;
-    rc = hvm_funcs.altp2m_vcpu_emulate_vmfunc(ctxt->regs);
+    rc = alternative_call(hvm_funcs.altp2m_vcpu_emulate_vmfunc, ctxt->regs);
     if ( rc == X86EMUL_EXCEPTION )
         x86_emul_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC, ctxt);
 
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -126,14 +126,14 @@ static int cpu_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
-        rc = hvm_funcs.cpu_up_prepare(cpu);
+        rc = alternative_call(hvm_funcs.cpu_up_prepare, cpu);
         break;
     case CPU_DYING:
         hvm_cpu_down();
         break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
-        hvm_funcs.cpu_dead(cpu);
+        alternative_vcall(hvm_funcs.cpu_dead, cpu);
         break;
     default:
         break;
@@ -707,7 +707,7 @@ int hvm_domain_initialise(struct domain
     if ( rc )
         goto fail2;
 
-    rc = hvm_funcs.domain_initialise(d);
+    rc = alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc != 0 )
         goto fail2;
 
@@ -740,7 +740,7 @@ void hvm_domain_relinquish_resources(str
         alternative_vcall(hvm_funcs.domain_relinquish_resources, d);
 
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
-        hvm_funcs.nhvm_domain_relinquish_resources(d);
+        alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
 
     viridian_domain_deinit(d);
 
@@ -870,7 +870,7 @@ static int hvm_save_cpu_ctxt(struct vcpu
         return 0;
 
     /* Architecture-specific vmcs/vmcb bits */
-    hvm_funcs.save_cpu_ctxt(v, &ctxt);
+    alternative_vcall(hvm_funcs.save_cpu_ctxt, v, &ctxt);
 
     hvm_get_segment_register(v, x86_seg_idtr, &seg);
     ctxt.idtr_limit = seg.limit;
@@ -1093,14 +1093,14 @@ static int hvm_load_cpu_ctxt(struct doma
 #undef UNFOLD_ARBYTES
 
     /* Architecture-specific vmcs/vmcb bits */
-    if ( hvm_funcs.load_cpu_ctxt(v, &ctxt) < 0 )
+    if ( alternative_call(hvm_funcs.load_cpu_ctxt, v, &ctxt) < 0 )
         return -EINVAL;
 
     v->arch.hvm.guest_cr[2] = ctxt.cr2;
     hvm_update_guest_cr(v, 2);
 
     if ( hvm_funcs.tsc_scaling.setup )
-        hvm_funcs.tsc_scaling.setup(v);
+        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
 
     v->arch.msrs->tsc_aux = ctxt.msr_tsc_aux;
 
@@ -1563,7 +1563,8 @@ int hvm_vcpu_initialise(struct vcpu *v)
     if ( rc != 0 ) /* teardown: vlapic_destroy */
         goto fail2;
 
-    if ( (rc = hvm_funcs.vcpu_initialise(v)) != 0 ) /* teardown: hvm_funcs.vcpu_destroy */
+    rc = alternative_call(hvm_funcs.vcpu_initialise, v);
+    if ( rc != 0 ) /* teardown: hvm_funcs.vcpu_destroy */
         goto fail3;
 
     softirq_tasklet_init(&v->arch.hvm.assert_evtchn_irq_tasklet,
@@ -1611,7 +1612,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     free_compat_arg_xlat(v);
  fail4:
     hvmemul_cache_destroy(v);
-    hvm_funcs.vcpu_destroy(v);
+    alternative_vcall(hvm_funcs.vcpu_destroy, v);
  fail3:
     vlapic_destroy(v);
  fail2:
@@ -1635,7 +1636,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
     free_compat_arg_xlat(v);
 
     tasklet_kill(&v->arch.hvm.assert_evtchn_irq_tasklet);
-    hvm_funcs.vcpu_destroy(v);
+    alternative_vcall(hvm_funcs.vcpu_destroy, v);
 
     vlapic_destroy(v);
 
@@ -3874,7 +3875,7 @@ enum hvm_intblk hvm_interrupt_blocked(st
          !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
         return hvm_intblk_rflags_ie;
 
-    intr_shadow = hvm_funcs.get_interrupt_shadow(v);
+    intr_shadow = alternative_call(hvm_funcs.get_interrupt_shadow, v);
 
     if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
         return hvm_intblk_shadow;
@@ -3990,7 +3991,7 @@ void hvm_vcpu_reset_state(struct vcpu *v
     hvm_set_segment_register(v, x86_seg_idtr, &reg);
 
     if ( hvm_funcs.tsc_scaling.setup )
-        hvm_funcs.tsc_scaling.setup(v);
+        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
 
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -54,8 +54,7 @@ nestedhvm_vcpu_reset(struct vcpu *v)
 
     hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
 
-    if ( hvm_funcs.nhvm_vcpu_reset )
-        hvm_funcs.nhvm_vcpu_reset(v);
+    alternative_vcall(hvm_funcs.nhvm_vcpu_reset, v);
 
     /* vcpu is in host mode */
     nestedhvm_vcpu_exit_guestmode(v);
@@ -64,14 +63,14 @@ nestedhvm_vcpu_reset(struct vcpu *v)
 int
 nestedhvm_vcpu_initialise(struct vcpu *v)
 {
-    int rc = -EOPNOTSUPP;
+    int rc;
 
     if ( !shadow_io_bitmap[0] )
         return -ENOMEM;
 
-    if ( !hvm_funcs.nhvm_vcpu_initialise ||
-         ((rc = hvm_funcs.nhvm_vcpu_initialise(v)) != 0) )
-         return rc;
+    rc = alternative_call(hvm_funcs.nhvm_vcpu_initialise, v);
+    if ( rc )
+        return rc;
 
     nestedhvm_vcpu_reset(v);
     return 0;
@@ -80,8 +79,7 @@ nestedhvm_vcpu_initialise(struct vcpu *v
 void
 nestedhvm_vcpu_destroy(struct vcpu *v)
 {
-    if ( hvm_funcs.nhvm_vcpu_destroy )
-        hvm_funcs.nhvm_vcpu_destroy(v);
+    alternative_vcall(hvm_funcs.nhvm_vcpu_destroy, v);
 }
 
 static void
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -561,13 +561,12 @@ static inline void hvm_invlpg(struct vcp
 
 static inline int hvm_cpu_up(void)
 {
-    return (hvm_funcs.cpu_up ? hvm_funcs.cpu_up() : 0);
+    return alternative_call(hvm_funcs.cpu_up);
 }
 
 static inline void hvm_cpu_down(void)
 {
-    if ( hvm_funcs.cpu_down )
-        hvm_funcs.cpu_down();
+    alternative_vcall(hvm_funcs.cpu_down);
 }
 
 static inline unsigned int hvm_get_insn_bytes(struct vcpu *v, uint8_t *buf)
@@ -601,7 +600,7 @@ static inline void hvm_invalidate_regs_f
 static inline int nhvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
-    return hvm_funcs.nhvm_vcpu_vmexit_event(v, event);
+    return alternative_call(hvm_funcs.nhvm_vcpu_vmexit_event, v, event);
 }
 
 /* returns l1 guest's cr3 that points to the page table used to
@@ -609,45 +608,46 @@ static inline int nhvm_vcpu_vmexit_event
  */
 static inline uint64_t nhvm_vcpu_p2m_base(struct vcpu *v)
 {
-    return hvm_funcs.nhvm_vcpu_p2m_base(v);
+    return alternative_call(hvm_funcs.nhvm_vcpu_p2m_base, v);
 }
 
 /* returns true, when l1 guest intercepts the specified trap */
 static inline bool_t nhvm_vmcx_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode)
 {
-    return hvm_funcs.nhvm_vmcx_guest_intercepts_event(v, vector, errcode);
+    return alternative_call(hvm_funcs.nhvm_vmcx_guest_intercepts_event, v,
+                            vector, errcode);
 }
 
 /* returns true when l1 guest wants to use hap to run l2 guest */
 static inline bool_t nhvm_vmcx_hap_enabled(struct vcpu *v)
 {
-    return hvm_funcs.nhvm_vmcx_hap_enabled(v);
+    return alternative_call(hvm_funcs.nhvm_vmcx_hap_enabled, v);
 }
 
 /* interrupt */
 static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
 {
-    return hvm_funcs.nhvm_intr_blocked(v);
+    return alternative_call(hvm_funcs.nhvm_intr_blocked, v);
 }
 
 static inline int nhvm_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec)
 {
-    return hvm_funcs.nhvm_hap_walk_L1_p2m(
+    return alternative_call(hvm_funcs.nhvm_hap_walk_L1_p2m,
         v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
 }
 
 static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
-    hvm_funcs.enable_msr_interception(d, msr);
+    alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
 }
 
 static inline bool_t hvm_is_singlestep_supported(void)
 {
     return (hvm_funcs.is_singlestep_supported &&
-            hvm_funcs.is_singlestep_supported());
+            alternative_call(hvm_funcs.is_singlestep_supported));
 }
 
 static inline bool hvm_hap_supported(void)
@@ -665,14 +665,14 @@ static inline bool hvm_altp2m_supported(
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
 {
     if ( hvm_funcs.altp2m_vcpu_update_p2m )
-        hvm_funcs.altp2m_vcpu_update_p2m(v);
+        alternative_vcall(hvm_funcs.altp2m_vcpu_update_p2m, v);
 }
 
 /* updates VMCS fields related to VMFUNC and #VE */
 static inline void altp2m_vcpu_update_vmfunc_ve(struct vcpu *v)
 {
     if ( hvm_funcs.altp2m_vcpu_update_vmfunc_ve )
-        hvm_funcs.altp2m_vcpu_update_vmfunc_ve(v);
+        alternative_vcall(hvm_funcs.altp2m_vcpu_update_vmfunc_ve, v);
 }
 
 /* emulates #VE */
@@ -680,7 +680,7 @@ static inline bool altp2m_vcpu_emulate_v
 {
     if ( hvm_funcs.altp2m_vcpu_emulate_ve )
     {
-        hvm_funcs.altp2m_vcpu_emulate_ve(v);
+        alternative_vcall(hvm_funcs.altp2m_vcpu_emulate_ve, v);
         return true;
     }
     return false;
@@ -689,7 +689,7 @@ static inline bool altp2m_vcpu_emulate_v
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     if ( hvm_funcs.vmtrace_control )
-        return hvm_funcs.vmtrace_control(v, enable, reset);
+        return alternative_call(hvm_funcs.vmtrace_control, v, enable, reset);
 
     return -EOPNOTSUPP;
 }
@@ -698,7 +698,7 @@ static inline int hvm_vmtrace_control(st
 static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
     if ( hvm_funcs.vmtrace_output_position )
-        return hvm_funcs.vmtrace_output_position(v, pos);
+        return alternative_call(hvm_funcs.vmtrace_output_position, v, pos);
 
     return -EOPNOTSUPP;
 }
@@ -707,7 +707,7 @@ static inline int hvm_vmtrace_set_option
     struct vcpu *v, uint64_t key, uint64_t value)
 {
     if ( hvm_funcs.vmtrace_set_option )
-        return hvm_funcs.vmtrace_set_option(v, key, value);
+        return alternative_call(hvm_funcs.vmtrace_set_option, v, key, value);
 
     return -EOPNOTSUPP;
 }
@@ -716,7 +716,7 @@ static inline int hvm_vmtrace_get_option
     struct vcpu *v, uint64_t key, uint64_t *value)
 {
     if ( hvm_funcs.vmtrace_get_option )
-        return hvm_funcs.vmtrace_get_option(v, key, value);
+        return alternative_call(hvm_funcs.vmtrace_get_option, v, key, value);
 
     return -EOPNOTSUPP;
 }
@@ -724,7 +724,7 @@ static inline int hvm_vmtrace_get_option
 static inline int hvm_vmtrace_reset(struct vcpu *v)
 {
     if ( hvm_funcs.vmtrace_reset )
-        return hvm_funcs.vmtrace_reset(v);
+        return alternative_call(hvm_funcs.vmtrace_reset, v);
 
     return -EOPNOTSUPP;
 }
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -270,7 +270,8 @@ int arch_monitor_domctl_event(struct dom
         ad->monitor.descriptor_access_enabled = requested_status;
 
         for_each_vcpu ( d, v )
-            hvm_funcs.set_descriptor_access_exiting(v, requested_status);
+            alternative_vcall(hvm_funcs.set_descriptor_access_exiting, v,
+                              requested_status);
 
         domain_unpause(d);
         break;
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -204,7 +204,7 @@ void vm_event_fill_regs(vm_event_request
     ASSERT(is_hvm_vcpu(curr));
 
     /* Architecture-specific vmcs/vmcb bits */
-    hvm_funcs.save_cpu_ctxt(curr, &ctxt);
+    alternative_vcall(hvm_funcs.save_cpu_ctxt, curr, &ctxt);
 
     req->data.regs.x86.rax = regs->rax;
     req->data.regs.x86.rcx = regs->rcx;


