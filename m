Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D41490569
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258043.443933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ode-0003gU-8J; Mon, 17 Jan 2022 09:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258043.443933; Mon, 17 Jan 2022 09:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ode-0003eV-4p; Mon, 17 Jan 2022 09:49:22 +0000
Received: by outflank-mailman (input) for mailman id 258043;
 Mon, 17 Jan 2022 09:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Odc-0003a5-Ia
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb8f65b2-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:49:17 +0100 (CET)
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
X-Inumbo-ID: bb8f65b2-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=A+Od6Bh7qsx7u4DTHy3nwSt/ug52iTXLpb6kGpq0i0I=;
  b=BbRf6ifAS68pK/sjlUfcbb/6DpVjZhFqL05Ey6J2BoGLB9Fl4B4Mk510
   3DMKkb/kT5apZen83/AexSGq7Bw7MRhzWcJ5aMfSzt3Zr28s18P1YHyIH
   Ikh6FwVMYeaVS3kWh/30CgBNWfz+PXOUj1whBu/o8G/Jw9JNcx2LeJ3/8
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vwd4nTW/xkcN7l6O6dhjK0P8Qiyd/rSZqNM7ztjEyiVzFGjzIG3oMXJX5aAUztNiotrRmESirR
 T0e68OrjoSOUGKXvDXBX3RzJegufO3mUuLzPy9dAvj1JhvjN+pMgQPxVIUOyS7WX13iSHfj38M
 TBkNuE8cxf+0oCdCovLd/BJ9GDtCKTbAnC9dko0yAy98UKUxr4tV/Z5mXqxhwjZQ6rSm5doY2r
 809UYRmmFiaZjqksaEHAK5GWfnhm8pwxU9S4unAR/dUPx4VSEomSMh5lr31EVGcTmpoRBViTOm
 a/Mb/KdivlunER18BI8tzmD7
X-SBRS: 5.2
X-MesageID: 62138819
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JE/FralCdVQuy5Fj/KsrGbzo5gxmIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWjyHaPbeYGr8KYh2OYvj9EpQ7JeAn95qT1A++yoxRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29c32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PhQrpbvaxxxB5yPlOcgaRoAI3tzZpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq35seTa+PD
 yYfQT5lKyTlQRRRA3U0As4clcWylHjkfBQN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zmBjkKOdrZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFOZpRRDecEIKtx55AKw8KmM01yUXVFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4jDGJGT9bxgbQ+0RqmBNzDJrVml
 CJV8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdoLvWEldBs1bJZsldrVj
 Kn74145CHh7ZirCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2mHxW7T6NFPjTkkT2uZLDNSX9YepUbzOzghURsfnsTPP9q
 YgPbqNnCnx3DYXDX8Ug2dVCcgBRcylqXMCeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:Jx8vaKqbtQOV6Z+zanlh480aV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSpQEIdxeOlNK1kJ
 0QCJSWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYWcegDUdAf0+4TMHf9LqQZfngiOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlOSi8SF56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62138819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYsFJuqmSgbx7pNgIk1rnnw+P9/3yUA1KvXKDgt5o2RMR3ZpvOWQHcDcrqN9aMBBSNyJetI5GpwPKFurpmN8Y7cXDxErI1Eyjk4oVzRkf155bw+21MH+vUEcBvWhkREDotfhizukjPjfhBqFgybSHno5dyVViZGLlcVbUrxQ2mFTjdULRWlb16IWJy4TC+PX9x21oQGnJ8+7R3yGt5m2MGsgvCjYWoU2XhWbeNliquOkZuNuz4N0KVRx1+zxWWxQLz6EjPGGHPplwUVf4rXwVUDS6vOza2W9B1ROC8iVNSL4FFgu3npv1ByrgporIkjSpKz5Slm2gXmGt7a+mpvzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojngcjt1M2iDhn21AvZ+LOY3mmuCciu47e9GG4lJRbs=;
 b=C6oslnz5WWa5S/V2dagsREk/hlvqBB4+TQ/iZRHHZjykRB49vaJf35+0zZO5Pi1T6E03u7W8+jgUQMmMe4WeCUihAmTWvf8xPCV87/+9mA2smq7Hl5knvqwm8CjeeMNeGk0ss+QmRyTeGwXTKWGRs7FgMkF7icLkD87SqNMeIYqf9uIY3JYOMFck75EsZ+we37RnaXU0KqeRz/L1sEG4Ra4Bx4N5JuVrUtQo4b1JEhAPz50PUXCjn+fQgFgY/HfoHhoCjSw3l+VSaxBFJzoOGi/pkT3iF0mdMz/WnxMlK0acFbMlbdf1DYrijHg0f/Cq2D/82iTXOQjCWHl06/5ELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ojngcjt1M2iDhn21AvZ+LOY3mmuCciu47e9GG4lJRbs=;
 b=Sftm+SavJd3M38DAGUKyfQMj6abKOuZPUSVGBgBpU0AJ+G9PojIo5F1EGoJ8WsvbqwX7rRNs496q6FRzmDbAHVbPT/oic/GfgD+J/sB7DvcCO/ZG9Q9stWmLg9XUVgff+KXLRxjcwBjNkW5P0eAb3ywQ4ZY451EFR8DgqE1qekc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 03/12] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Mon, 17 Jan 2022 10:48:18 +0100
