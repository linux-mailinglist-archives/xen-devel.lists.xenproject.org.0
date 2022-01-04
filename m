Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC2483E45
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 09:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253036.434003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fJ5-00074z-QP; Tue, 04 Jan 2022 08:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253036.434003; Tue, 04 Jan 2022 08:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fJ5-00073A-MZ; Tue, 04 Jan 2022 08:36:35 +0000
Received: by outflank-mailman (input) for mailman id 253036;
 Tue, 04 Jan 2022 08:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4fJ4-000734-9g
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 08:36:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bbd8e92-6d39-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 09:36:33 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-w20wyXWQP42WbpX_o3O7OQ-1; Tue, 04 Jan 2022 09:36:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 08:36:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 08:36:30 +0000
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
X-Inumbo-ID: 6bbd8e92-6d39-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641285392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7e7uM53tQ66bDKQYofGS+EhYokhtuafYxIk1p3lls7M=;
	b=VInvZCMlwOvOKf20gBkw2GlvQqwI/NvJQAGDZCbXMB7PfI6h51INkli0noi9CGRRnBOltM
	abMbxwH7w6F3CEhCUcoIXNkOBS6j4sALxTX1eP6QLdXqP6n+ec4QfhLCaHpJ0iaD0Bkgkl
	js/ZvbIlZXnZSBJeQOOztjObVVwxdhs=
X-MC-Unique: w20wyXWQP42WbpX_o3O7OQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF0xNiOly2iOCDF8u3a4X7VpK4TtfZMYa17QgltEwSDaMZfnK9OR3DUnbmbQH/j9Ryyn/GZ40/gRAB7qEBzqU/SnVysorQHAGzeZfDtNePmEralZY9XrvaSzOf2DekiXwTAz2rAWMeu/LXmrGYxo5ZIoCWbx0aCJNV7sd8iSvwlIMbHASAu7uKWso+h93qGD5rXt+RQai7YCVAKCBEWcLq3+68Pw1U6eFPEJ6TJjdFmBCMlVRpGGEYNPsAydBSi52KVrUaJlSbr2qqJilAEGrCQh+CX+bx1t1PBY1Rntty/0odEsurKs9XtWerGbJuj9/FXxvjPyRyTbBPhGkvlPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpQsfbIUKNADYn4xQbFMP5g6k9UvD6FXJBy+vmou8tw=;
 b=M9qPOnRr+ytcJghIzv7eFBHuOuv7+wHOH5W3O4bSnVfyyD2A9dLnae+FskMgMhhj+c769NkxGOoVaWBh2FIEiU6XabwpVhcCAJqoJ8UkwuBnLquZDaVzI4hnPIbGa6yLgu0CI+DjCoTi3UJYgsUEHgvsG9kguQx07/f6gzyBHacedbTcWXQLLpTGTzAkiggYg2dhpNhsUe4dP1nuch4UOClv9BbZZKhmMXjZBgEPsC+GpbzHeUfpSVfTT/AmHQzvgynRjPDPoY9kVIOkt6yNW33C4n7R8WM575nkGuG/glqltDtStOyw3zr0a+bypuIqHRyEEib+4wp8kCI+qmucTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b4d9543-e7ba-5664-effd-03fc6336f898@suse.com>
