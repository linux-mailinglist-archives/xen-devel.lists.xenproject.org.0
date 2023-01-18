Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A180F6728C0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 20:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480786.745346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIERA-0002KR-M6; Wed, 18 Jan 2023 19:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480786.745346; Wed, 18 Jan 2023 19:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIERA-0002Ii-Iq; Wed, 18 Jan 2023 19:49:32 +0000
Received: by outflank-mailman (input) for mailman id 480786;
 Wed, 18 Jan 2023 19:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMWs=5P=citrix.com=prvs=37540d4c2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIER8-0002Ic-KI
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 19:49:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36843a51-9769-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 20:49:27 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 14:49:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 19:49:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 19:49:13 +0000
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
X-Inumbo-ID: 36843a51-9769-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674071367;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E5OmisCj2EvPhsWk+in9WxtUdVf1ElyNnmycT5M8x70=;
  b=IC10d0SBfR/kOZqgV2rlfKrSJGRYI/92Jgld4TSDACRa7rK7uWiHoWmx
   RxJeWcNb9Tarl8UKZalVf3hvoszeLPb0mY6hgm06y3Z0pYwkpnlH3aYba
   Jc/GLp8ZpTOiJ0TGivnh0c2Ltb8lKtcfFZDw3GdbbkcOFMF7N5kX9Fvk3
   M=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 93268916
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6fXnF6KPUZhGzjzeFE+RBJQlxSXFcZb7ZxGr2PjKsXjdYENSgmMEz
 mofUWuPPvaJMWr1e48jaoq08EIBuJaEy94wHAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVuPa0jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4nLX5Rq
 cZAIQsuRT6Bidy/+qCUGq5V05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHihBtJDTePQGvhCm1yK+WwNEzAvXEqVoqOUpU6bQo1bE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUj0qy6+RXNhWKqr52QFwotvFyJDiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02AIH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:2qr2sK/La4+qhAtxQMtuk+H2dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrbX5To3SJjUO31HYY72KjLGSjgEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpgdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTij9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qt5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 B29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQZo+dY7bWbHAbIcYa
 9T5fLnla9rmJShHijkV1xUsZuRt7IIb0y7qwY5y5aoOnNt7Q1EJgMjtbAidzE7hdEAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke++3Fyb3pDZRHUk9upFpH
 36aiIQiUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrrn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeZGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPiq6Y0JKqi9T75LJ9RbGk6DJl+GhRzvv7WQFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4mllUBg==
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="93268916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwDqwWTZNy71NTZtiyg/0ml0oHzm1wR1DAGwwsA0REwz9B+LvrwK5p9IkRB3HiXHQ604NS8nCPk1pcocvK0q87wnzzuJ8pnhueIg5gX7GXjAbOm3YSdXpgFHfK+a3Sp2GwrzWrKGymNc8wh2XRp99mVe0qZxEbAxZCaOqFpR8ab4He/0Ln9R4X2RIrdXvl/hk20NrB53J0bbA2ox91cpBNAs4JJJUdf7tlENAL/5yQ+hDQiPPa/5hf4eUlYfxMc82/3MErFFwwU3BzLcBTIZ+oCBDWSOVVYo5Ca9FL01VT4Y6keKa6v0cr4SCHvFUhDxV244sJolfN524g6pBANizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5OmisCj2EvPhsWk+in9WxtUdVf1ElyNnmycT5M8x70=;
 b=A38OFVhucDwWiRjO6HfynxeNKb9B61QRq4J8fRuUvzW+G+Hump/lrJPi/QcrsflOFKdJwVtVCjuIRulbcgNKl1NdFOZF3j7/QnQO3IIKSNs7MfU3DrwOe1vn4yma4Jjw02OlzvsfijMJN7j0QMY9DNEoWhhLB1Psge6FBxI7JqROrnDT9z/8fjfMt+Gz9Z+ZoSA68qGQPc0R3pvZUNPfhe7pb/iElzWMeHDOlN1ZeL4ed2tV8dW2jrNTF2iw50QYJ3eiRGK1sD5/VvSDRphFVZ4c7vl+QArL/b+iFsOzgpulMTmYxuhSN4WxR5fPR9VJYA6wDZry/xKVl89HhLawtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5OmisCj2EvPhsWk+in9WxtUdVf1ElyNnmycT5M8x70=;
 b=Ev3pi8DI8MXGHZYnuELPxkwnfKjBi29u1jcJtKsaagIhtaX9QjarQaZhTTyu+vH/KiH63dt0xctMNQ3/H60AwGPBKoiUzA583wATn5+K19RF+8//Ns6GDfRnMMosaQBEjMqBCA5zCoxkhSnSaHr8KvW0yfcKh3uIvbWho6QN6jo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Topic: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Index: AQHZKdXmSfLi4OljAEm5WNlNB2w+ZK6i3JyAgAGjEYCAABiGAA==
