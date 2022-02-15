Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725714B6ACF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273046.468093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJw0q-00023K-B2; Tue, 15 Feb 2022 11:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273046.468093; Tue, 15 Feb 2022 11:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJw0q-00020J-7j; Tue, 15 Feb 2022 11:28:52 +0000
Received: by outflank-mailman (input) for mailman id 273046;
 Tue, 15 Feb 2022 11:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJw0o-000209-AI
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:28:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ff8d711-8e52-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 12:28:47 +0100 (CET)
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
X-Inumbo-ID: 6ff8d711-8e52-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644924527;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=cvKieyjM2SAPbaGogA/jzsoswbD55afhl8IwBBSwHUQ=;
  b=dmzawsEvwO8Lyq/Z3oPA2m+QiEjZmRK8pa4logg6rYrCHobpJzYFpVzO
   rVXNXs/mrC+TUtT9U9qo/ZOBHitRVnwaxh3TV4xh4Gu47FY3O1O2FCUNI
   1u694YxnuOa+4cYM8ibn9LZcoGNzQwwou3pTNyqGIa/KQrDuftY6uGQkZ
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dGa1dvm2qB/b8vpmNDeN2gCgUG0Gj2WBbn4PN1OFZXpuIICXpD/dvSR2nu4oHpjJJFGtWhkqJG
 OqfBRpjfXka8pfQm5uc7cCtXy0QRU8cEFPzSpSkycvn04pnokJnP20TgwdrFihPUC0Yy1BDq6U
 /KNFVCCuRK1m87NOdmqTOG9v6TPaw1dU3yWUF1D/95Lrjkajo/aAqIOFfGMHN+XVQprmpjC9ZB
 1XQEdgPA/fhlEehyDlSRIkxGpMrPxkwZNx0ZKdptB+B+Dx6IDWRxJiD6FCwdmAPrqr/m1EumlF
 ZB8tC0Eu0MQE9gIZrmXy1Wwp
X-SBRS: 5.1
X-MesageID: 64233069
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KUKjGalABBs8Lfkaiudjn7/o5gx/IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUWnUMqyIZ2D8KNB+bYm39BgC7ZCGx9RqQAZo/n1gQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OptlsLqcQ4vArTvocIBdh55Eg9cPrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls3JsVRaiPD
 yYfQTtPdC6aUzwMAWc0Is0yofeBvEvWeQQN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKg4eHMySz3yC6H3EruzCgyL9Hp4THbuQ9/h2jVnVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyZuFgaUtlZEew/4SmMzLbZ50CSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYU291enOlTq0BTE2FEkeQCglTCUn4Ma29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AQH83oJrW3FF5ufkWd4um8WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5Cq+EPocTOsEqLmdrGR2CgmbKgQjQfLUEy/lja
 f93j+7wZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeImu1/ItQ8xfwK/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9GH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:YbpmM61Z6R5RX6utSkZ7ggqjBIckLtp133Aq2lEZdPUMSL38qy
 ncpoV+6faUskdoZJhOo7G90cW7K080sKQFg7X5Xo3SJzUO2lHJEGgK1+KLqAEIWReOldK1vp
 0NT0EKMrPN5C9B4voSjjPULz9q+qjhzEnhv5a5855Cd3ASV51d
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; 
   d="scan'208";a="64233069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gANDWWIlaOhj2ED5LGcLvYmYWeFmX0XNJDDtHURKoI37YtqPaqzYvl9ndtR/r4b1SEl5svPaznaIpqyQv5xLPB5ec5q44cbzIGnxjIgqpGH8AvRfIW9a/Vsn/MlfkdtsYy6G/fewV3n+lOdJy3XUTXQhFnj3hjytqpujTkgXndd9vgaMdMjwygMJlcqAUjsdJ9Ci9Gq4l/bQQBZvvymraF7QFza8YU9d32QXEgsO8sddCp8k0mq30qkBc4WYPAVU2Uz5M90aaZiQ9ce+mFh+/dzEeXVoTorAzksv3vIfVE7KQMv+yfxPwfyWC/Nb/KxO3wlIw7aFtONDFk7/UVXJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSr8Z0lH9cOgDLnRQ/ZeXDRRLeFk+M9X/cjQ9dZMbPE=;
 b=YhIsDO82oI8bqoROWDKcu1SPxq9PowqODA2oDnUrTzlkkGZm52Xa2mSRqI6kHahLOCtP0GpRc8SVXJAj3p8kScKijy2FVB3g4R+0gNPIUTamPoqJ9cIy+MBWy0/Jqe7x26tkwtEzyeIXXCiNe4h5RgeWvPXMEzzJnrQfO63r1tY5ZGdp3AV8pvsFO5jyBVKBi+GWiJ9YKcS2hF1pVzoqvnikP8N2d+KKFZvPt11qF78EPXs8xvD3JyjRF/EI1q/ucUJK1VIkAxzkLuCx3MzczI8K1wOnK3IMhgnxFmuzY4/iwX2Rj8nuywvVQsWIGTLu1ZGHqcqFnF+dK9nVQz+8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSr8Z0lH9cOgDLnRQ/ZeXDRRLeFk+M9X/cjQ9dZMbPE=;
 b=b+hEAmt3rVEly2/unSXttrDcT5NJL1ouqzdvUDI1850p4pVbfwzce4ZHQZGxE6ynrHrRx+j85g+OEwJyorHt1ThUcX3KLeLZISCkMLL66Qrt2iyl9c2JIlv/O6TPdHL52Hcn1O53Kr0RyhXxdbqFr6bCNAEmnXf3Ylho/9K85y4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/vmx: remove dead code to create domains without a vLAPIC
