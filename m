Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A865B61DC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 21:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405981.648407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXpPF-00087h-QF; Mon, 12 Sep 2022 19:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405981.648407; Mon, 12 Sep 2022 19:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXpPF-00084i-MF; Mon, 12 Sep 2022 19:47:45 +0000
Received: by outflank-mailman (input) for mailman id 405981;
 Mon, 12 Sep 2022 19:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FF1=ZP=citrix.com=prvs=2473eac85=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oXpPD-00084c-Oq
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 19:47:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e9879c-32d3-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 21:47:41 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2022 15:47:30 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 19:47:28 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::50e5:dec2:1f40:9648]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::50e5:dec2:1f40:9648%8]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 19:47:28 +0000
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
X-Inumbo-ID: c1e9879c-32d3-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663012061;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=bY0AwzqlLfSbKGt0BwLOt6a0h0Eho4PZJppQMciLUmk=;
  b=RQF6QjLyMz68lumzloTo2zhvKm6r8kltxQkHUAx5lKgCcUdMiI6SRpMl
   rubT1qRRNteCGNV2NrkeuKvw70jqWbAkfMUcf2LDkcNsMCfdoUQ5pQcPT
   aeaowDgtDrg+1GCPXAoeHTI7oRVDm4rnBnuhxD7VCjEx9lWyZYoUdyvsb
   w=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 79491391
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FO1BfKhUUGp5DY9sksCL171mX1617REKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41ycKHmIJkSQpr+3s2EH8Q+caZW4+VcRv5MinPc5STQEtp5
 ZVGN4acIZA4FHOF/hqkPLS5p3Aii6yFGeDyVLGYNi0ZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EAP81mEoajhK4f+Jpho0sqWs4mNC71ZkPakX4VKCyXVEXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1LI0hK6YoD66jBavCs+z60nA/QVbEZTml2hkst4j
 d5ArvRccy9wVkH3sLlbAkIw/x1WZ/UcoueWeCLn6KR/8mWdG5fS66Q2ZK0JFdVwFtZfWQlm6
 fEeITYRWRGP78reLGWTE7QEamwLdaEHDatH0p1S5Wix4cUOGPgvd57i995AtArcs+gVdRroi
 2j1XhI0BPjIS0Un1l76k/vSls/w7pX0W2UwRF54OcPbSoUcpeB8+OGFDTbbRjCFbe9Ol2Kim
 Vv4xCfkEggoN/Ofihyn1H3504cjnQujMG4TPJuR06cwxXisnCkUAhBQUkanq/6kjEL4Q8hYN
 0Ef5ispq+416VCvSd7+GRa/pRZovDZFA4YWT7J8tl/LlvG8DwWxXwDoShZuZds8u8JwaSEs0
 laRt9joGSZuoPueTnf1GrK88mLuaHFOfDZqiSksagEo4t/mh40PpT31U9l9MI2FqOyqMGSlq
 9yNhG1k71kJtuYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPAwVXb5OxFK4CxSliHo
 WgKnNWY4OkSDJaL0iuXT40w8KqB4v+ENHjZngRpFpx4rTC1oSb/JsZX/S10I1pvPoAcYzj1b
 UTPuARXophOIH+taqwxaIW0Yyg38ZXd+R3efqi8RrJzjlJZLWdrIAkGiZas4l3Q
