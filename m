Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDD5EDAC7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 12:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413261.656813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odUm0-0007Eg-MI; Wed, 28 Sep 2022 10:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413261.656813; Wed, 28 Sep 2022 10:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odUm0-0007B7-Iq; Wed, 28 Sep 2022 10:58:40 +0000
Received: by outflank-mailman (input) for mailman id 413261;
 Wed, 28 Sep 2022 10:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7GS=Z7=citrix.com=prvs=263c9347a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1odUlz-0007AL-46
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 10:58:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7faa0add-3f1c-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 12:58:37 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 06:58:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 10:58:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.027; Wed, 28 Sep 2022
 10:58:32 +0000
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
X-Inumbo-ID: 7faa0add-3f1c-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664362717;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=Xwtq2mYsbEtoYgqO+YuFXU95aetesuxDjlrp/uhJasY=;
  b=dg3jEmsAeP6s8rY+FrL0w3uquPQqpYIBRiZmICTNqYFnI3uy0mQW0uP8
   pdAMDXSPmG75SoXTGPQG9O+FsGU2UlvUPTZHYNwj0FHX0/vsEMtN7bMJg
   LaykFtppLsDHdIhFV1gFFd7MTaoYKrMUT8HI+lHjLumOWKK8oDvf8VPqw
   4=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 81945582
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZMzxbKJxcOhfiuTvFE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS1zBSy
 jROWjjUOq3ba2v8eNt3a9nio04A75PWydAySwZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4mNA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FY0z8+ZFPmxfz
 tgVb2k1Qy+Bt/+YxJvuH4GAhux7RCXqFKU2nyg4iBTmV7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q/T/PJti4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r8376TwH6rAur+EpWIqadBrUaOzFYXJwRIV2K0+teXoE6xDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY86jOqzq3YHARNTVbPXVCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlRdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:Z+5K/qz3t5U/a0PkDIrSKrPxgOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTgZUJPwC080hqQFmrX5Wo3SETUO2VHYZ72KiLGP/9SOIVybygcw78
 Zdmu1FeaTN5DtB/IrHCWuDYrEdKbC8mcjG69s2jU0dKz2CAJsQjDuRfzzrd3GeMzM2Z6bReq
 D92uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmfDHOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dY2xY4kuW3XRYzSTFcZcso65zXUISSaUmRIXee
 z30lQd1gJImjTsly+O0F3QMkLboUwTAjfZuCKlaD3Y0IPErXsBerV8bcgySGqk12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtVrQc/tQ0qbWIlUs4nkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbPfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2FfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJW+wdVRCCX4GJff+rKGjqCq9PllVdQ6du/129tx+pqD2QqbtPGmKVE0u+vHQ0MkiPg==
X-IronPort-AV: E=Sophos;i="5.93,351,1654574400"; 
   d="scan'208";a="81945582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSCYFi/SabRZCgvaGhbaAohRWX6DNAchW7axhk3Md/JbyLyh4rHexsfVLYWPuYmzEgZQI4IR+S1ExPle7A1VDv1T2O+Kv1wof0LA/JwVE/iRN2voosMEVL7/cPVGXQlSEhE1VF+E9KvqSenX4JXdmkAybhwd+7UNr2Be00ICZ7+QVs4dvexj5ZtmU4rSGBgqcITlY2DmAYbVuZXDTjTPqbyUxc/JwcdYgH1hLuzWXEeY3v1IAovTbgW5flzdg0asBU/5M1WXijVXuqne0Asp4Ew36GMpNwGlKQ/oqmr2grUkzH3IcJPmnXtpElE1CFZ8YMSLap4ZXTbpPwCYvHzamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xwtq2mYsbEtoYgqO+YuFXU95aetesuxDjlrp/uhJasY=;
 b=YHA61kNxXIGQrwT3GaRajRI1h9LoY/sYVE/FJDjCCl6DZ+HRE4iftiGagtqT7h+W0NYu9VCeGQrAZxyuUOoN8tolYVrXPZhwtUqxMzHFLSHRZmPL3jlvZelGASZvyv2hpLJYPeW5+wo4zQxd4KBzopU98c1+xfkX12PDagNGCw+oG58Y4YawCEwbvMDVEFT8kS8D0D53jfw4TxHD4ZHGhvi/WozW8i0jOm30eRRzMDe1u/GGNQYqmOttmfEvqhaBJOb+9O3DZTltAqkYcgP3TlD3M3F3rcat4oXD47UEZXXIOHnlupRQQNEhntfTiv/ciNdS5pooLOpOhPgGmB951Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xwtq2mYsbEtoYgqO+YuFXU95aetesuxDjlrp/uhJasY=;
 b=I682XE70CuiLMqY6QG6ZPeOOngC3V667jlcafwtTjA9UgxpmY+sVIcxXSZoW1kKnJ4PbZ6cft9ZIgKgg5J2Uag/UDgPPsAQO1Fjcw870LRN876Pyl1ot1hQKv7cTocV582TN6VURePoOZ2nAe7omdxmFZuyJL7cXztlB5HSZgMM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Proposal for physical address based hypercalls
