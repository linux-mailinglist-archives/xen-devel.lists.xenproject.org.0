Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAE4DC217
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 09:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291432.494596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUlyB-0004dA-N1; Thu, 17 Mar 2022 08:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291432.494596; Thu, 17 Mar 2022 08:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUlyB-0004bK-JS; Thu, 17 Mar 2022 08:58:55 +0000
Received: by outflank-mailman (input) for mailman id 291432;
 Thu, 17 Mar 2022 08:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUly9-0004b7-15
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 08:58:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75776b75-a5d0-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 09:58:50 +0100 (CET)
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
X-Inumbo-ID: 75776b75-a5d0-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647507529;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=l8GLEEwnbe7OOOmFYUtxO1nFZn0Wa2yh9vObo5mXMJs=;
  b=JcTCWE1ViBx6jqyOOWJn8F/cPVehSkDfCMSaT3ALlMtXzqYzQCbwUORM
   0KDi9g0PmLe+FT+on2PUc/lWPlmufNdJHRzc8mngn8hd3RF+lWZfzs4vt
   csX3ViJE5d2V+a0zkZ4V6gfFrNI3j9rVSgOq+2QnVTGknyuO0Cy73tX7u
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68844461
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:syAe1qx+Ka/V63asUhp6t+fKxirEfRIJ4+MujC+fZmUNrF6WrkUFx
 2NMUGGDPPmDZWakfdBwPYq1801X7ZDQmNYwG1BqpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IfhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpluIfveEQTIaP1ob4QaBZjHRpcOLdh5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JAeQaqCO
 ZNxhTxHUEvdRBRhIEssDdEko/uUmnDZLw9HkQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKH73ati+nnjS79HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80iYns6Ua7kGgSdj5GRqirxasoRo0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTwQf5ML4iJoulR+JRdFmeJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43jKmG2d5aLWQDcMvAjsUVmr1SF8fqm6MtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLJ9g43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8M4ImjntZLlbvEMRSiai4hTyFfK8Ey/1XB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTCOyLIFu5fbgPRM4jVCZ9oRi2Pr
 76z0OPQl31ivBDWOHGLoeb/03hXRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi0zOdvHAMckxVpmbHNEALpd8yV6CWpZxPxELMVfkHhO3LEL8MOYu
 NFeIpTeWKsTEmqbk9nfBLGkxLFfmN2QrVvmFwKuYSQlfo4mQArM+9T+eRDo+jVIBS2y3fbSa
 ZX8vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:qKtNPqNoxYTcI8BcTy/155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80lKQFm7X5WI3CYOCIghrMEGgP1/qH/9SkIVyDygc/79
 YQT0EdMqyJMbESt6+Ti2PUYrVQouVvsprY/ts2p00dMz2CAJsQljuRZDzrdXGfE2J9dOUE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOup5Dt
 T/Q9RVfY51P70rhIJGdZE8qJiMeyXwqSylChPmHb2gLtBCB07w
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="68844461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd/04xypcdu/Vvq0RjCC6YudvNoYWrTTcGLlJlNTllyw5VKi1mKODd+83eW9BK0+uJtRbeQsnZYAGvbCRcUuMX6SMceAnGZvOJmnNS0g+Q2tE8XGQ9xHYZuY3NtOQcytAdTg82g/BCpmV+aWI22wI3++7AsdwMQGVOLbLC8+ZgiU1jy4mkK3EmR9AyeeS5OMcI7s1w/BdpSynfANxtYDo5nXqbF/qmo6jazwqZVL8cCgxewbsVGTmYHb0Z92zGrcmzA7Uy2HsjadnRF92w5rjeJPvSFvnIErNnlYnZUhKmAXaX0rKZOo7qGTLMQsgWPYMx9WgaCUUeC+pKTERSrbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4/+wJrNxh4ulhPDpxuCfdXARuFYHN5yB94CVG8WkgY=;
 b=LwgV0O3febcKBjwjsdJSM5hINflONNAZZAYy/KzZeS5XQW1ZS3Z7mKEzmKfXXnFkf5nD8HYE9ijRphvj5V4t+Hr+Rs50d01zhXGCc68g7BqKZ6kXbi8et8cKy8ku8sNOeSiYQMyPE7TO93sn1oQKM97kW9rkpADQMcpmE0i+vdD1yjzjj0WDyo1Rq9lZdK1AafcOVMSw9XXS7aFWnIjfZJh+6XuCRZ1L2EBnYwS87vJ9/g9YqYkwI5YOyowXc8yroWmfQ9UGsEcWUXoq/ng/CouScdc/4yVWxYEdgyPVGE96j6PHvH7pC3Kr8vBheDAIIfswsO8jh2E81mUXFLlPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4/+wJrNxh4ulhPDpxuCfdXARuFYHN5yB94CVG8WkgY=;
 b=tQYDBX/Bf+NXP9Je9NpTZxZHTpQx9jJEZTt9cGKRugP3htY5UOH4+Q++f9TarpzQOUJClkls5DkDz6egjQbk3HE5S+uRHrWLWgF4ToD0NiI5p8/udYrsXze+H7WTPPMlY9zEdE5Qejuc0rNyH4CKtSx5pXw9XNTiL4vKGb1kHKw=
