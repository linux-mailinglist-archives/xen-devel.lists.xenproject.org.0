Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A23FD73E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 11:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176242.320707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMvg-00050i-CR; Wed, 01 Sep 2021 09:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176242.320707; Wed, 01 Sep 2021 09:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMvg-0004yF-9P; Wed, 01 Sep 2021 09:53:12 +0000
Received: by outflank-mailman (input) for mailman id 176242;
 Wed, 01 Sep 2021 09:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLMve-0004y9-Im
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 09:53:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69716eea-0b0a-11ec-adc0-12813bfff9fa;
 Wed, 01 Sep 2021 09:53:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-dFfHWNfUN2y5W7OlfD3puw-1; Wed, 01 Sep 2021 11:53:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 09:53:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 09:53:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.12 via Frontend Transport; Wed, 1 Sep 2021 09:53:05 +0000
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
X-Inumbo-ID: 69716eea-0b0a-11ec-adc0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630489988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1EDBZu0WpUcHKjJqurIDGUHD3q1CvmzH/q+2dgnymM=;
	b=UNOuXtzX1WfS4Itl56Dniar6aziQvRhPOOwbMiGAejyfT7/wL/Ubbk25sJyRzmhSmE6PHv
	yQ4E2CGTUKEb5NVdthKesxgynyJf9aTliPgx9MVWgIwPhz2rWvYw0vqIAYI20QdgjtqdB+
	3PSmNuEiYrsNHvU3Q6CUg9XjQHDaWQ0=
X-MC-Unique: dFfHWNfUN2y5W7OlfD3puw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOi5t8fkV7mE3oEPg24gICc669mhOlN2DGhKYKFInlEE5E5f3L7o2Yb+t+z7q3qvxomxmiDN6DtDXCux36Zd/3v/ErklmaWGch1hWV3GV47QBNYUu8uftl1noVPv3g+JyVx97pvYxIso4i5YxraU/lOdiCoHNXk/ZOiyqjXH7qWL5GdZJq1u+bZbLuXt/rJtM6tXz8Bb0pe+gd46r4CuUpznztHqEbfEXaVrnykhkhVmT25gM1xz5nsbLC/TzRFHrwkXMBTJJOwn4gxg0LFTo8P64BCO5hdYZm9JLA9jn6Y/n3xaUVjbysMiEeaKljmqYJHgeVeGkaYGhQr+Eaeixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AT3M3+5f9uqBf3l+DjU+HB2tK3g3eHcn74+2vK7NM2E=;
 b=lQyb7C5MKqEA1yrFo9gCTwm/ewjumtyAPB9SBH0TStIruQaZ+OyYE9AqXFn/+X39URQG6FouLPWbVPQ1Sv2c21YVl6lNqOwXgQ1b+ZpCyTclEOv+VU7SLwRlGQ07hp+5LgzBwNUXFp5mJWUttIZcHIwk1Ufd9A1qdwGkjUCtlZ0DRLdlg5YjXhCKJbHCwAgacQTeaOTmiO4QJ8hd579Zjb/fXZuwHr7wYagmt4QLE8DoY7Vr5VO/dYLJ63LGz23NXIpmLDQG8hMEaiP7Fw6WGqLczLnNuf+CGBnH54OGxolpQ2UYIBxgfO1F8Ldouv0+289P7Ckstf3/kTen9rcQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
 <YS8+72EY4FrvSSIx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca3a9559-b95a-3b32-781d-2a2abfa50dae@suse.com>
