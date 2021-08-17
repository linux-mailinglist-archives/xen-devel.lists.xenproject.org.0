Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092E3EE8C2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 10:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167659.306052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFufN-0007AY-Ao; Tue, 17 Aug 2021 08:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167659.306052; Tue, 17 Aug 2021 08:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFufN-00077c-7X; Tue, 17 Aug 2021 08:41:49 +0000
Received: by outflank-mailman (input) for mailman id 167659;
 Tue, 17 Aug 2021 08:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFufK-00077W-VC
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 08:41:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3ff39e6-ff36-11eb-a494-12813bfff9fa;
 Tue, 17 Aug 2021 08:41:45 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-AqzLfZHXPBK73sePL41OYw-1; Tue, 17 Aug 2021 10:41:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 08:41:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 08:41:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0076.eurprd04.prod.outlook.com (2603:10a6:208:be::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 17 Aug 2021 08:41:41 +0000
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
X-Inumbo-ID: f3ff39e6-ff36-11eb-a494-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629189705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uHPsOC1ZS5ja/027pEhbGj+cAoKNryeRVR9n3I2wWQ=;
	b=EBqA5Tmv6oU/wCr1Z4Js84zGJepUdnVzlKAjcbCQMYmbwAdlwabXsCVjhiYaHEnE8VuqE6
	U/XN9f+slKa/7/cLm0mJ7p0WDqqLOq2KwfirBhYYJkoyeNXptbw2dnBHejbBC0l4WBJ7to
	XzcdRQ+mA0iuqdnMFLj7coQutdugp3g=
X-MC-Unique: AqzLfZHXPBK73sePL41OYw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2005vV/2o3+1S0JizQoXBYUTSy1JtiLqYXLVrTMsi6+pKN5ftbQqiXAgUzAvWro3JXh7RgvjNdQUCaFRQsKGm05kfL3cph2+xvQCNfEpZUPGzF9h2ICffzG/TlG9/u89REJz3DjuEeizdyHjjZBxZvejhihBVRloRKvRUo1vNnvW6UCHAtz9bHH4XCK4kXWT6IkKqtcz05bPXawuO2TEoBf+BHkpwxdMZazHBx+B5JtnM1hAYFms3oLixU1W57vy4xR+5txYnFSaqSYpRYMc4NE86q6yC/ciipBxm8bH81j+8UbM/1ufpJXhYTh25/YB6zYI7NVtuAOj3GHD+utlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUjPLMY7Zp1DUK4pzMKO7ucZFv7T4+r3ayStoEtfTn8=;
 b=I5wjbt5Igh+zMIe9ASZXgzzyzjvpE9xMcTEvQigY6QTshl/dTObR1vjkfKpuKGslPb4GYV7hLXqV8uEcHGigjVN2DUJd54Lv4FwupRPa08AUkAE05y4UqoqwDRGlX5gJZTCJzzaBmI3O3QlVFvfOiLud2zw6LU24pspMCqugNt6XWMKqhl0OM0rsdnV+KLajMUw+RXDyjt3WB/CCd143mre4s1HW1jRAN341PFry+rixOil/k7zvdPMLOlWYMnB+/SZ9LHgHGDRBk3hTHVou/A4hMM4T3V76BCNkKhbmA/NenCxYPAnHfakTgcfiOGyyX79rFzzMSNaKOzYnTBah3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] IOMMU/x86: don't map IO-APICs for PV Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d01563bc-ae9c-fe91-b313-19a30af09170@suse.com>
 <2edfe6a7-a69a-df75-a11d-ee8348235c54@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae627ae1-0537-a3b7-fe10-002ba985e043@suse.com>
