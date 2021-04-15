Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B03609B8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111123.212460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1O8-0004Xe-W8; Thu, 15 Apr 2021 12:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111123.212460; Thu, 15 Apr 2021 12:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1O8-0004XF-Sn; Thu, 15 Apr 2021 12:46:28 +0000
Received: by outflank-mailman (input) for mailman id 111123;
 Thu, 15 Apr 2021 12:46:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX1O7-0004XA-7T
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 12:46:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1619926-a3a7-41b0-a306-6a779a20f591;
 Thu, 15 Apr 2021 12:46:25 +0000 (UTC)
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
X-Inumbo-ID: b1619926-a3a7-41b0-a306-6a779a20f591
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618490785;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TageWBaQNcow6iilb7TjdboFTKCMkZAAfpQa21XZHOc=;
  b=TJKTVRdespWmQ9ZkP6oTRgl2HNHiNhIhaBwtYk5r3zKNOfEzTc8UPIMC
   aLziyoTiJB+Nxar5nQfrv4yzEnmDioFpKF94W4TQMVhsJA3fBCpUZTXlf
   rCEDSzIvj9QEAAtfoXwysN2QdJ1UsiPYuBZAgY+fkAE8LVpmNvO9DxVgp
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l7rovpN1BuNLo/b/wYG0JsZnD2oHJFh3qehThdlOmyrG3oj8gfPmEGZuePIIXZPuR/8xDPsuqb
 r7HQASy/sQyRHnm1SCtebjybc1SKfT2P32JbgSqwmgeSyhZT6WIAtQyVksNAcJ3va8HTdE4chw
 WhLJDcQX3ApQtW4yQqphcJizcxp2cAtK0MPCKqHAwD1MFk0W9zgA4DiE6JsNXucTjwfYZXmz/w
 AJCEfoZEMyfDTXnbTjhSkOFUe2NT7QtFNXZJ4ggoRaPKA55mCTrs1Tiot/6HTfFZbsC/sOMhz8
 uBg=
X-SBRS: 5.2
X-MesageID: 41669514
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tl7qrqzhVN2H16e4C/rpKrPxnO4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2ojehlIxqov9n
 WArhzh6syYwoqG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYBrhJdKaFuFkO0YSSwXYs1O
 LBuhIxe/l0gkmhAl2dhTvI903e3C0163nkoGXo8UfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VbAzuPFWB1wmk2/rWBKq59qs1VlXZYDc7gUlIQD/SpuYeY9NRjn44MqGv
 QGNrC72N9qdzqhHhTkl1gq6tmtUnMvJwyBU0gPt+eEugIm4kxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNSNspcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 v8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbcRGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl++oTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdOHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 5DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEX4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9gbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IISb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQSppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjFNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHAvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7SEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiURe5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EhgYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4mQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrSu+h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNGHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzWAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU+xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1YUu1zzh84jIM21SCuSqv45mId+mEung1PpxrKwYip4GDSAEdcFxbW668mBAVuDg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41669514"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eme6SZsiIYGdX83lgqIgG9edYmv3oQKhRVF1mjtWzUnokdy3VqhLI25gCv6AVZxVyUqKWYwtxkEobUu2rY97o7j3UeEw4yT1qPzjGYxioqTMiXJ9MGVbKM238oS+hw9yKNzgFsA5hDhkmJmi12xBRhDXF7Y/niY71GIIF3uLlVqR6QwKaGd2Bq4aQfETX3fNIZD9JjZvj321AcqdISYScIWu2OzBZpe+3z6tOnh9ndewawOiYAH3uFAEoo+UKL6XQfGU87Y72lm03iuopxelCxeOwY4WmarNkshLFVl15ZOPWL/dotALV8iHLeO3tp/bRvcc3NVYvR5lzXQJv3dexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HVj338G8RxlxPsXCf5ua0ZvTgrAv3ErtyYYEVOinVA=;
 b=N4rNg0snP5+3zwPgNceC59LhyMcnDESRgvdJK49yxYpFN8XrA4jc/yQyAMQbb3THiKMiYc8l0xtPmPCnNKOzxo1UGFYR6m4OIjYCyi5oLJt1sSW483dacNgl+ngrloQVWVH+EZ4vhCV1q0LXmU5EXO6KBIklamvhdFqbi1+wgIaPwwPAwGuxm9+QhElBPmZL+lloowTKzTzPxqJFe8mMxQeRhaTGV9vuMVv/rC4vMieghiFPlPiuSxkhwyMsTD4O5FeClIF6ljwlh2xIQE42tjaZat/wKsCkm7wGusHvomSf9/xyih06t3UwWqabhSLpucwl23mkM9llsAg6Rb0Jpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HVj338G8RxlxPsXCf5ua0ZvTgrAv3ErtyYYEVOinVA=;
 b=kERtZ1m80rgBLlf6S2REL6XqYvP7kI6B6hA08nZN8TdKf5nkJOHXp3Kwhy74htCGTvSJRWgzmMu6iMzbcgSehGZUI7zpGRNJJ8RIJRVUa6/bZlhoez3FqTFt1CKO47s/q6pz5/gAuz5ZvI1S1x3n+R5lQqm5OfApkpgX/u1TSdE=
