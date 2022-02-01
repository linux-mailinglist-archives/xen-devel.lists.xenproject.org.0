Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2E4A5C8A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 13:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263591.456353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsYq-0007x5-Km; Tue, 01 Feb 2022 12:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263591.456353; Tue, 01 Feb 2022 12:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsYq-0007tn-Gz; Tue, 01 Feb 2022 12:47:04 +0000
Received: by outflank-mailman (input) for mailman id 263591;
 Tue, 01 Feb 2022 12:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEsYo-0007t2-V7
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 12:47:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8d4151-835d-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 13:47:01 +0100 (CET)
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
X-Inumbo-ID: 0b8d4151-835d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643719620;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=fcvBghjyOGLsyacNTl2K0ZQIQ8llIMor2zIoZP1b0I0=;
  b=XJZ8fIvJLez9YM/OdT2P3aNMUbj3zyNr9IOXuuLhO/YDqNguvTaCyz6N
   3C/wUVt2ALPl+Hf6Ck+n52eCu/MuwMX+sAaSnZjSn+252cMt3GpBcT9Ll
   1KdIb3/ubvvMgJmnAp3jo18ZVnQIylGML7g+rMDYJ3XGDSwsvlffSUZB1
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aDnl8aZmYzlD/e1iSBLlAKimBc73T77SYCWbMLYOWZ0iEZw/h1aGoRBVLL95hv6DnJQCDKk48c
 157QFgoea88Wj2R6d6/NkdrejtCigeaj+nQRcfnN43sg2f5zxNtL/ebSBwm71waDV4ZhI2EV91
 3VJXbd+SNatda1X4BIG2DDbMGwoZY3R9SlBz0imYm3BPmcWiiagzMvD/NGZdLcbs5NwHHaEib+
 OS+OA/ALgwRPeEF6dF+nFBcWfK8qNpk9a254mFPE4f4ZTaInDdko0nuUK1pwBBVAAMjLg2db0y
 H088K1I/xodOkx+ym4JI5AM/
X-SBRS: 5.2
X-MesageID: 63213698
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mx+Sja20nvzn+IaX7/bD5U92kn2cJEfYwER7XKvMYLTBsI5bpzNSn
 GIdW2uOPq2PajOnedp1bN6//EoD7JDRz9ZqTAdlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7dh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhxslyz
 txWtMaLWB4WLLDNidgMYhhEKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4QChWxu15Am8fD2S
 Js5Vn1vZjf7XDJRH10cM7Imk6CUryyqG9FfgA3M/vdmi4TJ9yRzzbzsPdz9atGMA8JPkS6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTQIsPEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J/NtDC0MDMUd1QTfBAWUAoU38jSoZ0K20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNOtTwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R7n9hO0yT6FWy13N2YDB0zWirjUWSxC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFTarH42NRDBgzGFfK0QfUcXY
 83znSGEVi5yNEia5GDuG7d1PUEDm0jSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOcwxiBSVlVPje9pwGHsbec1EOMDxwVJfsLUYJJtYNc1J9zLmYp
 xlQmyZwlTLCuJEwAV7bNyk+OO6zBssXQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN02V1gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:kRgeYqngFXiroIzINVZXW0MYxW/pDfPAimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTM2ftWjdyRCVxeRZg7cKrAeQfREWmtQtt5
 uIEJIOd+EYb2IK9PoSiTPQe71LoKjlzEnBv5aj854Hd3AMV0gP1XYdNu7NeXcGOTWuSKBJXa
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWCSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLLhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqn3d+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm6UyRgXFohvD3pU1wha7VfaM0ld
 gsAp4Y6o2mcfVmHZ6VfN1xOfdfKla9Ni4kY1jiV2gOKsk8SgHwQtjMkfAI2N0=
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="63213698"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwBNZOtfBjpgXOHsT+FTLEjAKLkJi0RA6IDvdgL96xaWTyg8stvalAbeC5lmhcEuYvwizWymizcMYwZHXICYdDIJn3p6vCUF9qNgsoLUtY8jr34j7cKqOVNLl0jJegcFdPJMBrzEGAoTm/OtdRcVTMwq8rvlIc5fhURsAPsdZ9mhXkoLFryvOmxQodzeGVvnrqRxGNahlEPdAl9N+uaVEVLqbLtwl6xgzbZXCVJ8wsK506itBvqbJtyia/0lTkgqrleim1LEOZvXecgVQdInrQiBFESepidYkMsANQFYzFsF1imzVTePgdNOY9YykTC0hYq1Vo3F0jpiSqZa20wgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P87PdgwtgUt5chqcGUJFr35ftnlZ0XNCQfK47oOErEo=;
 b=mMH9rEjgcp3Az7wBGDlNChvrLgf03++6uOQOfDOlerz3pdYrBYhuKVl4Yp/fjYdBIDiSaFozztrVspgSFKcOs3XGGBlEx+o0LNzjHDBNe/xNQGydnQtazVDLk7sp9c7j3ymsjhyGS9O3P4B15KbjkahLQ0It9q0O7+8Dbi8/WispPaiRuss4zr9WVQQZHqAYwDswehuZt32liLNp2TYfg7d2dCQrFfGwbJX+2Zfx000txE4JvYq8Zt5RKTYFquMXBgy9IPNZA7GR5cd2UsxaPbpwHFj3wgFuszHVaM5J5Tp05rIjL/Svjr1Q/O0S+4D2HI4NITgEKFUpBLpQAIpDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P87PdgwtgUt5chqcGUJFr35ftnlZ0XNCQfK47oOErEo=;
 b=KBuLd3+FgATPQ2BO/rdHg/y+bts9/DeaY0wbmlIpOUY/m5NWiaRGZizPNIqiCmaf0Zk/ptEMd2AqNdBvUesjb1ktEI+uaHFc2vATyqGG3kv5DupdHzA043uRb/HNIHBfCVufYMAbiH1XR19JdXg/IQQPjdBeBoIcLTvHrrUtdJk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
