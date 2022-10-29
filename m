Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA8612339
	for <lists+xen-devel@lfdr.de>; Sat, 29 Oct 2022 15:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432359.685136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oolfv-0005Qp-2w; Sat, 29 Oct 2022 13:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432359.685136; Sat, 29 Oct 2022 13:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oolfu-0005On-WD; Sat, 29 Oct 2022 13:14:59 +0000
Received: by outflank-mailman (input) for mailman id 432359;
 Sat, 29 Oct 2022 13:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErAt=26=citrix.com=prvs=294fe0d1b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oolft-0005Oh-1p
 for xen-devel@lists.xenproject.org; Sat, 29 Oct 2022 13:14:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9df157-578b-11ed-8fd0-01056ac49cbb;
 Sat, 29 Oct 2022 15:14:54 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Oct 2022 09:14:51 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5431.namprd03.prod.outlook.com (2603:10b6:5:2cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 29 Oct
 2022 13:14:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5769.016; Sat, 29 Oct 2022
 13:14:49 +0000
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
X-Inumbo-ID: ac9df157-578b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667049294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=aG2oexdWJ0iMZ06D7TEXxiaqlk7olnQakBtV25FsFP4=;
  b=MSUBHLt6RxcM/ca7AdppTX0JCGZ7kmj7AsV9gnhRg7kQTRjkzQ8YQkX+
   V92DQhCR1IxJA7NVgRObrLQfUlGuzLqzFHJITduNYYIDAIONi6eX+g1Qs
   02FK3N6g/Mve4wArLqy7T3jEoaXTF4kaCv+Plz7r1SoCFUdS8057EKVf6
   U=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 86293237
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CcO9uK68fM6JkUxgFqngUwxRtOPGchMFZxGqfqrLsTDasY5as4F+v
 jcZDziDM6rbZTTzKt9zbYy/9BlUuJXQn99iG1Y6/ng0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 PYUcA0kfze/jOubnpK7SvllvNgvM5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOmF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efw3mqA9hJS9VU8NY1hx6XwjACMCYvenK6uOKAm2KGWulQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8aIv7YYWtsADf9awZdNffSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:umyCN6n5LZ9oFSTgD28lI7xqkKDpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhR4tKPTOWw1dASbsP0WKM+UyFJ8STzI5gPO
 JbAtFD4b7LfCdHZLjBkW6F+r8bqbHokZxAx92ut0uFJTsaF52IhD0JbzpzfHcGJzWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7Z86MK2K40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.95,224,1661832000"; 
   d="scan'208";a="86293237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHr/1e8bNdikWduTF9nv2uoFGXT2MHr+FFL8STurU1uaHXroTUs067EaBsIW+e/3kDb13SBW3A4yPZgIVipZQEIwg7TeNxTkXe65KQ/GK5IdbQ1fPIwSW8cevYjfOsVNZ3+806d6kICMxSMqVskIF3z0QahGGXnjrAl30QE84yA71SQn8eazTu6l+fopzUTR5BwHrXgxDiODOmZrXR0EY+lRwAsCN6DsJ8w+MK0WLIGi4UQwSagGTmKuTj1fFlhnc9x0ZUOevhyNuEakzaDFaIeNxzSB+oSAM0/Cklj3GQRvfPFonn/QM8ROVFLCNaRR7GcNT43Phv5gJMgi5wJ9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ie04u2QSa69liLoH9iihQcrvkfTfzmRv3YCe1aW06o=;
 b=OR3feI5XO5ZtAf3lDz90i5oIeaLK61Cv79mohsc5IlJg8Kx98ub6dbpUnc1sN+CBWWLgt9EsWhWy75JSxbeaeYX24nQ5C89LxAxvKkdZYO18QTUdTyvSSVqMBPoUpc9VMpc/gXcC1L7B2WL9oKNOMDBnIHbNMIZHHkkqHxCqlKUa+F870HZNX4y3cZc/fDe63vIVHsFO8PmECAEVbQY7rr4KZWJkXeJs3jfB3eLLB939RdpBEaicT0IE6lvXR/bHsq2zQuR2Cq7uqHjf4Ye9xdEZMb7WpzmymvcB/VfIIq3C5bUvlGxGgo6NnBonGHEseeD9mDMvDrwHn8HGvsnP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ie04u2QSa69liLoH9iihQcrvkfTfzmRv3YCe1aW06o=;
 b=kzJlQShpfu2o5X6u39Eek4zgNC85gkD+PnC2ELr7gj42giwWSnTyn73dr67DgyziflekzfxPMwN9FnvByx2TKnWPRDecMTx2STB6myfIG74qdzvCav+flXvHucIhCcw0Ki0EoMyWckdwB+7e6Q1Qb/oAM8Ne+SIsZdPnBFTxifU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU context switch
Date: Sat, 29 Oct 2022 15:12:58 +0200
Message-Id: <20221029131258.95811-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028114913.88921-3-roger.pau@citrix.com>
References: <20221028114913.88921-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: d442fe30-a245-49b4-15c8-08dab9af8ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JfKGlGA5Dc6+QaK5hR3SUM1kQreObZLX1xZ+p11PRwR1CpSqMa4mjzYRVF1CNMzFf5coe0klaomf9AT8uB3cB12eFjtKwNzSNOvygN+EyrQ+uhiwK+/WJHkT98ebf3JkUKycjcMxHRtrelwQ2D9Tql6v9ouggYiahj7XKsTBhCFe+E3wuperP/5h8Uq2q+v+VwBfSRPjamjkz756HyyxBhlxVt0HmD9twa4b+Y0Lue2pkEk5eXEB8730SBWOpA/Wodget+Qx77Et9bMIZ9OX6sE1PMVfsU8HeCXK8oWXTkPxzxqKNHItUDEvW6S7+P11lMFSf093Wj0MMh8sEuBiugFLD5Guc6cwsGeJso9DtwsTQY3iUWGZ5sZKak/ucLByW9Db0qPRrYodv8h5b3PsPOyL59mWrNjI5xiNxpfo6fLbEQPjbrExpXpkpD7UgE7YPjsQpAXjr6kQE5kso5Exhfir5wTtvt90O0hhoMK1eajdQjy47wUYGnpPmg8Q0GmdKx9ktCPq8Hoz9df+jJurPopjpl1I2ktAuo1+D2D5igzRAClUCEGQ4urjoPSNmJDjGyRxiq2mk0f+rDb7jjRd5xGvLlsEXlIZJkgAGFszKJ/D9Se0Y0MUyp+dClYEu0G44Kf0p5xK8RNxFKbWIYCzxuW6UDMokkRwMsGclL2uAy52NUAhpbGmI71Lozi/PyYmp2080MVjr+flR67oLlxCCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(6506007)(4326008)(8676002)(82960400001)(316002)(54906003)(6916009)(86362001)(478600001)(36756003)(66946007)(66476007)(66556008)(6666004)(83380400001)(5660300002)(1076003)(2616005)(186003)(8936002)(2906002)(6486002)(41300700001)(26005)(38100700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXVwSVNpcmZZUEVwUGFCU3RrbWIzVi85SHNEMzZBeWJWOVJvQisvLyt2akQ0?=
 =?utf-8?B?U1lCdHlHcHpDTzVrdW1qOElEdERxdlQ2cG1WWW9GaHB2MUp3VEVFc1ZYOEww?=
 =?utf-8?B?TTZ1RXlncGhzTk9VVHZvT0tEQU5iS3FsenAxa3kyYjJoWE1HcFVMYkxzVVIw?=
 =?utf-8?B?M2s5QUd2TnZZa0NsalB5WDlZWHZnaCtmNU51ekx2dUhlcGFBUVRVKzRkdnh5?=
 =?utf-8?B?QUJiV1lxRVh0T0lQNUNxRS9ZQy9VQzVRWUZ4RGZmT3E3dFRzaVJIT3IzNEhX?=
 =?utf-8?B?K25BTXVGR2xmdEVXYkt3NkJmU1hkRUVla296dnF0ak41MTJWS2pMQ1ZsaXZm?=
 =?utf-8?B?TDV1RG0wdWhvOTE3WlEybXIwNGJCU1dNM2pHRkRoWlJOc0xDQmlVVVBlQ2Fx?=
 =?utf-8?B?aDh4ODV1RjhnSXQxYUxoODlVelB1ZlR2ZlVBWDBNTzBvVnduM3NGVUd0Yk5s?=
 =?utf-8?B?eS9adFhaUjFFaWF4bGI5ZjYvWDhVNk1hVGJjV3Ixdmt5Ymo1a3FzSkhwUDJ6?=
 =?utf-8?B?eW9qeHUxb0p1ZmduSnMrWDRWT1hReWJYeDFLWjczVnNjV0tjVnhPbSttTEhr?=
 =?utf-8?B?aUllb3dpMWN4V2hYaHRvcFNOL1ZEZDFwa1h2b2hGaE0zcUFDbk5HTWtJZ2VN?=
 =?utf-8?B?ODIrT3czTmZudTdPK0FGcmFTVndTV2VLQ0dnbmpweDFiNDZ6RG02QW5DM1dw?=
 =?utf-8?B?aVVEeHYyNkQyNDAwcmROZVVkblZDbU92Y3JENWV6Q3AydFpleFJMR0RjZWpv?=
 =?utf-8?B?aDhzNGcxMFhETzJIWS9PM1l3bE00OHdkUzRLZ3FLUkdqWXpscys5SmVaRUgv?=
 =?utf-8?B?bHJLSjVKcDNvdlNheEhLTkVxZ3hPT2F3dllBRkp3YVlRZlhWalJUQzlxMVZQ?=
 =?utf-8?B?UDJrYVlZTEFZVi8ya1Y5R09QMXFZSmxvQWVQNjdxeC9mNDRya2tjNHg0bDdk?=
 =?utf-8?B?R29yejBoMVQ5UGF4WUNtVHVsWFN3ZlAzTHNGenZSbldnK2VpbDMrNncxMnBR?=
 =?utf-8?B?L2NGQ2d6WDZ0a1E0VmhQZDM1ZzMyeGpoWit3Tm5QNWswc2xyL2hEMUxIRGV6?=
 =?utf-8?B?NUtVa25DVnJRVUwwL1pPMnlpNHVxWXdiY2ZZdHV2dWhFT0hObDJFUFRQSXJM?=
 =?utf-8?B?eXFjSnZMYkNOOXhUSVUrSkdQeDFhNG83aTkwV0VSdld1cmU4ZG53Zys0LzBp?=
 =?utf-8?B?dUR0T2dtVEVXdXhtVEJlZWlEalNyWjVjWjhoRVJDRGZyWndZOWk2WVAzQldT?=
 =?utf-8?B?Q29Fdi9xcUEyL3pEakM2SUVrMjFkWnZCaXUvekc4Rnppa3ZzQzlJMlBOQjQ1?=
 =?utf-8?B?Q3VHdkV4cDAzQ0NlakVtTnNHTzRLZWd4a1A2dGcwb3Rka2MyWXZ0Z2pHME1B?=
 =?utf-8?B?ams3WFJWazN5OVVzdlJGb1RjWUg2bjFRclI4eEtIU1duaWpJQkU0Y2EzcVFH?=
 =?utf-8?B?RzMzV0ZUa2J0YS92Z0FrOTNWNk5FTmJyTmZiN0tmUXZnK0ZpWlFPbUZVcGdW?=
 =?utf-8?B?SjA3eThwazhTbWxOQnlHN2M5dGFmb2R2dVNLTnBnSmhKc0VNaCs1azEwTTZt?=
 =?utf-8?B?VElRVXVMMWkzMXp2UmF1MzlNVHBBaVJjQnVLd0ZVMVNTZy9ubmM0ZGVMYjlB?=
 =?utf-8?B?Qkw2ZzRyQ2g2WEFxODdVOEtSNWFWNCtlNGNmdEFLdnZPMDZ1MnE5elpuU1l6?=
 =?utf-8?B?bHFML0hvTkJxWGRhMjhEeVpYdkVwa1NmWU5iUW92dzJzM1VhaHdObEpZMjYv?=
 =?utf-8?B?OUNFSElqa3ZkTDdwYWlSR0V6SWUySjdjRlFDelNTaFQwemZkNG5oSW9uVnlo?=
 =?utf-8?B?ellpMzRWbXQvdjIrUDg2Mmh4N2tSRFMvbW4xSjRBM0hvbzdYb2llT0Z3NEt6?=
 =?utf-8?B?WWNGck85VFRBdjZ4RVVjT3ZFL0dtanA0cStROUIvY0xGdlNkWG5wbzJKalMr?=
 =?utf-8?B?WXk4ZUNIdnh0ZDB1TE5hcnF0VFZwSWpSNEdsK0tROUhYdjdMaWRoamw5OTh2?=
 =?utf-8?B?RVpLbGRnZmszaWx0cy9hZFJqdFNHSTVGN1dCNE9BV2hQY1ZKbDBWTThhUzg3?=
 =?utf-8?B?bk1UbmQ4RllndUszU0M3Y1NHc3JWVUxCVU0xN3dNSkNxMDhlVUtBNFZDT2U5?=
 =?utf-8?Q?GT4nxQIEbVSP7F1mtFoahQVLn?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d442fe30-a245-49b4-15c8-08dab9af8ea1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 13:14:49.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6Xv3PNpNCjK3hoqKzR7tl9Z41b1ycfz27og698djmE+Id+oKNkgKeUFCRffMG4wTqyHShnItWxTr7ACZ6T8Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5431

The current logic for AMD SSBD context switches it on every
vm{entry,exit} if the Xen and guest selections don't match.  This is
expensive when not using SPEC_CTRL, and hence should be avoided as
much as possible.

When SSBD is not being set from SPEC_CTRL on AMD don't context switch
at vm{entry,exit} and instead only context switch SSBD when switching
vCPUs.  This has the side effect of running Xen code with the guest
selection of SSBD, the documentation is updated to note this behavior.
Also note that then when `ssbd` is selected on the command line guest
SSBD selection will not have an effect, and the hypervisor will run
with SSBD unconditionally enabled when not using SPEC_CTRL itself.

This fixes an issue with running C code in a GIF=0 region, that's
problematic when using UBSAN or other instrumentation techniques.

As a result of no longer running the code to set SSBD in a GIF=0
region the locking of amd_set_legacy_ssbd() can be done using normal
spinlocks, and some more checks can be added to assure it works as
intended.

Finally it's also worth noticing that since the guest SSBD selection
is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
propagate the value to the hardware as part of handling the wrmsr.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix calling set_reg unconditionally.

Changes since v1:
 - Just check virt_spec_ctrl value != 0 on context switch.
 - Remove stray asm newline.
 - Use val in svm_set_reg().
 - Fix style in amd.c.
 - Do not clear ssbd
---
 docs/misc/xen-command-line.pandoc | 10 +++---
 xen/arch/x86/cpu/amd.c            | 55 +++++++++++++++++--------------
 xen/arch/x86/hvm/svm/entry.S      |  6 ----
 xen/arch/x86/hvm/svm/svm.c        | 49 ++++++++++++---------------
 xen/arch/x86/include/asm/amd.h    |  2 +-
 xen/arch/x86/msr.c                |  8 +++++
 6 files changed, 66 insertions(+), 64 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0fbdcb574f..424b12cfb2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2372,10 +2372,12 @@ By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
 when hardware hints recommend using it as a blanket setting.
 
 On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
-option can be used to force or prevent Xen using the feature itself.  On AMD
-hardware, this is a global option applied at boot, and not virtualised for
-guest use.  On Intel hardware, the feature is virtualised for guests,
-independently of Xen's choice of setting.
+option can be used to force or prevent Xen using the feature itself.  The
+feature is virtualised for guests, independently of Xen's choice of setting.
+On AMD hardware, disabling Xen SSBD usage on the command line (`ssbd=0` which
+is the default value) can lead to Xen running with the guest SSBD selection
+depending on hardware support, on the same hardware setting `ssbd=1` will
+result in SSBD always being enabled, regardless of guest choice.
 
 On hardware supporting PSFD (Predictive Store Forwarding Disable), the `psfd=`
 option can be used to force or prevent Xen using the feature itself.  By
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 98c52d0686..05d72c6501 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -742,7 +742,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 }
 
 static struct ssbd_ls_cfg {
-    bool locked;
+    spinlock_t lock;
     unsigned int count;
 } __cacheline_aligned *ssbd_ls_cfg;
 static unsigned int __ro_after_init ssbd_max_cores;
@@ -753,7 +753,7 @@ bool __init amd_setup_legacy_ssbd(void)
 	unsigned int i;
 
 	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
-	    boot_cpu_data.x86_num_siblings <= 1)
+	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
 	/*
@@ -776,46 +776,51 @@ bool __init amd_setup_legacy_ssbd(void)
 	if (!ssbd_ls_cfg)
 		return false;
 
-	if (opt_ssbd)
-		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
-			/* Set initial state, applies to any (hotplug) CPU. */
-			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+		spin_lock_init(&ssbd_ls_cfg[i].lock);
 
 	return true;
 }
 
