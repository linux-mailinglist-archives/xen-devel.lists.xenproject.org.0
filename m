Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4533079B0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 16:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77178.139630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59D3-0004n1-Vo; Thu, 28 Jan 2021 15:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77178.139630; Thu, 28 Jan 2021 15:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59D3-0004mc-Sc; Thu, 28 Jan 2021 15:27:49 +0000
Received: by outflank-mailman (input) for mailman id 77178;
 Thu, 28 Jan 2021 15:27:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l59D2-0004mX-RN
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 15:27:48 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6bd7282-63f5-4bb0-b4c0-4a43aa2f7367;
 Thu, 28 Jan 2021 15:27:47 +0000 (UTC)
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
X-Inumbo-ID: c6bd7282-63f5-4bb0-b4c0-4a43aa2f7367
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611847667;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fonJQot19ryrccnggi+9xvtWYbOWAzGmqTRYk8Zh0zo=;
  b=WMh92HchBiBsq44UR6SrpZ0sKNpXTZqvWecIkUr3M6dXs6LYQkf5zMzO
   fyaTV/7ZjEj79n8b0PMctTKd7U0TKDeIUT6TWBUQlsQCm8y9WTOaB+Nxn
   Q+3IlBrWRHNyErerLjcHJyiqFOe7PDGSALz7HNCmRy2Im5P8ywrRRySFc
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wa0zP/P9vA82aAGL2xZO2q5mtwYe4HQTqeI0QNB5HRVdM23OAwlyHtDV5bA/fUZPCi5MA6mPdh
 4rtQDL1ZcXRVnqI7C+owbolVD5gnxx5/ycBUe1h0GAGN9Dq5wwu4ZdNTlf9hfqYqaIjwA38YVy
 WvlmC6/PgnkyUUCabMzbGX1bEv+A1SzDjyAUEiTiuT+XH1N4Ui8viuTtZhB53qXb+/ADdd4fgY
 520o/X3HyNRV5ml+X/W0GyUCFWqVo1gyXP1tTfN2NzKqA1snmmD0bhuElrEgIhZcqS3Eii4PiR
 vCA=
X-SBRS: 5.2
X-MesageID: 36034763
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36034763"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9hX7AWOAWWG8D/+/vGhoBV+XB7w81O+qn11jzFTI2TBq7c5LU3Zp3ylThnclSteuM3PBTpE3P9qHz0fX8UZ3H/Wf1l3zDmDbIgHXI+3ds3j4vPxoaF/g4eI2ry1RupQjGM3lF7vWKqd8l75OMsPoL6N6HLlUhmrNcRqqLeTvIvqnPZzusdYoBgotunLmDAOev3yjK43DFQ32+rxCHLkmeTof0fTBc4arSyBwDxhZgQo2z2L3Z29IrPJaU9gyKVpw5EF1yPo8ApwT/tMkzbSuq6/JV7zSRjQ25JAni6aHgrL4AVDhhzdqS29+latKp3nfIQBmKzCiS1MDiRvXOOtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW6wHBr1eedm0pIDLsXCzdxmcEsI4fmqGtODEWxtGe8=;
 b=AuIk8QS/moUfEfBPcWlBQXKBCxNg3MWiZSv2DGoCRcqeR1iThwCKmGVuCltJKcVdDJlVuml4fNJMJ0Bue5c3kA5wHAou9fzc3aMmW8USWOwocqOw2GQnZ5hAltterWNRvANe8707ujEsg5SL3H3ONwTIZ/S3fn1MmXfTpgfG+5l2mS3FkfeXQEDsZji9D2jz51HYcTQvSN9qQJKaxXwHEeDdxHV7BrzXfu7OmLNLh4o18fDXv6duCVPeg1+WQdHEk5Yg9EF9C+ptZKn1x9nRKMTE7AWARlOcLazr65osi1xM2PIj61SI2Zjb02ne43ZYa9q3isxtBNB2K1xVU1uexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW6wHBr1eedm0pIDLsXCzdxmcEsI4fmqGtODEWxtGe8=;
 b=pdeZwDVmqEYUm3wWLgPaQ6qaNB7UqE4ZAgeJnwqsyYshflcH8IsJBQ4FI8jmKr0A+Tq8XwATF7i6RvD3/Dksc2W3uiBSBFvmLTFnbAgoYFl2KNEDrmz1DLzcjcKfekqD+WpPlfYStqL2shy7meqzNsZiCgj0AWB0YhxtX4lvXZk=
