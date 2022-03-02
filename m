Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B64CA63A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 14:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282251.480886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPHp-0002B0-8p; Wed, 02 Mar 2022 13:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282251.480886; Wed, 02 Mar 2022 13:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPHp-00028r-5Z; Wed, 02 Mar 2022 13:45:01 +0000
Received: by outflank-mailman (input) for mailman id 282251;
 Wed, 02 Mar 2022 13:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPPHn-00028l-Vo
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 13:45:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f23861b8-9a2e-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 14:44:58 +0100 (CET)
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
X-Inumbo-ID: f23861b8-9a2e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646228697;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=yy95bZc1mafoynhoap3Dua9XOm5rukrDtL8/9mucZuA=;
  b=N0la9Poldn8bJMGAisj9ekpt6wT1pOPLPDuHumrdp0b54uIXhyAUBSHy
   kSJt1Q7SfWrz9fpSZJ0Y/tvcSYoeAv+opxMNXe6/qE8y0xfxHEjkDjgBP
   03yvKGbzL+Vi5IvhbGELfca6GSWtHu3SXPfqjvIx5nyj4PswKHxips+uU
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67611185
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GHsVbq+YRLaz+LUzroUQDrUDdH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TBNXTzVOqvcYTGjLdsgbdzj9UpTsMDQxtRmHAA5qi88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDjW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCna6cYCcPb63HoroidkZAThgvH7RZ1LCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4RQ6+HP
 ppEAdZpREX9ah91Z2saMrkRgeKOuiKjcB5f72vA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru9WnjHgsTMtDZzDOf62+tncfGhya9U4UXfJWG8fptjEyW13YkIhQcXlumotG0kke7HdlYL
 iQ84TEypKI/8EiqSNjVXBCipnOA+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrDzFytLyeSVqG66yZ6zi1PEA9L3IGZCICZRsI5Z/kuo5bs/7UZo89Sujv1ISzQGyuh
 WDRxMQju1kNpfwn/oWdrFDMuWyTg8fREzdkxBzIcm3wu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrTzXLQGY3hCJnsvq/Ya2OE3TaDCrF8r2zFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrISIyNuhP8NIMmjn1NmOmvpnsGiam4hT2FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6nkU35ieLPOifEE9/p1WdiiMhjtstoRy2Pr
 r5i2zaikU0DAIUSnAGNmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mtscl3het/0NzI/gp
 yjlMmcBkQaXrSCXeG2iNyE4AJuyDMkXkJ7OFXF1Vbpe8yN4OtjHAWZ2X8ZfQITLA8Q4la8kF
 6ReIp7YahmNIxyekwkggVDGhNUKXDyghB6UPjrjZz46fpV6QBfO9MOidQzqnBTixALu3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:D3HCQq+sJJCldMirI2Juk+Fldb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8buYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOROEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpjWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m2ecJi+EzRPBkuPJlaAkEuTzYIbiJnIfy+Azdldvfq2rCVu
 O85CvIcf4DrU85NVvF3CcFkzOQrArGrUWShmNwyEGT3/AQSF8BerV8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJllXf+WP0AgfeMMo/gpiuLElGfZsRE0kjTZoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4ao+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSmvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9ER6svM7z74HRmyGG8fIzmZ0Wd9ih33ekLhoHB
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="67611185"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDqVfh6oljSx4eBGR10x6EWxja3KSGkv7qSLPWofeJed+WEbd6/c86cDvFwQ16HbtPK40sxI2cYZ/q7W6gSWdn95gKgUQI6nJzYqoRpNgQvKajCsNeYztR/3VzUwrfTI7aDuX2pv1swyAtqbOzRcaNOz+5DaB9Guvp+gEDBlwsD9KTO8c5Y2tFObGu3+pzt/TdePvvRzxvsPKyNzmwh5V9CB2odqIVee/VlTWIb9wPi2P1/c8hWTVNxucdX51r9iqu0+54hmeG1axbBb6qUj+GNsAWY79NT0ptgFvDfSddM47tAD1pWO2gPtxoCtsyGkGoGcY1vkncnRovFmAk1Qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GuEWfnh7t7WFYhXPlf7lXrB2XILSCmjAhkM/Liht00=;
 b=F/ERbX3jh3zH9e1ytbr4hAE0/yl0/q5QrJM9F9SVmNPMjPwnEpUlQ7wJVfbZmEywpLmcSNcZMdfSMwkl4TBWPuFRCdrhWrY1A77nkUtALPameFBvUuQ0yMV/1Mb46IYNn8Daol54wBejKDplA14EQsXnU2ixoZfbtrb7mIWfM46E92F0vAzQfUxYkWw/UkWjTmkril+rZ2iVpYPVEvTVv+BuKXn3OTdvLmposYNZvW59XrYsJ3/hfj5ypZcFrshggcichC2xB8H8LnBBmc+Z9uIczZ1xP7GiFbocb/XD6lyy5W06qZHGoLnnRuc9iTX5Fvwpq9QnDVOYaGE6DytKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GuEWfnh7t7WFYhXPlf7lXrB2XILSCmjAhkM/Liht00=;
 b=SeXgBtTSt8lN6ChEZBGu89htEsjNMe8xX/7VkkvFUz7sT2ZXHyplfrLNtXxazGQXtnba2LI0/lroB4f8sfoQYmwPpZVmpG+TRyVGT0u7vhwswDqA6VwIxVJEE9xBIuEpPvRz2DHi4ckKpvCVunNNTMNf/J4HFrHcfS0Dlp3qdec=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] livepatch: set -f{function,data}-sections compiler option
