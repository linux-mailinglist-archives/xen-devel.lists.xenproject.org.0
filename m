Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5669DEAD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498782.769694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQkX-0006CP-1i; Tue, 21 Feb 2023 11:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498782.769694; Tue, 21 Feb 2023 11:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQkW-0006Ai-Uy; Tue, 21 Feb 2023 11:23:56 +0000
Received: by outflank-mailman (input) for mailman id 498782;
 Tue, 21 Feb 2023 11:23:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQkU-0006AM-Ro
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:23:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223d25f4-b1da-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 12:23:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.14; Tue, 21 Feb
 2023 11:23:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:23:50 +0000
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
X-Inumbo-ID: 223d25f4-b1da-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItxMmFUrGilg8cq0z2VAOdVxmkLS9pKhEllcK//X7RfvM7FIGM+qNgPZwHl4dnaA/kakd6G3ARs6JUFf+xJ0MDkvEsNpQB3/KeCKPEEygr4Ht+sJAzco0qQvD9agHo9i6Qv6Kt5LwvfvThcTKLYps1ddR3MirdY2swHLXrLFYVFqSNDpdu/DW3izDDjtzF/vGlcUaVAyEpcZbMsVx80rLRx6e44ENSWvY6IMeANxg+UAqc9Mc9QAToT1mQ2hstVDp1SMxbgZRuzBZxKEvqWe1tn0+IdDOeiqdn7otdJLtxRuPKRnXo2kF5gtrCNIUv6Wd9TKZJEbEQTqniulSNOfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQnlsk4Sloyu17UrIscbTr+TpVR3sIxbK3XeT00I/AY=;
 b=L7Mx3YJQxcnwI4dFT0qUbr/uJK3jEpdE1PJYV3wFsROSaMggKsAMekb9FDaACBrFpWeuxjwz4jOhjOi1ULONdrwptWxs/YoRKv0V18tSgOaNgxzYk0kkoFKtvm5HqZkJkUJdAGPoFphzSXAw0eBY4hMZIOyGZV8kK3XvQwUSOMYunjgXIWzwJErnSiuQ46SMeRR6z8f5+5R9Nteq03G81Wy3OtzQ67urXKjWuvjqFIbDNSJlVIH01z5uJ4bWjBv26/Q76CuxhS6nWYZjG0HnqMajE8LdnwBZysSDXTa/haL++xRP30MpjYj/65LCMOIJVfdX41czuoU1wqgIuBXtng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQnlsk4Sloyu17UrIscbTr+TpVR3sIxbK3XeT00I/AY=;
 b=seiGxQpw2JlCyYbXAvmhSBHdz1vZK2SwcV7Xo3QGFg6ooeGgA3IXfM1mUHP1mFTvtTwsrjh1G4YT4w6DiwJn/QLwvT5fpQ98hJLuuBRrGpbZh8Nj4+VoExbfiqqhG/Lb8Ukk7UAX9ZCLrmgaQ9EU/i0KK7NKnA+J/gNgs51N6bATs2hGHq/Hf/7yxFxVOhMynzT7dysl2MRKN78v8SmLCrlJgP+lsTE5+XUpbzuFxNKOa+u7yWUkOoOO29PCR9i97aSvuCM9aVpHvHUeMahytZMBOJVMFohfYP656hUCJPMrB1rTAMPGYS/s0iYfZSr9Is6iWzS4hJx1Ft/f+h5yxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <236c784d-e128-c35c-3c95-9b4dda08804a@suse.com>
