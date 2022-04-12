Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF834FE51F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 17:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303709.518145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neIkd-0000vA-Hd; Tue, 12 Apr 2022 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303709.518145; Tue, 12 Apr 2022 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neIkd-0000rt-EG; Tue, 12 Apr 2022 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 303709;
 Tue, 12 Apr 2022 15:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUK/=UW=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1neIkb-0000pk-6b
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 15:48:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f754883e-ba77-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 17:48:16 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-c2aBBBbsNhuOTx-P_80g0Q-1; Tue, 12 Apr 2022 17:48:13 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by DB7PR04MB4154.eurprd04.prod.outlook.com (2603:10a6:5:26::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:48:11 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%6]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 15:48:11 +0000
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
X-Inumbo-ID: f754883e-ba77-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649778495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zK5aaapFFOun7/nhGJMeTfIBh3GoMdwRavkUl00sQFg=;
	b=FO1h9rPGPswHfTT/aFcaEN5OP+B6/x2vUOA+uXbO2h9KFwXbKzrfFHVQRvGQ7TilORsYrL
	wMGTla7qP3Yde53IG4ffmJ68pRxdIPXHGPjqqP5XBsZQVeNyq0vWT28iV51joMsvCRM6/k
	RlABlTnZyuPnJRucTRucMKHx6yPYplk=
X-MC-Unique: c2aBBBbsNhuOTx-P_80g0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebkzoKF7/dfpruK4DK1jJq84vj0VPSRFXeEkwKX759b2QbiK6mViXwY7jowkpkTFV+q0Me/xdj5O4EeuwgZVBQQDpNcmDhbnxaM8rOkkKX/G5leaBLmGfnwrdF2qFCv0URoBiR/H6X4RTAuiL4DDNMaNR6X3O+RzQG2uSKN/Z8ubx1dQmCIskeWAhfoC12/YqsBGu6AM57KVrpHsr2WSYfqhOp3JpqFGMTIPPElYcCnbVZS1e6aVj//DwDHlHgqTnW30aYmT4XRZ12lNlv2MNKIVVfe89HqHJKmZYIAhWwT9cG4K9TezyWbJ3QDeEM2u+NtIloUc31huxXsGVW7HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zK5aaapFFOun7/nhGJMeTfIBh3GoMdwRavkUl00sQFg=;
 b=nyAw6bYEIxaq7pVRtHTvy6kygBO4KFjTka6vY+tATNiqzHbKRXbzWSpuaynMZHfo6GbvGz0HyCfzsg+gY2QZfDmLO/hlu0Pd7dY2ynKa92DUJeifptU4m0uAk66F8w6hmDIaEc6bB8f+bIMZjdvl+ghqZhrc260cAgEVxqBcozmaAT65jcuqNsYm0cGzqT0WIhXzvAQKt60ekN2ITtvy5tganxSLleZmExcGuh0ttOwlahub2cizlWugAowMQgxkHZOrMdGxyhiknIW07Ytsy0GLwfsf8YS1fUxY4AWLCpR2Ea/NbdB2grPqOAnn8e5R0Z4YK5VTKNPsBKvWc14MNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "ohering@suse.de" <ohering@suse.de>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Topic: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Index: AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAA==
