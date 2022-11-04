Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816161922B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437361.691690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrRc-0008IF-GR; Fri, 04 Nov 2022 07:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437361.691690; Fri, 04 Nov 2022 07:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrRc-0008Fi-CK; Fri, 04 Nov 2022 07:48:52 +0000
Received: by outflank-mailman (input) for mailman id 437361;
 Fri, 04 Nov 2022 07:48:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCXw=3E=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oqrRa-0008Fa-Ut
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:48:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e6e27f7-5c15-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 08:48:49 +0100 (CET)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by DBAPR04MB7224.eurprd04.prod.outlook.com (2603:10a6:10:1a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 07:48:47 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5769.026; Fri, 4 Nov 2022
 07:48:47 +0000
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
X-Inumbo-ID: 1e6e27f7-5c15-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYdtXvOmN82JpE381wCcSzuwRcPW88lHeY11I8a2Wg/Nv/UGoSQvPJu1RVdE1kL8BTFpmG3iu/zqZPyjL5k4UJ/kfaXuEVMeaBMO7JN3Gq+gHnxadx3uf2PeZseRlTeguSzLS3SOn1HwRMHvd55JtXfOEd7ckj2+cQ9zs9QN5SO5BrZoyEyfhS4rKNd2hliegNfrGPykiH9GY0cEcelMRqjWGkNu5/dtYH7lWfhpqa782+jooNNskB0TtUsn7hHFegBQMRitiW/IO8nTYHoohlQyDEfcuaT2thASbuie03AIENhC3MSuwdujMojr8cPHBr/VWG4d/3+3xEpwZcQ/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k9eFnbUR5Yd7ylvPhnSC2nYUV7wddRB8h4C+qjaxqE=;
 b=KyqnFn2+giKtKgP8yzKsqraOry1lbgPO7RXxx1y66afDqE9/HrzTcqYubDLRPoEHlusE1xnlvQ7rZqGfbePDrnj3ZsItxnuasCDkO0SOG7vgHE/ajsP84oHndP5wOlfObbcajIIrqJJZU/sj+rYyx+PYG7jVtp4OGSAD4mi5/69sUGn56Z8v/JvE5cHnVzy2BSMulHIbxNXBDgRi6dp7rMqiY7RCOOMipQtioe4ncbcX6RSj3S8t11+uoiOZ0Du7k8QTENZSuXo7sAaWLL23bN5Vz6QIoq9LRkbS2lsKyOmKiai7hF3mgRhrug1iVToJqQrEybTGwbJEOaRjtpShVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k9eFnbUR5Yd7ylvPhnSC2nYUV7wddRB8h4C+qjaxqE=;
 b=BK3WKLvtTZajsUUfwKCARnALqDAncVNkJkpEuJgaFS6ynMGTZt3MntHZEyj7ok/xlBVNSETmMFubi/6vv/g/qddy6T+3NVq4dJvn0+QQoA1t2IgLu1zvn7KXd6GLjjvg5A0VWMPkLG7sx6d33dO4OrU9kCXR/U0HUY8pcn1uFoTHzwch33H4JIeUg5zTdKzLnLuHn9otKafcfbZD95CtdT/W4e3amfwuodoDgJgqwPl3F260tgMcy4mPILG8kjfoka28akRf+vfDKQSLog9vZSKspipBxZBvPs1DJDRMyrcLCs+AqoFlL5bgNJXA8buGVIoEuRpW0S19Oj/MNXSA+g==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "mengxu@cis.upenn.edu"
	<mengxu@cis.upenn.edu>
Subject: Re: [PATCH-for-4.17 v3] xen/sched: migrate timers to correct cpus
 after suspend
Thread-Topic: [PATCH-for-4.17 v3] xen/sched: migrate timers to correct cpus
 after suspend
Thread-Index: AQHY7svfW5RCRD6BzEauaEQnxR7xn64uZiOA
Date: Fri, 4 Nov 2022 07:48:47 +0000
Message-ID: <5321a4ce8c3b450c89938aae90d57d191b3791fa.camel@suse.com>
References: <20221102150035.4885-1-jgross@suse.com>
In-Reply-To: <20221102150035.4885-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|DBAPR04MB7224:EE_
x-ms-office365-filtering-correlation-id: ee654846-48c2-4176-7dfe-08dabe390156
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tHEoX/yBSw0Z1/6poRaeDUnzl80yZ7sgKelxjEJLiO6l4NuWRQbMUZy08EaoMh6zBJZUaMLGfj1tdWGXttQnLzhoBSkniD8KRJRLtJxvJMjVPXp96LGj+eaCVxEowbIUPiHU+MNYR8lDd6OGpCaa08UICBhNc5IdqDpDfc9lOFHmUsjLcOE/h3nXEIQRuga6S5HtNcAi5FqILItCEW/lontlhTEC+9y0eAkUep20v9+Nse+hJ9yCRxiJAW9omaFWIE5tJTWAQjDHLNsUMLvQ4TJEpkHQB4dC0nT1PqU/VYbruSxcJHZ9x83u1I04ErVwOFCtiTEHv0fkFkhHmVnnkS1NANvfsmrVXqRLxF2O+vCdZEduxZA/RspfCDzwcYv0xbM9ExKjJpETaq+GbNKcgmNpaf3/csJZEmzoKdWWyuTTYCPxpPTL1RwQU2izzwOT0lbkN4TZ4nQMmmajjDcYftqkAUG6JfnoGqpMKVq07MoCKWj7N/jo0PkMj3WQLCQDHIUKFVzOiGQeqhxOYnma/sVc2pl2mFDxQJK2Ro5uw+ZP6j/RO0kb7mqe04WgH6MN2JZ8l8tZ+Co4dmY6S2mwkRTLLuYG9oE8dhZHUlwUZTXo9Ke2c1ZEYINd23z4mJSqsiNKKus2Wz1jdAa4U0BW0RPPTQTI3di+gygl+ZZ8zuvScu/N2pt2fp1osktbcFSbyeE2kU2IMs/JCn3iO67Nf/FMAikOwi6iUs2xey8XEydJkUzWP5MVrjx0Y/2oWn/c8yARp9NHEkam97YehNeOTZ+KXtGzsWgdEB8iG8omAVMnaO+Uk7W1dR5PmBl7s4gf66f5c3tKwjJknF5seIHvlg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(36756003)(478600001)(54906003)(6486002)(966005)(316002)(38070700005)(2906002)(83380400001)(91956017)(66556008)(41300700001)(8936002)(66574015)(64756008)(15650500001)(66946007)(76116006)(66476007)(8676002)(4326008)(110136005)(66446008)(6512007)(71200400001)(26005)(186003)(38100700002)(2616005)(122000001)(6506007)(99936003)(86362001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWd6MUFDQUZ2S2JZNW9PemFuMWhmRUdWNEFlSjRCQkQ0RFQwSFRadVFtZHRj?=
 =?utf-8?B?ODMvbC9Tbkw3Rk1CcVpvZGRDV3Fja2x5WlpYbCtOdjJHTFJOZHJKdmxaNjBO?=
 =?utf-8?B?SUEzZ2t4MUgybldUdEFnSG11eXBYdmVwTTJGdWJRZlRuWExMTGxlRCtGYWgv?=
 =?utf-8?B?MWNNUFYxRS9vVUJxVmlzSUx6MWhaWHpRNVRkYU1YUFhyRFBxUlhCOGZCOWtV?=
 =?utf-8?B?RWZjZmNORXNLT0tZVG9yNldUSEw2cVYrMXhISXRZamc1R0hHMjNCWkV3OVFq?=
 =?utf-8?B?ZmxrVGwralpSZ3RDUG90RklyT0d6RjhyWVZNN0NCUU5aL0QxMXJ6ZEp0REU2?=
 =?utf-8?B?M1c1NzBzRE13ODVlbmhyNFZKdE5HeHBzZ0RycXdsWnR2ZVdabWZOSWdTUC9E?=
 =?utf-8?B?Y3ljVG5kbGJIYWF3UU5BMUZyb3g3OG96dGR2TnFicmhsZHhhWHFwK2JaOHVt?=
 =?utf-8?B?cGFEUzNKSktuOFEwR3FYQmE1REQvUDArNWJaUWV4UUpJREFJSUU1V2lOWktO?=
 =?utf-8?B?V0d5QVZCaVl5Z1RPK1FmZHZSSWpRLzRWbk1YcnlselBKWlJoalpIZXdibGl5?=
 =?utf-8?B?VDZ5aXl1cHlaa1NyYTQ4U3MrZjRaNGFoWCt1ZVFkcUljbHFaTmhkWWJKbWlB?=
 =?utf-8?B?YjBKNlVBNnpNaGVFR1lUZzB5VXN0anUvN1V2cGp2dU5vKy81UFJIcE1vNmpV?=
 =?utf-8?B?R202b3k2czZlVWtmcHcrb0FxZGxhOUhQeWd3alAyd3NnMzNkRmc3TS8wYjdj?=
 =?utf-8?B?R0JxTjV2N3Bmd3lZSnRZdXhRb2NnaGh0cG9QT0RuaTk3TmVZelJmYmttTzlr?=
 =?utf-8?B?OFFwcklaQlE4OHN0ZU82R3FaMjRkM1lkcFlaeElCb3podXY3eEt6MHpKOThZ?=
 =?utf-8?B?ZXlmanBnczBPMGdKQVo0RzJ2Y1VBdDRuQ2dUd0xUQ3RwOVY2QUxnZ1dBaFAx?=
 =?utf-8?B?K05XWmFycGNXRDcya2NML0svNEhkbHRwQmlwc2xyZDdmc2xjVU1NN0NOOFh4?=
 =?utf-8?B?M3dFOTl1cU43bFNLaFJWYkFsRFNQeS9OeFFjUXNJYVMvWlMzQ1pZT29GQXI5?=
 =?utf-8?B?eVJ3eWdlU2l3UEgzOGdraTdRL1d1UkxseEwrWTRmZExzNWhiNEtVN0w5STZs?=
 =?utf-8?B?RTQ5b0kwSU0raHhTa1RoamF3VDFuUkJGL2VGWnNPQkJncmYyVU9nb1lMZWxM?=
 =?utf-8?B?dlRlRjNBY3FoSG1WWU1xZEdwU0M4QlpVbXNKVDdZTUNsWWFSdkdKNDA2NnlU?=
 =?utf-8?B?OXZ5cTFRbHAxakN3ZDRDRURueFEza1pwamVDMWozWUZjQWl4b0JmQVFwMnda?=
 =?utf-8?B?MXBaRHFRbHFNaXNLSU93d0tmbDJsbjM4ZlI3Z0E2NTNOMndZVmdPZDdTejVp?=
 =?utf-8?B?TkhZUVRkOWd0MExQU1NSU2JVck81bUMxT3lkblJuUWx6cmVaV3FlL2x1eGFE?=
 =?utf-8?B?REFMN2NNNGhrcUJyWTU2ZHpmaFBMRmtWRnpoRW9CUElITk04S2o1Mm1MZllv?=
 =?utf-8?B?a1VrQnovb1Bid3E2Q0RsTzgvU3YvKzh6bHRnbU5yV3BsVlA4Rm5qTlJlUkZn?=
 =?utf-8?B?Vnc4NEVjYmpSbCsrY2xnckFkNkp5ajE2T0dtTFFVZEJkTHhyT0tVWm5tb1ZD?=
 =?utf-8?B?ZkxxVWcxUEpmVzl6N2VCbHB3QVQweUh0SzhiOHd5em9LQ1pXTHZnMTFqcE02?=
 =?utf-8?B?UmpMTk5hdlpveloxeklnTzhxN1o0ZVpnZ1gvVGI4YkdwRk5PRW5KNzYxMzhi?=
 =?utf-8?B?RGc3SElzRzlDTzYzZzRETWg4RU1zTXlCVTJobVI5M1NFSVl0cjF5OEdCcm5M?=
 =?utf-8?B?OHU0NmRuVlQ1SXNDa21ST3hTVFJHYWN2U3U0SjRoMmFnOW1WLzIrQjBjNFVr?=
 =?utf-8?B?MDNqRHMxOWNIT1Vwam05RXRSeU4vYWNxcyt3VkRkWFp4TlVpbFErZjN2OGJJ?=
 =?utf-8?B?TGs4UUpUVURnWTQvNWVGWHdoaUhDSWVmaDYySWxtL3IrbkFKNVY2WldsZnRS?=
 =?utf-8?B?RlVPOGlUZ1N1ektDeHRPUDFtYmVUT0dlWU9oeVN2bUIrMXNJbi9VNzlWRFhq?=
 =?utf-8?B?aEVKNUtQMzExaWh6ekdqVktpWnRETkVXWXRhM3V3NTIwKzByQnZqdGd2ckky?=
 =?utf-8?Q?rAJcoDpNikI853NfhkhcfjSWC?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4unEY+IrWDERYSHcahAj"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee654846-48c2-4176-7dfe-08dabe390156
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 07:48:47.1049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lZKhn3QsSFc09+s1u15cRamT2LowEtdK4+ZIjP3VVXAExNsyWlFGZQOmLTWPQe2W7mtVd1wRFq2z0GUMEqqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7224

--=-4unEY+IrWDERYSHcahAj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-11-02 at 16:00 +0100, Juergen Gross wrote:
> Today all timers are migrated to cpu 0 when the system is being
> suspended. They are not migrated back after resuming the system
> again.
>=20
> This results (at least) to visible problems with the credit
> scheduler,
> as the timer isn't handled on the cpu it was expected to occur, which
> will result in an ASSERT() triggering. Other more subtle problems,
> like
> uninterrupted elongated time slices, are probable. The least effect
> will be worse performance on cpu 0 resulting from most scheduling
> related timer interrupts happening there after suspend/resume.
>=20
> Add migrating the scheduling related timers of a specific cpu from
> cpu
> 0 back to its original cpu when that cpu has gone up when resuming
> the
> system.
>=20
> Fixes: 0763cd268789 ("xen/sched: don't disable scheduler on cpus
> during suspend")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com>
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

--=-4unEY+IrWDERYSHcahAj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNkw94ACgkQFkJ4iaW4
c+74xA//RTRmv3e9gmOmMhCn3u9r/N0UfstySd8xkUpn3ECgUYtOH/PPjXCIy81e
fGX9Bn1NcIBifIwRDGHu/4JH4N0K+XGz5tPEH+AOenDlbmZlpKt8BSTaHUG525n4
K6HQ1r9W5uilnoXTzO5ks9obS8iGp1SE6+njNCDRjiWuKoNiB2P/cCJF08s69fmx
uPivcX8PENxDX7F/Pfsrww8EGqinplWyoGrNnUhhTVGyTeZOdE2o+nuzfDM59QZh
QNIQb7sUn40FupEh9YCnZeemPZW7VRkQVHOcUsP4Vf2YJcoIRkxzYM7aj3DiP3Aj
8yhhiD6dRGA1XrqJGQcX23aDHsgtipWPgzslscWbPHLTgmbICuaBj7H38NUNX2ta
2/8EtNwdnTJTaHFzefFcqONgExjy1YXo4wNTmLYOvG2d5nzakpKoZu/MGT+8TSlg
jCkaA/rOtQ+LklKPnXVaYeLkQH7nYXRc+yI0OWw1Izu4sN5edUT3Jx+TeWeSvnJE
1YiwD69SmeyKM9Uft4gDsYv+MxdIvd+P3D7Q2v0IM4QqYr4ivxOR5rmL+hFd/ycO
Xn/iCaCRbUfJqMyjuXCH+K+f6A0LC6aIKuG9uk31sOur0KE8gXjDhdAG9vHzqBfU
nqm8oqR2uJyhuT7ktINRTl+iV/c4N99izjiRdBf+ci+sIqf3IqQ=
=1Y+i
-----END PGP SIGNATURE-----

--=-4unEY+IrWDERYSHcahAj--

