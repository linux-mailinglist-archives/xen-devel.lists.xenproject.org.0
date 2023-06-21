Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DF739258
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 00:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553200.863621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC64x-0000kl-3H; Wed, 21 Jun 2023 22:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553200.863621; Wed, 21 Jun 2023 22:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC64x-0000iA-04; Wed, 21 Jun 2023 22:13:31 +0000
Received: by outflank-mailman (input) for mailman id 553200;
 Wed, 21 Jun 2023 22:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zi9/=CJ=epam.com=prvs=0536153207=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qC64v-0000i4-DU
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 22:13:29 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d80d8089-1080-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 00:13:27 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35LGGD8V022824; Wed, 21 Jun 2023 22:11:36 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2237.outbound.protection.outlook.com [104.47.11.237])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rbjagwfwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 22:11:36 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com (2603:10a6:208:4b::31)
 by PAWPR03MB9761.eurprd03.prod.outlook.com (2603:10a6:102:2e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 22:11:32 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::3afc:a0ce:1e52:54]) by AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::3afc:a0ce:1e52:54%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 22:11:32 +0000
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
X-Inumbo-ID: d80d8089-1080-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRShdsX+nLVa31+9OcEPtbiB5Qrpe//Mc5CWczfXXKv/R8KxgfcL+PWU4iez7Oa3D8PVq5vX3IDER16UdHkyS1tFxPjjW3CGnq2gVj0vYD5Rjf2lN7+j6jUY3jTU7xgwlhpnZ0Vu6L+CNBtgh7PCV36YA9GvXQ8FNl5X4P6EkQHeEBV6/CmlzfLhZSIxbAboxGtD9ghGrsqJOqo8ogAgnLIaT9S/6vp0hiOGFWLMearLxfYmrBZ1RrH9Dho1zf0JeeQu61hnt8seGgBxWz0o+SeQqaeaq4RDIwailY6YuV7hliigr5lKADJfi+H6VDODV8/wJH7oJFHiHTQiubKzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6NkDdED+KCPwQTnWsRpLa6snzAHE0PLji6rM/7j8oA=;
 b=H4PMKImk1Vk5WGZVYM6lMrSC7uP0EBfewkqsfUk9wCZsl8WheDJWdPNdfky0UeWByC06ZNtiTDx1OegWTC81eN9bLOwtecOPw+4sE16sJsDWU+JCiiWrZtI7AwgcODOyvTJC6WXcIeIKbDhe8OIARYFNmn/KrMuT/2+dx9QIFolEHg1pPDCWppcp2mTiM031NgmWGSPNbFSr2O5ZyBcY/2ZFXBAlLHNWBUBFP7h+HV07kB3Gcbgg1y/M335ym8jHKS62FuBUBFAcBfBf7fOR/+5J+/VRVPUVXn/gxlEnrPNN+Vdy9dY6e9KN1D8f+Ckce1OtcbwOwkes90yPDAC/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6NkDdED+KCPwQTnWsRpLa6snzAHE0PLji6rM/7j8oA=;
 b=roWgg+VySgYx+zXsQElmU6YA/tmjS6nMMvVxPVEScMt8aP/t5uhJ8MSerWFtQP68m8W8Tikb6+iX0fINTElWKYyEpzTYrrwtkJfQIuKNpoNW/6FeG445WLRymQxrkTEh7dHtxKSh8nVDacaBKvSsxPWjNUmpXw8DerCxRrwg6FIZKqGWb65iSyfHBpHb5Tws+iTGVepsOGRcqi9vEhZRCbmgFARw/Dl4XOz/j8Qd4FF2oyRo4Tq22C1/H5URFi1hGf8A6m6Gy/stAwiGCx7zfyxOiwX5Kfvo/IGZPZDOowU0ytnWQS+nnGO6Cwk76FrULLbTvnXliZVyucCUHwYvlg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZneJYJeyWMREaaUSf/027X0QuCq+LHuyAgAB+64CAACzJAIAKEyeA
Date: Wed, 21 Jun 2023 22:11:32 +0000
Message-ID: <87v8fgo48c.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <fcde45a6-9da8-4dfd-83cc-cd03e05a68bd@amd.com> <875y7p9ia2.fsf@epam.com>
 <ca2b82aa-0910-d065-a6b1-9e3105b33380@suse.com>
