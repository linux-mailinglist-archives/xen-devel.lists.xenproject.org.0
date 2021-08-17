Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A943EEC4F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167808.306347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFy5f-00080U-Oj; Tue, 17 Aug 2021 12:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167808.306347; Tue, 17 Aug 2021 12:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFy5f-0007yh-L7; Tue, 17 Aug 2021 12:21:11 +0000
Received: by outflank-mailman (input) for mailman id 167808;
 Tue, 17 Aug 2021 12:21:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFy5d-0007yI-M6
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:21:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 991aa6cc-ff55-11eb-a4aa-12813bfff9fa;
 Tue, 17 Aug 2021 12:21:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-3EZrPZL2MJm5qzJBgu2orw-1; Tue, 17 Aug 2021 14:21:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 12:21:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 12:21:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0064.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Tue, 17 Aug 2021 12:21:03 +0000
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
X-Inumbo-ID: 991aa6cc-ff55-11eb-a4aa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629202866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+2cpk4e8jXkWg8xcAoRbTfDRvL50s+Q0hbvaROASnw=;
	b=OTVoLOXnkbA/Cd2VqwfGdzGu7ftvnu9fUXZpMaL9hK8Hh2RFCqxMrJtB5M2EFjQ2DsE0s6
	oTASZA/+vOCOGT5C3HKlnmm8bUrWAGXvJOzeEFCwfvvDnDUfl0M3hMUKmXCI76KkugAMwF
	//l9m2MK+jbFJ1sAlTMhyFJNm0Ga7ag=
