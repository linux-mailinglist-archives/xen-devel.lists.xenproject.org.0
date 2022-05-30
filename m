Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4225385D9
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 18:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338684.563488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhvZ-0001LS-06; Mon, 30 May 2022 16:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338684.563488; Mon, 30 May 2022 16:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhvY-0001Ia-Sl; Mon, 30 May 2022 16:07:32 +0000
Received: by outflank-mailman (input) for mailman id 338684;
 Mon, 30 May 2022 16:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvhvW-0001IU-SX
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 16:07:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9abb3eea-e032-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 18:07:29 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-46-QtvCEhp3MAabW-aO7XH-Dw-1; Mon, 30 May 2022 18:07:27 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6327.eurprd04.prod.outlook.com (2603:10a6:20b:73::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 16:07:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:07:26 +0000
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
X-Inumbo-ID: 9abb3eea-e032-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653926849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CRrXU6hBOHrwo6HUFdMLk90F7DGjnBpQQa+q6a6InA=;
	b=IUX09qEJ94HVOCqx528zfGWF/rcz1x8mxrMjmTjoThScIoAv9LMyfshHxBTF6xu/6NueL/
	Q2mF2588FJ0VVbhvrJNbE9npMjzI3NP6A0Ls2kpidy5cFnzZZn01csO8+N6wbVSHuOhUlr
	7/GGGUKz9yE2NBnjb+zD/u+EAgTRA94=
X-MC-Unique: QtvCEhp3MAabW-aO7XH-Dw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhP/M9nTw2hG0oDnESPLD+ZOoV9ZvQJRR0T0K3aP1MfNdt4+haUsP05PvJbuOrFtc3eUcuAh5AURlNgLmz9mbZpmHjie9TvaHbHjKj1igz4jSwgqaMiGGQryS1RsxzQAXBkyCcZmnZioImINH5V2MTr7ZJFwmHhaWt5djzmluvPRZgJ4ruuf6ULIOn7Q/jaRrOs46LulwqbZ9AwNz5Lc0ydi8LXo0SdxlhyroVRrvW0JyubdY9S2AJha/8S28cx1WpmvJiEHgY09jCsQ3bzaumGskSHmCDY9LvGx2vS48wHaJkBm6t0ZKjKW4kXU7TLTeKPLqe+LrekAgRWTqyMsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jP3OldByQNgi3aLknkPv0jNYUP6XcA/mWBkKrAJ6ZNs=;
 b=T9qRFCWvSVVETkYlagYRo7qLzQxE1hzbL4YmUubHFYF6qMi9yKdqHJwHyx9w4Wde3kRXgBqeOoGN38C2vvFQ04frBFQqIpLJ3FLkI00HCo238ds1cO0I01DJy2O/dbIBElWibWbQsPJGKbLpFC1wWJiqn6MisDokX8/nfwe7W7R9V+Rm3KMryONGAQ48f5oyJYBL8uz8B6fTsRBqBOXobmaefkIMW/Pz6/hzEZFTVYXWraA9WbYhG4hRGQmZgEdX1gc0+F5jp75GtaRgaVLVBChsuJJv/FuDsBB7ZqL3XhRTYjJmsUS2vF2+IvpEbqcJcX9QxUucNhLGwiSTTmJyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21cb8b91-3d7f-5490-ea8d-38ab18cf2dcc@suse.com>
Date: Mon, 30 May 2022 18:07:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] x86: harden use of calc_ler_msr()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b0fa2f54-e7a2-67c7-e611-69abdbb6829d@suse.com>
 <YpTpjOnY48UNlIe6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpTpjOnY48UNlIe6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee43f3cd-dda9-4103-c8fb-08da42567cb5
