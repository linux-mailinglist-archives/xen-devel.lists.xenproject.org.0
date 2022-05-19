Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68A52CF40
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 11:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332794.556561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrcL5-0006JI-4U; Thu, 19 May 2022 09:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332794.556561; Thu, 19 May 2022 09:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrcL5-0006GG-19; Thu, 19 May 2022 09:20:59 +0000
Received: by outflank-mailman (input) for mailman id 332794;
 Thu, 19 May 2022 09:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/A1r=V3=citrix.com=prvs=1312ac95d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nrcL2-0006GA-Ti
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 09:20:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa611338-d754-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 11:20:54 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2022 05:20:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MWHPR03MB2525.namprd03.prod.outlook.com (2603:10b6:300:b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 09:20:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Thu, 19 May 2022
 09:20:48 +0000
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
X-Inumbo-ID: fa611338-d754-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652952053;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xX+CmuWrdjZ3pZxe86LUf+HCDOnuKvTuKvSKG1d6y/4=;
  b=frIAW5g1zAB3vUztOVwpw5LWm54bB3AMjlSL/34cBK5uEObgpT6dLOgo
   w0P4zbr3+JUzrpz9M1qXDEAve8lye6cs/ykExGUxS1hwTjdhe1rJqkpx8
   +M2rvPTs1A64CLI3Ruj7MmSxjr4HPpR1u+DzCqaaaIdIHsDo1+D9tcb2X
   g=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 72072189
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xyqpJ6CiFum6KRVW/+Diw5YqxClBgxIJ4kV8jS/XYbTApDsihmQHy
 2sYDG+FbPnfMzT9c99wbI2wp05XuJCHy4diQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgh+
 PFsp6GgFzsPM4PGxPs6Cz1RHSthaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcH80m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLGcA9wjM9ftfD277ziBLzafDCNjsfMGjf+lwv2i3v
 0LJ1jGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW7xHEXCRAQfUu2p7++kEHWc8lEN
 0Ue9y4qrK4z3E+mVN/wW1u/unHslgEYc8pdFas98g7l4qjJ5UCfD2sNTD9EYfQnstM7QXoh0
 Vrht9DkGz1p9qGUQHS197GIoDf0Mi8QRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ikcQlr7AajMpO26Dl+1nC2miovsKQEVJz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:wrt5Hq7ul50P1tvqhgPXwZeCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+873WBjB8bZYOCAghrnEGgC1/qv/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIUurIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonSs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaAkEyzzYIbiJaYfy+wzdk9vfrmrCV+
 O8+ivICv4Dr085uFvF+ScFlTOQiwrGoEWStGNwyUGT3fARAghKS/apzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jdiuCQlGc1sRKEkjQpo+a07bWrHAUEcYZ
 xTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYEit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tTKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG6fIx8Z0Wb9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqbJbp0
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="72072189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frg66Mmbbb6XL3x/n3Q/F4eBVC2eh5Ohr288BmZQIMAoP5MmwVCWDZ8/ERhDzb99vcByxG3nNw8gJy9WJRKWv8flxgVguBZf/1Q+PwnmQLVuMT2BqET5d2B/m+BQqTPXaT50bzDIUPHVt/dvnC6E8IOECg/wbT2IEvXZh6/Afqba+FjXpLa2AncduUT9ZiBSYCkCdJdh/6aRXGb3Glx+aJjKFVeCHcDMMZSOsVr4s9soBsoPtCvKsuY8m4vzhOA4E9eRqaxudiJEO9bPfjwm1CdmtE224I5iVRmQS8WXREC54fZLBcy7z3VF40gvWEh9zH3yEqaUFEiJrZGIz14jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX+CmuWrdjZ3pZxe86LUf+HCDOnuKvTuKvSKG1d6y/4=;
 b=QztCRGiwAJy29VxXlqylV41J0rYw7qvwvWPhmbKn+ztatlFhF48Yw/2dNOjmNq0vGsPRx+pI3HA2aCycXy4NEastW44OlELul9RgL1JyZzcACCf+4IvUDQAOmuh81dtz1jDltqCxDvTNv21BNneuzYSOh3UcRjFEskLr4Ol+yVY4Uqm24HbRnlG97bQ5Zjrvl6mmFEvNSn6Xu+9EKvFzpgz3EFSQcNR//mdYyl5uOlKHzkMB7zgCaEcRSBWLmGHjkzLbKnyRTrNdACUi5lnkeVQSTMJI5wAbXFtcJoYUkvztVWoLzvhzNT3izjdLayS4CiS2xVJmB9gOdSANEBlIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX+CmuWrdjZ3pZxe86LUf+HCDOnuKvTuKvSKG1d6y/4=;
 b=mNXjwXaX2qT53OX/FTQeFFRN0As4ZjfWBkhgH+srik4ZScgBNKXJoFCDp0aRyiYQZq3AbHiO42lAhsvREnhS66t4FXdsfgD/FBfP7RiPaOmI+oIj9ur6hB/0w8w9KHhzpyv9qALN5jT0x5JZcvdQaN4aiuqVobs45AS2NZaxGzo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Roger
 Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Thread-Topic: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Thread-Index: AQHYafEfUx0WfCMplEq6U+wPIyhlOa0lVccAgAByO4CAACeOgA==
Date: Thu, 19 May 2022 09:20:48 +0000
Message-ID: <590b57f6-75ea-73e4-5267-b2ec63be9f97@citrix.com>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
 <ac220eee-937a-bedc-509b-bcc75b376001@citrix.com>
 <f5001ec3-f0cd-dd9e-a18e-c7e5788c0668@suse.com>
In-Reply-To: <f5001ec3-f0cd-dd9e-a18e-c7e5788c0668@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bce2d61c-9981-4345-e74d-08da3978dca4
x-ms-traffictypediagnostic: MWHPR03MB2525:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <MWHPR03MB25250227FA87DE5EF42098CCBAD09@MWHPR03MB2525.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JMjpDd0IMth9qMJu2mJGGN/OJHXJQ/9sGe2hfihZfnFz4lVu07/CNIieEbCkhxCZK/gb8iFu2r3mzWhmOvbJLPp9s76aXR8XztgKh+tJrTLf4aKZXKb23n0Vl4Hi4pz+5tkKygv5BgZ5Eu78df/TVyYZbJ3bHzl0M27emlrmdVB1EDgKm6Fu5LsM8VCMTWbuDq0+HzFqrIFcdpsKknKh3MU+EG1mDbK7ILne9NcHkx9RoepEaWCfyJfchKdDqhksFVDealEYmT83mnOJYkVs6ZUeywUlULk5bKKWX9Yp46aZ/xq+4e6167NMx0r5ZZf3256plwnW57RvAWRJ+TooXW9OWK5E2e0JiGnxxV8IZDl0Qt0uuEDFmN9RUA8b0XuVUpg30NaZEi+FKEyBtWTdN2WbNXPwQxKsKUWdO16CghFKD5hxCRdHpmg+sVRvimtAL00pXTT+o5P53IvZo4kGXL6dTSShN1pTHjHXOsIiBPYdnr3jkNN+Ro0cN30L1HyVzMMZSx7KFwBMpZDk/ATfAV+FVvEkOV5In/RZDb08tu/yjbSuo7c2gFsLQPXqhWtqWdHRyU4+rRbIfKt7ClTps9i1DtUvd9xz2InbCCBejW96UQ3eYEsCRMsbXLWnVOuaVoXYdoYhpOhCfGgW2L+NY72dvRx171tm0xUHxY1TqjblpDwZ9LmbqIIWRL4iuWlV4pjwT/1BjM3y9zwRZOlOSASZ8YDZDRtt1Q87I9ZbV9Nq9Mnt1fG1jVgie8q+YfQ+LVRAXxdBY4OEWwnIxYJf/A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66446008)(53546011)(66556008)(64756008)(36756003)(55236004)(91956017)(316002)(31686004)(83380400001)(6506007)(5660300002)(2616005)(71200400001)(38070700005)(8676002)(4326008)(82960400001)(26005)(31696002)(6486002)(8936002)(54906003)(6916009)(6512007)(76116006)(86362001)(186003)(2906002)(66946007)(38100700002)(508600001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eERpU1hWdHlWM0pzcFJlTWVMbVJ5MG1udDVVUHBPVkY1WkFPNzlINXgzU1V2?=
 =?utf-8?B?MGMzVnFmWEgxWVg5dWh6VlptRDJMVWtyS0V4ZDNCR1cxMkJtaWVzMUNpMTFa?=
 =?utf-8?B?R2E3VXA5VTRyamVkU2hwUVJFMERQWm1xTWh6VWdMeGJYMWd3WkJqdDkvYnRl?=
 =?utf-8?B?QWszSUxPR1d2MFlPR2xqcnFPM2g3Yk1MQWEvOERHYU9UU05wa0M1bTRGdUxo?=
 =?utf-8?B?OGdTWlZPcDhpN1MrdjhxSHNoSGhyMXBRRU42cDNxMDBkTGRacWpXUGFRYnNM?=
 =?utf-8?B?RGpYTEl3QVJXWUo0RXAzbjhwOWxzUnMzSmZBMEJsYmErWENtbUpWZG4yNG9z?=
 =?utf-8?B?WVBJemgxbGhKWUxHK0s4bk5SZ3Zac0JsaTgrdnlab1NnTWFMb3phOHpha3Q3?=
 =?utf-8?B?dXJkQWhmaFVxSjFoLy9ibXNVSTcwcHFCdFVzOC8xNjVrK0dMOFZ6YUFiVk5Q?=
 =?utf-8?B?K1RzM0lIeE1oM1p5RU0wald3VnkwOUs0aGlFRmxXa2hGdURicm1INm1FZk9r?=
 =?utf-8?B?aEF2dXBOVTAzSUYvS0JUKzlYd1pKVHN3S2JtSWE2c3ZVVndxUGhSZ084bGI5?=
 =?utf-8?B?MkI4OC9ZU1hKc3JUc09xM0tSd05zQVN5QXU0SGkzQkRGeFdqM0pNaTRsRFJC?=
 =?utf-8?B?ZEE2bWZoUU52SzNIK1hDbGRKMEZ1eXRYbURCTWdka1VKQURJYUxvdzRiOEF5?=
 =?utf-8?B?MmU1bk5wNDZRTkJiV0E0OUg1S1NJbmxNSTVMbFhrS0FXblEydzJ1MHhqWTQw?=
 =?utf-8?B?ZS95Tk1GblJsbGQrV1psLzJOSFRHNWpDbHBOb2ZMVDdVODJobTVrRUtpWmpT?=
 =?utf-8?B?MjFOWURGQUxIeHBIdEp0c0JBUEJ5NGVOa0FHb0pQLy9NQjJyZDFUTlNhTFpG?=
 =?utf-8?B?clFFc1k1cEJ0YTV2SEIwRWUvMC9zUUIyV2xQbEN6a1B0ZkhMQStKMVQ3KzlX?=
 =?utf-8?B?OUVtb3lRV0tOeXVhWFVFVSt2b0VFTGhrNG1FQmJUM2puZUF6NU5kOFdhanJV?=
 =?utf-8?B?OWs1Y0hhOUQzd09PQVgzeW5KNjlhUUtsS1JqY3prZGpVMkhVSVEyNWFyOGZn?=
 =?utf-8?B?b2hBczEraWFoaWFCSUloTytReEkrSzNVU3QxNmJ6RHd6ZTY4OWlCT3VWNWJH?=
 =?utf-8?B?U0Y0YlBjZWdjUGEvR1k0MHU5K0l1cjd1UlhoQkcyT28vZGVXRUo0ckNBMG9a?=
 =?utf-8?B?cGxDdEp5ak9Ga1BkWXdvWjdvOGt2UmRpUzVRNVg5WE94K3lpcXhpUzhsY05p?=
 =?utf-8?B?RWpGeE1QZXZ0UUkvb2hUazhMdGU3OTNueGNWWURQdEI5YVRPcEJzeTZSTkZq?=
 =?utf-8?B?cU9NNE1aak5sWmwvQXRtTkhSWWZOTTh0cTZwQW1xcENsMDk5M2V5WmhJUWRr?=
 =?utf-8?B?cWxQTDVDSXFtUnlhZUNtK24vcWlNcUNtSUIrZWM4Q3BPeWFTZDhqamVIOGV6?=
 =?utf-8?B?TVlpZzc5UkNlVGc3UHJMVWlhZkxCOGVDV0NJSEJwUVdKUTVybVlKUzhJaTJF?=
 =?utf-8?B?V0paMlErV2QvQUVLWE1XenZMWCtKY0VKUlVJbXFNZ3B4TUVWd1gydHJDRFdS?=
 =?utf-8?B?eVRGUU51cnZFWVlTWVBRSEhJZ1N5RG81VHJBcVIrbDAyc2l4TUhLQSsyY1dh?=
 =?utf-8?B?a3ZUQTBjVktuWTFoeXBoaDFncEh6bW9IaGxrUFJFQXRIM2J2R2JyL250Y0pn?=
 =?utf-8?B?ZHgxZGtXWW9Dc0hqNzhDRGZwa1hHUU5Ya2VRY3RiamR4dUM0RkVyd0ZrcjBM?=
 =?utf-8?B?RVZhTVhrWjRycnUvNEY3emw0akd2eFRiMkVIV04va3lEY1dQTks0eWllWURi?=
 =?utf-8?B?cVpNZ0dYbjczWW9kTUNjQXpiSVRqYXBsSmVlTFpGRU0yYmgyK2NSRDVKSTlC?=
 =?utf-8?B?RUpUV1cwRmtrOXNrRkNhYlNEMjBMZUNzUTR1WVF6dnhIV1hlSFRtM2FabE1S?=
 =?utf-8?B?YWR3ME1Pa0tsUVRQRHM3UUZYUHkrWVJudDVsZm5EY0lkUXJNcnVZRm1ndFYz?=
 =?utf-8?B?Z2Rwb25NdU5OZEV0UlF5UHVkaDc3ZU5rem1CZ3R2SExMd1BXUS9IMzRKM2RS?=
 =?utf-8?B?NDlzTCszNWw5MURoSjh3UGxlK0ovaVBEaTZvaWRWd0E0QnVraGxxTjlTRjV0?=
 =?utf-8?B?R0ZNblJoTWZnRWtEV2w5bExZSDgySllLd1p6OFpDTmR3akkxeWJyUGQvN3VC?=
 =?utf-8?B?NmVGNGI5L0tmbmdGOFFyeEN4WnBwbE40ZHF3NGlIT0paMmhPQ3E1UHZVTWl1?=
 =?utf-8?B?dk16WUkzVXNVajdjNlBYd0FBOUR4R1Q3ZGg0dWZGSzNuL0RuZFlOcE5WWndL?=
 =?utf-8?B?ZVE2RTZhY2dwdnNSRTVadmF1WWJvZnoyL2VZMDM1Q1dlbm1pM0pOZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89AE616AE100C644BA2CB1F1989B0A53@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce2d61c-9981-4345-e74d-08da3978dca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 09:20:48.6531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iM0BG3VDsHIHl6OaWCfTOCJg5T9CY8K1MCzORJcCO268+USoht/x/cpcb+74wRXDNiO+/4WKS7RYx9PVfxYHlAZS9wDiBrXOeBji1ACuxn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2525

T24gMTkvMDUvMjAyMiAwNzo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE5LjA1LjIwMjIg
MDI6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNy8wNS8yMDIyIDE0OjIxLCBSb2dl
ciBQYXUgTW9ubmUgd3JvdGU6DQo+Pj4gVW5kZXIgY2VydGFpbiBjb25kaXRpb25zIGd1ZXN0cyBj
YW4gZ2V0IHRoZSBDUFUgc3R1Y2sgaW4gYW4gaW5maW5pdGUNCj4+PiBsb29wIHdpdGhvdXQgdGhl
IHBvc3NpYmlsaXR5IG9mIGFuIGludGVycnVwdCB3aW5kb3cgdG8gb2NjdXIuDQo+PiBpbnN0cnVj
dGlvbiBib3VuZGFyeS4NCj4+DQo+PiBJdCdzIHRyaXZpYWwgdG8gY3JlYXRlIGFuIGluZmluaXRl
IGxvb3Agd2l0aG91dCBhbiBpbnRlcnJ1cHQgd2luZG93IDopDQo+Pg0KPj4gQWxzbywgSSdkIHBy
b2JhYmx5IHBocmFzZSB0aGF0IGFzIGFuIHVuYm91bmRlZCBsb29wLCBiZWNhdXNlIG5vdCBhbGwN
Cj4+IHByb2JsZW0gY2FzZXMgYXJlIHRydWx5IGluZmluaXRlLg0KPj4NCj4+PiAgIFRoaXMNCj4+
PiB3YXMgdGhlIGNhc2Ugd2l0aCB0aGUgc2NlbmFyaW9zIGRlc2NyaWJlZCBpbiBYU0EtMTU2Lg0K
Pj4gQ2FzZSBpbiBwb2ludCwgYm90aCBvZiB0aGVzZSBjYW4gYmUgYnJva2VuIGJ5IHNvbWV0aGlu
ZyBlbHNlIChhbm90aGVyDQo+PiB2Q1BVLCBvciBjb2hlcmVudCBETUEgd3JpdGUpIGVkaXRpbmcg
dGhlIElEVCBhbmQgZS5nLiBtYWtpbmcgdGhlICNBQy8jREINCj4+IHZlY3RvcnMgbm90IHByZXNl
bnQsIHdoaWNoIHdpbGwgeWllbGQgI05QIGluc3RlYWQuDQo+ICJDYW4gYmUgYnJva2VuIiBhcyBp
biAidGhlIGxvb3AgY2FuIGJlIGZvcmNlZCB0byBiZSBleGl0ZWQiPyBJZiBzbywgaG93DQo+IHdv
dWxkIGEgcmVtb3RlIENQVSAvIGFnZW50IGJlY29tZSBhd2FyZSBvZiB0aGUgc2l0dWF0aW9uLCBh
bmQga25vdyB3aGF0DQo+IHRoZSBjYXVzZSBpcyAoYW5kIGhlbmNlIGtub3cgd2hpY2ggSURUIGVu
dHJ5IHRvIGNsb2JiZXIpPyBBZnRlciBhbGwgaXQncw0KPiBndWVzdCBzdGF0ZSwgd2hpY2ggd2Ug
d291bGRuJ3Qgd2FudCB0byBhbHRlciBmb3Igbm8gcmVhc29uLiBOb3Igc2hvdWxkDQo+IHdlIHB1
dCBhIGd1ZXN0IGluIGEgc3RhdGUgd2hlcmUgI0RGIG1pZ2h0IGV2ZW50dWFsbHkgcmVzdWx0Lg0K
DQpXZWxsIHF1aXRlLi4uICJDYW4gYmUgYnJva2VuIiBkb2VzIG5vdCBtZWFuIHRoYXQgdGhpcyBh
cHByb2FjaCBpcyBhDQp2aWFibGUgc2VjdXJpdHkgZGVmZW5jZS4NCg0KSXQgZG9lcyBoaWdobGln
aHQgdGhhdCB0aGUgbG9vcCBvbmx5IGNvbnRpbnVlcyB3aGlsZSB0aGVyZSBpcyBubw0KcGVydHVy
YmF0aW9uIHRvIHRoZSBtZW1vcnkgYWNjZXNzZXMgaW52b2x2ZWQuDQoNCn5BbmRyZXcNCg==

