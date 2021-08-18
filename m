Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EAD3F03EA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168248.307180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKvy-0008Cx-GZ; Wed, 18 Aug 2021 12:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168248.307180; Wed, 18 Aug 2021 12:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKvy-0008AA-DJ; Wed, 18 Aug 2021 12:44:42 +0000
Received: by outflank-mailman (input) for mailman id 168248;
 Wed, 18 Aug 2021 12:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkKE=NJ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mGKvw-0008A3-1e
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:44:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99382d05-6c1b-4dcd-93e1-8a0e688e9fdf;
 Wed, 18 Aug 2021 12:44:39 +0000 (UTC)
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
X-Inumbo-ID: 99382d05-6c1b-4dcd-93e1-8a0e688e9fdf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629290678;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WF5YtZyZmbMnzgx+lb1T+yu77ciyPvMP6CrWKYfX3lc=;
  b=iQj5tZ8bunMJglV+BOCDtD5h+XBbMk+0n15Oinz0Yl5RwvkC4MDAHing
   FaXqUsSWao51tg6uDPlLLPoAQGnvG7l1qZnuXujxDRXJmRXtwwH2WNIZU
   9UbN9TUxWqWwgkc0JLPwF5Kh3RLLxLpBR/iyzDL+HGQawwUnO+tBZfY/h
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /tGpiP0w/p082c32XK/uuIea1KV2XQ4FX0mDxRr0wUzYmzD5b15/4iryO46vevfYxbhgMin5/f
 MXoWp4k0ivRsZyToEh9sJLd1Zaha2A6StZge34I0RpGC1Kt0+kZUid/37cYu8eVwZm7hogmLtw
 so9Id6vX7CtNQ3Og6QRfdgPwrU3QpuhIntq95FFsAzGYlhdMZhmruvjfieot5vnXcNZQj9hTTq
 D+bOYVOtlVAdBdNaWJbDYL67SOQ0MEzGh33SbLEgpnyvDDpYDrncvWufEmaXpxGFkfAr4Q4N7f
 3qHc8PBBSKj9kGTVIYIdPWHL
