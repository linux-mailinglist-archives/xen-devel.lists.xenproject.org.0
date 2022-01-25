Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7B49B703
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260432.449911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFj-0000no-IR; Tue, 25 Jan 2022 14:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260432.449911; Tue, 25 Jan 2022 14:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFj-0000iA-9u; Tue, 25 Jan 2022 14:56:59 +0000
Received: by outflank-mailman (input) for mailman id 260432;
 Tue, 25 Jan 2022 14:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9k-000334-4U
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 148dc079-7dee-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:50:05 +0100 (CET)
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
X-Inumbo-ID: 148dc079-7dee-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KehW/ppR9KkdMz2wBJMq+fcXNAE0ZsiGBu8urAjaEOk=;
  b=RpZbS58OEmFVH4At5y+cl+B+dzVv9dqeqiPnwSIMBFxyL9xOsE7aA0nF
   7Cl4GBF6al0xn8q1evaArMSClw8vrrLwNkvTKLkZJXnecYMsa9cvhuS15
   P4evDq0pmRY7phZn3jDzYw6matGtC+houFpHiYTZJ7N3G2/Jgyzq33Ovg
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4P91bjosiRIYw1kXSUMChskYapjw8Qjf3faiNc9mA4B+qRxoPa7E+N6Ohl+KScvZBK5WBzIENN
 N16cPsS+QV2tAH51mwUbZYhEuJIhYmjoh4zhVbwSLe1QNdLjF3VKjqNI2oW6/8h5G/9Y4PEJ9x
 5DWN3jc0BY4luZp2FUgVBIWjL3GrsYFOqEOMOPYI3Yb4wygCo+Rbh0m1tpLKW3Tdv9WDj+Fi/m
 rFqG5rrpS1+S56kZ6ikC3ysoSLZDYmIgCWOZeXBiq613HyRHWsWs2HLydpq0/k3iwl2nedQBQK
 pcaC0Vgw5P3Ssdz9qvJJ2srl
X-SBRS: 5.2
X-MesageID: 62635697
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:03I+oqnHQSeR1OTOFAdA5nTo5gxlIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDD/XM63ZM2P2KYglaYXkpEtXvJbUyoVqHgo6+yEyRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ilvj52vDg44BaPzvcA/YkIBAisgHoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq2JsTQ6eBD
 yYfQRFzYw6QTiBqA3MOIrJjm7qwtGvfTiIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zmBjkKOdrZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCKmhB8DHNNBKOMFzSWv+/GN8gzHJUFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtrxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtgMsW4hehY4aq7onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iNBiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:Snyz6699adVoL87wYnhuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62635697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFaOzvXTijBzXfbH+Dw9jr3JeDu1KNm/bA3/w+I0r8EEcJJOW4u4l+JSn4yfgFFjQ0E5h3qte5XFtoPPziIo4Nvcqhf0cRO3DZ/F1OExCgpiDUgr3xAogB1yEES07U48hEc/sejEbnyP4KOdl0B7u1FLaDp33hFyox71P3Hi6ZgBuoPmfvN5c8rsYe/ig/5M0aP+zhLSTLLYel+jG0ZCJAqMKStwYq/U/MQUEqo5NrukzTZq3flvWCjzTqsGTR8I55yuoNoHfzFSLo+cSRDFHPpYlyO5/MjlxflXhjIwFrQRKA5u3IO7zLwdAq4nYsJsojVJuiBcpse5EnzLVtx7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G62e2hBbVhYAB3n0yWh3Gd7eGWHgXrSNMck4M9bn1U=;
 b=EdgZQRfgLBRbKasKAOA+mMfp/nzbefhzyVAHBov362O/heM/DMOIpHjmEQCPqDwBYCjvAaa9QLXLeNmOAHH5VH8OT8yZ0rO8aBo12T3N1CvYBzFEfYCeYP1Mmn8csLOLF7+VimLiA8Jdt+zGEZWVCDIV4QW6LLC5tKXDo0RsJ0QYgYD4Dyq87DSgBuafjh2gnucNG/ELpOPto2uhWWe8ACjQMstewsWd0ksiuIOWkpPaO8Y7NLZ4bmcIiBeweA2gVGLShNENL2GTQIXra+Qv+bXR/lo3g3QVIF67HTjQF3Lw4g5WdQ7zxNIeq2ABpDERJE7Je3kRABzm4pxexCMRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G62e2hBbVhYAB3n0yWh3Gd7eGWHgXrSNMck4M9bn1U=;
 b=FgssMfY6DchmtrnY1tVtEWsjzQ9bNWvwiRkT8UMriTAvxZMDFCKbvRy0bToHnofzrrONBhVNP9zisDZ6MikB6eB3pCEPjFAV5n7OBkh3kEOPLs0wd1H/INL4u/amajjptPUqomIt+XJ2O9dZYQvk1VrTvxiZRUUS+1i03742FFE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 10/11] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Tue, 25 Jan 2022 15:49:34 +0100
