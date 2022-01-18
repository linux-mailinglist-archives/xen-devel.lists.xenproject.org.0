Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2B4927FE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258530.445304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9p7Z-0006Xn-Ru; Tue, 18 Jan 2022 14:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258530.445304; Tue, 18 Jan 2022 14:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9p7Z-0006VQ-Mv; Tue, 18 Jan 2022 14:06:01 +0000
Received: by outflank-mailman (input) for mailman id 258530;
 Tue, 18 Jan 2022 14:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9p7Y-0006VK-Qe
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:06:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3480932-7867-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:05:59 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-grv7j6w9M22KVN1sPbjKUQ-1; Tue, 18 Jan 2022 15:05:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 14:05:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 14:05:56 +0000
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
X-Inumbo-ID: c3480932-7867-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642514759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3qjWuA2QWAmWA6BwQTHF69OOQMH179mY+X5Jf1ZoAtk=;
	b=Sz7x+c/T4d808Gyn8rSrBUYoEUAb4JszugG2VGK99Nj8FdIqURfKwYHSktv83ItJ/JQ7MG
	Xl81BgHb/MIilt5XVXLIAoTevR+WnK2IZHC0HVIJuKMjs3uEbUhSsISpU99U5zc8lhsdQk
	PDdApXZM9iWDEy+WhbvEZIpRoLJ5WgI=
X-MC-Unique: grv7j6w9M22KVN1sPbjKUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrPQXFfLqrypWDZ08cKKocjkDrrtpmyAgPus/86QHHnXB2rq0BjoL2ccN0xu+RhJocJxBlu1FP2m91WnMOO/Jd61aHfwBzfu0scj2ZoYW1aNav3XDn9+rUPTvSHiKVY282JaoVRQLGAy+EiXsDAc1Ivy+Gm0lfismw8TJC9I8EPnRY4KduuZ5zXoKnRS7rI0vbm52+JGcFl6hoLrpLRwLSp+4EN005/5VUF58v96xzjcJXYwxdUIIk492DAT4dJVmdAk9i2I4p/6cOTKnsur/vTqo8ZOR80LFISBkVxRFnJt8/ISf+w7r+cna4gr1pHT2EJ5AqdzDUX9zPmnGwc9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY01eDPIdNUgaM0W0u+a4b0Y9vXWduh1ER7pUfvEAiY=;
 b=FGJTYvMYPXCRYrzYWKyOCljeZtDdA3ntX4SkGPRn8EH1iWcoTTNBl+tQGqufAaqjROLy05SmeqwSKfPWfbwPqDzalr2V0rP0FUnZusHKpArkGzgB0ycZcdkPgU96DwkXGq5iAfpIJKyIpUIpTeNZrx4EiGtdyD3wDFnsEj0Usp8yklsfKWj064VKLEOkXc6mCj3ETGne5SPJaPFufawmO4TXi0n1i5z7iy1TK0YSz7VR+TbaUFl58LZtgwNXtyKDSkebIprf0A0QUO5nuxBtH2dJgGSAGsAb8Zo0/pZeWU9pb1bL2psVR0ut5dYBPUJfvbIxZ1c3umKW7m4rswRXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bdf57ab-d658-f26f-6ef3-23e08aaf5aa4@suse.com>
