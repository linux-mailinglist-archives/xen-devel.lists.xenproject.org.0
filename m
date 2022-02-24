Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98D4C2939
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278099.475206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBGJ-0002T0-I1; Thu, 24 Feb 2022 10:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278099.475206; Thu, 24 Feb 2022 10:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBGJ-0002QL-Du; Thu, 24 Feb 2022 10:22:15 +0000
Received: by outflank-mailman (input) for mailman id 278099;
 Thu, 24 Feb 2022 10:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNBGH-0002Ks-NP
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:22:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fda5e1c-955b-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:22:11 +0100 (CET)
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
X-Inumbo-ID: 9fda5e1c-955b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645698131;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0FwQSj+Arevjf2KS6yFNQQyXSOwzVDu7YgXqdMuQvho=;
  b=WDLJAepD8Qyw5PTWoQlHi4PXOxMO93gql8UqO4V0Kd5W3DN7RSKByOLu
   CPCkoTkqNw/anD7CLanLRbAKmPtkGPR7Ciid5qe/AQhswlHrJHfQGfUQC
   i+H0qsb06+UwzuA23JbHUf/o7o4oFK/tVDU71GPCtiiXTC+e2lAZugG+d
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64890043
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d0daLqBvWLRfJRVW/zvjw5YqxClBgxIJ4kV8jS/XYbTApG5w0zMFx
 2ZJCmuGb/2NM2Dyfoh2a9i+o0IDv5KGmNcyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rj3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhWl
 fVTm7OLRj4IYI+Rn9ZHQwNVN35XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4STaeGP
 5ZCAdZpRAXLRRJ/PUotMbAdx9qEqXflNCN3713A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0fIdwDcMV0w606/T2vgGrXHgeQxoeQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 hDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0jehszbpxfJmeyC
 KM2he+3zMUNVJdNRfUqC79d9uxwlfSwfTgbfqq8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLegOnKOqdZLdzjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX1RUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:gCm0D6v3G+wgFp4pQDIFceJ27skC2IMji2hC6mlwRA09TyXGra
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
X-IronPort-AV: E=Sophos;i="5.88,393,1635220800"; 
   d="scan'208";a="64890043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4p4D4qXCDRo5/FcmycoEEaA1DhBPII7bzeIIEpi1vTzWgMgH1iaeyg+19b7wh6l+mFwD/7iZ1xnK0/LueimtXcltmRJEfYBPG4ZXrsR7Y5ZWQ2+zm2jaRRmykU7HB6sgLoqIKiPt7Th59B3A9n0Yj82MQgHtyNaVilZaD5dAABecCa4cIiBIagwX/5axmjVA6TAWvISqtFlarEm5BABJWgE2IcSOWk/Io/eLAW5BHBhrL5yzNqqVrGnbeGH3bNGJDmPpOFrj1l2TWuP5uDYOw9eBW05tLmh+FYfYUMVWCUEEFwtqrvPYCIYMGP2w7sH0OB3HEptJ1+TwGSitpFwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FwQSj+Arevjf2KS6yFNQQyXSOwzVDu7YgXqdMuQvho=;
 b=av0ybdnZDvpbDYYfsT7ncs6mSb9IuC+8orJv1R9m1Ui+fIVNg+D76WmHpNAkk0TC0bcV250Yt5d5WLyCpFzQNNFXmmHo95y7faULCyRRIqEJSbpeFLhpBGJRw/yazzpVyg0KPfgBscQvaUTj/ja5h0cU95pMlMl/pK6ZncHaoLxZ0aTTuVi/rfpfak+/Z1ApjhKFsEB0p6qP4wYOOuE4dqWVHcBvWjIZLSAh/6i+kzvNidn99qTEv9ye5U8U9bmH0xMW40mEtbUz3lYalYJ0YfrRQVRXKdsfooK9f/H/QPHlegFpnwW63dMRBac0y49OoOdCViVT98bjHOAaBAFRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FwQSj+Arevjf2KS6yFNQQyXSOwzVDu7YgXqdMuQvho=;
 b=fLFOtQ6dqCQlVYa2W6g1JBeUmC7yAxInWUPi5eeBncima5oiu3LgmLfIaQMI9DrktTxJOxt7kNEot20WEJbPPkI50ZuBM72aUs5tpfkchiFPqJkD8UvgCWaNwPbU6vIlIItAvZL3hGwN70U+h2uSaHW4BUbYYKWXC/mrbg7srx4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: make embedded endbr64 check compatible with older
 GNU grep
