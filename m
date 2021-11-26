Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171645E9A5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 09:52:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232405.402908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWy6-00032N-25; Fri, 26 Nov 2021 08:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232405.402908; Fri, 26 Nov 2021 08:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqWy5-00030Z-V1; Fri, 26 Nov 2021 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 232405;
 Fri, 26 Nov 2021 08:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqWy4-00030T-S3
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 08:52:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2df31af7-4e96-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 09:52:27 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-0NOKdvxGMZ-WEeCjIh8dhQ-1; Fri, 26 Nov 2021 09:52:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 08:52:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 08:52:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 08:52:23 +0000
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
X-Inumbo-ID: 2df31af7-4e96-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637916746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tq4Iu6TU2WBBJgZar0o5LA7gGdCE+7sOD8BU0E2L6KQ=;
	b=ZGxJHNkcNmUpPdhub2oxXg7DCzSaRAv6sTRGtJ1Jc/ein/VDnX4kOWoGR3igAuWdaHOjF4
	OfiXPfzSq+YEjNbkMH+zzWiXduZgC5bhY8HGmpe275cAG1zn5jCW+Hh6wLRkflxHagPDbr
	Fy2XTMLoCCU0CCNAtQCaZE6KjKuxBQA=
X-MC-Unique: 0NOKdvxGMZ-WEeCjIh8dhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY1iNA2xxuN9FbVShKeZjXlidszfTCkFtKPdDTL92CjGDQ1EBqRqdQH2H/PHQtEhNDrgfyJVwFlfsE3j7tAkQ4lotsgZkkUQUx2qbyMwMGoYXNE9N/2zU0YZcIK4bRm/1zbho3fCwaZP2E7ZDG85qF7gkVABG/I1qGn1hppEncpydAFXybI1r52ubCL2sLVlQ0oRCPaNI0oY+CekhL9A/91nz2l5VmygQhEYcwyPRMEXkkcZ4x0Gpb+V2vCuWtN540z1dEAvKwJk8Y6GtIH2UoW/OT1srz5SireU0Ndg2eOUeU3efJKQM1KQiLPjTU8Eo9/SGhOORaJk1HqxcHs1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4IKEDHkWkWd23BPhj3Uu/BlK16CTphgPcQLMZe07yE=;
 b=iOfpZXvSzrgtZNKz7tYcqdOWrG0BLlZxBC5f+X6+MZtw2wItZaN1tPM73l3+7Z60CbRwp1Hh5Bbnxl290LD9tLxFgXVIXxV5tdGeSAW9kA1msTwOHoCUmsWjpqjJhn0tRjZ4z/nOs5lTkqF/bis2uR5KqguV93Y5HEjM4yTRlwcA+ck9bEtXmYUjYDE0vQax8tjz2zyUyfeQz852uNafUQSQJ4Hrrpdf5boozEMKGBWmdo/h6Fvd4s1bPXxQcAMPKNWM4qTMahyU8Ta2FgaHxnwLMmDtdeDORAsEAHJOuFal45mCr2l8aEyTN++MigLBop4rebtZxVTCfo9iCQJPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5e14a4f-2c84-2ffc-9bdb-a38c503f1a1c@suse.com>
