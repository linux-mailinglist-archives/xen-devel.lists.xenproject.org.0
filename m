Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715B3558A7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106094.202874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTo6O-0008Dr-KL; Tue, 06 Apr 2021 15:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106094.202874; Tue, 06 Apr 2021 15:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTo6O-0008DS-Gv; Tue, 06 Apr 2021 15:58:52 +0000
Received: by outflank-mailman (input) for mailman id 106094;
 Tue, 06 Apr 2021 15:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgwS=JD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lTo6M-0008DN-8D
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:58:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 771da170-73e5-4a9f-9c61-15e3ff492ac1;
 Tue, 06 Apr 2021 15:58:48 +0000 (UTC)
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
X-Inumbo-ID: 771da170-73e5-4a9f-9c61-15e3ff492ac1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617724728;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cCELuAREvL2qnfubBeXTbYdF1jtrOTwD8ARND86tCkM=;
  b=R1vnjOY+IZ7KANGXC1klEoUE4Dj0YqlF7QpReyvRnoA8lAhP+leqQaCq
   LeXGS/h9N9yTjDECK25R9BL5gckMGH9FSP+RuKj/6G7OnlwQRDVxZ7diM
   GoevSvau3yvnUEpCdTxQd86ztZiP/abFPIK/EbSIn4IGf7DkE+tNxwHd+
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fteQswJ78KTZ9QL94QN5Rzjc6lPFNlFgdXknH2zzYq7ACdzqlYXasp/p+BAE3zJXWZu83t7ZaB
 AfgEBe2i6UMi1GrBxJKjHXAKWS1N3hS78rQL5yB4Xj2nOEmJlziIqwddJz+BMt5EZOodsUNIWx
 rkx6IpuyzHyiQ1e3XXr5s+Ky5GFA+hVcRvOPGRdhHvWiY0Xi3xcldRv/bNNlWDOznH+AgVxcoQ
 YpQz3TNkOgN4wC90N8zYfaq69TSJtx7an92L91t+YlgI8BGykimZ8rHdSgtAr5SQN3QE+RwBmb
 yP0=
