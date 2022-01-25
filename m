Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D249B6BF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260402.449817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN8t-0003LC-GT; Tue, 25 Jan 2022 14:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260402.449817; Tue, 25 Jan 2022 14:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN8t-0003In-BF; Tue, 25 Jan 2022 14:49:55 +0000
Received: by outflank-mailman (input) for mailman id 260402;
 Tue, 25 Jan 2022 14:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN8s-00033A-6k
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:49:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ca30aee-7dee-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:49:52 +0100 (CET)
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
X-Inumbo-ID: 0ca30aee-7dee-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8IcruUdw+PlzeWFNIE/jfRspWM79IBB39qmM/KGMn5M=;
  b=d9nMeSvwhVlyexnf0y+/QfuBIK8ccU2xFftT1mr3zkngDMiiR9eMBj+W
   4Grcf3Rdbw/E1y7yi6zWOFz1ukWDnH3pZCGY0SyThHsGOdZNCgZGBIz7e
   1m7S/8BCMCdogYQS5JxgvaLMFPI941naqjp0+3nG4DBQ30YheV5PCI4lN
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z/Kt2vvQFpVphod2PF08kzkxhAUwHph9jhPXD+sH+/zezkE2yTBki5JXztOmkrJThNQ/O/Sym+
 fUhPrrq11R+wSrOHAdnEMBrfiQk2bj2QlYNSqVKgBmJAFD5f5DeAc2VteEBX+a9VtTpmqM4Tc9
 ulxWtBjjswrGV+gQF7HhQy1lbvLizjHp02qIQ5ww6A20UDGeLA3zg/CMpukqpifFD8uE3C32rz
 eOW2xyR0eOQXUVxPYwY00ZReZIBGuiHvNkvs6n7ZO/ZIpiNs74iYNvqct6FM3IP391St+HkBm/
 dKzG9OawxLBPtUNw60KbanlT
X-SBRS: 5.2
X-MesageID: 64879988
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6LtEra+Gm1WbNX+ZvxerDrUDZnmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TNMD2vSPazfazH3et5ya96x9x8E7J6HzoUwG1RorXs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhXz
 5YKm5aJFTtwAabXp6cgDRpoFBxXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgGdv15EeTZ4yY
 eIUWTFfQRDsfiRCeWYrKYsvu7722ijGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFiD/VkyUeMML7QF4xqyiZeK4DaeO0FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtrxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtgMsW4hehY4aq7onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMRiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:Xl4GF69gv/Lnt1tlNBxuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="64879988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kihhjx6NiEgBUz0gB6XKHxUw5C0AlQOts5kXnG7QNEYEHdV7O6OqyD6K/kpofOIcwLDQw3FK0YIOjGaZKC7BmlHwAMZ0HrXTXPZnXEvm6DM/yTJAuHIXi/V1vEFDLgPaMeMc4iw7DXuoQAuibNDd99Quy6GHXe/BEmCUd1zqrMxpURuo2dFL7xLwyZ1MZATjDK97j5cTmSrsGWheT61PnG79L8+ccFhPmgMfnKCWhIJJheMf30RixkjySLAKJRJjVH+LElDbDRWnQcVmBKWOdshOHETNolKwdQXL3w/KyZ/A/FTC4u0tz4NxCZAVZ+4HwulsYYpD/NTiW4yAF6Mxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaCmk4M/L7unxCL+YD/2t5w6edbf5MelChrqRkA5sMs=;
 b=nOXh4epEZT/KLHyhbHJ5vtkibw0cdVvlFC2U0/diHYHrkHZHfdz9PNT3BBsqhizg+QtSp5g0Ne3aPyCyPW0ywnkJi2yNuuE8cUrVJjrA/CQRB3sDLDJ035m/mnKdwMjQIOrBFbmHLs76NOIARIGv0611kDhmpUgENXMyTIbBeJRlgrHdT030cFNjlfdo2hrP0Giy1WTERQ6JM2St4VdLLoFVUBD3LNS70X3MXWVtl2b3/QiY8BTDi8ejACQYitxVASszkKYW1Cv0nW4xrxUFxVfS7jnbYicwrHfANHZ8gOfuKMCVKWaQ2ktpgduuPZjcd/Sm/cMJ1216amYIM0E2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaCmk4M/L7unxCL+YD/2t5w6edbf5MelChrqRkA5sMs=;
 b=VGL/IO0PEoHRyadAzhZW+BhNt3MUQS8yuGTLKrm0AYNdmEHuSn4QwQK9YbdsuIDcNXfwF5BI3EB9wxSdo6O4aNMFuD/2lY/jdnbpOupPdgcfQtX0/79fKysYkxZOfvUEuLBlMCXlxGm2WsO3h16VAkwnGgfxVlB9bxuxBDZlXuk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 01/11] libx86: introduce helper to fetch cpuid leaf
