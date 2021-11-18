Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A3455823
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227263.393018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndp3-0008Rm-Se; Thu, 18 Nov 2021 09:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227263.393018; Thu, 18 Nov 2021 09:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndp3-0008PI-PX; Thu, 18 Nov 2021 09:35:13 +0000
Received: by outflank-mailman (input) for mailman id 227263;
 Thu, 18 Nov 2021 09:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mndp1-0008P7-RI
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:35:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d18394c9-4852-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 10:35:09 +0100 (CET)
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
X-Inumbo-ID: d18394c9-4852-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637228109;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CAAgo7sIvmHSMziNt3qIRoORYfuV5lol3N+4UqTn/Gs=;
  b=ds/RPFYmI33ApzNVXCUIGZxajvRJ1WWqhV12I0tsxht80KK7VJwFjGRP
   kyR7vQOecXJVJ4xYPW4/giZP/ayhL2QIkKigOP/UnXxl9zdf/YmFDTqkg
   6U8o9rZiEde5jtWL/CVpNatUmKDuS8f6pwtLFvuFuVX+SHTZnkctzeERC
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eXJCbs6qfnyGdrIiwY8kvaYmNYONRZldlCvG4TEh6OF53MWvVqL/esGqum+zC+8iNcImYOwKar
 IoxmW46Ox0wHmzvp7C/4mpSfIaCxQZrPr+0fUivLKRdu7Y5dSC3NBB/pCSjDvUtASeP6BTxJWi
 BXOOzF2axDsGZYpPllDOl/V0OiQ0rFSbj6qp5xUFFjwSgbFwrp9390DwTbmssya1vby4ASmCJP
 WjSdfgVrW+9Qqpyk9Yy7BLjqWfMAr8+Bkcb2rfnwBsmd/y36etz8lq6riTAZ8SciNhrMiEcyh0
 xKMhqKWCuM/iwlEeqdTJiQZ6
X-SBRS: 5.1
X-MesageID: 58130417
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lTdNH6/YQZrtKdUdJVCqDrUDa3mTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WtMDzyGb63bNDTxKt5wbIjl9BwDupWAzt9gQQtl/n88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdg0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh36
 NNmuJfscDw1GZfnyMEXXSJUAx1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFjG5r3pwXQp4yY
 eJCbgVEdjWRZyRrJ3kLC5gklfqpjFbgJmgwRFW9+vNsvjm7IBZK+LnyMvLFd9qSX8JXk02E4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ85S4GvaU0skuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixAEgCZTNKNOUdqOgMbmwP3
 FGyk8PVLGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 Chsdyu2trlm4XSxeMqlGrll8FaBvajtDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0Ku8YMYCb2PfInOepd7vjGK4C6SbwJsdiOMLJzjmVZLlfbrEmCm2bOt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8riq8ZEKLbDafVI9cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1piVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:yilI/6/tKOKVeIF21sRuk+FCdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIuzGyWuKEhVAQOHl3bIiI9FkN1CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,244,1631592000"; 
   d="scan'208";a="58130417"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAG+Us73IbODWmvfcJuFYpSR0iEBenx+rVfODkBXn7q535l6j/H8kyPoMw4AIOxsLokK2Qt6ZniMH1GlhPPisSCFf0tBkl5GcWtKchNaTc5Ney/2C3vVLV4JX0MC+U4+CSSxoi/QxGkR8BEI6RhHxFaBeYmtRys9xdBxFFXHzIdpjkVfMNGeCBiGZ1cSB+dofB9YzDbw9N55PPNHm4CJetZOVetqFEkCbs16KVlPAz0l8lawcVb7Fpav8ZyZxlmsxogfpazfFutZ9Jhah6OkmuHTIJeHcgFhVRNIKnPAr3nyjhvrZYgceSTxR3x4X25xOfDDAcCxhphacMZYNyjmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoWQ71HXUd+cJ3hMxF7fMYUXTE8CKyFN8s2LY//+xMA=;
 b=VP678NmbTX9gS/f1JDqoP1qqUGbGSRDhE8RobpCWSmemN4LnbPH7w0E4PoBqvhWQZRD54/vSD1ZKUm55yI2inqLXvmXCigTGz3FHuJnH/5edFACKDXiTHrzbJP7z5y+tgbU5D8K0De1zqJPsJ/X21PRKkCD39BIPdyj/8mujlfIR/mrylr+JjafmuTOUFqi1+Ny8CZ4zmnBHQXMe6I3rXiBt9UtkTlGrjO9cMHo+D04s1xoquDKQ5TBSNc1ECOWsV6ZmM0wWgNM3zLNJsuMXC4KSHYR5F6UzgIkhPZO8vrd9Iat/E5ovLZPw/l3g5OLwA7k8pp3TAGt6pQTNelMnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoWQ71HXUd+cJ3hMxF7fMYUXTE8CKyFN8s2LY//+xMA=;
 b=eViC1tGAr1iVIXmm3aL4SCK39CmlRjuC7H7np88Mf2J16C+FBIX3cSiTkcHXxti3PABmjL/r4Qxw0S07wPbglU9wwcdrGVMqepRTO2qjAkJ/f3xBCnexqIj4UuF+EDJE46xGZZWpwUMCC0slS273sT3ySwSNJPKN6XaHSUCosEY=
