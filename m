Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D47C345B88
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100563.191702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdq0-0007xt-D9; Tue, 23 Mar 2021 10:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100563.191702; Tue, 23 Mar 2021 10:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdq0-0007xL-8B; Tue, 23 Mar 2021 10:00:36 +0000
Received: by outflank-mailman (input) for mailman id 100563;
 Tue, 23 Mar 2021 10:00:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdpy-0007wL-A9
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bdd0198-a958-4140-a55c-e50105debb1b;
 Tue, 23 Mar 2021 10:00:33 +0000 (UTC)
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
X-Inumbo-ID: 2bdd0198-a958-4140-a55c-e50105debb1b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vpl6upBzDqDR+RHogUqp/zpQiubhyzHN4/b5D/chUUc=;
  b=Fcss3hUDcfiBAnLv4UZdbsd650ayINOhhvCJ1QMQwxzM0awVkkhzdH2D
   gyORReG+24ajaGxJ71tqWU3Re8j1eO2bk8fwDLrXNhFOxynG7bBb6Sb4K
   EPEehMbwPBW40c0KzG1/WgVfxQ6t1nvKX7ZZHlcox4LvcVQyLE/6xX/pR
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IDoYHbPfk+3NUUXbcC+DDb5wuu2Qc3Zqf3OApX89jAq2oXaNjYmUe4eUXjw1ikCJ1FIpGUeaLG
 bCuh/w94tkTesinyQxCL6DUNuA/ul10ZL3x7Ew4ve/EWKUzz1yoWM67dmTj9+bHhpAYqxgR9UU
 OraKGcy173SVJckCZGdurYsy4rpz6K/jvcb5hRMbO6vUhPonlOI/ewxhO/AbsosSXpSbi8HYuD
 Fg+56QqJuWh9PrWCoG3sQSOWHFGuxYoov9mnIOUph0gTwBYHtmZbUEszfp5tj2XuTo3d2i2HGb
 kGg=
