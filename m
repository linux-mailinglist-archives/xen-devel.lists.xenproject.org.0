Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BC84938D0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258803.446133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA8TK-0000Sl-L9; Wed, 19 Jan 2022 10:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258803.446133; Wed, 19 Jan 2022 10:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA8TK-0000Pv-Hm; Wed, 19 Jan 2022 10:45:46 +0000
Received: by outflank-mailman (input) for mailman id 258803;
 Wed, 19 Jan 2022 10:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXRn=SD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nA8TJ-0000Pn-93
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 10:45:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f4d3e4-7914-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 11:45:42 +0100 (CET)
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
X-Inumbo-ID: f1f4d3e4-7914-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642589142;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cywRElMNjwXcRapN0oiSf4d2ojn5r7upoQm8+s41MYs=;
  b=NWTHbIMZKa2qAllly8hN1a3HaU0VrDp1VE/CFl35kGjC2WQKj4NI+rUP
   +lnLcCAgjpQ4r1eIbsCL1Vzlnad79mWBjfMecquLbvPhVoqQjU/PSd2UW
   xx9AYvRuHPus/QhYhEz3soLV1jo30WDHyGhn7z3px10dM1/y71+UrZdNY
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vaAa96CUTzFj0zu838nvT4nmUQEwVEScoIxg+fNaGmfJhMNn6iEJQcmYJaL8ew+7C5gz5Ds63x
 2SfNdTFHgR/EYOsvRlNdNzV0WEVwtXI49i5xhZxwCmHfCAW+GqcHQ99mhDqKCAxk3OEJfULHm8
 hqk/ELd4g4Ri8o/tJP0UJ6qyfEJ/4yeqaqX7DBN1YmEqEICn8426dsgI3YZuGbdttK5YWagw9O
 Or0XWU1a9cO5IJ5ybhcVXQr/fhKhDhFzxoQrHu3CTmVpflTW2f+QcMtJfql7BBZcvfzzCS2q61
 ToW6byOxCVfbXh68QLoB0tv7
X-SBRS: 5.2
X-MesageID: 62217023
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1tQ2XqPBslefyffvrR1SkMFynXyQoLVcMsEvi/4bfWQNrUpz0TwCn
 2IWWmyEOP3YMzT3Kt92Po22p0lSvJ/cnIVnSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Esyw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxWEh4FL8
 cpNjMKxVxoxP/fzofsgdzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uQv4YHhG1r7ixINcrmS
 O0+ewIxVUnvYB1LEU0OVq8mjs790xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiR8pPmV2Dj
 nnb5Gm/CRYfXPSWzDHUrFq3nOTB2yX2ROo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUa5Rnc8JPL4z/HB3YZVj8bV+U5iesfEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHvJ6sz67DFzFtW
 UTofeDEvIji6rnXxUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpeJGSwP
 BWM51kIjHO2AJdMRfUnC25WI557pZUM6Py/DqyEBjawSsUZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkr7uZLDOi/9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bQo/mpeLegMnC/HE96BQ1iEEXX8rit+pMHLbDSc1M2cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1pgVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:TVAqkKNKgnhVG8BcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,299,1635220800"; 
   d="scan'208";a="62217023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfSO+7+19vXhqFwXfaraM/yCDkQD4WLHur28hscrQw34Ju4xce1vY6fLYrCcIimBJBU6xtfJvQ/49YQT5aYFZm0TGg1C5FNojNAJ0649eh6ItyjYqHDtYZUHqPl2LZONhYm1vyOPgbrGiRDGG+AN2CeN+4WfnU9JWHUyb28pdMU/7KlCkD7XLLCvWthjLOMhPZK0L87hAyJnTN/Mi1BUPI/x6Wo9eTNE7yHc8J5W+Zfj6vSy2cPUpU5xszLNEKWUn0v/Cp0A0oD3m5IjTTz3weC6jBsyKb0K9ADJOap/sPxnbOrOs2IJkly77Q1esNNYnRIFx3Tv2XMRQLn10MCARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYrW1CN/BFtNfd52IQQkrGsT3O2O+i9L+EpTHOjbg8g=;
 b=HwuqruZ4V/TdzYdtPPx1IjEDuzC2n/uKIXv/N/R0Xpb/gXZdVcaP30acJSUR8vFHgXMp7uWJ0kfbmE0xQmyisIr4MRTf0qsf7PQ+E0zY4nEvZ5twLVfqGd5rsIeJuSaRZuH/eh/PcdExfZluP3V/bx74cqcnqsDCx2My4dUP5Rnp6eLhBT5qDT+gnFlFNtTatdmC5pCyVBUdVmj0q5TCgpCa+tLfxt/gOCbUnEptibdE27ZI+lIyE8c3gRNneToOb1+SzWQdxI9KFFFh5t3MWwjmc9M+GfxY8KBGzKCVO1GTE0PJpGRjXQ1T6CXX/92k7UmbY/x/lIEkQrHg85Vlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYrW1CN/BFtNfd52IQQkrGsT3O2O+i9L+EpTHOjbg8g=;
 b=S0I350E2/RljNYrt5NgboLN6nhGhVflqvCmQ/GK+RwkIN6B7Iy8XJb2a3lZsPcyRcVBb6MdK+y8+v7IjCJLDhN72URfN0Fw8vAXhXilWkLPJXNYGSgfdo7/da5VdmpiUvpIpwGXMpKF7U4cLGSaP6rkpHYw9qBdtrWCXsKxPzH4=