Date: Tue, 25 Jan 2022 15:49:25 +0100
Message-ID: <20220125144935.44394-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f2a2ba7-03dc-45de-6804-08d9e011eed1
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4568EA3525600930CA22237C8F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8xBhjA0/M5idWnzVIfbCTP7/qal0/s1mjng3Rfu2N8/y5igl5wV6oBI5UeqytfPdT5gdB7L8U7EIuWRU/GcENh3+N8tjn/2T9/lWPd7nJSsPVMUpTqMQNHZmPSHvxJnlijHVUmCBPmDx814RuUP/WlWPKaFUu6R2nvHtLwoGgWgTlIaAJSObRtLg+6ZQ8YXcjVKgFISAv6aFxnXxVv6iKBeCYsU9a/ozerHIv4J2cwQfp4JHPmIa3o4Up3pnnVh3dIZWGiQW6xItOGv3iVk0DmzFdGxW31aMVPPeEjqXDGzPoBn7HIlqJtuWFZJYKpZGnuIRZ2ircaTHB38nyZ0eNGDu+U9vxvY23+Ta4KMl4ST852s6eGcRfzuH8h0NTSTyGLzeRn5jeTcJcugr2PNJKNRSSZHoHkCohSN12G9ytwo3O9cl3MBl9Ypp3iaWkjnn1x9lfZp4PNH8OGn3Q204xXfpDdPVN+aFbEwMmfwYwH6dWtISkUcGXIjDkyznMnlcizURAuKey72fBQq3dtwvGOc2Ta9oHj873xmBtnts9l5X/I8LE7G55DsOqksya3l2iti/aivPwPrkxChWWP704kpN538rNssSq0UBQlkMXYvMcWH0Nidhe9fSvE//iugb++cOfemSzHYNtlnzRypUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(30864003)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(107886003)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGx2V3JqTFBxOTNmS2NPR2IvNzZZRkVUZjBzY29MRndZbzdSKzNxTFJ2N0Fw?=
 =?utf-8?B?T016KzdwK3J5bmhTNUlpeThEcEY1cEo3anVCSkdXYlNVVGlNbmFrVk1jUlR3?=
 =?utf-8?B?Yk10YjVVN0NUWkJQVHNUTzNmR2EwODAxMHBtNWJtV2VkeG5wc0Rmb0ZIbUh6?=
 =?utf-8?B?SVVCN2U5cTl4QjFaNHJpK3F1aTFmRlZjZjkxMFU3b01CdGNxa1IrbjI2dGJV?=
 =?utf-8?B?QjkrcDBMa09mQmNtelg0cVVuZ01VcDNwK0llSlBVZ29KdUF6eDcxQVBTK3hN?=
 =?utf-8?B?ektvanBCQy9nQ0pXRENTRmRnWW54WjFiKzMxSm5KdmVQUkp6RDBlVlpnazEx?=
 =?utf-8?B?ZXk1SUZGTHQ2dk1VbkRpS0ZxRk5DU1VHcTlXOGhpeHl0QzAzN20vSEx6ODg0?=
 =?utf-8?B?Mnk0Tm9TdjdSZ01idkxDK01NUjlsOHRxSDlKdGcwTlhUcHE1cHU2cU5ZWVlI?=
 =?utf-8?B?aU5LMS8vdkNGMGgvVjR2YUJqY1p6RjhPRlFHM2FwSmhEZUxJV3lnL0hQbTQw?=
 =?utf-8?B?L2dQUmF3RmljUFJML2lHcXk5bm9jYmpLdUF1OGZzaGNGeW1oYm8ycnc1Q1Ax?=
 =?utf-8?B?UUM2YkRIQVFicEJxbDdITkQ0TTUzenRsQ1U2dkR6ZUR2WXNhVjQ5SlNrelV3?=
 =?utf-8?B?b044ZEQvTE5VdytMbFluNWN0U1JWNHFYbmNuN0krODgxRG54b0RDWUlDTmtJ?=
 =?utf-8?B?dzYwVmhGN3d6TzM2emFnV0lIVk96MnZkRFNjOTJUL2RZcFIxN1VoNmdIdmlG?=
 =?utf-8?B?QjdHZzNiQ1ovTDA2MU95cHFKcE9NSGEwZVF3YWhLby9wdThtR0xwdUNGUmIv?=
 =?utf-8?B?NXFFcDZPUThzT3Z1YjR6a0pSRlRCK09JY2dsdk4wN2pFNWNmRkVQZjRuZXR0?=
 =?utf-8?B?M1JWVHU2Ulc1aXRzcm1uUVhJVWZiQjlOSHZRTi9ucnFpajBRelNEMllGNE5J?=
 =?utf-8?B?L0Y5QVBrUFcwSUdjUGs2eEdVaGl1TFUxbHVHUE9RTUtQTTA2T2lQQ25mcHFj?=
 =?utf-8?B?MXo2YUhza3MveWdSbko2STg2VGNMOEN6ZXdxZVNjd1ZtRWUwdk9IZHo1WkdY?=
 =?utf-8?B?OTlLbjNUa3kwakQ2NUIzQTQ5UXVuZitHS2JiN3Babnl3N016TkVraCs0dWVN?=
 =?utf-8?B?UjJWaGMzUTl1c09jamM2SCtBS1NieVlLMGI4bmtDTEI4UE54TjIraHBrSVZP?=
 =?utf-8?B?TlFXcUVLVmRNY0pZN0ZqSXA2RXpzR0h2dEswTUFzalJ6VWc5SFRoUFFxV091?=
 =?utf-8?B?WU5UZ0JCakt0R25iTFRiaTFCNzJ2NHhObTE5bTdoOHd2TFFaTHd1dndyZzhD?=
 =?utf-8?B?YTlaWkVxR3hRcS9nL3JIMWVnWEQvdU9ha3pnSmFSUkR5QlJHVEZDcTFPT3gy?=
 =?utf-8?B?MHdqWFkrYnkxbXR3VnY4SVFnODFhWmE2MmlENEdEVDkxT0dKYUR6RVVNYjg3?=
 =?utf-8?B?b1AvVFR2dnM4Q3BoT0FjOTJ4SUFYS2U3WWpjSFBWQUNjdWU0WE9CMVY3OFJP?=
 =?utf-8?B?ZDBSVTJSR2V6ZWxadVVFZUtIRFBINEgyYWwrN2hxNUphOHdCaGVUd1VkM1l0?=
 =?utf-8?B?TnV1WFN5MWUrbnJkZGNIVlU5Lzl6eFNYVGJqaWxrS1RFQi9UQmUvZkEvT21R?=
 =?utf-8?B?amd4T2pjdkJXR2JUR2Q5bE9wcHBOb0V4ZlhoUzlEa1dUd0xLRHFiTlR4TDdM?=
 =?utf-8?B?ZVBpbytpMm4rVXFhMXB2Mi90T2ZvV0ovRHJIM1V1bTVtRTlpU1ljalNUY2xO?=
 =?utf-8?B?S1BheFNZeDhXaWQwazJCaUtxZDVlKzl0TFg2REF1ZmhTeTRtYUt0eDVsTE94?=
 =?utf-8?B?bmRyTjFyakJXVmpydk9GdzZVVlNhSHVKNjg0Nzh4UU8xUk14d3hUZTQvODZ5?=
 =?utf-8?B?RU1HajVjcFEvcFpIUjBGWkxFTDVzUmNYdFN5Zm1QNUZxd0dXV3RtYll6U3Nt?=
 =?utf-8?B?WUF1K21zdkZ2SU1SR2h4QnVGaythbU54d2Z0Y01CLzNkNDdKSGpxVG5PQ3dC?=
 =?utf-8?B?N1ZDYWtlbHl5bGc3RVV2ZVdpM1k0QTh4U1dwd1FBZXg4SHA0MVdyUGg2amgz?=
 =?utf-8?B?clJTZnQ5L3ZRa2VhYzdIY1F4c0F2N0J1NU50bzZMQkFqUU90MUZseEdWTVRw?=
 =?utf-8?B?ekh4SkVmYUVEY2ZYMWlWN1VkNElleS9uUEU0U1ZRTW9vY2lmNVlIdjhJVmFC?=
 =?utf-8?Q?mQOCeryjcUlAJhc6iA5f3wk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2a2ba7-03dc-45de-6804-08d9e011eed1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:49:47.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3H5NdIgaZ3f+jYVrNEon0FzjczZ+LcR0XLa0whggN0ngYKUlC7YbEoHdLp3lWJRnR0PBTiQXyD5pJhJ1+80NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Introduce a helper based on the current Xen guest_cpuid code in order
