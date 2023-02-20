Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3869CA43
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498053.768847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4hM-0004b9-DX; Mon, 20 Feb 2023 11:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498053.768847; Mon, 20 Feb 2023 11:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4hM-0004Xq-Ad; Mon, 20 Feb 2023 11:51:12 +0000
Received: by outflank-mailman (input) for mailman id 498053;
 Mon, 20 Feb 2023 11:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2VNq=6Q=citrix.com=prvs=408e63166=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pU4hK-0004Xk-9n
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 11:51:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db38e165-b114-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 12:51:07 +0100 (CET)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Feb 2023 06:51:04 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by PH7PR03MB6941.namprd03.prod.outlook.com (2603:10b6:510:156::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 11:51:01 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::29f6:a062:e2ad:9478]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::29f6:a062:e2ad:9478%7]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 11:51:01 +0000
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
X-Inumbo-ID: db38e165-b114-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676893867;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ob9odbpqZHG9JA0edO2cGNMgzUBhXePDeMGOpIHsSj8=;
  b=hkNrlaxShbj+kca5MlrDBRot8CCU3C/ol66dyIR5z25t6ii5NxTRo9w3
   liSUOIxnHgwD6S9Ol1Ih5KFBHC3WbJrhp76DDVTyBG2bJ8v1sA9HoEzv/
   ImzgzF9BWDzjLXkai38kA33E0nIXaa3rNidi1HFRhra4eSypz/eV2jUoo
   g=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 97739208
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:52cwTqrzL22Gg5+0yX22YnGNgq1eBmIiZBIvgKrLsJaIsI4StFCzt
 garIBnSbvneMzD0KogjaIu18koA7Zbdz4NlSVNupS0xEn8QpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB4KURrEqMCQ+ZCqG/Ux29UEKPb6LpxK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWPEjCJbZw9ckKwv
 GXd5CL9Cx4XLsOWzT6t+XOwnO7f2yj8Xer+EZXpqaEx0QfLlgT/DjUXbXKh+fiHknWDfIl1F
 GY3ww8HjZktoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC9
 HWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBsZQgC5cPqrMcsjxbMZtF5GaWxg5v+HjSY/
 tyRhC03hrFWgctV0ay+pArDm2j1+cKPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:R6eFnKssOzXLDNBxkySQjF0h7skDTNV00zEX/kB9WHVpm5qj5q
 eTdZMgpHzJYVcqOE3I9urqBEDtexnhHP1OgLX5X43MYOC8ghrNEGgK1+KL/9SHIUDDH4Vmu5
 uIHZITNDVeZ2IK6/oTTGODYrQdKHjsytHMudvj
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="97739208"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WifHBWIoJ3Ky1qHBoDEvJgV/sHXM14oj2++F6Mrk2zx79PDywC0qHS6KhhIcm4cKamVjpiJ0UDwXt5nGpYBxPJRrzia8jvuNbcI4FLLYUKEO0pNwXv+UosUXm60C0yicq18Z2dcbkq7lUsQQemBc7LBp4+mcWQmG4lFZL6No62nbIBqPivFnOkztdRTfGmW34kGiy89HE+Gme7b0gv8hTswgcvVjNPnUPd2lQczgmGcHtsY28rCKngWfByK2C5vCMH3sy/sakPOxOe6OWPZWBu3tehgzR+kJcVYOOTgdxXhGVtujwyOcWvllYucgkveE34KecwEATRq0NDTZ3miFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob9odbpqZHG9JA0edO2cGNMgzUBhXePDeMGOpIHsSj8=;
 b=fuaQVzsyGnN9gTMYSNwHwc6VssutjtwG7XFPmG+mRvFSSoxiPkFxauLqTii3MehTgFyR+q2UznvMDKTS4n/MG+zeAALLOSW/GW/dzusBqkE42fmKNrK9WO1WMNjuUy9iBybU0T1OaKiYsfN+BqIhvhjzzPu6VQNg/vPtJjnTFTUeTaKPxW4Wnf90CVqkzy7mm5vnv2IQW74gXaz7Moc49A2bCpRGn8Z7zERImBhEOR4TQ7gmyENEqqad1d7gPOpOacEKhBFcYXVOU9IL1BUVxAkXSLvB0wlFVSJcHwY8bJunzDOImBt5X9K6PQPYLUld2AMLXvbLa51wkaud6qgEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob9odbpqZHG9JA0edO2cGNMgzUBhXePDeMGOpIHsSj8=;
 b=d21eS4cdoZUC3pgOetPYG68GMelbnhlkpnHtCeDe0Uyuzm4YguRHbdTkEfozc0siUo4SrX9ZctqARg79dhsUGDJei9YQ/Y9gkcG1GJa1ol8AJJW38TvAA1OkE8Toi2lH0ibhOuKCEUuVk42tIOh14SYM0NDs9mTqJ3XY6bXC1fY=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] x86/asm: ELF metadata for simple cases
