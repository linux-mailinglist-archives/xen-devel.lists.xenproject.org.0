Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8EA512D24
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316055.534765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyiw-00084k-4B; Thu, 28 Apr 2022 07:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316055.534765; Thu, 28 Apr 2022 07:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyiw-00081v-19; Thu, 28 Apr 2022 07:38:02 +0000
Received: by outflank-mailman (input) for mailman id 316055;
 Thu, 28 Apr 2022 07:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njyiu-00081p-EZ
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:38:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20546926-c6c6-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 09:37:59 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-0a2SitAAMBazZ3E3fFe7GA-1; Thu, 28 Apr 2022 09:37:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8631.eurprd04.prod.outlook.com (2603:10a6:10:2de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 07:37:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 07:37:56 +0000
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
X-Inumbo-ID: 20546926-c6c6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651131478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpyXo+XNIcGRF8MJRnRZ2D7gULwPWD7uHEaNlOZyadc=;
	b=Xf7/jJW9cRhx0IsUzQbhF2SseB3ywOlE6excNgzAmFUs8APTVwyvCzBciY6avzyTYEQtbf
	j8TMJ+bVy0c9AFc6H32lwlpzPldGbLej66h2q6/KV87RNtpHl5kQTKulFUkP6fa7N/rE2F
	7UtmQQ/SuLsGhjXOLtapLF8PLJdptp0=
X-MC-Unique: 0a2SitAAMBazZ3E3fFe7GA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OERzuoFNYABhIV7SUm9xyJu0qrJSOJEFcHGg++hKM5IPIRpM3PGL6FZ6mTEN/oT8/H/dqnnzwsqaGRx68BRwXhgPIUI1xk+vtL+nePbbKI/usPXlP8GajveIRr4ehoiozGPzLV0QA65hyoSfmbOnHSu1HQ5hMW1LN18ry8/pY6Mag7zUYqJva/5Ul1Is6VWZnm9rHTro2uv/ocmEn+yuZg5SKNi9JjMgkYrA+9y1X5l9v4u6shtJcTMovBc/95pl2bNrDbUFteNx94DK1D8ZVkYHwXSwCTgKoOI3bkOsnwTbJzZmsEnIO8ewuPP/MrgSoqEB3i2QudVngN/KO7593Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FphS4XsfYHTG00AUkSQE2yNVd5XBhlXUgZVS3bwdTR8=;
 b=DoFZ+TLagRtjytAFD+v86GX+642Ztu/2mTdYM1G5darDGoW8VsCsTFgWPMqVStAa/5mdR/xIBTsLm8aIvV2SVHk3ErljFNUweJlimq9igPeY8vgEjvomOwVQiy7ve0xHBf+8te6epsB8IxS7dY0JEQH1jnbvEZluqlek2+wjBoLGSDba8FdTh0cbpH+WdAthaLah8dHju3DaE4kKkA0FTYadsnki5r8ptZJW6CRXlaL6iElyiTccv/xKCe9vEfNNe3Ty0PEhRzCBTBrfcETqDb7zvY9GQid/IQKLBGjoCihvnEnNE9nFvs4VJ7AAEw0HZKQnEoPvNlVBjEY++JV5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aaa32800-bcad-3a7d-34a3-2e51c4ad9aa1@suse.com>
Date: Thu, 28 Apr 2022 09:37:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Regression with CET: [PATCH v1] x86/mm: avoid inadvertently
 degrading a TLB flush to local only
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220419150320.64783-1-dvrabel@cantab.net>
 <6076f458-a56f-448b-2001-6af38b998edb@citrix.com>
 <b5234297-c70c-ffc8-9104-99eb6f5a0e24@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b5234297-c70c-ffc8-9104-99eb6f5a0e24@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0545.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf095346-ad28-4ad3-24fc-08da28ea02c5
X-MS-TrafficTypeDiagnostic: DU2PR04MB8631:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8631ADF7AABA136A4C169DE6B3FD9@DU2PR04MB8631.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2fQl3hXDu509UNAvQPwwiQePDYKfQVwb1ZXhnw/tjqZ0p9meu+uYqUK9FeWQAv1m6RgP/1DiE4Pzqixy1fpwPtPhlW/on5vWBTGA0vQMQHsSgGQ+ViSzI9P4DTRHaIiAyvRc0H0wkASQFBDItdrRIpVsSLYI5BOQMxlDfkOGRxuYgtsZCBdkn/C86HHEXV8KUZ7zHuYmIs9PZ8FG4JAjsmBknJDt1X7TamPwwq1brm5e2b5hqXH7zZM7R0EkpZs11RpuHkMIr2gR0VRpZhvTJWGUBXNwAITgk0RuMBl/Pj0JMEB50PMZ7iNs/EQArHtCpZr2if8bGGWyt2NVb1vHoOHHZABiApycgCkPPbuPT+738PJ/wDs6ieyf8mLx5JyHlsPo/FmLvw0xwXwsjf6r6SqULC4Ul73f/zIw67VsrsstbfoXyIdHpeRS2EB57AXSvykhaab+fWLNKgmDWzZPy4xOOA4BmhUQTmOR7ox9FB33AMlwWB/5uAWUOBWUcyZwfwNaZSKPmrW7puPoNgNVM2G8rALQSxN/iUslhEvK0wLNKEGcd6h9PpZT4O4qtMOZVie9MROwa6OfkEtBq7uapy1dTe0NqPzvZKHDdh9ivTWIzOgaLUJM/jcsgsfleFLtVVJEn/vn69YBukVzjcVa4HNKyEr9jG9cJP+dR5R+67kpLC/Suz/v0DkZGHrjHuUqEDe+SytgiO/QboIQ+suTTQSIBnmNn9CF1CYjASEvKUmZOI3iy6q09HlTzqrsq9yP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(26005)(66946007)(31696002)(31686004)(66556008)(83380400001)(6506007)(53546011)(66476007)(4326008)(8676002)(5660300002)(54906003)(6916009)(86362001)(2906002)(316002)(36756003)(38100700002)(8936002)(186003)(508600001)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gyQKOUuqNHrzYx+JFIi91Yp6eQgANyvRVr+eixcz2ZMGal7CT1hiczZhc8ai?=
 =?us-ascii?Q?24B8t3N4oQhLtdMqdplHgxkqmc44m7n8T9DISsrOnlKrk+rIhIlNb6k1e5h4?=
 =?us-ascii?Q?7mWXDwQco2uxTmxYWRNq9lZH7yKJKAfdnr4/x7Y9UsDG6NtT5rhP89JaP1rN?=
 =?us-ascii?Q?dff00TMQJWCpXGHKPx7Pas3faOUW3yt6e5G57551mQbukZVpUZukGPZvn1x7?=
 =?us-ascii?Q?LTpn7Tfl1HFFGYDETUoArJkmzfd3yNRSaQwvxOaeqEYraWmyS1A2lVHjXlUt?=
 =?us-ascii?Q?CdaeLrjtRNWlUGQyzqR7uWPcAZ3lqCCoQqhQneFB3jrv+LP6MbupkZv6RRfY?=
 =?us-ascii?Q?nhz6ZKTqRhXxU0+b1wxLRIExRSF4RaF4rSb3VrVqMLbvS9C84GwoP4C5gvO2?=
 =?us-ascii?Q?79ahcfP42H+Z9KGrkJSU/yPPejpgGbxbVPmZ56a85B52exfUV4ks4XpgBSRo?=
 =?us-ascii?Q?liI9ohqu156ilBvbth7+225kMGesSA1pdciZFhAUQBVp/OScuRt9I+2hHvef?=
 =?us-ascii?Q?MVEI4hEj+YO67PEV6/Cz6IZ9qWp7rJx5CpHKnG7FagMRkifuW4CkzKe8NzzF?=
 =?us-ascii?Q?D2W2xzw1mKbup5wG+CCHp2Z6wU/mZbjuVZ7bsJ9Ru0Dr6UWS3BzJP2EtT6Er?=
 =?us-ascii?Q?8g+Duw1PVFJvCWA8N5lsckItOt9KlveWjGct2koIr8zkexonJNFh5mEjBKsS?=
 =?us-ascii?Q?/ABFr5HTt5FqLGOHp48Jd9yQMXWc/253jZWQbq2ADa/iiToFeakmOua51Soq?=
 =?us-ascii?Q?5ra0EYJFlPG1THK5qmEuhjQJ2aujOAYLXgGwLGaZmDmXoXvL53+r0Xu6DNxJ?=
 =?us-ascii?Q?kr60ly4/ITN1mWKFmpdRvaKpES3Xnq3TL0z+RdEUukHg8nnDy258Q+7KjotI?=
 =?us-ascii?Q?m2lqO5eJ1NviGKzmOWLb0NGgVtJN1L/bbbDHtzFX47htYMNLrFhkH9YD7n65?=
 =?us-ascii?Q?+A1p4A6PouzNAkCBpVK18nx5YYvbZEjgxsKC9bL6caaxKl/+ZCwE48t1ub8S?=
 =?us-ascii?Q?Wg/LkIXGDoRoRky04eCGm459S2AhMcGWVMfVaPiaKlHE0ob25gdFdWQ3Yr52?=
 =?us-ascii?Q?DQ2zKnWBm+uADqeUzGsocsymLEXx76TKpaAQuidzMRCh80VWT5cRGGOUU2jq?=
 =?us-ascii?Q?YFMhkgTUM5tagnl96YFquI6wjH7BrG30PbwwjeZ/dSQB8daVVEyMNrnxEzk2?=
 =?us-ascii?Q?vwo+Yt1+fQlGtznDq84fHCYgJ38AhwPqBOIjv3+cyQDM9skA1dV0NMOFAvjT?=
 =?us-ascii?Q?HfoSsLORk28YEqWH0zhQUg2nPRG7cR7v3Mco7ETZceJZDxIQJy68LtBn2Om9?=
 =?us-ascii?Q?H2H0B/C15W5MnI9PWtnFgoJrZqRbTv8JAtSIIRYtDQedVo5srqjcmUxudY7s?=
 =?us-ascii?Q?bYA7Mi60Dc2lFLE1v1tNylxg2sIGyZ3CjMaJt/GkwqW0VWe9/t7zZKziNOsX?=
 =?us-ascii?Q?vtKWSzRCGu2rYMgZkivd08E12mAKfMQaUQ9t4L5a86Ox9aAUgU9ueUzFCKzc?=
 =?us-ascii?Q?gR0BJ5I1KIxFb0FiKjZJMtjKuHe5aRyhvvEqvLtXvRcNpcsiKt2AfrUeJo5t?=
 =?us-ascii?Q?bpReGuejHJ1oaCbHSl7XCseCtcz6LfKsvUt8F+zglCjTmsDW9hPND+HQcmA6?=
 =?us-ascii?Q?BvUiYY+Kczc89epDV1SXAHol4/v2JzAYff4VAacl/vXVXqbI9m/JACYwisos?=
 =?us-ascii?Q?4PVxsxfPUqgI5sqwvWAs9tVt9j62btnJmuUQp8iMhVLnZaL2b39vLGC1rRZ4?=
 =?us-ascii?Q?7jHe4D7V6Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf095346-ad28-4ad3-24fc-08da28ea02c5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 07:37:56.2127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0rvHuukeBOMPKvsSbV2m0l4Ws3JSCKD/q8JJ9Lt8Vvj7Cpu0Mhkc/STwk4zwChn0j4SPc6nEpFtO71qkQq4FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8631

On 27.04.2022 20:44, David Vrabel wrote:
>=20
>=20
> On 27/04/2022 19:03, Andrew Cooper wrote:
>> On 19/04/2022 16:03, David Vrabel wrote:
>>> From: David Vrabel <dvrabel@amazon.co.uk>
>>>
>>> If the direct map is incorrectly modified with interrupts disabled,
>>> the required TLB flushes are degraded to flushing the local CPU only.
>>>
>>> This could lead to very hard to diagnose problems as different CPUs wil=
l
>>> end up with different views of memory. Although, no such issues have ye=
t
>>> been identified.
>>>
>>> Change the check in the flush_area() macro to look at system_state
>>> instead. This defers the switch from local to all later in the boot
>>> (see xen/arch/x86/setup.c:__start_xen()). This is fine because
>>> additional PCPUs are not brought up until after the system state is
>>> SYS_STATE_smp_boot.
>>>
>>> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
>>
>> This explodes on CET systems:
>>
>> (XEN) Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
>> (XEN) ----[ Xen-4.17.0-10.24-d=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0 Not ta=
inted ]----
>> (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
>> (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d040345300>] flush_area_mask+0=
x40/0x13e
>> <snip>
>> (XEN) Xen call trace:
>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040345300>] R flush_area_mask+0x40/0x13=
e
>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040338a40>] F modify_xen_mappings+0xc5/=
0x958
>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0404474f9>] F
>> arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0404476cc>] F alternative_branches+0xf/=
0x12
>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040203344>] F __high_start+0x94/0xa0
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
>> (XEN) ****************************************
>> (XEN)
>>
>> We really did want a local-only flush here, because we specifically
>> intended to make self-modifying changes before bringing secondary CPUs u=
p.
>=20
> I think the transition to SYS_STATE_smp_boot system state should be=20
> later. i.e., the last point were only 1 PCPU is guaranteed.

I'm not sure there isn't code which assumes pre-SMP initcalls to happen
in this state already. So it may take addition of yet another state if
no other solution can be found. Additionally, how would you mean to
deal with the PV shim case then, which continues to be running UP quite
a bit further?

Jan


