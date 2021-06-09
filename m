Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486BE3A147F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139294.257614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxB1-0007Cd-Ew; Wed, 09 Jun 2021 12:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139294.257614; Wed, 09 Jun 2021 12:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxB1-0007AK-BO; Wed, 09 Jun 2021 12:19:19 +0000
Received: by outflank-mailman (input) for mailman id 139294;
 Wed, 09 Jun 2021 12:19:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqxAz-00079v-Kt
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:19:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55943833-ee24-4729-b073-14c56028e23c;
 Wed, 09 Jun 2021 12:19:16 +0000 (UTC)
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
X-Inumbo-ID: 55943833-ee24-4729-b073-14c56028e23c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623241155;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9zr7hEYdIKDPRhh8WwHuiRL4sRbKqAeAbHghMcpvvdk=;
  b=ZXCbnCJY0KNORtOpNdP+NN/9Xi4xi0rdvI6WNFRz7VHYjLamiL5TWrFu
   sxfCbVXZEa4I4DVLrNS9f/ZpqECTfhMCd4YpSuc8lbn8LOWlzDkU0gPjf
   JwtZto7lH1LHvX+Y3HibscW1wDoDcvgJBIZTq+wOTg6Q5MmymEz6HE4x+
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bpcb30iZyb3rr96Es1eOanX/FpOv068DReRijKSId/vUyL0ur2xo4ZBtXhd/3+A2ufWwTYkEoy
 9ANIfEvDHK41/z7KCxU73FLuvVUFi3x04SKFc0IDZAAXOPPTFxXhmfpdmYIF0wr89Po5OsU3sw
 emjOxlMoPR85Pf5eI+aMTJTJBWAZ88+rDtz04wT3GPqw6/SBcvr9Kb3XMDa+7s3bhkNXle7Iqh
 t7fO1t5OjzJKxrOo77tke8NT7taS5fs7x7HgcYq+Iy1XnFZNSyBI3qLuF1FUN4bss00PPUaNMK
 iC0=
X-SBRS: 5.1
X-MesageID: 46092032
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vGQN3K69jOGimzc10gPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXZVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ876U
 4kSdkFNDSSNykIsS+Z2njALz9I+rDum8rJ9ISuukuFDzsaD52Ihz0JejpzeXcGIjWua6BJdq
 Z0qvA33AZJLh8sH7WG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxx75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjzEC3abFuLIO5kLZvu3+8SPw7bWTHAcEcYa
 lT5fjnlbNrmQjwVQGBgoEHq+bcLEjaHX+9MwI/U4KuomBrdN0Q9TpQ+CUlpAZ2yHsKcegO2w
 31CNUdqFhwdL5hUUtcPpZNfSLlMB2AffrzWFjiaWgPQ5t3RU4l7aSHu4kI2A==
X-IronPort-AV: E=Sophos;i="5.83,260,1616472000"; 
   d="scan'208";a="46092032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FchuKULF//jPlvdShuEdq1DPvZF90lnLfNHx6KeRDk8RMKfFNPdKx/DIznFiM4zRkMz9uayFxsl6Y4nssHsBx1HtbdywbA4LUp5QfZcKt/hPrKUk5sfF6tO0/KWazE8av5Dx0siYJZX+L70N8kTAhzcMU6dmNBTBvSZnL+awF5BohP6j6gHmWqE1L8UEp+qkw7ZKW+kc5zD4IAaYY5Sn+RT5DpIpdgQvPyTlW5iiz8+KFTUcGk53aGE6aS5rvULLqk0xuHVt6uEpTQs2JXyEuJA5nZsTV+TeGokCQVnnViCsmD68C2NRHzdmrjwDmfhqExIAau4floJWotwLUVAheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+Ooql3dIeG18DuyM6dRW/eyiblxjPfAJKbTM/sKP0A=;
 b=CEpOHJMjOE4LYZMQM1x8WgWJe/EECyvm9k1AC0v9t5AmL9wwgcmPCXV2sIyhVSBI4MmXXJdu5VcqWSHxqIdHGIBOsdcpukElcwcKnAiUIKNcZ+vkIJyzJQPvm/MDdqf7PyPolYZ31nRA5Fje29NRu0yFJ7o0A9XxoxNVGIAUfGAxDEx2hR8wcNXLTT8hmKJqjzf7VyvJH71iumVbIlp+veixzWLsTXuovjp+NWBscwU1Is1e0PnqkW3ZYD+wcHfC8q1z0XeKI6utI3CYqOp/3hHRJkjKX6OH0QhFxGNQ3kvM6fXr0dRvH5FlTM8HvDhBVfAVs9ESd0vb5qfemW6/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+Ooql3dIeG18DuyM6dRW/eyiblxjPfAJKbTM/sKP0A=;
 b=SDCKTq5JfgbFrwodAoIDzE6czcx8wnayjZfVJFBUDOtp1Kphp+w/+g0UL06haxm7x8VCjc9WqZoT7Sbmn/fPY8Y/uwkGvsaOVSlbklYKiKCDdSG+btvUNzf607iWsSxSHnJWmmAXW9aEooMMOReNoy4BtxEoni+P3cDEfvbirlE=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210608170559.6732-1-andrew.cooper3@citrix.com>
 <72aedd57-9722-2c5b-7365-f46a0e0fe39d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/tsx: Cope with TSX deprecation on SKL/KBL/CFL/WHL
