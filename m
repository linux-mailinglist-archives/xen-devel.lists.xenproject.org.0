Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1E416161
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194345.346212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ0I-0001Rx-FD; Thu, 23 Sep 2021 14:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194345.346212; Thu, 23 Sep 2021 14:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ0I-0001PB-CD; Thu, 23 Sep 2021 14:47:14 +0000
Received: by outflank-mailman (input) for mailman id 194345;
 Thu, 23 Sep 2021 14:47:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTQ0H-0001P5-Iw
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:47:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22b821e0-1c7d-11ec-ba4d-12813bfff9fa;
 Thu, 23 Sep 2021 14:47:12 +0000 (UTC)
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
X-Inumbo-ID: 22b821e0-1c7d-11ec-ba4d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632408432;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=I1WD2uBaP9UhrpSJiu2bDrjKH0zg5LHi1uv+Q9MdDcc=;
  b=ImSEM4B9w89vR8EM/+Ou/Di2/oIZZ0MgbQxH9TlqLva3/OtHw7yhJghK
   dOrnN0ByZx+ns0B/Ixv5E1jyB44TBBIq36qtHTQE4YNFQmAzOv6YkA8Sz
   nP+rHfu/k1QUMMsELqcyE71zUOWK9yA0/cI0l5XoSvWfIXSr2rVSZDbRk
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B3AR+bnOGwQjmySAzpHcklR0xQAQrUN/O3/aazgL2TbBBL28QQRZ/ygrG9VyeTAa6r8MgW7106
 DXJ6lNUEe8Jes7pi7Kwsty02AgI9RY3T8urNKEKseXwZnrN782y37wyxuqmzct8c6W0TmvTuVf
 oCyVnwIZh2Ii+qNmXsQlYVneqh2FNmK4PV5j0q7aYiW0QQXAEC1o4WPCT5aeb5qtpW6mJpxX+W
 PJQJJIaDsLqGKhPbsm/QexOn+GikyoHoT4RqOsO8SHy19iAnBEOLiX4Yg5o+BpdvBbRas+ygSW
 xb8x+Z+GLv373w1ddlrlVU5T
X-SBRS: 5.1
X-MesageID: 53045020
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oOP+5asUsKlo8hJM4UIFsdKNDufnVK1ZMUV32f8akzHdYApBsoF/q
 tZmKWuEaf+OYmrxe95wbY6y8k0Bv8SDn9E1TlY9rns8FShG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524PhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npljc22cA0iLJfwu6c/FENBFiZGA6Eb0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sWQauGP
 ZJxhTxHYAWQYSBjMVUrK7l5u+ilmkDmcSxCpwfAzUYwyzeKl1EguFT3C/LWd8KLQ4NJn0+ej
 mPA42n9RBodMbS3yyeDtHSlhebNnCbycIMUCLC8sPVthTW7xGYeFRkXXluTuuSihwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhp4LvPDZkooepajG/se2NqDSKByRIBDpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93dl2u9N5SIf/+DipwmW3m71znTcZlNtvm3qsnSZAhSVjWJPT7eh70TSpd1EJZyQJrVql
 ClZw5XGhAzi4JfkqcBsfAnvNO3yjxpmGGeF6bKKI3XH3272k5JEVdoMiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+To6+DaiMNYQUM8kZmOq7EMdGPxX4M4fFyhRErE3CE
 c3DLZbE4YgyU8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCT9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJIdc4wPgFyrmSr
 hlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJ+NPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:SfJSiqAbZ5JHrynlHegksceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVaUiz9bUN1K9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2n46ctHNVA7dw6MLmK41r2MFvx2VKpUCfa/Z48SgfwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53045020"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqlSdH62Qjh5sNdzkN9936gC8TJo4m5EJuFt+sI16l9/+EgscX+yyHZVjY4uvqLUo2q5CZaqCNQMa0C4zmtYwG7eVj1bLAayfawxBqb9a8KxRMH+X0HndK3mdwlJcGq8oW0N0dZXURvqIGM+xMisvz2QXbunogbOJOCcnhdqy90/26x5p1JOX4wWmeMEuiHAWqrHmkx5ybLzWimpr6SOtpb2lohTqRs71DX05FxKPZGt87ltaUlZSjOp/zaBGsFHVyW57T73BU/9V4+Mex06+xN6SRirRTyllCwLBVOFHUP+UWIOpOUzjgasSZLdEDKpCn0Y9yMC6TsDKg9GfkjtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mC3GrvuImFn6pBisvCaJpoOGz0i9QCI0i7xjXQmqFC4=;
 b=MWgJ5gfBYh7NX84LIuclejAj9jJlphi4HW5xu9y3UPZcoVDMmRc6FyQuAhDXiBrfIKAGx+vg3QjSpdXuF4Np7AXCfFdtpz8ZZgScALzhpYa1/7D1yV28BlGxI4drI7b356XNAlO8R46ud9PldKbfpHQH20+iX585GzUli6F72mGyAl52qSuQqSWheRD2oKiFBHt0kiUxGfXjGsp+L+mzdDFFj9lKF+0n/IF+ncRr/2Jd9DLvb3W53tKoWqEewJVsQVug9qbYa27qYmki1kH/xCiajgJazCEgTH0ihpzGBszMgSWrnD3gUG3HXPiPj4205TlrR0hq/LgL7PL09+21Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC3GrvuImFn6pBisvCaJpoOGz0i9QCI0i7xjXQmqFC4=;
 b=TTx3N7qksF/H+NL8ia8+9K+gSV5WJmimvI/3FLrACSaNhiR7azQVgx0KLkJxhqiPnR6CqXcNImfxV/G4ufa3VHG+BvfOQyLF9YR6oaa0jwUT2HvdDCKz5vldqBX3O0bWa9wsoPdJTmUP/qKOwC1toWUfhZYCpNYUPyIDXfqDuL8=
