Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D7672888
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 20:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480779.745335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIEGf-0000oZ-Lu; Wed, 18 Jan 2023 19:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480779.745335; Wed, 18 Jan 2023 19:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIEGf-0000m5-IH; Wed, 18 Jan 2023 19:38:41 +0000
Received: by outflank-mailman (input) for mailman id 480779;
 Wed, 18 Jan 2023 19:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMWs=5P=citrix.com=prvs=37540d4c2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIEGe-0000ls-OB
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 19:38:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b374b1ca-9767-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 20:38:38 +0100 (CET)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 14:38:35 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6487.namprd03.prod.outlook.com (2603:10b6:a03:38d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 19:38:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 19:38:33 +0000
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
X-Inumbo-ID: b374b1ca-9767-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674070717;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rgK9zWkhALHt0AKMO0FLonN4m6uVrC8df9zBDQoUOeY=;
  b=BgKYggxKnxHlKLXwaQLPjQ5sAis1KGn+Ob8JuAagQVlFMd8AEotmd5ri
   +4PYpTnSg2clEEszaDwrwMvC2ZrbvAZuUGamyig/qDOIzYVtBzmiHUV2h
   HAbPQspIa4pvre4Slxm9ETc71uKgN/CyAEa/coEhpp0Yfg44jqgCDHBCe
   k=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 93202948
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HvALCaJC/k4uq/ePFE+RGpQlxSXFcZb7ZxGr2PjKsXjdYENS1WYHm
 DMfCziBafmMNGKmKNlxadi3oRsHvpXRyt8xGgplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVuPa0jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56Anxwr
 qMKOgsSLUG9q9Dun6zgavNV05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexnmjAtNORNVU8NZLgkCCxlwoUCYxFkOigt7+jEqAYcpQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+ITXOQ8J+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXqHRngz
 jbMqzIx74j/luYO3qS/uFzC3TSlo8CVShZvvlmJGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:xdysYqtK+bN+RU4g3KW8Q8S+7skDYdV00zEX/kB9WHVpm6uj5q
 KTdZUgpHzJYVMqMxsdcL+7VZVoPkmskKKdjbN8AV7BZmfbURqTTL2KhLGKqwEIcBeeygcy78
 hdmqFFebnNMWQ=
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="93202948"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUP8ZT2pa3Knt5qqUS1cSodemBC+D4cLGhY84Z3Ev/gj2zGvXmUuZqWV0JUBZ3aSwojcTltDs9PBPvh7p0qj04CUau9toShMCSxvzTlk1re9khOrvphWMviRyqVkIzt5DKp7h1aYCHfzTnqviLrFl6rw3+3POX2/C9gg3pyhKVIs47YKMu3PxzfZH1ZEdfTU9ZnRxyuWqukBd3R2yNqioBScQ/zCQL8M36RBLcTr3gn3wgLSWpbBXtG2IAYYNmWK3Dve7HFLZJfqZW7c6pem9VGoivVe7pgke0KXEjJGXQqSlMfW7dEmdkXVWjJ/M9QZ9CcfHONqJJeRiwvOGv0VqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgK9zWkhALHt0AKMO0FLonN4m6uVrC8df9zBDQoUOeY=;
 b=WqzM7cun4n32ge4X5UVry91JZ7n7BbhHxBIGhIBg6fi1JKjbyGJPkvUTSkacg58ZJ9s2uHsSrsfprP+q+KVitw3cWn47HbG/5jwkV+gUJ8fC/Heg/MHCSo0dbpdwWVsp/EtvtrwD8MZoAc6PvrRCeapuXQWyhlCm2PGf+c4bkvvw9UTjfn7TWTCluzO/LQgq2D3HZjQl9DTJz0O/hKgnwPiqnRhnYS6gAumFQnW6+bj8JRKTIdBJb7g1fiZ/3/7lTNFERPnkwifPvpl4OgGh8ixiidy+9gsq0SvTXuug5VOmSFwK0PjYA5VjrDmkadtxlbpgYZqEvv4MwoMy1baQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgK9zWkhALHt0AKMO0FLonN4m6uVrC8df9zBDQoUOeY=;
 b=WrvlzMffKMz0KLFmjvsdmXUwCO9cNphrBw9xfC0NzBy6rawYNrgZjFmnTPBQBjwETiyHe3lmrXqlafrREDicCm/PpOB850OMD0j1RK/ZtfQvGIVRW8CBK/6GorCd8vthAZW6FS8zvm7ElKYtwam/aZMnK0J5CDj3t6Jff/DqX9s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Topic: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Index: AQHZKdXmSfLi4OljAEm5WNlNB2w+ZK6i3JyAgAD3LQCAAMFwAA==
Date: Wed, 18 Jan 2023 19:38:33 +0000
Message-ID: <c00810b3-9a3c-273b-4f45-4d3f48316d09@citrix.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
 <b6d6812a-fa3f-49d1-3e2f-4971f411fb16@suse.com>
In-Reply-To: <b6d6812a-fa3f-49d1-3e2f-4971f411fb16@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6487:EE_
x-ms-office365-filtering-correlation-id: 6c5695d9-8ca7-454b-8c68-08daf98b95a6
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 73qt8P5lf/8X4oHLIRqd+jeOdhdsEUpzZUzF5UIa2Lm913qyadGAZphO6PIVjPsCYPWv6+YUnyK+5aB0lO9kk1RKpS5tqgamI2QvfHtPKYmEGhDNtMmbHW6T6HzHINg1kexyGNm5nIFACpxKLzyRprrBbhU/aR76gfwTauxKTtQ0WgtkjcirWFrTKNTjzVigcAdB5yoaRxklU9tR7qrQahN5eLnwdFfoLkoF1+uT6HP0AxpZK5D8b8jd9ZOc27HNegohxLGENUkaP2+1/qUdn/ByasRXXb+CxOey5twpFj7MNPuUv3zY0YB9ggnlcukPDVydItFrGrHSV6QfGCPAN6epNH2ESHLyauBoUr4MzaK+0QeKSM+5lADQB0I4mMdsnYwEw+Vnn1h67CYlkjouAwCGNI7s6bzyvl1AO0CKB/kMQJtC1h2AinkBYfqX4O/bIBaeXer9oZALQwhyshVbJmQ/7JiE9+ceCnlnbZ0fhG/65gbOLtD0eXRLYgva55PmRI7XggLLp0EylRorYQ3QT2hmCyY8pnNxr/0gi56lRM3yiNc0xXrJMJksVRIxvTLp7bi0q/nI5nsBZjghokkAkcipKvcqGcvZw6iHT6vn1AwZomADvHVGwmIl3ylhv6HnNPDJaicCdNDg60+8WG94noXNVeS/Hqtwf7/Zm6JeDhelOA5wIM4OWlIvOmSLpXq9ZlMxrhQdE2ZmvUBj94TrO2ua+T8/ng9joNOsne7DkwPLQUb05JmpHDU+zFvtD8vcSSnofrwaH9JnvMpi1rd7XA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(91956017)(66446008)(64756008)(8676002)(54906003)(36756003)(66556008)(76116006)(4326008)(66476007)(66946007)(110136005)(316002)(2616005)(86362001)(31696002)(2906002)(82960400001)(122000001)(38100700002)(38070700005)(41300700001)(6506007)(8936002)(31686004)(478600001)(186003)(6486002)(26005)(6512007)(5660300002)(71200400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjZ0Y09IcTVZK3pQRlRMeUJ6M2dYc01haUJmU3NwT1ZpWUFtR1hrNHNZRmhO?=
 =?utf-8?B?YWdpVHVkNmltUG82bldGWW1XTWVLdGNmMUVPNzEvQTdPckl3TTJiYXVYdExG?=
 =?utf-8?B?d2VCUng5akpiTDkzcGYrQ0hYUFNFZCtzenkvVXJhcDIwYlA5TVQxQk1YZFBo?=
 =?utf-8?B?eFRVaWJTL0JqTUljSUh4bExZZTk4czVnQjJtN252b1czeHBkV2N1NEdic3dR?=
 =?utf-8?B?d0ZQSEVEaDJhd1RIWGlrd2hLckpyMG5GenI5ZkFpYUxwZEo2U25mdVhSdThD?=
 =?utf-8?B?NkZ3a3daRlV0NEJ2NXpKTnhRajhXaFN5OUZOZGhYSVAybzUvNURFR29JTkpY?=
 =?utf-8?B?blJiNG1VNVNwbEVDNGxDS0tIRXFVWGJZckw4b1MwWjU2SlNmdVZieXBycVZ6?=
 =?utf-8?B?Q2lKeWV0OHVoa3daZm1MUW92KzNRR0U1c1hTN3ZPcDJ0blBNUmJDVDZyNnVJ?=
 =?utf-8?B?S09XMVpmSG52ZCtmU0dzSDR2QmZpOVJpZkY0QjNJd1NVL3BKNm9wZ0pBdThJ?=
 =?utf-8?B?VDUwbWdtQXozZVJtem5sWFRKdnJKdGpadWYzN0dkSmVrYVNSZ2lad3BMRlpJ?=
 =?utf-8?B?enU5dzdPaXVQUWo2ZUFzRzc2czRuYXdrM2wxa05KcnNleGJqaWtuRDBENDlJ?=
 =?utf-8?B?ZDZiT1lzY3dOb3BidldJYTlVWDJkejA1OXE2aU5UcGRBL1c4STduazgzWjds?=
 =?utf-8?B?Nk43R29ES1VGSnVIem52SkFOZWdkWkszM0RGOG5XUmZFR056dTd4STJOMloy?=
 =?utf-8?B?S0pmS3g2VHdFSC9vNlgyRWpCRHlOZ1NkcWU5Vkk3cjBveml2dzgzMnFPV1RQ?=
 =?utf-8?B?SVE0ZDNKMkxGTElHUnFsdXkydGR1dXlsOXJjUjJtMmVNR1pnZElyR2pxdDk1?=
 =?utf-8?B?WS9nMENQdjFIMHVDbldVV3NHSzNvdUZBMnRQMWxGeFhMeDQ3bDdzTVJXMjRM?=
 =?utf-8?B?OXNsaC8zUENxc0h5dXBuTEJVblZGSWtnUWFDd0w0Rm9iaGdhejhqcWx4M1Ji?=
 =?utf-8?B?U0QxWG1nUkp4Zk0zZWhyaXgvOVROKzRqWjJ2RitrV2hibWFnWlRiQW9TbXBF?=
 =?utf-8?B?dFJjRVNESU13b2c2eENXb3FDdXYrY1pzVzZIdWlhajlaTmtxZXc5T2NvQmEw?=
 =?utf-8?B?YitBQ3NNY1c3UWw2MGZHd0ROWW51QmFiYWlaVGZ6TE9jenI5SEd3NTcybEN1?=
 =?utf-8?B?R2psc1Fnd1NzdFkrZWIwNW83NzNRRVhIQ0VreUo4bzhkNXd4TUUxV0paelgv?=
 =?utf-8?B?bVQ5eHhGemJEZGd4ZE5ocUVNeDJFY2QvMDRhSE9tVDAzbGFUZ0pzN3RVcUpI?=
 =?utf-8?B?QWVMRWF1QVg0dnlCeW9jVnZRNmxiSCtDRGFNMmUzMUU0QU1ZYmNLajFvalYv?=
 =?utf-8?B?UFNacW9sVXRlbk4wWnN6NFRpWG02dFcyZFZ3cHd6NjF6ejRPbFZRY21MMEkx?=
 =?utf-8?B?STJoRWJ5S2R6T0tJSi9QNCtVVHpaNHY5UlVDVHRCWi9oQ0NxZHM1TjhGa2k2?=
 =?utf-8?B?TmtURTZacUJTNjZBZUpXV1dLMW5TMENjbW1Ycm9zbitlUmNOeXZuRmpBMTNa?=
 =?utf-8?B?QVBmOS9xUUtLb1AvZ1hMUmZSODFobFFPcjFucDlqS081dUlZTHp3Q2lPS1Ny?=
 =?utf-8?B?L1gxWlkzeWFmcXozWHNNU0JhdGhjakxIVWlPMk1EUVVrU3VybFpnQWd6b1or?=
 =?utf-8?B?cFdWckpiTU9KYk41OG93bTdOVFlnM1YzdXE3OUEvTjJWN3hSZTF5WTRSU3FS?=
 =?utf-8?B?QW1qcFpvQ0ZDUGdCeG1sMUtveEpHSjIvcFEzM3dDc1lJOHA1T2JUb1B5Vnda?=
 =?utf-8?B?VHltWUdySGdPdXh6YW1sQVl0T0JwZUprY1FrN1d2Zm5LeHpORmNXOXpaNDNS?=
 =?utf-8?B?NTlaUTN6TXU5WkFuL3ZKa2pvRzFqY2JVN3A3c0tndkZ2eUMzOU1iNHJXdzhI?=
 =?utf-8?B?ZmhRNFJqc1RpUU9RWS9VaUMrcTRqbDMxSjJKd0NNa3V4bXdzc2Fick9zeStl?=
 =?utf-8?B?T05PK2p6TFNxdWdOSGJRanZZbHdZZVJueStwc0xKNk80Y2pPdnk1akI3MjM3?=
 =?utf-8?B?aU5KdWtQWHQxcDNxSVdCNk8wZzRKS2dPemhUVm85SHIwWDRwakhxcFR4a1k4?=
 =?utf-8?B?cGpxOEQzYlNTUzl3K1lXNGxieG13eUdyd0t0QTZoZkVYeHFyZDVDL0Yvelpt?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <680C7D5C39DFD545BE6F3C6A5422C2FC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UAnXGgoJ+fvcmF9nSoNPbSGvkPfY7kHhuBAtcUzISMYKrZOoPLqo7VvmQDc7TqsBSr5+ZKNY1VGUqCDVn3NPPqkSLyRnpkyKIFVq0/7wUzKIkZEK7QjLtis1R8Z3QLY7/mOl114c4isRI7zJycsB5Q4OKrNtZBJ/aG2mG5tgGc0oU1m6Nq+c+fSJoZIM0UHguyCNj4kVW84du+wDL6nDzFvOo3h+5cXjdP+mztya84Lvue5gfu3++YJLu1/0DvuB1sIH7YBX12ZceYQJOOUCyzIbAX77jIQwXOcANmJbW0NPYCab/Akiab/262Sj2S7WNC13njmRnneTqoqouDI4giGoddH0gteG8aAVdit09zJsBMRHW52O1do4/VYkxuALiS2F6FiPhzNB+9+AiWaP3ChYCh2+BWe5fo1Cmrd9BPTl3/b0plyAP7CSQ5bCRSiHF+bKBJyOeUYl35G8jQpt/28J12Iy3+OU6JCTWKy3qwqRNXpT28qR65qnpYiu+JHdWVqocIEUHrQhStGET2s168LoDOVTdQ/sjB3s7g/U0vZIga5e3iCAT5rxVm4P5okPRz+1AVlJMJ+8IW9XLTUJ7cETvYH6ejoUo+qT3VZxhwOasqSB7wiQiDzSzsQ0sBztJ+jzNXgXGgkBYLQkULQaa2k+A8yMX2lccbGVo4wx7VEOJ8tBvn9sPxpZyaFDm3WzxYQMc1xEMdXRZAEgo9pidc02ptFyuv3YQrcDT+nFOizyV7cHGQQIIpkrajuEhoj2le8nCDesrpUXRMl4z+pCkz33TPMmugPFuGw6r8bNzm/8bixF2nVdVX51cgPqkmyV6qUeze8VMj/WUBtJCW5a3morGPm6amFCfUZmGZjVX10=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5695d9-8ca7-454b-8c68-08daf98b95a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 19:38:33.2524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xI8Mk4+jCHHmv9AVacv+iVyChfHcL3tYZOnllvvTVHS626eKpaEQL5yM9Ts0aXEEJZGct2JEmv3OdBfXVZEVxuHpHlXdOAPtDZwsU5FnitQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6487

T24gMTgvMDEvMjAyMyA4OjA2IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDEuMjAy
MyAxODoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDE2LzAxLzIwMjMgNjoxMCBwbSwg
QW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+Pj4gKyAgICAgICAgZWxpZiByZS5tYXRjaChyJ15bYS16
QS1aX10nLCB0b2tlbik6DQo+PiBbLi4uXQ0KPj4NCj4+IEFsbCBvZiB0aGlzIHNhaWQsIHdoZXJl
IGlzIDAtOSBpbiB0aGUgdG9rZW4gcmVnZXg/wqAgSGF2ZSB3ZSBqdXN0IGdvdA0KPj4gZXh0cmVt
ZWx5IGx1Y2t5IHdpdGggaGF2aW5nIG5vIGVtYmVkZGVkIGRpZ2l0cyBpbiBpZGVudGlmaWVycyB0
aHVzIGZhcj8NCj4gVGhhdCdzIGNoZWNraW5nIGZvciBqdXN0IHRoZSBmaXJzdCBjaGFyYWN0ZXIs
IHdoaWNoIGNhbid0IGJlIGEgZGlnaXQ/DQoNClNvIGl0IGlzLi4uDQoNCkJ1dCBub3RoaW5nIGdv
b2QgY2FuIHBvc3NpYmx5IGNvbWUgb2YgaGF2aW5nIGEgdG9rZW4gaGVyZSB3aGljaCBtYXRjaGVz
DQpvbiB0aGUgZmlyc3QgY2hhciBidXQgbWlzbWF0Y2hlcyBsYXRlci4NCg0KPg0KPj4gUC5TLiBJ
IHByb2JhYmx5IGRvbid0IHdhbnQgdG8ga25vdyB3aHkgd2UgaGF2ZSB0byBzcGVjaWFsIGNhc2Ug
ZXZ0Y2huDQo+PiBwb3J0LCBhcmdvIHBvcnQgYW5kIGRvbWFpbiBoYW5kbGUuwqAgSSB0aGluayBp
dCBzYXlzIG1vcmUgYWJvdXQgdGhlIHRoaXMNCj4+IGJvZGdlIG9mIGEgcGFyc2VyIHRoYW4gYW55
dGhpbmcgZWxzZS4uLg0KPiBJaXJjIHNvbWV0aGluZyBicm9rZSB3aXRob3V0IGl0LCBidXQgaXQn
cyBiZWVuIHRvbyBsb25nIGFuZCBzcGVuZGluZyBhDQo+IHJlYXNvbmFibGUgYW1vdW50IG9mIHRp
bWUgdHJ5aW5nIHRvIHJlLWNvbnN0cnVjdCBJIGNvdWxkbid0IGNvbWUgdXANCj4gd2l0aCBhbnl0
aGluZy4gSSBkaWRuJ3Qgd2FudCB0byBnbyBhcyBmYXIgYXMgcHV0IHRpbWUgaW50byBhY3R1YWxs
eQ0KPiB0cnlpbmcgb3V0IHdoYXQgKGlmIGFueXRoaW5nKSBicmVha3Mgd2l0aCB0aG9zZSByZW1v
dmVkLiBXaGF0IEknbQ0KPiBwdXp6bGVkIGFib3V0IGlzIHRoYXQgYXJnbyBhbmQgZXZ0Y2huIHBv
cnQgdHlwZXMgYXJlIGhhbmRsZWQgaW4NCj4gZGlmZmVyZW50IHBsYWNlcy4NCj4NCj4gRm9yIHRo
ZSBkb21haW4gaGFuZGxlIGlpcmMgdGhlIGV4Y2VwdGlvbiB3YXMgYXR0cmlidXRlZCB0byBpdCBi
ZWluZw0KPiB0aGUgb25seSB0eXBlZGVmIG9mIGFuIGFycmF5IHdoaWNoIGlzIGVtYmVkZGVkIGlu
IG90aGVyIHN0cnVjdHVyZXMuDQoNCkkgcmVmZXIgYmFjayB0byAiYm9kZ2Ugb2YgYSBwYXJzZXIi
Lg0KDQp+QW5kcmV3DQo=