Date: Thu, 15 Apr 2021 14:46:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 01/23] lib: move muldiv64()
Message-ID: <YHg1l8DIMymj8PmF@Air-de-Roger>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <d798d6c4-fbbd-966d-df22-42a22ed6b260@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d798d6c4-fbbd-966d-df22-42a22ed6b260@suse.com>
X-ClientProxiedBy: AM6P192CA0106.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::47) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fb792fc-725c-407e-71a5-08d9000c77ec
X-MS-TrafficTypeDiagnostic: DM5PR03MB2779:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB277937E0C37EE25FCA411E2B8F4D9@DM5PR03MB2779.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rH7DV68tsRWk1m1alI+JWkANBl0aRFlsCG4EPN+CKfJGtuFGP2EeTrdEUkPjXN6r8wqKeSPfCtEx9vyTbX+6i2Dx6hqDbAe2WBEjhK59hWvaCzXTyk2hexs2U3SNzMMimHXvKDx9a/YRnzKYtvMTkRTBfkWLEY8hOzxq1NWpuGrixwIaEptAOQq8HJLbjaPF8Z+aijZ7kV0oRwZf2cnm49vQPlnrNC6Lj+nIfjHoLXaPV8XxfeDSfI03O20C1u5ZOheDY3zNQfeZg64BvOnFLApAf9ApUVKZdDTJwlmdfkgXzWmcdRVa2CFHCIZ7wiaVtJLEvCA1/4y0twC/NrzvkcU5Dsq9X2oj97SI1AT23xCApFfhtrlX6TyTDYs06S9vq52QY+WoTgX4hNhDDyUQyKrZgBaoqcvLwKr6QJ0YC8EWDIsjuwgKAjqOQrlHZL3f2976fAh6bsX794RQkQ+U9onhWS1MllhV6mO82Nv3384HvpARRdeFCvPlFNgtXdHUzOCjDPEFnyovW8PxEgn6MNPc3jgIxMdkTpG0RMpZ3i2c1wRldLPdxAz9cu4dOZ4JxcAUwPpYR7TlD3dTdJUxF+Qb2LumCm8lEjqcr4epZlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(6496006)(16526019)(2906002)(66946007)(478600001)(956004)(66556008)(66476007)(4326008)(33716001)(6916009)(316002)(38100700002)(8676002)(6486002)(4744005)(26005)(54906003)(6666004)(8936002)(85182001)(9686003)(5660300002)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEgvbk55NFRPYzFoakJZUUhEWHpGcDc1WDlXTVZIUXZoZXRDRk8vaklXME1j?=
 =?utf-8?B?YTQzZmYxNVFUOTRDNzFaUVkrWHdsdDZzMmc4dmc2ZWJhNWM0RU5XS1g5cDdu?=
 =?utf-8?B?cVB3dGhHZG1ISFNSbFNCQnNaTnlINlhXMTh2aHhuZWNIczNYQitPbmFtZStV?=
 =?utf-8?B?S2h1VTBER01vWE9ydmkzSU5xOWY4dEZLMTlRdFZaUkVZTFRJY011V3RYbVlk?=
 =?utf-8?B?cEw5TUNNYzd3S3EwN1NvMGkzQ05VbkJScVJqa0ZJQjZXeVJvNjVCc0gwQlNX?=
 =?utf-8?B?UURGei9tK3pFNUdqai9Xang2YmtjOVpoRFFPZ2FlcEIwZWJwNWZxNHdEV2Qy?=
 =?utf-8?B?d2xOMHpBYWk2QWVoS0JDVm9EUjA2ekRSdEZPYVV3SSs2UUZ1YzlmZXhLdE00?=
 =?utf-8?B?TnRTa1B3RUQ3ang4UXdLMTJLMUZWUVBZZDI1Q3RnZ3o0U2hJcnJKL2VoWGVv?=
 =?utf-8?B?Mm1oVDQramc3MjRIbCtDMDBNSXBPU2VZZXNxL214YmhvVEczSFhTRnRvYjZD?=
 =?utf-8?B?b2JvWXllNE5DZnQ1WHpjMmVHTUJmRFMxTERzWmNUd1Q5cXpWOFozL0xucERz?=
 =?utf-8?B?anZXWTZRN2lUT3dHMGNmWlg4OWhTSlc5TVpQZEdENjRZZVFCZCs1TlAwcGM5?=
 =?utf-8?B?bnJVMERjY3g0bjhrOXFzWjM2c0dlQzJxM0x4SDh6VHFGZGZMZ2htTy9KV21B?=
 =?utf-8?B?TG5DeUhKV1BSTGNlRDU3cUo3VXBqRmkxT1hKR3gvM3NmN0NiWHhhYy9RK3FW?=
 =?utf-8?B?QmlEcVo4R05hU0l1WUQvcDZhNE1Ed2QxemNGUXdEaWJGSDFyUk1QUm55dkF3?=
 =?utf-8?B?MlliNUhWdUF1eGRJODI1Z0pCWlFKZEFwV2dzWHhhS3FwZFJXQVdsNFUwL0hJ?=
 =?utf-8?B?eGhmK0F0THA3QkRjVkVZT3I3NlVmbzV5K1RaaDNTeE1iL01DQjRtenQyTzZC?=
 =?utf-8?B?ZU5QcjFMRDVNUGUvZGxQaTUzYlJDbmgwZHpKcWJJVXdoSFBGWHllaWUvSU9Y?=
 =?utf-8?B?QlQ3VzZQY2RjcG51d2xVY2hVOFJtNmRQOEdUMGdmaFVrbDJOSU10MWp5MHd4?=
 =?utf-8?B?T0pGV1czdWdKTXc1bVhCaWdPd3FQT3ZieVpnc1pkQVJoNTd0blIybnNzbHk3?=
 =?utf-8?B?bHVzWm1SMVpRaWs2VUoxckVyRlVXdmdVSTRNeTFTYUdSdW1Ta3BBU0VONDQx?=
 =?utf-8?B?N3lXU2RVLzhYOWdGRi95ZEk1RGU0UWpaMVI0bmpDeEVUdXRSeWFTZm5ncnlS?=
 =?utf-8?B?c0FySktwQitsSldvdXR1bmx2N0JxTjJoWkZzY2FNdWQzWkpmUmtaWGNucEZH?=
 =?utf-8?B?TnhiYzlIeWEvazkycnlMcFlwMjRXdU9mYXYrclI2eUNZSXpWUWRTTzFKeXBZ?=
 =?utf-8?B?a212NmtHRUJuNGprZDNkZG9QTUhseDE3T2RLN293c3FvVUo5MTdUdWZiZWc4?=
 =?utf-8?B?dzBjYllMWjFteTAzSmNKdUpMUmszMlJMck1QRUpNUHpxQXl5czBYZkFtcXRM?=
 =?utf-8?B?R0tza2JiM1J0WkZRM2pVMTkxbnhGNjJyd2k5bFQ3UXB6NzUraUc2dWs1aGFz?=
 =?utf-8?B?UXBaNlZHV3JpM1d2bDNxS1ZvaXl0NU1SOXFYUHM1UkM4THBoVDU5bCtxblhm?=
 =?utf-8?B?ektPbjVRT2FTMDIydUp6TmVUNkl6T0dCbGlPQUJvUVdWQ1VReDdwNVVCU25M?=
 =?utf-8?B?a3doVDhHK0UxSWhJRE5nblRQNjFyVmg2R1Rqa1ZmdVgybmRpVjMxMkdwNG5t?=
 =?utf-8?B?SU9QV1ZFZ2EyT2ozdzBqdllWOWJFU0l2aXRENnhHTVVLMDBQSTlWQm01cHNn?=
 =?utf-8?B?ekswMVdZZGxQOUFFZi94dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb792fc-725c-407e-71a5-08d9000c77ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:46:20.2183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4xWf7quuO85kIBK9qiSeLQOiKPR72c0C11Mms9BXaIPZ9Q2fzQi8E1yCkUfKZTnrgVkou48sr5tTHl3uyaQxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2779
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 12:19:16PM +0200, Jan Beulich wrote:
> Make this a separate archive member under lib/. While doing so, don't
> move latently broken x86 assembly though: Fix the constraints, such
> that properly extending inputs to 64-bit won't just be a side effect of
> needing to copy registers, and such that we won't fail to clobber %rdx.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The x86 part LGTM:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