Date: Tue, 12 Apr 2022 15:48:11 +0000
Message-ID: <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
In-Reply-To: <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 943e9f1b-6e3b-4d68-bdbc-08da1c9bd925
x-ms-traffictypediagnostic: DB7PR04MB4154:EE_
x-microsoft-antispam-prvs:
 <DB7PR04MB4154DE11AD427B094FB759DCC5ED9@DB7PR04MB4154.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BdejaI46zJlasc+gO/qLs3hgDk8aNQ+p3cs1b9jdZBlr9znseaNmB4PVmIixyFB9CLNzRcSK6ySRUGfLrpbyOb3ygwnHdT1HnfOhrrZh+ovOis349im28X7dOhEk+fSA7GCrgYuAhAWIgjMctbcteLNHbzchr3d//oaePj1AVzWGjd61vr8oRiF/gXUcSsjPDmOqR+FIBKZ+n0EGqz9cD2US5rgVRPNYVhsSYEMZp9EuFKL36RUfimQCbP546W45sauu7dU7l+EhyAcYAQd6Q2a3CfmwzdxFERT+pqDBYQeh2h+asgtBMWxxj4Di4YGpdLh7KmZfXFT6ilDPWVJAO/gF1MLL1FHTj1Bx5pd5e6Uo9Z+CKgCSBY4ur5rUb/z7qAMcqH3ctqH1Ah6zBleqJDPJMadQ7P1J2O1bPilqJYXo66tjYE9JeTZr2kcVPEfxQEI7YlUsQU94wqxWgqEV4Uh32YeggOZejP8XVvTB8hVCrEQBNLUJla+Cy2glnS5oXd+SmcZKwoqEVcH5DRsN5gP7c0kvARoLfoFZCviDffNHbqVvc/R0LJDN87gl3fEVlXFr6Qo26eP37G/vilI6A+PvNXaRISYg8zI9nmF0/d0SubPNIhZ/UmUd0BD8N3itD5/JaUxJyKU3edSsAALf0n8f7onVAwnEAzATcgg9o6FvHR6TtzdxY0cVgGTm3Nu4c4u6c2MH/t52ZjwqTdSLyKXwoH6GgUCsxn3NU1lxc07C0tbmxbvmOwLS/O4kYt6ww2PSQEAlAnOueHndgoGwQkjcQdohiXWsRvwQrbEnbrl+OB/MqFhJw/+R8bcVClwE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(8936002)(6636002)(99936003)(5660300002)(6862004)(26005)(2616005)(186003)(86362001)(38100700002)(4326008)(38070700005)(6512007)(6506007)(83380400001)(53546011)(76116006)(66446008)(66476007)(66556008)(2906002)(122000001)(71200400001)(37006003)(66946007)(64756008)(316002)(91956017)(6486002)(966005)(54906003)(508600001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wml0Q3N0bUpRTUl2MGxLell3SGRnUkRmVGtOS0pXdWUvdkJjQnhBOGFSRHF0?=
 =?utf-8?B?eC91K1JnVk9uR0tCM2dMZ25pOENzOUEva3AvWFRNSDArVk03R0F5N0RaRitx?=
 =?utf-8?B?SFNYSllFeGpwVmFpTGVzU1JXMUw5b1dZbEpLeW5YN3JIWlY5WUZvaGt6Uytu?=
 =?utf-8?B?TEtVeGNSTjV6WjQwUzNUbmNqNVZSU3ZQZW9pK05BVDZBL1RyczFsQjRncy9H?=
 =?utf-8?B?Y3czNk1DcVQwK2dYb2cxMlhiTlZIemE0UDVPZHBSUHlrRWhKd09kVy9xNXF1?=
 =?utf-8?B?UDQ2VUZCUEN6clNVTVZKRzVxRTU4MWxHdktob253NGhzRVNoMjd0QlRJSVdp?=
 =?utf-8?B?dm4yelFpeU41TkFBandJZFB0V2hnSFVDb0tCUWFLSzNMYWNpQ2w0anB3UGRM?=
 =?utf-8?B?MTRleUlBKzc5Umg3STRvV0pMUG0zZjczWloydjhPb0hLNDFWaEZlK2lpc1ZR?=
 =?utf-8?B?UVVseis4aEJSeDVOT0Y4elhWd2diaTlqYU5IejkyTmVRUm9BY2s3amR5Tlo2?=
 =?utf-8?B?T3pVZEV4VngxRW5ZS2wvS3cyVC9wTEJhcVpPMlN5TGNycGhkY3VmZjJ5Qk9k?=
 =?utf-8?B?L3A4T2lnaXJ4SFFPUDhMdkR2ZUozLzFqVTdQZXBtekN4Y2tqSnRmWTJsdnJ1?=
 =?utf-8?B?dHZmTktDWG16eVVyQXJvUCtpYXZNMWZqQk85UUk1Z05KL1FJUXNjaG1YTUhS?=
 =?utf-8?B?S0RSbGZ3VEdLZDZUb1J1WGc3NVpoczhVVVd5ZlZPQklCUEJlWDhjWTA3RWlT?=
 =?utf-8?B?OUJ3U2FtK2dHdFJqQWxaNGNaNHFoUWhpeklEdTZhMHcvVkZxMUN5b1Z6UnZj?=
 =?utf-8?B?Ly8ycFZpU0FiREhXVDVDTUxuRUVKZGVUbE5KNTVJQ05zdnBkOXU1QmM5STJW?=
 =?utf-8?B?bjlMR2I5cCtEQVhUQ0xwWFR6UjlEVnhyNzB3TEUrQ1FFQWJrQjRRUmFqZzBU?=
 =?utf-8?B?MXpuVWZWWjgyQjh3dGNaeVhMRDlWQ1kzNTIzNk43UjBua3BCdGZyRDJENy9l?=
 =?utf-8?B?cmRRb1lqeHdxanEyWDNuK2IwSjhuV0VZcVRaQ0hFVFhVWGVmM0ZvR2t4R0g2?=
 =?utf-8?B?UWM1dEMxQ3V6ZDh2R0JxeUY1dUFCYW5adUpGc3pPSm5ZdHc3MTVhZU1SbGlm?=
 =?utf-8?B?a044Y21TdkFpQURwd0J6YmNqZnRUYnRRbGdwdUh1KzA1YmV5NGZ1YXI1SGo2?=
 =?utf-8?B?WHhmTjRFN1ZJbkpQNmgxTXRjNkFBVlBBNzVENjVwNFdocWlCNEtyU3hMRU4y?=
 =?utf-8?B?MVMzSHlkczN4TTkzekpnOGFpbzRVTW1qcEIrU3Z1WlU1R3hvOFROL2hPSERm?=
 =?utf-8?B?YTVLWkpvU28wQTRYRHNlMlRidTdtWXNGWTZnYzE4UHlOMExaNkI2MGdpUlNG?=
 =?utf-8?B?R2k0Zm9Eclp1eE9rSUVZaFh4SndlSGlVTWZmUU8vaDRHMG1Cb1VzWEg4alYx?=
 =?utf-8?B?bTV6OFh4RzEvV2JJbnhNYWNsNVBFU0QyTExyZjhMdXpHcUljZjJITTZJOTZK?=
 =?utf-8?B?MW9UdnQwVjhIZmtZK3E5dEJ6azRNWk5DUE93RzZUUXBvc1RMM2IzZ0VKbTZv?=
 =?utf-8?B?VUplWWhIYUluVW9hSGRrY3IxdkhwbVpHSHRhQS9uaXhUY0ZXSUQ0bWg2bm9n?=
 =?utf-8?B?V2dBSktXcmxQRGFWWWdvMi8wRzFXa2RhUVJYUWVMRTVXRm9VbnVmQXpqZ2tP?=
 =?utf-8?B?RjVweDVxckdraDBLVnRwc3RCYmduWGVabm9XVDJvd2xZTjR0Ymw4WGhxVGgy?=
 =?utf-8?B?SVRoQkt3TXYxZ29FcTVVdzZGbUwzQVpIUmZubE5RWHBXR2VuT08vNWhTRjRM?=
 =?utf-8?B?c0N1amxsYmloTnQ0bjJscVIzakg3OVgrOTMySUZvZGtSVmthMGhnaTFRbm1z?=
 =?utf-8?B?YnpGRW5zdzRwRGlLNVpkbUZ0NmNLNzJTN3hTZXhiRjV0WWx3MXNmRjYyNFhl?=
 =?utf-8?B?YmlTcGU0RE9yWGVBU0s3ak5nbWpxOGJiV1JIWjNldk1rUlpKSmlJZDhKV3dS?=
 =?utf-8?B?RktZWnpPaTgraHI2R3U0MENvNWM5OC9wU1hDQUR2VDZPTFZqQU5JUlQrUFJ1?=
 =?utf-8?B?MmFxSlhJRzlTa2RFQWhCdW4rQlV5eUV2QmswTGkzMXFYd0xwSGFmQ2lCbHhy?=
 =?utf-8?B?VWx6Y1p4QkRKS0xvRDRTRUFCams0TmlkVCtRR25JK25MSFBSZmFDTjR0NExz?=
 =?utf-8?B?WVhpTGlsekRVZnRzUW42eFFSaU1FNnJXREcwOUJ3WUJ4RXR6RDZ3ODlEZ1VY?=
 =?utf-8?B?bjNYVmVZWUJ2anFtMk1rY2k2dkwrbnRJeUtQSVhWRGI0YlF6ZVIvRGlsWEFq?=
 =?utf-8?B?Q0VoNTR3ZnIrdWpVZkcyejdodEpGdHN5Zk1GcUNsQUNOMDRmcDRVZz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-d93xAvfylIYqUOBVwxUm"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943e9f1b-6e3b-4d68-bdbc-08da1c9bd925
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 15:48:11.3734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZzqHnFfKHPHvxG7sGu7uUwOeaAwDKekSIn2lx2G9vXDY4gOkXuyylhqBGbZjrgKOijnIUb/hAY+IRYbIekJ2pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4154