X-MS-TrafficTypeDiagnostic: AM6PR04MB6327:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6327AD4A1A7C12424225B9B9B3DD9@AM6PR04MB6327.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sfxDXSM2sgL4WVtByw5ez4f3jAAZUCedp7ipej0KK47gnbSul8SUJZ5pzr/iJV1eLGuDruxDuiVxSDG2okov5fT+CSCeegUJOpQ2v0i3JcjHX0SKlRCIE/WKrD5Pt6viea9w11VCWLXCneIPfJWxG67joGiDQ7c+fMj5mdi1nG20lScbr3k2QRSxJw1IJEtcr5IwOee9m4YIQmcOy6CUsMaz3MBdvbNDGToYigKjHzLTW+hPwRH4fkQAB2VQhbLVaaQtJorUVqt9bsKqRlnjID4P2GBLN7aJWzP2IsiEGegQ7l4L1+GHz/hz7QnlUBuc7qfB1ho7RQnPwp4qxg+PWPNWgw5lwwZEnkO86ODbD67INj4uAdoMNepoAv1QScCt84inP46U1SPIbf4zKtrZDr/92qF0MQsONP+iT/kqPsJQ5ECKft/SE/qtRWM8YbChngkvj4elpScRDzOn19gRr6mYY7arIuYyXVXF+LwCXoDeVhMEGUutdQBnbe3IQh1jGSUtG5EuxNIg3deV9/+NBJoYJFP5dU/Jw1C9M6PwuxfdoEubFmbcwEEM0n8jz/BgW5zQw8DJoDoVO13cReGy7UboC9L7JuXDUm/RgLpp/4e0i1iuDpXpbuYqhSDTUQAPOOxAX1h7jW9RH9Q/NTlT3XeqrhhB8ybmGqMorukMeLJCNEaW1PIwjOJO+aG+p7je3++OhGtk5F3u1VKCvgZer56f66kSQ10QVE1SWnDLA8hk5bQWBsqW9tXfVhJk+zbktPoQ7v3vhq6eVtKtjnZ0Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(6486002)(53546011)(66946007)(8936002)(6506007)(86362001)(31696002)(26005)(6512007)(6666004)(2906002)(66556008)(38100700002)(2616005)(186003)(83380400001)(31686004)(54906003)(36756003)(6916009)(8676002)(316002)(4326008)(66476007)(354624002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y4vJa1Ffohwc5JssJXa71J+fWf6A2FM+ptfsZonkzncCdQ5WoYqTNkFTH/Ke?=
 =?us-ascii?Q?T2oXzFYn5QOT0l3XNnxemwsrm4ba1QpXkR/MhCyFP7FfmbKDtu/+7p/OGeb7?=
 =?us-ascii?Q?i4hXztyfAE0jc1791I+zkcSHo09MvhqSHfG+G7ccD/tiG/yCD5MCoR+WCfVE?=
 =?us-ascii?Q?uP+9YwAQ0JzB5JALv9fVMkQx9Y+32Ma+szJDjIWX1ZBnjR2mwyvwNX07plpA?=
 =?us-ascii?Q?6x8BLTuPzjvcMyYuWriJN+M4SBbFurD3QbG7mDt2EjF7AtixiLGOUCQ/ACei?=
 =?us-ascii?Q?2WLMw//LxmSi2DuDC3CXGGXCJ6WcJVRdVbFTjOpMhVS9ZXMcvL4t+fA0/jyU?=
 =?us-ascii?Q?j8PI2pluJYyO/8KRPhr7bhXC94WgPyQAfuXRVzsWIuEUY0IxLI2iLHZ9/YcN?=
 =?us-ascii?Q?Ldq+TJN9GTIfjPV634Kgx/pukdmWLq3PDCcqSlBVa/i3ZIHlcPYa2fGAQ1cS?=
 =?us-ascii?Q?ns9naHARM8/o81m02DjX9JmvjoZUZ0or0cuqAjgtjuvqWfHiJdDliRTu0oSp?=
 =?us-ascii?Q?uOiu2G701U6mc/GAlhvkLKxAEGOuoiTj0jutOhS2j7VvkFpkv/2XR0Shnq2t?=
 =?us-ascii?Q?r87U7sa43rVEehZ6qlEZJPZAYMmDLlgfQnfiFQZGVBHIQ2CtkjLPxGShgQJP?=
 =?us-ascii?Q?DOgsILtB9F+oj3l1bcRj+Ap6ncrbdJa68O7PwOlWE5WjZliB/1k+9nruPN/J?=
 =?us-ascii?Q?8uDspyzdnNeVi1nSuUbHfCd+l000YvVDXI13TpX0jLHRM2XPrgvJzAPHYo8w?=
 =?us-ascii?Q?aGYE+h81D40eWFhFO4OjmsCyKBJY36IKQtvfOA8/sMxZ4z/11RDY64Y3t5pj?=
 =?us-ascii?Q?xbz4sd6kQTyER1Q87Zg8XLSajQw11RuCjgpnm9E0S0Nxz89wfXxKznlkKhw3?=
 =?us-ascii?Q?9K6JYJ5jOzln8VRYkTE5jJYvUSIbQvbnmGhY58aJRg3o9+nfK9gc62+UIJTL?=
 =?us-ascii?Q?zkXkTbFTi4XgmqoODnKydUxJElTyVWQm6soCN2JUrKQi2Kydi1kCJpS66oiX?=
 =?us-ascii?Q?yGlPwyJoKW7zhmxo0dmfsj6VB3MATNNrv6a+voWbmZNNEeT7yd9x3g0egmhS?=
 =?us-ascii?Q?fC4M2LjSiMnqcZTTsblRCTcfS9Tu+GdPl2Ej8NBrjMt5tStdahilTXrY1luR?=
 =?us-ascii?Q?r7jtnIex4WhyGU1+5TflvlEjNsb/Vw+53UNwonOHic8ZX2OzfFLEBBOPNjdV?=
 =?us-ascii?Q?eZas3xWk2HiT0s7KJQE3MzzU3kbUF0ejICtB3b1C1fUqTT6rz7Mw2JoXK6gk?=
 =?us-ascii?Q?Ynbi2/rUjgVA6bzU4zO/DLIju+o4FuIKB0eGd7eita9knsuEGuAFcCxJgxFL?=
 =?us-ascii?Q?0gc5C3pLHtFL2EHrTgdAn3ZixJGnoHgRSpsgj4ET51kdMKbvKmAvhdms4SH/?=
 =?us-ascii?Q?8iBjn01Vol8tG7beI3U2h57GyY42IGVCJaNSZoBqR1etimeN6y3lQ9pX980l?=
 =?us-ascii?Q?FohNq8vzfH5aXnxx5xvzah3+rJuxkV+Coe5LJIpGCt7Fj/Ndl3gUHoG+MCVA?=
 =?us-ascii?Q?uB4QiKJkfYkWq99uiluRx4IYI23cCoeRZ48pgVWSQ6lD3GK/awP49gE++Bdv?=
 =?us-ascii?Q?tyb34UnU/ve5SFPCt8JyesiI7FjECQIRv8CJSUpb6Paf3XHc/xPxtaY8mOEM?=
 =?us-ascii?Q?13L8JvY4x/xzz3ocUJf4Ia267E9O5FCvpa3yIp4e0FZOz4O9IhvjD2ePm7vH?=
 =?us-ascii?Q?G9yZfA0o8dnuI5uHj8i1j19fHaXbUrN1zW2OR42PPWNJ5z0A70Ro58Nt6ZDX?=
 =?us-ascii?Q?4pjyzPhB/w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee43f3cd-dda9-4103-c8fb-08da42567cb5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:07:26.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUd3jtM2fF4YnAGj+9X5vgjTtS02rbboOFBkum6CFxUbTuxxYJBZtyS3PyyuhYpjsB368nqwPkwkqjtKSUrOPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6327

On 30.05.2022 17:58, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 30, 2022 at 05:48:51PM +0200, Jan Beulich wrote:
>> Avoid calling the function more than once, thus making sure we won't,
>> under any unusual circumstances, attempt to enable XEN_LER late (which
>> can't work, for setup_force_cpu_cap() being __init. In turn this then
>> allows making the function itself __init, too.
>>
>> While fiddling with section attributes in this area, also move the two
>> involved variables to .data.ro_after_init.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -126,11 +126,11 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_p
>>  static int debug_stack_lines =3D 20;
>>  integer_param("debug_stack_lines", debug_stack_lines);
>> =20
>> -static bool opt_ler;
>> +static bool __ro_after_init opt_ler;
>>  boolean_param("ler", opt_ler);
>> =20
>>  /* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
>> -unsigned int __read_mostly ler_msr;
>> +unsigned int __ro_after_init ler_msr;
>> =20
>>  const unsigned int nmi_cpu;
>> =20
>> @@ -2133,7 +2133,7 @@ static void __init set_intr_gate(unsigne
>>      __set_intr_gate(n, 0, addr);
>>  }
>> =20
>> -static unsigned int calc_ler_msr(void)
>> +static unsigned int noinline __init calc_ler_msr(void)
>>  {
>>      switch ( boot_cpu_data.x86_vendor )
>>      {
>> @@ -2171,8 +2171,17 @@ void percpu_traps_init(void)
>>      if ( !opt_ler )
>>          return;
>> =20
>> -    if ( !ler_msr && (ler_msr =3D calc_ler_msr()) )
>> +    if ( !ler_msr )
>> +    {
>> +        ler_msr =3D calc_ler_msr();
>> +        if ( !ler_msr )
>> +        {
>=20
> While doing this rework it might make sense to print some message
> here, like: "LER option requested but no LBR support available" or
> similar IMO.

Hmm, yes, but you look to do so in your series already. Could we
leave things silent here (as it always was) until your adding of
arch-LBR support, and then taking care of both failure conditions
with a single log message? Of course I could add a message here
just for you to then (likely) alter it again ...

> The rest LGTM:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but I'll wait with applying this.

Jan