IronPort-HdrOrdr: A9a23:wfnpBqGRdkGJF/rspLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.93,310,1654574400"; 
   d="asc'?scan'208";a="79491391"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5DKnACBtqxr0miOZVaR2g+ClH1KDRVUfpa5ObAAujmW+M0s1ZaiWcPEEU3H6q1bPejCsl6u/PbfCkSd/YepT79yL49S6yp00lYhDldAMGaZd9xJvdOz6T7jNmrzdhLuTaAjvf3NJ74fWiU3gW6ApSNE8CQf836+VAlFwxUWNUu9Am96Jba6xJ8p8fmfYOQLR76+OG/oJQh/y7PYAmlaN3g0REXxohPRi3sfD2HmyjHnkUBsOy1Bo4OMs06ew37tugVeMkRW0o13D2Rfjc0FijfZPB88gUbkENqFJlQAV8533KxG7HvFsIbC5zcND3n0t7gRG0w2+lG2w565QDjnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXVFlcYr7FyE/XNnczWoykhCdjkLdF3Jay4ntLb4a24=;
 b=hiT6uic1YTQYPGa8AJk++RNZmGPhSXpzGnJfUa1s4DuR1u8ZQIEbC3a2kul4BMaOBFq6Ua+F11YjbBgIebfkrgeJYV4eLbqA0LfrETHi/bIg9NuSFI1nFmTSYgsFU2g66m2YiYiMOBAoD5fuxPbEzLAbQMyoRFbrLflKuny52mPk38cr6ftCbjGF8z72JfCFL3kRd03nneU0eYI8ESS6GZUbofdL3yGnNiC6RaEsZpDQjkjzOGJ05Uy0+4iKlOkL/A7B3VoLF9a0mE3qkf43eW1ROrBxsCQBJlTZtpFVuGYIieizlMPq91wFS4MGOTQz22i/rGfg3sU3Ha8pr9d2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXVFlcYr7FyE/XNnczWoykhCdjkLdF3Jay4ntLb4a24=;
 b=pbaINygjap6mXHXWsfJiGokz/1fxWAEJ2CtHpaVIxp6D2hn3jiwPDJrFiBkoIMnEKbXhMsGHOy5bcJ6qNJemqHSpsIGN/5OFJSvcdNWfWH/WnUkQmfNIYXNNSyqc/ItkTPo6C3RDz4tYnAhvMlEemZRzoHzs2GMNKjLFiP1HoIQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Evi Harmon <eharmon@linuxfoundation.org>
