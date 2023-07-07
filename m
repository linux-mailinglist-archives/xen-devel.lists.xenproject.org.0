Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658274B02C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 13:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560467.876404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjuE-0001PB-V8; Fri, 07 Jul 2023 11:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560467.876404; Fri, 07 Jul 2023 11:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjuE-0001M2-Rg; Fri, 07 Jul 2023 11:45:46 +0000
Received: by outflank-mailman (input) for mailman id 560467;
 Fri, 07 Jul 2023 11:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHjuD-0001Lw-Jz
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 11:45:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe13::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce3f046c-1cbb-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 13:45:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 11:45:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 11:45:41 +0000
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
X-Inumbo-ID: ce3f046c-1cbb-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSzOvlE/IdgpWQKQ6hf++BsQVZBszl+nqJSDEHOiWsD0uTWjpMwOHH/LSbKzfvH3Gvs9GukwHZlSSkpSHkKDyCvU+4oM4wm4YHwYaeu7x2eTIbW2yptzHjDNsgY3fH/8rzgwfLtj2h3/gpeSOX3e1MoQxbqTkm9JNQQkUXo7rxfT2I3jrcWgn4f/ZwH43LedA5T27QXtJ63z6sfTop0NDvTdAR1MT6OEmLb6hrjpftwSxsnwWgXJ9EdfX80QoIf4Xxl6M1ZuaCwxNLD2Kuz6jfhr40LjLLEgiZ3/da0c1EwaHjj8rsHhribOcTUJAJEaeJRp4F11BefFbwc8B7jh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjLq5P5nC6V2RHzAV3Ba2MVBfctPT2FEJss+T23KNBE=;
 b=Vqk9pqcQ/trR+b/hYV95UReHCqfcucnbzl3SEJ/8W4YDxrlooBhWHqBpSIJJZU7STXECJ2bwgdaV/Q0roKleS+LpbKLeHap+VGCmD31UsbgsyayFSwU+Na+lqnb7ud1JxFoMzIRxmsoEhJXA0EkH+zTvOipla5LIdd9AgOhc40ccExSIKWIs8qdBz669WmDLu14emxkk/1SD6HGzXhIGYHiTSFTjIOaQnsDpgxv6H+0z2RrCOZvw5n4B8UyJjqu4HJokwZYYccxkdrMiCBimU4qB5CpvdcH3fo94pYCjnSMJ3soOfblttindZQoJKA2yCEnOGsT5NhQCQL1JLW17UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjLq5P5nC6V2RHzAV3Ba2MVBfctPT2FEJss+T23KNBE=;
 b=k9MO/0erDt8g+pljmziMXYLKk7bmgm6tPjD4RPFiZrglNK3oOF3wypOf4cYbuLTWbEX0Mjt0CNYg0/yTkiLpmumkZ+UIMXy1EskpuFdHr0Kq2CH0EV0UaKsf0t0XDWZWca/mzDfnYKfnp2aYIpxPLVg6LuitBqZ7Fv70t1G8l6zlr0541NKBJlbppd4dxnNwDhGHNPFN3ofNQb/6hiT8lj7KGUogGUgHIBJe9E8iqru1qFAW2JLtuABsjwX/mxjZoTvR75hQ5kc5G/TPw3rlf8zVPPCfwKnswSoX2Ym20UJtQ8sPBPNW6a6Bg/E3at0gB2OJlVq5L2Ex8KzIz+Xl7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com>
Date: Fri, 7 Jul 2023 13:45:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
 <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
 <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
 <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com>