Date: Wed, 1 Sep 2021 11:53:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YS8+72EY4FrvSSIx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f4b8d0a-9d7b-4713-6a83-08d96d2e4bdb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494103A718F87669ED3DE40EB3CD9@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eC9GN7Dwb2K0It89krZxNDB32XENRWHOYuEPmP3LUra9psOcaSi+8YDuX7gqOhyB7qvyPNoC7f1XCJ51iRN0xPlZatzgIme+WiYUgzX5GPEftKOmmF41AtyFF/RwqxGNDBhCOBmHhlKx4emEzqJ7sR1Rk/Z3fcJPT2mCCNlCQlh6FwSxe9VadpNRtTX+XNgOeBEiS3e8DtNTkJtHWony2+YNmHkbzybIisnV5AG/A1Uvg08yhGvxUXkHuZuxRh4zh1FYTlkneMUKTzlEHdMUI4Gb9a69wNyUcwyLbPMzqnoXbA1ycYNOL6NHlrweDUAMXNRYWOFP5XYoHqoIUD5qKSTO4GkOK2XrIcXaIluVSQIkVTOjPbdZEAwy1uj8Hipnfox0J5ul/6pUqxQz6aGSo7FUejnSTD6DyP6WONs2VGJNQrGGOjlpmpeG5DyqgLiKUxx5GWZluEkYF7jKwZbPCjmSSYkjLkDDakZr2ibAH96Y4fZg/aYy+RYTFK1xZI+HlfZtswGhQhxFQHXVUbtk1qxl4G3J9OrhLWIAycJotEfU3kIFSqK8yZCm3TTuz3b1xCr3iK4CqcOBe1BntJSsAzij3f7uneEJBr+x+9h/TcqHhLr+pF+G/FDXXiqpNK6mFnOddfJUM98FBpi3efJ1DO9LeKu0ShP+OM10aSX4//LT6dxnUhvrDrMeW35QcXid7HrDUzRyAdesf/T3w/QPI/EojMsbJCekYynY4QRX3VA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(956004)(31696002)(26005)(83380400001)(2616005)(186003)(53546011)(66556008)(2906002)(38100700002)(66476007)(86362001)(4326008)(5660300002)(8676002)(6916009)(8936002)(316002)(16576012)(36756003)(31686004)(6486002)(508600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2OhPcru4d2grG4422h733Ol2f5dSOxofVAdgTIvYWv8Q1PBMQfOkaEls9j2g?=
 =?us-ascii?Q?u+GflmQVa+ejP0iqBD1/L/kLcBg7NnV02G5PYEdhQoP7pjNs62WpPebToxZe?=
 =?us-ascii?Q?lhlqs0DNxq15cxg1fIBR3xRMfcN/64kBrKyy2PLFcGjByi9vjL6tbclezImI?=
 =?us-ascii?Q?J5HjjBUAbfyVbUwWwDWLtcpx3tcFPgrs0DIXV+bIaKXZ1qPEWze8Zp8DcBiD?=
 =?us-ascii?Q?57tIAnu1CF32O9Qd/RrYBCpHUtKfVuLwAU0JxONIEYvT35Ru7dPI93Zbxpmd?=
 =?us-ascii?Q?q/SHOl7l8KXxQIyyR+btlVokmJypx6SQk73jC9fmFaDJK/Rukarqf1mstOAg?=
 =?us-ascii?Q?/yvJdPXk56IJ8KkGogYGosUTHAM9vAOAx4Q3w+MzUZLG+eAq97YNvDcqJGeo?=
 =?us-ascii?Q?T/zlntkC73EfCli3z3P3tqr0IW/he+CeKfm6sE24myOrGbNp4QtNXXCmxrkC?=
 =?us-ascii?Q?L6ZeQ4qEzl4HrxtfOJc05jxi4MsDnQFfLJN53arpwEIWRe66yIfruqxw3NiT?=
 =?us-ascii?Q?vdv3QD1aTaOrpRGNrb0msZL/9uDTjCCRzTUtsmkegGXsr7Ff+9ZpV78DotPC?=
 =?us-ascii?Q?WrAXUkGj4G5szt45ElWio3KQZ6aVs96t2HaRGNfwmxeKV+uMKg8MzAxtylSl?=
 =?us-ascii?Q?NM6y2wbNrYEgjLoUlNu3sE9E3xEnc8Gf5pFealmR9K8deXkzTbQSwLHz74ie?=
 =?us-ascii?Q?urh1rSa16AUKzXhRkU9hwo+85ef2L/BAGf0E8X0o5ShcJnPyKAkg53rDhiy9?=
 =?us-ascii?Q?qFrpkz22iz5RIg6YfYZgqjdxm1TO2VqpGGkjciSG0mRYmnQAUUiuWQNOuJjh?=
 =?us-ascii?Q?FwOVDZjjzO9eBkZWNw71SB7wm1kUOw9L6z7MlR1aF/S3dCoBZFYUPhKCHc+m?=
 =?us-ascii?Q?/7fbn+h2iwNJ88nYW1kJ7gO8v2T9621y37gGfS19r5jGH3luW2DK07NGFn0G?=
 =?us-ascii?Q?ceDf6WJ57tDxQFVglZ9ruiK/gnpbPB0Qy16+p8FMNYsoBgvVR2t4vh5R7aor?=
 =?us-ascii?Q?pbtkjuu7soFyHImm5IlfK93F8edjNTdwRKyG47Zli+obl00XOjTkxghJ9VUp?=
 =?us-ascii?Q?nfMHbBTB4n7wQQpil4aR9bdRU59qbmKasHw2qR92WEE4GCCYEobue6pTp8Gs?=
 =?us-ascii?Q?MEJoLQKuWtJv5AI3KQTWgEg6QS43256DCFt/kcc3nVRw2p+k+5vi50VZG/6L?=
 =?us-ascii?Q?6YI7RD8s+41lVOPILhRP4WO2st7wlmQ0KLjJQBObpG7IXfPKRcN+vCrzZwVq?=
 =?us-ascii?Q?GJrBuMXR/K1ch/4ZHpic+f/fwDRjCtuqrtkLgaFy6q78cnwxxRia0YD32TAR?=
 =?us-ascii?Q?OSYGGS4l9K8Uzk0FeMa0yZnI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4b8d0a-9d7b-4713-6a83-08d96d2e4bdb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 09:53:05.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWyzBaQ+tWpHjtK26mhZaY13nCRp3OblQzNH0pRVS17/dKr513B+aBu2pMppvD5ymovagzHSvPZxjkBpgtaPxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

