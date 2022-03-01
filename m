Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F164C8BF7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281374.479685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1vz-0000pG-Ba; Tue, 01 Mar 2022 12:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281374.479685; Tue, 01 Mar 2022 12:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1vz-0000mc-8X; Tue, 01 Mar 2022 12:48:55 +0000
Received: by outflank-mailman (input) for mailman id 281374;
 Tue, 01 Mar 2022 12:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP1vy-0000mV-Cw
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:48:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f151a782-995d-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:48:52 +0100 (CET)
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
X-Inumbo-ID: f151a782-995d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646138932;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oZo5lPjNxNbmBmBf/ntNRJMOZECLKTp51QAUaoMkA7w=;
  b=BE1oNPLzOAXC4FQvt0hfzGafNn6RG91RPVRV5zQjjywaEVKPGOc7UikW
   ecUBadhRvOkR8fnV5phvCuH0Nf9Mhn+SDkH234U20nQpVG8gtybBTaO+k
   WKc8whNp/QgXR3+qo7aXGlX2yx/CVWIxcOY6fbs83IRibzrgvJmGfxx7q
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67500473
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XDDEy6jaLPgcvHr3yA8SOiQfX161fRAKZh0ujC45NGQN5FlHY01je
 htvXGHUbPmCZGDzftx/a4+x8U9V7JeDn9A1QVY4+Sw2QS8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT15ML/0vfo3aQdFOCZQL7xn2uHNO2fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2UyNEycPEYn1lE/KNFvueKvhybFLDB8tFeou4Qq5kz0w1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9im3mqTG2yOHLFIaUxVGRs43le1oTyY1g
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpWZX1qvHbQKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWGxP
 xSN5VoIvc470J6WgUlfOdnZ5yMCl/WIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dghbfSBmXsmt86S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLNNsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:IQYcTqslujTT3DRjDmRJpbmI7skC2IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPiftXrdyReVxeZZnMXfKlzbamHDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sZxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMEE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx+r6xOiGplXbI+usMip
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtR5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdY15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAp23G4gMyKeFPGC1zwdLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="67500473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Epf6X6V+N/txvJx/Qo2uGlRYz+ITXPduccgIYaH5Jz8GcdAQb5VFmoq7XxLJQEwOjydDpIv83KR/zoULwreMsjrjNToZhnv40Rpaubfhb/l/Ki7OpLUIJl8e5Q3W4DEwTSMVL3TzOPR/ZwjHmnYUMXcHp5OjHZoYWONE1gP0Kn9pAqVZyBMDbgZTeFRAftbKYvJ7bJPB7b5qXfYmmTANb/tMRo41/8FbwcfOlAfegsZAAzGGai4QfkSaWwr/qwk5MWn+peijSUO7uHatqdC18yvAb1JbrbpcIUHmT4aEBB9srVjlNngZrw5+v/nkqrjNrjuTscD3En6dLh4zroiaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZo5lPjNxNbmBmBf/ntNRJMOZECLKTp51QAUaoMkA7w=;
 b=m/zfsJZVl6rEsmD6FLFVc9lLdsYqU/mIzLXD3YAh+6dONFhYfeGV4g8JkqZ6B+zM0aIuxtRodZZ9Ie0N25+rxAQPMdWzMvgdoLRD0Gsj9L70v6MeQd3FWqzonEmts48Brsv1khDAKk/c6LgHWPIlV3Om2Ui3zbSiJi95iqlxBv5rgz+17wM/Wj2mgwE83zBJz6d5DpUpNtGBA/y2cDAmXeHYVvlHbbSJI7OZKNYeIgDmk14aQYUss4vkMKy4ZqO3YlzS9oSdMFd79mWUrK9tjjg4sKtUNleQZp+Q1rHrdaC+lMm2XsK2GAQwgr7ONMUadMyeNTV/f2aX3B/ZGYjuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZo5lPjNxNbmBmBf/ntNRJMOZECLKTp51QAUaoMkA7w=;
 b=tcpBtXvTTr1HgL/BBMAigmr1lFXiB8AuBd8jsSQUDoEfeki8WaoijRwKoSwvsbJ2SW9yCCNf0WlT9xHsOB8yvhjaqmxr+Bns0GjGmu/nPFxn5HRCU4n72LzWxKcjxNbKvoYWPsbJoFCe2HvTnuu6ynkfvOiYbxdtHGySbYmdjBU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/altcall: silence undue warning
