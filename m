Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6E96405B9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451872.709670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p147k-0005Hb-B6; Fri, 02 Dec 2022 11:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451872.709670; Fri, 02 Dec 2022 11:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p147k-0005EQ-82; Fri, 02 Dec 2022 11:22:32 +0000
Received: by outflank-mailman (input) for mailman id 451872;
 Fri, 02 Dec 2022 11:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeCl=4A=citrix.com=prvs=328e240bc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p147i-0005EK-4b
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 11:22:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99b9869a-7233-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 12:22:28 +0100 (CET)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 06:22:21 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by PH0PR03MB5767.namprd03.prod.outlook.com (2603:10b6:510:42::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 11:22:17 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 11:22:17 +0000
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
X-Inumbo-ID: 99b9869a-7233-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669980148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ItzYeLGm6Ss5mdsWfivCYYYDhHqlM5d+54JYkCtHzX0=;
  b=NpI41Fn2vw4mEGhLd3KaP/lyca/A/DeVNTcj5a1p3gnaGzzPzgsWNpU6
   BKTH7XjwU7Db838/Da+Q4XSi8sl6uv0LoZYsVF7kN2kD1RWroQEl5Iyi5
   PojhMwc+ZrD3Cvhfq6RoqvxqmtHAu/UPpa3hO0jFjZFSJxKOPchiPPybQ
   s=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 85266472
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d0gp6KAmk/HcdhVW/wniw5YqxClBgxIJ4kV8jS/XYbTApDsj1TQHz
 WAcXGCPb/mLYmD1etp/bIS1o01V7MOGn9BrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8aEnUF1Tz
 dciFRcyNRqqueKKy7aQVbw57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDe7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+Sx32lBN1IfFG+3ux03Vi3mWJMMTY9f2uCn7rjkhbnVs0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZNYcIrnNU7Tjsr0
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHYDBeSwIAu4XnuNtq0U2JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:Kcq90q/FN78d9NTF78xuk+Grdr1zdoMgy1knxilNoENuEvBwxv
 rOoB1E73HJYW4qKQ4dcdDpAtjmfZquz+8K3WBxB8bvYOCIghrSEGgP1/qG/9SkIVyDygdR78
 xdmstFeZLN5DpB/LzHCWCDer5LrbXpgcPY59s2jU0dMD2CA5sQtjuRYTzrdHGeMTM2fabRY6
 Dsn/avyQDQHUg/X4CXI0BAZeLKoNrGmfvdEE07Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl54242svLhCP05iv21dB7idHhwtxMCIinkc4OMAjhjQ6uecBIR6CChjYou+uigWxa0e
 Uk4i1Qf/ib2UmhPF1dkiGdnjUIFwxer0MK/GXowkcLZ/aJAw7SRfAxw76xOSGpmnbI9OsMoJ
 6jmVjp76a+x3v77X/ADxuhbWAxqqLPy0BSzdL61BZkINQjgPs7l/1OwKuReK1wQR4TLOgcYb
 dT5Aa13ocGTbrSVQGrgkB/hNOrRXg9BRGAXwwLvdGUySFfmDRjw1If39F3pAZKyHsRcegM2w
 3/CNUhqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZVDqDrsONX7Bo4P+pOxd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo5J5prr/Trz2NjDrciFlr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmxbzXpFDQENuJvH9euxLLG5mjvi7XrEC7NarAso7DICdZAoZZg==
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="85266472"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXj5oxo9PIf4bdc6VZtqz0BN2PW/zbOxU52CS9Bi+yzXlCUOParf5rtSUjESYsDnXhKVwsNKuxuygC2LmEfZdps01fULB6vB9STlxZirqrhD93/ksDWfg+kbyV6r351+31FYMRzCdIJUEv5ElCx1xxhFb4WtWxNPi3SS4u/WyJsSowSFD6vhtSlSRLuu9lUkp2lDRxoei8vsu7ozg8hwhQMZG3u75gifvrbJ5vtxwnYNVG+F/UXcWc0vXDJ1Yn7EvH6zxqRx/JaHLjr3BwtKhvE0hGe0LSdSmDGaCqDvjqg7PHnDzg9BTRcCeNk1HvUSAczzIIKQAZevRiS6SYA/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItzYeLGm6Ss5mdsWfivCYYYDhHqlM5d+54JYkCtHzX0=;
 b=GbiVDixO89TR2s+gYYSJIfWET/MRJ1FAYdEmQt3nEjaZpCZowlXa/I3W6R8vMsZlet1A7YBMAvm249GDocqWqAI0DDUlbpPad69NAtwMSxKUzlZJ0sZyav2MxGRCc9E3icCVWbVUJ81OmT1s9/HWjvfZpXJngzpsmYb2KktMPKhFRB6lo54JU/bCX2gOKhaN2khGJzT1WcMRkp6p+zs3s3lM1uWdH338eAuAIJuMmdu7rYaTv6mzYV5UcUN3xylE1FoXGrkCt5UqdWSDa+O1e0Ekegmt3R4mJzGuw+KnYS2YEvxObHCRjFOhycUA5Zs/daZNVXMR3O1/xe3iotU5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItzYeLGm6Ss5mdsWfivCYYYDhHqlM5d+54JYkCtHzX0=;
 b=LH25F3r7qeHyFpq2fd9CrLov4I+9AoEpxkaYdqGodp9oMh8UEk/khu4rgWiMMU2IepbIx3EvdoNEDPmC+vUou4uKbGofCNOi6sgrLKcg9QD6+noAxOdzVN2a0ctrGp8dQ/W8TS7yfYFPKhelJ7sRd92TqUIDERG5ENvrIWynJo4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v2 3/4] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v2 3/4] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBj1QpnPDpN8ubkmTLtnuWN4I965adC6A
