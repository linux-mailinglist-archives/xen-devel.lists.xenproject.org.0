Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40514451BB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 11:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221421.383120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaIB-0000Ei-JI; Thu, 04 Nov 2021 10:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221421.383120; Thu, 04 Nov 2021 10:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaIB-0000Br-Fm; Thu, 04 Nov 2021 10:48:23 +0000
Received: by outflank-mailman (input) for mailman id 221421;
 Thu, 04 Nov 2021 10:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbKJ=PX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1miaI9-0000Bl-Ra
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 10:48:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7b7c284-3d5c-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 11:48:19 +0100 (CET)
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
X-Inumbo-ID: b7b7c284-3d5c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636022899;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BL0t2KZ+dMNR47mWg5wvBPm/knloEJ0jkB6nfDydSzE=;
  b=VGN3y9ai37NZEjs5XCaz8bsBvNcGprEaR+xElbZvWtJ96v6R+LYYtH9b
   Co6Ar91nI/sYt6ZlWhxgoHpOzNDsR7k8NYog5Bqb1r9p4O3ENMSpf9ij+
   z3m2cn2iLZlNMx8tMi59HyA9CHSskVAXiquOetmChvCIG2hDoAYZONOFh
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dUCJrT+QWLdxsxTW9yJB5kv6U3Kb8I4TuZq3DzDeu4Vr8bnn5qNAEpIlVetRiK5Lj+wDlKo5i+
 WoxOghHb1E3mMtEExA6EsuHiDk8cAYwkJXbJVcqpwHIE3gIEH18jHp00W7OY7DGZmUp4fZ+x2h
 UHK8OlRyaAsfBoxu2EXYaRa7nr5oXh5ZNwmDceEskouQT9ET+0WMVGwDReA8EAFP21mQqcUc2g
 pp8LgGFmD1MOxan/rghd7r4K/4iwtHTvtVNFbIi7s5SqClCXuoTH6Iq+OIENYqz2P3u4h5ev2F
 WToRPJdKSqmP+/NtuR6z+ANq