--=-d93xAvfylIYqUOBVwxUm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-04-08 at 14:36 +0200, Jan Beulich wrote:
> On 08.04.2022 13:20, Dario Faggioli wrote:
> > On Thu, 2022-04-07 at 15:27 +0200, Jan Beulich wrote:
> > > Credit2 moving the vCPU-s off of their initially assigned ones
> > > right
> > > away of course renders sched_select_initial_cpu()'s use of
> > > cpu_cycle()
> > > pretty useless.
> > >=20
> > Mmm... you mean that Credit2 is moving the vCPUs off they're
> > assigned
> > ones _right_now_, or that it will, with this patch?
>=20
> Right now. On a 4-node (6 cores each) system with "dom0_nodes=3D0" I've
> observed the 6 vCPU-s to reliably be put on CPUs 13, 14, etc. The
> patch is actually undoing that questionable movement.
>=20
So, yes, as said, I was wrong here, because I was forgetting that we
update dom0's node-affinity according to what we find in dom0_nodes,
while we parse dom0_nodes itself (and it was stupid of me to forget
that, because of course we do it! :-/).

And in fact, since node-affinity is already set to something different
than "all", sched_select_initial_cpu() picks up a CPU from it.

And it is also the case that we could, basically, use that later, in
sched_init_vcpu(), which is kind of what I'm proposing we do.