Date: Thu, 23 Sep 2021 16:46:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun
 Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 8/9] x86/HVM: skip offline vCPU-s when dumping
 VMCBs/VMCSes
Message-ID: <YUyTXJacLZi0ZmTm@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <5cc8f7e0-399e-f6a5-bc84-823a6160a3f1@suse.com>
 <YUw5babRHdk6Jh8E@MacBook-Air-de-Roger.local>
 <b1c14b85-e65a-d563-bf51-0cb4483fde0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1c14b85-e65a-d563-bf51-0cb4483fde0b@suse.com>
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02223062-c060-4ce4-b9cf-08d97ea0fe70
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4764A436760EB8E293555BD18FA39@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYoIK6XZ/NEwFQ8MgG/RROV/qL88ikGYhagmts7KlNib6u5Q5J4guqRVZ4Qdb65FmZBTDYovuS/OcyHl+Yq8e19wPxIRhuT0tsnUB3ncAViEMPaQx++jNR9SBFjLaVFU3b2gAIv/cz/kpVvlLGbcxhAqLSfKr85obglR3SWym+T8MxS0lHOyuAm5k8peSqZBZr77sUAoIAVGPF42oh61TKRY6c4IMehxInkx0nUgsHeGQdpwPWY5UR+A9WoL+PtNJvX4Abcj1Ac7lLz9+Fr8kxE9ZTdGTVyLL8To2gUWqBmQ6viz5NIEXQFgzCEa5Z2Re8LzTmJYQjiH4uLF3EfimVvwTHbeqgXBGiECikIIVtZU058INfkdHNaxlKAecVeupK9cGaYsp4qNRDlv0MeNdFE3n0L+owZahoC6XxnFXAppaxRpaxRV/thbetLCjHySIvCoe/vF1QtPmtmzEWNwARXFEAwU5b5SVXFrbqpWnNG0eRJj4lWD+k//NiSXsDuyCnArpjqdbLXhjoiEw1zWDQ2Amc/x+GiZ8gYEQzYpFg2xeIECoGGQGArH+5qUkewLwSfgZb7SHK6edjXrt7uwC1RUoHKLU6Cwck/c9MbtCsCTuwtlhPFSXh64FGP/2Bk0KZrDeORrc+2MqktrdQ9cNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6486002)(5660300002)(26005)(2906002)(956004)(9686003)(186003)(6496006)(6916009)(8676002)(66476007)(38100700002)(508600001)(83380400001)(66946007)(316002)(8936002)(85182001)(54906003)(86362001)(66556008)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WStOOTd1NXFPYTRGMU0xbnVXWDhNcmd4OHVGMFRTL1ZRcHMyM1hJUEp6UnUr?=
 =?utf-8?B?ekhwSnFSQWFNenFkaUFLMzM2U1dobHcrcmFIZ2lXdmkrVzB2Uy9DTmxkNzRu?=
 =?utf-8?B?aWhGcE9GMGxxTFN1emdFM1JreSsxeVI3NXFrN0RLYVFMYVU0S2pFMXk2bDQv?=
 =?utf-8?B?SjYzOXhvWHc4dmNQQThTOXp3dThMcnVRaUE0ZUhXeURjcW9uSXozRTlnTTVn?=
 =?utf-8?B?QmhyVS9kdElBdXlPdkN2MXlNQVRNOUJJSDVlQTlzUjFZeFdhNjYzSHpzVU5p?=
 =?utf-8?B?RUx3SE5jN2lzNEdQb2dOa3lONFVpM1FNaXZROWVtblVjVmNSQ1QxS1Rmb01n?=
 =?utf-8?B?T3ZDTjJxSnlmQ05yeEp6Rkxzd1dobWg5TzVWS3dFODhaY21FQ1J6aDRBdW8v?=
 =?utf-8?B?L3YzTFdmZDJLRk1reEtuVklQS1BxbjJvNnE3WXNraHpvZ2MxRDVYRFJiNWxi?=
 =?utf-8?B?RlRjcVp2Sm9jM2g0QXloWHMrc3lVSGRERGxFSkNDMkkxcGkxck4vQitpbDFr?=
 =?utf-8?B?ZkRBSDZhV2l5NmFaUDJtbVN2Z3EwYTIxeEdla2JPNlQyWkllbmJIQjhLanNQ?=
 =?utf-8?B?MmRTVklvaWlvdlNNNm5MS05EbEhNZ2R0d1JBU000RFdHYVF6ZkFRMGt6aDZQ?=
 =?utf-8?B?Q3FBQ0FVR0xwRXp4bklPK3hjN1RuVDRsTmtyek9aVTFwVTNFUG9JcVZFZVJi?=
 =?utf-8?B?ZDNzM2hkeWR4ZTB4eFU4dWVBMVlCT2NxUkFudHE5U1p5eGN5aER1MG1DRldi?=
 =?utf-8?B?MFN4WkVNS2t5eFJPZ3d5UHVoMGVBc3NhOWZKWVVEN2VrY0tDQjFrM2Zxc21x?=
 =?utf-8?B?bDU1SXZRTWkxT2NUSmNqcS9IRGxCNDNYSXgyQmQzdlMvS2laMGZJcDZsYjBv?=
 =?utf-8?B?TXJnYVFudVF3YXBBZ1dDb09aVlJLMENWdnFMSlpZRUd0MTUvYXMwbHVRZ0dT?=
 =?utf-8?B?MkFwcDNQcUk2bllYUXllRTRPbCtJOC9wdVFVL0p6cU9QSW93VUJkYzhpaVc1?=
 =?utf-8?B?R3BENlpGZGRsZTBPMk1nUExVTjNnU1lId3A5V2ViVzh6ZkdPblV3NzBuS1Vw?=
 =?utf-8?B?SVFmRkZRelZOWmUzMmd5NXV1dm53VkRuWldrL0h1Z2h2Nlk3ak56cW53dncr?=
 =?utf-8?B?NkxYZXRZSDEzeU95dmJ3UzdScWtXRHQ0eFFTUldOZk8vWndVaUJsWXR4Nk9Y?=
 =?utf-8?B?ZEFtQjRRZnZ6QVJyUnR0Z3NITlhESUFLT1hiYnE4cWVDMG55V1VqdFJhQVJp?=
 =?utf-8?B?Q3BxYXhnWTFJc280WE80MngwcG9KaHBKZ2U5aG1ub0F3QkNTdzV4enB3Z0hw?=
 =?utf-8?B?cUt3YTc5OW5lQWMwQmxHUXgyc0xya0tGdUVwU2ErZFVscWRDTXhKajRNS25o?=
 =?utf-8?B?aE5BdlFUdWx0NVFxeVFpTDNBQ0loVDlEcGpSTXhueER6RTBqSzUxN0tpbVgv?=
 =?utf-8?B?dnRRa3hXRkRpQzF3UEtzUFBXM1FSUlBKZmYrZUZ3ajVYZFlYN2ZLUksvVXVi?=
 =?utf-8?B?UnhxVmVWMSs3ekpaYzRlNjlkOXZxZytTWWtmT2QvODltdmc5czBOdUpJTFBk?=
 =?utf-8?B?RmlpV0hCQlpkYk1ueCtVYVEwK3J1ZUc1bUZsQVR6eXdMMEZEdGtQdll3Nzkw?=
 =?utf-8?B?SEptZ1I2QWcvMTdIc1VBQ2tia0I3ZlpPZ1kzdS9mM2drd24vNXFWYUljRWVM?=
 =?utf-8?B?VGhtdGlpOGFRTUE5OGl3ZG9jaDNGWTdMbTluZ3RRNFVpRzZlYXkvZkU0dE5N?=
 =?utf-8?Q?U3Jk/sXlH+8qzqUC+7g6vNOpHN7EyXsYqRSVYuS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02223062-c060-4ce4-b9cf-08d97ea0fe70
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:46:58.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdrMrAXle0IsTRutQtaEA83ejrN4TOW0u2sPBkVRyVQDlxuGOoq4GWPz8CaS+60Nw7/ZLpUzZYrj34T0btU1Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 01:27:30PM +0200, Jan Beulich wrote:
> On 23.09.2021 10:23, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 09:20:32AM +0200, Jan Beulich wrote:
> >> There's not really any register state associated with offline vCPU-s, so
> >> avoid spamming the log with largely useless information while still
> >> leaving an indication of the fact.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Is the state cleared when the vCPU is brought down? Or else it might
> > be interesting to print such state for debug purposes.
> 
> Hmm, if that's considered to be potentially useful, then we'd need a
> key different from VPF_down. HLT would leave state in place, and the
> INIT/SIPI sequence would clobber prior state also only on the 2nd
> step. v->is_initialised may be an option, but gets cleared by INIT,
> not SIPI. Any other ideas?

Well, I guess it's close enough. I also wonder whether we should do
something similar for PV, where it might even make more sense as you
can upload a vCPU state in that case when the vCPU is down.

Thanks, Roger.