Date: Fri, 2 Dec 2022 11:22:17 +0000
Message-ID: <31cd2f53-4b36-b843-981b-994a0b472332@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
 <af355b5ef654745130815f30299d67bea7284f0e.1669978356.git.edvin.torok@citrix.com>
In-Reply-To:
 <af355b5ef654745130815f30299d67bea7284f0e.1669978356.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|PH0PR03MB5767:EE_
x-ms-office365-filtering-correlation-id: bbf7b050-7445-4ca5-15aa-08dad457785e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DUg0QEdlgKH0hrwn3m2A727J/ffC0wbGLhqYr+05/5HZldEVYszWzlLTbKjI2ur/WcIy1L6ASsCwW6yy94Sn28WGu0xFZqeXLeauGKEM3dKpSLIlqQaevIl5tU0Pc8WeuZILFvchUaU5tu7L4cF2cb6/Xiu6jdCnN/QwsW9pMo+86cCbsrK7q5PQzyUriHPVHmvYsM6Dum102ji9gWXi/2AlIvbFoUmM4w+6qd3zPBKKQdfZHKdJnMg8zenx3w3PVEnG6/qpl6e05zY9MGOe8GeDzuIGJirUK9jXyXWJ1l7bo1Y906P9qmq444gnE2I2tty7oRAYsv/fXg6R9MXKuzPyitLN7uN5nt2MqY01otK+EFH/LWPMLxlqcJ/I39v9at+FixBgE8RvepywbtDvvfBmjQjxICWQDjQwWpBM1FNQMY+gNKaJDbgkp8IgZQ12jDFURoBpvMW1iwE0WJysQIkh5sbZK0/6AEO5Cy/b0TAGTJLlGkR3izbRFP575UmoG9eG6xUNLSW5zze1O0QGxGt+JYU7HmbGk1XfzQ9ASeD/uvlPeWfYBjkjK3UD2R/VMabmXGYTvumx4VtyGBv8XsyE8JQAIRqprLVcTTEQMC5E9dBVgITYlxkijeF0JGnYp2gD7pVcDAMIq+Fmh8nCIolmp3gQV06vAPZCvw8i+3r8VdWE33s2oQGOxR0Cx+zgWh/tyrheBvKoiN0opKrDKCJnK1l5xYOXYEW5kjB0gLiqFsc5IGlw8SpxXD/6zob6xodRuwj3HW9ZdY2EmlLTHA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(86362001)(31696002)(36756003)(2616005)(41300700001)(76116006)(186003)(66946007)(64756008)(4744005)(66556008)(82960400001)(66446008)(8676002)(66574015)(5660300002)(4326008)(6506007)(71200400001)(107886003)(316002)(53546011)(6486002)(478600001)(8936002)(110136005)(26005)(6512007)(54906003)(122000001)(38100700002)(66476007)(38070700005)(91956017)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU4vVEFyNm4rdWNQRUZxSHZiMDFqV2xuckJoOXJLaGpzNUo2TlZoOGcrVUhY?=
 =?utf-8?B?SWpJbUw3dkliZHRuTE45MDcvYkI5dGVteVhHU1A1NWpXVlYvVmh1b1NTQWVJ?=
 =?utf-8?B?cnhJVmd2czNKZFltWktncnYwUGhENUlwQUtGZnJkV1VJMmYrOUVJMTlxTVdm?=
 =?utf-8?B?TFIwSmYxTHZOUno5RXI1N3BiQmdXNEtxc3EzWUZSNnlrbUdYc0t4M2ZySzQ1?=
 =?utf-8?B?UHA5VDZqRXBnVUNDdUIxUkF3MkFIdmdJdStCaTBmdEdFK1RwL1QvdHBDZ0s1?=
 =?utf-8?B?NFRLdUprYldpaldzbWRqelZwNExWVWRIQ0xhaGU2dXIvRjdoczdia09XQ3dC?=
 =?utf-8?B?aWtZa3ExdW1rYXBxbzhEalRGQ2NPZkw2cHBmeE40bWQ2UitRZm04cHloTGpr?=
 =?utf-8?B?OGZjWE9XbzF4WE1XSTlteGQra25sQmcxR3Z3Tk1qbGQ2SWhZVkJDRitCYVBY?=
 =?utf-8?B?K3V1RC9hZktlK1NZODByNHo0SGNTMXZOQU9WZ0JKRXFwOFovVHlMeDZ5UmdF?=
 =?utf-8?B?cDNBY0FHam8yRHVzLzdmd043NmxzS2dqSEdrNWQvdVY4NlhtVVpCVnlXemdt?=
 =?utf-8?B?OHFkTkZYelNEcDFjcUFzTzNUTmg4dWMzYXIrak9OMEpVUFpJVHJZVWg4U2pO?=
 =?utf-8?B?ZEM5UGhpLzFQaDRaK2V0RlNKUEk3RE1nMkM4QVhLcnM4cTd6azhUSWh6R3g4?=
 =?utf-8?B?NWdXUG5DcjJzWXVKUDFSNFV2b0RLR3V5NUpmUVYvNXpVZWxzNjJad1RJekF6?=
 =?utf-8?B?VU8wT0ZyS3ZrelZFTE95N3FyK2NPOGtyUXRlTkRsR1pld2J5WWJDOTlBMEZh?=
 =?utf-8?B?bDF6cnlYUERFbG5FNWZxT3JQZ1J6eHlNd1BmWW9HTnkwVzBHZ3pxRFlBMS9v?=
 =?utf-8?B?d2NOZDgxdGxtSVZnNHRrYng4VHFNY0U3UTNlbzJBMUVjT2Q0QXJrRTFlMkFh?=
 =?utf-8?B?SFUyN2xNb3MzSW9qdkhpZ2FvaUJ3bXVMYmw3aWUxZXF6Titwbnc1QnBMdExh?=
 =?utf-8?B?TGtNTEVGcGhxczlIRlE5cHNmcXI0YzRXZVdiVTJsK2xWWDFCenh2andZS2Vt?=
 =?utf-8?B?MXRaeGgwRzcvMXFOOWhUbTg3MkF4R1dRTG5LTVhyb1o0YXpzT2VyeGlsWkph?=
 =?utf-8?B?TmUxRnRUcm1GUlFNMU5GVVFtRzB4QWwzT2lCN3ZCMGNkTGo2TVFjMTllVU5K?=
 =?utf-8?B?QS9vV2N5blRVaytuTGpkbHd2ZzNoTGNlTHpUVkU0Tk5PMmRtVlkyQ1ZZakRJ?=
 =?utf-8?B?dks0L0NRbi96QXBKQ1o4OWFMbXBWOTB5RGRKbDI1cXVOcTh2TVhMTytlL3E2?=
 =?utf-8?B?KzkrYjJyVS9XSkFMaVRhM0ZKdnBrZjZESW52L1QvYno5dDVFOXdnMkNkampy?=
 =?utf-8?B?VklvN0krV1JIb2dJWjRpT3BIVmNGcHNMdmt2U080YkpNc25CeHhFM0NPN1Uy?=
 =?utf-8?B?UGdTdUtDbnR3b0o3L01nU1VyblFCb09sQlF4alhHOVIzZm1lVWl2ZUVIWEtV?=
 =?utf-8?B?S3pVT0dNZnZHbkNiWTBhVEcxbUJhblFnUWRRQkI5YngxTzZlWFZIcFEwamRE?=
 =?utf-8?B?U3Y5OElBY04yeU9vUDQ5NmtrQ293bEpyVWRXR2tVYmZRUHVreHNjaDc0U0J1?=
 =?utf-8?B?YVNlaXlQZnpFYVdNcmJDOTRiQVorc1dyVExFQk9CSXFuYW5GNkFPMUFmVTl5?=
 =?utf-8?B?cHkzKzlIK0tjTVVwQTM1ZUo0cldCY01HcnVNZmozTFIvV1pQdzBYdnlDUnll?=
 =?utf-8?B?V2VpMUkxRnpTd2UyNmFCWUhVNnVYTEZoZ1VLc2dqYWQvNlJCL2RmOUprdUdZ?=
 =?utf-8?B?UUxMTGZXa2xCdmJQRm8vVXVpeXorM3dBT3BqYjlKQnd2dnArSEFiRy9IVFZF?=
 =?utf-8?B?WWRPcm10a0xNS3RLQURuZkdLWjJocEU3bnhEL0pSbXZBNVJaOEhRd0pMMDFp?=
 =?utf-8?B?T3FKZXllb2ZsR0VXRUtjUkRFb09VY1dDQ214M2s3TFpMM3BVck12MnUya01E?=
 =?utf-8?B?QjF3enY0NVBwVW4rdEsvMW53N1FBMW1KS2FkeGdaVm0weTFpRkV3UEV1akNE?=
 =?utf-8?B?aFJRVlNEaURGVHo1cWhuYlo2U1FlYXdybmcyY3d0dktSZGU5SXJHRmtueWt4?=
 =?utf-8?B?ZkJUN2cydmxKRVZ4WGVxeUpRQmR1Q25aZGxKbHFhSnJkQXVmTEhrVTVUbjZ4?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B59B9691E11544DAC48079C437BBBC7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	56rQOn5z80mNVMmP/Ln1mn8vBSHpNreydJGxCpU65uTkG4EWfPNAnbtDwM27UVQCcTl5+s9kjnnkwBLYniXoFdsXbwpb2oz99uLYCTbrMp+FMGDIXzJtRY9Gr3H0zcZB/N/LxcOdP9s5UYpTjk1EOaqT9EjIx52kiIvnb2ruPdkxpgKkygzzETrmpO90X/5F0SQQrr9fiwgowwx6j7TcjF4FwQY6kpIRB2QZYHu8KrvpZqLVtj6utwsTlK5tGMVxkiPhNhfM9vN+WOVZ0iNP9/46Nnba8qOHo8jYfmlT+gLY4EUNl/JD4WcwCXzhL+vuBk42E/tLXPtAy5RycDuaWtBn1PHlPEipbtJzeyK75ybKEZTzCAi4Jl8RABSjstA1Io5q6d3eQt+kfZZwHyXfh0MMJ+EBo3uyi5P9GclO4LxunGJ4ZrW0VyJdqldUezJbIE7dr/CIjgRWX52Cl/2/4dE/5tkR6hqu7ss+etB2EQFOlVI2ov/ERBEBxU5x7UsITFLq9QdeqG2qACWLwpJyFMXy8BH9JlWOuTG81zDO0ViafV7yZRip4Pq6BWr04aQMIkG16tdk3wDIPRhXDG/hLnCeJ8My0z5Vg0LQLWprBgju1fJsCuxboWsTYfKbjK/B16NqAHhAvMJEChVjrAIJ/3bLzFc40Re4cwO9wKXW54aaylkA4e0WSvjOpa9OviQtz5jITkwT6HK6J/32doED3qfNbH8llNEiUe1A9uqh4h2cjbiO3A2hzAiTyDdcgtC/zwEvgnj6Jv0vz68nQz+o+rpUemJY2XEkoGt1ymKlYI6b9BlAMLyCc1Wy82WyxqBQZ+Ztc/xH+plBsN9UOd+Q5Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf7b050-7445-4ca5-15aa-08dad457785e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 11:22:17.2396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +XAqrwfPpbqHgwvMlckTPZC1MDME7DrL1BwXuNvE0MLs6YJyhMNRTJWGUf5NIaQeopg4H/cBxW5OY0var3ajb/gNQ3/oc9GWtMBGfiZEsjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5767

