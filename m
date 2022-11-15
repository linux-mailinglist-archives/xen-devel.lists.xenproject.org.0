Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE106629477
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 10:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443838.698606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ousMw-000300-QT; Tue, 15 Nov 2022 09:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443838.698606; Tue, 15 Nov 2022 09:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ousMw-0002yA-MN; Tue, 15 Nov 2022 09:36:38 +0000
Received: by outflank-mailman (input) for mailman id 443838;
 Tue, 15 Nov 2022 09:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ousMv-0002y2-Vf
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 09:36:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff79bb9d-64c8-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 10:36:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 09:36:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 09:36:34 +0000
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
X-Inumbo-ID: ff79bb9d-64c8-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAY3T2oPEogvFz96X0sA/uMDtqngOyuI+RlonT/rwe+lBTowyvblUnURvoEC0w4IevQyIw7usXm9n6F8QBCd52PJAHLUuKNxBHJhB76j7jwAqw4Vky2ZC4yJBLz9CGs2q2ZUvmh4u7eM12YPW8TDgBLnONEhDWnMy4eBgGh+/c5oRLvNKrxQeZRh1cL5o/MpgGTkmdtsBAX1WIWg4NA6mh5JFnXuCDgDMZwsgN/ZOQuX7jc3KISwUyC+W+spCEQ3P5cbWFQP6ZuZ6j19HioSWukPpqB6rIsVrLnmKid2+XKOLXpiqmbxYaKMBz0igQ12Dc04zXIfS/RSjrC1GUZ4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMwrRRmWSfJXnxj1Gshc70uBJANUspBSzid+TYEwV88=;
 b=M4Aguy0GPChlvJkt3tTG3kcIM1sRqGewb9WkuS77UlSwKhdecxVYilX2V8YQs+ddmkwS0+Ljrc3kn0lisCvqxf7VFTc2xCNcJzUrrmikp5V9MXujvHkANaJy6KhyFNE0ewyqnlaFxb6tM5+UWsCBNuo+NqqOwdIbOujf1ET5f/TFVT4T2hbBZtE5OI9Klj8UGZRS6dg74runOtV4jXuydhPhst+5rwX38yPp0pQr9HXNbv5tYA5Wqg9usF3XTr8ZwsAeWShq0fomsQysIo8kpHUTaLvAMa6qhq+IW1QQ+e3BGZ2YTBiwrHRA2lz9fqnFoTw2KMcaiR77CpnBMUX/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMwrRRmWSfJXnxj1Gshc70uBJANUspBSzid+TYEwV88=;
 b=1qZWn3LzFDyAgcFnAG7iCzV+WMBIctu+LwhGxgEl7HzT2rdie3rfxnyHWtifapDwZw6JD8gcJuSHRbuWq9oKyTn+luIAUc9obd7Nxi6M/wJFXf4PZczeBDSflohVrwNNMYRY0NTyUHm8IHv8AANVGKQkCl92/NwyCTry7a5/DHbhXFlYoD2Cf4udheHaTzae6K4l4NQ59RmyLGSrj/t5sT+spH+xV5HYl2sT6qbQu+6gBqqPgyUQI47qoRNyYy6Je1kYqAlZy6XwX7dSWE/DLtKex4zdTYHSO0B5lY+lHvHUmJJOZOHzlaXROrkuKDGJ5ewuog2Mco8dUE2OXn0TKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6d5b122-2821-35dd-418d-c9ae42184d22@suse.com>
