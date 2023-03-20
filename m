Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314C6C1307
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511909.791351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFO4-0002So-K1; Mon, 20 Mar 2023 13:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511909.791351; Mon, 20 Mar 2023 13:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFO4-0002Qr-Fo; Mon, 20 Mar 2023 13:17:20 +0000
Received: by outflank-mailman (input) for mailman id 511909;
 Mon, 20 Mar 2023 13:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peFO3-0002Mf-IG
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 13:17:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe13::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89efc233-c721-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 14:17:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9992.eurprd04.prod.outlook.com (2603:10a6:10:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Mon, 20 Mar
 2023 13:17:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 13:17:11 +0000
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
X-Inumbo-ID: 89efc233-c721-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ9Ia/E0VIM3OlTRGRwEGq+KN4/Oh34rgjez9Lb6Lre08d/av2AJfgUXvoLvcGw3fHlOPoMLhXDEBis1aR7aCP3qZdknYYSlFEwhKuUkghM7ViIGGpCdHSl3Itf/hPZMicXFeWQWmh5UyVLvlwl3c9WYfUfEgct+SW2ikvB3VvNSddWCYUqasUqfN7R7TuZPhoaQ8m3yujY37PsbAzi960NMpUYPqoCPXSIx1k2xUkQGCaes8DFJ6VWnziaqn6i62KVXFO74NcCBccvWQ407+AFAQuc0SqEP8KVWCCDnX3kO2EwzFCEl+8Nv5yT5J6j9lHV/Xm22oWmOas6Af8jlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjlVsSppr6HeIkwhJrbLyfv+0fzq8SvYNhBrFRK9OmE=;
 b=nL2y6hegM8VqFTBr969p/UVtuaa2MMbpzb8F3GsxGyjPv3VnEHVxesj0zskwsok/4NxqPmjTlvhZ9T+sQdcj1JQi8ee2ifmrID3F4a0uM+p8WnYJOLmwQEh/23ZBDmEo0ygKt1Rd7eMS7VA46plMKJ/uW3PPhhAnBbM3PjjQmV/4OZcMM9HXorJwlfTx9KtCPCBzgMcFFc8CGQZKJj8h6rTXXJyTMMjj06rYuFUz19gw77DM0wcV6YR6MA1SKCHWgoNzZbc75H5KZBfdrEmTNUPLP/mYkefaPzpWCvoJ4lvtrf6dUFJArRPVZbRx44eaSy/ar/a7ie9WZORgvjpaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjlVsSppr6HeIkwhJrbLyfv+0fzq8SvYNhBrFRK9OmE=;
 b=AEYMvsMZzu4MGStl632HcmgbqV/Mxs6Wbp/2IsD7O/AeYitOTr5sIczCCMUlbQa6m+EoUPeQk0GdQmLzlTnoNmpI7VNnGiGll1hYXXj1c53V7DXUGxz/+xJt30YNvNPwPw6S7CA7MgTw7Ex/zTW5qcSvlEhDwb1WhoDqCajuxfhtCZG5vNP0K008jGgaG4a0UqzAQC53CJj2gdYF8i+ODY2nZCHihPj6rc/8MWv3LoytAQpEYg4Iuz3CTd84hgWLtfxgsCfQWHL8RGJbG7iVT0lVyMwnV2O8oqjPlmdJT+5wP6Co5Uoi5ICTbCV7XqFjydknQdmsxmY867SbVrdRgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84b1afc7-26cc-75c8-b9db-1bec4656ff8f@suse.com>
Date: Mon, 20 Mar 2023 14:17:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
 <0303d8a7-722f-3c84-042a-1cdb059beee6@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0303d8a7-722f-3c84-042a-1cdb059beee6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9992:EE_
X-MS-Office365-Filtering-Correlation-Id: 039020ad-636c-4e61-dbac-08db29456a30
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HP10HtbERzzRz1Se8IBIzswKHVNEfjJJd6EnoAMS7PnfTFsk2ClPnT3R6bqpyiMYdOoO/T10satFScwIMmMwHX8G5nyjl3QsvY9JCbXxZf40UesycpN7tAlIif8LNxCi+Pe2W6D95Y9B9+vEvo9RCtC/yBLwoSYAF+SO3hFebhEW77ERhlVM8fLy9Mv5thkzeB80HeEK9YvO28BuR5VirV2bwTe/zbgSlUVu9f7B+S1xCknc9BWcomNf59Caem/7o0xgupR6E4Lx5EKEzdXFOLVox8kDFr95qiipRtGgyL9E5GEm5Qzi6ByRlus9zVJpXkBCamrQ9rq/10sgqS7gLBQfK3gE5nI+6C8WdD+5Gf5CEITzEzgPQEGtZzirk2bIAifPEcgFKsHXOnZt4lQltmcjkV8hM1/Sf9RC3qayftJk0K8DHlN4b4sXEUilVja77ffKmAXQZy73DeJQZ8dAvpozKxtklJS012yv52X6sNyXvd5vv4jYqTBkysBZUD1JsgqmwDlIhVck3I6MyntFrBkoE8g3BVv+wcva8a86Mgwfw/gj3FXVVHnLcqxErl6ixd0uBLvfeUUT80kLfm21U5ysTGnMThQt3IbQ+c//nvQyXDa9bYIImCbRGmQm5asf8Cre7VTDSct/xxcJX+9WRRGOw/qIGI2zxaMA02wjX/4f+7bBf8Bb4/m2oeCoTE9Wqx3TrXw5oFLaBXBf5HmBq5xa4ZMA9OXATGS6Q5m76zI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(83380400001)(6862004)(66476007)(316002)(8936002)(478600001)(5660300002)(66946007)(86362001)(66556008)(36756003)(31696002)(8676002)(41300700001)(6636002)(54906003)(4326008)(37006003)(6486002)(26005)(186003)(2616005)(38100700002)(6506007)(31686004)(53546011)(2906002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU9mQ1AraitZRHZLNzFUaXdVWjcrVlpFMDJyK1p0R3VXMUUzamNkZ0Y1a0NM?=
 =?utf-8?B?OTdITWdJb2NSNkFQZFFQSDlzUm9aZmk5bnNUMVluUE4xR2dPMkgxcGt1aVBD?=
 =?utf-8?B?RFcyWTRvaUxZRnBZUU5POW1jTCt4NEVaa2JqMXpBZnhWdHlrWG9GMC9FYkVT?=
 =?utf-8?B?NlQ3RXlKOW5icFVKa1o0cFRXeWxIWENDTVVYZDBBYUs0cko1dG1JdW9HOEN0?=
 =?utf-8?B?c3B6WVgxZlhlWDh0MVNzdXJyeVR4L3hxSS95M3JHeHBiaTIzRzM3d3VDcGJS?=
 =?utf-8?B?a0IzRlN4ejNQdUdhZ3RldTdTY01HWXgxWDFjbjNKT2dMb3pJMTZEdGYwV1lr?=
 =?utf-8?B?dS9adWtxRGlyT2gyUGVUbjVoRkNnZmhQdURhRjN0ZkZSTDFmN2U1RUVOQ1Jy?=
 =?utf-8?B?UnBVNDJqKzhVTDhDYm1IYktZRnpFRVBCTERwanpiNHErOVdybXA0YTh0UFVS?=
 =?utf-8?B?ZmpEN29NMFFaeEhpbWQ4REFWL1QxWnFGUWVUTHI5Y3h3a2tNL25Md1oyeTR1?=
 =?utf-8?B?N2REYXA1Sk85T1BmdXh0bTNZR0svOXdSVzFUSHBNYWFNOHNORTdDUjBGRzdZ?=
 =?utf-8?B?MzU1T0NzMzhuUTQvMTFrMk11WTFHRy8rMnNsQi9FOTlsZm1ZMUtoMmUvTStw?=
 =?utf-8?B?VVI5T3U2cjVUWVdwdHZ3OUJKRXlQK0FpWkV5YUVQeW9UZHovWXFlZjNnS2Ji?=
 =?utf-8?B?SlYxUDdpa3dLS0Z1UENlRlRQMmFjTWkzZFh4RlA4QkI3R2VCNnlidmNxNlQz?=
 =?utf-8?B?b1RkL0V5YUtkV3JRUnVoeG9BRzZkK2t5QXVCSmlITUpyT3hOU3FienlQdGls?=
 =?utf-8?B?dm00NXRUNVpacklwVVovSU9RTlhCaWZPdjk2VEsxMzg4aEdPeUpscXVhL242?=
 =?utf-8?B?V2ZYR1lXU3hsc2FxSWR4MFRzdTJvL3BIejJlSm1kSDFMdkRlN2hPRlk1NS9Q?=
 =?utf-8?B?QlVVUE1kbEhUcmtIQjRERTRkN1JTcDQzRmRMQ0J5SkxXalpSRFdRbmUwSGdl?=
 =?utf-8?B?N3cyNFlkclQ1ZGFxRUhUNmFlbWN6c2R3a3RHb0w2aWJ3WHFoOXpxcis3U1cz?=
 =?utf-8?B?NTZaWk9Ybk5INGRPME5tb1pTU3UvRThIQ3lSWkNzaU5SUGM0UDZ4U0QyS25j?=
 =?utf-8?B?d2VSbDlWNnp1dGMvNVFWajljcnl0SDRSUmNBOE9EMEtTa2U2T0g2bjRROXpT?=
 =?utf-8?B?TWkzMTMvdXlUM1hIeGdXc25raVVwZi9EY0JtL0FOb0NJcnN5QVVJa3gxZnpN?=
 =?utf-8?B?RzJpNjVYMnIxRjRUbFJZT1ZaRXJkYzlxandsMzlROEFXSEFyazl0bGJWKzVu?=
 =?utf-8?B?eU1EWlQ2T0UxOU1VbGR4THcxZ2d2eW1CZzhKWXhCZGhxUXAzKzZURmlXa0hO?=
 =?utf-8?B?U01wRlNsS0hIUjU3Y0g4NXN3ZXZmSVJNajBjamh1U2gyT2NHY3EyMnc1S0ZQ?=
 =?utf-8?B?LzB0dko3eVMrNmRFdW5EY1pTaHJ3UWh5ZE5YUXNqeG4rUk5vY1dSS2ZBVG4w?=
 =?utf-8?B?Qm40b0ZBQmFtcjM3T0FiT0ZheW1TUnFOT2g1VGN3dCtKS3JBWEhXU29CTUV1?=
 =?utf-8?B?cm5PZlplbjNmakNPRUExS1VnaDBLc1llY2N1NkprMm9VQURhTW01dnJrNzVu?=
 =?utf-8?B?Z3VyVjVYM1h1emVqNFJWdWZYQXQwbzdhcGJTaWVXL2pyUXhpd21OTGNkcHlx?=
 =?utf-8?B?VXVRQlNIcG1uczI5YWgrSytWUXlmWnVBaml4R3k5TldpZnZ2Lzl4bWF2ZjBy?=
 =?utf-8?B?dEcvbHRvVUFsRzJndGczTFdsWnhNNDNoczF4dXJ2OWdEMFlucVZGQjBTUlhR?=
 =?utf-8?B?NE5jK0hUTGJTZWp6ZlhhSmhmZ3B4S05nTUVmRk9neEFHTlpLcHpaWUFRT0NG?=
 =?utf-8?B?ejlyWGlHK1hYajhWRDBBYlNYQUhJQU93S3RiS1FDUTNVVkZjdU9NZk9KM0w0?=
 =?utf-8?B?MTY1NGdSeEJqUjZMeTRESjVjVVRuMThkQ2hvOUl0QzVIbnlZSUhSaURhbmxO?=
 =?utf-8?B?V2ZOc2hNclJ5d3diNEFrTkg3QmVSdUt2SU05WXVlRDJTL3pMcjdsVU4xK0s4?=
 =?utf-8?B?ZTNYMFJsMWdKblVYZ0NxK3NtcG41U2NGZnBjVDFRbm5SaUlZMmpHNlBWL0Ru?=
 =?utf-8?Q?0rrHcA1CUUIynC0IQ4DfF0AMN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039020ad-636c-4e61-dbac-08db29456a30
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 13:17:11.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAyQ1cjD5TatxGY5aqZsbIXoIHlILvZFfX2+taoJVdRYpJ89H0JQ+sCn7MKXX7XvW/SIjSKp+DY9WgjkJEOB3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9992

On 20.03.2023 14:02, Juergen Gross wrote:
> On 20.03.23 11:19, Jan Beulich wrote:
>> On 17.03.2023 14:56, Juergen Gross wrote:
>>> +void __init xen_pv_fix_mitigations(void)
>>> +{
>>> +       if (!xen_vm_assist_ibpb(true))
>>> +               setup_clear_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>>
>> ... using both setup_clear_cpu_cap() (here) and setup_force_cpu_cap()
>> (in retbleed_select_mitigation() won't work: The latter wins, due to
>> how apply_forced_caps() works.
> 
> Oh, right.
> 
> Just a wild guess of mine: probably the x86 maintainers would still prefer
> a single Xen hook plus something like a setup_unforce_cpu_cap() addition.

If so, I'm not willing to make such a patch. That's clearly more fragile
than the approach chosen. I guess once I've made the one adjustment you
have pointed out, I'll resubmit otherwise unchanged and include x86 folks.
We'll see what the responses are going to be, if any at all.

>> But of course calling both functions for the same feature is bogus
>> anyway. In fact I think it is for a good reason that in Xen we log a
>> message in such an event.
> 
> Depends. For Xen we do so in the kernel for multiple features, see
> xen_init_capabilities().

I don't see anything there which looks like it might be both "force"d
and "clear"ed in a single session.

Jan

