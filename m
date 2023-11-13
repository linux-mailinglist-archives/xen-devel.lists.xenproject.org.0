Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF37E98EA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631465.984797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2TEo-0003Jr-Sp; Mon, 13 Nov 2023 09:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631465.984797; Mon, 13 Nov 2023 09:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2TEo-0003Hi-PH; Mon, 13 Nov 2023 09:28:10 +0000
Received: by outflank-mailman (input) for mailman id 631465;
 Mon, 13 Nov 2023 09:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2TEn-0003Fm-2z
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:28:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4039c56-8206-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 10:28:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 09:28:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 09:28:03 +0000
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
X-Inumbo-ID: f4039c56-8206-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsNs5Jjgi7zrYKLP16A791KYwzcGgIwJkdm2IUIWF2AGcpgXPWM6CIjJBRQ05A7Ty32LlcIvblOuBWajmwifn1Lc01HS3X32L9evROR3j/kykfZrxe3V3nLFzaGUrygw8psjwu79OQ1Djx474dQ8wby56uDrszbHAMwCLb29rwJoxrU3OvaK9nbOkWK88TTs1UQs0Gz3hJJq9aOcA2Q7LQ8aWvbS2st9/5JaWh8tUZDKGoFbKaPIAu0D8qHOXiTS6eB6iHyqTh34kx9T1EflCAmy34KOtcPe50LxqlnC4IAmCGWRxxSNMVK5RDI9OksHhtLyRHq3hjmID/D4CO+MYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IprFfEJOyudnsrrIYDrvL6CyRfjorIymqxcVkbLhRv4=;
 b=OmRsGafZxdI2GvufVeQbEVwYyOokCFn1Ajcfa+KYI+4/VMztE5FD+upMGa1e+IS7IUu+Su5m32wooyD/U3FemzVsDdMc82b9zGqGFj/QZJ3JUProWyLr9F7y4pCKR9acnhbTogsSI6iBOQgibyfLNM2mGYE95gp2NZKbEztcW+9CStmETP2eyeXPYT0+mdBo/tHKf2eLsoRV9DJjS/Zhisyu1PVGaEgMfhaU/IbZPGdVjw6pnDUYmsco0jAOHto7R+i9WsrhEzryjuX2vAsTsnEnlp+GdM/awpUA6x4R16UxN+SJvsxFO3AVe45MckWPFL6k7nNlco3PH7dy7UJYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IprFfEJOyudnsrrIYDrvL6CyRfjorIymqxcVkbLhRv4=;
 b=uM2+q0tIOnn9a6twnD4ymNzIbD5Q/1TUxngKIirjotzSXpWCpb3/jfSSRtpg/G8DR4VoC0IIjKPgDj3hMtKnYi6i9izRB5JV9F17UbLUDxykCd0CmSUDErW48CA2GXVMjaG/jxK1EVKn7bP9mYT/ZxRqySNnjK86aszC31waSjyY2rLRB6PvNtrEVXj2qxh2t0A1WboVxv0Xbg4MKelcU4Fn68ncHBI6+7iwspAtqYVAZzIzZvMStb76zrt0WTRbRhXAjPntCc1ZPE8BE8prjtSFQntx8cvx+gkJkBN8fjUqenxyGfxGQHlr2pcijKP6HeGERvsRSSXgPuTC796LbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53d3435f-f021-edf2-3b90-9ea8f1784725@suse.com>