Subject: Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from
 check_timer()
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210127194904.9922-1-andrew.cooper3@citrix.com>
 <38cf4cb4-c0d3-d880-a0b4-eb21af447cad@suse.com>
 <24594.53440.970539.475825@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dd6518de-2d6e-748c-d7fb-07f355417277@citrix.com>
Date: Thu, 28 Jan 2021 15:27:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24594.53440.970539.475825@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6387df3-ab79-41d8-0e8e-08d8c3a141b2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5823:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5823705E1B5C184DB9DF865CBABA9@SJ0PR03MB5823.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUFVEEnp2ikMGwjtJuxXIcaub+C+GiAL6ycwjmrsn9cb3eDCg1oWDNKtcF8o62qkz2dx/eMgbi8nTkfvrKxAzDxxEOnaPsbYOA0YEHCEYUO6B0lnpPyqWS7dBmsv1CdOAzdks7qxktZlhA5H2ZlhSAeL41SyS+uITdd1WKyBzITfr9dPf5qey+eAiHRFsSbQcWB7+GZ5wcjZmam9sh9VataYJEgYszR26dB5+GtuNSTeSe0c6eRPkpK3UZiquOiu5Sn2hRiSerwjqGXh2JT7fatk+G0n9lsU6ESLU90BiqG8PeVKB/5UbwIsLP40SzNEzZHKDShMNGrGOdLxkLGiU5R3Losi1bBfEiX7/DNag4HQWxy9ckQmmYymHBWSeglQGVg3cqBsZQ78S33Q+zRTwGCkUkq8AG6nFoTo/enO+QbkDrPB+pS16wRJNUeQXowLzrR8d5w5Nzfs75vNG066e7wzNeqH7CkT08iCgHiXk29aI5i/+rcXlXYSfu3GVOBXgEJALsDXpJipI2L5h8Kzw6qMLvZhQhrGiqjZYxPQqSndnKbj2DxKWq18H3Ycl0MmVVsW8qqUyruer4Pi4cnumH5Q6EwaOV930ZR3gmyD0bU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(66556008)(6486002)(5660300002)(66476007)(31696002)(186003)(110136005)(66946007)(8936002)(83380400001)(4326008)(31686004)(956004)(36756003)(16526019)(8676002)(4744005)(316002)(16576012)(2906002)(26005)(86362001)(478600001)(6666004)(54906003)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUxQcGtOaEM1VVYwb0V4WmZxZTIrUERNM1JSY3QrRjVNWHVwQU90MW9qVjV0?=
 =?utf-8?B?bi9YRi8zU3RaM21pVk4yczdoem5GUWxIcmkwSStpOUFtNUxLaGk3N3VlbGFF?=
 =?utf-8?B?UGhXSC90SXJBTGpPNWdyUHFDUFZVQWx0MEh4WWRvOHRHUXR4SThPOWhNc1RI?=
 =?utf-8?B?Y3Z3TkxUUzBZMUVIOFpwT2w3bm0xNytvS0Z2K01NelQ5dHg3K2hHWkZxODFa?=
 =?utf-8?B?WEQvNFBIS29FRDlsWlc2OWswcHBiWFJKbjhhV0pHM3VRcW5od2RjaGhaYjV2?=
 =?utf-8?B?S2tJNTluQUVnY3NsL2RzeHFDVmpkM0VnUU9JaDBhalQ2dlV6empiYTBzc0Ja?=
 =?utf-8?B?eFkrZjhkSitiT0pLYTlLUHNPUS9rR0ovbm5DaHNmL1p3UHJZcmYzcXJtbEk1?=
 =?utf-8?B?SS9GRXZ2ektpb2hleHFOY1VGckx2TzNXZ3dOZ01CeXFTK2NpVWFQWXpHWHpU?=
 =?utf-8?B?TkNiNmRQQlMzd0Q4eUZpblZtN0grQklZYTNTbTl4UGVCV0U5K2MvRi9xcHFs?=
 =?utf-8?B?c2NBeVJZL1BEd1dQd1BXeUxYQ1FLdmRwKzAzeWtUN2p0S2hxeGRLVXhMYzJl?=
 =?utf-8?B?QVhURXg2bEtIYUhLbTkyZDF1THZ1VG1uWEVMQWZMd2xMS2lqTHE0RFhoSU1H?=
 =?utf-8?B?SXRObXpnYzRvQ2hoRm5CWWhTODZGRzlVQWNmWU5yckc3WUczdzFQWTgvR1BR?=
 =?utf-8?B?a0QwVjdwMk0vMEs5V29TYkF1WU9GU0tpemdTcEtpWEtrOSs5dUpZaHJhQVgv?=
 =?utf-8?B?YUxKajlndG5pdjNISGl5S0Fzc2hDdWo1S0hTRG9kYkZ5bExiUEdacHhNZWFt?=
 =?utf-8?B?MERnM2RsNFY4ZGlGWTdTVTUwZ2orb1Y5RmtocnE2TUxDQWY5OWNLYVIrbHU3?=
 =?utf-8?B?UFROQWh2dThhdU5CV2JNZHNaU25PcXd2WTNBQzhoMWxXYzhDcHhXMndiZy9H?=
 =?utf-8?B?eXlaZXZsSUZlLzlDWHNJVG1yNHFMR0pCQ1RhL1VxY0xmTjV0SXNXQnNqMHFm?=
 =?utf-8?B?UzhoS2JrMHppdU0rMTdXcHZFay9LcGgvbjJxUUoxNHNvUXFCZ1VDcmJOUExO?=
 =?utf-8?B?bXpBZFJqYnE1a0ZKelhjODJGdDFOUkxYMzREUjVCRTNkSFgzMExXenpncEZp?=
 =?utf-8?B?anMvR3BWaWo4ZjRVdDNyK2VJSTRTWUVkUlB2LzZncEhMYTRabTRNbHFNb3FN?=
 =?utf-8?B?RkRvdnlJT2dWRThtd2ZNeUxDUXZObFlXY0Y4dFRuM2wxWFVQeHViSHNvWStr?=
 =?utf-8?B?eEVmNnhUditQR0RuMG10RzltbEx0RFZEcVkwT3g4emRsN3FLS2l2UkZsWXhM?=
 =?utf-8?B?UXFzeHJrcndoOEoxWUJCODhqUyt1Vmx4VVBGYkwybUo0aXRENkZlTjIrTitr?=
 =?utf-8?B?Z1BPbEFqenlnZ3ordi80RVFKQ0VoRjJ3U0p5dFdLbEhoWVdHUWFhclNVSy9W?=
 =?utf-8?B?MGtFQjBMOHltNmxPRk0yalZSV0hzbWEzbDZkVjB3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6387df3-ab79-41d8-0e8e-08d8c3a141b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 15:27:43.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXm9RYOHyJaj1Vuz34i/S8wUJQ7m3S9pXetSTwjnXqbneedxdNHiOFNCV7X44ob71ODm+IFYNfHVNy+DZX37mWIbsLooMjfJbmfBZkLex8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5823
X-OriginatorOrg: citrix.com

On 28/01/2021 14:57, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH for-4.15] x86/boot: Drop 'noapic' suggestion from check_timer()"):
>> On 27.01.2021 20:49, Andrew Cooper wrote:
>>> In practice, there is no such thing as a real 64bit system without
>>> APICs.  (PVH style virtual environments, sure, but they don't end up here).
>>>
>>> The suggestion to try and use noapic only makes a bad situation worse.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks.

> Not sure if this is a bugfix but it is a change to a message so fine.

It was one of many delaying factors with the "Xen doesn't boot on modern
Intel client CPUs".

~Andrew

