Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73D48D650
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 12:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257075.441533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xxW-0002Hv-0a; Thu, 13 Jan 2022 11:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257075.441533; Thu, 13 Jan 2022 11:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xxV-0002G7-Te; Thu, 13 Jan 2022 11:07:57 +0000
Received: by outflank-mailman (input) for mailman id 257075;
 Thu, 13 Jan 2022 11:07:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7xxT-0002G1-QR
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 11:07:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d60c86b-7461-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 12:07:54 +0100 (CET)
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
X-Inumbo-ID: 0d60c86b-7461-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642072074;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X/gATFF0mxwJbXvu0+tu9zVH4or1oNvEWCihW7SAI90=;
  b=Dzne2z76p1/CQWujPTHyUQVBLMXFmvq+d25oUe9Ka3uANpHNt08zpOK0
   Roh2bqV5c+F4g7czrqoS3KMW/4FtlCyyRuioTt9Mr9Hh+AU7qa8S1GxNb
   tuyUITGD5w9hqfd6RMqmNeaV3po7r8G31aWCoDMUlZOT7ngRrBZ8Q4Nz5
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 07QUmfTdsLd1Msb0K2yoqJQM4A90yYW6Ctmruu8j85G2JI+RItLrouE3ZoeK2HGn+U81/iH8h0
 e5/wMMbzPtUKOBOzqUhe4W1HuT5EE5yKAJTKHvXXaQ7z54FLB9Q8IvXoe1LPgTViF2Kg7yhh/I
 lgXEITkjqPayeTPQ+BF19/GCBRlY6sYUN9ZcjPw71b0EWiy39ke/CJneTWPRpBKomJavSlUxMa
 6e8+u67d7z8uQ0RRye6SxXb8TW0KuYqtpeb9Z6borZdl3WzJM8mfeLcYchcBggsYAu11GioGxE
 TCweBXXiAMnL6qHBykZa8gC/
X-SBRS: 5.2
X-MesageID: 61911443
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DE/bcKKIymNGPKePFE+REZMlxSXFcZb7ZxGr2PjKsXjdYENShTwDn
 WEYUWjVM6vfZGD2et11OYm08R4GuZ7cxtM1QQtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us6wLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2szu9L2
 Y9q6KaVclgMJ5H0tcM+TShhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvI4BhWts3aiiG97wb
 u8/WwtBSy+ZYhBIYEUTGrACzMqn0yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19nEyVu
 2bH9GTRGQwBOZqUzj/t2lu2muLKqgbqV4sTGaOQ++ZjhRuYwWl7IBoSWFigqP+1kHm3Xd5FN
 lcU8Sojq6s13EGzR9y7VBq9yFaetx4BX5xLEus16CmE0K+S6AGcbkAOQyRdctUguIkzTCYzy
 16St9rzAHpkt7j9YXCA8raZqxuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr7wVgdRRj/3j1V/CijOo4JPOS2Yd+ALTWW606xJjU4SsbYeo9Fvz4O5JKcCSSVzpl
 H8AlsuF5eYCF6aRhTeNS+UAGrKuz/udOTiaillqd7E67Cik8XOneYFW4Rl9KV1vP8JCfiXmC
 HI/oisIusUVZiHzK/YqPcThUKzG0JQMC/zAB8/uf4BpP6JUT1Ci5R1WSGmzwVHUxR1Efb4EB
 b+XdsOlDHA/AKthzSarS+p17YLH1hzS1kuIG8mlkk3PPa62ISfMFOxbaAfmgvURsfvcyDg55
 eqzICdjJ/93dOTlKhfa/ocIRbzhBShqXMumwyC7mwPqH+aHJI3DI6OAqV/CU9Y890iwqgsu1
 ivtMqO/4ACu7UAr0S3QNhhehErHBP6TV04TMy02JkqP0HM+e4up56p3X8JpIeN/rbc7k6IkF
 KNtlyC87hJnEGSvF9M1N8iVkWCfXE7z2VLm09SNPVDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 lFT/lizfHb3fCw7VJy+QKv2lzuZ5CFB8MovARegCoQNKS3Erdg7QwSs36RfC5xddn3+Ks6yi
 lz+7eEw/7ed+ufYMbDh2Mi5kmteO7AvQRoBQTiKtObe2Ouz1jPL/LKsmd2gJFj1fGj15L+jd
 aNSyfT9O+cAh1FEr8x3FLMD8E70z4KHS2Zywls2EXPVQU6sD788cHCK0dMW7v9Gx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577bA09cCAaB1X5GJ7xvPYJ7n
 ep44JwK6xaygwYBO8qdinwG7HyFK3ENCv11tpwTDILxpBAsz1VOPc7VBiPsucndYNRQKEg6Z
 DSTgfOa1bhbw0PDdVs1FGTMgrUB1chf5kgSwQZbdVqTm9fDivsm5zFr8Gw6HlZP0xFK8+NvI
 Ww3ZUd7ErqDomVzj89ZUmHyRwwYXE+F+lb8wkcinXHCSxX6TXTEKWAwNLrf/E0d9G4ALDFX8
 KvBlTTgWDfuOsrwwjEzSQhurPm6FY598QjLmcaGGcWZHsZlPWq50/H2PWdY+QH6Bc4RhVHco
 bg49el9XqT3KCoMrvBpEIKdz7kRFEiJKWEqrSuNJ0/V8bUwoA2P5AU=