Date: Tue, 15 Feb 2022 12:28:35 +0100
Message-ID: <20220215112835.99230-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0940c8b5-5449-48f9-1e24-08d9f0765186
X-MS-TrafficTypeDiagnostic: PH0PR03MB6721:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR03MB6721166F05C85EB88029B5388F349@PH0PR03MB6721.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hxTaC2/Cm5LGZiGzwswiDA21SZ0hErZ0WSHHUxzMV+SwDeR9vX5MO7CnjRRl26PNAnlO/88jrBwcBudkZxxjWpbJoF2lxQp3IRaetFWy8sefE2ZC7P3eaDx7I4p/ZmAKC41G/2b+70CUfgLD4l8UMyNVHUscTW0FnTYaM9oY6tWTLI6HWctn3Ua4qQiSTPAIPsbLbpUlLygP9GDbj+wkM012sVaRhntBKDur0OCktP+neH62pqFwMK7stvSURbATMLIYbHbZRTkxtWvuPKVa0IkQwIQWWkUaPI8QsBPeefQS8jRdBHy7WytDf0npI5uLaLYXmEen7n0EXW2ZLy29kGkTraNRMM6/pgYqwdnQBYj9chEL06B6Wsy2VOX1zN9VLtvrxlfe3R7q3Hi3X+90naYecyFSpTC02HwbIbZl33zIUZd++55P/izNPE8KwN0dthFu9nJ7M+4ZIh67UyDnu4BEUIqYueLnAesrM/avbN/uOiJ1kF9Cmi6RbU3b2++gXkRXKTDFP5/NpgoP/+UscU3tXRwEXiXIDCpKIvACS7fY7i97EfVMxcsaRhdq7pnhOg9HOv+uRVqlVUuRX1RwZquj3vV1TwM5v6kgvIh5A3m2Kaq81co17b6naXm3tFGA9R8fuvMxFIyDYGBwR+kBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(5660300002)(82960400001)(36756003)(83380400001)(26005)(2906002)(1076003)(186003)(38100700002)(6916009)(6486002)(86362001)(508600001)(6666004)(6512007)(66556008)(8676002)(66476007)(4326008)(54906003)(316002)(66946007)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2pIRXBNTitwVFRVNHJrL1pQWW40c1JuTVlyYVBvakFFM1N0MVphK01kMG1R?=
 =?utf-8?B?RE0xTDBtaUYrZDlGa2hMSUg0cExxRzhKai93MW5MSnJ0TThJOExsZU4vdlo5?=
 =?utf-8?B?ajhxMy9JZjhNNWpJSnJDNEFiM2JxNHJPREhHVXN5aWxINjBmNWdhL0dESDBj?=
 =?utf-8?B?c2FlOHMzRkF4SUZ6V2tzZFNRcWVUNEhWMndYaEtKOXQ1bDh3NkdOdTRmYlNk?=
 =?utf-8?B?YlBEZ0xDMWYrQVJjaFpMa0dPNjVuRXBMZmMrRGk4alJqNXNtdEkwQTdGY3l4?=
 =?utf-8?B?UjVvYTdySG1QV3ZxK1FObzVUdncwRUJKTDhpN3hKaXMxTk9nQzdIUldacGtz?=
 =?utf-8?B?MmQ0VUNpTXFqMHFsU284Z2ZlditjbjRGc0FGVzJRcktkZmRZcFZXQkxaRVE4?=
 =?utf-8?B?WCs1aW5vcXd3dDZvL3hpalpma2FYNUVpTjd6YVFSTm1vdW9Reld5bnN1Mzh2?=
 =?utf-8?B?UFlWOXZJM3dFV3RsMXE1ZG9pVzdOenpGVXljVWpINHRMMitWYmt2Zk1GS2Vj?=
 =?utf-8?B?b1kyS3JsYjE0bDNlYjhERDZlMW1IRFVORWZVWW83OENVU2daSXhMaFh5ek1G?=
 =?utf-8?B?cDBOZEpMTkxmTVdVeENRUzB0ckNWdFB3b2dtZXliaUJ6WDZRL0RKTnNEZi9T?=
 =?utf-8?B?ZlBmSWxoUkFGaER4T3NlNEIzdW0rd21nZXJqVUpSOXJTbXo3d3RDTU0wVlBV?=
 =?utf-8?B?ZzgwbTVXMExkN1p3dDNLamc4NzRRWDlYNTUwaXE2RFdsdEt1cnVsNnhiY0hz?=
 =?utf-8?B?UzRlUG5KZytVVmw2ajhVTGVoejU1Q3JMY0ZFblIzdS80TWpsQVEvUGdUMU4v?=
 =?utf-8?B?VldienZmMDhMZW83V0R6VFR4dGNSNzZ5aVhNUXczRnNoaDI0VTJZYm42SFhF?=
 =?utf-8?B?MEVYRDUrakVqQ3ZUbGFpMGtzOERYdnF5aXRZeDdFVGNMWml6NVFCUmxnbGtk?=
 =?utf-8?B?aU1hWVZqMU1ISGxSS3QyRzU2Q1QrYisyaTc3MGF4NGZVd1ljRVZEWlB6Zkdu?=
 =?utf-8?B?L21VVFJkM2dwQ0pkNzdZeERLWG9GOWJtaTV4c0E5RzZ3QUoweTF1Y1NmcnJ1?=
 =?utf-8?B?VDBmVHkvZ3RlUTBXYWxBUVNzcjlrWmQ1OU9kanF3NTQzUGN5MGVZN0V0cW1F?=
 =?utf-8?B?cWhnQk9JenFWNG9vRWMrcUc4STN1YjBDMHBKaDZpaG96eGNXR2RtTFFLOUdr?=
 =?utf-8?B?V0lhWVRiTVdxcE50eWhCWjFoT1RZbFp5UHN6Y05rOUdFSmVaTXRNQllXSlRa?=
 =?utf-8?B?ZHVBMXF6dGJrUExPU1JldWhqcEpnZFlaclZndFhJQnZIQXJXQnZwalhSeHE1?=
 =?utf-8?B?ejRhUk5SYVU1S3JQOHVqa1k4WUFKZ3dlZHhKZE1UTHhsdUlsaFZCalowc3dW?=
 =?utf-8?B?V05aVTQ3ekdLM1VkQzU0NU1ybGY0eDlNenJrbC9MZTM4bHpTOWk3SUlzTndq?=
 =?utf-8?B?dzFPeHRyNHFqNmdsWTNMVkRtSW1NQkpZL2htcml6bFpIQnA1SVBGWHl5eU1U?=
 =?utf-8?B?ZHl2VVRNaDBTNlliRVNJaWN2NUpYOUZLekV0WXNkZkI1VlpPdWd4N0ZUeHNv?=
 =?utf-8?B?dXBkaEJmSmd3TytEV2tFSlU3WVlLSE1uMnFwZ2M4SjloRHAzaWNkT2dBMm92?=
 =?utf-8?B?OGM4ZkoySmRBKzB6WHZYYXkvQU5NaTJlREZsU3JUS1phSXZNUGtwMWJHV0w2?=
 =?utf-8?B?eTdGVFFnaUgwNVdhUjBaeXRxZ1F3c2RQajdScVNCZ0xvSWVLMUFqN0RudHZT?=
 =?utf-8?B?M2hoYW1hWjhKd3p0Rk5IeXk5cVB6YnRrWnJ6WnlVSEFmb2NNUndVTC9Kb2Zh?=
 =?utf-8?B?eVc5RG9qbFNGK0Y5VCtHUUNRZEJkUk54d2lUUlJtMEUzS2d4WjBrZlVwdS85?=
 =?utf-8?B?YkcycHpDWmcrYkR5dEhMb0VYYkQ3UVN4TVYwYlZCRTZZdmIxa09TTWF2T0hn?=
 =?utf-8?B?WEtoZkJvMU8yTGdyUjFUK1VWOERGSVBiRnhsbUd4Tit3ZXNOMC85Y1FPZTFt?=
 =?utf-8?B?VlhxbmJTeS95MFh6VzE4UWNDQ2ZBdmgraXd0d1J0bTJIM2g2S0tTcmNLQkpi?=
 =?utf-8?B?UWxUUUhVb1RiTitBaWhOSkZ3TWdIcXVvTDBJNTdveWVPZHF1M1Y2U0YwdEdy?=
 =?utf-8?B?c01kbWhLYVFxTnJqY0syR21MRXJ4dDczemRpcW9xT2Z2NGFWTnQ2L2NzUHp5?=
 =?utf-8?Q?2E1t7wp4LkjKsltLkuTv2qc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0940c8b5-5449-48f9-1e24-08d9f0765186
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 11:28:41.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTdkAE/OtR6jlqTPbhyNLkRrRoMYK4JruGX8OOnN0j9G2WNUiIvzNxHjrCzren2xI335sZt9fwtTjIGkOyYB8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6721
X-OriginatorOrg: citrix.com

