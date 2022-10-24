Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08B60ABEA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 16:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429164.680038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxzB-0005Ft-Ju; Mon, 24 Oct 2022 13:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429164.680038; Mon, 24 Oct 2022 13:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxzB-0005E5-H0; Mon, 24 Oct 2022 13:59:25 +0000
Received: by outflank-mailman (input) for mailman id 429164;
 Mon, 24 Oct 2022 13:59:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omxz9-0005Dz-SY
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:59:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdfab0c-53a4-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 15:59:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7284.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 13:59:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 13:59:19 +0000
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
X-Inumbo-ID: 0fdfab0c-53a4-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIfN1peJjQsThpSXq4U0OuTA6rXwpeBnkuFz1Wx8DlmTsTpSAd4rrVmyAm6DXwK7n1luwnJ4mt5QfqjTk0ozmfIc87ZT/3ihv1JXNCwNQz3Hy8nZlLxhmH/zmFpcHPJKu1EsxInP56AerWhb5VWrdg+gfqmWeTSjHWgtv6OPaOCyAv7Pqz7ebLy+Zr5c6RucvXONnB74fhCDnDURBz26h/rpDTYFyp0THai2X8EGepB4E1qCiynNYYSoS7w5Y+HnHlaDjLoHNPPnOG0J4REasIcplU5pSwHDFOQx8lG4nRU3J2sqkSPjdvUHIlP/foaZcASQpWslzfAYF8NrpBShKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzW76HaIhRVE8PDvR7iHadZ0BBffyIqYRW9ZWyBNlJ8=;
 b=BTTWpSWBsNeCAVZ4L5yM7GzSAGJ6SXq2ka8VyIPL7jQBjEGxH2lRZD+TEfBU5/dVl5QjIjUukGK1yYGG43THoxJElClXn7VgcLUBQN+R8Lo/6RzO8Zp8lvcESIKtF8izuOdrE3niAc+h3U3wiSsaswsUfxRBkQ4mrnVdJQSRkd1gfCBiJ9jQJvYFQve4lRCZr7+ucwvr6VgYia7Y6b2Kzu4yKoDqVk9lvEUjOg9lZQmrdQJLi/8KjbMSMSzc6wBJMCyqCvVRwPo/EY8i3c3A5DJFOogKVGFdLy7Cm8Zo9amRcBPQmy/z0gaiYTj1gj4EXO32ADPBJZ6tAeSGr3gInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzW76HaIhRVE8PDvR7iHadZ0BBffyIqYRW9ZWyBNlJ8=;
 b=fXC/s7DvCahPw5ViJQ6rgje9LF/5xYhB8pWNu7FN41wp+q7So18GGx1J5VItSzfnaiDv8IAInhb4BHhlckkOwrd/9jwVzTZlGOwR7w+LBtLOykqUBEJb0OiYKuduBDaNwyKZ495XdT4O+5YMBvdbKckkVeAmp6ABd9gKvl9yFCX65NrV4dswvQqBdvv/x1Bbts3ZTiXGtzn/+QKekTi0bJHNC8VK0O8sjLmLz/cf5KQRbVWu0YN4zm4yuq06SEG4h4fhm0+bwydfHb19o9xpXONeOwsCoU8VgyLEaeVz3WAdDE7zHpzPblNGHrp2C9o/7llTKQkai1MAoLSEbWKbmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <730158ce-d168-5dbf-38cc-78cdedcfe33e@suse.com>