Date: Tue,  1 Feb 2022 13:45:51 +0100
Message-ID: <20220201124551.2392-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 786d5178-04cc-4aaf-b5a6-08d9e580e196
X-MS-TrafficTypeDiagnostic: SA0PR03MB5467:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB5467320316F7BC709FF46E6B8F269@SA0PR03MB5467.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0I9L4x2ZejPbuc8jqiF0XCLtBSCBx23Mbd6q7179sAPV7jKPczH76nvu/jiz5dfJzGMBxtotwYqEnF5xcnNipdWrTMyGuywtesX1iynE4k8txkRcHvMPmpc9E59PrtCLi4E0RIRPV/ridoBjUwqco6+JAvWtQ6Aks0yHev/DkMpE85FhLPhJqErCzwEkbMU6BUDWq1cWP70xqC1pCc3K6fKO2cFiY7rKlpPbWRA9ToxY0ERV3rSJKhFoJdKW3DiAD6u3Vy1ZlzkKUlkJFTh8pVpSJeVJnrjxisNle6HWtqiN/yayeenjrk/ItGdJSbX66lPgyzJMoAA1XuYEmWyqP10ij266kq0nGAHPgzjzHIWnaI+QAYmQw5BzcnVCiCfDr2AmslLA1Bq2x2XSRv6lnVWZX180nfPRUW21EFL7lWBWiQHe0p+gBgd0Pdeyj53m8Rru/qe1XJtlVj7UjQVpgCm2AqzLjt0LQHo6Jc65BZ2jRvmsl2rt9AKwXX4djvjZNSt+Iw7h5Go1ecIgr2lMu8JynBot3eozFfElY+IfblbA+7Ff0pHc1QJy59O4T0gJ13r38heDsnAl4l7TFAmK2PZubStAAw8MCSrF+T0bIT1HWFvRu7QDIUHpQjuRFiKCJQQ1D1NP4Z2YdzrCbMhTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(5660300002)(6916009)(54906003)(2616005)(6486002)(6666004)(316002)(1076003)(8936002)(38100700002)(66476007)(26005)(82960400001)(36756003)(186003)(86362001)(6512007)(4326008)(6506007)(508600001)(66946007)(83380400001)(66556008)(8676002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3FlS01uVUNkbE12K0Uwbmtua0o1MkZDN1BFdEZKQ1BQV09ha0V4a3YzYy8x?=
 =?utf-8?B?bkhxNThCeTZHTjBIZ1ZpSGQydm1sWGFlWG1IemhmL0JwOEdYeUVjdUNaMjRB?=
 =?utf-8?B?QU1LUnJXUkZwZ2h1ejVQeUNuUHVOYk1jRFovNDZxQUpoTGtYWWUwdGo0U1NZ?=
 =?utf-8?B?RmFsYlFuU1h0NExxTzNtQWl0NlhDUHFzYkthbmV4SExDV3Ayd2ZNdkxrL3A4?=
 =?utf-8?B?dFNaYVVtUjdIazZXb2lHb3hJWExCMnowTkFnTWJFdUcrSjdrbktjTExtYzVX?=
 =?utf-8?B?Mm1rZ1B4OGRwQnlnWWhxNnVJMUZJTEppbCtqUDJTdDh0Q1U3V0c2d3JndURn?=
 =?utf-8?B?TkVHTENMNEJwL2lEcVhoSHRLRkRyN0hGenNnNFBoekI3SDF4ZHFPVHI4UTFK?=
 =?utf-8?B?RXNpUmNHQnJkUXFaMUovWGxuQkFuZWpmbFBWMXB4T1ZRcjVuMFVvMElLd1pS?=
 =?utf-8?B?VmdYQmVFV2V6alVHVUtqK0YrUWx4Z1JxakIxZEhrM2lDM010QzA5cWI0Zndo?=
 =?utf-8?B?S2dnK0VsRDlGQ2xjTG9Eei9mNWRkTzk1TWhzR1U5Qm13SW9jQ0JBWjNxVXRC?=
 =?utf-8?B?UUFITkwrMzR0aFlrNDAwcCtwZHFhVzZ6Mi9FU1krUWN0TUZzSHN6YVRFRnZ6?=
 =?utf-8?B?NC92YXEwZzBVTUhGS3dJSUtjVEE5S2s5QTgzRDVrQjIrZlRvNW5rbFQ5cm0x?=
 =?utf-8?B?S3p1OWU3bTdZSks3TXRxKzd4THYxdFlMVTMyQ09RSGcxY01yU1dGRWF6QjV6?=
 =?utf-8?B?SzZvd2hQR2Z4UmlZVVQ1dWZHdVB1L2dYOGRsVW9DMUFJdkNTVE0xbjByR01m?=
 =?utf-8?B?SnRUZUowTldVbmI3SHkwNU9QV1lSalpzS1gwZk1CRkpnUS9xMk5DR1JmWGMz?=
 =?utf-8?B?ZlI3bU5JbFdDdmNlenNZZVYyWCtrRUQwOWhDcVpiYXlJOEdQcDQrYVdIQmFm?=
 =?utf-8?B?NTJwYSt0U04vYXVNa1FFQjNmNTBHMXpQTFdqbjU4cWVjaUhuVUFJTnRIQ3ly?=
 =?utf-8?B?SXdzcGUzV1ZRMjZTZFIzV0pmMzJ6SHJVMytoKzdYZi9ZeldsTzB5LzFYWGVL?=
 =?utf-8?B?aWczeStQVUtaaUVZZGlwU0dUQzgzVDh2SWcrWVJ4Zm5VaDlLOVEwaEdNeW05?=
 =?utf-8?B?SjlrbGdaT0FyNitmSGdYUlczS1F1citwVmhXQkZvT0ZSNHBVemMxc05jY1FO?=
 =?utf-8?B?dFVqWi83T0MyZkE2cXpEWHZLV1JqK3VFNHdZTlp2SStBTllQMUh2eFZiK25U?=
 =?utf-8?B?SUkyRDhVWVFJdkZLckJmcEpwb1JVYVd1Yk1SWDJuOGhEc1VOVjVpZGtjYWdE?=
 =?utf-8?B?Y1NRQUVIUVFhVWMzSHZlcGcrSkJvSm1xdnZzTDVBaGl5RGxkZ2NuYkh1VzVT?=
 =?utf-8?B?ZVdaREVSaFpyRWVNaHd6SjFqRk9pSDg2UnBVQ3o1SU11S2N5N0F5VXY2SmpR?=
 =?utf-8?B?TDBqTHFjQW5Nbk9tNFFPQXpYSU95cStQRzVKZ1Q3ZjIyWTFaREhDTDJLOXFr?=
 =?utf-8?B?T3VwMldlRmFOZ2pPcHI4eU9TazY0cDJWUnk5bmxNRUV2b3pNRDg1d1lIS2pv?=
 =?utf-8?B?ZTBFY0phVW9iZ2hvSWh6VThaMVdLaHpLVE5kbTBHdVdQWnlNSjhiN2dpcWt2?=
 =?utf-8?B?Vkx5ZnFhY2trVmpuSTAyc3NLY1BYaUNodFV5VW95MzdRMWdReWdkTXlkT092?=
 =?utf-8?B?czBSMEFsZjQ2RzFKbVdFMVdQNTBUZzlNalFWTjNRbGlCanMrNFlwQTdsaFhj?=
 =?utf-8?B?ejZBUzM4S2t6UmozRjlxeFlWWWRkWUpYZmRtclZoMjZudDllSmpUQVk3akhC?=
 =?utf-8?B?V1VhSldjL3k1b00xaENtUWxpc1hpbWZqSXJ1biszNmdjMFFPMWp0QXdGd0t1?=
 =?utf-8?B?RXU5dm9tZVlERTBHakhtYXU4TTY2NWRyV0NkOFF6b0RONjljNzd2Y2Rveklx?=
 =?utf-8?B?dk9hbys0QUt2TVNYNzRJN3NHOUZRb3o1YkgyV0dWU2ZYcXFpbkZ2aTlWOWxw?=
 =?utf-8?B?eUZkV0hZUElZcjRaak1qVmwzNEN1T2k0TVkrWVJvRUhFdVpSNFdHajczY0c1?=
 =?utf-8?B?QzhuOG1CbGpaN1JVdFBGbGJxL2ZHSjVmODNjR290czRXakdSU25hVk9QdzM1?=
 =?utf-8?B?Uyt6REgxUXQ2dUVWeFdMTWpxbU43SSs1VkZXaHRpKzU5QVd0TERPUHYxM3Y3?=
 =?utf-8?Q?s5bNFRT78M4DiOD5sFt/81Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 786d5178-04cc-4aaf-b5a6-08d9e580e196
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 12:46:35.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6rMZR9UHWJ3SuI8X5L6xrPdHViQLmMQBgE84bVuCBbzKlvJaOAYvYtKdaZ0JxQZXIMepAV/+a74mMRgNH+ETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5467
X-OriginatorOrg: citrix.com

One of the boxes where I was attempting to boot Xen in PVH dom0 mode
has quirky firmware, as it will handover with a PCI device with memory
decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
with a RAM range on the e820.

This interacts badly with the dom0 PVH build, as BARs will be setup on
the p2m before RAM, so if there's a BAR positioned over a RAM region
it will trigger a domain crash when the dom0 builder attempts to
populate that region with a regular RAM page.

It's in general a very bad idea to have a BAR overlapping with any
memory region defined in the memory map, so add some sanity checks for
devices that are added with memory decoding enabled in order to assure
that BARs are not placed on top of memory regions defined in the
memory map. If overlaps are detected just disable the memory decoding
bit for the device and expect the hardware domain to properly position
the BAR.

Note apply_quirks must be called before check_pdev so that ignore_bars
is set when calling the later. PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS
needs to be moved into pci_regs.h so it's defined even in the absence
of vPCI.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Unify warning message and store in a static const var.
 - Rename checker function to is_memory_hole.
 - Pass an inclusive MFN range to the checker function.
 - Remove Arm implementation of is_memory_hole due to lack of
   feedback.

Changes since v1:
 - Add comment regarding pci_size_mem_bar failure.
 - Make e820entry const.
 - Move is_iomem_range after is_iomem_page.
 - Reword error message.
 - Make is_iomem_range paddr_t
 - Expand commit message.
 - Move PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS.
 - Only attempt to read ROM BAR if rom_pos != 0.
---
 xen/arch/x86/mm.c             | 17 +++++++++
 xen/drivers/passthrough/pci.c | 71 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h          |  2 +
 xen/include/xen/pci_regs.h    |  2 +
 xen/include/xen/vpci.h        |  2 -
 5 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1397f83e41..468efd8fb4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
     return (page_get_owner(page) == dom_io);
 }
 
