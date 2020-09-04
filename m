Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76325D6E6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9OS-0004lw-78; Fri, 04 Sep 2020 10:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0SP=CN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kE9OQ-0004kU-Dy
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:56:30 +0000
X-Inumbo-ID: 4a9b0687-866a-43c4-9094-23f366c2cd3f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a9b0687-866a-43c4-9094-23f366c2cd3f;
 Fri, 04 Sep 2020 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599216988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZyFvX/RrLuJJRosQdwXKskgMtZGkZ1E3YViEFZW0we8=;
 b=Je00LW8qecJjtJQekLqZephKttflazsTl2RAQQdivfpC4zspntQq/B0P
 fh9HgGpqtQJ3U3MrgtZWM/q2X0tNkxA2OttHoB4uqFyZ0Z4Vy8882y15W
 vyBRtDNguTZ2YiwflG2dgoAFpTbQ+5efc773QNtaVnxZgVm1QvTerRFeo w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: QqZ7oudaTYfadfi4WdQXvsJ7ojwiNq7Ae9s8tKVPO8J9ZjjYthI24JTF6bTofwIcE1tpWM+e71
 zVHwWV4wRjtAUrtxabI2hhMCnMFDaRrS7DsDL8/zoLkfZ2b6Wzp/JNYUUbqp8AIP4DD+0GUp5v
 C2Ahp8/X11qx8pSrPL2Mw9y6Yu45vrkHEWyXb1FROR4/ielErjz2d2pO0TFK+lacHVGcM5D8uP
 mpbz/wwMR0JeGrwvM3Hjw2CiYVzMQRzZOnMRqt2EtUxEbkeJwAsCKm1ZeNOhNVHozIKSh+p0i5
 liU=
X-SBRS: 2.7
X-MesageID: 26126394
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26126394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfEPyA5i45VafMJ2eZdBfQq90lBZJNftWCEM6utCCPG43WTMtusMuiQiN233yNpPsClG4ouoPWHImTwR2UOCZ1s5Gi2Ll+FbtDZzkjTR/me3S/YHiApnh98yKsZsOpA1iiFucEAbPdPewtn7J1eY2Dj1LK0FqGrop+nYwMeJFcPKuhj5rnuwsKDfCnbJ3Lj4eeTLWXxKzHgvDnaXS2XXoI4DDXkh66NrpZq3b3//94P/bZ0YeMcWxzeSXh5e2ya2YDRubq4RAGFFb6jL5uN81XL3JxKgVqEvy+cZDTrk3Cq2rqQWhx9l/J1ujBJxvDntKOp/5XjsVf2qtbzvtClHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyFvX/RrLuJJRosQdwXKskgMtZGkZ1E3YViEFZW0we8=;
 b=AgB3bHUqW8DcNUQMcsSYfcGaWN4uBsjBjYh9IulfUzKjZBZby8nVTbk/KdLTLEG59txin1YgdZPY5XXTJO+U78yr2se2tX4k2ScFHcKkfe4igoECK48GUP0eQtfdww3dYBanffkb71gcqhDZe6L5DgQWuha7Ez0HghHrOlziNnCN87m4080zACLpxP9Is1DU2RzSP68ac6UH34eIzwPRm/e2L+i2cQx/cyxQqoOUF+ug4ax0qMu4NE9UFNOMAeu8n1Cx2uST7DdgVZhXKzVNqPEAHqr0QiBi1/J5rY03Ujayc0e5FkfOwyvWDfhTlXzM6GxuJIZw6WX6AND3WL6hwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyFvX/RrLuJJRosQdwXKskgMtZGkZ1E3YViEFZW0we8=;
 b=oh48WCl37h4014vqaEHvnPqcohr0broDWqzRYVKEqZW5q3zJl8x//1YD9LKadL9ctwsaHDKVLSt1liZbpdvFQENDnC38FiKVEuTW8afrNYujWh4o0Fogj0KS7gavKks95LbI4wlPolEVAX9hby5lzp4rFZzb4VasuHM7Pm6jee8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQhHT7mTtQgECZKsLV4pzAaalYRMuAgAAHmgCAAAJnAA==