Message-ID: <20220125144935.44394-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd901446-67cc-43c2-2d9a-08d9e0120bad
X-MS-TrafficTypeDiagnostic: BN6PR03MB2868:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2868A924D47FF113F4B5CDE48F5F9@BN6PR03MB2868.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36tFJma5s68NyISKEJ13CCY1OCO+uW8EQOiUH1nyYZdfHcQq4UiA9ke61/R6/mmcSrJPY67e4qRNrtGj5S4t6HBi+418P8B5dp/gJd2+4RWPa/u+O1+zGk8P1bA0Hytsheg3CtS1XmBOgL+UWHy5SgE9GF7awehADfUG7Dun6/mQdcnKUJW00/vrgdx4gBaV/pPhKACQszEqP/j52YqKhSUH3VukdWy4nHH05AkUbQI2tN3REvCslNwlv5sc8KPawnHa5w9RWRF3zR7JZU1CQ0RXum9/YGWrpFJ6eleQov+6DIUIOwXpecHNgAdKUDOOWOLo2q6vLOOBjTnl4goJgGsYPtVjiaV7Vvzcc+oNyjlgNaKv+nRW1U4m9p+fIavnljLqVOiEEkN1dVDQarPVHnHhVy5XJPxaZQky3RNkDNyt/b/5F64hzU590bdQGX0O7NctMI27yrsOr7NpW+NCTeWiT5avh6agRhQ2ojC03WMloSCqoNGgWCX9hrTt5jP4SDd4ANfZjMWypPG+S9SelZbNDA6IHfnvLG/OqQZAl2/TSo8E/uy6aBsh/FxvqHbwLZ4Z8e3buVwuh1AzTRjpsFmgFPAnqhYvlwD33E/hG5XygXNd9RXFzJyS3yuiv8MLQxRLVdLKVRTeYcxdlWZn3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(83380400001)(316002)(6512007)(186003)(82960400001)(2906002)(54906003)(66476007)(66556008)(6486002)(6506007)(8936002)(6916009)(26005)(2616005)(8676002)(36756003)(4326008)(5660300002)(38100700002)(508600001)(30864003)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hMVGhkUFFSOEx3MTFqcW8zMEZXcUg1WlVTRk9iWFRrdnQ3MlNhQk1Gc0cw?=
 =?utf-8?B?SCtjSHlRNzVQTFdpLzRSRFUxSUVENlg5S1lrVmI0eHpkRC9vZXJpd2RibzY5?=
 =?utf-8?B?Ti9WY3NSeThvdWJpRUJoVEZ3djYyY1BCR2YxVGVZU0dQRjhVbVBOTEhmbnIr?=
 =?utf-8?B?Zk5TRGlUT3AwalJSVDVITGlNcTdDUk9iOWp1Tk52TnpTdGp6Q1pHdFZCaWhP?=
 =?utf-8?B?UkYxb3JsVHVRUHNYdUxYbnpDSDJ3VGFtQkVuM21NL3V4dk00MDN1dFk1U0RT?=
 =?utf-8?B?UTVUSXBLOWYvQkJsNnVya3ZCcVgzS25JQVd0cnV4a0FnOXZXR3JTSkhCajU2?=
 =?utf-8?B?c1NxN3VKTlExaUR3b2ZnOEtYV0xpVlJpVTRueEU2UHFFZTEzYXVDdGw0bXpk?=
 =?utf-8?B?RTB2NHROenhUTnhDY2piOVZCVi8zaVdGcGo5WklUS2xIdjY3N09DK2NSbGNL?=
 =?utf-8?B?MFloK3JwMDJPSXBFK0VPcE4rMFpEbTJuNnNkYVZiT0lZRSt3Wm9BV0pWazRw?=
 =?utf-8?B?L3hvZlVGVXR1U1kyWnJ5NExMbGpOL0IzTWg2REdPRk5UQXZJb2hNSmJSRXov?=
 =?utf-8?B?VkRXSFRqb2JNbVpFd3RnWmJBMmVxYS9xYlFwaWMxWjYxenJwZFg1UG81Yjhy?=
 =?utf-8?B?czErbWoxU3I1d2tIZFV3cFB5aklXMTRkNXVFTzVqcUNXd1F0dHc2bkFGd3I3?=
 =?utf-8?B?eGsxWkUreWZZUUdqcG5mVlREejVkZUl0Z2sxZTFhbEdaOXV2alRwMU5yYkU2?=
 =?utf-8?B?dGhZYnY0RjR6WC9xak5sWEVPYy9BTnVNQlcvTUZ0RWxrNDBhSTUxMXJkMmha?=
 =?utf-8?B?cm1vT21MZlZDK3FHK2JuSXpuMk80cml1anFHckM5WUZpd2tZc1dXME9CYzhN?=
 =?utf-8?B?Q1pqTlB5eStmMUJUbGVmQ1gwdzIxWm4xeHZFSG91Y0pza25iczJLWHlJR21t?=
 =?utf-8?B?Y1pua2NudjVKMVl3bUtHaTgwL21KWWdYT3VKQVNwY0d5OFJvNXBVR1JJcW8y?=
 =?utf-8?B?aUZsNHNEUnRtaXgzSGhseHZJSWVTZWlMclNGVEx3bGRhYkdvSmY3Q3JHWXJp?=
 =?utf-8?B?LzJTMThNcHZ0cVAwUGo0UE9HNS9ZU3RCcWhZTVkrV1MyZEdsRnBkT1FHTEhS?=
 =?utf-8?B?U1B2anlhbDF1LzdJOGQrTHRSRUZyZk5VNkd0c3U4Qkg3Z0JZcUJVRmZkeVhr?=
 =?utf-8?B?UVZiaTFLUDlpenpVM0xsMUpBbGpvdmgvbDZncFc2Ujgvalo0a0tFT3I4ek1U?=
 =?utf-8?B?NXNkQk92RmRVaGhaenRjOUZrZkFTeWtnNFRKZEFnMEt5blZMSFVXUksrSGgx?=
 =?utf-8?B?c2dmemdMckIvSVNndmFuQ2NVTFhFVkZJUE41WDB5TzdNL2g4dGhuRmdWRlcz?=
 =?utf-8?B?eENKYytLMWk3RlZ3RWxLLzVqbGRjUWhDYnFFc3B2SXB3cHVOUG1OV213MEZY?=
 =?utf-8?B?T21XV1VaOUllbVZOYktpaVlxRHFOSktLSUY0bEZxbWt2NlhwMzRYTTNhSUN6?=
 =?utf-8?B?RkxXSnd0dmVQTTQyWTUzSWZnQ0FhZGFKSU9ZWjg1UzJPTXVqYWd4dkVWaEti?=
 =?utf-8?B?WFZuVU5wMzZ1REVsZjlySFlkREZ2SytLMGp5S3JKZUZyZW9BbERLWmFTRzk1?=
 =?utf-8?B?SE5LQkl3bGJKOG1NYkRTeW9iNUdKTnRoWmNaZStpNnF2Y2VvbHJ6dmxxS1Fp?=
 =?utf-8?B?djFTRHovNjhMa21DZWZ4RmhzY045WXdLaW1KM3hhV1RGZXJCY2dacDlNWkJm?=
 =?utf-8?B?ZkdSMUdiSlpoSmp5UldmZGl4V2hOMmZjVGdaVXI0V0JCUlJPTXVPQlhJc0Zn?=
 =?utf-8?B?RmZpK1YvVVh6amx5d0JhYVBTMjJ1ZUlmbXQwbW1lVU9CbEpvSGN4b2VnaUNh?=
 =?utf-8?B?dXlvc0wvQnlkT0VCdktFTmJYUXJ1T3RhREhYYmtWRGRmT2t2K25kcUE5K3BB?=
 =?utf-8?B?Y3M0T1pTNmtPVzNQY2s2L0JYajhMRUJFaGVHc0IxUUhJS2VOK3pVZzFITWcw?=
 =?utf-8?B?ZmxTT0tKcFd1RVU3WVhOSU9pcmtCVzdDZFBkZjZ0UDVQeTcxTjljUmhITmxL?=
 =?utf-8?B?Q2NFbG92bVBvbkNyTUgxWVlUdXdMdG5IRTllQWU4OThzeFJXL3lZcmYwWHBu?=
 =?utf-8?B?R2ZhRFhkVk5QRTJKRmtLWCs2dWxMNHlObzlSUTVlTm1WVEhxZ2FSeXFzMUxB?=
 =?utf-8?Q?Vgggy+W2JCcXaOHJ/7WOFTo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd901446-67cc-43c2-2d9a-08d9e0120bad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:36.1923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeEgaTA/Ndd7h2qwxAjCgvFmBWZEByMzw71bs0TdFFq6QFpS16RFpdHtmMg0Z1uXEnK49O6Lhu6A/CqoCwiVkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2868
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
will now implement it's own private type for storing CPUID
information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Use LOG*D.
 - Pass a gc to apply_policy.
 - Use 'r' for libxc return values.
