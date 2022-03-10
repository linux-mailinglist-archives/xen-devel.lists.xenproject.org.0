Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD314D4CA4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288429.489061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKS8-0006fv-Lx; Thu, 10 Mar 2022 15:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288429.489061; Thu, 10 Mar 2022 15:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKS8-0006e6-Ig; Thu, 10 Mar 2022 15:11:44 +0000
Received: by outflank-mailman (input) for mailman id 288429;
 Thu, 10 Mar 2022 15:11:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSKS6-0006dy-Jg
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:11:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a94fb2e-a084-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 16:11:27 +0100 (CET)
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
X-Inumbo-ID: 5a94fb2e-a084-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646925100;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6lltD7RbU95+l7kCtzVlCPCZzcfOoZJ1ClNq1SLzFtA=;
  b=g47g8Ud7NYp0zPcnzbHympIqIUhoKJcTGbJGW12EliY26ZBE5FPmpyVS
   qfj+zACJEzsiFQ/MzggWrZNrdUG72QZVlLfe4IFQdD6Gp8HcKO08FOIu1
   kkM358hJS1juO2paMjKXR9v0XsMJt4doStoAhGa7FiiSnpCbKMkVsgco3
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65923541
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Awc0qqu1g6peyPfyPthiAG928ufnVE1eMUV32f8akzHdYApBsoF/q
 tZmKWCAbP/ZZjbyfdhxOYWxoBgH7JOHmt4wTVA4pCgzFyND+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jU4
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9qFZTspOYGbyUHPHhQIKRl6Y/uIGqW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ptDMmczNXwsZTVEOnQ4BrUEldyhoWbPYSVK8wiOpagotj27IAtZj+G2bYu9lsaxbclSk0yVo
 krP+m3rBRdcONH34TmC9GiliqnQnCf4cIUIHba8+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixRUM9bgJDc+Aa6+BvayEj9
 U65ttL7LGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTXHo3h+5nzu5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518PtMIKZyDyM/8pC25UNyjM5fKwfTgCfqqIBuein7ArLFPXlM2QTRL4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcuv+pINKbLbfFYO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hShT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:LY3bUq1tWlepBLGz/kzbZAqjBURyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngxObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lh1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESkti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAw7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1UwKpsKuZOIMvG0vFoLA
 E3Z/uspcq+MGnqJEwxh1MfjOBFBR8Ib1e7qktrgL3m79EZpgE786Ii/r1vop4xzuNCd3B63Z
 W1Dk0RrsA3ciY3V9MIOA5Te7rBNoTyKSi8Q156Z26XVp06Bw==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65923541"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku3shC2bPTrgLMREMU8NyTohcyWMBscyT8JIY67udoJsN0XCeYHDOX7inl9qlFmKK7fuAbFJ8jzm/XGhQlltv+uwEmsNGUldZ10unzWrRA+9P69xO57bNS1k194HhLdyDEZhQ8pF8sB3Oid02c87pMC7R1HxW8RKgSAGbJaHjOB6XTyoWuTHFUvJURKpdihS7AajPAOzwFBUNe+Lytl65CRy9/kCbztEQ8O0Nap9pVlTtdSNoayvnaJrFFTIhruxiAcSWiSbtOFQ8ixZ08A05kqBiwFQbNqv2WWHXmIQABaZEcHLQ5uUWCMhq/IdFeWvU922WlddyXJ9+JzvhVOjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTx68lV40wpFf4puUT35jyfriJILkHHvN0WT+lMixn0=;
 b=kRTXGH9G0q8xXMV+wSU73TaBqOjmgCGQPcl7V9Yi4+fHQqSxwmx9q8fXnvjgDlTrVz1mEq6qJE0thoIY0YKTTj3zlaOvpIqAXerHgEwlUWZL/T2WESWFBAYYG13mN56a7HEPxrOTXJOIXtAt89jyPqp+B4t7vMRSF8FfgULruZyfzOX8ATRMRQgt5rm2ctC88PqLjUQNEqIbpijEGBNopOpU/767rMXcHyQfONbOd5WJlGvctXbZ60OGMkEmspIAB5lLsNMMXC/3SbLXqS7bAJ/twXJkHnYUUUFphYJb6vQxxwtam39bxIYhpwTPPKvbxR0p8dMc218lV1v9MxBwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTx68lV40wpFf4puUT35jyfriJILkHHvN0WT+lMixn0=;
 b=Rg3UuVfFu8RzRlo/MJIAjk5ttEqtSFouSyxi04V2X+vBBlrfd5NSH2/7DAHVPDUHH7m29LvtnykyfNs2vAB+FL1xvjHzPaeJc7UUDse/JHpXCVHGqo/PVGq+U/NnYvE+bP1uHETNKE2J9Mn0P/wYzIjvjgu/cKfCcbbj4jWbUUo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <doebel@amazon.de>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 0/3] livepatch: further fixes