Date: Wed, 18 Jan 2023 19:49:12 +0000
Message-ID: <fc1e27f2-a36d-ed5e-6bc6-959c5940ed7e@citrix.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
 <Y8g4pSOHvrkqmbTU@perard.uk.xensource.com>
In-Reply-To: <Y8g4pSOHvrkqmbTU@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS0PR03MB7228:EE_
x-ms-office365-filtering-correlation-id: 637c0b77-121a-4b1f-0a1b-08daf98d12f4
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sYJ42U6XcJFqWh2Y5HI0r2/jMDYiiFTOXgyEMRyI9lq0f9Qv+/JuvRCoOWRDHv36lKp4/we2DoQZbmpGNOWx8N9n3Dol+BSVGdl8rNpOSjoZ117Tn7cft2D61ZF8vp01yTkUwTt297U2oKLrBl+XXaTzWzUILCWwjPVwamcEP+ycAKRsXtje+ACt3tmqwZWIZhcMpeAb7CqtcaGucOYTata6izLvTpki35FEm7vhy3/T2lLqVZSHSmjL7Zcrbm4EKLobvFJhbieY21Fd0IhZREK0763aIYlotGZ49LEx9QPhtYO0wxNZy1XXvWPCJoJaREXshdrGW1IA7RuU+Q3efQHGG7bqfwbVg6zy+QFQ1Ql9mu8CS/u2e8xm+J0c+Q9/9mFtG2ermRnwDSTUMrUZ0T2EcsOPuOsMTj8f1nBJA83mFUon5+tUH2zQ9YXqwdevRWnhtTna8zqeEABEsRrpSdgUIDN90ec71eIX2/6YwrjM1XeV32F3cKF3SLI5IxsycoZG9VxtoXp5hP3lORH49YS0xR8Fz2rpTOocmIfaDnp5MT+3byr0NbGvekhElUxaM0a2Y8cbMw/kmgmtvEgiZoW5guGQSe2mjvoSm6ECA1PauF6wRwSE2/JU4nd8wohK64dFmc8PMkD0fI4H7Q3thgBlEPGioIuV57N979Q53g7kenZ95C9NAo8VQiSRuCBEr6RYW0eDSCozv3vrkfz5iEHo/bwwmSKYw6iDfPaBWSQkEalfnbjUNoweS3W9GV/TAkAxo2LsEw2qP7RT7MgBaA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(91956017)(86362001)(66556008)(31696002)(36756003)(64756008)(6512007)(66946007)(8676002)(53546011)(66446008)(186003)(41300700001)(2616005)(76116006)(26005)(66476007)(4326008)(37006003)(478600001)(6506007)(54906003)(6636002)(316002)(122000001)(6486002)(38070700005)(71200400001)(2906002)(38100700002)(8936002)(82960400001)(5660300002)(6862004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3EvUjFxck5vSThBZUU5MWFKN1FUZXM3L1JZZzZITEV5WG1XQno1UU01ZVdq?=
 =?utf-8?B?MHVUNTRHbHI1QzU0ZHMwTXNtbCthd0N5NlI1Qm9lUmtrMENZRnBJbFJBaC9J?=
 =?utf-8?B?a05nQzY0aXJ5SkpsOFlaSXBLY3k1YUNXSW4wb0IraUREL0xDMnplR0J0U0Jj?=
 =?utf-8?B?WXlqM3RJcjFyWGtqVlVwcFVtcERvcFNGS2w0N25GRHp6dWxNdGdmRzYrWDlp?=
 =?utf-8?B?RTRqdGE3ekFOZ1lSUi9YUFRUa1gzcGlOUTF2T1AwajQvenlxNUFFMnhvTlhZ?=
 =?utf-8?B?eUh5c2tJcFVPb0FvcEVPak1ud2drbzFVb3FwVU9uZlQ1LzVhUmd4NXV3NXgx?=
 =?utf-8?B?cTJBWC9MQjlnV0pKZzNQNEg0NFpoZlV5aHVTQlRMMDg1SXFJOTFhWGNmanFn?=
 =?utf-8?B?bUN4Z3F5aGZ5N01Ec0JrRmJnZ0IxSnNoaTkyWWh4d0ZkT0NRM3ZGbGdyUkJs?=
 =?utf-8?B?QXAvY29zUGlOcTZGdXBJOU1sMWFxZkdrUTdaNjB4djh1UFUxczNiNmppQStN?=
 =?utf-8?B?U1g3RzhORWVyQVNrUTNzNVZiSUZIMUpkWU9BbDRYbjViRVZINk1aZU5aeWFK?=
 =?utf-8?B?UjFEK1J4bURKMDlUbEJzUlRsWGludXMwWmRLSnZ1bElhcG4weWtFVUVtdHhx?=
 =?utf-8?B?UERDTXVsZXhQaVptekRXZ1BWcHFUUGUycXpBM3BWWlNqTzBObUx0djhVZUdn?=
 =?utf-8?B?WXVqb00veGppdzNzT2NmdWlybGVRb1JHUzVnbmhuTXRJeUo4cFBHc3JOL1Vl?=
 =?utf-8?B?blJadE9zTjd1VFh0cld5WFBLYU15TTJGb0FGRnpaQUhHbFpaTjBuQkoreXNV?=
 =?utf-8?B?dnhCTE9iNTlTVHFJb1BMNWhYMXRGQ1BBWGJpdk9qeXk4VmpLMWowUHBvV2ZK?=
 =?utf-8?B?bGJzRGNkZVlaNEtKWFJ4aGlDN1RSQjl4N3BwcUt1eGplaUd5eFlWOVVtaGs5?=
 =?utf-8?B?dG1hNUFzc1hOTVlCcC9EYnhRQ2l6WU9JRThVblV2TVRvTU9TMktZQk5ZeGJC?=
 =?utf-8?B?NmJOUEg0MVFqSU8zU2pVeGpYYmJGMzU1TWV5Y2I5ZU5oOUh1UXRpbm5rRjdB?=
 =?utf-8?B?SjZzOWhGOXZWNmltYmhDeUlycVFhVVc2ZHpTOG9FVFpYYi8yNC90cFllaVhj?=
 =?utf-8?B?YmhqVWdHNk5EOFBVaGZDdGtuemdoSEFVUklWdVppeG9wcXoxMndXYlU1dThG?=
 =?utf-8?B?aWtueFc3d3I5WTdUV01nTHNGTDlaUW1CRW4xckwxVXN4M1RZY0RUYzI5N2hZ?=
 =?utf-8?B?eU91bmRZcnUrRFRXdDdzZm5qcG8vUDVGMk9uc0FXSHVHdG9mSUtHVlFSVkdJ?=
 =?utf-8?B?aEZwcHNxbHhkQSt1SG82YWJGMGRJN2o3MnYvZDRoQjdyOVMvTVhrTnI5cVZQ?=
 =?utf-8?B?S1dtWkFRcFAvQlduYzJxbE5IRVAvMHpEcE0yUXRiY3J5d3JWc0o4MGgrWWJ6?=
 =?utf-8?B?ZU9qWWV5QTIzQktBTWw2KzlSNm9RcEhRSUVXRDVWeUdwQms3VjRRaEc3MjZw?=
 =?utf-8?B?MThzWnFob0lRbHBEL25DUEovSnZLay91bjR3T1dKejRacUwvandPOHVWQ2ll?=
 =?utf-8?B?RE0xRElhUWNpR3BnZEJBdk5rZjlxQUFhV0xTMnV4cUx3eFdkbXdFSGlCRDQ2?=
 =?utf-8?B?ZTBHUjFzdS9hMFZ5UTYxVnJ1TTRPYSt4allFOC9IOW00S1E1UlNpajVnSHBX?=
 =?utf-8?B?aDl6c3RsTTl0UE4vM1J3NlNQTXczUU5jZEtaamxwcWVUTUFkekpMMldSbmdF?=
 =?utf-8?B?ckpkNU9zVFNLa3c3ZXVobUpmMEY4Z0ZuaG9kVUN2cmFhZ3dYSis1VmtRcHF3?=
 =?utf-8?B?OFJDZnhQb0k2SjcraTZqNlhWYUx2eVZPVXZOc0xSVWROUkhDK1lqbU02V05H?=
 =?utf-8?B?RXh0M1ZhM2h2UkdLMzBxUU1ERzM2OHBEWG5MaHA2bU05TElIRU84S2Z3MVE1?=
 =?utf-8?B?THNzS0JXZWpLTnBVV0g3OG9NWUJlY0c5NVAwZXJwTnIxZFFRSm9sa3c0NUlR?=
 =?utf-8?B?YUMzbnVQZzhYRjB3MFVUd294ZVVYZmM4RHk0Vi9FRldPamoxNUROaFRIVVJP?=
 =?utf-8?B?clBFZnhZV1ZQaHN2UGJGb1VXc3JxanpBckZhWktOTTFXV0hXNkFkdGkwcnIy?=
 =?utf-8?B?Vy9aaXU2R0Q1MWRmREtGUUJQWXJuTE1XbEhpalk2V2dVRjNnVVAwK0xrajNa?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEECEA18AB2E4344B9BEF7A32B6C64B8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L/i3uusEkqwCpK7oz9THBX6R38KhWy2t5OR1JWltL2ZUISMv37uRC36pI65oTn3V/GO99McwjVDrqcwE98ySKWcXTdYIetUWzNz+2x93nur8ln2QRRgAVEgI53FWRTdt+C5rLoUfk/uXvq2ON+0V1pBzeCHYQuuTGpylcRCQpMz4Sb/i0VY1aJ1VbB6/YQnhXaPKkJ5h8Pz49QStqFZWwMBc3550G1wxXl7mIYwpuJyGnaPPkREOEZDh2/Sryjsv86+NZescmBpzOhu8WTVPvWexAYyVPhOxdnBPk+mOk+s0cs9Nd5tkagQTMl68l9LBeY5ecyI5ghI/YQd4bCsB6/UTUNADBhULH5uHlzg1DwTvKA4mYSRARruAorIYVlgE2r0Q5OnrLcPWj4NnE6ES0D7AUgT/n0EiDlh5TWjz3+mFflkQHQo6J3YJtUmSUP4m59Wu4Us+35sOZbVmP1umys+hM1EjqjeDpOrTmC09ASb1BNjwdL87mKpHYHgzQ8cv3HHcOsf4mXvtvFt9v1zCHbnlMdFihqr9K97AzqbaNu/1weRcgCIB6ORnca2F/I5epRowVQui9TaY5L1LOeroDe5w+IgikUPtoqoMxXo6mLqX5kCwwdqjAwIpojcTxJo1Rch97M+e1R4XO30yCCEt6slorD1PfqsptRhvJiRv/KDULVkFYSD5XkBx6kqJ5RMWFunPsSpBl+XH7N9R1saYOHRCzKVxRJ8jY07m/e+ZU3b7hWocXb8STqijSbwhSIqxqJdMHb3TpZ7BHwlvl8Qbk4KgQEdPTJIhvOlWDv8i5Pvnsewun87Ytl6NdOJJ4b1KgdMRBIiUTgYcUBJE0KivsFOEPgW7B86zeWV6vyK/Cjg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637c0b77-121a-4b1f-0a1b-08daf98d12f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 19:49:12.9409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUfRPlvfFQPu0PqpYSngXfcTdXQGaCCVcSKy2RvTuSfULoFfQfY6VInKOZM4bqlyC+V6PTeO6QsJFV909e6UaTRgzXOYFiLV7SUQUZ2ksoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7228

T24gMTgvMDEvMjAyMyA2OjIxIHBtLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gT24gVHVlLCBK
YW4gMTcsIDIwMjMgYXQgMDU6MjE6MzJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IE9uIDE2LzAxLzIwMjMgNjoxMCBwbSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+Pj4gK2RlZiBn
ZXRfdHlwZWRlZnModG9rZW5zKToNCj4+PiArICAgIGxldmVsID0gMQ0KPj4+ICsgICAgc3RhdGUg
PSAwDQo+Pj4gKyAgICB0eXBlZGVmcyA9IFtdDQo+PiBJJ20gcHJldHR5IHN1cmUgdHlwZWRlZnMg
YWN0dWFsbHkgd2FudHMgdG8gYmUgYSBkaWN0IHJhdGhlciB0aGFuIGEgbGlzdA0KPj4gKHdpbGwg
aGF2ZSBiZXR0ZXIgImlkIGluIHR5cGVkZWZzIiBwZXJmb3JtYW5jZSBsb3dlciBkb3duKSwgYnV0
IHRoYXQNCj4+IHdhbnRzIG1hdGNoaW5nIHdpdGggY29kZSBjaGFuZ2VzIGVsc2V3aGVyZSwgYW5k
IHByb2JhYmx5IHdhbnRzIGRvaW5nDQo+PiBzZXBhcmF0ZWx5Lg0KPiBJJ20gbm90IHN1cmUgdGhh
dCBnb2luZyB0byBtYWtlIGEgZGlmZmVyZW5jZSB0byBoYXZlICJpZCBpbiAoKSIgaW5zdGVhZA0K
PiBvZiAiaWQgaW4gW10iLg0KDQpJdCB3aWxsIGluIHRoZSBtaWRkbGUgb2YgYSB0aWdodCBsb29w
LsKgIExlc3MgcG9pbnRlciBjaGFzaW5nIGluIG1lbW9yeS7CoA0KQnV0IGl0IGlzIHZlcnkgbWFy
Z2luYWwuDQoNCj4gIEkganVzdCBmb3VuZCBvdXQgdGhhdCBgdHlwZWRlZnNgIGlzIGFsd2F5cyBl
bXB0eS4uLg0KPg0KPiBJIGRvbid0IGtub3cgd2hhdCBnZXRfdHlwZWRlZnMoKSBpcyBzdXBwb3Nl
ZCB0byBkbywgb3IgYXQgbGVhc3QgaWYgaXQNCj4gd29ya3MgYXMgZXhwZWN0ZWQsIGJlY2F1c2Ug
aXQgYWx3YXlzIHJldHVybnMgIiIgb3IgYW4gZW1wdHkgbGlzdC4gKGV2ZW4NCj4gdGhlIHNoZWxs
IHZlcnNpb24pDQo+DQo+IFNvLCBpdCB3b3VsZCBhY3R1YWxseSBiZSBhIGJpdCBmYXN0ZXIgdG8g
bm90IGNhbGwgZ2V0X3R5cGVkZWZzKCksIGJ1dCBJDQo+IGRvbid0IGtub3cgaWYgdGhhdCdzIHNh
ZmUuDQoNCklmIGl0IGlzIGRlYWQgbG9naWMgZXZlbiBhdCB0aGUgc2hlbGwgbGV2ZWwsIGRyb3Ag
aXQuwqAgUGVyaGFwcyBhIHByZXJlcQ0KcGF0Y2gsIGJlY2F1c2UgcmVtb3ZpbmcgdGhlIGNvbXBs
ZXhpdHkgZmlyc3Qgd2lsbCBtYWtlIHRoaXMgcGF0Y2gNCnNpbXBsZXIgdG8gZm9sbG93Lg0KDQpU
aGUgY29udmVyc2lvbiBpcyBhdHlwaWNhbCBweXRob24sIGFuZCBwZXJmIHdpbGwgaW1wcm92ZSAo
d2hpY2ggaXMgdGhlDQpwb2ludCBvZiB0aGlzIHBhdGNoIGFueXdheSkuDQoNCn5BbmRyZXcNCg==

