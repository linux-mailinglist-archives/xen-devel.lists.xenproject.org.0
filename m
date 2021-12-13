Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B5472BD0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 12:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246011.424358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjuY-00028i-DN; Mon, 13 Dec 2021 11:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246011.424358; Mon, 13 Dec 2021 11:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwjuY-00026n-9o; Mon, 13 Dec 2021 11:54:30 +0000
Received: by outflank-mailman (input) for mailman id 246011;
 Mon, 13 Dec 2021 11:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0LF=Q6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mwjuW-00026h-8Z
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 11:54:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a729ddd-5c0b-11ec-b1ef-a74572bcbcad;
 Mon, 13 Dec 2021 12:54:26 +0100 (CET)
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
X-Inumbo-ID: 6a729ddd-5c0b-11ec-b1ef-a74572bcbcad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639396466;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Yj+As1KeYVsp7ZzY87PcF7BnFgTK9iZr5k8q48bwZxc=;
  b=IBQY9urRRixqeEATMdHTSIj8MdEmNdCJkB/Bjkpab22rbU8/78VEFofV
   hmenRnKx0owVatLDNrqXx3g206FbRop4DWVcMEC3vcoFaIVGUBFeqC+Of
   d3wNGfUXDlyoo4jyUULfW+FuLd8JmcHZK5G48pBE9Y6nRo0UZa3H4yEj2
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UdBEoqjDEU86UIvVU6iq0F9U26YPRaON3LotSysxMdat4Fs5Eyh+98tAK6eXwnO3hW4coFQSUi
 wNFeIN5EsQy6D2FVthLwtOMqxUsM/7m60tYHCMmmspHue9yeF6PuIAz0zngtHKXU93cHd8g/JU
 q8/yv5716V1PiYjbejfmB9ITBJx8ja4DFVTYj6q4ppcLyBtCnwVvUNvrkiV4y6cSoy6WbOyQvI
 Ks1oDUN7p6HWU1VHYUNWz2ALF/z0DlMzXRvS6PWjsEgl5JWDltzFDn0MxuoBmnK5nwfMx0DNfw
 KnaCQTTKdqnUVqJBD1/qDYte
X-SBRS: 5.1
X-MesageID: 59868719
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OeitRa6OIcK87A0ZN4G0vQxRtNvAchMFZxGqfqrLsTDasY5as4F+v
 jFLWWDSOK6JZ2D1fI0lbIW+pEsGupeHz99hSQM9/y1kHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj29Uw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 tBor4K1YgsSIaDmnfVMfRxFDjBiFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWZg2JARRKe2i
 8wxVWpAUAjAMj12HWweFq8dpreQt2n8fGgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 mHL4WX/RA0bPdq3yDyZ/3bqjejK9Qv5Uo8PELyz9tZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZHbfk8qsodSQc12
 3WMjoLHACFyoaG8HCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjv3jpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDtYji7rnXzURhpdnh+5nzuJ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gAv8QPbCb3PfQuC25UNyjN5fK/fekJq9iONoYeCnSPXFHvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOvGDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQxQcCVgW8mp85c/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:TFdMdq29DigPwMFnFT0XlQqjBStyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvqRZxRBf7LdEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PvP+W5gNcNvpcfHHe1Alfii8Q156AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,202,1635220800"; 
   d="scan'208";a="59868719"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARDvnfxHyjacoLiJLgW9TTSA8gwRALPPTLpDvJtI9m16h3J9kqzgNoS/XG2A8RpVzxyPCFnVBQcRL4NuEuTi/E4YTWSZCHUMfB7ZUtzMsFuQsE7vqXlxtrKppoaxPkuCpjXnOWO2OnU8LXnlgcdy2i25LUjnKK6uggKpFwrcFnM7sP9BhJ6+UQInoDR8+/FT5ravafK5kTjuPXXXTGnqA+t66Z4KSQ78Xmpadgmtyw84SmirbXXSclwgD/zik4cbgWFfIdF8iIE4iTNiEcGMyK0Pz+otitxJtOXJNlfi+QFdhSbozSAHBz5hPlXhxI4RLtLvivtprh15smITv6FEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKgfQrXxZQAc0PxZZGbMy6H/JYMU6Jt1L+VZcUzZB/c=;
 b=NRQMyhXZ8VgZXkt9LmhPmRUjGkji7OErVIiE0NN5I1iHwivyficfGRXuIrZm8ZCPB92GxWgWDcLiEbJ8PjUqnKl4Ku+e1L925Paab2VOq1sJXQb4xxtg/a5VwfJBBs8dERtHFirrJxnkyxvQzJVsNgZeU69JsMcAG9efwt7BCBg9mnhnhryFnJivWY+I0yNlyjUoOl2HZWLR0/9aIhI8t+36CKNt8IounPVPe3jbSspzO1TSRmM4Z9zSHQ00Ulhziag/i3ef2PF//Hx3y7ndUmGzdBgc8hwxDrT7t1iri0W1pkUoG8Za8qe5rGsUwrrJjvlUuJU/xZvBKNS1F4tL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKgfQrXxZQAc0PxZZGbMy6H/JYMU6Jt1L+VZcUzZB/c=;
 b=cd2ZiaXtasOBU7b1FJ/qvw6qEI4yCm+vvVvpd+Yl6Rv/c3n7HvCOkSEy/K9WihWpd0dOoNF1ULnCpdiNh8nywCv+/ERCULE6tjvZQbxgy4JGM8OYKdOPIJDHzRg/yLvZt0LEX/yEtekc57kurIryMaGK4ENyeuJwl1gkYMPzKCM=
