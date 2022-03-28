Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71334E9B15
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295500.502879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrGo-0007A5-1i; Mon, 28 Mar 2022 15:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295500.502879; Mon, 28 Mar 2022 15:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrGn-00076v-V0; Mon, 28 Mar 2022 15:27:01 +0000
Received: by outflank-mailman (input) for mailman id 295500;
 Mon, 28 Mar 2022 15:27:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYrGm-00076k-3s
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:27:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 820fe02b-aeab-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 17:26:58 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-VS1GX_z_Pn-JGnQ17h50dA-1; Mon, 28 Mar 2022 17:26:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2365.eurprd04.prod.outlook.com (2603:10a6:800:2a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 15:26:54 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 15:26:54 +0000
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
X-Inumbo-ID: 820fe02b-aeab-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648481218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OD6YrZd3xf+UNQDsOg0UUxYFdjUEFkc0lFiy2Eg/bew=;
	b=PeLoK6mGxtaxjOZD1EbRPXfa1fdeXLF1TkHmtzwI5e5G3lSgEfvI/orZqJ440gPGHAnDA3
	jSuiHiSoqh8IxBRBK/67+L9jIOD0NUr5tZ/Zn3iK7jB5b/JlfOMYUAO+1MenLsNO3HxBxl
	q1ywOcuVvSSXdfqmNSeX+sOiQ+tzDhg=
X-MC-Unique: VS1GX_z_Pn-JGnQ17h50dA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KL8p3xkPlRluLzR1Y/6QzF8OGs/zg8Urw/FdcJdZq/EGO++ptPFu3qdu6L1lv+66bsifxs7w+DTvKHU1q1QN+q+n0W+e/VHfOJ79CfSdwXM7dkTyxkbVEPdENzkeOaoQdpc1GOmMGEbx9vRJyOkunRcEn/W5ZJUumDXes5+sDxZCzQfzrzI5WJU9zKqQ4HDBbGNQeDwHmr+lEH0EBiOUxiw5sCsbuZRDSpyhs+RwsnZx1nxLhNsaSdV87S20Sal/nIXzvB0NRL7j1IyWjLbCrhg2s/yulIyG7PY1b8i4wg84rEGcmNHMR5pOXULifR6z2GjBp5SkK5mNZM/F5A5z9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKR7y9OnGypk447IKCrDmq6IHJeppj8YpJA3wSQPChM=;
 b=n8f1Wn3zDn8/PEBXlhljTdYkqKi/lb6zcwLdchJIrO6QYQKjBgccbOh4WYl4uMzNVl5MfzE7odI+Rv90IKlPh5NYSSmMdobLeQWdip23qXnQhHYkDeCHCse7P4dbBEjuZOE1xdsNa8kC/Xuqu10F+c8z5wl/nYMZuxYS63C4Cck1jB/kIqZObdApasl0zKSLbR/yX5Ph58QLic7FdkmoJk3YsC9ZhdtUx+rboy3RYvJVC8T9DDvQ6dMYlMSHHiQGVE4HeI9Yz775cCI2L0D48EZot+oXvOA26VZ817k9ppZDxx94IGDealgTwr93hkVnDTrB0RYki726DKqEcRji0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <025a38a1-b78d-f3d8-899f-365b119201be@suse.com>
Date: Mon, 28 Mar 2022 17:26:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-3-roger.pau@citrix.com>
 <033ec463-f20a-a6d0-d877-51e4f476a316@suse.com>
 <YkHSHj9nlE50F5NB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkHSHj9nlE50F5NB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0049.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcfb4148-ee82-4352-7618-08da10cf6363
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2365:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23658D2E3503EABD37A6CC54B31D9@VI1PR0401MB2365.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mvvlRJ4aNcUUlt5fNG0ZaS6TtWy+RWxB3k2X+6dlfYcnWoJWGTfKlRkD0QyLCYDD+uW9mBsxeYApU91SUnJZuF5dwHtR7jRREqzysEU79qbA14UaKNB07IgxmUGYd4WYmrQfLKSqV2+emoc17rmndkHvtzeK5KvsSw8Wj6Xpnixs7JveyPpV9VDDy4bs3m3YCU9TW/xQ5syxtTrHoFecsUPmNEHHwff2y9CawnDy7hneLkduRh/jb7h0Y9uh6K0VYVG7m/DozU6Jf/Io10I8JB2DQuABPekR24/DHzrLOkptFHviAh3GtsyokOpNfTr7XBt1m9Rv5UQZKMS/HoZNfPFIDJfCjrDcMrrgc0K+5p8fbX8EItoOWSwtTODBQVD2gOK5mU0oUgjAO9hrFu5yJ+GiP7kCrGBnzZP5PUn5z6p6a7qAE+7NeoDopxiuoWOpqFv0yjeYXyGLiqAO6mC5+ndIb6G9FpVm136AkZtay9a4Ot7yGJmfJo6ea97tEgw8nJ1Dh9YIcKImPQrzBjFpu0bBh+cr5tDPFYTFgGxm9eGgGEO8tcJ2dMZqGTGj65FmtgA7o1RTwQdoKOE+22LC52EHiMo/0gypUWwoD+LvJfOk9uAliU+1hTs5nBIYhpn9j3HD32MC+IyIVTozGf6Cpn+Hrbo9OoDht3zpck5XZNJPPDj9sKGuxxN4DjGnb8e3eH7mEP2+KecCG/j2PzBMq9LCC7gDMG9G4QQN9FZJ/sU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(86362001)(53546011)(31696002)(8936002)(26005)(508600001)(186003)(6506007)(4326008)(66476007)(54906003)(36756003)(6512007)(31686004)(83380400001)(6916009)(2906002)(66946007)(8676002)(66556008)(6486002)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WsjG5oi7YXQ+RmSgUqJnTDer0A5CxjbljAMEAiwAwUsZmKKYphgVqj9I8aI0?=
 =?us-ascii?Q?/WJleFfLamT9S35OAtY7zwvlTSRl0S+JCfpCZdcnBb6fI5Hi1Ak5HxNxmikW?=
 =?us-ascii?Q?EjnJuCzWrSugyQnF7gFOhKbEHChZFFFrh8oM99mGTa//B27J00ujXD6MiNE1?=
 =?us-ascii?Q?aBhnSQw+cy3DdUjKlmxgqRjQyoO4OAKDrBzvu8yz86sa73mZFfil+x5CsgEB?=
 =?us-ascii?Q?zuBbRr2rizUhDxXdZdQQbEmeQwVSd0XbyaaVnO5+0idUlhEqpyQIvM80FErv?=
 =?us-ascii?Q?pgz/Ra/VGvh9GUbSeDYNTLX3RaNM5oJdC1MvdUUEjF+XO5mbgtx16rAMn5re?=
 =?us-ascii?Q?zyfO7nC5zYtzFbqKeFTbEZC+cUsPOiGSY03GIf753AZDdXzSWqVLk8cB/6lL?=
 =?us-ascii?Q?AAkoTswPNm2E57cGxB5+361OFsrO8miKGiVuQ0AC7Hkal7NBY9MMbR5kop9p?=
 =?us-ascii?Q?uRXZePQSF44Qi124n4WoyjFnP64r9D2qj/NnRIpsJw6Cm7INUZA/boSHuTp4?=
 =?us-ascii?Q?a4lzgcm6tL0nw/LeHlg34cmhOq52QKPrge37++U6Xy158ttVZzwbJdAiIhYR?=
 =?us-ascii?Q?cy1Zkeydkeh+/BiizZBFyiIgwnyHjCw9Q7YVBDRO3pr1l8NXQjSw5XpKHHqZ?=
 =?us-ascii?Q?v95PuH16dLpADp858QazoU1sjEQcM3otVBcERN7mlBx21LftNJ5mEDYWcH4Q?=
 =?us-ascii?Q?yRA8Otd+r8CxPq1/+9Xudu/E+2aG0vRdu9NOsJ7HbMksi9d7gyD5gUvrHQrW?=
 =?us-ascii?Q?ESiirTQNUZ2gLqEJcph7ONyTD1Aj6M9SMqFPX8UdvL/fddy4sOASW2FkBYOf?=
 =?us-ascii?Q?9rR+zrwOK/cr0HzJJh2FOkUeQkqndnectowvORtaVCa4F5dJykvXfPsM7ojE?=
 =?us-ascii?Q?ZxgqJjRV1g2KPR3yHYdqFEwlCk+PknBugjFrbV/IqkgGahxFP5UYru9bAYGG?=
 =?us-ascii?Q?BrjPu9XjgThZL//HsljAjArA2tVoaio+t77kbRIK1qL1xHzBOY5b8nFVpWIS?=
 =?us-ascii?Q?SaVR/Ha167Rh83xcERGfkBzB4cm2W1WiMut/Nm6ZlClDMVd3jFflYcDLBKGz?=
 =?us-ascii?Q?60twHqlz2r3A9F3ZUhBPOjWazsr5E8bwI27XqO7KBK5uXv5IRRDv+PvRCgol?=
 =?us-ascii?Q?7aQwJ0Vx2iyU9apwIyi05L7Lah/qi3s/wMyrge0in4X4SR0U8vR1bTb0O5CK?=
 =?us-ascii?Q?p4hIEo1Kqs3Ei6C+8Kkroj3TM4QsQ8KUlkok3FgNIU8kZou4XKR8Ccb7Vjfa?=
 =?us-ascii?Q?4prsU9z8pZ7G203Cg6IPNNV8V8/5pIuMgb2Uz45EfJLulb93bj9b5tZZQbiD?=
 =?us-ascii?Q?DNzKgfSp5WbluOPLcrldGkX8d7ms3DWRSViVMFn+EN1yLPc01EKbM08yFCKa?=
 =?us-ascii?Q?IKFsAkKJu9+foNxkoWJG1KAjEdePhP/HUSjD6b1A+hLQn4y5XaOz5+JZq++0?=
 =?us-ascii?Q?ealLnilKG0+sp+66g3iBmoH4cpREhw75xcTtWtRabrWgrY5WdJSMvNwzYTCb?=
 =?us-ascii?Q?CXUKnhljhSmWQKNTAFTIRuTaOaNWtUDIq7kyxEnI8MbewRNQuCgG/bMayRlm?=
 =?us-ascii?Q?+qriGWoPI2vj7J4liQjCrHymRKdTvXt4g3NngvGdIhA/VIvuPPeCf7GyW2V0?=
 =?us-ascii?Q?xHTxZ9vUPF/grlyNbbGaTAioxNVtOQLF1eL/71QJEzQBXGkCTfWwrOT1ewAc?=
 =?us-ascii?Q?yDVB1ZJbPIHtmDyW+5NcmoJ7FbGR9/d8W1OPeBRY5YPsHjv/ec/d2/0XSbHU?=
 =?us-ascii?Q?+yltcRb6hg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfb4148-ee82-4352-7618-08da10cf6363
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 15:26:54.1208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVt5e9K5YBOLPV2FrIlRXAYQZiArKELWTfG56Do78J6GU24cZcYtXYrsYtf9WjdJp+ika9yDFUBK5WdwS7IZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2365

On 28.03.2022 17:19, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 28, 2022 at 04:02:40PM +0200, Jan Beulich wrote:
>> On 15.03.2022 15:18, Roger Pau Monne wrote:
>>> Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
>>> hardware has support for it. This requires adding logic in the
>>> vm{entry,exit} paths for SVM in order to context switch between the
>>> hypervisor value and the guest one. The added handlers for context
>>> switch will also be used for the legacy SSBD support.
>>>
>>> Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
>>> to signal whether VIRT_SPEC_CTRL needs to be handled on guest
>>> vm{entry,exit}.
>>>
>>> Note the change in the handling of VIRT_SSBD in the featureset
>>> description. The change from 's' to 'S' is due to the fact that now if
>>> VIRT_SSBD is exposed by the hardware it can be passed through to HVM
>>> guests.
>>
>> But lower vs upper case mean "(do not) expose by default", not whether
>> underlying hardware exposes the feature. In patch 1 you actually used
>> absence in underlying hardware to justify !, not s.
>=20
> Maybe I'm getting lost with all this !, lower case and upper case
> stuff.
>=20
> Patch 1 uses '!s' to account for:
>  * '!': the feature might be exposed to guests even when not present
>    on the host hardware.
>  * 's': the feature won't be exposed by default.
>=20
> Which I think matches what is implemented in patch 1 where VIRT_SSBD
> is possibly exposed to guest when running on hardware that don't
> necessarily have VIRT_SSBD (ie: because we use AMD_SSBD in order to
> implement VIRT_SSBD).
>=20
> Patch 2 changes the 's' to 'S' because this patch introduces support
> to expose VIRT_SSBD to guests by default when the host (virtual)
> hardware also supports it.

Hmm, so maybe the wording in the description is merely a little
unfortunate.

>>> @@ -610,6 +611,14 @@ static void cf_check svm_cpuid_policy_changed(stru=
ct vcpu *v)
>>>      svm_intercept_msr(v, MSR_SPEC_CTRL,
>>>                        cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCE=
PT_RW);
>>> =20
>>> +    /*
>>> +     * Give access to MSR_VIRT_SPEC_CTRL if the guest has been told ab=
out it
>>> +     * and the hardware implements it.
>>> +     */
>>> +    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
>>> +                      cp->extd.virt_ssbd && cpu_has_virt_ssbd ?
>>
>> Despite giving the guest direct access guest_{rd,wr}msr() can be hit
>> for such guests. Don't you need to update what patch 1 added there?
>=20
> Indeed, I should add the chunk that's added in the next patch.
>=20
>> Also, is there a reason the qualifier here is not in sync with ...
>>
>>> @@ -3105,6 +3114,36 @@ void svm_vmexit_handler(struct cpu_user_regs *re=
gs)
>>>      vmcb_set_vintr(vmcb, intr);
>>>  }
>>> =20
>>> +/* Called with GIF=3D0. */
>>> +void vmexit_virt_spec_ctrl(void)
>>> +{
>>> +    unsigned int val =3D opt_ssbd ? SPEC_CTRL_SSBD : 0;
>>> +
>>> +    if ( cpu_has_virt_ssbd )
>>
>> ... this one? Since the patching is keyed to VIRT_SC_MSR_HVM, which in
>> turn is enabled only when cpu_has_virt_ssbd, it would seem to me that
>> if any asymmetry was okay here, then using cp->extd.virt_ssbd without
>> cpu_has_virt_ssbd.
>=20
> Using just cp->extd.virt_ssbd will be wrong when next patch also
> introduces support for exposing VIRT_SSBD by setting SSBD using the
> non-architectural method.

Well, if the next patch needs to make adjustments here, then that's
fine but different from what's needed at this point. However, ...

> We need to context switch just based on cpu_has_virt_ssbd because the
> running guest might not get VIRT_SSBD offered (cp->extd.virt_ssbd =3D=3D
> false) but Xen might be using SSBD itself so it needs to context
> switch in order to activate it. Ie: if !cp->extd.virt_ssbd then the
> guest will always run with SSBD disabled, but Xen might not.

... yes, I see.

> Hope all this makes sense,

It does, and ...

> I find it quite complex due to all the interactions.

... yes, I definitely agree.

Jan