X-SBRS: 5.2
X-MesageID: 40261192
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SWP1k6GqYzC/EiTxpLqFbZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQacjHJ
 2H6cZd4xamc3IbbsO0b0N1I9TrjdvNiZ7gfFo6FwcqgTP+8A+AxZzbN1yj3hkYWy5S2rtKyw
 b4uiHw+6nLiYDc9jbyzGnWhq4m+ufJ6twGP8CUj9hQFzOEsHfSWK1Ee5mv+A84u/uu7lFCqq
 i9nz4FM95o433cOkGZyCGdojXI6zol53/8xVLwuxKKyqaYNVFKefZpvo5XfgDU7EAtprhHod
 h29lmUqoZNClf4lDn9juK4Ji1CrFa+onYpjIco/htieLYZAYUhyLA3zQd+FZcNGz/C84Y3EO
 ViJ9G03ocpTXqqK1/epWVh29qqQzAaGQqHWFELvoiv3yFRh20R9TpV+OUv2lM7sL4tQZhN4O
 rJdoxuibF1V8cTKYZwHv0IT8ebAnHEKCi8f166EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5YnXRaQTOvNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEVlde6qfl3OLybZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/vkhXVajpd/KN53KuuTXfO27HsuuLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmzzlKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9bKLPjmaWrmHmu8Q/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+3ebOBllTYfzHB
 REr1p6vYK7RqbgixwKOpaCCCa3nnETrHWFQ9M3gauY//rofZs+E9IBQ6x+FQLCEjRvggZ0oG
 J/aAsJL3WvVQ/GuOGAttg5Fevff95zjEOAOshPs0/Ssk2auIUSXHcBZiWvVsSWmA4qYDJRij
 RKgugiqYvFvQzqBXo0gew+PlEJTGiMGrpJAD6IY5hulqnxdBt9SnqLgjKmmwg+E1CahHk6ty
 jEF2m5aPvLCl1StjRj3qHm/EhdW0+dc0hzA0oK+rFVJCDjgDJewOWLbq283y+tcVME2PgaKy
 yASyAVOBlSy9e+0wO1lD6OGW49/IgnOvXQAd0YAvfu80LoDLfNubANHvdS8pogCcvntfUTV/
 mDPyCSNzH1BooSqnqoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KYIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfNONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4bQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyks31gItqJkWAoQfqUG
 PvixF1zrPgXyGZ06QdBL91CWNKaFIk4HAKxpLJS6TgTCGrffpE5ly0LzuUd6JcUrGMHfE1og
 xh69+F28+ReCyQ4nGcgRJLZoZP+X2gW8W8HUalHvNJ6cWzPRC0uZSRifTDxQvfeH+ccEQXhY
 pMaEwWYIBis1AZ/fIK+xn3bLf2rEIjm0ZZ+hd9mDfWq9Gb3Fs=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40261192"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7zdB4NqA8L41RGdLAD4B+PNrGJADxzZh/zsFBJXZKr8E44oTQhdlHvKmnLQr9adPid3Zw/IxlzJZ82zk/Oo4XYj4dE9oqpeZjAFMAhySGEukXRgtA7g8VitHGZc+usKMOi8ydju4Tnh2x8nbiEBjINMCZbIMgH80bhzHbLl9gt38SbLFmayGnrYSgKcX8NgkWOGsElyEkiOxZeGsse1rx3CVQPLm/Om29JvfFhVBPk/6lxLOqwukKMJF9OFI68UYOWFgXIFfTw7llmpMi+33kcYMECD18IPnX2pVjDOTBxEryx7fKi9cFkUOk5wmroyalinwJUSUKWcNQF882HKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFZSf71R5KScaIgtNwyj78uSfTAzOxhx/KlkN+/VBBc=;
 b=gZJCjz8wbO7uktIuvMdl5R/XfiCkl50JtJBm2YSWJFsApu4rMwgWdpmx08JY5vVmsH0BGJFMIi6Ky2T+VWFose22DZpUcteYva572apSq8Jk4no7+AXeezlCCEF7eincXvJuMaTrBdzZeUFHPOBpzx4ddy/KX9IGYfLWpfujGCUjAs1eaXs2RCTO54uIWJZ4i/baq8KGzfD6KvZ7SrY4jBPqH3n30ORsqWxCDm542uXkMihoCiVvsTtQ5HwqevaVeeNP2NxyDPow3bpbFZW/DzHdFj7pJJ5zWiC+x7BDc8ftcXZ8BQ+mjrfWIp39YLcEMSx3uxzmocdFzk5LVci22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFZSf71R5KScaIgtNwyj78uSfTAzOxhx/KlkN+/VBBc=;
 b=HU6a4GO0B4imaIJfFK54+j9ewp1POdeU5Ve6MvvEWCaDXO+yjSK142ViJcGWQ/amekhLK7ampCRienl84Cjrrv4d+HMwTnFjzY+lls3cc/ZGAMWoF8l35Kh+yiuUhpAcvBHyg5NKlijtyNekKeuvHeTQaLExwstvrjkNIiybvmE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 09/21] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Tue, 23 Mar 2021 10:58:37 +0100
