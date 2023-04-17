Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6E6E493E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522090.811271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poOVm-0003gL-RF; Mon, 17 Apr 2023 13:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522090.811271; Mon, 17 Apr 2023 13:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poOVm-0003eE-OY; Mon, 17 Apr 2023 13:03:14 +0000
Received: by outflank-mailman (input) for mailman id 522090;
 Mon, 17 Apr 2023 13:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poOVk-0003e5-KZ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:03:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2082.outbound.protection.outlook.com [40.107.13.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34321663-dd20-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 15:03:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 13:02:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 13:02:40 +0000
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
X-Inumbo-ID: 34321663-dd20-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXKTtNzFPw0O+tPnx9C7+WiUPPK+LniL7sUvPyqjN/Jp60P3Ae0ETdl1KpkV+t0uawoBu1lcSSeyanYmstQSAGMxBj5OkzpgxJCU8aEq/zpJxTQfi0IpqWteHUU8GPmlWLr7cbD1ZsONYmO6gncw6nHVI7as9y4VpFTCgU/JInqhwSsul2enKGK6r36tWm615LankYiDRhzsIpF6j5YDG9QpuMqADxxyXNLiTd5jicLRoaeQ1wT7MARdgNilAy16mIChLhYDqu93N84uGt//LkJ1CMVB9rwAjITwhnSADlHaHgSnnCw3vNIqYnmdAwVdP4To8owzixME2dYXf5zq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEr06YXWBLCW6Qe7L/3ulkPBi4aePPe64tK3Vf0jxkg=;
 b=WS/V8JsF3vGWZ+VYET1IbP7Wm3Gdtw9/bYeKhpCNr3d1Ibt/Xsb9lYie+Kok2EEzJQeiWHu5LqvZToTWViSzNhlvw6B2kli00smAWwK3A+Lf/yNjCoTTVXqVq34X5C8WnV5jsKSTwRczZ9tPPH8ikKYVet/0fb2UHp4/RuKC267vDNSO6/CN1ktOCk7k8w59keo2CSLHGysCUkZ3CXpvHjLv255Rpncf+rGMgeFsWMQG8es2VLibOccMeasm0E0CXxKCxN95mu85cdNq9SRFoL3CRlUBvswZ0L27X1KXsCBprnNTkrc2UykpY1PBds7psd1PCH5WmLZyMBSS6eqesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEr06YXWBLCW6Qe7L/3ulkPBi4aePPe64tK3Vf0jxkg=;
 b=GtyDm4KoJyHVgcja0ZRt0S9Tt+c62UAh7MFa9Peoz26hBSD3L4fD7g4MeBduK+xo2lfVYhjyHfPwuBwjzxJMpDQuCBG76535+vCy3J377kSp4EWTgStxBoAquqSmlpo4eZevr5djp2nsh4Pjeb3GFr3pNx9TVOPRaKBdKDRlCM33AscsZJdApprFK1YHMV9bSKhsXaGcXY9BL+L0xf5FNqd4Z/ltlE56c0no/dblAja//ChBFsXJ4Ja6xskNDqMkyKZxZ6LPfVJunyxPDrSIsthDcb5eDvvskX5zJGexhz4m6EtVg00iM2AI3FJA1swWkb1uJeS6i2TB4l+CtPMvaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <225d7d9e-b5a2-7324-0e23-c610dd06f954@suse.com>
Date: Mon, 17 Apr 2023 15:02:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 9/9] x86emul+VMX: support {RD,WR}MSRLIST
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <b567e068-dcab-b294-9706-ffbecb36de3c@suse.com>
 <1c2cfeec-d64a-3e4b-013a-840f812da12b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1c2cfeec-d64a-3e4b-013a-840f812da12b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c0a1a4-839e-4b30-0182-08db3f440632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YhWbw4tSl8hl6PaVMDyLN81TRipEMzCYtEBOYFn1U74mZglXSUGG8oR0tqVCIGTISI9dqs3bzwAGBBqyX6vWnIr833wtPVcBzVs/e4Zw0Yg+W9q/ZHTHCDaKeENGgaF1NzyBxYQlBFnQEMlnJX+JFRxriQKZskf200+z/E6Z1q2mZle5Zt6mdI6yew1yu1VJljBRL8W/1nIPjNq41cnUGxFtwLqBaPnTR4phzrf3zvNlMOwJx2foG3FOMzExYTLrOdn3nTrglMcYkRDF1Ax+ns0xS9CI1VmeuIGUGt1i4RUAmGIk7YUxUYB1uvc+SlAj4Vc+ST2D4B9pfrJ10FZF46L6U58cKKSzCj3W3iR5YmoTM9BOhb65jfoF0LLbr4ZFAMpRA0IVPxOed0wKcq3IQWvs3DxbzoaCfzbQ0pdrn++OIear+nmtFbR6ftc9HqkPmvBQvE+WXzTKFF79jtutSXxL/xvABP8Zgw4GN+jrnOLFs+S7vaAuLhDUkO3XTE2q/+LIM8VYAoVP5uOYMf13g/E6ZVIiw2C7svoj6zX7GMLDjewNQuMoZKP7D0i+KlYkrSCfPCetAkA3Fg8hExfMyyAavljCDypBgpX/HBr+NybXg4rW3PEjaAEjFTgZM2W8VpkEgKLVDKiF57IBIwNBiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(31696002)(86362001)(38100700002)(478600001)(6512007)(26005)(6506007)(6486002)(5660300002)(41300700001)(8936002)(316002)(4326008)(54906003)(2906002)(8676002)(66946007)(66556008)(6916009)(66476007)(31686004)(83380400001)(2616005)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUpQT3Rtd0NVYXRxUloxTWJPTnptemI0T3dOQmVPRzk4R0pEUkpzVDZkM1hv?=
 =?utf-8?B?WXcvem1HblNrUzEvK3cxOTA1eG1QVGZBL3F5MkdRN0ExbE9TOExPb2tTT3FR?=
 =?utf-8?B?cGVEUi9MblU4R1Ixa0U4eWpCaDBEZ2FhcVBubTJ4YklIeG1xTHh6OGJsWEJx?=
 =?utf-8?B?Mm9PbnArWmxrcVdxZWNWSGFGY1Exd2s1RTVwZ1BEck1WdVluNVpVcEhWYU1K?=
 =?utf-8?B?OUhhdTNvWEV0VkQyVmU3MzhpMnNWdW82OHQ5a2RDTUhQRElJbmNsSnRST1FN?=
 =?utf-8?B?MlNjYnFVWWdPa2RvMlpqMzJTNFdyV2tuRlB4RUF1Sm5PZmxySjlWNWVWQ1FQ?=
 =?utf-8?B?SHdFSUQxc2NqTWsrNW5MczliSEYvSm0xZXEwZ1RxeGpEREoyeDg3V0RqZmtK?=
 =?utf-8?B?cndhd0ZJZlppUlRZa0Z2SXJNN3JuelJUV0Z6QVQ5T2llVjRMam5qNk53UHBI?=
 =?utf-8?B?d1cxSEpIQ1lXK2JobkVjWnpRdG5RY3ZSZXhiREwvNWQ5NnR4bk56MVlNMDAw?=
 =?utf-8?B?c3d4NjVmZU1pNFBwVFdVR1FRelQ5QkwrWXk2b05iTzNHbnNlZXNrek5QTVdP?=
 =?utf-8?B?Sitka2k0WE03aStTRVBIdU5NcHU1YXMrSnJ0dm02U1RtUjBFMDlGcXpVNzRv?=
 =?utf-8?B?YjI1RzRhTGo3Y21tbHNWM2x6Q2dnWDVoOGVWQjFxeGF6cUx0Szh0WFRncVBY?=
 =?utf-8?B?MDIyem9GL0tSZkU0UUREY0xPS2tpcFVDV0VNTTI3clgwVnRZMVZCUFN6bUVx?=
 =?utf-8?B?NlBtSWpLS3QwUGZDT1VvTXlUS2NWNUh6UWQyd3RCblV2MUJZNkVYU3BQQmI1?=
 =?utf-8?B?SlBpSytDYWMvSHZodlZrZlBYNHZiMGVpVXFoYkM0cmtVaVhpbXhORGZoVzRZ?=
 =?utf-8?B?SUZpaUJzNm91RWVhb1F0Q3M3WmM4dmVxRW9QRDJPUUk0QTAyblJyV1BIZDBu?=
 =?utf-8?B?VE1sTitBaExocm9oeWxSMEpRbEp0REtPL2ovRG44bmlZcWtjMnZiZkF0eGF5?=
 =?utf-8?B?MStwb1g1Q2JoWEpRcmpobzAzakZCSHkzbWF5UGNkZ2VxK1Z6aXpRSm9uRzY1?=
 =?utf-8?B?dUtRMVR1UVQwQ3k2NC9OWkZoZ3liTm4yUk1Qb09Hei9RRUJFUTljWFBvZHdY?=
 =?utf-8?B?VVlFdVByWUFkbW9NVE0yOEhDK21lY1FZbzVmWnpGQ2tscmR1MmNzSER3akVz?=
 =?utf-8?B?bkd1bEpiWmNVOGlKL2VyUVFya2VXdGdVQi9rM3B1aENidzUrL1BEWHNId0xw?=
 =?utf-8?B?Z2JIYTRuZnQrcU02WkVueGo1VWRmTWJ4dkJIWmVBc21LQ25NS2UrYk9BVzE0?=
 =?utf-8?B?R0xUcmY5RnM0S3U3UzBlczMrT2wwdlRhQmVuZ3B3UEVMMjhnRldQMnFaSnhD?=
 =?utf-8?B?S2t0cmZldlRsMWYvOG01R1lBbytFZWxiN0NtWUNtdVBpUUMyb25xTkZQM29w?=
 =?utf-8?B?MndpeWNMRE1YYnZSSWVlL3lLSXM2bUV3bnUyb2hYbUNxM0YxS2xZcTcwU09N?=
 =?utf-8?B?ZlhOdkFzTWlPd2pNVmdVa3pLV1NJdmtTYlBmUjRtYWkwUmQ0QThzbFZZbjdR?=
 =?utf-8?B?cmY2MERJR1BaT0hNSUtEeTZ1KzZhZlZ6OEgwQzZTd1lmWkc0SWVTNUROTTBV?=
 =?utf-8?B?UmdHTmRWVG1BRFRjWHo3bi80aGRlUTVrZTJwRCtKTVNiczErNGxPdlFxVlZR?=
 =?utf-8?B?N2pzcjZIUWFoUXkyQ3NFVXJqYVpPZGxFb2w0Z3cxUDJ4U0k4QUpxUE5VdC81?=
 =?utf-8?B?WkZUcjgxRmJyZUhXNVYwOWc1c3lmYkNmYm5DK1BhVW1Ob3dRaUFDT2ZiTmpq?=
 =?utf-8?B?REtqcVhOcWVVZWUySW5QeTg1QlJNeHRYS1ViNlVRczk1K1ZmTzcySHFKZU9J?=
 =?utf-8?B?U2lYeUsxT09DeE9Ia2tDL28vWFpqamV5UjVtUlBLWkhyL3lrNllHKzZmMWww?=
 =?utf-8?B?Lzc4YkxTWlNjV0ZzQzlBcjlTKzIvNHNzeklrSFNhT2xzQ3Bzb0hoSTJSQXFu?=
 =?utf-8?B?eGV0NFFNUy9LSC8vZGNiZW8vd3preitlQ0xZMnI5a1FtMEJRc3pKclVJVmVz?=
 =?utf-8?B?cGVlSkRkcWFTaWlhOGRoY1U5bTBNbnVkQmVYZ3dxellPMnBqWnBZc1dIN0lS?=
 =?utf-8?Q?LkepMF+muQuUhw5TCl5sCAmrc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c0a1a4-839e-4b30-0182-08db3f440632
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:02:39.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHdljvSw/R3LunLVXRM8bfNd71Xu4u0QWZ9787oHVITnILveTWHVwUPzz/kJe1+426iEw6OuLh6qLjMsD5CJsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002