After the removal of PVHv1 it's no longer supported to create a domain
using hardware virtualization extensions and without a local APIC:
PVHv2 mandates domains to always have a LAPIC. Remove some stale code
in VMCS construction and related helpers that catered for that
use-case.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c | 14 --------------
 xen/arch/x86/hvm/vmx/vmx.c  |  4 ++--
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 7ab15e07a0..9eda8a5f0f 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1123,20 +1123,6 @@ static int construct_vmcs(struct vcpu *v)
     /* Do not enable Monitor Trap Flag unless start single step debug */
     v->arch.hvm.vmx.exec_control &= ~CPU_BASED_MONITOR_TRAP_FLAG;
 
-    if ( !has_vlapic(d) )
-    {
-        /* Disable virtual apics, TPR */
-        v->arch.hvm.vmx.secondary_exec_control &=
-            ~(SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES
-              | SECONDARY_EXEC_APIC_REGISTER_VIRT
-              | SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY);
-        v->arch.hvm.vmx.exec_control &= ~CPU_BASED_TPR_SHADOW;
-
-        /* In turn, disable posted interrupts. */
-        __vmwrite(PIN_BASED_VM_EXEC_CONTROL,
-                  vmx_pin_based_exec_control & ~PIN_BASED_POSTED_INTERRUPT);
-    }
-
     vmx_update_cpu_exec_control(v);
 
     __vmwrite(VM_EXIT_CONTROLS, vmexit_ctl);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 36c8a12cfe..0f98fb4f29 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -419,7 +419,7 @@ static void domain_creation_finished(struct domain *d)
     gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
     bool ipat;
 
-    if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, INVALID_MFN) )
+    if ( mfn_eq(apic_access_mfn, INVALID_MFN) )
         return;
 
     ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
@@ -3317,7 +3317,7 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 {
     paddr_t virt_page_ma, apic_page_ma;
 
-    if ( !has_vlapic(v->domain) || mfn_eq(apic_access_mfn, INVALID_MFN) )
+    if ( mfn_eq(apic_access_mfn, INVALID_MFN) )
         return;
 
     ASSERT(cpu_has_vmx_virtualize_apic_accesses);
-- 
2.34.1


