Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1B4E503A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 11:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293834.499307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWy5F-0006zO-Po; Wed, 23 Mar 2022 10:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293834.499307; Wed, 23 Mar 2022 10:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWy5F-0006x4-Mc; Wed, 23 Mar 2022 10:19:17 +0000
Received: by outflank-mailman (input) for mailman id 293834;
 Wed, 23 Mar 2022 10:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OhW=UC=citrix.com=prvs=074292745=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWy5E-0006wy-3O
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 10:19:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9910c979-aa92-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 11:18:36 +0100 (CET)
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
X-Inumbo-ID: 9910c979-aa92-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648030754;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=J+2qYgWy1cfJZWdZ0y91pZlXZzMukWuCoZHcIDKK7wo=;
  b=Z75dez8PFC8LnVWwy2aCLBjRkwgMqZ8Fzx+9mGc23I+NgoJ4JZV7oUqs
   qiNBQ5w4EVeb8e6pph0jM/bSIdOFYS8qUdhIYH5ivpgw51ddbWf95AnNv
   vw1BP9M9vXTgg/TjMveRLwKXaIgdysJ0MyPL8oxKuNmip4qpq8vakaHww
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66861813
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ps3jh6wuaBc5iLgeGUR6t+cIxirEfRIJ4+MujC+fZmUNrF6WrkUCn
 WEXDWuFb6rcYmGkKY1wb9m+pB5UvZGDytRrHlBr/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz24LhX2thh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5ayeexUCMJz2haccA0cAP31kepBL9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J4eQ6+OP
 pFxhTxHPQvyWj1GBg0sC7Eewb6TgmfgI35fgQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoQCbm5+/hCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH4I27e2C2+IausHCzaXZNATMYIhIJQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hL0yfyFWy3yGsiTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Cq+FMYEfMsUtL1DvEMRSiai4hT2FfK8Ey/xXB
 HtmWZz0USZy5VpPklJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNxP0EyL2Xo
 injBie1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMProSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:BC1mTKHM7YVltOMOpLqFHpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKnyXcV2/hrAV7GZmfbUQSTXedfBOfZsl/d8k7Fh5FgPM
 VbAtFD4bTLZDAQ56aKgzVQe+xQvOVvm5rY4ts2oU0dKD2DPMpbnnpE40ugYztLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUGzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4EoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKlQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgcdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfVsRLQkjQxo+ao7bWzHANhNKp
 guMCic3occTbqiVQGUgoE1q+bcHkjaHX+9Mzo/U4KuontrdUtCvjolLfwk7wk9Ha0GOul5Dp
 z/Q9xVfZF1P7srhPFGdZA8qfXeMB2/ffuLChPRHWja
X-IronPort-AV: E=Sophos;i="5.90,203,1643691600"; 
   d="scan'208";a="66861813"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvdm1WnPXEQ8h/lrNI0+zpb+eG+++sufdB4WH34SRNcIVExONevA3h9BzIh8fIw4OLVjpUS997agx4cnqEKNEsyeR2vKRagydWTNIFYtFYfFxlKUs+c1nisHkgsiS+p/FgXnWHd8nFOwwFEwqvNVp04b0wy2fzpkHMVEKp22UTyksa7umGhzXyq0bzIiXrv9j34zKrnocm9sQ/vm/qmzzrbUV93xxIxsW33+5kIFK7qIIw4gZpjShxwns+UW3SAT8R7kTtgn5VALywYGPQPSK795n09SudyEPJD/w5q0bzwHEns7qrvWY6o1CoQRxzEEs73X6QkMDdylCCmDs5HD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gitEDanTViT9PRj7GWXdJyjsJSlJnsYelX5GUdssemg=;
 b=fFbe35BQ/XsyAuFUtLRmFC0M19PxtDS5v5FXgCRgLL8qm9vwgqFIpGn9CnZq5Wg1JXwopjUhquiunSQDUO7WaQBo+CwnovQE2NC2o9Agf/jDnxFrsQE9uUYg2aqmPWFPVBYoO4Uxo7qbehVTRbipAX9xSar0ibkYUWHKdh0vrwbARGeOr+ARHGJVicu/HZhtD2tVMWhppWSScUz7cSJJYzJgeDOyCifp3K3EjM5xrn1icZkR9jjman5At3VOurI0lnMr+vk+VMEprlxbwuLZlTXs/6SLS4S4aFyv3+XeHKtH1kS4DjViy/XrpyeWPpgSBS+/+ZhhVy4v5ynkGn82bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gitEDanTViT9PRj7GWXdJyjsJSlJnsYelX5GUdssemg=;
 b=t62jMPxzw6wHiecPXrsBWJYnqOuOHqU5JoUzTqzRhAt+04bdCP6FjB4vszhqJZi3bqTz5TxL+tHWP51rIGVPAyluYZulWHpueoirk8AVU55oTmcT0gAT86xL7jZ5WWAPxQDVwuvG+N4bV6GI2f/r3ITYI548WaivewJzGoPkl2A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3] codeql: add support for analyzing C, Python and Go
