Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE4493B73
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258865.446317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nABMh-0000kY-6z; Wed, 19 Jan 2022 13:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258865.446317; Wed, 19 Jan 2022 13:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nABMh-0000hA-3Z; Wed, 19 Jan 2022 13:51:07 +0000
Received: by outflank-mailman (input) for mailman id 258865;
 Wed, 19 Jan 2022 13:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nABMf-0000h4-5p
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:51:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7f54450-792e-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 14:51:04 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-bCgevLqmNq6cOfmG-EaH-A-1; Wed, 19 Jan 2022 14:51:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:373::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 13:51:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 13:51:00 +0000
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
X-Inumbo-ID: d7f54450-792e-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642600263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CpC6hIhFyhNsB5EmZgPhkJi4wbmloz50+KsjrFaJzlU=;
	b=gDSmlukeLrudM/ysxp3tc1ZR1xfX41+SN36hiGr39XGxFVBnqjweNKK3Qz61UzOSzvwgVb
	x9/zoWIP6XE4TMZ6AgeKfHZYKxCNvuseuUF5imWkvSiG1Ixz/mK2EtmzWtzdZskjXPABtW
	CvzV0BrFE/qau4RGOYTLF8xVfemF+Oc=
X-MC-Unique: bCgevLqmNq6cOfmG-EaH-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRWKfMzhyxrGZDJLzper9e1EB7nDPi526bI9cLTJG+VwdWFdh1spN//Arq4Aw8hzloi8ybBsU/cDNl+gN5ykknJ1AXtdy8BOuaTB6slS3exYUhBAs6RRRAXE2MWjZelQV7nXTbg0XiZWDLxkxGgXEByW3g3WMho/E6C0qWn09t+f1SInnqOy4RLSYBqPXjHdUMc3+KnycD1WavQrzcD6fRcJCfurikZGjYfNhkz5Ovxrdpu0KwPN/bdGps3em6/WwmWSsod1QcwKqx0OttwdVqVKPJIqEPFXClEhjf+b9B86YzkcxEZP0cEp0cWk9nX3HpZZVXX4O3rf1ODsjuIiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpC6hIhFyhNsB5EmZgPhkJi4wbmloz50+KsjrFaJzlU=;
 b=VKVQpxmbCjVvyv88mBSEvppl8grdpoG7ypY4OAO0VaJLQOu67+CneL2cyXnxtiG96Rt41YstXsN+QrQj9iiD8VK1m5JpJR6sjUwGHumdJ9Rc5rH59xAkNjcPDURQ8moVeenzdW85jxYdZHao/r1tI5v64AHYgVjyYFJymfeHwYkRxDBMJzn0FmYABDMLKu+aqzvartOwMmxZvngP0FwZgdrgGW8JodnpeJ/ET2tfECoi/kDISPDIEQ38DgCi0Cxykg8jf2A57uato0MRw8AqiyoHbSD88xAJKqYFCz1bgPRBHH1ERfFI6rXu5xjrkTxwpDv3Whpy/xIlemrJrGjVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93ec9bab-0a21-365b-3bcd-0fbf70bdbbbb@suse.com>