---
 tools/include/libxl.h             |   6 +-
 tools/include/xenctrl.h           |  26 ------
 tools/include/xenguest.h          |   5 --
 tools/libs/guest/xg_cpuid_x86.c   | 116 --------------------------
 tools/libs/light/libxl_cpuid.c    | 133 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |  26 ++++++
 6 files changed, 156 insertions(+), 156 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..8a8032ba25 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1420,10 +1420,10 @@ void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxl_cpuid_policy is opaque in the libxl ABI. Users of libxl may not make
+ * assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 745d67c970..79169f8ace 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1803,32 +1803,6 @@ int xc_domain_debug_control(xc_interface *xch,
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
- * CPUID policy data, expressed in the legacy XEND format.
- *
- * Policy is an array of strings, 32 chars long:
- *   policy[0] = eax
- *   policy[1] = ebx
- *   policy[2] = ecx
- *   policy[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- */
-struct xc_xend_cpuid {
-    union {
-        struct {
-            uint32_t leaf, subleaf;
-        };
-        uint32_t input[2];
-    };
-    char *policy[4];
-};
-
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index d3dc8719c6..ffe74c7a51 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -830,11 +830,6 @@ void xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 void xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const xc_cpu_policy_t *host);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const xc_cpu_policy_t *host,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 28993f0356..032459f3de 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,122 +254,6 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const xc_cpu_policy_t *host,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t *def = NULL;
-
-    def = xc_cpu_policy_init();
-    if ( !def )
-    {
-        PERROR("Failed to init policy");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                                  def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        goto out;
-    }
-
-    rc = -EINVAL;
-    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
-    {
-        xen_cpuid_leaf_t cur_leaf;
-        xen_cpuid_leaf_t def_leaf;
-        xen_cpuid_leaf_t host_leaf;
-
-        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
-                                     &cur_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get current policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
-                                     &def_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get def policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
-                                     &host_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get host policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-
-        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
-        {
-            uint32_t *cur_reg = &cur_leaf.a + i;
-            const uint32_t *def_reg = &def_leaf.a + i;
-            const uint32_t *host_reg = &host_leaf.a + i;
-
-            if ( cpuid->policy[i] == NULL )
-                continue;
-
-            for ( unsigned int j = 0; j < 32; j++ )
-            {
-                bool val;
-
-                switch ( cpuid->policy[i][j] )
-                {
-                case '1':
-                    val = true;
-                    break;
-
-                case '0':
-                    val = false;
-                    break;
-
-                case 'x':
-                    val = test_bit(31 - j, def_reg);
-                    break;
-
-                case 'k':
-                case 's':
-                    val = test_bit(31 - j, host_reg);
-                    break;
-
-                default:
-                    ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          cpuid->policy[i][j], i, cpuid->policy[i]);
-                    goto out;
-                }
-
-                clear_bit(31 - j, cur_reg);
-                if ( val )
-                    set_bit(31 - j, cur_reg);
-            }
-        }
-
-        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
-        if ( rc )
-        {
-            PERROR("Failed to set policy leaf %#x subleaf %#x",
-                   cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-    }
-
- out:
-    xc_cpu_policy_destroy(def);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 6c8643fcca..5d28476eb9 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -309,7 +309,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -387,7 +387,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -437,6 +437,128 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl__gc *gc, xc_cpu_policy_t *policy,
+                       xc_cpu_policy_t *host, libxl_cpuid_policy_list cpuid,
+                       bool hvm, domid_t domid)
+{
+    int r, rc = 0;
+    xc_cpu_policy_t *def = NULL;
+
+    def = xc_cpu_policy_init();
+    if (!def) {
+        LOGD(ERROR, domid, "Failed to init policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    r = xc_cpu_policy_get_system(CTX->xch,
+                                 hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                     : XEN_SYSCTL_cpu_policy_pv_default,
+                                 def);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain %s def policy",
+              hvm ? "hvm" : "pv");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    for (; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid) {
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        r = xc_cpu_policy_get_cpuid(CTX->xch, policy, cpuid->leaf,
+                                    cpuid->subleaf, &cur_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            r = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, def, cpuid->leaf, cpuid->subleaf,
+                                    &def_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, host, cpuid->leaf,
+                                    cpuid->subleaf, &host_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++) {
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
+
+            if (cpuid->policy[i] == NULL)
+                continue;
+
+#define test_bit(i, r) !!(*(r) & (1u << (i)))
+#define set_bit(i, r) (*(r) |= (1u << (i)))
+#define clear_bit(i, r)  (*(r) &= ~(1u << (i)))
+            for (unsigned int j = 0; j < 32; j++) {
+                bool val;
+
+                switch (cpuid->policy[i][j]) {
+                case '1':
+                    val = true;
+                    break;
+
+                case '0':
+                    val = false;
+                    break;
+
+                case 'x':
+                    val = test_bit(31 - j, def_reg);
+                    break;
+
+                case 'k':
+                case 's':
+                    val = test_bit(31 - j, host_reg);
+                    break;
+
+                default:
+                    LOGD(ERROR, domid,
+                         "Bad character '%c' in policy[%d] string '%s'",
+                         cpuid->policy[i][j], i, cpuid->policy[i]);
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if (val)
+                    set_bit(31 - j, cur_reg);
+            }
+#undef clear_bit
+#undef set_bit
+#undef test_bit
+        }
+
+        r = xc_cpu_policy_update_cpuid(CTX->xch, policy, &cur_leaf, 1);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to set policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+ out:
+    xc_cpu_policy_destroy(def);
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -532,10 +654,9 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid. */
-    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, host, info->cpuid, hvm);
-    if (r) {
-        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
-        rc = ERROR_FAIL;
+    rc = apply_cpuid(gc, policy, host, info->cpuid, hvm, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to apply CPUID changes");
         goto out;
     }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 37d5c27756..c99b271f9c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2059,6 +2059,32 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
+/*
+ * CPUID policy data, expressed in the internal libxl format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct libxl__cpuid_policy {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 _hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                 libxl_domain_build_info *info);
 
-- 
2.34.1