In-Reply-To: <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7135a3-3472-4e83-c331-08db7edfb0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ohQyEoxj69S0nCsQILVrtyGkA1RqIa/RigJLiMp6rT/fbFgmsab6TbAbyx89AOs5CwW9mnHtcmFb5BDbN+0qpfjgoWjZ/KBSYFTYNz3su/WKDgVtN1heOEymJ4HL6It3/k5iD02wR9YqDHbaWtfsGvAZhcAnS+SPF5ROF6QNEkLYlj1OFBxPRnuBGjvSuzU/18diHQ5bAwGv0jiyE+GyF0td0HSZb3rFPpH0WKs3v8DJjYgVPlqFK1KBM/1OgclTgGMAJlAA7miEhm1CG6DDMFHOTxuBDUxiRubt/ecp4DTPVD1KTU8cAX7hPR+cQMrWCNlZhWIr2pF3QnZYATnG+oyF2tqSh7WmY3m3iGOIYlgYPJuVFZUZ/5MKtYO1SZYYyHHyPqmg0QOXeIcF+TpXk7yQY0Ku9LKJIAy04Nn7F8TVF//vs3KfWg6HduFxxBTa9/TkuVBXh5y8qoqaw233JWVP1bkYwN7TMttqSdGsLcBk3nJK7HvWlgM0SxYFQa7ixUPSbEsdmz9FTCda6nxafVf0DzGkJTd+wBka7jAt65j39B/ThFAOGhw60gi1rlYPFm0mW0yXRkFMWiWo6beyYc8huwtOhfDuR8znP9i4p3qkZl/QbYK/jqRK6YN8tXuPuwKdE64+Fodwc3eaRFUzAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(66946007)(4326008)(66476007)(6916009)(31686004)(186003)(478600001)(26005)(86362001)(31696002)(66556008)(2616005)(53546011)(6506007)(5660300002)(83380400001)(36756003)(8936002)(8676002)(38100700002)(66899021)(316002)(6486002)(2906002)(41300700001)(6512007)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRIY0Fncjg4dCsyK1hZWDBLVXU4WGQrM2lkbUljdS9oYm9QdUxmS1NJQzMv?=
 =?utf-8?B?RXkrS09xMktPSGoweEwvYUdTNXNjKzRBSWdodDlIcTM1ekx2WWtmcjZzaXg0?=
 =?utf-8?B?NXp4dFVIcE1wNm1IVmVuTkdaOVppMXE5ZUR3TzRtSy9jRW05a2pCTWNWYmtW?=
 =?utf-8?B?amszY1NodGxIZ2xGVzlTR2dwL2ZXYk5aSm5UZE5xSHYvYVRvVWx0V1FkR3o4?=
 =?utf-8?B?ZXBFQmpYVElUYlA4TVZwdzI4STBkVDNMamF3aENYTCtPWEtONUdxVnZaVzlr?=
 =?utf-8?B?ZW40L2JBY0pxMWZlRmNobWFwTHk1VVd4TWNBZ1E2cG96aDZ4cUUyYUJRUjVN?=
 =?utf-8?B?akFSaEYyOTQ0R1hpUmkzaGlUY1p5UlBNNlpNbHl3c0dSYkxxNmlJYTU2NHIv?=
 =?utf-8?B?SGVHbFNsemJ6d2hOeUhWd1YybW5kdTRLeUkva20ySFk2b3hCRFVqMkNpaGth?=
 =?utf-8?B?ZklUK2k1V1lmZkUvSHkzNWFaaHN2U3hnaGIzRHphc0todDBqdm42S1NnQTFI?=
 =?utf-8?B?NjFKSElJMXFEMWI5RzllRUVHTjZuK1VqbXhEREVSRmhjMkJMb0NOeUltL3Qv?=
 =?utf-8?B?Wks3MkcwdjJPQkk1TnArdTZyQnB5VlZ4OCtqVlB4SmVSU2c2T05XK2hsemxh?=
 =?utf-8?B?ZW8zenNuU05qK3MvVzkrTTFoM1BTQ0NhcGozT3lYTUFpUlhqckhXbkdMRUgz?=
 =?utf-8?B?N2dxOTQrSXVIVER6dmtFR3F4TWRJSjdsT3JhQUd4d3NEc2FxSjlacW1weE0x?=
 =?utf-8?B?Y0pyb2pzNjNLZVc2bjlnM0xDbWxoaEdCY2tqYTBxUE1FM2xmeThpMWRWWXZ2?=
 =?utf-8?B?S0lqemo2V1RiS2lpb1FXUlVBWjVhUnFZODd1WXBCVkJCMWNMTjNFLzBLVkJu?=
 =?utf-8?B?UnAwQWo2VEp3SUNEWTZHYTkwdlpvelRSOWs4SExTYzJncnlyV3Boc2hQRDl0?=
 =?utf-8?B?S1ZPQlJTT1B5Q3I0THFLTmU0UDF6SnBIQUdzbVBXTFkwdm1PR1BmOVlzUkJO?=
 =?utf-8?B?WHBwMnpLWUxSdnc4aEQvWGI2VTI0TVlzSmtXMU5oWUJZc3ZpQ0ZlZUZWZFhn?=
 =?utf-8?B?TWJLSU9iRDdheTRqSUk1UXJFUjlZL2Jka0I2MDN3QlpPNGtRY3RHTE1KZE5T?=
 =?utf-8?B?dFhvcXI3QzkreFVNTmtmaDFzUXVGUkFNYXFCazBrV1ZIQ1hiTExEZkVhMi9n?=
 =?utf-8?B?eGNoc3lWWHBRUGc3NUNGZXNWRmZVUEZXOW9DOEtvTnN0dzhwNXZraGZUdHdL?=
 =?utf-8?B?U01xdXZUaXgvNDRhS0JzRlcxZEFIZTFFQzgvOTZGSjlJVllKUmdwNkM2aDFW?=
 =?utf-8?B?T1NUSmI4SjBhUng3bnNaNE1sa0VucWdaVWJmaGdoM0Y3bkxDdFRrTEEzN0Vi?=
 =?utf-8?B?WXZyWUpBZXpyNFN6VVlub00xMm1lbHVsMXllSU14V0IzZVFvSW9OcnhhTDJS?=
 =?utf-8?B?YmRKaXhIbmpDNEl3SXB2YkJnM3NtYWlaMGlSQ3BLekhva245R3VwYjZiUDI0?=
 =?utf-8?B?WTJuTmhQM0M2ZWNQOTlwclBsVWs0a09XbDBwYjFQS0xLNWU1SVJOQjRGR0hr?=
 =?utf-8?B?cnVtSWZ6L01Ma2lPMGp4Zkt0d2hnMUlMRVVYU2swRnhaMTZBMXliL1g2MjRw?=
 =?utf-8?B?QWxIbU9HTzd5cVp4dGRSRjNxSER3V0VNREhrdDFOOWJxSmlBRnp4WWV0dkVi?=
 =?utf-8?B?YS81NUZaMUNiUk9rKzBDNHprYlhzWDhFQmhqSk56eEFkK2ZsRzNBaVVUMXgz?=
 =?utf-8?B?TUZpN3llSmd2WmFDb1NoOEpINVJ0UkQ3SXM1c3dmR0pqbXFIZlB4TTJvbFRx?=
 =?utf-8?B?d1JTV0Jrb01sNUlJV3l2SkFCeGxvUmFTNVJqNWJXbXkveG1WZzhJNS95cHVs?=
 =?utf-8?B?ek9adUVueU81Z2k1bkNwNm1CdzV4RG5NbWozUWF0V0VsaUtUanI4UVdkcjJS?=
 =?utf-8?B?OGZ6cnIxUXBYcWFDU0pwRTNwSjRKdSsvVUhUSWs3OFFldG9qQ3YvVVZJbVg0?=
 =?utf-8?B?T3RsbERoU3ZkRXR4bFVuYy9TWXZWbzFxcGc2NTY5UkhoU3RQYmVvaDFNbFV1?=
 =?utf-8?B?WEcrZzE4eG9xWG16alMzVWl1RTg4L3JBTDE0dk0zTGtMNE5uR1B0TXN2eWhx?=
 =?utf-8?Q?haHDXZ4v2ht9eH0kB0TYEE1KD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7135a3-3472-4e83-c331-08db7edfb0f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 11:45:41.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLYTMChxIAAA+UHaNHJ6dx9uWD+IlgfrGXnziWC3XSgXUFFTqv5aR6/4zPTwEO9nQKtrvdExlPmM2xutDTh+Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320

