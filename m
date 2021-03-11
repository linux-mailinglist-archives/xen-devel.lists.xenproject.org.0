Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7D3378E8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96675.183167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNvf-0001R7-4H; Thu, 11 Mar 2021 16:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96675.183167; Thu, 11 Mar 2021 16:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNvf-0001Qi-13; Thu, 11 Mar 2021 16:12:51 +0000
Received: by outflank-mailman (input) for mailman id 96675;
 Thu, 11 Mar 2021 16:12:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKNvd-0001Qd-HG
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:12:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd6bff08-de3a-433a-8ca7-c3a77577da9a;
 Thu, 11 Mar 2021 16:12:48 +0000 (UTC)
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
X-Inumbo-ID: fd6bff08-de3a-433a-8ca7-c3a77577da9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615479168;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ok21gEVIFIZ2JeHd1Iju3z6QwQK/hFfdqgD0dXrL0nA=;
  b=QFxBymafUB9Wa9lJO3UCCRaP/KhKEt4ET3WaJ+xav0Dg8KiqJYp8ORnh
   fgdwsCDG7ircWFpDi7FKeE/A63AE4X2HAsu7wqqlujd/V55oiDyUA0cgO
   H6W84HM+gL8X51bgN5/lm21NUt4x4Oc2TDb4foJKpJXMal+CP0vvzoIhn
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NidfVW3n1w35/ExbjR6M+l7fN/iqu1JIhr+C1V3PzjqH59UpR3uDLcUxSxtbAr24HvXXSMJD3r
 rZ+hxnPe/8Bx3Z7n7kvu6Ho15ZlYunnZSjmobld2YpbREIpPSr99GFoD3qzMmK5pQvJWasksq0
 PhOu7uoqa8JMH3F948JXiZCDcN6TZQSq/lW7rq+BzN/iXJ/nT2ZJRLY0ay/ZRV3QrLkCTY+Asa
 hrM5ug1mfGH8O+M0ic9vmxCACXRoIveRQIdbMNqSs6UTAqGXxqF0B9ujOve0IN9Mch0yLEfsse
 xvM=
X-SBRS: 5.2
X-MesageID: 38982238
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0DGx365/v9XvrgrPAAPXwXqEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbDqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH7mGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTYj9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+2OVTat7XbnqhkFQnMiO7xIQnM
 DIs1McOa1ImgzsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VHAzuPFWB1wmk2/rWBKq59ps1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrCk2N9qdzqhHhfkl1gq6tmtUnMvJwyBU0gPt+eEugIm7UxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNS9spcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 r8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbchGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdP3DXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 9DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEU4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9cbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IMSb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQTppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjBNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHEvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7NEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiUue5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EigYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4lQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrS++h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNHHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzKAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU6xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1ZUu1zzh84jIM21SCuSqv45mId+mEunw1PpxrKwYip4GDSAEdcFxbW668mBQVuDg==
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="38982238"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6iZNkkdAPkwZx+EAr22d1YwCSwf3GLhpVBg57rsvJfRzKd3qbT2Vrbv5jT4tkFwti9bGfbogmjp3g/RO+sPScYdKkiBwk5Ov1QjIsF1/5PZsu1qk1s0CIDfMSeJIZ66g2ITww4JWDrSGEsbvYx8cv1OJEq4cVgQxVF99JHFUzqLFCgsnMexHuJzBGomX8wRx5SGJ1nwA6vl7WNAbZ0kBTgS0nZQee5eiBWe02GuCk7NlX9ItQov8adbygjqEw4VcmWTP7Dw6C7ApKINo8QsTZ/R2ezGQTZItETPvFc4oYN74G4tsgZ+BHlO34D5pOfvzrG5scoZeANG8G0o4hydxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1h4eBNBRVg/D53iyzM+NT306xc9zw0gYmxHjMYp8rA=;
 b=kTtvyj+QZAz7z4RSe6kKTVztXwmVsDq+9zsig/NLAW5GubEZtp0YaXMSiODdfrYC4yv/TM+kDiWS2Y7g57CwGuua6PMkS3cKaMz1hHNakZWqpBBA5SLRESBwIQmRsV2T6BNXz0YTLWg4P4yi1WDv8VHIMSe40uxMlCPWDpoR66N/oYYwAKifT6Iqh4gOQ5//hKr6ahKZAvFFPRy1vDQDVOF+ZJc1a8NfzMK8hvFtaMhj7zAOa8t79sltU7DKe64jBy3pOCpVLqjhtQt8yt3qcpfeO/4CNkkq8HOJSb0C91QtK1KiDOGi0f03UoLOLgSb/q+vqzoPMo2L8OjTA9ZHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1h4eBNBRVg/D53iyzM+NT306xc9zw0gYmxHjMYp8rA=;
 b=JOySVwwtfT2/KsnxNa8CfqtEKcK+PE5/Sq2EqUbi+T+SDFX4oQB7JaKyhANigVo3DIk4b1IbQenk40rCUUvM11LawtM+NFEeLDfgFl74HLJy7mCy5ah8kOBIvzerOAOQ7xREzeNcA96es4IXfUelDwI/FZxE+9cIHO764xdRd78=