Thread-Topic: Proposal for physical address based hypercalls
Thread-Index: AQHY0yaT5LEru00uSkuEONBLdSy8OK30rDEA
Date: Wed, 28 Sep 2022 10:58:32 +0000
Message-ID: <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
In-Reply-To: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5414:EE_
x-ms-office365-filtering-correlation-id: fda967f4-d351-4e28-53d6-08daa1406272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +bProapYPa5p+TIxeCKeDNYE4rqc+f9x2XRWmE39vqWv672WtWbsQOjrTdwcVKjN/TpPntJJObbMZrw5qBZ4DzTqZikXqTm1JLRQXupg7M3IPEOix1LUPe7AoI8fAFmi5/1nY5poQiouTy5mjOL43PHQAy5Rj4ErEYMN7cQW9icoc2rw8pJIGJCcMDP3e7SvSs7k6cAPYzmRna5dJT6MIgxNS+oxXF1PVg3eG4V8VEWu5eO+H2I0bz6fG9XpdyVvute92CdvK9cy3WIPMTGEqazse6X0cLIslO2EoH3k+dqkdeP1BgmfwmpaopafFOQe3Cpz0LVaTRLrggUaPkuIUDlhYTYt+v6cDn19/glxOpdEEpPQp+5UymU3hs8asFxQFvdePFQ+qkahDGXa4zT7XE/dtXWKcZ0ROO+ij2OBG1hNjUwnS9Z7TaFr5jGIPTv8yuQe0eL3g25+DTDXM4Q2i9OTs9qTZT471KrqQaPl+B1aBputhW8UVBlIXA61VVTyJKyuHDXqsS5V3/neQtM+4CeXKwid4ir8C9GrIiaiHYZvXuJKKwdsaooeyHW2u2mXaGF+FIxe0LIQr09tSiSkqhfHl/hOThAjoGZpR7B4hkQYQMhABXZ4mzRIpenZHTio9sLQg6qGZDAZ8Z5to8wheLx1bgjo0Hse3GTg4TT/udyd3JRaGYNJTUo7/tGLFzM3CqhJC7U50wvkLGXUI3oP+m+9Pd2Sk4oENBqesDPeoSMeiLbgWrTke/BF2AE7W9xOsEEfwwJinh5sBnCP23avgcpYbEqoBTQfRVuTY2bPoQK3nZPj3Rft7F1DN8bVqaFfo6ylMc2n2LVmjZKLQsRojw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(36756003)(53546011)(316002)(82960400001)(6506007)(26005)(110136005)(186003)(6512007)(2616005)(66476007)(31696002)(86362001)(8936002)(8676002)(122000001)(2906002)(41300700001)(38070700005)(83380400001)(71200400001)(64756008)(38100700002)(66446008)(91956017)(66946007)(76116006)(31686004)(66556008)(6486002)(478600001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2h0VXlsZE94TVdWbGlkdHhxbndPekd3YUdTS3hIV3U3cDlnNGkzeGlYRE1B?=
 =?utf-8?B?c05TMmhMQzI0U21ldDlQK2o3bU04TnNhQnRUTHI5WE9wckhhenRSQm05VTdw?=
 =?utf-8?B?aE1vYTVTQVVtbWROZ3RyOU1YTzI5WjFmWVlma1VDRDk2SEE2MDY4QmdkMjRP?=
 =?utf-8?B?RDV6UVluOHhJZ0JMVS9IUytuUU1lTHpJcEZ0ZnhWcUlTb3k2VWZlL2k3dksr?=
 =?utf-8?B?S3htenpncS9rNndITVdocEJKSnNhdTQzU1FzV09waXhndmFyRzh4QUtUVXlt?=
 =?utf-8?B?VUhYaUNteDFhOWZrTG9qTVJwakFwbHAvTDFpbUxzL3pVOHNvbjBONEV5V3Ex?=
 =?utf-8?B?dUp1RXdMWi90ZlJUb3paY01pck16SHFvT09KOUwraTliVW5HU2w3WnVuSGhr?=
 =?utf-8?B?ei9XV3NYRHd6UUE5SzV0SHBxRmJNcmJocDdlRDFEZWhmcDg2d2ZaTkhLMXp0?=
 =?utf-8?B?dGVTbHVaRE9iV01KSHVicHpOMmFYQXZGVHNHWEVCK0d2TFI4M2xLbkRxdUpL?=
 =?utf-8?B?aUlpQmEvRTBmUXo5c09FY1hic1U3MkVYMWZYcXFBTVl2YnNsVk9adUdMamt0?=
 =?utf-8?B?M3hwNDQwS3o4UUUzRzFNTEpVYTA2bkI4MGovZnRCcGthdGVaVVdpbFBQTnl5?=
 =?utf-8?B?RFJaakdsSnJ4YisxcXNiUG03eFNNY01KK1U0eHVuOFpRUlNOY1l5N0ViT2d2?=
 =?utf-8?B?Z3NjM0pUYWVibjZraU5FOGl0aHcrUWNZZnpqemdnSG0wY1dZWUZJREpGUFFU?=
 =?utf-8?B?Wjhhdklwd1lSS0VwcC9lUnRBMHlrQ0J5YmtScm1pLzZaeFZ4YlBwdWtWSU5a?=
 =?utf-8?B?S0xJQjRTZG9VS2dsRjRTOTY1QXc5SWdmMDYvYWNKMnhsNWFWMDZnbUNTbUtz?=
 =?utf-8?B?Zk9HREtLVXo3T3V2WXZ3M2p2Uzl2N1lIN3RNRmFQZUJDV1g4U1dUaXlNTVhV?=
 =?utf-8?B?YUdOMzNQUUVGQ3hxOUw3UkFPZnRPVE1vTGhPcSs2SlNITkhza3Fma1B5dWor?=
 =?utf-8?B?K0UyRGxmS3l5bWp2S3BtNkFNTWZvVzZqSU9OZTFDRUpMUXZrR1JTRGlLSDNz?=
 =?utf-8?B?a1FiTnhXZ3AzZmtuQ1hKQmN0VUlmS2ZyMlMydlFsczNwYlFuZWl1dU5PSHpD?=
 =?utf-8?B?alU4OEFWdldmOXRIKzJ2clU2TDNEZldsMzg3NEV1WklOblFydWdGZ0cxd0hn?=
 =?utf-8?B?bCtUQzlaN3FyVXhEUEpsZk9rdEFKdGt2azl4dU0rUFVoZVJ4clJJdVllYWJV?=
 =?utf-8?B?czBINUw0L0phZWtISHBUR0lkdXZQUnJSWkNOVkgraE5HSlF4cWRmZUo3UkJW?=
 =?utf-8?B?OXBRemNUMlZ6eDNHVjkyVTV1cm1mdDJmYXFGSmVQVzdTSEtNRkZ0a0RHRlJv?=
 =?utf-8?B?dzZmVUtzWlR3SHZVTmwrVFJ1WGI0MDBaTVNoeXQyRitDV0FIeFZQZzNJVWgv?=
 =?utf-8?B?Rk0wNFc4M1d1S01WUmQ2RE9jdndKK2JoQzQveUtEWWRRUDJobVVSVWp5MTg1?=
 =?utf-8?B?SjRjV2YzNGVpc05BZ2lFRU5oNGlzQnVSOFBLSEJRL0ZmdWNhb1Z1bmo1TElU?=
 =?utf-8?B?UG4vTHdrMDZpVjB3bm85KzloWlp0d1dqbVhYVWNxdFV6MnFWRVpzRWdTZUJW?=
 =?utf-8?B?T0xNLzZMdEhSY0NTbmJXNG91RlBobG1acXhIZkxFTTJPYUc3eElBakZPdk92?=
 =?utf-8?B?cXUzVUVRUXhqNmR0NmNPVDhYVWpnalRzQ01jM1ZabEp2dGMrTmVUNkZVYjB5?=
 =?utf-8?B?WHpPOWdYdzdnVEVGUGpoQUNndnJ1TWFNd3A3RWVwMngzby9QVDVBN3ZRMHFX?=
 =?utf-8?B?UTdoQ0cyZ0gyaXlTNWkzRndkMFF1cFpXN2h1Qm1zckVqazlNakV5MVAyTGxN?=
 =?utf-8?B?K09hb2d0MVowWWtMWk95cm5NdmtDZm42QlVvTTMwVVREcWUwR3lFQ00xNU1J?=
 =?utf-8?B?RlZBWlVkZnlUa2tGUkJJNDdwYU0wSjdOQ3J6RXpvK0RwYm85RmY1TWFtRHVr?=
 =?utf-8?B?V1JYRXZyNHllQ0E5cVd2Vk9mLzdLSmRFWDdVNnlqWkxrelBYdCswZmhiakJS?=
 =?utf-8?B?ejB5bnRObEg1RWYxQ3dyV2MxZXdKeFhmZWlhazZnRHBFZVpZV1FxemIyYXRX?=
 =?utf-8?Q?UJS1t7/AEwyHyhOFSlq73rjpm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A030B58F7333AE4F93813C870F84CEFF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda967f4-d351-4e28-53d6-08daa1406272
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 10:58:32.7516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DvR+N12RKbweTexAmnxJeerJ/xRXdwQv8tpDczNk4weDJ4n3jX+si/EJ0LwJubmMFe/n6Q+1x37lEMvlTZ2GOZm+56OCmNkhKSNDcnWFso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5414

T24gMjgvMDkvMjAyMiAxMTozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFzIGFuIGFsdGVybmF0
aXZlIEknZCBsaWtlIHRvIHByb3Bvc2UgdGhlIGludHJvZHVjdGlvbiBvZiBhIGJpdCAob3IgbXVs
dGlwbGUNCj4gb25lcywgc2VlIGJlbG93KSBhdWdtZW50aW5nIHRoZSBoeXBlcmNhbGwgbnVtYmVy
LCB0byBjb250cm9sIHRoZSBmbGF2b3Igb2YgdGhlDQo+IGJ1ZmZlcnMgdXNlZCBmb3IgZXZlcnkg
aW5kaXZpZHVhbCBoeXBlcmNhbGwuICBUaGlzIHdvdWxkIGxpa2VseSBpbnZvbHZlIHRoZQ0KPiBp
bnRyb2R1Y3Rpb24gb2YgYSBuZXcgaHlwZXJjYWxsIHBhZ2UgKG9yIG11bHRpcGxlIG9uZXMgaWYg
bW9yZSB0aGFuIG9uZSBiaXQgaXMNCj4gdG8gYmUgdXNlZCksIHRvIHJldGFpbiB0aGUgcHJlc2Vu
dCBhYnN0cmFjdGlvbiB3aGVyZSBpdCBpcyB0aGUgaHlwZXJ2aXNvciB3aGljaA0KPiBhY3R1YWxs
eSBmaWxscyB0aGVzZSBwYWdlcy4NCg0KVGhlcmUgYXJlIG90aGVyIGNvbmNlcm5zIHdoaWNoIG5l
ZWQgdG8gYmUgYWNjb3VudGVkIGZvci4NCg0KRW5jcnlwdGVkIFZNcyBjYW5ub3QgdXNlIGEgaHlw
ZXJjYWxsIHBhZ2U7IHRoZXkgZG9uJ3QgdHJ1c3QgdGhlDQpoeXBlcnZpc29yIGluIHRoZSBmaXJz
dCBwbGFjZSwgYW5kIHRoZSBoeXBlcmNhbGwgcGFnZSBpcyAoc3BlY2lmaWNhbGx5KQ0KY29kZSBp
bmplY3Rpb24uwqAgU28gdGhlIHNlbnNpYmxlIG5ldyBBQkkgY2Fubm90IGRlcGVuZCBvbiBhIGh5
cGVyY2FsbCB0YWJsZS4NCg0KQWxzbywgcmV3cml0aW5nIHRoZSBoeXBlcmNhbGwgcGFnZSBvbiBt
aWdyYXRlIHR1cm5zIG91dCBub3QgdG8gaGF2ZSBiZWVuDQp0aGUgbW9zdCBjbGV2ZXIgaWRlYSwg
YW5kIG9ubHkgd29ya3MgcmlnaHQgbm93IGJlY2F1c2UgdGhlIGluc3RydWN0aW9ucw0KYXJlIHRo
ZSBzYW1lIGxlbmd0aCBpbiB0aGUgdmFyaWF0aW9ucyBmb3IgZWFjaCBtb2RlLg0KDQpBbHNvIGNv
bnRpbnVhdGlvbnMgbmVlZCB0byBjaGFuZ2UgdG8gYXZvaWQgdXNlcnNwYWNlIGxpdmVuZXNzIHBy
b2JsZW1zLA0KYW5kIGV4aXN0aW5nIGh5cGVyY2FsbHMgdGhhdCB3ZSBkbyBoYXZlIG5lZWQgc3Bs
aXR0aW5nIGJldHdlZW4gdGhpbmdzDQp3aGljaCBhcmUgYWN0dWFsbHkgcHJpdmlsZWdlZCBvcGVy
YXRpb25zICh3aXRoaW4gdGhlIGd1ZXN0IGNvbnRleHQpIGFuZA0KdGhpbmdzIHdoaWNoIGFyZSBs
b2dpY2FsIGNvbnRyb2wgb3BlcmF0aW9ucywgc28gdGhlIGtlcm5lbCBjYW4gZXhwb3NlDQp0aGUg
bGF0dGVyIHRvIHVzZXJzcGFjZSB3aXRob3V0IHJldGFpbmluZyB0aGUgZ2FwaW5nIHJvb3QgaG9s
ZSB3aGljaCBpcw0KL2Rldi94ZW4vcHJpdmNtZCwgYW5kIGEgYmxvY2tlciB0byBkb2luZyBVRUZJ
IFNlY3VyZWJvb3QuDQoNClNvIHllcywgc3RhcnRpbmcgc29tZSBuZXcgY2xlYW4oZXIpIGludGVy
ZmFjZSBmcm9tIGh5cGVyY2FsbCA2NCBpcyB0aGUNCnBsYW4sIGJ1dCBpdCB2ZXJ5IG11Y2ggZG9l
cyBub3Qgd2FudCB0byBiZSBhIHNpbXBsZSBtaXJyb3Igb2YgdGhlDQpleGlzdGluZyAwLTYzIHdp
dGggYSBkaWZmZXJpbmcgY2FsbGluZyBjb252ZW50aW9uLg0KDQp+QW5kcmV3DQo=