Date: Fri, 26 Nov 2021 09:52:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <amc96@srcf.net>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
 <YZ9oxXdnAEXaRtAD@Air-de-Roger>
 <00a83850-0aba-a66c-09ed-81204e8cdb3c@srcf.net>
 <b5fc926b-7fbe-b8fc-3271-2423b745b1d7@suse.com>
 <YaCc3NI39cZZTTU9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YaCc3NI39cZZTTU9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b981d63-67cb-4aa9-945e-08d9b0ba10ac
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477C6DCE6A0F0D4CF0A4279B3639@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T58UOf1LvNAvhQbq2G9n4QIQzc4jCdZzNl2Le5WIS4oCDg7eqnPOqh3/w1U8URL4Rx0N7vAltO92forYtmXXYiJccTBj38hIG3dx7llsC0sAByPimOhg4LXB7jEfKiBeYsIqt207U+cYj+6seH21brrVUQDh21D+0lqnYk+bYy3lQWeXA/lDLxh5gKlJafYKYB311ybSYF9PyARVwQRZuktbU/qdOOTbO3aVwwbMcIrSjHCJeGmLxvBILdFSkLo5XY/raHrJgI7iUF0AxUUsH1taUhe1+Q7kPm1Jzg+Ok0ndQzMNv3mAY4xlOsQwuccIhgOVztzaumyGqdHZA3P5+OND9CONGaeVtK2wuagg+5xjB+5TvENBStPhVeQcnL1Qkk7jcPGaFtWoV7QcdyrRaCvL12Q6pePIeWWM7GtisdTFKlklQHHSKxzfrd5PfAGv+EuuJQ7JJHSUxUFBwfC743Lv212Y2LQrqWSZ6rTJSrnRBpNeOaeKBlrUFKhcXkx85vUjiRAXeS1jFFM4Dwdzj7m8iOzn8k/PGGJdAmkqBx00sV6UVVKTsNFi7zfk/fIwAPKVHNvrUoQw2eEVrshYHHFxsXmqRxjuUzCLZW/LZvb8aGv1huz2n/iueaQ1wJQkzEeMJXEfKJgmyVJf9e18cEs6xD0Qrk4zOxcWdrC7pcEKAxEAikEggMdAUDgBH9MnRKZPIDgnzP+CC8vQwF+TegfxOo/Wt3RdWzqr5zPmr4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6486002)(26005)(2906002)(54906003)(4326008)(31686004)(5660300002)(508600001)(66556008)(66476007)(83380400001)(186003)(66946007)(316002)(16576012)(53546011)(6916009)(31696002)(86362001)(8936002)(8676002)(2616005)(956004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ugmd/jIvNPPO/JUOKpmIQyrK+9s31bdHZcMLjuELtAxxM+ufzwkWXeJGpBKm?=
 =?us-ascii?Q?Ald/LZE8AhzqwKF7vSnuHvxvR7THOxPoua02QAUp+X5/HZyqxoLXXNpw9CcU?=
 =?us-ascii?Q?8mSY5xyn4PfoFVNX1OJzG7ajXcv/EkVOQqRTTYDrlEHtnX1ghbzFSv2LCrni?=
 =?us-ascii?Q?yNCZ7yiD28CWnhMFJB3VfPeghxsUT/FcU/ZXGYHEtx2Bz7CjnGOkI/tbdk0z?=
 =?us-ascii?Q?9nd+NHUw1mV6sjzx8rcDS8c0nK/y+WH3MRgS54ejLh2FnlwGNeBv+xcZmQCL?=
 =?us-ascii?Q?0Y/Afpq43c/q5NYRBpHxx+PODbj9tuuZexLM2KcK5J050/VNlTcDappbwdUz?=
 =?us-ascii?Q?VxFUAkOE8iKipjo25Zx082tm3a6YFzCSMQG2PmBdLoRt2To5LMM/oaEQdcbU?=
 =?us-ascii?Q?SRIJIZeZBn8JjdGcwIq4rhgodETFsu38cf2g5Hjexn848cPnM3eY3kn+R0i9?=
 =?us-ascii?Q?UaLxQR6+O9cHg8MPpvNx85yKvWOE7OT+JeSWiJjnnKap+eD6lQD53THctvuy?=
 =?us-ascii?Q?qUNWbD31k+RxAknp3VqAYWh6UMj2BBDQZwrCYtAuSTKfohnYvhJWP/BCqiQm?=
 =?us-ascii?Q?HXVOoqkQKCHYwQbec5q+XDcrb4g5+FbaK3qAu/WbOM22kTUB+4sbafSDKEV2?=
 =?us-ascii?Q?vbroQ3dU8y7aZkz+UrpLQxU6yRhQXOJtmgHamhiJfEmR3rL57hUAuj0SdY4C?=
 =?us-ascii?Q?APLQ1uP4VSQXT/MzfCLDcHy9ZLhF4nAQB0x/Pz3bNUNXjA4NwA0G48iK455X?=
 =?us-ascii?Q?71ZfINpkblK9YJxSiIPSBvIOdKFDtdwU6UhzfMN9t7l6PReW0bTblRlPj+1i?=
 =?us-ascii?Q?woMEjZTK3Vp13Y0ZPIjt5dafjlFSgFPn9CMxlRJhyxCwr1ywRibWBzdrUkT9?=
 =?us-ascii?Q?ioUgbIPcANBmv5BpX7744cyGKYKc0db+UeiV+Iw3LRTbJsPQptdMBPzwpXCH?=
 =?us-ascii?Q?Z9NAEr2Rro4s2QJb19l0KYnxpYRoqZg5x1bsqstdmgKaZFS/1SLmSorAleR3?=
 =?us-ascii?Q?nXTKSNS4WeRsgxbEtuVLebcBSu9FmktHUHuDgTacPFy/vrKK3ZiuZ/SIEJsz?=
 =?us-ascii?Q?4weklUvUXqx2WnTRjIXGuFW/WZyTcj6r/PMoHhunRT0B5kR2gxIZXXuoNi7U?=
 =?us-ascii?Q?Z9FPgFkUFgtGWK9pKT6af1Bk1uZw+OgbwblR2WbHBNEkHyhNeluUH/9ToyeV?=
 =?us-ascii?Q?BaaWN82vFOXSkSQqbJGC4YWtOSOnaDKFghaW9tee4WSuYhZjNI8vgcB0jiT4?=
 =?us-ascii?Q?/DxIxXgecgBJXbOlDpkeq7j32WpCg4vYSI5ijDhY2AzEVKV810wTZ+qfllKu?=
 =?us-ascii?Q?b3+43MJaQv6z3BM6BnqHPurnnh8ZsP5kTMOiApaIs/uwcyb3LjQHQa1QuaiU?=
 =?us-ascii?Q?ecF5I64O5mEgB8hJ5j85HPhONTwPzrwXvr58uFZJL10P0SneARWV2DwNS8fI?=
 =?us-ascii?Q?zOYDsnox4QsDPDZ6hw/JvY9f7Z+5TFu7CZ7r0onFUjzvK89morkZfKyXt+F2?=
 =?us-ascii?Q?VpUf4TTAP2Wkab468kXqzfrZ9Q4CIxguHu5zsGkDpG452/Lq+uDl1v8pqOji?=
 =?us-ascii?Q?7h3j/moOHkaFj2WXg8bN9vZzFRRxWzni3NaqmRzSrMzvajBWGLUWEyJb8lUf?=
 =?us-ascii?Q?Naie/fYmgXGR0S/mvvzL93k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b981d63-67cb-4aa9-945e-08d9b0ba10ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 08:52:24.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTyryRxDKh+BvlBHYaOg/m39llXDMih9ADDpNFeroCUVAQVc1qZG2XHye7anhwNzF0RygYXCLL65Fxf1NbjHzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 26.11.2021 09:37, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 26, 2021 at 09:22:50AM +0100, Jan Beulich wrote:
>> On 25.11.2021 18:28, Andrew Cooper wrote:
>>> On 25/11/2021 10:43, Roger Pau Monn=C3=A9 wrote:
>>>> On Thu, Nov 25, 2021 at 11:25:36AM +0100, Jan Beulich wrote:
>>>>> On 24.11.2021 22:11, Andrew Cooper wrote:
>>>>>> OSSTest has identified a 3rd regression caused by this change.  Migr=
ation
>>>>>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Optero=
n 4133)
>>>>>> fails with:
>>>>>>
>>>>>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffff=
ffff, msr ffffffff (22 =3D Invalid argument): Internal error
>>>>>>   xc: error: Restore failed (22 =3D Invalid argument): Internal erro=
r
>>>>>>
>>>>>> which is a safety check to prevent resuming the guest when the CPUID=
 data has