Date: Thu, 17 Mar 2022 09:58:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YjL4J9wDGCtc/rRv@Air-de-Roger>
References: <20220316091315.19281-1-jane.malalane@citrix.com>
 <20220316091315.19281-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316091315.19281-3-jane.malalane@citrix.com>
X-ClientProxiedBy: MR2P264CA0157.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42499481-8188-43fb-a05c-08da07f44926
X-MS-TrafficTypeDiagnostic: MWHPR03MB2847:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2847224ED311F8AB616585C48F129@MWHPR03MB2847.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zupZ1nZ1giINrHN5i+IuJmdU756sc9sg03qKG0P+GbgMPYNIF4pG8m0Bv3s4AKHNFdnGADTMrwasUjBo0B/Wzhpl37mzCcvT0Vxx+i58TGpFN3QT3VTDivLyTxs98IQuVSZr5o1ttt4FnhyDjEt9p4ttpE4TwUTtLVDy7+qsXN5pQG/4E3Dlchr7AbrPhC/0v9hlNL8fe4INcHoh5ws/I3VMnptKZMrFMPt64ErHj4tUM5sQDupzTpizavU33HNEQTSY/0fSj6j8zzXj1enAqcFZd4xPoTTuncTuKbIDZvUD81uo5uhBkfGBtv9zhW/aEAGTBwzPtK6ULsDO99e7xKKykR7PgEQugavmQ0mz3CNnh0oTblT+a7rrsV/oQvmUN8210gFPTwSZMYv8SE3TNCYgAL0CJlt5hltsWPgbAOfMzBtJS0QGpvy4UFWmSQNoh5bCj08jaK/0VpcAjSXkJ6j/oJ19mhPwuVJDMwilqjSyI2tkpOFTVDtGv/S6LNwHpoFgJ4CTeqw862Ucy3zePRpBWrxf06lrYtam2p2ghtFSKTgwWRDHV7gtpVHJrphXySzFLOeAuoNBcBKtrJxocDrT8/KMwjk30j1DcA8teyfDTr509fE91d1P0XasFNzSNIr46fS1tTYItn6PxslpyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(6486002)(508600001)(83380400001)(85182001)(6666004)(6506007)(86362001)(6512007)(9686003)(33716001)(186003)(26005)(82960400001)(8936002)(4326008)(8676002)(6862004)(66556008)(66476007)(66946007)(6636002)(54906003)(38100700002)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBJcmhONUNiNVJtazF4SU1BbEZQZzBBNlcrZlNWZHRoTXB2NmxxMVRGeStK?=
 =?utf-8?B?VmVrWWM2Qms2NEphUTlDRG1QK00zVWxISWxOQmF5bExyTVdRamlRcUV1bU41?=
 =?utf-8?B?RCtIK05ZcFlvRkZYSkM2N2RZNDBWTVo4bE9BQTR1SEprUzhhMmdRajY0WlRJ?=
 =?utf-8?B?aWd4NThBTHNydDRLUWF1bmREb0FjVzBSRDk3RDYySGF4V09BaFJBcGVWQlVL?=
 =?utf-8?B?RGZNMlBYa0lsWFJNckcyNUwrZWRWVDBuZjFOS09XN3ljdndUNlUzcXZiV2c2?=
 =?utf-8?B?R3Bwd3psQmtPNDJkeE0yMUFnNkJNK2N1Q1VDellPakllTXpWMExoYU5WOFZB?=
 =?utf-8?B?a3M0eDEyWU1nWmcxUzZTOTFQbnh6c0p4Z3orMWF0MlFSM0E4SWpRWThuMVN1?=
 =?utf-8?B?ejdqUi9jR2tkelhTbUJST1M5dVZJVHZFMXVaY0VOTlN0Ymdmd2NqWENtam1z?=
 =?utf-8?B?ZzJNZkZUa092ZXc3R3BUNFVLOU9qdFFLL1pLYlhpWk8xYTVTK2QzMm00WHU0?=
 =?utf-8?B?SVY0NDc0NlFwcTFWSmpTVFl5cWRtWjllR3ZSRnhnVWRqTUkxY24yMDRVRmZ5?=
 =?utf-8?B?S29nZ2JjVnFjeGxaTFpBNXN2eVo2SnpHTHVOQUVUcHprQjRQazR6azk4c2xB?=
 =?utf-8?B?UENBOHpSYUtyVlFRbHdxWE03QnBzT2VIM2FGS2xKREo2d1NTSFkwQ0JBdjJO?=
 =?utf-8?B?eHVqb1R0eXREV2Y4WDU5eU1KNU5ZalFZSHdnaFRlU3piQ0tPQjVmanMwQ1Zy?=
 =?utf-8?B?cXBlMVo3cDl0SkxlcWpDcDJNeHE3bGZhaXV6bWMzL2pnZnV6Z3VLWUptRGxT?=
 =?utf-8?B?WnVvcjhiYk9tZ25SZnR4MmlvaWp5aU1lSVdMNVBDbGpwQmdpV1o5dEtUdWhz?=
 =?utf-8?B?MDdvQzVBenFYeWpCUGkrMGo4Wk9saGlpL0ovWFBLRnpjcnkwVEhNaitnSWlF?=
 =?utf-8?B?OWk4MlAyWE43MXpVWUlrV2YyZEFSczE0cU1XYXFBWk54N3F4TW1ETEJ5S0M2?=
 =?utf-8?B?VGtPM3pBK1dTUzdMN0hibnk4Ry9UTjRkNnJFY016TGxOZW1kSkpEbmlub2ZN?=
 =?utf-8?B?ZjFBSW50eitFazllY3kxakpUeWFscDJKYTN0ZHhucVlzc2ZkelZscWNZVUk5?=
 =?utf-8?B?b1RXSnJJVC9qTVF1c1oydHI1dkFsZHkrSFp3K3BLUGRuV3FtQ2k1Y1BHOWxV?=
 =?utf-8?B?ZmgrMXVYYUFLeWpBNFZ2Y0V3NXVsSmRFODRYYmYrMU5IUmhwOCtjQW15cjlQ?=
 =?utf-8?B?Q3lSZklzRHlTZ0hQSmpjdER5bVR4eUFyWWNEVUJwWkwzUXJQM1Z6bm0zenl0?=
 =?utf-8?B?UVVMZWo5bEdrNm9MMmp4eGJmTFFWaTVHSk5TY2c3YVZoR3haMHZ1WmpsdFcz?=
 =?utf-8?B?OGR1UFpxNW5VVXNTRjRUREpKdVdwZjdEY0ZJbk5xN1I0dGdUT1ZOQmhWVk8w?=
 =?utf-8?B?My9oRnFkcEFpTlZmQi9ER242Z0k3Qlk0OWljRWJvTXdEVzh4ZUJva2pQb3BI?=
 =?utf-8?B?WUVKKzFrNlZsRzlHQVEvYlRWSmk3OFhUVE9rR1JsS0M3bGlMQUZGT2JWNjl5?=
 =?utf-8?B?S3pIVXludE9TeWlZRGpNbTZ6aUtvaHFBMlBBNzZBRjIwYzFWSk83bDRiWWsw?=
 =?utf-8?B?Z3dCOWZxc2IxaWRmb3kzemZMSDBIV2wwMzNEckJGdkFCbjhGQlpvNldHV1U5?=
 =?utf-8?B?ZGdQZWVEcEVyeXZkVkJqS1l6TkVYMktUbUZ0K0pDcEE3RmtwZUs5bVBGK3lY?=
 =?utf-8?B?ZU1kVTk0UUg0cEJqTDhxRXhud2xvTGYyTGVjSXQwSCtyT2p2UmI0d2x3R0Rr?=
 =?utf-8?B?OThCRDYvQkoyMVN3NGJJS3UxZ2hGaktXQU0vaHNWaGNXR24vOE9aY3RLajZC?=
 =?utf-8?B?RVlZejBnK2dFbDFvNjNXQ1c4Y2Rwb2dFSC9UbEEyenJGQ3dNNTJ1aTZpbTVl?=
 =?utf-8?B?eHhpMlVTbENoa21GVGMxT3gwbDlBU1g3MGxPdElQMzBkUXNJckJqTEo0c3ZH?=
 =?utf-8?B?RndPQjJsc2h3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42499481-8188-43fb-a05c-08da07f44926
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:58:20.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+GpWDvwynbOON0JoMqT9KAs8FQXD+BzeAmkpSeHrkFIX/QrjCD1CHW5AYztJhANIBQbVrsRTtxkbqN/Nxs5RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2847
X-OriginatorOrg: citrix.com