Date: Fri, 4 Sep 2020 10:56:25 +0000
Message-ID: <6DDA2B49-A90C-4563-A5FD-D0F725442D04@citrix.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <45CECAE8-2E29-435F-BE2C-5F00A2AD9A9D@citrix.com>
In-Reply-To: <45CECAE8-2E29-435F-BE2C-5F00A2AD9A9D@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec8524ed-d30b-4b09-6397-08d850c12b1d
x-ms-traffictypediagnostic: BYAPR03MB4328:
x-microsoft-antispam-prvs: <BYAPR03MB43288BCAB979E3F55965678B992D0@BYAPR03MB4328.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rxu80PyOtqxZHQZkW9xpuygTId19BIboPaK7ALNjtz5ybACRpdM7j0M6SWYKEG1qmi9Vp2DcOfMYvuaxhAVbPTXnObCqVg5CmAwMt+rUB1w5e6FNF5zPoGS0oO26/pLu8eDpOf4AcVECgnLIFSJsSSOjBrG0UXyLCerDsQuxFJT/52CdxEQw5GUi8Vhr35o0c9Hv2oLn2SbpfduXmE7EVJ0M/F9LAa6AsJiHT9SFH4U+5Wv0DjzNysyPLWGxAqrOGvMzwcWGVTWWsNspixWin9L5giyFK34cf6yw9WJ9xDov0zcg9EYdknVR5O6VG9NTR6keSqTDJJmi5sdwO6lHx3nSvCEvekhptKgqN59wIumEi8f3hhewYpfMs03VUsI5pKh4JiiQMiEmJcnETHNs8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(36756003)(478600001)(316002)(8676002)(6486002)(8936002)(6506007)(26005)(4744005)(6512007)(186003)(966005)(33656002)(76116006)(5660300002)(86362001)(4326008)(6916009)(71200400001)(2906002)(66476007)(55236004)(66446008)(53546011)(64756008)(66556008)(91956017)(2616005)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Gene9eNFg42nt0FqsbAQyMY27kFuaDs3tYDgI8wbGuxQa2hncEMyd4ETW5LQHk6lbgetHjF4uNlcfPBEGRY1BMopLcTf9HDn7dlNTVVVZ/TUL3q9bwXzjnNmME0WLL0a4La5I3S00MJPbe6H+SOMpOLpvunFb6n+TzR++CfRIwqYHH8UeGzEsgrsoDliQ1xNHkx5zBwXE9pm/qA3rowFGWW4EcZ2A7+801CZn8pbKl2Fy2f+g679fn+OtsAH/b3X8gPFUmvE+BiwYfBgh508UrPHbXVxNhuO9LpYKX4TiU3aE3KZYQAauoX+jTKnLPYuTBzkj2i8vrNl4XzV9MpZuFBlMsCpCdOOj6JPcQm71+ffE/GYWjGPxPEBbpKU53gj9JM2ZT8M6EuUBnOwoU2LrFFJtrGRyRAnasAW6UMM10uylQRN0s3IFErNXxXd2rqTkwSoMmqf/Ozc/JVtbBSRVUFmkU2sIDfoObeAYBZS+NYCsMVN8XjCCp7yhDygb7V8bqav1PRTrqq1MGUeCACq2lE2hf3u5gb5yUvOPrnxjoD9+rh96m27gCuMHJt756m6lnkl0PBV7WmvK1CMIMRWcnnjnR8Ye+phGNHQeIe69PKQ9czDP2KnaKDAYYAhavvKUNJsgXyDF0MTrWKN2K8yRA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD7E08A23F2E654D9D7D680C501D9E0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8524ed-d30b-4b09-6397-08d850c12b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 10:56:25.4292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkyjDCOC6rwbGoT2T4t4pdamPqBXlbujKLk/BpeSFtuHmTN4U08NiqXpmb/1jbeuc/XcKa45vKjq0GSpWEYcrfzw7XkUSr+gPg+LYoGALfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4328
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Sep 4, 2020, at 11:47 AM, George Dunlap <george.dunlap@citrix.com> wro=
te:
>=20
>=20
> If the volume of patches increases (or if filtering becomes more of an is=
sue), then we might add a bot to look at the contents of the patch and tag =
the appropriate people (perhaps extending MAINTAINERS to include gitlab use=
rnames or something).

Hmm, seems they have something similar to MAINTAINERS called CODEOWNERS [1]=
, which is checked into .gitlab/docs. The challenge here would be keeping t=
he two in sync.

 -George

[1] https://docs.gitlab.com/ee/user/project/code_owners.html


