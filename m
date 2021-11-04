Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA04456A6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221661.383487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mif6f-0003vf-OM; Thu, 04 Nov 2021 15:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221661.383487; Thu, 04 Nov 2021 15:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mif6f-0003t0-J8; Thu, 04 Nov 2021 15:56:49 +0000
Received: by outflank-mailman (input) for mailman id 221661;
 Thu, 04 Nov 2021 15:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbKJ=PX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mif6d-0003Zi-5l
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:56:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cde77e86-3d87-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 16:56:45 +0100 (CET)
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
X-Inumbo-ID: cde77e86-3d87-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636041405;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i6IKeA5L4ynZRoHMubHW0AUNG0cMpoOq05AhBwLpwKI=;
  b=bBwdzzIknVdV2YwYaOrFTTfELdZ7FJP8+vUcCjMqdSEk0DuP8puSOMV7
   jqdzAjY7BeO6THPo3WmU18IqwnhfIHSf8AfTYpP7BUY29TtP7hFVEfLhG
   VNfBFxP4ODT02dFEpztAT8V7vwFyjqIy88anLkND7D7fXCy4DaDsPu1sm
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jHrg3yN4/FbqTdrgKw2SgDp4nSrwyIlsY94F9iGKSir05qmKiC5/JzdmtgygqkanNo1/Y+0e2l
 mTSwcGeY4Shdz9yWu4j/CWmET/v4ZjnYWBr/GjhHSwVmbFMnfbgGlSSTNwyboNd3+41E3xTe+7
 6kpKuE72ma+7vWNrpiaXSyD6zsQZGoA/cWit87Zwl5+MAVIKCdhw9fbC4btWw3i4f1QOn4pb/l
 6VJZCLkdbn4ZQoUVt+s3uzvlYNFVq6j1KBCCa2tTMIontzuBrzSiojnW5TMp+fxDWL/6zk/xvt
 NtwgPsvOxe2ElkoTDr20bCZ6
X-SBRS: 5.1
X-MesageID: 57089463
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ipOUOKpEr/mNjTW6F259afZkINJeBmLvYhIvgKrLsJaIsI4StFCzt
 garIBmBPquPNGb1eNx+bI+08E4Hu8SDz9JgTwNk/31jEHgR9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IDlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbzzZhUJIJaVpMc6dx1dGh9fApVt16CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 pVBOWszMk+ojxtnH3FGVo5jhsCSplLYfABlkWO0vo4qyj2GpOB2+Oe0a4eEEjCQfu1XkVyfv
 Xnu5HniD1cRM9n34Tua8Fq8i+nXhyT5VYkOUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvQG9+AkZSIRj
 2OquPftADVRkYKtYl2Co+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpAif21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshSUvlhdwTXGY3h+Y1FAd7fYFUwZnY1TvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/QqMtzsU516l/CxfTgAahwyRoAeCnSWXFXWlByCmGbKhzy9+KTSufhnU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI8Rz1xVaSMmOx8E2Gn9owM/tr1E
 riGchYw4HL0hGHdKBXMbXZmabj1Wo14o259NispVWtEEVB5CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:pMx7TK138vB6h7HhlcrI5AqjBSJyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQizuRYjzrY3GeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwc4tqX41pD2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr6G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTohOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsIuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DofuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjHkV1FUsZ6Rt0kIb1K7qhBogL3Q79EWpgE286Ig/r1dop9an6hNDKWt5I
 z/Q+1Vff91P4krhJlGdZI8qP2MexrwqCL3QRCvyGvcZdU60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.87,209,1631592000"; 
   d="scan'208";a="57089463"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0ahA5OFbO4zIEBSeOQ75GKfZ1fAv8YTmElzxsqwAFQb5qj6yoe6XkUoKnM61Gjg+aipatnh/OwAgh8+S4hsPkTKguCJbaqcTrzGC6qFE8gixgP572W3FiwY2DDonS8lcgO1yPPRMp3oNZGFKvJIrGy+EFyjtxRpD+VHNLSaO9Eu5YdksOJE2ncCqZL+RB5e4mtmc3/rLaP9YZ5oaagaZNrK/2dBb4KGLW4t8zgobn/hHbu8f5x/kgrCAL/TYtsmeyHbSYfSjzpx8iLkgJ7JXQ0P+j0dnqfVfcazNGM9ET54upXHMUDHemQhChobJPv1yKGg2tdG0FuZiMcUPnYotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pO4Y2pzcdTpXHfDjwnB6vqw9YoAtbAfUHN0aOdRlU0=;
 b=no2IGBMrjoTcGjwL6/C9f6/U+1fVT4U/R3LgCWnGxmoCh0M+Z65uZAcrdWhdUr9swbUuwMITrkLmCogkoQaBjIixUe+Nl9LptbQlZ1OwdKcyC7pgFVyIK1/Dr0uBZLBrvPEM2yGOtLCyJ0qeN3yuM8JDWG6wIvVR6lc7dhuhI8wGs8WKvRkA+TlOMnGupAZ7oGnYAD/f/ZAXGbnpL5uWHf8fAz2O0858wWTgauNvGNw2fHHCevwHtmAIwY4tC8vKiyWfUY1ryls1TzrHVKbc1uHURtPjCiJEHnUQ5kMRGw4CIhZgD22JaDtb88GWkdqWYa8nAeQCTHWP6LLgzAsRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pO4Y2pzcdTpXHfDjwnB6vqw9YoAtbAfUHN0aOdRlU0=;
 b=bVeDS3Mqwhnc8F1N6hGM2QfxB06sAPHebwKP4T4jO5/1vqxhMOAUKkdS6cqKhI8B6EzbHCdFrENCV33s8+UGZUR8T3Y+tB9jC9OPwGusfj/rVAqzvRZicvn2MFggToywBQeZXkSTnLUKpalSlvEPK/gCo+cMZrvZQhPeQvMIA6c=