> Since I have a large amount of other patches in place (none of which
> I would assume to have such an effect) - Olaf has meanwhile confirmed
> that the change helps for him as well.
>=20
> > If you mean the former, I'm not sure it is. In fact, when
> > sched_select_initial_cpu() is called for dom0, dom0's node affinity
> > is
> > just all nodes, isn't it? So, the we can pick any CPU in the
> > cpupool,
> > and we use cycle to try to spread the vCPUs kind of evenly.
>=20
> The CPU mask used in the function is 0x3f for the example given
> above.
> I did not check which of the constituent parts of the calculation
> have
> this effect. But the result is that all CPUs will be put on CPU 0
> first, as cpumask_cycle(..., 13) for a mask of 0x3f produces 0.
>=20
Right. For instance, on my 16 CPUs, 2 nodes test box, where I tried
using dom0_nodes=3D0 (mask {0-7}), I saw the following:
- for d0v0, sched_select_initial_cpu() selects CPU _0_
- later in sched_init_vcpu() affinity is set to all
- later^2 in sched_init_vcpu(), Credit2's implementation of=C2=A0
 sched_insert_unit() does a "CPU pick", assuming it can use any CPU,=C2=A0
 as the affinity is "all". It ends up picking CPU _9_

We move on in the boot process, and we get to create the other dom0
vcpus, e.g., d0v1:
- d0v0->processor is _9_, so the cpumask_cycle() in=C2=A0
 sched_select_initial_cpu(), done from 9, with a mask of {0-7},=C2=A0
 brings=C2=A0us to _0_