X-SBRS: 5.1
X-MesageID: 50366008
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iBQxpK7XRqifRmMWwgPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 eTdZEgvyMc5wx/ZJhNo7690ey7MBDhHP1OkO0s1NWZPDUO0VHARO1fBMnZsl/d8kXFndK1vp
 0QFpSWZueQMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.84,330,1620705600"; 
   d="scan'208";a="50366008"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+zd/1sz+CC5JZwDENWYA5HeOfahd/7TyGnBOKF3q3NM6LPOgyZ919AJYDkwNpa1CAWAOanSLhoSNH7T9RrntwmbZF9Kq/bOetlxMaFr0ErYKhOlXF1WBkhe5Jqe4rGUv1ls+OUTxOqTuxZ88JrBM1yJRzHOniVJ8AQYa5QxxpAFeXwkP/S78VUCZVwcPvtDrxOd7+CcEgCIVJw8XzzXO4Aed9a5ojdxsou+UmnLOepFL5S6OvZw/eRQFry0baRooeuukGAvsJ7xpuxN1V9tBsrKDRzRW1iNyi5w3CHpXwsGjhwt9/9+/K4p6rO7HM/O0fktw34LlCT7HssSqncp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFYhDBhUCS0YD40eROBDEVLhliCAdHbpSCDqVnK4Ujw=;
 b=XagxKyL1OacL9L2ylVGI1zdH8tsqaYtdQkW+V3KbfT57jEahAPeNmZQYpGjwHD1OXtcdYjXJ60it78FyNK3iE6RclH2A5gTCu5Jj0aHajYUL/xxWnrJwoYWHo8O8s48ntK4O+mixazNj8uWEJbTiZxplXIgt8q30rQbJgY3LqtekfPGlPc7cLq9ewE8nEGNVrE2PERa6kDBjYL/v34uo4MfbG8dIFJBfrAd/IVHz+6jPFc4EySJxYxtDN9pVKABZ9UFYVZS//DG7/ldtoavgHQcwKn/DXTYbjjtxwB35dTActdMYKiKS4mfZfjZ9Jya53K+LPz/l3urOA1ZNGEbc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFYhDBhUCS0YD40eROBDEVLhliCAdHbpSCDqVnK4Ujw=;
 b=cWhmECRSLKPy0UaSyWQ7jkPou9tnsWXldURYHY2Q8+TgyOwh7TsQfkZAthfYFTihcSUwDIIcW2lIFFCyhMWmJKSJa2DmUZy4XmJTG4b8lI7ddDtObey1Ec51MvsSej3skiu3/JkCOWEBi8HQk9/lQm3hmhWl8fo00INu5YOCEPU=
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
Date: Wed, 18 Aug 2021 13:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::19) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f472b05b-3a19-48bf-1fef-08d96245ef7a
X-MS-TrafficTypeDiagnostic: BN7PR03MB3428:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB34283E63AB8D85235EA7AEE0BAFF9@BN7PR03MB3428.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: exhacGP7UwwotIVs23mCHJO4tKBJq8ZKlMSzOQ0X213CkRkU73/9ukpS3LCQTEL++/2/S+8XfIANbohAuHguHwFS+RZKN/u0KLqTVhKgUrnW7QOJIa1viHubp6eUtGzgWdPUTOfRttiiR8VoPOMwjVcAw69FnZjiy3sWBkBOY4ywPMzRx+2w5iTX7GRCEpXXpeZG97SasOmUZ4ZqpFu2KWq8EEIZA+PuGmfIzilUoqqI1EB6rrFbIb155Y9nAQeNbZOJWzwbRa7r1/XPh5TPM+MddymJ4lOM9ZW9QuI+2BS4rcPbzvHkh1d6PFHPqUc8KD0StV9Bd0rJSdqgW5Z/YRMTNFp37Mg9kdI4KGHLG5Tg///BNyyVvQk8DIhjzWvXuObZab/pz+ElpsVZddqJIVKHArMXHJB1Qm2tJzZK6j8tZPbrQLG/es+UUmzGddiPXtxCeozvYpGhgBv51JHkaboRGGkx0NrBHP/8sMXIAoXLMsjCHZn83JwTfcnNFZ0+gLu9agxVY7kHN3F69Efq3ex3eRg9GrcYkRFLdK/BmVlsu2+4cYHDF67ALWCnyUgibHfRqgY5Jgss577vQaBdgfScXX+3o2QTnhoUD/pJtOlSDvweoasG/ZtxZ1CtwC8jSHZpL46Hl0UBfSIUbWpWyRoXuTQYyR+DcMdHPEkgzfqiYgvknHb7Lez32046BJhE+f0ESF92PeHdpud9nJKRROge9RTc4I4vuGbozkFHfLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(2906002)(6666004)(83380400001)(86362001)(8676002)(53546011)(38100700002)(54906003)(186003)(31686004)(36756003)(2616005)(16576012)(316002)(956004)(31696002)(66574015)(478600001)(8936002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFNQT2Y0b05BVnAxN2NOdjhmb0tZUkRjQmwvcThrZzM3ZWFrQzBOZnJseXI3?=
 =?utf-8?B?NDlBcFJUUkN2V0xHQ01CQmdnNDRCdXI1Vk5QeXB6MXZDM0lZdUI5T3hDMHpq?=
 =?utf-8?B?OTNneVdrM2t5SWMxUTliT0dYTENtRjZTcTVySkUwVU5HZVNQSHdoaHlZYno3?=
 =?utf-8?B?TkllQW5zR1RVNCs3aTdPM0FMcVBYaWk3QXRoWHR3N25nQzhnbGdqMit6bTNt?=
 =?utf-8?B?dUJmOVhRcS9Ca2IyL29RYk0xYWtTdVE4NXgwNDAvUGVCaFJiT1BGR3lnSENO?=
 =?utf-8?B?UzhUM3ROVlZsK1J3OTNsR1VZeWN1Ukx1ZGU2T1gvbzQ1Wnh2TU9OQllHOEw4?=
 =?utf-8?B?dnUvS0ZPRHlJb0paelNFdTExeGxPMjRzbDR2aXlsYjBJTFA5d0tFZ2w2Mys2?=
 =?utf-8?B?YUVRUm1wUGNyZ1I4WVVRSmtVaC9CMjZicHVSeFJ0bGZKekZPR1Iwek5VSk51?=
 =?utf-8?B?NDMwVFdvSk9WWjdjTE14VHo5UUM2T2NRTksrVXJaQ1FMVll4U0ZTZUVBRlVE?=
 =?utf-8?B?eDhPS21WeW5EbDcxZ1I5Q1hBKzg2TkVUakpzTklzNWcyanRsY1B1NFo5cDJo?=
 =?utf-8?B?VjdCTlkyd0ZzTXpydldYank2bEhhTEtEbVFWTmJ4VE1Kb2ZTUDFQNlZkMGti?=
 =?utf-8?B?M0JzVlBZQ2tYcDZya2pIYytORlZxOHBNK2w2dkxtZHBNdEo3aVVRYmtIS0hQ?=
 =?utf-8?B?aTFSUGpBWjBtUWdBaU16UUNaV09nbXltZnQwTTZ0MzNuVHBaODhCSE1ZQnRU?=
 =?utf-8?B?SU8wKzNHVHY5WjZUVDFEbzkxN0dvZmxTYkZyY1JRLzRtekxPdmNuaEUwR0RH?=
 =?utf-8?B?MzJjc0dmY3Y4aDdLL29ZYzRVUFBoUkZPendvYmtUSzZ0QUZTMm9IelN0cWov?=
 =?utf-8?B?dFZ2dFh1dnRnRWNVMjdoRDhSZkVEbGIvYU9FT1A1aDg1bW9MNnl5R2JLRERL?=
 =?utf-8?B?RGViMmgzTnFISC9jL3lqcStaa1hiUkczTGhhbFZWWVB5cEZnMllFa1dUQWRI?=
 =?utf-8?B?NDdCUjdyMUVVRDZtK3hEWE1sTjJ0SlUyTlAxSVBFVTE0TmoxMVVibElwcGhP?=
 =?utf-8?B?cVY5WHhoYWtJZGxyQU5QSHcycjh0VjNkZVZGOE5GOC9sQy9qMU5CYkNoN09B?=
 =?utf-8?B?c0Y5enFFYkJoSHdBdW9lZXZrOGhPR093ZmlyWG5oUVNmVk00L01kcmU5NjRq?=
 =?utf-8?B?OXBqVVRDemU4YVR2NWJSVDhvRHNDSmJzMjA4dHhrWE1aSmNPb3hXaTNTVy9S?=
 =?utf-8?B?Q2YxWXpHWDdMTEZnTlFFRUkyd3kxTFYyQ1hlMGJFdDlya2Jid1JGTFIwL0Nr?=
 =?utf-8?B?eXhwdDU0WTNHSTVYR2FUWDNRbVUxS1JBQ1NHaEZBR3BObnBPckhKc3IwRmt0?=
 =?utf-8?B?cE5SU05qeU1JUG5IbFozNW5CME9lbFFmdUVHWFlIVXYzc2tJMUtJQVhTTEpy?=
 =?utf-8?B?RmZRcTFtb1EzSXJUT21qYXVGRXhJODVOTkE5OUdvQk16VHlYeC9CeWhwOFJD?=
 =?utf-8?B?MnRnc2YyUFhCSDhETzVSNjh5aUI1TTdsWmZPaHRaUEZ5ZzRyWm9KdU5xMVR3?=
 =?utf-8?B?UUpicHB4THVkUWNOcUVtRjVnMnltaU9zWjExU0N5TEVOY2VpSUNCdkZJU1lP?=
 =?utf-8?B?Q2RGdDBMdFJ6SFZBVXpOZ3pZT0k1WVJubHEvNVlvSFlvUW8wMzhETEY4c3Vm?=
 =?utf-8?B?N0NMYzE1SldNMEFwUnoreEQzdUtiYjFnL0NBUllNR3dnMGF3WXRRTFZYZHZk?=
 =?utf-8?Q?S4Bu0abVkml8FqdYGYozd3r+nTTvYq4d2/Zp3Y4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f472b05b-3a19-48bf-1fef-08d96245ef7a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:44:36.1168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KpfFbalfkiIwhBk5QJwPC2ECN+VuvoKtKtvb+nIWnztC/2AICYsKGk7zVa0mNOufeNEL/4ktofRGmIkGS8LgJIhSoGliP0aJnKulp3ODAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3428
X-OriginatorOrg: citrix.com

On 18/08/2021 12:30, Marek Marczykowski-Górecki wrote:
> set_xcr0() and set_msr_xss() use cached value to avoid setting the
> register to the same value over and over. But suspend/resume implicitly
> reset the registers and since percpu areas are not deallocated on
> suspend anymore, the cache gets stale.
> Reset the cache on resume, to ensure the next write will really hit the
> hardware. Choose value 0, as it will never be a legitimate write to
> those registers - and so, will force write (and cache update).
>
> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
> - set_xcr0() is called few lines below in xstate_init(), so it will
>   update the cache with appropriate value
> - get_msr_xss() is not used anywhere - and thus not before any
>   set_msr_xss() that will fill the cache
>
> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

I'd prefer to do this differently.  As I said in the thread, there are
other registers such as MSR_TSC_AUX which fall into the same category,
and I'd like to make something which works systematically.

~Andrew

