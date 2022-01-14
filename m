Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B048E955
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 12:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257594.442738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Kya-0000sU-Rv; Fri, 14 Jan 2022 11:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257594.442738; Fri, 14 Jan 2022 11:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Kya-0000pk-Oj; Fri, 14 Jan 2022 11:42:36 +0000
Received: by outflank-mailman (input) for mailman id 257594;
 Fri, 14 Jan 2022 11:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vmv=R6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n8KyZ-0000pe-Ov
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 11:42:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e6f13a3-752f-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 12:42:32 +0100 (CET)
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
X-Inumbo-ID: 0e6f13a3-752f-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642160552;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FJfpoZ+6gDpDYZBKFk6zO6tUDyNl8oOgYMJz2Q1q4mA=;
  b=GBMyC0Mk2qHYdF1F2SmMWRBtci/RyCkpnYvqndYLzLYIG/7fPC5EWosT
   ZzOi9qEYX8g0oN+UzE8YM1VhLuMLsFiy/kJh9pq8yKnE6BQxezDGfz4q+
   uxgyGghKP0Wsh5nBVcWW+zhKeaUa+N0IryXK3p1kUd8bbW+JoBTeE0SGD
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FaA+GzfW5mCS8DJ2s/y+pXlPY9YcqQgXejYyAEr8J7x160Lt9HOdU1AQPdixitrwwCuzPUqVAk
 If/pSE+4z3APwi5qqUJO6nAq4ZDRC1VnqBg858UWtNqMdFHbSeSstQaCIh7qoR824+ANIl1xmT
 XHYxhrXiO10PIJl8qWMCyudiWpB8/H5NKU7AtYUJbqJcH+YXmDlw51vyHWdITNHQ+lV5lGJ6Tf
 OKguDxOwmaZLguXFnQOUCq1p+UxDryTfeuRFiM4RyN1Jc9COBXEZcWSe4NpTAepXQkux/HZKzZ
 AN1vb5CxgRjjc3MW/1Ki9/Sx
X-SBRS: 5.2
X-MesageID: 62003464
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1V/U/60uDZZumRHZ1/bD5Ud2kn2cJEfYwER7XKvMYLTBsI5bpzICx
 mRJX2qFPf3ZZWvzfIxxYYnjoBwF7Z6Ay4BhGVZopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrJh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhlsFM9
 dAVh5uLGCgCP6bJs+1MDzsAKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4UAhGxs2Jwm8fD2N
 uw0SiI2RSX8bQRXfWoaFLlgm7n5mSyqG9FfgA3M/vdmi4TJ9yRzzb6rNtPWc96LQMx9n0CEq
 2aA9GP8ajkZOcKez3yZ83uqru7JgS7/HokVEdWQ6fpCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHuayodHfFxLCv/ByZOCMQBmZTOQ1cdF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7ZYVUwYnY1RvHNEghBHVb5Lei8BxkkdS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyONosfP8ArLlXdlM2LWaJ29zq9+KTLuftuU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313DbOiCgGKr997BQ1afBATWMGtw+QKJ7HrH+aTMDx7YxMn6el/K9UNcmU8vrqgw
 0xRrWcDmQWv3iOWeFzaAp2hAZu2NatCQbsAFXVEFX6j2mQ5YJbp66EadpAteqIg+vAlxvlxJ
 8Tpse3ZahiWYjiYqTkbc7fnq4luKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSlQwFtvSZdKu00i14SoXltVtUhaaOdJUYkjtrtRncnSjkv8tLsgQAhzf3T/Gh
 R2OCBIVqLCV8Y84+dXEn46eqIKtH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsT6thyCbdmy6469uDDnb4Cw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZlzSOv/Q4JEL2uH1+8LadCBgAOhCNjGpWLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q5sMAHYvmqgs30VUTM5XTBxj/7IyLd9gRYFIhJ
 SWZhfaairlRrqYYn6HfyZQZMTJhuKkz