Message-ID: <20210323095849.37858-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b29899e-8ca4-477c-bc45-08d8ede27d72
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4969E0E18757E89FD2438AF48F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uHAtSnK0L/ffs6sgBLd288LfeYR5YpQ/OjUzq5Obw5JqYVgYB1MsAnryox2pSXKEA7T+fZ2AH1+Qxgtmv3kfCXUOE9jLPqAHBz1vtlitqxftPmsTP85YtzoG2ESoAXuDsIX2qPFat5yET5qkiNCZGPmnFR5eWbsomsWI2bHIvdQD7UFAGNliBa3y60Wzy49f9hrkJh6Et9iuhJGv4PrGdo4QUWH4knxDScIm8W/s7BV1kVhafRAb4/pjtteGoZ/yty63COX4S/GfZJg9RL9r8/Uu6cH3mHI2Nblp3Xik7Ikcpb/BPRhvb/fiaszbks3rMDxKQ1ZzIK1j6iDeA4CtU3MlbPE6eQHZlk+tBqbxN1LCpLxVGL3MZjkAD9RZc8T+ym6rq4RzJ/h/RiEk29I2evjmHFC526oNN/PIxksHL5rsm8mPDxiq0/MognCyuL4dnTM7GO4qqmciQsJhTjENRicwIW5HZE3YGOom5czGq0g2R/R1aLYEFST63UTKK29OnUduIDBslIh4bk0zCfIF5RcU4G5DqvYKZ+8SHo+7POAZauec61lmp4ONBmvgbNw4QXrxkhXqzee23X0yKBO6rYvGUcyDiE3UsesYL+8w5v3b40beW2nivencj2CPoh4IhTFibEF9S5JF2j9RUOrp195wUintmy7RWCZyZKanEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VG5PK0k3aTJuaU91Z2hiOE4xWHNLd1NnTFRaOFZPbExEZk5ZMEZYTzF0SmZi?=
 =?utf-8?B?NmYwLy9EN3lkWEVtUmdGb1RTOXNLWVFqWFBZcjdLVzJkdVhjbXg1YzNZUnk5?=
 =?utf-8?B?T1Q3OXJqRHk1YldaTzVzSW5oK2M3YnZVRUZ2Zjl3VFNkc2s1Tkh5cnpuR0NR?=
 =?utf-8?B?OWNDa3Zpc1NFVE80Q2FrNFpHUHdCb2JYTUlmazV3dWFiNFdjYnhwMFRmSDdp?=
 =?utf-8?B?eDdVeXdsdlF3YXZHTW1ZWWVkVERkamxoYVZKUG44QVlKbHM2b1NtVEtOalcv?=
 =?utf-8?B?RDF5M1NCRDVPTTU2dUxQcnZmdkh5Y28wWnRtcWZEeFVxWlk5akpSc09GUGEz?=
 =?utf-8?B?cndIdTV0VkJtbW1HZ3djQWJhdXBCaGZPUGhFUjhwQUplNStacWZxWkJ1azB4?=
 =?utf-8?B?UDZaTVVZWGZ3YWRoQi8zYTZKSHM2MmZaUTRWak12dkUvdzdKYjR0dCtqU2pa?=
 =?utf-8?B?S1Y1YnBSVUt1QzlmTFR0Y2V6WGpCc1QwQlFYTmpMWmwyV3N3MTJVOXdMbEVk?=
 =?utf-8?B?NXFIU3FZVGlTckF3K2xkWm85eGI3ekZKQmE3VVJDeHl5bU8rbXY0N0podmFB?=
 =?utf-8?B?U2g1SVRuc2F5aS9sWHVGcEdYMHRweFpxSlMwcXFsWmdiZGtHamhlTEUyeVVF?=
 =?utf-8?B?ejJNWEFaV2JZSjgvSVZURWorVElHanAwRU1PYUVucUdzRTVCZ0RQcURPeUta?=
 =?utf-8?B?SkJrZS9mQUlVSXNSYm9IK05WRkdydkMxbENZUUUzM0lrVmdiNEFuOHdyb3Z4?=
 =?utf-8?B?YjBjckg4T09lcWV2eVdxOWFmS1VVQXAvMmdtU0JNck0rU1BFTnNmUnZCR0lw?=
 =?utf-8?B?U3BjL1FsczRWV1I0ZVg4OXZocWZLTWhPbEppV0VCQ2VEeS9jLy9XcU8zOTFu?=
 =?utf-8?B?ZmJmL2xBN0lXNWhJZ0tKSU5CakViR0NCZG1Bd3NtbVU3ZUI1RVJWWGNXRzFE?=
 =?utf-8?B?OWRhK3FpaGw3S2Z4UUZHekxTWUdjNDhsMXpIMnA1Z24ydkM0VXJMeGg2a0hX?=
 =?utf-8?B?MW5zaW54b0UrRDhyVEdCVitpZ2V4SnRWVjRMZ0dpNHQwTlBJMnlLakQrbFBX?=
 =?utf-8?B?SHNvNWg1ODJGT3M3bmdlbXU5R1NqNERyS3JtYmhMdXJVR3BqWmlVRmJqemJv?=
 =?utf-8?B?VXhhdVdXbFRIaGlNMzRKWi92R2hybFhsMTdXWGZKMWRGZ2kwcDRPMHNEbHht?=
 =?utf-8?B?R2JLRnlEeDhrc0tLUDYrM3lMdmhUQzFiQU95RkR3NDBWWEZXMmdHNFduL24z?=
 =?utf-8?B?dWRmMjAzcVRkV2FNV2RxdzFlUVk4S3IrSktNSFhadnlFVFlEZU9admlDNXpM?=
 =?utf-8?B?VWd2WmdETTZNOWQ4dDB3Rkt6eHlITi9NWkJFeUVhd2NoaFNNYTlFV1ZaZWI1?=
 =?utf-8?B?b0o5cUNreEN3ODdWU0h6Uk1YSFpYNmZBUWR0NHZRTWQ5bFRjaHVianE0RlpD?=
 =?utf-8?B?SWFPcDk0aEluMWZQR0lnQnFIeFZ6R2NLQzk5bzhKOFZBTEp2ZHVUcVhFMGMy?=
 =?utf-8?B?NGlmbXc0NFQ2V0lkRXlxUXREei9WaVU0bjNFeVRBZEx1VDdRRVZmQzFpMzV2?=
 =?utf-8?B?MEtsQ3ZMRnR4WEVNQlFxK3I4a0E2ZnVTSkxYUUo4dk9iczRnUDZjaVptNG1q?=
 =?utf-8?B?bkg2c3J0V3JoNVk4RXNxVVhKaHhZcGRDME9jUWxFa2VSTGRsNUlocjA3ek80?=
 =?utf-8?B?Sk5OSzNmMys0cU05ZE93N3BKS2ZETGtldUJOTCsrMEUvSUZuOEFFenliWGsv?=
 =?utf-8?Q?vQ2ELLR2aNWUuAf2kwIvED/0mKJPF2npn0ZOdgg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b29899e-8ca4-477c-bc45-08d8ede27d72
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:29.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZwluCNIJrDE/Cc4KWa/NXWw6F5YRx73wGxQqaKzX1dQA5k0gSX6iDTHlVA06vhk2RChSJYzJz3aIxAVwg4CMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 42 +++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d82c99b2f0d..983e4c11d93 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2608,6 +2608,9 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 48351f1c4c6..a1e1bf10d5c 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -883,3 +883,45 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
     errno = 0;
     return 0;
 }
+
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    unsigned int nr_leaves, nr_msrs, i;
+    xen_cpuid_leaf_t *leaves;
+    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
+
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        return -1;
+    }
+
+    leaves = calloc(nr_leaves, sizeof(*leaves));
+    if ( !leaves )
+    {
+        PERROR("Failed to allocate resources");
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves, NULL, 0);
+    if ( rc )
+        goto out;
+
+    for ( i = 0; i < nr_leaves; i++ )
+        if ( leaves[i].leaf == leaf && leaves[i].subleaf == subleaf )
+        {
+            *out = leaves[i];
+            goto out;
+        }
+
+    /* Unable to find a matching leaf. */
+    errno = ENOENT;
+    rc = -1;
+
+ out:
+    free(leaves);
+    return rc;
+}
-- 
2.30.1


