Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739A4351592
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104523.200005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy59-0002gh-AC; Thu, 01 Apr 2021 14:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104523.200005; Thu, 01 Apr 2021 14:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy59-0002gG-6Q; Thu, 01 Apr 2021 14:13:59 +0000
Received: by outflank-mailman (input) for mailman id 104523;
 Thu, 01 Apr 2021 14:13:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRy57-0002g3-96
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:13:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a16ad22-58cc-4f9e-ab27-ca9120ad9a3e;
 Thu, 01 Apr 2021 14:13:56 +0000 (UTC)
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
X-Inumbo-ID: 6a16ad22-58cc-4f9e-ab27-ca9120ad9a3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617286436;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cOZ/xI/emguW5oKlhPWLjfpXpQISZ5k4MxVTlymcgYc=;
  b=Lw2FM0rPiyuo1PLQZMsi5GdmfHJVn8TITFFNybNPHEGfNwCG+LSnI1ZW
   LwyMukDOUpfQPCvy5pk+33PdwrFNdZLQ4Q/cvhSwSUQg9S1ieRKLYvyj3
   XU6ImBiaCd1dhjNMi18Yw9Y9sca6YElyQdXxipnCKnJJWxZJolYbLyKas
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hedOiDKEWSy1774H3QXvtOwJ3AtPi3v9m9j4g3Aa4HTdwLVR3cbaiduS7KcI8KHcvho2iKw7SX
 /cQy3EMBIOZRZyG/oGlmRWjmOZDicKM4t/R+GUIv63ddRCgG9cC78ntj3EkSTSHpyfc7Y5wXvg
 3WNdjCXhagvdh0cWaJ0wdr2yOuVek3jGv3qIADTb9gtUrEuC0tIMjkz2hxcP80CD/VxEFhvfjT
 Y5wY29BgFrza/TXhdX8c+PPqDExVHlllUg6kctlCG8iq/42wcUHL6ynHlOtGLOcuvw0CFUsvMx
 TXU=