Date: Tue, 21 Feb 2023 12:23:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] x86/vmx: cleanup vmx.h
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217184814.1243046-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c12d5f-6aee-48bf-8ac8-08db13fe1b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OzebrCSPMnkqLA73cHIK2KfH2n12MQ8RHoL5lozX+FFpy//bFxPyFN6C6onbXSlKWAjjLMSws7MIV+zVa9EYAjY/neMPrjBm6VHgx8mcMQpxT++NtyZDGbdQspzhi3kKNObeSRQuhFif5suTg9MMTiapFEhZCZWuYTp66eRCNsIWkUUojNeMOqm79jIe+k7PAAJEA2q21oK693tNI8kg22o+jZOZ3J9bZuOg9zCa8uW1rBEvW8NsV5/3O1m4PXnpoyUVCJOWayJ326bYT2S/ghIjcun1wv9EA+n69C0OsRft5lIcPnQ4/ugEkVkO4aOqPPi0ENKjvCBDh2Epj6MzYsJNoNFW/2yturi7ihUvT/7UpGzOe+Nu1dxAPOz0MhiYaFULQdH6qOu1flWri66/eHjpm23OPhr4QnHR2SancQzPgXbQ1N8Ou/0IGUdNAWeEyX0IzK4aHf+MVRkS26BTCuRnz+tKSBguQc35MbCw9IshDMts6Ccd1qCrqVHsPeT0XPrtSJErv4NTADQXZdwkIU/e4K/DDqI41dAhljMn/PFvdHG62ahWdecdRjy9+jDMUObjdszAwneHnCGJwpEUX7et3RH9EJVztzDXB37E2rSmh/yye2YhtXCXivUlNi0ZIJOhMqnX+OXeg5nFUz9qkpdJUoXHf8jPJ1Zm8obj9rK5tvHYEEgAGO1jp4pV0YKmSHt+HdvPXnuePeVPL/ajC0AXooWxunbh2PGsuSSdCtGnVaB+Bn039N/rhzjqCe8gj5DWFQtKVunvSdekGWPaadJy4Lk+RYk3T8TiFOy/Z+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199018)(2906002)(6506007)(4326008)(8936002)(478600001)(8676002)(66946007)(6916009)(41300700001)(66476007)(66556008)(38100700002)(5660300002)(31696002)(86362001)(6486002)(31686004)(316002)(83380400001)(54906003)(36756003)(2616005)(26005)(186003)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlCa052YitxU2ZPVnBjbzIzMGtESDJUdWIvYjlnZG1YS3lrZjUxY0tnYnFR?=
 =?utf-8?B?MEVNZEZBZUNYWkN2bThiRUw0aGFYRTJhRUxkOGpCUE1SaU5zZ0hwVjdCNnNh?=
 =?utf-8?B?b2tWaEdYMkhZaVdtMEp0QVdlT0lMK21mQjMvY21lWGNLdkNmdG5WMm1HSXUz?=
 =?utf-8?B?aVJYRGxEUlF6MXhBT3dMbDJqNWFsb2VUeW1zSERwRUEyL29ZRmIvNi9CV0pa?=
 =?utf-8?B?RDBtTSsydDFZMXM4Uk1aR2xWNkthQ3g2bHVndkU5aEphMmdyZnl1UHh6Tm9F?=
 =?utf-8?B?V0NtSis3TmIwMk03ei8wSEwyNGh1endtQzZzVWl5UW1MOGwrelVManBPL2RJ?=
 =?utf-8?B?bUcrNHh5NDNROS85QTlHZE5IQWJDQmFmTHZCLzVVZEtZdDUzNU9XbzY0VDRw?=
 =?utf-8?B?T3ozSFV0QWdmc3JEcThybkdJUHlUQWp6VHcydXpFZGJHMXhxZ1c4TnFhZUpM?=
 =?utf-8?B?Vlg3ZWtNMEdsdlZOeEJjdFhwYU40QVdCZTF6aGxmTk1yMU84R3pEMHcrMmtu?=
 =?utf-8?B?K2hjQ0Y1VjZYQ2RqNFJ4MWVOSU9mWG9wSjY5bHBmY2N0SDZJZnYvdGtOcjFa?=
 =?utf-8?B?eisySDhwak1PQ2ZVRm15cXRkMk1NbGc0TDBWelY0WFIzbDZiZlk0cDNaOWVO?=
 =?utf-8?B?d0N5dWwzQjJoYVRkazM4Q3FyNGtIdTQ5V1ZoNGkrcmkxelZFeWNYVitLNkJ4?=
 =?utf-8?B?OXVuTHdmRFYrU2JleXVwRXlkL0w5UldWRTAvMW5qaGlvdWVVWklXL3duMWZh?=
 =?utf-8?B?NmpzV0R3QzVIUW1lUXRoVzhNUFA4c2l0SEZSUG1Od0owNjhlU1dRM2tHTWtx?=
 =?utf-8?B?VWRFNVZ3QXN4UU9yYUI2WHpHS3ZKYVJZZ3dxdysxTUFuK0VjcXFOSDd6aldR?=
 =?utf-8?B?UHNkS3BZWEU0T2pTM0RPRWRQUjVqZ094bTZQeUxCVWxQY2llNTY3aDgvZy9S?=
 =?utf-8?B?SGwvcUh0WTJNRkp4T3o0ZUNMVFFwZHpiUy9sQzRIUlYwM01iTmg1a2dkWENK?=
 =?utf-8?B?ZzZHbHR2amFkanVtV05OdnhYa1NlaFNRS0puc2dKRzc5WkRTdk81TzBINFhr?=
 =?utf-8?B?MzNZYm5WTEFvY2V1NjlMQk5EU1NXZXpQcUxZS3BWTngxaFlGVjFuSm4zNmNM?=
 =?utf-8?B?ZlE3UE9XQzd5Z1dyc2tGc1J3TC8vamFFa2VLNmJDZ2F1cnkwMWlkWUhCcGVQ?=
 =?utf-8?B?RGVZUGo4V2VIR0hyekZlUkxjN0FEc0srb1Q1Z0pwUmRKUWp5R0IvbGs4c2Yy?=
 =?utf-8?B?V2ZjazI0aXFtQ3FrdVVDZnJjMFpBNERrUmZ2Q0JjY0V4QXFSTllhVERueE1O?=
 =?utf-8?B?ZWpZS3huOGUwYjVUaVZMa1gxUjM4QzhXeGtKNFgrUlE0L21jSE1ScVdEdlJ0?=
 =?utf-8?B?WmovWkdHN2JYL0VzS2FmM1IwQzA1Q3dHcEZZWGdZWWRwQVJpVVFzbWtiOXl0?=
 =?utf-8?B?WDZFYVY4ajVKWkJpNEVYNFp6azVnNm1pT2Q2MnBDZm1IWjJqMkp5RzlTem5v?=
 =?utf-8?B?cWFsaFhEV0k3Z0RybEZsZmpuem5zMlp5cVJNcFJ1cGNDM0ZYSFA5NHc4V0J3?=
 =?utf-8?B?anc4V0hka0krQ3ZMSFZFQldHYUNRRFZza1h2WUdMeW93Ylc3a0ZBUktwYmhG?=
 =?utf-8?B?eGUzS1lXS0NPdlYrSkd6MVVIVXdrNGZBSVFYT05mZXBuNkM2ay9jbzd6L0I3?=
 =?utf-8?B?SUJzTzJ5U3l3czNUNGdna05LVklLMkFrL0RucktRZDJMbFozaTRGNHFJanRW?=
 =?utf-8?B?bmZuZCtyWGx0QzhjZUNCV3g3dlhCaXlyTEpxUWNzcGtLaStyczhUaEhHTmFK?=
 =?utf-8?B?Q1NqQ2FqaVJDa1VQZDRuTTV5OEo3SVZUSHdvcTVaSi9JUXVnb0p5NHErUXYw?=
 =?utf-8?B?K1ZiUDFsQnoyNGtCV3c4UDUzRWVyRlJqVVJGdXdlRllKSHlyMUxJWjBKTXhz?=
 =?utf-8?B?blhieWxtRFdEUGIyNmc0VFpmeWE0MWxTKy9YblQ5WUw3UzlVTjlwcWZFSVlu?=
 =?utf-8?B?a0pNU3IydmJMWHoxSGRISHA3dTcyNmtxdXhBeHVkRGlRR21rSDVDS3FCVVAy?=
 =?utf-8?B?SmJBRlV1NnFqTUQ4STZHeVY1YVljV3lQUFU5SmpBWG93WEdNenpxeWw2ODBj?=
 =?utf-8?Q?tDBACivvoF7CQtjK8Ej66erHA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c12d5f-6aee-48bf-8ac8-08db13fe1b58
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:23:50.6028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HddClMT4FA8vR5GhK6iVZcH8401+gxowZd4Cakp/5IOtM6JoDpfBHpYE4949+31JUb7Rmv+Dxz3DU9L2uDhdvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908