X-SBRS: 5.2
X-MesageID: 41366705
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9z8zlK8FrOsevAYjj8puk+FocL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2GmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXAOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLooys2eTVJ3Lsk7C
 z5gxX0j5/TyM2T5z398yvo75pQkMb80dcrPqKxo+UcNzmEsHfLWK1PQLuH1QpFxd2HyFFvq9
 XUpgdlAsIb0QKsQkiQgT/Anzbtyywv7XiK8y7pvVLGrdbiTDw3T+pt7LgpCyfx0EYrsNFi3K
 8j5Qvw3PA2fHCw7hjV3NTGWwpnkUC5uxMZ4JYupkdSTJcEb/tppZEflXklYasoJj7w64wsDY
 BVfafhzctRGGnqC0zxjy1ExdyhWWkLBRGWQkQOkdz96UkpoFlJi2Qf38ARhXEG6dYUTIRF/f
 3NNuBSmKhJVdJ+V9MwOM4xBe+MTkDdSxPFN2yfZXzhCaE8InrI77r6+q886u2GcIEBpaFC16
 jpYRd9jyofakjuAcqB0Nlg6RbWWliwWjzr14V3+4V5kqeUfsuqDQSzDHQV1+ewqfQWBcPWH9
 ypPohNPvPlJWzyXa5UwgzFXYVII3V2arxVhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRl
 QZWjzeI9hB81CLVnf0jAO5YQKuRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbR1O25ZGOX
 dWEffCqOeWtGO29WHH4yFCIRxGFHtY573mTjdvrQ8OOEXkTKYbt7ykCCRv9UrCAiU6Y9LdEQ
 ZZqVgy07mwNYasyScrDM/iFW6GkX0JpjavQ40HkqOOoefpE6lIQKoOaehUL0HmBhZ1kQFlpC
 NocwkfXHLSETvolOGCl5wbBObWcvFmmwe1KctoqXbS3H/s5v0Hdz8+ZXqDQMSXiQEhS35/nV
 tq6ZISh7KGhHKSM2cluf85N1dNcWyTJ7pDAG2+FcJps4GuXDs1YXaBhDSchR12Xmbx7U0dil
 bsKjCudejRDkBQvW1Z1ajW4Ep5H1/tDH5YWzRfi8lQBG7GsnF83auwaq2/33C4R3ECzuseWQ
 u1Kgc6E0dL/ZSaxRSVkDGNGTEa3Z0oJPXaF6lmWarUwGmRJIqBkrwmE/dY8I1+Ds3ntvYGXI
 ukCkmoBQK9L9ls9x2ep34jNiUxlWItlunw3gb5qEe/x3wyDJPpUSJbboBeB+vZyWfqR/yFis
 okyf00uPa9KWX3ZJqtz7rNYztKNxPUpiqXQogT2ORplJN3kIE2OZ/RFQbs/jVg+j4VKc/vjk
 MQQKhh+tn6S8dSVv1XXxgcx0YjkdSEEVAivQP3CNIvZF1FtQ6vA/q5p57z7Yc1CkKPpAHMKU
 CS3i1U8fDCRTaC39chetUNCFUTTEg383J5+uyeM6XWFQWxbulGlWDKeEOVQft4SKKfH68XoQ
 s/y9aUn/WPfy69/AzLpzN0LuZv9GmgKPnCTT6kKKpt89agP06LjbbvyMmvjC3vQT/+Un8mv+
 R+BAUtR/UGrCIjgo0x2jWzTaKygntNqSog3RhX0nj32oan52/HG1phKgOxuOQOYQVu
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="41366705"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuSonDJZQXFhXWjslLy4Inca9JiP5tlxuLaf4ITJc2CsE90F2plMIuhEyU5FRfxH+YBCSezu6uDLHR0317qXhyVNmbVYPfP+cr+4VjjNMdZGrJXL18xp3aOb9GpgzdcoV5L4V0CGAX25jHzsR/fIa+AFjvFimuvbnjoRAtG8d0HdttK4IDkLJ1/l0PWoMbNePqI8zwbX5gkLohxGLNLdHTfKPCOGGU8Ti7Cb+zB/F0oLrxz9QHXPdRD2/amQ5RVUR9lxqFAvjMyUMBx0h7M+i9eKhea+xiRXnEIaPNznzcTxt6OVVHkHELtg9K+2vzq9Np3ECLLGpBfnbbATN81pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3AELijsXTbU/SU33N79QG74GLplaaw6uFX0h98XSnU=;
 b=JfyfBENEQ+S2g5uTGrm+Nxkk0h31KoyjdrEW60UA7IXeO//V8GLpcA0MBgOM5kHh2CxLKEu4i9toQ4ho+RBbDGRU8oyr+2Y7v0oSIdG5lKh+63igldz/B8NcvD5ga6clrH4GeF+4Lo8ewk6cC+qsld9zRJ3jAE3pzKoNYEiDefxOfAsdpf5SkFj7zL5lK7FfyxHSsziJJVbvqO/tNQUx+l4i+lSz5u1Osngkx+vdOe0QLrv6c97k+rtkSSF6oybiqAX+i8PS/6IDoFPmfCtqKC4cPQWRAMXL03/2YiWs3KBZnT0XoVXNs/LdaG5hVCBtbMEREk3jjxnvH1lSWqodgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3AELijsXTbU/SU33N79QG74GLplaaw6uFX0h98XSnU=;
 b=QBF+XTkn1BHJWA7HAOAEt+nGFu5wenLXFMv3DgWfPq678Gj3zusf2kz/EotBwrRwWkj1dfg8QbFVw1WVsEuXG/g+DWZiXT6wlyIwysGhUV9kH+XkPGNORCwan3oUW/2UNt3jlsvDMj7RVSy0y1CMAioYycXWUH7eFyZvN6YJHiw=
Date: Tue, 6 Apr 2021 17:58:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Message-ID: <YGyFLIp8Ld0RjcoI@Air-de-Roger>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
 <YGx3TsTlAuE9eQ7i@Air-de-Roger>
 <88704bcf-a06b-cf89-5fa3-0db94428f9f8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88704bcf-a06b-cf89-5fa3-0db94428f9f8@xen.org>