Date: Mon, 13 Nov 2023 10:28:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
 <9d75d794-a333-792a-786c-064d35910980@suse.com>
 <7265e418-6c40-47ea-97a7-bcf3c2e61cf7@xen.org>
 <e70d9b85-00fa-3d7e-8c0a-d463cf0e0c74@suse.com>
 <c25eb77a-9a15-4450-80dc-0d9e2e79c858@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c25eb77a-9a15-4450-80dc-0d9e2e79c858@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c9037d-9b60-43a0-5e56-08dbe42ad604
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v0WSVwQsxBfKXVvxhHPUGIX10v+Pvwf4mjHv3AVqB+78cxsUqIH8yPSzX2oXG1YWZRevliPfEc3qc/45lycTRy62Aw7V359EmLa3eAke/xDa0v8r0ZA9lhtQ8SZpvwr4dZsHg1QgV1dzZwW7JaTXm1KjMb7QblA4XL7h5o768qtDIVcEcMTndXbAMHxgbEUmJZmHqYy/IOvIuyERIrdml74Qk7HE52SGDoRGYqUYLCP3lD9TRYjAV4WpXFm+XJZf8K/XfVCL2Lm3rAYyWYv0Pd70vvBgqM0pMBNVK6dg4bWMBBSff2Xk5KVRw1akZ7jqn3YpjwwpLJdycexO96UmbrbBUCGCabr+GAFhH5vnSoHt4ymBN5XdSKfu7B+EKNt4zwfz1pcqNZs1frikGHUsMZ46kKfbXWnv0ezkdXypZH/P02SAsV5O3Pa5qYSwXrzrJgPjO+PRZE9Gwt+Rk9RMz43JpppO4NVPX6hBY5X5nZj0apPc90Wlr5/r9RsD1pcSXJ6ZOWXWunhZC2KZhqyqyn2vgjFeO19xuovnYbwAWaqhWjI8dw2Amrji0PmWrV9vbIFq/alrF1CiNO7Kgz9xvKj7UtKA4hjt0HLgJIdkA82jU+XZ4khtiTajn/g3ka1yPC4Ib2GIyxSw08KZK1l5PQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(2616005)(5660300002)(86362001)(31696002)(41300700001)(26005)(54906003)(66556008)(66946007)(66476007)(6916009)(6512007)(316002)(83380400001)(38100700002)(31686004)(478600001)(6486002)(36756003)(53546011)(6506007)(8676002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ky9vM0RHeStLL0EwUUxnZC9weFNEc0VwZkowRkQwTjBLTC9LUlkrUDJmSnZj?=
 =?utf-8?B?RTljS3dqN2hTY3pMOWpaTlduQ1ZBS0RaOUg5ZW9ZNzBUSWtHU1Rwd3RERGN1?=
 =?utf-8?B?MzdyRG5xZk9KZnVaSWQ4blcwa0c3QjNhNzIvL2lwWkZsTDkyWVhaV2I1ZTBr?=
 =?utf-8?B?MEw4ZHVNWTkrNzZMVjdURVNVZFlhMnR2bWhWdm8wZkxTdXRMcjltQWE3QXV2?=
 =?utf-8?B?amY0eGIreWJMRDdXcGZwaWJtYjV5VTd3bm9jNGgyZGZpSEdxZnlBZ1hza2x2?=
 =?utf-8?B?bmdmdkRJZnVmeG1qcmFOaGQ1TlNBUGRIZnZFZU10b3g5MERvczIvR2E4aFFh?=
 =?utf-8?B?dWNEWkI3bENoZ2g3NFVzaXgyZStHQUswRG9DZ084dzV2YXgvcTJaR1FMNUpR?=
 =?utf-8?B?RnNzMHRHSlFDM1BFS0dwLzkvM283R1dmbnE2czVtck1rVUg2TG5QMlRoZXVv?=
 =?utf-8?B?Mk82T0NXeGRyM2dLR1dab01tMUpLRWxsUXB4d3picHFiY3dHc05UUmZqUVJs?=
 =?utf-8?B?ZkFnRm11TlhYY2tQM3NYS2NFWXRMTnp6SFRQL3lOQXlpVEdRRDZJY3NTMGk5?=
 =?utf-8?B?d3RIYTJnQ1dobi9IUkhsY0VUVnZRS1lmMVEwMWRCb0crWnhYaFBsTDZjZ2VY?=
 =?utf-8?B?NlovUjVJOThLekYwQTVkWVloMW9ucm9SK2FyYXU3UlBmZlBua1luekVEV3RX?=
 =?utf-8?B?VEtzMEFKWmIwVTFkSk5wdlBiL1paZ0VhMjNSeDloMDZKSS9JVXFaWis1eG4x?=
 =?utf-8?B?bGkraFQ3Tlp4bWFEVmFpSVNyUi95SFI0WHQ2UExqR0JGeWhWSmdzL2k2dDZv?=
 =?utf-8?B?N2RiK0I3TFB2emdRZGR4alZXN0FpM3JwVDNtYnpjSVd3d2gvNTEvYTRDb08r?=
 =?utf-8?B?NW1tWVZxeWFLQkZ0OEQ0ZFplK3UwQWYzamNuTW5xNnNXU3M5ZWxyMmhtdHUv?=
 =?utf-8?B?dG5HcEoxY0FyV1FnaFJQQVRBaVNTdW1lWmpRbnY0RGJvYjc2UGZrV1VXNlpk?=
 =?utf-8?B?THNxZXJhZmFVSmVLOHVValQ5NGdpQWxYN3VmWXprMVNRVFltb0t2bFBwSjhm?=
 =?utf-8?B?TkpPeGVtRmc4MDZnMTBUZkZQTmthRmZRY05Pdldzb3p4V0VPNzZvbDErSjBH?=
 =?utf-8?B?QnRUNmtjSWthM3NtMlF2K1hVYWhHQitveDU1L1h3Sll0Uklza0twTWtvRHNy?=
 =?utf-8?B?cXpzR0svQ0RiYnJERVoweTZrbjVtY1pSVFZnT3ZldHpVZGJHS3Y0a21nL3NZ?=
 =?utf-8?B?Y3FieHZlNHlwd2tlMVhHbzJzSXBCdEhuSmFiTC81YzJHaEg4QUh6MnFZMk8x?=
 =?utf-8?B?OXpITWZCQ3lEZ0JRampNOVFIc0FkSTZML2NxNjhOWHQwM1JPc2VpQldtRjVI?=
 =?utf-8?B?dDJBMUpTRGJOUStUSStEUFlGUUJqdW83S21JdllUbG9YYlZEQlV2alNoQ3E5?=
 =?utf-8?B?d2k1eForVXljYnByUGZGdm1PN3kzQXdYRnU0YkRjWFBPK0JWak14N0ZqclYv?=
 =?utf-8?B?OGVwMFRveE9GdHFvdnRXY2R4TXhDcTdRMXI0N3ZhZXA2bWpyLzFMQlhSQ3VY?=
 =?utf-8?B?b2d0Nis1VzZkVXpOKzRaRFUvRE5VdXpxOFRKM1dKTEY3N1NvVEJRZFZJSVJJ?=
 =?utf-8?B?ZnJWWlduMG12a2JWcWlqN1VJK081WHZpMGE3RjQ0ODBOUFI5RUtld0I2SVB5?=
 =?utf-8?B?cHJ3enZneG9HUEh2TDMwcS8wcU1lSEpIRm1oeG8vdVlsWG5XL1JtQ05ycmRH?=
 =?utf-8?B?UHhwQkdNUzhXMG1sMStmNTVDZ2dKM0FVcHZhTkRpZlVSSzBOYlpONkdEL1hF?=
 =?utf-8?B?eFRDRWVOcitDRzA1a0pSeHRiQys0T3UydFlBN3p1VjFITXJMbStNeU13V2kv?=
 =?utf-8?B?SFpZaEFoYlByakRIYy83MDAxNXZmc0VIeEljY29TUlRiZGFnc1Z1dFpwdVJp?=
 =?utf-8?B?cjluM0xGYzFtNWNTbG12MHQ4NFh3VDh6TEo0anhsV3lCaERoQTh5UzFLTG85?=
 =?utf-8?B?d1hySklmL0tFcGl4MGhhSHhFSTExdEcxczBnek9RdW5zYVAxNktsT2drRGI0?=
 =?utf-8?B?cUs0eFc3bDlRamM3Z25peklPWHkwQUt0ZVc4d092dTVoMDhIMFJ0RnFCNnRI?=
 =?utf-8?Q?x2Ent4TNHmT90tTCxevbq29kt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c9037d-9b60-43a0-5e56-08dbe42ad604
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:28:03.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gaw3ePdtKosWgWW3dnolpf+CWYSZxZ/0WmQW3ARXJk8LGCAsrzoeDXvU2j5tT4RcDAd6KklZCRvxTRF27kePAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

On 13.11.2023 10:12, Julien Grall wrote:
> 
> 
> On 13/11/2023 07:37, Jan Beulich wrote:
>> On 10.11.2023 18:38, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 10/11/2023 12:44, Jan Beulich wrote:
>>>> On 10.11.2023 13:23, Roger Pau Monné wrote:
>>>>> On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
>>>>>> Get the own domid via creation of a temporary event channel. There is
>>>>>> no "official" way to read the own domid in PV guests, so use the event
>>>>>> channel interface to get it:
>>>>>>
>>>>>> - allocate an unbound event channel specifying DOMID_SELF for the
>>>>>>     other end
>>>>>>
>>>>>> - read the event channel status which will contain the own domid in
>>>>>>     unbound.dom
>>>>>>
>>>>>> - close the event channel
>>>>>
>>>>> Should we look into introducing a way to expose the domid, so that in
>>>>> the future we might not need to resort to this workarounds to get the
>>>>> domid?
>>>>>
>>>>> Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
>>>>> a non-HVM specific leaf when it was made available to HVM for pvshim
>>>>> reasons.
>>>>
>>>> Couldn't we retroactively generalize the type-agnostic parts of that
>>>> leaf?
>>>
>>> This would only work for x86. I think we want to have a generic
>>> hypercalls so it can be used by all arch.
>>
>> Hmm, yes, perhaps. Otoh it would seem desirable to me if arch-es also
>> provided some extension to an arch-natural way of feature detection
>> (which CPUID is on x86), without the need to invoke any hypercalls.
> 
> For Arm, I can't really think of anything other than hvc/smc which are 
> used for calls to the hypervisor/monitor (so basically hypercalls).
> 
> Please suggest if you have a better idea.

I don't know enough Arm to properly suggest something. Arm64 has various
id_* system registers, so I would be wondering whether having a properly
virtual one reserved in system register space couldn't do the trick.
(Clearly just one may not be sufficient long term, so there might be a
scalability issue with such an approach. Unlike x86'es CPUID Arm's MRS,
aiui, doesn't take inputs other than the coordinates of the system
register to read.)

Jan