X-SBRS: 5.2
X-MesageID: 40685686
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tIatg6vs00lmrAMUoe0kr8897skCC4cji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyAOzH888hPyO9661jenTpk0dMT1CQYsI1XYcNi+wFEpqSA5aQboVfa
 Dsp/ZvjTymZHgRc4CfDn4KQ+DMq7Tw5e3bSDQBAAMq7xTLsCih76T0HwPd8hAVVT5OxrlKyx
 mEryXS4KK/v/anjiLNzmO71eUZpPLN6PtmQPaNhM8cNyn2hm+TBbhJdrWesFkO0ZmSwXkwlt
 2kmWZDA+1S7DfrcnixsV/R3WDboUsTwlvD7XPdvnf5u8z+Q1sBeol8rKZUaAHQ5UZlnPwU6t
 Mx40uju5BaDQzNkU3GjrCiPXwL5ymJiEEvnuIJg3tUXZF2Us4qkaUl8F5IC5BFJSrm6ekcYb
 RTJfvB7/Vbe07yVQG/gkBTwcehVnl2PhCKTllqgL3t7xFqnWt0x0Zd+coHnn1ozuNad7B44Y
 3/Q8FVvYALavVTQbN2Be8HT8fyIHfKWwjwPGWbJkmiPL0bOlrWwqSHookd1aWPQtgl3ZEykJ
 POXBdzrmgpYX/jDsWIwdli7g3NemOgRj7go/suoqRRi/nZfv7GICeDQFchn4+LuPMEGPDWXP
 61JdZwD+L8K3DtXaJExRf3VZUXCXR2arxQhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRn
 QZWjz+I9hB81CrVnf0jAO5YQKqRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbT1O25ZGJX
 dWEffCqOeWtGO29WHH4yFCIRxGFHtY573mTjdPrQ8OOEXkbKYbt7ykCDhv9UrCAiU6Y9LdEQ
 ZZqVgy07mwNYasyScrDM/iNHmbgXsVrHeDVIwdhaWH+MfgdvoDf9EbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgkIYZH/jFd953gB6iJMldrX63jzTGmegfAl8gGxK+W8+ehggjAwdOjl
 pq6qkFnf6rgjC0M1Yyh+w+LXxBYGmaG6h9EQyAfYlY84qbIj1YfCOvv3i6gwt2Unf2/08S71
 aRUxG8SLXuOB5hnVx2lozt60h5c22BeVkYUAEKjaRNUULcunhy1ueXYLGUyGX5UCpf/sgULC
 zFbTwOIgln2tCw01qPlCyfEGg9r69eTdD1HfAtdare1WiqL5DNnaYaH+VM9JIgL9z2tPQXON
 jvNzO9PXf9A+Mt1xf9nAdUBABk7H0lm+jvwhvr8Syx22M+G+PbJD1dNvsmCsDZ62jvXPCT1p
 plydozoOurK230LtqL07veYTIGKhTdpweNPqwVgIERuaI5r71oGZbHFTPOyXFcxR07aN7ui1
 l2etUz3JnRfot0O8ACcSNQ+VQk0NyJMUswqwTzRuszZ0skgXPXN86AioC45oYHEwmEvk/9KF
 Of+ypS87PeUyyP2aUTBqgwLW5VAXJMo0hK7aeHbcndGQ+qf+ZM8B6mKXe7aqZaU7XAFrMKrB
 p2iuv46dO/Zm79wkTXsjR6KK4VrDriTsO2HQ6WGelHt9a9Ik+Bh6O24Mi1yDf7IAHLH3gwlM
 lAbwgXaM8GlzwpyIsw2SK2Qrbsok0kn0BFiAsX3mLFy8yj+iPDAUpCMQfFmZ1YUjlYL2iQga
 3+gJ2l/WW45CIAxILKG0hRdMxfAtQcToD4KCF1NMgb1YTYiJYHk2BEexchD2k1lTD70adnxN
 6CqYfvZ9E=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40685686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pab5V570b3uVVy8Xwyh+s3KstQBUM2HEM4mcBBjI9ZqtDSI3NgBiIA9eGO7nTW2IkAaSRhGURIONmn1Z23Zg0CuNAX/qtGUfri8sN9sn2xFBD3ADBC1SeASaGGnyw+W1VAL+Mz0YpqxPoMExPGTvmBEWooV5seP2PaPeXreWFRf7FUIjE1o5qXYvuTlFaVnTpehPX09riYnFZDqPdvIOLDfsSCivTP28C//bshMsx2NU+x3hgnJ9VUWLpCe+vI87mqZW+xra3+cVAeFrcujtoa4bF8iLPstjBy7cE+153WMZuj6RnxgzK5YjICPbKI7vEWiNGEz22BZh95d7w+id1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOZ/xI/emguW5oKlhPWLjfpXpQISZ5k4MxVTlymcgYc=;
 b=Wk4KbsAzDUhSa+hn9VC/USL3Bqjtjacbn6wsUsxXWeHucLX81c8YTDhz65pQ1ZoOSd+6zP9621qQ59RPhlv4voYpATfLXrWTEx8OrUuw8UiNdQu0nQRG8GczIjC8kSscKJ4VaYeQtQ+ToEFcYx2fWS76cOs9lD5mC35rDFVayXQoArJ+RKZ37YB81mEpoZpJqajYbqm7HVmAIhWwkV1DKoNyiUw0oQZ4FUw30ZcHLCV2pmc65ljWXf1P92tLwzJgk56DHNroMhRswOjS+xhOR2b4MdPetj2HOKZmMrHy1z1hlmZ5C07bPlZ2a9CWn3R7oxOesYzKvl0QDwctHpwehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOZ/xI/emguW5oKlhPWLjfpXpQISZ5k4MxVTlymcgYc=;
 b=CxbUi0yilRfoRa9bz3nyj3bOOZYsxxAu8L9zlSBhVrJyrzKl5vDhQSJ/unXskFkBWSylVrLdTf+oclYwBxV740Ttn0EB3YT0Elj/5YrCtuUO6tWaTbsMs0tBtA16jnHIeY7ZKcpCFW40tWqAibImqmP95oEicEgFyLokdMEOrgo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson
	<Ian.Jackson@citrix.com>
Subject: Re: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly
 xenstore
Thread-Topic: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly
 xenstore
Thread-Index: AQHXJvxUtSxo6M4mo0iX7TVVNapv+6qfsM2AgAADtYA=
Date: Thu, 1 Apr 2021 14:13:52 +0000
Message-ID: <07553207-90AA-4AD4-A5C2-C8F36411DDCB@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-6-george.dunlap@citrix.com>
 <97d317fb-16d7-a14e-e74e-62fa83159838@citrix.com>
