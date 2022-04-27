Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11E5114CB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314805.533036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njekD-0003ar-7s; Wed, 27 Apr 2022 10:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314805.533036; Wed, 27 Apr 2022 10:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njekD-0003Yl-4b; Wed, 27 Apr 2022 10:18:01 +0000
Received: by outflank-mailman (input) for mailman id 314805;
 Wed, 27 Apr 2022 10:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njekA-0003YK-VZ
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:17:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d2e7f20-c613-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:17:56 +0200 (CEST)
Received: from mail-mw2nam08lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:17:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN6PR03MB4399.namprd03.prod.outlook.com (2603:10b6:805:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 10:17:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:17:50 +0000
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
X-Inumbo-ID: 4d2e7f20-c613-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651054676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=64WkSlMfxmMClRJnN3KRM3zv1EcSh3KQ22VB0ss8hyY=;
  b=UP3t8uSHK1sdiJJDYfaRy/MtdcCazLt/7kSM3ynRI7+d9bx6tna612Km
   WC2c0u/lZSVUNpMUOthX5WKveThdnecOLRUgTwwajqhUJVwsMxskDZ2VQ
   QEmwaHgL/ZLHJk//Z6BTZ1XehbtoOahA9aqImOQvQKcd3eQkSyZJ/ouJW
   E=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 70048556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PQGFWqKbxipoRd2sFE+R1JQlxSXFcZb7ZxGr2PjKsXjdYENS0jcOy
 zNNX2DTOvjbYGOjc9lxbIyypkhUuZDRzt9qGgtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ22YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ilqt8KLFwg0BPXjotUkfCBnLzshHqITrdcrIVDn2SCS52vvViOwhtBRVgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsuFGvqSjTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUH8ArJ9fdqvQA/yiQv8/vcLsX3PeCsTMNPlUuUh
 HPqokDAV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdx61vn+C+AIdUtx4Eusm5QXLwa3Rizt1HUABRz9FLdk57sk/QGR60
 kfTxoyxQztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjQxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:LuEZpKzLis7RLViPFhP5KrPxc+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMYs1MSZLXPbUQyTXc9fBOrZsnHd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadg/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZcbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESvtu/oXvUlZ1SxhkFznAid0idtrD
 AKmWZ4Ay1H0QKUQohym2q05+Cv6kd015ao8y7kvZKqm72EeNt9MbsAuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGrf2x4Uh37D30XklWavoJhiKoLzP0d
 Meef309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy83BreDQQFy+oXgV4ridiuRaBNHHUP
 CuP58TC+P/LALVaPJ04zE=
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="70048556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcQURrpCnRL3BEgoif38/oEjcKzKjG4qlJpMIzp1ll51h6sWt4J4g7jdF9uaDk9GavZ/qZJyBPnGpM+FSAHTFOWJprsb3bQIpkwX3svtZBE2HFqO6gZwXC6t+ueUfzlFyamd1bwLdyznLetghxdnW/vSUPX8fVxX71PAy4DPVMSR7vN+dm+Y+D1q3CvacFnFpCnkObcCrastirIXWK33u8l3ULX52nh7g+KpeiIc04506SG11w2fseWT/6PI6C4oAdKujqlklGnkebh36RfZLQ7DjAR0QNes1sfo3iBDp4PVZa5HDEqjPhxQtcKAwxy1TBXeQ62l7b0QwwL5EZO2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64WkSlMfxmMClRJnN3KRM3zv1EcSh3KQ22VB0ss8hyY=;
 b=cFqchBBi10wW3s+BmgJg3KtOW0siJXHiKQUHc45NSIpsatFXG9hQEqVG54FTmCL42y9bOAnKeYuEQIu0QObC8TNO/QiZ1YrDqEK4dEhFwxaaPC4Z1RfKRy/dodevTLinGBS57gGFNqxQqpMS2QzHWZJr2dYREwneGVDmb3VLl6ov5BsgKAfyhoOKR3nR8tuR280AbR6qGZp8G+qEDLpWQf8FHssQzQvC91MkG6JxPECe8EIu15AjTaIRQV8stBsap2CbtGA+OQaC3jaRWseEIADRn4RKxhz7HgDzA1b4TUJ5+LQ/mGMbfDYl8ivOkur8rWsTWr7hoplx2rY/dCHNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64WkSlMfxmMClRJnN3KRM3zv1EcSh3KQ22VB0ss8hyY=;
 b=RTF9P4vgn9hDiFnhWqjUw4JAF8Gp7nlpDxcRmVtHSuq+TpICksNLuK1qUwY8YhiF2cK9ak9Sj10rEljl4Hmu2lxlqkWESvacfy5qIupDiQZgEaZgeQwa0pATHaYkrGJOSb8iOLUqHJq1Ydma/z6XfmCsq4exH3nR/zhJ/ZOH7wg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>, Edwin Torok
	<edvin.torok@citrix.com>
Subject: Re: RMRRs and Phantom Functions
Thread-Topic: RMRRs and Phantom Functions
Thread-Index: AQHYWZZDIrEkmq9fL0+3qLNT2+7QyK0DZ3OAgAAld4A=
Date: Wed, 27 Apr 2022 10:17:49 +0000
Message-ID: <c3c83d6d-dc84-bd81-4087-1eece1acb18a@citrix.com>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
 <Ymj435hWOcY9BK36@Air-de-Roger>
In-Reply-To: <Ymj435hWOcY9BK36@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 932ee59e-f330-4e67-284e-08da28372ebc
x-ms-traffictypediagnostic: SN6PR03MB4399:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <SN6PR03MB4399082CAE650EE5D82C4147BAFA9@SN6PR03MB4399.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2RbXbkY3aX3Hh3SuB1rmEztlTuJDG4HjkCqWM46ZN+qENX2hHZI9TREqEvFZ0OgxpPlhdLx5+GCesaKfxe5pmiUmIJZZiBLiLfqQgoHwE43iP95n3vveZnUOKWSEy+BFRKsknlwBKqajsSWZbcOPWuEiQUozbovLDUW5wnH5P1dNNsZFmz5JW68IndZ0ahdRPC3AgFOFzrRn6kC8MwYI5BbiNEViTjxoVftJeK+6w2RfIXGoLIMOAWu3/kDamJIZHjnaPtEFzJwjB10Pc6bYpTYTd20Uul8sBygCeLForOtiWSune6zzAyw2aIw+b8b2dlK3O+4CNNlWis82xgAHmzsMfWxt2SvNWQbQ7UMEkfwRljCi6QXx8KfMGu86bjGV4V9tbK6sTS6FYDc4lbplkZJ+jvDuLIDFmynmpbVVELAd+a4umfr++48Ef3rqDz886NumEChwp2Xt927L5xPGImOPRXYZXqLYD9URTNvdxCNMLJDB4RP38Z9yFHIAEHFVwXF+NNMfO14jLr9CynW3SQQVpM/phJgs5kWflt1A5qlWk1srnfQrZixmvyg0NUbEcLjFwt5yAV34nS68z0EMuN1aB4olNxqebb6dbuFwmVarJ2p8YmSPmT4k9kJgQkftqIEV6inHoUuCbFbqvxa6bEfcUTm/0XD+xMVaUFdH3pgPMQ6hkrI8lqYDChf0aw3YmqEqyBtHk5j+7eHJ+c/6JwqZW/PZckv0W9F/i8y4+aRkALmu7RHTuZU4M56XxUfxWjBF4zZiGhdeQXFPFQrvoQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(37006003)(6486002)(54906003)(122000001)(76116006)(86362001)(6862004)(2616005)(508600001)(71200400001)(8936002)(2906002)(107886003)(31686004)(83380400001)(82960400001)(91956017)(66946007)(4326008)(5660300002)(3480700007)(8676002)(186003)(64756008)(66556008)(66476007)(66446008)(26005)(6512007)(6636002)(6506007)(316002)(53546011)(38100700002)(31696002)(38070700005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a09kZ0Z0YmZjTUgySm83ODN5eklzK2ZxVFErZ1I3anJnaW50elkvcXpCYWQ5?=
 =?utf-8?B?NFo1R0Q2N1JmRGdYcWtOSmY3Rk8zdG5wUHBJNHVhMXpzVVJGOWc4blRCZVA2?=
 =?utf-8?B?NVlRL0lFM0JHdEJqMld5OTJRUzdVazNjVEhYY1haYlUvOVBEdDhNZFRaa2ZT?=
 =?utf-8?B?YTJGaFpWQnpWTTV3ZzRVZjVrNGZESlRiS25KbHA2dVFOVHRsamNaeWo4Nk1w?=
 =?utf-8?B?QVpMdjd3LzhEN3h1Ync5LzZOdTJ3Z29zcituTmlsRlNydXc3NFNuYm9RK0U5?=
 =?utf-8?B?WUZzSlhVTHFwSlFDTysvRTV5b2F6RnlqYkhuOUthSVlBZHg2VEMxbEdMcCtY?=
 =?utf-8?B?bEhrdVpvdjhTdmFIbEFRSW1Hbm05d0RDQWNTVGpBcVRwNjJvZFhFRlNOd2U2?=
 =?utf-8?B?Z0lxamdDTDNDOE03YXZtalJnRGpYTDJYQVJvT0kwVTRjbzI5UHFRV3k0dkk3?=
 =?utf-8?B?M1ZYdkVMN1VnWkRUMDFBWStzL3NjSXlPMEx0Qno3VlJoQ1NNUVV4UktTRVpy?=
 =?utf-8?B?VjdaV3NDaEdyLzM2RW12azhRdVd4RVJkREdvOUE5eldsVlVWSFFlTEtaU1Zt?=
 =?utf-8?B?WURVSzBJbHdpZlZYVy8wd2FRZ05aT0FnazlENDZFK041MlZQS3B1cjJzMHRK?=
 =?utf-8?B?b3ZoNkFzRzk2SDBFVkNtZTJJeWcxSFpzZEVlTk4yT3hLbE1mcXJITE5hMERK?=
 =?utf-8?B?MmdMY0JJdCtad3B3YVQvTW5YQTVRR1E3SFJaNUd3TW5Wb2tJdk96Vkt0eHhy?=
 =?utf-8?B?cFh5VUtxQkI0STVXdVlNeUdFZEo5Sm96MWNQNVA2eHV4NTVZMzF1aTdXd0NF?=
 =?utf-8?B?YUJZeFVHbVh0aWpIaUVCRjJ4U0RFLzNhVzRENlVhUU5nQVVIY2IvTDhnNXQ5?=
 =?utf-8?B?WXE0eXRMdEFwM3lLeno2NFk4TXRCdkgyQzZZbmNmZFJyUDdlQWNhMWY1bGdq?=
 =?utf-8?B?YjZvenBvSUV6bmllV1VCejBCQ1RVQVFWdExWUXhndWdFY05zeHdZVVZlYlkw?=
 =?utf-8?B?ZnJ1YXNTQVJFU1luVERjaHE0U0NCZlZhTVQ3dEJiNDA1U0VWTVNzY1Z4cDF6?=
 =?utf-8?B?bnU5U2g0L3dEcldKeHgwWVQ3QWludExmMDhzbkoyclArNlA5K2xtWXBqMmxv?=
 =?utf-8?B?SVYrN1gwa3dndi9nMFZVWTJiQmVaVzNiZ2ZzZ1J3N2tTbnRqMDBZMGVsT0xP?=
 =?utf-8?B?NHlYYXMyQzB5OVdxSkZYcS9lSDlmVm1VQW1FZGowdkliaWVwcUJ2TS9PbkJQ?=
 =?utf-8?B?WEJ2enhtRFFrOWFZeDdiUVk2WEErZk5pWXZuTGZEZUZIYlJtV3I2VTQ2MmZl?=
 =?utf-8?B?bVEya0N4a1E1WlI4aEdkejh1Qzg4MlNOTjMyRlZra20xTVROdWVZK3RmRFJL?=
 =?utf-8?B?UkRVd292cTh3bUxFajZJVk4rejRSVUdZRVE4NHdldSthN2ppK2ZsV2V5anlU?=
 =?utf-8?B?Z2RnKzdReUVhVm1yVENMeUxyOVdlMkVwN3F3VXNqOFVPZkRqdFh0NFlzR1l4?=
 =?utf-8?B?cUF3WmU3RVNZNWo3SE55K2xkYmFKNG5RanR0YVJITEkvWmwrNzg4MHJZOGxi?=
 =?utf-8?B?a1Fpb2NXMjNTNDZEWTNQRlB2UnEyN3FjcTc2NHZMY1hNY1dEeUpaUVJGVlZ2?=
 =?utf-8?B?ZkhrT3Y1MFVINEJmaUt3L2prbVI2bE0rM3NOc1pRbGdhNzFKOFNxOGFlaTc3?=
 =?utf-8?B?Qm1MTUkxdk54TzA0UVgzUUoxVHJ6VElJR0d3T1dJbDhwaW9nelVKL0Q2TDFk?=
 =?utf-8?B?Y3pSZ0RReXRrNDQzT3hOUGVBaDZOMzV5d3ZvZTdyNkUrS1FTT2hhVkRBSG40?=
 =?utf-8?B?TXlRaUtXZ3pISHFkQU9nd3E4TlN1V243VWo2T0pJZTRPb1JEQ0tWclBEVVZu?=
 =?utf-8?B?Z3hWNE9RSjF0SGt5UTRQRWprakNyd3Q3amZQR29vK3BXOSttWi8zd3FiVjRP?=
 =?utf-8?B?UDFOTjJjMGZIUEVwd3Z5R2NScnhHaVVLYTVQRjBxSXNrazFGQ01Vcit2czk3?=
 =?utf-8?B?cTZOUG9Oby9MQTRVekdRSGxicTVZbzlaSEt2SzZpSzlDeDRHNk1JNVdld1RE?=
 =?utf-8?B?MmxiVGZ4VHpRS1hVc0w3NXJHSktkelR1TDQ4YnlveEM1SEx6OEhaVFJrYTRp?=
 =?utf-8?B?bDFRUG01clQ4bW5RbW9BQ0gwMCtIUVowL1cxTCtBRVhkRGRSeFEyOCtOTnpT?=
 =?utf-8?B?amdoa2NsVXJITFBUUG9BU1RjclUvSWE3TVRCdlhnVzJuS2xIRUJva0x3S1F4?=
 =?utf-8?B?U3JiWFpzWlBXNjg3OUtZeVJXeUg1c3QxWHJXV3VaMkRjejh4QXNrTG9SaHlp?=
 =?utf-8?B?YXpneVdlR0VPZ2dlQWFIQmV2SmczOVoxTlNDMGl3STR4dnlBNWVKYk1nWUxU?=
 =?utf-8?Q?HnfipKI9lkLLbZMM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16D5E46699AC1F41AE670EE230BEEE75@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932ee59e-f330-4e67-284e-08da28372ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 10:17:49.8116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bus0SasxhmQc1TtJ4YDhauE48by3StEyJISF9Gvsv2/3xpgetOOx71CzMwA8fJwmqnqYILfAQSHBUqIMpXSCebHI2RFbxhmHfx1ONsMiE1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4399

T24gMjcvMDQvMjAyMiAwOTowMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAyNiwgMjAyMiBhdCAwNTo1MTozMlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
SGVsbG8sDQo+Pg0KPj4gRWR2aW4gaGFzIGZvdW5kIGEgbWFjaGluZSB3aXRoIHNvbWUgdmVyeSB3
ZWlyZCBwcm9wZXJ0aWVzLsKgIEl0IGlzIGFuIEhQDQo+PiBQcm9MaWFudCBCTDQ2MGMgR2VuOCB3
aXRoOg0KPj4NCj4+IMKgXC1bMDAwMDowMF0tKy0wMC4wwqAgSW50ZWwgQ29ycG9yYXRpb24gWGVv
biBFNS9Db3JlIGk3IERNSTINCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLTAxLjAtWzEx
XS0tDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0wMS4xLVswMl0tLQ0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICstMDIuMC1bMDRdLS0rLTAwLjDCoCBFbXVsZXggQ29ycG9yYXRp
b24gT25lQ29ubmVjdCAxMEdiIE5JQw0KPj4gKGJlMykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLTAwLjHCoCBFbXVsZXggQ29ycG9yYXRpb24g
T25lQ29ubmVjdCAxMEdiIE5JQw0KPj4gKGJlMykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLTAwLjLCoCBFbXVsZXggQ29ycG9yYXRpb24gT25l
Q29ubmVjdCAxMEdiDQo+PiBpU0NTSSBJbml0aWF0b3IgKGJlMykNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcLTAwLjPCoCBFbXVsZXggQ29ycG9y
YXRpb24gT25lQ29ubmVjdCAxMEdiDQo+PiBpU0NTSSBJbml0aWF0b3IgKGJlMykNCj4+DQo+PiB5
ZXQgYWxsIDQgb3RoZXIgZnVuY3Rpb25zIG9uIHRoZSBkZXZpY2UgcGVyaW9kaWNhbGx5IGhpdCBJ
T01NVSBmYXVsdHMNCj4+ICh+b25jZSBldmVyeSA1IG1pbnMsIHNvIGRlZmluaXRlbHkgc3RhdHMp
Lg0KPj4NCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAw
MDA6MDQ6MDAuNF0gZmF1bHQgYWRkcg0KPj4gYmRmODAwMDANCj4+IChYRU4pIFtWVC1EXURNQVI6
W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6MDQ6MDAuNV0gZmF1bHQgYWRkcg0KPj4g
YmRmODAwMDANCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2Ug
WzAwMDA6MDQ6MDAuNl0gZmF1bHQgYWRkcg0KPj4gYmRmODAwMDANCj4+IChYRU4pIFtWVC1EXURN
QVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6MDQ6MDAuN10gZmF1bHQgYWRkcg0K
Pj4gYmRmODAwMDANCj4+DQo+PiBUaGVyZSBhcmUgc2V2ZXJhbCBSTVJScyBjb3ZlcmluZyB0aGUg
dGhlc2UgZGV2aWNlcywgd2l0aDoNCj4+DQo+PiAoWEVOKSBbVlQtRF1mb3VuZCBBQ1BJX0RNQVJf
Uk1SUjoNCj4+IChYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAwMDowMzowMC4wDQo+PiAoWEVOKSBb
VlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDE6MDAuMA0KPj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAw
MDAwOjAxOjAwLjINCj4+IChYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAwMDowNDowMC4wDQo+PiAo
WEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDQ6MDAuMQ0KPj4gKFhFTikgW1ZULURdIGVuZHBv
aW50OiAwMDAwOjA0OjAwLjINCj4+IChYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAwMDowNDowMC4z
DQo+PiAoWEVOKSBbVlQtRF1kbWFyLmM6NjA4OsKgwqAgUk1SUiByZWdpb246IGJhc2VfYWRkciBi
ZGY4ZjAwMCBlbmRfYWRkciBiZGY5MmZmZg0KPj4NCj4+IGJlaW5nIHRoZSBvbmUgcmVsZXZhbnQg
dG8gdGhlc2UgZmF1bHRzLsKgIEkndmUgbm90IG1hbnVhbGx5IGRlY29kZWQgdGhlDQo+PiBETUFS
IHRhYmxlIGJlY2F1c2UgZGV2aWNlIHBhdGhzIGFyZSBob3JyaWJsZSB0byBmb2xsb3cgYnV0IHRo
ZXJlIGFyZSBhdA0KPj4gbGVhc3QgdGhlIGNvcnJlY3QgbnVtYmVyIG9mIGVuZHBvaW50cy7CoCBU
aGUgZnVuY3Rpb25zIGFsbCBoYXZlIFNSLUlPVg0KPj4gKGRpc2FibGVkKSBhbmQgQVJJIChlbmFi
bGVkKS7CoCBOb25lIGhhdmUgYW55IFBoYW50b20gZnVuY3Rpb25zIGRlc2NyaWJlZC4NCj4gQWNj
b3JkaW5nIHRvIHRoZSBQQ0llIHNwZWMgQVJJIGNhcGFibGUgZGV2aWNlcyBtdXN0IG5vdCBoYXZl
IHBoYW50b20NCj4gZnVuY3Rpb25zOg0KPg0KPiAiV2l0aCBldmVyeSBGdW5jdGlvbiBpbiBhbiBB
UkkgRGV2aWNlLCB0aGUgUGhhbnRvbSBGdW5jdGlvbnMgU3VwcG9ydGVkDQo+IGZpZWxkIG11c3Qg
YmUgc2V0IHRvIDAwYi4gVGhlIHJlbWFpbmRlciBvZiB0aGlzIGZpZWxkIGRlc2NyaXB0aW9uDQo+
IGFwcGxpZXMgb25seSB0byBub24tQVJJIG11bHRpLUZ1bmN0aW9uIGRldmljZXMuIg0KDQpMb3Zl
bHkuLi4NCg0KPg0KPj4gU3BlY2lmeWluZyBwY2ktcGhhbnRvbT0wNDowMCwxIGRvZXMgYXBwZWFy
IHRvIHdvcmsgYXJvdW5kIHRoZSBmYXVsdHMsDQo+PiBidXQgaXQncyBub3QgcmlnaHQsIGJlY2F1
c2UgZnVuY3Rpb25zIDEgdGhydSAzIGFyZW4ndCBhY3R1YWxseSBwaGFudG9tLg0KPj4NCj4+IEFs
c28sIEkgZG9uJ3Qgc2VlIGFueSBsb2dpYyB3aGljaCBhY3R1YWxseSB3aXJlcyB1cCBwaGFudG9t
IGZ1bmN0aW9ucw0KPj4gbGlrZSB0aGlzIHRvIHNoYXJlIFJNUlJzL0lWTURzIGluIElPIGNvbnRl
eHRzLsKgIFRoZSBmYXVsdHMgb25seQ0KPj4gZGlzYXBwZWFyIGFzIGEgc2lkZSBlZmZlY3Qgb2Yg
MDQ6MDAuMCBhbmQgMDQ6MDAuNCBiZWluZyBpbiBkb20wLCBhcyBmYXINCj4+IGFzIEkgY2FuIHRl
bGwuDQo+IEkgdGhpbmsgSSdtIHNsaWdodGx5IGNvbmZ1c2VkLCBzbyB0aG9zZSBmYXVsdHMgb25s
eSBoYXBwZW4gd2hlbiB0aGUNCj4gZGV2aWNlcyBhcmUgYXNzaWduZWQgdG8gZG9tYWlucyBkaWZm
ZXJlbnQgdGhhbiBkb20wPw0KPg0KPiBJdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQgZnVuY3Rpb25z
IDQgdG8gNyBub3QgYmVpbmcgcmVjb2duaXplZCBieSBYZW4NCj4gc2hvdWxkIGFsc28gbGVhZCB0
byB0aGVpciBjb250ZXh0IGVudHJpZXMgbm90IGJlaW5nIHNldHVwIGluIHRoZSBkb20wDQo+IGNh
c2UsIGFuZCB0aHVzIHRoZSBmYXVsdHMgc2hvdWxkIGFsc28gaGFwcGVuLg0KDQpGdW5jdGlvbnMg
NCB0aHJ1IDcgZG8gbm90IGV4aXN0IGluIHRoZSBzeXN0ZW0uwqAgVGhlaXIgY29uZmlnIHNwYWNl
IGlzDQphbGwgfjAncy4NCg0KQXMgdGhleSBhcHBlYXIgdG8gYmUgbm9uLWV4aXN0ZW50LCBubyBJ
T01NVSBjb250ZXh0IGlzIHNldCB1cCBmb3IgdGhlbSwNCmhlbmNlIHRoZSBETUEgZmF1bHRzIHdo
ZW4gdGhlaXIgc291cmNlIGlkIGlzIGFjdHVhbGx5IHVzZWQuDQoNCldoZW4gc3BlY2lmeWluZyBw
aGFudG9tLCB3aGF0IHdlJ3JlIHNheWluZyBpcyB0aGF0ICJmdW5jdGlvbiAkWCB1c2VzICRZDQph
cyBhIHNvdXJjZSBpZCB0b28iLsKgIE9yIGluIG90aGVyIHdvcmRzLCB0cmVhdCAkWSBhcyBpZiBp
dCB3ZXJlICRYLsKgIEluDQphIHRoZW9yZXRpY2FsIGZ1dHVyZSB3aXRoIHdvcmtpbmcgSU9NTVUg
Z3JvdXBzLCB0aGlzIHdvdWxkIGZvcmNlICRYIGFuZA0KJFkgaW50byB0aGUgc2FtZSBJT01NVSBn
cm91cCBhcyB0aGV5IGNhbid0IGJlIHNlcGFyYXRlZC4NCg0KfkFuZHJldw0K