Date: Tue, 15 Nov 2022 10:36:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86/msi: passthrough all MSI-X vector ctrl writes to
 device model
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b12824-a954-4e8e-e03b-08dac6ece257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iSaA3TgUaBBH4ylD4JQ/RWpw/705xFPD+ZGPLfd0MMDBo3yDSlOiFK9rfV2eE2yYRrxak7+Dmyk8gGQsfSkUNqzbP1LrKCX5xrI2EwzZFOEyxNjRP3+VOzavbXXtpvDOLLk/Bdcou/tWG3aPsvtpBDNTigvJTy4toI3bJOUfsp1e1fVv3pt3nhUHUMB/Ka9k+yj+LOyGhX0dYGGOF9YgpMTOquM1J1ku0X+TqNOQvGnWo+ZuaEQQ2cGXEPRKKITge9U+tiK8GCF1ck5alLxxae4ho2Qtnmu3BkkqjjET3MScgzm2hOlaHjEQd0eH7A24XIGXrCfKMSojof11jEKNV4u/AXyLdsJCJpL+2U7Dvrzk2hUG2KphheuSMlHyvYkUDlrpJV+aObB+7YK308h85aJ9kDzg0CJTN0lIpyfhhhhuNYVnyLr79TWMPlxk2P/aAehbRsqWx+BTOf66EAIEDQyY4m3pp6AFObvtWAKMOak2W75Ixsl7nFjBPIErsEVd9+WzII9iqBor2miM0bgHUJ3nUMBUDe/eOvPenbZci+To3CH/Z6x3H1OcL/uq8AO35FkPbEDMEIvP78raoO0Aa0JITu/vWpNQyU2o/bd6Qdf+/fAN2/XH2Jbnhi5+EyssQ0lSv+5HJ7HDE7laWJ12oTKeT5JTxOt6HcH6Pg4HsjLbWFI0ah0Z0wJRpGfruCkZO7zACSXLH3g33xLOu23iUAcF+JgWLgpM2MJUdz9TGNmlNqLh1NGmiBydPjwQCsq/uVCArtp/shGi0D/ghKp4V2mg/ECXAlVxtyBoZVBZJUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(41300700001)(5660300002)(66574015)(36756003)(4326008)(8936002)(6916009)(54906003)(66476007)(8676002)(2616005)(66946007)(66556008)(316002)(186003)(38100700002)(83380400001)(2906002)(31696002)(86362001)(478600001)(6506007)(6512007)(26005)(53546011)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXcwdEpVT2IvTzRaQzI5VHQ4cktwM0lDMjhPZkVjZGIzZTM4V3VMazJXcGgx?=
 =?utf-8?B?dzdiLzhNdERGVGRaK1pBcDkzaUhtUy9RVmRWelBKK1l4OTlHNDgwdHcwSUQ5?=
 =?utf-8?B?Q0llbkRBTnhKR2QzOENwMTI2elBmdkJRYm1wMk44NmJsOENOMWRoSkoyNTRu?=
 =?utf-8?B?TjBucmxwZStVS2ZtSU1SNU5YYStFaWVCeDY3c2pVZ1pIOEdJSC94dVRFY2FM?=
 =?utf-8?B?UmVaTm9MTEVXRTZKQ0tEN0d2TmRZRVUwcERRMC9ZSzdyK0JYaHhXR1R2TS9O?=
 =?utf-8?B?SU1RemNxb1FrQlJaV0M1QjMxZDUyajNNZk8zdG8rUVJWK3BLSldBRnJWeFlX?=
 =?utf-8?B?MjRGUWVBN3h3L2FaMFBNZU1JNFBlMXlXVFRBZkZLdkxrYTlON2NjckVCTE9B?=
 =?utf-8?B?cjQ1TEJHOTVLcE4yWUNlRDZ2aElqT1EvUXRxUnZZZ3lqNUlmakQwbDNWSkNP?=
 =?utf-8?B?dXhzL01wZzd2NWV5b2VZMWlDOGxlZG1TUjU3d2hmN013TFd3bXdDWHpObTlq?=
 =?utf-8?B?emZHS0dQOGszb2lzTWlZR09nMFNhMmU1RDBmNWI5dmlRNVpoT1FMZkthUVUw?=
 =?utf-8?B?SFFxTmY5N3NqbEhveGhxamd0dTRmejhrcmxGeHdqVmpoc0xreURDcGxTLzhv?=
 =?utf-8?B?VTQ4cndUZDMxbS9Ja3k4REg3bllpZjB5NWlQWGZpN0JWRzB0ZjZiT1hXVFJ4?=
 =?utf-8?B?bEtKNjFCNU9pb3ErZU53VVg5ZXBEdE1uajd0bndES3oyNzFwMllmQkJBNThj?=
 =?utf-8?B?bkNwNnYvSlBUWVJyWGdZNkJwLzkvbGdMaXBSNDZKcVhYajI2ZG1NVi82RjRs?=
 =?utf-8?B?TWNKMlZVUGp5bmlOODNtQy9hZk5lUEtFQ1NkamZOaTlqSk9PTGxRclJxcnhx?=
 =?utf-8?B?Ry9vMUxldjlWVyt4T2czdmx2RGlMRkk1WEpiV3NuTjVKcktmMXRDblFUbFlD?=
 =?utf-8?B?RGMzZWptTU15YzNjYjlUUm9nQXVlcDd2S20xSk42aTIvcXp2RktiRlprbkpV?=
 =?utf-8?B?QmhyVkxTSlU4WmJKRkNVNmpRc0JjR0I4MHhOOGN3Y21ZV2NMaGFvdFdKRzla?=
 =?utf-8?B?ZnlTQlgvVzg4TjFPQ3ZNaUpIb2trV2pSK2hGRW1PMUZRazI2MFZwVkxNTXhu?=
 =?utf-8?B?bURsc1VoZlVReFZ6T20zNlNBcyswRUtnc1k2OEZWSVpwMVM4c0FCUU5OOS81?=
 =?utf-8?B?SVlVUWgxM1RtaktDNTJXMlJxWk9OSVBNc2dLL2ZhK0oxa0hCVnowSXRTd05m?=
 =?utf-8?B?M2pQeWxpVng3dmlBeW4rY3VJblcydVU4Ti9JMVlJT2U0ZVdBU2pSYkZjOTQ4?=
 =?utf-8?B?U2s1MTU0VCs4Y05LM2paeVBPbzZ2dGxHalMzTTZUNGxlZlpoZmlkcEpmTjhW?=
 =?utf-8?B?a0NjRWo4Z01RN05qdXZQcy9mNjF0RGpNUnZpTHc3RDlCcEJhMVVSd1Vnc1By?=
 =?utf-8?B?Ylh1a3FVeit2bW1Jc3c2dWZpQ2VrWnRxM05iT2RGN25JZGJGQSs4YkNwSmhu?=
 =?utf-8?B?VFN6dURCTlo2U1JhL0txTTZKZC9lalg0VlpGQUdTdklUTTJPOUFVOWdFODBp?=
 =?utf-8?B?cllEdFkwU2RXalU1LzNsMEp2emhXdXB6bk1MNU5iaWVSNHp6ZldKdmp1Njky?=
 =?utf-8?B?S3QrT0l3RGpDS3g4dGNrSVBLdUROUmI0WHlNdFA1VmhyODF3clF4VHU0Zjcw?=
 =?utf-8?B?cTBNS0Q1dk9QS0JuTk83eXByeit2NlJTQUNmNU1tUGZTRFBlcElVa1E5WExQ?=
 =?utf-8?B?QnFJQ3ZxMjA3REd3am83SDFsMzRUQ2VZVEV6bldYTkcvVVZnbUw4M2MvYWNi?=
 =?utf-8?B?LzRyQVZmQmxHODQrSnVuTTdDT25UanluS3M2SmJ5cTQreVJ3S2x5eElHVEhl?=
 =?utf-8?B?VWppVk13VUhLNFRtbkwramtSMEwwVXFSdUFzNFZybVk0aUVtYjE3bU5qZ3pN?=
 =?utf-8?B?VjRiVHMrQ1d3cUdzc0h6WWtZamFZSXFzL1NUaGsrS01rOTdmUC9ZL0JhL2hh?=
 =?utf-8?B?S1ZwbUlDTVJBSGMyNEhxb2JqaHY5UXc3N2pYMko4YWV6ZXdCN3NRTUJjQVNs?=
 =?utf-8?B?anRGQnBDNStrRWdRNGVLYzFBVTNMM0FIMnR6TjVZQWZKWVlHYklOdWF6dWJq?=
 =?utf-8?Q?SMLQvL1XRF7l+S5Vqvs3qYouX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b12824-a954-4e8e-e03b-08dac6ece257
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 09:36:33.9587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbN9X1L9n/P1cD45tZaE4pXCbHyxeklfoL/0/eMPDzgZxwutJKq4GHqdS5VoKLZVKC2dJoW06JzZmZpRZhg6sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803