Thread-Topic: [PATCH] x86: make embedded endbr64 check compatible with older
 GNU grep
Thread-Index: AQHYKWdr96DvHtmiCE6n5nuoqf1KFayifeMA
Date: Thu, 24 Feb 2022 10:21:56 +0000
Message-ID: <cced4ec0-f522-9273-b10c-0e652bcc5aa3@citrix.com>
References: <ceaae3c8-0c35-efc1-c7bc-f44364ce29e4@suse.com>
In-Reply-To: <ceaae3c8-0c35-efc1-c7bc-f44364ce29e4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41b8c0a2-f772-48ef-7a33-08d9f77f7c17
x-ms-traffictypediagnostic: BN9PR03MB5977:EE_
x-microsoft-antispam-prvs: <BN9PR03MB5977EDB5F0C0E6A88038BBDFBA3D9@BN9PR03MB5977.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IFvSDjWHvV3eDOvGGzOMHpDYp5liAb1Z5oQ4sCu1qVb9aAeFFD8tQl+5r1cYG20O9p78nMneunSVwjx4ieRXHGIywxVTeQlykbKjsMSXfwtDHifykTuWGb5DVBZHZfbei5ehHhSNANZlzEAs5Hk67htK9tAK0tdW4AD3o0dmBWZIY6y/rszUD72swsdIWJPM1qYim/R7vjHb5u6kQkAH8/D6QuWk1AQTaFxtlxtnTNWkUDG7EaBExLV8NFfWim/IS4p/89v6+kYdaEPTPuhsNI3V5xoFL9hdDRZOwFOEzPe9d4HAX/O8ZK5mB7i+GJj7N+TavnMZRaQO9Nx9x1qO1DVhedBQbixOYQNAd6nj3IhHWrCXWSCNVVkoYogkweqiYsYqHwPJepwbAu65Al3cpXtPsWcWVU4JaDqTfVN96Sp5CcxCbqkGaNFFmzy11CLDdhQYNDRbAn1VStIHWLCWCu4s4SaBoyv/DUeSzuPkdGjiGPUqLjxpDGUvj6ta3+0L9MTpwTUKaAsXbCM6J2/AjlFDQVtcLom4AITjwD7dqb/Fq61pLINczGkVrIb3QnesYP4sZyrLCDVgx5MefJAa8URDqj9GJImZBuy/tMnUX2sX0g727C57SMIMZHOjsr2vnLHt0tI9Pv56gEV+eWKn2U2FrmlViXCPKJLCxO6JpLlpkxEzrJDcZE877Dkz4cOOwZV6PR5/tpIg/jG51Ieg0+t81FDggVmBkpABLN4mPOgCeUl8m/0kEglvzTx1/E7Vz5LC4EK8KnWA9aK0XC2beA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(2616005)(26005)(53546011)(186003)(4744005)(6506007)(6512007)(107886003)(36756003)(71200400001)(5660300002)(110136005)(54906003)(86362001)(316002)(31696002)(66476007)(66946007)(38070700005)(4326008)(508600001)(76116006)(2906002)(38100700002)(82960400001)(31686004)(8936002)(64756008)(66446008)(66556008)(6486002)(91956017)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEZrL25CZjc2OElMeWR6c1I4Z256UTB3c0ViT1lqQ1RZMkhmTzJBSDFWTXBC?=
 =?utf-8?B?cHZmdStyL2hzNnUyOXdIcU9kckJmZDZSRTN1VHdLaEU2eXFnbTg3dXNpRWtD?=
 =?utf-8?B?YkYybmpWRFNrU1JMbmpvYnhxNmJWWDV6bEcvWlBvZE15YVUzbjlJRFMwWVZ2?=
 =?utf-8?B?dVZBODFvaFVsejVsQlQwMThHVUI2aUFvWU1oelNtWms0dUtWdENmTTRmWHJw?=
 =?utf-8?B?U3VjdHhxOTAremZHczlrbVp1NERuQmM5bEUrb1hIK1VXbEhVWEswWVBoZGhW?=
 =?utf-8?B?YmVJVmlkRUlYZkh3OGtTQUZ2SzR2SW9sZDdobmorN0s2bVp3a1FvMmo2cnhE?=
 =?utf-8?B?M3dRV2VONW02SmVEZ1ZaNnhLOFY3TWdsM1RzQkFGMmpPRDVyMStpZW9ReURh?=
 =?utf-8?B?aXZQTElhS3YyYWh1TkF0eWwvOEkxSExJVXh5OUpELzZISElSMXpDOVNOeTNL?=
 =?utf-8?B?K29uMitWN2tnOVV3K0R0aFZiVFAwYmZvaEpVTTBnQ1dFMHJLS3BwVWRlb2xG?=
 =?utf-8?B?Y1g3U1puOS9SR1NKRjhvMWtXK1pHcmNGVUtFeFM3ZDJnc3F2Rml5Ry84Zyt2?=
 =?utf-8?B?ak5pK251WmRIRCtiUy83MGxaV1E1SFF6Vy9PZ1NPd05acFF3Z0pyekFzQlJ4?=
 =?utf-8?B?Yit2ODJhMjlEQVhKTjlpV1pYMlF0MUFhS1J5ZCtEVHhRMTgvYnk2bmFKR2hQ?=
 =?utf-8?B?WnRWMkNiVkswckFmRnAvYVQ1dC84UU9lNzlTYzlYZnVscnJEN1FzZXlVa25m?=
 =?utf-8?B?M2xxNWpzdXRwdmI5Qk1pK3puaFRSaUVJUSs4Z3N5NEVibDh2VnBjUXgzQk5S?=
 =?utf-8?B?RldHWFAxWE5XNFR5UGNLVW1ZRE5iZFBNWi82K0JqYkUvYTVSZkNXcmk5SXdC?=
 =?utf-8?B?cy9XamhaaGc1N0NiOE8rdHRaUXdscitRUlB1WEtMNjBOemZZdFlUV3kramg5?=
 =?utf-8?B?VmhRMVZDNEhwZTFxZUlobjhrbm1KeVUwa1JCVGdoMGRScjNJeS9lbjlBVjlS?=
 =?utf-8?B?akJNODJZSEpRSVdYRk1nRjFIWDB1VWUveGxqK29CUTYwMktSMVYwZlRGNFJV?=
 =?utf-8?B?ODRwTHhQY3daMnRKMEhEdG9QSGo0ekU1WEw1U0VGVTF1b1ptbndLb01xQkpZ?=
 =?utf-8?B?ZHpLdXN4d3dPRzRTbEN0TjB6RU5jaHlCbEJ1S1lqUlBrVHR2YmliendnaGNn?=
 =?utf-8?B?N3F3OEN0ek1yVXZiS2ttZWJRbDVWOWtuKzgrNUJvN1dORlZRY2UwSjV0c0pB?=
 =?utf-8?B?Y3UwSEZjQWYrd05FZnVNemFER1VyR2RNQlozVnRRaFBRNGNqV1pSOE5kSWpx?=
 =?utf-8?B?eTViUGN6QjFYNktaTjRGbHhkNHFpaE1tc1p5N3E3RVY3WE5ZRXoyN2E3djkz?=
 =?utf-8?B?T0w3dTUzMjJBc1FrWUZvYWxhUVF0czlJai9DMzZpdTU2NGpkUWxtYW9tOFBV?=
 =?utf-8?B?aXBuZmc5azkwSkhydmwwZ0FkTU9WZ1RPeHB3NE1HdlVPbCtZdkg3UW1MTlYv?=
 =?utf-8?B?ZGUzMDFFdkFZWTFVckw2Tkxkdk11UUdUYW5UMENlejF0OHlVL3Ixa0ZLNzlt?=
 =?utf-8?B?Nkg3RWJ5S3o4TDFINVBRTHlPc3JTK2RnQVlVWXNoUGFVV0VGUW8xZjVPTHpE?=
 =?utf-8?B?bS9JbWEzb1EraTQ3WG5BYlVvckU4YlRWemNybkkvMmU2bG5yOFhFdDBCVU9p?=
 =?utf-8?B?bXZ4UWZGSWVYZllVKzg5cTE4ZUJKa3k0WkVOSW5lQlRGUmJUV1kwNXl3OS9Z?=
 =?utf-8?B?aXM2Tm9hbkIwNGFPVHBWTjA1SUJYZUFaSXZVUU9iOWczTWlOMHZ2RFgzNDQ1?=
 =?utf-8?B?UVIvcUxLVTlTbEV2Vm90RisrQ2lvakVmOWRkbUZ0cW50NnN5Z2F5Ukl2Zmcv?=
 =?utf-8?B?SmJueDg2NDErdVRCZ2FsU3Y3L2NFWmV5R2xQbGhKVm9ZVXk5ZlZiTWk1RWEx?=
 =?utf-8?B?Z2FDRERDTk9iUVBUYnJtMFVhNTRoanFDdzFkdzRkWEx6dnpBTFRUbXNLb3BL?=
 =?utf-8?B?STdjMlRDUlF5ancxQkEyVkNWSWIybVVDY3JjSUpleXVTV0MyYkNhRHg0dXZj?=
 =?utf-8?B?TmYxdVdMMmZsTGVST2ZYK0lRT01VdThVeDZtZ2RoS2RjUFhFV0Q0a1J0dUJr?=
 =?utf-8?B?TGNYZHhoK2JKZGhwWmxkdUVuSzcydGkwdWhQZDFXcnFaSzJzRnRmVW11ZEVR?=
 =?utf-8?B?T0RCR0NyWnpUemxhMWRrU3lrQ3NBNjEzSGlNVWlEK0NzMVhpbms2My9ISzRl?=
 =?utf-8?B?QkkveDJoczRlK21pdkFBd056blVBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56944AD7B3533B43853EA5D4235514CC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b8c0a2-f772-48ef-7a33-08d9f77f7c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 10:21:56.3675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8g/XYEblcPda+tkZkyFn1LVAFKsKReQEwzNmcJflZdHdhByvA+tzsjPQz6JZ4Awzt5sI0Ik4jIVDhlFj+5UJTe9fprq42blIKu4tjGVCzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5977
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxMDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdpdGggdmVyc2lvbiAy
LjcgSSdtIG9ic2VydmluZyBzdXBwb3J0IGZvciBiaW5hcnkgc2VhcmNoZXMsIGJ1dA0KPiB1bnJl
bGlhYmxlIHJlc3VsdHM6IE9ubHkgYSBzdWJzZXQgb2YgdGhlIHN1cHBvc2VkIG1hdGNoZXMgaXMg
YWN0dWFsbHkNCj4gcmVwb3J0ZWQ7IGZvciBvdXIgcGF0dGVybiBJJ3ZlIG5ldmVyIG9ic2VydmVk
IGFueSBtYXRjaC4gVGhpcyBzYW1lDQo+IHZlcnNpb24gd29ya3MgZmluZSB3aGVuIGhhbmRpbmcg
aXQgYSBQZXJsIHJlZ2V4cCB1c2luZyBoZXggb3Igb2N0YWwNCj4gZXNjYXBlcy4gUHJvYmUgZm9y
IHN1cHBvcnQgb2YgLVAgYW5kIHByZWZlciB0aGF0IG92ZXIgdGhlIG9yaWdpbmFsDQo+IGFwcHJv
YWNoLg0KPg0KPiBGaXhlczogNGQwMzc0MjVkY2NmICgieDg2OiBCdWlsZCBjaGVjayBmb3IgZW1i
ZWRkZWQgZW5kYnI2NCBpbnN0cnVjdGlvbnMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkxvb2tzIHBsYXVzaWJsZS7CoCBUZW50YXRpdmUgYWNr
LCBidXQgdGhpcyBkZWZpbml0ZWx5IG5lZWRzIGEgZnVsbCBydW4NCnRocm91Z2ggQ0kgYmVmb3Jl
IGNvbW1pdHRpbmcuwqAgTGV0IG1lIGtpY2sgc29tZXRoaW5nIG9mZi4NCg0KPiAtLS0NCj4gSWYg
d2Ugd2VyZSB0byBmZWFyIC1QIGhhdmluZyBhIGRpZmZlcmVudCBtZWFuaW5nIGVsc2V3aGVyZSwg
d2UgbWF5IG5lZWQNCj4gdG8gc3dpdGNoIHRvIHRoZSByZXNwZWN0aXZlIGxvbmcgb3B0aW9uICgt
LXBlcmwtcmVnZXhwKS4NCg0KV2UgY2FuIHByb2JhYmx5IGdldCBhd2F5IHdpdGggLVAuDQoNCn5B
bmRyZXcNCg==