On 17.02.2023 19:48, Xenia Ragiadakou wrote:
> Do not include the headers:
>   asm/i387.h
>   asm/hvm/trace.h
>   asm/processor.h
>   asm/regs.h
> because none of the declarations and macro definitions in them is used in
> this file. Sort alphabetically the rest of the headers.
> Fix build by including asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().
> 
> Move the definition of GAS_VMX_OP just above the functions that use it and
> undefine it after its usage.
> 
> Move in vmcs.c the definitions of:
>   ept_sync_all()
>   __vmxoff()
>   __vmxon()
> because they are used only in this file. Take the opportunity to remove a
> trailing white space.

While the latter two are probably fine to be moved, I think the first one
wants to remain where it is, as new uses might appear.

> Move in vmx.c the definitions of:
>   pi_test_and_set_pir()
>   pi_test_pir()
>   pi_test_and_set_on()
>   pi_set_on()
>   pi_test_and_clear_on()
>   pi_test_on()
>   pi_get_pir()
>   pi_test_sn()
>   pi_set_sn()
>   pi_clear_sn()
>   vpid_sync_vcpu_gva()
> because they are used only in this file.

I'm not fully convinced of such movement. As a general remark: We typically
avoid "inline" for functions in .c files. Yet most if not all of the above
are pretty good candidates for being explicitly marked "inline".

> Move in vmx.c the declarations of:
>   ve_info_t
>   ept_qual_t
>   idt_or_gdt_instr_info_t
>   ldt_or_tr_instr_info_t
> because they are used only in this file.

I disagree with the movement of such types. Sooner or later they may want
using by vvmx.c as well. If you want to move them, then to a private header
under xen/arch/x86/hvm/vmx/.

Finally I think at least the individual groups of what is being moved or
adjusted want splitting into separate patches.

Jan