Date: Thu, 11 Mar 2021 17:12:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] build: detect outdated configure outputs
Message-ID: <YEpBZmz/Dotbe7OD@Air-de-Roger>
References: <20210311114601.42460-1-roger.pau@citrix.com>
 <cb3f5b7d-ad73-2cf7-6171-e4b66ce2e98a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb3f5b7d-ad73-2cf7-6171-e4b66ce2e98a@suse.com>
X-ClientProxiedBy: LNXP265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d038034e-b140-4c1a-7b3c-08d8e4a876a9
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463FB57194AE9A975510E548F909@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQk6U3fNQvtwWPbhhibWkZhGsuKefR8b0y1zcLBhIg3Ta0iO5PB8qdxBbqmG656DJL9SY7OJeIk1s8yuBphlcp94eYPRAfrpcyQsc/DEKaZYQmORLQrOtC7dQD/Q6xgrt48vfQvtQnGXBVLhsKeajxwZGRb1aJIeNjD/nsrnVyhoQNnnCSo61SVG+Yjw0c+oFk1Xfd+cYEP2lUzAz6gnTjSzhQAA6HZd7zjFh/c0NIzwhq1fPdw2QMwuJ4DXX47BG4kFXiYzAvZgFl93T74tTr62zxGhtf56MKS5KC4/nba0Bl2m8BLewrR3/gVoNYcGQOje1grCI0VXA6hqk8/zyMgJMMxziFVkYhWqX7hVMdXc1ytmfKJ3Qh6p6uICoIWneCtmCTZ5ZMe+bFkElaAyvrY1n7WDtHcsfCv1ycFFh7O/Ft1vRDFXvLBkQ0WiKM7oTr53yA/vmVAnkHfGkbSmeU9haKWWJaewP0aVi4AQPvtOqOSa4QuFqHDomWrhfPSTEVXYzmuvgGfkXbSc3yXQqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(316002)(4326008)(53546011)(66476007)(66556008)(8676002)(6916009)(186003)(66946007)(54906003)(16526019)(956004)(83380400001)(8936002)(6486002)(26005)(33716001)(2906002)(478600001)(6496006)(86362001)(9686003)(85182001)(6666004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkVTbG1NQS9ncEZ0TUQ0QlBBcEkyZFlzVkZ0S1ZPTjJTc3pZSzlwR2tFQkR2?=
 =?utf-8?B?WG1palR2WmhuaTJvMmxsZ2RuTDVSVWhsRjZnbStLa0NlRC9RcFdSMHpaN0Yr?=
 =?utf-8?B?MjJZbzlNWXhxclF5U1Y1K3dCbC96WDBDaFhVdGFFbG5heHJqWXVJSkdFb0Zt?=
 =?utf-8?B?SFowRVdWczV5UlFYUVhYQTJXYUpDQ2FTSmhXMzJvMTlXem5qTlZSY05OdTdC?=
 =?utf-8?B?T3RXUmxQalcwMEdKL0JHeDRoREw4MXdST3lrZjhuaTZkbEo0L0ZXUWVPRHpn?=
 =?utf-8?B?WEY4SU1XcVBTSU9jeHVqUFpZOGVwV2dvS21oeDV3Smw0bE5WR3ZKN3Yrc2c4?=
 =?utf-8?B?VHFEWG5NWHd0bG9yeDBqYmFZRDhNOG8xbjQvK2M1U29oYSt4elBDTW1vWFpL?=
 =?utf-8?B?QnkvS0FtQ2VJTDBpb0FZanF3ZTg2OGJLOXdMamZZd2RJczUyVnExcFJJV0l5?=
 =?utf-8?B?QzF3TUlMbkxIT0l2OGp6ZFRmVnJPTEtNRE9FakFvVGpBb1d3dHUxaEd2YUtG?=
 =?utf-8?B?QkJJU2d4Z1NIQVVKUWszWXFHSGtCczNvQkYrUXNwaFVhd3kwdHdCN0M4ejUy?=
 =?utf-8?B?TmpHQ3lBM0w3QmhjY0F2T3NFcXptYUtzbkVZcjBRdUNKMHFKcHkzM2tkMUpx?=
 =?utf-8?B?dHE2Y2UrYW5aNGI2Ymc2RUVOcFVEeEZCUUV2KzFZcEQ2a2U0ZUczZWdiSDRG?=
 =?utf-8?B?Rm00djJWUWE2K0xSY1lIajZZcm52eGlwUXBKcE11T1h0eXkvL0FIZTFBTWZ3?=
 =?utf-8?B?N2pEQ2tvVHlSS2U4Q2Fvb0JKTzExZ1NsV2JiTitYanFqMThLUVoybEtkOE9o?=
 =?utf-8?B?Y25aUVRhSVE1UVp1WlpiUWpEN3pnR1k2d2Q0KzZMS1ZNOGRUdXNyQ2JFR3da?=
 =?utf-8?B?VlRaZEk5VTNMcStDcWl1S0pWWXQwcjN6dURUdC8ybjRzMHpydFJSRTYrY2hE?=
 =?utf-8?B?Smsrb2R1SVhqcnAxVTMzN3dubm5uRnI3dXArdGY5MThVU1d6OW81VmdoTFQ4?=
 =?utf-8?B?SUFWamhTSHVMRlVqY3BjcERhbEwrcHZzUjJFL1l1ckNKcDhnYVVURVBhS3Fp?=
 =?utf-8?B?aksyVmI4U2kvNmZSMnZYSiszTVpvMHdSQzdFbEcvQnhwbllPZ25vTFJ2WGd4?=
 =?utf-8?B?YTJpbklIdFFjTFZWY3lIcVVjZ2UrWjdpcHZOeTl2WFhzUERCSTlzSGc4K0lF?=
 =?utf-8?B?dlUybGYzODl1ZUE5NncxZzVMUzl1NlVBZnAzd3FRR201UVBQVWM0clVNU1dm?=
 =?utf-8?B?YW5XSEpiNGZTTHRRZXJvQkJPVFNIdW1CNHdDT1pNTmVmbVJKYkEydTZDTWlT?=
 =?utf-8?B?NXp5TTNKTE5kOEhKZWlsQk5jenluSHNMRHJhV3NXU3pRdHpuTFpDQWxteExp?=
 =?utf-8?B?N1VpdktkUHFmbWFjWFpPREFTM2ZWV01yalRmMTJNbjV6dnU3d0k4UXFWRFp6?=
 =?utf-8?B?UUh2Lys3Y1FJR0F3Q2tTUEQxR2N5dmU1SGR1bGg4U2c0d3JHMFlBejV6c0la?=
 =?utf-8?B?NFN1S3VFQlFmMEFvYTBjcFAybG9GdUs0T1Nmd1lqdWlab0lXYndQajdnMmwz?=
 =?utf-8?B?cGkzeGMwMi9rRll2dXN2dlBMaXZIcUdFc09pTDZIQlZTc21oNEdCWHVoRjRz?=
 =?utf-8?B?dVgzcDhoWUc4bVJ0ZFAxSnFRQ3owSjNEbVpkbXJuWGRvYWtGUWtGMmptNDRP?=
 =?utf-8?B?WUVZbFBhZTZ0RWZJTkdqdjVWQWNwaVFheTNTRmlmTmpESXJvYXg3QlQ2SitG?=
 =?utf-8?Q?rrLTyzx7urcPBpSKreDkcSX40jI8kehJMQnjnW4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d038034e-b140-4c1a-7b3c-08d8e4a876a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:12:27.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O15NA1NiQFgQI50dEWs3SlXoyytkK8+Lu+iNWq6K2nTEiNCT+/NPMdePaW9IXhQNK2Dj15bB48JczTBMyAAEtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 02:01:53PM +0100, Jan Beulich wrote:
> On 11.03.2021 12:46, Roger Pau Monne wrote:
> > The Xen build system relies on configure to parse some .in files in
> > order to do substitutions based on the data gathered from configure.
> > 
> > The main issue with those substitutions done at the configure level is
> > that make is not able to detect when they go out of date because the
> > .in file has been modified, and hence it's possible to end up in a
> > situation where .in files have been modified but the build is using
> > outdated ones. This is made even worse because the 'clean' targets
> > don't remove the output of the .in parsing, so doing a typical `make
> > clean && make` will still use the old files without complaining.
> > Note that 'clean' not removing the output of the .in transformations
> > is the right behavior, otherwise Xen would require re-executing the
> > configure script after each clean.
> > 
> > Attempt to improve the situation by adding a global rule that spot the
> > outdated files as long as they are properly listed as makefile target
> > prerequisites.
> > 
> > Ultimately those substitutions should be part of the build phase, not
> > the configure one.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > RFC because I'm not sure if there's some better way to handle this.
> > Also I think we would want to make sure all the .in outputs are
> > properly listed as target prerequisites, or else this won't work.
> > 
> > Also not sure whether this will break some other usage of .in files
> > I'm not aware.
> 
> There are a number of such files in the tree which aren't used to
> record configure results. Whether their existence could actually
> case a problem with this approach I can't tell. Would it be
> possible to ...

I think having other .in files in the tree is not a problem with the
target I've added, as it would only apply to files that have an .in
pair and are used as prerequisites.

> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -65,6 +65,10 @@ DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
> >  %.d2: %.d
> >  	sed "s!\(^\| \)$$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@
> >  
> > +# Make sure the configure generated files are up to date
> > +%: %.in
> > +	$(error $@ is outdated, please re-run configure)
> 
> ... make this a static pattern rule for just the file names that
> are actually processed / produced by configure? Of course it
> wouldn't be very nice to have to keep in sync that list and what
> the various configure.ac scripts list in AC_CONFIG_FILES() et al.
> But not listing the targets explicitly would always risk the rule
> to kick in for a file where it's not supposed to apply.

Yes, I think it's going to be a pain to keep the list updated, as it's
part of two different configure.ac files.

From a quick look there are other .in files used in a similar way by
ocaml, so those targets will override the pattern rule (%: %.in) in
some places, for example in tools/ocaml/libs/xl/Makefile. I think this
should be fine.

Thanks, Roger.