X-SBRS: 5.1
X-MesageID: 58999591
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nH4G6quqzGdj1jLBEdvfGVXeF+fnVKdZMUV32f8akzHdYApBsoF/q
 tZmKWqBbq3YNmPxetggOt+/o0sE65bTyIVqTgM5qCBgRClG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplmr6XaTkJY/LwtMsTVhtoLA15J4drweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5tIOGc+NXwsZTVhYgsKU6M6u96tuV/2XzhlqH2St64etj27IAtZj+G2bYu9lsaxbcRKnG6Iq
 2Te5WP7DxoGctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDUd3VTxC+5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOm+0RZQIKi
 wC1s/znAD5fj5GSU1iwz+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qmf22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUc7leM+lGrxl8FSVCxCtam20bblHRchJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsPtPvVpxznfK4RLwJs8w4iPIUMvCdkyfdrUlTibO4hTixwCDAb4lmY
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQj59W6GKnOp+JuSIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILOO5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:VO7Dt6C3jth9ePvlHeg8sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JTjJjVWPGVXgslbnnZE422gYytLrWd9dPgE/d
 anl7F6T23KQwVoUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFh0dL5iUUtKPpZ2fSKGMB2+ffvyChPnHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="58999591"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt+/kymELTzoe40lXNAn7eQUuZIceVWIzmKtMa95+/+CBfThsRhJS8Te4g5azvaSgk/F09Vgshs9QlvWrXF2wOP08/Bj5gOABcpjxQzVpJcF4gValv87wtg5LJV5xqje3OGrD/2zeAQCKnswSVZkCNm+t3CoJ3oapKnY5oyX+USIxBgu5ImysTwsunjLKj6r4Ql6knUJFPt7U/VRA3TGbUkdFhuZlqUh3f+vNuLEA8amRH3AISNDaaEPkMyKpa2YiyNPvCTxxjWDjU87nYOzDBFidnejjcG81l9yzXQivZKAdahTWS1ZN/SlvX4UWPl7QSkTHwa+kmZBk9+PdNHplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZL74gpMZNhOsIucIIbBcK1/5VYlyzbYulIQ/CkgVEU=;
 b=fRJb/3K46SrQyNk/treIHWKPRhPjyW8wyVrX1RSPHvRT6Gw2CvfXZVtYf0v0/0AIDt6QytBCdvezyLlp4BzZkrOZlOGfiJvhs+CPph+h2BSk0EwqicwKo0/HpZq213EhB5wWoGwEoEYExLVeSLGUZNzK79mJhkil0eb7gYMcN+MWsYA4OEl3RK1orIbK/es0uHkR4YgEn9JGpMg8iF3K3mRfPtkpvqUHHPPN4MA3cSDAyAzcbenBJeQeaS3PkT4SKwM+/E26INs36O+vJA8cbJ3boMpiWQ8JX0WvC8hqwCXG3205URrK1bi0SI/iIgW/W/lWjESKheyci0kJpKouPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZL74gpMZNhOsIucIIbBcK1/5VYlyzbYulIQ/CkgVEU=;
 b=OD07dzwEBl9D0G9y5NLGvIZJNgEnRD8fOAtpQ2zv6X1Es/rPi/hlyvLv6kKkTyCVQEqf6R+NXNcBPcE8UdzryUD+n1dt1ranWSkiuO3bvFXVLhjWZhX4H5iPQVtyvz/DML0OOqx4j0ATPtP9iZ+qYFKx0rs3KLbWv+nV/lUeOkE=
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Message-ID: <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
Date: Thu, 4 Nov 2021 10:48:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e989a163-6ccc-4029-e420-08d99f8096bb
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3495E1CA2075C653087BA2E2BA8D9@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/JULrbplkHzKb+lEO1/Uwgpu+6xl7yUDG4rFaPVD5BrStG7k76YSkxMODUzhMM6W+uUPiSAIApIfxgnNcnZDOFTm4DRgRXUaaUgJ4iKP9f6TYeTOY7HzNacQIgqu5oByYYATKbRW9aOFyuOlI0Uz8Zx6RiSnMtKXcxjvjM/zKW8HvHeSJM/6vTgTQ69/WzyP2Vi5IRrc3QQdwk6d5SwgisZJHCrVbJ34duZPd4dt2aqS5GmD7ma8gT+etM1T2CRlbF58hX/5t9qati8nDBac0tjlc5ytKwUxXqf7OzLMfGvGBav/aDdNGFVpAZ+buiNj+EM05LE49OFxnV8xEYKBLBSclKN71yzCN8K166iIFVoLxHn3OGzXFrEsCeAdX55zV7QtyvThAxmgwLZgubUlNWGLS+DRUSGbvGc3pdwRpNLjyTN8n8d2Kr8PGEzdbZovAMI4IGgUnDDe0p2MPr2HAQQRPO7a+lhqnzx5C4bD2jGBgJxSGp4g2F4TRS5ujZnM8fG8zmkfnnX8WFf2f6jmXpM/+r8sbC5POWKPwHRwjNVvDsmCE1oDKe/87d29z5GuOcpxBFuifuxOdNoS7Zen4laZbV5s1QMOTLsg9BYZAGLXEGYD9DJfLolujMHFJymvXR41xl6BdcPJrs6CSI9Lt4gAv+kix0B+WIdZVwH8UiPC1UbvzFRcY3DW9lylhp1iCtYNLPc0D2UmuF6mwH6SWVJk97RvChmzcnnyvZ98aF4r+kwjPtMKEehSXIZ5M5++pb+9x4OukWs4muYs0alFEm0N+g2lZHGfv7eh9aR3wzLHKvhXtfPHxwbic+K5ERo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(110136005)(82960400001)(4326008)(54906003)(6486002)(31686004)(16576012)(83380400001)(186003)(956004)(6666004)(966005)(8676002)(31696002)(5660300002)(53546011)(8936002)(508600001)(66476007)(66556008)(26005)(2906002)(66946007)(36756003)(38100700002)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlwYnA1NUtqSHkwbjIzelpaS09DOGlOUzdXOERCaDdLZkROZDZzeEE2QVBY?=
 =?utf-8?B?VDJPQW9ITmZNOUZnU25HT0JVU1Q0VVk1TlFJVTRBMFhzdHFxa1ozdU5ZblVx?=
 =?utf-8?B?UllNb2E4Z29yMEhNV3J1WkVUOEJERGxxakxMcktiMjFUd0NGMVZESEU3Kzkx?=
 =?utf-8?B?VERkS2s2blZDMXpFdFFiWFI2MlFicHBLd3Z5RWxEdnJpVHI3Y1hLNi85MC9D?=
 =?utf-8?B?TFF6aGZQT1l3MGFKRzBiWjRITDRBOUpBZmRFUWtvZjlwdlRGRWVnOUdmWGF6?=
 =?utf-8?B?a0NEdENjWkJuMnpKeG12dkxvSk5pYWNveGNJQVJ3VVh2M21xbnlHcHRrSG9Y?=
 =?utf-8?B?K0FaV01lNWpXL3A0LzVBaHI3cUFYZWZycXRMUmUrV3FnRWVWSTBHdC9HUkN1?=
 =?utf-8?B?NExzbU5EWkc4TGpaN3M2T1U2VURlbmxUMTJFNHRvL1hTdGdXTGJzR1FkZ3k3?=
 =?utf-8?B?ZHh6NGRLVnJ6ZFZpNE95L1YvcTNad3F3QnBUblp2dzd5T0JqVjRuNlB2emNt?=
 =?utf-8?B?MkJaZW1BVXJUTDd4UXBJajY3dldKSkFvUkJ1c0dtbEVaeDAyZHdVdjFuZGhl?=
 =?utf-8?B?UWZROUVMTURIN29laXFoRW1vVnFTekFReTErM1pkMkMrU25oZmhLaGRnakpN?=
 =?utf-8?B?Y3FUZ3hFeGFIOFJSUXdKVnNyNkVFVGlBdElGVXhPQlNYMG80VHk2cnNvZi9E?=
 =?utf-8?B?aElPZ21kYS85aDBZLzRIWThuMWo1VHBUMGd6WThkODJnektpa2VpZWZEUUMv?=
 =?utf-8?B?Y2FsalNiellhem56ZnhNT1hEajJLZCtZNTRQZDdkbkM2RTZlVDhLOG9ZTTdS?=
 =?utf-8?B?ZktIQm4wbVJyTE11N0kzSXpuOTIvWUlSb3ptVmYwZkxFNEVYS3BQNnBZS3hu?=
 =?utf-8?B?OG4xajNJUlJhdnN5THlNWjdnZC9aeVRrK0dCTnh5Z1dlZlNqUlFBL2VEQXhP?=
 =?utf-8?B?YlRtL1FNUVBmcVlVbTZzVUFVZlNVdkwrUy80TFZCTUU0a0RDWHIwWmppa0ZW?=
 =?utf-8?B?WlM3bHJ0MVByT3VqZFBBUXd3MmJaWldkUGZTaWRaMzd1ZzNSa2xzU3JRUW9N?=
 =?utf-8?B?U01TbGliQkl0cWozVXB0MGUybzRMaGNXVWFRdVRJUmtaeU40RHY2VnJ1Q0N5?=
 =?utf-8?B?NFhLWXlJTllHNHF4MlFEU2g1NDRSTERnMmtjWTZYR1JOWGVvT3FxTXVBWEc2?=
 =?utf-8?B?UUNqNkNSQkVCZ1FEa0VSbUk3RExBT3lWRURpeTlTOXR0T1ROOERjS2tRMTlj?=
 =?utf-8?B?ZlBvWkFSK2FoeGo4d29CNXh3bzVpeVpoM2lVVU9oaytjZEQ1cGR4Skl3SjZ1?=
 =?utf-8?B?VXRUcnF4d0NvaWNuZ0Q3OERNZkYxVEdiNmF3MFEwSVBqTXg3U1dpOWZkT2x1?=
 =?utf-8?B?bVViWGpvQ0ZKUFFmK3AvVzlGSEFDQ0NJbUlrMmtadUJRU29PMkJ2UUVqd3dv?=
 =?utf-8?B?NDZ0U0JsS2d6RXlPc1VGQkxqVUsxeTRIYitWUDloVkkwc2xmaTQ0NmVqYTRD?=
 =?utf-8?B?aDBFQjcrUlorbkwyY0xuaUNIbUhmWnlvaXM5dmJudnMwQVpjZmdYaGowcXZF?=
 =?utf-8?B?QjlkYThCVHNMcDFUcDJXSDd3UDI3N0tKdzA2a2U2eDZtSEV5a09PTnBvQWJF?=
 =?utf-8?B?LzNYK2Raam12ZmlPZ3RpcWRNbVhlc3FCMlJKOE1Kb05vUnljMTdWSTRRRStp?=
 =?utf-8?B?cGpzMWhDZGFOTldFZGgrV2FjZ2lGc2lWUEhGV0srditHc0Q5Sm5uZEdKTmdX?=
 =?utf-8?B?K1A3WmNrQldDdmYyOG9XWG9QRkkyUzk1Ui9qeGlLQTdJYm9qbEZOa24reU92?=
 =?utf-8?B?L2ozeXo0cHBSRlZHcWF2eWpySm9qSFRrVDBvN2ZqN1A2SUx3eTNGU1hHd0E4?=
 =?utf-8?B?RVY0NzVYNzh4UWNSanBLN3JlNFJYOVFsdForbFhCRHJsZjA0R3hqT0J6QWpa?=
 =?utf-8?B?MDU1elpBTS9mZkNhNTV1Um1iQ3dHQzhWNUpJRTc4M25OYW90YzJJMHA2ejFo?=
 =?utf-8?B?L2VuNEhPQTBXMmsxdlpJTmROcHFkTWZlencyUTZjWkpOa2s2TGF0YWtDc1FF?=
 =?utf-8?B?dENXSkZiMnhFYWd3ODdkU3JDKzI2RDI3Q0gwTnR5S0ZHb09oZmQzNnNTZVVa?=
 =?utf-8?B?YW44LzhKeTlmY3RmeUtFVmJpM1FNdkc3OWhvVFZpTWhOQm9DSk5MRm5jNzUw?=
 =?utf-8?B?YWphTEFObTNwUyt2VTJpL2NxM2FOQ2J4ZFk3SlpZOURheHQzSDlqV1FZWmo4?=
 =?utf-8?B?aHo3ME45MjgzWjJEcEpkUkE1ODBBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e989a163-6ccc-4029-e420-08d99f8096bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 10:48:08.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mULKKkTH3WEAu02Op2HZh2jwJeLKCVPMJvOWuSR1WsnBIKAufDdgED/moSw9yWCREq86ohNS4psAJFB9CZMbsruVnsq+VTzSY1ywD+El5uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 04/11/2021 08:07, Jan Beulich wrote:
