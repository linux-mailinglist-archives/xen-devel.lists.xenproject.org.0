Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C554D1B8C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287068.486864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbd6-0006b1-27; Tue, 08 Mar 2022 15:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287068.486864; Tue, 08 Mar 2022 15:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbd5-0006X0-VA; Tue, 08 Mar 2022 15:20:03 +0000
Received: by outflank-mailman (input) for mailman id 287068;
 Tue, 08 Mar 2022 15:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRbd4-0006Kw-QK
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:20:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37d8df5c-9ef3-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 16:20:00 +0100 (CET)
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
X-Inumbo-ID: 37d8df5c-9ef3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646752800;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Do0+seH8JmTPVuWVnszBvv4ewmPEufWMTIktRX6Fiiw=;
  b=ep4O0tRwWQNZf2XdAdBdVgJr+NQGnr1ADP4tWg790hpFNVn1+capgTH0
   2eYaj5NjXy/5faKVeHWqTSwdcEB3NjSxTgO07rFJFEf/UIhK7UcHt9Zqe
   JOnVvGjSyfVn/R//GMMSUWblhK+hCJsz9e/w2hwcPasUztuxSWJhh9oL4
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65713384
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zT91YKDFvZ85NhVW/+Hjw5YqxClBgxIJ4kV8jS/XYbTApDtzgmQOm
 jZMDTiEb/yLYzSjLtl1a4S090JQ6MWBnYNhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhfm
 Otzi6e+az0sEaz2x9w2dl4DCHthaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4TQq+FP
 JpFAdZpRA+DegNCGAxONKMBp+OvqVzcKx5hl2vA8MLb5ECMlVcsgdABKuH9f9+XbcxQl1Sfo
 CTK8gzRBwkdNNiWwjmt+3ellOjJ2y/2MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYDX/JAHut87xuCooLY5AuTC2wsRztIetsg8sM7LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwA7fVE8WxQKbzEAzNjZ/7kYq1WUVYx8RfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zsK4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yP7FWyzyGsnTKuMDiriUWWxC
 KM0kVkNjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwORDOgDCwyxF8zPpX1
 XKnnSCEVy1y5UNPlmbeegvg+eVzmnBWKZ37H/gXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X2SWXeV/UOyo4NNsCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nE1wrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:SJh/b6kzxPuamlB9i6fUzpbkpKfpDfOCimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEzUOy1HYUL2KirGSjQEIeheOutK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHouQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJT6
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTij9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDt1L9qqq
 iPn/4TBbU215rjRBDznfIr4Xin7N8a0Q6m9bZfuwq7nSW2fkNjNyMLv/MnTvKQ0TtfgDg76t
 MQ44vRjesmMfuL9h6NluTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVx4SxbpXWd
 WGNvusrMq+sGnqG0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0qt
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4hqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhllu5EU33HNc3W2AG4OSITepGb0oYi6+XgKo
 OOBK4=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65713384"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZTqRkde/NdkZCtwO2Fcdohn+AdnfNL1AQaLqhT9GQwTILfe99cDaBqi9XcYxwE8+F7slPys5rLH99NdfFiaU14JkSfGo7x/mQfsnexQRD87dhSr8cNCQ/+FvsZixG4zvn8QGQiQWTyOK26AkMXMosGpzI4/WmcM31geDh2+INlU1yoIDRFr/NWaTV0f8VdVpTZ2GBaGyIN9ZttOqSr9Im9mdZ7KPImfsILsK5oafD/Vh7zYtM8rqC8P98T/Qz7KRGZNULzrV7AyUOIrO/VRUUK4KkTJZi97rQoenasJHza8Zz+gpA0oasuW6X7s6v+vu3Sj22MHnk4N/pAbkgCXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do0+seH8JmTPVuWVnszBvv4ewmPEufWMTIktRX6Fiiw=;
 b=eqf+Rv3JaYOKML4dVUmb0FNtHa8mHQQRVgPN+tAXnO+Q3TS8zzR7y0/3Vw/ggGlBRkrQCjoGE7+Y2Cf1rKmdiihGrdC1ZJyCI+CdGx4eweH58qz3p7gG6+kU/wpx0CuL1WNcjKCVi8Su0+9u7Dquo1VwcojGWddA5BWABLGYa/xm6H1GTVJ12un0C+0/kAqWL3G6IDQVOEz+HUVmBImU0xAR3cJn2efBGXlC0xEtOlD6QyFL7AMNDkt4hsOWRLUiDhFo03Sg002jHkaDEgBIbwSHYxeT9+dqzJdSj6LUey+uccAX5NIjeRw7BQHgtkoe5Wj2v3qYZmij8vUpZPkK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do0+seH8JmTPVuWVnszBvv4ewmPEufWMTIktRX6Fiiw=;
 b=ZiH0HJ8RKaUUXRZ2Pk6wMWt3zfddwYNonwxJhgj5TjfT+oq45WFUKRTAiMiUbh/x5UZ8tJzU0KF0aYlsRh8HcUbzqOnGKyWZgqfdg66Qb0Cm703bLfOuByfDhsFRps0BVGdvi5CoEa4Gcdj33w/zp+E83vR7H0Ej19AM9q8foxk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Topic: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Index: AQHYMvUk0XiHSYNleUqdwHU2YHv5TKy1jjMAgAALzQA=