To: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20211104120324.9668-1-jgross@suse.com>
 <20211104120324.9668-2-jgross@suse.com>
 <24963.62355.300645.675596@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH-for-4.16 1/2] configure: modify default of building
 rombios
Message-ID: <08637145-7f56-e605-5232-003b9b2d8009@citrix.com>
Date: Thu, 4 Nov 2021 15:56:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24963.62355.300645.675596@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0123.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a0a068d-f4c4-4866-6c46-08d99fabb081
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5773:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57730BD8FD44DE4B0BF54436BA8D9@SJ0PR03MB5773.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGY/17W2vE4Q+GPkLKvmufkeyIi6PLtPIfLExy2piG3jlKSowmFHiEZYwMYJe3xIrctGZjrVIas0qx6LWxMWrCOkd3x9nslSW7Y1wtOXl839wYToxZdoJv/eojLEgmexP4TB3sfVkJbLpAQGnNk8i50Uggs/lWzyp1+LeF8V8iS7UhFIPLRRSsvjjwn7wA2+hN7o0kjZIFU6IOPFetwTP3yV2/rf7ZankvjA2MdL91hxeVPjNVepQQyNukEFJeSSVe5OWCUr2k5gAeREesrCwBODoxiewaAPan3w5M2wMeaoni/LJASl4eUJzKoa9MGvRgnI9tyF7Yqf5SRUN6EONiSm1pQxq3AEqOaQ5q8Ly72Pn0ovLpqIK4Mc9wCmZZZTcA4hHdIfTehQC4ISdJrjeoHn8U3tndOVTocMKCSnqfRUd1ofIisF7BDmVdQXsjzZ/MN5k854/xp45GoYfJxEVFkfo89/wn3RWGJiRbNBV7fHIYCwZQxsBI+nROzlivWPGXfiqnJfgqmnc5Hhj9YXEiRAvCFgZeoUBdWMfxvL2lb/mPlOKCJvZ2Oc7nJKIS8FPsSqWtOMhiVpUL867oEH36s0HZJPGP4iqXF+3liyQ2ceemLdOGtPxaJ2iV+aRVO4jyDin3ZoTc5GMDV24OK36gdRk33037oDiQ7CSRq7wBOuGtvm0ED5ldck11Se6G+lNAA485V345ul+egCgAtBvgyM0fM0poa6BKPgQz443IAz1eXHLSQxvxVeq5056kAi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(31696002)(66476007)(53546011)(110136005)(66556008)(26005)(186003)(38100700002)(6486002)(82960400001)(508600001)(16576012)(8676002)(316002)(66946007)(2906002)(6666004)(2616005)(31686004)(86362001)(5660300002)(956004)(4326008)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFludW5BTEgvRHNxK0pBd2F0Q1l6dzFQZWdPRFVYaFRGSW5ORnpFT1owcHY3?=
 =?utf-8?B?N1NXZTFSQ2ljOVhxbHl6UmNvQVVFZGEvMnhsMjY3c2NXYlhVcWxLa2JGcnJK?=
 =?utf-8?B?RE1Gek41d20yaEt5aFBqbXZQekVOc3dyQ1dRc3hYWmlqZ3BCaEs3ZnJIME4x?=
 =?utf-8?B?eVVrSXpWRjQ3VXFBUEJ0KzlkdHRFWUxYUTJnR2tBWk1JYzZrdHdNdUFLUlA0?=
 =?utf-8?B?dXcvQUkyQmF0Tjh0K3lNUFNCUDFRbk1xZzg2Qm9MY2NrNzBxMHFXbUxUWHg1?=
 =?utf-8?B?NURiM3ZqdTBnSDZqbTVvdVR3Y3UwWWxHMy9ZRm9WMVNYaGxIeDNFUlkwMnRQ?=
 =?utf-8?B?WmVHS056QzQwUGxaeitsY294WldaRmgzUEZhY1BKUkVKWlRkZ0Z0dU1GYWpm?=
 =?utf-8?B?ZFZDdHh1VjV5M0QvUnFnSURqOU1UblJadjJ4UzhZODgzYUxXSm9hMDJhRWdW?=
 =?utf-8?B?L1g3NDR1YU04V1E5MDQxNVhHWjZEOTZhSjAzamhLd3hkVmIvMDRhTzR3QjdH?=
 =?utf-8?B?dlcxQ1pIVk1uNXMxVGVzc3gzZU9uMTFCTmNMUk9VUGFwTit2bFM4RnVoYXMw?=
 =?utf-8?B?QWRjbWNSNU5wYXFrZy9kM3lKV2tWUFQ1cHM2alUwOGNxWnQ3dVJseFNFUC9i?=
 =?utf-8?B?K0JZWkNmcGFaMDZ4WUNzQjcrR0tFZnN1NGVmd0dsNXh5ZnlwZkZ5VjdCOVdu?=
 =?utf-8?B?M1M5SURIMFU2TmxSMUhRSitNektLTnFtOWxUZW5uSit6NXZEdkNtNnluL2JS?=
 =?utf-8?B?ZnFBTkszNU1WMEJkUGJhMlJHSldtaFdZNnl1M0dKaE5VSFI1K2JPZC9yMGRv?=
 =?utf-8?B?ckVkNks4Y2pDS3QxT1RqSHZlZmlBM25GQXliQ1RsaUdMYXZRYXVTYkFuNEhF?=
 =?utf-8?B?RWpDM21HSDhuUlMySW1xc3ozdmRBdi83bzl4U21FRUs0TnRmU3ZEQnJieGRO?=
 =?utf-8?B?Ykp6cElnOGRHTkc2Q05Wdk8yQU55UmVHL20zMFBsUjA0UkNoeERqMUREeXRE?=
 =?utf-8?B?cWtaTnNGOXpzNTV5elFUMFZYUjFsaVFWL0ZoM1dBMTAyaHlnQWdjVjRhMFZC?=
 =?utf-8?B?cTdLUDRNRkIzZ25UR2wwdWhhKzlvYUpjUFZpZ2RwaC9JYkZHczY5QzFpc0xu?=
 =?utf-8?B?b3B2YXdNd2xRNjNpTUtVU25DRkozQXRla3g5ZXE4WUlKUnNuelRzUDFSNzBx?=
 =?utf-8?B?NGZmbGVDNnNwUUI5QWxPNWNmV3dlN05JMWorYmZwWmlqU3ZqNDRzMDRKNHFr?=
 =?utf-8?B?cW9Md2pLZC9KRkYyWk1mSzBSR0VxRFU3QTIvQnZPTWJ5Y1o1eExURGl1VzJR?=
 =?utf-8?B?bVZNeElRSDlhNEVxL3VLOFFOVERaaTgvRHdjdjg3T1R2ZlFVN05ONy8yK0NC?=
 =?utf-8?B?cmxWcmpueUk2NFNLMjhvYXVEMGdRR3BCZVhHQjhoOFYvN2U3Ryt0Ry8zajRB?=
 =?utf-8?B?TktPeVNtZjB1S2hYVUdWRnArYUVVSzQ0UTVFY3YwUU1GVUFNdGVxVGFzME92?=
 =?utf-8?B?NElORm1hT3hFY0UzS3BaOXRFVTFMTkMwOExGZ3pSazgySDYzR3JENWZzWHNP?=
 =?utf-8?B?aFJ2eEhtbjlKdFNCYm5EYkc1WHFkYUFsYVJqSzhsNmR0V09GUjVzMUxEeVFN?=
 =?utf-8?B?eDBGcHJDRGhEazdWc1ZLNXFySndjaG15Z0FZcEthQUtHWXdCdk5nVWFQOE1L?=
 =?utf-8?B?MUZEd1lyOVAvbDl6L2ZzUjVQTU41aGFWak1ZOUwyL241b3AyUGFVckJsWGYx?=
 =?utf-8?B?aEI5WHdSYVd6TnFkYzdicUdMYXVmWlM5UHVlcjg4SjZpaHU1QlBNRks5OTMr?=
 =?utf-8?B?UXB3WmpWZm5OeWNMQy9Qc1BlTS9iL2ZoNWJEcVIwSkhPUlh4cmgwdDRsdXpU?=
 =?utf-8?B?MlVnYmErNEg0RFA3dy9Od2Y4ZEUvVXBpNlN1Mm1oYWRhMVg1cmJGajByQmlR?=
 =?utf-8?B?NlVHWXVSK0t5T0pGaEtNbXp1L2Q5V3lhcDJMMVBIdTFETVRwZmxFQURFeDFT?=
 =?utf-8?B?cW8xc0dQUm4yQ0FGMGVyd0pSbUhNTVFwOVp5S1lwOXQzVzFUc2V5MDNkNmZ1?=
 =?utf-8?B?eHBkSWN4R0pyeFVRSExpRjh6WHV5VFJmQ3lXdldWVmlaVkt2U2lxRVdvYy9R?=
 =?utf-8?B?ZWJuenQ5UXJERWdnTzdKV3BwNExWMDhINHM2YzNGV29nQzBVZUJaUkNnMG10?=
 =?utf-8?B?QmZscjJBS1I2MUtEdHVPQnJYaHBDdUtjUFlwbnN4R3BzUTcraXVRSjBOUVZl?=
 =?utf-8?B?Q2kzR2F1L0FNUkRsVU1BcmdLYU93PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0a068d-f4c4-4866-6c46-08d99fabb081
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 15:56:40.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsQotM9Xkz0yWPGMQ6BGHLkkPezAOubsFWsLLHSeG3DDu1/dQwHfWO2KHL9EU0tcpjm3Y3igfftyedV/AUqJ+H6SqqnBZ4mherL1YWC/4II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5773
X-OriginatorOrg: citrix.com