Subject: POLL: Xen Summit and the Queen's Funeral
Thread-Topic: POLL: Xen Summit and the Queen's Funeral
Thread-Index: AQHYxuB8XGNckV6WvUCHiUEdqxOGyg==
Date: Mon, 12 Sep 2022 19:47:27 +0000
Message-ID: <07D52A28-6A30-450C-9343-D8388F5AAF54@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|SA0PR03MB5610:EE_
x-ms-office365-filtering-correlation-id: 691a9743-911b-42bf-369e-08da94f79f79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IaA5ewAIRIxiGZs1whLwMFQ/Tz0mC4gHslHVWY3VbXs7OV1lSUmr7xgy9+aHFBP8ySgNGWEE36tNbh3ADP6KAv50nGB9ZkGJmHAZAMrywXwlvzyUZZnW5OQRQe9Wxq+sTmD8T7fRlWXLcz1haCO3LbExxlx29BFqPpsEzE/kyzarwP4zDjnL+YwE7jVBV59htvAqoaxsbrAvHFS5UUGf9gI4Y+wTu3R13NSr130rL3LmORgl/JEvoR3vc4RCR7I6YAhYihLlejU1yZUXvU02B4T6mUGhdt4xh6wXKkvbKfghrE6dcSLZ2qYAUFKPyzxwc0gyyzehw2+DweJoidFuhhDSfi1qjdAKtHMnhfUf2/24USo5tNBqBsaZxhx8aqAivoJFFMvaGOWJ90sS5JgnW8zZEmftrSd3gDw57kdbpmjQ8KCAIL4SMkouMud8L9fQp2b+5YEcHBJE9+S/7oLp7A/2M2ZXfZAGsP8Y8M6igsnZVO2T5B4iSjlENKCfB0MQTC3vmZAgFKxirBKMZTwd5doOASCqtKQVYU8Jy0yR+ThUWDBaaTDOO4/DklRWvHCrmAHDPN9ZPwcBkzm+XYnA8ZFXVS496q0tpoyMA6rZzF7N7AZ91gX3JsM3eVrePqyAPTj0WyMUQuKLvyrAd74oiZ5/mN5GibQIZAIWeKZHnw65pRlxhlsr8CaTr65ZD5zw1Ic7mNBHmeXyKa8kSrDzNR0Qgv1x5BsGIwKnkCmVOUxBGd0njp0jmuksP5bscZEb5MorGEaW78ZgPyq5NZu59b94JsuUMLUNGdiWe3FcAlMxkdbJ79y4xc6dMj7GOgmgFBWjJq8WCU356QRiJ5ZqQQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(6506007)(99936003)(316002)(66476007)(6916009)(66556008)(41300700001)(66946007)(38070700005)(76116006)(36756003)(2616005)(66446008)(71200400001)(6512007)(122000001)(4326008)(6486002)(478600001)(8936002)(2906002)(966005)(5660300002)(86362001)(91956017)(64756008)(38100700002)(8676002)(33656002)(186003)(26005)(82960400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MytHQVRZVFNEZWpUeG1od1JVUXFmS1VGZXcwdmFRMzFEcWVpQUMwaUtCenEw?=
 =?utf-8?B?UGowdnd0TXdRNHlwcE4wWVJ2NEJ6UlRiQTRWVkk0L01mV29qTVhHaTF6S3By?=
 =?utf-8?B?L3RXOUFwbXk5VGNqTlYzbnJjUUtRakI4VjN5clk5ZnFCWEk1cklsVUdQTkky?=
 =?utf-8?B?aVNuUTYxamRkQlRtb29yc1dka1AyREN6S3BjYURKYkVwaC9MSVpoSS9wN1ph?=
 =?utf-8?B?ak12QjlWSHhsTGpxcE1kMjlHMGNuZnBpNUtJNzZUaVVONUZLMTZHVFRweWQv?=
 =?utf-8?B?ZmM4cXRlN1pqcm5hNkZEb05yU2tIQUxWUzhsc2NpUmtTbFJFTlhWU3FZMktx?=
 =?utf-8?B?OXhjY2Z2Q0IvU0FJNEZ4ZHBwRFlGZVJhSXUrWE5GNFpkNjVmUWxxYU1ma051?=
 =?utf-8?B?Y0N5djBKcnRnK2h5bSt6aGFkTlhwOGd4UnRMUStzTVM3N0dnUVNaMWJWSE5M?=
 =?utf-8?B?VjV2V1lYZVVrL2JwWGlqeTNlTitWOGY3cTB1RW9lMDFwQUZGVVVvaHo1dFZo?=
 =?utf-8?B?OEMyR05qOXhnSFhpSUFtSEY2Qm1OTkFpcUJnYUJMZ0FQMER3SUtFUHhUVVI1?=
 =?utf-8?B?R1N4dm5DREtsSCtTZng1MkQ2QmhrRm9DblFCWXY2OUhTamc1OTJFaCtwTWZ2?=
 =?utf-8?B?MXUxWVp1T05UdU9zTDlFVy9nQTU4Tm5xd2Z6UTBiTkZDdTZWeVp1b0VuRzF5?=
 =?utf-8?B?TEJvMURJTVRxWTNQTUdVaG1MTWxqeXUwbXR0ODdmMnYwOGJ4YjV2dHZsNDNJ?=
 =?utf-8?B?UkI3Sm5LWk94empnS09zc01PRk1sTjVRZ1FEYncrSHVmQ3duTFV6VHRzUkJP?=
 =?utf-8?B?aGpFVWg1Y0JWQ1c3U3FoVHpYbkVnWjVkeFZrRzhHUStmWHdnTS9PU2xvVXo5?=
 =?utf-8?B?WENBWVJJaGhiZjVmTTlGR1NWMW54aGxUVVpiZlg2clFEdlY0WERZdEk1Um1I?=
 =?utf-8?B?MEd3dDVoSzJ3aWkwZmtGeU5pZkdpeEl2RzFiT25hSzlYRnloVm53WW9vOHdk?=
 =?utf-8?B?N3o3RWxEbTgrb1h0ck5pU0NuNERSMG9yWXgzQzRETllIOXZwdnNDUEdITFFk?=
 =?utf-8?B?alBkMkNLS2RCUnFnNjZxeTkxMmRLcXZxdG16eWN5dmZTN3FrU3ZYMUJPTEE1?=
 =?utf-8?B?d1IwY2xmc0JIMW1NNU1TUW9tTGpqMVdhSzlPUmxMOW1ic2VMWkIzd1NGejg1?=
 =?utf-8?B?Q3lObGZzRG9VYXJJN3hMT3ZCaExWYVdKY2ZPR2JIS0dnMmZjSWtFY1RZQlNU?=
 =?utf-8?B?a0VxSk9BMlFIc09SM3plMmw5QnFiSGU4cmJGU3ZFQytoRHNnY01yS25ZZlU0?=
 =?utf-8?B?eERTSElFZTVkOTRBNCtvL3F1eDNrSlM3OEhwTCtjREdXVklYN3ltYTFIT3Ja?=
 =?utf-8?B?MjROeSt1SUYrOHFPWWxjaDNZblFVdnJFUXlTVnh6MDVFZ3pyUE91OVkyYUYy?=
 =?utf-8?B?RG9qdDVrRVh5c1ZVUElIRmhBc2ZyR3hnSUQ0djhpZFRBZk1RU2N5SVlhNFhV?=
 =?utf-8?B?aG9ZeklhUUEyVDFxYzBYOXl3RUxEbmRhMHZCcUxHdVRNTUJjZ1p1N0hvcnlS?=
 =?utf-8?B?Qy9xRUNnOENLeWIwMDZLZkZpK1hJbU1JT1FMc3NHc0EzcVI1cDJYeDNrcko0?=
 =?utf-8?B?TEs4ZUNDVHVyMzZ1MktldmQvM0p0UENoUDE3M2dlUnF6bWlUVHUwNkxOc0l1?=
 =?utf-8?B?YzJCQ2xYWXNRVFRqQ2tZQnJwTXZCQUhBd015ajIxTTdHRXRxNmZlNzBuTWVD?=
 =?utf-8?B?NmFGV0REM3BhcFlBU21OM2xXNEpOYVBjWko1WElBMnVBeU9KcjdOWFBFaC9u?=
 =?utf-8?B?M3ZMZnNaT0pqbTJtRm1meVdGZnNsVldBcVcwQjlEdUhZRXVJcEgySnpPSnk4?=
 =?utf-8?B?WDFVeVE2QVk4VlMrZkNCbkt2alRoUUFGWGhrTml0WmRLWnV1RURUVWkyQllk?=
 =?utf-8?B?L3JkQloyYnlNL1hJWmlWTDBLV0l3am14U09zOGprQXRyOTU5MGhkbGI3enhT?=
 =?utf-8?B?WDUxdkFmUE1QN0xUelc4VFduUjdzS1IyTk82c0ZwektyYWxVTG1PUllOL0dG?=
 =?utf-8?B?Y2o2VWJmeTIvbEZsenkzbEhhbjl6QVp6eVoxYlh5WEFLZWxERWhBaUlNMkYx?=
 =?utf-8?B?clNSMjg0N3VzVHNoOFhkRHZJNlNMTThaeWloaHJjRmpjNStWZ2NUTlA3d3lr?=
 =?utf-8?B?akE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A265FD68-C96F-4622-AB7A-13CA55A25E5C";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691a9743-911b-42bf-369e-08da94f79f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 19:47:27.9231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFWCyOtFnd5Jwp1iyf9zzQq7MfkQoNCJ9H6dt5K+m/Xo4SI8r5/yRTTdWmT+Tqc9EqfxntjyCAlwnSdiV+GVt5gQYSY/FwUhfCkiKm5l+uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5610

--Apple-Mail=_A265FD68-C96F-4622-AB7A-13CA55A25E5C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

EXECUTIVE SUMMARY

Due to the Queen=E2=80=99s funeral, the first day of the Xen Summit (19 =
September) is now going to be a public holiday in the UK.  We=E2=80=99re =
trying to figure out what the best option is (detailed below).

*If and only if* you are attending Xen Summit, please fill out the =
following poll before Wednesday midnight:

=
https://cryptpad.fr/form/#/2/form/view/w8pI8KNpo9gxXSdUc0BwbvKiowzM8aL8ZBo=
n7rrXf5U/

You don=E2=80=99t have to give your name, but if you do it will give us =
some confidence that there hasn=E2=80=99t been =E2=80=9Cballot-stuffing=E2=
=80=9D.

THE SITUATION

* The State Funeral for HM Queen Elizabeth II will be on Monday, 19 Sep. =
It will also be a public holiday; so normal office workers in the UK =
(such as those at Amazon, Citrix, and ARM) would normally have the day =
off.

* Official government guidance says: "There is no obligation to cancel =
or postpone events and sporting fixtures, or close entertainment venues =
during the National Mourning period. This is at the discretion of =
individual organisations. As a mark of respect, organisations might wish =
to consider cancelling or postponing events or closing venues on the day =
of the State Funeral. They are under no obligation to do so and this is =
entirely at the discretion of individual organisations.=E2=80=9D [1]

* The Amazon offices will likely be open, but one of the conditions of =
the event was to have a 6:1 ratio of external attendees to Amazon =
employees.  Additionally, the facilities manager wants to minimize the =
number of people working that day.

* We=E2=80=99ve already mostly consolidated the schedule into 3 days, =
with a 4th day for =E2=80=9CHackathon / Extra discussions=E2=80=9D

* Many people from outside the country will already have booked travel =
to the UK to arrive on Sunday evening or Monday morning. It will be a =
=E2=80=9Cnormal=E2=80=9D working day for them: they may not feel =
comfortable taking it as a day to be a tourist, and working from a hotel =
isn=E2=80=99t very nice.

As far as I can tell, we have the following possible options:

1. Leave the schedule unchanged. This would require all the UK attendees =
=E2=80=94 in particular the Amazon employees =E2=80=94 to =E2=80=9Cwork=E2=
=80=9D on what would otherwise be a bank holiday. (Or alternately, would =
require arranging at short notice to suspend the 6:1 ratio.)

There=E2=80=99s also 1a: Leave the schedule unchanged, but get rid of =
the physical component on Monday. We=E2=80=99d always intended the talks =
to be virtual-first; we could just make it virtual-only.

2. Shift the schedule, so that the talks are on Tuesday, and Weds / =
Thurs are the primary design session days. This has two flavors:

2a: Shift the schedule, and leave Monday empty. This means we don=E2=80=99=
t have to worry at all about the 6:1 ratio; however, it=E2=80=99s not =
great for people who will have travelled here from abroad, and may have =
to work from their hotel rooms (or just take the day off).

2b: Shift the schedule, and make Monday an =E2=80=9CHackathon / =
optional=E2=80=9D day: Open up the space for people who=E2=80=99ve =
travelled from abroad, but hold no other events. This would still =
require at least a few Amazon people to be willing to work, but the =
number would be greatly reduced. (Or alternately, it would require the =
6:1 requirement to be relaxed, but this might be much easier with the =
lower number of people.)

There have been arguments both ways; please give your thoughts, as well =
as specific ways in which each decision may affect you.  NB that not all =
options may be feasible.

Thank you for your patience and flexibility as we deal with this =
unprecedented event.

Peace,
 -George Dunlap

[1] =
https://www.gov.uk/government/publications/the-demise-of-her-majesty-queen=
-elizabeth-ii-national-mourning-guidance/the-demise-of-her-majesty-queen-e=
lizabeth-ii-national-mourning-guidance

--Apple-Mail=_A265FD68-C96F-4622-AB7A-13CA55A25E5C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmMfjM4ACgkQshXHp8eE
G+1JTwf+L6O4qVBff1tNmMrddtByFkjhvSxKcYiHGvutz/CBeQmKUKAy7Ge0/5up
1IgScAhSpS7KGTu6KYl+v87xYx9MUK8V09FtZGn1xfh6+iTGg+xM5GwfH3ecA+vr
er/rnCvrVGUp+8gJbVkZp3rQopyMZVe0n/NFt7V64IqZN0PIfHdBwIDtfqoIGzmu
gOn1WiGxCfo44Kq9PJ7B/ms618HDwrlPDC0eW6JtIgOYq+L9QF5Lcsy+VekHlg8o
3i2NgqOwLJxUuH9s/jpxAKTE/Wv9z7zPkaP5iYn5bzHhPxkB4+bU06CTn2OseMUr
PjwZOM2iZ/1AXDrBIC87ESg6zkH43g==
=WmdI
-----END PGP SIGNATURE-----

--Apple-Mail=_A265FD68-C96F-4622-AB7A-13CA55A25E5C--