T24gMDIvMTIvMjAyMiAxMDo1NSwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gTm90IHRvIGJlIGNv
bmZ1c2VkIHdoaWNoIGh2bV9nZXRfcGFyYW0sIHdoaWNoIGFsc28gZXhpc3RzIGFuZCBoYXMgYQ0K
PiBkaWZmZXJlbnQsIG1vcmUgZXJyb3ItcHJvbmUgaW50ZXJmYWNlLg0KPg0KPiBUaGlzIG9uZSBh
bHdheXMgcmV0dXJucyBhIDY0LWJpdCB2YWx1ZSwgYW5kIHRoYXQgaXMgcmV0YWluZWQgaW4gdGhl
DQo+IE9DYW1sIGJpbmRpbmcgYXMgd2VsbCwgcmV0dXJuaW5nICdpbnQ2NCcgKGFuZCBub3QgaW50
LCBvciBuYXRpdmVpbnQNCj4gd2hpY2ggbWlnaHQgaGF2ZSBhIGRpZmZlcmVudCBzaXplKS4NCj4N
Cj4gVGhlIGludGVnZXIgaGVyZSBpcyB1bnNpZ25lZCBpbiB0aGUgQyBBUEksIGhvd2V2ZXIgT0Nh
bWwgb25seSBoYXMgc2lnbmVkIGludGVnZXJzLg0KPg0KPiBObyBiaXRzIGFyZSBsb3N0LCBpdCBp
cyBqdXN0IGEgbWF0dGVyIG9mIGludGVycHJldGF0aW9uIHdoZW4gcHJpbnRpbmcNCj4gYW5kIGZv
ciBjZXJ0YWluIGFyaXRobWV0aWMgb3BlcmF0aW9ucywgaG93ZXZlciBpbiB0aGUgY2FzZXMgd2hl
cmUgdGhlDQo+IE1TQiBpcyBzZXQgaXQgaXMgdmVyeSBsaWtlbHkgdGhhdCB0aGUgdmFsdWUgaXMg
YW4gYWRkcmVzcyBhbmQgbm8NCj4gYXJpdGhtZXRpYyBzaG91bGQgYmUgcGVyZm9ybWVkIG9uIHRo
ZSBPQ2FtbCBzaWRlIG9uIGl0Lg0KPiAodGhpcyBpcyBub3QgYSBuZXcgcHJvYmxlbSB3aXRoIHRo
aXMgYmluZGluZywgYnV0IHdvcnRoIG1lbnRpb25pbmcgZ2l2ZW4NCj4gdGhlIGRpZmZlcmVuY2Ug
aW4gdHlwZXMpDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0K

