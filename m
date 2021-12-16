Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE9E477339
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 14:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247958.427632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqsy-00041M-Li; Thu, 16 Dec 2021 13:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247958.427632; Thu, 16 Dec 2021 13:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqsy-0003zF-G2; Thu, 16 Dec 2021 13:33:28 +0000
Received: by outflank-mailman (input) for mailman id 247958;
 Thu, 16 Dec 2021 13:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxqsw-0003z9-HB
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 13:33:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be976df2-5e74-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 14:33:25 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-hMoLfpgEPcKG0w5PWC5bBA-1; Thu, 16 Dec 2021 14:33:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 13:33:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 13:33:21 +0000
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
X-Inumbo-ID: be976df2-5e74-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639661604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyY3YTRTq9k9vYPfUizzSfU0OK46V7J0vRZxKOr2WwU=;
	b=jCp2whlbhb6KQbEd0gvdWsTwGuDBg7HpZRLKGzE4nQd7kZNq+1rPflnJX/SaRw9+GKRga8
	Xd5PluOsRXErRVdQtEf0UzUsCwVOkl6pwy4Vh+74huOFxad8mgFjbbddoEzmm3mNQml/HQ
	y08m+VvLYDtgW0plSbggJNmBvxUX93Q=
X-MC-Unique: hMoLfpgEPcKG0w5PWC5bBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOAm/RkZMg5O8gyjDGXmZx6quz0SAt6cJ/RPG46thzNlUJLoVu1vlpr2oLlj/lH+w8PiPou1ZPH1I2lihWDQFyiKFhxaTlf7miP3EiHjhlO/Ym/onhsiuIWL2HAY64q89bmjmXLIZ6n3RVEsiRzE2wmTC+ecREbgOGsZ+DwaB3C1z7Mq1evDO2uABiVMSXcptdvS80mjkoDeRMN3QluxKwOnNcy6ktwkNtdYmMQ1KlH4e8ztAyOo7Kj4VonEf659vJuACXdJygXDSUzLp17VC9RHGxGYYLfMVIoWJazLCOsq1mfCgWn2BlQShPXDdv9bKS+pvCreOAO3mRJReHC/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f++dYPPioHlXlt3NfMV6kobxpdWr5FyNTo0G7BlRj5M=;
 b=X6FL4DwD2JpXUqh1h4EBT56aLzaTdiERMbUjRa8S0SO8mRFlLMhN0FEo3saDPmdJSr3DdNmi9wAAtjWTrFfnl3OH6DXwLiKtZmxHoQv4Q8Dr7x8zSEbGzLa3Js2ZPBmSMn7Gu0Ba14RN09zYi8XTiSYdGT1pPjgZTgtw9wFL+bajtsdZPM0vodxK1TYV6H1LfhkfkhvqoGWc2/GMp8FoPyasqhvIy52eTX7jhT8uFfjt2Ei6JvMv2yAfzEvfitYrrD7dIYaVVRVzCf+WfnkG6+2DI6wIsy3yCnLEALRZaNlQRY9TB8QhSEebfuYgOcvZ2zSQrAVqOa1nR5ptSqt43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