On 07.04.2023 00:03, Andrew Cooper wrote:
> On 04/04/2023 3:55 pm, Jan Beulich wrote:
>> ---
>> TODO: Use VMX tertiary execution control (once bit is known; see
>>       //todo-s) and then further adjust cpufeatureset.h.
>>
>> RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
>>      blindly. Alternatively we could consult the exit qualification and
>>      process just a single MSR at a time (without involving the
>>      emulator), exiting back to the guest after every iteration. (I
>>      don't think a mix of both models makes a lot of sense.)
> 
> {RD,WR}MSRLIST are supposed to be used for context switch paths.  They
> really shouldn't be exiting in the common case.
> 
> What matters here is the conditional probability of a second MSR being
> intercepted too, given that one already has been.  And I don't have a
> clue how to answer this.
> 
> I would not expect Introspection to be intercepting a fastpath MSR. 
> (And if it does, frankly it can live with the consequences.)
> 
> For future scenarios such as reloading PMU/LBR/whatever, these will be
> all-or-nothing and we'd expect to have them eagerly in context anyway.
> 
> If I were going to guess, I'd say that probably MSR_XSS or MSR_SPEC_CTRL
> will be giving us the most grief here, because they're both ones that
> are liable to be touched on a context switch path, and have split
> host/guest bits.

I'm not really certain, but I'm tending to interpret your reply as
agreement with the choice made (and hence not as a request to change
anything in this regard); clarification appreciated.

>> RFC: For PV priv_op_ops would need to gain proper read/write hooks,
>>      which doesn't look desirable (albeit there we could refuse to
>>      handle anything else than x86_seg_none); we may want to consider to
>>      instead not support the feature for PV guests, requiring e.g. Linux
>>      to process the lists in new pvops hooks.
> 
> Ah - funny you should ask.  See patch 2.  These are even better reasons
> not to support on PV guests.

Yeah, with PV dropped there it's quite obvious to not consider it here
either. I'll drop the remark.

>> RFC: I wasn't sure whether to add preemption checks to the loops -
>>      thoughts?
> 
> I'd be tempted to.  Mostly because a guest can exert 64* longest MSR
> worth of pressure here, along with associated emulation overhead.
> 
> 64* "write hypercall page" sounds expensive.  So too does 64* MSR_PAT,
> given all the EPT actions behind the scenes.
> 
> Its probably one of those

Which leaves me inclined to add preemption checking to writes, but
keep reads as they are. Thoughts?

Jan