Date: Wed, 23 Mar 2022 11:18:56 +0100
Message-ID: <20220323101856.35992-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b18d8c-dfd1-4cbb-7039-08da0cb68e69
X-MS-TrafficTypeDiagnostic: BN7PR03MB3940:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB39403B9AECD731850FB407548F189@BN7PR03MB3940.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bp2shFZZh/xY1pfVCiEWzo1a715q2+Xn8v0rUfnPC8sdsDGNuvTFwqL4HtJHymv4ZU6SoVcq7QLxVLr9wSWu1rKwGXVwXLp44xp19o1YN5NyJ28grU8sWf9Z+7T2G6hEQoSPCMuMeI6RCKKnBmmcIxU5SD6zbNPVYTqIHCOo69Ysl8d+q/WzCzRD3/sG6mKxSNY6YfEYmFX1vC1x2aOjdXyqoMGvA+SAWikWWM5nHJ3Z3EYrTOqVt8xVOBpEjV2BGyQPQKFFJ0io1l1jPIKrSDZQLGvpKO0WVKA1EuZP9QWGsOlqbll7lDFE2a5rD1BHDMsVkqcvKno1B+JWpWcFmoibrsNJ4XZRcssPrvN4m4BZNzREN/8ULU6LKgv8DEGfcBreR5JGdnqBe1PbUxM6bjzWiS975AxKam4UB/Nph/g4M6Yhum3Qi+kYawv90mmzSqbqku5d3jphyFEnn9Sice0FraYrxw+I1i3u6XBY/ttp0lRXrlfEuBPnkHfUTKe4i6UAFhyjgxBqSDuZKdD4Oy3Mx8Kh3Wo68xX2uWvyYNN0ESPn+NB7TYZRXw0AUF7Wvgf0lfcL3/70oN26zGsfbH9EHFXW+Mc7scH/jnYKbrZOhYu0AxEd/dAC6Ob2VjLm5dPUXL50pS13SRrRtOSadQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(8936002)(5660300002)(6512007)(54906003)(6486002)(6916009)(86362001)(66476007)(8676002)(2906002)(66556008)(4326008)(38100700002)(316002)(6666004)(1076003)(82960400001)(83380400001)(2616005)(26005)(36756003)(186003)(508600001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGkxZTg3QTdvT3hSQUpFeVUwUGkwdmlreEc4aVc3SjVsbzY4aEZxNU5qMEtT?=
 =?utf-8?B?THJhelFoMXgxT3FMMUdwWm82alRoNzNUbG9xamg1dkhzZFJtTEtpOW1lRjNT?=
 =?utf-8?B?dkVibjRBQUsrYlBpSDRyeGltTk1FanY1M2p2RmFTandNdmZHeFpqdDBtQmJw?=
 =?utf-8?B?c0tLaXYwejRtam4vSUhFZC9neHhIczk0dnYrQlZUSzV2WTNDMWgyOVJMczd1?=
 =?utf-8?B?SnMxdmhMYVl2NVlFNnNYYnJ5YktoVUVnRC91V2paaWV2cGRTYXNkYkpmbFBD?=
 =?utf-8?B?MU9nWWdUc3ZzSW1tMzJvTklNT2FFcXdYNEd5ZCtlb1lZRU4yQ0VINHdHeDBM?=
 =?utf-8?B?aUhKZG1UYUsxV2VuN0kvQm5tLzF2dnE5ZTRRcmRWRE1NVm5UeDdUSUczeDI2?=
 =?utf-8?B?TVY4aUhHNEtoNjJIYlJEejlaRVFqbzNNS09pbnJ6TEZPTzE4dC9NOGtsOHRV?=
 =?utf-8?B?Y01pYXZSdUJ0UzhBZzFOdHpYeTVEeXpOMlJsU0tYVVB3cCt5QWJxdGU1VG1h?=
 =?utf-8?B?ZG90QUxYcXUySHZNYWxITWhVYklJYWVwelYxelBzN1Z0ZklTMmorVlB5QzNM?=
 =?utf-8?B?eEQwMU1IZUZhZS9Tc2RYNmJvV1JKeFN5UElUMG53cmVHeDd5S2UxNHRxTk1m?=
 =?utf-8?B?VXMzU2VISUNrRzRYQ2NLU1VkOUcyU3VaUEl1d2t3V0hZTWw3RW5JaXNCbkpF?=
 =?utf-8?B?SlRvUGVyRDBrMy9uWS9iM1JKdU1nbHBVZTRkWnBGdFRjM0F5RUY4cUN1cStD?=
 =?utf-8?B?OUZzcnlTQ3FlMUhsYmZCdXQ5bEhGMkV2Syt4ZURveGFlTzBIeVJDWTBhOFhI?=
 =?utf-8?B?TEtQeGFhK0pSK2dGb1JHR0xrVC9kd1BNa090Z2dRSXZ4MDArelJ6aTZURUlP?=
 =?utf-8?B?Q1RRdVhXTmU3eHJiVGI1Sy9VMmVtUUN1VlFRQmt1bURRUmEzaFV0bFFMRS9v?=
 =?utf-8?B?Z20zNm1PeUVtQ3pFUElGUUdyOUo5dFVCeDZnT1FESkZZOGF5VGVFVzlJY2Nh?=
 =?utf-8?B?T3VCTmV3VWRrR0dDNjN3MzNRcWpRYmcyb2RkZkJJZXVCNmtRcHdXNUNWdGZz?=
 =?utf-8?B?YW9FQU1HYlJSakNiZ3U5TUZnVnp0TStTb1hSRlZZK04wSEhXMmt6NnFPcm5Z?=
 =?utf-8?B?akhxTWZqdHhkMWFBMmd4RjNneFI5U3J0SmJ4RDh6MlZ1b1FOVGVaQXRKUEcv?=
 =?utf-8?B?TkNOMTdFZ2dTVi9kTDQrYmtZRDVZMWttMXlVay91dUZHZGpEaUxRY0YvMWF0?=
 =?utf-8?B?cWxKZS9HWGxwNFUvZCtmMmZUM3h2eDQyL1JpeVpjWEhBL0UwWmNqQ2xqSGtW?=
 =?utf-8?B?WUpiK1dJOHlhYW1wY2cyWVlpRkduMEFwNERKNkowTDJ2c3Z3K3JZdUZibXZH?=
 =?utf-8?B?WXpFdWZXbVVCa0w1dnNkSU9oUGZwS0NVNGNlQjFsQVZqZTlNVEVjREwxSmFw?=
 =?utf-8?B?NE9YNGZnUDlpbU9xNk91MEp5NDRacWJBQmE4R3dnUmxacXpBSzVnT1RGTldp?=
 =?utf-8?B?MHIwQS94dThKb3VZYkJrSHFzNHhwTXpEa1BZL2JYOWxyZmJ2cC80UTd5N0tZ?=
 =?utf-8?B?Yk9NR1k0eTZlQTVrVUtqMlNhdGIvZU1uRHh5VjYyd01aOGI2RXdmQ1pwNkRu?=
 =?utf-8?B?NXRBb3ZtTlBBRlArc3pkNG9INHJUY3ZxUVkyQm1aM1Q0eEU5d1V5RFlGR0E2?=
 =?utf-8?B?eGJYQkt4eVlSSm1MQmR0eTEwTm85b3hEbFdzeEt6NE9lUWFaRE1BUVVjdmFN?=
 =?utf-8?B?SmdJMGNWcEZabHJWb3NMMWRFZzNvY1BPOVNLM2hNR0k3S2g4MEhucUlxeGZJ?=
 =?utf-8?B?Qk5GS09iWnI2cmh3TUZJM3A0WjJpckdXN1BtTlVDNEo1alQ2OStnRWVRblRy?=
 =?utf-8?B?SEQrdkUzcGlodFk4ekxpRGhKSnVZVnhkNzNsamloUmEzMGxla1UwQmcvbnYx?=
 =?utf-8?Q?XWxrCOv7U/jFJfy36DuX7DNSpyCg+f0o?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b18d8c-dfd1-4cbb-7039-08da0cb68e69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 10:19:04.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kG8XFJ1FFGekcA3ldiJ6oJCrL+lTTP7vpAyjOMKQP2aC7ypA6FpOeVkasCvEkwlJveQIOkpoJE3tH5xv/fMl7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3940
X-OriginatorOrg: citrix.com

Introduce CodeQL support for Xen and analyze the C, Python and Go
files.

Note than when analyzing Python or Go we avoid building the hypervisor
and only build the tools.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Remove explicit 'staging' branch checkout.
 - Remove explicit query.
 - Remove ignored paths.
 - Remove 'on schedule' trigger, or else it would be run against the
   master branch instead of staging.

Changes since v1:
 - Rename to note it's x86 specific right now.
 - Merge the ignored path patch.
---
 .github/workflows/codeql-x86.yml | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 .github/workflows/codeql-x86.yml

diff --git a/.github/workflows/codeql-x86.yml b/.github/workflows/codeql-x86.yml
new file mode 100644
index 0000000000..6ddd445c79
--- /dev/null
+++ b/.github/workflows/codeql-x86.yml
@@ -0,0 +1,54 @@
+name: CodeQL x86
+
+on:
+  workflow_dispatch:
+  push:
+    branches: [staging]
+
+jobs:
+  analyse:
+
+    strategy:
+      matrix:
+        language: [ 'cpp', 'python', 'go' ]
+
+    runs-on: ubuntu-latest
+
+    steps:
+    - name: Install build dependencies
+      run: |
+        sudo apt-get install -y wget git \
+          libbz2-dev build-essential \
+          zlib1g-dev libncurses5-dev iasl \
+          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
+          autoconf libtool liblzma-dev \
+          python3-dev golang python-dev libsystemd-dev
+
+    - uses: actions/checkout@v2
+
+    - name: Configure Xen
+      run: |
+        ./configure --with-system-qemu=/bin/true \
+                    --with-system-seabios=/bin/true \
+                    --with-system-ovmf=/bin/true
+
+    - name: Pre build stuff
+      run: |
+        make -j`nproc` mini-os-dir
+
+    - uses: github/codeql-action/init@v1
+      with:
+        languages: ${{matrix.language}}
+
+    - if: matrix.language == 'cpp'
+      name: Full Build
+      run: |
+        make -j`nproc` build-xen build-tools
+        make -j`nproc` -C extras/mini-os/
+
+    - if: matrix.language == 'python' || matrix.language == 'go'
+      name: Tools Build
+      run: |
+        make -j`nproc` build-tools
+
+    - uses: github/codeql-action/analyze@v1
-- 
2.35.1