X-ClientProxiedBy: MR2P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93af98b6-f4a7-41f6-0d11-08d8f914d935
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35798BF536EF94DA383F04088F769@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2oEOlXP9QeCq5eGufXRojhSS9+QmrDBs6oHeTrrSchuOAB3ThVy4HzzX6NFC0Pz61/gQY3C49HU2bSX5nIPrFzJVNnmvscNqrZQ8QXBBW1XnjAw8rmWjJdPjYTo2uxW1xnDSroRo9eVaHV9cRju4z9AV+HPeybdWQpKMxQRXdUaJgMvmc9gu5rZ4yUGwpdg0RbTceUR5dPqK5LM8o02zrtwvZL7AU6JM34W+NGXY9RifRaF6894cAjkXtKluuaPO3nRgf74DsX54FuGuS78Rx/eRUbpFZZp4i+cL3wEEa/v1VfYAdA7SHmwf78QVgCSyWBFZt3AR+LTb6gmN+t7DE4TAhCFzN7QzzoppWNSnSXS2zjoeuElsz2/yfABNcWR1NsSIsxn9pL3EDWMVeLUk0AGGsRfq1ZkuMklZx3nrCS1zVX1qUFMPdKntI7dZ9GnrcwSTta4C5aaLmT1ycHnIXjj2DD6891ELb5hyslBu+xm3IpxF8cBzFc9gzuAznb49CLmAoPGT0zgdYsJ/TRyN4XZXxQN07RLfq1SEcTYonDYKYtYmrCokmtHJt4GHrFXv858R6dVQuAZvQme5dhoSTmX+GsunqjJti2a4zFVrAftylG4NRiHEl9p0r7ZlWaBvH86qr3vDp6e595NPlN7qwQKd7hH3EonDRcZ4/P/B64=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6496006)(86362001)(54906003)(83380400001)(85182001)(316002)(4326008)(2906002)(6916009)(9686003)(8936002)(478600001)(956004)(33716001)(8676002)(5660300002)(16526019)(186003)(6666004)(7416002)(66556008)(38100700001)(66476007)(53546011)(26005)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3BCNTVwQ3dlSlNhTytPVWFOam9qSE50L0Z6cFFoS0VrVlJxd3Z1K3J3b3c3?=
 =?utf-8?B?cWkwOC9rWWtYOVpJbitDSnVVWEU5THVPa0w4ZTl2Y2l0bW1JNVNWQ3RicjRI?=
 =?utf-8?B?SkdocHZYUE1kdXpaejB3WnhrWGxZdzlQMDVlb3hzR2NPLzdPcTdEaEY2UUhT?=
 =?utf-8?B?SWtCL1lJdkM5NUIxK2gxdnJuYVp2S1B1SEVmOFJ6b0R5VXZtbkFQTTYyMno4?=
 =?utf-8?B?Y0Ywc3ZIR05CVy9LdjBQbVhSZW9pR1pvZkR6L296WFpFanpYdG8vWG83eFJY?=
 =?utf-8?B?N1h2MzgveWViWlMxeUNZWXBEUTF5S1B1Y2hYbWgwTHR1ZjZsODgraW5mRFNM?=
 =?utf-8?B?eHV1OThPRHMwZGR1bmNZNTI4TDBEWmpjYmhvQWZDTUFFTnI4STNlOE9NSWVz?=
 =?utf-8?B?ZXRPYXFVQjM1clpSMTV0VzdYMGc5Wm5qUmxsNjkyZnprcWxCTjNLSTdmL0Uw?=
 =?utf-8?B?NWQ2K25aR3pRbVp6MmVjR01RNllNckRmVDllemhiV1dBY2RFcU9pQzcycXRa?=
 =?utf-8?B?TWM3N2pxUkRmRnJDL29JS0kvclZtVStFNHhUbitJYi8vZHBMWEJjc0ZFQ0ho?=
 =?utf-8?B?dGF1Wk9uWTdDSXp2OWNXZ2pDbWpYT0JDengwb3NpL2tIUE1TL0hpblEzVFRV?=
 =?utf-8?B?Y2d5dUI1M045U0RFTmVjUG9sVFZYeW9MWWFMRlZXbFZYS3JsWlM0WWFuOE1N?=
 =?utf-8?B?ZENNOUUzVnRtUXlTbmVDTGM4Q2pabFd3RTMvcjgzS3RzL2JUa0llanhRRGFT?=
 =?utf-8?B?K1VOMTFOcCtrQmhEQ2Z6YzUvRXFxNytJbzZZUVdncEYzSnc1U3hWZ1NFMWJo?=
 =?utf-8?B?Y1BtWEFiNDlsdHVXTllxOWVkZmF3MzFWNTA1d1p1bVhRU1ZuVDVoTUN4S1F5?=
 =?utf-8?B?Z2xPVlFad2RiT2sxWU80UENyN0pueDVYUm9MR3RFNWVvZUYvTlMxbjBhamlV?=
 =?utf-8?B?OUNNOElObWtFT2RhelE3RjhlNGFGeE94SWV6cUJiaW42NWJONXRZVU5tTXlT?=
 =?utf-8?B?S2lIWXdDMXp1RjlmTm9IWnFFcUE1cy9qT1RCaTFhSnpOc2lCeTQwbDYxU3BI?=
 =?utf-8?B?TEhoQmRGYjQ4T1l3cDhJSkFWVmVHNFo3WUtUdUg5SVVBK3JIc0NwMG5QejdQ?=
 =?utf-8?B?c09YN2wrdmErRXRlaWk2c2RVUUZmbnI4akY1a0pwT1NUb2RSS1FwcHY3OVhX?=
 =?utf-8?B?S25GR1BIUzNlMGxxMStBa3ljNWdaenNrOUpOdXd6OTJtUEtMRVk3cVN4bFhy?=
 =?utf-8?B?Q2phRmREa1pDTkxNRi9zVnRlQTNyUzR1Q0llYTBOVExxaWNyazBsR0NDNWJq?=
 =?utf-8?B?QzJwSkhxYnNYY3Vya0pVMndvakZOcUUvVlFNZjZ3N2xIUmNLU0M4cjlETXJT?=
 =?utf-8?B?R1kvVk54cTlGY2ZabHNydFZjLzcwWXFFNTdPdVBkSlo0N0hpay9Ka05JaUFL?=
 =?utf-8?B?WitYbnRBWFdFbDJ1WGIvL1pjQ0J1akNrQ25IbUlhcDVBOTBaNSs4RjY5SUtY?=
 =?utf-8?B?SVM5aGt2MjFtY2YyZVJaeEoxVnpWS25BUUlBS2dPRW9jVFh6RTdLQ21YUVhU?=
 =?utf-8?B?TXE0ZU5hRm5pOUNrTGRBT3l3QVpOVmVlUkVNanVGREJxUHFIbG5LcTB0dEdO?=
 =?utf-8?B?bE1yeVhTVFowMnBxMnlSWnkydEgxYUI3anhZcnlCcnhKSXhxVHYwWlh6MXFF?=
 =?utf-8?B?OVBCR3lhcHNONEt5cytTSmNtZkdDS0dsRUJXbElSY3FBOTNmdGxYUWFCSDlG?=
 =?utf-8?Q?HJFiY1I4FFe65y1cqxFk01Kic7w4fAa5SrIZO6W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93af98b6-f4a7-41f6-0d11-08d8f914d935
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 15:58:41.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1B7IiCao5IGGOFKuBIsS+NoBvmIgfIx/fgHpuDngScMXyjdtOLrtS0pyXsCPY/YO/Q2qgb0HqSnBDqQrUmjRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