Date: Wed, 19 Jan 2022 14:50:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/4] x86/hvm: Drop hvm_{get,set}_guest_bndcfgs() and
 use {get,set}_regs() instead
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117192533.6048-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117192533.6048-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c38ffca-7833-4676-6e00-08d9db52ba10
X-MS-TrafficTypeDiagnostic: DB9PR04MB9233:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB92331FCFF05AE420DC4A9C21B3599@DB9PR04MB9233.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GvEolbcqGJ8LyjiVibrDhJkRujXTqeTfcp4H+pKWbyorx5Hk6DPwt/nBoent6nlGJnOIk7m5c+NNuasAffiUNyZpdGgQiP3rwZUyXiPEnIt4kTQMOjfVjZwonl3SgLJdA3FjGYVs2htEseFnXn+a2bT04SUXL1hIU/PkCfyG+CrODONEZqHcFNbl6MYjEnGtLuv1P/gG9WmU+YphWRa1hZoh4Gc/jT4oADYiubasr9wTpUfEdMdvB6oNXCDSW8NxZ6Y8WPHjPRtbyFXeA8jhJYnEqp2+VM4FZg8zMpJV7rkfoHKiXz5hv1QRi6EhMpNLvOlDg6pnZedg9+8NOwno/qDVcsodQubEcXVpygM74relQ0PdRrYDZ46mJfuWZU1TXl3wlZyAM90suSwiab/uX+lXJTFy/5HLNgU8x5pE4Hl7V5PaBnWtwsvu+dUtjeTKvWL6oKJqT/7y37dSDGkvV/+g9KXV9Xdg7ZT8eMxrGbQdgz/TcSyOJJMXY8tI7FCBS7Od2TMJWF1szJ5s4NjZIKA+81GWaecqSRrzQSJf/G99or1Ob69Y+Bjh4fE3Mi8gPtKQ+80KAbFL5/qUOYD/jKicQ/9Iwt/MprY5oVVQ/Sy2quE1jCZDWiSeZsSJoBZoADSpHAZG7yVkbRBn86N4GLtYEE+caJBL57WxeYe8AVLUqDohxdA9pkDEzJpTkuin2e3f8TEv32m5f+64KuWKQQSaWLcfrHmNt3++sQyB2gc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(36756003)(53546011)(4326008)(2906002)(86362001)(6486002)(38100700002)(6512007)(6916009)(316002)(31696002)(54906003)(2616005)(66946007)(66476007)(66556008)(8676002)(508600001)(8936002)(26005)(5660300002)(83380400001)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1JNUE5MdUJqd0V5VDc1Q0FEV0N6bWdrdGlsNndGZUtPaXVPRjQ1bWtTSk5W?=
 =?utf-8?B?UnRlNkl3TVhjY0tWWjlRTWdxa0w2TTAxMVBTcERPQnVDVDlMZU9MaFlONUVq?=
 =?utf-8?B?cm5HaFRHMEVWZFhuUmJZbVJ5QTJyRGxBZUM0UFFWV1V1a0Y5OUtwWWpRenpC?=
 =?utf-8?B?M1lHK3REOHdWenNNYUhHYmFxeEFmSHQwcm00MFFpZEpRUUhMTnZZNUJzY2h0?=
 =?utf-8?B?aEYreGovVHp1bCs0SHdLRDR4cmpvZUIreFUvT1pJaUtHcmMyc2pkSG9OQ2l0?=
 =?utf-8?B?VjVDcUp4VnV1R1IrSzFncnl5cnY1VmdsZmxlbVF3MnV5NVBEN0NObDRHVEJa?=
 =?utf-8?B?UHkvUVdXU08wRmp5UHJxWGNkRWZkSXVpTG9RaHhNazhKQXYxQ1BBcjA1SjhT?=
 =?utf-8?B?aXFDcTBPOWRtMGdQSVNwMjZEVnNnajJUTURaQjl3ZFVXWlZlSHozUjVEbDVH?=
 =?utf-8?B?TUN3MFVWQUxqRTF1dFNUS21BVnJVUXMzaDFOVVlBQnhPc2ZVR2wzREpvOGYw?=
 =?utf-8?B?eE51NDVMN2QwSjgzZldRekpGVjNhb1djUDVhM011WTRxLzJLMGdWNm1xalBr?=
 =?utf-8?B?TUlHdE9IWXMvTmtMeVVEVVBQajJ1T1BLVkhJME1PSktRY082UWVHSC94UHVv?=
 =?utf-8?B?ak1wSTk0NFpuRHVrN25sV1lJZ2JGN1FpaG0vRWhRU1VoM3pLVStzNklzT2gz?=
 =?utf-8?B?YUFmaGhaRGZ3Vk13Vjl4YnpEdk9pWHJhQkMrL3hoeUpqVEs2RGx2cGZPWlR4?=
 =?utf-8?B?S3NUVTVINUprdGppRU1YODlsdkZZYzkrT2FsaE9yelJQWnZxdm1HenNOUjBX?=
 =?utf-8?B?ZlgvTDY2ZlBmeWpXOTdTSmNVZmRpNzJ1VC8zSmIzOEJhZEZSNjJTamR3UEJ3?=
 =?utf-8?B?N3EwWTZOOFk0U1Q0ODVDQkxYTlBSYU16OE9WVkxobkZKT0Z1MDFqNXErMXFD?=
 =?utf-8?B?bmlOdjlYN0lxVEJudmJabnd5eUZHR2dyVHV3QmZXYVRnV3U2M3JscUpkckkw?=
 =?utf-8?B?Sk5sZGhLU1hWV0pmaU9MRnBMVVg1N3JnWUNxUGVHQ1htYTRrWG45dnRpTUcy?=
 =?utf-8?B?bWlJWUVuVFJWVVVxclZEaGYwVktwMi9haExjL1QwYXZGZnFyNVFacWRINzAw?=
 =?utf-8?B?RUJkM2tySTVRNm0wdnE5SGFNbWJVZXlEbHg2dU8rRWNGcXN2eExUTkxjM3JU?=
 =?utf-8?B?djB6Mk0vcUZSd3ZzSXNXbW56czI3VVRHWFJESlkrWGFmMWpLaGp0SUxtSWdP?=
 =?utf-8?B?SDBpb0REdVA3c09WV2pyZ0VKT2RpYU8vOG4ySmt2S1M2Z3VOai8rb25EbjRP?=
 =?utf-8?B?ekJ3bjBWaHg1a0hvWWpCc1FLUHNYQjlLNkRiaWs2TUM4R2QvSkxsRlEzL2px?=
 =?utf-8?B?TkhOaC9wczVxbkJXWDEwcHVPZDltMUlNQ0JWdW9XQlRHVGdwUmpvRU5nZ0ph?=
 =?utf-8?B?NUhEdjI0THh2M2hSUFQ3d3lRcDdUM2FRY2VXcVdTTjc4ZXpBMkZRbVVWTFVj?=
 =?utf-8?B?ZUlrRWEySG1ZMjlXUGRDaWNxRk5waUNrMHVGK3A5ZVJkM2I5ckExTWhLVjlJ?=
 =?utf-8?B?VVRRVHY0UFVwa2FoaVloTDUxWmh5RXNXYWJpZlBPc2RpeGdxTGFrVlZZNThX?=
 =?utf-8?B?UWt1cTJ0YUJEa3FVVHJwWFd1T3kveGdrNG9LdWRrTXViZ254RzMrNTkzYlRG?=
 =?utf-8?B?emFNSjJvV3A4azdtVGhXdWFTbkE3R1RXaFlqOS9lTDlGV280QzhGMnNTQ3lq?=
 =?utf-8?B?djczaUNwaURPeUJkTlNrckE4UzJQMmhSVE9aNlE4NzZINFl4Q2ttMEJlbElH?=
 =?utf-8?B?TkpwRWR4VVZta2svVzFFNk9oYW5Daks3M3dSc3lLTjNZNXcxcHhpUmtPRGVR?=
 =?utf-8?B?VWRGajZzU0dqL1BQVDdCOFViNlN4UUt3S0FZUlBLOEYyTkY4OXhma3l2djNJ?=
 =?utf-8?B?dm5kTFFsdTQ0VDJyRVFudmppRTdnWCtsMU55Slk2clduUDEzYmZXYk9JRnlL?=
 =?utf-8?B?SzNzd2M5QnprWkd4WEI3UzFvOGo2U1NnVGlUdHVHM0ducjRmUHJtUURzRS94?=
 =?utf-8?B?T1o3aThjNE85cjEraXZaT01OUmFDTlNEV09ONWVrRXFFZEVLTEVEQ21MbStx?=
 =?utf-8?B?U3g1dElkSjNkTTU3bXBHc0xvK1g2S2FYOFJGY3JPZnFOeE5Zc3JGZDdxa3J5?=
 =?utf-8?Q?oY87xn6tkxTcWFw952U3hSU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c38ffca-7833-4676-6e00-08d9db52ba10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:51:00.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gHRZUu8hH23lq1mcjBnAasRPFwyXyaZG2NLcovQfsWBgukstM0lCuGcCfyAvwXnFkJdSBuPNF9YnCIKRpBiwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