Date: Tue, 17 Aug 2021 10:41:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2edfe6a7-a69a-df75-a11d-ee8348235c54@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:208:be::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ac4a6c1-b573-46ff-a88d-08d9615ad60b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168B2DC100F5D453FC02A6BB3FE9@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	40G4dN7fERbIb5KrWdEgXfHL33S8bwsMjKAm5BRmTvaKCEYkFF71FSKOpNrLeOTM+ej4rPTXIvoQat0iO+Nd/oyNg58BFfo8tE2wgXLKPShCXggGTX5rzVRZgOgDj6TM4fPDhipowuDN/ZvH+FRew/FZk14ufU60g5g9VMqH2ZBLByautVmmnATGe6yO7vpNSLlpVL+a4dRA3rI24dPrecW1ejXYK1LacKGdCVPbe9kOlJApAOt/l8DBZaY7ua9SlGPw1tfED1PTomLDQEoTfx0d8dk2BGFrIYAhoOD74WgdPmazO0KJuQWYjlsMFqz3CnC2MH3DLMaUQNSHfGLDSDWm0pGyWUp8V2UYhA22dnRzA2rWx3deXJ20HUx0b5a9gAjmprVSk3qG13yV2ozfUeUcwaFDpQ9nR6XSQ2/pUm2XTflNhUJFZ5Q8mC0uytIP6k3Q1ODcL/20/2kzzAvj0hNDUbeP4PoXiRnsZcMtRg0z1jIQbdi+Z75QY6xsh+0eAq7cElfQ+MEzwEX7UUweJVx2AX1sZ8z8lQZfju7077W+kko3ia6ritPYM60dGaMlEtJ41xIcrSW15uXW6A3qfQs5Th2olg2Oh5pT4MvLiExBWr2YzTrnjz7zs1R+RMjvcKOwRzAyqb/gfsnFWlJZTHE2x0H4IyQUM8wtWd70HY1Y2S58LvA2bJ4DwCifavy2pqbW9iNpuad5APZ7Xw/nxkfhdvw2YnvH7a9rkwY/Dg8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(376002)(396003)(366004)(31696002)(26005)(36756003)(83380400001)(8676002)(186003)(8936002)(31686004)(54906003)(86362001)(956004)(2616005)(53546011)(4326008)(6916009)(2906002)(66556008)(66476007)(316002)(478600001)(38100700002)(16576012)(66946007)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tNhTnqyIlP3WCNw3VwHJiK1tEDI3GigIBd7ibLjj0gQAFY32rDL4pBbp5fZv79VH1mBU+0rGI9c/aIbOwOMAszp94gAl/ewd1Q9QQau5+2YIf5y/GLViXVs3cKwej41TDp5cTiRxcBDnN2Aw1BvcMX4Wz0V5yLgwMaduFH975UwtKgtZFbbhfZLE6nmO8kKLY5CXW913dDL5+SyuW+kdUL8y7sELZlMCULDVQsOxvVpEKSEQ7/SGF+vxbNGd2pz+bPh5ODR4QTjz5DTD6XiaDa117pszO7BGU8DEYKHpPfKjrZeOpWjGOKBd7YLzq6Vi9/AB1bA1JDF3YqBLmtc2PAJ2vu2sqQq8hZTeC+mJ2DvYFXvWr3exeD3pzwu0sc/tlvvS9ivrC7Mog9pn+5yqidjInqMgBtzMJ5MnEw8kBjpoMMtYn4DPL5f64PSUQ2nTaGNPhYsbXQBBX/iJ58Z1YI32kuNdAw2pP9Es9JLujuN1eLWOhVDIybBD06TZQecvGQSN3IFl6PCI/LmyK4u2oGFXYayIKpfEQyLwOAiiHPhUtaeutL8JbFzqldUwj+i3IHZfR6r8pL8XG9G1xmP8dcYquYd4UYnzw8nD6k6p9cFlMBdUUSbYIlAVJWaezna+I/FG0iZ3bIxF9DAc4ZQViJVJWy0pUYyn+G/46i6y8yEQb6WT88fRLwGVG40zRhOOUneISx1pG+F4J7o8HbUWoc8GyK/5+qlrZfL2os/VpjP3Uby/ii5bujDuW9vxJAIl
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac4a6c1-b573-46ff-a88d-08d9615ad60b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:41:41.6684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dT7Kw5jR56ZwVIVntwGgbg2sc7hOK6rDT3rPT9jGuizZtjwzKXWjxijeNo4mqMJdU3HcswHDO56TXfNBhOQ8XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 16.08.2021 20:31, Andrew Cooper wrote:
> On 16/08/2021 16:31, Jan Beulich wrote:
>> While already the case for PVH, there's no reason to treat PV
>> differently here (except of course where to take the addresses from).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Honestly, this is already a mess but I think the change is making things
> worse rather than better.
>=20
> To start with, IO-APIC windows are 1k not 4k, except that no-one added a
> "4k safe" flag because IO-APICs weren't mapped into userspace by Linux
> at the time.
>=20
> More generally though, if something is safe to let dom0 map in the CPU
> pagetables, it is safe to go in the IOMMU pagetables.=C2=A0 Conversely, i=
f
> it's not safe to go in one, it's not safe to go in either.
>=20
> Mappings (or at least mapability) of everything/anything should be
> uniform between the CPU and IOMMU pagetables for any kind of sanity to
> prevail.
>=20
> This is most easily demonstrated with PVH dom0 and shared vs split EPT
> tables.=C2=A0 Split vs shared is an internal choice within Xen, and shoul=
dn't
> cause in any change in static DMA behaviour (obviously - there is
> transient difference with logdirty but that's not relevant here).

Well, as frequently my aim is consistency: Either we exclude IO-APIC
space here uniformly (regardless of guest type), or we include it.
Yet including is impossible for PVH afaict, because there's no MFN
to map to (IOW I don't buy all aspects of the last paragraph of your
reply - there's no mapping of the IO-APIC page(s) in either kind of
page tables).

I did notice the oddity while closely inspecting the IOMMU mappings
created for Dom0 in the context of finally making use of large pages
there. Seeing it I didn't think the IO-APICs should be mapped in the
IOMMU page tables when they are _not_ mapped / mappable in the CPU
ones (see the respective iomem_deny_access() in
dom0_setup_permissions()). Hence the change actually only brings us
to what you describe in the 2nd to last paragraph of your reply
above.

Or wait - default behavior actually is to allow r/o mappings of the
IO-APIC pages. This would suggest the IOMMU mappings should be r/o
as well (unless the rangeset addition in ioapic_init_mappings()
failed). I can certainly alter the change to this effect, at the
expense of more code and more code churn.

Jan