On Tue, Apr 06, 2021 at 04:09:34PM +0100, Julien Grall wrote:
> 
> 
> On 06/04/2021 15:59, Roger Pau Monné wrote:
> > On Tue, Apr 06, 2021 at 03:30:01PM +0100, Julien Grall wrote:
> > > So I think we want to be able to compile out the code if not used. That
> > > said, I think providing stub would be better to avoid multiple #ifdef in the
> > > same function.
> > 
> > I think providing stubs is the way to go, that should allow to remove
> > the unneeded code without having to explicitly drop MSI support. As
> > said before, I think it's fine to provide those unimplemented for Arm
> > ATM, can be filled later if there's more pressing PCI work to do
> > first.
> 
> We should remove unneeded and *avoid* allocation. Providing stub for
> existing functions will only address the first problem.
> 
> For the allocation (see alloc_pdev()) , we will need to move it in separate
> function and gate them to prevent the allocation.
> 
> It would be wrong to gate the code with #ifdef CONFIG_X86. So I think
> Rahul's idea to provide the new #ifdef is correct.

I think all this needs to be in the commit message then, because from
my reading of the current message it seems like MSI code is only
removed because MSI support is not implemented on Arm, rather than Arm
not requiring such strict tracking of MSI accesses and MSI interrupt
setup. Likely the naming of the option needs to be adjusted also
together with the reduction of it's scope to stuff that explicitly
needs to be removed in the preprocessor opposed to adding arch
specific stubs.

Thanks, Roger.

