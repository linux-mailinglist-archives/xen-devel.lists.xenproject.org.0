Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16C306407
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 20:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76359.137759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qWx-00034U-2Z; Wed, 27 Jan 2021 19:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76359.137759; Wed, 27 Jan 2021 19:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qWw-000345-Vn; Wed, 27 Jan 2021 19:31:06 +0000
Received: by outflank-mailman (input) for mailman id 76359;
 Wed, 27 Jan 2021 19:31:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4qWw-000340-84
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 19:31:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe3e779f-b6fc-4b1e-9dda-28a96ef3ef6f;
 Wed, 27 Jan 2021 19:31:03 +0000 (UTC)
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
X-Inumbo-ID: fe3e779f-b6fc-4b1e-9dda-28a96ef3ef6f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611775863;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZKlBxVcQ4CKzwnUV4BBQ7dvbEIgN3cNkj7ZiYopdbYc=;
  b=ZpvEhUkCdpHSuHv0qTGmW5fRIQiWEn9cER5jb5aXRN2kPd507gfHb7kh
   ZL6E48VsKz2EXMDl1zwelA7W3cRQIY54yJqAISFoxbVuFc8c3d9vt3oIJ
   FdHNrXFUPC62CdF2RPilnl05JKoTtURqxpryNNaXwB6kONL0eUktcoP0E
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vg3Fakddlt8uuomWlSXtiVrTRkt7J4CgItjyZlNz3N3OyEsNsSmd4y9X93noNdtyMvcFDJXkaw
 C0LMGfs51bXahPjZlwzNeu2EYyibkpjBjzFrj15ykcr+FjE/jvSmuhJ4NOqR/GCVatiP9Mt/b+
 lPsE/7MrP9U/B1NOhziJ5Z3pZN28wFXpmpiBZO7nUZyLusozwYCMIJ0L3kK+HATSZMzruVYGs1
 kRB8orrZERO/T2fNzmloDNdahRLsbKkS6cbqSVl3l+tZDWb7FlaIpwcCDv8nQXca9AnIijEWFm
 5rU=
X-SBRS: 5.2
X-MesageID: 35994432
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="35994432"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g00c+lrPufVxOgbX8LdtjGwm7uFX/iKE8A+ApIQIYx74QFIbA63J/h6qhGvCd/crFbdLOV9njjWqKUdj3hgaLuBAEciey+o6JHBvY2iGGwe7ShsFpHAAuxGMWrVQmxbe5MVXJyKEtrPtuKGjCHWpqEKb0lkonAxSzMY1YBkS1sO0ce4Oxp5s3RJZkXrIIJP4zv2hkK+CmSwJLYVKsuzHt/1M5rXsCyv4ggYBIjgNYKUNLvC5g0tGSpow1ZSL3ceZFOag2Wn3ui07Xx8b6Re4zefZTl8zOh8gzWOlHDzJQSJKWKKZ+ETacXL1L/6+7j6oKIxWLAtxLiUA/cycbFUsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tv+nZ6bBfxFKLATqd1N8XdpA68D6gsfp0skGPdsesA=;
 b=CauAo47SHwadfWU7fC+dR0pQYmdBTbUDXJE9PekWsyryFFbZ+pj+TNOZWgqnYoNISS+yQ9Zs61/J5C6H3KdMf6bgzcNKioN/aTS7ALEFOuVl0EprEvrDtmgk/Fc/oQ0+tE7isRUskTi8Sx0pNdPMmUabM1nHo6fb7Wt1jahzY9IMtn7UuGypbdMSm6kNkXGWCHtJ+N1aZFepVg8b3snf/0e+pB136X1N8SW1odyuorI3JysmX0buppSUQz8mtdkJiDnMNVvtw81CPNQauj+OZ7hLZBO2csASbWgncroRPaP2hwIugvJDsySdPDADzQJsS5Ijo4aLhv/PT6wHDpkVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tv+nZ6bBfxFKLATqd1N8XdpA68D6gsfp0skGPdsesA=;
 b=X1KC13XMP5h+1ttCyunHSZpU1V+SWdd3d52ftItP2PGVpFtyZnXRgaY4aBWjt1mcOy6TvAz8x8HkatwX6MdHBauvN4F4xJ76TPI6FCLR2oI2zTj0hZmFpctrZuyJt70Vel6Ox6V/hbchPqruu8MSLgBvw6dpAXf5uYgZ/4Rmkig=