IronPort-HdrOrdr: A9a23:3KfMRq8m7Qqcvvhbn4luk+FHdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPhSQRI+Lp3+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+memsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lodFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNyN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wuJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB2nhkjizypSKeGXLzYO9k/seDlGhiXV6UkYoJlB9TpZ+CRF9U1wsK7USPF/lp
 L52+pT5fZzp/QtHNFA7dE6MLyK41z2MGLx2V2pUCba/YE8SjrwQs3Mkf4IDN/DQu198HJ1ou
 WGbG9l
X-IronPort-AV: E=Sophos;i="5.88,288,1635220800"; 
   d="scan'208";a="62003464"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmhLWc17c2RObNfY5966wKbF38ckEXj82BQiPiXrUBjrpAEbuyhRRPj3KmvO4lZFS780Bhcp2B/bMbuI2C1iQd1bZTnIcjaDV0V17wvX1CT1UxvB9eq1DMgSqdVGLAP+Y1wda2As1p4JEAJBhKt7phJ06fDImA0j9QN8lNGSR5kKhsqU8PiRIo/z7dZdH1Ey4W8zfbtjcGQhKhFVeV8evrjJXWhUDK0Qu5b//c2qmsDL8X0vP1w8MqvS+RAjN2aCxlboMhcYSJaPIfGAhsKEUg0B9RXwMLpDn5IgfOCNsPnnKsYDSUVFN3B0dj9osBNmQat9lBSIz/0a+Em0+epasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYfUpilo4bKhulzJpESt5zmPDnxBogKMWjnH9flX1Os=;
 b=hbDZuBrRpxhAgxtX98jMjB3qXcrCeG54YchSd6Rnu7XJr4MtBPa47CfjTZUUx09joQGomQcsfLl7uV1VVr1+fba1P4nrS/wp6XRbLBhb3NztkWwtIBDR82QIP9RYk+gWKCHXrRnWCuYgDK6y3iCaQR9hRDQ8feuZYMgU2SXb1BrJHtA3yUSekQOt1PvVboHr6SmlqQgIVL+hEGlsLnlUZX/x6hLcCH85INOf8FGYYucN8H4FI2qgy+59AwQqRdkX109J7GCIiBbUOGOdBQXqEYCWg07ThiopBXTENGsBTTY+xuRcD6f5sS1C6ndNhgFtTF9/Rf0yKAszQRG4JLGVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYfUpilo4bKhulzJpESt5zmPDnxBogKMWjnH9flX1Os=;
 b=SAFz5an1shIkcMDOR4vLeSf4cKINxNIur2Ut51XhYn8tbjt82mdT+N16QbdCDnfvqVRcS+uVY6coz5v4uhQ5T+0NobVZLpPCD++RTUI3fnqMF3kZYYdU4pNwxzAR7TRSuVTRvKI75JbGYfFapmCzkyjMcicluInJpfRzEbWyuEE=
Date: Fri, 14 Jan 2022 12:42:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 2/3] x86/spec-ctrl: Drop
 SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