- that does not matter much, as the CPU pick inside of the specific=C2=A0
 scheduler has its own logic, which also involves a cpumask_cycle().
 And since we picked _9_ before, and the affinity has again been set=C2=A0
 to "all", we pick _10_ and, for what we know, that is fine.

This goes on and happens for all vCPUs, with the result that (in the
worst case) all of them are placed on CPUs where they can't run.

Once can think that this comes from the fact that we do CPU selection
twice (once in sched_select_initial_cpu() and another one, inside the
specific scheduler). However, this is necessary, for two reasons:
- a scheduler may not have its own "CPU pick logic", as that is not=C2=A0
  required
- even for the schedulers that do, we need to have something in
  v->processor, when it runs. And sched_select_initial_cpu() is  =C2=A0
  something that is (should be?) simple enough, but at the same time
  it puts something sensible there.

> > That's because, by default, affinity is just "all cpus", when we
> > create
> > the vCPUs, and we change that later, if they have one already (due
> > to
> > it being present in the config file, or in the dom0_nodes
> > parameter).
>=20
> But that's what I'm talking about a little further down, where you
> reply that you don't think using the more narrow set would hide the
> issue.
>=20
Sure, as said, I was missing a piece when replied.

> > This should make sched_select_initial_cpu() pick one of the
> > "correct"
> > CPUs in the first place. But I don't know if it's worth, neither if
> > we'll still need this patch anyway (I have to check more
> > thoroughly).
>=20
> As per above - sched_select_initial_cpu() behaves as I would expect
> it. It's credit2 which subsequently overrides that decision.
>=20
Right, and it overrides it, because we set the affinity to "all", so
it's in its own right to do so. And the point here is that it is indeed
not right to do that.

So, as you said yourself, we should really change the fact that we're
setting "all" as an affinity for dom0 vCPUs, there in
sched_init_vcpu(), while we know it's not the case.

And while doing that, I think we should consolidate touching the
affinity only there, avoiding altering it twice. After all, we already
know how it should look like, so let's go for it.

I'll send a patch to that effect, to show what I mean with this. And...

> > > =C2=A0But I guess that's still useful for other schedulers.
>
...Yes, I'll rebase your patch on top of mine. In fact, although
tecnically no longer necessary, for _this_specific_ issue (I tested
without it, and things work), I think it still makes sense.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-d93xAvfylIYqUOBVwxUm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJVnzoACgkQFkJ4iaW4
c+5ihhAA7eKe8Dk2555pLYHgBOvVJJkP+/ccii0VzuZFvUT37CQ1u31R3ja1JIBB
K540sSEpoOX9VPKH9iIX6k1iBO3vn1pYLcU7NUj7ptlQvjnNvgxtwGcHbZRCgLyS
lY35ZSevdM+IliJND8oIjAzBPrnF7gMsHZtJ8NwBEGDneqdr1Gcrr0ahfCujHER+
9dJg+2oaVXfkQlqVlUI5gpTNz4mBDDN6QktjFHsRBY8SOPEDWbpVlZhdr/vdb0jF
UNDYXyQGm8z+rlNxzH77pJIbLeHELLdV47g1/GMdHlZ8Fwr3p3azCqeg/1Pwr9ij
q4oxFRQbVtbVIOqrPZefoZS3jmfzQ3pCe1ne0HEvg1Zf2i8HgkjxBPyFlPNP3XA5
021xcScaYS+beKu7ExKRiBCkQFY/hXlzaIP4sGoTDewWl+55MjiWcgw9EdZ3SLVC
3MMJbMTtgfPhlwj0OCNJGLuNvUYk0Nh2IRE1yydvSyf9nXTJQ2z/LR0G655pIyZY
uft3YOZq3szBKJr4w22oIt2smXhloPiwIsOXZCUXUNkbmqqVkZ3YsLB6HRWaPgEO
CNW/lheXbJkAnArJLr2myWSdhzZX3I3W/34Z2XU356EAf/M6RrsAY5O0q53PWN6q
loTzhtpX75ewVgBeBhxctSB6B7Zfjw25b8N4slomlKx/WZOA/Dw=
=3uoD
-----END PGP SIGNATURE-----

--=-d93xAvfylIYqUOBVwxUm--