IronPort-HdrOrdr: A9a23:13/p9K+0f0KdhbZLWGBuk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICOgqTMyftWzd1ldAQ7sSj7cKrweQfhEWs9QtqJ
 uIEJIOduEYb2IK9PoSiTPQe71LoKjlzEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0l9
 gsBJ4Y4Y2mfvVmHJ6VO91xMvdfKla9Ny4kY1jiaGgOKsk8SgDwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="61911443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVrGyAYFFbpZEr/5Msz7KdyT4wTyrsD/Yyw9ACguFcLRuyiGiJFxsV1E23ef3h6tOITkN4UrLYCYG9luG+TBUxqi4t+hAWG06L8i+q5NJReULksfXjCloG1UJ91k3BuxJmPwdOpHpdFbYer7prPpWKKWzZkralkOqkkHEz9104jUWidz/Ix65dkNQqqzfR4DHy1QeyMBwhyeIYOThYYuASZ9f59ZcHVTPQCPNHIdFhVrEjia9T92+T1JTcLJZLS2ylMqHZnYFyCiWdoA2kLOtQLl7/AWWiJZ3krtsZ0qoBY/tNx/v8gEyPbHklPvqCdFpnbxJ2wa1EPRBVVrHlOsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1yNNwIwmMWP3+tHErDzAhMer3BJs/x1kY4H2U8IKvc=;
 b=OOFKpUPYYbjRzw2kauGYNYqgNH7Ps/equnrVqMONmC1duHX4vXayRDHfvHtgcACLKsxaQKnOwCTkQCJzBM36X5I2sEx7WJFNJkMTE0eP2EvftlsUTEwf/SwX4quxwhHh7+5FE2pRCWC5ow8LZGI0Q9KmXhzuX4NDVHCjLBfZ1vgEpjfswrVreb4yD0WIl+YoAlIxxiZ34md0rxgZvwgMvrpdS3F0ldM6GtWrv1LPc7iAICHSKRLG8rv+qusM7M9k+qtL8YGLPybPz19N6G+IFwJK9st7ju7DLyWiuY3ryD8KB3EEQbR7ymQ8TaBtC4Ng3+SwzQXhMQKOkGu0wU8tKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1yNNwIwmMWP3+tHErDzAhMer3BJs/x1kY4H2U8IKvc=;
 b=YDtJF0VFrJJ/CWmfbx0fERNTuH1yDrhtLU5lFyg7BKi+shFLlFNNsMoFUHDIQelZdmyqkGayJOU+CrN47rH983gBMJ6qYCGDiAk5feJZvDOm8efsP2q7cbqc+CZJIuhzS1cL/IhuVf++G1MfUuAMYuzZLYQGBbU/VLC8o++VNZ8=
Date: Thu, 13 Jan 2022 12:07:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 10/14] vpci/header: reset the command register when
 adding devices