On 14.11.2022 20:20, Marek Marczykowski-Górecki wrote:
> QEMU needs to know whether clearing maskbit of a vector is really
> clearing, or was already cleared before. Currently Xen sends only
> clearing that bit to the device model, but not setting it, so QEMU
> cannot detect it.

Except for qword writes as it looks. Furthermore even clearing
requests aren't sent if address/data are unchanged. If you agree,
please add this here in some form for having a complete picture.

> Because of that, QEMU is working this around by
> checking via /dev/mem, but that isn't the proper approach.
> 
> Give all necessary information to QEMU by passing all ctrl writes,
> including masking a vector.

Can we perhaps still avoid sending dword writes which don't change
the mask bit?

> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -271,7 +271,8 @@ out:
>  }
>  
>  static int msixtbl_write(struct vcpu *v, unsigned long address,
> -                         unsigned int len, unsigned long val)
> +                         unsigned int len, unsigned long val,
> +                         bool completion)
>  {

I'd like to propose an alternative approach without an extra parameter:
Have msix_write_completion() pass 0 for "len" and move the initial
check

    if ( (len != 4 && len != 8) || (address & (len - 1)) )
        return r;

into _msixtbl_write(). Then ...

> @@ -343,7 +344,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>  
>  unlock:
>      spin_unlock_irqrestore(&desc->lock, flags);
> -    if ( len == 4 )
> +    if ( len == 4 && completion )
>          r = X86EMUL_OKAY;

... this could simply be "if ( !len )", seeing that even with your
approach it could simply be "if ( completion )".

Jan