Message-ID: <8085dad5-2957-14a2-c259-87d8bdd388b7@citrix.com>
Date: Wed, 9 Jun 2021 13:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <72aedd57-9722-2c5b-7365-f46a0e0fe39d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8a03399-fa55-4e7e-c533-08d92b40c862
X-MS-TrafficTypeDiagnostic: BY5PR03MB5348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5348CD24012E2044374316A4BA369@BY5PR03MB5348.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 55ainA/23ZUtuQyPSPsTlNd0TfNms76u2MsuAfdT2KNiKsQZd9DJMes3tkS3Xek07OrlHEsQ3cbQPLNO6rjpypTUde4kDV3sImJ+Gax8ZISdqlwq8jnBACJUHJ9crtH3olzGenVmPmsk5fFnQeATgmE5FdXsFCXVMnESMoHroq3JalgSOAK0kjFNuKS90GFlZ60WgBm+v40SOMJuQMO7SSD594bsk7LbgPCyR2fkDGChnXvn1lUUiE7wsaPLZAwOwbW46dsFLPkVd5JiAY1sNKRKh/GFc/gGkRGsX5yVq6rWvcKCNAWYdmG85N5ACC5/s0cPM4jKCfBOM666pdjCUXMShog8FhxrxeCXj3HcEx1T8DyXY2YL6dJRPAPyaKMg87jxTIBXzFXpss9GFWLzRl/NrCRJGdjqGodvdRc2Uci19l03FzNVVmqpFvlNRxE4/MD/kBWJW96lceMu6VnlO8hx0c4aaIaUsTPY5sw0MRYuZQDrOMJATvcBtHzCnVIyzvMrMZcK3mLOa8At35sJzhtZpv+ssQIT6SjOtORKK3QLCwBnPsGpxrl6/TewXI2qjdRwo6z3Hi5DB0DzvYlf2CQ3DjHZ/jr6azbyr4tHJuk2aNdeFhhwIStHolW6eOF4bJTFmILaqweqJhYFMuz85auUKa6+8Kr1+9MQ1dlWNETks01TSnzW8uM4U1QFN/jZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39850400004)(956004)(2616005)(478600001)(8676002)(6486002)(86362001)(66946007)(8936002)(31696002)(6666004)(54906003)(2906002)(5660300002)(316002)(4326008)(38100700002)(83380400001)(31686004)(16576012)(66556008)(53546011)(186003)(26005)(36756003)(16526019)(6916009)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGl6YmRCZE4wYjE4K1lHV3pkenpkT3QrRllnTEpsUVRTVGMxbE9LTDlZWUln?=
 =?utf-8?B?eVMweEJCK2l5eVYzYVRKTWt4MkMxTWZxbndNMnUrY1ZVdkM2Vysxd3p5Z3Na?=
 =?utf-8?B?bXp5bmlIRFY0T3k4VmdlSjZQTlk1bnlURi9CdTYybGJaY25xNjhBSnhTdnht?=
 =?utf-8?B?Sjh0ZGc2b3VyK0VGUEtNL3oxcVRnSDRhUHp2MnZrTUZBblNkSFdicUs1eElm?=
 =?utf-8?B?VXBwQnRVY2VsWnRCOU5qa1VMM0tBTU1kc3J3V0czV1QzT3ZKQjdBSWQyVFEx?=
 =?utf-8?B?RjFxY3cwZnNobzVEdCtybFZZOUMvS1pZNlVHYjU2SGdpSzVROXE1VTBSYmEr?=
 =?utf-8?B?QjBIT3RKUnYxSEZMaElHQ01sTWltcUpFaXhQM1VmK3NzYS8wOEhBdEdEelVF?=
 =?utf-8?B?Q0dubnFIdjQ2L0Y1aEJDcmI4dmtja1J1UnhJKzV5aENaenk0TU1sbGJ3ZHBz?=
 =?utf-8?B?QmdBNUJsQUFjVzFmaUtwQVZzclNCMml2bys5ZUdLQ2ZrcTFJNFJoTnZON1ZF?=
 =?utf-8?B?Z0tHVkQ0S09vaEJMSlo1WWp0dUdScTBEc21Rajc0V1N3NzRnT3ZQUnZkM1JU?=
 =?utf-8?B?NnAxSXF5SnNXQTFzZGpYd2xNWkloQkhUNm9jWERoR0Jrbms1aG1GT1p3VkdL?=
 =?utf-8?B?WlIyMFF3YlErRUl2bHYydEpLWmRpcmpjNlVzS0lhZXhWaWFQck1VbTZZY2pZ?=
 =?utf-8?B?S1NwbjROTWZaWGpTUzFSN2lTRFAra2VINjJsYTZ2clhEK05KSm9yZktiY29K?=
 =?utf-8?B?a2tpVEkwbFh2WWo1amlxbHRlQXpBSFEzM2JpRzB4RGx5NS9pUGJwTWhESGIw?=
 =?utf-8?B?Q0U5SWtxQ1g0UEFIWGp5V3ZmNHB5OGZ3UkdLUStTYmFiaktmTVFUQUFWVVVx?=
 =?utf-8?B?UGpzeGtObnYyU1FPaEFoZXFDTitVQk5UVlF3djI1UElYSktwcVdhdXZsdk9H?=
 =?utf-8?B?Y2E5bi9pWGRzaXUxdXJtdUpGY2kvcm9ES2tmZUc3WnYwZG0zK1FlbTVOSk8y?=
 =?utf-8?B?dE4vOUl0RjRoMEN6a0VMU1EvbzVXY0N5NGd5alp1WjJMbm9sbTR5YUFPNUh5?=
 =?utf-8?B?ZEVvOFpiNi9GeGVuNXpGSmx4TEZVR0pnV2NGektuRk84Nk5oQTV1cENWanl0?=
 =?utf-8?B?U1VEa1dkcDZ6VjRuRW9na1VvYkpMaEZmb3cySC9lR1lJK1JCY3BBT0JVS01p?=
 =?utf-8?B?RldKQmI1MFlFOUp3bFRYblZDeE1ZWVFBeHhkTHZnVVl3Smw5YnRwM2I4Y3Fi?=
 =?utf-8?B?K3h4TVhlOTd2WWNxVENqTUtGdkczUWM1My9LcHQzd1FyWlJEWWp2MHFYbmt5?=
 =?utf-8?B?NTBpVzFWdzFSOWl1b2IrZThRamw3SUROcGNMVjBxZ2poRmJYa0tiZDQvQmVW?=
 =?utf-8?B?dE5vOStRQWZQUkhvVHIwN1BHbi9Cd0lwZHlXT3o1a2tMWWVONGdGRDZGVnRX?=
 =?utf-8?B?Vkp0SVlnckpjOW1seHVlTWZCazVpU0MxRjJnak1NcW11QzBNYVdhaFRJT0pQ?=
 =?utf-8?B?aVBUUmpRN2RBMWZYdGZWdFpZd2FWMTY3VVVYUDZ0TC9BclFEZXMyeG1Ud3Zz?=
 =?utf-8?B?eitLbjFmUDBqay8vUjk3R2R6YlZRRmdSK2I1YTY4aXpOZDAyVFNZS2V6aTcz?=
 =?utf-8?B?SCsxSXZ2NUJHNlBES2x4U3hZbUNYdzJCRDhQenJmT2t1dERiZXowK3VNd3h6?=
 =?utf-8?B?RzFLY0owYnhlZU9MWERzcnV4OHBCMCtFUVpaQytpNXMwWk9iNU1FeTRnWHdF?=
 =?utf-8?Q?ISQAFml6pAFsvSqPoo1h1KaXlHR7zOn9g9dJzxk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a03399-fa55-4e7e-c533-08d92b40c862
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:19:09.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyOhNmH+lMSoh35xhCgt++9sjEhzy8TbdwJ9AhPTKU/1eeD3GAjoEpf9R+ncoK+rilMJr1I28B7zC63pb6EXE07f1/He8++yOnT2iquIyzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-OriginatorOrg: citrix.com

