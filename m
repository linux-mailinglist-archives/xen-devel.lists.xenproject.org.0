Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4479E3F5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 11:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601128.937027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMM4-0005sD-AF; Wed, 13 Sep 2023 09:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601128.937027; Wed, 13 Sep 2023 09:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMM4-0005pB-7N; Wed, 13 Sep 2023 09:40:16 +0000
Received: by outflank-mailman (input) for mailman id 601128;
 Wed, 13 Sep 2023 09:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgMM2-0005p5-Pm
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 09:40:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8997d97c-5219-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 11:40:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 09:40:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 09:40:12 +0000
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
X-Inumbo-ID: 8997d97c-5219-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moCs887wJTlmN6Cw/KBMapluDOAdOR5cTVXQr2mFMufhDMhTbAqpzwKNv/B3K/0HnBLg5mQ6/Lm8VUJwKyY3LkBKLEzGDndQcY7AxHzB7Zdgh0+H+3dESTFffPk33JqxXfSLdTxE6+Q+ME703XI/a5bJCZcWq51zGTMO37n7E97SgrnqGXGbU39fp88mpRgD8rWpHVMCTydmYL4jDmtaH22jmvHOkvXwLeiIajIqcKqHR7pxdWSj/8obX5rh1y+OTWPVntd45cD7iZg4yHYgvx4Zsi6zO7P1srSOQ3GO4hg9I6/0YkzGbWyZ1FGu3zFaIAam6fWYKLXfDRCRufiZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEAuGoMaJNnFm93Q5Bs2BrLrIqRHtnip8NX4nv2+Aug=;
 b=UFpUj/F0j380Pv7pJEdwhVzXgGKgqmw3RXLFIfKSDzSplYph11JC1+QPlkObZDG4ScEYUAH6EXzazB0JpqFyBRUoUPbNM6dSONm3qTdD6qDVPtTkU8pdIl4l16E5en4MuJnARp54D108U2sR/P1YJ55VdrZj1hPzAvxcd/rQy1pR87nm6d/M4e7o80xWY0CcT0+w+9ZXzik12CCHWCRrFYOTuUSSHi62FcFE1bCCfgHUFJBBgpZQQ+pJnh3gyCQV5LHTLeUuyDlXrUGxMehBaPuQWBNyHkPZAw+2CRCa7a5HaJZQ9pZcq44aIib/yY7BbVaNZ1E3DA/YiCxXs3Vxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEAuGoMaJNnFm93Q5Bs2BrLrIqRHtnip8NX4nv2+Aug=;
 b=b9m1jMLQR7cMiEqz2WIaBZcIp7YJqn6EN62f3krQsfjj2+RZjVtaG3twZBn+4uZABdHaKH3jIWr4tCiVYeiHklUf9ToF/jCUKqc6K9lX9JZ10txmplHJCUivZmuYfqmSJ+NBeLjAVT0ZBy5Bwbh9y+8sx1sH+XKWHRv1/CX0KfRWr7+DjEAwlL/f+68XkhvaTr1m0LeL7YkfnkPCsSgOGUQUxcdza3FLosEQLSfBdmcS297BxQMhNeWbV46UC7fGxPn7ECPEnb/+g93PMfgY2DLqEP1GdZikek1YYB6RXCj4O3QETwWGDwQ3uxyIdksrWjXpPLz07VeGs+89KFLEKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58ce7887-ed8e-e963-8158-3472b1dd583a@suse.com>