+bool is_memory_hole(unsigned long start, unsigned long end)
+{
+    unsigned int i;
+
+    for ( i = 0; i < e820.nr_map; i++ )
+    {
+        const struct e820entry *entry = &e820.map[i];
+
+        /* Do not allow overlaps with any memory range. */
+        if ( start < PFN_DOWN(entry->addr + entry->size) &&
+             PFN_DOWN(entry->addr) <= end )
+            return false;
+    }
+
+    return true;
+}
+
 static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
 {
     int err = 0;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 1fad80362f..9a5e6cf842 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,6 +233,9 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
+    unsigned int nbars = 0, rom_pos = 0, i;
+    static const char warn[] = XENLOG_WARNING
+        "%pp disabled: %sBAR [%#lx, %#lx] overlaps with memory map\n";
 
     if ( command_mask )
     {
@@ -251,6 +254,8 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
+        nbars = PCI_HEADER_BRIDGE_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -267,11 +272,75 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
+    case PCI_HEADER_TYPE_NORMAL:
+        nbars = PCI_HEADER_NORMAL_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS;
+        break;
+
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
+
+    /* Check if BARs overlap with other memory regions. */
+    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
+        return;
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
+    for ( i = 0; i < nbars; )
+    {
+        uint64_t addr, size;
+        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
+        int rc = 1;
+
+        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
+             PCI_BASE_ADDRESS_SPACE_MEMORY )
+            goto next;
+
+        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
+        if ( rc < 0 )
+            /* Unable to size, better leave memory decoding disabled. */
+            return;
+        if ( size && !is_memory_hole(PFN_DOWN(addr),
+                                     PFN_DOWN(addr + size - 1)) )
+        {
+            /*
+             * Return without enabling memory decoding if BAR position is not
+             * in IO suitable memory. Let the hardware domain re-position the
+             * BAR.
+             */
+            printk(warn,
+                   &pdev->sbdf, "", PFN_DOWN(addr), PFN_DOWN(addr + size - 1));
+            return;
+        }
+
+ next:
+        ASSERT(rc > 0);
+        i += rc;
+    }
+
+    if ( rom_pos &&
+         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
+    {
+        uint64_t addr, size;
+        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
+                                  PCI_BAR_ROM);
+
+        if ( rc < 0 )
+            return;
+        if ( size && !is_memory_hole(PFN_DOWN(addr),
+                                     PFN_DOWN(addr + size - 1)) )
+        {
+            printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
+                   PFN_DOWN(addr + size - 1));
+            return;
+        }
+    }
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
@@ -399,8 +468,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
     }
 
