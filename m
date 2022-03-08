Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FA4D15FA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 12:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286736.486366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXo8-0003xO-NN; Tue, 08 Mar 2022 11:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286736.486366; Tue, 08 Mar 2022 11:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXo8-0003vB-IR; Tue, 08 Mar 2022 11:15:12 +0000
Received: by outflank-mailman (input) for mailman id 286736;
 Tue, 08 Mar 2022 11:15:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRXo6-0003v5-RQ
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 11:15:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03eb809d-9ed1-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 12:15:09 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-NY11hhkjN1CVQt-E1YaOgg-1; Tue, 08 Mar 2022 12:15:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 11:15:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 11:15:06 +0000
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
X-Inumbo-ID: 03eb809d-9ed1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646738109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVWf0j1ul/b8eWM+/zvX9t0+8MWqS6GYuUB3LBGbqaw=;
	b=UoJCos3MaeNFuyQAQk9yTbKW8612ZTuVeDB169OfcF+v4HHRtv4GsLpf/ND9adZsiE7t0S
	qZw7U5hIY8uvs+/Uw06rr1P17ZFBsyqyMfMyWWtE2LiqKNXWbagBuuIM9ObT8Gorviq754
	/VSnywG8o2rMcZmMqHrSbjHj7F5w/h4=
X-MC-Unique: NY11hhkjN1CVQt-E1YaOgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFjvGWtOznCEApT9yoOh9SGx8t7efnjNoDxRf5RrYfzD480sUq3LjyMaf7plyr/PR8UCpp/WCFQk6/UZHyNG1rURnZpxQ95UeZ14AD2E7AasXHwHZQmWrAoRDN681ee2Cs8lfw8qUk7Od7dV7NxLTyOtRrUQtq1hoNHiUxwJb94QCDVpUN+dVi6WxcxcUS8MRGy3ru1gtfuVoeWZFn8gVB8XCbGUrVZ9GZUtBo+9/NuSK2NpvwJ3v4Whis8HObkNDfmLtjNhCHOJ4fQgkLtLvi93mzouoUCNMbNmscEcjWYB/3haJoaoWvmHAcXtYXRyu041HpT/CWeB5HdyNT0EMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLAE1rUwTBXWLXmGNuBMDWnAuUZQaR/HNcqv8pX4qD8=;
 b=RpSBP6kC5vcpQANt4/yfTKQlcS4vVbdv2ClKhmOXkWX2wB/5eRUJHMk5z4/YoXSex2jg8jUq9GFllrITYHV6bnwS+FgtvFGA69Js9TUlxtZqDReFb5r3/i5w6REj0IcjzuVTWhrE3xWxsikaiHwslaLzWFAA8SZWr07MFnKj4B978BK2sC34jqkIMc1Q7dJKrmkpzv34pD54kTCj6cyHhHiHHh1HTWYp2ERX3l/STgLqmkyJ9Pg38TTde7MVEx0Ie6QMCMggQO8B1e9XSrgBxeKb/FNhfNLMMVWypz/I52AmqFAs2AOjdLF0CDIrDmYovRQkgIi5x1ftaFJOGz/9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0cde8972-b357-e2c0-ccc4-a0720cfb3501@suse.com>
Date: Tue, 8 Mar 2022 12:15:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
 <YicsK8xqdcGZYaIn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YicsK8xqdcGZYaIn@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0193.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b87d31c-07f9-48ad-5658-08da00f4e67c