Date: Tue, 8 Mar 2022 15:19:52 +0000
Message-ID: <476a25f8-86eb-0df5-b481-fc4cd5ecbb18@citrix.com>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
 <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
In-Reply-To: <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2ff0311-3fee-4166-5fd1-08da0117182b
x-ms-traffictypediagnostic: CO3PR03MB6789:EE_
x-microsoft-antispam-prvs: <CO3PR03MB67891E61E04C10EAFEA33EB5BA099@CO3PR03MB6789.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FKl1kTTOqMyjdyhfSyQZlS40bKX/ZitK4HhWRV1rvtpMwmMfjjEeHWrWYFmR46schc0/OOB2GJP1yp9BtMJUnllP4tyfxRzuRC6U8VhPCaqAr2dja11wn+Q5r5iscoCa59es2A1jOo9M5OstdXFvhmIPr7cjNTDRI+6/UKSFSxBo30xyw3ImRy2YotCZ1s2uH84WW2dBxVQgkmeXdv271mvn5xnze5AnzLeV5TGVilsUnxeWppV1kUvpx8RV7BT9gU8ACtpyHrCtxPPJKv/GV31CMOgFyMopRSKW22MevFr0dQQ0pKEWG9xlk8Ew/L8bbyxGycZhjIM+REVLaSwjT+5OklULgsozALYZJW7dFv4WL+0OvKxdSdjcarkblnTnxKTdQxpJKq/XnJJbezJhHZ/s3SpjF5R66iM2ZptFAoyD/yF0XBYPs4xTSij6kIpL8BSrrZhCtvM7wlYVGIsnHOJYgdxUHq0v+ofXJ6pcdQQfcDmVnQ6EiCNLGUJxdBCsrjm+shUzhUOQswwfDq3u0Tj1SfNuAdEVwN/iM4MM/tl8IteXpStNYvqElud0lpJH2mZC9E+xQS3PJxLYAyR5y+3ZkuhLf1TO3JPinxsnEPohEal2HpNH81trEmlEkIGNed8Oo7l17dOW9Gb87Zgd1FkBouj+cPX2xXEOv6SCM/Rt5TbjoBBAvNSqurJk+jHiwKqlWgL0bdEc7e0CYRHBDxtpPCMYxB56kl64A2CxMjll7/Q8OgG6W7eNf2cgbUfTTXChRoDCOUMGKUTrct7qew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(91956017)(6916009)(54906003)(66476007)(66556008)(66446008)(8676002)(86362001)(38070700005)(76116006)(6486002)(6512007)(316002)(6506007)(5660300002)(4326008)(82960400001)(53546011)(71200400001)(26005)(186003)(2616005)(66574015)(83380400001)(38100700002)(31696002)(2906002)(36756003)(8936002)(31686004)(64756008)(508600001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzlaVWczRFFmSDRpeHFpZ1hBbEtxSGNma1pTbnBNdkhaWDhRQUljUXg3MUJJ?=
 =?utf-8?B?MVNacTE5OCtQdFNZZ3V3aXVNQnFaSDcyUXpHYWp4L3VWZlJHSk9ORTdVcjdX?=
 =?utf-8?B?QVJKNHc5OGJHZXJvekpqK21wWFpZejZwZS9XNW1uNC90bi82UThQZEVxeWNn?=
 =?utf-8?B?bm9qdEJKSGZpcndydGl5SWdjQUFJK0o1UldYZ3BJbHJYajVmeXpodUJXcldi?=
 =?utf-8?B?TDBla0J1cTVwZ0dEU01WSkh5OXdZR1RXWmVtOWlKQ0JFNVovbGRjaDFCZ3R2?=
 =?utf-8?B?T0xiSW1HQ21sRXV2Skl1ZGhYc3Y2MmI5ZklTVDFNejdNcDRjMngxd2VoMWdZ?=
 =?utf-8?B?RmYvQUNYUzkwY2drZ1dockgzSEhyeGdBVVNwT0hiOFVrVWsxWjBxNy9OelpI?=
 =?utf-8?B?L2hXS0VUZ2djd2ZydHBMazF3MUM5MUVRQ2tDaHRSd2FsUS9udjZRRG5hbEl0?=
 =?utf-8?B?VDBKaEdEQzA3TUEweUJsRHBSVkpPV1ZuMTl4YTl2U0MwT2I4bXlpWkNhU0lo?=
 =?utf-8?B?L3pMMXM4eHR2QTVnUkEySmF0aWRkZ085VzdYZTBUMU03N2tPbS9tQjZWcXNU?=
 =?utf-8?B?dk0xbEhGRlUrV0FWUkkrc1pPSWN3YnFuUFJ4a0tkcjhrZ0MrVmVHNGdnbXpq?=
 =?utf-8?B?U2w2cjZhWG95cjR3QnNWZU8vZUhRbU9OSHBlR3Y3d0hiNS9lNWFRL1lMaGFS?=
 =?utf-8?B?eDNOanViS0FxMDFUaW9BMFlXOHYxcFdvc1VsVnFwZDFRS29xeFBQSnNURkFM?=
 =?utf-8?B?RGU1NjdNaWtvRGNIaWhtNUpiLzRhc1FYUTV2ckt6K1BRMjc3UEtISGZRQXEv?=
 =?utf-8?B?dlVhUVd6VWlyaGlDeFh1RlQ4TEdUTDJhTFFURnB5Q2V5NmI2Q2dUMGMvdlBz?=
 =?utf-8?B?cllsNkxFYksyVWlSbzZzSGt5NEcxVk1KN0pJZzZPWGlzc0hDSTJ0dXIrSzJn?=
 =?utf-8?B?NGg2YzVMclRGMEdHTGp3RkNqQkwxYVAxMzFSMVpkZzZUeTRxWWZCcUdOdkdM?=
 =?utf-8?B?eWdIL3pQVERFK3BSUEJFSUowTXFUby9MRnV0U09VMzRvSE1UL3dFSm5RRHQv?=
 =?utf-8?B?MThFaFRrbnV6dHFPYU1JRXF6TzNqMHNTWXFpb2hiWERNZHRoSXBCY2pGaEF2?=
 =?utf-8?B?b2N3Q3dLeDJFT3lKRGxWNDZaYjVzdGw4U2RmaHo4TklpbmRENUVNTWRHYnJN?=
 =?utf-8?B?a3llMW5HdERjS0FmTVl1YXBJSFZ6MXNRZjV6V0d4ckxxRFY3OXVVOC9RdGNy?=
 =?utf-8?B?L09WVmJEb2g1NFNYUk1ZZ2xJV1R3SDRhaXFTcVRZcDhaQ0MrazhINzIzd3Br?=
 =?utf-8?B?ckpGczlGY3hReU9xbTZ1MGloelpvUFQrWTUyMEtjRVl1NW9QQS9iOElUcklP?=
 =?utf-8?B?bzlCcC9RblNrY1NYdzI4K2xZOGE4RFI0N2Z3RnV6M01wb2h2OWtsVkUya3BT?=
 =?utf-8?B?MWFMdXRleUFOZG9CcHdkM1FvcHhBcFRTNGFFTGRuSkxTYWtTeW5nYnJUczhn?=
 =?utf-8?B?ZzEyUDVhRDZ0cm5XbEQxNzh2bG42YVhCOStjTFp3Ly9Zam1HdTdxRE4vVDVr?=
 =?utf-8?B?azIvR2N3YXBsZjY2YXpOUkVFZ09HSGlkQitCWDIvU1BZTEtsUWQrTitNSldX?=
 =?utf-8?B?dWVHNm9tUmt3WlR4ZEoyZmRqaGhQakl5NloxSVR0MnprZnhtd0FWYmU2Y3Fp?=
 =?utf-8?B?cTRFZWlFekVqV3FoQjRidWl4MTRMWnNmV216VUlLa3lUNnNmdGw0R2N0M0Y0?=
 =?utf-8?B?UUZVNit2RUNQSzFMb2lrSzZvWlVScEo5UXhNaUFydWloelc1SUxWMXBTSGVa?=
 =?utf-8?B?bWVWRTc0d0tMNWJ1L2dzSkdtN1h6S0MzcXY5cXNpQzVUdmtTVjlyWnp5NzJH?=
 =?utf-8?B?ek5lMlhWdTM1TCs5MDB4SmM4M0Z5em9taWJ2ckUrYlFNTnNQZUpxOE4xZ1po?=
 =?utf-8?B?U3JvQmdPd1czM2tFclYzMk9KaW1HT0c5RHd5bEliSEtMbk4zSzFTbFRVVDRp?=
 =?utf-8?B?RGFUbEJUUVFKazZXU1hNbFI5cnkrVW1WRk0wd2NNdEhDekUxeWp6WTJTTVJq?=
 =?utf-8?B?V3J6Tnh1aG8ycEFOcUJueC9nSUNwR0NFMExpZDF4dlZBcE1lVklIM2l6Sk5z?=
 =?utf-8?B?V04wWnh6ZUJKcmNMYkRNOVY0dzJPYjVBUjZnN3lOcDBUbk12U2lvYWhWQkVJ?=
 =?utf-8?B?cCtvdmE1OXp2Z09XYzlhK0pvVDROZ2J5a1Zqc0NCWVBIMjFRcEs2ays5azd0?=
 =?utf-8?B?bmowMGE4UE1WeTdpY3VkN09DaTRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B682F98855F0A94392677EF1C01ECB5A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ff0311-3fee-4166-5fd1-08da0117182b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 15:19:52.6311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsqDJHINL+RLWi0T+HIwiyWdNXqnfZKm+HPX/tSfg2/GqfYL+6hTnOFYYxIyMKnKCNh0Ei39U4ca5m7eFuLuPR+an53icXK0BAXxNaQx650=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6789
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNDozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA4LjAzLjIwMjIg
MTU6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGb3IgbGl2ZXBhdGNoaW5nLCB3ZSBuZWVk
IHRvIGxvb2sgYXQgYSBwb3RlbnRpYWxseSBjbG9iYmVyZWQgZnVuY3Rpb24gYW5kDQo+PiBkZXRl
cm1pbmUgd2hldGhlciBpdCB1c2VkIHRvIGhhdmUgYW4gRU5EQlI2NCBpbnN0cnVjdGlvbi4NCj4+
DQo+PiBVc2UgYSBub24tZGVmYXVsdCA0LWJ5dGUgUDYgbG9uZyBub3AsIG5vdCBlbWl0dGVkIGJ5
IHRvb2xjaGFpbnMsIGFuZCBpbnRyb2R1Y2UNCj4+IHRoZSB3YXNfZW5kYnI2NCgpIHByZWRpY2F0
ZS4NCj4gRGlkIHlvdSBjb25zaWRlciB1c2luZyBFTkRCUjMyIGZvciB0aGlzIHB1cnBvc2U/DQoN
Ck5vLCBhbmQgbm8gYmVjYXVzZSB0aGF0J3MgdmVyeSBzaG9ydCBzaWdodGVkLsKgIEV2ZW4gNCBu
b24tbm9wcyB3b3VsZCBiZQ0KYmV0dGVyIHRoYW4gRU5EQlIzMiwgYmVjYXVzZSB0aGV5IHdvdWxk
bid0IGNyZWF0ZSBhY3R1YWxseS11c2FibGUNCmNvZGVwYXRocyBpbiBjb3JuZXIgY2FzZXMgd2Ug
Y2FyZSB0byBleGNsdWRlLg0KDQo+IEknbSB3b3JyaWVkIHRoYXQNCj4gdGhlIHBhdHRlcm4geW91
IHBpY2tlZCBpcyBzdGlsbCB0b28gY2xvc2UgdG8gd2hhdCBtaWdodCBiZSB1c2VkDQo+IChkb3du
IHRoZSByb2FkKSBieSBhIHRvb2wgY2hhaW4uDQoNClRoaXMgaXMgd2hhdCBMaW51eCBhcmUgZG9p
bmcgdG9vLCBidXQgbm8gLSBJJ20gbm90IHdvcnJpZWQuwqAgVGhlDQplbmNvZGluZyBpc24ndCB0
aGUgb25seSBwcm90ZWN0aW9uOyB0b29sY2hhaW5zIGFsc28gaGF2ZSBubyByZWFzb24gdG8NCnB1
dCBhIG5vcDQgYXQgdGhlIGhlYWQgb2YgZnVuY3Rpb25zOyBub3A1IGlzIHRoZSBjb21tb24gb25l
IHRvIGZpbmQuDQoNCj4gT25lIG5lYXQgdGhpbmcgYWJvdXQgRU5EQlIzMiB3b3VsZCBiZSB0aGF0
IHlvdSB3b3VsZG4ndCBldmVuDQo+IG5lZWQgbWVtY3B5KCkgLSB5b3UnZCBtZXJlbHkgZmxpcCB0
aGUgbG93IG1haW4gb3Bjb2RlIGJpdC4NCg0KTm90IHJlbGV2YW50LsKgIFlvdSdyZSB0YWtpbmcg
dGhlIFNNQyBwaXBlbGluZSBoaXQgZm9yIGFueSBzaXplZCB3cml0ZSwNCmFuZCBhIHNpbmdsZSBt
b3ZsIGlzIGZhciBsZXNzIGNyeXB0aWMuDQoNCj4+IEJqb2VybjogRm9yIHRoZSBsaXZlcGF0Y2hp
bmcgY29kZSwgSSB0aGluayB5b3Ugd2FudDoNCj4+DQo+PiAgIGlmICggaXNfZW5kYnI2NCguLi4p
IHx8IHdhc19lbmRicjY0KC4uLikgKQ0KPj4gICAgICAgbmVlZGVkICs9IEVOREJSNjRfTEVOOw0K
PiBMb29rcyBsaWtlIEkgZGlkbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIHByb2JsZW0gdGhlbiBm
cm9tIHlvdXINCj4gaW5pdGlhbCBkZXNjcmlwdGlvbi4gVGhlIGFkanVzdG1lbnQgaGVyZSAoYW5k
IHRoZSBvbmUgbmVlZGVkIGluDQo+IEJqw7ZybidzIHBhdGNoKSBpcyB0byBjb21wZW5zYXRlIGZv
ciB0aGUgYWR2YW5jaW5nIG9mIHRoZQ0KPiB0YXJnZXRzIG9mIGFsdGNhbGxzIHBhc3QgdGhlIEVO
REJSPw0KDQpOby7CoCBDb25zaWRlciB0aGlzIHNjZW5hcmlvOg0KDQpjYWxsZWU6DQrCoMKgwqAg
ZW5kYnI2NA0KwqDCoMKgIC4uLg0KDQphbHRjYWxsOg0KwqDCoMKgIGNhbGwgKmZvbyglcmlwKQ0K
DQpEdXJpbmcgYm9vdCwgd2UgcmV3cml0ZSBhbHRjYWxsIHRvIGJlIGBjYWxsIGNhbGxlZSs0YCBh
bmQgdHVybiBlbmRicjY0DQppbnRvIG5vcHMsIHNvIGl0IG5vdyBsb29rcyBsaWtlOg0KDQpjYWxs
ZWU6DQrCoMKgwqAgbm9wNA0KwqDCoMKgIC4uLg0KDQphbHRjYWxsOg0KwqDCoMKgIGNhbGwgY2Fs
bGVlKzQNCg0KVGhlbiB3ZSB3YW50IHRvIGxpdmVwYXRjaCBjYWxsZWUgdG8gY2FsbGVlX25ldywg
c28gd2UgZ2V0DQoNCmNhbGxlZV9uZXc6DQrCoMKgwqAgZW5kYnI2NA0KwqDCoMKgIC4uLg0KDQpp
biB0aGUgbGl2ZXBhdGNoIGl0c2VsZi4NCg0KTm93LCB0byBhY3R1YWxseSBwYXRjaCwgd2UgbmVl
ZCB0byBtZW1jcHkoY2FsbGVlKzQsICJqbXAgY2FsbGVlX25ldyIsIDUpLg0KDQpUaGUgbGl2ZXBh
dGNoIGxvZ2ljIGNhbGxpbmcgaXNfZW5kYnIoY2FsbGVlKSBkb2Vzbid0IHdvcmsgYmVjYXVzZSBp
dCdzDQpub3cgYSBub3A0LCB3aGljaCBpcyB3aHkgaXQgbmVlZHMgYSB3YXNfZW5kYnI2NChjYWxs
ZWUpIHRvby4NCg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VuZGJyLmgN
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbmRici5oDQo+PiBAQCAtNTIsNCAr
NTIsMTYgQEAgc3RhdGljIGlubGluZSB2b2lkIHBsYWNlX2VuZGJyNjQodm9pZCAqcHRyKQ0KPj4g
ICAgICAqKHVpbnQzMl90ICopcHRyID0gZ2VuX2VuZGJyNjQoKTsNCj4+ICB9DQo+PiAgDQo+PiAr
LyoNCj4+ICsgKiBBZnRlciBjbG9iYmVyaW5nIEVOREJSNjQsIHdlIG1heSBuZWVkIHRvIGNvbmZp
cm0gdGhhdCB0aGUgc2l0ZSB1c2VkIHRvDQo+PiArICogY29udGFpbiBhbiBFTkRCUjY0IGluc3Ry
dWN0aW9uLiAgVXNlIGFuIGVuY29kaW5nIHdoaWNoIGlzbid0IHRoZSBkZWZhdWx0DQo+PiArICog
UDZfTk9QNC4NCj4+ICsgKi8NCj4+ICsjZGVmaW5lIEVOREJSNjRfUE9JU09OICJceDY2XHgwZlx4
MWZceDAwIiAvKiBvc3Agbm9wbCAoJXJheCkgKi8NCj4gSW4gY2FzZSB0aGlzIHJlbWFpbnMgYXMg
aXMgLSBkaWQgeW91IG1lYW4gIm9wc3oiIGluc3RlYWQgb2YgIm9zcCI/DQo+IEJ1dCB0aGlzIHJl
YWxseSBpcyAibm9wdyAoJXJheCkiIGFueXdheS4NCg0KT2gsIG9zcCBpcyB0aGUgbmFzbSBuYW1l
LsKgIEknbGwgc3dpdGNoIHRvIG5vcHcuDQoNCn5BbmRyZXcNCg==

