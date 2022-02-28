Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7C4C70F2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 16:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280673.478703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOiGn-0003l8-EK; Mon, 28 Feb 2022 15:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280673.478703; Mon, 28 Feb 2022 15:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOiGn-0003jH-Ah; Mon, 28 Feb 2022 15:49:05 +0000
Received: by outflank-mailman (input) for mailman id 280673;
 Mon, 28 Feb 2022 15:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nOiGm-0003jB-3T
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 15:49:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f29ddffe-98ad-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 16:49:02 +0100 (CET)
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
X-Inumbo-ID: f29ddffe-98ad-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646063342;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SLTMeNAyWp1pOQMj8ghkab6pelZ8+PTmJ+vAsKFTlAY=;
  b=if4JAMK6v0G7iSEQWpoPf48jBkisCFmqY9qNwCXwk5CyisllTtReOBQf
   XehiWwvkhx8g8ggndrOwBXC0o25qvshOPoQtk+2bEqBGz7jqfSNbiZDmN
   JCB0kDUoINKaBwEi94JAuklUBk2SyvgPAQOVsWTMMzMf4esx/L1s+wCv6
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65138085
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xA9L36meb9v9dK0vAEbJRjDo5gx9JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfX2mBaPzcZzf1Kdp2PYy/9U8AvJ+EzdVmHlY/qSk9QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWVPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYT1gDGb3moOQmcyZFORNSfv1oobnHGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uHP
 JpBOWcHgBLoaEBqPWwOC8IHm6S11lb8Kxty9W+kuv9ii4TU5FMoi+W8WDbPQfSGTNtYtlyVr
 WXH+yL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDcN75WBGppW+eiTQVUdFQDu4S5RmEz+zf5APxLncAZi5MbpohrsBebT4g2
 0KNntjpLSdyq7DTQnWYnp+WsDezNC49PWIEIygeQmMt4db5p5oopgnSVdslG6mw5uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRqq+bLuXiQN5j73YX+P3C86NKD8YYyRvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4vWkmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjasSsUrHONk1Hs3DaJ144wLuBJx+U3YE
 c3GGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLFepUYATXN7xntPPsTODpH
 zB3bZbiJ/J3CrCWX8Uq2dRLcQBiwYYTX/gaVPC7hsbce1E7SQnN+tfawK87epwNokimvrygw
 51JYWcBkACXrSSecW2iMyk/AJuyDccXhS9qZkQEYAf3s0XPlK7ytc/zgbNsJuJ5nAGipNYpJ
 8Q4lzKoWaweGmyaoG1GNfEQbuVKLXyWuO5HBAL8CBAXdJ98XQ3ZvNjiewrk7i4VCSSr88A5p
 tWdOsnzGvLvmywK4B7qVc+S
IronPort-HdrOrdr: A9a23:A+YQDKAdi/peyb3lHehIsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUbqFh/dL5kUUtDPpZ1fSKWMB2FffueChPbHbzYfJt3T04l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65138085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXHGh6HxSsCD+kvjqQwo2ZTDx5Mgo07X7xS6qZtGMaP5BWH84Sw0+2tZ+Yukvqs6xbPPzgyy74u0PDO3spqf5Bo9riXltcdFdjpCH//PjLN0rg9s4/9WPT44pVdxbVntJW1mocoShn/LRo+mb8LKBpK4vVMzF+k8maNVX9yhph0NH5kwBa6jIt1n/bWrSh8Ehkyya8L4PFsgzDBSafFmumvAI6g8dGRVB6bE6Fp4UkkrXVzSAHIwzaCK7Eywvh9ScyKoDGIL/A8KR1Sci6TP4xs81kYpGTqTZiR+WiGbyhLrMJINVGUvbYOffl97HV3gYNpZphzVBxxLABJ+FuLioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EviJzek/VgaKIwmpYv68rb/xedmx7IJgHzq/Efl13DY=;
 b=YmkTuqsoxQbkfO4A2QoDwjAGY0F8yTAl6Wuscn0rf/wz+V/6nb6WLB4rNeMtpPURoBEm1JkKqDm1jtWUWFoP+85qKAxWKdV6sR/7+LbEePbFY2XtmRIxVmlFfqt0ndZ5zWpimuUpVO+x/IIvz3XQ+gk6HMDJ7XFlhXt5aJS0ofrbra7m0NW+WH9bTUMBVTvijZYRcH35rQI+WcFPL8JtBBZ/YeBhfeRm/8stAx+vyowymiMvhqD52paGkGe1ySbvEnrQ2Gx/SBKBy1ZMssOMhFelo22sTIxXgjThdQvzC6KbwlIf1tH89Cnxk6Pa0yEOvtBpWdw7iYJbJ9y9OaYE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EviJzek/VgaKIwmpYv68rb/xedmx7IJgHzq/Efl13DY=;
 b=HUmGdgK2gRg5mf3cOGIL1PJuKCllSHBhNZUmZdqWJVdPMhJsqFLZ6KyoYzHboYAXMH2sgDMQlNk9GwcQYjqUNb3O535UGyMFVMkLsspm4QTv7KACTYDbN3etK3uYN79OR1h3wFGXGTof7iKnqK7uBm5RQq2jU0+LTGfEiPP36IM=