In-Reply-To: <ca2b82aa-0910-d065-a6b1-9e3105b33380@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB3699:EE_|PAWPR03MB9761:EE_
x-ms-office365-filtering-correlation-id: 48ec1c92-e47d-485c-25fb-08db72a4788f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C/2Wb1SPQ3vICeG4ltv2QmdtrxHKmvK5HePRHvcC27Wajc6HhqSM//i9hA/pkG8gZSyGzy4G7pDNgb3/SRKvldBDyOPr+uZbeQ6Fa2TAPGhRvc8pIj8X4ThfV6WIj/GzEw2FSY498Ci6nxfVJ9i06Ac6OMmQQYfjM0p6TifhhxaNaMD93WNFiK8l1r6YtP7UYd25vtY3iKIom2f6Reoh7KYCkl6eXbmKFgV9z4UdQeEoc+SvnkBD7uSNIVEQyzK5PzzRLBoxuWTnpyX24ZlhuSHRbsJ54IzeSymcm2Zf0KHUOWIc6dim1y026pmcLHqOE0+9BHqFVfaxzsfHfIoMIgYkRcI1Z17FaaZRO+Wl2cKbMWjjeGaq7mPvqG/oGyMHMj49BkqbYS1mbUHcd0NO8zPeVGsi+sN68Gitnh9pN0aJSjhXVU3CHYxS/7RKkZsRDXBiXowYYE4y2NgqHaJukmEG//6xRsOJdKiup8SdE1WGm690su3aFFtC8sAdl9egKjqoPt+JpdjD1Z5p3TjoTQyxemAksh2uGzasa1x7zpN1SJeyZrKSHsTikGF5EdDl4d49HcvgAPe870jm+7p68ECFUtXE19+4whL2w72cgxo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3699.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(76116006)(91956017)(66946007)(66476007)(66556008)(66446008)(64756008)(186003)(122000001)(6916009)(6512007)(2616005)(38100700002)(55236004)(53546011)(966005)(38070700005)(6506007)(26005)(83380400001)(86362001)(478600001)(54906003)(36756003)(6486002)(71200400001)(316002)(2906002)(8936002)(8676002)(5660300002)(7416002)(4326008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IIigvZolgaEAh+Ofp+hZJz7wM6sCzehrYglGsoavMNva3d00KZsb6k5oFF?=
 =?iso-8859-1?Q?g3ZIW4NrZAaIyiqsNuJ9AH+UVEk0t/pYGgyvk7kWmhYXthyGARzk4siIxR?=
 =?iso-8859-1?Q?8b5qJts15dygdAcFJuhhvdbDn6iMAYjpjaJPRRtIVBjTW3qrTSUGpzQ+y2?=
 =?iso-8859-1?Q?ca3Is3n3OYN9Lcqwd8O2KLz8YpggOmLVqZBLBD04VT48vQUFoIPLgGNAzX?=
 =?iso-8859-1?Q?2U2bdkJly6dXDOzPMHoPujw37xmEOoDhvnfzOu56Zvu0KGXR1KM0gYcmLK?=
 =?iso-8859-1?Q?dWnUBnSvR3DaG09QzQNffNKA8Uxs/lCeAlrBBSoswfg2mDIw9aAJyw4ZAQ?=
 =?iso-8859-1?Q?gSVpv3PxmLyqJmYI0j+KHTQaqJ7nQZpxxm0vnyWR7//k0/qzXq6sCI4u7Q?=
 =?iso-8859-1?Q?vzv0O7N/MSixOY1vcldXMYS4/MigtuROVwDZvRw41uOmrFMWy15cT/3f4u?=
 =?iso-8859-1?Q?H60tAoTDHxJD7tpjFgEq2WY/BX0nhHGHRq3smILbw7D1kiuY6TbUlnzFp8?=
 =?iso-8859-1?Q?P87yeU8xEB9LKjl41H/5J4E+DcbTDwRDNcnt+zPZ53sHwlYFkUJep82Lf4?=
 =?iso-8859-1?Q?P12t9V2k74R0iif+DIni6ulM8b262AjQBy8s9UIFA+77DlpaYp+dt7rvol?=
 =?iso-8859-1?Q?VrUWlfyAvQRTddddTB+Y0hqIqSvC+okAgUlJ2oWyo+6nehomVZnZCmNtOS?=
 =?iso-8859-1?Q?5NcriBQZTOqaDGruySc5xtpeZdZsZoQ9gb7nKH28P5jTMGTGFfk/dbpTDS?=
 =?iso-8859-1?Q?Z9MH1jiWt3CoTRJW3EFWNwBeot5NgBA3325ffdP8PkrN0AwGJp9fv2JHaH?=
 =?iso-8859-1?Q?W9mbbylzK8u1E8Ke9XBdTLREt4HXRA8dRJ4hiu+0Bfv4et3eVTFkJo5UYx?=
 =?iso-8859-1?Q?Y2Uz8dWzx8lDe3Zv6gssYIIhgz2ZpjuhMcpjja4a+kPbtgcyBK+i8HGjxh?=
 =?iso-8859-1?Q?drYmGdPqwkY8XrDoNsZ7isAnzV5hE1cPAi8Nq8mZ+msGQq82v1eaXjtop1?=
 =?iso-8859-1?Q?IKvrowM6WxofaclUaNJpYL3xwEqLk3vfNLEwuUFsva96dugCAnzF7RmaW9?=
 =?iso-8859-1?Q?7anL/CxJSKpZEu+/NDp+UArEEP6dDNXOe7PX0fKj5ZdESeesjxET5k7zVd?=
 =?iso-8859-1?Q?rm8CxGMR0E3Q2bnM7szKcJcQkFDmrX8RQKB0zAjU3DasUji+NUBiVnq8vf?=
 =?iso-8859-1?Q?kS06lEegSN5kYsKqYjKd50Y8QvIPedrKkV0pKJj7qiOIEibzlB2Oey6feV?=
 =?iso-8859-1?Q?/tMItHhjVU9398AnhkmHSrgNe49b0vO7ycImPK08/RzL7VOQZICffBwIYw?=
 =?iso-8859-1?Q?YW9FtXXkdrbHoV8GdL6mpwkS/sjFdVnzUgcQkBxOPtTYO9OmS8jQJ1Rus2?=
 =?iso-8859-1?Q?Gl9IEuDn8RPNrvOiuq8lcddpbR7uJaCvh9WIh4R485grJq9yjhulwzdkSL?=
 =?iso-8859-1?Q?rWZa1lXxJK680L41YXZze0+3mIvxpBjHvzZM5A+WBVzWYO8oNNUg8R51mR?=
 =?iso-8859-1?Q?P2OcSpIdybzOxBr9c/i7y+KPEa1rZHUks1xDs3uWNp4de9yKR5v4DBKuHI?=
 =?iso-8859-1?Q?3bnn/XPLR+BrMTJW3h9RstWh6Wlt4lJbO3qUImH8lIgBSx/p4Zs7Qb+C2z?=
 =?iso-8859-1?Q?v7m9OOPuLdTbe5XDD51kR5GehkHRTN3tN1VzvT5AooeAFP/+VwjtwHeA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3699.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ec1c92-e47d-485c-25fb-08db72a4788f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 22:11:32.5559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XvjBYJo1xXDRlYFxLQIxIFQNSTKePfEL8/99Tv+NWncBpGgick36T0dbXj76auZrYNlOuZxuAnW5s7UMyWEsm7wbMV4KoZY085vCNHszvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9761
