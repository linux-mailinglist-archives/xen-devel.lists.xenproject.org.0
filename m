Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E22623F43
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 11:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441565.695710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot4Ln-0004PL-7m; Thu, 10 Nov 2022 09:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441565.695710; Thu, 10 Nov 2022 09:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot4Ln-0004MN-3j; Thu, 10 Nov 2022 09:59:59 +0000
Received: by outflank-mailman (input) for mailman id 441565;
 Thu, 10 Nov 2022 09:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sgDV=3K=citrix.com=prvs=306f7a1b5=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1ot4Ll-0004MH-U7
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 09:59:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c3afd84-60de-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 10:59:55 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Nov 2022 04:59:46 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 MW4PR03MB6665.namprd03.prod.outlook.com (2603:10b6:303:120::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Thu, 10 Nov 2022 09:59:44 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 09:59:44 +0000
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
X-Inumbo-ID: 6c3afd84-60de-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668074396;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UFWDoty6lvFEmcTWTtF78Cyk+M1tvMeDyxkPG2AP6eU=;
  b=Q0JQEt9Oi/MUi+BTeWcjxN8XwvpE39duGntRS19XRfNakB7g58TuCe+e
   6iuDjrOV7KKYqzk7ef/+axLBXSSGq5USiGD2rmjC6XL/gXwnmjfH2JFjB
   uFkZwyuigzzv7LO+ELINij9PImWVrlbYg6esrlKO0IOqNBmhy7nII08ow
   0=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 83622034
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HHTFKqt/6Qb2jsKbev4VlHKW3+fnVJhfMUV32f8akzHdYApBsoF/q
 tZmKTrSaP2DZmT1KYt1Otng80sEsZ7SxtUxQVc/+HtgRS0b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaHzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAioTU0jYgOSK4be8YfUztMJyPOrEI9ZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4S9lt+iHK25mm6Tp
 njH5Hj4CxdcMN2ZxTuK2nmtmvXOjWXwX4d6+LiQpqU02gfLnTB75Bs+CmGXh8WQlQmFctMCL
 koTvQUn87YdzRn+JjX6d1jiyJKehTY8VtxKAqsF4QeC4qPO5kCSAW1sZjxcbN0rsucmSDps0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiI06kB/nVNtoF6+xyNrvFlnY3
 DSivCU4wbIJgqY2O76T+FnGh3ego8bPRwtsvwHPBDv6sEV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRfHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:Cz4/3Ksv++PNNtBbd2gjMLRf7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5TOObFuF4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.96,153,1665460800"; 
   d="scan'208";a="83622034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnlvq095diDML9kegvEnuLD9RARzKZlA9XjQRxVzc7b8KU/9tyYr6GbL9E9CJ3p20np2BEqhuBLPaOPRTefVC0ff+RlT4vTRCqfbejQ0DbLGC/m0v0CxHPdx8TYMkBosUcDh9l0Zgy8vC0NqTKVZzFj+WQHdYQRozUYI4/MVkXcagaxCDUgr/mmvQw7TDkv0+YyokVpMo6KiHAFBLZkqJUwvbvMawzM+kPB7RB7MtqdqgymTTSXWnFybNdwSQCgeHba8ovIeuJuXg4Z/so81CNwde+wQEyccX9ggLfzi3NvCozw2BBdXTuj2cKlpmXlGyUMPJotUqQqGNMiH0Xw4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFWDoty6lvFEmcTWTtF78Cyk+M1tvMeDyxkPG2AP6eU=;
 b=BaPTdz7d2SB6bnnOF92M4HDi8GPIsa33kIJvL1/88S1Z4sUheSOr6FlpXArXLZPCK9MewpRMfjD08cZNvxaLi9+o/TBLb4WX2ub3KPp3fbEkjGHoRvjrNrABRtv4qE06Gm/Phx0xBBubqgVTN/vfypeZLFpguiCrdNDBOxcYr28GsxJzjvAdwPTH113eSnnNBjV9U3yUtZQ8Sm3LldQ/9qkoZxlmZz57UTwnZfj/aneRM9pJpPw/JSuK03sFcfO+wgKZqJOQOSy3JHZwsnhtOfSQKd9I6WB3wFam7+56E9pR98sBfRb8QdzlJxpHc/hg7V54Mlghg44qJFQUaUNYQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFWDoty6lvFEmcTWTtF78Cyk+M1tvMeDyxkPG2AP6eU=;
 b=Gl9hp8vB4FKuXqeX6YZQI9pOUTzXXuMA5IUoTamgX0H4/dc0FFQ53WC0gVNCeBLMd2h0QKcA3nRHQUtrOJsFB/O7AHStlAKfR7dOMd8oKquGGfzlc3P6/LTNHNgi49HyiaMYI7yDPvK8DY8QxtSIrAdR5JVsZVzrTJOAvtfz/h8=
From: Christian Lindig <christian.lindig@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, Edwin Torok <edvin.torok@citrix.com>,
	Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fBVQkM1eqLakCv8k675veNsq41MEgAgACx3ICAAfcdAIAADHYAgAAJiYA=
Date: Thu, 10 Nov 2022 09:59:44 +0000
Message-ID: <5ED80DE2-1AE6-4C56-8C05-E83162EBE534@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <DF0BBACD-9D12-4B60-86F1-243A6018F8D4@citrix.com>
 <AS8PR08MB79919ABE0786424904E21A8392019@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79919ABE0786424904E21A8392019@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|MW4PR03MB6665:EE_
x-ms-office365-filtering-correlation-id: 91905e45-2063-4161-1bf2-08dac3024aea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aJLtlLybdEUEEAo9oKjMpS7kkNW+cYj0N30pL9YKWyXxtX9JlmwlmgRmC/CByAFmIDSqEeNmetSUXe5Otg6rBaDjzNAt+wLKhS7PUPgxi/5orNFen/hN+nXWkxV/bCH3t16sC8G//g//OmC5ZtFo18x3/CzbyfqVj6rUGjS70dhtc/glKXgN1wqg5u0MUjSwiERN8MO9Miac6Ia9Cwv6kdEEcCfq/X+7zh7qcfhvPz84X5Co+boalrBE6C54+XdMIGuBJ7TPJVSI82dZi9CNzP8oq/WttTY/+gHS5Uo1l3GQqXC9Jwf1Tc7kTyToTDr4GkvpnCo/wl3vINFlwQOfOiX6AhiDIBoA6Z8NqMti97hvZ4pUDZ9KQyIBVvm9zdoMha1e/qh9NkNt0Qi8Km5iyvFferlJHdkLrayRI05RMIx3GAVucOslhFeB43OsSMulBS6dgUD5sWWxRz6L9gR+kueYP/yNhiL1GWaD1XvRDoiWxHj6Fo61VRntTLktqgGvoKJy7N/CUXY+alqenBQflxQkB6pxwOZTGGTtGQOWJ1KxcBfnCzM8q/6Fjm3tOH6SqEJScPVOrVEFI/5Kpd9dnfRaOLrrkqzoi/nnRuLsU2p8pLH5W/lOpGtweBEyAlqrWPRrkoZYucXZ6LKNBjapTIkMwlCmT3QjgxWopvRMX92w2aXU+JN/lenQQq/G8k1YKtyUc/J2Ind+C2+/06hw3lf8t/NW9NhaJ/3N0FFVQelxtc7HuwMoRj/mjJS0TMoxlVKcJsbgrnIXqvkIftygV/UtQneIJSS8oKlE3IS2DyM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(478600001)(6486002)(6512007)(33656002)(44832011)(71200400001)(2616005)(186003)(83380400001)(82960400001)(107886003)(26005)(36756003)(4326008)(38100700002)(6506007)(8676002)(38070700005)(53546011)(2906002)(122000001)(66556008)(76116006)(316002)(66446008)(64756008)(66476007)(66946007)(86362001)(91956017)(8936002)(5660300002)(41300700001)(110136005)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWM4MEJ0cDJmSWQ4c29zbWlmek5lU3Z3L0I5UkRjY2MvRWNidkZZdm4xR0Yz?=
 =?utf-8?B?SWpIVUNvQ1RCclEyY01pVG1SbURMSmlaQWNubWdKcGJtMHZUQUxIRGE5Umps?=
 =?utf-8?B?b2xCZ1dKNDZSbVhLZkVndUVXdWdjSDBnVFREcUpTcUJFdVlwWVZ6TGs5YWVF?=
 =?utf-8?B?K3IyRllEWW1kSG5idFhSRlFTdGtsYm9YKzRnZjI5UVlCRURpT3lBemZDc2VE?=
 =?utf-8?B?ZUNKZkRTclg4djd4K3U5eUlBQ1JZUXhSOEMwSzNTbGtybFJNdXdhQ1liTWVm?=
 =?utf-8?B?Vm4yTGdIL3FOOHB3WkZYajY3UlpiTHpsTXYvbldSOXNiQWl4aWNnb3JWZUUz?=
 =?utf-8?B?SjUvSWJ2WmFmM20wejdCWkdoeG00WHUxUDZnNHZ6SGxRVjlWU2tWcFpyY2x4?=
 =?utf-8?B?ZkhieTBnWC81V3pzSWJoRU5QaDNhbEhIbFFkOUt0by82QUVHc0N5SUxZb3pW?=
 =?utf-8?B?QzJLcXFtRlBIWnpCdWovcGNpQm5UUm1rYTNFRjJwMXJMSXQ3VXQxSzRQNWF2?=
 =?utf-8?B?ZjdTdGJiU1VJeitPcTJBOG9HZHcvNElQTzl1VUMzYW9zdWd5VVlrZTN2K1ZK?=
 =?utf-8?B?R3YwYnhuT2gvdy91K0Q3YkFwUWVWNEJ2Q3N4RkxWYXczdEYzRi9xL1hzQzVN?=
 =?utf-8?B?TW1WVXp0NzMzMi81cTcxRUxZYldHQS9ieS9pOHBlM2d2NHhUaHNmZWhTNGhB?=
 =?utf-8?B?eklQYTJmTEIxS2JBWmVEODNZNVU1aXJ1SmxMeW1pR2ZKam1DTmJ4a1h2RUJs?=
 =?utf-8?B?a0JNSW5aNUxHUS8wUWpMeFVNWEx2WWdVZklNMjZxRG9DOG9UNHNma2t2elVi?=
 =?utf-8?B?cjVGaXUrZVcrSHpkRi9CWVRUOTR1RTVublB6cEVQTlE3QlJTaEdDMjBJWjJL?=
 =?utf-8?B?QWNPVmhXOTFvOVlDSDRVRXRnc2NKWWRHWE0renpUSGExMXhzVWhPUTY3UVoz?=
 =?utf-8?B?a09EbHYvWGVoTzVuMkJieHIwZTI4THovRy9GQk1tSGNwSFhQdkRCWmp4bkM2?=
 =?utf-8?B?Wi9DT1pBU1pIRlF1Y2pUdnBnd3QxN2FneG1DeVZWTVVhSlpRdXdaMTVveHRh?=
 =?utf-8?B?c01zNG1kdmZaVmFodW5wNktZd1FLQnJ6dkJHdWE5bDNGczdaZWFwSnhhMW1k?=
 =?utf-8?B?OU5KTlJPd1B2SlF6cWNtK0hUVmlrUHNpU1JUNFMrenByMERIbUNtbjJndjk3?=
 =?utf-8?B?dHU0anRYc2R2ZFFWb21XZ1NCazd5RW9IODMrdmlSaGRuN25BSXNHRDJTYmlL?=
 =?utf-8?B?U1BEL2cxQVNPcnpBbStLclU4MTZIZ0oyS3dZM1pOWTNuNUFtbXRnZTF1eWVV?=
 =?utf-8?B?TWdaNm5Fc1ZkdTd3cVBqZjNkZ2trbDJiZmdhNndSYkREcnF2MUVCeFZheWY0?=
 =?utf-8?B?MnBtRC96cDlxVFJCRFJucy9vN1RxeENza0tleTcxOVJGTUpBdm5Kc3M3d0F3?=
 =?utf-8?B?YnJsd3A1d1RhQUVXaHEwVHlxU3YyWEkwZDF5azlTNEtuVlFtT2dxSEluWXc5?=
 =?utf-8?B?WkkzSVRxeUpNTEFIL1pmbnhicDB6VXh6Ry9WK1REQVRHRnc3QnMwRGJGbkUy?=
 =?utf-8?B?QWkvWXY2TENqS0NpOXNoSmNidTloTEpxZjlJZkt0VFlDR0tDOVNEYUZqYTNT?=
 =?utf-8?B?ZlMyVGgvaDJsbVZyc1BCN2NxZ296UW15L3ZYNC9zN2lQcWFGVkxqamovNDdh?=
 =?utf-8?B?ODF5SnpzNEova25TcXlTdUJjaTdPRWt5RUxWZVUxTnlJNDJZa2V5SjhYNE91?=
 =?utf-8?B?YlkzTGZwVnFBUXNqVktaOGJKdlNySkFTVHRRbHgxaW9NR0d2cUhvR2VKeUVs?=
 =?utf-8?B?UnNneGI2RUdGaXJRcVV5b1RGMnJvUlJxZG1hUU5pbDlHVHg4Uy9QcHErSG1N?=
 =?utf-8?B?VGd4UDhLOWhsSTZYeEpXNE82MDNKMmx6cXdJNytkTWVnUEZaZEh1cUIrTStJ?=
 =?utf-8?B?emxIQU9iQnBXeVdNNmtVTkV0RTdTWGhNYTlMNWFmMnlmc2h1NUZLZVFVMFBX?=
 =?utf-8?B?cjE1TDdiczg5WEMrY1pWblFzTkE4dXE3RzVTL3J3WTdwTm1XYlFuclMzcHZH?=
 =?utf-8?B?VjZUSUNzOFlWZFhyQW1tZkdaVmdsVnZsZjZuUldmVHhsS0lxNDE5OEVLWkVZ?=
 =?utf-8?B?cmlXNE1ibXJCSDZwb2RtOTNPU01Oa2FJb2xpMm5Lb2IxZjlnL3NBSW1PTUZj?=
 =?utf-8?Q?xJZfdkCGCMkEbK9aaWzu0w0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C772CF519F9C4F41AC25C53F3DE00FAA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91905e45-2063-4161-1bf2-08dac3024aea
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 09:59:44.0241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwcydgXQAtqbVK2vVBPD7RG2jKkAB57mTx8VciGjbZrNWut46IByKxTn6dv8bZwK233Uqo2pJZBG3m64CI71fRyinAibaWB72m3ZzNCfl78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6665

DQoNCj4gT24gMTAgTm92IDIwMjIsIGF0IDA5OjI1LCBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFy
bS5jb20+IHdyb3RlOg0KPiANCj4gSGkgQ2hyaXN0aWFuLA0KPiANCj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGln
QGNpdHJpeC5jb20+DQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIGZvci00LjE3IHYzIDA3LzE1XSBD
T0RJTkdfU1RZTEUodG9vbHMvb2NhbWwpOiBhZGQNCj4+ICdtYWtlIGZvcm1hdCcgYW5kIHJlbW92
ZSB0YWJzDQo+Pj4+IFdoaWxlIEkgdW5kZXJzdGFuZCB0aGUgZ29hbCBhbmQgc3VwcG9ydCwgdGhp
cyBzZWVtcyB0byBiZSBhIGJpdCB0b28gbGF0ZQ0KPj4+PiB0byBkbyBpdCBpbiBYZW4gNC4xNyAo
d2UgYXJlIG9ubHkgYSBjb3VwbGUgb2Ygd2Vla3MgYXdheSkuIEF0IHRoaXMgc3RhZ2UNCj4+Pj4g
b2YgdGhlIHJlbGVhc2Ugd2Ugc2hvdWxkIG9ubHkgZG8gYnVnIGZpeC4NCj4+Pj4gDQo+Pj4+IFRo
aXMgaXMgY2xlYXJseSBvbmx5IGEgY29tZXNtZXRpYyBjaGFuZ2UgYW5kIHRoZXJlIEkgd291bGQg
YXJndWUgdGhpcw0KPj4+PiBzaG91bGQgYmUgZGVmZXJyZWQgdG8gNC4xOC4gVGhhdCBzYWlkIHRo
ZSBsYXN0IGNhbGwgaXMgZnJvbSB0aGUgUk0uDQo+Pj4gDQo+Pj4gSSBhZ3JlZSB3aXRoIHlvdXIg
cG9pbnQuIEkgdGhpbmsgbWF5YmUgZGVmZXIgdGhlIHBhdGNoIHRvIDQuMTggaXMgYmV0dGVyLA0K
Pj4+IGdpdmVuIHRoZSBkZWVwIGZyZWV6ZSBzdGF0ZSB3ZSBhcmUgY3VycmVudGx5IGluLg0KPj4g
DQo+PiBJIGRpc2FncmVlLiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBjaGFuZ2UgdGhhdCBjYW4gYmUg
dmVyaWZpZWQgdG8gbm90IGFkZA0KPj4gZnVuY3Rpb25hbCBjaGFuZ2VzLiBFZHZpbiBoYXMgZGVt
b25zdHJhdGVkIHRoYXQgd3JvbmcgaW5kZW50YXRpb24gaGFzDQo+PiBtaXNsZWFkIHJldmlld2Vy
cyBpbiB0aGUgcGFzdCBhbmQgY2F1c2VkIGJ1Z3MuIE5vYm9keSBleGNlcHQgRWR2aW4gaGFzDQo+
PiBjb250cmlidXRlZCB0byB0aGUgYWZmZWN0ZWQgY29kZSBpbiB5ZWFycyBhbmQgdGh1cyBpdCBp
cyBub3QgYSBidXJkZW4gb24gdGhlDQo+PiBwcm9qZWN0IG91dHNpZGUgdGhlIE9DYW1sIHBhcnQu
IEkgc3VnZ2VzdCB0byBhY2NlcHQgdGhpcy4NCj4gDQo+IEkgdW5kZXJzdGFuZCBwb2ludHMgZnJv
bSB5b3UsIEVkd2luIGFuZCBKdWxpZW4sIGJ1dCBJIHRoaW5rIGluIHRoZSBlYXJsaWVyDQo+IGRp
c2N1c3Npb24gaW4gdGhpcyB0aHJlYWQsIEp1bGllbiBoYXMgcHJvdmlkZWQgYW4gYXJndW1lbnQg
WzFdIHdoaWNoIEkgZG8NCj4gdGhpbmsgaXMgYSB2YWxpZCByZWFzb24gdG8gZGVmZXIgdGhpcyBw
YXRjaCBhIGxpdHRsZSBiaXQuDQo+IA0KPiBCdXQgc2luY2UgeW91IGFyZSB0aGUgb25seSBtYWlu
dGFpbmVyIG9mIHRoZSBPY2FtbCBjb2RlLCBzbyBpZiB5b3Ugc3Ryb25nbHkNCj4gaW5zaXN0IHRo
aXMgcGF0Y2ggc2hvdWxkIGJlIGluY2x1ZGVkIGZvciB0aGUgcmVsZWFzZSBhbmQgdGhlcmUgd291
bGQgbm90IGJlDQo+IGFueSBtb3JlIGV4cGxpY2l0IG9iamVjdGlvbnMgZnJvbSBvdGhlcnMgaW4g
dGhlIG5leHQgY291cGxlIG9mIGRheXMsIEkgdGhpbmsgSQ0KPiB3aWxsIHByb3ZpZGUgbXkgcmVs
ZWFzZS1hY2sgZm9yIHRoZSBwdXJwb3NlIG9mIHJlc3BlY3Rpbmcgb3BpbmlvbnMgZnJvbSB0aGUN
Cj4gbWFpbnRhaW5lci4gSG9wZSB0aGlzIHNvbHV0aW9uIHNob3VsZCBiZSBhY2NlcHRhYmxlIHRv
IHlvdS4NCg0KVGhhbmtzIEhlbnJ5LiBJIHRoaW5rIHRoZSBhcmd1bWVudCBoZXJlIGlzIHRoZSBi
YWxhbmNlIGJldHdlZW4gbWFpbnRhaW5pbmcgYSBwb2xpY3kgYWdhaW5zdCBsYXRlIGxhcmdlIGNo
YW5nZXMgYW5kIGltcHJvdmluZyB0aGUgcXVhbGl0eSBhbmQgdGhlIHJlbGlhYmlsaXR5IG9mIGZ1
dHVyZSBwYXRjaGVzIGJ5IHVzaW5nIG1vcmUgYXV0b21hdGlvbi4gSSBhZ3JlZSB0aGF0IGxhcmdl
IGZ1bmN0aW9uYWwgY2hhbmdlcyBhbmQgYW55IGNoYW5nZSB0aGF0IGNhbuKAmXQgYmUgdmVyaWZp
ZWQgc2hvdWxkIGJlIGF2b2lkZWQgYnV0IEkgZG9u4oCZdCB0aGluayB0aGlzIGNhc2UgaXMgb25l
LiBIb3dldmVyLCANCkkgYW0gZmluZSBkZWZlcnJpbmcgdGhlIHBhdGNoIGJhc2VkIG9uIGFuIGFn
cmVlZCBwb2xpY3kgaWYgd2UgY2FuIG1ha2UgaXQgYSBwcmlvcml0eSB0byBnZXQgaW4gaW4gc29v
bi4gRm9yIG1lIHRoaXMgaXMgcGFydCBvZiBpbXByb3ZpbmcgdGhlIE9DYW1sIGNvZGUgYmFzZSBh
bmQgcHJvamVjdCBxdWFsaXR5IGJ5IHVzaW5nIG1vcmUgYXV0b21hdGlvbiBpbiBmb3JtYXR0aW5n
IGFuZCB0aGUgYnVpbGQgc3lzdGVtIHRoYXQgbG93ZXJzIHRoZSBiYXJyaWVyIGZvciBjb250cmli
dXRvcnMgc3VjaCB0aGF0IHRoZXkgZG9u4oCZdCBoYXZlIHRvIHdvcnJ5IGFib3V0IHByb2NlZHVy
YWwgYXNwZWN0cyBsaWtlIHRhYnMsIHNwYWNlcywgaW5kZW50YXRpb24sIG9yIGJ1aWxkIHN5c3Rl
bXMuIA0KDQrigJQgQw==