Date: Wed, 19 Jan 2022 11:45:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 08/12] libs/guest: rework xc_cpuid_xend_policy
Message-ID: <YefryjrREotJfl8F@Air-de-Roger>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-9-roger.pau@citrix.com>
 <f20a04e6-cfc6-1099-0944-eadf8192ae6f@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20a04e6-cfc6-1099-0944-eadf8192ae6f@srcf.net>
X-ClientProxiedBy: MR2P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::12)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef2ce963-80c9-4b10-01de-08d9db38d387
X-MS-TrafficTypeDiagnostic: DM6PR03MB3737:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3737DA37CA2D6AE9627232F98F599@DM6PR03MB3737.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIGePvAgJB0/2+VmnOizGoc7WfA/IwxLOPb5Lssnm1dN3binEQzTfMjQQe87fNBgmZp6ZOvaF2wU9QmgKMYlPcwvf+be6blLhU3Q90G0bbdvCYDNjAmUs5vT72eA0Jwvv/FcKL61Hz6r/DnfGRmpH8kTS/3lYReBuIfEIAna79TA8vmGj3YQrzPoZyza2tWFuFJjzi4zFIkFqMh0pDqZKIbLTMvBvp/RVIzfUF37ej8JsTFS01HZb8g9m8Ri3Xm+8qKoIUqWaHKEWV24TQ9Z1UN7vhEPIjs+dK67zmN5/QwUVeaRcSHgzW0iVl8L2X0pBhJopS7vUV6r+bp6y6+fimyzgPK7Zw9sGy0UZ6M5xJYbUur9n6kTc4ThUY2yOPPQRobftFp91Hxd2QDj9NrcK9eVtgQVUVr1HwUNDJf2Z4PfZm/s3kB5YBVeGLgsgaOzQfyUipR33qTR9pvwIVp4RcVnWrXAbicw72y8RM5kmQEJ+iK4gHWJ3YIZu//GTsyc6u8CcKdRH98IOnnRk/wHYFYDHEdeTdu8mnt5YM3ONGfb6UbgvTV2sUC/6tPt1g4dWdDQwQbfEWBjtdoe/ZkHRZXp3o7VwofFYBnalQtqZ5ipRKHDYjYnKN7PlWAtdrW/uH0rSSvBP+9yner1vjRv6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(26005)(86362001)(508600001)(83380400001)(6486002)(66946007)(53546011)(186003)(66556008)(66476007)(5660300002)(6666004)(6506007)(54906003)(85182001)(33716001)(6916009)(316002)(38100700002)(9686003)(82960400001)(8676002)(2906002)(8936002)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09McTlVSkx0bkt3WXhIZTdLOW1HTTRiVTF2aVQ0bWlCT1hkelJ4M3dNbVA1?=
 =?utf-8?B?L3BwT0h5SmVkMDlaWkh1MjB3bEU1bklkWVhLbm8wd09zK1BRaFJGbG1yVFhm?=
 =?utf-8?B?OHc1eFQ4cDloRXVraVRCMFFXbCtqYUhjeEM2ZmNRQy9CRkNPQmNpS0tvUUFG?=
 =?utf-8?B?ZnZiaWtmemtpNUl6NzBMdGhPdGZwSjJ1WFNNTWxDSVdkcHhWd2h1cFgwNEky?=
 =?utf-8?B?NjlOU3JJY2EvcWhlV0JHcVpzUFIyZ1BUNHQxVmc3b1pRS0pvUFZjZUVNUVpE?=
 =?utf-8?B?SklKdmwwYUZvT0J1a2xnUWJST0RtZDlsM0dpbm42a0FzMHVHQ1Y0S1FGeFFj?=
 =?utf-8?B?SUtiRTNZODFZSkFpOURVcmVaK3pnT0ZBc3NjWHNFMWFqQTBKWEtVajdLbnpt?=
 =?utf-8?B?VjJPaGx2YTBaTzZwNEJGbDh0dXJidDNiQUIwb1k5TE1ieW1qbHY5SkoxSkg0?=
 =?utf-8?B?YUpKa1A5cDlEZmdEeGpFemt5TzNVYTFadjJMZFJBRUhwYk9Odjc3MFJobkc0?=
 =?utf-8?B?Yjg0LzhrVHhwZXErWTZjRTd0NVR3K3IxZGg3MTlaZTJkaCtRSWRUSUt3SHov?=
 =?utf-8?B?MWFUaGphMzdpR0NLcVFyLzh2QkIxOHkvYnVjTUd0M1ZiT2V0dldsNU9uYTRM?=
 =?utf-8?B?RjI0ZENWQlYvVGxwd05aZGV5MnNaVm15YkYydnVrcDFzdVNmajJjZkl0ODFL?=
 =?utf-8?B?VmdlM2RBc3Azd1kzUFFNSE94UEdaMUQzeW1hOVoxTStWSUd5NnhBRWh1VEZj?=
 =?utf-8?B?MGphOTNaQXVTNGlhU1ZsZXBkUXl5b0JvNGcyTE5rQklLdkltTitzNFAxczZT?=
 =?utf-8?B?aEFXcGZaakpwc1JIR29FQm5sb2hMQUdUMm9OOWEvbGkzd296WVhpVkFzMmxh?=
 =?utf-8?B?dXZEY2RBQm5qMWpPbzgzenY3SjZHR2FVVVlVS2IyUlJUL2JWYldLYUJuTmcy?=
 =?utf-8?B?WFFWYlYzMDIvUmdWc1JaVEVEaXkwcmRPcW5RUzRKVkhrbm9zSzdabW5JcnRG?=
 =?utf-8?B?VzFXZ1R6LzQyOHczWXJSZVhhdXdFTmx4L3BiUGVnRC9yMTFZV0QzVHRURy9u?=
 =?utf-8?B?UlNqeXhmNjN1eU4zM3VJTEhiSHEyTU50Zms1bWEwc2pOVGdIUVIzZ0VsdXdl?=
 =?utf-8?B?QndrMWJxM3A2T3NIeFU0cUFKSmE0YTk1L0xHZ0h1V2NyVldhT2xLWlN1bjRW?=
 =?utf-8?B?ZFBJdGxoNU5XOUpncHFHVTV2V0dXWHhmcGN6ZHYxaXhLQ1JSZFgxeVdTenpI?=
 =?utf-8?B?cG9pWU9sT2poSExiMy9saDdZbzdHZ2c1cE5wSTdXQ2djMEVCSkxSQndGOTlw?=
 =?utf-8?B?alpCR3k3eFV5UEduSmZTN0hQeGxmZXBlcGhLM3NId2crQXpsTGpuV3RGUUVT?=
 =?utf-8?B?WFlMdDd0eG1IU3hJaUkvcUdXN3B6Q0RacVJQb2xucTV1S3BHR0lReXRPczBw?=
 =?utf-8?B?VHpLanpJQTQyZW5jUFpJZzJsZUQ2cG03QlExa251UTVGc1F6YWJ3ZnZZb1Uy?=
 =?utf-8?B?dlM0OWlZUUhlV240WlJSRVIxUC9xbjd0Y01wQzRKbTNZV08wRGM5UHBEZUkr?=
 =?utf-8?B?dkRIVkh0Y2FqaUhObVZZTFhOemZyaE9PY3doY0VUMXhCMjRwN3ZLMXZmZEg4?=
 =?utf-8?B?b0ZmYXpLUlF3WHhNUzYvbFZSOTBScFp6UHp4cnZIZUpoOHo1OWZlQkdpaGRo?=
 =?utf-8?B?SUsra0xDUXZ5WmZ1b2tNNldRZU14aDUzVEh6TmkybUNyL1B5NmIwUnNMUVlM?=
 =?utf-8?B?Z0l1V0s4ZGJ3WWlGQmYyZTJQZ2wyMkJ5UVdPdGRmMklzcTBFRXIxQ0g5dlRE?=
 =?utf-8?B?OG9raUN2VGxhd3dxa1B1c3J0RG5QZXBWZklnemxIS3lxRDJ2UzFSRTlxUVpl?=
 =?utf-8?B?NmRsRTVlUklTQXk4NHhaUGt1aTBkc1kwQVQ5ektSRjVTNGYrckR1UERMbmxI?=
 =?utf-8?B?R0hLM1ZKRlNrYlpRV0hNMlpyVEg3cDV1VHdEY242WUEzeTJvQVgvbXI4V3g3?=
 =?utf-8?B?Z3JsWml2N1pGTEZRN1oyZHU0OHh4UzN0MnBiOWVKRS9ObXhJVStKRmhreFdN?=
 =?utf-8?B?K1hrUU1lTFFuczhqcklQUC9Ec3crT2ROQzlyblF5dzczZkFIcVZaOFBRMVNL?=
 =?utf-8?B?OWhvc1l0Uy9FQUhnZ0psRFpmTG1UZkhVcVAvNXVKbnlwMXVSeGJyOUsrc3Jh?=
 =?utf-8?Q?K3CKMFkSe//yik3SGLCeWmg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2ce963-80c9-4b10-01de-08d9db38d387
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 10:45:36.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S58ERUpUJHrj4KTBLu/SFP5Z9NVg2m1cclulzuvCwZpDJvvVLjrNjh/tYW3qBFU2LTDyMp4FrZzoL9lA9u5vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3737
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 02:06:25PM +0000, Andrew Cooper wrote:
> On 17/01/2022 09:48, Roger Pau Monne wrote:
> > Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid
> 
> I'm not convinced by this name.  'xend' is important because it's the
> format of the data passed, which 'cpuid' is not.