Date: Thu, 10 Mar 2022 16:08:31 +0100
Message-ID: <20220310150834.98815-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec5b8b5-3e52-411d-efb5-08da02a8439b
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5758:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB575862DBBF0E12D77ACC92E68F0B9@SJ0PR03MB5758.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjhFNi+3w6qiie0Pu5dCKAY299vOuXeL6Pd+CFHOmx+hDF7fF0hDxjECjKxIOrrdG6NcWy29YLH7bhdHIoIYFdRZmNl38qXHEHBEEV+BxxHuEPsvWfPsV7AwARYNljz6B7KLf1F35WV7gJO78tuCvciFbt/gZjVsmP0CXFOlulRv37nrh5u91EVQZdED6ir/R7GWqC+tsYA5cVBVqEUQdTeY9jvZKjKO1YhrrHSR0vbzy/eT3jkiD7L6xyK9l+oCYD8My6Yox5A04iWLQXPh6jCZ7wi235FstKo6CR845dvneP1cI7zLN3Ctgen2jh9cLZaukAvdYe8GcYGXkltw9hBQfbx7LcoEpqt3r5D/uPw1/lQTxI5b/EbBcJq609CFQTISiUbOUfhvexASJZBq/sUYBG0COxrshks+uHYpIfHCGbttQA41tHMR2qbNFR8ReeSYBDpFOk2/U7L8gejuVDc6pGMHKdQOHJvu2kbvqgNR+bFnjVP0XcTKCbGU+PQ77OfgqruJE8rabypzJ3KZ/7yaOWv8Xkdke6JqpN9D7T33S/H/JzivW4zfMyNO2AtC3IJoBvahd67WOeOp/4JJY9GhwvdRlJjEWuOQAjBS/X6uOcQWNT3i1Tro21wcaGfWiMVUIAon0WvkFJx54x7Gsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(86362001)(1076003)(186003)(2616005)(6486002)(508600001)(107886003)(6666004)(6512007)(6506007)(38100700002)(83380400001)(82960400001)(66476007)(66556008)(8676002)(66946007)(36756003)(4326008)(2906002)(316002)(6916009)(5660300002)(54906003)(8936002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFF3b1FtNThxUkxKWFhULzg0RUdvUS9OTEEyR2cxMXZlY0ZqbWI4UVdEWitY?=
 =?utf-8?B?ZTJ4THlwRCtoWWU2V2tOSDg2aGxOcUxiR2Z1OWgrRzlpbmdRM25nam9mMUwx?=
 =?utf-8?B?d3RxbFQzNFlORHJ3MW85RHA1WkdCKzdXY25BaTFKdEZWazI4SXhrbEZpMlk4?=
 =?utf-8?B?L0hETVR5UFBrRVdHU3BTVmFLSXlnRjQwdkdKQmh2cnB6QndPUExmd3dEeG40?=
 =?utf-8?B?YjMrZFNqSUJ4RHp3R25zY2lIYVlSbFNtbThVZ3ZIQjlmNVFsWmRTQnNwKzFa?=
 =?utf-8?B?bzdxb0hMMzNvMysybnNhd2FCbzZNTTk5dWRienI5RWo1NDI0aVhZSmQxNjUx?=
 =?utf-8?B?ajhoS3MxYVF1eW1hQ1BNRkJJQW9CSFR4RTJoSHRwQXo4R3cvWEphem52cUYw?=
 =?utf-8?B?OUNLSEo4b0FwU3ZlbEt1a2M2TStud0JxamxtVlRpU0F2UzVHK0R1OWd5aUNr?=
 =?utf-8?B?SEw4WHVQZjRucWpoeGZHd0RsOUNUV1RuV0VCS21NY0pnOEVBaHdZWm1MUFMz?=
 =?utf-8?B?N0dPMUFtS0lHSU9HTHc0R1RTN2l4RkorNGRWbzJEZlZpcDFYeHJwNCt4b3d0?=
 =?utf-8?B?ZlVMVGRENkxYd296blJYOHduZ0N3Qkltc2tteXBnUDBTeTB3YlRyb3VISjda?=
 =?utf-8?B?RzNFSDZHallWRWg2MzhSNnZoS0tHRFhta3M2RzN5eTNwWDlrL2pwRit5TTBm?=
 =?utf-8?B?WVFING5oZ05aTEQ4R3J0bVZZZ1dWSkhwL3hQNlMvNUdha1dWdEU0ZXFCQVU3?=
 =?utf-8?B?YjRrK1dVQ0t0aVdvVjc1d205Q0xmV1pnbUZ5ZS85MTBmS1JLSlJlUy9LNEk3?=
 =?utf-8?B?b3BIdW1WMCtJMEY0aG5YSWxDSjg2cGFaajRjL000UkkzVWpwaFphZmtyUk9j?=
 =?utf-8?B?MUtTVCt3WFN2OEcxaCtJUWtjaWo1cy9uWHRKaVViWDRxRkNzeWMxYTd4clFo?=
 =?utf-8?B?N1pFYlptMUcyVVhxbFdDZnRIM2FWUlhnNktkenJXQWRSYW82YlJKYWpFcWJi?=
 =?utf-8?B?NnV3VzhGYTRMS0o2TFg5c0ZvQk8wamZYVERXMkV4Q21IU283QUxmZWlhbENL?=
 =?utf-8?B?MUltV2ZBSzJjMitqY3htbitZUnZHdlhtckY3aDBrMkJOVklKTGZONDVYY0sw?=
 =?utf-8?B?YUhLbTk3RC93Q2VKdTg2WWdKeHlCVlIrYTlHMW94UnBNSWVnSlIzRnVORDdV?=
 =?utf-8?B?M1hXMmlUaitwQlNGQ3VRTmJZNWk2L0xxUWNHbjR4REFnZDY1d1VSS1BCYUVZ?=
 =?utf-8?B?MDhnTzZEY1JNRnpzZEhLWTNNK0xid2RDams2alR3REtqd2MyVUpLVUJ3alZE?=
 =?utf-8?B?UThLUUdZYy9NQk1zMkVpc0t0bW1HcFB5ZlZnRUdZSzN5UzN4VHQ5NWs1cnBV?=
 =?utf-8?B?NFk4NTJycldmbkc1THFNT1NSNUNkb3lIcW42Y3BXQ3RqWVdYb25ROXNMKzRk?=
 =?utf-8?B?dDV1eXZtK1FSYjZJa0oyeUdBeENQSW1qQ1ArUVNRZFdzMXJJRGpvUndKa1N0?=
 =?utf-8?B?UFlxNnRJWWFIZG1wSzZtOTQ0OERRRmJiOUJnallHdVdyVUtiVzJ5Mnl2VEpP?=
 =?utf-8?B?S2d3Qmw0NTRyM0F5RndUMUdhUGZRQ0FQL0w4ZUxyTzAxYUt5dlJUS3V5R0Q2?=
 =?utf-8?B?YkFlaUw2L3hQdnozOXBsTTFvT1NuRXlhWDV2eThSWExkUjNEb1NIV3haZkh4?=
 =?utf-8?B?STIxRVJSOW1WQ2w0UDZaZEFZeWMwZWwyajQwVGpOeHZJZFZFeXVZSUZENHpD?=
 =?utf-8?B?Ukdpd3dOOE1ucldKZ0FaOXJrUklQdS9uK3pSbmRtWUFsUzBoUkhBNGtycHpE?=
 =?utf-8?B?UHYxTTFEbHRMRDBCOGhNeExRaktEN2ZPSWdScnhsYysyL1FJTGRzUmlpVERY?=
 =?utf-8?B?Nk5JdHVta2lzZUZMblNkWmMyWTRDMk5BbXFPOEtTSFBBTTJjbTZNaGhqSyto?=
 =?utf-8?B?OFNHSVBHeWh3QTlwQU9SZlFYR1RkcElCem1odHY0RjhVVzhmMlRQcVhMSHkv?=
 =?utf-8?B?MmU3bVI3TGI2WkhwRnRzZktsT2Z2MktGT1ZwZk55YWhLRlV3L09FK3RPZXNL?=
 =?utf-8?B?TEFIYm1jRWhrc2ZEaTIxcnRlSVpRbFBPdTNyakxteE1BTEpBMnVqZThqT002?=
 =?utf-8?B?ZjI0aVVCNzZDSmFBWWxlZHE1SURBVE5hclV2eEh0eDUzUkVqQzczQlN5QURn?=
 =?utf-8?Q?Fd2wTq7qZUcDo6Ftj5++5wc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eec5b8b5-3e52-411d-efb5-08da02a8439b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:11:33.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf4norN1aVlENCPNaemOItMy2LvIud3/BJitIbUdfldPfH4scEtEgHF5gNW/lbfzniGczK/0zAzT/lOibJgIVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5758
X-OriginatorOrg: citrix.com

Hello,

The following series does some more cleanup after the Xen hypervisor
build changes (patches 1 and 2). Patch 3 fixes handling of .altinstr*
sections.

Thanks, Roger.

Roger Pau Monne (3):
  livepatch: use basename to perform object file matching
  livepatch: add extra efi/ objects to be ignored
  livepatch: correctly handle altinstruction sections

 common.c             |  7 +++++--
 create-diff-object.c | 26 --------------------------
 livepatch-gcc        | 14 +++++++++-----
 3 files changed, 14 insertions(+), 33 deletions(-)

-- 
2.34.1