Date: Mon, 13 Dec 2021 12:54:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 13/18] VT-d: allow use of superpage mappings
Message-ID: <Ybc0Z+EtzQx4CUen@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <df4bfaa9-e708-929d-3c2c-68833dcc2d2f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <df4bfaa9-e708-929d-3c2c-68833dcc2d2f@suse.com>
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb10be5d-c83c-43dd-12e2-08d9be2f4cb4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB49713FF51B743580BF9123DF8F749@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKAx13G/4sm5ssj0mStFU6GEcNhaNnjeXA7Eempg5TpxgC+l8h1HTVJlkQZo8p0UCbG/VdCVIox0Nxqpxn9NG0ktMLidcVcLVqnsmimQ1qJVajHjknflF3BXTlV1wXNnf47gmbiYBZY8MQJsv9Kka6pj0uhILAuntntW7qoP9i5QImx13b9lLw+vv5ud8gwA7CsKm/jXXvCbXs/YBAxtKnEP1qq371W7mD/P8NCLky4YMnPXuK54bDH7e7vZD1gIS+/KpwxghFRj4Q+7bGgAQUhLGTuwF2ZWkkID1/uD8H4yOo5McZxw6qEQju2nbQ4yJDWi0BcEE4zd5INDoH9GWw/ah+DN8stRRySRbJnTBhoE9lvat2+qnNbBs/ZdxBpEeVylq/TpX7S+MotcMDYa75JgBHAobiyuUbnxXqs5wQ8i58Q0jC4MoHGbdMeHVdSt7yavMrYCXSPNjXzBHZo2IgKpv6taz7B1opepH+5dfW2V/xB6QhMdbZAtWaMhkJPGmg8dOwaoDV/AOVqNXW1zzOOErkL8suuhLrVrlR6rmvvO5INsyixn6qd0Np1bWqpKBLr1jZ99IiWeVZ+UO5gc8ZTcB1siF7ddFM9R8H8y+7GZfrPspMKc7O8MQJ2CHNt7siGp/9v3A5yOw+GcPi6IZmwFADfrhvznpdqa61CW5In7WFlxjpD6MKolZEuEPpEr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6486002)(66946007)(8936002)(6666004)(38100700002)(66556008)(85182001)(82960400001)(66476007)(5660300002)(4326008)(6506007)(83380400001)(2906002)(508600001)(26005)(8676002)(33716001)(86362001)(9686003)(186003)(6512007)(6916009)(54906003)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym5aNGQzZy9MSUkxWit5WjRYMzA3MnZSMDZyZkxhTDNhTERqK2k1dEZOUVVp?=
 =?utf-8?B?RGxJVGkxMW5kUXZPRVZwcFNSRzA4MmFFWHFBL3p2dlRZVmxMVWhKZHJpdGpH?=
 =?utf-8?B?UFh1cFhrQmxwd1lEMW1RYmY2Z2M5VVB5a1YvaDRRNzV4NmZwMHZZN005UU9j?=
 =?utf-8?B?SGVRRzhtdW9DSDZYWTk4SWMveG16VzlpOWJ1OXFkdjdycmMvMG1iV21hbE5M?=
 =?utf-8?B?eGhkdUNsRzF4UmNjSXg4SHQ1cnNwcHBuMkRYYnE1YUhJemZCWEdabjE1OWpz?=
 =?utf-8?B?ZCtaYWg4U1lieUtGYldTUmVGSlR4R1prZE5FOWRMcWxVRm4zMFNYa3lqVmZm?=
 =?utf-8?B?aTN5L0UzTUp6RDlvYmdLWVkzK2lBRFVsbFdvNDRZYW93Zm12eXNYclVlMEpv?=
 =?utf-8?B?WUNlNnpKRGplSVVCWGdCOGFDK3IzK2psMDd3c1A2MXkwelpSbEkyTVRoTXl3?=
 =?utf-8?B?QTc0c3VDMjRxSEVGL0hjZXc2cTNXOFZDQVBTa2FaRDJmNjZldFdhRVJ2NFlF?=
 =?utf-8?B?VHNhWDZraTZrRzFwaXE2VDVwQU9iV2pJZDBPeERQQTVzam5EZ1Y2d21IT250?=
 =?utf-8?B?amoyZUdRV1JiZ3IwSEhJeHRXb3g4T1BOQUplZ3BHQUpHVk9PUWd0YlFqWE1u?=
 =?utf-8?B?MnY5R2JuVXJhMHBHdmFTU1hQUktnS3h3VG1reVJtV0F3TnNVWUtVVml3STdF?=
 =?utf-8?B?azJ5S2swWDU3SVVRaGV6VC9GVmxzNkZIMHhiSWM3eXkwL0lGd3pjNHkzZlV6?=
 =?utf-8?B?NmlUL212SnNKZlBRNkdiRXhyZ1FwMEN1TTlqQWFDaHV5Wm96NlZtTUxkOVBT?=
 =?utf-8?B?UEU5ekVtNSttS2pPaGVtU1hINEZtampuTzFVVHZlRWh4czBRZ0s0dFV3WkNl?=
 =?utf-8?B?bDVWQTBucStneTlwT3ZzbkVLU1JYcmQveHlFYTJ3ekdSTU9iRHBXUnNrU3pu?=
 =?utf-8?B?NTJRdVZadE5tYkdjUStBa2FhZzRuYTREK2VhdVo2elkvdXRtRWtXbVJjeHFm?=
 =?utf-8?B?QW9YNm9mR2tyMDVucFprbE82QnZ1Rk9aeE5XN0w0K2NPWUw4RC9lZDlnTS93?=
 =?utf-8?B?aFNhWVV0Ylp5akFZTWNFM0hwUkxyYkFRMWlYckoyK1FqNWFYMEl4QWRvUThE?=
 =?utf-8?B?eGxyVXpZNUwzeFRmc3I3Q05UNUU2eVpNOHZ1MlRwT29QTS9kc0UxUlFqWml6?=
 =?utf-8?B?eERIQU4rM0YzU0ptYmpOSkcyd1E2dk9EWGNwWWxuK2VoNjFWK1dzanFXNFRi?=
 =?utf-8?B?cVZoU2Z6WGdJUmp3M3lxUWRJMEJ6c1ppUXc0clJIeHl3VERtTGthR1BNRTdi?=
 =?utf-8?B?Yk82cVJTenhXZ1lXWFFhSEdpTTF3Q094YWkzNmFQcFVRZWZTNVRac1FnaGZE?=
 =?utf-8?B?ZW50RUc4U0FxblNZNUl6aTVlNjYydGVSdnF1ZFlNQ0xPVnc3L1F6U2tVcC9n?=
 =?utf-8?B?eGYrOThXSGM3eURma05DeWxsekluTlJiT3RleGlzQ1dIRTEzLzB5U1NwVHRQ?=
 =?utf-8?B?dkwwc2VFN2RiSE45R2RhVndQV1ZpR0JWWERKR3gwaXc5Z0VoaW54MzJYeUVU?=
 =?utf-8?B?T0NxTHZlQ3RvcHFzMWFidVZUMkxtVmVtajhBcHVYQm5oaEl5aFNZWFlRTVR2?=
 =?utf-8?B?UGFtK1FaQnNoaitENUVzcElrT1RVOUFsZ3pyd0Z5YnB1bmZXaDFhdnR1Yk1v?=
 =?utf-8?B?Z2cyWnRHWFpNUHVHMmhJcXBWbnJsZ043eS9TTnh5cisyY0h1UUhqeTN6TVBZ?=
 =?utf-8?B?OWFzSVMxSE11S0p5blZneFNoRzR5UlFTU0RjVnhyTVhGb2pSTG5Cd1MwUTg2?=
 =?utf-8?B?NmtwTUtzL0l5eTVsZTB0eHhPOEs4QVlkVWEraUJHUHMyOVdRaG91bXJVcjNk?=
 =?utf-8?B?QnFKMGNPY2dVcW9HNFFXQU5xVmhKTksxQ1pnOWxXVXNaMVp3YjN3STh3WGNp?=
 =?utf-8?B?aHpkaEMzdVo1WlNnbVd4TjF3MTZ2UEpnS29Zc2p0NGJHd2RMK3VuSG1DSC9V?=
 =?utf-8?B?OE1oODRrVEQ0cWRWYlRXZm1ITDdrNnJ6YmFXbElmaHBZcWY1Y1VzUTVrbkl1?=
 =?utf-8?B?QVVjMmNVUXNyYWU4K3lMeUtWV2dqWS9RcUFmZWgzMTRoQkZTZzJZM3laZ3Ry?=
 =?utf-8?B?U1RYdDVUY1dPb29iQzJlQjkxS0F4T2NUTTdFckFpMUtlOGdlamRBeGwyYTJP?=
 =?utf-8?Q?jtdGThS2XNnEYmlRt36/jUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb10be5d-c83c-43dd-12e2-08d9be2f4cb4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 11:54:21.2023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KL2U5WpfolL7Z/SnEjW1pBGxLX4eSqPZNI5fe5uxpvEzQJaKRjUjBmuGYZFTKwjgjhkeevmPuhm6OWN5KhIxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:52:47AM +0200, Jan Beulich wrote:
> ... depending on feature availability (and absence of quirks).
> 
> Also make the page table dumping function aware of superpages.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just some minor nits.

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -743,18 +743,37 @@ static int __must_check iommu_flush_iotl
>      return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
>  }
>  
> +static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)

Same comment as the AMD side patch, about naming the parameter just
level.

> @@ -1901,13 +1926,15 @@ static int __must_check intel_iommu_map_
>      }
>  
>      page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
> -    pte = &page[dfn_x(dfn) & LEVEL_MASK];
> +    pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
>      old = *pte;
>  
>      dma_set_pte_addr(new, mfn_to_maddr(mfn));
>      dma_set_pte_prot(new,
>                       ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
>                       ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
> +    if ( IOMMUF_order(flags) )

You seem to use level > 1 in other places to check for whether the
entry is intended to be a super-page. Is there any reason to use
IOMMUF_order here instead?


> @@ -2328,6 +2361,11 @@ static int __init vtd_setup(void)
>                 cap_sps_2mb(iommu->cap) ? ", 2MB" : "",
>                 cap_sps_1gb(iommu->cap) ? ", 1GB" : "");
>  
> +        if ( !cap_sps_2mb(iommu->cap) )
> +            large_sizes &= ~PAGE_SIZE_2M;
> +        if ( !cap_sps_1gb(iommu->cap) )
> +            large_sizes &= ~PAGE_SIZE_1G;
> +
>  #ifndef iommu_snoop
>          if ( iommu_snoop && !ecap_snp_ctl(iommu->ecap) )
>              iommu_snoop = false;
> @@ -2399,6 +2437,9 @@ static int __init vtd_setup(void)
>      if ( ret )
>          goto error;
>  
> +    ASSERT(iommu_ops.page_sizes & PAGE_SIZE_4K);

Since you are adding the assert, it might be more complete to check no
other page sizes are set, iommu_ops.page_sizes == PAGE_SIZE_4K?

Thanks, Roger.