Message-ID: <YeFhmM0deHmdYOEW@Air-de-Roger>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220113163833.3831-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MRXP264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b62dfda-9b30-4623-dd9c-08d9d752ed3b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4378:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB437890B8EA3A705C8ADF13F68F549@DM6PR03MB4378.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UWFTlArM2ihMosVu8V+3osFW6iN6hymlaZ8/jHsrcBowG41cm01xWoHXGOamj3eQ4trwJc64fpbdfTjOautlDf2UnTav1m1BNiU2asBTRQqsSQiqK+x/fqV1wHEeP6cZf0nyENa4EdrIuzaCoKPHOvdTpzlh6eDnyvzTiJOhQ8EF/WA46wPAndB6OaovOPn2DCU4s6tTRNs+Hy71SmQAbVPbcUax0TUhIJFqV1etrUoWemQQNvVhGKXqJbCBW4Qmo7NOQsK5li5qhgXPTwp9qfuwy3n+T9NH0ATkILEM+S/lObmcd9yMigk0DmYmRywZ+26fZyl8ZJjbjqouz26PZSkTNZBa9E/E6ifvK36s1zRfrVvkyXk9hIxbH21FmoetX4htrhvhfcAVdEi1hC6V28iSfQRo5h0KXiSPfeSiRexBrcJYtyZVXG5LQ62qb4VFVpeUO4aZ9m65dETT6bcNu+OLvL20ygrQ5AWLze71yF09piTYXvVmEyOqUR5HH7Dy6X4TIUWySNBaSQgDiDs8n8/GD8NPKbLaGfbUuFXBBoCHmMV+YNKmodKsGjoQTOI5Zs5gqyS9k1y5mpHJUDI6/TnjyUcUpQ/z7eEeRZzuWuHe/1dkr13ubp1LJeHrDFN5vu6MFL4EX30z7ubI4z6bHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(85182001)(2906002)(186003)(4326008)(86362001)(26005)(6862004)(82960400001)(4744005)(8676002)(6666004)(66476007)(54906003)(8936002)(33716001)(38100700002)(6636002)(66946007)(6506007)(508600001)(6486002)(6512007)(5660300002)(66556008)(316002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzF5bXVTMlJuSFpzNkhydm5pOUh5Yk1peUprTC9TRzNndDNOYUNiZHV0WTN0?=
 =?utf-8?B?djFzbkpJZ09yeUpEK3pyUExCTTJSMVFONHR5NHR0Qk9Mb1MwY0FVcVEwTXFy?=
 =?utf-8?B?a2FhaDV3RGx0R1N4K3BOMmZrZ1F6SDUyejhibTAwdGdnVDl0UXEvNmdQaHA1?=
 =?utf-8?B?YmFoTUxEQWw5RVNORVZkV3AvdE5iSEQ4MVZtODdFVU1lYVByb3laMGR3VVhS?=
 =?utf-8?B?dVE1em5hdFVpYnAyM0Q2ZTlyN2RWYzJJYmVIYWVrZUZjdHl6T2x5Y1lJVjA0?=
 =?utf-8?B?eEFFWUJLR2FacEpXT2FRZmh2THZvZjd3cERKTjJuZ25XeUlZUUxrZ1JLTGta?=
 =?utf-8?B?MHpwUE9nZnI0OWlIQ2w2SDRKM2lmU1FQNTdMNys2K3hKSVBNZU1qQXliUlZv?=
 =?utf-8?B?TFhXNnhoY2lpVjloWUlDbWxsNE5mRVpkNERyNU1DREdpSmlicFMrMDkwVUo5?=
 =?utf-8?B?K1BuQWRHaXVUczZQZGJLU1NPU2JWeHBtTXZJRk1ic1lqeUh0dVl4S1BtQlpy?=
 =?utf-8?B?aHZvRmRPVWNUUmw3ZnBNNEtGQ1JkY0EvRTdGUlFuSDZaK0FzS0dybzVjcnpJ?=
 =?utf-8?B?ZEx2emtVaURDM0wybzBramt3b05LM3JIUDBpY1VPTlBKblE3TG5lRjBrRmVQ?=
 =?utf-8?B?Q0J0MjZMMEtScm5SQjBTc3BVNmV4aFc5SlVPbzJHSjBFQiszZXdyUytaeEts?=
 =?utf-8?B?Nnpha1NwYmV0TmpqR0ZaUU15Y2h6WEVGNmg0bCtNV3F5Uk93OENYK2pFN2Qy?=
 =?utf-8?B?cThQcC9BZENvUUorTG05dUtPWExJMDI2d0hNdmVNcWh3QkNwdnExdEtvcnVO?=
 =?utf-8?B?Z3QrYmJvQzhUSkx0dTZGRFgrdjYycVorKzBWbW1VaHVyeXd1eEdMOGE0Z1NL?=
 =?utf-8?B?ZGFYc3NVTHJUWGx5MTRCYStGNHVib1lRNEozRTJGYTVnOEkvbWdueFpNaExK?=
 =?utf-8?B?Q2ZLUUYzd3lySnhTckxTMmxqYjF1REpiMjRIY0t0ZUM5K01jRkFUVnlldEh6?=
 =?utf-8?B?bXY3RGJsNmpQZUpCZjRqU3loSDZkYzk4UGNYZjdNN0RHODNnbjdyVGlwa01V?=
 =?utf-8?B?QS9nRDEyNms1S0NQMHVjQXJycTlXR0FsVUlON0tVSVRSZjRXUmN1T1FGZlAr?=
 =?utf-8?B?NjRibEJITDZBdVNscFFqMHdRTnprYStiMVU4N1NFK1o2eElVOUpmaDJEZjZr?=
 =?utf-8?B?aFBTKzV4Y2ZxN2JnVDMrUXdhdWpxeWtDUng2MFJzbVVQNG14SERQV3JNWTI1?=
 =?utf-8?B?WHFOa24yMTBlaFB4T0pTSkt5QTRpc2FyZnp6WUU1enZDazRON2dlQkpQNTZh?=
 =?utf-8?B?RXRHdkZ1N09FajJzSEFBSzJFaDl6ditVZFpaTVpQVmplZXVlNUxxSmxzSCtK?=
 =?utf-8?B?dHBydkRFYXBJcHhIVzVreGJta2RZdmpiRUZTNkZ0bTlkU1FhNkp3V0kzOXcx?=
 =?utf-8?B?ZllLN0pWZWk5c0ltR1llbXhTREdRYTdaK3RQSmF6UEw3RXpUY3NCSmNKOUxt?=
 =?utf-8?B?RFU4akEydTFyK0ZVUm9oYlBtL2MwS2F1cmdJanAzVDNxeEVQYWFNZlJZcUM1?=
 =?utf-8?B?a2V4cTZWeSsvTTR0NFBzWTd5UEZwcGZMcFV3TXFaN3lIUWFnZlJLZzlFUVV1?=
 =?utf-8?B?NzlwZ2JEOWt1QWpxdXhhbHo2SGZFb0JFanY5czlaMUo1UW5WcG1RUVQrdy92?=
 =?utf-8?B?M1VNWmFWVitjbStwSXFNRzE1aWFjRVZaOXE3VVkwZzRHTW5NUFFYYS9wV1M5?=
 =?utf-8?B?V0ovVlVPSXo1S2hrY1BSOGJ0VWJET2lsV0ZkRGZkNDRxbE1zNkZEQXhDWnNx?=
 =?utf-8?B?T08yQlRnK2pNQkdMcVhGQ2NLVHFmMUttQWJIbEhocm0vSC9qeDhRREgyV3M1?=
 =?utf-8?B?c0dLQ3R2dWlHRW1JZk4wa080WU43Wkcyd2lWTHNPVmxTcXllNTRQUU9zN1Qx?=
 =?utf-8?B?R2hGU1BhTDhjYUdhRXlXR1c0OU9mTG1JQzRiWEpHSGVwcUR1Y01BVjQ1eTlQ?=
 =?utf-8?B?bmxYM2FQS2tuVzFnRStNUnhTcHJDWEJtd2JSVFlXVEM4aUROMThSbnNwZkpD?=
 =?utf-8?B?RG1MSGFsTk8xSnp0c1RSdGRPUGg0cHpyaER6TFlUdXdlOGprb3pneHR1UFFh?=
 =?utf-8?B?YTJWUFpRcmMwZUloMXNub0ZlVkxxUnRoNUJhdlNFNHYwbDZCZndoell1QVFl?=
 =?utf-8?Q?Y4B0pRjATJR0wOckAHQSF2c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b62dfda-9b30-4623-dd9c-08d9d752ed3b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 11:42:22.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqMwFjTMIOS5eMWhEh+/fKPfaM+tS9/3+eK13aUbOTAZ/5cj6WZ0BS11EzlAHTvyzwlSi0hDK16F+fMi0yK0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4378
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 04:38:32PM +0000, Andrew Cooper wrote:
> These were written before Spectre/Meltdown went public, and there was large
> uncertainty in how the protections would evolve.  As it turns out, they're
> very specific to Intel hardware, and not very suitable for AMD.
> 
> Expand and drop the macros.  No change at all for VT-x.
> 
> For AMD, the only relevant piece of functionality is DO_OVERWRITE_RSB,
> although we will soon be adding (different) logic to handle MSR_SPEC_CTRL.
> 
> This has a marginal improvement of removing an unconditional pile of long-nops
> from the vmentry/exit path.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder however if it would be clearer to define
SPEC_CTRL_ENTRY_FROM_{SVM,VMX} and EXIT macros in spec_ctrl_asm.h
(even if just used in a single place) so that all the related SPEC
macros are in a single file.

Thanks, Roger.