>>>>>> been truncated.  The problem is caused by shrinking of the max polic=
ies, which
>>>>>> is an ABI that needs handling compatibly between different versions =
of Xen.
>>>>>>
>>>>>> Furthermore, shrinking of the default policies also breaks things in=
 some
>>>>>> cases, because certain cpuid=3D settings in a VM config file which u=
sed to have
>>>>>> an effect will now be silently discarded.
>>>>>>
>>>>>> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as wel=
l as the
>>>>>> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (whi=
ch added
>>>>>> one new case where cpuid=3D settings might not apply correctly) and =
restores the
>>>>>> same behaviour as Xen 4.15.
>>>>>>
>>>>>> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields accord=
ing to actual leaf contents")
>>>>>> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies=
 max leaves")
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> While not strictly needed with Roger having given his already,
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>> to signal my (basic) agreement with the course of action taken.
>>>>> Nevertheless I fear this is going to become yet one more case where
>>>>> future action is promised, but things then die out.
>>>> I'm certainly happy to look at newer versions of this patch, but I
>>>> think we should consider doing the shrinking only on the toolstack
>>>> said, and only after all the manipulations on the policy have been
>>>> performed.
>>>
>>> Correct.
>>>
>>> The max policies cannot be shrunk - they are, by definition, the upper
>>> bounds that we audit against.=C2=A0 (More precisely, they must never en=
d up
>>> lower than an older Xen used to offer on the same configuration, and
>>> must not be lower anything the user may opt in to.)
>>
>> I disagree: For one, the user cannot opt in to anything beyond max polic=
y.
>> Or else that policy isn't "max" anymore. The user may opt in to a higher
>> than useful max (sub)leaf, but that's independent.
>=20
> Wouldn't it be possible for Xen to offer certain features to guests
> that are not part of the native CPUID policy, and that thus might
> require setting bit(s) on leaves that could otherwise be empty? That
> also requires some explicit checks in Xen in order to assert that
> leaves above the max one are empty.

Extra available features imo still need representing in the max policies.

> TBH I'm not sure what's the benefit of shrinking the max policies, as
> those are not to be used as-is by guests. They are an upper bound, but
> should be tailored for each guest usage, and should be shrunk before
> being used by guests on a case-by-case basis (ie: by the toolstack).

Well, if on an AMX-capable system the admin passed "cpuid=3Dno-amx-tile"
(or whatever better equivalent to mean "AMX as a whole"), I wouldn't
see why logic everywhere would need working with 30 leaves when 13
would do. But yes, beyond saving some effort the effect of shrinking
max leaves should be non-noticable in the guest visible result.

Anyway, the main reason I will want to continue carrying the patch in
some form is for the actual function, as that gets modified by later
patches. Where ultimately it gets called from is secondary from that
perspective.

Jan