-    check_pdev(pdev);
     apply_quirks(pdev);
+    check_pdev(pdev);
 
     return pdev;
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5db26ed477..c434a53daa 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
 int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
 /* Returns the page type(s). */
 unsigned int page_get_ram_type(mfn_t mfn);
+/* Check if a range falls into a hole in the memory map. */
+bool is_memory_hole(paddr_t start, uint64_t size);
 
 /* Prepare/destroy a ring for a dom0 helper. Helper with talk
  * with Xen on behalf of this domain. */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index cc4ee3b83e..ee8e82be36 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -88,6 +88,8 @@
  * 0xffffffff to the register, and reading it back.  Only
  * 1 bits are decoded.
  */
+#define PCI_HEADER_NORMAL_NR_BARS	6
+#define PCI_HEADER_BRIDGE_NR_BARS	2
 #define PCI_BASE_ADDRESS_0	0x10	/* 32 bits */
 #define PCI_BASE_ADDRESS_1	0x14	/* 32 bits [htype 0,1 only] */
 #define PCI_BASE_ADDRESS_2	0x18	/* 32 bits [htype 0 only] */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3f32de9d7e..e8ac1eb395 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,8 +80,6 @@ struct vpci {
             bool prefetchable : 1;
             /* Store whether the BAR is mapped into guest p2m. */
             bool enabled      : 1;
-#define PCI_HEADER_NORMAL_NR_BARS        6
-#define PCI_HEADER_BRIDGE_NR_BARS        2
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
-- 
2.34.1