Date: Tue, 18 Jan 2022 15:05:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] x86/mwait-idle: add SnowRidge C-state table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <b21c106b-b852-b4f0-efa9-fb5c465bfdac@suse.com>
 <YeaTqyt3ZoFTx/Ee@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeaTqyt3ZoFTx/Ee@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0202CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:69::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f33642c-3ed9-481e-8e0b-08d9da8ba550
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB90818C7DE07790636518391AB3589@DU2PR04MB9081.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QQK8Y75+iarkyRrZ2mMbsPEQeTcvk254NIPOIslcwPFm7ByqT6LGTgp4cwDRnEKCcvQ+AnhCWluhXa0d3UkrDU2XjrQK9LFAg5KSa35QToIAiUJ+5IqMYBME4knTzjgpGMPH7g/TI94ubbfGm5KQXBnoK40M5rlb9K0dH5HSUu60A8nrKn8PNXMYq6eu3cqOUV2zM24wcL2y9JNM870/bBaftzQteNh13BMeUrp+VhQoVRUl8nxzEextID+yCsPc27AwcSFP0XiS4PVX3bhLQR1wpTFRm7NAda/C7HcVQNi0yinAhP/g2JwW21lW+KHu1jsGroZNiV/gWdZ5BFVDRXsi8u3dK58014o/0BpBiFmRecJNaszQNKeExqy0wMhPw9/O88wYvjPZKdm5oQvFj2o5dCYK8OGmb3QF0qIeYXjWjiSVlWjWMDFSOU5q1Md5u89EtqajTN4G8KbWiMl5NFbJ3dIADp2UD7X6bn4EQKV2Wxulq/1rKyXhDlB6Gt6ggh+71lWGCr8399hZzxZuHYeEyy5UIctrV3BCgpBTAjz7jYbXMCbcPCFsJgPF27CWwekxOmQL4wIvO7/jZ4A9ddF0TGCz8N17/dlgkigW8a3mLJujoQIU3x0a2ffq6M+9zK74sUNNJmduMKoRzKQgdUjWLnP3oZv9BGJ3FgWMn9sqVhGFKz1FPZs2rdDWH16ZFI1OdwW83UTwkOarHOmfjGdcR2he25WXRktp+u7hKZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6506007)(31696002)(53546011)(36756003)(4326008)(86362001)(508600001)(6486002)(26005)(31686004)(66476007)(186003)(38100700002)(2906002)(54906003)(8676002)(66946007)(66556008)(6916009)(2616005)(5660300002)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8mITHRQQP+AxnyPeD8zWpiwWWvj3S1TJxwLSWtnp2SQ1T7f1+fPHIHwM0SZ?=
 =?us-ascii?Q?gcGnQinFewks5d+mYFnoEInJiGdNxAfxlspFWXSfn1OKKbyTk344nAek0rTV?=
 =?us-ascii?Q?EyFHwq9hIN5vx99+vcC5TjVHhs+RipxSKblnCg2MHwxPSLRBu3p6kjU0PaAf?=
 =?us-ascii?Q?VdFrcFEt+JH9oYkXfDT9aU8yfsT4pNyboM59c8pkHUUd9dD3Yg6aW3Xp1C4h?=
 =?us-ascii?Q?Ln6uvjeGI0LIY7RZE0giKoMPcjc5ToP1dRkozACzuv97N62zXLzWV4lnqe+0?=
 =?us-ascii?Q?vBYIyN9lJwZcFTnoajyIE8nlBKhHHvtYlpXWlRAxOXmOmf0CC4V+zbYDRyjT?=
 =?us-ascii?Q?HME35OJFzJC03nvIl69vG00eatRz0IMiN9rA09bKVc+r9CBgkXQMlDiW6EvE?=
 =?us-ascii?Q?c3N0nAFZBCLApDJoVD4ZbcYxzX051LHRRSfoydyNiqrvvb14JJtbWG/Hxx4O?=
 =?us-ascii?Q?FDSBVOW/LHF2Redf+O55rxK7l/t19BtM4jZcFGQhH5YYF7V+T8Yl/lzXo+LJ?=
 =?us-ascii?Q?ok4u+PYPzws+LRV5ws5misv2vCmLzshF+tF0LMfkqk5nHQNrvySEfkyCjp9b?=
 =?us-ascii?Q?x9X2zZrphQhhMugrCAs7lx8SwjExvcH6i9/ncBWSs03wmkpgO62cE0ogEBQ+?=
 =?us-ascii?Q?Zg7Q3tXvD1eVcjkOqIP/h9SRIEE3kXmyRr2aVumgBPOVgkHUVcJWPYBYzxM7?=
 =?us-ascii?Q?esRULlo+LsVyJYLSL3pzYNshOQ29td3zzUzjkkWdOJl8FCBaV0do9Sgm0Kp9?=
 =?us-ascii?Q?J86pdNlcQvEyWWLDc3ir2ruxvXvDVJqFP9SDNYDI2Gp7E9RzHEjhbHOG25qB?=
 =?us-ascii?Q?24MmreUCLnli3ZhBK3e16wE2RhySSv/9h4yifmZ+zr7JPLkWmzWJGMa4pjd0?=
 =?us-ascii?Q?IUnQLTkfSmhQ5MMWjFuWsbT7U5neTGynm9Mk93i0hAtcnONtSaL5J35EW/JI?=
 =?us-ascii?Q?UTE+q12Umtm/LPS3k49dguM11G1s5zmvKuu+VfKH9XRaKLsKYlsYzRQe/iPx?=
 =?us-ascii?Q?Lsf7+dTje1tZ6kAtU5Yn3+qgF/xcxLLh/ug0Eq/cnAj/0so3VSMqGtFSa9Sp?=
 =?us-ascii?Q?SXB9NekyYDmrrBfqujGv8jMxIcfU/723D56wA7RAeqQLFoDln+W3enQzTRs3?=
 =?us-ascii?Q?8MbwhF7KRUGBmorF7mH2D80cYjEBnlRE0XWeno6Tl4kdSnfXi39vBE0qEpw/?=
 =?us-ascii?Q?M/GWvB/CJepOMFGDh8P0xKxfNhYTrS4cEqgUo87fYt8PObIVLM2XX307Ke0b?=
 =?us-ascii?Q?6O+ikTQVP8OkJX3jnscevOj3xcmnbiYO0CG8MTg15S5GbpF/WrE2WONfBB3f?=
 =?us-ascii?Q?2SgRoVXeNZcdlI8Hw5/46iQQWA9YgW+4I14k3paAKtnD2AHV3NuNCv1NBoaY?=
 =?us-ascii?Q?4ahZkhPrWjSvX2Fi6ciJ9ibssXo114yQIoYKZpIykXt1yHN5dUqPrFLUwbnM?=
 =?us-ascii?Q?Nd9XOvpsIPUCAm+HrgIMEl62Eufz7CMKFQT+2of5mWQTOr9nC+YMvpQ1Gi0N?=
 =?us-ascii?Q?T20eEzdAnCc7QwOQ4md48V0UQ34sKsuZgc/sBC9hl7hIAo5VTYYaaTZQV50Q?=
 =?us-ascii?Q?lQpoBfXXDt36KlC2BP8RRKrxZfFVWF17KFogMnOEK5kkMju8HrTvvp+6nGt1?=
 =?us-ascii?Q?6XxW+ImtB56++HOnuv2e7js=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f33642c-3ed9-481e-8e0b-08d9da8ba550
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:05:56.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3AFlTXHp2xrCKSK8ThkiagKp67MUh7JbluSUxMoanSmxFYYF7q0NoJo1L8PzgKMPzaYz2rp2kKMDRuElxXw3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