> On 03.11.2021 17:13, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() buil=
d with GCC 12"):
>>> On 27.10.2021 22:07, Andrew Cooper wrote:
>>>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
>>> I disagree with the compiler's analysis: While &(pirq)->arch.hvm.dpci
>>> indeed can't be NULL, that's not the operand of !. The operand of !
>>> can very well be NULL, when pirq is.
>>>
>>>> which is a hint that the code is should be simplified to just:
>>>>
>>>>   if ( !pirq )
>>>>
>>>> Do so.
>>> And I further agree with Roger's original reply (despite you
>>> apparently having managed to convince him): You shouldn't be open-
>>> coding pirq_dpci(). Your observation that the construct's result
>>> isn't otherwise used in the function is only one half of it. The
>>> other half is that hvm_pirq_eoi() gets called from here, and that
>>> one does require the result to be non-NULL.
>> Can you (collectively) please come to some agreement here ?
>> I think this is mostly a question of taste or style.
> Personally I don't think open-coding of constructs is merely a style /
> taste issue. The supposed construct changing and the open-coded
> instance then being forgotten (likely not even noticed) can lead to
> actual bugs. I guess the issue should at least be raised as one against
> gcc12, such that the compiler folks can provide their view on whether
> the warning is actually appropriate in that case (and if so, what their
> take is on a general approach towards silencing such warnings when
> they're identified as false positives).

This isn't opencoding anything.

The compiler has pointed out that the logic, as currently expressed, is
junk and doesn't do what you think it does.

And based on the, IMO dubious, argument that both you and Roger have
used to try and defend the current code, I agree with the compiler.

pirq_dpci() does not have the property that you seem expect of it, and
its use in this case does not do what the source code comment says
either.=C2=A0 A GSI is mapped when a pirq object exists, not a dpci object.


If your answer is "well actually, we didn't mean to say 'if a GSI is
mapped' in the comment, and here's a different predicate which actually
inspects the state of a dpci object for validity", then fine -=C2=A0 that
will shut the compiler up because you're no longer checking for the
NULLness of a pointer to a sub-object of a non-NULL pointer, but that's
a bugfix which needs backporting several releases too.

The current logic is not correct, and does not become correct by trying
pass blame to the compiler.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102967 is the GCC bug, but
the result of it was them persuading me that the diagnostic was
legitimate, even if currently expressed badly.=C2=A0 They've agreed to fix
how it is expressed, but I doubt you'll persuade them that the trigger
for the diagnostic in the first place was wrong.

~Andrew