Date: Tue, 4 Jan 2022 09:36:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
 <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
 <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
 <6548d378-aaca-2efd-2194-7725aaf0548d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6548d378-aaca-2efd-2194-7725aaf0548d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0404.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c9dbc29-d9a3-4cbb-2f9e-08d9cf5d4e6c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6302A60921FD7E2FC9E7AF63B34A9@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jAzV9LJvg7Qfm/fmHaf21K802CLiIkEbgx8hU8f6v1KKMeWD8+anl8AbGvYyAjrgTcvuDJaCoZSJe2pFik6gr3b6X41zE+mn9sQkAcQH9R6XtrXEuFlq/YuFUlf1gOyemRuxht16F0nc81Us0tuoRX5dnUHwVYdTfimXhWRTrek1wN8hyvpacOQ/1TjFiQLTINhZgWbXm3P1pxGir//YMX5+2OhSPJjkjh7jqxGzeuRitF2mtDJ1T6jWlo0PWIpMLJioqAD4Y0t05jgwbCELynTj/BvWzc16ewHcZ4DRhkZfo3RP1VDg+q9yHcKeoA6vPztW6qz23AgQESmwE1vear/QJGyzl+6ZnOMp9QfKimY0DODEN41efYYaZrPs/MAlOl7wBA9knsEyBoeFmRoIr6N9ixP97AYoKYNVADuZ8LfVCbK8YgUevAOz4RLYNaxoms/MnKnJ+obI8kP05fnF4PqW387MP38WD95akZXW9z26HbVNaePJJqIdrSShRq8BEidXlyOIfj6eEp2GfN+yGRFSQSXIk3kawbI/qstMM+PvVw+92czi8PpohlOPYNY8SCt7oeXR4EyvofYdV6AkQtPM7BmlCXE78cle/pMS76CwqoeaTrAeJ+fcEIXRHDXt0J39lcBflurXbhD8dHai2GHhEpvPvhxyPw2Y6os0uCb3hXrJ+0yg6bJq2ogqxxk2R9CjNKiPTGinIru4JIRkYV8bnbe5SQNq1yKn+1Ep1ggdakVVO7TOIHo1KOVSNrkwDqAjuD9SZAY7ZUp2uXLxY391keU6TLMwTP8JyCAuxnIEDDqQyYooCw/tGAMwbDa7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(5660300002)(966005)(36756003)(6506007)(31686004)(4326008)(6486002)(31696002)(316002)(2616005)(7416002)(8676002)(83380400001)(54906003)(8936002)(53546011)(2906002)(38100700002)(186003)(66946007)(6916009)(508600001)(26005)(66476007)(66556008)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HfRZjn+N5Lx2qf/4BQitR8N7XJ+5HQK9G4B4ukOL0Y8c2IL6HP7psfyDAT5W?=
 =?us-ascii?Q?waTPj8yrRqUMMsAQkQaaK8rjebmjj2BkezHK40kIIazJzJwWmnwZugEXHHBi?=
 =?us-ascii?Q?U8VmaPPkydpZsw4Wb51zYeVLo7Qo54wDNbpLUZVrlUmU0PzEgaoZEjducQJt?=
 =?us-ascii?Q?q3X6A1XTEMzPByJ32g02mFCtwwxePFbhv3HcEpH6RaQgL+pOqtsGKWcoBy4Q?=
 =?us-ascii?Q?itqwnrNe7C4BvWHskYaaMaZi7huoZ2QzTV27j5q7MdzHKEsE9a8hOBuNpdHo?=
 =?us-ascii?Q?GvT5ZGL/cZxPHjI00dwtuL2ToJ6BcU/8wtq62gT5tiwPtaxRTIyE8/e9qydZ?=
 =?us-ascii?Q?Bv6PNYui3iaQoycNelcdNQ4MRpay57eXWw9CO55d4rbEwO9zlX18dlo7Nsqw?=
 =?us-ascii?Q?djenm2+TzfyydyC9dvBrsq7NQinVKxdjdTqqawHWk3xWNOlJWwXLGyA8dhtg?=
 =?us-ascii?Q?+mxjnZaUK6yoA3rdhcSOso2cHHwEmxG5PwKsDue/tFNUT6oprmMq28zKkmvZ?=
 =?us-ascii?Q?WQrr+fwfhYvqiN6pov4mWq/YPrdKRB8WuAg0pyf6+GYV4rjkQZ/BDRrEAeM0?=
 =?us-ascii?Q?OXsRrLXnspuQu1ZkIVBgm+9V8IhU5FJGI8ew+rHQPkgzYaqStzc4qXyPim9v?=
 =?us-ascii?Q?YlZa4JGz6fTzNpGX3/W3trBKrGEWhdIGlIvSr/kZULwsnI28mw55Dyk7MHZA?=
 =?us-ascii?Q?5+0m03+V5E0D6owv0dgQqza81eWE8+wpzQDmfDO9++x/3G/yhJI+vj06kVpk?=
 =?us-ascii?Q?DviI95MueoUBXgVjl1pVTSlNAaFSNRbqaII9Ty+ee1iorE2AhH3ccFysnyp7?=
 =?us-ascii?Q?lHB4Gbwf6/FXQuINvNU7ukYEL3E0yLf05IMIdFYh1G+7EHnaNH4IVtNcKqtM?=
 =?us-ascii?Q?NgVHasCBMoKsrK8geiPWdLFolTLWDrj80Ftgw2UTYweWYirBkquqB01lY4U3?=
 =?us-ascii?Q?mUnGg5gHjrA52JmDq4gi8uAvj8ojp5XM15swqVRYUZ8GTDIOzYEQwdBtKfvG?=
 =?us-ascii?Q?kmfiYknGkIwXmk355PUojMZRMiymO8HlI3H9myJlfC42vbdC5qkUG63zO5Wu?=
 =?us-ascii?Q?79Lr2LbVgskYEictBudGRA+JxB445MSkfEnX8BejgNcCpGFd76uX1trgzJrY?=
 =?us-ascii?Q?21JW2ZmPm4w/gBQ9pOF62Z0Ca9LV2VzSZE4Db8ZyYAuxF+3Y2+6X9Q0Muw/C?=
 =?us-ascii?Q?79nEfWJu2PEjRAABIrqhI14IXfm1DiGc8LEXEbtBZ2yYodZxP3H26tWkp0UT?=
 =?us-ascii?Q?syrNZb+kHlM2+YUams1i5Tc0y/NeKSninMThUEowys7bljehLqjcV3ZDvDlT?=
 =?us-ascii?Q?mOv2EUqKLLSanXO9g7xLMM9C0SxG322Fhr2BCGiKXNUmZM1n8cX+aqB1yksM?=
 =?us-ascii?Q?DF0C4moLp0TtYyCJleFQOlg2HxO7aEtstv0xD2MND4uoZMI34kRmpEf5Rtsm?=
 =?us-ascii?Q?5G/S9Vg7hPL+2M3PHTPMzsunvbtRUFhBd/yU/Yj0SpFPMB9GuNIkvz6OUg5t?=
 =?us-ascii?Q?Yk31dab5j30MGhufdD6u52zAYEVdXpMRGVp1EvthJzkfAs4gJJL7YKosS0B2?=
 =?us-ascii?Q?i/3FuXdNPWlTh6qJF543FyidwfwiWlFvythQuwezJkkQ5wCJ0QH6AYvnu6+a?=
 =?us-ascii?Q?34dRp5SAfBKO/kC87J+CKi0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9dbc29-d9a3-4cbb-2f9e-08d9cf5d4e6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 08:36:30.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI5h7zpfB9qqeTrAFENfExV9PwZ0Yrdtr75tMlpOWv4xPCY1z5ffolU6SUbtxEovTiqB1/Dmbq63ocdzgYdrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 22.12.2021 13:44, Oleksandr wrote:
>=20
> On 22.12.21 14:33, Julien Grall wrote:
>> Hi Jan,
>=20
>=20
> Hi Julien, Jan
>=20
>=20
>=20
>>
>> On 22/12/2021 13:05, Jan Beulich wrote:
>>> On 22.12.2021 11:01, Julien Grall wrote:
>>>> On 14/12/2021 17:45, Jan Beulich wrote:
>>>>> On 14.12.2021 17:26, Oleksandr wrote:
>>>>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int=20
>>>>>>>> order, unsigned int memflags)
>>>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 void free_xenheap_pages(void=
 *v, unsigned int order)
>>>>>>>> =C2=A0=C2=A0=C2=A0 {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct page_info *pg;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>>>>>> +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!in_irq());
>>>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
 v =3D=3D NULL )
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>>>>>>>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 pg =3D virt_to_page(v);
>>>>>>>> +
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memguard_guard_range(v,=
 1 << (order + PAGE_SHIFT));
>>>>>>> ... this really want to (logically) move into the new arch hooks.
>>>>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>>>>> notice there's some dead code there on x86, which I guess I'll make
>>>>>>> a patch to clean up). But first of all this suggests that you want
>>>>>>> to call the hooks with base page and order, putting the loops there=
.
>>>>>>
>>>>>> I see your point and agree ... However I see the on-list patches tha=
t
>>>>>> remove common memguard_* invocations and x86 bits.
>>>>>> So I assume, this request is not actual anymore, or I still need=20
>>>>>> to pass
>>>>>> an order to new arch hooks? Please clarify.
>>>>>
>>>>> Well, that patch (really just the Arm one) effectively takes care of
>>>>> part of what I did say above. Irrespective I continue to think that
>>>>> the hook should take a (page,order) tuple instead of getting invoked
>>>>> once for every order-0 page. And the hook invocations should be place=
d
>>>>> such that they could fulfill the (being removed) memguard function
>>>>> (iirc that was already the case, at least mostly).
>>>>
>>>> IIUC your suggestion, with your approach, alloc_xenheap_pages() would
>>>> look like:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < (1u << order);=
 i++ )
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pg[i].cou=
nt_info |=3D PGC_xen_heap;
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_alloc_xenheap_pages(pg, 1U <=
< order);
>>>
>>> Like Oleksandr said, the 2nd argument would be just "order".
>>>
>>>> The Arm implementation for arch_alloc_xenheap_pages() would also=20
>>>> contain
>>>> a loop.
>>>>
>>>> This could turn out to be quite expensive with large allocation (1GB
>>>> allocation would require 16MB of cache) because the cache may not have
>>>> enough space contain all the pages of that range. So you would have to
>>>> pull twice the page_info in the cache.
>>>
>>> Hmm, that's a fair point. I assume you realize that a similar issue of
>>> higher overhead would occur when using your approach, and when some
>>> memguard-like thing was to reappear: Such mapping operations typically
>>> are more efficient when done on a larger range.
>>
>> Yes, I was aware of that when I wrote my message. However, they are=20
>> not necessary at the moment. So I think we can defer the discussion.
>>
>>> =C2=A0Since that's only a
>>> hypothetical use at this point, I'm willing to accept your preference.
>>> I'd like us to consider one more aspect though: All you need on Arm is
>>> the setting of the exact same bits to the exact same pattern for every
>>> struct page_info involved. Can't we simply have an arch hook returning
>>> that pattern, for generic code to then OR it in alongside PGC_xen_heap?
>>
>> arch_alloc_xenheap_pages() will modify inuse.type_info so we can't or=20
>> the value to PGC_xen_heap.
>=20
> I wonder, can we apply pattern here at alloc_heap_pages() when=20
> initializing type_info?
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;f=3Dxen/common/page_alloc.c;h=
b=3Drefs/heads/master#l1027
> If yes, the next question would be what indicator to use here to make=20
> sure that page is really xenheap page.

Technically that would seem to be possible, by way of passing yet another
argument into alloc_heap_pages(). I'm not (yet) convinced, though, of this
being desirable.

> I also wonder, can we apply pattern for all type of pages here (without=20
> differentiating)?

I'm afraid I don't understand this part: How could we get along without
differentiating Xen heap and domain heap pages?

Jan