Date: Thu, 18 Nov 2021 10:34:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Message-ID: <YZYeQ7/feMBrTFSu@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
 <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
 <YZYP3BpugHwOhNuV@Air-de-Roger>
 <def0133b-9eb2-44cd-33c3-39c9d0dca9f4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <def0133b-9eb2-44cd-33c3-39c9d0dca9f4@suse.com>
X-ClientProxiedBy: MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d27de33-bd94-410e-1c4a-08d9aa76b3b8
X-MS-TrafficTypeDiagnostic: DM5PR03MB2924:
X-Microsoft-Antispam-PRVS: <DM5PR03MB29249F9B22AC1701781BFA448F9B9@DM5PR03MB2924.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EyLhpT/SYp0lHOdC/mxZwhyJj7lPKCI3PW/gXrdiJYGxboKxL86lQBEEOtVM8u3QUyVXz5EalnYdJgSgu1akiV+OMX22kagF/ccQH/+1N9wYdH8VOCaAGbzqNDPvyZ8olOJG/SmotZ997Ey3Grhfh5Cxcb5w3um3j9ktwpt31sASXBGlyxcPvICRcPftSAg3rLV3KiktDUq8Yg9Xn8kOxiq+08PAeN+ktsnHRGqZbAThkKjywJdIUj0E35Lxcrnex1UEwimlOp2KRMVcnhpUHFG/vMPqL1//HFqmuvYesixUYDmD4wiLLx34OPwko8LZhknoZyVZAmpPxf5xjvzSce49DMnJzHRT03lcP2GwNqiPNkMrEI5y89MhJnrlyyhU9XwT9gkdwKQ9AZZhWZR0NMUB97kgZmaT/xv7C1hP5m6AOrZ6wtZ+bUltLwYFIJ/KonT5sUVU6RTeMpoat0Zebi96hAoMw7+gOdPDP/ardSO7gwECaLcig9MDqsk5nrerbkcBtZJT86CJNV7hQ6oEGfF89azadu/wDwmB67QYxjgo/fB2Kr5jYWeKnBr8Ti8mIgWvo13zjdjpRLRfdMd5A9JmTPj0WeBECf+Wa4aafpSW+PKqnC9TVT3C1VdMmuhwEL1xv2baSrJHjN1xYSMsfYTlEYCPbB8A4rNf19WgNSwwdnohPVQSh/971bbU8qCnPtS5KtDyHiZebgy5E6OizP49kGPxJWm642433wywfJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(26005)(86362001)(6666004)(956004)(2906002)(6916009)(6486002)(6496006)(8676002)(53546011)(54906003)(8936002)(966005)(33716001)(316002)(9686003)(66476007)(508600001)(5660300002)(4326008)(85182001)(38100700002)(66556008)(66946007)(82960400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmkwSUJ2R25zMkdXb3lOUVNndTQvcDBJNGJZY3VaVGtJa1I0RzE2eW8xS245?=
 =?utf-8?B?NU92V2RlRlN3TVltOVNBQ09PMGxMRlVTV1g4UTM2N1ZWWHcveGZNVURSTTdV?=
 =?utf-8?B?VTA2d0E5N3NTaHFSZVp5eTgva2JaQnBuWGZtSDA5dVBReHR3ckREV0orbDJR?=
 =?utf-8?B?U00zTHQrQUZnbTJxWVpHb1lQaEx1b2p3ZC9zWktFdGM2ejlUYVJkRXh2ZnBY?=
 =?utf-8?B?RXd2TlZ1WUgxSnRlNmdjU3ZKblRxQ1Y2ZkV0ZGt2OHFtUTkrSFFVRVJlSGtY?=
 =?utf-8?B?MjIwQjhncXU2ZVRJVzg0Wi9ScXlnVWwyOFFKZ203VFZROTVxcTlMc2hlOFc5?=
 =?utf-8?B?M054UURSTVVJWFFiVUlPR1hoK0FCcDNPbHhhQ1NXZGxyd1NXRUtnekJrWDh2?=
 =?utf-8?B?WDdaZU00OElCUjRDbzVJUVRTNVNPaWZ0WW5MOU9JYVFZOVZRWlNZTGJndlZt?=
 =?utf-8?B?ckozTmVoSWdJNkplaStFVkUzM1Q4MExFMmpRODBMYWI0MHRaNHdxc2Zlb0Q1?=
 =?utf-8?B?R3N0akk0ZFdrbC84OWlNQk5URjQxSWs1dkZpVGtnMERodUZ4ZEJpQmNRNWww?=
 =?utf-8?B?Y0R1aXpKWndDSm5DK0NEZ1l3TFFsQUpVb2YyRklIZmFXQUJJL1dveUNQdVIw?=
 =?utf-8?B?cW9YUkZ3a3RqZFVPMTNUNnhENzlNTDJYNXFxbXhhMlBGKzVQNkRMSk1rZzZ4?=
 =?utf-8?B?WThoKzZjYzRQVVVJNzduUlUrZGhEQitIcFd6dkZHRmFNd21mVkcrTUNTbXJt?=
 =?utf-8?B?NFN6aGFwWGtCQyt4Mys2a2UxcEtZWDhqN2pLT3djMGJPOUQ5RFlTYkM1OGR1?=
 =?utf-8?B?eC9Zdm82TGhqRGRQVFlSeWVEdUIzeC9YSVMzWC8xQXRIRk9hMGN4NHlHRjdp?=
 =?utf-8?B?M1JORWsyWFNXS1Z1a1pabEhzRS9qWkhLM2NTVkZVN05QaTNYdjVUemlKN2p2?=
 =?utf-8?B?SVAyNWFvcXNFVm5vODJSN00rTWN0eHgrUzA5MmlnWEtJTXBZcmR6bDFSZUh0?=
 =?utf-8?B?bzh0cVAxeE1WRXJYVHVzK1BGQ2lZcSs3WVdlQXcvbzI0czJ2VXo2dU9vUDQx?=
 =?utf-8?B?T3pXRWFneWNOQnRVT2JBWExtSjRBWCtsVFNaTThYazZSV3hmMjRLUW12Q3BX?=
 =?utf-8?B?d3BQdUlOTXNwVTd4UHY1bDVENnF0YzZLYmQxTEMwSTE2dENyNFU1MDdlUTBX?=
 =?utf-8?B?blNKMmdTMFVpbytTMU02U09scHprRmk5TG9GREF1OVZSU1JRSmdCYm9EWita?=
 =?utf-8?B?STZOdVJhWkIvVTduTER1dzRiQ1hiYkpLb2ZPVktZY2pyeUMxL21XbVJZSFZz?=
 =?utf-8?B?WHdBelYrOEJndzhxYVZwTFgvM2RrekVOS0JkNDVMbStzbHFqSTNiTmdxUUpU?=
 =?utf-8?B?TWVidXM0aEVwUGpDTkZEVDVVUERvcWNvaWNGMC9RUW16b2lLeUM1YWV4QjhX?=
 =?utf-8?B?TVZEVWNrREZCVDl0alIzN3VMdWZlR2pEaDlxS1ppT0l6b1M4K1VhVEEwYTFv?=
 =?utf-8?B?NUM4VzErNUw1bEJXSXFaWmY4S1dOa1dyV2dzdmhkWWcrbEdFY0ZzVXMvRGFM?=
 =?utf-8?B?Z0FQR0lta1JTVTZhd0NRbk9JaVRFUGNMMlFYYjJyZlhOU1V6MUh4aWc1cWpy?=
 =?utf-8?B?RFVPZkNNL2E5RzZOVFB6bDdIY2RzVEloNkhoaUtSQjluSTFaWW1nNXJPNmJC?=
 =?utf-8?B?OVVSNkd2N3Q0b2JVVlovaGRpMnZoWEtHUVF4MnFwVmFiU0RQQzlicDF6SFFR?=
 =?utf-8?B?WVFnMW54aHJkNEpoUTdVbS9EYWx5QTNmSnQ5YytuaHRkS3hhaVdxSklUUEN5?=
 =?utf-8?B?SjluQlBiS2V3ck9LczV5OTUzNWN1ejgrcDB3bnVCZUJSM3R4WVNZQmZHMXNp?=
 =?utf-8?B?c2xZOHJBOVVHV3JndXhDSkc5TjVsWFFBTzk2clZTdis4YXVuUTd6cGNMaEFh?=
 =?utf-8?B?bmQ1S3cvV2Q2aXREZFhJZkZMcUJPUnBFdUdOSUg3bEVGVnFBZk9ua1NSSXUy?=
 =?utf-8?B?T2Y0R01oZUc2N1BGNVNjdTF3Sys2ZnR5bkN6R3plNENhZUVtN3RPdVNUdnhX?=
 =?utf-8?B?RUtBZmYwU2lHZUdBQzZaVjhNZ0tTajd3c2xlUytwbk9pYnhVRVkraWd4OExO?=
 =?utf-8?B?U0JYRFNhOXo3Z1l4SlBWVzM1a3pldGZkOXliR2RWdXoyYlcyTDE4NGI3blBx?=
 =?utf-8?Q?BLI6GhHn2y9zo3gasXnAeYI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d27de33-bd94-410e-1c4a-08d9aa76b3b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:35:04.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F61i7kJGmn49ygCUKytH+HBlaDycd2KV4cznHfTUYeCKkO8id0KLrxXKKtTCRWUJCSYRtKkI0Bh4Ev86AjvmJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2924