to fetch a cpuid leaf from a policy. The newly introduced function in
cpuid.c should not be directly called and instead the provided
x86_cpuid_get_leaf macro should be used that will properly deal with
const and non-const inputs.

Also add a test to check that the introduced helper doesn't go over
the bounds of the policy.

Note the code in x86_cpuid_copy_from_buffer is not switched to use the
new function because of the boundary checks against the max fields of
the policy, which might not be properly set at the point where
x86_cpuid_copy_from_buffer get called, for example when filling an
empty policy from scratch.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v6:
 - Add more tests.
 - Drop Jan R-b.

Changes since v4:
 - Rename _x86_cpuid_get_leaf to x86_cpuid_get_leaf_const.

Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 177 +++++++++++++++++++++++
 xen/arch/x86/cpuid.c                     |  55 +------
 xen/include/xen/lib/x86/cpuid.h          |  19 +++
 xen/lib/x86/cpuid.c                      |  52 +++++++
 4 files changed, 255 insertions(+), 48 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index ed450a0997..09e4b5f528 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -1,6 +1,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <stdbool.h>
+#include <stddef.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -570,6 +571,180 @@ static void test_cpuid_out_of_range_clearing(void)
     }
 }
 
+static void test_cpuid_get_leaf_failure(void)
+{
+    static const struct test {
+        struct cpuid_policy p;
+        const char *name;
+        uint32_t leaf, subleaf;
+    } tests[] = {
+        /* Test for invalid configurations in the object itself. */
+        {
+            .name = "Basic max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
+            },
+        },
+        {
+            .name = "Feature max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
+            },
+            .leaf = 0x7,
+        },
+        {
+            .name = "Extended max leaf >= array size",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+            },
+            .leaf = 0x80000000,
+        },
+
+        /* Test out-of-bounds checks in the accessor. */
+        {
+            .name = "Basic leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = CPUID_GUEST_NR_BASIC,
+        },
+        {
+            .name = "Cache leaf >= cache array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = 0x4,
+            .subleaf = CPUID_GUEST_NR_CACHE,
+        },
+        {
+            .name = "Feature leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+            },
+            .leaf = 0x7,
+            .subleaf = CPUID_GUEST_NR_FEAT,
+        },
+        {
+            .name = "Extended Topo leaf >= cache array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = 0xb,
+            .subleaf = CPUID_GUEST_NR_TOPO,
+        },
+        {
+            .name = "Xstate leaf >= cache array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = 0xd,
+            .subleaf = CPUID_GUEST_NR_XSTATE,
+        },
+        {
+            .name = "Extended leaf >= max leaf",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+            },
+            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+        },
+
+        /* Test fetching Xsave without present. */
+        {
+            .name = "Fetch Xsave without present",
+            .p = {
+                .basic = {
+                    .max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                    .xsave = false,
+                },
+            },
+            .leaf = 0xd,
+        },
+
+    };
+    const struct cpuid_policy pc = {};
+    const struct cpuid_leaf *lc;
+    struct cpuid_policy p = {};
+    struct cpuid_leaf *l;
+
+    /* Constness build test. */
+    lc = x86_cpuid_get_leaf(&pc, 0, 0);
+    l = x86_cpuid_get_leaf(&p, 0, 0);
+
+    printf("Testing CPUID get leaf bound checking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        const struct cpuid_policy *p = memdup(&t->p);
+
+        if ( x86_cpuid_get_leaf_const(p, t->leaf, t->subleaf) )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
+static void test_cpuid_get_leaf(void)
+{
+    static const struct cpuid_policy policy = {
+        .basic = {
+            .max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            .xsave = true,
+        },
+        .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+        .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+    };
+    static const struct test {
+        const char *name;
+        uint32_t leaf, subleaf;
+        size_t offset;
+    } tests[] = {
+        /* Test fetch different leaves. */
+        {
+            .name = "Fetch basic leaf",
+            .offset = offsetof(struct cpuid_policy, basic.raw[0]),
+        },
+        {
+            .name = "Fetch cache leaf",
+            .leaf = 0x4,
+            .offset = offsetof(struct cpuid_policy, cache.raw[0]),
+        },
+        {
+            .name = "Fetch feature leaf",
+            .leaf = 0x7,
+            .offset = offsetof(struct cpuid_policy, feat.raw[0]),
+        },
+        {
+            .name = "Fetch Topo leaf",
+            .leaf = 0xb,
+            .offset = offsetof(struct cpuid_policy, topo.raw[0]),
+        },
+        {
+            .name = "Fetch Xstate leaf",
+            .leaf = 0xd,
+            .offset = offsetof(struct cpuid_policy, xstate.raw[0]),
+        },
+        {
+            .name = "Fetch extended leaf",
+            .leaf = 0x80000000,
+            .offset = offsetof(struct cpuid_policy, extd.raw[0]),
+        },
+    };
+    const struct cpuid_policy *p = memdup(&policy);
+
+    printf("Testing CPUID get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        const struct cpuid_leaf *l = x86_cpuid_get_leaf_const(p, t->leaf,
+                                                              t->subleaf);
+
+        if ( l != (const void *)p + t->offset )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -685,6 +860,8 @@ int main(int argc, char **argv)
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
+    test_cpuid_get_leaf_failure();
+    test_cpuid_get_leaf();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b5af48324a..0407a54626 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -825,48 +825,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     switch ( leaf )
     {
     case 0 ... CPUID_GUEST_NR_BASIC - 1:
-        ASSERT(p->basic.max_leaf < ARRAY_SIZE(p->basic.raw));
-        if ( leaf > min_t(uint32_t, p->basic.max_leaf,
-                          ARRAY_SIZE(p->basic.raw) - 1) )
-            return;
-
-        switch ( leaf )
-        {
-        case 0x4:
-            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
-                return;
-
-            *res = array_access_nospec(p->cache.raw, subleaf);
-            break;
-
-        case 0x7:
-            ASSERT(p->feat.max_subleaf < ARRAY_SIZE(p->feat.raw));
-            if ( subleaf > min_t(uint32_t, p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1) )
-                return;
-
-            *res = array_access_nospec(p->feat.raw, subleaf);
-            break;
-
-        case 0xb:
-            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
-                return;
-
-            *res = array_access_nospec(p->topo.raw, subleaf);
-            break;
-
-        case XSTATE_CPUID:
-            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                return;
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    {
+        const struct cpuid_leaf *tmp = x86_cpuid_get_leaf(p, leaf, subleaf);
 
-            *res = array_access_nospec(p->xstate.raw, subleaf);
-            break;
+        if ( !tmp )
+            return;
 
-        default:
-            *res = array_access_nospec(p->basic.raw, leaf);
-            break;
-        }
+        *res = *tmp;
         break;
+    }
 
     case 0x40000000 ... 0x400000ff:
         if ( is_viridian_domain(d) )
@@ -881,15 +849,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case 0x40000100 ... 0x400001ff:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
-        ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
-        if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                     ARRAY_SIZE(p->extd.raw) - 1) )
-            return;
-
-        *res = array_access_nospec(p->extd.raw, leaf & 0xffff);
-        break;
-
     default:
         return;
     }
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index a4d254ea96..050cd4f9d1 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -431,6 +431,25 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
+/**
+ * Get a cpuid leaf from a policy object.
+ *
+ * @param policy      The cpuid_policy object.
+ * @param leaf        The leaf index.
+ * @param subleaf     The subleaf index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * The function will perform out of bound checks. Do not call this function
+ * directly and instead use x86_cpuid_get_leaf that will deal with both const
+ * and non-const policies returning a pointer with constness matching that of
+ * the input.
+ */
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf);
+#define x86_cpuid_get_leaf(p, l, s) \
+    ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))
+
 #endif /* !XEN_LIB_X86_CPUID_H */
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 8eb88314f5..924f882fc4 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -493,6 +493,58 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
     return -ERANGE;
 }
 
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf)
+{
+    switch ( leaf )
+    {
+    case 0 ... CPUID_GUEST_NR_BASIC - 1:
+        if ( p->basic.max_leaf >= ARRAY_SIZE(p->basic.raw) ||
+             leaf > p->basic.max_leaf )
+            return NULL;
+
+        switch ( leaf )
+        {
+        case 0x4:
+            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->cache.raw, subleaf);
+
+        case 0x7:
+            if ( p->feat.max_subleaf >= ARRAY_SIZE(p->feat.raw) ||
+                 subleaf > p->feat.max_subleaf )
+                return NULL;
+
+            return &array_access_nospec(p->feat.raw, subleaf);
+
+        case 0xb:
+            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->topo.raw, subleaf);
+
+        case 0xd:
+            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->xstate.raw, subleaf);
+        }
+
+        return &array_access_nospec(p->basic.raw, leaf);
+
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+        if ( (p->extd.max_leaf & 0xffff) >= ARRAY_SIZE(p->extd.raw) ||
+             leaf > p->extd.max_leaf )
+            return NULL;
+
+        return &array_access_nospec(p->extd.raw, leaf & 0xffff);
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


