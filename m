Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95477D3A7B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 17:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621540.968099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quweB-0003Lu-BF; Mon, 23 Oct 2023 15:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621540.968099; Mon, 23 Oct 2023 15:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quweB-0003Jj-8K; Mon, 23 Oct 2023 15:15:15 +0000
Received: by outflank-mailman (input) for mailman id 621540;
 Mon, 23 Oct 2023 15:15:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quwe8-0003Jd-VA
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 15:15:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5c7fbf5-71b6-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 17:15:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7186.eurprd04.prod.outlook.com (2603:10a6:208:193::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 15:15:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 15:15:07 +0000
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
X-Inumbo-ID: f5c7fbf5-71b6-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laEQG/hnAr1L6cX0YNRysKfNwSibbAdnEzuKIg7GAvwAtiSmNwsyXpSz5C2507E6Sve8hzqhm+J/UPdPKjAc9e8a+4h2wtdGxHmhjI6e8X3tLs4oLE1FU5SM0bAgRJP7b5+M8OoTpmEqldOU9qj0J/SgnI6ea4OoUemo20Dzt18SsvqhDpTV+IoQ0sDdzGpZ8xQWsKfZzROVQ+njg2dcSm8ssGGovx/WrvsopfcQ2PsFvamkkKgNRHoxjfVeOCxCf6N3dJsO9qafYCMo0SzpZBKKVbJ1ZX6/FHKSHvVth9m1X8DrhdNustLqvpT86oT+Ij8wqN9rHZlW0ei5+i6EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kuldSlnsq415uKZxPnLAmQCMTTneUav96+JxPDVRgo=;
 b=iesaaqoGMCIU1fdz7gxYMLwDOb7LeDAkkYEpRgMVT4buM457ZH5/iHpywOa5dP6oLwDExyyXSVeNFPZ6TjssFJAWb5aUwT8gQpbuY8YBvhfZN39nQbDFLAlOF8Yi+xwNe2JAuu+qxEpirPF1hC4I65G0uVmSGKN7xabwsk4S0ZtLckdecUlyJUN1h8/+OyXXLr71avAo5RCR8lhc728ILI4DukR2peJ9f4QND6kLXVZTQIqHfvNAVYi3OSYlleFcGkTc3YdZt0/6v1u1BqGBU0ma8sLudi2TV4k2C9I32Jgkn/qb3kMDZ/HBulHRY7da7u8ci+SFP9dU4R0JnhBHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kuldSlnsq415uKZxPnLAmQCMTTneUav96+JxPDVRgo=;
 b=EMBdSz7z7l7vP2i311TDtWTJS6UJ8O8j76j5rKNEmq7MZc3ieOhq4rqPWAI5/3MyQnklOrJS+a5TGqqd96+MJHG50FUVnC1TCHBvzJGh4nvrLNyeD4GG/gXMU8lEYng+w5t5vpysek+hlEXQ53L+tC4w6V4GFMLr0++1stq7sUJA6qu4MqonLFYRLs/cvcP9rgk2+jtTSUaACeUspHH0yQBKp6HkvfSmnG9ZKGdsa3VYcHzrRZtsbQtBQd/bUXGCas7DwkmK+rUemH0xpFVNZ/3d+S3CkKy5KQ5DxtGdWbxRVunSEZylm8IzsjSzNEMj+LzFhq+SPSzFT7ZaXIYBZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e72632b-43dd-d2c5-f46a-d0c6de6bc81b@suse.com>
Date: Mon, 23 Oct 2023 17:15:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Refactor arm64/domctl.c 'subarch_do_domctl' to avoid unreachable
 break.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <6c118d318d68ea3613d9a0a79d75c0c9@bugseng.com>
 <a63ded4f-09b0-41c8-a9c9-832a12fc9133@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a63ded4f-09b0-41c8-a9c9-832a12fc9133@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d3f413-5601-4715-7a2f-08dbd3dad721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80DVrqSvNdMZu0mfIA8vATjlNsA8uaM6SWK7IKbKg+NM1vunZrMB2MO4cdIbDccQTeO+5TTVs81ePBsD7wO7qyKvzfDKzLjWpf7hI6J0ChbFnL4J4J8S9lDUPlXR5Rk9Q0dJvFx29Pecmke771TvuJeysl7kxTtzWH4pBzMXRX7fQ5Qh944wT49RxRI0HbtNERnwki/pgfC2ufBnFYNzxZ2182A7Jpk9jCtHwvnuhbOZi8joSNrCqw/sSH6qNNY37lbqj6k7Ln/pjpnZBUykfukdzk3vy/exkK/L7Wf30xLHybxoe0FENa1PyRYwzUQqPVT1km6xPUJFw1X0r+sECqN28H9+mPptA+HdT/381itmKsEnrw2u8b094sCwUqhlm9HX74uHgYkGac++IwvC40Dh66rtxxMJZYX2m10IBJqFpl/+M+RaitRjo6u5vCoPahM+6+a3Nain4YuFoI69jmFo/WT2CDKz6O1EQC44pruJLGDhuEaNwp9YUDgGZM3qtSFTe9OyTpPvwJ3Gvp1x56C1rmR1Px1XBBrTQxD68jZ0/+6PmnSAsV2WrWMPszO9CavW6Xz/TcxOaLb45sFzZem5Jg9zZuqHOMrS/nmc+qcnluKQLj8SHBB7Sy1AGJWWQ6k2kNh821jfx2TwD4nbvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(31686004)(8936002)(2906002)(4326008)(36756003)(8676002)(53546011)(26005)(2616005)(38100700002)(86362001)(6506007)(316002)(31696002)(478600001)(6512007)(6486002)(5660300002)(110136005)(41300700001)(66946007)(54906003)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWtiWE9YaFF2bmdMOUNtUjl6UXFtakRwNVBGS09NL2hwaWtpaEJ2eWdrYXZN?=
 =?utf-8?B?eTlaMytWMDhxNHVwMXB5K1k1ZzZxTDR1QlpITSt3eTlRQldHWEQyUUw2VWk0?=
 =?utf-8?B?Zjlnd094ZWZjc1ZQY2RCOXZpZDRnUTVtejdCNHZxeElRZ3k1SVZ1cVFqQUZC?=
 =?utf-8?B?bnZBOFhSYk0vbFZTcnhIeUx3aDE0Z2lnM0lzdExjOTlvNTFNODgvMW5UbDZH?=
 =?utf-8?B?ZVgxckUxQjJpTzA1WWJUeWk0NlVtczdDb09ZYkkwd1Y5VUxub3ZGczg4YzBR?=
 =?utf-8?B?ZDFHajZLU3RRZ3JnWllqUVNhSTdjQUJTV2FmUGhoRTF5RCs1N2VucjRIaXN4?=
 =?utf-8?B?Rk9zWVl1ek1MN21YdG9PRmZUKzFWc2VVNW1XWXhzOUZXNlZDdmhxTjE3L2lo?=
 =?utf-8?B?Z203dFJ3bHp3Q1c5U1duT2NBRy9zbUlGSHBPUjhWc1RBRk9Gem81T2o5S2Fv?=
 =?utf-8?B?Zi9Mek12Y3ZGdDdXVloxM0RUNDMyMi9VN3BrcnUrZEloUElsQ0N0eGt3SVlx?=
 =?utf-8?B?R2NYNFlMM0tTcUhTTDhLaWh1L2xvU21mSEpXaEtmRFl6Q3BLZ1pCeFBjSzRr?=
 =?utf-8?B?TU9kbUpybzJNZDd6cFdNak9zZStyUWVLZDZTZE5hUm1NcERzUXhBVFlFaW1O?=
 =?utf-8?B?bzd4WnZUbitDUkgrQXBVT2Z2TXNoVUhJVUxWQWRoR2ZrS0ljdFhodU5lZ1lP?=
 =?utf-8?B?RUdQVmRtWmp2WllXQ1BzdFpiVGRMdmNvWlE4NUlNQjZGS1dSR2g3bmo1aXVx?=
 =?utf-8?B?Z3M2Y2NTclorU3lKNWRvT2d1cmxOME81TlByMmtZYmFRZzRSY1B3cHZLbXFt?=
 =?utf-8?B?SXdjNkNpTldqeUgzRE9zNE9hdVJ3THJqZ2NaS0N6S09jUkt5bUJXOVNmNmJs?=
 =?utf-8?B?ak1RL3FMNngxRkd4YytDMkoyMEd0ZnVmTm93TE1HRnNDcisramtxVi90Z0lH?=
 =?utf-8?B?Mlh1MWJnb1JNckNNbjdXeTRVNDEwM2tOMHJtdFcwUStLQU5STU1BNk5XMjZv?=
 =?utf-8?B?NUpXMU00R1lqd0FTZUZMNkkzdFNESWF3a1hEcFhnUWJ0TWNPN002QkpWaUhC?=
 =?utf-8?B?QnJ5MWVGZ3lLZStHbHhFbUQ5THJwelV3Q1QwblRJclBvenhEdzNTMVdZc3g3?=
 =?utf-8?B?bnpHU2FPb0xYdTIzQS9ja0dnTUU2dVBENE5XSmFIdTQ1Y2ZubHFvL1c5NUQz?=
 =?utf-8?B?cmtnck1NWmswNjdaL3dpeFRVZEFrUkg3Y1dtS3hOT0x5cWlsOEQrS3Q4QWt0?=
 =?utf-8?B?N2lFc0xJdVFZakhIczczWnJlVElZWnZNQ2lQdDIwVnpNNHlsbW9kTVJkRm5R?=
 =?utf-8?B?a0lMSHk5Mm14b3N0ajJTMGVSUVIyUGU5L3JKbXhxWUFZUWZvRmxNMkFVeXZn?=
 =?utf-8?B?RkE2b1RBWXlkaVI2WXZCSmtSTHZzNHlZSDBJL1dobzJ0YlRYbWJETnJ4aXR4?=
 =?utf-8?B?T0NWclYwYVFwQ2dZRkloUldFaEdJd0R4M3FvZmNFd2lxaTcrWngxTG0vVTN3?=
 =?utf-8?B?WE55dzZ2bzhDSDBHek1LVkt0OG1qSlFZMkVMM3UxT3dzTUwrSkhKMjNvbkQr?=
 =?utf-8?B?SVhYV0lYK0ZFWXBEcWpjcnhiMGw4Q2p2OS90aC9VcDgrWkN4RTJmSFBOS2Iz?=
 =?utf-8?B?Nml4eWVZMm1MRVVrMmpBdGM3UzUzTVdYVWVodlkzZUxEM2NqYytTbEsweFMv?=
 =?utf-8?B?R0NXV1F5UVZhZVBhU0NIcmhWR2JTMUZ3V0xDVmhuTzhtVGZKeUljQS84RXJi?=
 =?utf-8?B?ZGs4ZFJMMmpoaUdlcGZOeDZwNVN2bE5idzdGRFpQR09UTi9VQk9ENzVqK1J0?=
 =?utf-8?B?bXU2MUE1eEJ1VE5JZW1vdklGT2p1blg1NVQzak9oUWhuYmt2QlhTUXJwM3Ir?=
 =?utf-8?B?Z2ZTRUtVY29pMkpxQ3FKRE9wSElQTUdOVnlBWTdBNEQ0L05IS3pIWnppRnJv?=
 =?utf-8?B?anVjNnBjeExNdzVPRjUwYklrMXZHTnZQczUzNDhXcGQzbzBjMFZ3Vy9pQ2VR?=
 =?utf-8?B?Mm9zbU5NR2FlZTh1LzQ2WEcxZlA3U2dwQzFyN1I4YjJkNHFHNllPZzc1Ykd3?=
 =?utf-8?B?Y3RVLzFpdzVCWVRETU5sZWxwZ2dOeGpHdjZwSWhCYWNwekR1ald5bDN3ajlx?=
 =?utf-8?Q?storvi+7UXuk9eKOrnXOMwlvE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d3f413-5601-4715-7a2f-08dbd3dad721
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 15:15:07.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0bOnrpKngkj/Dyz2mTGLvwn+PG6SdwxfCqb2gbwvZsGiwon44olTRfVqr4WtvHqgCW/wr8v18qfyvcAtxKXdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7186

On 23.10.2023 17:00, Julien Grall wrote:
> 
> 
> On 23/10/2023 15:51, Nicola Vetrini wrote:
>> Hi,
> 
> Hi Nicola,
> 
>> while taking care of some patches regarding MISRA C Rule 2.1 (code 
>> shouldn't be unreachable), I
>> came across this function:
>>
>> long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>> {
>>      switch ( domctl->cmd )
>>      {
>>      case XEN_DOMCTL_set_address_size:
>>          switch ( domctl->u.address_size.size )
>>          {
>>          case 32:
>>              if ( !cpu_has_el1_32 )
>>                  return -EINVAL;
>>              /* SVE is not supported for 32 bit domain */
>>              if ( is_sve_domain(d) )
>>                  return -EINVAL;
>>              return switch_mode(d, DOMAIN_32BIT);
>>          case 64:
>>              return switch_mode(d, DOMAIN_64BIT);
>>          default:
>>              return -EINVAL;
>>          }
>>          break;
>>
>>      default:
>>          return -ENOSYS;
>>      }
>> }
>>
>> here the break after the innermost switch is clearly unreachable, but 
>> it's also guarding a possible fallthrough.
>> I can see a couple of solutions to this:
>>
>> - mark the part after the switch unreachable;
>> - introduce a variable 'long rc' to store the return value, and 
>> consequently rework the control flow of all the switches
>>    (e.g. rc = -EINVAL and similar);
>> - remove the break, but I consider this a risky move, unless -ENOSYS 
>> would be an ok value to be returned if some case
>>    from the switch above does not have a return statement.
> 
> - move the nested switch in a separate function, so the code in 
> subarch_do_domctl() can be replaced with:
> 
> return set_address_size(...);

But that would help only if inside the new function you still re-
layout the switch() (or replace it by, say, if/else-if/else),
wouldn't it?

Jan