On 17.01.2022 20:25, Andrew Cooper wrote:
> hvm_{get,set}_guest_bndcfgs() are thin wrappers around accessing MSR_BNDCFGS.
> 
> MPX was implemented on Skylake uarch CPUs and dropped in subsequent CPUs, and
> is disabled by default in Xen VMs.
> 
> It would be nice to move all the logic into vmx_msr_{read,write}_intercept(),
> but the common HVM migration code uses guest_{rd,wr}msr().  Therefore, use
> {get,set}_regs() to reduce the quantity of "common" HVM code.
> 
> In lieu of having hvm_set_guest_bndcfgs() split out, use some #ifdef
> CONFIG_HVM in guest_wrmsr().  In vmx_{get,set}_regs(), split the switch
> statements into two depending on whether the require remote VMCS acquisition
> or not.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One remark:

> @@ -323,10 +324,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          break;
>  
>      case MSR_IA32_BNDCFGS:
> -        if ( !cp->feat.mpx || !is_hvm_domain(d) ||
> -             !hvm_get_guest_bndcfgs(v, val) )
> +        if ( !cp->feat.mpx ) /* Implies Intel HVM only */

Wouldn't it make sense to accompany this comment by ...

>              goto gp_fault;
> -        break;

    ASSERT(is_hvm_domain(d));

(and then the same on the "set" path)?

Jan