X-OriginatorOrg: citrix.com

On Thu, Nov 18, 2021 at 09:51:52AM +0100, Jan Beulich wrote:
> On 18.11.2021 09:33, Roger Pau Monné wrote:
> > On Thu, Nov 04, 2021 at 01:17:53PM +0100, Jan Beulich wrote:
> >> On 04.11.2021 11:48, Andrew Cooper wrote:
> >>> If your answer is "well actually, we didn't mean to say 'if a GSI is
> >>> mapped' in the comment, and here's a different predicate which actually
> >>> inspects the state of a dpci object for validity", then fine -  that
> >>> will shut the compiler up because you're no longer checking for the
> >>> NULLness of a pointer to a sub-object of a non-NULL pointer, but that's
> >>> a bugfix which needs backporting several releases too.
> >>>
> >>> The current logic is not correct, and does not become correct by trying
> >>> pass blame to the compiler.
> >>
> >> I have yet to understand in which way you deem the current logic to not
> >> be correct. I'm sorry for being dense.
> >>
> >>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967 is the GCC bug, but
> >>> the result of it was them persuading me that the diagnostic was
> >>> legitimate, even if currently expressed badly.  They've agreed to fix
> >>> how it is expressed, but I doubt you'll persuade them that the trigger
> >>> for the diagnostic in the first place was wrong.
> >>
> >> Well, thanks for the pointer in any event. I've commented there as well.
> > 
> > Did we get any resolution out of this?
> 
> I don't think we did. I'm still struggling to understand Andrew's way
> of thinking.

What about the GCC bug report?

Ultimately we need GCC people to make the check less restrictive or we
need a way to rework the code in a way that doesn't trigger it, either
Andrew's proposal or something else.

> > It would be good IMO if we could build out of the box with GCC 12
> > instead of having to backport fixes later on.
> 
> I guess gcc12 is too far from getting released that there could be any
> guarantee for no further issues to get exposed by that point. It has
> also been common for us to backport fixes and workarounds when new
> compiler versions appear.
> 
> I could agree to being proactive if the change to make to our code was
> uncontroversial.

OK, but unless GCC changes their mind we are likely to have this
conversation again in the future, so we might be just delaying the
inevitable.

Thanks, Roger.