X-MC-Unique: 3EZrPZL2MJm5qzJBgu2orw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltmXqXlKOHSr8kJ7vl7TjsnNwIzBBKlyNhFNvVSy/JI/fl88bSw3wVJ7RdzqBQomgws7c35RNFozfn5xOTobUqLc8Ix5Ld04oi/IWtiEMNhdQba0Gk0YeiuHmSsleQztHF2Wn4qk2B2lLNwxfqvCTNa9YxA6f5nED0m9qOQ7jkp4tkDQyH4mFx0ucGtlyBkMj1icoLpNEKVhZyzc5+6thMFsZxCoqGGgn/TMweM7wK+vP+eDsRvsHK9A8naEuti3pUHh7Vfkp5j79vzxPp472SwvQuAhPB1jTBsGO0kM//optOohCWK0bBIhtPd3b1okSM1E813pmbtbav7lxl7y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nm8l41aTCSbh1ck+dU2sEZLxgVtCwVPTz1T6/35yy8=;
 b=fHrfEIbLc+EbbgMQNxCx52sEcKXovuWcS/APR/DM+qn92Fy5qxOhT/DoCZMH7DUXai5EF2lMEhon8Uyzx7MkqD1ooXOPVNqCTZDS6MRVduEVNrFnwfm3/wiaMLnBx166Gez4KeVIvEK88jiL9uL37sd8KU3AXGTxTp0fdQ2mWazIQJxqGz/3Fex6WdNOQJmC2qJuuBa4YItG/Aj7e20Ob2RUriTEYrAjtgpb4AoE/AFmllT6qe1as2j1Gu1akJ+wa0EA5PpPjhYky5oEY2C6IwrHprhzN2wWirXtXL3xPZtYSlozdnjONxC2Wl1lk9EMC0h3nr+vSg12C3nNoBZVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: S3 resume issue in xstate_init
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
Date: Tue, 17 Aug 2021 14:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRuhFWLrplRRV6t+@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d34f016-91d3-48d9-601c-08d961797b24
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617559C30B421BAA71DC5B06B3FE9@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5v9ol/7qM4dPyxFhKDCPlhCM8UHc1vwpvmsc8kitbsdQnqLGCqGntvANiM/odBSo3rxngVDHh0FuYVaIaY1483F25mFjdSOJSM6eqlHwCc4kAdwZTJJ2+Gb3gsyYlCut22+gj3uPAoOvu91TdDbOK1pp2bkmgN9Y28wUNQr2cC78iMKMXyPMrQ88DGrN7S4jxZNQBFzxLj4yB+fNj2c8dBPUgGmFTgvfJslnUTF1wQ+igsMHrrjxHlKj6VDnjTN25gfLN72Iu/Tr34GdwuhfuA/7o8VRH8f6DAZR93pn+4aIvRN2I22AJCokp1PDN1VvBiQFeSG8dz7mNXn61YHqNKb/ZKLR8fP/I6hXlz4VcnPBPvR8cxAtscPKWlW2BsHHMiS8H3R9p55ei2bqvB45F4jVioj3p6MO2+2rSNZMbP4MCoQrSj6Upc3D/eAiw3GTEurDR7rWPATE5erfs/MHfvBl6pjZ0r4IqFxJ9f0OklTAM18oyIvpAmcXOg21XUBsbqQ8MuLDK644R41P+6y5jkwxYFP8Aa27jpmKwge7jTEE1BwICM9Vls3V3kigKiEGAojUFR1eHH/GZbwiZm6t9+S0SoBXWiUSNw8LgI6eAdBCWuAfcDNxTouCO1Z2xLzqt9hkste7nYlzc1UuH4dwPK54Y8DFwgc6EQf12KM9fyU+AvAbA7xJOmE9hOQcBGemxiQaho5RHkNFfp8hQihAi0elYrjL2rFjDEaC0hMZSeirK4oiiQTegKoOKxCaiEzStmTg0bN1GsD+7w2crl03WJkHchdU4mkVqyDBNZ9eHMDWPhzzxJ0J5mBJmeQrc/xz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(26005)(16576012)(31686004)(2906002)(6916009)(5660300002)(8676002)(508600001)(316002)(66946007)(31696002)(966005)(38100700002)(6486002)(36756003)(66556008)(83380400001)(66574015)(186003)(53546011)(86362001)(4326008)(956004)(8936002)(66476007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUw3msdE4SgSs0ceGfoV8mqCSVB/BKZ3SuqdnaobhG8GZJOykT1VrV1XDM3j?=
 =?us-ascii?Q?+NKLhfqRgmQHu9/zUvT0CMQMqcURlmFxJZuQyr5JwQhbzHCd58DS9kxmem3Q?=
 =?us-ascii?Q?eCcZOY5TZ9kA4wlvZrFiOmwdTtconIY6n+5mBjC4t9rkHV4GcwQNvyHofo1b?=
 =?us-ascii?Q?N8T5f16d6qpOKvfgTTSLqMAynRwgEYkt1q9JUTMTYrXJPPMl4T+4tQvFIwjm?=
 =?us-ascii?Q?HYwQUdO6HraJK5aDx2lsaIVyyxhQJ4T4XGQ8+HShwTzNoLrLjpV72/6lkKGo?=
 =?us-ascii?Q?kNquwcvLiU2/0gcXfRS7rtKagbQI1WYfxVfLhPJhhBNf1lcZfzAIl6CuAvG1?=
 =?us-ascii?Q?8tCOluTbnZ8klJTyFSDypv87RQUMGpdNrLGyGGWCCNgTZg3aUKINCMuGI9Yh?=
 =?us-ascii?Q?cfvPhFZXQXliNjvhWYr+TyemuDdszLvYAMxc2xApDCPU8mEV+FN8NNAuMHz4?=
 =?us-ascii?Q?ohQZQPsAusRVTIeAv4Hb8A4xvzWDELikfUHm9OnrpD/pv2PNdnSub7dKwY7Y?=
 =?us-ascii?Q?W5N5FqaOiqPniCRYOSN4rai1oOsdJD/3DU/O8a7ii+yUbrYcD79NF3oKqIy4?=
 =?us-ascii?Q?dsXm4pYCXejKBVEPiBKL42JmE8GdRr/Fs0VCEXJQsmK0aHI8w/07oW5KArLs?=
 =?us-ascii?Q?u3KDyM9tQLgABAOAA7HONnVgAKfsYewqvBNDW+5VMdqhGVCD35QAmcXqaKJv?=
 =?us-ascii?Q?2PIDhUvANiu4G7ndMI3K9VxfLOqd5uNuUuE9zQgZ5DIlFdRO6G+/7iWR5/03?=
 =?us-ascii?Q?00A54+55VuozXoxOyixA1xZcJ8ECEbf4JRCd3dIWJdqIae39/dmcpdkFb7Ob?=
 =?us-ascii?Q?neNkAg4pSLDydXm2/016PJvV3jIQF/KcllEQE98JNoNQrPocGkkmxSM4/nbw?=
 =?us-ascii?Q?kBYtjf+JWmojBQ0YF81K2sIwB4Q3PyYTI1OQkS7ox3th5aYm6zLD+MhAg49W?=
 =?us-ascii?Q?JguuTN6dkAFKLEaN7sTdSBJ0nYaGnJ4i8eAwQhqo2cW+rjNyTlhmzX+jf6P7?=
 =?us-ascii?Q?EJJqZ/vxRenEacKq0U0FddxiSGU98k8Hv6y/POb99DsX7DwVyIF3HCAa3ALU?=
 =?us-ascii?Q?PLpVW1E/4Zvn9MiWr6zQzCbACHT46kzFIkNuk0iWVtcpSdjoPVy4lkKHYf5d?=
 =?us-ascii?Q?8lJhxI/8aSALcPzFJRnviFGQuuLYVy0jtAPe7dzG1y78VLQGgmc/rFJUM0KZ?=
 =?us-ascii?Q?dYXQJj+98Cl7R5BzLxRYkHSzdNCfEe5lH5pcF/7G4YOGzvQaXsRJgkhqii90?=
 =?us-ascii?Q?vhPclUQKRzbb5Gb5Ktlua4fQZSnc3uKBPwcYIcjJGBs75JDyHfmi0vCEHECl?=
 =?us-ascii?Q?Y+nIAlSuC5rV54J/760CKUKN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d34f016-91d3-48d9-601c-08d961797b24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 12:21:03.6183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awBViicGWBYwfeLz8ifiNqUIWoudv4DFiI8jTRa9RrsFlozdZtH/yPsPTdlScdvrWHnmNUGmMhlQNjUQMjVTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 17.08.2021 13:44, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 17, 2021 at 12:14:36PM +0100, Andrew Cooper wrote:
>> On 17/08/2021 12:02, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
>>>> Hi,
>>>>
>>>> I've got another S3 issue:
>>>>
>>>> (XEN) Preparing system for ACPI S3 state.
>>>> (XEN) Disabling non-boot CPUs ...
>>>> (XEN) Broke affinity for IRQ1, new: ffff
>>>> (XEN) Broke affinity for IRQ16, new: ffff
>>>> (XEN) Broke affinity for IRQ9, new: ffff
>>>> (XEN) Broke affinity for IRQ139, new: ffff
>>>> (XEN) Broke affinity for IRQ8, new: ffff
>>>> (XEN) Broke affinity for IRQ14, new: ffff
>>>> (XEN) Broke affinity for IRQ20, new: ffff
>>>> (XEN) Broke affinity for IRQ137, new: ffff
>>>> (XEN) Broke affinity for IRQ138, new: ffff
>>>> (XEN) Entering ACPI S3 state.
>>>> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0=
, BCAST, CMCI
>>>> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
>>>> (XEN) Finishing wakeup from ACPI S3 state.
>>>> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 202=
1-01-05
>>>> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
>>>> (XEN) Enabling non-boot CPUs  ...
>>>> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
>>>> (XEN) Xen BUG at xstate.c:673
>>>> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
>>>> (XEN) CPU:    1
>>>> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
>>>> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
>>>> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 00000000000=
00440
>>>> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 00000000000=
0001f
>>>> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  00000000000=
00001
>>>> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 00000000000=
00001
>>>> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 00000000000=
00001
>>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003=
526e0
>>>> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000=
00000
>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
>>>> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b 0=
d cb b4 0f
>>>> (XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
>>>> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025d=
c9fd70
>>>> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000bf=
ebfbff
>>>> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d040=
2e43ce
>>>> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f00=
000121
>>>> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f00=
000000
>>>> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f432029=
52286c
>>>> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007a=
484730
>>>> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085d=
c9fe30
>>>> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d040=
2e0040
>>>> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 0000000000=
000001
>>>> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 0000000000=
000001
>>>> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 0000000000=
000001
>>>> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025d=
c9fee8
>>>> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 0000000000=
000000
>>>> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 0800002000=
000002
>>>> (XEN)    0100000400010000 0000002000000000 2000000000100000 0000001000=
000000
>>>> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a0=
000000
>>>> (XEN)    8000000080000000 4000000000000008 0000100000000000 0200000040=
000080
>>>> (XEN)    0004000000000000 0000010000000002 0400002030000000 0000000060=
000000
>>>> (XEN)    0400001000010000 0000000010000000 0000004010000000 0000000000=
000000
>>>> (XEN) Xen call trace:
>>>> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
>>>> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
>>>> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
>>>> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
>>>> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
>>>> (XEN)=20
>>>> (XEN)=20
>>>> (XEN) ****************************************
>>>> (XEN) Panic on CPU 1:
>>>> (XEN) Xen BUG at xstate.c:673
>>>> (XEN) ****************************************
>>>> (XEN)=20
>>>> (XEN) Reboot in five seconds...
>>>>
>>>> This is with added debug patch:
>>>>
>>>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>>>> index 6aaf9a2f1546..7873a21b356a 100644
>>>> --- a/xen/arch/x86/xstate.c
>>>> +++ b/xen/arch/x86/xstate.c
>>>> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
>>>>      else
>>>>      {
>>>>          BUG_ON(xfeature_mask !=3D feature_mask);
>>>> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"P=
RIx64"\n",
>>>> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask), =
feature_mask);
>>>>          BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_mas=
k));
>>>>      }
>>>> =20
>>>>
>>>> As can be seen above - the xsave size differs between BSP and other
>>>> CPU(s) - likely because of (not) loaded ucode update there.
>>>> I guess it's a matter of moving ucode loading somewhere else, right?
>>>
>>> Few more data points:
>>>
>>> 1. The CPU is i7-8750H (family 6, model 158, stepping 10).
>>> 2. I do have "smt=3Doff" on the Xen cmdline, if that matters.
>>
>> As a datapoint, it would be interesting to confirm what the behaviour is
>> with SMT enabled.
>>
>> I'd expect it not to make a difference, because smt=3Doff is a purely Xe=
n
>> construct and doesn't change the hardware configuration.
>=20
> Uhm, changing to smt=3Don actually _did_ change it. Now it doesn't crash!
>=20
> Let me add CPU number to the above printk - is smp_processor_id() the
> thing I want?
> With that, I get:
> https://gist.github.com/marmarek/ae604a1e5cf49639a1eec9e220c037ca
> Note that at boot all CPUs reports 0x440 (but only later are parked).

And for a feature mask of 0x1f only 0x440 can possibly be correct.
I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
write, due to the cached value matching the to-be-written one, yet
the cache having gone stale across S3. I think this is to be expected
for previously parked CPUs, as those don't have their per-CPU data
de-allocated (and hence also not re-setup, and thus also not starting
out as zero). I guess an easy fix would be to write 0 to
this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
to the early "if ( bsp )".

I'm not sure though this would be a good fix longer term, as there
might easily be other similar issues elsewhere. IOW we may need to
see whether per-CPU data initialization wouldn't want changing.

Jan