Date: Mon, 28 Feb 2022 16:48:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yhzu4Nl2dY80KXss@Air-de-Roger>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
 <Yhyv6Ui4ap1wOeNd@Air-de-Roger>
 <7ad79609-bd67-aa44-56e0-1070f3ee88f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ad79609-bd67-aa44-56e0-1070f3ee88f7@suse.com>
X-ClientProxiedBy: MR2P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94eda04-2200-48cd-df79-08d9fad1d2dc
X-MS-TrafficTypeDiagnostic: BN7PR03MB4402:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB4402691BA4FAB9B2D55DEF0C8F019@BN7PR03MB4402.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBdUH22/2vyknuhFCOwIdQ82lgLrTKOKVSDxcqIrNPIsrpclLs4r0QC+QYVVuvcV2EbK86xaQE5NDHW7mCVTVBFGSGoHWvfkMLhp+J+rNXcL9tPaidC12XgM1lAZRKxHE2XzfbAKhlm8XLBS5Ml71vRR3uoC+XKYd4CA3T6HJ57b2vKadvp7EYHOtxKyO2rtaF2GYKOfVrYo82nHcA9ToVg7W7n3F9kNFftcDaoBbzPIdbjfeQEp8OnasBysUVF0H8oLBLmBA5fsNFcJubL0yDuHoMQGuiG2glVvyg3sYOjBxth9G+8QnqfxGOv2mktfuMahpYXoum9ToqPuaZVu8AIlAXOrMgoXM6wsQeZ9XcW6lgSYVFFEYrxgHNj1Hzqg4jOskYdApTBQgObxrYyPRzblyRS88+4DdSVGLX4xGHcRfp7DGeqbqzZcwt99TBOZw40SsJzCZxTzlAjNeHjJIUhyq7avvRfJsIIlpZqWCc+m+P9Oczobz1YlXAjIvkmyoHYXy9g4Tk/WbFSmKUPxAVCyh6ppUnrWN0GQv6RR6sEHVza8p1aJyiinGwb9MDGzAx0P34ujrHL84jY48EC3cPqdhZA5vRz5Ym3BtSVbbB1zzGUnBrF+L/quKFMqHGuAqQ0FfVdkIf9rX4+3l9Nlyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(83380400001)(9686003)(6506007)(6512007)(6666004)(53546011)(508600001)(6486002)(54906003)(6916009)(33716001)(8676002)(66946007)(66556008)(66476007)(4326008)(8936002)(5660300002)(2906002)(82960400001)(316002)(85182001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmhTRnNKa1BQd1lSR3VLSlJPZjBzRitZUDk0MktEbkxQY3hFcnpxNmZHREFQ?=
 =?utf-8?B?cWlKVy9BWjcxekZyOHAvVGVTenROdXRlWHE3QUR3dzdheU1hM0lHRGozUnpM?=
 =?utf-8?B?RllQYy9hUWU5Sjl0dVZiYTdZVGNPRWRIMGZqWlI2dEwrY0ZPb09ZN2pFcXNT?=
 =?utf-8?B?cXhCcWw5U1orWldmdXJOTkx5cExWdDZZRWFjRzk1NTFqZklDWVJtci9PaHFj?=
 =?utf-8?B?UVkwNVRid3NJWEU4RTlDOE5vNlpBcmorQmZodDRFUUMrWExtelFmREhGMys1?=
 =?utf-8?B?ZHdJK21hQ0FkWURINDhNK2tPaUF4Nk5JN3owc245eVBlR2FZd1FQNmhNT2tn?=
 =?utf-8?B?SjdjWGloK0VxbTk1S3hlemtxMTRPczY0aVNoN1RaLy9SNGVuMW8yYU5ycFlr?=
 =?utf-8?B?R3g5YUJrelYwSkFyRFloZHcrVzlBNlpJZXc0dk9DQjY0cEJpMVF6SGV6KzZJ?=
 =?utf-8?B?STZIditNS1Fsa1krR292ZmRsWUR5MlhMUThhbjhzRjIwemhPZzdQYW9LK3E2?=
 =?utf-8?B?bmtaU3RvNGlEVnJiSm50NzJxNkowSUpEZUN6dzhlN3JpeUJuelBmNnU0aCs0?=
 =?utf-8?B?NFFFYW5CUlJ6N013b3NZc2dEN242T281YUdGeU5QaHMxMmVRdGRTbFNScjFG?=
 =?utf-8?B?NWF1VXRJYUtPYVdsNXE4WXd2czRIZllyL0REOCtLQ0I4WmU2VlJ6VGNWSzk2?=
 =?utf-8?B?SVd5T2UvWHlwZTV5T1E0T3dsdENsc1NPZERDNlRtUEdmd0N5N2ZCSEc1MHI0?=
 =?utf-8?B?S1FOWUdPSmVKMmxoaTJDVkF1cUIzZmQwUnNsQ25EMmhWbWJZU281QkdOZWgz?=
 =?utf-8?B?NG5aLzdGVHZxSVFZdjNvUGhsUXJsNzJFQkw0bGpaUHhVbm00ckpOSVlyYXkr?=
 =?utf-8?B?VG9NSU5KeGpVWTZCUThmelMzM0dHeVh1WWtzTEJPK0xOSjl6QW44MnlXNEtF?=
 =?utf-8?B?aEkxMzNVbENQd2NIMGJmQXV1cjR6NVoyaTAzWW5yWnFYN28zL05kb0VwZGpS?=
 =?utf-8?B?WkVFLzNlZ3prTnFSOElWa3QwRkxUUG8vb1J6SVJlNDhON3JIREk0ZEVvY1E3?=
 =?utf-8?B?alNNdElkR3drUU5jU0pMNFZMemhxT1cwVy9qQnRONVdJOG50M2xPalY2VEU5?=
 =?utf-8?B?SVFja2RNdGpmdEticytxWlU2RmZBTnFjUWEzTWZYSUdBREpkVHFhZWdpcCs0?=
 =?utf-8?B?enhGRWlVM09SRWdRUzJSQ0UxcXl4RVZuSU5wcnRaa1p3UU9tL0xZYWNtdFR0?=
 =?utf-8?B?SkMvbmFsRzhGTmhPcVJ0ZGtySzlRQ2h6VXdCbjhiMC9iV1h6MWt4NkM1K2Vo?=
 =?utf-8?B?ZS9jZzJPaDBjdHhqTk16Q0JKeUVtSXdRU3NraWpSMWY3M1ZvNmovdGRPb2ox?=
 =?utf-8?B?am5NQjQ4SFQyVEppUXdYdG15cE96Z2REaTBiUzRVN1VUaHNNc0FWUTVRb2Rl?=
 =?utf-8?B?ODFmdDlIdHN3WGdvaUx2WTYyL3lZeUxLUFlaVXBoR0ZyRkx5M1JoMWFGVENO?=
 =?utf-8?B?bEh6MERjS2tmVGpJVlRFU2tMb3FlUWZ6RHB6ZWdWZU10ZzJ1VHlWVGtMWXpD?=
 =?utf-8?B?NGt5UHRRS1lGbmQ4WVg1ZjQ1dS9pUXRjRlJ6RURXVFBoN1ZxNjNNV2xDTUFO?=
 =?utf-8?B?NnNQUEZCUUZuMHlxcmZJWFpQV1VKUWRweiswTVJ5dlBQOUViTzR0bC9nMVYr?=
 =?utf-8?B?TVpmSVlUZ2RmbEtBOURHQVJNL2Z5S21SMndjYlFsVzlvbldVWmJOQkpjQ3c4?=
 =?utf-8?B?aGdaZWE5bzFxTFRmMVFWc2c2b0N4UWpwSUNsNzFYajZKaFhkR2N3bGovMVY0?=
 =?utf-8?B?OFFXRCtvY20xaW5RaXFiWTVvWFBRR3IxVWF1RFVDOC9UVkVKSmFNaFpyNy83?=
 =?utf-8?B?MjJYemRpMkxUTzJoRmtkYjBmYUlJTE9BSmp6K1JLdnJtdjVpQjlvSHJ0S2dX?=
 =?utf-8?B?SFhvOTFGT2h5azdOdmV1a1Zvb3NKYmo1WFJRV0xpd3hjdEo5WUpVRUx6QmlL?=
 =?utf-8?B?aTB6bFVCZmFoVWJRdVhiN1hLZ2lnWnlJbUJqb3dWYXpCT1dLbmxTVTl0UUlL?=
 =?utf-8?B?SDRkZC9uZURZNDUyWmtha2pKRHNlTEhCVFhTTThWcDJzN2E5Tk9hZGYzRDQ3?=
 =?utf-8?B?SXV6UEhydDFmbnpzeDJPY3liUG9YYVZCbDJPWm0yaUhhN2xQbm5vN1RiQVE3?=
 =?utf-8?Q?O2jcMhUDtbqXK22qQwma3QY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e94eda04-2200-48cd-df79-08d9fad1d2dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:48:54.3854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faD1g1MDkTAtHofmOaorcPk+rnNF4jKOHNwkdcuFvT2FU9C+NMxkzwBsCLjEaLIy6CWbZGcVkn6aUD/s5fJfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4402
X-OriginatorOrg: citrix.com

On Mon, Feb 28, 2022 at 02:14:26PM +0100, Jan Beulich wrote:
> On 28.02.2022 12:20, Roger Pau Monné wrote:
> > On Thu, Feb 24, 2022 at 03:16:08PM +0100, Jan Beulich wrote:
> >> On 18.02.2022 18:29, Jane Malalane wrote:
> >>> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >>> @@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
> >>>  
> >>>  void vmx_vlapic_msr_changed(struct vcpu *v)
> >>>  {
> >>> -    int virtualize_x2apic_mode;
> >>> +    bool virtualize_x2apic_mode;
> >>>      struct vlapic *vlapic = vcpu_vlapic(v);
> >>>      unsigned int msr;
> >>>  
> >>>      virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
> >>>                                  cpu_has_vmx_virtual_intr_delivery) &&
> >>> -                               cpu_has_vmx_virtualize_x2apic_mode );
> >>> +                               v->domain->arch.hvm.assisted_x2apic );
> >>
> >> Following from my comment on patch 1, I'd expect this to become a simple
> >> assignment of v->domain->arch.hvm.assisted_x2apic (at which point the
> >> local variable could go away), just like ...
> > 
> > I think we want to keep assisted_x{2}apic mapped to
> > SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES and
> > SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE respectively, so that in the
> > future we could add further controls for
> > SECONDARY_EXEC_APIC_REGISTER_VIRT and interrupt delivery.
> 
> If we want to be able to control more (most?) VMX sub-features, it
> would seem to me as if this would better be modeled accordingly
> right away. At that point there would likely need to be VMX and SVM
> specific controls rather than general HVM ones.

I would have to check the AMD interface for hardware APIC
virtualization support, I'm not sure how different the control values
are there.

> Plus then it might
> make sense to match bit assignments in our interface with that in
> the VT-x spec.

That could work for things in secondary_exec_control, but posted
interrupts are controlled in pin based exec control, so we would need
to expose two different fields? Not sure it's worth the extra effort
to match bit positions with the spec (or maybe I'm not understanding
this correctly).

Are you suggesting a (VMX) generic interface where the hypervisor
exposes the raw vmx_secondary_exec_control and possibly
vmx_pin_based_exec_control and let the toolstack play with it, setting
in the VMCS what it gets back from the toolstack?

That would imply quite a rework of the code in order to detect enabled
features based on domain specific VMX fields (instead of using the
global vmx_{secondary,pin_based}_exec_control variables)

Thanks, Roger.

