Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E112E622FD9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 17:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441071.695336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osnfh-0007TW-EB; Wed, 09 Nov 2022 16:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441071.695336; Wed, 09 Nov 2022 16:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osnfh-0007QN-BC; Wed, 09 Nov 2022 16:11:25 +0000
Received: by outflank-mailman (input) for mailman id 441071;
 Wed, 09 Nov 2022 16:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F/s=3J=citrix.com=prvs=3057ff164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1osnfg-0007QG-8u
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 16:11:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2568b5a4-6049-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 17:11:21 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 11:11:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5164.namprd03.prod.outlook.com (2603:10b6:5:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 16:11:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 16:11:07 +0000
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
X-Inumbo-ID: 2568b5a4-6049-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668010281;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=M4XaE3dKcv9t5U3oti/AG2Qf6ngG1lZU/yYEKnKSA5A=;
  b=JJYQOOD+hBgFzO3otK7mW7ILavVS3Ixk25PxKc1r5j03PDglVo0dXtXE
   Fdui7KMEfs/zRBkqqhdofbUi7hJT3kPptQK2aZxBlcSzjt2/mxOWCMIkC
   2W70Vy3WNmi4o95IjhKT+Rw6x63BBxnhzv8jJy/XFZ8MspMLaY154J0Qu
   g=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 87024462
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iYWBiqudgz0CeSXcUYIPhCFSj+fnVGhfMUV32f8akzHdYApBsoF/q
 tZmKWmEPf/ZYmf9f990Pdzk/U0Ov5HQndBrG1Fpq3tmRC4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaGxiFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAzQxQBOtjs+P8LflY+RV2O0MHM20BdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4W9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3nrqQ23APJroAVIEdNW0WnmdqWs2y/Xo1/M
 2sT3wR0nadnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQK2
 1mTjpXWDDpgmLSPTDSW8bL8hTG4NDURLGQCTTQZVgZD6N7myKksijrfQ9AlF7S65uAZAhn1y
 jGO6SQ72bMaiJdR073hpA+YxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:LpdPEqybwnUnik8SNs8iKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.96,151,1665460800"; 
   d="scan'208";a="87024462"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqrKeBOejSb04YEi2LLmuDi8K/k6Pk9cSzgDk0foe5s1XDzuCOPoERXXLDQqi8HuQUsT4N69xO7Abw3wOvYh5b7FM1qpDwUpbfuTtmuGoFZyhH9uN9U/AQ6bN/BRliiNTFW1B2wRg0dvK8nNqam4/6t0MwISGWDENtNVMqI2oHcZOqlSFyVVXnN/c8ZRd9+jjAx167ZtYfa8HAwgwgpcirspweVTe9/WwOZyLwukDV2SDFw45/3iaqsHQxB7yty1P9o/RIGDq0KbhNBkZEOp2x0qZBknal8BwHEWxtAQGt1oaQNyV4a7EWuonjgol/5q77v31ARU8KpzIFQWZ3Xnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4XaE3dKcv9t5U3oti/AG2Qf6ngG1lZU/yYEKnKSA5A=;
 b=eQhhwKu9FCcU1KU9ZETGYWF1aFV74xSK7VSDfpT24VV/XDG6VYyMAmp565r+Fs/fVDNpM5zi5JGiiT3YX7yA3exhzWJfDV0M12WB4pqwV5aRgKO3t1IqZ18WgC3dc26Ov0clS9z1WpHSUh/X4uvP0YgVeWGimxgYxOyA81AAbQLrEiJoLd4Gtq8yYrOMTyFHgKPtf4MNlSgXPxQax1vEVCLDBU+4+Yp0wTY58AKCRG0jKBlW/ZXSZ4WP/uY7YnlW8tkuskxf7wWNgVqx+7O8A1hUKCotoS9LAx4kBr3QK3IymptsxptOEWMI30nveSIif6QLw/BM7ExGsoZoksc1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4XaE3dKcv9t5U3oti/AG2Qf6ngG1lZU/yYEKnKSA5A=;
 b=du5nnXydvDbtw3dbmgSUSatwVApyHHwc92WsFliRd9vSADeXG9eg3s1CSNXBnPiULd3wRktETmvYOKzds/XfX02Q1x/c9uDGLNyjhlS7RhzJiKvh1QRs5rxKVjEJm3CcEOxvpdrKOpqzsu2MQNeVNohku3Ad5NkDloxLb5lVTW0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Jan Beulich
	<jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>, Wei Liu
	<wl@xen.org>, Edwin Torok <edvin.torok@citrix.com>
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Thread-Topic: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Thread-Index: AQHY82a4cu6AadRChE2NlC8gxlcdqq42xPAA
Date: Wed, 9 Nov 2022 16:11:06 +0000
Message-ID: <de5c9f07-90f5-a460-f1f7-a6732bbab1df@citrix.com>
References: <20221108113850.61619-1-roger.pau@citrix.com>
In-Reply-To: <20221108113850.61619-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5164:EE_
x-ms-office365-filtering-correlation-id: 8edca0fc-e2cb-42f5-2c66-08dac26d0237
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r2ucO7qzVaa3qKwqvxChdQ/MtkmsvzbEur/nzodmeSEfVWdjpZ/dN0X3mwFNuUluc+48RytVyZ5/6b+gJR3DE2IxOYH+Qois+vcLwHZCCB+tgiPqBDh2mN72wQB/PhEJrcKE4msLCqMyDbTcNoW+TXVsOWx5El8N+e4Rv4VKqtIBesin8POv+HzA0RfnVbV6C1agigyFYnu7vNjNTDFCQy9Rd7/KXxnxW6btRTkSHxB+fAAmLLrlmhj9ps458PHxGRzmpDL/ndGTYHXAjQcD21c/YGKjnMoLcJCz8MfYyfTb6/9iVRLeK8VzUlBS2tf6La7nEmGTIOxnSbOhe8pbAitsTvOsxsRxX7DU/SUpLjUqMy5IRAp3Pgn5bSq7tmZjNnFb1AurnVomSSf0sZ+vuL000JMUImriu3exDLYamAh47r4WgP7uzsx99O0tQ1hR4gkydxZEu7Y3GvKwYrbLmSZ3KU3Ly6OxBrcEogEDhPNjUQyUMuA83AAQP3xdp09mx769b9jhU+gIRZkseW1Q1d0vLqImDad/rtvhjsbr8sQZhl87EdoHxBmXQHB2AMns+M7fjoR3icct0phublgeBUFHtevbKsGOtBF0gRIJxeDRMzygETFb4Beq2aSAkLxcvyailnJGJIU/cXeS1tcC938NE8IJR6/HtlDq03/40l8CKTkbcQY7Id0BujrOIf3KiZEDkeJNqUtgI+zi1XtfCSVUd4CLyg6NK7LBhbtR97imvQgXYHieuj5lHiy4pJYaX/otjBXitbLY8aSDqfufaAO1wTl9+Wghh6+n22Z38JF637+o+rnt9OxmNhaLDXF8nE7/6F683so7g+g3k18l5w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(66899015)(36756003)(31686004)(82960400001)(38100700002)(122000001)(38070700005)(83380400001)(66574015)(86362001)(31696002)(6512007)(2616005)(53546011)(107886003)(76116006)(186003)(6486002)(478600001)(71200400001)(110136005)(54906003)(316002)(66446008)(91956017)(64756008)(66556008)(66946007)(66476007)(5660300002)(8936002)(41300700001)(4326008)(6506007)(26005)(8676002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1NaeHhkRFc0a1FQZkQ5M0ZYMFBzQ0JORUU5K09uazdYWGQreEo5MWIwRTEv?=
 =?utf-8?B?RWlIMEFML3ZwUkFEa09yWjB4RkUyaUI0MFJJYUtPdTBGWVlUc1BZV3VnTDRp?=
 =?utf-8?B?U2kyQ1RVMzd6b2N2OUJWYitCQ1NTY3BpVU9zY2FRRERUQUV1cDAvL2gzQ1E4?=
 =?utf-8?B?UkJkdkc5TEZ0bWFiUEZiL1R2TFZPVm9vU1JLTG1iSVRLbW1WM0N5bHpmZ3Rm?=
 =?utf-8?B?VlVKYmxvQ3B1bnFBY3pjWDBhNTF2bEhNUy8wUmViSlFBMHFFR0hlK1E3ZExU?=
 =?utf-8?B?MEN4TWlwdnVpNHdINlBaK3Rnc1NteWVLbmdidTRsejhmWUtHVWR5dGxZOTZo?=
 =?utf-8?B?dkF5YkRlbUoyWksxanNEQlZVODJ6VjhtK1BNa21ncEk3a1ZvUmxUQkFpekhh?=
 =?utf-8?B?YmJzTXVoaDZZMVNRSjRRQXRLc0FabnlVbUVBbVJNUzlvR3dpbXdRNjExUnlY?=
 =?utf-8?B?WFIrOVBob1RkaDRlcWJRamRTRlBxQUpOY2hjaEZJREIvTUpUUmcwMTVHSHNR?=
 =?utf-8?B?YWFMRnRNZGpHL0ZtZnBteEg5M09FWGhZeXJqTlAwWkphWjNSSkdaYURLWmZn?=
 =?utf-8?B?dkNueEZ3Z3JYSnZrcUxoRC84bk5xNUpiS0pLSTJmTXlFM2VXQ1FEVGhwam1U?=
 =?utf-8?B?dlA5L1E3WFJsa1VYVVVBQzJCUDdDWGVOWGJMMjZJb2dBa0Vxa0h5SThYelI4?=
 =?utf-8?B?Y2lNczZYYS9QbkFZY1h5QjJISXUwbmtGRCtuVWVGWENxUEZOcTJnNFFlL2kw?=
 =?utf-8?B?VzkwSkE5RWZ3WnFWdFJmZXM4KzBWcXl0ZTdDbm1qY1NYNXo0SjdXbml0RU4w?=
 =?utf-8?B?UnlOVWZJckFhU1lpeW91VmFDaTZWNS9zREVhdVQzQ1dNTTZBTXI0Y0o4RGw2?=
 =?utf-8?B?d1VaY1pZQitWR1lVVllOMUJQK0xDY3JtZ3VvYVdaZnFTcTVEY1FQL21ad09D?=
 =?utf-8?B?S3VsYUowTzA4S2hMRXFaMTlUTWRyUlpPbFJLaHFURVV6SGdiWU1GZzF1byta?=
 =?utf-8?B?T21GdTBKdEowNG11aHpVeS9aTlhTQVhrTk9ENlR2WFNWZVZUUjZDanpVOThI?=
 =?utf-8?B?S251OFlvV3B5YVhCUnZKd3BFT0VqSTYxc1RPTHN1TFVrSXRqSXR1Z2k4TGZY?=
 =?utf-8?B?UmhzNEN5eVhBSWtGaXJiV3NnNndmRlY0aHpiRXJLZFZocEl4SkNwU1NTdjVM?=
 =?utf-8?B?cU1xOUVlUGgxMkFvZ0Vmb1RJL21ab1F6Zit6R0U1eTRMUktyOGFQM3BLeHgz?=
 =?utf-8?B?eVBEcWIyZEtuTWFoUnl3aEZZeVdyN3FFZEN4WXdLemNQYlhHRDREVEk1TDJB?=
 =?utf-8?B?RDVXRVQ3QWI1QWlyeGExUWZLdzJqQWRnckxuNnMwalRGRFY4OHVXWXFoVnZp?=
 =?utf-8?B?d2lMUnlaSEJOUFJwOUpEQ1NwNjV2d2pwMXJNT1V5eUVLcVpjTmRUdnIrLzBC?=
 =?utf-8?B?WW9hMi9OQXppNFlWT0JlWG4xSWpVNHRBekpKNUhVTHk0ei95V2tOVUY0dVJQ?=
 =?utf-8?B?NGZhRnFkaWxZbmNaK3NNZURwamZKSXNiVjlvU2lmdXlWS09STmFRZDRnbi9q?=
 =?utf-8?B?ZUdSQW9uNzlFWEhsVGVGS2R6NGxOWTNMQmpUaWNDUGlFbk9rWXJURXpQSXRR?=
 =?utf-8?B?UHhIa2drK3piR01YbmJNVTJKeld4TzVsQm9FVlIwUFdzTEF1bk5mMmJHN2lI?=
 =?utf-8?B?dUthby9ySVFHb01GOGs2L3RKcWdFdFUvaEc1T1M4eFdUSDJIbU83bk8xUmlG?=
 =?utf-8?B?d1h1dGNYbXZ0Z0FBWmptSVFoOUhLeHV6U2pjejNPUmJLM2JpWElxZmR2V2N1?=
 =?utf-8?B?b0Ixa2ZGOG5pSkpVODNMblU5SU5jd0hETjM5YnZjTC9ycms1ajZ0YmxVQWpo?=
 =?utf-8?B?SlFmM1Y3Vmp0WVlEOVhHSjRJZFg5VS8zNlZnTTRmTjB0dUgxUytYZXppbW5T?=
 =?utf-8?B?WktQVTA0cnB0NGVISzk3bStsQ3hyWFFpYk5YZkJocGp5bHF0OFAybTFtODMw?=
 =?utf-8?B?aXpEbU9SejhESTlRbWIwbTNwNjVQbTE4NzRESHN6bHpqeFZkSWxMVk13aDl1?=
 =?utf-8?B?M2gyalgydG9yVEwzeDlUeG5Ib1d3L3NneXViYkJZaXNINFA1SlNIM3ZKUWFn?=
 =?utf-8?Q?AM4F4Moq8uP9x8bVJLlipd8Dv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78F7FB5784EF0E4D812EBC2FC9E68812@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edca0fc-e2cb-42f5-2c66-08dac26d0237
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 16:11:07.0115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BnrmMxL5a+KJqbt/rUqAQfiy0tlfVfyQX14sDZICOF5HqisUWUsmReJZo8963CXdju0q60S6X/ifiBt8fLeBTSr89w/0L+US1brlrLWnzek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5164

T24gMDgvMTEvMjAyMiAxMTozOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBMaWtlIG9uIHRo
ZSBBcm0gc2lkZSwgcmV0dXJuIC1FSU5WQUwgd2hlbiBhdHRlbXB0aW5nIHRvIGRvIGEgcDJtDQo+
IG9wZXJhdGlvbiBvbiBkeWluZyBkb21haW5zLg0KDQpIb25lc3RseSwgSSdkIGRyb3AgdGhlIGNv
bW1lbnQgYWJvdXQgQVJNLsKgICJ0aGUgQXJtIHNpZGUiIGhhcyBleGlzdGVkDQpmb3Igb2YgYWxs
IG9mIGEgY291cGxlIG9mIHdlZWtzLg0KDQpBIGZhciBiZXR0ZXIganVzdGlmaWNhdGlvbiBpcyBi
ZWNhdXNlIGFsbW9zdCBhbGwgb3RoZXIgRE9NQ1RMcyBhcmUNCnJlamVjdGVkIHdpdGggLUVJTlZB
TCBhZ2FpbnN0IGR5aW5nIGRvbWFpbnMuDQoNCj4gVGhlIGN1cnJlbnQgbG9naWMgcmV0dXJucyAw
IGFuZCBsZWF2ZXMgdGhlIGRvbWN0bCBwYXJhbWV0ZXINCj4gdW5pbml0aWFsaXplZCBmb3IgYW55
IHBhcmFtZXRlciBmZXRjaGluZyBvcGVyYXRpb25zIChsaWtlIHRoZQ0KPiBHRVRfQUxMT0NBVElP
TiBvcGVyYXRpb24pLCB3aGljaCBpcyBub3QgaGVscGZ1bCBmcm9tIGEgdG9vbHN0YWNrIHBvaW50
DQo+IG9mIHZpZXcsIGJlY2F1c2UgdGhlcmUncyBubyBpbmRpY2F0aW9uIHRoYXQgdGhlIGRhdGEg
aGFzbid0IGJlZW4NCj4gZmV0Y2hlZC4NCj4NCj4gUmVwb3J0ZWQtYnk6IEVkd2luIFTDtnLDtmsg
PGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4sIGlkZWFsbHkgd2l0aCBhDQptb2RpZmllZCBjb21t
aXQgbWVzc2FnZS4NCg0KWGVuJ3MgYmVoYXZpb3VyIGlzIGRlZmluaXRlbHkgYm9ndXMsIHdoYXRl
dmVyIHRoZSBwZXJjZWl2ZWQgaW50ZW50aW9uDQpiZWhpbmQgdGhpcyBjaGFuZ2Ugd2FzIG9yaWdp
bmFsbHkuDQoNClN5c3RlbS13aWRlIG1lbW9yeSBoYW5kbGluZyBpcyB1bnVzYWJseSBicm9rZW4g
Zm9yIGtub3duIHJlYXNvbnMsIGxldA0KYWxvbmUgdW5leHBlY3RlZCBzdXJwcmlzZXMgbGlrZSB0
aGlzLCBpdCBpcyBub3QgY3JlZGlibGUgdG8gc3VnZ2VzdCB0aGF0DQp1bnNwZWNpZmllZCBvYnNv
bGV0ZSBjb2RlIG1pZ2h0IGJlIGJyb2tlbiBieSBzdWNoIGEgY2hhbmdlOyBpdCdzDQpkZWZpbml0
ZWx5IGJyb2tlbiwgYW5kIHdoYXQgd2UgcmlzayBpcyBleHBvc2luZyBhIHByZXZpb3VzbHkgaGlk
ZGVuIGVycm9yLg0KDQpOb3QgdGhhdCB0aGlzIGlzIHJlbGV2YW50LCBiZWNhdXNlIFhlbmQgb25s
eSBtYWtlcyB0aGlzIGh5cGVyY2FsbA0KYm91bmRlZCBieSBkb21jdGxzIHdoaWNoIGRvIHlpZWxk
IC1FSU5WQUwgZm9yIGR5aW5nIGRvbWFpbnMuDQoNCn5BbmRyZXcNCg==

