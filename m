Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CD48A854
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 08:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255622.438080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7BUx-0004Z2-3N; Tue, 11 Jan 2022 07:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255622.438080; Tue, 11 Jan 2022 07:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7BUw-0004XB-Vs; Tue, 11 Jan 2022 07:23:14 +0000
Received: by outflank-mailman (input) for mailman id 255622;
 Tue, 11 Jan 2022 07:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7BUw-0004X5-8g
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 07:23:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5558a614-72af-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 08:23:12 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-qWWo8nZ1PzaQkg3bFVkdGw-1; Tue, 11 Jan 2022 08:23:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 07:23:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:23:09 +0000
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
X-Inumbo-ID: 5558a614-72af-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641885792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tj7+CMO9M+aDoUTXHl7GkGsI2dJVaO4HlSkCmY7AjJU=;
	b=APVf0Bo2QNzTO1BbHJgppjfqZzrINlDEv+h2VPwpvhy2lmh5QN9KD1FHiwimDWZK+pOZVV
	9MgKSb7uMK4SuIdHnLMNbmFo8FVuFwyPtnO/ajJBHY8Sw2NuU3WWN4eUoj7sQuwf+GM0X3
	l6BVFYkZxvbP5zFiHfv2SLqFNxVzhp0=
X-MC-Unique: qWWo8nZ1PzaQkg3bFVkdGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMesgHUXhrp4aFA43HTlE/HbLsnQYsfTBDpjIrHjwNZQPKUlIVKXmoLrGedd/CxmgPCGLR6tYT/jz3t0MaAHxkS+Ozl56yS+bPpu9nVrnJtORDe6pklhznxocpkPv512GnaVFW7lRshJYaSFyFkEW7TCfXE/A2FGQKQxCRgTvjNOCsyo3qim/YhlJ0jQ+dV2sF9pYzU5MLSlwTcBTWJwRYb+5svafHhYBjm1GYVGOnmKwzU7QlvcH1ihxmvUa7SdSsXzDi+O4fldsT/Oc9sCjS9frrzRcDHIXdm9CQ1o+3pvdlV/MNHR3FIxJQr2rm4TdCWnDY+/uh3Vf2U3I0Yp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SoqZ929RoASKrPF0SeSVT3ZKWBIKwZpe6N3NV2aFAA=;
 b=I9AkgR9zQJ9d/T4ZuGadZeDTJCrEWuqObp9n0qwD98RnR+y9XZ1T8/CrO8qJD/0D7Cde0zcWhDFbQXd58z+VCyBz9tJH5BYXdxylBTWXOyVitz0eRoJEeXQNuxFxJmhmtoy4UKQYRxl65BdxBGnLeJmDycdJ6qGlOYp9hZR/Q0dqDRCBYQtaTApXyY4NDKOPabNVNnYzdCXcbvQn07XfARxgV2/cWoVuUOmK2+rtAr3dAkxdVk4R+upBycD3eFRJ6k2IXuxqfCi/EOogjBY7CutN2qyiYQ719pnY7jW00eBGVhlMzzAMXD6/Id8tXu1AKW5j2C8hn3ZFkzanYuDeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1014b99a-783b-0923-03ff-7a358b21d791@suse.com>
Date: Tue, 11 Jan 2022 08:23:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <amc96@srcf.net>
CC: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
 <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
 <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
 <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