Date: Wed,  2 Mar 2022 14:44:25 +0100
Message-ID: <20220302134425.38465-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ac78c45-a56f-4859-078d-08d9fc52d3a9
X-MS-TrafficTypeDiagnostic: CY1PR03MB2251:EE_
X-Microsoft-Antispam-PRVS: <CY1PR03MB22514BF054972619943CFEE88F039@CY1PR03MB2251.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aiii8L2YNGwHzC8H2vhxlbAelxQJ1dgsybLkumfo01AqrG0d+QpdgbLedltfuEtfgWQlzaMp5H5vJxsx8SxHKzb/VSpNsjKNXUv/pE+isszwQZCrEW8L8jvfWfuWSRDsUo9WOO+HxPuNO1krGhIX+u4lB69/VXS0o9x+YRyuyZehku6klcgVwJtpfZ2plaucZtxpCFrJh/mH0Yn2nbDqZ9pKPrRdM54T3CZCmtov6tJE/3R2D4jKpBtGDqd0Pg+C5D07CT+ooP1iOLhRfF5k6/tvm2xMU/PrWzDXEsa7Yb0NZ7nvGwMDZswu1ia1X6o1nmdTKKmh4AUgM2pY2YucHSLCi482fxiHpsH8kItNIQnU+35bFs57yhM8Ds8YXLvysdaFUXSlyREyIjD4MDRIrfoHDKOmTlrwD+ve6LR0CPAtnikHHoz/vP6kJNB7PyXedjXGUGlrqs36JVQPKlC+Rh7yBQ5rz1iqwGAQbYsa6Vs+tQQdcl2Q6Dlcmep2SZXfSK0wGjxW6GMpIxV4L/eMDppsUzuEsTedqshS0WyA0YInnG3D2KczqNQJVJdVcjs8QP01gu5QUAkFx1LYLZRHE9e43lxfI8qwpuWuugP5jE3B/rsVocEhSeufhWz+LP94u26gcxCRCwq9J3NbNQMyHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(82960400001)(26005)(6486002)(508600001)(6916009)(54906003)(316002)(38100700002)(4326008)(86362001)(6666004)(66556008)(66946007)(36756003)(6506007)(66476007)(5660300002)(2906002)(8936002)(8676002)(83380400001)(1076003)(2616005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJKREErSzhCaFVxbzAwRWRXSGRGWlhSNmIydDZVWFNLWU5pUzh6cmxQK2oy?=
 =?utf-8?B?Z3JoUzJ1amZvNlZoWE9aWmwyVHo5cmxKalduczJST2dtR1ZWWTJKU1dwaC8x?=
 =?utf-8?B?YnY2VmxQbzlWc29kTWJoazhUUzViODRZOUwxYkowSDlMZVVvYXpvOFprbjll?=
 =?utf-8?B?UVRUZzdHZjRuSGxxWGVIbW9vUkZETmFYUWpVLzVuWkEwUUx5VW15Ny9KZTZ2?=
 =?utf-8?B?eTU0QTdyTGRraDNJa3hZZjZqQWtROURjaVM1TGFCUVVYcWRWTlI0QzJpeHBU?=
 =?utf-8?B?aGVUaVVlam9jbjNEMUJKVnEvQmNnWWFGbDNGUzF5SW1TQ3BIN0JtaFIxZktv?=
 =?utf-8?B?Vm9nZEVwUVh0akV5endmVkxHaUI0S2h6a1o5Vm5JbWpJa1diaFIvRGpmQUhw?=
 =?utf-8?B?OXVER1BzZ2Y0SENkKzRFVFFNU2VyYS94bnRRcmlCcEpSRU1JUU1yM2xJSTVq?=
 =?utf-8?B?aVZyOTQ2d20xZ0pCYlVYc1hBRTV5dFdrQ1FId0pNc2grcTIzcURpRVRRQ3hh?=
 =?utf-8?B?Nk44bWlUN3FVS20rN29heFJCdWZTVkVWS1B3UllYYVZaU0FZVUhtZFBUbTdH?=
 =?utf-8?B?OHYyKzJJTVNPZ2pKbGk2amdLOG45ZHRJTGV2Z1plcVNYSGhmTGR1Zml4Nmov?=
 =?utf-8?B?dzJPaXg2MktRUDJMREV0MndEc21BVnNld3hZSk43S1RPeGN2YzAzbGVNOXlI?=
 =?utf-8?B?MTNvWnFlSHIvWDcxdmVQSFpVVE9PejBpS0REYjlJa1dyRFdmVmdjMHpPNTFM?=
 =?utf-8?B?NDdUZDZHazIwUlRxZklKUWhLVWxiNUNLOTZZL2d6djNTZ21vQ2FkSmJ2bHRO?=
 =?utf-8?B?RkhxSmdtZHZkRkczNEd0aVNsTEp6aHE2K0hoRHhMTzhuMWtvdE4rTmRFQVJ6?=
 =?utf-8?B?SlhSL0Joa3d5SnR0YURBZ3JWZ0V4M0FaRGFheW5RNThvSW1ESnlUQzRuUldp?=
 =?utf-8?B?VlZzWXZjU1AwQktNeGxLS1NyTGpob01kdHlWYUNlSGRpVmVBRlFFM0JRTW5i?=
 =?utf-8?B?dWtQbHQrdEM2Tm1UdW1rRjVQZ3FFYngzR2FlUGRzdldvNWpLc1BOUllwdnkw?=
 =?utf-8?B?OW8rOFRSOTNQa0hYVXZDejdZeGpiYWZJK1NRTUNxVzJpaUlCYUdWOHhxTC8x?=
 =?utf-8?B?MytoT0NmYi93N1BUSlRvZEpYSjRrSmF1WTJlZ1V5OHkrQmVjdTR3OGwvVURM?=
 =?utf-8?B?MC9KbzFZVndVdjlBQ0Z4SHpCU3g3dG13T25rWTFCaTJJd084ZGdPa0ZLeXoz?=
 =?utf-8?B?R2ZQZVFXV2NmdHZGZStJRyt5T0dsRHJOY2UvL25zbWR4OTdYK1hPVVFDVzFH?=
 =?utf-8?B?RGxQMkdxWUFqTU9zVUhLeGRXbUZXbkRabGdSZEJHTVRnYmZhZ05JaVFQYW9D?=
 =?utf-8?B?eFV2cXBXNE9PQkM3Y25xd2lLOG03ejJZaTM1ayt2cWFKc0c3STBiclJRckZ4?=
 =?utf-8?B?Ukd4L1FNK1hqRE5mcnRzbUNHVGhyWWU3UjV4dklTN0ZUVEN6ZmxHME9rcjZx?=
 =?utf-8?B?V0ZFNnRjNUM5eWtLTDhXMnVFNXB4V3hydm4xMjJQRTVuNEF6Q2tmWHM4WWli?=
 =?utf-8?B?UVdXK210U0ZUTGhUVThnRVRxd25KREdSQ3FQZlY4SGQ4REYwVFpDcWxsVEJt?=
 =?utf-8?B?WWk1d01qM3NrTjd0U3RoZU5mV3d0ck5TaGhKNU1BRGVvekR5RndaRlYweXR5?=
 =?utf-8?B?V0xRMzZRL2VtWjhYcGdNNmhZeFRWdXRxNHU0L1IzNnhGZkh4QXQ0OHZ1MzF1?=
 =?utf-8?B?OE9RTE9vTk5SdkZxbk5nWEFWY3Z5UjFYWGtjdEF1cytaZGVKUXlHSEpxb3RP?=
 =?utf-8?B?eGVLR2thNkQxaFdKTStZQjkrUUloRDd1M2tTTFVqWDBzUEdRTWRpZldKNTdl?=
 =?utf-8?B?M2NiRE1teDYrYUhGYy9hbTh3Wk9JaGljMTF2T0Y0VlRxTjlIZWlHYklBb2E0?=
 =?utf-8?B?RjhSbWM0MWRCMGZzQk9GQWtubDZhNzVBMjZIc3FiRG0rZ29oRGhuL0l1OUsy?=
 =?utf-8?B?UWluKzZXT0FtQjJBT0ZaUzVxNzZyb282eTFJcDd4WmRIRmU0ZDAwNmxOcnd0?=
 =?utf-8?B?V2FaQ0c3RlpCZ1J0UXByODk2Q0dqNUxyTjEzeUdZV2p4L1NnL21YQ3ZtVkpm?=
 =?utf-8?B?TkN3cXJXcmJVRG1LZHpMMnN1L0tsdS9HRmt1bHE2VmVYeVFyS1NYOGttV0Uz?=
 =?utf-8?Q?X349z9KpTHpU1zGx5OsMm08=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac78c45-a56f-4859-078d-08d9fc52d3a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 13:44:51.9942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0oqgrGbcNrhugkfQU61iI3m81yFT09p0vKS0W6ukPbDZHYRjLka9R0nUhGr70TI0SrqiDh285P5cDcfmMj9kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2251
X-OriginatorOrg: citrix.com

If livepatching support is enabled build the hypervisor with
-f{function,data}-sections compiler options, which is required by the
livepatching tools to detect changes and create livepatches.

This shouldn't result in any functional change on the hypervisor
binary image, but does however require some changes in the linker
script in order to handle that each function and data item will now be
placed into its own section in object files. As a result add catch-all
for .text, .data and .bss in order to merge each individual item
section into the final image.

The main difference will be that .text.startup will end up being part
of .text rather than .init, and thus won't be freed. Such section only
seems to appear when using -Os, which not the default for debug or
production binaries.

The benefit of having CONFIG_LIVEPATCH enable those compiler options
is that the livepatch build tools no longer need to fiddle with the
build system in order to enable them. Note the current livepatch tools
are broken after the recent build changes due to the way they
attempt to set  -f{function,data}-sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Makefile           | 4 ++++
 xen/arch/arm/xen.lds.S | 9 +++++++++
 xen/arch/x86/xen.lds.S | 9 +++++++++
 xen/common/Kconfig     | 4 +++-
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index ed4891daf1..bf14a9bdd2 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -269,6 +269,10 @@ else
 CFLAGS += -fomit-frame-pointer
 endif
 
+ifeq ($(CONFIG_LIVEPATCH),y)
+CFLAGS += -ffunction-sections -fdata-sections
+endif
+
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 08016948ab..1c7c7d5469 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -33,6 +33,9 @@ SECTIONS
        *(.text)
        *(.text.cold)
        *(.text.unlikely)
+#ifdef CONFIG_LIVEPATCH
+       *(.text.*)
+#endif
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
@@ -96,6 +99,9 @@ SECTIONS
 
        *(.data.rel)
        *(.data.rel.*)
+#ifdef CONFIG_LIVEPATCH
+       *(.data.*)
+#endif
        CONSTRUCTORS
   } :text
 
@@ -208,6 +214,9 @@ SECTIONS
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
        *(.bss)
+#ifdef CONFIG_LIVEPATCH
+       *(.bss.*)
+#endif
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 83def6541e..81bb608151 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -88,6 +88,9 @@ SECTIONS
 
        *(.text.cold)
        *(.text.unlikely)
+#ifdef CONFIG_LIVEPATCH
+       *(.text.*)
+#endif
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
@@ -292,6 +295,9 @@ SECTIONS
        *(.data)
        *(.data.rel)
        *(.data.rel.*)
+#ifdef CONFIG_LIVEPATCH
+       *(.data.*)
+#endif
        CONSTRUCTORS
   } PHDR(text)
 
@@ -308,6 +314,9 @@ SECTIONS
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
        *(.bss)
+#ifdef CONFIG_LIVEPATCH
+       *(.bss.*)
+#endif
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } PHDR(text)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6443943889..2423d9f490 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -353,7 +353,9 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && \
+	           $(cc-option,-ffunction-sections) && \
+	           $(cc-option,-fdata-sections)
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.34.1