On 09/06/2021 07:36, Jan Beulich wrote:
> On 08.06.2021 19:05, Andrew Cooper wrote:
>> --- a/xen/arch/x86/tsx.c
>> +++ b/xen/arch/x86/tsx.c
>> @@ -60,6 +60,38 @@ void tsx_init(void)
>>               */
>> =20
>>              /*
>> +             * Probe for the June 2021 microcode which de-features TSX =
on
>> +             * client parts.  (Note - this is a subset of parts impacte=
d by
>> +             * the memory ordering errata.)
>> +             *
>> +             * RTM_ALWAYS_ABORT enumerates the new functionality, but i=
s also
>> +             * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set =
before
>> +             * we run.
>> +             *
>> +             * Undo this behaviour in Xen's view of the world.
>> +             */
>> +            bool has_rtm_always_abort =3D cpu_has_rtm_always_abort;
>> +
>> +            if ( !has_rtm_always_abort )
>> +            {
>> +                uint64_t val;
>> +
>> +                rdmsrl(MSR_TSX_FORCE_ABORT, val);
>> +
>> +                if ( val & TSX_ENABLE_RTM )
>> +                    has_rtm_always_abort =3D true;
>> +            }
>> +
>> +            /*
>> +             * Always force RTM_ALWAYS_ABORT to be visibile, even if it
>> +             * currently is.  If the user explicitly opts to enable TSX=
, we'll
>> +             * set TSX_FORCE_ABORT.ENABLE_RTM and hide RTM_ALWAYS_ABORT=
 from
>> +             * the general CPUID scan later.
>> +             */
>> +            if ( has_rtm_always_abort )
>> +                setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
> I understand the "we'll set" part, but I don't think "we'll hide"
> anything explicitly. Aiui it is ...
>
>> @@ -131,9 +170,36 @@ void tsx_init(void)
>>          /* Check bottom bit only.  Higher bits are various sentinels. *=
/
>>          rtm_disabled =3D !(opt_tsx & 1);
>> =20
>> -        lo &=3D ~TSX_FORCE_ABORT_RTM;
>> -        if ( rtm_disabled )
>> -            lo |=3D TSX_FORCE_ABORT_RTM;
>> +        lo &=3D ~(TSX_FORCE_ABORT_RTM | TSX_CPUID_CLEAR | TSX_ENABLE_RT=
M);
>> +
>> +        if ( cpu_has_rtm_always_abort )
>> +        {
>> +            /*
>> +             * June 2021 microcode, on a client part with TSX de-featur=
ed:
>> +             *  - There are no mitigations for the TSX memory ordering =
errata.
>> +             *  - Performance counter 3 works.  (I.e. it isn't being us=
ed by
>> +             *    microcode to work around the memory ordering errata.)
>> +             *  - TSX_FORCE_ABORT.FORCE_ABORT_RTM is fixed read1/write-=
discard.
>> +             *  - TSX_FORCE_ABORT.TSX_CPUID_CLEAR can be used to hide t=
he
>> +             *    HLE/RTM CPUID bits.
>> +             *  - TSX_FORCE_ABORT.ENABLE_RTM may be used to opt in to
>> +             *    re-enabling RTM, at the users own risk.
>> +             */
>> +            lo |=3D rtm_disabled ? TSX_CPUID_CLEAR : TSX_ENABLE_RTM;
> ... the setting of TSX_ENABLE_RTM here which, as a result, causes
> RTM_ALWAYS_ABORT to be clear. If that's correct, perhaps the wording
> in that earlier comment would better be something like "we'll set
> TSX_FORCE_ABORT.ENABLE_RTM and hence cause RTM_ALWAYS_ABORT to be
> hidden from the general CPUID scan later"?

Yes - that is the intended meaning.=C2=A0 I'll adjust.

> If this understanding of mine is correct, then preferably with some
> suitable adjustment to the comment wording
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Also Intel recommends this for SDVs only - can we consider such a
> setup supported (not to speak of security supported) at all? I guess
> you mean to express this by saying "at their own risk" in the
> cmdline doc? If so, perhaps mentioning this in SUPPORT.md would be
> a good thing nevertheless, notwithstanding the fact that we're not
> really good at expressing there how command line option use affects
> support status.

I think this is too fine grained to be expressed in SUPPORT.md, but
given that there is a very clear specific issue, I wouldn't consider
this an unsupported configuration overall.

I don't expect people to want to use TSX on these CPUs in the first
place (which was a factor in choosing off-by-default), but if they do,
there is one specific memory ordering issue of read/writes with a
committed transaction.

None of our code uses RTM, so issues in Xen which manifest with tsx=3D1
won't be related to TSX being enabled.

Obviously, if someone does report an issue, we can tell them to
re-confirm the issue without tsx=3D1 just to rule out interactions, but I
don't think it is likely for it to be relevant to reported issues.

~Andrew