Date: Mon, 24 Oct 2022 15:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 5/6] pci: do not disable memory decoding for
 devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-6-roger.pau@citrix.com>
 <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
 <Y1aI5Lbi3sysIZVv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1aI5Lbi3sysIZVv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0042.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ea5602-f599-4023-b6b0-08dab5c7f274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aQmkRnInDHDNclidibOu5Pj/dLhj/eOOq3gkHRvEXwTlOwqXL8SHK9sdSlWUZh9dLHZAAvPn+COPkaUu8Oa+0xlRkMxzzF5xgi1rFzGdGJr/bB2ZqvxigWLVsfRXu4SR6s7BLGAVgAz6HRIDuEn7qQ0xo5zpFsY0mPlyLsz3sOtTyvr2t7eNLwva4/bQZrrfTsKweokJ9Q6Pk1sAqc5WcWotbvflPHvItINF8uNPmaATGEDtWmPyvNrdIUnGWcT8JQCiPwq82Pja12EPFiMimgRXTUfcNM5tBKw3d056CBeAAMb3QTseXmfLEAUsZGuZwDkB36igD7r7wkR62InSHh0P8UmV7wwBoDqvq//8oPjsgU3BpUcPXqvylEMr0rGVMNAR3u9u28+U1g+MokPuWdakVoPcPmN1+ii7SCoNxrYmtSOzdHdetneOHvmwil+x6jtVe/CT9yKLlzG6p+0mx5EgTO2i8vTZjwHOjcSv7GHBwBCMS37IA+3+c46l6XEMODtbxeOBcjsb6KElWbuck9YlOYVbQhaN63hipJe2W2zA64v6bR6RqQaC5ktk7FSEtlSRHGw9bZDzbhAcAT5fVLfyGHbqGtVLRZCh3pBCky+03GN5ly9oNF4EnkOfA616FbvMAenFaYdlOdNoNYJ6P+t8gFKhpQMp+Vq6txD1BGszJIBC++QAUzRttas1/D2MZqZV2fzCtE6qdNf9znyWk01x+mGI3rphN6lUK6XcPKl/5kJi1qbesjfzeH+Ju5N/LC2oK6LC2GP1UO1KplD2yRPWdtkSd2y0O+YJ4xbIEnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(31686004)(6506007)(6512007)(53546011)(316002)(26005)(36756003)(6916009)(66476007)(66556008)(4326008)(31696002)(86362001)(8676002)(66946007)(41300700001)(8936002)(5660300002)(2906002)(478600001)(6486002)(83380400001)(38100700002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUtXckNuRzZFeXNGelZoVUF6ZnV6cjRZcnJzWHJ6L2hPRHRLRVhzeml6b2pT?=
 =?utf-8?B?QUJJSE93WkJtZWw1N09xUE16T2xrZHpvUDdrZ1J0QkN4eEpzdWtvRUljc1RO?=
 =?utf-8?B?elBGcmovSVJHbUFEdXRxK09RMHRJUFhSYmFGQUp4UmhVZSttcmNrNEhQN3ow?=
 =?utf-8?B?ZlFLV3pYM0w3UGtpeUxQYTJQZzJpTWt3UlRyVFJpY0VOWFdPVjVBZXQ3K2cx?=
 =?utf-8?B?dXAyZnQrb25EYTdwSGpaZ3BJTW1ocjFpajltQkhKRFc5MWpBc3J4S0dUY2pJ?=
 =?utf-8?B?VHlCaHRDUkhreWtlWXRNU095eldqejB3UmhNdTlWMTV3eFBRY2l6QlJ0TVRy?=
 =?utf-8?B?V1BMVFBRb0JuYlh1d3lnbVZxREJaSk93REtEVjNPRE56MWNsa2FUYVVDekdv?=
 =?utf-8?B?SEZneWNBdjI4VkVCd3FPaWdPTkR1YW1la081TXdjYTBRZHdrWHdOQ3FUT0xG?=
 =?utf-8?B?NVhsUGJqU3lQaEo5NkVNZ1NzQTVoSzEzc1FNM3o1M1lGM0k2Z2wvY1JsSmJs?=
 =?utf-8?B?cWMxREQ3Q1M2YWllWFlYWDVZSHBXeG9laE9qS2lHc3ZNTDM1QnFJeE1Tb3JR?=
 =?utf-8?B?cjhRdnQ1NG1EUHJQQ2NjTFA1QzR2bDh0cXlzMWFES1huZEZPVEJVRGJzdmI1?=
 =?utf-8?B?RkIzeTYzNEJqWnpaWTdXMjVxbzNFcFFIZTRIYnkwSExUQlkxeWtBeGMxaDB5?=
 =?utf-8?B?MVhqeGFFMTV4VTcwTWlWTFRCN0h1NE1UZ3prWCthM1l1RDJEc2NOWk04WmEr?=
 =?utf-8?B?QXhNQXpVTHU0WHAwdjUvVVBNbUNEZzNzcnlEUm5TUGtBQjN5blBFYmVnMnRW?=
 =?utf-8?B?cS9ubUhVQTVGUTVyMDl2RG0wbG4wbk5waUlSRk80QTBrdFpOUkIvQUVWWWZ1?=
 =?utf-8?B?SEVtajZSQ0pKWEhYbnNtS0Q2SzJmakkzekZodzVPbFZIUG9mRU9ja0VNaUQ2?=
 =?utf-8?B?ZmRVbnBjNi9xK1daYzZHWXF0djJMYm4yVzU4Um5oQ01aZlBWSVQxQjF5RjBM?=
 =?utf-8?B?VEwyVy90NHA3NFE5b3VkQ2MrV2V2Nld0L3hyeDZVVVZ4VnhXUURLTWVMQ2Vv?=
 =?utf-8?B?RWVHTmpRb0Y0VkVCK05RVHVVNGVpekpnK1Q5SkFLNnNBK2RRVUFjenlOSzRs?=
 =?utf-8?B?S3JPNTFUS25ZVjZxQW1udHUvWHpFR0h5bzl4anRBUEZLc0tXSWxvbGlZa3ly?=
 =?utf-8?B?UFFJOEYyVFlydnRDYSsrSk0xclNqQlBCdFRaM3NZV2xWdytBVFBFRlk3bk9n?=
 =?utf-8?B?NlZNT01wSmpMUUlnZjJ3TnNpVE13SzJTNDA2SzhUUDFPWFZsZ3p1SFVtb2hZ?=
 =?utf-8?B?YzNxZWxtT1lkVy9qRFgyQno1SVJ6WHVYZHRDek1MbFc5L1J2OUc3aGFoM1Qy?=
 =?utf-8?B?a3p5RC9PamZvQ09qcFAxNDA3REloWlRrNklJWFdibmZ1TllBbUxlZmlmLyt4?=
 =?utf-8?B?OHM3bFlXTTNEVzRoNjc3azVUeGdQTDZiaU5TQVAwNDJXTmtocTA4M0l0T1RS?=
 =?utf-8?B?aUNnZXFjRCtnUlZiN0p4RUxpdUpCZmNja1BHZUJlSEZ5eHZ5aVpDcTkrQyt0?=
 =?utf-8?B?dk5sbHBCMDJFdjFrbGtiS0F4elYyaDNHSnVNbmhaendSWldXMEh0emhHR0ha?=
 =?utf-8?B?aXBZZVpQV1QzSHlUdDdqRVMzTlR5OThYZnNDd1o4QnIwdkFEcnBUR09zZUFN?=
 =?utf-8?B?a3RoSEJ2N2d1NlEzcml5ZWNiOHM1SUNYMlpRbG9ORXFtbExza2hvSUxzUEc0?=
 =?utf-8?B?ZGJVd3MzdWFobGtaenRJTFFqbEM0ZkJzNjE1c3JyS3o0cDVFZ0tjSlAwWkxs?=
 =?utf-8?B?KzFON05leGprSkVESDIwaEtaVkZWUFY2c2F4RjBDSXNzendJV1N6NXVCTGFi?=
 =?utf-8?B?MTA3N3lUcVRLZzMzdmhsRU9za25NcGw3S0NsVG5sR2FBVlhSVGJkcEl3bUxB?=
 =?utf-8?B?VVQwT1Z2eGpkNUJMMjZLQi9hTzZjMlgwTnZkVzhNcFlXa3lzeTFRcHhkNE1H?=
 =?utf-8?B?akhIRkZDR1haNXUwNVNqR0MzMWZxai9JNGlSRTBOb0tabFA3TUxldisrdmJp?=
 =?utf-8?B?OThZandLM3B3NTA3RzhLaHRJd2FzM1hsNGdOUXJwNTlVYjFPR01WWXZLTUdt?=
 =?utf-8?Q?qY9Obrjeffd3BX6yXMv4q7D3i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ea5602-f599-4023-b6b0-08dab5c7f274
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:59:19.8294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K85HPQpvLyKv9D135RWkUMa8HTowXrRduaYwLqyEd/UtRDRkr9GqSM+gZa73AFM8MmBGCR+RuTMGigtA9vT38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7284

