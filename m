Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5F465F31
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 09:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236368.410017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mshG7-000474-7p; Thu, 02 Dec 2021 08:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236368.410017; Thu, 02 Dec 2021 08:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mshG7-00044l-4j; Thu, 02 Dec 2021 08:16:03 +0000
Received: by outflank-mailman (input) for mailman id 236368;
 Thu, 02 Dec 2021 08:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mshG4-00044f-Uq
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 08:16:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e195a6-5348-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 09:15:59 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-LmDa5amEMfyK8a81fjQB_g-1; Thu, 02 Dec 2021 09:15:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 08:15:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:15:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0224.eurprd06.prod.outlook.com (2603:10a6:20b:45e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 08:15:56 +0000
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
X-Inumbo-ID: 14e195a6-5348-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638432959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8hOPqvGzXeBIB4/ZRzUm823cW/N2aXg9vJXLPivKS0=;
	b=dqMPmuPFDNTS4uaeGqJ1dPUSTUGnwWZASzkv15hbX3Cl4dU1bUH8YEXssAAekQqBpV+EiV
	4JplhaVKZWkjyY28T0RM8WKnWStY5/BJQ21ObWXpt1LFlvmmyq7L03JSneIKTiR9Jr2UTA
	cWVxguCWqX/mqHFLQnGv9WOvrCDNzhw=
X-MC-Unique: LmDa5amEMfyK8a81fjQB_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr3qhjiPMBFKkjxaJ2jiUTOXdVIyML7aIlbDCitcF0gwQbtkb91e7ZmmAI6lOdDZohWlm89uBuBFY6e+ibMjvZa5pPQgcUnNAxkmFz1hfd8CJS3GhuoS4wFLIgZxH9cUoHLaUaDCTaPFO353eok1hLrSV69qkHuaxCEFVY0Zkqr1rm6evIpxY+zfhCuKfSe2ZkUSleS/eAe1z/6uC18CJBWz6KfhXU7L3hhtFNIP1FIX1vblDcL0+07+5xJIiLbH1LWnZcchGpiAP89w3Tf1Dav6rnX1Fjms+684k1R3U2yowGOznMGCvNRpKvBScl0qES8kx0uRLDLgTNKatVg/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqRU5mbCOaYExaC9tD0BuvMXBCE+HbW5KwP4sSJvw0I=;
 b=XdG6RGWBWNGZ6aTGFVPJgUcR9pqR8eXqHAt+jcwVpplQPyvLwNjatntnxtLWOZvbaqfe/EHR9fJDg+IHgBJ4mO7pHaZ9byDHzSiuIJlbLtGIz7u2VJ2ASAeRdE+0zjcptPnNN3Gmhp1R+yWGyDrgPKWrxjxIWOFhc+YYH/U46FQ/eITwYQH0weUQFcKdvc5KKPDeW5RSg9a1EIRJX9B74it5WUxa86KgqSkxkspuHddG/sL32abt+eSQ8zxRSXmvOOkmcaQQKxGMOlhGRoPpMW4wOCAoP33fxwJ3Nd76zcGAA+IDDcnXUDBVicnDmTDqYJ5lMljPlcHz3e+7Ak2OqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51ca3725-f85f-0f53-5e90-7128b935b18f@suse.com>
Date: Thu, 2 Dec 2021 09:15:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] x86/shadow: defer/avoid paging_mfn_is_dirty()
 invocation
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
 <3bb2018b-8e28-6469-6b6c-c6de935bf669@suse.com>
 <639244eb-074a-ef90-3bbb-747ac65fa6b7@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <639244eb-074a-ef90-3bbb-747ac65fa6b7@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0224.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab8e4d2c-ffdd-4a35-c825-08d9b56bf781
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301A7455EE47183C7BBDD5EB3699@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oC8C7sa+XF6kt1aZfasSDFyyI85OvnGmRSc8eTGZVNzRJB53ccfOf8h6JUFXv02Wf7HHjNSeIEV2tl96nplZerejOHZemD6nDvUgWPdkjfwhN7VgchlhrM0y3HRoWdHI1RGvWNbcBFjLNVNueo6O13NRE8BIqYTAq7Lrx9I9BcMsq37ZGO1QbpgU5ULoYGBvKsQ7EKpZskPEvu5Ge2SM+V2kZihH22cwh/S5ZfAcgkZvPRt2mbY4rD+ljwf+pIIE+H2cTQmx/rbLDgV2O+9sEIVW4CPfxD3/KwPHhCmdaAymMlzGtFzadVdjbRdkFUcwjHJeGIPjwql17qYbbrCkh70kDQkv3ytQELZE2X4ymTpgs9CkY9DMkDeZIDimUnvuQsha4b6Mq4nG2Kk/eFr9DZDNaVH+6l9f6cf7PkwFQwb/oYRAh0zP6GmU2edVnkof03IyxY665FN++ytSYNSJ3L99Q5Q1++hEmsPvMla3I0CZyQg5Do0Wos6m2u1buBy1GKFUY410lm1HljujkFweCyiKUZ4ty8Et62FkyC1Rbv51VLUaDni35oWz2wrzUZ4jSvOsypKhg8DDJZdh7HpcYwwWsQUQYbL+YAeyIM3bBz0HuO6txJR1VzQsXemRN4Z0xdc2pcFgXvi9sp8V0p6LWDtkxm5crYC1gkIawd2UbtiDThaGLW9+Vkpj7IKs6h7v5lp1eDDbGaL+HXm5/v+wSc6WXa+EXCJQ1mkXSOxvtqvwqYtSL6ZC66uDcCI7aELvb+VjhUV2O4dFXPsOMXOgrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6486002)(508600001)(186003)(8676002)(66556008)(54906003)(5660300002)(2616005)(4326008)(36756003)(6916009)(53546011)(8936002)(2906002)(316002)(16576012)(956004)(83380400001)(66946007)(31686004)(38100700002)(26005)(31696002)(66476007)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TdrRR00S9+w9kDJHVcGyIC9UBSVpIuIpdgnfk7A/YwQRP9Ky/aUpga4/lY/3?=
 =?us-ascii?Q?LN1GePfrHlRCTpmbU2M3LpkPmLzQ8lU9VL4y5JI5qUeHHJI0Xz+NMi2UJ+sz?=
 =?us-ascii?Q?3QfkrVQe97bnwNaT731j1WZEzWvNElt64g3IizBkvF7/xWBzfv7sC1Ae1JYF?=
 =?us-ascii?Q?nz4Gsbejk4mpJt18Zouv/+IF/T5pCWTkoPrWMGWah6Addb8JS4JNdlS1foIx?=
 =?us-ascii?Q?S1E23H1JG3jecq2ohXViPJNoUJaMzAcGqQbUd+u52QR/pUsZpv9mmFe1Uk4l?=
 =?us-ascii?Q?LpjlckofWbkR/PNVQmfp/JshOb2k61xVcK5RMKCHncPdbfkBNmX7zMVuhqaR?=
 =?us-ascii?Q?sE3G4zTb8gQ6LVB8rMC0lKp5WLiaOGklBfQmEnIKnCPzbnZAkB9EXfwViMju?=
 =?us-ascii?Q?+OCn+cHRpPy2S6evv+tAAb9KjROoHrKSacXZ6rEHj67D9Wr2+e59+o/7XPQ4?=
 =?us-ascii?Q?nkiOY+BI68EO3TCEh/eWiCcWuC+0dHxTnkoqDKLli7xWnJNao3v714GWKbAD?=
 =?us-ascii?Q?BmMB4LgfuVgAJZMptbinwF5m1X2Hn+UGpFPGoeaHxWPeuTAbSwCaf4/3rhH3?=
 =?us-ascii?Q?iE2YHaVd7cxdU+s7h9zbpf5dlZTuHIJhxi1x2ydIfkZi7HHDFy//HTzTSBYx?=
 =?us-ascii?Q?PB/R6TzI82goAsE7j3tpe0UjAqI8VWkTiq82/1RjZDRREWI40jZd7tbX/LR3?=
 =?us-ascii?Q?1P5kax2z55+4NHTk+kYE011Lpm2+uiV+W8kecOpf1RbvAg2hslYjAm24u+NP?=
 =?us-ascii?Q?szg1ZY6fdSGvBkYtm1rNp72af8DzZIRkBgAOzZhSmnzT50WZBJHAajiPwbU9?=
 =?us-ascii?Q?WOW29FYDd/LvQgGHpoMUyzmciD7bAtUq8dOj6hu+4RByinhfwBcr1xYWc/dq?=
 =?us-ascii?Q?kOz0+qDKPb30I0bNgea5w4IBeG1+NRbxA3ep7O5lK++5UxlUhVJKz0MQ5NZK?=
 =?us-ascii?Q?2cnw2+A2JK531jcGKkvEx7j3yjFc8GBXiYWuyM8WTMZ/GlIcO2vWi9S/NiMw?=
 =?us-ascii?Q?CT0C4hTYcbyz/vM2tEvGd8akZTX4z0cF6GXRtVszuMNfXLtNtgu+7/EbTR6Y?=
 =?us-ascii?Q?VKPCTq5GGzUhGKz6kmrezDU9RAqUBw76FL95HiWVzzV6cV36DwKsUccfpJlj?=
 =?us-ascii?Q?ncOihqIECPXg8zym56h29fYHFV8qHUpP2ZPUnrJV4YOLTdVtoy88pQdGHVLM?=
 =?us-ascii?Q?KdjceoDoTy+FzmPWLHf9YSIA14j9/RIAnY/IbwRsyeoz4DwIvvPXQDNJiY25?=
 =?us-ascii?Q?P/ETmHBEVxm0OkCtAvML3cOCJnzSX8ucDFIuBF6jbbNm8Pns06EbcwUSa/6k?=
 =?us-ascii?Q?2DCYu4oODxN02aOhIceNpZFxg+UcWz0obB9bKNW6CP21YkkFklKMcH9YpgvF?=
 =?us-ascii?Q?HN6DyJPUaiYbCqzRVG7oeYCZ1zfIt9VRCCIqD2AxP/cHR2usSVIfth9ywD8r?=
 =?us-ascii?Q?pY2IkGm8U6QIpwHso4Zt7YnLVd619ti2w4m9NDbevBy3oiXp1n4lRNtdjuwy?=
 =?us-ascii?Q?IrS3/MFrS7Y3lfJvVmK6Mv307BKD6ZrIv9pR5SUmfeaG+tuDdPpdjctOl+Sy?=
 =?us-ascii?Q?kNOkbunnty/JPs9J2fxe5jhBJTXAK3Mc13kC2TP4J4cc2nF6/YBBLv0+joHy?=
 =?us-ascii?Q?Le7vykYk+O2PUTDGKsgHLxM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8e4d2c-ffdd-4a35-c825-08d9b56bf781
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 08:15:56.9311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDhBHtyBS9ccHWu8hrxMAv60O7vpI7JXzPbOjNPIAQOq9B/Lg+5EMxdJjAGRqsNNSDyv99fs8ePO5KmBUkmkaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 01.12.2021 19:33, Andrew Cooper wrote:
> On 01/12/2021 10:35, Jan Beulich wrote:
>> paging_mfn_is_dirty() is moderately expensive, so avoid its use unless
>> its result might actually change anything. This means moving the
>> surrounding if() down below all other checks that can result in clearing
>> _PAGE_RW from sflags, in order to then check whether _PAGE_RW is
>> actually still set there before calling the function.
>>
>> While moving the block of code, fold two if()s and make a few style
>> adjustments.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: Perhaps the dirty-VRAM piece also wants moving down a little, such
>>      that all three "level =3D=3D 1" conditionals can be folded?
>=20
> TBH, lots of the layout looks dubious, but I'm not sure how worthwhile
> micro-optimising it is.=C2=A0 This particular rearrangement is surely
> unmeasurable.