On 07.07.2023 12:16, Jan Beulich wrote:
> On 07.07.2023 11:52, George Dunlap wrote:
>> On Fri, Jul 7, 2023 at 9:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>>> On 06.07.2023 17:35, zithro wrote:
>>>> On 06 Jul 2023 09:02, Jan Beulich wrote:
>>>>> On 05.07.2023 18:20, zithro wrote:
>>>>>> So I'm wondering, isn't that path enough for correct detection ?
>>>>>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any
>>>>>> other known hypervisor), it's nested, otherwise it's on hardware ?
>>>>>>
>>>>>> Is that really mandatory to use CPUID leaves ?
>>>>>
>>>>> Let me ask the other way around: In user mode code under a non-nested
>>>>> vs nested Xen, what would you be able to derive from CPUID? The
>>>>> "hypervisor" bit is going to be set in both cases. (All assuming you
>>>>> run on new enough hardware+Xen such that CPUID would be intercepted
>>>>> even for PV.)
>>>>
>>>> I'm a bit clueless about CPUID stuff, but if I understand correctly,
>>>> you're essentially saying that using CPUID may not be the perfect way ?
>>>> Also, I don't get why the cpuid command returns two different values,
>>>> depending on the -k switch :
>>>> # cpuid -l 0x40000000
>>>> hypervisor_id (0x40000000) = "\0\0\0\0\0\0\0\0\0\0\0\0"
>>>> # cpuid -k -l 0x40000000
>>>> hypervisor_id (0x40000000) = "XenVMMXenVMM"
>>>
>>> I'm afraid I can't comment on this without knowing what tool you're
>>> taking about. Neither of the two systems I checked have one of this
>>> name.
>>>
>>>>> Yet relying on DMI is fragile, too: Along the lines of
>>>>> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
>>>>> basically any value in there could be "inherited" from the host (i.e.
>>>>> from the layer below, to be precise).
>>>>
>>>> So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | grep
>>>> DMI:" is also not perfect, as values can be inherited/spoofed by
>>>> underneath hypervisor ?
>>>
>>> That's my understanding, yes.
>>>
>>>>> The only way to be reasonably
>>>>> certain is to ask Xen about its view. The raw or host featuresets
>>>>> should give you this information, in the "mirror" of said respective
>>>>> CPUID leave's "hypervisor" bit.
>>>>
>>>> As said above, I'm clueless, can you expand please ?
>>>
>>> Xen's public interface offers access to the featuresets known / found /
>>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
>>> via xc_get_cpu_featureset().
>>>
>>
>> Are any of these exposed in dom0 via sysctl, or hypfs?
> 
> sysctl - yes (as the quoted name also says). hypfs no, afaict.
> 
>>  SYSCTLs are
>> unfortunately not stable interfaces, correct?  So it wouldn't be practical
>> for systemd to use them.
> 
> Indeed, neither sysctl-s nor the libxc interfaces are stable.

Thinking of it, xen-cpuid is a wrapper tool around those. They may want
to look at its output (and, if they want to use it, advise distros to
also package it), which I think we try to keep reasonably stable,
albeit without providing any guarantees.

Jan