On 24.10.2022 14:45, Roger Pau Monné wrote:
> On Mon, Oct 24, 2022 at 01:19:22PM +0200, Jan Beulich wrote:
>> On 20.10.2022 11:46, Roger Pau Monne wrote:
>>> Commit 75cc460a1b added checks to ensure the position of the BARs from
>>> PCI devices don't overlap with regions defined on the memory map.
>>> When there's a collision memory decoding is left disabled for the
>>> device, assuming that dom0 will reposition the BAR if necessary and
>>> enable memory decoding.
>>>
>>> While this would be the case for devices being used by dom0, devices
>>> being used by the firmware itself that have no driver would usually be
>>> left with memory decoding disabled by dom0 if that's the state dom0
>>> found them in, and thus firmware trying to make use of them will not
>>> function correctly.
>>>
>>> The initial intent of 75cc460a1b was to prevent vPCI from creating
>>> MMIO mappings on the dom0 p2m over regions that would otherwise
>>> already have mappings established.  It's my view now that we likely
>>> went too far with 75cc460a1b, and Xen disabling memory decoding of
>>> devices (as buggy as they might be) is harmful, and reduces the set of
>>> hardware on which Xen works.
>>>
>>> This commits reverts most of 75cc460a1b, and instead adds checks to
>>> vPCI in order to prevent misplaced BARs from being added to the
>>> hardware domain p2m.
>>
>> Which makes me wonder: How do things work then? Dom0 then still can't
>> access the BAR address range, can it?
> 
> It does allow access on some situations where the previous arrangement
> didn't work because it wholesale disabled memory decoding for the
> device.
> 
> So if it's only one BAR that's misplaced the rest will still get added
> to the dom0 p2m and be accessible, because memory decoding won't be
> turned off for the device.