X-MS-TrafficTypeDiagnostic: AS8PR04MB7703:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB77035C6BC6CD1CA3EED4A9FDB3099@AS8PR04MB7703.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bkk1sGv7bMeYul4xXBjdINyxfu2E76LxbV30nkCLmLlfQMgLQeMuaZAv3+y6ix+wexlkV8o0duzTWlyReYGnDwZufKKQAdN9ryfIsXjr2cmwbKCWRlMJ8YhYpPGtn73i0hAYBJ1fAaaRXUIYauLXNyPqsxW9vDe7Gl680BKCnqLaBdbQnbR6nyX4su6tCLxxE+GuDcHIh+oclAT0euzWycri1PAKmOv5ipWVp2JTnP0qia4D00XbE8pbi0e2ET6g42CfxZ5vXuT8b/NCRrZ+l9GP4bliyNogxg38r8reSi4wHkKLu2X8zs1AAN5jScST5cvGA+ao5mBJCbxq/jJV03Fgd3ZeI0p9x7MBE2+ku9dzxhxRDgbk833jQk4T0dpa9qGiLuuI82csWt8YslVaGgOVgv+mBqZx/2EpDzS0Js1yqmP5azxM5Pd5NzL7p5GWoy7/HetFyQOUytyZlhpHLQGF3C6zs4RSrw/xwaUKj5c8NhblrJ27BwcBsVy7dPU3aDsa0CDqSykTYy3xPkUSRTMu7qGaTzliMX7Eyg7Z46VoyBNbHtfDgRuJKCN/60Pxxmg5PC3uMV7irYq9GFmoAYqmgqmNVzlrm4naErz7w4ijSRys8s2TidjJg22ixLY2YBu96xeOB+ewyemqhqBnaLi+KevBoSU93rwiQL0KMB4ipZyJg2mBT89adss9gtnAKS1hXpo0qi6DgBOu8YQd9ErsSm47PdBQCeWPprR/fsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(86362001)(83380400001)(31696002)(6506007)(316002)(66946007)(31686004)(54906003)(53546011)(36756003)(8676002)(4326008)(2906002)(66556008)(26005)(2616005)(66476007)(186003)(38100700002)(6486002)(6916009)(508600001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H8OXKbTZ3x86UPEVPv5SyGeo8L9M+T/CKBCCCTptVPYCMBNVGdP+kzKAKF2M?=
 =?us-ascii?Q?B2WOPJyuyoGdn+QmG9lvLzdoUrIqMXLJc6E2mD2VNzkEs5x0GOlKzhd9Fb05?=
 =?us-ascii?Q?z3/aWcjMPTXHDFIHgQ01qDte7w5kBMOTpCupGMMUBt2yi/sDeMBEFah0XA7H?=
 =?us-ascii?Q?WG/Gd15mcHUMYXbGXpE43OPzHWZupc4Gor1n8BtCgcHoYzVPl1CHqvD0HmR0?=
 =?us-ascii?Q?hCW/r2tshR0LOxd7nc8j0k7C5GaFNyCN/AG4jEF619ePvFpYPeKNkgtB8CVb?=
 =?us-ascii?Q?2cga/lutO/XnAMn5pxGPxTWbwOPUKnHa6Mvc5CXwuZIrbE4Sr5eOaGleIxZH?=
 =?us-ascii?Q?YDf9PLD27cjaCr4Vfr9qM3K05ybb6kX4lYgzqxmfRbRb5ghFgvHysxMukIG/?=
 =?us-ascii?Q?2edSohOdJffLSlLnq4Hqq+ZlFToQ7etCou3WQdBhZSXurPyX/OljLxw6FhU9?=
 =?us-ascii?Q?epewmxpQI3AIb3oC9ZKIMYri737EH2UhMXeAfEwdf0g4QrR61YLzIIft4vGn?=
 =?us-ascii?Q?t/Yp8+s5HPXHXE5Q9mQXdL0wg/R8TfwI73xinRtYdKruekJ5BmA2ObJfaEsE?=
 =?us-ascii?Q?NIGowf0dE41P8kMYmMciHILjGJJ1Kx+/43e9OO2qutRTN226uNYK/zBlltd/?=
 =?us-ascii?Q?nWVI+VVbKtbnxfDVMvI573DpytrveH81EwdFoutrkAIXOzk5bN04hAi3KyJQ?=
 =?us-ascii?Q?J/64YnN8DkusY2bRlM3l28T2luycXUHblCFPSMJaU29fc4wFZ3WqQraGqaDw?=
 =?us-ascii?Q?j8M3VCJi7xRxir3quyxd7Huc5MpvospSSQseivZgyKa1E6XVwNfJNVN1NwVu?=
 =?us-ascii?Q?undgwK2C3MNHrOQy2oTQQBqgUZPPeioejGm3ayDXu9QgjECPrvDLvV9yms5E?=
 =?us-ascii?Q?UfbG9C+6bxF3Y1KocLaSBUwziHxcnSf+MlhKlt74Xppw+v4jh52LP7TCTis2?=
 =?us-ascii?Q?LLT5xVKRWs0owIzato1u4V6npGqggw2k2/F71l4R9UFEKGi09+KMGoZQ6cQN?=
 =?us-ascii?Q?8JOHqjtm5HFEcbCWk1gyuPzBEITjjDZrfrTi31OvqxTQeeSuSKDmMaX+pp/u?=
 =?us-ascii?Q?iRD5zFXfM45xnfdlcnMRlhLiSDRpxqlFAajkLjvjIh+i1LFcsSVMBgIW06DP?=
 =?us-ascii?Q?fQxWpkraisOTlm8Hlv1K1amfhvzK4vzrS4gqDZtCUR2r2kmUOZe3zqX1xhE+?=
 =?us-ascii?Q?oNxoEN19PWM695s1Jynqg/2HFyI1CD3QPg66mrAJZV8w302WrDF5aDFZ6c+i?=
 =?us-ascii?Q?NqbmXJ8iscbQwaOKAjTvAyZFwv8vRCtbYM2hpbVagsMZaQgeVZX6daAEUrtF?=
 =?us-ascii?Q?eTyhyNZHxxOA3w2SbhF8Lnem/JMCSqURt5U++mM21cmaCJI40D0oipuG7SNz?=
 =?us-ascii?Q?HrG4ARRKqUgDyRzHiUoZNZ5TPcFRRxWVh4+9o53yEZPPhASKY7wl/SOsXyJa?=
 =?us-ascii?Q?B7KWcyC1PCr1vgl0TJj1zraU6+2yOXo1TAHAynLEQ9fepXPU1eIuPg4OAAd+?=
 =?us-ascii?Q?Nxjy1JLJGa9UCOrywQnOPBFRZxk/RVxuIWWQUTNtyaV5v5R3OKMXsVxuKois?=
 =?us-ascii?Q?7XVYfx3XX4SyZ3NCzW2G/QZ+tpCmkn7F7u9A0pDoL/r0MClvgUlkt9RcdxN1?=
 =?us-ascii?Q?g+jWGHGJM0aU6X/ZpXUsmRw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b87d31c-07f9-48ad-5658-08da00f4e67c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 11:15:06.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COs3iOTGi5gQD1G+9ZO9FkvVdZtXHf3D87AN0iLLgOXalk6ngWyMM592OpEsG/DRXOEcwY8mXi9jFRWw+mllEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 08.03.2022 11:12, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 02:53:32PM +0100, Jan Beulich wrote:
>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
>> binaries"), arbitrary sections appearing without our linker script
>> placing them explicitly can be a problem. Have the linker make us aware
>> of such sections, so we would know that the script needs adjusting.
>>
>> To deal with the resulting warnings:
>> - Retain .note.* explicitly for ELF, and discard all of them (except the
>>   earlier consumed .note.gnu.build-id) for PE/COFF.
>> - Have explicit statements for .got, .plt, and alike and add assertions
>>   that they're empty. No output sections will be created for these as
>>   long as they remain empty (or else the assertions would cause early
>>   failure anyway).
>> - Collect all .rela.* into a single section, with again an assertion
>>   added for the resulting section to be empty.
>> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
>>   .debug_macro, then as well (albeit more may need adding for full
>>   coverage).
>>
>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> LGTM, just two questions.

Sure, just that ...

>> @@ -19,6 +26,8 @@ ENTRY(efi_start)
>> =20
>>  #define FORMAT "elf64-x86-64"
>>  #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>=20
> Would it be helpful to place those in a=20

... you may have had a 3rd one?

>> @@ -179,6 +188,13 @@ SECTIONS
>>  #endif
>>  #endif
>> =20
>> +#ifndef EFI
>> +  /* Retain these just for the purpose of possible analysis tools. */
>> +  DECL_SECTION(.note) {
>> +       *(.note.*)
>> +  } PHDR(note) PHDR(text)
>=20
> Wouldn't it be enough to place it in the note program header?
>=20
> The buildid note is already placed in .rodata, so any remaining notes
> don't need to be in a LOAD section?

All the notes will be covered by the NOTE phdr. I had this much later
in the script originally, but then the NOTE phdr covered large parts of
.init.*. Clearly that yields invalid notes, which analysis (or simple
dumping) tools wouldn't be happy about. We might be able to add 2nd
NOTE phdr, but mkelf32 assumes exactly 2 phdrs if it finds more than
one, so changes there would likely be needed then (which I'd like to
avoid for the moment). I'm also not sure in how far tools can be
expected to look for multiple NOTE phdrs ...

>> +#endif
>> +
>>    _erodata =3D .;
>> =20
>>    . =3D ALIGN(SECTION_ALIGN);
>> @@ -266,6 +282,32 @@ SECTIONS
>>         __ctors_end =3D .;
>>    } PHDR(text)
>> =20
>> +#ifndef EFI
>> +  /*
>> +   * With --orphan-sections=3Dwarn (or =3Derror) we need to handle cert=
ain linker
>> +   * generated sections. These are all expected to be empty; respective
>> +   * ASSERT()s can be found towards the end of this file.
>> +   */
>> +  DECL_SECTION(.got) {
>> +       *(.got)
>> +  } PHDR(text)
>> +  DECL_SECTION(.got.plt) {
>> +       *(.got.plt)
>> +  } PHDR(text)
>> +  DECL_SECTION(.igot.plt) {
>> +       *(.igot.plt)
>> +  } PHDR(text)
>> +  DECL_SECTION(.iplt) {
>> +       *(.iplt)
>> +  } PHDR(text)
>> +  DECL_SECTION(.plt) {
>> +       *(.plt)
>> +  } PHDR(text)
>> +  DECL_SECTION(.rela) {
>> +       *(.rela.*)
>> +  } PHDR(text)
>=20
> Why do you need to explicitly place those in the text program header?

I guess that's largely for consistency with all other directives. With the
assertions that these need to be empty, we might get away without, as long
as no linker would decide to set up another zero-size phdr for them.

Jan


