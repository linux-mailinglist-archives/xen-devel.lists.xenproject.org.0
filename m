Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4123F889B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173047.315762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFFO-0002FB-Qn; Thu, 26 Aug 2021 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173047.315762; Thu, 26 Aug 2021 13:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFFO-0002CQ-ND; Thu, 26 Aug 2021 13:16:46 +0000
Received: by outflank-mailman (input) for mailman id 173047;
 Thu, 26 Aug 2021 13:16:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJFFM-0002Bd-Vy
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:16:45 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db3f6ad0-066f-11ec-aa00-12813bfff9fa;
 Thu, 26 Aug 2021 13:16:44 +0000 (UTC)
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
X-Inumbo-ID: db3f6ad0-066f-11ec-aa00-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629983803;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aeimBsC7o+V57pFT5dQNmoHODJe6vv3gBDJA817hqCY=;
  b=XaRG+jgff01ap5zXXfoqRCFQwIcCDmJMdl71p+JjQcrnul676HNL/ltl
   pe27Xj1PwWyLYMZx2iC7jE7Td46l7Mti4NdpdsLdI+a4EFCmqgudfulrQ
   tHpC+1yVc2KumndKTZ+MYlookZiW6gHE8sssLu9uEmFmrwDwWzeAzoYBW
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kFLfSmBfCNKrUVkDykcvYA0j9Kzqw/9l0gBs/sTO/qc5i+yWogsJ+ITHcsSd3nZX9uIdqh9lxy
 SALUNre2BjCHkX3DAuHm0T8wsy5G99qYqHPgTbvQnqK8YNYN1Xy/m+qrAULienoulU8+YSkHWy
 pkR4vHdE3NwkRnLvjvD0CHm5ITmrk4qEBQABM9/Wo9xrbgXQj5NMryg/XgSl9tMraKxhSxG+nN
 tAwArlYH9XusIoJe2zOJ1ZTDQ0RLAK5OlHbDYcUUMU31oUH2kV/UTO4m6rKDosIG8jsyz3kjMP
 HhG6yvi9s8LosfH+7DuMyOSk
X-SBRS: 5.1
X-MesageID: 51754328
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3snsXq086mLdD24j7TVbagqjBTJyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJU80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YHT0E6MqyMMbEYt7eI3ODbKadZ/DDvysnB7o2yvhQdL3AeV0gj1XYfNu/yKDwHeOAsP+tBKH
 Pz3Lsjm9PtQwVsUiztbUN1LtQr6ue72q7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiiP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dqk/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69M9kWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS1NI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/FWH+ObcGUjbIy32BHTr4qeuomFrdTFCvgglLfUk7zM9HMlXcegd2w
 ysWZ4Y5o2nTactHOhA7ak6MJCK4sGke2OEDIuoGyWRKEgwAQOHl3fG2sRA2AiUQu1/8HITou
 WMbLoKjx98R6rRYff+lKGjtCq9GlmAYQ==
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51754328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MN/9ZoBgnseLMP9Pu6pyfDF8etF93S0CHnd3PHkKXJlwt09whmGP93q8oTgOZWskpZ0Aw4bmHDN9xL7mQe++dIc0wOWCFyg4gSzZxyqsIQJW1pV5ijXEuEzpXXNZ8YbxpFIIrbnRONLhQmJffgVXejX6Z0a8mzIqVnJPZFElO/KcD3+pQjq4R7+hDmHEJRTHLl4zrsIw/DL0nFv35Qr/tD9JwT9P26uQio1a8n+mO39OFc8dwdd23BiLvqDM0IIvHvrHosVuCP07n0CH+Ew/Nx/0CWb1bVncIS7SruVoPjWEtOrPrqiAkoo+/gip6WBpI/SGfNjDy/vmFTxvD//Q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObSRKMfCjstOfp3bszIM3eFOroR3P+6H7iY2fC1WXf8=;
 b=bskz/6SMmMwjNopTmXj3cxp1SQ98jjOEVUFbn3ah7Y2Vc0veIS6ntbldJ+vCcsVDRpTcsovT6xnFcniDXm7F5JlpUAqAW0ZSMsGHG51mC7tXkgVLNZfrzhwxL5YPnfR0rB5oEjteE6vw/PPmOn8kWhHBW/ufLLMf2lSK86/fQpi1hkkmiPDBMrEHTS6dYUcvGFR5ubKoYkBVjZO5pGH7419koEeoetXL7yH368Qc/1CKg9cN3Ppf9GS9PYQcECTzFl1cIb1x6+Pu8ZD2EVLNttmiEHmmooZ4whWy/hUNYN67zr4vGD12F8ShtF9IHQe+2Z1b7VI5r0J7U/RRwv7/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObSRKMfCjstOfp3bszIM3eFOroR3P+6H7iY2fC1WXf8=;
 b=kyZ4ZwfuxZOhs/CuiH8HCWaWjx40aKurgl6lLq64KUs+AWM+3FxXYdRI7Ab1bEZgX6Gs+OFHL5tLeBwy/YJr0OXW49VdM/M1/1w+RjQb9Yo6NqGaCyL+5gq7Q2fGWVdWssjpzITYFHzlTiTZ4UpOAegWHeWlbSBFSDPyx9wvnUQ=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <761f3ea8-bfc9-4a8b-7878-2ff9e3047309@suse.com>
 <871a58f1-e978-6046-db37-037ec18dbb9d@citrix.com>
 <fcf7ebc4-0f7f-0da8-b5ee-1578ea2c8806@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] gnttab: drop GNTMAP_can_fail
