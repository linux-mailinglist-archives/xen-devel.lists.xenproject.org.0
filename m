Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A25766A04
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 12:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571416.895198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKVH-0008J6-NS; Fri, 28 Jul 2023 10:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571416.895198; Fri, 28 Jul 2023 10:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKVH-0008Ge-Jy; Fri, 28 Jul 2023 10:15:23 +0000
Received: by outflank-mailman (input) for mailman id 571416;
 Fri, 28 Jul 2023 10:15:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wghk=DO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qPKVG-0008GY-2g
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 10:15:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b99b11-2d2f-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 12:15:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6969.eurprd04.prod.outlook.com (2603:10a6:10:11b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 28 Jul
 2023 10:15:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 10:15:18 +0000
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
X-Inumbo-ID: a7b99b11-2d2f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPPF3O1Ik+/b9xHKA9cQIoxhdUN9eV+Ue78wpJzpM8YMwkFnNBTZXJJjNiYdHEVQLaH2qWAvCYM1KHx51jEs78UaYipIW2/VDY7hFWCULNVflbpF8lOrGRDjNGlvkEbC53o8fpXcwRZUP6tmYdtCIP2b/FqSKcfyKtT5S4ZX8stLyPS5Wf05YslmzinAxDe6SGCxyfHjYOcUTzCFIV+RnoC3QOpHl29lDunMTGNQu/HyhBG+VvVtKp0aXaN9J5PMj9CdqG1EQQ4dc6LfSo7wLCBlbBrkis4oNcUCphA+ZiG/AZv6LeMuTQeTkz8l6N13Fd5A0bqpKtkEHN19yMz9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BexjW4l+IbUnw7a6/ux2k+O8ya8lYbpw2mLoMEDJjn4=;
 b=mukr18NyLDQvOIIXGT0jSy+jo82fgP3kzqxNaBNRncsCL0UwzC3rjS7EftfJfNfRpNFrOMqfWfokjZ22/ybB8Xk61dlQmGs8oYl8uqmtyry4l5fv0cu9AYkLtpUtY2FODYenY4J7k0zKtv7biC3gyLJB4dB3HFedYX0Gi5AqEFv8O14yxrxO6eqNzECVznme10wi9/XAxEzhjBV3Z+YAmRgO0B77WOx3zTgZ0PCRtM1DxsYk0qTZSPqwGH7mMimX5m9bHD9ZzDCI40aY6+ik7A9jOrIAOZOrN2dwnd2PLlBRIHyEl36kxXhH76ueepsokbk6YThvs5+XzLXgFMsIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BexjW4l+IbUnw7a6/ux2k+O8ya8lYbpw2mLoMEDJjn4=;
 b=yqtzIHKkYFKPNhOuZ7iUQJBur5DopZ5rYmXlmEs3mAiVqJVWAc/wa+XS5WSyj5fc0DK7IVwmzi5ecBiqHkzzqslcfQxALluh1L+BhtrVhkVb/EIfll1otAOnkjYzpSPEo6qj1Ptmhhm3E+9oCDY59rz7vh9mJJuqrxz9LQ2p8/stQfJfHbvLpBabS5mlKWstLv0Fh8sdstngp8gosiqv/wrtMO+qCLkGV5rfIEMdWaNprXdl2bZawy11N+mHWc5qwetO32wFekh+d4BjXlRmN/q8IjmNAR7MSXMxvs5trX3hTIsSlmuNeyfqy5HUI/3KGTnq8mJ9+USRGKM9k4d16w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc3741aa-de41-8269-b8c6-153cc0bd3a6c@suse.com>
Date: Fri, 28 Jul 2023 12:15:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/4] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230726125508.78704-5-roger.pau@citrix.com>
 <20230728095716.13779-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728095716.13779-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 12048712-18ab-4cb8-76a4-08db8f538b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AF4FbE1KQzP6oAoKgEXggjNjd2STLs785CSVBvgGePHqi3HDpWXfiFcoewCMKh0zVHXR30yOgiwGJfsGxTIS5Ybi+vcTA3hR+Rnrbc4XCgkDSmmcjzBmxBoJ4wus44w/fcDJMuKJz/yQf8no1IPHUlEmKxsGPoPAf+pY0bKUuYigbcwAC98mPjjC5mqxQT8cIhKz9YFwtWSzZGxtMvp1B1z/yS8xsx0brtbI0yzRVRBSyqx3xKpIsouJDhMJzI8YrUFRYeBY8fQTsgFRdEJOySKh54pq61jzSmEQ35PPNDKEzh4fVy304WbonpI5fvS8NRw4OC7cueWKRvXdcsFlR39TPXB72VW1RGpG0wJhSPwpha+DXkOMZj9UojtQjSyUKOsG9l9bCzLMKIOV4mbccS20Zp3ZngnrCCyd9Te05qTrXmfqStahg3marv9kvxL7RPVn32BFZps/Q1Rtm/vDNu5OKd2QzCozJ7TuA66UneD4zz0oqG54o6WwP5FVvuEPFNf8BCF31eKJRmK1oVJWsCRgTgT+UtogXCT0LIeL2qY8GWXt9GRo31yoxAW+zlHO+RETH8uUcyZqoaalyW6buenPHfYJx3eZAsnKbqxc85ru7q13IoyvZIfWb6ZcbvzDetAf54AW+s091ot8syLAwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(478600001)(54906003)(38100700002)(41300700001)(2616005)(66946007)(5660300002)(6916009)(316002)(66476007)(8676002)(66556008)(4326008)(8936002)(186003)(83380400001)(6512007)(26005)(6506007)(53546011)(86362001)(31696002)(4744005)(15650500001)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFVPcUJwa2tNQzNEYnBpRXhMeDk1ZmRWMGxMQ1NjVEhjVE5ua1F4ZGcrQklq?=
 =?utf-8?B?SVMzR3dPREdWY0o4MDNWVTRCQ0Q1QU1mN2dFeGo4MDJqb2hubVpZY0s1TWJq?=
 =?utf-8?B?SjBDSlB5ODBHY0N0VUxBTGsxa21DOGpBUjB4citwMlNTMmxBdTJqNnBkYjk2?=
 =?utf-8?B?Wk5rOVNKS2xPRHFhZmdrMUdzbHk1VHVSd1ZRckRtL0gxVGdtTThBNnorOFla?=
 =?utf-8?B?aEY4ekVRNE9LMFJMbndQVG1wdGZITzhJLzViKzNHZG5kc2hpZ1hUdVUrK201?=
 =?utf-8?B?R1h5Wjgxa2tUajcrNk5uTEN0MVdWQm1iVlFzWldEV0NIUU5RL0w5QXBEeGRx?=
 =?utf-8?B?RDFmd0RpNEFZcXp2QlJvZ256UGtxNjNzK2oyNUJGT2lWaE9ocDcwZFZHUk5z?=
 =?utf-8?B?MkNBZ1Y4bW5qSVVGak1QSnhONEJFWVhaSXBVVFlJUnN4VzluT1JwbnA0Z2hF?=
 =?utf-8?B?Z3Yxd2N2ZTMwL0x1cGo2NkhkSUdjMXliajFVOVNRaG5kQmZnbXdDUUhQUEhM?=
 =?utf-8?B?RFhyejBVRWdJYnRIOG9ZNHZZVEh0Zkt5L21KaXA1OXQxckFBdHpxWEhGa09p?=
 =?utf-8?B?NG40UW5tMExsZ1N4Q2V6endkeDlrM3prMW45ZUJ5Vm1xZmNuMEJqTVd5VmZ1?=
 =?utf-8?B?V3VjZVZDR3E3Zmw4TDUrS24yeFg4dEpHZno1T1ZZMW5UKzhmL1Rib1ZhcjV6?=
 =?utf-8?B?cmNsL3BvY09IQU5WOGF4dHRMZ3BEWEFJZUR2RGpjVmlpUkd2T0lJcTE2cG5m?=
 =?utf-8?B?cnlQb0ZqQnpLK0EzNXZBc01NMUVlZlBBV2VVT0N3cUNHU3lEUGNZQUsyNWxk?=
 =?utf-8?B?aTNkZ1hyWVM0SXhjd3RPTXBsV3ExS3B1Z2JOeVB0dzVSYW1UT3VUSTlyMnFR?=
 =?utf-8?B?OFkvMWplT2FaaWU2R2dZRjdYUVhPZjAzR2cwbkxsTG1DMU1adVBlR09CVUdF?=
 =?utf-8?B?L3UxSmgvU1NoK0dYT1k4Q3F3dURZd0NUWldSYVlDaXVRc0NCUDdrTGpEeFJJ?=
 =?utf-8?B?ZTRwUE1pT2lYZUc0b29yWUtSREVjU1NHVTRYaE1RWmlKSlpuKzQyUGxKNkVR?=
 =?utf-8?B?S0pjT0FGRktIZXEzeldTRGJIcHh5dFFiaGZyUEJqTUY4ZHlTT0tTWFBaWnZN?=
 =?utf-8?B?L24wbXhkSTVRVGFvR3RyVWdrMjRqNGhiTitBVU5yYm5kRisvSHlCM1FQSVIr?=
 =?utf-8?B?cHBiV0w0bTJaZ1hLWFVDdUZMRjN6STN5MEJFWkFudE15VHRiVlRqR1l0L3JV?=
 =?utf-8?B?YS9ma2d3bW85N0JkaUd2RXBnUFIvczhHMlhtVHVSMzJNMzJBZHJUV2dRL1l4?=
 =?utf-8?B?YkRoc1lhYXVBYnFsS1NPU3RxTzQ4enBBM1lTcnNxRkZKenp6U3NGQkR2anc5?=
 =?utf-8?B?NjdlNWRWUkxBUVlBWlBvT3BYdk9pQWlzWnZzZmhSSTc4YkVvNDNnTURJeURH?=
 =?utf-8?B?WmVUcE82R3l1NUV2cDJoMmhKK3RxTDNLMDRVK0NMQlV5LytvQUl2TXNHQmRS?=
 =?utf-8?B?TkpPTWl4YWxYSVpzb0FZM2VBTnpUazgyb21QZkdJZTVEYWFzMlJ6RVE3aXJS?=
 =?utf-8?B?WkVLNmoyNEJEMmRhY2FiNDZtMFFTSkkrYnJSNHJ2ZDl6bU1JVXloaCtxQ1Rv?=
 =?utf-8?B?RmhzTTNBMy9iRitwb3JHNkxoUVpCcW1FUWlub2tuZERsM3Bzb2tlYitiUFpV?=
 =?utf-8?B?cmlMWVFmMzV3YjB6aUJHaytZRmR1UXpuUjRFbHVkdXIvcE5QbGJkTXZnSFN5?=
 =?utf-8?B?dVFaMGdqdDVwd0N1bDJQRExEL3RabG5VRnQ4QUVIT3pwT0VaaTI1ZjRPUS85?=
 =?utf-8?B?MVVtWktGVmpQaUNKSlhGNVo5VWNGZXcrWnptNFVNYnNCRWdQcWdPeFNNWHY0?=
 =?utf-8?B?bElpcHdkTTg4UGRCN0xpdUdGMDh6eFgvUXh4OUluZWhyYWNkenlnQWF2eUQr?=
 =?utf-8?B?N01XZllzZWpueHpKNUdwb21VeTZkc00zOFBKbldwTGIwYkZ3OU1PZUpXUUpT?=
 =?utf-8?B?bURHeWpPVHhOWE1oUUZCaktoNU5jUm5UVUlmSUdSRFVHOFE5WUF1RksyYTIr?=
 =?utf-8?B?RnNVdEVNeDExWVo1ZEZ3RW13TXFPTXFCcnRIRDZrUVpIZjBteS95MVZyZ3Q4?=
 =?utf-8?Q?gPuSl0TUcCBZv919TQKPABwH2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12048712-18ab-4cb8-76a4-08db8f538b18
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 10:15:18.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6imxyRpyM6Q/8EAnKlcS7f0nrEy0qYUm+gDopG/m+Zm+tD8460HgkdECizxJbHj9eqHB+JIemZhGZJcmI1xFyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6969

On 28.07.2023 11:57, Roger Pau Monne wrote:
> So that the remapping entry can be updated atomically when possible.
> 
> Doing such update atomically will avoid Xen having to mask the IO-APIC
> pin prior to performing any interrupt movements (ie: changing the
> destination and vector fields), as the interrupt remapping entry is
> always consistent.
> 
> This also simplifies some of the logic on both VT-d and AMD-Vi
> implementations, as having the full RTE available instead of half of
> it avoids to possibly read and update the missing other half from
> hardware.
> 
> While there remove the explicit zeroing of new_ire fields in
> ioapic_rte_to_remap_entry() and initialize the variable at definition
> so all fields are zeroed.  Note fields could be also initialized with
> final values at definition, but I found that likely too much to be
> done at this time.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