On 18.01.2022 11:17, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 06, 2021 at 03:00:46PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/mwait-idle.c
>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>> @@ -742,6 +742,32 @@ static const struct cpuidle_state dnv_cs
>>  	{}
>>  };
>> =20
>> +/*
>> + * Note, depending on HW and FW revision, SnowRidge SoC may or may not =
support
>> + * C6, and this is indicated in the CPUID mwait leaf.
>> + */
>> +static const struct cpuidle_state snr_cstates[] =3D {
>> +	{
>> +		.name =3D "C1",
>=20
> We usually use names like "C1-SNR" or similar in other cpuidle_state
> structs. Is using plain "C1" intentional here?

I don't know. We're simply following the Linux side change. If we're
unhappy with their naming (it indeed looks inconsistent), then we
ought to make a separate patch on top (and maybe submit that also to
Linux).

>> @@ -954,6 +980,11 @@ static const struct idle_cpu idle_cpu_dn
>>  	.disable_promotion_to_c1e =3D 1,
>>  };
>> =20
>> +static const struct idle_cpu idle_cpu_snr =3D {
>> +	.state_table =3D snr_cstates,
>> +	.disable_promotion_to_c1e =3D true,
>=20
> This likely wants to be 1 because the type is bool_t.

bool_t is just an alias of bool, so "true" ought to be fine. We may
want to follow Linux in switching to bool altogether - iirc we didn't
have bool yet at the time the driver (or the first commit needing it)
was ported. I guess I'll make a patch ...

Jan