X-Proofpoint-GUID: XGovigD9KrEWz0epiRQX7fkBfCd1qOHW
X-Proofpoint-ORIG-GUID: XGovigD9KrEWz0epiRQX7fkBfCd1qOHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=475
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210186


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 15.06.2023 11:39, Volodymyr Babchuk wrote:
>> Stewart Hildebrand <stewart.hildebrand@amd.com> writes:
>>> On 6/13/23 06:32, Volodymyr Babchuk wrote:
>>>> Hello,
>>>>
>>>> This is another another version of vPCI rework (previous one can be
>>>> found at [1]). The biggest change is how vPCI locking is done. This
>>>> series uses per-domain vPCI rwlock.
>>>>
>>>> Note that this series does not include my work on reference counting
>>>> for PCI devices because this counting does not resolve isses we are
>>>> having for vPCI. While it is (maybe) nice to have PCI refcounting, it
>>>> does not moves us towards PCI on ARM.
>>>>
>>>>
>>>> [1]
>>>> https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459=
.680961-1-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!0BUqPos1zFKUoPwbKLLwKItNgB=
VPaBgxmH1Y6zXpms2bngrlWrzB-qMNvIaiAy2WSWMa93UrlvRi0ijYP8X4Ymx07GXYPO1W$
>>>> [lore[.]kernel[.]org]
>>>
>>> Thanks for sending this!
>>>
>>> Should this be v8? I see v7 at [2].
>>=20
>> Oops, my bad.=20
>>=20
>>> I had to rewind my xen.git back to 67c28bfc5245 for this series to appl=
y cleanly (just before ee045f3a4a6d "vpci/header: cope with devices not hav=
ing vpci allocated").
>>=20
>> I rebased this series onto staging about two weeks ago. Looks like
>> there was new changes into the PCI code after that.
>>=20
>> Should I send a new, real v8 which is rebased onto current staging, or
>> we'll wait for review for the current set of patches?
>
> Please send a version which, at least at the time of posting, actually
> applies. Taking into account Stewart's observation on the version
> number makes it even more desirable to have a re-post.

I am terribly sorry about version mishmash. But Roger made valuable
comments for the first patch already.

So I'll post the updated version with an additional lock and other
fixes. Should it be v8 or v9 in that case?

--=20
WBR, Volodymyr=