Date: Wed, 13 Sep 2023 11:40:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <809ef122-7060-c033-e50d-6e372ab89de9@suse.com>
 <ZQFwyG3FwCzpezTR@MacBook-MacBook-Pro-de-Roger.local>
 <99bae9ae-1711-28ca-c464-e638f0edd7a6@suse.com>
 <ZQF-C_H-z05PNKHT@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQF-C_H-z05PNKHT@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ec6a14-6b60-4ebd-de1b-08dbb43d6d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7yt5f/7l8MYwaUHgFcTe3TVtVwDOynyKK3toe0xCxaNtsx+dNzq2397Ylh98KAqPMe3Cl9m8kuqnTLNjPXN6FEceFek4FlbdlkHYEdhGb+xXxdwP3ymJi1ARl1mBnU9RBV8EokvQvmRz1iHXA3x3CEy8SGMwdHGPmoN+gXouTFwNv8peW7/bPBCp4RFktgnRfENnRdvyq1JhnZAhfL+ETESqYaFI5jWTt8myw4yIXOpiiNmk+cAJWyoyWX1l7Jxbk/x3UzdW5tHj5deJ23FgTBJNm6cNKrA8+tyjLZrVel2+J8uyMekrP3GUg0QSw+fOq0QCtft3xs3Iu+sllG3RFjul1EKvkOiaG6YEvbPSX8XyN6Kzcf+DZ+xmo9SrbCOTHvS5Kem3gJbd0mYpxO9Ji4r4ENGdw3SyxUVfBwh21WB7aHT/r4x4HzgqPueSRe/5E7I58JOb7rNPVzz0ac7YAcYAKZ6/uq+u/KdLD1e7BylSQ8AZMGMqe82adZ+mqUkaJi8sDY3MF7x4ovhLALsJSrAfPrQ7jHoRU1xgrwc9hJB2hfPYbsaAP5A0njWwSE8iA7oF2v3GoRpC3TjNQR270h/FCkBgq6vXLi+WdnJB8vugcGKfoR9qi9/ovrNLrGp0MLh3/Sg6Jrgodc4iOokmag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(1800799009)(451199024)(186009)(26005)(2616005)(5660300002)(8936002)(8676002)(4326008)(6512007)(53546011)(6506007)(6666004)(6486002)(83380400001)(31686004)(66476007)(66556008)(6916009)(54906003)(38100700002)(66946007)(478600001)(316002)(41300700001)(31696002)(36756003)(2906002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWIwOW84eEJQQTNRSE1FVDZENHl2T1YrWTBmWFRLZ29BM3VhT3NHZVE4NWhX?=
 =?utf-8?B?a1pjVnhwbi9rUXJZdXNuVDg0K01BdkUwRHNaUVl6Sy9wL0hucThCODB0SjZU?=
 =?utf-8?B?eWV6WURyS2R3M0dpRzJQS2N6UGlKTUFHSGNkNGdidGV4OXRPb0srUEl4TVZY?=
 =?utf-8?B?M0JmMzNaVW1YMzFBK0g1R3M0Wm1Bb09lRklZb3l3eVFWTktVRW90b0Z0Rzlu?=
 =?utf-8?B?d3FYYWJKR0crT3NtRi9IMzhFbGdMNHlGUXRtTU5WMkFYeVR4M0p0cnVkRkth?=
 =?utf-8?B?Rm9sSzRka2VUZEdrekM0R3ZHcm5LUVgwUTIycDJVSVVoMFU4dTVRS2kzelQr?=
 =?utf-8?B?azdTTTM3Umx1SWI5N1dvU0I2VGxOeGZDZW4yNVpzd1hqRkJZUjhlQ0tmVGE0?=
 =?utf-8?B?aWtKNElVTTNnVTFtcmg4aHNWWldodGl5SmZ1akQ1ZzdFREhSeUNpc2Y4VUtU?=
 =?utf-8?B?bTdjakFWdlRDTXJWRnk3Q3lVWllwOG1QWEJkU1FROGRtZldmalhPSG5xbzNZ?=
 =?utf-8?B?aVBaQXA3Yk12bEw1cWFRZkRzZy9kNUYwUXZXWlkzZG4yTDVEL2dwdFByQktM?=
 =?utf-8?B?MGhNN0FwbmdKYTFHRmtaSk0zeTBVTkZIWVVDNTVidE5WbUlybXZXMnZBcTNi?=
 =?utf-8?B?VHdWU21BV0s1TStDUlZWUUVJVUFiWlFlSFlCdEVxN3JGbExlaFROQ0c5U0Rs?=
 =?utf-8?B?cHZjaHAwcVIzcDdXU242MEFQanRzbWEzSXduZ2NIRDhmU1U2VXFxbmVOaC9Y?=
 =?utf-8?B?ZGEwb2ljWXRFK1NBN25wNnJhWHdkbkJ3V0pKQm8yRy9nZiswZ0NtZkozT3hZ?=
 =?utf-8?B?N0RQMGJ2SkIvOFZoaUxocVFPMnN3SDBWeHcxa2RZam51N2w3bHFIVHZWZDIr?=
 =?utf-8?B?MlZJOUR0dTRFUktoS2JPNTZ5UW5IZ0RuakhLVmN0WERFcU9FVXUwUUdqYzJO?=
 =?utf-8?B?ZllrOXM2dVBKYVFPbE5FV1dqTS9TR2NJYjEyQjZHQkdUNkpmMjZJKzR1RjMz?=
 =?utf-8?B?OENWQ3VMV3hCMXdudTl3RUt6NWVkTUk1UTQ4RjhCRG10bWxCb0N3dGc4aU1D?=
 =?utf-8?B?c25MOVM5VHY3eGJGcDhMSnNzdFZNUnR1L050dXQzMlU5WW83STFTaFRrN1Vo?=
 =?utf-8?B?ak1zcStLN25NeTRpNTVUQjg0UHZYQVpQYjBjM3FDWnVya3RXQm5CMy9xRTNX?=
 =?utf-8?B?bzJHMFU4S3ZSUjJhREpLazNXN1IxNy80WTIyQnZjd1lyeFNHREgrdTdoYThx?=
 =?utf-8?B?RFV4VzZIemJNbEtKNno5WnhVY1lQemN6cU9jVUxaRDdXVzdrRW50MjI2dXRS?=
 =?utf-8?B?ZjZwblFzTDFsc1NXTk5aYVRDaTlNWWswejlaczE0ZHQvZGo5ZnhSMGI0cDdI?=
 =?utf-8?B?U1YrM2VyNzFJUVRWVzBKRHVXc1lxTXZKWGN2disrd3Z6ak4xSUxQUy8rYlo4?=
 =?utf-8?B?UGYvYjk5bG9jNllRUldrOGwzaldNemxPZnJpM2w1Nkg3TXJFR3RsUzBuMTJS?=
 =?utf-8?B?ZnArRjNnTGpHYkpoaUJ6cmRmckw1M3FWZDE5ZnFqM3kwTndCSXk4MWd2NGo2?=
 =?utf-8?B?QmlJcmtUYXkyQmQrU2xnM1IyUW1wUGsrK2xCdUpCZW02RUhOM3RCeFJPSUh5?=
 =?utf-8?B?bkRiM3NGeWs4dEZCUXdZdUxSVmNHYVZLNHA5ek9UOWZ2SU1aaEExbUdLSnZ4?=
 =?utf-8?B?Um9hZ2ZMbUhVMTUzRUcxeFo5U3E1SzdCdU5OYUNZQ0Vxa0ZqdERvTmxaZ1Fx?=
 =?utf-8?B?YXFMTTNVaEVETjFiRUlUYUtOYVcvblJISk14WnY2QnhaMDlIdTAvMXJhV3BS?=
 =?utf-8?B?M25obHlzWGMzOERrd00rT1JDUzRsd2ZoeGFrZ1NzOThMYzdGQVpHaE5la3Rx?=
 =?utf-8?B?alN6S3ZKSzJDS2hLWFhza2c2VitkSVdwUnFESGpJZUtYc211WFlZMWtmaXdT?=
 =?utf-8?B?OHdXN2txK29EUCsxdjRueUNMeTZvYy9sQ3JNRldORmNqZytHRUtIRVR6SUFk?=
 =?utf-8?B?U0F4YUxsRVFocVZaL2ptamlvS0hVOU5sTzh5QUx0ZjlWNGR3RHNVUkNHa2x0?=
 =?utf-8?B?VWhBeC9JV2FNMUo0QkdSa29LYStnS3NXSWpGeGpyd3ZJNGpVNFhJaTd5dTNo?=
 =?utf-8?Q?7G4yeAXmHIj+F5SG51wXzEJ3b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ec6a14-6b60-4ebd-de1b-08dbb43d6d0c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:40:11.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGcZ3i5NlN+wuJQDfnNVOLlCVo64kbs/smxxp0Itl0Xc3aqnW81uchTJ5Kd+ChE4CvrSgN8a5ByKExLPVb5Jlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871

On 13.09.2023 11:16, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:17AM +0200, Jan Beulich wrote:
>> On 13.09.2023 10:20, Roger Pau Monné wrote:
>>> On Wed, Sep 13, 2023 at 08:14:46AM +0200, Jan Beulich wrote:
>>>> On 12.09.2023 18:23, Roger Pau Monne wrote:
>>>>> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
>>>>> set, and will also attempt to unconditionally access HWCR if the TSC is
>>>>> reported as Invariant.
>>>>>
>>>>> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
>>>>> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
>>>>> a suitable solution.
>>>>
>>>> Why is the warning bogus? The PPR doesn't even state what the bit being
>>>> clear means; it's a r/o one. On respective families it cannot possibly
>>>> be correct to expose it clear.
>>>
>>> There are other bits in the same MSR that only state the meaning of
>>> one value and are not r/o, so my take is that being clear means "The
>>> TSC doesn't increment at the P0 frequency".
>>>
>>> Since it's model specific, it should be possible for some models to
>>> have the bit clear.
>>
>> The code that's in there right now already has a family >= 0x10 check.
>> The Fam10 BKDG says (among other things) "BIOS should program this bit
>> to 1." That, imo, doesn't leave much room for the bit being clear once
>> an OS (or hypervisor) gains control from firmware.
>>
>>>>> In order to fix expose an empty HWCR.
>>>>>
>>>>> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>> Not sure whether we want to expose something when is_cpufreq_controller() is
>>>>> true, seeing as there's a special wrmsr handler for the same MSR in that case.
>>>>> Likely should be done for PV only, but also likely quite bogus.
>>>>
>>>> Well, keying to is_cpufreq_controller() is indeed questionable, but is
>>>> there any reason to not minimally expose the bit correctly when a
>>>> domain cannot migrate?
>>>
>>> We would then also need to expose PSTATE0 at least to make OpenBSD
>>> happy (and any otehr guest that makes the connection between
>>> TscFreqSel and getting the P0 frequency from PSTATE0.
>>
>> If any such OSes can be used as Dom0, yes.
> 
> OpenBSD can't be used as dom0, but QubesOS does use the nomigrate flag
> for domUs.
> 
>> And as said before, I view
>> exposing PSTATE0 (with zero value) as a viable alternative to your
>> partial revert anyway. What varies across families is how many PSTATEn
>> there are, but at least starting from Fam10 PSTATE0 looks to always be
>> there, with the top bit indicating validity of the other defined bits.
> 
> I did consider this, but it seemed to just dig us deeper into exposing
> non-architectural MSRs, which in the long run is more likely to be
> troublesome if newer models change the meaning of bits in PSTATEn.

Not sure about "deeper" - we're discussing to expose a non-architectural
bit in HWCR with the wrong value vs exposing a non-architectural MSR
where we'd rely on only the top bit retaining its meaning going forward.

Jan