On Wed, Mar 16, 2022 at 09:13:15AM +0000, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note: vmx_install_vlapic_mapping doesn't require modifications
> regardless of whether the guest has "Virtualize APIC accesses" enabled
> or not, i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long
> as virtualize_apic_accesses is supported by the CPU.

Have you tested migration of guests with this patch applied?

We need to be careful so that a guest that doesn't have
assisted_x{2}apic set in the config file can be migrated between hosts
that have different support for hardware assisted x{2}APIC
virtualization.

Ie: we need to make sure the selection of arch_x86.assisted_x{2}apic
is only present in the migration stream when explicitly set in the
configuration file.

> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index e0a06ecfe3..46d4de22d1 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -23,6 +23,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
>  
> +    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV)
> +    {
> +        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
> +            config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
> +
> +        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
> +            config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
> +    }
> +
>      return 0;
>  }
>  
> @@ -819,11 +828,26 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>  {
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +
> +    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
> +                             physinfo->cap_assisted_xapic);
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
> +                             physinfo->cap_assisted_x2apic);

Nit: the split lines would better be adjusted to match the
indentation of the first parameter.

libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
                         physinfo->cap_assisted_xapic);

> +    }
> +    else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
> +             !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)) {
> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> +        return ERROR_INVAL;
> +    }
> +
> +    return 0;
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 712456e098..32f3028828 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>  	| X86_MSR_RELAXED
> +	| X86_ASSISTED_XAPIC
> +	| X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig =
>  {
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index b034434f68..d0fcbc8866 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> +  | X86_ASSISTED_XAPIC
> +  | X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig = {
>    emulation_flags: x86_arch_emulation_flags list;
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 7e9c32ad1b..5df8aaa58f 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -239,7 +239,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
>  
>  		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
>  			/* ! x86_arch_misc_flags X86_ none */
> -			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
> +			/* ! XEN_X86_ XEN_X86_ASSISTED_X2APIC max */

In order to simplify adding new options we would generally introduce
a:

#define XEN_X86_MISC_FLAGS_MAX XEN_X86_ASSISTED_X2APIC

In include/public/arch-x86/xen.h so that adding new flags doesn't
require changing the Ocaml code here. This wasn't done before because
there was a single flag.

>  			(VAL_MISC_FLAGS);
>  
>  #undef VAL_MISC_FLAGS
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index 2d1ec18ea3..31eb223309 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -57,6 +57,8 @@ int max_grant_frames = -1;
>  int max_maptrack_frames = -1;
>  int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
>  libxl_domid domid_policy = INVALID_DOMID;
> +int assisted_xapic = -1;
> +int assisted_x2apic = -1;
>  
>  xentoollog_level minmsglevel = minmsglevel_default;
>  
> @@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
>      if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
>          claim_mode = l;
>  
> +    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
> +        assisted_xapic = l;
> +
> +    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
> +        assisted_x2apic = l;
> +
>      xlu_cfg_replace_string (config, "remus.default.netbufscript",
>          &default_remus_netbufscript, 0);
>      xlu_cfg_replace_string (config, "colo.default.proxyscript",
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..528deb3feb 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
>  extern libxl_bitmap global_hvm_affinity_mask;
>  extern libxl_bitmap global_pv_affinity_mask;
>  extern libxl_domid domid_policy;
> +extern int assisted_xapic;
> +extern int assisted_x2apic;
>  
>  enum output_format {
>      OUTPUT_FORMAT_JSON,
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 117fcdcb2b..f118dc7e97 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2761,6 +2761,24 @@ skip_usbdev:
>  
>      xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
>  
> +    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
> +        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
> +        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
> +        else
> +            exit(1);
> +
> +        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
> +        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
> +        else
> +        exit(1);

Indentation seems wrong in the line above.

Thanks, Roger.

