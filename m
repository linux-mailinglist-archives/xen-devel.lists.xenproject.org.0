Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B253CA1BE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 17:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156717.289198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43ip-0001yV-CZ; Thu, 15 Jul 2021 15:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156717.289198; Thu, 15 Jul 2021 15:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43ip-0001vc-9H; Thu, 15 Jul 2021 15:56:23 +0000
Received: by outflank-mailman (input) for mailman id 156717;
 Thu, 15 Jul 2021 15:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyhT=MH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m43in-0001vO-Gd
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:56:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0016580d-816a-4b52-b69b-eed44b8fcc68;
 Thu, 15 Jul 2021 15:56:20 +0000 (UTC)
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
X-Inumbo-ID: 0016580d-816a-4b52-b69b-eed44b8fcc68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626364580;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PrDK787t7B1TC3mV8QTu5tx07cSczD8SSlGhA44DLCk=;
  b=UZHqQOAadI4ydE0PRNkZSO9CdBeXBicKMMDpXhnlLhvrRE+kb/p6GxaV
   5EijabexUwuzvzOVxFpfAhYFhxmMYnMPHtkCf2ENW6H5u36m6uNSpM7MZ
   6DQr0VDFKa8UDb4PBFoKEYrjKwd3SsTJQG1znCYHnhJ2k2ZuVki8M12TF
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H5ByvFTQsttoskjMB9FNVnMmdwKgvjIs/R8RJX812u4QnYnSYzGAiZqllT22xPZ1ux78OUQhF+
 4uwyplWm9lF+Txjq7Kr9IV226naWKVc6Wc+dl4w1yMG2BDbhiyzrPpDV290kbcrhRZIfSHFC7n
 tcFDyMRCKFAxvB8w2lkKPsWrzpyg5IhrKzDQBevbqC8eiyMaGv3SC0kVImf0IQ5wMbLqGf683O
 3LnjB4HUQcTMje9nFIOc1wvZvz5IMZPkzw5WYQDgqfyz2EpD38WFj0DNkXKTNLPEsqKACqH4yB
 2tY=
X-SBRS: 5.1
X-MesageID: 48745653
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fquY6KvAnXyqK4buF0qVojsK7skC34Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H8BEGBKUmskKKdkrNhQYtKPTOW91dAQ7sSlLcKrweQeBEWs9Qtr5
 uIEJIORuEYb2IK9foSiTPQe71LrbjmzEnrv5ak854Ed3AzV0gK1XYcNu/vKDwReOAwP+tfKH
 Pz3LskmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgDfIBej8AXeSIrCNWkH40Yqv/MCTvKR0TtQgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59Zs5Vza/pWVFZql/1WwKqVKuZ0IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkaoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWsKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnief/FmHKc7hSwlZV/NEQgF5vsulKSRi4eMMIYDaxfzOGzGu/HQ0ckiPg==
X-IronPort-AV: E=Sophos;i="5.84,242,1620705600"; 
   d="scan'208";a="48745653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a543HI7Qs8QZf1F+8Stc5hew4pqKpRPaxUaGhrFEaegWGJ9RDuM3tUldBwOL+czO1T0zfqF2b2p5pwIEwKQCxZdgvmn9VcLhJwfUAphMt2Kl5jeWPhji2wv1Mp7KIHl/uYdStcqbiRD+nzprDQ5K9whc8I9H1krkjRJTwNgTjIr0bABO9KEVnBPbg+l3SXw8EhMzE83QeCQnSabvbqEdFNGtG/yYNzDoGTactilbeSnBtE87Nfbc2bHS+zlD8T+CyzX/7rAqh5c0iUFBEHSjkoy2ZBN0XZqbo+0xjbiUamCWuNdil0STBruJzRYea/Up5KJIReNBNMyWmkFf3YZxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrDK787t7B1TC3mV8QTu5tx07cSczD8SSlGhA44DLCk=;
 b=lvqPLY9bjD1q1QCKLuO/FwCQRozwot/m4Mr7uRBYEGzqz0pT8P04fMLN5F2Ypgz84Z8fWYyeeq+n6/XZjCIrMAACjpA/CKfzOUHBYBGQ441jGOGYnl46U0je1GLXUomGi7GencYFg5OlekzomeqKAUQ45L1g63sC27xgAIHG6U2FcTRiO2HTwSukyQoN1v1zghRYrEMYFxbAXo9LNxr5hRjMIFNd02AR3LFUzsYCASqBSS5I3lbfuS2KV9hWkP13wDGFHHWsTY/ESJEcjg6eWQW4eQviJIrmWALit+9s0qQlnvtsL4DMEgV8Sl8dPYbbw0BH8R3PGSK28cdIn55iNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrDK787t7B1TC3mV8QTu5tx07cSczD8SSlGhA44DLCk=;
 b=am/d+pml1+3hwFr0YizCmsYCL966ZqI2vCWzO2sy5xLUIJognLUAmmoCgPBdyqVqBZaw2pKM6UDvmjPH4zMpEiAPjY3qfQxDcMUZZvwE1fUJtLPrsmSRQj68YyLOuQl0pmfIVTegYr7g/TcKuQRAMwZuo0pitkq2VuaIMXPYUtg=
