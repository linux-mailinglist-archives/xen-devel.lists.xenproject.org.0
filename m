Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCE63D126
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 09:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449772.706707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Iqj-0002Xr-J5; Wed, 30 Nov 2022 08:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449772.706707; Wed, 30 Nov 2022 08:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Iqj-0002UP-GR; Wed, 30 Nov 2022 08:53:49 +0000
Received: by outflank-mailman (input) for mailman id 449772;
 Wed, 30 Nov 2022 08:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rKz+=36=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p0Iqh-0002UI-Mm
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 08:53:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ed7db36-708c-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 09:53:44 +0100 (CET)
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 08:53:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 08:53:40 +0000
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
X-Inumbo-ID: 7ed7db36-708c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdRzY6p7b9IfT4WnpzVLeJf4bUAU1PpHmrIaUA330bTIm+ogfwb0wbW1TRl4/gLy2pcWmDNvTKP2P7vCorKfzEvPCxMmTf4jQ+6GY8oVWczSAoZwGbJdpWX/VocqxctF9g0f/gNcBXTsz4HIWGHUM/GYw5exR7xjiip/YGzsR6Cvso3Z8hE+Sba6lJx48Ekm/G5yKIeOVn/v2XDJw5FLj3rsK/crlU30Vp/ceSblvZ9xFhL+Dd7Ii0+VV7tyexfZDpW9ARKiORok8xrX9rPHZTyh5QEapOD/HYn1SWspyNfUOgnk40jixQc4RLOieDjSO5KOccpZUPyETnzDB9N5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFnbZWJFUp0sAzawbJ6JmnR+WoHSTi35d13YUqDmStE=;
 b=Njz7WuZonqX9Y//GltoV9lfRCWebjEQ7Y2MGurTY8FmKl63BuTtFUrSooKmNlm6CMCEGeMwErZg7PcaBdz7wk35eHC61zzOxsctLrwQuavancTFKi2wPPtY23yQ7KUxsNXPVprLgLjwACnfRrjtBOyNBxpzzRJMMm8JezLPcXsYUnuBS7BrA5cNhZ37PVk/gQZFS0/kIvKEhc7qnr/dTOnVTpll5kJw+KdxO/d0ls6AaXjwlLZb0U+fr8rFVZZ7K2qqdtKVtfZTSSTclTt8g6dovHHfQfr45oE7NxHcO+sOe7xyftVom/wXSQuBu8aPyo+kPdjdW3SFQP5xpf6rEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFnbZWJFUp0sAzawbJ6JmnR+WoHSTi35d13YUqDmStE=;
 b=ltPdw+TB4d5rVQL68GocmQzJPEhhf/Anbv2Yoi52gnvIqTFrcOytbw4Ye5cuCcZWcdgkXlCU1WyUP3+Ajo9fKR05bHsDONr2KWyW0H6RlhIjqse46L7Ik8esUlcX1H3MbeZ2+M4P0AqKUgsJDY6IgVItQWA+xFHAVEgq1zJpph4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 3/4] tools/misra: fix skipped rule numbers