-/*
- * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
- * that relies on exceptions as those are not expected to run in GIF==0
- * context.
- */
-void amd_set_legacy_ssbd(bool enable)
+static void core_set_legacy_ssbd(bool enable)
 {
 	const struct cpuinfo_x86 *c = &current_cpu_data;
 	struct ssbd_ls_cfg *status;
+	unsigned long flags;
 
 	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
-		set_legacy_ssbd(c, enable);
+		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
 
+	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
 	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
 	                      c->cpu_core_id];
 
-	/*
-	 * Open code a very simple spinlock: this function is used with GIF==0
-	 * and different IF values, so would trigger the checklock detector.
-	 * Instead of trying to workaround the detector, use a very simple lock
-	 * implementation: it's better to reduce the amount of code executed
-	 * with GIF==0.
-	 */
-	while (test_and_set_bool(status->locked))
-		cpu_relax();
+	spin_lock_irqsave(&status->lock, flags);
 	status->count += enable ? 1 : -1;
+	ASSERT(status->count <= c->x86_num_siblings);
 	if (enable ? status->count == 1 : !status->count)
-		set_legacy_ssbd(c, enable);
-	barrier();
-	write_atomic(&status->locked, false);
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&status->lock, flags);
+}
+
+void amd_set_ssbd(bool enable)
+{
+	if (opt_ssbd)
+		/*
+		 * Ignore attempts to turn off SSBD, it's hardcoded on the
+		 * command line.
+		 */
+		return;
+
+	if (cpu_has_virt_ssbd)
+		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
+	else if (amd_legacy_ssbd)
+		core_set_legacy_ssbd(enable);
+	else
+		ASSERT_UNREACHABLE();
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index a26589aa9a..981cd82e7c 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -59,9 +59,6 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
-        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -131,9 +128,6 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
-        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /*
          * STGI is executed unconditionally, and is sufficiently serialising
          * to safely resolve any Spectre-v1 concerns in the above logic.
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1aeaabcb13..b2f147c11b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
     /* Resume use of ISTs now that the host TR is reinstated. */
     enable_each_ist(idt_tables[cpu]);
+
+    /*
+     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
+     * is already cleared by svm_vmexit_spec_ctrl.
+     */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_ssbd(false);
+    }
 }
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
@@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    /* Load SSBD if set by the guest. */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_ssbd(true);
+    }
 }
 
 static void noreturn cf_check svm_do_resume(void)
@@ -2518,6 +2535,10 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         vmcb->spec_ctrl = val;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        amd_set_ssbd(val & SPEC_CTRL_SSBD);
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
@@ -3116,34 +3137,6 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
-/* Called with GIF=0. */
-void vmexit_virt_spec_ctrl(void)
-{
-    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
-
-    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
-/* Called with GIF=0. */
-void vmentry_virt_spec_ctrl(void)
-{
-    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
-
-    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 6a42f68542..81ed71710f 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -153,6 +153,6 @@ void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
 bool amd_setup_legacy_ssbd(void);
-void amd_set_legacy_ssbd(bool enable);
+void amd_set_ssbd(bool enable);
 
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 95416995a5..d15185cd48 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -697,7 +697,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
                 msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
         }
         else
+        {
             msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
+            if ( v == curr )
+                /*
+                 * Propagate the value to hardware, as it won't be context
+                 * switched on vmentry.
+                 */
+                goto set_reg;
+        }
         break;
 
     case MSR_AMD64_DE_CFG:
-- 
2.37.3