Subject: Re: [PATCH v2] Fix error: array subscript has type 'char'
To: Manuel Bouyer <bouyer@netbsd.org>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1ef98ea6-9d53-35fe-117f-425558dbb81f@citrix.com>
Date: Wed, 27 Jan 2021 19:30:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126224800.1246-1-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cc1744-460f-4995-f2f3-08d8c2fa1310
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5823:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58231E4CBE229CC8C8A3BA09BABB9@SJ0PR03MB5823.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fG9Q2lh3nMPhuxB+077zayhMZWMI13niUvhf4ZOFIIrvx8C9vTcoZ2UFCuHY1u73KLkN8sUSymhVB/wOU6HysZwyij7o+ap1X+V3Xd/9vHNSVAyJE+q6HOJ+jTvYwd1BJoheq4Vjj8MevNLGQstnrm3h5OHPMbblbvjDRXv9O5XZbqbeKMk04Ck0ZwbL30sqFcfvMJsqfRc3hUonH9rwubqdx12kxMgl0E4uWv/k+M30FpPoR8CybQ483NUCSvV5K8VTcujaKAmEbYlAZ7ynrY1zFjb3POhA3TDSJtUlNWY1BT3ZDWeE5ZLk0/byM7dcN8dxztC7/ZjvA6RLY2cNSieXFbWKC8v4/z7URfACPsZgr68mVABRqYzSImHoYGeRVRwVLXfaC/94Zjze4AKmiWEs9+9DkFvjVIgPfcHaI0cOyl6DcGVrlkaHofFdV/oh+a4UIDCK+lMSs9gxQdudgV0DMHF5JLIXgwvHy87RbBkbsjfef4WfRts7SoMs1PWyZtiQdnkDKYqGGsoBdmgHHjU/0ao4VJrdr0kbAoApzL0IDVQChQhVC8yTb5Hjwj9p5gidABi3ahYCmVFuphvKEBGLemB3A/coEexLebSW8Oc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(53546011)(2616005)(2906002)(16576012)(26005)(4744005)(54906003)(316002)(6666004)(86362001)(478600001)(31686004)(66946007)(186003)(5660300002)(66476007)(6486002)(66556008)(31696002)(16526019)(956004)(8676002)(36756003)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkxhRjlmY00xeHIxVHB1cllVY1dleGhob0tYSU1wNW1UdW03ODVwS0trYnIz?=
 =?utf-8?B?S05sY2gxeUJ3c0MrcFFvRTg2VlBrdzdxYjdiSjRSdlVNbk5kUG1xQzhQMFEv?=
 =?utf-8?B?YUdPcUt1RU9GZnZXNkVXRitFakFXT2F5QTM4TGNjSVZGVGJXdVBRQlRZa1Vw?=
 =?utf-8?B?MThwZUwydWZHcWdIc2M2OFJmUSt0ZTByb2dlbXlRUXoxaTFSQzFPMGNoMTMr?=
 =?utf-8?B?RDFTZGF3NXBsOVN0aTVoa0YrUk9Ka2N0eXZCcEdTUXMxTm5aekJmWjZlcXlV?=
 =?utf-8?B?emw1UFh0V2kvanNYeVZYeUs1TGttWHVMdjh3cHFmcFhnQkxCZHJ0UEVrUHVC?=
 =?utf-8?B?Rmg2Yk11Um5IalJUU01hNFZxVlB4aTNIcldsY09FRHZxUTlrMVU3dGFtVWZo?=
 =?utf-8?B?YlU5MWZycUdYZFcydTVyaUJzUm5wKzhpQ0pTUUF5YVZZRlRsWFVRTzZ4bG5n?=
 =?utf-8?B?UkJGeS9KQlJIbmV0cG5ZZ29vd2EvazZLYUR1cVZYeVVKZnZVRVJtYlZITHgw?=
 =?utf-8?B?NVNTYWdSU2c1WlhKV0pDNVFoNkhhSmZpWHY0NWFNVjBMTXR1cWV6OWN1M2Vn?=
 =?utf-8?B?dVd5SEdUeGlna1pGMFFyMHdiLzNMM1N4NzYxaEtxVUtjWW9tRmYwdFNoTzNS?=
 =?utf-8?B?NG5vU2ZJS3djRkgreUE1dUlZckg4bjlIcCt1UVJBckpiZ0tlM1lWb0RKNTBR?=
 =?utf-8?B?YUQ3cEpRS2Vzd24wNllLSFg3TGZ0K3BCTmlBWkpIYjJaTEpEZWdCYklBbFIz?=
 =?utf-8?B?QXR0M29OQjgwRzdud3ZkdzFuT2pjUVhMRlpnM0tDUlVLSTBtNTNMV0JrdjU4?=
 =?utf-8?B?VCszdE1mbk5nSW9yRTI1SjhIeUVrdWxzOEt0emR2b21BV3p4cm8xc1pGSUQx?=
 =?utf-8?B?NGNGUERlRUQvU2RneUdzS3pTcklmdmw2TnB4VVU4Y3pNNXpuYjdacGxKa3BY?=
 =?utf-8?B?VlFEZlFqZVdWeHk4Vm5IeTZXVmVMZVoxbmJuWG5MN25Id1ZXVjhkREZiODZR?=
 =?utf-8?B?NTZBTm93Yi9aalIvWVpUcW1Oc1JMRGhwWitCQzNwVGtWejFkZ3F2STdiTzh4?=
 =?utf-8?B?ZGZFbytPaCs4amIwM3RnK3JKZDRsSDRwQmNzZDhIQzlYWnFub2pTUkZZQWls?=
 =?utf-8?B?a0dKV1VWN3R2Z3k0L0ZPZ0RLNXgwaWJodGZqSUFRTWU1Sm9mMHBKeEM2dy84?=
 =?utf-8?B?NUNsUUJwQStXLysvUHpLWGRvOW5SRE1yM1BkUVZMQVFxSkpGTXZONndreVRx?=
 =?utf-8?B?SURxd3hIQmlheGdhb3o0anozcy9jM0UySUdtdmRHYXp3VlRhUmRDM2QzT2xS?=
 =?utf-8?B?ZTVONStLOGYvNDdKQlg5Y3l5ZVNUa1lScjVxcnVXNkg5aFZtNG1Jbk5aUGoy?=
 =?utf-8?B?bFI4dS9WNDFmRGh5QU5RUWNoWGpydmpTZmMzS0g1SVNFOERnTmgzUGdyKzdM?=
 =?utf-8?B?TWdSWXZDMjJDZkJlOHJsNGtTaE0wR1dubTRXUFZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cc1744-460f-4995-f2f3-08d8c2fa1310
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 19:30:59.1864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXh292EmBBb6OhFh4Y+PLbJr10cjT43R0pGq4uulnTh0X/YXrgqHk93AbAx3csxD5xUf2LgyCp801N5poi6WjAUmdf0iB2JHayh1dO/bksE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5823
X-OriginatorOrg: citrix.com

On 26/01/2021 22:47, Manuel Bouyer wrote:
> Use unsigned char variable, or cast to (unsigned char), for
> tolower()/islower() and friends. Fix compiler error
> array subscript has type 'char' [-Werror=char-subscripts]
>
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
>  tools/libs/light/libxl_qmp.c | 2 +-
>  tools/xentrace/xentrace.c    | 2 +-
>  xen/tools/symbols.c          | 4 ++--

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is totally ugly, but it is a well known totally ugly corner case of
C.  Non-freestanding bits have to play by C's rules to be compatible.

~Andrew

