Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489AF6073EF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427476.676570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloFV-0007hJ-Ly; Fri, 21 Oct 2022 09:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427476.676570; Fri, 21 Oct 2022 09:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloFV-0007ez-Ix; Fri, 21 Oct 2022 09:23:29 +0000
Received: by outflank-mailman (input) for mailman id 427476;
 Fri, 21 Oct 2022 09:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VH1f=2W=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oloFU-0007et-Hz
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:23:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f45a63-5122-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 11:23:27 +0200 (CEST)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by AS8PR04MB8834.eurprd04.prod.outlook.com (2603:10a6:20b:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 09:23:26 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 09:23:26 +0000
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
X-Inumbo-ID: 04f45a63-5122-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boUYgBlT5IBRArLnlv8G431/C2pKh+temL1vIueFP+QfYxMGg1f5vDP86ScrXtxzfDVfwZI7iM6SFX0npZ/AMXyIrjIwNMckqH0aF5MMaEGOL1FAEEKOedFbzkwlWMARcKIGqgvtPL1xqfri7okQJt5S6fpUInY85WGRhgrd4vP0D6Mgk3i9EFjYbO/pzSSt/Gvgb8+0LoEMarVOAMwAlNIM15sMVPukr1wlbNgpC62u+qQ06xvZghxnErclHTp9kKxDMlqoUf9qPfUODtbogVUbY5tzjSPJqBaxe1tTu6zInBajLV45YNkcBd1sAnOM6aKS4aksJB4NXpDw2rSz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx0rnd57G2IRJXD8NGFjsu49No24LVjnChtXOXFczLs=;
 b=BhvBm1BKaaUR1gBXPwe+8v2n8S/L+uGv3pVNz/feSKV36W1uow5M/yLpoN/HeN4MrgWnSoTGGOTGwB3prHSbKUcjwVFwpV5X23Z+cOnRyfKSsi6d5yvubJnojZrJ71zFV8vlYOF+EHv7i4qcWX7YdfuyJaRHTwfHJAu7+NXqUYmuKeWxJ+dONWJyvp8tlUyCYJOAtyQAEQ3DSzKiLIcJ5f7wnaeTkTe1S2qLjMZNhKOTDfEfjRI38PdEASLkSEIcPd9oi8c44s9UV3Tt8uPc7gFvCCldRXGdrRhjsDuqfzrdP9gYvqRwhA/an7N3IXrdPwVPlS6ah2vAmF5+nd0zGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wx0rnd57G2IRJXD8NGFjsu49No24LVjnChtXOXFczLs=;
 b=THr3TmdiZHBOAwY3CUH1P+K0AwSiFYOUnjbOyTSGQTZyaocTn7HUhUqsvSgsYka+yAXDEdOIjKTM/uwGpG116NfEDElT7zfbZ7AGttM8dym2RvlVrojJZUIifLclFld9D/KDH3MLwLK+mjiQzKnfky/iXjwJSqxB6vSIPii2qVhjwQ+GGGgmay/CKaarsEZNuwUoVcbBtIS3qwmo1Ch8voTRG2WL5E6W3YEXEZhKfs54ErsmhA5rMNcXkFn5GGx8GqYyyXV81WZk6GCZvMDRgBYjDrWFGLaZ+mtcmBfQmyr1BuVaOhlUMAIOM2Xtr5bEqiwT3jnznWL97f2gOholTg==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Subject: Re: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Thread-Topic: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Thread-Index: AQHY5RPdyv7HUa7jcEWPdT3S+dSn164Yk2EA
Date: Fri, 21 Oct 2022 09:23:26 +0000
Message-ID: <75b00338429b8d87a8adece923529899f7985354.camel@suse.com>
References: <20221021061042.12083-1-jgross@suse.com>
In-Reply-To: <20221021061042.12083-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|AS8PR04MB8834:EE_
x-ms-office365-filtering-correlation-id: 3d2f9d1d-f53b-4743-4669-08dab345e87f
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hrtmES7+9UU0TPxbLz2JfCrtupI35GFEpq7eG1d170PcsamHK2oiwpVmFiM2o6e1ItuEYW5V0/B+8dj6TJyY2Epwq/Axn6MhoMmr3L9IlnrjE6Vt6iYo3bU9QvVsVdXoPws2wk6JCTfzAWE+N9eg2DNzQNfUkqqR6E1yhlbyG/Sq2+YLg9wo0KycaIdaBJlxh6S/VaMcNEBdyJqpKksedayf+MzHiNUICwv0Y0mSkenkEV+e+CWgYEKIfyvREhf+We1utpo/lZBTqoBZXv8a4c55bZ/y3FAGcGcaVQBGkrl+Qgyz5FIv28mfvJ2ZUnUHPKcweodOINdykd65hAmzKj/i5yo35YxmJGBDWWI8cLjEcKvQHKv4ahQG1d6y+b+vUatJu/idI8NNCCxvz0RcEY0iPpWoVGA4EGVOaFCHdJOmT+IUIIoi10zzm5b+1FRVxPQT6/vrtMrcSdD1IYp+9HLOk8Kb5wb4rGwH557bYmInNAjO0rhp41hM2t3JA9T3aYXJbEtSS1QxIihLEmHV3TAZUHdOOXwAkz4twyJe+ZS8Wy8/byWSa+jjyowJ66J9NlcKQN61ncTYuWt5m9rzbIgt4EeSsGybnDQvhl9/QEe8YtcBv27yBy5kvPUw23GoTErbuS8C/l4SuWVUhF8u078GvxZLTyYuYYaeWamDAqKjddeBetNIpXp9/FqEdXl5p55RbDK05J3kB7oeVXbyOnyydrrjtFbJAXlPNtauJvwlP+eszytMsAb28VGHef9F1LeHrF7F6FaRC7tuR/i4ICveS3gyCm8FDxVN+ye2wpWkcA1FIUUiRKvjbs+bAJj6iEwLgPlipurnkeTV+v4ksQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199015)(54906003)(36756003)(122000001)(2616005)(86362001)(4001150100001)(99936003)(2906002)(38100700002)(91956017)(38070700005)(83380400001)(6506007)(186003)(8936002)(8676002)(71200400001)(26005)(110136005)(478600001)(4326008)(76116006)(316002)(66946007)(64756008)(66446008)(66476007)(66556008)(966005)(6486002)(5660300002)(41300700001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXpTd2RnVmZRcHFVQU8vNE5zZjN5UExCYWtQdWpNQ2ZTQkdhbDJrQ0pXUGZY?=
 =?utf-8?B?MFh4S05xZFdZbUFsVkcyWEJyb0IzOHA4VzJKQlZWTThiK2x4UHRQdkxYWWlL?=
 =?utf-8?B?V05XMUNpdkFsbFM2ZzRacjhrZ0VweXBleWlPb0pDRHpRdDBaQ2d4bHkwaGp5?=
 =?utf-8?B?SmgzbHNwMUhjZ3MwUWNkUTIxTkc5dlhZVHlXd2VHd28vaVU4Z1V2SXY1R0RQ?=
 =?utf-8?B?NXZKenlSeS9FMDBub2E3TmFTZW1mQjIzd2VUUDI5YTJZZ0FKdlVIaE9kdUFk?=
 =?utf-8?B?L2FqTmxQRUxFUXNaL3JYeTRjUEhyb3dlYVZXQUlNemNwUUNMbVQrZTZ5eUh6?=
 =?utf-8?B?aXJOeGZhN3NPVHg1a21KK2w2N1E1dFI1bThyc2NYdTgxK0RtQnpVak5zS1RV?=
 =?utf-8?B?cFhNSldwN0ZlRVNhUGFpU0xmYnZmOGV5LzZ6Z1Jpa0xydStmR2hxaTVlS3Fl?=
 =?utf-8?B?OFRoSWZJQVZsR2pwUmZod0dWRTlsK1ROSEJ4azZWYUlXZW9HNGltejdaQXNL?=
 =?utf-8?B?ZGZnWFlTTUMvNVJLVUttZTR1SGNZUUhaR1AxdVRLZCtpa2xZSUw5dlJTdUZl?=
 =?utf-8?B?L3hleGRKUXRqSjZmWThOM094Sm8ra2xldHlMcjlZMjlyeXR2akNSZE9qeVEy?=
 =?utf-8?B?d0x0Tk4yenEvNmswcWl1dDM3dXk0OVZEWkVqYm9VWTdYSjl4YVpKTStjRmtp?=
 =?utf-8?B?c1NQMkhwdDRoRis1ODlmZlZ1bGdBK28xcy9PUmNzQVkwQi9SdUNQQjdvUEVr?=
 =?utf-8?B?Ti9CT0VtcTE5ME02cWVlUTE0MDZpR241MmFIK1YvUnBaSnpzTXZJWkU3Y240?=
 =?utf-8?B?aCs0bUFNVnoxTFJrRVAxSUlSVm41alM3MktvVmxDdnJIOW5GbFo3M3c3aUsx?=
 =?utf-8?B?dGRCT3pWZm1LVWFFbGRzOU1kdEQ1UDl3RnVITHpLZmtJZlducGQ2Umx5QlVs?=
 =?utf-8?B?Y2M4M3ZzT2NZNFZLNmRzcytvdHpJM3U0SXpxRzZhb1BEVDRtdGVYN3F5ZWhM?=
 =?utf-8?B?TEZ4elpZYnFZU3J4dFdtakdKdmdYaGJZWlJNdFNkbUZMYjVmcjlsZElscFhD?=
 =?utf-8?B?TmdvNGhqZFFEcDh0M3VQVEdJNFptS2piREVnU1ZwNkM5VnhjQnJWQmg4SGE3?=
 =?utf-8?B?K3g5MUhQTmpuK1VvRjBLZjNLUzFQMC9xR3NzbTJ5b2RXdlNaNlIzcURGa0RH?=
 =?utf-8?B?TEh2Q1hKc2N4T28wanRLWmRLd0puTjNFa25lSjlqQ1g4SlpxSzNVNWNDeHc0?=
 =?utf-8?B?V0dYUWIwS0xveHFpK3hnaVdQMnF0clpSM0tueG5ZSVFjZUQrUnJqRVA5RzAx?=
 =?utf-8?B?cUthdlZkNU9GU3ljT2FMaG5vR1FHaFJ6dFVTLy8vM0w1ejkvNHBPOTMzZ011?=
 =?utf-8?B?S0R4OVpaeTJWMVJwcEFDNFNwRURMWnAvUUZmcHNPVnpCWFltcm96bFZhWm1u?=
 =?utf-8?B?UkMyK3Y4NEQxOHdoZi9XNEdJNCtSRjh5S3gyMjlBSWJXbnpnMWpxTGpSVTZv?=
 =?utf-8?B?K0kxM2xDUkxMUy9uaVFzbTREejBEWWZONENydUMrM3licTU0bWl1WkhuckdV?=
 =?utf-8?B?aDZ1Y1NGN2o1TmhiNjVuZnRnUXB3WWprOUlIOUcwVzZlTjhaY3FDTjlFUEpS?=
 =?utf-8?B?RmxVT2l3b3pBdEhVakFIY3diNlJoemlWYVZhMTBLN1RUdm9zR2psZ092enhZ?=
 =?utf-8?B?VGp5Qk5oM1BsOFZZcUcyZ1Q5RXhNZzlLLzRzOWhpL1hwSXpQc1FBZEJBSzdv?=
 =?utf-8?B?VkR3NnZkVU55ZVg2MG1lT0tyVFZzNk5scXRJcVdHeGxRS3c5SENJWnQ2dmVY?=
 =?utf-8?B?TkVNWm0ybjUwTUJ6Skt3b3ZGdzN3dFo4U2NnRmVBVTFiaXpRZ3dIMzJlVnFH?=
 =?utf-8?B?YWtyd0NCcHlJeElVNE9EalNRZU1VN1NNdDhablBBNmJ1MDY2YW5ZYjg2Mmoz?=
 =?utf-8?B?MDVNTS82YWlaY0JEWWd2K21HYjIydXl4QzZRbmFJMmpoQzgzNHI4ZDlOOCtx?=
 =?utf-8?B?b3lWNXJRa0pxUmVMZnk2S21Senk4MEpBcjhxbzZmVWEzamlDbFkxK1lrN1Zy?=
 =?utf-8?B?OWVSV0FGd3Y2WXpaakVRR3pLb3FxYnY2bmg3c3RoMFVlOXZyYjVCazhObXZW?=
 =?utf-8?Q?AarybCV1j0ZSGM6O+hfZdjklQ?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MjRzm2dLCQb7hmJKJURq"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2f9d1d-f53b-4743-4669-08dab345e87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 09:23:26.0804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SLp44CHXUGh9GXFW9SJjVZd2/Zc4HWjpCsAlc/VsXVuCnAkvKFo6ICbgaixD8V3Vp2xP0OozRQOAHnHGBMcypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8834

--=-MjRzm2dLCQb7hmJKJURq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-10-21 at 08:10 +0200, Juergen Gross wrote:
> When a domain gets paused the unit runnable state can change to "not
> runnable" without the scheduling lock being involved. This means that
> a specific scheduler isn't involved in this change of runnable state.
>=20
> In the RTDS scheduler this can result in an inconsistency in case a
> unit is losing its "runnable" capability while the RTDS scheduler's
> scheduling function is active. RTDS will remove the unit from the run
> queue, but doesn't do so for the replenish queue, leading to hitting
> an ASSERT() in replq_insert() later when the domain is unpaused
> again.
>=20
> Fix that by removing the unit from the replenish queue as well in
> this
> case.
>=20
Ah, ok... So, all is fine until what could happen during rt_schedule(),
was "just" that the currently running task, not only is descheduled,
but it also became !runnable.

In fact, in this case, the unit itself is not in the runq, but it can
be in the replq. However, since it still has the RTDS_scheduled flag
set, either:
1) we reach rt_context_saved(), which remove it from replq, before any=C2=
=A0
   replq_insert;
