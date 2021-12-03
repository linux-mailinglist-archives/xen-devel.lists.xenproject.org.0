Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5154676DE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237454.411856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Ak-0008NS-9t; Fri, 03 Dec 2021 11:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237454.411856; Fri, 03 Dec 2021 11:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Ak-0008LV-6Z; Fri, 03 Dec 2021 11:56:14 +0000
Received: by outflank-mailman (input) for mailman id 237454;
 Fri, 03 Dec 2021 11:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7Ai-0008LP-BB
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:56:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd770355-542f-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:56:03 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-VGXj-yWUPauVY41QXSOpuQ-1; Fri, 03 Dec 2021 12:56:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 11:56:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:56:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0042.eurprd05.prod.outlook.com (2603:10a6:20b:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 3 Dec 2021 11:55:59 +0000
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
X-Inumbo-ID: fd770355-542f-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638532563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKi+PArMQpts+Kuwfjj5NwY3kQsFfC1paZ0n+CyD3jU=;
	b=dtVW56+dgieow9+jCnO6rQuYdk19GwqcKa8v2eDr8mpu3lQ/bh0Hq+W4Dn2rt0IETGJmtg
	XmcZAoj+kUDIuD9WS5bHlOlkLeEz+S8grEexIn9BMAsyqR+viCU7WQNsmdGKqbIDh5wnVl
	aMCioByxC0tfi3B7HZXs9TeLiHvgyRE=
X-MC-Unique: VGXj-yWUPauVY41QXSOpuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXpJYtAYhzw0CWJAq4mSvPzLrfq9+MEFpvGPsNfXmRQGAdCnhc8VY+57CHWE/DhWfjtQKVbdwsZQBA4sYYPhOJKH3kXBVOtjWywx28hJDVJQ6euVs/g4aoblWnLda4aaTdU2Cp5AFglXmWBgxDcvRKk62KLgYRFe3ZXbzgolZ5lB8zb1O3W1eZQXFaLh8JzCT27gXTuoG4k3zABKq05Hj+C4HwCO9/ZTII1zRb0KtO+5iSKRKf44vgGUeJY/NV5BH5oFPH7x31gkAmYcs3jNgV6GYrcKMkWVqFc2dQDMR9g2Ujz0k17l+cgfuwKvj6cs7QvZ2sqzc4arackn3AsCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVXn41K2c2U1kGH5e7upCj/T3lY72QTk8lKOWSWrFDY=;
 b=YKdCYMxeHqxHaWiItMiEODWFbgchR29nHb7eFjEZSEOHg1VC4PiyyLcw96m2hkCp2r3tcqNFDnaOjSP1itSbYp7P7o50hTDRL7+D8xbnBkOUSp7QBsN259a82T1Cv8hUMxXIw5xWiaN2lPy2TilscjkW9QY7h+YU89vzfuh0/6NQFUIBkOtta4G5UYfD2+EkEV6XQ3qfNl9p9Pq42iE29iop6bkKA+EG3H0WUmasMwlZ1FH/woBHmeGOdIyAV8i4HZtrJhjZNOtHJMEj1pvE/3ypmO8ObmToJnDLrbRywEta1C50LVDgBWbIhl0n7/1Mg4urwQW3DbVWbQfocFI0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb2f1d15-199c-b7d9-5a3e-70563e927cbf@suse.com>
Date: Fri, 3 Dec 2021 12:55:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] x86/HVM: permit CLFLUSH{,OPT} on execute-only code
 segments
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
 <53d783d7-aa53-f2de-6aa3-bd266f176dfb@suse.com>
 <c375875f-0a21-e02b-6a2b-63ab91451373@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c375875f-0a21-e02b-6a2b-63ab91451373@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0042.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2387f8d3-8b32-46db-69ea-08d9b653dfbf
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960B2915A5F8FF555E15A51B36A9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LzpDjFDNy/4tgrj/jWh92R5/kYpAb3IBwVOGLx86mJFkT9FJ/hztXG8ScOkamFKjfWVXHPUSzFE7GqEuHzmWUUKORB9ETROTixbl2AHiG+trXM8g4DlUKJUMmQgTqgQP6VOiy+U42p+YrlXjCcqccteN+wl6GIvaLVuAFrzyqY10Lm2HOpZLS7zm3v6M2q2FJjbKE8X5Lte1q4NuFUef8a38rWMiH28kApsoQV2w9UzZEVMc8ar4R3S2BgaxeA4osfUeTocsK029a7amIubfBtzbcg1OHBaTUFGv8L4wpBp3srCjil3Dj0Ykx6sP+6rLosG8WtBUT4oVy887t59vkcDufnn5ze36mOBcNFJgnqmPj0QGWDmPzL7pYxnsFb8qrytMXCJH0LPAFZkDLXf+HDcWFbbS4RnqYqR4WWlUrZ8AknPXcEQ8YJpBawII8j8JmKIMytTIb8le3kNsiZCLLMIdKyXWEVxTr2Tp+jYW8zmQaSiBXrYLX/Lg4iPkrnhhoxHoKesWlQMeNovTTywiEQHKDbD+Ciaiw3Lx1qnrUcYhfgrpP8tuLtW+vzSs8o8EnxTezPZ5fk4O866n7aqU5VdQHd6c+2F0tVjfSLoWoawEb72VudBaxJEGDewp+ZLeoz9gNx4HbZqKxyxmcXz8QBnznTXbj/NLLndPMfrADhvbFFTAnLPIe1cUywM45ghVniqUCIof8WYRLg7Xf2E3fIQKe1wnwOelIx4R8aYST44=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(26005)(2616005)(31686004)(31696002)(38100700002)(316002)(54906003)(8936002)(16576012)(110136005)(186003)(8676002)(2906002)(36756003)(53546011)(86362001)(83380400001)(4326008)(6486002)(66946007)(508600001)(66556008)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kWzOjoPjPX0iNZIVtTuV11+kd8VdY1KJWOfOTHUoev8lhZGSRUWoPlmb53cS?=
 =?us-ascii?Q?pYYWgjvmUj1LQT5zv9C8VlDElR3IYRC10xpSyaduojVBY56nGDUYGgrE6cdR?=
 =?us-ascii?Q?F2DgZSFAXrfXMEMAi1ECFDsJe6uJ1nk2mK1xcHGISsz4vdrvjICJNC5pxlQa?=
 =?us-ascii?Q?Vdq2EvoHSCJIDbeMvaCEkxebL/ft1blXuP9GRMQARUJEzcZnQSQ2OcwJxQ6X?=
 =?us-ascii?Q?2tA3DO32//+7D2eq6h8QxFvcpAuMrRU0lpzQQ03Zb9BE6vSEtBYKi+VXT4Em?=
 =?us-ascii?Q?Jf14Glxqop/24YxeHyqFfx1Nf+kWiswQEur2PwIhEX9HtfR5c/n3vt25W0+L?=
 =?us-ascii?Q?3o1lml7KWlLu3lDhDkq6lKxfOOh85FAjdnr8wCF7N+GwqtkeAs7CIOdSFKLg?=
 =?us-ascii?Q?9MJSOY+8vRs0g64CK5dH9KYMJ4HzcujyCWSznJpWld5XkrjiXYSErcmSIYxm?=
 =?us-ascii?Q?jpK+ae/mHcXpfpTZywIQ1rKQivBcVnb+2ILfR/m/6NfZvmWMUbfP+SaV2cHi?=
 =?us-ascii?Q?vYe2cr8illbAejM0fJT+IrE12rK5kcJDL0Xe5h922zXZymlwcVzb8wF4Vm3N?=
 =?us-ascii?Q?cb5auQ2KkL07dzzj8AcBFRNDVtM1f169onuW/J77l6NbkVdG7O5iobMVbUJm?=
 =?us-ascii?Q?ZTUPo5lK74JnwPWnx4yKpS6sVAERmkAptGyqXKo2JpspQd+wF0ooFWVC6GrF?=
 =?us-ascii?Q?CYa29NjuBfCffu9avNwbgCtjNahchzUa8PM0B/ib2KyS1xwU+gRcZuUy8joA?=
 =?us-ascii?Q?rodg1Gxp+58q2h4MW8NhkjsjZdvoN1ylmBUJdIeAH3TWkA41rJ6NQi3EidkI?=
 =?us-ascii?Q?uJl++C3ZOcB/VHWdio1b9xdJoCgAZKq7mNLWAy4Q2NnW7fCePRUbZU6dtedB?=
 =?us-ascii?Q?0XFOSISN8svygGLpHGfikKiLGjxuDo56ApiIaWBxi7UmnppYc6gGedzj5qXK?=
 =?us-ascii?Q?4XL69+YUgdBDpyxe4fxK7Kz2zMWlk6PwBI47HPe/v4QPeF1bsnOkWlXWDUAR?=
 =?us-ascii?Q?55JQsuYpoy5vFAHxmfjArfZ0xjXkXlXAZUzi2NPOUi5Emx74sBFvAU3C1vnS?=
 =?us-ascii?Q?0TEg8VaC4+7jVcKXB9HnODUrYJGMVbcG5NkHdPAU46TlGfeYW8SRgjNf7bz3?=
 =?us-ascii?Q?APgvQZ/FL/+v0fFHyqnzUEqBzcMZGs53E0q39+RSTNhUUMKQ+Net7xLQg3x/?=
 =?us-ascii?Q?Tcaz2fJX8SuQbo7ElSRZKUIo/mh5WgC5qZpg5NvWIFju1PxyHC9dNxnvQI6Y?=
 =?us-ascii?Q?6OlwncJGj/MF8XI36CjZqmvx3t+XgBk8YMaHj6LZlUCc2DGk7UjTX/7m4RU8?=
 =?us-ascii?Q?NxuIQSNwGBdLkzvpQi5jAOuWlT+uPa/J3+rjht2/1nufb+hOj/CQdpr+vYbX?=
 =?us-ascii?Q?+245YNrh7nIs3i+Wkslg97+y8jT1PNS6+GEXjr71wjcdG68Exj0aoIT9UBl8?=
 =?us-ascii?Q?N3ej232OI8jpcZ1jMYOmEsxDdphvySklhMsoZGyE9J6M+eEIJE9GF6AEThLM?=
 =?us-ascii?Q?J4DD+NRNBbTSMOcGjtIaN7BWXKVqBBlMI/jtRtcD2jPTVt9cnek1fonRrXKu?=
 =?us-ascii?Q?ke5KcPGPn4urAzXIJ4Zphf/S9A+oErd6bf0XX/QOWg1hjccqcbKgQsVThNuG?=
 =?us-ascii?Q?ZSb/EAAAiUp+i5khAAq9FB8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2387f8d3-8b32-46db-69ea-08d9b653dfbf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:56:00.3239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIjKiehfxsYSjD5Ua8lM6u0hV1YJAoKlt6XMB11IojnARgqjwSq/usUcu7HkdvGXoxu++q0LmIMBpzfMupu2zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 03.12.2021 12:48, Andrew Cooper wrote:
> On 03/12/2021 11:21, Jan Beulich wrote:
>> The SDM explicitly permits this, and since that's sensible behavior
>> don't special case AMD (where the PM doesn't explicitly say so).
>=20
> APM explicitly says so too.
>=20
> "The CLFLUSH instruction executes at any privilege level. CLFLUSH
> performs all the segmentation and paging checks that a 1-byte read would
> perform, except that it also allows references to execute-only segments."
>=20
> and
>=20
> "The CLFLUSHOPT instruction executes at any privilege level. CLFLUSHOPT
> performs all the segmentation and paging checks that a 1-byte read would
> perform, except that it also allows references to execute-only segments."

Somehow I didn't read further after the page table related paragraph,
perhaps on the assumption that like in the SDM it would be all in one
paragraph.

>> Fixes: 52dba7bd0b36 ("x86emul: generalize wbinvd() hook")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> With the commit message tweaked, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>.=C2=A0 Far less invasive than I was fearing.

Thanks. I've switched to simply saying "Both SDM and PM explicitly
permit this."

Jan