In-Reply-To: <97d317fb-16d7-a14e-e74e-62fa83159838@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45068017-cc19-4586-4270-08d8f51860bb
x-ms-traffictypediagnostic: PH0PR03MB5832:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB583223D59B9EBB9ABE6D0925997B9@PH0PR03MB5832.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N9YaA++I14yxmpydoj15OG2o7wnXZiO4amTjwTVhvIazTlzqXHzbF9s0y9ejZ/oc4Hf2lzxdcaBe5bBaJKpHu/k4oxlhq20T5lpoWh7UoP/GL7Scb4l7Yxg6kAtqMNuYus7m4bPNW7bzMhANRWVEebvzvkM/La16YDePL692DcQH0iQd/5QcL1uBbMV7Q26Bl75AXXcOY7xxR62yqj+V78qVgfANAGojDBlfWGCYvANWUe3WQmAbz/ehJmEHJi4GEb5MLW9zcQCdhUkGES4Uk1EuEDOJwYr7SY8HQGhqTebKOp9SP+xNVHCtdpfLAd6C+aVaVsXUSbJ8vAsriP6byam3Zvw75Dib0Mr5K6nhZM+DNKKrrk/c4WKAeR2P/9uR8f4gYWaOOOaQGQyNZcvkDyAJzZ9gbzVkABBHeYHhRNktPgwtN/ay0FmYOQKQQkNtS79RBE7cp/mZHKh4mfCBIlFaHK6YSSyQ2qhXKUYDWcSPjWymsjFSXN1iceGYJ4UZVZ5X5XV8vDed88cHZDtOodktrBit8uZ/ZaTF+sCPZChwhxYP8J8qMN7nyZjOfNbTqT4KqKsqH3SXRW8CY4fzhBwGanzAT4IiCDTHhmg1FWKHbvz4pSdX9pf7X+aGB9+J3Om4Cq0rMa3xkm6beak6pO9/9CGGwQiJv4EohVgNaw3rK7ElhnzEi/jSSFtBTAfVDaQ23E/T8yqC2PDeyIqfgFuKwkM19dt+hPLtO8JZ+BcsUkvqqIwwiGHnkM+49NdICYbKt5Wi6VrC/vWspzpAtlw2YIBqmyxs6WpVIVSDYv26Lgn9tM/sse5v/jyKcSzP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(66476007)(6862004)(26005)(316002)(5660300002)(71200400001)(86362001)(6636002)(38100700001)(2906002)(8676002)(4326008)(6512007)(6486002)(37006003)(83380400001)(107886003)(76116006)(91956017)(8936002)(66946007)(66556008)(66446008)(64756008)(54906003)(33656002)(2616005)(186003)(478600001)(6506007)(53546011)(36756003)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TThzV0wrdm11dnZRK3EvOWpoT1dITThmMEhwdmpLUUUxVUx0L3BYNkx2NFBJ?=
 =?utf-8?B?RHRVZ3RwQzBWeE5ObHUyU3RpSWh2bks4aGZnN2NWMm81SVAvL1ZHTkU0eCtW?=
 =?utf-8?B?ZjllY0F5MXpLYnRCZmVVa2JybHEyOTA0Z0JvcXFSYklqTG1LYTU0Wmo1UzR6?=
 =?utf-8?B?dU5OMHhnc0ZXSm56c3dmeWsrdEE5Q2ZCd1hBUk01d1lwRDRienVUMHVVZ2Y4?=
 =?utf-8?B?SGIwUEVQR2JLVXB4ZWVPeDNIQ2h2WlNIUG9lVC91Qk1naE45c21vcTh0N0lQ?=
 =?utf-8?B?alBkelQ1ZWFSamdpU0h4a1IxbDR4eXJXYjVuTTl0L0xqQWZFVlp4bEI5V3RM?=
 =?utf-8?B?cU0yeW1OMXlYWDlSdXdSR0Nna29vM1p3YUFjekQ1c1p2RmNqZjNHd3pmYXV2?=
 =?utf-8?B?LzMrY2ZjZEtPenRrRU9DVExlQlVJWnAvY20vZWZHQ2Qzb1BGcWJ3akk1VmFC?=
 =?utf-8?B?MFRhKytUODFudzFHdHN6bGpxNFREKzRxUUQ0dmhLVU1rcm1IOHlDNFdGeGZ3?=
 =?utf-8?B?dHNqb0ZrckVkUDlDTlZCNjVYYzd3Tkp5ZUFlQkdNQXVVK094RGZKeE5zaGk0?=
 =?utf-8?B?L3ozeXRMeU9YV2hqMkdCWDJZSkY3cnJIZUpma2ZvSURnTURhMXFJelMwZzI4?=
 =?utf-8?B?TGpvTWdid0ZVUTR2ZCtwYUNMVFhhNFBXaExkVDR5T0ExV2paTGppM0QzOG40?=
 =?utf-8?B?QVBMb0c3cHBCK2ZXc1VVWDJnTk51SitXc2EyU1VEY0dEMDN2b2o3TVZSM2xT?=
 =?utf-8?B?ZEhOQ0RmZjgrZzgzRWVCZ0pMOGkxK1c5R3JYdFpOS1ZQa0lGSTRvVXB2Ujhj?=
 =?utf-8?B?YXI1VGtKWWhReGNCZjhkZzhGcEJVUUNOSkR3djRFN2tUT0pSMkM1Y3Z3b0NW?=
 =?utf-8?B?ZDdSK2Q2QTVSdlRlbjZXOU9qWk5lSFdXWjhDdzdkcUlISERuMnQ3NlcxUnlQ?=
 =?utf-8?B?VnliMG1uTlo1eWx3TXlNelBteDlQNGN1MnRRcHJqNkFCZmxtYnlFazRlL2xH?=
 =?utf-8?B?aWRDRUpZY0x4TEFUMWxJMjdNNUhVcVhtZ2JWK3pucEp3dGJ2M1pZM3AvdzBH?=
 =?utf-8?B?dXQybFpVSVR3UTRxS0VEeG55UUhQNktrSU51dy9VWHZoYTVOTXdaSUw0OWE4?=
 =?utf-8?B?Tk0zSHdMUERFV0NkTlFkcC9jU3VQdVRKRnphd1FETFpabURxbEhqVlZaUVRk?=
 =?utf-8?B?eEdmVVJhSkc1NlMxVTR4d1podENUZ1ZobFF4NUl6bU1oSFloaWlmRHNRMCsx?=
 =?utf-8?B?d0JyUUpReDk5WmpWSHNYTlZ1VkxRRkJXbEtmM1BSTjEyZ0VhUy9QOGw2dlZ4?=
 =?utf-8?B?RG1vOThMcXhJTVVVYnR4dGhRYmdTUjREejAvRXFadVBMQmZ4b2lHRlBlMTl2?=
 =?utf-8?B?dG5IdDRrMnQ4S3RjZFhaS3ZGdTRvRjM5eEQzZnZ4VU5lY00wcmZmcVF1NWRr?=
 =?utf-8?B?aHM2eVNLVDJkV2tCM0RncHZCcXZvOVlIUzJ1SkdwL1Z6VHg2OHZVS0N0RFNG?=
 =?utf-8?B?Q1BuYWJnUHpjM1pSc0J0eVl3VDhTTmVaRmZ6YlFGSHU0L0xrZzRuQWtaVC9R?=
 =?utf-8?B?OEcrYnM2R0VjRGM0Q1ZCUUxDNllXSnhJOU01ZmxYSVQ2bVNsOE9WVHNMMFNX?=
 =?utf-8?B?b3NrVUJaS0Q5WlV3cGhWZk14d21lT2xNbWN6ZXowZjFEc1YzQk1YOW9FblN6?=
 =?utf-8?B?RDJNNVV4dzV3YkZFZElOSlFNZUo0MVlpeVBNTVR2YnZCREdKUjVScmlLSU5O?=
 =?utf-8?B?cXhFSE00OHA3MXFxc1hMMHhuU3FQQWxsU0xpendxWlBvRmQ4UkxLVzdEVTBW?=
 =?utf-8?B?Wml1UDA0cDYvWjU2TitkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E83E753CBD717C44AF2138D2BC2F523E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45068017-cc19-4586-4270-08d8f51860bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 14:13:52.2376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQUKlA+p0H/rbpN+8gAO2XkPzKlUTLCzHvdIn2kszGCgSvx1ZiuaIgYfQGyX/hTjG6iF6vy0Wiz5QPG8ORgDH6ZD276nH5QEJLzTAYQyo0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5832