The point of the rearrangement suggestion was source tidying far more
than micro-optimizing.

> Fixing the (mis)use of mfn_valid() in the logdirty infrastructure will
> gain a far larger improvement, because that's dropping a fair number of
> lfence's from multiple paths, but it's still the case that anything here
> is rare-to-non-existent in production workloads, and vastly dominated by
> the VMExit cost even when migrating shadow VMs.

Quite possible, but entirely orthogonal to this change.

>> @@ -661,6 +644,25 @@ _sh_propagate(struct vcpu *v,
>>                    ) )
>>          sflags &=3D ~_PAGE_RW;
>> =20
>> +    /*
>> +     * shadow_mode_log_dirty support
>> +     *
>> +     * Only allow the guest write access to a page a) on a demand fault=
,
>> +     * or b) if the page is already marked as dirty.
>> +     *
>> +     * (We handle log-dirty entirely inside the shadow code, without us=
ing the
>> +     * p2m_ram_logdirty p2m type: only HAP uses that.)
>> +     */
>> +    if ( level =3D=3D 1 && unlikely(shadow_mode_log_dirty(d)) &&
>> +         mfn_valid(target_mfn) )
>> +    {
>> +        if ( ft & FETCH_TYPE_WRITE )
>> +            paging_mark_dirty(d, target_mfn);
>> +        else if ( (sflags & _PAGE_RW) &&
>> +                  !paging_mfn_is_dirty(d, target_mfn) )
>> +            sflags &=3D ~_PAGE_RW;
>=20
> This is almost crying out for a logdirty_test_and_maybe_set() helper,
> because the decent of the logdirty trie is common between the two, but
> as this would be the only user, probably not worth it.

I'm struggling to see how this would improve the code construct without
altering the behavior. But then you say anyway that introducing one
probably isn't worth it as long as there's just one use site (and there
aren't ever two decents of the trie, so there's not really anything to
be saved performance wise).

> However, the more I look at the logdirty logic, the more it is clear
> that all the mfn_valid() tests should change to MFN_INVALID, and the
> result will be far more efficient.

As said - an orthogonal change; nothing to be folded into here imo.

Jan


