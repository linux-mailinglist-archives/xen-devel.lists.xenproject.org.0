Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797448E8D2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 12:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257589.442728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8KNQ-00051b-OK; Fri, 14 Jan 2022 11:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257589.442728; Fri, 14 Jan 2022 11:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8KNQ-0004zh-Ju; Fri, 14 Jan 2022 11:04:12 +0000
Received: by outflank-mailman (input) for mailman id 257589;
 Fri, 14 Jan 2022 11:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vmv=R6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n8KNO-0004zb-6b
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 11:04:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b07e63af-7529-11ec-a115-11989b9578b4;
 Fri, 14 Jan 2022 12:04:08 +0100 (CET)
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
X-Inumbo-ID: b07e63af-7529-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642158248;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Bder9iuJV0gZGiqOWm6tIsVqrHfjhmz7PjxUr33W43Q=;
  b=Blyy7PsrJBZnRc2ureiiTqEfKsHbGC1qXwZy+SZQrzBjiCFzXE2jZjF0
   OBt2775Mi73r45etR6+6JZ/UI7Ac8cDqlwaC1ldoc3vwLVBqtK8cQyrvN
   ERhL3vBko1PPPIFYSYZ1Z0G8O2TQRfoR7PBGN7scM2PbOBwwNtms0/Vx4
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DT2odk/Hy2YPAAVP+BD4yB4VPbSmZG4hxAdLkJ8EzAVQ4Ow3DcIq/KU9YcDZ7ejlCU+0PS0fXH
 7ZbtIsVWNvn+CRmqh5Q9solDRb8nXAR/Dl+dnfBo2IsNsKYNCpMDmhAtAr/KY+82sRI+3wpwuq
 yZhj2HYZ6Se/TZyuh3d4KBZMePxJEPGU+XZ3rZX+MwHa4eWXYw/FktyY68MVngEikyKy6N8fGb
 mvYgpRX/pPfPGlSOWIGeauaejOYuWGxPon0loAq35eCulF0Ez4qXD/0WIjvyv3cXuLOFu2/vex
 Yws/m/MpUzEDc0E+Q5Q4UYND
X-SBRS: 5.2
X-MesageID: 62406495
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mwviRqD0neYr0xVW/8/kw5YqxClBgxIJ4kV8jS/XYbTApG53hTwBz
 zEeWm+EPP6OYGb3ctF0aoW1pBlXsJ/QnINhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940E47wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rDmDsPlWl
 9x2lpGWGV4pPerXmdQEXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+WvYEEjWpYasZmIMzaS
 OwGeAhTRy/jej0MOWsIMZgdtbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSob8hImkeTp
 krd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHaUxeXiVnbtyU/VvwASu05rxqM+rPbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL/dlr5i8jWOqPB0JcYjfdPTjri
 w6HoyEl71n4pZ5ajv7rlbwrbt/Fm3QocuLXzlmGNo5GxlkgDGJAW2BOwQKLhRqnBNzIJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q271qi/+JdoKumsWyKJV3iAsI2+Bj
 Kj741I52XOuFCHyMf8fj3yZVqzGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrGbt1+eJ1l0gWmDOCLbimnk/P+efPOxaopUItbQHmghYRtv3U+W04M
 r93aqO39vmoeLavPXmMr99CdABiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:WMvA46sTUilefKIbkZNioPds7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,288,1635220800"; 
   d="scan'208";a="62406495"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7fmZOakfzOryZEjWUfiE4EI0rWBIZ0+gO/FiFtPajdvdrDXLidRYHlGt0CSeUFgVXZC5BnfSnY6IKOsiRC4cKmWOTj2gUroTUaCpVlbb/+jqb5vfyBrYosyreB1unYCSru36byzz+UsXw+6veVTfDy1WRyQQYs7V74fb1zt3uaPx2j5qwUIlT6GVDpkECZA0TviEZNdS1jjpYaZakaB8HJqW07rr6UoB3BASSf2ZD2csjB8M2GVBhERNxbX2bV5NyQ6JY1ugzC4WP7FNNCvt+s4qb90kFFlf1wwW2BVtUrIxhJgsuOz3B8hF2EbHKs4URFoKmNbAuriSxGdEhqATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vX4s1XTaRd3vZWE16I9OSw7I+ezIlLa+hzLe3Lseh8k=;
 b=DJg1g0YZDZRqvNtwrSTuJTbpES3BK9L90pC+38nmxCiqtroy6D6w3xEJaD7b9mbJN7qU/PQm8/U5caaAMvp+L2DQzOp94ualHeFcp3Qo9sW0dia5Z1BJ8XRtqpp2xZ6mX/7qTSalhIkSQMenp6gdvbP2oqRsUXTzRt1BbYWCa8cEkakjfKgOhalAdsjk+1xXTD2sGV6DeByixMInbL83wePOJM4INnoSqnpip2pNaSl1T1NdXNIyoMtP3fRZM4/hbQBQsMcjTb5X0AaOnlOw7Wfu6+8NSec0mPsNE06dhpgOywIjMiF26jJxFCVGrIDqMZgi4PFLGgQiY5QvxEmrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vX4s1XTaRd3vZWE16I9OSw7I+ezIlLa+hzLe3Lseh8k=;
 b=qocHt1zGJ1AZ3qZCij0Op92V0K3P4VF9vtDuoNm99Y1txQrAbXsNb7cR4rXJB7ofDEI3h4VuKoecHq3hIgCrDKq6iCWrUGHJOnP5wNjqk2FLYNQyq74E3mYUgwHisFIjfYPy3UZeQ2Jh6Ud2jagxxNDTttiqiIH32ocFyhy8Go8=