Subject: Re: [PATCH for-4.13] x86/tsx: Fix backport of "x86/cpuid: Rework HLE
 and RTM handling"
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <20210715151050.6514-1-andrew.cooper3@citrix.com>
 <a23b942f-44d6-97b6-86b9-7339a24f1a67@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2ee21223-4ee9-bd1e-7dc6-61185a950529@citrix.com>
Date: Thu, 15 Jul 2021 16:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <a23b942f-44d6-97b6-86b9-7339a24f1a67@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fad4d4b-11fd-4d6a-a6e4-08d947a91093
X-MS-TrafficTypeDiagnostic: BYAPR03MB3734:
X-Microsoft-Antispam-PRVS: <BYAPR03MB37349A93CB6D59704DF97F80BA129@BYAPR03MB3734.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXcoe5gLZlcFi/f6dY2p+HJz2/qmZk+FJbOvtvvGhUndm2UYZRcfcz2N+TBffQ4ZH4TJomqrxOdN2dPp0fXNGZw82N2XKEEu0E5jmEaTNQkpxDx6R52n6Fvczlvfbzw5STiXhSY/sh6DKN1yN06CYN0pay+Gk5Buzapu/BTXMaB+bW72qjWnVjJVOCCCVTcS5g+eOSIN8mKiNKkW+DRZlnUjLOgCQzceyGPUZBj0SS83/yR/jWhin2ESh3TFeE8b7hwV+84pLDN1Ye3g/YPi3aF5+5nOaRQhgByVioLj29Rw0y5yVgDZjyZ5d3Lok7hZgnIVw7G97xwWH5vGNZH3lmHW0dOK8l5n+7UcwVWuZUZB3g2AKyAMaIFUnGV7XyHIs3gbeZaS61gISP2DqlhQ11TCVuL75cdLiSAgF6DiXoLQKZWhSbxfYLj18vL8e6OvaFyVsbxktz/L9MdpsFH+fHMGgA4tBp0/GbJeh/85gDMbAz82RlQtVVN2b3PexxyppSEmzw9+u+YT3W8JlAfSy11P2flDR6cZNKwQ3mge4L59ZBPZW+493oX6EB+NNkI5I0/SizthpRf39miNpjNbG18978+kR4FyBZmWytq2uh0Ij2eWoB+a3Zvv9lAjsino6j/6kI+0UPlPuQ0bKtFvL2iGoiB5w7Hs9X8Upj4R2RAVzr+fWhqfGx/VnHyhwKb1AM5zBezG2pzhJOFlcnySQy3pyvRkB0gXLLHsZtIGRO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(6486002)(66946007)(2616005)(8676002)(31686004)(4744005)(6666004)(956004)(38100700002)(53546011)(66476007)(5660300002)(8936002)(4326008)(316002)(186003)(36756003)(478600001)(16576012)(66556008)(2906002)(31696002)(26005)(6916009)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERLTDROWnNTNXdtOFRvMXJ3TnNicVc4TnErU1dKdG5DdVZGRXkzaG82Z0I0?=
 =?utf-8?B?RWY5Q1IzbXhOTmh2d3BEcURINnM5MTBNeDFYYTFtSHBIaitBNnJ5bTVyTyth?=
 =?utf-8?B?UGdYcVNjRGZQTmUwc2ludTVqWXVJbkRsZm9jY2k3QjJ4SjZhRDc5TzQxME9G?=
 =?utf-8?B?b1U4MXhkMTdHRElOeWlTM3dqdUNRSktwUkxHYkh1QXVnb3JEaml1ZFNYT3JP?=
 =?utf-8?B?NnFzZHpJVXJWWXJ2d25DSGZ4RHhCTHowQWtTUFdqRVNxbFhXbnBVbnd0Vmly?=
 =?utf-8?B?Yk50R3p3WGFqRUFjREt3VUtVR3RiUFliZUVZaVRLZ0ZUWk02Rzl2cGNEaGk1?=
 =?utf-8?B?Mk14YWMrZGtRMkJrNVV3SmEySmhTcS9jNTFrSFdGb2hBOWdIOGs3UGVXLzht?=
 =?utf-8?B?N3Y4eEk3OHRlNUZINGVCZ3U4WjVBMkxBcmh2RGRtaGZkUXpGbjRHTWxPZno3?=
 =?utf-8?B?WnlVUE1uUy9KanFxQzE4VUtzK0JxMmpUalFteFFDTDhaLzFUR0NZbE5mY2dH?=
 =?utf-8?B?K1ZiQ1pET0ZPbHk5aFBRRDVYeURicStCRGlSYlJkMjhJaHRZT0U2VmIxdzhL?=
 =?utf-8?B?Ym5rL1Fna3hsWWxSUk12VFFuVklxUDRPSi9JT1ZXR3BTeFpPS1hPTlo5Zy9O?=
 =?utf-8?B?ZDVlY3Jnd3VKNGRWRmMvYWdBL2JYNVJlSTBWYUpUK0tqZ2h6N3p2ckVwanlT?=
 =?utf-8?B?UnE3K1A5NG5IZkhDYVV6c1VpSVpDRTFvUU9jUW5ySnh4UmtNUzRybFZlYXQ0?=
 =?utf-8?B?Zm0weDJFMnhBWEM3a2MwZzJGK3hMOS9INlZBeVZoaFZDdTZGdXFwdHgxZTdo?=
 =?utf-8?B?MnJzTTJjYS9JZ1NRMUtjZERMalhHWUNPOWNmQnpRUWxYWVdoNDBqL245d3Vw?=
 =?utf-8?B?SWRiUzZZeGJFRmFXNjBVRHFxak45b1NZMFFsbXhqS1R4SDZEYjQ3MnJXNXRZ?=
 =?utf-8?B?VFNQQU9WeTlhLzlQWnkvc0xoTmNYcDc4Z0NaVXI1dmYvd0x4VnNLYllOTVV0?=
 =?utf-8?B?bW0vdlJtNkdjQmFSWTFibFVmaE1ucldUOFJQVTBUM3ZBM3pheGR0b3NHMTJn?=
 =?utf-8?B?Vm9lcjU4Z1ZzMzN0aGNwRkVMTnV1MHYwenhlMFN4Tk10T1c3c1R4cFpUb1gy?=
 =?utf-8?B?SlNKTG9PY2VsLzNqK3d6VmZNazJnbkFqeWVnOWRrRlQwNitzRVRZcGhCZ3N6?=
 =?utf-8?B?WUxGRjNaMEZveEZKMzdtWWNZN0xQYjNpUlNielI2c0R3L0lmOElyejN4bVBs?=
 =?utf-8?B?N0Z1WENoR1dFNDMzaURYa096NjRnTEwyZjBVQnB0YUVpb0dKQUZ1RlgvQmdX?=
 =?utf-8?B?cUs2SlMrVE84dkdVdDRYVVhCanVLV1o1dFhDSFR2ZE9mQUw4VXI0MktQN09Y?=
 =?utf-8?B?VlkzMUlEeVh6OTNjcWh3THJJb1pXeEZpc0wyYnB4bUVwb3VVaGtCQzBFVzE0?=
 =?utf-8?B?MHVEWUt1QXpjSWQrQ09DazlYTXFpVGhUeWE5ck1mZFZvUUdNdTY5U2tndjZ6?=
 =?utf-8?B?WFVncTY2aXZYbldOL3lKRnVGZHFrclpSUFFZeStyT3Q5K3EvakpRUHI1M0Nn?=
 =?utf-8?B?d1RKUStTZkZkQWtsaFdSUG1mdHRsSjlhR2JhZlN6MVQ1WHlhR05vUFhjUmU2?=
 =?utf-8?B?REtDaVNJaTBxN2NQcU50UHJ2KzdkN0REa21PcFhNUitrY28rbER5S25Qa1pv?=
 =?utf-8?B?V0ppNUZjRHdBY1VLU1Z6SW92OFdVTC9VeHVhdUpyWnpZazJMZmtHZXNTVlNK?=
 =?utf-8?Q?mX072nsgy851jMEGCt30jFrEgT79NLUGTLvUCfr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fad4d4b-11fd-4d6a-a6e4-08d947a91093
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:56:10.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcIXKmmEAN1GR1l3xqXi70LhwygdmV5I3nieCSrIctz+hE29WzPmFN2EXQ4osEzk0X6GsyPXvN517+83cGZOO3kEC1SOQLhmksV9zDkWYa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3734
X-OriginatorOrg: citrix.com

On 15/07/2021 16:39, Jan Beulich wrote:
> On 15.07.2021 17:10, Andrew Cooper wrote:
>> The backport dropped the hunk deleting the setup_clear_cpu_cap() for HLE/RTM,
>> but retained the hunk adding setup_force_cpu_cap().
>>
>> Calling both force and clear on the same feature elicits an error, and clear
>> takes precedence,
> Right, I particularly didn't pay attention to this interaction
> aspect.
>
>> which breaks the part of the bufix which makes migration
>> from older versions of Xen function safely for VMs using TSX.
>>
>> Fixes: f17d848c4caa ("x86/cpuid: Rework HLE and RTM handling")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Are you going to put this in, or should I?

Feel free to.

~Andrew