Right - without a per-BAR disable there can only be all or nothing. In
the end if things work with this adjustment, the problem BAR cannot
really be in use aiui. I wonder what you would propose we do if on
another system such a BAR is actually in use.

>> Plus with this adjustment, is
>> ...
>>
>>>  Signaling on whether BARs are mapped is tracked
>>> in the vpci structure, so that misplaced BARs are not mapped, and thus
>>> Xen won't attempt to unmap them when memory decoding is disabled.
>>>
>>> This restores the behavior of Xen for PV dom0 to the state it was
>>> previous to 75cc460a1b, while also introducing a more contained fix
>>> for the vPCI BAR mapping issues.
>>
>> ... this (in particular "restores the behavior") a valid description
>> of this change?
> 
> Yes, it restores the previous behavior for PV dom0, as memory decoding
> is no longer turned off for any devices regardless of where the BARs
> are positioned.

It restores one aspect of behavior but then puts in place another
restriction.

>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> AT Citrix we have a system with a device with the following BARs:
>>>
>>> BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
>>> BAR [0, 0x1fff] -> not positioned, outside host bridge window
>>>
>>> And memory decoding enabled by the firmware.  With the current code
>>> (or any of the previous fix proposals), Xen would still disable memory
>>> decoding for the device, and the system will freeze when attempting to
>>> set EFI vars.
>>
>> Isn't the latter (BAR at address 0) yet another problem?
> 
> It's a BAR that hasn't been positioned by the firmware AFAICT.  Which
> is a bug in the firmware but shouldn't prevent Xen from booting.
> 
> In the above system address 0 is outside of the PCI host bridge
> window, so even if we mapped the BAR and memory decoding for the
> device was enabled accessing such BAR wouldn't work.

It's mere luck I would say that in this case the BAR is outside the
bridge's window. What if this was a device integrated in the root
complex?

>> I have to admit
>> that I'm uncertain in how far it is a good idea to try to make Xen look
>> to work on such a system ...
> 
> PV dom0 works on a system like the above prior to c/s 75cc460a1b, so I
> would consider 75cc460a1b to be a regression for PV dom0 setups.

Agreed, in a way it is a regression. In another way it is deliberate
behavior to not accept bogus configurations. The difficulty is to
find a reasonable balance between allowing Xen to work in such cases
and guarding Xen from suffering follow-on issues resulting from such
misconfiguration. After all if this system later was impacted by the
bad BAR(s), connecting the misbehavior to the root cause might end
up quite a bit more difficult.

Jan