Message-ID: <519e7c89-8800-0b8e-7fca-a9e754a3ca2d@citrix.com>
Date: Thu, 26 Aug 2021 14:13:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <fcf7ebc4-0f7f-0da8-b5ee-1578ea2c8806@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00ac3306-e33c-4560-ea42-08d96893469c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5566DC193B5FB84C9A89717BBAC79@SJ0PR03MB5566.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RiX8g1wewQI9ZpV7JTAwzyTTxEf1NOOumbOuHq7qCkVK7BkGtipDCuTieolKj3UOnLXbfBYn8LFQKJBDludWv+iDNFLZsM3W0v5QenyeEM9oRheF1crUH9Xvas31XPl4fJoN6LnFIrXmugpM70nhiQttbY5ZhDnm92PrR1N5/kJzXW0bh0MUdw+U5LtkdfL00WuIPGcNqT4l38y9fBmPokMbPdVVDG+2WzZZYXA+gz7qiOmDa7emty/GLTYfu7EHPgGsebNmF/ttb4GYVgmyBCXm9qdCMTN2nT+KsxNmIkQl7jRlWRPqbREeu0W0GmUeSDMQDOjxm/GEwlejs3v9poWkR8rPWDQ+r2is/iVZ6YsoYpL59SZwV5BiNsR2648qOJwZTd3fsI5OqnAS6bJkMxxIvZfm4+76O3Wyl7E2Ljte3xo4ZAx6zidm61fWeQLZG/9CVhFX6+/hpb/Ezfy10+Gf92gW9UzVKgIJSJPtIQKDmYTgV+0eYiEkh79MHYNaxO0zBK6fKdtqGGtEP1J9V5Y2pMHntjEi21Q2gr1k2zHKlGugbBoxTjFJAo62k9SBv93L4n08ud6/ECl8xlZADj+c7O2W+ERce4vp6dp98S2CG0C4yK/m7ZTP61z71k3z/YS+hJDS1yTarkrwtndplLxS8bylFQ+ukH17inHpn/C6MdzRePuK7hi16AhRO4EnlYuHADy6EGT4S97XwOtwPaFJG51ng6pHcer5RmuuOSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(186003)(38100700002)(83380400001)(316002)(31686004)(956004)(16576012)(4326008)(54906003)(2616005)(6916009)(5660300002)(53546011)(66556008)(86362001)(66476007)(55236004)(478600001)(66946007)(6666004)(6486002)(8676002)(26005)(2906002)(36756003)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzZqU0NhdW5BY2p5WnVYY0VHSS9KL0dpeHltLzNTaE5Sc1BjaTFaaDZPUVhj?=
 =?utf-8?B?MXYySWFUR012TkJHVU8wV0xnNzAyL2FiUlNSSTFzQjhmVzRaOWFuTlVQTkZM?=
 =?utf-8?B?aGdWeFZFVVEwaDVoQnpiRDRPYWNmVyt5NjQ3U0VoZGtoZUpSL3hFb3B6anNB?=
 =?utf-8?B?MThjU0RXd3ZIcy9xYnVneldFSWw1V1lGTXMrbm5LY2hmS09yNVMxMlVhcDBI?=
 =?utf-8?B?OGVtb3RYbkJGMGZtbFBTbG51K0tsVFJWejR6b1lxODM1dHJvWGZtZmlhY3Zh?=
 =?utf-8?B?QmZEcTFVQlBrWWovTmx0R3p5c3JFQ3VNUWlRVkJVeDRVMUFhellwVEtjbFJK?=
 =?utf-8?B?WThiWllhamM1OFNXV21od1V2WXo1MDhSNVJTSnJOQiszUVVPeEN1Y09hZExZ?=
 =?utf-8?B?ZnU5VEtlK0IxVlYrWWJNejNmck95TXpqY05JTzBjYXp5a29BMVVoblNQZGV0?=
 =?utf-8?B?eGZFbFdVb09lWXlyOHNPT0o0a0pDWFlKbHdQTXhyc1hiK08vS08xUFNwK0kz?=
 =?utf-8?B?b3phZUo3bWp5eDZCRGhMSjdkdXdiK2Z3QmFMNXk0eFo1VFoycFBEdHowZEg3?=
 =?utf-8?B?dyt6V2dadWp4YkFoYjRLeWFCMmYwN2NNQURKU3JmVW9KRXNHa1pUWTliRzcw?=
 =?utf-8?B?TWd3YlZ3a2VMa0xDeVFSelBwL3JqWkYwTXlwa24vK0lEcGZNb1k2S1VwSTBW?=
 =?utf-8?B?NnR4ZFV0UWZtVzBSV2tVR0hXTW1BUURqNVNKWS91YzJKWHVpRE5ONXBRWEJ1?=
 =?utf-8?B?RjNOdVU4Y1hCYU9RalBMWmNRci9reTJROUNHSGViMjJoQXFwbVVyNGM5MFlw?=
 =?utf-8?B?SkFxb2xxTjhIM0ZEc1h3OHgzTEYwVHE4eDBZb3d1a1BlbzBhMDlyVlgvclgr?=
 =?utf-8?B?MFltUVdYQkErdVFaUDdhcmk3ajZkRWdRY1B4WTFIOEhWSml6SnN1WThmK3JT?=
 =?utf-8?B?anlDMHJjSHMzWndUNkZab0luMkR5TnNxWGdURVhSWStIK0hhTFpSSTVLL1pj?=
 =?utf-8?B?U05DUVVFcHNKNFZFQk9rYVV6b1ZZUktSUThxd1ZKRWJOSytkbGo1dlMvL0M3?=
 =?utf-8?B?MlQzSDhXRFM1YW5sLzIrdkc1Z29iRTBJNHg2U1ZxTFQxNkpMQStzdTVtZGov?=
 =?utf-8?B?c3pzcTJudWNXN1grcUxOT21PbFY5cDVxeFBMTlhzajdWZ3BNS05jcTRibkpD?=
 =?utf-8?B?MUJVblQvczhIZnBKWUJ5RStyaDBNTzhrQ3l6cG90SDR0THEvaVBoTGhjWmlO?=
 =?utf-8?B?ZGJyeU9ZQU1SY0ZTUWdlKzV4UjBNY21MWlJLYVRSZkhIbjJEYTI2cXZIakZT?=
 =?utf-8?B?bmpKejZRQjUrMDZ2MHFrTStDbDY4aDRaK2dhUzI1aHhRNGhoUmtSOTNsUW4x?=
 =?utf-8?B?MnFETDk4RjBPdytudVBrU1Z2cUZvVXJ4SGttdCtYT2NZVElMb1N4OFZob2Zx?=
 =?utf-8?B?SGV1MDlLdi9pMVBvWkttditZVk01SE1hWGEvOFAxMFFaZStIU3p2ci9oWFV5?=
 =?utf-8?B?bWQ0S0twd1ZUQUxNTHRobUpFOHM1V1lmSE9JS1IrVktLbVBVN3k0WUtWREZz?=
 =?utf-8?B?aGlJNDhienNmQkRTV0lvTXpPeTlYck1XbzVaQW1YeDdIRW4wL2hZZHNQSU1x?=
 =?utf-8?B?ZDRBNElWcEUxK3JPWVhXQUk2T0FxNXRmQ1RKbWsvOE9GcTdkS2VBQ0NZYVlh?=
 =?utf-8?B?ZG12Q1VseE5zdkpvZnZWd3JJZ21reUR4VkU3ZllEVk9BRVAwRlVDYzd6MVZJ?=
 =?utf-8?Q?0n5yi+GwCU7qw1QxdXHO2zThXbc0qLMb+lINItr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ac3306-e33c-4560-ea42-08d96893469c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:13:20.5135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDMkYtojccLrogXiX9zHFbpkh9IAygI3pS3W78HVPE2/2o93JY+3xQIXHk5x3E63mS0OyyB/OO4gKNUY0F31DPbWyapAAXoduYa/mnVUzYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5566
