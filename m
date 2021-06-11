Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13643A3C2F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 08:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140195.259093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lravK-0005P7-Oh; Fri, 11 Jun 2021 06:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140195.259093; Fri, 11 Jun 2021 06:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lravK-0005LV-Kj; Fri, 11 Jun 2021 06:45:46 +0000
Received: by outflank-mailman (input) for mailman id 140195;
 Fri, 11 Jun 2021 06:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lravI-0005LN-V9
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 06:45:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 348248fc-3f35-4765-81d7-0ea5013ba5f8;
 Fri, 11 Jun 2021 06:45:41 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-7aVcrUTmMumUuwm6SPF6pQ-1; Fri, 11 Jun 2021 08:45:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Fri, 11 Jun
 2021 06:45:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 06:45:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 06:45:36 +0000
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
X-Inumbo-ID: 348248fc-3f35-4765-81d7-0ea5013ba5f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623393940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmXVtF2Dy72s0C5b8+IksW14Yiitv7bQfNQxpNHOTdw=;
	b=JJJ8FZX1LiLjLeuu5SeBIcLPtH/dRnDeK5l+72Eb8mO3Sf/nrNz4C47PXO7kuh8m0J19K3
	HHBwMShppQNwVrEAjcDYp3n3yYVXQXtpPnCGAFjBoKUZY+2rhcgk0UAMqnw/BwdgrWaXdN
	GadMAclT2HDEz1e4Vp2wdMq+cGTPrE0=
X-MC-Unique: 7aVcrUTmMumUuwm6SPF6pQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IagxxOC8NCjbggPbZV7snHpulWJUdLCvqLZtVJS8sWdOPnUZK3Hw48JU/MKNMuz+3V69BMm73gKZtM6qCaOgVE+6uIgCwCU3lETMJaWvEkYHrKNRAPxjIan1lETvO7tCmX8rBE+3wHhPLwGdv1J8DJNNA+97kLOa8L2nOtPYnF9v4Fz15D+IIRyGzQIl+k8eUz8J/6+PsP50fUu6KdW0V9W1QywKhQLIR0SaAvg115Ieo37k+O5z6varZzOWz6JHjvWJGFa04Rzm10XpvRvdzi4ZLYS3OlXGQLsD+DKgrkwlDkJ5Ebmih34n65CXKLMAzpRXKuzMQfzJ7l/zlReO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CnMwqsHXT/LLouNSySeFUh/lzId/eX52WltUzhQgoQ=;
 b=QfqNGBUriTdHbIzUDJD1hcdWLutKNebNSZeTtIf/Z9C5lmyxxHTogBXghr6+vBI8sFIf2M8v9WBa9D5FIotiOvbPrFw0cEhUuTfhWSVBNN2GB8V/RDut77m2ohHXRyNtNfnbrYukCGAm4pU/0IpPeNPY3WZ/+fVvr9sXqKNLiE4GDy7rZ5Vy9V33O7f2vHfSdBCfCRLdIBLqUL2gis3eIVeXPMNpQYH6KZDu/C+h09eoR+DEZ9dMHMkbq/WMuKBRusRzicGvyQURrVg79b54g3i3WEsSbgxbSjtuQbWkgRGz3NoWEg0jYOiQS+DcxD5u85TjS3f/U373bMr9v1Minw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
 <YMIdbGCpFGZGwLoN@Air-de-Roger>
 <e0f73a05-b027-d0b6-8f8d-a1078dedccf7@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <632d72e8-e794-2637-d5fe-acc52b530875@suse.com>