Thread-Topic: [PATCH 3/4] tools/misra: fix skipped rule numbers
Thread-Index: AQHZAzNHmn5ClVb9v0W1JXlG6nXFZ65WlJMAgACXfQA=
Date: Wed, 30 Nov 2022 08:53:40 +0000
Message-ID: <21F6A61B-1476-49A7-8726-7F94BBA627F6@arm.com>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211291545420.4039@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211291545420.4039@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3749:EE_|DB9PR08MB9755:EE_
x-ms-office365-filtering-correlation-id: 2ddff6ea-a5f9-4606-3307-08dad2b0609f
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UnxYQGkwvIpJix0A0HjxSxlCsvm3KMbWLvZArO+CZ++6CeaVToCZ0t6nXAgUZZ8m8fgMRN6y5eOdEuMpWlI7OFY9W8F5ZZM5k3FJiw1FpKZD6ic9LQgHC4kl8QoQSWr+Sb+0hmdD5ULJUtCnAsZjtX8S3+u3nmhyI2P0JLh7DrW/EWz/KugbFJh8n4tlHn2LCM7IWSM0Aw7VNHF6uFmur0V4dQTYZgPCWI/HBWKTzwhiQCu6A1RiuWDt4waJfWKmHkurzAx041gne0hn97rZrhlw+Lwbwr+GuHB2HKWPxCuszzbSp8ng1qEwdFrPCgIcr6sZLNf1MXTvsSVGMK+f4hO0LmiIW+EKrm9XnKpvq0m7P0uYf8aNaN6+FG8Wgp2XIUC0W6aDDo4NZFHpoayP4XKWb7YZyTZJxEZz80KCOYQmHGuZY530CIeKUy2F8gU9iBbehsTeVstQQHvLfNfo2vMSwaUZ5ENctZGyLQjP7kq+yqC+xnefVNA4eZp4fQKOEirgwgqqFJ7q6Cgrb6p/1benActsX/VrVfvuYxWOnyRRjWLiLFUOehAP15Xxbh4ZvU+UA5c+lnZrUXDNtiQuGDD1Tkn3GR9irPqH2k7Ps759K044uH1qQDXbVonPN/Ovk/sDyx1+AD/tjNM29vdPG/ddPbBR5G2LcJXmyavxqg1Py21AxjS3UxZPijTznhLlJ8JBkai10oXJ6oHJ95zlFPQaa33xCv7+jU3gv7/GzsA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(91956017)(122000001)(41300700001)(8936002)(83380400001)(5660300002)(66476007)(66946007)(86362001)(2906002)(2616005)(4326008)(186003)(38070700005)(8676002)(6506007)(33656002)(54906003)(6916009)(316002)(64756008)(38100700002)(66446008)(66556008)(76116006)(478600001)(6486002)(71200400001)(53546011)(36756003)(26005)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SohzbvRdW76RVXLe9P0o4iVdvycRsFRzb2hucUh7gTl4eDl0FIWkYS3sleHQ?=
 =?us-ascii?Q?es0A1FmD+adFSIwsmR5ZbzmTIdL8vfMGuSD+bCY1a9vrMQpu8f/y9/g+ULxT?=
 =?us-ascii?Q?Fi0uvvhNSoePTUWDvSVTcTiA5CEQ51Q7+kNdZ5DOesP5N9lrBa5Su961XSY2?=
 =?us-ascii?Q?1kiWfaffyFGInxlEfz0cfBdeEkq/aBuWOXmjwQ/RKxi6XRb/ibWyDqZAIXRq?=
 =?us-ascii?Q?pXkJl11Kgy3zP8J5r4U+imyPpDN9fnepeg3rwbywwIkazZczarWyB6zC4RI+?=
 =?us-ascii?Q?f3zIKzFTdMP33bl+wo5lj8seq4vqCCEbtS3vB4VGEbuVL9TzdxCqv4x+7HpE?=
 =?us-ascii?Q?I64aXhGssSs2lRMZvJ8/hdnco5tDfDmZxTxq+d2+n2CKWfJybFEDZq39BEVE?=
 =?us-ascii?Q?QcKalxW2xOJcHkjyEdHXwx82KJsX9udMRTlUq5dfSH8XlYSMr9doq1mETxuA?=
 =?us-ascii?Q?FCVEU6MsCBabmpWBfSBlqnj4vdwdAWcTaSiHssQwRb10E831pUc/eBMuOAZv?=
 =?us-ascii?Q?6TwxOlWXTkOuQPHIBadKXseVzlXUQAfakYLnKRogGG286KIkWmNwg+1uR6Sa?=
 =?us-ascii?Q?GVo1+dML8LjtL+CF7ey3iBwWdMIRP8r8y7BPz5cGZHXFtcJCZsBDCPzKpZTv?=
 =?us-ascii?Q?jGmGTT0lGNHUUznoOgYRdrSL8MipjUf7rOgfoU6RY200qHVtjkbodBONSThB?=
 =?us-ascii?Q?4JhT7qebYiQwZdeDMLqNes7sIYYr/e8dDdLa+GnyAaOWO57CdcAoLuJAhHY1?=
 =?us-ascii?Q?RBUWznaJstyHBp6OKKeu0AZDcPNeCU6Xf231O1q/BA8fiZ3m5fDdHnp4K8NZ?=
 =?us-ascii?Q?cgOUlwYYlacAIb5AKx4/GMejvJ/4vF3qz+9Nzo3ckVZMphf2vK0x1tJrlEUN?=
 =?us-ascii?Q?U9yrzXR6jp1KWLx5+tEx0ETalFT6aL1FAwgX3+PEsJcKHPqdrooV/KCt6vgC?=
 =?us-ascii?Q?bnOWFU66m6tzn1msW3gQdXj5T0idzqUUVikEaHEOhf5UzFTuH7UeZDYsB2sJ?=
 =?us-ascii?Q?RuMQd1y5dOEYogYnTk8ImaEYR/FdilSHWChLNbVP0TlWmeNsQy82lhSwcxQg?=
 =?us-ascii?Q?GsLAL+Y1kMqCrgyj/zCMzLMPj/AFhk/CuzVNSTrXPqHHO5cKoGTY+RVKAKda?=
 =?us-ascii?Q?rPOhlquplaJy/CO9GdXZvQjyj6x2NwPjBPXccQA1ZfMntjGSMWADau7St3wU?=
 =?us-ascii?Q?l0TmaRL3f8JJbbJK0mRCqjMH3K8oCZFZLexW4OQv+Sk8FNyVOmS1P+ehTQL+?=
 =?us-ascii?Q?Tx7zpcapjS39Bk8044vQh5mGaCcwXEfBptQvPsBMrDzqL82OQyfijGy43ke+?=
 =?us-ascii?Q?u5XWxYgKfv0TD3rwBzw8jSnLEpxtXZKQWCzQ7L8E9oqaa+DqXGbEkPEv3RGB?=
 =?us-ascii?Q?vr/HU3vMgRpYWehA+zim26vjd7619N5KeIKEdT9HBQv886sDeaK6hr+ifL5O?=
 =?us-ascii?Q?lHw4ywLtnvpQVKf/O2pS0i6YSNn8hBPVFwzZz2Uam96UdiOVcJUqD2JLHByy?=
 =?us-ascii?Q?gHeoEAFgm7d5G97TE2m8J5Fa4BPuoKrJgAiRwK/XIhpPBXp5ODX/VS4njkNs?=
 =?us-ascii?Q?VXdvcrhXcTWKaBTQue2XMBQVL4UPlrnNin9VT12wi3cY+CMQl8fg8hOIbOUp?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A7460166AA498340B855E186326F26C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3749.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddff6ea-a5f9-4606-3307-08dad2b0609f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 08:53:40.3000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvFhx0ESTmYvncbX/WT2VobVbDl+WvtMhHr0AjzEr4QKhJ2tGJkK//HfZXo5INZtfyKn9B3cZYNUTtOLhvhgpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755