On 01.09.2021 10:50, Roger Pau Monn=C3=A9 wrote:
> On Tue, Aug 31, 2021 at 05:38:49PM +0200, Jan Beulich wrote:
>> On 31.08.2021 17:25, Andrew Cooper wrote:
>>> On 31/08/2021 14:26, Jan Beulich wrote:
>>>> On 31.08.2021 15:16, Andrew Cooper wrote:
>>>>> On 30/08/2021 14:02, Jan Beulich wrote:
>>>>>> Further permit "access" to differ in the "executable" attribute. Whi=
le
>>>>>> ideally only ROM regions would get mapped with X set, getting there =
is
>>>>>> quite a bit of work. Therefore, as a temporary measure, permit X to
>>>>>> vary. For Dom0 the more permissive of the types will be used, while =
for
>>>>>> DomU it'll be the more restrictive one.
>>>>> Split behaviour between dom0 and domU based on types alone cannot
>>>>> possibly be correct.
>>>> True, but what do you do.
>>>>
>>>>> DomU's need to execute ROMs too, and this looks like will malfunction=
 if
>>>>> a ROM ends up in the region that HVMLoader relocated RAM from.
>>>>>
>>>>> As this is a temporary bodge emergency bugfix, don't try to be clever=
 -
>>>>> just take the latest access.
>>>> And how do we know that that's what is going to work?
>>>
>>> Because it's the pre-existing behaviour.
>>
>> Valid point. But for the DomU case there simply has not been any
>> pre-existing behavior. Hence my desire to be restrictive initially
>> there.
>>
>>>>  We should
>>>> strictly accumulate for Dom0. And what we do for DomU is moot for
>>>> the moment, until PCI passthrough becomes a thing for PVH. Hence
>>>> I've opted to be restrictive there - I'd rather see things break
>>>> (and getting adjusted) when this future work actually gets carried
>>>> out, than leave things permissive for no-one to notice that it's
>>>> too permissive, leading to an XSA.
>>>
>>> Restricting execute permissions is something unique to virt.=C2=A0 It d=
oesn't
>>> exist in a non-virtualised system, as I and D side reads are
>>> indistinguishable outside of the core.
>>>
>>> Furthermore, it is inexpressible on some systems/configurations.
>>>
>>> Introspection is the only technology which should be restricting execut=
e
>>> permissions in the p2m, and only when it takes responsibility for
>>> dealing with the fallout.
>>
>> IOW are you saying that the calls to set_identity_p2m_entry()
>> (pre-dating XSA-378) were wrong to use p2m_access_rw? Because that's
>> what's getting the way here.
>=20
> I did wonder this before, because I saw some messages on a couple of
> systems about mappings override, and I'm not sure why we need to use
> p2m_access_rw. My first thought was to suggest to switch to use the
> default access type for the domain, like set_mmio_p2m_entry does.
>=20
> I have to admit I'm not sure I see the point of preventing execution,
> but it's possible I'm missing something.

Well, what good can come from allowing execution from, say, the
IO-APIC or LAPIC pages? Or other MMIO-mapped register space? Insn
fetches might even trip bad hardware behavior in such a case by
being the wrong granularity. It's imo really only ROM space which
ought to have execution permitted.

The issue isn't just with execution, though, and as a result I may
need to change the logic here to also include at least W. As of
one of the XSA-378 changes we may now pass just p2m_access_r to
iommu_identity_mapping(), if the ACPI tables on an AMD system were
saying so. (We may also pass p2m_access_w, but I sincerely hope no
firmware would specify write but no read access.)

Similarly in "IOMMU/x86: restrict IO-APIC mappings for PV Dom0" I
now pass p2m_access_r to set_identity_p2m_entry().

I suppose an underlying issue is the mixed purpose of using
p2m_access_*, which possibly has been against the intentions in the
first place. We cannot, for example, express r/o access to an MMIO
page without using p2m_access_r (or p2m_access_rx), as there's no
suitable p2m type to express this via type alone. We may need to
split p2m_mmio_direct into multiple types (up to 7), I guess, if
we wanted to remove this (ab)use of p2m_access_*.

Jan