On 04/11/2021 14:52, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH-for-4.16 1/2] configure: modify default of =
building rombios"):
>> The tools/configure script will default to build rombios if qemu
>> traditional is enabled. If rombios is being built, ipxe will be built
>> per default, too.
>>
>> This results in rombios and ipxe no longer being built per default when
>> disabling qemu traditional.
>>
>> Fix that be rearranging the dependencies:
>>
>> - build ipxe per default
>> - build rombios per default if either ipxe or qemu traditional are
>>   being built
>>
>> This modification prepares not building qemu traditional per default
>> without affecting build of rombios and ipxe.
> Thanks.  We had a conversation on irc about this.  In summary:
>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
>
>
> Discussion:
>
> Both before and after this patch --with-system-ipxe --disable-ipxe (or
> --with-system-ipxe on arm) would set IPXE_PATH but not cause ipxe to
> be actually built.  I think that is correct.
>
> We discussed the linkage between rombios and ipxe.  Our understanding
> is that thbe intent was to support two configurations:
>   qemu-trad + {hvmloader, rombios, ipxe}
>   qemu-upstraem + {hvmloader, seabios, pxe rom provided by qemu}
>
> Before this patch, --disable-rombios --enable-ipxe would be an error.
> After this patch, it is tolerated (and indeed, it might occur with
> only one of those options due to defaulting).  But we think that there
> is no actual functional link between these pieces: ie, nothing will
> actually go wrong.  You just might not have ipxe support since you
> wouldn't be using trad at all.
>
> We think that someone who explicitly manipulates the
> --en/disable-rombios and --en/disable-ipxe options so as to construct
> such a situation ought to know what they are doing and should get what
> the asked for.
>
> Most people will controlling this via --en/disable-qemu-trad, which
> will do a plausible. thing.
>
>
> I think *this* patch is a bugfix, although to rather obscure configure
> behaviour.  I am inclined to release ack both this and the followup,
> for the reasons I gave previously.
>
> Comments (especially, anything to contradict what I wrote above) ASAP
> please.

I think the patch will fix the problem from CI.=C2=A0 And from that point o=
f
view it is an improvement.

However,=C2=A0 I don't think the help text is correct any more.=C2=A0 Speci=
fically:

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Use system supplied IPXE PATH instea=
d of building and installing
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 our own version, it takes prece=
dence over --{en,dis}able-ipxe
and is
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bound by the presence of rombio=
s, --without-system-ipxe is an
error]),[

and the binding to RomBIOS is no longer true AFAICT.=C2=A0 At a minimum, I
think the wording there needs tweaking.

If tweaking is going on, then "per default" in the commit message feels
a little awkward, and would more normally be "by default".

Otherwise, LGTM.

~Andrew