Thread-Topic: [PATCH] x86/altcall: silence undue warning
Thread-Index: AQHYLWCYr1nVwle0TEu9TqkN6fmfJ6yqeogA
Date: Tue, 1 Mar 2022 12:48:26 +0000
Message-ID: <40306bc7-f61c-d330-0ec7-d986e4711d88@citrix.com>
References: <0e3594ff-c637-46f2-bc95-7a26b5471b86@suse.com>
In-Reply-To: <0e3594ff-c637-46f2-bc95-7a26b5471b86@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d03efde-6d91-42ab-3f3d-08d9fb81c79c
x-ms-traffictypediagnostic: BN6PR03MB2945:EE_
x-microsoft-antispam-prvs: <BN6PR03MB29459742E53CD3A3D6D920A2BA029@BN6PR03MB2945.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5k/mFrAFanrnYxaNtvT2cicYkIFrUec0fhZTrurzKw+EiEFlUtDAlov7hIcddzd96mcw7Gnv56+rDUuOEBoRwUdUrywK3fq5GRxg4At8cjM4a3mXXu049bCzTqCJUYnqJ+/kC/Cirmn9gQsZvCNTGJyhzqq/7j3O768sN/85MY1bMweT8SGSbb/F+Ox0ejg53EJWyTN9wH+RJV0hOXyqS1sKLvfeSID9GVCq4U1TRIDQ+DqoITse+opiuQkXBMuunQDhewh9FS5PsCXW5a2GcfaHFUsf3ZUkGr1/wGX924IbuZEYdl+9yAahgf2hAD1PaxTl6B0zoMt0dV0ZxBGFfVtEko+eT5JmA7n74jgoY5xif2emMNh6NBONrq9dMqlnwGPaVdhRAKtPE7cskEd+6bDrP9bOv5z0gbr9L6u/8Fz8fdjxsyw01EIKTHG5RAu0GhhzTOPTJaWiwEB1L1vCuYmbkBg7jd0QPf3kSGK8pq731wa53aut9GDb5RgnF6bxWuKBjAGeU733HLcYyuYCXPngJf6r70l3T722sTeJIImGTxfiajvccn+rEYEE19kg7vZiab6SZZejxbnR5VFrutOvVMVmE/osKgBF7bFzHGc+w5tUsJueHupe87lbSvfaDkpj7TJyvebCYftVA2PXCzqRygCuO60l2i/yLA2pWCOCKz0aM7jFq/DFg/TQUOhMiAqcVmAvdaA/NoeG7+RhAqcrF/HqaN+QDH4ZJz/TNCRMJvS/x4ZNGK4fnoHvTCA805UxxSP7HXQo9yRRcIIaBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(66946007)(66476007)(91956017)(66556008)(64756008)(4326008)(83380400001)(8676002)(86362001)(76116006)(186003)(110136005)(6506007)(71200400001)(107886003)(2616005)(26005)(31686004)(36756003)(316002)(54906003)(6512007)(53546011)(508600001)(6486002)(8936002)(82960400001)(5660300002)(38100700002)(122000001)(38070700005)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RENiYTkzeW9VY3p6LzZpaE5UVmQxUXh0MkJxbmZqdTBiS1U3cDFuNzBqTGFU?=
 =?utf-8?B?YTZrZ2pacGdMKzRacnVKVXlzZUVPQjRWK0toOFJOZjIveVhyOU1sWHNFcjFM?=
 =?utf-8?B?alVYMUhJSG9Gamh0NVp6cnJaY3BXSk1laVR2V2EvQ1hsVmpEbXIzRDFFYUJn?=
 =?utf-8?B?dGFUTHB4U1kzSUVkUXB0RXNLaDUySWthenlicmQwN0Y0WVZBZWd0R3k1bEE1?=
 =?utf-8?B?WXB6UUdnaFVqTnF3WFVvV3RQZjBsZkNwM3lxMjhuYUNUMjQ1akVzNnhVcVNR?=
 =?utf-8?B?SzNCb3JlV3ZaSVRBaXE5bm5KbkdUa1JXcFJUM2t0OG1pSy94Ly9DQkZTaHRl?=
 =?utf-8?B?VzdnTy9BbDJRLzY4Y0JOQXJiZHY5N0RNZk9OV2VrUWhyUmo1aDk2bHAxTzFl?=
 =?utf-8?B?SmR0WkViNkpZQ1F1ZTdkbk9yYTJISHNVdTJ2QUZrd0N4MDhJdnhIVGs1ZmQx?=
 =?utf-8?B?T2NrSzVFbWl1OEltOVBnTXRBbEc2czRWaXlwOWdJS25sOTI4S3c4VVl0Q0wy?=
 =?utf-8?B?T0dvODFVYUFJUFppeWVOaTJLRzhwdWtiMk5rNlhUckhQZTdHMDhSdVd2NUZS?=
 =?utf-8?B?SVcwNGFZaVBDbTE1bHNCVjJLSzFmWWo0bzlGaXB6QXRKMGdJeDhKNzMvbU9Z?=
 =?utf-8?B?QWdNYlgxY2NZZnpDUmlPdmJVYmF6Qjd3b01ldGN4eHFnSGdiNmdiaHpwd1Qr?=
 =?utf-8?B?NDBBc0hVbVBkUUoxZ0NsOENRL0RFeVVXdkt2S1FvRURpTU9yaEtQblZXZmJI?=
 =?utf-8?B?YklFQ1pmNlhWdHBnVDBrVkV0Ukd0ajNMeXNranlYMU44R3NiWmlXSkI4b3E5?=
 =?utf-8?B?T1JDT0VWUGF5QWlxSkh2SnVrcVNiVEhPS0ROSXNtbTZpWFBST1dOU2pUVkZX?=
 =?utf-8?B?RlBTRXY0V3hMam0xcWEvcmI5anEyN2xoWlNZdVRkWGhlcitsR2xEYlVsMFFl?=
 =?utf-8?B?Q3Y4MjExQlltSEgrN0psQzhMS3B1TklndytnK2g0bkM4bkZyU3RvT1I0RDV2?=
 =?utf-8?B?OERIQ3YwQ2VjNjZvdnFIVXhxVldJcWQzNHJzdlVucWJZSy8yY2tkQTg2bUhI?=
 =?utf-8?B?Z3lRZWVvblBaY2FpUVRBS293M3UwSWNHNkYzTDRtTkViNWtpOG51YklqUXQ3?=
 =?utf-8?B?MnJJM1lvV2FlZGJ4TlBrak45bUhOWUJuSDhoNzErSFZBK1g0bk45enA2Znh0?=
 =?utf-8?B?Z3hVN1Q2Mmxwdjc3N3NJdUU5Y04reFE3cXpYb2xYSGtEMDY1YllScHpPeEUx?=
 =?utf-8?B?N0ZERjlIeVV1d212UXR1ak5FL05VbFpnS0lRWURkS2JVdU9xUzd0dWxSZUdt?=
 =?utf-8?B?bUlUTmh2NlJ1b2d3ZGxtUy96TWFtUmZEUCtYK2J3VUZKTE9MYmJyWU9qVTRh?=
 =?utf-8?B?M3NYR2ZJdWhRNEV2dnJJQ3F0YVdvV1dDMnZJZUh6RFhrOVhFcm81OXVmREQ1?=
 =?utf-8?B?UmNGRDMzb2tkZ0hYZHdQOFltakQveVJRR0c0UHU5eWY1SkZRU0VuNjVlckVQ?=
 =?utf-8?B?ano1MGxBcnVkOXhxT1Z6cldUOFVhbkppV3FCTDRseHVnKzNVVDdSWXFzWjha?=
 =?utf-8?B?Y3N5MzBNa2lvNmMzWWZraWlGM1c0bXVLQVFsZnhFZ1ZNWllSTThVWjllbnc5?=
 =?utf-8?B?Um1laVE4ZWxhbVprMHloRWt4QjMyRXdHcnlZOHVQS1FTWjdVVFpMcFIxNHVa?=
 =?utf-8?B?R3NpOVdmbG1iTjRUaWg1cmYrRzJzV3ZNVkQ4V3QzT3JNZ25tWm1HYW14NHJ3?=
 =?utf-8?B?a3ArTXNKWkNYUVkzeEhFeGJDVy9oS2lvZmFVMWxUb0NqUnlCNVhzZitqdXdm?=
 =?utf-8?B?OFNOWCt4ZDFQdnR6V1JLVnJjd0dicjVTUjh5amZKK1BFVUFXTG1PZkVkTTNU?=
 =?utf-8?B?Y2YxSVprUUdmUzZNWVRSVVFDSlpsQURBdWRsMG5nRkdsVjA0bXRRa0Yxbmlo?=
 =?utf-8?B?VnVubEtRRURGNi9SVERMUW8wZTVybVcwaFBGSnVOTDEwSElVZlVhS0dRcW1n?=
 =?utf-8?B?U1ZlMFVDNXhGdUVMSFkvOGdTMU44ZGZHVDlkWVZrL3loVyszQjRJOHFiVzgr?=
 =?utf-8?B?MzlxR21qbnN6WXIxeW5YYjYrQWdwVkp3Z2JVaGtBWVZGc2hmMFNUWk0yZkVM?=
 =?utf-8?B?MEU5Ykk2WERmUkw4NnA2M0NUSGRKVDExNDZSK1c5c1RZajhaaTNCTy9tdmFB?=
 =?utf-8?B?b3B1UFh0QTBKcTVpSmxaMEJtZmpTS2NFL1RwSGl3MnBmbEtqL3hFN1ZkcEdq?=
 =?utf-8?B?RndvYlJlMGkyd3BLRXFZV0dZczhBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A35A5795BEA18C48BF48A196F4CDB148@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d03efde-6d91-42ab-3f3d-08d9fb81c79c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 12:48:26.6957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8Zd1Xv0gk2NVKV3gwsLOrw/cAbmegTIVp5Ir3n3j4R8OB0s4/z+Nn9jGnN+rGEaK17St+/23QpozquGJNqxbjwN//PwZyawZYU+7j6Eq5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2945
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxMTozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFN1aXRhYmxlIGNvbXBp
bGVyIG9wdGlvbnMgYXJlIHBhc3NlZCBvbmx5IHdoZW4gdGhlIGFjdHVhbCBmZWF0dXJlDQo+IChY
RU5fSUJUKSBpcyBlbmFibGVkLCBub3Qgd2hlbiBtZXJlbHkgdGhlIGNvbXBpbGVyIGNhcGFiaWxp
dHkgd2FzIGZvdW5kDQo+IHRvIGJlIGF2YWlsYWJsZS4NCj4NCj4gRml4ZXM6IDEyZTM0MTBlMDcx
ZSAoIng4Ni9hbHRjYWxsOiBDaGVjayBhbmQgb3B0aW1pc2UgYWx0Y2FsbCB0YXJnZXRzIikNCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpIbW0geWVz
LsKgIFRoaXMgaXMgZmFsbG91dCBmcm9tIHNlcGFyYXRpbmcgQ09ORklHX0hBU19DQ19DRVRfSUJU
IGFuZA0KQ09ORklHX1hFTl9JQlQuDQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQo+IC0tLQ0KPiBGdXJ0aGVybW9yZSwgaXMgIk9wdGlt
aXNlZCBhd2F5IC4uLiIgcmVhbGx5IGFwcHJvcHJpYXRlIGluIHdoYXQNCj4gMzdlZDVkYTg1MWI4
ICgieDg2L2FsdGNhbGw6IE9wdGltaXNlIGF3YXkgZW5kYnI2NCBpbnN0cnVjdGlvbiB3aGVyZQ0K
PiBwb3NzaWJsZSIpIGFkZGVkPyBJZiB0aGlzIHJlYWxseSB3YXMgYW4gb3B0aW1pemF0aW9uIChy
YXRoZXIgdGhhbg0KPiBoYXJkZW5pbmcpLCBzaG91bGRuJ3Qgd2UgcHVyZ2UgRU5EQlIgYWxzbyB3
aGVuICFjcHVfaGFzX3hlbl9pYnQsIGFuZA0KPiB0aGVuIGlkZWFsbHkgYWxsIG9mIHRoZW0/IFdo
ZXJlYXMgaWYgdGhpcyBpcyBtYWlubHkgYWJvdXQgaGFyZGVuaW5nLA0KPiB3b3VsZG4ndCB0aGUg
bWVzc2FnZSBiZXR0ZXIgc2F5ICJQdXJnZWQiIG9yICJDbG9iYmVyZWQiPw0KDQpJIGRpZCBoYXZl
IGFuIFJGQyBhYm91dCB0aGlzLsKgIFR1cm5pbmcgRU5EQlIgaW50byBOT1A0IG1hdHRlcnMsIG9u
IGENCkNFVC1JQlQtYWN0aXZlIHN5c3RlbSwgdG8gcmVzdHJpY3QgdGhlIGF2YWlsYWJsZSBvcHRp
b25zIGFuIGF0dGFja2VyIGhhcw0Kd2hlbiB0aGV5IGhhdmUgYWxyZWFkeSBtYW5hZ2VkIHRvIGhp
amFjayBhIGZ1bmN0aW9uIHBvaW50ZXIgKGkuZS4NCmFscmVhZHkgZ290IGEgcGFydGlhbCB3cml0
ZSBnYWRnZXQpLg0KDQpGcm9tIHRoYXQgcG9pbnQgb2YgdmlldywgaXQgaXMgaGFyZGVuaW5nLg0K
DQpUaGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIGxvZ2ljIHdhcyB0cnlpbmcgdG8gdXNlIFVEMSBp
biB0aGUgc2FtZSB3YXkgYXMNCkxpbnV4IGRvZXMsIHRvIGhhcmRlbiBub24tQ0VUIGJ1aWxkcyB0
b28sIGJ1dCB0aGF0IGRvZXMgZGVwZW5kIG9uIGhhdmluZw0Kb2JqdG9vbCBzbyBhbGwgZGlyZWN0
IGJyYW5jaGVzIGNhbiBoYXZlIHRoZWlyIHRhcmdldHMgdXBkYXRlZCB0byBtaXNzDQp0aGUgVUQx
IGluc3RydWN0aW9uLg0KDQp+QW5kcmV3DQoNClAuUy4gSSdkIHN0aWxsIGxpa2UgdG8gaGF2ZSAi
YXdheSAldSBvZiAldSBlbmRicjY0J3MiLsKgIEl0IG9jY3VycyB0byBtZQ0KdGhhdCBub3cgd2Ug
aGF2ZSBjaGVjay1lbmRicjY0LnNoLCB3ZSBjb3VsZCBgd2MgLWxgIHRoZSAkVkFMSUQgZmlsZSBh
bmQNCnJlLWxpbmsgdGhpcyBiYWNrIGluLCBidXQgdGhlbiB3ZSBjb3VsZG4ndCBjaGVjayB0aGUg
ZmluYWwgb2JqZWN0cy4NCg0K

