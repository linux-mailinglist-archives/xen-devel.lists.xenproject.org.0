Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B8353244E
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336250.560616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB8-0007UU-0a; Tue, 24 May 2022 07:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336250.560616; Tue, 24 May 2022 07:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB7-0007Ma-OA; Tue, 24 May 2022 07:42:05 +0000
Received: by outflank-mailman (input) for mailman id 336250;
 Tue, 24 May 2022 07:42:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XRG6=WA=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntP6H-0003DA-RA
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de2b116f-dab4-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 18:24:51 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 12:24:54 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3474.namprd03.prod.outlook.com (2603:10b6:406:ce::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Mon, 23 May
 2022 16:24:52 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 16:24:52 +0000
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
X-Inumbo-ID: de2b116f-dab4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653323097;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=56GxmM2qFD8J5GQjUa8U7rFpoV6kXeXZByDyeP76XJs=;
  b=Cmdote/kvP4L7G2AteaCkSPuoiXEAxcZ1Boqj3uUybp3CmrNIkb9T6vM
   ItyOQC+CDVZb7yl6rBOQxnT3QVm2lxgNSmlFO7qB52UfyT911RCSaBOC0
   wQMsHy5/UWHnwvF3yDuaZ03kSZQ4hEyjC6y5gZdjJ3oYY7fP6WAmtFNKc
   M=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 71972025
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rERlL6DB/i6y7hVW/13iw5YqxClBgxIJ4kV8jS/XYbTApGkqgzIPz
 mdMD2yHaP2KMGv3f4ogPY3j/R4Eu5WEz99qQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nj2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPg2m
 MQTkpy+bz1qFYmTut9ASzhWLgFXaPguFL/veRBTsOS15mifKz7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t7B8mbE80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx1yalK2cFwL6TjY50xDbh7gAh657sd8XzS9ygeNhJl0nN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3uFuqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0XtNRF6g/91uLw6+NuwKBXDFcHnhGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb13ojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:saGVOq/fJlA5yDunvMVuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71972025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGQpWWFnnDN0UWnKigWniGC8PCHxJXuaNT2fgZ2MOsHtLGjO2lXhCrsP6+8bVilBoI/DOCrQC1Thzr4YzjhATdJvg9BRnp0OpIkIlW93u/AkwgVvmG0NaxRARi46CgrR9kVR4ctF5QG9uJjM4Hkork48mXQtTICLEhzi/6VX4sOMnyCETD7OHuu80xckY7ko8TWK1p1LmelgoTLxGR8LsOJcbj+NLuo8FJsa5+kXwnB9F5mXyuxlYxYiz1c5eobOFKgelO6ZJAWIQ8c/75oJp3d20ZIz6IYWEwBwhnYvhxr1GWTVbJrAhlCHIEmOR/LWvRBwfZ6WqjEPPDl3LLKMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDo5fc7VXEjbUfTZbfKOT5Mxq0ouupMZ5lhrcZpiRBU=;
 b=aUhBT0rbffOh0ygZ2TtnQTweJ4e93Q1sCGEG+rlBu5AYVwN7oati0zi3zkkAor+bhKQD6V85lVwPF3oTbfzmeaKBfex2+xt5EHE/mRrGVWnb+XUzv07pCPH6AxSqS7V4pk83bOAjBhMJAxGA04p0pqV94VFgKOJOLBYnZdGpXpBSmXS3MB4OlJoWBq82uyhl/AmgnmNxoLzxGz6152JmzpRECewnhicDl1gQnhSkeReOFzGy2osZWjTae2HVPykgUgzsv/29TFmTO8uS54W07OFZPPeb4jI4pf8v5mnxHsEj4TuBUSNjUZzjUFPuq2jnz2cEmDqpkYnkrjtsGmgMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDo5fc7VXEjbUfTZbfKOT5Mxq0ouupMZ5lhrcZpiRBU=;
 b=nY6YZtGDyoSlTnyolUw9LR5mXNhbG9j9ixw6sRNopBB98uaqbXZGk/tdMXgGvwVEeMen1hKRc3QrmwJ2VoMHzlVCqzutaNkgE956BQUy4z3SM3e6lHVOitoMOu/rRORTX+GCKyyodsDo4FuDLrUFsrXJEt46xQwiZEZi0GM2BXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 18:24:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Message-ID: <You1UKy20ofV8NgO@Air-de-Roger>
References: <20220516143116.28602-1-roger.pau@citrix.com>
 <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
 <YoucK13m0y3CqDl1@Air-de-Roger>
 <4b025fee-8f7e-1849-184e-1be8fb99442b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b025fee-8f7e-1849-184e-1be8fb99442b@suse.com>
X-ClientProxiedBy: LO2P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e07aab0f-c707-4cb3-d0c7-08da3cd8c3d1
X-MS-TrafficTypeDiagnostic: BN7PR03MB3474:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB34742BA1538CA88C453223CD8FD49@BN7PR03MB3474.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsQI7ZxKaGvJgjOIuern0H6PR156DNR1gojB9sReEoO48h7xh/kbGnFPdh3mnmXJVglIzm43jgK+O7ryM8NZAmZn+WtWPvVL1AD2/9jtQgux+3tFGbGNKEG94LK67nvp/CYoFvAazs0w1PpCHvwW33rVuAtoyZxBruVaQgD/des2eXiKkWnB9TfZ7CL3wTSJnStqLLSLL7ImZN3gbkhm0hccaUBSoyPhXCTXpcyHH82gP0WI/zkiNH0c0Sne6OBBkrrMjQBOXFRIV4RBVjiIR2IOce/H0Jl8+9s4hYn+sIgeKJDK1pGdVkxFa3qjlQdbl491qzDn3trHozF79zhAZimUL0NMXo7Ef2KGNqvE9QMNIRIXSjmEbuHhwyedF/EarTJ7PfZFzU2ig7+kRhk4xmMVCCLn95+NnrKUHqgMJ/7S/p/wVf6KKxcvvgCt0iz/dYMW/L07ksrj9rQoMrt/XNjgQb6zqZuvbo39+eW47dMGueYT8Oz7/ho19B1kZWt32CyjN+0lG4/wPn0y0LKSkTTTjpJ3p3Zc6KLZDD29TZiuIS4dkeepi6tpFrpJ7x0aedBgWDeIB6HWfhcPpk+Kh4qQlMDIiPJTx67VhzMfG4DK6fihW6bH+qhVQc6W2FdDozenRQPXBn6SSrlAlEWZFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(83380400001)(2906002)(508600001)(6916009)(54906003)(316002)(6666004)(26005)(66946007)(38100700002)(6512007)(9686003)(86362001)(82960400001)(33716001)(85182001)(53546011)(6506007)(5660300002)(8676002)(8936002)(66556008)(66476007)(186003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clBldEk3dVc5WUFRZ0REcG8rbXduajZtVGFLZGtDbE5FU0hsVXYva2p3ZXc5?=
 =?utf-8?B?N3dXbVQ0NjdUODdac0NBQ3l4VWpRM0pLcnpEekhwTGZ5d0FEZGFmS0ozc3Ay?=
 =?utf-8?B?VnFVd0RXRlV6M0t3WVJkUDRIakNRcEpmbnBISTNJZURZYU5WL2lQWSt5aXQx?=
 =?utf-8?B?WGNxQmR5bldEL0tIaEQ2MlY3RWxhM21lRnpuNFNOS0gveUx0ZFJEbFdGSjZT?=
 =?utf-8?B?KzZOSFd1eTdMN0hva3l5RTZnaVpqUDRPZWxQbHVaQ01HQ1B5QmZMWlcwV2xk?=
 =?utf-8?B?ZGpXTzdIV1hMb0JvYmNUbkUvUHhmK2NpcWNFYmhrd0crRHVDRHJEYXpMaUlN?=
 =?utf-8?B?aVFrM3ZQdXZpVTI4REFqWjV5K1hzTTRHczRLTWJhNGxjdVNRNVhrdjN5cGR4?=
 =?utf-8?B?eHMrR1dERTM4SyszbWs0M0tNcEhsdEJnWGRQM24vTXZMbmIxTjg0UVhFb2Rh?=
 =?utf-8?B?YU9uYms4WEQvWXBHV1JTQVJqRVUzc3JON3FVK3NWa1pYRGdaMGR5dHNCZzFw?=
 =?utf-8?B?MmtKR3JyZFVsMjVpekNGK2RwczlKc1VZSFlTb0ZvV0QrVHVOdUlJNThDbWIw?=
 =?utf-8?B?M2R0Y3lOWGMrNGs2WldPaXdDb2lnMWRSc2ZyRjdhbjhPa090MWVXRURuUzE2?=
 =?utf-8?B?YS80Vlg0b0JuaU9ScFYwRFU0UjdReXcwZXNndWRHeU5wV0hUTXhDdktnVWht?=
 =?utf-8?B?VlNKa3dReVNQVDR5UldLK3AwV0M1TXJLSVRKSzZ2T3lLSkJtQ0NQbTVveEtk?=
 =?utf-8?B?SStWRGFQODVkb1JZSk1DcWM2c0xJYW5SS0EyUjdscUFieXAxTzhYZ0tPcFZT?=
 =?utf-8?B?d0M4VmIwV3I1TzNkYm0xNTBOVmR1YXAwZEdXdnFLczJoK1ZjK0ZVNjJxWmha?=
 =?utf-8?B?bUpmZGdMemI4V2hDVmVuUkp3Z3piUzBZOXc3dmVrUVJEeGl6SlJTbVFYWVhT?=
 =?utf-8?B?TTFXVytwbFNIM2VBQkova004K3U0NU5MZFNwdVRGdDNMZWhWZm1nSC9WVitz?=
 =?utf-8?B?TGRUZ2hGdmNiMzVZcW5JdzNGdlpuZ1FDMlNONzcxSFVwTjI3MU10SW9reWx0?=
 =?utf-8?B?bDlibjY3a3NrOEcvRDdvN0Rlay81Tm16eWpxeXZmckpXYkRZRjJuU0dRRTVI?=
 =?utf-8?B?SG50VVJrR05wT0tta0hSWUNDclN2elpNbmFLdUxETEtBRkRzODR5ai9HN08z?=
 =?utf-8?B?bHFQK0JKSjYvcVIrS2UvWWJsMTdWZnpVeE9vNVp3elphTWVrNE95WEpWWTE0?=
 =?utf-8?B?RkoyTmc4N0Vlc3pxbnFNMzVjNVc5ZFVUdkVZZ0M3aEZ6L1M1dmJMVXpMWU1H?=
 =?utf-8?B?ZFBYYXZkbTRoOGMyTTBiKy8ycjQ1N1NXMzVUNXJ4OEg0MGdzREZrVm5vKzl1?=
 =?utf-8?B?ZEVrdDUya3pQWGdPK0lLVU1taFUwb2xORUdobVJzTGFCVGpqZ2pJd3hIaC84?=
 =?utf-8?B?YjdMRnptdzVOVUxtWDdPUUNpZ2REWmhEMjVYRU9YUWJoanB4dzhuTVVRSTZk?=
 =?utf-8?B?dWpCZVdJOWRSdVhUaFJxTFVLcHF1VXR0cGlhRUpMeU1LeDFUN3BQOUVONFVG?=
 =?utf-8?B?LzBrOXlBMTFUWjIrRklWQTgvY2x6NEYweWx5MFk0ODVPSTA2bGhrQXhoOUdj?=
 =?utf-8?B?c2w3ZVhBYlRvV2F3d0RuQmpnNk9YR0RvL0RHZE9hc0EvYzlaMzcyQmt4RFpm?=
 =?utf-8?B?OURGRnF3Vm83UmIzNXlGbnpxeS94ckhhN21sUzJpUWIvS2Uxb2kxcXAzbWtL?=
 =?utf-8?B?Rk14bmFSUE9jQXc3dnRuL1dOVWVPSkwyM204ditlS25XRlNJQTJKZjUrYUUr?=
 =?utf-8?B?bzFPaWRjeGhBM0xCNmtrU3RabXFRQnhOdFBuMzlkak5WZzI4M0JkcUtBeTVL?=
 =?utf-8?B?M1Fkd1dHRXZwZjF6S0ZXVHJSc2F5Zmg0TnVsL2h5RGhuZ1J1V2llWExNaG52?=
 =?utf-8?B?TXJ2UXJabHkrWHl4MTVldVRNcWNFd1dqcS9Cc2tTOXF1ZEdYR29CcFhUcFpL?=
 =?utf-8?B?RUM0Rmo2eGR5TnVSNWFlSEc0WDMvcjRSTldxMmdLZFZNQlp3QXBscDVadGt3?=
 =?utf-8?B?YmNNcHZTanY4cFV4WjJXVlo0YWhpakVaUlFiV2ZiYVU4azVYZk4zdDRneE9K?=
 =?utf-8?B?RC9SeTZPSWxoV0hOc2t5SEVJTmE1MU5yVGJlblAzTitYZXdEY0k2UndFTWhL?=
 =?utf-8?B?akY0Rm1SaDh6aWlaQzh4cXJHVTd2Uzllb3Y5dUtrY1pEbkE4QlljVXZMeUJk?=
 =?utf-8?B?R3doemdXK21pYVFFV1ZBQnVyM1ZBS1Q5SVlmNGZsV1BwZ2QwRUpvK0ZaQytE?=
 =?utf-8?B?clJQQWZlZ0pwVE9DMUVIV3B3RmtzN25NQS85Vm5RdDkrRDhZdStHWFVxeTVh?=
 =?utf-8?Q?sfNfG6A7fxnt0b68=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07aab0f-c707-4cb3-d0c7-08da3cd8c3d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 16:24:52.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lHxSq7BbFrnn2IBXi96eXPw+XHuJoqaB+Go5RfjCh5rDwIK5AfYP3vW+U+OBn2Qt2LyE7AN2o9hkQvSHXbFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3474

On Mon, May 23, 2022 at 05:13:43PM +0200, Jan Beulich wrote:
> On 23.05.2022 16:37, Roger Pau Monné wrote:
> > On Wed, May 18, 2022 at 10:49:22AM +0200, Jan Beulich wrote:
> >> On 16.05.2022 16:31, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/flushtlb.h
> >>> +++ b/xen/arch/x86/include/asm/flushtlb.h
> >>> @@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
> >>>  #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
> >>>  
> >>>  /* Flush all CPUs' TLBs/caches */
> >>> -#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
> >>> +#define flush_area(va, flags) \
> >>> +    flush_area_mask(&cpu_online_map, (const void *)(va), flags)
> >>
> >> I have to admit that I would prefer if we kept the "_all" name suffix,
> >> to continue to clearly express the scope of the flush. I'm also not
> >> really happy to see the cast being added globally now.
> > 
> > But there where no direct callers of flush_area_all(), so the name was
> > just relevant for it's use in flush_area().  With that now gone I
> > don't see a need for a flush_area_all(), as flush_area_mask() is more
> > appropriate.
> 
> And flush_area_all() is shorthand for flush_area_mask(&cpu_online_map, ...).
> That's more clearly distinguished from flush_area_local() than simply
> flush_area(); the latter was okay-ish with its mm.c-only exposure, but imo
> isn't anymore when put in a header.

OK, so you would prefer to replace callers to use flush_area_all() and
drop flush_area() altogether.  I can do that.

> >>> --- a/xen/arch/x86/smp.c
> >>> +++ b/xen/arch/x86/smp.c
> >>> @@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
> >>>  {
> >>>      unsigned int cpu = smp_processor_id();
> >>>  
> >>> -    ASSERT(local_irq_is_enabled());
> >>> +    /* Local flushes can be performed with interrupts disabled. */
> >>> +    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cpu)));
> >>
> >> Further down we use cpumask_subset(mask, cpumask_of(cpu)),
> >> apparently to also cover the case where mask is empty. I think
> >> you want to do so here as well.
> > 
> > Hm, yes.  I guess that's cheaper than adding an extra:
> > 
> > if ( cpumask_empty() )
> >     return;
> > 
> > check at the start of the function.
> > 
> >>>      if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
> >>>           cpumask_test_cpu(cpu, mask) )
> >>
> >> I suppose we want a further precaution here: Despite the
> >> !cpumask_subset(mask, cpumask_of(cpu)) below I think we want to
> >> extend what c64bf2d2a625 ("x86: make CPU state flush requests
> >> explicit") and later changes (isolating uses of FLUSH_VCPU_STATE
> >> from other FLUSH_*) did and exclude the use of FLUSH_VCPU_STATE
> >> for the local CPU altogether.
> > 
> > If we really want to exclude the use of FLUSH_VCPU_STATE for the local
> > CPU, we might wish to add this as a separate ASSERT, so that such
> > checking doesn't depend on !local_irq_is_enabled():
> > 
> > ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu));
> > ASSERT(!cpumask_subset(mask, cpumask_of(cpu)) || !(flags & FLUSH_VCPU_STATE));
> > 
> > 
> >> That's because if such somehow made
> >> it into the conditional below here, it would still involve an IPI.
> > 
> > Sorry, I'm confused by this: if the mask is empty there should be no
> > IPI involved at all?  And we shouldn't even get into the second
> > conditional on the function.
> 
> Should perhaps have made more explicit that "somehow" means a hypothetical
> way, perhaps even as a result of some further breakage somewhere.

Oh, OK, then I wasn't so confused after all :).  Given your lack of
comments I assume you are fine with the addition of a separate ASSERT
to cover the usage of FLUSH_VCPU_STATE.

Thanks, Roger.