Date: Fri, 14 Jan 2022 12:03:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/msr: Split MSR_SPEC_CTRL handling
Message-ID: <YeFYnauq0hkwv5+a@Air-de-Roger>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220113163833.3831-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5d1b6b5-f470-4953-8c3d-08d9d74d92a8
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB552541144B5AF45815D24EC78F549@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83Qxf3I2ccHkXxxNuL1P1506Z3XkIa4jFgLKNBrqs9CbYGmjtdP4MK/4OYTIc9lPDhO0EIzMGWNBEdCU/TlHmeTzi03S9NtfFbScCz9ixE+PCKvoURyOStTALhwyf+VE9jVl+NYAKPmIoKtRYpCxDptjmZounQBcU81N0psu1+Vj1c6hLUYtHhdhaNj/rv747V/LaXfffJh35YU5y0iWfRSyG2sB1PeJ3v5sUe8/XP/QuD+kmxFkJuLBts+m02rGAN8w+L9/p0nkZ07aGsYhOigx5VskkORY4t9NHDa0n0/KbW/bHc8Ep39jIPhB6P5fJyeSwnKlY2PCC3MYxItnWvfv+5DWb+c3I7rpHIkBdSKBmV1PjzqTjcHpAN5MBf9+ayDZmtMpTa8su9mURLcDi34CgbM+QEYQHsF+0jYWPX83vShqlffzN93bwcWk47xkn/ZChb1ZuZxZDeDbV+XJ+4Zl+CO8A2KuNZ7ep+eK/vR8r6wMZy5HT24F3FtsKWOEHmqs5BYGzOJ6HiSTgZGx+gu+ULD6PusiZpSQj8eLGE9fY3oTx05DVPjE5eiCdenxDKc8xaBJ3OOvy0ATccllehvSULUxs5H3rz5z6gfhwSbLXPB5engtWbAXPRLjSj4eiReq2/lhWMvhlK4UxQhJMXC6mM/HLTTvXy/uq4Gc7uYz+giYj3wzcE8vShkb7CJN7awRL1y9v1BuK7RC+DJG9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6636002)(6486002)(5660300002)(6862004)(66476007)(33716001)(66556008)(66946007)(4326008)(4744005)(6666004)(508600001)(38100700002)(83380400001)(82960400001)(8676002)(186003)(6506007)(54906003)(316002)(8936002)(26005)(9686003)(6512007)(86362001)(2906002)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJNOHlTdWxvbXNCMUwrcURLYllUd1JRMytsaHdnaThjY0hBWW4rdzZFUFBI?=
 =?utf-8?B?ZXBZU29vQTZkcVVhYU1LYWRwTU1WN2RRWmFwTVQ1L2FNOFpzRFFCK1JIWFRH?=
 =?utf-8?B?aXZlYXZlKzludEVrRmc3R1FtMzJDdGFTWGNTcnBMS1AvcmVubTEyZVcwTTVh?=
 =?utf-8?B?ejhnUEtNOGM2RjFaUnNzbmRuSnl4eThiVWNqa1ZyM1hiOWVFd1FMT0RCZU5o?=
 =?utf-8?B?RGhFZWI3Y0h6SWZ1YXVtUGJQUkJNaHdrVExWMEZDQkU0VVd0VmpnOWNXN1dX?=
 =?utf-8?B?NTJQcUUweVlvREpaK1hQSlN2dG8rRkJ5MGM4TnFHT3E5RFoxUFU5bGYwd1Vx?=
 =?utf-8?B?ZG5tYmJQWUljMzhzL1NCQnBOQndPaGxmV2lTSllXSDNQc3F1UTNBWldNa1Ey?=
 =?utf-8?B?MUt3M1ZWTVE4ay9OMjQ4a0hHbWY5VlVmV04vSVhFYkhVV2pabW0vK1RIVjBP?=
 =?utf-8?B?UEcxSUo5ZTVXb0ExMEZOOXp1a3h4MktDUS85c1hlQWhLK0VmWU92TFVML052?=
 =?utf-8?B?ZUdoLy9VbEJCNlR3MlVxVkNIbGQycDZ2QlRscCtvdDdkemxDREEwL0thV2xS?=
 =?utf-8?B?L2V4YURIdUVpbG5weGtVd1BBa0RhWU1TYUhqZFpUWEZOMDZEZk5tRE9JVVdm?=
 =?utf-8?B?eWFEbGpFSTlvZmtneXI2eGR5QVNzdEVoT0Y5QVFqWjZUMU00eGlKTEhUbXVF?=
 =?utf-8?B?RVc2QTd4NW83TUNScVN6OXhGbHp4VE0rVFNqWmNwWTJPNk1pUHcyeGRoUlhu?=
 =?utf-8?B?QnZIU0ZyV1VpMjFrcXV5Ym9lOUhFcVBrSzY2MDE2ejhMT1FHekpSUjRyZ1B0?=
 =?utf-8?B?ZS9Id0g5aTN3WFFMSG95SStGRXEwVmJqem10OCtLMjgvZkNCa1NZSWxDSVV3?=
 =?utf-8?B?OWdzc1pZQjFIQkp3QkY3UHF2ak5BbWFNbzVUYmZVL0RvOEZKQ0NRZmdMOEZm?=
 =?utf-8?B?NklrNWMwZENxZjM5R2ZGWDM4RnZQWU5PMUJDTW0zRTEwcUVCK0Q2b3hMVllY?=
 =?utf-8?B?NzhUSEdDbS9weTVtdnMwV0tYZC8rVWliQ29HQnFWOGFuWnQyY2FzTHdNTk9p?=
 =?utf-8?B?ekFkd0l3M3FQTnFhQmVtd0V4WGU0ZHJnVmYwU2c0YlBRMHVKS1hyQ1hJWWVo?=
 =?utf-8?B?cFJxaDJEanNEUEIwTWp1b0dBSTZSUkpaZFp6ZEZoZHZsUW9kZFJzdEd0cG1T?=
 =?utf-8?B?ajA4WWg2WXppQzhRRUFGT2xGT0RsNmtVMUpNRmYrOTluekVjMnk4NjBGbVBR?=
 =?utf-8?B?cmR2VXFYYlNHeFpUNGE3bEhyeTRTMzlCWUM3dFpsbU96VC9DcldBOEtpVFdt?=
 =?utf-8?B?NXdmSUVqVDNObGVhaFVhMEdZWHdNTzRTc3Bwc1RiYkhOY2MxYjdTWnQ3T2o3?=
 =?utf-8?B?UkNUaG5QbU1rRldIckpLaVBCUzhsWXhJb2VWZ1JmeXNJZm03aEh4cHNIY0FV?=
 =?utf-8?B?RkZVU3VNQm91dHVnVWF6bFArbGJnSmcydjVJT3VHWXBsVTcxVlcwZnZJbDhR?=
 =?utf-8?B?VkVKZjNTMzAwZEhZemRTL0V5TUtCeHhWTWVGSWxEQ1VUZXp0VEY1MVBDR1l4?=
 =?utf-8?B?OG9HRUFEcFRTeWd3WHN2RlRta2lDQWZ3S1pDM2tmRUEycFdXYUpnZGd6am1a?=
 =?utf-8?B?amt3ZUExTUkwTExjM2JTS3RjL2tPRXBuSXRjSGxubU04Tm41elFhVGx2Tmt4?=
 =?utf-8?B?OWlJenIvRGZuSWdzc0p3T1g5UXN0S2NoaVg2MlBRNGFUOWxPT1lJWU9NdVFu?=
 =?utf-8?B?RlI2RjI5QWtLbFJPdCtjamxGTFF4NG9jRHF1cTBzRk44L3gzUzZTVzNyTGNZ?=
 =?utf-8?B?VXk4ZWI1b2RnYWZxOUFoZ2J0eEQrWUtOSUhqOEh2Qld3eGNxSUpjOFJwTVRH?=
 =?utf-8?B?elMxWTlaZWN0Q0xRU2JNVGQyK3p4dEU0dXJBdVhtc3MvU1BiK3owd3NFWDF4?=
 =?utf-8?B?L2tENjIrVjVRL29KbXp3VnlnWjdhcGJBdDlUMkpRbmRodGJEKzhSbi9BRENp?=
 =?utf-8?B?N1R3bVZ5N3llRGZmeXdWYXdYVzVYYWJ2OWhFeC9ibFpQOVlzd1B6VUpSUnQr?=
 =?utf-8?B?YVFma01maEVpUEMyN1djeW5jZkh1L3hJYjd2VWxiM1VOYzAvN2ZGc0lDZENw?=
 =?utf-8?B?bVJCVVdKbjl1dzlMSzhDRm9IS09mUzJXRjB5eVhxYitmNnhqRjhKcTMyUTZW?=
 =?utf-8?Q?5UuqjX7IN9BT7tcfsJuwr4U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d1b6b5-f470-4953-8c3d-08d9d74d92a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 11:04:02.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKAz1bu6GervYCjvR5imbMjjPRgazdub3ANH4qvLCwPoLECkKYWF9YtZ/tXscdYoE3/ixNdKUQ7qOerckc2SbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 04:38:31PM +0000, Andrew Cooper wrote:
> In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, there will need
> to be three different access methods for where the guest's value lives.
> However, it would be better not to duplicate the #GP checking logic.
> 
> guest_{rd,wr}msr() are always called first in the PV and HVM MSR paths, so we
> can repurpose X86EMUL_UNHANDLEABLE slightly for this.  This is going to be a
> common pattern for other MSRs too in the future.
> 
> Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
> The SVM path is currently unreachable because of the CPUID policy.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

It feels a bit weird to have the checks separated from the actual
access to the MSR data, but that's likely better than to replicate the
checks in both the PV and HVM vendor paths.

Thanks, Roger.