> On 29 Nov 2022, at 23:51, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 28 Nov 2022, Luca Fancellu wrote:
>> Currently the script convert_misra_doc.py is using a loop through
>> range(1,22) to enumerate rules that needs to be skipped, however
>> range function does not include the stop counter in the enumeration
>> ending up into list rules until 21.21 instead of including rule 22.
>>=20
>> Fix the issue using a dictionary that list the rules in misra c2012.
>=20
> I think I understand the problem you are trying to solve with this
> patch. But I am confused about the proposed solution.
>=20
> The original code is trying to list all the possible MISRA C rules that
> are not in docs/misra/rules.rst. Instead of list(range(1,22)) now we
> have a dictionary: misra_c2012_rules. But misra_c2012_rules doesn't have
> all the possible MISRA C rules missing from docs/misra/rules.rst.
>=20
> As an example Rule 13.1 is missing from docs/misra/rules.rst but it is
> also missing from misra_c2012_rules.
>=20
> Can you please help me understand why misra_c2012_rules has only a small
> subset of MISRA C rules to be skipped?

Hi Stefano,

MISRA rules are in this format X.Y, misra_c2012_rules is a dictionary where=
 the key is=20
X and the value is the maximum number that Y can have.

For example rule 13.Y goes from 13.1 to 13.6 (in the dictionary misra_c2012=
_rules[13] =3D=3D 6),
so the code can now check which among (13.1 .. 13.6) is not in the rule_lis=
t and add it to the
list of skipped rules.