Thread-Topic: [PATCH] x86/asm: ELF metadata for simple cases
Thread-Index: AQHZRRswUrrjJOPJkEyhnDj36yzKjK7Xt08b
Date: Mon, 20 Feb 2023 11:51:01 +0000
Message-ID:
 <DM6PR03MB53727DCAB918F421A26DD314F0A49@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|PH7PR03MB6941:EE_
x-ms-office365-filtering-correlation-id: e87b19dc-bc90-4df7-364e-08db1338bd26
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ytFlv72KbEUG/WR1qZZAMaZPQMgZWpHhURGzJC8qaaeqKHUe3liSYUP9LwnpelVWVuU0g2eiK4oh1flSO3RvXu1dqwvvi1UsOLad/Voqrr55fD/zy7KgiW+2a65zI/4EUISNlyaSavndOaWkYZ2xxHvpUQquc/cxTPT+D/Ikf3I4KvorSdnX0+Dbe3c0Vqc5YtEoDaBOt2KujtbKlSHqpPTWs4UZ55lwjdjrVDWF/UhdaHq1dvSd7th/TuFC3fGUqo4XUfipWIZS9m/StkqXMAA0UDjayuxa0QZfuIEHk6AifY2q8Y/OF+NsZDMqfRDInDcUjKjnW3/ZLPYXAtNVW1ykyJdKNHUXMB7+YTW1ufjcO4jb34SPg3M3AfxXHCxAywSXYVqc/dImM2E8KwthNRF7FK43TArjBi07lDy/3a9RNtVK+9V61K5c1FpYcyyCR3mr9Ur17mDATnEfNn7Dji4QmYBHeaQKAjX982zNvIgpr8Amatr65nBkmWuhelHmvzX4A9t6uFEnfx2V8C0y6nuzNOwlE8K1TnhWgQe+x9vLHJEfj2h2TJeyxA4eUqICiVYv6xCOZIRc6DuxBVx8AQDlUMloMLDnPoms1LIZjhHvS9cohVrhb0i83v4Sn7p4kkYM4gmdIaSj9CnQvN31XoyTriJ6bQc7x0VY9s3BCsRZeU83pzKH8g0x/16RCfW/fYiuYAlSBK48ICEUt8raqg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199018)(83380400001)(86362001)(38100700002)(8936002)(5660300002)(122000001)(2906002)(110136005)(38070700005)(55016003)(33656002)(82960400001)(53546011)(7696005)(8676002)(6506007)(478600001)(66446008)(76116006)(66556008)(91956017)(71200400001)(44832011)(52536014)(66476007)(66946007)(64756008)(4326008)(54906003)(186003)(41300700001)(26005)(9686003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6PZ46aknnG0ChImgfE0mn0EuqvSq7AHc5MqfZUc7CnMv+W6cir/UDCd7FK?=
 =?iso-8859-1?Q?dH7byE2lElvjsxaaObujjPyDzDF4IUNWuMhHS6yZer+lOzg2+ah2tSR1+1?=
 =?iso-8859-1?Q?pLmaPnAQdp+QfYLeSiZQ8OwpOvFfKjzm6UY28S2sylxiIs/ITzwfaRH0Hj?=
 =?iso-8859-1?Q?HOv6AUpFLVzw17GyCK62XycW0nanGQKTF8Ws2DWhmcdmtjZd5jorQJQFcP?=
 =?iso-8859-1?Q?7W+jSsa9Kfvow4Uu//N7dPcIpmQGphYLxVA7dk/+FL4cc8GMGT17tBB0oR?=
 =?iso-8859-1?Q?DozV5oeFGe5ytU8kql+cBHMVqE4lXGOMEu62V3j8vMk1UJaduCDuXCRJQj?=
 =?iso-8859-1?Q?yFg/p6Xuw/Uuov5Ye/Cz3V8BhsntI8gQaIGdqD1o4N0ZzN8nxJryJlpqfS?=
 =?iso-8859-1?Q?HaOTIYW6E2bY6n+0dJDDuMD41OizMIeYjUlST0dXZnmsirS1O9HWsHQeJI?=
 =?iso-8859-1?Q?mbsy6QigHW5LV3H9MBh/CaKrPtQYVwNcITTI+kqFVQpjGcKBF1SvteBxMx?=
 =?iso-8859-1?Q?/b45Z7ZAGpF4tJd6I09+BgaKVszQLcLwrrouRweczrrs+Urjk4XgWFhopz?=
 =?iso-8859-1?Q?694g+ScCyb7ILFxnqGLYbM0yGlUJKZ3lM8mAOylJd8eY5/j5lCIMa7ItH6?=
 =?iso-8859-1?Q?/EBBNdJ/gknrUS67QGvRIa3X9S4UgqWJUhoJzIt/JgihfgWXTyOZ898PPp?=
 =?iso-8859-1?Q?0mhaemXVeUpKp9bX7sfnuEQVEgY9+9pDkO/KqZ3JOhEyMpN1qeaUc+llxl?=
 =?iso-8859-1?Q?BwQxYkqtEynZD2ZG7hMYkK2IrRY6yBNMgr0oYI31S+QBM/HpSKrTPO5cCL?=
 =?iso-8859-1?Q?MWqm3n4ZDi5lKuojvFMI5KmC05TABcUoZlostdLCMTP1lssC2xiTEGd7Ky?=
 =?iso-8859-1?Q?dKGZO/7SFuwVQCtKpBX+NBUt+NlAmbQGgCmsm0VRwuz8mWLIgc1OWUSkco?=
 =?iso-8859-1?Q?Dg0ZeTomV/ZjbOA+9hfWW6UdEKO5YyKVfUQXIez6E6yc2rWM/E5p1cdArz?=
 =?iso-8859-1?Q?8hqSi/ZnvOtWNR+8nEVb0c2uhO/YFCHQe2UVHncpIaIca3y7mnHV5HVi5T?=
 =?iso-8859-1?Q?UX9yDA4uGRS5ZNIWkdKKowxbvsmoScEuKPcpiyiM7lYO8WTGZfioKB0Czt?=
 =?iso-8859-1?Q?BBbXLVLdQc5R6FtVbEHcPPOviXi8ywmetdG7Iz5Y05mDAJHbw6Ex3fSBm7?=
 =?iso-8859-1?Q?jFU8yz6D/a+PB05F/Mh1NN8FOboocACHLEIMChhaYU0vTwBnkeL4JAf2fS?=
 =?iso-8859-1?Q?g40CFUxjSSWS1BhAOwlYgtV4+slw89n+vvizmJh4TjQjAa81aj0bpC1PoA?=
 =?iso-8859-1?Q?vW0Iy/H49kduzwWi6ANbFsmT8nlZfE+vX7F0sau0G4kohw2pns9O1S6Mmz?=
 =?iso-8859-1?Q?Cj69SnqJ7YXYHhj9YWAs9JASUa4vN27aAa6zwANxbtKW13VC11IGWf44DJ?=
 =?iso-8859-1?Q?C9u6nF8K/XUqtNk/fRVTAzs2zhkfnBrbHLjGOFM+l2n9pX7/7FSlyw360f?=
 =?iso-8859-1?Q?U651Z0w2lKoc25KSB05X4/o+HY3j2esZY8Uae+57CAvO2ivSaByRKI2l9d?=
 =?iso-8859-1?Q?foOVNVNoJWJHBU3I3H+OYubJtkaoZUps6jZrtK4ShXoctMIQBC7cKxsGNl?=
 =?iso-8859-1?Q?U8ZF2uYys/eIxDa5KU0HrR2ezZFgOR/xJM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vTWJasMIK+UeZ/rY8fClWY5gE2H7XorwPQwxAHUWLnksbWX/zYa1tq601tk/r6nk6J/ZYW0dBihtbopgPu60ljWNWzIR1+cEzRFf7aMsRl3G3ET1hOMk09qadixeG3pM8nV/vM7S2PIZ6tzLGKiFVHwyBnuPyPmuIcihK/sm4hIjoCvyL6naCYAaU1bTYvwEbA7IeLzbFjesjRb9EPJsPvEuM2kitrVm13JPQIOmp0SykAMwQHeW23dTjL2hyfrbx375hni/B4g9MTqaU9NcNF2wNnfqm7vc8hfVIkdBLjAPrHZqrNKgzbIU7vAoK1OY+Ith9ISpG9okcFJtwqAeeaWpfZa3Dww9Igcf6Vg1dqOdrdCbeMnjVNDwECmwcVvFf53IahyQKa1BlOzaXjVeN4RC/sI4eJXluHeTb+Vuhb4VAZHZLewASaItzx92/nZ8l3P2D/eHRn+sc9Bysh0wRhqD7KzlvUwSrjuZuNZI6y3V7RVzuBeiQYtX03aEE6ckFHLSOUoCq9MAC7huIygSzfnfR4DTEcT7XcTLonMgw2rfaLKyIZruxgb3cKZBbtTk828jm+IjrcdFb+jIH5u1OL6mXe0B/NDC19pYL/BsPsIEQnCryQBNlD5NpufxUyLx9ydIeFQL46DXGyKwttKa6wQaSvDvZSn0RGi1dhUVfTwQDvLeqYP0Vxnqvp22uv3m4feNDX6YEa3k4J1g0OBkolpfVXl26/mUvYNRuMc5hnQAfqOXUzx6bsuPypcfwmKXdXnVE6+uK5kNxPAfx3FqFYKea2i0eybGz2AaIdk0wq3ch3bt+3YrUL7kaWVnjRqOaU5sWJ163v4HroC4XuZ26XBOMVwbvX1SSCsfCkSYZcM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87b19dc-bc90-4df7-364e-08db1338bd26
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 11:51:01.5238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BaQMXSed2gzPqs5PT/KLfH26MXK7O2jlq3euSWVXkrq+WEY2CKEdbFDtXMZbPwBqAyordchd47nfxk1hn/B9PanDan4JLaVyGrWsmoAT9SQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6941

> From: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Monday, February 20, 2023 11:04 AM=0A=
> To: Xen-devel <xen-devel@lists.xenproject.org>=0A=
> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; Jan Beulich <JBeulich@suse=
.com>; Roger Pau Monne <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Konrad=
 Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@ci=
trix.com>=0A=
> Subject: [PATCH] x86/asm: ELF metadata for simple cases =0A=
> =A0=0A=
> This is generally good practice, and necessary for livepatch binary diffi=
ng to=0A=
> work.=0A=
> =0A=
> With this, livepatching of the SVM entry path works.=A0 The only complica=
tion is=0A=
> with svm_stgi_label which is only used by oprofile to guestimate (not=0A=
> completely correctly) when an NMI hit guest context.=0A=
> =0A=
> Livepatching of VMX is still an open question, because the logic doesn't =
form=0A=
> anything remotely resembling functions.=A0 Both code fragments jump into =
each=0A=
> other so need to be updated in tandem.=A0 Also, both code fragment entrie=
s need=0A=
> trampolines in the case that patching actually occurs.=A0 For now, just t=
reat it=0A=
> as a single function.=0A=
=0A=
If it is treated as two functions and both functions are always included in=
=0A=
the live patch, would that work?=0A=
=0A=
> =0A=
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> ---=0A=
> CC: Jan Beulich <JBeulich@suse.com>=0A=
> CC: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> CC: Wei Liu <wl@xen.org>=0A=
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> ---=0A=
> =A0xen/arch/x86/clear_page.S=A0=A0=A0 | 3 +++=0A=
> =A0xen/arch/x86/copy_page.S=A0=A0=A0=A0 | 3 +++=0A=
> =A0xen/arch/x86/hvm/svm/entry.S | 3 +++=0A=
> =A0xen/arch/x86/hvm/vmx/entry.S | 3 +++=0A=
> =A04 files changed, 12 insertions(+)=0A=
> =0A=
> diff --git a/xen/arch/x86/clear_page.S b/xen/arch/x86/clear_page.S=0A=
> index d9d524c79ecd..5b5622cc526f 100644=0A=
> --- a/xen/arch/x86/clear_page.S=0A=
> +++ b/xen/arch/x86/clear_page.S=0A=
> @@ -16,3 +16,6 @@ ENTRY(clear_page_sse2)=0A=
> =A0=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 sfence=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 ret=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 .type clear_page_sse2, @function=0A=
> +=A0=A0=A0=A0=A0=A0=A0 .size clear_page_sse2, . - clear_page_sse2=0A=
=0A=
Would it be worth wrapping this pattern in a macro?=0A=
=0A=
Ross=

