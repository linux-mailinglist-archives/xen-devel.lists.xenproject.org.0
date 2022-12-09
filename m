Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA2648998
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 21:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458240.716135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3k7E-00048g-PL; Fri, 09 Dec 2022 20:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458240.716135; Fri, 09 Dec 2022 20:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3k7E-00046K-Ll; Fri, 09 Dec 2022 20:37:04 +0000
Received: by outflank-mailman (input) for mailman id 458240;
 Fri, 09 Dec 2022 20:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3k7C-00046E-Vs
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 20:37:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ada0bf7-7801-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 21:37:01 +0100 (CET)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 15:36:45 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4948.namprd03.prod.outlook.com (2603:10b6:408:de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 20:36:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 20:36:40 +0000
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
X-Inumbo-ID: 3ada0bf7-7801-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670618221;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DfF5fXyAJTGLV7Gwt4T347yPWa80m0/jmAOxM/3Hzm4=;
  b=al9YbfOEThn0hy22VY4/Y0E+SL2fUIH7t38DqLOovXK18HFjadOQD8ZR
   GTQgs+xgK+VURtE2bd67YVuEEO5oNdtUFly1HA81McUNyWjut+Aod+6CD
   aYqHV7KRFyuDaPCE7FTa+c9mtinjWnBlez0hTvXJuSQwv9uuQu5kFFb/+
   c=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 86613284
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H0q5G65JC6uyNAToDaxC7gxRtBrGchMFZxGqfqrLsTDasY5as4F+v
 mEdCD3VOP/fZzP2c9wkPNuwpxwHucKBydRhGwduq3sxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT7QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 vdbcGgoMhO/pMmL8a64Tc1BjOkIBZy+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+OF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJMSuTjrK426LGV7m5LFywycVilmMaatG+cC9RNc
 U8JwCV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zvpd81hxeWFNJ7Svfq1ZvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:4sEWk65E/A1vXA6v7gPXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,232,1665460800"; 
   d="scan'208";a="86613284"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7Cfn3Bd7rsUME2eiHaMjwDDwVpYmjAU0E49gyIzyJ0rofbz6NJVVfiv6UdOvABcaFZdk9X8LQ6ypjSrOdEkR2b/qRuBP5DJ63a6DMDyspf9pVKUfiXJaSi+P/d6sVXpw+jiwQqg/jy7Aip0kLLudaHU2RQ9qhXAF+9dT8xdQjmbGn8rk+GAeuMbxTs4rMsiJrOySCYEPKOCGbiVMnfgwB9aHERvZOnVW1EMQX4cyDIaPivfZ0DSfj0w44QDfLYEVLZJ+wmC9YQrPfUipzs/HriAkYHo48+7zV9+oCbx8era5me+hWkVui1Rbmr6MwmWzIyG11z3z9NaThRXVl4C5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfF5fXyAJTGLV7Gwt4T347yPWa80m0/jmAOxM/3Hzm4=;
 b=UxRFwP0CWz9oEglIdTw9Q6fvAHLGrWwarN9E84kTGfaxtW7nBbGIMMYogTHjaxmOreyKTNg/EMjQNhhEcE/L2g7K2sriQVnzGeshhscjk4uK1EYtBMRCkF6gnBiLtJEHi6fZnEN5EvmNlpV5KOovcKLVH9Y1rwF0k+VjvukGCU/C5GlM0MAuiqF0xe825XlXJnbdsH3gu1alfOH0NN+Btr+zQbBMBB8mxpDu7t7Vvs8HsFXKs5TRXsPK2wgv1yI65/iTQfCPeFP4Z6mXw8sIbNzLXCJVNoEg18CzPp7nS8gfHUulEg9qdrPEVxR2wJ1UbNR7ZqAQ3A3MN7gEkcKmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfF5fXyAJTGLV7Gwt4T347yPWa80m0/jmAOxM/3Hzm4=;
 b=PkVMSIrESwc/we79ssojwqF9hg5qaByfagyu93cyMxK+twwexgfgFYNCiwsi0HFgC9nd4rPS39YR5KsDzaieWCj98EE1HTji/8jg7FZ6vOW0rSnsxHcprp5dRcMBOMFs2+KIZaQbReluV5YkWRfVXFAXOARb5tS7WRC7DI3sAZo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/boot: Drop pte_update_limit from physical
 relocation logic
Thread-Topic: [PATCH 1/3] x86/boot: Drop pte_update_limit from physical
 relocation logic
Thread-Index: AQHX61jGXr4kBoFGFkuXJLE+nUmCrawm5uIAgAOIWgCAAOYAAII87/QA
Date: Fri, 9 Dec 2022 20:36:40 +0000
Message-ID: <f17e664c-03ec-7204-aa4b-19448fa72e81@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-2-andrew.cooper3@citrix.com>
 <dc3f5bf2-53f9-7dcd-2be7-f9f953b382cb@suse.com>
 <736f40e4-0297-ba7b-abce-c9b67ad8eb31@srcf.net>
 <f522b9df-1ef5-4fa0-7c77-f4b142164df9@suse.com>
In-Reply-To: <f522b9df-1ef5-4fa0-7c77-f4b142164df9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB4948:EE_
x-ms-office365-filtering-correlation-id: ee267fe5-cce7-4bd5-798f-08dada2513b9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rZ8gTfgpJk4V1sK7L7OaSeM1TXgnpxdaAJerxqyqSajSAEiKUMLFybuzmwHXWv+qQXqqbXqZn4m2oaR1w2mVK2ZfChlpi3Pi2iYOQMDJjXRcwS8s4fwxNBU/2RTlri71VJvWn9EGzVSPsE4/qLNUsMuCgVNOhiEiAkOL7nLyrmIgR2Ko+xyYsgmtkOnSGH/DWwVB7GlcJnTa/VCJHqhbgpG4t9goNcorW7eF0giz5vKZZmX0Di89R1pAw7GGnPzUgSCjEC66oM5Fnptlmylb44L/sKXkYJqKid8s9+3zIErYWzC+t8TStv9mhbsCiA1Js2j0jRH48nsmk8zAFcEhLAVqnj/cgLq+KuyoSb2ebZ8NMHWZna2QhgIo7wKj1H5b6xx5CpMWUDaaQ19Z7U4ekttIZu3zV5A0cUT4BwDOQdqxtf0vwgKizc1i/Cy/YfAwQcTkngbaCJ/0a0Inf/+BMwFXjGR0il2SC7OCnOG3CLiSMd0AvVBJbIwGD+nYWtFCEBCzBa/gJ8LONYqMS0PnPRFZKa8GJ3bbrRGZrQhzpwNeqlafdFHF9cvKnSdfJlXwbd/SoM5OyG0gm5slZEWworwE+8f5Kcn21MvZRzDHZBeGiHwSufkv3EVMU9QnWbllVGmtcT51UxyKD18Yehfi1PWBmAmDvHX2w3elDkSYSqjiQOwi7054jGUAkBG6chNYgoHmz3mp81M90q4qVYJtXqh0jWWiJAq8DddpmZewYUmVK1OJl9QnUzuXFW7zYggF6r6rlnfM934MRt3XvQXJEQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199015)(2906002)(31696002)(2616005)(38070700005)(82960400001)(4326008)(8676002)(6512007)(26005)(38100700002)(41300700001)(66446008)(64756008)(66476007)(122000001)(66946007)(76116006)(66556008)(186003)(36756003)(54906003)(6506007)(316002)(53546011)(5660300002)(6486002)(91956017)(86362001)(478600001)(31686004)(83380400001)(71200400001)(8936002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0ZSSUFjT2wyQUsvRWcrbUlGeFZmdWpUdzlrdUxTSHNDS0plWVdpT0MycE1h?=
 =?utf-8?B?SVpQbnR3aGQ2YkdrMzhNbHVSZFpnNGtqZjJicTdvZHAwMVRpd3RJRVdIMkFi?=
 =?utf-8?B?ak5mTE0wR3M2ekhhbDBOMXd0SkxoTTlRTksxQjlMQmwzSkJxVEFBcmNjSlZO?=
 =?utf-8?B?SDRPSTZWT3Fuc3JZVzdJZm1WTjIwZUE3WnZ4UDcrZ1ZkYXZSTDBuS0ZZaDFW?=
 =?utf-8?B?bWpacmovMzJqOWtjaE1jcVJOZUY4czEySDB1UVBuUm5kT21uSUZIU1hOb0Y3?=
 =?utf-8?B?azZkTGlkc3BBR2dDZkF2eSs5WUdRN2dqaFAzaEtJL0w3L1A4S1IvUmpENjVO?=
 =?utf-8?B?S3RPS1djUnFlK3hxenlQT29kNDJsVEdYTGp4cEx1dTF0eGo1RUk5Q1A0eURj?=
 =?utf-8?B?REdISDV0bG15d1UyczZ6dzVObUY5djRyUW51OFlHOW9EZi9IUCtyWHdEa2lz?=
 =?utf-8?B?V0hKN05NQlpkTzVINTZ6SjJsd0J1aitmZG0wTHIzMEpqeEd0VWpsSGFZQ3ZB?=
 =?utf-8?B?cUVoU1IrS2QySk5TcnM3OU4rM2VrUVh5Q0hGdFliU2RpL3M1b1JJc2pEZllo?=
 =?utf-8?B?UW1wWEtlSnRTeHlZQUpnc1dBYW1wSzJJakI2aXl0U0QrVGZFb2RoN2RaNXlD?=
 =?utf-8?B?dFJlOTFvQlg5dW1pZnI0My8wam1FZFdCb0JDYjZGZ3VqM2R1TmRkMEtqK0du?=
 =?utf-8?B?LzdVV0Q4L3YzVjJtZFhXcGtUVjBYb3Z6QVJyOFlqVG11Mk81eVkwM1E4SlNh?=
 =?utf-8?B?R3lqZ2M3bFpBM1pkTlBOdUdMZFRnWDRuSENvM0xjZ0NWdFgxL1pRMkl6bjdw?=
 =?utf-8?B?aGhYUzYwRkYrQ216dUZEQy9vUXY2QmptTVFNckNCWHNaeVorcmhaZW9iaGQ1?=
 =?utf-8?B?anQ1NVFGcXA5eDEwbHhkb3JuSFVrTEtUei9TUFZNb1NaT2lJS2drUlVnL0Rk?=
 =?utf-8?B?eG5raCtQUGNhTXZnNllLbFdVdTdScDMyRU0wSzZxenlMcjNzTno3N0JESDJD?=
 =?utf-8?B?WS9ET202bEZhd21pQkdaSlFFT0dyQUp6WDRKUHFxMjZmY3BsWmhCdjNHSFRF?=
 =?utf-8?B?S3VKUjdjWHY0c1RvVmJSQTRPbFU3NTBPaVVJRzltT0lnSlJTSG9USU9PQ0xX?=
 =?utf-8?B?Q1NSNkxlZVRiblAwTmR5aVhTR252SzZyN25ia0lHRDFnRXUrWWlEM21hQXRr?=
 =?utf-8?B?NjBDQnU2YU5XdFNuaTh2ZTFPQndRODBJWCtuaDJscC8xUXVUUXArUDVwL1p6?=
 =?utf-8?B?TW56M0tBYVNTR3Erd2wzRGs2aGw4YUJLZXZXYUxWb3laaGtBeFRJT2pnVGVH?=
 =?utf-8?B?OVF1R2o4TXpoRzlrZy9FZ25ldmZqWnV6YVlRQ08yMnpBUkFpMFlINXNPUjln?=
 =?utf-8?B?UzJJRjhnL3FYTjBEZHpGNGxvRUhlZjd5eGZKREVGNmNQcURKWHlpVitsY1dH?=
 =?utf-8?B?U1A0emVxM1E2TVZrMlhkem41OEZjOE5NajZEa0hBeVp2b1g5dHlud3kwNE1T?=
 =?utf-8?B?alNkVW5COTRRVW9WOGJuMjNJaDRwSThpbXFMcUZkazhIZXllLzBTZHZ5VVpw?=
 =?utf-8?B?T2R5VlZSQzh3RTZ1ZDJYK24zU1NBSWNSTWJXSk91Y3VDREtTK25TaVlZN3Q1?=
 =?utf-8?B?TjJNUW80NWRTK0xkeW5IaFlmbnZrdmw5VVNJTXAxYnhoRDY3em5XQ09nbjdo?=
 =?utf-8?B?N1IyblF4WTd5aXJrbER5NHN0ZnQ0UVFQY3MrL2k2dEQvN1NEOGV4TnZ0UHBY?=
 =?utf-8?B?ZjNZWm9vdmluQmYvTEpwaXdFa0NuTTE3R1lCLzE5STJBTHR2TWQ2aTZ0ZHov?=
 =?utf-8?B?bWJCNll2SFdYMXM2bzFGREtYYkJHdHpXUTdFQk53QUpIOXptdVZrOWppQVZs?=
 =?utf-8?B?SFAvYUpDZGdlYnRrSzBsOEZQRUN3Q290NUF2L3Z2bThrTTh4SExYNWFSQXhU?=
 =?utf-8?B?ZkhDM2p5S3A2R1pLMkRJVVV2UTJLSkVYbFNORXVua2hmM016bTlkdW5XbU5i?=
 =?utf-8?B?elBQWWRlN1d6UUw1OCtrME9jKzV6VUZCbXF6ek93ZldnZ1gvU1pBNS9TS2NB?=
 =?utf-8?B?Z2JTM3UzQ0Y2VERNQzlWYVdoelU0NWZpaDlHRDJUdUVXSkFyamVTRm12OVRQ?=
 =?utf-8?Q?6Rzl0RVsYEHezx/2bw9kn9ER7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0138282D160FFE42A8DF9364E1E1ED62@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee267fe5-cce7-4bd5-798f-08dada2513b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 20:36:40.5757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zX9TQqdU66bRo48kXQKxeMdAzlCGBGdpNdjm1nJBx0NveE2dNzkFiG+aXKW7BKytvB/UtybD865ueEdqVHD/925qp8wYcRp2j/B4U8ha3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4948

T24gMTAvMTIvMjAyMSAwNzoxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjEyLjIwMjEg
MTg6MzQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwNy8xMi8yMDIxIDExOjM3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwNy4xMi4yMDIxIDExOjUzLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPj4+PiArKysgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYw0KPj4+PiBAQCAtMTIzMCw3ICsxMjMwLDYgQEAgdm9pZCBfX2luaXQgbm9y
ZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkNCj4+Pj4gICAgICAgICAgICAg
IGwzX3BnZW50cnlfdCAqcGwzZTsNCj4+Pj4gICAgICAgICAgICAgIGwyX3BnZW50cnlfdCAqcGwy
ZTsNCj4+Pj4gICAgICAgICAgICAgIGludCBpLCBqLCBrOw0KPj4+PiAtICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBwdGVfdXBkYXRlX2xpbWl0Ow0KPj4+PiAgDQo+Pj4+ICAgICAgICAgICAgICAv
KiBTZWxlY3QgcmVsb2NhdGlvbiBhZGRyZXNzLiAqLw0KPj4+PiAgICAgICAgICAgICAgeGVuX3Bo
eXNfc3RhcnQgPSBlbmQgLSByZWxvY19zaXplOw0KPj4+PiBAQCAtMTIzOCwxNCArMTIzNyw2IEBA
IHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApDQo+
Pj4+ICAgICAgICAgICAgICBib290c3ltKHRyYW1wb2xpbmVfeGVuX3BoeXNfc3RhcnQpID0geGVu
X3BoeXNfc3RhcnQ7DQo+Pj4+ICANCj4+Pj4gICAgICAgICAgICAgIC8qDQo+Pj4+IC0gICAgICAg
ICAgICAgKiBObyBQVEVzIHBvaW50aW5nIGFib3ZlIHRoaXMgYWRkcmVzcyBhcmUgY2FuZGlkYXRl
cyBmb3IgcmVsb2NhdGlvbi4NCj4+Pj4gLSAgICAgICAgICAgICAqIER1ZSB0byBwb3NzaWJpbGl0
eSBvZiBwYXJ0aWFsIG92ZXJsYXAgb2YgdGhlIGVuZCBvZiBzb3VyY2UgaW1hZ2UNCj4+Pj4gLSAg
ICAgICAgICAgICAqIGFuZCB0aGUgYmVnaW5uaW5nIG9mIHJlZ2lvbiBmb3IgZGVzdGluYXRpb24g
aW1hZ2Ugc29tZSBQVEVzIG1heQ0KPj4+PiAtICAgICAgICAgICAgICogcG9pbnQgdG8gYWRkcmVz
c2VzIGluIHJhbmdlIFtlLCBlICsgWEVOX0lNR19PRkZTRVQpLg0KPj4+PiAtICAgICAgICAgICAg
ICovDQo+Pj4+IC0gICAgICAgICAgICBwdGVfdXBkYXRlX2xpbWl0ID0gUEZOX0RPV04oZSk7DQo+
Pj4gLi4uIGNvbnNpZGVyaW5nIHRoZSBjb21tZW50IGhlcmU6IElzbid0IGl0IDBkMzFkMTY4MDg2
OCAoIng4Ni9zZXR1cDogZG8NCj4+PiBub3QgcmVsb2NhdGUgWGVuIG92ZXIgY3VycmVudCBYZW4g
aW1hZ2UgcGxhY2VtZW50Iikgd2hlcmUgbmVlZCBmb3IgdGhpcw0KPj4+IGRpc2FwcGVhcmVkPyBB
ZmFpY3QgdGhlIG5vbi1vdmVybGFwIG9mIHNvdXJjZSBhbmQgZGVzdGluYXRpb24gaXMgdGhlDQo+
Pj4gY3J1Y2lhbCBmYWN0b3IgaGVyZSwgeWV0IHlvdXIgZGVzY3JpcHRpb24gZG9lc24ndCBtZW50
aW9uIHRoaXMgYXNwZWN0IGF0DQo+Pj4gYWxsLiBJJ2QgdGhlcmVmb3JlIGxpa2UgdG8gYXNrIGZv
ciBhbiBhZGp1c3RtZW50IHRoZXJlLg0KPj4gSSBkb24ndCBjb25zaWRlciB0aGF0IGNvbW1pdCBy
ZWxldmFudC4NCj4+DQo+PiBUaGVyZSBpcyBubyBjaXJjdW1zdGFuY2UgZXZlciB3aGVyZSB5b3Ug
Y2FuIHJlbG9jYXRlIFhlbiB3aXRoDQo+PiBhY3R1YWxseS1vdmVybGFwcGluZyByYW5nZXMsIGJl
Y2F1c2Ugb25lIHdheSBvciBhbm90aGVyLCB5b3UnZCBlbmQgdXANCj4+IGNvcHlpbmcgbm9uLXBh
Z2V0YWJsZSBkYXRhIG92ZXIgdGhlIGxpdmUgcGFnZXRhYmxlcy4NCj4gVGhhdCB3YXMgZnJhZ2ls
ZSwgeWVzLiBJIHRoaW5rIEkgKHZhZ3VlbHkhKSByZWNhbGwgYSBkaXNjdXNzaW9uIEkgaGFkDQo+
IHdpdGggS2VpciBhYm91dCB0aGlzLCB3aXRoIGhpbSBwb2ludGluZyBvdXQgdGhhdCB0aGUgbG9n
aWMgYnVpbGRzIHVwb24NCj4gYWxsIG5lY2Vzc2FyeSBtYXBwaW5ncyBiZWluZyBoZWxkIGluIHRo
ZSBUTEIuIElmIHlvdSBzdHJpY3RseSB0aGluaw0KPiB0aGF0J3Mgbm90IHdvcnRod2hpbGUgdG8g
Y29uc2lkZXIgb3IgbWVudGlvbiwgdGhlbiBzbyBiZSBpdC4NCg0KT2ssIEknbGwgdHdlYWsgdGhl
IGNvbW1pdCBtZXNzYWdlLsKgIEJ1dCBoYXZpbmcgY29tZSBiYWNrIHRvIHRoaXMgYWZ0ZXINCm1v
cmUgdGhhbiBhIHllYXIgYXdheSwgSSB0aGluayBpdCdzIHdvcnRoIHBvaW50aW5nIG91dCB0aGF0
IHRoZSBkZXRhaWxzDQppbiAwZDMxZDE2ODA4NjggZGVtb25zdHJhdGUgdGhhdCB0aGUgInBhcnRp
YWwgb3ZlcmxhcCIgbG9naWMgd2FzIGluZGVlZA0KYnVnZ3kuDQoNCkluIGEgVk0sIGEgdmNwdSBt
aWdyYXRpb24gYXQganVzdCB0aGUgd3JvbmcgbW9tZW50IHdpbGwgZW1wdHkgdGhlIFRMQg0KdW5k
ZXIgeW91ciBmZWV0LsKgIFNvIHdpbGwgYSB3aG9sZSBzbGV3IG9mIG1pY3JvLWFyY2hpdGVjdHVy
YWwNCmNvbmRpdGlvbnMsIG9yIGEgcG9vcmx5IHRpbWVkIFNNSS7CoA0KDQpXaGF0ZXZlciBwZW9w
bGUgaGF2ZSB0cmllZCB0byBjYWxsIGl0IGluIHRoZSBwYXN0LCBpdCB3YXMgYnJva2VuIHBsYWlu
DQphbmQgc2ltcGxlLg0KDQp+QW5kcmV3DQo=