X-OriginatorOrg: citrix.com

On 26/08/2021 14:03, Jan Beulich wrote:
> On 26.08.2021 13:45, Andrew Cooper wrote:
>> On 26/08/2021 11:13, Jan Beulich wrote:
>>> There's neither documentation of what this flag is supposed to mean, no=
r
>>> any implementation. With this, don't even bother enclosing the #define-=
s
>>> in a __XEN_INTERFACE_VERSION__ conditional, but drop them altogether.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> It was introduced in 4d45702cf0398 along with GNTST_eagain, and the
>> commit message hints that it is for xen-paging
>>
>> Furthermore, the first use of GNTST_eagain was in ecb35ecb79e0 for
>> trying to map/copy a paged-out frame.
>>
>> Therefore I think it is reasonable to conclude that there was a planned
>> interaction between GNTMAP_can_fail and paging, which presumably would
>> have been "don't pull this in from disk if it is paged out".
> I suppose that's (far fetched?) guesswork.

Not really - the phrase "far fetched" loosely translates as implausible
or unlikely, and I wouldn't characterise the suggestion as implausible.

It is guesswork, and the most plausible guess I can think of.=C2=A0 It is
clear that GNTMAP_can_fail is related to paging somehow, which means
there is some interaction with the gref not being mappable right now.

>
>> I think it is fine to drop, as no implementation has ever existed in
>> Xen, but it would be helpful to have the history summarised in the
>> commit message.
> I've extended it to
>
> "There's neither documentation of what this flag is supposed to mean, nor
>  any implementation. Commit 4d45702cf0398 ("paging: Updates to public
>  grant table header file") suggests there might have been plans to use it
>  for interaction with mem-paging, but no such functionality has ever
>  materialized. With this, don't even bother enclosing the #define-s in a
>  __XEN_INTERFACE_VERSION__ conditional, but drop them altogether."

LGTM.=C2=A0 Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> Jan
>



