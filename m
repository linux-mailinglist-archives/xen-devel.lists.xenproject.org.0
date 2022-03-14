Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A34E4D7D94
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 09:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290047.491891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTg0w-0006Kx-UF; Mon, 14 Mar 2022 08:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290047.491891; Mon, 14 Mar 2022 08:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTg0w-0006HS-QQ; Mon, 14 Mar 2022 08:25:14 +0000
Received: by outflank-mailman (input) for mailman id 290047;
 Mon, 14 Mar 2022 08:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTg0v-0006HM-J5
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 08:25:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4487ee75-a370-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 09:25:12 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-Pu4N3Z9iNGKrlqk7nsrPHA-1; Mon, 14 Mar 2022 09:25:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5604.eurprd04.prod.outlook.com (2603:10a6:208:134::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 08:25:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 08:25:09 +0000
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
X-Inumbo-ID: 4487ee75-a370-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647246312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YQTVvli47pDSWgVq9yNlw1cixIGf43PzZyNqo+pTbwo=;
	b=GXirM0XECA+Rwg7OFvv6qvWd3Wh4zZM14h68gc/RswttoDl/uZTwNw6SHgNEELcgdYt/dk
	VUK7bYmO+GpdsENd+BWvfjldSCqeDh8P665cBCUTbWgnrdPmbw5ONbpGfRukY3skV3Ij6M
	guhTbyHnzRybQgmvO+B4x2+j0xVva/4=
X-MC-Unique: Pu4N3Z9iNGKrlqk7nsrPHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUZP/Wgx/A+3QVNe6QQyhg18t2ej4QHLdKAJOHZUvsmBL9ge02/OT0ACC3f5mhkO09pHGRZmshRQn8SEza5p77F1oi+JwgAsh3HOAlR3R+6+ozc0Ze3Au2mNANmhD1VOFAh+/D/+J8VHZqAi0I0Qeqdw7OsoPpOAS9ymWPPm3/wkODxmIliV3dIByk4ZdjqUF3EzINAHWMV/PU58USuVfDNlKMOkALtfVq0yr7twN26EPEXeWHFNWawCcDmrTTrxUt/6pBdSfNi9Qc0L42jmxM4YphjrOeB8OClbgzDR9f/VpxgKHq3yCsHLRE8859OK/BeyuC4ImZGGmUBF5/WGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8HsELeuSl5qSC96BUnbXHlryahWZFIYkzCkhT54+4s=;
 b=MXUnNlXBdgZzOmtOGKKKW/dH8toVPUJ2UQA6QmFlCqLcF4E5/s2wq7xHB1HcTNKsoIv8WjXDqw0PYF1ql1YZqEZcSelFQxHgdZXoehysxZKqYPH21UNzQKUEAR3f4BMkr6x4wgYxbQRa6p2uHIdIGusQcsdb7njqXww3n7x1s8skP03NvlYGyHwB2q3n1ZgtQRPQMyGG9XAE/fEnXu01crEFmpYDdJj9ZYm7bsyXQSZb9oGAZzR+fgoct1o+39H9l62tbbVmc12l54aXgqNn4B33VERcuYUOrMM5PJ5J8w7OnptqJwA7huvdhHabSSB3hQVjrTXI0H/sopbrXLnWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6769525-0bbf-c735-70cd-d5c13ab232c8@suse.com>
Date: Mon, 14 Mar 2022 09:25:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/4] x86/APIC: skip unnecessary parts of
 __setup_APIC_LVTT()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <c679a11a-d2b5-403a-5341-3e00ac91ff45@suse.com>
 <YitXHaekQk1aK1i2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YitXHaekQk1aK1i2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0217.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0659cd5d-3fa8-4832-436c-08da0594270e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5604:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB56043542A965BAEBCFD92AAEB30F9@AM0PR04MB5604.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QOLDciMuc6fQFJ1NLByQ8S++0aorfO7Xj26jO2QYD4ixhy8KTuh3d6inGEDq0LIa3qfaaQrf+O24pfehc4t1eR3wf+U3Lln/l3bETLT98F5pCNCeRAy8VLf1Lmolkx31+bz5cBdpWbpHBzKpxkqse8o4D2orgPFU9r6nXkBDHKkWSYjsyrIAYDYGHGr8k5k7KqfDKM4QrVXFkJXsBPJ61HZGxX8M83yjCTlaQXvTrhMh/TKyXp1HjNqTwNf102juHMvH7v02EUKnj40oGxfk+6KWxdhYbV1opYwg97xOVJwdmxbQMVSVbzaCz9C9B8SHSYChOSiE3qE3JYZSX2kk+nWHMm7+iPWJxaiQQ6ZGPCw317M/4cnqyKt+58+IO28MvI2medd02VvZ/btMW07K2Q8PJWJq3jcqEdS11FbITvsU5rVybJMGCPlczRNWKfs90FbN/Nm95HpChodSD8PtYMhmNU8P/WyMZuHnucnfRz5gfcBa5+AQx4tmIirvsChz9k88BX0WGcz8bDUZCkgvRyQWRBL0ZOtIQf2UoQjzBSUFeW2Wn4UEGzqGij6Xmxwdid2vKPTRanghrgdBwzNFRd2ceUrX0VeSxY2rAqs1VI8O8JA+fcRFcI0fKpti1RN/Ia3G7u6OX2gk753hyo9UAZ66afO8SzrypzhFhNcbOggrJZTuTWgF4Q7+aYinmj166l3PW+4EiZdtEfxohAssOUrYtpF6RRwwzmmo4irnWjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(8936002)(5660300002)(54906003)(316002)(8676002)(4326008)(6486002)(86362001)(66476007)(66556008)(66946007)(26005)(31696002)(186003)(2616005)(6506007)(53546011)(36756003)(2906002)(31686004)(6512007)(38100700002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/04BeAiUKhM4C6ktEMH3dgcHJqKXBTt4TueqoRNPLO/OBIKgQpJ1i1QKCF0I?=
 =?us-ascii?Q?K3ZrTyp4BtV34T63O6cWl9arPwNGZ5kwo0QQP0+S5JQPxvXXmrc5beknifDt?=
 =?us-ascii?Q?Gy3Prxg04kglBbIRwkHIDR9q73xSDdcgrHWRCAfuBrOcYP9Mw3iFL0jci2ex?=
 =?us-ascii?Q?PG5hPt4snkuqqg3+ChfhFlz5F5juutWrNZ+kzBogWgQuwV5b28ZX2w1G9WP2?=
 =?us-ascii?Q?R2yhwOpIkVUUpxBoa02Ps3uVdelBX3y//PVn6fuT3qBS1DXRmtsH2k9WrsAl?=
 =?us-ascii?Q?CKoGCurv0Nm2SAZHpd+QAwzHzaRtjLehCA79Bk1uyPPRERJIo/5fHqnVP3tU?=
 =?us-ascii?Q?pkMIpHC5wIXKCJb7ph1L683SuaDeWHxee3Nszm8illmfxBX/Kvl1aMd9GMnq?=
 =?us-ascii?Q?nAfW3B6OizvGeOQBz2mLT5VFAcMv2LmE6BI5DY6PrcfSNqb33m6zIubN+W+n?=
 =?us-ascii?Q?R6fyAxXf3rvUiFRexCHj0O+prHDBfaLdHpmPVFZ/Xe4umqNQqkgem7SvwNWO?=
 =?us-ascii?Q?7LOHJMB0VUp/Z8zwRqAkGusP3gtqKBqbj7Xp0FIU1HAGqSVjGSd9YfOSpMtA?=
 =?us-ascii?Q?AVvUi+mGtxd3Q/Y/gK4JoXtMUhlAF7y9McdZlaUVNZMaCBg8o0vfmMujm57Z?=
 =?us-ascii?Q?Oln8tc1cF+/5x64BRgQP5AGnJDFlpkeyPf/XnxUilJ5ChqLcWde7+eDv3FRd?=
 =?us-ascii?Q?sR4o+fTxDLdT1O4oJ8lqh0QGjy+VptaMXIk2PbwVr9ClBC3qZbF78JzdSI1z?=
 =?us-ascii?Q?TuGwZ6osTqAxnXcIXHdMzRSgZs7gv94tWEyPx5U0haweodGxMJkcDNmcIK5W?=
 =?us-ascii?Q?3mraaJw/syy0FN8+WsS/sR/gHsE4/xQrZM38tQB0STlYMRqX0HFLlFd8hrOS?=
 =?us-ascii?Q?c1AUxpOai0DBZu24Zkbx9qhkp41BStSt+mFQMfLa8sWfSgwFr/+CcaSaQahR?=
 =?us-ascii?Q?q887q/nibbh0cYCkkQ4/3qhGI0mX3yQaghPyOoGTn0cGlWUk/nIIEowzutm5?=
 =?us-ascii?Q?tpWJ5skEHWBgd5mtgzj8SkVpp+aGE+S71KfdzTH7nb/g3esRpa6f+S+YTUw8?=
 =?us-ascii?Q?mlcRU5hSGLvd94FmVfxEdApP6CXRmKBM5J86uLsgjoWgPMFZD8cOv4dmzNyL?=
 =?us-ascii?Q?tFf0J9pNUBLGIm/Q94dmby2YZw5qadb2SXUlLaOOW0Mz2QP+dJvJlzIhyqZr?=
 =?us-ascii?Q?1FfjeJVR/GJlQwHFr4B8AKJcNzhXM+3KRNlN7EOweM7w9nQY2rjmUp2FjUtB?=
 =?us-ascii?Q?4o3Hjn8R6NMzYxCuLnurHEx6KybT6mtw7GjhLysVZyPHtttdFCih6lPbGLWb?=
 =?us-ascii?Q?Zrzc8/efjdDPgrAGqRJeIqwMEaTqcJzC2L02pwAQMdC1/Yx/+sUEBuLPzFZT?=
 =?us-ascii?Q?vSylR9VUELIIhnt/qn2ZJJm2QMf4EvGR2IivSWoWIDJR7gsOfiR8FNiUz48v?=
 =?us-ascii?Q?msa8l4OXnPYTPhHQCOb6hJN/sJTjrndB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0659cd5d-3fa8-4832-436c-08da0594270e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 08:25:09.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfGCG3mnfwZ7Q8zzslh3Y6kZ6VliBcN/psQxFSYXLtc0IUaYRxX/OYUXIWAqsPl5rZ5bdztMZxpNaj5DgVSF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5604

On 11.03.2022 15:05, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 10:25:31AM +0100, Jan Beulich wrote:
>> In TDT mode there's no point writing TDCR or TMICT, while outside of
>> that mode there's no need for the MFENCE.
>>
>> No change intended to overall functioning.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I've got some comments below, now that the current proposal is bad,
> but I think we could simplify a bit more.

I'm struggling with the sentence; perhaps s/now/not/ was meant?

>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -1059,24 +1059,25 @@ static void __setup_APIC_LVTT(unsigned i
>>  {
>>      unsigned int lvtt_value, tmp_value;
>> =20
>> -    /* NB. Xen uses local APIC timer in one-shot mode. */
>> -    lvtt_value =3D /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
>> -
>>      if ( tdt_enabled )
>>      {
>> -        lvtt_value &=3D (~APIC_TIMER_MODE_MASK);
>> -        lvtt_value |=3D APIC_TIMER_MODE_TSC_DEADLINE;
>> +        lvtt_value =3D APIC_TIMER_MODE_TSC_DEADLINE | LOCAL_TIMER_VECTO=
R;
>> +        apic_write(APIC_LVTT, lvtt_value);
>> +
>> +        /*
>> +         * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
>> +         * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serializ=
ed.
>> +         * According to Intel, MFENCE can do the serialization here.
>> +         */
>> +        asm volatile( "mfence" : : : "memory" );
>> +
>> +        return;
>>      }
>> =20
>> +    /* NB. Xen uses local APIC timer in one-shot mode. */
>> +    lvtt_value =3D /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
>=20
> While here I wouldn't mind if you replaced the comment(s) here with
> APIC_TIMER_MODE_ONESHOT. I think that's clearer.
>=20
> I wouldn't mind if you did something like:
>=20
> unsigned int lvtt_value =3D (tdt_enabled ? APIC_TIMER_MODE_TSC_DEADLINE
>                                        : APIC_TIMER_MODE_ONESHOT) |
>                           LOCAL_TIMER_VECTOR;

I'm happy to switch to using APIC_TIMER_MODE_ONESHOT, but ...

> apic_write(APIC_LVTT, lvtt_value);
>=20
> if ( tdt_enabled )
> {
>     MFENCE;
>     return;
> }

... I'd prefer to stick to just a single tdt_enabled conditional.
But then I'm also unclear about your use of "comment(s)" - what is
the (optional?) plural referring to?

Jan