Date: Thu, 16 Dec 2021 14:33:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d95d627-fad1-4ac3-dc3f-08d9c098a0dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848DEA05A7FDDD43B9D0CE3B3779@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PNP5/ocs9/LjcR2VJKTF+6SMkavNWosVyjOsCXFsDUu8VDIm5r/3qK4ZUKCz5knbDzSSY7wk3iuin5OLKyUFjYjLfFSkUOsB4jzrEGcMqFAHZx/je1TGvCr58eWc4Lp2j1q6s2n5v76QP+h3jbPoDfWvATDmdnGrQeCGOOpDeYY15npXBAMyRnuDWdx8WzTaJFAqIbaEvrll+KzCnVOypK+b0I+Vd3eINCapgxgi6Zj7uwYMiqQhrJq2l8e1vY4SkPcqIvBWCqF8H2ctAPCytkUwr/aqv1o69QW/mVyLA2OrWZX33xGN/7ss2gN2l4mwWFNjJgIt6t/YVOaZfHLoxgjak5qR3tGDm41Y3RS8lE7LQtB5WXbKjv4ci1uOAnLqmGxyV39b2fXMYAg8N8k9XQokrGa8P5ZWkS0/HVGxi198dhLBmqu3HAbCwOwEBpwqxqZj30aPh3rQJ9BPzgCUhCRcRj3h/6ezlgWugQ+49cLtqTNBEnNCMEHRkuO8wjg4je8DVUx45ZfVO8zjKlYJEY8maK5qSeCjMaed8ZjpFng7+2RxPLX0trkmC1xogp2qYixL54GckSqzZ6vPp7QnhIGWwsqYeIUWBzWdYFgiytUohdIJ2HUlcAqxo+1JdX3IwgLTuoMFzTUV1jnobFdO/Zo3jiZiPIrEYiRunUo+/ppWDw5J5iWj+ThcZCP6ysAe9/63Q/16nxJ/JqeROPQ8GP9b8g7rxHj2DrpGNPqiJ70=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(4326008)(36756003)(31696002)(6916009)(508600001)(2906002)(38100700002)(6486002)(26005)(2616005)(31686004)(66476007)(66556008)(66946007)(54906003)(83380400001)(6512007)(53546011)(316002)(86362001)(8676002)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdCLOHSs5T8dPT6qFhwAfaEXJXxa9Qu4MbKpJ/R4du05mp5CQoUpsv/ubRQi?=
 =?us-ascii?Q?hcqg4Xj3vCkNA4BZRllkI1uycjHeESdfR1xiR3FM2+atjj561C2V9IVRbCdT?=
 =?us-ascii?Q?gU2xzr1+anAPjrwdKgstlE/in9PaUdXQD1EYFmYKUE4+I8LtpTEM+Q0mfZn8?=
 =?us-ascii?Q?VnAkWnGWMlUrECkuwG2KoaAGee9CJ3ptsBLPD6z0Y1Zhw4XCHj05FLsbF/+P?=
 =?us-ascii?Q?RGNBqEOTXwEPF08W2m4tuR2c9uSmUxDmABHc3D/+LpgY/7hDl8Uhm+L00/UC?=
 =?us-ascii?Q?D6a1xAVO0wq+2vyq1VuzCHj85SjUh/3hT0Snaa3NQEJJD/JkRzUVlgO+gF0f?=
 =?us-ascii?Q?NyQ34rmY5qfeE8gYtkXaFhAz+5yOxd+C7cVVmwFZucj3mIOm7zMVQkGiUrMm?=
 =?us-ascii?Q?ZzsnDdb1Mb0gqxqexBkHhPLXAoqmNYAeGFmAHnLXjP/YR8cVUffY4n5/wydR?=
 =?us-ascii?Q?opPIKHidLNlEmmkJN6cWzo3dt7HdF+6xKknbN02ZvE2PAKpT0RWwhpkhd8Nh?=
 =?us-ascii?Q?HB6rSdgbzxi/fU7vdm6NtWjD7wQKJJN1CoTB/YZC7ObyRg86D0ovyAu+F42f?=
 =?us-ascii?Q?zxwD6waf/dLMvuUzOj8TWKiaYM4zgXdXES0w2KzQmSSV5RzKVx2V79FfGQMn?=
 =?us-ascii?Q?4UySaGVSOY5J5/H1lDOOdsoBO0/Yn87C4V6c68nayz/ejQf9HMFkKP+Vt7bO?=
 =?us-ascii?Q?PbbQYC7Bu0c8vvSk/AycFU9AfQuyHofniH74AORVxkqD/V1HbPRGOO6fNxIR?=
 =?us-ascii?Q?jsgtjYIy3WKr1w0AL17kxGRdIrN9zp+IIUJD+2cd94pazdXEOsrF5u8mu/7K?=
 =?us-ascii?Q?KMimW0DbjP4b8mRtFsBeRBwUmb0u42dFqyJZ9TzTGGyJ0qxS2YAolVOiymrM?=
 =?us-ascii?Q?4QOHxZaNRJQfci/udunRN1vyMQUn0LUZyJeP2ya2coauexogZ2Hbulc/Es71?=
 =?us-ascii?Q?7esUTaeUdLbJc8Gu+piCaxtfXBcp77yEh78yhRAKCVo0Vya79vpKy3R8+WPC?=
 =?us-ascii?Q?ZjvcJA48w3mhK6yb32DTR9JbbJ+AObBuDmT5B32FFrhS7I5SdtSNWU5xctur?=
 =?us-ascii?Q?qfMH7J2X5JxcoEzoZE8zLD4Pv4QwuGBytDXEc2bmMV1lgiE9Ck9UACJlWVkU?=
 =?us-ascii?Q?5JfaMZjX4hXtqFD/nSbWH2tFIEoNsWCnCpJ2EMr3plrrh1QW/wNw+jY3S5VG?=
 =?us-ascii?Q?Tlv3ycYKz9TrhXiGLGfOo6yBmgVKLnXwIrujzT4CTcJNhl9p1fM28a8/zUxR?=
 =?us-ascii?Q?KRdldMRmKWXzcjn0w/kVsXZc+ioVPdvWZ4nuSBSk41YQ41VOzwLEcuZU+12m?=
 =?us-ascii?Q?YXrRtJ9KB7H2xffWcmh0ajRhBrXdwO4NuHMkGo0xOwC/e7COV0zDG/5Q1NWL?=
 =?us-ascii?Q?FYY0wPO2Ues+auckXd1FzRgIVKCyEXUY8zwuE3LYTdQRYkdAINq+ctftYcnX?=
 =?us-ascii?Q?ibl+g4ooujTVs9zNJULiyUCHpZcNiqdESQSz1zNUaKw2SegE4ecGfoE5EKNo?=
 =?us-ascii?Q?NFhZX39keXY7rc2IBO15E18x/O5FbJKXxfP/E+5GQECi8I3oxrkWoxutqm0A?=
 =?us-ascii?Q?R3sX2JQ15jS8K2J30YSQCHWbBNHwJQucxclG5bo10Xb4yvFD/yPSoNq0iYr4?=
 =?us-ascii?Q?Gyr5iGFRKevp7ud/d4k+Q+E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d95d627-fad1-4ac3-dc3f-08d9c098a0dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:33:21.7655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQfCEiFaZ54xBsKBQbsBCn7MDoqkJbdPOfuSKzyr9F0O7I14H5zYm0hJcm1T1EH/tm1jI6MCKoQKmAVowwGBVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 16.12.2021 12:54, Andrew Cooper wrote:
> On 13/12/2021 15:12, Jan Beulich wrote:
>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>> the consistency check in check_lock() for the p2m lock. To do so in
>> spurious_interrupt() requires adding reentrancy protection / handling
>> there.
>>
>> Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_stat=
e()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The obvious (but imo undesirable) alternative is to suppress the call to
>> show_hvm_stack() when interrupts are disabled.
>=20
> show_execution_state() need to work in any context including the #DF
> handler,

Why? There's no show_execution_state() on that path.

> and
>=20
> =C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0 * Stop interleaving prevention: The necessary P2=
M lookups
> =C2=A0=C2=A0=C2=A0=C2=A0 * involve locking, which has to occur with IRQs =
enabled.
> =C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0 console_unlock_recursive_irqrestore(flags);
> =C2=A0=C2=A0 =C2=A0
> =C2=A0=C2=A0=C2=A0 show_hvm_stack(curr, regs);
>=20
> is looking distinctly dodgy...

Well, yes, it does. If you have any better idea ...

> For these kinds of purposes, it ought to be entirely fine to do a
> lockless pagewalk of the p2m, because we have to maintain atomicity of
> updates vs the hardware pagewalk anyway.=C2=A0 We do not care about any s=
ide
> effects if the target isn't a RAM page.
>=20
> That ought to remove any IRQ problems from the equation.

First - how do you suggest to signal to the page walk logic that there
should be no lock acquired? And then I don't think there's a direct
relationship here with what we need to guarantee correct hardware page
walk behavior. Unless you mean to suggest that here we want to rely on
either locking or interrupts being off (the latter guaranteeing that
flush IPIs wouldn't complete while we're still doing software walking
here).

Jan