Message-ID: <YeAH+h1ngDwze2+c@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-11-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-11-andr2000@gmail.com>
X-ClientProxiedBy: MR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0459cbd3-1b6c-41bf-4d47-08d9d684ec0f
X-MS-TrafficTypeDiagnostic: BN7PR03MB3764:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3764916F8B850E848A803EB18F539@BN7PR03MB3764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKmSH4NDmpiHSiW9ErUrtG/Hc/ZFsnPR9wIHYqxxUPiGT4SJRJn1pbXu4i7t0QtSaax32rEso4aI1Vxr5jGUqOHQ+2dItyyUcoElFquZuQwxOvWKkWPgvO2pFicD8tZOYSHld3XC8o9Wy09+8jET/0Qhl+EDuuaZyYY8lHBMh8s45al19ySlSLYVzHrbV1cDez4FP18wlZL3Jqgqi/ptoMND1B7MgpvGUtON28hXbGdr1zQHCTSrlPUOcTmxiiMJCgrxwEGoDk9d4Q4TcnDe2QUAbR7+VErc8pPNoVwBOx4o/OcccPC6tLFAYlxKbkJs3n14d036aWAug46xmAL763wsVEMn0ceY6k12NSKDJFCj/zho4ey3PwdQBXrFWg08YP7N1AKa2q7t9JjfJQfjWTsUPKs31zY4mqQhepjJbkTll8pwxrFkxa629+EPFdY2zHq+P8sVijzTurLSeqxrdHaASJ7KOZgd9SysV6fabBYnrwTYJOJzahwB3H/YKGd6QEiIjkQBHe1XY0n+JWSPT+eGYoKQtQjpI8cUIEwms21STUjiHmT7qbo3b40yOXqfjtzixNcSi7AXRv0DIV8TREjircN5h/CINEnP+mhqeAO3aQj/bAggutvzAh+GZ55Uc3C5vzDIqt8VvOOu3ve/IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66556008)(66946007)(6506007)(316002)(66476007)(6486002)(33716001)(8676002)(6666004)(8936002)(6916009)(26005)(2906002)(508600001)(186003)(6512007)(9686003)(86362001)(7416002)(82960400001)(83380400001)(38100700002)(4326008)(85182001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDRrVENGYWtoaVJ0cVpuWTF1RDBIQjR6ZWVmd0cyYU5DWWZQek8yVCs0cnRN?=
 =?utf-8?B?WWx6cExUYTIyWTJaaTl3aUs1Q3BsMFV5Zlo3c0FheGdJWW1XSVNJN01lSzJK?=
 =?utf-8?B?WWRLK1U5OUpYZFpKNDNKZS9SMGo2dDFnbWtzendTWHZaRm1JbG4rOWJLZW54?=
 =?utf-8?B?Rjk2NG9IVWlPclRieGlabEx5bm9vVExzZTgzbzlUeHJUeXRrWm90ZDBPYVE4?=
 =?utf-8?B?UjZoS0Fycll2Q2UyRXRodnAzSmIyMUtHVnJuVmd1ODdvZzhhTEUrWFVYM2Yw?=
 =?utf-8?B?TzB1WEw3RlhFYmNaOWlVOW4xQlJ0RGwrWGtKUTFJNSswN1VHVC92aWU2STkv?=
 =?utf-8?B?NzVOY2ZzTzlnaEJNMVVaSVprRHlyRzRLdy82MENRNGZ3cllWSldQeVE0R2RU?=
 =?utf-8?B?VXRreEhxVjVUcjB6SkZ6c0VGYkhDYjhGZTk0SjZTWnFRUUNudWh0cnFKQjF2?=
 =?utf-8?B?eGRxUVNmWklaanhHOTZPTWpwTEdoOXBrVWlUQjg3V0NHV2YzZElTWEFYSXRS?=
 =?utf-8?B?TTFid0JNaUlJaC9DamdVSHFRTFBxdk9QWWRTLysxWlE3SURwbklmQ1NuUmd2?=
 =?utf-8?B?ZGlFWGg1Um5KbWdDbnI4SXRqbW96ZTNOMXA5WGc5OU9FZlRIOFRLbmFrU1Rs?=
 =?utf-8?B?ZG51YVYrUVNpSG55L2FmdHBKc1VYT1pydFhWVGdoejlNRnJUS3I0eUZJV1JH?=
 =?utf-8?B?RXhwY0hsTE1JRDY5REFwZG94ckFDNmF3TnBJUUx1bEZ1WXF0WXRrRGwyRWsy?=
 =?utf-8?B?czMyem1mZVo1Q0xmaVVZbkJVWFV1UVgrZ2xCZkNjOXJPbGwzRGxZRFAwbW1i?=
 =?utf-8?B?dkl2OEhTYUFDeVpqUkRPSHhiU3FRZE91aEU5SFlIanlQRTNmUHU2QmZDTFhL?=
 =?utf-8?B?bkpKNVk3Z0lCVWx5WUUrbUh4K1U4ckZUa1V1ZDM2RkszYWVHWUVjTm4vT04z?=
 =?utf-8?B?TnArMXVuWjBQcGtqM1NXMkMzLzduK0tnNktMSlEyc0d5dXp0Zjc3bFJyWlFF?=
 =?utf-8?B?dTRrNlNGaWl0amMzWDExNk9qVUJlWEZYVVdWT1hvd21IdVllYmhJV2Z2Rlha?=
 =?utf-8?B?bFNvekVqcWVNOEdrcDNPWE5kOWxJMmtZaTNLcDRhd21LYXBxUUE5eWJyU0JD?=
 =?utf-8?B?b0hMdzR3Si9TQTZRSjgvZlBycnRLK1hKTm5lQ3ltaTFmTTkvdS95dzg1Vmpz?=
 =?utf-8?B?VTV3SVFESHdydDJKNnovY0FjNjFPZ2pkcm14SHU5OXJTSlNuWHFLcFZBSE0v?=
 =?utf-8?B?Z0tERXk3Q1Q4ZDlpdWp3V0JwR25MMmVXU0NRWTgzdHdVb3VvRFBGRTBsYkhR?=
 =?utf-8?B?R2dUWVNSaGNiOFRsYW4wTHdPQVMyamJPR3dTRGxOUjk3K3dkOFJqWHdaVTRi?=
 =?utf-8?B?YnRCSk05TldNK1ZIY0svcGVJVFcrR3djWTlaa0xPUGZocjNtVjFmRnpYbXFw?=
 =?utf-8?B?VTE3SFl6SEtONmNjZVExTHhiaXBRUm9tdUJuUUxjV3BYL2RyMWJDVkExMVI0?=
 =?utf-8?B?bUw0OTRHeUlJVW1BYW1iSlNsVEJEajVmZThvUW9RRkJ3Z2REQWFYSDF4aGpP?=
 =?utf-8?B?b3VRdlM4czh6dmJrTEk0RDFsZkZJWGtOQTFJZ0tDanJOeVRjTjAzUWZqK3ZF?=
 =?utf-8?B?ckFGQ2FLWVVBWU1rWmpWQi96R0o0YVdEY2x0ZDhtTjZybHFVZmxzaEhIS3Rr?=
 =?utf-8?B?VTUwbzRyaDZCWmlwSnRhM3BsKzRPTlJacUpTSlIzLy80V0tUaUdRSEp6Y2hM?=
 =?utf-8?B?b0tlMjV4em02SE82MGpMaC9EYlRMVXhqa28rRlVBMEpSMkZYaEgvb3hUWWJM?=
 =?utf-8?B?clMycEhHeTlJNjZHWW9WTGtCb0pCZ2ZpamdtUkprSnh2M3M5bFZ4YndmaTJV?=
 =?utf-8?B?MDBEeldHZitEOFh4UkNhWDIzWklrQ3RiSHB5NDE2V3JTRENrOFlFamRxMnda?=
 =?utf-8?B?NklycFdySk41K0ZKN3FIS0ZIbllST1ZIZEpGSXlHU1VyakxwSDV0Z0poT1o3?=
 =?utf-8?B?anFpYmxZcmxRT3VBTGZxMXRqdVV2aEFkTlVMSWRaSk45RXJrU2kwNStzekgz?=
 =?utf-8?B?LzE4emQ3bXNRamp6QjhhTEZCTUJIZjBmVzFTVUJPdEVBbUt1Q2QrME5IaEpx?=
 =?utf-8?B?OGNpV1QvWWdXNHU5QVZYaHFYc1lnSWhKeGtaTXY1bDFsRm05MmN3WTg1M1ZH?=
 =?utf-8?Q?+vUqOK+X+BXGlGe7RWV1JBc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0459cbd3-1b6c-41bf-4d47-08d9d684ec0f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 11:07:43.7069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4WUMBddpGQDp7SxMm9+y9ZcZhn59eAAuW6RDHLQPTDjP/YFb8koqrA6djJM9hV2mkS4ttVIVbAiPwXSx2jm/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3764
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:47PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reset the command register when passing through a PCI device:
> it is possible that when passing through a PCI device its memory
> decoding bits in the command register are already set. Thus, a
> guest OS may not write to the command register to update memory
> decoding, so guest mappings (guest's view of the BARs) are
> left not updated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v1:
>  - do not write 0 to the command register, but respect host settings.

There's not much respect of host setting here, are you are basically
writing 0 except for the INTX_DISABLE which will be set if MSI(X) is
enabled.

I wonder whether you really need this anyway. I would expect that a
device that's being assigned to a guest has just been reset globally,
so there should be no need to reset the command register explicitly.

Thanks, Roger.