2) rt_unit_wake() is called, but due to RTDS_scheduled, it may only do=C2=
=A0
   replq_reinsert(), which is fine with the unit being already there.

However, what can also happen in rt_schedule() is that we remove from
the runq an unit that was not running, and hence does not have the
RTDS_scheduled flat set. In which case, rt_context_saved() doesn't do
anything to it (of course!). And as soon as rt_unit_wake() happens, it
does replq_insert(), which is not fine with finding the replenishment
event in the queue already.

So, yes... And good catch! :-P


> Fixes: 7c7b407e7772 ("xen/sched: introduce unit_runnable_state()")
> Signed-off-by: Juergen Gross <jgross@suse.com>
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

--=-MjRzm2dLCQb7hmJKJURq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNSZQ0ACgkQFkJ4iaW4
c+7GyBAA7AmNzn/bNMWac1Fk/QtTV8x8GOQZC4pNEaweGUGoz4qDINldUL5N9NXM
kVkwHtFO1QNDlZVIePPb7HlAipbQSpIU7CU5e1rW03wUG4DEa/L50ZM/q9Uc+Lt6
ofZQzktDR/cr9HX2t9ChERUNpxiy6hcod2sjx5E+e+K+NcI4Zu3jxIfYFtZhabwE
Y9VFka1XbbTR9gbc4fW9J069kTMayULhALfeiQw/6mfLgbfpLTbrOJY8Y18MFhDx
Y3ntt/Q24g+fQLTghW1bfDRlSDgOLg7UhSJUDF/8oC2+0i0pKfu7lLWStZEQN2E9
w2+A21Lp75pPPOxFMp652yQ6FtZYsdGftaMd6fnk8DcYkUn1tCqVMhXE806qgqcC
IXyJWW2Pd+wN21PuOqxMLTb+OLdeBvaIkIiXlyTcxs9aGQnvEqurPMXOBsN4a2n4
KPFhKqSOgF+9pCWcxCPZq02AofQAI490l1fHt+hKOn53/KwdfYyqPrlqt4aAMVEd
HekRxdtkOC1GKQhMU/In0rpLyUZEi/Y344L8oTNScK70Kh0FTcnKvbSEEqfurKHF
xBoSMze0nrxJSOdCQAAwjkyek6xX/29PXMgip9zahtoq6JLnjYm8+28TrOh6P1bc
/Yr8RLhBkk3Hd3xrhd8ibjDHDILCuwTVEIIPzdZOf6iWkZWslxQ=
=lvsp
-----END PGP SIGNATURE-----

--=-MjRzm2dLCQb7hmJKJURq--