Message-ID: <20220117094827.16756-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7ca300-544c-43ae-002d-08d9d99e9e3b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB405933432AF838FD18E10CB08F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5fSwRpv7bxINY5RwbR8IPOpKzu5ob9ZFk+prqfgCGabSCmKVBX5l0rA3sxBe73lP7+5e56evczOZosGxtYRrzrJ3MZ+pyQJ43KKETVCbxc9lxio16+ashU/4a3VPgWO65evjW6flXjtPCjAuwP4U8afwNn+RKnN4GiuI1L0awFIJILLRTxHG49HaEmfELzMbAKhHVd7uzyKCoKsmw15muVk/txAXCy147I9PamclVZrzugk0OJ+4zV8L7nXaXFqGl0OcUw/9BMzC1Dm9Mqvs6ZucpwiBLP3Z+3cFePjoir36iBWI6QqivzXqElzNqQi0DMGB1u8doJoEAcT9UKPnH4LIxJ0Pms2yJy3pOxLK4pEMtI+6EZMo9zz1xF22MfQC+9StFo1FdkXr5NcZIQPZ8roUocsJL43QDCw8LH/eFTe86M1ekZ1tv5p4643zd5y5E+tFDy3kHf7vF2YHBS1J13pIt+AKudysywi6xOKrqtjGOngB1acAv+5wbtYOQpZ0TjSG+7Fjh9/7tNCPvBLqnpop578cDu/ejtEdol3NoD4l2BqBEhqIoXLoZcYP+BcHynRZ9VuPas5ny0kOEeaNt7OHwfQZ9ZwKNavNF6xuAOJueDhc1gMoilW0nADq9P2jEPADXjGJKA+cGpDdD06DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCs4YmpwMnN4ZDBsNGVLTXFab0Y0TTU0amd5MWFYTG5OWUM4OUo2ZzExVm4y?=
 =?utf-8?B?MnRLOHUzVlR5c2pmRytoM2l0STB1U0czMmJ2QzZ0L3lVcnJQdjhRK200U20x?=
 =?utf-8?B?N1hVRzFVTUFKdXpjQnEwdEJIQWZ4YW9paEo4cllCNjloRUNWd1h0cUEvUHBs?=
 =?utf-8?B?N2V4MWN1Yk9PYW9rSkRqMGs2MWZFeWkxeDlQbjJQd29aSTdPTTBRZVh3NEhC?=
 =?utf-8?B?Wi9SdVZPaWI4R0ovVWpONWdkWXdUUU03bG1LL3BkQnpGT3QzanFLdEJaNHYy?=
 =?utf-8?B?SjVLZU11YUo0SDZxUi9vSXR3blQzZlczdVVNVExMNHQ5ejlBTTVoWVEzb0N5?=
 =?utf-8?B?TVZxR3Y1cGFXY3VRdUFmeVNVclF5Ny92RldrcDhaeXRudHBMb2h2OVhQWDh0?=
 =?utf-8?B?SlV3QmFXckVkSS9ScThJcWh5cjNKQW1naDc2YUNIKzNDdmlWaWxObURXZFU1?=
 =?utf-8?B?R0Jua1hNVWRtaWRpcjl6RlpCaFdFUGdYNU1pcUNlOTRHWjdaTlo4MFNwOHFQ?=
 =?utf-8?B?VWdaUzZvNHZTNTlXL2lmYm11VTB0cDkzTTlja0F0R3c4TEdOUW5BeU5GQ0Ju?=
 =?utf-8?B?eFdzNE80QVlNZzlQUkVQK0VaY0pDaWQwRzBXMW9YKzlqVXNoY2l4eTh3MlU1?=
 =?utf-8?B?WjErbElCendFR3pxV1JCSXpVU25mTGk5WVdMOWsrSm9iTjFTYVI2N2Q0NjdE?=
 =?utf-8?B?MEp5RHhJT0pZMG02Yk5zbmtxaFZGK0hXb1VRUGhJZzY5KzF3aFVxUW4zY20y?=
 =?utf-8?B?aERMd0xNSjJGSGJmUlBVYmZ2ZVpSbDY1UGUxcVpMeng3RWZDVjJWVVUwRmtP?=
 =?utf-8?B?ZXNFbzBOd3hOZk9ET056VWVHZURUYU94TzR1YzdXR2lZby9VRUs0VWpIRVds?=
 =?utf-8?B?enVhQ2Z5KzYvOWVJZEoxTzVRcmlyYjZGNHFrU3FDUDV4WTZwRGhMNWRFMUZ6?=
 =?utf-8?B?c3M4Q2laNVdhR05oL2lPdXBYeEpxSWVYcUROK04yaFRkOVo5MVd5bXBhcDAz?=
 =?utf-8?B?QVpJMVByOHVaUTZ5R1hDd1hGNlN1Q0cxeklvT1BobXRjZzdxSDVkVDhYc3pk?=
 =?utf-8?B?MC9YdlRtZlYrSVViZnZhRDFyTG50R1JLelpTZkNlY0JUSlBqU1J2VTVDMUpz?=
 =?utf-8?B?ZHRaN0FucHlrcXU4azFXbW4xeFkyenhQY3AvSEc2MWNSbjJnWExmYWVZYnlC?=
 =?utf-8?B?RmJTKzFteXVQL2pDY3hRN0lvZWpBTHVITEVxTjREaHhnZnRZTG5yTGVjWFJT?=
 =?utf-8?B?YkpYY3Q1VWVhY3JFWktudFRjb2tZcCtDeWZOZ0ZHcXJ3VTRSSXVqL2tBcHZJ?=
 =?utf-8?B?OEZsTkdleUtXeUJHOGw0Tk5Nd0ZEdVhTVnlWS0t6eGEzalI1RG1QZ2EzOFMz?=
 =?utf-8?B?WkhXaEIrUWhjWFUxTDVwa3RqZ2JIVnk1WDdUMkRFYWMwUTZtamlib2FZYmUy?=
 =?utf-8?B?MmwrUUNZc0ZwRUliWTZCWmVoZ1pDU1dQNytoVGZYSTU5L2NJV3Y3WDgxVWs0?=
 =?utf-8?B?K3NpdEtvV253QVliK2NFQmFCUGZISjV3Z2VjK1FIOU5xUjZIWSswT2Q0T1Vj?=
 =?utf-8?B?M3lpSzAyZVpNR3FPSUVUMElycHB0cEdadm5oQWtuOUsyUUdWUEE3Y1p0V2Jr?=
 =?utf-8?B?K2JDMUJ6Q0xTVnhwZHFSNjJqVlhvNTlzNDM0QjRlZFdrRVpaNG4wdTJJR1dJ?=
 =?utf-8?B?K1c0QlFpZXR6Mmw2dnd2dVhqQ2RTbjg2eWJtZ1hnWmhoK1pxN2ZNaUtDcDVy?=
 =?utf-8?B?eWdKQzdqcGxhZ1hTWkp5RzRWR3d2NEJqK1ZCU2VqQXR3Mzk2T1FRcHZEYk5D?=
 =?utf-8?B?WDQrblFFY0h1Rk1DRjFQUy93STZGYUlwd1NRUmdXUEZ6UDF6VDlrUVhhSzZR?=
 =?utf-8?B?MUNyNUozQ0JOd0tLM2xwMzR4WWs0LzU3NFYvcFRXZmN5eW00QjlKNmxkRVJi?=
 =?utf-8?B?L3M1bFlQRldCaDhMQlEwM2dGOFhFMitXTWFEck5SM25YZys1MHM0aTdia0F5?=
 =?utf-8?B?bndyaXJEbGZGaHF5QUJSbVNLK2xTbzU2SDNEV0NBbEJUYkg0Y0RISlphQzZO?=
 =?utf-8?B?elc3M3FieFhKMklsQnVaVi9uRzBqK2VKcWJ1ejMvNmJKNXo3b1NkOXI0dlNu?=
 =?utf-8?B?WjZmNW95QW8yN2NvSy96SWgxcThiQkErMzZJaVRDd2ZOaHNlcGdpcndDTGhR?=
 =?utf-8?Q?NeCitfXRHaVT553bDmk1fwg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7ca300-544c-43ae-002d-08d9d99e9e3b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:13.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1+gboB2oGuf3WQDEqcDho8u28YTiWtMnGr7tvM3qqsStvB3jvotyCOdZKmHMijEj2AMOmkO7W89kbw6AWUYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Zero out parameter.

Changes since v3:
 - Use x86_cpuid_get_leaf.

Changes since v1:
 - Use find leaf.
---
 tools/include/xenguest.h        |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..0a6fd99306 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -807,6 +807,9 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                uint32_t nr);
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index b9e827ce7e..aff4efe78d 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -855,6 +855,31 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    const struct cpuid_leaf *tmp;
+
+    *out = (xen_cpuid_leaf_t){};
+
+    tmp = x86_cpuid_get_leaf(&policy->cpuid, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->leaf = leaf;
+    out->subleaf = subleaf;
+    out->a = tmp->a;
+    out->b = tmp->b;
+    out->c = tmp->c;
+    out->d = tmp->d;
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.34.1