Date: Fri, 11 Jun 2021 08:45:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e0f73a05-b027-d0b6-8f8d-a1078dedccf7@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f25838dd-ac6b-44f1-9f87-08d92ca48505
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119A77F942E4DB536F57D62B3349@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9d3REmjgQX6iRQk3R1QQ4nhOZtWl4Zv4WKddIAQaa1ScgEb3mcRMrHXqu18Bq3Zl1xcXNg39xudMvwwuNGg9w6qKHhW5NdTn9GAAu4DDicmyNtb5SFpVAceQ22iu5eM+msIFeds0MsUfBW36VU6jTL5YEIrB+dWp15Yv38FHwx3M6SasoazSqRSSl3aI8LkgbpbAPj7NDvuvA8mqXnBnhSADmnUvnpXhoNWTUkaWWywB8jTGC8nqv0/Yx2bWblyBaW1i/l+FC8EjuvfcVgyx42Gs2XLCh2GqRPAcQ+ljm85HpMPVWgRIceXmpeN5Tesra2OHg/NTtxPvUtwu061YH1ZHC7ibW6q5stmGUXnF+81yZ2N75akqgVvoMwhmrXUuxheuFMSxwYOqLuRXCiPiiqNZBvUnWo/q3/ZjoIL4cruvOt38AcJUw89YnITBjtMryQIO3B2SBM1sR2KYwS2NDwGx/p+szer8Jea5QIoaaMQ665Pl37horOYuNF4MkrKwwyYO7NNTkWOyyYGQzONfPN/i2wnjV5yVx32hc38DjgRtWmVNyH7kpXSOSa2HfciEIG9v8XjUff72wH5GXr05gh2HlbZTSb6rAYNLMYal9Fo7xRkzyTbE/Ia6KLVTATA0HMyjfiYDiJRttPu+2Jb29JbKaiU2cmTd58627ADkE52TnEUp91a2KkUQ+P82ksIpa4eOCPMXR9oO7iMIZTqBZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(136003)(366004)(39860400002)(8676002)(6916009)(316002)(6486002)(54906003)(16576012)(38100700002)(186003)(16526019)(4326008)(478600001)(2616005)(26005)(956004)(53546011)(66476007)(2906002)(8936002)(86362001)(66556008)(5660300002)(66946007)(36756003)(31696002)(31686004)(83380400001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eh3mzovwA2M3IOf/YUqm0DIRwM0Xa78lmGLIkkOXylTB89Af2ArWAg8DP7yX?=
 =?us-ascii?Q?YtLltsrmUSq7tJVEOIA+4waSREeRw4RpgqNDtxDVixWpk+xjTQ+7CJcPZf1g?=
 =?us-ascii?Q?tpiBoFrJH/rrVaXRsahXrdQn25CLFqloZuFmXIbvDmAhPdq8ORseU2slR17M?=
 =?us-ascii?Q?agvWG916x6f9C58JMmBC9UoKm1+C3uUwC4kyemW159IEe1wCaqYu7P0uTCnd?=
 =?us-ascii?Q?siW8BkiAAlk7d3xcfaKTp+BEsSGtaEyAKGERT9Moqwdsta+NzyNgAw2rjV3M?=
 =?us-ascii?Q?v/vy8cGB8k3S0gO3fmZlW38l5dpglC/ztYyA9FqsxDvnN/2DT45BK8+J+b4t?=
 =?us-ascii?Q?GKVSx+3yOwe8TRoTSICm3nzXW7zjfycj/jmA8TAGuzkKbD4/StwbG/D5GGwP?=
 =?us-ascii?Q?uT3Q9U78CFFrE6JTztwdDN7MfBU0vp24AqFHCpst6g3akfNGXyH6kPV4VMjf?=
 =?us-ascii?Q?4E4AR+XCVrAOSf25mOzGzRcO21cFKC+9U2VAfbMb5B3qmTA5Yy6JcMEgfjMo?=
 =?us-ascii?Q?1KonuHZGoih1D00ujkDEjIb5GShcBV6NkDutdj0VnydIbWGmv/mICh6vZQ/y?=
 =?us-ascii?Q?UNbXcbPTa7k6+2Bc3n29LPZx2vvKKH3nvVbPhAJF2+0l31R8o98L8MQ1bbeN?=
 =?us-ascii?Q?Nw30gTDfBbW5Jl5wluADlMrM/COsDSP+TjaY4uzCOoL3yqFjUpTrDrhtjYW2?=
 =?us-ascii?Q?ZkzhtnslVU6jwh9/rLlU/QVuRdZezqrd8ip2sb4yX0M3IO9Qv8vB6+d8JMoe?=
 =?us-ascii?Q?RCG6jgqu+H1i0EkiXBWygxpPI++qv49BSH7obzlZR3o6NkO/0vA8KxQ0dOPs?=
 =?us-ascii?Q?WM+iagMlEVhBFklJgGUx9fO6k97iXcUSP76BHw7DdAnzacoZl4pgInT0szbS?=
 =?us-ascii?Q?Vh89XkXADb+1cPB5JerpRAjgYZHre/AsUq2+bWvvisJ1XBlKzz+PEsT6SIuy?=
 =?us-ascii?Q?AuMftYzZ/7+bNpHSO0oVXpDlRcTfOpkFkmqtlaXDboJz5lhBSmdgCdi097nU?=
 =?us-ascii?Q?gsU+frpv2l2CcK5hVHq2sH3EuplB7h6D7tb1BM087eiblxhp/jurTkKLweIH?=
 =?us-ascii?Q?wkQ6OJxlugkwR+YHu0uP8tucmSqc9wEydCC2DScde+TI1GHmNV5c59CFw9FM?=
 =?us-ascii?Q?TPdmrtcLAYbInMWpK1NHHZgRIj9sdfj1MhzX/3C1Us7a54t/PZhn2CXfQGsO?=
 =?us-ascii?Q?3X7jOZWCA2MX0myFxvMImkP0pNxibnIfbY4ums7xp+KJ8iMRv+7Db0Qz4XgD?=
 =?us-ascii?Q?TkB1R0oq9jU2tcWyhbAVYJH06gqWJ/5dyqA/L/i8cMwemhQ6gReSABhWyQX0?=
 =?us-ascii?Q?0PkoojIoFAY7UIyAR25ut3/p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25838dd-ac6b-44f1-9f87-08d92ca48505
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 06:45:36.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImKbKdgFxg14KSoyufiLEJoV2zp2/CqpkF/gYDKjkuCi9YpkKA+O42XfiLKH53RESjkjYYhm/ZJbjvRf2cDVEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 10.06.2021 17:33, Oleksandr Andrushchenko wrote:
> On 10.06.21 17:10, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Jun 10, 2021 at 10:01:16AM +0000, Oleksandr Andrushchenko wrote:
>>> On 10.06.21 10:54, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, Jun 04, 2021 at 06:37:27AM +0000, Oleksandr Andrushchenko wrot=
e:
>>>>> Hi, all!
>>>>>
>>>>> While working on PCI SR-IOV support for ARM I started porting [1] on =
top
>>>>> of current PCI on ARM support [2]. The question I have for this serie=
s
>>>>> is if we really need emulating SR-IOV code in Xen?
>>>>>
>>>>> I have implemented a PoC for SR-IOV on ARM [3] (please see the top 2
>>>>> patches)
>>>>> and it "works for me": MSI support is still WIP, but I was able to se=
e that
>>>>> VFs are properly seen in the guest and BARs are properly programmed i=
n p2m.
>>>>>
>>>>> What I can't fully understand is if we can live with this approach or=
 there
>>>>> are use-cases I can't see.
>>>>>
>>>>> Previously I've been told that this approach might not work on FreeBS=
D
>>>>> running
>>>>> as Domain-0, but is seems that "PCI Passthrough is not supported
>>>>> (Xen/FreeBSD)"
>>>>> anyways [4].
>>>> PCI passthorgh is not supported on FreeBSD dom0 because PCI
>>>> passthrough is not supported by Xen itself when using a PVH dom0, and
>>>> that's the only mode FreeBSD dom0 can use.
>>> So, it is still not clear to me: how and if PCI passthrough is supporte=
d
>>>
>>> on FreeBSD, what are the scenarios and requirements for that?
>>>
>>>> PHYSDEVOP_pci_device_add can be added to FreeBSD, so it could be made
>>>> to work. I however think this is not the proper way to implement
>>>> SR-IOV support.
>>> I was not able to find any support for PHYSDEVOP_XXX in FreeBSD code,
>>>
>>> could you please point me to where are these used?
>> Those are not used on FreeBSD, because x86 PVHv2 dom0 doesn't
>> implement them anymore. They are implemented on Linux for x86 PV dom0,
>> AFAIK Arm doesn't use them either.
>=20
> Well, ARM didn't until we started implementing PCI passthrough [1].
>=20
> It was previously discussed [2], "# Discovering PCI devices:" and propose=
d
>=20
> to use PHYSDEVOP_pci_device_add.
>=20
> Long story short, it is not easy for ARM to enumerate PCI devices in Xen =
as there is
>=20
> no unified way of doing so: different platforms implement different PCI h=
ost bridges
>=20
> which require complex initialization including clocks, power domains etc.

Just for my own understanding: If this isn't done by firmware, doesn't
this mean you can't boot an Arm system from e.g. a disk connected through
a PCI-based controller? Host bridge setup is definitely firmware's job on
x86 ...

Jan