Here an example:
{
    "script": "misra.py",
    "args": [
      "--rule-texts=3D/path/to/cppcheck-misra.txt",
      "--suppress-rules=3D1.1,1.2,1.4,2.2,2.3,2.4,2.5,2.6,2.7,3.1,4.1,4.2,5=
.5,5.6,5.7,5.8,5.9,6.1,7.1,7.2,7.3,7.4,8.2,8.3,8.7,8.9,8.11,8.13,8.14,9.3,9=
.4,9.5,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,11.1,11.2,11.3,11.4,11.5,11.=
6,11.7,11.8,11.9,12.1,12.2,12.3,12.4,12.5,13.1,13.2,13.3,13.4,13.5,14.2,14.=
3,14.4,15.1,15.2,15.3,15.4,15.5,15.6,15.7,16.1,16.2,16.3,16.4,16.5,16.6,17.=
1,17.2,17.5,17.6,17.7,17.8,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,19.1,19.=
2,20.1,20.2,20.3,20.4,20.5,20.6,20.8,20.9,20.10,20.11,20.12,21.1,21.2,21.3,=
21.4,21.5,21.6,21.7,21.8,21.9,21.10,21.11,21.12,21.13,21.14,21.15,21.16,21.=
17,21.18,21.19,21.20,21.21,22.1,22.2,22.3,22.4,22.5,22.6,22.7,22.8,22.9,22.=
10"
    ]
}

So this patch is solving two issues, the first one was that rule 22.Y was n=
ever included in the suppressed
list because range(1,22) produces a range in [1..21], the second issue is t=
hat the code was producing
Invalid MISRA C 2012 rules, for example 1.21 and so on.


>=20
>=20
>> Fixes: 57caa5375321 ("xen: Add MISRA support to cppcheck make rule")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> xen/tools/convert_misra_doc.py | 32 ++++++++++++++++++++++++++++++--
>> 1 file changed, 30 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_do=
c.py
>> index caa4487f645f..13074d8a2e91 100755
>> --- a/xen/tools/convert_misra_doc.py
>> +++ b/xen/tools/convert_misra_doc.py
>> @@ -14,6 +14,34 @@ Usage:
>>=20
>> import sys, getopt, re
>>=20
>> +# MISRA rule are identified by two numbers, e.g. Rule 1.2, the main rul=
e number
>> +# and a sub-number. This dictionary contains the number of the MISRA ru=
le as key
>> +# and the maximum sub-number for that rule as value.
>> +misra_c2012_rules =3D {
>> +    1:4,
>> +    2:7,
>> +    3:2,
>> +    4:2,
>> +    5:9,
>> +    6:2,
>> +    7:4,
>> +    8:14,
>> +    9:5,
>> +    10:8,
>> +    11:9,
>> +    12:5,
>> +    13:6,
>> +    14:4,
>> +    15:7,
>> +    16:7,
>> +    17:8,
>> +    18:8,
>> +    19:2,
>> +    20:14,
>> +    21:21,
>> +    22:10
>> +}
>> +
>> def main(argv):
>>     infile =3D ''
>>     outfile =3D ''
>> @@ -142,8 +170,8 @@ def main(argv):
>>     skip_list =3D []
>>=20
>>     # Search for missing rules and add a dummy text with the rule number
>> -    for i in list(range(1,22)):
>> -        for j in list(range(1,22)):
>> +    for i in misra_c2012_rules:
>> +        for j in list(range(1,misra_c2012_rules[i]+1)):
>>             if str(i) + '.' + str(j) not in rule_list:
>>                 outstr.write('Rule ' + str(i) + '.' + str(j) + '\n')
>>                 outstr.write('No description for rule ' + str(i) + '.' +=
 str(j)
>> --=20
>> 2.17.1
>>=20