The format would be the libxc format now. Having xend here is a
layering violation IMO.

Note this function goes away in patch 11, so I'm unsure there's a lot
of value in discussing over the name of a function that's about to
disappear.

> It is a horribly inefficient format, and really doesn't want to survive
> cleanup to the internals of libxl.

Even when moved to the internals of libxl the format is not exposed to
users of libxl (it's a libxl__cpuid_policy in libxl_internal.h), so we
are free to modify it at our own will. I would defer the changes to
the format to a separate series, there's enough churn here already. My
aim was to provide a new interface while keeping the functional
changes to a minimum.

> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index e7ae133d8d..9060a2f763 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -254,144 +254,107 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
> >      return ret;
> >  }
> >  
> > -static int compare_leaves(const void *l, const void *r)
> > -{
> > -    const xen_cpuid_leaf_t *lhs = l;
> > -    const xen_cpuid_leaf_t *rhs = r;
> > -
> > -    if ( lhs->leaf != rhs->leaf )
> > -        return lhs->leaf < rhs->leaf ? -1 : 1;
> > -
> > -    if ( lhs->subleaf != rhs->subleaf )
> > -        return lhs->subleaf < rhs->subleaf ? -1 : 1;
> > -
> > -    return 0;
> > -}
> > -
> > -static xen_cpuid_leaf_t *find_leaf(
> > -    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
> > -    const struct xc_xend_cpuid *xend)
> > -{
> > -    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
> > -
> > -    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
> > -}
> > -
> > -static int xc_cpuid_xend_policy(
> > -    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
> > +int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
> > +                              const struct xc_xend_cpuid *cpuid, bool hvm)
> >  {
> >      int rc;
> > -    xc_dominfo_t di;
> > -    unsigned int nr_leaves, nr_msrs;
> > -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> > -    /*
> > -     * Three full policies.  The host, default for the domain type,
> > -     * and domain current.
> > -     */
> > -    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
> > -    unsigned int nr_host, nr_def, nr_cur;
> > +    xc_cpu_policy_t *host = NULL, *def = NULL;
> >  
> > -    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
> > -         di.domid != domid )
> > -    {
> > -        ERROR("Failed to obtain d%d info", domid);
> > -        rc = -ESRCH;
> > -        goto fail;
> > -    }
> > -
> > -    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> > -    if ( rc )
> > -    {
> > -        PERROR("Failed to obtain policy info size");
> > -        rc = -errno;
> > -        goto fail;
> > -    }
> > -
> > -    rc = -ENOMEM;
> > -    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
> > -         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
> > -         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
> > -    {
> > -        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
> > -        goto fail;
> > -    }
> > -
> > -    /* Get the domain's current policy. */
> > -    nr_msrs = 0;
> > -    nr_cur = nr_leaves;
> > -    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
> > -    if ( rc )
> > +    host = xc_cpu_policy_init();
> > +    def = xc_cpu_policy_init();
> > +    if ( !host || !def )
> >      {
> > -        PERROR("Failed to obtain d%d current policy", domid);
> > -        rc = -errno;
> > -        goto fail;
> > +        PERROR("Failed to init policies");
> > +        rc = -ENOMEM;
> > +        goto out;
> >      }
> >  
> >      /* Get the domain type's default policy. */
> > -    nr_msrs = 0;
> > -    nr_def = nr_leaves;
> > -    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> > +    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> >                                             : XEN_SYSCTL_cpu_policy_pv_default,
> > -                               &nr_def, def, &nr_msrs, NULL);
> > +                                  def);
> >      if ( rc )
> >      {
> > -        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
> > -        rc = -errno;
> > -        goto fail;
> > +        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
> > +        goto out;
> >      }
> >  
> >      /* Get the host policy. */
> > -    nr_msrs = 0;
> > -    nr_host = nr_leaves;
> > -    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
> > -                               &nr_host, host, &nr_msrs, NULL);
> > +    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
> >      if ( rc )
> >      {
> >          PERROR("Failed to obtain host policy");
> > -        rc = -errno;
> > -        goto fail;
> > +        goto out;
> >      }
> >  
> >      rc = -EINVAL;
> > -    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
> > +    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
> >      {
> > -        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
> > -        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
> > -        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
> > +        xen_cpuid_leaf_t cur_leaf;
> > +        xen_cpuid_leaf_t def_leaf;
> > +        xen_cpuid_leaf_t host_leaf;
> >  
> > -        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
> > +        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
> > +                                     &cur_leaf);
> 
> This is a crazy increase in data shuffling.
> 
> Use x86_cpuid_get_leaf() from patch 2, which *is* find_leaf() for
> objects rather than lists, and removes the need to further-shuffle the
> data later now that you're not modifying cur in place.

This function will get moved into libxl in patch 11, and then it would
be a layering violation to call x86_cpuid_get_leaf, so it needs to use
the xc wrapper.

> It also removes the churn introduced by changing the indirection of
> these variables.
> 
> It also removes all callers of xc_cpu_policy_get_cpuid(), which don't
> have an obvious purpose to begin with.  Relatedly,
> xc_cpu_policy_get_msr() has no users at all, that I can see.

This was introduced in order to provide a sensible interface. It
doesn't make sense to allow getting cpuid leafs but not MSRs from a
policy IMO. I would expect other toolstacks, or libxl in the future to
make use of it.

If you don't think that's enough justification we can leave that patch
aside.

Thanks, Roger.