X-OriginatorOrg: citrix.com

DQoNCj4gT24gQXByIDEsIDIwMjEsIGF0IDM6MDAgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDEvMDQvMjAyMSAxNDozOCwgR2Vv
cmdlIER1bmxhcCB3cm90ZToNCj4+IC4uLmdyb3VwZWQgYnkgc3VibWl0dGVycyAvIG1haW50YWlu
ZXJzDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiBDQzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENIQU5HRUxPRy5tZCB8
IDMgKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYg
LS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFOR0VMT0cubWQNCj4+IGluZGV4IDJmMjZjZDVjODcu
LjljMjcyYTAxMTMgMTAwNjQ0DQo+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+ICsrKyBiL0NIQU5H
RUxPRy5tZA0KPj4gQEAgLTI4LDggKzI4LDExIEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tl
ZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+
ICAtIEZhY3RvcmVkIG91dCBIVk0tc3BlY2lmaWMgc2hhZG93IGNvZGUsIGltcHJvdmluZyBjb2Rl
IGNsYXJpdHkgYW5kIHJlZHVjaW5nIHRoZSBzaXplIG9mIFBWLW9ubHkgaHlwZXJ2aXNvciBidWls
ZHMNCj4+ICAtIEFkZGVkIFhFTl9TQ1JJUFRfRElSIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRvIHNw
ZWNpZnkgbG9jYXRpb24gZm9yIFhlbiBzY3JpcHRzLCByYXRoZXIgdGhhbiBoYXJkLWNvZGluZyAv
ZXRjL3hlbi9zY3JpcHRzDQo+PiAgLSB4ZW5uZXQ6IERvY3VtZW50ZWQgYSB3YXkgZm9yIHRoZSBi
YWNrZW5kIChvciB0b29sc3RhY2spIHRvIHNwZWNpZnkgTVRVIHRvIHRoZSBmcm9udGVuZA0KPj4g
KyAtIEZpeCBwZXJtaXNzaW9ucyBmb3Igd2F0Y2hlcyBvbiBAaW50cm9kdWNlRG9tYWluIGFuZCBA
cmVsZWFzZURvbWFpbjogQnkgZGVmYXVsdCwgb25seSBwcml2aWxlZ2VkIGRvbWFpbnMgY2FuIHNl
dCB3YXRjaGVzOyBidXQgc3BlY2lmaWMgZG9tYWlucyBjYW4gYmUgZ2l2ZW4gcGVybWlzc2lvbiBp
biBvcmRlciB0byBhbGxvdyBkaXNhZ2dyZWdhdGlvbi4NCj4gDQo+IFRoaXMgaXMgWFNBLTExNSwg
YW5kIGlzbid0IHNvbWV0aGluZyBuZXcgaW4gNC4xNSB2cyA0LjE0LiAgKEkgdGhpbms/KQ0KDQpY
U0EtMTE1IHdlbnQgcHVibGljIGR1cmluZyB0aGUgNC4xNSBkZXZlbG9wbWVudCB3aW5kb3cuDQoN
ClNvIG9uIHRoZSBvbmUgaGFuZCwgaXTigJlzIGNlcnRhaW5seSBlZmZvcnQgdGhhdCBoYXBwZW5l
ZCBkdXJpbmcgdGhlIHdpbmRvdywgd2hpY2ggaXQgd291bGQgYmUgZ29vZCB0byBoaWdobGlnaHQu
ICAgT24gdGhlIG90aGVyIGhhbmQsIGl0IHdhcyBiYWNrcG9ydGVkIHRvIGFsbCBzZWN1cml0eSBz
dXBwb3J0ZWQgdHJlZXMgKD8pLCBzbyBpdOKAmXMgbm90IHNvbWV0aGluZyB5b3UgbmVlZCB0byB1
cGRhdGUgdG8gNC4xNSB0byBnZXQuDQoNCkhvbmVzdGx5IG5vdCBzdXJlIHRoZSBiZXN0IHRoaW5n
IHRvIHN1Z2dlc3QgaGVyZS4NCg0KPiANCj4+ICsgLSB4ZW5zdG9yZSBjYW4gbm93IGJlIGxpdmUt
dXBkYXRlZCBvbiBhIHJ1bm5pbmcgc3lzdGVtLg0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSB2ZXJ5
IGNsZWFyIHRoYXQgaXQgaXMgdGVjaCBwcmV2aWV3LiAgSXQgZG9lcyBub3QNCj4gY3VycmVudGx5
IHdvcmsgY2xlYW5seSBpZiBhIG1hbGljaW91cyBWTSBkZWxpYmVyYXRlbHkgaG9sZHMgYQ0KPiB0
cmFuc2FjdGlvbiBvcGVuLg0KDQpPSywgSeKAmWxsIGFkZCAodGVjaCBwcmV2aWV3KSBhdCB0aGUg
ZW5kLg0KDQpUaGFua3MsDQogLUdlb3JnZQ==