In-Reply-To: <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cbb29db-15f4-476e-5ae8-08d9d4d337dd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3773505E519D3490DBB5BFF8B3519@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R0i0PamwB88D6ERQBf9x2bkyKNCq4Pv9qYq/hygfSYkiCf5erTDwUt0f6eWyDymq53QmDXdeQi1CIuuH58eqJn0PxTolIpQVRj4RMfLT1xaUurNcYaw8callycpBfn+NfkQjjND72PESCvCR1ykHbyc08jQ5FN6BQTyMJQyItus61iholmZk81ttRjTMqad3ouSAVv0KxZEOq6ADkwqpiByaoDlHFV8yHRj0s1lXOJrJl95vkOTfrXP6B2Xg/HYC9LC+0K7QkA/gUCd8EQeYEXBpE8+h6OBP+aTEFzbr3uIJl0zZVByc28cGlTpoVvAkU7FZw3o8jPkv+SQGnDJgeFnMtdNyFv6fxU75Robqwg7OvH5tDzTI55GT0eymGxCAsZIArc+QOnXGCM9cRWovUwT8Ohowuq/zkik26nuBWbp8/5/tAnvFSzGjzDTi6sIsHNIjWSMLPxmlZ6tUNgGNoGAF4WouWIhSUt4vzMYEvqNsFz5WK2qy/6y420lAfSN6G3HqtanyttzSUaLO8lD0ggiIapSd4XJz3BPwEh4ju30PbDkw9YvhEr1USpSfSojmqcIHD80h9g1ITg3yK2lPLrLxPjZx8y3h558Mtd7DLh5JsiVrHxmHmspZuvs0CdO76E0j17+LufVuTqnApO10nmqy0huVLpF3N9K/5ez0Q0c77qpUonlzdC0CQ8akj9pzYnVW+oNxNjxf6vBLfm69f44l5aas0QYEJthqcN+n4xwiQW5a/hvvLSk2DC72F9+J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(6916009)(8676002)(6506007)(6512007)(31686004)(2906002)(54906003)(186003)(508600001)(36756003)(66476007)(4326008)(66556008)(66946007)(2616005)(5660300002)(8936002)(26005)(83380400001)(31696002)(6486002)(86362001)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PcycUCM5QkMDYxYrdrJtLxsBP/PvmxnCJze9CFd3h3JZ7Bl5wrKc2UnFDawG?=
 =?us-ascii?Q?6l5v5B9T2kw7Y/E9Rb/YSfRKcnbU8DSTzmdIWuP8lSuZkfbQMrraNZcQADZg?=
 =?us-ascii?Q?ronW/XVnUc5UcD0cdGdv0ieSW0J6ObLYnNIGi0zjEK7ZwzhhBCQ6jVZc8i87?=
 =?us-ascii?Q?8ZEUoFhEqXQ4dQgP8tiwLzN5an4pLHVL7SCOKkFsMHCpCZi2Fg8SkVITjIRg?=
 =?us-ascii?Q?zFwFyN2XZWN6+u8B23WCz+YMU8DMsBnW1PPDuNsMDNvD91SwsCOWeE+++IeY?=
 =?us-ascii?Q?TO9TTHi03cGAJRGtbp3sYLeUj0nHOAzHKNiCuz2P8283+Su/wjHxwSgDe+FF?=
 =?us-ascii?Q?+5CMNOlfQL7eLqykZLnLujaKXOTj5xVG1vqgGJH2rDOsgmZAR3xn3h67EhfT?=
 =?us-ascii?Q?2fRMgBFYyJk7J4cRQ6L0TmfhSigJWqFbAT5sB+dBaAeODGOqyX1TfrSO3Arn?=
 =?us-ascii?Q?hkIaINYBuvVdwifDPSFoJcZdnvRV5J98FIWw8mKP4qCV4HdQWQlNRo0AglBX?=
 =?us-ascii?Q?j74gjmbihlXCtocrPtEhMBzRH9cjpWMdltF3Vyg4UL2Ub89wK/BZhry0Rk56?=
 =?us-ascii?Q?tj6A3uwebx3GqeYXBFJ/Pkj9Qj7hII6vC/k6HNo19ym++Fz8TzU4RcMCobUR?=
 =?us-ascii?Q?O5SEIU3f+In1gFcrP/cbt9kS3BleyTZh8SwiuAoHCMOviO3w5YmDzNhYdLrA?=
 =?us-ascii?Q?L0hXVmaZzG5siNGOIUMZjwE1NlWojDlnpyUqOPfs7SFOALDs1WZwjP3bCegL?=
 =?us-ascii?Q?xwHK53xkeJHcOlPL4Oupgw3KOBK5Yq/y6QCRSlN6UCK1tfAF068lcZTVxRS6?=
 =?us-ascii?Q?3U1VrXnUpes7XZLfLnSoTVAm35CLDevDl7TAgpLEXseMeB/q36JPRdUTVhBP?=
 =?us-ascii?Q?1vvUWyxeNtW6G/3JVmna3KJxpzt0iDRvg0qpp6EV03EUjdVrlJ9LT0qT+dmy?=
 =?us-ascii?Q?YtLNjhYWLlZeWecBzfahKcGkxNAwYgyRjcC5vvaD6cD3j0K3e1JBXEyLJu1y?=
 =?us-ascii?Q?bdXQVaPFF2wjkjaGajeavhj2uykHH6OXZLIxlaCx54slEGintvhguTagMu1e?=
 =?us-ascii?Q?CiAHHMtrnocMkxiFFBj+ta9aLtoR9lw0EpMxm/2vD3NjSlQfNy8sG3jFoggD?=
 =?us-ascii?Q?fQWDu0zXEjY4tQEdGa2Wq4fYfODhf/bN0PzGkMSlLR2pcGvF+snwiPxsZ5+B?=
 =?us-ascii?Q?1MEs4RPyEIsW3S+GSaoYOBeDZ90PNrN1V45B8fovsASdHQrg15nZsxjtEPDf?=
 =?us-ascii?Q?M4M8HxMa2bFZzwuskCS9hl9sDmOYn7v0IXnhocXnE0rjQp4LQvua7BXogBnF?=
 =?us-ascii?Q?G2W3akT/Z4DO2lNZg0EBgeXyUAYuOL5hNMWemK9bXXRkvyLIZDKz477OzmSp?=
 =?us-ascii?Q?+0dv5LRzZd0Twn3tMdA2IeajbNI/KGL6OJ2R9eA5uwpau7dkXpVK+y0NsXPJ?=
 =?us-ascii?Q?3DKTDQ8/OcXHuMFi3Pngc0nfUasK8k3eI1b8WvcEy5MTYGS8ZX+n9uAOPbja?=
 =?us-ascii?Q?nGyCS+LQZHinixJY3KU/8UCZlTeIhiac3gBeAkbBgQem+iUpvT2+BMlk1cxr?=
 =?us-ascii?Q?BGO6kEY5viwHZPB+RgokW/V0ICV/rQVd5icfb1bu7JDvIuhE8V9bETMPcVl0?=
 =?us-ascii?Q?c3d+BfFYGsw5CfomQLhEdJY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbb29db-15f4-476e-5ae8-08d9d4d337dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:23:09.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OB5tqTdpKr9ZdQ052lUtBePq/4o/UAZxzvtfGeq8j7QEMQyIGhGq71u3bawP2FIvfXiGaLgOooYdEqDiyQg5Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 10.01.2022 18:04, Jan Beulich wrote:
> On 10.01.2022 16:43, Andrew Cooper wrote:
>> On 10/01/2022 13:11, Jan Beulich wrote:
>>> On 10.01.2022 13:37, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>>>>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>>>>> =20
>>>>>      pts->frequency =3D hpet_rate;
>>>>> =20
>>>>> +for(i =3D 0; i < 16; ++i) {//temp
>>>>>      count =3D hpet_read32(HPET_COUNTER);
>>>>>      start =3D rdtsc_ordered();
>>>>>      target =3D count + CALIBRATE_VALUE(hpet_rate);
>>>>>      if ( target < count )
>>>>>          while ( hpet_read32(HPET_COUNTER) >=3D count )
>>>>>              continue;
>>>>> -    while ( hpet_read32(HPET_COUNTER) < target )
>>>>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>>>>          continue;
>>>>> =20
>>>>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>>>>> +    expired =3D rdtsc_ordered() - start;
>>>> There's also a window between the HPET read and the TSC read where an
>>>> SMI/NMI could cause a wrong frequency detection.
>>> Right, as said in an earlier reply I did notice this myself (actually
>>> on the way home on Friday). As also said there, for now I can't see
>>> any real (i.e. complete) solution to this and the similar instances
>>> of the issue elsewhere.
>>
>> Calibration loops like this cannot be made robust.=C2=A0 This is specifi=
cally
>> why frequency information is being made available via architectural
>> means, and is available via non-architectural means in other cases.
>>
>> There's a whole bunch of situations (#STOPCLK, TERM and PSMI off the top
>> of my head, but I bet HDC will screw with things too) which will mess
>> with any calibration loop, even if you could disable SMIs.=C2=A0 While,
>> mechanically, we can disable SMIs on AMD with CLGI, we absolutely
>> shouldn't run a calibration loop like this with SMIs disabled.
>>
>>
>> Much as I hate to suggest it, we should parse the frequency out of the
>> long CPUID string, and compare it to the calibration time.=C2=A0 (This
>> technique is mandated in the Intel BWG during very early setup.)
>=20
> This, according to some initial checking, might work for Intel CPUs,
> but apparently won't work for AMD ones (and I don't dare to think of
> what might happen if we run under, say, qemu). Imo we'd need to deal
> gracefully with the case that we can't parse the frequency out of
> that string, with "gracefully" including that our calibration still
> won't be too far off.

May I further (re-)emphasize the fact that the issue exists not only
in the calibration loops. There we wouldn't have a result that could
(in principle) be compared against some parsed value. Whereas my
proposed model can be adopted for use there as well (I think; I
didn't actually try it out yet, as I was hoping I was overlooking
some other, fully reliable approach).

Jan


