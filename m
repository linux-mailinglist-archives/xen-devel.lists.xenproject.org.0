Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300DF5123CC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 22:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315435.533988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njo8j-0007fj-0M; Wed, 27 Apr 2022 20:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315435.533988; Wed, 27 Apr 2022 20:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njo8i-0007cz-TI; Wed, 27 Apr 2022 20:19:56 +0000
Received: by outflank-mailman (input) for mailman id 315435;
 Wed, 27 Apr 2022 20:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsuu=VF=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1njo8h-0007cq-7Q
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 20:19:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65dbabfb-c667-11ec-8fc3-03012f2f19d4;
 Wed, 27 Apr 2022 22:19:53 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-ndzLvbzkNlO9NXZ2mmCAQw-1; Wed, 27 Apr 2022 22:19:52 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by HE1PR04MB3018.eurprd04.prod.outlook.com (2603:10a6:7:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 20:19:50 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 20:19:50 +0000
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
X-Inumbo-ID: 65dbabfb-c667-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651090793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=thk2/rwf99CaFUAXqJ+acGVwFGO06xrcN27Fi/Rj+rA=;
	b=GGDfYlCiLZsfJNwEtexnBkkCXOcyzxILp+U8cfP78sXJRstnx0+x8yIgSs5dNTGNhpM6Gv
	jhpv4o5sq5GpSFfXzc1mpt3qr3k9otoJJ/4BN99/CeeAY9/RwCZ0rs5DrEuP6rAlgSohZZ
	0dl9bcupomClBCIu6rXMtnlzfyExFlg=
X-MC-Unique: ndzLvbzkNlO9NXZ2mmCAQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2dIYbPT6X2wYVNsKidDhZ1Y9wqQzljqqi5YkKt2r3lkTNNUyEBn8k4uIT4AKzdIg+X8BPzU4v3diIRqGhkoi9IdwDbvIcwZ42Cv8QesJ0miLJxKApSwv6AJX2ep6GokyCfyC5iDk1lFiITRxEUba03bciMnG9+2DbDWDUMdL0qHQAlk8U0NOwcE5BD6kDfpEc+KDtZJN/31WRukeHHuH0MGcJ5QhL29wJGow+XuHSpFC0JSIjdr/ORf/ARq7/26onBpmpJN8B1pmw0AbLVIFASMFCuqa2VmraQ/JrUwxkti+IZbS5v/KDLVGP2Zy99BCQ/AEu8OG5NcLgvw2SAJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thk2/rwf99CaFUAXqJ+acGVwFGO06xrcN27Fi/Rj+rA=;
 b=ZysEHtLUHIPAfYkwFqb4mWMR5R6hwKD/grpI7AxVZSZ9UfCkcogC4V6txuESbnQgU6xw+SQI17M4BbtMaF3M1K0ZKz8uHaniqP4t9a6ighVN7H7xvvwbDwomyd6nt7OQsdsb+W/WSJ8mjcWwV2KzpMTG0Bvrta/cDG8LnI+smaWvz3fOFRXJiv/szhtkoeyJhzPEs9wWuI45xYPpcIf/+V+R9gkSpCDJ9N8o/JvLQuqW4+rzWZv5dklqIRSF8leCp2Du6agYMAtU74Np/uXDDJeCgcN+D417eajoYyLjtL6O7dl3D2IVLPRp+Bakc00G6XdC34RzLf6fC94hR71LyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "michal.orzel@arm.com" <michal.orzel@arm.com>, Juergen Gross
	<JGross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "george.dunlap@citrix.com" <george.dunlap@citrix.com>
Subject: Re: [PATCH 5/8] xen/sched: Remove unused-but-set variable
Thread-Topic: [PATCH 5/8] xen/sched: Remove unused-but-set variable
Thread-Index: AQHYWhwsOZ14Vg/j7EG5g90dnN/IGq0DiJ+AgACrcQA=
Date: Wed, 27 Apr 2022 20:19:49 +0000
Message-ID: <5fdae4f46d8f66c136ed71a0737209e1fd0050b3.camel@suse.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
	 <20220427094941.291554-6-michal.orzel@arm.com>
	 <aa77a8a6-6ccc-89ec-ef27-9d685dc07ae9@suse.com>
In-Reply-To: <aa77a8a6-6ccc-89ec-ef27-9d685dc07ae9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11c20a51-96db-4e69-cf4c-08da288b4810
x-ms-traffictypediagnostic: HE1PR04MB3018:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <HE1PR04MB3018017456428F3EAF25DD13C5FA9@HE1PR04MB3018.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Or27M6DZS1LmijAGq+DXCkL+jEyUCymUY7UNNA+pqtvX18JIA5jZaSEHZXwQMVfXf6tzpaO+C9G3s1p8RL6U+ZtlX0IRY1RQO1Q/3pXfaFKw1lFFZEMdpyM5WfDv/4lMpBOGJcS9D7HiH5XuGetkJniRx7/287hJBjEv3aPKPtsWEQEqCIBcEXlu/gmFZiJfJOgjuGGR3a3krIoA39CxJViF+y1jv2xb5b2UUjTZnizQOyQcug6YCGPooH2b80hhfDH1l76lFMCljyV7Cm4uNJmGuvM5SxzD1W3M2txW1GEnANzwICckIwmDDCe2Ae08M0KX2p08xh/e9KdQWcAwrH7qXZ3ZZWWc8UG51HKF8tZu8nGW8bCpoJW/omtT77qRxPQz91V8Gn/EOLDK540mtnHj+G83uksFHs6Peyw77OeGyNNpwXt1GaBLA5U6C8Ny0yEZstnj3G5DdH4IVLci0cHxQcoG/YIZdivnss38mlIKT6Xl/+G0LCRCBGVYkxuUIjUQMzq4bjR1WSbU44gHIv5uzsZsjox7BmkMv/d++vUCfPJEJJ9l3fsO0kq06zFevdw8g4O+1kUkIFJSMBpNM7PCPzKGvD4weiLIwsCQKP5Guv1uMr9UBDQH+zNuFU3Ucx7YwAIWX/Hnm6jVqcbkOdazc6fmPCgB6T0kB6NliRw3Iedf/35ka0rIzJbKJXgQZIyszpsmKH8j3SGif49IK2Q/l/G1nw1x5kSq5mg0iISgNNLjI1OcXM5f8TKmbS/wwV4AVbJwyxI01njh7sBkjqZsH1R8QO62BRmAFnBih77oZjUXTKIgPeO2RAe0ecIz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(122000001)(26005)(36756003)(86362001)(6506007)(66446008)(8676002)(66946007)(76116006)(91956017)(2616005)(66476007)(53546011)(64756008)(66556008)(6512007)(4326008)(99936003)(38100700002)(4744005)(966005)(6486002)(38070700005)(508600001)(186003)(5660300002)(316002)(8936002)(2906002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VG9pL1NsU2h5aXVDK2lTWnhJN0FhQStCRExSSVJQN2RVVTgyUzdkZFE1VGda?=
 =?utf-8?B?V1ZpdEUxb2k2OWNraWhMajNZU09iSUtBeGdKTHBONjVtN0dRYTJZOGFMamxW?=
 =?utf-8?B?VDdTNjF6UUZJNnhYREJUbHRka21xNnliZjQxZ3ByQWpsWExSdm9VbDlDUFJW?=
 =?utf-8?B?VkdkRmdJNDZmTEFCdU0xL2dOYW5NOFRlWkUrUk9VNmlROXJrM2x0YWk0UmdV?=
 =?utf-8?B?c1YzaTM5RXNZYjRtTWozVERGMm55S3dCM3dENTIrUTVab1kySUo4ZXhLd1kr?=
 =?utf-8?B?Rmh2RHNJVEdsNTlKZ0kyNGxVK3VkUkRkUTE2OThOdDhieERxa042bDZHd2wv?=
 =?utf-8?B?VnJpa1N0U255dU0xQTVTczd1RWpyL2Z5Y1BqQmJKemJ1Uk83NzRtcEdyMmgz?=
 =?utf-8?B?UDliNyt1S3dWa3NCOHF1RUEyc1UxNzRpbU14NjlCREJwRlJ5VnV0ZHVWL1N2?=
 =?utf-8?B?TFNicW1JUURIaW8zQTliZDBnY1Q2dEFLMitEbFJmbGVpMDB2dXFlSXJwV1kz?=
 =?utf-8?B?cElJQjJTbVQremJsWmgxQ0p4aEdOOXhGK0Zaa1JJRnE2NVN0WTRnMnEyYk9Y?=
 =?utf-8?B?N2JNYWpiclV5K1p0NHBEV3NnOGtoYmwyZVpCdkN1Q3VZSUNxb3BlMytSWTVP?=
 =?utf-8?B?YURYTzdWcGhFNFRzNXp6N0FBTEVvTENGOWdEeVVyWk9qNjlndWJML1ZleC9K?=
 =?utf-8?B?MGhwOUVTVVVJSkoydzMyNnhPck1TcHJ3SEY4Snl2dVNpVmJNK2pVMEgwYXcw?=
 =?utf-8?B?eldwSEc1ZmpaK3A3RnNWTnM3dUhVMWNXam9SQVhVN3VzSGlXajRMZk5MZjZy?=
 =?utf-8?B?UDFVM1pBM1M0dVhaNnJvalUzUlFJY2ZUdEMzenpCMGdnZkFzdllENEdhdzVa?=
 =?utf-8?B?d0tiRVVLaDB0cWFUaUdEbG9uT1FvUkV5QVR4ZmhNYlFqMjd0Nzl3OGpBVVlU?=
 =?utf-8?B?VnlJaVgyRGVVWHgySitVVnc2UE1ra1VsQTVXSkJDb1o4cUFWbGNuTWExelgz?=
 =?utf-8?B?a014OWoxQkdWaWsvZUxndUxwd1poNWtpbFlUYTNLMWk0RmtDb29ISUtSY1Rr?=
 =?utf-8?B?LzVic05OK0tjaTdCNS8xRXB2and1QUtkbkhsN1VUd3Y0V0hKVyt3K0ZHcWEz?=
 =?utf-8?B?Qm9XYklSZU1qejJNS282WEEvYUFyNU4wL3JSTmZaNUFuL2RhT0tyOVUvSjFE?=
 =?utf-8?B?cVhJZVRtVzZHYmtZREIrY2w2VmZxTkFFcm0wZU12ZWRLRERPSVlGWjJtbVZC?=
 =?utf-8?B?OTdSckovVzdyRDdzNkZlUUh3QktnNlppOXhkNzhTdnJSbExQeS9BUFd5T05l?=
 =?utf-8?B?aWhBMjZDMkpYd3Z2eld3bTl4OEp5VUVtR21ISjZLQ1hHY3I4ZGx1SHplZkRG?=
 =?utf-8?B?aHBmb01NcVZRMU5Hd1lZNlJVczdkeG5kTmFJTHV5NVlJZzVwWjFxcWJqdTBt?=
 =?utf-8?B?NVRCRlFuY0lBeVpZcVh5aGhjSmV6SkxiNWV0UjEwQWVsNUJXRlVoOVNjZWpI?=
 =?utf-8?B?RFNZdHVVVTBkb2lLZUNjU09HL25USjZDNUZqeHVBYVhQcDBreVU1TSszRXZ1?=
 =?utf-8?B?RExDQnlSbTk5UWE0QWNnMGQwNzdaNmxrS0R2YnVnV1Eyekl1QjhlQ2F2RFJV?=
 =?utf-8?B?d05iQTUyRzZCWjRIVHpoL2VHR1ZtTzFqUjB1ZFNZTzRScTRtM3I4UE5MU3Fh?=
 =?utf-8?B?bUZ4aTNvdmcxYXpvWTZjcXJ4QkVOeHNmTU11QklmWUZyNE5ub01tU0NqOVdq?=
 =?utf-8?B?Y29sV3NJcjM0RFEwVnUwQk1SSXBXQlV5REFPUGJDL0lIRnQ1MUlWLzJ0bzdj?=
 =?utf-8?B?YjZmT1prODNLS2VjbTh6R0xCOUhWUWVCWUZZV012Ui9FekM3NzkzTmwxOTAw?=
 =?utf-8?B?MTY3d1RSa3EwaXIxUlJWMThCRkg0cE9YTkk2andkbk5nbDNBU3k5WFkxbC83?=
 =?utf-8?B?ZDhVeXkvemRzU0ltR1pieWRNSmpUMHkxcVFkZUJ5ZlZidnVQZmtoRmlUcnYr?=
 =?utf-8?B?OXJWcjhIcml2b2doWDV5ZnI1Nkh2K0hlNmhpSWtScGpKMHBaVEIxcDJlWGlv?=
 =?utf-8?B?akhORGNBdVczTE53S0ZDeE55b3RpeHZpQXdkTEtuZEFSbTNvYkgrME1sMDRE?=
 =?utf-8?B?SkwyRlpjU0hFZ0dTQUhjb1hFUnZZa2NMSTBncmJYWGZ1MWZUbDh6Q242SEl0?=
 =?utf-8?B?SGlsclRsYWNFa2NWMDZ0TjhDdlVYK0NjNDk0REY4S3Y2aVAza3BIOTEveGEv?=
 =?utf-8?B?aktSMlFQcUY2N0hkUDh1dFR6bGxsbU1QUXNCdmw5dWRrTERuUXJYek41KzNp?=
 =?utf-8?B?a0xzUVZKVUV3aEJBYTdtNzZZUlROWmJYZWZFRFE3TnNCTzV3SUNGUT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OGXwwZaaVOZMp8vfKfLn"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c20a51-96db-4e69-cf4c-08da288b4810
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 20:19:50.0504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABRCKM1uZbqp1biSqcjJujESVi+2mMimTm2rM0qjDPj7Swl92h6DZrcBjrzy7HHu2RI2JwkicJyX/QamVslyEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3018

--=-OGXwwZaaVOZMp8vfKfLn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-04-27 at 12:06 +0200, Juergen Gross wrote:
> On 27.04.22 11:49, Michal Orzel wrote:
> > Function schedule_cpu_add defines and sets a variable old_unit but
> > does not make use of it. Remove this variable.
> >=20
> > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-OGXwwZaaVOZMp8vfKfLn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJppWUACgkQFkJ4iaW4
c+6qphAAqfV2WX0utSzoBwSJJ72cgUufiGy4KM/UWozu3E3mGeze73nBzzq0Dr8r
G266KNfRoi7SFg9giBMsBfdzEp4br4Ha2kjCk9j/7JBROrBtmfwv2zEB4ya8qTwl
s5tNNW3P1aaBcQ+PvbR55XOI3SbgCqSrFBaKrep8fXY1NjVV5THXgeUMv55ge3LP
N4dIw9D5nlwlaMdPmlZAwkGGIuaDgCYzbGj+ZjhaDM9naY46RPW3lSwjBO1pFrpQ
fw8xVGHUEugGb/KQwizZyJIJG32jOwlhpFRx1s6oVY6JBbFj4mdx7hf+FUhFP/wD
pzmteKTYOZdWzJu1Qy/HhcRbETlShtFP89FjVA0NwOcfKjb8NscqNWj9PVxOi8WN
0nlv8NnrmSLP19KlKa2YyD7vHWGkGRjslAim3KkCERPWek03fPyLbvKafl6sKCRl
9LEApTZycPXnQ6nKCF1DA5nvnggcPVqUTye0aJxEIB+f8vYVUDE+TUrpp49393G+
BBNlvd4t2wuOL482a7oRVKpu6ouCp9Zs8m4IT+QBcedXwNP1YljPOPU6ImcHNXF1
7A4D6QgRLBvIeUyvoeED1ZSHbjukJ26kEWYk/bvivsYLVVTCNwLwRMvap4Di95dg
A/+EstApKMVdAZodisrY5YuBYSQPCmMR5xXBQmoxHERQ9GewgMg=
=5bR+
-----END PGP SIGNATURE-----

--=-OGXwwZaaVOZMp8vfKfLn--


